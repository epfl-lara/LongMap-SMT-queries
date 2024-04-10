; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131368 () Bool)

(assert start!131368)

(declare-fun b!1540243 () Bool)

(declare-fun e!856647 () Bool)

(declare-fun e!856648 () Bool)

(assert (=> b!1540243 (= e!856647 e!856648)))

(declare-fun res!1056935 () Bool)

(assert (=> b!1540243 (=> (not res!1056935) (not e!856648))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102316 0))(
  ( (array!102317 (arr!49368 (Array (_ BitVec 32) (_ BitVec 64))) (size!49918 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102316)

(declare-fun lt!665278 () (_ BitVec 32))

(assert (=> b!1540243 (= res!1056935 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665278 #b00000000000000000000000000000000) (bvslt lt!665278 (size!49918 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540243 (= lt!665278 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540244 () Bool)

(declare-fun e!856650 () Bool)

(assert (=> b!1540244 (= e!856650 e!856647)))

(declare-fun res!1056934 () Bool)

(assert (=> b!1540244 (=> (not res!1056934) (not e!856647))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13494 0))(
  ( (MissingZero!13494 (index!56371 (_ BitVec 32))) (Found!13494 (index!56372 (_ BitVec 32))) (Intermediate!13494 (undefined!14306 Bool) (index!56373 (_ BitVec 32)) (x!138109 (_ BitVec 32))) (Undefined!13494) (MissingVacant!13494 (index!56374 (_ BitVec 32))) )
))
(declare-fun lt!665277 () SeekEntryResult!13494)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102316 (_ BitVec 32)) SeekEntryResult!13494)

(assert (=> b!1540244 (= res!1056934 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49368 a!2792) j!64) a!2792 mask!2480) lt!665277))))

(assert (=> b!1540244 (= lt!665277 (Found!13494 j!64))))

(declare-fun b!1540245 () Bool)

(declare-fun res!1056933 () Bool)

(assert (=> b!1540245 (=> (not res!1056933) (not e!856647))))

(assert (=> b!1540245 (= res!1056933 (not (= (select (arr!49368 a!2792) index!463) (select (arr!49368 a!2792) j!64))))))

(declare-fun b!1540246 () Bool)

(declare-fun res!1056936 () Bool)

(assert (=> b!1540246 (=> (not res!1056936) (not e!856650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540246 (= res!1056936 (validKeyInArray!0 (select (arr!49368 a!2792) j!64)))))

(declare-fun b!1540247 () Bool)

(declare-fun res!1056940 () Bool)

(assert (=> b!1540247 (=> (not res!1056940) (not e!856650))))

(declare-datatypes ((List!35842 0))(
  ( (Nil!35839) (Cons!35838 (h!37283 (_ BitVec 64)) (t!50536 List!35842)) )
))
(declare-fun arrayNoDuplicates!0 (array!102316 (_ BitVec 32) List!35842) Bool)

(assert (=> b!1540247 (= res!1056940 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35839))))

(declare-fun b!1540248 () Bool)

(declare-fun res!1056938 () Bool)

(assert (=> b!1540248 (=> (not res!1056938) (not e!856650))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540248 (= res!1056938 (validKeyInArray!0 (select (arr!49368 a!2792) i!951)))))

(declare-fun b!1540249 () Bool)

(declare-fun res!1056941 () Bool)

(assert (=> b!1540249 (=> (not res!1056941) (not e!856650))))

(assert (=> b!1540249 (= res!1056941 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49918 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49918 a!2792)) (= (select (arr!49368 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540250 () Bool)

(declare-fun res!1056939 () Bool)

(assert (=> b!1540250 (=> (not res!1056939) (not e!856650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102316 (_ BitVec 32)) Bool)

(assert (=> b!1540250 (= res!1056939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1056942 () Bool)

(assert (=> start!131368 (=> (not res!1056942) (not e!856650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131368 (= res!1056942 (validMask!0 mask!2480))))

(assert (=> start!131368 e!856650))

(assert (=> start!131368 true))

(declare-fun array_inv!38396 (array!102316) Bool)

(assert (=> start!131368 (array_inv!38396 a!2792)))

(declare-fun b!1540251 () Bool)

(declare-fun e!856649 () Bool)

(assert (=> b!1540251 (= e!856649 (not true))))

(declare-fun lt!665275 () SeekEntryResult!13494)

(assert (=> b!1540251 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665278 vacantIndex!5 (select (store (arr!49368 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102317 (store (arr!49368 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49918 a!2792)) mask!2480) lt!665275)))

(declare-datatypes ((Unit!51428 0))(
  ( (Unit!51429) )
))
(declare-fun lt!665276 () Unit!51428)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51428)

(assert (=> b!1540251 (= lt!665276 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665278 vacantIndex!5 mask!2480))))

(declare-fun b!1540252 () Bool)

(assert (=> b!1540252 (= e!856648 e!856649)))

(declare-fun res!1056943 () Bool)

(assert (=> b!1540252 (=> (not res!1056943) (not e!856649))))

(assert (=> b!1540252 (= res!1056943 (= lt!665275 lt!665277))))

(assert (=> b!1540252 (= lt!665275 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665278 vacantIndex!5 (select (arr!49368 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540253 () Bool)

(declare-fun res!1056937 () Bool)

(assert (=> b!1540253 (=> (not res!1056937) (not e!856650))))

(assert (=> b!1540253 (= res!1056937 (and (= (size!49918 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49918 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49918 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131368 res!1056942) b!1540253))

(assert (= (and b!1540253 res!1056937) b!1540248))

(assert (= (and b!1540248 res!1056938) b!1540246))

(assert (= (and b!1540246 res!1056936) b!1540250))

(assert (= (and b!1540250 res!1056939) b!1540247))

(assert (= (and b!1540247 res!1056940) b!1540249))

(assert (= (and b!1540249 res!1056941) b!1540244))

(assert (= (and b!1540244 res!1056934) b!1540245))

(assert (= (and b!1540245 res!1056933) b!1540243))

(assert (= (and b!1540243 res!1056935) b!1540252))

(assert (= (and b!1540252 res!1056943) b!1540251))

(declare-fun m!1422349 () Bool)

(assert (=> b!1540249 m!1422349))

(declare-fun m!1422351 () Bool)

(assert (=> b!1540246 m!1422351))

(assert (=> b!1540246 m!1422351))

(declare-fun m!1422353 () Bool)

(assert (=> b!1540246 m!1422353))

(assert (=> b!1540244 m!1422351))

(assert (=> b!1540244 m!1422351))

(declare-fun m!1422355 () Bool)

(assert (=> b!1540244 m!1422355))

(declare-fun m!1422357 () Bool)

(assert (=> b!1540243 m!1422357))

(declare-fun m!1422359 () Bool)

(assert (=> b!1540250 m!1422359))

(declare-fun m!1422361 () Bool)

(assert (=> b!1540247 m!1422361))

(declare-fun m!1422363 () Bool)

(assert (=> b!1540245 m!1422363))

(assert (=> b!1540245 m!1422351))

(declare-fun m!1422365 () Bool)

(assert (=> b!1540248 m!1422365))

(assert (=> b!1540248 m!1422365))

(declare-fun m!1422367 () Bool)

(assert (=> b!1540248 m!1422367))

(assert (=> b!1540252 m!1422351))

(assert (=> b!1540252 m!1422351))

(declare-fun m!1422369 () Bool)

(assert (=> b!1540252 m!1422369))

(declare-fun m!1422371 () Bool)

(assert (=> b!1540251 m!1422371))

(declare-fun m!1422373 () Bool)

(assert (=> b!1540251 m!1422373))

(assert (=> b!1540251 m!1422373))

(declare-fun m!1422375 () Bool)

(assert (=> b!1540251 m!1422375))

(declare-fun m!1422377 () Bool)

(assert (=> b!1540251 m!1422377))

(declare-fun m!1422379 () Bool)

(assert (=> start!131368 m!1422379))

(declare-fun m!1422381 () Bool)

(assert (=> start!131368 m!1422381))

(check-sat (not start!131368) (not b!1540252) (not b!1540243) (not b!1540244) (not b!1540250) (not b!1540251) (not b!1540248) (not b!1540246) (not b!1540247))
(check-sat)
