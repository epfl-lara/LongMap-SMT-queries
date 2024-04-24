; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129704 () Bool)

(assert start!129704)

(declare-fun b!1521714 () Bool)

(declare-fun res!1040259 () Bool)

(declare-fun e!848954 () Bool)

(assert (=> b!1521714 (=> (not res!1040259) (not e!848954))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101323 0))(
  ( (array!101324 (arr!48892 (Array (_ BitVec 32) (_ BitVec 64))) (size!49443 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101323)

(assert (=> b!1521714 (= res!1040259 (and (= (size!49443 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49443 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49443 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521716 () Bool)

(declare-fun res!1040264 () Bool)

(assert (=> b!1521716 (=> (not res!1040264) (not e!848954))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521716 (= res!1040264 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49443 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49443 a!2804))))))

(declare-fun b!1521717 () Bool)

(declare-fun res!1040262 () Bool)

(declare-fun e!848953 () Bool)

(assert (=> b!1521717 (=> (not res!1040262) (not e!848953))))

(declare-datatypes ((SeekEntryResult!12956 0))(
  ( (MissingZero!12956 (index!54219 (_ BitVec 32))) (Found!12956 (index!54220 (_ BitVec 32))) (Intermediate!12956 (undefined!13768 Bool) (index!54221 (_ BitVec 32)) (x!136093 (_ BitVec 32))) (Undefined!12956) (MissingVacant!12956 (index!54222 (_ BitVec 32))) )
))
(declare-fun lt!659513 () SeekEntryResult!12956)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101323 (_ BitVec 32)) SeekEntryResult!12956)

(assert (=> b!1521717 (= res!1040262 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48892 a!2804) j!70) a!2804 mask!2512) lt!659513))))

(declare-fun b!1521718 () Bool)

(declare-fun res!1040260 () Bool)

(assert (=> b!1521718 (=> (not res!1040260) (not e!848954))))

(declare-datatypes ((List!35362 0))(
  ( (Nil!35359) (Cons!35358 (h!36788 (_ BitVec 64)) (t!50048 List!35362)) )
))
(declare-fun arrayNoDuplicates!0 (array!101323 (_ BitVec 32) List!35362) Bool)

(assert (=> b!1521718 (= res!1040260 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35359))))

(declare-fun b!1521719 () Bool)

(declare-fun res!1040266 () Bool)

(assert (=> b!1521719 (=> (not res!1040266) (not e!848954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521719 (= res!1040266 (validKeyInArray!0 (select (arr!48892 a!2804) j!70)))))

(declare-fun b!1521720 () Bool)

(assert (=> b!1521720 (= e!848954 e!848953)))

(declare-fun res!1040258 () Bool)

(assert (=> b!1521720 (=> (not res!1040258) (not e!848953))))

(declare-fun lt!659514 () SeekEntryResult!12956)

(assert (=> b!1521720 (= res!1040258 (= lt!659514 lt!659513))))

(assert (=> b!1521720 (= lt!659513 (Intermediate!12956 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521720 (= lt!659514 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (select (arr!48892 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521715 () Bool)

(declare-fun res!1040257 () Bool)

(assert (=> b!1521715 (=> (not res!1040257) (not e!848953))))

(assert (=> b!1521715 (= res!1040257 (= lt!659514 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804)) mask!2512)))))

(declare-fun res!1040267 () Bool)

(assert (=> start!129704 (=> (not res!1040267) (not e!848954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129704 (= res!1040267 (validMask!0 mask!2512))))

(assert (=> start!129704 e!848954))

(assert (=> start!129704 true))

(declare-fun array_inv!38173 (array!101323) Bool)

(assert (=> start!129704 (array_inv!38173 a!2804)))

(declare-fun b!1521721 () Bool)

(assert (=> b!1521721 (= e!848953 (not (or (not (= (select (arr!48892 a!2804) j!70) (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (= index!487 resIndex!21))))))

(declare-fun e!848955 () Bool)

(assert (=> b!1521721 e!848955))

(declare-fun res!1040261 () Bool)

(assert (=> b!1521721 (=> (not res!1040261) (not e!848955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101323 (_ BitVec 32)) Bool)

(assert (=> b!1521721 (= res!1040261 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50815 0))(
  ( (Unit!50816) )
))
(declare-fun lt!659515 () Unit!50815)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50815)

(assert (=> b!1521721 (= lt!659515 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1521722 () Bool)

(declare-fun res!1040263 () Bool)

(assert (=> b!1521722 (=> (not res!1040263) (not e!848954))))

(assert (=> b!1521722 (= res!1040263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521723 () Bool)

(declare-fun res!1040265 () Bool)

(assert (=> b!1521723 (=> (not res!1040265) (not e!848954))))

(assert (=> b!1521723 (= res!1040265 (validKeyInArray!0 (select (arr!48892 a!2804) i!961)))))

(declare-fun b!1521724 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101323 (_ BitVec 32)) SeekEntryResult!12956)

(assert (=> b!1521724 (= e!848955 (= (seekEntry!0 (select (arr!48892 a!2804) j!70) a!2804 mask!2512) (Found!12956 j!70)))))

(assert (= (and start!129704 res!1040267) b!1521714))

(assert (= (and b!1521714 res!1040259) b!1521723))

(assert (= (and b!1521723 res!1040265) b!1521719))

(assert (= (and b!1521719 res!1040266) b!1521722))

(assert (= (and b!1521722 res!1040263) b!1521718))

(assert (= (and b!1521718 res!1040260) b!1521716))

(assert (= (and b!1521716 res!1040264) b!1521720))

(assert (= (and b!1521720 res!1040258) b!1521717))

(assert (= (and b!1521717 res!1040262) b!1521715))

(assert (= (and b!1521715 res!1040257) b!1521721))

(assert (= (and b!1521721 res!1040261) b!1521724))

(declare-fun m!1404987 () Bool)

(assert (=> start!129704 m!1404987))

(declare-fun m!1404989 () Bool)

(assert (=> start!129704 m!1404989))

(declare-fun m!1404991 () Bool)

(assert (=> b!1521723 m!1404991))

(assert (=> b!1521723 m!1404991))

(declare-fun m!1404993 () Bool)

(assert (=> b!1521723 m!1404993))

(declare-fun m!1404995 () Bool)

(assert (=> b!1521721 m!1404995))

(declare-fun m!1404997 () Bool)

(assert (=> b!1521721 m!1404997))

(declare-fun m!1404999 () Bool)

(assert (=> b!1521721 m!1404999))

(declare-fun m!1405001 () Bool)

(assert (=> b!1521721 m!1405001))

(declare-fun m!1405003 () Bool)

(assert (=> b!1521721 m!1405003))

(assert (=> b!1521720 m!1404995))

(assert (=> b!1521720 m!1404995))

(declare-fun m!1405005 () Bool)

(assert (=> b!1521720 m!1405005))

(assert (=> b!1521720 m!1405005))

(assert (=> b!1521720 m!1404995))

(declare-fun m!1405007 () Bool)

(assert (=> b!1521720 m!1405007))

(declare-fun m!1405009 () Bool)

(assert (=> b!1521722 m!1405009))

(assert (=> b!1521717 m!1404995))

(assert (=> b!1521717 m!1404995))

(declare-fun m!1405011 () Bool)

(assert (=> b!1521717 m!1405011))

(declare-fun m!1405013 () Bool)

(assert (=> b!1521718 m!1405013))

(assert (=> b!1521715 m!1404999))

(assert (=> b!1521715 m!1405001))

(assert (=> b!1521715 m!1405001))

(declare-fun m!1405015 () Bool)

(assert (=> b!1521715 m!1405015))

(assert (=> b!1521715 m!1405015))

(assert (=> b!1521715 m!1405001))

(declare-fun m!1405017 () Bool)

(assert (=> b!1521715 m!1405017))

(assert (=> b!1521719 m!1404995))

(assert (=> b!1521719 m!1404995))

(declare-fun m!1405019 () Bool)

(assert (=> b!1521719 m!1405019))

(assert (=> b!1521724 m!1404995))

(assert (=> b!1521724 m!1404995))

(declare-fun m!1405021 () Bool)

(assert (=> b!1521724 m!1405021))

(check-sat (not b!1521719) (not b!1521717) (not b!1521718) (not start!129704) (not b!1521724) (not b!1521715) (not b!1521723) (not b!1521720) (not b!1521721) (not b!1521722))
(check-sat)
(get-model)

(declare-fun d!159299 () Bool)

(assert (=> d!159299 (= (validKeyInArray!0 (select (arr!48892 a!2804) i!961)) (and (not (= (select (arr!48892 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48892 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1521723 d!159299))

(declare-fun b!1521801 () Bool)

(declare-fun e!848990 () Bool)

(declare-fun e!848989 () Bool)

(assert (=> b!1521801 (= e!848990 e!848989)))

(declare-fun res!1040340 () Bool)

(assert (=> b!1521801 (=> (not res!1040340) (not e!848989))))

(declare-fun e!848991 () Bool)

(assert (=> b!1521801 (= res!1040340 (not e!848991))))

(declare-fun res!1040342 () Bool)

(assert (=> b!1521801 (=> (not res!1040342) (not e!848991))))

(assert (=> b!1521801 (= res!1040342 (validKeyInArray!0 (select (arr!48892 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159301 () Bool)

(declare-fun res!1040341 () Bool)

(assert (=> d!159301 (=> res!1040341 e!848990)))

(assert (=> d!159301 (= res!1040341 (bvsge #b00000000000000000000000000000000 (size!49443 a!2804)))))

(assert (=> d!159301 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35359) e!848990)))

(declare-fun bm!68436 () Bool)

(declare-fun call!68439 () Bool)

(declare-fun c!140284 () Bool)

(assert (=> bm!68436 (= call!68439 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140284 (Cons!35358 (select (arr!48892 a!2804) #b00000000000000000000000000000000) Nil!35359) Nil!35359)))))

(declare-fun b!1521802 () Bool)

(declare-fun e!848988 () Bool)

(assert (=> b!1521802 (= e!848988 call!68439)))

(declare-fun b!1521803 () Bool)

(assert (=> b!1521803 (= e!848989 e!848988)))

(assert (=> b!1521803 (= c!140284 (validKeyInArray!0 (select (arr!48892 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1521804 () Bool)

(assert (=> b!1521804 (= e!848988 call!68439)))

(declare-fun b!1521805 () Bool)

(declare-fun contains!10024 (List!35362 (_ BitVec 64)) Bool)

(assert (=> b!1521805 (= e!848991 (contains!10024 Nil!35359 (select (arr!48892 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159301 (not res!1040341)) b!1521801))

(assert (= (and b!1521801 res!1040342) b!1521805))

(assert (= (and b!1521801 res!1040340) b!1521803))

(assert (= (and b!1521803 c!140284) b!1521804))

(assert (= (and b!1521803 (not c!140284)) b!1521802))

(assert (= (or b!1521804 b!1521802) bm!68436))

(declare-fun m!1405095 () Bool)

(assert (=> b!1521801 m!1405095))

(assert (=> b!1521801 m!1405095))

(declare-fun m!1405097 () Bool)

(assert (=> b!1521801 m!1405097))

(assert (=> bm!68436 m!1405095))

(declare-fun m!1405099 () Bool)

(assert (=> bm!68436 m!1405099))

(assert (=> b!1521803 m!1405095))

(assert (=> b!1521803 m!1405095))

(assert (=> b!1521803 m!1405097))

(assert (=> b!1521805 m!1405095))

(assert (=> b!1521805 m!1405095))

(declare-fun m!1405101 () Bool)

(assert (=> b!1521805 m!1405101))

(assert (=> b!1521718 d!159301))

(declare-fun b!1521836 () Bool)

(declare-fun e!849012 () SeekEntryResult!12956)

(declare-fun lt!659551 () SeekEntryResult!12956)

(get-info :version)

(assert (=> b!1521836 (= e!849012 (ite ((_ is MissingVacant!12956) lt!659551) (MissingZero!12956 (index!54222 lt!659551)) lt!659551))))

(declare-fun lt!659548 () SeekEntryResult!12956)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101323 (_ BitVec 32)) SeekEntryResult!12956)

(assert (=> b!1521836 (= lt!659551 (seekKeyOrZeroReturnVacant!0 (x!136093 lt!659548) (index!54221 lt!659548) (index!54221 lt!659548) (select (arr!48892 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521837 () Bool)

(declare-fun c!140297 () Bool)

(declare-fun lt!659550 () (_ BitVec 64))

(assert (=> b!1521837 (= c!140297 (= lt!659550 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849013 () SeekEntryResult!12956)

(assert (=> b!1521837 (= e!849013 e!849012)))

(declare-fun d!159303 () Bool)

(declare-fun lt!659549 () SeekEntryResult!12956)

(assert (=> d!159303 (and (or ((_ is MissingVacant!12956) lt!659549) (not ((_ is Found!12956) lt!659549)) (and (bvsge (index!54220 lt!659549) #b00000000000000000000000000000000) (bvslt (index!54220 lt!659549) (size!49443 a!2804)))) (not ((_ is MissingVacant!12956) lt!659549)) (or (not ((_ is Found!12956) lt!659549)) (= (select (arr!48892 a!2804) (index!54220 lt!659549)) (select (arr!48892 a!2804) j!70))))))

(declare-fun e!849014 () SeekEntryResult!12956)

(assert (=> d!159303 (= lt!659549 e!849014)))

(declare-fun c!140296 () Bool)

(assert (=> d!159303 (= c!140296 (and ((_ is Intermediate!12956) lt!659548) (undefined!13768 lt!659548)))))

(assert (=> d!159303 (= lt!659548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (select (arr!48892 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159303 (validMask!0 mask!2512)))

(assert (=> d!159303 (= (seekEntry!0 (select (arr!48892 a!2804) j!70) a!2804 mask!2512) lt!659549)))

(declare-fun b!1521838 () Bool)

(assert (=> b!1521838 (= e!849013 (Found!12956 (index!54221 lt!659548)))))

(declare-fun b!1521839 () Bool)

(assert (=> b!1521839 (= e!849014 e!849013)))

(assert (=> b!1521839 (= lt!659550 (select (arr!48892 a!2804) (index!54221 lt!659548)))))

(declare-fun c!140295 () Bool)

(assert (=> b!1521839 (= c!140295 (= lt!659550 (select (arr!48892 a!2804) j!70)))))

(declare-fun b!1521840 () Bool)

(assert (=> b!1521840 (= e!849014 Undefined!12956)))

(declare-fun b!1521841 () Bool)

(assert (=> b!1521841 (= e!849012 (MissingZero!12956 (index!54221 lt!659548)))))

(assert (= (and d!159303 c!140296) b!1521840))

(assert (= (and d!159303 (not c!140296)) b!1521839))

(assert (= (and b!1521839 c!140295) b!1521838))

(assert (= (and b!1521839 (not c!140295)) b!1521837))

(assert (= (and b!1521837 c!140297) b!1521841))

(assert (= (and b!1521837 (not c!140297)) b!1521836))

(assert (=> b!1521836 m!1404995))

(declare-fun m!1405103 () Bool)

(assert (=> b!1521836 m!1405103))

(declare-fun m!1405105 () Bool)

(assert (=> d!159303 m!1405105))

(assert (=> d!159303 m!1404995))

(assert (=> d!159303 m!1405005))

(assert (=> d!159303 m!1405005))

(assert (=> d!159303 m!1404995))

(assert (=> d!159303 m!1405007))

(assert (=> d!159303 m!1404987))

(declare-fun m!1405107 () Bool)

(assert (=> b!1521839 m!1405107))

(assert (=> b!1521724 d!159303))

(declare-fun d!159309 () Bool)

(assert (=> d!159309 (= (validKeyInArray!0 (select (arr!48892 a!2804) j!70)) (and (not (= (select (arr!48892 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48892 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1521719 d!159309))

(declare-fun e!849053 () SeekEntryResult!12956)

(declare-fun b!1521899 () Bool)

(assert (=> b!1521899 (= e!849053 (Intermediate!12956 false (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1521900 () Bool)

(declare-fun e!849052 () Bool)

(declare-fun e!849054 () Bool)

(assert (=> b!1521900 (= e!849052 e!849054)))

(declare-fun res!1040377 () Bool)

(declare-fun lt!659573 () SeekEntryResult!12956)

(assert (=> b!1521900 (= res!1040377 (and ((_ is Intermediate!12956) lt!659573) (not (undefined!13768 lt!659573)) (bvslt (x!136093 lt!659573) #b01111111111111111111111111111110) (bvsge (x!136093 lt!659573) #b00000000000000000000000000000000) (bvsge (x!136093 lt!659573) #b00000000000000000000000000000000)))))

(assert (=> b!1521900 (=> (not res!1040377) (not e!849054))))

(declare-fun b!1521901 () Bool)

(assert (=> b!1521901 (and (bvsge (index!54221 lt!659573) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659573) (size!49443 a!2804)))))

(declare-fun res!1040376 () Bool)

(assert (=> b!1521901 (= res!1040376 (= (select (arr!48892 a!2804) (index!54221 lt!659573)) (select (arr!48892 a!2804) j!70)))))

(declare-fun e!849055 () Bool)

(assert (=> b!1521901 (=> res!1040376 e!849055)))

(assert (=> b!1521901 (= e!849054 e!849055)))

(declare-fun d!159311 () Bool)

(assert (=> d!159311 e!849052))

(declare-fun c!140316 () Bool)

(assert (=> d!159311 (= c!140316 (and ((_ is Intermediate!12956) lt!659573) (undefined!13768 lt!659573)))))

(declare-fun e!849051 () SeekEntryResult!12956)

(assert (=> d!159311 (= lt!659573 e!849051)))

(declare-fun c!140317 () Bool)

(assert (=> d!159311 (= c!140317 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659572 () (_ BitVec 64))

(assert (=> d!159311 (= lt!659572 (select (arr!48892 a!2804) (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512)))))

(assert (=> d!159311 (validMask!0 mask!2512)))

(assert (=> d!159311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (select (arr!48892 a!2804) j!70) a!2804 mask!2512) lt!659573)))

(declare-fun b!1521902 () Bool)

(assert (=> b!1521902 (= e!849051 e!849053)))

(declare-fun c!140315 () Bool)

(assert (=> b!1521902 (= c!140315 (or (= lt!659572 (select (arr!48892 a!2804) j!70)) (= (bvadd lt!659572 lt!659572) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1521903 () Bool)

(assert (=> b!1521903 (and (bvsge (index!54221 lt!659573) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659573) (size!49443 a!2804)))))

(declare-fun res!1040378 () Bool)

(assert (=> b!1521903 (= res!1040378 (= (select (arr!48892 a!2804) (index!54221 lt!659573)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1521903 (=> res!1040378 e!849055)))

(declare-fun b!1521904 () Bool)

(assert (=> b!1521904 (and (bvsge (index!54221 lt!659573) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659573) (size!49443 a!2804)))))

(assert (=> b!1521904 (= e!849055 (= (select (arr!48892 a!2804) (index!54221 lt!659573)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1521905 () Bool)

(assert (=> b!1521905 (= e!849051 (Intermediate!12956 true (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1521906 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521906 (= e!849053 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48892 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521907 () Bool)

(assert (=> b!1521907 (= e!849052 (bvsge (x!136093 lt!659573) #b01111111111111111111111111111110))))

(assert (= (and d!159311 c!140317) b!1521905))

(assert (= (and d!159311 (not c!140317)) b!1521902))

(assert (= (and b!1521902 c!140315) b!1521899))

(assert (= (and b!1521902 (not c!140315)) b!1521906))

(assert (= (and d!159311 c!140316) b!1521907))

(assert (= (and d!159311 (not c!140316)) b!1521900))

(assert (= (and b!1521900 res!1040377) b!1521901))

(assert (= (and b!1521901 (not res!1040376)) b!1521903))

(assert (= (and b!1521903 (not res!1040378)) b!1521904))

(assert (=> b!1521906 m!1405005))

(declare-fun m!1405137 () Bool)

(assert (=> b!1521906 m!1405137))

(assert (=> b!1521906 m!1405137))

(assert (=> b!1521906 m!1404995))

(declare-fun m!1405139 () Bool)

(assert (=> b!1521906 m!1405139))

(declare-fun m!1405141 () Bool)

(assert (=> b!1521904 m!1405141))

(assert (=> d!159311 m!1405005))

(declare-fun m!1405143 () Bool)

(assert (=> d!159311 m!1405143))

(assert (=> d!159311 m!1404987))

(assert (=> b!1521901 m!1405141))

(assert (=> b!1521903 m!1405141))

(assert (=> b!1521720 d!159311))

(declare-fun d!159321 () Bool)

(declare-fun lt!659587 () (_ BitVec 32))

(declare-fun lt!659584 () (_ BitVec 32))

(assert (=> d!159321 (= lt!659587 (bvmul (bvxor lt!659584 (bvlshr lt!659584 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159321 (= lt!659584 ((_ extract 31 0) (bvand (bvxor (select (arr!48892 a!2804) j!70) (bvlshr (select (arr!48892 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159321 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1040382 (let ((h!36791 ((_ extract 31 0) (bvand (bvxor (select (arr!48892 a!2804) j!70) (bvlshr (select (arr!48892 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136098 (bvmul (bvxor h!36791 (bvlshr h!36791 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136098 (bvlshr x!136098 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1040382 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1040382 #b00000000000000000000000000000000))))))

(assert (=> d!159321 (= (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (bvand (bvxor lt!659587 (bvlshr lt!659587 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1521720 d!159321))

(declare-fun b!1521925 () Bool)

(declare-fun e!849067 () SeekEntryResult!12956)

(assert (=> b!1521925 (= e!849067 (Intermediate!12956 false (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1521926 () Bool)

(declare-fun e!849066 () Bool)

(declare-fun e!849068 () Bool)

(assert (=> b!1521926 (= e!849066 e!849068)))

(declare-fun res!1040385 () Bool)

(declare-fun lt!659591 () SeekEntryResult!12956)

(assert (=> b!1521926 (= res!1040385 (and ((_ is Intermediate!12956) lt!659591) (not (undefined!13768 lt!659591)) (bvslt (x!136093 lt!659591) #b01111111111111111111111111111110) (bvsge (x!136093 lt!659591) #b00000000000000000000000000000000) (bvsge (x!136093 lt!659591) #b00000000000000000000000000000000)))))

(assert (=> b!1521926 (=> (not res!1040385) (not e!849068))))

(declare-fun b!1521927 () Bool)

(assert (=> b!1521927 (and (bvsge (index!54221 lt!659591) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659591) (size!49443 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804)))))))

(declare-fun res!1040384 () Bool)

(assert (=> b!1521927 (= res!1040384 (= (select (arr!48892 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804))) (index!54221 lt!659591)) (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!849069 () Bool)

(assert (=> b!1521927 (=> res!1040384 e!849069)))

(assert (=> b!1521927 (= e!849068 e!849069)))

(declare-fun d!159325 () Bool)

(assert (=> d!159325 e!849066))

(declare-fun c!140326 () Bool)

(assert (=> d!159325 (= c!140326 (and ((_ is Intermediate!12956) lt!659591) (undefined!13768 lt!659591)))))

(declare-fun e!849065 () SeekEntryResult!12956)

(assert (=> d!159325 (= lt!659591 e!849065)))

(declare-fun c!140327 () Bool)

(assert (=> d!159325 (= c!140327 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659590 () (_ BitVec 64))

(assert (=> d!159325 (= lt!659590 (select (arr!48892 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804))) (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159325 (validMask!0 mask!2512)))

(assert (=> d!159325 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804)) mask!2512) lt!659591)))

(declare-fun b!1521928 () Bool)

(assert (=> b!1521928 (= e!849065 e!849067)))

(declare-fun c!140325 () Bool)

(assert (=> b!1521928 (= c!140325 (or (= lt!659590 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659590 lt!659590) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1521929 () Bool)

(assert (=> b!1521929 (and (bvsge (index!54221 lt!659591) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659591) (size!49443 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804)))))))

(declare-fun res!1040386 () Bool)

(assert (=> b!1521929 (= res!1040386 (= (select (arr!48892 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804))) (index!54221 lt!659591)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1521929 (=> res!1040386 e!849069)))

(declare-fun b!1521930 () Bool)

(assert (=> b!1521930 (and (bvsge (index!54221 lt!659591) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659591) (size!49443 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804)))))))

(assert (=> b!1521930 (= e!849069 (= (select (arr!48892 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804))) (index!54221 lt!659591)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1521931 () Bool)

(assert (=> b!1521931 (= e!849065 (Intermediate!12956 true (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1521932 () Bool)

(assert (=> b!1521932 (= e!849067 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804)) mask!2512))))

(declare-fun b!1521933 () Bool)

(assert (=> b!1521933 (= e!849066 (bvsge (x!136093 lt!659591) #b01111111111111111111111111111110))))

(assert (= (and d!159325 c!140327) b!1521931))

(assert (= (and d!159325 (not c!140327)) b!1521928))

(assert (= (and b!1521928 c!140325) b!1521925))

(assert (= (and b!1521928 (not c!140325)) b!1521932))

(assert (= (and d!159325 c!140326) b!1521933))

(assert (= (and d!159325 (not c!140326)) b!1521926))

(assert (= (and b!1521926 res!1040385) b!1521927))

(assert (= (and b!1521927 (not res!1040384)) b!1521929))

(assert (= (and b!1521929 (not res!1040386)) b!1521930))

(assert (=> b!1521932 m!1405015))

(declare-fun m!1405153 () Bool)

(assert (=> b!1521932 m!1405153))

(assert (=> b!1521932 m!1405153))

(assert (=> b!1521932 m!1405001))

(declare-fun m!1405155 () Bool)

(assert (=> b!1521932 m!1405155))

(declare-fun m!1405157 () Bool)

(assert (=> b!1521930 m!1405157))

(assert (=> d!159325 m!1405015))

(declare-fun m!1405159 () Bool)

(assert (=> d!159325 m!1405159))

(assert (=> d!159325 m!1404987))

(assert (=> b!1521927 m!1405157))

(assert (=> b!1521929 m!1405157))

(assert (=> b!1521715 d!159325))

(declare-fun d!159329 () Bool)

(declare-fun lt!659598 () (_ BitVec 32))

(declare-fun lt!659597 () (_ BitVec 32))

(assert (=> d!159329 (= lt!659598 (bvmul (bvxor lt!659597 (bvlshr lt!659597 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159329 (= lt!659597 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159329 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1040382 (let ((h!36791 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136098 (bvmul (bvxor h!36791 (bvlshr h!36791 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136098 (bvlshr x!136098 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1040382 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1040382 #b00000000000000000000000000000000))))))

(assert (=> d!159329 (= (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!659598 (bvlshr lt!659598 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1521715 d!159329))

(declare-fun bm!68451 () Bool)

(declare-fun call!68454 () Bool)

(assert (=> bm!68451 (= call!68454 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1521975 () Bool)

(declare-fun e!849098 () Bool)

(declare-fun e!849100 () Bool)

(assert (=> b!1521975 (= e!849098 e!849100)))

(declare-fun c!140338 () Bool)

(assert (=> b!1521975 (= c!140338 (validKeyInArray!0 (select (arr!48892 a!2804) j!70)))))

(declare-fun b!1521977 () Bool)

(declare-fun e!849099 () Bool)

(assert (=> b!1521977 (= e!849100 e!849099)))

(declare-fun lt!659616 () (_ BitVec 64))

(assert (=> b!1521977 (= lt!659616 (select (arr!48892 a!2804) j!70))))

(declare-fun lt!659617 () Unit!50815)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101323 (_ BitVec 64) (_ BitVec 32)) Unit!50815)

(assert (=> b!1521977 (= lt!659617 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659616 j!70))))

(declare-fun arrayContainsKey!0 (array!101323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1521977 (arrayContainsKey!0 a!2804 lt!659616 #b00000000000000000000000000000000)))

(declare-fun lt!659618 () Unit!50815)

(assert (=> b!1521977 (= lt!659618 lt!659617)))

(declare-fun res!1040410 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101323 (_ BitVec 32)) SeekEntryResult!12956)

(assert (=> b!1521977 (= res!1040410 (= (seekEntryOrOpen!0 (select (arr!48892 a!2804) j!70) a!2804 mask!2512) (Found!12956 j!70)))))

(assert (=> b!1521977 (=> (not res!1040410) (not e!849099))))

(declare-fun b!1521978 () Bool)

(assert (=> b!1521978 (= e!849100 call!68454)))

(declare-fun d!159333 () Bool)

(declare-fun res!1040409 () Bool)

(assert (=> d!159333 (=> res!1040409 e!849098)))

(assert (=> d!159333 (= res!1040409 (bvsge j!70 (size!49443 a!2804)))))

(assert (=> d!159333 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!849098)))

(declare-fun b!1521976 () Bool)

(assert (=> b!1521976 (= e!849099 call!68454)))

(assert (= (and d!159333 (not res!1040409)) b!1521975))

(assert (= (and b!1521975 c!140338) b!1521977))

(assert (= (and b!1521975 (not c!140338)) b!1521978))

(assert (= (and b!1521977 res!1040410) b!1521976))

(assert (= (or b!1521976 b!1521978) bm!68451))

(declare-fun m!1405179 () Bool)

(assert (=> bm!68451 m!1405179))

(assert (=> b!1521975 m!1404995))

(assert (=> b!1521975 m!1404995))

(assert (=> b!1521975 m!1405019))

(assert (=> b!1521977 m!1404995))

(declare-fun m!1405181 () Bool)

(assert (=> b!1521977 m!1405181))

(declare-fun m!1405183 () Bool)

(assert (=> b!1521977 m!1405183))

(assert (=> b!1521977 m!1404995))

(declare-fun m!1405185 () Bool)

(assert (=> b!1521977 m!1405185))

(assert (=> b!1521721 d!159333))

(declare-fun d!159341 () Bool)

(assert (=> d!159341 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!659623 () Unit!50815)

(declare-fun choose!38 (array!101323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50815)

(assert (=> d!159341 (= lt!659623 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159341 (validMask!0 mask!2512)))

(assert (=> d!159341 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!659623)))

(declare-fun bs!43624 () Bool)

(assert (= bs!43624 d!159341))

(assert (=> bs!43624 m!1405003))

(declare-fun m!1405199 () Bool)

(assert (=> bs!43624 m!1405199))

(assert (=> bs!43624 m!1404987))

(assert (=> b!1521721 d!159341))

(declare-fun d!159349 () Bool)

(assert (=> d!159349 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129704 d!159349))

(declare-fun d!159357 () Bool)

(assert (=> d!159357 (= (array_inv!38173 a!2804) (bvsge (size!49443 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129704 d!159357))

(declare-fun bm!68453 () Bool)

(declare-fun call!68456 () Bool)

(assert (=> bm!68453 (= call!68456 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1522029 () Bool)

(declare-fun e!849129 () Bool)

(declare-fun e!849131 () Bool)

(assert (=> b!1522029 (= e!849129 e!849131)))

(declare-fun c!140358 () Bool)

(assert (=> b!1522029 (= c!140358 (validKeyInArray!0 (select (arr!48892 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522031 () Bool)

(declare-fun e!849130 () Bool)

(assert (=> b!1522031 (= e!849131 e!849130)))

(declare-fun lt!659642 () (_ BitVec 64))

(assert (=> b!1522031 (= lt!659642 (select (arr!48892 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!659643 () Unit!50815)

(assert (=> b!1522031 (= lt!659643 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659642 #b00000000000000000000000000000000))))

(assert (=> b!1522031 (arrayContainsKey!0 a!2804 lt!659642 #b00000000000000000000000000000000)))

(declare-fun lt!659644 () Unit!50815)

(assert (=> b!1522031 (= lt!659644 lt!659643)))

(declare-fun res!1040424 () Bool)

(assert (=> b!1522031 (= res!1040424 (= (seekEntryOrOpen!0 (select (arr!48892 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12956 #b00000000000000000000000000000000)))))

(assert (=> b!1522031 (=> (not res!1040424) (not e!849130))))

(declare-fun b!1522032 () Bool)

(assert (=> b!1522032 (= e!849131 call!68456)))

(declare-fun d!159361 () Bool)

(declare-fun res!1040423 () Bool)

(assert (=> d!159361 (=> res!1040423 e!849129)))

(assert (=> d!159361 (= res!1040423 (bvsge #b00000000000000000000000000000000 (size!49443 a!2804)))))

(assert (=> d!159361 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!849129)))

(declare-fun b!1522030 () Bool)

(assert (=> b!1522030 (= e!849130 call!68456)))

(assert (= (and d!159361 (not res!1040423)) b!1522029))

(assert (= (and b!1522029 c!140358) b!1522031))

(assert (= (and b!1522029 (not c!140358)) b!1522032))

(assert (= (and b!1522031 res!1040424) b!1522030))

(assert (= (or b!1522030 b!1522032) bm!68453))

(declare-fun m!1405223 () Bool)

(assert (=> bm!68453 m!1405223))

(assert (=> b!1522029 m!1405095))

(assert (=> b!1522029 m!1405095))

(assert (=> b!1522029 m!1405097))

(assert (=> b!1522031 m!1405095))

(declare-fun m!1405225 () Bool)

(assert (=> b!1522031 m!1405225))

(declare-fun m!1405227 () Bool)

(assert (=> b!1522031 m!1405227))

(assert (=> b!1522031 m!1405095))

(declare-fun m!1405229 () Bool)

(assert (=> b!1522031 m!1405229))

(assert (=> b!1521722 d!159361))

(declare-fun b!1522037 () Bool)

(declare-fun e!849137 () SeekEntryResult!12956)

(assert (=> b!1522037 (= e!849137 (Intermediate!12956 false index!487 x!534))))

(declare-fun b!1522038 () Bool)

(declare-fun e!849136 () Bool)

(declare-fun e!849138 () Bool)

(assert (=> b!1522038 (= e!849136 e!849138)))

(declare-fun res!1040428 () Bool)

(declare-fun lt!659649 () SeekEntryResult!12956)

(assert (=> b!1522038 (= res!1040428 (and ((_ is Intermediate!12956) lt!659649) (not (undefined!13768 lt!659649)) (bvslt (x!136093 lt!659649) #b01111111111111111111111111111110) (bvsge (x!136093 lt!659649) #b00000000000000000000000000000000) (bvsge (x!136093 lt!659649) x!534)))))

(assert (=> b!1522038 (=> (not res!1040428) (not e!849138))))

(declare-fun b!1522039 () Bool)

(assert (=> b!1522039 (and (bvsge (index!54221 lt!659649) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659649) (size!49443 a!2804)))))

(declare-fun res!1040427 () Bool)

(assert (=> b!1522039 (= res!1040427 (= (select (arr!48892 a!2804) (index!54221 lt!659649)) (select (arr!48892 a!2804) j!70)))))

(declare-fun e!849139 () Bool)

(assert (=> b!1522039 (=> res!1040427 e!849139)))

(assert (=> b!1522039 (= e!849138 e!849139)))

(declare-fun d!159367 () Bool)

(assert (=> d!159367 e!849136))

(declare-fun c!140361 () Bool)

(assert (=> d!159367 (= c!140361 (and ((_ is Intermediate!12956) lt!659649) (undefined!13768 lt!659649)))))

(declare-fun e!849135 () SeekEntryResult!12956)

(assert (=> d!159367 (= lt!659649 e!849135)))

(declare-fun c!140362 () Bool)

(assert (=> d!159367 (= c!140362 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!659648 () (_ BitVec 64))

(assert (=> d!159367 (= lt!659648 (select (arr!48892 a!2804) index!487))))

(assert (=> d!159367 (validMask!0 mask!2512)))

(assert (=> d!159367 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48892 a!2804) j!70) a!2804 mask!2512) lt!659649)))

(declare-fun b!1522040 () Bool)

(assert (=> b!1522040 (= e!849135 e!849137)))

(declare-fun c!140360 () Bool)

(assert (=> b!1522040 (= c!140360 (or (= lt!659648 (select (arr!48892 a!2804) j!70)) (= (bvadd lt!659648 lt!659648) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522041 () Bool)

(assert (=> b!1522041 (and (bvsge (index!54221 lt!659649) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659649) (size!49443 a!2804)))))

(declare-fun res!1040429 () Bool)

(assert (=> b!1522041 (= res!1040429 (= (select (arr!48892 a!2804) (index!54221 lt!659649)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522041 (=> res!1040429 e!849139)))

(declare-fun b!1522042 () Bool)

(assert (=> b!1522042 (and (bvsge (index!54221 lt!659649) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659649) (size!49443 a!2804)))))

(assert (=> b!1522042 (= e!849139 (= (select (arr!48892 a!2804) (index!54221 lt!659649)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522043 () Bool)

(assert (=> b!1522043 (= e!849135 (Intermediate!12956 true index!487 x!534))))

(declare-fun b!1522044 () Bool)

(assert (=> b!1522044 (= e!849137 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48892 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522045 () Bool)

(assert (=> b!1522045 (= e!849136 (bvsge (x!136093 lt!659649) #b01111111111111111111111111111110))))

(assert (= (and d!159367 c!140362) b!1522043))

(assert (= (and d!159367 (not c!140362)) b!1522040))

(assert (= (and b!1522040 c!140360) b!1522037))

(assert (= (and b!1522040 (not c!140360)) b!1522044))

(assert (= (and d!159367 c!140361) b!1522045))

(assert (= (and d!159367 (not c!140361)) b!1522038))

(assert (= (and b!1522038 res!1040428) b!1522039))

(assert (= (and b!1522039 (not res!1040427)) b!1522041))

(assert (= (and b!1522041 (not res!1040429)) b!1522042))

(declare-fun m!1405239 () Bool)

(assert (=> b!1522044 m!1405239))

(assert (=> b!1522044 m!1405239))

(assert (=> b!1522044 m!1404995))

(declare-fun m!1405241 () Bool)

(assert (=> b!1522044 m!1405241))

(declare-fun m!1405243 () Bool)

(assert (=> b!1522042 m!1405243))

(declare-fun m!1405245 () Bool)

(assert (=> d!159367 m!1405245))

(assert (=> d!159367 m!1404987))

(assert (=> b!1522039 m!1405243))

(assert (=> b!1522041 m!1405243))

(assert (=> b!1521717 d!159367))

(check-sat (not bm!68436) (not bm!68453) (not b!1522044) (not d!159341) (not b!1521906) (not b!1521836) (not b!1521975) (not d!159367) (not bm!68451) (not b!1522031) (not b!1521805) (not b!1521932) (not d!159325) (not d!159303) (not b!1521801) (not b!1521803) (not b!1521977) (not d!159311) (not b!1522029))
(check-sat)
(get-model)

(declare-fun d!159459 () Bool)

(declare-fun lt!659755 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!777 (List!35362) (InoxSet (_ BitVec 64)))

(assert (=> d!159459 (= lt!659755 (select (content!777 Nil!35359) (select (arr!48892 a!2804) #b00000000000000000000000000000000)))))

(declare-fun e!849278 () Bool)

(assert (=> d!159459 (= lt!659755 e!849278)))

(declare-fun res!1040498 () Bool)

(assert (=> d!159459 (=> (not res!1040498) (not e!849278))))

(assert (=> d!159459 (= res!1040498 ((_ is Cons!35358) Nil!35359))))

(assert (=> d!159459 (= (contains!10024 Nil!35359 (select (arr!48892 a!2804) #b00000000000000000000000000000000)) lt!659755)))

(declare-fun b!1522269 () Bool)

(declare-fun e!849279 () Bool)

(assert (=> b!1522269 (= e!849278 e!849279)))

(declare-fun res!1040497 () Bool)

(assert (=> b!1522269 (=> res!1040497 e!849279)))

(assert (=> b!1522269 (= res!1040497 (= (h!36788 Nil!35359) (select (arr!48892 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522270 () Bool)

(assert (=> b!1522270 (= e!849279 (contains!10024 (t!50048 Nil!35359) (select (arr!48892 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159459 res!1040498) b!1522269))

(assert (= (and b!1522269 (not res!1040497)) b!1522270))

(declare-fun m!1405471 () Bool)

(assert (=> d!159459 m!1405471))

(assert (=> d!159459 m!1405095))

(declare-fun m!1405473 () Bool)

(assert (=> d!159459 m!1405473))

(assert (=> b!1522270 m!1405095))

(declare-fun m!1405475 () Bool)

(assert (=> b!1522270 m!1405475))

(assert (=> b!1521805 d!159459))

(assert (=> d!159367 d!159349))

(declare-fun e!849282 () SeekEntryResult!12956)

(declare-fun b!1522271 () Bool)

(assert (=> b!1522271 (= e!849282 (Intermediate!12956 false (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1522272 () Bool)

(declare-fun e!849281 () Bool)

(declare-fun e!849283 () Bool)

(assert (=> b!1522272 (= e!849281 e!849283)))

(declare-fun res!1040500 () Bool)

(declare-fun lt!659757 () SeekEntryResult!12956)

(assert (=> b!1522272 (= res!1040500 (and ((_ is Intermediate!12956) lt!659757) (not (undefined!13768 lt!659757)) (bvslt (x!136093 lt!659757) #b01111111111111111111111111111110) (bvsge (x!136093 lt!659757) #b00000000000000000000000000000000) (bvsge (x!136093 lt!659757) (bvadd x!534 #b00000000000000000000000000000001))))))

(assert (=> b!1522272 (=> (not res!1040500) (not e!849283))))

(declare-fun b!1522273 () Bool)

(assert (=> b!1522273 (and (bvsge (index!54221 lt!659757) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659757) (size!49443 a!2804)))))

(declare-fun res!1040499 () Bool)

(assert (=> b!1522273 (= res!1040499 (= (select (arr!48892 a!2804) (index!54221 lt!659757)) (select (arr!48892 a!2804) j!70)))))

(declare-fun e!849284 () Bool)

(assert (=> b!1522273 (=> res!1040499 e!849284)))

(assert (=> b!1522273 (= e!849283 e!849284)))

(declare-fun d!159461 () Bool)

(assert (=> d!159461 e!849281))

(declare-fun c!140442 () Bool)

(assert (=> d!159461 (= c!140442 (and ((_ is Intermediate!12956) lt!659757) (undefined!13768 lt!659757)))))

(declare-fun e!849280 () SeekEntryResult!12956)

(assert (=> d!159461 (= lt!659757 e!849280)))

(declare-fun c!140443 () Bool)

(assert (=> d!159461 (= c!140443 (bvsge (bvadd x!534 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!659756 () (_ BitVec 64))

(assert (=> d!159461 (= lt!659756 (select (arr!48892 a!2804) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512)))))

(assert (=> d!159461 (validMask!0 mask!2512)))

(assert (=> d!159461 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48892 a!2804) j!70) a!2804 mask!2512) lt!659757)))

(declare-fun b!1522274 () Bool)

(assert (=> b!1522274 (= e!849280 e!849282)))

(declare-fun c!140441 () Bool)

(assert (=> b!1522274 (= c!140441 (or (= lt!659756 (select (arr!48892 a!2804) j!70)) (= (bvadd lt!659756 lt!659756) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522275 () Bool)

(assert (=> b!1522275 (and (bvsge (index!54221 lt!659757) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659757) (size!49443 a!2804)))))

(declare-fun res!1040501 () Bool)

(assert (=> b!1522275 (= res!1040501 (= (select (arr!48892 a!2804) (index!54221 lt!659757)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522275 (=> res!1040501 e!849284)))

(declare-fun b!1522276 () Bool)

(assert (=> b!1522276 (and (bvsge (index!54221 lt!659757) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659757) (size!49443 a!2804)))))

(assert (=> b!1522276 (= e!849284 (= (select (arr!48892 a!2804) (index!54221 lt!659757)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522277 () Bool)

(assert (=> b!1522277 (= e!849280 (Intermediate!12956 true (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1522278 () Bool)

(assert (=> b!1522278 (= e!849282 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (bvadd x!534 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2512) (select (arr!48892 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522279 () Bool)

(assert (=> b!1522279 (= e!849281 (bvsge (x!136093 lt!659757) #b01111111111111111111111111111110))))

(assert (= (and d!159461 c!140443) b!1522277))

(assert (= (and d!159461 (not c!140443)) b!1522274))

(assert (= (and b!1522274 c!140441) b!1522271))

(assert (= (and b!1522274 (not c!140441)) b!1522278))

(assert (= (and d!159461 c!140442) b!1522279))

(assert (= (and d!159461 (not c!140442)) b!1522272))

(assert (= (and b!1522272 res!1040500) b!1522273))

(assert (= (and b!1522273 (not res!1040499)) b!1522275))

(assert (= (and b!1522275 (not res!1040501)) b!1522276))

(assert (=> b!1522278 m!1405239))

(declare-fun m!1405477 () Bool)

(assert (=> b!1522278 m!1405477))

(assert (=> b!1522278 m!1405477))

(assert (=> b!1522278 m!1404995))

(declare-fun m!1405479 () Bool)

(assert (=> b!1522278 m!1405479))

(declare-fun m!1405481 () Bool)

(assert (=> b!1522276 m!1405481))

(assert (=> d!159461 m!1405239))

(declare-fun m!1405483 () Bool)

(assert (=> d!159461 m!1405483))

(assert (=> d!159461 m!1404987))

(assert (=> b!1522273 m!1405481))

(assert (=> b!1522275 m!1405481))

(assert (=> b!1522044 d!159461))

(declare-fun d!159463 () Bool)

(declare-fun lt!659760 () (_ BitVec 32))

(assert (=> d!159463 (and (bvsge lt!659760 #b00000000000000000000000000000000) (bvslt lt!659760 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159463 (= lt!659760 (choose!52 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512))))

(assert (=> d!159463 (validMask!0 mask!2512)))

(assert (=> d!159463 (= (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) lt!659760)))

(declare-fun bs!43638 () Bool)

(assert (= bs!43638 d!159463))

(declare-fun m!1405485 () Bool)

(assert (=> bs!43638 m!1405485))

(assert (=> bs!43638 m!1404987))

(assert (=> b!1522044 d!159463))

(assert (=> b!1521975 d!159309))

(declare-fun d!159465 () Bool)

(assert (=> d!159465 (= (validKeyInArray!0 (select (arr!48892 a!2804) #b00000000000000000000000000000000)) (and (not (= (select (arr!48892 a!2804) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48892 a!2804) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1521803 d!159465))

(assert (=> b!1522029 d!159465))

(declare-fun bm!68461 () Bool)

(declare-fun call!68464 () Bool)

(assert (=> bm!68461 (= call!68464 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1522280 () Bool)

(declare-fun e!849285 () Bool)

(declare-fun e!849287 () Bool)

(assert (=> b!1522280 (= e!849285 e!849287)))

(declare-fun c!140444 () Bool)

(assert (=> b!1522280 (= c!140444 (validKeyInArray!0 (select (arr!48892 a!2804) (bvadd j!70 #b00000000000000000000000000000001))))))

(declare-fun b!1522282 () Bool)

(declare-fun e!849286 () Bool)

(assert (=> b!1522282 (= e!849287 e!849286)))

(declare-fun lt!659761 () (_ BitVec 64))

(assert (=> b!1522282 (= lt!659761 (select (arr!48892 a!2804) (bvadd j!70 #b00000000000000000000000000000001)))))

(declare-fun lt!659762 () Unit!50815)

(assert (=> b!1522282 (= lt!659762 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659761 (bvadd j!70 #b00000000000000000000000000000001)))))

(assert (=> b!1522282 (arrayContainsKey!0 a!2804 lt!659761 #b00000000000000000000000000000000)))

(declare-fun lt!659763 () Unit!50815)

(assert (=> b!1522282 (= lt!659763 lt!659762)))

(declare-fun res!1040503 () Bool)

(assert (=> b!1522282 (= res!1040503 (= (seekEntryOrOpen!0 (select (arr!48892 a!2804) (bvadd j!70 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!12956 (bvadd j!70 #b00000000000000000000000000000001))))))

(assert (=> b!1522282 (=> (not res!1040503) (not e!849286))))

(declare-fun b!1522283 () Bool)

(assert (=> b!1522283 (= e!849287 call!68464)))

(declare-fun d!159467 () Bool)

(declare-fun res!1040502 () Bool)

(assert (=> d!159467 (=> res!1040502 e!849285)))

(assert (=> d!159467 (= res!1040502 (bvsge (bvadd j!70 #b00000000000000000000000000000001) (size!49443 a!2804)))))

(assert (=> d!159467 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512) e!849285)))

(declare-fun b!1522281 () Bool)

(assert (=> b!1522281 (= e!849286 call!68464)))

(assert (= (and d!159467 (not res!1040502)) b!1522280))

(assert (= (and b!1522280 c!140444) b!1522282))

(assert (= (and b!1522280 (not c!140444)) b!1522283))

(assert (= (and b!1522282 res!1040503) b!1522281))

(assert (= (or b!1522281 b!1522283) bm!68461))

(declare-fun m!1405487 () Bool)

(assert (=> bm!68461 m!1405487))

(declare-fun m!1405489 () Bool)

(assert (=> b!1522280 m!1405489))

(assert (=> b!1522280 m!1405489))

(declare-fun m!1405491 () Bool)

(assert (=> b!1522280 m!1405491))

(assert (=> b!1522282 m!1405489))

(declare-fun m!1405493 () Bool)

(assert (=> b!1522282 m!1405493))

(declare-fun m!1405495 () Bool)

(assert (=> b!1522282 m!1405495))

(assert (=> b!1522282 m!1405489))

(declare-fun m!1405497 () Bool)

(assert (=> b!1522282 m!1405497))

(assert (=> bm!68451 d!159467))

(assert (=> d!159303 d!159311))

(assert (=> d!159303 d!159321))

(assert (=> d!159303 d!159349))

(declare-fun bm!68462 () Bool)

(declare-fun call!68465 () Bool)

(assert (=> bm!68462 (= call!68465 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1522284 () Bool)

(declare-fun e!849288 () Bool)

(declare-fun e!849290 () Bool)

(assert (=> b!1522284 (= e!849288 e!849290)))

(declare-fun c!140445 () Bool)

(assert (=> b!1522284 (= c!140445 (validKeyInArray!0 (select (arr!48892 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1522286 () Bool)

(declare-fun e!849289 () Bool)

(assert (=> b!1522286 (= e!849290 e!849289)))

(declare-fun lt!659764 () (_ BitVec 64))

(assert (=> b!1522286 (= lt!659764 (select (arr!48892 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!659765 () Unit!50815)

(assert (=> b!1522286 (= lt!659765 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659764 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1522286 (arrayContainsKey!0 a!2804 lt!659764 #b00000000000000000000000000000000)))

(declare-fun lt!659766 () Unit!50815)

(assert (=> b!1522286 (= lt!659766 lt!659765)))

(declare-fun res!1040505 () Bool)

(assert (=> b!1522286 (= res!1040505 (= (seekEntryOrOpen!0 (select (arr!48892 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!12956 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1522286 (=> (not res!1040505) (not e!849289))))

(declare-fun b!1522287 () Bool)

(assert (=> b!1522287 (= e!849290 call!68465)))

(declare-fun d!159469 () Bool)

(declare-fun res!1040504 () Bool)

(assert (=> d!159469 (=> res!1040504 e!849288)))

(assert (=> d!159469 (= res!1040504 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49443 a!2804)))))

(assert (=> d!159469 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512) e!849288)))

(declare-fun b!1522285 () Bool)

(assert (=> b!1522285 (= e!849289 call!68465)))

(assert (= (and d!159469 (not res!1040504)) b!1522284))

(assert (= (and b!1522284 c!140445) b!1522286))

(assert (= (and b!1522284 (not c!140445)) b!1522287))

(assert (= (and b!1522286 res!1040505) b!1522285))

(assert (= (or b!1522285 b!1522287) bm!68462))

(declare-fun m!1405499 () Bool)

(assert (=> bm!68462 m!1405499))

(declare-fun m!1405501 () Bool)

(assert (=> b!1522284 m!1405501))

(assert (=> b!1522284 m!1405501))

(declare-fun m!1405503 () Bool)

(assert (=> b!1522284 m!1405503))

(assert (=> b!1522286 m!1405501))

(declare-fun m!1405505 () Bool)

(assert (=> b!1522286 m!1405505))

(declare-fun m!1405507 () Bool)

(assert (=> b!1522286 m!1405507))

(assert (=> b!1522286 m!1405501))

(declare-fun m!1405509 () Bool)

(assert (=> b!1522286 m!1405509))

(assert (=> bm!68453 d!159469))

(declare-fun b!1522300 () Bool)

(declare-fun e!849297 () SeekEntryResult!12956)

(assert (=> b!1522300 (= e!849297 (Found!12956 (index!54221 lt!659548)))))

(declare-fun d!159471 () Bool)

(declare-fun lt!659771 () SeekEntryResult!12956)

(assert (=> d!159471 (and (or ((_ is Undefined!12956) lt!659771) (not ((_ is Found!12956) lt!659771)) (and (bvsge (index!54220 lt!659771) #b00000000000000000000000000000000) (bvslt (index!54220 lt!659771) (size!49443 a!2804)))) (or ((_ is Undefined!12956) lt!659771) ((_ is Found!12956) lt!659771) (not ((_ is MissingVacant!12956) lt!659771)) (not (= (index!54222 lt!659771) (index!54221 lt!659548))) (and (bvsge (index!54222 lt!659771) #b00000000000000000000000000000000) (bvslt (index!54222 lt!659771) (size!49443 a!2804)))) (or ((_ is Undefined!12956) lt!659771) (ite ((_ is Found!12956) lt!659771) (= (select (arr!48892 a!2804) (index!54220 lt!659771)) (select (arr!48892 a!2804) j!70)) (and ((_ is MissingVacant!12956) lt!659771) (= (index!54222 lt!659771) (index!54221 lt!659548)) (= (select (arr!48892 a!2804) (index!54222 lt!659771)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!849299 () SeekEntryResult!12956)

(assert (=> d!159471 (= lt!659771 e!849299)))

(declare-fun c!140452 () Bool)

(assert (=> d!159471 (= c!140452 (bvsge (x!136093 lt!659548) #b01111111111111111111111111111110))))

(declare-fun lt!659772 () (_ BitVec 64))

(assert (=> d!159471 (= lt!659772 (select (arr!48892 a!2804) (index!54221 lt!659548)))))

(assert (=> d!159471 (validMask!0 mask!2512)))

(assert (=> d!159471 (= (seekKeyOrZeroReturnVacant!0 (x!136093 lt!659548) (index!54221 lt!659548) (index!54221 lt!659548) (select (arr!48892 a!2804) j!70) a!2804 mask!2512) lt!659771)))

(declare-fun b!1522301 () Bool)

(declare-fun e!849298 () SeekEntryResult!12956)

(assert (=> b!1522301 (= e!849298 (MissingVacant!12956 (index!54221 lt!659548)))))

(declare-fun b!1522302 () Bool)

(assert (=> b!1522302 (= e!849299 Undefined!12956)))

(declare-fun b!1522303 () Bool)

(declare-fun c!140454 () Bool)

(assert (=> b!1522303 (= c!140454 (= lt!659772 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522303 (= e!849297 e!849298)))

(declare-fun b!1522304 () Bool)

(assert (=> b!1522304 (= e!849298 (seekKeyOrZeroReturnVacant!0 (bvadd (x!136093 lt!659548) #b00000000000000000000000000000001) (nextIndex!0 (index!54221 lt!659548) (bvadd (x!136093 lt!659548) #b00000000000000000000000000000001) mask!2512) (index!54221 lt!659548) (select (arr!48892 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522305 () Bool)

(assert (=> b!1522305 (= e!849299 e!849297)))

(declare-fun c!140453 () Bool)

(assert (=> b!1522305 (= c!140453 (= lt!659772 (select (arr!48892 a!2804) j!70)))))

(assert (= (and d!159471 c!140452) b!1522302))

(assert (= (and d!159471 (not c!140452)) b!1522305))

(assert (= (and b!1522305 c!140453) b!1522300))

(assert (= (and b!1522305 (not c!140453)) b!1522303))

(assert (= (and b!1522303 c!140454) b!1522301))

(assert (= (and b!1522303 (not c!140454)) b!1522304))

(declare-fun m!1405511 () Bool)

(assert (=> d!159471 m!1405511))

(declare-fun m!1405513 () Bool)

(assert (=> d!159471 m!1405513))

(assert (=> d!159471 m!1405107))

(assert (=> d!159471 m!1404987))

(declare-fun m!1405515 () Bool)

(assert (=> b!1522304 m!1405515))

(assert (=> b!1522304 m!1405515))

(assert (=> b!1522304 m!1404995))

(declare-fun m!1405517 () Bool)

(assert (=> b!1522304 m!1405517))

(assert (=> b!1521836 d!159471))

(assert (=> b!1521801 d!159465))

(declare-fun e!849302 () SeekEntryResult!12956)

(declare-fun b!1522306 () Bool)

(assert (=> b!1522306 (= e!849302 (Intermediate!12956 false (nextIndex!0 (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522307 () Bool)

(declare-fun e!849301 () Bool)

(declare-fun e!849303 () Bool)

(assert (=> b!1522307 (= e!849301 e!849303)))

(declare-fun res!1040507 () Bool)

(declare-fun lt!659774 () SeekEntryResult!12956)

(assert (=> b!1522307 (= res!1040507 (and ((_ is Intermediate!12956) lt!659774) (not (undefined!13768 lt!659774)) (bvslt (x!136093 lt!659774) #b01111111111111111111111111111110) (bvsge (x!136093 lt!659774) #b00000000000000000000000000000000) (bvsge (x!136093 lt!659774) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1522307 (=> (not res!1040507) (not e!849303))))

(declare-fun b!1522308 () Bool)

(assert (=> b!1522308 (and (bvsge (index!54221 lt!659774) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659774) (size!49443 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804)))))))

(declare-fun res!1040506 () Bool)

(assert (=> b!1522308 (= res!1040506 (= (select (arr!48892 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804))) (index!54221 lt!659774)) (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!849304 () Bool)

(assert (=> b!1522308 (=> res!1040506 e!849304)))

(assert (=> b!1522308 (= e!849303 e!849304)))

(declare-fun d!159473 () Bool)

(assert (=> d!159473 e!849301))

(declare-fun c!140456 () Bool)

(assert (=> d!159473 (= c!140456 (and ((_ is Intermediate!12956) lt!659774) (undefined!13768 lt!659774)))))

(declare-fun e!849300 () SeekEntryResult!12956)

(assert (=> d!159473 (= lt!659774 e!849300)))

(declare-fun c!140457 () Bool)

(assert (=> d!159473 (= c!140457 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!659773 () (_ BitVec 64))

(assert (=> d!159473 (= lt!659773 (select (arr!48892 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804))) (nextIndex!0 (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512)))))

(assert (=> d!159473 (validMask!0 mask!2512)))

(assert (=> d!159473 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804)) mask!2512) lt!659774)))

(declare-fun b!1522309 () Bool)

(assert (=> b!1522309 (= e!849300 e!849302)))

(declare-fun c!140455 () Bool)

(assert (=> b!1522309 (= c!140455 (or (= lt!659773 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659773 lt!659773) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522310 () Bool)

(assert (=> b!1522310 (and (bvsge (index!54221 lt!659774) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659774) (size!49443 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804)))))))

(declare-fun res!1040508 () Bool)

(assert (=> b!1522310 (= res!1040508 (= (select (arr!48892 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804))) (index!54221 lt!659774)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522310 (=> res!1040508 e!849304)))

(declare-fun b!1522311 () Bool)

(assert (=> b!1522311 (and (bvsge (index!54221 lt!659774) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659774) (size!49443 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804)))))))

(assert (=> b!1522311 (= e!849304 (= (select (arr!48892 (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804))) (index!54221 lt!659774)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522312 () Bool)

(assert (=> b!1522312 (= e!849300 (Intermediate!12956 true (nextIndex!0 (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522313 () Bool)

(assert (=> b!1522313 (= e!849302 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101324 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804)) mask!2512))))

(declare-fun b!1522314 () Bool)

(assert (=> b!1522314 (= e!849301 (bvsge (x!136093 lt!659774) #b01111111111111111111111111111110))))

(assert (= (and d!159473 c!140457) b!1522312))

(assert (= (and d!159473 (not c!140457)) b!1522309))

(assert (= (and b!1522309 c!140455) b!1522306))

(assert (= (and b!1522309 (not c!140455)) b!1522313))

(assert (= (and d!159473 c!140456) b!1522314))

(assert (= (and d!159473 (not c!140456)) b!1522307))

(assert (= (and b!1522307 res!1040507) b!1522308))

(assert (= (and b!1522308 (not res!1040506)) b!1522310))

(assert (= (and b!1522310 (not res!1040508)) b!1522311))

(assert (=> b!1522313 m!1405153))

(declare-fun m!1405519 () Bool)

(assert (=> b!1522313 m!1405519))

(assert (=> b!1522313 m!1405519))

(assert (=> b!1522313 m!1405001))

(declare-fun m!1405521 () Bool)

(assert (=> b!1522313 m!1405521))

(declare-fun m!1405523 () Bool)

(assert (=> b!1522311 m!1405523))

(assert (=> d!159473 m!1405153))

(declare-fun m!1405525 () Bool)

(assert (=> d!159473 m!1405525))

(assert (=> d!159473 m!1404987))

(assert (=> b!1522308 m!1405523))

(assert (=> b!1522310 m!1405523))

(assert (=> b!1521932 d!159473))

(declare-fun d!159475 () Bool)

(declare-fun lt!659775 () (_ BitVec 32))

(assert (=> d!159475 (and (bvsge lt!659775 #b00000000000000000000000000000000) (bvslt lt!659775 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!159475 (= lt!659775 (choose!52 (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512))))

(assert (=> d!159475 (validMask!0 mask!2512)))

(assert (=> d!159475 (= (nextIndex!0 (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) lt!659775)))

(declare-fun bs!43639 () Bool)

(assert (= bs!43639 d!159475))

(assert (=> bs!43639 m!1405015))

(declare-fun m!1405527 () Bool)

(assert (=> bs!43639 m!1405527))

(assert (=> bs!43639 m!1404987))

(assert (=> b!1521932 d!159475))

(declare-fun e!849307 () SeekEntryResult!12956)

(declare-fun b!1522315 () Bool)

(assert (=> b!1522315 (= e!849307 (Intermediate!12956 false (nextIndex!0 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522316 () Bool)

(declare-fun e!849306 () Bool)

(declare-fun e!849308 () Bool)

(assert (=> b!1522316 (= e!849306 e!849308)))

(declare-fun res!1040510 () Bool)

(declare-fun lt!659777 () SeekEntryResult!12956)

(assert (=> b!1522316 (= res!1040510 (and ((_ is Intermediate!12956) lt!659777) (not (undefined!13768 lt!659777)) (bvslt (x!136093 lt!659777) #b01111111111111111111111111111110) (bvsge (x!136093 lt!659777) #b00000000000000000000000000000000) (bvsge (x!136093 lt!659777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1522316 (=> (not res!1040510) (not e!849308))))

(declare-fun b!1522317 () Bool)

(assert (=> b!1522317 (and (bvsge (index!54221 lt!659777) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659777) (size!49443 a!2804)))))

(declare-fun res!1040509 () Bool)

(assert (=> b!1522317 (= res!1040509 (= (select (arr!48892 a!2804) (index!54221 lt!659777)) (select (arr!48892 a!2804) j!70)))))

(declare-fun e!849309 () Bool)

(assert (=> b!1522317 (=> res!1040509 e!849309)))

(assert (=> b!1522317 (= e!849308 e!849309)))

(declare-fun d!159477 () Bool)

(assert (=> d!159477 e!849306))

(declare-fun c!140459 () Bool)

(assert (=> d!159477 (= c!140459 (and ((_ is Intermediate!12956) lt!659777) (undefined!13768 lt!659777)))))

(declare-fun e!849305 () SeekEntryResult!12956)

(assert (=> d!159477 (= lt!659777 e!849305)))

(declare-fun c!140460 () Bool)

(assert (=> d!159477 (= c!140460 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!659776 () (_ BitVec 64))

(assert (=> d!159477 (= lt!659776 (select (arr!48892 a!2804) (nextIndex!0 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512)))))

(assert (=> d!159477 (validMask!0 mask!2512)))

(assert (=> d!159477 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48892 a!2804) j!70) a!2804 mask!2512) lt!659777)))

(declare-fun b!1522318 () Bool)

(assert (=> b!1522318 (= e!849305 e!849307)))

(declare-fun c!140458 () Bool)

(assert (=> b!1522318 (= c!140458 (or (= lt!659776 (select (arr!48892 a!2804) j!70)) (= (bvadd lt!659776 lt!659776) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522319 () Bool)

(assert (=> b!1522319 (and (bvsge (index!54221 lt!659777) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659777) (size!49443 a!2804)))))

(declare-fun res!1040511 () Bool)

(assert (=> b!1522319 (= res!1040511 (= (select (arr!48892 a!2804) (index!54221 lt!659777)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522319 (=> res!1040511 e!849309)))

(declare-fun b!1522320 () Bool)

(assert (=> b!1522320 (and (bvsge (index!54221 lt!659777) #b00000000000000000000000000000000) (bvslt (index!54221 lt!659777) (size!49443 a!2804)))))

(assert (=> b!1522320 (= e!849309 (= (select (arr!48892 a!2804) (index!54221 lt!659777)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522321 () Bool)

(assert (=> b!1522321 (= e!849305 (Intermediate!12956 true (nextIndex!0 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522322 () Bool)

(assert (=> b!1522322 (= e!849307 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2512) (select (arr!48892 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522323 () Bool)

(assert (=> b!1522323 (= e!849306 (bvsge (x!136093 lt!659777) #b01111111111111111111111111111110))))

(assert (= (and d!159477 c!140460) b!1522321))

(assert (= (and d!159477 (not c!140460)) b!1522318))

(assert (= (and b!1522318 c!140458) b!1522315))

(assert (= (and b!1522318 (not c!140458)) b!1522322))

(assert (= (and d!159477 c!140459) b!1522323))

(assert (= (and d!159477 (not c!140459)) b!1522316))

(assert (= (and b!1522316 res!1040510) b!1522317))

(assert (= (and b!1522317 (not res!1040509)) b!1522319))

(assert (= (and b!1522319 (not res!1040511)) b!1522320))

(assert (=> b!1522322 m!1405137))

(declare-fun m!1405529 () Bool)

(assert (=> b!1522322 m!1405529))

(assert (=> b!1522322 m!1405529))

(assert (=> b!1522322 m!1404995))

(declare-fun m!1405531 () Bool)

(assert (=> b!1522322 m!1405531))

(declare-fun m!1405533 () Bool)

(assert (=> b!1522320 m!1405533))

(assert (=> d!159477 m!1405137))

(declare-fun m!1405535 () Bool)

(assert (=> d!159477 m!1405535))

(assert (=> d!159477 m!1404987))

(assert (=> b!1522317 m!1405533))

(assert (=> b!1522319 m!1405533))

(assert (=> b!1521906 d!159477))

(declare-fun d!159479 () Bool)

(declare-fun lt!659778 () (_ BitVec 32))

(assert (=> d!159479 (and (bvsge lt!659778 #b00000000000000000000000000000000) (bvslt lt!659778 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!159479 (= lt!659778 (choose!52 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512))))

(assert (=> d!159479 (validMask!0 mask!2512)))

(assert (=> d!159479 (= (nextIndex!0 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) lt!659778)))

(declare-fun bs!43640 () Bool)

(assert (= bs!43640 d!159479))

(assert (=> bs!43640 m!1405005))

(declare-fun m!1405537 () Bool)

(assert (=> bs!43640 m!1405537))

(assert (=> bs!43640 m!1404987))

(assert (=> b!1521906 d!159479))

(assert (=> d!159325 d!159349))

(declare-fun d!159481 () Bool)

(assert (=> d!159481 (arrayContainsKey!0 a!2804 lt!659616 #b00000000000000000000000000000000)))

(declare-fun lt!659781 () Unit!50815)

(declare-fun choose!13 (array!101323 (_ BitVec 64) (_ BitVec 32)) Unit!50815)

(assert (=> d!159481 (= lt!659781 (choose!13 a!2804 lt!659616 j!70))))

(assert (=> d!159481 (bvsge j!70 #b00000000000000000000000000000000)))

(assert (=> d!159481 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659616 j!70) lt!659781)))

(declare-fun bs!43641 () Bool)

(assert (= bs!43641 d!159481))

(assert (=> bs!43641 m!1405183))

(declare-fun m!1405539 () Bool)

(assert (=> bs!43641 m!1405539))

(assert (=> b!1521977 d!159481))

(declare-fun d!159483 () Bool)

(declare-fun res!1040516 () Bool)

(declare-fun e!849314 () Bool)

(assert (=> d!159483 (=> res!1040516 e!849314)))

(assert (=> d!159483 (= res!1040516 (= (select (arr!48892 a!2804) #b00000000000000000000000000000000) lt!659616))))

(assert (=> d!159483 (= (arrayContainsKey!0 a!2804 lt!659616 #b00000000000000000000000000000000) e!849314)))

(declare-fun b!1522328 () Bool)

(declare-fun e!849315 () Bool)

(assert (=> b!1522328 (= e!849314 e!849315)))

(declare-fun res!1040517 () Bool)

(assert (=> b!1522328 (=> (not res!1040517) (not e!849315))))

(assert (=> b!1522328 (= res!1040517 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49443 a!2804)))))

(declare-fun b!1522329 () Bool)

(assert (=> b!1522329 (= e!849315 (arrayContainsKey!0 a!2804 lt!659616 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!159483 (not res!1040516)) b!1522328))

(assert (= (and b!1522328 res!1040517) b!1522329))

(assert (=> d!159483 m!1405095))

(declare-fun m!1405541 () Bool)

(assert (=> b!1522329 m!1405541))

(assert (=> b!1521977 d!159483))

(declare-fun b!1522342 () Bool)

(declare-fun e!849323 () SeekEntryResult!12956)

(assert (=> b!1522342 (= e!849323 Undefined!12956)))

(declare-fun b!1522343 () Bool)

(declare-fun e!849324 () SeekEntryResult!12956)

(assert (=> b!1522343 (= e!849323 e!849324)))

(declare-fun lt!659790 () (_ BitVec 64))

(declare-fun lt!659788 () SeekEntryResult!12956)

(assert (=> b!1522343 (= lt!659790 (select (arr!48892 a!2804) (index!54221 lt!659788)))))

(declare-fun c!140467 () Bool)

(assert (=> b!1522343 (= c!140467 (= lt!659790 (select (arr!48892 a!2804) j!70)))))

(declare-fun b!1522344 () Bool)

(declare-fun e!849322 () SeekEntryResult!12956)

(assert (=> b!1522344 (= e!849322 (seekKeyOrZeroReturnVacant!0 (x!136093 lt!659788) (index!54221 lt!659788) (index!54221 lt!659788) (select (arr!48892 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159485 () Bool)

(declare-fun lt!659789 () SeekEntryResult!12956)

(assert (=> d!159485 (and (or ((_ is Undefined!12956) lt!659789) (not ((_ is Found!12956) lt!659789)) (and (bvsge (index!54220 lt!659789) #b00000000000000000000000000000000) (bvslt (index!54220 lt!659789) (size!49443 a!2804)))) (or ((_ is Undefined!12956) lt!659789) ((_ is Found!12956) lt!659789) (not ((_ is MissingZero!12956) lt!659789)) (and (bvsge (index!54219 lt!659789) #b00000000000000000000000000000000) (bvslt (index!54219 lt!659789) (size!49443 a!2804)))) (or ((_ is Undefined!12956) lt!659789) ((_ is Found!12956) lt!659789) ((_ is MissingZero!12956) lt!659789) (not ((_ is MissingVacant!12956) lt!659789)) (and (bvsge (index!54222 lt!659789) #b00000000000000000000000000000000) (bvslt (index!54222 lt!659789) (size!49443 a!2804)))) (or ((_ is Undefined!12956) lt!659789) (ite ((_ is Found!12956) lt!659789) (= (select (arr!48892 a!2804) (index!54220 lt!659789)) (select (arr!48892 a!2804) j!70)) (ite ((_ is MissingZero!12956) lt!659789) (= (select (arr!48892 a!2804) (index!54219 lt!659789)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12956) lt!659789) (= (select (arr!48892 a!2804) (index!54222 lt!659789)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159485 (= lt!659789 e!849323)))

(declare-fun c!140469 () Bool)

(assert (=> d!159485 (= c!140469 (and ((_ is Intermediate!12956) lt!659788) (undefined!13768 lt!659788)))))

(assert (=> d!159485 (= lt!659788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (select (arr!48892 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159485 (validMask!0 mask!2512)))

(assert (=> d!159485 (= (seekEntryOrOpen!0 (select (arr!48892 a!2804) j!70) a!2804 mask!2512) lt!659789)))

(declare-fun b!1522345 () Bool)

(assert (=> b!1522345 (= e!849322 (MissingZero!12956 (index!54221 lt!659788)))))

(declare-fun b!1522346 () Bool)

(assert (=> b!1522346 (= e!849324 (Found!12956 (index!54221 lt!659788)))))

(declare-fun b!1522347 () Bool)

(declare-fun c!140468 () Bool)

(assert (=> b!1522347 (= c!140468 (= lt!659790 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522347 (= e!849324 e!849322)))

(assert (= (and d!159485 c!140469) b!1522342))

(assert (= (and d!159485 (not c!140469)) b!1522343))

(assert (= (and b!1522343 c!140467) b!1522346))

(assert (= (and b!1522343 (not c!140467)) b!1522347))

(assert (= (and b!1522347 c!140468) b!1522345))

(assert (= (and b!1522347 (not c!140468)) b!1522344))

(declare-fun m!1405543 () Bool)

(assert (=> b!1522343 m!1405543))

(assert (=> b!1522344 m!1404995))

(declare-fun m!1405545 () Bool)

(assert (=> b!1522344 m!1405545))

(declare-fun m!1405547 () Bool)

(assert (=> d!159485 m!1405547))

(declare-fun m!1405549 () Bool)

(assert (=> d!159485 m!1405549))

(assert (=> d!159485 m!1404995))

(assert (=> d!159485 m!1405005))

(assert (=> d!159485 m!1404987))

(assert (=> d!159485 m!1405005))

(assert (=> d!159485 m!1404995))

(assert (=> d!159485 m!1405007))

(declare-fun m!1405551 () Bool)

(assert (=> d!159485 m!1405551))

(assert (=> b!1521977 d!159485))

(declare-fun b!1522348 () Bool)

(declare-fun e!849327 () Bool)

(declare-fun e!849326 () Bool)

(assert (=> b!1522348 (= e!849327 e!849326)))

(declare-fun res!1040518 () Bool)

(assert (=> b!1522348 (=> (not res!1040518) (not e!849326))))

(declare-fun e!849328 () Bool)

(assert (=> b!1522348 (= res!1040518 (not e!849328))))

(declare-fun res!1040520 () Bool)

(assert (=> b!1522348 (=> (not res!1040520) (not e!849328))))

(assert (=> b!1522348 (= res!1040520 (validKeyInArray!0 (select (arr!48892 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!159487 () Bool)

(declare-fun res!1040519 () Bool)

(assert (=> d!159487 (=> res!1040519 e!849327)))

(assert (=> d!159487 (= res!1040519 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49443 a!2804)))))

(assert (=> d!159487 (= (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140284 (Cons!35358 (select (arr!48892 a!2804) #b00000000000000000000000000000000) Nil!35359) Nil!35359)) e!849327)))

(declare-fun bm!68463 () Bool)

(declare-fun c!140470 () Bool)

(declare-fun call!68466 () Bool)

(assert (=> bm!68463 (= call!68466 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!140470 (Cons!35358 (select (arr!48892 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!140284 (Cons!35358 (select (arr!48892 a!2804) #b00000000000000000000000000000000) Nil!35359) Nil!35359)) (ite c!140284 (Cons!35358 (select (arr!48892 a!2804) #b00000000000000000000000000000000) Nil!35359) Nil!35359))))))

(declare-fun b!1522349 () Bool)

(declare-fun e!849325 () Bool)

(assert (=> b!1522349 (= e!849325 call!68466)))

(declare-fun b!1522350 () Bool)

(assert (=> b!1522350 (= e!849326 e!849325)))

(assert (=> b!1522350 (= c!140470 (validKeyInArray!0 (select (arr!48892 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1522351 () Bool)

(assert (=> b!1522351 (= e!849325 call!68466)))

(declare-fun b!1522352 () Bool)

(assert (=> b!1522352 (= e!849328 (contains!10024 (ite c!140284 (Cons!35358 (select (arr!48892 a!2804) #b00000000000000000000000000000000) Nil!35359) Nil!35359) (select (arr!48892 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!159487 (not res!1040519)) b!1522348))

(assert (= (and b!1522348 res!1040520) b!1522352))

(assert (= (and b!1522348 res!1040518) b!1522350))

(assert (= (and b!1522350 c!140470) b!1522351))

(assert (= (and b!1522350 (not c!140470)) b!1522349))

(assert (= (or b!1522351 b!1522349) bm!68463))

(assert (=> b!1522348 m!1405501))

(assert (=> b!1522348 m!1405501))

(assert (=> b!1522348 m!1405503))

(assert (=> bm!68463 m!1405501))

(declare-fun m!1405553 () Bool)

(assert (=> bm!68463 m!1405553))

(assert (=> b!1522350 m!1405501))

(assert (=> b!1522350 m!1405501))

(assert (=> b!1522350 m!1405503))

(assert (=> b!1522352 m!1405501))

(assert (=> b!1522352 m!1405501))

(declare-fun m!1405555 () Bool)

(assert (=> b!1522352 m!1405555))

(assert (=> bm!68436 d!159487))

(declare-fun d!159489 () Bool)

(assert (=> d!159489 (arrayContainsKey!0 a!2804 lt!659642 #b00000000000000000000000000000000)))

(declare-fun lt!659791 () Unit!50815)

(assert (=> d!159489 (= lt!659791 (choose!13 a!2804 lt!659642 #b00000000000000000000000000000000))))

(assert (=> d!159489 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!159489 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659642 #b00000000000000000000000000000000) lt!659791)))

(declare-fun bs!43642 () Bool)

(assert (= bs!43642 d!159489))

(assert (=> bs!43642 m!1405227))

(declare-fun m!1405557 () Bool)

(assert (=> bs!43642 m!1405557))

(assert (=> b!1522031 d!159489))

(declare-fun d!159491 () Bool)

(declare-fun res!1040521 () Bool)

(declare-fun e!849329 () Bool)

(assert (=> d!159491 (=> res!1040521 e!849329)))

(assert (=> d!159491 (= res!1040521 (= (select (arr!48892 a!2804) #b00000000000000000000000000000000) lt!659642))))

(assert (=> d!159491 (= (arrayContainsKey!0 a!2804 lt!659642 #b00000000000000000000000000000000) e!849329)))

(declare-fun b!1522353 () Bool)

(declare-fun e!849330 () Bool)

(assert (=> b!1522353 (= e!849329 e!849330)))

(declare-fun res!1040522 () Bool)

(assert (=> b!1522353 (=> (not res!1040522) (not e!849330))))

(assert (=> b!1522353 (= res!1040522 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49443 a!2804)))))

(declare-fun b!1522354 () Bool)

(assert (=> b!1522354 (= e!849330 (arrayContainsKey!0 a!2804 lt!659642 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!159491 (not res!1040521)) b!1522353))

(assert (= (and b!1522353 res!1040522) b!1522354))

(assert (=> d!159491 m!1405095))

(declare-fun m!1405559 () Bool)

(assert (=> b!1522354 m!1405559))

(assert (=> b!1522031 d!159491))

(declare-fun b!1522355 () Bool)

(declare-fun e!849332 () SeekEntryResult!12956)

(assert (=> b!1522355 (= e!849332 Undefined!12956)))

(declare-fun b!1522356 () Bool)

(declare-fun e!849333 () SeekEntryResult!12956)

(assert (=> b!1522356 (= e!849332 e!849333)))

(declare-fun lt!659794 () (_ BitVec 64))

(declare-fun lt!659792 () SeekEntryResult!12956)

(assert (=> b!1522356 (= lt!659794 (select (arr!48892 a!2804) (index!54221 lt!659792)))))

(declare-fun c!140471 () Bool)

(assert (=> b!1522356 (= c!140471 (= lt!659794 (select (arr!48892 a!2804) #b00000000000000000000000000000000)))))

(declare-fun e!849331 () SeekEntryResult!12956)

(declare-fun b!1522357 () Bool)

(assert (=> b!1522357 (= e!849331 (seekKeyOrZeroReturnVacant!0 (x!136093 lt!659792) (index!54221 lt!659792) (index!54221 lt!659792) (select (arr!48892 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(declare-fun d!159493 () Bool)

(declare-fun lt!659793 () SeekEntryResult!12956)

(assert (=> d!159493 (and (or ((_ is Undefined!12956) lt!659793) (not ((_ is Found!12956) lt!659793)) (and (bvsge (index!54220 lt!659793) #b00000000000000000000000000000000) (bvslt (index!54220 lt!659793) (size!49443 a!2804)))) (or ((_ is Undefined!12956) lt!659793) ((_ is Found!12956) lt!659793) (not ((_ is MissingZero!12956) lt!659793)) (and (bvsge (index!54219 lt!659793) #b00000000000000000000000000000000) (bvslt (index!54219 lt!659793) (size!49443 a!2804)))) (or ((_ is Undefined!12956) lt!659793) ((_ is Found!12956) lt!659793) ((_ is MissingZero!12956) lt!659793) (not ((_ is MissingVacant!12956) lt!659793)) (and (bvsge (index!54222 lt!659793) #b00000000000000000000000000000000) (bvslt (index!54222 lt!659793) (size!49443 a!2804)))) (or ((_ is Undefined!12956) lt!659793) (ite ((_ is Found!12956) lt!659793) (= (select (arr!48892 a!2804) (index!54220 lt!659793)) (select (arr!48892 a!2804) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!12956) lt!659793) (= (select (arr!48892 a!2804) (index!54219 lt!659793)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12956) lt!659793) (= (select (arr!48892 a!2804) (index!54222 lt!659793)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159493 (= lt!659793 e!849332)))

(declare-fun c!140473 () Bool)

(assert (=> d!159493 (= c!140473 (and ((_ is Intermediate!12956) lt!659792) (undefined!13768 lt!659792)))))

(assert (=> d!159493 (= lt!659792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48892 a!2804) #b00000000000000000000000000000000) mask!2512) (select (arr!48892 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(assert (=> d!159493 (validMask!0 mask!2512)))

(assert (=> d!159493 (= (seekEntryOrOpen!0 (select (arr!48892 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) lt!659793)))

(declare-fun b!1522358 () Bool)

(assert (=> b!1522358 (= e!849331 (MissingZero!12956 (index!54221 lt!659792)))))

(declare-fun b!1522359 () Bool)

(assert (=> b!1522359 (= e!849333 (Found!12956 (index!54221 lt!659792)))))

(declare-fun b!1522360 () Bool)

(declare-fun c!140472 () Bool)

(assert (=> b!1522360 (= c!140472 (= lt!659794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522360 (= e!849333 e!849331)))

(assert (= (and d!159493 c!140473) b!1522355))

(assert (= (and d!159493 (not c!140473)) b!1522356))

(assert (= (and b!1522356 c!140471) b!1522359))

(assert (= (and b!1522356 (not c!140471)) b!1522360))

(assert (= (and b!1522360 c!140472) b!1522358))

(assert (= (and b!1522360 (not c!140472)) b!1522357))

(declare-fun m!1405561 () Bool)

(assert (=> b!1522356 m!1405561))

(assert (=> b!1522357 m!1405095))

(declare-fun m!1405563 () Bool)

(assert (=> b!1522357 m!1405563))

(declare-fun m!1405565 () Bool)

(assert (=> d!159493 m!1405565))

(declare-fun m!1405567 () Bool)

(assert (=> d!159493 m!1405567))

(assert (=> d!159493 m!1405095))

(declare-fun m!1405569 () Bool)

(assert (=> d!159493 m!1405569))

(assert (=> d!159493 m!1404987))

(assert (=> d!159493 m!1405569))

(assert (=> d!159493 m!1405095))

(declare-fun m!1405571 () Bool)

(assert (=> d!159493 m!1405571))

(declare-fun m!1405573 () Bool)

(assert (=> d!159493 m!1405573))

(assert (=> b!1522031 d!159493))

(assert (=> d!159311 d!159349))

(assert (=> d!159341 d!159333))

(declare-fun d!159495 () Bool)

(assert (=> d!159495 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(assert (=> d!159495 true))

(declare-fun _$72!155 () Unit!50815)

(assert (=> d!159495 (= (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) _$72!155)))

(declare-fun bs!43643 () Bool)

(assert (= bs!43643 d!159495))

(assert (=> bs!43643 m!1405003))

(assert (=> d!159341 d!159495))

(assert (=> d!159341 d!159349))

(check-sat (not d!159459) (not b!1522270) (not d!159489) (not b!1522278) (not b!1522282) (not d!159463) (not d!159493) (not b!1522329) (not d!159475) (not b!1522354) (not d!159477) (not d!159479) (not d!159495) (not b!1522357) (not b!1522322) (not b!1522352) (not bm!68462) (not d!159473) (not bm!68463) (not b!1522348) (not d!159461) (not b!1522350) (not d!159481) (not bm!68461) (not b!1522286) (not b!1522344) (not b!1522313) (not d!159485) (not b!1522304) (not d!159471) (not b!1522280) (not b!1522284))
(check-sat)
