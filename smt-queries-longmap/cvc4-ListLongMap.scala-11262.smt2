; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131370 () Bool)

(assert start!131370)

(declare-fun b!1540276 () Bool)

(declare-fun res!1056967 () Bool)

(declare-fun e!856663 () Bool)

(assert (=> b!1540276 (=> (not res!1056967) (not e!856663))))

(declare-datatypes ((array!102318 0))(
  ( (array!102319 (arr!49369 (Array (_ BitVec 32) (_ BitVec 64))) (size!49919 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102318)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102318 (_ BitVec 32)) Bool)

(assert (=> b!1540276 (= res!1056967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540277 () Bool)

(declare-fun res!1056968 () Bool)

(assert (=> b!1540277 (=> (not res!1056968) (not e!856663))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540277 (= res!1056968 (validKeyInArray!0 (select (arr!49369 a!2792) i!951)))))

(declare-fun b!1540278 () Bool)

(declare-fun res!1056966 () Bool)

(assert (=> b!1540278 (=> (not res!1056966) (not e!856663))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1540278 (= res!1056966 (validKeyInArray!0 (select (arr!49369 a!2792) j!64)))))

(declare-fun b!1540279 () Bool)

(declare-fun e!856665 () Bool)

(assert (=> b!1540279 (= e!856663 e!856665)))

(declare-fun res!1056975 () Bool)

(assert (=> b!1540279 (=> (not res!1056975) (not e!856665))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13495 0))(
  ( (MissingZero!13495 (index!56375 (_ BitVec 32))) (Found!13495 (index!56376 (_ BitVec 32))) (Intermediate!13495 (undefined!14307 Bool) (index!56377 (_ BitVec 32)) (x!138110 (_ BitVec 32))) (Undefined!13495) (MissingVacant!13495 (index!56378 (_ BitVec 32))) )
))
(declare-fun lt!665290 () SeekEntryResult!13495)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102318 (_ BitVec 32)) SeekEntryResult!13495)

(assert (=> b!1540279 (= res!1056975 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49369 a!2792) j!64) a!2792 mask!2480) lt!665290))))

(assert (=> b!1540279 (= lt!665290 (Found!13495 j!64))))

(declare-fun b!1540280 () Bool)

(declare-fun res!1056972 () Bool)

(assert (=> b!1540280 (=> (not res!1056972) (not e!856665))))

(assert (=> b!1540280 (= res!1056972 (not (= (select (arr!49369 a!2792) index!463) (select (arr!49369 a!2792) j!64))))))

(declare-fun b!1540282 () Bool)

(declare-fun e!856664 () Bool)

(assert (=> b!1540282 (= e!856665 e!856664)))

(declare-fun res!1056974 () Bool)

(assert (=> b!1540282 (=> (not res!1056974) (not e!856664))))

(declare-fun lt!665288 () (_ BitVec 32))

(assert (=> b!1540282 (= res!1056974 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665288 #b00000000000000000000000000000000) (bvslt lt!665288 (size!49919 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540282 (= lt!665288 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540283 () Bool)

(declare-fun res!1056976 () Bool)

(assert (=> b!1540283 (=> (not res!1056976) (not e!856663))))

(assert (=> b!1540283 (= res!1056976 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49919 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49919 a!2792)) (= (select (arr!49369 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540284 () Bool)

(declare-fun res!1056970 () Bool)

(assert (=> b!1540284 (=> (not res!1056970) (not e!856663))))

(declare-datatypes ((List!35843 0))(
  ( (Nil!35840) (Cons!35839 (h!37284 (_ BitVec 64)) (t!50537 List!35843)) )
))
(declare-fun arrayNoDuplicates!0 (array!102318 (_ BitVec 32) List!35843) Bool)

(assert (=> b!1540284 (= res!1056970 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35840))))

(declare-fun b!1540285 () Bool)

(declare-fun res!1056971 () Bool)

(assert (=> b!1540285 (=> (not res!1056971) (not e!856663))))

(assert (=> b!1540285 (= res!1056971 (and (= (size!49919 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49919 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49919 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540286 () Bool)

(declare-fun e!856662 () Bool)

(assert (=> b!1540286 (= e!856664 e!856662)))

(declare-fun res!1056973 () Bool)

(assert (=> b!1540286 (=> (not res!1056973) (not e!856662))))

(declare-fun lt!665289 () SeekEntryResult!13495)

(assert (=> b!1540286 (= res!1056973 (= lt!665289 lt!665290))))

(assert (=> b!1540286 (= lt!665289 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665288 vacantIndex!5 (select (arr!49369 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1056969 () Bool)

(assert (=> start!131370 (=> (not res!1056969) (not e!856663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131370 (= res!1056969 (validMask!0 mask!2480))))

(assert (=> start!131370 e!856663))

(assert (=> start!131370 true))

(declare-fun array_inv!38397 (array!102318) Bool)

(assert (=> start!131370 (array_inv!38397 a!2792)))

(declare-fun b!1540281 () Bool)

(assert (=> b!1540281 (= e!856662 (not true))))

(assert (=> b!1540281 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665288 vacantIndex!5 (select (store (arr!49369 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102319 (store (arr!49369 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49919 a!2792)) mask!2480) lt!665289)))

(declare-datatypes ((Unit!51430 0))(
  ( (Unit!51431) )
))
(declare-fun lt!665287 () Unit!51430)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51430)

(assert (=> b!1540281 (= lt!665287 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665288 vacantIndex!5 mask!2480))))

(assert (= (and start!131370 res!1056969) b!1540285))

(assert (= (and b!1540285 res!1056971) b!1540277))

(assert (= (and b!1540277 res!1056968) b!1540278))

(assert (= (and b!1540278 res!1056966) b!1540276))

(assert (= (and b!1540276 res!1056967) b!1540284))

(assert (= (and b!1540284 res!1056970) b!1540283))

(assert (= (and b!1540283 res!1056976) b!1540279))

(assert (= (and b!1540279 res!1056975) b!1540280))

(assert (= (and b!1540280 res!1056972) b!1540282))

(assert (= (and b!1540282 res!1056974) b!1540286))

(assert (= (and b!1540286 res!1056973) b!1540281))

(declare-fun m!1422383 () Bool)

(assert (=> b!1540280 m!1422383))

(declare-fun m!1422385 () Bool)

(assert (=> b!1540280 m!1422385))

(declare-fun m!1422387 () Bool)

(assert (=> b!1540276 m!1422387))

(assert (=> b!1540279 m!1422385))

(assert (=> b!1540279 m!1422385))

(declare-fun m!1422389 () Bool)

(assert (=> b!1540279 m!1422389))

(assert (=> b!1540278 m!1422385))

(assert (=> b!1540278 m!1422385))

(declare-fun m!1422391 () Bool)

(assert (=> b!1540278 m!1422391))

(declare-fun m!1422393 () Bool)

(assert (=> b!1540277 m!1422393))

(assert (=> b!1540277 m!1422393))

(declare-fun m!1422395 () Bool)

(assert (=> b!1540277 m!1422395))

(assert (=> b!1540286 m!1422385))

(assert (=> b!1540286 m!1422385))

(declare-fun m!1422397 () Bool)

(assert (=> b!1540286 m!1422397))

(declare-fun m!1422399 () Bool)

(assert (=> b!1540282 m!1422399))

(declare-fun m!1422401 () Bool)

(assert (=> b!1540281 m!1422401))

(declare-fun m!1422403 () Bool)

(assert (=> b!1540281 m!1422403))

(assert (=> b!1540281 m!1422403))

(declare-fun m!1422405 () Bool)

(assert (=> b!1540281 m!1422405))

(declare-fun m!1422407 () Bool)

(assert (=> b!1540281 m!1422407))

(declare-fun m!1422409 () Bool)

(assert (=> b!1540283 m!1422409))

(declare-fun m!1422411 () Bool)

(assert (=> b!1540284 m!1422411))

(declare-fun m!1422413 () Bool)

(assert (=> start!131370 m!1422413))

(declare-fun m!1422415 () Bool)

(assert (=> start!131370 m!1422415))

(push 1)

(assert (not b!1540281))

(assert (not b!1540277))

(assert (not b!1540278))

(assert (not b!1540282))

