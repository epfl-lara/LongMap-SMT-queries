; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59540 () Bool)

(assert start!59540)

(declare-fun b!656808 () Bool)

(declare-fun res!425968 () Bool)

(declare-fun e!377282 () Bool)

(assert (=> b!656808 (=> (not res!425968) (not e!377282))))

(declare-datatypes ((array!38709 0))(
  ( (array!38710 (arr!18551 (Array (_ BitVec 32) (_ BitVec 64))) (size!18916 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38709)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!656808 (= res!425968 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!656810 () Bool)

(declare-datatypes ((Unit!22652 0))(
  ( (Unit!22653) )
))
(declare-fun e!377279 () Unit!22652)

(declare-fun Unit!22654 () Unit!22652)

(assert (=> b!656810 (= e!377279 Unit!22654)))

(declare-fun b!656811 () Bool)

(declare-fun e!377275 () Bool)

(assert (=> b!656811 (= e!377275 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!656811 (= (select (store (arr!18551 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!656812 () Bool)

(declare-fun e!377269 () Bool)

(assert (=> b!656812 (= e!377282 e!377269)))

(declare-fun res!425967 () Bool)

(assert (=> b!656812 (=> (not res!425967) (not e!377269))))

(declare-datatypes ((SeekEntryResult!6988 0))(
  ( (MissingZero!6988 (index!30317 (_ BitVec 32))) (Found!6988 (index!30318 (_ BitVec 32))) (Intermediate!6988 (undefined!7800 Bool) (index!30319 (_ BitVec 32)) (x!59122 (_ BitVec 32))) (Undefined!6988) (MissingVacant!6988 (index!30320 (_ BitVec 32))) )
))
(declare-fun lt!306549 () SeekEntryResult!6988)

(assert (=> b!656812 (= res!425967 (or (= lt!306549 (MissingZero!6988 i!1108)) (= lt!306549 (MissingVacant!6988 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38709 (_ BitVec 32)) SeekEntryResult!6988)

(assert (=> b!656812 (= lt!306549 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!656813 () Bool)

(declare-fun res!425961 () Bool)

(assert (=> b!656813 (=> (not res!425961) (not e!377282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!656813 (= res!425961 (validKeyInArray!0 k0!1786))))

(declare-fun b!656814 () Bool)

(declare-fun res!425965 () Bool)

(assert (=> b!656814 (=> (not res!425965) (not e!377282))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!656814 (= res!425965 (validKeyInArray!0 (select (arr!18551 a!2986) j!136)))))

(declare-fun b!656815 () Bool)

(declare-fun e!377270 () Unit!22652)

(declare-fun Unit!22655 () Unit!22652)

(assert (=> b!656815 (= e!377270 Unit!22655)))

(declare-fun res!425954 () Bool)

(assert (=> b!656815 (= res!425954 (= (select (store (arr!18551 a!2986) i!1108 k0!1786) index!984) (select (arr!18551 a!2986) j!136)))))

(declare-fun e!377268 () Bool)

(assert (=> b!656815 (=> (not res!425954) (not e!377268))))

(assert (=> b!656815 e!377268))

(declare-fun c!75796 () Bool)

(assert (=> b!656815 (= c!75796 (bvslt j!136 index!984))))

(declare-fun lt!306547 () Unit!22652)

(assert (=> b!656815 (= lt!306547 e!377279)))

(declare-fun c!75797 () Bool)

(assert (=> b!656815 (= c!75797 (bvslt index!984 j!136))))

(declare-fun lt!306552 () Unit!22652)

(declare-fun e!377280 () Unit!22652)

(assert (=> b!656815 (= lt!306552 e!377280)))

(assert (=> b!656815 false))

(declare-fun b!656816 () Bool)

(assert (=> b!656816 false))

(declare-fun lt!306533 () array!38709)

(declare-fun lt!306538 () Unit!22652)

(declare-datatypes ((List!12631 0))(
  ( (Nil!12628) (Cons!12627 (h!13672 (_ BitVec 64)) (t!18850 List!12631)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38709 (_ BitVec 64) (_ BitVec 32) List!12631) Unit!22652)

(assert (=> b!656816 (= lt!306538 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306533 (select (arr!18551 a!2986) j!136) index!984 Nil!12628))))

(declare-fun arrayNoDuplicates!0 (array!38709 (_ BitVec 32) List!12631) Bool)

(assert (=> b!656816 (arrayNoDuplicates!0 lt!306533 index!984 Nil!12628)))

(declare-fun lt!306551 () Unit!22652)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38709 (_ BitVec 32) (_ BitVec 32)) Unit!22652)

(assert (=> b!656816 (= lt!306551 (lemmaNoDuplicateFromThenFromBigger!0 lt!306533 #b00000000000000000000000000000000 index!984))))

(assert (=> b!656816 (arrayNoDuplicates!0 lt!306533 #b00000000000000000000000000000000 Nil!12628)))

(declare-fun lt!306544 () Unit!22652)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38709 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12631) Unit!22652)

(assert (=> b!656816 (= lt!306544 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12628))))

(assert (=> b!656816 (arrayContainsKey!0 lt!306533 (select (arr!18551 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306540 () Unit!22652)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38709 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22652)

(assert (=> b!656816 (= lt!306540 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306533 (select (arr!18551 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!377273 () Bool)

(assert (=> b!656816 e!377273))

(declare-fun res!425964 () Bool)

(assert (=> b!656816 (=> (not res!425964) (not e!377273))))

(assert (=> b!656816 (= res!425964 (arrayContainsKey!0 lt!306533 (select (arr!18551 a!2986) j!136) j!136))))

(declare-fun Unit!22656 () Unit!22652)

(assert (=> b!656816 (= e!377280 Unit!22656)))

(declare-fun b!656817 () Bool)

(declare-fun Unit!22657 () Unit!22652)

(assert (=> b!656817 (= e!377280 Unit!22657)))

(declare-fun e!377281 () Bool)

(declare-fun b!656809 () Bool)

(assert (=> b!656809 (= e!377281 (arrayContainsKey!0 lt!306533 (select (arr!18551 a!2986) j!136) index!984))))

(declare-fun res!425955 () Bool)

(assert (=> start!59540 (=> (not res!425955) (not e!377282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59540 (= res!425955 (validMask!0 mask!3053))))

(assert (=> start!59540 e!377282))

(assert (=> start!59540 true))

(declare-fun array_inv!14434 (array!38709) Bool)

(assert (=> start!59540 (array_inv!14434 a!2986)))

(declare-fun b!656818 () Bool)

(declare-fun res!425958 () Bool)

(assert (=> b!656818 (=> (not res!425958) (not e!377269))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!656818 (= res!425958 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18551 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!656819 () Bool)

(assert (=> b!656819 false))

(declare-fun lt!306535 () Unit!22652)

(assert (=> b!656819 (= lt!306535 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306533 (select (arr!18551 a!2986) j!136) j!136 Nil!12628))))

(assert (=> b!656819 (arrayNoDuplicates!0 lt!306533 j!136 Nil!12628)))

(declare-fun lt!306550 () Unit!22652)

(assert (=> b!656819 (= lt!306550 (lemmaNoDuplicateFromThenFromBigger!0 lt!306533 #b00000000000000000000000000000000 j!136))))

(assert (=> b!656819 (arrayNoDuplicates!0 lt!306533 #b00000000000000000000000000000000 Nil!12628)))

(declare-fun lt!306545 () Unit!22652)

(assert (=> b!656819 (= lt!306545 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12628))))

(assert (=> b!656819 (arrayContainsKey!0 lt!306533 (select (arr!18551 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306537 () Unit!22652)

(assert (=> b!656819 (= lt!306537 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306533 (select (arr!18551 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22658 () Unit!22652)

(assert (=> b!656819 (= e!377279 Unit!22658)))

(declare-fun b!656820 () Bool)

(assert (=> b!656820 (= e!377273 (arrayContainsKey!0 lt!306533 (select (arr!18551 a!2986) j!136) index!984))))

(declare-fun b!656821 () Bool)

(declare-fun e!377274 () Bool)

(assert (=> b!656821 (= e!377274 (not e!377275))))

(declare-fun res!425959 () Bool)

(assert (=> b!656821 (=> res!425959 e!377275)))

(declare-fun lt!306543 () SeekEntryResult!6988)

(assert (=> b!656821 (= res!425959 (not (= lt!306543 (MissingVacant!6988 vacantSpotIndex!68))))))

(declare-fun lt!306548 () Unit!22652)

(assert (=> b!656821 (= lt!306548 e!377270)))

(declare-fun c!75798 () Bool)

(assert (=> b!656821 (= c!75798 (= lt!306543 (Found!6988 index!984)))))

(declare-fun lt!306536 () Unit!22652)

(declare-fun e!377276 () Unit!22652)

(assert (=> b!656821 (= lt!306536 e!377276)))

(declare-fun c!75795 () Bool)

(assert (=> b!656821 (= c!75795 (= lt!306543 Undefined!6988))))

(declare-fun lt!306541 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38709 (_ BitVec 32)) SeekEntryResult!6988)

(assert (=> b!656821 (= lt!306543 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306541 lt!306533 mask!3053))))

(declare-fun e!377272 () Bool)

(assert (=> b!656821 e!377272))

(declare-fun res!425966 () Bool)

(assert (=> b!656821 (=> (not res!425966) (not e!377272))))

(declare-fun lt!306542 () (_ BitVec 32))

(declare-fun lt!306534 () SeekEntryResult!6988)

(assert (=> b!656821 (= res!425966 (= lt!306534 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306542 vacantSpotIndex!68 lt!306541 lt!306533 mask!3053)))))

(assert (=> b!656821 (= lt!306534 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306542 vacantSpotIndex!68 (select (arr!18551 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!656821 (= lt!306541 (select (store (arr!18551 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!306546 () Unit!22652)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38709 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22652)

(assert (=> b!656821 (= lt!306546 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306542 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!656821 (= lt!306542 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!656822 () Bool)

(declare-fun Unit!22659 () Unit!22652)

(assert (=> b!656822 (= e!377276 Unit!22659)))

(assert (=> b!656822 false))

(declare-fun b!656823 () Bool)

(declare-fun e!377277 () Bool)

(assert (=> b!656823 (= e!377277 e!377274)))

(declare-fun res!425963 () Bool)

(assert (=> b!656823 (=> (not res!425963) (not e!377274))))

(declare-fun lt!306539 () SeekEntryResult!6988)

(assert (=> b!656823 (= res!425963 (and (= lt!306539 (Found!6988 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18551 a!2986) index!984) (select (arr!18551 a!2986) j!136))) (not (= (select (arr!18551 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!656823 (= lt!306539 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18551 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656824 () Bool)

(assert (=> b!656824 (= e!377272 (= lt!306539 lt!306534))))

(declare-fun b!656825 () Bool)

(declare-fun res!425960 () Bool)

(assert (=> b!656825 (=> (not res!425960) (not e!377282))))

(assert (=> b!656825 (= res!425960 (and (= (size!18916 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18916 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18916 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!656826 () Bool)

(declare-fun res!425952 () Bool)

(assert (=> b!656826 (=> (not res!425952) (not e!377269))))

(assert (=> b!656826 (= res!425952 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12628))))

(declare-fun b!656827 () Bool)

(declare-fun res!425962 () Bool)

(assert (=> b!656827 (= res!425962 (bvsge j!136 index!984))))

(declare-fun e!377271 () Bool)

(assert (=> b!656827 (=> res!425962 e!377271)))

(assert (=> b!656827 (= e!377268 e!377271)))

(declare-fun b!656828 () Bool)

(assert (=> b!656828 (= e!377269 e!377277)))

(declare-fun res!425953 () Bool)

(assert (=> b!656828 (=> (not res!425953) (not e!377277))))

(assert (=> b!656828 (= res!425953 (= (select (store (arr!18551 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656828 (= lt!306533 (array!38710 (store (arr!18551 a!2986) i!1108 k0!1786) (size!18916 a!2986)))))

(declare-fun res!425957 () Bool)

(declare-fun b!656829 () Bool)

(assert (=> b!656829 (= res!425957 (arrayContainsKey!0 lt!306533 (select (arr!18551 a!2986) j!136) j!136))))

(assert (=> b!656829 (=> (not res!425957) (not e!377281))))

(assert (=> b!656829 (= e!377271 e!377281)))

(declare-fun b!656830 () Bool)

(declare-fun Unit!22660 () Unit!22652)

(assert (=> b!656830 (= e!377276 Unit!22660)))

(declare-fun b!656831 () Bool)

(declare-fun res!425956 () Bool)

(assert (=> b!656831 (=> (not res!425956) (not e!377269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38709 (_ BitVec 32)) Bool)

(assert (=> b!656831 (= res!425956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!656832 () Bool)

(declare-fun Unit!22661 () Unit!22652)

(assert (=> b!656832 (= e!377270 Unit!22661)))

(assert (= (and start!59540 res!425955) b!656825))

(assert (= (and b!656825 res!425960) b!656814))

(assert (= (and b!656814 res!425965) b!656813))

(assert (= (and b!656813 res!425961) b!656808))

(assert (= (and b!656808 res!425968) b!656812))

(assert (= (and b!656812 res!425967) b!656831))

(assert (= (and b!656831 res!425956) b!656826))

(assert (= (and b!656826 res!425952) b!656818))

(assert (= (and b!656818 res!425958) b!656828))

(assert (= (and b!656828 res!425953) b!656823))

(assert (= (and b!656823 res!425963) b!656821))

(assert (= (and b!656821 res!425966) b!656824))

(assert (= (and b!656821 c!75795) b!656822))

(assert (= (and b!656821 (not c!75795)) b!656830))

(assert (= (and b!656821 c!75798) b!656815))

(assert (= (and b!656821 (not c!75798)) b!656832))

(assert (= (and b!656815 res!425954) b!656827))

(assert (= (and b!656827 (not res!425962)) b!656829))

(assert (= (and b!656829 res!425957) b!656809))

(assert (= (and b!656815 c!75796) b!656819))

(assert (= (and b!656815 (not c!75796)) b!656810))

(assert (= (and b!656815 c!75797) b!656816))

(assert (= (and b!656815 (not c!75797)) b!656817))

(assert (= (and b!656816 res!425964) b!656820))

(assert (= (and b!656821 (not res!425959)) b!656811))

(declare-fun m!629385 () Bool)

(assert (=> b!656812 m!629385))

(declare-fun m!629387 () Bool)

(assert (=> b!656813 m!629387))

(declare-fun m!629389 () Bool)

(assert (=> b!656811 m!629389))

(declare-fun m!629391 () Bool)

(assert (=> b!656811 m!629391))

(declare-fun m!629393 () Bool)

(assert (=> b!656819 m!629393))

(declare-fun m!629395 () Bool)

(assert (=> b!656819 m!629395))

(assert (=> b!656819 m!629393))

(declare-fun m!629397 () Bool)

(assert (=> b!656819 m!629397))

(assert (=> b!656819 m!629393))

(assert (=> b!656819 m!629393))

(declare-fun m!629399 () Bool)

(assert (=> b!656819 m!629399))

(declare-fun m!629401 () Bool)

(assert (=> b!656819 m!629401))

(declare-fun m!629403 () Bool)

(assert (=> b!656819 m!629403))

(declare-fun m!629405 () Bool)

(assert (=> b!656819 m!629405))

(declare-fun m!629407 () Bool)

(assert (=> b!656819 m!629407))

(declare-fun m!629409 () Bool)

(assert (=> start!59540 m!629409))

(declare-fun m!629411 () Bool)

(assert (=> start!59540 m!629411))

(assert (=> b!656829 m!629393))

(assert (=> b!656829 m!629393))

(declare-fun m!629413 () Bool)

(assert (=> b!656829 m!629413))

(declare-fun m!629415 () Bool)

(assert (=> b!656821 m!629415))

(assert (=> b!656821 m!629393))

(declare-fun m!629417 () Bool)

(assert (=> b!656821 m!629417))

(assert (=> b!656821 m!629389))

(declare-fun m!629419 () Bool)

(assert (=> b!656821 m!629419))

(assert (=> b!656821 m!629393))

(declare-fun m!629421 () Bool)

(assert (=> b!656821 m!629421))

(declare-fun m!629423 () Bool)

(assert (=> b!656821 m!629423))

(declare-fun m!629425 () Bool)

(assert (=> b!656821 m!629425))

(assert (=> b!656814 m!629393))

(assert (=> b!656814 m!629393))

(declare-fun m!629427 () Bool)

(assert (=> b!656814 m!629427))

(declare-fun m!629429 () Bool)

(assert (=> b!656831 m!629429))

(assert (=> b!656809 m!629393))

(assert (=> b!656809 m!629393))

(declare-fun m!629431 () Bool)

(assert (=> b!656809 m!629431))

(assert (=> b!656815 m!629389))

(assert (=> b!656815 m!629391))

(assert (=> b!656815 m!629393))

(declare-fun m!629433 () Bool)

(assert (=> b!656818 m!629433))

(assert (=> b!656820 m!629393))

(assert (=> b!656820 m!629393))

(assert (=> b!656820 m!629431))

(declare-fun m!629435 () Bool)

(assert (=> b!656808 m!629435))

(declare-fun m!629437 () Bool)

(assert (=> b!656826 m!629437))

(assert (=> b!656828 m!629389))

(declare-fun m!629439 () Bool)

(assert (=> b!656828 m!629439))

(declare-fun m!629441 () Bool)

(assert (=> b!656823 m!629441))

(assert (=> b!656823 m!629393))

(assert (=> b!656823 m!629393))

(declare-fun m!629443 () Bool)

(assert (=> b!656823 m!629443))

(assert (=> b!656816 m!629393))

(assert (=> b!656816 m!629393))

(assert (=> b!656816 m!629413))

(assert (=> b!656816 m!629393))

(declare-fun m!629445 () Bool)

(assert (=> b!656816 m!629445))

(assert (=> b!656816 m!629393))

(declare-fun m!629447 () Bool)

(assert (=> b!656816 m!629447))

(declare-fun m!629449 () Bool)

(assert (=> b!656816 m!629449))

(assert (=> b!656816 m!629403))

(assert (=> b!656816 m!629407))

(assert (=> b!656816 m!629393))

(declare-fun m!629451 () Bool)

(assert (=> b!656816 m!629451))

(declare-fun m!629453 () Bool)

(assert (=> b!656816 m!629453))

(check-sat (not b!656829) (not b!656816) (not b!656809) (not b!656826) (not b!656808) (not b!656820) (not b!656823) (not b!656814) (not b!656812) (not b!656819) (not b!656831) (not b!656821) (not b!656813) (not start!59540))
(check-sat)
