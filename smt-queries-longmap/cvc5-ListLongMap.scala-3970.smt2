; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53890 () Bool)

(assert start!53890)

(declare-fun b!587911 () Bool)

(declare-fun res!375547 () Bool)

(declare-fun e!335781 () Bool)

(assert (=> b!587911 (=> (not res!375547) (not e!335781))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587911 (= res!375547 (validKeyInArray!0 k!1786))))

(declare-fun b!587912 () Bool)

(declare-fun res!375549 () Bool)

(declare-fun e!335784 () Bool)

(assert (=> b!587912 (=> (not res!375549) (not e!335784))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36734 0))(
  ( (array!36735 (arr!17640 (Array (_ BitVec 32) (_ BitVec 64))) (size!18004 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36734)

(assert (=> b!587912 (= res!375549 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17640 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17640 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587913 () Bool)

(declare-fun res!375554 () Bool)

(assert (=> b!587913 (=> (not res!375554) (not e!335781))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!587913 (= res!375554 (and (= (size!18004 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18004 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18004 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!375550 () Bool)

(assert (=> start!53890 (=> (not res!375550) (not e!335781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53890 (= res!375550 (validMask!0 mask!3053))))

(assert (=> start!53890 e!335781))

(assert (=> start!53890 true))

(declare-fun array_inv!13436 (array!36734) Bool)

(assert (=> start!53890 (array_inv!13436 a!2986)))

(declare-fun b!587914 () Bool)

(declare-fun res!375552 () Bool)

(assert (=> b!587914 (=> (not res!375552) (not e!335781))))

(assert (=> b!587914 (= res!375552 (validKeyInArray!0 (select (arr!17640 a!2986) j!136)))))

(declare-fun b!587915 () Bool)

(assert (=> b!587915 (= e!335781 e!335784)))

(declare-fun res!375555 () Bool)

(assert (=> b!587915 (=> (not res!375555) (not e!335784))))

(declare-datatypes ((SeekEntryResult!6080 0))(
  ( (MissingZero!6080 (index!26550 (_ BitVec 32))) (Found!6080 (index!26551 (_ BitVec 32))) (Intermediate!6080 (undefined!6892 Bool) (index!26552 (_ BitVec 32)) (x!55358 (_ BitVec 32))) (Undefined!6080) (MissingVacant!6080 (index!26553 (_ BitVec 32))) )
))
(declare-fun lt!266550 () SeekEntryResult!6080)

(assert (=> b!587915 (= res!375555 (or (= lt!266550 (MissingZero!6080 i!1108)) (= lt!266550 (MissingVacant!6080 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36734 (_ BitVec 32)) SeekEntryResult!6080)

(assert (=> b!587915 (= lt!266550 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587916 () Bool)

(declare-fun res!375556 () Bool)

(assert (=> b!587916 (=> (not res!375556) (not e!335784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36734 (_ BitVec 32)) Bool)

(assert (=> b!587916 (= res!375556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587917 () Bool)

(declare-fun res!375557 () Bool)

(assert (=> b!587917 (=> (not res!375557) (not e!335781))))

(declare-fun arrayContainsKey!0 (array!36734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587917 (= res!375557 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587918 () Bool)

(declare-fun e!335783 () Bool)

(declare-fun lt!266553 () SeekEntryResult!6080)

(declare-fun lt!266554 () SeekEntryResult!6080)

(assert (=> b!587918 (= e!335783 (= lt!266553 lt!266554))))

(declare-fun b!587919 () Bool)

(declare-fun e!335780 () Bool)

(assert (=> b!587919 (= e!335784 e!335780)))

(declare-fun res!375553 () Bool)

(assert (=> b!587919 (=> (not res!375553) (not e!335780))))

(assert (=> b!587919 (= res!375553 (and (= lt!266553 (Found!6080 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17640 a!2986) index!984) (select (arr!17640 a!2986) j!136))) (not (= (select (arr!17640 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36734 (_ BitVec 32)) SeekEntryResult!6080)

(assert (=> b!587919 (= lt!266553 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17640 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587920 () Bool)

(declare-fun res!375551 () Bool)

(assert (=> b!587920 (=> (not res!375551) (not e!335784))))

(declare-datatypes ((List!11681 0))(
  ( (Nil!11678) (Cons!11677 (h!12722 (_ BitVec 64)) (t!17909 List!11681)) )
))
(declare-fun arrayNoDuplicates!0 (array!36734 (_ BitVec 32) List!11681) Bool)

(assert (=> b!587920 (= res!375551 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11678))))

(declare-fun b!587921 () Bool)

(assert (=> b!587921 (= e!335780 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(assert (=> b!587921 e!335783))

(declare-fun res!375548 () Bool)

(assert (=> b!587921 (=> (not res!375548) (not e!335783))))

(declare-fun lt!266552 () (_ BitVec 32))

(assert (=> b!587921 (= res!375548 (= lt!266554 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266552 vacantSpotIndex!68 (select (store (arr!17640 a!2986) i!1108 k!1786) j!136) (array!36735 (store (arr!17640 a!2986) i!1108 k!1786) (size!18004 a!2986)) mask!3053)))))

(assert (=> b!587921 (= lt!266554 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266552 vacantSpotIndex!68 (select (arr!17640 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18280 0))(
  ( (Unit!18281) )
))
(declare-fun lt!266551 () Unit!18280)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36734 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18280)

(assert (=> b!587921 (= lt!266551 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266552 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587921 (= lt!266552 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53890 res!375550) b!587913))

(assert (= (and b!587913 res!375554) b!587914))

(assert (= (and b!587914 res!375552) b!587911))

(assert (= (and b!587911 res!375547) b!587917))

(assert (= (and b!587917 res!375557) b!587915))

(assert (= (and b!587915 res!375555) b!587916))

(assert (= (and b!587916 res!375556) b!587920))

(assert (= (and b!587920 res!375551) b!587912))

(assert (= (and b!587912 res!375549) b!587919))

(assert (= (and b!587919 res!375553) b!587921))

(assert (= (and b!587921 res!375548) b!587918))

(declare-fun m!566383 () Bool)

(assert (=> b!587911 m!566383))

(declare-fun m!566385 () Bool)

(assert (=> b!587921 m!566385))

(declare-fun m!566387 () Bool)

(assert (=> b!587921 m!566387))

(declare-fun m!566389 () Bool)

(assert (=> b!587921 m!566389))

(assert (=> b!587921 m!566387))

(declare-fun m!566391 () Bool)

(assert (=> b!587921 m!566391))

(declare-fun m!566393 () Bool)

(assert (=> b!587921 m!566393))

(assert (=> b!587921 m!566385))

(declare-fun m!566395 () Bool)

(assert (=> b!587921 m!566395))

(declare-fun m!566397 () Bool)

(assert (=> b!587921 m!566397))

(declare-fun m!566399 () Bool)

(assert (=> b!587912 m!566399))

(assert (=> b!587912 m!566397))

(declare-fun m!566401 () Bool)

(assert (=> b!587912 m!566401))

(declare-fun m!566403 () Bool)

(assert (=> start!53890 m!566403))

(declare-fun m!566405 () Bool)

(assert (=> start!53890 m!566405))

(declare-fun m!566407 () Bool)

(assert (=> b!587919 m!566407))

(assert (=> b!587919 m!566387))

(assert (=> b!587919 m!566387))

(declare-fun m!566409 () Bool)

(assert (=> b!587919 m!566409))

(assert (=> b!587914 m!566387))

(assert (=> b!587914 m!566387))

(declare-fun m!566411 () Bool)

(assert (=> b!587914 m!566411))

(declare-fun m!566413 () Bool)

(assert (=> b!587920 m!566413))

(declare-fun m!566415 () Bool)

(assert (=> b!587915 m!566415))

(declare-fun m!566417 () Bool)

(assert (=> b!587917 m!566417))

(declare-fun m!566419 () Bool)

(assert (=> b!587916 m!566419))

(push 1)

