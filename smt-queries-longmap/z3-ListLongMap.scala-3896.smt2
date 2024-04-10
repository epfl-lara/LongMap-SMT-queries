; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53388 () Bool)

(assert start!53388)

(declare-fun b!580761 () Bool)

(declare-fun res!368577 () Bool)

(declare-fun e!333437 () Bool)

(assert (=> b!580761 (=> (not res!368577) (not e!333437))))

(declare-datatypes ((array!36289 0))(
  ( (array!36290 (arr!17419 (Array (_ BitVec 32) (_ BitVec 64))) (size!17783 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36289)

(declare-datatypes ((List!11460 0))(
  ( (Nil!11457) (Cons!11456 (h!12501 (_ BitVec 64)) (t!17688 List!11460)) )
))
(declare-fun arrayNoDuplicates!0 (array!36289 (_ BitVec 32) List!11460) Bool)

(assert (=> b!580761 (= res!368577 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11457))))

(declare-fun b!580762 () Bool)

(declare-fun e!333438 () Bool)

(assert (=> b!580762 (= e!333438 e!333437)))

(declare-fun res!368580 () Bool)

(assert (=> b!580762 (=> (not res!368580) (not e!333437))))

(declare-datatypes ((SeekEntryResult!5859 0))(
  ( (MissingZero!5859 (index!25663 (_ BitVec 32))) (Found!5859 (index!25664 (_ BitVec 32))) (Intermediate!5859 (undefined!6671 Bool) (index!25665 (_ BitVec 32)) (x!54536 (_ BitVec 32))) (Undefined!5859) (MissingVacant!5859 (index!25666 (_ BitVec 32))) )
))
(declare-fun lt!264765 () SeekEntryResult!5859)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580762 (= res!368580 (or (= lt!264765 (MissingZero!5859 i!1108)) (= lt!264765 (MissingVacant!5859 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36289 (_ BitVec 32)) SeekEntryResult!5859)

(assert (=> b!580762 (= lt!264765 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580763 () Bool)

(declare-fun res!368584 () Bool)

(assert (=> b!580763 (=> (not res!368584) (not e!333438))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580763 (= res!368584 (and (= (size!17783 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17783 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17783 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580764 () Bool)

(declare-fun res!368582 () Bool)

(assert (=> b!580764 (=> (not res!368582) (not e!333437))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580764 (= res!368582 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17419 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17419 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!368578 () Bool)

(assert (=> start!53388 (=> (not res!368578) (not e!333438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53388 (= res!368578 (validMask!0 mask!3053))))

(assert (=> start!53388 e!333438))

(assert (=> start!53388 true))

(declare-fun array_inv!13215 (array!36289) Bool)

(assert (=> start!53388 (array_inv!13215 a!2986)))

(declare-fun b!580765 () Bool)

(declare-fun res!368585 () Bool)

(assert (=> b!580765 (=> (not res!368585) (not e!333438))))

(declare-fun arrayContainsKey!0 (array!36289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580765 (= res!368585 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580766 () Bool)

(assert (=> b!580766 (= e!333437 false)))

(declare-fun lt!264766 () SeekEntryResult!5859)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36289 (_ BitVec 32)) SeekEntryResult!5859)

(assert (=> b!580766 (= lt!264766 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17419 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580767 () Bool)

(declare-fun res!368583 () Bool)

(assert (=> b!580767 (=> (not res!368583) (not e!333437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36289 (_ BitVec 32)) Bool)

(assert (=> b!580767 (= res!368583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580768 () Bool)

(declare-fun res!368581 () Bool)

(assert (=> b!580768 (=> (not res!368581) (not e!333438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580768 (= res!368581 (validKeyInArray!0 (select (arr!17419 a!2986) j!136)))))

(declare-fun b!580769 () Bool)

(declare-fun res!368579 () Bool)

(assert (=> b!580769 (=> (not res!368579) (not e!333438))))

(assert (=> b!580769 (= res!368579 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53388 res!368578) b!580763))

(assert (= (and b!580763 res!368584) b!580768))

(assert (= (and b!580768 res!368581) b!580769))

(assert (= (and b!580769 res!368579) b!580765))

(assert (= (and b!580765 res!368585) b!580762))

(assert (= (and b!580762 res!368580) b!580767))

(assert (= (and b!580767 res!368583) b!580761))

(assert (= (and b!580761 res!368577) b!580764))

(assert (= (and b!580764 res!368582) b!580766))

(declare-fun m!559329 () Bool)

(assert (=> b!580764 m!559329))

(declare-fun m!559331 () Bool)

(assert (=> b!580764 m!559331))

(declare-fun m!559333 () Bool)

(assert (=> b!580764 m!559333))

(declare-fun m!559335 () Bool)

(assert (=> b!580768 m!559335))

(assert (=> b!580768 m!559335))

(declare-fun m!559337 () Bool)

(assert (=> b!580768 m!559337))

(declare-fun m!559339 () Bool)

(assert (=> b!580767 m!559339))

(declare-fun m!559341 () Bool)

(assert (=> b!580761 m!559341))

(assert (=> b!580766 m!559335))

(assert (=> b!580766 m!559335))

(declare-fun m!559343 () Bool)

(assert (=> b!580766 m!559343))

(declare-fun m!559345 () Bool)

(assert (=> b!580765 m!559345))

(declare-fun m!559347 () Bool)

(assert (=> b!580762 m!559347))

(declare-fun m!559349 () Bool)

(assert (=> b!580769 m!559349))

(declare-fun m!559351 () Bool)

(assert (=> start!53388 m!559351))

(declare-fun m!559353 () Bool)

(assert (=> start!53388 m!559353))

(check-sat (not b!580766) (not b!580768) (not b!580767) (not b!580761) (not b!580762) (not b!580769) (not b!580765) (not start!53388))
(check-sat)
