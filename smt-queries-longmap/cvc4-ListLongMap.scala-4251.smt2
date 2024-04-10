; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58980 () Bool)

(assert start!58980)

(declare-fun b!650497 () Bool)

(declare-datatypes ((Unit!22176 0))(
  ( (Unit!22177) )
))
(declare-fun e!373202 () Unit!22176)

(declare-fun Unit!22178 () Unit!22176)

(assert (=> b!650497 (= e!373202 Unit!22178)))

(assert (=> b!650497 false))

(declare-fun b!650498 () Bool)

(declare-fun e!373194 () Bool)

(declare-fun e!373206 () Bool)

(assert (=> b!650498 (= e!373194 e!373206)))

(declare-fun res!421661 () Bool)

(assert (=> b!650498 (=> (not res!421661) (not e!373206))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38561 0))(
  ( (array!38562 (arr!18485 (Array (_ BitVec 32) (_ BitVec 64))) (size!18849 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38561)

(assert (=> b!650498 (= res!421661 (= (select (store (arr!18485 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!302253 () array!38561)

(assert (=> b!650498 (= lt!302253 (array!38562 (store (arr!18485 a!2986) i!1108 k!1786) (size!18849 a!2986)))))

(declare-fun b!650499 () Bool)

(declare-fun e!373198 () Bool)

(declare-fun e!373192 () Bool)

(assert (=> b!650499 (= e!373198 e!373192)))

(declare-fun res!421668 () Bool)

(assert (=> b!650499 (=> (not res!421668) (not e!373192))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650499 (= res!421668 (arrayContainsKey!0 lt!302253 (select (arr!18485 a!2986) j!136) j!136))))

(declare-fun b!650500 () Bool)

(declare-fun res!421669 () Bool)

(assert (=> b!650500 (=> (not res!421669) (not e!373194))))

(declare-datatypes ((List!12526 0))(
  ( (Nil!12523) (Cons!12522 (h!13567 (_ BitVec 64)) (t!18754 List!12526)) )
))
(declare-fun arrayNoDuplicates!0 (array!38561 (_ BitVec 32) List!12526) Bool)

(assert (=> b!650500 (= res!421669 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12523))))

(declare-fun b!650501 () Bool)

(declare-fun e!373193 () Bool)

(assert (=> b!650501 (= e!373193 e!373194)))

(declare-fun res!421679 () Bool)

(assert (=> b!650501 (=> (not res!421679) (not e!373194))))

(declare-datatypes ((SeekEntryResult!6925 0))(
  ( (MissingZero!6925 (index!30050 (_ BitVec 32))) (Found!6925 (index!30051 (_ BitVec 32))) (Intermediate!6925 (undefined!7737 Bool) (index!30052 (_ BitVec 32)) (x!58835 (_ BitVec 32))) (Undefined!6925) (MissingVacant!6925 (index!30053 (_ BitVec 32))) )
))
(declare-fun lt!302246 () SeekEntryResult!6925)

(assert (=> b!650501 (= res!421679 (or (= lt!302246 (MissingZero!6925 i!1108)) (= lt!302246 (MissingVacant!6925 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38561 (_ BitVec 32)) SeekEntryResult!6925)

(assert (=> b!650501 (= lt!302246 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!650502 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun e!373203 () Bool)

(assert (=> b!650502 (= e!373203 (arrayContainsKey!0 lt!302253 (select (arr!18485 a!2986) j!136) index!984))))

(declare-fun b!650503 () Bool)

(declare-fun e!373195 () Bool)

(declare-fun e!373200 () Bool)

(assert (=> b!650503 (= e!373195 e!373200)))

(declare-fun res!421677 () Bool)

(assert (=> b!650503 (=> res!421677 e!373200)))

(assert (=> b!650503 (= res!421677 (bvsge index!984 j!136))))

(declare-fun lt!302250 () Unit!22176)

(declare-fun e!373205 () Unit!22176)

(assert (=> b!650503 (= lt!302250 e!373205)))

(declare-fun c!74786 () Bool)

(assert (=> b!650503 (= c!74786 (bvslt j!136 index!984))))

(declare-fun b!650504 () Bool)

(declare-fun e!373196 () Bool)

(assert (=> b!650504 (= e!373206 e!373196)))

(declare-fun res!421666 () Bool)

(assert (=> b!650504 (=> (not res!421666) (not e!373196))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!302239 () SeekEntryResult!6925)

(assert (=> b!650504 (= res!421666 (and (= lt!302239 (Found!6925 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18485 a!2986) index!984) (select (arr!18485 a!2986) j!136))) (not (= (select (arr!18485 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38561 (_ BitVec 32)) SeekEntryResult!6925)

(assert (=> b!650504 (= lt!302239 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18485 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650505 () Bool)

(declare-fun e!373197 () Bool)

(assert (=> b!650505 (= e!373196 (not e!373197))))

(declare-fun res!421674 () Bool)

(assert (=> b!650505 (=> res!421674 e!373197)))

(declare-fun lt!302241 () SeekEntryResult!6925)

(assert (=> b!650505 (= res!421674 (not (= lt!302241 (Found!6925 index!984))))))

(declare-fun lt!302248 () Unit!22176)

(assert (=> b!650505 (= lt!302248 e!373202)))

(declare-fun c!74785 () Bool)

(assert (=> b!650505 (= c!74785 (= lt!302241 Undefined!6925))))

(declare-fun lt!302254 () (_ BitVec 64))

(assert (=> b!650505 (= lt!302241 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302254 lt!302253 mask!3053))))

(declare-fun e!373201 () Bool)

(assert (=> b!650505 e!373201))

(declare-fun res!421670 () Bool)

(assert (=> b!650505 (=> (not res!421670) (not e!373201))))

(declare-fun lt!302244 () (_ BitVec 32))

(declare-fun lt!302242 () SeekEntryResult!6925)

(assert (=> b!650505 (= res!421670 (= lt!302242 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302244 vacantSpotIndex!68 lt!302254 lt!302253 mask!3053)))))

(assert (=> b!650505 (= lt!302242 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302244 vacantSpotIndex!68 (select (arr!18485 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650505 (= lt!302254 (select (store (arr!18485 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!302251 () Unit!22176)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22176)

(assert (=> b!650505 (= lt!302251 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302244 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650505 (= lt!302244 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650506 () Bool)

(declare-fun Unit!22179 () Unit!22176)

(assert (=> b!650506 (= e!373205 Unit!22179)))

(declare-fun lt!302240 () Unit!22176)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38561 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22176)

(assert (=> b!650506 (= lt!302240 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302253 (select (arr!18485 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650506 (arrayContainsKey!0 lt!302253 (select (arr!18485 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302238 () Unit!22176)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38561 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12526) Unit!22176)

(assert (=> b!650506 (= lt!302238 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12523))))

(assert (=> b!650506 (arrayNoDuplicates!0 lt!302253 #b00000000000000000000000000000000 Nil!12523)))

(declare-fun lt!302249 () Unit!22176)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38561 (_ BitVec 32) (_ BitVec 32)) Unit!22176)

(assert (=> b!650506 (= lt!302249 (lemmaNoDuplicateFromThenFromBigger!0 lt!302253 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650506 (arrayNoDuplicates!0 lt!302253 j!136 Nil!12523)))

(declare-fun lt!302252 () Unit!22176)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38561 (_ BitVec 64) (_ BitVec 32) List!12526) Unit!22176)

(assert (=> b!650506 (= lt!302252 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302253 (select (arr!18485 a!2986) j!136) j!136 Nil!12523))))

(assert (=> b!650506 false))

(declare-fun b!650507 () Bool)

(assert (=> b!650507 (= e!373197 e!373195)))

(declare-fun res!421678 () Bool)

(assert (=> b!650507 (=> res!421678 e!373195)))

(declare-fun lt!302243 () (_ BitVec 64))

(assert (=> b!650507 (= res!421678 (or (not (= (select (arr!18485 a!2986) j!136) lt!302254)) (not (= (select (arr!18485 a!2986) j!136) lt!302243))))))

(declare-fun e!373199 () Bool)

(assert (=> b!650507 e!373199))

(declare-fun res!421664 () Bool)

(assert (=> b!650507 (=> (not res!421664) (not e!373199))))

(assert (=> b!650507 (= res!421664 (= lt!302243 (select (arr!18485 a!2986) j!136)))))

(assert (=> b!650507 (= lt!302243 (select (store (arr!18485 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!650508 () Bool)

(declare-fun res!421665 () Bool)

(assert (=> b!650508 (=> (not res!421665) (not e!373194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38561 (_ BitVec 32)) Bool)

(assert (=> b!650508 (= res!421665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650509 () Bool)

(assert (=> b!650509 (= e!373199 e!373198)))

(declare-fun res!421675 () Bool)

(assert (=> b!650509 (=> res!421675 e!373198)))

(assert (=> b!650509 (= res!421675 (or (not (= (select (arr!18485 a!2986) j!136) lt!302254)) (not (= (select (arr!18485 a!2986) j!136) lt!302243)) (bvsge j!136 index!984)))))

(declare-fun b!650510 () Bool)

(assert (=> b!650510 (= e!373201 (= lt!302239 lt!302242))))

(declare-fun b!650511 () Bool)

(declare-fun Unit!22180 () Unit!22176)

(assert (=> b!650511 (= e!373202 Unit!22180)))

(declare-fun b!650512 () Bool)

(assert (=> b!650512 (= e!373200 true)))

(assert (=> b!650512 (arrayNoDuplicates!0 lt!302253 #b00000000000000000000000000000000 Nil!12523)))

(declare-fun lt!302245 () Unit!22176)

(assert (=> b!650512 (= lt!302245 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12523))))

(assert (=> b!650512 (arrayContainsKey!0 lt!302253 (select (arr!18485 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302247 () Unit!22176)

(assert (=> b!650512 (= lt!302247 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302253 (select (arr!18485 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!650512 e!373203))

(declare-fun res!421667 () Bool)

(assert (=> b!650512 (=> (not res!421667) (not e!373203))))

(assert (=> b!650512 (= res!421667 (arrayContainsKey!0 lt!302253 (select (arr!18485 a!2986) j!136) j!136))))

(declare-fun res!421663 () Bool)

(assert (=> start!58980 (=> (not res!421663) (not e!373193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58980 (= res!421663 (validMask!0 mask!3053))))

(assert (=> start!58980 e!373193))

(assert (=> start!58980 true))

(declare-fun array_inv!14281 (array!38561) Bool)

(assert (=> start!58980 (array_inv!14281 a!2986)))

(declare-fun b!650513 () Bool)

(declare-fun res!421676 () Bool)

(assert (=> b!650513 (=> (not res!421676) (not e!373193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650513 (= res!421676 (validKeyInArray!0 (select (arr!18485 a!2986) j!136)))))

(declare-fun b!650514 () Bool)

(declare-fun res!421662 () Bool)

(assert (=> b!650514 (=> (not res!421662) (not e!373193))))

(assert (=> b!650514 (= res!421662 (validKeyInArray!0 k!1786))))

(declare-fun b!650515 () Bool)

(declare-fun res!421671 () Bool)

(assert (=> b!650515 (=> (not res!421671) (not e!373194))))

(assert (=> b!650515 (= res!421671 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18485 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650516 () Bool)

(declare-fun res!421673 () Bool)

(assert (=> b!650516 (=> (not res!421673) (not e!373193))))

(assert (=> b!650516 (= res!421673 (and (= (size!18849 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18849 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18849 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650517 () Bool)

(assert (=> b!650517 (= e!373192 (arrayContainsKey!0 lt!302253 (select (arr!18485 a!2986) j!136) index!984))))

(declare-fun b!650518 () Bool)

(declare-fun res!421672 () Bool)

(assert (=> b!650518 (=> (not res!421672) (not e!373193))))

(assert (=> b!650518 (= res!421672 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650519 () Bool)

(declare-fun Unit!22181 () Unit!22176)

(assert (=> b!650519 (= e!373205 Unit!22181)))

(assert (= (and start!58980 res!421663) b!650516))

(assert (= (and b!650516 res!421673) b!650513))

(assert (= (and b!650513 res!421676) b!650514))

(assert (= (and b!650514 res!421662) b!650518))

(assert (= (and b!650518 res!421672) b!650501))

(assert (= (and b!650501 res!421679) b!650508))

(assert (= (and b!650508 res!421665) b!650500))

(assert (= (and b!650500 res!421669) b!650515))

(assert (= (and b!650515 res!421671) b!650498))

(assert (= (and b!650498 res!421661) b!650504))

(assert (= (and b!650504 res!421666) b!650505))

(assert (= (and b!650505 res!421670) b!650510))

(assert (= (and b!650505 c!74785) b!650497))

(assert (= (and b!650505 (not c!74785)) b!650511))

(assert (= (and b!650505 (not res!421674)) b!650507))

(assert (= (and b!650507 res!421664) b!650509))

(assert (= (and b!650509 (not res!421675)) b!650499))

(assert (= (and b!650499 res!421668) b!650517))

(assert (= (and b!650507 (not res!421678)) b!650503))

(assert (= (and b!650503 c!74786) b!650506))

(assert (= (and b!650503 (not c!74786)) b!650519))

(assert (= (and b!650503 (not res!421677)) b!650512))

(assert (= (and b!650512 res!421667) b!650502))

(declare-fun m!623695 () Bool)

(assert (=> b!650505 m!623695))

(declare-fun m!623697 () Bool)

(assert (=> b!650505 m!623697))

(declare-fun m!623699 () Bool)

(assert (=> b!650505 m!623699))

(declare-fun m!623701 () Bool)

(assert (=> b!650505 m!623701))

(declare-fun m!623703 () Bool)

(assert (=> b!650505 m!623703))

(assert (=> b!650505 m!623697))

(declare-fun m!623705 () Bool)

(assert (=> b!650505 m!623705))

(declare-fun m!623707 () Bool)

(assert (=> b!650505 m!623707))

(declare-fun m!623709 () Bool)

(assert (=> b!650505 m!623709))

(assert (=> b!650499 m!623697))

(assert (=> b!650499 m!623697))

(declare-fun m!623711 () Bool)

(assert (=> b!650499 m!623711))

(declare-fun m!623713 () Bool)

(assert (=> b!650501 m!623713))

(assert (=> b!650502 m!623697))

(assert (=> b!650502 m!623697))

(declare-fun m!623715 () Bool)

(assert (=> b!650502 m!623715))

(assert (=> b!650512 m!623697))

(assert (=> b!650512 m!623697))

(declare-fun m!623717 () Bool)

(assert (=> b!650512 m!623717))

(declare-fun m!623719 () Bool)

(assert (=> b!650512 m!623719))

(declare-fun m!623721 () Bool)

(assert (=> b!650512 m!623721))

(assert (=> b!650512 m!623697))

(assert (=> b!650512 m!623711))

(assert (=> b!650512 m!623697))

(declare-fun m!623723 () Bool)

(assert (=> b!650512 m!623723))

(declare-fun m!623725 () Bool)

(assert (=> start!58980 m!623725))

(declare-fun m!623727 () Bool)

(assert (=> start!58980 m!623727))

(assert (=> b!650498 m!623701))

(declare-fun m!623729 () Bool)

(assert (=> b!650498 m!623729))

(declare-fun m!623731 () Bool)

(assert (=> b!650500 m!623731))

(assert (=> b!650513 m!623697))

(assert (=> b!650513 m!623697))

(declare-fun m!623733 () Bool)

(assert (=> b!650513 m!623733))

(declare-fun m!623735 () Bool)

(assert (=> b!650504 m!623735))

(assert (=> b!650504 m!623697))

(assert (=> b!650504 m!623697))

(declare-fun m!623737 () Bool)

(assert (=> b!650504 m!623737))

(assert (=> b!650507 m!623697))

(assert (=> b!650507 m!623701))

(declare-fun m!623739 () Bool)

(assert (=> b!650507 m!623739))

(assert (=> b!650509 m!623697))

(declare-fun m!623741 () Bool)

(assert (=> b!650506 m!623741))

(assert (=> b!650506 m!623697))

(declare-fun m!623743 () Bool)

(assert (=> b!650506 m!623743))

(assert (=> b!650506 m!623697))

(declare-fun m!623745 () Bool)

(assert (=> b!650506 m!623745))

(assert (=> b!650506 m!623719))

(assert (=> b!650506 m!623721))

(assert (=> b!650506 m!623697))

(declare-fun m!623747 () Bool)

(assert (=> b!650506 m!623747))

(assert (=> b!650506 m!623697))

(declare-fun m!623749 () Bool)

(assert (=> b!650506 m!623749))

(declare-fun m!623751 () Bool)

(assert (=> b!650508 m!623751))

(assert (=> b!650517 m!623697))

(assert (=> b!650517 m!623697))

(assert (=> b!650517 m!623715))

(declare-fun m!623753 () Bool)

(assert (=> b!650515 m!623753))

(declare-fun m!623755 () Bool)

(assert (=> b!650514 m!623755))

(declare-fun m!623757 () Bool)

(assert (=> b!650518 m!623757))

(push 1)

