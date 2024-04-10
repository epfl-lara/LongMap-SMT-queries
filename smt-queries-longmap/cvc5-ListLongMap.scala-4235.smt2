; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58430 () Bool)

(assert start!58430)

(declare-fun b!645022 () Bool)

(declare-fun e!369616 () Bool)

(declare-fun e!369624 () Bool)

(assert (=> b!645022 (= e!369616 e!369624)))

(declare-fun res!417840 () Bool)

(assert (=> b!645022 (=> res!417840 e!369624)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!299017 () (_ BitVec 64))

(declare-fun lt!299016 () (_ BitVec 64))

(declare-datatypes ((array!38446 0))(
  ( (array!38447 (arr!18435 (Array (_ BitVec 32) (_ BitVec 64))) (size!18799 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38446)

(assert (=> b!645022 (= res!417840 (or (not (= (select (arr!18435 a!2986) j!136) lt!299017)) (not (= (select (arr!18435 a!2986) j!136) lt!299016))))))

(declare-fun e!369619 () Bool)

(assert (=> b!645022 e!369619))

(declare-fun res!417844 () Bool)

(assert (=> b!645022 (=> (not res!417844) (not e!369619))))

(assert (=> b!645022 (= res!417844 (= lt!299016 (select (arr!18435 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!645022 (= lt!299016 (select (store (arr!18435 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!645023 () Bool)

(declare-fun e!369622 () Bool)

(declare-fun e!369614 () Bool)

(assert (=> b!645023 (= e!369622 e!369614)))

(declare-fun res!417853 () Bool)

(assert (=> b!645023 (=> (not res!417853) (not e!369614))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!645023 (= res!417853 (= (select (store (arr!18435 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!299023 () array!38446)

(assert (=> b!645023 (= lt!299023 (array!38447 (store (arr!18435 a!2986) i!1108 k!1786) (size!18799 a!2986)))))

(declare-fun b!645024 () Bool)

(declare-fun res!417845 () Bool)

(assert (=> b!645024 (=> (not res!417845) (not e!369622))))

(declare-datatypes ((List!12476 0))(
  ( (Nil!12473) (Cons!12472 (h!13517 (_ BitVec 64)) (t!18704 List!12476)) )
))
(declare-fun arrayNoDuplicates!0 (array!38446 (_ BitVec 32) List!12476) Bool)

(assert (=> b!645024 (= res!417845 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12473))))

(declare-fun b!645025 () Bool)

(declare-fun e!369627 () Bool)

(assert (=> b!645025 (= e!369627 true)))

(declare-fun e!369625 () Bool)

(assert (=> b!645025 e!369625))

(declare-fun res!417846 () Bool)

(assert (=> b!645025 (=> (not res!417846) (not e!369625))))

(declare-fun arrayContainsKey!0 (array!38446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645025 (= res!417846 (arrayContainsKey!0 lt!299023 (select (arr!18435 a!2986) j!136) j!136))))

(declare-fun b!645026 () Bool)

(declare-fun e!369623 () Bool)

(assert (=> b!645026 (= e!369623 (not e!369616))))

(declare-fun res!417838 () Bool)

(assert (=> b!645026 (=> res!417838 e!369616)))

(declare-datatypes ((SeekEntryResult!6875 0))(
  ( (MissingZero!6875 (index!29835 (_ BitVec 32))) (Found!6875 (index!29836 (_ BitVec 32))) (Intermediate!6875 (undefined!7687 Bool) (index!29837 (_ BitVec 32)) (x!58612 (_ BitVec 32))) (Undefined!6875) (MissingVacant!6875 (index!29838 (_ BitVec 32))) )
))
(declare-fun lt!299019 () SeekEntryResult!6875)

(assert (=> b!645026 (= res!417838 (not (= lt!299019 (Found!6875 index!984))))))

(declare-datatypes ((Unit!21876 0))(
  ( (Unit!21877) )
))
(declare-fun lt!299020 () Unit!21876)

(declare-fun e!369620 () Unit!21876)

(assert (=> b!645026 (= lt!299020 e!369620)))

(declare-fun c!73960 () Bool)

(assert (=> b!645026 (= c!73960 (= lt!299019 Undefined!6875))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38446 (_ BitVec 32)) SeekEntryResult!6875)

(assert (=> b!645026 (= lt!299019 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299017 lt!299023 mask!3053))))

(declare-fun e!369618 () Bool)

(assert (=> b!645026 e!369618))

(declare-fun res!417842 () Bool)

(assert (=> b!645026 (=> (not res!417842) (not e!369618))))

(declare-fun lt!299022 () (_ BitVec 32))

(declare-fun lt!299026 () SeekEntryResult!6875)

(assert (=> b!645026 (= res!417842 (= lt!299026 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299022 vacantSpotIndex!68 lt!299017 lt!299023 mask!3053)))))

(assert (=> b!645026 (= lt!299026 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299022 vacantSpotIndex!68 (select (arr!18435 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645026 (= lt!299017 (select (store (arr!18435 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!299013 () Unit!21876)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38446 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21876)

(assert (=> b!645026 (= lt!299013 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299022 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645026 (= lt!299022 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645027 () Bool)

(declare-fun e!369617 () Bool)

(assert (=> b!645027 (= e!369617 e!369622)))

(declare-fun res!417850 () Bool)

(assert (=> b!645027 (=> (not res!417850) (not e!369622))))

(declare-fun lt!299015 () SeekEntryResult!6875)

(assert (=> b!645027 (= res!417850 (or (= lt!299015 (MissingZero!6875 i!1108)) (= lt!299015 (MissingVacant!6875 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38446 (_ BitVec 32)) SeekEntryResult!6875)

(assert (=> b!645027 (= lt!299015 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!645028 () Bool)

(declare-fun res!417852 () Bool)

(assert (=> b!645028 (=> (not res!417852) (not e!369617))))

(assert (=> b!645028 (= res!417852 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645029 () Bool)

(declare-fun e!369621 () Unit!21876)

(declare-fun Unit!21878 () Unit!21876)

(assert (=> b!645029 (= e!369621 Unit!21878)))

(declare-fun b!645030 () Bool)

(declare-fun Unit!21879 () Unit!21876)

(assert (=> b!645030 (= e!369620 Unit!21879)))

(declare-fun b!645031 () Bool)

(declare-fun e!369615 () Bool)

(declare-fun e!369613 () Bool)

(assert (=> b!645031 (= e!369615 e!369613)))

(declare-fun res!417848 () Bool)

(assert (=> b!645031 (=> (not res!417848) (not e!369613))))

(assert (=> b!645031 (= res!417848 (arrayContainsKey!0 lt!299023 (select (arr!18435 a!2986) j!136) j!136))))

(declare-fun b!645032 () Bool)

(declare-fun res!417836 () Bool)

(assert (=> b!645032 (=> (not res!417836) (not e!369622))))

(assert (=> b!645032 (= res!417836 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18435 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645033 () Bool)

(declare-fun Unit!21880 () Unit!21876)

(assert (=> b!645033 (= e!369620 Unit!21880)))

(assert (=> b!645033 false))

(declare-fun res!417847 () Bool)

(assert (=> start!58430 (=> (not res!417847) (not e!369617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58430 (= res!417847 (validMask!0 mask!3053))))

(assert (=> start!58430 e!369617))

(assert (=> start!58430 true))

(declare-fun array_inv!14231 (array!38446) Bool)

(assert (=> start!58430 (array_inv!14231 a!2986)))

(declare-fun b!645034 () Bool)

(assert (=> b!645034 (= e!369625 (arrayContainsKey!0 lt!299023 (select (arr!18435 a!2986) j!136) index!984))))

(declare-fun b!645035 () Bool)

(declare-fun res!417841 () Bool)

(assert (=> b!645035 (=> (not res!417841) (not e!369617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645035 (= res!417841 (validKeyInArray!0 k!1786))))

(declare-fun b!645036 () Bool)

(declare-fun res!417849 () Bool)

(assert (=> b!645036 (=> (not res!417849) (not e!369622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38446 (_ BitVec 32)) Bool)

(assert (=> b!645036 (= res!417849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645037 () Bool)

(assert (=> b!645037 (= e!369624 e!369627)))

(declare-fun res!417837 () Bool)

(assert (=> b!645037 (=> res!417837 e!369627)))

(assert (=> b!645037 (= res!417837 (bvsge index!984 j!136))))

(declare-fun lt!299014 () Unit!21876)

(assert (=> b!645037 (= lt!299014 e!369621)))

(declare-fun c!73961 () Bool)

(assert (=> b!645037 (= c!73961 (bvslt j!136 index!984))))

(declare-fun b!645038 () Bool)

(declare-fun res!417839 () Bool)

(assert (=> b!645038 (=> (not res!417839) (not e!369617))))

(assert (=> b!645038 (= res!417839 (validKeyInArray!0 (select (arr!18435 a!2986) j!136)))))

(declare-fun b!645039 () Bool)

(assert (=> b!645039 (= e!369619 e!369615)))

(declare-fun res!417843 () Bool)

(assert (=> b!645039 (=> res!417843 e!369615)))

(assert (=> b!645039 (= res!417843 (or (not (= (select (arr!18435 a!2986) j!136) lt!299017)) (not (= (select (arr!18435 a!2986) j!136) lt!299016)) (bvsge j!136 index!984)))))

(declare-fun b!645040 () Bool)

(declare-fun lt!299025 () SeekEntryResult!6875)

(assert (=> b!645040 (= e!369618 (= lt!299025 lt!299026))))

(declare-fun b!645041 () Bool)

(assert (=> b!645041 (= e!369613 (arrayContainsKey!0 lt!299023 (select (arr!18435 a!2986) j!136) index!984))))

(declare-fun b!645042 () Bool)

(assert (=> b!645042 (= e!369614 e!369623)))

(declare-fun res!417851 () Bool)

(assert (=> b!645042 (=> (not res!417851) (not e!369623))))

(assert (=> b!645042 (= res!417851 (and (= lt!299025 (Found!6875 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18435 a!2986) index!984) (select (arr!18435 a!2986) j!136))) (not (= (select (arr!18435 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645042 (= lt!299025 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18435 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645043 () Bool)

(declare-fun Unit!21881 () Unit!21876)

(assert (=> b!645043 (= e!369621 Unit!21881)))

(declare-fun lt!299024 () Unit!21876)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38446 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21876)

(assert (=> b!645043 (= lt!299024 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299023 (select (arr!18435 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645043 (arrayContainsKey!0 lt!299023 (select (arr!18435 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299018 () Unit!21876)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38446 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12476) Unit!21876)

(assert (=> b!645043 (= lt!299018 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12473))))

(assert (=> b!645043 (arrayNoDuplicates!0 lt!299023 #b00000000000000000000000000000000 Nil!12473)))

(declare-fun lt!299012 () Unit!21876)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38446 (_ BitVec 32) (_ BitVec 32)) Unit!21876)

(assert (=> b!645043 (= lt!299012 (lemmaNoDuplicateFromThenFromBigger!0 lt!299023 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645043 (arrayNoDuplicates!0 lt!299023 j!136 Nil!12473)))

(declare-fun lt!299021 () Unit!21876)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38446 (_ BitVec 64) (_ BitVec 32) List!12476) Unit!21876)

(assert (=> b!645043 (= lt!299021 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299023 (select (arr!18435 a!2986) j!136) j!136 Nil!12473))))

(assert (=> b!645043 false))

(declare-fun b!645044 () Bool)

(declare-fun res!417854 () Bool)

(assert (=> b!645044 (=> (not res!417854) (not e!369617))))

(assert (=> b!645044 (= res!417854 (and (= (size!18799 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18799 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18799 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!58430 res!417847) b!645044))

(assert (= (and b!645044 res!417854) b!645038))

(assert (= (and b!645038 res!417839) b!645035))

(assert (= (and b!645035 res!417841) b!645028))

(assert (= (and b!645028 res!417852) b!645027))

(assert (= (and b!645027 res!417850) b!645036))

(assert (= (and b!645036 res!417849) b!645024))

(assert (= (and b!645024 res!417845) b!645032))

(assert (= (and b!645032 res!417836) b!645023))

(assert (= (and b!645023 res!417853) b!645042))

(assert (= (and b!645042 res!417851) b!645026))

(assert (= (and b!645026 res!417842) b!645040))

(assert (= (and b!645026 c!73960) b!645033))

(assert (= (and b!645026 (not c!73960)) b!645030))

(assert (= (and b!645026 (not res!417838)) b!645022))

(assert (= (and b!645022 res!417844) b!645039))

(assert (= (and b!645039 (not res!417843)) b!645031))

(assert (= (and b!645031 res!417848) b!645041))

(assert (= (and b!645022 (not res!417840)) b!645037))

(assert (= (and b!645037 c!73961) b!645043))

(assert (= (and b!645037 (not c!73961)) b!645029))

(assert (= (and b!645037 (not res!417837)) b!645025))

(assert (= (and b!645025 res!417846) b!645034))

(declare-fun m!618581 () Bool)

(assert (=> b!645022 m!618581))

(declare-fun m!618583 () Bool)

(assert (=> b!645022 m!618583))

(declare-fun m!618585 () Bool)

(assert (=> b!645022 m!618585))

(assert (=> b!645031 m!618581))

(assert (=> b!645031 m!618581))

(declare-fun m!618587 () Bool)

(assert (=> b!645031 m!618587))

(declare-fun m!618589 () Bool)

(assert (=> b!645042 m!618589))

(assert (=> b!645042 m!618581))

(assert (=> b!645042 m!618581))

(declare-fun m!618591 () Bool)

(assert (=> b!645042 m!618591))

(declare-fun m!618593 () Bool)

(assert (=> b!645027 m!618593))

(assert (=> b!645041 m!618581))

(assert (=> b!645041 m!618581))

(declare-fun m!618595 () Bool)

(assert (=> b!645041 m!618595))

(declare-fun m!618597 () Bool)

(assert (=> b!645026 m!618597))

(assert (=> b!645026 m!618581))

(assert (=> b!645026 m!618583))

(declare-fun m!618599 () Bool)

(assert (=> b!645026 m!618599))

(declare-fun m!618601 () Bool)

(assert (=> b!645026 m!618601))

(declare-fun m!618603 () Bool)

(assert (=> b!645026 m!618603))

(declare-fun m!618605 () Bool)

(assert (=> b!645026 m!618605))

(assert (=> b!645026 m!618581))

(declare-fun m!618607 () Bool)

(assert (=> b!645026 m!618607))

(declare-fun m!618609 () Bool)

(assert (=> start!58430 m!618609))

(declare-fun m!618611 () Bool)

(assert (=> start!58430 m!618611))

(declare-fun m!618613 () Bool)

(assert (=> b!645028 m!618613))

(assert (=> b!645023 m!618583))

(declare-fun m!618615 () Bool)

(assert (=> b!645023 m!618615))

(declare-fun m!618617 () Bool)

(assert (=> b!645032 m!618617))

(assert (=> b!645034 m!618581))

(assert (=> b!645034 m!618581))

(assert (=> b!645034 m!618595))

(declare-fun m!618619 () Bool)

(assert (=> b!645024 m!618619))

(assert (=> b!645039 m!618581))

(assert (=> b!645025 m!618581))

(assert (=> b!645025 m!618581))

(assert (=> b!645025 m!618587))

(declare-fun m!618621 () Bool)

(assert (=> b!645036 m!618621))

(declare-fun m!618623 () Bool)

(assert (=> b!645035 m!618623))

(assert (=> b!645038 m!618581))

(assert (=> b!645038 m!618581))

(declare-fun m!618625 () Bool)

(assert (=> b!645038 m!618625))

(assert (=> b!645043 m!618581))

(declare-fun m!618627 () Bool)

(assert (=> b!645043 m!618627))

(declare-fun m!618629 () Bool)

(assert (=> b!645043 m!618629))

(assert (=> b!645043 m!618581))

(declare-fun m!618631 () Bool)

(assert (=> b!645043 m!618631))

(declare-fun m!618633 () Bool)

(assert (=> b!645043 m!618633))

(assert (=> b!645043 m!618581))

(declare-fun m!618635 () Bool)

(assert (=> b!645043 m!618635))

(assert (=> b!645043 m!618581))

(declare-fun m!618637 () Bool)

(assert (=> b!645043 m!618637))

(declare-fun m!618639 () Bool)

(assert (=> b!645043 m!618639))

(push 1)

