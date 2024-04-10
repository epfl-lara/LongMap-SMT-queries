; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55562 () Bool)

(assert start!55562)

(declare-fun b!607944 () Bool)

(declare-fun e!348165 () Bool)

(declare-fun e!348153 () Bool)

(assert (=> b!607944 (= e!348165 e!348153)))

(declare-fun res!390705 () Bool)

(assert (=> b!607944 (=> (not res!390705) (not e!348153))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37293 0))(
  ( (array!37294 (arr!17897 (Array (_ BitVec 32) (_ BitVec 64))) (size!18261 (_ BitVec 32))) )
))
(declare-fun lt!277651 () array!37293)

(declare-fun a!2986 () array!37293)

(declare-fun arrayContainsKey!0 (array!37293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607944 (= res!390705 (arrayContainsKey!0 lt!277651 (select (arr!17897 a!2986) j!136) j!136))))

(declare-fun b!607945 () Bool)

(declare-fun res!390702 () Bool)

(declare-fun e!348158 () Bool)

(assert (=> b!607945 (=> (not res!390702) (not e!348158))))

(declare-datatypes ((List!11938 0))(
  ( (Nil!11935) (Cons!11934 (h!12979 (_ BitVec 64)) (t!18166 List!11938)) )
))
(declare-fun arrayNoDuplicates!0 (array!37293 (_ BitVec 32) List!11938) Bool)

(assert (=> b!607945 (= res!390702 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11935))))

(declare-fun b!607946 () Bool)

(declare-fun res!390697 () Bool)

(assert (=> b!607946 (=> (not res!390697) (not e!348158))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37293 (_ BitVec 32)) Bool)

(assert (=> b!607946 (= res!390697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!390692 () Bool)

(declare-fun e!348161 () Bool)

(assert (=> start!55562 (=> (not res!390692) (not e!348161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55562 (= res!390692 (validMask!0 mask!3053))))

(assert (=> start!55562 e!348161))

(assert (=> start!55562 true))

(declare-fun array_inv!13693 (array!37293) Bool)

(assert (=> start!55562 (array_inv!13693 a!2986)))

(declare-fun b!607947 () Bool)

(declare-fun e!348154 () Bool)

(declare-fun e!348160 () Bool)

(assert (=> b!607947 (= e!348154 e!348160)))

(declare-fun res!390694 () Bool)

(assert (=> b!607947 (=> res!390694 e!348160)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!607947 (= res!390694 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19402 0))(
  ( (Unit!19403) )
))
(declare-fun lt!277649 () Unit!19402)

(declare-fun e!348162 () Unit!19402)

(assert (=> b!607947 (= lt!277649 e!348162)))

(declare-fun c!68996 () Bool)

(assert (=> b!607947 (= c!68996 (bvslt j!136 index!984))))

(declare-fun b!607948 () Bool)

(declare-fun res!390706 () Bool)

(assert (=> b!607948 (=> (not res!390706) (not e!348161))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607948 (= res!390706 (validKeyInArray!0 k!1786))))

(declare-fun b!607949 () Bool)

(declare-fun e!348163 () Bool)

(assert (=> b!607949 (= e!348158 e!348163)))

(declare-fun res!390690 () Bool)

(assert (=> b!607949 (=> (not res!390690) (not e!348163))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!607949 (= res!390690 (= (select (store (arr!17897 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607949 (= lt!277651 (array!37294 (store (arr!17897 a!2986) i!1108 k!1786) (size!18261 a!2986)))))

(declare-fun b!607950 () Bool)

(declare-fun res!390701 () Bool)

(declare-fun e!348150 () Bool)

(assert (=> b!607950 (=> res!390701 e!348150)))

(declare-fun noDuplicate!320 (List!11938) Bool)

(assert (=> b!607950 (= res!390701 (not (noDuplicate!320 Nil!11935)))))

(declare-fun b!607951 () Bool)

(declare-fun e!348156 () Bool)

(declare-datatypes ((SeekEntryResult!6337 0))(
  ( (MissingZero!6337 (index!27623 (_ BitVec 32))) (Found!6337 (index!27624 (_ BitVec 32))) (Intermediate!6337 (undefined!7149 Bool) (index!27625 (_ BitVec 32)) (x!56430 (_ BitVec 32))) (Undefined!6337) (MissingVacant!6337 (index!27626 (_ BitVec 32))) )
))
(declare-fun lt!277648 () SeekEntryResult!6337)

(declare-fun lt!277644 () SeekEntryResult!6337)

(assert (=> b!607951 (= e!348156 (= lt!277648 lt!277644))))

(declare-fun b!607952 () Bool)

(declare-fun e!348164 () Bool)

(assert (=> b!607952 (= e!348164 e!348165)))

(declare-fun res!390708 () Bool)

(assert (=> b!607952 (=> res!390708 e!348165)))

(declare-fun lt!277650 () (_ BitVec 64))

(declare-fun lt!277641 () (_ BitVec 64))

(assert (=> b!607952 (= res!390708 (or (not (= (select (arr!17897 a!2986) j!136) lt!277641)) (not (= (select (arr!17897 a!2986) j!136) lt!277650)) (bvsge j!136 index!984)))))

(declare-fun b!607953 () Bool)

(declare-fun e!348157 () Bool)

(declare-fun e!348159 () Bool)

(assert (=> b!607953 (= e!348157 (not e!348159))))

(declare-fun res!390691 () Bool)

(assert (=> b!607953 (=> res!390691 e!348159)))

(declare-fun lt!277654 () SeekEntryResult!6337)

(assert (=> b!607953 (= res!390691 (not (= lt!277654 (Found!6337 index!984))))))

(declare-fun lt!277657 () Unit!19402)

(declare-fun e!348151 () Unit!19402)

(assert (=> b!607953 (= lt!277657 e!348151)))

(declare-fun c!68995 () Bool)

(assert (=> b!607953 (= c!68995 (= lt!277654 Undefined!6337))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37293 (_ BitVec 32)) SeekEntryResult!6337)

(assert (=> b!607953 (= lt!277654 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277641 lt!277651 mask!3053))))

(assert (=> b!607953 e!348156))

(declare-fun res!390707 () Bool)

(assert (=> b!607953 (=> (not res!390707) (not e!348156))))

(declare-fun lt!277645 () (_ BitVec 32))

(assert (=> b!607953 (= res!390707 (= lt!277644 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277645 vacantSpotIndex!68 lt!277641 lt!277651 mask!3053)))))

(assert (=> b!607953 (= lt!277644 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277645 vacantSpotIndex!68 (select (arr!17897 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607953 (= lt!277641 (select (store (arr!17897 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277646 () Unit!19402)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37293 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19402)

(assert (=> b!607953 (= lt!277646 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277645 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607953 (= lt!277645 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607954 () Bool)

(declare-fun res!390693 () Bool)

(assert (=> b!607954 (=> (not res!390693) (not e!348158))))

(assert (=> b!607954 (= res!390693 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17897 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607955 () Bool)

(declare-fun res!390698 () Bool)

(assert (=> b!607955 (=> res!390698 e!348150)))

(declare-fun contains!3014 (List!11938 (_ BitVec 64)) Bool)

(assert (=> b!607955 (= res!390698 (contains!3014 Nil!11935 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607956 () Bool)

(assert (=> b!607956 (= e!348159 e!348154)))

(declare-fun res!390689 () Bool)

(assert (=> b!607956 (=> res!390689 e!348154)))

(assert (=> b!607956 (= res!390689 (or (not (= (select (arr!17897 a!2986) j!136) lt!277641)) (not (= (select (arr!17897 a!2986) j!136) lt!277650))))))

(assert (=> b!607956 e!348164))

(declare-fun res!390700 () Bool)

(assert (=> b!607956 (=> (not res!390700) (not e!348164))))

(assert (=> b!607956 (= res!390700 (= lt!277650 (select (arr!17897 a!2986) j!136)))))

(assert (=> b!607956 (= lt!277650 (select (store (arr!17897 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!607957 () Bool)

(declare-fun Unit!19404 () Unit!19402)

(assert (=> b!607957 (= e!348151 Unit!19404)))

(declare-fun e!348152 () Bool)

(declare-fun b!607958 () Bool)

(assert (=> b!607958 (= e!348152 (arrayContainsKey!0 lt!277651 (select (arr!17897 a!2986) j!136) index!984))))

(declare-fun b!607959 () Bool)

(declare-fun Unit!19405 () Unit!19402)

(assert (=> b!607959 (= e!348151 Unit!19405)))

(assert (=> b!607959 false))

(declare-fun b!607960 () Bool)

(assert (=> b!607960 (= e!348163 e!348157)))

(declare-fun res!390710 () Bool)

(assert (=> b!607960 (=> (not res!390710) (not e!348157))))

(assert (=> b!607960 (= res!390710 (and (= lt!277648 (Found!6337 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17897 a!2986) index!984) (select (arr!17897 a!2986) j!136))) (not (= (select (arr!17897 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!607960 (= lt!277648 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17897 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607961 () Bool)

(assert (=> b!607961 (= e!348150 true)))

(declare-fun lt!277652 () Bool)

(assert (=> b!607961 (= lt!277652 (contains!3014 Nil!11935 k!1786))))

(declare-fun b!607962 () Bool)

(assert (=> b!607962 (= e!348160 e!348150)))

(declare-fun res!390704 () Bool)

(assert (=> b!607962 (=> res!390704 e!348150)))

(assert (=> b!607962 (= res!390704 (or (bvsge (size!18261 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18261 a!2986))))))

(assert (=> b!607962 (arrayContainsKey!0 lt!277651 (select (arr!17897 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277655 () Unit!19402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19402)

(assert (=> b!607962 (= lt!277655 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277651 (select (arr!17897 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!607962 e!348152))

(declare-fun res!390688 () Bool)

(assert (=> b!607962 (=> (not res!390688) (not e!348152))))

(assert (=> b!607962 (= res!390688 (arrayContainsKey!0 lt!277651 (select (arr!17897 a!2986) j!136) j!136))))

(declare-fun b!607963 () Bool)

(declare-fun res!390699 () Bool)

(assert (=> b!607963 (=> (not res!390699) (not e!348161))))

(assert (=> b!607963 (= res!390699 (validKeyInArray!0 (select (arr!17897 a!2986) j!136)))))

(declare-fun b!607964 () Bool)

(assert (=> b!607964 (= e!348153 (arrayContainsKey!0 lt!277651 (select (arr!17897 a!2986) j!136) index!984))))

(declare-fun b!607965 () Bool)

(declare-fun res!390696 () Bool)

(assert (=> b!607965 (=> (not res!390696) (not e!348161))))

(assert (=> b!607965 (= res!390696 (and (= (size!18261 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18261 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18261 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607966 () Bool)

(assert (=> b!607966 (= e!348161 e!348158)))

(declare-fun res!390709 () Bool)

(assert (=> b!607966 (=> (not res!390709) (not e!348158))))

(declare-fun lt!277643 () SeekEntryResult!6337)

(assert (=> b!607966 (= res!390709 (or (= lt!277643 (MissingZero!6337 i!1108)) (= lt!277643 (MissingVacant!6337 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37293 (_ BitVec 32)) SeekEntryResult!6337)

(assert (=> b!607966 (= lt!277643 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!607967 () Bool)

(declare-fun Unit!19406 () Unit!19402)

(assert (=> b!607967 (= e!348162 Unit!19406)))

(declare-fun lt!277656 () Unit!19402)

(assert (=> b!607967 (= lt!277656 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277651 (select (arr!17897 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607967 (arrayContainsKey!0 lt!277651 (select (arr!17897 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277642 () Unit!19402)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11938) Unit!19402)

(assert (=> b!607967 (= lt!277642 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11935))))

(assert (=> b!607967 (arrayNoDuplicates!0 lt!277651 #b00000000000000000000000000000000 Nil!11935)))

(declare-fun lt!277647 () Unit!19402)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37293 (_ BitVec 32) (_ BitVec 32)) Unit!19402)

(assert (=> b!607967 (= lt!277647 (lemmaNoDuplicateFromThenFromBigger!0 lt!277651 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607967 (arrayNoDuplicates!0 lt!277651 j!136 Nil!11935)))

(declare-fun lt!277653 () Unit!19402)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37293 (_ BitVec 64) (_ BitVec 32) List!11938) Unit!19402)

(assert (=> b!607967 (= lt!277653 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277651 (select (arr!17897 a!2986) j!136) j!136 Nil!11935))))

(assert (=> b!607967 false))

(declare-fun b!607968 () Bool)

(declare-fun res!390703 () Bool)

(assert (=> b!607968 (=> (not res!390703) (not e!348161))))

(assert (=> b!607968 (= res!390703 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607969 () Bool)

(declare-fun res!390695 () Bool)

(assert (=> b!607969 (=> res!390695 e!348150)))

(assert (=> b!607969 (= res!390695 (contains!3014 Nil!11935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607970 () Bool)

(declare-fun Unit!19407 () Unit!19402)

(assert (=> b!607970 (= e!348162 Unit!19407)))

(assert (= (and start!55562 res!390692) b!607965))

(assert (= (and b!607965 res!390696) b!607963))

(assert (= (and b!607963 res!390699) b!607948))

(assert (= (and b!607948 res!390706) b!607968))

(assert (= (and b!607968 res!390703) b!607966))

(assert (= (and b!607966 res!390709) b!607946))

(assert (= (and b!607946 res!390697) b!607945))

(assert (= (and b!607945 res!390702) b!607954))

(assert (= (and b!607954 res!390693) b!607949))

(assert (= (and b!607949 res!390690) b!607960))

(assert (= (and b!607960 res!390710) b!607953))

(assert (= (and b!607953 res!390707) b!607951))

(assert (= (and b!607953 c!68995) b!607959))

(assert (= (and b!607953 (not c!68995)) b!607957))

(assert (= (and b!607953 (not res!390691)) b!607956))

(assert (= (and b!607956 res!390700) b!607952))

(assert (= (and b!607952 (not res!390708)) b!607944))

(assert (= (and b!607944 res!390705) b!607964))

(assert (= (and b!607956 (not res!390689)) b!607947))

(assert (= (and b!607947 c!68996) b!607967))

(assert (= (and b!607947 (not c!68996)) b!607970))

(assert (= (and b!607947 (not res!390694)) b!607962))

(assert (= (and b!607962 res!390688) b!607958))

(assert (= (and b!607962 (not res!390704)) b!607950))

(assert (= (and b!607950 (not res!390701)) b!607969))

(assert (= (and b!607969 (not res!390695)) b!607955))

(assert (= (and b!607955 (not res!390698)) b!607961))

(declare-fun m!584627 () Bool)

(assert (=> b!607956 m!584627))

(declare-fun m!584629 () Bool)

(assert (=> b!607956 m!584629))

(declare-fun m!584631 () Bool)

(assert (=> b!607956 m!584631))

(declare-fun m!584633 () Bool)

(assert (=> b!607954 m!584633))

(declare-fun m!584635 () Bool)

(assert (=> b!607946 m!584635))

(declare-fun m!584637 () Bool)

(assert (=> b!607967 m!584637))

(assert (=> b!607967 m!584627))

(assert (=> b!607967 m!584627))

(declare-fun m!584639 () Bool)

(assert (=> b!607967 m!584639))

(assert (=> b!607967 m!584627))

(declare-fun m!584641 () Bool)

(assert (=> b!607967 m!584641))

(declare-fun m!584643 () Bool)

(assert (=> b!607967 m!584643))

(declare-fun m!584645 () Bool)

(assert (=> b!607967 m!584645))

(assert (=> b!607967 m!584627))

(declare-fun m!584647 () Bool)

(assert (=> b!607967 m!584647))

(declare-fun m!584649 () Bool)

(assert (=> b!607967 m!584649))

(declare-fun m!584651 () Bool)

(assert (=> b!607945 m!584651))

(declare-fun m!584653 () Bool)

(assert (=> b!607969 m!584653))

(assert (=> b!607944 m!584627))

(assert (=> b!607944 m!584627))

(declare-fun m!584655 () Bool)

(assert (=> b!607944 m!584655))

(declare-fun m!584657 () Bool)

(assert (=> start!55562 m!584657))

(declare-fun m!584659 () Bool)

(assert (=> start!55562 m!584659))

(assert (=> b!607962 m!584627))

(assert (=> b!607962 m!584627))

(declare-fun m!584661 () Bool)

(assert (=> b!607962 m!584661))

(assert (=> b!607962 m!584627))

(declare-fun m!584663 () Bool)

(assert (=> b!607962 m!584663))

(assert (=> b!607962 m!584627))

(assert (=> b!607962 m!584655))

(declare-fun m!584665 () Bool)

(assert (=> b!607955 m!584665))

(assert (=> b!607958 m!584627))

(assert (=> b!607958 m!584627))

(declare-fun m!584667 () Bool)

(assert (=> b!607958 m!584667))

(declare-fun m!584669 () Bool)

(assert (=> b!607961 m!584669))

(declare-fun m!584671 () Bool)

(assert (=> b!607948 m!584671))

(declare-fun m!584673 () Bool)

(assert (=> b!607953 m!584673))

(declare-fun m!584675 () Bool)

(assert (=> b!607953 m!584675))

(assert (=> b!607953 m!584627))

(declare-fun m!584677 () Bool)

(assert (=> b!607953 m!584677))

(assert (=> b!607953 m!584629))

(declare-fun m!584679 () Bool)

(assert (=> b!607953 m!584679))

(declare-fun m!584681 () Bool)

(assert (=> b!607953 m!584681))

(assert (=> b!607953 m!584627))

(declare-fun m!584683 () Bool)

(assert (=> b!607953 m!584683))

(declare-fun m!584685 () Bool)

(assert (=> b!607968 m!584685))

(declare-fun m!584687 () Bool)

(assert (=> b!607966 m!584687))

(declare-fun m!584689 () Bool)

(assert (=> b!607960 m!584689))

(assert (=> b!607960 m!584627))

(assert (=> b!607960 m!584627))

(declare-fun m!584691 () Bool)

(assert (=> b!607960 m!584691))

(declare-fun m!584693 () Bool)

(assert (=> b!607950 m!584693))

(assert (=> b!607964 m!584627))

(assert (=> b!607964 m!584627))

(assert (=> b!607964 m!584667))

(assert (=> b!607949 m!584629))

(declare-fun m!584695 () Bool)

(assert (=> b!607949 m!584695))

(assert (=> b!607952 m!584627))

(assert (=> b!607963 m!584627))

(assert (=> b!607963 m!584627))

(declare-fun m!584697 () Bool)

(assert (=> b!607963 m!584697))

(push 1)

