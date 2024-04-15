; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129834 () Bool)

(assert start!129834)

(declare-fun res!1042968 () Bool)

(declare-fun e!849601 () Bool)

(assert (=> start!129834 (=> (not res!1042968) (not e!849601))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129834 (= res!1042968 (validMask!0 mask!2512))))

(assert (=> start!129834 e!849601))

(assert (=> start!129834 true))

(declare-datatypes ((array!101371 0))(
  ( (array!101372 (arr!48916 (Array (_ BitVec 32) (_ BitVec 64))) (size!49468 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101371)

(declare-fun array_inv!38149 (array!101371) Bool)

(assert (=> start!129834 (array_inv!38149 a!2804)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!849600 () Bool)

(declare-fun b!1524125 () Bool)

(declare-datatypes ((SeekEntryResult!13104 0))(
  ( (MissingZero!13104 (index!54811 (_ BitVec 32))) (Found!13104 (index!54812 (_ BitVec 32))) (Intermediate!13104 (undefined!13916 Bool) (index!54813 (_ BitVec 32)) (x!136503 (_ BitVec 32))) (Undefined!13104) (MissingVacant!13104 (index!54814 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101371 (_ BitVec 32)) SeekEntryResult!13104)

(assert (=> b!1524125 (= e!849600 (= (seekEntry!0 (select (arr!48916 a!2804) j!70) a!2804 mask!2512) (Found!13104 j!70)))))

(declare-fun b!1524126 () Bool)

(declare-fun res!1042966 () Bool)

(assert (=> b!1524126 (=> (not res!1042966) (not e!849601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524126 (= res!1042966 (validKeyInArray!0 (select (arr!48916 a!2804) j!70)))))

(declare-fun b!1524127 () Bool)

(declare-fun res!1042962 () Bool)

(declare-fun e!849603 () Bool)

(assert (=> b!1524127 (=> (not res!1042962) (not e!849603))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!660029 () SeekEntryResult!13104)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101371 (_ BitVec 32)) SeekEntryResult!13104)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524127 (= res!1042962 (= lt!660029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101372 (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49468 a!2804)) mask!2512)))))

(declare-fun b!1524128 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!849604 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101371 (_ BitVec 32)) SeekEntryResult!13104)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101371 (_ BitVec 32)) SeekEntryResult!13104)

(assert (=> b!1524128 (= e!849604 (= (seekEntryOrOpen!0 (select (arr!48916 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48916 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1524129 () Bool)

(assert (=> b!1524129 (= e!849603 (not e!849604))))

(declare-fun res!1042971 () Bool)

(assert (=> b!1524129 (=> res!1042971 e!849604)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524129 (= res!1042971 (or (not (= (select (arr!48916 a!2804) j!70) (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48916 a!2804) index!487) (select (arr!48916 a!2804) j!70)) (not (= (select (arr!48916 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524129 e!849600))

(declare-fun res!1042963 () Bool)

(assert (=> b!1524129 (=> (not res!1042963) (not e!849600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101371 (_ BitVec 32)) Bool)

(assert (=> b!1524129 (= res!1042963 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50831 0))(
  ( (Unit!50832) )
))
(declare-fun lt!660030 () Unit!50831)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50831)

(assert (=> b!1524129 (= lt!660030 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524130 () Bool)

(declare-fun res!1042969 () Bool)

(assert (=> b!1524130 (=> (not res!1042969) (not e!849601))))

(declare-datatypes ((List!35477 0))(
  ( (Nil!35474) (Cons!35473 (h!36901 (_ BitVec 64)) (t!50163 List!35477)) )
))
(declare-fun arrayNoDuplicates!0 (array!101371 (_ BitVec 32) List!35477) Bool)

(assert (=> b!1524130 (= res!1042969 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35474))))

(declare-fun b!1524131 () Bool)

(declare-fun res!1042964 () Bool)

(assert (=> b!1524131 (=> (not res!1042964) (not e!849601))))

(assert (=> b!1524131 (= res!1042964 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49468 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49468 a!2804))))))

(declare-fun b!1524132 () Bool)

(declare-fun res!1042970 () Bool)

(assert (=> b!1524132 (=> (not res!1042970) (not e!849601))))

(assert (=> b!1524132 (= res!1042970 (and (= (size!49468 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49468 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49468 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524133 () Bool)

(declare-fun res!1042965 () Bool)

(assert (=> b!1524133 (=> (not res!1042965) (not e!849601))))

(assert (=> b!1524133 (= res!1042965 (validKeyInArray!0 (select (arr!48916 a!2804) i!961)))))

(declare-fun b!1524134 () Bool)

(assert (=> b!1524134 (= e!849601 e!849603)))

(declare-fun res!1042967 () Bool)

(assert (=> b!1524134 (=> (not res!1042967) (not e!849603))))

(declare-fun lt!660028 () SeekEntryResult!13104)

(assert (=> b!1524134 (= res!1042967 (= lt!660029 lt!660028))))

(assert (=> b!1524134 (= lt!660028 (Intermediate!13104 false resIndex!21 resX!21))))

(assert (=> b!1524134 (= lt!660029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48916 a!2804) j!70) mask!2512) (select (arr!48916 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524135 () Bool)

(declare-fun res!1042961 () Bool)

(assert (=> b!1524135 (=> (not res!1042961) (not e!849601))))

(assert (=> b!1524135 (= res!1042961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524136 () Bool)

(declare-fun res!1042972 () Bool)

(assert (=> b!1524136 (=> (not res!1042972) (not e!849603))))

(assert (=> b!1524136 (= res!1042972 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48916 a!2804) j!70) a!2804 mask!2512) lt!660028))))

(assert (= (and start!129834 res!1042968) b!1524132))

(assert (= (and b!1524132 res!1042970) b!1524133))

(assert (= (and b!1524133 res!1042965) b!1524126))

(assert (= (and b!1524126 res!1042966) b!1524135))

(assert (= (and b!1524135 res!1042961) b!1524130))

(assert (= (and b!1524130 res!1042969) b!1524131))

(assert (= (and b!1524131 res!1042964) b!1524134))

(assert (= (and b!1524134 res!1042967) b!1524136))

(assert (= (and b!1524136 res!1042972) b!1524127))

(assert (= (and b!1524127 res!1042962) b!1524129))

(assert (= (and b!1524129 res!1042963) b!1524125))

(assert (= (and b!1524129 (not res!1042971)) b!1524128))

(declare-fun m!1406591 () Bool)

(assert (=> b!1524130 m!1406591))

(declare-fun m!1406593 () Bool)

(assert (=> b!1524128 m!1406593))

(assert (=> b!1524128 m!1406593))

(declare-fun m!1406595 () Bool)

(assert (=> b!1524128 m!1406595))

(assert (=> b!1524128 m!1406593))

(declare-fun m!1406597 () Bool)

(assert (=> b!1524128 m!1406597))

(assert (=> b!1524126 m!1406593))

(assert (=> b!1524126 m!1406593))

(declare-fun m!1406599 () Bool)

(assert (=> b!1524126 m!1406599))

(declare-fun m!1406601 () Bool)

(assert (=> b!1524133 m!1406601))

(assert (=> b!1524133 m!1406601))

(declare-fun m!1406603 () Bool)

(assert (=> b!1524133 m!1406603))

(declare-fun m!1406605 () Bool)

(assert (=> start!129834 m!1406605))

(declare-fun m!1406607 () Bool)

(assert (=> start!129834 m!1406607))

(assert (=> b!1524134 m!1406593))

(assert (=> b!1524134 m!1406593))

(declare-fun m!1406609 () Bool)

(assert (=> b!1524134 m!1406609))

(assert (=> b!1524134 m!1406609))

(assert (=> b!1524134 m!1406593))

(declare-fun m!1406611 () Bool)

(assert (=> b!1524134 m!1406611))

(declare-fun m!1406613 () Bool)

(assert (=> b!1524135 m!1406613))

(assert (=> b!1524136 m!1406593))

(assert (=> b!1524136 m!1406593))

(declare-fun m!1406615 () Bool)

(assert (=> b!1524136 m!1406615))

(assert (=> b!1524129 m!1406593))

(declare-fun m!1406617 () Bool)

(assert (=> b!1524129 m!1406617))

(declare-fun m!1406619 () Bool)

(assert (=> b!1524129 m!1406619))

(declare-fun m!1406621 () Bool)

(assert (=> b!1524129 m!1406621))

(declare-fun m!1406623 () Bool)

(assert (=> b!1524129 m!1406623))

(declare-fun m!1406625 () Bool)

(assert (=> b!1524129 m!1406625))

(assert (=> b!1524125 m!1406593))

(assert (=> b!1524125 m!1406593))

(declare-fun m!1406627 () Bool)

(assert (=> b!1524125 m!1406627))

(assert (=> b!1524127 m!1406619))

(assert (=> b!1524127 m!1406623))

(assert (=> b!1524127 m!1406623))

(declare-fun m!1406629 () Bool)

(assert (=> b!1524127 m!1406629))

(assert (=> b!1524127 m!1406629))

(assert (=> b!1524127 m!1406623))

(declare-fun m!1406631 () Bool)

(assert (=> b!1524127 m!1406631))

(check-sat (not b!1524127) (not b!1524135) (not b!1524134) (not b!1524125) (not b!1524133) (not b!1524130) (not b!1524136) (not b!1524129) (not start!129834) (not b!1524128) (not b!1524126))
(check-sat)
(get-model)

(declare-fun b!1524221 () Bool)

(declare-fun e!849643 () SeekEntryResult!13104)

(assert (=> b!1524221 (= e!849643 Undefined!13104)))

(declare-fun b!1524222 () Bool)

(declare-fun e!849642 () SeekEntryResult!13104)

(assert (=> b!1524222 (= e!849643 e!849642)))

(declare-fun lt!660056 () (_ BitVec 64))

(declare-fun lt!660055 () SeekEntryResult!13104)

(assert (=> b!1524222 (= lt!660056 (select (arr!48916 a!2804) (index!54813 lt!660055)))))

(declare-fun c!140140 () Bool)

(assert (=> b!1524222 (= c!140140 (= lt!660056 (select (arr!48916 a!2804) j!70)))))

(declare-fun d!159099 () Bool)

(declare-fun lt!660057 () SeekEntryResult!13104)

(get-info :version)

(assert (=> d!159099 (and (or ((_ is Undefined!13104) lt!660057) (not ((_ is Found!13104) lt!660057)) (and (bvsge (index!54812 lt!660057) #b00000000000000000000000000000000) (bvslt (index!54812 lt!660057) (size!49468 a!2804)))) (or ((_ is Undefined!13104) lt!660057) ((_ is Found!13104) lt!660057) (not ((_ is MissingZero!13104) lt!660057)) (and (bvsge (index!54811 lt!660057) #b00000000000000000000000000000000) (bvslt (index!54811 lt!660057) (size!49468 a!2804)))) (or ((_ is Undefined!13104) lt!660057) ((_ is Found!13104) lt!660057) ((_ is MissingZero!13104) lt!660057) (not ((_ is MissingVacant!13104) lt!660057)) (and (bvsge (index!54814 lt!660057) #b00000000000000000000000000000000) (bvslt (index!54814 lt!660057) (size!49468 a!2804)))) (or ((_ is Undefined!13104) lt!660057) (ite ((_ is Found!13104) lt!660057) (= (select (arr!48916 a!2804) (index!54812 lt!660057)) (select (arr!48916 a!2804) j!70)) (ite ((_ is MissingZero!13104) lt!660057) (= (select (arr!48916 a!2804) (index!54811 lt!660057)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13104) lt!660057) (= (select (arr!48916 a!2804) (index!54814 lt!660057)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159099 (= lt!660057 e!849643)))

(declare-fun c!140141 () Bool)

(assert (=> d!159099 (= c!140141 (and ((_ is Intermediate!13104) lt!660055) (undefined!13916 lt!660055)))))

(assert (=> d!159099 (= lt!660055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48916 a!2804) j!70) mask!2512) (select (arr!48916 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159099 (validMask!0 mask!2512)))

(assert (=> d!159099 (= (seekEntryOrOpen!0 (select (arr!48916 a!2804) j!70) a!2804 mask!2512) lt!660057)))

(declare-fun b!1524223 () Bool)

(assert (=> b!1524223 (= e!849642 (Found!13104 (index!54813 lt!660055)))))

(declare-fun b!1524224 () Bool)

(declare-fun c!140142 () Bool)

(assert (=> b!1524224 (= c!140142 (= lt!660056 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849641 () SeekEntryResult!13104)

(assert (=> b!1524224 (= e!849642 e!849641)))

(declare-fun b!1524225 () Bool)

(assert (=> b!1524225 (= e!849641 (MissingZero!13104 (index!54813 lt!660055)))))

(declare-fun b!1524226 () Bool)

(assert (=> b!1524226 (= e!849641 (seekKeyOrZeroReturnVacant!0 (x!136503 lt!660055) (index!54813 lt!660055) (index!54813 lt!660055) (select (arr!48916 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159099 c!140141) b!1524221))

(assert (= (and d!159099 (not c!140141)) b!1524222))

(assert (= (and b!1524222 c!140140) b!1524223))

(assert (= (and b!1524222 (not c!140140)) b!1524224))

(assert (= (and b!1524224 c!140142) b!1524225))

(assert (= (and b!1524224 (not c!140142)) b!1524226))

(declare-fun m!1406717 () Bool)

(assert (=> b!1524222 m!1406717))

(assert (=> d!159099 m!1406605))

(declare-fun m!1406719 () Bool)

(assert (=> d!159099 m!1406719))

(assert (=> d!159099 m!1406609))

(assert (=> d!159099 m!1406593))

(assert (=> d!159099 m!1406611))

(assert (=> d!159099 m!1406593))

(assert (=> d!159099 m!1406609))

(declare-fun m!1406721 () Bool)

(assert (=> d!159099 m!1406721))

(declare-fun m!1406723 () Bool)

(assert (=> d!159099 m!1406723))

(assert (=> b!1524226 m!1406593))

(declare-fun m!1406725 () Bool)

(assert (=> b!1524226 m!1406725))

(assert (=> b!1524128 d!159099))

(declare-fun b!1524239 () Bool)

(declare-fun e!849650 () SeekEntryResult!13104)

(assert (=> b!1524239 (= e!849650 (MissingVacant!13104 index!487))))

(declare-fun lt!660062 () SeekEntryResult!13104)

(declare-fun d!159101 () Bool)

(assert (=> d!159101 (and (or ((_ is Undefined!13104) lt!660062) (not ((_ is Found!13104) lt!660062)) (and (bvsge (index!54812 lt!660062) #b00000000000000000000000000000000) (bvslt (index!54812 lt!660062) (size!49468 a!2804)))) (or ((_ is Undefined!13104) lt!660062) ((_ is Found!13104) lt!660062) (not ((_ is MissingVacant!13104) lt!660062)) (not (= (index!54814 lt!660062) index!487)) (and (bvsge (index!54814 lt!660062) #b00000000000000000000000000000000) (bvslt (index!54814 lt!660062) (size!49468 a!2804)))) (or ((_ is Undefined!13104) lt!660062) (ite ((_ is Found!13104) lt!660062) (= (select (arr!48916 a!2804) (index!54812 lt!660062)) (select (arr!48916 a!2804) j!70)) (and ((_ is MissingVacant!13104) lt!660062) (= (index!54814 lt!660062) index!487) (= (select (arr!48916 a!2804) (index!54814 lt!660062)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!849651 () SeekEntryResult!13104)

(assert (=> d!159101 (= lt!660062 e!849651)))

(declare-fun c!140149 () Bool)

(assert (=> d!159101 (= c!140149 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!660063 () (_ BitVec 64))

(assert (=> d!159101 (= lt!660063 (select (arr!48916 a!2804) index!487))))

(assert (=> d!159101 (validMask!0 mask!2512)))

(assert (=> d!159101 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48916 a!2804) j!70) a!2804 mask!2512) lt!660062)))

(declare-fun b!1524240 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524240 (= e!849650 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 (select (arr!48916 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524241 () Bool)

(declare-fun c!140150 () Bool)

(assert (=> b!1524241 (= c!140150 (= lt!660063 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849652 () SeekEntryResult!13104)

(assert (=> b!1524241 (= e!849652 e!849650)))

(declare-fun b!1524242 () Bool)

(assert (=> b!1524242 (= e!849651 Undefined!13104)))

(declare-fun b!1524243 () Bool)

(assert (=> b!1524243 (= e!849652 (Found!13104 index!487))))

(declare-fun b!1524244 () Bool)

(assert (=> b!1524244 (= e!849651 e!849652)))

(declare-fun c!140151 () Bool)

(assert (=> b!1524244 (= c!140151 (= lt!660063 (select (arr!48916 a!2804) j!70)))))

(assert (= (and d!159101 c!140149) b!1524242))

(assert (= (and d!159101 (not c!140149)) b!1524244))

(assert (= (and b!1524244 c!140151) b!1524243))

(assert (= (and b!1524244 (not c!140151)) b!1524241))

(assert (= (and b!1524241 c!140150) b!1524239))

(assert (= (and b!1524241 (not c!140150)) b!1524240))

(declare-fun m!1406727 () Bool)

(assert (=> d!159101 m!1406727))

(declare-fun m!1406729 () Bool)

(assert (=> d!159101 m!1406729))

(assert (=> d!159101 m!1406621))

(assert (=> d!159101 m!1406605))

(declare-fun m!1406731 () Bool)

(assert (=> b!1524240 m!1406731))

(assert (=> b!1524240 m!1406731))

(assert (=> b!1524240 m!1406593))

(declare-fun m!1406733 () Bool)

(assert (=> b!1524240 m!1406733))

(assert (=> b!1524128 d!159101))

(declare-fun b!1524255 () Bool)

(declare-fun e!849664 () Bool)

(declare-fun e!849661 () Bool)

(assert (=> b!1524255 (= e!849664 e!849661)))

(declare-fun res!1043051 () Bool)

(assert (=> b!1524255 (=> (not res!1043051) (not e!849661))))

(declare-fun e!849662 () Bool)

(assert (=> b!1524255 (= res!1043051 (not e!849662))))

(declare-fun res!1043053 () Bool)

(assert (=> b!1524255 (=> (not res!1043053) (not e!849662))))

(assert (=> b!1524255 (= res!1043053 (validKeyInArray!0 (select (arr!48916 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159103 () Bool)

(declare-fun res!1043052 () Bool)

(assert (=> d!159103 (=> res!1043052 e!849664)))

(assert (=> d!159103 (= res!1043052 (bvsge #b00000000000000000000000000000000 (size!49468 a!2804)))))

(assert (=> d!159103 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35474) e!849664)))

(declare-fun b!1524256 () Bool)

(declare-fun contains!9954 (List!35477 (_ BitVec 64)) Bool)

(assert (=> b!1524256 (= e!849662 (contains!9954 Nil!35474 (select (arr!48916 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68392 () Bool)

(declare-fun call!68395 () Bool)

(declare-fun c!140154 () Bool)

(assert (=> bm!68392 (= call!68395 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140154 (Cons!35473 (select (arr!48916 a!2804) #b00000000000000000000000000000000) Nil!35474) Nil!35474)))))

(declare-fun b!1524257 () Bool)

(declare-fun e!849663 () Bool)

(assert (=> b!1524257 (= e!849663 call!68395)))

(declare-fun b!1524258 () Bool)

(assert (=> b!1524258 (= e!849663 call!68395)))

(declare-fun b!1524259 () Bool)

(assert (=> b!1524259 (= e!849661 e!849663)))

(assert (=> b!1524259 (= c!140154 (validKeyInArray!0 (select (arr!48916 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159103 (not res!1043052)) b!1524255))

(assert (= (and b!1524255 res!1043053) b!1524256))

(assert (= (and b!1524255 res!1043051) b!1524259))

(assert (= (and b!1524259 c!140154) b!1524258))

(assert (= (and b!1524259 (not c!140154)) b!1524257))

(assert (= (or b!1524258 b!1524257) bm!68392))

(declare-fun m!1406735 () Bool)

(assert (=> b!1524255 m!1406735))

(assert (=> b!1524255 m!1406735))

(declare-fun m!1406737 () Bool)

(assert (=> b!1524255 m!1406737))

(assert (=> b!1524256 m!1406735))

(assert (=> b!1524256 m!1406735))

(declare-fun m!1406739 () Bool)

(assert (=> b!1524256 m!1406739))

(assert (=> bm!68392 m!1406735))

(declare-fun m!1406741 () Bool)

(assert (=> bm!68392 m!1406741))

(assert (=> b!1524259 m!1406735))

(assert (=> b!1524259 m!1406735))

(assert (=> b!1524259 m!1406737))

(assert (=> b!1524130 d!159103))

(declare-fun b!1524268 () Bool)

(declare-fun e!849673 () Bool)

(declare-fun e!849671 () Bool)

(assert (=> b!1524268 (= e!849673 e!849671)))

(declare-fun c!140157 () Bool)

(assert (=> b!1524268 (= c!140157 (validKeyInArray!0 (select (arr!48916 a!2804) j!70)))))

(declare-fun b!1524269 () Bool)

(declare-fun e!849672 () Bool)

(declare-fun call!68398 () Bool)

(assert (=> b!1524269 (= e!849672 call!68398)))

(declare-fun b!1524270 () Bool)

(assert (=> b!1524270 (= e!849671 call!68398)))

(declare-fun d!159105 () Bool)

(declare-fun res!1043059 () Bool)

(assert (=> d!159105 (=> res!1043059 e!849673)))

(assert (=> d!159105 (= res!1043059 (bvsge j!70 (size!49468 a!2804)))))

(assert (=> d!159105 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!849673)))

(declare-fun b!1524271 () Bool)

(assert (=> b!1524271 (= e!849671 e!849672)))

(declare-fun lt!660070 () (_ BitVec 64))

(assert (=> b!1524271 (= lt!660070 (select (arr!48916 a!2804) j!70))))

(declare-fun lt!660072 () Unit!50831)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101371 (_ BitVec 64) (_ BitVec 32)) Unit!50831)

(assert (=> b!1524271 (= lt!660072 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660070 j!70))))

(declare-fun arrayContainsKey!0 (array!101371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1524271 (arrayContainsKey!0 a!2804 lt!660070 #b00000000000000000000000000000000)))

(declare-fun lt!660071 () Unit!50831)

(assert (=> b!1524271 (= lt!660071 lt!660072)))

(declare-fun res!1043058 () Bool)

(assert (=> b!1524271 (= res!1043058 (= (seekEntryOrOpen!0 (select (arr!48916 a!2804) j!70) a!2804 mask!2512) (Found!13104 j!70)))))

(assert (=> b!1524271 (=> (not res!1043058) (not e!849672))))

(declare-fun bm!68395 () Bool)

(assert (=> bm!68395 (= call!68398 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159105 (not res!1043059)) b!1524268))

(assert (= (and b!1524268 c!140157) b!1524271))

(assert (= (and b!1524268 (not c!140157)) b!1524270))

(assert (= (and b!1524271 res!1043058) b!1524269))

(assert (= (or b!1524269 b!1524270) bm!68395))

(assert (=> b!1524268 m!1406593))

(assert (=> b!1524268 m!1406593))

(assert (=> b!1524268 m!1406599))

(assert (=> b!1524271 m!1406593))

(declare-fun m!1406743 () Bool)

(assert (=> b!1524271 m!1406743))

(declare-fun m!1406745 () Bool)

(assert (=> b!1524271 m!1406745))

(assert (=> b!1524271 m!1406593))

(assert (=> b!1524271 m!1406595))

(declare-fun m!1406747 () Bool)

(assert (=> bm!68395 m!1406747))

(assert (=> b!1524129 d!159105))

(declare-fun d!159109 () Bool)

(assert (=> d!159109 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660075 () Unit!50831)

(declare-fun choose!38 (array!101371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50831)

(assert (=> d!159109 (= lt!660075 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159109 (validMask!0 mask!2512)))

(assert (=> d!159109 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660075)))

(declare-fun bs!43710 () Bool)

(assert (= bs!43710 d!159109))

(assert (=> bs!43710 m!1406625))

(declare-fun m!1406749 () Bool)

(assert (=> bs!43710 m!1406749))

(assert (=> bs!43710 m!1406605))

(assert (=> b!1524129 d!159109))

(declare-fun d!159111 () Bool)

(assert (=> d!159111 (= (validKeyInArray!0 (select (arr!48916 a!2804) j!70)) (and (not (= (select (arr!48916 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48916 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524126 d!159111))

(declare-fun d!159113 () Bool)

(assert (=> d!159113 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129834 d!159113))

(declare-fun d!159117 () Bool)

(assert (=> d!159117 (= (array_inv!38149 a!2804) (bvsge (size!49468 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129834 d!159117))

(declare-fun b!1524333 () Bool)

(declare-fun e!849712 () Bool)

(declare-fun lt!660091 () SeekEntryResult!13104)

(assert (=> b!1524333 (= e!849712 (bvsge (x!136503 lt!660091) #b01111111111111111111111111111110))))

(declare-fun b!1524334 () Bool)

(assert (=> b!1524334 (and (bvsge (index!54813 lt!660091) #b00000000000000000000000000000000) (bvslt (index!54813 lt!660091) (size!49468 a!2804)))))

(declare-fun res!1043080 () Bool)

(assert (=> b!1524334 (= res!1043080 (= (select (arr!48916 a!2804) (index!54813 lt!660091)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849710 () Bool)

(assert (=> b!1524334 (=> res!1043080 e!849710)))

(declare-fun b!1524335 () Bool)

(declare-fun e!849709 () Bool)

(assert (=> b!1524335 (= e!849712 e!849709)))

(declare-fun res!1043081 () Bool)

(assert (=> b!1524335 (= res!1043081 (and ((_ is Intermediate!13104) lt!660091) (not (undefined!13916 lt!660091)) (bvslt (x!136503 lt!660091) #b01111111111111111111111111111110) (bvsge (x!136503 lt!660091) #b00000000000000000000000000000000) (bvsge (x!136503 lt!660091) x!534)))))

(assert (=> b!1524335 (=> (not res!1043081) (not e!849709))))

(declare-fun b!1524336 () Bool)

(assert (=> b!1524336 (and (bvsge (index!54813 lt!660091) #b00000000000000000000000000000000) (bvslt (index!54813 lt!660091) (size!49468 a!2804)))))

(declare-fun res!1043079 () Bool)

(assert (=> b!1524336 (= res!1043079 (= (select (arr!48916 a!2804) (index!54813 lt!660091)) (select (arr!48916 a!2804) j!70)))))

(assert (=> b!1524336 (=> res!1043079 e!849710)))

(assert (=> b!1524336 (= e!849709 e!849710)))

(declare-fun b!1524337 () Bool)

(declare-fun e!849713 () SeekEntryResult!13104)

(assert (=> b!1524337 (= e!849713 (Intermediate!13104 false index!487 x!534))))

(declare-fun b!1524338 () Bool)

(assert (=> b!1524338 (and (bvsge (index!54813 lt!660091) #b00000000000000000000000000000000) (bvslt (index!54813 lt!660091) (size!49468 a!2804)))))

(assert (=> b!1524338 (= e!849710 (= (select (arr!48916 a!2804) (index!54813 lt!660091)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1524339 () Bool)

(declare-fun e!849711 () SeekEntryResult!13104)

(assert (=> b!1524339 (= e!849711 (Intermediate!13104 true index!487 x!534))))

(declare-fun d!159119 () Bool)

(assert (=> d!159119 e!849712))

(declare-fun c!140181 () Bool)

(assert (=> d!159119 (= c!140181 (and ((_ is Intermediate!13104) lt!660091) (undefined!13916 lt!660091)))))

(assert (=> d!159119 (= lt!660091 e!849711)))

(declare-fun c!140180 () Bool)

(assert (=> d!159119 (= c!140180 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!660090 () (_ BitVec 64))

(assert (=> d!159119 (= lt!660090 (select (arr!48916 a!2804) index!487))))

(assert (=> d!159119 (validMask!0 mask!2512)))

(assert (=> d!159119 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48916 a!2804) j!70) a!2804 mask!2512) lt!660091)))

(declare-fun b!1524340 () Bool)

(assert (=> b!1524340 (= e!849711 e!849713)))

(declare-fun c!140179 () Bool)

(assert (=> b!1524340 (= c!140179 (or (= lt!660090 (select (arr!48916 a!2804) j!70)) (= (bvadd lt!660090 lt!660090) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524341 () Bool)

(assert (=> b!1524341 (= e!849713 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48916 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159119 c!140180) b!1524339))

(assert (= (and d!159119 (not c!140180)) b!1524340))

(assert (= (and b!1524340 c!140179) b!1524337))

(assert (= (and b!1524340 (not c!140179)) b!1524341))

(assert (= (and d!159119 c!140181) b!1524333))

(assert (= (and d!159119 (not c!140181)) b!1524335))

(assert (= (and b!1524335 res!1043081) b!1524336))

(assert (= (and b!1524336 (not res!1043079)) b!1524334))

(assert (= (and b!1524334 (not res!1043080)) b!1524338))

(assert (=> b!1524341 m!1406731))

(assert (=> b!1524341 m!1406731))

(assert (=> b!1524341 m!1406593))

(declare-fun m!1406757 () Bool)

(assert (=> b!1524341 m!1406757))

(declare-fun m!1406759 () Bool)

(assert (=> b!1524334 m!1406759))

(assert (=> d!159119 m!1406621))

(assert (=> d!159119 m!1406605))

(assert (=> b!1524338 m!1406759))

(assert (=> b!1524336 m!1406759))

(assert (=> b!1524136 d!159119))

(declare-fun b!1524386 () Bool)

(declare-fun c!140199 () Bool)

(declare-fun lt!660120 () (_ BitVec 64))

(assert (=> b!1524386 (= c!140199 (= lt!660120 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849740 () SeekEntryResult!13104)

(declare-fun e!849739 () SeekEntryResult!13104)

(assert (=> b!1524386 (= e!849740 e!849739)))

(declare-fun b!1524387 () Bool)

(declare-fun lt!660118 () SeekEntryResult!13104)

(assert (=> b!1524387 (= e!849739 (ite ((_ is MissingVacant!13104) lt!660118) (MissingZero!13104 (index!54814 lt!660118)) lt!660118))))

(declare-fun lt!660117 () SeekEntryResult!13104)

(assert (=> b!1524387 (= lt!660118 (seekKeyOrZeroReturnVacant!0 (x!136503 lt!660117) (index!54813 lt!660117) (index!54813 lt!660117) (select (arr!48916 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159125 () Bool)

(declare-fun lt!660119 () SeekEntryResult!13104)

(assert (=> d!159125 (and (or ((_ is MissingVacant!13104) lt!660119) (not ((_ is Found!13104) lt!660119)) (and (bvsge (index!54812 lt!660119) #b00000000000000000000000000000000) (bvslt (index!54812 lt!660119) (size!49468 a!2804)))) (not ((_ is MissingVacant!13104) lt!660119)) (or (not ((_ is Found!13104) lt!660119)) (= (select (arr!48916 a!2804) (index!54812 lt!660119)) (select (arr!48916 a!2804) j!70))))))

(declare-fun e!849741 () SeekEntryResult!13104)

(assert (=> d!159125 (= lt!660119 e!849741)))

(declare-fun c!140198 () Bool)

(assert (=> d!159125 (= c!140198 (and ((_ is Intermediate!13104) lt!660117) (undefined!13916 lt!660117)))))

(assert (=> d!159125 (= lt!660117 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48916 a!2804) j!70) mask!2512) (select (arr!48916 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159125 (validMask!0 mask!2512)))

(assert (=> d!159125 (= (seekEntry!0 (select (arr!48916 a!2804) j!70) a!2804 mask!2512) lt!660119)))

(declare-fun b!1524388 () Bool)

(assert (=> b!1524388 (= e!849741 e!849740)))

(assert (=> b!1524388 (= lt!660120 (select (arr!48916 a!2804) (index!54813 lt!660117)))))

(declare-fun c!140197 () Bool)

(assert (=> b!1524388 (= c!140197 (= lt!660120 (select (arr!48916 a!2804) j!70)))))

(declare-fun b!1524389 () Bool)

(assert (=> b!1524389 (= e!849740 (Found!13104 (index!54813 lt!660117)))))

(declare-fun b!1524390 () Bool)

(assert (=> b!1524390 (= e!849741 Undefined!13104)))

(declare-fun b!1524391 () Bool)

(assert (=> b!1524391 (= e!849739 (MissingZero!13104 (index!54813 lt!660117)))))

(assert (= (and d!159125 c!140198) b!1524390))

(assert (= (and d!159125 (not c!140198)) b!1524388))

(assert (= (and b!1524388 c!140197) b!1524389))

(assert (= (and b!1524388 (not c!140197)) b!1524386))

(assert (= (and b!1524386 c!140199) b!1524391))

(assert (= (and b!1524386 (not c!140199)) b!1524387))

(assert (=> b!1524387 m!1406593))

(declare-fun m!1406789 () Bool)

(assert (=> b!1524387 m!1406789))

(declare-fun m!1406791 () Bool)

(assert (=> d!159125 m!1406791))

(assert (=> d!159125 m!1406593))

(assert (=> d!159125 m!1406609))

(assert (=> d!159125 m!1406609))

(assert (=> d!159125 m!1406593))

(assert (=> d!159125 m!1406611))

(assert (=> d!159125 m!1406605))

(declare-fun m!1406793 () Bool)

(assert (=> b!1524388 m!1406793))

(assert (=> b!1524125 d!159125))

(declare-fun b!1524392 () Bool)

(declare-fun e!849746 () Bool)

(declare-fun lt!660125 () SeekEntryResult!13104)

(assert (=> b!1524392 (= e!849746 (bvsge (x!136503 lt!660125) #b01111111111111111111111111111110))))

(declare-fun b!1524393 () Bool)

(assert (=> b!1524393 (and (bvsge (index!54813 lt!660125) #b00000000000000000000000000000000) (bvslt (index!54813 lt!660125) (size!49468 (array!101372 (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49468 a!2804)))))))

(declare-fun res!1043099 () Bool)

(assert (=> b!1524393 (= res!1043099 (= (select (arr!48916 (array!101372 (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49468 a!2804))) (index!54813 lt!660125)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849743 () Bool)

(assert (=> b!1524393 (=> res!1043099 e!849743)))

(declare-fun b!1524394 () Bool)

(declare-fun e!849742 () Bool)

(assert (=> b!1524394 (= e!849746 e!849742)))

(declare-fun res!1043100 () Bool)

(assert (=> b!1524394 (= res!1043100 (and ((_ is Intermediate!13104) lt!660125) (not (undefined!13916 lt!660125)) (bvslt (x!136503 lt!660125) #b01111111111111111111111111111110) (bvsge (x!136503 lt!660125) #b00000000000000000000000000000000) (bvsge (x!136503 lt!660125) #b00000000000000000000000000000000)))))

(assert (=> b!1524394 (=> (not res!1043100) (not e!849742))))

(declare-fun b!1524395 () Bool)

(assert (=> b!1524395 (and (bvsge (index!54813 lt!660125) #b00000000000000000000000000000000) (bvslt (index!54813 lt!660125) (size!49468 (array!101372 (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49468 a!2804)))))))

(declare-fun res!1043098 () Bool)

(assert (=> b!1524395 (= res!1043098 (= (select (arr!48916 (array!101372 (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49468 a!2804))) (index!54813 lt!660125)) (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1524395 (=> res!1043098 e!849743)))

(assert (=> b!1524395 (= e!849742 e!849743)))

(declare-fun e!849748 () SeekEntryResult!13104)

(declare-fun b!1524396 () Bool)

(assert (=> b!1524396 (= e!849748 (Intermediate!13104 false (toIndex!0 (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524397 () Bool)

(assert (=> b!1524397 (and (bvsge (index!54813 lt!660125) #b00000000000000000000000000000000) (bvslt (index!54813 lt!660125) (size!49468 (array!101372 (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49468 a!2804)))))))

(assert (=> b!1524397 (= e!849743 (= (select (arr!48916 (array!101372 (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49468 a!2804))) (index!54813 lt!660125)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1524398 () Bool)

(declare-fun e!849744 () SeekEntryResult!13104)

(assert (=> b!1524398 (= e!849744 (Intermediate!13104 true (toIndex!0 (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159133 () Bool)

(assert (=> d!159133 e!849746))

(declare-fun c!140202 () Bool)

(assert (=> d!159133 (= c!140202 (and ((_ is Intermediate!13104) lt!660125) (undefined!13916 lt!660125)))))

(assert (=> d!159133 (= lt!660125 e!849744)))

(declare-fun c!140201 () Bool)

(assert (=> d!159133 (= c!140201 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!660123 () (_ BitVec 64))

(assert (=> d!159133 (= lt!660123 (select (arr!48916 (array!101372 (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49468 a!2804))) (toIndex!0 (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159133 (validMask!0 mask!2512)))

(assert (=> d!159133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101372 (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49468 a!2804)) mask!2512) lt!660125)))

(declare-fun b!1524399 () Bool)

(assert (=> b!1524399 (= e!849744 e!849748)))

(declare-fun c!140200 () Bool)

(assert (=> b!1524399 (= c!140200 (or (= lt!660123 (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!660123 lt!660123) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524400 () Bool)

(assert (=> b!1524400 (= e!849748 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101372 (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49468 a!2804)) mask!2512))))

(assert (= (and d!159133 c!140201) b!1524398))

(assert (= (and d!159133 (not c!140201)) b!1524399))

(assert (= (and b!1524399 c!140200) b!1524396))

(assert (= (and b!1524399 (not c!140200)) b!1524400))

(assert (= (and d!159133 c!140202) b!1524392))

(assert (= (and d!159133 (not c!140202)) b!1524394))

(assert (= (and b!1524394 res!1043100) b!1524395))

(assert (= (and b!1524395 (not res!1043098)) b!1524393))

(assert (= (and b!1524393 (not res!1043099)) b!1524397))

(assert (=> b!1524400 m!1406629))

(declare-fun m!1406795 () Bool)

(assert (=> b!1524400 m!1406795))

(assert (=> b!1524400 m!1406795))

(assert (=> b!1524400 m!1406623))

(declare-fun m!1406797 () Bool)

(assert (=> b!1524400 m!1406797))

(declare-fun m!1406799 () Bool)

(assert (=> b!1524393 m!1406799))

(assert (=> d!159133 m!1406629))

(declare-fun m!1406801 () Bool)

(assert (=> d!159133 m!1406801))

(assert (=> d!159133 m!1406605))

(assert (=> b!1524397 m!1406799))

(assert (=> b!1524395 m!1406799))

(assert (=> b!1524127 d!159133))

(declare-fun d!159137 () Bool)

(declare-fun lt!660141 () (_ BitVec 32))

(declare-fun lt!660140 () (_ BitVec 32))

(assert (=> d!159137 (= lt!660141 (bvmul (bvxor lt!660140 (bvlshr lt!660140 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159137 (= lt!660140 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159137 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043104 (let ((h!36906 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136512 (bvmul (bvxor h!36906 (bvlshr h!36906 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136512 (bvlshr x!136512 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043104 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043104 #b00000000000000000000000000000000))))))

(assert (=> d!159137 (= (toIndex!0 (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!660141 (bvlshr lt!660141 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1524127 d!159137))

(declare-fun b!1524414 () Bool)

(declare-fun e!849758 () Bool)

(declare-fun lt!660143 () SeekEntryResult!13104)

(assert (=> b!1524414 (= e!849758 (bvsge (x!136503 lt!660143) #b01111111111111111111111111111110))))

(declare-fun b!1524415 () Bool)

(assert (=> b!1524415 (and (bvsge (index!54813 lt!660143) #b00000000000000000000000000000000) (bvslt (index!54813 lt!660143) (size!49468 a!2804)))))

(declare-fun res!1043108 () Bool)

(assert (=> b!1524415 (= res!1043108 (= (select (arr!48916 a!2804) (index!54813 lt!660143)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849756 () Bool)

(assert (=> b!1524415 (=> res!1043108 e!849756)))

(declare-fun b!1524416 () Bool)

(declare-fun e!849755 () Bool)

(assert (=> b!1524416 (= e!849758 e!849755)))

(declare-fun res!1043109 () Bool)

(assert (=> b!1524416 (= res!1043109 (and ((_ is Intermediate!13104) lt!660143) (not (undefined!13916 lt!660143)) (bvslt (x!136503 lt!660143) #b01111111111111111111111111111110) (bvsge (x!136503 lt!660143) #b00000000000000000000000000000000) (bvsge (x!136503 lt!660143) #b00000000000000000000000000000000)))))

(assert (=> b!1524416 (=> (not res!1043109) (not e!849755))))

(declare-fun b!1524417 () Bool)

(assert (=> b!1524417 (and (bvsge (index!54813 lt!660143) #b00000000000000000000000000000000) (bvslt (index!54813 lt!660143) (size!49468 a!2804)))))

(declare-fun res!1043107 () Bool)

(assert (=> b!1524417 (= res!1043107 (= (select (arr!48916 a!2804) (index!54813 lt!660143)) (select (arr!48916 a!2804) j!70)))))

(assert (=> b!1524417 (=> res!1043107 e!849756)))

(assert (=> b!1524417 (= e!849755 e!849756)))

(declare-fun e!849759 () SeekEntryResult!13104)

(declare-fun b!1524418 () Bool)

(assert (=> b!1524418 (= e!849759 (Intermediate!13104 false (toIndex!0 (select (arr!48916 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524419 () Bool)

(assert (=> b!1524419 (and (bvsge (index!54813 lt!660143) #b00000000000000000000000000000000) (bvslt (index!54813 lt!660143) (size!49468 a!2804)))))

(assert (=> b!1524419 (= e!849756 (= (select (arr!48916 a!2804) (index!54813 lt!660143)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849757 () SeekEntryResult!13104)

(declare-fun b!1524420 () Bool)

(assert (=> b!1524420 (= e!849757 (Intermediate!13104 true (toIndex!0 (select (arr!48916 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159143 () Bool)

(assert (=> d!159143 e!849758))

(declare-fun c!140209 () Bool)

(assert (=> d!159143 (= c!140209 (and ((_ is Intermediate!13104) lt!660143) (undefined!13916 lt!660143)))))

(assert (=> d!159143 (= lt!660143 e!849757)))

(declare-fun c!140208 () Bool)

(assert (=> d!159143 (= c!140208 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!660142 () (_ BitVec 64))

(assert (=> d!159143 (= lt!660142 (select (arr!48916 a!2804) (toIndex!0 (select (arr!48916 a!2804) j!70) mask!2512)))))

(assert (=> d!159143 (validMask!0 mask!2512)))

(assert (=> d!159143 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48916 a!2804) j!70) mask!2512) (select (arr!48916 a!2804) j!70) a!2804 mask!2512) lt!660143)))

(declare-fun b!1524421 () Bool)

(assert (=> b!1524421 (= e!849757 e!849759)))

(declare-fun c!140207 () Bool)

(assert (=> b!1524421 (= c!140207 (or (= lt!660142 (select (arr!48916 a!2804) j!70)) (= (bvadd lt!660142 lt!660142) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524422 () Bool)

(assert (=> b!1524422 (= e!849759 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48916 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48916 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159143 c!140208) b!1524420))

(assert (= (and d!159143 (not c!140208)) b!1524421))

(assert (= (and b!1524421 c!140207) b!1524418))

(assert (= (and b!1524421 (not c!140207)) b!1524422))

(assert (= (and d!159143 c!140209) b!1524414))

(assert (= (and d!159143 (not c!140209)) b!1524416))

(assert (= (and b!1524416 res!1043109) b!1524417))

(assert (= (and b!1524417 (not res!1043107)) b!1524415))

(assert (= (and b!1524415 (not res!1043108)) b!1524419))

(assert (=> b!1524422 m!1406609))

(declare-fun m!1406815 () Bool)

(assert (=> b!1524422 m!1406815))

(assert (=> b!1524422 m!1406815))

(assert (=> b!1524422 m!1406593))

(declare-fun m!1406817 () Bool)

(assert (=> b!1524422 m!1406817))

(declare-fun m!1406819 () Bool)

(assert (=> b!1524415 m!1406819))

(assert (=> d!159143 m!1406609))

(declare-fun m!1406821 () Bool)

(assert (=> d!159143 m!1406821))

(assert (=> d!159143 m!1406605))

(assert (=> b!1524419 m!1406819))

(assert (=> b!1524417 m!1406819))

(assert (=> b!1524134 d!159143))

(declare-fun d!159147 () Bool)

(declare-fun lt!660145 () (_ BitVec 32))

(declare-fun lt!660144 () (_ BitVec 32))

(assert (=> d!159147 (= lt!660145 (bvmul (bvxor lt!660144 (bvlshr lt!660144 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159147 (= lt!660144 ((_ extract 31 0) (bvand (bvxor (select (arr!48916 a!2804) j!70) (bvlshr (select (arr!48916 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159147 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043104 (let ((h!36906 ((_ extract 31 0) (bvand (bvxor (select (arr!48916 a!2804) j!70) (bvlshr (select (arr!48916 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136512 (bvmul (bvxor h!36906 (bvlshr h!36906 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136512 (bvlshr x!136512 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043104 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043104 #b00000000000000000000000000000000))))))

(assert (=> d!159147 (= (toIndex!0 (select (arr!48916 a!2804) j!70) mask!2512) (bvand (bvxor lt!660145 (bvlshr lt!660145 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1524134 d!159147))

(declare-fun d!159149 () Bool)

(assert (=> d!159149 (= (validKeyInArray!0 (select (arr!48916 a!2804) i!961)) (and (not (= (select (arr!48916 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48916 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1524133 d!159149))

(declare-fun b!1524423 () Bool)

(declare-fun e!849762 () Bool)

(declare-fun e!849760 () Bool)

(assert (=> b!1524423 (= e!849762 e!849760)))

(declare-fun c!140210 () Bool)

(assert (=> b!1524423 (= c!140210 (validKeyInArray!0 (select (arr!48916 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1524424 () Bool)

(declare-fun e!849761 () Bool)

(declare-fun call!68403 () Bool)

(assert (=> b!1524424 (= e!849761 call!68403)))

(declare-fun b!1524425 () Bool)

(assert (=> b!1524425 (= e!849760 call!68403)))

(declare-fun d!159151 () Bool)

(declare-fun res!1043111 () Bool)

(assert (=> d!159151 (=> res!1043111 e!849762)))

(assert (=> d!159151 (= res!1043111 (bvsge #b00000000000000000000000000000000 (size!49468 a!2804)))))

(assert (=> d!159151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!849762)))

(declare-fun b!1524426 () Bool)

(assert (=> b!1524426 (= e!849760 e!849761)))

(declare-fun lt!660146 () (_ BitVec 64))

(assert (=> b!1524426 (= lt!660146 (select (arr!48916 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!660148 () Unit!50831)

(assert (=> b!1524426 (= lt!660148 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660146 #b00000000000000000000000000000000))))

(assert (=> b!1524426 (arrayContainsKey!0 a!2804 lt!660146 #b00000000000000000000000000000000)))

(declare-fun lt!660147 () Unit!50831)

(assert (=> b!1524426 (= lt!660147 lt!660148)))

(declare-fun res!1043110 () Bool)

(assert (=> b!1524426 (= res!1043110 (= (seekEntryOrOpen!0 (select (arr!48916 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13104 #b00000000000000000000000000000000)))))

(assert (=> b!1524426 (=> (not res!1043110) (not e!849761))))

(declare-fun bm!68400 () Bool)

(assert (=> bm!68400 (= call!68403 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159151 (not res!1043111)) b!1524423))

(assert (= (and b!1524423 c!140210) b!1524426))

(assert (= (and b!1524423 (not c!140210)) b!1524425))

(assert (= (and b!1524426 res!1043110) b!1524424))

(assert (= (or b!1524424 b!1524425) bm!68400))

(assert (=> b!1524423 m!1406735))

(assert (=> b!1524423 m!1406735))

(assert (=> b!1524423 m!1406737))

(assert (=> b!1524426 m!1406735))

(declare-fun m!1406823 () Bool)

(assert (=> b!1524426 m!1406823))

(declare-fun m!1406825 () Bool)

(assert (=> b!1524426 m!1406825))

(assert (=> b!1524426 m!1406735))

(declare-fun m!1406827 () Bool)

(assert (=> b!1524426 m!1406827))

(declare-fun m!1406829 () Bool)

(assert (=> bm!68400 m!1406829))

(assert (=> b!1524135 d!159151))

(check-sat (not b!1524426) (not d!159125) (not b!1524422) (not b!1524423) (not b!1524226) (not d!159143) (not d!159133) (not b!1524387) (not b!1524256) (not bm!68400) (not d!159099) (not b!1524255) (not b!1524341) (not b!1524400) (not b!1524268) (not d!159101) (not d!159119) (not bm!68392) (not b!1524259) (not d!159109) (not bm!68395) (not b!1524240) (not b!1524271))
(check-sat)
