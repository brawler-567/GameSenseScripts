import requests
from bs4 import BeautifulSoup
from time import sleep
from colorama import init
from colorama import Fore, Back, Style

class Parser:
    """Generic parser class for Yandex search results"""
    
    def __init__(self, search_query, filename):
        self.url = f'https://yandex.ru/search/?text=host%3Apastebin.com%20{search_query}&lr=10716&clid=2256866-5&win=404'
        self.filename = filename
    
    def get_html(self):
        """Fetch HTML content from URL"""
        try:
            headers = {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
            }
            result = requests.get(self.url, headers=headers, timeout=10)
            result.raise_for_status()
            return result.text
        except requests.RequestException as e:
            print(f'Server error: {e}')
            return False
        except ValueError as e:
            print(f'Value error: {e}')
            return False
    
    def parse_results(self):
        """Parse search results and save to file"""
        html = self.get_html()
        if not html:
            print(f'Failed to get HTML for {self.filename}')
            return False
        
        soup = BeautifulSoup(html, 'html.parser')
        # FIX: Use find_all instead of findAll
        news_list = soup.find_all('h2', class_='organic__title-wrapper typo typo_text_l typo_line_m')
        
        if news_list:
            with open(self.filename, 'w', encoding='utf-8') as f:
                f.write(str(news_list))
            return True
        else:
            print(f'No results found for {self.filename}')
            return False

# Specific parsers as functions
def steam():
    parser = Parser('SteamAccounts', 'steam_account.html')
    return parser.parse_results()

def mailru():
    parser = Parser('mail.ru%20account', 'mailru_account.html')
    return parser.parse_results()

def minecraftaccount():
    parser = Parser('minecraft%20account', 'minecraft_account.html')
    return parser.parse_results()

def phone_numbers():
    parser = Parser('nomber%20phone', 'phone_numbers.html')
    return parser.parse_results()

def yahooaccounts():
    parser = Parser('yahoo%20accounts', 'yahoo_account.html')
    return parser.parse_results()

def steamkey():
    parser = Parser('Steam%20Key', 'steam_key.html')
    return parser.parse_results()

def tokendiscord():
    parser = Parser('token%20discord', 'token_discord.html')
    return parser.parse_results()

def googleaccount():
    parser = Parser('%40gmail.com%20pass', 'google_account.html')
    return parser.parse_results()

def yandexaccount():
    parser = Parser('%40yandex.ru%20pass', 'yandex_account.html')
    return parser.parse_results()

def custom_search():
    print(Fore.LIGHTGREEN_EX + ' Enter one keyword: ', end='')
    keyword = input().strip().replace(' ', '%20')
    parser = Parser(keyword, 'Custom.html')
    return parser.parse_results()

def display_banner():
    """Display ASCII art banner"""
    print(Fore.RED)
    sleep(0.2)
    print("     █───████─█───█─████─███─███─███─████")
    sleep(0.2)
    print("     █───█──█─██─██─█──█─█────█──█───█──█")
    sleep(0.2)
    print("     █───█──█─█─█─█─████─███──█──███─████")
    sleep(0.2)
    print("     █───█──█─█───█─█──█───█──█──█───█─█")
    sleep(0.2)
    print("     ███─████─█───█─█──█─███──█──███─█─█")

def main_menu():
    """Display main menu and handle user input"""
    init(autoreset=True)
    
    display_banner()
    sleep(1.3)
    
    print(Fore.LIGHTGREEN_EX)
    print(" [1] List parsers, [2] Developer, [3] How it works?")
    print()
    choice = input(" Choose: ").strip()
    
    if choice == '1':
        print(Fore.RED + ' ------------------------------')
        print(Fore.LIGHTGREEN_EX + '  ▼ Here is what I can parse ▼')
        sleep(1)
        print()
        print('''  [1] Steam Accounts, [2] Steam Keys, [3] Tokens Discord,
  [4] Minecraft Accounts, [5] Google Accounts, [6] Yandex Accounts,
  [7] Yahoo Accounts, [8] Mail.ru Accounts, [9] Phone Numbers, [10] Custom''')
        print()
        
        parser_choice = input(" Choose: ").strip()
        
        parsers = {
            '1': steam,
            '2': steamkey,
            '3': tokendiscord,
            '4': minecraftaccount,
            '5': googleaccount,
            '6': yandexaccount,
            '7': yahooaccounts,
            '8': mailru,
            '9': phone_numbers,
            '10': custom_search
        }
        
        if parser_choice in parsers:
            if parser_choice == '10':
                custom_search()
            else:
                parsers[parser_choice]()
            
            print(Fore.RED + ' ------------------------------')
            print(Fore.GREEN + '   All Right! Check the HTML file.')
        
    elif choice == '2':
        print(Fore.RED + ' ------------------------------')
        print(Fore.LIGHTMAGENTA_EX + " by Lomaster")
        print(Fore.LIGHTGREEN_EX + " I'm NETSTALKER and Python developer")
        print(" Country - Russia")
        print(" Telegram - @Lomasterr")
        print(Fore.RED + ' ------------------------------')
    
    elif choice == '3':
        print(Fore.RED + ' ------------------------------')
        print(Fore.LIGHTGREEN_EX + "   This is Yandex dorks baby.")
        print(Fore.RED + ' ------------------------------')
    
    else:
        print(Fore.RED + " Invalid choice!")

if __name__ == "__main__":
    main_menu()
