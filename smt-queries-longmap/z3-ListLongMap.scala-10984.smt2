; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128954 () Bool)

(assert start!128954)

(declare-fun b!1509809 () Bool)

(declare-fun res!1028745 () Bool)

(declare-fun e!843625 () Bool)

(assert (=> b!1509809 (=> (not res!1028745) (not e!843625))))

(declare-datatypes ((array!100702 0))(
  ( (array!100703 (arr!48586 (Array (_ BitVec 32) (_ BitVec 64))) (size!49137 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100702)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509809 (= res!1028745 (validKeyInArray!0 (select (arr!48586 a!2804) j!70)))))

(declare-fun b!1509810 () Bool)

(declare-fun e!843626 () Bool)

(assert (=> b!1509810 (= e!843625 e!843626)))

(declare-fun res!1028748 () Bool)

(assert (=> b!1509810 (=> (not res!1028748) (not e!843626))))

(declare-datatypes ((SeekEntryResult!12650 0))(
  ( (MissingZero!12650 (index!52995 (_ BitVec 32))) (Found!12650 (index!52996 (_ BitVec 32))) (Intermediate!12650 (undefined!13462 Bool) (index!52997 (_ BitVec 32)) (x!134953 (_ BitVec 32))) (Undefined!12650) (MissingVacant!12650 (index!52998 (_ BitVec 32))) )
))
(declare-fun lt!655171 () SeekEntryResult!12650)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100702 (_ BitVec 32)) SeekEntryResult!12650)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509810 (= res!1028748 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48586 a!2804) j!70) mask!2512) (select (arr!48586 a!2804) j!70) a!2804 mask!2512) lt!655171))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509810 (= lt!655171 (Intermediate!12650 false resIndex!21 resX!21))))

(declare-fun b!1509811 () Bool)

(declare-fun res!1028747 () Bool)

(assert (=> b!1509811 (=> (not res!1028747) (not e!843626))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509811 (= res!1028747 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48586 a!2804) j!70) a!2804 mask!2512) lt!655171))))

(declare-fun b!1509812 () Bool)

(declare-fun res!1028746 () Bool)

(assert (=> b!1509812 (=> (not res!1028746) (not e!843625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100702 (_ BitVec 32)) Bool)

(assert (=> b!1509812 (= res!1028746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509813 () Bool)

(declare-fun res!1028751 () Bool)

(assert (=> b!1509813 (=> (not res!1028751) (not e!843625))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509813 (= res!1028751 (validKeyInArray!0 (select (arr!48586 a!2804) i!961)))))

(declare-fun b!1509814 () Bool)

(declare-fun res!1028749 () Bool)

(assert (=> b!1509814 (=> (not res!1028749) (not e!843625))))

(declare-datatypes ((List!35056 0))(
  ( (Nil!35053) (Cons!35052 (h!36473 (_ BitVec 64)) (t!49742 List!35056)) )
))
(declare-fun arrayNoDuplicates!0 (array!100702 (_ BitVec 32) List!35056) Bool)

(assert (=> b!1509814 (= res!1028749 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35053))))

(declare-fun b!1509815 () Bool)

(declare-fun res!1028753 () Bool)

(assert (=> b!1509815 (=> (not res!1028753) (not e!843625))))

(assert (=> b!1509815 (= res!1028753 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49137 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49137 a!2804))))))

(declare-fun res!1028752 () Bool)

(assert (=> start!128954 (=> (not res!1028752) (not e!843625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128954 (= res!1028752 (validMask!0 mask!2512))))

(assert (=> start!128954 e!843625))

(assert (=> start!128954 true))

(declare-fun array_inv!37867 (array!100702) Bool)

(assert (=> start!128954 (array_inv!37867 a!2804)))

(declare-fun b!1509816 () Bool)

(declare-fun res!1028750 () Bool)

(assert (=> b!1509816 (=> (not res!1028750) (not e!843625))))

(assert (=> b!1509816 (= res!1028750 (and (= (size!49137 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49137 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49137 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509817 () Bool)

(assert (=> b!1509817 (= e!843626 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(assert (= (and start!128954 res!1028752) b!1509816))

(assert (= (and b!1509816 res!1028750) b!1509813))

(assert (= (and b!1509813 res!1028751) b!1509809))

(assert (= (and b!1509809 res!1028745) b!1509812))

(assert (= (and b!1509812 res!1028746) b!1509814))

(assert (= (and b!1509814 res!1028749) b!1509815))

(assert (= (and b!1509815 res!1028753) b!1509810))

(assert (= (and b!1509810 res!1028748) b!1509811))

(assert (= (and b!1509811 res!1028747) b!1509817))

(declare-fun m!1392381 () Bool)

(assert (=> b!1509810 m!1392381))

(assert (=> b!1509810 m!1392381))

(declare-fun m!1392383 () Bool)

(assert (=> b!1509810 m!1392383))

(assert (=> b!1509810 m!1392383))

(assert (=> b!1509810 m!1392381))

(declare-fun m!1392385 () Bool)

(assert (=> b!1509810 m!1392385))

(declare-fun m!1392387 () Bool)

(assert (=> b!1509814 m!1392387))

(declare-fun m!1392389 () Bool)

(assert (=> b!1509813 m!1392389))

(assert (=> b!1509813 m!1392389))

(declare-fun m!1392391 () Bool)

(assert (=> b!1509813 m!1392391))

(assert (=> b!1509809 m!1392381))

(assert (=> b!1509809 m!1392381))

(declare-fun m!1392393 () Bool)

(assert (=> b!1509809 m!1392393))

(assert (=> b!1509811 m!1392381))

(assert (=> b!1509811 m!1392381))

(declare-fun m!1392395 () Bool)

(assert (=> b!1509811 m!1392395))

(declare-fun m!1392397 () Bool)

(assert (=> b!1509812 m!1392397))

(declare-fun m!1392399 () Bool)

(assert (=> start!128954 m!1392399))

(declare-fun m!1392401 () Bool)

(assert (=> start!128954 m!1392401))

(check-sat (not b!1509811) (not b!1509814) (not b!1509809) (not b!1509812) (not b!1509810) (not start!128954) (not b!1509813))
(check-sat)
(get-model)

(declare-fun bm!68379 () Bool)

(declare-fun call!68382 () Bool)

(assert (=> bm!68379 (= call!68382 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1509880 () Bool)

(declare-fun e!843653 () Bool)

(declare-fun e!843654 () Bool)

(assert (=> b!1509880 (= e!843653 e!843654)))

(declare-fun lt!655184 () (_ BitVec 64))

(assert (=> b!1509880 (= lt!655184 (select (arr!48586 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50265 0))(
  ( (Unit!50266) )
))
(declare-fun lt!655186 () Unit!50265)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100702 (_ BitVec 64) (_ BitVec 32)) Unit!50265)

(assert (=> b!1509880 (= lt!655186 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!655184 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1509880 (arrayContainsKey!0 a!2804 lt!655184 #b00000000000000000000000000000000)))

(declare-fun lt!655185 () Unit!50265)

(assert (=> b!1509880 (= lt!655185 lt!655186)))

(declare-fun res!1028813 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100702 (_ BitVec 32)) SeekEntryResult!12650)

(assert (=> b!1509880 (= res!1028813 (= (seekEntryOrOpen!0 (select (arr!48586 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12650 #b00000000000000000000000000000000)))))

(assert (=> b!1509880 (=> (not res!1028813) (not e!843654))))

(declare-fun b!1509881 () Bool)

(assert (=> b!1509881 (= e!843653 call!68382)))

(declare-fun d!158897 () Bool)

(declare-fun res!1028812 () Bool)

(declare-fun e!843652 () Bool)

(assert (=> d!158897 (=> res!1028812 e!843652)))

(assert (=> d!158897 (= res!1028812 (bvsge #b00000000000000000000000000000000 (size!49137 a!2804)))))

(assert (=> d!158897 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!843652)))

(declare-fun b!1509882 () Bool)

(assert (=> b!1509882 (= e!843652 e!843653)))

(declare-fun c!140083 () Bool)

(assert (=> b!1509882 (= c!140083 (validKeyInArray!0 (select (arr!48586 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1509883 () Bool)

(assert (=> b!1509883 (= e!843654 call!68382)))

(assert (= (and d!158897 (not res!1028812)) b!1509882))

(assert (= (and b!1509882 c!140083) b!1509880))

(assert (= (and b!1509882 (not c!140083)) b!1509881))

(assert (= (and b!1509880 res!1028813) b!1509883))

(assert (= (or b!1509883 b!1509881) bm!68379))

(declare-fun m!1392447 () Bool)

(assert (=> bm!68379 m!1392447))

(declare-fun m!1392449 () Bool)

(assert (=> b!1509880 m!1392449))

(declare-fun m!1392451 () Bool)

(assert (=> b!1509880 m!1392451))

(declare-fun m!1392453 () Bool)

(assert (=> b!1509880 m!1392453))

(assert (=> b!1509880 m!1392449))

(declare-fun m!1392455 () Bool)

(assert (=> b!1509880 m!1392455))

(assert (=> b!1509882 m!1392449))

(assert (=> b!1509882 m!1392449))

(declare-fun m!1392457 () Bool)

(assert (=> b!1509882 m!1392457))

(assert (=> b!1509812 d!158897))

(declare-fun d!158899 () Bool)

(assert (=> d!158899 (= (validKeyInArray!0 (select (arr!48586 a!2804) i!961)) (and (not (= (select (arr!48586 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48586 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1509813 d!158899))

(declare-fun d!158901 () Bool)

(declare-fun res!1028827 () Bool)

(declare-fun e!843671 () Bool)

(assert (=> d!158901 (=> res!1028827 e!843671)))

(assert (=> d!158901 (= res!1028827 (bvsge #b00000000000000000000000000000000 (size!49137 a!2804)))))

(assert (=> d!158901 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35053) e!843671)))

(declare-fun b!1509904 () Bool)

(declare-fun e!843672 () Bool)

(declare-fun e!843674 () Bool)

(assert (=> b!1509904 (= e!843672 e!843674)))

(declare-fun c!140088 () Bool)

(assert (=> b!1509904 (= c!140088 (validKeyInArray!0 (select (arr!48586 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1509905 () Bool)

(declare-fun call!68385 () Bool)

(assert (=> b!1509905 (= e!843674 call!68385)))

(declare-fun b!1509906 () Bool)

(assert (=> b!1509906 (= e!843671 e!843672)))

(declare-fun res!1028826 () Bool)

(assert (=> b!1509906 (=> (not res!1028826) (not e!843672))))

(declare-fun e!843673 () Bool)

(assert (=> b!1509906 (= res!1028826 (not e!843673))))

(declare-fun res!1028828 () Bool)

(assert (=> b!1509906 (=> (not res!1028828) (not e!843673))))

(assert (=> b!1509906 (= res!1028828 (validKeyInArray!0 (select (arr!48586 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1509907 () Bool)

(assert (=> b!1509907 (= e!843674 call!68385)))

(declare-fun bm!68382 () Bool)

(assert (=> bm!68382 (= call!68385 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140088 (Cons!35052 (select (arr!48586 a!2804) #b00000000000000000000000000000000) Nil!35053) Nil!35053)))))

(declare-fun b!1509908 () Bool)

(declare-fun contains!10015 (List!35056 (_ BitVec 64)) Bool)

(assert (=> b!1509908 (= e!843673 (contains!10015 Nil!35053 (select (arr!48586 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158901 (not res!1028827)) b!1509906))

(assert (= (and b!1509906 res!1028828) b!1509908))

(assert (= (and b!1509906 res!1028826) b!1509904))

(assert (= (and b!1509904 c!140088) b!1509907))

(assert (= (and b!1509904 (not c!140088)) b!1509905))

(assert (= (or b!1509907 b!1509905) bm!68382))

(assert (=> b!1509904 m!1392449))

(assert (=> b!1509904 m!1392449))

(assert (=> b!1509904 m!1392457))

(assert (=> b!1509906 m!1392449))

(assert (=> b!1509906 m!1392449))

(assert (=> b!1509906 m!1392457))

(assert (=> bm!68382 m!1392449))

(declare-fun m!1392459 () Bool)

(assert (=> bm!68382 m!1392459))

(assert (=> b!1509908 m!1392449))

(assert (=> b!1509908 m!1392449))

(declare-fun m!1392461 () Bool)

(assert (=> b!1509908 m!1392461))

(assert (=> b!1509814 d!158901))

(declare-fun d!158909 () Bool)

(assert (=> d!158909 (= (validKeyInArray!0 (select (arr!48586 a!2804) j!70)) (and (not (= (select (arr!48586 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48586 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1509809 d!158909))

(declare-fun d!158911 () Bool)

(declare-fun e!843719 () Bool)

(assert (=> d!158911 e!843719))

(declare-fun c!140112 () Bool)

(declare-fun lt!655208 () SeekEntryResult!12650)

(get-info :version)

(assert (=> d!158911 (= c!140112 (and ((_ is Intermediate!12650) lt!655208) (undefined!13462 lt!655208)))))

(declare-fun e!843718 () SeekEntryResult!12650)

(assert (=> d!158911 (= lt!655208 e!843718)))

(declare-fun c!140113 () Bool)

(assert (=> d!158911 (= c!140113 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!655209 () (_ BitVec 64))

(assert (=> d!158911 (= lt!655209 (select (arr!48586 a!2804) (toIndex!0 (select (arr!48586 a!2804) j!70) mask!2512)))))

(assert (=> d!158911 (validMask!0 mask!2512)))

(assert (=> d!158911 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48586 a!2804) j!70) mask!2512) (select (arr!48586 a!2804) j!70) a!2804 mask!2512) lt!655208)))

(declare-fun b!1509978 () Bool)

(declare-fun e!843720 () SeekEntryResult!12650)

(assert (=> b!1509978 (= e!843718 e!843720)))

(declare-fun c!140111 () Bool)

(assert (=> b!1509978 (= c!140111 (or (= lt!655209 (select (arr!48586 a!2804) j!70)) (= (bvadd lt!655209 lt!655209) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1509979 () Bool)

(assert (=> b!1509979 (= e!843720 (Intermediate!12650 false (toIndex!0 (select (arr!48586 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1509980 () Bool)

(assert (=> b!1509980 (and (bvsge (index!52997 lt!655208) #b00000000000000000000000000000000) (bvslt (index!52997 lt!655208) (size!49137 a!2804)))))

(declare-fun res!1028858 () Bool)

(assert (=> b!1509980 (= res!1028858 (= (select (arr!48586 a!2804) (index!52997 lt!655208)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!843721 () Bool)

(assert (=> b!1509980 (=> res!1028858 e!843721)))

(declare-fun b!1509981 () Bool)

(assert (=> b!1509981 (= e!843718 (Intermediate!12650 true (toIndex!0 (select (arr!48586 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1509982 () Bool)

(declare-fun e!843722 () Bool)

(assert (=> b!1509982 (= e!843719 e!843722)))

(declare-fun res!1028857 () Bool)

(assert (=> b!1509982 (= res!1028857 (and ((_ is Intermediate!12650) lt!655208) (not (undefined!13462 lt!655208)) (bvslt (x!134953 lt!655208) #b01111111111111111111111111111110) (bvsge (x!134953 lt!655208) #b00000000000000000000000000000000) (bvsge (x!134953 lt!655208) #b00000000000000000000000000000000)))))

(assert (=> b!1509982 (=> (not res!1028857) (not e!843722))))

(declare-fun b!1509983 () Bool)

(assert (=> b!1509983 (and (bvsge (index!52997 lt!655208) #b00000000000000000000000000000000) (bvslt (index!52997 lt!655208) (size!49137 a!2804)))))

(declare-fun res!1028856 () Bool)

(assert (=> b!1509983 (= res!1028856 (= (select (arr!48586 a!2804) (index!52997 lt!655208)) (select (arr!48586 a!2804) j!70)))))

(assert (=> b!1509983 (=> res!1028856 e!843721)))

(assert (=> b!1509983 (= e!843722 e!843721)))

(declare-fun b!1509984 () Bool)

(assert (=> b!1509984 (= e!843719 (bvsge (x!134953 lt!655208) #b01111111111111111111111111111110))))

(declare-fun b!1509985 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509985 (= e!843720 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48586 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48586 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509986 () Bool)

(assert (=> b!1509986 (and (bvsge (index!52997 lt!655208) #b00000000000000000000000000000000) (bvslt (index!52997 lt!655208) (size!49137 a!2804)))))

(assert (=> b!1509986 (= e!843721 (= (select (arr!48586 a!2804) (index!52997 lt!655208)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!158911 c!140113) b!1509981))

(assert (= (and d!158911 (not c!140113)) b!1509978))

(assert (= (and b!1509978 c!140111) b!1509979))

(assert (= (and b!1509978 (not c!140111)) b!1509985))

(assert (= (and d!158911 c!140112) b!1509984))

(assert (= (and d!158911 (not c!140112)) b!1509982))

(assert (= (and b!1509982 res!1028857) b!1509983))

(assert (= (and b!1509983 (not res!1028856)) b!1509980))

(assert (= (and b!1509980 (not res!1028858)) b!1509986))

(declare-fun m!1392483 () Bool)

(assert (=> b!1509980 m!1392483))

(assert (=> b!1509983 m!1392483))

(assert (=> d!158911 m!1392383))

(declare-fun m!1392485 () Bool)

(assert (=> d!158911 m!1392485))

(assert (=> d!158911 m!1392399))

(assert (=> b!1509985 m!1392383))

(declare-fun m!1392487 () Bool)

(assert (=> b!1509985 m!1392487))

(assert (=> b!1509985 m!1392487))

(assert (=> b!1509985 m!1392381))

(declare-fun m!1392489 () Bool)

(assert (=> b!1509985 m!1392489))

(assert (=> b!1509986 m!1392483))

(assert (=> b!1509810 d!158911))

(declare-fun d!158917 () Bool)

(declare-fun lt!655219 () (_ BitVec 32))

(declare-fun lt!655218 () (_ BitVec 32))

(assert (=> d!158917 (= lt!655219 (bvmul (bvxor lt!655218 (bvlshr lt!655218 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158917 (= lt!655218 ((_ extract 31 0) (bvand (bvxor (select (arr!48586 a!2804) j!70) (bvlshr (select (arr!48586 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158917 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028859 (let ((h!36476 ((_ extract 31 0) (bvand (bvxor (select (arr!48586 a!2804) j!70) (bvlshr (select (arr!48586 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134959 (bvmul (bvxor h!36476 (bvlshr h!36476 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134959 (bvlshr x!134959 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028859 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028859 #b00000000000000000000000000000000))))))

(assert (=> d!158917 (= (toIndex!0 (select (arr!48586 a!2804) j!70) mask!2512) (bvand (bvxor lt!655219 (bvlshr lt!655219 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1509810 d!158917))

(declare-fun d!158923 () Bool)

(assert (=> d!158923 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128954 d!158923))

(declare-fun d!158933 () Bool)

(assert (=> d!158933 (= (array_inv!37867 a!2804) (bvsge (size!49137 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128954 d!158933))

(declare-fun d!158935 () Bool)

(declare-fun e!843739 () Bool)

(assert (=> d!158935 e!843739))

(declare-fun c!140124 () Bool)

(declare-fun lt!655234 () SeekEntryResult!12650)

(assert (=> d!158935 (= c!140124 (and ((_ is Intermediate!12650) lt!655234) (undefined!13462 lt!655234)))))

(declare-fun e!843738 () SeekEntryResult!12650)

(assert (=> d!158935 (= lt!655234 e!843738)))

(declare-fun c!140125 () Bool)

(assert (=> d!158935 (= c!140125 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!655235 () (_ BitVec 64))

(assert (=> d!158935 (= lt!655235 (select (arr!48586 a!2804) index!487))))

(assert (=> d!158935 (validMask!0 mask!2512)))

(assert (=> d!158935 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48586 a!2804) j!70) a!2804 mask!2512) lt!655234)))

(declare-fun b!1510016 () Bool)

(declare-fun e!843740 () SeekEntryResult!12650)

(assert (=> b!1510016 (= e!843738 e!843740)))

(declare-fun c!140123 () Bool)

(assert (=> b!1510016 (= c!140123 (or (= lt!655235 (select (arr!48586 a!2804) j!70)) (= (bvadd lt!655235 lt!655235) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1510017 () Bool)

(assert (=> b!1510017 (= e!843740 (Intermediate!12650 false index!487 x!534))))

(declare-fun b!1510018 () Bool)

(assert (=> b!1510018 (and (bvsge (index!52997 lt!655234) #b00000000000000000000000000000000) (bvslt (index!52997 lt!655234) (size!49137 a!2804)))))

(declare-fun res!1028873 () Bool)

(assert (=> b!1510018 (= res!1028873 (= (select (arr!48586 a!2804) (index!52997 lt!655234)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!843741 () Bool)

(assert (=> b!1510018 (=> res!1028873 e!843741)))

(declare-fun b!1510019 () Bool)

(assert (=> b!1510019 (= e!843738 (Intermediate!12650 true index!487 x!534))))

(declare-fun b!1510020 () Bool)

(declare-fun e!843742 () Bool)

(assert (=> b!1510020 (= e!843739 e!843742)))

(declare-fun res!1028872 () Bool)

(assert (=> b!1510020 (= res!1028872 (and ((_ is Intermediate!12650) lt!655234) (not (undefined!13462 lt!655234)) (bvslt (x!134953 lt!655234) #b01111111111111111111111111111110) (bvsge (x!134953 lt!655234) #b00000000000000000000000000000000) (bvsge (x!134953 lt!655234) x!534)))))

(assert (=> b!1510020 (=> (not res!1028872) (not e!843742))))

(declare-fun b!1510021 () Bool)

(assert (=> b!1510021 (and (bvsge (index!52997 lt!655234) #b00000000000000000000000000000000) (bvslt (index!52997 lt!655234) (size!49137 a!2804)))))

(declare-fun res!1028871 () Bool)

(assert (=> b!1510021 (= res!1028871 (= (select (arr!48586 a!2804) (index!52997 lt!655234)) (select (arr!48586 a!2804) j!70)))))

(assert (=> b!1510021 (=> res!1028871 e!843741)))

(assert (=> b!1510021 (= e!843742 e!843741)))

(declare-fun b!1510022 () Bool)

(assert (=> b!1510022 (= e!843739 (bvsge (x!134953 lt!655234) #b01111111111111111111111111111110))))

(declare-fun b!1510023 () Bool)

(assert (=> b!1510023 (= e!843740 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48586 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510024 () Bool)

(assert (=> b!1510024 (and (bvsge (index!52997 lt!655234) #b00000000000000000000000000000000) (bvslt (index!52997 lt!655234) (size!49137 a!2804)))))

(assert (=> b!1510024 (= e!843741 (= (select (arr!48586 a!2804) (index!52997 lt!655234)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!158935 c!140125) b!1510019))

(assert (= (and d!158935 (not c!140125)) b!1510016))

(assert (= (and b!1510016 c!140123) b!1510017))

(assert (= (and b!1510016 (not c!140123)) b!1510023))

(assert (= (and d!158935 c!140124) b!1510022))

(assert (= (and d!158935 (not c!140124)) b!1510020))

(assert (= (and b!1510020 res!1028872) b!1510021))

(assert (= (and b!1510021 (not res!1028871)) b!1510018))

(assert (= (and b!1510018 (not res!1028873)) b!1510024))

(declare-fun m!1392515 () Bool)

(assert (=> b!1510018 m!1392515))

(assert (=> b!1510021 m!1392515))

(declare-fun m!1392517 () Bool)

(assert (=> d!158935 m!1392517))

(assert (=> d!158935 m!1392399))

(declare-fun m!1392519 () Bool)

(assert (=> b!1510023 m!1392519))

(assert (=> b!1510023 m!1392519))

(assert (=> b!1510023 m!1392381))

(declare-fun m!1392521 () Bool)

(assert (=> b!1510023 m!1392521))

(assert (=> b!1510024 m!1392515))

(assert (=> b!1509811 d!158935))

(check-sat (not b!1509985) (not bm!68382) (not b!1510023) (not d!158911) (not b!1509904) (not b!1509908) (not b!1509906) (not bm!68379) (not b!1509880) (not b!1509882) (not d!158935))
(check-sat)
