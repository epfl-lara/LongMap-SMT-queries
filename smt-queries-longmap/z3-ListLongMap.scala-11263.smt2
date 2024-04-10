; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131374 () Bool)

(assert start!131374)

(declare-fun b!1540342 () Bool)

(declare-fun e!856692 () Bool)

(declare-fun e!856695 () Bool)

(assert (=> b!1540342 (= e!856692 e!856695)))

(declare-fun res!1057040 () Bool)

(assert (=> b!1540342 (=> (not res!1057040) (not e!856695))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((array!102322 0))(
  ( (array!102323 (arr!49371 (Array (_ BitVec 32) (_ BitVec 64))) (size!49921 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102322)

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13497 0))(
  ( (MissingZero!13497 (index!56383 (_ BitVec 32))) (Found!13497 (index!56384 (_ BitVec 32))) (Intermediate!13497 (undefined!14309 Bool) (index!56385 (_ BitVec 32)) (x!138120 (_ BitVec 32))) (Undefined!13497) (MissingVacant!13497 (index!56386 (_ BitVec 32))) )
))
(declare-fun lt!665312 () SeekEntryResult!13497)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102322 (_ BitVec 32)) SeekEntryResult!13497)

(assert (=> b!1540342 (= res!1057040 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49371 a!2792) j!64) a!2792 mask!2480) lt!665312))))

(assert (=> b!1540342 (= lt!665312 (Found!13497 j!64))))

(declare-fun b!1540343 () Bool)

(declare-fun res!1057033 () Bool)

(assert (=> b!1540343 (=> (not res!1057033) (not e!856692))))

(declare-datatypes ((List!35845 0))(
  ( (Nil!35842) (Cons!35841 (h!37286 (_ BitVec 64)) (t!50539 List!35845)) )
))
(declare-fun arrayNoDuplicates!0 (array!102322 (_ BitVec 32) List!35845) Bool)

(assert (=> b!1540343 (= res!1057033 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35842))))

(declare-fun b!1540344 () Bool)

(declare-fun res!1057038 () Bool)

(assert (=> b!1540344 (=> (not res!1057038) (not e!856692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102322 (_ BitVec 32)) Bool)

(assert (=> b!1540344 (= res!1057038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540345 () Bool)

(declare-fun res!1057039 () Bool)

(assert (=> b!1540345 (=> (not res!1057039) (not e!856692))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540345 (= res!1057039 (validKeyInArray!0 (select (arr!49371 a!2792) i!951)))))

(declare-fun b!1540346 () Bool)

(declare-fun e!856693 () Bool)

(declare-fun e!856694 () Bool)

(assert (=> b!1540346 (= e!856693 e!856694)))

(declare-fun res!1057034 () Bool)

(assert (=> b!1540346 (=> (not res!1057034) (not e!856694))))

(declare-fun lt!665314 () SeekEntryResult!13497)

(assert (=> b!1540346 (= res!1057034 (= lt!665314 lt!665312))))

(declare-fun lt!665311 () (_ BitVec 32))

(assert (=> b!1540346 (= lt!665314 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665311 vacantIndex!5 (select (arr!49371 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540347 () Bool)

(assert (=> b!1540347 (= e!856695 e!856693)))

(declare-fun res!1057041 () Bool)

(assert (=> b!1540347 (=> (not res!1057041) (not e!856693))))

(assert (=> b!1540347 (= res!1057041 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665311 #b00000000000000000000000000000000) (bvslt lt!665311 (size!49921 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540347 (= lt!665311 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540348 () Bool)

(assert (=> b!1540348 (= e!856694 (not true))))

(assert (=> b!1540348 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665311 vacantIndex!5 (select (store (arr!49371 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102323 (store (arr!49371 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49921 a!2792)) mask!2480) lt!665314)))

(declare-datatypes ((Unit!51434 0))(
  ( (Unit!51435) )
))
(declare-fun lt!665313 () Unit!51434)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51434)

(assert (=> b!1540348 (= lt!665313 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665311 vacantIndex!5 mask!2480))))

(declare-fun b!1540349 () Bool)

(declare-fun res!1057032 () Bool)

(assert (=> b!1540349 (=> (not res!1057032) (not e!856695))))

(assert (=> b!1540349 (= res!1057032 (not (= (select (arr!49371 a!2792) index!463) (select (arr!49371 a!2792) j!64))))))

(declare-fun res!1057036 () Bool)

(assert (=> start!131374 (=> (not res!1057036) (not e!856692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131374 (= res!1057036 (validMask!0 mask!2480))))

(assert (=> start!131374 e!856692))

(assert (=> start!131374 true))

(declare-fun array_inv!38399 (array!102322) Bool)

(assert (=> start!131374 (array_inv!38399 a!2792)))

(declare-fun b!1540350 () Bool)

(declare-fun res!1057037 () Bool)

(assert (=> b!1540350 (=> (not res!1057037) (not e!856692))))

(assert (=> b!1540350 (= res!1057037 (and (= (size!49921 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49921 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49921 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540351 () Bool)

(declare-fun res!1057035 () Bool)

(assert (=> b!1540351 (=> (not res!1057035) (not e!856692))))

(assert (=> b!1540351 (= res!1057035 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49921 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49921 a!2792)) (= (select (arr!49371 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540352 () Bool)

(declare-fun res!1057042 () Bool)

(assert (=> b!1540352 (=> (not res!1057042) (not e!856692))))

(assert (=> b!1540352 (= res!1057042 (validKeyInArray!0 (select (arr!49371 a!2792) j!64)))))

(assert (= (and start!131374 res!1057036) b!1540350))

(assert (= (and b!1540350 res!1057037) b!1540345))

(assert (= (and b!1540345 res!1057039) b!1540352))

(assert (= (and b!1540352 res!1057042) b!1540344))

(assert (= (and b!1540344 res!1057038) b!1540343))

(assert (= (and b!1540343 res!1057033) b!1540351))

(assert (= (and b!1540351 res!1057035) b!1540342))

(assert (= (and b!1540342 res!1057040) b!1540349))

(assert (= (and b!1540349 res!1057032) b!1540347))

(assert (= (and b!1540347 res!1057041) b!1540346))

(assert (= (and b!1540346 res!1057034) b!1540348))

(declare-fun m!1422451 () Bool)

(assert (=> b!1540348 m!1422451))

(declare-fun m!1422453 () Bool)

(assert (=> b!1540348 m!1422453))

(assert (=> b!1540348 m!1422453))

(declare-fun m!1422455 () Bool)

(assert (=> b!1540348 m!1422455))

(declare-fun m!1422457 () Bool)

(assert (=> b!1540348 m!1422457))

(declare-fun m!1422459 () Bool)

(assert (=> b!1540352 m!1422459))

(assert (=> b!1540352 m!1422459))

(declare-fun m!1422461 () Bool)

(assert (=> b!1540352 m!1422461))

(assert (=> b!1540346 m!1422459))

(assert (=> b!1540346 m!1422459))

(declare-fun m!1422463 () Bool)

(assert (=> b!1540346 m!1422463))

(declare-fun m!1422465 () Bool)

(assert (=> b!1540351 m!1422465))

(declare-fun m!1422467 () Bool)

(assert (=> start!131374 m!1422467))

(declare-fun m!1422469 () Bool)

(assert (=> start!131374 m!1422469))

(declare-fun m!1422471 () Bool)

(assert (=> b!1540343 m!1422471))

(declare-fun m!1422473 () Bool)

(assert (=> b!1540345 m!1422473))

(assert (=> b!1540345 m!1422473))

(declare-fun m!1422475 () Bool)

(assert (=> b!1540345 m!1422475))

(declare-fun m!1422477 () Bool)

(assert (=> b!1540347 m!1422477))

(assert (=> b!1540342 m!1422459))

(assert (=> b!1540342 m!1422459))

(declare-fun m!1422479 () Bool)

(assert (=> b!1540342 m!1422479))

(declare-fun m!1422481 () Bool)

(assert (=> b!1540349 m!1422481))

(assert (=> b!1540349 m!1422459))

(declare-fun m!1422483 () Bool)

(assert (=> b!1540344 m!1422483))

(check-sat (not b!1540352) (not start!131374) (not b!1540348) (not b!1540342) (not b!1540345) (not b!1540343) (not b!1540344) (not b!1540346) (not b!1540347))
(check-sat)
