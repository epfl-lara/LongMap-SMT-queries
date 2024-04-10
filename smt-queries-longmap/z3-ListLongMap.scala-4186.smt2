; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57094 () Bool)

(assert start!57094)

(declare-fun b!631947 () Bool)

(declare-fun e!361312 () Bool)

(declare-fun e!361311 () Bool)

(assert (=> b!631947 (= e!361312 e!361311)))

(declare-fun res!408616 () Bool)

(assert (=> b!631947 (=> (not res!408616) (not e!361311))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38113 0))(
  ( (array!38114 (arr!18289 (Array (_ BitVec 32) (_ BitVec 64))) (size!18653 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38113)

(assert (=> b!631947 (= res!408616 (= (select (store (arr!18289 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291999 () array!38113)

(assert (=> b!631947 (= lt!291999 (array!38114 (store (arr!18289 a!2986) i!1108 k0!1786) (size!18653 a!2986)))))

(declare-fun b!631948 () Bool)

(declare-datatypes ((Unit!21250 0))(
  ( (Unit!21251) )
))
(declare-fun e!361308 () Unit!21250)

(declare-fun Unit!21252 () Unit!21250)

(assert (=> b!631948 (= e!361308 Unit!21252)))

(assert (=> b!631948 false))

(declare-fun b!631949 () Bool)

(declare-fun res!408622 () Bool)

(assert (=> b!631949 (=> (not res!408622) (not e!361312))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631949 (= res!408622 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18289 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631950 () Bool)

(declare-fun e!361309 () Bool)

(declare-datatypes ((SeekEntryResult!6729 0))(
  ( (MissingZero!6729 (index!29209 (_ BitVec 32))) (Found!6729 (index!29210 (_ BitVec 32))) (Intermediate!6729 (undefined!7541 Bool) (index!29211 (_ BitVec 32)) (x!57948 (_ BitVec 32))) (Undefined!6729) (MissingVacant!6729 (index!29212 (_ BitVec 32))) )
))
(declare-fun lt!292001 () SeekEntryResult!6729)

(declare-fun lt!291995 () SeekEntryResult!6729)

(assert (=> b!631950 (= e!361309 (= lt!292001 lt!291995))))

(declare-fun b!631951 () Bool)

(declare-fun e!361307 () Bool)

(assert (=> b!631951 (= e!361307 e!361312)))

(declare-fun res!408623 () Bool)

(assert (=> b!631951 (=> (not res!408623) (not e!361312))))

(declare-fun lt!292002 () SeekEntryResult!6729)

(assert (=> b!631951 (= res!408623 (or (= lt!292002 (MissingZero!6729 i!1108)) (= lt!292002 (MissingVacant!6729 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38113 (_ BitVec 32)) SeekEntryResult!6729)

(assert (=> b!631951 (= lt!292002 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631952 () Bool)

(declare-fun res!408614 () Bool)

(assert (=> b!631952 (=> (not res!408614) (not e!361307))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!631952 (= res!408614 (and (= (size!18653 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18653 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18653 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631953 () Bool)

(declare-fun res!408613 () Bool)

(assert (=> b!631953 (=> (not res!408613) (not e!361312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38113 (_ BitVec 32)) Bool)

(assert (=> b!631953 (= res!408613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631955 () Bool)

(declare-fun e!361310 () Bool)

(assert (=> b!631955 (= e!361311 e!361310)))

(declare-fun res!408621 () Bool)

(assert (=> b!631955 (=> (not res!408621) (not e!361310))))

(assert (=> b!631955 (= res!408621 (and (= lt!292001 (Found!6729 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18289 a!2986) index!984) (select (arr!18289 a!2986) j!136))) (not (= (select (arr!18289 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38113 (_ BitVec 32)) SeekEntryResult!6729)

(assert (=> b!631955 (= lt!292001 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18289 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631956 () Bool)

(declare-fun Unit!21253 () Unit!21250)

(assert (=> b!631956 (= e!361308 Unit!21253)))

(declare-fun b!631957 () Bool)

(declare-fun res!408619 () Bool)

(assert (=> b!631957 (=> (not res!408619) (not e!361307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631957 (= res!408619 (validKeyInArray!0 k0!1786))))

(declare-fun b!631958 () Bool)

(declare-fun res!408615 () Bool)

(assert (=> b!631958 (=> (not res!408615) (not e!361307))))

(assert (=> b!631958 (= res!408615 (validKeyInArray!0 (select (arr!18289 a!2986) j!136)))))

(declare-fun b!631959 () Bool)

(declare-fun res!408612 () Bool)

(assert (=> b!631959 (=> (not res!408612) (not e!361312))))

(declare-datatypes ((List!12330 0))(
  ( (Nil!12327) (Cons!12326 (h!13371 (_ BitVec 64)) (t!18558 List!12330)) )
))
(declare-fun arrayNoDuplicates!0 (array!38113 (_ BitVec 32) List!12330) Bool)

(assert (=> b!631959 (= res!408612 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12327))))

(declare-fun b!631960 () Bool)

(declare-fun e!361314 () Bool)

(assert (=> b!631960 (= e!361310 (not e!361314))))

(declare-fun res!408618 () Bool)

(assert (=> b!631960 (=> res!408618 e!361314)))

(declare-fun lt!291996 () SeekEntryResult!6729)

(assert (=> b!631960 (= res!408618 (not (= lt!291996 (Found!6729 index!984))))))

(declare-fun lt!291998 () Unit!21250)

(assert (=> b!631960 (= lt!291998 e!361308)))

(declare-fun c!72035 () Bool)

(assert (=> b!631960 (= c!72035 (= lt!291996 Undefined!6729))))

(declare-fun lt!291997 () (_ BitVec 64))

(assert (=> b!631960 (= lt!291996 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291997 lt!291999 mask!3053))))

(assert (=> b!631960 e!361309))

(declare-fun res!408611 () Bool)

(assert (=> b!631960 (=> (not res!408611) (not e!361309))))

(declare-fun lt!292003 () (_ BitVec 32))

(assert (=> b!631960 (= res!408611 (= lt!291995 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292003 vacantSpotIndex!68 lt!291997 lt!291999 mask!3053)))))

(assert (=> b!631960 (= lt!291995 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292003 vacantSpotIndex!68 (select (arr!18289 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631960 (= lt!291997 (select (store (arr!18289 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292000 () Unit!21250)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38113 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21250)

(assert (=> b!631960 (= lt!292000 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292003 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631960 (= lt!292003 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631961 () Bool)

(assert (=> b!631961 (= e!361314 true)))

(assert (=> b!631961 (= (select (store (arr!18289 a!2986) i!1108 k0!1786) index!984) (select (arr!18289 a!2986) j!136))))

(declare-fun b!631954 () Bool)

(declare-fun res!408620 () Bool)

(assert (=> b!631954 (=> (not res!408620) (not e!361307))))

(declare-fun arrayContainsKey!0 (array!38113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631954 (= res!408620 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!408617 () Bool)

(assert (=> start!57094 (=> (not res!408617) (not e!361307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57094 (= res!408617 (validMask!0 mask!3053))))

(assert (=> start!57094 e!361307))

(assert (=> start!57094 true))

(declare-fun array_inv!14085 (array!38113) Bool)

(assert (=> start!57094 (array_inv!14085 a!2986)))

(assert (= (and start!57094 res!408617) b!631952))

(assert (= (and b!631952 res!408614) b!631958))

(assert (= (and b!631958 res!408615) b!631957))

(assert (= (and b!631957 res!408619) b!631954))

(assert (= (and b!631954 res!408620) b!631951))

(assert (= (and b!631951 res!408623) b!631953))

(assert (= (and b!631953 res!408613) b!631959))

(assert (= (and b!631959 res!408612) b!631949))

(assert (= (and b!631949 res!408622) b!631947))

(assert (= (and b!631947 res!408616) b!631955))

(assert (= (and b!631955 res!408621) b!631960))

(assert (= (and b!631960 res!408611) b!631950))

(assert (= (and b!631960 c!72035) b!631948))

(assert (= (and b!631960 (not c!72035)) b!631956))

(assert (= (and b!631960 (not res!408618)) b!631961))

(declare-fun m!606807 () Bool)

(assert (=> b!631947 m!606807))

(declare-fun m!606809 () Bool)

(assert (=> b!631947 m!606809))

(declare-fun m!606811 () Bool)

(assert (=> b!631958 m!606811))

(assert (=> b!631958 m!606811))

(declare-fun m!606813 () Bool)

(assert (=> b!631958 m!606813))

(declare-fun m!606815 () Bool)

(assert (=> start!57094 m!606815))

(declare-fun m!606817 () Bool)

(assert (=> start!57094 m!606817))

(declare-fun m!606819 () Bool)

(assert (=> b!631953 m!606819))

(declare-fun m!606821 () Bool)

(assert (=> b!631955 m!606821))

(assert (=> b!631955 m!606811))

(assert (=> b!631955 m!606811))

(declare-fun m!606823 () Bool)

(assert (=> b!631955 m!606823))

(assert (=> b!631961 m!606807))

(declare-fun m!606825 () Bool)

(assert (=> b!631961 m!606825))

(assert (=> b!631961 m!606811))

(declare-fun m!606827 () Bool)

(assert (=> b!631959 m!606827))

(declare-fun m!606829 () Bool)

(assert (=> b!631960 m!606829))

(declare-fun m!606831 () Bool)

(assert (=> b!631960 m!606831))

(declare-fun m!606833 () Bool)

(assert (=> b!631960 m!606833))

(assert (=> b!631960 m!606811))

(assert (=> b!631960 m!606807))

(declare-fun m!606835 () Bool)

(assert (=> b!631960 m!606835))

(assert (=> b!631960 m!606811))

(declare-fun m!606837 () Bool)

(assert (=> b!631960 m!606837))

(declare-fun m!606839 () Bool)

(assert (=> b!631960 m!606839))

(declare-fun m!606841 () Bool)

(assert (=> b!631951 m!606841))

(declare-fun m!606843 () Bool)

(assert (=> b!631954 m!606843))

(declare-fun m!606845 () Bool)

(assert (=> b!631949 m!606845))

(declare-fun m!606847 () Bool)

(assert (=> b!631957 m!606847))

(check-sat (not b!631959) (not b!631954) (not b!631951) (not b!631958) (not b!631953) (not b!631960) (not b!631957) (not start!57094) (not b!631955))
(check-sat)
