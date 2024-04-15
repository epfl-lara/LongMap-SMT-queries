; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53412 () Bool)

(assert start!53412)

(declare-fun b!581032 () Bool)

(declare-fun res!368994 () Bool)

(declare-fun e!333444 () Bool)

(assert (=> b!581032 (=> (not res!368994) (not e!333444))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36327 0))(
  ( (array!36328 (arr!17438 (Array (_ BitVec 32) (_ BitVec 64))) (size!17803 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36327)

(assert (=> b!581032 (= res!368994 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17438 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17438 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581033 () Bool)

(declare-fun res!368997 () Bool)

(assert (=> b!581033 (=> (not res!368997) (not e!333444))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5875 0))(
  ( (MissingZero!5875 (index!25727 (_ BitVec 32))) (Found!5875 (index!25728 (_ BitVec 32))) (Intermediate!5875 (undefined!6687 Bool) (index!25729 (_ BitVec 32)) (x!54603 (_ BitVec 32))) (Undefined!5875) (MissingVacant!5875 (index!25730 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36327 (_ BitVec 32)) SeekEntryResult!5875)

(assert (=> b!581033 (= res!368997 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17438 a!2986) j!136) a!2986 mask!3053) (Found!5875 j!136)))))

(declare-fun b!581034 () Bool)

(declare-fun res!368992 () Bool)

(assert (=> b!581034 (=> (not res!368992) (not e!333444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36327 (_ BitVec 32)) Bool)

(assert (=> b!581034 (= res!368992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581035 () Bool)

(declare-fun res!368990 () Bool)

(declare-fun e!333443 () Bool)

(assert (=> b!581035 (=> (not res!368990) (not e!333443))))

(declare-fun arrayContainsKey!0 (array!36327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581035 (= res!368990 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581036 () Bool)

(assert (=> b!581036 (= e!333443 e!333444)))

(declare-fun res!368998 () Bool)

(assert (=> b!581036 (=> (not res!368998) (not e!333444))))

(declare-fun lt!264649 () SeekEntryResult!5875)

(assert (=> b!581036 (= res!368998 (or (= lt!264649 (MissingZero!5875 i!1108)) (= lt!264649 (MissingVacant!5875 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36327 (_ BitVec 32)) SeekEntryResult!5875)

(assert (=> b!581036 (= lt!264649 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!368993 () Bool)

(assert (=> start!53412 (=> (not res!368993) (not e!333443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53412 (= res!368993 (validMask!0 mask!3053))))

(assert (=> start!53412 e!333443))

(assert (=> start!53412 true))

(declare-fun array_inv!13321 (array!36327) Bool)

(assert (=> start!53412 (array_inv!13321 a!2986)))

(declare-fun b!581037 () Bool)

(assert (=> b!581037 (= e!333444 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17438 a!2986) index!984) (select (arr!17438 a!2986) j!136)) (= index!984 j!136) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!581038 () Bool)

(declare-fun res!368996 () Bool)

(assert (=> b!581038 (=> (not res!368996) (not e!333443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581038 (= res!368996 (validKeyInArray!0 k0!1786))))

(declare-fun b!581039 () Bool)

(declare-fun res!368991 () Bool)

(assert (=> b!581039 (=> (not res!368991) (not e!333443))))

(assert (=> b!581039 (= res!368991 (and (= (size!17803 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17803 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17803 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581040 () Bool)

(declare-fun res!368995 () Bool)

(assert (=> b!581040 (=> (not res!368995) (not e!333443))))

(assert (=> b!581040 (= res!368995 (validKeyInArray!0 (select (arr!17438 a!2986) j!136)))))

(declare-fun b!581041 () Bool)

(declare-fun res!368999 () Bool)

(assert (=> b!581041 (=> (not res!368999) (not e!333444))))

(declare-datatypes ((List!11518 0))(
  ( (Nil!11515) (Cons!11514 (h!12559 (_ BitVec 64)) (t!17737 List!11518)) )
))
(declare-fun arrayNoDuplicates!0 (array!36327 (_ BitVec 32) List!11518) Bool)

(assert (=> b!581041 (= res!368999 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11515))))

(assert (= (and start!53412 res!368993) b!581039))

(assert (= (and b!581039 res!368991) b!581040))

(assert (= (and b!581040 res!368995) b!581038))

(assert (= (and b!581038 res!368996) b!581035))

(assert (= (and b!581035 res!368990) b!581036))

(assert (= (and b!581036 res!368998) b!581034))

(assert (= (and b!581034 res!368992) b!581041))

(assert (= (and b!581041 res!368999) b!581032))

(assert (= (and b!581032 res!368994) b!581033))

(assert (= (and b!581033 res!368997) b!581037))

(declare-fun m!559063 () Bool)

(assert (=> b!581037 m!559063))

(declare-fun m!559065 () Bool)

(assert (=> b!581037 m!559065))

(declare-fun m!559067 () Bool)

(assert (=> start!53412 m!559067))

(declare-fun m!559069 () Bool)

(assert (=> start!53412 m!559069))

(declare-fun m!559071 () Bool)

(assert (=> b!581035 m!559071))

(declare-fun m!559073 () Bool)

(assert (=> b!581036 m!559073))

(declare-fun m!559075 () Bool)

(assert (=> b!581038 m!559075))

(declare-fun m!559077 () Bool)

(assert (=> b!581041 m!559077))

(assert (=> b!581040 m!559065))

(assert (=> b!581040 m!559065))

(declare-fun m!559079 () Bool)

(assert (=> b!581040 m!559079))

(assert (=> b!581033 m!559065))

(assert (=> b!581033 m!559065))

(declare-fun m!559081 () Bool)

(assert (=> b!581033 m!559081))

(declare-fun m!559083 () Bool)

(assert (=> b!581034 m!559083))

(declare-fun m!559085 () Bool)

(assert (=> b!581032 m!559085))

(declare-fun m!559087 () Bool)

(assert (=> b!581032 m!559087))

(declare-fun m!559089 () Bool)

(assert (=> b!581032 m!559089))

(check-sat (not b!581041) (not b!581036) (not start!53412) (not b!581034) (not b!581035) (not b!581038) (not b!581040) (not b!581033))
(check-sat)
