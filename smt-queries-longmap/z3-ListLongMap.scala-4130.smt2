; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56376 () Bool)

(assert start!56376)

(declare-fun res!402826 () Bool)

(declare-fun e!358263 () Bool)

(assert (=> start!56376 (=> (not res!402826) (not e!358263))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56376 (= res!402826 (validMask!0 mask!3053))))

(assert (=> start!56376 e!358263))

(assert (=> start!56376 true))

(declare-datatypes ((array!37746 0))(
  ( (array!37747 (arr!18115 (Array (_ BitVec 32) (_ BitVec 64))) (size!18479 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37746)

(declare-fun array_inv!13974 (array!37746) Bool)

(assert (=> start!56376 (array_inv!13974 a!2986)))

(declare-fun b!624773 () Bool)

(declare-fun res!402821 () Bool)

(assert (=> b!624773 (=> (not res!402821) (not e!358263))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624773 (= res!402821 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624774 () Bool)

(declare-fun res!402818 () Bool)

(assert (=> b!624774 (=> (not res!402818) (not e!358263))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624774 (= res!402818 (and (= (size!18479 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18479 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18479 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624775 () Bool)

(declare-fun e!358261 () Bool)

(assert (=> b!624775 (= e!358263 e!358261)))

(declare-fun res!402825 () Bool)

(assert (=> b!624775 (=> (not res!402825) (not e!358261))))

(declare-datatypes ((SeekEntryResult!6511 0))(
  ( (MissingZero!6511 (index!28328 (_ BitVec 32))) (Found!6511 (index!28329 (_ BitVec 32))) (Intermediate!6511 (undefined!7323 Bool) (index!28330 (_ BitVec 32)) (x!57237 (_ BitVec 32))) (Undefined!6511) (MissingVacant!6511 (index!28331 (_ BitVec 32))) )
))
(declare-fun lt!289729 () SeekEntryResult!6511)

(assert (=> b!624775 (= res!402825 (or (= lt!289729 (MissingZero!6511 i!1108)) (= lt!289729 (MissingVacant!6511 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37746 (_ BitVec 32)) SeekEntryResult!6511)

(assert (=> b!624775 (= lt!289729 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624776 () Bool)

(declare-fun res!402820 () Bool)

(assert (=> b!624776 (=> (not res!402820) (not e!358263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624776 (= res!402820 (validKeyInArray!0 k0!1786))))

(declare-fun b!624777 () Bool)

(declare-fun res!402819 () Bool)

(assert (=> b!624777 (=> (not res!402819) (not e!358261))))

(declare-datatypes ((List!12063 0))(
  ( (Nil!12060) (Cons!12059 (h!13107 (_ BitVec 64)) (t!18283 List!12063)) )
))
(declare-fun arrayNoDuplicates!0 (array!37746 (_ BitVec 32) List!12063) Bool)

(assert (=> b!624777 (= res!402819 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12060))))

(declare-fun b!624778 () Bool)

(declare-fun res!402823 () Bool)

(assert (=> b!624778 (=> (not res!402823) (not e!358263))))

(assert (=> b!624778 (= res!402823 (validKeyInArray!0 (select (arr!18115 a!2986) j!136)))))

(declare-fun b!624779 () Bool)

(assert (=> b!624779 (= e!358261 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!289728 () SeekEntryResult!6511)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37746 (_ BitVec 32)) SeekEntryResult!6511)

(assert (=> b!624779 (= lt!289728 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18115 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624780 () Bool)

(declare-fun res!402824 () Bool)

(assert (=> b!624780 (=> (not res!402824) (not e!358261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37746 (_ BitVec 32)) Bool)

(assert (=> b!624780 (= res!402824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624781 () Bool)

(declare-fun res!402822 () Bool)

(assert (=> b!624781 (=> (not res!402822) (not e!358261))))

(assert (=> b!624781 (= res!402822 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18115 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18115 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56376 res!402826) b!624774))

(assert (= (and b!624774 res!402818) b!624778))

(assert (= (and b!624778 res!402823) b!624776))

(assert (= (and b!624776 res!402820) b!624773))

(assert (= (and b!624773 res!402821) b!624775))

(assert (= (and b!624775 res!402825) b!624780))

(assert (= (and b!624780 res!402824) b!624777))

(assert (= (and b!624777 res!402819) b!624781))

(assert (= (and b!624781 res!402822) b!624779))

(declare-fun m!600739 () Bool)

(assert (=> start!56376 m!600739))

(declare-fun m!600741 () Bool)

(assert (=> start!56376 m!600741))

(declare-fun m!600743 () Bool)

(assert (=> b!624779 m!600743))

(assert (=> b!624779 m!600743))

(declare-fun m!600745 () Bool)

(assert (=> b!624779 m!600745))

(declare-fun m!600747 () Bool)

(assert (=> b!624775 m!600747))

(assert (=> b!624778 m!600743))

(assert (=> b!624778 m!600743))

(declare-fun m!600749 () Bool)

(assert (=> b!624778 m!600749))

(declare-fun m!600751 () Bool)

(assert (=> b!624773 m!600751))

(declare-fun m!600753 () Bool)

(assert (=> b!624776 m!600753))

(declare-fun m!600755 () Bool)

(assert (=> b!624781 m!600755))

(declare-fun m!600757 () Bool)

(assert (=> b!624781 m!600757))

(declare-fun m!600759 () Bool)

(assert (=> b!624781 m!600759))

(declare-fun m!600761 () Bool)

(assert (=> b!624777 m!600761))

(declare-fun m!600763 () Bool)

(assert (=> b!624780 m!600763))

(check-sat (not b!624780) (not b!624778) (not start!56376) (not b!624776) (not b!624773) (not b!624775) (not b!624779) (not b!624777))
(check-sat)
