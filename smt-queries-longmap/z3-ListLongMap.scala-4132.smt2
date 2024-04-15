; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56370 () Bool)

(assert start!56370)

(declare-fun b!624671 () Bool)

(declare-fun res!402823 () Bool)

(declare-fun e!358149 () Bool)

(assert (=> b!624671 (=> (not res!402823) (not e!358149))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624671 (= res!402823 (validKeyInArray!0 k0!1786))))

(declare-fun res!402824 () Bool)

(assert (=> start!56370 (=> (not res!402824) (not e!358149))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56370 (= res!402824 (validMask!0 mask!3053))))

(assert (=> start!56370 e!358149))

(assert (=> start!56370 true))

(declare-datatypes ((array!37764 0))(
  ( (array!37765 (arr!18125 (Array (_ BitVec 32) (_ BitVec 64))) (size!18490 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37764)

(declare-fun array_inv!14008 (array!37764) Bool)

(assert (=> start!56370 (array_inv!14008 a!2986)))

(declare-fun b!624672 () Bool)

(declare-fun e!358148 () Bool)

(assert (=> b!624672 (= e!358148 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6562 0))(
  ( (MissingZero!6562 (index!28532 (_ BitVec 32))) (Found!6562 (index!28533 (_ BitVec 32))) (Intermediate!6562 (undefined!7374 Bool) (index!28534 (_ BitVec 32)) (x!57299 (_ BitVec 32))) (Undefined!6562) (MissingVacant!6562 (index!28535 (_ BitVec 32))) )
))
(declare-fun lt!289492 () SeekEntryResult!6562)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37764 (_ BitVec 32)) SeekEntryResult!6562)

(assert (=> b!624672 (= lt!289492 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18125 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624673 () Bool)

(declare-fun res!402821 () Bool)

(assert (=> b!624673 (=> (not res!402821) (not e!358149))))

(assert (=> b!624673 (= res!402821 (validKeyInArray!0 (select (arr!18125 a!2986) j!136)))))

(declare-fun b!624674 () Bool)

(assert (=> b!624674 (= e!358149 e!358148)))

(declare-fun res!402827 () Bool)

(assert (=> b!624674 (=> (not res!402827) (not e!358148))))

(declare-fun lt!289491 () SeekEntryResult!6562)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624674 (= res!402827 (or (= lt!289491 (MissingZero!6562 i!1108)) (= lt!289491 (MissingVacant!6562 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37764 (_ BitVec 32)) SeekEntryResult!6562)

(assert (=> b!624674 (= lt!289491 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624675 () Bool)

(declare-fun res!402825 () Bool)

(assert (=> b!624675 (=> (not res!402825) (not e!358148))))

(declare-datatypes ((List!12205 0))(
  ( (Nil!12202) (Cons!12201 (h!13246 (_ BitVec 64)) (t!18424 List!12205)) )
))
(declare-fun arrayNoDuplicates!0 (array!37764 (_ BitVec 32) List!12205) Bool)

(assert (=> b!624675 (= res!402825 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12202))))

(declare-fun b!624676 () Bool)

(declare-fun res!402822 () Bool)

(assert (=> b!624676 (=> (not res!402822) (not e!358149))))

(assert (=> b!624676 (= res!402822 (and (= (size!18490 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18490 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18490 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624677 () Bool)

(declare-fun res!402820 () Bool)

(assert (=> b!624677 (=> (not res!402820) (not e!358149))))

(declare-fun arrayContainsKey!0 (array!37764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624677 (= res!402820 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624678 () Bool)

(declare-fun res!402826 () Bool)

(assert (=> b!624678 (=> (not res!402826) (not e!358148))))

(assert (=> b!624678 (= res!402826 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18125 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18125 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624679 () Bool)

(declare-fun res!402819 () Bool)

(assert (=> b!624679 (=> (not res!402819) (not e!358148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37764 (_ BitVec 32)) Bool)

(assert (=> b!624679 (= res!402819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56370 res!402824) b!624676))

(assert (= (and b!624676 res!402822) b!624673))

(assert (= (and b!624673 res!402821) b!624671))

(assert (= (and b!624671 res!402823) b!624677))

(assert (= (and b!624677 res!402820) b!624674))

(assert (= (and b!624674 res!402827) b!624679))

(assert (= (and b!624679 res!402819) b!624675))

(assert (= (and b!624675 res!402825) b!624678))

(assert (= (and b!624678 res!402826) b!624672))

(declare-fun m!599767 () Bool)

(assert (=> b!624674 m!599767))

(declare-fun m!599769 () Bool)

(assert (=> b!624673 m!599769))

(assert (=> b!624673 m!599769))

(declare-fun m!599771 () Bool)

(assert (=> b!624673 m!599771))

(declare-fun m!599773 () Bool)

(assert (=> b!624671 m!599773))

(assert (=> b!624672 m!599769))

(assert (=> b!624672 m!599769))

(declare-fun m!599775 () Bool)

(assert (=> b!624672 m!599775))

(declare-fun m!599777 () Bool)

(assert (=> start!56370 m!599777))

(declare-fun m!599779 () Bool)

(assert (=> start!56370 m!599779))

(declare-fun m!599781 () Bool)

(assert (=> b!624675 m!599781))

(declare-fun m!599783 () Bool)

(assert (=> b!624679 m!599783))

(declare-fun m!599785 () Bool)

(assert (=> b!624677 m!599785))

(declare-fun m!599787 () Bool)

(assert (=> b!624678 m!599787))

(declare-fun m!599789 () Bool)

(assert (=> b!624678 m!599789))

(declare-fun m!599791 () Bool)

(assert (=> b!624678 m!599791))

(check-sat (not b!624675) (not b!624677) (not start!56370) (not b!624679) (not b!624671) (not b!624672) (not b!624674) (not b!624673))
(check-sat)
