; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57252 () Bool)

(assert start!57252)

(declare-fun b!633540 () Bool)

(declare-fun res!409691 () Bool)

(declare-fun e!362245 () Bool)

(assert (=> b!633540 (=> (not res!409691) (not e!362245))))

(declare-datatypes ((array!38162 0))(
  ( (array!38163 (arr!18311 (Array (_ BitVec 32) (_ BitVec 64))) (size!18675 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38162)

(declare-datatypes ((List!12352 0))(
  ( (Nil!12349) (Cons!12348 (h!13393 (_ BitVec 64)) (t!18580 List!12352)) )
))
(declare-fun arrayNoDuplicates!0 (array!38162 (_ BitVec 32) List!12352) Bool)

(assert (=> b!633540 (= res!409691 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12349))))

(declare-fun b!633541 () Bool)

(declare-fun e!362248 () Bool)

(declare-fun e!362251 () Bool)

(assert (=> b!633541 (= e!362248 e!362251)))

(declare-fun res!409688 () Bool)

(assert (=> b!633541 (=> (not res!409688) (not e!362251))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6751 0))(
  ( (MissingZero!6751 (index!29303 (_ BitVec 32))) (Found!6751 (index!29304 (_ BitVec 32))) (Intermediate!6751 (undefined!7563 Bool) (index!29305 (_ BitVec 32)) (x!58044 (_ BitVec 32))) (Undefined!6751) (MissingVacant!6751 (index!29306 (_ BitVec 32))) )
))
(declare-fun lt!292825 () SeekEntryResult!6751)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!633541 (= res!409688 (and (= lt!292825 (Found!6751 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18311 a!2986) index!984) (select (arr!18311 a!2986) j!136))) (not (= (select (arr!18311 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38162 (_ BitVec 32)) SeekEntryResult!6751)

(assert (=> b!633541 (= lt!292825 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18311 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633542 () Bool)

(declare-fun res!409692 () Bool)

(assert (=> b!633542 (=> (not res!409692) (not e!362245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38162 (_ BitVec 32)) Bool)

(assert (=> b!633542 (= res!409692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!409683 () Bool)

(declare-fun e!362247 () Bool)

(assert (=> start!57252 (=> (not res!409683) (not e!362247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57252 (= res!409683 (validMask!0 mask!3053))))

(assert (=> start!57252 e!362247))

(assert (=> start!57252 true))

(declare-fun array_inv!14107 (array!38162) Bool)

(assert (=> start!57252 (array_inv!14107 a!2986)))

(declare-fun b!633543 () Bool)

(declare-datatypes ((Unit!21338 0))(
  ( (Unit!21339) )
))
(declare-fun e!362249 () Unit!21338)

(declare-fun Unit!21340 () Unit!21338)

(assert (=> b!633543 (= e!362249 Unit!21340)))

(assert (=> b!633543 false))

(declare-fun b!633544 () Bool)

(declare-fun Unit!21341 () Unit!21338)

(assert (=> b!633544 (= e!362249 Unit!21341)))

(declare-fun b!633545 () Bool)

(declare-fun res!409693 () Bool)

(assert (=> b!633545 (=> (not res!409693) (not e!362247))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633545 (= res!409693 (validKeyInArray!0 k!1786))))

(declare-fun b!633546 () Bool)

(declare-fun lt!292831 () array!38162)

(declare-fun e!362244 () Bool)

(declare-fun arrayContainsKey!0 (array!38162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633546 (= e!362244 (arrayContainsKey!0 lt!292831 (select (arr!18311 a!2986) j!136) index!984))))

(declare-fun b!633547 () Bool)

(declare-fun e!362246 () Bool)

(assert (=> b!633547 (= e!362246 true)))

(declare-fun e!362252 () Bool)

(assert (=> b!633547 e!362252))

(declare-fun res!409697 () Bool)

(assert (=> b!633547 (=> (not res!409697) (not e!362252))))

(declare-fun lt!292824 () (_ BitVec 64))

(assert (=> b!633547 (= res!409697 (= lt!292824 (select (arr!18311 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633547 (= lt!292824 (select (store (arr!18311 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!633548 () Bool)

(declare-fun res!409687 () Bool)

(assert (=> b!633548 (=> (not res!409687) (not e!362247))))

(assert (=> b!633548 (= res!409687 (and (= (size!18675 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18675 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18675 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633549 () Bool)

(declare-fun e!362243 () Bool)

(assert (=> b!633549 (= e!362252 e!362243)))

(declare-fun res!409695 () Bool)

(assert (=> b!633549 (=> res!409695 e!362243)))

(declare-fun lt!292829 () (_ BitVec 64))

(assert (=> b!633549 (= res!409695 (or (not (= (select (arr!18311 a!2986) j!136) lt!292829)) (not (= (select (arr!18311 a!2986) j!136) lt!292824)) (bvsge j!136 index!984)))))

(declare-fun b!633550 () Bool)

(declare-fun res!409690 () Bool)

(assert (=> b!633550 (=> (not res!409690) (not e!362247))))

(assert (=> b!633550 (= res!409690 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633551 () Bool)

(assert (=> b!633551 (= e!362251 (not e!362246))))

(declare-fun res!409682 () Bool)

(assert (=> b!633551 (=> res!409682 e!362246)))

(declare-fun lt!292830 () SeekEntryResult!6751)

(assert (=> b!633551 (= res!409682 (not (= lt!292830 (Found!6751 index!984))))))

(declare-fun lt!292827 () Unit!21338)

(assert (=> b!633551 (= lt!292827 e!362249)))

(declare-fun c!72296 () Bool)

(assert (=> b!633551 (= c!72296 (= lt!292830 Undefined!6751))))

(assert (=> b!633551 (= lt!292830 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292829 lt!292831 mask!3053))))

(declare-fun e!362253 () Bool)

(assert (=> b!633551 e!362253))

(declare-fun res!409684 () Bool)

(assert (=> b!633551 (=> (not res!409684) (not e!362253))))

(declare-fun lt!292822 () SeekEntryResult!6751)

(declare-fun lt!292823 () (_ BitVec 32))

(assert (=> b!633551 (= res!409684 (= lt!292822 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292823 vacantSpotIndex!68 lt!292829 lt!292831 mask!3053)))))

(assert (=> b!633551 (= lt!292822 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292823 vacantSpotIndex!68 (select (arr!18311 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633551 (= lt!292829 (select (store (arr!18311 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292828 () Unit!21338)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38162 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21338)

(assert (=> b!633551 (= lt!292828 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292823 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633551 (= lt!292823 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633552 () Bool)

(assert (=> b!633552 (= e!362247 e!362245)))

(declare-fun res!409689 () Bool)

(assert (=> b!633552 (=> (not res!409689) (not e!362245))))

(declare-fun lt!292826 () SeekEntryResult!6751)

(assert (=> b!633552 (= res!409689 (or (= lt!292826 (MissingZero!6751 i!1108)) (= lt!292826 (MissingVacant!6751 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38162 (_ BitVec 32)) SeekEntryResult!6751)

(assert (=> b!633552 (= lt!292826 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!633553 () Bool)

(declare-fun res!409696 () Bool)

(assert (=> b!633553 (=> (not res!409696) (not e!362245))))

(assert (=> b!633553 (= res!409696 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18311 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633554 () Bool)

(assert (=> b!633554 (= e!362243 e!362244)))

(declare-fun res!409685 () Bool)

(assert (=> b!633554 (=> (not res!409685) (not e!362244))))

(assert (=> b!633554 (= res!409685 (arrayContainsKey!0 lt!292831 (select (arr!18311 a!2986) j!136) j!136))))

(declare-fun b!633555 () Bool)

(declare-fun res!409694 () Bool)

(assert (=> b!633555 (=> (not res!409694) (not e!362247))))

(assert (=> b!633555 (= res!409694 (validKeyInArray!0 (select (arr!18311 a!2986) j!136)))))

(declare-fun b!633556 () Bool)

(assert (=> b!633556 (= e!362245 e!362248)))

(declare-fun res!409686 () Bool)

(assert (=> b!633556 (=> (not res!409686) (not e!362248))))

(assert (=> b!633556 (= res!409686 (= (select (store (arr!18311 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633556 (= lt!292831 (array!38163 (store (arr!18311 a!2986) i!1108 k!1786) (size!18675 a!2986)))))

(declare-fun b!633557 () Bool)

(assert (=> b!633557 (= e!362253 (= lt!292825 lt!292822))))

(assert (= (and start!57252 res!409683) b!633548))

(assert (= (and b!633548 res!409687) b!633555))

(assert (= (and b!633555 res!409694) b!633545))

(assert (= (and b!633545 res!409693) b!633550))

(assert (= (and b!633550 res!409690) b!633552))

(assert (= (and b!633552 res!409689) b!633542))

(assert (= (and b!633542 res!409692) b!633540))

(assert (= (and b!633540 res!409691) b!633553))

(assert (= (and b!633553 res!409696) b!633556))

(assert (= (and b!633556 res!409686) b!633541))

(assert (= (and b!633541 res!409688) b!633551))

(assert (= (and b!633551 res!409684) b!633557))

(assert (= (and b!633551 c!72296) b!633543))

(assert (= (and b!633551 (not c!72296)) b!633544))

(assert (= (and b!633551 (not res!409682)) b!633547))

(assert (= (and b!633547 res!409697) b!633549))

(assert (= (and b!633549 (not res!409695)) b!633554))

(assert (= (and b!633554 res!409685) b!633546))

(declare-fun m!608179 () Bool)

(assert (=> b!633545 m!608179))

(declare-fun m!608181 () Bool)

(assert (=> start!57252 m!608181))

(declare-fun m!608183 () Bool)

(assert (=> start!57252 m!608183))

(declare-fun m!608185 () Bool)

(assert (=> b!633542 m!608185))

(declare-fun m!608187 () Bool)

(assert (=> b!633546 m!608187))

(assert (=> b!633546 m!608187))

(declare-fun m!608189 () Bool)

(assert (=> b!633546 m!608189))

(declare-fun m!608191 () Bool)

(assert (=> b!633540 m!608191))

(assert (=> b!633549 m!608187))

(declare-fun m!608193 () Bool)

(assert (=> b!633553 m!608193))

(declare-fun m!608195 () Bool)

(assert (=> b!633550 m!608195))

(assert (=> b!633547 m!608187))

(declare-fun m!608197 () Bool)

(assert (=> b!633547 m!608197))

(declare-fun m!608199 () Bool)

(assert (=> b!633547 m!608199))

(assert (=> b!633556 m!608197))

(declare-fun m!608201 () Bool)

(assert (=> b!633556 m!608201))

(assert (=> b!633554 m!608187))

(assert (=> b!633554 m!608187))

(declare-fun m!608203 () Bool)

(assert (=> b!633554 m!608203))

(assert (=> b!633551 m!608187))

(declare-fun m!608205 () Bool)

(assert (=> b!633551 m!608205))

(assert (=> b!633551 m!608197))

(declare-fun m!608207 () Bool)

(assert (=> b!633551 m!608207))

(declare-fun m!608209 () Bool)

(assert (=> b!633551 m!608209))

(assert (=> b!633551 m!608187))

(declare-fun m!608211 () Bool)

(assert (=> b!633551 m!608211))

(declare-fun m!608213 () Bool)

(assert (=> b!633551 m!608213))

(declare-fun m!608215 () Bool)

(assert (=> b!633551 m!608215))

(declare-fun m!608217 () Bool)

(assert (=> b!633552 m!608217))

(declare-fun m!608219 () Bool)

(assert (=> b!633541 m!608219))

(assert (=> b!633541 m!608187))

(assert (=> b!633541 m!608187))

(declare-fun m!608221 () Bool)

(assert (=> b!633541 m!608221))

(assert (=> b!633555 m!608187))

(assert (=> b!633555 m!608187))

(declare-fun m!608223 () Bool)

(assert (=> b!633555 m!608223))

(push 1)

