; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57702 () Bool)

(assert start!57702)

(declare-fun res!412830 () Bool)

(declare-fun e!365044 () Bool)

(assert (=> start!57702 (=> (not res!412830) (not e!365044))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57702 (= res!412830 (validMask!0 mask!3053))))

(assert (=> start!57702 e!365044))

(assert (=> start!57702 true))

(declare-datatypes ((array!38273 0))(
  ( (array!38274 (arr!18359 (Array (_ BitVec 32) (_ BitVec 64))) (size!18723 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38273)

(declare-fun array_inv!14155 (array!38273) Bool)

(assert (=> start!57702 (array_inv!14155 a!2986)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!637948 () Bool)

(declare-fun e!365040 () Bool)

(declare-fun lt!294997 () array!38273)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637948 (= e!365040 (arrayContainsKey!0 lt!294997 (select (arr!18359 a!2986) j!136) index!984))))

(declare-fun b!637949 () Bool)

(declare-fun res!412832 () Bool)

(declare-fun e!365045 () Bool)

(assert (=> b!637949 (=> (not res!412832) (not e!365045))))

(declare-datatypes ((List!12400 0))(
  ( (Nil!12397) (Cons!12396 (h!13441 (_ BitVec 64)) (t!18628 List!12400)) )
))
(declare-fun arrayNoDuplicates!0 (array!38273 (_ BitVec 32) List!12400) Bool)

(assert (=> b!637949 (= res!412832 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12397))))

(declare-fun b!637950 () Bool)

(declare-fun res!412815 () Bool)

(assert (=> b!637950 (=> (not res!412815) (not e!365044))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!637950 (= res!412815 (and (= (size!18723 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18723 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18723 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637951 () Bool)

(declare-fun res!412827 () Bool)

(assert (=> b!637951 (=> (not res!412827) (not e!365044))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637951 (= res!412827 (validKeyInArray!0 k!1786))))

(declare-fun b!637952 () Bool)

(declare-fun res!412813 () Bool)

(assert (=> b!637952 (=> (not res!412813) (not e!365045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38273 (_ BitVec 32)) Bool)

(assert (=> b!637952 (= res!412813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637953 () Bool)

(declare-fun res!412812 () Bool)

(assert (=> b!637953 (=> (not res!412812) (not e!365045))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!637953 (= res!412812 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18359 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637954 () Bool)

(declare-fun res!412822 () Bool)

(assert (=> b!637954 (=> (not res!412822) (not e!365044))))

(assert (=> b!637954 (= res!412822 (validKeyInArray!0 (select (arr!18359 a!2986) j!136)))))

(declare-fun b!637955 () Bool)

(declare-fun e!365039 () Bool)

(declare-fun e!365035 () Bool)

(assert (=> b!637955 (= e!365039 e!365035)))

(declare-fun res!412820 () Bool)

(assert (=> b!637955 (=> (not res!412820) (not e!365035))))

(declare-datatypes ((SeekEntryResult!6799 0))(
  ( (MissingZero!6799 (index!29510 (_ BitVec 32))) (Found!6799 (index!29511 (_ BitVec 32))) (Intermediate!6799 (undefined!7611 Bool) (index!29512 (_ BitVec 32)) (x!58265 (_ BitVec 32))) (Undefined!6799) (MissingVacant!6799 (index!29513 (_ BitVec 32))) )
))
(declare-fun lt!294998 () SeekEntryResult!6799)

(assert (=> b!637955 (= res!412820 (and (= lt!294998 (Found!6799 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18359 a!2986) index!984) (select (arr!18359 a!2986) j!136))) (not (= (select (arr!18359 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38273 (_ BitVec 32)) SeekEntryResult!6799)

(assert (=> b!637955 (= lt!294998 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18359 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637956 () Bool)

(assert (=> b!637956 (= e!365045 e!365039)))

(declare-fun res!412814 () Bool)

(assert (=> b!637956 (=> (not res!412814) (not e!365039))))

(assert (=> b!637956 (= res!412814 (= (select (store (arr!18359 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637956 (= lt!294997 (array!38274 (store (arr!18359 a!2986) i!1108 k!1786) (size!18723 a!2986)))))

(declare-fun b!637957 () Bool)

(declare-fun e!365037 () Bool)

(declare-fun e!365036 () Bool)

(assert (=> b!637957 (= e!365037 e!365036)))

(declare-fun res!412824 () Bool)

(assert (=> b!637957 (=> res!412824 e!365036)))

(declare-fun lt!294994 () (_ BitVec 64))

(declare-fun lt!294989 () (_ BitVec 64))

(assert (=> b!637957 (= res!412824 (or (not (= (select (arr!18359 a!2986) j!136) lt!294994)) (not (= (select (arr!18359 a!2986) j!136) lt!294989)) (bvsge j!136 index!984)))))

(declare-fun b!637958 () Bool)

(declare-fun e!365034 () Bool)

(assert (=> b!637958 (= e!365035 (not e!365034))))

(declare-fun res!412828 () Bool)

(assert (=> b!637958 (=> res!412828 e!365034)))

(declare-fun lt!294993 () SeekEntryResult!6799)

(assert (=> b!637958 (= res!412828 (not (= lt!294993 (Found!6799 index!984))))))

(declare-datatypes ((Unit!21530 0))(
  ( (Unit!21531) )
))
(declare-fun lt!294992 () Unit!21530)

(declare-fun e!365043 () Unit!21530)

(assert (=> b!637958 (= lt!294992 e!365043)))

(declare-fun c!72935 () Bool)

(assert (=> b!637958 (= c!72935 (= lt!294993 Undefined!6799))))

(assert (=> b!637958 (= lt!294993 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294994 lt!294997 mask!3053))))

(declare-fun e!365041 () Bool)

(assert (=> b!637958 e!365041))

(declare-fun res!412831 () Bool)

(assert (=> b!637958 (=> (not res!412831) (not e!365041))))

(declare-fun lt!294999 () SeekEntryResult!6799)

(declare-fun lt!294990 () (_ BitVec 32))

(assert (=> b!637958 (= res!412831 (= lt!294999 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294990 vacantSpotIndex!68 lt!294994 lt!294997 mask!3053)))))

(assert (=> b!637958 (= lt!294999 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294990 vacantSpotIndex!68 (select (arr!18359 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637958 (= lt!294994 (select (store (arr!18359 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!294991 () Unit!21530)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21530)

(assert (=> b!637958 (= lt!294991 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294990 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637958 (= lt!294990 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637959 () Bool)

(declare-fun res!412826 () Bool)

(declare-fun e!365046 () Bool)

(assert (=> b!637959 (=> res!412826 e!365046)))

(declare-fun contains!3114 (List!12400 (_ BitVec 64)) Bool)

(assert (=> b!637959 (= res!412826 (contains!3114 Nil!12397 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637960 () Bool)

(declare-fun e!365038 () Bool)

(assert (=> b!637960 (= e!365038 e!365046)))

(declare-fun res!412821 () Bool)

(assert (=> b!637960 (=> res!412821 e!365046)))

(assert (=> b!637960 (= res!412821 (or (bvsge (size!18723 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18723 a!2986))))))

(assert (=> b!637960 (arrayContainsKey!0 lt!294997 (select (arr!18359 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294996 () Unit!21530)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38273 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21530)

(assert (=> b!637960 (= lt!294996 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294997 (select (arr!18359 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637961 () Bool)

(assert (=> b!637961 (= e!365036 e!365040)))

(declare-fun res!412823 () Bool)

(assert (=> b!637961 (=> (not res!412823) (not e!365040))))

(assert (=> b!637961 (= res!412823 (arrayContainsKey!0 lt!294997 (select (arr!18359 a!2986) j!136) j!136))))

(declare-fun b!637962 () Bool)

(declare-fun Unit!21532 () Unit!21530)

(assert (=> b!637962 (= e!365043 Unit!21532)))

(assert (=> b!637962 false))

(declare-fun b!637963 () Bool)

(assert (=> b!637963 (= e!365044 e!365045)))

(declare-fun res!412829 () Bool)

(assert (=> b!637963 (=> (not res!412829) (not e!365045))))

(declare-fun lt!295000 () SeekEntryResult!6799)

(assert (=> b!637963 (= res!412829 (or (= lt!295000 (MissingZero!6799 i!1108)) (= lt!295000 (MissingVacant!6799 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38273 (_ BitVec 32)) SeekEntryResult!6799)

(assert (=> b!637963 (= lt!295000 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!637964 () Bool)

(declare-fun res!412817 () Bool)

(assert (=> b!637964 (=> res!412817 e!365046)))

(assert (=> b!637964 (= res!412817 (contains!3114 Nil!12397 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637965 () Bool)

(declare-fun res!412819 () Bool)

(assert (=> b!637965 (=> (not res!412819) (not e!365044))))

(assert (=> b!637965 (= res!412819 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637966 () Bool)

(assert (=> b!637966 (= e!365034 e!365038)))

(declare-fun res!412825 () Bool)

(assert (=> b!637966 (=> res!412825 e!365038)))

(assert (=> b!637966 (= res!412825 (or (not (= (select (arr!18359 a!2986) j!136) lt!294994)) (not (= (select (arr!18359 a!2986) j!136) lt!294989)) (bvsge j!136 index!984)))))

(assert (=> b!637966 e!365037))

(declare-fun res!412816 () Bool)

(assert (=> b!637966 (=> (not res!412816) (not e!365037))))

(assert (=> b!637966 (= res!412816 (= lt!294989 (select (arr!18359 a!2986) j!136)))))

(assert (=> b!637966 (= lt!294989 (select (store (arr!18359 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!637967 () Bool)

(assert (=> b!637967 (= e!365046 true)))

(declare-fun lt!294995 () Bool)

(assert (=> b!637967 (= lt!294995 (contains!3114 Nil!12397 k!1786))))

(declare-fun b!637968 () Bool)

(assert (=> b!637968 (= e!365041 (= lt!294998 lt!294999))))

(declare-fun b!637969 () Bool)

(declare-fun Unit!21533 () Unit!21530)

(assert (=> b!637969 (= e!365043 Unit!21533)))

(declare-fun b!637970 () Bool)

(declare-fun res!412818 () Bool)

(assert (=> b!637970 (=> res!412818 e!365046)))

(declare-fun noDuplicate!392 (List!12400) Bool)

(assert (=> b!637970 (= res!412818 (not (noDuplicate!392 Nil!12397)))))

(assert (= (and start!57702 res!412830) b!637950))

(assert (= (and b!637950 res!412815) b!637954))

(assert (= (and b!637954 res!412822) b!637951))

(assert (= (and b!637951 res!412827) b!637965))

(assert (= (and b!637965 res!412819) b!637963))

(assert (= (and b!637963 res!412829) b!637952))

(assert (= (and b!637952 res!412813) b!637949))

(assert (= (and b!637949 res!412832) b!637953))

(assert (= (and b!637953 res!412812) b!637956))

(assert (= (and b!637956 res!412814) b!637955))

(assert (= (and b!637955 res!412820) b!637958))

(assert (= (and b!637958 res!412831) b!637968))

(assert (= (and b!637958 c!72935) b!637962))

(assert (= (and b!637958 (not c!72935)) b!637969))

(assert (= (and b!637958 (not res!412828)) b!637966))

(assert (= (and b!637966 res!412816) b!637957))

(assert (= (and b!637957 (not res!412824)) b!637961))

(assert (= (and b!637961 res!412823) b!637948))

(assert (= (and b!637966 (not res!412825)) b!637960))

(assert (= (and b!637960 (not res!412821)) b!637970))

(assert (= (and b!637970 (not res!412818)) b!637964))

(assert (= (and b!637964 (not res!412817)) b!637959))

(assert (= (and b!637959 (not res!412826)) b!637967))

(declare-fun m!611947 () Bool)

(assert (=> b!637952 m!611947))

(declare-fun m!611949 () Bool)

(assert (=> b!637959 m!611949))

(declare-fun m!611951 () Bool)

(assert (=> b!637954 m!611951))

(assert (=> b!637954 m!611951))

(declare-fun m!611953 () Bool)

(assert (=> b!637954 m!611953))

(declare-fun m!611955 () Bool)

(assert (=> b!637964 m!611955))

(declare-fun m!611957 () Bool)

(assert (=> b!637951 m!611957))

(assert (=> b!637966 m!611951))

(declare-fun m!611959 () Bool)

(assert (=> b!637966 m!611959))

(declare-fun m!611961 () Bool)

(assert (=> b!637966 m!611961))

(declare-fun m!611963 () Bool)

(assert (=> b!637953 m!611963))

(assert (=> b!637957 m!611951))

(assert (=> b!637961 m!611951))

(assert (=> b!637961 m!611951))

(declare-fun m!611965 () Bool)

(assert (=> b!637961 m!611965))

(assert (=> b!637948 m!611951))

(assert (=> b!637948 m!611951))

(declare-fun m!611967 () Bool)

(assert (=> b!637948 m!611967))

(declare-fun m!611969 () Bool)

(assert (=> b!637958 m!611969))

(declare-fun m!611971 () Bool)

(assert (=> b!637958 m!611971))

(assert (=> b!637958 m!611959))

(declare-fun m!611973 () Bool)

(assert (=> b!637958 m!611973))

(assert (=> b!637958 m!611951))

(declare-fun m!611975 () Bool)

(assert (=> b!637958 m!611975))

(declare-fun m!611977 () Bool)

(assert (=> b!637958 m!611977))

(declare-fun m!611979 () Bool)

(assert (=> b!637958 m!611979))

(assert (=> b!637958 m!611951))

(declare-fun m!611981 () Bool)

(assert (=> b!637967 m!611981))

(declare-fun m!611983 () Bool)

(assert (=> b!637970 m!611983))

(assert (=> b!637960 m!611951))

(assert (=> b!637960 m!611951))

(declare-fun m!611985 () Bool)

(assert (=> b!637960 m!611985))

(assert (=> b!637960 m!611951))

(declare-fun m!611987 () Bool)

(assert (=> b!637960 m!611987))

(declare-fun m!611989 () Bool)

(assert (=> b!637965 m!611989))

(declare-fun m!611991 () Bool)

(assert (=> b!637949 m!611991))

(declare-fun m!611993 () Bool)

(assert (=> start!57702 m!611993))

(declare-fun m!611995 () Bool)

(assert (=> start!57702 m!611995))

(assert (=> b!637956 m!611959))

(declare-fun m!611997 () Bool)

(assert (=> b!637956 m!611997))

(declare-fun m!611999 () Bool)

(assert (=> b!637955 m!611999))

(assert (=> b!637955 m!611951))

(assert (=> b!637955 m!611951))

(declare-fun m!612001 () Bool)

(assert (=> b!637955 m!612001))

(declare-fun m!612003 () Bool)

(assert (=> b!637963 m!612003))

(push 1)

(assert (not b!637967))

(assert (not b!637970))

(assert (not b!637951))

(assert (not start!57702))

(assert (not b!637964))

(assert (not b!637958))

(assert (not b!637954))

(assert (not b!637949))

(assert (not b!637960))

(assert (not b!637952))

(assert (not b!637959))

(assert (not b!637965))

(assert (not b!637963))

(assert (not b!637948))

(assert (not b!637955))

(assert (not b!637961))

(check-sat)

(pop 1)

(push 1)

