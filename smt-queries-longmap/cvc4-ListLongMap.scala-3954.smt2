; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53738 () Bool)

(assert start!53738)

(declare-fun b!586141 () Bool)

(declare-fun res!373964 () Bool)

(declare-fun e!335184 () Bool)

(assert (=> b!586141 (=> (not res!373964) (not e!335184))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36639 0))(
  ( (array!36640 (arr!17594 (Array (_ BitVec 32) (_ BitVec 64))) (size!17958 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36639)

(declare-datatypes ((SeekEntryResult!6034 0))(
  ( (MissingZero!6034 (index!26363 (_ BitVec 32))) (Found!6034 (index!26364 (_ BitVec 32))) (Intermediate!6034 (undefined!6846 Bool) (index!26365 (_ BitVec 32)) (x!55175 (_ BitVec 32))) (Undefined!6034) (MissingVacant!6034 (index!26366 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36639 (_ BitVec 32)) SeekEntryResult!6034)

(assert (=> b!586141 (= res!373964 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17594 a!2986) j!136) a!2986 mask!3053) (Found!6034 j!136)))))

(declare-fun res!373965 () Bool)

(declare-fun e!335183 () Bool)

(assert (=> start!53738 (=> (not res!373965) (not e!335183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53738 (= res!373965 (validMask!0 mask!3053))))

(assert (=> start!53738 e!335183))

(assert (=> start!53738 true))

(declare-fun array_inv!13390 (array!36639) Bool)

(assert (=> start!53738 (array_inv!13390 a!2986)))

(declare-fun b!586142 () Bool)

(assert (=> b!586142 (= e!335184 (not true))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!266014 () (_ BitVec 32))

(assert (=> b!586142 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266014 vacantSpotIndex!68 (select (arr!17594 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266014 vacantSpotIndex!68 (select (store (arr!17594 a!2986) i!1108 k!1786) j!136) (array!36640 (store (arr!17594 a!2986) i!1108 k!1786) (size!17958 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18188 0))(
  ( (Unit!18189) )
))
(declare-fun lt!266012 () Unit!18188)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36639 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18188)

(assert (=> b!586142 (= lt!266012 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266014 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586142 (= lt!266014 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586143 () Bool)

(declare-fun res!373967 () Bool)

(assert (=> b!586143 (=> (not res!373967) (not e!335184))))

(declare-datatypes ((List!11635 0))(
  ( (Nil!11632) (Cons!11631 (h!12676 (_ BitVec 64)) (t!17863 List!11635)) )
))
(declare-fun arrayNoDuplicates!0 (array!36639 (_ BitVec 32) List!11635) Bool)

(assert (=> b!586143 (= res!373967 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11632))))

(declare-fun b!586144 () Bool)

(assert (=> b!586144 (= e!335183 e!335184)))

(declare-fun res!373961 () Bool)

(assert (=> b!586144 (=> (not res!373961) (not e!335184))))

(declare-fun lt!266013 () SeekEntryResult!6034)

(assert (=> b!586144 (= res!373961 (or (= lt!266013 (MissingZero!6034 i!1108)) (= lt!266013 (MissingVacant!6034 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36639 (_ BitVec 32)) SeekEntryResult!6034)

(assert (=> b!586144 (= lt!266013 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586145 () Bool)

(declare-fun res!373959 () Bool)

(assert (=> b!586145 (=> (not res!373959) (not e!335183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586145 (= res!373959 (validKeyInArray!0 k!1786))))

(declare-fun b!586146 () Bool)

(declare-fun res!373957 () Bool)

(assert (=> b!586146 (=> (not res!373957) (not e!335183))))

(assert (=> b!586146 (= res!373957 (and (= (size!17958 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17958 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17958 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586147 () Bool)

(declare-fun res!373958 () Bool)

(assert (=> b!586147 (=> (not res!373958) (not e!335184))))

(assert (=> b!586147 (= res!373958 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17594 a!2986) index!984) (select (arr!17594 a!2986) j!136))) (not (= (select (arr!17594 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586148 () Bool)

(declare-fun res!373966 () Bool)

(assert (=> b!586148 (=> (not res!373966) (not e!335184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36639 (_ BitVec 32)) Bool)

(assert (=> b!586148 (= res!373966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586149 () Bool)

(declare-fun res!373963 () Bool)

(assert (=> b!586149 (=> (not res!373963) (not e!335184))))

(assert (=> b!586149 (= res!373963 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17594 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17594 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586150 () Bool)

(declare-fun res!373960 () Bool)

(assert (=> b!586150 (=> (not res!373960) (not e!335183))))

(declare-fun arrayContainsKey!0 (array!36639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586150 (= res!373960 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586151 () Bool)

(declare-fun res!373962 () Bool)

(assert (=> b!586151 (=> (not res!373962) (not e!335183))))

(assert (=> b!586151 (= res!373962 (validKeyInArray!0 (select (arr!17594 a!2986) j!136)))))

(assert (= (and start!53738 res!373965) b!586146))

(assert (= (and b!586146 res!373957) b!586151))

(assert (= (and b!586151 res!373962) b!586145))

(assert (= (and b!586145 res!373959) b!586150))

(assert (= (and b!586150 res!373960) b!586144))

(assert (= (and b!586144 res!373961) b!586148))

(assert (= (and b!586148 res!373966) b!586143))

(assert (= (and b!586143 res!373967) b!586149))

(assert (= (and b!586149 res!373963) b!586141))

(assert (= (and b!586141 res!373964) b!586147))

(assert (= (and b!586147 res!373958) b!586142))

(declare-fun m!564455 () Bool)

(assert (=> start!53738 m!564455))

(declare-fun m!564457 () Bool)

(assert (=> start!53738 m!564457))

(declare-fun m!564459 () Bool)

(assert (=> b!586145 m!564459))

(declare-fun m!564461 () Bool)

(assert (=> b!586149 m!564461))

(declare-fun m!564463 () Bool)

(assert (=> b!586149 m!564463))

(declare-fun m!564465 () Bool)

(assert (=> b!586149 m!564465))

(declare-fun m!564467 () Bool)

(assert (=> b!586144 m!564467))

(declare-fun m!564469 () Bool)

(assert (=> b!586141 m!564469))

(assert (=> b!586141 m!564469))

(declare-fun m!564471 () Bool)

(assert (=> b!586141 m!564471))

(declare-fun m!564473 () Bool)

(assert (=> b!586148 m!564473))

(declare-fun m!564475 () Bool)

(assert (=> b!586147 m!564475))

(assert (=> b!586147 m!564469))

(declare-fun m!564477 () Bool)

(assert (=> b!586143 m!564477))

(declare-fun m!564479 () Bool)

(assert (=> b!586142 m!564479))

(declare-fun m!564481 () Bool)

(assert (=> b!586142 m!564481))

(assert (=> b!586142 m!564469))

(assert (=> b!586142 m!564463))

(assert (=> b!586142 m!564469))

(declare-fun m!564483 () Bool)

(assert (=> b!586142 m!564483))

(assert (=> b!586142 m!564481))

(declare-fun m!564485 () Bool)

(assert (=> b!586142 m!564485))

(declare-fun m!564487 () Bool)

(assert (=> b!586142 m!564487))

(declare-fun m!564489 () Bool)

(assert (=> b!586150 m!564489))

(assert (=> b!586151 m!564469))

(assert (=> b!586151 m!564469))

(declare-fun m!564491 () Bool)

(assert (=> b!586151 m!564491))

(push 1)

(assert (not b!586141))

(assert (not b!586151))

(assert (not b!586148))

