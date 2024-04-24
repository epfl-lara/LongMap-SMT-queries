; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54030 () Bool)

(assert start!54030)

(declare-fun b!589847 () Bool)

(declare-fun e!336756 () Bool)

(declare-fun e!336759 () Bool)

(assert (=> b!589847 (= e!336756 e!336759)))

(declare-fun res!377231 () Bool)

(assert (=> b!589847 (=> (not res!377231) (not e!336759))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6076 0))(
  ( (MissingZero!6076 (index!26534 (_ BitVec 32))) (Found!6076 (index!26535 (_ BitVec 32))) (Intermediate!6076 (undefined!6888 Bool) (index!26536 (_ BitVec 32)) (x!55477 (_ BitVec 32))) (Undefined!6076) (MissingVacant!6076 (index!26537 (_ BitVec 32))) )
))
(declare-fun lt!267553 () SeekEntryResult!6076)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36819 0))(
  ( (array!36820 (arr!17680 (Array (_ BitVec 32) (_ BitVec 64))) (size!18044 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36819)

(assert (=> b!589847 (= res!377231 (and (= lt!267553 (Found!6076 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17680 a!2986) index!984) (select (arr!17680 a!2986) j!136))) (not (= (select (arr!17680 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36819 (_ BitVec 32)) SeekEntryResult!6076)

(assert (=> b!589847 (= lt!267553 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17680 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589848 () Bool)

(declare-fun res!377241 () Bool)

(declare-fun e!336754 () Bool)

(assert (=> b!589848 (=> (not res!377241) (not e!336754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589848 (= res!377241 (validKeyInArray!0 (select (arr!17680 a!2986) j!136)))))

(declare-fun b!589849 () Bool)

(declare-fun e!336757 () Bool)

(declare-fun lt!267559 () SeekEntryResult!6076)

(assert (=> b!589849 (= e!336757 (= lt!267553 lt!267559))))

(declare-fun b!589850 () Bool)

(declare-fun e!336758 () Bool)

(assert (=> b!589850 (= e!336758 true)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589850 (= (select (store (arr!17680 a!2986) i!1108 k0!1786) index!984) (select (arr!17680 a!2986) j!136))))

(declare-fun b!589851 () Bool)

(declare-fun res!377239 () Bool)

(assert (=> b!589851 (=> (not res!377239) (not e!336754))))

(declare-fun arrayContainsKey!0 (array!36819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589851 (= res!377239 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589852 () Bool)

(assert (=> b!589852 (= e!336759 (not e!336758))))

(declare-fun res!377230 () Bool)

(assert (=> b!589852 (=> res!377230 e!336758)))

(declare-fun lt!267554 () SeekEntryResult!6076)

(assert (=> b!589852 (= res!377230 (not (= lt!267554 (Found!6076 index!984))))))

(declare-datatypes ((Unit!18397 0))(
  ( (Unit!18398) )
))
(declare-fun lt!267552 () Unit!18397)

(declare-fun e!336753 () Unit!18397)

(assert (=> b!589852 (= lt!267552 e!336753)))

(declare-fun c!66677 () Bool)

(assert (=> b!589852 (= c!66677 (= lt!267554 Undefined!6076))))

(declare-fun lt!267556 () array!36819)

(declare-fun lt!267555 () (_ BitVec 64))

(assert (=> b!589852 (= lt!267554 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267555 lt!267556 mask!3053))))

(assert (=> b!589852 e!336757))

(declare-fun res!377234 () Bool)

(assert (=> b!589852 (=> (not res!377234) (not e!336757))))

(declare-fun lt!267558 () (_ BitVec 32))

(assert (=> b!589852 (= res!377234 (= lt!267559 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267558 vacantSpotIndex!68 lt!267555 lt!267556 mask!3053)))))

(assert (=> b!589852 (= lt!267559 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267558 vacantSpotIndex!68 (select (arr!17680 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589852 (= lt!267555 (select (store (arr!17680 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267557 () Unit!18397)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36819 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18397)

(assert (=> b!589852 (= lt!267557 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267558 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589852 (= lt!267558 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!589853 () Bool)

(declare-fun res!377237 () Bool)

(declare-fun e!336752 () Bool)

(assert (=> b!589853 (=> (not res!377237) (not e!336752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36819 (_ BitVec 32)) Bool)

(assert (=> b!589853 (= res!377237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589854 () Bool)

(declare-fun res!377242 () Bool)

(assert (=> b!589854 (=> (not res!377242) (not e!336752))))

(assert (=> b!589854 (= res!377242 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17680 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589856 () Bool)

(declare-fun res!377238 () Bool)

(assert (=> b!589856 (=> (not res!377238) (not e!336752))))

(declare-datatypes ((List!11628 0))(
  ( (Nil!11625) (Cons!11624 (h!12672 (_ BitVec 64)) (t!17848 List!11628)) )
))
(declare-fun arrayNoDuplicates!0 (array!36819 (_ BitVec 32) List!11628) Bool)

(assert (=> b!589856 (= res!377238 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11625))))

(declare-fun b!589857 () Bool)

(declare-fun res!377233 () Bool)

(assert (=> b!589857 (=> (not res!377233) (not e!336754))))

(assert (=> b!589857 (= res!377233 (validKeyInArray!0 k0!1786))))

(declare-fun b!589858 () Bool)

(declare-fun res!377235 () Bool)

(assert (=> b!589858 (=> (not res!377235) (not e!336754))))

(assert (=> b!589858 (= res!377235 (and (= (size!18044 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18044 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18044 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589859 () Bool)

(declare-fun Unit!18399 () Unit!18397)

(assert (=> b!589859 (= e!336753 Unit!18399)))

(declare-fun b!589860 () Bool)

(declare-fun Unit!18400 () Unit!18397)

(assert (=> b!589860 (= e!336753 Unit!18400)))

(assert (=> b!589860 false))

(declare-fun b!589861 () Bool)

(assert (=> b!589861 (= e!336754 e!336752)))

(declare-fun res!377232 () Bool)

(assert (=> b!589861 (=> (not res!377232) (not e!336752))))

(declare-fun lt!267551 () SeekEntryResult!6076)

(assert (=> b!589861 (= res!377232 (or (= lt!267551 (MissingZero!6076 i!1108)) (= lt!267551 (MissingVacant!6076 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36819 (_ BitVec 32)) SeekEntryResult!6076)

(assert (=> b!589861 (= lt!267551 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!377240 () Bool)

(assert (=> start!54030 (=> (not res!377240) (not e!336754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54030 (= res!377240 (validMask!0 mask!3053))))

(assert (=> start!54030 e!336754))

(assert (=> start!54030 true))

(declare-fun array_inv!13539 (array!36819) Bool)

(assert (=> start!54030 (array_inv!13539 a!2986)))

(declare-fun b!589855 () Bool)

(assert (=> b!589855 (= e!336752 e!336756)))

(declare-fun res!377236 () Bool)

(assert (=> b!589855 (=> (not res!377236) (not e!336756))))

(assert (=> b!589855 (= res!377236 (= (select (store (arr!17680 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589855 (= lt!267556 (array!36820 (store (arr!17680 a!2986) i!1108 k0!1786) (size!18044 a!2986)))))

(assert (= (and start!54030 res!377240) b!589858))

(assert (= (and b!589858 res!377235) b!589848))

(assert (= (and b!589848 res!377241) b!589857))

(assert (= (and b!589857 res!377233) b!589851))

(assert (= (and b!589851 res!377239) b!589861))

(assert (= (and b!589861 res!377232) b!589853))

(assert (= (and b!589853 res!377237) b!589856))

(assert (= (and b!589856 res!377238) b!589854))

(assert (= (and b!589854 res!377242) b!589855))

(assert (= (and b!589855 res!377236) b!589847))

(assert (= (and b!589847 res!377231) b!589852))

(assert (= (and b!589852 res!377234) b!589849))

(assert (= (and b!589852 c!66677) b!589860))

(assert (= (and b!589852 (not c!66677)) b!589859))

(assert (= (and b!589852 (not res!377230)) b!589850))

(declare-fun m!568517 () Bool)

(assert (=> b!589853 m!568517))

(declare-fun m!568519 () Bool)

(assert (=> b!589855 m!568519))

(declare-fun m!568521 () Bool)

(assert (=> b!589855 m!568521))

(declare-fun m!568523 () Bool)

(assert (=> b!589851 m!568523))

(declare-fun m!568525 () Bool)

(assert (=> b!589856 m!568525))

(declare-fun m!568527 () Bool)

(assert (=> b!589847 m!568527))

(declare-fun m!568529 () Bool)

(assert (=> b!589847 m!568529))

(assert (=> b!589847 m!568529))

(declare-fun m!568531 () Bool)

(assert (=> b!589847 m!568531))

(declare-fun m!568533 () Bool)

(assert (=> b!589857 m!568533))

(declare-fun m!568535 () Bool)

(assert (=> start!54030 m!568535))

(declare-fun m!568537 () Bool)

(assert (=> start!54030 m!568537))

(assert (=> b!589848 m!568529))

(assert (=> b!589848 m!568529))

(declare-fun m!568539 () Bool)

(assert (=> b!589848 m!568539))

(declare-fun m!568541 () Bool)

(assert (=> b!589861 m!568541))

(assert (=> b!589850 m!568519))

(declare-fun m!568543 () Bool)

(assert (=> b!589850 m!568543))

(assert (=> b!589850 m!568529))

(declare-fun m!568545 () Bool)

(assert (=> b!589854 m!568545))

(declare-fun m!568547 () Bool)

(assert (=> b!589852 m!568547))

(declare-fun m!568549 () Bool)

(assert (=> b!589852 m!568549))

(assert (=> b!589852 m!568529))

(declare-fun m!568551 () Bool)

(assert (=> b!589852 m!568551))

(declare-fun m!568553 () Bool)

(assert (=> b!589852 m!568553))

(assert (=> b!589852 m!568519))

(assert (=> b!589852 m!568529))

(declare-fun m!568555 () Bool)

(assert (=> b!589852 m!568555))

(declare-fun m!568557 () Bool)

(assert (=> b!589852 m!568557))

(check-sat (not b!589848) (not b!589857) (not b!589847) (not b!589852) (not b!589853) (not start!54030) (not b!589856) (not b!589861) (not b!589851))
(check-sat)
