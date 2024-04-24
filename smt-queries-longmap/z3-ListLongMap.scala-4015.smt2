; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54612 () Bool)

(assert start!54612)

(declare-fun b!596959 () Bool)

(declare-fun e!341077 () Bool)

(declare-datatypes ((array!37017 0))(
  ( (array!37018 (arr!17770 (Array (_ BitVec 32) (_ BitVec 64))) (size!18134 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37017)

(assert (=> b!596959 (= e!341077 (bvsle #b00000000000000000000000000000000 (size!18134 a!2986)))))

(declare-fun lt!271163 () array!37017)

(declare-datatypes ((List!11718 0))(
  ( (Nil!11715) (Cons!11714 (h!12762 (_ BitVec 64)) (t!17938 List!11718)) )
))
(declare-fun arrayNoDuplicates!0 (array!37017 (_ BitVec 32) List!11718) Bool)

(assert (=> b!596959 (arrayNoDuplicates!0 lt!271163 #b00000000000000000000000000000000 Nil!11715)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((Unit!18757 0))(
  ( (Unit!18758) )
))
(declare-fun lt!271171 () Unit!18757)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37017 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11718) Unit!18757)

(assert (=> b!596959 (= lt!271171 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11715))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596959 (arrayContainsKey!0 lt!271163 (select (arr!17770 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271168 () Unit!18757)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37017 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18757)

(assert (=> b!596959 (= lt!271168 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271163 (select (arr!17770 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596960 () Bool)

(declare-fun e!341079 () Bool)

(declare-datatypes ((SeekEntryResult!6166 0))(
  ( (MissingZero!6166 (index!26912 (_ BitVec 32))) (Found!6166 (index!26913 (_ BitVec 32))) (Intermediate!6166 (undefined!6978 Bool) (index!26914 (_ BitVec 32)) (x!55861 (_ BitVec 32))) (Undefined!6166) (MissingVacant!6166 (index!26915 (_ BitVec 32))) )
))
(declare-fun lt!271161 () SeekEntryResult!6166)

(declare-fun lt!271166 () SeekEntryResult!6166)

(assert (=> b!596960 (= e!341079 (= lt!271161 lt!271166))))

(declare-fun b!596961 () Bool)

(declare-fun e!341076 () Bool)

(declare-fun e!341084 () Bool)

(assert (=> b!596961 (= e!341076 e!341084)))

(declare-fun res!382618 () Bool)

(assert (=> b!596961 (=> (not res!382618) (not e!341084))))

(assert (=> b!596961 (= res!382618 (arrayContainsKey!0 lt!271163 (select (arr!17770 a!2986) j!136) j!136))))

(declare-fun b!596962 () Bool)

(declare-fun e!341083 () Bool)

(declare-fun e!341085 () Bool)

(assert (=> b!596962 (= e!341083 (not e!341085))))

(declare-fun res!382623 () Bool)

(assert (=> b!596962 (=> res!382623 e!341085)))

(declare-fun lt!271164 () SeekEntryResult!6166)

(assert (=> b!596962 (= res!382623 (not (= lt!271164 (Found!6166 index!984))))))

(declare-fun lt!271169 () Unit!18757)

(declare-fun e!341074 () Unit!18757)

(assert (=> b!596962 (= lt!271169 e!341074)))

(declare-fun c!67541 () Bool)

(assert (=> b!596962 (= c!67541 (= lt!271164 Undefined!6166))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!271167 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37017 (_ BitVec 32)) SeekEntryResult!6166)

(assert (=> b!596962 (= lt!271164 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271167 lt!271163 mask!3053))))

(assert (=> b!596962 e!341079))

(declare-fun res!382627 () Bool)

(assert (=> b!596962 (=> (not res!382627) (not e!341079))))

(declare-fun lt!271162 () (_ BitVec 32))

(assert (=> b!596962 (= res!382627 (= lt!271166 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271162 vacantSpotIndex!68 lt!271167 lt!271163 mask!3053)))))

(assert (=> b!596962 (= lt!271166 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271162 vacantSpotIndex!68 (select (arr!17770 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596962 (= lt!271167 (select (store (arr!17770 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271165 () Unit!18757)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18757)

(assert (=> b!596962 (= lt!271165 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271162 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596962 (= lt!271162 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!596963 () Bool)

(declare-fun res!382629 () Bool)

(declare-fun e!341082 () Bool)

(assert (=> b!596963 (=> (not res!382629) (not e!341082))))

(assert (=> b!596963 (= res!382629 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11715))))

(declare-fun b!596964 () Bool)

(declare-fun res!382620 () Bool)

(assert (=> b!596964 (=> (not res!382620) (not e!341082))))

(assert (=> b!596964 (= res!382620 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17770 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596965 () Bool)

(declare-fun e!341081 () Bool)

(assert (=> b!596965 (= e!341082 e!341081)))

(declare-fun res!382628 () Bool)

(assert (=> b!596965 (=> (not res!382628) (not e!341081))))

(assert (=> b!596965 (= res!382628 (= (select (store (arr!17770 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596965 (= lt!271163 (array!37018 (store (arr!17770 a!2986) i!1108 k0!1786) (size!18134 a!2986)))))

(declare-fun b!596966 () Bool)

(declare-fun res!382626 () Bool)

(declare-fun e!341078 () Bool)

(assert (=> b!596966 (=> (not res!382626) (not e!341078))))

(assert (=> b!596966 (= res!382626 (and (= (size!18134 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18134 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18134 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596967 () Bool)

(declare-fun res!382622 () Bool)

(assert (=> b!596967 (=> (not res!382622) (not e!341078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596967 (= res!382622 (validKeyInArray!0 (select (arr!17770 a!2986) j!136)))))

(declare-fun b!596968 () Bool)

(declare-fun res!382621 () Bool)

(assert (=> b!596968 (=> (not res!382621) (not e!341078))))

(assert (=> b!596968 (= res!382621 (validKeyInArray!0 k0!1786))))

(declare-fun res!382614 () Bool)

(assert (=> start!54612 (=> (not res!382614) (not e!341078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54612 (= res!382614 (validMask!0 mask!3053))))

(assert (=> start!54612 e!341078))

(assert (=> start!54612 true))

(declare-fun array_inv!13629 (array!37017) Bool)

(assert (=> start!54612 (array_inv!13629 a!2986)))

(declare-fun b!596969 () Bool)

(declare-fun Unit!18759 () Unit!18757)

(assert (=> b!596969 (= e!341074 Unit!18759)))

(assert (=> b!596969 false))

(declare-fun b!596970 () Bool)

(assert (=> b!596970 (= e!341078 e!341082)))

(declare-fun res!382619 () Bool)

(assert (=> b!596970 (=> (not res!382619) (not e!341082))))

(declare-fun lt!271160 () SeekEntryResult!6166)

(assert (=> b!596970 (= res!382619 (or (= lt!271160 (MissingZero!6166 i!1108)) (= lt!271160 (MissingVacant!6166 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37017 (_ BitVec 32)) SeekEntryResult!6166)

(assert (=> b!596970 (= lt!271160 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596971 () Bool)

(assert (=> b!596971 (= e!341085 e!341077)))

(declare-fun res!382630 () Bool)

(assert (=> b!596971 (=> res!382630 e!341077)))

(declare-fun lt!271170 () (_ BitVec 64))

(assert (=> b!596971 (= res!382630 (or (not (= (select (arr!17770 a!2986) j!136) lt!271167)) (not (= (select (arr!17770 a!2986) j!136) lt!271170)) (bvsge j!136 index!984)))))

(declare-fun e!341080 () Bool)

(assert (=> b!596971 e!341080))

(declare-fun res!382624 () Bool)

(assert (=> b!596971 (=> (not res!382624) (not e!341080))))

(assert (=> b!596971 (= res!382624 (= lt!271170 (select (arr!17770 a!2986) j!136)))))

(assert (=> b!596971 (= lt!271170 (select (store (arr!17770 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596972 () Bool)

(declare-fun res!382616 () Bool)

(assert (=> b!596972 (=> (not res!382616) (not e!341082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37017 (_ BitVec 32)) Bool)

(assert (=> b!596972 (= res!382616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596973 () Bool)

(assert (=> b!596973 (= e!341084 (arrayContainsKey!0 lt!271163 (select (arr!17770 a!2986) j!136) index!984))))

(declare-fun b!596974 () Bool)

(assert (=> b!596974 (= e!341081 e!341083)))

(declare-fun res!382625 () Bool)

(assert (=> b!596974 (=> (not res!382625) (not e!341083))))

(assert (=> b!596974 (= res!382625 (and (= lt!271161 (Found!6166 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17770 a!2986) index!984) (select (arr!17770 a!2986) j!136))) (not (= (select (arr!17770 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!596974 (= lt!271161 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17770 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596975 () Bool)

(declare-fun res!382617 () Bool)

(assert (=> b!596975 (=> (not res!382617) (not e!341078))))

(assert (=> b!596975 (= res!382617 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596976 () Bool)

(declare-fun Unit!18760 () Unit!18757)

(assert (=> b!596976 (= e!341074 Unit!18760)))

(declare-fun b!596977 () Bool)

(assert (=> b!596977 (= e!341080 e!341076)))

(declare-fun res!382615 () Bool)

(assert (=> b!596977 (=> res!382615 e!341076)))

(assert (=> b!596977 (= res!382615 (or (not (= (select (arr!17770 a!2986) j!136) lt!271167)) (not (= (select (arr!17770 a!2986) j!136) lt!271170)) (bvsge j!136 index!984)))))

(assert (= (and start!54612 res!382614) b!596966))

(assert (= (and b!596966 res!382626) b!596967))

(assert (= (and b!596967 res!382622) b!596968))

(assert (= (and b!596968 res!382621) b!596975))

(assert (= (and b!596975 res!382617) b!596970))

(assert (= (and b!596970 res!382619) b!596972))

(assert (= (and b!596972 res!382616) b!596963))

(assert (= (and b!596963 res!382629) b!596964))

(assert (= (and b!596964 res!382620) b!596965))

(assert (= (and b!596965 res!382628) b!596974))

(assert (= (and b!596974 res!382625) b!596962))

(assert (= (and b!596962 res!382627) b!596960))

(assert (= (and b!596962 c!67541) b!596969))

(assert (= (and b!596962 (not c!67541)) b!596976))

(assert (= (and b!596962 (not res!382623)) b!596971))

(assert (= (and b!596971 res!382624) b!596977))

(assert (= (and b!596977 (not res!382615)) b!596961))

(assert (= (and b!596961 res!382618) b!596973))

(assert (= (and b!596971 (not res!382630)) b!596959))

(declare-fun m!574613 () Bool)

(assert (=> b!596972 m!574613))

(declare-fun m!574615 () Bool)

(assert (=> b!596975 m!574615))

(declare-fun m!574617 () Bool)

(assert (=> b!596964 m!574617))

(declare-fun m!574619 () Bool)

(assert (=> b!596961 m!574619))

(assert (=> b!596961 m!574619))

(declare-fun m!574621 () Bool)

(assert (=> b!596961 m!574621))

(declare-fun m!574623 () Bool)

(assert (=> start!54612 m!574623))

(declare-fun m!574625 () Bool)

(assert (=> start!54612 m!574625))

(declare-fun m!574627 () Bool)

(assert (=> b!596962 m!574627))

(declare-fun m!574629 () Bool)

(assert (=> b!596962 m!574629))

(assert (=> b!596962 m!574619))

(declare-fun m!574631 () Bool)

(assert (=> b!596962 m!574631))

(declare-fun m!574633 () Bool)

(assert (=> b!596962 m!574633))

(assert (=> b!596962 m!574619))

(declare-fun m!574635 () Bool)

(assert (=> b!596962 m!574635))

(declare-fun m!574637 () Bool)

(assert (=> b!596962 m!574637))

(declare-fun m!574639 () Bool)

(assert (=> b!596962 m!574639))

(declare-fun m!574641 () Bool)

(assert (=> b!596959 m!574641))

(assert (=> b!596959 m!574619))

(declare-fun m!574643 () Bool)

(assert (=> b!596959 m!574643))

(declare-fun m!574645 () Bool)

(assert (=> b!596959 m!574645))

(assert (=> b!596959 m!574619))

(assert (=> b!596959 m!574619))

(declare-fun m!574647 () Bool)

(assert (=> b!596959 m!574647))

(declare-fun m!574649 () Bool)

(assert (=> b!596974 m!574649))

(assert (=> b!596974 m!574619))

(assert (=> b!596974 m!574619))

(declare-fun m!574651 () Bool)

(assert (=> b!596974 m!574651))

(assert (=> b!596971 m!574619))

(assert (=> b!596971 m!574635))

(declare-fun m!574653 () Bool)

(assert (=> b!596971 m!574653))

(assert (=> b!596967 m!574619))

(assert (=> b!596967 m!574619))

(declare-fun m!574655 () Bool)

(assert (=> b!596967 m!574655))

(assert (=> b!596965 m!574635))

(declare-fun m!574657 () Bool)

(assert (=> b!596965 m!574657))

(declare-fun m!574659 () Bool)

(assert (=> b!596963 m!574659))

(assert (=> b!596977 m!574619))

(assert (=> b!596973 m!574619))

(assert (=> b!596973 m!574619))

(declare-fun m!574661 () Bool)

(assert (=> b!596973 m!574661))

(declare-fun m!574663 () Bool)

(assert (=> b!596970 m!574663))

(declare-fun m!574665 () Bool)

(assert (=> b!596968 m!574665))

(check-sat (not b!596974) (not b!596959) (not b!596975) (not b!596970) (not start!54612) (not b!596972) (not b!596961) (not b!596973) (not b!596968) (not b!596963) (not b!596967) (not b!596962))
(check-sat)
