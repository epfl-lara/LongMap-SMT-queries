; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55974 () Bool)

(assert start!55974)

(declare-fun b!614398 () Bool)

(declare-fun res!395660 () Bool)

(declare-fun e!352256 () Bool)

(assert (=> b!614398 (=> (not res!395660) (not e!352256))))

(declare-datatypes ((array!37444 0))(
  ( (array!37445 (arr!17968 (Array (_ BitVec 32) (_ BitVec 64))) (size!18332 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37444)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!614398 (= res!395660 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!614399 () Bool)

(declare-fun res!395665 () Bool)

(assert (=> b!614399 (=> (not res!395665) (not e!352256))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!614399 (= res!395665 (and (= (size!18332 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18332 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18332 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!614400 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!281851 () array!37444)

(declare-fun e!352263 () Bool)

(assert (=> b!614400 (= e!352263 (arrayContainsKey!0 lt!281851 (select (arr!17968 a!2986) j!136) index!984))))

(declare-fun b!614401 () Bool)

(declare-fun e!352257 () Bool)

(declare-fun e!352262 () Bool)

(assert (=> b!614401 (= e!352257 e!352262)))

(declare-fun res!395681 () Bool)

(assert (=> b!614401 (=> (not res!395681) (not e!352262))))

(declare-datatypes ((SeekEntryResult!6408 0))(
  ( (MissingZero!6408 (index!27916 (_ BitVec 32))) (Found!6408 (index!27917 (_ BitVec 32))) (Intermediate!6408 (undefined!7220 Bool) (index!27918 (_ BitVec 32)) (x!56720 (_ BitVec 32))) (Undefined!6408) (MissingVacant!6408 (index!27919 (_ BitVec 32))) )
))
(declare-fun lt!281858 () SeekEntryResult!6408)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!614401 (= res!395681 (and (= lt!281858 (Found!6408 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17968 a!2986) index!984) (select (arr!17968 a!2986) j!136))) (not (= (select (arr!17968 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37444 (_ BitVec 32)) SeekEntryResult!6408)

(assert (=> b!614401 (= lt!281858 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17968 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!614402 () Bool)

(declare-fun res!395677 () Bool)

(declare-fun e!352253 () Bool)

(assert (=> b!614402 (=> res!395677 e!352253)))

(declare-datatypes ((List!12009 0))(
  ( (Nil!12006) (Cons!12005 (h!13050 (_ BitVec 64)) (t!18237 List!12009)) )
))
(declare-fun noDuplicate!370 (List!12009) Bool)

(assert (=> b!614402 (= res!395677 (not (noDuplicate!370 Nil!12006)))))

(declare-fun b!614403 () Bool)

(declare-datatypes ((Unit!19828 0))(
  ( (Unit!19829) )
))
(declare-fun e!352248 () Unit!19828)

(declare-fun Unit!19830 () Unit!19828)

(assert (=> b!614403 (= e!352248 Unit!19830)))

(declare-fun b!614404 () Bool)

(declare-fun e!352259 () Bool)

(assert (=> b!614404 (= e!352259 e!352253)))

(declare-fun res!395664 () Bool)

(assert (=> b!614404 (=> res!395664 e!352253)))

(assert (=> b!614404 (= res!395664 (or (bvsge (size!18332 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18332 a!2986)) (bvsge index!984 (size!18332 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37444 (_ BitVec 32) List!12009) Bool)

(assert (=> b!614404 (arrayNoDuplicates!0 lt!281851 index!984 Nil!12006)))

(declare-fun lt!281860 () Unit!19828)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37444 (_ BitVec 32) (_ BitVec 32)) Unit!19828)

(assert (=> b!614404 (= lt!281860 (lemmaNoDuplicateFromThenFromBigger!0 lt!281851 #b00000000000000000000000000000000 index!984))))

(assert (=> b!614404 (arrayNoDuplicates!0 lt!281851 #b00000000000000000000000000000000 Nil!12006)))

(declare-fun lt!281869 () Unit!19828)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37444 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12009) Unit!19828)

(assert (=> b!614404 (= lt!281869 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12006))))

(assert (=> b!614404 (arrayContainsKey!0 lt!281851 (select (arr!17968 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!281861 () Unit!19828)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37444 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19828)

(assert (=> b!614404 (= lt!281861 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281851 (select (arr!17968 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!614404 e!352263))

(declare-fun res!395661 () Bool)

(assert (=> b!614404 (=> (not res!395661) (not e!352263))))

(assert (=> b!614404 (= res!395661 (arrayContainsKey!0 lt!281851 (select (arr!17968 a!2986) j!136) j!136))))

(declare-fun b!614405 () Bool)

(declare-fun e!352249 () Bool)

(declare-fun lt!281855 () SeekEntryResult!6408)

(assert (=> b!614405 (= e!352249 (= lt!281858 lt!281855))))

(declare-fun b!614406 () Bool)

(declare-fun e!352258 () Bool)

(assert (=> b!614406 (= e!352258 e!352257)))

(declare-fun res!395670 () Bool)

(assert (=> b!614406 (=> (not res!395670) (not e!352257))))

(assert (=> b!614406 (= res!395670 (= (select (store (arr!17968 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!614406 (= lt!281851 (array!37445 (store (arr!17968 a!2986) i!1108 k0!1786) (size!18332 a!2986)))))

(declare-fun b!614407 () Bool)

(assert (=> b!614407 (= e!352256 e!352258)))

(declare-fun res!395678 () Bool)

(assert (=> b!614407 (=> (not res!395678) (not e!352258))))

(declare-fun lt!281866 () SeekEntryResult!6408)

(assert (=> b!614407 (= res!395678 (or (= lt!281866 (MissingZero!6408 i!1108)) (= lt!281866 (MissingVacant!6408 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37444 (_ BitVec 32)) SeekEntryResult!6408)

(assert (=> b!614407 (= lt!281866 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!614408 () Bool)

(declare-fun res!395667 () Bool)

(assert (=> b!614408 (=> res!395667 e!352253)))

(declare-fun contains!3067 (List!12009 (_ BitVec 64)) Bool)

(assert (=> b!614408 (= res!395667 (contains!3067 Nil!12006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!614409 () Bool)

(declare-fun e!352261 () Bool)

(assert (=> b!614409 (= e!352261 e!352259)))

(declare-fun res!395668 () Bool)

(assert (=> b!614409 (=> res!395668 e!352259)))

(assert (=> b!614409 (= res!395668 (bvsge index!984 j!136))))

(declare-fun lt!281852 () Unit!19828)

(declare-fun e!352254 () Unit!19828)

(assert (=> b!614409 (= lt!281852 e!352254)))

(declare-fun c!69736 () Bool)

(assert (=> b!614409 (= c!69736 (bvslt j!136 index!984))))

(declare-fun b!614410 () Bool)

(declare-fun e!352260 () Bool)

(assert (=> b!614410 (= e!352262 (not e!352260))))

(declare-fun res!395679 () Bool)

(assert (=> b!614410 (=> res!395679 e!352260)))

(declare-fun lt!281854 () SeekEntryResult!6408)

(assert (=> b!614410 (= res!395679 (not (= lt!281854 (Found!6408 index!984))))))

(declare-fun lt!281863 () Unit!19828)

(assert (=> b!614410 (= lt!281863 e!352248)))

(declare-fun c!69737 () Bool)

(assert (=> b!614410 (= c!69737 (= lt!281854 Undefined!6408))))

(declare-fun lt!281859 () (_ BitVec 64))

(assert (=> b!614410 (= lt!281854 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!281859 lt!281851 mask!3053))))

(assert (=> b!614410 e!352249))

(declare-fun res!395669 () Bool)

(assert (=> b!614410 (=> (not res!395669) (not e!352249))))

(declare-fun lt!281856 () (_ BitVec 32))

(assert (=> b!614410 (= res!395669 (= lt!281855 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281856 vacantSpotIndex!68 lt!281859 lt!281851 mask!3053)))))

(assert (=> b!614410 (= lt!281855 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281856 vacantSpotIndex!68 (select (arr!17968 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!614410 (= lt!281859 (select (store (arr!17968 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!281867 () Unit!19828)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37444 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19828)

(assert (=> b!614410 (= lt!281867 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!281856 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!614410 (= lt!281856 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!614411 () Bool)

(declare-fun res!395674 () Bool)

(assert (=> b!614411 (=> (not res!395674) (not e!352256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!614411 (= res!395674 (validKeyInArray!0 k0!1786))))

(declare-fun res!395680 () Bool)

(assert (=> start!55974 (=> (not res!395680) (not e!352256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55974 (= res!395680 (validMask!0 mask!3053))))

(assert (=> start!55974 e!352256))

(assert (=> start!55974 true))

(declare-fun array_inv!13764 (array!37444) Bool)

(assert (=> start!55974 (array_inv!13764 a!2986)))

(declare-fun b!614412 () Bool)

(declare-fun res!395662 () Bool)

(assert (=> b!614412 (=> (not res!395662) (not e!352258))))

(assert (=> b!614412 (= res!395662 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12006))))

(declare-fun b!614413 () Bool)

(assert (=> b!614413 (= e!352253 true)))

(declare-fun lt!281862 () Bool)

(assert (=> b!614413 (= lt!281862 (contains!3067 Nil!12006 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!614414 () Bool)

(declare-fun res!395673 () Bool)

(assert (=> b!614414 (=> (not res!395673) (not e!352258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37444 (_ BitVec 32)) Bool)

(assert (=> b!614414 (= res!395673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!614415 () Bool)

(declare-fun e!352252 () Bool)

(declare-fun e!352255 () Bool)

(assert (=> b!614415 (= e!352252 e!352255)))

(declare-fun res!395672 () Bool)

(assert (=> b!614415 (=> (not res!395672) (not e!352255))))

(assert (=> b!614415 (= res!395672 (arrayContainsKey!0 lt!281851 (select (arr!17968 a!2986) j!136) j!136))))

(declare-fun b!614416 () Bool)

(assert (=> b!614416 (= e!352260 e!352261)))

(declare-fun res!395675 () Bool)

(assert (=> b!614416 (=> res!395675 e!352261)))

(declare-fun lt!281865 () (_ BitVec 64))

(assert (=> b!614416 (= res!395675 (or (not (= (select (arr!17968 a!2986) j!136) lt!281859)) (not (= (select (arr!17968 a!2986) j!136) lt!281865))))))

(declare-fun e!352250 () Bool)

(assert (=> b!614416 e!352250))

(declare-fun res!395663 () Bool)

(assert (=> b!614416 (=> (not res!395663) (not e!352250))))

(assert (=> b!614416 (= res!395663 (= lt!281865 (select (arr!17968 a!2986) j!136)))))

(assert (=> b!614416 (= lt!281865 (select (store (arr!17968 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!614417 () Bool)

(declare-fun Unit!19831 () Unit!19828)

(assert (=> b!614417 (= e!352254 Unit!19831)))

(declare-fun lt!281857 () Unit!19828)

(assert (=> b!614417 (= lt!281857 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281851 (select (arr!17968 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!614417 (arrayContainsKey!0 lt!281851 (select (arr!17968 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!281868 () Unit!19828)

(assert (=> b!614417 (= lt!281868 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12006))))

(assert (=> b!614417 (arrayNoDuplicates!0 lt!281851 #b00000000000000000000000000000000 Nil!12006)))

(declare-fun lt!281853 () Unit!19828)

(assert (=> b!614417 (= lt!281853 (lemmaNoDuplicateFromThenFromBigger!0 lt!281851 #b00000000000000000000000000000000 j!136))))

(assert (=> b!614417 (arrayNoDuplicates!0 lt!281851 j!136 Nil!12006)))

(declare-fun lt!281864 () Unit!19828)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37444 (_ BitVec 64) (_ BitVec 32) List!12009) Unit!19828)

(assert (=> b!614417 (= lt!281864 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!281851 (select (arr!17968 a!2986) j!136) j!136 Nil!12006))))

(assert (=> b!614417 false))

(declare-fun b!614418 () Bool)

(declare-fun Unit!19832 () Unit!19828)

(assert (=> b!614418 (= e!352248 Unit!19832)))

(assert (=> b!614418 false))

(declare-fun b!614419 () Bool)

(assert (=> b!614419 (= e!352250 e!352252)))

(declare-fun res!395666 () Bool)

(assert (=> b!614419 (=> res!395666 e!352252)))

(assert (=> b!614419 (= res!395666 (or (not (= (select (arr!17968 a!2986) j!136) lt!281859)) (not (= (select (arr!17968 a!2986) j!136) lt!281865)) (bvsge j!136 index!984)))))

(declare-fun b!614420 () Bool)

(declare-fun res!395671 () Bool)

(assert (=> b!614420 (=> (not res!395671) (not e!352258))))

(assert (=> b!614420 (= res!395671 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17968 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!614421 () Bool)

(assert (=> b!614421 (= e!352255 (arrayContainsKey!0 lt!281851 (select (arr!17968 a!2986) j!136) index!984))))

(declare-fun b!614422 () Bool)

(declare-fun res!395676 () Bool)

(assert (=> b!614422 (=> (not res!395676) (not e!352256))))

(assert (=> b!614422 (= res!395676 (validKeyInArray!0 (select (arr!17968 a!2986) j!136)))))

(declare-fun b!614423 () Bool)

(declare-fun Unit!19833 () Unit!19828)

(assert (=> b!614423 (= e!352254 Unit!19833)))

(assert (= (and start!55974 res!395680) b!614399))

(assert (= (and b!614399 res!395665) b!614422))

(assert (= (and b!614422 res!395676) b!614411))

(assert (= (and b!614411 res!395674) b!614398))

(assert (= (and b!614398 res!395660) b!614407))

(assert (= (and b!614407 res!395678) b!614414))

(assert (= (and b!614414 res!395673) b!614412))

(assert (= (and b!614412 res!395662) b!614420))

(assert (= (and b!614420 res!395671) b!614406))

(assert (= (and b!614406 res!395670) b!614401))

(assert (= (and b!614401 res!395681) b!614410))

(assert (= (and b!614410 res!395669) b!614405))

(assert (= (and b!614410 c!69737) b!614418))

(assert (= (and b!614410 (not c!69737)) b!614403))

(assert (= (and b!614410 (not res!395679)) b!614416))

(assert (= (and b!614416 res!395663) b!614419))

(assert (= (and b!614419 (not res!395666)) b!614415))

(assert (= (and b!614415 res!395672) b!614421))

(assert (= (and b!614416 (not res!395675)) b!614409))

(assert (= (and b!614409 c!69736) b!614417))

(assert (= (and b!614409 (not c!69736)) b!614423))

(assert (= (and b!614409 (not res!395668)) b!614404))

(assert (= (and b!614404 res!395661) b!614400))

(assert (= (and b!614404 (not res!395664)) b!614402))

(assert (= (and b!614402 (not res!395677)) b!614408))

(assert (= (and b!614408 (not res!395667)) b!614413))

(declare-fun m!590635 () Bool)

(assert (=> b!614414 m!590635))

(declare-fun m!590637 () Bool)

(assert (=> b!614406 m!590637))

(declare-fun m!590639 () Bool)

(assert (=> b!614406 m!590639))

(declare-fun m!590641 () Bool)

(assert (=> b!614402 m!590641))

(declare-fun m!590643 () Bool)

(assert (=> b!614416 m!590643))

(assert (=> b!614416 m!590637))

(declare-fun m!590645 () Bool)

(assert (=> b!614416 m!590645))

(declare-fun m!590647 () Bool)

(assert (=> b!614413 m!590647))

(assert (=> b!614415 m!590643))

(assert (=> b!614415 m!590643))

(declare-fun m!590649 () Bool)

(assert (=> b!614415 m!590649))

(assert (=> b!614400 m!590643))

(assert (=> b!614400 m!590643))

(declare-fun m!590651 () Bool)

(assert (=> b!614400 m!590651))

(declare-fun m!590653 () Bool)

(assert (=> b!614408 m!590653))

(declare-fun m!590655 () Bool)

(assert (=> b!614420 m!590655))

(assert (=> b!614404 m!590643))

(assert (=> b!614404 m!590643))

(declare-fun m!590657 () Bool)

(assert (=> b!614404 m!590657))

(declare-fun m!590659 () Bool)

(assert (=> b!614404 m!590659))

(assert (=> b!614404 m!590643))

(declare-fun m!590661 () Bool)

(assert (=> b!614404 m!590661))

(declare-fun m!590663 () Bool)

(assert (=> b!614404 m!590663))

(declare-fun m!590665 () Bool)

(assert (=> b!614404 m!590665))

(assert (=> b!614404 m!590643))

(assert (=> b!614404 m!590649))

(declare-fun m!590667 () Bool)

(assert (=> b!614404 m!590667))

(assert (=> b!614419 m!590643))

(declare-fun m!590669 () Bool)

(assert (=> b!614410 m!590669))

(declare-fun m!590671 () Bool)

(assert (=> b!614410 m!590671))

(assert (=> b!614410 m!590643))

(declare-fun m!590673 () Bool)

(assert (=> b!614410 m!590673))

(assert (=> b!614410 m!590643))

(assert (=> b!614410 m!590637))

(declare-fun m!590675 () Bool)

(assert (=> b!614410 m!590675))

(declare-fun m!590677 () Bool)

(assert (=> b!614410 m!590677))

(declare-fun m!590679 () Bool)

(assert (=> b!614410 m!590679))

(declare-fun m!590681 () Bool)

(assert (=> start!55974 m!590681))

(declare-fun m!590683 () Bool)

(assert (=> start!55974 m!590683))

(declare-fun m!590685 () Bool)

(assert (=> b!614407 m!590685))

(declare-fun m!590687 () Bool)

(assert (=> b!614401 m!590687))

(assert (=> b!614401 m!590643))

(assert (=> b!614401 m!590643))

(declare-fun m!590689 () Bool)

(assert (=> b!614401 m!590689))

(declare-fun m!590691 () Bool)

(assert (=> b!614398 m!590691))

(assert (=> b!614421 m!590643))

(assert (=> b!614421 m!590643))

(assert (=> b!614421 m!590651))

(declare-fun m!590693 () Bool)

(assert (=> b!614411 m!590693))

(declare-fun m!590695 () Bool)

(assert (=> b!614417 m!590695))

(assert (=> b!614417 m!590643))

(declare-fun m!590697 () Bool)

(assert (=> b!614417 m!590697))

(assert (=> b!614417 m!590643))

(assert (=> b!614417 m!590643))

(declare-fun m!590699 () Bool)

(assert (=> b!614417 m!590699))

(assert (=> b!614417 m!590643))

(declare-fun m!590701 () Bool)

(assert (=> b!614417 m!590701))

(assert (=> b!614417 m!590663))

(declare-fun m!590703 () Bool)

(assert (=> b!614417 m!590703))

(assert (=> b!614417 m!590667))

(assert (=> b!614422 m!590643))

(assert (=> b!614422 m!590643))

(declare-fun m!590705 () Bool)

(assert (=> b!614422 m!590705))

(declare-fun m!590707 () Bool)

(assert (=> b!614412 m!590707))

(check-sat (not b!614413) (not b!614401) (not b!614422) (not b!614412) (not b!614408) (not b!614411) (not b!614415) (not b!614410) (not b!614407) (not b!614417) (not b!614404) (not start!55974) (not b!614421) (not b!614402) (not b!614398) (not b!614400) (not b!614414))
(check-sat)
