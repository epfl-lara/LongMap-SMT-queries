; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119696 () Bool)

(assert start!119696)

(declare-fun b!1393543 () Bool)

(declare-fun res!932438 () Bool)

(declare-fun e!789212 () Bool)

(assert (=> b!1393543 (=> (not res!932438) (not e!789212))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95351 0))(
  ( (array!95352 (arr!46033 (Array (_ BitVec 32) (_ BitVec 64))) (size!46584 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95351)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393543 (= res!932438 (and (= (size!46584 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46584 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46584 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393545 () Bool)

(declare-fun e!789214 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393545 (= e!789214 (validKeyInArray!0 (select (store (arr!46033 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun b!1393546 () Bool)

(declare-fun e!789213 () Bool)

(declare-datatypes ((SeekEntryResult!10253 0))(
  ( (MissingZero!10253 (index!43383 (_ BitVec 32))) (Found!10253 (index!43384 (_ BitVec 32))) (Intermediate!10253 (undefined!11065 Bool) (index!43385 (_ BitVec 32)) (x!125222 (_ BitVec 32))) (Undefined!10253) (MissingVacant!10253 (index!43386 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95351 (_ BitVec 32)) SeekEntryResult!10253)

(assert (=> b!1393546 (= e!789213 (= (seekEntryOrOpen!0 (select (arr!46033 a!2901) j!112) a!2901 mask!2840) (Found!10253 j!112)))))

(declare-fun b!1393547 () Bool)

(declare-fun res!932439 () Bool)

(assert (=> b!1393547 (=> (not res!932439) (not e!789212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95351 (_ BitVec 32)) Bool)

(assert (=> b!1393547 (= res!932439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393548 () Bool)

(declare-fun res!932436 () Bool)

(assert (=> b!1393548 (=> (not res!932436) (not e!789212))))

(declare-datatypes ((List!32539 0))(
  ( (Nil!32536) (Cons!32535 (h!33773 (_ BitVec 64)) (t!47225 List!32539)) )
))
(declare-fun arrayNoDuplicates!0 (array!95351 (_ BitVec 32) List!32539) Bool)

(assert (=> b!1393548 (= res!932436 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32536))))

(declare-fun b!1393549 () Bool)

(declare-fun res!932432 () Bool)

(assert (=> b!1393549 (=> (not res!932432) (not e!789212))))

(assert (=> b!1393549 (= res!932432 (validKeyInArray!0 (select (arr!46033 a!2901) j!112)))))

(declare-fun res!932435 () Bool)

(assert (=> start!119696 (=> (not res!932435) (not e!789212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119696 (= res!932435 (validMask!0 mask!2840))))

(assert (=> start!119696 e!789212))

(assert (=> start!119696 true))

(declare-fun array_inv!35314 (array!95351) Bool)

(assert (=> start!119696 (array_inv!35314 a!2901)))

(declare-fun b!1393544 () Bool)

(declare-fun e!789211 () Bool)

(assert (=> b!1393544 (= e!789212 (not e!789211))))

(declare-fun res!932440 () Bool)

(assert (=> b!1393544 (=> res!932440 e!789211)))

(declare-fun lt!612005 () SeekEntryResult!10253)

(get-info :version)

(assert (=> b!1393544 (= res!932440 (or (not ((_ is Intermediate!10253) lt!612005)) (undefined!11065 lt!612005)))))

(assert (=> b!1393544 e!789213))

(declare-fun res!932433 () Bool)

(assert (=> b!1393544 (=> (not res!932433) (not e!789213))))

(assert (=> b!1393544 (= res!932433 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46537 0))(
  ( (Unit!46538) )
))
(declare-fun lt!612004 () Unit!46537)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95351 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46537)

(assert (=> b!1393544 (= lt!612004 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95351 (_ BitVec 32)) SeekEntryResult!10253)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393544 (= lt!612005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46033 a!2901) j!112) mask!2840) (select (arr!46033 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393550 () Bool)

(declare-fun res!932434 () Bool)

(assert (=> b!1393550 (=> (not res!932434) (not e!789212))))

(assert (=> b!1393550 (= res!932434 (validKeyInArray!0 (select (arr!46033 a!2901) i!1037)))))

(declare-fun b!1393551 () Bool)

(assert (=> b!1393551 (= e!789211 e!789214)))

(declare-fun res!932437 () Bool)

(assert (=> b!1393551 (=> res!932437 e!789214)))

(declare-fun lt!612003 () (_ BitVec 32))

(assert (=> b!1393551 (= res!932437 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt lt!612003 #b00000000000000000000000000000000) (bvsge lt!612003 (bvadd #b00000000000000000000000000000001 mask!2840))))))

(assert (=> b!1393551 (= lt!612003 (toIndex!0 (select (store (arr!46033 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(assert (= (and start!119696 res!932435) b!1393543))

(assert (= (and b!1393543 res!932438) b!1393550))

(assert (= (and b!1393550 res!932434) b!1393549))

(assert (= (and b!1393549 res!932432) b!1393547))

(assert (= (and b!1393547 res!932439) b!1393548))

(assert (= (and b!1393548 res!932436) b!1393544))

(assert (= (and b!1393544 res!932433) b!1393546))

(assert (= (and b!1393544 (not res!932440)) b!1393551))

(assert (= (and b!1393551 (not res!932437)) b!1393545))

(declare-fun m!1279501 () Bool)

(assert (=> b!1393545 m!1279501))

(declare-fun m!1279503 () Bool)

(assert (=> b!1393545 m!1279503))

(assert (=> b!1393545 m!1279503))

(declare-fun m!1279505 () Bool)

(assert (=> b!1393545 m!1279505))

(declare-fun m!1279507 () Bool)

(assert (=> start!119696 m!1279507))

(declare-fun m!1279509 () Bool)

(assert (=> start!119696 m!1279509))

(declare-fun m!1279511 () Bool)

(assert (=> b!1393547 m!1279511))

(declare-fun m!1279513 () Bool)

(assert (=> b!1393549 m!1279513))

(assert (=> b!1393549 m!1279513))

(declare-fun m!1279515 () Bool)

(assert (=> b!1393549 m!1279515))

(declare-fun m!1279517 () Bool)

(assert (=> b!1393550 m!1279517))

(assert (=> b!1393550 m!1279517))

(declare-fun m!1279519 () Bool)

(assert (=> b!1393550 m!1279519))

(assert (=> b!1393551 m!1279501))

(assert (=> b!1393551 m!1279503))

(assert (=> b!1393551 m!1279503))

(declare-fun m!1279521 () Bool)

(assert (=> b!1393551 m!1279521))

(assert (=> b!1393544 m!1279513))

(declare-fun m!1279523 () Bool)

(assert (=> b!1393544 m!1279523))

(assert (=> b!1393544 m!1279513))

(declare-fun m!1279525 () Bool)

(assert (=> b!1393544 m!1279525))

(assert (=> b!1393544 m!1279523))

(assert (=> b!1393544 m!1279513))

(declare-fun m!1279527 () Bool)

(assert (=> b!1393544 m!1279527))

(declare-fun m!1279529 () Bool)

(assert (=> b!1393544 m!1279529))

(assert (=> b!1393546 m!1279513))

(assert (=> b!1393546 m!1279513))

(declare-fun m!1279531 () Bool)

(assert (=> b!1393546 m!1279531))

(declare-fun m!1279533 () Bool)

(assert (=> b!1393548 m!1279533))

(check-sat (not b!1393546) (not b!1393544) (not b!1393547) (not b!1393545) (not b!1393549) (not b!1393548) (not b!1393551) (not start!119696) (not b!1393550))
(check-sat)
