; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53252 () Bool)

(assert start!53252)

(declare-fun b!578916 () Bool)

(declare-fun res!366739 () Bool)

(declare-fun e!332826 () Bool)

(assert (=> b!578916 (=> (not res!366739) (not e!332826))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36153 0))(
  ( (array!36154 (arr!17351 (Array (_ BitVec 32) (_ BitVec 64))) (size!17715 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36153)

(assert (=> b!578916 (= res!366739 (and (= (size!17715 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17715 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17715 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578917 () Bool)

(declare-fun res!366736 () Bool)

(assert (=> b!578917 (=> (not res!366736) (not e!332826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578917 (= res!366736 (validKeyInArray!0 (select (arr!17351 a!2986) j!136)))))

(declare-fun b!578918 () Bool)

(declare-fun res!366735 () Bool)

(declare-fun e!332824 () Bool)

(assert (=> b!578918 (=> (not res!366735) (not e!332824))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578918 (= res!366735 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17351 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17351 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578919 () Bool)

(assert (=> b!578919 (= e!332826 e!332824)))

(declare-fun res!366732 () Bool)

(assert (=> b!578919 (=> (not res!366732) (not e!332824))))

(declare-datatypes ((SeekEntryResult!5791 0))(
  ( (MissingZero!5791 (index!25391 (_ BitVec 32))) (Found!5791 (index!25392 (_ BitVec 32))) (Intermediate!5791 (undefined!6603 Bool) (index!25393 (_ BitVec 32)) (x!54284 (_ BitVec 32))) (Undefined!5791) (MissingVacant!5791 (index!25394 (_ BitVec 32))) )
))
(declare-fun lt!264367 () SeekEntryResult!5791)

(assert (=> b!578919 (= res!366732 (or (= lt!264367 (MissingZero!5791 i!1108)) (= lt!264367 (MissingVacant!5791 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36153 (_ BitVec 32)) SeekEntryResult!5791)

(assert (=> b!578919 (= lt!264367 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!366737 () Bool)

(assert (=> start!53252 (=> (not res!366737) (not e!332826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53252 (= res!366737 (validMask!0 mask!3053))))

(assert (=> start!53252 e!332826))

(assert (=> start!53252 true))

(declare-fun array_inv!13147 (array!36153) Bool)

(assert (=> start!53252 (array_inv!13147 a!2986)))

(declare-fun b!578920 () Bool)

(declare-fun res!366740 () Bool)

(assert (=> b!578920 (=> (not res!366740) (not e!332824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36153 (_ BitVec 32)) Bool)

(assert (=> b!578920 (= res!366740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578921 () Bool)

(declare-fun res!366733 () Bool)

(assert (=> b!578921 (=> (not res!366733) (not e!332826))))

(declare-fun arrayContainsKey!0 (array!36153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578921 (= res!366733 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578922 () Bool)

(declare-fun res!366738 () Bool)

(assert (=> b!578922 (=> (not res!366738) (not e!332826))))

(assert (=> b!578922 (= res!366738 (validKeyInArray!0 k!1786))))

(declare-fun b!578923 () Bool)

(declare-fun res!366734 () Bool)

(assert (=> b!578923 (=> (not res!366734) (not e!332824))))

(declare-datatypes ((List!11392 0))(
  ( (Nil!11389) (Cons!11388 (h!12433 (_ BitVec 64)) (t!17620 List!11392)) )
))
(declare-fun arrayNoDuplicates!0 (array!36153 (_ BitVec 32) List!11392) Bool)

(assert (=> b!578923 (= res!366734 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11389))))

(declare-fun b!578924 () Bool)

(assert (=> b!578924 (= e!332824 false)))

(declare-fun lt!264366 () SeekEntryResult!5791)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36153 (_ BitVec 32)) SeekEntryResult!5791)

(assert (=> b!578924 (= lt!264366 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17351 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53252 res!366737) b!578916))

(assert (= (and b!578916 res!366739) b!578917))

(assert (= (and b!578917 res!366736) b!578922))

(assert (= (and b!578922 res!366738) b!578921))

(assert (= (and b!578921 res!366733) b!578919))

(assert (= (and b!578919 res!366732) b!578920))

(assert (= (and b!578920 res!366740) b!578923))

(assert (= (and b!578923 res!366734) b!578918))

(assert (= (and b!578918 res!366735) b!578924))

(declare-fun m!557555 () Bool)

(assert (=> b!578919 m!557555))

(declare-fun m!557557 () Bool)

(assert (=> start!53252 m!557557))

(declare-fun m!557559 () Bool)

(assert (=> start!53252 m!557559))

(declare-fun m!557561 () Bool)

(assert (=> b!578918 m!557561))

(declare-fun m!557563 () Bool)

(assert (=> b!578918 m!557563))

(declare-fun m!557565 () Bool)

(assert (=> b!578918 m!557565))

(declare-fun m!557567 () Bool)

(assert (=> b!578923 m!557567))

(declare-fun m!557569 () Bool)

(assert (=> b!578922 m!557569))

(declare-fun m!557571 () Bool)

(assert (=> b!578921 m!557571))

(declare-fun m!557573 () Bool)

(assert (=> b!578924 m!557573))

(assert (=> b!578924 m!557573))

(declare-fun m!557575 () Bool)

(assert (=> b!578924 m!557575))

(declare-fun m!557577 () Bool)

(assert (=> b!578920 m!557577))

(assert (=> b!578917 m!557573))

(assert (=> b!578917 m!557573))

(declare-fun m!557579 () Bool)

(assert (=> b!578917 m!557579))

(push 1)

(assert (not b!578920))

(assert (not b!578924))

(assert (not b!578919))

(assert (not b!578917))

(assert (not b!578922))

(assert (not b!578923))

(assert (not b!578921))

(assert (not start!53252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

