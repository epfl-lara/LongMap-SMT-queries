; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53280 () Bool)

(assert start!53280)

(declare-fun b!578810 () Bool)

(declare-fun e!332854 () Bool)

(declare-fun e!332855 () Bool)

(assert (=> b!578810 (= e!332854 e!332855)))

(declare-fun res!366522 () Bool)

(assert (=> b!578810 (=> (not res!366522) (not e!332855))))

(declare-datatypes ((SeekEntryResult!5731 0))(
  ( (MissingZero!5731 (index!25151 (_ BitVec 32))) (Found!5731 (index!25152 (_ BitVec 32))) (Intermediate!5731 (undefined!6543 Bool) (index!25153 (_ BitVec 32)) (x!54203 (_ BitVec 32))) (Undefined!5731) (MissingVacant!5731 (index!25154 (_ BitVec 32))) )
))
(declare-fun lt!264421 () SeekEntryResult!5731)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578810 (= res!366522 (or (= lt!264421 (MissingZero!5731 i!1108)) (= lt!264421 (MissingVacant!5731 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36126 0))(
  ( (array!36127 (arr!17335 (Array (_ BitVec 32) (_ BitVec 64))) (size!17699 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36126)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36126 (_ BitVec 32)) SeekEntryResult!5731)

(assert (=> b!578810 (= lt!264421 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578812 () Bool)

(declare-fun res!366529 () Bool)

(assert (=> b!578812 (=> (not res!366529) (not e!332855))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578812 (= res!366529 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17335 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17335 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578813 () Bool)

(declare-fun res!366528 () Bool)

(assert (=> b!578813 (=> (not res!366528) (not e!332854))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578813 (= res!366528 (and (= (size!17699 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17699 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17699 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578814 () Bool)

(declare-fun res!366524 () Bool)

(assert (=> b!578814 (=> (not res!366524) (not e!332855))))

(declare-datatypes ((List!11283 0))(
  ( (Nil!11280) (Cons!11279 (h!12327 (_ BitVec 64)) (t!17503 List!11283)) )
))
(declare-fun arrayNoDuplicates!0 (array!36126 (_ BitVec 32) List!11283) Bool)

(assert (=> b!578814 (= res!366524 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11280))))

(declare-fun b!578815 () Bool)

(declare-fun res!366526 () Bool)

(assert (=> b!578815 (=> (not res!366526) (not e!332854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578815 (= res!366526 (validKeyInArray!0 (select (arr!17335 a!2986) j!136)))))

(declare-fun b!578816 () Bool)

(declare-fun res!366521 () Bool)

(assert (=> b!578816 (=> (not res!366521) (not e!332855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36126 (_ BitVec 32)) Bool)

(assert (=> b!578816 (= res!366521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578817 () Bool)

(declare-fun res!366523 () Bool)

(assert (=> b!578817 (=> (not res!366523) (not e!332854))))

(assert (=> b!578817 (= res!366523 (validKeyInArray!0 k0!1786))))

(declare-fun b!578818 () Bool)

(declare-fun res!366527 () Bool)

(assert (=> b!578818 (=> (not res!366527) (not e!332854))))

(declare-fun arrayContainsKey!0 (array!36126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578818 (= res!366527 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578811 () Bool)

(assert (=> b!578811 (= e!332855 false)))

(declare-fun lt!264420 () SeekEntryResult!5731)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36126 (_ BitVec 32)) SeekEntryResult!5731)

(assert (=> b!578811 (= lt!264420 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17335 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!366525 () Bool)

(assert (=> start!53280 (=> (not res!366525) (not e!332854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53280 (= res!366525 (validMask!0 mask!3053))))

(assert (=> start!53280 e!332854))

(assert (=> start!53280 true))

(declare-fun array_inv!13194 (array!36126) Bool)

(assert (=> start!53280 (array_inv!13194 a!2986)))

(assert (= (and start!53280 res!366525) b!578813))

(assert (= (and b!578813 res!366528) b!578815))

(assert (= (and b!578815 res!366526) b!578817))

(assert (= (and b!578817 res!366523) b!578818))

(assert (= (and b!578818 res!366527) b!578810))

(assert (= (and b!578810 res!366522) b!578816))

(assert (= (and b!578816 res!366521) b!578814))

(assert (= (and b!578814 res!366524) b!578812))

(assert (= (and b!578812 res!366529) b!578811))

(declare-fun m!557621 () Bool)

(assert (=> b!578815 m!557621))

(assert (=> b!578815 m!557621))

(declare-fun m!557623 () Bool)

(assert (=> b!578815 m!557623))

(declare-fun m!557625 () Bool)

(assert (=> b!578817 m!557625))

(assert (=> b!578811 m!557621))

(assert (=> b!578811 m!557621))

(declare-fun m!557627 () Bool)

(assert (=> b!578811 m!557627))

(declare-fun m!557629 () Bool)

(assert (=> b!578816 m!557629))

(declare-fun m!557631 () Bool)

(assert (=> start!53280 m!557631))

(declare-fun m!557633 () Bool)

(assert (=> start!53280 m!557633))

(declare-fun m!557635 () Bool)

(assert (=> b!578814 m!557635))

(declare-fun m!557637 () Bool)

(assert (=> b!578818 m!557637))

(declare-fun m!557639 () Bool)

(assert (=> b!578810 m!557639))

(declare-fun m!557641 () Bool)

(assert (=> b!578812 m!557641))

(declare-fun m!557643 () Bool)

(assert (=> b!578812 m!557643))

(declare-fun m!557645 () Bool)

(assert (=> b!578812 m!557645))

(check-sat (not b!578811) (not b!578815) (not b!578817) (not b!578818) (not b!578816) (not b!578810) (not start!53280) (not b!578814))
(check-sat)
