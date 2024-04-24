; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59616 () Bool)

(assert start!59616)

(declare-fun res!426356 () Bool)

(declare-fun e!377735 () Bool)

(assert (=> start!59616 (=> (not res!426356) (not e!377735))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59616 (= res!426356 (validMask!0 mask!3053))))

(assert (=> start!59616 e!377735))

(assert (=> start!59616 true))

(declare-datatypes ((array!38712 0))(
  ( (array!38713 (arr!18550 (Array (_ BitVec 32) (_ BitVec 64))) (size!18914 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38712)

(declare-fun array_inv!14409 (array!38712) Bool)

(assert (=> start!59616 (array_inv!14409 a!2986)))

(declare-fun b!657553 () Bool)

(declare-fun e!377737 () Bool)

(declare-datatypes ((SeekEntryResult!6946 0))(
  ( (MissingZero!6946 (index!30149 (_ BitVec 32))) (Found!6946 (index!30150 (_ BitVec 32))) (Intermediate!6946 (undefined!7758 Bool) (index!30151 (_ BitVec 32)) (x!59096 (_ BitVec 32))) (Undefined!6946) (MissingVacant!6946 (index!30152 (_ BitVec 32))) )
))
(declare-fun lt!307082 () SeekEntryResult!6946)

(declare-fun lt!307073 () SeekEntryResult!6946)

(assert (=> b!657553 (= e!377737 (= lt!307082 lt!307073))))

(declare-fun b!657554 () Bool)

(declare-datatypes ((Unit!22683 0))(
  ( (Unit!22684) )
))
(declare-fun e!377745 () Unit!22683)

(declare-fun Unit!22685 () Unit!22683)

(assert (=> b!657554 (= e!377745 Unit!22685)))

(declare-fun b!657555 () Bool)

(declare-fun e!377748 () Bool)

(declare-fun e!377746 () Bool)

(assert (=> b!657555 (= e!377748 e!377746)))

(declare-fun res!426359 () Bool)

(assert (=> b!657555 (=> (not res!426359) (not e!377746))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!657555 (= res!426359 (and (= lt!307082 (Found!6946 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18550 a!2986) index!984) (select (arr!18550 a!2986) j!136))) (not (= (select (arr!18550 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38712 (_ BitVec 32)) SeekEntryResult!6946)

(assert (=> b!657555 (= lt!307082 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18550 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657556 () Bool)

(declare-fun lt!307087 () array!38712)

(declare-fun e!377747 () Bool)

(declare-fun arrayContainsKey!0 (array!38712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657556 (= e!377747 (arrayContainsKey!0 lt!307087 (select (arr!18550 a!2986) j!136) index!984))))

(declare-fun b!657557 () Bool)

(declare-fun res!426370 () Bool)

(assert (=> b!657557 (=> (not res!426370) (not e!377735))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657557 (= res!426370 (validKeyInArray!0 k0!1786))))

(declare-fun b!657558 () Bool)

(declare-fun e!377744 () Bool)

(assert (=> b!657558 (= e!377744 true)))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!657558 (= (select (store (arr!18550 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657559 () Bool)

(declare-fun res!426357 () Bool)

(assert (=> b!657559 (=> (not res!426357) (not e!377735))))

(assert (=> b!657559 (= res!426357 (and (= (size!18914 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18914 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18914 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657560 () Bool)

(declare-fun e!377739 () Unit!22683)

(declare-fun Unit!22686 () Unit!22683)

(assert (=> b!657560 (= e!377739 Unit!22686)))

(declare-fun b!657561 () Bool)

(declare-fun res!426368 () Bool)

(assert (=> b!657561 (= res!426368 (arrayContainsKey!0 lt!307087 (select (arr!18550 a!2986) j!136) j!136))))

(declare-fun e!377734 () Bool)

(assert (=> b!657561 (=> (not res!426368) (not e!377734))))

(declare-fun e!377742 () Bool)

(assert (=> b!657561 (= e!377742 e!377734)))

(declare-fun b!657562 () Bool)

(assert (=> b!657562 (= e!377746 (not e!377744))))

(declare-fun res!426354 () Bool)

(assert (=> b!657562 (=> res!426354 e!377744)))

(declare-fun lt!307088 () SeekEntryResult!6946)

(assert (=> b!657562 (= res!426354 (not (= lt!307088 (MissingVacant!6946 vacantSpotIndex!68))))))

(declare-fun lt!307085 () Unit!22683)

(assert (=> b!657562 (= lt!307085 e!377739)))

(declare-fun c!75971 () Bool)

(assert (=> b!657562 (= c!75971 (= lt!307088 (Found!6946 index!984)))))

(declare-fun lt!307079 () Unit!22683)

(declare-fun e!377743 () Unit!22683)

(assert (=> b!657562 (= lt!307079 e!377743)))

(declare-fun c!75970 () Bool)

(assert (=> b!657562 (= c!75970 (= lt!307088 Undefined!6946))))

(declare-fun lt!307071 () (_ BitVec 64))

(assert (=> b!657562 (= lt!307088 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307071 lt!307087 mask!3053))))

(assert (=> b!657562 e!377737))

(declare-fun res!426362 () Bool)

(assert (=> b!657562 (=> (not res!426362) (not e!377737))))

(declare-fun lt!307080 () (_ BitVec 32))

(assert (=> b!657562 (= res!426362 (= lt!307073 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307080 vacantSpotIndex!68 lt!307071 lt!307087 mask!3053)))))

(assert (=> b!657562 (= lt!307073 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307080 vacantSpotIndex!68 (select (arr!18550 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657562 (= lt!307071 (select (store (arr!18550 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307074 () Unit!22683)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38712 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22683)

(assert (=> b!657562 (= lt!307074 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307080 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657562 (= lt!307080 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!657563 () Bool)

(declare-fun res!426358 () Bool)

(assert (=> b!657563 (=> (not res!426358) (not e!377735))))

(assert (=> b!657563 (= res!426358 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657564 () Bool)

(declare-fun Unit!22687 () Unit!22683)

(assert (=> b!657564 (= e!377743 Unit!22687)))

(assert (=> b!657564 false))

(declare-fun b!657565 () Bool)

(declare-fun e!377736 () Bool)

(assert (=> b!657565 (= e!377736 e!377748)))

(declare-fun res!426361 () Bool)

(assert (=> b!657565 (=> (not res!426361) (not e!377748))))

(assert (=> b!657565 (= res!426361 (= (select (store (arr!18550 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657565 (= lt!307087 (array!38713 (store (arr!18550 a!2986) i!1108 k0!1786) (size!18914 a!2986)))))

(declare-fun b!657566 () Bool)

(declare-fun res!426366 () Bool)

(assert (=> b!657566 (=> (not res!426366) (not e!377736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38712 (_ BitVec 32)) Bool)

(assert (=> b!657566 (= res!426366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657567 () Bool)

(declare-fun res!426365 () Bool)

(assert (=> b!657567 (=> (not res!426365) (not e!377736))))

(declare-datatypes ((List!12498 0))(
  ( (Nil!12495) (Cons!12494 (h!13542 (_ BitVec 64)) (t!18718 List!12498)) )
))
(declare-fun arrayNoDuplicates!0 (array!38712 (_ BitVec 32) List!12498) Bool)

(assert (=> b!657567 (= res!426365 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12495))))

(declare-fun b!657568 () Bool)

(assert (=> b!657568 (= e!377734 (arrayContainsKey!0 lt!307087 (select (arr!18550 a!2986) j!136) index!984))))

(declare-fun b!657569 () Bool)

(declare-fun Unit!22688 () Unit!22683)

(assert (=> b!657569 (= e!377739 Unit!22688)))

(declare-fun res!426364 () Bool)

(assert (=> b!657569 (= res!426364 (= (select (store (arr!18550 a!2986) i!1108 k0!1786) index!984) (select (arr!18550 a!2986) j!136)))))

(declare-fun e!377738 () Bool)

(assert (=> b!657569 (=> (not res!426364) (not e!377738))))

(assert (=> b!657569 e!377738))

(declare-fun c!75968 () Bool)

(assert (=> b!657569 (= c!75968 (bvslt j!136 index!984))))

(declare-fun lt!307076 () Unit!22683)

(assert (=> b!657569 (= lt!307076 e!377745)))

(declare-fun c!75969 () Bool)

(assert (=> b!657569 (= c!75969 (bvslt index!984 j!136))))

(declare-fun lt!307075 () Unit!22683)

(declare-fun e!377740 () Unit!22683)

(assert (=> b!657569 (= lt!307075 e!377740)))

(assert (=> b!657569 false))

(declare-fun b!657570 () Bool)

(declare-fun res!426360 () Bool)

(assert (=> b!657570 (=> (not res!426360) (not e!377736))))

(assert (=> b!657570 (= res!426360 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18550 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657571 () Bool)

(assert (=> b!657571 (= e!377735 e!377736)))

(declare-fun res!426369 () Bool)

(assert (=> b!657571 (=> (not res!426369) (not e!377736))))

(declare-fun lt!307072 () SeekEntryResult!6946)

(assert (=> b!657571 (= res!426369 (or (= lt!307072 (MissingZero!6946 i!1108)) (= lt!307072 (MissingVacant!6946 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38712 (_ BitVec 32)) SeekEntryResult!6946)

(assert (=> b!657571 (= lt!307072 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!657572 () Bool)

(declare-fun Unit!22689 () Unit!22683)

(assert (=> b!657572 (= e!377743 Unit!22689)))

(declare-fun b!657573 () Bool)

(declare-fun res!426363 () Bool)

(assert (=> b!657573 (=> (not res!426363) (not e!377735))))

(assert (=> b!657573 (= res!426363 (validKeyInArray!0 (select (arr!18550 a!2986) j!136)))))

(declare-fun b!657574 () Bool)

(declare-fun res!426355 () Bool)

(assert (=> b!657574 (= res!426355 (bvsge j!136 index!984))))

(assert (=> b!657574 (=> res!426355 e!377742)))

(assert (=> b!657574 (= e!377738 e!377742)))

(declare-fun b!657575 () Bool)

(assert (=> b!657575 false))

(declare-fun lt!307089 () Unit!22683)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38712 (_ BitVec 64) (_ BitVec 32) List!12498) Unit!22683)

(assert (=> b!657575 (= lt!307089 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307087 (select (arr!18550 a!2986) j!136) index!984 Nil!12495))))

(assert (=> b!657575 (arrayNoDuplicates!0 lt!307087 index!984 Nil!12495)))

(declare-fun lt!307083 () Unit!22683)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38712 (_ BitVec 32) (_ BitVec 32)) Unit!22683)

(assert (=> b!657575 (= lt!307083 (lemmaNoDuplicateFromThenFromBigger!0 lt!307087 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657575 (arrayNoDuplicates!0 lt!307087 #b00000000000000000000000000000000 Nil!12495)))

(declare-fun lt!307086 () Unit!22683)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38712 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12498) Unit!22683)

(assert (=> b!657575 (= lt!307086 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12495))))

(assert (=> b!657575 (arrayContainsKey!0 lt!307087 (select (arr!18550 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307077 () Unit!22683)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38712 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22683)

(assert (=> b!657575 (= lt!307077 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307087 (select (arr!18550 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!657575 e!377747))

(declare-fun res!426367 () Bool)

(assert (=> b!657575 (=> (not res!426367) (not e!377747))))

(assert (=> b!657575 (= res!426367 (arrayContainsKey!0 lt!307087 (select (arr!18550 a!2986) j!136) j!136))))

(declare-fun Unit!22690 () Unit!22683)

(assert (=> b!657575 (= e!377740 Unit!22690)))

(declare-fun b!657576 () Bool)

(assert (=> b!657576 false))

(declare-fun lt!307078 () Unit!22683)

(assert (=> b!657576 (= lt!307078 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307087 (select (arr!18550 a!2986) j!136) j!136 Nil!12495))))

(assert (=> b!657576 (arrayNoDuplicates!0 lt!307087 j!136 Nil!12495)))

(declare-fun lt!307090 () Unit!22683)

(assert (=> b!657576 (= lt!307090 (lemmaNoDuplicateFromThenFromBigger!0 lt!307087 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657576 (arrayNoDuplicates!0 lt!307087 #b00000000000000000000000000000000 Nil!12495)))

(declare-fun lt!307081 () Unit!22683)

(assert (=> b!657576 (= lt!307081 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12495))))

(assert (=> b!657576 (arrayContainsKey!0 lt!307087 (select (arr!18550 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307084 () Unit!22683)

(assert (=> b!657576 (= lt!307084 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307087 (select (arr!18550 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22691 () Unit!22683)

(assert (=> b!657576 (= e!377745 Unit!22691)))

(declare-fun b!657577 () Bool)

(declare-fun Unit!22692 () Unit!22683)

(assert (=> b!657577 (= e!377740 Unit!22692)))

(assert (= (and start!59616 res!426356) b!657559))

(assert (= (and b!657559 res!426357) b!657573))

(assert (= (and b!657573 res!426363) b!657557))

(assert (= (and b!657557 res!426370) b!657563))

(assert (= (and b!657563 res!426358) b!657571))

(assert (= (and b!657571 res!426369) b!657566))

(assert (= (and b!657566 res!426366) b!657567))

(assert (= (and b!657567 res!426365) b!657570))

(assert (= (and b!657570 res!426360) b!657565))

(assert (= (and b!657565 res!426361) b!657555))

(assert (= (and b!657555 res!426359) b!657562))

(assert (= (and b!657562 res!426362) b!657553))

(assert (= (and b!657562 c!75970) b!657564))

(assert (= (and b!657562 (not c!75970)) b!657572))

(assert (= (and b!657562 c!75971) b!657569))

(assert (= (and b!657562 (not c!75971)) b!657560))

(assert (= (and b!657569 res!426364) b!657574))

(assert (= (and b!657574 (not res!426355)) b!657561))

(assert (= (and b!657561 res!426368) b!657568))

(assert (= (and b!657569 c!75968) b!657576))

(assert (= (and b!657569 (not c!75968)) b!657554))

(assert (= (and b!657569 c!75969) b!657575))

(assert (= (and b!657569 (not c!75969)) b!657577))

(assert (= (and b!657575 res!426367) b!657556))

(assert (= (and b!657562 (not res!426354)) b!657558))

(declare-fun m!631069 () Bool)

(assert (=> b!657569 m!631069))

(declare-fun m!631071 () Bool)

(assert (=> b!657569 m!631071))

(declare-fun m!631073 () Bool)

(assert (=> b!657569 m!631073))

(declare-fun m!631075 () Bool)

(assert (=> b!657575 m!631075))

(assert (=> b!657575 m!631073))

(assert (=> b!657575 m!631073))

(declare-fun m!631077 () Bool)

(assert (=> b!657575 m!631077))

(assert (=> b!657575 m!631073))

(declare-fun m!631079 () Bool)

(assert (=> b!657575 m!631079))

(declare-fun m!631081 () Bool)

(assert (=> b!657575 m!631081))

(declare-fun m!631083 () Bool)

(assert (=> b!657575 m!631083))

(assert (=> b!657575 m!631073))

(declare-fun m!631085 () Bool)

(assert (=> b!657575 m!631085))

(assert (=> b!657575 m!631073))

(declare-fun m!631087 () Bool)

(assert (=> b!657575 m!631087))

(declare-fun m!631089 () Bool)

(assert (=> b!657575 m!631089))

(assert (=> b!657573 m!631073))

(assert (=> b!657573 m!631073))

(declare-fun m!631091 () Bool)

(assert (=> b!657573 m!631091))

(declare-fun m!631093 () Bool)

(assert (=> b!657555 m!631093))

(assert (=> b!657555 m!631073))

(assert (=> b!657555 m!631073))

(declare-fun m!631095 () Bool)

(assert (=> b!657555 m!631095))

(declare-fun m!631097 () Bool)

(assert (=> b!657576 m!631097))

(assert (=> b!657576 m!631089))

(assert (=> b!657576 m!631073))

(assert (=> b!657576 m!631073))

(declare-fun m!631099 () Bool)

(assert (=> b!657576 m!631099))

(assert (=> b!657576 m!631073))

(declare-fun m!631101 () Bool)

(assert (=> b!657576 m!631101))

(declare-fun m!631103 () Bool)

(assert (=> b!657576 m!631103))

(assert (=> b!657576 m!631073))

(declare-fun m!631105 () Bool)

(assert (=> b!657576 m!631105))

(assert (=> b!657576 m!631081))

(declare-fun m!631107 () Bool)

(assert (=> b!657570 m!631107))

(declare-fun m!631109 () Bool)

(assert (=> b!657563 m!631109))

(declare-fun m!631111 () Bool)

(assert (=> b!657571 m!631111))

(assert (=> b!657561 m!631073))

(assert (=> b!657561 m!631073))

(assert (=> b!657561 m!631087))

(declare-fun m!631113 () Bool)

(assert (=> b!657557 m!631113))

(declare-fun m!631115 () Bool)

(assert (=> b!657562 m!631115))

(declare-fun m!631117 () Bool)

(assert (=> b!657562 m!631117))

(assert (=> b!657562 m!631073))

(assert (=> b!657562 m!631069))

(declare-fun m!631119 () Bool)

(assert (=> b!657562 m!631119))

(assert (=> b!657562 m!631073))

(declare-fun m!631121 () Bool)

(assert (=> b!657562 m!631121))

(declare-fun m!631123 () Bool)

(assert (=> b!657562 m!631123))

(declare-fun m!631125 () Bool)

(assert (=> b!657562 m!631125))

(assert (=> b!657565 m!631069))

(declare-fun m!631127 () Bool)

(assert (=> b!657565 m!631127))

(declare-fun m!631129 () Bool)

(assert (=> start!59616 m!631129))

(declare-fun m!631131 () Bool)

(assert (=> start!59616 m!631131))

(assert (=> b!657568 m!631073))

(assert (=> b!657568 m!631073))

(declare-fun m!631133 () Bool)

(assert (=> b!657568 m!631133))

(assert (=> b!657558 m!631069))

(assert (=> b!657558 m!631071))

(declare-fun m!631135 () Bool)

(assert (=> b!657566 m!631135))

(declare-fun m!631137 () Bool)

(assert (=> b!657567 m!631137))

(assert (=> b!657556 m!631073))

(assert (=> b!657556 m!631073))

(assert (=> b!657556 m!631133))

(check-sat (not b!657555) (not b!657573) (not b!657557) (not b!657563) (not b!657567) (not start!59616) (not b!657566) (not b!657556) (not b!657562) (not b!657561) (not b!657575) (not b!657576) (not b!657571) (not b!657568))
(check-sat)
