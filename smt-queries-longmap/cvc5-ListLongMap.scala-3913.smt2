; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53488 () Bool)

(assert start!53488)

(declare-fun res!369956 () Bool)

(declare-fun e!333886 () Bool)

(assert (=> start!53488 (=> (not res!369956) (not e!333886))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53488 (= res!369956 (validMask!0 mask!3053))))

(assert (=> start!53488 e!333886))

(assert (=> start!53488 true))

(declare-datatypes ((array!36389 0))(
  ( (array!36390 (arr!17469 (Array (_ BitVec 32) (_ BitVec 64))) (size!17833 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36389)

(declare-fun array_inv!13265 (array!36389) Bool)

(assert (=> start!53488 (array_inv!13265 a!2986)))

(declare-fun b!582138 () Bool)

(declare-fun res!369960 () Bool)

(assert (=> b!582138 (=> (not res!369960) (not e!333886))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582138 (= res!369960 (and (= (size!17833 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17833 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17833 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582139 () Bool)

(declare-fun e!333888 () Bool)

(assert (=> b!582139 (= e!333888 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5909 0))(
  ( (MissingZero!5909 (index!25863 (_ BitVec 32))) (Found!5909 (index!25864 (_ BitVec 32))) (Intermediate!5909 (undefined!6721 Bool) (index!25865 (_ BitVec 32)) (x!54722 (_ BitVec 32))) (Undefined!5909) (MissingVacant!5909 (index!25866 (_ BitVec 32))) )
))
(declare-fun lt!265047 () SeekEntryResult!5909)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36389 (_ BitVec 32)) SeekEntryResult!5909)

(assert (=> b!582139 (= lt!265047 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17469 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582140 () Bool)

(declare-fun res!369957 () Bool)

(assert (=> b!582140 (=> (not res!369957) (not e!333886))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582140 (= res!369957 (validKeyInArray!0 k!1786))))

(declare-fun b!582141 () Bool)

(declare-fun res!369959 () Bool)

(assert (=> b!582141 (=> (not res!369959) (not e!333886))))

(assert (=> b!582141 (= res!369959 (validKeyInArray!0 (select (arr!17469 a!2986) j!136)))))

(declare-fun b!582142 () Bool)

(declare-fun res!369958 () Bool)

(assert (=> b!582142 (=> (not res!369958) (not e!333888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36389 (_ BitVec 32)) Bool)

(assert (=> b!582142 (= res!369958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582143 () Bool)

(declare-fun res!369961 () Bool)

(assert (=> b!582143 (=> (not res!369961) (not e!333888))))

(declare-datatypes ((List!11510 0))(
  ( (Nil!11507) (Cons!11506 (h!12551 (_ BitVec 64)) (t!17738 List!11510)) )
))
(declare-fun arrayNoDuplicates!0 (array!36389 (_ BitVec 32) List!11510) Bool)

(assert (=> b!582143 (= res!369961 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11507))))

(declare-fun b!582144 () Bool)

(declare-fun res!369954 () Bool)

(assert (=> b!582144 (=> (not res!369954) (not e!333888))))

(assert (=> b!582144 (= res!369954 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17469 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17469 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582145 () Bool)

(assert (=> b!582145 (= e!333886 e!333888)))

(declare-fun res!369955 () Bool)

(assert (=> b!582145 (=> (not res!369955) (not e!333888))))

(declare-fun lt!265048 () SeekEntryResult!5909)

(assert (=> b!582145 (= res!369955 (or (= lt!265048 (MissingZero!5909 i!1108)) (= lt!265048 (MissingVacant!5909 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36389 (_ BitVec 32)) SeekEntryResult!5909)

(assert (=> b!582145 (= lt!265048 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582146 () Bool)

(declare-fun res!369962 () Bool)

(assert (=> b!582146 (=> (not res!369962) (not e!333886))))

(declare-fun arrayContainsKey!0 (array!36389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582146 (= res!369962 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53488 res!369956) b!582138))

(assert (= (and b!582138 res!369960) b!582141))

(assert (= (and b!582141 res!369959) b!582140))

(assert (= (and b!582140 res!369957) b!582146))

(assert (= (and b!582146 res!369962) b!582145))

(assert (= (and b!582145 res!369955) b!582142))

(assert (= (and b!582142 res!369958) b!582143))

(assert (= (and b!582143 res!369961) b!582144))

(assert (= (and b!582144 res!369954) b!582139))

(declare-fun m!560653 () Bool)

(assert (=> b!582144 m!560653))

(declare-fun m!560655 () Bool)

(assert (=> b!582144 m!560655))

(declare-fun m!560657 () Bool)

(assert (=> b!582144 m!560657))

(declare-fun m!560659 () Bool)

(assert (=> b!582146 m!560659))

(declare-fun m!560661 () Bool)

(assert (=> b!582139 m!560661))

(assert (=> b!582139 m!560661))

(declare-fun m!560663 () Bool)

(assert (=> b!582139 m!560663))

(declare-fun m!560665 () Bool)

(assert (=> b!582142 m!560665))

(declare-fun m!560667 () Bool)

(assert (=> b!582140 m!560667))

(declare-fun m!560669 () Bool)

(assert (=> b!582145 m!560669))

(assert (=> b!582141 m!560661))

(assert (=> b!582141 m!560661))

(declare-fun m!560671 () Bool)

(assert (=> b!582141 m!560671))

(declare-fun m!560673 () Bool)

(assert (=> b!582143 m!560673))

(declare-fun m!560675 () Bool)

(assert (=> start!53488 m!560675))

(declare-fun m!560677 () Bool)

(assert (=> start!53488 m!560677))

(push 1)

