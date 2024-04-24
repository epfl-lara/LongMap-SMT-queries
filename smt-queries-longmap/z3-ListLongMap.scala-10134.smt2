; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119702 () Bool)

(assert start!119702)

(declare-fun b!1393624 () Bool)

(declare-fun e!789256 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1393624 (= e!789256 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1393625 () Bool)

(declare-fun res!932518 () Bool)

(declare-fun e!789257 () Bool)

(assert (=> b!1393625 (=> (not res!932518) (not e!789257))))

(declare-datatypes ((array!95357 0))(
  ( (array!95358 (arr!46036 (Array (_ BitVec 32) (_ BitVec 64))) (size!46587 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95357)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393625 (= res!932518 (validKeyInArray!0 (select (arr!46036 a!2901) j!112)))))

(declare-fun res!932513 () Bool)

(assert (=> start!119702 (=> (not res!932513) (not e!789257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119702 (= res!932513 (validMask!0 mask!2840))))

(assert (=> start!119702 e!789257))

(assert (=> start!119702 true))

(declare-fun array_inv!35317 (array!95357) Bool)

(assert (=> start!119702 (array_inv!35317 a!2901)))

(declare-fun b!1393626 () Bool)

(declare-fun e!789255 () Bool)

(declare-datatypes ((SeekEntryResult!10256 0))(
  ( (MissingZero!10256 (index!43395 (_ BitVec 32))) (Found!10256 (index!43396 (_ BitVec 32))) (Intermediate!10256 (undefined!11068 Bool) (index!43397 (_ BitVec 32)) (x!125233 (_ BitVec 32))) (Undefined!10256) (MissingVacant!10256 (index!43398 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95357 (_ BitVec 32)) SeekEntryResult!10256)

(assert (=> b!1393626 (= e!789255 (= (seekEntryOrOpen!0 (select (arr!46036 a!2901) j!112) a!2901 mask!2840) (Found!10256 j!112)))))

(declare-fun b!1393627 () Bool)

(declare-fun res!932521 () Bool)

(assert (=> b!1393627 (=> (not res!932521) (not e!789257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95357 (_ BitVec 32)) Bool)

(assert (=> b!1393627 (= res!932521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393628 () Bool)

(declare-fun res!932519 () Bool)

(assert (=> b!1393628 (=> (not res!932519) (not e!789257))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393628 (= res!932519 (validKeyInArray!0 (select (arr!46036 a!2901) i!1037)))))

(declare-fun b!1393629 () Bool)

(declare-fun res!932517 () Bool)

(assert (=> b!1393629 (=> (not res!932517) (not e!789257))))

(assert (=> b!1393629 (= res!932517 (and (= (size!46587 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46587 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46587 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393630 () Bool)

(declare-fun res!932520 () Bool)

(assert (=> b!1393630 (=> res!932520 e!789256)))

(declare-fun lt!612029 () SeekEntryResult!10256)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95357 (_ BitVec 32)) SeekEntryResult!10256)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393630 (= res!932520 (not (= lt!612029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46036 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46036 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95358 (store (arr!46036 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46587 a!2901)) mask!2840))))))

(declare-fun b!1393631 () Bool)

(declare-fun res!932515 () Bool)

(assert (=> b!1393631 (=> (not res!932515) (not e!789257))))

(declare-datatypes ((List!32542 0))(
  ( (Nil!32539) (Cons!32538 (h!33776 (_ BitVec 64)) (t!47228 List!32542)) )
))
(declare-fun arrayNoDuplicates!0 (array!95357 (_ BitVec 32) List!32542) Bool)

(assert (=> b!1393631 (= res!932515 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32539))))

(declare-fun b!1393632 () Bool)

(assert (=> b!1393632 (= e!789257 (not e!789256))))

(declare-fun res!932514 () Bool)

(assert (=> b!1393632 (=> res!932514 e!789256)))

(get-info :version)

(assert (=> b!1393632 (= res!932514 (or (not ((_ is Intermediate!10256) lt!612029)) (undefined!11068 lt!612029)))))

(assert (=> b!1393632 e!789255))

(declare-fun res!932516 () Bool)

(assert (=> b!1393632 (=> (not res!932516) (not e!789255))))

(assert (=> b!1393632 (= res!932516 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46543 0))(
  ( (Unit!46544) )
))
(declare-fun lt!612028 () Unit!46543)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46543)

(assert (=> b!1393632 (= lt!612028 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393632 (= lt!612029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46036 a!2901) j!112) mask!2840) (select (arr!46036 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119702 res!932513) b!1393629))

(assert (= (and b!1393629 res!932517) b!1393628))

(assert (= (and b!1393628 res!932519) b!1393625))

(assert (= (and b!1393625 res!932518) b!1393627))

(assert (= (and b!1393627 res!932521) b!1393631))

(assert (= (and b!1393631 res!932515) b!1393632))

(assert (= (and b!1393632 res!932516) b!1393626))

(assert (= (and b!1393632 (not res!932514)) b!1393630))

(assert (= (and b!1393630 (not res!932520)) b!1393624))

(declare-fun m!1279603 () Bool)

(assert (=> b!1393627 m!1279603))

(declare-fun m!1279605 () Bool)

(assert (=> b!1393631 m!1279605))

(declare-fun m!1279607 () Bool)

(assert (=> b!1393626 m!1279607))

(assert (=> b!1393626 m!1279607))

(declare-fun m!1279609 () Bool)

(assert (=> b!1393626 m!1279609))

(assert (=> b!1393632 m!1279607))

(declare-fun m!1279611 () Bool)

(assert (=> b!1393632 m!1279611))

(assert (=> b!1393632 m!1279607))

(declare-fun m!1279613 () Bool)

(assert (=> b!1393632 m!1279613))

(assert (=> b!1393632 m!1279611))

(assert (=> b!1393632 m!1279607))

(declare-fun m!1279615 () Bool)

(assert (=> b!1393632 m!1279615))

(declare-fun m!1279617 () Bool)

(assert (=> b!1393632 m!1279617))

(declare-fun m!1279619 () Bool)

(assert (=> b!1393628 m!1279619))

(assert (=> b!1393628 m!1279619))

(declare-fun m!1279621 () Bool)

(assert (=> b!1393628 m!1279621))

(declare-fun m!1279623 () Bool)

(assert (=> b!1393630 m!1279623))

(declare-fun m!1279625 () Bool)

(assert (=> b!1393630 m!1279625))

(assert (=> b!1393630 m!1279625))

(declare-fun m!1279627 () Bool)

(assert (=> b!1393630 m!1279627))

(assert (=> b!1393630 m!1279627))

(assert (=> b!1393630 m!1279625))

(declare-fun m!1279629 () Bool)

(assert (=> b!1393630 m!1279629))

(assert (=> b!1393625 m!1279607))

(assert (=> b!1393625 m!1279607))

(declare-fun m!1279631 () Bool)

(assert (=> b!1393625 m!1279631))

(declare-fun m!1279633 () Bool)

(assert (=> start!119702 m!1279633))

(declare-fun m!1279635 () Bool)

(assert (=> start!119702 m!1279635))

(check-sat (not b!1393628) (not b!1393627) (not b!1393630) (not b!1393625) (not b!1393631) (not start!119702) (not b!1393632) (not b!1393626))
(check-sat)
