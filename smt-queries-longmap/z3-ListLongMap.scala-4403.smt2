; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60580 () Bool)

(assert start!60580)

(declare-fun b!680749 () Bool)

(declare-fun res!446978 () Bool)

(declare-fun e!387772 () Bool)

(assert (=> b!680749 (=> (not res!446978) (not e!387772))))

(declare-datatypes ((array!39504 0))(
  ( (array!39505 (arr!18940 (Array (_ BitVec 32) (_ BitVec 64))) (size!19304 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39504)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680749 (= res!446978 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19304 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680750 () Bool)

(declare-fun res!446972 () Bool)

(assert (=> b!680750 (=> (not res!446972) (not e!387772))))

(declare-datatypes ((List!12981 0))(
  ( (Nil!12978) (Cons!12977 (h!14022 (_ BitVec 64)) (t!19212 List!12981)) )
))
(declare-fun acc!681 () List!12981)

(declare-fun contains!3558 (List!12981 (_ BitVec 64)) Bool)

(assert (=> b!680750 (= res!446972 (not (contains!3558 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680751 () Bool)

(declare-fun e!387774 () Bool)

(declare-fun lt!313144 () List!12981)

(assert (=> b!680751 (= e!387774 (not (contains!3558 lt!313144 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680752 () Bool)

(declare-fun e!387767 () Bool)

(assert (=> b!680752 (= e!387772 (not e!387767))))

(declare-fun res!446976 () Bool)

(assert (=> b!680752 (=> res!446976 e!387767)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680752 (= res!446976 (not (validKeyInArray!0 (select (arr!18940 a!3626) from!3004))))))

(declare-datatypes ((Unit!23878 0))(
  ( (Unit!23879) )
))
(declare-fun lt!313141 () Unit!23878)

(declare-fun e!387773 () Unit!23878)

(assert (=> b!680752 (= lt!313141 e!387773)))

(declare-fun c!77258 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680752 (= c!77258 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680752 (arrayContainsKey!0 (array!39505 (store (arr!18940 a!3626) i!1382 k0!2843) (size!19304 a!3626)) k0!2843 from!3004)))

(declare-fun b!680753 () Bool)

(declare-fun e!387766 () Bool)

(assert (=> b!680753 (= e!387766 (not (contains!3558 acc!681 k0!2843)))))

(declare-fun b!680754 () Bool)

(declare-fun res!446980 () Bool)

(assert (=> b!680754 (=> (not res!446980) (not e!387772))))

(declare-fun noDuplicate!805 (List!12981) Bool)

(assert (=> b!680754 (= res!446980 (noDuplicate!805 acc!681))))

(declare-fun b!680755 () Bool)

(declare-fun res!446971 () Bool)

(assert (=> b!680755 (=> (not res!446971) (not e!387772))))

(assert (=> b!680755 (= res!446971 (not (contains!3558 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680756 () Bool)

(declare-fun res!446982 () Bool)

(assert (=> b!680756 (=> (not res!446982) (not e!387772))))

(assert (=> b!680756 (= res!446982 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680757 () Bool)

(declare-fun res!446979 () Bool)

(assert (=> b!680757 (=> (not res!446979) (not e!387772))))

(assert (=> b!680757 (= res!446979 (validKeyInArray!0 k0!2843))))

(declare-fun b!680759 () Bool)

(declare-fun e!387771 () Bool)

(assert (=> b!680759 (= e!387767 e!387771)))

(declare-fun res!446973 () Bool)

(assert (=> b!680759 (=> res!446973 e!387771)))

(assert (=> b!680759 (= res!446973 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!309 (List!12981 (_ BitVec 64)) List!12981)

(assert (=> b!680759 (= lt!313144 ($colon$colon!309 acc!681 (select (arr!18940 a!3626) from!3004)))))

(declare-fun subseq!144 (List!12981 List!12981) Bool)

(assert (=> b!680759 (subseq!144 acc!681 acc!681)))

(declare-fun lt!313142 () Unit!23878)

(declare-fun lemmaListSubSeqRefl!0 (List!12981) Unit!23878)

(assert (=> b!680759 (= lt!313142 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680760 () Bool)

(assert (=> b!680760 (= e!387771 e!387774)))

(declare-fun res!446984 () Bool)

(assert (=> b!680760 (=> (not res!446984) (not e!387774))))

(assert (=> b!680760 (= res!446984 (not (contains!3558 lt!313144 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680761 () Bool)

(declare-fun res!446977 () Bool)

(assert (=> b!680761 (=> (not res!446977) (not e!387772))))

(declare-fun arrayNoDuplicates!0 (array!39504 (_ BitVec 32) List!12981) Bool)

(assert (=> b!680761 (= res!446977 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12978))))

(declare-fun b!680762 () Bool)

(declare-fun Unit!23880 () Unit!23878)

(assert (=> b!680762 (= e!387773 Unit!23880)))

(declare-fun b!680763 () Bool)

(declare-fun res!446970 () Bool)

(assert (=> b!680763 (=> (not res!446970) (not e!387772))))

(assert (=> b!680763 (= res!446970 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680764 () Bool)

(declare-fun res!446974 () Bool)

(assert (=> b!680764 (=> res!446974 e!387771)))

(assert (=> b!680764 (= res!446974 (not (noDuplicate!805 lt!313144)))))

(declare-fun b!680758 () Bool)

(declare-fun e!387770 () Bool)

(assert (=> b!680758 (= e!387770 (contains!3558 acc!681 k0!2843))))

(declare-fun res!446969 () Bool)

(assert (=> start!60580 (=> (not res!446969) (not e!387772))))

(assert (=> start!60580 (= res!446969 (and (bvslt (size!19304 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19304 a!3626))))))

(assert (=> start!60580 e!387772))

(assert (=> start!60580 true))

(declare-fun array_inv!14736 (array!39504) Bool)

(assert (=> start!60580 (array_inv!14736 a!3626)))

(declare-fun b!680765 () Bool)

(declare-fun res!446975 () Bool)

(assert (=> b!680765 (=> (not res!446975) (not e!387772))))

(assert (=> b!680765 (= res!446975 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19304 a!3626))))))

(declare-fun b!680766 () Bool)

(declare-fun Unit!23881 () Unit!23878)

(assert (=> b!680766 (= e!387773 Unit!23881)))

(declare-fun lt!313143 () Unit!23878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39504 (_ BitVec 64) (_ BitVec 32)) Unit!23878)

(assert (=> b!680766 (= lt!313143 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680766 false))

(declare-fun b!680767 () Bool)

(declare-fun res!446967 () Bool)

(assert (=> b!680767 (=> (not res!446967) (not e!387772))))

(declare-fun e!387769 () Bool)

(assert (=> b!680767 (= res!446967 e!387769)))

(declare-fun res!446983 () Bool)

(assert (=> b!680767 (=> res!446983 e!387769)))

(assert (=> b!680767 (= res!446983 e!387770)))

(declare-fun res!446981 () Bool)

(assert (=> b!680767 (=> (not res!446981) (not e!387770))))

(assert (=> b!680767 (= res!446981 (bvsgt from!3004 i!1382))))

(declare-fun b!680768 () Bool)

(assert (=> b!680768 (= e!387769 e!387766)))

(declare-fun res!446968 () Bool)

(assert (=> b!680768 (=> (not res!446968) (not e!387766))))

(assert (=> b!680768 (= res!446968 (bvsle from!3004 i!1382))))

(assert (= (and start!60580 res!446969) b!680754))

(assert (= (and b!680754 res!446980) b!680750))

(assert (= (and b!680750 res!446972) b!680755))

(assert (= (and b!680755 res!446971) b!680767))

(assert (= (and b!680767 res!446981) b!680758))

(assert (= (and b!680767 (not res!446983)) b!680768))

(assert (= (and b!680768 res!446968) b!680753))

(assert (= (and b!680767 res!446967) b!680761))

(assert (= (and b!680761 res!446977) b!680763))

(assert (= (and b!680763 res!446970) b!680765))

(assert (= (and b!680765 res!446975) b!680757))

(assert (= (and b!680757 res!446979) b!680756))

(assert (= (and b!680756 res!446982) b!680749))

(assert (= (and b!680749 res!446978) b!680752))

(assert (= (and b!680752 c!77258) b!680766))

(assert (= (and b!680752 (not c!77258)) b!680762))

(assert (= (and b!680752 (not res!446976)) b!680759))

(assert (= (and b!680759 (not res!446973)) b!680764))

(assert (= (and b!680764 (not res!446974)) b!680760))

(assert (= (and b!680760 res!446984) b!680751))

(declare-fun m!645737 () Bool)

(assert (=> b!680764 m!645737))

(declare-fun m!645739 () Bool)

(assert (=> b!680757 m!645739))

(declare-fun m!645741 () Bool)

(assert (=> b!680766 m!645741))

(declare-fun m!645743 () Bool)

(assert (=> b!680751 m!645743))

(declare-fun m!645745 () Bool)

(assert (=> b!680759 m!645745))

(assert (=> b!680759 m!645745))

(declare-fun m!645747 () Bool)

(assert (=> b!680759 m!645747))

(declare-fun m!645749 () Bool)

(assert (=> b!680759 m!645749))

(declare-fun m!645751 () Bool)

(assert (=> b!680759 m!645751))

(declare-fun m!645753 () Bool)

(assert (=> b!680755 m!645753))

(declare-fun m!645755 () Bool)

(assert (=> b!680756 m!645755))

(declare-fun m!645757 () Bool)

(assert (=> b!680753 m!645757))

(assert (=> b!680758 m!645757))

(declare-fun m!645759 () Bool)

(assert (=> b!680750 m!645759))

(declare-fun m!645761 () Bool)

(assert (=> b!680763 m!645761))

(declare-fun m!645763 () Bool)

(assert (=> start!60580 m!645763))

(declare-fun m!645765 () Bool)

(assert (=> b!680754 m!645765))

(declare-fun m!645767 () Bool)

(assert (=> b!680760 m!645767))

(declare-fun m!645769 () Bool)

(assert (=> b!680761 m!645769))

(assert (=> b!680752 m!645745))

(declare-fun m!645771 () Bool)

(assert (=> b!680752 m!645771))

(declare-fun m!645773 () Bool)

(assert (=> b!680752 m!645773))

(assert (=> b!680752 m!645745))

(declare-fun m!645775 () Bool)

(assert (=> b!680752 m!645775))

(declare-fun m!645777 () Bool)

(assert (=> b!680752 m!645777))

(check-sat (not b!680754) (not b!680759) (not b!680766) (not b!680756) (not b!680750) (not start!60580) (not b!680758) (not b!680763) (not b!680751) (not b!680760) (not b!680753) (not b!680752) (not b!680761) (not b!680755) (not b!680764) (not b!680757))
(check-sat)
(get-model)

(declare-fun d!93683 () Bool)

(declare-fun lt!313166 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!271 (List!12981) (InoxSet (_ BitVec 64)))

(assert (=> d!93683 (= lt!313166 (select (content!271 acc!681) k0!2843))))

(declare-fun e!387828 () Bool)

(assert (=> d!93683 (= lt!313166 e!387828)))

(declare-fun res!447065 () Bool)

(assert (=> d!93683 (=> (not res!447065) (not e!387828))))

(get-info :version)

(assert (=> d!93683 (= res!447065 ((_ is Cons!12977) acc!681))))

(assert (=> d!93683 (= (contains!3558 acc!681 k0!2843) lt!313166)))

(declare-fun b!680855 () Bool)

(declare-fun e!387829 () Bool)

(assert (=> b!680855 (= e!387828 e!387829)))

(declare-fun res!447066 () Bool)

(assert (=> b!680855 (=> res!447066 e!387829)))

(assert (=> b!680855 (= res!447066 (= (h!14022 acc!681) k0!2843))))

(declare-fun b!680856 () Bool)

(assert (=> b!680856 (= e!387829 (contains!3558 (t!19212 acc!681) k0!2843))))

(assert (= (and d!93683 res!447065) b!680855))

(assert (= (and b!680855 (not res!447066)) b!680856))

(declare-fun m!645839 () Bool)

(assert (=> d!93683 m!645839))

(declare-fun m!645841 () Bool)

(assert (=> d!93683 m!645841))

(declare-fun m!645843 () Bool)

(assert (=> b!680856 m!645843))

(assert (=> b!680753 d!93683))

(declare-fun d!93691 () Bool)

(declare-fun res!447077 () Bool)

(declare-fun e!387840 () Bool)

(assert (=> d!93691 (=> res!447077 e!387840)))

(assert (=> d!93691 (= res!447077 ((_ is Nil!12978) lt!313144))))

(assert (=> d!93691 (= (noDuplicate!805 lt!313144) e!387840)))

(declare-fun b!680867 () Bool)

(declare-fun e!387841 () Bool)

(assert (=> b!680867 (= e!387840 e!387841)))

(declare-fun res!447078 () Bool)

(assert (=> b!680867 (=> (not res!447078) (not e!387841))))

(assert (=> b!680867 (= res!447078 (not (contains!3558 (t!19212 lt!313144) (h!14022 lt!313144))))))

(declare-fun b!680868 () Bool)

(assert (=> b!680868 (= e!387841 (noDuplicate!805 (t!19212 lt!313144)))))

(assert (= (and d!93691 (not res!447077)) b!680867))

(assert (= (and b!680867 res!447078) b!680868))

(declare-fun m!645853 () Bool)

(assert (=> b!680867 m!645853))

(declare-fun m!645855 () Bool)

(assert (=> b!680868 m!645855))

(assert (=> b!680764 d!93691))

(declare-fun d!93701 () Bool)

(declare-fun res!447079 () Bool)

(declare-fun e!387842 () Bool)

(assert (=> d!93701 (=> res!447079 e!387842)))

(assert (=> d!93701 (= res!447079 ((_ is Nil!12978) acc!681))))

(assert (=> d!93701 (= (noDuplicate!805 acc!681) e!387842)))

(declare-fun b!680869 () Bool)

(declare-fun e!387843 () Bool)

(assert (=> b!680869 (= e!387842 e!387843)))

(declare-fun res!447080 () Bool)

(assert (=> b!680869 (=> (not res!447080) (not e!387843))))

(assert (=> b!680869 (= res!447080 (not (contains!3558 (t!19212 acc!681) (h!14022 acc!681))))))

(declare-fun b!680870 () Bool)

(assert (=> b!680870 (= e!387843 (noDuplicate!805 (t!19212 acc!681)))))

(assert (= (and d!93701 (not res!447079)) b!680869))

(assert (= (and b!680869 res!447080) b!680870))

(declare-fun m!645857 () Bool)

(assert (=> b!680869 m!645857))

(declare-fun m!645859 () Bool)

(assert (=> b!680870 m!645859))

(assert (=> b!680754 d!93701))

(declare-fun d!93703 () Bool)

(assert (=> d!93703 (= (validKeyInArray!0 (select (arr!18940 a!3626) from!3004)) (and (not (= (select (arr!18940 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18940 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680752 d!93703))

(declare-fun d!93705 () Bool)

(declare-fun res!447099 () Bool)

(declare-fun e!387862 () Bool)

(assert (=> d!93705 (=> res!447099 e!387862)))

(assert (=> d!93705 (= res!447099 (= (select (arr!18940 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93705 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!387862)))

(declare-fun b!680889 () Bool)

(declare-fun e!387863 () Bool)

(assert (=> b!680889 (= e!387862 e!387863)))

(declare-fun res!447100 () Bool)

(assert (=> b!680889 (=> (not res!447100) (not e!387863))))

(assert (=> b!680889 (= res!447100 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19304 a!3626)))))

(declare-fun b!680890 () Bool)

(assert (=> b!680890 (= e!387863 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93705 (not res!447099)) b!680889))

(assert (= (and b!680889 res!447100) b!680890))

(declare-fun m!645873 () Bool)

(assert (=> d!93705 m!645873))

(declare-fun m!645875 () Bool)

(assert (=> b!680890 m!645875))

(assert (=> b!680752 d!93705))

(declare-fun d!93713 () Bool)

(declare-fun res!447105 () Bool)

(declare-fun e!387868 () Bool)

(assert (=> d!93713 (=> res!447105 e!387868)))

(assert (=> d!93713 (= res!447105 (= (select (arr!18940 (array!39505 (store (arr!18940 a!3626) i!1382 k0!2843) (size!19304 a!3626))) from!3004) k0!2843))))

(assert (=> d!93713 (= (arrayContainsKey!0 (array!39505 (store (arr!18940 a!3626) i!1382 k0!2843) (size!19304 a!3626)) k0!2843 from!3004) e!387868)))

(declare-fun b!680895 () Bool)

(declare-fun e!387869 () Bool)

(assert (=> b!680895 (= e!387868 e!387869)))

(declare-fun res!447106 () Bool)

(assert (=> b!680895 (=> (not res!447106) (not e!387869))))

(assert (=> b!680895 (= res!447106 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19304 (array!39505 (store (arr!18940 a!3626) i!1382 k0!2843) (size!19304 a!3626)))))))

(declare-fun b!680896 () Bool)

(assert (=> b!680896 (= e!387869 (arrayContainsKey!0 (array!39505 (store (arr!18940 a!3626) i!1382 k0!2843) (size!19304 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93713 (not res!447105)) b!680895))

(assert (= (and b!680895 res!447106) b!680896))

(declare-fun m!645877 () Bool)

(assert (=> d!93713 m!645877))

(declare-fun m!645879 () Bool)

(assert (=> b!680896 m!645879))

(assert (=> b!680752 d!93713))

(declare-fun b!680938 () Bool)

(declare-fun e!387907 () Bool)

(declare-fun e!387909 () Bool)

(assert (=> b!680938 (= e!387907 e!387909)))

(declare-fun res!447138 () Bool)

(assert (=> b!680938 (=> (not res!447138) (not e!387909))))

(declare-fun e!387908 () Bool)

(assert (=> b!680938 (= res!447138 (not e!387908))))

(declare-fun res!447140 () Bool)

(assert (=> b!680938 (=> (not res!447140) (not e!387908))))

(assert (=> b!680938 (= res!447140 (validKeyInArray!0 (select (arr!18940 a!3626) from!3004)))))

(declare-fun b!680939 () Bool)

(declare-fun e!387906 () Bool)

(declare-fun call!33956 () Bool)

(assert (=> b!680939 (= e!387906 call!33956)))

(declare-fun d!93715 () Bool)

(declare-fun res!447139 () Bool)

(assert (=> d!93715 (=> res!447139 e!387907)))

(assert (=> d!93715 (= res!447139 (bvsge from!3004 (size!19304 a!3626)))))

(assert (=> d!93715 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!387907)))

(declare-fun b!680940 () Bool)

(assert (=> b!680940 (= e!387909 e!387906)))

(declare-fun c!77267 () Bool)

(assert (=> b!680940 (= c!77267 (validKeyInArray!0 (select (arr!18940 a!3626) from!3004)))))

(declare-fun b!680941 () Bool)

(assert (=> b!680941 (= e!387908 (contains!3558 acc!681 (select (arr!18940 a!3626) from!3004)))))

(declare-fun bm!33953 () Bool)

(assert (=> bm!33953 (= call!33956 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77267 (Cons!12977 (select (arr!18940 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!680942 () Bool)

(assert (=> b!680942 (= e!387906 call!33956)))

(assert (= (and d!93715 (not res!447139)) b!680938))

(assert (= (and b!680938 res!447140) b!680941))

(assert (= (and b!680938 res!447138) b!680940))

(assert (= (and b!680940 c!77267) b!680939))

(assert (= (and b!680940 (not c!77267)) b!680942))

(assert (= (or b!680939 b!680942) bm!33953))

(assert (=> b!680938 m!645745))

(assert (=> b!680938 m!645745))

(assert (=> b!680938 m!645775))

(assert (=> b!680940 m!645745))

(assert (=> b!680940 m!645745))

(assert (=> b!680940 m!645775))

(assert (=> b!680941 m!645745))

(assert (=> b!680941 m!645745))

(declare-fun m!645913 () Bool)

(assert (=> b!680941 m!645913))

(assert (=> bm!33953 m!645745))

(declare-fun m!645915 () Bool)

(assert (=> bm!33953 m!645915))

(assert (=> b!680763 d!93715))

(declare-fun d!93733 () Bool)

(declare-fun res!447141 () Bool)

(declare-fun e!387910 () Bool)

(assert (=> d!93733 (=> res!447141 e!387910)))

(assert (=> d!93733 (= res!447141 (= (select (arr!18940 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93733 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!387910)))

(declare-fun b!680943 () Bool)

(declare-fun e!387911 () Bool)

(assert (=> b!680943 (= e!387910 e!387911)))

(declare-fun res!447142 () Bool)

(assert (=> b!680943 (=> (not res!447142) (not e!387911))))

(assert (=> b!680943 (= res!447142 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19304 a!3626)))))

(declare-fun b!680944 () Bool)

(assert (=> b!680944 (= e!387911 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93733 (not res!447141)) b!680943))

(assert (= (and b!680943 res!447142) b!680944))

(declare-fun m!645917 () Bool)

(assert (=> d!93733 m!645917))

(declare-fun m!645919 () Bool)

(assert (=> b!680944 m!645919))

(assert (=> b!680756 d!93733))

(declare-fun d!93737 () Bool)

(declare-fun lt!313176 () Bool)

(assert (=> d!93737 (= lt!313176 (select (content!271 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387914 () Bool)

(assert (=> d!93737 (= lt!313176 e!387914)))

(declare-fun res!447145 () Bool)

(assert (=> d!93737 (=> (not res!447145) (not e!387914))))

(assert (=> d!93737 (= res!447145 ((_ is Cons!12977) acc!681))))

(assert (=> d!93737 (= (contains!3558 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313176)))

(declare-fun b!680947 () Bool)

(declare-fun e!387915 () Bool)

(assert (=> b!680947 (= e!387914 e!387915)))

(declare-fun res!447146 () Bool)

(assert (=> b!680947 (=> res!447146 e!387915)))

(assert (=> b!680947 (= res!447146 (= (h!14022 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680948 () Bool)

(assert (=> b!680948 (= e!387915 (contains!3558 (t!19212 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93737 res!447145) b!680947))

(assert (= (and b!680947 (not res!447146)) b!680948))

(assert (=> d!93737 m!645839))

(declare-fun m!645925 () Bool)

(assert (=> d!93737 m!645925))

(declare-fun m!645927 () Bool)

(assert (=> b!680948 m!645927))

(assert (=> b!680755 d!93737))

(declare-fun d!93741 () Bool)

(assert (=> d!93741 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313181 () Unit!23878)

(declare-fun choose!13 (array!39504 (_ BitVec 64) (_ BitVec 32)) Unit!23878)

(assert (=> d!93741 (= lt!313181 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93741 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93741 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313181)))

(declare-fun bs!19989 () Bool)

(assert (= bs!19989 d!93741))

(assert (=> bs!19989 m!645755))

(declare-fun m!645947 () Bool)

(assert (=> bs!19989 m!645947))

(assert (=> b!680766 d!93741))

(declare-fun d!93755 () Bool)

(assert (=> d!93755 (= ($colon$colon!309 acc!681 (select (arr!18940 a!3626) from!3004)) (Cons!12977 (select (arr!18940 a!3626) from!3004) acc!681))))

(assert (=> b!680759 d!93755))

(declare-fun b!680988 () Bool)

(declare-fun e!387955 () Bool)

(assert (=> b!680988 (= e!387955 (subseq!144 (t!19212 acc!681) (t!19212 acc!681)))))

(declare-fun b!680986 () Bool)

(declare-fun e!387954 () Bool)

(declare-fun e!387953 () Bool)

(assert (=> b!680986 (= e!387954 e!387953)))

(declare-fun res!447182 () Bool)

(assert (=> b!680986 (=> (not res!447182) (not e!387953))))

(assert (=> b!680986 (= res!447182 ((_ is Cons!12977) acc!681))))

(declare-fun b!680989 () Bool)

(declare-fun e!387952 () Bool)

(assert (=> b!680989 (= e!387952 (subseq!144 acc!681 (t!19212 acc!681)))))

(declare-fun d!93761 () Bool)

(declare-fun res!447185 () Bool)

(assert (=> d!93761 (=> res!447185 e!387954)))

(assert (=> d!93761 (= res!447185 ((_ is Nil!12978) acc!681))))

(assert (=> d!93761 (= (subseq!144 acc!681 acc!681) e!387954)))

(declare-fun b!680987 () Bool)

(assert (=> b!680987 (= e!387953 e!387952)))

(declare-fun res!447183 () Bool)

(assert (=> b!680987 (=> res!447183 e!387952)))

(assert (=> b!680987 (= res!447183 e!387955)))

(declare-fun res!447184 () Bool)

(assert (=> b!680987 (=> (not res!447184) (not e!387955))))

(assert (=> b!680987 (= res!447184 (= (h!14022 acc!681) (h!14022 acc!681)))))

(assert (= (and d!93761 (not res!447185)) b!680986))

(assert (= (and b!680986 res!447182) b!680987))

(assert (= (and b!680987 res!447184) b!680988))

(assert (= (and b!680987 (not res!447183)) b!680989))

(declare-fun m!645969 () Bool)

(assert (=> b!680988 m!645969))

(declare-fun m!645971 () Bool)

(assert (=> b!680989 m!645971))

(assert (=> b!680759 d!93761))

(declare-fun d!93771 () Bool)

(assert (=> d!93771 (subseq!144 acc!681 acc!681)))

(declare-fun lt!313189 () Unit!23878)

(declare-fun choose!36 (List!12981) Unit!23878)

(assert (=> d!93771 (= lt!313189 (choose!36 acc!681))))

(assert (=> d!93771 (= (lemmaListSubSeqRefl!0 acc!681) lt!313189)))

(declare-fun bs!19991 () Bool)

(assert (= bs!19991 d!93771))

(assert (=> bs!19991 m!645749))

(declare-fun m!645973 () Bool)

(assert (=> bs!19991 m!645973))

(assert (=> b!680759 d!93771))

(declare-fun d!93773 () Bool)

(assert (=> d!93773 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680757 d!93773))

(assert (=> b!680758 d!93683))

(declare-fun d!93775 () Bool)

(assert (=> d!93775 (= (array_inv!14736 a!3626) (bvsge (size!19304 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60580 d!93775))

(declare-fun b!680990 () Bool)

(declare-fun e!387957 () Bool)

(declare-fun e!387959 () Bool)

(assert (=> b!680990 (= e!387957 e!387959)))

(declare-fun res!447186 () Bool)

(assert (=> b!680990 (=> (not res!447186) (not e!387959))))

(declare-fun e!387958 () Bool)

(assert (=> b!680990 (= res!447186 (not e!387958))))

(declare-fun res!447188 () Bool)

(assert (=> b!680990 (=> (not res!447188) (not e!387958))))

(assert (=> b!680990 (= res!447188 (validKeyInArray!0 (select (arr!18940 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680991 () Bool)

(declare-fun e!387956 () Bool)

(declare-fun call!33958 () Bool)

(assert (=> b!680991 (= e!387956 call!33958)))

(declare-fun d!93777 () Bool)

(declare-fun res!447187 () Bool)

(assert (=> d!93777 (=> res!447187 e!387957)))

(assert (=> d!93777 (= res!447187 (bvsge #b00000000000000000000000000000000 (size!19304 a!3626)))))

(assert (=> d!93777 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12978) e!387957)))

(declare-fun b!680992 () Bool)

(assert (=> b!680992 (= e!387959 e!387956)))

(declare-fun c!77269 () Bool)

(assert (=> b!680992 (= c!77269 (validKeyInArray!0 (select (arr!18940 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680993 () Bool)

(assert (=> b!680993 (= e!387958 (contains!3558 Nil!12978 (select (arr!18940 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!33955 () Bool)

(assert (=> bm!33955 (= call!33958 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77269 (Cons!12977 (select (arr!18940 a!3626) #b00000000000000000000000000000000) Nil!12978) Nil!12978)))))

(declare-fun b!680994 () Bool)

(assert (=> b!680994 (= e!387956 call!33958)))

(assert (= (and d!93777 (not res!447187)) b!680990))

(assert (= (and b!680990 res!447188) b!680993))

(assert (= (and b!680990 res!447186) b!680992))

(assert (= (and b!680992 c!77269) b!680991))

(assert (= (and b!680992 (not c!77269)) b!680994))

(assert (= (or b!680991 b!680994) bm!33955))

(assert (=> b!680990 m!645917))

(assert (=> b!680990 m!645917))

(declare-fun m!645975 () Bool)

(assert (=> b!680990 m!645975))

(assert (=> b!680992 m!645917))

(assert (=> b!680992 m!645917))

(assert (=> b!680992 m!645975))

(assert (=> b!680993 m!645917))

(assert (=> b!680993 m!645917))

(declare-fun m!645977 () Bool)

(assert (=> b!680993 m!645977))

(assert (=> bm!33955 m!645917))

(declare-fun m!645979 () Bool)

(assert (=> bm!33955 m!645979))

(assert (=> b!680761 d!93777))

(declare-fun d!93779 () Bool)

(declare-fun lt!313190 () Bool)

(assert (=> d!93779 (= lt!313190 (select (content!271 lt!313144) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387968 () Bool)

(assert (=> d!93779 (= lt!313190 e!387968)))

(declare-fun res!447195 () Bool)

(assert (=> d!93779 (=> (not res!447195) (not e!387968))))

(assert (=> d!93779 (= res!447195 ((_ is Cons!12977) lt!313144))))

(assert (=> d!93779 (= (contains!3558 lt!313144 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313190)))

(declare-fun b!681005 () Bool)

(declare-fun e!387969 () Bool)

(assert (=> b!681005 (= e!387968 e!387969)))

(declare-fun res!447196 () Bool)

(assert (=> b!681005 (=> res!447196 e!387969)))

(assert (=> b!681005 (= res!447196 (= (h!14022 lt!313144) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681006 () Bool)

(assert (=> b!681006 (= e!387969 (contains!3558 (t!19212 lt!313144) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93779 res!447195) b!681005))

(assert (= (and b!681005 (not res!447196)) b!681006))

(declare-fun m!645981 () Bool)

(assert (=> d!93779 m!645981))

(declare-fun m!645983 () Bool)

(assert (=> d!93779 m!645983))

(declare-fun m!645985 () Bool)

(assert (=> b!681006 m!645985))

(assert (=> b!680751 d!93779))

(declare-fun d!93781 () Bool)

(declare-fun lt!313191 () Bool)

(assert (=> d!93781 (= lt!313191 (select (content!271 lt!313144) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387970 () Bool)

(assert (=> d!93781 (= lt!313191 e!387970)))

(declare-fun res!447197 () Bool)

(assert (=> d!93781 (=> (not res!447197) (not e!387970))))

(assert (=> d!93781 (= res!447197 ((_ is Cons!12977) lt!313144))))

(assert (=> d!93781 (= (contains!3558 lt!313144 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313191)))

(declare-fun b!681007 () Bool)

(declare-fun e!387971 () Bool)

(assert (=> b!681007 (= e!387970 e!387971)))

(declare-fun res!447198 () Bool)

(assert (=> b!681007 (=> res!447198 e!387971)))

(assert (=> b!681007 (= res!447198 (= (h!14022 lt!313144) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681008 () Bool)

(assert (=> b!681008 (= e!387971 (contains!3558 (t!19212 lt!313144) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93781 res!447197) b!681007))

(assert (= (and b!681007 (not res!447198)) b!681008))

(assert (=> d!93781 m!645981))

(declare-fun m!645987 () Bool)

(assert (=> d!93781 m!645987))

(declare-fun m!645989 () Bool)

(assert (=> b!681008 m!645989))

(assert (=> b!680760 d!93781))

(declare-fun d!93783 () Bool)

(declare-fun lt!313192 () Bool)

(assert (=> d!93783 (= lt!313192 (select (content!271 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387972 () Bool)

(assert (=> d!93783 (= lt!313192 e!387972)))

(declare-fun res!447199 () Bool)

(assert (=> d!93783 (=> (not res!447199) (not e!387972))))

(assert (=> d!93783 (= res!447199 ((_ is Cons!12977) acc!681))))

(assert (=> d!93783 (= (contains!3558 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313192)))

(declare-fun b!681009 () Bool)

(declare-fun e!387973 () Bool)

(assert (=> b!681009 (= e!387972 e!387973)))

(declare-fun res!447200 () Bool)

(assert (=> b!681009 (=> res!447200 e!387973)))

(assert (=> b!681009 (= res!447200 (= (h!14022 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681010 () Bool)

(assert (=> b!681010 (= e!387973 (contains!3558 (t!19212 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93783 res!447199) b!681009))

(assert (= (and b!681009 (not res!447200)) b!681010))

(assert (=> d!93783 m!645839))

(declare-fun m!645991 () Bool)

(assert (=> d!93783 m!645991))

(declare-fun m!645993 () Bool)

(assert (=> b!681010 m!645993))

(assert (=> b!680750 d!93783))

(check-sat (not b!680870) (not b!680938) (not b!680896) (not b!681006) (not b!680993) (not b!680869) (not b!680944) (not b!680890) (not bm!33955) (not d!93741) (not d!93683) (not b!681008) (not b!680948) (not b!680989) (not b!680868) (not b!680940) (not d!93781) (not d!93737) (not b!680988) (not b!681010) (not bm!33953) (not b!680867) (not b!680992) (not d!93771) (not b!680990) (not d!93779) (not b!680856) (not d!93783) (not b!680941))
(check-sat)
