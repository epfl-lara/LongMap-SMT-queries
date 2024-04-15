; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120810 () Bool)

(assert start!120810)

(declare-fun b!1405631 () Bool)

(declare-fun res!943906 () Bool)

(declare-fun e!795641 () Bool)

(assert (=> b!1405631 (=> (not res!943906) (not e!795641))))

(declare-datatypes ((array!96070 0))(
  ( (array!96071 (arr!46383 (Array (_ BitVec 32) (_ BitVec 64))) (size!46935 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96070)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96070 (_ BitVec 32)) Bool)

(assert (=> b!1405631 (= res!943906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!795638 () Bool)

(declare-fun b!1405632 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10720 0))(
  ( (MissingZero!10720 (index!45257 (_ BitVec 32))) (Found!10720 (index!45258 (_ BitVec 32))) (Intermediate!10720 (undefined!11532 Bool) (index!45259 (_ BitVec 32)) (x!126860 (_ BitVec 32))) (Undefined!10720) (MissingVacant!10720 (index!45260 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96070 (_ BitVec 32)) SeekEntryResult!10720)

(assert (=> b!1405632 (= e!795638 (= (seekEntryOrOpen!0 (select (arr!46383 a!2901) j!112) a!2901 mask!2840) (Found!10720 j!112)))))

(declare-fun res!943902 () Bool)

(assert (=> start!120810 (=> (not res!943902) (not e!795641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120810 (= res!943902 (validMask!0 mask!2840))))

(assert (=> start!120810 e!795641))

(assert (=> start!120810 true))

(declare-fun array_inv!35616 (array!96070) Bool)

(assert (=> start!120810 (array_inv!35616 a!2901)))

(declare-fun b!1405633 () Bool)

(declare-fun res!943899 () Bool)

(assert (=> b!1405633 (=> (not res!943899) (not e!795641))))

(declare-datatypes ((List!32980 0))(
  ( (Nil!32977) (Cons!32976 (h!34230 (_ BitVec 64)) (t!47666 List!32980)) )
))
(declare-fun arrayNoDuplicates!0 (array!96070 (_ BitVec 32) List!32980) Bool)

(assert (=> b!1405633 (= res!943899 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32977))))

(declare-fun b!1405634 () Bool)

(declare-fun res!943905 () Bool)

(assert (=> b!1405634 (=> (not res!943905) (not e!795641))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405634 (= res!943905 (validKeyInArray!0 (select (arr!46383 a!2901) i!1037)))))

(declare-fun b!1405635 () Bool)

(declare-fun res!943901 () Bool)

(assert (=> b!1405635 (=> (not res!943901) (not e!795641))))

(assert (=> b!1405635 (= res!943901 (and (= (size!46935 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46935 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46935 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405636 () Bool)

(declare-fun res!943900 () Bool)

(assert (=> b!1405636 (=> (not res!943900) (not e!795641))))

(assert (=> b!1405636 (= res!943900 (validKeyInArray!0 (select (arr!46383 a!2901) j!112)))))

(declare-fun b!1405637 () Bool)

(declare-fun e!795640 () Bool)

(assert (=> b!1405637 (= e!795640 true)))

(declare-fun lt!618922 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405637 (= lt!618922 (toIndex!0 (select (store (arr!46383 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1405638 () Bool)

(assert (=> b!1405638 (= e!795641 (not e!795640))))

(declare-fun res!943903 () Bool)

(assert (=> b!1405638 (=> res!943903 e!795640)))

(declare-fun lt!618923 () SeekEntryResult!10720)

(assert (=> b!1405638 (= res!943903 (or (not (is-Intermediate!10720 lt!618923)) (undefined!11532 lt!618923)))))

(assert (=> b!1405638 e!795638))

(declare-fun res!943904 () Bool)

(assert (=> b!1405638 (=> (not res!943904) (not e!795638))))

(assert (=> b!1405638 (= res!943904 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47257 0))(
  ( (Unit!47258) )
))
(declare-fun lt!618921 () Unit!47257)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47257)

(assert (=> b!1405638 (= lt!618921 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96070 (_ BitVec 32)) SeekEntryResult!10720)

(assert (=> b!1405638 (= lt!618923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46383 a!2901) j!112) mask!2840) (select (arr!46383 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120810 res!943902) b!1405635))

(assert (= (and b!1405635 res!943901) b!1405634))

(assert (= (and b!1405634 res!943905) b!1405636))

(assert (= (and b!1405636 res!943900) b!1405631))

(assert (= (and b!1405631 res!943906) b!1405633))

(assert (= (and b!1405633 res!943899) b!1405638))

(assert (= (and b!1405638 res!943904) b!1405632))

(assert (= (and b!1405638 (not res!943903)) b!1405637))

(declare-fun m!1294025 () Bool)

(assert (=> b!1405638 m!1294025))

(declare-fun m!1294027 () Bool)

(assert (=> b!1405638 m!1294027))

(assert (=> b!1405638 m!1294025))

(declare-fun m!1294029 () Bool)

(assert (=> b!1405638 m!1294029))

(assert (=> b!1405638 m!1294027))

(assert (=> b!1405638 m!1294025))

(declare-fun m!1294031 () Bool)

(assert (=> b!1405638 m!1294031))

(declare-fun m!1294033 () Bool)

(assert (=> b!1405638 m!1294033))

(declare-fun m!1294035 () Bool)

(assert (=> b!1405637 m!1294035))

(declare-fun m!1294037 () Bool)

(assert (=> b!1405637 m!1294037))

(assert (=> b!1405637 m!1294037))

(declare-fun m!1294039 () Bool)

(assert (=> b!1405637 m!1294039))

(declare-fun m!1294041 () Bool)

(assert (=> start!120810 m!1294041))

(declare-fun m!1294043 () Bool)

(assert (=> start!120810 m!1294043))

(declare-fun m!1294045 () Bool)

(assert (=> b!1405631 m!1294045))

(assert (=> b!1405636 m!1294025))

(assert (=> b!1405636 m!1294025))

(declare-fun m!1294047 () Bool)

(assert (=> b!1405636 m!1294047))

(declare-fun m!1294049 () Bool)

(assert (=> b!1405633 m!1294049))

(declare-fun m!1294051 () Bool)

(assert (=> b!1405634 m!1294051))

(assert (=> b!1405634 m!1294051))

(declare-fun m!1294053 () Bool)

(assert (=> b!1405634 m!1294053))

(assert (=> b!1405632 m!1294025))

(assert (=> b!1405632 m!1294025))

(declare-fun m!1294055 () Bool)

(assert (=> b!1405632 m!1294055))

(push 1)

(assert (not b!1405631))

(assert (not start!120810))

(assert (not b!1405636))

(assert (not b!1405633))

(assert (not b!1405638))

(assert (not b!1405632))

(assert (not b!1405637))

(assert (not b!1405634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

