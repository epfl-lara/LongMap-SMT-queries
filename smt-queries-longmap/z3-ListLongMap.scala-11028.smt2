; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128948 () Bool)

(assert start!128948)

(declare-fun b!1512325 () Bool)

(declare-fun e!844085 () Bool)

(declare-fun e!844084 () Bool)

(assert (=> b!1512325 (= e!844085 e!844084)))

(declare-fun res!1032439 () Bool)

(assert (=> b!1512325 (=> res!1032439 e!844084)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100804 0))(
  ( (array!100805 (arr!48640 (Array (_ BitVec 32) (_ BitVec 64))) (size!49192 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100804)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512325 (= res!1032439 (or (not (= (select (arr!48640 a!2804) j!70) (select (store (arr!48640 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48640 a!2804) index!487) (select (arr!48640 a!2804) j!70)) (not (= (select (arr!48640 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512326 () Bool)

(declare-fun res!1032442 () Bool)

(declare-fun e!844082 () Bool)

(assert (=> b!1512326 (=> (not res!1032442) (not e!844082))))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1512326 (= res!1032442 (and (= (size!49192 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49192 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49192 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512327 () Bool)

(declare-fun res!1032437 () Bool)

(assert (=> b!1512327 (=> (not res!1032437) (not e!844082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512327 (= res!1032437 (validKeyInArray!0 (select (arr!48640 a!2804) j!70)))))

(declare-fun b!1512328 () Bool)

(declare-fun res!1032436 () Bool)

(assert (=> b!1512328 (=> (not res!1032436) (not e!844082))))

(assert (=> b!1512328 (= res!1032436 (validKeyInArray!0 (select (arr!48640 a!2804) i!961)))))

(declare-fun b!1512329 () Bool)

(declare-fun res!1032445 () Bool)

(assert (=> b!1512329 (=> (not res!1032445) (not e!844082))))

(assert (=> b!1512329 (= res!1032445 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49192 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49192 a!2804))))))

(declare-fun b!1512330 () Bool)

(declare-fun e!844083 () Bool)

(assert (=> b!1512330 (= e!844083 (not true))))

(assert (=> b!1512330 e!844085))

(declare-fun res!1032438 () Bool)

(assert (=> b!1512330 (=> (not res!1032438) (not e!844085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100804 (_ BitVec 32)) Bool)

(assert (=> b!1512330 (= res!1032438 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50375 0))(
  ( (Unit!50376) )
))
(declare-fun lt!655432 () Unit!50375)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100804 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50375)

(assert (=> b!1512330 (= lt!655432 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512331 () Bool)

(declare-fun res!1032435 () Bool)

(assert (=> b!1512331 (=> (not res!1032435) (not e!844082))))

(declare-datatypes ((List!35201 0))(
  ( (Nil!35198) (Cons!35197 (h!36610 (_ BitVec 64)) (t!49887 List!35201)) )
))
(declare-fun arrayNoDuplicates!0 (array!100804 (_ BitVec 32) List!35201) Bool)

(assert (=> b!1512331 (= res!1032435 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35198))))

(declare-fun res!1032446 () Bool)

(assert (=> start!128948 (=> (not res!1032446) (not e!844082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128948 (= res!1032446 (validMask!0 mask!2512))))

(assert (=> start!128948 e!844082))

(assert (=> start!128948 true))

(declare-fun array_inv!37873 (array!100804) Bool)

(assert (=> start!128948 (array_inv!37873 a!2804)))

(declare-fun b!1512332 () Bool)

(declare-fun res!1032441 () Bool)

(assert (=> b!1512332 (=> (not res!1032441) (not e!844083))))

(declare-datatypes ((SeekEntryResult!12834 0))(
  ( (MissingZero!12834 (index!53731 (_ BitVec 32))) (Found!12834 (index!53732 (_ BitVec 32))) (Intermediate!12834 (undefined!13646 Bool) (index!53733 (_ BitVec 32)) (x!135458 (_ BitVec 32))) (Undefined!12834) (MissingVacant!12834 (index!53734 (_ BitVec 32))) )
))
(declare-fun lt!655434 () SeekEntryResult!12834)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100804 (_ BitVec 32)) SeekEntryResult!12834)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512332 (= res!1032441 (= lt!655434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48640 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48640 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100805 (store (arr!48640 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49192 a!2804)) mask!2512)))))

(declare-fun b!1512333 () Bool)

(declare-fun res!1032434 () Bool)

(assert (=> b!1512333 (=> (not res!1032434) (not e!844082))))

(assert (=> b!1512333 (= res!1032434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512334 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100804 (_ BitVec 32)) SeekEntryResult!12834)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100804 (_ BitVec 32)) SeekEntryResult!12834)

(assert (=> b!1512334 (= e!844084 (= (seekEntryOrOpen!0 (select (arr!48640 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48640 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512335 () Bool)

(declare-fun res!1032440 () Bool)

(assert (=> b!1512335 (=> (not res!1032440) (not e!844083))))

(declare-fun lt!655433 () SeekEntryResult!12834)

(assert (=> b!1512335 (= res!1032440 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48640 a!2804) j!70) a!2804 mask!2512) lt!655433))))

(declare-fun b!1512336 () Bool)

(declare-fun res!1032444 () Bool)

(assert (=> b!1512336 (=> (not res!1032444) (not e!844085))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100804 (_ BitVec 32)) SeekEntryResult!12834)

(assert (=> b!1512336 (= res!1032444 (= (seekEntry!0 (select (arr!48640 a!2804) j!70) a!2804 mask!2512) (Found!12834 j!70)))))

(declare-fun b!1512337 () Bool)

(assert (=> b!1512337 (= e!844082 e!844083)))

(declare-fun res!1032443 () Bool)

(assert (=> b!1512337 (=> (not res!1032443) (not e!844083))))

(assert (=> b!1512337 (= res!1032443 (= lt!655434 lt!655433))))

(assert (=> b!1512337 (= lt!655433 (Intermediate!12834 false resIndex!21 resX!21))))

(assert (=> b!1512337 (= lt!655434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48640 a!2804) j!70) mask!2512) (select (arr!48640 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!128948 res!1032446) b!1512326))

(assert (= (and b!1512326 res!1032442) b!1512328))

(assert (= (and b!1512328 res!1032436) b!1512327))

(assert (= (and b!1512327 res!1032437) b!1512333))

(assert (= (and b!1512333 res!1032434) b!1512331))

(assert (= (and b!1512331 res!1032435) b!1512329))

(assert (= (and b!1512329 res!1032445) b!1512337))

(assert (= (and b!1512337 res!1032443) b!1512335))

(assert (= (and b!1512335 res!1032440) b!1512332))

(assert (= (and b!1512332 res!1032441) b!1512330))

(assert (= (and b!1512330 res!1032438) b!1512336))

(assert (= (and b!1512336 res!1032444) b!1512325))

(assert (= (and b!1512325 (not res!1032439)) b!1512334))

(declare-fun m!1394543 () Bool)

(assert (=> b!1512325 m!1394543))

(declare-fun m!1394545 () Bool)

(assert (=> b!1512325 m!1394545))

(declare-fun m!1394547 () Bool)

(assert (=> b!1512325 m!1394547))

(declare-fun m!1394549 () Bool)

(assert (=> b!1512325 m!1394549))

(declare-fun m!1394551 () Bool)

(assert (=> b!1512331 m!1394551))

(declare-fun m!1394553 () Bool)

(assert (=> b!1512328 m!1394553))

(assert (=> b!1512328 m!1394553))

(declare-fun m!1394555 () Bool)

(assert (=> b!1512328 m!1394555))

(assert (=> b!1512335 m!1394543))

(assert (=> b!1512335 m!1394543))

(declare-fun m!1394557 () Bool)

(assert (=> b!1512335 m!1394557))

(assert (=> b!1512334 m!1394543))

(assert (=> b!1512334 m!1394543))

(declare-fun m!1394559 () Bool)

(assert (=> b!1512334 m!1394559))

(assert (=> b!1512334 m!1394543))

(declare-fun m!1394561 () Bool)

(assert (=> b!1512334 m!1394561))

(declare-fun m!1394563 () Bool)

(assert (=> b!1512330 m!1394563))

(declare-fun m!1394565 () Bool)

(assert (=> b!1512330 m!1394565))

(assert (=> b!1512327 m!1394543))

(assert (=> b!1512327 m!1394543))

(declare-fun m!1394567 () Bool)

(assert (=> b!1512327 m!1394567))

(assert (=> b!1512336 m!1394543))

(assert (=> b!1512336 m!1394543))

(declare-fun m!1394569 () Bool)

(assert (=> b!1512336 m!1394569))

(declare-fun m!1394571 () Bool)

(assert (=> b!1512333 m!1394571))

(declare-fun m!1394573 () Bool)

(assert (=> start!128948 m!1394573))

(declare-fun m!1394575 () Bool)

(assert (=> start!128948 m!1394575))

(assert (=> b!1512332 m!1394545))

(assert (=> b!1512332 m!1394547))

(assert (=> b!1512332 m!1394547))

(declare-fun m!1394577 () Bool)

(assert (=> b!1512332 m!1394577))

(assert (=> b!1512332 m!1394577))

(assert (=> b!1512332 m!1394547))

(declare-fun m!1394579 () Bool)

(assert (=> b!1512332 m!1394579))

(assert (=> b!1512337 m!1394543))

(assert (=> b!1512337 m!1394543))

(declare-fun m!1394581 () Bool)

(assert (=> b!1512337 m!1394581))

(assert (=> b!1512337 m!1394581))

(assert (=> b!1512337 m!1394543))

(declare-fun m!1394583 () Bool)

(assert (=> b!1512337 m!1394583))

(check-sat (not b!1512335) (not b!1512334) (not b!1512331) (not b!1512330) (not b!1512333) (not b!1512337) (not b!1512332) (not b!1512336) (not b!1512327) (not b!1512328) (not start!128948))
(check-sat)
