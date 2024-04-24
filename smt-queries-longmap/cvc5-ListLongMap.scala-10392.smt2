; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122622 () Bool)

(assert start!122622)

(declare-fun b!1419822 () Bool)

(declare-fun res!954748 () Bool)

(declare-fun e!803543 () Bool)

(assert (=> b!1419822 (=> (not res!954748) (not e!803543))))

(declare-datatypes ((array!96987 0))(
  ( (array!96988 (arr!46812 (Array (_ BitVec 32) (_ BitVec 64))) (size!47363 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96987)

(declare-datatypes ((List!33309 0))(
  ( (Nil!33306) (Cons!33305 (h!34609 (_ BitVec 64)) (t!47995 List!33309)) )
))
(declare-fun arrayNoDuplicates!0 (array!96987 (_ BitVec 32) List!33309) Bool)

(assert (=> b!1419822 (= res!954748 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33306))))

(declare-fun res!954745 () Bool)

(assert (=> start!122622 (=> (not res!954745) (not e!803543))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122622 (= res!954745 (validMask!0 mask!2608))))

(assert (=> start!122622 e!803543))

(assert (=> start!122622 true))

(declare-fun array_inv!36093 (array!96987) Bool)

(assert (=> start!122622 (array_inv!36093 a!2831)))

(declare-fun b!1419823 () Bool)

(declare-fun res!954747 () Bool)

(assert (=> b!1419823 (=> (not res!954747) (not e!803543))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419823 (= res!954747 (validKeyInArray!0 (select (arr!46812 a!2831) i!982)))))

(declare-fun b!1419824 () Bool)

(assert (=> b!1419824 (= e!803543 false)))

(declare-fun lt!626048 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419824 (= lt!626048 (toIndex!0 (select (arr!46812 a!2831) j!81) mask!2608))))

(declare-fun b!1419825 () Bool)

(declare-fun res!954750 () Bool)

(assert (=> b!1419825 (=> (not res!954750) (not e!803543))))

(assert (=> b!1419825 (= res!954750 (validKeyInArray!0 (select (arr!46812 a!2831) j!81)))))

(declare-fun b!1419826 () Bool)

(declare-fun res!954751 () Bool)

(assert (=> b!1419826 (=> (not res!954751) (not e!803543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96987 (_ BitVec 32)) Bool)

(assert (=> b!1419826 (= res!954751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419827 () Bool)

(declare-fun res!954749 () Bool)

(assert (=> b!1419827 (=> (not res!954749) (not e!803543))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419827 (= res!954749 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47363 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47363 a!2831))))))

(declare-fun b!1419828 () Bool)

(declare-fun res!954746 () Bool)

(assert (=> b!1419828 (=> (not res!954746) (not e!803543))))

(assert (=> b!1419828 (= res!954746 (and (= (size!47363 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47363 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47363 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122622 res!954745) b!1419828))

(assert (= (and b!1419828 res!954746) b!1419823))

(assert (= (and b!1419823 res!954747) b!1419825))

(assert (= (and b!1419825 res!954750) b!1419826))

(assert (= (and b!1419826 res!954751) b!1419822))

(assert (= (and b!1419822 res!954748) b!1419827))

(assert (= (and b!1419827 res!954749) b!1419824))

(declare-fun m!1310679 () Bool)

(assert (=> b!1419826 m!1310679))

(declare-fun m!1310681 () Bool)

(assert (=> b!1419824 m!1310681))

(assert (=> b!1419824 m!1310681))

(declare-fun m!1310683 () Bool)

(assert (=> b!1419824 m!1310683))

(declare-fun m!1310685 () Bool)

(assert (=> start!122622 m!1310685))

(declare-fun m!1310687 () Bool)

(assert (=> start!122622 m!1310687))

(assert (=> b!1419825 m!1310681))

(assert (=> b!1419825 m!1310681))

(declare-fun m!1310689 () Bool)

(assert (=> b!1419825 m!1310689))

(declare-fun m!1310691 () Bool)

(assert (=> b!1419822 m!1310691))

(declare-fun m!1310693 () Bool)

(assert (=> b!1419823 m!1310693))

(assert (=> b!1419823 m!1310693))

(declare-fun m!1310695 () Bool)

(assert (=> b!1419823 m!1310695))

(push 1)

(assert (not b!1419822))

(assert (not b!1419824))

(assert (not b!1419823))

(assert (not start!122622))

(assert (not b!1419826))

(assert (not b!1419825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

