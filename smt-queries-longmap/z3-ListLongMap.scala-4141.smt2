; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56490 () Bool)

(assert start!56490)

(declare-fun res!403794 () Bool)

(declare-fun e!358695 () Bool)

(assert (=> start!56490 (=> (not res!403794) (not e!358695))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56490 (= res!403794 (validMask!0 mask!3053))))

(assert (=> start!56490 e!358695))

(assert (=> start!56490 true))

(declare-datatypes ((array!37815 0))(
  ( (array!37816 (arr!18148 (Array (_ BitVec 32) (_ BitVec 64))) (size!18512 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37815)

(declare-fun array_inv!14007 (array!37815) Bool)

(assert (=> start!56490 (array_inv!14007 a!2986)))

(declare-fun b!625889 () Bool)

(declare-fun e!358694 () Bool)

(assert (=> b!625889 (= e!358694 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6544 0))(
  ( (MissingZero!6544 (index!28460 (_ BitVec 32))) (Found!6544 (index!28461 (_ BitVec 32))) (Intermediate!6544 (undefined!7356 Bool) (index!28462 (_ BitVec 32)) (x!57361 (_ BitVec 32))) (Undefined!6544) (MissingVacant!6544 (index!28463 (_ BitVec 32))) )
))
(declare-fun lt!289980 () SeekEntryResult!6544)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37815 (_ BitVec 32)) SeekEntryResult!6544)

(assert (=> b!625889 (= lt!289980 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18148 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625890 () Bool)

(declare-fun res!403796 () Bool)

(assert (=> b!625890 (=> (not res!403796) (not e!358695))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625890 (= res!403796 (validKeyInArray!0 k0!1786))))

(declare-fun b!625891 () Bool)

(declare-fun res!403798 () Bool)

(assert (=> b!625891 (=> (not res!403798) (not e!358695))))

(declare-fun arrayContainsKey!0 (array!37815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625891 (= res!403798 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625892 () Bool)

(declare-fun res!403793 () Bool)

(assert (=> b!625892 (=> (not res!403793) (not e!358694))))

(declare-datatypes ((List!12096 0))(
  ( (Nil!12093) (Cons!12092 (h!13140 (_ BitVec 64)) (t!18316 List!12096)) )
))
(declare-fun arrayNoDuplicates!0 (array!37815 (_ BitVec 32) List!12096) Bool)

(assert (=> b!625892 (= res!403793 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12093))))

(declare-fun b!625893 () Bool)

(declare-fun res!403791 () Bool)

(assert (=> b!625893 (=> (not res!403791) (not e!358694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37815 (_ BitVec 32)) Bool)

(assert (=> b!625893 (= res!403791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625894 () Bool)

(declare-fun res!403797 () Bool)

(assert (=> b!625894 (=> (not res!403797) (not e!358695))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625894 (= res!403797 (and (= (size!18512 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18512 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18512 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625895 () Bool)

(declare-fun res!403795 () Bool)

(assert (=> b!625895 (=> (not res!403795) (not e!358695))))

(assert (=> b!625895 (= res!403795 (validKeyInArray!0 (select (arr!18148 a!2986) j!136)))))

(declare-fun b!625896 () Bool)

(assert (=> b!625896 (= e!358695 e!358694)))

(declare-fun res!403790 () Bool)

(assert (=> b!625896 (=> (not res!403790) (not e!358694))))

(declare-fun lt!289981 () SeekEntryResult!6544)

(assert (=> b!625896 (= res!403790 (or (= lt!289981 (MissingZero!6544 i!1108)) (= lt!289981 (MissingVacant!6544 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37815 (_ BitVec 32)) SeekEntryResult!6544)

(assert (=> b!625896 (= lt!289981 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625897 () Bool)

(declare-fun res!403792 () Bool)

(assert (=> b!625897 (=> (not res!403792) (not e!358694))))

(assert (=> b!625897 (= res!403792 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18148 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18148 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56490 res!403794) b!625894))

(assert (= (and b!625894 res!403797) b!625895))

(assert (= (and b!625895 res!403795) b!625890))

(assert (= (and b!625890 res!403796) b!625891))

(assert (= (and b!625891 res!403798) b!625896))

(assert (= (and b!625896 res!403790) b!625893))

(assert (= (and b!625893 res!403791) b!625892))

(assert (= (and b!625892 res!403793) b!625897))

(assert (= (and b!625897 res!403792) b!625889))

(declare-fun m!601723 () Bool)

(assert (=> b!625897 m!601723))

(declare-fun m!601725 () Bool)

(assert (=> b!625897 m!601725))

(declare-fun m!601727 () Bool)

(assert (=> b!625897 m!601727))

(declare-fun m!601729 () Bool)

(assert (=> b!625895 m!601729))

(assert (=> b!625895 m!601729))

(declare-fun m!601731 () Bool)

(assert (=> b!625895 m!601731))

(declare-fun m!601733 () Bool)

(assert (=> start!56490 m!601733))

(declare-fun m!601735 () Bool)

(assert (=> start!56490 m!601735))

(declare-fun m!601737 () Bool)

(assert (=> b!625891 m!601737))

(declare-fun m!601739 () Bool)

(assert (=> b!625893 m!601739))

(declare-fun m!601741 () Bool)

(assert (=> b!625892 m!601741))

(declare-fun m!601743 () Bool)

(assert (=> b!625896 m!601743))

(declare-fun m!601745 () Bool)

(assert (=> b!625890 m!601745))

(assert (=> b!625889 m!601729))

(assert (=> b!625889 m!601729))

(declare-fun m!601747 () Bool)

(assert (=> b!625889 m!601747))

(check-sat (not b!625890) (not b!625896) (not start!56490) (not b!625893) (not b!625892) (not b!625895) (not b!625889) (not b!625891))
(check-sat)
