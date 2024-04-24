; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53412 () Bool)

(assert start!53412)

(declare-fun b!580601 () Bool)

(declare-fun res!368320 () Bool)

(declare-fun e!333449 () Bool)

(assert (=> b!580601 (=> (not res!368320) (not e!333449))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36258 0))(
  ( (array!36259 (arr!17401 (Array (_ BitVec 32) (_ BitVec 64))) (size!17765 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36258)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580601 (= res!368320 (and (= (size!17765 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17765 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17765 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!368319 () Bool)

(assert (=> start!53412 (=> (not res!368319) (not e!333449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53412 (= res!368319 (validMask!0 mask!3053))))

(assert (=> start!53412 e!333449))

(assert (=> start!53412 true))

(declare-fun array_inv!13260 (array!36258) Bool)

(assert (=> start!53412 (array_inv!13260 a!2986)))

(declare-fun b!580602 () Bool)

(declare-fun res!368316 () Bool)

(declare-fun e!333448 () Bool)

(assert (=> b!580602 (=> (not res!368316) (not e!333448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36258 (_ BitVec 32)) Bool)

(assert (=> b!580602 (= res!368316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580603 () Bool)

(declare-fun res!368315 () Bool)

(assert (=> b!580603 (=> (not res!368315) (not e!333449))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580603 (= res!368315 (validKeyInArray!0 k0!1786))))

(declare-fun b!580604 () Bool)

(declare-fun res!368312 () Bool)

(assert (=> b!580604 (=> (not res!368312) (not e!333449))))

(declare-fun arrayContainsKey!0 (array!36258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580604 (= res!368312 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580605 () Bool)

(declare-fun res!368313 () Bool)

(assert (=> b!580605 (=> (not res!368313) (not e!333448))))

(declare-datatypes ((List!11349 0))(
  ( (Nil!11346) (Cons!11345 (h!12393 (_ BitVec 64)) (t!17569 List!11349)) )
))
(declare-fun arrayNoDuplicates!0 (array!36258 (_ BitVec 32) List!11349) Bool)

(assert (=> b!580605 (= res!368313 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11346))))

(declare-fun b!580606 () Bool)

(assert (=> b!580606 (= e!333448 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5797 0))(
  ( (MissingZero!5797 (index!25415 (_ BitVec 32))) (Found!5797 (index!25416 (_ BitVec 32))) (Intermediate!5797 (undefined!6609 Bool) (index!25417 (_ BitVec 32)) (x!54445 (_ BitVec 32))) (Undefined!5797) (MissingVacant!5797 (index!25418 (_ BitVec 32))) )
))
(declare-fun lt!264807 () SeekEntryResult!5797)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36258 (_ BitVec 32)) SeekEntryResult!5797)

(assert (=> b!580606 (= lt!264807 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17401 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580607 () Bool)

(declare-fun res!368314 () Bool)

(assert (=> b!580607 (=> (not res!368314) (not e!333449))))

(assert (=> b!580607 (= res!368314 (validKeyInArray!0 (select (arr!17401 a!2986) j!136)))))

(declare-fun b!580608 () Bool)

(declare-fun res!368317 () Bool)

(assert (=> b!580608 (=> (not res!368317) (not e!333448))))

(assert (=> b!580608 (= res!368317 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17401 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17401 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580609 () Bool)

(assert (=> b!580609 (= e!333449 e!333448)))

(declare-fun res!368318 () Bool)

(assert (=> b!580609 (=> (not res!368318) (not e!333448))))

(declare-fun lt!264808 () SeekEntryResult!5797)

(assert (=> b!580609 (= res!368318 (or (= lt!264808 (MissingZero!5797 i!1108)) (= lt!264808 (MissingVacant!5797 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36258 (_ BitVec 32)) SeekEntryResult!5797)

(assert (=> b!580609 (= lt!264808 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53412 res!368319) b!580601))

(assert (= (and b!580601 res!368320) b!580607))

(assert (= (and b!580607 res!368314) b!580603))

(assert (= (and b!580603 res!368315) b!580604))

(assert (= (and b!580604 res!368312) b!580609))

(assert (= (and b!580609 res!368318) b!580602))

(assert (= (and b!580602 res!368316) b!580605))

(assert (= (and b!580605 res!368313) b!580608))

(assert (= (and b!580608 res!368317) b!580606))

(declare-fun m!559337 () Bool)

(assert (=> b!580604 m!559337))

(declare-fun m!559339 () Bool)

(assert (=> b!580608 m!559339))

(declare-fun m!559341 () Bool)

(assert (=> b!580608 m!559341))

(declare-fun m!559343 () Bool)

(assert (=> b!580608 m!559343))

(declare-fun m!559345 () Bool)

(assert (=> b!580603 m!559345))

(declare-fun m!559347 () Bool)

(assert (=> start!53412 m!559347))

(declare-fun m!559349 () Bool)

(assert (=> start!53412 m!559349))

(declare-fun m!559351 () Bool)

(assert (=> b!580606 m!559351))

(assert (=> b!580606 m!559351))

(declare-fun m!559353 () Bool)

(assert (=> b!580606 m!559353))

(assert (=> b!580607 m!559351))

(assert (=> b!580607 m!559351))

(declare-fun m!559355 () Bool)

(assert (=> b!580607 m!559355))

(declare-fun m!559357 () Bool)

(assert (=> b!580609 m!559357))

(declare-fun m!559359 () Bool)

(assert (=> b!580602 m!559359))

(declare-fun m!559361 () Bool)

(assert (=> b!580605 m!559361))

(check-sat (not b!580606) (not b!580603) (not b!580607) (not b!580602) (not start!53412) (not b!580609) (not b!580604) (not b!580605))
(check-sat)
