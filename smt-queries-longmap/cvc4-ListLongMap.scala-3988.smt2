; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54062 () Bool)

(assert start!54062)

(declare-fun b!590419 () Bool)

(declare-fun e!337074 () Bool)

(assert (=> b!590419 (= e!337074 true)))

(declare-fun e!337082 () Bool)

(assert (=> b!590419 e!337082))

(declare-fun res!377656 () Bool)

(assert (=> b!590419 (=> (not res!377656) (not e!337082))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36849 0))(
  ( (array!36850 (arr!17696 (Array (_ BitVec 32) (_ BitVec 64))) (size!18060 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36849)

(assert (=> b!590419 (= res!377656 (= (select (store (arr!17696 a!2986) i!1108 k!1786) index!984) (select (arr!17696 a!2986) j!136)))))

(declare-fun b!590420 () Bool)

(declare-fun e!337079 () Bool)

(declare-fun e!337075 () Bool)

(assert (=> b!590420 (= e!337079 e!337075)))

(declare-fun res!377652 () Bool)

(assert (=> b!590420 (=> (not res!377652) (not e!337075))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!590420 (= res!377652 (= (select (store (arr!17696 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267858 () array!36849)

(assert (=> b!590420 (= lt!267858 (array!36850 (store (arr!17696 a!2986) i!1108 k!1786) (size!18060 a!2986)))))

(declare-fun b!590421 () Bool)

(declare-fun e!337083 () Bool)

(declare-datatypes ((SeekEntryResult!6136 0))(
  ( (MissingZero!6136 (index!26777 (_ BitVec 32))) (Found!6136 (index!26778 (_ BitVec 32))) (Intermediate!6136 (undefined!6948 Bool) (index!26779 (_ BitVec 32)) (x!55567 (_ BitVec 32))) (Undefined!6136) (MissingVacant!6136 (index!26780 (_ BitVec 32))) )
))
(declare-fun lt!267859 () SeekEntryResult!6136)

(declare-fun lt!267861 () SeekEntryResult!6136)

(assert (=> b!590421 (= e!337083 (= lt!267859 lt!267861))))

(declare-fun b!590422 () Bool)

(declare-fun res!377648 () Bool)

(declare-fun e!337078 () Bool)

(assert (=> b!590422 (=> (not res!377648) (not e!337078))))

(declare-fun arrayContainsKey!0 (array!36849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590422 (= res!377648 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590423 () Bool)

(declare-fun e!337081 () Bool)

(assert (=> b!590423 (= e!337081 (not e!337074))))

(declare-fun res!377646 () Bool)

(assert (=> b!590423 (=> res!377646 e!337074)))

(declare-fun lt!267857 () SeekEntryResult!6136)

(assert (=> b!590423 (= res!377646 (not (= lt!267857 (Found!6136 index!984))))))

(declare-datatypes ((Unit!18462 0))(
  ( (Unit!18463) )
))
(declare-fun lt!267855 () Unit!18462)

(declare-fun e!337080 () Unit!18462)

(assert (=> b!590423 (= lt!267855 e!337080)))

(declare-fun c!66755 () Bool)

(assert (=> b!590423 (= c!66755 (= lt!267857 Undefined!6136))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!267854 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36849 (_ BitVec 32)) SeekEntryResult!6136)

(assert (=> b!590423 (= lt!267857 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267854 lt!267858 mask!3053))))

(assert (=> b!590423 e!337083))

(declare-fun res!377657 () Bool)

(assert (=> b!590423 (=> (not res!377657) (not e!337083))))

(declare-fun lt!267862 () (_ BitVec 32))

(assert (=> b!590423 (= res!377657 (= lt!267861 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267862 vacantSpotIndex!68 lt!267854 lt!267858 mask!3053)))))

(assert (=> b!590423 (= lt!267861 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267862 vacantSpotIndex!68 (select (arr!17696 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590423 (= lt!267854 (select (store (arr!17696 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267856 () Unit!18462)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18462)

(assert (=> b!590423 (= lt!267856 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267862 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590423 (= lt!267862 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!590425 () Bool)

(declare-fun Unit!18464 () Unit!18462)

(assert (=> b!590425 (= e!337080 Unit!18464)))

(declare-fun b!590426 () Bool)

(declare-fun res!377647 () Bool)

(assert (=> b!590426 (=> (not res!377647) (not e!337079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36849 (_ BitVec 32)) Bool)

(assert (=> b!590426 (= res!377647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590427 () Bool)

(declare-fun res!377644 () Bool)

(assert (=> b!590427 (=> (not res!377644) (not e!337079))))

(declare-datatypes ((List!11737 0))(
  ( (Nil!11734) (Cons!11733 (h!12778 (_ BitVec 64)) (t!17965 List!11737)) )
))
(declare-fun arrayNoDuplicates!0 (array!36849 (_ BitVec 32) List!11737) Bool)

(assert (=> b!590427 (= res!377644 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11734))))

(declare-fun e!337077 () Bool)

(declare-fun b!590428 () Bool)

(assert (=> b!590428 (= e!337077 (arrayContainsKey!0 lt!267858 (select (arr!17696 a!2986) j!136) j!136))))

(declare-fun b!590429 () Bool)

(assert (=> b!590429 (= e!337082 e!337077)))

(declare-fun res!377643 () Bool)

(assert (=> b!590429 (=> res!377643 e!337077)))

(assert (=> b!590429 (= res!377643 (or (not (= (select (arr!17696 a!2986) j!136) lt!267854)) (not (= (select (arr!17696 a!2986) j!136) (select (store (arr!17696 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590430 () Bool)

(declare-fun res!377645 () Bool)

(assert (=> b!590430 (=> (not res!377645) (not e!337078))))

(assert (=> b!590430 (= res!377645 (and (= (size!18060 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18060 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18060 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590424 () Bool)

(assert (=> b!590424 (= e!337075 e!337081)))

(declare-fun res!377649 () Bool)

(assert (=> b!590424 (=> (not res!377649) (not e!337081))))

(assert (=> b!590424 (= res!377649 (and (= lt!267859 (Found!6136 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17696 a!2986) index!984) (select (arr!17696 a!2986) j!136))) (not (= (select (arr!17696 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!590424 (= lt!267859 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17696 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!377650 () Bool)

(assert (=> start!54062 (=> (not res!377650) (not e!337078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54062 (= res!377650 (validMask!0 mask!3053))))

(assert (=> start!54062 e!337078))

(assert (=> start!54062 true))

(declare-fun array_inv!13492 (array!36849) Bool)

(assert (=> start!54062 (array_inv!13492 a!2986)))

(declare-fun b!590431 () Bool)

(assert (=> b!590431 (= e!337078 e!337079)))

(declare-fun res!377653 () Bool)

(assert (=> b!590431 (=> (not res!377653) (not e!337079))))

(declare-fun lt!267860 () SeekEntryResult!6136)

(assert (=> b!590431 (= res!377653 (or (= lt!267860 (MissingZero!6136 i!1108)) (= lt!267860 (MissingVacant!6136 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36849 (_ BitVec 32)) SeekEntryResult!6136)

(assert (=> b!590431 (= lt!267860 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!590432 () Bool)

(declare-fun res!377654 () Bool)

(assert (=> b!590432 (=> (not res!377654) (not e!337079))))

(assert (=> b!590432 (= res!377654 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17696 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590433 () Bool)

(declare-fun res!377655 () Bool)

(assert (=> b!590433 (=> (not res!377655) (not e!337078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590433 (= res!377655 (validKeyInArray!0 k!1786))))

(declare-fun b!590434 () Bool)

(declare-fun res!377651 () Bool)

(assert (=> b!590434 (=> (not res!377651) (not e!337078))))

(assert (=> b!590434 (= res!377651 (validKeyInArray!0 (select (arr!17696 a!2986) j!136)))))

(declare-fun b!590435 () Bool)

(declare-fun Unit!18465 () Unit!18462)

(assert (=> b!590435 (= e!337080 Unit!18465)))

(assert (=> b!590435 false))

(assert (= (and start!54062 res!377650) b!590430))

(assert (= (and b!590430 res!377645) b!590434))

(assert (= (and b!590434 res!377651) b!590433))

(assert (= (and b!590433 res!377655) b!590422))

(assert (= (and b!590422 res!377648) b!590431))

(assert (= (and b!590431 res!377653) b!590426))

(assert (= (and b!590426 res!377647) b!590427))

(assert (= (and b!590427 res!377644) b!590432))

(assert (= (and b!590432 res!377654) b!590420))

(assert (= (and b!590420 res!377652) b!590424))

(assert (= (and b!590424 res!377649) b!590423))

(assert (= (and b!590423 res!377657) b!590421))

(assert (= (and b!590423 c!66755) b!590435))

(assert (= (and b!590423 (not c!66755)) b!590425))

(assert (= (and b!590423 (not res!377646)) b!590419))

(assert (= (and b!590419 res!377656) b!590429))

(assert (= (and b!590429 (not res!377643)) b!590428))

(declare-fun m!568829 () Bool)

(assert (=> b!590419 m!568829))

(declare-fun m!568831 () Bool)

(assert (=> b!590419 m!568831))

(declare-fun m!568833 () Bool)

(assert (=> b!590419 m!568833))

(declare-fun m!568835 () Bool)

(assert (=> b!590423 m!568835))

(declare-fun m!568837 () Bool)

(assert (=> b!590423 m!568837))

(assert (=> b!590423 m!568833))

(declare-fun m!568839 () Bool)

(assert (=> b!590423 m!568839))

(assert (=> b!590423 m!568829))

(assert (=> b!590423 m!568833))

(declare-fun m!568841 () Bool)

(assert (=> b!590423 m!568841))

(declare-fun m!568843 () Bool)

(assert (=> b!590423 m!568843))

(declare-fun m!568845 () Bool)

(assert (=> b!590423 m!568845))

(declare-fun m!568847 () Bool)

(assert (=> b!590431 m!568847))

(declare-fun m!568849 () Bool)

(assert (=> b!590432 m!568849))

(assert (=> b!590429 m!568833))

(assert (=> b!590429 m!568829))

(assert (=> b!590429 m!568831))

(declare-fun m!568851 () Bool)

(assert (=> b!590422 m!568851))

(declare-fun m!568853 () Bool)

(assert (=> start!54062 m!568853))

(declare-fun m!568855 () Bool)

(assert (=> start!54062 m!568855))

(declare-fun m!568857 () Bool)

(assert (=> b!590424 m!568857))

(assert (=> b!590424 m!568833))

(assert (=> b!590424 m!568833))

(declare-fun m!568859 () Bool)

(assert (=> b!590424 m!568859))

(declare-fun m!568861 () Bool)

(assert (=> b!590426 m!568861))

(assert (=> b!590434 m!568833))

(assert (=> b!590434 m!568833))

(declare-fun m!568863 () Bool)

(assert (=> b!590434 m!568863))

(assert (=> b!590420 m!568829))

(declare-fun m!568865 () Bool)

(assert (=> b!590420 m!568865))

(assert (=> b!590428 m!568833))

(assert (=> b!590428 m!568833))

(declare-fun m!568867 () Bool)

(assert (=> b!590428 m!568867))

(declare-fun m!568869 () Bool)

(assert (=> b!590427 m!568869))

(declare-fun m!568871 () Bool)

(assert (=> b!590433 m!568871))

(push 1)

