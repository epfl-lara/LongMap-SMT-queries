; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131664 () Bool)

(assert start!131664)

(declare-fun b!1541823 () Bool)

(declare-fun res!1057137 () Bool)

(declare-fun e!857776 () Bool)

(assert (=> b!1541823 (=> (not res!1057137) (not e!857776))))

(declare-datatypes ((array!102394 0))(
  ( (array!102395 (arr!49402 (Array (_ BitVec 32) (_ BitVec 64))) (size!49953 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102394)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102394 (_ BitVec 32)) Bool)

(assert (=> b!1541823 (= res!1057137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1541824 () Bool)

(declare-fun res!1057138 () Bool)

(assert (=> b!1541824 (=> (not res!1057138) (not e!857776))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13423 0))(
  ( (MissingZero!13423 (index!56087 (_ BitVec 32))) (Found!13423 (index!56088 (_ BitVec 32))) (Intermediate!13423 (undefined!14235 Bool) (index!56089 (_ BitVec 32)) (x!138028 (_ BitVec 32))) (Undefined!13423) (MissingVacant!13423 (index!56090 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102394 (_ BitVec 32)) SeekEntryResult!13423)

(assert (=> b!1541824 (= res!1057138 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49402 a!2792) j!64) a!2792 mask!2480) (Found!13423 j!64)))))

(declare-fun b!1541825 () Bool)

(declare-fun res!1057136 () Bool)

(assert (=> b!1541825 (=> (not res!1057136) (not e!857776))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1541825 (= res!1057136 (and (= (size!49953 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49953 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49953 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1541826 () Bool)

(declare-fun res!1057140 () Bool)

(assert (=> b!1541826 (=> (not res!1057140) (not e!857776))))

(assert (=> b!1541826 (= res!1057140 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49953 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49953 a!2792)) (= (select (arr!49402 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1541828 () Bool)

(declare-fun res!1057143 () Bool)

(assert (=> b!1541828 (=> (not res!1057143) (not e!857776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541828 (= res!1057143 (validKeyInArray!0 (select (arr!49402 a!2792) i!951)))))

(declare-fun b!1541829 () Bool)

(declare-fun res!1057135 () Bool)

(assert (=> b!1541829 (=> (not res!1057135) (not e!857776))))

(declare-datatypes ((List!35863 0))(
  ( (Nil!35860) (Cons!35859 (h!37322 (_ BitVec 64)) (t!50549 List!35863)) )
))
(declare-fun arrayNoDuplicates!0 (array!102394 (_ BitVec 32) List!35863) Bool)

(assert (=> b!1541829 (= res!1057135 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35860))))

(declare-fun b!1541830 () Bool)

(declare-fun lt!665955 () (_ BitVec 32))

(assert (=> b!1541830 (= e!857776 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (or (bvslt lt!665955 #b00000000000000000000000000000000) (bvsge lt!665955 (size!49953 a!2792)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1541830 (= lt!665955 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1541831 () Bool)

(declare-fun res!1057142 () Bool)

(assert (=> b!1541831 (=> (not res!1057142) (not e!857776))))

(assert (=> b!1541831 (= res!1057142 (not (= (select (arr!49402 a!2792) index!463) (select (arr!49402 a!2792) j!64))))))

(declare-fun res!1057141 () Bool)

(assert (=> start!131664 (=> (not res!1057141) (not e!857776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131664 (= res!1057141 (validMask!0 mask!2480))))

(assert (=> start!131664 e!857776))

(assert (=> start!131664 true))

(declare-fun array_inv!38683 (array!102394) Bool)

(assert (=> start!131664 (array_inv!38683 a!2792)))

(declare-fun b!1541827 () Bool)

(declare-fun res!1057139 () Bool)

(assert (=> b!1541827 (=> (not res!1057139) (not e!857776))))

(assert (=> b!1541827 (= res!1057139 (validKeyInArray!0 (select (arr!49402 a!2792) j!64)))))

(assert (= (and start!131664 res!1057141) b!1541825))

(assert (= (and b!1541825 res!1057136) b!1541828))

(assert (= (and b!1541828 res!1057143) b!1541827))

(assert (= (and b!1541827 res!1057139) b!1541823))

(assert (= (and b!1541823 res!1057137) b!1541829))

(assert (= (and b!1541829 res!1057135) b!1541826))

(assert (= (and b!1541826 res!1057140) b!1541824))

(assert (= (and b!1541824 res!1057138) b!1541831))

(assert (= (and b!1541831 res!1057142) b!1541830))

(declare-fun m!1423909 () Bool)

(assert (=> b!1541824 m!1423909))

(assert (=> b!1541824 m!1423909))

(declare-fun m!1423911 () Bool)

(assert (=> b!1541824 m!1423911))

(declare-fun m!1423913 () Bool)

(assert (=> b!1541831 m!1423913))

(assert (=> b!1541831 m!1423909))

(declare-fun m!1423915 () Bool)

(assert (=> b!1541830 m!1423915))

(declare-fun m!1423917 () Bool)

(assert (=> b!1541829 m!1423917))

(declare-fun m!1423919 () Bool)

(assert (=> start!131664 m!1423919))

(declare-fun m!1423921 () Bool)

(assert (=> start!131664 m!1423921))

(declare-fun m!1423923 () Bool)

(assert (=> b!1541826 m!1423923))

(declare-fun m!1423925 () Bool)

(assert (=> b!1541823 m!1423925))

(assert (=> b!1541827 m!1423909))

(assert (=> b!1541827 m!1423909))

(declare-fun m!1423927 () Bool)

(assert (=> b!1541827 m!1423927))

(declare-fun m!1423929 () Bool)

(assert (=> b!1541828 m!1423929))

(assert (=> b!1541828 m!1423929))

(declare-fun m!1423931 () Bool)

(assert (=> b!1541828 m!1423931))

(check-sat (not b!1541824) (not b!1541823) (not b!1541828) (not b!1541830) (not b!1541827) (not start!131664) (not b!1541829))
(check-sat)
(get-model)

(declare-fun e!857796 () SeekEntryResult!13423)

(declare-fun b!1541898 () Bool)

(assert (=> b!1541898 (= e!857796 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 (bvadd x!510 #b00000000000000000000000000000001) mask!2480) vacantIndex!5 (select (arr!49402 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1541899 () Bool)

(declare-fun e!857795 () SeekEntryResult!13423)

(assert (=> b!1541899 (= e!857795 (Found!13423 index!463))))

(declare-fun b!1541900 () Bool)

(declare-fun e!857797 () SeekEntryResult!13423)

(assert (=> b!1541900 (= e!857797 e!857795)))

(declare-fun c!141921 () Bool)

(declare-fun lt!665967 () (_ BitVec 64))

(assert (=> b!1541900 (= c!141921 (= lt!665967 (select (arr!49402 a!2792) j!64)))))

(declare-fun b!1541902 () Bool)

(assert (=> b!1541902 (= e!857797 Undefined!13423)))

(declare-fun b!1541903 () Bool)

(declare-fun c!141920 () Bool)

(assert (=> b!1541903 (= c!141920 (= lt!665967 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1541903 (= e!857795 e!857796)))

(declare-fun d!161131 () Bool)

(declare-fun lt!665966 () SeekEntryResult!13423)

(get-info :version)

(assert (=> d!161131 (and (or ((_ is Undefined!13423) lt!665966) (not ((_ is Found!13423) lt!665966)) (and (bvsge (index!56088 lt!665966) #b00000000000000000000000000000000) (bvslt (index!56088 lt!665966) (size!49953 a!2792)))) (or ((_ is Undefined!13423) lt!665966) ((_ is Found!13423) lt!665966) (not ((_ is MissingVacant!13423) lt!665966)) (not (= (index!56090 lt!665966) vacantIndex!5)) (and (bvsge (index!56090 lt!665966) #b00000000000000000000000000000000) (bvslt (index!56090 lt!665966) (size!49953 a!2792)))) (or ((_ is Undefined!13423) lt!665966) (ite ((_ is Found!13423) lt!665966) (= (select (arr!49402 a!2792) (index!56088 lt!665966)) (select (arr!49402 a!2792) j!64)) (and ((_ is MissingVacant!13423) lt!665966) (= (index!56090 lt!665966) vacantIndex!5) (= (select (arr!49402 a!2792) (index!56090 lt!665966)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!161131 (= lt!665966 e!857797)))

(declare-fun c!141922 () Bool)

(assert (=> d!161131 (= c!141922 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!161131 (= lt!665967 (select (arr!49402 a!2792) index!463))))

(assert (=> d!161131 (validMask!0 mask!2480)))

(assert (=> d!161131 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49402 a!2792) j!64) a!2792 mask!2480) lt!665966)))

(declare-fun b!1541901 () Bool)

(assert (=> b!1541901 (= e!857796 (MissingVacant!13423 vacantIndex!5))))

(assert (= (and d!161131 c!141922) b!1541902))

(assert (= (and d!161131 (not c!141922)) b!1541900))

(assert (= (and b!1541900 c!141921) b!1541899))

(assert (= (and b!1541900 (not c!141921)) b!1541903))

(assert (= (and b!1541903 c!141920) b!1541901))

(assert (= (and b!1541903 (not c!141920)) b!1541898))

(declare-fun m!1423981 () Bool)

(assert (=> b!1541898 m!1423981))

(assert (=> b!1541898 m!1423981))

(assert (=> b!1541898 m!1423909))

(declare-fun m!1423983 () Bool)

(assert (=> b!1541898 m!1423983))

(declare-fun m!1423985 () Bool)

(assert (=> d!161131 m!1423985))

(declare-fun m!1423987 () Bool)

(assert (=> d!161131 m!1423987))

(assert (=> d!161131 m!1423913))

(assert (=> d!161131 m!1423919))

(assert (=> b!1541824 d!161131))

(declare-fun b!1541914 () Bool)

(declare-fun e!857808 () Bool)

(declare-fun contains!10065 (List!35863 (_ BitVec 64)) Bool)

(assert (=> b!1541914 (= e!857808 (contains!10065 Nil!35860 (select (arr!49402 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1541915 () Bool)

(declare-fun e!857807 () Bool)

(declare-fun call!68769 () Bool)

(assert (=> b!1541915 (= e!857807 call!68769)))

(declare-fun b!1541916 () Bool)

(assert (=> b!1541916 (= e!857807 call!68769)))

(declare-fun bm!68766 () Bool)

(declare-fun c!141925 () Bool)

(assert (=> bm!68766 (= call!68769 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141925 (Cons!35859 (select (arr!49402 a!2792) #b00000000000000000000000000000000) Nil!35860) Nil!35860)))))

(declare-fun d!161133 () Bool)

(declare-fun res!1057205 () Bool)

(declare-fun e!857809 () Bool)

(assert (=> d!161133 (=> res!1057205 e!857809)))

(assert (=> d!161133 (= res!1057205 (bvsge #b00000000000000000000000000000000 (size!49953 a!2792)))))

(assert (=> d!161133 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35860) e!857809)))

(declare-fun b!1541917 () Bool)

(declare-fun e!857806 () Bool)

(assert (=> b!1541917 (= e!857809 e!857806)))

(declare-fun res!1057204 () Bool)

(assert (=> b!1541917 (=> (not res!1057204) (not e!857806))))

(assert (=> b!1541917 (= res!1057204 (not e!857808))))

(declare-fun res!1057206 () Bool)

(assert (=> b!1541917 (=> (not res!1057206) (not e!857808))))

(assert (=> b!1541917 (= res!1057206 (validKeyInArray!0 (select (arr!49402 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1541918 () Bool)

(assert (=> b!1541918 (= e!857806 e!857807)))

(assert (=> b!1541918 (= c!141925 (validKeyInArray!0 (select (arr!49402 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!161133 (not res!1057205)) b!1541917))

(assert (= (and b!1541917 res!1057206) b!1541914))

(assert (= (and b!1541917 res!1057204) b!1541918))

(assert (= (and b!1541918 c!141925) b!1541916))

(assert (= (and b!1541918 (not c!141925)) b!1541915))

(assert (= (or b!1541916 b!1541915) bm!68766))

(declare-fun m!1423989 () Bool)

(assert (=> b!1541914 m!1423989))

(assert (=> b!1541914 m!1423989))

(declare-fun m!1423991 () Bool)

(assert (=> b!1541914 m!1423991))

(assert (=> bm!68766 m!1423989))

(declare-fun m!1423993 () Bool)

(assert (=> bm!68766 m!1423993))

(assert (=> b!1541917 m!1423989))

(assert (=> b!1541917 m!1423989))

(declare-fun m!1423995 () Bool)

(assert (=> b!1541917 m!1423995))

(assert (=> b!1541918 m!1423989))

(assert (=> b!1541918 m!1423989))

(assert (=> b!1541918 m!1423995))

(assert (=> b!1541829 d!161133))

(declare-fun b!1541927 () Bool)

(declare-fun e!857817 () Bool)

(declare-fun call!68772 () Bool)

(assert (=> b!1541927 (= e!857817 call!68772)))

(declare-fun bm!68769 () Bool)

(assert (=> bm!68769 (= call!68772 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1541928 () Bool)

(declare-fun e!857816 () Bool)

(assert (=> b!1541928 (= e!857816 call!68772)))

(declare-fun b!1541929 () Bool)

(declare-fun e!857818 () Bool)

(assert (=> b!1541929 (= e!857818 e!857817)))

(declare-fun c!141928 () Bool)

(assert (=> b!1541929 (= c!141928 (validKeyInArray!0 (select (arr!49402 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!161135 () Bool)

(declare-fun res!1057212 () Bool)

(assert (=> d!161135 (=> res!1057212 e!857818)))

(assert (=> d!161135 (= res!1057212 (bvsge #b00000000000000000000000000000000 (size!49953 a!2792)))))

(assert (=> d!161135 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!857818)))

(declare-fun b!1541930 () Bool)

(assert (=> b!1541930 (= e!857817 e!857816)))

(declare-fun lt!665975 () (_ BitVec 64))

(assert (=> b!1541930 (= lt!665975 (select (arr!49402 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51343 0))(
  ( (Unit!51344) )
))
(declare-fun lt!665976 () Unit!51343)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102394 (_ BitVec 64) (_ BitVec 32)) Unit!51343)

(assert (=> b!1541930 (= lt!665976 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665975 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541930 (arrayContainsKey!0 a!2792 lt!665975 #b00000000000000000000000000000000)))

(declare-fun lt!665974 () Unit!51343)

(assert (=> b!1541930 (= lt!665974 lt!665976)))

(declare-fun res!1057211 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102394 (_ BitVec 32)) SeekEntryResult!13423)

(assert (=> b!1541930 (= res!1057211 (= (seekEntryOrOpen!0 (select (arr!49402 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13423 #b00000000000000000000000000000000)))))

(assert (=> b!1541930 (=> (not res!1057211) (not e!857816))))

(assert (= (and d!161135 (not res!1057212)) b!1541929))

(assert (= (and b!1541929 c!141928) b!1541930))

(assert (= (and b!1541929 (not c!141928)) b!1541927))

(assert (= (and b!1541930 res!1057211) b!1541928))

(assert (= (or b!1541928 b!1541927) bm!68769))

(declare-fun m!1423997 () Bool)

(assert (=> bm!68769 m!1423997))

(assert (=> b!1541929 m!1423989))

(assert (=> b!1541929 m!1423989))

(assert (=> b!1541929 m!1423995))

(assert (=> b!1541930 m!1423989))

(declare-fun m!1423999 () Bool)

(assert (=> b!1541930 m!1423999))

(declare-fun m!1424001 () Bool)

(assert (=> b!1541930 m!1424001))

(assert (=> b!1541930 m!1423989))

(declare-fun m!1424003 () Bool)

(assert (=> b!1541930 m!1424003))

(assert (=> b!1541823 d!161135))

(declare-fun d!161137 () Bool)

(assert (=> d!161137 (= (validKeyInArray!0 (select (arr!49402 a!2792) i!951)) (and (not (= (select (arr!49402 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49402 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1541828 d!161137))

(declare-fun d!161139 () Bool)

(assert (=> d!161139 (= (validKeyInArray!0 (select (arr!49402 a!2792) j!64)) (and (not (= (select (arr!49402 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49402 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1541827 d!161139))

(declare-fun d!161141 () Bool)

(assert (=> d!161141 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131664 d!161141))

(declare-fun d!161147 () Bool)

(assert (=> d!161147 (= (array_inv!38683 a!2792) (bvsge (size!49953 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!131664 d!161147))

(declare-fun d!161149 () Bool)

(declare-fun lt!665982 () (_ BitVec 32))

(assert (=> d!161149 (and (bvsge lt!665982 #b00000000000000000000000000000000) (bvslt lt!665982 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!161149 (= lt!665982 (choose!52 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(assert (=> d!161149 (validMask!0 mask!2480)))

(assert (=> d!161149 (= (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480) lt!665982)))

(declare-fun bs!44214 () Bool)

(assert (= bs!44214 d!161149))

(declare-fun m!1424007 () Bool)

(assert (=> bs!44214 m!1424007))

(assert (=> bs!44214 m!1423919))

(assert (=> b!1541830 d!161149))

(check-sat (not b!1541898) (not b!1541930) (not b!1541929) (not bm!68766) (not d!161131) (not bm!68769) (not b!1541917) (not d!161149) (not b!1541918) (not b!1541914))
(check-sat)
