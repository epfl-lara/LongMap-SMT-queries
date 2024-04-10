; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102906 () Bool)

(assert start!102906)

(declare-fun b!1236769 () Bool)

(declare-fun res!824751 () Bool)

(declare-fun e!700929 () Bool)

(assert (=> b!1236769 (=> (not res!824751) (not e!700929))))

(declare-datatypes ((List!27256 0))(
  ( (Nil!27253) (Cons!27252 (h!28461 (_ BitVec 64)) (t!40719 List!27256)) )
))
(declare-fun acc!846 () List!27256)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7318 (List!27256 (_ BitVec 64)) Bool)

(assert (=> b!1236769 (= res!824751 (contains!7318 acc!846 k!2925))))

(declare-fun b!1236770 () Bool)

(declare-fun res!824756 () Bool)

(assert (=> b!1236770 (=> (not res!824756) (not e!700929))))

(assert (=> b!1236770 (= res!824756 (not (contains!7318 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236771 () Bool)

(declare-fun res!824752 () Bool)

(assert (=> b!1236771 (=> (not res!824752) (not e!700929))))

(declare-fun noDuplicate!1915 (List!27256) Bool)

(assert (=> b!1236771 (= res!824752 (noDuplicate!1915 acc!846))))

(declare-fun b!1236772 () Bool)

(declare-fun res!824754 () Bool)

(assert (=> b!1236772 (=> (not res!824754) (not e!700929))))

(declare-datatypes ((array!79751 0))(
  ( (array!79752 (arr!38483 (Array (_ BitVec 32) (_ BitVec 64))) (size!39019 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79751)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79751 (_ BitVec 32) List!27256) Bool)

(assert (=> b!1236772 (= res!824754 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236773 () Bool)

(declare-fun lt!560880 () List!27256)

(declare-fun subseq!572 (List!27256 List!27256) Bool)

(assert (=> b!1236773 (= e!700929 (not (subseq!572 acc!846 lt!560880)))))

(declare-datatypes ((Unit!41030 0))(
  ( (Unit!41031) )
))
(declare-fun lt!560882 () Unit!41030)

(declare-fun subseqTail!59 (List!27256 List!27256) Unit!41030)

(assert (=> b!1236773 (= lt!560882 (subseqTail!59 lt!560880 lt!560880))))

(assert (=> b!1236773 (subseq!572 lt!560880 lt!560880)))

(declare-fun lt!560881 () Unit!41030)

(declare-fun lemmaListSubSeqRefl!0 (List!27256) Unit!41030)

(assert (=> b!1236773 (= lt!560881 (lemmaListSubSeqRefl!0 lt!560880))))

(assert (=> b!1236773 (= lt!560880 (Cons!27252 (select (arr!38483 a!3835) from!3213) acc!846))))

(declare-fun b!1236774 () Bool)

(declare-fun res!824758 () Bool)

(assert (=> b!1236774 (=> (not res!824758) (not e!700929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236774 (= res!824758 (validKeyInArray!0 (select (arr!38483 a!3835) from!3213)))))

(declare-fun b!1236775 () Bool)

(declare-fun res!824755 () Bool)

(assert (=> b!1236775 (=> (not res!824755) (not e!700929))))

(assert (=> b!1236775 (= res!824755 (not (contains!7318 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236776 () Bool)

(declare-fun res!824757 () Bool)

(assert (=> b!1236776 (=> (not res!824757) (not e!700929))))

(assert (=> b!1236776 (= res!824757 (not (= from!3213 (bvsub (size!39019 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!824753 () Bool)

(assert (=> start!102906 (=> (not res!824753) (not e!700929))))

(assert (=> start!102906 (= res!824753 (and (bvslt (size!39019 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39019 a!3835))))))

(assert (=> start!102906 e!700929))

(declare-fun array_inv!29331 (array!79751) Bool)

(assert (=> start!102906 (array_inv!29331 a!3835)))

(assert (=> start!102906 true))

(assert (= (and start!102906 res!824753) b!1236771))

(assert (= (and b!1236771 res!824752) b!1236770))

(assert (= (and b!1236770 res!824756) b!1236775))

(assert (= (and b!1236775 res!824755) b!1236772))

(assert (= (and b!1236772 res!824754) b!1236769))

(assert (= (and b!1236769 res!824751) b!1236776))

(assert (= (and b!1236776 res!824757) b!1236774))

(assert (= (and b!1236774 res!824758) b!1236773))

(declare-fun m!1140517 () Bool)

(assert (=> start!102906 m!1140517))

(declare-fun m!1140519 () Bool)

(assert (=> b!1236774 m!1140519))

(assert (=> b!1236774 m!1140519))

(declare-fun m!1140521 () Bool)

(assert (=> b!1236774 m!1140521))

(declare-fun m!1140523 () Bool)

(assert (=> b!1236769 m!1140523))

(declare-fun m!1140525 () Bool)

(assert (=> b!1236773 m!1140525))

(declare-fun m!1140527 () Bool)

(assert (=> b!1236773 m!1140527))

(declare-fun m!1140529 () Bool)

(assert (=> b!1236773 m!1140529))

(declare-fun m!1140531 () Bool)

(assert (=> b!1236773 m!1140531))

(assert (=> b!1236773 m!1140519))

(declare-fun m!1140533 () Bool)

(assert (=> b!1236771 m!1140533))

(declare-fun m!1140535 () Bool)

(assert (=> b!1236770 m!1140535))

(declare-fun m!1140537 () Bool)

(assert (=> b!1236775 m!1140537))

(declare-fun m!1140539 () Bool)

(assert (=> b!1236772 m!1140539))

(push 1)

(assert (not b!1236770))

(assert (not b!1236769))

(assert (not b!1236771))

(assert (not start!102906))

(assert (not b!1236774))

(assert (not b!1236775))

(assert (not b!1236772))

(assert (not b!1236773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135505 () Bool)

(declare-fun lt!560903 () Bool)

(declare-fun content!581 (List!27256) (Set (_ BitVec 64)))

(assert (=> d!135505 (= lt!560903 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!581 acc!846)))))

(declare-fun e!700962 () Bool)

(assert (=> d!135505 (= lt!560903 e!700962)))

(declare-fun res!824824 () Bool)

(assert (=> d!135505 (=> (not res!824824) (not e!700962))))

(assert (=> d!135505 (= res!824824 (is-Cons!27252 acc!846))))

(assert (=> d!135505 (= (contains!7318 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560903)))

(declare-fun b!1236848 () Bool)

(declare-fun e!700963 () Bool)

(assert (=> b!1236848 (= e!700962 e!700963)))

(declare-fun res!824825 () Bool)

(assert (=> b!1236848 (=> res!824825 e!700963)))

(assert (=> b!1236848 (= res!824825 (= (h!28461 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236849 () Bool)

(assert (=> b!1236849 (= e!700963 (contains!7318 (t!40719 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135505 res!824824) b!1236848))

(assert (= (and b!1236848 (not res!824825)) b!1236849))

(declare-fun m!1140593 () Bool)

(assert (=> d!135505 m!1140593))

(declare-fun m!1140595 () Bool)

(assert (=> d!135505 m!1140595))

(declare-fun m!1140597 () Bool)

(assert (=> b!1236849 m!1140597))

(assert (=> b!1236775 d!135505))

(declare-fun d!135511 () Bool)

(declare-fun lt!560904 () Bool)

(assert (=> d!135511 (= lt!560904 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!581 acc!846)))))

(declare-fun e!700966 () Bool)

(assert (=> d!135511 (= lt!560904 e!700966)))

(declare-fun res!824828 () Bool)

(assert (=> d!135511 (=> (not res!824828) (not e!700966))))

(assert (=> d!135511 (= res!824828 (is-Cons!27252 acc!846))))

(assert (=> d!135511 (= (contains!7318 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560904)))

(declare-fun b!1236852 () Bool)

(declare-fun e!700967 () Bool)

(assert (=> b!1236852 (= e!700966 e!700967)))

(declare-fun res!824829 () Bool)

(assert (=> b!1236852 (=> res!824829 e!700967)))

(assert (=> b!1236852 (= res!824829 (= (h!28461 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236853 () Bool)

(assert (=> b!1236853 (= e!700967 (contains!7318 (t!40719 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135511 res!824828) b!1236852))

(assert (= (and b!1236852 (not res!824829)) b!1236853))

(assert (=> d!135511 m!1140593))

(declare-fun m!1140603 () Bool)

(assert (=> d!135511 m!1140603))

(declare-fun m!1140605 () Bool)

(assert (=> b!1236853 m!1140605))

(assert (=> b!1236770 d!135511))

(declare-fun d!135515 () Bool)

(declare-fun lt!560905 () Bool)

(assert (=> d!135515 (= lt!560905 (set.member k!2925 (content!581 acc!846)))))

(declare-fun e!700976 () Bool)

(assert (=> d!135515 (= lt!560905 e!700976)))

(declare-fun res!824838 () Bool)

(assert (=> d!135515 (=> (not res!824838) (not e!700976))))

(assert (=> d!135515 (= res!824838 (is-Cons!27252 acc!846))))

(assert (=> d!135515 (= (contains!7318 acc!846 k!2925) lt!560905)))

(declare-fun b!1236862 () Bool)

(declare-fun e!700977 () Bool)

(assert (=> b!1236862 (= e!700976 e!700977)))

(declare-fun res!824839 () Bool)

(assert (=> b!1236862 (=> res!824839 e!700977)))

(assert (=> b!1236862 (= res!824839 (= (h!28461 acc!846) k!2925))))

(declare-fun b!1236863 () Bool)

(assert (=> b!1236863 (= e!700977 (contains!7318 (t!40719 acc!846) k!2925))))

(assert (= (and d!135515 res!824838) b!1236862))

(assert (= (and b!1236862 (not res!824839)) b!1236863))

(assert (=> d!135515 m!1140593))

(declare-fun m!1140607 () Bool)

(assert (=> d!135515 m!1140607))

(declare-fun m!1140609 () Bool)

(assert (=> b!1236863 m!1140609))

(assert (=> b!1236769 d!135515))

(declare-fun d!135517 () Bool)

(assert (=> d!135517 (= (validKeyInArray!0 (select (arr!38483 a!3835) from!3213)) (and (not (= (select (arr!38483 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38483 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1236774 d!135517))

(declare-fun b!1236900 () Bool)

(declare-fun e!701007 () Bool)

(declare-fun e!701008 () Bool)

(assert (=> b!1236900 (= e!701007 e!701008)))

(declare-fun res!824861 () Bool)

(assert (=> b!1236900 (=> (not res!824861) (not e!701008))))

(declare-fun e!701006 () Bool)

(assert (=> b!1236900 (= res!824861 (not e!701006))))

(declare-fun res!824862 () Bool)

(assert (=> b!1236900 (=> (not res!824862) (not e!701006))))

(assert (=> b!1236900 (= res!824862 (validKeyInArray!0 (select (arr!38483 a!3835) from!3213)))))

(declare-fun b!1236901 () Bool)

(declare-fun e!701009 () Bool)

(assert (=> b!1236901 (= e!701008 e!701009)))

(declare-fun c!120880 () Bool)

(assert (=> b!1236901 (= c!120880 (validKeyInArray!0 (select (arr!38483 a!3835) from!3213)))))

(declare-fun d!135521 () Bool)

(declare-fun res!824860 () Bool)

(assert (=> d!135521 (=> res!824860 e!701007)))

(assert (=> d!135521 (= res!824860 (bvsge from!3213 (size!39019 a!3835)))))

(assert (=> d!135521 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701007)))

(declare-fun b!1236902 () Bool)

(declare-fun call!61002 () Bool)

(assert (=> b!1236902 (= e!701009 call!61002)))

(declare-fun b!1236903 () Bool)

(assert (=> b!1236903 (= e!701009 call!61002)))

(declare-fun bm!60999 () Bool)

(assert (=> bm!60999 (= call!61002 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120880 (Cons!27252 (select (arr!38483 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1236904 () Bool)

(assert (=> b!1236904 (= e!701006 (contains!7318 acc!846 (select (arr!38483 a!3835) from!3213)))))

(assert (= (and d!135521 (not res!824860)) b!1236900))

(assert (= (and b!1236900 res!824862) b!1236904))

(assert (= (and b!1236900 res!824861) b!1236901))

(assert (= (and b!1236901 c!120880) b!1236903))

(assert (= (and b!1236901 (not c!120880)) b!1236902))

(assert (= (or b!1236903 b!1236902) bm!60999))

(assert (=> b!1236900 m!1140519))

(assert (=> b!1236900 m!1140519))

(assert (=> b!1236900 m!1140521))

(assert (=> b!1236901 m!1140519))

(assert (=> b!1236901 m!1140519))

(assert (=> b!1236901 m!1140521))

(assert (=> bm!60999 m!1140519))

(declare-fun m!1140625 () Bool)

(assert (=> bm!60999 m!1140625))

(assert (=> b!1236904 m!1140519))

(assert (=> b!1236904 m!1140519))

(declare-fun m!1140627 () Bool)

(assert (=> b!1236904 m!1140627))

(assert (=> b!1236772 d!135521))

(declare-fun b!1236939 () Bool)

(declare-fun e!701039 () Bool)

(assert (=> b!1236939 (= e!701039 (subseq!572 acc!846 (t!40719 lt!560880)))))

(declare-fun b!1236938 () Bool)

(declare-fun e!701041 () Bool)

(assert (=> b!1236938 (= e!701041 (subseq!572 (t!40719 acc!846) (t!40719 lt!560880)))))

(declare-fun b!1236936 () Bool)

(declare-fun e!701038 () Bool)

(declare-fun e!701040 () Bool)

(assert (=> b!1236936 (= e!701038 e!701040)))

(declare-fun res!824890 () Bool)

(assert (=> b!1236936 (=> (not res!824890) (not e!701040))))

(assert (=> b!1236936 (= res!824890 (is-Cons!27252 lt!560880))))

(declare-fun b!1236937 () Bool)

(assert (=> b!1236937 (= e!701040 e!701039)))

(declare-fun res!824889 () Bool)

(assert (=> b!1236937 (=> res!824889 e!701039)))

(assert (=> b!1236937 (= res!824889 e!701041)))

(declare-fun res!824888 () Bool)

(assert (=> b!1236937 (=> (not res!824888) (not e!701041))))

(assert (=> b!1236937 (= res!824888 (= (h!28461 acc!846) (h!28461 lt!560880)))))

(declare-fun d!135531 () Bool)

(declare-fun res!824891 () Bool)

(assert (=> d!135531 (=> res!824891 e!701038)))

(assert (=> d!135531 (= res!824891 (is-Nil!27253 acc!846))))

(assert (=> d!135531 (= (subseq!572 acc!846 lt!560880) e!701038)))

(assert (= (and d!135531 (not res!824891)) b!1236936))

(assert (= (and b!1236936 res!824890) b!1236937))

(assert (= (and b!1236937 res!824888) b!1236938))

(assert (= (and b!1236937 (not res!824889)) b!1236939))

(declare-fun m!1140647 () Bool)

(assert (=> b!1236939 m!1140647))

(declare-fun m!1140649 () Bool)

(assert (=> b!1236938 m!1140649))

(assert (=> b!1236773 d!135531))

(declare-fun b!1236997 () Bool)

(declare-fun e!701085 () Bool)

(assert (=> b!1236997 (= e!701085 (subseq!572 lt!560880 lt!560880))))

(declare-fun b!1236998 () Bool)

(declare-fun e!701087 () Unit!41030)

(declare-fun e!701086 () Unit!41030)

(assert (=> b!1236998 (= e!701087 e!701086)))

(declare-fun c!120900 () Bool)

(assert (=> b!1236998 (= c!120900 (subseq!572 lt!560880 (t!40719 lt!560880)))))

(declare-fun d!135539 () Bool)

(declare-fun tail!159 (List!27256) List!27256)

(assert (=> d!135539 (subseq!572 (tail!159 lt!560880) lt!560880)))

(declare-fun lt!560930 () Unit!41030)

(assert (=> d!135539 (= lt!560930 e!701087)))

(declare-fun c!120901 () Bool)

(assert (=> d!135539 (= c!120901 (and (is-Cons!27252 lt!560880) (is-Cons!27252 lt!560880)))))

(assert (=> d!135539 e!701085))

(declare-fun res!824919 () Bool)

(assert (=> d!135539 (=> (not res!824919) (not e!701085))))

(declare-fun isEmpty!1007 (List!27256) Bool)

(assert (=> d!135539 (= res!824919 (not (isEmpty!1007 lt!560880)))))

(assert (=> d!135539 (= (subseqTail!59 lt!560880 lt!560880) lt!560930)))

(declare-fun b!1236999 () Bool)

(declare-fun Unit!41038 () Unit!41030)

(assert (=> b!1236999 (= e!701087 Unit!41038)))

(declare-fun b!1237000 () Bool)

(declare-fun call!61009 () Unit!41030)

(assert (=> b!1237000 (= e!701086 call!61009)))

(declare-fun b!1237001 () Bool)

(declare-fun c!120899 () Bool)

(assert (=> b!1237001 (= c!120899 (not (isEmpty!1007 (t!40719 lt!560880))))))

(declare-fun e!701084 () Unit!41030)

(assert (=> b!1237001 (= e!701086 e!701084)))

(declare-fun bm!61006 () Bool)

(assert (=> bm!61006 (= call!61009 (subseqTail!59 (ite c!120900 lt!560880 (t!40719 lt!560880)) (t!40719 lt!560880)))))

(declare-fun b!1237002 () Bool)

(assert (=> b!1237002 (= e!701084 call!61009)))

(declare-fun b!1237003 () Bool)

(declare-fun Unit!41039 () Unit!41030)

(assert (=> b!1237003 (= e!701084 Unit!41039)))

(assert (= (and d!135539 res!824919) b!1236997))

(assert (= (and d!135539 c!120901) b!1236998))

(assert (= (and d!135539 (not c!120901)) b!1236999))

(assert (= (and b!1236998 c!120900) b!1237000))

(assert (= (and b!1236998 (not c!120900)) b!1237001))

(assert (= (and b!1237001 c!120899) b!1237002))

(assert (= (and b!1237001 (not c!120899)) b!1237003))

(assert (= (or b!1237000 b!1237002) bm!61006))

(declare-fun m!1140691 () Bool)

(assert (=> b!1237001 m!1140691))

(declare-fun m!1140693 () Bool)

(assert (=> b!1236998 m!1140693))

(declare-fun m!1140695 () Bool)

(assert (=> bm!61006 m!1140695))

(assert (=> b!1236997 m!1140525))

(declare-fun m!1140697 () Bool)

(assert (=> d!135539 m!1140697))

(assert (=> d!135539 m!1140697))

(declare-fun m!1140699 () Bool)

(assert (=> d!135539 m!1140699))

(declare-fun m!1140701 () Bool)

(assert (=> d!135539 m!1140701))

(assert (=> b!1236773 d!135539))

(declare-fun b!1237007 () Bool)

(declare-fun e!701089 () Bool)

(assert (=> b!1237007 (= e!701089 (subseq!572 lt!560880 (t!40719 lt!560880)))))

(declare-fun b!1237006 () Bool)

(declare-fun e!701091 () Bool)

(assert (=> b!1237006 (= e!701091 (subseq!572 (t!40719 lt!560880) (t!40719 lt!560880)))))

(declare-fun b!1237004 () Bool)

(declare-fun e!701088 () Bool)

(declare-fun e!701090 () Bool)

(assert (=> b!1237004 (= e!701088 e!701090)))

(declare-fun res!824922 () Bool)

(assert (=> b!1237004 (=> (not res!824922) (not e!701090))))

(assert (=> b!1237004 (= res!824922 (is-Cons!27252 lt!560880))))

(declare-fun b!1237005 () Bool)

(assert (=> b!1237005 (= e!701090 e!701089)))

(declare-fun res!824921 () Bool)

(assert (=> b!1237005 (=> res!824921 e!701089)))

(assert (=> b!1237005 (= res!824921 e!701091)))

(declare-fun res!824920 () Bool)

(assert (=> b!1237005 (=> (not res!824920) (not e!701091))))

(assert (=> b!1237005 (= res!824920 (= (h!28461 lt!560880) (h!28461 lt!560880)))))

(declare-fun d!135561 () Bool)

(declare-fun res!824923 () Bool)

(assert (=> d!135561 (=> res!824923 e!701088)))

(assert (=> d!135561 (= res!824923 (is-Nil!27253 lt!560880))))

(assert (=> d!135561 (= (subseq!572 lt!560880 lt!560880) e!701088)))

(assert (= (and d!135561 (not res!824923)) b!1237004))

(assert (= (and b!1237004 res!824922) b!1237005))

(assert (= (and b!1237005 res!824920) b!1237006))

(assert (= (and b!1237005 (not res!824921)) b!1237007))

(assert (=> b!1237007 m!1140693))

(declare-fun m!1140703 () Bool)

(assert (=> b!1237006 m!1140703))

(assert (=> b!1236773 d!135561))

(declare-fun d!135563 () Bool)

(assert (=> d!135563 (subseq!572 lt!560880 lt!560880)))

(declare-fun lt!560933 () Unit!41030)

(declare-fun choose!36 (List!27256) Unit!41030)

(assert (=> d!135563 (= lt!560933 (choose!36 lt!560880))))

(assert (=> d!135563 (= (lemmaListSubSeqRefl!0 lt!560880) lt!560933)))

(declare-fun bs!34783 () Bool)

(assert (= bs!34783 d!135563))

(assert (=> bs!34783 m!1140525))

(declare-fun m!1140705 () Bool)

(assert (=> bs!34783 m!1140705))

(assert (=> b!1236773 d!135563))

(declare-fun d!135565 () Bool)

(declare-fun res!824934 () Bool)

(declare-fun e!701104 () Bool)

(assert (=> d!135565 (=> res!824934 e!701104)))

(assert (=> d!135565 (= res!824934 (is-Nil!27253 acc!846))))

(assert (=> d!135565 (= (noDuplicate!1915 acc!846) e!701104)))

(declare-fun b!1237022 () Bool)

(declare-fun e!701105 () Bool)

(assert (=> b!1237022 (= e!701104 e!701105)))

(declare-fun res!824935 () Bool)

(assert (=> b!1237022 (=> (not res!824935) (not e!701105))))

(assert (=> b!1237022 (= res!824935 (not (contains!7318 (t!40719 acc!846) (h!28461 acc!846))))))

(declare-fun b!1237023 () Bool)

(assert (=> b!1237023 (= e!701105 (noDuplicate!1915 (t!40719 acc!846)))))

(assert (= (and d!135565 (not res!824934)) b!1237022))

(assert (= (and b!1237022 res!824935) b!1237023))

(declare-fun m!1140707 () Bool)

(assert (=> b!1237022 m!1140707))

(declare-fun m!1140709 () Bool)

(assert (=> b!1237023 m!1140709))

(assert (=> b!1236771 d!135565))

(declare-fun d!135567 () Bool)

(assert (=> d!135567 (= (array_inv!29331 a!3835) (bvsge (size!39019 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!102906 d!135567))

(push 1)

(assert (not d!135511))

(assert (not b!1236849))

(assert (not b!1237022))

(assert (not b!1237007))

(assert (not b!1236939))

(assert (not b!1236863))

(assert (not bm!61006))

(assert (not b!1236900))

(assert (not b!1236901))

(assert (not b!1237001))

(assert (not bm!60999))

(assert (not b!1237006))

(assert (not d!135505))

(assert (not b!1236904))

(assert (not d!135515))

(assert (not b!1236938))

(assert (not b!1236998))

(assert (not d!135539))

(assert (not b!1237023))

(assert (not b!1236997))

(assert (not d!135563))

(assert (not b!1236853))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135605 () Bool)

(declare-fun lt!560940 () Bool)

(assert (=> d!135605 (= lt!560940 (set.member k!2925 (content!581 (t!40719 acc!846))))))

(declare-fun e!701153 () Bool)

(assert (=> d!135605 (= lt!560940 e!701153)))

(declare-fun res!824975 () Bool)

(assert (=> d!135605 (=> (not res!824975) (not e!701153))))

(assert (=> d!135605 (= res!824975 (is-Cons!27252 (t!40719 acc!846)))))

(assert (=> d!135605 (= (contains!7318 (t!40719 acc!846) k!2925) lt!560940)))

(declare-fun b!1237079 () Bool)

(declare-fun e!701154 () Bool)

(assert (=> b!1237079 (= e!701153 e!701154)))

(declare-fun res!824976 () Bool)

(assert (=> b!1237079 (=> res!824976 e!701154)))

(assert (=> b!1237079 (= res!824976 (= (h!28461 (t!40719 acc!846)) k!2925))))

(declare-fun b!1237080 () Bool)

(assert (=> b!1237080 (= e!701154 (contains!7318 (t!40719 (t!40719 acc!846)) k!2925))))

(assert (= (and d!135605 res!824975) b!1237079))

(assert (= (and b!1237079 (not res!824976)) b!1237080))

(declare-fun m!1140781 () Bool)

(assert (=> d!135605 m!1140781))

(declare-fun m!1140783 () Bool)

(assert (=> d!135605 m!1140783))

(declare-fun m!1140785 () Bool)

(assert (=> b!1237080 m!1140785))

(assert (=> b!1236863 d!135605))

(declare-fun b!1237084 () Bool)

(declare-fun e!701156 () Bool)

(assert (=> b!1237084 (= e!701156 (subseq!572 acc!846 (t!40719 (t!40719 lt!560880))))))

(declare-fun b!1237083 () Bool)

(declare-fun e!701158 () Bool)

(assert (=> b!1237083 (= e!701158 (subseq!572 (t!40719 acc!846) (t!40719 (t!40719 lt!560880))))))

(declare-fun b!1237081 () Bool)

(declare-fun e!701155 () Bool)

(declare-fun e!701157 () Bool)

(assert (=> b!1237081 (= e!701155 e!701157)))

(declare-fun res!824979 () Bool)

(assert (=> b!1237081 (=> (not res!824979) (not e!701157))))

(assert (=> b!1237081 (= res!824979 (is-Cons!27252 (t!40719 lt!560880)))))

(declare-fun b!1237082 () Bool)

(assert (=> b!1237082 (= e!701157 e!701156)))

(declare-fun res!824978 () Bool)

(assert (=> b!1237082 (=> res!824978 e!701156)))

(assert (=> b!1237082 (= res!824978 e!701158)))

(declare-fun res!824977 () Bool)

(assert (=> b!1237082 (=> (not res!824977) (not e!701158))))

(assert (=> b!1237082 (= res!824977 (= (h!28461 acc!846) (h!28461 (t!40719 lt!560880))))))

(declare-fun d!135607 () Bool)

(declare-fun res!824980 () Bool)

(assert (=> d!135607 (=> res!824980 e!701155)))

(assert (=> d!135607 (= res!824980 (is-Nil!27253 acc!846))))

(assert (=> d!135607 (= (subseq!572 acc!846 (t!40719 lt!560880)) e!701155)))

(assert (= (and d!135607 (not res!824980)) b!1237081))

(assert (= (and b!1237081 res!824979) b!1237082))

(assert (= (and b!1237082 res!824977) b!1237083))

(assert (= (and b!1237082 (not res!824978)) b!1237084))

(declare-fun m!1140787 () Bool)

(assert (=> b!1237084 m!1140787))

(declare-fun m!1140789 () Bool)

(assert (=> b!1237083 m!1140789))

(assert (=> b!1236939 d!135607))

(assert (=> b!1236901 d!135517))

(declare-fun d!135609 () Bool)

(declare-fun lt!560941 () Bool)

(assert (=> d!135609 (= lt!560941 (set.member (h!28461 acc!846) (content!581 (t!40719 acc!846))))))

(declare-fun e!701159 () Bool)

(assert (=> d!135609 (= lt!560941 e!701159)))

(declare-fun res!824981 () Bool)

(assert (=> d!135609 (=> (not res!824981) (not e!701159))))

(assert (=> d!135609 (= res!824981 (is-Cons!27252 (t!40719 acc!846)))))

(assert (=> d!135609 (= (contains!7318 (t!40719 acc!846) (h!28461 acc!846)) lt!560941)))

(declare-fun b!1237085 () Bool)

(declare-fun e!701160 () Bool)

(assert (=> b!1237085 (= e!701159 e!701160)))

(declare-fun res!824982 () Bool)

(assert (=> b!1237085 (=> res!824982 e!701160)))

(assert (=> b!1237085 (= res!824982 (= (h!28461 (t!40719 acc!846)) (h!28461 acc!846)))))

(declare-fun b!1237086 () Bool)

(assert (=> b!1237086 (= e!701160 (contains!7318 (t!40719 (t!40719 acc!846)) (h!28461 acc!846)))))

(assert (= (and d!135609 res!824981) b!1237085))

(assert (= (and b!1237085 (not res!824982)) b!1237086))

(assert (=> d!135609 m!1140781))

(declare-fun m!1140791 () Bool)

(assert (=> d!135609 m!1140791))

(declare-fun m!1140793 () Bool)

(assert (=> b!1237086 m!1140793))

(assert (=> b!1237022 d!135609))

(declare-fun b!1237090 () Bool)

(declare-fun e!701162 () Bool)

(assert (=> b!1237090 (= e!701162 (subseq!572 (t!40719 acc!846) (t!40719 (t!40719 lt!560880))))))

(declare-fun b!1237089 () Bool)

(declare-fun e!701164 () Bool)

(assert (=> b!1237089 (= e!701164 (subseq!572 (t!40719 (t!40719 acc!846)) (t!40719 (t!40719 lt!560880))))))

(declare-fun b!1237087 () Bool)

(declare-fun e!701161 () Bool)

(declare-fun e!701163 () Bool)

(assert (=> b!1237087 (= e!701161 e!701163)))

(declare-fun res!824985 () Bool)

(assert (=> b!1237087 (=> (not res!824985) (not e!701163))))

(assert (=> b!1237087 (= res!824985 (is-Cons!27252 (t!40719 lt!560880)))))

(declare-fun b!1237088 () Bool)

(assert (=> b!1237088 (= e!701163 e!701162)))

(declare-fun res!824984 () Bool)

(assert (=> b!1237088 (=> res!824984 e!701162)))

(assert (=> b!1237088 (= res!824984 e!701164)))

(declare-fun res!824983 () Bool)

(assert (=> b!1237088 (=> (not res!824983) (not e!701164))))

(assert (=> b!1237088 (= res!824983 (= (h!28461 (t!40719 acc!846)) (h!28461 (t!40719 lt!560880))))))

(declare-fun d!135611 () Bool)

(declare-fun res!824986 () Bool)

(assert (=> d!135611 (=> res!824986 e!701161)))

(assert (=> d!135611 (= res!824986 (is-Nil!27253 (t!40719 acc!846)))))

(assert (=> d!135611 (= (subseq!572 (t!40719 acc!846) (t!40719 lt!560880)) e!701161)))

(assert (= (and d!135611 (not res!824986)) b!1237087))

(assert (= (and b!1237087 res!824985) b!1237088))

(assert (= (and b!1237088 res!824983) b!1237089))

(assert (= (and b!1237088 (not res!824984)) b!1237090))

(assert (=> b!1237090 m!1140789))

(declare-fun m!1140795 () Bool)

(assert (=> b!1237089 m!1140795))

(assert (=> b!1236938 d!135611))

(declare-fun d!135613 () Bool)

(declare-fun c!120914 () Bool)

(assert (=> d!135613 (= c!120914 (is-Nil!27253 acc!846))))

(declare-fun e!701167 () (Set (_ BitVec 64)))

(assert (=> d!135613 (= (content!581 acc!846) e!701167)))

(declare-fun b!1237095 () Bool)

(assert (=> b!1237095 (= e!701167 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!1237096 () Bool)

(assert (=> b!1237096 (= e!701167 (set.union (set.insert (h!28461 acc!846) (as set.empty (Set (_ BitVec 64)))) (content!581 (t!40719 acc!846))))))

(assert (= (and d!135613 c!120914) b!1237095))

(assert (= (and d!135613 (not c!120914)) b!1237096))

(declare-fun m!1140797 () Bool)

(assert (=> b!1237096 m!1140797))

(assert (=> b!1237096 m!1140781))

(assert (=> d!135511 d!135613))

(assert (=> b!1236900 d!135517))

(declare-fun d!135615 () Bool)

(declare-fun lt!560942 () Bool)

(assert (=> d!135615 (= lt!560942 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!581 (t!40719 acc!846))))))

(declare-fun e!701168 () Bool)

(assert (=> d!135615 (= lt!560942 e!701168)))

(declare-fun res!824987 () Bool)

(assert (=> d!135615 (=> (not res!824987) (not e!701168))))

(assert (=> d!135615 (= res!824987 (is-Cons!27252 (t!40719 acc!846)))))

(assert (=> d!135615 (= (contains!7318 (t!40719 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000) lt!560942)))

(declare-fun b!1237097 () Bool)

(declare-fun e!701169 () Bool)

(assert (=> b!1237097 (= e!701168 e!701169)))

(declare-fun res!824988 () Bool)

(assert (=> b!1237097 (=> res!824988 e!701169)))

(assert (=> b!1237097 (= res!824988 (= (h!28461 (t!40719 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237098 () Bool)

(assert (=> b!1237098 (= e!701169 (contains!7318 (t!40719 (t!40719 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135615 res!824987) b!1237097))

(assert (= (and b!1237097 (not res!824988)) b!1237098))

(assert (=> d!135615 m!1140781))

(declare-fun m!1140799 () Bool)

(assert (=> d!135615 m!1140799))

(declare-fun m!1140801 () Bool)

(assert (=> b!1237098 m!1140801))

(assert (=> b!1236853 d!135615))

(declare-fun d!135617 () Bool)

(declare-fun res!824989 () Bool)

(declare-fun e!701170 () Bool)

(assert (=> d!135617 (=> res!824989 e!701170)))

(assert (=> d!135617 (= res!824989 (is-Nil!27253 (t!40719 acc!846)))))

(assert (=> d!135617 (= (noDuplicate!1915 (t!40719 acc!846)) e!701170)))

(declare-fun b!1237099 () Bool)

(declare-fun e!701171 () Bool)

(assert (=> b!1237099 (= e!701170 e!701171)))

(declare-fun res!824990 () Bool)

(assert (=> b!1237099 (=> (not res!824990) (not e!701171))))

(assert (=> b!1237099 (= res!824990 (not (contains!7318 (t!40719 (t!40719 acc!846)) (h!28461 (t!40719 acc!846)))))))

(declare-fun b!1237100 () Bool)

(assert (=> b!1237100 (= e!701171 (noDuplicate!1915 (t!40719 (t!40719 acc!846))))))

(assert (= (and d!135617 (not res!824989)) b!1237099))

(assert (= (and b!1237099 res!824990) b!1237100))

(declare-fun m!1140803 () Bool)

(assert (=> b!1237099 m!1140803))

(declare-fun m!1140805 () Bool)

(assert (=> b!1237100 m!1140805))

(assert (=> b!1237023 d!135617))

(declare-fun b!1237104 () Bool)

(declare-fun e!701173 () Bool)

(assert (=> b!1237104 (= e!701173 (subseq!572 (tail!159 lt!560880) (t!40719 lt!560880)))))

(declare-fun b!1237103 () Bool)

(declare-fun e!701175 () Bool)

(assert (=> b!1237103 (= e!701175 (subseq!572 (t!40719 (tail!159 lt!560880)) (t!40719 lt!560880)))))

(declare-fun b!1237101 () Bool)

(declare-fun e!701172 () Bool)

(declare-fun e!701174 () Bool)

(assert (=> b!1237101 (= e!701172 e!701174)))

(declare-fun res!824993 () Bool)

(assert (=> b!1237101 (=> (not res!824993) (not e!701174))))

(assert (=> b!1237101 (= res!824993 (is-Cons!27252 lt!560880))))

(declare-fun b!1237102 () Bool)

(assert (=> b!1237102 (= e!701174 e!701173)))

(declare-fun res!824992 () Bool)

(assert (=> b!1237102 (=> res!824992 e!701173)))

(assert (=> b!1237102 (= res!824992 e!701175)))

(declare-fun res!824991 () Bool)

(assert (=> b!1237102 (=> (not res!824991) (not e!701175))))

(assert (=> b!1237102 (= res!824991 (= (h!28461 (tail!159 lt!560880)) (h!28461 lt!560880)))))

(declare-fun d!135619 () Bool)

(declare-fun res!824994 () Bool)

(assert (=> d!135619 (=> res!824994 e!701172)))

(assert (=> d!135619 (= res!824994 (is-Nil!27253 (tail!159 lt!560880)))))

(assert (=> d!135619 (= (subseq!572 (tail!159 lt!560880) lt!560880) e!701172)))

(assert (= (and d!135619 (not res!824994)) b!1237101))

(assert (= (and b!1237101 res!824993) b!1237102))

(assert (= (and b!1237102 res!824991) b!1237103))

(assert (= (and b!1237102 (not res!824992)) b!1237104))

(assert (=> b!1237104 m!1140697))

(declare-fun m!1140807 () Bool)

(assert (=> b!1237104 m!1140807))

(declare-fun m!1140809 () Bool)

(assert (=> b!1237103 m!1140809))

(assert (=> d!135539 d!135619))

(declare-fun d!135621 () Bool)

(assert (=> d!135621 (= (tail!159 lt!560880) (t!40719 lt!560880))))

(assert (=> d!135539 d!135621))

(declare-fun d!135623 () Bool)

(assert (=> d!135623 (= (isEmpty!1007 lt!560880) (is-Nil!27253 lt!560880))))

(assert (=> d!135539 d!135623))

(declare-fun b!1237105 () Bool)

(declare-fun e!701177 () Bool)

(assert (=> b!1237105 (= e!701177 (subseq!572 (ite c!120900 lt!560880 (t!40719 lt!560880)) (t!40719 lt!560880)))))

(declare-fun b!1237106 () Bool)

(declare-fun e!701179 () Unit!41030)

(declare-fun e!701178 () Unit!41030)

(assert (=> b!1237106 (= e!701179 e!701178)))

(declare-fun c!120916 () Bool)

(assert (=> b!1237106 (= c!120916 (subseq!572 (ite c!120900 lt!560880 (t!40719 lt!560880)) (t!40719 (t!40719 lt!560880))))))

(declare-fun d!135625 () Bool)

(assert (=> d!135625 (subseq!572 (tail!159 (ite c!120900 lt!560880 (t!40719 lt!560880))) (t!40719 lt!560880))))

(declare-fun lt!560943 () Unit!41030)

(assert (=> d!135625 (= lt!560943 e!701179)))

(declare-fun c!120917 () Bool)

(assert (=> d!135625 (= c!120917 (and (is-Cons!27252 (ite c!120900 lt!560880 (t!40719 lt!560880))) (is-Cons!27252 (t!40719 lt!560880))))))

(assert (=> d!135625 e!701177))

(declare-fun res!824995 () Bool)

(assert (=> d!135625 (=> (not res!824995) (not e!701177))))

(assert (=> d!135625 (= res!824995 (not (isEmpty!1007 (ite c!120900 lt!560880 (t!40719 lt!560880)))))))

(assert (=> d!135625 (= (subseqTail!59 (ite c!120900 lt!560880 (t!40719 lt!560880)) (t!40719 lt!560880)) lt!560943)))

(declare-fun b!1237107 () Bool)

(declare-fun Unit!41044 () Unit!41030)

(assert (=> b!1237107 (= e!701179 Unit!41044)))

(declare-fun b!1237108 () Bool)

(declare-fun call!61015 () Unit!41030)

(assert (=> b!1237108 (= e!701178 call!61015)))

(declare-fun b!1237109 () Bool)

(declare-fun c!120915 () Bool)

(assert (=> b!1237109 (= c!120915 (not (isEmpty!1007 (t!40719 (ite c!120900 lt!560880 (t!40719 lt!560880))))))))

(declare-fun e!701176 () Unit!41030)

(assert (=> b!1237109 (= e!701178 e!701176)))

(declare-fun bm!61012 () Bool)

(assert (=> bm!61012 (= call!61015 (subseqTail!59 (ite c!120916 (ite c!120900 lt!560880 (t!40719 lt!560880)) (t!40719 (ite c!120900 lt!560880 (t!40719 lt!560880)))) (t!40719 (t!40719 lt!560880))))))

(declare-fun b!1237110 () Bool)

(assert (=> b!1237110 (= e!701176 call!61015)))

(declare-fun b!1237111 () Bool)

(declare-fun Unit!41045 () Unit!41030)

(assert (=> b!1237111 (= e!701176 Unit!41045)))

(assert (= (and d!135625 res!824995) b!1237105))

(assert (= (and d!135625 c!120917) b!1237106))

(assert (= (and d!135625 (not c!120917)) b!1237107))

(assert (= (and b!1237106 c!120916) b!1237108))

(assert (= (and b!1237106 (not c!120916)) b!1237109))

(assert (= (and b!1237109 c!120915) b!1237110))

(assert (= (and b!1237109 (not c!120915)) b!1237111))

(assert (= (or b!1237108 b!1237110) bm!61012))

(declare-fun m!1140811 () Bool)

(assert (=> b!1237109 m!1140811))

(declare-fun m!1140813 () Bool)

(assert (=> b!1237106 m!1140813))

(declare-fun m!1140815 () Bool)

(assert (=> bm!61012 m!1140815))

(declare-fun m!1140817 () Bool)

(assert (=> b!1237105 m!1140817))

(declare-fun m!1140819 () Bool)

(assert (=> d!135625 m!1140819))

(assert (=> d!135625 m!1140819))

(declare-fun m!1140821 () Bool)

(assert (=> d!135625 m!1140821))

(declare-fun m!1140823 () Bool)

(assert (=> d!135625 m!1140823))

(assert (=> bm!61006 d!135625))

(declare-fun d!135627 () Bool)

(declare-fun lt!560944 () Bool)

(assert (=> d!135627 (= lt!560944 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!581 (t!40719 acc!846))))))

(declare-fun e!701180 () Bool)

(assert (=> d!135627 (= lt!560944 e!701180)))

(declare-fun res!824996 () Bool)

(assert (=> d!135627 (=> (not res!824996) (not e!701180))))

(assert (=> d!135627 (= res!824996 (is-Cons!27252 (t!40719 acc!846)))))

(assert (=> d!135627 (= (contains!7318 (t!40719 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000) lt!560944)))

(declare-fun b!1237112 () Bool)

(declare-fun e!701181 () Bool)

(assert (=> b!1237112 (= e!701180 e!701181)))

(declare-fun res!824997 () Bool)

(assert (=> b!1237112 (=> res!824997 e!701181)))

(assert (=> b!1237112 (= res!824997 (= (h!28461 (t!40719 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237113 () Bool)

(assert (=> b!1237113 (= e!701181 (contains!7318 (t!40719 (t!40719 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135627 res!824996) b!1237112))

(assert (= (and b!1237112 (not res!824997)) b!1237113))

(assert (=> d!135627 m!1140781))

(declare-fun m!1140825 () Bool)

(assert (=> d!135627 m!1140825))

(declare-fun m!1140827 () Bool)

(assert (=> b!1237113 m!1140827))

(assert (=> b!1236849 d!135627))

(declare-fun d!135629 () Bool)

(assert (=> d!135629 (= (isEmpty!1007 (t!40719 lt!560880)) (is-Nil!27253 (t!40719 lt!560880)))))

(assert (=> b!1237001 d!135629))

(assert (=> d!135563 d!135561))

(declare-fun d!135631 () Bool)

(assert (=> d!135631 (subseq!572 lt!560880 lt!560880)))

(assert (=> d!135631 true))

(declare-fun _$69!50 () Unit!41030)

(assert (=> d!135631 (= (choose!36 lt!560880) _$69!50)))

(declare-fun bs!34785 () Bool)

(assert (= bs!34785 d!135631))

(assert (=> bs!34785 m!1140525))

(assert (=> d!135563 d!135631))

(assert (=> d!135505 d!135613))

(declare-fun b!1237117 () Bool)

(declare-fun e!701183 () Bool)

(assert (=> b!1237117 (= e!701183 (subseq!572 lt!560880 (t!40719 (t!40719 lt!560880))))))

(declare-fun b!1237116 () Bool)

(declare-fun e!701185 () Bool)

(assert (=> b!1237116 (= e!701185 (subseq!572 (t!40719 lt!560880) (t!40719 (t!40719 lt!560880))))))

(declare-fun b!1237114 () Bool)

(declare-fun e!701182 () Bool)

(declare-fun e!701184 () Bool)

(assert (=> b!1237114 (= e!701182 e!701184)))

(declare-fun res!825000 () Bool)

(assert (=> b!1237114 (=> (not res!825000) (not e!701184))))

(assert (=> b!1237114 (= res!825000 (is-Cons!27252 (t!40719 lt!560880)))))

(declare-fun b!1237115 () Bool)

(assert (=> b!1237115 (= e!701184 e!701183)))

(declare-fun res!824999 () Bool)

(assert (=> b!1237115 (=> res!824999 e!701183)))

(assert (=> b!1237115 (= res!824999 e!701185)))

(declare-fun res!824998 () Bool)

(assert (=> b!1237115 (=> (not res!824998) (not e!701185))))

(assert (=> b!1237115 (= res!824998 (= (h!28461 lt!560880) (h!28461 (t!40719 lt!560880))))))

(declare-fun d!135633 () Bool)

(declare-fun res!825001 () Bool)

(assert (=> d!135633 (=> res!825001 e!701182)))

(assert (=> d!135633 (= res!825001 (is-Nil!27253 lt!560880))))

(assert (=> d!135633 (= (subseq!572 lt!560880 (t!40719 lt!560880)) e!701182)))

(assert (= (and d!135633 (not res!825001)) b!1237114))

(assert (= (and b!1237114 res!825000) b!1237115))

(assert (= (and b!1237115 res!824998) b!1237116))

(assert (= (and b!1237115 (not res!824999)) b!1237117))

(declare-fun m!1140829 () Bool)

(assert (=> b!1237117 m!1140829))

(declare-fun m!1140831 () Bool)

(assert (=> b!1237116 m!1140831))

(assert (=> b!1236998 d!135633))

(declare-fun lt!560945 () Bool)

(declare-fun d!135635 () Bool)

(assert (=> d!135635 (= lt!560945 (set.member (select (arr!38483 a!3835) from!3213) (content!581 acc!846)))))

(declare-fun e!701186 () Bool)

(assert (=> d!135635 (= lt!560945 e!701186)))

(declare-fun res!825002 () Bool)

(assert (=> d!135635 (=> (not res!825002) (not e!701186))))

(assert (=> d!135635 (= res!825002 (is-Cons!27252 acc!846))))

(assert (=> d!135635 (= (contains!7318 acc!846 (select (arr!38483 a!3835) from!3213)) lt!560945)))

(declare-fun b!1237118 () Bool)

(declare-fun e!701187 () Bool)

(assert (=> b!1237118 (= e!701186 e!701187)))

(declare-fun res!825003 () Bool)

(assert (=> b!1237118 (=> res!825003 e!701187)))

(assert (=> b!1237118 (= res!825003 (= (h!28461 acc!846) (select (arr!38483 a!3835) from!3213)))))

(declare-fun b!1237119 () Bool)

(assert (=> b!1237119 (= e!701187 (contains!7318 (t!40719 acc!846) (select (arr!38483 a!3835) from!3213)))))

(assert (= (and d!135635 res!825002) b!1237118))

(assert (= (and b!1237118 (not res!825003)) b!1237119))

(assert (=> d!135635 m!1140593))

(assert (=> d!135635 m!1140519))

(declare-fun m!1140833 () Bool)

(assert (=> d!135635 m!1140833))

(assert (=> b!1237119 m!1140519))

(declare-fun m!1140835 () Bool)

(assert (=> b!1237119 m!1140835))

(assert (=> b!1236904 d!135635))

(assert (=> b!1236997 d!135561))

(declare-fun b!1237120 () Bool)

(declare-fun e!701189 () Bool)

(declare-fun e!701190 () Bool)

(assert (=> b!1237120 (= e!701189 e!701190)))

