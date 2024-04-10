; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130370 () Bool)

(assert start!130370)

(declare-fun b!1530426 () Bool)

(declare-fun res!1047961 () Bool)

(declare-fun e!852798 () Bool)

(assert (=> b!1530426 (=> (not res!1047961) (not e!852798))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101663 0))(
  ( (array!101664 (arr!49055 (Array (_ BitVec 32) (_ BitVec 64))) (size!49605 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101663)

(assert (=> b!1530426 (= res!1047961 (and (= (size!49605 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49605 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49605 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530427 () Bool)

(declare-fun e!852799 () Bool)

(declare-fun e!852802 () Bool)

(assert (=> b!1530427 (= e!852799 (not e!852802))))

(declare-fun res!1047955 () Bool)

(assert (=> b!1530427 (=> res!1047955 e!852802)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1530427 (= res!1047955 (or (not (= (select (arr!49055 a!2804) j!70) (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852800 () Bool)

(assert (=> b!1530427 e!852800))

(declare-fun res!1047952 () Bool)

(assert (=> b!1530427 (=> (not res!1047952) (not e!852800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101663 (_ BitVec 32)) Bool)

(assert (=> b!1530427 (= res!1047952 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51224 0))(
  ( (Unit!51225) )
))
(declare-fun lt!662813 () Unit!51224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51224)

(assert (=> b!1530427 (= lt!662813 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530428 () Bool)

(declare-fun res!1047959 () Bool)

(assert (=> b!1530428 (=> (not res!1047959) (not e!852798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530428 (= res!1047959 (validKeyInArray!0 (select (arr!49055 a!2804) i!961)))))

(declare-fun lt!662814 () (_ BitVec 32))

(declare-fun b!1530429 () Bool)

(assert (=> b!1530429 (= e!852802 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (and (bvsge lt!662814 #b00000000000000000000000000000000) (bvslt lt!662814 (size!49605 a!2804)))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530429 (= lt!662814 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun res!1047957 () Bool)

(assert (=> start!130370 (=> (not res!1047957) (not e!852798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130370 (= res!1047957 (validMask!0 mask!2512))))

(assert (=> start!130370 e!852798))

(assert (=> start!130370 true))

(declare-fun array_inv!38083 (array!101663) Bool)

(assert (=> start!130370 (array_inv!38083 a!2804)))

(declare-fun b!1530430 () Bool)

(declare-fun res!1047953 () Bool)

(assert (=> b!1530430 (=> (not res!1047953) (not e!852798))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530430 (= res!1047953 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49605 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49605 a!2804))))))

(declare-fun b!1530431 () Bool)

(declare-fun res!1047954 () Bool)

(assert (=> b!1530431 (=> (not res!1047954) (not e!852798))))

(declare-datatypes ((List!35538 0))(
  ( (Nil!35535) (Cons!35534 (h!36973 (_ BitVec 64)) (t!50232 List!35538)) )
))
(declare-fun arrayNoDuplicates!0 (array!101663 (_ BitVec 32) List!35538) Bool)

(assert (=> b!1530431 (= res!1047954 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35535))))

(declare-fun b!1530432 () Bool)

(declare-fun res!1047960 () Bool)

(assert (=> b!1530432 (=> (not res!1047960) (not e!852799))))

(declare-datatypes ((SeekEntryResult!13220 0))(
  ( (MissingZero!13220 (index!55275 (_ BitVec 32))) (Found!13220 (index!55276 (_ BitVec 32))) (Intermediate!13220 (undefined!14032 Bool) (index!55277 (_ BitVec 32)) (x!136964 (_ BitVec 32))) (Undefined!13220) (MissingVacant!13220 (index!55278 (_ BitVec 32))) )
))
(declare-fun lt!662815 () SeekEntryResult!13220)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101663 (_ BitVec 32)) SeekEntryResult!13220)

(assert (=> b!1530432 (= res!1047960 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49055 a!2804) j!70) a!2804 mask!2512) lt!662815))))

(declare-fun b!1530433 () Bool)

(declare-fun res!1047956 () Bool)

(assert (=> b!1530433 (=> (not res!1047956) (not e!852799))))

(declare-fun lt!662812 () SeekEntryResult!13220)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530433 (= res!1047956 (= lt!662812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101664 (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49605 a!2804)) mask!2512)))))

(declare-fun b!1530434 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101663 (_ BitVec 32)) SeekEntryResult!13220)

(assert (=> b!1530434 (= e!852800 (= (seekEntry!0 (select (arr!49055 a!2804) j!70) a!2804 mask!2512) (Found!13220 j!70)))))

(declare-fun b!1530435 () Bool)

(assert (=> b!1530435 (= e!852798 e!852799)))

(declare-fun res!1047950 () Bool)

(assert (=> b!1530435 (=> (not res!1047950) (not e!852799))))

(assert (=> b!1530435 (= res!1047950 (= lt!662812 lt!662815))))

(assert (=> b!1530435 (= lt!662815 (Intermediate!13220 false resIndex!21 resX!21))))

(assert (=> b!1530435 (= lt!662812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49055 a!2804) j!70) mask!2512) (select (arr!49055 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530436 () Bool)

(declare-fun res!1047951 () Bool)

(assert (=> b!1530436 (=> (not res!1047951) (not e!852798))))

(assert (=> b!1530436 (= res!1047951 (validKeyInArray!0 (select (arr!49055 a!2804) j!70)))))

(declare-fun b!1530437 () Bool)

(declare-fun res!1047958 () Bool)

(assert (=> b!1530437 (=> (not res!1047958) (not e!852798))))

(assert (=> b!1530437 (= res!1047958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130370 res!1047957) b!1530426))

(assert (= (and b!1530426 res!1047961) b!1530428))

(assert (= (and b!1530428 res!1047959) b!1530436))

(assert (= (and b!1530436 res!1047951) b!1530437))

(assert (= (and b!1530437 res!1047958) b!1530431))

(assert (= (and b!1530431 res!1047954) b!1530430))

(assert (= (and b!1530430 res!1047953) b!1530435))

(assert (= (and b!1530435 res!1047950) b!1530432))

(assert (= (and b!1530432 res!1047960) b!1530433))

(assert (= (and b!1530433 res!1047956) b!1530427))

(assert (= (and b!1530427 res!1047952) b!1530434))

(assert (= (and b!1530427 (not res!1047955)) b!1530429))

(declare-fun m!1413297 () Bool)

(assert (=> b!1530427 m!1413297))

(declare-fun m!1413299 () Bool)

(assert (=> b!1530427 m!1413299))

(declare-fun m!1413301 () Bool)

(assert (=> b!1530427 m!1413301))

(declare-fun m!1413303 () Bool)

(assert (=> b!1530427 m!1413303))

(declare-fun m!1413305 () Bool)

(assert (=> b!1530427 m!1413305))

(declare-fun m!1413307 () Bool)

(assert (=> b!1530431 m!1413307))

(declare-fun m!1413309 () Bool)

(assert (=> b!1530437 m!1413309))

(assert (=> b!1530433 m!1413301))

(assert (=> b!1530433 m!1413303))

(assert (=> b!1530433 m!1413303))

(declare-fun m!1413311 () Bool)

(assert (=> b!1530433 m!1413311))

(assert (=> b!1530433 m!1413311))

(assert (=> b!1530433 m!1413303))

(declare-fun m!1413313 () Bool)

(assert (=> b!1530433 m!1413313))

(assert (=> b!1530435 m!1413297))

(assert (=> b!1530435 m!1413297))

(declare-fun m!1413315 () Bool)

(assert (=> b!1530435 m!1413315))

(assert (=> b!1530435 m!1413315))

(assert (=> b!1530435 m!1413297))

(declare-fun m!1413317 () Bool)

(assert (=> b!1530435 m!1413317))

(declare-fun m!1413319 () Bool)

(assert (=> b!1530429 m!1413319))

(assert (=> b!1530434 m!1413297))

(assert (=> b!1530434 m!1413297))

(declare-fun m!1413321 () Bool)

(assert (=> b!1530434 m!1413321))

(assert (=> b!1530432 m!1413297))

(assert (=> b!1530432 m!1413297))

(declare-fun m!1413323 () Bool)

(assert (=> b!1530432 m!1413323))

(assert (=> b!1530436 m!1413297))

(assert (=> b!1530436 m!1413297))

(declare-fun m!1413325 () Bool)

(assert (=> b!1530436 m!1413325))

(declare-fun m!1413327 () Bool)

(assert (=> b!1530428 m!1413327))

(assert (=> b!1530428 m!1413327))

(declare-fun m!1413329 () Bool)

(assert (=> b!1530428 m!1413329))

(declare-fun m!1413331 () Bool)

(assert (=> start!130370 m!1413331))

(declare-fun m!1413333 () Bool)

(assert (=> start!130370 m!1413333))

(push 1)

(assert (not b!1530432))

(assert (not b!1530427))

(assert (not b!1530436))

(assert (not b!1530435))

(assert (not b!1530433))

(assert (not b!1530429))

(assert (not b!1530437))

(assert (not b!1530431))

(assert (not start!130370))

(assert (not b!1530434))

(assert (not b!1530428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!159839 () Bool)

(declare-fun res!1048046 () Bool)

(declare-fun e!852852 () Bool)

(assert (=> d!159839 (=> res!1048046 e!852852)))

(assert (=> d!159839 (= res!1048046 (bvsge #b00000000000000000000000000000000 (size!49605 a!2804)))))

(assert (=> d!159839 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35535) e!852852)))

(declare-fun b!1530532 () Bool)

(declare-fun e!852853 () Bool)

(declare-fun e!852851 () Bool)

(assert (=> b!1530532 (= e!852853 e!852851)))

(declare-fun c!140798 () Bool)

(assert (=> b!1530532 (= c!140798 (validKeyInArray!0 (select (arr!49055 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530533 () Bool)

(declare-fun call!68517 () Bool)

(assert (=> b!1530533 (= e!852851 call!68517)))

(declare-fun b!1530534 () Bool)

(assert (=> b!1530534 (= e!852852 e!852853)))

(declare-fun res!1048048 () Bool)

(assert (=> b!1530534 (=> (not res!1048048) (not e!852853))))

(declare-fun e!852850 () Bool)

(assert (=> b!1530534 (= res!1048048 (not e!852850))))

(declare-fun res!1048047 () Bool)

(assert (=> b!1530534 (=> (not res!1048047) (not e!852850))))

(assert (=> b!1530534 (= res!1048047 (validKeyInArray!0 (select (arr!49055 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530535 () Bool)

(assert (=> b!1530535 (= e!852851 call!68517)))

(declare-fun b!1530536 () Bool)

(declare-fun contains!9999 (List!35538 (_ BitVec 64)) Bool)

(assert (=> b!1530536 (= e!852850 (contains!9999 Nil!35535 (select (arr!49055 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68514 () Bool)

(assert (=> bm!68514 (= call!68517 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140798 (Cons!35534 (select (arr!49055 a!2804) #b00000000000000000000000000000000) Nil!35535) Nil!35535)))))

(assert (= (and d!159839 (not res!1048046)) b!1530534))

(assert (= (and b!1530534 res!1048047) b!1530536))

(assert (= (and b!1530534 res!1048048) b!1530532))

(assert (= (and b!1530532 c!140798) b!1530535))

(assert (= (and b!1530532 (not c!140798)) b!1530533))

(assert (= (or b!1530535 b!1530533) bm!68514))

(declare-fun m!1413421 () Bool)

(assert (=> b!1530532 m!1413421))

(assert (=> b!1530532 m!1413421))

(declare-fun m!1413423 () Bool)

(assert (=> b!1530532 m!1413423))

(assert (=> b!1530534 m!1413421))

(assert (=> b!1530534 m!1413421))

(assert (=> b!1530534 m!1413423))

(assert (=> b!1530536 m!1413421))

(assert (=> b!1530536 m!1413421))

(declare-fun m!1413425 () Bool)

(assert (=> b!1530536 m!1413425))

(assert (=> bm!68514 m!1413421))

(declare-fun m!1413427 () Bool)

(assert (=> bm!68514 m!1413427))

(assert (=> b!1530431 d!159839))

(declare-fun b!1530572 () Bool)

(declare-fun e!852877 () Bool)

(declare-fun call!68520 () Bool)

(assert (=> b!1530572 (= e!852877 call!68520)))

(declare-fun bm!68517 () Bool)

(assert (=> bm!68517 (= call!68520 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159841 () Bool)

(declare-fun res!1048064 () Bool)

(declare-fun e!852876 () Bool)

(assert (=> d!159841 (=> res!1048064 e!852876)))

(assert (=> d!159841 (= res!1048064 (bvsge j!70 (size!49605 a!2804)))))

(assert (=> d!159841 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!852876)))

(declare-fun b!1530573 () Bool)

(declare-fun e!852875 () Bool)

(assert (=> b!1530573 (= e!852875 call!68520)))

(declare-fun b!1530574 () Bool)

(assert (=> b!1530574 (= e!852876 e!852875)))

(declare-fun c!140810 () Bool)

(assert (=> b!1530574 (= c!140810 (validKeyInArray!0 (select (arr!49055 a!2804) j!70)))))

(declare-fun b!1530575 () Bool)

(assert (=> b!1530575 (= e!852875 e!852877)))

(declare-fun lt!662866 () (_ BitVec 64))

(assert (=> b!1530575 (= lt!662866 (select (arr!49055 a!2804) j!70))))

(declare-fun lt!662864 () Unit!51224)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101663 (_ BitVec 64) (_ BitVec 32)) Unit!51224)

(assert (=> b!1530575 (= lt!662864 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662866 j!70))))

(declare-fun arrayContainsKey!0 (array!101663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1530575 (arrayContainsKey!0 a!2804 lt!662866 #b00000000000000000000000000000000)))

(declare-fun lt!662865 () Unit!51224)

(assert (=> b!1530575 (= lt!662865 lt!662864)))

(declare-fun res!1048063 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101663 (_ BitVec 32)) SeekEntryResult!13220)

(assert (=> b!1530575 (= res!1048063 (= (seekEntryOrOpen!0 (select (arr!49055 a!2804) j!70) a!2804 mask!2512) (Found!13220 j!70)))))

(assert (=> b!1530575 (=> (not res!1048063) (not e!852877))))

(assert (= (and d!159841 (not res!1048064)) b!1530574))

(assert (= (and b!1530574 c!140810) b!1530575))

(assert (= (and b!1530574 (not c!140810)) b!1530573))

(assert (= (and b!1530575 res!1048063) b!1530572))

(assert (= (or b!1530572 b!1530573) bm!68517))

(declare-fun m!1413437 () Bool)

(assert (=> bm!68517 m!1413437))

(assert (=> b!1530574 m!1413297))

(assert (=> b!1530574 m!1413297))

(assert (=> b!1530574 m!1413325))

(assert (=> b!1530575 m!1413297))

(declare-fun m!1413439 () Bool)

(assert (=> b!1530575 m!1413439))

(declare-fun m!1413441 () Bool)

(assert (=> b!1530575 m!1413441))

(assert (=> b!1530575 m!1413297))

(declare-fun m!1413443 () Bool)

(assert (=> b!1530575 m!1413443))

(assert (=> b!1530427 d!159841))

(declare-fun d!159847 () Bool)

(assert (=> d!159847 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!662878 () Unit!51224)

(declare-fun choose!38 (array!101663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51224)

(assert (=> d!159847 (= lt!662878 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159847 (validMask!0 mask!2512)))

(assert (=> d!159847 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!662878)))

(declare-fun bs!43886 () Bool)

(assert (= bs!43886 d!159847))

(assert (=> bs!43886 m!1413305))

(declare-fun m!1413457 () Bool)

(assert (=> bs!43886 m!1413457))

(assert (=> bs!43886 m!1413331))

(assert (=> b!1530427 d!159847))

(declare-fun d!159857 () Bool)

(declare-fun lt!662881 () (_ BitVec 32))

(assert (=> d!159857 (and (bvsge lt!662881 #b00000000000000000000000000000000) (bvslt lt!662881 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159857 (= lt!662881 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!159857 (validMask!0 mask!2512)))

(assert (=> d!159857 (= (nextIndex!0 index!487 x!534 mask!2512) lt!662881)))

(declare-fun bs!43887 () Bool)

(assert (= bs!43887 d!159857))

(declare-fun m!1413459 () Bool)

(assert (=> bs!43887 m!1413459))

(assert (=> bs!43887 m!1413331))

(assert (=> b!1530429 d!159857))

(declare-fun d!159859 () Bool)

(assert (=> d!159859 (= (validKeyInArray!0 (select (arr!49055 a!2804) i!961)) (and (not (= (select (arr!49055 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49055 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530428 d!159859))

(declare-fun e!852931 () SeekEntryResult!13220)

(declare-fun b!1530658 () Bool)

(assert (=> b!1530658 (= e!852931 (Intermediate!13220 true (toIndex!0 (select (arr!49055 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun e!852930 () SeekEntryResult!13220)

(declare-fun b!1530659 () Bool)

(assert (=> b!1530659 (= e!852930 (Intermediate!13220 false (toIndex!0 (select (arr!49055 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530660 () Bool)

(declare-fun lt!662905 () SeekEntryResult!13220)

(assert (=> b!1530660 (and (bvsge (index!55277 lt!662905) #b00000000000000000000000000000000) (bvslt (index!55277 lt!662905) (size!49605 a!2804)))))

(declare-fun e!852932 () Bool)

(assert (=> b!1530660 (= e!852932 (= (select (arr!49055 a!2804) (index!55277 lt!662905)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530661 () Bool)

(assert (=> b!1530661 (= e!852930 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49055 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!49055 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530662 () Bool)

(assert (=> b!1530662 (and (bvsge (index!55277 lt!662905) #b00000000000000000000000000000000) (bvslt (index!55277 lt!662905) (size!49605 a!2804)))))

(declare-fun res!1048100 () Bool)

(assert (=> b!1530662 (= res!1048100 (= (select (arr!49055 a!2804) (index!55277 lt!662905)) (select (arr!49055 a!2804) j!70)))))

(assert (=> b!1530662 (=> res!1048100 e!852932)))

(declare-fun e!852928 () Bool)

(assert (=> b!1530662 (= e!852928 e!852932)))

(declare-fun b!1530663 () Bool)

(declare-fun e!852929 () Bool)

(assert (=> b!1530663 (= e!852929 (bvsge (x!136964 lt!662905) #b01111111111111111111111111111110))))

(declare-fun b!1530664 () Bool)

(assert (=> b!1530664 (and (bvsge (index!55277 lt!662905) #b00000000000000000000000000000000) (bvslt (index!55277 lt!662905) (size!49605 a!2804)))))

(declare-fun res!1048098 () Bool)

(assert (=> b!1530664 (= res!1048098 (= (select (arr!49055 a!2804) (index!55277 lt!662905)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530664 (=> res!1048098 e!852932)))

(declare-fun b!1530665 () Bool)

(assert (=> b!1530665 (= e!852931 e!852930)))

(declare-fun c!140836 () Bool)

(declare-fun lt!662904 () (_ BitVec 64))

(assert (=> b!1530665 (= c!140836 (or (= lt!662904 (select (arr!49055 a!2804) j!70)) (= (bvadd lt!662904 lt!662904) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530666 () Bool)

(assert (=> b!1530666 (= e!852929 e!852928)))

(declare-fun res!1048099 () Bool)

(assert (=> b!1530666 (= res!1048099 (and (is-Intermediate!13220 lt!662905) (not (undefined!14032 lt!662905)) (bvslt (x!136964 lt!662905) #b01111111111111111111111111111110) (bvsge (x!136964 lt!662905) #b00000000000000000000000000000000) (bvsge (x!136964 lt!662905) #b00000000000000000000000000000000)))))

(assert (=> b!1530666 (=> (not res!1048099) (not e!852928))))

(declare-fun d!159861 () Bool)

(assert (=> d!159861 e!852929))

(declare-fun c!140837 () Bool)

(assert (=> d!159861 (= c!140837 (and (is-Intermediate!13220 lt!662905) (undefined!14032 lt!662905)))))

(assert (=> d!159861 (= lt!662905 e!852931)))

(declare-fun c!140838 () Bool)

(assert (=> d!159861 (= c!140838 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159861 (= lt!662904 (select (arr!49055 a!2804) (toIndex!0 (select (arr!49055 a!2804) j!70) mask!2512)))))

(assert (=> d!159861 (validMask!0 mask!2512)))

(assert (=> d!159861 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49055 a!2804) j!70) mask!2512) (select (arr!49055 a!2804) j!70) a!2804 mask!2512) lt!662905)))

(assert (= (and d!159861 c!140838) b!1530658))

(assert (= (and d!159861 (not c!140838)) b!1530665))

(assert (= (and b!1530665 c!140836) b!1530659))

(assert (= (and b!1530665 (not c!140836)) b!1530661))

(assert (= (and d!159861 c!140837) b!1530663))

(assert (= (and d!159861 (not c!140837)) b!1530666))

(assert (= (and b!1530666 res!1048099) b!1530662))

(assert (= (and b!1530662 (not res!1048100)) b!1530664))

(assert (= (and b!1530664 (not res!1048098)) b!1530660))

(declare-fun m!1413487 () Bool)

(assert (=> b!1530662 m!1413487))

(assert (=> b!1530664 m!1413487))

(assert (=> b!1530660 m!1413487))

(assert (=> b!1530661 m!1413315))

(declare-fun m!1413489 () Bool)

(assert (=> b!1530661 m!1413489))

(assert (=> b!1530661 m!1413489))

(assert (=> b!1530661 m!1413297))

(declare-fun m!1413493 () Bool)

(assert (=> b!1530661 m!1413493))

(assert (=> d!159861 m!1413315))

(declare-fun m!1413497 () Bool)

(assert (=> d!159861 m!1413497))

(assert (=> d!159861 m!1413331))

(assert (=> b!1530435 d!159861))

(declare-fun d!159879 () Bool)

(declare-fun lt!662915 () (_ BitVec 32))

(declare-fun lt!662914 () (_ BitVec 32))

(assert (=> d!159879 (= lt!662915 (bvmul (bvxor lt!662914 (bvlshr lt!662914 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159879 (= lt!662914 ((_ extract 31 0) (bvand (bvxor (select (arr!49055 a!2804) j!70) (bvlshr (select (arr!49055 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159879 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048104 (let ((h!36978 ((_ extract 31 0) (bvand (bvxor (select (arr!49055 a!2804) j!70) (bvlshr (select (arr!49055 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136973 (bvmul (bvxor h!36978 (bvlshr h!36978 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136973 (bvlshr x!136973 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048104 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048104 #b00000000000000000000000000000000))))))

(assert (=> d!159879 (= (toIndex!0 (select (arr!49055 a!2804) j!70) mask!2512) (bvand (bvxor lt!662915 (bvlshr lt!662915 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1530435 d!159879))

(declare-fun b!1530676 () Bool)

(declare-fun e!852940 () Bool)

(declare-fun call!68525 () Bool)

(assert (=> b!1530676 (= e!852940 call!68525)))

(declare-fun bm!68522 () Bool)

(assert (=> bm!68522 (= call!68525 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159885 () Bool)

(declare-fun res!1048106 () Bool)

(declare-fun e!852939 () Bool)

(assert (=> d!159885 (=> res!1048106 e!852939)))

(assert (=> d!159885 (= res!1048106 (bvsge #b00000000000000000000000000000000 (size!49605 a!2804)))))

(assert (=> d!159885 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!852939)))

(declare-fun b!1530677 () Bool)

(declare-fun e!852938 () Bool)

(assert (=> b!1530677 (= e!852938 call!68525)))

(declare-fun b!1530678 () Bool)

(assert (=> b!1530678 (= e!852939 e!852938)))

(declare-fun c!140842 () Bool)

(assert (=> b!1530678 (= c!140842 (validKeyInArray!0 (select (arr!49055 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530679 () Bool)

(assert (=> b!1530679 (= e!852938 e!852940)))

(declare-fun lt!662918 () (_ BitVec 64))

(assert (=> b!1530679 (= lt!662918 (select (arr!49055 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!662916 () Unit!51224)

(assert (=> b!1530679 (= lt!662916 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662918 #b00000000000000000000000000000000))))

(assert (=> b!1530679 (arrayContainsKey!0 a!2804 lt!662918 #b00000000000000000000000000000000)))

(declare-fun lt!662917 () Unit!51224)

(assert (=> b!1530679 (= lt!662917 lt!662916)))

(declare-fun res!1048105 () Bool)

(assert (=> b!1530679 (= res!1048105 (= (seekEntryOrOpen!0 (select (arr!49055 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13220 #b00000000000000000000000000000000)))))

(assert (=> b!1530679 (=> (not res!1048105) (not e!852940))))

(assert (= (and d!159885 (not res!1048106)) b!1530678))

(assert (= (and b!1530678 c!140842) b!1530679))

(assert (= (and b!1530678 (not c!140842)) b!1530677))

(assert (= (and b!1530679 res!1048105) b!1530676))

(assert (= (or b!1530676 b!1530677) bm!68522))

(declare-fun m!1413503 () Bool)

(assert (=> bm!68522 m!1413503))

(assert (=> b!1530678 m!1413421))

(assert (=> b!1530678 m!1413421))

(assert (=> b!1530678 m!1413423))

(assert (=> b!1530679 m!1413421))

(declare-fun m!1413505 () Bool)

(assert (=> b!1530679 m!1413505))

(declare-fun m!1413507 () Bool)

(assert (=> b!1530679 m!1413507))

(assert (=> b!1530679 m!1413421))

(declare-fun m!1413509 () Bool)

(assert (=> b!1530679 m!1413509))

(assert (=> b!1530437 d!159885))

(declare-fun d!159887 () Bool)

(assert (=> d!159887 (= (validKeyInArray!0 (select (arr!49055 a!2804) j!70)) (and (not (= (select (arr!49055 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49055 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1530436 d!159887))

(declare-fun b!1530692 () Bool)

(declare-fun e!852948 () SeekEntryResult!13220)

(assert (=> b!1530692 (= e!852948 (Intermediate!13220 true (toIndex!0 (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun e!852947 () SeekEntryResult!13220)

(declare-fun b!1530693 () Bool)

(assert (=> b!1530693 (= e!852947 (Intermediate!13220 false (toIndex!0 (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530694 () Bool)

(declare-fun lt!662926 () SeekEntryResult!13220)

(assert (=> b!1530694 (and (bvsge (index!55277 lt!662926) #b00000000000000000000000000000000) (bvslt (index!55277 lt!662926) (size!49605 (array!101664 (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49605 a!2804)))))))

(declare-fun e!852950 () Bool)

(assert (=> b!1530694 (= e!852950 (= (select (arr!49055 (array!101664 (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49605 a!2804))) (index!55277 lt!662926)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530695 () Bool)

(assert (=> b!1530695 (= e!852947 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101664 (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49605 a!2804)) mask!2512))))

(declare-fun b!1530696 () Bool)

(assert (=> b!1530696 (and (bvsge (index!55277 lt!662926) #b00000000000000000000000000000000) (bvslt (index!55277 lt!662926) (size!49605 (array!101664 (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49605 a!2804)))))))

(declare-fun res!1048111 () Bool)

(assert (=> b!1530696 (= res!1048111 (= (select (arr!49055 (array!101664 (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49605 a!2804))) (index!55277 lt!662926)) (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1530696 (=> res!1048111 e!852950)))

(declare-fun e!852945 () Bool)

(assert (=> b!1530696 (= e!852945 e!852950)))

(declare-fun b!1530697 () Bool)

(declare-fun e!852946 () Bool)

(assert (=> b!1530697 (= e!852946 (bvsge (x!136964 lt!662926) #b01111111111111111111111111111110))))

(declare-fun b!1530698 () Bool)

(assert (=> b!1530698 (and (bvsge (index!55277 lt!662926) #b00000000000000000000000000000000) (bvslt (index!55277 lt!662926) (size!49605 (array!101664 (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49605 a!2804)))))))

(declare-fun res!1048109 () Bool)

(assert (=> b!1530698 (= res!1048109 (= (select (arr!49055 (array!101664 (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49605 a!2804))) (index!55277 lt!662926)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530698 (=> res!1048109 e!852950)))

(declare-fun b!1530699 () Bool)

(assert (=> b!1530699 (= e!852948 e!852947)))

(declare-fun c!140845 () Bool)

(declare-fun lt!662925 () (_ BitVec 64))

(assert (=> b!1530699 (= c!140845 (or (= lt!662925 (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!662925 lt!662925) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530700 () Bool)

(assert (=> b!1530700 (= e!852946 e!852945)))

(declare-fun res!1048110 () Bool)

(assert (=> b!1530700 (= res!1048110 (and (is-Intermediate!13220 lt!662926) (not (undefined!14032 lt!662926)) (bvslt (x!136964 lt!662926) #b01111111111111111111111111111110) (bvsge (x!136964 lt!662926) #b00000000000000000000000000000000) (bvsge (x!136964 lt!662926) #b00000000000000000000000000000000)))))

(assert (=> b!1530700 (=> (not res!1048110) (not e!852945))))

(declare-fun d!159889 () Bool)

(assert (=> d!159889 e!852946))

(declare-fun c!140846 () Bool)

(assert (=> d!159889 (= c!140846 (and (is-Intermediate!13220 lt!662926) (undefined!14032 lt!662926)))))

(assert (=> d!159889 (= lt!662926 e!852948)))

(declare-fun c!140848 () Bool)

(assert (=> d!159889 (= c!140848 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159889 (= lt!662925 (select (arr!49055 (array!101664 (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49605 a!2804))) (toIndex!0 (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159889 (validMask!0 mask!2512)))

(assert (=> d!159889 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101664 (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49605 a!2804)) mask!2512) lt!662926)))

(assert (= (and d!159889 c!140848) b!1530692))

(assert (= (and d!159889 (not c!140848)) b!1530699))

(assert (= (and b!1530699 c!140845) b!1530693))

(assert (= (and b!1530699 (not c!140845)) b!1530695))

(assert (= (and d!159889 c!140846) b!1530697))

(assert (= (and d!159889 (not c!140846)) b!1530700))

(assert (= (and b!1530700 res!1048110) b!1530696))

(assert (= (and b!1530696 (not res!1048111)) b!1530698))

(assert (= (and b!1530698 (not res!1048109)) b!1530694))

(declare-fun m!1413511 () Bool)

(assert (=> b!1530696 m!1413511))

(assert (=> b!1530698 m!1413511))

(assert (=> b!1530694 m!1413511))

(assert (=> b!1530695 m!1413311))

(declare-fun m!1413513 () Bool)

(assert (=> b!1530695 m!1413513))

(assert (=> b!1530695 m!1413513))

(assert (=> b!1530695 m!1413303))

(declare-fun m!1413515 () Bool)

(assert (=> b!1530695 m!1413515))

(assert (=> d!159889 m!1413311))

(declare-fun m!1413517 () Bool)

(assert (=> d!159889 m!1413517))

(assert (=> d!159889 m!1413331))

(assert (=> b!1530433 d!159889))

(declare-fun d!159891 () Bool)

(declare-fun lt!662936 () (_ BitVec 32))

(declare-fun lt!662935 () (_ BitVec 32))

(assert (=> d!159891 (= lt!662936 (bvmul (bvxor lt!662935 (bvlshr lt!662935 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159891 (= lt!662935 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159891 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048104 (let ((h!36978 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136973 (bvmul (bvxor h!36978 (bvlshr h!36978 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136973 (bvlshr x!136973 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048104 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048104 #b00000000000000000000000000000000))))))

(assert (=> d!159891 (= (toIndex!0 (select (store (arr!49055 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!662936 (bvlshr lt!662936 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1530433 d!159891))

(declare-fun b!1530709 () Bool)

(declare-fun e!852961 () SeekEntryResult!13220)

(assert (=> b!1530709 (= e!852961 (Intermediate!13220 true index!487 x!534))))

(declare-fun b!1530710 () Bool)

(declare-fun e!852960 () SeekEntryResult!13220)

(assert (=> b!1530710 (= e!852960 (Intermediate!13220 false index!487 x!534))))

(declare-fun b!1530711 () Bool)

(declare-fun lt!662938 () SeekEntryResult!13220)

(assert (=> b!1530711 (and (bvsge (index!55277 lt!662938) #b00000000000000000000000000000000) (bvslt (index!55277 lt!662938) (size!49605 a!2804)))))

(declare-fun e!852962 () Bool)

(assert (=> b!1530711 (= e!852962 (= (select (arr!49055 a!2804) (index!55277 lt!662938)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530712 () Bool)

(assert (=> b!1530712 (= e!852960 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!49055 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530713 () Bool)

(assert (=> b!1530713 (and (bvsge (index!55277 lt!662938) #b00000000000000000000000000000000) (bvslt (index!55277 lt!662938) (size!49605 a!2804)))))

(declare-fun res!1048116 () Bool)

(assert (=> b!1530713 (= res!1048116 (= (select (arr!49055 a!2804) (index!55277 lt!662938)) (select (arr!49055 a!2804) j!70)))))

(assert (=> b!1530713 (=> res!1048116 e!852962)))

(declare-fun e!852958 () Bool)

(assert (=> b!1530713 (= e!852958 e!852962)))

(declare-fun b!1530714 () Bool)

(declare-fun e!852959 () Bool)

(assert (=> b!1530714 (= e!852959 (bvsge (x!136964 lt!662938) #b01111111111111111111111111111110))))

(declare-fun b!1530715 () Bool)

(assert (=> b!1530715 (and (bvsge (index!55277 lt!662938) #b00000000000000000000000000000000) (bvslt (index!55277 lt!662938) (size!49605 a!2804)))))

(declare-fun res!1048114 () Bool)

(assert (=> b!1530715 (= res!1048114 (= (select (arr!49055 a!2804) (index!55277 lt!662938)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530715 (=> res!1048114 e!852962)))

(declare-fun b!1530716 () Bool)

(assert (=> b!1530716 (= e!852961 e!852960)))

(declare-fun c!140854 () Bool)

(declare-fun lt!662937 () (_ BitVec 64))

(assert (=> b!1530716 (= c!140854 (or (= lt!662937 (select (arr!49055 a!2804) j!70)) (= (bvadd lt!662937 lt!662937) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530717 () Bool)

(assert (=> b!1530717 (= e!852959 e!852958)))

(declare-fun res!1048115 () Bool)

(assert (=> b!1530717 (= res!1048115 (and (is-Intermediate!13220 lt!662938) (not (undefined!14032 lt!662938)) (bvslt (x!136964 lt!662938) #b01111111111111111111111111111110) (bvsge (x!136964 lt!662938) #b00000000000000000000000000000000) (bvsge (x!136964 lt!662938) x!534)))))

(assert (=> b!1530717 (=> (not res!1048115) (not e!852958))))

(declare-fun d!159893 () Bool)

(assert (=> d!159893 e!852959))

(declare-fun c!140855 () Bool)

(assert (=> d!159893 (= c!140855 (and (is-Intermediate!13220 lt!662938) (undefined!14032 lt!662938)))))

(assert (=> d!159893 (= lt!662938 e!852961)))

(declare-fun c!140856 () Bool)

(assert (=> d!159893 (= c!140856 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159893 (= lt!662937 (select (arr!49055 a!2804) index!487))))

(assert (=> d!159893 (validMask!0 mask!2512)))

(assert (=> d!159893 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49055 a!2804) j!70) a!2804 mask!2512) lt!662938)))

(assert (= (and d!159893 c!140856) b!1530709))

(assert (= (and d!159893 (not c!140856)) b!1530716))

(assert (= (and b!1530716 c!140854) b!1530710))

(assert (= (and b!1530716 (not c!140854)) b!1530712))

(assert (= (and d!159893 c!140855) b!1530714))

(assert (= (and d!159893 (not c!140855)) b!1530717))

(assert (= (and b!1530717 res!1048115) b!1530713))

(assert (= (and b!1530713 (not res!1048116)) b!1530715))

(assert (= (and b!1530715 (not res!1048114)) b!1530711))

(declare-fun m!1413519 () Bool)

(assert (=> b!1530713 m!1413519))

(assert (=> b!1530715 m!1413519))

(assert (=> b!1530711 m!1413519))

(assert (=> b!1530712 m!1413319))

(assert (=> b!1530712 m!1413319))

(assert (=> b!1530712 m!1413297))

(declare-fun m!1413521 () Bool)

(assert (=> b!1530712 m!1413521))

(declare-fun m!1413523 () Bool)

(assert (=> d!159893 m!1413523))

(assert (=> d!159893 m!1413331))

(assert (=> b!1530432 d!159893))

(declare-fun d!159895 () Bool)

(assert (=> d!159895 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130370 d!159895))

(declare-fun d!159909 () Bool)

(assert (=> d!159909 (= (array_inv!38083 a!2804) (bvsge (size!49605 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130370 d!159909))

(declare-fun b!1530772 () Bool)

(declare-fun e!852994 () SeekEntryResult!13220)

(declare-fun lt!662979 () SeekEntryResult!13220)

(assert (=> b!1530772 (= e!852994 (MissingZero!13220 (index!55277 lt!662979)))))

(declare-fun b!1530773 () Bool)

(declare-fun e!852992 () SeekEntryResult!13220)

(assert (=> b!1530773 (= e!852992 (Found!13220 (index!55277 lt!662979)))))

(declare-fun b!1530774 () Bool)

(declare-fun e!852993 () SeekEntryResult!13220)

(assert (=> b!1530774 (= e!852993 e!852992)))

(declare-fun lt!662980 () (_ BitVec 64))

(assert (=> b!1530774 (= lt!662980 (select (arr!49055 a!2804) (index!55277 lt!662979)))))

(declare-fun c!140880 () Bool)

(assert (=> b!1530774 (= c!140880 (= lt!662980 (select (arr!49055 a!2804) j!70)))))

(declare-fun b!1530775 () Bool)

(assert (=> b!1530775 (= e!852993 Undefined!13220)))

(declare-fun b!1530776 () Bool)

(declare-fun c!140882 () Bool)

(assert (=> b!1530776 (= c!140882 (= lt!662980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530776 (= e!852992 e!852994)))

(declare-fun b!1530771 () Bool)

(declare-fun lt!662978 () SeekEntryResult!13220)

(assert (=> b!1530771 (= e!852994 (ite (is-MissingVacant!13220 lt!662978) (MissingZero!13220 (index!55278 lt!662978)) lt!662978))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101663 (_ BitVec 32)) SeekEntryResult!13220)

(assert (=> b!1530771 (= lt!662978 (seekKeyOrZeroReturnVacant!0 (x!136964 lt!662979) (index!55277 lt!662979) (index!55277 lt!662979) (select (arr!49055 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159911 () Bool)

(declare-fun lt!662977 () SeekEntryResult!13220)

(assert (=> d!159911 (and (or (is-MissingVacant!13220 lt!662977) (not (is-Found!13220 lt!662977)) (and (bvsge (index!55276 lt!662977) #b00000000000000000000000000000000) (bvslt (index!55276 lt!662977) (size!49605 a!2804)))) (not (is-MissingVacant!13220 lt!662977)) (or (not (is-Found!13220 lt!662977)) (= (select (arr!49055 a!2804) (index!55276 lt!662977)) (select (arr!49055 a!2804) j!70))))))

(assert (=> d!159911 (= lt!662977 e!852993)))

(declare-fun c!140881 () Bool)

(assert (=> d!159911 (= c!140881 (and (is-Intermediate!13220 lt!662979) (undefined!14032 lt!662979)))))

(assert (=> d!159911 (= lt!662979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49055 a!2804) j!70) mask!2512) (select (arr!49055 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159911 (validMask!0 mask!2512)))

(assert (=> d!159911 (= (seekEntry!0 (select (arr!49055 a!2804) j!70) a!2804 mask!2512) lt!662977)))

(assert (= (and d!159911 c!140881) b!1530775))

(assert (= (and d!159911 (not c!140881)) b!1530774))

(assert (= (and b!1530774 c!140880) b!1530773))

(assert (= (and b!1530774 (not c!140880)) b!1530776))

(assert (= (and b!1530776 c!140882) b!1530772))

(assert (= (and b!1530776 (not c!140882)) b!1530771))

(declare-fun m!1413561 () Bool)

(assert (=> b!1530774 m!1413561))

(assert (=> b!1530771 m!1413297))

(declare-fun m!1413563 () Bool)

(assert (=> b!1530771 m!1413563))

(declare-fun m!1413567 () Bool)

(assert (=> d!159911 m!1413567))

(assert (=> d!159911 m!1413297))

(assert (=> d!159911 m!1413315))

(assert (=> d!159911 m!1413315))

(assert (=> d!159911 m!1413297))

(assert (=> d!159911 m!1413317))

(assert (=> d!159911 m!1413331))

(assert (=> b!1530434 d!159911))

(push 1)

(assert (not b!1530532))

(assert (not d!159893))

(assert (not b!1530536))

(assert (not d!159847))

(assert (not b!1530771))

(assert (not b!1530575))

(assert (not d!159861))

(assert (not bm!68517))

(assert (not b!1530661))

(assert (not b!1530712))

(assert (not bm!68514))

(assert (not b!1530679))

(assert (not d!159889))

(assert (not d!159911))

(assert (not b!1530574))

(assert (not bm!68522))

(assert (not b!1530678))

(assert (not d!159857))

(assert (not b!1530534))

(assert (not b!1530695))

(check-sat)

(pop 1)

(push 1)

(check-sat)

