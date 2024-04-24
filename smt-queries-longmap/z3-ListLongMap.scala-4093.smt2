; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56106 () Bool)

(assert start!56106)

(declare-fun b!617632 () Bool)

(declare-fun res!397861 () Bool)

(declare-fun e!354175 () Bool)

(assert (=> b!617632 (=> (not res!397861) (not e!354175))))

(declare-datatypes ((array!37521 0))(
  ( (array!37522 (arr!18004 (Array (_ BitVec 32) (_ BitVec 64))) (size!18368 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37521)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617632 (= res!397861 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617633 () Bool)

(assert (=> b!617633 false))

(declare-fun lt!284401 () array!37521)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20197 0))(
  ( (Unit!20198) )
))
(declare-fun lt!284408 () Unit!20197)

(declare-datatypes ((List!11952 0))(
  ( (Nil!11949) (Cons!11948 (h!12996 (_ BitVec 64)) (t!18172 List!11952)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37521 (_ BitVec 64) (_ BitVec 32) List!11952) Unit!20197)

(assert (=> b!617633 (= lt!284408 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284401 (select (arr!18004 a!2986) j!136) j!136 Nil!11949))))

(declare-fun arrayNoDuplicates!0 (array!37521 (_ BitVec 32) List!11952) Bool)

(assert (=> b!617633 (arrayNoDuplicates!0 lt!284401 j!136 Nil!11949)))

(declare-fun lt!284411 () Unit!20197)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37521 (_ BitVec 32) (_ BitVec 32)) Unit!20197)

(assert (=> b!617633 (= lt!284411 (lemmaNoDuplicateFromThenFromBigger!0 lt!284401 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617633 (arrayNoDuplicates!0 lt!284401 #b00000000000000000000000000000000 Nil!11949)))

(declare-fun lt!284412 () Unit!20197)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37521 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11952) Unit!20197)

(assert (=> b!617633 (= lt!284412 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11949))))

(assert (=> b!617633 (arrayContainsKey!0 lt!284401 (select (arr!18004 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284407 () Unit!20197)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37521 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20197)

(assert (=> b!617633 (= lt!284407 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284401 (select (arr!18004 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!354174 () Unit!20197)

(declare-fun Unit!20199 () Unit!20197)

(assert (=> b!617633 (= e!354174 Unit!20199)))

(declare-fun b!617634 () Bool)

(declare-fun e!354179 () Unit!20197)

(declare-fun Unit!20200 () Unit!20197)

(assert (=> b!617634 (= e!354179 Unit!20200)))

(declare-fun b!617635 () Bool)

(declare-fun res!397873 () Bool)

(assert (=> b!617635 (=> (not res!397873) (not e!354175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617635 (= res!397873 (validKeyInArray!0 (select (arr!18004 a!2986) j!136)))))

(declare-fun b!617636 () Bool)

(declare-fun e!354182 () Bool)

(assert (=> b!617636 (= e!354182 true)))

(assert (=> b!617636 (= (select (store (arr!18004 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617637 () Bool)

(declare-fun e!354180 () Bool)

(assert (=> b!617637 (= e!354175 e!354180)))

(declare-fun res!397865 () Bool)

(assert (=> b!617637 (=> (not res!397865) (not e!354180))))

(declare-datatypes ((SeekEntryResult!6400 0))(
  ( (MissingZero!6400 (index!27884 (_ BitVec 32))) (Found!6400 (index!27885 (_ BitVec 32))) (Intermediate!6400 (undefined!7212 Bool) (index!27886 (_ BitVec 32)) (x!56827 (_ BitVec 32))) (Undefined!6400) (MissingVacant!6400 (index!27887 (_ BitVec 32))) )
))
(declare-fun lt!284419 () SeekEntryResult!6400)

(assert (=> b!617637 (= res!397865 (or (= lt!284419 (MissingZero!6400 i!1108)) (= lt!284419 (MissingVacant!6400 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37521 (_ BitVec 32)) SeekEntryResult!6400)

(assert (=> b!617637 (= lt!284419 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!617638 () Bool)

(declare-fun Unit!20201 () Unit!20197)

(assert (=> b!617638 (= e!354179 Unit!20201)))

(declare-fun res!397863 () Bool)

(assert (=> b!617638 (= res!397863 (= (select (store (arr!18004 a!2986) i!1108 k0!1786) index!984) (select (arr!18004 a!2986) j!136)))))

(declare-fun e!354177 () Bool)

(assert (=> b!617638 (=> (not res!397863) (not e!354177))))

(assert (=> b!617638 e!354177))

(declare-fun c!70258 () Bool)

(assert (=> b!617638 (= c!70258 (bvslt j!136 index!984))))

(declare-fun lt!284415 () Unit!20197)

(assert (=> b!617638 (= lt!284415 e!354174)))

(declare-fun c!70257 () Bool)

(assert (=> b!617638 (= c!70257 (bvslt index!984 j!136))))

(declare-fun lt!284409 () Unit!20197)

(declare-fun e!354173 () Unit!20197)

(assert (=> b!617638 (= lt!284409 e!354173)))

(assert (=> b!617638 false))

(declare-fun b!617639 () Bool)

(declare-fun e!354183 () Bool)

(assert (=> b!617639 (= e!354180 e!354183)))

(declare-fun res!397869 () Bool)

(assert (=> b!617639 (=> (not res!397869) (not e!354183))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!617639 (= res!397869 (= (select (store (arr!18004 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617639 (= lt!284401 (array!37522 (store (arr!18004 a!2986) i!1108 k0!1786) (size!18368 a!2986)))))

(declare-fun b!617640 () Bool)

(declare-fun res!397859 () Bool)

(assert (=> b!617640 (=> (not res!397859) (not e!354175))))

(assert (=> b!617640 (= res!397859 (and (= (size!18368 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18368 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18368 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617642 () Bool)

(declare-fun res!397868 () Bool)

(assert (=> b!617642 (= res!397868 (bvsge j!136 index!984))))

(declare-fun e!354185 () Bool)

(assert (=> b!617642 (=> res!397868 e!354185)))

(assert (=> b!617642 (= e!354177 e!354185)))

(declare-fun b!617643 () Bool)

(declare-fun e!354186 () Bool)

(assert (=> b!617643 (= e!354183 e!354186)))

(declare-fun res!397862 () Bool)

(assert (=> b!617643 (=> (not res!397862) (not e!354186))))

(declare-fun lt!284410 () SeekEntryResult!6400)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!617643 (= res!397862 (and (= lt!284410 (Found!6400 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18004 a!2986) index!984) (select (arr!18004 a!2986) j!136))) (not (= (select (arr!18004 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37521 (_ BitVec 32)) SeekEntryResult!6400)

(assert (=> b!617643 (= lt!284410 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18004 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617644 () Bool)

(assert (=> b!617644 (= e!354186 (not e!354182))))

(declare-fun res!397857 () Bool)

(assert (=> b!617644 (=> res!397857 e!354182)))

(declare-fun lt!284417 () SeekEntryResult!6400)

(assert (=> b!617644 (= res!397857 (not (= lt!284417 (MissingVacant!6400 vacantSpotIndex!68))))))

(declare-fun lt!284406 () Unit!20197)

(assert (=> b!617644 (= lt!284406 e!354179)))

(declare-fun c!70256 () Bool)

(assert (=> b!617644 (= c!70256 (= lt!284417 (Found!6400 index!984)))))

(declare-fun lt!284402 () Unit!20197)

(declare-fun e!354181 () Unit!20197)

(assert (=> b!617644 (= lt!284402 e!354181)))

(declare-fun c!70259 () Bool)

(assert (=> b!617644 (= c!70259 (= lt!284417 Undefined!6400))))

(declare-fun lt!284414 () (_ BitVec 64))

(assert (=> b!617644 (= lt!284417 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284414 lt!284401 mask!3053))))

(declare-fun e!354176 () Bool)

(assert (=> b!617644 e!354176))

(declare-fun res!397870 () Bool)

(assert (=> b!617644 (=> (not res!397870) (not e!354176))))

(declare-fun lt!284403 () SeekEntryResult!6400)

(declare-fun lt!284400 () (_ BitVec 32))

(assert (=> b!617644 (= res!397870 (= lt!284403 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284400 vacantSpotIndex!68 lt!284414 lt!284401 mask!3053)))))

(assert (=> b!617644 (= lt!284403 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284400 vacantSpotIndex!68 (select (arr!18004 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617644 (= lt!284414 (select (store (arr!18004 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284416 () Unit!20197)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20197)

(assert (=> b!617644 (= lt!284416 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284400 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617644 (= lt!284400 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!617645 () Bool)

(assert (=> b!617645 (= e!354176 (= lt!284410 lt!284403))))

(declare-fun res!397860 () Bool)

(declare-fun b!617646 () Bool)

(assert (=> b!617646 (= res!397860 (arrayContainsKey!0 lt!284401 (select (arr!18004 a!2986) j!136) j!136))))

(declare-fun e!354184 () Bool)

(assert (=> b!617646 (=> (not res!397860) (not e!354184))))

(assert (=> b!617646 (= e!354185 e!354184)))

(declare-fun b!617647 () Bool)

(declare-fun res!397866 () Bool)

(assert (=> b!617647 (=> (not res!397866) (not e!354180))))

(assert (=> b!617647 (= res!397866 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11949))))

(declare-fun b!617648 () Bool)

(declare-fun res!397871 () Bool)

(assert (=> b!617648 (=> (not res!397871) (not e!354175))))

(assert (=> b!617648 (= res!397871 (validKeyInArray!0 k0!1786))))

(declare-fun b!617649 () Bool)

(declare-fun res!397864 () Bool)

(assert (=> b!617649 (=> (not res!397864) (not e!354180))))

(assert (=> b!617649 (= res!397864 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18004 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617650 () Bool)

(declare-fun Unit!20202 () Unit!20197)

(assert (=> b!617650 (= e!354181 Unit!20202)))

(assert (=> b!617650 false))

(declare-fun b!617651 () Bool)

(assert (=> b!617651 (= e!354184 (arrayContainsKey!0 lt!284401 (select (arr!18004 a!2986) j!136) index!984))))

(declare-fun b!617652 () Bool)

(declare-fun Unit!20203 () Unit!20197)

(assert (=> b!617652 (= e!354181 Unit!20203)))

(declare-fun e!354178 () Bool)

(declare-fun b!617653 () Bool)

(assert (=> b!617653 (= e!354178 (arrayContainsKey!0 lt!284401 (select (arr!18004 a!2986) j!136) index!984))))

(declare-fun b!617654 () Bool)

(declare-fun Unit!20204 () Unit!20197)

(assert (=> b!617654 (= e!354173 Unit!20204)))

(declare-fun res!397858 () Bool)

(assert (=> start!56106 (=> (not res!397858) (not e!354175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56106 (= res!397858 (validMask!0 mask!3053))))

(assert (=> start!56106 e!354175))

(assert (=> start!56106 true))

(declare-fun array_inv!13863 (array!37521) Bool)

(assert (=> start!56106 (array_inv!13863 a!2986)))

(declare-fun b!617641 () Bool)

(assert (=> b!617641 false))

(declare-fun lt!284418 () Unit!20197)

(assert (=> b!617641 (= lt!284418 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284401 (select (arr!18004 a!2986) j!136) index!984 Nil!11949))))

(assert (=> b!617641 (arrayNoDuplicates!0 lt!284401 index!984 Nil!11949)))

(declare-fun lt!284413 () Unit!20197)

(assert (=> b!617641 (= lt!284413 (lemmaNoDuplicateFromThenFromBigger!0 lt!284401 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617641 (arrayNoDuplicates!0 lt!284401 #b00000000000000000000000000000000 Nil!11949)))

(declare-fun lt!284404 () Unit!20197)

(assert (=> b!617641 (= lt!284404 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11949))))

(assert (=> b!617641 (arrayContainsKey!0 lt!284401 (select (arr!18004 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284405 () Unit!20197)

(assert (=> b!617641 (= lt!284405 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284401 (select (arr!18004 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!617641 e!354178))

(declare-fun res!397867 () Bool)

(assert (=> b!617641 (=> (not res!397867) (not e!354178))))

(assert (=> b!617641 (= res!397867 (arrayContainsKey!0 lt!284401 (select (arr!18004 a!2986) j!136) j!136))))

(declare-fun Unit!20205 () Unit!20197)

(assert (=> b!617641 (= e!354173 Unit!20205)))

(declare-fun b!617655 () Bool)

(declare-fun res!397872 () Bool)

(assert (=> b!617655 (=> (not res!397872) (not e!354180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37521 (_ BitVec 32)) Bool)

(assert (=> b!617655 (= res!397872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617656 () Bool)

(declare-fun Unit!20206 () Unit!20197)

(assert (=> b!617656 (= e!354174 Unit!20206)))

(assert (= (and start!56106 res!397858) b!617640))

(assert (= (and b!617640 res!397859) b!617635))

(assert (= (and b!617635 res!397873) b!617648))

(assert (= (and b!617648 res!397871) b!617632))

(assert (= (and b!617632 res!397861) b!617637))

(assert (= (and b!617637 res!397865) b!617655))

(assert (= (and b!617655 res!397872) b!617647))

(assert (= (and b!617647 res!397866) b!617649))

(assert (= (and b!617649 res!397864) b!617639))

(assert (= (and b!617639 res!397869) b!617643))

(assert (= (and b!617643 res!397862) b!617644))

(assert (= (and b!617644 res!397870) b!617645))

(assert (= (and b!617644 c!70259) b!617650))

(assert (= (and b!617644 (not c!70259)) b!617652))

(assert (= (and b!617644 c!70256) b!617638))

(assert (= (and b!617644 (not c!70256)) b!617634))

(assert (= (and b!617638 res!397863) b!617642))

(assert (= (and b!617642 (not res!397868)) b!617646))

(assert (= (and b!617646 res!397860) b!617651))

(assert (= (and b!617638 c!70258) b!617633))

(assert (= (and b!617638 (not c!70258)) b!617656))

(assert (= (and b!617638 c!70257) b!617641))

(assert (= (and b!617638 (not c!70257)) b!617654))

(assert (= (and b!617641 res!397867) b!617653))

(assert (= (and b!617644 (not res!397857)) b!617636))

(declare-fun m!594017 () Bool)

(assert (=> b!617648 m!594017))

(declare-fun m!594019 () Bool)

(assert (=> b!617633 m!594019))

(declare-fun m!594021 () Bool)

(assert (=> b!617633 m!594021))

(declare-fun m!594023 () Bool)

(assert (=> b!617633 m!594023))

(assert (=> b!617633 m!594021))

(assert (=> b!617633 m!594021))

(declare-fun m!594025 () Bool)

(assert (=> b!617633 m!594025))

(declare-fun m!594027 () Bool)

(assert (=> b!617633 m!594027))

(declare-fun m!594029 () Bool)

(assert (=> b!617633 m!594029))

(assert (=> b!617633 m!594021))

(declare-fun m!594031 () Bool)

(assert (=> b!617633 m!594031))

(declare-fun m!594033 () Bool)

(assert (=> b!617633 m!594033))

(assert (=> b!617651 m!594021))

(assert (=> b!617651 m!594021))

(declare-fun m!594035 () Bool)

(assert (=> b!617651 m!594035))

(declare-fun m!594037 () Bool)

(assert (=> b!617643 m!594037))

(assert (=> b!617643 m!594021))

(assert (=> b!617643 m!594021))

(declare-fun m!594039 () Bool)

(assert (=> b!617643 m!594039))

(assert (=> b!617653 m!594021))

(assert (=> b!617653 m!594021))

(assert (=> b!617653 m!594035))

(declare-fun m!594041 () Bool)

(assert (=> b!617638 m!594041))

(declare-fun m!594043 () Bool)

(assert (=> b!617638 m!594043))

(assert (=> b!617638 m!594021))

(declare-fun m!594045 () Bool)

(assert (=> b!617655 m!594045))

(assert (=> b!617636 m!594041))

(assert (=> b!617636 m!594043))

(assert (=> b!617641 m!594021))

(declare-fun m!594047 () Bool)

(assert (=> b!617641 m!594047))

(declare-fun m!594049 () Bool)

(assert (=> b!617641 m!594049))

(assert (=> b!617641 m!594021))

(declare-fun m!594051 () Bool)

(assert (=> b!617641 m!594051))

(assert (=> b!617641 m!594027))

(assert (=> b!617641 m!594021))

(declare-fun m!594053 () Bool)

(assert (=> b!617641 m!594053))

(declare-fun m!594055 () Bool)

(assert (=> b!617641 m!594055))

(assert (=> b!617641 m!594033))

(assert (=> b!617641 m!594021))

(assert (=> b!617641 m!594021))

(declare-fun m!594057 () Bool)

(assert (=> b!617641 m!594057))

(assert (=> b!617646 m!594021))

(assert (=> b!617646 m!594021))

(assert (=> b!617646 m!594051))

(declare-fun m!594059 () Bool)

(assert (=> b!617644 m!594059))

(declare-fun m!594061 () Bool)

(assert (=> b!617644 m!594061))

(declare-fun m!594063 () Bool)

(assert (=> b!617644 m!594063))

(assert (=> b!617644 m!594041))

(declare-fun m!594065 () Bool)

(assert (=> b!617644 m!594065))

(declare-fun m!594067 () Bool)

(assert (=> b!617644 m!594067))

(assert (=> b!617644 m!594021))

(declare-fun m!594069 () Bool)

(assert (=> b!617644 m!594069))

(assert (=> b!617644 m!594021))

(declare-fun m!594071 () Bool)

(assert (=> b!617647 m!594071))

(assert (=> b!617639 m!594041))

(declare-fun m!594073 () Bool)

(assert (=> b!617639 m!594073))

(declare-fun m!594075 () Bool)

(assert (=> start!56106 m!594075))

(declare-fun m!594077 () Bool)

(assert (=> start!56106 m!594077))

(declare-fun m!594079 () Bool)

(assert (=> b!617649 m!594079))

(declare-fun m!594081 () Bool)

(assert (=> b!617637 m!594081))

(assert (=> b!617635 m!594021))

(assert (=> b!617635 m!594021))

(declare-fun m!594083 () Bool)

(assert (=> b!617635 m!594083))

(declare-fun m!594085 () Bool)

(assert (=> b!617632 m!594085))

(check-sat (not b!617637) (not b!617651) (not b!617632) (not b!617641) (not b!617653) (not b!617655) (not b!617635) (not b!617643) (not b!617646) (not b!617647) (not b!617633) (not start!56106) (not b!617644) (not b!617648))
(check-sat)
