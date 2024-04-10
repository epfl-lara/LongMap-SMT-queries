; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118276 () Bool)

(assert start!118276)

(declare-fun b!1383390 () Bool)

(declare-fun res!924985 () Bool)

(declare-fun e!784079 () Bool)

(assert (=> b!1383390 (=> (not res!924985) (not e!784079))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94579 0))(
  ( (array!94580 (arr!45667 (Array (_ BitVec 32) (_ BitVec 64))) (size!46217 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94579)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383390 (= res!924985 (and (= (size!46217 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46217 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46217 a!2938))))))

(declare-fun b!1383393 () Bool)

(assert (=> b!1383393 (= e!784079 false)))

(declare-fun lt!608604 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94579 (_ BitVec 32)) Bool)

(assert (=> b!1383393 (= lt!608604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!924984 () Bool)

(assert (=> start!118276 (=> (not res!924984) (not e!784079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118276 (= res!924984 (validMask!0 mask!2987))))

(assert (=> start!118276 e!784079))

(assert (=> start!118276 true))

(declare-fun array_inv!34695 (array!94579) Bool)

(assert (=> start!118276 (array_inv!34695 a!2938)))

(declare-fun b!1383392 () Bool)

(declare-fun res!924983 () Bool)

(assert (=> b!1383392 (=> (not res!924983) (not e!784079))))

(declare-datatypes ((List!32195 0))(
  ( (Nil!32192) (Cons!32191 (h!33400 (_ BitVec 64)) (t!46889 List!32195)) )
))
(declare-fun arrayNoDuplicates!0 (array!94579 (_ BitVec 32) List!32195) Bool)

(assert (=> b!1383392 (= res!924983 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32192))))

(declare-fun b!1383391 () Bool)

(declare-fun res!924982 () Bool)

(assert (=> b!1383391 (=> (not res!924982) (not e!784079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383391 (= res!924982 (validKeyInArray!0 (select (arr!45667 a!2938) i!1065)))))

(assert (= (and start!118276 res!924984) b!1383390))

(assert (= (and b!1383390 res!924985) b!1383391))

(assert (= (and b!1383391 res!924982) b!1383392))

(assert (= (and b!1383392 res!924983) b!1383393))

(declare-fun m!1268493 () Bool)

(assert (=> b!1383393 m!1268493))

(declare-fun m!1268495 () Bool)

(assert (=> start!118276 m!1268495))

(declare-fun m!1268497 () Bool)

(assert (=> start!118276 m!1268497))

(declare-fun m!1268499 () Bool)

(assert (=> b!1383392 m!1268499))

(declare-fun m!1268501 () Bool)

(assert (=> b!1383391 m!1268501))

(assert (=> b!1383391 m!1268501))

(declare-fun m!1268503 () Bool)

(assert (=> b!1383391 m!1268503))

(push 1)

(assert (not b!1383391))

(assert (not start!118276))

(assert (not b!1383392))

(assert (not b!1383393))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

