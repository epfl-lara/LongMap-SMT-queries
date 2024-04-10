; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118564 () Bool)

(assert start!118564)

(declare-fun b!1386078 () Bool)

(declare-fun res!927334 () Bool)

(declare-fun e!785257 () Bool)

(assert (=> b!1386078 (=> (not res!927334) (not e!785257))))

(declare-datatypes ((array!94840 0))(
  ( (array!94841 (arr!45796 (Array (_ BitVec 32) (_ BitVec 64))) (size!46346 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94840)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386078 (= res!927334 (validKeyInArray!0 (select (arr!45796 a!2938) startIndex!16)))))

(declare-fun b!1386079 () Bool)

(declare-fun res!927328 () Bool)

(assert (=> b!1386079 (=> (not res!927328) (not e!785257))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94840 (_ BitVec 32)) Bool)

(assert (=> b!1386079 (= res!927328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386080 () Bool)

(assert (=> b!1386080 (= e!785257 (not (bvsle #b00000000000000000000000000000000 (size!46346 a!2938))))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10139 0))(
  ( (MissingZero!10139 (index!42927 (_ BitVec 32))) (Found!10139 (index!42928 (_ BitVec 32))) (Intermediate!10139 (undefined!10951 Bool) (index!42929 (_ BitVec 32)) (x!124548 (_ BitVec 32))) (Undefined!10139) (MissingVacant!10139 (index!42930 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94840 (_ BitVec 32)) SeekEntryResult!10139)

(assert (=> b!1386080 (= (seekEntryOrOpen!0 (select (arr!45796 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45796 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94841 (store (arr!45796 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46346 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46266 0))(
  ( (Unit!46267) )
))
(declare-fun lt!609369 () Unit!46266)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46266)

(assert (=> b!1386080 (= lt!609369 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1386081 () Bool)

(declare-fun res!927330 () Bool)

(assert (=> b!1386081 (=> (not res!927330) (not e!785257))))

(assert (=> b!1386081 (= res!927330 (and (= (size!46346 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46346 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46346 a!2938))))))

(declare-fun res!927333 () Bool)

(assert (=> start!118564 (=> (not res!927333) (not e!785257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118564 (= res!927333 (validMask!0 mask!2987))))

(assert (=> start!118564 e!785257))

(assert (=> start!118564 true))

(declare-fun array_inv!34824 (array!94840) Bool)

(assert (=> start!118564 (array_inv!34824 a!2938)))

(declare-fun b!1386082 () Bool)

(declare-fun res!927332 () Bool)

(assert (=> b!1386082 (=> (not res!927332) (not e!785257))))

(assert (=> b!1386082 (= res!927332 (validKeyInArray!0 (select (arr!45796 a!2938) i!1065)))))

(declare-fun b!1386083 () Bool)

(declare-fun res!927329 () Bool)

(assert (=> b!1386083 (=> (not res!927329) (not e!785257))))

(assert (=> b!1386083 (= res!927329 (and (not (= (select (arr!45796 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45796 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1386084 () Bool)

(declare-fun res!927331 () Bool)

(assert (=> b!1386084 (=> (not res!927331) (not e!785257))))

(declare-datatypes ((List!32324 0))(
  ( (Nil!32321) (Cons!32320 (h!33529 (_ BitVec 64)) (t!47018 List!32324)) )
))
(declare-fun arrayNoDuplicates!0 (array!94840 (_ BitVec 32) List!32324) Bool)

(assert (=> b!1386084 (= res!927331 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32321))))

(assert (= (and start!118564 res!927333) b!1386081))

(assert (= (and b!1386081 res!927330) b!1386082))

(assert (= (and b!1386082 res!927332) b!1386084))

(assert (= (and b!1386084 res!927331) b!1386079))

(assert (= (and b!1386079 res!927328) b!1386083))

(assert (= (and b!1386083 res!927329) b!1386078))

(assert (= (and b!1386078 res!927334) b!1386080))

(declare-fun m!1271389 () Bool)

(assert (=> start!118564 m!1271389))

(declare-fun m!1271391 () Bool)

(assert (=> start!118564 m!1271391))

(declare-fun m!1271393 () Bool)

(assert (=> b!1386083 m!1271393))

(declare-fun m!1271395 () Bool)

(assert (=> b!1386080 m!1271395))

(assert (=> b!1386080 m!1271395))

(declare-fun m!1271397 () Bool)

(assert (=> b!1386080 m!1271397))

(declare-fun m!1271399 () Bool)

(assert (=> b!1386080 m!1271399))

(declare-fun m!1271401 () Bool)

(assert (=> b!1386080 m!1271401))

(declare-fun m!1271403 () Bool)

(assert (=> b!1386080 m!1271403))

(assert (=> b!1386080 m!1271403))

(declare-fun m!1271405 () Bool)

(assert (=> b!1386080 m!1271405))

(assert (=> b!1386082 m!1271393))

(assert (=> b!1386082 m!1271393))

(declare-fun m!1271407 () Bool)

(assert (=> b!1386082 m!1271407))

(declare-fun m!1271409 () Bool)

(assert (=> b!1386084 m!1271409))

(assert (=> b!1386078 m!1271403))

(assert (=> b!1386078 m!1271403))

(declare-fun m!1271411 () Bool)

(assert (=> b!1386078 m!1271411))

(declare-fun m!1271413 () Bool)

(assert (=> b!1386079 m!1271413))

(push 1)

(assert (not start!118564))

(assert (not b!1386078))

(assert (not b!1386080))

(assert (not b!1386082))

