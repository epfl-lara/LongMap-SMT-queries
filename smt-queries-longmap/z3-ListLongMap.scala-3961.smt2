; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53826 () Bool)

(assert start!53826)

(declare-fun b!586977 () Bool)

(declare-fun res!374690 () Bool)

(declare-fun e!335483 () Bool)

(assert (=> b!586977 (=> (not res!374690) (not e!335483))))

(declare-datatypes ((array!36672 0))(
  ( (array!36673 (arr!17608 (Array (_ BitVec 32) (_ BitVec 64))) (size!17972 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36672)

(declare-datatypes ((List!11556 0))(
  ( (Nil!11553) (Cons!11552 (h!12600 (_ BitVec 64)) (t!17776 List!11556)) )
))
(declare-fun arrayNoDuplicates!0 (array!36672 (_ BitVec 32) List!11556) Bool)

(assert (=> b!586977 (= res!374690 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11553))))

(declare-fun b!586978 () Bool)

(declare-fun res!374689 () Bool)

(assert (=> b!586978 (=> (not res!374689) (not e!335483))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36672 (_ BitVec 32)) Bool)

(assert (=> b!586978 (= res!374689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586979 () Bool)

(declare-fun res!374697 () Bool)

(assert (=> b!586979 (=> (not res!374697) (not e!335483))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586979 (= res!374697 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17608 a!2986) index!984) (select (arr!17608 a!2986) j!136))) (not (= (select (arr!17608 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586980 () Bool)

(assert (=> b!586980 (= e!335483 (not true))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!266285 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6004 0))(
  ( (MissingZero!6004 (index!26243 (_ BitVec 32))) (Found!6004 (index!26244 (_ BitVec 32))) (Intermediate!6004 (undefined!6816 Bool) (index!26245 (_ BitVec 32)) (x!55204 (_ BitVec 32))) (Undefined!6004) (MissingVacant!6004 (index!26246 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36672 (_ BitVec 32)) SeekEntryResult!6004)

(assert (=> b!586980 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266285 vacantSpotIndex!68 (select (arr!17608 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266285 vacantSpotIndex!68 (select (store (arr!17608 a!2986) i!1108 k0!1786) j!136) (array!36673 (store (arr!17608 a!2986) i!1108 k0!1786) (size!17972 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18205 0))(
  ( (Unit!18206) )
))
(declare-fun lt!266286 () Unit!18205)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36672 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18205)

(assert (=> b!586980 (= lt!266286 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266285 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586980 (= lt!266285 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!586981 () Bool)

(declare-fun e!335484 () Bool)

(assert (=> b!586981 (= e!335484 e!335483)))

(declare-fun res!374688 () Bool)

(assert (=> b!586981 (=> (not res!374688) (not e!335483))))

(declare-fun lt!266287 () SeekEntryResult!6004)

(assert (=> b!586981 (= res!374688 (or (= lt!266287 (MissingZero!6004 i!1108)) (= lt!266287 (MissingVacant!6004 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36672 (_ BitVec 32)) SeekEntryResult!6004)

(assert (=> b!586981 (= lt!266287 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586982 () Bool)

(declare-fun res!374698 () Bool)

(assert (=> b!586982 (=> (not res!374698) (not e!335484))))

(declare-fun arrayContainsKey!0 (array!36672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586982 (= res!374698 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586983 () Bool)

(declare-fun res!374691 () Bool)

(assert (=> b!586983 (=> (not res!374691) (not e!335484))))

(assert (=> b!586983 (= res!374691 (and (= (size!17972 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17972 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17972 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586984 () Bool)

(declare-fun res!374694 () Bool)

(assert (=> b!586984 (=> (not res!374694) (not e!335484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586984 (= res!374694 (validKeyInArray!0 (select (arr!17608 a!2986) j!136)))))

(declare-fun b!586985 () Bool)

(declare-fun res!374695 () Bool)

(assert (=> b!586985 (=> (not res!374695) (not e!335484))))

(assert (=> b!586985 (= res!374695 (validKeyInArray!0 k0!1786))))

(declare-fun b!586986 () Bool)

(declare-fun res!374693 () Bool)

(assert (=> b!586986 (=> (not res!374693) (not e!335483))))

(assert (=> b!586986 (= res!374693 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17608 a!2986) j!136) a!2986 mask!3053) (Found!6004 j!136)))))

(declare-fun res!374696 () Bool)

(assert (=> start!53826 (=> (not res!374696) (not e!335484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53826 (= res!374696 (validMask!0 mask!3053))))

(assert (=> start!53826 e!335484))

(assert (=> start!53826 true))

(declare-fun array_inv!13467 (array!36672) Bool)

(assert (=> start!53826 (array_inv!13467 a!2986)))

(declare-fun b!586987 () Bool)

(declare-fun res!374692 () Bool)

(assert (=> b!586987 (=> (not res!374692) (not e!335483))))

(assert (=> b!586987 (= res!374692 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17608 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17608 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53826 res!374696) b!586983))

(assert (= (and b!586983 res!374691) b!586984))

(assert (= (and b!586984 res!374694) b!586985))

(assert (= (and b!586985 res!374695) b!586982))

(assert (= (and b!586982 res!374698) b!586981))

(assert (= (and b!586981 res!374688) b!586978))

(assert (= (and b!586978 res!374689) b!586977))

(assert (= (and b!586977 res!374690) b!586987))

(assert (= (and b!586987 res!374692) b!586986))

(assert (= (and b!586986 res!374693) b!586979))

(assert (= (and b!586979 res!374697) b!586980))

(declare-fun m!565535 () Bool)

(assert (=> b!586984 m!565535))

(assert (=> b!586984 m!565535))

(declare-fun m!565537 () Bool)

(assert (=> b!586984 m!565537))

(declare-fun m!565539 () Bool)

(assert (=> b!586981 m!565539))

(assert (=> b!586986 m!565535))

(assert (=> b!586986 m!565535))

(declare-fun m!565541 () Bool)

(assert (=> b!586986 m!565541))

(declare-fun m!565543 () Bool)

(assert (=> b!586985 m!565543))

(declare-fun m!565545 () Bool)

(assert (=> b!586978 m!565545))

(declare-fun m!565547 () Bool)

(assert (=> b!586980 m!565547))

(declare-fun m!565549 () Bool)

(assert (=> b!586980 m!565549))

(assert (=> b!586980 m!565535))

(declare-fun m!565551 () Bool)

(assert (=> b!586980 m!565551))

(assert (=> b!586980 m!565535))

(assert (=> b!586980 m!565549))

(declare-fun m!565553 () Bool)

(assert (=> b!586980 m!565553))

(declare-fun m!565555 () Bool)

(assert (=> b!586980 m!565555))

(declare-fun m!565557 () Bool)

(assert (=> b!586980 m!565557))

(declare-fun m!565559 () Bool)

(assert (=> b!586982 m!565559))

(declare-fun m!565561 () Bool)

(assert (=> b!586979 m!565561))

(assert (=> b!586979 m!565535))

(declare-fun m!565563 () Bool)

(assert (=> start!53826 m!565563))

(declare-fun m!565565 () Bool)

(assert (=> start!53826 m!565565))

(declare-fun m!565567 () Bool)

(assert (=> b!586977 m!565567))

(declare-fun m!565569 () Bool)

(assert (=> b!586987 m!565569))

(assert (=> b!586987 m!565555))

(declare-fun m!565571 () Bool)

(assert (=> b!586987 m!565571))

(check-sat (not b!586981) (not start!53826) (not b!586982) (not b!586984) (not b!586980) (not b!586985) (not b!586978) (not b!586986) (not b!586977))
(check-sat)
