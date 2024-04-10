; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53684 () Bool)

(assert start!53684)

(declare-fun b!585222 () Bool)

(declare-fun res!373042 () Bool)

(declare-fun e!334911 () Bool)

(assert (=> b!585222 (=> (not res!373042) (not e!334911))))

(declare-datatypes ((array!36585 0))(
  ( (array!36586 (arr!17567 (Array (_ BitVec 32) (_ BitVec 64))) (size!17931 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36585)

(declare-datatypes ((List!11608 0))(
  ( (Nil!11605) (Cons!11604 (h!12649 (_ BitVec 64)) (t!17836 List!11608)) )
))
(declare-fun arrayNoDuplicates!0 (array!36585 (_ BitVec 32) List!11608) Bool)

(assert (=> b!585222 (= res!373042 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11605))))

(declare-fun b!585223 () Bool)

(declare-fun res!373045 () Bool)

(declare-fun e!334912 () Bool)

(assert (=> b!585223 (=> (not res!373045) (not e!334912))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585223 (= res!373045 (and (= (size!17931 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17931 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17931 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585224 () Bool)

(declare-fun res!373038 () Bool)

(assert (=> b!585224 (=> (not res!373038) (not e!334911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36585 (_ BitVec 32)) Bool)

(assert (=> b!585224 (= res!373038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585225 () Bool)

(assert (=> b!585225 (= e!334912 e!334911)))

(declare-fun res!373040 () Bool)

(assert (=> b!585225 (=> (not res!373040) (not e!334911))))

(declare-datatypes ((SeekEntryResult!6007 0))(
  ( (MissingZero!6007 (index!26255 (_ BitVec 32))) (Found!6007 (index!26256 (_ BitVec 32))) (Intermediate!6007 (undefined!6819 Bool) (index!26257 (_ BitVec 32)) (x!55076 (_ BitVec 32))) (Undefined!6007) (MissingVacant!6007 (index!26258 (_ BitVec 32))) )
))
(declare-fun lt!265769 () SeekEntryResult!6007)

(assert (=> b!585225 (= res!373040 (or (= lt!265769 (MissingZero!6007 i!1108)) (= lt!265769 (MissingVacant!6007 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36585 (_ BitVec 32)) SeekEntryResult!6007)

(assert (=> b!585225 (= lt!265769 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585226 () Bool)

(declare-fun res!373044 () Bool)

(assert (=> b!585226 (=> (not res!373044) (not e!334911))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585226 (= res!373044 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17567 a!2986) index!984) (select (arr!17567 a!2986) j!136))) (not (= (select (arr!17567 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585227 () Bool)

(declare-fun res!373041 () Bool)

(assert (=> b!585227 (=> (not res!373041) (not e!334911))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!585227 (= res!373041 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17567 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17567 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585228 () Bool)

(declare-fun res!373049 () Bool)

(assert (=> b!585228 (=> (not res!373049) (not e!334912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585228 (= res!373049 (validKeyInArray!0 (select (arr!17567 a!2986) j!136)))))

(declare-fun b!585229 () Bool)

(declare-fun res!373039 () Bool)

(assert (=> b!585229 (=> (not res!373039) (not e!334911))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36585 (_ BitVec 32)) SeekEntryResult!6007)

(assert (=> b!585229 (= res!373039 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17567 a!2986) j!136) a!2986 mask!3053) (Found!6007 j!136)))))

(declare-fun b!585230 () Bool)

(declare-fun res!373043 () Bool)

(assert (=> b!585230 (=> (not res!373043) (not e!334912))))

(declare-fun arrayContainsKey!0 (array!36585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585230 (= res!373043 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!373046 () Bool)

(assert (=> start!53684 (=> (not res!373046) (not e!334912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53684 (= res!373046 (validMask!0 mask!3053))))

(assert (=> start!53684 e!334912))

(assert (=> start!53684 true))

(declare-fun array_inv!13363 (array!36585) Bool)

(assert (=> start!53684 (array_inv!13363 a!2986)))

(declare-fun b!585231 () Bool)

(declare-fun res!373048 () Bool)

(assert (=> b!585231 (=> (not res!373048) (not e!334912))))

(assert (=> b!585231 (= res!373048 (validKeyInArray!0 k!1786))))

(declare-fun b!585232 () Bool)

(declare-fun e!334913 () Bool)

(assert (=> b!585232 (= e!334911 e!334913)))

(declare-fun res!373047 () Bool)

(assert (=> b!585232 (=> (not res!373047) (not e!334913))))

(declare-fun lt!265771 () (_ BitVec 32))

(assert (=> b!585232 (= res!373047 (and (bvsge lt!265771 #b00000000000000000000000000000000) (bvslt lt!265771 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585232 (= lt!265771 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585233 () Bool)

(assert (=> b!585233 (= e!334913 false)))

(declare-fun lt!265770 () SeekEntryResult!6007)

(assert (=> b!585233 (= lt!265770 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265771 vacantSpotIndex!68 (select (arr!17567 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53684 res!373046) b!585223))

(assert (= (and b!585223 res!373045) b!585228))

(assert (= (and b!585228 res!373049) b!585231))

(assert (= (and b!585231 res!373048) b!585230))

(assert (= (and b!585230 res!373043) b!585225))

(assert (= (and b!585225 res!373040) b!585224))

(assert (= (and b!585224 res!373038) b!585222))

(assert (= (and b!585222 res!373042) b!585227))

(assert (= (and b!585227 res!373041) b!585229))

(assert (= (and b!585229 res!373039) b!585226))

(assert (= (and b!585226 res!373044) b!585232))

(assert (= (and b!585232 res!373047) b!585233))

(declare-fun m!563489 () Bool)

(assert (=> b!585229 m!563489))

(assert (=> b!585229 m!563489))

(declare-fun m!563491 () Bool)

(assert (=> b!585229 m!563491))

(assert (=> b!585233 m!563489))

(assert (=> b!585233 m!563489))

(declare-fun m!563493 () Bool)

(assert (=> b!585233 m!563493))

(declare-fun m!563495 () Bool)

(assert (=> b!585226 m!563495))

(assert (=> b!585226 m!563489))

(declare-fun m!563497 () Bool)

(assert (=> start!53684 m!563497))

(declare-fun m!563499 () Bool)

(assert (=> start!53684 m!563499))

(assert (=> b!585228 m!563489))

(assert (=> b!585228 m!563489))

(declare-fun m!563501 () Bool)

(assert (=> b!585228 m!563501))

(declare-fun m!563503 () Bool)

(assert (=> b!585222 m!563503))

(declare-fun m!563505 () Bool)

(assert (=> b!585230 m!563505))

(declare-fun m!563507 () Bool)

(assert (=> b!585225 m!563507))

(declare-fun m!563509 () Bool)

(assert (=> b!585232 m!563509))

(declare-fun m!563511 () Bool)

(assert (=> b!585224 m!563511))

(declare-fun m!563513 () Bool)

(assert (=> b!585227 m!563513))

(declare-fun m!563515 () Bool)

(assert (=> b!585227 m!563515))

(declare-fun m!563517 () Bool)

(assert (=> b!585227 m!563517))

(declare-fun m!563519 () Bool)

(assert (=> b!585231 m!563519))

(push 1)

(assert (not start!53684))

(assert (not b!585229))

(assert (not b!585225))

(assert (not b!585233))

(assert (not b!585222))

(assert (not b!585224))

(assert (not b!585230))

(assert (not b!585232))

(assert (not b!585231))

(assert (not b!585228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

