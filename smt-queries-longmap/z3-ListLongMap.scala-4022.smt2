; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54822 () Bool)

(assert start!54822)

(declare-fun b!598708 () Bool)

(declare-fun res!383880 () Bool)

(declare-fun e!342255 () Bool)

(assert (=> b!598708 (=> (not res!383880) (not e!342255))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37071 0))(
  ( (array!37072 (arr!17795 (Array (_ BitVec 32) (_ BitVec 64))) (size!18160 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37071)

(assert (=> b!598708 (= res!383880 (and (= (size!18160 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18160 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18160 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598709 () Bool)

(declare-fun res!383875 () Bool)

(declare-fun e!342253 () Bool)

(assert (=> b!598709 (=> (not res!383875) (not e!342253))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!598709 (= res!383875 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17795 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598710 () Bool)

(declare-fun e!342244 () Bool)

(declare-fun e!342248 () Bool)

(assert (=> b!598710 (= e!342244 (not e!342248))))

(declare-fun res!383882 () Bool)

(assert (=> b!598710 (=> res!383882 e!342248)))

(declare-datatypes ((SeekEntryResult!6232 0))(
  ( (MissingZero!6232 (index!27185 (_ BitVec 32))) (Found!6232 (index!27186 (_ BitVec 32))) (Intermediate!6232 (undefined!7044 Bool) (index!27187 (_ BitVec 32)) (x!56002 (_ BitVec 32))) (Undefined!6232) (MissingVacant!6232 (index!27188 (_ BitVec 32))) )
))
(declare-fun lt!271975 () SeekEntryResult!6232)

(assert (=> b!598710 (= res!383882 (not (= lt!271975 (Found!6232 index!984))))))

(declare-datatypes ((Unit!18840 0))(
  ( (Unit!18841) )
))
(declare-fun lt!271980 () Unit!18840)

(declare-fun e!342251 () Unit!18840)

(assert (=> b!598710 (= lt!271980 e!342251)))

(declare-fun c!67785 () Bool)

(assert (=> b!598710 (= c!67785 (= lt!271975 Undefined!6232))))

(declare-fun lt!271976 () (_ BitVec 64))

(declare-fun lt!271973 () array!37071)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37071 (_ BitVec 32)) SeekEntryResult!6232)

(assert (=> b!598710 (= lt!271975 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271976 lt!271973 mask!3053))))

(declare-fun e!342252 () Bool)

(assert (=> b!598710 e!342252))

(declare-fun res!383886 () Bool)

(assert (=> b!598710 (=> (not res!383886) (not e!342252))))

(declare-fun lt!271981 () SeekEntryResult!6232)

(declare-fun lt!271970 () (_ BitVec 32))

(assert (=> b!598710 (= res!383886 (= lt!271981 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271970 vacantSpotIndex!68 lt!271976 lt!271973 mask!3053)))))

(assert (=> b!598710 (= lt!271981 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271970 vacantSpotIndex!68 (select (arr!17795 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!598710 (= lt!271976 (select (store (arr!17795 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271972 () Unit!18840)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37071 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18840)

(assert (=> b!598710 (= lt!271972 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271970 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598710 (= lt!271970 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598711 () Bool)

(declare-fun e!342254 () Bool)

(assert (=> b!598711 (= e!342254 e!342244)))

(declare-fun res!383874 () Bool)

(assert (=> b!598711 (=> (not res!383874) (not e!342244))))

(declare-fun lt!271977 () SeekEntryResult!6232)

(assert (=> b!598711 (= res!383874 (and (= lt!271977 (Found!6232 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17795 a!2986) index!984) (select (arr!17795 a!2986) j!136))) (not (= (select (arr!17795 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!598711 (= lt!271977 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17795 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598712 () Bool)

(declare-fun e!342245 () Bool)

(assert (=> b!598712 (= e!342245 true)))

(declare-datatypes ((List!11875 0))(
  ( (Nil!11872) (Cons!11871 (h!12916 (_ BitVec 64)) (t!18094 List!11875)) )
))
(declare-fun arrayNoDuplicates!0 (array!37071 (_ BitVec 32) List!11875) Bool)

(assert (=> b!598712 (arrayNoDuplicates!0 lt!271973 #b00000000000000000000000000000000 Nil!11872)))

(declare-fun lt!271974 () Unit!18840)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37071 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11875) Unit!18840)

(assert (=> b!598712 (= lt!271974 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11872))))

(declare-fun arrayContainsKey!0 (array!37071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598712 (arrayContainsKey!0 lt!271973 (select (arr!17795 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271979 () Unit!18840)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37071 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18840)

(assert (=> b!598712 (= lt!271979 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271973 (select (arr!17795 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598713 () Bool)

(declare-fun res!383883 () Bool)

(assert (=> b!598713 (=> (not res!383883) (not e!342253))))

(assert (=> b!598713 (= res!383883 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11872))))

(declare-fun res!383881 () Bool)

(assert (=> start!54822 (=> (not res!383881) (not e!342255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54822 (= res!383881 (validMask!0 mask!3053))))

(assert (=> start!54822 e!342255))

(assert (=> start!54822 true))

(declare-fun array_inv!13678 (array!37071) Bool)

(assert (=> start!54822 (array_inv!13678 a!2986)))

(declare-fun b!598714 () Bool)

(declare-fun e!342246 () Bool)

(declare-fun e!342247 () Bool)

(assert (=> b!598714 (= e!342246 e!342247)))

(declare-fun res!383876 () Bool)

(assert (=> b!598714 (=> res!383876 e!342247)))

(declare-fun lt!271978 () (_ BitVec 64))

(assert (=> b!598714 (= res!383876 (or (not (= (select (arr!17795 a!2986) j!136) lt!271976)) (not (= (select (arr!17795 a!2986) j!136) lt!271978)) (bvsge j!136 index!984)))))

(declare-fun b!598715 () Bool)

(declare-fun Unit!18842 () Unit!18840)

(assert (=> b!598715 (= e!342251 Unit!18842)))

(assert (=> b!598715 false))

(declare-fun b!598716 () Bool)

(declare-fun res!383877 () Bool)

(assert (=> b!598716 (=> (not res!383877) (not e!342253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37071 (_ BitVec 32)) Bool)

(assert (=> b!598716 (= res!383877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598717 () Bool)

(declare-fun res!383885 () Bool)

(assert (=> b!598717 (=> (not res!383885) (not e!342255))))

(assert (=> b!598717 (= res!383885 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598718 () Bool)

(assert (=> b!598718 (= e!342248 e!342245)))

(declare-fun res!383872 () Bool)

(assert (=> b!598718 (=> res!383872 e!342245)))

(assert (=> b!598718 (= res!383872 (or (not (= (select (arr!17795 a!2986) j!136) lt!271976)) (not (= (select (arr!17795 a!2986) j!136) lt!271978)) (bvsge j!136 index!984)))))

(assert (=> b!598718 e!342246))

(declare-fun res!383888 () Bool)

(assert (=> b!598718 (=> (not res!383888) (not e!342246))))

(assert (=> b!598718 (= res!383888 (= lt!271978 (select (arr!17795 a!2986) j!136)))))

(assert (=> b!598718 (= lt!271978 (select (store (arr!17795 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!598719 () Bool)

(declare-fun res!383873 () Bool)

(assert (=> b!598719 (=> (not res!383873) (not e!342255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598719 (= res!383873 (validKeyInArray!0 k0!1786))))

(declare-fun b!598720 () Bool)

(assert (=> b!598720 (= e!342255 e!342253)))

(declare-fun res!383887 () Bool)

(assert (=> b!598720 (=> (not res!383887) (not e!342253))))

(declare-fun lt!271971 () SeekEntryResult!6232)

(assert (=> b!598720 (= res!383887 (or (= lt!271971 (MissingZero!6232 i!1108)) (= lt!271971 (MissingVacant!6232 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37071 (_ BitVec 32)) SeekEntryResult!6232)

(assert (=> b!598720 (= lt!271971 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!598721 () Bool)

(declare-fun Unit!18843 () Unit!18840)

(assert (=> b!598721 (= e!342251 Unit!18843)))

(declare-fun b!598722 () Bool)

(assert (=> b!598722 (= e!342252 (= lt!271977 lt!271981))))

(declare-fun b!598723 () Bool)

(declare-fun res!383879 () Bool)

(assert (=> b!598723 (=> (not res!383879) (not e!342255))))

(assert (=> b!598723 (= res!383879 (validKeyInArray!0 (select (arr!17795 a!2986) j!136)))))

(declare-fun e!342250 () Bool)

(declare-fun b!598724 () Bool)

(assert (=> b!598724 (= e!342250 (arrayContainsKey!0 lt!271973 (select (arr!17795 a!2986) j!136) index!984))))

(declare-fun b!598725 () Bool)

(assert (=> b!598725 (= e!342253 e!342254)))

(declare-fun res!383878 () Bool)

(assert (=> b!598725 (=> (not res!383878) (not e!342254))))

(assert (=> b!598725 (= res!383878 (= (select (store (arr!17795 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598725 (= lt!271973 (array!37072 (store (arr!17795 a!2986) i!1108 k0!1786) (size!18160 a!2986)))))

(declare-fun b!598726 () Bool)

(assert (=> b!598726 (= e!342247 e!342250)))

(declare-fun res!383884 () Bool)

(assert (=> b!598726 (=> (not res!383884) (not e!342250))))

(assert (=> b!598726 (= res!383884 (arrayContainsKey!0 lt!271973 (select (arr!17795 a!2986) j!136) j!136))))

(assert (= (and start!54822 res!383881) b!598708))

(assert (= (and b!598708 res!383880) b!598723))

(assert (= (and b!598723 res!383879) b!598719))

(assert (= (and b!598719 res!383873) b!598717))

(assert (= (and b!598717 res!383885) b!598720))

(assert (= (and b!598720 res!383887) b!598716))

(assert (= (and b!598716 res!383877) b!598713))

(assert (= (and b!598713 res!383883) b!598709))

(assert (= (and b!598709 res!383875) b!598725))

(assert (= (and b!598725 res!383878) b!598711))

(assert (= (and b!598711 res!383874) b!598710))

(assert (= (and b!598710 res!383886) b!598722))

(assert (= (and b!598710 c!67785) b!598715))

(assert (= (and b!598710 (not c!67785)) b!598721))

(assert (= (and b!598710 (not res!383882)) b!598718))

(assert (= (and b!598718 res!383888) b!598714))

(assert (= (and b!598714 (not res!383876)) b!598726))

(assert (= (and b!598726 res!383884) b!598724))

(assert (= (and b!598718 (not res!383872)) b!598712))

(declare-fun m!575485 () Bool)

(assert (=> b!598726 m!575485))

(assert (=> b!598726 m!575485))

(declare-fun m!575487 () Bool)

(assert (=> b!598726 m!575487))

(declare-fun m!575489 () Bool)

(assert (=> b!598710 m!575489))

(declare-fun m!575491 () Bool)

(assert (=> b!598710 m!575491))

(declare-fun m!575493 () Bool)

(assert (=> b!598710 m!575493))

(declare-fun m!575495 () Bool)

(assert (=> b!598710 m!575495))

(declare-fun m!575497 () Bool)

(assert (=> b!598710 m!575497))

(assert (=> b!598710 m!575485))

(declare-fun m!575499 () Bool)

(assert (=> b!598710 m!575499))

(declare-fun m!575501 () Bool)

(assert (=> b!598710 m!575501))

(assert (=> b!598710 m!575485))

(declare-fun m!575503 () Bool)

(assert (=> b!598717 m!575503))

(assert (=> b!598712 m!575485))

(assert (=> b!598712 m!575485))

(declare-fun m!575505 () Bool)

(assert (=> b!598712 m!575505))

(assert (=> b!598712 m!575485))

(declare-fun m!575507 () Bool)

(assert (=> b!598712 m!575507))

(declare-fun m!575509 () Bool)

(assert (=> b!598712 m!575509))

(declare-fun m!575511 () Bool)

(assert (=> b!598712 m!575511))

(declare-fun m!575513 () Bool)

(assert (=> b!598711 m!575513))

(assert (=> b!598711 m!575485))

(assert (=> b!598711 m!575485))

(declare-fun m!575515 () Bool)

(assert (=> b!598711 m!575515))

(assert (=> b!598714 m!575485))

(declare-fun m!575517 () Bool)

(assert (=> b!598719 m!575517))

(declare-fun m!575519 () Bool)

(assert (=> b!598716 m!575519))

(assert (=> b!598723 m!575485))

(assert (=> b!598723 m!575485))

(declare-fun m!575521 () Bool)

(assert (=> b!598723 m!575521))

(assert (=> b!598725 m!575493))

(declare-fun m!575523 () Bool)

(assert (=> b!598725 m!575523))

(assert (=> b!598724 m!575485))

(assert (=> b!598724 m!575485))

(declare-fun m!575525 () Bool)

(assert (=> b!598724 m!575525))

(declare-fun m!575527 () Bool)

(assert (=> start!54822 m!575527))

(declare-fun m!575529 () Bool)

(assert (=> start!54822 m!575529))

(declare-fun m!575531 () Bool)

(assert (=> b!598713 m!575531))

(assert (=> b!598718 m!575485))

(assert (=> b!598718 m!575493))

(declare-fun m!575533 () Bool)

(assert (=> b!598718 m!575533))

(declare-fun m!575535 () Bool)

(assert (=> b!598709 m!575535))

(declare-fun m!575537 () Bool)

(assert (=> b!598720 m!575537))

(check-sat (not b!598720) (not b!598713) (not b!598716) (not b!598712) (not b!598723) (not b!598717) (not b!598726) (not b!598719) (not b!598711) (not start!54822) (not b!598710) (not b!598724))
(check-sat)
