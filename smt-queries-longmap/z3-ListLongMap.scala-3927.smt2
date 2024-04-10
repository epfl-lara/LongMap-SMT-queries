; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53574 () Bool)

(assert start!53574)

(declare-fun b!583304 () Bool)

(declare-fun res!371123 () Bool)

(declare-fun e!334275 () Bool)

(assert (=> b!583304 (=> (not res!371123) (not e!334275))))

(declare-datatypes ((array!36475 0))(
  ( (array!36476 (arr!17512 (Array (_ BitVec 32) (_ BitVec 64))) (size!17876 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36475)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583304 (= res!371123 (validKeyInArray!0 (select (arr!17512 a!2986) j!136)))))

(declare-fun b!583305 () Bool)

(declare-fun res!371125 () Bool)

(assert (=> b!583305 (=> (not res!371125) (not e!334275))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583305 (= res!371125 (and (= (size!17876 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17876 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17876 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583306 () Bool)

(declare-fun e!334273 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583306 (= e!334273 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17512 a!2986) index!984) (select (arr!17512 a!2986) j!136))) (not (= (select (arr!17512 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136)) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!583307 () Bool)

(declare-fun res!371122 () Bool)

(assert (=> b!583307 (=> (not res!371122) (not e!334273))))

(declare-datatypes ((List!11553 0))(
  ( (Nil!11550) (Cons!11549 (h!12594 (_ BitVec 64)) (t!17781 List!11553)) )
))
(declare-fun arrayNoDuplicates!0 (array!36475 (_ BitVec 32) List!11553) Bool)

(assert (=> b!583307 (= res!371122 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11550))))

(declare-fun b!583308 () Bool)

(assert (=> b!583308 (= e!334275 e!334273)))

(declare-fun res!371120 () Bool)

(assert (=> b!583308 (=> (not res!371120) (not e!334273))))

(declare-datatypes ((SeekEntryResult!5952 0))(
  ( (MissingZero!5952 (index!26035 (_ BitVec 32))) (Found!5952 (index!26036 (_ BitVec 32))) (Intermediate!5952 (undefined!6764 Bool) (index!26037 (_ BitVec 32)) (x!54877 (_ BitVec 32))) (Undefined!5952) (MissingVacant!5952 (index!26038 (_ BitVec 32))) )
))
(declare-fun lt!265300 () SeekEntryResult!5952)

(assert (=> b!583308 (= res!371120 (or (= lt!265300 (MissingZero!5952 i!1108)) (= lt!265300 (MissingVacant!5952 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36475 (_ BitVec 32)) SeekEntryResult!5952)

(assert (=> b!583308 (= lt!265300 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583310 () Bool)

(declare-fun res!371124 () Bool)

(assert (=> b!583310 (=> (not res!371124) (not e!334273))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!583310 (= res!371124 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17512 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17512 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583311 () Bool)

(declare-fun res!371127 () Bool)

(assert (=> b!583311 (=> (not res!371127) (not e!334275))))

(assert (=> b!583311 (= res!371127 (validKeyInArray!0 k0!1786))))

(declare-fun b!583312 () Bool)

(declare-fun res!371128 () Bool)

(assert (=> b!583312 (=> (not res!371128) (not e!334273))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36475 (_ BitVec 32)) SeekEntryResult!5952)

(assert (=> b!583312 (= res!371128 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17512 a!2986) j!136) a!2986 mask!3053) (Found!5952 j!136)))))

(declare-fun b!583313 () Bool)

(declare-fun res!371126 () Bool)

(assert (=> b!583313 (=> (not res!371126) (not e!334275))))

(declare-fun arrayContainsKey!0 (array!36475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583313 (= res!371126 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!371129 () Bool)

(assert (=> start!53574 (=> (not res!371129) (not e!334275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53574 (= res!371129 (validMask!0 mask!3053))))

(assert (=> start!53574 e!334275))

(assert (=> start!53574 true))

(declare-fun array_inv!13308 (array!36475) Bool)

(assert (=> start!53574 (array_inv!13308 a!2986)))

(declare-fun b!583309 () Bool)

(declare-fun res!371121 () Bool)

(assert (=> b!583309 (=> (not res!371121) (not e!334273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36475 (_ BitVec 32)) Bool)

(assert (=> b!583309 (= res!371121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53574 res!371129) b!583305))

(assert (= (and b!583305 res!371125) b!583304))

(assert (= (and b!583304 res!371123) b!583311))

(assert (= (and b!583311 res!371127) b!583313))

(assert (= (and b!583313 res!371126) b!583308))

(assert (= (and b!583308 res!371120) b!583309))

(assert (= (and b!583309 res!371121) b!583307))

(assert (= (and b!583307 res!371122) b!583310))

(assert (= (and b!583310 res!371124) b!583312))

(assert (= (and b!583312 res!371128) b!583306))

(declare-fun m!561773 () Bool)

(assert (=> b!583310 m!561773))

(declare-fun m!561775 () Bool)

(assert (=> b!583310 m!561775))

(declare-fun m!561777 () Bool)

(assert (=> b!583310 m!561777))

(declare-fun m!561779 () Bool)

(assert (=> b!583312 m!561779))

(assert (=> b!583312 m!561779))

(declare-fun m!561781 () Bool)

(assert (=> b!583312 m!561781))

(assert (=> b!583304 m!561779))

(assert (=> b!583304 m!561779))

(declare-fun m!561783 () Bool)

(assert (=> b!583304 m!561783))

(declare-fun m!561785 () Bool)

(assert (=> b!583307 m!561785))

(declare-fun m!561787 () Bool)

(assert (=> b!583313 m!561787))

(declare-fun m!561789 () Bool)

(assert (=> b!583306 m!561789))

(assert (=> b!583306 m!561779))

(declare-fun m!561791 () Bool)

(assert (=> b!583308 m!561791))

(declare-fun m!561793 () Bool)

(assert (=> b!583311 m!561793))

(declare-fun m!561795 () Bool)

(assert (=> start!53574 m!561795))

(declare-fun m!561797 () Bool)

(assert (=> start!53574 m!561797))

(declare-fun m!561799 () Bool)

(assert (=> b!583309 m!561799))

(check-sat (not b!583311) (not b!583312) (not b!583307) (not start!53574) (not b!583313) (not b!583309) (not b!583304) (not b!583308))
(check-sat)
