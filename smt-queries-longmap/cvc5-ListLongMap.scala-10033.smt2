; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118302 () Bool)

(assert start!118302)

(declare-fun b!1383606 () Bool)

(declare-fun e!784137 () Bool)

(assert (=> b!1383606 (= e!784137 (not true))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94558 0))(
  ( (array!94559 (arr!45657 (Array (_ BitVec 32) (_ BitVec 64))) (size!46209 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94558)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10074 0))(
  ( (MissingZero!10074 (index!42667 (_ BitVec 32))) (Found!10074 (index!42668 (_ BitVec 32))) (Intermediate!10074 (undefined!10886 Bool) (index!42669 (_ BitVec 32)) (x!124176 (_ BitVec 32))) (Undefined!10074) (MissingVacant!10074 (index!42670 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94558 (_ BitVec 32)) SeekEntryResult!10074)

(assert (=> b!1383606 (= (seekEntryOrOpen!0 (select (arr!45657 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45657 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94559 (store (arr!45657 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46209 a!2938)) mask!2987))))

(declare-datatypes ((Unit!45928 0))(
  ( (Unit!45929) )
))
(declare-fun lt!608465 () Unit!45928)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45928)

(assert (=> b!1383606 (= lt!608465 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383607 () Bool)

(declare-fun res!925247 () Bool)

(assert (=> b!1383607 (=> (not res!925247) (not e!784137))))

(declare-datatypes ((List!32263 0))(
  ( (Nil!32260) (Cons!32259 (h!33468 (_ BitVec 64)) (t!46949 List!32263)) )
))
(declare-fun arrayNoDuplicates!0 (array!94558 (_ BitVec 32) List!32263) Bool)

(assert (=> b!1383607 (= res!925247 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32260))))

(declare-fun b!1383608 () Bool)

(declare-fun res!925242 () Bool)

(assert (=> b!1383608 (=> (not res!925242) (not e!784137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383608 (= res!925242 (validKeyInArray!0 (select (arr!45657 a!2938) startIndex!16)))))

(declare-fun b!1383609 () Bool)

(declare-fun res!925246 () Bool)

(assert (=> b!1383609 (=> (not res!925246) (not e!784137))))

(assert (=> b!1383609 (= res!925246 (and (not (= (select (arr!45657 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45657 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383610 () Bool)

(declare-fun res!925241 () Bool)

(assert (=> b!1383610 (=> (not res!925241) (not e!784137))))

(assert (=> b!1383610 (= res!925241 (validKeyInArray!0 (select (arr!45657 a!2938) i!1065)))))

(declare-fun b!1383611 () Bool)

(declare-fun res!925245 () Bool)

(assert (=> b!1383611 (=> (not res!925245) (not e!784137))))

(assert (=> b!1383611 (= res!925245 (and (= (size!46209 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46209 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46209 a!2938))))))

(declare-fun res!925244 () Bool)

(assert (=> start!118302 (=> (not res!925244) (not e!784137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118302 (= res!925244 (validMask!0 mask!2987))))

(assert (=> start!118302 e!784137))

(assert (=> start!118302 true))

(declare-fun array_inv!34890 (array!94558) Bool)

(assert (=> start!118302 (array_inv!34890 a!2938)))

(declare-fun b!1383612 () Bool)

(declare-fun res!925243 () Bool)

(assert (=> b!1383612 (=> (not res!925243) (not e!784137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94558 (_ BitVec 32)) Bool)

(assert (=> b!1383612 (= res!925243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118302 res!925244) b!1383611))

(assert (= (and b!1383611 res!925245) b!1383610))

(assert (= (and b!1383610 res!925241) b!1383607))

(assert (= (and b!1383607 res!925247) b!1383612))

(assert (= (and b!1383612 res!925243) b!1383609))

(assert (= (and b!1383609 res!925246) b!1383608))

(assert (= (and b!1383608 res!925242) b!1383606))

(declare-fun m!1268323 () Bool)

(assert (=> start!118302 m!1268323))

(declare-fun m!1268325 () Bool)

(assert (=> start!118302 m!1268325))

(declare-fun m!1268327 () Bool)

(assert (=> b!1383612 m!1268327))

(declare-fun m!1268329 () Bool)

(assert (=> b!1383606 m!1268329))

(assert (=> b!1383606 m!1268329))

(declare-fun m!1268331 () Bool)

(assert (=> b!1383606 m!1268331))

(declare-fun m!1268333 () Bool)

(assert (=> b!1383606 m!1268333))

(declare-fun m!1268335 () Bool)

(assert (=> b!1383606 m!1268335))

(declare-fun m!1268337 () Bool)

(assert (=> b!1383606 m!1268337))

(assert (=> b!1383606 m!1268337))

(declare-fun m!1268339 () Bool)

(assert (=> b!1383606 m!1268339))

(declare-fun m!1268341 () Bool)

(assert (=> b!1383609 m!1268341))

(assert (=> b!1383610 m!1268341))

(assert (=> b!1383610 m!1268341))

(declare-fun m!1268343 () Bool)

(assert (=> b!1383610 m!1268343))

(declare-fun m!1268345 () Bool)

(assert (=> b!1383607 m!1268345))

(assert (=> b!1383608 m!1268337))

(assert (=> b!1383608 m!1268337))

(declare-fun m!1268347 () Bool)

(assert (=> b!1383608 m!1268347))

(push 1)

(assert (not b!1383612))

(assert (not start!118302))

(assert (not b!1383610))

(assert (not b!1383607))

(assert (not b!1383608))

(assert (not b!1383606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

