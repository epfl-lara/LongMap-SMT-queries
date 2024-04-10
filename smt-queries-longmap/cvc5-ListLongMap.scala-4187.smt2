; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57098 () Bool)

(assert start!57098)

(declare-fun b!632037 () Bool)

(declare-fun res!408700 () Bool)

(declare-fun e!361360 () Bool)

(assert (=> b!632037 (=> (not res!408700) (not e!361360))))

(declare-datatypes ((array!38117 0))(
  ( (array!38118 (arr!18291 (Array (_ BitVec 32) (_ BitVec 64))) (size!18655 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38117)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632037 (= res!408700 (validKeyInArray!0 (select (arr!18291 a!2986) j!136)))))

(declare-fun b!632038 () Bool)

(declare-fun e!361355 () Bool)

(assert (=> b!632038 (= e!361360 e!361355)))

(declare-fun res!408691 () Bool)

(assert (=> b!632038 (=> (not res!408691) (not e!361355))))

(declare-datatypes ((SeekEntryResult!6731 0))(
  ( (MissingZero!6731 (index!29217 (_ BitVec 32))) (Found!6731 (index!29218 (_ BitVec 32))) (Intermediate!6731 (undefined!7543 Bool) (index!29219 (_ BitVec 32)) (x!57958 (_ BitVec 32))) (Undefined!6731) (MissingVacant!6731 (index!29220 (_ BitVec 32))) )
))
(declare-fun lt!292049 () SeekEntryResult!6731)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632038 (= res!408691 (or (= lt!292049 (MissingZero!6731 i!1108)) (= lt!292049 (MissingVacant!6731 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38117 (_ BitVec 32)) SeekEntryResult!6731)

(assert (=> b!632038 (= lt!292049 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!632039 () Bool)

(declare-fun res!408695 () Bool)

(assert (=> b!632039 (=> (not res!408695) (not e!361360))))

(declare-fun arrayContainsKey!0 (array!38117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632039 (= res!408695 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632040 () Bool)

(declare-fun res!408696 () Bool)

(assert (=> b!632040 (=> (not res!408696) (not e!361360))))

(assert (=> b!632040 (= res!408696 (and (= (size!18655 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18655 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18655 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632041 () Bool)

(declare-fun e!361358 () Bool)

(declare-fun e!361357 () Bool)

(assert (=> b!632041 (= e!361358 e!361357)))

(declare-fun res!408701 () Bool)

(assert (=> b!632041 (=> (not res!408701) (not e!361357))))

(declare-fun lt!292052 () SeekEntryResult!6731)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632041 (= res!408701 (and (= lt!292052 (Found!6731 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18291 a!2986) index!984) (select (arr!18291 a!2986) j!136))) (not (= (select (arr!18291 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38117 (_ BitVec 32)) SeekEntryResult!6731)

(assert (=> b!632041 (= lt!292052 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18291 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632042 () Bool)

(declare-fun e!361362 () Bool)

(assert (=> b!632042 (= e!361357 (not e!361362))))

(declare-fun res!408694 () Bool)

(assert (=> b!632042 (=> res!408694 e!361362)))

(declare-fun lt!292051 () SeekEntryResult!6731)

(assert (=> b!632042 (= res!408694 (not (= lt!292051 (Found!6731 index!984))))))

(declare-datatypes ((Unit!21258 0))(
  ( (Unit!21259) )
))
(declare-fun lt!292050 () Unit!21258)

(declare-fun e!361356 () Unit!21258)

(assert (=> b!632042 (= lt!292050 e!361356)))

(declare-fun c!72041 () Bool)

(assert (=> b!632042 (= c!72041 (= lt!292051 Undefined!6731))))

(declare-fun lt!292053 () array!38117)

(declare-fun lt!292054 () (_ BitVec 64))

(assert (=> b!632042 (= lt!292051 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292054 lt!292053 mask!3053))))

(declare-fun e!361359 () Bool)

(assert (=> b!632042 e!361359))

(declare-fun res!408697 () Bool)

(assert (=> b!632042 (=> (not res!408697) (not e!361359))))

(declare-fun lt!292056 () SeekEntryResult!6731)

(declare-fun lt!292057 () (_ BitVec 32))

(assert (=> b!632042 (= res!408697 (= lt!292056 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292057 vacantSpotIndex!68 lt!292054 lt!292053 mask!3053)))))

(assert (=> b!632042 (= lt!292056 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292057 vacantSpotIndex!68 (select (arr!18291 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632042 (= lt!292054 (select (store (arr!18291 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292055 () Unit!21258)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38117 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21258)

(assert (=> b!632042 (= lt!292055 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292057 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632042 (= lt!292057 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632043 () Bool)

(assert (=> b!632043 (= e!361359 (= lt!292052 lt!292056))))

(declare-fun b!632044 () Bool)

(declare-fun Unit!21260 () Unit!21258)

(assert (=> b!632044 (= e!361356 Unit!21260)))

(declare-fun b!632045 () Bool)

(declare-fun res!408693 () Bool)

(assert (=> b!632045 (=> (not res!408693) (not e!361355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38117 (_ BitVec 32)) Bool)

(assert (=> b!632045 (= res!408693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632046 () Bool)

(assert (=> b!632046 (= e!361362 true)))

(assert (=> b!632046 (= (select (store (arr!18291 a!2986) i!1108 k!1786) index!984) (select (arr!18291 a!2986) j!136))))

(declare-fun b!632047 () Bool)

(declare-fun Unit!21261 () Unit!21258)

(assert (=> b!632047 (= e!361356 Unit!21261)))

(assert (=> b!632047 false))

(declare-fun res!408690 () Bool)

(assert (=> start!57098 (=> (not res!408690) (not e!361360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57098 (= res!408690 (validMask!0 mask!3053))))

(assert (=> start!57098 e!361360))

(assert (=> start!57098 true))

(declare-fun array_inv!14087 (array!38117) Bool)

(assert (=> start!57098 (array_inv!14087 a!2986)))

(declare-fun b!632048 () Bool)

(declare-fun res!408689 () Bool)

(assert (=> b!632048 (=> (not res!408689) (not e!361355))))

(declare-datatypes ((List!12332 0))(
  ( (Nil!12329) (Cons!12328 (h!13373 (_ BitVec 64)) (t!18560 List!12332)) )
))
(declare-fun arrayNoDuplicates!0 (array!38117 (_ BitVec 32) List!12332) Bool)

(assert (=> b!632048 (= res!408689 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12329))))

(declare-fun b!632049 () Bool)

(declare-fun res!408698 () Bool)

(assert (=> b!632049 (=> (not res!408698) (not e!361360))))

(assert (=> b!632049 (= res!408698 (validKeyInArray!0 k!1786))))

(declare-fun b!632050 () Bool)

(assert (=> b!632050 (= e!361355 e!361358)))

(declare-fun res!408699 () Bool)

(assert (=> b!632050 (=> (not res!408699) (not e!361358))))

(assert (=> b!632050 (= res!408699 (= (select (store (arr!18291 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632050 (= lt!292053 (array!38118 (store (arr!18291 a!2986) i!1108 k!1786) (size!18655 a!2986)))))

(declare-fun b!632051 () Bool)

(declare-fun res!408692 () Bool)

(assert (=> b!632051 (=> (not res!408692) (not e!361355))))

(assert (=> b!632051 (= res!408692 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18291 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!57098 res!408690) b!632040))

(assert (= (and b!632040 res!408696) b!632037))

(assert (= (and b!632037 res!408700) b!632049))

(assert (= (and b!632049 res!408698) b!632039))

(assert (= (and b!632039 res!408695) b!632038))

(assert (= (and b!632038 res!408691) b!632045))

(assert (= (and b!632045 res!408693) b!632048))

(assert (= (and b!632048 res!408689) b!632051))

(assert (= (and b!632051 res!408692) b!632050))

(assert (= (and b!632050 res!408699) b!632041))

(assert (= (and b!632041 res!408701) b!632042))

(assert (= (and b!632042 res!408697) b!632043))

(assert (= (and b!632042 c!72041) b!632047))

(assert (= (and b!632042 (not c!72041)) b!632044))

(assert (= (and b!632042 (not res!408694)) b!632046))

(declare-fun m!606891 () Bool)

(assert (=> b!632046 m!606891))

(declare-fun m!606893 () Bool)

(assert (=> b!632046 m!606893))

(declare-fun m!606895 () Bool)

(assert (=> b!632046 m!606895))

(declare-fun m!606897 () Bool)

(assert (=> b!632039 m!606897))

(declare-fun m!606899 () Bool)

(assert (=> b!632041 m!606899))

(assert (=> b!632041 m!606895))

(assert (=> b!632041 m!606895))

(declare-fun m!606901 () Bool)

(assert (=> b!632041 m!606901))

(declare-fun m!606903 () Bool)

(assert (=> b!632045 m!606903))

(declare-fun m!606905 () Bool)

(assert (=> b!632051 m!606905))

(assert (=> b!632050 m!606891))

(declare-fun m!606907 () Bool)

(assert (=> b!632050 m!606907))

(declare-fun m!606909 () Bool)

(assert (=> b!632038 m!606909))

(declare-fun m!606911 () Bool)

(assert (=> b!632049 m!606911))

(declare-fun m!606913 () Bool)

(assert (=> b!632042 m!606913))

(declare-fun m!606915 () Bool)

(assert (=> b!632042 m!606915))

(assert (=> b!632042 m!606895))

(assert (=> b!632042 m!606891))

(declare-fun m!606917 () Bool)

(assert (=> b!632042 m!606917))

(assert (=> b!632042 m!606895))

(declare-fun m!606919 () Bool)

(assert (=> b!632042 m!606919))

(declare-fun m!606921 () Bool)

(assert (=> b!632042 m!606921))

(declare-fun m!606923 () Bool)

(assert (=> b!632042 m!606923))

(declare-fun m!606925 () Bool)

(assert (=> b!632048 m!606925))

(assert (=> b!632037 m!606895))

(assert (=> b!632037 m!606895))

(declare-fun m!606927 () Bool)

(assert (=> b!632037 m!606927))

(declare-fun m!606929 () Bool)

(assert (=> start!57098 m!606929))

(declare-fun m!606931 () Bool)

(assert (=> start!57098 m!606931))

(push 1)

