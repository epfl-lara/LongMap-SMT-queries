; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131248 () Bool)

(assert start!131248)

(declare-fun b!1539344 () Bool)

(declare-fun res!1056331 () Bool)

(declare-fun e!856188 () Bool)

(assert (=> b!1539344 (=> (not res!1056331) (not e!856188))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102233 0))(
  ( (array!102234 (arr!49329 (Array (_ BitVec 32) (_ BitVec 64))) (size!49881 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102233)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13480 0))(
  ( (MissingZero!13480 (index!56315 (_ BitVec 32))) (Found!13480 (index!56316 (_ BitVec 32))) (Intermediate!13480 (undefined!14292 Bool) (index!56317 (_ BitVec 32)) (x!138044 (_ BitVec 32))) (Undefined!13480) (MissingVacant!13480 (index!56318 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102233 (_ BitVec 32)) SeekEntryResult!13480)

(assert (=> b!1539344 (= res!1056331 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49329 a!2792) j!64) a!2792 mask!2480) (Found!13480 j!64)))))

(declare-fun b!1539345 () Bool)

(assert (=> b!1539345 (= e!856188 false)))

(declare-fun lt!664827 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539345 (= lt!664827 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539346 () Bool)

(declare-fun res!1056329 () Bool)

(assert (=> b!1539346 (=> (not res!1056329) (not e!856188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539346 (= res!1056329 (validKeyInArray!0 (select (arr!49329 a!2792) j!64)))))

(declare-fun b!1539347 () Bool)

(declare-fun res!1056334 () Bool)

(assert (=> b!1539347 (=> (not res!1056334) (not e!856188))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539347 (= res!1056334 (and (= (size!49881 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49881 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49881 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539348 () Bool)

(declare-fun res!1056328 () Bool)

(assert (=> b!1539348 (=> (not res!1056328) (not e!856188))))

(assert (=> b!1539348 (= res!1056328 (not (= (select (arr!49329 a!2792) index!463) (select (arr!49329 a!2792) j!64))))))

(declare-fun b!1539349 () Bool)

(declare-fun res!1056330 () Bool)

(assert (=> b!1539349 (=> (not res!1056330) (not e!856188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102233 (_ BitVec 32)) Bool)

(assert (=> b!1539349 (= res!1056330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1056327 () Bool)

(assert (=> start!131248 (=> (not res!1056327) (not e!856188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131248 (= res!1056327 (validMask!0 mask!2480))))

(assert (=> start!131248 e!856188))

(assert (=> start!131248 true))

(declare-fun array_inv!38562 (array!102233) Bool)

(assert (=> start!131248 (array_inv!38562 a!2792)))

(declare-fun b!1539350 () Bool)

(declare-fun res!1056326 () Bool)

(assert (=> b!1539350 (=> (not res!1056326) (not e!856188))))

(declare-datatypes ((List!35881 0))(
  ( (Nil!35878) (Cons!35877 (h!37323 (_ BitVec 64)) (t!50567 List!35881)) )
))
(declare-fun arrayNoDuplicates!0 (array!102233 (_ BitVec 32) List!35881) Bool)

(assert (=> b!1539350 (= res!1056326 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35878))))

(declare-fun b!1539351 () Bool)

(declare-fun res!1056333 () Bool)

(assert (=> b!1539351 (=> (not res!1056333) (not e!856188))))

(assert (=> b!1539351 (= res!1056333 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49881 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49881 a!2792)) (= (select (arr!49329 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539352 () Bool)

(declare-fun res!1056332 () Bool)

(assert (=> b!1539352 (=> (not res!1056332) (not e!856188))))

(assert (=> b!1539352 (= res!1056332 (validKeyInArray!0 (select (arr!49329 a!2792) i!951)))))

(assert (= (and start!131248 res!1056327) b!1539347))

(assert (= (and b!1539347 res!1056334) b!1539352))

(assert (= (and b!1539352 res!1056332) b!1539346))

(assert (= (and b!1539346 res!1056329) b!1539349))

(assert (= (and b!1539349 res!1056330) b!1539350))

(assert (= (and b!1539350 res!1056326) b!1539351))

(assert (= (and b!1539351 res!1056333) b!1539344))

(assert (= (and b!1539344 res!1056331) b!1539348))

(assert (= (and b!1539348 res!1056328) b!1539345))

(declare-fun m!1420967 () Bool)

(assert (=> b!1539352 m!1420967))

(assert (=> b!1539352 m!1420967))

(declare-fun m!1420969 () Bool)

(assert (=> b!1539352 m!1420969))

(declare-fun m!1420971 () Bool)

(assert (=> b!1539346 m!1420971))

(assert (=> b!1539346 m!1420971))

(declare-fun m!1420973 () Bool)

(assert (=> b!1539346 m!1420973))

(declare-fun m!1420975 () Bool)

(assert (=> b!1539350 m!1420975))

(declare-fun m!1420977 () Bool)

(assert (=> b!1539345 m!1420977))

(assert (=> b!1539344 m!1420971))

(assert (=> b!1539344 m!1420971))

(declare-fun m!1420979 () Bool)

(assert (=> b!1539344 m!1420979))

(declare-fun m!1420981 () Bool)

(assert (=> b!1539351 m!1420981))

(declare-fun m!1420983 () Bool)

(assert (=> b!1539349 m!1420983))

(declare-fun m!1420985 () Bool)

(assert (=> start!131248 m!1420985))

(declare-fun m!1420987 () Bool)

(assert (=> start!131248 m!1420987))

(declare-fun m!1420989 () Bool)

(assert (=> b!1539348 m!1420989))

(assert (=> b!1539348 m!1420971))

(push 1)

(assert (not start!131248))

(assert (not b!1539349))

(assert (not b!1539350))

(assert (not b!1539352))

(assert (not b!1539345))

(assert (not b!1539344))

(assert (not b!1539346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

