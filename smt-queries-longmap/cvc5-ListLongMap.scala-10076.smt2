; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118590 () Bool)

(assert start!118590)

(declare-fun res!927617 () Bool)

(declare-fun e!785369 () Bool)

(assert (=> start!118590 (=> (not res!927617) (not e!785369))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118590 (= res!927617 (validMask!0 mask!2987))))

(assert (=> start!118590 e!785369))

(assert (=> start!118590 true))

(declare-datatypes ((array!94819 0))(
  ( (array!94820 (arr!45786 (Array (_ BitVec 32) (_ BitVec 64))) (size!46338 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94819)

(declare-fun array_inv!35019 (array!94819) Bool)

(assert (=> start!118590 (array_inv!35019 a!2938)))

(declare-fun b!1386376 () Bool)

(assert (=> b!1386376 (= e!785369 false)))

(declare-datatypes ((Unit!46149 0))(
  ( (Unit!46150) )
))
(declare-fun lt!609284 () Unit!46149)

(declare-fun e!785370 () Unit!46149)

(assert (=> b!1386376 (= lt!609284 e!785370)))

(declare-fun c!128822 () Bool)

(declare-fun e!785368 () Bool)

(assert (=> b!1386376 (= c!128822 e!785368)))

(declare-fun res!927619 () Bool)

(assert (=> b!1386376 (=> (not res!927619) (not e!785368))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386376 (= res!927619 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386377 () Bool)

(declare-fun Unit!46151 () Unit!46149)

(assert (=> b!1386377 (= e!785370 Unit!46151)))

(declare-fun b!1386378 () Bool)

(declare-fun res!927623 () Bool)

(assert (=> b!1386378 (=> (not res!927623) (not e!785369))))

(assert (=> b!1386378 (= res!927623 (and (= (size!46338 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46338 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46338 a!2938))))))

(declare-fun b!1386379 () Bool)

(declare-fun res!927621 () Bool)

(assert (=> b!1386379 (=> (not res!927621) (not e!785369))))

(declare-datatypes ((List!32392 0))(
  ( (Nil!32389) (Cons!32388 (h!33597 (_ BitVec 64)) (t!47078 List!32392)) )
))
(declare-fun arrayNoDuplicates!0 (array!94819 (_ BitVec 32) List!32392) Bool)

(assert (=> b!1386379 (= res!927621 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32389))))

(declare-fun b!1386380 () Bool)

(declare-fun res!927618 () Bool)

(assert (=> b!1386380 (=> (not res!927618) (not e!785369))))

(assert (=> b!1386380 (= res!927618 (and (not (= (select (arr!45786 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45786 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386381 () Bool)

(declare-fun res!927622 () Bool)

(assert (=> b!1386381 (=> (not res!927622) (not e!785369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386381 (= res!927622 (validKeyInArray!0 (select (arr!45786 a!2938) i!1065)))))

(declare-fun b!1386382 () Bool)

(declare-fun res!927620 () Bool)

(assert (=> b!1386382 (=> (not res!927620) (not e!785369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94819 (_ BitVec 32)) Bool)

(assert (=> b!1386382 (= res!927620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386383 () Bool)

(declare-fun lt!609283 () Unit!46149)

(assert (=> b!1386383 (= e!785370 lt!609283)))

(declare-fun lt!609282 () Unit!46149)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46149)

(assert (=> b!1386383 (= lt!609282 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10155 0))(
  ( (MissingZero!10155 (index!42991 (_ BitVec 32))) (Found!10155 (index!42992 (_ BitVec 32))) (Intermediate!10155 (undefined!10967 Bool) (index!42993 (_ BitVec 32)) (x!124601 (_ BitVec 32))) (Undefined!10155) (MissingVacant!10155 (index!42994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94819 (_ BitVec 32)) SeekEntryResult!10155)

(assert (=> b!1386383 (= (seekEntryOrOpen!0 (select (arr!45786 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45786 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94820 (store (arr!45786 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46338 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46149)

(assert (=> b!1386383 (= lt!609283 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386383 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386384 () Bool)

(assert (=> b!1386384 (= e!785368 (validKeyInArray!0 (select (arr!45786 a!2938) startIndex!16)))))

(assert (= (and start!118590 res!927617) b!1386378))

(assert (= (and b!1386378 res!927623) b!1386381))

(assert (= (and b!1386381 res!927622) b!1386379))

(assert (= (and b!1386379 res!927621) b!1386382))

(assert (= (and b!1386382 res!927620) b!1386380))

(assert (= (and b!1386380 res!927618) b!1386376))

(assert (= (and b!1386376 res!927619) b!1386384))

(assert (= (and b!1386376 c!128822) b!1386383))

(assert (= (and b!1386376 (not c!128822)) b!1386377))

(declare-fun m!1271307 () Bool)

(assert (=> start!118590 m!1271307))

(declare-fun m!1271309 () Bool)

(assert (=> start!118590 m!1271309))

(declare-fun m!1271311 () Bool)

(assert (=> b!1386379 m!1271311))

(declare-fun m!1271313 () Bool)

(assert (=> b!1386384 m!1271313))

(assert (=> b!1386384 m!1271313))

(declare-fun m!1271315 () Bool)

(assert (=> b!1386384 m!1271315))

(declare-fun m!1271317 () Bool)

(assert (=> b!1386382 m!1271317))

(declare-fun m!1271319 () Bool)

(assert (=> b!1386381 m!1271319))

(assert (=> b!1386381 m!1271319))

(declare-fun m!1271321 () Bool)

(assert (=> b!1386381 m!1271321))

(declare-fun m!1271323 () Bool)

(assert (=> b!1386383 m!1271323))

(declare-fun m!1271325 () Bool)

(assert (=> b!1386383 m!1271325))

(assert (=> b!1386383 m!1271325))

(declare-fun m!1271327 () Bool)

(assert (=> b!1386383 m!1271327))

(declare-fun m!1271329 () Bool)

(assert (=> b!1386383 m!1271329))

(declare-fun m!1271331 () Bool)

(assert (=> b!1386383 m!1271331))

(assert (=> b!1386383 m!1271313))

(declare-fun m!1271333 () Bool)

(assert (=> b!1386383 m!1271333))

(assert (=> b!1386383 m!1271313))

(declare-fun m!1271335 () Bool)

(assert (=> b!1386383 m!1271335))

(assert (=> b!1386380 m!1271319))

(push 1)

(assert (not b!1386384))

(assert (not b!1386383))

(assert (not b!1386379))

(assert (not b!1386381))

(assert (not b!1386382))

(assert (not start!118590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

