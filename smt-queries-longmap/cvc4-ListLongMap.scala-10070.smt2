; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118558 () Bool)

(assert start!118558)

(declare-fun res!927266 () Bool)

(declare-fun e!785239 () Bool)

(assert (=> start!118558 (=> (not res!927266) (not e!785239))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118558 (= res!927266 (validMask!0 mask!2987))))

(assert (=> start!118558 e!785239))

(assert (=> start!118558 true))

(declare-datatypes ((array!94834 0))(
  ( (array!94835 (arr!45793 (Array (_ BitVec 32) (_ BitVec 64))) (size!46343 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94834)

(declare-fun array_inv!34821 (array!94834) Bool)

(assert (=> start!118558 (array_inv!34821 a!2938)))

(declare-fun b!1386015 () Bool)

(assert (=> b!1386015 (= e!785239 (not true))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10136 0))(
  ( (MissingZero!10136 (index!42915 (_ BitVec 32))) (Found!10136 (index!42916 (_ BitVec 32))) (Intermediate!10136 (undefined!10948 Bool) (index!42917 (_ BitVec 32)) (x!124537 (_ BitVec 32))) (Undefined!10136) (MissingVacant!10136 (index!42918 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94834 (_ BitVec 32)) SeekEntryResult!10136)

(assert (=> b!1386015 (= (seekEntryOrOpen!0 (select (arr!45793 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45793 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94835 (store (arr!45793 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46343 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46260 0))(
  ( (Unit!46261) )
))
(declare-fun lt!609360 () Unit!46260)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46260)

(assert (=> b!1386015 (= lt!609360 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1386016 () Bool)

(declare-fun res!927270 () Bool)

(assert (=> b!1386016 (=> (not res!927270) (not e!785239))))

(assert (=> b!1386016 (= res!927270 (and (= (size!46343 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46343 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46343 a!2938))))))

(declare-fun b!1386017 () Bool)

(declare-fun res!927269 () Bool)

(assert (=> b!1386017 (=> (not res!927269) (not e!785239))))

(assert (=> b!1386017 (= res!927269 (and (not (= (select (arr!45793 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45793 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1386018 () Bool)

(declare-fun res!927271 () Bool)

(assert (=> b!1386018 (=> (not res!927271) (not e!785239))))

(declare-datatypes ((List!32321 0))(
  ( (Nil!32318) (Cons!32317 (h!33526 (_ BitVec 64)) (t!47015 List!32321)) )
))
(declare-fun arrayNoDuplicates!0 (array!94834 (_ BitVec 32) List!32321) Bool)

(assert (=> b!1386018 (= res!927271 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32318))))

(declare-fun b!1386019 () Bool)

(declare-fun res!927267 () Bool)

(assert (=> b!1386019 (=> (not res!927267) (not e!785239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94834 (_ BitVec 32)) Bool)

(assert (=> b!1386019 (= res!927267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386020 () Bool)

(declare-fun res!927268 () Bool)

(assert (=> b!1386020 (=> (not res!927268) (not e!785239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386020 (= res!927268 (validKeyInArray!0 (select (arr!45793 a!2938) startIndex!16)))))

(declare-fun b!1386021 () Bool)

(declare-fun res!927265 () Bool)

(assert (=> b!1386021 (=> (not res!927265) (not e!785239))))

(assert (=> b!1386021 (= res!927265 (validKeyInArray!0 (select (arr!45793 a!2938) i!1065)))))

(assert (= (and start!118558 res!927266) b!1386016))

(assert (= (and b!1386016 res!927270) b!1386021))

(assert (= (and b!1386021 res!927265) b!1386018))

(assert (= (and b!1386018 res!927271) b!1386019))

(assert (= (and b!1386019 res!927267) b!1386017))

(assert (= (and b!1386017 res!927269) b!1386020))

(assert (= (and b!1386020 res!927268) b!1386015))

(declare-fun m!1271311 () Bool)

(assert (=> b!1386018 m!1271311))

(declare-fun m!1271313 () Bool)

(assert (=> b!1386015 m!1271313))

(assert (=> b!1386015 m!1271313))

(declare-fun m!1271315 () Bool)

(assert (=> b!1386015 m!1271315))

(declare-fun m!1271317 () Bool)

(assert (=> b!1386015 m!1271317))

(declare-fun m!1271319 () Bool)

(assert (=> b!1386015 m!1271319))

(declare-fun m!1271321 () Bool)

(assert (=> b!1386015 m!1271321))

(assert (=> b!1386015 m!1271321))

(declare-fun m!1271323 () Bool)

(assert (=> b!1386015 m!1271323))

(declare-fun m!1271325 () Bool)

(assert (=> b!1386021 m!1271325))

(assert (=> b!1386021 m!1271325))

(declare-fun m!1271327 () Bool)

(assert (=> b!1386021 m!1271327))

(declare-fun m!1271329 () Bool)

(assert (=> b!1386019 m!1271329))

(assert (=> b!1386017 m!1271325))

(assert (=> b!1386020 m!1271321))

(assert (=> b!1386020 m!1271321))

(declare-fun m!1271331 () Bool)

(assert (=> b!1386020 m!1271331))

(declare-fun m!1271333 () Bool)

(assert (=> start!118558 m!1271333))

(declare-fun m!1271335 () Bool)

(assert (=> start!118558 m!1271335))

(push 1)

(assert (not b!1386015))

(assert (not b!1386018))

(assert (not b!1386020))

(assert (not b!1386021))

(assert (not b!1386019))

(assert (not start!118558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

