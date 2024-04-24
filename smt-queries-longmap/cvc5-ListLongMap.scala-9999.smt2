; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118248 () Bool)

(assert start!118248)

(declare-fun b!1383579 () Bool)

(declare-fun e!784336 () Bool)

(assert (=> b!1383579 (= e!784336 false)))

(declare-fun lt!608865 () Bool)

(declare-datatypes ((array!94508 0))(
  ( (array!94509 (arr!45633 (Array (_ BitVec 32) (_ BitVec 64))) (size!46184 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94508)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94508 (_ BitVec 32)) Bool)

(assert (=> b!1383579 (= lt!608865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1383578 () Bool)

(declare-fun res!924381 () Bool)

(assert (=> b!1383578 (=> (not res!924381) (not e!784336))))

(declare-datatypes ((List!32154 0))(
  ( (Nil!32151) (Cons!32150 (h!33368 (_ BitVec 64)) (t!46840 List!32154)) )
))
(declare-fun arrayNoDuplicates!0 (array!94508 (_ BitVec 32) List!32154) Bool)

(assert (=> b!1383578 (= res!924381 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32151))))

(declare-fun b!1383577 () Bool)

(declare-fun res!924380 () Bool)

(assert (=> b!1383577 (=> (not res!924380) (not e!784336))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383577 (= res!924380 (validKeyInArray!0 (select (arr!45633 a!2971) i!1094)))))

(declare-fun b!1383576 () Bool)

(declare-fun res!924382 () Bool)

(assert (=> b!1383576 (=> (not res!924382) (not e!784336))))

(assert (=> b!1383576 (= res!924382 (and (= (size!46184 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46184 a!2971))))))

(declare-fun res!924379 () Bool)

(assert (=> start!118248 (=> (not res!924379) (not e!784336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118248 (= res!924379 (validMask!0 mask!3034))))

(assert (=> start!118248 e!784336))

(assert (=> start!118248 true))

(declare-fun array_inv!34914 (array!94508) Bool)

(assert (=> start!118248 (array_inv!34914 a!2971)))

(assert (= (and start!118248 res!924379) b!1383576))

(assert (= (and b!1383576 res!924382) b!1383577))

(assert (= (and b!1383577 res!924380) b!1383578))

(assert (= (and b!1383578 res!924381) b!1383579))

(declare-fun m!1269039 () Bool)

(assert (=> b!1383579 m!1269039))

(declare-fun m!1269041 () Bool)

(assert (=> b!1383578 m!1269041))

(declare-fun m!1269043 () Bool)

(assert (=> b!1383577 m!1269043))

(assert (=> b!1383577 m!1269043))

(declare-fun m!1269045 () Bool)

(assert (=> b!1383577 m!1269045))

(declare-fun m!1269047 () Bool)

(assert (=> start!118248 m!1269047))

(declare-fun m!1269049 () Bool)

(assert (=> start!118248 m!1269049))

(push 1)

(assert (not b!1383577))

(assert (not start!118248))

(assert (not b!1383578))

(assert (not b!1383579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

