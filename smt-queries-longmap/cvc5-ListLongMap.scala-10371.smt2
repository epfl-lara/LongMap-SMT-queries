; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122094 () Bool)

(assert start!122094)

(declare-fun e!801875 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96729 0))(
  ( (array!96730 (arr!46694 (Array (_ BitVec 32) (_ BitVec 64))) (size!47244 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96729)

(declare-fun b!1416806 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11005 0))(
  ( (MissingZero!11005 (index!46412 (_ BitVec 32))) (Found!11005 (index!46413 (_ BitVec 32))) (Intermediate!11005 (undefined!11817 Bool) (index!46414 (_ BitVec 32)) (x!128018 (_ BitVec 32))) (Undefined!11005) (MissingVacant!11005 (index!46415 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96729 (_ BitVec 32)) SeekEntryResult!11005)

(assert (=> b!1416806 (= e!801875 (= (seekEntryOrOpen!0 (select (arr!46694 a!2901) j!112) a!2901 mask!2840) (Found!11005 j!112)))))

(declare-fun b!1416807 () Bool)

(declare-fun res!952685 () Bool)

(declare-fun e!801874 () Bool)

(assert (=> b!1416807 (=> (not res!952685) (not e!801874))))

(declare-datatypes ((List!33213 0))(
  ( (Nil!33210) (Cons!33209 (h!34499 (_ BitVec 64)) (t!47907 List!33213)) )
))
(declare-fun arrayNoDuplicates!0 (array!96729 (_ BitVec 32) List!33213) Bool)

(assert (=> b!1416807 (= res!952685 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33210))))

(declare-fun b!1416808 () Bool)

(declare-fun e!801872 () Bool)

(assert (=> b!1416808 (= e!801872 true)))

(declare-fun lt!625123 () SeekEntryResult!11005)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96729 (_ BitVec 32)) SeekEntryResult!11005)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416808 (= lt!625123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46694 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46694 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96730 (store (arr!46694 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47244 a!2901)) mask!2840))))

(declare-fun b!1416809 () Bool)

(declare-fun res!952689 () Bool)

(assert (=> b!1416809 (=> (not res!952689) (not e!801874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416809 (= res!952689 (validKeyInArray!0 (select (arr!46694 a!2901) i!1037)))))

(declare-fun b!1416810 () Bool)

(assert (=> b!1416810 (= e!801874 (not e!801872))))

(declare-fun res!952687 () Bool)

(assert (=> b!1416810 (=> res!952687 e!801872)))

(declare-fun lt!625125 () SeekEntryResult!11005)

(assert (=> b!1416810 (= res!952687 (or (not (is-Intermediate!11005 lt!625125)) (undefined!11817 lt!625125)))))

(assert (=> b!1416810 e!801875))

(declare-fun res!952690 () Bool)

(assert (=> b!1416810 (=> (not res!952690) (not e!801875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96729 (_ BitVec 32)) Bool)

(assert (=> b!1416810 (= res!952690 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47984 0))(
  ( (Unit!47985) )
))
(declare-fun lt!625124 () Unit!47984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47984)

(assert (=> b!1416810 (= lt!625124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416810 (= lt!625125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46694 a!2901) j!112) mask!2840) (select (arr!46694 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416812 () Bool)

(declare-fun res!952683 () Bool)

(assert (=> b!1416812 (=> (not res!952683) (not e!801874))))

(assert (=> b!1416812 (= res!952683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416813 () Bool)

(declare-fun res!952686 () Bool)

(assert (=> b!1416813 (=> (not res!952686) (not e!801874))))

(assert (=> b!1416813 (= res!952686 (validKeyInArray!0 (select (arr!46694 a!2901) j!112)))))

(declare-fun res!952688 () Bool)

(assert (=> start!122094 (=> (not res!952688) (not e!801874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122094 (= res!952688 (validMask!0 mask!2840))))

(assert (=> start!122094 e!801874))

(assert (=> start!122094 true))

(declare-fun array_inv!35722 (array!96729) Bool)

(assert (=> start!122094 (array_inv!35722 a!2901)))

(declare-fun b!1416811 () Bool)

(declare-fun res!952684 () Bool)

(assert (=> b!1416811 (=> (not res!952684) (not e!801874))))

(assert (=> b!1416811 (= res!952684 (and (= (size!47244 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47244 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47244 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122094 res!952688) b!1416811))

(assert (= (and b!1416811 res!952684) b!1416809))

(assert (= (and b!1416809 res!952689) b!1416813))

(assert (= (and b!1416813 res!952686) b!1416812))

(assert (= (and b!1416812 res!952683) b!1416807))

(assert (= (and b!1416807 res!952685) b!1416810))

(assert (= (and b!1416810 res!952690) b!1416806))

(assert (= (and b!1416810 (not res!952687)) b!1416808))

(declare-fun m!1307475 () Bool)

(assert (=> b!1416808 m!1307475))

(declare-fun m!1307477 () Bool)

(assert (=> b!1416808 m!1307477))

(assert (=> b!1416808 m!1307477))

(declare-fun m!1307479 () Bool)

(assert (=> b!1416808 m!1307479))

(assert (=> b!1416808 m!1307479))

(assert (=> b!1416808 m!1307477))

(declare-fun m!1307481 () Bool)

(assert (=> b!1416808 m!1307481))

(declare-fun m!1307483 () Bool)

(assert (=> b!1416806 m!1307483))

(assert (=> b!1416806 m!1307483))

(declare-fun m!1307485 () Bool)

(assert (=> b!1416806 m!1307485))

(declare-fun m!1307487 () Bool)

(assert (=> b!1416807 m!1307487))

(declare-fun m!1307489 () Bool)

(assert (=> b!1416809 m!1307489))

(assert (=> b!1416809 m!1307489))

(declare-fun m!1307491 () Bool)

(assert (=> b!1416809 m!1307491))

(assert (=> b!1416813 m!1307483))

(assert (=> b!1416813 m!1307483))

(declare-fun m!1307493 () Bool)

(assert (=> b!1416813 m!1307493))

(declare-fun m!1307495 () Bool)

(assert (=> start!122094 m!1307495))

(declare-fun m!1307497 () Bool)

(assert (=> start!122094 m!1307497))

(assert (=> b!1416810 m!1307483))

(declare-fun m!1307499 () Bool)

(assert (=> b!1416810 m!1307499))

(assert (=> b!1416810 m!1307483))

(declare-fun m!1307501 () Bool)

(assert (=> b!1416810 m!1307501))

(assert (=> b!1416810 m!1307499))

(assert (=> b!1416810 m!1307483))

(declare-fun m!1307503 () Bool)

(assert (=> b!1416810 m!1307503))

(declare-fun m!1307505 () Bool)

(assert (=> b!1416810 m!1307505))

(declare-fun m!1307507 () Bool)

(assert (=> b!1416812 m!1307507))

(push 1)

(assert (not b!1416807))

(assert (not b!1416813))

(assert (not b!1416809))

(assert (not start!122094))

(assert (not b!1416808))

(assert (not b!1416806))

(assert (not b!1416810))

(assert (not b!1416812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

