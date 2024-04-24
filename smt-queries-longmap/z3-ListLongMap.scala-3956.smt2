; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53796 () Bool)

(assert start!53796)

(declare-fun b!586482 () Bool)

(declare-fun res!374196 () Bool)

(declare-fun e!335347 () Bool)

(assert (=> b!586482 (=> (not res!374196) (not e!335347))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586482 (= res!374196 (validKeyInArray!0 k0!1786))))

(declare-fun b!586483 () Bool)

(declare-fun e!335349 () Bool)

(assert (=> b!586483 (= e!335349 (not true))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!266152 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36642 0))(
  ( (array!36643 (arr!17593 (Array (_ BitVec 32) (_ BitVec 64))) (size!17957 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36642)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5989 0))(
  ( (MissingZero!5989 (index!26183 (_ BitVec 32))) (Found!5989 (index!26184 (_ BitVec 32))) (Intermediate!5989 (undefined!6801 Bool) (index!26185 (_ BitVec 32)) (x!55149 (_ BitVec 32))) (Undefined!5989) (MissingVacant!5989 (index!26186 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36642 (_ BitVec 32)) SeekEntryResult!5989)

(assert (=> b!586483 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266152 vacantSpotIndex!68 (select (arr!17593 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266152 vacantSpotIndex!68 (select (store (arr!17593 a!2986) i!1108 k0!1786) j!136) (array!36643 (store (arr!17593 a!2986) i!1108 k0!1786) (size!17957 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18175 0))(
  ( (Unit!18176) )
))
(declare-fun lt!266150 () Unit!18175)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36642 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18175)

(assert (=> b!586483 (= lt!266150 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266152 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586483 (= lt!266152 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!374194 () Bool)

(assert (=> start!53796 (=> (not res!374194) (not e!335347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53796 (= res!374194 (validMask!0 mask!3053))))

(assert (=> start!53796 e!335347))

(assert (=> start!53796 true))

(declare-fun array_inv!13452 (array!36642) Bool)

(assert (=> start!53796 (array_inv!13452 a!2986)))

(declare-fun b!586484 () Bool)

(declare-fun res!374201 () Bool)

(assert (=> b!586484 (=> (not res!374201) (not e!335349))))

(declare-datatypes ((List!11541 0))(
  ( (Nil!11538) (Cons!11537 (h!12585 (_ BitVec 64)) (t!17761 List!11541)) )
))
(declare-fun arrayNoDuplicates!0 (array!36642 (_ BitVec 32) List!11541) Bool)

(assert (=> b!586484 (= res!374201 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11538))))

(declare-fun b!586485 () Bool)

(declare-fun res!374203 () Bool)

(assert (=> b!586485 (=> (not res!374203) (not e!335349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36642 (_ BitVec 32)) Bool)

(assert (=> b!586485 (= res!374203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586486 () Bool)

(declare-fun res!374198 () Bool)

(assert (=> b!586486 (=> (not res!374198) (not e!335349))))

(assert (=> b!586486 (= res!374198 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17593 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17593 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586487 () Bool)

(declare-fun res!374195 () Bool)

(assert (=> b!586487 (=> (not res!374195) (not e!335347))))

(declare-fun arrayContainsKey!0 (array!36642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586487 (= res!374195 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586488 () Bool)

(declare-fun res!374193 () Bool)

(assert (=> b!586488 (=> (not res!374193) (not e!335347))))

(assert (=> b!586488 (= res!374193 (and (= (size!17957 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17957 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17957 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586489 () Bool)

(assert (=> b!586489 (= e!335347 e!335349)))

(declare-fun res!374197 () Bool)

(assert (=> b!586489 (=> (not res!374197) (not e!335349))))

(declare-fun lt!266151 () SeekEntryResult!5989)

(assert (=> b!586489 (= res!374197 (or (= lt!266151 (MissingZero!5989 i!1108)) (= lt!266151 (MissingVacant!5989 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36642 (_ BitVec 32)) SeekEntryResult!5989)

(assert (=> b!586489 (= lt!266151 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586490 () Bool)

(declare-fun res!374202 () Bool)

(assert (=> b!586490 (=> (not res!374202) (not e!335349))))

(assert (=> b!586490 (= res!374202 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17593 a!2986) index!984) (select (arr!17593 a!2986) j!136))) (not (= (select (arr!17593 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586491 () Bool)

(declare-fun res!374199 () Bool)

(assert (=> b!586491 (=> (not res!374199) (not e!335349))))

(assert (=> b!586491 (= res!374199 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17593 a!2986) j!136) a!2986 mask!3053) (Found!5989 j!136)))))

(declare-fun b!586492 () Bool)

(declare-fun res!374200 () Bool)

(assert (=> b!586492 (=> (not res!374200) (not e!335347))))

(assert (=> b!586492 (= res!374200 (validKeyInArray!0 (select (arr!17593 a!2986) j!136)))))

(assert (= (and start!53796 res!374194) b!586488))

(assert (= (and b!586488 res!374193) b!586492))

(assert (= (and b!586492 res!374200) b!586482))

(assert (= (and b!586482 res!374196) b!586487))

(assert (= (and b!586487 res!374195) b!586489))

(assert (= (and b!586489 res!374197) b!586485))

(assert (= (and b!586485 res!374203) b!586484))

(assert (= (and b!586484 res!374201) b!586486))

(assert (= (and b!586486 res!374198) b!586491))

(assert (= (and b!586491 res!374199) b!586490))

(assert (= (and b!586490 res!374202) b!586483))

(declare-fun m!564965 () Bool)

(assert (=> b!586484 m!564965))

(declare-fun m!564967 () Bool)

(assert (=> b!586486 m!564967))

(declare-fun m!564969 () Bool)

(assert (=> b!586486 m!564969))

(declare-fun m!564971 () Bool)

(assert (=> b!586486 m!564971))

(declare-fun m!564973 () Bool)

(assert (=> start!53796 m!564973))

(declare-fun m!564975 () Bool)

(assert (=> start!53796 m!564975))

(declare-fun m!564977 () Bool)

(assert (=> b!586483 m!564977))

(declare-fun m!564979 () Bool)

(assert (=> b!586483 m!564979))

(declare-fun m!564981 () Bool)

(assert (=> b!586483 m!564981))

(assert (=> b!586483 m!564981))

(declare-fun m!564983 () Bool)

(assert (=> b!586483 m!564983))

(assert (=> b!586483 m!564969))

(assert (=> b!586483 m!564979))

(declare-fun m!564985 () Bool)

(assert (=> b!586483 m!564985))

(declare-fun m!564987 () Bool)

(assert (=> b!586483 m!564987))

(declare-fun m!564989 () Bool)

(assert (=> b!586487 m!564989))

(declare-fun m!564991 () Bool)

(assert (=> b!586490 m!564991))

(assert (=> b!586490 m!564981))

(assert (=> b!586491 m!564981))

(assert (=> b!586491 m!564981))

(declare-fun m!564993 () Bool)

(assert (=> b!586491 m!564993))

(declare-fun m!564995 () Bool)

(assert (=> b!586485 m!564995))

(assert (=> b!586492 m!564981))

(assert (=> b!586492 m!564981))

(declare-fun m!564997 () Bool)

(assert (=> b!586492 m!564997))

(declare-fun m!564999 () Bool)

(assert (=> b!586489 m!564999))

(declare-fun m!565001 () Bool)

(assert (=> b!586482 m!565001))

(check-sat (not b!586482) (not b!586491) (not start!53796) (not b!586485) (not b!586487) (not b!586483) (not b!586484) (not b!586492) (not b!586489))
(check-sat)
