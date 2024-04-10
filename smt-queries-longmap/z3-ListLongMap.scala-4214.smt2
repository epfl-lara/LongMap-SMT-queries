; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57802 () Bool)

(assert start!57802)

(declare-fun b!639135 () Bool)

(declare-fun res!413724 () Bool)

(declare-fun e!365772 () Bool)

(assert (=> b!639135 (=> (not res!413724) (not e!365772))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639135 (= res!413724 (validKeyInArray!0 k0!1786))))

(declare-fun b!639136 () Bool)

(declare-fun e!365777 () Bool)

(declare-datatypes ((SeekEntryResult!6813 0))(
  ( (MissingZero!6813 (index!29569 (_ BitVec 32))) (Found!6813 (index!29570 (_ BitVec 32))) (Intermediate!6813 (undefined!7625 Bool) (index!29571 (_ BitVec 32)) (x!58328 (_ BitVec 32))) (Undefined!6813) (MissingVacant!6813 (index!29572 (_ BitVec 32))) )
))
(declare-fun lt!295626 () SeekEntryResult!6813)

(declare-fun lt!295622 () SeekEntryResult!6813)

(assert (=> b!639136 (= e!365777 (= lt!295626 lt!295622))))

(declare-fun b!639137 () Bool)

(declare-fun e!365776 () Bool)

(declare-fun e!365774 () Bool)

(assert (=> b!639137 (= e!365776 e!365774)))

(declare-fun res!413719 () Bool)

(assert (=> b!639137 (=> res!413719 e!365774)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!295625 () (_ BitVec 64))

(declare-fun lt!295627 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38304 0))(
  ( (array!38305 (arr!18373 (Array (_ BitVec 32) (_ BitVec 64))) (size!18737 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38304)

(assert (=> b!639137 (= res!413719 (or (not (= (select (arr!18373 a!2986) j!136) lt!295625)) (not (= (select (arr!18373 a!2986) j!136) lt!295627)) (bvsge j!136 index!984)))))

(declare-fun b!639138 () Bool)

(declare-fun e!365769 () Bool)

(declare-fun e!365768 () Bool)

(assert (=> b!639138 (= e!365769 e!365768)))

(declare-fun res!413712 () Bool)

(assert (=> b!639138 (=> res!413712 e!365768)))

(assert (=> b!639138 (= res!413712 (or (not (= (select (arr!18373 a!2986) j!136) lt!295625)) (not (= (select (arr!18373 a!2986) j!136) lt!295627)) (bvsge j!136 index!984)))))

(assert (=> b!639138 e!365776))

(declare-fun res!413710 () Bool)

(assert (=> b!639138 (=> (not res!413710) (not e!365776))))

(assert (=> b!639138 (= res!413710 (= lt!295627 (select (arr!18373 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!639138 (= lt!295627 (select (store (arr!18373 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639139 () Bool)

(declare-fun e!365775 () Bool)

(assert (=> b!639139 (= e!365772 e!365775)))

(declare-fun res!413717 () Bool)

(assert (=> b!639139 (=> (not res!413717) (not e!365775))))

(declare-fun lt!295619 () SeekEntryResult!6813)

(assert (=> b!639139 (= res!413717 (or (= lt!295619 (MissingZero!6813 i!1108)) (= lt!295619 (MissingVacant!6813 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38304 (_ BitVec 32)) SeekEntryResult!6813)

(assert (=> b!639139 (= lt!295619 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!639140 () Bool)

(declare-fun e!365770 () Bool)

(declare-fun e!365773 () Bool)

(assert (=> b!639140 (= e!365770 e!365773)))

(declare-fun res!413714 () Bool)

(assert (=> b!639140 (=> (not res!413714) (not e!365773))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!639140 (= res!413714 (and (= lt!295626 (Found!6813 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18373 a!2986) index!984) (select (arr!18373 a!2986) j!136))) (not (= (select (arr!18373 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38304 (_ BitVec 32)) SeekEntryResult!6813)

(assert (=> b!639140 (= lt!295626 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18373 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639141 () Bool)

(assert (=> b!639141 (= e!365768 true)))

(declare-fun lt!295628 () array!38304)

(declare-datatypes ((List!12414 0))(
  ( (Nil!12411) (Cons!12410 (h!13455 (_ BitVec 64)) (t!18642 List!12414)) )
))
(declare-fun arrayNoDuplicates!0 (array!38304 (_ BitVec 32) List!12414) Bool)

(assert (=> b!639141 (arrayNoDuplicates!0 lt!295628 #b00000000000000000000000000000000 Nil!12411)))

(declare-datatypes ((Unit!21586 0))(
  ( (Unit!21587) )
))
(declare-fun lt!295623 () Unit!21586)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38304 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12414) Unit!21586)

(assert (=> b!639141 (= lt!295623 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12411))))

(declare-fun arrayContainsKey!0 (array!38304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639141 (arrayContainsKey!0 lt!295628 (select (arr!18373 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295624 () Unit!21586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38304 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21586)

(assert (=> b!639141 (= lt!295624 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295628 (select (arr!18373 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639142 () Bool)

(declare-fun res!413713 () Bool)

(assert (=> b!639142 (=> (not res!413713) (not e!365775))))

(assert (=> b!639142 (= res!413713 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12411))))

(declare-fun b!639134 () Bool)

(declare-fun e!365771 () Bool)

(assert (=> b!639134 (= e!365771 (arrayContainsKey!0 lt!295628 (select (arr!18373 a!2986) j!136) index!984))))

(declare-fun res!413715 () Bool)

(assert (=> start!57802 (=> (not res!413715) (not e!365772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57802 (= res!413715 (validMask!0 mask!3053))))

(assert (=> start!57802 e!365772))

(assert (=> start!57802 true))

(declare-fun array_inv!14169 (array!38304) Bool)

(assert (=> start!57802 (array_inv!14169 a!2986)))

(declare-fun b!639143 () Bool)

(declare-fun res!413721 () Bool)

(assert (=> b!639143 (=> (not res!413721) (not e!365772))))

(assert (=> b!639143 (= res!413721 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639144 () Bool)

(declare-fun res!413711 () Bool)

(assert (=> b!639144 (=> (not res!413711) (not e!365772))))

(assert (=> b!639144 (= res!413711 (and (= (size!18737 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18737 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18737 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639145 () Bool)

(declare-fun e!365767 () Unit!21586)

(declare-fun Unit!21588 () Unit!21586)

(assert (=> b!639145 (= e!365767 Unit!21588)))

(assert (=> b!639145 false))

(declare-fun b!639146 () Bool)

(declare-fun res!413723 () Bool)

(assert (=> b!639146 (=> (not res!413723) (not e!365775))))

(assert (=> b!639146 (= res!413723 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18373 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639147 () Bool)

(declare-fun res!413726 () Bool)

(assert (=> b!639147 (=> (not res!413726) (not e!365775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38304 (_ BitVec 32)) Bool)

(assert (=> b!639147 (= res!413726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639148 () Bool)

(declare-fun Unit!21589 () Unit!21586)

(assert (=> b!639148 (= e!365767 Unit!21589)))

(declare-fun b!639149 () Bool)

(assert (=> b!639149 (= e!365775 e!365770)))

(declare-fun res!413716 () Bool)

(assert (=> b!639149 (=> (not res!413716) (not e!365770))))

(assert (=> b!639149 (= res!413716 (= (select (store (arr!18373 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639149 (= lt!295628 (array!38305 (store (arr!18373 a!2986) i!1108 k0!1786) (size!18737 a!2986)))))

(declare-fun b!639150 () Bool)

(declare-fun res!413722 () Bool)

(assert (=> b!639150 (=> (not res!413722) (not e!365772))))

(assert (=> b!639150 (= res!413722 (validKeyInArray!0 (select (arr!18373 a!2986) j!136)))))

(declare-fun b!639151 () Bool)

(assert (=> b!639151 (= e!365773 (not e!365769))))

(declare-fun res!413725 () Bool)

(assert (=> b!639151 (=> res!413725 e!365769)))

(declare-fun lt!295629 () SeekEntryResult!6813)

(assert (=> b!639151 (= res!413725 (not (= lt!295629 (Found!6813 index!984))))))

(declare-fun lt!295620 () Unit!21586)

(assert (=> b!639151 (= lt!295620 e!365767)))

(declare-fun c!73079 () Bool)

(assert (=> b!639151 (= c!73079 (= lt!295629 Undefined!6813))))

(assert (=> b!639151 (= lt!295629 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295625 lt!295628 mask!3053))))

(assert (=> b!639151 e!365777))

(declare-fun res!413718 () Bool)

(assert (=> b!639151 (=> (not res!413718) (not e!365777))))

(declare-fun lt!295621 () (_ BitVec 32))

(assert (=> b!639151 (= res!413718 (= lt!295622 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295621 vacantSpotIndex!68 lt!295625 lt!295628 mask!3053)))))

(assert (=> b!639151 (= lt!295622 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295621 vacantSpotIndex!68 (select (arr!18373 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639151 (= lt!295625 (select (store (arr!18373 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295630 () Unit!21586)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38304 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21586)

(assert (=> b!639151 (= lt!295630 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295621 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639151 (= lt!295621 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639152 () Bool)

(assert (=> b!639152 (= e!365774 e!365771)))

(declare-fun res!413720 () Bool)

(assert (=> b!639152 (=> (not res!413720) (not e!365771))))

(assert (=> b!639152 (= res!413720 (arrayContainsKey!0 lt!295628 (select (arr!18373 a!2986) j!136) j!136))))

(assert (= (and start!57802 res!413715) b!639144))

(assert (= (and b!639144 res!413711) b!639150))

(assert (= (and b!639150 res!413722) b!639135))

(assert (= (and b!639135 res!413724) b!639143))

(assert (= (and b!639143 res!413721) b!639139))

(assert (= (and b!639139 res!413717) b!639147))

(assert (= (and b!639147 res!413726) b!639142))

(assert (= (and b!639142 res!413713) b!639146))

(assert (= (and b!639146 res!413723) b!639149))

(assert (= (and b!639149 res!413716) b!639140))

(assert (= (and b!639140 res!413714) b!639151))

(assert (= (and b!639151 res!413718) b!639136))

(assert (= (and b!639151 c!73079) b!639145))

(assert (= (and b!639151 (not c!73079)) b!639148))

(assert (= (and b!639151 (not res!413725)) b!639138))

(assert (= (and b!639138 res!413710) b!639137))

(assert (= (and b!639137 (not res!413719)) b!639152))

(assert (= (and b!639152 res!413720) b!639134))

(assert (= (and b!639138 (not res!413712)) b!639141))

(declare-fun m!613013 () Bool)

(assert (=> b!639142 m!613013))

(declare-fun m!613015 () Bool)

(assert (=> b!639141 m!613015))

(assert (=> b!639141 m!613015))

(declare-fun m!613017 () Bool)

(assert (=> b!639141 m!613017))

(declare-fun m!613019 () Bool)

(assert (=> b!639141 m!613019))

(assert (=> b!639141 m!613015))

(declare-fun m!613021 () Bool)

(assert (=> b!639141 m!613021))

(declare-fun m!613023 () Bool)

(assert (=> b!639141 m!613023))

(declare-fun m!613025 () Bool)

(assert (=> b!639143 m!613025))

(assert (=> b!639134 m!613015))

(assert (=> b!639134 m!613015))

(declare-fun m!613027 () Bool)

(assert (=> b!639134 m!613027))

(declare-fun m!613029 () Bool)

(assert (=> start!57802 m!613029))

(declare-fun m!613031 () Bool)

(assert (=> start!57802 m!613031))

(assert (=> b!639137 m!613015))

(assert (=> b!639152 m!613015))

(assert (=> b!639152 m!613015))

(declare-fun m!613033 () Bool)

(assert (=> b!639152 m!613033))

(assert (=> b!639138 m!613015))

(declare-fun m!613035 () Bool)

(assert (=> b!639138 m!613035))

(declare-fun m!613037 () Bool)

(assert (=> b!639138 m!613037))

(declare-fun m!613039 () Bool)

(assert (=> b!639139 m!613039))

(declare-fun m!613041 () Bool)

(assert (=> b!639146 m!613041))

(declare-fun m!613043 () Bool)

(assert (=> b!639147 m!613043))

(assert (=> b!639150 m!613015))

(assert (=> b!639150 m!613015))

(declare-fun m!613045 () Bool)

(assert (=> b!639150 m!613045))

(declare-fun m!613047 () Bool)

(assert (=> b!639140 m!613047))

(assert (=> b!639140 m!613015))

(assert (=> b!639140 m!613015))

(declare-fun m!613049 () Bool)

(assert (=> b!639140 m!613049))

(declare-fun m!613051 () Bool)

(assert (=> b!639135 m!613051))

(declare-fun m!613053 () Bool)

(assert (=> b!639151 m!613053))

(declare-fun m!613055 () Bool)

(assert (=> b!639151 m!613055))

(declare-fun m!613057 () Bool)

(assert (=> b!639151 m!613057))

(assert (=> b!639151 m!613035))

(assert (=> b!639151 m!613015))

(declare-fun m!613059 () Bool)

(assert (=> b!639151 m!613059))

(declare-fun m!613061 () Bool)

(assert (=> b!639151 m!613061))

(declare-fun m!613063 () Bool)

(assert (=> b!639151 m!613063))

(assert (=> b!639151 m!613015))

(assert (=> b!639149 m!613035))

(declare-fun m!613065 () Bool)

(assert (=> b!639149 m!613065))

(check-sat (not b!639152) (not b!639150) (not b!639147) (not b!639143) (not start!57802) (not b!639142) (not b!639139) (not b!639141) (not b!639151) (not b!639134) (not b!639135) (not b!639140))
(check-sat)
