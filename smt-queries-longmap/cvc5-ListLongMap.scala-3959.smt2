; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53764 () Bool)

(assert start!53764)

(declare-fun b!586570 () Bool)

(declare-fun res!374393 () Bool)

(declare-fun e!335299 () Bool)

(assert (=> b!586570 (=> (not res!374393) (not e!335299))))

(declare-datatypes ((array!36665 0))(
  ( (array!36666 (arr!17607 (Array (_ BitVec 32) (_ BitVec 64))) (size!17971 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36665)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36665 (_ BitVec 32)) Bool)

(assert (=> b!586570 (= res!374393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586571 () Bool)

(declare-fun res!374396 () Bool)

(assert (=> b!586571 (=> (not res!374396) (not e!335299))))

(declare-datatypes ((List!11648 0))(
  ( (Nil!11645) (Cons!11644 (h!12689 (_ BitVec 64)) (t!17876 List!11648)) )
))
(declare-fun arrayNoDuplicates!0 (array!36665 (_ BitVec 32) List!11648) Bool)

(assert (=> b!586571 (= res!374396 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11645))))

(declare-fun b!586572 () Bool)

(declare-fun e!335301 () Bool)

(assert (=> b!586572 (= e!335301 e!335299)))

(declare-fun res!374395 () Bool)

(assert (=> b!586572 (=> (not res!374395) (not e!335299))))

(declare-datatypes ((SeekEntryResult!6047 0))(
  ( (MissingZero!6047 (index!26415 (_ BitVec 32))) (Found!6047 (index!26416 (_ BitVec 32))) (Intermediate!6047 (undefined!6859 Bool) (index!26417 (_ BitVec 32)) (x!55228 (_ BitVec 32))) (Undefined!6047) (MissingVacant!6047 (index!26418 (_ BitVec 32))) )
))
(declare-fun lt!266130 () SeekEntryResult!6047)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586572 (= res!374395 (or (= lt!266130 (MissingZero!6047 i!1108)) (= lt!266130 (MissingVacant!6047 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36665 (_ BitVec 32)) SeekEntryResult!6047)

(assert (=> b!586572 (= lt!266130 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586573 () Bool)

(declare-fun res!374390 () Bool)

(assert (=> b!586573 (=> (not res!374390) (not e!335299))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586573 (= res!374390 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17607 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17607 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586574 () Bool)

(declare-fun res!374394 () Bool)

(assert (=> b!586574 (=> (not res!374394) (not e!335301))))

(declare-fun arrayContainsKey!0 (array!36665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586574 (= res!374394 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586575 () Bool)

(declare-fun res!374389 () Bool)

(assert (=> b!586575 (=> (not res!374389) (not e!335299))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36665 (_ BitVec 32)) SeekEntryResult!6047)

(assert (=> b!586575 (= res!374389 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17607 a!2986) j!136) a!2986 mask!3053) (Found!6047 j!136)))))

(declare-fun b!586576 () Bool)

(declare-fun res!374386 () Bool)

(assert (=> b!586576 (=> (not res!374386) (not e!335299))))

(assert (=> b!586576 (= res!374386 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17607 a!2986) index!984) (select (arr!17607 a!2986) j!136))) (not (= (select (arr!17607 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586577 () Bool)

(declare-fun res!374391 () Bool)

(assert (=> b!586577 (=> (not res!374391) (not e!335301))))

(assert (=> b!586577 (= res!374391 (and (= (size!17971 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17971 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17971 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586578 () Bool)

(declare-fun res!374388 () Bool)

(assert (=> b!586578 (=> (not res!374388) (not e!335301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586578 (= res!374388 (validKeyInArray!0 k!1786))))

(declare-fun b!586579 () Bool)

(assert (=> b!586579 (= e!335299 (not true))))

(declare-fun lt!266129 () (_ BitVec 32))

(assert (=> b!586579 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266129 vacantSpotIndex!68 (select (arr!17607 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266129 vacantSpotIndex!68 (select (store (arr!17607 a!2986) i!1108 k!1786) j!136) (array!36666 (store (arr!17607 a!2986) i!1108 k!1786) (size!17971 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18214 0))(
  ( (Unit!18215) )
))
(declare-fun lt!266131 () Unit!18214)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18214)

(assert (=> b!586579 (= lt!266131 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266129 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586579 (= lt!266129 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586580 () Bool)

(declare-fun res!374387 () Bool)

(assert (=> b!586580 (=> (not res!374387) (not e!335301))))

(assert (=> b!586580 (= res!374387 (validKeyInArray!0 (select (arr!17607 a!2986) j!136)))))

(declare-fun res!374392 () Bool)

(assert (=> start!53764 (=> (not res!374392) (not e!335301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53764 (= res!374392 (validMask!0 mask!3053))))

(assert (=> start!53764 e!335301))

(assert (=> start!53764 true))

(declare-fun array_inv!13403 (array!36665) Bool)

(assert (=> start!53764 (array_inv!13403 a!2986)))

(assert (= (and start!53764 res!374392) b!586577))

(assert (= (and b!586577 res!374391) b!586580))

(assert (= (and b!586580 res!374387) b!586578))

(assert (= (and b!586578 res!374388) b!586574))

(assert (= (and b!586574 res!374394) b!586572))

(assert (= (and b!586572 res!374395) b!586570))

(assert (= (and b!586570 res!374393) b!586571))

(assert (= (and b!586571 res!374396) b!586573))

(assert (= (and b!586573 res!374390) b!586575))

(assert (= (and b!586575 res!374389) b!586576))

(assert (= (and b!586576 res!374386) b!586579))

(declare-fun m!564949 () Bool)

(assert (=> b!586580 m!564949))

(assert (=> b!586580 m!564949))

(declare-fun m!564951 () Bool)

(assert (=> b!586580 m!564951))

(declare-fun m!564953 () Bool)

(assert (=> b!586579 m!564953))

(declare-fun m!564955 () Bool)

(assert (=> b!586579 m!564955))

(assert (=> b!586579 m!564949))

(declare-fun m!564957 () Bool)

(assert (=> b!586579 m!564957))

(declare-fun m!564959 () Bool)

(assert (=> b!586579 m!564959))

(assert (=> b!586579 m!564949))

(declare-fun m!564961 () Bool)

(assert (=> b!586579 m!564961))

(assert (=> b!586579 m!564955))

(declare-fun m!564963 () Bool)

(assert (=> b!586579 m!564963))

(assert (=> b!586575 m!564949))

(assert (=> b!586575 m!564949))

(declare-fun m!564965 () Bool)

(assert (=> b!586575 m!564965))

(declare-fun m!564967 () Bool)

(assert (=> b!586570 m!564967))

(declare-fun m!564969 () Bool)

(assert (=> b!586571 m!564969))

(declare-fun m!564971 () Bool)

(assert (=> b!586576 m!564971))

(assert (=> b!586576 m!564949))

(declare-fun m!564973 () Bool)

(assert (=> b!586574 m!564973))

(declare-fun m!564975 () Bool)

(assert (=> b!586578 m!564975))

(declare-fun m!564977 () Bool)

(assert (=> b!586572 m!564977))

(declare-fun m!564979 () Bool)

(assert (=> start!53764 m!564979))

(declare-fun m!564981 () Bool)

(assert (=> start!53764 m!564981))

(declare-fun m!564983 () Bool)

(assert (=> b!586573 m!564983))

(assert (=> b!586573 m!564957))

(declare-fun m!564985 () Bool)

(assert (=> b!586573 m!564985))

(push 1)

(assert (not b!586578))

(assert (not b!586579))

(assert (not start!53764))

(assert (not b!586572))

(assert (not b!586575))

(assert (not b!586571))

(assert (not b!586580))

(assert (not b!586570))

(assert (not b!586574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

