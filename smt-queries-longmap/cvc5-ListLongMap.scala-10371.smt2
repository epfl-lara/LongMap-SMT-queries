; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122094 () Bool)

(assert start!122094)

(declare-fun b!1416773 () Bool)

(declare-fun res!952706 () Bool)

(declare-fun e!801860 () Bool)

(assert (=> b!1416773 (=> (not res!952706) (not e!801860))))

(declare-datatypes ((array!96682 0))(
  ( (array!96683 (arr!46671 (Array (_ BitVec 32) (_ BitVec 64))) (size!47223 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96682)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416773 (= res!952706 (validKeyInArray!0 (select (arr!46671 a!2901) j!112)))))

(declare-fun b!1416774 () Bool)

(declare-fun res!952701 () Bool)

(assert (=> b!1416774 (=> (not res!952701) (not e!801860))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416774 (= res!952701 (and (= (size!47223 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47223 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47223 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416775 () Bool)

(declare-fun e!801858 () Bool)

(assert (=> b!1416775 (= e!801860 (not e!801858))))

(declare-fun res!952705 () Bool)

(assert (=> b!1416775 (=> res!952705 e!801858)))

(declare-datatypes ((SeekEntryResult!11008 0))(
  ( (MissingZero!11008 (index!46424 (_ BitVec 32))) (Found!11008 (index!46425 (_ BitVec 32))) (Intermediate!11008 (undefined!11820 Bool) (index!46426 (_ BitVec 32)) (x!128018 (_ BitVec 32))) (Undefined!11008) (MissingVacant!11008 (index!46427 (_ BitVec 32))) )
))
(declare-fun lt!624952 () SeekEntryResult!11008)

(assert (=> b!1416775 (= res!952705 (or (not (is-Intermediate!11008 lt!624952)) (undefined!11820 lt!624952)))))

(declare-fun e!801859 () Bool)

(assert (=> b!1416775 e!801859))

(declare-fun res!952702 () Bool)

(assert (=> b!1416775 (=> (not res!952702) (not e!801859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96682 (_ BitVec 32)) Bool)

(assert (=> b!1416775 (= res!952702 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47833 0))(
  ( (Unit!47834) )
))
(declare-fun lt!624953 () Unit!47833)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47833)

(assert (=> b!1416775 (= lt!624953 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96682 (_ BitVec 32)) SeekEntryResult!11008)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416775 (= lt!624952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46671 a!2901) j!112) mask!2840) (select (arr!46671 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416776 () Bool)

(declare-fun res!952704 () Bool)

(assert (=> b!1416776 (=> (not res!952704) (not e!801860))))

(declare-datatypes ((List!33268 0))(
  ( (Nil!33265) (Cons!33264 (h!34554 (_ BitVec 64)) (t!47954 List!33268)) )
))
(declare-fun arrayNoDuplicates!0 (array!96682 (_ BitVec 32) List!33268) Bool)

(assert (=> b!1416776 (= res!952704 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33265))))

(declare-fun b!1416777 () Bool)

(declare-fun res!952708 () Bool)

(assert (=> b!1416777 (=> (not res!952708) (not e!801860))))

(assert (=> b!1416777 (= res!952708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416778 () Bool)

(assert (=> b!1416778 (= e!801858 true)))

(declare-fun lt!624951 () SeekEntryResult!11008)

(assert (=> b!1416778 (= lt!624951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46671 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46671 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96683 (store (arr!46671 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47223 a!2901)) mask!2840))))

(declare-fun res!952703 () Bool)

(assert (=> start!122094 (=> (not res!952703) (not e!801860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122094 (= res!952703 (validMask!0 mask!2840))))

(assert (=> start!122094 e!801860))

(assert (=> start!122094 true))

(declare-fun array_inv!35904 (array!96682) Bool)

(assert (=> start!122094 (array_inv!35904 a!2901)))

(declare-fun b!1416779 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96682 (_ BitVec 32)) SeekEntryResult!11008)

(assert (=> b!1416779 (= e!801859 (= (seekEntryOrOpen!0 (select (arr!46671 a!2901) j!112) a!2901 mask!2840) (Found!11008 j!112)))))

(declare-fun b!1416780 () Bool)

(declare-fun res!952707 () Bool)

(assert (=> b!1416780 (=> (not res!952707) (not e!801860))))

(assert (=> b!1416780 (= res!952707 (validKeyInArray!0 (select (arr!46671 a!2901) i!1037)))))

(assert (= (and start!122094 res!952703) b!1416774))

(assert (= (and b!1416774 res!952701) b!1416780))

(assert (= (and b!1416780 res!952707) b!1416773))

(assert (= (and b!1416773 res!952706) b!1416777))

(assert (= (and b!1416777 res!952708) b!1416776))

(assert (= (and b!1416776 res!952704) b!1416775))

(assert (= (and b!1416775 res!952702) b!1416779))

(assert (= (and b!1416775 (not res!952705)) b!1416778))

(declare-fun m!1307007 () Bool)

(assert (=> b!1416778 m!1307007))

(declare-fun m!1307009 () Bool)

(assert (=> b!1416778 m!1307009))

(assert (=> b!1416778 m!1307009))

(declare-fun m!1307011 () Bool)

(assert (=> b!1416778 m!1307011))

(assert (=> b!1416778 m!1307011))

(assert (=> b!1416778 m!1307009))

(declare-fun m!1307013 () Bool)

(assert (=> b!1416778 m!1307013))

(declare-fun m!1307015 () Bool)

(assert (=> start!122094 m!1307015))

(declare-fun m!1307017 () Bool)

(assert (=> start!122094 m!1307017))

(declare-fun m!1307019 () Bool)

(assert (=> b!1416776 m!1307019))

(declare-fun m!1307021 () Bool)

(assert (=> b!1416775 m!1307021))

(declare-fun m!1307023 () Bool)

(assert (=> b!1416775 m!1307023))

(assert (=> b!1416775 m!1307021))

(declare-fun m!1307025 () Bool)

(assert (=> b!1416775 m!1307025))

(assert (=> b!1416775 m!1307023))

(assert (=> b!1416775 m!1307021))

(declare-fun m!1307027 () Bool)

(assert (=> b!1416775 m!1307027))

(declare-fun m!1307029 () Bool)

(assert (=> b!1416775 m!1307029))

(assert (=> b!1416779 m!1307021))

(assert (=> b!1416779 m!1307021))

(declare-fun m!1307031 () Bool)

(assert (=> b!1416779 m!1307031))

(assert (=> b!1416773 m!1307021))

(assert (=> b!1416773 m!1307021))

(declare-fun m!1307033 () Bool)

(assert (=> b!1416773 m!1307033))

(declare-fun m!1307035 () Bool)

(assert (=> b!1416780 m!1307035))

(assert (=> b!1416780 m!1307035))

(declare-fun m!1307037 () Bool)

(assert (=> b!1416780 m!1307037))

(declare-fun m!1307039 () Bool)

(assert (=> b!1416777 m!1307039))

(push 1)

(assert (not b!1416776))

(assert (not b!1416777))

(assert (not b!1416773))

(assert (not b!1416780))

(assert (not start!122094))

(assert (not b!1416779))

(assert (not b!1416778))

(assert (not b!1416775))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

