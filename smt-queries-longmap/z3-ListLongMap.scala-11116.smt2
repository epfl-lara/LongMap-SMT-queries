; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129802 () Bool)

(assert start!129802)

(declare-fun b!1523715 () Bool)

(declare-fun res!1042630 () Bool)

(declare-fun e!849448 () Bool)

(assert (=> b!1523715 (=> (not res!1042630) (not e!849448))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101398 0))(
  ( (array!101399 (arr!48930 (Array (_ BitVec 32) (_ BitVec 64))) (size!49480 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101398)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13095 0))(
  ( (MissingZero!13095 (index!54775 (_ BitVec 32))) (Found!13095 (index!54776 (_ BitVec 32))) (Intermediate!13095 (undefined!13907 Bool) (index!54777 (_ BitVec 32)) (x!136461 (_ BitVec 32))) (Undefined!13095) (MissingVacant!13095 (index!54778 (_ BitVec 32))) )
))
(declare-fun lt!660038 () SeekEntryResult!13095)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101398 (_ BitVec 32)) SeekEntryResult!13095)

(assert (=> b!1523715 (= res!1042630 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48930 a!2804) j!70) a!2804 mask!2512) lt!660038))))

(declare-fun b!1523716 () Bool)

(declare-fun res!1042623 () Bool)

(declare-fun e!849449 () Bool)

(assert (=> b!1523716 (=> (not res!1042623) (not e!849449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101398 (_ BitVec 32)) Bool)

(assert (=> b!1523716 (= res!1042623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523717 () Bool)

(declare-fun e!849450 () Bool)

(declare-fun lt!660039 () (_ BitVec 64))

(declare-fun lt!660040 () array!101398)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101398 (_ BitVec 32)) SeekEntryResult!13095)

(assert (=> b!1523717 (= e!849450 (= (seekEntryOrOpen!0 (select (arr!48930 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!660039 lt!660040 mask!2512)))))

(declare-fun e!849447 () Bool)

(declare-fun b!1523718 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101398 (_ BitVec 32)) SeekEntryResult!13095)

(assert (=> b!1523718 (= e!849447 (= (seekEntry!0 (select (arr!48930 a!2804) j!70) a!2804 mask!2512) (Found!13095 j!70)))))

(declare-fun b!1523719 () Bool)

(declare-fun res!1042629 () Bool)

(assert (=> b!1523719 (=> (not res!1042629) (not e!849449))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523719 (= res!1042629 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49480 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49480 a!2804))))))

(declare-fun b!1523720 () Bool)

(declare-fun res!1042624 () Bool)

(assert (=> b!1523720 (=> (not res!1042624) (not e!849449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523720 (= res!1042624 (validKeyInArray!0 (select (arr!48930 a!2804) j!70)))))

(declare-fun b!1523721 () Bool)

(declare-fun res!1042625 () Bool)

(assert (=> b!1523721 (=> (not res!1042625) (not e!849449))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523721 (= res!1042625 (validKeyInArray!0 (select (arr!48930 a!2804) i!961)))))

(declare-fun b!1523722 () Bool)

(assert (=> b!1523722 (= e!849449 e!849448)))

(declare-fun res!1042633 () Bool)

(assert (=> b!1523722 (=> (not res!1042633) (not e!849448))))

(declare-fun lt!660037 () SeekEntryResult!13095)

(assert (=> b!1523722 (= res!1042633 (= lt!660037 lt!660038))))

(assert (=> b!1523722 (= lt!660038 (Intermediate!13095 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523722 (= lt!660037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48930 a!2804) j!70) mask!2512) (select (arr!48930 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523723 () Bool)

(declare-fun e!849446 () Bool)

(assert (=> b!1523723 (= e!849448 e!849446)))

(declare-fun res!1042628 () Bool)

(assert (=> b!1523723 (=> (not res!1042628) (not e!849446))))

(assert (=> b!1523723 (= res!1042628 (= lt!660037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660039 mask!2512) lt!660039 lt!660040 mask!2512)))))

(assert (=> b!1523723 (= lt!660039 (select (store (arr!48930 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1523723 (= lt!660040 (array!101399 (store (arr!48930 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49480 a!2804)))))

(declare-fun b!1523724 () Bool)

(assert (=> b!1523724 (= e!849446 (not e!849450))))

(declare-fun res!1042631 () Bool)

(assert (=> b!1523724 (=> res!1042631 e!849450)))

(assert (=> b!1523724 (= res!1042631 (or (not (= (select (arr!48930 a!2804) j!70) lt!660039)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48930 a!2804) index!487) (select (arr!48930 a!2804) j!70))) (not (= j!70 index!487))))))

(assert (=> b!1523724 e!849447))

(declare-fun res!1042627 () Bool)

(assert (=> b!1523724 (=> (not res!1042627) (not e!849447))))

(assert (=> b!1523724 (= res!1042627 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50974 0))(
  ( (Unit!50975) )
))
(declare-fun lt!660036 () Unit!50974)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50974)

(assert (=> b!1523724 (= lt!660036 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1042632 () Bool)

(assert (=> start!129802 (=> (not res!1042632) (not e!849449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129802 (= res!1042632 (validMask!0 mask!2512))))

(assert (=> start!129802 e!849449))

(assert (=> start!129802 true))

(declare-fun array_inv!37958 (array!101398) Bool)

(assert (=> start!129802 (array_inv!37958 a!2804)))

(declare-fun b!1523725 () Bool)

(declare-fun res!1042626 () Bool)

(assert (=> b!1523725 (=> (not res!1042626) (not e!849449))))

(declare-datatypes ((List!35413 0))(
  ( (Nil!35410) (Cons!35409 (h!36833 (_ BitVec 64)) (t!50107 List!35413)) )
))
(declare-fun arrayNoDuplicates!0 (array!101398 (_ BitVec 32) List!35413) Bool)

(assert (=> b!1523725 (= res!1042626 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35410))))

(declare-fun b!1523726 () Bool)

(declare-fun res!1042622 () Bool)

(assert (=> b!1523726 (=> (not res!1042622) (not e!849449))))

(assert (=> b!1523726 (= res!1042622 (and (= (size!49480 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49480 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49480 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129802 res!1042632) b!1523726))

(assert (= (and b!1523726 res!1042622) b!1523721))

(assert (= (and b!1523721 res!1042625) b!1523720))

(assert (= (and b!1523720 res!1042624) b!1523716))

(assert (= (and b!1523716 res!1042623) b!1523725))

(assert (= (and b!1523725 res!1042626) b!1523719))

(assert (= (and b!1523719 res!1042629) b!1523722))

(assert (= (and b!1523722 res!1042633) b!1523715))

(assert (= (and b!1523715 res!1042630) b!1523723))

(assert (= (and b!1523723 res!1042628) b!1523724))

(assert (= (and b!1523724 res!1042627) b!1523718))

(assert (= (and b!1523724 (not res!1042631)) b!1523717))

(declare-fun m!1406859 () Bool)

(assert (=> b!1523717 m!1406859))

(assert (=> b!1523717 m!1406859))

(declare-fun m!1406861 () Bool)

(assert (=> b!1523717 m!1406861))

(declare-fun m!1406863 () Bool)

(assert (=> b!1523717 m!1406863))

(assert (=> b!1523722 m!1406859))

(assert (=> b!1523722 m!1406859))

(declare-fun m!1406865 () Bool)

(assert (=> b!1523722 m!1406865))

(assert (=> b!1523722 m!1406865))

(assert (=> b!1523722 m!1406859))

(declare-fun m!1406867 () Bool)

(assert (=> b!1523722 m!1406867))

(declare-fun m!1406869 () Bool)

(assert (=> b!1523725 m!1406869))

(assert (=> b!1523718 m!1406859))

(assert (=> b!1523718 m!1406859))

(declare-fun m!1406871 () Bool)

(assert (=> b!1523718 m!1406871))

(assert (=> b!1523715 m!1406859))

(assert (=> b!1523715 m!1406859))

(declare-fun m!1406873 () Bool)

(assert (=> b!1523715 m!1406873))

(assert (=> b!1523720 m!1406859))

(assert (=> b!1523720 m!1406859))

(declare-fun m!1406875 () Bool)

(assert (=> b!1523720 m!1406875))

(declare-fun m!1406877 () Bool)

(assert (=> start!129802 m!1406877))

(declare-fun m!1406879 () Bool)

(assert (=> start!129802 m!1406879))

(declare-fun m!1406881 () Bool)

(assert (=> b!1523716 m!1406881))

(declare-fun m!1406883 () Bool)

(assert (=> b!1523723 m!1406883))

(assert (=> b!1523723 m!1406883))

(declare-fun m!1406885 () Bool)

(assert (=> b!1523723 m!1406885))

(declare-fun m!1406887 () Bool)

(assert (=> b!1523723 m!1406887))

(declare-fun m!1406889 () Bool)

(assert (=> b!1523723 m!1406889))

(declare-fun m!1406891 () Bool)

(assert (=> b!1523721 m!1406891))

(assert (=> b!1523721 m!1406891))

(declare-fun m!1406893 () Bool)

(assert (=> b!1523721 m!1406893))

(assert (=> b!1523724 m!1406859))

(declare-fun m!1406895 () Bool)

(assert (=> b!1523724 m!1406895))

(declare-fun m!1406897 () Bool)

(assert (=> b!1523724 m!1406897))

(declare-fun m!1406899 () Bool)

(assert (=> b!1523724 m!1406899))

(check-sat (not b!1523715) (not b!1523723) (not b!1523717) (not b!1523724) (not b!1523718) (not b!1523722) (not b!1523720) (not b!1523725) (not b!1523721) (not b!1523716) (not start!129802))
(check-sat)
(get-model)

(declare-fun b!1523775 () Bool)

(declare-fun e!849477 () SeekEntryResult!13095)

(declare-fun lt!660065 () SeekEntryResult!13095)

(assert (=> b!1523775 (= e!849477 (Found!13095 (index!54777 lt!660065)))))

(declare-fun b!1523776 () Bool)

(declare-fun e!849478 () SeekEntryResult!13095)

(assert (=> b!1523776 (= e!849478 e!849477)))

(declare-fun lt!660067 () (_ BitVec 64))

(assert (=> b!1523776 (= lt!660067 (select (arr!48930 a!2804) (index!54777 lt!660065)))))

(declare-fun c!140102 () Bool)

(assert (=> b!1523776 (= c!140102 (= lt!660067 (select (arr!48930 a!2804) j!70)))))

(declare-fun d!159249 () Bool)

(declare-fun lt!660064 () SeekEntryResult!13095)

(get-info :version)

(assert (=> d!159249 (and (or ((_ is MissingVacant!13095) lt!660064) (not ((_ is Found!13095) lt!660064)) (and (bvsge (index!54776 lt!660064) #b00000000000000000000000000000000) (bvslt (index!54776 lt!660064) (size!49480 a!2804)))) (not ((_ is MissingVacant!13095) lt!660064)) (or (not ((_ is Found!13095) lt!660064)) (= (select (arr!48930 a!2804) (index!54776 lt!660064)) (select (arr!48930 a!2804) j!70))))))

(assert (=> d!159249 (= lt!660064 e!849478)))

(declare-fun c!140101 () Bool)

(assert (=> d!159249 (= c!140101 (and ((_ is Intermediate!13095) lt!660065) (undefined!13907 lt!660065)))))

(assert (=> d!159249 (= lt!660065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48930 a!2804) j!70) mask!2512) (select (arr!48930 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159249 (validMask!0 mask!2512)))

(assert (=> d!159249 (= (seekEntry!0 (select (arr!48930 a!2804) j!70) a!2804 mask!2512) lt!660064)))

(declare-fun b!1523777 () Bool)

(declare-fun c!140100 () Bool)

(assert (=> b!1523777 (= c!140100 (= lt!660067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849476 () SeekEntryResult!13095)

(assert (=> b!1523777 (= e!849477 e!849476)))

(declare-fun b!1523778 () Bool)

(assert (=> b!1523778 (= e!849478 Undefined!13095)))

(declare-fun b!1523779 () Bool)

(declare-fun lt!660066 () SeekEntryResult!13095)

(assert (=> b!1523779 (= e!849476 (ite ((_ is MissingVacant!13095) lt!660066) (MissingZero!13095 (index!54778 lt!660066)) lt!660066))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101398 (_ BitVec 32)) SeekEntryResult!13095)

(assert (=> b!1523779 (= lt!660066 (seekKeyOrZeroReturnVacant!0 (x!136461 lt!660065) (index!54777 lt!660065) (index!54777 lt!660065) (select (arr!48930 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523780 () Bool)

(assert (=> b!1523780 (= e!849476 (MissingZero!13095 (index!54777 lt!660065)))))

(assert (= (and d!159249 c!140101) b!1523778))

(assert (= (and d!159249 (not c!140101)) b!1523776))

(assert (= (and b!1523776 c!140102) b!1523775))

(assert (= (and b!1523776 (not c!140102)) b!1523777))

(assert (= (and b!1523777 c!140100) b!1523780))

(assert (= (and b!1523777 (not c!140100)) b!1523779))

(declare-fun m!1406943 () Bool)

(assert (=> b!1523776 m!1406943))

(declare-fun m!1406945 () Bool)

(assert (=> d!159249 m!1406945))

(assert (=> d!159249 m!1406859))

(assert (=> d!159249 m!1406865))

(assert (=> d!159249 m!1406865))

(assert (=> d!159249 m!1406859))

(assert (=> d!159249 m!1406867))

(assert (=> d!159249 m!1406877))

(assert (=> b!1523779 m!1406859))

(declare-fun m!1406947 () Bool)

(assert (=> b!1523779 m!1406947))

(assert (=> b!1523718 d!159249))

(declare-fun d!159253 () Bool)

(assert (=> d!159253 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129802 d!159253))

(declare-fun d!159257 () Bool)

(assert (=> d!159257 (= (array_inv!37958 a!2804) (bvsge (size!49480 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129802 d!159257))

(declare-fun b!1523835 () Bool)

(declare-fun e!849512 () SeekEntryResult!13095)

(declare-fun lt!660082 () SeekEntryResult!13095)

(assert (=> b!1523835 (= e!849512 (MissingZero!13095 (index!54777 lt!660082)))))

(declare-fun b!1523836 () Bool)

(declare-fun c!140122 () Bool)

(declare-fun lt!660081 () (_ BitVec 64))

(assert (=> b!1523836 (= c!140122 (= lt!660081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849513 () SeekEntryResult!13095)

(assert (=> b!1523836 (= e!849513 e!849512)))

(declare-fun b!1523837 () Bool)

(assert (=> b!1523837 (= e!849513 (Found!13095 (index!54777 lt!660082)))))

(declare-fun d!159259 () Bool)

(declare-fun lt!660080 () SeekEntryResult!13095)

(assert (=> d!159259 (and (or ((_ is Undefined!13095) lt!660080) (not ((_ is Found!13095) lt!660080)) (and (bvsge (index!54776 lt!660080) #b00000000000000000000000000000000) (bvslt (index!54776 lt!660080) (size!49480 a!2804)))) (or ((_ is Undefined!13095) lt!660080) ((_ is Found!13095) lt!660080) (not ((_ is MissingZero!13095) lt!660080)) (and (bvsge (index!54775 lt!660080) #b00000000000000000000000000000000) (bvslt (index!54775 lt!660080) (size!49480 a!2804)))) (or ((_ is Undefined!13095) lt!660080) ((_ is Found!13095) lt!660080) ((_ is MissingZero!13095) lt!660080) (not ((_ is MissingVacant!13095) lt!660080)) (and (bvsge (index!54778 lt!660080) #b00000000000000000000000000000000) (bvslt (index!54778 lt!660080) (size!49480 a!2804)))) (or ((_ is Undefined!13095) lt!660080) (ite ((_ is Found!13095) lt!660080) (= (select (arr!48930 a!2804) (index!54776 lt!660080)) (select (arr!48930 a!2804) j!70)) (ite ((_ is MissingZero!13095) lt!660080) (= (select (arr!48930 a!2804) (index!54775 lt!660080)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13095) lt!660080) (= (select (arr!48930 a!2804) (index!54778 lt!660080)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!849514 () SeekEntryResult!13095)

(assert (=> d!159259 (= lt!660080 e!849514)))

(declare-fun c!140121 () Bool)

(assert (=> d!159259 (= c!140121 (and ((_ is Intermediate!13095) lt!660082) (undefined!13907 lt!660082)))))

(assert (=> d!159259 (= lt!660082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48930 a!2804) j!70) mask!2512) (select (arr!48930 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159259 (validMask!0 mask!2512)))

(assert (=> d!159259 (= (seekEntryOrOpen!0 (select (arr!48930 a!2804) j!70) a!2804 mask!2512) lt!660080)))

(declare-fun b!1523838 () Bool)

(assert (=> b!1523838 (= e!849512 (seekKeyOrZeroReturnVacant!0 (x!136461 lt!660082) (index!54777 lt!660082) (index!54777 lt!660082) (select (arr!48930 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523839 () Bool)

(assert (=> b!1523839 (= e!849514 e!849513)))

(assert (=> b!1523839 (= lt!660081 (select (arr!48930 a!2804) (index!54777 lt!660082)))))

(declare-fun c!140123 () Bool)

(assert (=> b!1523839 (= c!140123 (= lt!660081 (select (arr!48930 a!2804) j!70)))))

(declare-fun b!1523840 () Bool)

(assert (=> b!1523840 (= e!849514 Undefined!13095)))

(assert (= (and d!159259 c!140121) b!1523840))

(assert (= (and d!159259 (not c!140121)) b!1523839))

(assert (= (and b!1523839 c!140123) b!1523837))

(assert (= (and b!1523839 (not c!140123)) b!1523836))

(assert (= (and b!1523836 c!140122) b!1523835))

(assert (= (and b!1523836 (not c!140122)) b!1523838))

(assert (=> d!159259 m!1406859))

(assert (=> d!159259 m!1406865))

(assert (=> d!159259 m!1406877))

(assert (=> d!159259 m!1406865))

(assert (=> d!159259 m!1406859))

(assert (=> d!159259 m!1406867))

(declare-fun m!1406963 () Bool)

(assert (=> d!159259 m!1406963))

(declare-fun m!1406965 () Bool)

(assert (=> d!159259 m!1406965))

(declare-fun m!1406967 () Bool)

(assert (=> d!159259 m!1406967))

(assert (=> b!1523838 m!1406859))

(declare-fun m!1406969 () Bool)

(assert (=> b!1523838 m!1406969))

(declare-fun m!1406971 () Bool)

(assert (=> b!1523839 m!1406971))

(assert (=> b!1523717 d!159259))

(declare-fun b!1523853 () Bool)

(declare-fun e!849521 () SeekEntryResult!13095)

(declare-fun lt!660093 () SeekEntryResult!13095)

(assert (=> b!1523853 (= e!849521 (MissingZero!13095 (index!54777 lt!660093)))))

(declare-fun b!1523854 () Bool)

(declare-fun c!140131 () Bool)

(declare-fun lt!660092 () (_ BitVec 64))

(assert (=> b!1523854 (= c!140131 (= lt!660092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849522 () SeekEntryResult!13095)

(assert (=> b!1523854 (= e!849522 e!849521)))

(declare-fun b!1523855 () Bool)

(assert (=> b!1523855 (= e!849522 (Found!13095 (index!54777 lt!660093)))))

(declare-fun d!159265 () Bool)

(declare-fun lt!660091 () SeekEntryResult!13095)

(assert (=> d!159265 (and (or ((_ is Undefined!13095) lt!660091) (not ((_ is Found!13095) lt!660091)) (and (bvsge (index!54776 lt!660091) #b00000000000000000000000000000000) (bvslt (index!54776 lt!660091) (size!49480 lt!660040)))) (or ((_ is Undefined!13095) lt!660091) ((_ is Found!13095) lt!660091) (not ((_ is MissingZero!13095) lt!660091)) (and (bvsge (index!54775 lt!660091) #b00000000000000000000000000000000) (bvslt (index!54775 lt!660091) (size!49480 lt!660040)))) (or ((_ is Undefined!13095) lt!660091) ((_ is Found!13095) lt!660091) ((_ is MissingZero!13095) lt!660091) (not ((_ is MissingVacant!13095) lt!660091)) (and (bvsge (index!54778 lt!660091) #b00000000000000000000000000000000) (bvslt (index!54778 lt!660091) (size!49480 lt!660040)))) (or ((_ is Undefined!13095) lt!660091) (ite ((_ is Found!13095) lt!660091) (= (select (arr!48930 lt!660040) (index!54776 lt!660091)) lt!660039) (ite ((_ is MissingZero!13095) lt!660091) (= (select (arr!48930 lt!660040) (index!54775 lt!660091)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13095) lt!660091) (= (select (arr!48930 lt!660040) (index!54778 lt!660091)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!849523 () SeekEntryResult!13095)

(assert (=> d!159265 (= lt!660091 e!849523)))

(declare-fun c!140130 () Bool)

(assert (=> d!159265 (= c!140130 (and ((_ is Intermediate!13095) lt!660093) (undefined!13907 lt!660093)))))

(assert (=> d!159265 (= lt!660093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660039 mask!2512) lt!660039 lt!660040 mask!2512))))

(assert (=> d!159265 (validMask!0 mask!2512)))

(assert (=> d!159265 (= (seekEntryOrOpen!0 lt!660039 lt!660040 mask!2512) lt!660091)))

(declare-fun b!1523856 () Bool)

(assert (=> b!1523856 (= e!849521 (seekKeyOrZeroReturnVacant!0 (x!136461 lt!660093) (index!54777 lt!660093) (index!54777 lt!660093) lt!660039 lt!660040 mask!2512))))

(declare-fun b!1523857 () Bool)

(assert (=> b!1523857 (= e!849523 e!849522)))

(assert (=> b!1523857 (= lt!660092 (select (arr!48930 lt!660040) (index!54777 lt!660093)))))

(declare-fun c!140132 () Bool)

(assert (=> b!1523857 (= c!140132 (= lt!660092 lt!660039))))

(declare-fun b!1523858 () Bool)

(assert (=> b!1523858 (= e!849523 Undefined!13095)))

(assert (= (and d!159265 c!140130) b!1523858))

(assert (= (and d!159265 (not c!140130)) b!1523857))

(assert (= (and b!1523857 c!140132) b!1523855))

(assert (= (and b!1523857 (not c!140132)) b!1523854))

(assert (= (and b!1523854 c!140131) b!1523853))

(assert (= (and b!1523854 (not c!140131)) b!1523856))

(assert (=> d!159265 m!1406883))

(assert (=> d!159265 m!1406877))

(assert (=> d!159265 m!1406883))

(assert (=> d!159265 m!1406885))

(declare-fun m!1406973 () Bool)

(assert (=> d!159265 m!1406973))

(declare-fun m!1406975 () Bool)

(assert (=> d!159265 m!1406975))

(declare-fun m!1406977 () Bool)

(assert (=> d!159265 m!1406977))

(declare-fun m!1406979 () Bool)

(assert (=> b!1523856 m!1406979))

(declare-fun m!1406981 () Bool)

(assert (=> b!1523857 m!1406981))

(assert (=> b!1523717 d!159265))

(declare-fun b!1523873 () Bool)

(declare-fun e!849537 () Bool)

(declare-fun e!849535 () Bool)

(assert (=> b!1523873 (= e!849537 e!849535)))

(declare-fun c!140138 () Bool)

(assert (=> b!1523873 (= c!140138 (validKeyInArray!0 (select (arr!48930 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159267 () Bool)

(declare-fun res!1042694 () Bool)

(assert (=> d!159267 (=> res!1042694 e!849537)))

(assert (=> d!159267 (= res!1042694 (bvsge #b00000000000000000000000000000000 (size!49480 a!2804)))))

(assert (=> d!159267 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!849537)))

(declare-fun b!1523874 () Bool)

(declare-fun e!849536 () Bool)

(declare-fun call!68412 () Bool)

(assert (=> b!1523874 (= e!849536 call!68412)))

(declare-fun bm!68409 () Bool)

(assert (=> bm!68409 (= call!68412 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1523875 () Bool)

(assert (=> b!1523875 (= e!849535 call!68412)))

(declare-fun b!1523876 () Bool)

(assert (=> b!1523876 (= e!849535 e!849536)))

(declare-fun lt!660105 () (_ BitVec 64))

(assert (=> b!1523876 (= lt!660105 (select (arr!48930 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!660106 () Unit!50974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101398 (_ BitVec 64) (_ BitVec 32)) Unit!50974)

(assert (=> b!1523876 (= lt!660106 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660105 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1523876 (arrayContainsKey!0 a!2804 lt!660105 #b00000000000000000000000000000000)))

(declare-fun lt!660104 () Unit!50974)

(assert (=> b!1523876 (= lt!660104 lt!660106)))

(declare-fun res!1042695 () Bool)

(assert (=> b!1523876 (= res!1042695 (= (seekEntryOrOpen!0 (select (arr!48930 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13095 #b00000000000000000000000000000000)))))

(assert (=> b!1523876 (=> (not res!1042695) (not e!849536))))

(assert (= (and d!159267 (not res!1042694)) b!1523873))

(assert (= (and b!1523873 c!140138) b!1523876))

(assert (= (and b!1523873 (not c!140138)) b!1523875))

(assert (= (and b!1523876 res!1042695) b!1523874))

(assert (= (or b!1523874 b!1523875) bm!68409))

(declare-fun m!1406989 () Bool)

(assert (=> b!1523873 m!1406989))

(assert (=> b!1523873 m!1406989))

(declare-fun m!1406991 () Bool)

(assert (=> b!1523873 m!1406991))

(declare-fun m!1406993 () Bool)

(assert (=> bm!68409 m!1406993))

(assert (=> b!1523876 m!1406989))

(declare-fun m!1406995 () Bool)

(assert (=> b!1523876 m!1406995))

(declare-fun m!1406997 () Bool)

(assert (=> b!1523876 m!1406997))

(assert (=> b!1523876 m!1406989))

(declare-fun m!1406999 () Bool)

(assert (=> b!1523876 m!1406999))

(assert (=> b!1523716 d!159267))

(declare-fun b!1523915 () Bool)

(declare-fun e!849564 () Bool)

(declare-fun e!849562 () Bool)

(assert (=> b!1523915 (= e!849564 e!849562)))

(declare-fun c!140151 () Bool)

(assert (=> b!1523915 (= c!140151 (validKeyInArray!0 (select (arr!48930 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1523916 () Bool)

(declare-fun call!68419 () Bool)

(assert (=> b!1523916 (= e!849562 call!68419)))

(declare-fun b!1523918 () Bool)

(assert (=> b!1523918 (= e!849562 call!68419)))

(declare-fun bm!68416 () Bool)

(assert (=> bm!68416 (= call!68419 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140151 (Cons!35409 (select (arr!48930 a!2804) #b00000000000000000000000000000000) Nil!35410) Nil!35410)))))

(declare-fun b!1523919 () Bool)

(declare-fun e!849565 () Bool)

(assert (=> b!1523919 (= e!849565 e!849564)))

(declare-fun res!1042708 () Bool)

(assert (=> b!1523919 (=> (not res!1042708) (not e!849564))))

(declare-fun e!849563 () Bool)

(assert (=> b!1523919 (= res!1042708 (not e!849563))))

(declare-fun res!1042709 () Bool)

(assert (=> b!1523919 (=> (not res!1042709) (not e!849563))))

(assert (=> b!1523919 (= res!1042709 (validKeyInArray!0 (select (arr!48930 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1523917 () Bool)

(declare-fun contains!9989 (List!35413 (_ BitVec 64)) Bool)

(assert (=> b!1523917 (= e!849563 (contains!9989 Nil!35410 (select (arr!48930 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159271 () Bool)

(declare-fun res!1042710 () Bool)

(assert (=> d!159271 (=> res!1042710 e!849565)))

(assert (=> d!159271 (= res!1042710 (bvsge #b00000000000000000000000000000000 (size!49480 a!2804)))))

(assert (=> d!159271 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35410) e!849565)))

(assert (= (and d!159271 (not res!1042710)) b!1523919))

(assert (= (and b!1523919 res!1042709) b!1523917))

(assert (= (and b!1523919 res!1042708) b!1523915))

(assert (= (and b!1523915 c!140151) b!1523918))

(assert (= (and b!1523915 (not c!140151)) b!1523916))

(assert (= (or b!1523918 b!1523916) bm!68416))

(assert (=> b!1523915 m!1406989))

(assert (=> b!1523915 m!1406989))

(assert (=> b!1523915 m!1406991))

(assert (=> bm!68416 m!1406989))

(declare-fun m!1407019 () Bool)

(assert (=> bm!68416 m!1407019))

(assert (=> b!1523919 m!1406989))

(assert (=> b!1523919 m!1406989))

(assert (=> b!1523919 m!1406991))

(assert (=> b!1523917 m!1406989))

(assert (=> b!1523917 m!1406989))

(declare-fun m!1407021 () Bool)

(assert (=> b!1523917 m!1407021))

(assert (=> b!1523725 d!159271))

(declare-fun b!1523986 () Bool)

(declare-fun e!849602 () SeekEntryResult!13095)

(declare-fun e!849603 () SeekEntryResult!13095)

(assert (=> b!1523986 (= e!849602 e!849603)))

(declare-fun c!140176 () Bool)

(declare-fun lt!660155 () (_ BitVec 64))

(assert (=> b!1523986 (= c!140176 (or (= lt!660155 (select (arr!48930 a!2804) j!70)) (= (bvadd lt!660155 lt!660155) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1523987 () Bool)

(declare-fun lt!660154 () SeekEntryResult!13095)

(assert (=> b!1523987 (and (bvsge (index!54777 lt!660154) #b00000000000000000000000000000000) (bvslt (index!54777 lt!660154) (size!49480 a!2804)))))

(declare-fun res!1042732 () Bool)

(assert (=> b!1523987 (= res!1042732 (= (select (arr!48930 a!2804) (index!54777 lt!660154)) (select (arr!48930 a!2804) j!70)))))

(declare-fun e!849605 () Bool)

(assert (=> b!1523987 (=> res!1042732 e!849605)))

(declare-fun e!849606 () Bool)

(assert (=> b!1523987 (= e!849606 e!849605)))

(declare-fun b!1523988 () Bool)

(assert (=> b!1523988 (and (bvsge (index!54777 lt!660154) #b00000000000000000000000000000000) (bvslt (index!54777 lt!660154) (size!49480 a!2804)))))

(assert (=> b!1523988 (= e!849605 (= (select (arr!48930 a!2804) (index!54777 lt!660154)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1523989 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523989 (= e!849603 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48930 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523990 () Bool)

(declare-fun e!849604 () Bool)

(assert (=> b!1523990 (= e!849604 (bvsge (x!136461 lt!660154) #b01111111111111111111111111111110))))

(declare-fun b!1523991 () Bool)

(assert (=> b!1523991 (= e!849603 (Intermediate!13095 false index!487 x!534))))

(declare-fun b!1523992 () Bool)

(assert (=> b!1523992 (and (bvsge (index!54777 lt!660154) #b00000000000000000000000000000000) (bvslt (index!54777 lt!660154) (size!49480 a!2804)))))

(declare-fun res!1042730 () Bool)

(assert (=> b!1523992 (= res!1042730 (= (select (arr!48930 a!2804) (index!54777 lt!660154)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1523992 (=> res!1042730 e!849605)))

(declare-fun b!1523993 () Bool)

(assert (=> b!1523993 (= e!849604 e!849606)))

(declare-fun res!1042731 () Bool)

(assert (=> b!1523993 (= res!1042731 (and ((_ is Intermediate!13095) lt!660154) (not (undefined!13907 lt!660154)) (bvslt (x!136461 lt!660154) #b01111111111111111111111111111110) (bvsge (x!136461 lt!660154) #b00000000000000000000000000000000) (bvsge (x!136461 lt!660154) x!534)))))

(assert (=> b!1523993 (=> (not res!1042731) (not e!849606))))

(declare-fun b!1523994 () Bool)

(assert (=> b!1523994 (= e!849602 (Intermediate!13095 true index!487 x!534))))

(declare-fun d!159277 () Bool)

(assert (=> d!159277 e!849604))

(declare-fun c!140178 () Bool)

(assert (=> d!159277 (= c!140178 (and ((_ is Intermediate!13095) lt!660154) (undefined!13907 lt!660154)))))

(assert (=> d!159277 (= lt!660154 e!849602)))

(declare-fun c!140177 () Bool)

(assert (=> d!159277 (= c!140177 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159277 (= lt!660155 (select (arr!48930 a!2804) index!487))))

(assert (=> d!159277 (validMask!0 mask!2512)))

(assert (=> d!159277 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48930 a!2804) j!70) a!2804 mask!2512) lt!660154)))

(assert (= (and d!159277 c!140177) b!1523994))

(assert (= (and d!159277 (not c!140177)) b!1523986))

(assert (= (and b!1523986 c!140176) b!1523991))

(assert (= (and b!1523986 (not c!140176)) b!1523989))

(assert (= (and d!159277 c!140178) b!1523990))

(assert (= (and d!159277 (not c!140178)) b!1523993))

(assert (= (and b!1523993 res!1042731) b!1523987))

(assert (= (and b!1523987 (not res!1042732)) b!1523992))

(assert (= (and b!1523992 (not res!1042730)) b!1523988))

(declare-fun m!1407061 () Bool)

(assert (=> b!1523987 m!1407061))

(assert (=> d!159277 m!1406895))

(assert (=> d!159277 m!1406877))

(assert (=> b!1523992 m!1407061))

(assert (=> b!1523988 m!1407061))

(declare-fun m!1407063 () Bool)

(assert (=> b!1523989 m!1407063))

(assert (=> b!1523989 m!1407063))

(assert (=> b!1523989 m!1406859))

(declare-fun m!1407065 () Bool)

(assert (=> b!1523989 m!1407065))

(assert (=> b!1523715 d!159277))

(declare-fun b!1523995 () Bool)

(declare-fun e!849609 () Bool)

(declare-fun e!849607 () Bool)

(assert (=> b!1523995 (= e!849609 e!849607)))

(declare-fun c!140179 () Bool)

(assert (=> b!1523995 (= c!140179 (validKeyInArray!0 (select (arr!48930 a!2804) j!70)))))

(declare-fun d!159301 () Bool)

(declare-fun res!1042733 () Bool)

(assert (=> d!159301 (=> res!1042733 e!849609)))

(assert (=> d!159301 (= res!1042733 (bvsge j!70 (size!49480 a!2804)))))

(assert (=> d!159301 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!849609)))

(declare-fun b!1523996 () Bool)

(declare-fun e!849608 () Bool)

(declare-fun call!68420 () Bool)

(assert (=> b!1523996 (= e!849608 call!68420)))

(declare-fun bm!68417 () Bool)

(assert (=> bm!68417 (= call!68420 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1523997 () Bool)

(assert (=> b!1523997 (= e!849607 call!68420)))

(declare-fun b!1523998 () Bool)

(assert (=> b!1523998 (= e!849607 e!849608)))

(declare-fun lt!660157 () (_ BitVec 64))

(assert (=> b!1523998 (= lt!660157 (select (arr!48930 a!2804) j!70))))

(declare-fun lt!660158 () Unit!50974)

(assert (=> b!1523998 (= lt!660158 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660157 j!70))))

(assert (=> b!1523998 (arrayContainsKey!0 a!2804 lt!660157 #b00000000000000000000000000000000)))

(declare-fun lt!660156 () Unit!50974)

(assert (=> b!1523998 (= lt!660156 lt!660158)))

(declare-fun res!1042734 () Bool)

(assert (=> b!1523998 (= res!1042734 (= (seekEntryOrOpen!0 (select (arr!48930 a!2804) j!70) a!2804 mask!2512) (Found!13095 j!70)))))

(assert (=> b!1523998 (=> (not res!1042734) (not e!849608))))

(assert (= (and d!159301 (not res!1042733)) b!1523995))

(assert (= (and b!1523995 c!140179) b!1523998))

(assert (= (and b!1523995 (not c!140179)) b!1523997))

(assert (= (and b!1523998 res!1042734) b!1523996))

(assert (= (or b!1523996 b!1523997) bm!68417))

(assert (=> b!1523995 m!1406859))

(assert (=> b!1523995 m!1406859))

(assert (=> b!1523995 m!1406875))

(declare-fun m!1407067 () Bool)

(assert (=> bm!68417 m!1407067))

(assert (=> b!1523998 m!1406859))

(declare-fun m!1407069 () Bool)

(assert (=> b!1523998 m!1407069))

(declare-fun m!1407071 () Bool)

(assert (=> b!1523998 m!1407071))

(assert (=> b!1523998 m!1406859))

(assert (=> b!1523998 m!1406861))

(assert (=> b!1523724 d!159301))

(declare-fun d!159303 () Bool)

(assert (=> d!159303 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660163 () Unit!50974)

(declare-fun choose!38 (array!101398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50974)

(assert (=> d!159303 (= lt!660163 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159303 (validMask!0 mask!2512)))

(assert (=> d!159303 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660163)))

(declare-fun bs!43742 () Bool)

(assert (= bs!43742 d!159303))

(assert (=> bs!43742 m!1406897))

(declare-fun m!1407081 () Bool)

(assert (=> bs!43742 m!1407081))

(assert (=> bs!43742 m!1406877))

(assert (=> b!1523724 d!159303))

(declare-fun b!1524008 () Bool)

(declare-fun e!849615 () SeekEntryResult!13095)

(declare-fun e!849616 () SeekEntryResult!13095)

(assert (=> b!1524008 (= e!849615 e!849616)))

(declare-fun c!140183 () Bool)

(declare-fun lt!660165 () (_ BitVec 64))

(assert (=> b!1524008 (= c!140183 (or (= lt!660165 (select (arr!48930 a!2804) j!70)) (= (bvadd lt!660165 lt!660165) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524009 () Bool)

(declare-fun lt!660164 () SeekEntryResult!13095)

(assert (=> b!1524009 (and (bvsge (index!54777 lt!660164) #b00000000000000000000000000000000) (bvslt (index!54777 lt!660164) (size!49480 a!2804)))))

(declare-fun res!1042741 () Bool)

(assert (=> b!1524009 (= res!1042741 (= (select (arr!48930 a!2804) (index!54777 lt!660164)) (select (arr!48930 a!2804) j!70)))))

(declare-fun e!849618 () Bool)

(assert (=> b!1524009 (=> res!1042741 e!849618)))

(declare-fun e!849619 () Bool)

(assert (=> b!1524009 (= e!849619 e!849618)))

(declare-fun b!1524010 () Bool)

(assert (=> b!1524010 (and (bvsge (index!54777 lt!660164) #b00000000000000000000000000000000) (bvslt (index!54777 lt!660164) (size!49480 a!2804)))))

(assert (=> b!1524010 (= e!849618 (= (select (arr!48930 a!2804) (index!54777 lt!660164)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1524011 () Bool)

(assert (=> b!1524011 (= e!849616 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48930 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48930 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524012 () Bool)

(declare-fun e!849617 () Bool)

(assert (=> b!1524012 (= e!849617 (bvsge (x!136461 lt!660164) #b01111111111111111111111111111110))))

(declare-fun b!1524013 () Bool)

(assert (=> b!1524013 (= e!849616 (Intermediate!13095 false (toIndex!0 (select (arr!48930 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524014 () Bool)

(assert (=> b!1524014 (and (bvsge (index!54777 lt!660164) #b00000000000000000000000000000000) (bvslt (index!54777 lt!660164) (size!49480 a!2804)))))

(declare-fun res!1042739 () Bool)

(assert (=> b!1524014 (= res!1042739 (= (select (arr!48930 a!2804) (index!54777 lt!660164)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1524014 (=> res!1042739 e!849618)))

(declare-fun b!1524015 () Bool)

(assert (=> b!1524015 (= e!849617 e!849619)))

(declare-fun res!1042740 () Bool)

(assert (=> b!1524015 (= res!1042740 (and ((_ is Intermediate!13095) lt!660164) (not (undefined!13907 lt!660164)) (bvslt (x!136461 lt!660164) #b01111111111111111111111111111110) (bvsge (x!136461 lt!660164) #b00000000000000000000000000000000) (bvsge (x!136461 lt!660164) #b00000000000000000000000000000000)))))

(assert (=> b!1524015 (=> (not res!1042740) (not e!849619))))

(declare-fun b!1524016 () Bool)

(assert (=> b!1524016 (= e!849615 (Intermediate!13095 true (toIndex!0 (select (arr!48930 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159307 () Bool)

(assert (=> d!159307 e!849617))

(declare-fun c!140185 () Bool)

(assert (=> d!159307 (= c!140185 (and ((_ is Intermediate!13095) lt!660164) (undefined!13907 lt!660164)))))

(assert (=> d!159307 (= lt!660164 e!849615)))

(declare-fun c!140184 () Bool)

(assert (=> d!159307 (= c!140184 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159307 (= lt!660165 (select (arr!48930 a!2804) (toIndex!0 (select (arr!48930 a!2804) j!70) mask!2512)))))

(assert (=> d!159307 (validMask!0 mask!2512)))

(assert (=> d!159307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48930 a!2804) j!70) mask!2512) (select (arr!48930 a!2804) j!70) a!2804 mask!2512) lt!660164)))

(assert (= (and d!159307 c!140184) b!1524016))

(assert (= (and d!159307 (not c!140184)) b!1524008))

(assert (= (and b!1524008 c!140183) b!1524013))

(assert (= (and b!1524008 (not c!140183)) b!1524011))

(assert (= (and d!159307 c!140185) b!1524012))

(assert (= (and d!159307 (not c!140185)) b!1524015))

(assert (= (and b!1524015 res!1042740) b!1524009))

(assert (= (and b!1524009 (not res!1042741)) b!1524014))

(assert (= (and b!1524014 (not res!1042739)) b!1524010))

(declare-fun m!1407083 () Bool)

(assert (=> b!1524009 m!1407083))

(assert (=> d!159307 m!1406865))

(declare-fun m!1407085 () Bool)

(assert (=> d!159307 m!1407085))

(assert (=> d!159307 m!1406877))

(assert (=> b!1524014 m!1407083))

(assert (=> b!1524010 m!1407083))

(assert (=> b!1524011 m!1406865))

(declare-fun m!1407087 () Bool)

(assert (=> b!1524011 m!1407087))

(assert (=> b!1524011 m!1407087))

(assert (=> b!1524011 m!1406859))

(declare-fun m!1407089 () Bool)

(assert (=> b!1524011 m!1407089))

(assert (=> b!1523722 d!159307))

(declare-fun d!159309 () Bool)

(declare-fun lt!660185 () (_ BitVec 32))

(declare-fun lt!660184 () (_ BitVec 32))

(assert (=> d!159309 (= lt!660185 (bvmul (bvxor lt!660184 (bvlshr lt!660184 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159309 (= lt!660184 ((_ extract 31 0) (bvand (bvxor (select (arr!48930 a!2804) j!70) (bvlshr (select (arr!48930 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159309 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1042742 (let ((h!36837 ((_ extract 31 0) (bvand (bvxor (select (arr!48930 a!2804) j!70) (bvlshr (select (arr!48930 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136468 (bvmul (bvxor h!36837 (bvlshr h!36837 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136468 (bvlshr x!136468 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1042742 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1042742 #b00000000000000000000000000000000))))))

(assert (=> d!159309 (= (toIndex!0 (select (arr!48930 a!2804) j!70) mask!2512) (bvand (bvxor lt!660185 (bvlshr lt!660185 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1523722 d!159309))

(declare-fun b!1524029 () Bool)

(declare-fun e!849626 () SeekEntryResult!13095)

(declare-fun e!849627 () SeekEntryResult!13095)

(assert (=> b!1524029 (= e!849626 e!849627)))

(declare-fun c!140192 () Bool)

(declare-fun lt!660187 () (_ BitVec 64))

(assert (=> b!1524029 (= c!140192 (or (= lt!660187 lt!660039) (= (bvadd lt!660187 lt!660187) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1524030 () Bool)

(declare-fun lt!660186 () SeekEntryResult!13095)

(assert (=> b!1524030 (and (bvsge (index!54777 lt!660186) #b00000000000000000000000000000000) (bvslt (index!54777 lt!660186) (size!49480 lt!660040)))))

(declare-fun res!1042745 () Bool)

(assert (=> b!1524030 (= res!1042745 (= (select (arr!48930 lt!660040) (index!54777 lt!660186)) lt!660039))))

(declare-fun e!849629 () Bool)

(assert (=> b!1524030 (=> res!1042745 e!849629)))

(declare-fun e!849630 () Bool)

(assert (=> b!1524030 (= e!849630 e!849629)))

(declare-fun b!1524031 () Bool)

(assert (=> b!1524031 (and (bvsge (index!54777 lt!660186) #b00000000000000000000000000000000) (bvslt (index!54777 lt!660186) (size!49480 lt!660040)))))

(assert (=> b!1524031 (= e!849629 (= (select (arr!48930 lt!660040) (index!54777 lt!660186)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1524032 () Bool)

(assert (=> b!1524032 (= e!849627 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!660039 mask!2512) #b00000000000000000000000000000000 mask!2512) lt!660039 lt!660040 mask!2512))))

(declare-fun b!1524033 () Bool)

(declare-fun e!849628 () Bool)

(assert (=> b!1524033 (= e!849628 (bvsge (x!136461 lt!660186) #b01111111111111111111111111111110))))

(declare-fun b!1524034 () Bool)

(assert (=> b!1524034 (= e!849627 (Intermediate!13095 false (toIndex!0 lt!660039 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1524035 () Bool)

(assert (=> b!1524035 (and (bvsge (index!54777 lt!660186) #b00000000000000000000000000000000) (bvslt (index!54777 lt!660186) (size!49480 lt!660040)))))

(declare-fun res!1042743 () Bool)

(assert (=> b!1524035 (= res!1042743 (= (select (arr!48930 lt!660040) (index!54777 lt!660186)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1524035 (=> res!1042743 e!849629)))

(declare-fun b!1524036 () Bool)

(assert (=> b!1524036 (= e!849628 e!849630)))

(declare-fun res!1042744 () Bool)

(assert (=> b!1524036 (= res!1042744 (and ((_ is Intermediate!13095) lt!660186) (not (undefined!13907 lt!660186)) (bvslt (x!136461 lt!660186) #b01111111111111111111111111111110) (bvsge (x!136461 lt!660186) #b00000000000000000000000000000000) (bvsge (x!136461 lt!660186) #b00000000000000000000000000000000)))))

(assert (=> b!1524036 (=> (not res!1042744) (not e!849630))))

(declare-fun b!1524037 () Bool)

(assert (=> b!1524037 (= e!849626 (Intermediate!13095 true (toIndex!0 lt!660039 mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!159313 () Bool)

(assert (=> d!159313 e!849628))

(declare-fun c!140194 () Bool)

(assert (=> d!159313 (= c!140194 (and ((_ is Intermediate!13095) lt!660186) (undefined!13907 lt!660186)))))

(assert (=> d!159313 (= lt!660186 e!849626)))

(declare-fun c!140193 () Bool)

(assert (=> d!159313 (= c!140193 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159313 (= lt!660187 (select (arr!48930 lt!660040) (toIndex!0 lt!660039 mask!2512)))))

(assert (=> d!159313 (validMask!0 mask!2512)))

(assert (=> d!159313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660039 mask!2512) lt!660039 lt!660040 mask!2512) lt!660186)))

(assert (= (and d!159313 c!140193) b!1524037))

(assert (= (and d!159313 (not c!140193)) b!1524029))

(assert (= (and b!1524029 c!140192) b!1524034))

(assert (= (and b!1524029 (not c!140192)) b!1524032))

(assert (= (and d!159313 c!140194) b!1524033))

(assert (= (and d!159313 (not c!140194)) b!1524036))

(assert (= (and b!1524036 res!1042744) b!1524030))

(assert (= (and b!1524030 (not res!1042745)) b!1524035))

(assert (= (and b!1524035 (not res!1042743)) b!1524031))

(declare-fun m!1407091 () Bool)

(assert (=> b!1524030 m!1407091))

(assert (=> d!159313 m!1406883))

(declare-fun m!1407093 () Bool)

(assert (=> d!159313 m!1407093))

(assert (=> d!159313 m!1406877))

(assert (=> b!1524035 m!1407091))

(assert (=> b!1524031 m!1407091))

(assert (=> b!1524032 m!1406883))

(declare-fun m!1407095 () Bool)

(assert (=> b!1524032 m!1407095))

(assert (=> b!1524032 m!1407095))

(declare-fun m!1407097 () Bool)

(assert (=> b!1524032 m!1407097))

(assert (=> b!1523723 d!159313))

(declare-fun d!159315 () Bool)

(declare-fun lt!660189 () (_ BitVec 32))

(declare-fun lt!660188 () (_ BitVec 32))

(assert (=> d!159315 (= lt!660189 (bvmul (bvxor lt!660188 (bvlshr lt!660188 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159315 (= lt!660188 ((_ extract 31 0) (bvand (bvxor lt!660039 (bvlshr lt!660039 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159315 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1042742 (let ((h!36837 ((_ extract 31 0) (bvand (bvxor lt!660039 (bvlshr lt!660039 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136468 (bvmul (bvxor h!36837 (bvlshr h!36837 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136468 (bvlshr x!136468 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1042742 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1042742 #b00000000000000000000000000000000))))))

(assert (=> d!159315 (= (toIndex!0 lt!660039 mask!2512) (bvand (bvxor lt!660189 (bvlshr lt!660189 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1523723 d!159315))

(declare-fun d!159317 () Bool)

(assert (=> d!159317 (= (validKeyInArray!0 (select (arr!48930 a!2804) i!961)) (and (not (= (select (arr!48930 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48930 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1523721 d!159317))

(declare-fun d!159319 () Bool)

(assert (=> d!159319 (= (validKeyInArray!0 (select (arr!48930 a!2804) j!70)) (and (not (= (select (arr!48930 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48930 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1523720 d!159319))

(check-sat (not b!1523856) (not b!1523995) (not b!1524032) (not bm!68409) (not b!1523873) (not b!1523989) (not d!159277) (not d!159249) (not b!1523876) (not b!1523779) (not b!1523915) (not d!159265) (not d!159259) (not bm!68416) (not b!1523838) (not b!1523917) (not b!1523919) (not d!159307) (not d!159313) (not b!1523998) (not d!159303) (not bm!68417) (not b!1524011))
(check-sat)
