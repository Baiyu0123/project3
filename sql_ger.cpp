#include<bits/stdc++.h>
using namespace std;
int main() {
	freopen("insert.sql","w",stdout);
	cout<<"DROP TABLE IF EXISTS test_table;\n";
	cout<<"CREATE TABLE test_table(\n";
	cout<<"id integer,\n";
	cout<<"x integer,\n";
	cout<<"y integer,\n";
	cout<<"s character(16)\n";
	cout<<");\n";
	for (int i=1;i<=1000000;i++) {
		cout<<"INSERT INTO test_table values(";
		cout<<i<<",";
		cout<<1ll*rand()%50<<",";
		cout<<1ll*rand()*rand()%998244353<<",";
		int x=0;string s="";
		for (int j=0;j<16;j++) {
			x=rand()%26;
			s+=(char)('a'+x);
		}
		cout<<"\'"<<s<<"\'";
		cout<<");\n";
	}
}
