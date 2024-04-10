; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129496 () Bool)

(assert start!129496)

(declare-fun b!1520554 () Bool)

(declare-fun res!1039966 () Bool)

(declare-fun e!848184 () Bool)

(assert (=> b!1520554 (=> (not res!1039966) (not e!848184))))

(declare-datatypes ((array!101222 0))(
  ( (array!101223 (arr!48845 (Array (_ BitVec 32) (_ BitVec 64))) (size!49395 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101222)

(declare-datatypes ((List!35328 0))(
  ( (Nil!35325) (Cons!35324 (h!36742 (_ BitVec 64)) (t!50022 List!35328)) )
))
(declare-fun arrayNoDuplicates!0 (array!101222 (_ BitVec 32) List!35328) Bool)

(assert (=> b!1520554 (= res!1039966 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35325))))

(declare-fun b!1520555 () Bool)

(declare-fun res!1039961 () Bool)

(assert (=> b!1520555 (=> (not res!1039961) (not e!848184))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101222 (_ BitVec 32)) Bool)

(assert (=> b!1520555 (= res!1039961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1039965 () Bool)

(assert (=> start!129496 (=> (not res!1039965) (not e!848184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129496 (= res!1039965 (validMask!0 mask!2512))))

(assert (=> start!129496 e!848184))

(assert (=> start!129496 true))

(declare-fun array_inv!37873 (array!101222) Bool)

(assert (=> start!129496 (array_inv!37873 a!2804)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1520556 () Bool)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!848182 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520556 (= e!848182 (not (or (not (= (select (arr!48845 a!2804) j!70) (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48845 a!2804) index!487) (select (arr!48845 a!2804) j!70)) (= (select (arr!48845 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!848185 () Bool)

(assert (=> b!1520556 e!848185))

(declare-fun res!1039959 () Bool)

(assert (=> b!1520556 (=> (not res!1039959) (not e!848185))))

(assert (=> b!1520556 (= res!1039959 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50900 0))(
  ( (Unit!50901) )
))
(declare-fun lt!659124 () Unit!50900)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50900)

(assert (=> b!1520556 (= lt!659124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520557 () Bool)

(declare-fun res!1039960 () Bool)

(assert (=> b!1520557 (=> (not res!1039960) (not e!848184))))

(assert (=> b!1520557 (= res!1039960 (and (= (size!49395 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49395 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49395 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520558 () Bool)

(declare-fun res!1039963 () Bool)

(assert (=> b!1520558 (=> (not res!1039963) (not e!848184))))

(assert (=> b!1520558 (= res!1039963 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49395 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49395 a!2804))))))

(declare-fun b!1520559 () Bool)

(declare-fun res!1039967 () Bool)

(assert (=> b!1520559 (=> (not res!1039967) (not e!848184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520559 (= res!1039967 (validKeyInArray!0 (select (arr!48845 a!2804) j!70)))))

(declare-fun b!1520560 () Bool)

(assert (=> b!1520560 (= e!848184 e!848182)))

(declare-fun res!1039964 () Bool)

(assert (=> b!1520560 (=> (not res!1039964) (not e!848182))))

(declare-datatypes ((SeekEntryResult!13016 0))(
  ( (MissingZero!13016 (index!54459 (_ BitVec 32))) (Found!13016 (index!54460 (_ BitVec 32))) (Intermediate!13016 (undefined!13828 Bool) (index!54461 (_ BitVec 32)) (x!136142 (_ BitVec 32))) (Undefined!13016) (MissingVacant!13016 (index!54462 (_ BitVec 32))) )
))
(declare-fun lt!659125 () SeekEntryResult!13016)

(declare-fun lt!659123 () SeekEntryResult!13016)

(assert (=> b!1520560 (= res!1039964 (= lt!659125 lt!659123))))

(assert (=> b!1520560 (= lt!659123 (Intermediate!13016 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101222 (_ BitVec 32)) SeekEntryResult!13016)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520560 (= lt!659125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48845 a!2804) j!70) mask!2512) (select (arr!48845 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520561 () Bool)

(declare-fun res!1039962 () Bool)

(assert (=> b!1520561 (=> (not res!1039962) (not e!848182))))

(assert (=> b!1520561 (= res!1039962 (= lt!659125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101223 (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49395 a!2804)) mask!2512)))))

(declare-fun b!1520562 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101222 (_ BitVec 32)) SeekEntryResult!13016)

(assert (=> b!1520562 (= e!848185 (= (seekEntry!0 (select (arr!48845 a!2804) j!70) a!2804 mask!2512) (Found!13016 j!70)))))

(declare-fun b!1520563 () Bool)

(declare-fun res!1039968 () Bool)

(assert (=> b!1520563 (=> (not res!1039968) (not e!848182))))

(assert (=> b!1520563 (= res!1039968 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48845 a!2804) j!70) a!2804 mask!2512) lt!659123))))

(declare-fun b!1520564 () Bool)

(declare-fun res!1039969 () Bool)

(assert (=> b!1520564 (=> (not res!1039969) (not e!848184))))

(assert (=> b!1520564 (= res!1039969 (validKeyInArray!0 (select (arr!48845 a!2804) i!961)))))

(assert (= (and start!129496 res!1039965) b!1520557))

(assert (= (and b!1520557 res!1039960) b!1520564))

(assert (= (and b!1520564 res!1039969) b!1520559))

(assert (= (and b!1520559 res!1039967) b!1520555))

(assert (= (and b!1520555 res!1039961) b!1520554))

(assert (= (and b!1520554 res!1039966) b!1520558))

(assert (= (and b!1520558 res!1039963) b!1520560))

(assert (= (and b!1520560 res!1039964) b!1520563))

(assert (= (and b!1520563 res!1039968) b!1520561))

(assert (= (and b!1520561 res!1039962) b!1520556))

(assert (= (and b!1520556 res!1039959) b!1520562))

(declare-fun m!1403783 () Bool)

(assert (=> b!1520562 m!1403783))

(assert (=> b!1520562 m!1403783))

(declare-fun m!1403785 () Bool)

(assert (=> b!1520562 m!1403785))

(assert (=> b!1520563 m!1403783))

(assert (=> b!1520563 m!1403783))

(declare-fun m!1403787 () Bool)

(assert (=> b!1520563 m!1403787))

(declare-fun m!1403789 () Bool)

(assert (=> b!1520555 m!1403789))

(declare-fun m!1403791 () Bool)

(assert (=> b!1520554 m!1403791))

(declare-fun m!1403793 () Bool)

(assert (=> b!1520561 m!1403793))

(declare-fun m!1403795 () Bool)

(assert (=> b!1520561 m!1403795))

(assert (=> b!1520561 m!1403795))

(declare-fun m!1403797 () Bool)

(assert (=> b!1520561 m!1403797))

(assert (=> b!1520561 m!1403797))

(assert (=> b!1520561 m!1403795))

(declare-fun m!1403799 () Bool)

(assert (=> b!1520561 m!1403799))

(declare-fun m!1403801 () Bool)

(assert (=> start!129496 m!1403801))

(declare-fun m!1403803 () Bool)

(assert (=> start!129496 m!1403803))

(assert (=> b!1520559 m!1403783))

(assert (=> b!1520559 m!1403783))

(declare-fun m!1403805 () Bool)

(assert (=> b!1520559 m!1403805))

(assert (=> b!1520560 m!1403783))

(assert (=> b!1520560 m!1403783))

(declare-fun m!1403807 () Bool)

(assert (=> b!1520560 m!1403807))

(assert (=> b!1520560 m!1403807))

(assert (=> b!1520560 m!1403783))

(declare-fun m!1403809 () Bool)

(assert (=> b!1520560 m!1403809))

(assert (=> b!1520556 m!1403783))

(declare-fun m!1403811 () Bool)

(assert (=> b!1520556 m!1403811))

(assert (=> b!1520556 m!1403793))

(declare-fun m!1403813 () Bool)

(assert (=> b!1520556 m!1403813))

(assert (=> b!1520556 m!1403795))

(declare-fun m!1403815 () Bool)

(assert (=> b!1520556 m!1403815))

(declare-fun m!1403817 () Bool)

(assert (=> b!1520564 m!1403817))

(assert (=> b!1520564 m!1403817))

(declare-fun m!1403819 () Bool)

(assert (=> b!1520564 m!1403819))

(push 1)

(assert (not b!1520556))

(assert (not start!129496))

(assert (not b!1520555))

(assert (not b!1520562))

(assert (not b!1520564))

(assert (not b!1520563))

(assert (not b!1520560))

(assert (not b!1520561))

(assert (not b!1520554))

(assert (not b!1520559))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1520747 () Bool)

(declare-fun lt!659197 () SeekEntryResult!13016)

(assert (=> b!1520747 (and (bvsge (index!54461 lt!659197) #b00000000000000000000000000000000) (bvslt (index!54461 lt!659197) (size!49395 (array!101223 (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49395 a!2804)))))))

(declare-fun res!1040078 () Bool)

(assert (=> b!1520747 (= res!1040078 (= (select (arr!48845 (array!101223 (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49395 a!2804))) (index!54461 lt!659197)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!848282 () Bool)

(assert (=> b!1520747 (=> res!1040078 e!848282)))

(declare-fun b!1520748 () Bool)

(declare-fun e!848285 () SeekEntryResult!13016)

(declare-fun e!848283 () SeekEntryResult!13016)

(assert (=> b!1520748 (= e!848285 e!848283)))

(declare-fun c!139880 () Bool)

(declare-fun lt!659196 () (_ BitVec 64))

(assert (=> b!1520748 (= c!139880 (or (= lt!659196 (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659196 lt!659196) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520749 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520749 (= e!848283 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101223 (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49395 a!2804)) mask!2512))))

(declare-fun d!158963 () Bool)

(declare-fun e!848281 () Bool)

(assert (=> d!158963 e!848281))

(declare-fun c!139881 () Bool)

(assert (=> d!158963 (= c!139881 (and (is-Intermediate!13016 lt!659197) (undefined!13828 lt!659197)))))

(assert (=> d!158963 (= lt!659197 e!848285)))

(declare-fun c!139882 () Bool)

(assert (=> d!158963 (= c!139882 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158963 (= lt!659196 (select (arr!48845 (array!101223 (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49395 a!2804))) (toIndex!0 (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!158963 (validMask!0 mask!2512)))

(assert (=> d!158963 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101223 (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49395 a!2804)) mask!2512) lt!659197)))

(declare-fun b!1520750 () Bool)

(assert (=> b!1520750 (= e!848281 (bvsge (x!136142 lt!659197) #b01111111111111111111111111111110))))

(declare-fun b!1520751 () Bool)

(declare-fun e!848284 () Bool)

(assert (=> b!1520751 (= e!848281 e!848284)))

(declare-fun res!1040079 () Bool)

(assert (=> b!1520751 (= res!1040079 (and (is-Intermediate!13016 lt!659197) (not (undefined!13828 lt!659197)) (bvslt (x!136142 lt!659197) #b01111111111111111111111111111110) (bvsge (x!136142 lt!659197) #b00000000000000000000000000000000) (bvsge (x!136142 lt!659197) #b00000000000000000000000000000000)))))

(assert (=> b!1520751 (=> (not res!1040079) (not e!848284))))

(declare-fun b!1520752 () Bool)

(assert (=> b!1520752 (and (bvsge (index!54461 lt!659197) #b00000000000000000000000000000000) (bvslt (index!54461 lt!659197) (size!49395 (array!101223 (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49395 a!2804)))))))

(assert (=> b!1520752 (= e!848282 (= (select (arr!48845 (array!101223 (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49395 a!2804))) (index!54461 lt!659197)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520753 () Bool)

(assert (=> b!1520753 (= e!848283 (Intermediate!13016 false (toIndex!0 (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520754 () Bool)

(assert (=> b!1520754 (= e!848285 (Intermediate!13016 true (toIndex!0 (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520755 () Bool)

(assert (=> b!1520755 (and (bvsge (index!54461 lt!659197) #b00000000000000000000000000000000) (bvslt (index!54461 lt!659197) (size!49395 (array!101223 (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49395 a!2804)))))))

(declare-fun res!1040077 () Bool)

(assert (=> b!1520755 (= res!1040077 (= (select (arr!48845 (array!101223 (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49395 a!2804))) (index!54461 lt!659197)) (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1520755 (=> res!1040077 e!848282)))

(assert (=> b!1520755 (= e!848284 e!848282)))

(assert (= (and d!158963 c!139882) b!1520754))

(assert (= (and d!158963 (not c!139882)) b!1520748))

(assert (= (and b!1520748 c!139880) b!1520753))

(assert (= (and b!1520748 (not c!139880)) b!1520749))

(assert (= (and d!158963 c!139881) b!1520750))

(assert (= (and d!158963 (not c!139881)) b!1520751))

(assert (= (and b!1520751 res!1040079) b!1520755))

(assert (= (and b!1520755 (not res!1040077)) b!1520747))

(assert (= (and b!1520747 (not res!1040078)) b!1520752))

(assert (=> b!1520749 m!1403797))

(declare-fun m!1403943 () Bool)

(assert (=> b!1520749 m!1403943))

(assert (=> b!1520749 m!1403943))

(assert (=> b!1520749 m!1403795))

(declare-fun m!1403945 () Bool)

(assert (=> b!1520749 m!1403945))

(declare-fun m!1403947 () Bool)

(assert (=> b!1520755 m!1403947))

(assert (=> d!158963 m!1403797))

(declare-fun m!1403949 () Bool)

(assert (=> d!158963 m!1403949))

(assert (=> d!158963 m!1403801))

(assert (=> b!1520747 m!1403947))

(assert (=> b!1520752 m!1403947))

(assert (=> b!1520561 d!158963))

(declare-fun d!158977 () Bool)

(declare-fun lt!659206 () (_ BitVec 32))

(declare-fun lt!659205 () (_ BitVec 32))

(assert (=> d!158977 (= lt!659206 (bvmul (bvxor lt!659205 (bvlshr lt!659205 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158977 (= lt!659205 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158977 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1040080 (let ((h!36746 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136148 (bvmul (bvxor h!36746 (bvlshr h!36746 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136148 (bvlshr x!136148 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1040080 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1040080 #b00000000000000000000000000000000))))))

(assert (=> d!158977 (= (toIndex!0 (select (store (arr!48845 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!659206 (bvlshr lt!659206 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1520561 d!158977))

(declare-fun b!1520768 () Bool)

(declare-fun e!848297 () Bool)

(declare-fun call!68370 () Bool)

(assert (=> b!1520768 (= e!848297 call!68370)))

(declare-fun bm!68367 () Bool)

(assert (=> bm!68367 (= call!68370 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!158983 () Bool)

(declare-fun res!1040087 () Bool)

(declare-fun e!848296 () Bool)

(assert (=> d!158983 (=> res!1040087 e!848296)))

(assert (=> d!158983 (= res!1040087 (bvsge j!70 (size!49395 a!2804)))))

(assert (=> d!158983 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!848296)))

(declare-fun b!1520769 () Bool)

(declare-fun e!848295 () Bool)

(assert (=> b!1520769 (= e!848297 e!848295)))

(declare-fun lt!659218 () (_ BitVec 64))

(assert (=> b!1520769 (= lt!659218 (select (arr!48845 a!2804) j!70))))

(declare-fun lt!659216 () Unit!50900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101222 (_ BitVec 64) (_ BitVec 32)) Unit!50900)

(assert (=> b!1520769 (= lt!659216 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659218 j!70))))

(declare-fun arrayContainsKey!0 (array!101222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1520769 (arrayContainsKey!0 a!2804 lt!659218 #b00000000000000000000000000000000)))

(declare-fun lt!659217 () Unit!50900)

(assert (=> b!1520769 (= lt!659217 lt!659216)))

(declare-fun res!1040088 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101222 (_ BitVec 32)) SeekEntryResult!13016)

(assert (=> b!1520769 (= res!1040088 (= (seekEntryOrOpen!0 (select (arr!48845 a!2804) j!70) a!2804 mask!2512) (Found!13016 j!70)))))

(assert (=> b!1520769 (=> (not res!1040088) (not e!848295))))

(declare-fun b!1520770 () Bool)

(assert (=> b!1520770 (= e!848295 call!68370)))

(declare-fun b!1520771 () Bool)

(assert (=> b!1520771 (= e!848296 e!848297)))

(declare-fun c!139886 () Bool)

(assert (=> b!1520771 (= c!139886 (validKeyInArray!0 (select (arr!48845 a!2804) j!70)))))

(assert (= (and d!158983 (not res!1040087)) b!1520771))

(assert (= (and b!1520771 c!139886) b!1520769))

(assert (= (and b!1520771 (not c!139886)) b!1520768))

(assert (= (and b!1520769 res!1040088) b!1520770))

(assert (= (or b!1520770 b!1520768) bm!68367))

(declare-fun m!1403961 () Bool)

(assert (=> bm!68367 m!1403961))

(assert (=> b!1520769 m!1403783))

(declare-fun m!1403963 () Bool)

(assert (=> b!1520769 m!1403963))

(declare-fun m!1403965 () Bool)

(assert (=> b!1520769 m!1403965))

(assert (=> b!1520769 m!1403783))

(declare-fun m!1403967 () Bool)

(assert (=> b!1520769 m!1403967))

(assert (=> b!1520771 m!1403783))

(assert (=> b!1520771 m!1403783))

(assert (=> b!1520771 m!1403805))

(assert (=> b!1520556 d!158983))

(declare-fun d!158989 () Bool)

(assert (=> d!158989 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!659229 () Unit!50900)

(declare-fun choose!38 (array!101222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50900)

(assert (=> d!158989 (= lt!659229 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158989 (validMask!0 mask!2512)))

(assert (=> d!158989 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!659229)))

(declare-fun bs!43641 () Bool)

(assert (= bs!43641 d!158989))

(assert (=> bs!43641 m!1403815))

(declare-fun m!1403969 () Bool)

(assert (=> bs!43641 m!1403969))

(assert (=> bs!43641 m!1403801))

(assert (=> b!1520556 d!158989))

(declare-fun b!1520804 () Bool)

(declare-fun e!848318 () Bool)

(declare-fun e!848321 () Bool)

(assert (=> b!1520804 (= e!848318 e!848321)))

(declare-fun c!139899 () Bool)

(assert (=> b!1520804 (= c!139899 (validKeyInArray!0 (select (arr!48845 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520805 () Bool)

(declare-fun call!68374 () Bool)

(assert (=> b!1520805 (= e!848321 call!68374)))

(declare-fun b!1520806 () Bool)

(declare-fun e!848320 () Bool)

(assert (=> b!1520806 (= e!848320 e!848318)))

(declare-fun res!1040098 () Bool)

(assert (=> b!1520806 (=> (not res!1040098) (not e!848318))))

(declare-fun e!848319 () Bool)

(assert (=> b!1520806 (= res!1040098 (not e!848319))))

(declare-fun res!1040097 () Bool)

(assert (=> b!1520806 (=> (not res!1040097) (not e!848319))))

(assert (=> b!1520806 (= res!1040097 (validKeyInArray!0 (select (arr!48845 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520807 () Bool)

(assert (=> b!1520807 (= e!848321 call!68374)))

(declare-fun b!1520808 () Bool)

(declare-fun contains!9983 (List!35328 (_ BitVec 64)) Bool)

(assert (=> b!1520808 (= e!848319 (contains!9983 Nil!35325 (select (arr!48845 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158995 () Bool)

(declare-fun res!1040099 () Bool)

(assert (=> d!158995 (=> res!1040099 e!848320)))

(assert (=> d!158995 (= res!1040099 (bvsge #b00000000000000000000000000000000 (size!49395 a!2804)))))

(assert (=> d!158995 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35325) e!848320)))

(declare-fun bm!68371 () Bool)

(assert (=> bm!68371 (= call!68374 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139899 (Cons!35324 (select (arr!48845 a!2804) #b00000000000000000000000000000000) Nil!35325) Nil!35325)))))

(assert (= (and d!158995 (not res!1040099)) b!1520806))

(assert (= (and b!1520806 res!1040097) b!1520808))

(assert (= (and b!1520806 res!1040098) b!1520804))

(assert (= (and b!1520804 c!139899) b!1520805))

(assert (= (and b!1520804 (not c!139899)) b!1520807))

(assert (= (or b!1520805 b!1520807) bm!68371))

(declare-fun m!1403985 () Bool)

(assert (=> b!1520804 m!1403985))

(assert (=> b!1520804 m!1403985))

(declare-fun m!1403987 () Bool)

(assert (=> b!1520804 m!1403987))

(assert (=> b!1520806 m!1403985))

(assert (=> b!1520806 m!1403985))

(assert (=> b!1520806 m!1403987))

(assert (=> b!1520808 m!1403985))

(assert (=> b!1520808 m!1403985))

(declare-fun m!1403989 () Bool)

(assert (=> b!1520808 m!1403989))

(assert (=> bm!68371 m!1403985))

(declare-fun m!1403991 () Bool)

(assert (=> bm!68371 m!1403991))

(assert (=> b!1520554 d!158995))

(declare-fun b!1520809 () Bool)

(declare-fun e!848324 () Bool)

(declare-fun call!68375 () Bool)

(assert (=> b!1520809 (= e!848324 call!68375)))

(declare-fun bm!68372 () Bool)

(assert (=> bm!68372 (= call!68375 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159001 () Bool)

(declare-fun res!1040100 () Bool)

(declare-fun e!848323 () Bool)

(assert (=> d!159001 (=> res!1040100 e!848323)))

(assert (=> d!159001 (= res!1040100 (bvsge #b00000000000000000000000000000000 (size!49395 a!2804)))))

(assert (=> d!159001 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!848323)))

(declare-fun b!1520810 () Bool)

(declare-fun e!848322 () Bool)

(assert (=> b!1520810 (= e!848324 e!848322)))

(declare-fun lt!659239 () (_ BitVec 64))

(assert (=> b!1520810 (= lt!659239 (select (arr!48845 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!659237 () Unit!50900)

(assert (=> b!1520810 (= lt!659237 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659239 #b00000000000000000000000000000000))))

(assert (=> b!1520810 (arrayContainsKey!0 a!2804 lt!659239 #b00000000000000000000000000000000)))

(declare-fun lt!659238 () Unit!50900)

(assert (=> b!1520810 (= lt!659238 lt!659237)))

(declare-fun res!1040101 () Bool)

(assert (=> b!1520810 (= res!1040101 (= (seekEntryOrOpen!0 (select (arr!48845 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13016 #b00000000000000000000000000000000)))))

(assert (=> b!1520810 (=> (not res!1040101) (not e!848322))))

(declare-fun b!1520811 () Bool)

(assert (=> b!1520811 (= e!848322 call!68375)))

(declare-fun b!1520812 () Bool)

(assert (=> b!1520812 (= e!848323 e!848324)))

(declare-fun c!139900 () Bool)

(assert (=> b!1520812 (= c!139900 (validKeyInArray!0 (select (arr!48845 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159001 (not res!1040100)) b!1520812))

(assert (= (and b!1520812 c!139900) b!1520810))

(assert (= (and b!1520812 (not c!139900)) b!1520809))

(assert (= (and b!1520810 res!1040101) b!1520811))

(assert (= (or b!1520811 b!1520809) bm!68372))

(declare-fun m!1403993 () Bool)

(assert (=> bm!68372 m!1403993))

(assert (=> b!1520810 m!1403985))

(declare-fun m!1403995 () Bool)

(assert (=> b!1520810 m!1403995))

(declare-fun m!1403997 () Bool)

(assert (=> b!1520810 m!1403997))

(assert (=> b!1520810 m!1403985))

(declare-fun m!1403999 () Bool)

(assert (=> b!1520810 m!1403999))

(assert (=> b!1520812 m!1403985))

(assert (=> b!1520812 m!1403985))

(assert (=> b!1520812 m!1403987))

(assert (=> b!1520555 d!159001))

(declare-fun b!1520813 () Bool)

(declare-fun lt!659241 () SeekEntryResult!13016)

(assert (=> b!1520813 (and (bvsge (index!54461 lt!659241) #b00000000000000000000000000000000) (bvslt (index!54461 lt!659241) (size!49395 a!2804)))))

(declare-fun res!1040103 () Bool)

(assert (=> b!1520813 (= res!1040103 (= (select (arr!48845 a!2804) (index!54461 lt!659241)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!848326 () Bool)

(assert (=> b!1520813 (=> res!1040103 e!848326)))

(declare-fun b!1520814 () Bool)

(declare-fun e!848329 () SeekEntryResult!13016)

(declare-fun e!848327 () SeekEntryResult!13016)

(assert (=> b!1520814 (= e!848329 e!848327)))

(declare-fun lt!659240 () (_ BitVec 64))

(declare-fun c!139901 () Bool)

(assert (=> b!1520814 (= c!139901 (or (= lt!659240 (select (arr!48845 a!2804) j!70)) (= (bvadd lt!659240 lt!659240) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520815 () Bool)

(assert (=> b!1520815 (= e!848327 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48845 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48845 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159003 () Bool)

(declare-fun e!848325 () Bool)

(assert (=> d!159003 e!848325))

(declare-fun c!139902 () Bool)

(assert (=> d!159003 (= c!139902 (and (is-Intermediate!13016 lt!659241) (undefined!13828 lt!659241)))))

(assert (=> d!159003 (= lt!659241 e!848329)))

(declare-fun c!139903 () Bool)

(assert (=> d!159003 (= c!139903 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159003 (= lt!659240 (select (arr!48845 a!2804) (toIndex!0 (select (arr!48845 a!2804) j!70) mask!2512)))))

(assert (=> d!159003 (validMask!0 mask!2512)))

(assert (=> d!159003 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48845 a!2804) j!70) mask!2512) (select (arr!48845 a!2804) j!70) a!2804 mask!2512) lt!659241)))

(declare-fun b!1520816 () Bool)

(assert (=> b!1520816 (= e!848325 (bvsge (x!136142 lt!659241) #b01111111111111111111111111111110))))

(declare-fun b!1520817 () Bool)

(declare-fun e!848328 () Bool)

(assert (=> b!1520817 (= e!848325 e!848328)))

(declare-fun res!1040104 () Bool)

(assert (=> b!1520817 (= res!1040104 (and (is-Intermediate!13016 lt!659241) (not (undefined!13828 lt!659241)) (bvslt (x!136142 lt!659241) #b01111111111111111111111111111110) (bvsge (x!136142 lt!659241) #b00000000000000000000000000000000) (bvsge (x!136142 lt!659241) #b00000000000000000000000000000000)))))

(assert (=> b!1520817 (=> (not res!1040104) (not e!848328))))

(declare-fun b!1520818 () Bool)

(assert (=> b!1520818 (and (bvsge (index!54461 lt!659241) #b00000000000000000000000000000000) (bvslt (index!54461 lt!659241) (size!49395 a!2804)))))

(assert (=> b!1520818 (= e!848326 (= (select (arr!48845 a!2804) (index!54461 lt!659241)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520819 () Bool)

(assert (=> b!1520819 (= e!848327 (Intermediate!13016 false (toIndex!0 (select (arr!48845 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520820 () Bool)

(assert (=> b!1520820 (= e!848329 (Intermediate!13016 true (toIndex!0 (select (arr!48845 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520821 () Bool)

(assert (=> b!1520821 (and (bvsge (index!54461 lt!659241) #b00000000000000000000000000000000) (bvslt (index!54461 lt!659241) (size!49395 a!2804)))))

(declare-fun res!1040102 () Bool)

(assert (=> b!1520821 (= res!1040102 (= (select (arr!48845 a!2804) (index!54461 lt!659241)) (select (arr!48845 a!2804) j!70)))))

(assert (=> b!1520821 (=> res!1040102 e!848326)))

(assert (=> b!1520821 (= e!848328 e!848326)))

(assert (= (and d!159003 c!139903) b!1520820))

(assert (= (and d!159003 (not c!139903)) b!1520814))

(assert (= (and b!1520814 c!139901) b!1520819))

(assert (= (and b!1520814 (not c!139901)) b!1520815))

(assert (= (and d!159003 c!139902) b!1520816))

(assert (= (and d!159003 (not c!139902)) b!1520817))

(assert (= (and b!1520817 res!1040104) b!1520821))

(assert (= (and b!1520821 (not res!1040102)) b!1520813))

(assert (= (and b!1520813 (not res!1040103)) b!1520818))

(assert (=> b!1520815 m!1403807))

(declare-fun m!1404001 () Bool)

(assert (=> b!1520815 m!1404001))

(assert (=> b!1520815 m!1404001))

(assert (=> b!1520815 m!1403783))

(declare-fun m!1404003 () Bool)

(assert (=> b!1520815 m!1404003))

(declare-fun m!1404005 () Bool)

(assert (=> b!1520821 m!1404005))

(assert (=> d!159003 m!1403807))

(declare-fun m!1404007 () Bool)

(assert (=> d!159003 m!1404007))

(assert (=> d!159003 m!1403801))

(assert (=> b!1520813 m!1404005))

(assert (=> b!1520818 m!1404005))

(assert (=> b!1520560 d!159003))

(declare-fun d!159005 () Bool)

(declare-fun lt!659243 () (_ BitVec 32))

(declare-fun lt!659242 () (_ BitVec 32))

(assert (=> d!159005 (= lt!659243 (bvmul (bvxor lt!659242 (bvlshr lt!659242 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159005 (= lt!659242 ((_ extract 31 0) (bvand (bvxor (select (arr!48845 a!2804) j!70) (bvlshr (select (arr!48845 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159005 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1040080 (let ((h!36746 ((_ extract 31 0) (bvand (bvxor (select (arr!48845 a!2804) j!70) (bvlshr (select (arr!48845 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136148 (bvmul (bvxor h!36746 (bvlshr h!36746 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136148 (bvlshr x!136148 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1040080 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1040080 #b00000000000000000000000000000000))))))

(assert (=> d!159005 (= (toIndex!0 (select (arr!48845 a!2804) j!70) mask!2512) (bvand (bvxor lt!659243 (bvlshr lt!659243 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1520560 d!159005))

(declare-fun d!159007 () Bool)

(assert (=> d!159007 (= (validKeyInArray!0 (select (arr!48845 a!2804) j!70)) (and (not (= (select (arr!48845 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48845 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520559 d!159007))

(declare-fun d!159009 () Bool)

(assert (=> d!159009 (= (validKeyInArray!0 (select (arr!48845 a!2804) i!961)) (and (not (= (select (arr!48845 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48845 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520564 d!159009))

(declare-fun d!159011 () Bool)

(assert (=> d!159011 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129496 d!159011))

(declare-fun d!159013 () Bool)

(assert (=> d!159013 (= (array_inv!37873 a!2804) (bvsge (size!49395 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129496 d!159013))

(declare-fun b!1520876 () Bool)

(declare-fun e!848363 () SeekEntryResult!13016)

(declare-fun lt!659265 () SeekEntryResult!13016)

(assert (=> b!1520876 (= e!848363 (ite (is-MissingVacant!13016 lt!659265) (MissingZero!13016 (index!54462 lt!659265)) lt!659265))))

(declare-fun lt!659264 () SeekEntryResult!13016)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101222 (_ BitVec 32)) SeekEntryResult!13016)

(assert (=> b!1520876 (= lt!659265 (seekKeyOrZeroReturnVacant!0 (x!136142 lt!659264) (index!54461 lt!659264) (index!54461 lt!659264) (select (arr!48845 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520877 () Bool)

(assert (=> b!1520877 (= e!848363 (MissingZero!13016 (index!54461 lt!659264)))))

(declare-fun b!1520878 () Bool)

(declare-fun e!848365 () SeekEntryResult!13016)

(assert (=> b!1520878 (= e!848365 Undefined!13016)))

(declare-fun b!1520879 () Bool)

(declare-fun e!848364 () SeekEntryResult!13016)

(assert (=> b!1520879 (= e!848365 e!848364)))

(declare-fun lt!659267 () (_ BitVec 64))

(assert (=> b!1520879 (= lt!659267 (select (arr!48845 a!2804) (index!54461 lt!659264)))))

(declare-fun c!139922 () Bool)

(assert (=> b!1520879 (= c!139922 (= lt!659267 (select (arr!48845 a!2804) j!70)))))

(declare-fun b!1520880 () Bool)

(assert (=> b!1520880 (= e!848364 (Found!13016 (index!54461 lt!659264)))))

(declare-fun b!1520881 () Bool)

(declare-fun c!139923 () Bool)

(assert (=> b!1520881 (= c!139923 (= lt!659267 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520881 (= e!848364 e!848363)))

(declare-fun d!159015 () Bool)

(declare-fun lt!659266 () SeekEntryResult!13016)

(assert (=> d!159015 (and (or (is-MissingVacant!13016 lt!659266) (not (is-Found!13016 lt!659266)) (and (bvsge (index!54460 lt!659266) #b00000000000000000000000000000000) (bvslt (index!54460 lt!659266) (size!49395 a!2804)))) (not (is-MissingVacant!13016 lt!659266)) (or (not (is-Found!13016 lt!659266)) (= (select (arr!48845 a!2804) (index!54460 lt!659266)) (select (arr!48845 a!2804) j!70))))))

(assert (=> d!159015 (= lt!659266 e!848365)))

(declare-fun c!139924 () Bool)

(assert (=> d!159015 (= c!139924 (and (is-Intermediate!13016 lt!659264) (undefined!13828 lt!659264)))))

(assert (=> d!159015 (= lt!659264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48845 a!2804) j!70) mask!2512) (select (arr!48845 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159015 (validMask!0 mask!2512)))

(assert (=> d!159015 (= (seekEntry!0 (select (arr!48845 a!2804) j!70) a!2804 mask!2512) lt!659266)))

(assert (= (and d!159015 c!139924) b!1520878))

(assert (= (and d!159015 (not c!139924)) b!1520879))

(assert (= (and b!1520879 c!139922) b!1520880))

(assert (= (and b!1520879 (not c!139922)) b!1520881))

(assert (= (and b!1520881 c!139923) b!1520877))

(assert (= (and b!1520881 (not c!139923)) b!1520876))

(assert (=> b!1520876 m!1403783))

(declare-fun m!1404025 () Bool)

(assert (=> b!1520876 m!1404025))

(declare-fun m!1404027 () Bool)

(assert (=> b!1520879 m!1404027))

(declare-fun m!1404029 () Bool)

(assert (=> d!159015 m!1404029))

(assert (=> d!159015 m!1403783))

(assert (=> d!159015 m!1403807))

