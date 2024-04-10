; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59576 () Bool)

(assert start!59576)

(declare-fun b!658004 () Bool)

(declare-datatypes ((Unit!22794 0))(
  ( (Unit!22795) )
))
(declare-fun e!378004 () Unit!22794)

(declare-fun Unit!22796 () Unit!22794)

(assert (=> b!658004 (= e!378004 Unit!22796)))

(declare-fun b!658005 () Bool)

(declare-fun Unit!22797 () Unit!22794)

(assert (=> b!658005 (= e!378004 Unit!22797)))

(assert (=> b!658005 false))

(declare-fun res!426705 () Bool)

(declare-fun e!378009 () Bool)

(assert (=> start!59576 (=> (not res!426705) (not e!378009))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59576 (= res!426705 (validMask!0 mask!3053))))

(assert (=> start!59576 e!378009))

(assert (=> start!59576 true))

(declare-datatypes ((array!38734 0))(
  ( (array!38735 (arr!18564 (Array (_ BitVec 32) (_ BitVec 64))) (size!18928 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38734)

(declare-fun array_inv!14360 (array!38734) Bool)

(assert (=> start!59576 (array_inv!14360 a!2986)))

(declare-fun b!658006 () Bool)

(declare-fun res!426703 () Bool)

(declare-fun e!378000 () Bool)

(assert (=> b!658006 (=> (not res!426703) (not e!378000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38734 (_ BitVec 32)) Bool)

(assert (=> b!658006 (= res!426703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658007 () Bool)

(declare-fun e!378008 () Unit!22794)

(declare-fun Unit!22798 () Unit!22794)

(assert (=> b!658007 (= e!378008 Unit!22798)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!658008 () Bool)

(declare-fun e!378011 () Bool)

(declare-fun lt!307522 () array!38734)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658008 (= e!378011 (arrayContainsKey!0 lt!307522 (select (arr!18564 a!2986) j!136) index!984))))

(declare-fun b!658009 () Bool)

(assert (=> b!658009 (= e!378009 e!378000)))

(declare-fun res!426702 () Bool)

(assert (=> b!658009 (=> (not res!426702) (not e!378000))))

(declare-datatypes ((SeekEntryResult!7004 0))(
  ( (MissingZero!7004 (index!30381 (_ BitVec 32))) (Found!7004 (index!30382 (_ BitVec 32))) (Intermediate!7004 (undefined!7816 Bool) (index!30383 (_ BitVec 32)) (x!59175 (_ BitVec 32))) (Undefined!7004) (MissingVacant!7004 (index!30384 (_ BitVec 32))) )
))
(declare-fun lt!307517 () SeekEntryResult!7004)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!658009 (= res!426702 (or (= lt!307517 (MissingZero!7004 i!1108)) (= lt!307517 (MissingVacant!7004 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38734 (_ BitVec 32)) SeekEntryResult!7004)

(assert (=> b!658009 (= lt!307517 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!658010 () Bool)

(declare-fun e!378005 () Bool)

(declare-fun lt!307520 () SeekEntryResult!7004)

(declare-fun lt!307527 () SeekEntryResult!7004)

(assert (=> b!658010 (= e!378005 (= lt!307520 lt!307527))))

(declare-fun b!658011 () Bool)

(declare-fun res!426700 () Bool)

(assert (=> b!658011 (=> (not res!426700) (not e!378009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658011 (= res!426700 (validKeyInArray!0 k!1786))))

(declare-fun b!658012 () Bool)

(declare-fun e!377998 () Bool)

(declare-fun e!378012 () Bool)

(assert (=> b!658012 (= e!377998 e!378012)))

(declare-fun res!426711 () Bool)

(assert (=> b!658012 (=> (not res!426711) (not e!378012))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!658012 (= res!426711 (and (= lt!307520 (Found!7004 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18564 a!2986) index!984) (select (arr!18564 a!2986) j!136))) (not (= (select (arr!18564 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38734 (_ BitVec 32)) SeekEntryResult!7004)

(assert (=> b!658012 (= lt!307520 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18564 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658013 () Bool)

(declare-fun e!378002 () Bool)

(assert (=> b!658013 (= e!378002 true)))

(assert (=> b!658013 (= (select (store (arr!18564 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!658014 () Bool)

(declare-fun res!426710 () Bool)

(assert (=> b!658014 (=> (not res!426710) (not e!378000))))

(assert (=> b!658014 (= res!426710 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18564 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658015 () Bool)

(assert (=> b!658015 (= e!378012 (not e!378002))))

(declare-fun res!426716 () Bool)

(assert (=> b!658015 (=> res!426716 e!378002)))

(declare-fun lt!307511 () SeekEntryResult!7004)

(assert (=> b!658015 (= res!426716 (not (= lt!307511 (MissingVacant!7004 vacantSpotIndex!68))))))

(declare-fun lt!307513 () Unit!22794)

(assert (=> b!658015 (= lt!307513 e!378008)))

(declare-fun c!76022 () Bool)

(assert (=> b!658015 (= c!76022 (= lt!307511 (Found!7004 index!984)))))

(declare-fun lt!307519 () Unit!22794)

(assert (=> b!658015 (= lt!307519 e!378004)))

(declare-fun c!76019 () Bool)

(assert (=> b!658015 (= c!76019 (= lt!307511 Undefined!7004))))

(declare-fun lt!307516 () (_ BitVec 64))

(assert (=> b!658015 (= lt!307511 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307516 lt!307522 mask!3053))))

(assert (=> b!658015 e!378005))

(declare-fun res!426715 () Bool)

(assert (=> b!658015 (=> (not res!426715) (not e!378005))))

(declare-fun lt!307521 () (_ BitVec 32))

(assert (=> b!658015 (= res!426715 (= lt!307527 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307521 vacantSpotIndex!68 lt!307516 lt!307522 mask!3053)))))

(assert (=> b!658015 (= lt!307527 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307521 vacantSpotIndex!68 (select (arr!18564 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658015 (= lt!307516 (select (store (arr!18564 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!307518 () Unit!22794)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38734 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22794)

(assert (=> b!658015 (= lt!307518 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307521 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658015 (= lt!307521 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!426713 () Bool)

(declare-fun b!658016 () Bool)

(assert (=> b!658016 (= res!426713 (arrayContainsKey!0 lt!307522 (select (arr!18564 a!2986) j!136) j!136))))

(declare-fun e!378006 () Bool)

(assert (=> b!658016 (=> (not res!426713) (not e!378006))))

(declare-fun e!378003 () Bool)

(assert (=> b!658016 (= e!378003 e!378006)))

(declare-fun b!658017 () Bool)

(declare-fun res!426701 () Bool)

(assert (=> b!658017 (=> (not res!426701) (not e!378009))))

(assert (=> b!658017 (= res!426701 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658018 () Bool)

(declare-fun res!426706 () Bool)

(assert (=> b!658018 (=> (not res!426706) (not e!378000))))

(declare-datatypes ((List!12605 0))(
  ( (Nil!12602) (Cons!12601 (h!13646 (_ BitVec 64)) (t!18833 List!12605)) )
))
(declare-fun arrayNoDuplicates!0 (array!38734 (_ BitVec 32) List!12605) Bool)

(assert (=> b!658018 (= res!426706 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12602))))

(declare-fun b!658019 () Bool)

(declare-fun res!426707 () Bool)

(assert (=> b!658019 (= res!426707 (bvsge j!136 index!984))))

(assert (=> b!658019 (=> res!426707 e!378003)))

(declare-fun e!378010 () Bool)

(assert (=> b!658019 (= e!378010 e!378003)))

(declare-fun b!658020 () Bool)

(assert (=> b!658020 (= e!378000 e!377998)))

(declare-fun res!426708 () Bool)

(assert (=> b!658020 (=> (not res!426708) (not e!377998))))

(assert (=> b!658020 (= res!426708 (= (select (store (arr!18564 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658020 (= lt!307522 (array!38735 (store (arr!18564 a!2986) i!1108 k!1786) (size!18928 a!2986)))))

(declare-fun b!658021 () Bool)

(assert (=> b!658021 false))

(declare-fun lt!307515 () Unit!22794)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38734 (_ BitVec 64) (_ BitVec 32) List!12605) Unit!22794)

(assert (=> b!658021 (= lt!307515 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307522 (select (arr!18564 a!2986) j!136) index!984 Nil!12602))))

(assert (=> b!658021 (arrayNoDuplicates!0 lt!307522 index!984 Nil!12602)))

(declare-fun lt!307525 () Unit!22794)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38734 (_ BitVec 32) (_ BitVec 32)) Unit!22794)

(assert (=> b!658021 (= lt!307525 (lemmaNoDuplicateFromThenFromBigger!0 lt!307522 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658021 (arrayNoDuplicates!0 lt!307522 #b00000000000000000000000000000000 Nil!12602)))

(declare-fun lt!307526 () Unit!22794)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38734 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12605) Unit!22794)

(assert (=> b!658021 (= lt!307526 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12602))))

(assert (=> b!658021 (arrayContainsKey!0 lt!307522 (select (arr!18564 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307528 () Unit!22794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38734 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22794)

(assert (=> b!658021 (= lt!307528 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307522 (select (arr!18564 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!658021 e!378011))

(declare-fun res!426704 () Bool)

(assert (=> b!658021 (=> (not res!426704) (not e!378011))))

(assert (=> b!658021 (= res!426704 (arrayContainsKey!0 lt!307522 (select (arr!18564 a!2986) j!136) j!136))))

(declare-fun e!377999 () Unit!22794)

(declare-fun Unit!22799 () Unit!22794)

(assert (=> b!658021 (= e!377999 Unit!22799)))

(declare-fun b!658022 () Bool)

(assert (=> b!658022 (= e!378006 (arrayContainsKey!0 lt!307522 (select (arr!18564 a!2986) j!136) index!984))))

(declare-fun b!658023 () Bool)

(assert (=> b!658023 false))

(declare-fun lt!307510 () Unit!22794)

(assert (=> b!658023 (= lt!307510 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307522 (select (arr!18564 a!2986) j!136) j!136 Nil!12602))))

(assert (=> b!658023 (arrayNoDuplicates!0 lt!307522 j!136 Nil!12602)))

(declare-fun lt!307523 () Unit!22794)

(assert (=> b!658023 (= lt!307523 (lemmaNoDuplicateFromThenFromBigger!0 lt!307522 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658023 (arrayNoDuplicates!0 lt!307522 #b00000000000000000000000000000000 Nil!12602)))

(declare-fun lt!307512 () Unit!22794)

(assert (=> b!658023 (= lt!307512 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12602))))

(assert (=> b!658023 (arrayContainsKey!0 lt!307522 (select (arr!18564 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307514 () Unit!22794)

(assert (=> b!658023 (= lt!307514 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307522 (select (arr!18564 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378001 () Unit!22794)

(declare-fun Unit!22800 () Unit!22794)

(assert (=> b!658023 (= e!378001 Unit!22800)))

(declare-fun b!658024 () Bool)

(declare-fun Unit!22801 () Unit!22794)

(assert (=> b!658024 (= e!378001 Unit!22801)))

(declare-fun b!658025 () Bool)

(declare-fun res!426714 () Bool)

(assert (=> b!658025 (=> (not res!426714) (not e!378009))))

(assert (=> b!658025 (= res!426714 (and (= (size!18928 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18928 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18928 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658026 () Bool)

(declare-fun Unit!22802 () Unit!22794)

(assert (=> b!658026 (= e!377999 Unit!22802)))

(declare-fun b!658027 () Bool)

(declare-fun res!426712 () Bool)

(assert (=> b!658027 (=> (not res!426712) (not e!378009))))

(assert (=> b!658027 (= res!426712 (validKeyInArray!0 (select (arr!18564 a!2986) j!136)))))

(declare-fun b!658028 () Bool)

(declare-fun Unit!22803 () Unit!22794)

(assert (=> b!658028 (= e!378008 Unit!22803)))

(declare-fun res!426709 () Bool)

(assert (=> b!658028 (= res!426709 (= (select (store (arr!18564 a!2986) i!1108 k!1786) index!984) (select (arr!18564 a!2986) j!136)))))

(assert (=> b!658028 (=> (not res!426709) (not e!378010))))

(assert (=> b!658028 e!378010))

(declare-fun c!76020 () Bool)

(assert (=> b!658028 (= c!76020 (bvslt j!136 index!984))))

(declare-fun lt!307524 () Unit!22794)

(assert (=> b!658028 (= lt!307524 e!378001)))

(declare-fun c!76021 () Bool)

(assert (=> b!658028 (= c!76021 (bvslt index!984 j!136))))

(declare-fun lt!307509 () Unit!22794)

(assert (=> b!658028 (= lt!307509 e!377999)))

(assert (=> b!658028 false))

(assert (= (and start!59576 res!426705) b!658025))

(assert (= (and b!658025 res!426714) b!658027))

(assert (= (and b!658027 res!426712) b!658011))

(assert (= (and b!658011 res!426700) b!658017))

(assert (= (and b!658017 res!426701) b!658009))

(assert (= (and b!658009 res!426702) b!658006))

(assert (= (and b!658006 res!426703) b!658018))

(assert (= (and b!658018 res!426706) b!658014))

(assert (= (and b!658014 res!426710) b!658020))

(assert (= (and b!658020 res!426708) b!658012))

(assert (= (and b!658012 res!426711) b!658015))

(assert (= (and b!658015 res!426715) b!658010))

(assert (= (and b!658015 c!76019) b!658005))

(assert (= (and b!658015 (not c!76019)) b!658004))

(assert (= (and b!658015 c!76022) b!658028))

(assert (= (and b!658015 (not c!76022)) b!658007))

(assert (= (and b!658028 res!426709) b!658019))

(assert (= (and b!658019 (not res!426707)) b!658016))

(assert (= (and b!658016 res!426713) b!658022))

(assert (= (and b!658028 c!76020) b!658023))

(assert (= (and b!658028 (not c!76020)) b!658024))

(assert (= (and b!658028 c!76021) b!658021))

(assert (= (and b!658028 (not c!76021)) b!658026))

(assert (= (and b!658021 res!426704) b!658008))

(assert (= (and b!658015 (not res!426716)) b!658013))

(declare-fun m!631007 () Bool)

(assert (=> b!658022 m!631007))

(assert (=> b!658022 m!631007))

(declare-fun m!631009 () Bool)

(assert (=> b!658022 m!631009))

(declare-fun m!631011 () Bool)

(assert (=> b!658014 m!631011))

(declare-fun m!631013 () Bool)

(assert (=> b!658006 m!631013))

(assert (=> b!658027 m!631007))

(assert (=> b!658027 m!631007))

(declare-fun m!631015 () Bool)

(assert (=> b!658027 m!631015))

(assert (=> b!658008 m!631007))

(assert (=> b!658008 m!631007))

(assert (=> b!658008 m!631009))

(assert (=> b!658016 m!631007))

(assert (=> b!658016 m!631007))

(declare-fun m!631017 () Bool)

(assert (=> b!658016 m!631017))

(declare-fun m!631019 () Bool)

(assert (=> b!658023 m!631019))

(assert (=> b!658023 m!631007))

(declare-fun m!631021 () Bool)

(assert (=> b!658023 m!631021))

(assert (=> b!658023 m!631007))

(declare-fun m!631023 () Bool)

(assert (=> b!658023 m!631023))

(declare-fun m!631025 () Bool)

(assert (=> b!658023 m!631025))

(declare-fun m!631027 () Bool)

(assert (=> b!658023 m!631027))

(assert (=> b!658023 m!631007))

(declare-fun m!631029 () Bool)

(assert (=> b!658023 m!631029))

(assert (=> b!658023 m!631007))

(declare-fun m!631031 () Bool)

(assert (=> b!658023 m!631031))

(declare-fun m!631033 () Bool)

(assert (=> b!658009 m!631033))

(declare-fun m!631035 () Bool)

(assert (=> b!658012 m!631035))

(assert (=> b!658012 m!631007))

(assert (=> b!658012 m!631007))

(declare-fun m!631037 () Bool)

(assert (=> b!658012 m!631037))

(declare-fun m!631039 () Bool)

(assert (=> start!59576 m!631039))

(declare-fun m!631041 () Bool)

(assert (=> start!59576 m!631041))

(declare-fun m!631043 () Bool)

(assert (=> b!658015 m!631043))

(declare-fun m!631045 () Bool)

(assert (=> b!658015 m!631045))

(assert (=> b!658015 m!631007))

(declare-fun m!631047 () Bool)

(assert (=> b!658015 m!631047))

(declare-fun m!631049 () Bool)

(assert (=> b!658015 m!631049))

(declare-fun m!631051 () Bool)

(assert (=> b!658015 m!631051))

(declare-fun m!631053 () Bool)

(assert (=> b!658015 m!631053))

(assert (=> b!658015 m!631007))

(declare-fun m!631055 () Bool)

(assert (=> b!658015 m!631055))

(assert (=> b!658020 m!631047))

(declare-fun m!631057 () Bool)

(assert (=> b!658020 m!631057))

(assert (=> b!658028 m!631047))

(declare-fun m!631059 () Bool)

(assert (=> b!658028 m!631059))

(assert (=> b!658028 m!631007))

(declare-fun m!631061 () Bool)

(assert (=> b!658011 m!631061))

(declare-fun m!631063 () Bool)

(assert (=> b!658017 m!631063))

(declare-fun m!631065 () Bool)

(assert (=> b!658018 m!631065))

(assert (=> b!658021 m!631007))

(assert (=> b!658021 m!631017))

(assert (=> b!658021 m!631007))

(assert (=> b!658021 m!631007))

(declare-fun m!631067 () Bool)

(assert (=> b!658021 m!631067))

(declare-fun m!631069 () Bool)

(assert (=> b!658021 m!631069))

(assert (=> b!658021 m!631007))

(declare-fun m!631071 () Bool)

(assert (=> b!658021 m!631071))

(declare-fun m!631073 () Bool)

(assert (=> b!658021 m!631073))

(assert (=> b!658021 m!631025))

(assert (=> b!658021 m!631007))

(declare-fun m!631075 () Bool)

(assert (=> b!658021 m!631075))

(assert (=> b!658021 m!631027))

(assert (=> b!658013 m!631047))

(assert (=> b!658013 m!631059))

(push 1)

