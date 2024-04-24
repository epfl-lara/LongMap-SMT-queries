; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130182 () Bool)

(assert start!130182)

(declare-fun b!1525971 () Bool)

(declare-fun e!850849 () Bool)

(declare-fun e!850850 () Bool)

(assert (=> b!1525971 (= e!850849 (not e!850850))))

(declare-fun res!1043395 () Bool)

(assert (=> b!1525971 (=> res!1043395 e!850850)))

(declare-fun lt!660897 () (_ BitVec 64))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101515 0))(
  ( (array!101516 (arr!48982 (Array (_ BitVec 32) (_ BitVec 64))) (size!49533 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101515)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525971 (= res!1043395 (or (not (= (select (arr!48982 a!2804) j!70) lt!660897)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48982 a!2804) index!487) (select (arr!48982 a!2804) j!70))) (not (= j!70 index!487))))))

(declare-fun e!850852 () Bool)

(assert (=> b!1525971 e!850852))

(declare-fun res!1043396 () Bool)

(assert (=> b!1525971 (=> (not res!1043396) (not e!850852))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101515 (_ BitVec 32)) Bool)

(assert (=> b!1525971 (= res!1043396 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50899 0))(
  ( (Unit!50900) )
))
(declare-fun lt!660900 () Unit!50899)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50899)

(assert (=> b!1525971 (= lt!660900 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525972 () Bool)

(declare-fun res!1043398 () Bool)

(declare-fun e!850847 () Bool)

(assert (=> b!1525972 (=> (not res!1043398) (not e!850847))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525972 (= res!1043398 (validKeyInArray!0 (select (arr!48982 a!2804) i!961)))))

(declare-fun lt!660898 () array!101515)

(declare-fun b!1525973 () Bool)

(declare-datatypes ((SeekEntryResult!13040 0))(
  ( (MissingZero!13040 (index!54555 (_ BitVec 32))) (Found!13040 (index!54556 (_ BitVec 32))) (Intermediate!13040 (undefined!13852 Bool) (index!54557 (_ BitVec 32)) (x!136453 (_ BitVec 32))) (Undefined!13040) (MissingVacant!13040 (index!54558 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101515 (_ BitVec 32)) SeekEntryResult!13040)

(assert (=> b!1525973 (= e!850850 (= (seekEntryOrOpen!0 (select (arr!48982 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!660897 lt!660898 mask!2512)))))

(declare-fun b!1525974 () Bool)

(declare-fun e!850848 () Bool)

(assert (=> b!1525974 (= e!850847 e!850848)))

(declare-fun res!1043401 () Bool)

(assert (=> b!1525974 (=> (not res!1043401) (not e!850848))))

(declare-fun lt!660896 () SeekEntryResult!13040)

(declare-fun lt!660899 () SeekEntryResult!13040)

(assert (=> b!1525974 (= res!1043401 (= lt!660896 lt!660899))))

(assert (=> b!1525974 (= lt!660899 (Intermediate!13040 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101515 (_ BitVec 32)) SeekEntryResult!13040)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525974 (= lt!660896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48982 a!2804) j!70) mask!2512) (select (arr!48982 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525976 () Bool)

(declare-fun res!1043392 () Bool)

(assert (=> b!1525976 (=> (not res!1043392) (not e!850848))))

(assert (=> b!1525976 (= res!1043392 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48982 a!2804) j!70) a!2804 mask!2512) lt!660899))))

(declare-fun b!1525977 () Bool)

(declare-fun res!1043393 () Bool)

(assert (=> b!1525977 (=> (not res!1043393) (not e!850847))))

(assert (=> b!1525977 (= res!1043393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525978 () Bool)

(declare-fun res!1043400 () Bool)

(assert (=> b!1525978 (=> (not res!1043400) (not e!850847))))

(declare-datatypes ((List!35452 0))(
  ( (Nil!35449) (Cons!35448 (h!36890 (_ BitVec 64)) (t!50138 List!35452)) )
))
(declare-fun arrayNoDuplicates!0 (array!101515 (_ BitVec 32) List!35452) Bool)

(assert (=> b!1525978 (= res!1043400 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35449))))

(declare-fun b!1525979 () Bool)

(declare-fun res!1043403 () Bool)

(assert (=> b!1525979 (=> (not res!1043403) (not e!850847))))

(assert (=> b!1525979 (= res!1043403 (validKeyInArray!0 (select (arr!48982 a!2804) j!70)))))

(declare-fun b!1525980 () Bool)

(assert (=> b!1525980 (= e!850848 e!850849)))

(declare-fun res!1043394 () Bool)

(assert (=> b!1525980 (=> (not res!1043394) (not e!850849))))

(assert (=> b!1525980 (= res!1043394 (= lt!660896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660897 mask!2512) lt!660897 lt!660898 mask!2512)))))

(assert (=> b!1525980 (= lt!660897 (select (store (arr!48982 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525980 (= lt!660898 (array!101516 (store (arr!48982 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49533 a!2804)))))

(declare-fun b!1525981 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101515 (_ BitVec 32)) SeekEntryResult!13040)

(assert (=> b!1525981 (= e!850852 (= (seekEntry!0 (select (arr!48982 a!2804) j!70) a!2804 mask!2512) (Found!13040 j!70)))))

(declare-fun b!1525982 () Bool)

(declare-fun res!1043402 () Bool)

(assert (=> b!1525982 (=> (not res!1043402) (not e!850847))))

(assert (=> b!1525982 (= res!1043402 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49533 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49533 a!2804))))))

(declare-fun res!1043399 () Bool)

(assert (=> start!130182 (=> (not res!1043399) (not e!850847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130182 (= res!1043399 (validMask!0 mask!2512))))

(assert (=> start!130182 e!850847))

(assert (=> start!130182 true))

(declare-fun array_inv!38263 (array!101515) Bool)

(assert (=> start!130182 (array_inv!38263 a!2804)))

(declare-fun b!1525975 () Bool)

(declare-fun res!1043397 () Bool)

(assert (=> b!1525975 (=> (not res!1043397) (not e!850847))))

(assert (=> b!1525975 (= res!1043397 (and (= (size!49533 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49533 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49533 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130182 res!1043399) b!1525975))

(assert (= (and b!1525975 res!1043397) b!1525972))

(assert (= (and b!1525972 res!1043398) b!1525979))

(assert (= (and b!1525979 res!1043403) b!1525977))

(assert (= (and b!1525977 res!1043393) b!1525978))

(assert (= (and b!1525978 res!1043400) b!1525982))

(assert (= (and b!1525982 res!1043402) b!1525974))

(assert (= (and b!1525974 res!1043401) b!1525976))

(assert (= (and b!1525976 res!1043392) b!1525980))

(assert (= (and b!1525980 res!1043394) b!1525971))

(assert (= (and b!1525971 res!1043396) b!1525981))

(assert (= (and b!1525971 (not res!1043395)) b!1525973))

(declare-fun m!1408957 () Bool)

(assert (=> b!1525974 m!1408957))

(assert (=> b!1525974 m!1408957))

(declare-fun m!1408959 () Bool)

(assert (=> b!1525974 m!1408959))

(assert (=> b!1525974 m!1408959))

(assert (=> b!1525974 m!1408957))

(declare-fun m!1408961 () Bool)

(assert (=> b!1525974 m!1408961))

(declare-fun m!1408963 () Bool)

(assert (=> b!1525980 m!1408963))

(assert (=> b!1525980 m!1408963))

(declare-fun m!1408965 () Bool)

(assert (=> b!1525980 m!1408965))

(declare-fun m!1408967 () Bool)

(assert (=> b!1525980 m!1408967))

(declare-fun m!1408969 () Bool)

(assert (=> b!1525980 m!1408969))

(declare-fun m!1408971 () Bool)

(assert (=> b!1525978 m!1408971))

(declare-fun m!1408973 () Bool)

(assert (=> b!1525972 m!1408973))

(assert (=> b!1525972 m!1408973))

(declare-fun m!1408975 () Bool)

(assert (=> b!1525972 m!1408975))

(assert (=> b!1525976 m!1408957))

(assert (=> b!1525976 m!1408957))

(declare-fun m!1408977 () Bool)

(assert (=> b!1525976 m!1408977))

(assert (=> b!1525973 m!1408957))

(assert (=> b!1525973 m!1408957))

(declare-fun m!1408979 () Bool)

(assert (=> b!1525973 m!1408979))

(declare-fun m!1408981 () Bool)

(assert (=> b!1525973 m!1408981))

(assert (=> b!1525981 m!1408957))

(assert (=> b!1525981 m!1408957))

(declare-fun m!1408983 () Bool)

(assert (=> b!1525981 m!1408983))

(declare-fun m!1408985 () Bool)

(assert (=> start!130182 m!1408985))

(declare-fun m!1408987 () Bool)

(assert (=> start!130182 m!1408987))

(assert (=> b!1525979 m!1408957))

(assert (=> b!1525979 m!1408957))

(declare-fun m!1408989 () Bool)

(assert (=> b!1525979 m!1408989))

(assert (=> b!1525971 m!1408957))

(declare-fun m!1408991 () Bool)

(assert (=> b!1525971 m!1408991))

(declare-fun m!1408993 () Bool)

(assert (=> b!1525971 m!1408993))

(declare-fun m!1408995 () Bool)

(assert (=> b!1525971 m!1408995))

(declare-fun m!1408997 () Bool)

(assert (=> b!1525977 m!1408997))

(check-sat (not b!1525976) (not b!1525978) (not b!1525974) (not b!1525973) (not b!1525977) (not b!1525979) (not start!130182) (not b!1525981) (not b!1525971) (not b!1525980) (not b!1525972))
(check-sat)
(get-model)

(declare-fun b!1526073 () Bool)

(declare-fun lt!660935 () SeekEntryResult!13040)

(assert (=> b!1526073 (and (bvsge (index!54557 lt!660935) #b00000000000000000000000000000000) (bvslt (index!54557 lt!660935) (size!49533 lt!660898)))))

(declare-fun res!1043484 () Bool)

(assert (=> b!1526073 (= res!1043484 (= (select (arr!48982 lt!660898) (index!54557 lt!660935)) lt!660897))))

(declare-fun e!850902 () Bool)

(assert (=> b!1526073 (=> res!1043484 e!850902)))

(declare-fun e!850901 () Bool)

(assert (=> b!1526073 (= e!850901 e!850902)))

(declare-fun b!1526074 () Bool)

(assert (=> b!1526074 (and (bvsge (index!54557 lt!660935) #b00000000000000000000000000000000) (bvslt (index!54557 lt!660935) (size!49533 lt!660898)))))

(assert (=> b!1526074 (= e!850902 (= (select (arr!48982 lt!660898) (index!54557 lt!660935)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!159915 () Bool)

(declare-fun e!850899 () Bool)

(assert (=> d!159915 e!850899))

(declare-fun c!140857 () Bool)

(get-info :version)

(assert (=> d!159915 (= c!140857 (and ((_ is Intermediate!13040) lt!660935) (undefined!13852 lt!660935)))))

(declare-fun e!850900 () SeekEntryResult!13040)

(assert (=> d!159915 (= lt!660935 e!850900)))

(declare-fun c!140856 () Bool)

(assert (=> d!159915 (= c!140856 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!660936 () (_ BitVec 64))

(assert (=> d!159915 (= lt!660936 (select (arr!48982 lt!660898) (toIndex!0 lt!660897 mask!2512)))))

(assert (=> d!159915 (validMask!0 mask!2512)))

(assert (=> d!159915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660897 mask!2512) lt!660897 lt!660898 mask!2512) lt!660935)))

(declare-fun b!1526075 () Bool)

(declare-fun e!850903 () SeekEntryResult!13040)

(assert (=> b!1526075 (= e!850900 e!850903)))

(declare-fun c!140855 () Bool)

(assert (=> b!1526075 (= c!140855 (or (= lt!660936 lt!660897) (= (bvadd lt!660936 lt!660936) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1526076 () Bool)

(assert (=> b!1526076 (and (bvsge (index!54557 lt!660935) #b00000000000000000000000000000000) (bvslt (index!54557 lt!660935) (size!49533 lt!660898)))))

(declare-fun res!1043482 () Bool)

(assert (=> b!1526076 (= res!1043482 (= (select (arr!48982 lt!660898) (index!54557 lt!660935)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1526076 (=> res!1043482 e!850902)))

(declare-fun b!1526077 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526077 (= e!850903 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!660897 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) lt!660897 lt!660898 mask!2512))))

(declare-fun b!1526078 () Bool)

(assert (=> b!1526078 (= e!850899 e!850901)))

(declare-fun res!1043483 () Bool)

(assert (=> b!1526078 (= res!1043483 (and ((_ is Intermediate!13040) lt!660935) (not (undefined!13852 lt!660935)) (bvslt (x!136453 lt!660935) #b01111111111111111111111111111110) (bvsge (x!136453 lt!660935) #b00000000000000000000000000000000) (bvsge (x!136453 lt!660935) #b00000000000000000000000000000000)))))

(assert (=> b!1526078 (=> (not res!1043483) (not e!850901))))

(declare-fun b!1526079 () Bool)

(assert (=> b!1526079 (= e!850899 (bvsge (x!136453 lt!660935) #b01111111111111111111111111111110))))

(declare-fun b!1526080 () Bool)

(assert (=> b!1526080 (= e!850900 (Intermediate!13040 true (toIndex!0 lt!660897 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1526081 () Bool)

(assert (=> b!1526081 (= e!850903 (Intermediate!13040 false (toIndex!0 lt!660897 mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159915 c!140856) b!1526080))

(assert (= (and d!159915 (not c!140856)) b!1526075))

(assert (= (and b!1526075 c!140855) b!1526081))

(assert (= (and b!1526075 (not c!140855)) b!1526077))

(assert (= (and d!159915 c!140857) b!1526079))

(assert (= (and d!159915 (not c!140857)) b!1526078))

(assert (= (and b!1526078 res!1043483) b!1526073))

(assert (= (and b!1526073 (not res!1043484)) b!1526076))

(assert (= (and b!1526076 (not res!1043482)) b!1526074))

(assert (=> b!1526077 m!1408963))

(declare-fun m!1409083 () Bool)

(assert (=> b!1526077 m!1409083))

(assert (=> b!1526077 m!1409083))

(declare-fun m!1409085 () Bool)

(assert (=> b!1526077 m!1409085))

(assert (=> d!159915 m!1408963))

(declare-fun m!1409087 () Bool)

(assert (=> d!159915 m!1409087))

(assert (=> d!159915 m!1408985))

(declare-fun m!1409089 () Bool)

(assert (=> b!1526076 m!1409089))

(assert (=> b!1526073 m!1409089))

(assert (=> b!1526074 m!1409089))

(assert (=> b!1525980 d!159915))

(declare-fun d!159921 () Bool)

(declare-fun lt!660942 () (_ BitVec 32))

(declare-fun lt!660941 () (_ BitVec 32))

(assert (=> d!159921 (= lt!660942 (bvmul (bvxor lt!660941 (bvlshr lt!660941 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159921 (= lt!660941 ((_ extract 31 0) (bvand (bvxor lt!660897 (bvlshr lt!660897 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159921 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043485 (let ((h!36893 ((_ extract 31 0) (bvand (bvxor lt!660897 (bvlshr lt!660897 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136457 (bvmul (bvxor h!36893 (bvlshr h!36893 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136457 (bvlshr x!136457 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043485 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043485 #b00000000000000000000000000000000))))))

(assert (=> d!159921 (= (toIndex!0 lt!660897 mask!2512) (bvand (bvxor lt!660942 (bvlshr lt!660942 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1525980 d!159921))

(declare-fun b!1526117 () Bool)

(declare-fun e!850929 () Bool)

(declare-fun e!850930 () Bool)

(assert (=> b!1526117 (= e!850929 e!850930)))

(declare-fun c!140869 () Bool)

(assert (=> b!1526117 (= c!140869 (validKeyInArray!0 (select (arr!48982 a!2804) j!70)))))

(declare-fun d!159923 () Bool)

(declare-fun res!1043499 () Bool)

(assert (=> d!159923 (=> res!1043499 e!850929)))

(assert (=> d!159923 (= res!1043499 (bvsge j!70 (size!49533 a!2804)))))

(assert (=> d!159923 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!850929)))

(declare-fun b!1526118 () Bool)

(declare-fun call!68544 () Bool)

(assert (=> b!1526118 (= e!850930 call!68544)))

(declare-fun bm!68541 () Bool)

(assert (=> bm!68541 (= call!68544 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1526119 () Bool)

(declare-fun e!850928 () Bool)

(assert (=> b!1526119 (= e!850930 e!850928)))

(declare-fun lt!660955 () (_ BitVec 64))

(assert (=> b!1526119 (= lt!660955 (select (arr!48982 a!2804) j!70))))

(declare-fun lt!660956 () Unit!50899)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101515 (_ BitVec 64) (_ BitVec 32)) Unit!50899)

(assert (=> b!1526119 (= lt!660956 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660955 j!70))))

(declare-fun arrayContainsKey!0 (array!101515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1526119 (arrayContainsKey!0 a!2804 lt!660955 #b00000000000000000000000000000000)))

(declare-fun lt!660957 () Unit!50899)

(assert (=> b!1526119 (= lt!660957 lt!660956)))

(declare-fun res!1043500 () Bool)

(assert (=> b!1526119 (= res!1043500 (= (seekEntryOrOpen!0 (select (arr!48982 a!2804) j!70) a!2804 mask!2512) (Found!13040 j!70)))))

(assert (=> b!1526119 (=> (not res!1043500) (not e!850928))))

(declare-fun b!1526120 () Bool)

(assert (=> b!1526120 (= e!850928 call!68544)))

(assert (= (and d!159923 (not res!1043499)) b!1526117))

(assert (= (and b!1526117 c!140869) b!1526119))

(assert (= (and b!1526117 (not c!140869)) b!1526118))

(assert (= (and b!1526119 res!1043500) b!1526120))

(assert (= (or b!1526120 b!1526118) bm!68541))

(assert (=> b!1526117 m!1408957))

(assert (=> b!1526117 m!1408957))

(assert (=> b!1526117 m!1408989))

(declare-fun m!1409099 () Bool)

(assert (=> bm!68541 m!1409099))

(assert (=> b!1526119 m!1408957))

(declare-fun m!1409101 () Bool)

(assert (=> b!1526119 m!1409101))

(declare-fun m!1409103 () Bool)

(assert (=> b!1526119 m!1409103))

(assert (=> b!1526119 m!1408957))

(assert (=> b!1526119 m!1408979))

(assert (=> b!1525971 d!159923))

(declare-fun d!159929 () Bool)

(assert (=> d!159929 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660971 () Unit!50899)

(declare-fun choose!38 (array!101515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50899)

(assert (=> d!159929 (= lt!660971 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159929 (validMask!0 mask!2512)))

(assert (=> d!159929 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660971)))

(declare-fun bs!43760 () Bool)

(assert (= bs!43760 d!159929))

(assert (=> bs!43760 m!1408993))

(declare-fun m!1409125 () Bool)

(assert (=> bs!43760 m!1409125))

(assert (=> bs!43760 m!1408985))

(assert (=> b!1525971 d!159929))

(declare-fun b!1526172 () Bool)

(declare-fun e!850964 () SeekEntryResult!13040)

(declare-fun lt!660989 () SeekEntryResult!13040)

(assert (=> b!1526172 (= e!850964 (ite ((_ is MissingVacant!13040) lt!660989) (MissingZero!13040 (index!54558 lt!660989)) lt!660989))))

(declare-fun lt!660987 () SeekEntryResult!13040)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101515 (_ BitVec 32)) SeekEntryResult!13040)

(assert (=> b!1526172 (= lt!660989 (seekKeyOrZeroReturnVacant!0 (x!136453 lt!660987) (index!54557 lt!660987) (index!54557 lt!660987) (select (arr!48982 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526173 () Bool)

(assert (=> b!1526173 (= e!850964 (MissingZero!13040 (index!54557 lt!660987)))))

(declare-fun b!1526174 () Bool)

(declare-fun c!140888 () Bool)

(declare-fun lt!660990 () (_ BitVec 64))

(assert (=> b!1526174 (= c!140888 (= lt!660990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850966 () SeekEntryResult!13040)

(assert (=> b!1526174 (= e!850966 e!850964)))

(declare-fun b!1526176 () Bool)

(declare-fun e!850965 () SeekEntryResult!13040)

(assert (=> b!1526176 (= e!850965 e!850966)))

(assert (=> b!1526176 (= lt!660990 (select (arr!48982 a!2804) (index!54557 lt!660987)))))

(declare-fun c!140890 () Bool)

(assert (=> b!1526176 (= c!140890 (= lt!660990 (select (arr!48982 a!2804) j!70)))))

(declare-fun b!1526177 () Bool)

(assert (=> b!1526177 (= e!850965 Undefined!13040)))

(declare-fun d!159935 () Bool)

(declare-fun lt!660988 () SeekEntryResult!13040)

(assert (=> d!159935 (and (or ((_ is MissingVacant!13040) lt!660988) (not ((_ is Found!13040) lt!660988)) (and (bvsge (index!54556 lt!660988) #b00000000000000000000000000000000) (bvslt (index!54556 lt!660988) (size!49533 a!2804)))) (not ((_ is MissingVacant!13040) lt!660988)) (or (not ((_ is Found!13040) lt!660988)) (= (select (arr!48982 a!2804) (index!54556 lt!660988)) (select (arr!48982 a!2804) j!70))))))

(assert (=> d!159935 (= lt!660988 e!850965)))

(declare-fun c!140889 () Bool)

(assert (=> d!159935 (= c!140889 (and ((_ is Intermediate!13040) lt!660987) (undefined!13852 lt!660987)))))

(assert (=> d!159935 (= lt!660987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48982 a!2804) j!70) mask!2512) (select (arr!48982 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159935 (validMask!0 mask!2512)))

(assert (=> d!159935 (= (seekEntry!0 (select (arr!48982 a!2804) j!70) a!2804 mask!2512) lt!660988)))

(declare-fun b!1526175 () Bool)

(assert (=> b!1526175 (= e!850966 (Found!13040 (index!54557 lt!660987)))))

(assert (= (and d!159935 c!140889) b!1526177))

(assert (= (and d!159935 (not c!140889)) b!1526176))

(assert (= (and b!1526176 c!140890) b!1526175))

(assert (= (and b!1526176 (not c!140890)) b!1526174))

(assert (= (and b!1526174 c!140888) b!1526173))

(assert (= (and b!1526174 (not c!140888)) b!1526172))

(assert (=> b!1526172 m!1408957))

(declare-fun m!1409143 () Bool)

(assert (=> b!1526172 m!1409143))

(declare-fun m!1409145 () Bool)

(assert (=> b!1526176 m!1409145))

(declare-fun m!1409147 () Bool)

(assert (=> d!159935 m!1409147))

(assert (=> d!159935 m!1408957))

(assert (=> d!159935 m!1408959))

(assert (=> d!159935 m!1408959))

(assert (=> d!159935 m!1408957))

(assert (=> d!159935 m!1408961))

(assert (=> d!159935 m!1408985))

(assert (=> b!1525981 d!159935))

(declare-fun d!159945 () Bool)

(assert (=> d!159945 (= (validKeyInArray!0 (select (arr!48982 a!2804) i!961)) (and (not (= (select (arr!48982 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48982 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1525972 d!159945))

(declare-fun d!159947 () Bool)

(assert (=> d!159947 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130182 d!159947))

(declare-fun d!159951 () Bool)

(assert (=> d!159951 (= (array_inv!38263 a!2804) (bvsge (size!49533 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130182 d!159951))

(declare-fun b!1526292 () Bool)

(declare-fun c!140934 () Bool)

(declare-fun lt!661043 () (_ BitVec 64))

(assert (=> b!1526292 (= c!140934 (= lt!661043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851033 () SeekEntryResult!13040)

(declare-fun e!851032 () SeekEntryResult!13040)

(assert (=> b!1526292 (= e!851033 e!851032)))

(declare-fun b!1526293 () Bool)

(declare-fun lt!661042 () SeekEntryResult!13040)

(assert (=> b!1526293 (= e!851032 (MissingZero!13040 (index!54557 lt!661042)))))

(declare-fun b!1526294 () Bool)

(assert (=> b!1526294 (= e!851032 (seekKeyOrZeroReturnVacant!0 (x!136453 lt!661042) (index!54557 lt!661042) (index!54557 lt!661042) (select (arr!48982 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159953 () Bool)

(declare-fun lt!661044 () SeekEntryResult!13040)

(assert (=> d!159953 (and (or ((_ is Undefined!13040) lt!661044) (not ((_ is Found!13040) lt!661044)) (and (bvsge (index!54556 lt!661044) #b00000000000000000000000000000000) (bvslt (index!54556 lt!661044) (size!49533 a!2804)))) (or ((_ is Undefined!13040) lt!661044) ((_ is Found!13040) lt!661044) (not ((_ is MissingZero!13040) lt!661044)) (and (bvsge (index!54555 lt!661044) #b00000000000000000000000000000000) (bvslt (index!54555 lt!661044) (size!49533 a!2804)))) (or ((_ is Undefined!13040) lt!661044) ((_ is Found!13040) lt!661044) ((_ is MissingZero!13040) lt!661044) (not ((_ is MissingVacant!13040) lt!661044)) (and (bvsge (index!54558 lt!661044) #b00000000000000000000000000000000) (bvslt (index!54558 lt!661044) (size!49533 a!2804)))) (or ((_ is Undefined!13040) lt!661044) (ite ((_ is Found!13040) lt!661044) (= (select (arr!48982 a!2804) (index!54556 lt!661044)) (select (arr!48982 a!2804) j!70)) (ite ((_ is MissingZero!13040) lt!661044) (= (select (arr!48982 a!2804) (index!54555 lt!661044)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13040) lt!661044) (= (select (arr!48982 a!2804) (index!54558 lt!661044)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!851031 () SeekEntryResult!13040)

(assert (=> d!159953 (= lt!661044 e!851031)))

(declare-fun c!140935 () Bool)

(assert (=> d!159953 (= c!140935 (and ((_ is Intermediate!13040) lt!661042) (undefined!13852 lt!661042)))))

(assert (=> d!159953 (= lt!661042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48982 a!2804) j!70) mask!2512) (select (arr!48982 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159953 (validMask!0 mask!2512)))

(assert (=> d!159953 (= (seekEntryOrOpen!0 (select (arr!48982 a!2804) j!70) a!2804 mask!2512) lt!661044)))

(declare-fun b!1526295 () Bool)

(assert (=> b!1526295 (= e!851031 Undefined!13040)))

(declare-fun b!1526296 () Bool)

(assert (=> b!1526296 (= e!851031 e!851033)))

(assert (=> b!1526296 (= lt!661043 (select (arr!48982 a!2804) (index!54557 lt!661042)))))

(declare-fun c!140933 () Bool)

(assert (=> b!1526296 (= c!140933 (= lt!661043 (select (arr!48982 a!2804) j!70)))))

(declare-fun b!1526297 () Bool)

(assert (=> b!1526297 (= e!851033 (Found!13040 (index!54557 lt!661042)))))

(assert (= (and d!159953 c!140935) b!1526295))

(assert (= (and d!159953 (not c!140935)) b!1526296))

(assert (= (and b!1526296 c!140933) b!1526297))

(assert (= (and b!1526296 (not c!140933)) b!1526292))

(assert (= (and b!1526292 c!140934) b!1526293))

(assert (= (and b!1526292 (not c!140934)) b!1526294))

(assert (=> b!1526294 m!1408957))

(declare-fun m!1409191 () Bool)

(assert (=> b!1526294 m!1409191))

(assert (=> d!159953 m!1408957))

(assert (=> d!159953 m!1408959))

(assert (=> d!159953 m!1408959))

(assert (=> d!159953 m!1408957))

(assert (=> d!159953 m!1408961))

(declare-fun m!1409193 () Bool)

(assert (=> d!159953 m!1409193))

(assert (=> d!159953 m!1408985))

(declare-fun m!1409195 () Bool)

(assert (=> d!159953 m!1409195))

(declare-fun m!1409197 () Bool)

(assert (=> d!159953 m!1409197))

(declare-fun m!1409199 () Bool)

(assert (=> b!1526296 m!1409199))

(assert (=> b!1525973 d!159953))

(declare-fun b!1526298 () Bool)

(declare-fun c!140937 () Bool)

(declare-fun lt!661046 () (_ BitVec 64))

(assert (=> b!1526298 (= c!140937 (= lt!661046 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!851036 () SeekEntryResult!13040)

(declare-fun e!851035 () SeekEntryResult!13040)

(assert (=> b!1526298 (= e!851036 e!851035)))

(declare-fun b!1526299 () Bool)

(declare-fun lt!661045 () SeekEntryResult!13040)

(assert (=> b!1526299 (= e!851035 (MissingZero!13040 (index!54557 lt!661045)))))

(declare-fun b!1526300 () Bool)

(assert (=> b!1526300 (= e!851035 (seekKeyOrZeroReturnVacant!0 (x!136453 lt!661045) (index!54557 lt!661045) (index!54557 lt!661045) lt!660897 lt!660898 mask!2512))))

(declare-fun d!159969 () Bool)

(declare-fun lt!661047 () SeekEntryResult!13040)

(assert (=> d!159969 (and (or ((_ is Undefined!13040) lt!661047) (not ((_ is Found!13040) lt!661047)) (and (bvsge (index!54556 lt!661047) #b00000000000000000000000000000000) (bvslt (index!54556 lt!661047) (size!49533 lt!660898)))) (or ((_ is Undefined!13040) lt!661047) ((_ is Found!13040) lt!661047) (not ((_ is MissingZero!13040) lt!661047)) (and (bvsge (index!54555 lt!661047) #b00000000000000000000000000000000) (bvslt (index!54555 lt!661047) (size!49533 lt!660898)))) (or ((_ is Undefined!13040) lt!661047) ((_ is Found!13040) lt!661047) ((_ is MissingZero!13040) lt!661047) (not ((_ is MissingVacant!13040) lt!661047)) (and (bvsge (index!54558 lt!661047) #b00000000000000000000000000000000) (bvslt (index!54558 lt!661047) (size!49533 lt!660898)))) (or ((_ is Undefined!13040) lt!661047) (ite ((_ is Found!13040) lt!661047) (= (select (arr!48982 lt!660898) (index!54556 lt!661047)) lt!660897) (ite ((_ is MissingZero!13040) lt!661047) (= (select (arr!48982 lt!660898) (index!54555 lt!661047)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13040) lt!661047) (= (select (arr!48982 lt!660898) (index!54558 lt!661047)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!851034 () SeekEntryResult!13040)

(assert (=> d!159969 (= lt!661047 e!851034)))

(declare-fun c!140938 () Bool)

(assert (=> d!159969 (= c!140938 (and ((_ is Intermediate!13040) lt!661045) (undefined!13852 lt!661045)))))

(assert (=> d!159969 (= lt!661045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660897 mask!2512) lt!660897 lt!660898 mask!2512))))

(assert (=> d!159969 (validMask!0 mask!2512)))

(assert (=> d!159969 (= (seekEntryOrOpen!0 lt!660897 lt!660898 mask!2512) lt!661047)))

(declare-fun b!1526301 () Bool)

(assert (=> b!1526301 (= e!851034 Undefined!13040)))

(declare-fun b!1526302 () Bool)

(assert (=> b!1526302 (= e!851034 e!851036)))

(assert (=> b!1526302 (= lt!661046 (select (arr!48982 lt!660898) (index!54557 lt!661045)))))

(declare-fun c!140936 () Bool)

(assert (=> b!1526302 (= c!140936 (= lt!661046 lt!660897))))

(declare-fun b!1526303 () Bool)

(assert (=> b!1526303 (= e!851036 (Found!13040 (index!54557 lt!661045)))))

(assert (= (and d!159969 c!140938) b!1526301))

(assert (= (and d!159969 (not c!140938)) b!1526302))

(assert (= (and b!1526302 c!140936) b!1526303))

(assert (= (and b!1526302 (not c!140936)) b!1526298))

(assert (= (and b!1526298 c!140937) b!1526299))

(assert (= (and b!1526298 (not c!140937)) b!1526300))

(declare-fun m!1409201 () Bool)

(assert (=> b!1526300 m!1409201))

(assert (=> d!159969 m!1408963))

(assert (=> d!159969 m!1408963))

(assert (=> d!159969 m!1408965))

(declare-fun m!1409203 () Bool)

(assert (=> d!159969 m!1409203))

(assert (=> d!159969 m!1408985))

(declare-fun m!1409205 () Bool)

(assert (=> d!159969 m!1409205))

(declare-fun m!1409207 () Bool)

(assert (=> d!159969 m!1409207))

(declare-fun m!1409209 () Bool)

(assert (=> b!1526302 m!1409209))

(assert (=> b!1525973 d!159969))

(declare-fun b!1526304 () Bool)

(declare-fun lt!661050 () SeekEntryResult!13040)

(assert (=> b!1526304 (and (bvsge (index!54557 lt!661050) #b00000000000000000000000000000000) (bvslt (index!54557 lt!661050) (size!49533 a!2804)))))

(declare-fun res!1043550 () Bool)

(assert (=> b!1526304 (= res!1043550 (= (select (arr!48982 a!2804) (index!54557 lt!661050)) (select (arr!48982 a!2804) j!70)))))

(declare-fun e!851040 () Bool)

(assert (=> b!1526304 (=> res!1043550 e!851040)))

(declare-fun e!851039 () Bool)

(assert (=> b!1526304 (= e!851039 e!851040)))

(declare-fun b!1526305 () Bool)

(assert (=> b!1526305 (and (bvsge (index!54557 lt!661050) #b00000000000000000000000000000000) (bvslt (index!54557 lt!661050) (size!49533 a!2804)))))

(assert (=> b!1526305 (= e!851040 (= (select (arr!48982 a!2804) (index!54557 lt!661050)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!159971 () Bool)

(declare-fun e!851037 () Bool)

(assert (=> d!159971 e!851037))

(declare-fun c!140941 () Bool)

(assert (=> d!159971 (= c!140941 (and ((_ is Intermediate!13040) lt!661050) (undefined!13852 lt!661050)))))

(declare-fun e!851038 () SeekEntryResult!13040)

(assert (=> d!159971 (= lt!661050 e!851038)))

(declare-fun c!140940 () Bool)

(assert (=> d!159971 (= c!140940 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!661051 () (_ BitVec 64))

(assert (=> d!159971 (= lt!661051 (select (arr!48982 a!2804) (toIndex!0 (select (arr!48982 a!2804) j!70) mask!2512)))))

(assert (=> d!159971 (validMask!0 mask!2512)))

(assert (=> d!159971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48982 a!2804) j!70) mask!2512) (select (arr!48982 a!2804) j!70) a!2804 mask!2512) lt!661050)))

(declare-fun b!1526306 () Bool)

(declare-fun e!851041 () SeekEntryResult!13040)

(assert (=> b!1526306 (= e!851038 e!851041)))

(declare-fun c!140939 () Bool)

(assert (=> b!1526306 (= c!140939 (or (= lt!661051 (select (arr!48982 a!2804) j!70)) (= (bvadd lt!661051 lt!661051) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1526307 () Bool)

(assert (=> b!1526307 (and (bvsge (index!54557 lt!661050) #b00000000000000000000000000000000) (bvslt (index!54557 lt!661050) (size!49533 a!2804)))))

(declare-fun res!1043548 () Bool)

(assert (=> b!1526307 (= res!1043548 (= (select (arr!48982 a!2804) (index!54557 lt!661050)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1526307 (=> res!1043548 e!851040)))

(declare-fun b!1526308 () Bool)

(assert (=> b!1526308 (= e!851041 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48982 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48982 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526309 () Bool)

(assert (=> b!1526309 (= e!851037 e!851039)))

(declare-fun res!1043549 () Bool)

(assert (=> b!1526309 (= res!1043549 (and ((_ is Intermediate!13040) lt!661050) (not (undefined!13852 lt!661050)) (bvslt (x!136453 lt!661050) #b01111111111111111111111111111110) (bvsge (x!136453 lt!661050) #b00000000000000000000000000000000) (bvsge (x!136453 lt!661050) #b00000000000000000000000000000000)))))

(assert (=> b!1526309 (=> (not res!1043549) (not e!851039))))

(declare-fun b!1526310 () Bool)

(assert (=> b!1526310 (= e!851037 (bvsge (x!136453 lt!661050) #b01111111111111111111111111111110))))

(declare-fun b!1526311 () Bool)

(assert (=> b!1526311 (= e!851038 (Intermediate!13040 true (toIndex!0 (select (arr!48982 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1526312 () Bool)

(assert (=> b!1526312 (= e!851041 (Intermediate!13040 false (toIndex!0 (select (arr!48982 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159971 c!140940) b!1526311))

(assert (= (and d!159971 (not c!140940)) b!1526306))

(assert (= (and b!1526306 c!140939) b!1526312))

(assert (= (and b!1526306 (not c!140939)) b!1526308))

(assert (= (and d!159971 c!140941) b!1526310))

(assert (= (and d!159971 (not c!140941)) b!1526309))

(assert (= (and b!1526309 res!1043549) b!1526304))

(assert (= (and b!1526304 (not res!1043550)) b!1526307))

(assert (= (and b!1526307 (not res!1043548)) b!1526305))

(assert (=> b!1526308 m!1408959))

(declare-fun m!1409213 () Bool)

(assert (=> b!1526308 m!1409213))

(assert (=> b!1526308 m!1409213))

(assert (=> b!1526308 m!1408957))

(declare-fun m!1409215 () Bool)

(assert (=> b!1526308 m!1409215))

(assert (=> d!159971 m!1408959))

(declare-fun m!1409217 () Bool)

(assert (=> d!159971 m!1409217))

(assert (=> d!159971 m!1408985))

(declare-fun m!1409219 () Bool)

(assert (=> b!1526307 m!1409219))

(assert (=> b!1526304 m!1409219))

(assert (=> b!1526305 m!1409219))

(assert (=> b!1525974 d!159971))

(declare-fun d!159975 () Bool)

(declare-fun lt!661058 () (_ BitVec 32))

(declare-fun lt!661057 () (_ BitVec 32))

(assert (=> d!159975 (= lt!661058 (bvmul (bvxor lt!661057 (bvlshr lt!661057 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159975 (= lt!661057 ((_ extract 31 0) (bvand (bvxor (select (arr!48982 a!2804) j!70) (bvlshr (select (arr!48982 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159975 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043485 (let ((h!36893 ((_ extract 31 0) (bvand (bvxor (select (arr!48982 a!2804) j!70) (bvlshr (select (arr!48982 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136457 (bvmul (bvxor h!36893 (bvlshr h!36893 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136457 (bvlshr x!136457 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043485 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043485 #b00000000000000000000000000000000))))))

(assert (=> d!159975 (= (toIndex!0 (select (arr!48982 a!2804) j!70) mask!2512) (bvand (bvxor lt!661058 (bvlshr lt!661058 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1525974 d!159975))

(declare-fun b!1526313 () Bool)

(declare-fun lt!661059 () SeekEntryResult!13040)

(assert (=> b!1526313 (and (bvsge (index!54557 lt!661059) #b00000000000000000000000000000000) (bvslt (index!54557 lt!661059) (size!49533 a!2804)))))

(declare-fun res!1043553 () Bool)

(assert (=> b!1526313 (= res!1043553 (= (select (arr!48982 a!2804) (index!54557 lt!661059)) (select (arr!48982 a!2804) j!70)))))

(declare-fun e!851045 () Bool)

(assert (=> b!1526313 (=> res!1043553 e!851045)))

(declare-fun e!851044 () Bool)

(assert (=> b!1526313 (= e!851044 e!851045)))

(declare-fun b!1526314 () Bool)

(assert (=> b!1526314 (and (bvsge (index!54557 lt!661059) #b00000000000000000000000000000000) (bvslt (index!54557 lt!661059) (size!49533 a!2804)))))

(assert (=> b!1526314 (= e!851045 (= (select (arr!48982 a!2804) (index!54557 lt!661059)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!159977 () Bool)

(declare-fun e!851042 () Bool)

(assert (=> d!159977 e!851042))

(declare-fun c!140944 () Bool)

(assert (=> d!159977 (= c!140944 (and ((_ is Intermediate!13040) lt!661059) (undefined!13852 lt!661059)))))

(declare-fun e!851043 () SeekEntryResult!13040)

(assert (=> d!159977 (= lt!661059 e!851043)))

(declare-fun c!140943 () Bool)

(assert (=> d!159977 (= c!140943 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!661060 () (_ BitVec 64))

(assert (=> d!159977 (= lt!661060 (select (arr!48982 a!2804) index!487))))

(assert (=> d!159977 (validMask!0 mask!2512)))

(assert (=> d!159977 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48982 a!2804) j!70) a!2804 mask!2512) lt!661059)))

(declare-fun b!1526315 () Bool)

(declare-fun e!851046 () SeekEntryResult!13040)

(assert (=> b!1526315 (= e!851043 e!851046)))

(declare-fun c!140942 () Bool)

(assert (=> b!1526315 (= c!140942 (or (= lt!661060 (select (arr!48982 a!2804) j!70)) (= (bvadd lt!661060 lt!661060) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1526316 () Bool)

(assert (=> b!1526316 (and (bvsge (index!54557 lt!661059) #b00000000000000000000000000000000) (bvslt (index!54557 lt!661059) (size!49533 a!2804)))))

(declare-fun res!1043551 () Bool)

(assert (=> b!1526316 (= res!1043551 (= (select (arr!48982 a!2804) (index!54557 lt!661059)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1526316 (=> res!1043551 e!851045)))

(declare-fun b!1526317 () Bool)

(assert (=> b!1526317 (= e!851046 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48982 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526318 () Bool)

(assert (=> b!1526318 (= e!851042 e!851044)))

(declare-fun res!1043552 () Bool)

(assert (=> b!1526318 (= res!1043552 (and ((_ is Intermediate!13040) lt!661059) (not (undefined!13852 lt!661059)) (bvslt (x!136453 lt!661059) #b01111111111111111111111111111110) (bvsge (x!136453 lt!661059) #b00000000000000000000000000000000) (bvsge (x!136453 lt!661059) x!534)))))

(assert (=> b!1526318 (=> (not res!1043552) (not e!851044))))

(declare-fun b!1526319 () Bool)

(assert (=> b!1526319 (= e!851042 (bvsge (x!136453 lt!661059) #b01111111111111111111111111111110))))

(declare-fun b!1526320 () Bool)

(assert (=> b!1526320 (= e!851043 (Intermediate!13040 true index!487 x!534))))

(declare-fun b!1526321 () Bool)

(assert (=> b!1526321 (= e!851046 (Intermediate!13040 false index!487 x!534))))

(assert (= (and d!159977 c!140943) b!1526320))

(assert (= (and d!159977 (not c!140943)) b!1526315))

(assert (= (and b!1526315 c!140942) b!1526321))

(assert (= (and b!1526315 (not c!140942)) b!1526317))

(assert (= (and d!159977 c!140944) b!1526319))

(assert (= (and d!159977 (not c!140944)) b!1526318))

(assert (= (and b!1526318 res!1043552) b!1526313))

(assert (= (and b!1526313 (not res!1043553)) b!1526316))

(assert (= (and b!1526316 (not res!1043551)) b!1526314))

(declare-fun m!1409221 () Bool)

(assert (=> b!1526317 m!1409221))

(assert (=> b!1526317 m!1409221))

(assert (=> b!1526317 m!1408957))

(declare-fun m!1409223 () Bool)

(assert (=> b!1526317 m!1409223))

(assert (=> d!159977 m!1408991))

(assert (=> d!159977 m!1408985))

(declare-fun m!1409225 () Bool)

(assert (=> b!1526316 m!1409225))

(assert (=> b!1526313 m!1409225))

(assert (=> b!1526314 m!1409225))

(assert (=> b!1525976 d!159977))

(declare-fun b!1526326 () Bool)

(declare-fun e!851051 () Bool)

(declare-fun e!851052 () Bool)

(assert (=> b!1526326 (= e!851051 e!851052)))

(declare-fun c!140946 () Bool)

(assert (=> b!1526326 (= c!140946 (validKeyInArray!0 (select (arr!48982 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159981 () Bool)

(declare-fun res!1043556 () Bool)

(assert (=> d!159981 (=> res!1043556 e!851051)))

(assert (=> d!159981 (= res!1043556 (bvsge #b00000000000000000000000000000000 (size!49533 a!2804)))))

(assert (=> d!159981 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!851051)))

(declare-fun b!1526327 () Bool)

(declare-fun call!68555 () Bool)

(assert (=> b!1526327 (= e!851052 call!68555)))

(declare-fun bm!68552 () Bool)

(assert (=> bm!68552 (= call!68555 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1526328 () Bool)

(declare-fun e!851050 () Bool)

(assert (=> b!1526328 (= e!851052 e!851050)))

(declare-fun lt!661066 () (_ BitVec 64))

(assert (=> b!1526328 (= lt!661066 (select (arr!48982 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!661067 () Unit!50899)

(assert (=> b!1526328 (= lt!661067 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!661066 #b00000000000000000000000000000000))))

(assert (=> b!1526328 (arrayContainsKey!0 a!2804 lt!661066 #b00000000000000000000000000000000)))

(declare-fun lt!661068 () Unit!50899)

(assert (=> b!1526328 (= lt!661068 lt!661067)))

(declare-fun res!1043557 () Bool)

(assert (=> b!1526328 (= res!1043557 (= (seekEntryOrOpen!0 (select (arr!48982 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13040 #b00000000000000000000000000000000)))))

(assert (=> b!1526328 (=> (not res!1043557) (not e!851050))))

(declare-fun b!1526329 () Bool)

(assert (=> b!1526329 (= e!851050 call!68555)))

(assert (= (and d!159981 (not res!1043556)) b!1526326))

(assert (= (and b!1526326 c!140946) b!1526328))

(assert (= (and b!1526326 (not c!140946)) b!1526327))

(assert (= (and b!1526328 res!1043557) b!1526329))

(assert (= (or b!1526329 b!1526327) bm!68552))

(declare-fun m!1409235 () Bool)

(assert (=> b!1526326 m!1409235))

(assert (=> b!1526326 m!1409235))

(declare-fun m!1409237 () Bool)

(assert (=> b!1526326 m!1409237))

(declare-fun m!1409239 () Bool)

(assert (=> bm!68552 m!1409239))

(assert (=> b!1526328 m!1409235))

(declare-fun m!1409241 () Bool)

(assert (=> b!1526328 m!1409241))

(declare-fun m!1409243 () Bool)

(assert (=> b!1526328 m!1409243))

(assert (=> b!1526328 m!1409235))

(declare-fun m!1409245 () Bool)

(assert (=> b!1526328 m!1409245))

(assert (=> b!1525977 d!159981))

(declare-fun d!159985 () Bool)

(assert (=> d!159985 (= (validKeyInArray!0 (select (arr!48982 a!2804) j!70)) (and (not (= (select (arr!48982 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48982 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1525979 d!159985))

(declare-fun b!1526340 () Bool)

(declare-fun e!851063 () Bool)

(declare-fun e!851064 () Bool)

(assert (=> b!1526340 (= e!851063 e!851064)))

(declare-fun c!140949 () Bool)

(assert (=> b!1526340 (= c!140949 (validKeyInArray!0 (select (arr!48982 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1526341 () Bool)

(declare-fun e!851062 () Bool)

(declare-fun contains!10038 (List!35452 (_ BitVec 64)) Bool)

(assert (=> b!1526341 (= e!851062 (contains!10038 Nil!35449 (select (arr!48982 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1526342 () Bool)

(declare-fun call!68558 () Bool)

(assert (=> b!1526342 (= e!851064 call!68558)))

(declare-fun d!159987 () Bool)

(declare-fun res!1043566 () Bool)

(declare-fun e!851061 () Bool)

(assert (=> d!159987 (=> res!1043566 e!851061)))

(assert (=> d!159987 (= res!1043566 (bvsge #b00000000000000000000000000000000 (size!49533 a!2804)))))

(assert (=> d!159987 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35449) e!851061)))

(declare-fun b!1526343 () Bool)

(assert (=> b!1526343 (= e!851061 e!851063)))

(declare-fun res!1043565 () Bool)

(assert (=> b!1526343 (=> (not res!1043565) (not e!851063))))

(assert (=> b!1526343 (= res!1043565 (not e!851062))))

(declare-fun res!1043564 () Bool)

(assert (=> b!1526343 (=> (not res!1043564) (not e!851062))))

(assert (=> b!1526343 (= res!1043564 (validKeyInArray!0 (select (arr!48982 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68555 () Bool)

(assert (=> bm!68555 (= call!68558 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140949 (Cons!35448 (select (arr!48982 a!2804) #b00000000000000000000000000000000) Nil!35449) Nil!35449)))))

(declare-fun b!1526344 () Bool)

(assert (=> b!1526344 (= e!851064 call!68558)))

(assert (= (and d!159987 (not res!1043566)) b!1526343))

(assert (= (and b!1526343 res!1043564) b!1526341))

(assert (= (and b!1526343 res!1043565) b!1526340))

(assert (= (and b!1526340 c!140949) b!1526344))

(assert (= (and b!1526340 (not c!140949)) b!1526342))

(assert (= (or b!1526344 b!1526342) bm!68555))

(assert (=> b!1526340 m!1409235))

(assert (=> b!1526340 m!1409235))

(assert (=> b!1526340 m!1409237))

(assert (=> b!1526341 m!1409235))

(assert (=> b!1526341 m!1409235))

(declare-fun m!1409247 () Bool)

(assert (=> b!1526341 m!1409247))

(assert (=> b!1526343 m!1409235))

(assert (=> b!1526343 m!1409235))

(assert (=> b!1526343 m!1409237))

(assert (=> bm!68555 m!1409235))

(declare-fun m!1409249 () Bool)

(assert (=> bm!68555 m!1409249))

(assert (=> b!1525978 d!159987))

(check-sat (not d!159977) (not d!159969) (not b!1526119) (not bm!68541) (not b!1526077) (not d!159929) (not b!1526300) (not b!1526317) (not bm!68555) (not b!1526328) (not b!1526172) (not d!159935) (not b!1526294) (not d!159915) (not b!1526340) (not bm!68552) (not b!1526341) (not b!1526326) (not d!159971) (not b!1526343) (not b!1526308) (not d!159953) (not b!1526117))
(check-sat)
