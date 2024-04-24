; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56622 () Bool)

(assert start!56622)

(declare-fun b!626834 () Bool)

(declare-fun res!404437 () Bool)

(declare-fun e!359143 () Bool)

(assert (=> b!626834 (=> (not res!404437) (not e!359143))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37857 0))(
  ( (array!37858 (arr!18166 (Array (_ BitVec 32) (_ BitVec 64))) (size!18530 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37857)

(assert (=> b!626834 (= res!404437 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18166 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18166 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626835 () Bool)

(declare-fun res!404432 () Bool)

(declare-fun e!359145 () Bool)

(assert (=> b!626835 (=> (not res!404432) (not e!359145))))

(declare-fun arrayContainsKey!0 (array!37857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626835 (= res!404432 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626836 () Bool)

(declare-fun res!404435 () Bool)

(assert (=> b!626836 (=> (not res!404435) (not e!359145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626836 (= res!404435 (validKeyInArray!0 k0!1786))))

(declare-fun b!626837 () Bool)

(assert (=> b!626837 (= e!359143 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6562 0))(
  ( (MissingZero!6562 (index!28532 (_ BitVec 32))) (Found!6562 (index!28533 (_ BitVec 32))) (Intermediate!6562 (undefined!7374 Bool) (index!28534 (_ BitVec 32)) (x!57433 (_ BitVec 32))) (Undefined!6562) (MissingVacant!6562 (index!28535 (_ BitVec 32))) )
))
(declare-fun lt!290221 () SeekEntryResult!6562)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37857 (_ BitVec 32)) SeekEntryResult!6562)

(assert (=> b!626837 (= lt!290221 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18166 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626838 () Bool)

(declare-fun res!404431 () Bool)

(assert (=> b!626838 (=> (not res!404431) (not e!359145))))

(assert (=> b!626838 (= res!404431 (validKeyInArray!0 (select (arr!18166 a!2986) j!136)))))

(declare-fun b!626839 () Bool)

(declare-fun res!404434 () Bool)

(assert (=> b!626839 (=> (not res!404434) (not e!359143))))

(declare-datatypes ((List!12114 0))(
  ( (Nil!12111) (Cons!12110 (h!13158 (_ BitVec 64)) (t!18334 List!12114)) )
))
(declare-fun arrayNoDuplicates!0 (array!37857 (_ BitVec 32) List!12114) Bool)

(assert (=> b!626839 (= res!404434 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12111))))

(declare-fun b!626840 () Bool)

(declare-fun res!404429 () Bool)

(assert (=> b!626840 (=> (not res!404429) (not e!359143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37857 (_ BitVec 32)) Bool)

(assert (=> b!626840 (= res!404429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!404433 () Bool)

(assert (=> start!56622 (=> (not res!404433) (not e!359145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56622 (= res!404433 (validMask!0 mask!3053))))

(assert (=> start!56622 e!359145))

(assert (=> start!56622 true))

(declare-fun array_inv!14025 (array!37857) Bool)

(assert (=> start!56622 (array_inv!14025 a!2986)))

(declare-fun b!626841 () Bool)

(assert (=> b!626841 (= e!359145 e!359143)))

(declare-fun res!404430 () Bool)

(assert (=> b!626841 (=> (not res!404430) (not e!359143))))

(declare-fun lt!290220 () SeekEntryResult!6562)

(assert (=> b!626841 (= res!404430 (or (= lt!290220 (MissingZero!6562 i!1108)) (= lt!290220 (MissingVacant!6562 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37857 (_ BitVec 32)) SeekEntryResult!6562)

(assert (=> b!626841 (= lt!290220 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626842 () Bool)

(declare-fun res!404436 () Bool)

(assert (=> b!626842 (=> (not res!404436) (not e!359145))))

(assert (=> b!626842 (= res!404436 (and (= (size!18530 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18530 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18530 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56622 res!404433) b!626842))

(assert (= (and b!626842 res!404436) b!626838))

(assert (= (and b!626838 res!404431) b!626836))

(assert (= (and b!626836 res!404435) b!626835))

(assert (= (and b!626835 res!404432) b!626841))

(assert (= (and b!626841 res!404430) b!626840))

(assert (= (and b!626840 res!404429) b!626839))

(assert (= (and b!626839 res!404434) b!626834))

(assert (= (and b!626834 res!404437) b!626837))

(declare-fun m!602485 () Bool)

(assert (=> b!626841 m!602485))

(declare-fun m!602487 () Bool)

(assert (=> b!626834 m!602487))

(declare-fun m!602489 () Bool)

(assert (=> b!626834 m!602489))

(declare-fun m!602491 () Bool)

(assert (=> b!626834 m!602491))

(declare-fun m!602493 () Bool)

(assert (=> b!626836 m!602493))

(declare-fun m!602495 () Bool)

(assert (=> b!626835 m!602495))

(declare-fun m!602497 () Bool)

(assert (=> b!626838 m!602497))

(assert (=> b!626838 m!602497))

(declare-fun m!602499 () Bool)

(assert (=> b!626838 m!602499))

(assert (=> b!626837 m!602497))

(assert (=> b!626837 m!602497))

(declare-fun m!602501 () Bool)

(assert (=> b!626837 m!602501))

(declare-fun m!602503 () Bool)

(assert (=> b!626839 m!602503))

(declare-fun m!602505 () Bool)

(assert (=> b!626840 m!602505))

(declare-fun m!602507 () Bool)

(assert (=> start!56622 m!602507))

(declare-fun m!602509 () Bool)

(assert (=> start!56622 m!602509))

(check-sat (not start!56622) (not b!626835) (not b!626839) (not b!626837) (not b!626836) (not b!626841) (not b!626838) (not b!626840))
(check-sat)
