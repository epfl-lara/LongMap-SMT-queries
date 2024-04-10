; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130374 () Bool)

(assert start!130374)

(declare-fun b!1530498 () Bool)

(declare-fun res!1048031 () Bool)

(declare-fun e!852828 () Bool)

(assert (=> b!1530498 (=> (not res!1048031) (not e!852828))))

(declare-datatypes ((array!101667 0))(
  ( (array!101668 (arr!49057 (Array (_ BitVec 32) (_ BitVec 64))) (size!49607 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101667)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530498 (= res!1048031 (validKeyInArray!0 (select (arr!49057 a!2804) i!961)))))

(declare-fun e!852830 () Bool)

(declare-fun b!1530499 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13222 0))(
  ( (MissingZero!13222 (index!55283 (_ BitVec 32))) (Found!13222 (index!55284 (_ BitVec 32))) (Intermediate!13222 (undefined!14034 Bool) (index!55285 (_ BitVec 32)) (x!136966 (_ BitVec 32))) (Undefined!13222) (MissingVacant!13222 (index!55286 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101667 (_ BitVec 32)) SeekEntryResult!13222)

(assert (=> b!1530499 (= e!852830 (= (seekEntry!0 (select (arr!49057 a!2804) j!70) a!2804 mask!2512) (Found!13222 j!70)))))

(declare-fun b!1530500 () Bool)

(declare-fun res!1048023 () Bool)

(assert (=> b!1530500 (=> (not res!1048023) (not e!852828))))

(assert (=> b!1530500 (= res!1048023 (validKeyInArray!0 (select (arr!49057 a!2804) j!70)))))

(declare-fun b!1530501 () Bool)

(declare-fun res!1048027 () Bool)

(declare-fun e!852829 () Bool)

(assert (=> b!1530501 (=> (not res!1048027) (not e!852829))))

(declare-fun lt!662838 () SeekEntryResult!13222)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101667 (_ BitVec 32)) SeekEntryResult!13222)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530501 (= res!1048027 (= lt!662838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101668 (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49607 a!2804)) mask!2512)))))

(declare-fun b!1530502 () Bool)

(declare-fun e!852831 () Bool)

(assert (=> b!1530502 (= e!852829 (not e!852831))))

(declare-fun res!1048029 () Bool)

(assert (=> b!1530502 (=> res!1048029 e!852831)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1530502 (= res!1048029 (or (not (= (select (arr!49057 a!2804) j!70) (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1530502 e!852830))

(declare-fun res!1048025 () Bool)

(assert (=> b!1530502 (=> (not res!1048025) (not e!852830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101667 (_ BitVec 32)) Bool)

(assert (=> b!1530502 (= res!1048025 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51228 0))(
  ( (Unit!51229) )
))
(declare-fun lt!662837 () Unit!51228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51228)

(assert (=> b!1530502 (= lt!662837 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530503 () Bool)

(declare-fun res!1048033 () Bool)

(assert (=> b!1530503 (=> (not res!1048033) (not e!852828))))

(assert (=> b!1530503 (= res!1048033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530504 () Bool)

(declare-fun res!1048030 () Bool)

(assert (=> b!1530504 (=> (not res!1048030) (not e!852829))))

(declare-fun lt!662836 () SeekEntryResult!13222)

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1530504 (= res!1048030 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49057 a!2804) j!70) a!2804 mask!2512) lt!662836))))

(declare-fun lt!662839 () (_ BitVec 32))

(declare-fun b!1530505 () Bool)

(assert (=> b!1530505 (= e!852831 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (and (bvsge lt!662839 #b00000000000000000000000000000000) (bvslt lt!662839 (size!49607 a!2804)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530505 (= lt!662839 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1530506 () Bool)

(declare-fun res!1048022 () Bool)

(assert (=> b!1530506 (=> (not res!1048022) (not e!852828))))

(assert (=> b!1530506 (= res!1048022 (and (= (size!49607 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49607 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49607 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530507 () Bool)

(declare-fun res!1048028 () Bool)

(assert (=> b!1530507 (=> (not res!1048028) (not e!852828))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530507 (= res!1048028 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49607 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49607 a!2804))))))

(declare-fun b!1530509 () Bool)

(declare-fun res!1048026 () Bool)

(assert (=> b!1530509 (=> (not res!1048026) (not e!852828))))

(declare-datatypes ((List!35540 0))(
  ( (Nil!35537) (Cons!35536 (h!36975 (_ BitVec 64)) (t!50234 List!35540)) )
))
(declare-fun arrayNoDuplicates!0 (array!101667 (_ BitVec 32) List!35540) Bool)

(assert (=> b!1530509 (= res!1048026 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35537))))

(declare-fun res!1048032 () Bool)

(assert (=> start!130374 (=> (not res!1048032) (not e!852828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130374 (= res!1048032 (validMask!0 mask!2512))))

(assert (=> start!130374 e!852828))

(assert (=> start!130374 true))

(declare-fun array_inv!38085 (array!101667) Bool)

(assert (=> start!130374 (array_inv!38085 a!2804)))

(declare-fun b!1530508 () Bool)

(assert (=> b!1530508 (= e!852828 e!852829)))

(declare-fun res!1048024 () Bool)

(assert (=> b!1530508 (=> (not res!1048024) (not e!852829))))

(assert (=> b!1530508 (= res!1048024 (= lt!662838 lt!662836))))

(assert (=> b!1530508 (= lt!662836 (Intermediate!13222 false resIndex!21 resX!21))))

(assert (=> b!1530508 (= lt!662838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49057 a!2804) j!70) mask!2512) (select (arr!49057 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130374 res!1048032) b!1530506))

(assert (= (and b!1530506 res!1048022) b!1530498))

(assert (= (and b!1530498 res!1048031) b!1530500))

(assert (= (and b!1530500 res!1048023) b!1530503))

(assert (= (and b!1530503 res!1048033) b!1530509))

(assert (= (and b!1530509 res!1048026) b!1530507))

(assert (= (and b!1530507 res!1048028) b!1530508))

(assert (= (and b!1530508 res!1048024) b!1530504))

(assert (= (and b!1530504 res!1048030) b!1530501))

(assert (= (and b!1530501 res!1048027) b!1530502))

(assert (= (and b!1530502 res!1048025) b!1530499))

(assert (= (and b!1530502 (not res!1048029)) b!1530505))

(declare-fun m!1413373 () Bool)

(assert (=> b!1530508 m!1413373))

(assert (=> b!1530508 m!1413373))

(declare-fun m!1413375 () Bool)

(assert (=> b!1530508 m!1413375))

(assert (=> b!1530508 m!1413375))

(assert (=> b!1530508 m!1413373))

(declare-fun m!1413377 () Bool)

(assert (=> b!1530508 m!1413377))

(assert (=> b!1530500 m!1413373))

(assert (=> b!1530500 m!1413373))

(declare-fun m!1413379 () Bool)

(assert (=> b!1530500 m!1413379))

(assert (=> b!1530504 m!1413373))

(assert (=> b!1530504 m!1413373))

(declare-fun m!1413381 () Bool)

(assert (=> b!1530504 m!1413381))

(assert (=> b!1530499 m!1413373))

(assert (=> b!1530499 m!1413373))

(declare-fun m!1413383 () Bool)

(assert (=> b!1530499 m!1413383))

(declare-fun m!1413385 () Bool)

(assert (=> b!1530503 m!1413385))

(assert (=> b!1530502 m!1413373))

(declare-fun m!1413387 () Bool)

(assert (=> b!1530502 m!1413387))

(declare-fun m!1413389 () Bool)

(assert (=> b!1530502 m!1413389))

(declare-fun m!1413391 () Bool)

(assert (=> b!1530502 m!1413391))

(declare-fun m!1413393 () Bool)

(assert (=> b!1530502 m!1413393))

(declare-fun m!1413395 () Bool)

(assert (=> b!1530509 m!1413395))

(declare-fun m!1413397 () Bool)

(assert (=> start!130374 m!1413397))

(declare-fun m!1413399 () Bool)

(assert (=> start!130374 m!1413399))

(declare-fun m!1413401 () Bool)

(assert (=> b!1530505 m!1413401))

(assert (=> b!1530501 m!1413389))

(assert (=> b!1530501 m!1413391))

(assert (=> b!1530501 m!1413391))

(declare-fun m!1413403 () Bool)

(assert (=> b!1530501 m!1413403))

(assert (=> b!1530501 m!1413403))

(assert (=> b!1530501 m!1413391))

(declare-fun m!1413405 () Bool)

(assert (=> b!1530501 m!1413405))

(declare-fun m!1413407 () Bool)

(assert (=> b!1530498 m!1413407))

(assert (=> b!1530498 m!1413407))

(declare-fun m!1413409 () Bool)

(assert (=> b!1530498 m!1413409))

(push 1)

(assert (not b!1530501))

(assert (not b!1530503))

(assert (not b!1530504))

(assert (not b!1530500))

(assert (not b!1530508))

(assert (not start!130374))

(assert (not b!1530509))

(assert (not b!1530499))

(assert (not b!1530502))

(assert (not b!1530505))

(assert (not b!1530498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!159843 () Bool)

(assert (=> d!159843 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130374 d!159843))

(declare-fun d!159849 () Bool)

(assert (=> d!159849 (= (array_inv!38085 a!2804) (bvsge (size!49607 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130374 d!159849))

(declare-fun b!1530631 () Bool)

(declare-fun e!852917 () Bool)

(declare-fun lt!662892 () SeekEntryResult!13222)

(assert (=> b!1530631 (= e!852917 (bvsge (x!136966 lt!662892) #b01111111111111111111111111111110))))

(declare-fun b!1530632 () Bool)

(declare-fun e!852913 () SeekEntryResult!13222)

(assert (=> b!1530632 (= e!852913 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101668 (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49607 a!2804)) mask!2512))))

(declare-fun b!1530633 () Bool)

(declare-fun e!852914 () Bool)

(assert (=> b!1530633 (= e!852917 e!852914)))

(declare-fun res!1048090 () Bool)

(assert (=> b!1530633 (= res!1048090 (and (is-Intermediate!13222 lt!662892) (not (undefined!14034 lt!662892)) (bvslt (x!136966 lt!662892) #b01111111111111111111111111111110) (bvsge (x!136966 lt!662892) #b00000000000000000000000000000000) (bvsge (x!136966 lt!662892) #b00000000000000000000000000000000)))))

(assert (=> b!1530633 (=> (not res!1048090) (not e!852914))))

(declare-fun b!1530634 () Bool)

(assert (=> b!1530634 (and (bvsge (index!55285 lt!662892) #b00000000000000000000000000000000) (bvslt (index!55285 lt!662892) (size!49607 (array!101668 (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49607 a!2804)))))))

(declare-fun e!852915 () Bool)

(assert (=> b!1530634 (= e!852915 (= (select (arr!49057 (array!101668 (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49607 a!2804))) (index!55285 lt!662892)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530635 () Bool)

(assert (=> b!1530635 (and (bvsge (index!55285 lt!662892) #b00000000000000000000000000000000) (bvslt (index!55285 lt!662892) (size!49607 (array!101668 (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49607 a!2804)))))))

(declare-fun res!1048089 () Bool)

(assert (=> b!1530635 (= res!1048089 (= (select (arr!49057 (array!101668 (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49607 a!2804))) (index!55285 lt!662892)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530635 (=> res!1048089 e!852915)))

(declare-fun b!1530636 () Bool)

(assert (=> b!1530636 (= e!852913 (Intermediate!13222 false (toIndex!0 (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159851 () Bool)

(assert (=> d!159851 e!852917))

(declare-fun c!140828 () Bool)

(assert (=> d!159851 (= c!140828 (and (is-Intermediate!13222 lt!662892) (undefined!14034 lt!662892)))))

(declare-fun e!852916 () SeekEntryResult!13222)

(assert (=> d!159851 (= lt!662892 e!852916)))

(declare-fun c!140827 () Bool)

(assert (=> d!159851 (= c!140827 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!662893 () (_ BitVec 64))

(assert (=> d!159851 (= lt!662893 (select (arr!49057 (array!101668 (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49607 a!2804))) (toIndex!0 (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159851 (validMask!0 mask!2512)))

(assert (=> d!159851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101668 (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49607 a!2804)) mask!2512) lt!662892)))

(declare-fun b!1530637 () Bool)

(assert (=> b!1530637 (= e!852916 (Intermediate!13222 true (toIndex!0 (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530638 () Bool)

(assert (=> b!1530638 (= e!852916 e!852913)))

(declare-fun c!140829 () Bool)

(assert (=> b!1530638 (= c!140829 (or (= lt!662893 (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!662893 lt!662893) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530639 () Bool)

(assert (=> b!1530639 (and (bvsge (index!55285 lt!662892) #b00000000000000000000000000000000) (bvslt (index!55285 lt!662892) (size!49607 (array!101668 (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49607 a!2804)))))))

(declare-fun res!1048088 () Bool)

(assert (=> b!1530639 (= res!1048088 (= (select (arr!49057 (array!101668 (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49607 a!2804))) (index!55285 lt!662892)) (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1530639 (=> res!1048088 e!852915)))

(assert (=> b!1530639 (= e!852914 e!852915)))

(assert (= (and d!159851 c!140827) b!1530637))

(assert (= (and d!159851 (not c!140827)) b!1530638))

(assert (= (and b!1530638 c!140829) b!1530636))

(assert (= (and b!1530638 (not c!140829)) b!1530632))

(assert (= (and d!159851 c!140828) b!1530631))

(assert (= (and d!159851 (not c!140828)) b!1530633))

(assert (= (and b!1530633 res!1048090) b!1530639))

(assert (= (and b!1530639 (not res!1048088)) b!1530635))

(assert (= (and b!1530635 (not res!1048089)) b!1530634))

(assert (=> d!159851 m!1413403))

(declare-fun m!1413479 () Bool)

(assert (=> d!159851 m!1413479))

(assert (=> d!159851 m!1413397))

(declare-fun m!1413481 () Bool)

(assert (=> b!1530639 m!1413481))

(assert (=> b!1530634 m!1413481))

(assert (=> b!1530632 m!1413403))

(declare-fun m!1413483 () Bool)

(assert (=> b!1530632 m!1413483))

(assert (=> b!1530632 m!1413483))

(assert (=> b!1530632 m!1413391))

(declare-fun m!1413485 () Bool)

(assert (=> b!1530632 m!1413485))

(assert (=> b!1530635 m!1413481))

(assert (=> b!1530501 d!159851))

(declare-fun d!159871 () Bool)

(declare-fun lt!662903 () (_ BitVec 32))

(declare-fun lt!662902 () (_ BitVec 32))

(assert (=> d!159871 (= lt!662903 (bvmul (bvxor lt!662902 (bvlshr lt!662902 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159871 (= lt!662902 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159871 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048091 (let ((h!36977 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136972 (bvmul (bvxor h!36977 (bvlshr h!36977 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136972 (bvlshr x!136972 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048091 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048091 #b00000000000000000000000000000000))))))

(assert (=> d!159871 (= (toIndex!0 (select (store (arr!49057 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!662903 (bvlshr lt!662903 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1530501 d!159871))

(declare-fun b!1530667 () Bool)

(declare-fun e!852937 () Bool)

(declare-fun lt!662906 () SeekEntryResult!13222)

(assert (=> b!1530667 (= e!852937 (bvsge (x!136966 lt!662906) #b01111111111111111111111111111110))))

(declare-fun e!852933 () SeekEntryResult!13222)

(declare-fun b!1530668 () Bool)

(assert (=> b!1530668 (= e!852933 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49057 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!49057 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530669 () Bool)

(declare-fun e!852934 () Bool)

(assert (=> b!1530669 (= e!852937 e!852934)))

(declare-fun res!1048103 () Bool)

(assert (=> b!1530669 (= res!1048103 (and (is-Intermediate!13222 lt!662906) (not (undefined!14034 lt!662906)) (bvslt (x!136966 lt!662906) #b01111111111111111111111111111110) (bvsge (x!136966 lt!662906) #b00000000000000000000000000000000) (bvsge (x!136966 lt!662906) #b00000000000000000000000000000000)))))

(assert (=> b!1530669 (=> (not res!1048103) (not e!852934))))

(declare-fun b!1530670 () Bool)

(assert (=> b!1530670 (and (bvsge (index!55285 lt!662906) #b00000000000000000000000000000000) (bvslt (index!55285 lt!662906) (size!49607 a!2804)))))

(declare-fun e!852935 () Bool)

(assert (=> b!1530670 (= e!852935 (= (select (arr!49057 a!2804) (index!55285 lt!662906)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530671 () Bool)

(assert (=> b!1530671 (and (bvsge (index!55285 lt!662906) #b00000000000000000000000000000000) (bvslt (index!55285 lt!662906) (size!49607 a!2804)))))

(declare-fun res!1048102 () Bool)

(assert (=> b!1530671 (= res!1048102 (= (select (arr!49057 a!2804) (index!55285 lt!662906)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530671 (=> res!1048102 e!852935)))

(declare-fun b!1530672 () Bool)

(assert (=> b!1530672 (= e!852933 (Intermediate!13222 false (toIndex!0 (select (arr!49057 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159877 () Bool)

(assert (=> d!159877 e!852937))

(declare-fun c!140840 () Bool)

(assert (=> d!159877 (= c!140840 (and (is-Intermediate!13222 lt!662906) (undefined!14034 lt!662906)))))

(declare-fun e!852936 () SeekEntryResult!13222)

(assert (=> d!159877 (= lt!662906 e!852936)))

(declare-fun c!140839 () Bool)

(assert (=> d!159877 (= c!140839 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!662907 () (_ BitVec 64))

(assert (=> d!159877 (= lt!662907 (select (arr!49057 a!2804) (toIndex!0 (select (arr!49057 a!2804) j!70) mask!2512)))))

(assert (=> d!159877 (validMask!0 mask!2512)))

(assert (=> d!159877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49057 a!2804) j!70) mask!2512) (select (arr!49057 a!2804) j!70) a!2804 mask!2512) lt!662906)))

(declare-fun b!1530673 () Bool)

(assert (=> b!1530673 (= e!852936 (Intermediate!13222 true (toIndex!0 (select (arr!49057 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530674 () Bool)

(assert (=> b!1530674 (= e!852936 e!852933)))

(declare-fun c!140841 () Bool)

(assert (=> b!1530674 (= c!140841 (or (= lt!662907 (select (arr!49057 a!2804) j!70)) (= (bvadd lt!662907 lt!662907) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530675 () Bool)

(assert (=> b!1530675 (and (bvsge (index!55285 lt!662906) #b00000000000000000000000000000000) (bvslt (index!55285 lt!662906) (size!49607 a!2804)))))

(declare-fun res!1048101 () Bool)

(assert (=> b!1530675 (= res!1048101 (= (select (arr!49057 a!2804) (index!55285 lt!662906)) (select (arr!49057 a!2804) j!70)))))

(assert (=> b!1530675 (=> res!1048101 e!852935)))

(assert (=> b!1530675 (= e!852934 e!852935)))

(assert (= (and d!159877 c!140839) b!1530673))

(assert (= (and d!159877 (not c!140839)) b!1530674))

(assert (= (and b!1530674 c!140841) b!1530672))

(assert (= (and b!1530674 (not c!140841)) b!1530668))

(assert (= (and d!159877 c!140840) b!1530667))

(assert (= (and d!159877 (not c!140840)) b!1530669))

(assert (= (and b!1530669 res!1048103) b!1530675))

(assert (= (and b!1530675 (not res!1048101)) b!1530671))

(assert (= (and b!1530671 (not res!1048102)) b!1530670))

(assert (=> d!159877 m!1413375))

(declare-fun m!1413491 () Bool)

(assert (=> d!159877 m!1413491))

(assert (=> d!159877 m!1413397))

(declare-fun m!1413495 () Bool)

(assert (=> b!1530675 m!1413495))

(assert (=> b!1530670 m!1413495))

(assert (=> b!1530668 m!1413375))

(declare-fun m!1413499 () Bool)

(assert (=> b!1530668 m!1413499))

(assert (=> b!1530668 m!1413499))

(assert (=> b!1530668 m!1413373))

(declare-fun m!1413501 () Bool)

(assert (=> b!1530668 m!1413501))

(assert (=> b!1530671 m!1413495))

(assert (=> b!1530508 d!159877))

(declare-fun d!159881 () Bool)

(declare-fun lt!662909 () (_ BitVec 32))

(declare-fun lt!662908 () (_ BitVec 32))

(assert (=> d!159881 (= lt!662909 (bvmul (bvxor lt!662908 (bvlshr lt!662908 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159881 (= lt!662908 ((_ extract 31 0) (bvand (bvxor (select (arr!49057 a!2804) j!70) (bvlshr (select (arr!49057 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159881 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048091 (let ((h!36977 ((_ extract 31 0) (bvand (bvxor (select (arr!49057 a!2804) j!70) (bvlshr (select (arr!49057 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136972 (bvmul (bvxor h!36977 (bvlshr h!36977 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136972 (bvlshr x!136972 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048091 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048091 #b00000000000000000000000000000000))))))

(assert (=> d!159881 (= (toIndex!0 (select (arr!49057 a!2804) j!70) mask!2512) (bvand (bvxor lt!662909 (bvlshr lt!662909 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1530508 d!159881))

(declare-fun b!1530718 () Bool)

(declare-fun e!852963 () Bool)

(declare-fun call!68528 () Bool)

(assert (=> b!1530718 (= e!852963 call!68528)))

(declare-fun bm!68525 () Bool)

(assert (=> bm!68525 (= call!68528 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159883 () Bool)

(declare-fun res!1048118 () Bool)

(declare-fun e!852964 () Bool)

(assert (=> d!159883 (=> res!1048118 e!852964)))

(assert (=> d!159883 (= res!1048118 (bvsge #b00000000000000000000000000000000 (size!49607 a!2804)))))

(assert (=> d!159883 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!852964)))

(declare-fun b!1530719 () Bool)

(assert (=> b!1530719 (= e!852964 e!852963)))

(declare-fun c!140857 () Bool)

(assert (=> b!1530719 (= c!140857 (validKeyInArray!0 (select (arr!49057 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530720 () Bool)

(declare-fun e!852965 () Bool)

(assert (=> b!1530720 (= e!852963 e!852965)))

(declare-fun lt!662940 () (_ BitVec 64))

(assert (=> b!1530720 (= lt!662940 (select (arr!49057 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!662939 () Unit!51228)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101667 (_ BitVec 64) (_ BitVec 32)) Unit!51228)

(assert (=> b!1530720 (= lt!662939 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662940 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1530720 (arrayContainsKey!0 a!2804 lt!662940 #b00000000000000000000000000000000)))

(declare-fun lt!662941 () Unit!51228)

(assert (=> b!1530720 (= lt!662941 lt!662939)))

(declare-fun res!1048117 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101667 (_ BitVec 32)) SeekEntryResult!13222)

(assert (=> b!1530720 (= res!1048117 (= (seekEntryOrOpen!0 (select (arr!49057 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13222 #b00000000000000000000000000000000)))))

(assert (=> b!1530720 (=> (not res!1048117) (not e!852965))))

(declare-fun b!1530721 () Bool)

(assert (=> b!1530721 (= e!852965 call!68528)))

(assert (= (and d!159883 (not res!1048118)) b!1530719))

(assert (= (and b!1530719 c!140857) b!1530720))

(assert (= (and b!1530719 (not c!140857)) b!1530718))

(assert (= (and b!1530720 res!1048117) b!1530721))

(assert (= (or b!1530721 b!1530718) bm!68525))

(declare-fun m!1413525 () Bool)

(assert (=> bm!68525 m!1413525))

(declare-fun m!1413527 () Bool)

(assert (=> b!1530719 m!1413527))

(assert (=> b!1530719 m!1413527))

(declare-fun m!1413529 () Bool)

(assert (=> b!1530719 m!1413529))

(assert (=> b!1530720 m!1413527))

(declare-fun m!1413531 () Bool)

(assert (=> b!1530720 m!1413531))

(declare-fun m!1413533 () Bool)

(assert (=> b!1530720 m!1413533))

(assert (=> b!1530720 m!1413527))

(declare-fun m!1413535 () Bool)

(assert (=> b!1530720 m!1413535))

(assert (=> b!1530503 d!159883))

(declare-fun b!1530728 () Bool)

(declare-fun e!852969 () Bool)

(declare-fun call!68529 () Bool)

(assert (=> b!1530728 (= e!852969 call!68529)))

(declare-fun bm!68526 () Bool)

(assert (=> bm!68526 (= call!68529 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159897 () Bool)

(declare-fun res!1048120 () Bool)

(declare-fun e!852970 () Bool)

(assert (=> d!159897 (=> res!1048120 e!852970)))

(assert (=> d!159897 (= res!1048120 (bvsge j!70 (size!49607 a!2804)))))

(assert (=> d!159897 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!852970)))

(declare-fun b!1530729 () Bool)

(assert (=> b!1530729 (= e!852970 e!852969)))

(declare-fun c!140861 () Bool)

(assert (=> b!1530729 (= c!140861 (validKeyInArray!0 (select (arr!49057 a!2804) j!70)))))

(declare-fun b!1530730 () Bool)

(declare-fun e!852971 () Bool)

(assert (=> b!1530730 (= e!852969 e!852971)))

(declare-fun lt!662947 () (_ BitVec 64))

(assert (=> b!1530730 (= lt!662947 (select (arr!49057 a!2804) j!70))))

(declare-fun lt!662946 () Unit!51228)

(assert (=> b!1530730 (= lt!662946 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662947 j!70))))

(assert (=> b!1530730 (arrayContainsKey!0 a!2804 lt!662947 #b00000000000000000000000000000000)))

(declare-fun lt!662948 () Unit!51228)

(assert (=> b!1530730 (= lt!662948 lt!662946)))

(declare-fun res!1048119 () Bool)

(assert (=> b!1530730 (= res!1048119 (= (seekEntryOrOpen!0 (select (arr!49057 a!2804) j!70) a!2804 mask!2512) (Found!13222 j!70)))))

(assert (=> b!1530730 (=> (not res!1048119) (not e!852971))))

(declare-fun b!1530731 () Bool)

(assert (=> b!1530731 (= e!852971 call!68529)))

(assert (= (and d!159897 (not res!1048120)) b!1530729))

(assert (= (and b!1530729 c!140861) b!1530730))

(assert (= (and b!1530729 (not c!140861)) b!1530728))

(assert (= (and b!1530730 res!1048119) b!1530731))

(assert (= (or b!1530731 b!1530728) bm!68526))

(declare-fun m!1413539 () Bool)

(assert (=> bm!68526 m!1413539))

(assert (=> b!1530729 m!1413373))

(assert (=> b!1530729 m!1413373))

(assert (=> b!1530729 m!1413379))

(assert (=> b!1530730 m!1413373))

(declare-fun m!1413543 () Bool)

(assert (=> b!1530730 m!1413543))

(declare-fun m!1413545 () Bool)

(assert (=> b!1530730 m!1413545))

(assert (=> b!1530730 m!1413373))

(declare-fun m!1413549 () Bool)

(assert (=> b!1530730 m!1413549))

(assert (=> b!1530502 d!159897))

(declare-fun d!159901 () Bool)

(assert (=> d!159901 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!662954 () Unit!51228)

(declare-fun choose!38 (array!101667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51228)

(assert (=> d!159901 (= lt!662954 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159901 (validMask!0 mask!2512)))

(assert (=> d!159901 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!662954)))

(declare-fun bs!43889 () Bool)

(assert (= bs!43889 d!159901))

(assert (=> bs!43889 m!1413393))

(declare-fun m!1413553 () Bool)

(assert (=> bs!43889 m!1413553))

(assert (=> bs!43889 m!1413397))

(assert (=> b!1530502 d!159901))

(declare-fun b!1530732 () Bool)

(declare-fun e!852976 () Bool)

(declare-fun lt!662955 () SeekEntryResult!13222)

(assert (=> b!1530732 (= e!852976 (bvsge (x!136966 lt!662955) #b01111111111111111111111111111110))))

(declare-fun e!852972 () SeekEntryResult!13222)

(declare-fun b!1530733 () Bool)

(assert (=> b!1530733 (= e!852972 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!49057 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530734 () Bool)

(declare-fun e!852973 () Bool)

(assert (=> b!1530734 (= e!852976 e!852973)))

(declare-fun res!1048123 () Bool)

(assert (=> b!1530734 (= res!1048123 (and (is-Intermediate!13222 lt!662955) (not (undefined!14034 lt!662955)) (bvslt (x!136966 lt!662955) #b01111111111111111111111111111110) (bvsge (x!136966 lt!662955) #b00000000000000000000000000000000) (bvsge (x!136966 lt!662955) x!534)))))

(assert (=> b!1530734 (=> (not res!1048123) (not e!852973))))

(declare-fun b!1530735 () Bool)

(assert (=> b!1530735 (and (bvsge (index!55285 lt!662955) #b00000000000000000000000000000000) (bvslt (index!55285 lt!662955) (size!49607 a!2804)))))

(declare-fun e!852974 () Bool)

(assert (=> b!1530735 (= e!852974 (= (select (arr!49057 a!2804) (index!55285 lt!662955)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530736 () Bool)

(assert (=> b!1530736 (and (bvsge (index!55285 lt!662955) #b00000000000000000000000000000000) (bvslt (index!55285 lt!662955) (size!49607 a!2804)))))

(declare-fun res!1048122 () Bool)

(assert (=> b!1530736 (= res!1048122 (= (select (arr!49057 a!2804) (index!55285 lt!662955)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530736 (=> res!1048122 e!852974)))

(declare-fun b!1530737 () Bool)

(assert (=> b!1530737 (= e!852972 (Intermediate!13222 false index!487 x!534))))

(declare-fun d!159905 () Bool)

(assert (=> d!159905 e!852976))

(declare-fun c!140863 () Bool)

(assert (=> d!159905 (= c!140863 (and (is-Intermediate!13222 lt!662955) (undefined!14034 lt!662955)))))

(declare-fun e!852975 () SeekEntryResult!13222)

(assert (=> d!159905 (= lt!662955 e!852975)))

(declare-fun c!140862 () Bool)

(assert (=> d!159905 (= c!140862 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!662956 () (_ BitVec 64))

(assert (=> d!159905 (= lt!662956 (select (arr!49057 a!2804) index!487))))

(assert (=> d!159905 (validMask!0 mask!2512)))

(assert (=> d!159905 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49057 a!2804) j!70) a!2804 mask!2512) lt!662955)))

(declare-fun b!1530738 () Bool)

(assert (=> b!1530738 (= e!852975 (Intermediate!13222 true index!487 x!534))))

(declare-fun b!1530739 () Bool)

(assert (=> b!1530739 (= e!852975 e!852972)))

(declare-fun c!140864 () Bool)

(assert (=> b!1530739 (= c!140864 (or (= lt!662956 (select (arr!49057 a!2804) j!70)) (= (bvadd lt!662956 lt!662956) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530740 () Bool)

(assert (=> b!1530740 (and (bvsge (index!55285 lt!662955) #b00000000000000000000000000000000) (bvslt (index!55285 lt!662955) (size!49607 a!2804)))))

(declare-fun res!1048121 () Bool)

(assert (=> b!1530740 (= res!1048121 (= (select (arr!49057 a!2804) (index!55285 lt!662955)) (select (arr!49057 a!2804) j!70)))))

(assert (=> b!1530740 (=> res!1048121 e!852974)))

(assert (=> b!1530740 (= e!852973 e!852974)))

(assert (= (and d!159905 c!140862) b!1530738))

(assert (= (and d!159905 (not c!140862)) b!1530739))

(assert (= (and b!1530739 c!140864) b!1530737))

(assert (= (and b!1530739 (not c!140864)) b!1530733))

(assert (= (and d!159905 c!140863) b!1530732))

(assert (= (and d!159905 (not c!140863)) b!1530734))

(assert (= (and b!1530734 res!1048123) b!1530740))

(assert (= (and b!1530740 (not res!1048121)) b!1530736))

(assert (= (and b!1530736 (not res!1048122)) b!1530735))

(declare-fun m!1413555 () Bool)

(assert (=> d!159905 m!1413555))

(assert (=> d!159905 m!1413397))

(declare-fun m!1413557 () Bool)

(assert (=> b!1530740 m!1413557))

(assert (=> b!1530735 m!1413557))

(assert (=> b!1530733 m!1413401))

(assert (=> b!1530733 m!1413401))

(assert (=> b!1530733 m!1413373))

(declare-fun m!1413559 () Bool)

(assert (=> b!1530733 m!1413559))

(assert (=> b!1530736 m!1413557))

(assert (=> b!1530504 d!159905))

(declare-fun b!1530765 () Bool)

(declare-fun e!852990 () SeekEntryResult!13222)

(declare-fun lt!662975 () SeekEntryResult!13222)

(assert (=> b!1530765 (= e!852990 (MissingZero!13222 (index!55285 lt!662975)))))

(declare-fun d!159907 () Bool)

(declare-fun lt!662973 () SeekEntryResult!13222)

(assert (=> d!159907 (and (or (is-MissingVacant!13222 lt!662973) (not (is-Found!13222 lt!662973)) (and (bvsge (index!55284 lt!662973) #b00000000000000000000000000000000) (bvslt (index!55284 lt!662973) (size!49607 a!2804)))) (not (is-MissingVacant!13222 lt!662973)) (or (not (is-Found!13222 lt!662973)) (= (select (arr!49057 a!2804) (index!55284 lt!662973)) (select (arr!49057 a!2804) j!70))))))

(declare-fun e!852989 () SeekEntryResult!13222)

(assert (=> d!159907 (= lt!662973 e!852989)))

(declare-fun c!140879 () Bool)

(assert (=> d!159907 (= c!140879 (and (is-Intermediate!13222 lt!662975) (undefined!14034 lt!662975)))))

(assert (=> d!159907 (= lt!662975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49057 a!2804) j!70) mask!2512) (select (arr!49057 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159907 (validMask!0 mask!2512)))

(assert (=> d!159907 (= (seekEntry!0 (select (arr!49057 a!2804) j!70) a!2804 mask!2512) lt!662973)))

(declare-fun b!1530766 () Bool)

(declare-fun c!140877 () Bool)

(declare-fun lt!662976 () (_ BitVec 64))

(assert (=> b!1530766 (= c!140877 (= lt!662976 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!852991 () SeekEntryResult!13222)

(assert (=> b!1530766 (= e!852991 e!852990)))

(declare-fun b!1530767 () Bool)

(assert (=> b!1530767 (= e!852991 (Found!13222 (index!55285 lt!662975)))))

(declare-fun b!1530768 () Bool)

(assert (=> b!1530768 (= e!852989 Undefined!13222)))

(declare-fun b!1530769 () Bool)

(assert (=> b!1530769 (= e!852989 e!852991)))

(assert (=> b!1530769 (= lt!662976 (select (arr!49057 a!2804) (index!55285 lt!662975)))))

(declare-fun c!140878 () Bool)

(assert (=> b!1530769 (= c!140878 (= lt!662976 (select (arr!49057 a!2804) j!70)))))

(declare-fun b!1530770 () Bool)

(declare-fun lt!662974 () SeekEntryResult!13222)

(assert (=> b!1530770 (= e!852990 (ite (is-MissingVacant!13222 lt!662974) (MissingZero!13222 (index!55286 lt!662974)) lt!662974))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101667 (_ BitVec 32)) SeekEntryResult!13222)

(assert (=> b!1530770 (= lt!662974 (seekKeyOrZeroReturnVacant!0 (x!136966 lt!662975) (index!55285 lt!662975) (index!55285 lt!662975) (select (arr!49057 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159907 c!140879) b!1530768))

(assert (= (and d!159907 (not c!140879)) b!1530769))

(assert (= (and b!1530769 c!140878) b!1530767))

(assert (= (and b!1530769 (not c!140878)) b!1530766))

(assert (= (and b!1530766 c!140877) b!1530765))

(assert (= (and b!1530766 (not c!140877)) b!1530770))

(declare-fun m!1413565 () Bool)

(assert (=> d!159907 m!1413565))

(assert (=> d!159907 m!1413373))

(assert (=> d!159907 m!1413375))

(assert (=> d!159907 m!1413375))

(assert (=> d!159907 m!1413373))

(assert (=> d!159907 m!1413377))

(assert (=> d!159907 m!1413397))

(declare-fun m!1413569 () Bool)

(assert (=> b!1530769 m!1413569))

(assert (=> b!1530770 m!1413373))

(declare-fun m!1413571 () Bool)

(assert (=> b!1530770 m!1413571))

(assert (=> b!1530499 d!159907))

(declare-fun d!159913 () Bool)

(assert (=> d!159913 (= (validKeyInArray!0 (select (arr!49057 a!2804) i!961)) (and (not (= (select (arr!49057 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49057 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530498 d!159913))

(declare-fun b!1530787 () Bool)

(declare-fun e!853006 () Bool)

(declare-fun e!853004 () Bool)

(assert (=> b!1530787 (= e!853006 e!853004)))

(declare-fun c!140885 () Bool)

(assert (=> b!1530787 (= c!140885 (validKeyInArray!0 (select (arr!49057 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159915 () Bool)

(declare-fun res!1048131 () Bool)

(declare-fun e!853003 () Bool)

(assert (=> d!159915 (=> res!1048131 e!853003)))

(assert (=> d!159915 (= res!1048131 (bvsge #b00000000000000000000000000000000 (size!49607 a!2804)))))

(assert (=> d!159915 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35537) e!853003)))

(declare-fun bm!68529 () Bool)

(declare-fun call!68532 () Bool)

(assert (=> bm!68529 (= call!68532 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140885 (Cons!35536 (select (arr!49057 a!2804) #b00000000000000000000000000000000) Nil!35537) Nil!35537)))))

(declare-fun b!1530788 () Bool)

(declare-fun e!853005 () Bool)

(declare-fun contains!10001 (List!35540 (_ BitVec 64)) Bool)

(assert (=> b!1530788 (= e!853005 (contains!10001 Nil!35537 (select (arr!49057 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530789 () Bool)

(assert (=> b!1530789 (= e!853003 e!853006)))

(declare-fun res!1048132 () Bool)

(assert (=> b!1530789 (=> (not res!1048132) (not e!853006))))

(assert (=> b!1530789 (= res!1048132 (not e!853005))))

(declare-fun res!1048130 () Bool)

(assert (=> b!1530789 (=> (not res!1048130) (not e!853005))))

(assert (=> b!1530789 (= res!1048130 (validKeyInArray!0 (select (arr!49057 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530790 () Bool)

(assert (=> b!1530790 (= e!853004 call!68532)))

(declare-fun b!1530791 () Bool)

(assert (=> b!1530791 (= e!853004 call!68532)))

(assert (= (and d!159915 (not res!1048131)) b!1530789))

(assert (= (and b!1530789 res!1048130) b!1530788))

(assert (= (and b!1530789 res!1048132) b!1530787))

(assert (= (and b!1530787 c!140885) b!1530790))

(assert (= (and b!1530787 (not c!140885)) b!1530791))

(assert (= (or b!1530790 b!1530791) bm!68529))

(assert (=> b!1530787 m!1413527))

(assert (=> b!1530787 m!1413527))

(assert (=> b!1530787 m!1413529))

(assert (=> bm!68529 m!1413527))

(declare-fun m!1413573 () Bool)

(assert (=> bm!68529 m!1413573))

(assert (=> b!1530788 m!1413527))

(assert (=> b!1530788 m!1413527))

(declare-fun m!1413575 () Bool)

(assert (=> b!1530788 m!1413575))

(assert (=> b!1530789 m!1413527))

(assert (=> b!1530789 m!1413527))

(assert (=> b!1530789 m!1413529))

(assert (=> b!1530509 d!159915))

(declare-fun d!159917 () Bool)

(assert (=> d!159917 (= (validKeyInArray!0 (select (arr!49057 a!2804) j!70)) (and (not (= (select (arr!49057 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49057 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530500 d!159917))

(declare-fun d!159919 () Bool)

(declare-fun lt!662983 () (_ BitVec 32))

(assert (=> d!159919 (and (bvsge lt!662983 #b00000000000000000000000000000000) (bvslt lt!662983 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159919 (= lt!662983 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!159919 (validMask!0 mask!2512)))

(assert (=> d!159919 (= (nextIndex!0 index!487 x!534 mask!2512) lt!662983)))

(declare-fun bs!43890 () Bool)

(assert (= bs!43890 d!159919))

(declare-fun m!1413577 () Bool)

(assert (=> bs!43890 m!1413577))

(assert (=> bs!43890 m!1413397))

(assert (=> b!1530505 d!159919))

(push 1)

