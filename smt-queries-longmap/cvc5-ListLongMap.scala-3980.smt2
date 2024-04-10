; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53950 () Bool)

(assert start!53950)

(declare-fun b!588997 () Bool)

(declare-fun e!336301 () Bool)

(assert (=> b!588997 (= e!336301 (not true))))

(declare-datatypes ((Unit!18358 0))(
  ( (Unit!18359) )
))
(declare-fun lt!267090 () Unit!18358)

(declare-fun e!336299 () Unit!18358)

(assert (=> b!588997 (= lt!267090 e!336299)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!267093 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun c!66578 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36794 0))(
  ( (array!36795 (arr!17670 (Array (_ BitVec 32) (_ BitVec 64))) (size!18034 (_ BitVec 32))) )
))
(declare-fun lt!267089 () array!36794)

(declare-datatypes ((SeekEntryResult!6110 0))(
  ( (MissingZero!6110 (index!26670 (_ BitVec 32))) (Found!6110 (index!26671 (_ BitVec 32))) (Intermediate!6110 (undefined!6922 Bool) (index!26672 (_ BitVec 32)) (x!55468 (_ BitVec 32))) (Undefined!6110) (MissingVacant!6110 (index!26673 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36794 (_ BitVec 32)) SeekEntryResult!6110)

(assert (=> b!588997 (= c!66578 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267093 lt!267089 mask!3053) Undefined!6110))))

(declare-fun e!336298 () Bool)

(assert (=> b!588997 e!336298))

(declare-fun res!376575 () Bool)

(assert (=> b!588997 (=> (not res!376575) (not e!336298))))

(declare-fun lt!267094 () (_ BitVec 32))

(declare-fun lt!267092 () SeekEntryResult!6110)

(assert (=> b!588997 (= res!376575 (= lt!267092 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267094 vacantSpotIndex!68 lt!267093 lt!267089 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!36794)

(assert (=> b!588997 (= lt!267092 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267094 vacantSpotIndex!68 (select (arr!17670 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!588997 (= lt!267093 (select (store (arr!17670 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267091 () Unit!18358)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36794 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18358)

(assert (=> b!588997 (= lt!267091 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267094 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588997 (= lt!267094 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588998 () Bool)

(declare-fun e!336297 () Bool)

(assert (=> b!588998 (= e!336297 e!336301)))

(declare-fun res!376578 () Bool)

(assert (=> b!588998 (=> (not res!376578) (not e!336301))))

(declare-fun lt!267087 () SeekEntryResult!6110)

(assert (=> b!588998 (= res!376578 (and (= lt!267087 (Found!6110 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17670 a!2986) index!984) (select (arr!17670 a!2986) j!136))) (not (= (select (arr!17670 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588998 (= lt!267087 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17670 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588999 () Bool)

(declare-fun res!376584 () Bool)

(declare-fun e!336303 () Bool)

(assert (=> b!588999 (=> (not res!376584) (not e!336303))))

(assert (=> b!588999 (= res!376584 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17670 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589000 () Bool)

(declare-fun res!376577 () Bool)

(declare-fun e!336302 () Bool)

(assert (=> b!589000 (=> (not res!376577) (not e!336302))))

(declare-fun arrayContainsKey!0 (array!36794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589000 (= res!376577 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!376581 () Bool)

(assert (=> start!53950 (=> (not res!376581) (not e!336302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53950 (= res!376581 (validMask!0 mask!3053))))

(assert (=> start!53950 e!336302))

(assert (=> start!53950 true))

(declare-fun array_inv!13466 (array!36794) Bool)

(assert (=> start!53950 (array_inv!13466 a!2986)))

(declare-fun b!589001 () Bool)

(assert (=> b!589001 (= e!336302 e!336303)))

(declare-fun res!376579 () Bool)

(assert (=> b!589001 (=> (not res!376579) (not e!336303))))

(declare-fun lt!267088 () SeekEntryResult!6110)

(assert (=> b!589001 (= res!376579 (or (= lt!267088 (MissingZero!6110 i!1108)) (= lt!267088 (MissingVacant!6110 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36794 (_ BitVec 32)) SeekEntryResult!6110)

(assert (=> b!589001 (= lt!267088 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589002 () Bool)

(declare-fun res!376586 () Bool)

(assert (=> b!589002 (=> (not res!376586) (not e!336302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589002 (= res!376586 (validKeyInArray!0 (select (arr!17670 a!2986) j!136)))))

(declare-fun b!589003 () Bool)

(declare-fun res!376576 () Bool)

(assert (=> b!589003 (=> (not res!376576) (not e!336302))))

(assert (=> b!589003 (= res!376576 (and (= (size!18034 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18034 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18034 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589004 () Bool)

(declare-fun res!376580 () Bool)

(assert (=> b!589004 (=> (not res!376580) (not e!336302))))

(assert (=> b!589004 (= res!376580 (validKeyInArray!0 k!1786))))

(declare-fun b!589005 () Bool)

(declare-fun Unit!18360 () Unit!18358)

(assert (=> b!589005 (= e!336299 Unit!18360)))

(declare-fun b!589006 () Bool)

(declare-fun Unit!18361 () Unit!18358)

(assert (=> b!589006 (= e!336299 Unit!18361)))

(assert (=> b!589006 false))

(declare-fun b!589007 () Bool)

(assert (=> b!589007 (= e!336303 e!336297)))

(declare-fun res!376585 () Bool)

(assert (=> b!589007 (=> (not res!376585) (not e!336297))))

(assert (=> b!589007 (= res!376585 (= (select (store (arr!17670 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589007 (= lt!267089 (array!36795 (store (arr!17670 a!2986) i!1108 k!1786) (size!18034 a!2986)))))

(declare-fun b!589008 () Bool)

(declare-fun res!376582 () Bool)

(assert (=> b!589008 (=> (not res!376582) (not e!336303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36794 (_ BitVec 32)) Bool)

(assert (=> b!589008 (= res!376582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589009 () Bool)

(declare-fun res!376583 () Bool)

(assert (=> b!589009 (=> (not res!376583) (not e!336303))))

(declare-datatypes ((List!11711 0))(
  ( (Nil!11708) (Cons!11707 (h!12752 (_ BitVec 64)) (t!17939 List!11711)) )
))
(declare-fun arrayNoDuplicates!0 (array!36794 (_ BitVec 32) List!11711) Bool)

(assert (=> b!589009 (= res!376583 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11708))))

(declare-fun b!589010 () Bool)

(assert (=> b!589010 (= e!336298 (= lt!267087 lt!267092))))

(assert (= (and start!53950 res!376581) b!589003))

(assert (= (and b!589003 res!376576) b!589002))

(assert (= (and b!589002 res!376586) b!589004))

(assert (= (and b!589004 res!376580) b!589000))

(assert (= (and b!589000 res!376577) b!589001))

(assert (= (and b!589001 res!376579) b!589008))

(assert (= (and b!589008 res!376582) b!589009))

(assert (= (and b!589009 res!376583) b!588999))

(assert (= (and b!588999 res!376584) b!589007))

(assert (= (and b!589007 res!376585) b!588998))

(assert (= (and b!588998 res!376578) b!588997))

(assert (= (and b!588997 res!376575) b!589010))

(assert (= (and b!588997 c!66578) b!589006))

(assert (= (and b!588997 (not c!66578)) b!589005))

(declare-fun m!567547 () Bool)

(assert (=> b!589000 m!567547))

(declare-fun m!567549 () Bool)

(assert (=> b!589009 m!567549))

(declare-fun m!567551 () Bool)

(assert (=> b!588999 m!567551))

(declare-fun m!567553 () Bool)

(assert (=> b!589001 m!567553))

(declare-fun m!567555 () Bool)

(assert (=> b!588998 m!567555))

(declare-fun m!567557 () Bool)

(assert (=> b!588998 m!567557))

(assert (=> b!588998 m!567557))

(declare-fun m!567559 () Bool)

(assert (=> b!588998 m!567559))

(declare-fun m!567561 () Bool)

(assert (=> b!589004 m!567561))

(assert (=> b!589002 m!567557))

(assert (=> b!589002 m!567557))

(declare-fun m!567563 () Bool)

(assert (=> b!589002 m!567563))

(declare-fun m!567565 () Bool)

(assert (=> b!588997 m!567565))

(declare-fun m!567567 () Bool)

(assert (=> b!588997 m!567567))

(declare-fun m!567569 () Bool)

(assert (=> b!588997 m!567569))

(assert (=> b!588997 m!567557))

(declare-fun m!567571 () Bool)

(assert (=> b!588997 m!567571))

(declare-fun m!567573 () Bool)

(assert (=> b!588997 m!567573))

(declare-fun m!567575 () Bool)

(assert (=> b!588997 m!567575))

(assert (=> b!588997 m!567557))

(declare-fun m!567577 () Bool)

(assert (=> b!588997 m!567577))

(declare-fun m!567579 () Bool)

(assert (=> start!53950 m!567579))

(declare-fun m!567581 () Bool)

(assert (=> start!53950 m!567581))

(declare-fun m!567583 () Bool)

(assert (=> b!589008 m!567583))

(assert (=> b!589007 m!567571))

(declare-fun m!567585 () Bool)

(assert (=> b!589007 m!567585))

(push 1)

