; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118752 () Bool)

(assert start!118752)

(declare-fun b!1387165 () Bool)

(declare-fun res!927625 () Bool)

(declare-fun e!786034 () Bool)

(assert (=> b!1387165 (=> (not res!927625) (not e!786034))))

(declare-datatypes ((array!94926 0))(
  ( (array!94927 (arr!45837 (Array (_ BitVec 32) (_ BitVec 64))) (size!46388 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94926)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387165 (= res!927625 (validKeyInArray!0 (select (arr!45837 a!2938) i!1065)))))

(declare-fun b!1387164 () Bool)

(declare-fun res!927627 () Bool)

(assert (=> b!1387164 (=> (not res!927627) (not e!786034))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1387164 (= res!927627 (and (= (size!46388 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46388 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46388 a!2938))))))

(declare-fun b!1387166 () Bool)

(declare-fun res!927628 () Bool)

(assert (=> b!1387166 (=> (not res!927628) (not e!786034))))

(declare-datatypes ((List!32352 0))(
  ( (Nil!32349) (Cons!32348 (h!33566 (_ BitVec 64)) (t!47038 List!32352)) )
))
(declare-fun arrayNoDuplicates!0 (array!94926 (_ BitVec 32) List!32352) Bool)

(assert (=> b!1387166 (= res!927628 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32349))))

(declare-fun b!1387167 () Bool)

(assert (=> b!1387167 (= e!786034 false)))

(declare-fun lt!609813 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94926 (_ BitVec 32)) Bool)

(assert (=> b!1387167 (= lt!609813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!927626 () Bool)

(assert (=> start!118752 (=> (not res!927626) (not e!786034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118752 (= res!927626 (validMask!0 mask!2987))))

(assert (=> start!118752 e!786034))

(assert (=> start!118752 true))

(declare-fun array_inv!35118 (array!94926) Bool)

(assert (=> start!118752 (array_inv!35118 a!2938)))

(assert (= (and start!118752 res!927626) b!1387164))

(assert (= (and b!1387164 res!927627) b!1387165))

(assert (= (and b!1387165 res!927625) b!1387166))

(assert (= (and b!1387166 res!927628) b!1387167))

(declare-fun m!1272765 () Bool)

(assert (=> b!1387165 m!1272765))

(assert (=> b!1387165 m!1272765))

(declare-fun m!1272767 () Bool)

(assert (=> b!1387165 m!1272767))

(declare-fun m!1272769 () Bool)

(assert (=> b!1387166 m!1272769))

(declare-fun m!1272771 () Bool)

(assert (=> b!1387167 m!1272771))

(declare-fun m!1272773 () Bool)

(assert (=> start!118752 m!1272773))

(declare-fun m!1272775 () Bool)

(assert (=> start!118752 m!1272775))

(push 1)

(assert (not b!1387167))

(assert (not b!1387165))

(assert (not start!118752))

(assert (not b!1387166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

