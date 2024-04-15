; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130642 () Bool)

(assert start!130642)

(declare-fun b!1532553 () Bool)

(declare-fun e!853857 () Bool)

(assert (=> b!1532553 (= e!853857 false)))

(declare-fun lt!663462 () Bool)

(declare-datatypes ((array!101738 0))(
  ( (array!101739 (arr!49086 (Array (_ BitVec 32) (_ BitVec 64))) (size!49638 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101738)

(declare-datatypes ((List!35638 0))(
  ( (Nil!35635) (Cons!35634 (h!37080 (_ BitVec 64)) (t!50324 List!35638)) )
))
(declare-fun arrayNoDuplicates!0 (array!101738 (_ BitVec 32) List!35638) Bool)

(assert (=> b!1532553 (= lt!663462 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35635))))

(declare-fun b!1532554 () Bool)

(declare-fun res!1049824 () Bool)

(assert (=> b!1532554 (=> (not res!1049824) (not e!853857))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532554 (= res!1049824 (validKeyInArray!0 (select (arr!49086 a!2792) j!64)))))

(declare-fun b!1532555 () Bool)

(declare-fun res!1049826 () Bool)

(assert (=> b!1532555 (=> (not res!1049826) (not e!853857))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532555 (= res!1049826 (validKeyInArray!0 (select (arr!49086 a!2792) i!951)))))

(declare-fun b!1532556 () Bool)

(declare-fun res!1049827 () Bool)

(assert (=> b!1532556 (=> (not res!1049827) (not e!853857))))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1532556 (= res!1049827 (and (= (size!49638 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49638 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49638 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1049823 () Bool)

(assert (=> start!130642 (=> (not res!1049823) (not e!853857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130642 (= res!1049823 (validMask!0 mask!2480))))

(assert (=> start!130642 e!853857))

(assert (=> start!130642 true))

(declare-fun array_inv!38319 (array!101738) Bool)

(assert (=> start!130642 (array_inv!38319 a!2792)))

(declare-fun b!1532557 () Bool)

(declare-fun res!1049825 () Bool)

(assert (=> b!1532557 (=> (not res!1049825) (not e!853857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101738 (_ BitVec 32)) Bool)

(assert (=> b!1532557 (= res!1049825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130642 res!1049823) b!1532556))

(assert (= (and b!1532556 res!1049827) b!1532555))

(assert (= (and b!1532555 res!1049826) b!1532554))

(assert (= (and b!1532554 res!1049824) b!1532557))

(assert (= (and b!1532557 res!1049825) b!1532553))

(declare-fun m!1414681 () Bool)

(assert (=> start!130642 m!1414681))

(declare-fun m!1414683 () Bool)

(assert (=> start!130642 m!1414683))

(declare-fun m!1414685 () Bool)

(assert (=> b!1532554 m!1414685))

(assert (=> b!1532554 m!1414685))

(declare-fun m!1414687 () Bool)

(assert (=> b!1532554 m!1414687))

(declare-fun m!1414689 () Bool)

(assert (=> b!1532555 m!1414689))

(assert (=> b!1532555 m!1414689))

(declare-fun m!1414691 () Bool)

(assert (=> b!1532555 m!1414691))

(declare-fun m!1414693 () Bool)

(assert (=> b!1532553 m!1414693))

(declare-fun m!1414695 () Bool)

(assert (=> b!1532557 m!1414695))

(push 1)

(assert (not b!1532554))

(assert (not start!130642))

(assert (not b!1532557))

(assert (not b!1532553))

(assert (not b!1532555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

