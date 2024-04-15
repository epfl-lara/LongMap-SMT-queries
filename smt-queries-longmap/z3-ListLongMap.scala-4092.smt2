; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56034 () Bool)

(assert start!56034)

(declare-fun b!616927 () Bool)

(declare-datatypes ((Unit!20166 0))(
  ( (Unit!20167) )
))
(declare-fun e!353736 () Unit!20166)

(declare-fun Unit!20168 () Unit!20166)

(assert (=> b!616927 (= e!353736 Unit!20168)))

(declare-fun res!397472 () Bool)

(declare-fun e!353737 () Bool)

(assert (=> start!56034 (=> (not res!397472) (not e!353737))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56034 (= res!397472 (validMask!0 mask!3053))))

(assert (=> start!56034 e!353737))

(assert (=> start!56034 true))

(declare-datatypes ((array!37518 0))(
  ( (array!37519 (arr!18005 (Array (_ BitVec 32) (_ BitVec 64))) (size!18370 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37518)

(declare-fun array_inv!13888 (array!37518) Bool)

(assert (=> start!56034 (array_inv!13888 a!2986)))

(declare-fun b!616928 () Bool)

(declare-fun lt!283899 () array!37518)

(declare-fun e!353734 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616928 (= e!353734 (arrayContainsKey!0 lt!283899 (select (arr!18005 a!2986) j!136) index!984))))

(declare-fun b!616929 () Bool)

(declare-fun res!397477 () Bool)

(assert (=> b!616929 (=> (not res!397477) (not e!353737))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!616929 (= res!397477 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616930 () Bool)

(declare-fun e!353746 () Bool)

(declare-fun e!353739 () Bool)

(assert (=> b!616930 (= e!353746 (not e!353739))))

(declare-fun res!397486 () Bool)

(assert (=> b!616930 (=> res!397486 e!353739)))

(declare-datatypes ((SeekEntryResult!6442 0))(
  ( (MissingZero!6442 (index!28052 (_ BitVec 32))) (Found!6442 (index!28053 (_ BitVec 32))) (Intermediate!6442 (undefined!7254 Bool) (index!28054 (_ BitVec 32)) (x!56853 (_ BitVec 32))) (Undefined!6442) (MissingVacant!6442 (index!28055 (_ BitVec 32))) )
))
(declare-fun lt!283893 () SeekEntryResult!6442)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!616930 (= res!397486 (not (= lt!283893 (MissingVacant!6442 vacantSpotIndex!68))))))

(declare-fun lt!283902 () Unit!20166)

(declare-fun e!353738 () Unit!20166)

(assert (=> b!616930 (= lt!283902 e!353738)))

(declare-fun c!70096 () Bool)

(assert (=> b!616930 (= c!70096 (= lt!283893 (Found!6442 index!984)))))

(declare-fun lt!283892 () Unit!20166)

(declare-fun e!353743 () Unit!20166)

(assert (=> b!616930 (= lt!283892 e!353743)))

(declare-fun c!70098 () Bool)

(assert (=> b!616930 (= c!70098 (= lt!283893 Undefined!6442))))

(declare-fun lt!283900 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37518 (_ BitVec 32)) SeekEntryResult!6442)

(assert (=> b!616930 (= lt!283893 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283900 lt!283899 mask!3053))))

(declare-fun e!353735 () Bool)

(assert (=> b!616930 e!353735))

(declare-fun res!397475 () Bool)

(assert (=> b!616930 (=> (not res!397475) (not e!353735))))

(declare-fun lt!283888 () (_ BitVec 32))

(declare-fun lt!283896 () SeekEntryResult!6442)

(assert (=> b!616930 (= res!397475 (= lt!283896 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283888 vacantSpotIndex!68 lt!283900 lt!283899 mask!3053)))))

(assert (=> b!616930 (= lt!283896 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283888 vacantSpotIndex!68 (select (arr!18005 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!616930 (= lt!283900 (select (store (arr!18005 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283894 () Unit!20166)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37518 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20166)

(assert (=> b!616930 (= lt!283894 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283888 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616930 (= lt!283888 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616931 () Bool)

(declare-fun res!397476 () Bool)

(assert (=> b!616931 (=> (not res!397476) (not e!353737))))

(assert (=> b!616931 (= res!397476 (and (= (size!18370 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18370 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18370 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616932 () Bool)

(declare-fun res!397480 () Bool)

(declare-fun e!353742 () Bool)

(assert (=> b!616932 (=> (not res!397480) (not e!353742))))

(declare-datatypes ((List!12085 0))(
  ( (Nil!12082) (Cons!12081 (h!13126 (_ BitVec 64)) (t!18304 List!12085)) )
))
(declare-fun arrayNoDuplicates!0 (array!37518 (_ BitVec 32) List!12085) Bool)

(assert (=> b!616932 (= res!397480 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12082))))

(declare-fun b!616933 () Bool)

(declare-fun e!353740 () Unit!20166)

(declare-fun Unit!20169 () Unit!20166)

(assert (=> b!616933 (= e!353740 Unit!20169)))

(declare-fun b!616934 () Bool)

(assert (=> b!616934 (= e!353739 true)))

(assert (=> b!616934 (= (select (store (arr!18005 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616935 () Bool)

(declare-fun Unit!20170 () Unit!20166)

(assert (=> b!616935 (= e!353738 Unit!20170)))

(declare-fun res!397484 () Bool)

(assert (=> b!616935 (= res!397484 (= (select (store (arr!18005 a!2986) i!1108 k0!1786) index!984) (select (arr!18005 a!2986) j!136)))))

(declare-fun e!353744 () Bool)

(assert (=> b!616935 (=> (not res!397484) (not e!353744))))

(assert (=> b!616935 e!353744))

(declare-fun c!70097 () Bool)

(assert (=> b!616935 (= c!70097 (bvslt j!136 index!984))))

(declare-fun lt!283890 () Unit!20166)

(assert (=> b!616935 (= lt!283890 e!353740)))

(declare-fun c!70095 () Bool)

(assert (=> b!616935 (= c!70095 (bvslt index!984 j!136))))

(declare-fun lt!283884 () Unit!20166)

(assert (=> b!616935 (= lt!283884 e!353736)))

(assert (=> b!616935 false))

(declare-fun b!616936 () Bool)

(declare-fun lt!283889 () SeekEntryResult!6442)

(assert (=> b!616936 (= e!353735 (= lt!283889 lt!283896))))

(declare-fun b!616937 () Bool)

(declare-fun Unit!20171 () Unit!20166)

(assert (=> b!616937 (= e!353743 Unit!20171)))

(assert (=> b!616937 false))

(declare-fun b!616938 () Bool)

(assert (=> b!616938 false))

(declare-fun lt!283903 () Unit!20166)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37518 (_ BitVec 64) (_ BitVec 32) List!12085) Unit!20166)

(assert (=> b!616938 (= lt!283903 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283899 (select (arr!18005 a!2986) j!136) j!136 Nil!12082))))

(assert (=> b!616938 (arrayNoDuplicates!0 lt!283899 j!136 Nil!12082)))

(declare-fun lt!283901 () Unit!20166)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37518 (_ BitVec 32) (_ BitVec 32)) Unit!20166)

(assert (=> b!616938 (= lt!283901 (lemmaNoDuplicateFromThenFromBigger!0 lt!283899 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616938 (arrayNoDuplicates!0 lt!283899 #b00000000000000000000000000000000 Nil!12082)))

(declare-fun lt!283897 () Unit!20166)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37518 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12085) Unit!20166)

(assert (=> b!616938 (= lt!283897 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12082))))

(assert (=> b!616938 (arrayContainsKey!0 lt!283899 (select (arr!18005 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283887 () Unit!20166)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37518 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20166)

(assert (=> b!616938 (= lt!283887 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283899 (select (arr!18005 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20172 () Unit!20166)

(assert (=> b!616938 (= e!353740 Unit!20172)))

(declare-fun b!616939 () Bool)

(declare-fun res!397485 () Bool)

(assert (=> b!616939 (= res!397485 (bvsge j!136 index!984))))

(declare-fun e!353748 () Bool)

(assert (=> b!616939 (=> res!397485 e!353748)))

(assert (=> b!616939 (= e!353744 e!353748)))

(declare-fun b!616940 () Bool)

(declare-fun e!353741 () Bool)

(assert (=> b!616940 (= e!353742 e!353741)))

(declare-fun res!397473 () Bool)

(assert (=> b!616940 (=> (not res!397473) (not e!353741))))

(assert (=> b!616940 (= res!397473 (= (select (store (arr!18005 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616940 (= lt!283899 (array!37519 (store (arr!18005 a!2986) i!1108 k0!1786) (size!18370 a!2986)))))

(declare-fun b!616941 () Bool)

(declare-fun res!397479 () Bool)

(assert (=> b!616941 (=> (not res!397479) (not e!353737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616941 (= res!397479 (validKeyInArray!0 (select (arr!18005 a!2986) j!136)))))

(declare-fun b!616942 () Bool)

(declare-fun e!353747 () Bool)

(assert (=> b!616942 (= e!353747 (arrayContainsKey!0 lt!283899 (select (arr!18005 a!2986) j!136) index!984))))

(declare-fun b!616943 () Bool)

(declare-fun res!397471 () Bool)

(assert (=> b!616943 (=> (not res!397471) (not e!353737))))

(assert (=> b!616943 (= res!397471 (validKeyInArray!0 k0!1786))))

(declare-fun b!616944 () Bool)

(declare-fun res!397478 () Bool)

(assert (=> b!616944 (=> (not res!397478) (not e!353742))))

(assert (=> b!616944 (= res!397478 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18005 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616945 () Bool)

(assert (=> b!616945 false))

(declare-fun lt!283891 () Unit!20166)

(assert (=> b!616945 (= lt!283891 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283899 (select (arr!18005 a!2986) j!136) index!984 Nil!12082))))

(assert (=> b!616945 (arrayNoDuplicates!0 lt!283899 index!984 Nil!12082)))

(declare-fun lt!283898 () Unit!20166)

(assert (=> b!616945 (= lt!283898 (lemmaNoDuplicateFromThenFromBigger!0 lt!283899 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616945 (arrayNoDuplicates!0 lt!283899 #b00000000000000000000000000000000 Nil!12082)))

(declare-fun lt!283895 () Unit!20166)

(assert (=> b!616945 (= lt!283895 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12082))))

(assert (=> b!616945 (arrayContainsKey!0 lt!283899 (select (arr!18005 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283886 () Unit!20166)

(assert (=> b!616945 (= lt!283886 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283899 (select (arr!18005 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!616945 e!353747))

(declare-fun res!397474 () Bool)

(assert (=> b!616945 (=> (not res!397474) (not e!353747))))

(assert (=> b!616945 (= res!397474 (arrayContainsKey!0 lt!283899 (select (arr!18005 a!2986) j!136) j!136))))

(declare-fun Unit!20173 () Unit!20166)

(assert (=> b!616945 (= e!353736 Unit!20173)))

(declare-fun b!616946 () Bool)

(assert (=> b!616946 (= e!353741 e!353746)))

(declare-fun res!397487 () Bool)

(assert (=> b!616946 (=> (not res!397487) (not e!353746))))

(assert (=> b!616946 (= res!397487 (and (= lt!283889 (Found!6442 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18005 a!2986) index!984) (select (arr!18005 a!2986) j!136))) (not (= (select (arr!18005 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616946 (= lt!283889 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18005 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616947 () Bool)

(declare-fun Unit!20174 () Unit!20166)

(assert (=> b!616947 (= e!353738 Unit!20174)))

(declare-fun b!616948 () Bool)

(declare-fun res!397482 () Bool)

(assert (=> b!616948 (=> (not res!397482) (not e!353742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37518 (_ BitVec 32)) Bool)

(assert (=> b!616948 (= res!397482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!397483 () Bool)

(declare-fun b!616949 () Bool)

(assert (=> b!616949 (= res!397483 (arrayContainsKey!0 lt!283899 (select (arr!18005 a!2986) j!136) j!136))))

(assert (=> b!616949 (=> (not res!397483) (not e!353734))))

(assert (=> b!616949 (= e!353748 e!353734)))

(declare-fun b!616950 () Bool)

(assert (=> b!616950 (= e!353737 e!353742)))

(declare-fun res!397481 () Bool)

(assert (=> b!616950 (=> (not res!397481) (not e!353742))))

(declare-fun lt!283885 () SeekEntryResult!6442)

(assert (=> b!616950 (= res!397481 (or (= lt!283885 (MissingZero!6442 i!1108)) (= lt!283885 (MissingVacant!6442 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37518 (_ BitVec 32)) SeekEntryResult!6442)

(assert (=> b!616950 (= lt!283885 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!616951 () Bool)

(declare-fun Unit!20175 () Unit!20166)

(assert (=> b!616951 (= e!353743 Unit!20175)))

(assert (= (and start!56034 res!397472) b!616931))

(assert (= (and b!616931 res!397476) b!616941))

(assert (= (and b!616941 res!397479) b!616943))

(assert (= (and b!616943 res!397471) b!616929))

(assert (= (and b!616929 res!397477) b!616950))

(assert (= (and b!616950 res!397481) b!616948))

(assert (= (and b!616948 res!397482) b!616932))

(assert (= (and b!616932 res!397480) b!616944))

(assert (= (and b!616944 res!397478) b!616940))

(assert (= (and b!616940 res!397473) b!616946))

(assert (= (and b!616946 res!397487) b!616930))

(assert (= (and b!616930 res!397475) b!616936))

(assert (= (and b!616930 c!70098) b!616937))

(assert (= (and b!616930 (not c!70098)) b!616951))

(assert (= (and b!616930 c!70096) b!616935))

(assert (= (and b!616930 (not c!70096)) b!616947))

(assert (= (and b!616935 res!397484) b!616939))

(assert (= (and b!616939 (not res!397485)) b!616949))

(assert (= (and b!616949 res!397483) b!616928))

(assert (= (and b!616935 c!70097) b!616938))

(assert (= (and b!616935 (not c!70097)) b!616933))

(assert (= (and b!616935 c!70095) b!616945))

(assert (= (and b!616935 (not c!70095)) b!616927))

(assert (= (and b!616945 res!397474) b!616942))

(assert (= (and b!616930 (not res!397486)) b!616934))

(declare-fun m!592549 () Bool)

(assert (=> b!616946 m!592549))

(declare-fun m!592551 () Bool)

(assert (=> b!616946 m!592551))

(assert (=> b!616946 m!592551))

(declare-fun m!592553 () Bool)

(assert (=> b!616946 m!592553))

(assert (=> b!616949 m!592551))

(assert (=> b!616949 m!592551))

(declare-fun m!592555 () Bool)

(assert (=> b!616949 m!592555))

(assert (=> b!616928 m!592551))

(assert (=> b!616928 m!592551))

(declare-fun m!592557 () Bool)

(assert (=> b!616928 m!592557))

(assert (=> b!616945 m!592551))

(declare-fun m!592559 () Bool)

(assert (=> b!616945 m!592559))

(assert (=> b!616945 m!592551))

(declare-fun m!592561 () Bool)

(assert (=> b!616945 m!592561))

(declare-fun m!592563 () Bool)

(assert (=> b!616945 m!592563))

(assert (=> b!616945 m!592551))

(declare-fun m!592565 () Bool)

(assert (=> b!616945 m!592565))

(assert (=> b!616945 m!592551))

(declare-fun m!592567 () Bool)

(assert (=> b!616945 m!592567))

(assert (=> b!616945 m!592551))

(assert (=> b!616945 m!592555))

(declare-fun m!592569 () Bool)

(assert (=> b!616945 m!592569))

(declare-fun m!592571 () Bool)

(assert (=> b!616945 m!592571))

(declare-fun m!592573 () Bool)

(assert (=> b!616930 m!592573))

(declare-fun m!592575 () Bool)

(assert (=> b!616930 m!592575))

(declare-fun m!592577 () Bool)

(assert (=> b!616930 m!592577))

(declare-fun m!592579 () Bool)

(assert (=> b!616930 m!592579))

(assert (=> b!616930 m!592551))

(declare-fun m!592581 () Bool)

(assert (=> b!616930 m!592581))

(declare-fun m!592583 () Bool)

(assert (=> b!616930 m!592583))

(assert (=> b!616930 m!592551))

(declare-fun m!592585 () Bool)

(assert (=> b!616930 m!592585))

(assert (=> b!616942 m!592551))

(assert (=> b!616942 m!592551))

(assert (=> b!616942 m!592557))

(declare-fun m!592587 () Bool)

(assert (=> b!616932 m!592587))

(declare-fun m!592589 () Bool)

(assert (=> b!616929 m!592589))

(assert (=> b!616940 m!592581))

(declare-fun m!592591 () Bool)

(assert (=> b!616940 m!592591))

(declare-fun m!592593 () Bool)

(assert (=> b!616950 m!592593))

(assert (=> b!616941 m!592551))

(assert (=> b!616941 m!592551))

(declare-fun m!592595 () Bool)

(assert (=> b!616941 m!592595))

(declare-fun m!592597 () Bool)

(assert (=> b!616943 m!592597))

(assert (=> b!616935 m!592581))

(declare-fun m!592599 () Bool)

(assert (=> b!616935 m!592599))

(assert (=> b!616935 m!592551))

(assert (=> b!616938 m!592551))

(declare-fun m!592601 () Bool)

(assert (=> b!616938 m!592601))

(assert (=> b!616938 m!592551))

(assert (=> b!616938 m!592551))

(declare-fun m!592603 () Bool)

(assert (=> b!616938 m!592603))

(assert (=> b!616938 m!592563))

(assert (=> b!616938 m!592551))

(declare-fun m!592605 () Bool)

(assert (=> b!616938 m!592605))

(assert (=> b!616938 m!592571))

(declare-fun m!592607 () Bool)

(assert (=> b!616938 m!592607))

(declare-fun m!592609 () Bool)

(assert (=> b!616938 m!592609))

(assert (=> b!616934 m!592581))

(assert (=> b!616934 m!592599))

(declare-fun m!592611 () Bool)

(assert (=> b!616944 m!592611))

(declare-fun m!592613 () Bool)

(assert (=> start!56034 m!592613))

(declare-fun m!592615 () Bool)

(assert (=> start!56034 m!592615))

(declare-fun m!592617 () Bool)

(assert (=> b!616948 m!592617))

(check-sat (not b!616928) (not b!616929) (not b!616949) (not start!56034) (not b!616932) (not b!616943) (not b!616945) (not b!616930) (not b!616941) (not b!616950) (not b!616938) (not b!616948) (not b!616942) (not b!616946))
(check-sat)
