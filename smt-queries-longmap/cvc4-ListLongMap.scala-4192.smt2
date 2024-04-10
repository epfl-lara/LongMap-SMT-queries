; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57192 () Bool)

(assert start!57192)

(declare-fun b!633111 () Bool)

(declare-fun e!361982 () Bool)

(declare-fun e!361975 () Bool)

(assert (=> b!633111 (= e!361982 e!361975)))

(declare-fun res!409466 () Bool)

(assert (=> b!633111 (=> (not res!409466) (not e!361975))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38154 0))(
  ( (array!38155 (arr!18308 (Array (_ BitVec 32) (_ BitVec 64))) (size!18672 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38154)

(assert (=> b!633111 (= res!409466 (= (select (store (arr!18308 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292625 () array!38154)

(assert (=> b!633111 (= lt!292625 (array!38155 (store (arr!18308 a!2986) i!1108 k!1786) (size!18672 a!2986)))))

(declare-fun b!633112 () Bool)

(declare-fun e!361981 () Bool)

(declare-fun e!361978 () Bool)

(assert (=> b!633112 (= e!361981 e!361978)))

(declare-fun res!409472 () Bool)

(assert (=> b!633112 (=> res!409472 e!361978)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!292631 () (_ BitVec 64))

(declare-fun lt!292628 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!633112 (= res!409472 (or (not (= (select (arr!18308 a!2986) j!136) lt!292631)) (not (= (select (arr!18308 a!2986) j!136) lt!292628)) (bvsge j!136 index!984)))))

(declare-fun e!361980 () Bool)

(assert (=> b!633112 e!361980))

(declare-fun res!409471 () Bool)

(assert (=> b!633112 (=> (not res!409471) (not e!361980))))

(assert (=> b!633112 (= res!409471 (= lt!292628 (select (arr!18308 a!2986) j!136)))))

(assert (=> b!633112 (= lt!292628 (select (store (arr!18308 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!633113 () Bool)

(declare-fun res!409477 () Bool)

(assert (=> b!633113 (=> (not res!409477) (not e!361982))))

(declare-datatypes ((List!12349 0))(
  ( (Nil!12346) (Cons!12345 (h!13390 (_ BitVec 64)) (t!18577 List!12349)) )
))
(declare-fun arrayNoDuplicates!0 (array!38154 (_ BitVec 32) List!12349) Bool)

(assert (=> b!633113 (= res!409477 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12346))))

(declare-fun e!361979 () Bool)

(declare-fun b!633114 () Bool)

(declare-fun arrayContainsKey!0 (array!38154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633114 (= e!361979 (arrayContainsKey!0 lt!292625 (select (arr!18308 a!2986) j!136) j!136))))

(declare-fun b!633115 () Bool)

(declare-fun e!361983 () Bool)

(assert (=> b!633115 (= e!361983 (not e!361981))))

(declare-fun res!409469 () Bool)

(assert (=> b!633115 (=> res!409469 e!361981)))

(declare-datatypes ((SeekEntryResult!6748 0))(
  ( (MissingZero!6748 (index!29288 (_ BitVec 32))) (Found!6748 (index!29289 (_ BitVec 32))) (Intermediate!6748 (undefined!7560 Bool) (index!29290 (_ BitVec 32)) (x!58024 (_ BitVec 32))) (Undefined!6748) (MissingVacant!6748 (index!29291 (_ BitVec 32))) )
))
(declare-fun lt!292624 () SeekEntryResult!6748)

(assert (=> b!633115 (= res!409469 (not (= lt!292624 (Found!6748 index!984))))))

(declare-datatypes ((Unit!21326 0))(
  ( (Unit!21327) )
))
(declare-fun lt!292632 () Unit!21326)

(declare-fun e!361973 () Unit!21326)

(assert (=> b!633115 (= lt!292632 e!361973)))

(declare-fun c!72191 () Bool)

(assert (=> b!633115 (= c!72191 (= lt!292624 Undefined!6748))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38154 (_ BitVec 32)) SeekEntryResult!6748)

(assert (=> b!633115 (= lt!292624 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292631 lt!292625 mask!3053))))

(declare-fun e!361977 () Bool)

(assert (=> b!633115 e!361977))

(declare-fun res!409476 () Bool)

(assert (=> b!633115 (=> (not res!409476) (not e!361977))))

(declare-fun lt!292627 () (_ BitVec 32))

(declare-fun lt!292626 () SeekEntryResult!6748)

(assert (=> b!633115 (= res!409476 (= lt!292626 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292627 vacantSpotIndex!68 lt!292631 lt!292625 mask!3053)))))

(assert (=> b!633115 (= lt!292626 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292627 vacantSpotIndex!68 (select (arr!18308 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633115 (= lt!292631 (select (store (arr!18308 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292629 () Unit!21326)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38154 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21326)

(assert (=> b!633115 (= lt!292629 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292627 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633115 (= lt!292627 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!409474 () Bool)

(declare-fun e!361976 () Bool)

(assert (=> start!57192 (=> (not res!409474) (not e!361976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57192 (= res!409474 (validMask!0 mask!3053))))

(assert (=> start!57192 e!361976))

(assert (=> start!57192 true))

(declare-fun array_inv!14104 (array!38154) Bool)

(assert (=> start!57192 (array_inv!14104 a!2986)))

(declare-fun b!633116 () Bool)

(declare-fun res!409473 () Bool)

(assert (=> b!633116 (=> (not res!409473) (not e!361982))))

(assert (=> b!633116 (= res!409473 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18308 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633117 () Bool)

(declare-fun res!409465 () Bool)

(assert (=> b!633117 (=> (not res!409465) (not e!361976))))

(assert (=> b!633117 (= res!409465 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633118 () Bool)

(declare-fun lt!292630 () SeekEntryResult!6748)

(assert (=> b!633118 (= e!361977 (= lt!292630 lt!292626))))

(declare-fun b!633119 () Bool)

(declare-fun res!409464 () Bool)

(assert (=> b!633119 (=> (not res!409464) (not e!361976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633119 (= res!409464 (validKeyInArray!0 (select (arr!18308 a!2986) j!136)))))

(declare-fun b!633120 () Bool)

(declare-fun res!409463 () Bool)

(assert (=> b!633120 (=> (not res!409463) (not e!361976))))

(assert (=> b!633120 (= res!409463 (and (= (size!18672 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18672 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18672 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633121 () Bool)

(declare-fun res!409467 () Bool)

(assert (=> b!633121 (=> (not res!409467) (not e!361982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38154 (_ BitVec 32)) Bool)

(assert (=> b!633121 (= res!409467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633122 () Bool)

(declare-fun Unit!21328 () Unit!21326)

(assert (=> b!633122 (= e!361973 Unit!21328)))

(declare-fun b!633123 () Bool)

(declare-fun Unit!21329 () Unit!21326)

(assert (=> b!633123 (= e!361973 Unit!21329)))

(assert (=> b!633123 false))

(declare-fun b!633124 () Bool)

(declare-fun res!409478 () Bool)

(assert (=> b!633124 (=> (not res!409478) (not e!361976))))

(assert (=> b!633124 (= res!409478 (validKeyInArray!0 k!1786))))

(declare-fun b!633125 () Bool)

(assert (=> b!633125 (= e!361976 e!361982)))

(declare-fun res!409470 () Bool)

(assert (=> b!633125 (=> (not res!409470) (not e!361982))))

(declare-fun lt!292633 () SeekEntryResult!6748)

(assert (=> b!633125 (= res!409470 (or (= lt!292633 (MissingZero!6748 i!1108)) (= lt!292633 (MissingVacant!6748 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38154 (_ BitVec 32)) SeekEntryResult!6748)

(assert (=> b!633125 (= lt!292633 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!633126 () Bool)

(assert (=> b!633126 (= e!361980 e!361979)))

(declare-fun res!409475 () Bool)

(assert (=> b!633126 (=> res!409475 e!361979)))

(assert (=> b!633126 (= res!409475 (or (not (= (select (arr!18308 a!2986) j!136) lt!292631)) (not (= (select (arr!18308 a!2986) j!136) lt!292628)) (bvsge j!136 index!984)))))

(declare-fun b!633127 () Bool)

(assert (=> b!633127 (= e!361978 (arrayContainsKey!0 lt!292625 (select (arr!18308 a!2986) j!136) index!984))))

(declare-fun b!633128 () Bool)

(assert (=> b!633128 (= e!361975 e!361983)))

(declare-fun res!409468 () Bool)

(assert (=> b!633128 (=> (not res!409468) (not e!361983))))

(assert (=> b!633128 (= res!409468 (and (= lt!292630 (Found!6748 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18308 a!2986) index!984) (select (arr!18308 a!2986) j!136))) (not (= (select (arr!18308 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!633128 (= lt!292630 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18308 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57192 res!409474) b!633120))

(assert (= (and b!633120 res!409463) b!633119))

(assert (= (and b!633119 res!409464) b!633124))

(assert (= (and b!633124 res!409478) b!633117))

(assert (= (and b!633117 res!409465) b!633125))

(assert (= (and b!633125 res!409470) b!633121))

(assert (= (and b!633121 res!409467) b!633113))

(assert (= (and b!633113 res!409477) b!633116))

(assert (= (and b!633116 res!409473) b!633111))

(assert (= (and b!633111 res!409466) b!633128))

(assert (= (and b!633128 res!409468) b!633115))

(assert (= (and b!633115 res!409476) b!633118))

(assert (= (and b!633115 c!72191) b!633123))

(assert (= (and b!633115 (not c!72191)) b!633122))

(assert (= (and b!633115 (not res!409469)) b!633112))

(assert (= (and b!633112 res!409471) b!633126))

(assert (= (and b!633126 (not res!409475)) b!633114))

(assert (= (and b!633112 (not res!409472)) b!633127))

(declare-fun m!607841 () Bool)

(assert (=> b!633124 m!607841))

(declare-fun m!607843 () Bool)

(assert (=> b!633119 m!607843))

(assert (=> b!633119 m!607843))

(declare-fun m!607845 () Bool)

(assert (=> b!633119 m!607845))

(declare-fun m!607847 () Bool)

(assert (=> b!633111 m!607847))

(declare-fun m!607849 () Bool)

(assert (=> b!633111 m!607849))

(declare-fun m!607851 () Bool)

(assert (=> b!633117 m!607851))

(declare-fun m!607853 () Bool)

(assert (=> b!633115 m!607853))

(declare-fun m!607855 () Bool)

(assert (=> b!633115 m!607855))

(declare-fun m!607857 () Bool)

(assert (=> b!633115 m!607857))

(assert (=> b!633115 m!607843))

(assert (=> b!633115 m!607847))

(declare-fun m!607859 () Bool)

(assert (=> b!633115 m!607859))

(assert (=> b!633115 m!607843))

(declare-fun m!607861 () Bool)

(assert (=> b!633115 m!607861))

(declare-fun m!607863 () Bool)

(assert (=> b!633115 m!607863))

(declare-fun m!607865 () Bool)

(assert (=> start!57192 m!607865))

(declare-fun m!607867 () Bool)

(assert (=> start!57192 m!607867))

(assert (=> b!633127 m!607843))

(assert (=> b!633127 m!607843))

(declare-fun m!607869 () Bool)

(assert (=> b!633127 m!607869))

(declare-fun m!607871 () Bool)

(assert (=> b!633113 m!607871))

(assert (=> b!633112 m!607843))

(assert (=> b!633112 m!607847))

(declare-fun m!607873 () Bool)

(assert (=> b!633112 m!607873))

(declare-fun m!607875 () Bool)

(assert (=> b!633121 m!607875))

(declare-fun m!607877 () Bool)

(assert (=> b!633125 m!607877))

(declare-fun m!607879 () Bool)

(assert (=> b!633128 m!607879))

(assert (=> b!633128 m!607843))

(assert (=> b!633128 m!607843))

(declare-fun m!607881 () Bool)

(assert (=> b!633128 m!607881))

(assert (=> b!633114 m!607843))

(assert (=> b!633114 m!607843))

(declare-fun m!607883 () Bool)

(assert (=> b!633114 m!607883))

(declare-fun m!607885 () Bool)

(assert (=> b!633116 m!607885))

(assert (=> b!633126 m!607843))

(push 1)

(assert (not b!633113))

(assert (not b!633127))

(assert (not b!633119))

(assert (not b!633115))

(assert (not b!633128))

(assert (not start!57192))

(assert (not b!633117))

(assert (not b!633125))

(assert (not b!633121))

(assert (not b!633114))

(assert (not b!633124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

