; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44680 () Bool)

(assert start!44680)

(declare-datatypes ((array!31739 0))(
  ( (array!31740 (arr!15257 (Array (_ BitVec 32) (_ BitVec 64))) (size!15621 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31739)

(declare-fun b!490272 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!288232 () Bool)

(declare-datatypes ((SeekEntryResult!3724 0))(
  ( (MissingZero!3724 (index!17075 (_ BitVec 32))) (Found!3724 (index!17076 (_ BitVec 32))) (Intermediate!3724 (undefined!4536 Bool) (index!17077 (_ BitVec 32)) (x!46174 (_ BitVec 32))) (Undefined!3724) (MissingVacant!3724 (index!17078 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31739 (_ BitVec 32)) SeekEntryResult!3724)

(assert (=> b!490272 (= e!288232 (= (seekEntryOrOpen!0 (select (arr!15257 a!3235) j!176) a!3235 mask!3524) (Found!3724 j!176)))))

(declare-fun b!490273 () Bool)

(declare-fun res!293208 () Bool)

(declare-fun e!288233 () Bool)

(assert (=> b!490273 (=> (not res!293208) (not e!288233))))

(declare-datatypes ((List!9415 0))(
  ( (Nil!9412) (Cons!9411 (h!10273 (_ BitVec 64)) (t!15643 List!9415)) )
))
(declare-fun arrayNoDuplicates!0 (array!31739 (_ BitVec 32) List!9415) Bool)

(assert (=> b!490273 (= res!293208 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9412))))

(declare-fun b!490274 () Bool)

(declare-fun res!293210 () Bool)

(declare-fun e!288231 () Bool)

(assert (=> b!490274 (=> (not res!293210) (not e!288231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490274 (= res!293210 (validKeyInArray!0 (select (arr!15257 a!3235) j!176)))))

(declare-fun b!490275 () Bool)

(declare-fun res!293216 () Bool)

(assert (=> b!490275 (=> (not res!293216) (not e!288231))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!490275 (= res!293216 (validKeyInArray!0 k!2280))))

(declare-fun res!293214 () Bool)

(assert (=> start!44680 (=> (not res!293214) (not e!288231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44680 (= res!293214 (validMask!0 mask!3524))))

(assert (=> start!44680 e!288231))

(assert (=> start!44680 true))

(declare-fun array_inv!11053 (array!31739) Bool)

(assert (=> start!44680 (array_inv!11053 a!3235)))

(declare-fun b!490276 () Bool)

(assert (=> b!490276 (= e!288233 (not true))))

(declare-fun lt!221381 () SeekEntryResult!3724)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!221385 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31739 (_ BitVec 32)) SeekEntryResult!3724)

(assert (=> b!490276 (= lt!221381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221385 (select (store (arr!15257 a!3235) i!1204 k!2280) j!176) (array!31740 (store (arr!15257 a!3235) i!1204 k!2280) (size!15621 a!3235)) mask!3524))))

(declare-fun lt!221384 () SeekEntryResult!3724)

(declare-fun lt!221383 () (_ BitVec 32))

(assert (=> b!490276 (= lt!221384 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221383 (select (arr!15257 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490276 (= lt!221385 (toIndex!0 (select (store (arr!15257 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!490276 (= lt!221383 (toIndex!0 (select (arr!15257 a!3235) j!176) mask!3524))))

(assert (=> b!490276 e!288232))

(declare-fun res!293211 () Bool)

(assert (=> b!490276 (=> (not res!293211) (not e!288232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31739 (_ BitVec 32)) Bool)

(assert (=> b!490276 (= res!293211 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14394 0))(
  ( (Unit!14395) )
))
(declare-fun lt!221386 () Unit!14394)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14394)

(assert (=> b!490276 (= lt!221386 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490277 () Bool)

(declare-fun res!293213 () Bool)

(assert (=> b!490277 (=> (not res!293213) (not e!288231))))

(assert (=> b!490277 (= res!293213 (and (= (size!15621 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15621 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15621 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490278 () Bool)

(declare-fun res!293209 () Bool)

(assert (=> b!490278 (=> (not res!293209) (not e!288231))))

(declare-fun arrayContainsKey!0 (array!31739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490278 (= res!293209 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490279 () Bool)

(assert (=> b!490279 (= e!288231 e!288233)))

(declare-fun res!293212 () Bool)

(assert (=> b!490279 (=> (not res!293212) (not e!288233))))

(declare-fun lt!221382 () SeekEntryResult!3724)

(assert (=> b!490279 (= res!293212 (or (= lt!221382 (MissingZero!3724 i!1204)) (= lt!221382 (MissingVacant!3724 i!1204))))))

(assert (=> b!490279 (= lt!221382 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490280 () Bool)

(declare-fun res!293215 () Bool)

(assert (=> b!490280 (=> (not res!293215) (not e!288233))))

(assert (=> b!490280 (= res!293215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44680 res!293214) b!490277))

(assert (= (and b!490277 res!293213) b!490274))

(assert (= (and b!490274 res!293210) b!490275))

(assert (= (and b!490275 res!293216) b!490278))

(assert (= (and b!490278 res!293209) b!490279))

(assert (= (and b!490279 res!293212) b!490280))

(assert (= (and b!490280 res!293215) b!490273))

(assert (= (and b!490273 res!293208) b!490276))

(assert (= (and b!490276 res!293211) b!490272))

(declare-fun m!470325 () Bool)

(assert (=> start!44680 m!470325))

(declare-fun m!470327 () Bool)

(assert (=> start!44680 m!470327))

(declare-fun m!470329 () Bool)

(assert (=> b!490275 m!470329))

(declare-fun m!470331 () Bool)

(assert (=> b!490273 m!470331))

(declare-fun m!470333 () Bool)

(assert (=> b!490278 m!470333))

(declare-fun m!470335 () Bool)

(assert (=> b!490274 m!470335))

(assert (=> b!490274 m!470335))

(declare-fun m!470337 () Bool)

(assert (=> b!490274 m!470337))

(declare-fun m!470339 () Bool)

(assert (=> b!490276 m!470339))

(declare-fun m!470341 () Bool)

(assert (=> b!490276 m!470341))

(declare-fun m!470343 () Bool)

(assert (=> b!490276 m!470343))

(assert (=> b!490276 m!470343))

(declare-fun m!470345 () Bool)

(assert (=> b!490276 m!470345))

(assert (=> b!490276 m!470335))

(declare-fun m!470347 () Bool)

(assert (=> b!490276 m!470347))

(assert (=> b!490276 m!470335))

(declare-fun m!470349 () Bool)

(assert (=> b!490276 m!470349))

(assert (=> b!490276 m!470335))

(declare-fun m!470351 () Bool)

(assert (=> b!490276 m!470351))

(assert (=> b!490276 m!470343))

(declare-fun m!470353 () Bool)

(assert (=> b!490276 m!470353))

(declare-fun m!470355 () Bool)

(assert (=> b!490279 m!470355))

(declare-fun m!470357 () Bool)

(assert (=> b!490280 m!470357))

(assert (=> b!490272 m!470335))

(assert (=> b!490272 m!470335))

(declare-fun m!470359 () Bool)

(assert (=> b!490272 m!470359))

(push 1)

