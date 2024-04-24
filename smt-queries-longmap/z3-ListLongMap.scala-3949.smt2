; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53754 () Bool)

(assert start!53754)

(declare-fun res!373510 () Bool)

(declare-fun e!335160 () Bool)

(assert (=> start!53754 (=> (not res!373510) (not e!335160))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53754 (= res!373510 (validMask!0 mask!3053))))

(assert (=> start!53754 e!335160))

(assert (=> start!53754 true))

(declare-datatypes ((array!36600 0))(
  ( (array!36601 (arr!17572 (Array (_ BitVec 32) (_ BitVec 64))) (size!17936 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36600)

(declare-fun array_inv!13431 (array!36600) Bool)

(assert (=> start!53754 (array_inv!13431 a!2986)))

(declare-fun b!585789 () Bool)

(declare-fun res!373500 () Bool)

(declare-fun e!335158 () Bool)

(assert (=> b!585789 (=> (not res!373500) (not e!335158))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585789 (= res!373500 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17572 a!2986) index!984) (select (arr!17572 a!2986) j!136))) (not (= (select (arr!17572 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585790 () Bool)

(declare-fun res!373502 () Bool)

(assert (=> b!585790 (=> (not res!373502) (not e!335160))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585790 (= res!373502 (validKeyInArray!0 k0!1786))))

(declare-fun b!585791 () Bool)

(declare-fun res!373501 () Bool)

(assert (=> b!585791 (=> (not res!373501) (not e!335158))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5968 0))(
  ( (MissingZero!5968 (index!26099 (_ BitVec 32))) (Found!5968 (index!26100 (_ BitVec 32))) (Intermediate!5968 (undefined!6780 Bool) (index!26101 (_ BitVec 32)) (x!55072 (_ BitVec 32))) (Undefined!5968) (MissingVacant!5968 (index!26102 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36600 (_ BitVec 32)) SeekEntryResult!5968)

(assert (=> b!585791 (= res!373501 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17572 a!2986) j!136) a!2986 mask!3053) (Found!5968 j!136)))))

(declare-fun b!585792 () Bool)

(declare-fun res!373509 () Bool)

(assert (=> b!585792 (=> (not res!373509) (not e!335158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36600 (_ BitVec 32)) Bool)

(assert (=> b!585792 (= res!373509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585793 () Bool)

(declare-fun res!373505 () Bool)

(assert (=> b!585793 (=> (not res!373505) (not e!335158))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585793 (= res!373505 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17572 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17572 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585794 () Bool)

(declare-fun res!373506 () Bool)

(assert (=> b!585794 (=> (not res!373506) (not e!335158))))

(declare-datatypes ((List!11520 0))(
  ( (Nil!11517) (Cons!11516 (h!12564 (_ BitVec 64)) (t!17740 List!11520)) )
))
(declare-fun arrayNoDuplicates!0 (array!36600 (_ BitVec 32) List!11520) Bool)

(assert (=> b!585794 (= res!373506 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11517))))

(declare-fun b!585795 () Bool)

(declare-fun res!373503 () Bool)

(assert (=> b!585795 (=> (not res!373503) (not e!335160))))

(assert (=> b!585795 (= res!373503 (and (= (size!17936 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17936 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17936 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585796 () Bool)

(assert (=> b!585796 (= e!335158 (not true))))

(declare-fun lt!265962 () (_ BitVec 32))

(assert (=> b!585796 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265962 vacantSpotIndex!68 (select (arr!17572 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265962 vacantSpotIndex!68 (select (store (arr!17572 a!2986) i!1108 k0!1786) j!136) (array!36601 (store (arr!17572 a!2986) i!1108 k0!1786) (size!17936 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18133 0))(
  ( (Unit!18134) )
))
(declare-fun lt!265961 () Unit!18133)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36600 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18133)

(assert (=> b!585796 (= lt!265961 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265962 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585796 (= lt!265962 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!585797 () Bool)

(declare-fun res!373504 () Bool)

(assert (=> b!585797 (=> (not res!373504) (not e!335160))))

(declare-fun arrayContainsKey!0 (array!36600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585797 (= res!373504 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585798 () Bool)

(declare-fun res!373508 () Bool)

(assert (=> b!585798 (=> (not res!373508) (not e!335160))))

(assert (=> b!585798 (= res!373508 (validKeyInArray!0 (select (arr!17572 a!2986) j!136)))))

(declare-fun b!585799 () Bool)

(assert (=> b!585799 (= e!335160 e!335158)))

(declare-fun res!373507 () Bool)

(assert (=> b!585799 (=> (not res!373507) (not e!335158))))

(declare-fun lt!265963 () SeekEntryResult!5968)

(assert (=> b!585799 (= res!373507 (or (= lt!265963 (MissingZero!5968 i!1108)) (= lt!265963 (MissingVacant!5968 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36600 (_ BitVec 32)) SeekEntryResult!5968)

(assert (=> b!585799 (= lt!265963 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53754 res!373510) b!585795))

(assert (= (and b!585795 res!373503) b!585798))

(assert (= (and b!585798 res!373508) b!585790))

(assert (= (and b!585790 res!373502) b!585797))

(assert (= (and b!585797 res!373504) b!585799))

(assert (= (and b!585799 res!373507) b!585792))

(assert (= (and b!585792 res!373509) b!585794))

(assert (= (and b!585794 res!373506) b!585793))

(assert (= (and b!585793 res!373505) b!585791))

(assert (= (and b!585791 res!373501) b!585789))

(assert (= (and b!585789 res!373500) b!585796))

(declare-fun m!564167 () Bool)

(assert (=> b!585798 m!564167))

(assert (=> b!585798 m!564167))

(declare-fun m!564169 () Bool)

(assert (=> b!585798 m!564169))

(declare-fun m!564171 () Bool)

(assert (=> b!585789 m!564171))

(assert (=> b!585789 m!564167))

(declare-fun m!564173 () Bool)

(assert (=> b!585796 m!564173))

(declare-fun m!564175 () Bool)

(assert (=> b!585796 m!564175))

(assert (=> b!585796 m!564167))

(assert (=> b!585796 m!564167))

(declare-fun m!564177 () Bool)

(assert (=> b!585796 m!564177))

(assert (=> b!585796 m!564175))

(declare-fun m!564179 () Bool)

(assert (=> b!585796 m!564179))

(declare-fun m!564181 () Bool)

(assert (=> b!585796 m!564181))

(declare-fun m!564183 () Bool)

(assert (=> b!585796 m!564183))

(assert (=> b!585791 m!564167))

(assert (=> b!585791 m!564167))

(declare-fun m!564185 () Bool)

(assert (=> b!585791 m!564185))

(declare-fun m!564187 () Bool)

(assert (=> b!585799 m!564187))

(declare-fun m!564189 () Bool)

(assert (=> b!585790 m!564189))

(declare-fun m!564191 () Bool)

(assert (=> start!53754 m!564191))

(declare-fun m!564193 () Bool)

(assert (=> start!53754 m!564193))

(declare-fun m!564195 () Bool)

(assert (=> b!585797 m!564195))

(declare-fun m!564197 () Bool)

(assert (=> b!585794 m!564197))

(declare-fun m!564199 () Bool)

(assert (=> b!585793 m!564199))

(assert (=> b!585793 m!564183))

(declare-fun m!564201 () Bool)

(assert (=> b!585793 m!564201))

(declare-fun m!564203 () Bool)

(assert (=> b!585792 m!564203))

(check-sat (not b!585790) (not b!585791) (not b!585798) (not b!585792) (not b!585799) (not b!585794) (not b!585796) (not start!53754) (not b!585797))
(check-sat)
