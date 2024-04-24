; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56874 () Bool)

(assert start!56874)

(declare-fun b!629601 () Bool)

(declare-fun res!406890 () Bool)

(declare-fun e!360108 () Bool)

(assert (=> b!629601 (=> (not res!406890) (not e!360108))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38007 0))(
  ( (array!38008 (arr!18238 (Array (_ BitVec 32) (_ BitVec 64))) (size!18602 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38007)

(assert (=> b!629601 (= res!406890 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18238 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18238 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629602 () Bool)

(declare-fun e!360106 () Bool)

(assert (=> b!629602 (= e!360106 e!360108)))

(declare-fun res!406895 () Bool)

(assert (=> b!629602 (=> (not res!406895) (not e!360108))))

(declare-datatypes ((SeekEntryResult!6634 0))(
  ( (MissingZero!6634 (index!28820 (_ BitVec 32))) (Found!6634 (index!28821 (_ BitVec 32))) (Intermediate!6634 (undefined!7446 Bool) (index!28822 (_ BitVec 32)) (x!57709 (_ BitVec 32))) (Undefined!6634) (MissingVacant!6634 (index!28823 (_ BitVec 32))) )
))
(declare-fun lt!290842 () SeekEntryResult!6634)

(assert (=> b!629602 (= res!406895 (or (= lt!290842 (MissingZero!6634 i!1108)) (= lt!290842 (MissingVacant!6634 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38007 (_ BitVec 32)) SeekEntryResult!6634)

(assert (=> b!629602 (= lt!290842 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!406896 () Bool)

(assert (=> start!56874 (=> (not res!406896) (not e!360106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56874 (= res!406896 (validMask!0 mask!3053))))

(assert (=> start!56874 e!360106))

(assert (=> start!56874 true))

(declare-fun array_inv!14097 (array!38007) Bool)

(assert (=> start!56874 (array_inv!14097 a!2986)))

(declare-fun b!629603 () Bool)

(declare-fun res!406899 () Bool)

(assert (=> b!629603 (=> (not res!406899) (not e!360106))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!629603 (= res!406899 (and (= (size!18602 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18602 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18602 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629604 () Bool)

(declare-fun res!406892 () Bool)

(assert (=> b!629604 (=> (not res!406892) (not e!360108))))

(declare-datatypes ((List!12186 0))(
  ( (Nil!12183) (Cons!12182 (h!13230 (_ BitVec 64)) (t!18406 List!12186)) )
))
(declare-fun arrayNoDuplicates!0 (array!38007 (_ BitVec 32) List!12186) Bool)

(assert (=> b!629604 (= res!406892 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12183))))

(declare-fun b!629605 () Bool)

(declare-fun res!406891 () Bool)

(assert (=> b!629605 (=> (not res!406891) (not e!360106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629605 (= res!406891 (validKeyInArray!0 k0!1786))))

(declare-fun b!629606 () Bool)

(declare-fun res!406898 () Bool)

(assert (=> b!629606 (=> (not res!406898) (not e!360108))))

(assert (=> b!629606 (= res!406898 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18238 a!2986) index!984) (select (arr!18238 a!2986) j!136))) (not (= (select (arr!18238 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629607 () Bool)

(declare-fun res!406893 () Bool)

(assert (=> b!629607 (=> (not res!406893) (not e!360108))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38007 (_ BitVec 32)) SeekEntryResult!6634)

(assert (=> b!629607 (= res!406893 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18238 a!2986) j!136) a!2986 mask!3053) (Found!6634 j!136)))))

(declare-fun b!629608 () Bool)

(declare-fun res!406897 () Bool)

(assert (=> b!629608 (=> (not res!406897) (not e!360106))))

(assert (=> b!629608 (= res!406897 (validKeyInArray!0 (select (arr!18238 a!2986) j!136)))))

(declare-fun b!629609 () Bool)

(assert (=> b!629609 (= e!360108 (not true))))

(declare-fun lt!290840 () (_ BitVec 32))

(assert (=> b!629609 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290840 vacantSpotIndex!68 (select (arr!18238 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290840 vacantSpotIndex!68 (select (store (arr!18238 a!2986) i!1108 k0!1786) j!136) (array!38008 (store (arr!18238 a!2986) i!1108 k0!1786) (size!18602 a!2986)) mask!3053))))

(declare-datatypes ((Unit!21087 0))(
  ( (Unit!21088) )
))
(declare-fun lt!290841 () Unit!21087)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38007 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21087)

(assert (=> b!629609 (= lt!290841 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290840 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629609 (= lt!290840 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!629610 () Bool)

(declare-fun res!406894 () Bool)

(assert (=> b!629610 (=> (not res!406894) (not e!360106))))

(declare-fun arrayContainsKey!0 (array!38007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629610 (= res!406894 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629611 () Bool)

(declare-fun res!406900 () Bool)

(assert (=> b!629611 (=> (not res!406900) (not e!360108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38007 (_ BitVec 32)) Bool)

(assert (=> b!629611 (= res!406900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56874 res!406896) b!629603))

(assert (= (and b!629603 res!406899) b!629608))

(assert (= (and b!629608 res!406897) b!629605))

(assert (= (and b!629605 res!406891) b!629610))

(assert (= (and b!629610 res!406894) b!629602))

(assert (= (and b!629602 res!406895) b!629611))

(assert (= (and b!629611 res!406900) b!629604))

(assert (= (and b!629604 res!406892) b!629601))

(assert (= (and b!629601 res!406890) b!629607))

(assert (= (and b!629607 res!406893) b!629606))

(assert (= (and b!629606 res!406898) b!629609))

(declare-fun m!604891 () Bool)

(assert (=> b!629609 m!604891))

(declare-fun m!604893 () Bool)

(assert (=> b!629609 m!604893))

(declare-fun m!604895 () Bool)

(assert (=> b!629609 m!604895))

(assert (=> b!629609 m!604893))

(declare-fun m!604897 () Bool)

(assert (=> b!629609 m!604897))

(declare-fun m!604899 () Bool)

(assert (=> b!629609 m!604899))

(assert (=> b!629609 m!604895))

(declare-fun m!604901 () Bool)

(assert (=> b!629609 m!604901))

(declare-fun m!604903 () Bool)

(assert (=> b!629609 m!604903))

(declare-fun m!604905 () Bool)

(assert (=> b!629610 m!604905))

(declare-fun m!604907 () Bool)

(assert (=> b!629606 m!604907))

(assert (=> b!629606 m!604895))

(declare-fun m!604909 () Bool)

(assert (=> b!629605 m!604909))

(declare-fun m!604911 () Bool)

(assert (=> start!56874 m!604911))

(declare-fun m!604913 () Bool)

(assert (=> start!56874 m!604913))

(declare-fun m!604915 () Bool)

(assert (=> b!629604 m!604915))

(assert (=> b!629607 m!604895))

(assert (=> b!629607 m!604895))

(declare-fun m!604917 () Bool)

(assert (=> b!629607 m!604917))

(assert (=> b!629608 m!604895))

(assert (=> b!629608 m!604895))

(declare-fun m!604919 () Bool)

(assert (=> b!629608 m!604919))

(declare-fun m!604921 () Bool)

(assert (=> b!629602 m!604921))

(declare-fun m!604923 () Bool)

(assert (=> b!629601 m!604923))

(assert (=> b!629601 m!604899))

(declare-fun m!604925 () Bool)

(assert (=> b!629601 m!604925))

(declare-fun m!604927 () Bool)

(assert (=> b!629611 m!604927))

(check-sat (not b!629607) (not start!56874) (not b!629605) (not b!629604) (not b!629610) (not b!629611) (not b!629602) (not b!629609) (not b!629608))
(check-sat)
