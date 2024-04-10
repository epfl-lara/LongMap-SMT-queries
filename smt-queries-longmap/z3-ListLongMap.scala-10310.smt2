; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121184 () Bool)

(assert start!121184)

(declare-fun b!1409054 () Bool)

(declare-fun e!797402 () Bool)

(assert (=> b!1409054 (= e!797402 true)))

(declare-datatypes ((array!96338 0))(
  ( (array!96339 (arr!46512 (Array (_ BitVec 32) (_ BitVec 64))) (size!47062 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96338)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10823 0))(
  ( (MissingZero!10823 (index!45669 (_ BitVec 32))) (Found!10823 (index!45670 (_ BitVec 32))) (Intermediate!10823 (undefined!11635 Bool) (index!45671 (_ BitVec 32)) (x!127264 (_ BitVec 32))) (Undefined!10823) (MissingVacant!10823 (index!45672 (_ BitVec 32))) )
))
(declare-fun lt!620580 () SeekEntryResult!10823)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96338 (_ BitVec 32)) SeekEntryResult!10823)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409054 (= lt!620580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46512 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46512 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96339 (store (arr!46512 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47062 a!2901)) mask!2840))))

(declare-fun b!1409055 () Bool)

(declare-fun e!797405 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96338 (_ BitVec 32)) SeekEntryResult!10823)

(assert (=> b!1409055 (= e!797405 (= (seekEntryOrOpen!0 (select (arr!46512 a!2901) j!112) a!2901 mask!2840) (Found!10823 j!112)))))

(declare-fun b!1409056 () Bool)

(declare-fun res!946783 () Bool)

(declare-fun e!797404 () Bool)

(assert (=> b!1409056 (=> (not res!946783) (not e!797404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409056 (= res!946783 (validKeyInArray!0 (select (arr!46512 a!2901) j!112)))))

(declare-fun b!1409057 () Bool)

(declare-fun res!946781 () Bool)

(assert (=> b!1409057 (=> (not res!946781) (not e!797404))))

(assert (=> b!1409057 (= res!946781 (validKeyInArray!0 (select (arr!46512 a!2901) i!1037)))))

(declare-fun b!1409058 () Bool)

(declare-fun res!946780 () Bool)

(assert (=> b!1409058 (=> (not res!946780) (not e!797404))))

(assert (=> b!1409058 (= res!946780 (and (= (size!47062 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47062 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47062 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409059 () Bool)

(declare-fun res!946776 () Bool)

(assert (=> b!1409059 (=> (not res!946776) (not e!797404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96338 (_ BitVec 32)) Bool)

(assert (=> b!1409059 (= res!946776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409060 () Bool)

(assert (=> b!1409060 (= e!797404 (not e!797402))))

(declare-fun res!946782 () Bool)

(assert (=> b!1409060 (=> res!946782 e!797402)))

(declare-fun lt!620579 () SeekEntryResult!10823)

(get-info :version)

(assert (=> b!1409060 (= res!946782 (or (not ((_ is Intermediate!10823) lt!620579)) (undefined!11635 lt!620579)))))

(assert (=> b!1409060 e!797405))

(declare-fun res!946777 () Bool)

(assert (=> b!1409060 (=> (not res!946777) (not e!797405))))

(assert (=> b!1409060 (= res!946777 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47620 0))(
  ( (Unit!47621) )
))
(declare-fun lt!620578 () Unit!47620)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47620)

(assert (=> b!1409060 (= lt!620578 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409060 (= lt!620579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46512 a!2901) j!112) mask!2840) (select (arr!46512 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!946778 () Bool)

(assert (=> start!121184 (=> (not res!946778) (not e!797404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121184 (= res!946778 (validMask!0 mask!2840))))

(assert (=> start!121184 e!797404))

(assert (=> start!121184 true))

(declare-fun array_inv!35540 (array!96338) Bool)

(assert (=> start!121184 (array_inv!35540 a!2901)))

(declare-fun b!1409061 () Bool)

(declare-fun res!946779 () Bool)

(assert (=> b!1409061 (=> (not res!946779) (not e!797404))))

(declare-datatypes ((List!33031 0))(
  ( (Nil!33028) (Cons!33027 (h!34290 (_ BitVec 64)) (t!47725 List!33031)) )
))
(declare-fun arrayNoDuplicates!0 (array!96338 (_ BitVec 32) List!33031) Bool)

(assert (=> b!1409061 (= res!946779 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33028))))

(assert (= (and start!121184 res!946778) b!1409058))

(assert (= (and b!1409058 res!946780) b!1409057))

(assert (= (and b!1409057 res!946781) b!1409056))

(assert (= (and b!1409056 res!946783) b!1409059))

(assert (= (and b!1409059 res!946776) b!1409061))

(assert (= (and b!1409061 res!946779) b!1409060))

(assert (= (and b!1409060 res!946777) b!1409055))

(assert (= (and b!1409060 (not res!946782)) b!1409054))

(declare-fun m!1298611 () Bool)

(assert (=> b!1409059 m!1298611))

(declare-fun m!1298613 () Bool)

(assert (=> b!1409057 m!1298613))

(assert (=> b!1409057 m!1298613))

(declare-fun m!1298615 () Bool)

(assert (=> b!1409057 m!1298615))

(declare-fun m!1298617 () Bool)

(assert (=> b!1409055 m!1298617))

(assert (=> b!1409055 m!1298617))

(declare-fun m!1298619 () Bool)

(assert (=> b!1409055 m!1298619))

(declare-fun m!1298621 () Bool)

(assert (=> b!1409061 m!1298621))

(assert (=> b!1409060 m!1298617))

(declare-fun m!1298623 () Bool)

(assert (=> b!1409060 m!1298623))

(assert (=> b!1409060 m!1298617))

(declare-fun m!1298625 () Bool)

(assert (=> b!1409060 m!1298625))

(assert (=> b!1409060 m!1298623))

(assert (=> b!1409060 m!1298617))

(declare-fun m!1298627 () Bool)

(assert (=> b!1409060 m!1298627))

(declare-fun m!1298629 () Bool)

(assert (=> b!1409060 m!1298629))

(declare-fun m!1298631 () Bool)

(assert (=> b!1409054 m!1298631))

(declare-fun m!1298633 () Bool)

(assert (=> b!1409054 m!1298633))

(assert (=> b!1409054 m!1298633))

(declare-fun m!1298635 () Bool)

(assert (=> b!1409054 m!1298635))

(assert (=> b!1409054 m!1298635))

(assert (=> b!1409054 m!1298633))

(declare-fun m!1298637 () Bool)

(assert (=> b!1409054 m!1298637))

(declare-fun m!1298639 () Bool)

(assert (=> start!121184 m!1298639))

(declare-fun m!1298641 () Bool)

(assert (=> start!121184 m!1298641))

(assert (=> b!1409056 m!1298617))

(assert (=> b!1409056 m!1298617))

(declare-fun m!1298643 () Bool)

(assert (=> b!1409056 m!1298643))

(check-sat (not b!1409055) (not b!1409057) (not b!1409054) (not b!1409056) (not b!1409061) (not b!1409059) (not start!121184) (not b!1409060))
