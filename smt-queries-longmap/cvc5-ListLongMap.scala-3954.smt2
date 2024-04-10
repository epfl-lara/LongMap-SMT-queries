; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53734 () Bool)

(assert start!53734)

(declare-fun b!586075 () Bool)

(declare-fun e!335165 () Bool)

(assert (=> b!586075 (= e!335165 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36635 0))(
  ( (array!36636 (arr!17592 (Array (_ BitVec 32) (_ BitVec 64))) (size!17956 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36635)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!265996 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6032 0))(
  ( (MissingZero!6032 (index!26355 (_ BitVec 32))) (Found!6032 (index!26356 (_ BitVec 32))) (Intermediate!6032 (undefined!6844 Bool) (index!26357 (_ BitVec 32)) (x!55173 (_ BitVec 32))) (Undefined!6032) (MissingVacant!6032 (index!26358 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36635 (_ BitVec 32)) SeekEntryResult!6032)

(assert (=> b!586075 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265996 vacantSpotIndex!68 (select (arr!17592 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265996 vacantSpotIndex!68 (select (store (arr!17592 a!2986) i!1108 k!1786) j!136) (array!36636 (store (arr!17592 a!2986) i!1108 k!1786) (size!17956 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18184 0))(
  ( (Unit!18185) )
))
(declare-fun lt!265995 () Unit!18184)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36635 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18184)

(assert (=> b!586075 (= lt!265995 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265996 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586075 (= lt!265996 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586076 () Bool)

(declare-fun res!373899 () Bool)

(assert (=> b!586076 (=> (not res!373899) (not e!335165))))

(assert (=> b!586076 (= res!373899 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17592 a!2986) index!984) (select (arr!17592 a!2986) j!136))) (not (= (select (arr!17592 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586077 () Bool)

(declare-fun res!373895 () Bool)

(declare-fun e!335164 () Bool)

(assert (=> b!586077 (=> (not res!373895) (not e!335164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586077 (= res!373895 (validKeyInArray!0 k!1786))))

(declare-fun b!586078 () Bool)

(declare-fun res!373898 () Bool)

(assert (=> b!586078 (=> (not res!373898) (not e!335164))))

(assert (=> b!586078 (= res!373898 (validKeyInArray!0 (select (arr!17592 a!2986) j!136)))))

(declare-fun b!586079 () Bool)

(declare-fun res!373901 () Bool)

(assert (=> b!586079 (=> (not res!373901) (not e!335165))))

(assert (=> b!586079 (= res!373901 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17592 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17592 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586080 () Bool)

(declare-fun res!373897 () Bool)

(assert (=> b!586080 (=> (not res!373897) (not e!335165))))

(declare-datatypes ((List!11633 0))(
  ( (Nil!11630) (Cons!11629 (h!12674 (_ BitVec 64)) (t!17861 List!11633)) )
))
(declare-fun arrayNoDuplicates!0 (array!36635 (_ BitVec 32) List!11633) Bool)

(assert (=> b!586080 (= res!373897 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11630))))

(declare-fun b!586081 () Bool)

(declare-fun res!373896 () Bool)

(assert (=> b!586081 (=> (not res!373896) (not e!335165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36635 (_ BitVec 32)) Bool)

(assert (=> b!586081 (= res!373896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!373894 () Bool)

(assert (=> start!53734 (=> (not res!373894) (not e!335164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53734 (= res!373894 (validMask!0 mask!3053))))

(assert (=> start!53734 e!335164))

(assert (=> start!53734 true))

(declare-fun array_inv!13388 (array!36635) Bool)

(assert (=> start!53734 (array_inv!13388 a!2986)))

(declare-fun b!586082 () Bool)

(declare-fun res!373892 () Bool)

(assert (=> b!586082 (=> (not res!373892) (not e!335164))))

(declare-fun arrayContainsKey!0 (array!36635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586082 (= res!373892 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586083 () Bool)

(assert (=> b!586083 (= e!335164 e!335165)))

(declare-fun res!373893 () Bool)

(assert (=> b!586083 (=> (not res!373893) (not e!335165))))

(declare-fun lt!265994 () SeekEntryResult!6032)

(assert (=> b!586083 (= res!373893 (or (= lt!265994 (MissingZero!6032 i!1108)) (= lt!265994 (MissingVacant!6032 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36635 (_ BitVec 32)) SeekEntryResult!6032)

(assert (=> b!586083 (= lt!265994 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586084 () Bool)

(declare-fun res!373891 () Bool)

(assert (=> b!586084 (=> (not res!373891) (not e!335165))))

(assert (=> b!586084 (= res!373891 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17592 a!2986) j!136) a!2986 mask!3053) (Found!6032 j!136)))))

(declare-fun b!586085 () Bool)

(declare-fun res!373900 () Bool)

(assert (=> b!586085 (=> (not res!373900) (not e!335164))))

(assert (=> b!586085 (= res!373900 (and (= (size!17956 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17956 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17956 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53734 res!373894) b!586085))

(assert (= (and b!586085 res!373900) b!586078))

(assert (= (and b!586078 res!373898) b!586077))

(assert (= (and b!586077 res!373895) b!586082))

(assert (= (and b!586082 res!373892) b!586083))

(assert (= (and b!586083 res!373893) b!586081))

(assert (= (and b!586081 res!373896) b!586080))

(assert (= (and b!586080 res!373897) b!586079))

(assert (= (and b!586079 res!373901) b!586084))

(assert (= (and b!586084 res!373891) b!586076))

(assert (= (and b!586076 res!373899) b!586075))

(declare-fun m!564379 () Bool)

(assert (=> b!586083 m!564379))

(declare-fun m!564381 () Bool)

(assert (=> b!586078 m!564381))

(assert (=> b!586078 m!564381))

(declare-fun m!564383 () Bool)

(assert (=> b!586078 m!564383))

(declare-fun m!564385 () Bool)

(assert (=> b!586079 m!564385))

(declare-fun m!564387 () Bool)

(assert (=> b!586079 m!564387))

(declare-fun m!564389 () Bool)

(assert (=> b!586079 m!564389))

(declare-fun m!564391 () Bool)

(assert (=> b!586077 m!564391))

(declare-fun m!564393 () Bool)

(assert (=> b!586080 m!564393))

(declare-fun m!564395 () Bool)

(assert (=> start!53734 m!564395))

(declare-fun m!564397 () Bool)

(assert (=> start!53734 m!564397))

(declare-fun m!564399 () Bool)

(assert (=> b!586075 m!564399))

(declare-fun m!564401 () Bool)

(assert (=> b!586075 m!564401))

(assert (=> b!586075 m!564381))

(assert (=> b!586075 m!564387))

(assert (=> b!586075 m!564401))

(declare-fun m!564403 () Bool)

(assert (=> b!586075 m!564403))

(declare-fun m!564405 () Bool)

(assert (=> b!586075 m!564405))

(assert (=> b!586075 m!564381))

(declare-fun m!564407 () Bool)

(assert (=> b!586075 m!564407))

(declare-fun m!564409 () Bool)

(assert (=> b!586081 m!564409))

(declare-fun m!564411 () Bool)

(assert (=> b!586082 m!564411))

(declare-fun m!564413 () Bool)

(assert (=> b!586076 m!564413))

(assert (=> b!586076 m!564381))

(assert (=> b!586084 m!564381))

(assert (=> b!586084 m!564381))

(declare-fun m!564415 () Bool)

(assert (=> b!586084 m!564415))

(push 1)

