; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124112 () Bool)

(assert start!124112)

(declare-fun b!1436784 () Bool)

(declare-fun res!969671 () Bool)

(declare-fun e!810754 () Bool)

(assert (=> b!1436784 (=> (not res!969671) (not e!810754))))

(declare-datatypes ((array!97716 0))(
  ( (array!97717 (arr!47152 (Array (_ BitVec 32) (_ BitVec 64))) (size!47702 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97716)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436784 (= res!969671 (validKeyInArray!0 (select (arr!47152 a!2862) i!1006)))))

(declare-fun res!969669 () Bool)

(assert (=> start!124112 (=> (not res!969669) (not e!810754))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124112 (= res!969669 (validMask!0 mask!2687))))

(assert (=> start!124112 e!810754))

(assert (=> start!124112 true))

(declare-fun array_inv!36180 (array!97716) Bool)

(assert (=> start!124112 (array_inv!36180 a!2862)))

(declare-fun b!1436785 () Bool)

(declare-fun res!969667 () Bool)

(assert (=> b!1436785 (=> (not res!969667) (not e!810754))))

(declare-datatypes ((List!33653 0))(
  ( (Nil!33650) (Cons!33649 (h!34987 (_ BitVec 64)) (t!48347 List!33653)) )
))
(declare-fun arrayNoDuplicates!0 (array!97716 (_ BitVec 32) List!33653) Bool)

(assert (=> b!1436785 (= res!969667 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33650))))

(declare-fun b!1436786 () Bool)

(declare-fun res!969670 () Bool)

(assert (=> b!1436786 (=> (not res!969670) (not e!810754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97716 (_ BitVec 32)) Bool)

(assert (=> b!1436786 (= res!969670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436787 () Bool)

(declare-fun res!969668 () Bool)

(assert (=> b!1436787 (=> (not res!969668) (not e!810754))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436787 (= res!969668 (and (= (size!47702 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47702 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47702 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436788 () Bool)

(assert (=> b!1436788 (= e!810754 false)))

(declare-fun lt!632211 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436788 (= lt!632211 (toIndex!0 (select (arr!47152 a!2862) j!93) mask!2687))))

(declare-fun b!1436789 () Bool)

(declare-fun res!969672 () Bool)

(assert (=> b!1436789 (=> (not res!969672) (not e!810754))))

(assert (=> b!1436789 (= res!969672 (validKeyInArray!0 (select (arr!47152 a!2862) j!93)))))

(declare-fun b!1436790 () Bool)

(declare-fun res!969673 () Bool)

(assert (=> b!1436790 (=> (not res!969673) (not e!810754))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436790 (= res!969673 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47702 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47702 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47702 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47152 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124112 res!969669) b!1436787))

(assert (= (and b!1436787 res!969668) b!1436784))

(assert (= (and b!1436784 res!969671) b!1436789))

(assert (= (and b!1436789 res!969672) b!1436786))

(assert (= (and b!1436786 res!969670) b!1436785))

(assert (= (and b!1436785 res!969667) b!1436790))

(assert (= (and b!1436790 res!969673) b!1436788))

(declare-fun m!1326075 () Bool)

(assert (=> b!1436789 m!1326075))

(assert (=> b!1436789 m!1326075))

(declare-fun m!1326077 () Bool)

(assert (=> b!1436789 m!1326077))

(declare-fun m!1326079 () Bool)

(assert (=> b!1436784 m!1326079))

(assert (=> b!1436784 m!1326079))

(declare-fun m!1326081 () Bool)

(assert (=> b!1436784 m!1326081))

(declare-fun m!1326083 () Bool)

(assert (=> b!1436785 m!1326083))

(assert (=> b!1436788 m!1326075))

(assert (=> b!1436788 m!1326075))

(declare-fun m!1326085 () Bool)

(assert (=> b!1436788 m!1326085))

(declare-fun m!1326087 () Bool)

(assert (=> b!1436786 m!1326087))

(declare-fun m!1326089 () Bool)

(assert (=> b!1436790 m!1326089))

(declare-fun m!1326091 () Bool)

(assert (=> b!1436790 m!1326091))

(declare-fun m!1326093 () Bool)

(assert (=> start!124112 m!1326093))

(declare-fun m!1326095 () Bool)

(assert (=> start!124112 m!1326095))

(push 1)

(assert (not b!1436789))

(assert (not b!1436784))

(assert (not start!124112))

(assert (not b!1436785))

(assert (not b!1436788))

(assert (not b!1436786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

