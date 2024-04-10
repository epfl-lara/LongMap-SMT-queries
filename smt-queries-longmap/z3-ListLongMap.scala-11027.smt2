; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128996 () Bool)

(assert start!128996)

(declare-fun b!1512587 () Bool)

(declare-fun res!1032492 () Bool)

(declare-fun e!844270 () Bool)

(assert (=> b!1512587 (=> (not res!1032492) (not e!844270))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100852 0))(
  ( (array!100853 (arr!48663 (Array (_ BitVec 32) (_ BitVec 64))) (size!49213 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100852)

(declare-datatypes ((SeekEntryResult!12834 0))(
  ( (MissingZero!12834 (index!53731 (_ BitVec 32))) (Found!12834 (index!53732 (_ BitVec 32))) (Intermediate!12834 (undefined!13646 Bool) (index!53733 (_ BitVec 32)) (x!135456 (_ BitVec 32))) (Undefined!12834) (MissingVacant!12834 (index!53734 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100852 (_ BitVec 32)) SeekEntryResult!12834)

(assert (=> b!1512587 (= res!1032492 (= (seekEntry!0 (select (arr!48663 a!2804) j!70) a!2804 mask!2512) (Found!12834 j!70)))))

(declare-fun b!1512588 () Bool)

(declare-fun e!844269 () Bool)

(assert (=> b!1512588 (= e!844270 e!844269)))

(declare-fun res!1032494 () Bool)

(assert (=> b!1512588 (=> res!1032494 e!844269)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512588 (= res!1032494 (or (not (= (select (arr!48663 a!2804) j!70) (select (store (arr!48663 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48663 a!2804) index!487) (select (arr!48663 a!2804) j!70)) (not (= (select (arr!48663 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512589 () Bool)

(declare-fun res!1032496 () Bool)

(declare-fun e!844267 () Bool)

(assert (=> b!1512589 (=> (not res!1032496) (not e!844267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100852 (_ BitVec 32)) Bool)

(assert (=> b!1512589 (= res!1032496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512590 () Bool)

(declare-fun res!1032497 () Bool)

(declare-fun e!844268 () Bool)

(assert (=> b!1512590 (=> (not res!1032497) (not e!844268))))

(declare-fun lt!655709 () SeekEntryResult!12834)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100852 (_ BitVec 32)) SeekEntryResult!12834)

(assert (=> b!1512590 (= res!1032497 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48663 a!2804) j!70) a!2804 mask!2512) lt!655709))))

(declare-fun b!1512591 () Bool)

(declare-fun res!1032501 () Bool)

(assert (=> b!1512591 (=> (not res!1032501) (not e!844267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512591 (= res!1032501 (validKeyInArray!0 (select (arr!48663 a!2804) i!961)))))

(declare-fun b!1512592 () Bool)

(assert (=> b!1512592 (= e!844267 e!844268)))

(declare-fun res!1032491 () Bool)

(assert (=> b!1512592 (=> (not res!1032491) (not e!844268))))

(declare-fun lt!655711 () SeekEntryResult!12834)

(assert (=> b!1512592 (= res!1032491 (= lt!655711 lt!655709))))

(assert (=> b!1512592 (= lt!655709 (Intermediate!12834 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512592 (= lt!655711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48663 a!2804) j!70) mask!2512) (select (arr!48663 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512593 () Bool)

(assert (=> b!1512593 (= e!844268 (not true))))

(assert (=> b!1512593 e!844270))

(declare-fun res!1032500 () Bool)

(assert (=> b!1512593 (=> (not res!1032500) (not e!844270))))

(assert (=> b!1512593 (= res!1032500 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50536 0))(
  ( (Unit!50537) )
))
(declare-fun lt!655710 () Unit!50536)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50536)

(assert (=> b!1512593 (= lt!655710 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512594 () Bool)

(declare-fun res!1032495 () Bool)

(assert (=> b!1512594 (=> (not res!1032495) (not e!844267))))

(assert (=> b!1512594 (= res!1032495 (and (= (size!49213 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49213 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49213 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512595 () Bool)

(declare-fun res!1032499 () Bool)

(assert (=> b!1512595 (=> (not res!1032499) (not e!844268))))

(assert (=> b!1512595 (= res!1032499 (= lt!655711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48663 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48663 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100853 (store (arr!48663 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49213 a!2804)) mask!2512)))))

(declare-fun b!1512596 () Bool)

(declare-fun res!1032490 () Bool)

(assert (=> b!1512596 (=> (not res!1032490) (not e!844267))))

(declare-datatypes ((List!35146 0))(
  ( (Nil!35143) (Cons!35142 (h!36554 (_ BitVec 64)) (t!49840 List!35146)) )
))
(declare-fun arrayNoDuplicates!0 (array!100852 (_ BitVec 32) List!35146) Bool)

(assert (=> b!1512596 (= res!1032490 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35143))))

(declare-fun res!1032493 () Bool)

(assert (=> start!128996 (=> (not res!1032493) (not e!844267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128996 (= res!1032493 (validMask!0 mask!2512))))

(assert (=> start!128996 e!844267))

(assert (=> start!128996 true))

(declare-fun array_inv!37691 (array!100852) Bool)

(assert (=> start!128996 (array_inv!37691 a!2804)))

(declare-fun b!1512597 () Bool)

(declare-fun res!1032498 () Bool)

(assert (=> b!1512597 (=> (not res!1032498) (not e!844267))))

(assert (=> b!1512597 (= res!1032498 (validKeyInArray!0 (select (arr!48663 a!2804) j!70)))))

(declare-fun b!1512598 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100852 (_ BitVec 32)) SeekEntryResult!12834)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100852 (_ BitVec 32)) SeekEntryResult!12834)

(assert (=> b!1512598 (= e!844269 (= (seekEntryOrOpen!0 (select (arr!48663 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48663 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512599 () Bool)

(declare-fun res!1032502 () Bool)

(assert (=> b!1512599 (=> (not res!1032502) (not e!844267))))

(assert (=> b!1512599 (= res!1032502 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49213 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49213 a!2804))))))

(assert (= (and start!128996 res!1032493) b!1512594))

(assert (= (and b!1512594 res!1032495) b!1512591))

(assert (= (and b!1512591 res!1032501) b!1512597))

(assert (= (and b!1512597 res!1032498) b!1512589))

(assert (= (and b!1512589 res!1032496) b!1512596))

(assert (= (and b!1512596 res!1032490) b!1512599))

(assert (= (and b!1512599 res!1032502) b!1512592))

(assert (= (and b!1512592 res!1032491) b!1512590))

(assert (= (and b!1512590 res!1032497) b!1512595))

(assert (= (and b!1512595 res!1032499) b!1512593))

(assert (= (and b!1512593 res!1032500) b!1512587))

(assert (= (and b!1512587 res!1032492) b!1512588))

(assert (= (and b!1512588 (not res!1032494)) b!1512598))

(declare-fun m!1395367 () Bool)

(assert (=> b!1512587 m!1395367))

(assert (=> b!1512587 m!1395367))

(declare-fun m!1395369 () Bool)

(assert (=> b!1512587 m!1395369))

(declare-fun m!1395371 () Bool)

(assert (=> b!1512593 m!1395371))

(declare-fun m!1395373 () Bool)

(assert (=> b!1512593 m!1395373))

(declare-fun m!1395375 () Bool)

(assert (=> start!128996 m!1395375))

(declare-fun m!1395377 () Bool)

(assert (=> start!128996 m!1395377))

(assert (=> b!1512592 m!1395367))

(assert (=> b!1512592 m!1395367))

(declare-fun m!1395379 () Bool)

(assert (=> b!1512592 m!1395379))

(assert (=> b!1512592 m!1395379))

(assert (=> b!1512592 m!1395367))

(declare-fun m!1395381 () Bool)

(assert (=> b!1512592 m!1395381))

(assert (=> b!1512597 m!1395367))

(assert (=> b!1512597 m!1395367))

(declare-fun m!1395383 () Bool)

(assert (=> b!1512597 m!1395383))

(assert (=> b!1512598 m!1395367))

(assert (=> b!1512598 m!1395367))

(declare-fun m!1395385 () Bool)

(assert (=> b!1512598 m!1395385))

(assert (=> b!1512598 m!1395367))

(declare-fun m!1395387 () Bool)

(assert (=> b!1512598 m!1395387))

(assert (=> b!1512590 m!1395367))

(assert (=> b!1512590 m!1395367))

(declare-fun m!1395389 () Bool)

(assert (=> b!1512590 m!1395389))

(declare-fun m!1395391 () Bool)

(assert (=> b!1512596 m!1395391))

(declare-fun m!1395393 () Bool)

(assert (=> b!1512591 m!1395393))

(assert (=> b!1512591 m!1395393))

(declare-fun m!1395395 () Bool)

(assert (=> b!1512591 m!1395395))

(assert (=> b!1512588 m!1395367))

(declare-fun m!1395397 () Bool)

(assert (=> b!1512588 m!1395397))

(declare-fun m!1395399 () Bool)

(assert (=> b!1512588 m!1395399))

(declare-fun m!1395401 () Bool)

(assert (=> b!1512588 m!1395401))

(declare-fun m!1395403 () Bool)

(assert (=> b!1512589 m!1395403))

(assert (=> b!1512595 m!1395397))

(assert (=> b!1512595 m!1395399))

(assert (=> b!1512595 m!1395399))

(declare-fun m!1395405 () Bool)

(assert (=> b!1512595 m!1395405))

(assert (=> b!1512595 m!1395405))

(assert (=> b!1512595 m!1395399))

(declare-fun m!1395407 () Bool)

(assert (=> b!1512595 m!1395407))

(check-sat (not b!1512591) (not b!1512587) (not b!1512589) (not b!1512592) (not b!1512597) (not b!1512590) (not b!1512595) (not b!1512593) (not start!128996) (not b!1512598) (not b!1512596))
(check-sat)
