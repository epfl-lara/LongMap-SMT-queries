; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55576 () Bool)

(assert start!55576)

(declare-fun b!608511 () Bool)

(declare-datatypes ((Unit!19444 0))(
  ( (Unit!19445) )
))
(declare-fun e!348490 () Unit!19444)

(declare-fun Unit!19446 () Unit!19444)

(assert (=> b!608511 (= e!348490 Unit!19446)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!278005 () Unit!19444)

(declare-datatypes ((array!37307 0))(
  ( (array!37308 (arr!17904 (Array (_ BitVec 32) (_ BitVec 64))) (size!18268 (_ BitVec 32))) )
))
(declare-fun lt!278013 () array!37307)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37307)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37307 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19444)

(assert (=> b!608511 (= lt!278005 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278013 (select (arr!17904 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608511 (arrayContainsKey!0 lt!278013 (select (arr!17904 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!278014 () Unit!19444)

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((List!11945 0))(
  ( (Nil!11942) (Cons!11941 (h!12986 (_ BitVec 64)) (t!18173 List!11945)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37307 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11945) Unit!19444)

(assert (=> b!608511 (= lt!278014 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11942))))

(declare-fun arrayNoDuplicates!0 (array!37307 (_ BitVec 32) List!11945) Bool)

(assert (=> b!608511 (arrayNoDuplicates!0 lt!278013 #b00000000000000000000000000000000 Nil!11942)))

(declare-fun lt!277999 () Unit!19444)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37307 (_ BitVec 32) (_ BitVec 32)) Unit!19444)

(assert (=> b!608511 (= lt!277999 (lemmaNoDuplicateFromThenFromBigger!0 lt!278013 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608511 (arrayNoDuplicates!0 lt!278013 j!136 Nil!11942)))

(declare-fun lt!278000 () Unit!19444)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37307 (_ BitVec 64) (_ BitVec 32) List!11945) Unit!19444)

(assert (=> b!608511 (= lt!278000 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278013 (select (arr!17904 a!2986) j!136) j!136 Nil!11942))))

(assert (=> b!608511 false))

(declare-fun res!391191 () Bool)

(declare-fun e!348491 () Bool)

(assert (=> start!55576 (=> (not res!391191) (not e!348491))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55576 (= res!391191 (validMask!0 mask!3053))))

(assert (=> start!55576 e!348491))

(assert (=> start!55576 true))

(declare-fun array_inv!13700 (array!37307) Bool)

(assert (=> start!55576 (array_inv!13700 a!2986)))

(declare-fun b!608512 () Bool)

(declare-fun res!391185 () Bool)

(assert (=> b!608512 (=> (not res!391185) (not e!348491))))

(assert (=> b!608512 (= res!391185 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608513 () Bool)

(declare-fun res!391192 () Bool)

(declare-fun e!348500 () Bool)

(assert (=> b!608513 (=> (not res!391192) (not e!348500))))

(assert (=> b!608513 (= res!391192 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11942))))

(declare-fun b!608514 () Bool)

(declare-fun e!348489 () Bool)

(assert (=> b!608514 (= e!348500 e!348489)))

(declare-fun res!391187 () Bool)

(assert (=> b!608514 (=> (not res!391187) (not e!348489))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!608514 (= res!391187 (= (select (store (arr!17904 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608514 (= lt!278013 (array!37308 (store (arr!17904 a!2986) i!1108 k!1786) (size!18268 a!2986)))))

(declare-fun b!608515 () Bool)

(declare-fun e!348488 () Bool)

(declare-fun e!348497 () Bool)

(assert (=> b!608515 (= e!348488 e!348497)))

(declare-fun res!391177 () Bool)

(assert (=> b!608515 (=> (not res!391177) (not e!348497))))

(assert (=> b!608515 (= res!391177 (arrayContainsKey!0 lt!278013 (select (arr!17904 a!2986) j!136) j!136))))

(declare-fun b!608516 () Bool)

(declare-fun e!348496 () Unit!19444)

(declare-fun Unit!19447 () Unit!19444)

(assert (=> b!608516 (= e!348496 Unit!19447)))

(declare-fun b!608517 () Bool)

(declare-fun res!391190 () Bool)

(declare-fun e!348499 () Bool)

(assert (=> b!608517 (=> res!391190 e!348499)))

(declare-fun noDuplicate!327 (List!11945) Bool)

(assert (=> b!608517 (= res!391190 (not (noDuplicate!327 Nil!11942)))))

(declare-fun b!608518 () Bool)

(declare-fun res!391188 () Bool)

(assert (=> b!608518 (=> (not res!391188) (not e!348500))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!608518 (= res!391188 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17904 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608519 () Bool)

(declare-fun e!348495 () Bool)

(assert (=> b!608519 (= e!348495 e!348488)))

(declare-fun res!391179 () Bool)

(assert (=> b!608519 (=> res!391179 e!348488)))

(declare-fun lt!278004 () (_ BitVec 64))

(declare-fun lt!278006 () (_ BitVec 64))

(assert (=> b!608519 (= res!391179 (or (not (= (select (arr!17904 a!2986) j!136) lt!278004)) (not (= (select (arr!17904 a!2986) j!136) lt!278006)) (bvsge j!136 index!984)))))

(declare-fun b!608520 () Bool)

(assert (=> b!608520 (= e!348499 true)))

(declare-fun lt!278001 () Bool)

(declare-fun contains!3021 (List!11945 (_ BitVec 64)) Bool)

(assert (=> b!608520 (= lt!278001 (contains!3021 Nil!11942 k!1786))))

(declare-fun b!608521 () Bool)

(assert (=> b!608521 (= e!348497 (arrayContainsKey!0 lt!278013 (select (arr!17904 a!2986) j!136) index!984))))

(declare-fun b!608522 () Bool)

(declare-fun e!348487 () Bool)

(assert (=> b!608522 (= e!348487 e!348499)))

(declare-fun res!391178 () Bool)

(assert (=> b!608522 (=> res!391178 e!348499)))

(assert (=> b!608522 (= res!391178 (or (bvsge (size!18268 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18268 a!2986))))))

(assert (=> b!608522 (arrayContainsKey!0 lt!278013 (select (arr!17904 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278008 () Unit!19444)

(assert (=> b!608522 (= lt!278008 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278013 (select (arr!17904 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348486 () Bool)

(assert (=> b!608522 e!348486))

(declare-fun res!391184 () Bool)

(assert (=> b!608522 (=> (not res!391184) (not e!348486))))

(assert (=> b!608522 (= res!391184 (arrayContainsKey!0 lt!278013 (select (arr!17904 a!2986) j!136) j!136))))

(declare-fun b!608523 () Bool)

(assert (=> b!608523 (= e!348486 (arrayContainsKey!0 lt!278013 (select (arr!17904 a!2986) j!136) index!984))))

(declare-fun b!608524 () Bool)

(declare-fun e!348492 () Bool)

(declare-fun e!348494 () Bool)

(assert (=> b!608524 (= e!348492 e!348494)))

(declare-fun res!391183 () Bool)

(assert (=> b!608524 (=> res!391183 e!348494)))

(assert (=> b!608524 (= res!391183 (or (not (= (select (arr!17904 a!2986) j!136) lt!278004)) (not (= (select (arr!17904 a!2986) j!136) lt!278006))))))

(assert (=> b!608524 e!348495))

(declare-fun res!391182 () Bool)

(assert (=> b!608524 (=> (not res!391182) (not e!348495))))

(assert (=> b!608524 (= res!391182 (= lt!278006 (select (arr!17904 a!2986) j!136)))))

(assert (=> b!608524 (= lt!278006 (select (store (arr!17904 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!608525 () Bool)

(declare-fun Unit!19448 () Unit!19444)

(assert (=> b!608525 (= e!348496 Unit!19448)))

(assert (=> b!608525 false))

(declare-fun b!608526 () Bool)

(declare-fun e!348493 () Bool)

(assert (=> b!608526 (= e!348493 (not e!348492))))

(declare-fun res!391176 () Bool)

(assert (=> b!608526 (=> res!391176 e!348492)))

(declare-datatypes ((SeekEntryResult!6344 0))(
  ( (MissingZero!6344 (index!27651 (_ BitVec 32))) (Found!6344 (index!27652 (_ BitVec 32))) (Intermediate!6344 (undefined!7156 Bool) (index!27653 (_ BitVec 32)) (x!56461 (_ BitVec 32))) (Undefined!6344) (MissingVacant!6344 (index!27654 (_ BitVec 32))) )
))
(declare-fun lt!278002 () SeekEntryResult!6344)

(assert (=> b!608526 (= res!391176 (not (= lt!278002 (Found!6344 index!984))))))

(declare-fun lt!278012 () Unit!19444)

(assert (=> b!608526 (= lt!278012 e!348496)))

(declare-fun c!69037 () Bool)

(assert (=> b!608526 (= c!69037 (= lt!278002 Undefined!6344))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37307 (_ BitVec 32)) SeekEntryResult!6344)

(assert (=> b!608526 (= lt!278002 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278004 lt!278013 mask!3053))))

(declare-fun e!348501 () Bool)

(assert (=> b!608526 e!348501))

(declare-fun res!391181 () Bool)

(assert (=> b!608526 (=> (not res!391181) (not e!348501))))

(declare-fun lt!278007 () SeekEntryResult!6344)

(declare-fun lt!278003 () (_ BitVec 32))

(assert (=> b!608526 (= res!391181 (= lt!278007 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278003 vacantSpotIndex!68 lt!278004 lt!278013 mask!3053)))))

(assert (=> b!608526 (= lt!278007 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278003 vacantSpotIndex!68 (select (arr!17904 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608526 (= lt!278004 (select (store (arr!17904 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277998 () Unit!19444)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19444)

(assert (=> b!608526 (= lt!277998 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278003 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608526 (= lt!278003 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608527 () Bool)

(declare-fun res!391189 () Bool)

(assert (=> b!608527 (=> (not res!391189) (not e!348491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608527 (= res!391189 (validKeyInArray!0 k!1786))))

(declare-fun b!608528 () Bool)

(declare-fun lt!278011 () SeekEntryResult!6344)

(assert (=> b!608528 (= e!348501 (= lt!278011 lt!278007))))

(declare-fun b!608529 () Bool)

(assert (=> b!608529 (= e!348494 e!348487)))

(declare-fun res!391174 () Bool)

(assert (=> b!608529 (=> res!391174 e!348487)))

(assert (=> b!608529 (= res!391174 (bvsge index!984 j!136))))

(declare-fun lt!278010 () Unit!19444)

(assert (=> b!608529 (= lt!278010 e!348490)))

(declare-fun c!69038 () Bool)

(assert (=> b!608529 (= c!69038 (bvslt j!136 index!984))))

(declare-fun b!608530 () Bool)

(declare-fun res!391171 () Bool)

(assert (=> b!608530 (=> (not res!391171) (not e!348491))))

(assert (=> b!608530 (= res!391171 (and (= (size!18268 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18268 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18268 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608531 () Bool)

(declare-fun res!391186 () Bool)

(assert (=> b!608531 (=> res!391186 e!348499)))

(assert (=> b!608531 (= res!391186 (contains!3021 Nil!11942 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608532 () Bool)

(declare-fun res!391172 () Bool)

(assert (=> b!608532 (=> res!391172 e!348499)))

(assert (=> b!608532 (= res!391172 (contains!3021 Nil!11942 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608533 () Bool)

(declare-fun res!391175 () Bool)

(assert (=> b!608533 (=> (not res!391175) (not e!348500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37307 (_ BitVec 32)) Bool)

(assert (=> b!608533 (= res!391175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608534 () Bool)

(assert (=> b!608534 (= e!348491 e!348500)))

(declare-fun res!391180 () Bool)

(assert (=> b!608534 (=> (not res!391180) (not e!348500))))

(declare-fun lt!278009 () SeekEntryResult!6344)

(assert (=> b!608534 (= res!391180 (or (= lt!278009 (MissingZero!6344 i!1108)) (= lt!278009 (MissingVacant!6344 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37307 (_ BitVec 32)) SeekEntryResult!6344)

(assert (=> b!608534 (= lt!278009 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!608535 () Bool)

(declare-fun Unit!19449 () Unit!19444)

(assert (=> b!608535 (= e!348490 Unit!19449)))

(declare-fun b!608536 () Bool)

(assert (=> b!608536 (= e!348489 e!348493)))

(declare-fun res!391173 () Bool)

(assert (=> b!608536 (=> (not res!391173) (not e!348493))))

(assert (=> b!608536 (= res!391173 (and (= lt!278011 (Found!6344 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17904 a!2986) index!984) (select (arr!17904 a!2986) j!136))) (not (= (select (arr!17904 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!608536 (= lt!278011 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17904 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608537 () Bool)

(declare-fun res!391193 () Bool)

(assert (=> b!608537 (=> (not res!391193) (not e!348491))))

(assert (=> b!608537 (= res!391193 (validKeyInArray!0 (select (arr!17904 a!2986) j!136)))))

(assert (= (and start!55576 res!391191) b!608530))

(assert (= (and b!608530 res!391171) b!608537))

(assert (= (and b!608537 res!391193) b!608527))

(assert (= (and b!608527 res!391189) b!608512))

(assert (= (and b!608512 res!391185) b!608534))

(assert (= (and b!608534 res!391180) b!608533))

(assert (= (and b!608533 res!391175) b!608513))

(assert (= (and b!608513 res!391192) b!608518))

(assert (= (and b!608518 res!391188) b!608514))

(assert (= (and b!608514 res!391187) b!608536))

(assert (= (and b!608536 res!391173) b!608526))

(assert (= (and b!608526 res!391181) b!608528))

(assert (= (and b!608526 c!69037) b!608525))

(assert (= (and b!608526 (not c!69037)) b!608516))

(assert (= (and b!608526 (not res!391176)) b!608524))

(assert (= (and b!608524 res!391182) b!608519))

(assert (= (and b!608519 (not res!391179)) b!608515))

(assert (= (and b!608515 res!391177) b!608521))

(assert (= (and b!608524 (not res!391183)) b!608529))

(assert (= (and b!608529 c!69038) b!608511))

(assert (= (and b!608529 (not c!69038)) b!608535))

(assert (= (and b!608529 (not res!391174)) b!608522))

(assert (= (and b!608522 res!391184) b!608523))

(assert (= (and b!608522 (not res!391178)) b!608517))

(assert (= (and b!608517 (not res!391190)) b!608531))

(assert (= (and b!608531 (not res!391186)) b!608532))

(assert (= (and b!608532 (not res!391172)) b!608520))

(declare-fun m!585131 () Bool)

(assert (=> b!608533 m!585131))

(declare-fun m!585133 () Bool)

(assert (=> b!608537 m!585133))

(assert (=> b!608537 m!585133))

(declare-fun m!585135 () Bool)

(assert (=> b!608537 m!585135))

(declare-fun m!585137 () Bool)

(assert (=> b!608534 m!585137))

(assert (=> b!608523 m!585133))

(assert (=> b!608523 m!585133))

(declare-fun m!585139 () Bool)

(assert (=> b!608523 m!585139))

(assert (=> b!608521 m!585133))

(assert (=> b!608521 m!585133))

(assert (=> b!608521 m!585139))

(declare-fun m!585141 () Bool)

(assert (=> b!608520 m!585141))

(assert (=> b!608515 m!585133))

(assert (=> b!608515 m!585133))

(declare-fun m!585143 () Bool)

(assert (=> b!608515 m!585143))

(declare-fun m!585145 () Bool)

(assert (=> b!608527 m!585145))

(declare-fun m!585147 () Bool)

(assert (=> b!608511 m!585147))

(declare-fun m!585149 () Bool)

(assert (=> b!608511 m!585149))

(declare-fun m!585151 () Bool)

(assert (=> b!608511 m!585151))

(assert (=> b!608511 m!585133))

(declare-fun m!585153 () Bool)

(assert (=> b!608511 m!585153))

(assert (=> b!608511 m!585133))

(declare-fun m!585155 () Bool)

(assert (=> b!608511 m!585155))

(declare-fun m!585157 () Bool)

(assert (=> b!608511 m!585157))

(assert (=> b!608511 m!585133))

(assert (=> b!608511 m!585133))

(declare-fun m!585159 () Bool)

(assert (=> b!608511 m!585159))

(assert (=> b!608524 m!585133))

(declare-fun m!585161 () Bool)

(assert (=> b!608524 m!585161))

(declare-fun m!585163 () Bool)

(assert (=> b!608524 m!585163))

(assert (=> b!608514 m!585161))

(declare-fun m!585165 () Bool)

(assert (=> b!608514 m!585165))

(declare-fun m!585167 () Bool)

(assert (=> b!608536 m!585167))

(assert (=> b!608536 m!585133))

(assert (=> b!608536 m!585133))

(declare-fun m!585169 () Bool)

(assert (=> b!608536 m!585169))

(declare-fun m!585171 () Bool)

(assert (=> b!608531 m!585171))

(declare-fun m!585173 () Bool)

(assert (=> b!608526 m!585173))

(assert (=> b!608526 m!585133))

(assert (=> b!608526 m!585161))

(declare-fun m!585175 () Bool)

(assert (=> b!608526 m!585175))

(assert (=> b!608526 m!585133))

(declare-fun m!585177 () Bool)

(assert (=> b!608526 m!585177))

(declare-fun m!585179 () Bool)

(assert (=> b!608526 m!585179))

(declare-fun m!585181 () Bool)

(assert (=> b!608526 m!585181))

(declare-fun m!585183 () Bool)

(assert (=> b!608526 m!585183))

(assert (=> b!608519 m!585133))

(assert (=> b!608522 m!585133))

(assert (=> b!608522 m!585133))

(declare-fun m!585185 () Bool)

(assert (=> b!608522 m!585185))

(assert (=> b!608522 m!585133))

(declare-fun m!585187 () Bool)

(assert (=> b!608522 m!585187))

(assert (=> b!608522 m!585133))

(assert (=> b!608522 m!585143))

(declare-fun m!585189 () Bool)

(assert (=> b!608512 m!585189))

(declare-fun m!585191 () Bool)

(assert (=> b!608532 m!585191))

(declare-fun m!585193 () Bool)

(assert (=> b!608513 m!585193))

(declare-fun m!585195 () Bool)

(assert (=> start!55576 m!585195))

(declare-fun m!585197 () Bool)

(assert (=> start!55576 m!585197))

(declare-fun m!585199 () Bool)

(assert (=> b!608518 m!585199))

(declare-fun m!585201 () Bool)

(assert (=> b!608517 m!585201))

(push 1)

