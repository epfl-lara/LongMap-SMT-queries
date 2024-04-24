; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53676 () Bool)

(assert start!53676)

(declare-fun b!584387 () Bool)

(declare-fun res!372100 () Bool)

(declare-fun e!334692 () Bool)

(assert (=> b!584387 (=> (not res!372100) (not e!334692))))

(declare-datatypes ((array!36522 0))(
  ( (array!36523 (arr!17533 (Array (_ BitVec 32) (_ BitVec 64))) (size!17897 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36522)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36522 (_ BitVec 32)) Bool)

(assert (=> b!584387 (= res!372100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584388 () Bool)

(declare-fun res!372105 () Bool)

(assert (=> b!584388 (=> (not res!372105) (not e!334692))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584388 (= res!372105 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17533 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17533 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584389 () Bool)

(declare-fun res!372109 () Bool)

(assert (=> b!584389 (=> (not res!372109) (not e!334692))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!584389 (= res!372109 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17533 a!2986) index!984) (select (arr!17533 a!2986) j!136))) (not (= (select (arr!17533 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584390 () Bool)

(declare-fun res!372104 () Bool)

(declare-fun e!334694 () Bool)

(assert (=> b!584390 (=> (not res!372104) (not e!334694))))

(assert (=> b!584390 (= res!372104 (and (= (size!17897 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17897 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17897 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584391 () Bool)

(declare-fun res!372103 () Bool)

(assert (=> b!584391 (=> (not res!372103) (not e!334692))))

(declare-datatypes ((List!11481 0))(
  ( (Nil!11478) (Cons!11477 (h!12525 (_ BitVec 64)) (t!17701 List!11481)) )
))
(declare-fun arrayNoDuplicates!0 (array!36522 (_ BitVec 32) List!11481) Bool)

(assert (=> b!584391 (= res!372103 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11478))))

(declare-fun b!584393 () Bool)

(declare-fun e!334695 () Bool)

(assert (=> b!584393 (= e!334695 false)))

(declare-fun lt!265611 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5929 0))(
  ( (MissingZero!5929 (index!25943 (_ BitVec 32))) (Found!5929 (index!25944 (_ BitVec 32))) (Intermediate!5929 (undefined!6741 Bool) (index!25945 (_ BitVec 32)) (x!54929 (_ BitVec 32))) (Undefined!5929) (MissingVacant!5929 (index!25946 (_ BitVec 32))) )
))
(declare-fun lt!265610 () SeekEntryResult!5929)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36522 (_ BitVec 32)) SeekEntryResult!5929)

(assert (=> b!584393 (= lt!265610 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265611 vacantSpotIndex!68 (select (arr!17533 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584394 () Bool)

(declare-fun res!372101 () Bool)

(assert (=> b!584394 (=> (not res!372101) (not e!334694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584394 (= res!372101 (validKeyInArray!0 (select (arr!17533 a!2986) j!136)))))

(declare-fun b!584395 () Bool)

(assert (=> b!584395 (= e!334692 e!334695)))

(declare-fun res!372108 () Bool)

(assert (=> b!584395 (=> (not res!372108) (not e!334695))))

(assert (=> b!584395 (= res!372108 (and (bvsge lt!265611 #b00000000000000000000000000000000) (bvslt lt!265611 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584395 (= lt!265611 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!584396 () Bool)

(declare-fun res!372099 () Bool)

(assert (=> b!584396 (=> (not res!372099) (not e!334694))))

(assert (=> b!584396 (= res!372099 (validKeyInArray!0 k0!1786))))

(declare-fun b!584397 () Bool)

(declare-fun res!372102 () Bool)

(assert (=> b!584397 (=> (not res!372102) (not e!334692))))

(assert (=> b!584397 (= res!372102 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17533 a!2986) j!136) a!2986 mask!3053) (Found!5929 j!136)))))

(declare-fun b!584398 () Bool)

(declare-fun res!372106 () Bool)

(assert (=> b!584398 (=> (not res!372106) (not e!334694))))

(declare-fun arrayContainsKey!0 (array!36522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584398 (= res!372106 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!372098 () Bool)

(assert (=> start!53676 (=> (not res!372098) (not e!334694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53676 (= res!372098 (validMask!0 mask!3053))))

(assert (=> start!53676 e!334694))

(assert (=> start!53676 true))

(declare-fun array_inv!13392 (array!36522) Bool)

(assert (=> start!53676 (array_inv!13392 a!2986)))

(declare-fun b!584392 () Bool)

(assert (=> b!584392 (= e!334694 e!334692)))

(declare-fun res!372107 () Bool)

(assert (=> b!584392 (=> (not res!372107) (not e!334692))))

(declare-fun lt!265612 () SeekEntryResult!5929)

(assert (=> b!584392 (= res!372107 (or (= lt!265612 (MissingZero!5929 i!1108)) (= lt!265612 (MissingVacant!5929 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36522 (_ BitVec 32)) SeekEntryResult!5929)

(assert (=> b!584392 (= lt!265612 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53676 res!372098) b!584390))

(assert (= (and b!584390 res!372104) b!584394))

(assert (= (and b!584394 res!372101) b!584396))

(assert (= (and b!584396 res!372099) b!584398))

(assert (= (and b!584398 res!372106) b!584392))

(assert (= (and b!584392 res!372107) b!584387))

(assert (= (and b!584387 res!372100) b!584391))

(assert (= (and b!584391 res!372103) b!584388))

(assert (= (and b!584388 res!372105) b!584397))

(assert (= (and b!584397 res!372102) b!584389))

(assert (= (and b!584389 res!372109) b!584395))

(assert (= (and b!584395 res!372108) b!584393))

(declare-fun m!562919 () Bool)

(assert (=> b!584389 m!562919))

(declare-fun m!562921 () Bool)

(assert (=> b!584389 m!562921))

(assert (=> b!584397 m!562921))

(assert (=> b!584397 m!562921))

(declare-fun m!562923 () Bool)

(assert (=> b!584397 m!562923))

(declare-fun m!562925 () Bool)

(assert (=> b!584396 m!562925))

(assert (=> b!584393 m!562921))

(assert (=> b!584393 m!562921))

(declare-fun m!562927 () Bool)

(assert (=> b!584393 m!562927))

(declare-fun m!562929 () Bool)

(assert (=> b!584398 m!562929))

(assert (=> b!584394 m!562921))

(assert (=> b!584394 m!562921))

(declare-fun m!562931 () Bool)

(assert (=> b!584394 m!562931))

(declare-fun m!562933 () Bool)

(assert (=> b!584391 m!562933))

(declare-fun m!562935 () Bool)

(assert (=> b!584388 m!562935))

(declare-fun m!562937 () Bool)

(assert (=> b!584388 m!562937))

(declare-fun m!562939 () Bool)

(assert (=> b!584388 m!562939))

(declare-fun m!562941 () Bool)

(assert (=> b!584392 m!562941))

(declare-fun m!562943 () Bool)

(assert (=> start!53676 m!562943))

(declare-fun m!562945 () Bool)

(assert (=> start!53676 m!562945))

(declare-fun m!562947 () Bool)

(assert (=> b!584387 m!562947))

(declare-fun m!562949 () Bool)

(assert (=> b!584395 m!562949))

(check-sat (not b!584395) (not b!584396) (not b!584393) (not b!584394) (not start!53676) (not b!584398) (not b!584392) (not b!584391) (not b!584397) (not b!584387))
(check-sat)
