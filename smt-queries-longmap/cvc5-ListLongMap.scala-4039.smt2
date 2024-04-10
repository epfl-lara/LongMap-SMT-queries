; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55108 () Bool)

(assert start!55108)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!344880 () Bool)

(declare-fun b!602926 () Bool)

(declare-datatypes ((array!37181 0))(
  ( (array!37182 (arr!17847 (Array (_ BitVec 32) (_ BitVec 64))) (size!18211 (_ BitVec 32))) )
))
(declare-fun lt!274662 () array!37181)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37181)

(declare-fun arrayContainsKey!0 (array!37181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602926 (= e!344880 (arrayContainsKey!0 lt!274662 (select (arr!17847 a!2986) j!136) index!984))))

(declare-fun b!602927 () Bool)

(declare-fun res!387120 () Bool)

(declare-fun e!344871 () Bool)

(assert (=> b!602927 (=> (not res!387120) (not e!344871))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!602927 (= res!387120 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602928 () Bool)

(declare-fun e!344877 () Bool)

(declare-fun e!344867 () Bool)

(assert (=> b!602928 (= e!344877 e!344867)))

(declare-fun res!387127 () Bool)

(assert (=> b!602928 (=> res!387127 e!344867)))

(declare-fun lt!274661 () (_ BitVec 64))

(declare-fun lt!274672 () (_ BitVec 64))

(assert (=> b!602928 (= res!387127 (or (not (= (select (arr!17847 a!2986) j!136) lt!274672)) (not (= (select (arr!17847 a!2986) j!136) lt!274661)) (bvsge j!136 index!984)))))

(declare-fun b!602929 () Bool)

(declare-fun e!344878 () Bool)

(declare-datatypes ((SeekEntryResult!6287 0))(
  ( (MissingZero!6287 (index!27411 (_ BitVec 32))) (Found!6287 (index!27412 (_ BitVec 32))) (Intermediate!6287 (undefined!7099 Bool) (index!27413 (_ BitVec 32)) (x!56216 (_ BitVec 32))) (Undefined!6287) (MissingVacant!6287 (index!27414 (_ BitVec 32))) )
))
(declare-fun lt!274665 () SeekEntryResult!6287)

(declare-fun lt!274659 () SeekEntryResult!6287)

(assert (=> b!602929 (= e!344878 (= lt!274665 lt!274659))))

(declare-fun b!602930 () Bool)

(declare-fun e!344868 () Bool)

(declare-fun e!344869 () Bool)

(assert (=> b!602930 (= e!344868 e!344869)))

(declare-fun res!387116 () Bool)

(assert (=> b!602930 (=> res!387116 e!344869)))

(assert (=> b!602930 (= res!387116 (or (not (= (select (arr!17847 a!2986) j!136) lt!274672)) (not (= (select (arr!17847 a!2986) j!136) lt!274661))))))

(assert (=> b!602930 e!344877))

(declare-fun res!387119 () Bool)

(assert (=> b!602930 (=> (not res!387119) (not e!344877))))

(assert (=> b!602930 (= res!387119 (= lt!274661 (select (arr!17847 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!602930 (= lt!274661 (select (store (arr!17847 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!602932 () Bool)

(declare-fun res!387128 () Bool)

(assert (=> b!602932 (=> (not res!387128) (not e!344871))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!602932 (= res!387128 (and (= (size!18211 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18211 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18211 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602933 () Bool)

(declare-fun res!387115 () Bool)

(declare-fun e!344870 () Bool)

(assert (=> b!602933 (=> (not res!387115) (not e!344870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37181 (_ BitVec 32)) Bool)

(assert (=> b!602933 (= res!387115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602934 () Bool)

(declare-fun e!344872 () Bool)

(assert (=> b!602934 (= e!344872 true)))

(declare-fun e!344879 () Bool)

(assert (=> b!602934 e!344879))

(declare-fun res!387122 () Bool)

(assert (=> b!602934 (=> (not res!387122) (not e!344879))))

(assert (=> b!602934 (= res!387122 (arrayContainsKey!0 lt!274662 (select (arr!17847 a!2986) j!136) j!136))))

(declare-fun b!602935 () Bool)

(assert (=> b!602935 (= e!344867 e!344880)))

(declare-fun res!387117 () Bool)

(assert (=> b!602935 (=> (not res!387117) (not e!344880))))

(assert (=> b!602935 (= res!387117 (arrayContainsKey!0 lt!274662 (select (arr!17847 a!2986) j!136) j!136))))

(declare-fun b!602936 () Bool)

(declare-fun res!387118 () Bool)

(assert (=> b!602936 (=> (not res!387118) (not e!344871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602936 (= res!387118 (validKeyInArray!0 k!1786))))

(declare-fun b!602937 () Bool)

(declare-datatypes ((Unit!19102 0))(
  ( (Unit!19103) )
))
(declare-fun e!344873 () Unit!19102)

(declare-fun Unit!19104 () Unit!19102)

(assert (=> b!602937 (= e!344873 Unit!19104)))

(declare-fun b!602938 () Bool)

(declare-fun e!344866 () Unit!19102)

(declare-fun Unit!19105 () Unit!19102)

(assert (=> b!602938 (= e!344866 Unit!19105)))

(declare-fun lt!274670 () Unit!19102)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37181 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19102)

(assert (=> b!602938 (= lt!274670 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274662 (select (arr!17847 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602938 (arrayContainsKey!0 lt!274662 (select (arr!17847 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274666 () Unit!19102)

(declare-datatypes ((List!11888 0))(
  ( (Nil!11885) (Cons!11884 (h!12929 (_ BitVec 64)) (t!18116 List!11888)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37181 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11888) Unit!19102)

(assert (=> b!602938 (= lt!274666 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11885))))

(declare-fun arrayNoDuplicates!0 (array!37181 (_ BitVec 32) List!11888) Bool)

(assert (=> b!602938 (arrayNoDuplicates!0 lt!274662 #b00000000000000000000000000000000 Nil!11885)))

(declare-fun lt!274671 () Unit!19102)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37181 (_ BitVec 32) (_ BitVec 32)) Unit!19102)

(assert (=> b!602938 (= lt!274671 (lemmaNoDuplicateFromThenFromBigger!0 lt!274662 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602938 (arrayNoDuplicates!0 lt!274662 j!136 Nil!11885)))

(declare-fun lt!274658 () Unit!19102)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37181 (_ BitVec 64) (_ BitVec 32) List!11888) Unit!19102)

(assert (=> b!602938 (= lt!274658 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274662 (select (arr!17847 a!2986) j!136) j!136 Nil!11885))))

(assert (=> b!602938 false))

(declare-fun b!602939 () Bool)

(assert (=> b!602939 (= e!344879 (arrayContainsKey!0 lt!274662 (select (arr!17847 a!2986) j!136) index!984))))

(declare-fun b!602940 () Bool)

(declare-fun e!344876 () Bool)

(assert (=> b!602940 (= e!344870 e!344876)))

(declare-fun res!387123 () Bool)

(assert (=> b!602940 (=> (not res!387123) (not e!344876))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!602940 (= res!387123 (= (select (store (arr!17847 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602940 (= lt!274662 (array!37182 (store (arr!17847 a!2986) i!1108 k!1786) (size!18211 a!2986)))))

(declare-fun b!602941 () Bool)

(declare-fun Unit!19106 () Unit!19102)

(assert (=> b!602941 (= e!344873 Unit!19106)))

(assert (=> b!602941 false))

(declare-fun b!602942 () Bool)

(declare-fun res!387126 () Bool)

(assert (=> b!602942 (=> (not res!387126) (not e!344871))))

(assert (=> b!602942 (= res!387126 (validKeyInArray!0 (select (arr!17847 a!2986) j!136)))))

(declare-fun b!602943 () Bool)

(declare-fun e!344874 () Bool)

(assert (=> b!602943 (= e!344876 e!344874)))

(declare-fun res!387111 () Bool)

(assert (=> b!602943 (=> (not res!387111) (not e!344874))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!602943 (= res!387111 (and (= lt!274665 (Found!6287 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17847 a!2986) index!984) (select (arr!17847 a!2986) j!136))) (not (= (select (arr!17847 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37181 (_ BitVec 32)) SeekEntryResult!6287)

(assert (=> b!602943 (= lt!274665 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17847 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602944 () Bool)

(declare-fun res!387125 () Bool)

(assert (=> b!602944 (=> (not res!387125) (not e!344870))))

(assert (=> b!602944 (= res!387125 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11885))))

(declare-fun b!602945 () Bool)

(assert (=> b!602945 (= e!344874 (not e!344868))))

(declare-fun res!387110 () Bool)

(assert (=> b!602945 (=> res!387110 e!344868)))

(declare-fun lt!274660 () SeekEntryResult!6287)

(assert (=> b!602945 (= res!387110 (not (= lt!274660 (Found!6287 index!984))))))

(declare-fun lt!274667 () Unit!19102)

(assert (=> b!602945 (= lt!274667 e!344873)))

(declare-fun c!68276 () Bool)

(assert (=> b!602945 (= c!68276 (= lt!274660 Undefined!6287))))

(assert (=> b!602945 (= lt!274660 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274672 lt!274662 mask!3053))))

(assert (=> b!602945 e!344878))

(declare-fun res!387124 () Bool)

(assert (=> b!602945 (=> (not res!387124) (not e!344878))))

(declare-fun lt!274669 () (_ BitVec 32))

(assert (=> b!602945 (= res!387124 (= lt!274659 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274669 vacantSpotIndex!68 lt!274672 lt!274662 mask!3053)))))

(assert (=> b!602945 (= lt!274659 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274669 vacantSpotIndex!68 (select (arr!17847 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602945 (= lt!274672 (select (store (arr!17847 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!274668 () Unit!19102)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37181 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19102)

(assert (=> b!602945 (= lt!274668 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274669 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602945 (= lt!274669 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602946 () Bool)

(assert (=> b!602946 (= e!344871 e!344870)))

(declare-fun res!387113 () Bool)

(assert (=> b!602946 (=> (not res!387113) (not e!344870))))

(declare-fun lt!274663 () SeekEntryResult!6287)

(assert (=> b!602946 (= res!387113 (or (= lt!274663 (MissingZero!6287 i!1108)) (= lt!274663 (MissingVacant!6287 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37181 (_ BitVec 32)) SeekEntryResult!6287)

(assert (=> b!602946 (= lt!274663 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!387121 () Bool)

(assert (=> start!55108 (=> (not res!387121) (not e!344871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55108 (= res!387121 (validMask!0 mask!3053))))

(assert (=> start!55108 e!344871))

(assert (=> start!55108 true))

(declare-fun array_inv!13643 (array!37181) Bool)

(assert (=> start!55108 (array_inv!13643 a!2986)))

(declare-fun b!602931 () Bool)

(assert (=> b!602931 (= e!344869 e!344872)))

(declare-fun res!387114 () Bool)

(assert (=> b!602931 (=> res!387114 e!344872)))

(assert (=> b!602931 (= res!387114 (bvsge index!984 j!136))))

(declare-fun lt!274664 () Unit!19102)

(assert (=> b!602931 (= lt!274664 e!344866)))

(declare-fun c!68275 () Bool)

(assert (=> b!602931 (= c!68275 (bvslt j!136 index!984))))

(declare-fun b!602947 () Bool)

(declare-fun Unit!19107 () Unit!19102)

(assert (=> b!602947 (= e!344866 Unit!19107)))

(declare-fun b!602948 () Bool)

(declare-fun res!387112 () Bool)

(assert (=> b!602948 (=> (not res!387112) (not e!344870))))

(assert (=> b!602948 (= res!387112 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17847 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!55108 res!387121) b!602932))

(assert (= (and b!602932 res!387128) b!602942))

(assert (= (and b!602942 res!387126) b!602936))

(assert (= (and b!602936 res!387118) b!602927))

(assert (= (and b!602927 res!387120) b!602946))

(assert (= (and b!602946 res!387113) b!602933))

(assert (= (and b!602933 res!387115) b!602944))

(assert (= (and b!602944 res!387125) b!602948))

(assert (= (and b!602948 res!387112) b!602940))

(assert (= (and b!602940 res!387123) b!602943))

(assert (= (and b!602943 res!387111) b!602945))

(assert (= (and b!602945 res!387124) b!602929))

(assert (= (and b!602945 c!68276) b!602941))

(assert (= (and b!602945 (not c!68276)) b!602937))

(assert (= (and b!602945 (not res!387110)) b!602930))

(assert (= (and b!602930 res!387119) b!602928))

(assert (= (and b!602928 (not res!387127)) b!602935))

(assert (= (and b!602935 res!387117) b!602926))

(assert (= (and b!602930 (not res!387116)) b!602931))

(assert (= (and b!602931 c!68275) b!602938))

(assert (= (and b!602931 (not c!68275)) b!602947))

(assert (= (and b!602931 (not res!387114)) b!602934))

(assert (= (and b!602934 res!387122) b!602939))

(declare-fun m!580013 () Bool)

(assert (=> b!602936 m!580013))

(declare-fun m!580015 () Bool)

(assert (=> b!602943 m!580015))

(declare-fun m!580017 () Bool)

(assert (=> b!602943 m!580017))

(assert (=> b!602943 m!580017))

(declare-fun m!580019 () Bool)

(assert (=> b!602943 m!580019))

(declare-fun m!580021 () Bool)

(assert (=> b!602940 m!580021))

(declare-fun m!580023 () Bool)

(assert (=> b!602940 m!580023))

(declare-fun m!580025 () Bool)

(assert (=> b!602927 m!580025))

(assert (=> b!602934 m!580017))

(assert (=> b!602934 m!580017))

(declare-fun m!580027 () Bool)

(assert (=> b!602934 m!580027))

(assert (=> b!602926 m!580017))

(assert (=> b!602926 m!580017))

(declare-fun m!580029 () Bool)

(assert (=> b!602926 m!580029))

(assert (=> b!602942 m!580017))

(assert (=> b!602942 m!580017))

(declare-fun m!580031 () Bool)

(assert (=> b!602942 m!580031))

(assert (=> b!602939 m!580017))

(assert (=> b!602939 m!580017))

(assert (=> b!602939 m!580029))

(assert (=> b!602935 m!580017))

(assert (=> b!602935 m!580017))

(assert (=> b!602935 m!580027))

(assert (=> b!602930 m!580017))

(assert (=> b!602930 m!580021))

(declare-fun m!580033 () Bool)

(assert (=> b!602930 m!580033))

(declare-fun m!580035 () Bool)

(assert (=> start!55108 m!580035))

(declare-fun m!580037 () Bool)

(assert (=> start!55108 m!580037))

(declare-fun m!580039 () Bool)

(assert (=> b!602946 m!580039))

(declare-fun m!580041 () Bool)

(assert (=> b!602944 m!580041))

(declare-fun m!580043 () Bool)

(assert (=> b!602945 m!580043))

(declare-fun m!580045 () Bool)

(assert (=> b!602945 m!580045))

(declare-fun m!580047 () Bool)

(assert (=> b!602945 m!580047))

(declare-fun m!580049 () Bool)

(assert (=> b!602945 m!580049))

(assert (=> b!602945 m!580017))

(assert (=> b!602945 m!580017))

(declare-fun m!580051 () Bool)

(assert (=> b!602945 m!580051))

(assert (=> b!602945 m!580021))

(declare-fun m!580053 () Bool)

(assert (=> b!602945 m!580053))

(declare-fun m!580055 () Bool)

(assert (=> b!602948 m!580055))

(assert (=> b!602928 m!580017))

(assert (=> b!602938 m!580017))

(declare-fun m!580057 () Bool)

(assert (=> b!602938 m!580057))

(assert (=> b!602938 m!580017))

(declare-fun m!580059 () Bool)

(assert (=> b!602938 m!580059))

(assert (=> b!602938 m!580017))

(declare-fun m!580061 () Bool)

(assert (=> b!602938 m!580061))

(declare-fun m!580063 () Bool)

(assert (=> b!602938 m!580063))

(declare-fun m!580065 () Bool)

(assert (=> b!602938 m!580065))

(declare-fun m!580067 () Bool)

(assert (=> b!602938 m!580067))

(assert (=> b!602938 m!580017))

(declare-fun m!580069 () Bool)

(assert (=> b!602938 m!580069))

(declare-fun m!580071 () Bool)

(assert (=> b!602933 m!580071))

(push 1)

