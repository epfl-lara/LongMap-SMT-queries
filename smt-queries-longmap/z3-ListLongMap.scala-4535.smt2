; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62890 () Bool)

(assert start!62890)

(declare-fun b!708905 () Bool)

(declare-fun res!472621 () Bool)

(declare-fun e!398959 () Bool)

(assert (=> b!708905 (=> (not res!472621) (not e!398959))))

(declare-datatypes ((List!13414 0))(
  ( (Nil!13411) (Cons!13410 (h!14455 (_ BitVec 64)) (t!19699 List!13414)) )
))
(declare-fun newAcc!49 () List!13414)

(declare-fun contains!3936 (List!13414 (_ BitVec 64)) Bool)

(assert (=> b!708905 (= res!472621 (not (contains!3936 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708906 () Bool)

(declare-fun res!472635 () Bool)

(assert (=> b!708906 (=> (not res!472635) (not e!398959))))

(declare-datatypes ((array!40368 0))(
  ( (array!40369 (arr!19334 (Array (_ BitVec 32) (_ BitVec 64))) (size!19726 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40368)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun acc!652 () List!13414)

(declare-fun arrayNoDuplicates!0 (array!40368 (_ BitVec 32) List!13414) Bool)

(assert (=> b!708906 (= res!472635 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!708907 () Bool)

(declare-fun res!472619 () Bool)

(declare-fun e!398958 () Bool)

(assert (=> b!708907 (=> (not res!472619) (not e!398958))))

(declare-fun lt!317945 () List!13414)

(declare-fun noDuplicate!1205 (List!13414) Bool)

(assert (=> b!708907 (= res!472619 (noDuplicate!1205 lt!317945))))

(declare-fun b!708908 () Bool)

(declare-fun res!472626 () Bool)

(assert (=> b!708908 (=> (not res!472626) (not e!398958))))

(assert (=> b!708908 (= res!472626 (not (contains!3936 lt!317945 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708909 () Bool)

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!708909 (= e!398958 (contains!3936 lt!317945 k0!2824))))

(declare-fun b!708910 () Bool)

(declare-fun res!472630 () Bool)

(assert (=> b!708910 (=> (not res!472630) (not e!398959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!708910 (= res!472630 (validKeyInArray!0 k0!2824))))

(declare-fun b!708911 () Bool)

(declare-fun res!472617 () Bool)

(assert (=> b!708911 (=> (not res!472617) (not e!398959))))

(declare-fun subseq!398 (List!13414 List!13414) Bool)

(assert (=> b!708911 (= res!472617 (subseq!398 acc!652 newAcc!49))))

(declare-fun res!472636 () Bool)

(assert (=> start!62890 (=> (not res!472636) (not e!398959))))

(assert (=> start!62890 (= res!472636 (and (bvslt (size!19726 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19726 a!3591))))))

(assert (=> start!62890 e!398959))

(assert (=> start!62890 true))

(declare-fun array_inv!15217 (array!40368) Bool)

(assert (=> start!62890 (array_inv!15217 a!3591)))

(declare-fun b!708912 () Bool)

(declare-fun res!472628 () Bool)

(assert (=> b!708912 (=> (not res!472628) (not e!398959))))

(assert (=> b!708912 (= res!472628 (not (contains!3936 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708913 () Bool)

(assert (=> b!708913 (= e!398959 e!398958)))

(declare-fun res!472618 () Bool)

(assert (=> b!708913 (=> (not res!472618) (not e!398958))))

(assert (=> b!708913 (= res!472618 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!508 (List!13414 (_ BitVec 64)) List!13414)

(assert (=> b!708913 (= lt!317945 ($colon$colon!508 acc!652 (select (arr!19334 a!3591) from!2969)))))

(declare-fun b!708914 () Bool)

(declare-fun res!472634 () Bool)

(assert (=> b!708914 (=> (not res!472634) (not e!398959))))

(assert (=> b!708914 (= res!472634 (not (contains!3936 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708915 () Bool)

(declare-fun res!472637 () Bool)

(assert (=> b!708915 (=> (not res!472637) (not e!398959))))

(declare-fun arrayContainsKey!0 (array!40368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!708915 (= res!472637 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!708916 () Bool)

(declare-fun res!472624 () Bool)

(assert (=> b!708916 (=> (not res!472624) (not e!398959))))

(assert (=> b!708916 (= res!472624 (contains!3936 newAcc!49 k0!2824))))

(declare-fun b!708917 () Bool)

(declare-fun res!472633 () Bool)

(assert (=> b!708917 (=> (not res!472633) (not e!398959))))

(assert (=> b!708917 (= res!472633 (validKeyInArray!0 (select (arr!19334 a!3591) from!2969)))))

(declare-fun b!708918 () Bool)

(declare-fun res!472638 () Bool)

(assert (=> b!708918 (=> (not res!472638) (not e!398958))))

(assert (=> b!708918 (= res!472638 (not (contains!3936 lt!317945 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708919 () Bool)

(declare-fun res!472623 () Bool)

(assert (=> b!708919 (=> (not res!472623) (not e!398959))))

(declare-fun -!363 (List!13414 (_ BitVec 64)) List!13414)

(assert (=> b!708919 (= res!472623 (= (-!363 newAcc!49 k0!2824) acc!652))))

(declare-fun b!708920 () Bool)

(declare-fun res!472629 () Bool)

(assert (=> b!708920 (=> (not res!472629) (not e!398959))))

(assert (=> b!708920 (= res!472629 (noDuplicate!1205 newAcc!49))))

(declare-fun b!708921 () Bool)

(declare-fun res!472632 () Bool)

(assert (=> b!708921 (=> (not res!472632) (not e!398959))))

(assert (=> b!708921 (= res!472632 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19726 a!3591)))))

(declare-fun b!708922 () Bool)

(declare-fun res!472622 () Bool)

(assert (=> b!708922 (=> (not res!472622) (not e!398958))))

(assert (=> b!708922 (= res!472622 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!708923 () Bool)

(declare-fun res!472620 () Bool)

(assert (=> b!708923 (=> (not res!472620) (not e!398958))))

(assert (=> b!708923 (= res!472620 (noDuplicate!1205 ($colon$colon!508 newAcc!49 (select (arr!19334 a!3591) from!2969))))))

(declare-fun b!708924 () Bool)

(declare-fun res!472631 () Bool)

(assert (=> b!708924 (=> (not res!472631) (not e!398959))))

(assert (=> b!708924 (= res!472631 (noDuplicate!1205 acc!652))))

(declare-fun b!708925 () Bool)

(declare-fun res!472627 () Bool)

(assert (=> b!708925 (=> (not res!472627) (not e!398959))))

(assert (=> b!708925 (= res!472627 (not (contains!3936 acc!652 k0!2824)))))

(declare-fun b!708926 () Bool)

(declare-fun res!472625 () Bool)

(assert (=> b!708926 (=> (not res!472625) (not e!398959))))

(assert (=> b!708926 (= res!472625 (not (contains!3936 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62890 res!472636) b!708924))

(assert (= (and b!708924 res!472631) b!708920))

(assert (= (and b!708920 res!472629) b!708926))

(assert (= (and b!708926 res!472625) b!708914))

(assert (= (and b!708914 res!472634) b!708915))

(assert (= (and b!708915 res!472637) b!708925))

(assert (= (and b!708925 res!472627) b!708910))

(assert (= (and b!708910 res!472630) b!708906))

(assert (= (and b!708906 res!472635) b!708911))

(assert (= (and b!708911 res!472617) b!708916))

(assert (= (and b!708916 res!472624) b!708919))

(assert (= (and b!708919 res!472623) b!708905))

(assert (= (and b!708905 res!472621) b!708912))

(assert (= (and b!708912 res!472628) b!708921))

(assert (= (and b!708921 res!472632) b!708917))

(assert (= (and b!708917 res!472633) b!708913))

(assert (= (and b!708913 res!472618) b!708907))

(assert (= (and b!708907 res!472619) b!708923))

(assert (= (and b!708923 res!472620) b!708918))

(assert (= (and b!708918 res!472638) b!708908))

(assert (= (and b!708908 res!472626) b!708922))

(assert (= (and b!708922 res!472622) b!708909))

(declare-fun m!665751 () Bool)

(assert (=> b!708919 m!665751))

(declare-fun m!665753 () Bool)

(assert (=> b!708910 m!665753))

(declare-fun m!665755 () Bool)

(assert (=> b!708926 m!665755))

(declare-fun m!665757 () Bool)

(assert (=> b!708917 m!665757))

(assert (=> b!708917 m!665757))

(declare-fun m!665759 () Bool)

(assert (=> b!708917 m!665759))

(declare-fun m!665761 () Bool)

(assert (=> b!708914 m!665761))

(assert (=> b!708913 m!665757))

(assert (=> b!708913 m!665757))

(declare-fun m!665763 () Bool)

(assert (=> b!708913 m!665763))

(declare-fun m!665765 () Bool)

(assert (=> b!708922 m!665765))

(declare-fun m!665767 () Bool)

(assert (=> b!708912 m!665767))

(declare-fun m!665769 () Bool)

(assert (=> b!708906 m!665769))

(declare-fun m!665771 () Bool)

(assert (=> b!708915 m!665771))

(declare-fun m!665773 () Bool)

(assert (=> b!708911 m!665773))

(declare-fun m!665775 () Bool)

(assert (=> b!708924 m!665775))

(declare-fun m!665777 () Bool)

(assert (=> b!708909 m!665777))

(declare-fun m!665779 () Bool)

(assert (=> b!708905 m!665779))

(declare-fun m!665781 () Bool)

(assert (=> b!708920 m!665781))

(declare-fun m!665783 () Bool)

(assert (=> b!708918 m!665783))

(declare-fun m!665785 () Bool)

(assert (=> start!62890 m!665785))

(declare-fun m!665787 () Bool)

(assert (=> b!708908 m!665787))

(declare-fun m!665789 () Bool)

(assert (=> b!708916 m!665789))

(declare-fun m!665791 () Bool)

(assert (=> b!708925 m!665791))

(assert (=> b!708923 m!665757))

(assert (=> b!708923 m!665757))

(declare-fun m!665793 () Bool)

(assert (=> b!708923 m!665793))

(assert (=> b!708923 m!665793))

(declare-fun m!665795 () Bool)

(assert (=> b!708923 m!665795))

(declare-fun m!665797 () Bool)

(assert (=> b!708907 m!665797))

(check-sat (not b!708923) (not b!708913) (not b!708905) (not b!708920) (not b!708917) (not b!708916) (not b!708911) (not b!708908) (not b!708910) (not b!708912) (not b!708919) (not b!708918) (not b!708924) (not b!708915) (not b!708922) (not b!708926) (not b!708907) (not start!62890) (not b!708909) (not b!708925) (not b!708914) (not b!708906))
(check-sat)
(get-model)

(declare-fun d!96859 () Bool)

(declare-fun lt!317954 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!343 (List!13414) (InoxSet (_ BitVec 64)))

(assert (=> d!96859 (= lt!317954 (select (content!343 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398982 () Bool)

(assert (=> d!96859 (= lt!317954 e!398982)))

(declare-fun res!472775 () Bool)

(assert (=> d!96859 (=> (not res!472775) (not e!398982))))

(get-info :version)

(assert (=> d!96859 (= res!472775 ((_ is Cons!13410) acc!652))))

(assert (=> d!96859 (= (contains!3936 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317954)))

(declare-fun b!709063 () Bool)

(declare-fun e!398983 () Bool)

(assert (=> b!709063 (= e!398982 e!398983)))

(declare-fun res!472776 () Bool)

(assert (=> b!709063 (=> res!472776 e!398983)))

(assert (=> b!709063 (= res!472776 (= (h!14455 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709064 () Bool)

(assert (=> b!709064 (= e!398983 (contains!3936 (t!19699 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96859 res!472775) b!709063))

(assert (= (and b!709063 (not res!472776)) b!709064))

(declare-fun m!665895 () Bool)

(assert (=> d!96859 m!665895))

(declare-fun m!665897 () Bool)

(assert (=> d!96859 m!665897))

(declare-fun m!665899 () Bool)

(assert (=> b!709064 m!665899))

(assert (=> b!708914 d!96859))

(declare-fun d!96861 () Bool)

(declare-fun lt!317955 () Bool)

(assert (=> d!96861 (= lt!317955 (select (content!343 acc!652) k0!2824))))

(declare-fun e!398984 () Bool)

(assert (=> d!96861 (= lt!317955 e!398984)))

(declare-fun res!472777 () Bool)

(assert (=> d!96861 (=> (not res!472777) (not e!398984))))

(assert (=> d!96861 (= res!472777 ((_ is Cons!13410) acc!652))))

(assert (=> d!96861 (= (contains!3936 acc!652 k0!2824) lt!317955)))

(declare-fun b!709065 () Bool)

(declare-fun e!398985 () Bool)

(assert (=> b!709065 (= e!398984 e!398985)))

(declare-fun res!472778 () Bool)

(assert (=> b!709065 (=> res!472778 e!398985)))

(assert (=> b!709065 (= res!472778 (= (h!14455 acc!652) k0!2824))))

(declare-fun b!709066 () Bool)

(assert (=> b!709066 (= e!398985 (contains!3936 (t!19699 acc!652) k0!2824))))

(assert (= (and d!96861 res!472777) b!709065))

(assert (= (and b!709065 (not res!472778)) b!709066))

(assert (=> d!96861 m!665895))

(declare-fun m!665901 () Bool)

(assert (=> d!96861 m!665901))

(declare-fun m!665903 () Bool)

(assert (=> b!709066 m!665903))

(assert (=> b!708925 d!96861))

(declare-fun d!96863 () Bool)

(declare-fun lt!317956 () Bool)

(assert (=> d!96863 (= lt!317956 (select (content!343 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398986 () Bool)

(assert (=> d!96863 (= lt!317956 e!398986)))

(declare-fun res!472779 () Bool)

(assert (=> d!96863 (=> (not res!472779) (not e!398986))))

(assert (=> d!96863 (= res!472779 ((_ is Cons!13410) acc!652))))

(assert (=> d!96863 (= (contains!3936 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317956)))

(declare-fun b!709067 () Bool)

(declare-fun e!398987 () Bool)

(assert (=> b!709067 (= e!398986 e!398987)))

(declare-fun res!472780 () Bool)

(assert (=> b!709067 (=> res!472780 e!398987)))

(assert (=> b!709067 (= res!472780 (= (h!14455 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709068 () Bool)

(assert (=> b!709068 (= e!398987 (contains!3936 (t!19699 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96863 res!472779) b!709067))

(assert (= (and b!709067 (not res!472780)) b!709068))

(assert (=> d!96863 m!665895))

(declare-fun m!665905 () Bool)

(assert (=> d!96863 m!665905))

(declare-fun m!665907 () Bool)

(assert (=> b!709068 m!665907))

(assert (=> b!708926 d!96863))

(declare-fun d!96865 () Bool)

(declare-fun res!472785 () Bool)

(declare-fun e!398992 () Bool)

(assert (=> d!96865 (=> res!472785 e!398992)))

(assert (=> d!96865 (= res!472785 (= (select (arr!19334 a!3591) from!2969) k0!2824))))

(assert (=> d!96865 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!398992)))

(declare-fun b!709073 () Bool)

(declare-fun e!398993 () Bool)

(assert (=> b!709073 (= e!398992 e!398993)))

(declare-fun res!472786 () Bool)

(assert (=> b!709073 (=> (not res!472786) (not e!398993))))

(assert (=> b!709073 (= res!472786 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19726 a!3591)))))

(declare-fun b!709074 () Bool)

(assert (=> b!709074 (= e!398993 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96865 (not res!472785)) b!709073))

(assert (= (and b!709073 res!472786) b!709074))

(assert (=> d!96865 m!665757))

(declare-fun m!665909 () Bool)

(assert (=> b!709074 m!665909))

(assert (=> b!708915 d!96865))

(declare-fun d!96867 () Bool)

(declare-fun lt!317957 () Bool)

(assert (=> d!96867 (= lt!317957 (select (content!343 newAcc!49) k0!2824))))

(declare-fun e!398994 () Bool)

(assert (=> d!96867 (= lt!317957 e!398994)))

(declare-fun res!472787 () Bool)

(assert (=> d!96867 (=> (not res!472787) (not e!398994))))

(assert (=> d!96867 (= res!472787 ((_ is Cons!13410) newAcc!49))))

(assert (=> d!96867 (= (contains!3936 newAcc!49 k0!2824) lt!317957)))

(declare-fun b!709075 () Bool)

(declare-fun e!398995 () Bool)

(assert (=> b!709075 (= e!398994 e!398995)))

(declare-fun res!472788 () Bool)

(assert (=> b!709075 (=> res!472788 e!398995)))

(assert (=> b!709075 (= res!472788 (= (h!14455 newAcc!49) k0!2824))))

(declare-fun b!709076 () Bool)

(assert (=> b!709076 (= e!398995 (contains!3936 (t!19699 newAcc!49) k0!2824))))

(assert (= (and d!96867 res!472787) b!709075))

(assert (= (and b!709075 (not res!472788)) b!709076))

(declare-fun m!665911 () Bool)

(assert (=> d!96867 m!665911))

(declare-fun m!665913 () Bool)

(assert (=> d!96867 m!665913))

(declare-fun m!665915 () Bool)

(assert (=> b!709076 m!665915))

(assert (=> b!708916 d!96867))

(declare-fun d!96869 () Bool)

(declare-fun lt!317958 () Bool)

(assert (=> d!96869 (= lt!317958 (select (content!343 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398996 () Bool)

(assert (=> d!96869 (= lt!317958 e!398996)))

(declare-fun res!472789 () Bool)

(assert (=> d!96869 (=> (not res!472789) (not e!398996))))

(assert (=> d!96869 (= res!472789 ((_ is Cons!13410) newAcc!49))))

(assert (=> d!96869 (= (contains!3936 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317958)))

(declare-fun b!709077 () Bool)

(declare-fun e!398997 () Bool)

(assert (=> b!709077 (= e!398996 e!398997)))

(declare-fun res!472790 () Bool)

(assert (=> b!709077 (=> res!472790 e!398997)))

(assert (=> b!709077 (= res!472790 (= (h!14455 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709078 () Bool)

(assert (=> b!709078 (= e!398997 (contains!3936 (t!19699 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96869 res!472789) b!709077))

(assert (= (and b!709077 (not res!472790)) b!709078))

(assert (=> d!96869 m!665911))

(declare-fun m!665917 () Bool)

(assert (=> d!96869 m!665917))

(declare-fun m!665919 () Bool)

(assert (=> b!709078 m!665919))

(assert (=> b!708905 d!96869))

(declare-fun d!96871 () Bool)

(declare-fun res!472799 () Bool)

(declare-fun e!399006 () Bool)

(assert (=> d!96871 (=> res!472799 e!399006)))

(assert (=> d!96871 (= res!472799 (bvsge from!2969 (size!19726 a!3591)))))

(assert (=> d!96871 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399006)))

(declare-fun bm!34405 () Bool)

(declare-fun call!34408 () Bool)

(declare-fun c!78513 () Bool)

(assert (=> bm!34405 (= call!34408 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78513 (Cons!13410 (select (arr!19334 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!709089 () Bool)

(declare-fun e!399007 () Bool)

(assert (=> b!709089 (= e!399007 (contains!3936 acc!652 (select (arr!19334 a!3591) from!2969)))))

(declare-fun b!709090 () Bool)

(declare-fun e!399008 () Bool)

(assert (=> b!709090 (= e!399006 e!399008)))

(declare-fun res!472797 () Bool)

(assert (=> b!709090 (=> (not res!472797) (not e!399008))))

(assert (=> b!709090 (= res!472797 (not e!399007))))

(declare-fun res!472798 () Bool)

(assert (=> b!709090 (=> (not res!472798) (not e!399007))))

(assert (=> b!709090 (= res!472798 (validKeyInArray!0 (select (arr!19334 a!3591) from!2969)))))

(declare-fun b!709091 () Bool)

(declare-fun e!399009 () Bool)

(assert (=> b!709091 (= e!399009 call!34408)))

(declare-fun b!709092 () Bool)

(assert (=> b!709092 (= e!399008 e!399009)))

(assert (=> b!709092 (= c!78513 (validKeyInArray!0 (select (arr!19334 a!3591) from!2969)))))

(declare-fun b!709093 () Bool)

(assert (=> b!709093 (= e!399009 call!34408)))

(assert (= (and d!96871 (not res!472799)) b!709090))

(assert (= (and b!709090 res!472798) b!709089))

(assert (= (and b!709090 res!472797) b!709092))

(assert (= (and b!709092 c!78513) b!709091))

(assert (= (and b!709092 (not c!78513)) b!709093))

(assert (= (or b!709091 b!709093) bm!34405))

(assert (=> bm!34405 m!665757))

(declare-fun m!665921 () Bool)

(assert (=> bm!34405 m!665921))

(assert (=> b!709089 m!665757))

(assert (=> b!709089 m!665757))

(declare-fun m!665923 () Bool)

(assert (=> b!709089 m!665923))

(assert (=> b!709090 m!665757))

(assert (=> b!709090 m!665757))

(assert (=> b!709090 m!665759))

(assert (=> b!709092 m!665757))

(assert (=> b!709092 m!665757))

(assert (=> b!709092 m!665759))

(assert (=> b!708906 d!96871))

(declare-fun d!96879 () Bool)

(assert (=> d!96879 (= (validKeyInArray!0 (select (arr!19334 a!3591) from!2969)) (and (not (= (select (arr!19334 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19334 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708917 d!96879))

(declare-fun d!96881 () Bool)

(declare-fun lt!317961 () Bool)

(assert (=> d!96881 (= lt!317961 (select (content!343 lt!317945) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399016 () Bool)

(assert (=> d!96881 (= lt!317961 e!399016)))

(declare-fun res!472806 () Bool)

(assert (=> d!96881 (=> (not res!472806) (not e!399016))))

(assert (=> d!96881 (= res!472806 ((_ is Cons!13410) lt!317945))))

(assert (=> d!96881 (= (contains!3936 lt!317945 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317961)))

(declare-fun b!709100 () Bool)

(declare-fun e!399017 () Bool)

(assert (=> b!709100 (= e!399016 e!399017)))

(declare-fun res!472807 () Bool)

(assert (=> b!709100 (=> res!472807 e!399017)))

(assert (=> b!709100 (= res!472807 (= (h!14455 lt!317945) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709101 () Bool)

(assert (=> b!709101 (= e!399017 (contains!3936 (t!19699 lt!317945) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96881 res!472806) b!709100))

(assert (= (and b!709100 (not res!472807)) b!709101))

(declare-fun m!665925 () Bool)

(assert (=> d!96881 m!665925))

(declare-fun m!665927 () Bool)

(assert (=> d!96881 m!665927))

(declare-fun m!665929 () Bool)

(assert (=> b!709101 m!665929))

(assert (=> b!708918 d!96881))

(declare-fun d!96883 () Bool)

(declare-fun res!472824 () Bool)

(declare-fun e!399034 () Bool)

(assert (=> d!96883 (=> res!472824 e!399034)))

(assert (=> d!96883 (= res!472824 ((_ is Nil!13411) lt!317945))))

(assert (=> d!96883 (= (noDuplicate!1205 lt!317945) e!399034)))

(declare-fun b!709118 () Bool)

(declare-fun e!399035 () Bool)

(assert (=> b!709118 (= e!399034 e!399035)))

(declare-fun res!472825 () Bool)

(assert (=> b!709118 (=> (not res!472825) (not e!399035))))

(assert (=> b!709118 (= res!472825 (not (contains!3936 (t!19699 lt!317945) (h!14455 lt!317945))))))

(declare-fun b!709119 () Bool)

(assert (=> b!709119 (= e!399035 (noDuplicate!1205 (t!19699 lt!317945)))))

(assert (= (and d!96883 (not res!472824)) b!709118))

(assert (= (and b!709118 res!472825) b!709119))

(declare-fun m!665955 () Bool)

(assert (=> b!709118 m!665955))

(declare-fun m!665957 () Bool)

(assert (=> b!709119 m!665957))

(assert (=> b!708907 d!96883))

(declare-fun d!96895 () Bool)

(declare-fun lt!317967 () Bool)

(assert (=> d!96895 (= lt!317967 (select (content!343 lt!317945) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399038 () Bool)

(assert (=> d!96895 (= lt!317967 e!399038)))

(declare-fun res!472828 () Bool)

(assert (=> d!96895 (=> (not res!472828) (not e!399038))))

(assert (=> d!96895 (= res!472828 ((_ is Cons!13410) lt!317945))))

(assert (=> d!96895 (= (contains!3936 lt!317945 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317967)))

(declare-fun b!709122 () Bool)

(declare-fun e!399039 () Bool)

(assert (=> b!709122 (= e!399038 e!399039)))

(declare-fun res!472829 () Bool)

(assert (=> b!709122 (=> res!472829 e!399039)))

(assert (=> b!709122 (= res!472829 (= (h!14455 lt!317945) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709123 () Bool)

(assert (=> b!709123 (= e!399039 (contains!3936 (t!19699 lt!317945) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96895 res!472828) b!709122))

(assert (= (and b!709122 (not res!472829)) b!709123))

(assert (=> d!96895 m!665925))

(declare-fun m!665963 () Bool)

(assert (=> d!96895 m!665963))

(declare-fun m!665965 () Bool)

(assert (=> b!709123 m!665965))

(assert (=> b!708908 d!96895))

(declare-fun bm!34411 () Bool)

(declare-fun call!34414 () List!13414)

(assert (=> bm!34411 (= call!34414 (-!363 (t!19699 newAcc!49) k0!2824))))

(declare-fun b!709168 () Bool)

(declare-fun e!399075 () List!13414)

(assert (=> b!709168 (= e!399075 (Cons!13410 (h!14455 newAcc!49) call!34414))))

(declare-fun b!709169 () Bool)

(assert (=> b!709169 (= e!399075 call!34414)))

(declare-fun b!709170 () Bool)

(declare-fun e!399077 () List!13414)

(assert (=> b!709170 (= e!399077 Nil!13411)))

(declare-fun b!709171 () Bool)

(assert (=> b!709171 (= e!399077 e!399075)))

(declare-fun c!78524 () Bool)

(assert (=> b!709171 (= c!78524 (= k0!2824 (h!14455 newAcc!49)))))

(declare-fun d!96899 () Bool)

(declare-fun e!399073 () Bool)

(assert (=> d!96899 e!399073))

(declare-fun res!472852 () Bool)

(assert (=> d!96899 (=> (not res!472852) (not e!399073))))

(declare-fun lt!317975 () List!13414)

(declare-fun size!19730 (List!13414) Int)

(assert (=> d!96899 (= res!472852 (<= (size!19730 lt!317975) (size!19730 newAcc!49)))))

(assert (=> d!96899 (= lt!317975 e!399077)))

(declare-fun c!78525 () Bool)

(assert (=> d!96899 (= c!78525 ((_ is Cons!13410) newAcc!49))))

(assert (=> d!96899 (= (-!363 newAcc!49 k0!2824) lt!317975)))

(declare-fun b!709166 () Bool)

(assert (=> b!709166 (= e!399073 (= (content!343 lt!317975) ((_ map and) (content!343 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(assert (= (and d!96899 c!78525) b!709171))

(assert (= (and d!96899 (not c!78525)) b!709170))

(assert (= (and b!709171 c!78524) b!709169))

(assert (= (and b!709171 (not c!78524)) b!709168))

(assert (= (or b!709169 b!709168) bm!34411))

(assert (= (and d!96899 res!472852) b!709166))

(declare-fun m!665997 () Bool)

(assert (=> bm!34411 m!665997))

(declare-fun m!665999 () Bool)

(assert (=> d!96899 m!665999))

(declare-fun m!666001 () Bool)

(assert (=> d!96899 m!666001))

(declare-fun m!666003 () Bool)

(assert (=> b!709166 m!666003))

(assert (=> b!709166 m!665911))

(declare-fun m!666005 () Bool)

(assert (=> b!709166 m!666005))

(assert (=> b!708919 d!96899))

(declare-fun d!96915 () Bool)

(declare-fun res!472856 () Bool)

(declare-fun e!399080 () Bool)

(assert (=> d!96915 (=> res!472856 e!399080)))

(assert (=> d!96915 (= res!472856 ((_ is Nil!13411) newAcc!49))))

(assert (=> d!96915 (= (noDuplicate!1205 newAcc!49) e!399080)))

(declare-fun b!709174 () Bool)

(declare-fun e!399081 () Bool)

(assert (=> b!709174 (= e!399080 e!399081)))

(declare-fun res!472857 () Bool)

(assert (=> b!709174 (=> (not res!472857) (not e!399081))))

(assert (=> b!709174 (= res!472857 (not (contains!3936 (t!19699 newAcc!49) (h!14455 newAcc!49))))))

(declare-fun b!709175 () Bool)

(assert (=> b!709175 (= e!399081 (noDuplicate!1205 (t!19699 newAcc!49)))))

(assert (= (and d!96915 (not res!472856)) b!709174))

(assert (= (and b!709174 res!472857) b!709175))

(declare-fun m!666011 () Bool)

(assert (=> b!709174 m!666011))

(declare-fun m!666013 () Bool)

(assert (=> b!709175 m!666013))

(assert (=> b!708920 d!96915))

(declare-fun d!96919 () Bool)

(declare-fun lt!317979 () Bool)

(assert (=> d!96919 (= lt!317979 (select (content!343 lt!317945) k0!2824))))

(declare-fun e!399086 () Bool)

(assert (=> d!96919 (= lt!317979 e!399086)))

(declare-fun res!472862 () Bool)

(assert (=> d!96919 (=> (not res!472862) (not e!399086))))

(assert (=> d!96919 (= res!472862 ((_ is Cons!13410) lt!317945))))

(assert (=> d!96919 (= (contains!3936 lt!317945 k0!2824) lt!317979)))

(declare-fun b!709180 () Bool)

(declare-fun e!399087 () Bool)

(assert (=> b!709180 (= e!399086 e!399087)))

(declare-fun res!472863 () Bool)

(assert (=> b!709180 (=> res!472863 e!399087)))

(assert (=> b!709180 (= res!472863 (= (h!14455 lt!317945) k0!2824))))

(declare-fun b!709181 () Bool)

(assert (=> b!709181 (= e!399087 (contains!3936 (t!19699 lt!317945) k0!2824))))

(assert (= (and d!96919 res!472862) b!709180))

(assert (= (and b!709180 (not res!472863)) b!709181))

(assert (=> d!96919 m!665925))

(declare-fun m!666015 () Bool)

(assert (=> d!96919 m!666015))

(declare-fun m!666017 () Bool)

(assert (=> b!709181 m!666017))

(assert (=> b!708909 d!96919))

(declare-fun d!96921 () Bool)

(assert (=> d!96921 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708910 d!96921))

(declare-fun d!96923 () Bool)

(assert (=> d!96923 (= (array_inv!15217 a!3591) (bvsge (size!19726 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62890 d!96923))

(declare-fun d!96929 () Bool)

(declare-fun res!472866 () Bool)

(declare-fun e!399090 () Bool)

(assert (=> d!96929 (=> res!472866 e!399090)))

(assert (=> d!96929 (= res!472866 (= (select (arr!19334 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!96929 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399090)))

(declare-fun b!709184 () Bool)

(declare-fun e!399091 () Bool)

(assert (=> b!709184 (= e!399090 e!399091)))

(declare-fun res!472867 () Bool)

(assert (=> b!709184 (=> (not res!472867) (not e!399091))))

(assert (=> b!709184 (= res!472867 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19726 a!3591)))))

(declare-fun b!709185 () Bool)

(assert (=> b!709185 (= e!399091 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96929 (not res!472866)) b!709184))

(assert (= (and b!709184 res!472867) b!709185))

(declare-fun m!666023 () Bool)

(assert (=> d!96929 m!666023))

(declare-fun m!666027 () Bool)

(assert (=> b!709185 m!666027))

(assert (=> b!708922 d!96929))

(declare-fun b!709218 () Bool)

(declare-fun e!399126 () Bool)

(declare-fun e!399125 () Bool)

(assert (=> b!709218 (= e!399126 e!399125)))

(declare-fun res!472901 () Bool)

(assert (=> b!709218 (=> (not res!472901) (not e!399125))))

(assert (=> b!709218 (= res!472901 ((_ is Cons!13410) newAcc!49))))

(declare-fun d!96933 () Bool)

(declare-fun res!472900 () Bool)

(assert (=> d!96933 (=> res!472900 e!399126)))

(assert (=> d!96933 (= res!472900 ((_ is Nil!13411) acc!652))))

(assert (=> d!96933 (= (subseq!398 acc!652 newAcc!49) e!399126)))

(declare-fun b!709219 () Bool)

(declare-fun e!399127 () Bool)

(assert (=> b!709219 (= e!399125 e!399127)))

(declare-fun res!472902 () Bool)

(assert (=> b!709219 (=> res!472902 e!399127)))

(declare-fun e!399124 () Bool)

(assert (=> b!709219 (= res!472902 e!399124)))

(declare-fun res!472903 () Bool)

(assert (=> b!709219 (=> (not res!472903) (not e!399124))))

(assert (=> b!709219 (= res!472903 (= (h!14455 acc!652) (h!14455 newAcc!49)))))

(declare-fun b!709221 () Bool)

(assert (=> b!709221 (= e!399127 (subseq!398 acc!652 (t!19699 newAcc!49)))))

(declare-fun b!709220 () Bool)

(assert (=> b!709220 (= e!399124 (subseq!398 (t!19699 acc!652) (t!19699 newAcc!49)))))

(assert (= (and d!96933 (not res!472900)) b!709218))

(assert (= (and b!709218 res!472901) b!709219))

(assert (= (and b!709219 res!472903) b!709220))

(assert (= (and b!709219 (not res!472902)) b!709221))

(declare-fun m!666051 () Bool)

(assert (=> b!709221 m!666051))

(declare-fun m!666053 () Bool)

(assert (=> b!709220 m!666053))

(assert (=> b!708911 d!96933))

(declare-fun d!96947 () Bool)

(declare-fun lt!317985 () Bool)

(assert (=> d!96947 (= lt!317985 (select (content!343 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399130 () Bool)

(assert (=> d!96947 (= lt!317985 e!399130)))

(declare-fun res!472906 () Bool)

(assert (=> d!96947 (=> (not res!472906) (not e!399130))))

(assert (=> d!96947 (= res!472906 ((_ is Cons!13410) newAcc!49))))

(assert (=> d!96947 (= (contains!3936 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317985)))

(declare-fun b!709224 () Bool)

(declare-fun e!399131 () Bool)

(assert (=> b!709224 (= e!399130 e!399131)))

(declare-fun res!472907 () Bool)

(assert (=> b!709224 (=> res!472907 e!399131)))

(assert (=> b!709224 (= res!472907 (= (h!14455 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709225 () Bool)

(assert (=> b!709225 (= e!399131 (contains!3936 (t!19699 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96947 res!472906) b!709224))

(assert (= (and b!709224 (not res!472907)) b!709225))

(assert (=> d!96947 m!665911))

(declare-fun m!666059 () Bool)

(assert (=> d!96947 m!666059))

(declare-fun m!666061 () Bool)

(assert (=> b!709225 m!666061))

(assert (=> b!708912 d!96947))

(declare-fun d!96951 () Bool)

(declare-fun res!472912 () Bool)

(declare-fun e!399134 () Bool)

(assert (=> d!96951 (=> res!472912 e!399134)))

(assert (=> d!96951 (= res!472912 ((_ is Nil!13411) ($colon$colon!508 newAcc!49 (select (arr!19334 a!3591) from!2969))))))

(assert (=> d!96951 (= (noDuplicate!1205 ($colon$colon!508 newAcc!49 (select (arr!19334 a!3591) from!2969))) e!399134)))

(declare-fun b!709229 () Bool)

(declare-fun e!399136 () Bool)

(assert (=> b!709229 (= e!399134 e!399136)))

(declare-fun res!472913 () Bool)

(assert (=> b!709229 (=> (not res!472913) (not e!399136))))

(assert (=> b!709229 (= res!472913 (not (contains!3936 (t!19699 ($colon$colon!508 newAcc!49 (select (arr!19334 a!3591) from!2969))) (h!14455 ($colon$colon!508 newAcc!49 (select (arr!19334 a!3591) from!2969))))))))

(declare-fun b!709231 () Bool)

(assert (=> b!709231 (= e!399136 (noDuplicate!1205 (t!19699 ($colon$colon!508 newAcc!49 (select (arr!19334 a!3591) from!2969)))))))

(assert (= (and d!96951 (not res!472912)) b!709229))

(assert (= (and b!709229 res!472913) b!709231))

(declare-fun m!666069 () Bool)

(assert (=> b!709229 m!666069))

(declare-fun m!666073 () Bool)

(assert (=> b!709231 m!666073))

(assert (=> b!708923 d!96951))

(declare-fun d!96957 () Bool)

(assert (=> d!96957 (= ($colon$colon!508 newAcc!49 (select (arr!19334 a!3591) from!2969)) (Cons!13410 (select (arr!19334 a!3591) from!2969) newAcc!49))))

(assert (=> b!708923 d!96957))

(declare-fun d!96961 () Bool)

(declare-fun res!472918 () Bool)

(declare-fun e!399142 () Bool)

(assert (=> d!96961 (=> res!472918 e!399142)))

(assert (=> d!96961 (= res!472918 ((_ is Nil!13411) acc!652))))

(assert (=> d!96961 (= (noDuplicate!1205 acc!652) e!399142)))

(declare-fun b!709236 () Bool)

(declare-fun e!399143 () Bool)

(assert (=> b!709236 (= e!399142 e!399143)))

(declare-fun res!472919 () Bool)

(assert (=> b!709236 (=> (not res!472919) (not e!399143))))

(assert (=> b!709236 (= res!472919 (not (contains!3936 (t!19699 acc!652) (h!14455 acc!652))))))

(declare-fun b!709237 () Bool)

(assert (=> b!709237 (= e!399143 (noDuplicate!1205 (t!19699 acc!652)))))

(assert (= (and d!96961 (not res!472918)) b!709236))

(assert (= (and b!709236 res!472919) b!709237))

(declare-fun m!666083 () Bool)

(assert (=> b!709236 m!666083))

(declare-fun m!666085 () Bool)

(assert (=> b!709237 m!666085))

(assert (=> b!708924 d!96961))

(declare-fun d!96965 () Bool)

(assert (=> d!96965 (= ($colon$colon!508 acc!652 (select (arr!19334 a!3591) from!2969)) (Cons!13410 (select (arr!19334 a!3591) from!2969) acc!652))))

(assert (=> b!708913 d!96965))

(check-sat (not bm!34405) (not b!709074) (not b!709119) (not b!709090) (not b!709066) (not d!96861) (not d!96947) (not b!709225) (not b!709181) (not b!709166) (not d!96859) (not b!709237) (not b!709185) (not bm!34411) (not b!709092) (not d!96895) (not b!709076) (not b!709220) (not b!709229) (not b!709174) (not b!709221) (not d!96867) (not b!709101) (not b!709068) (not d!96919) (not d!96899) (not b!709078) (not b!709236) (not b!709231) (not d!96869) (not d!96881) (not b!709175) (not b!709118) (not b!709123) (not b!709089) (not d!96863) (not b!709064))
(check-sat)
