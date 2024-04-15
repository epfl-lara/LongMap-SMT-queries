; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118530 () Bool)

(assert start!118530)

(declare-fun b!1385752 () Bool)

(declare-fun res!927046 () Bool)

(declare-fun e!785137 () Bool)

(assert (=> b!1385752 (=> (not res!927046) (not e!785137))))

(declare-datatypes ((array!94759 0))(
  ( (array!94760 (arr!45756 (Array (_ BitVec 32) (_ BitVec 64))) (size!46308 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94759)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385752 (= res!927046 (validKeyInArray!0 (select (arr!45756 a!2938) i!1065)))))

(declare-fun b!1385753 () Bool)

(declare-fun res!927044 () Bool)

(assert (=> b!1385753 (=> (not res!927044) (not e!785137))))

(declare-datatypes ((List!32362 0))(
  ( (Nil!32359) (Cons!32358 (h!33567 (_ BitVec 64)) (t!47048 List!32362)) )
))
(declare-fun arrayNoDuplicates!0 (array!94759 (_ BitVec 32) List!32362) Bool)

(assert (=> b!1385753 (= res!927044 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32359))))

(declare-fun b!1385754 () Bool)

(assert (=> b!1385754 (= e!785137 false)))

(declare-fun lt!609140 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94759 (_ BitVec 32)) Bool)

(assert (=> b!1385754 (= lt!609140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385751 () Bool)

(declare-fun res!927045 () Bool)

(assert (=> b!1385751 (=> (not res!927045) (not e!785137))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385751 (= res!927045 (and (= (size!46308 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46308 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46308 a!2938))))))

(declare-fun res!927047 () Bool)

(assert (=> start!118530 (=> (not res!927047) (not e!785137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118530 (= res!927047 (validMask!0 mask!2987))))

(assert (=> start!118530 e!785137))

(assert (=> start!118530 true))

(declare-fun array_inv!34989 (array!94759) Bool)

(assert (=> start!118530 (array_inv!34989 a!2938)))

(assert (= (and start!118530 res!927047) b!1385751))

(assert (= (and b!1385751 res!927045) b!1385752))

(assert (= (and b!1385752 res!927046) b!1385753))

(assert (= (and b!1385753 res!927044) b!1385754))

(declare-fun m!1270593 () Bool)

(assert (=> b!1385752 m!1270593))

(assert (=> b!1385752 m!1270593))

(declare-fun m!1270595 () Bool)

(assert (=> b!1385752 m!1270595))

(declare-fun m!1270597 () Bool)

(assert (=> b!1385753 m!1270597))

(declare-fun m!1270599 () Bool)

(assert (=> b!1385754 m!1270599))

(declare-fun m!1270601 () Bool)

(assert (=> start!118530 m!1270601))

(declare-fun m!1270603 () Bool)

(assert (=> start!118530 m!1270603))

(push 1)

(assert (not b!1385753))

(assert (not start!118530))

(assert (not b!1385754))

(assert (not b!1385752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

