; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120804 () Bool)

(assert start!120804)

(declare-fun b!1405560 () Bool)

(declare-fun res!943833 () Bool)

(declare-fun e!795605 () Bool)

(assert (=> b!1405560 (=> (not res!943833) (not e!795605))))

(declare-datatypes ((array!96064 0))(
  ( (array!96065 (arr!46380 (Array (_ BitVec 32) (_ BitVec 64))) (size!46932 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96064)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405560 (= res!943833 (validKeyInArray!0 (select (arr!46380 a!2901) i!1037)))))

(declare-fun b!1405561 () Bool)

(declare-fun res!943831 () Bool)

(assert (=> b!1405561 (=> (not res!943831) (not e!795605))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96064 (_ BitVec 32)) Bool)

(assert (=> b!1405561 (= res!943831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405562 () Bool)

(assert (=> b!1405562 (= e!795605 (not true))))

(declare-fun e!795603 () Bool)

(assert (=> b!1405562 e!795603))

(declare-fun res!943834 () Bool)

(assert (=> b!1405562 (=> (not res!943834) (not e!795603))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405562 (= res!943834 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47251 0))(
  ( (Unit!47252) )
))
(declare-fun lt!618895 () Unit!47251)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47251)

(assert (=> b!1405562 (= lt!618895 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10717 0))(
  ( (MissingZero!10717 (index!45245 (_ BitVec 32))) (Found!10717 (index!45246 (_ BitVec 32))) (Intermediate!10717 (undefined!11529 Bool) (index!45247 (_ BitVec 32)) (x!126849 (_ BitVec 32))) (Undefined!10717) (MissingVacant!10717 (index!45248 (_ BitVec 32))) )
))
(declare-fun lt!618896 () SeekEntryResult!10717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96064 (_ BitVec 32)) SeekEntryResult!10717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405562 (= lt!618896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46380 a!2901) j!112) mask!2840) (select (arr!46380 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405563 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96064 (_ BitVec 32)) SeekEntryResult!10717)

(assert (=> b!1405563 (= e!795603 (= (seekEntryOrOpen!0 (select (arr!46380 a!2901) j!112) a!2901 mask!2840) (Found!10717 j!112)))))

(declare-fun b!1405564 () Bool)

(declare-fun res!943832 () Bool)

(assert (=> b!1405564 (=> (not res!943832) (not e!795605))))

(assert (=> b!1405564 (= res!943832 (validKeyInArray!0 (select (arr!46380 a!2901) j!112)))))

(declare-fun b!1405565 () Bool)

(declare-fun res!943830 () Bool)

(assert (=> b!1405565 (=> (not res!943830) (not e!795605))))

(assert (=> b!1405565 (= res!943830 (and (= (size!46932 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46932 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46932 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405566 () Bool)

(declare-fun res!943828 () Bool)

(assert (=> b!1405566 (=> (not res!943828) (not e!795605))))

(declare-datatypes ((List!32977 0))(
  ( (Nil!32974) (Cons!32973 (h!34227 (_ BitVec 64)) (t!47663 List!32977)) )
))
(declare-fun arrayNoDuplicates!0 (array!96064 (_ BitVec 32) List!32977) Bool)

(assert (=> b!1405566 (= res!943828 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32974))))

(declare-fun res!943829 () Bool)

(assert (=> start!120804 (=> (not res!943829) (not e!795605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120804 (= res!943829 (validMask!0 mask!2840))))

(assert (=> start!120804 e!795605))

(assert (=> start!120804 true))

(declare-fun array_inv!35613 (array!96064) Bool)

(assert (=> start!120804 (array_inv!35613 a!2901)))

(assert (= (and start!120804 res!943829) b!1405565))

(assert (= (and b!1405565 res!943830) b!1405560))

(assert (= (and b!1405560 res!943833) b!1405564))

(assert (= (and b!1405564 res!943832) b!1405561))

(assert (= (and b!1405561 res!943831) b!1405566))

(assert (= (and b!1405566 res!943828) b!1405562))

(assert (= (and b!1405562 res!943834) b!1405563))

(declare-fun m!1293935 () Bool)

(assert (=> b!1405564 m!1293935))

(assert (=> b!1405564 m!1293935))

(declare-fun m!1293937 () Bool)

(assert (=> b!1405564 m!1293937))

(declare-fun m!1293939 () Bool)

(assert (=> b!1405561 m!1293939))

(assert (=> b!1405562 m!1293935))

(declare-fun m!1293941 () Bool)

(assert (=> b!1405562 m!1293941))

(assert (=> b!1405562 m!1293935))

(declare-fun m!1293943 () Bool)

(assert (=> b!1405562 m!1293943))

(assert (=> b!1405562 m!1293941))

(assert (=> b!1405562 m!1293935))

(declare-fun m!1293945 () Bool)

(assert (=> b!1405562 m!1293945))

(declare-fun m!1293947 () Bool)

(assert (=> b!1405562 m!1293947))

(declare-fun m!1293949 () Bool)

(assert (=> b!1405560 m!1293949))

(assert (=> b!1405560 m!1293949))

(declare-fun m!1293951 () Bool)

(assert (=> b!1405560 m!1293951))

(assert (=> b!1405563 m!1293935))

(assert (=> b!1405563 m!1293935))

(declare-fun m!1293953 () Bool)

(assert (=> b!1405563 m!1293953))

(declare-fun m!1293955 () Bool)

(assert (=> b!1405566 m!1293955))

(declare-fun m!1293957 () Bool)

(assert (=> start!120804 m!1293957))

(declare-fun m!1293959 () Bool)

(assert (=> start!120804 m!1293959))

(push 1)

(assert (not start!120804))

(assert (not b!1405563))

(assert (not b!1405560))

(assert (not b!1405564))

(assert (not b!1405561))

(assert (not b!1405566))

(assert (not b!1405562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

