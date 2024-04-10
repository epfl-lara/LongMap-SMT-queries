; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54826 () Bool)

(assert start!54826)

(declare-fun b!598637 () Bool)

(declare-fun res!383705 () Bool)

(declare-fun e!342211 () Bool)

(assert (=> b!598637 (=> (not res!383705) (not e!342211))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598637 (= res!383705 (validKeyInArray!0 k!1786))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!342205 () Bool)

(declare-datatypes ((array!37061 0))(
  ( (array!37062 (arr!17790 (Array (_ BitVec 32) (_ BitVec 64))) (size!18154 (_ BitVec 32))) )
))
(declare-fun lt!271994 () array!37061)

(declare-fun b!598638 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37061)

(declare-fun arrayContainsKey!0 (array!37061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598638 (= e!342205 (arrayContainsKey!0 lt!271994 (select (arr!17790 a!2986) j!136) index!984))))

(declare-fun b!598639 () Bool)

(declare-fun res!383697 () Bool)

(declare-fun e!342209 () Bool)

(assert (=> b!598639 (=> (not res!383697) (not e!342209))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37061 (_ BitVec 32)) Bool)

(assert (=> b!598639 (= res!383697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598640 () Bool)

(declare-fun e!342208 () Bool)

(assert (=> b!598640 (= e!342208 true)))

(declare-datatypes ((List!11831 0))(
  ( (Nil!11828) (Cons!11827 (h!12872 (_ BitVec 64)) (t!18059 List!11831)) )
))
(declare-fun arrayNoDuplicates!0 (array!37061 (_ BitVec 32) List!11831) Bool)

(assert (=> b!598640 (arrayNoDuplicates!0 lt!271994 #b00000000000000000000000000000000 Nil!11828)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((Unit!18838 0))(
  ( (Unit!18839) )
))
(declare-fun lt!271993 () Unit!18838)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37061 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11831) Unit!18838)

(assert (=> b!598640 (= lt!271993 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11828))))

(assert (=> b!598640 (arrayContainsKey!0 lt!271994 (select (arr!17790 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271989 () Unit!18838)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37061 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18838)

(assert (=> b!598640 (= lt!271989 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271994 (select (arr!17790 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598641 () Bool)

(declare-fun e!342207 () Unit!18838)

(declare-fun Unit!18840 () Unit!18838)

(assert (=> b!598641 (= e!342207 Unit!18840)))

(assert (=> b!598641 false))

(declare-fun b!598642 () Bool)

(assert (=> b!598642 (= e!342211 e!342209)))

(declare-fun res!383710 () Bool)

(assert (=> b!598642 (=> (not res!383710) (not e!342209))))

(declare-datatypes ((SeekEntryResult!6230 0))(
  ( (MissingZero!6230 (index!27177 (_ BitVec 32))) (Found!6230 (index!27178 (_ BitVec 32))) (Intermediate!6230 (undefined!7042 Bool) (index!27179 (_ BitVec 32)) (x!55989 (_ BitVec 32))) (Undefined!6230) (MissingVacant!6230 (index!27180 (_ BitVec 32))) )
))
(declare-fun lt!271988 () SeekEntryResult!6230)

(assert (=> b!598642 (= res!383710 (or (= lt!271988 (MissingZero!6230 i!1108)) (= lt!271988 (MissingVacant!6230 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37061 (_ BitVec 32)) SeekEntryResult!6230)

(assert (=> b!598642 (= lt!271988 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!598643 () Bool)

(declare-fun res!383702 () Bool)

(assert (=> b!598643 (=> (not res!383702) (not e!342211))))

(assert (=> b!598643 (= res!383702 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598644 () Bool)

(declare-fun res!383706 () Bool)

(assert (=> b!598644 (=> (not res!383706) (not e!342209))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!598644 (= res!383706 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17790 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598645 () Bool)

(declare-fun Unit!18841 () Unit!18838)

(assert (=> b!598645 (= e!342207 Unit!18841)))

(declare-fun b!598646 () Bool)

(declare-fun e!342204 () Bool)

(assert (=> b!598646 (= e!342209 e!342204)))

(declare-fun res!383700 () Bool)

(assert (=> b!598646 (=> (not res!383700) (not e!342204))))

(assert (=> b!598646 (= res!383700 (= (select (store (arr!17790 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598646 (= lt!271994 (array!37062 (store (arr!17790 a!2986) i!1108 k!1786) (size!18154 a!2986)))))

(declare-fun res!383703 () Bool)

(assert (=> start!54826 (=> (not res!383703) (not e!342211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54826 (= res!383703 (validMask!0 mask!3053))))

(assert (=> start!54826 e!342211))

(assert (=> start!54826 true))

(declare-fun array_inv!13586 (array!37061) Bool)

(assert (=> start!54826 (array_inv!13586 a!2986)))

(declare-fun b!598647 () Bool)

(declare-fun res!383708 () Bool)

(assert (=> b!598647 (=> (not res!383708) (not e!342209))))

(assert (=> b!598647 (= res!383708 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11828))))

(declare-fun b!598648 () Bool)

(declare-fun e!342206 () Bool)

(declare-fun lt!271998 () SeekEntryResult!6230)

(declare-fun lt!271995 () SeekEntryResult!6230)

(assert (=> b!598648 (= e!342206 (= lt!271998 lt!271995))))

(declare-fun b!598649 () Bool)

(declare-fun e!342213 () Bool)

(declare-fun e!342203 () Bool)

(assert (=> b!598649 (= e!342213 e!342203)))

(declare-fun res!383698 () Bool)

(assert (=> b!598649 (=> res!383698 e!342203)))

(declare-fun lt!271997 () (_ BitVec 64))

(declare-fun lt!271992 () (_ BitVec 64))

(assert (=> b!598649 (= res!383698 (or (not (= (select (arr!17790 a!2986) j!136) lt!271997)) (not (= (select (arr!17790 a!2986) j!136) lt!271992)) (bvsge j!136 index!984)))))

(declare-fun b!598650 () Bool)

(declare-fun e!342212 () Bool)

(assert (=> b!598650 (= e!342212 e!342208)))

(declare-fun res!383711 () Bool)

(assert (=> b!598650 (=> res!383711 e!342208)))

(assert (=> b!598650 (= res!383711 (or (not (= (select (arr!17790 a!2986) j!136) lt!271997)) (not (= (select (arr!17790 a!2986) j!136) lt!271992)) (bvsge j!136 index!984)))))

(assert (=> b!598650 e!342213))

(declare-fun res!383709 () Bool)

(assert (=> b!598650 (=> (not res!383709) (not e!342213))))

(assert (=> b!598650 (= res!383709 (= lt!271992 (select (arr!17790 a!2986) j!136)))))

(assert (=> b!598650 (= lt!271992 (select (store (arr!17790 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!598651 () Bool)

(assert (=> b!598651 (= e!342203 e!342205)))

(declare-fun res!383707 () Bool)

(assert (=> b!598651 (=> (not res!383707) (not e!342205))))

(assert (=> b!598651 (= res!383707 (arrayContainsKey!0 lt!271994 (select (arr!17790 a!2986) j!136) j!136))))

(declare-fun b!598652 () Bool)

(declare-fun res!383699 () Bool)

(assert (=> b!598652 (=> (not res!383699) (not e!342211))))

(assert (=> b!598652 (= res!383699 (validKeyInArray!0 (select (arr!17790 a!2986) j!136)))))

(declare-fun b!598653 () Bool)

(declare-fun e!342210 () Bool)

(assert (=> b!598653 (= e!342204 e!342210)))

(declare-fun res!383696 () Bool)

(assert (=> b!598653 (=> (not res!383696) (not e!342210))))

(assert (=> b!598653 (= res!383696 (and (= lt!271998 (Found!6230 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17790 a!2986) index!984) (select (arr!17790 a!2986) j!136))) (not (= (select (arr!17790 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37061 (_ BitVec 32)) SeekEntryResult!6230)

(assert (=> b!598653 (= lt!271998 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17790 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598654 () Bool)

(declare-fun res!383695 () Bool)

(assert (=> b!598654 (=> (not res!383695) (not e!342211))))

(assert (=> b!598654 (= res!383695 (and (= (size!18154 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18154 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18154 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598655 () Bool)

(assert (=> b!598655 (= e!342210 (not e!342212))))

(declare-fun res!383704 () Bool)

(assert (=> b!598655 (=> res!383704 e!342212)))

(declare-fun lt!271991 () SeekEntryResult!6230)

(assert (=> b!598655 (= res!383704 (not (= lt!271991 (Found!6230 index!984))))))

(declare-fun lt!271996 () Unit!18838)

(assert (=> b!598655 (= lt!271996 e!342207)))

(declare-fun c!67838 () Bool)

(assert (=> b!598655 (= c!67838 (= lt!271991 Undefined!6230))))

(assert (=> b!598655 (= lt!271991 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271997 lt!271994 mask!3053))))

(assert (=> b!598655 e!342206))

(declare-fun res!383701 () Bool)

(assert (=> b!598655 (=> (not res!383701) (not e!342206))))

(declare-fun lt!271999 () (_ BitVec 32))

(assert (=> b!598655 (= res!383701 (= lt!271995 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271999 vacantSpotIndex!68 lt!271997 lt!271994 mask!3053)))))

(assert (=> b!598655 (= lt!271995 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271999 vacantSpotIndex!68 (select (arr!17790 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!598655 (= lt!271997 (select (store (arr!17790 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!271990 () Unit!18838)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37061 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18838)

(assert (=> b!598655 (= lt!271990 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271999 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598655 (= lt!271999 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54826 res!383703) b!598654))

(assert (= (and b!598654 res!383695) b!598652))

(assert (= (and b!598652 res!383699) b!598637))

(assert (= (and b!598637 res!383705) b!598643))

(assert (= (and b!598643 res!383702) b!598642))

(assert (= (and b!598642 res!383710) b!598639))

(assert (= (and b!598639 res!383697) b!598647))

(assert (= (and b!598647 res!383708) b!598644))

(assert (= (and b!598644 res!383706) b!598646))

(assert (= (and b!598646 res!383700) b!598653))

(assert (= (and b!598653 res!383696) b!598655))

(assert (= (and b!598655 res!383701) b!598648))

(assert (= (and b!598655 c!67838) b!598641))

(assert (= (and b!598655 (not c!67838)) b!598645))

(assert (= (and b!598655 (not res!383704)) b!598650))

(assert (= (and b!598650 res!383709) b!598649))

(assert (= (and b!598649 (not res!383698)) b!598651))

(assert (= (and b!598651 res!383707) b!598638))

(assert (= (and b!598650 (not res!383711)) b!598640))

(declare-fun m!575933 () Bool)

(assert (=> b!598647 m!575933))

(declare-fun m!575935 () Bool)

(assert (=> b!598644 m!575935))

(declare-fun m!575937 () Bool)

(assert (=> b!598639 m!575937))

(declare-fun m!575939 () Bool)

(assert (=> start!54826 m!575939))

(declare-fun m!575941 () Bool)

(assert (=> start!54826 m!575941))

(declare-fun m!575943 () Bool)

(assert (=> b!598651 m!575943))

(assert (=> b!598651 m!575943))

(declare-fun m!575945 () Bool)

(assert (=> b!598651 m!575945))

(declare-fun m!575947 () Bool)

(assert (=> b!598640 m!575947))

(assert (=> b!598640 m!575943))

(assert (=> b!598640 m!575943))

(declare-fun m!575949 () Bool)

(assert (=> b!598640 m!575949))

(assert (=> b!598640 m!575943))

(declare-fun m!575951 () Bool)

(assert (=> b!598640 m!575951))

(declare-fun m!575953 () Bool)

(assert (=> b!598640 m!575953))

(assert (=> b!598638 m!575943))

(assert (=> b!598638 m!575943))

(declare-fun m!575955 () Bool)

(assert (=> b!598638 m!575955))

(declare-fun m!575957 () Bool)

(assert (=> b!598655 m!575957))

(declare-fun m!575959 () Bool)

(assert (=> b!598655 m!575959))

(assert (=> b!598655 m!575943))

(declare-fun m!575961 () Bool)

(assert (=> b!598655 m!575961))

(assert (=> b!598655 m!575943))

(declare-fun m!575963 () Bool)

(assert (=> b!598655 m!575963))

(declare-fun m!575965 () Bool)

(assert (=> b!598655 m!575965))

(declare-fun m!575967 () Bool)

(assert (=> b!598655 m!575967))

(declare-fun m!575969 () Bool)

(assert (=> b!598655 m!575969))

(assert (=> b!598649 m!575943))

(assert (=> b!598650 m!575943))

(assert (=> b!598650 m!575961))

(declare-fun m!575971 () Bool)

(assert (=> b!598650 m!575971))

(assert (=> b!598652 m!575943))

(assert (=> b!598652 m!575943))

(declare-fun m!575973 () Bool)

(assert (=> b!598652 m!575973))

(declare-fun m!575975 () Bool)

(assert (=> b!598637 m!575975))

(declare-fun m!575977 () Bool)

(assert (=> b!598642 m!575977))

(assert (=> b!598646 m!575961))

(declare-fun m!575979 () Bool)

(assert (=> b!598646 m!575979))

(declare-fun m!575981 () Bool)

(assert (=> b!598643 m!575981))

(declare-fun m!575983 () Bool)

(assert (=> b!598653 m!575983))

(assert (=> b!598653 m!575943))

(assert (=> b!598653 m!575943))

(declare-fun m!575985 () Bool)

(assert (=> b!598653 m!575985))

(push 1)

