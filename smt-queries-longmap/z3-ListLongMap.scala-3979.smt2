; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53946 () Bool)

(assert start!53946)

(declare-fun b!588913 () Bool)

(declare-fun res!376503 () Bool)

(declare-fun e!336257 () Bool)

(assert (=> b!588913 (=> (not res!376503) (not e!336257))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588913 (= res!376503 (validKeyInArray!0 k0!1786))))

(declare-fun b!588914 () Bool)

(declare-fun res!376509 () Bool)

(assert (=> b!588914 (=> (not res!376509) (not e!336257))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36790 0))(
  ( (array!36791 (arr!17668 (Array (_ BitVec 32) (_ BitVec 64))) (size!18032 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36790)

(assert (=> b!588914 (= res!376509 (and (= (size!18032 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18032 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18032 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588915 () Bool)

(declare-fun res!376510 () Bool)

(assert (=> b!588915 (=> (not res!376510) (not e!336257))))

(declare-fun arrayContainsKey!0 (array!36790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588915 (= res!376510 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588916 () Bool)

(declare-fun res!376511 () Bool)

(declare-fun e!336260 () Bool)

(assert (=> b!588916 (=> (not res!376511) (not e!336260))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588916 (= res!376511 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17668 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588917 () Bool)

(declare-datatypes ((Unit!18350 0))(
  ( (Unit!18351) )
))
(declare-fun e!336259 () Unit!18350)

(declare-fun Unit!18352 () Unit!18350)

(assert (=> b!588917 (= e!336259 Unit!18352)))

(assert (=> b!588917 false))

(declare-fun res!376504 () Bool)

(assert (=> start!53946 (=> (not res!376504) (not e!336257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53946 (= res!376504 (validMask!0 mask!3053))))

(assert (=> start!53946 e!336257))

(assert (=> start!53946 true))

(declare-fun array_inv!13464 (array!36790) Bool)

(assert (=> start!53946 (array_inv!13464 a!2986)))

(declare-fun b!588918 () Bool)

(declare-fun e!336256 () Bool)

(declare-fun e!336261 () Bool)

(assert (=> b!588918 (= e!336256 e!336261)))

(declare-fun res!376505 () Bool)

(assert (=> b!588918 (=> (not res!376505) (not e!336261))))

(declare-datatypes ((SeekEntryResult!6108 0))(
  ( (MissingZero!6108 (index!26662 (_ BitVec 32))) (Found!6108 (index!26663 (_ BitVec 32))) (Intermediate!6108 (undefined!6920 Bool) (index!26664 (_ BitVec 32)) (x!55458 (_ BitVec 32))) (Undefined!6108) (MissingVacant!6108 (index!26665 (_ BitVec 32))) )
))
(declare-fun lt!267040 () SeekEntryResult!6108)

(assert (=> b!588918 (= res!376505 (and (= lt!267040 (Found!6108 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17668 a!2986) index!984) (select (arr!17668 a!2986) j!136))) (not (= (select (arr!17668 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36790 (_ BitVec 32)) SeekEntryResult!6108)

(assert (=> b!588918 (= lt!267040 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17668 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588919 () Bool)

(declare-fun Unit!18353 () Unit!18350)

(assert (=> b!588919 (= e!336259 Unit!18353)))

(declare-fun b!588920 () Bool)

(declare-fun e!336258 () Bool)

(declare-fun lt!267043 () SeekEntryResult!6108)

(assert (=> b!588920 (= e!336258 (= lt!267040 lt!267043))))

(declare-fun b!588921 () Bool)

(declare-fun res!376514 () Bool)

(assert (=> b!588921 (=> (not res!376514) (not e!336257))))

(assert (=> b!588921 (= res!376514 (validKeyInArray!0 (select (arr!17668 a!2986) j!136)))))

(declare-fun b!588922 () Bool)

(assert (=> b!588922 (= e!336261 (not true))))

(declare-fun lt!267044 () Unit!18350)

(assert (=> b!588922 (= lt!267044 e!336259)))

(declare-fun lt!267039 () (_ BitVec 64))

(declare-fun lt!267046 () array!36790)

(declare-fun c!66572 () Bool)

(assert (=> b!588922 (= c!66572 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267039 lt!267046 mask!3053) Undefined!6108))))

(assert (=> b!588922 e!336258))

(declare-fun res!376507 () Bool)

(assert (=> b!588922 (=> (not res!376507) (not e!336258))))

(declare-fun lt!267045 () (_ BitVec 32))

(assert (=> b!588922 (= res!376507 (= lt!267043 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267045 vacantSpotIndex!68 lt!267039 lt!267046 mask!3053)))))

(assert (=> b!588922 (= lt!267043 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267045 vacantSpotIndex!68 (select (arr!17668 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!588922 (= lt!267039 (select (store (arr!17668 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267041 () Unit!18350)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36790 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18350)

(assert (=> b!588922 (= lt!267041 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267045 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588922 (= lt!267045 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588923 () Bool)

(declare-fun res!376513 () Bool)

(assert (=> b!588923 (=> (not res!376513) (not e!336260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36790 (_ BitVec 32)) Bool)

(assert (=> b!588923 (= res!376513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588924 () Bool)

(assert (=> b!588924 (= e!336257 e!336260)))

(declare-fun res!376506 () Bool)

(assert (=> b!588924 (=> (not res!376506) (not e!336260))))

(declare-fun lt!267042 () SeekEntryResult!6108)

(assert (=> b!588924 (= res!376506 (or (= lt!267042 (MissingZero!6108 i!1108)) (= lt!267042 (MissingVacant!6108 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36790 (_ BitVec 32)) SeekEntryResult!6108)

(assert (=> b!588924 (= lt!267042 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588925 () Bool)

(assert (=> b!588925 (= e!336260 e!336256)))

(declare-fun res!376508 () Bool)

(assert (=> b!588925 (=> (not res!376508) (not e!336256))))

(assert (=> b!588925 (= res!376508 (= (select (store (arr!17668 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!588925 (= lt!267046 (array!36791 (store (arr!17668 a!2986) i!1108 k0!1786) (size!18032 a!2986)))))

(declare-fun b!588926 () Bool)

(declare-fun res!376512 () Bool)

(assert (=> b!588926 (=> (not res!376512) (not e!336260))))

(declare-datatypes ((List!11709 0))(
  ( (Nil!11706) (Cons!11705 (h!12750 (_ BitVec 64)) (t!17937 List!11709)) )
))
(declare-fun arrayNoDuplicates!0 (array!36790 (_ BitVec 32) List!11709) Bool)

(assert (=> b!588926 (= res!376512 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11706))))

(assert (= (and start!53946 res!376504) b!588914))

(assert (= (and b!588914 res!376509) b!588921))

(assert (= (and b!588921 res!376514) b!588913))

(assert (= (and b!588913 res!376503) b!588915))

(assert (= (and b!588915 res!376510) b!588924))

(assert (= (and b!588924 res!376506) b!588923))

(assert (= (and b!588923 res!376513) b!588926))

(assert (= (and b!588926 res!376512) b!588916))

(assert (= (and b!588916 res!376511) b!588925))

(assert (= (and b!588925 res!376508) b!588918))

(assert (= (and b!588918 res!376505) b!588922))

(assert (= (and b!588922 res!376507) b!588920))

(assert (= (and b!588922 c!66572) b!588917))

(assert (= (and b!588922 (not c!66572)) b!588919))

(declare-fun m!567467 () Bool)

(assert (=> b!588922 m!567467))

(declare-fun m!567469 () Bool)

(assert (=> b!588922 m!567469))

(declare-fun m!567471 () Bool)

(assert (=> b!588922 m!567471))

(declare-fun m!567473 () Bool)

(assert (=> b!588922 m!567473))

(declare-fun m!567475 () Bool)

(assert (=> b!588922 m!567475))

(assert (=> b!588922 m!567473))

(declare-fun m!567477 () Bool)

(assert (=> b!588922 m!567477))

(declare-fun m!567479 () Bool)

(assert (=> b!588922 m!567479))

(declare-fun m!567481 () Bool)

(assert (=> b!588922 m!567481))

(declare-fun m!567483 () Bool)

(assert (=> b!588915 m!567483))

(declare-fun m!567485 () Bool)

(assert (=> b!588926 m!567485))

(declare-fun m!567487 () Bool)

(assert (=> b!588924 m!567487))

(declare-fun m!567489 () Bool)

(assert (=> b!588918 m!567489))

(assert (=> b!588918 m!567473))

(assert (=> b!588918 m!567473))

(declare-fun m!567491 () Bool)

(assert (=> b!588918 m!567491))

(declare-fun m!567493 () Bool)

(assert (=> start!53946 m!567493))

(declare-fun m!567495 () Bool)

(assert (=> start!53946 m!567495))

(declare-fun m!567497 () Bool)

(assert (=> b!588913 m!567497))

(assert (=> b!588925 m!567477))

(declare-fun m!567499 () Bool)

(assert (=> b!588925 m!567499))

(assert (=> b!588921 m!567473))

(assert (=> b!588921 m!567473))

(declare-fun m!567501 () Bool)

(assert (=> b!588921 m!567501))

(declare-fun m!567503 () Bool)

(assert (=> b!588916 m!567503))

(declare-fun m!567505 () Bool)

(assert (=> b!588923 m!567505))

(check-sat (not b!588922) (not b!588918) (not b!588915) (not b!588921) (not b!588926) (not b!588924) (not start!53946) (not b!588923) (not b!588913))
(check-sat)
