; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57408 () Bool)

(assert start!57408)

(declare-fun b!635083 () Bool)

(declare-fun e!363208 () Bool)

(declare-fun e!363206 () Bool)

(assert (=> b!635083 (= e!363208 (not e!363206))))

(declare-fun res!410808 () Bool)

(assert (=> b!635083 (=> res!410808 e!363206)))

(declare-datatypes ((SeekEntryResult!6721 0))(
  ( (MissingZero!6721 (index!29186 (_ BitVec 32))) (Found!6721 (index!29187 (_ BitVec 32))) (Intermediate!6721 (undefined!7533 Bool) (index!29188 (_ BitVec 32)) (x!58082 (_ BitVec 32))) (Undefined!6721) (MissingVacant!6721 (index!29189 (_ BitVec 32))) )
))
(declare-fun lt!293623 () SeekEntryResult!6721)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635083 (= res!410808 (not (= lt!293623 (Found!6721 index!984))))))

(declare-datatypes ((Unit!21393 0))(
  ( (Unit!21394) )
))
(declare-fun lt!293620 () Unit!21393)

(declare-fun e!363216 () Unit!21393)

(assert (=> b!635083 (= lt!293620 e!363216)))

(declare-fun c!72509 () Bool)

(assert (=> b!635083 (= c!72509 (= lt!293623 Undefined!6721))))

(declare-fun lt!293616 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38199 0))(
  ( (array!38200 (arr!18325 (Array (_ BitVec 32) (_ BitVec 64))) (size!18689 (_ BitVec 32))) )
))
(declare-fun lt!293621 () array!38199)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38199 (_ BitVec 32)) SeekEntryResult!6721)

(assert (=> b!635083 (= lt!293623 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293616 lt!293621 mask!3053))))

(declare-fun e!363210 () Bool)

(assert (=> b!635083 e!363210))

(declare-fun res!410805 () Bool)

(assert (=> b!635083 (=> (not res!410805) (not e!363210))))

(declare-fun lt!293617 () SeekEntryResult!6721)

(declare-fun lt!293619 () (_ BitVec 32))

(assert (=> b!635083 (= res!410805 (= lt!293617 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293619 vacantSpotIndex!68 lt!293616 lt!293621 mask!3053)))))

(declare-fun a!2986 () array!38199)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!635083 (= lt!293617 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293619 vacantSpotIndex!68 (select (arr!18325 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!635083 (= lt!293616 (select (store (arr!18325 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293622 () Unit!21393)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38199 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21393)

(assert (=> b!635083 (= lt!293622 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293619 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635083 (= lt!293619 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!635084 () Bool)

(declare-fun e!363215 () Bool)

(declare-fun e!363211 () Bool)

(assert (=> b!635084 (= e!363215 e!363211)))

(declare-fun res!410815 () Bool)

(assert (=> b!635084 (=> res!410815 e!363211)))

(declare-fun lt!293615 () (_ BitVec 64))

(assert (=> b!635084 (= res!410815 (or (not (= (select (arr!18325 a!2986) j!136) lt!293616)) (not (= (select (arr!18325 a!2986) j!136) lt!293615)) (bvsge j!136 index!984)))))

(declare-fun b!635085 () Bool)

(declare-fun res!410811 () Bool)

(declare-fun e!363214 () Bool)

(assert (=> b!635085 (=> (not res!410811) (not e!363214))))

(declare-datatypes ((List!12273 0))(
  ( (Nil!12270) (Cons!12269 (h!13317 (_ BitVec 64)) (t!18493 List!12273)) )
))
(declare-fun arrayNoDuplicates!0 (array!38199 (_ BitVec 32) List!12273) Bool)

(assert (=> b!635085 (= res!410811 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12270))))

(declare-fun b!635086 () Bool)

(declare-fun e!363213 () Bool)

(assert (=> b!635086 (= e!363213 true)))

(declare-fun arrayContainsKey!0 (array!38199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635086 (arrayContainsKey!0 lt!293621 (select (arr!18325 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293614 () Unit!21393)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38199 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21393)

(assert (=> b!635086 (= lt!293614 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293621 (select (arr!18325 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635087 () Bool)

(declare-fun res!410816 () Bool)

(assert (=> b!635087 (=> (not res!410816) (not e!363214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38199 (_ BitVec 32)) Bool)

(assert (=> b!635087 (= res!410816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635088 () Bool)

(declare-fun e!363207 () Bool)

(assert (=> b!635088 (= e!363207 e!363214)))

(declare-fun res!410813 () Bool)

(assert (=> b!635088 (=> (not res!410813) (not e!363214))))

(declare-fun lt!293613 () SeekEntryResult!6721)

(assert (=> b!635088 (= res!410813 (or (= lt!293613 (MissingZero!6721 i!1108)) (= lt!293613 (MissingVacant!6721 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38199 (_ BitVec 32)) SeekEntryResult!6721)

(assert (=> b!635088 (= lt!293613 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!635089 () Bool)

(declare-fun res!410810 () Bool)

(assert (=> b!635089 (=> (not res!410810) (not e!363207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635089 (= res!410810 (validKeyInArray!0 (select (arr!18325 a!2986) j!136)))))

(declare-fun b!635090 () Bool)

(declare-fun e!363209 () Bool)

(assert (=> b!635090 (= e!363209 e!363208)))

(declare-fun res!410809 () Bool)

(assert (=> b!635090 (=> (not res!410809) (not e!363208))))

(declare-fun lt!293618 () SeekEntryResult!6721)

(assert (=> b!635090 (= res!410809 (and (= lt!293618 (Found!6721 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18325 a!2986) index!984) (select (arr!18325 a!2986) j!136))) (not (= (select (arr!18325 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635090 (= lt!293618 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18325 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!410802 () Bool)

(assert (=> start!57408 (=> (not res!410802) (not e!363207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57408 (= res!410802 (validMask!0 mask!3053))))

(assert (=> start!57408 e!363207))

(assert (=> start!57408 true))

(declare-fun array_inv!14184 (array!38199) Bool)

(assert (=> start!57408 (array_inv!14184 a!2986)))

(declare-fun b!635091 () Bool)

(declare-fun res!410804 () Bool)

(assert (=> b!635091 (=> (not res!410804) (not e!363214))))

(assert (=> b!635091 (= res!410804 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18325 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635092 () Bool)

(declare-fun Unit!21395 () Unit!21393)

(assert (=> b!635092 (= e!363216 Unit!21395)))

(assert (=> b!635092 false))

(declare-fun b!635093 () Bool)

(assert (=> b!635093 (= e!363214 e!363209)))

(declare-fun res!410818 () Bool)

(assert (=> b!635093 (=> (not res!410818) (not e!363209))))

(assert (=> b!635093 (= res!410818 (= (select (store (arr!18325 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635093 (= lt!293621 (array!38200 (store (arr!18325 a!2986) i!1108 k0!1786) (size!18689 a!2986)))))

(declare-fun b!635094 () Bool)

(declare-fun e!363205 () Bool)

(assert (=> b!635094 (= e!363211 e!363205)))

(declare-fun res!410817 () Bool)

(assert (=> b!635094 (=> (not res!410817) (not e!363205))))

(assert (=> b!635094 (= res!410817 (arrayContainsKey!0 lt!293621 (select (arr!18325 a!2986) j!136) j!136))))

(declare-fun b!635095 () Bool)

(declare-fun res!410806 () Bool)

(assert (=> b!635095 (=> (not res!410806) (not e!363207))))

(assert (=> b!635095 (= res!410806 (validKeyInArray!0 k0!1786))))

(declare-fun b!635096 () Bool)

(assert (=> b!635096 (= e!363206 e!363213)))

(declare-fun res!410812 () Bool)

(assert (=> b!635096 (=> res!410812 e!363213)))

(assert (=> b!635096 (= res!410812 (or (not (= (select (arr!18325 a!2986) j!136) lt!293616)) (not (= (select (arr!18325 a!2986) j!136) lt!293615)) (bvsge j!136 index!984)))))

(assert (=> b!635096 e!363215))

(declare-fun res!410814 () Bool)

(assert (=> b!635096 (=> (not res!410814) (not e!363215))))

(assert (=> b!635096 (= res!410814 (= lt!293615 (select (arr!18325 a!2986) j!136)))))

(assert (=> b!635096 (= lt!293615 (select (store (arr!18325 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!635097 () Bool)

(assert (=> b!635097 (= e!363205 (arrayContainsKey!0 lt!293621 (select (arr!18325 a!2986) j!136) index!984))))

(declare-fun b!635098 () Bool)

(declare-fun res!410807 () Bool)

(assert (=> b!635098 (=> (not res!410807) (not e!363207))))

(assert (=> b!635098 (= res!410807 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635099 () Bool)

(assert (=> b!635099 (= e!363210 (= lt!293618 lt!293617))))

(declare-fun b!635100 () Bool)

(declare-fun Unit!21396 () Unit!21393)

(assert (=> b!635100 (= e!363216 Unit!21396)))

(declare-fun b!635101 () Bool)

(declare-fun res!410803 () Bool)

(assert (=> b!635101 (=> (not res!410803) (not e!363207))))

(assert (=> b!635101 (= res!410803 (and (= (size!18689 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18689 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18689 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!57408 res!410802) b!635101))

(assert (= (and b!635101 res!410803) b!635089))

(assert (= (and b!635089 res!410810) b!635095))

(assert (= (and b!635095 res!410806) b!635098))

(assert (= (and b!635098 res!410807) b!635088))

(assert (= (and b!635088 res!410813) b!635087))

(assert (= (and b!635087 res!410816) b!635085))

(assert (= (and b!635085 res!410811) b!635091))

(assert (= (and b!635091 res!410804) b!635093))

(assert (= (and b!635093 res!410818) b!635090))

(assert (= (and b!635090 res!410809) b!635083))

(assert (= (and b!635083 res!410805) b!635099))

(assert (= (and b!635083 c!72509) b!635092))

(assert (= (and b!635083 (not c!72509)) b!635100))

(assert (= (and b!635083 (not res!410808)) b!635096))

(assert (= (and b!635096 res!410814) b!635084))

(assert (= (and b!635084 (not res!410815)) b!635094))

(assert (= (and b!635094 res!410817) b!635097))

(assert (= (and b!635096 (not res!410812)) b!635086))

(declare-fun m!609859 () Bool)

(assert (=> b!635097 m!609859))

(assert (=> b!635097 m!609859))

(declare-fun m!609861 () Bool)

(assert (=> b!635097 m!609861))

(declare-fun m!609863 () Bool)

(assert (=> b!635085 m!609863))

(assert (=> b!635086 m!609859))

(assert (=> b!635086 m!609859))

(declare-fun m!609865 () Bool)

(assert (=> b!635086 m!609865))

(assert (=> b!635086 m!609859))

(declare-fun m!609867 () Bool)

(assert (=> b!635086 m!609867))

(declare-fun m!609869 () Bool)

(assert (=> b!635087 m!609869))

(assert (=> b!635089 m!609859))

(assert (=> b!635089 m!609859))

(declare-fun m!609871 () Bool)

(assert (=> b!635089 m!609871))

(declare-fun m!609873 () Bool)

(assert (=> b!635095 m!609873))

(declare-fun m!609875 () Bool)

(assert (=> b!635083 m!609875))

(declare-fun m!609877 () Bool)

(assert (=> b!635083 m!609877))

(assert (=> b!635083 m!609859))

(declare-fun m!609879 () Bool)

(assert (=> b!635083 m!609879))

(declare-fun m!609881 () Bool)

(assert (=> b!635083 m!609881))

(assert (=> b!635083 m!609859))

(declare-fun m!609883 () Bool)

(assert (=> b!635083 m!609883))

(declare-fun m!609885 () Bool)

(assert (=> b!635083 m!609885))

(declare-fun m!609887 () Bool)

(assert (=> b!635083 m!609887))

(declare-fun m!609889 () Bool)

(assert (=> b!635091 m!609889))

(declare-fun m!609891 () Bool)

(assert (=> start!57408 m!609891))

(declare-fun m!609893 () Bool)

(assert (=> start!57408 m!609893))

(assert (=> b!635093 m!609879))

(declare-fun m!609895 () Bool)

(assert (=> b!635093 m!609895))

(assert (=> b!635096 m!609859))

(assert (=> b!635096 m!609879))

(declare-fun m!609897 () Bool)

(assert (=> b!635096 m!609897))

(declare-fun m!609899 () Bool)

(assert (=> b!635098 m!609899))

(assert (=> b!635094 m!609859))

(assert (=> b!635094 m!609859))

(declare-fun m!609901 () Bool)

(assert (=> b!635094 m!609901))

(declare-fun m!609903 () Bool)

(assert (=> b!635088 m!609903))

(declare-fun m!609905 () Bool)

(assert (=> b!635090 m!609905))

(assert (=> b!635090 m!609859))

(assert (=> b!635090 m!609859))

(declare-fun m!609907 () Bool)

(assert (=> b!635090 m!609907))

(assert (=> b!635084 m!609859))

(check-sat (not b!635098) (not b!635083) (not b!635089) (not b!635090) (not b!635086) (not b!635085) (not start!57408) (not b!635088) (not b!635087) (not b!635097) (not b!635094) (not b!635095))
(check-sat)
