; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119098 () Bool)

(assert start!119098)

(declare-fun b!1389487 () Bool)

(declare-fun res!929651 () Bool)

(declare-fun e!787057 () Bool)

(assert (=> b!1389487 (=> (not res!929651) (not e!787057))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95035 0))(
  ( (array!95036 (arr!45883 (Array (_ BitVec 32) (_ BitVec 64))) (size!46433 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95035)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389487 (= res!929651 (and (= (size!46433 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46433 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46433 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389488 () Bool)

(assert (=> b!1389488 (= e!787057 false)))

(declare-fun lt!610575 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389488 (= lt!610575 (toIndex!0 (select (arr!45883 a!2901) j!112) mask!2840))))

(declare-fun b!1389489 () Bool)

(declare-fun res!929649 () Bool)

(assert (=> b!1389489 (=> (not res!929649) (not e!787057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389489 (= res!929649 (validKeyInArray!0 (select (arr!45883 a!2901) i!1037)))))

(declare-fun b!1389490 () Bool)

(declare-fun res!929653 () Bool)

(assert (=> b!1389490 (=> (not res!929653) (not e!787057))))

(declare-datatypes ((List!32402 0))(
  ( (Nil!32399) (Cons!32398 (h!33616 (_ BitVec 64)) (t!47096 List!32402)) )
))
(declare-fun arrayNoDuplicates!0 (array!95035 (_ BitVec 32) List!32402) Bool)

(assert (=> b!1389490 (= res!929653 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32399))))

(declare-fun res!929648 () Bool)

(assert (=> start!119098 (=> (not res!929648) (not e!787057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119098 (= res!929648 (validMask!0 mask!2840))))

(assert (=> start!119098 e!787057))

(assert (=> start!119098 true))

(declare-fun array_inv!34911 (array!95035) Bool)

(assert (=> start!119098 (array_inv!34911 a!2901)))

(declare-fun b!1389491 () Bool)

(declare-fun res!929652 () Bool)

(assert (=> b!1389491 (=> (not res!929652) (not e!787057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95035 (_ BitVec 32)) Bool)

(assert (=> b!1389491 (= res!929652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389492 () Bool)

(declare-fun res!929650 () Bool)

(assert (=> b!1389492 (=> (not res!929650) (not e!787057))))

(assert (=> b!1389492 (= res!929650 (validKeyInArray!0 (select (arr!45883 a!2901) j!112)))))

(assert (= (and start!119098 res!929648) b!1389487))

(assert (= (and b!1389487 res!929651) b!1389489))

(assert (= (and b!1389489 res!929649) b!1389492))

(assert (= (and b!1389492 res!929650) b!1389491))

(assert (= (and b!1389491 res!929652) b!1389490))

(assert (= (and b!1389490 res!929653) b!1389488))

(declare-fun m!1275129 () Bool)

(assert (=> b!1389492 m!1275129))

(assert (=> b!1389492 m!1275129))

(declare-fun m!1275131 () Bool)

(assert (=> b!1389492 m!1275131))

(declare-fun m!1275133 () Bool)

(assert (=> b!1389491 m!1275133))

(declare-fun m!1275135 () Bool)

(assert (=> start!119098 m!1275135))

(declare-fun m!1275137 () Bool)

(assert (=> start!119098 m!1275137))

(declare-fun m!1275139 () Bool)

(assert (=> b!1389490 m!1275139))

(assert (=> b!1389488 m!1275129))

(assert (=> b!1389488 m!1275129))

(declare-fun m!1275141 () Bool)

(assert (=> b!1389488 m!1275141))

(declare-fun m!1275143 () Bool)

(assert (=> b!1389489 m!1275143))

(assert (=> b!1389489 m!1275143))

(declare-fun m!1275145 () Bool)

(assert (=> b!1389489 m!1275145))

(push 1)

(assert (not b!1389491))

(assert (not start!119098))

(assert (not b!1389489))

(assert (not b!1389488))

(assert (not b!1389490))

(assert (not b!1389492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

