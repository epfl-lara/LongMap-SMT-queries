; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54568 () Bool)

(assert start!54568)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!341056 () Bool)

(declare-fun b!596921 () Bool)

(declare-datatypes ((array!37028 0))(
  ( (array!37029 (arr!17778 (Array (_ BitVec 32) (_ BitVec 64))) (size!18142 (_ BitVec 32))) )
))
(declare-fun lt!271174 () array!37028)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37028)

(declare-fun arrayContainsKey!0 (array!37028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596921 (= e!341056 (arrayContainsKey!0 lt!271174 (select (arr!17778 a!2986) j!136) index!984))))

(declare-fun res!382679 () Bool)

(declare-fun e!341055 () Bool)

(assert (=> start!54568 (=> (not res!382679) (not e!341055))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54568 (= res!382679 (validMask!0 mask!3053))))

(assert (=> start!54568 e!341055))

(assert (=> start!54568 true))

(declare-fun array_inv!13574 (array!37028) Bool)

(assert (=> start!54568 (array_inv!13574 a!2986)))

(declare-fun b!596922 () Bool)

(declare-fun res!382674 () Bool)

(assert (=> b!596922 (=> (not res!382674) (not e!341055))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596922 (= res!382674 (and (= (size!18142 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18142 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18142 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596923 () Bool)

(declare-fun e!341062 () Bool)

(declare-fun e!341059 () Bool)

(assert (=> b!596923 (= e!341062 e!341059)))

(declare-fun res!382665 () Bool)

(assert (=> b!596923 (=> (not res!382665) (not e!341059))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6218 0))(
  ( (MissingZero!6218 (index!27120 (_ BitVec 32))) (Found!6218 (index!27121 (_ BitVec 32))) (Intermediate!6218 (undefined!7030 Bool) (index!27122 (_ BitVec 32)) (x!55918 (_ BitVec 32))) (Undefined!6218) (MissingVacant!6218 (index!27123 (_ BitVec 32))) )
))
(declare-fun lt!271177 () SeekEntryResult!6218)

(assert (=> b!596923 (= res!382665 (and (= lt!271177 (Found!6218 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17778 a!2986) index!984) (select (arr!17778 a!2986) j!136))) (not (= (select (arr!17778 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37028 (_ BitVec 32)) SeekEntryResult!6218)

(assert (=> b!596923 (= lt!271177 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17778 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596924 () Bool)

(declare-fun res!382676 () Bool)

(declare-fun e!341057 () Bool)

(assert (=> b!596924 (=> (not res!382676) (not e!341057))))

(assert (=> b!596924 (= res!382676 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17778 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596925 () Bool)

(declare-fun res!382668 () Bool)

(assert (=> b!596925 (=> (not res!382668) (not e!341055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596925 (= res!382668 (validKeyInArray!0 (select (arr!17778 a!2986) j!136)))))

(declare-fun b!596926 () Bool)

(declare-fun e!341063 () Bool)

(declare-fun e!341053 () Bool)

(assert (=> b!596926 (= e!341063 e!341053)))

(declare-fun res!382664 () Bool)

(assert (=> b!596926 (=> res!382664 e!341053)))

(declare-fun lt!271166 () (_ BitVec 64))

(declare-fun lt!271173 () (_ BitVec 64))

(assert (=> b!596926 (= res!382664 (or (not (= (select (arr!17778 a!2986) j!136) lt!271166)) (not (= (select (arr!17778 a!2986) j!136) lt!271173)) (bvsge j!136 index!984)))))

(declare-fun b!596927 () Bool)

(assert (=> b!596927 (= e!341055 e!341057)))

(declare-fun res!382672 () Bool)

(assert (=> b!596927 (=> (not res!382672) (not e!341057))))

(declare-fun lt!271169 () SeekEntryResult!6218)

(assert (=> b!596927 (= res!382672 (or (= lt!271169 (MissingZero!6218 i!1108)) (= lt!271169 (MissingVacant!6218 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37028 (_ BitVec 32)) SeekEntryResult!6218)

(assert (=> b!596927 (= lt!271169 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!596928 () Bool)

(declare-fun res!382678 () Bool)

(assert (=> b!596928 (=> (not res!382678) (not e!341057))))

(declare-datatypes ((List!11819 0))(
  ( (Nil!11816) (Cons!11815 (h!12860 (_ BitVec 64)) (t!18047 List!11819)) )
))
(declare-fun arrayNoDuplicates!0 (array!37028 (_ BitVec 32) List!11819) Bool)

(assert (=> b!596928 (= res!382678 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11816))))

(declare-fun b!596929 () Bool)

(declare-fun e!341058 () Bool)

(assert (=> b!596929 (= e!341058 (or (bvsgt #b00000000000000000000000000000000 (size!18142 a!2986)) (bvslt (size!18142 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!596929 (arrayNoDuplicates!0 lt!271174 #b00000000000000000000000000000000 Nil!11816)))

(declare-datatypes ((Unit!18790 0))(
  ( (Unit!18791) )
))
(declare-fun lt!271170 () Unit!18790)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37028 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11819) Unit!18790)

(assert (=> b!596929 (= lt!271170 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11816))))

(assert (=> b!596929 (arrayContainsKey!0 lt!271174 (select (arr!17778 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271172 () Unit!18790)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37028 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18790)

(assert (=> b!596929 (= lt!271172 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271174 (select (arr!17778 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596930 () Bool)

(declare-fun e!341061 () Bool)

(assert (=> b!596930 (= e!341061 e!341058)))

(declare-fun res!382673 () Bool)

(assert (=> b!596930 (=> res!382673 e!341058)))

(assert (=> b!596930 (= res!382673 (or (not (= (select (arr!17778 a!2986) j!136) lt!271166)) (not (= (select (arr!17778 a!2986) j!136) lt!271173)) (bvsge j!136 index!984)))))

(assert (=> b!596930 e!341063))

(declare-fun res!382671 () Bool)

(assert (=> b!596930 (=> (not res!382671) (not e!341063))))

(assert (=> b!596930 (= res!382671 (= lt!271173 (select (arr!17778 a!2986) j!136)))))

(assert (=> b!596930 (= lt!271173 (select (store (arr!17778 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!596931 () Bool)

(assert (=> b!596931 (= e!341059 (not e!341061))))

(declare-fun res!382670 () Bool)

(assert (=> b!596931 (=> res!382670 e!341061)))

(declare-fun lt!271171 () SeekEntryResult!6218)

(assert (=> b!596931 (= res!382670 (not (= lt!271171 (Found!6218 index!984))))))

(declare-fun lt!271168 () Unit!18790)

(declare-fun e!341060 () Unit!18790)

(assert (=> b!596931 (= lt!271168 e!341060)))

(declare-fun c!67496 () Bool)

(assert (=> b!596931 (= c!67496 (= lt!271171 Undefined!6218))))

(assert (=> b!596931 (= lt!271171 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271166 lt!271174 mask!3053))))

(declare-fun e!341054 () Bool)

(assert (=> b!596931 e!341054))

(declare-fun res!382677 () Bool)

(assert (=> b!596931 (=> (not res!382677) (not e!341054))))

(declare-fun lt!271167 () SeekEntryResult!6218)

(declare-fun lt!271176 () (_ BitVec 32))

(assert (=> b!596931 (= res!382677 (= lt!271167 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271176 vacantSpotIndex!68 lt!271166 lt!271174 mask!3053)))))

(assert (=> b!596931 (= lt!271167 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271176 vacantSpotIndex!68 (select (arr!17778 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596931 (= lt!271166 (select (store (arr!17778 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!271175 () Unit!18790)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37028 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18790)

(assert (=> b!596931 (= lt!271175 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271176 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596931 (= lt!271176 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596932 () Bool)

(declare-fun Unit!18792 () Unit!18790)

(assert (=> b!596932 (= e!341060 Unit!18792)))

(declare-fun b!596933 () Bool)

(declare-fun res!382666 () Bool)

(assert (=> b!596933 (=> (not res!382666) (not e!341055))))

(assert (=> b!596933 (= res!382666 (validKeyInArray!0 k!1786))))

(declare-fun b!596934 () Bool)

(declare-fun Unit!18793 () Unit!18790)

(assert (=> b!596934 (= e!341060 Unit!18793)))

(assert (=> b!596934 false))

(declare-fun b!596935 () Bool)

(assert (=> b!596935 (= e!341057 e!341062)))

(declare-fun res!382675 () Bool)

(assert (=> b!596935 (=> (not res!382675) (not e!341062))))

(assert (=> b!596935 (= res!382675 (= (select (store (arr!17778 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596935 (= lt!271174 (array!37029 (store (arr!17778 a!2986) i!1108 k!1786) (size!18142 a!2986)))))

(declare-fun b!596936 () Bool)

(declare-fun res!382667 () Bool)

(assert (=> b!596936 (=> (not res!382667) (not e!341057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37028 (_ BitVec 32)) Bool)

(assert (=> b!596936 (= res!382667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596937 () Bool)

(assert (=> b!596937 (= e!341053 e!341056)))

(declare-fun res!382669 () Bool)

(assert (=> b!596937 (=> (not res!382669) (not e!341056))))

(assert (=> b!596937 (= res!382669 (arrayContainsKey!0 lt!271174 (select (arr!17778 a!2986) j!136) j!136))))

(declare-fun b!596938 () Bool)

(assert (=> b!596938 (= e!341054 (= lt!271177 lt!271167))))

(declare-fun b!596939 () Bool)

(declare-fun res!382663 () Bool)

(assert (=> b!596939 (=> (not res!382663) (not e!341055))))

(assert (=> b!596939 (= res!382663 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!54568 res!382679) b!596922))

(assert (= (and b!596922 res!382674) b!596925))

(assert (= (and b!596925 res!382668) b!596933))

(assert (= (and b!596933 res!382666) b!596939))

(assert (= (and b!596939 res!382663) b!596927))

(assert (= (and b!596927 res!382672) b!596936))

(assert (= (and b!596936 res!382667) b!596928))

(assert (= (and b!596928 res!382678) b!596924))

(assert (= (and b!596924 res!382676) b!596935))

(assert (= (and b!596935 res!382675) b!596923))

(assert (= (and b!596923 res!382665) b!596931))

(assert (= (and b!596931 res!382677) b!596938))

(assert (= (and b!596931 c!67496) b!596934))

(assert (= (and b!596931 (not c!67496)) b!596932))

(assert (= (and b!596931 (not res!382670)) b!596930))

(assert (= (and b!596930 res!382671) b!596926))

(assert (= (and b!596926 (not res!382664)) b!596937))

(assert (= (and b!596937 res!382669) b!596921))

(assert (= (and b!596930 (not res!382673)) b!596929))

(declare-fun m!574361 () Bool)

(assert (=> b!596939 m!574361))

(declare-fun m!574363 () Bool)

(assert (=> start!54568 m!574363))

(declare-fun m!574365 () Bool)

(assert (=> start!54568 m!574365))

(declare-fun m!574367 () Bool)

(assert (=> b!596923 m!574367))

(declare-fun m!574369 () Bool)

(assert (=> b!596923 m!574369))

(assert (=> b!596923 m!574369))

(declare-fun m!574371 () Bool)

(assert (=> b!596923 m!574371))

(declare-fun m!574373 () Bool)

(assert (=> b!596933 m!574373))

(declare-fun m!574375 () Bool)

(assert (=> b!596936 m!574375))

(assert (=> b!596937 m!574369))

(assert (=> b!596937 m!574369))

(declare-fun m!574377 () Bool)

(assert (=> b!596937 m!574377))

(assert (=> b!596925 m!574369))

(assert (=> b!596925 m!574369))

(declare-fun m!574379 () Bool)

(assert (=> b!596925 m!574379))

(declare-fun m!574381 () Bool)

(assert (=> b!596924 m!574381))

(assert (=> b!596926 m!574369))

(declare-fun m!574383 () Bool)

(assert (=> b!596935 m!574383))

(declare-fun m!574385 () Bool)

(assert (=> b!596935 m!574385))

(declare-fun m!574387 () Bool)

(assert (=> b!596931 m!574387))

(declare-fun m!574389 () Bool)

(assert (=> b!596931 m!574389))

(declare-fun m!574391 () Bool)

(assert (=> b!596931 m!574391))

(assert (=> b!596931 m!574369))

(assert (=> b!596931 m!574383))

(declare-fun m!574393 () Bool)

(assert (=> b!596931 m!574393))

(assert (=> b!596931 m!574369))

(declare-fun m!574395 () Bool)

(assert (=> b!596931 m!574395))

(declare-fun m!574397 () Bool)

(assert (=> b!596931 m!574397))

(assert (=> b!596921 m!574369))

(assert (=> b!596921 m!574369))

(declare-fun m!574399 () Bool)

(assert (=> b!596921 m!574399))

(assert (=> b!596930 m!574369))

(assert (=> b!596930 m!574383))

(declare-fun m!574401 () Bool)

(assert (=> b!596930 m!574401))

(declare-fun m!574403 () Bool)

(assert (=> b!596928 m!574403))

(assert (=> b!596929 m!574369))

(assert (=> b!596929 m!574369))

(declare-fun m!574405 () Bool)

(assert (=> b!596929 m!574405))

(declare-fun m!574407 () Bool)

(assert (=> b!596929 m!574407))

(assert (=> b!596929 m!574369))

(declare-fun m!574409 () Bool)

(assert (=> b!596929 m!574409))

(declare-fun m!574411 () Bool)

(assert (=> b!596929 m!574411))

(declare-fun m!574413 () Bool)

(assert (=> b!596927 m!574413))

(push 1)

(assert (not b!596928))

(assert (not b!596939))

(assert (not b!596921))

(assert (not b!596933))

(assert (not b!596937))

(assert (not b!596927))

(assert (not b!596936))

(assert (not b!596929))

(assert (not b!596931))

(assert (not b!596925))

(assert (not b!596923))

(assert (not start!54568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86723 () Bool)

(assert (=> d!86723 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!596933 d!86723))

(declare-fun b!597113 () Bool)

(declare-fun e!341181 () SeekEntryResult!6218)

(assert (=> b!597113 (= e!341181 (MissingVacant!6218 vacantSpotIndex!68))))

(declare-fun b!597114 () Bool)

(assert (=> b!597114 (= e!341181 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17778 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597115 () Bool)

(declare-fun c!67519 () Bool)

(declare-fun lt!271264 () (_ BitVec 64))

(assert (=> b!597115 (= c!67519 (= lt!271264 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341182 () SeekEntryResult!6218)

(assert (=> b!597115 (= e!341182 e!341181)))

(declare-fun d!86729 () Bool)

(declare-fun lt!271265 () SeekEntryResult!6218)

(assert (=> d!86729 (and (or (is-Undefined!6218 lt!271265) (not (is-Found!6218 lt!271265)) (and (bvsge (index!27121 lt!271265) #b00000000000000000000000000000000) (bvslt (index!27121 lt!271265) (size!18142 a!2986)))) (or (is-Undefined!6218 lt!271265) (is-Found!6218 lt!271265) (not (is-MissingVacant!6218 lt!271265)) (not (= (index!27123 lt!271265) vacantSpotIndex!68)) (and (bvsge (index!27123 lt!271265) #b00000000000000000000000000000000) (bvslt (index!27123 lt!271265) (size!18142 a!2986)))) (or (is-Undefined!6218 lt!271265) (ite (is-Found!6218 lt!271265) (= (select (arr!17778 a!2986) (index!27121 lt!271265)) (select (arr!17778 a!2986) j!136)) (and (is-MissingVacant!6218 lt!271265) (= (index!27123 lt!271265) vacantSpotIndex!68) (= (select (arr!17778 a!2986) (index!27123 lt!271265)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341180 () SeekEntryResult!6218)

(assert (=> d!86729 (= lt!271265 e!341180)))

(declare-fun c!67520 () Bool)

(assert (=> d!86729 (= c!67520 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86729 (= lt!271264 (select (arr!17778 a!2986) index!984))))

(assert (=> d!86729 (validMask!0 mask!3053)))

(assert (=> d!86729 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17778 a!2986) j!136) a!2986 mask!3053) lt!271265)))

(declare-fun b!597116 () Bool)

(assert (=> b!597116 (= e!341180 Undefined!6218)))

(declare-fun b!597117 () Bool)

(assert (=> b!597117 (= e!341180 e!341182)))

(declare-fun c!67521 () Bool)

(assert (=> b!597117 (= c!67521 (= lt!271264 (select (arr!17778 a!2986) j!136)))))

(declare-fun b!597118 () Bool)

(assert (=> b!597118 (= e!341182 (Found!6218 index!984))))

(assert (= (and d!86729 c!67520) b!597116))

(assert (= (and d!86729 (not c!67520)) b!597117))

(assert (= (and b!597117 c!67521) b!597118))

(assert (= (and b!597117 (not c!67521)) b!597115))

(assert (= (and b!597115 c!67519) b!597113))

(assert (= (and b!597115 (not c!67519)) b!597114))

(assert (=> b!597114 m!574387))

(assert (=> b!597114 m!574387))

(assert (=> b!597114 m!574369))

(declare-fun m!574559 () Bool)

(assert (=> b!597114 m!574559))

(declare-fun m!574561 () Bool)

(assert (=> d!86729 m!574561))

(declare-fun m!574563 () Bool)

(assert (=> d!86729 m!574563))

(assert (=> d!86729 m!574367))

(assert (=> d!86729 m!574363))

(assert (=> b!596923 d!86729))

(declare-fun d!86747 () Bool)

(assert (=> d!86747 (= (validKeyInArray!0 (select (arr!17778 a!2986) j!136)) (and (not (= (select (arr!17778 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17778 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!596925 d!86747))

(declare-fun b!597133 () Bool)

(declare-fun e!341194 () Bool)

(declare-fun call!32910 () Bool)

(assert (=> b!597133 (= e!341194 call!32910)))

(declare-fun b!597134 () Bool)

(declare-fun e!341192 () Bool)

(assert (=> b!597134 (= e!341192 call!32910)))

(declare-fun bm!32907 () Bool)

(assert (=> bm!32907 (= call!32910 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!597135 () Bool)

(declare-fun e!341193 () Bool)

(assert (=> b!597135 (= e!341193 e!341194)))

(declare-fun c!67527 () Bool)

(assert (=> b!597135 (= c!67527 (validKeyInArray!0 (select (arr!17778 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597136 () Bool)

(assert (=> b!597136 (= e!341194 e!341192)))

(declare-fun lt!271274 () (_ BitVec 64))

(assert (=> b!597136 (= lt!271274 (select (arr!17778 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271275 () Unit!18790)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37028 (_ BitVec 64) (_ BitVec 32)) Unit!18790)

(assert (=> b!597136 (= lt!271275 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271274 #b00000000000000000000000000000000))))

(assert (=> b!597136 (arrayContainsKey!0 a!2986 lt!271274 #b00000000000000000000000000000000)))

(declare-fun lt!271276 () Unit!18790)

(assert (=> b!597136 (= lt!271276 lt!271275)))

(declare-fun res!382814 () Bool)

(assert (=> b!597136 (= res!382814 (= (seekEntryOrOpen!0 (select (arr!17778 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6218 #b00000000000000000000000000000000)))))

(assert (=> b!597136 (=> (not res!382814) (not e!341192))))

(declare-fun d!86749 () Bool)

(declare-fun res!382813 () Bool)

(assert (=> d!86749 (=> res!382813 e!341193)))

(assert (=> d!86749 (= res!382813 (bvsge #b00000000000000000000000000000000 (size!18142 a!2986)))))

(assert (=> d!86749 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!341193)))

(assert (= (and d!86749 (not res!382813)) b!597135))

(assert (= (and b!597135 c!67527) b!597136))

(assert (= (and b!597135 (not c!67527)) b!597133))

(assert (= (and b!597136 res!382814) b!597134))

(assert (= (or b!597134 b!597133) bm!32907))

(declare-fun m!574571 () Bool)

(assert (=> bm!32907 m!574571))

(declare-fun m!574573 () Bool)

(assert (=> b!597135 m!574573))

(assert (=> b!597135 m!574573))

(declare-fun m!574575 () Bool)

(assert (=> b!597135 m!574575))

(assert (=> b!597136 m!574573))

(declare-fun m!574577 () Bool)

(assert (=> b!597136 m!574577))

(declare-fun m!574579 () Bool)

(assert (=> b!597136 m!574579))

(assert (=> b!597136 m!574573))

(declare-fun m!574581 () Bool)

(assert (=> b!597136 m!574581))

(assert (=> b!596936 d!86749))

(declare-fun d!86755 () Bool)

(declare-fun res!382819 () Bool)

(declare-fun e!341199 () Bool)

(assert (=> d!86755 (=> res!382819 e!341199)))

(assert (=> d!86755 (= res!382819 (= (select (arr!17778 lt!271174) j!136) (select (arr!17778 a!2986) j!136)))))

(assert (=> d!86755 (= (arrayContainsKey!0 lt!271174 (select (arr!17778 a!2986) j!136) j!136) e!341199)))

(declare-fun b!597141 () Bool)

(declare-fun e!341200 () Bool)

(assert (=> b!597141 (= e!341199 e!341200)))

(declare-fun res!382820 () Bool)

(assert (=> b!597141 (=> (not res!382820) (not e!341200))))

(assert (=> b!597141 (= res!382820 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18142 lt!271174)))))

(declare-fun b!597142 () Bool)

(assert (=> b!597142 (= e!341200 (arrayContainsKey!0 lt!271174 (select (arr!17778 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86755 (not res!382819)) b!597141))

(assert (= (and b!597141 res!382820) b!597142))

(declare-fun m!574583 () Bool)

(assert (=> d!86755 m!574583))

(assert (=> b!597142 m!574369))

(declare-fun m!574585 () Bool)

(assert (=> b!597142 m!574585))

(assert (=> b!596937 d!86755))

(declare-fun d!86757 () Bool)

(assert (=> d!86757 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54568 d!86757))

(declare-fun d!86773 () Bool)

(assert (=> d!86773 (= (array_inv!13574 a!2986) (bvsge (size!18142 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54568 d!86773))

(declare-fun b!597206 () Bool)

(declare-fun e!341234 () SeekEntryResult!6218)

(declare-fun lt!271309 () SeekEntryResult!6218)

(assert (=> b!597206 (= e!341234 (seekKeyOrZeroReturnVacant!0 (x!55918 lt!271309) (index!27122 lt!271309) (index!27122 lt!271309) k!1786 a!2986 mask!3053))))

(declare-fun b!597207 () Bool)

(declare-fun e!341236 () SeekEntryResult!6218)

(assert (=> b!597207 (= e!341236 (Found!6218 (index!27122 lt!271309)))))

(declare-fun d!86775 () Bool)

(declare-fun lt!271308 () SeekEntryResult!6218)

(assert (=> d!86775 (and (or (is-Undefined!6218 lt!271308) (not (is-Found!6218 lt!271308)) (and (bvsge (index!27121 lt!271308) #b00000000000000000000000000000000) (bvslt (index!27121 lt!271308) (size!18142 a!2986)))) (or (is-Undefined!6218 lt!271308) (is-Found!6218 lt!271308) (not (is-MissingZero!6218 lt!271308)) (and (bvsge (index!27120 lt!271308) #b00000000000000000000000000000000) (bvslt (index!27120 lt!271308) (size!18142 a!2986)))) (or (is-Undefined!6218 lt!271308) (is-Found!6218 lt!271308) (is-MissingZero!6218 lt!271308) (not (is-MissingVacant!6218 lt!271308)) (and (bvsge (index!27123 lt!271308) #b00000000000000000000000000000000) (bvslt (index!27123 lt!271308) (size!18142 a!2986)))) (or (is-Undefined!6218 lt!271308) (ite (is-Found!6218 lt!271308) (= (select (arr!17778 a!2986) (index!27121 lt!271308)) k!1786) (ite (is-MissingZero!6218 lt!271308) (= (select (arr!17778 a!2986) (index!27120 lt!271308)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6218 lt!271308) (= (select (arr!17778 a!2986) (index!27123 lt!271308)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!341235 () SeekEntryResult!6218)

(assert (=> d!86775 (= lt!271308 e!341235)))

(declare-fun c!67560 () Bool)

(assert (=> d!86775 (= c!67560 (and (is-Intermediate!6218 lt!271309) (undefined!7030 lt!271309)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37028 (_ BitVec 32)) SeekEntryResult!6218)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86775 (= lt!271309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!86775 (validMask!0 mask!3053)))

(assert (=> d!86775 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!271308)))

(declare-fun b!597208 () Bool)

(assert (=> b!597208 (= e!341235 Undefined!6218)))

(declare-fun b!597209 () Bool)

(assert (=> b!597209 (= e!341234 (MissingZero!6218 (index!27122 lt!271309)))))

(declare-fun b!597210 () Bool)

(declare-fun c!67558 () Bool)

(declare-fun lt!271307 () (_ BitVec 64))

(assert (=> b!597210 (= c!67558 (= lt!271307 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597210 (= e!341236 e!341234)))

(declare-fun b!597211 () Bool)

(assert (=> b!597211 (= e!341235 e!341236)))

(assert (=> b!597211 (= lt!271307 (select (arr!17778 a!2986) (index!27122 lt!271309)))))

(declare-fun c!67559 () Bool)

(assert (=> b!597211 (= c!67559 (= lt!271307 k!1786))))

(assert (= (and d!86775 c!67560) b!597208))

(assert (= (and d!86775 (not c!67560)) b!597211))

(assert (= (and b!597211 c!67559) b!597207))

(assert (= (and b!597211 (not c!67559)) b!597210))

(assert (= (and b!597210 c!67558) b!597209))

(assert (= (and b!597210 (not c!67558)) b!597206))

(declare-fun m!574625 () Bool)

(assert (=> b!597206 m!574625))

(declare-fun m!574627 () Bool)

(assert (=> d!86775 m!574627))

(declare-fun m!574629 () Bool)

(assert (=> d!86775 m!574629))

(declare-fun m!574631 () Bool)

(assert (=> d!86775 m!574631))

(assert (=> d!86775 m!574363))

(declare-fun m!574633 () Bool)

(assert (=> d!86775 m!574633))

(declare-fun m!574635 () Bool)

(assert (=> d!86775 m!574635))

(assert (=> d!86775 m!574633))

(declare-fun m!574637 () Bool)

(assert (=> b!597211 m!574637))

(assert (=> b!596927 d!86775))

(declare-fun b!597240 () Bool)

(declare-fun e!341256 () Bool)

(declare-fun e!341254 () Bool)

(assert (=> b!597240 (= e!341256 e!341254)))

(declare-fun c!67572 () Bool)

(assert (=> b!597240 (= c!67572 (validKeyInArray!0 (select (arr!17778 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86779 () Bool)

(declare-fun res!382832 () Bool)

(declare-fun e!341257 () Bool)

(assert (=> d!86779 (=> res!382832 e!341257)))

(assert (=> d!86779 (= res!382832 (bvsge #b00000000000000000000000000000000 (size!18142 a!2986)))))

(assert (=> d!86779 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11816) e!341257)))

(declare-fun b!597241 () Bool)

(declare-fun e!341255 () Bool)

(declare-fun contains!2952 (List!11819 (_ BitVec 64)) Bool)

(assert (=> b!597241 (= e!341255 (contains!2952 Nil!11816 (select (arr!17778 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32910 () Bool)

(declare-fun call!32913 () Bool)

(assert (=> bm!32910 (= call!32913 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67572 (Cons!11815 (select (arr!17778 a!2986) #b00000000000000000000000000000000) Nil!11816) Nil!11816)))))

(declare-fun b!597242 () Bool)

(assert (=> b!597242 (= e!341254 call!32913)))

(declare-fun b!597243 () Bool)

(assert (=> b!597243 (= e!341257 e!341256)))

(declare-fun res!382831 () Bool)

(assert (=> b!597243 (=> (not res!382831) (not e!341256))))

(assert (=> b!597243 (= res!382831 (not e!341255))))

(declare-fun res!382830 () Bool)

(assert (=> b!597243 (=> (not res!382830) (not e!341255))))

(assert (=> b!597243 (= res!382830 (validKeyInArray!0 (select (arr!17778 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597244 () Bool)

(assert (=> b!597244 (= e!341254 call!32913)))

(assert (= (and d!86779 (not res!382832)) b!597243))

(assert (= (and b!597243 res!382830) b!597241))

(assert (= (and b!597243 res!382831) b!597240))

(assert (= (and b!597240 c!67572) b!597242))

(assert (= (and b!597240 (not c!67572)) b!597244))

(assert (= (or b!597242 b!597244) bm!32910))

(assert (=> b!597240 m!574573))

(assert (=> b!597240 m!574573))

(assert (=> b!597240 m!574575))

(assert (=> b!597241 m!574573))

(assert (=> b!597241 m!574573))

(declare-fun m!574653 () Bool)

(assert (=> b!597241 m!574653))

(assert (=> bm!32910 m!574573))

(declare-fun m!574655 () Bool)

(assert (=> bm!32910 m!574655))

(assert (=> b!597243 m!574573))

(assert (=> b!597243 m!574573))

(assert (=> b!597243 m!574575))

(assert (=> b!596928 d!86779))

(declare-fun d!86783 () Bool)

(declare-fun res!382833 () Bool)

(declare-fun e!341258 () Bool)

(assert (=> d!86783 (=> res!382833 e!341258)))

(assert (=> d!86783 (= res!382833 (= (select (arr!17778 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!86783 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!341258)))

(declare-fun b!597245 () Bool)

(declare-fun e!341259 () Bool)

(assert (=> b!597245 (= e!341258 e!341259)))

(declare-fun res!382834 () Bool)

(assert (=> b!597245 (=> (not res!382834) (not e!341259))))

(assert (=> b!597245 (= res!382834 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18142 a!2986)))))

(declare-fun b!597246 () Bool)

(assert (=> b!597246 (= e!341259 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86783 (not res!382833)) b!597245))

(assert (= (and b!597245 res!382834) b!597246))

(assert (=> d!86783 m!574573))

(declare-fun m!574657 () Bool)

(assert (=> b!597246 m!574657))

(assert (=> b!596939 d!86783))

(declare-fun b!597247 () Bool)

(declare-fun e!341262 () Bool)

(declare-fun e!341260 () Bool)

(assert (=> b!597247 (= e!341262 e!341260)))

(declare-fun c!67573 () Bool)

(assert (=> b!597247 (= c!67573 (validKeyInArray!0 (select (arr!17778 lt!271174) #b00000000000000000000000000000000)))))

(declare-fun d!86785 () Bool)

(declare-fun res!382837 () Bool)

(declare-fun e!341263 () Bool)

(assert (=> d!86785 (=> res!382837 e!341263)))

(assert (=> d!86785 (= res!382837 (bvsge #b00000000000000000000000000000000 (size!18142 lt!271174)))))

(assert (=> d!86785 (= (arrayNoDuplicates!0 lt!271174 #b00000000000000000000000000000000 Nil!11816) e!341263)))

(declare-fun b!597248 () Bool)

(declare-fun e!341261 () Bool)

(assert (=> b!597248 (= e!341261 (contains!2952 Nil!11816 (select (arr!17778 lt!271174) #b00000000000000000000000000000000)))))

(declare-fun bm!32911 () Bool)

(declare-fun call!32914 () Bool)

(assert (=> bm!32911 (= call!32914 (arrayNoDuplicates!0 lt!271174 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67573 (Cons!11815 (select (arr!17778 lt!271174) #b00000000000000000000000000000000) Nil!11816) Nil!11816)))))

(declare-fun b!597249 () Bool)

(assert (=> b!597249 (= e!341260 call!32914)))

(declare-fun b!597250 () Bool)

(assert (=> b!597250 (= e!341263 e!341262)))

(declare-fun res!382836 () Bool)

(assert (=> b!597250 (=> (not res!382836) (not e!341262))))

(assert (=> b!597250 (= res!382836 (not e!341261))))

(declare-fun res!382835 () Bool)

(assert (=> b!597250 (=> (not res!382835) (not e!341261))))

(assert (=> b!597250 (= res!382835 (validKeyInArray!0 (select (arr!17778 lt!271174) #b00000000000000000000000000000000)))))

(declare-fun b!597251 () Bool)

(assert (=> b!597251 (= e!341260 call!32914)))

(assert (= (and d!86785 (not res!382837)) b!597250))

(assert (= (and b!597250 res!382835) b!597248))

(assert (= (and b!597250 res!382836) b!597247))

(assert (= (and b!597247 c!67573) b!597249))

(assert (= (and b!597247 (not c!67573)) b!597251))

(assert (= (or b!597249 b!597251) bm!32911))

(declare-fun m!574659 () Bool)

(assert (=> b!597247 m!574659))

(assert (=> b!597247 m!574659))

(declare-fun m!574661 () Bool)

(assert (=> b!597247 m!574661))

(assert (=> b!597248 m!574659))

(assert (=> b!597248 m!574659))

(declare-fun m!574663 () Bool)

(assert (=> b!597248 m!574663))

(assert (=> bm!32911 m!574659))

(declare-fun m!574665 () Bool)

(assert (=> bm!32911 m!574665))

(assert (=> b!597250 m!574659))

(assert (=> b!597250 m!574659))

(assert (=> b!597250 m!574661))

(assert (=> b!596929 d!86785))

(declare-fun d!86787 () Bool)

(declare-fun e!341286 () Bool)

(assert (=> d!86787 e!341286))

(declare-fun res!382852 () Bool)

(assert (=> d!86787 (=> (not res!382852) (not e!341286))))

(assert (=> d!86787 (= res!382852 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18142 a!2986))))))

(declare-fun lt!271333 () Unit!18790)

(declare-fun choose!41 (array!37028 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11819) Unit!18790)

(assert (=> d!86787 (= lt!271333 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11816))))

(assert (=> d!86787 (bvslt (size!18142 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!86787 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11816) lt!271333)))

(declare-fun b!597282 () Bool)

(assert (=> b!597282 (= e!341286 (arrayNoDuplicates!0 (array!37029 (store (arr!17778 a!2986) i!1108 k!1786) (size!18142 a!2986)) #b00000000000000000000000000000000 Nil!11816))))

(assert (= (and d!86787 res!382852) b!597282))

(declare-fun m!574683 () Bool)

(assert (=> d!86787 m!574683))

(assert (=> b!597282 m!574383))

(declare-fun m!574685 () Bool)

(assert (=> b!597282 m!574685))

(assert (=> b!596929 d!86787))

(declare-fun d!86791 () Bool)

(declare-fun res!382853 () Bool)

(declare-fun e!341287 () Bool)

(assert (=> d!86791 (=> res!382853 e!341287)))

(assert (=> d!86791 (= res!382853 (= (select (arr!17778 lt!271174) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17778 a!2986) j!136)))))

(assert (=> d!86791 (= (arrayContainsKey!0 lt!271174 (select (arr!17778 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341287)))

(declare-fun b!597283 () Bool)

(declare-fun e!341288 () Bool)

(assert (=> b!597283 (= e!341287 e!341288)))

(declare-fun res!382854 () Bool)

(assert (=> b!597283 (=> (not res!382854) (not e!341288))))

(assert (=> b!597283 (= res!382854 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18142 lt!271174)))))

(declare-fun b!597284 () Bool)

(assert (=> b!597284 (= e!341288 (arrayContainsKey!0 lt!271174 (select (arr!17778 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86791 (not res!382853)) b!597283))

(assert (= (and b!597283 res!382854) b!597284))

(declare-fun m!574693 () Bool)

(assert (=> d!86791 m!574693))

(assert (=> b!597284 m!574369))

(declare-fun m!574695 () Bool)

(assert (=> b!597284 m!574695))

(assert (=> b!596929 d!86791))

(declare-fun d!86795 () Bool)

(assert (=> d!86795 (arrayContainsKey!0 lt!271174 (select (arr!17778 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271336 () Unit!18790)

(declare-fun choose!114 (array!37028 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18790)

(assert (=> d!86795 (= lt!271336 (choose!114 lt!271174 (select (arr!17778 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86795 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86795 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271174 (select (arr!17778 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271336)))

(declare-fun bs!18366 () Bool)

(assert (= bs!18366 d!86795))

(assert (=> bs!18366 m!574369))

(assert (=> bs!18366 m!574409))

(assert (=> bs!18366 m!574369))

(declare-fun m!574699 () Bool)

(assert (=> bs!18366 m!574699))

(assert (=> b!596929 d!86795))

(declare-fun d!86797 () Bool)

(declare-fun e!341316 () Bool)

(assert (=> d!86797 e!341316))

(declare-fun res!382880 () Bool)

(assert (=> d!86797 (=> (not res!382880) (not e!341316))))

(assert (=> d!86797 (= res!382880 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18142 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18142 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18142 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18142 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18142 a!2986))))))

(declare-fun lt!271347 () Unit!18790)

(declare-fun choose!9 (array!37028 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18790)

(assert (=> d!86797 (= lt!271347 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271176 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86797 (validMask!0 mask!3053)))

(assert (=> d!86797 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271176 vacantSpotIndex!68 mask!3053) lt!271347)))

(declare-fun b!597314 () Bool)

(assert (=> b!597314 (= e!341316 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271176 vacantSpotIndex!68 (select (arr!17778 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271176 vacantSpotIndex!68 (select (store (arr!17778 a!2986) i!1108 k!1786) j!136) (array!37029 (store (arr!17778 a!2986) i!1108 k!1786) (size!18142 a!2986)) mask!3053)))))

(assert (= (and d!86797 res!382880) b!597314))

(declare-fun m!574733 () Bool)

(assert (=> d!86797 m!574733))

(assert (=> d!86797 m!574363))

(assert (=> b!597314 m!574369))

(assert (=> b!597314 m!574369))

(assert (=> b!597314 m!574395))

(assert (=> b!597314 m!574389))

(assert (=> b!597314 m!574389))

(declare-fun m!574735 () Bool)

(assert (=> b!597314 m!574735))

(assert (=> b!597314 m!574383))

(assert (=> b!596931 d!86797))

(declare-fun d!86817 () Bool)

(declare-fun lt!271353 () (_ BitVec 32))

(assert (=> d!86817 (and (bvsge lt!271353 #b00000000000000000000000000000000) (bvslt lt!271353 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86817 (= lt!271353 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86817 (validMask!0 mask!3053)))

(assert (=> d!86817 (= (nextIndex!0 index!984 x!910 mask!3053) lt!271353)))

(declare-fun bs!18368 () Bool)

(assert (= bs!18368 d!86817))

(declare-fun m!574751 () Bool)

(assert (=> bs!18368 m!574751))

(assert (=> bs!18368 m!574363))

(assert (=> b!596931 d!86817))

(declare-fun b!597322 () Bool)

(declare-fun e!341322 () SeekEntryResult!6218)

(assert (=> b!597322 (= e!341322 (MissingVacant!6218 vacantSpotIndex!68))))

(declare-fun b!597323 () Bool)

(assert (=> b!597323 (= e!341322 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271176 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!271166 lt!271174 mask!3053))))

(declare-fun b!597324 () Bool)

(declare-fun c!67587 () Bool)

(declare-fun lt!271354 () (_ BitVec 64))

(assert (=> b!597324 (= c!67587 (= lt!271354 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341323 () SeekEntryResult!6218)

(assert (=> b!597324 (= e!341323 e!341322)))

(declare-fun lt!271355 () SeekEntryResult!6218)

(declare-fun d!86823 () Bool)

(assert (=> d!86823 (and (or (is-Undefined!6218 lt!271355) (not (is-Found!6218 lt!271355)) (and (bvsge (index!27121 lt!271355) #b00000000000000000000000000000000) (bvslt (index!27121 lt!271355) (size!18142 lt!271174)))) (or (is-Undefined!6218 lt!271355) (is-Found!6218 lt!271355) (not (is-MissingVacant!6218 lt!271355)) (not (= (index!27123 lt!271355) vacantSpotIndex!68)) (and (bvsge (index!27123 lt!271355) #b00000000000000000000000000000000) (bvslt (index!27123 lt!271355) (size!18142 lt!271174)))) (or (is-Undefined!6218 lt!271355) (ite (is-Found!6218 lt!271355) (= (select (arr!17778 lt!271174) (index!27121 lt!271355)) lt!271166) (and (is-MissingVacant!6218 lt!271355) (= (index!27123 lt!271355) vacantSpotIndex!68) (= (select (arr!17778 lt!271174) (index!27123 lt!271355)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341321 () SeekEntryResult!6218)

(assert (=> d!86823 (= lt!271355 e!341321)))

(declare-fun c!67588 () Bool)

(assert (=> d!86823 (= c!67588 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86823 (= lt!271354 (select (arr!17778 lt!271174) lt!271176))))

(assert (=> d!86823 (validMask!0 mask!3053)))

(assert (=> d!86823 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271176 vacantSpotIndex!68 lt!271166 lt!271174 mask!3053) lt!271355)))

(declare-fun b!597325 () Bool)

(assert (=> b!597325 (= e!341321 Undefined!6218)))

(declare-fun b!597326 () Bool)

(assert (=> b!597326 (= e!341321 e!341323)))

(declare-fun c!67589 () Bool)

(assert (=> b!597326 (= c!67589 (= lt!271354 lt!271166))))

(declare-fun b!597327 () Bool)

(assert (=> b!597327 (= e!341323 (Found!6218 lt!271176))))

(assert (= (and d!86823 c!67588) b!597325))

(assert (= (and d!86823 (not c!67588)) b!597326))

(assert (= (and b!597326 c!67589) b!597327))

(assert (= (and b!597326 (not c!67589)) b!597324))

(assert (= (and b!597324 c!67587) b!597322))

(assert (= (and b!597324 (not c!67587)) b!597323))

(declare-fun m!574753 () Bool)

(assert (=> b!597323 m!574753))

(assert (=> b!597323 m!574753))

(declare-fun m!574755 () Bool)

(assert (=> b!597323 m!574755))

(declare-fun m!574757 () Bool)

(assert (=> d!86823 m!574757))

(declare-fun m!574759 () Bool)

(assert (=> d!86823 m!574759))

(declare-fun m!574761 () Bool)

(assert (=> d!86823 m!574761))

(assert (=> d!86823 m!574363))

(assert (=> b!596931 d!86823))

(declare-fun b!597334 () Bool)

(declare-fun e!341329 () SeekEntryResult!6218)

(assert (=> b!597334 (= e!341329 (MissingVacant!6218 vacantSpotIndex!68))))

(declare-fun b!597335 () Bool)

(assert (=> b!597335 (= e!341329 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271176 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17778 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597336 () Bool)

(declare-fun c!67592 () Bool)

(declare-fun lt!271360 () (_ BitVec 64))

(assert (=> b!597336 (= c!67592 (= lt!271360 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341330 () SeekEntryResult!6218)

(assert (=> b!597336 (= e!341330 e!341329)))

(declare-fun lt!271362 () SeekEntryResult!6218)

(declare-fun d!86825 () Bool)

(assert (=> d!86825 (and (or (is-Undefined!6218 lt!271362) (not (is-Found!6218 lt!271362)) (and (bvsge (index!27121 lt!271362) #b00000000000000000000000000000000) (bvslt (index!27121 lt!271362) (size!18142 a!2986)))) (or (is-Undefined!6218 lt!271362) (is-Found!6218 lt!271362) (not (is-MissingVacant!6218 lt!271362)) (not (= (index!27123 lt!271362) vacantSpotIndex!68)) (and (bvsge (index!27123 lt!271362) #b00000000000000000000000000000000) (bvslt (index!27123 lt!271362) (size!18142 a!2986)))) (or (is-Undefined!6218 lt!271362) (ite (is-Found!6218 lt!271362) (= (select (arr!17778 a!2986) (index!27121 lt!271362)) (select (arr!17778 a!2986) j!136)) (and (is-MissingVacant!6218 lt!271362) (= (index!27123 lt!271362) vacantSpotIndex!68) (= (select (arr!17778 a!2986) (index!27123 lt!271362)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341328 () SeekEntryResult!6218)

(assert (=> d!86825 (= lt!271362 e!341328)))

(declare-fun c!67593 () Bool)

(assert (=> d!86825 (= c!67593 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86825 (= lt!271360 (select (arr!17778 a!2986) lt!271176))))

(assert (=> d!86825 (validMask!0 mask!3053)))

(assert (=> d!86825 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271176 vacantSpotIndex!68 (select (arr!17778 a!2986) j!136) a!2986 mask!3053) lt!271362)))

(declare-fun b!597337 () Bool)

(assert (=> b!597337 (= e!341328 Undefined!6218)))

(declare-fun b!597338 () Bool)

(assert (=> b!597338 (= e!341328 e!341330)))

(declare-fun c!67594 () Bool)

(assert (=> b!597338 (= c!67594 (= lt!271360 (select (arr!17778 a!2986) j!136)))))

(declare-fun b!597339 () Bool)

(assert (=> b!597339 (= e!341330 (Found!6218 lt!271176))))

(assert (= (and d!86825 c!67593) b!597337))

(assert (= (and d!86825 (not c!67593)) b!597338))

(assert (= (and b!597338 c!67594) b!597339))

(assert (= (and b!597338 (not c!67594)) b!597336))

(assert (= (and b!597336 c!67592) b!597334))

(assert (= (and b!597336 (not c!67592)) b!597335))

(assert (=> b!597335 m!574753))

(assert (=> b!597335 m!574753))

(assert (=> b!597335 m!574369))

(declare-fun m!574763 () Bool)

(assert (=> b!597335 m!574763))

(declare-fun m!574765 () Bool)

(assert (=> d!86825 m!574765))

(declare-fun m!574767 () Bool)

(assert (=> d!86825 m!574767))

(declare-fun m!574769 () Bool)

(assert (=> d!86825 m!574769))

(assert (=> d!86825 m!574363))

(assert (=> b!596931 d!86825))

(declare-fun b!597342 () Bool)

(declare-fun e!341334 () SeekEntryResult!6218)

(assert (=> b!597342 (= e!341334 (MissingVacant!6218 vacantSpotIndex!68))))

(declare-fun b!597343 () Bool)

(assert (=> b!597343 (= e!341334 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!271166 lt!271174 mask!3053))))

(declare-fun b!597344 () Bool)

(declare-fun c!67595 () Bool)

(declare-fun lt!271366 () (_ BitVec 64))

(assert (=> b!597344 (= c!67595 (= lt!271366 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341335 () SeekEntryResult!6218)

(assert (=> b!597344 (= e!341335 e!341334)))

(declare-fun d!86827 () Bool)

(declare-fun lt!271367 () SeekEntryResult!6218)

(assert (=> d!86827 (and (or (is-Undefined!6218 lt!271367) (not (is-Found!6218 lt!271367)) (and (bvsge (index!27121 lt!271367) #b00000000000000000000000000000000) (bvslt (index!27121 lt!271367) (size!18142 lt!271174)))) (or (is-Undefined!6218 lt!271367) (is-Found!6218 lt!271367) (not (is-MissingVacant!6218 lt!271367)) (not (= (index!27123 lt!271367) vacantSpotIndex!68)) (and (bvsge (index!27123 lt!271367) #b00000000000000000000000000000000) (bvslt (index!27123 lt!271367) (size!18142 lt!271174)))) (or (is-Undefined!6218 lt!271367) (ite (is-Found!6218 lt!271367) (= (select (arr!17778 lt!271174) (index!27121 lt!271367)) lt!271166) (and (is-MissingVacant!6218 lt!271367) (= (index!27123 lt!271367) vacantSpotIndex!68) (= (select (arr!17778 lt!271174) (index!27123 lt!271367)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341333 () SeekEntryResult!6218)

(assert (=> d!86827 (= lt!271367 e!341333)))

(declare-fun c!67596 () Bool)

(assert (=> d!86827 (= c!67596 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86827 (= lt!271366 (select (arr!17778 lt!271174) index!984))))

(assert (=> d!86827 (validMask!0 mask!3053)))

(assert (=> d!86827 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271166 lt!271174 mask!3053) lt!271367)))

(declare-fun b!597345 () Bool)

(assert (=> b!597345 (= e!341333 Undefined!6218)))

(declare-fun b!597346 () Bool)

(assert (=> b!597346 (= e!341333 e!341335)))

(declare-fun c!67597 () Bool)

(assert (=> b!597346 (= c!67597 (= lt!271366 lt!271166))))

(declare-fun b!597347 () Bool)

(assert (=> b!597347 (= e!341335 (Found!6218 index!984))))

(assert (= (and d!86827 c!67596) b!597345))

(assert (= (and d!86827 (not c!67596)) b!597346))

(assert (= (and b!597346 c!67597) b!597347))

(assert (= (and b!597346 (not c!67597)) b!597344))

(assert (= (and b!597344 c!67595) b!597342))

(assert (= (and b!597344 (not c!67595)) b!597343))

(assert (=> b!597343 m!574387))

(assert (=> b!597343 m!574387))

(declare-fun m!574771 () Bool)

(assert (=> b!597343 m!574771))

(declare-fun m!574773 () Bool)

(assert (=> d!86827 m!574773))

(declare-fun m!574777 () Bool)

(assert (=> d!86827 m!574777))

(declare-fun m!574779 () Bool)

(assert (=> d!86827 m!574779))

(assert (=> d!86827 m!574363))

(assert (=> b!596931 d!86827))

(declare-fun d!86829 () Bool)

(declare-fun res!382886 () Bool)

(declare-fun e!341336 () Bool)

(assert (=> d!86829 (=> res!382886 e!341336)))

(assert (=> d!86829 (= res!382886 (= (select (arr!17778 lt!271174) index!984) (select (arr!17778 a!2986) j!136)))))

(assert (=> d!86829 (= (arrayContainsKey!0 lt!271174 (select (arr!17778 a!2986) j!136) index!984) e!341336)))

(declare-fun b!597348 () Bool)

(declare-fun e!341337 () Bool)

(assert (=> b!597348 (= e!341336 e!341337)))

(declare-fun res!382887 () Bool)

(assert (=> b!597348 (=> (not res!382887) (not e!341337))))

(assert (=> b!597348 (= res!382887 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18142 lt!271174)))))

(declare-fun b!597349 () Bool)

(assert (=> b!597349 (= e!341337 (arrayContainsKey!0 lt!271174 (select (arr!17778 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86829 (not res!382886)) b!597348))

(assert (= (and b!597348 res!382887) b!597349))

(assert (=> d!86829 m!574779))

(assert (=> b!597349 m!574369))

(declare-fun m!574781 () Bool)

(assert (=> b!597349 m!574781))

(assert (=> b!596921 d!86829))

(push 1)

