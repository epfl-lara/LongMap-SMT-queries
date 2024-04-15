; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53436 () Bool)

(assert start!53436)

(declare-fun b!581363 () Bool)

(declare-fun res!369323 () Bool)

(declare-fun e!333552 () Bool)

(assert (=> b!581363 (=> (not res!369323) (not e!333552))))

(declare-datatypes ((array!36351 0))(
  ( (array!36352 (arr!17450 (Array (_ BitVec 32) (_ BitVec 64))) (size!17815 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36351)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581363 (= res!369323 (validKeyInArray!0 (select (arr!17450 a!2986) j!136)))))

(declare-fun b!581364 () Bool)

(declare-fun e!333551 () Bool)

(assert (=> b!581364 (= e!333552 e!333551)))

(declare-fun res!369327 () Bool)

(assert (=> b!581364 (=> (not res!369327) (not e!333551))))

(declare-datatypes ((SeekEntryResult!5887 0))(
  ( (MissingZero!5887 (index!25775 (_ BitVec 32))) (Found!5887 (index!25776 (_ BitVec 32))) (Intermediate!5887 (undefined!6699 Bool) (index!25777 (_ BitVec 32)) (x!54647 (_ BitVec 32))) (Undefined!5887) (MissingVacant!5887 (index!25778 (_ BitVec 32))) )
))
(declare-fun lt!264714 () SeekEntryResult!5887)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581364 (= res!369327 (or (= lt!264714 (MissingZero!5887 i!1108)) (= lt!264714 (MissingVacant!5887 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36351 (_ BitVec 32)) SeekEntryResult!5887)

(assert (=> b!581364 (= lt!264714 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581365 () Bool)

(declare-fun res!369322 () Bool)

(assert (=> b!581365 (=> (not res!369322) (not e!333551))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581365 (= res!369322 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17450 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17450 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581366 () Bool)

(declare-fun res!369321 () Bool)

(assert (=> b!581366 (=> (not res!369321) (not e!333552))))

(assert (=> b!581366 (= res!369321 (and (= (size!17815 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17815 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17815 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581367 () Bool)

(assert (=> b!581367 (= e!333551 false)))

(declare-fun lt!264715 () SeekEntryResult!5887)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36351 (_ BitVec 32)) SeekEntryResult!5887)

(assert (=> b!581367 (= lt!264715 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17450 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!369324 () Bool)

(assert (=> start!53436 (=> (not res!369324) (not e!333552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53436 (= res!369324 (validMask!0 mask!3053))))

(assert (=> start!53436 e!333552))

(assert (=> start!53436 true))

(declare-fun array_inv!13333 (array!36351) Bool)

(assert (=> start!53436 (array_inv!13333 a!2986)))

(declare-fun b!581368 () Bool)

(declare-fun res!369329 () Bool)

(assert (=> b!581368 (=> (not res!369329) (not e!333551))))

(declare-datatypes ((List!11530 0))(
  ( (Nil!11527) (Cons!11526 (h!12571 (_ BitVec 64)) (t!17749 List!11530)) )
))
(declare-fun arrayNoDuplicates!0 (array!36351 (_ BitVec 32) List!11530) Bool)

(assert (=> b!581368 (= res!369329 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11527))))

(declare-fun b!581369 () Bool)

(declare-fun res!369326 () Bool)

(assert (=> b!581369 (=> (not res!369326) (not e!333551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36351 (_ BitVec 32)) Bool)

(assert (=> b!581369 (= res!369326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581370 () Bool)

(declare-fun res!369325 () Bool)

(assert (=> b!581370 (=> (not res!369325) (not e!333552))))

(assert (=> b!581370 (= res!369325 (validKeyInArray!0 k0!1786))))

(declare-fun b!581371 () Bool)

(declare-fun res!369328 () Bool)

(assert (=> b!581371 (=> (not res!369328) (not e!333552))))

(declare-fun arrayContainsKey!0 (array!36351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581371 (= res!369328 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53436 res!369324) b!581366))

(assert (= (and b!581366 res!369321) b!581363))

(assert (= (and b!581363 res!369323) b!581370))

(assert (= (and b!581370 res!369325) b!581371))

(assert (= (and b!581371 res!369328) b!581364))

(assert (= (and b!581364 res!369327) b!581369))

(assert (= (and b!581369 res!369326) b!581368))

(assert (= (and b!581368 res!369329) b!581365))

(assert (= (and b!581365 res!369322) b!581367))

(declare-fun m!559381 () Bool)

(assert (=> b!581368 m!559381))

(declare-fun m!559383 () Bool)

(assert (=> b!581363 m!559383))

(assert (=> b!581363 m!559383))

(declare-fun m!559385 () Bool)

(assert (=> b!581363 m!559385))

(declare-fun m!559387 () Bool)

(assert (=> b!581364 m!559387))

(declare-fun m!559389 () Bool)

(assert (=> b!581369 m!559389))

(assert (=> b!581367 m!559383))

(assert (=> b!581367 m!559383))

(declare-fun m!559391 () Bool)

(assert (=> b!581367 m!559391))

(declare-fun m!559393 () Bool)

(assert (=> b!581371 m!559393))

(declare-fun m!559395 () Bool)

(assert (=> b!581370 m!559395))

(declare-fun m!559397 () Bool)

(assert (=> b!581365 m!559397))

(declare-fun m!559399 () Bool)

(assert (=> b!581365 m!559399))

(declare-fun m!559401 () Bool)

(assert (=> b!581365 m!559401))

(declare-fun m!559403 () Bool)

(assert (=> start!53436 m!559403))

(declare-fun m!559405 () Bool)

(assert (=> start!53436 m!559405))

(check-sat (not b!581364) (not b!581369) (not b!581370) (not b!581363) (not b!581371) (not start!53436) (not b!581367) (not b!581368))
(check-sat)
