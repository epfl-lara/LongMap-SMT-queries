; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57430 () Bool)

(assert start!57430)

(declare-fun b!635546 () Bool)

(declare-fun e!363516 () Bool)

(declare-fun e!363511 () Bool)

(assert (=> b!635546 (= e!363516 e!363511)))

(declare-fun res!411146 () Bool)

(assert (=> b!635546 (=> (not res!411146) (not e!363511))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38220 0))(
  ( (array!38221 (arr!18337 (Array (_ BitVec 32) (_ BitVec 64))) (size!18701 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38220)

(assert (=> b!635546 (= res!411146 (= (select (store (arr!18337 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293860 () array!38220)

(assert (=> b!635546 (= lt!293860 (array!38221 (store (arr!18337 a!2986) i!1108 k0!1786) (size!18701 a!2986)))))

(declare-fun b!635547 () Bool)

(declare-fun res!411149 () Bool)

(declare-fun e!363506 () Bool)

(assert (=> b!635547 (=> (not res!411149) (not e!363506))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635547 (= res!411149 (validKeyInArray!0 (select (arr!18337 a!2986) j!136)))))

(declare-fun b!635548 () Bool)

(declare-fun res!411145 () Bool)

(assert (=> b!635548 (=> (not res!411145) (not e!363516))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38220 (_ BitVec 32)) Bool)

(assert (=> b!635548 (= res!411145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635549 () Bool)

(declare-fun res!411144 () Bool)

(assert (=> b!635549 (=> (not res!411144) (not e!363506))))

(declare-fun arrayContainsKey!0 (array!38220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635549 (= res!411144 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635550 () Bool)

(declare-datatypes ((Unit!21442 0))(
  ( (Unit!21443) )
))
(declare-fun e!363512 () Unit!21442)

(declare-fun Unit!21444 () Unit!21442)

(assert (=> b!635550 (= e!363512 Unit!21444)))

(assert (=> b!635550 false))

(declare-fun b!635552 () Bool)

(declare-fun res!411138 () Bool)

(assert (=> b!635552 (=> (not res!411138) (not e!363516))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635552 (= res!411138 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18337 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635553 () Bool)

(declare-fun e!363508 () Bool)

(declare-fun e!363509 () Bool)

(assert (=> b!635553 (= e!363508 (not e!363509))))

(declare-fun res!411142 () Bool)

(assert (=> b!635553 (=> res!411142 e!363509)))

(declare-datatypes ((SeekEntryResult!6777 0))(
  ( (MissingZero!6777 (index!29413 (_ BitVec 32))) (Found!6777 (index!29414 (_ BitVec 32))) (Intermediate!6777 (undefined!7589 Bool) (index!29415 (_ BitVec 32)) (x!58160 (_ BitVec 32))) (Undefined!6777) (MissingVacant!6777 (index!29416 (_ BitVec 32))) )
))
(declare-fun lt!293861 () SeekEntryResult!6777)

(assert (=> b!635553 (= res!411142 (not (= lt!293861 (Found!6777 index!984))))))

(declare-fun lt!293865 () Unit!21442)

(assert (=> b!635553 (= lt!293865 e!363512)))

(declare-fun c!72572 () Bool)

(assert (=> b!635553 (= c!72572 (= lt!293861 Undefined!6777))))

(declare-fun lt!293867 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38220 (_ BitVec 32)) SeekEntryResult!6777)

(assert (=> b!635553 (= lt!293861 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293867 lt!293860 mask!3053))))

(declare-fun e!363513 () Bool)

(assert (=> b!635553 e!363513))

(declare-fun res!411152 () Bool)

(assert (=> b!635553 (=> (not res!411152) (not e!363513))))

(declare-fun lt!293868 () (_ BitVec 32))

(declare-fun lt!293862 () SeekEntryResult!6777)

(assert (=> b!635553 (= res!411152 (= lt!293862 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293868 vacantSpotIndex!68 lt!293867 lt!293860 mask!3053)))))

(assert (=> b!635553 (= lt!293862 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293868 vacantSpotIndex!68 (select (arr!18337 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635553 (= lt!293867 (select (store (arr!18337 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293859 () Unit!21442)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38220 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21442)

(assert (=> b!635553 (= lt!293859 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293868 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635553 (= lt!293868 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635554 () Bool)

(declare-fun e!363505 () Bool)

(assert (=> b!635554 (= e!363505 (arrayContainsKey!0 lt!293860 (select (arr!18337 a!2986) j!136) index!984))))

(declare-fun b!635555 () Bool)

(declare-fun e!363515 () Bool)

(declare-fun e!363510 () Bool)

(assert (=> b!635555 (= e!363515 e!363510)))

(declare-fun res!411150 () Bool)

(assert (=> b!635555 (=> res!411150 e!363510)))

(declare-fun lt!293869 () (_ BitVec 64))

(assert (=> b!635555 (= res!411150 (or (not (= (select (arr!18337 a!2986) j!136) lt!293867)) (not (= (select (arr!18337 a!2986) j!136) lt!293869)) (bvsge j!136 index!984)))))

(declare-fun b!635556 () Bool)

(declare-fun res!411140 () Bool)

(assert (=> b!635556 (=> (not res!411140) (not e!363516))))

(declare-datatypes ((List!12378 0))(
  ( (Nil!12375) (Cons!12374 (h!13419 (_ BitVec 64)) (t!18606 List!12378)) )
))
(declare-fun arrayNoDuplicates!0 (array!38220 (_ BitVec 32) List!12378) Bool)

(assert (=> b!635556 (= res!411140 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12375))))

(declare-fun b!635557 () Bool)

(declare-fun e!363507 () Bool)

(assert (=> b!635557 (= e!363509 e!363507)))

(declare-fun res!411136 () Bool)

(assert (=> b!635557 (=> res!411136 e!363507)))

(assert (=> b!635557 (= res!411136 (or (not (= (select (arr!18337 a!2986) j!136) lt!293867)) (not (= (select (arr!18337 a!2986) j!136) lt!293869)) (bvsge j!136 index!984)))))

(assert (=> b!635557 e!363515))

(declare-fun res!411141 () Bool)

(assert (=> b!635557 (=> (not res!411141) (not e!363515))))

(assert (=> b!635557 (= res!411141 (= lt!293869 (select (arr!18337 a!2986) j!136)))))

(assert (=> b!635557 (= lt!293869 (select (store (arr!18337 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!635558 () Bool)

(declare-fun Unit!21445 () Unit!21442)

(assert (=> b!635558 (= e!363512 Unit!21445)))

(declare-fun b!635559 () Bool)

(declare-fun lt!293864 () SeekEntryResult!6777)

(assert (=> b!635559 (= e!363513 (= lt!293864 lt!293862))))

(declare-fun b!635560 () Bool)

(declare-fun res!411147 () Bool)

(assert (=> b!635560 (=> (not res!411147) (not e!363506))))

(assert (=> b!635560 (= res!411147 (validKeyInArray!0 k0!1786))))

(declare-fun b!635551 () Bool)

(declare-fun res!411143 () Bool)

(assert (=> b!635551 (=> (not res!411143) (not e!363506))))

(assert (=> b!635551 (= res!411143 (and (= (size!18701 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18701 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18701 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!411151 () Bool)

(assert (=> start!57430 (=> (not res!411151) (not e!363506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57430 (= res!411151 (validMask!0 mask!3053))))

(assert (=> start!57430 e!363506))

(assert (=> start!57430 true))

(declare-fun array_inv!14133 (array!38220) Bool)

(assert (=> start!57430 (array_inv!14133 a!2986)))

(declare-fun b!635561 () Bool)

(assert (=> b!635561 (= e!363510 e!363505)))

(declare-fun res!411148 () Bool)

(assert (=> b!635561 (=> (not res!411148) (not e!363505))))

(assert (=> b!635561 (= res!411148 (arrayContainsKey!0 lt!293860 (select (arr!18337 a!2986) j!136) j!136))))

(declare-fun b!635562 () Bool)

(assert (=> b!635562 (= e!363507 true)))

(assert (=> b!635562 (arrayContainsKey!0 lt!293860 (select (arr!18337 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293863 () Unit!21442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38220 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21442)

(assert (=> b!635562 (= lt!293863 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293860 (select (arr!18337 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635563 () Bool)

(assert (=> b!635563 (= e!363511 e!363508)))

(declare-fun res!411137 () Bool)

(assert (=> b!635563 (=> (not res!411137) (not e!363508))))

(assert (=> b!635563 (= res!411137 (and (= lt!293864 (Found!6777 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18337 a!2986) index!984) (select (arr!18337 a!2986) j!136))) (not (= (select (arr!18337 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635563 (= lt!293864 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18337 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635564 () Bool)

(assert (=> b!635564 (= e!363506 e!363516)))

(declare-fun res!411139 () Bool)

(assert (=> b!635564 (=> (not res!411139) (not e!363516))))

(declare-fun lt!293866 () SeekEntryResult!6777)

(assert (=> b!635564 (= res!411139 (or (= lt!293866 (MissingZero!6777 i!1108)) (= lt!293866 (MissingVacant!6777 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38220 (_ BitVec 32)) SeekEntryResult!6777)

(assert (=> b!635564 (= lt!293866 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!57430 res!411151) b!635551))

(assert (= (and b!635551 res!411143) b!635547))

(assert (= (and b!635547 res!411149) b!635560))

(assert (= (and b!635560 res!411147) b!635549))

(assert (= (and b!635549 res!411144) b!635564))

(assert (= (and b!635564 res!411139) b!635548))

(assert (= (and b!635548 res!411145) b!635556))

(assert (= (and b!635556 res!411140) b!635552))

(assert (= (and b!635552 res!411138) b!635546))

(assert (= (and b!635546 res!411146) b!635563))

(assert (= (and b!635563 res!411137) b!635553))

(assert (= (and b!635553 res!411152) b!635559))

(assert (= (and b!635553 c!72572) b!635550))

(assert (= (and b!635553 (not c!72572)) b!635558))

(assert (= (and b!635553 (not res!411142)) b!635557))

(assert (= (and b!635557 res!411141) b!635555))

(assert (= (and b!635555 (not res!411150)) b!635561))

(assert (= (and b!635561 res!411148) b!635554))

(assert (= (and b!635557 (not res!411136)) b!635562))

(declare-fun m!609889 () Bool)

(assert (=> b!635561 m!609889))

(assert (=> b!635561 m!609889))

(declare-fun m!609891 () Bool)

(assert (=> b!635561 m!609891))

(assert (=> b!635562 m!609889))

(assert (=> b!635562 m!609889))

(declare-fun m!609893 () Bool)

(assert (=> b!635562 m!609893))

(assert (=> b!635562 m!609889))

(declare-fun m!609895 () Bool)

(assert (=> b!635562 m!609895))

(declare-fun m!609897 () Bool)

(assert (=> b!635563 m!609897))

(assert (=> b!635563 m!609889))

(assert (=> b!635563 m!609889))

(declare-fun m!609899 () Bool)

(assert (=> b!635563 m!609899))

(declare-fun m!609901 () Bool)

(assert (=> b!635556 m!609901))

(declare-fun m!609903 () Bool)

(assert (=> b!635552 m!609903))

(declare-fun m!609905 () Bool)

(assert (=> b!635548 m!609905))

(declare-fun m!609907 () Bool)

(assert (=> b!635564 m!609907))

(assert (=> b!635554 m!609889))

(assert (=> b!635554 m!609889))

(declare-fun m!609909 () Bool)

(assert (=> b!635554 m!609909))

(declare-fun m!609911 () Bool)

(assert (=> start!57430 m!609911))

(declare-fun m!609913 () Bool)

(assert (=> start!57430 m!609913))

(declare-fun m!609915 () Bool)

(assert (=> b!635549 m!609915))

(declare-fun m!609917 () Bool)

(assert (=> b!635560 m!609917))

(declare-fun m!609919 () Bool)

(assert (=> b!635553 m!609919))

(assert (=> b!635553 m!609889))

(declare-fun m!609921 () Bool)

(assert (=> b!635553 m!609921))

(declare-fun m!609923 () Bool)

(assert (=> b!635553 m!609923))

(assert (=> b!635553 m!609889))

(declare-fun m!609925 () Bool)

(assert (=> b!635553 m!609925))

(declare-fun m!609927 () Bool)

(assert (=> b!635553 m!609927))

(declare-fun m!609929 () Bool)

(assert (=> b!635553 m!609929))

(declare-fun m!609931 () Bool)

(assert (=> b!635553 m!609931))

(assert (=> b!635555 m!609889))

(assert (=> b!635547 m!609889))

(assert (=> b!635547 m!609889))

(declare-fun m!609933 () Bool)

(assert (=> b!635547 m!609933))

(assert (=> b!635557 m!609889))

(assert (=> b!635557 m!609921))

(declare-fun m!609935 () Bool)

(assert (=> b!635557 m!609935))

(assert (=> b!635546 m!609921))

(declare-fun m!609937 () Bool)

(assert (=> b!635546 m!609937))

(check-sat (not b!635547) (not b!635556) (not b!635553) (not b!635554) (not start!57430) (not b!635562) (not b!635561) (not b!635549) (not b!635563) (not b!635548) (not b!635560) (not b!635564))
(check-sat)
