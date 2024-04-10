; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118560 () Bool)

(assert start!118560)

(declare-fun b!1386036 () Bool)

(declare-fun res!927292 () Bool)

(declare-fun e!785246 () Bool)

(assert (=> b!1386036 (=> (not res!927292) (not e!785246))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94836 0))(
  ( (array!94837 (arr!45794 (Array (_ BitVec 32) (_ BitVec 64))) (size!46344 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94836)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386036 (= res!927292 (and (not (= (select (arr!45794 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45794 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1386037 () Bool)

(declare-fun res!927287 () Bool)

(assert (=> b!1386037 (=> (not res!927287) (not e!785246))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94836 (_ BitVec 32)) Bool)

(assert (=> b!1386037 (= res!927287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!927290 () Bool)

(assert (=> start!118560 (=> (not res!927290) (not e!785246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118560 (= res!927290 (validMask!0 mask!2987))))

(assert (=> start!118560 e!785246))

(assert (=> start!118560 true))

(declare-fun array_inv!34822 (array!94836) Bool)

(assert (=> start!118560 (array_inv!34822 a!2938)))

(declare-fun b!1386038 () Bool)

(declare-fun res!927286 () Bool)

(assert (=> b!1386038 (=> (not res!927286) (not e!785246))))

(assert (=> b!1386038 (= res!927286 (and (= (size!46344 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46344 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46344 a!2938))))))

(declare-fun b!1386039 () Bool)

(assert (=> b!1386039 (= e!785246 (not (bvsle #b00000000000000000000000000000000 (size!46344 a!2938))))))

(declare-datatypes ((SeekEntryResult!10137 0))(
  ( (MissingZero!10137 (index!42919 (_ BitVec 32))) (Found!10137 (index!42920 (_ BitVec 32))) (Intermediate!10137 (undefined!10949 Bool) (index!42921 (_ BitVec 32)) (x!124546 (_ BitVec 32))) (Undefined!10137) (MissingVacant!10137 (index!42922 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94836 (_ BitVec 32)) SeekEntryResult!10137)

(assert (=> b!1386039 (= (seekEntryOrOpen!0 (select (arr!45794 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45794 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94837 (store (arr!45794 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46344 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46262 0))(
  ( (Unit!46263) )
))
(declare-fun lt!609363 () Unit!46262)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46262)

(assert (=> b!1386039 (= lt!609363 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1386040 () Bool)

(declare-fun res!927288 () Bool)

(assert (=> b!1386040 (=> (not res!927288) (not e!785246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386040 (= res!927288 (validKeyInArray!0 (select (arr!45794 a!2938) startIndex!16)))))

(declare-fun b!1386041 () Bool)

(declare-fun res!927291 () Bool)

(assert (=> b!1386041 (=> (not res!927291) (not e!785246))))

(declare-datatypes ((List!32322 0))(
  ( (Nil!32319) (Cons!32318 (h!33527 (_ BitVec 64)) (t!47016 List!32322)) )
))
(declare-fun arrayNoDuplicates!0 (array!94836 (_ BitVec 32) List!32322) Bool)

(assert (=> b!1386041 (= res!927291 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32319))))

(declare-fun b!1386042 () Bool)

(declare-fun res!927289 () Bool)

(assert (=> b!1386042 (=> (not res!927289) (not e!785246))))

(assert (=> b!1386042 (= res!927289 (validKeyInArray!0 (select (arr!45794 a!2938) i!1065)))))

(assert (= (and start!118560 res!927290) b!1386038))

(assert (= (and b!1386038 res!927286) b!1386042))

(assert (= (and b!1386042 res!927289) b!1386041))

(assert (= (and b!1386041 res!927291) b!1386037))

(assert (= (and b!1386037 res!927287) b!1386036))

(assert (= (and b!1386036 res!927292) b!1386040))

(assert (= (and b!1386040 res!927288) b!1386039))

(declare-fun m!1271337 () Bool)

(assert (=> b!1386041 m!1271337))

(declare-fun m!1271339 () Bool)

(assert (=> b!1386036 m!1271339))

(declare-fun m!1271341 () Bool)

(assert (=> start!118560 m!1271341))

(declare-fun m!1271343 () Bool)

(assert (=> start!118560 m!1271343))

(declare-fun m!1271345 () Bool)

(assert (=> b!1386040 m!1271345))

(assert (=> b!1386040 m!1271345))

(declare-fun m!1271347 () Bool)

(assert (=> b!1386040 m!1271347))

(declare-fun m!1271349 () Bool)

(assert (=> b!1386039 m!1271349))

(assert (=> b!1386039 m!1271349))

(declare-fun m!1271351 () Bool)

(assert (=> b!1386039 m!1271351))

(declare-fun m!1271353 () Bool)

(assert (=> b!1386039 m!1271353))

(declare-fun m!1271355 () Bool)

(assert (=> b!1386039 m!1271355))

(assert (=> b!1386039 m!1271345))

(assert (=> b!1386039 m!1271345))

(declare-fun m!1271357 () Bool)

(assert (=> b!1386039 m!1271357))

(declare-fun m!1271359 () Bool)

(assert (=> b!1386037 m!1271359))

(assert (=> b!1386042 m!1271339))

(assert (=> b!1386042 m!1271339))

(declare-fun m!1271361 () Bool)

(assert (=> b!1386042 m!1271361))

(push 1)

