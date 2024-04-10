; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55800 () Bool)

(assert start!55800)

(declare-fun b!611116 () Bool)

(declare-fun e!350161 () Bool)

(declare-fun e!350159 () Bool)

(assert (=> b!611116 (= e!350161 e!350159)))

(declare-fun res!393069 () Bool)

(assert (=> b!611116 (=> (not res!393069) (not e!350159))))

(declare-datatypes ((SeekEntryResult!6369 0))(
  ( (MissingZero!6369 (index!27757 (_ BitVec 32))) (Found!6369 (index!27758 (_ BitVec 32))) (Intermediate!6369 (undefined!7181 Bool) (index!27759 (_ BitVec 32)) (x!56568 (_ BitVec 32))) (Undefined!6369) (MissingVacant!6369 (index!27760 (_ BitVec 32))) )
))
(declare-fun lt!279572 () SeekEntryResult!6369)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!611116 (= res!393069 (or (= lt!279572 (MissingZero!6369 i!1108)) (= lt!279572 (MissingVacant!6369 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37363 0))(
  ( (array!37364 (arr!17929 (Array (_ BitVec 32) (_ BitVec 64))) (size!18293 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37363)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37363 (_ BitVec 32)) SeekEntryResult!6369)

(assert (=> b!611116 (= lt!279572 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!611117 () Bool)

(declare-fun e!350152 () Bool)

(declare-fun e!350160 () Bool)

(assert (=> b!611117 (= e!350152 (not e!350160))))

(declare-fun res!393058 () Bool)

(assert (=> b!611117 (=> res!393058 e!350160)))

(declare-fun lt!279583 () SeekEntryResult!6369)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!611117 (= res!393058 (not (= lt!279583 (Found!6369 index!984))))))

(declare-datatypes ((Unit!19594 0))(
  ( (Unit!19595) )
))
(declare-fun lt!279577 () Unit!19594)

(declare-fun e!350154 () Unit!19594)

(assert (=> b!611117 (= lt!279577 e!350154)))

(declare-fun c!69398 () Bool)

(assert (=> b!611117 (= c!69398 (= lt!279583 Undefined!6369))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!279567 () array!37363)

(declare-fun lt!279574 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37363 (_ BitVec 32)) SeekEntryResult!6369)

(assert (=> b!611117 (= lt!279583 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279574 lt!279567 mask!3053))))

(declare-fun e!350163 () Bool)

(assert (=> b!611117 e!350163))

(declare-fun res!393063 () Bool)

(assert (=> b!611117 (=> (not res!393063) (not e!350163))))

(declare-fun lt!279579 () SeekEntryResult!6369)

(declare-fun lt!279573 () (_ BitVec 32))

(assert (=> b!611117 (= res!393063 (= lt!279579 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279573 vacantSpotIndex!68 lt!279574 lt!279567 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!611117 (= lt!279579 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279573 vacantSpotIndex!68 (select (arr!17929 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!611117 (= lt!279574 (select (store (arr!17929 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!279582 () Unit!19594)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37363 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19594)

(assert (=> b!611117 (= lt!279582 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279573 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611117 (= lt!279573 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!611118 () Bool)

(declare-fun e!350149 () Bool)

(declare-fun e!350147 () Bool)

(assert (=> b!611118 (= e!350149 e!350147)))

(declare-fun res!393068 () Bool)

(assert (=> b!611118 (=> res!393068 e!350147)))

(assert (=> b!611118 (= res!393068 (or (bvsgt #b00000000000000000000000000000000 (size!18293 a!2986)) (bvsge (size!18293 a!2986) #b01111111111111111111111111111111)))))

(declare-datatypes ((List!11970 0))(
  ( (Nil!11967) (Cons!11966 (h!13011 (_ BitVec 64)) (t!18198 List!11970)) )
))
(declare-fun arrayNoDuplicates!0 (array!37363 (_ BitVec 32) List!11970) Bool)

(assert (=> b!611118 (arrayNoDuplicates!0 lt!279567 #b00000000000000000000000000000000 Nil!11967)))

(declare-fun lt!279575 () Unit!19594)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37363 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11970) Unit!19594)

(assert (=> b!611118 (= lt!279575 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11967))))

(declare-fun arrayContainsKey!0 (array!37363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611118 (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279570 () Unit!19594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37363 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19594)

(assert (=> b!611118 (= lt!279570 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279567 (select (arr!17929 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350156 () Bool)

(assert (=> b!611118 e!350156))

(declare-fun res!393070 () Bool)

(assert (=> b!611118 (=> (not res!393070) (not e!350156))))

(assert (=> b!611118 (= res!393070 (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) j!136))))

(declare-fun b!611119 () Bool)

(declare-fun res!393077 () Bool)

(assert (=> b!611119 (=> (not res!393077) (not e!350159))))

(assert (=> b!611119 (= res!393077 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17929 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611120 () Bool)

(declare-fun e!350150 () Bool)

(assert (=> b!611120 (= e!350160 e!350150)))

(declare-fun res!393056 () Bool)

(assert (=> b!611120 (=> res!393056 e!350150)))

(declare-fun lt!279576 () (_ BitVec 64))

(assert (=> b!611120 (= res!393056 (or (not (= (select (arr!17929 a!2986) j!136) lt!279574)) (not (= (select (arr!17929 a!2986) j!136) lt!279576))))))

(declare-fun e!350157 () Bool)

(assert (=> b!611120 e!350157))

(declare-fun res!393072 () Bool)

(assert (=> b!611120 (=> (not res!393072) (not e!350157))))

(assert (=> b!611120 (= res!393072 (= lt!279576 (select (arr!17929 a!2986) j!136)))))

(assert (=> b!611120 (= lt!279576 (select (store (arr!17929 a!2986) i!1108 k0!1786) index!984))))

(declare-fun e!350158 () Bool)

(declare-fun b!611121 () Bool)

(assert (=> b!611121 (= e!350158 (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) index!984))))

(declare-fun b!611122 () Bool)

(declare-fun e!350162 () Bool)

(assert (=> b!611122 (= e!350162 e!350158)))

(declare-fun res!393057 () Bool)

(assert (=> b!611122 (=> (not res!393057) (not e!350158))))

(assert (=> b!611122 (= res!393057 (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) j!136))))

(declare-fun b!611123 () Bool)

(declare-fun e!350153 () Bool)

(assert (=> b!611123 (= e!350159 e!350153)))

(declare-fun res!393065 () Bool)

(assert (=> b!611123 (=> (not res!393065) (not e!350153))))

(assert (=> b!611123 (= res!393065 (= (select (store (arr!17929 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611123 (= lt!279567 (array!37364 (store (arr!17929 a!2986) i!1108 k0!1786) (size!18293 a!2986)))))

(declare-fun b!611124 () Bool)

(declare-fun res!393071 () Bool)

(assert (=> b!611124 (=> res!393071 e!350147)))

(declare-fun noDuplicate!346 (List!11970) Bool)

(assert (=> b!611124 (= res!393071 (not (noDuplicate!346 Nil!11967)))))

(declare-fun res!393073 () Bool)

(assert (=> start!55800 (=> (not res!393073) (not e!350161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55800 (= res!393073 (validMask!0 mask!3053))))

(assert (=> start!55800 e!350161))

(assert (=> start!55800 true))

(declare-fun array_inv!13725 (array!37363) Bool)

(assert (=> start!55800 (array_inv!13725 a!2986)))

(declare-fun b!611125 () Bool)

(declare-fun res!393067 () Bool)

(assert (=> b!611125 (=> (not res!393067) (not e!350159))))

(assert (=> b!611125 (= res!393067 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11967))))

(declare-fun b!611126 () Bool)

(declare-fun e!350155 () Unit!19594)

(declare-fun Unit!19596 () Unit!19594)

(assert (=> b!611126 (= e!350155 Unit!19596)))

(declare-fun b!611127 () Bool)

(declare-fun e!350151 () Bool)

(assert (=> b!611127 (= e!350147 e!350151)))

(declare-fun res!393060 () Bool)

(assert (=> b!611127 (=> (not res!393060) (not e!350151))))

(declare-fun contains!3043 (List!11970 (_ BitVec 64)) Bool)

(assert (=> b!611127 (= res!393060 (not (contains!3043 Nil!11967 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611128 () Bool)

(declare-fun Unit!19597 () Unit!19594)

(assert (=> b!611128 (= e!350154 Unit!19597)))

(assert (=> b!611128 false))

(declare-fun b!611129 () Bool)

(assert (=> b!611129 (= e!350153 e!350152)))

(declare-fun res!393074 () Bool)

(assert (=> b!611129 (=> (not res!393074) (not e!350152))))

(declare-fun lt!279569 () SeekEntryResult!6369)

(assert (=> b!611129 (= res!393074 (and (= lt!279569 (Found!6369 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17929 a!2986) index!984) (select (arr!17929 a!2986) j!136))) (not (= (select (arr!17929 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!611129 (= lt!279569 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17929 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611130 () Bool)

(declare-fun res!393059 () Bool)

(assert (=> b!611130 (=> (not res!393059) (not e!350161))))

(assert (=> b!611130 (= res!393059 (and (= (size!18293 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18293 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18293 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!611131 () Bool)

(assert (=> b!611131 (= e!350157 e!350162)))

(declare-fun res!393075 () Bool)

(assert (=> b!611131 (=> res!393075 e!350162)))

(assert (=> b!611131 (= res!393075 (or (not (= (select (arr!17929 a!2986) j!136) lt!279574)) (not (= (select (arr!17929 a!2986) j!136) lt!279576)) (bvsge j!136 index!984)))))

(declare-fun b!611132 () Bool)

(assert (=> b!611132 (= e!350163 (= lt!279569 lt!279579))))

(declare-fun b!611133 () Bool)

(declare-fun res!393076 () Bool)

(assert (=> b!611133 (=> (not res!393076) (not e!350161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611133 (= res!393076 (validKeyInArray!0 (select (arr!17929 a!2986) j!136)))))

(declare-fun b!611134 () Bool)

(declare-fun res!393062 () Bool)

(assert (=> b!611134 (=> (not res!393062) (not e!350161))))

(assert (=> b!611134 (= res!393062 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!611135 () Bool)

(assert (=> b!611135 (= e!350156 (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) index!984))))

(declare-fun b!611136 () Bool)

(declare-fun Unit!19598 () Unit!19594)

(assert (=> b!611136 (= e!350154 Unit!19598)))

(declare-fun b!611137 () Bool)

(assert (=> b!611137 (= e!350151 (not (contains!3043 Nil!11967 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611138 () Bool)

(declare-fun res!393064 () Bool)

(assert (=> b!611138 (=> (not res!393064) (not e!350159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37363 (_ BitVec 32)) Bool)

(assert (=> b!611138 (= res!393064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611139 () Bool)

(declare-fun res!393066 () Bool)

(assert (=> b!611139 (=> (not res!393066) (not e!350161))))

(assert (=> b!611139 (= res!393066 (validKeyInArray!0 k0!1786))))

(declare-fun b!611140 () Bool)

(declare-fun Unit!19599 () Unit!19594)

(assert (=> b!611140 (= e!350155 Unit!19599)))

(declare-fun lt!279571 () Unit!19594)

(assert (=> b!611140 (= lt!279571 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279567 (select (arr!17929 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!611140 (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279568 () Unit!19594)

(assert (=> b!611140 (= lt!279568 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11967))))

(assert (=> b!611140 (arrayNoDuplicates!0 lt!279567 #b00000000000000000000000000000000 Nil!11967)))

(declare-fun lt!279581 () Unit!19594)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37363 (_ BitVec 32) (_ BitVec 32)) Unit!19594)

(assert (=> b!611140 (= lt!279581 (lemmaNoDuplicateFromThenFromBigger!0 lt!279567 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611140 (arrayNoDuplicates!0 lt!279567 j!136 Nil!11967)))

(declare-fun lt!279578 () Unit!19594)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37363 (_ BitVec 64) (_ BitVec 32) List!11970) Unit!19594)

(assert (=> b!611140 (= lt!279578 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279567 (select (arr!17929 a!2986) j!136) j!136 Nil!11967))))

(assert (=> b!611140 false))

(declare-fun b!611141 () Bool)

(assert (=> b!611141 (= e!350150 e!350149)))

(declare-fun res!393061 () Bool)

(assert (=> b!611141 (=> res!393061 e!350149)))

(assert (=> b!611141 (= res!393061 (bvsge index!984 j!136))))

(declare-fun lt!279580 () Unit!19594)

(assert (=> b!611141 (= lt!279580 e!350155)))

(declare-fun c!69397 () Bool)

(assert (=> b!611141 (= c!69397 (bvslt j!136 index!984))))

(assert (= (and start!55800 res!393073) b!611130))

(assert (= (and b!611130 res!393059) b!611133))

(assert (= (and b!611133 res!393076) b!611139))

(assert (= (and b!611139 res!393066) b!611134))

(assert (= (and b!611134 res!393062) b!611116))

(assert (= (and b!611116 res!393069) b!611138))

(assert (= (and b!611138 res!393064) b!611125))

(assert (= (and b!611125 res!393067) b!611119))

(assert (= (and b!611119 res!393077) b!611123))

(assert (= (and b!611123 res!393065) b!611129))

(assert (= (and b!611129 res!393074) b!611117))

(assert (= (and b!611117 res!393063) b!611132))

(assert (= (and b!611117 c!69398) b!611128))

(assert (= (and b!611117 (not c!69398)) b!611136))

(assert (= (and b!611117 (not res!393058)) b!611120))

(assert (= (and b!611120 res!393072) b!611131))

(assert (= (and b!611131 (not res!393075)) b!611122))

(assert (= (and b!611122 res!393057) b!611121))

(assert (= (and b!611120 (not res!393056)) b!611141))

(assert (= (and b!611141 c!69397) b!611140))

(assert (= (and b!611141 (not c!69397)) b!611126))

(assert (= (and b!611141 (not res!393061)) b!611118))

(assert (= (and b!611118 res!393070) b!611135))

(assert (= (and b!611118 (not res!393068)) b!611124))

(assert (= (and b!611124 (not res!393071)) b!611127))

(assert (= (and b!611127 res!393060) b!611137))

(declare-fun m!587535 () Bool)

(assert (=> b!611124 m!587535))

(declare-fun m!587537 () Bool)

(assert (=> b!611121 m!587537))

(assert (=> b!611121 m!587537))

(declare-fun m!587539 () Bool)

(assert (=> b!611121 m!587539))

(declare-fun m!587541 () Bool)

(assert (=> b!611119 m!587541))

(declare-fun m!587543 () Bool)

(assert (=> start!55800 m!587543))

(declare-fun m!587545 () Bool)

(assert (=> start!55800 m!587545))

(assert (=> b!611120 m!587537))

(declare-fun m!587547 () Bool)

(assert (=> b!611120 m!587547))

(declare-fun m!587549 () Bool)

(assert (=> b!611120 m!587549))

(assert (=> b!611140 m!587537))

(declare-fun m!587551 () Bool)

(assert (=> b!611140 m!587551))

(assert (=> b!611140 m!587537))

(assert (=> b!611140 m!587537))

(declare-fun m!587553 () Bool)

(assert (=> b!611140 m!587553))

(assert (=> b!611140 m!587537))

(declare-fun m!587555 () Bool)

(assert (=> b!611140 m!587555))

(declare-fun m!587557 () Bool)

(assert (=> b!611140 m!587557))

(declare-fun m!587559 () Bool)

(assert (=> b!611140 m!587559))

(declare-fun m!587561 () Bool)

(assert (=> b!611140 m!587561))

(declare-fun m!587563 () Bool)

(assert (=> b!611140 m!587563))

(assert (=> b!611133 m!587537))

(assert (=> b!611133 m!587537))

(declare-fun m!587565 () Bool)

(assert (=> b!611133 m!587565))

(assert (=> b!611122 m!587537))

(assert (=> b!611122 m!587537))

(declare-fun m!587567 () Bool)

(assert (=> b!611122 m!587567))

(assert (=> b!611118 m!587537))

(declare-fun m!587569 () Bool)

(assert (=> b!611118 m!587569))

(assert (=> b!611118 m!587537))

(assert (=> b!611118 m!587563))

(assert (=> b!611118 m!587537))

(assert (=> b!611118 m!587567))

(assert (=> b!611118 m!587537))

(declare-fun m!587571 () Bool)

(assert (=> b!611118 m!587571))

(assert (=> b!611118 m!587559))

(declare-fun m!587573 () Bool)

(assert (=> b!611127 m!587573))

(declare-fun m!587575 () Bool)

(assert (=> b!611116 m!587575))

(assert (=> b!611135 m!587537))

(assert (=> b!611135 m!587537))

(assert (=> b!611135 m!587539))

(declare-fun m!587577 () Bool)

(assert (=> b!611138 m!587577))

(declare-fun m!587579 () Bool)

(assert (=> b!611129 m!587579))

(assert (=> b!611129 m!587537))

(assert (=> b!611129 m!587537))

(declare-fun m!587581 () Bool)

(assert (=> b!611129 m!587581))

(declare-fun m!587583 () Bool)

(assert (=> b!611125 m!587583))

(declare-fun m!587585 () Bool)

(assert (=> b!611134 m!587585))

(assert (=> b!611123 m!587547))

(declare-fun m!587587 () Bool)

(assert (=> b!611123 m!587587))

(declare-fun m!587589 () Bool)

(assert (=> b!611117 m!587589))

(assert (=> b!611117 m!587537))

(declare-fun m!587591 () Bool)

(assert (=> b!611117 m!587591))

(assert (=> b!611117 m!587547))

(declare-fun m!587593 () Bool)

(assert (=> b!611117 m!587593))

(declare-fun m!587595 () Bool)

(assert (=> b!611117 m!587595))

(assert (=> b!611117 m!587537))

(declare-fun m!587597 () Bool)

(assert (=> b!611117 m!587597))

(declare-fun m!587599 () Bool)

(assert (=> b!611117 m!587599))

(declare-fun m!587601 () Bool)

(assert (=> b!611137 m!587601))

(assert (=> b!611131 m!587537))

(declare-fun m!587603 () Bool)

(assert (=> b!611139 m!587603))

(check-sat (not b!611134) (not b!611140) (not b!611117) (not b!611118) (not b!611137) (not b!611127) (not b!611124) (not start!55800) (not b!611129) (not b!611138) (not b!611121) (not b!611125) (not b!611135) (not b!611116) (not b!611122) (not b!611133) (not b!611139))
(check-sat)
(get-model)

(declare-fun d!88405 () Bool)

(declare-fun res!393148 () Bool)

(declare-fun e!350219 () Bool)

(assert (=> d!88405 (=> res!393148 e!350219)))

(assert (=> d!88405 (= res!393148 (= (select (arr!17929 lt!279567) j!136) (select (arr!17929 a!2986) j!136)))))

(assert (=> d!88405 (= (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) j!136) e!350219)))

(declare-fun b!611224 () Bool)

(declare-fun e!350220 () Bool)

(assert (=> b!611224 (= e!350219 e!350220)))

(declare-fun res!393149 () Bool)

(assert (=> b!611224 (=> (not res!393149) (not e!350220))))

(assert (=> b!611224 (= res!393149 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18293 lt!279567)))))

(declare-fun b!611225 () Bool)

(assert (=> b!611225 (= e!350220 (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88405 (not res!393148)) b!611224))

(assert (= (and b!611224 res!393149) b!611225))

(declare-fun m!587675 () Bool)

(assert (=> d!88405 m!587675))

(assert (=> b!611225 m!587537))

(declare-fun m!587677 () Bool)

(assert (=> b!611225 m!587677))

(assert (=> b!611122 d!88405))

(declare-fun d!88407 () Bool)

(declare-fun res!393150 () Bool)

(declare-fun e!350221 () Bool)

(assert (=> d!88407 (=> res!393150 e!350221)))

(assert (=> d!88407 (= res!393150 (= (select (arr!17929 lt!279567) index!984) (select (arr!17929 a!2986) j!136)))))

(assert (=> d!88407 (= (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) index!984) e!350221)))

(declare-fun b!611226 () Bool)

(declare-fun e!350222 () Bool)

(assert (=> b!611226 (= e!350221 e!350222)))

(declare-fun res!393151 () Bool)

(assert (=> b!611226 (=> (not res!393151) (not e!350222))))

(assert (=> b!611226 (= res!393151 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18293 lt!279567)))))

(declare-fun b!611227 () Bool)

(assert (=> b!611227 (= e!350222 (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88407 (not res!393150)) b!611226))

(assert (= (and b!611226 res!393151) b!611227))

(declare-fun m!587679 () Bool)

(assert (=> d!88407 m!587679))

(assert (=> b!611227 m!587537))

(declare-fun m!587681 () Bool)

(assert (=> b!611227 m!587681))

(assert (=> b!611121 d!88407))

(declare-fun d!88409 () Bool)

(declare-fun res!393152 () Bool)

(declare-fun e!350223 () Bool)

(assert (=> d!88409 (=> res!393152 e!350223)))

(assert (=> d!88409 (= res!393152 (= (select (arr!17929 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88409 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!350223)))

(declare-fun b!611228 () Bool)

(declare-fun e!350224 () Bool)

(assert (=> b!611228 (= e!350223 e!350224)))

(declare-fun res!393153 () Bool)

(assert (=> b!611228 (=> (not res!393153) (not e!350224))))

(assert (=> b!611228 (= res!393153 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18293 a!2986)))))

(declare-fun b!611229 () Bool)

(assert (=> b!611229 (= e!350224 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88409 (not res!393152)) b!611228))

(assert (= (and b!611228 res!393153) b!611229))

(declare-fun m!587683 () Bool)

(assert (=> d!88409 m!587683))

(declare-fun m!587685 () Bool)

(assert (=> b!611229 m!587685))

(assert (=> b!611134 d!88409))

(declare-fun d!88411 () Bool)

(assert (=> d!88411 (= (validKeyInArray!0 (select (arr!17929 a!2986) j!136)) (and (not (= (select (arr!17929 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17929 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!611133 d!88411))

(declare-fun d!88413 () Bool)

(assert (=> d!88413 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18293 lt!279567)) (not (= (select (arr!17929 lt!279567) j!136) (select (arr!17929 a!2986) j!136))))))

(declare-fun lt!279637 () Unit!19594)

(declare-fun choose!21 (array!37363 (_ BitVec 64) (_ BitVec 32) List!11970) Unit!19594)

(assert (=> d!88413 (= lt!279637 (choose!21 lt!279567 (select (arr!17929 a!2986) j!136) j!136 Nil!11967))))

(assert (=> d!88413 (bvslt (size!18293 lt!279567) #b01111111111111111111111111111111)))

(assert (=> d!88413 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279567 (select (arr!17929 a!2986) j!136) j!136 Nil!11967) lt!279637)))

(declare-fun bs!18646 () Bool)

(assert (= bs!18646 d!88413))

(assert (=> bs!18646 m!587675))

(assert (=> bs!18646 m!587537))

(declare-fun m!587687 () Bool)

(assert (=> bs!18646 m!587687))

(assert (=> b!611140 d!88413))

(declare-fun d!88415 () Bool)

(assert (=> d!88415 (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279640 () Unit!19594)

(declare-fun choose!114 (array!37363 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19594)

(assert (=> d!88415 (= lt!279640 (choose!114 lt!279567 (select (arr!17929 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88415 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88415 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279567 (select (arr!17929 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!279640)))

(declare-fun bs!18647 () Bool)

(assert (= bs!18647 d!88415))

(assert (=> bs!18647 m!587537))

(assert (=> bs!18647 m!587551))

(assert (=> bs!18647 m!587537))

(declare-fun m!587689 () Bool)

(assert (=> bs!18647 m!587689))

(assert (=> b!611140 d!88415))

(declare-fun d!88417 () Bool)

(declare-fun res!393154 () Bool)

(declare-fun e!350225 () Bool)

(assert (=> d!88417 (=> res!393154 e!350225)))

(assert (=> d!88417 (= res!393154 (= (select (arr!17929 lt!279567) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17929 a!2986) j!136)))))

(assert (=> d!88417 (= (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!350225)))

(declare-fun b!611230 () Bool)

(declare-fun e!350226 () Bool)

(assert (=> b!611230 (= e!350225 e!350226)))

(declare-fun res!393155 () Bool)

(assert (=> b!611230 (=> (not res!393155) (not e!350226))))

(assert (=> b!611230 (= res!393155 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18293 lt!279567)))))

(declare-fun b!611231 () Bool)

(assert (=> b!611231 (= e!350226 (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88417 (not res!393154)) b!611230))

(assert (= (and b!611230 res!393155) b!611231))

(declare-fun m!587691 () Bool)

(assert (=> d!88417 m!587691))

(assert (=> b!611231 m!587537))

(declare-fun m!587693 () Bool)

(assert (=> b!611231 m!587693))

(assert (=> b!611140 d!88417))

(declare-fun d!88419 () Bool)

(assert (=> d!88419 (arrayNoDuplicates!0 lt!279567 j!136 Nil!11967)))

(declare-fun lt!279643 () Unit!19594)

(declare-fun choose!39 (array!37363 (_ BitVec 32) (_ BitVec 32)) Unit!19594)

(assert (=> d!88419 (= lt!279643 (choose!39 lt!279567 #b00000000000000000000000000000000 j!136))))

(assert (=> d!88419 (bvslt (size!18293 lt!279567) #b01111111111111111111111111111111)))

(assert (=> d!88419 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!279567 #b00000000000000000000000000000000 j!136) lt!279643)))

(declare-fun bs!18648 () Bool)

(assert (= bs!18648 d!88419))

(assert (=> bs!18648 m!587557))

(declare-fun m!587695 () Bool)

(assert (=> bs!18648 m!587695))

(assert (=> b!611140 d!88419))

(declare-fun bm!33158 () Bool)

(declare-fun call!33161 () Bool)

(declare-fun c!69407 () Bool)

(assert (=> bm!33158 (= call!33161 (arrayNoDuplicates!0 lt!279567 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69407 (Cons!11966 (select (arr!17929 lt!279567) #b00000000000000000000000000000000) Nil!11967) Nil!11967)))))

(declare-fun b!611242 () Bool)

(declare-fun e!350237 () Bool)

(assert (=> b!611242 (= e!350237 call!33161)))

(declare-fun d!88421 () Bool)

(declare-fun res!393164 () Bool)

(declare-fun e!350236 () Bool)

(assert (=> d!88421 (=> res!393164 e!350236)))

(assert (=> d!88421 (= res!393164 (bvsge #b00000000000000000000000000000000 (size!18293 lt!279567)))))

(assert (=> d!88421 (= (arrayNoDuplicates!0 lt!279567 #b00000000000000000000000000000000 Nil!11967) e!350236)))

(declare-fun b!611243 () Bool)

(declare-fun e!350235 () Bool)

(assert (=> b!611243 (= e!350236 e!350235)))

(declare-fun res!393162 () Bool)

(assert (=> b!611243 (=> (not res!393162) (not e!350235))))

(declare-fun e!350238 () Bool)

(assert (=> b!611243 (= res!393162 (not e!350238))))

(declare-fun res!393163 () Bool)

(assert (=> b!611243 (=> (not res!393163) (not e!350238))))

(assert (=> b!611243 (= res!393163 (validKeyInArray!0 (select (arr!17929 lt!279567) #b00000000000000000000000000000000)))))

(declare-fun b!611244 () Bool)

(assert (=> b!611244 (= e!350237 call!33161)))

(declare-fun b!611245 () Bool)

(assert (=> b!611245 (= e!350238 (contains!3043 Nil!11967 (select (arr!17929 lt!279567) #b00000000000000000000000000000000)))))

(declare-fun b!611246 () Bool)

(assert (=> b!611246 (= e!350235 e!350237)))

(assert (=> b!611246 (= c!69407 (validKeyInArray!0 (select (arr!17929 lt!279567) #b00000000000000000000000000000000)))))

(assert (= (and d!88421 (not res!393164)) b!611243))

(assert (= (and b!611243 res!393163) b!611245))

(assert (= (and b!611243 res!393162) b!611246))

(assert (= (and b!611246 c!69407) b!611242))

(assert (= (and b!611246 (not c!69407)) b!611244))

(assert (= (or b!611242 b!611244) bm!33158))

(declare-fun m!587697 () Bool)

(assert (=> bm!33158 m!587697))

(declare-fun m!587699 () Bool)

(assert (=> bm!33158 m!587699))

(assert (=> b!611243 m!587697))

(assert (=> b!611243 m!587697))

(declare-fun m!587701 () Bool)

(assert (=> b!611243 m!587701))

(assert (=> b!611245 m!587697))

(assert (=> b!611245 m!587697))

(declare-fun m!587703 () Bool)

(assert (=> b!611245 m!587703))

(assert (=> b!611246 m!587697))

(assert (=> b!611246 m!587697))

(assert (=> b!611246 m!587701))

(assert (=> b!611140 d!88421))

(declare-fun call!33162 () Bool)

(declare-fun c!69408 () Bool)

(declare-fun bm!33159 () Bool)

(assert (=> bm!33159 (= call!33162 (arrayNoDuplicates!0 lt!279567 (bvadd j!136 #b00000000000000000000000000000001) (ite c!69408 (Cons!11966 (select (arr!17929 lt!279567) j!136) Nil!11967) Nil!11967)))))

(declare-fun b!611247 () Bool)

(declare-fun e!350241 () Bool)

(assert (=> b!611247 (= e!350241 call!33162)))

(declare-fun d!88423 () Bool)

(declare-fun res!393167 () Bool)

(declare-fun e!350240 () Bool)

(assert (=> d!88423 (=> res!393167 e!350240)))

(assert (=> d!88423 (= res!393167 (bvsge j!136 (size!18293 lt!279567)))))

(assert (=> d!88423 (= (arrayNoDuplicates!0 lt!279567 j!136 Nil!11967) e!350240)))

(declare-fun b!611248 () Bool)

(declare-fun e!350239 () Bool)

(assert (=> b!611248 (= e!350240 e!350239)))

(declare-fun res!393165 () Bool)

(assert (=> b!611248 (=> (not res!393165) (not e!350239))))

(declare-fun e!350242 () Bool)

(assert (=> b!611248 (= res!393165 (not e!350242))))

(declare-fun res!393166 () Bool)

(assert (=> b!611248 (=> (not res!393166) (not e!350242))))

(assert (=> b!611248 (= res!393166 (validKeyInArray!0 (select (arr!17929 lt!279567) j!136)))))

(declare-fun b!611249 () Bool)

(assert (=> b!611249 (= e!350241 call!33162)))

(declare-fun b!611250 () Bool)

(assert (=> b!611250 (= e!350242 (contains!3043 Nil!11967 (select (arr!17929 lt!279567) j!136)))))

(declare-fun b!611251 () Bool)

(assert (=> b!611251 (= e!350239 e!350241)))

(assert (=> b!611251 (= c!69408 (validKeyInArray!0 (select (arr!17929 lt!279567) j!136)))))

(assert (= (and d!88423 (not res!393167)) b!611248))

(assert (= (and b!611248 res!393166) b!611250))

(assert (= (and b!611248 res!393165) b!611251))

(assert (= (and b!611251 c!69408) b!611247))

(assert (= (and b!611251 (not c!69408)) b!611249))

(assert (= (or b!611247 b!611249) bm!33159))

(assert (=> bm!33159 m!587675))

(declare-fun m!587705 () Bool)

(assert (=> bm!33159 m!587705))

(assert (=> b!611248 m!587675))

(assert (=> b!611248 m!587675))

(declare-fun m!587707 () Bool)

(assert (=> b!611248 m!587707))

(assert (=> b!611250 m!587675))

(assert (=> b!611250 m!587675))

(declare-fun m!587709 () Bool)

(assert (=> b!611250 m!587709))

(assert (=> b!611251 m!587675))

(assert (=> b!611251 m!587675))

(assert (=> b!611251 m!587707))

(assert (=> b!611140 d!88423))

(declare-fun d!88425 () Bool)

(declare-fun e!350245 () Bool)

(assert (=> d!88425 e!350245))

(declare-fun res!393170 () Bool)

(assert (=> d!88425 (=> (not res!393170) (not e!350245))))

(assert (=> d!88425 (= res!393170 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18293 a!2986))))))

(declare-fun lt!279646 () Unit!19594)

(declare-fun choose!41 (array!37363 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11970) Unit!19594)

(assert (=> d!88425 (= lt!279646 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11967))))

(assert (=> d!88425 (bvslt (size!18293 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88425 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11967) lt!279646)))

(declare-fun b!611254 () Bool)

(assert (=> b!611254 (= e!350245 (arrayNoDuplicates!0 (array!37364 (store (arr!17929 a!2986) i!1108 k0!1786) (size!18293 a!2986)) #b00000000000000000000000000000000 Nil!11967))))

(assert (= (and d!88425 res!393170) b!611254))

(declare-fun m!587711 () Bool)

(assert (=> d!88425 m!587711))

(assert (=> b!611254 m!587547))

(declare-fun m!587713 () Bool)

(assert (=> b!611254 m!587713))

(assert (=> b!611140 d!88425))

(declare-fun b!611267 () Bool)

(declare-fun e!350252 () SeekEntryResult!6369)

(declare-fun e!350254 () SeekEntryResult!6369)

(assert (=> b!611267 (= e!350252 e!350254)))

(declare-fun lt!279651 () (_ BitVec 64))

(declare-fun c!69417 () Bool)

(assert (=> b!611267 (= c!69417 (= lt!279651 (select (arr!17929 a!2986) j!136)))))

(declare-fun b!611268 () Bool)

(declare-fun e!350253 () SeekEntryResult!6369)

(assert (=> b!611268 (= e!350253 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17929 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611269 () Bool)

(assert (=> b!611269 (= e!350253 (MissingVacant!6369 vacantSpotIndex!68))))

(declare-fun b!611270 () Bool)

(assert (=> b!611270 (= e!350252 Undefined!6369)))

(declare-fun d!88427 () Bool)

(declare-fun lt!279652 () SeekEntryResult!6369)

(get-info :version)

(assert (=> d!88427 (and (or ((_ is Undefined!6369) lt!279652) (not ((_ is Found!6369) lt!279652)) (and (bvsge (index!27758 lt!279652) #b00000000000000000000000000000000) (bvslt (index!27758 lt!279652) (size!18293 a!2986)))) (or ((_ is Undefined!6369) lt!279652) ((_ is Found!6369) lt!279652) (not ((_ is MissingVacant!6369) lt!279652)) (not (= (index!27760 lt!279652) vacantSpotIndex!68)) (and (bvsge (index!27760 lt!279652) #b00000000000000000000000000000000) (bvslt (index!27760 lt!279652) (size!18293 a!2986)))) (or ((_ is Undefined!6369) lt!279652) (ite ((_ is Found!6369) lt!279652) (= (select (arr!17929 a!2986) (index!27758 lt!279652)) (select (arr!17929 a!2986) j!136)) (and ((_ is MissingVacant!6369) lt!279652) (= (index!27760 lt!279652) vacantSpotIndex!68) (= (select (arr!17929 a!2986) (index!27760 lt!279652)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88427 (= lt!279652 e!350252)))

(declare-fun c!69415 () Bool)

(assert (=> d!88427 (= c!69415 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88427 (= lt!279651 (select (arr!17929 a!2986) index!984))))

(assert (=> d!88427 (validMask!0 mask!3053)))

(assert (=> d!88427 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17929 a!2986) j!136) a!2986 mask!3053) lt!279652)))

(declare-fun b!611271 () Bool)

(declare-fun c!69416 () Bool)

(assert (=> b!611271 (= c!69416 (= lt!279651 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611271 (= e!350254 e!350253)))

(declare-fun b!611272 () Bool)

(assert (=> b!611272 (= e!350254 (Found!6369 index!984))))

(assert (= (and d!88427 c!69415) b!611270))

(assert (= (and d!88427 (not c!69415)) b!611267))

(assert (= (and b!611267 c!69417) b!611272))

(assert (= (and b!611267 (not c!69417)) b!611271))

(assert (= (and b!611271 c!69416) b!611269))

(assert (= (and b!611271 (not c!69416)) b!611268))

(assert (=> b!611268 m!587589))

(assert (=> b!611268 m!587589))

(assert (=> b!611268 m!587537))

(declare-fun m!587715 () Bool)

(assert (=> b!611268 m!587715))

(declare-fun m!587717 () Bool)

(assert (=> d!88427 m!587717))

(declare-fun m!587719 () Bool)

(assert (=> d!88427 m!587719))

(assert (=> d!88427 m!587579))

(assert (=> d!88427 m!587543))

(assert (=> b!611129 d!88427))

(declare-fun d!88433 () Bool)

(declare-fun res!393176 () Bool)

(declare-fun e!350263 () Bool)

(assert (=> d!88433 (=> res!393176 e!350263)))

(assert (=> d!88433 (= res!393176 (bvsge #b00000000000000000000000000000000 (size!18293 a!2986)))))

(assert (=> d!88433 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!350263)))

(declare-fun b!611281 () Bool)

(declare-fun e!350261 () Bool)

(assert (=> b!611281 (= e!350263 e!350261)))

(declare-fun c!69420 () Bool)

(assert (=> b!611281 (= c!69420 (validKeyInArray!0 (select (arr!17929 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33162 () Bool)

(declare-fun call!33165 () Bool)

(assert (=> bm!33162 (= call!33165 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!611282 () Bool)

(assert (=> b!611282 (= e!350261 call!33165)))

(declare-fun b!611283 () Bool)

(declare-fun e!350262 () Bool)

(assert (=> b!611283 (= e!350262 call!33165)))

(declare-fun b!611284 () Bool)

(assert (=> b!611284 (= e!350261 e!350262)))

(declare-fun lt!279661 () (_ BitVec 64))

(assert (=> b!611284 (= lt!279661 (select (arr!17929 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!279659 () Unit!19594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37363 (_ BitVec 64) (_ BitVec 32)) Unit!19594)

(assert (=> b!611284 (= lt!279659 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!279661 #b00000000000000000000000000000000))))

(assert (=> b!611284 (arrayContainsKey!0 a!2986 lt!279661 #b00000000000000000000000000000000)))

(declare-fun lt!279660 () Unit!19594)

(assert (=> b!611284 (= lt!279660 lt!279659)))

(declare-fun res!393175 () Bool)

(assert (=> b!611284 (= res!393175 (= (seekEntryOrOpen!0 (select (arr!17929 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6369 #b00000000000000000000000000000000)))))

(assert (=> b!611284 (=> (not res!393175) (not e!350262))))

(assert (= (and d!88433 (not res!393176)) b!611281))

(assert (= (and b!611281 c!69420) b!611284))

(assert (= (and b!611281 (not c!69420)) b!611282))

(assert (= (and b!611284 res!393175) b!611283))

(assert (= (or b!611283 b!611282) bm!33162))

(assert (=> b!611281 m!587683))

(assert (=> b!611281 m!587683))

(declare-fun m!587721 () Bool)

(assert (=> b!611281 m!587721))

(declare-fun m!587723 () Bool)

(assert (=> bm!33162 m!587723))

(assert (=> b!611284 m!587683))

(declare-fun m!587725 () Bool)

(assert (=> b!611284 m!587725))

(declare-fun m!587727 () Bool)

(assert (=> b!611284 m!587727))

(assert (=> b!611284 m!587683))

(declare-fun m!587729 () Bool)

(assert (=> b!611284 m!587729))

(assert (=> b!611138 d!88433))

(declare-fun d!88435 () Bool)

(declare-fun lt!279668 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!240 (List!11970) (InoxSet (_ BitVec 64)))

(assert (=> d!88435 (= lt!279668 (select (content!240 Nil!11967) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!350275 () Bool)

(assert (=> d!88435 (= lt!279668 e!350275)))

(declare-fun res!393182 () Bool)

(assert (=> d!88435 (=> (not res!393182) (not e!350275))))

(assert (=> d!88435 (= res!393182 ((_ is Cons!11966) Nil!11967))))

(assert (=> d!88435 (= (contains!3043 Nil!11967 #b0000000000000000000000000000000000000000000000000000000000000000) lt!279668)))

(declare-fun b!611301 () Bool)

(declare-fun e!350274 () Bool)

(assert (=> b!611301 (= e!350275 e!350274)))

(declare-fun res!393181 () Bool)

(assert (=> b!611301 (=> res!393181 e!350274)))

(assert (=> b!611301 (= res!393181 (= (h!13011 Nil!11967) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!611302 () Bool)

(assert (=> b!611302 (= e!350274 (contains!3043 (t!18198 Nil!11967) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!88435 res!393182) b!611301))

(assert (= (and b!611301 (not res!393181)) b!611302))

(declare-fun m!587731 () Bool)

(assert (=> d!88435 m!587731))

(declare-fun m!587733 () Bool)

(assert (=> d!88435 m!587733))

(declare-fun m!587735 () Bool)

(assert (=> b!611302 m!587735))

(assert (=> b!611127 d!88435))

(declare-fun b!611354 () Bool)

(declare-fun e!350305 () SeekEntryResult!6369)

(declare-fun e!350304 () SeekEntryResult!6369)

(assert (=> b!611354 (= e!350305 e!350304)))

(declare-fun lt!279697 () (_ BitVec 64))

(declare-fun lt!279698 () SeekEntryResult!6369)

(assert (=> b!611354 (= lt!279697 (select (arr!17929 a!2986) (index!27759 lt!279698)))))

(declare-fun c!69451 () Bool)

(assert (=> b!611354 (= c!69451 (= lt!279697 k0!1786))))

(declare-fun e!350303 () SeekEntryResult!6369)

(declare-fun b!611355 () Bool)

(assert (=> b!611355 (= e!350303 (seekKeyOrZeroReturnVacant!0 (x!56568 lt!279698) (index!27759 lt!279698) (index!27759 lt!279698) k0!1786 a!2986 mask!3053))))

(declare-fun b!611356 () Bool)

(assert (=> b!611356 (= e!350305 Undefined!6369)))

(declare-fun b!611357 () Bool)

(assert (=> b!611357 (= e!350303 (MissingZero!6369 (index!27759 lt!279698)))))

(declare-fun b!611358 () Bool)

(declare-fun c!69453 () Bool)

(assert (=> b!611358 (= c!69453 (= lt!279697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611358 (= e!350304 e!350303)))

(declare-fun b!611359 () Bool)

(assert (=> b!611359 (= e!350304 (Found!6369 (index!27759 lt!279698)))))

(declare-fun d!88437 () Bool)

(declare-fun lt!279696 () SeekEntryResult!6369)

(assert (=> d!88437 (and (or ((_ is Undefined!6369) lt!279696) (not ((_ is Found!6369) lt!279696)) (and (bvsge (index!27758 lt!279696) #b00000000000000000000000000000000) (bvslt (index!27758 lt!279696) (size!18293 a!2986)))) (or ((_ is Undefined!6369) lt!279696) ((_ is Found!6369) lt!279696) (not ((_ is MissingZero!6369) lt!279696)) (and (bvsge (index!27757 lt!279696) #b00000000000000000000000000000000) (bvslt (index!27757 lt!279696) (size!18293 a!2986)))) (or ((_ is Undefined!6369) lt!279696) ((_ is Found!6369) lt!279696) ((_ is MissingZero!6369) lt!279696) (not ((_ is MissingVacant!6369) lt!279696)) (and (bvsge (index!27760 lt!279696) #b00000000000000000000000000000000) (bvslt (index!27760 lt!279696) (size!18293 a!2986)))) (or ((_ is Undefined!6369) lt!279696) (ite ((_ is Found!6369) lt!279696) (= (select (arr!17929 a!2986) (index!27758 lt!279696)) k0!1786) (ite ((_ is MissingZero!6369) lt!279696) (= (select (arr!17929 a!2986) (index!27757 lt!279696)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6369) lt!279696) (= (select (arr!17929 a!2986) (index!27760 lt!279696)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88437 (= lt!279696 e!350305)))

(declare-fun c!69452 () Bool)

(assert (=> d!88437 (= c!69452 (and ((_ is Intermediate!6369) lt!279698) (undefined!7181 lt!279698)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37363 (_ BitVec 32)) SeekEntryResult!6369)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88437 (= lt!279698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88437 (validMask!0 mask!3053)))

(assert (=> d!88437 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!279696)))

(assert (= (and d!88437 c!69452) b!611356))

(assert (= (and d!88437 (not c!69452)) b!611354))

(assert (= (and b!611354 c!69451) b!611359))

(assert (= (and b!611354 (not c!69451)) b!611358))

(assert (= (and b!611358 c!69453) b!611357))

(assert (= (and b!611358 (not c!69453)) b!611355))

(declare-fun m!587783 () Bool)

(assert (=> b!611354 m!587783))

(declare-fun m!587785 () Bool)

(assert (=> b!611355 m!587785))

(declare-fun m!587787 () Bool)

(assert (=> d!88437 m!587787))

(declare-fun m!587789 () Bool)

(assert (=> d!88437 m!587789))

(assert (=> d!88437 m!587787))

(declare-fun m!587791 () Bool)

(assert (=> d!88437 m!587791))

(declare-fun m!587793 () Bool)

(assert (=> d!88437 m!587793))

(declare-fun m!587795 () Bool)

(assert (=> d!88437 m!587795))

(assert (=> d!88437 m!587543))

(assert (=> b!611116 d!88437))

(declare-fun d!88451 () Bool)

(declare-fun lt!279699 () Bool)

(assert (=> d!88451 (= lt!279699 (select (content!240 Nil!11967) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!350307 () Bool)

(assert (=> d!88451 (= lt!279699 e!350307)))

(declare-fun res!393187 () Bool)

(assert (=> d!88451 (=> (not res!393187) (not e!350307))))

(assert (=> d!88451 (= res!393187 ((_ is Cons!11966) Nil!11967))))

(assert (=> d!88451 (= (contains!3043 Nil!11967 #b1000000000000000000000000000000000000000000000000000000000000000) lt!279699)))

(declare-fun b!611360 () Bool)

(declare-fun e!350306 () Bool)

(assert (=> b!611360 (= e!350307 e!350306)))

(declare-fun res!393186 () Bool)

(assert (=> b!611360 (=> res!393186 e!350306)))

(assert (=> b!611360 (= res!393186 (= (h!13011 Nil!11967) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!611361 () Bool)

(assert (=> b!611361 (= e!350306 (contains!3043 (t!18198 Nil!11967) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!88451 res!393187) b!611360))

(assert (= (and b!611360 (not res!393186)) b!611361))

(assert (=> d!88451 m!587731))

(declare-fun m!587797 () Bool)

(assert (=> d!88451 m!587797))

(declare-fun m!587799 () Bool)

(assert (=> b!611361 m!587799))

(assert (=> b!611137 d!88451))

(declare-fun d!88455 () Bool)

(declare-fun res!393188 () Bool)

(declare-fun e!350308 () Bool)

(assert (=> d!88455 (=> res!393188 e!350308)))

(assert (=> d!88455 (= res!393188 (= (select (arr!17929 lt!279567) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17929 a!2986) j!136)))))

(assert (=> d!88455 (= (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!350308)))

(declare-fun b!611362 () Bool)

(declare-fun e!350309 () Bool)

(assert (=> b!611362 (= e!350308 e!350309)))

(declare-fun res!393189 () Bool)

(assert (=> b!611362 (=> (not res!393189) (not e!350309))))

(assert (=> b!611362 (= res!393189 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18293 lt!279567)))))

(declare-fun b!611363 () Bool)

(assert (=> b!611363 (= e!350309 (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88455 (not res!393188)) b!611362))

(assert (= (and b!611362 res!393189) b!611363))

(declare-fun m!587801 () Bool)

(assert (=> d!88455 m!587801))

(assert (=> b!611363 m!587537))

(declare-fun m!587803 () Bool)

(assert (=> b!611363 m!587803))

(assert (=> b!611118 d!88455))

(assert (=> b!611118 d!88405))

(assert (=> b!611118 d!88421))

(declare-fun d!88459 () Bool)

(assert (=> d!88459 (arrayContainsKey!0 lt!279567 (select (arr!17929 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279703 () Unit!19594)

(assert (=> d!88459 (= lt!279703 (choose!114 lt!279567 (select (arr!17929 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88459 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88459 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279567 (select (arr!17929 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!279703)))

(declare-fun bs!18650 () Bool)

(assert (= bs!18650 d!88459))

(assert (=> bs!18650 m!587537))

(assert (=> bs!18650 m!587569))

(assert (=> bs!18650 m!587537))

(declare-fun m!587807 () Bool)

(assert (=> bs!18650 m!587807))

(assert (=> b!611118 d!88459))

(assert (=> b!611118 d!88425))

(declare-fun d!88463 () Bool)

(assert (=> d!88463 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!611139 d!88463))

(declare-fun b!611364 () Bool)

(declare-fun e!350310 () SeekEntryResult!6369)

(declare-fun e!350312 () SeekEntryResult!6369)

(assert (=> b!611364 (= e!350310 e!350312)))

(declare-fun lt!279704 () (_ BitVec 64))

(declare-fun c!69456 () Bool)

(assert (=> b!611364 (= c!69456 (= lt!279704 (select (arr!17929 a!2986) j!136)))))

(declare-fun e!350311 () SeekEntryResult!6369)

(declare-fun b!611365 () Bool)

(assert (=> b!611365 (= e!350311 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279573 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17929 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611366 () Bool)

(assert (=> b!611366 (= e!350311 (MissingVacant!6369 vacantSpotIndex!68))))

(declare-fun b!611367 () Bool)

(assert (=> b!611367 (= e!350310 Undefined!6369)))

(declare-fun d!88465 () Bool)

(declare-fun lt!279705 () SeekEntryResult!6369)

(assert (=> d!88465 (and (or ((_ is Undefined!6369) lt!279705) (not ((_ is Found!6369) lt!279705)) (and (bvsge (index!27758 lt!279705) #b00000000000000000000000000000000) (bvslt (index!27758 lt!279705) (size!18293 a!2986)))) (or ((_ is Undefined!6369) lt!279705) ((_ is Found!6369) lt!279705) (not ((_ is MissingVacant!6369) lt!279705)) (not (= (index!27760 lt!279705) vacantSpotIndex!68)) (and (bvsge (index!27760 lt!279705) #b00000000000000000000000000000000) (bvslt (index!27760 lt!279705) (size!18293 a!2986)))) (or ((_ is Undefined!6369) lt!279705) (ite ((_ is Found!6369) lt!279705) (= (select (arr!17929 a!2986) (index!27758 lt!279705)) (select (arr!17929 a!2986) j!136)) (and ((_ is MissingVacant!6369) lt!279705) (= (index!27760 lt!279705) vacantSpotIndex!68) (= (select (arr!17929 a!2986) (index!27760 lt!279705)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88465 (= lt!279705 e!350310)))

(declare-fun c!69454 () Bool)

(assert (=> d!88465 (= c!69454 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88465 (= lt!279704 (select (arr!17929 a!2986) lt!279573))))

(assert (=> d!88465 (validMask!0 mask!3053)))

(assert (=> d!88465 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279573 vacantSpotIndex!68 (select (arr!17929 a!2986) j!136) a!2986 mask!3053) lt!279705)))

(declare-fun b!611368 () Bool)

(declare-fun c!69455 () Bool)

(assert (=> b!611368 (= c!69455 (= lt!279704 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611368 (= e!350312 e!350311)))

(declare-fun b!611369 () Bool)

(assert (=> b!611369 (= e!350312 (Found!6369 lt!279573))))

(assert (= (and d!88465 c!69454) b!611367))

(assert (= (and d!88465 (not c!69454)) b!611364))

(assert (= (and b!611364 c!69456) b!611369))

(assert (= (and b!611364 (not c!69456)) b!611368))

(assert (= (and b!611368 c!69455) b!611366))

(assert (= (and b!611368 (not c!69455)) b!611365))

(declare-fun m!587811 () Bool)

(assert (=> b!611365 m!587811))

(assert (=> b!611365 m!587811))

(assert (=> b!611365 m!587537))

(declare-fun m!587813 () Bool)

(assert (=> b!611365 m!587813))

(declare-fun m!587815 () Bool)

(assert (=> d!88465 m!587815))

(declare-fun m!587817 () Bool)

(assert (=> d!88465 m!587817))

(declare-fun m!587819 () Bool)

(assert (=> d!88465 m!587819))

(assert (=> d!88465 m!587543))

(assert (=> b!611117 d!88465))

(declare-fun b!611370 () Bool)

(declare-fun e!350313 () SeekEntryResult!6369)

(declare-fun e!350315 () SeekEntryResult!6369)

(assert (=> b!611370 (= e!350313 e!350315)))

(declare-fun c!69459 () Bool)

(declare-fun lt!279706 () (_ BitVec 64))

(assert (=> b!611370 (= c!69459 (= lt!279706 lt!279574))))

(declare-fun e!350314 () SeekEntryResult!6369)

(declare-fun b!611371 () Bool)

(assert (=> b!611371 (= e!350314 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!279574 lt!279567 mask!3053))))

(declare-fun b!611372 () Bool)

(assert (=> b!611372 (= e!350314 (MissingVacant!6369 vacantSpotIndex!68))))

(declare-fun b!611373 () Bool)

(assert (=> b!611373 (= e!350313 Undefined!6369)))

(declare-fun d!88467 () Bool)

(declare-fun lt!279707 () SeekEntryResult!6369)

(assert (=> d!88467 (and (or ((_ is Undefined!6369) lt!279707) (not ((_ is Found!6369) lt!279707)) (and (bvsge (index!27758 lt!279707) #b00000000000000000000000000000000) (bvslt (index!27758 lt!279707) (size!18293 lt!279567)))) (or ((_ is Undefined!6369) lt!279707) ((_ is Found!6369) lt!279707) (not ((_ is MissingVacant!6369) lt!279707)) (not (= (index!27760 lt!279707) vacantSpotIndex!68)) (and (bvsge (index!27760 lt!279707) #b00000000000000000000000000000000) (bvslt (index!27760 lt!279707) (size!18293 lt!279567)))) (or ((_ is Undefined!6369) lt!279707) (ite ((_ is Found!6369) lt!279707) (= (select (arr!17929 lt!279567) (index!27758 lt!279707)) lt!279574) (and ((_ is MissingVacant!6369) lt!279707) (= (index!27760 lt!279707) vacantSpotIndex!68) (= (select (arr!17929 lt!279567) (index!27760 lt!279707)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88467 (= lt!279707 e!350313)))

(declare-fun c!69457 () Bool)

(assert (=> d!88467 (= c!69457 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88467 (= lt!279706 (select (arr!17929 lt!279567) index!984))))

(assert (=> d!88467 (validMask!0 mask!3053)))

(assert (=> d!88467 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279574 lt!279567 mask!3053) lt!279707)))

(declare-fun b!611374 () Bool)

(declare-fun c!69458 () Bool)

(assert (=> b!611374 (= c!69458 (= lt!279706 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611374 (= e!350315 e!350314)))

(declare-fun b!611375 () Bool)

(assert (=> b!611375 (= e!350315 (Found!6369 index!984))))

(assert (= (and d!88467 c!69457) b!611373))

(assert (= (and d!88467 (not c!69457)) b!611370))

(assert (= (and b!611370 c!69459) b!611375))

(assert (= (and b!611370 (not c!69459)) b!611374))

(assert (= (and b!611374 c!69458) b!611372))

(assert (= (and b!611374 (not c!69458)) b!611371))

(assert (=> b!611371 m!587589))

(assert (=> b!611371 m!587589))

(declare-fun m!587821 () Bool)

(assert (=> b!611371 m!587821))

(declare-fun m!587823 () Bool)

(assert (=> d!88467 m!587823))

(declare-fun m!587825 () Bool)

(assert (=> d!88467 m!587825))

(assert (=> d!88467 m!587679))

(assert (=> d!88467 m!587543))

(assert (=> b!611117 d!88467))

(declare-fun d!88469 () Bool)

(declare-fun lt!279710 () (_ BitVec 32))

(assert (=> d!88469 (and (bvsge lt!279710 #b00000000000000000000000000000000) (bvslt lt!279710 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88469 (= lt!279710 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!88469 (validMask!0 mask!3053)))

(assert (=> d!88469 (= (nextIndex!0 index!984 x!910 mask!3053) lt!279710)))

(declare-fun bs!18652 () Bool)

(assert (= bs!18652 d!88469))

(declare-fun m!587827 () Bool)

(assert (=> bs!18652 m!587827))

(assert (=> bs!18652 m!587543))

(assert (=> b!611117 d!88469))

(declare-fun b!611396 () Bool)

(declare-fun e!350332 () SeekEntryResult!6369)

(declare-fun e!350334 () SeekEntryResult!6369)

(assert (=> b!611396 (= e!350332 e!350334)))

(declare-fun c!69466 () Bool)

(declare-fun lt!279711 () (_ BitVec 64))

(assert (=> b!611396 (= c!69466 (= lt!279711 lt!279574))))

(declare-fun b!611397 () Bool)

(declare-fun e!350333 () SeekEntryResult!6369)

(assert (=> b!611397 (= e!350333 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279573 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!279574 lt!279567 mask!3053))))

(declare-fun b!611398 () Bool)

(assert (=> b!611398 (= e!350333 (MissingVacant!6369 vacantSpotIndex!68))))

(declare-fun b!611399 () Bool)

(assert (=> b!611399 (= e!350332 Undefined!6369)))

(declare-fun d!88471 () Bool)

(declare-fun lt!279712 () SeekEntryResult!6369)

(assert (=> d!88471 (and (or ((_ is Undefined!6369) lt!279712) (not ((_ is Found!6369) lt!279712)) (and (bvsge (index!27758 lt!279712) #b00000000000000000000000000000000) (bvslt (index!27758 lt!279712) (size!18293 lt!279567)))) (or ((_ is Undefined!6369) lt!279712) ((_ is Found!6369) lt!279712) (not ((_ is MissingVacant!6369) lt!279712)) (not (= (index!27760 lt!279712) vacantSpotIndex!68)) (and (bvsge (index!27760 lt!279712) #b00000000000000000000000000000000) (bvslt (index!27760 lt!279712) (size!18293 lt!279567)))) (or ((_ is Undefined!6369) lt!279712) (ite ((_ is Found!6369) lt!279712) (= (select (arr!17929 lt!279567) (index!27758 lt!279712)) lt!279574) (and ((_ is MissingVacant!6369) lt!279712) (= (index!27760 lt!279712) vacantSpotIndex!68) (= (select (arr!17929 lt!279567) (index!27760 lt!279712)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88471 (= lt!279712 e!350332)))

(declare-fun c!69464 () Bool)

(assert (=> d!88471 (= c!69464 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88471 (= lt!279711 (select (arr!17929 lt!279567) lt!279573))))

(assert (=> d!88471 (validMask!0 mask!3053)))

(assert (=> d!88471 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279573 vacantSpotIndex!68 lt!279574 lt!279567 mask!3053) lt!279712)))

(declare-fun b!611400 () Bool)

(declare-fun c!69465 () Bool)

(assert (=> b!611400 (= c!69465 (= lt!279711 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611400 (= e!350334 e!350333)))

(declare-fun b!611401 () Bool)

(assert (=> b!611401 (= e!350334 (Found!6369 lt!279573))))

(assert (= (and d!88471 c!69464) b!611399))

(assert (= (and d!88471 (not c!69464)) b!611396))

(assert (= (and b!611396 c!69466) b!611401))

(assert (= (and b!611396 (not c!69466)) b!611400))

(assert (= (and b!611400 c!69465) b!611398))

(assert (= (and b!611400 (not c!69465)) b!611397))

(assert (=> b!611397 m!587811))

(assert (=> b!611397 m!587811))

(declare-fun m!587829 () Bool)

(assert (=> b!611397 m!587829))

(declare-fun m!587831 () Bool)

(assert (=> d!88471 m!587831))

(declare-fun m!587833 () Bool)

(assert (=> d!88471 m!587833))

(declare-fun m!587835 () Bool)

(assert (=> d!88471 m!587835))

(assert (=> d!88471 m!587543))

(assert (=> b!611117 d!88471))

(declare-fun d!88473 () Bool)

(declare-fun e!350360 () Bool)

(assert (=> d!88473 e!350360))

(declare-fun res!393219 () Bool)

(assert (=> d!88473 (=> (not res!393219) (not e!350360))))

(assert (=> d!88473 (= res!393219 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18293 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18293 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18293 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18293 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18293 a!2986))))))

(declare-fun lt!279728 () Unit!19594)

(declare-fun choose!9 (array!37363 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19594)

(assert (=> d!88473 (= lt!279728 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279573 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88473 (validMask!0 mask!3053)))

(assert (=> d!88473 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279573 vacantSpotIndex!68 mask!3053) lt!279728)))

(declare-fun b!611435 () Bool)

(assert (=> b!611435 (= e!350360 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279573 vacantSpotIndex!68 (select (arr!17929 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279573 vacantSpotIndex!68 (select (store (arr!17929 a!2986) i!1108 k0!1786) j!136) (array!37364 (store (arr!17929 a!2986) i!1108 k0!1786) (size!18293 a!2986)) mask!3053)))))

(assert (= (and d!88473 res!393219) b!611435))

(declare-fun m!587863 () Bool)

(assert (=> d!88473 m!587863))

(assert (=> d!88473 m!587543))

(assert (=> b!611435 m!587537))

(assert (=> b!611435 m!587547))

(assert (=> b!611435 m!587537))

(assert (=> b!611435 m!587597))

(assert (=> b!611435 m!587599))

(declare-fun m!587865 () Bool)

(assert (=> b!611435 m!587865))

(assert (=> b!611435 m!587599))

(assert (=> b!611117 d!88473))

(assert (=> b!611135 d!88407))

(declare-fun d!88487 () Bool)

(declare-fun res!393234 () Bool)

(declare-fun e!350383 () Bool)

(assert (=> d!88487 (=> res!393234 e!350383)))

(assert (=> d!88487 (= res!393234 ((_ is Nil!11967) Nil!11967))))

(assert (=> d!88487 (= (noDuplicate!346 Nil!11967) e!350383)))

(declare-fun b!611466 () Bool)

(declare-fun e!350384 () Bool)

(assert (=> b!611466 (= e!350383 e!350384)))

(declare-fun res!393235 () Bool)

(assert (=> b!611466 (=> (not res!393235) (not e!350384))))

(assert (=> b!611466 (= res!393235 (not (contains!3043 (t!18198 Nil!11967) (h!13011 Nil!11967))))))

(declare-fun b!611467 () Bool)

(assert (=> b!611467 (= e!350384 (noDuplicate!346 (t!18198 Nil!11967)))))

(assert (= (and d!88487 (not res!393234)) b!611466))

(assert (= (and b!611466 res!393235) b!611467))

(declare-fun m!587887 () Bool)

(assert (=> b!611466 m!587887))

(declare-fun m!587889 () Bool)

(assert (=> b!611467 m!587889))

(assert (=> b!611124 d!88487))

(declare-fun d!88497 () Bool)

(assert (=> d!88497 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55800 d!88497))

(declare-fun d!88521 () Bool)

(assert (=> d!88521 (= (array_inv!13725 a!2986) (bvsge (size!18293 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55800 d!88521))

(declare-fun bm!33171 () Bool)

(declare-fun call!33174 () Bool)

(declare-fun c!69489 () Bool)

(assert (=> bm!33171 (= call!33174 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69489 (Cons!11966 (select (arr!17929 a!2986) #b00000000000000000000000000000000) Nil!11967) Nil!11967)))))

(declare-fun b!611496 () Bool)

(declare-fun e!350409 () Bool)

(assert (=> b!611496 (= e!350409 call!33174)))

(declare-fun d!88523 () Bool)

(declare-fun res!393254 () Bool)

(declare-fun e!350408 () Bool)

(assert (=> d!88523 (=> res!393254 e!350408)))

(assert (=> d!88523 (= res!393254 (bvsge #b00000000000000000000000000000000 (size!18293 a!2986)))))

(assert (=> d!88523 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11967) e!350408)))

(declare-fun b!611497 () Bool)

(declare-fun e!350407 () Bool)

(assert (=> b!611497 (= e!350408 e!350407)))

(declare-fun res!393252 () Bool)

(assert (=> b!611497 (=> (not res!393252) (not e!350407))))

(declare-fun e!350410 () Bool)

(assert (=> b!611497 (= res!393252 (not e!350410))))

(declare-fun res!393253 () Bool)

(assert (=> b!611497 (=> (not res!393253) (not e!350410))))

(assert (=> b!611497 (= res!393253 (validKeyInArray!0 (select (arr!17929 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!611498 () Bool)

(assert (=> b!611498 (= e!350409 call!33174)))

(declare-fun b!611499 () Bool)

(assert (=> b!611499 (= e!350410 (contains!3043 Nil!11967 (select (arr!17929 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!611500 () Bool)

(assert (=> b!611500 (= e!350407 e!350409)))

(assert (=> b!611500 (= c!69489 (validKeyInArray!0 (select (arr!17929 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88523 (not res!393254)) b!611497))

(assert (= (and b!611497 res!393253) b!611499))

(assert (= (and b!611497 res!393252) b!611500))

(assert (= (and b!611500 c!69489) b!611496))

(assert (= (and b!611500 (not c!69489)) b!611498))

(assert (= (or b!611496 b!611498) bm!33171))

(assert (=> bm!33171 m!587683))

(declare-fun m!587943 () Bool)

(assert (=> bm!33171 m!587943))

(assert (=> b!611497 m!587683))

(assert (=> b!611497 m!587683))

(assert (=> b!611497 m!587721))

(assert (=> b!611499 m!587683))

(assert (=> b!611499 m!587683))

(declare-fun m!587945 () Bool)

(assert (=> b!611499 m!587945))

(assert (=> b!611500 m!587683))

(assert (=> b!611500 m!587683))

(assert (=> b!611500 m!587721))

(assert (=> b!611125 d!88523))

(check-sat (not b!611268) (not b!611254) (not b!611397) (not bm!33162) (not b!611435) (not b!611467) (not d!88469) (not b!611466) (not b!611250) (not b!611371) (not d!88471) (not b!611355) (not b!611365) (not b!611361) (not b!611227) (not b!611246) (not d!88425) (not b!611229) (not b!611231) (not b!611499) (not d!88467) (not d!88437) (not d!88427) (not b!611248) (not b!611363) (not bm!33158) (not d!88435) (not b!611302) (not b!611284) (not b!611245) (not d!88473) (not b!611251) (not b!611500) (not b!611281) (not b!611497) (not d!88465) (not d!88459) (not d!88419) (not d!88451) (not bm!33159) (not bm!33171) (not b!611243) (not d!88413) (not b!611225) (not d!88415))
(check-sat)
