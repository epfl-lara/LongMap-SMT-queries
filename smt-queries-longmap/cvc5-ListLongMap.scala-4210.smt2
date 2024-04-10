; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57704 () Bool)

(assert start!57704)

(declare-fun b!638017 () Bool)

(declare-fun res!412876 () Bool)

(declare-fun e!365082 () Bool)

(assert (=> b!638017 (=> (not res!412876) (not e!365082))))

(declare-datatypes ((array!38275 0))(
  ( (array!38276 (arr!18360 (Array (_ BitVec 32) (_ BitVec 64))) (size!18724 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38275)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638017 (= res!412876 (validKeyInArray!0 (select (arr!18360 a!2986) j!136)))))

(declare-fun res!412889 () Bool)

(assert (=> start!57704 (=> (not res!412889) (not e!365082))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57704 (= res!412889 (validMask!0 mask!3053))))

(assert (=> start!57704 e!365082))

(assert (=> start!57704 true))

(declare-fun array_inv!14156 (array!38275) Bool)

(assert (=> start!57704 (array_inv!14156 a!2986)))

(declare-fun b!638018 () Bool)

(declare-fun res!412884 () Bool)

(declare-fun e!365075 () Bool)

(assert (=> b!638018 (=> (not res!412884) (not e!365075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38275 (_ BitVec 32)) Bool)

(assert (=> b!638018 (= res!412884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638019 () Bool)

(declare-fun res!412890 () Bool)

(assert (=> b!638019 (=> (not res!412890) (not e!365082))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!638019 (= res!412890 (validKeyInArray!0 k!1786))))

(declare-fun b!638020 () Bool)

(declare-fun res!412875 () Bool)

(declare-fun e!365081 () Bool)

(assert (=> b!638020 (=> res!412875 e!365081)))

(declare-datatypes ((List!12401 0))(
  ( (Nil!12398) (Cons!12397 (h!13442 (_ BitVec 64)) (t!18629 List!12401)) )
))
(declare-fun contains!3115 (List!12401 (_ BitVec 64)) Bool)

(assert (=> b!638020 (= res!412875 (contains!3115 Nil!12398 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638021 () Bool)

(declare-fun e!365080 () Bool)

(declare-fun lt!295031 () array!38275)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638021 (= e!365080 (arrayContainsKey!0 lt!295031 (select (arr!18360 a!2986) j!136) index!984))))

(declare-fun b!638022 () Bool)

(declare-fun e!365076 () Bool)

(declare-fun e!365077 () Bool)

(assert (=> b!638022 (= e!365076 (not e!365077))))

(declare-fun res!412880 () Bool)

(assert (=> b!638022 (=> res!412880 e!365077)))

(declare-datatypes ((SeekEntryResult!6800 0))(
  ( (MissingZero!6800 (index!29514 (_ BitVec 32))) (Found!6800 (index!29515 (_ BitVec 32))) (Intermediate!6800 (undefined!7612 Bool) (index!29516 (_ BitVec 32)) (x!58274 (_ BitVec 32))) (Undefined!6800) (MissingVacant!6800 (index!29517 (_ BitVec 32))) )
))
(declare-fun lt!295036 () SeekEntryResult!6800)

(assert (=> b!638022 (= res!412880 (not (= lt!295036 (Found!6800 index!984))))))

(declare-datatypes ((Unit!21534 0))(
  ( (Unit!21535) )
))
(declare-fun lt!295028 () Unit!21534)

(declare-fun e!365078 () Unit!21534)

(assert (=> b!638022 (= lt!295028 e!365078)))

(declare-fun c!72938 () Bool)

(assert (=> b!638022 (= c!72938 (= lt!295036 Undefined!6800))))

(declare-fun lt!295033 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38275 (_ BitVec 32)) SeekEntryResult!6800)

(assert (=> b!638022 (= lt!295036 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295033 lt!295031 mask!3053))))

(declare-fun e!365074 () Bool)

(assert (=> b!638022 e!365074))

(declare-fun res!412882 () Bool)

(assert (=> b!638022 (=> (not res!412882) (not e!365074))))

(declare-fun lt!295025 () (_ BitVec 32))

(declare-fun lt!295034 () SeekEntryResult!6800)

(assert (=> b!638022 (= res!412882 (= lt!295034 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295025 vacantSpotIndex!68 lt!295033 lt!295031 mask!3053)))))

(assert (=> b!638022 (= lt!295034 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295025 vacantSpotIndex!68 (select (arr!18360 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!638022 (= lt!295033 (select (store (arr!18360 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295030 () Unit!21534)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38275 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21534)

(assert (=> b!638022 (= lt!295030 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295025 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638022 (= lt!295025 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638023 () Bool)

(declare-fun e!365079 () Bool)

(assert (=> b!638023 (= e!365079 e!365080)))

(declare-fun res!412886 () Bool)

(assert (=> b!638023 (=> (not res!412886) (not e!365080))))

(assert (=> b!638023 (= res!412886 (arrayContainsKey!0 lt!295031 (select (arr!18360 a!2986) j!136) j!136))))

(declare-fun b!638024 () Bool)

(declare-fun Unit!21536 () Unit!21534)

(assert (=> b!638024 (= e!365078 Unit!21536)))

(assert (=> b!638024 false))

(declare-fun b!638025 () Bool)

(declare-fun e!365083 () Bool)

(assert (=> b!638025 (= e!365083 e!365079)))

(declare-fun res!412887 () Bool)

(assert (=> b!638025 (=> res!412887 e!365079)))

(declare-fun lt!295027 () (_ BitVec 64))

(assert (=> b!638025 (= res!412887 (or (not (= (select (arr!18360 a!2986) j!136) lt!295033)) (not (= (select (arr!18360 a!2986) j!136) lt!295027)) (bvsge j!136 index!984)))))

(declare-fun b!638026 () Bool)

(assert (=> b!638026 (= e!365081 true)))

(declare-fun lt!295032 () Bool)

(assert (=> b!638026 (= lt!295032 (contains!3115 Nil!12398 k!1786))))

(declare-fun b!638027 () Bool)

(declare-fun res!412891 () Bool)

(assert (=> b!638027 (=> res!412891 e!365081)))

(declare-fun noDuplicate!393 (List!12401) Bool)

(assert (=> b!638027 (= res!412891 (not (noDuplicate!393 Nil!12398)))))

(declare-fun b!638028 () Bool)

(assert (=> b!638028 (= e!365082 e!365075)))

(declare-fun res!412885 () Bool)

(assert (=> b!638028 (=> (not res!412885) (not e!365075))))

(declare-fun lt!295029 () SeekEntryResult!6800)

(assert (=> b!638028 (= res!412885 (or (= lt!295029 (MissingZero!6800 i!1108)) (= lt!295029 (MissingVacant!6800 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38275 (_ BitVec 32)) SeekEntryResult!6800)

(assert (=> b!638028 (= lt!295029 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!638029 () Bool)

(declare-fun lt!295026 () SeekEntryResult!6800)

(assert (=> b!638029 (= e!365074 (= lt!295026 lt!295034))))

(declare-fun b!638030 () Bool)

(declare-fun e!365084 () Bool)

(assert (=> b!638030 (= e!365084 e!365081)))

(declare-fun res!412877 () Bool)

(assert (=> b!638030 (=> res!412877 e!365081)))

(assert (=> b!638030 (= res!412877 (or (bvsge (size!18724 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18724 a!2986))))))

(assert (=> b!638030 (arrayContainsKey!0 lt!295031 (select (arr!18360 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295035 () Unit!21534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38275 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21534)

(assert (=> b!638030 (= lt!295035 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295031 (select (arr!18360 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638031 () Bool)

(declare-fun res!412895 () Bool)

(assert (=> b!638031 (=> (not res!412895) (not e!365082))))

(assert (=> b!638031 (= res!412895 (and (= (size!18724 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18724 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18724 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638032 () Bool)

(declare-fun e!365073 () Bool)

(assert (=> b!638032 (= e!365075 e!365073)))

(declare-fun res!412894 () Bool)

(assert (=> b!638032 (=> (not res!412894) (not e!365073))))

(assert (=> b!638032 (= res!412894 (= (select (store (arr!18360 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638032 (= lt!295031 (array!38276 (store (arr!18360 a!2986) i!1108 k!1786) (size!18724 a!2986)))))

(declare-fun b!638033 () Bool)

(assert (=> b!638033 (= e!365077 e!365084)))

(declare-fun res!412888 () Bool)

(assert (=> b!638033 (=> res!412888 e!365084)))

(assert (=> b!638033 (= res!412888 (or (not (= (select (arr!18360 a!2986) j!136) lt!295033)) (not (= (select (arr!18360 a!2986) j!136) lt!295027)) (bvsge j!136 index!984)))))

(assert (=> b!638033 e!365083))

(declare-fun res!412879 () Bool)

(assert (=> b!638033 (=> (not res!412879) (not e!365083))))

(assert (=> b!638033 (= res!412879 (= lt!295027 (select (arr!18360 a!2986) j!136)))))

(assert (=> b!638033 (= lt!295027 (select (store (arr!18360 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!638034 () Bool)

(declare-fun Unit!21537 () Unit!21534)

(assert (=> b!638034 (= e!365078 Unit!21537)))

(declare-fun b!638035 () Bool)

(declare-fun res!412878 () Bool)

(assert (=> b!638035 (=> (not res!412878) (not e!365075))))

(declare-fun arrayNoDuplicates!0 (array!38275 (_ BitVec 32) List!12401) Bool)

(assert (=> b!638035 (= res!412878 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12398))))

(declare-fun b!638036 () Bool)

(declare-fun res!412892 () Bool)

(assert (=> b!638036 (=> res!412892 e!365081)))

(assert (=> b!638036 (= res!412892 (contains!3115 Nil!12398 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638037 () Bool)

(declare-fun res!412881 () Bool)

(assert (=> b!638037 (=> (not res!412881) (not e!365075))))

(assert (=> b!638037 (= res!412881 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18360 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638038 () Bool)

(assert (=> b!638038 (= e!365073 e!365076)))

(declare-fun res!412893 () Bool)

(assert (=> b!638038 (=> (not res!412893) (not e!365076))))

(assert (=> b!638038 (= res!412893 (and (= lt!295026 (Found!6800 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18360 a!2986) index!984) (select (arr!18360 a!2986) j!136))) (not (= (select (arr!18360 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!638038 (= lt!295026 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18360 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638039 () Bool)

(declare-fun res!412883 () Bool)

(assert (=> b!638039 (=> (not res!412883) (not e!365082))))

(assert (=> b!638039 (= res!412883 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!57704 res!412889) b!638031))

(assert (= (and b!638031 res!412895) b!638017))

(assert (= (and b!638017 res!412876) b!638019))

(assert (= (and b!638019 res!412890) b!638039))

(assert (= (and b!638039 res!412883) b!638028))

(assert (= (and b!638028 res!412885) b!638018))

(assert (= (and b!638018 res!412884) b!638035))

(assert (= (and b!638035 res!412878) b!638037))

(assert (= (and b!638037 res!412881) b!638032))

(assert (= (and b!638032 res!412894) b!638038))

(assert (= (and b!638038 res!412893) b!638022))

(assert (= (and b!638022 res!412882) b!638029))

(assert (= (and b!638022 c!72938) b!638024))

(assert (= (and b!638022 (not c!72938)) b!638034))

(assert (= (and b!638022 (not res!412880)) b!638033))

(assert (= (and b!638033 res!412879) b!638025))

(assert (= (and b!638025 (not res!412887)) b!638023))

(assert (= (and b!638023 res!412886) b!638021))

(assert (= (and b!638033 (not res!412888)) b!638030))

(assert (= (and b!638030 (not res!412877)) b!638027))

(assert (= (and b!638027 (not res!412891)) b!638036))

(assert (= (and b!638036 (not res!412892)) b!638020))

(assert (= (and b!638020 (not res!412875)) b!638026))

(declare-fun m!612005 () Bool)

(assert (=> b!638032 m!612005))

(declare-fun m!612007 () Bool)

(assert (=> b!638032 m!612007))

(declare-fun m!612009 () Bool)

(assert (=> b!638035 m!612009))

(declare-fun m!612011 () Bool)

(assert (=> b!638022 m!612011))

(declare-fun m!612013 () Bool)

(assert (=> b!638022 m!612013))

(declare-fun m!612015 () Bool)

(assert (=> b!638022 m!612015))

(declare-fun m!612017 () Bool)

(assert (=> b!638022 m!612017))

(assert (=> b!638022 m!612015))

(declare-fun m!612019 () Bool)

(assert (=> b!638022 m!612019))

(declare-fun m!612021 () Bool)

(assert (=> b!638022 m!612021))

(declare-fun m!612023 () Bool)

(assert (=> b!638022 m!612023))

(assert (=> b!638022 m!612005))

(declare-fun m!612025 () Bool)

(assert (=> start!57704 m!612025))

(declare-fun m!612027 () Bool)

(assert (=> start!57704 m!612027))

(declare-fun m!612029 () Bool)

(assert (=> b!638018 m!612029))

(declare-fun m!612031 () Bool)

(assert (=> b!638039 m!612031))

(declare-fun m!612033 () Bool)

(assert (=> b!638027 m!612033))

(declare-fun m!612035 () Bool)

(assert (=> b!638028 m!612035))

(declare-fun m!612037 () Bool)

(assert (=> b!638038 m!612037))

(assert (=> b!638038 m!612015))

(assert (=> b!638038 m!612015))

(declare-fun m!612039 () Bool)

(assert (=> b!638038 m!612039))

(declare-fun m!612041 () Bool)

(assert (=> b!638036 m!612041))

(assert (=> b!638017 m!612015))

(assert (=> b!638017 m!612015))

(declare-fun m!612043 () Bool)

(assert (=> b!638017 m!612043))

(assert (=> b!638033 m!612015))

(assert (=> b!638033 m!612005))

(declare-fun m!612045 () Bool)

(assert (=> b!638033 m!612045))

(declare-fun m!612047 () Bool)

(assert (=> b!638019 m!612047))

(assert (=> b!638025 m!612015))

(assert (=> b!638021 m!612015))

(assert (=> b!638021 m!612015))

(declare-fun m!612049 () Bool)

(assert (=> b!638021 m!612049))

(declare-fun m!612051 () Bool)

(assert (=> b!638026 m!612051))

(assert (=> b!638030 m!612015))

(assert (=> b!638030 m!612015))

(declare-fun m!612053 () Bool)

(assert (=> b!638030 m!612053))

(assert (=> b!638030 m!612015))

(declare-fun m!612055 () Bool)

(assert (=> b!638030 m!612055))

(assert (=> b!638023 m!612015))

(assert (=> b!638023 m!612015))

(declare-fun m!612057 () Bool)

(assert (=> b!638023 m!612057))

(declare-fun m!612059 () Bool)

(assert (=> b!638037 m!612059))

(declare-fun m!612061 () Bool)

(assert (=> b!638020 m!612061))

(push 1)

