; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53624 () Bool)

(assert start!53624)

(declare-fun b!584142 () Bool)

(declare-fun res!371964 () Bool)

(declare-fun e!334553 () Bool)

(assert (=> b!584142 (=> (not res!371964) (not e!334553))))

(declare-datatypes ((array!36525 0))(
  ( (array!36526 (arr!17537 (Array (_ BitVec 32) (_ BitVec 64))) (size!17901 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36525)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584142 (= res!371964 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584143 () Bool)

(declare-fun res!371959 () Bool)

(declare-fun e!334551 () Bool)

(assert (=> b!584143 (=> (not res!371959) (not e!334551))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36525 (_ BitVec 32)) Bool)

(assert (=> b!584143 (= res!371959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584144 () Bool)

(declare-fun res!371967 () Bool)

(assert (=> b!584144 (=> (not res!371967) (not e!334551))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5977 0))(
  ( (MissingZero!5977 (index!26135 (_ BitVec 32))) (Found!5977 (index!26136 (_ BitVec 32))) (Intermediate!5977 (undefined!6789 Bool) (index!26137 (_ BitVec 32)) (x!54966 (_ BitVec 32))) (Undefined!5977) (MissingVacant!5977 (index!26138 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36525 (_ BitVec 32)) SeekEntryResult!5977)

(assert (=> b!584144 (= res!371967 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17537 a!2986) j!136) a!2986 mask!3053) (Found!5977 j!136)))))

(declare-fun b!584145 () Bool)

(declare-fun e!334554 () Bool)

(assert (=> b!584145 (= e!334554 false)))

(declare-fun lt!265499 () SeekEntryResult!5977)

(declare-fun lt!265501 () (_ BitVec 32))

(assert (=> b!584145 (= lt!265499 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265501 vacantSpotIndex!68 (select (arr!17537 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584146 () Bool)

(declare-fun res!371969 () Bool)

(assert (=> b!584146 (=> (not res!371969) (not e!334553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584146 (= res!371969 (validKeyInArray!0 (select (arr!17537 a!2986) j!136)))))

(declare-fun b!584147 () Bool)

(declare-fun res!371958 () Bool)

(assert (=> b!584147 (=> (not res!371958) (not e!334553))))

(assert (=> b!584147 (= res!371958 (validKeyInArray!0 k!1786))))

(declare-fun b!584148 () Bool)

(assert (=> b!584148 (= e!334551 e!334554)))

(declare-fun res!371960 () Bool)

(assert (=> b!584148 (=> (not res!371960) (not e!334554))))

(assert (=> b!584148 (= res!371960 (and (bvsge lt!265501 #b00000000000000000000000000000000) (bvslt lt!265501 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584148 (= lt!265501 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!371968 () Bool)

(assert (=> start!53624 (=> (not res!371968) (not e!334553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53624 (= res!371968 (validMask!0 mask!3053))))

(assert (=> start!53624 e!334553))

(assert (=> start!53624 true))

(declare-fun array_inv!13333 (array!36525) Bool)

(assert (=> start!53624 (array_inv!13333 a!2986)))

(declare-fun b!584149 () Bool)

(declare-fun res!371966 () Bool)

(assert (=> b!584149 (=> (not res!371966) (not e!334551))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584149 (= res!371966 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17537 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17537 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584150 () Bool)

(assert (=> b!584150 (= e!334553 e!334551)))

(declare-fun res!371962 () Bool)

(assert (=> b!584150 (=> (not res!371962) (not e!334551))))

(declare-fun lt!265500 () SeekEntryResult!5977)

(assert (=> b!584150 (= res!371962 (or (= lt!265500 (MissingZero!5977 i!1108)) (= lt!265500 (MissingVacant!5977 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36525 (_ BitVec 32)) SeekEntryResult!5977)

(assert (=> b!584150 (= lt!265500 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584151 () Bool)

(declare-fun res!371961 () Bool)

(assert (=> b!584151 (=> (not res!371961) (not e!334551))))

(assert (=> b!584151 (= res!371961 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17537 a!2986) index!984) (select (arr!17537 a!2986) j!136))) (not (= (select (arr!17537 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584152 () Bool)

(declare-fun res!371965 () Bool)

(assert (=> b!584152 (=> (not res!371965) (not e!334551))))

(declare-datatypes ((List!11578 0))(
  ( (Nil!11575) (Cons!11574 (h!12619 (_ BitVec 64)) (t!17806 List!11578)) )
))
(declare-fun arrayNoDuplicates!0 (array!36525 (_ BitVec 32) List!11578) Bool)

(assert (=> b!584152 (= res!371965 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11575))))

(declare-fun b!584153 () Bool)

(declare-fun res!371963 () Bool)

(assert (=> b!584153 (=> (not res!371963) (not e!334553))))

(assert (=> b!584153 (= res!371963 (and (= (size!17901 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17901 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17901 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53624 res!371968) b!584153))

(assert (= (and b!584153 res!371963) b!584146))

(assert (= (and b!584146 res!371969) b!584147))

(assert (= (and b!584147 res!371958) b!584142))

(assert (= (and b!584142 res!371964) b!584150))

(assert (= (and b!584150 res!371962) b!584143))

(assert (= (and b!584143 res!371959) b!584152))

(assert (= (and b!584152 res!371965) b!584149))

(assert (= (and b!584149 res!371966) b!584144))

(assert (= (and b!584144 res!371967) b!584151))

(assert (= (and b!584151 res!371961) b!584148))

(assert (= (and b!584148 res!371960) b!584145))

(declare-fun m!562529 () Bool)

(assert (=> b!584148 m!562529))

(declare-fun m!562531 () Bool)

(assert (=> b!584151 m!562531))

(declare-fun m!562533 () Bool)

(assert (=> b!584151 m!562533))

(assert (=> b!584146 m!562533))

(assert (=> b!584146 m!562533))

(declare-fun m!562535 () Bool)

(assert (=> b!584146 m!562535))

(declare-fun m!562537 () Bool)

(assert (=> b!584150 m!562537))

(declare-fun m!562539 () Bool)

(assert (=> b!584149 m!562539))

(declare-fun m!562541 () Bool)

(assert (=> b!584149 m!562541))

(declare-fun m!562543 () Bool)

(assert (=> b!584149 m!562543))

(declare-fun m!562545 () Bool)

(assert (=> b!584147 m!562545))

(declare-fun m!562547 () Bool)

(assert (=> b!584142 m!562547))

(declare-fun m!562549 () Bool)

(assert (=> b!584143 m!562549))

(declare-fun m!562551 () Bool)

(assert (=> b!584152 m!562551))

(declare-fun m!562553 () Bool)

(assert (=> start!53624 m!562553))

(declare-fun m!562555 () Bool)

(assert (=> start!53624 m!562555))

(assert (=> b!584144 m!562533))

(assert (=> b!584144 m!562533))

(declare-fun m!562557 () Bool)

(assert (=> b!584144 m!562557))

(assert (=> b!584145 m!562533))

(assert (=> b!584145 m!562533))

(declare-fun m!562559 () Bool)

(assert (=> b!584145 m!562559))

(push 1)

