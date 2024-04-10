; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53652 () Bool)

(assert start!53652)

(declare-fun res!372470 () Bool)

(declare-fun e!334720 () Bool)

(assert (=> start!53652 (=> (not res!372470) (not e!334720))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53652 (= res!372470 (validMask!0 mask!3053))))

(assert (=> start!53652 e!334720))

(assert (=> start!53652 true))

(declare-datatypes ((array!36553 0))(
  ( (array!36554 (arr!17551 (Array (_ BitVec 32) (_ BitVec 64))) (size!17915 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36553)

(declare-fun array_inv!13347 (array!36553) Bool)

(assert (=> start!53652 (array_inv!13347 a!2986)))

(declare-fun b!584646 () Bool)

(declare-fun res!372465 () Bool)

(declare-fun e!334719 () Bool)

(assert (=> b!584646 (=> (not res!372465) (not e!334719))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584646 (= res!372465 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17551 a!2986) index!984) (select (arr!17551 a!2986) j!136))) (not (= (select (arr!17551 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584647 () Bool)

(declare-fun res!372466 () Bool)

(assert (=> b!584647 (=> (not res!372466) (not e!334719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36553 (_ BitVec 32)) Bool)

(assert (=> b!584647 (= res!372466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584648 () Bool)

(declare-fun e!334722 () Bool)

(assert (=> b!584648 (= e!334719 e!334722)))

(declare-fun res!372473 () Bool)

(assert (=> b!584648 (=> (not res!372473) (not e!334722))))

(declare-fun lt!265626 () (_ BitVec 32))

(assert (=> b!584648 (= res!372473 (and (bvsge lt!265626 #b00000000000000000000000000000000) (bvslt lt!265626 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584648 (= lt!265626 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584649 () Bool)

(declare-fun res!372471 () Bool)

(assert (=> b!584649 (=> (not res!372471) (not e!334720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584649 (= res!372471 (validKeyInArray!0 (select (arr!17551 a!2986) j!136)))))

(declare-fun b!584650 () Bool)

(declare-fun res!372463 () Bool)

(assert (=> b!584650 (=> (not res!372463) (not e!334719))))

(declare-datatypes ((List!11592 0))(
  ( (Nil!11589) (Cons!11588 (h!12633 (_ BitVec 64)) (t!17820 List!11592)) )
))
(declare-fun arrayNoDuplicates!0 (array!36553 (_ BitVec 32) List!11592) Bool)

(assert (=> b!584650 (= res!372463 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11589))))

(declare-fun b!584651 () Bool)

(assert (=> b!584651 (= e!334720 e!334719)))

(declare-fun res!372469 () Bool)

(assert (=> b!584651 (=> (not res!372469) (not e!334719))))

(declare-datatypes ((SeekEntryResult!5991 0))(
  ( (MissingZero!5991 (index!26191 (_ BitVec 32))) (Found!5991 (index!26192 (_ BitVec 32))) (Intermediate!5991 (undefined!6803 Bool) (index!26193 (_ BitVec 32)) (x!55020 (_ BitVec 32))) (Undefined!5991) (MissingVacant!5991 (index!26194 (_ BitVec 32))) )
))
(declare-fun lt!265627 () SeekEntryResult!5991)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584651 (= res!372469 (or (= lt!265627 (MissingZero!5991 i!1108)) (= lt!265627 (MissingVacant!5991 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36553 (_ BitVec 32)) SeekEntryResult!5991)

(assert (=> b!584651 (= lt!265627 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584652 () Bool)

(declare-fun res!372467 () Bool)

(assert (=> b!584652 (=> (not res!372467) (not e!334720))))

(assert (=> b!584652 (= res!372467 (validKeyInArray!0 k0!1786))))

(declare-fun b!584653 () Bool)

(declare-fun res!372472 () Bool)

(assert (=> b!584653 (=> (not res!372472) (not e!334720))))

(assert (=> b!584653 (= res!372472 (and (= (size!17915 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17915 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17915 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584654 () Bool)

(declare-fun res!372462 () Bool)

(assert (=> b!584654 (=> (not res!372462) (not e!334720))))

(declare-fun arrayContainsKey!0 (array!36553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584654 (= res!372462 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584655 () Bool)

(declare-fun res!372464 () Bool)

(assert (=> b!584655 (=> (not res!372464) (not e!334719))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!584655 (= res!372464 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17551 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17551 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584656 () Bool)

(assert (=> b!584656 (= e!334722 false)))

(declare-fun lt!265625 () SeekEntryResult!5991)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36553 (_ BitVec 32)) SeekEntryResult!5991)

(assert (=> b!584656 (= lt!265625 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265626 vacantSpotIndex!68 (select (arr!17551 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584657 () Bool)

(declare-fun res!372468 () Bool)

(assert (=> b!584657 (=> (not res!372468) (not e!334719))))

(assert (=> b!584657 (= res!372468 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17551 a!2986) j!136) a!2986 mask!3053) (Found!5991 j!136)))))

(assert (= (and start!53652 res!372470) b!584653))

(assert (= (and b!584653 res!372472) b!584649))

(assert (= (and b!584649 res!372471) b!584652))

(assert (= (and b!584652 res!372467) b!584654))

(assert (= (and b!584654 res!372462) b!584651))

(assert (= (and b!584651 res!372469) b!584647))

(assert (= (and b!584647 res!372466) b!584650))

(assert (= (and b!584650 res!372463) b!584655))

(assert (= (and b!584655 res!372464) b!584657))

(assert (= (and b!584657 res!372468) b!584646))

(assert (= (and b!584646 res!372465) b!584648))

(assert (= (and b!584648 res!372473) b!584656))

(declare-fun m!562977 () Bool)

(assert (=> b!584656 m!562977))

(assert (=> b!584656 m!562977))

(declare-fun m!562979 () Bool)

(assert (=> b!584656 m!562979))

(declare-fun m!562981 () Bool)

(assert (=> b!584655 m!562981))

(declare-fun m!562983 () Bool)

(assert (=> b!584655 m!562983))

(declare-fun m!562985 () Bool)

(assert (=> b!584655 m!562985))

(declare-fun m!562987 () Bool)

(assert (=> b!584652 m!562987))

(assert (=> b!584657 m!562977))

(assert (=> b!584657 m!562977))

(declare-fun m!562989 () Bool)

(assert (=> b!584657 m!562989))

(assert (=> b!584649 m!562977))

(assert (=> b!584649 m!562977))

(declare-fun m!562991 () Bool)

(assert (=> b!584649 m!562991))

(declare-fun m!562993 () Bool)

(assert (=> b!584648 m!562993))

(declare-fun m!562995 () Bool)

(assert (=> b!584654 m!562995))

(declare-fun m!562997 () Bool)

(assert (=> b!584646 m!562997))

(assert (=> b!584646 m!562977))

(declare-fun m!562999 () Bool)

(assert (=> b!584650 m!562999))

(declare-fun m!563001 () Bool)

(assert (=> b!584651 m!563001))

(declare-fun m!563003 () Bool)

(assert (=> b!584647 m!563003))

(declare-fun m!563005 () Bool)

(assert (=> start!53652 m!563005))

(declare-fun m!563007 () Bool)

(assert (=> start!53652 m!563007))

(check-sat (not b!584651) (not b!584647) (not b!584648) (not start!53652) (not b!584657) (not b!584652) (not b!584650) (not b!584649) (not b!584656) (not b!584654))
(check-sat)
