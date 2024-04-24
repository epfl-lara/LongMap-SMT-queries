; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57054 () Bool)

(assert start!57054)

(declare-fun b!631200 () Bool)

(declare-fun res!408060 () Bool)

(declare-fun e!360919 () Bool)

(assert (=> b!631200 (=> (not res!408060) (not e!360919))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38073 0))(
  ( (array!38074 (arr!18268 (Array (_ BitVec 32) (_ BitVec 64))) (size!18632 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38073)

(assert (=> b!631200 (= res!408060 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18268 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631201 () Bool)

(declare-fun res!408054 () Bool)

(assert (=> b!631201 (=> (not res!408054) (not e!360919))))

(declare-datatypes ((List!12216 0))(
  ( (Nil!12213) (Cons!12212 (h!13260 (_ BitVec 64)) (t!18436 List!12216)) )
))
(declare-fun arrayNoDuplicates!0 (array!38073 (_ BitVec 32) List!12216) Bool)

(assert (=> b!631201 (= res!408054 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12213))))

(declare-fun b!631202 () Bool)

(declare-fun res!408058 () Bool)

(declare-fun e!360916 () Bool)

(assert (=> b!631202 (=> (not res!408058) (not e!360916))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631202 (= res!408058 (validKeyInArray!0 k0!1786))))

(declare-fun res!408061 () Bool)

(assert (=> start!57054 (=> (not res!408061) (not e!360916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57054 (= res!408061 (validMask!0 mask!3053))))

(assert (=> start!57054 e!360916))

(assert (=> start!57054 true))

(declare-fun array_inv!14127 (array!38073) Bool)

(assert (=> start!57054 (array_inv!14127 a!2986)))

(declare-fun b!631203 () Bool)

(declare-fun e!360920 () Bool)

(declare-datatypes ((SeekEntryResult!6664 0))(
  ( (MissingZero!6664 (index!28946 (_ BitVec 32))) (Found!6664 (index!28947 (_ BitVec 32))) (Intermediate!6664 (undefined!7476 Bool) (index!28948 (_ BitVec 32)) (x!57837 (_ BitVec 32))) (Undefined!6664) (MissingVacant!6664 (index!28949 (_ BitVec 32))) )
))
(declare-fun lt!291579 () SeekEntryResult!6664)

(declare-fun lt!291580 () SeekEntryResult!6664)

(assert (=> b!631203 (= e!360920 (= lt!291579 lt!291580))))

(declare-fun b!631204 () Bool)

(declare-fun res!408064 () Bool)

(assert (=> b!631204 (=> (not res!408064) (not e!360916))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!631204 (= res!408064 (and (= (size!18632 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18632 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18632 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631205 () Bool)

(declare-fun res!408056 () Bool)

(assert (=> b!631205 (=> (not res!408056) (not e!360916))))

(assert (=> b!631205 (= res!408056 (validKeyInArray!0 (select (arr!18268 a!2986) j!136)))))

(declare-fun b!631206 () Bool)

(declare-fun e!360918 () Bool)

(declare-fun e!360915 () Bool)

(assert (=> b!631206 (= e!360918 e!360915)))

(declare-fun res!408063 () Bool)

(assert (=> b!631206 (=> (not res!408063) (not e!360915))))

(assert (=> b!631206 (= res!408063 (and (= lt!291579 (Found!6664 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18268 a!2986) index!984) (select (arr!18268 a!2986) j!136))) (not (= (select (arr!18268 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38073 (_ BitVec 32)) SeekEntryResult!6664)

(assert (=> b!631206 (= lt!291579 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18268 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631207 () Bool)

(declare-datatypes ((Unit!21165 0))(
  ( (Unit!21166) )
))
(declare-fun e!360917 () Unit!21165)

(declare-fun Unit!21167 () Unit!21165)

(assert (=> b!631207 (= e!360917 Unit!21167)))

(declare-fun b!631208 () Bool)

(assert (=> b!631208 (= e!360915 (not true))))

(declare-fun lt!291573 () Unit!21165)

(assert (=> b!631208 (= lt!291573 e!360917)))

(declare-fun c!71942 () Bool)

(declare-fun lt!291575 () (_ BitVec 64))

(declare-fun lt!291578 () array!38073)

(assert (=> b!631208 (= c!71942 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291575 lt!291578 mask!3053) Undefined!6664))))

(assert (=> b!631208 e!360920))

(declare-fun res!408053 () Bool)

(assert (=> b!631208 (=> (not res!408053) (not e!360920))))

(declare-fun lt!291577 () (_ BitVec 32))

(assert (=> b!631208 (= res!408053 (= lt!291580 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291577 vacantSpotIndex!68 lt!291575 lt!291578 mask!3053)))))

(assert (=> b!631208 (= lt!291580 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291577 vacantSpotIndex!68 (select (arr!18268 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631208 (= lt!291575 (select (store (arr!18268 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291574 () Unit!21165)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38073 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21165)

(assert (=> b!631208 (= lt!291574 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291577 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631208 (= lt!291577 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!631209 () Bool)

(assert (=> b!631209 (= e!360916 e!360919)))

(declare-fun res!408057 () Bool)

(assert (=> b!631209 (=> (not res!408057) (not e!360919))))

(declare-fun lt!291576 () SeekEntryResult!6664)

(assert (=> b!631209 (= res!408057 (or (= lt!291576 (MissingZero!6664 i!1108)) (= lt!291576 (MissingVacant!6664 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38073 (_ BitVec 32)) SeekEntryResult!6664)

(assert (=> b!631209 (= lt!291576 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631210 () Bool)

(declare-fun res!408055 () Bool)

(assert (=> b!631210 (=> (not res!408055) (not e!360916))))

(declare-fun arrayContainsKey!0 (array!38073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631210 (= res!408055 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631211 () Bool)

(assert (=> b!631211 (= e!360919 e!360918)))

(declare-fun res!408059 () Bool)

(assert (=> b!631211 (=> (not res!408059) (not e!360918))))

(assert (=> b!631211 (= res!408059 (= (select (store (arr!18268 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631211 (= lt!291578 (array!38074 (store (arr!18268 a!2986) i!1108 k0!1786) (size!18632 a!2986)))))

(declare-fun b!631212 () Bool)

(declare-fun res!408062 () Bool)

(assert (=> b!631212 (=> (not res!408062) (not e!360919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38073 (_ BitVec 32)) Bool)

(assert (=> b!631212 (= res!408062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631213 () Bool)

(declare-fun Unit!21168 () Unit!21165)

(assert (=> b!631213 (= e!360917 Unit!21168)))

(assert (=> b!631213 false))

(assert (= (and start!57054 res!408061) b!631204))

(assert (= (and b!631204 res!408064) b!631205))

(assert (= (and b!631205 res!408056) b!631202))

(assert (= (and b!631202 res!408058) b!631210))

(assert (= (and b!631210 res!408055) b!631209))

(assert (= (and b!631209 res!408057) b!631212))

(assert (= (and b!631212 res!408062) b!631201))

(assert (= (and b!631201 res!408054) b!631200))

(assert (= (and b!631200 res!408060) b!631211))

(assert (= (and b!631211 res!408059) b!631206))

(assert (= (and b!631206 res!408063) b!631208))

(assert (= (and b!631208 res!408053) b!631203))

(assert (= (and b!631208 c!71942) b!631213))

(assert (= (and b!631208 (not c!71942)) b!631207))

(declare-fun m!606457 () Bool)

(assert (=> b!631206 m!606457))

(declare-fun m!606459 () Bool)

(assert (=> b!631206 m!606459))

(assert (=> b!631206 m!606459))

(declare-fun m!606461 () Bool)

(assert (=> b!631206 m!606461))

(declare-fun m!606463 () Bool)

(assert (=> start!57054 m!606463))

(declare-fun m!606465 () Bool)

(assert (=> start!57054 m!606465))

(declare-fun m!606467 () Bool)

(assert (=> b!631201 m!606467))

(declare-fun m!606469 () Bool)

(assert (=> b!631212 m!606469))

(declare-fun m!606471 () Bool)

(assert (=> b!631208 m!606471))

(declare-fun m!606473 () Bool)

(assert (=> b!631208 m!606473))

(declare-fun m!606475 () Bool)

(assert (=> b!631208 m!606475))

(declare-fun m!606477 () Bool)

(assert (=> b!631208 m!606477))

(declare-fun m!606479 () Bool)

(assert (=> b!631208 m!606479))

(assert (=> b!631208 m!606459))

(declare-fun m!606481 () Bool)

(assert (=> b!631208 m!606481))

(assert (=> b!631208 m!606459))

(declare-fun m!606483 () Bool)

(assert (=> b!631208 m!606483))

(declare-fun m!606485 () Bool)

(assert (=> b!631200 m!606485))

(declare-fun m!606487 () Bool)

(assert (=> b!631202 m!606487))

(declare-fun m!606489 () Bool)

(assert (=> b!631210 m!606489))

(assert (=> b!631205 m!606459))

(assert (=> b!631205 m!606459))

(declare-fun m!606491 () Bool)

(assert (=> b!631205 m!606491))

(declare-fun m!606493 () Bool)

(assert (=> b!631209 m!606493))

(assert (=> b!631211 m!606473))

(declare-fun m!606495 () Bool)

(assert (=> b!631211 m!606495))

(check-sat (not b!631202) (not b!631209) (not b!631201) (not start!57054) (not b!631208) (not b!631205) (not b!631212) (not b!631210) (not b!631206))
(check-sat)
