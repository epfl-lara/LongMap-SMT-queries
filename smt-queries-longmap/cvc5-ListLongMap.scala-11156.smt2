; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130298 () Bool)

(assert start!130298)

(declare-fun b!1529928 () Bool)

(declare-fun res!1047640 () Bool)

(declare-fun e!852537 () Bool)

(assert (=> b!1529928 (=> (not res!1047640) (not e!852537))))

(declare-datatypes ((array!101648 0))(
  ( (array!101649 (arr!49049 (Array (_ BitVec 32) (_ BitVec 64))) (size!49599 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101648)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529928 (= res!1047640 (validKeyInArray!0 (select (arr!49049 a!2804) j!70)))))

(declare-fun b!1529929 () Bool)

(declare-fun res!1047641 () Bool)

(assert (=> b!1529929 (=> (not res!1047641) (not e!852537))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1529929 (= res!1047641 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49599 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49599 a!2804))))))

(declare-fun b!1529930 () Bool)

(declare-fun e!852538 () Bool)

(assert (=> b!1529930 (= e!852537 e!852538)))

(declare-fun res!1047635 () Bool)

(assert (=> b!1529930 (=> (not res!1047635) (not e!852538))))

(declare-datatypes ((SeekEntryResult!13214 0))(
  ( (MissingZero!13214 (index!55251 (_ BitVec 32))) (Found!13214 (index!55252 (_ BitVec 32))) (Intermediate!13214 (undefined!14026 Bool) (index!55253 (_ BitVec 32)) (x!136933 (_ BitVec 32))) (Undefined!13214) (MissingVacant!13214 (index!55254 (_ BitVec 32))) )
))
(declare-fun lt!662597 () SeekEntryResult!13214)

(declare-fun lt!662599 () SeekEntryResult!13214)

(assert (=> b!1529930 (= res!1047635 (= lt!662597 lt!662599))))

(assert (=> b!1529930 (= lt!662599 (Intermediate!13214 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101648 (_ BitVec 32)) SeekEntryResult!13214)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529930 (= lt!662597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49049 a!2804) j!70) mask!2512) (select (arr!49049 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529931 () Bool)

(declare-fun res!1047639 () Bool)

(assert (=> b!1529931 (=> (not res!1047639) (not e!852537))))

(declare-datatypes ((List!35532 0))(
  ( (Nil!35529) (Cons!35528 (h!36964 (_ BitVec 64)) (t!50226 List!35532)) )
))
(declare-fun arrayNoDuplicates!0 (array!101648 (_ BitVec 32) List!35532) Bool)

(assert (=> b!1529931 (= res!1047639 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35529))))

(declare-fun b!1529932 () Bool)

(declare-fun res!1047645 () Bool)

(assert (=> b!1529932 (=> (not res!1047645) (not e!852537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101648 (_ BitVec 32)) Bool)

(assert (=> b!1529932 (= res!1047645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529933 () Bool)

(declare-fun e!852535 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101648 (_ BitVec 32)) SeekEntryResult!13214)

(assert (=> b!1529933 (= e!852535 (= (seekEntry!0 (select (arr!49049 a!2804) j!70) a!2804 mask!2512) (Found!13214 j!70)))))

(declare-fun b!1529934 () Bool)

(declare-fun res!1047636 () Bool)

(assert (=> b!1529934 (=> (not res!1047636) (not e!852537))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1529934 (= res!1047636 (and (= (size!49599 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49599 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49599 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529935 () Bool)

(declare-fun e!852534 () Bool)

(assert (=> b!1529935 (= e!852538 (not e!852534))))

(declare-fun res!1047646 () Bool)

(assert (=> b!1529935 (=> res!1047646 e!852534)))

(assert (=> b!1529935 (= res!1047646 (or (not (= (select (arr!49049 a!2804) j!70) (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529935 e!852535))

(declare-fun res!1047642 () Bool)

(assert (=> b!1529935 (=> (not res!1047642) (not e!852535))))

(assert (=> b!1529935 (= res!1047642 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51212 0))(
  ( (Unit!51213) )
))
(declare-fun lt!662596 () Unit!51212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51212)

(assert (=> b!1529935 (= lt!662596 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1047643 () Bool)

(assert (=> start!130298 (=> (not res!1047643) (not e!852537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130298 (= res!1047643 (validMask!0 mask!2512))))

(assert (=> start!130298 e!852537))

(assert (=> start!130298 true))

(declare-fun array_inv!38077 (array!101648) Bool)

(assert (=> start!130298 (array_inv!38077 a!2804)))

(declare-fun b!1529936 () Bool)

(declare-fun res!1047644 () Bool)

(assert (=> b!1529936 (=> (not res!1047644) (not e!852537))))

(assert (=> b!1529936 (= res!1047644 (validKeyInArray!0 (select (arr!49049 a!2804) i!961)))))

(declare-fun b!1529937 () Bool)

(declare-fun res!1047638 () Bool)

(assert (=> b!1529937 (=> (not res!1047638) (not e!852538))))

(assert (=> b!1529937 (= res!1047638 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49049 a!2804) j!70) a!2804 mask!2512) lt!662599))))

(declare-fun b!1529938 () Bool)

(declare-fun res!1047637 () Bool)

(assert (=> b!1529938 (=> (not res!1047637) (not e!852538))))

(assert (=> b!1529938 (= res!1047637 (= lt!662597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101649 (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49599 a!2804)) mask!2512)))))

(declare-fun b!1529939 () Bool)

(assert (=> b!1529939 (= e!852534 (and (bvsge (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110)))))

(declare-fun lt!662598 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529939 (= lt!662598 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130298 res!1047643) b!1529934))

(assert (= (and b!1529934 res!1047636) b!1529936))

(assert (= (and b!1529936 res!1047644) b!1529928))

(assert (= (and b!1529928 res!1047640) b!1529932))

(assert (= (and b!1529932 res!1047645) b!1529931))

(assert (= (and b!1529931 res!1047639) b!1529929))

(assert (= (and b!1529929 res!1047641) b!1529930))

(assert (= (and b!1529930 res!1047635) b!1529937))

(assert (= (and b!1529937 res!1047638) b!1529938))

(assert (= (and b!1529938 res!1047637) b!1529935))

(assert (= (and b!1529935 res!1047642) b!1529933))

(assert (= (and b!1529935 (not res!1047646)) b!1529939))

(declare-fun m!1412901 () Bool)

(assert (=> b!1529937 m!1412901))

(assert (=> b!1529937 m!1412901))

(declare-fun m!1412903 () Bool)

(assert (=> b!1529937 m!1412903))

(declare-fun m!1412905 () Bool)

(assert (=> b!1529939 m!1412905))

(assert (=> b!1529933 m!1412901))

(assert (=> b!1529933 m!1412901))

(declare-fun m!1412907 () Bool)

(assert (=> b!1529933 m!1412907))

(assert (=> b!1529928 m!1412901))

(assert (=> b!1529928 m!1412901))

(declare-fun m!1412909 () Bool)

(assert (=> b!1529928 m!1412909))

(declare-fun m!1412911 () Bool)

(assert (=> b!1529936 m!1412911))

(assert (=> b!1529936 m!1412911))

(declare-fun m!1412913 () Bool)

(assert (=> b!1529936 m!1412913))

(assert (=> b!1529935 m!1412901))

(declare-fun m!1412915 () Bool)

(assert (=> b!1529935 m!1412915))

(declare-fun m!1412917 () Bool)

(assert (=> b!1529935 m!1412917))

(declare-fun m!1412919 () Bool)

(assert (=> b!1529935 m!1412919))

(declare-fun m!1412921 () Bool)

(assert (=> b!1529935 m!1412921))

(assert (=> b!1529938 m!1412917))

(assert (=> b!1529938 m!1412919))

(assert (=> b!1529938 m!1412919))

(declare-fun m!1412923 () Bool)

(assert (=> b!1529938 m!1412923))

(assert (=> b!1529938 m!1412923))

(assert (=> b!1529938 m!1412919))

(declare-fun m!1412925 () Bool)

(assert (=> b!1529938 m!1412925))

(declare-fun m!1412927 () Bool)

(assert (=> b!1529932 m!1412927))

(assert (=> b!1529930 m!1412901))

(assert (=> b!1529930 m!1412901))

(declare-fun m!1412929 () Bool)

(assert (=> b!1529930 m!1412929))

(assert (=> b!1529930 m!1412929))

(assert (=> b!1529930 m!1412901))

(declare-fun m!1412931 () Bool)

(assert (=> b!1529930 m!1412931))

(declare-fun m!1412933 () Bool)

(assert (=> b!1529931 m!1412933))

(declare-fun m!1412935 () Bool)

(assert (=> start!130298 m!1412935))

(declare-fun m!1412937 () Bool)

(assert (=> start!130298 m!1412937))

(push 1)

(assert (not b!1529928))

(assert (not b!1529937))

(assert (not b!1529933))

(assert (not b!1529932))

(assert (not start!130298))

(assert (not b!1529936))

(assert (not b!1529935))

(assert (not b!1529939))

(assert (not b!1529931))

(assert (not b!1529938))

(assert (not b!1529930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1530056 () Bool)

(declare-fun e!852595 () Bool)

(declare-fun e!852596 () Bool)

(assert (=> b!1530056 (= e!852595 e!852596)))

(declare-fun lt!662643 () (_ BitVec 64))

(assert (=> b!1530056 (= lt!662643 (select (arr!49049 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!662644 () Unit!51212)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101648 (_ BitVec 64) (_ BitVec 32)) Unit!51212)

(assert (=> b!1530056 (= lt!662644 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662643 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1530056 (arrayContainsKey!0 a!2804 lt!662643 #b00000000000000000000000000000000)))

(declare-fun lt!662642 () Unit!51212)

(assert (=> b!1530056 (= lt!662642 lt!662644)))

(declare-fun res!1047736 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101648 (_ BitVec 32)) SeekEntryResult!13214)

(assert (=> b!1530056 (= res!1047736 (= (seekEntryOrOpen!0 (select (arr!49049 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13214 #b00000000000000000000000000000000)))))

(assert (=> b!1530056 (=> (not res!1047736) (not e!852596))))

(declare-fun d!159739 () Bool)

(declare-fun res!1047737 () Bool)

(declare-fun e!852597 () Bool)

(assert (=> d!159739 (=> res!1047737 e!852597)))

(assert (=> d!159739 (= res!1047737 (bvsge #b00000000000000000000000000000000 (size!49599 a!2804)))))

(assert (=> d!159739 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!852597)))

(declare-fun b!1530057 () Bool)

(assert (=> b!1530057 (= e!852597 e!852595)))

(declare-fun c!140714 () Bool)

(assert (=> b!1530057 (= c!140714 (validKeyInArray!0 (select (arr!49049 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530058 () Bool)

(declare-fun call!68493 () Bool)

(assert (=> b!1530058 (= e!852595 call!68493)))

(declare-fun b!1530059 () Bool)

(assert (=> b!1530059 (= e!852596 call!68493)))

(declare-fun bm!68490 () Bool)

(assert (=> bm!68490 (= call!68493 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159739 (not res!1047737)) b!1530057))

(assert (= (and b!1530057 c!140714) b!1530056))

(assert (= (and b!1530057 (not c!140714)) b!1530058))

(assert (= (and b!1530056 res!1047736) b!1530059))

(assert (= (or b!1530059 b!1530058) bm!68490))

(declare-fun m!1413029 () Bool)

(assert (=> b!1530056 m!1413029))

(declare-fun m!1413031 () Bool)

(assert (=> b!1530056 m!1413031))

(declare-fun m!1413033 () Bool)

(assert (=> b!1530056 m!1413033))

(assert (=> b!1530056 m!1413029))

(declare-fun m!1413035 () Bool)

(assert (=> b!1530056 m!1413035))

(assert (=> b!1530057 m!1413029))

(assert (=> b!1530057 m!1413029))

(declare-fun m!1413037 () Bool)

(assert (=> b!1530057 m!1413037))

(declare-fun m!1413039 () Bool)

(assert (=> bm!68490 m!1413039))

(assert (=> b!1529932 d!159739))

(declare-fun b!1530132 () Bool)

(declare-fun lt!662670 () SeekEntryResult!13214)

(assert (=> b!1530132 (and (bvsge (index!55253 lt!662670) #b00000000000000000000000000000000) (bvslt (index!55253 lt!662670) (size!49599 a!2804)))))

(declare-fun res!1047769 () Bool)

(assert (=> b!1530132 (= res!1047769 (= (select (arr!49049 a!2804) (index!55253 lt!662670)) (select (arr!49049 a!2804) j!70)))))

(declare-fun e!852646 () Bool)

(assert (=> b!1530132 (=> res!1047769 e!852646)))

(declare-fun e!852645 () Bool)

(assert (=> b!1530132 (= e!852645 e!852646)))

(declare-fun b!1530133 () Bool)

(declare-fun e!852644 () Bool)

(assert (=> b!1530133 (= e!852644 e!852645)))

(declare-fun res!1047770 () Bool)

(assert (=> b!1530133 (= res!1047770 (and (is-Intermediate!13214 lt!662670) (not (undefined!14026 lt!662670)) (bvslt (x!136933 lt!662670) #b01111111111111111111111111111110) (bvsge (x!136933 lt!662670) #b00000000000000000000000000000000) (bvsge (x!136933 lt!662670) x!534)))))

(assert (=> b!1530133 (=> (not res!1047770) (not e!852645))))

(declare-fun b!1530134 () Bool)

(assert (=> b!1530134 (and (bvsge (index!55253 lt!662670) #b00000000000000000000000000000000) (bvslt (index!55253 lt!662670) (size!49599 a!2804)))))

(declare-fun res!1047771 () Bool)

(assert (=> b!1530134 (= res!1047771 (= (select (arr!49049 a!2804) (index!55253 lt!662670)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530134 (=> res!1047771 e!852646)))

(declare-fun b!1530135 () Bool)

(assert (=> b!1530135 (= e!852644 (bvsge (x!136933 lt!662670) #b01111111111111111111111111111110))))

(declare-fun b!1530136 () Bool)

(declare-fun e!852648 () SeekEntryResult!13214)

(assert (=> b!1530136 (= e!852648 (Intermediate!13214 true index!487 x!534))))

(declare-fun b!1530137 () Bool)

(declare-fun e!852647 () SeekEntryResult!13214)

(assert (=> b!1530137 (= e!852647 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!49049 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530138 () Bool)

(assert (=> b!1530138 (= e!852648 e!852647)))

(declare-fun c!140738 () Bool)

(declare-fun lt!662669 () (_ BitVec 64))

(assert (=> b!1530138 (= c!140738 (or (= lt!662669 (select (arr!49049 a!2804) j!70)) (= (bvadd lt!662669 lt!662669) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530139 () Bool)

(assert (=> b!1530139 (= e!852647 (Intermediate!13214 false index!487 x!534))))

(declare-fun d!159749 () Bool)

(assert (=> d!159749 e!852644))

(declare-fun c!140736 () Bool)

(assert (=> d!159749 (= c!140736 (and (is-Intermediate!13214 lt!662670) (undefined!14026 lt!662670)))))

(assert (=> d!159749 (= lt!662670 e!852648)))

(declare-fun c!140737 () Bool)

(assert (=> d!159749 (= c!140737 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159749 (= lt!662669 (select (arr!49049 a!2804) index!487))))

(assert (=> d!159749 (validMask!0 mask!2512)))

(assert (=> d!159749 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49049 a!2804) j!70) a!2804 mask!2512) lt!662670)))

(declare-fun b!1530140 () Bool)

(assert (=> b!1530140 (and (bvsge (index!55253 lt!662670) #b00000000000000000000000000000000) (bvslt (index!55253 lt!662670) (size!49599 a!2804)))))

(assert (=> b!1530140 (= e!852646 (= (select (arr!49049 a!2804) (index!55253 lt!662670)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159749 c!140737) b!1530136))

(assert (= (and d!159749 (not c!140737)) b!1530138))

(assert (= (and b!1530138 c!140738) b!1530139))

(assert (= (and b!1530138 (not c!140738)) b!1530137))

(assert (= (and d!159749 c!140736) b!1530135))

(assert (= (and d!159749 (not c!140736)) b!1530133))

(assert (= (and b!1530133 res!1047770) b!1530132))

(assert (= (and b!1530132 (not res!1047769)) b!1530134))

(assert (= (and b!1530134 (not res!1047771)) b!1530140))

(declare-fun m!1413067 () Bool)

(assert (=> b!1530132 m!1413067))

(assert (=> b!1530140 m!1413067))

(declare-fun m!1413069 () Bool)

(assert (=> d!159749 m!1413069))

(assert (=> d!159749 m!1412935))

(assert (=> b!1530137 m!1412905))

(assert (=> b!1530137 m!1412905))

(assert (=> b!1530137 m!1412901))

(declare-fun m!1413071 () Bool)

(assert (=> b!1530137 m!1413071))

(assert (=> b!1530134 m!1413067))

(assert (=> b!1529937 d!159749))

(declare-fun b!1530141 () Bool)

(declare-fun lt!662678 () SeekEntryResult!13214)

(assert (=> b!1530141 (and (bvsge (index!55253 lt!662678) #b00000000000000000000000000000000) (bvslt (index!55253 lt!662678) (size!49599 (array!101649 (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49599 a!2804)))))))

(declare-fun res!1047772 () Bool)

(assert (=> b!1530141 (= res!1047772 (= (select (arr!49049 (array!101649 (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49599 a!2804))) (index!55253 lt!662678)) (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!852651 () Bool)

(assert (=> b!1530141 (=> res!1047772 e!852651)))

(declare-fun e!852650 () Bool)

(assert (=> b!1530141 (= e!852650 e!852651)))

(declare-fun b!1530142 () Bool)

(declare-fun e!852649 () Bool)

(assert (=> b!1530142 (= e!852649 e!852650)))

(declare-fun res!1047773 () Bool)

(assert (=> b!1530142 (= res!1047773 (and (is-Intermediate!13214 lt!662678) (not (undefined!14026 lt!662678)) (bvslt (x!136933 lt!662678) #b01111111111111111111111111111110) (bvsge (x!136933 lt!662678) #b00000000000000000000000000000000) (bvsge (x!136933 lt!662678) #b00000000000000000000000000000000)))))

(assert (=> b!1530142 (=> (not res!1047773) (not e!852650))))

(declare-fun b!1530143 () Bool)

(assert (=> b!1530143 (and (bvsge (index!55253 lt!662678) #b00000000000000000000000000000000) (bvslt (index!55253 lt!662678) (size!49599 (array!101649 (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49599 a!2804)))))))

(declare-fun res!1047774 () Bool)

(assert (=> b!1530143 (= res!1047774 (= (select (arr!49049 (array!101649 (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49599 a!2804))) (index!55253 lt!662678)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530143 (=> res!1047774 e!852651)))

(declare-fun b!1530144 () Bool)

(assert (=> b!1530144 (= e!852649 (bvsge (x!136933 lt!662678) #b01111111111111111111111111111110))))

(declare-fun e!852653 () SeekEntryResult!13214)

(declare-fun b!1530145 () Bool)

(assert (=> b!1530145 (= e!852653 (Intermediate!13214 true (toIndex!0 (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun e!852652 () SeekEntryResult!13214)

(declare-fun b!1530146 () Bool)

(assert (=> b!1530146 (= e!852652 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101649 (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49599 a!2804)) mask!2512))))

(declare-fun b!1530147 () Bool)

(assert (=> b!1530147 (= e!852653 e!852652)))

(declare-fun c!140741 () Bool)

(declare-fun lt!662677 () (_ BitVec 64))

(assert (=> b!1530147 (= c!140741 (or (= lt!662677 (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!662677 lt!662677) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530148 () Bool)

(assert (=> b!1530148 (= e!852652 (Intermediate!13214 false (toIndex!0 (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159763 () Bool)

(assert (=> d!159763 e!852649))

(declare-fun c!140739 () Bool)

(assert (=> d!159763 (= c!140739 (and (is-Intermediate!13214 lt!662678) (undefined!14026 lt!662678)))))

(assert (=> d!159763 (= lt!662678 e!852653)))

(declare-fun c!140740 () Bool)

(assert (=> d!159763 (= c!140740 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159763 (= lt!662677 (select (arr!49049 (array!101649 (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49599 a!2804))) (toIndex!0 (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159763 (validMask!0 mask!2512)))

(assert (=> d!159763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101649 (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49599 a!2804)) mask!2512) lt!662678)))

(declare-fun b!1530149 () Bool)

(assert (=> b!1530149 (and (bvsge (index!55253 lt!662678) #b00000000000000000000000000000000) (bvslt (index!55253 lt!662678) (size!49599 (array!101649 (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49599 a!2804)))))))

(assert (=> b!1530149 (= e!852651 (= (select (arr!49049 (array!101649 (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49599 a!2804))) (index!55253 lt!662678)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159763 c!140740) b!1530145))

(assert (= (and d!159763 (not c!140740)) b!1530147))

(assert (= (and b!1530147 c!140741) b!1530148))

(assert (= (and b!1530147 (not c!140741)) b!1530146))

(assert (= (and d!159763 c!140739) b!1530144))

(assert (= (and d!159763 (not c!140739)) b!1530142))

(assert (= (and b!1530142 res!1047773) b!1530141))

(assert (= (and b!1530141 (not res!1047772)) b!1530143))

(assert (= (and b!1530143 (not res!1047774)) b!1530149))

(declare-fun m!1413073 () Bool)

(assert (=> b!1530141 m!1413073))

(assert (=> b!1530149 m!1413073))

(assert (=> d!159763 m!1412923))

(declare-fun m!1413075 () Bool)

(assert (=> d!159763 m!1413075))

(assert (=> d!159763 m!1412935))

(assert (=> b!1530146 m!1412923))

(declare-fun m!1413077 () Bool)

(assert (=> b!1530146 m!1413077))

(assert (=> b!1530146 m!1413077))

(assert (=> b!1530146 m!1412919))

(declare-fun m!1413079 () Bool)

(assert (=> b!1530146 m!1413079))

(assert (=> b!1530143 m!1413073))

(assert (=> b!1529938 d!159763))

(declare-fun d!159769 () Bool)

(declare-fun lt!662684 () (_ BitVec 32))

(declare-fun lt!662683 () (_ BitVec 32))

(assert (=> d!159769 (= lt!662684 (bvmul (bvxor lt!662683 (bvlshr lt!662683 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159769 (= lt!662683 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159769 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1047775 (let ((h!36969 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136942 (bvmul (bvxor h!36969 (bvlshr h!36969 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136942 (bvlshr x!136942 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1047775 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1047775 #b00000000000000000000000000000000))))))

(assert (=> d!159769 (= (toIndex!0 (select (store (arr!49049 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!662684 (bvlshr lt!662684 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1529938 d!159769))

(declare-fun d!159771 () Bool)

(assert (=> d!159771 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130298 d!159771))

(declare-fun d!159777 () Bool)

(assert (=> d!159777 (= (array_inv!38077 a!2804) (bvsge (size!49599 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130298 d!159777))

(declare-fun d!159781 () Bool)

(assert (=> d!159781 (= (validKeyInArray!0 (select (arr!49049 a!2804) i!961)) (and (not (= (select (arr!49049 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49049 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1529936 d!159781))

(declare-fun b!1530208 () Bool)

(declare-fun e!852692 () Bool)

(declare-fun contains!9998 (List!35532 (_ BitVec 64)) Bool)

(assert (=> b!1530208 (= e!852692 (contains!9998 Nil!35529 (select (arr!49049 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68502 () Bool)

(declare-fun call!68505 () Bool)

(declare-fun c!140765 () Bool)

(assert (=> bm!68502 (= call!68505 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140765 (Cons!35528 (select (arr!49049 a!2804) #b00000000000000000000000000000000) Nil!35529) Nil!35529)))))

(declare-fun b!1530209 () Bool)

(declare-fun e!852691 () Bool)

(assert (=> b!1530209 (= e!852691 call!68505)))

(declare-fun d!159783 () Bool)

(declare-fun res!1047789 () Bool)

(declare-fun e!852690 () Bool)

(assert (=> d!159783 (=> res!1047789 e!852690)))

(assert (=> d!159783 (= res!1047789 (bvsge #b00000000000000000000000000000000 (size!49599 a!2804)))))

(assert (=> d!159783 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35529) e!852690)))

(declare-fun b!1530210 () Bool)

(assert (=> b!1530210 (= e!852691 call!68505)))

(declare-fun b!1530211 () Bool)

(declare-fun e!852689 () Bool)

(assert (=> b!1530211 (= e!852689 e!852691)))

(assert (=> b!1530211 (= c!140765 (validKeyInArray!0 (select (arr!49049 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530212 () Bool)

(assert (=> b!1530212 (= e!852690 e!852689)))

(declare-fun res!1047790 () Bool)

(assert (=> b!1530212 (=> (not res!1047790) (not e!852689))))

(assert (=> b!1530212 (= res!1047790 (not e!852692))))

(declare-fun res!1047788 () Bool)

(assert (=> b!1530212 (=> (not res!1047788) (not e!852692))))

(assert (=> b!1530212 (= res!1047788 (validKeyInArray!0 (select (arr!49049 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159783 (not res!1047789)) b!1530212))

(assert (= (and b!1530212 res!1047788) b!1530208))

(assert (= (and b!1530212 res!1047790) b!1530211))

(assert (= (and b!1530211 c!140765) b!1530210))

(assert (= (and b!1530211 (not c!140765)) b!1530209))

(assert (= (or b!1530210 b!1530209) bm!68502))

(assert (=> b!1530208 m!1413029))

(assert (=> b!1530208 m!1413029))

(declare-fun m!1413103 () Bool)

(assert (=> b!1530208 m!1413103))

(assert (=> bm!68502 m!1413029))

(declare-fun m!1413105 () Bool)

(assert (=> bm!68502 m!1413105))

(assert (=> b!1530211 m!1413029))

(assert (=> b!1530211 m!1413029))

(assert (=> b!1530211 m!1413037))

(assert (=> b!1530212 m!1413029))

(assert (=> b!1530212 m!1413029))

(assert (=> b!1530212 m!1413037))

(assert (=> b!1529931 d!159783))

(declare-fun b!1530213 () Bool)

(declare-fun lt!662722 () SeekEntryResult!13214)

(assert (=> b!1530213 (and (bvsge (index!55253 lt!662722) #b00000000000000000000000000000000) (bvslt (index!55253 lt!662722) (size!49599 a!2804)))))

(declare-fun res!1047791 () Bool)

(assert (=> b!1530213 (= res!1047791 (= (select (arr!49049 a!2804) (index!55253 lt!662722)) (select (arr!49049 a!2804) j!70)))))

(declare-fun e!852695 () Bool)

(assert (=> b!1530213 (=> res!1047791 e!852695)))

(declare-fun e!852694 () Bool)

(assert (=> b!1530213 (= e!852694 e!852695)))

(declare-fun b!1530214 () Bool)

(declare-fun e!852693 () Bool)

(assert (=> b!1530214 (= e!852693 e!852694)))

(declare-fun res!1047792 () Bool)

(assert (=> b!1530214 (= res!1047792 (and (is-Intermediate!13214 lt!662722) (not (undefined!14026 lt!662722)) (bvslt (x!136933 lt!662722) #b01111111111111111111111111111110) (bvsge (x!136933 lt!662722) #b00000000000000000000000000000000) (bvsge (x!136933 lt!662722) #b00000000000000000000000000000000)))))

(assert (=> b!1530214 (=> (not res!1047792) (not e!852694))))

(declare-fun b!1530215 () Bool)

(assert (=> b!1530215 (and (bvsge (index!55253 lt!662722) #b00000000000000000000000000000000) (bvslt (index!55253 lt!662722) (size!49599 a!2804)))))

(declare-fun res!1047793 () Bool)

(assert (=> b!1530215 (= res!1047793 (= (select (arr!49049 a!2804) (index!55253 lt!662722)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530215 (=> res!1047793 e!852695)))

(declare-fun b!1530216 () Bool)

(assert (=> b!1530216 (= e!852693 (bvsge (x!136933 lt!662722) #b01111111111111111111111111111110))))

(declare-fun b!1530217 () Bool)

(declare-fun e!852697 () SeekEntryResult!13214)

(assert (=> b!1530217 (= e!852697 (Intermediate!13214 true (toIndex!0 (select (arr!49049 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun e!852696 () SeekEntryResult!13214)

(declare-fun b!1530218 () Bool)

(assert (=> b!1530218 (= e!852696 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49049 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!49049 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530219 () Bool)

(assert (=> b!1530219 (= e!852697 e!852696)))

(declare-fun lt!662721 () (_ BitVec 64))

(declare-fun c!140768 () Bool)

(assert (=> b!1530219 (= c!140768 (or (= lt!662721 (select (arr!49049 a!2804) j!70)) (= (bvadd lt!662721 lt!662721) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530220 () Bool)

(assert (=> b!1530220 (= e!852696 (Intermediate!13214 false (toIndex!0 (select (arr!49049 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159787 () Bool)

(assert (=> d!159787 e!852693))

(declare-fun c!140766 () Bool)

(assert (=> d!159787 (= c!140766 (and (is-Intermediate!13214 lt!662722) (undefined!14026 lt!662722)))))

(assert (=> d!159787 (= lt!662722 e!852697)))

(declare-fun c!140767 () Bool)

(assert (=> d!159787 (= c!140767 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159787 (= lt!662721 (select (arr!49049 a!2804) (toIndex!0 (select (arr!49049 a!2804) j!70) mask!2512)))))

(assert (=> d!159787 (validMask!0 mask!2512)))

(assert (=> d!159787 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49049 a!2804) j!70) mask!2512) (select (arr!49049 a!2804) j!70) a!2804 mask!2512) lt!662722)))

(declare-fun b!1530221 () Bool)

(assert (=> b!1530221 (and (bvsge (index!55253 lt!662722) #b00000000000000000000000000000000) (bvslt (index!55253 lt!662722) (size!49599 a!2804)))))

(assert (=> b!1530221 (= e!852695 (= (select (arr!49049 a!2804) (index!55253 lt!662722)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159787 c!140767) b!1530217))

(assert (= (and d!159787 (not c!140767)) b!1530219))

(assert (= (and b!1530219 c!140768) b!1530220))

(assert (= (and b!1530219 (not c!140768)) b!1530218))

(assert (= (and d!159787 c!140766) b!1530216))

(assert (= (and d!159787 (not c!140766)) b!1530214))

(assert (= (and b!1530214 res!1047792) b!1530213))

(assert (= (and b!1530213 (not res!1047791)) b!1530215))

(assert (= (and b!1530215 (not res!1047793)) b!1530221))

(declare-fun m!1413107 () Bool)

(assert (=> b!1530213 m!1413107))

(assert (=> b!1530221 m!1413107))

(assert (=> d!159787 m!1412929))

(declare-fun m!1413109 () Bool)

(assert (=> d!159787 m!1413109))

(assert (=> d!159787 m!1412935))

(assert (=> b!1530218 m!1412929))

(declare-fun m!1413113 () Bool)

(assert (=> b!1530218 m!1413113))

(assert (=> b!1530218 m!1413113))

(assert (=> b!1530218 m!1412901))

(declare-fun m!1413115 () Bool)

(assert (=> b!1530218 m!1413115))

(assert (=> b!1530215 m!1413107))

(assert (=> b!1529930 d!159787))

(declare-fun d!159789 () Bool)

(declare-fun lt!662727 () (_ BitVec 32))

(declare-fun lt!662726 () (_ BitVec 32))

(assert (=> d!159789 (= lt!662727 (bvmul (bvxor lt!662726 (bvlshr lt!662726 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159789 (= lt!662726 ((_ extract 31 0) (bvand (bvxor (select (arr!49049 a!2804) j!70) (bvlshr (select (arr!49049 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159789 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1047775 (let ((h!36969 ((_ extract 31 0) (bvand (bvxor (select (arr!49049 a!2804) j!70) (bvlshr (select (arr!49049 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136942 (bvmul (bvxor h!36969 (bvlshr h!36969 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136942 (bvlshr x!136942 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1047775 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1047775 #b00000000000000000000000000000000))))))

(assert (=> d!159789 (= (toIndex!0 (select (arr!49049 a!2804) j!70) mask!2512) (bvand (bvxor lt!662727 (bvlshr lt!662727 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1529930 d!159789))

(declare-fun b!1530226 () Bool)

(declare-fun e!852701 () Bool)

(declare-fun e!852702 () Bool)

(assert (=> b!1530226 (= e!852701 e!852702)))

(declare-fun lt!662729 () (_ BitVec 64))

(assert (=> b!1530226 (= lt!662729 (select (arr!49049 a!2804) j!70))))

(declare-fun lt!662730 () Unit!51212)

(assert (=> b!1530226 (= lt!662730 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662729 j!70))))

(assert (=> b!1530226 (arrayContainsKey!0 a!2804 lt!662729 #b00000000000000000000000000000000)))

(declare-fun lt!662728 () Unit!51212)

(assert (=> b!1530226 (= lt!662728 lt!662730)))

(declare-fun res!1047796 () Bool)

(assert (=> b!1530226 (= res!1047796 (= (seekEntryOrOpen!0 (select (arr!49049 a!2804) j!70) a!2804 mask!2512) (Found!13214 j!70)))))

(assert (=> b!1530226 (=> (not res!1047796) (not e!852702))))

(declare-fun d!159793 () Bool)

(declare-fun res!1047797 () Bool)

(declare-fun e!852703 () Bool)

(assert (=> d!159793 (=> res!1047797 e!852703)))

(assert (=> d!159793 (= res!1047797 (bvsge j!70 (size!49599 a!2804)))))

(assert (=> d!159793 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!852703)))

(declare-fun b!1530227 () Bool)

(assert (=> b!1530227 (= e!852703 e!852701)))

(declare-fun c!140770 () Bool)

(assert (=> b!1530227 (= c!140770 (validKeyInArray!0 (select (arr!49049 a!2804) j!70)))))

(declare-fun b!1530228 () Bool)

(declare-fun call!68507 () Bool)

(assert (=> b!1530228 (= e!852701 call!68507)))

(declare-fun b!1530229 () Bool)

(assert (=> b!1530229 (= e!852702 call!68507)))

(declare-fun bm!68504 () Bool)

(assert (=> bm!68504 (= call!68507 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159793 (not res!1047797)) b!1530227))

(assert (= (and b!1530227 c!140770) b!1530226))

(assert (= (and b!1530227 (not c!140770)) b!1530228))

(assert (= (and b!1530226 res!1047796) b!1530229))

(assert (= (or b!1530229 b!1530228) bm!68504))

(assert (=> b!1530226 m!1412901))

(declare-fun m!1413123 () Bool)

(assert (=> b!1530226 m!1413123))

(declare-fun m!1413125 () Bool)

(assert (=> b!1530226 m!1413125))

(assert (=> b!1530226 m!1412901))

(declare-fun m!1413127 () Bool)

(assert (=> b!1530226 m!1413127))

(assert (=> b!1530227 m!1412901))

(assert (=> b!1530227 m!1412901))

(assert (=> b!1530227 m!1412909))

(declare-fun m!1413129 () Bool)

(assert (=> bm!68504 m!1413129))

(assert (=> b!1529935 d!159793))

(declare-fun d!159795 () Bool)

(assert (=> d!159795 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!662740 () Unit!51212)

(declare-fun choose!38 (array!101648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51212)

(assert (=> d!159795 (= lt!662740 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159795 (validMask!0 mask!2512)))

(assert (=> d!159795 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!662740)))

(declare-fun bs!43876 () Bool)

(assert (= bs!43876 d!159795))

(assert (=> bs!43876 m!1412921))

(declare-fun m!1413145 () Bool)

(assert (=> bs!43876 m!1413145))

(assert (=> bs!43876 m!1412935))

(assert (=> b!1529935 d!159795))

(declare-fun d!159805 () Bool)

(assert (=> d!159805 (= (validKeyInArray!0 (select (arr!49049 a!2804) j!70)) (and (not (= (select (arr!49049 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49049 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1529928 d!159805))

(declare-fun b!1530269 () Bool)

(declare-fun e!852727 () SeekEntryResult!13214)

(assert (=> b!1530269 (= e!852727 Undefined!13214)))

(declare-fun b!1530270 () Bool)

(declare-fun e!852726 () SeekEntryResult!13214)

(assert (=> b!1530270 (= e!852727 e!852726)))

(declare-fun lt!662758 () (_ BitVec 64))

(declare-fun lt!662760 () SeekEntryResult!13214)

(assert (=> b!1530270 (= lt!662758 (select (arr!49049 a!2804) (index!55253 lt!662760)))))

(declare-fun c!140787 () Bool)

(assert (=> b!1530270 (= c!140787 (= lt!662758 (select (arr!49049 a!2804) j!70)))))

(declare-fun b!1530271 () Bool)

(declare-fun e!852725 () SeekEntryResult!13214)

(assert (=> b!1530271 (= e!852725 (MissingZero!13214 (index!55253 lt!662760)))))

(declare-fun b!1530273 () Bool)

(assert (=> b!1530273 (= e!852726 (Found!13214 (index!55253 lt!662760)))))

(declare-fun b!1530274 () Bool)

(declare-fun lt!662759 () SeekEntryResult!13214)

(assert (=> b!1530274 (= e!852725 (ite (is-MissingVacant!13214 lt!662759) (MissingZero!13214 (index!55254 lt!662759)) lt!662759))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101648 (_ BitVec 32)) SeekEntryResult!13214)

(assert (=> b!1530274 (= lt!662759 (seekKeyOrZeroReturnVacant!0 (x!136933 lt!662760) (index!55253 lt!662760) (index!55253 lt!662760) (select (arr!49049 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530272 () Bool)

(declare-fun c!140786 () Bool)

(assert (=> b!1530272 (= c!140786 (= lt!662758 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530272 (= e!852726 e!852725)))

(declare-fun d!159809 () Bool)

(declare-fun lt!662761 () SeekEntryResult!13214)

(assert (=> d!159809 (and (or (is-MissingVacant!13214 lt!662761) (not (is-Found!13214 lt!662761)) (and (bvsge (index!55252 lt!662761) #b00000000000000000000000000000000) (bvslt (index!55252 lt!662761) (size!49599 a!2804)))) (not (is-MissingVacant!13214 lt!662761)) (or (not (is-Found!13214 lt!662761)) (= (select (arr!49049 a!2804) (index!55252 lt!662761)) (select (arr!49049 a!2804) j!70))))))

(assert (=> d!159809 (= lt!662761 e!852727)))

(declare-fun c!140788 () Bool)

(assert (=> d!159809 (= c!140788 (and (is-Intermediate!13214 lt!662760) (undefined!14026 lt!662760)))))

(assert (=> d!159809 (= lt!662760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49049 a!2804) j!70) mask!2512) (select (arr!49049 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159809 (validMask!0 mask!2512)))

(assert (=> d!159809 (= (seekEntry!0 (select (arr!49049 a!2804) j!70) a!2804 mask!2512) lt!662761)))

(assert (= (and d!159809 c!140788) b!1530269))

(assert (= (and d!159809 (not c!140788)) b!1530270))

(assert (= (and b!1530270 c!140787) b!1530273))

(assert (= (and b!1530270 (not c!140787)) b!1530272))

(assert (= (and b!1530272 c!140786) b!1530271))

(assert (= (and b!1530272 (not c!140786)) b!1530274))

(declare-fun m!1413159 () Bool)

(assert (=> b!1530270 m!1413159))

(assert (=> b!1530274 m!1412901))

(declare-fun m!1413161 () Bool)

(assert (=> b!1530274 m!1413161))

(declare-fun m!1413165 () Bool)

(assert (=> d!159809 m!1413165))

(assert (=> d!159809 m!1412901))

(assert (=> d!159809 m!1412929))

(assert (=> d!159809 m!1412929))

(assert (=> d!159809 m!1412901))

(assert (=> d!159809 m!1412931))

(assert (=> d!159809 m!1412935))

(assert (=> b!1529933 d!159809))

(declare-fun d!159821 () Bool)

(declare-fun lt!662767 () (_ BitVec 32))

(assert (=> d!159821 (and (bvsge lt!662767 #b00000000000000000000000000000000) (bvslt lt!662767 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159821 (= lt!662767 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!159821 (validMask!0 mask!2512)))

(assert (=> d!159821 (= (nextIndex!0 index!487 x!534 mask!2512) lt!662767)))

(declare-fun bs!43878 () Bool)

(assert (= bs!43878 d!159821))

(declare-fun m!1413177 () Bool)

(assert (=> bs!43878 m!1413177))

(assert (=> bs!43878 m!1412935))

(assert (=> b!1529939 d!159821))

(push 1)

