; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54066 () Bool)

(assert start!54066)

(declare-fun b!590521 () Bool)

(declare-fun e!337137 () Bool)

(declare-fun e!337142 () Bool)

(assert (=> b!590521 (= e!337137 e!337142)))

(declare-fun res!377744 () Bool)

(assert (=> b!590521 (=> res!377744 e!337142)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!267915 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36853 0))(
  ( (array!36854 (arr!17698 (Array (_ BitVec 32) (_ BitVec 64))) (size!18062 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36853)

(assert (=> b!590521 (= res!377744 (or (not (= (select (arr!17698 a!2986) j!136) lt!267915)) (not (= (select (arr!17698 a!2986) j!136) (select (store (arr!17698 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590522 () Bool)

(declare-fun res!377739 () Bool)

(declare-fun e!337134 () Bool)

(assert (=> b!590522 (=> (not res!377739) (not e!337134))))

(declare-fun arrayContainsKey!0 (array!36853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590522 (= res!377739 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590523 () Bool)

(declare-fun res!377747 () Bool)

(declare-fun e!337135 () Bool)

(assert (=> b!590523 (=> (not res!377747) (not e!337135))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!590523 (= res!377747 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17698 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590524 () Bool)

(declare-datatypes ((Unit!18470 0))(
  ( (Unit!18471) )
))
(declare-fun e!337138 () Unit!18470)

(declare-fun Unit!18472 () Unit!18470)

(assert (=> b!590524 (= e!337138 Unit!18472)))

(assert (=> b!590524 false))

(declare-fun b!590525 () Bool)

(declare-fun e!337143 () Bool)

(declare-fun e!337140 () Bool)

(assert (=> b!590525 (= e!337143 e!337140)))

(declare-fun res!377741 () Bool)

(assert (=> b!590525 (=> (not res!377741) (not e!337140))))

(declare-datatypes ((SeekEntryResult!6138 0))(
  ( (MissingZero!6138 (index!26785 (_ BitVec 32))) (Found!6138 (index!26786 (_ BitVec 32))) (Intermediate!6138 (undefined!6950 Bool) (index!26787 (_ BitVec 32)) (x!55577 (_ BitVec 32))) (Undefined!6138) (MissingVacant!6138 (index!26788 (_ BitVec 32))) )
))
(declare-fun lt!267911 () SeekEntryResult!6138)

(assert (=> b!590525 (= res!377741 (and (= lt!267911 (Found!6138 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17698 a!2986) index!984) (select (arr!17698 a!2986) j!136))) (not (= (select (arr!17698 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36853 (_ BitVec 32)) SeekEntryResult!6138)

(assert (=> b!590525 (= lt!267911 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17698 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590526 () Bool)

(declare-fun res!377742 () Bool)

(assert (=> b!590526 (=> (not res!377742) (not e!337134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590526 (= res!377742 (validKeyInArray!0 (select (arr!17698 a!2986) j!136)))))

(declare-fun res!377745 () Bool)

(assert (=> start!54066 (=> (not res!377745) (not e!337134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54066 (= res!377745 (validMask!0 mask!3053))))

(assert (=> start!54066 e!337134))

(assert (=> start!54066 true))

(declare-fun array_inv!13494 (array!36853) Bool)

(assert (=> start!54066 (array_inv!13494 a!2986)))

(declare-fun lt!267914 () array!36853)

(declare-fun b!590527 () Bool)

(assert (=> b!590527 (= e!337142 (arrayContainsKey!0 lt!267914 (select (arr!17698 a!2986) j!136) j!136))))

(declare-fun b!590528 () Bool)

(declare-fun e!337136 () Bool)

(assert (=> b!590528 (= e!337140 (not e!337136))))

(declare-fun res!377740 () Bool)

(assert (=> b!590528 (=> res!377740 e!337136)))

(declare-fun lt!267910 () SeekEntryResult!6138)

(assert (=> b!590528 (= res!377740 (not (= lt!267910 (Found!6138 index!984))))))

(declare-fun lt!267916 () Unit!18470)

(assert (=> b!590528 (= lt!267916 e!337138)))

(declare-fun c!66761 () Bool)

(assert (=> b!590528 (= c!66761 (= lt!267910 Undefined!6138))))

(assert (=> b!590528 (= lt!267910 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267915 lt!267914 mask!3053))))

(declare-fun e!337139 () Bool)

(assert (=> b!590528 e!337139))

(declare-fun res!377737 () Bool)

(assert (=> b!590528 (=> (not res!377737) (not e!337139))))

(declare-fun lt!267909 () SeekEntryResult!6138)

(declare-fun lt!267908 () (_ BitVec 32))

(assert (=> b!590528 (= res!377737 (= lt!267909 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267908 vacantSpotIndex!68 lt!267915 lt!267914 mask!3053)))))

(assert (=> b!590528 (= lt!267909 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267908 vacantSpotIndex!68 (select (arr!17698 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590528 (= lt!267915 (select (store (arr!17698 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267913 () Unit!18470)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36853 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18470)

(assert (=> b!590528 (= lt!267913 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267908 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590528 (= lt!267908 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!590529 () Bool)

(declare-fun Unit!18473 () Unit!18470)

(assert (=> b!590529 (= e!337138 Unit!18473)))

(declare-fun b!590530 () Bool)

(declare-fun res!377746 () Bool)

(assert (=> b!590530 (=> (not res!377746) (not e!337135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36853 (_ BitVec 32)) Bool)

(assert (=> b!590530 (= res!377746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590531 () Bool)

(declare-fun res!377734 () Bool)

(assert (=> b!590531 (=> (not res!377734) (not e!337134))))

(assert (=> b!590531 (= res!377734 (validKeyInArray!0 k0!1786))))

(declare-fun b!590532 () Bool)

(declare-fun res!377733 () Bool)

(assert (=> b!590532 (=> (not res!377733) (not e!337135))))

(declare-datatypes ((List!11739 0))(
  ( (Nil!11736) (Cons!11735 (h!12780 (_ BitVec 64)) (t!17967 List!11739)) )
))
(declare-fun arrayNoDuplicates!0 (array!36853 (_ BitVec 32) List!11739) Bool)

(assert (=> b!590532 (= res!377733 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11736))))

(declare-fun b!590533 () Bool)

(assert (=> b!590533 (= e!337136 (or (not (= (select (arr!17698 a!2986) j!136) lt!267915)) (not (= (select (arr!17698 a!2986) j!136) (select (store (arr!17698 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984) (bvslt index!984 (size!18062 a!2986))))))

(assert (=> b!590533 e!337137))

(declare-fun res!377735 () Bool)

(assert (=> b!590533 (=> (not res!377735) (not e!337137))))

(assert (=> b!590533 (= res!377735 (= (select (store (arr!17698 a!2986) i!1108 k0!1786) index!984) (select (arr!17698 a!2986) j!136)))))

(declare-fun b!590534 () Bool)

(declare-fun res!377738 () Bool)

(assert (=> b!590534 (=> (not res!377738) (not e!337134))))

(assert (=> b!590534 (= res!377738 (and (= (size!18062 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18062 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18062 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590535 () Bool)

(assert (=> b!590535 (= e!337134 e!337135)))

(declare-fun res!377743 () Bool)

(assert (=> b!590535 (=> (not res!377743) (not e!337135))))

(declare-fun lt!267912 () SeekEntryResult!6138)

(assert (=> b!590535 (= res!377743 (or (= lt!267912 (MissingZero!6138 i!1108)) (= lt!267912 (MissingVacant!6138 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36853 (_ BitVec 32)) SeekEntryResult!6138)

(assert (=> b!590535 (= lt!267912 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!590536 () Bool)

(assert (=> b!590536 (= e!337139 (= lt!267911 lt!267909))))

(declare-fun b!590537 () Bool)

(assert (=> b!590537 (= e!337135 e!337143)))

(declare-fun res!377736 () Bool)

(assert (=> b!590537 (=> (not res!377736) (not e!337143))))

(assert (=> b!590537 (= res!377736 (= (select (store (arr!17698 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590537 (= lt!267914 (array!36854 (store (arr!17698 a!2986) i!1108 k0!1786) (size!18062 a!2986)))))

(assert (= (and start!54066 res!377745) b!590534))

(assert (= (and b!590534 res!377738) b!590526))

(assert (= (and b!590526 res!377742) b!590531))

(assert (= (and b!590531 res!377734) b!590522))

(assert (= (and b!590522 res!377739) b!590535))

(assert (= (and b!590535 res!377743) b!590530))

(assert (= (and b!590530 res!377746) b!590532))

(assert (= (and b!590532 res!377733) b!590523))

(assert (= (and b!590523 res!377747) b!590537))

(assert (= (and b!590537 res!377736) b!590525))

(assert (= (and b!590525 res!377741) b!590528))

(assert (= (and b!590528 res!377737) b!590536))

(assert (= (and b!590528 c!66761) b!590524))

(assert (= (and b!590528 (not c!66761)) b!590529))

(assert (= (and b!590528 (not res!377740)) b!590533))

(assert (= (and b!590533 res!377735) b!590521))

(assert (= (and b!590521 (not res!377744)) b!590527))

(declare-fun m!568917 () Bool)

(assert (=> b!590523 m!568917))

(declare-fun m!568919 () Bool)

(assert (=> b!590526 m!568919))

(assert (=> b!590526 m!568919))

(declare-fun m!568921 () Bool)

(assert (=> b!590526 m!568921))

(assert (=> b!590521 m!568919))

(declare-fun m!568923 () Bool)

(assert (=> b!590521 m!568923))

(declare-fun m!568925 () Bool)

(assert (=> b!590521 m!568925))

(assert (=> b!590533 m!568919))

(assert (=> b!590533 m!568923))

(assert (=> b!590533 m!568925))

(assert (=> b!590537 m!568923))

(declare-fun m!568927 () Bool)

(assert (=> b!590537 m!568927))

(declare-fun m!568929 () Bool)

(assert (=> b!590535 m!568929))

(declare-fun m!568931 () Bool)

(assert (=> b!590531 m!568931))

(assert (=> b!590527 m!568919))

(assert (=> b!590527 m!568919))

(declare-fun m!568933 () Bool)

(assert (=> b!590527 m!568933))

(declare-fun m!568935 () Bool)

(assert (=> b!590525 m!568935))

(assert (=> b!590525 m!568919))

(assert (=> b!590525 m!568919))

(declare-fun m!568937 () Bool)

(assert (=> b!590525 m!568937))

(declare-fun m!568939 () Bool)

(assert (=> b!590528 m!568939))

(declare-fun m!568941 () Bool)

(assert (=> b!590528 m!568941))

(assert (=> b!590528 m!568923))

(declare-fun m!568943 () Bool)

(assert (=> b!590528 m!568943))

(assert (=> b!590528 m!568919))

(assert (=> b!590528 m!568919))

(declare-fun m!568945 () Bool)

(assert (=> b!590528 m!568945))

(declare-fun m!568947 () Bool)

(assert (=> b!590528 m!568947))

(declare-fun m!568949 () Bool)

(assert (=> b!590528 m!568949))

(declare-fun m!568951 () Bool)

(assert (=> b!590530 m!568951))

(declare-fun m!568953 () Bool)

(assert (=> b!590532 m!568953))

(declare-fun m!568955 () Bool)

(assert (=> start!54066 m!568955))

(declare-fun m!568957 () Bool)

(assert (=> start!54066 m!568957))

(declare-fun m!568959 () Bool)

(assert (=> b!590522 m!568959))

(check-sat (not b!590525) (not b!590528) (not b!590530) (not b!590535) (not start!54066) (not b!590527) (not b!590526) (not b!590532) (not b!590522) (not b!590531))
(check-sat)
