; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53622 () Bool)

(assert start!53622)

(declare-fun b!584123 () Bool)

(declare-fun res!372084 () Bool)

(declare-fun e!334462 () Bool)

(assert (=> b!584123 (=> (not res!372084) (not e!334462))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36537 0))(
  ( (array!36538 (arr!17543 (Array (_ BitVec 32) (_ BitVec 64))) (size!17908 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36537)

(assert (=> b!584123 (= res!372084 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17543 a!2986) index!984) (select (arr!17543 a!2986) j!136))) (not (= (select (arr!17543 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584124 () Bool)

(declare-fun res!372083 () Bool)

(assert (=> b!584124 (=> (not res!372083) (not e!334462))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36537 (_ BitVec 32)) Bool)

(assert (=> b!584124 (= res!372083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!372087 () Bool)

(declare-fun e!334463 () Bool)

(assert (=> start!53622 (=> (not res!372087) (not e!334463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53622 (= res!372087 (validMask!0 mask!3053))))

(assert (=> start!53622 e!334463))

(assert (=> start!53622 true))

(declare-fun array_inv!13426 (array!36537) Bool)

(assert (=> start!53622 (array_inv!13426 a!2986)))

(declare-fun b!584125 () Bool)

(assert (=> b!584125 (= e!334463 e!334462)))

(declare-fun res!372089 () Bool)

(assert (=> b!584125 (=> (not res!372089) (not e!334462))))

(declare-datatypes ((SeekEntryResult!5980 0))(
  ( (MissingZero!5980 (index!26147 (_ BitVec 32))) (Found!5980 (index!26148 (_ BitVec 32))) (Intermediate!5980 (undefined!6792 Bool) (index!26149 (_ BitVec 32)) (x!54988 (_ BitVec 32))) (Undefined!5980) (MissingVacant!5980 (index!26150 (_ BitVec 32))) )
))
(declare-fun lt!265329 () SeekEntryResult!5980)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584125 (= res!372089 (or (= lt!265329 (MissingZero!5980 i!1108)) (= lt!265329 (MissingVacant!5980 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36537 (_ BitVec 32)) SeekEntryResult!5980)

(assert (=> b!584125 (= lt!265329 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584126 () Bool)

(declare-fun res!372090 () Bool)

(assert (=> b!584126 (=> (not res!372090) (not e!334462))))

(declare-datatypes ((List!11623 0))(
  ( (Nil!11620) (Cons!11619 (h!12664 (_ BitVec 64)) (t!17842 List!11623)) )
))
(declare-fun arrayNoDuplicates!0 (array!36537 (_ BitVec 32) List!11623) Bool)

(assert (=> b!584126 (= res!372090 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11620))))

(declare-fun b!584127 () Bool)

(declare-fun res!372086 () Bool)

(assert (=> b!584127 (=> (not res!372086) (not e!334462))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!584127 (= res!372086 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17543 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17543 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584128 () Bool)

(declare-fun res!372091 () Bool)

(assert (=> b!584128 (=> (not res!372091) (not e!334463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584128 (= res!372091 (validKeyInArray!0 (select (arr!17543 a!2986) j!136)))))

(declare-fun b!584129 () Bool)

(declare-fun res!372088 () Bool)

(assert (=> b!584129 (=> (not res!372088) (not e!334463))))

(assert (=> b!584129 (= res!372088 (and (= (size!17908 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17908 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17908 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584130 () Bool)

(declare-fun e!334461 () Bool)

(assert (=> b!584130 (= e!334462 e!334461)))

(declare-fun res!372085 () Bool)

(assert (=> b!584130 (=> (not res!372085) (not e!334461))))

(declare-fun lt!265330 () (_ BitVec 32))

(assert (=> b!584130 (= res!372085 (and (bvsge lt!265330 #b00000000000000000000000000000000) (bvslt lt!265330 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584130 (= lt!265330 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584131 () Bool)

(declare-fun res!372082 () Bool)

(assert (=> b!584131 (=> (not res!372082) (not e!334463))))

(assert (=> b!584131 (= res!372082 (validKeyInArray!0 k0!1786))))

(declare-fun b!584132 () Bool)

(assert (=> b!584132 (= e!334461 false)))

(declare-fun lt!265328 () SeekEntryResult!5980)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36537 (_ BitVec 32)) SeekEntryResult!5980)

(assert (=> b!584132 (= lt!265328 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265330 vacantSpotIndex!68 (select (arr!17543 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584133 () Bool)

(declare-fun res!372081 () Bool)

(assert (=> b!584133 (=> (not res!372081) (not e!334462))))

(assert (=> b!584133 (= res!372081 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17543 a!2986) j!136) a!2986 mask!3053) (Found!5980 j!136)))))

(declare-fun b!584134 () Bool)

(declare-fun res!372092 () Bool)

(assert (=> b!584134 (=> (not res!372092) (not e!334463))))

(declare-fun arrayContainsKey!0 (array!36537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584134 (= res!372092 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53622 res!372087) b!584129))

(assert (= (and b!584129 res!372088) b!584128))

(assert (= (and b!584128 res!372091) b!584131))

(assert (= (and b!584131 res!372082) b!584134))

(assert (= (and b!584134 res!372092) b!584125))

(assert (= (and b!584125 res!372089) b!584124))

(assert (= (and b!584124 res!372083) b!584126))

(assert (= (and b!584126 res!372090) b!584127))

(assert (= (and b!584127 res!372086) b!584133))

(assert (= (and b!584133 res!372081) b!584123))

(assert (= (and b!584123 res!372084) b!584130))

(assert (= (and b!584130 res!372085) b!584132))

(declare-fun m!561967 () Bool)

(assert (=> b!584127 m!561967))

(declare-fun m!561969 () Bool)

(assert (=> b!584127 m!561969))

(declare-fun m!561971 () Bool)

(assert (=> b!584127 m!561971))

(declare-fun m!561973 () Bool)

(assert (=> b!584134 m!561973))

(declare-fun m!561975 () Bool)

(assert (=> b!584130 m!561975))

(declare-fun m!561977 () Bool)

(assert (=> b!584128 m!561977))

(assert (=> b!584128 m!561977))

(declare-fun m!561979 () Bool)

(assert (=> b!584128 m!561979))

(declare-fun m!561981 () Bool)

(assert (=> b!584123 m!561981))

(assert (=> b!584123 m!561977))

(declare-fun m!561983 () Bool)

(assert (=> b!584126 m!561983))

(declare-fun m!561985 () Bool)

(assert (=> b!584131 m!561985))

(declare-fun m!561987 () Bool)

(assert (=> b!584124 m!561987))

(declare-fun m!561989 () Bool)

(assert (=> start!53622 m!561989))

(declare-fun m!561991 () Bool)

(assert (=> start!53622 m!561991))

(assert (=> b!584133 m!561977))

(assert (=> b!584133 m!561977))

(declare-fun m!561993 () Bool)

(assert (=> b!584133 m!561993))

(assert (=> b!584132 m!561977))

(assert (=> b!584132 m!561977))

(declare-fun m!561995 () Bool)

(assert (=> b!584132 m!561995))

(declare-fun m!561997 () Bool)

(assert (=> b!584125 m!561997))

(check-sat (not b!584134) (not b!584132) (not b!584125) (not b!584131) (not b!584124) (not start!53622) (not b!584133) (not b!584126) (not b!584128) (not b!584130))
(check-sat)
