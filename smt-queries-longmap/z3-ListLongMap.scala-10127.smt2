; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119552 () Bool)

(assert start!119552)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95309 0))(
  ( (array!95310 (arr!46015 (Array (_ BitVec 32) (_ BitVec 64))) (size!46566 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95309)

(declare-fun b!1392660 () Bool)

(declare-fun e!788713 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10235 0))(
  ( (MissingZero!10235 (index!43311 (_ BitVec 32))) (Found!10235 (index!43312 (_ BitVec 32))) (Intermediate!10235 (undefined!11047 Bool) (index!43313 (_ BitVec 32)) (x!125144 (_ BitVec 32))) (Undefined!10235) (MissingVacant!10235 (index!43314 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95309 (_ BitVec 32)) SeekEntryResult!10235)

(assert (=> b!1392660 (= e!788713 (= (seekEntryOrOpen!0 (select (arr!46015 a!2901) j!112) a!2901 mask!2840) (Found!10235 j!112)))))

(declare-fun b!1392661 () Bool)

(declare-fun res!931847 () Bool)

(declare-fun e!788714 () Bool)

(assert (=> b!1392661 (=> (not res!931847) (not e!788714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392661 (= res!931847 (validKeyInArray!0 (select (arr!46015 a!2901) j!112)))))

(declare-fun b!1392662 () Bool)

(declare-fun res!931843 () Bool)

(assert (=> b!1392662 (=> (not res!931843) (not e!788714))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392662 (= res!931843 (validKeyInArray!0 (select (arr!46015 a!2901) i!1037)))))

(declare-fun b!1392663 () Bool)

(declare-fun res!931844 () Bool)

(assert (=> b!1392663 (=> (not res!931844) (not e!788714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95309 (_ BitVec 32)) Bool)

(assert (=> b!1392663 (= res!931844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392664 () Bool)

(declare-fun res!931848 () Bool)

(assert (=> b!1392664 (=> (not res!931848) (not e!788714))))

(declare-datatypes ((List!32521 0))(
  ( (Nil!32518) (Cons!32517 (h!33749 (_ BitVec 64)) (t!47207 List!32521)) )
))
(declare-fun arrayNoDuplicates!0 (array!95309 (_ BitVec 32) List!32521) Bool)

(assert (=> b!1392664 (= res!931848 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32518))))

(declare-fun b!1392665 () Bool)

(declare-fun res!931846 () Bool)

(assert (=> b!1392665 (=> (not res!931846) (not e!788714))))

(assert (=> b!1392665 (= res!931846 (and (= (size!46566 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46566 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46566 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!931845 () Bool)

(assert (=> start!119552 (=> (not res!931845) (not e!788714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119552 (= res!931845 (validMask!0 mask!2840))))

(assert (=> start!119552 e!788714))

(assert (=> start!119552 true))

(declare-fun array_inv!35296 (array!95309) Bool)

(assert (=> start!119552 (array_inv!35296 a!2901)))

(declare-fun b!1392666 () Bool)

(declare-fun lt!611626 () SeekEntryResult!10235)

(get-info :version)

(assert (=> b!1392666 (= e!788714 (not (or (not ((_ is Intermediate!10235) lt!611626)) (undefined!11047 lt!611626) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111))))))

(assert (=> b!1392666 e!788713))

(declare-fun res!931849 () Bool)

(assert (=> b!1392666 (=> (not res!931849) (not e!788713))))

(assert (=> b!1392666 (= res!931849 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46501 0))(
  ( (Unit!46502) )
))
(declare-fun lt!611627 () Unit!46501)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46501)

(assert (=> b!1392666 (= lt!611627 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95309 (_ BitVec 32)) SeekEntryResult!10235)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392666 (= lt!611626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46015 a!2901) j!112) mask!2840) (select (arr!46015 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119552 res!931845) b!1392665))

(assert (= (and b!1392665 res!931846) b!1392662))

(assert (= (and b!1392662 res!931843) b!1392661))

(assert (= (and b!1392661 res!931847) b!1392663))

(assert (= (and b!1392663 res!931844) b!1392664))

(assert (= (and b!1392664 res!931848) b!1392666))

(assert (= (and b!1392666 res!931849) b!1392660))

(declare-fun m!1278691 () Bool)

(assert (=> b!1392662 m!1278691))

(assert (=> b!1392662 m!1278691))

(declare-fun m!1278693 () Bool)

(assert (=> b!1392662 m!1278693))

(declare-fun m!1278695 () Bool)

(assert (=> b!1392666 m!1278695))

(declare-fun m!1278697 () Bool)

(assert (=> b!1392666 m!1278697))

(assert (=> b!1392666 m!1278695))

(declare-fun m!1278699 () Bool)

(assert (=> b!1392666 m!1278699))

(assert (=> b!1392666 m!1278697))

(assert (=> b!1392666 m!1278695))

(declare-fun m!1278701 () Bool)

(assert (=> b!1392666 m!1278701))

(declare-fun m!1278703 () Bool)

(assert (=> b!1392666 m!1278703))

(assert (=> b!1392661 m!1278695))

(assert (=> b!1392661 m!1278695))

(declare-fun m!1278705 () Bool)

(assert (=> b!1392661 m!1278705))

(declare-fun m!1278707 () Bool)

(assert (=> b!1392663 m!1278707))

(declare-fun m!1278709 () Bool)

(assert (=> start!119552 m!1278709))

(declare-fun m!1278711 () Bool)

(assert (=> start!119552 m!1278711))

(declare-fun m!1278713 () Bool)

(assert (=> b!1392664 m!1278713))

(assert (=> b!1392660 m!1278695))

(assert (=> b!1392660 m!1278695))

(declare-fun m!1278715 () Bool)

(assert (=> b!1392660 m!1278715))

(check-sat (not b!1392662) (not b!1392664) (not b!1392663) (not b!1392666) (not b!1392661) (not start!119552) (not b!1392660))
(check-sat)
(get-model)

(declare-fun bm!66798 () Bool)

(declare-fun call!66801 () Bool)

(declare-fun c!129865 () Bool)

(assert (=> bm!66798 (= call!66801 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129865 (Cons!32517 (select (arr!46015 a!2901) #b00000000000000000000000000000000) Nil!32518) Nil!32518)))))

(declare-fun b!1392719 () Bool)

(declare-fun e!788744 () Bool)

(declare-fun e!788743 () Bool)

(assert (=> b!1392719 (= e!788744 e!788743)))

(assert (=> b!1392719 (= c!129865 (validKeyInArray!0 (select (arr!46015 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392720 () Bool)

(assert (=> b!1392720 (= e!788743 call!66801)))

(declare-fun d!150691 () Bool)

(declare-fun res!931898 () Bool)

(declare-fun e!788741 () Bool)

(assert (=> d!150691 (=> res!931898 e!788741)))

(assert (=> d!150691 (= res!931898 (bvsge #b00000000000000000000000000000000 (size!46566 a!2901)))))

(assert (=> d!150691 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32518) e!788741)))

(declare-fun b!1392721 () Bool)

(assert (=> b!1392721 (= e!788741 e!788744)))

(declare-fun res!931900 () Bool)

(assert (=> b!1392721 (=> (not res!931900) (not e!788744))))

(declare-fun e!788742 () Bool)

(assert (=> b!1392721 (= res!931900 (not e!788742))))

(declare-fun res!931899 () Bool)

(assert (=> b!1392721 (=> (not res!931899) (not e!788742))))

(assert (=> b!1392721 (= res!931899 (validKeyInArray!0 (select (arr!46015 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392722 () Bool)

(declare-fun contains!9808 (List!32521 (_ BitVec 64)) Bool)

(assert (=> b!1392722 (= e!788742 (contains!9808 Nil!32518 (select (arr!46015 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392723 () Bool)

(assert (=> b!1392723 (= e!788743 call!66801)))

(assert (= (and d!150691 (not res!931898)) b!1392721))

(assert (= (and b!1392721 res!931899) b!1392722))

(assert (= (and b!1392721 res!931900) b!1392719))

(assert (= (and b!1392719 c!129865) b!1392723))

(assert (= (and b!1392719 (not c!129865)) b!1392720))

(assert (= (or b!1392723 b!1392720) bm!66798))

(declare-fun m!1278769 () Bool)

(assert (=> bm!66798 m!1278769))

(declare-fun m!1278771 () Bool)

(assert (=> bm!66798 m!1278771))

(assert (=> b!1392719 m!1278769))

(assert (=> b!1392719 m!1278769))

(declare-fun m!1278773 () Bool)

(assert (=> b!1392719 m!1278773))

(assert (=> b!1392721 m!1278769))

(assert (=> b!1392721 m!1278769))

(assert (=> b!1392721 m!1278773))

(assert (=> b!1392722 m!1278769))

(assert (=> b!1392722 m!1278769))

(declare-fun m!1278775 () Bool)

(assert (=> b!1392722 m!1278775))

(assert (=> b!1392664 d!150691))

(declare-fun d!150697 () Bool)

(declare-fun lt!611667 () SeekEntryResult!10235)

(assert (=> d!150697 (and (or ((_ is Undefined!10235) lt!611667) (not ((_ is Found!10235) lt!611667)) (and (bvsge (index!43312 lt!611667) #b00000000000000000000000000000000) (bvslt (index!43312 lt!611667) (size!46566 a!2901)))) (or ((_ is Undefined!10235) lt!611667) ((_ is Found!10235) lt!611667) (not ((_ is MissingZero!10235) lt!611667)) (and (bvsge (index!43311 lt!611667) #b00000000000000000000000000000000) (bvslt (index!43311 lt!611667) (size!46566 a!2901)))) (or ((_ is Undefined!10235) lt!611667) ((_ is Found!10235) lt!611667) ((_ is MissingZero!10235) lt!611667) (not ((_ is MissingVacant!10235) lt!611667)) (and (bvsge (index!43314 lt!611667) #b00000000000000000000000000000000) (bvslt (index!43314 lt!611667) (size!46566 a!2901)))) (or ((_ is Undefined!10235) lt!611667) (ite ((_ is Found!10235) lt!611667) (= (select (arr!46015 a!2901) (index!43312 lt!611667)) (select (arr!46015 a!2901) j!112)) (ite ((_ is MissingZero!10235) lt!611667) (= (select (arr!46015 a!2901) (index!43311 lt!611667)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10235) lt!611667) (= (select (arr!46015 a!2901) (index!43314 lt!611667)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!788781 () SeekEntryResult!10235)

(assert (=> d!150697 (= lt!611667 e!788781)))

(declare-fun c!129882 () Bool)

(declare-fun lt!611669 () SeekEntryResult!10235)

(assert (=> d!150697 (= c!129882 (and ((_ is Intermediate!10235) lt!611669) (undefined!11047 lt!611669)))))

(assert (=> d!150697 (= lt!611669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46015 a!2901) j!112) mask!2840) (select (arr!46015 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150697 (validMask!0 mask!2840)))

(assert (=> d!150697 (= (seekEntryOrOpen!0 (select (arr!46015 a!2901) j!112) a!2901 mask!2840) lt!611667)))

(declare-fun b!1392775 () Bool)

(declare-fun e!788783 () SeekEntryResult!10235)

(assert (=> b!1392775 (= e!788781 e!788783)))

(declare-fun lt!611668 () (_ BitVec 64))

(assert (=> b!1392775 (= lt!611668 (select (arr!46015 a!2901) (index!43313 lt!611669)))))

(declare-fun c!129881 () Bool)

(assert (=> b!1392775 (= c!129881 (= lt!611668 (select (arr!46015 a!2901) j!112)))))

(declare-fun b!1392776 () Bool)

(assert (=> b!1392776 (= e!788783 (Found!10235 (index!43313 lt!611669)))))

(declare-fun e!788782 () SeekEntryResult!10235)

(declare-fun b!1392777 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95309 (_ BitVec 32)) SeekEntryResult!10235)

(assert (=> b!1392777 (= e!788782 (seekKeyOrZeroReturnVacant!0 (x!125144 lt!611669) (index!43313 lt!611669) (index!43313 lt!611669) (select (arr!46015 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392778 () Bool)

(assert (=> b!1392778 (= e!788782 (MissingZero!10235 (index!43313 lt!611669)))))

(declare-fun b!1392779 () Bool)

(assert (=> b!1392779 (= e!788781 Undefined!10235)))

(declare-fun b!1392780 () Bool)

(declare-fun c!129883 () Bool)

(assert (=> b!1392780 (= c!129883 (= lt!611668 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392780 (= e!788783 e!788782)))

(assert (= (and d!150697 c!129882) b!1392779))

(assert (= (and d!150697 (not c!129882)) b!1392775))

(assert (= (and b!1392775 c!129881) b!1392776))

(assert (= (and b!1392775 (not c!129881)) b!1392780))

(assert (= (and b!1392780 c!129883) b!1392778))

(assert (= (and b!1392780 (not c!129883)) b!1392777))

(declare-fun m!1278801 () Bool)

(assert (=> d!150697 m!1278801))

(assert (=> d!150697 m!1278709))

(assert (=> d!150697 m!1278697))

(assert (=> d!150697 m!1278695))

(assert (=> d!150697 m!1278701))

(declare-fun m!1278803 () Bool)

(assert (=> d!150697 m!1278803))

(assert (=> d!150697 m!1278695))

(assert (=> d!150697 m!1278697))

(declare-fun m!1278805 () Bool)

(assert (=> d!150697 m!1278805))

(declare-fun m!1278809 () Bool)

(assert (=> b!1392775 m!1278809))

(assert (=> b!1392777 m!1278695))

(declare-fun m!1278813 () Bool)

(assert (=> b!1392777 m!1278813))

(assert (=> b!1392660 d!150697))

(declare-fun b!1392793 () Bool)

(declare-fun e!788795 () Bool)

(declare-fun call!66814 () Bool)

(assert (=> b!1392793 (= e!788795 call!66814)))

(declare-fun b!1392794 () Bool)

(declare-fun e!788793 () Bool)

(assert (=> b!1392794 (= e!788793 call!66814)))

(declare-fun b!1392795 () Bool)

(declare-fun e!788794 () Bool)

(assert (=> b!1392795 (= e!788794 e!788795)))

(declare-fun c!129887 () Bool)

(assert (=> b!1392795 (= c!129887 (validKeyInArray!0 (select (arr!46015 a!2901) j!112)))))

(declare-fun d!150713 () Bool)

(declare-fun res!931928 () Bool)

(assert (=> d!150713 (=> res!931928 e!788794)))

(assert (=> d!150713 (= res!931928 (bvsge j!112 (size!46566 a!2901)))))

(assert (=> d!150713 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788794)))

(declare-fun bm!66811 () Bool)

(assert (=> bm!66811 (= call!66814 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392796 () Bool)

(assert (=> b!1392796 (= e!788795 e!788793)))

(declare-fun lt!611683 () (_ BitVec 64))

(assert (=> b!1392796 (= lt!611683 (select (arr!46015 a!2901) j!112))))

(declare-fun lt!611682 () Unit!46501)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95309 (_ BitVec 64) (_ BitVec 32)) Unit!46501)

(assert (=> b!1392796 (= lt!611682 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611683 j!112))))

(declare-fun arrayContainsKey!0 (array!95309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1392796 (arrayContainsKey!0 a!2901 lt!611683 #b00000000000000000000000000000000)))

(declare-fun lt!611684 () Unit!46501)

(assert (=> b!1392796 (= lt!611684 lt!611682)))

(declare-fun res!931929 () Bool)

(assert (=> b!1392796 (= res!931929 (= (seekEntryOrOpen!0 (select (arr!46015 a!2901) j!112) a!2901 mask!2840) (Found!10235 j!112)))))

(assert (=> b!1392796 (=> (not res!931929) (not e!788793))))

(assert (= (and d!150713 (not res!931928)) b!1392795))

(assert (= (and b!1392795 c!129887) b!1392796))

(assert (= (and b!1392795 (not c!129887)) b!1392793))

(assert (= (and b!1392796 res!931929) b!1392794))

(assert (= (or b!1392794 b!1392793) bm!66811))

(assert (=> b!1392795 m!1278695))

(assert (=> b!1392795 m!1278695))

(assert (=> b!1392795 m!1278705))

(declare-fun m!1278819 () Bool)

(assert (=> bm!66811 m!1278819))

(assert (=> b!1392796 m!1278695))

(declare-fun m!1278821 () Bool)

(assert (=> b!1392796 m!1278821))

(declare-fun m!1278823 () Bool)

(assert (=> b!1392796 m!1278823))

(assert (=> b!1392796 m!1278695))

(assert (=> b!1392796 m!1278715))

(assert (=> b!1392666 d!150713))

(declare-fun d!150719 () Bool)

(assert (=> d!150719 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611687 () Unit!46501)

(declare-fun choose!38 (array!95309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46501)

(assert (=> d!150719 (= lt!611687 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150719 (validMask!0 mask!2840)))

(assert (=> d!150719 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611687)))

(declare-fun bs!40491 () Bool)

(assert (= bs!40491 d!150719))

(assert (=> bs!40491 m!1278703))

(declare-fun m!1278825 () Bool)

(assert (=> bs!40491 m!1278825))

(assert (=> bs!40491 m!1278709))

(assert (=> b!1392666 d!150719))

(declare-fun e!788842 () SeekEntryResult!10235)

(declare-fun b!1392873 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392873 (= e!788842 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46015 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46015 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392874 () Bool)

(declare-fun e!788839 () SeekEntryResult!10235)

(assert (=> b!1392874 (= e!788839 e!788842)))

(declare-fun lt!611720 () (_ BitVec 64))

(declare-fun c!129914 () Bool)

(assert (=> b!1392874 (= c!129914 (or (= lt!611720 (select (arr!46015 a!2901) j!112)) (= (bvadd lt!611720 lt!611720) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1392875 () Bool)

(declare-fun lt!611719 () SeekEntryResult!10235)

(assert (=> b!1392875 (and (bvsge (index!43313 lt!611719) #b00000000000000000000000000000000) (bvslt (index!43313 lt!611719) (size!46566 a!2901)))))

(declare-fun res!931958 () Bool)

(assert (=> b!1392875 (= res!931958 (= (select (arr!46015 a!2901) (index!43313 lt!611719)) (select (arr!46015 a!2901) j!112)))))

(declare-fun e!788843 () Bool)

(assert (=> b!1392875 (=> res!931958 e!788843)))

(declare-fun e!788841 () Bool)

(assert (=> b!1392875 (= e!788841 e!788843)))

(declare-fun d!150721 () Bool)

(declare-fun e!788840 () Bool)

(assert (=> d!150721 e!788840))

(declare-fun c!129915 () Bool)

(assert (=> d!150721 (= c!129915 (and ((_ is Intermediate!10235) lt!611719) (undefined!11047 lt!611719)))))

(assert (=> d!150721 (= lt!611719 e!788839)))

(declare-fun c!129913 () Bool)

(assert (=> d!150721 (= c!129913 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150721 (= lt!611720 (select (arr!46015 a!2901) (toIndex!0 (select (arr!46015 a!2901) j!112) mask!2840)))))

(assert (=> d!150721 (validMask!0 mask!2840)))

(assert (=> d!150721 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46015 a!2901) j!112) mask!2840) (select (arr!46015 a!2901) j!112) a!2901 mask!2840) lt!611719)))

(declare-fun b!1392876 () Bool)

(assert (=> b!1392876 (= e!788840 (bvsge (x!125144 lt!611719) #b01111111111111111111111111111110))))

(declare-fun b!1392877 () Bool)

(assert (=> b!1392877 (= e!788839 (Intermediate!10235 true (toIndex!0 (select (arr!46015 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392878 () Bool)

(assert (=> b!1392878 (and (bvsge (index!43313 lt!611719) #b00000000000000000000000000000000) (bvslt (index!43313 lt!611719) (size!46566 a!2901)))))

(assert (=> b!1392878 (= e!788843 (= (select (arr!46015 a!2901) (index!43313 lt!611719)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1392879 () Bool)

(assert (=> b!1392879 (= e!788842 (Intermediate!10235 false (toIndex!0 (select (arr!46015 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392880 () Bool)

(assert (=> b!1392880 (= e!788840 e!788841)))

(declare-fun res!931959 () Bool)

(assert (=> b!1392880 (= res!931959 (and ((_ is Intermediate!10235) lt!611719) (not (undefined!11047 lt!611719)) (bvslt (x!125144 lt!611719) #b01111111111111111111111111111110) (bvsge (x!125144 lt!611719) #b00000000000000000000000000000000) (bvsge (x!125144 lt!611719) #b00000000000000000000000000000000)))))

(assert (=> b!1392880 (=> (not res!931959) (not e!788841))))

(declare-fun b!1392881 () Bool)

(assert (=> b!1392881 (and (bvsge (index!43313 lt!611719) #b00000000000000000000000000000000) (bvslt (index!43313 lt!611719) (size!46566 a!2901)))))

(declare-fun res!931960 () Bool)

(assert (=> b!1392881 (= res!931960 (= (select (arr!46015 a!2901) (index!43313 lt!611719)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392881 (=> res!931960 e!788843)))

(assert (= (and d!150721 c!129913) b!1392877))

(assert (= (and d!150721 (not c!129913)) b!1392874))

(assert (= (and b!1392874 c!129914) b!1392879))

(assert (= (and b!1392874 (not c!129914)) b!1392873))

(assert (= (and d!150721 c!129915) b!1392876))

(assert (= (and d!150721 (not c!129915)) b!1392880))

(assert (= (and b!1392880 res!931959) b!1392875))

(assert (= (and b!1392875 (not res!931958)) b!1392881))

(assert (= (and b!1392881 (not res!931960)) b!1392878))

(declare-fun m!1278855 () Bool)

(assert (=> b!1392881 m!1278855))

(assert (=> d!150721 m!1278697))

(declare-fun m!1278857 () Bool)

(assert (=> d!150721 m!1278857))

(assert (=> d!150721 m!1278709))

(assert (=> b!1392875 m!1278855))

(assert (=> b!1392873 m!1278697))

(declare-fun m!1278859 () Bool)

(assert (=> b!1392873 m!1278859))

(assert (=> b!1392873 m!1278859))

(assert (=> b!1392873 m!1278695))

(declare-fun m!1278861 () Bool)

(assert (=> b!1392873 m!1278861))

(assert (=> b!1392878 m!1278855))

(assert (=> b!1392666 d!150721))

(declare-fun d!150735 () Bool)

(declare-fun lt!611726 () (_ BitVec 32))

(declare-fun lt!611725 () (_ BitVec 32))

(assert (=> d!150735 (= lt!611726 (bvmul (bvxor lt!611725 (bvlshr lt!611725 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150735 (= lt!611725 ((_ extract 31 0) (bvand (bvxor (select (arr!46015 a!2901) j!112) (bvlshr (select (arr!46015 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150735 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931961 (let ((h!33754 ((_ extract 31 0) (bvand (bvxor (select (arr!46015 a!2901) j!112) (bvlshr (select (arr!46015 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125152 (bvmul (bvxor h!33754 (bvlshr h!33754 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125152 (bvlshr x!125152 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931961 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931961 #b00000000000000000000000000000000))))))

(assert (=> d!150735 (= (toIndex!0 (select (arr!46015 a!2901) j!112) mask!2840) (bvand (bvxor lt!611726 (bvlshr lt!611726 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392666 d!150735))

(declare-fun d!150737 () Bool)

(assert (=> d!150737 (= (validKeyInArray!0 (select (arr!46015 a!2901) j!112)) (and (not (= (select (arr!46015 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46015 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392661 d!150737))

(declare-fun d!150739 () Bool)

(assert (=> d!150739 (= (validKeyInArray!0 (select (arr!46015 a!2901) i!1037)) (and (not (= (select (arr!46015 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46015 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392662 d!150739))

(declare-fun d!150741 () Bool)

(assert (=> d!150741 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119552 d!150741))

(declare-fun d!150745 () Bool)

(assert (=> d!150745 (= (array_inv!35296 a!2901) (bvsge (size!46566 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119552 d!150745))

(declare-fun b!1392918 () Bool)

(declare-fun e!788864 () Bool)

(declare-fun call!66816 () Bool)

(assert (=> b!1392918 (= e!788864 call!66816)))

(declare-fun b!1392919 () Bool)

(declare-fun e!788862 () Bool)

(assert (=> b!1392919 (= e!788862 call!66816)))

(declare-fun b!1392920 () Bool)

(declare-fun e!788863 () Bool)

(assert (=> b!1392920 (= e!788863 e!788864)))

(declare-fun c!129934 () Bool)

(assert (=> b!1392920 (= c!129934 (validKeyInArray!0 (select (arr!46015 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150747 () Bool)

(declare-fun res!931962 () Bool)

(assert (=> d!150747 (=> res!931962 e!788863)))

(assert (=> d!150747 (= res!931962 (bvsge #b00000000000000000000000000000000 (size!46566 a!2901)))))

(assert (=> d!150747 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!788863)))

(declare-fun bm!66813 () Bool)

(assert (=> bm!66813 (= call!66816 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392921 () Bool)

(assert (=> b!1392921 (= e!788864 e!788862)))

(declare-fun lt!611746 () (_ BitVec 64))

(assert (=> b!1392921 (= lt!611746 (select (arr!46015 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611745 () Unit!46501)

(assert (=> b!1392921 (= lt!611745 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611746 #b00000000000000000000000000000000))))

(assert (=> b!1392921 (arrayContainsKey!0 a!2901 lt!611746 #b00000000000000000000000000000000)))

(declare-fun lt!611747 () Unit!46501)

(assert (=> b!1392921 (= lt!611747 lt!611745)))

(declare-fun res!931963 () Bool)

(assert (=> b!1392921 (= res!931963 (= (seekEntryOrOpen!0 (select (arr!46015 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10235 #b00000000000000000000000000000000)))))

(assert (=> b!1392921 (=> (not res!931963) (not e!788862))))

(assert (= (and d!150747 (not res!931962)) b!1392920))

(assert (= (and b!1392920 c!129934) b!1392921))

(assert (= (and b!1392920 (not c!129934)) b!1392918))

(assert (= (and b!1392921 res!931963) b!1392919))

(assert (= (or b!1392919 b!1392918) bm!66813))

(assert (=> b!1392920 m!1278769))

(assert (=> b!1392920 m!1278769))

(assert (=> b!1392920 m!1278773))

(declare-fun m!1278877 () Bool)

(assert (=> bm!66813 m!1278877))

(assert (=> b!1392921 m!1278769))

(declare-fun m!1278881 () Bool)

(assert (=> b!1392921 m!1278881))

(declare-fun m!1278883 () Bool)

(assert (=> b!1392921 m!1278883))

(assert (=> b!1392921 m!1278769))

(declare-fun m!1278885 () Bool)

(assert (=> b!1392921 m!1278885))

(assert (=> b!1392663 d!150747))

(check-sat (not b!1392920) (not bm!66798) (not d!150719) (not d!150721) (not b!1392795) (not b!1392777) (not b!1392721) (not b!1392719) (not bm!66813) (not bm!66811) (not b!1392873) (not b!1392722) (not b!1392796) (not d!150697) (not b!1392921))
(check-sat)
