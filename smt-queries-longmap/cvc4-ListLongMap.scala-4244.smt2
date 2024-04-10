; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58854 () Bool)

(assert start!58854)

(declare-fun b!648567 () Bool)

(declare-fun res!420206 () Bool)

(declare-fun e!371993 () Bool)

(assert (=> b!648567 (=> res!420206 e!371993)))

(declare-datatypes ((List!12505 0))(
  ( (Nil!12502) (Cons!12501 (h!13546 (_ BitVec 64)) (t!18733 List!12505)) )
))
(declare-fun contains!3160 (List!12505 (_ BitVec 64)) Bool)

(assert (=> b!648567 (= res!420206 (contains!3160 Nil!12502 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648568 () Bool)

(declare-fun res!420203 () Bool)

(declare-fun e!371984 () Bool)

(assert (=> b!648568 (=> (not res!420203) (not e!371984))))

(declare-datatypes ((array!38516 0))(
  ( (array!38517 (arr!18464 (Array (_ BitVec 32) (_ BitVec 64))) (size!18828 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38516)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648568 (= res!420203 (validKeyInArray!0 (select (arr!18464 a!2986) j!136)))))

(declare-fun b!648569 () Bool)

(declare-fun res!420196 () Bool)

(assert (=> b!648569 (=> (not res!420196) (not e!371984))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648569 (= res!420196 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648570 () Bool)

(declare-fun e!371983 () Bool)

(assert (=> b!648570 (= e!371984 e!371983)))

(declare-fun res!420207 () Bool)

(assert (=> b!648570 (=> (not res!420207) (not e!371983))))

(declare-datatypes ((SeekEntryResult!6904 0))(
  ( (MissingZero!6904 (index!29963 (_ BitVec 32))) (Found!6904 (index!29964 (_ BitVec 32))) (Intermediate!6904 (undefined!7716 Bool) (index!29965 (_ BitVec 32)) (x!58749 (_ BitVec 32))) (Undefined!6904) (MissingVacant!6904 (index!29966 (_ BitVec 32))) )
))
(declare-fun lt!301021 () SeekEntryResult!6904)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!648570 (= res!420207 (or (= lt!301021 (MissingZero!6904 i!1108)) (= lt!301021 (MissingVacant!6904 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38516 (_ BitVec 32)) SeekEntryResult!6904)

(assert (=> b!648570 (= lt!301021 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!648571 () Bool)

(declare-fun res!420199 () Bool)

(assert (=> b!648571 (=> (not res!420199) (not e!371983))))

(declare-fun arrayNoDuplicates!0 (array!38516 (_ BitVec 32) List!12505) Bool)

(assert (=> b!648571 (= res!420199 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12502))))

(declare-fun b!648572 () Bool)

(declare-datatypes ((Unit!22050 0))(
  ( (Unit!22051) )
))
(declare-fun e!371985 () Unit!22050)

(declare-fun Unit!22052 () Unit!22050)

(assert (=> b!648572 (= e!371985 Unit!22052)))

(assert (=> b!648572 false))

(declare-fun b!648573 () Bool)

(declare-fun lt!301034 () array!38516)

(declare-fun e!371987 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!648573 (= e!371987 (arrayContainsKey!0 lt!301034 (select (arr!18464 a!2986) j!136) index!984))))

(declare-fun b!648574 () Bool)

(declare-fun e!371994 () Bool)

(declare-fun e!371992 () Bool)

(assert (=> b!648574 (= e!371994 (not e!371992))))

(declare-fun res!420212 () Bool)

(assert (=> b!648574 (=> res!420212 e!371992)))

(declare-fun lt!301024 () SeekEntryResult!6904)

(assert (=> b!648574 (= res!420212 (not (= lt!301024 (Found!6904 index!984))))))

(declare-fun lt!301033 () Unit!22050)

(assert (=> b!648574 (= lt!301033 e!371985)))

(declare-fun c!74555 () Bool)

(assert (=> b!648574 (= c!74555 (= lt!301024 Undefined!6904))))

(declare-fun lt!301029 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38516 (_ BitVec 32)) SeekEntryResult!6904)

(assert (=> b!648574 (= lt!301024 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301029 lt!301034 mask!3053))))

(declare-fun e!371982 () Bool)

(assert (=> b!648574 e!371982))

(declare-fun res!420215 () Bool)

(assert (=> b!648574 (=> (not res!420215) (not e!371982))))

(declare-fun lt!301032 () SeekEntryResult!6904)

(declare-fun lt!301020 () (_ BitVec 32))

(assert (=> b!648574 (= res!420215 (= lt!301032 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301020 vacantSpotIndex!68 lt!301029 lt!301034 mask!3053)))))

(assert (=> b!648574 (= lt!301032 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301020 vacantSpotIndex!68 (select (arr!18464 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!648574 (= lt!301029 (select (store (arr!18464 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301026 () Unit!22050)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38516 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22050)

(assert (=> b!648574 (= lt!301026 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301020 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648574 (= lt!301020 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!648576 () Bool)

(assert (=> b!648576 (= e!371993 true)))

(declare-fun lt!301022 () Bool)

(assert (=> b!648576 (= lt!301022 (contains!3160 Nil!12502 k!1786))))

(declare-fun b!648577 () Bool)

(declare-fun res!420198 () Bool)

(assert (=> b!648577 (=> res!420198 e!371993)))

(assert (=> b!648577 (= res!420198 (contains!3160 Nil!12502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648578 () Bool)

(declare-fun res!420211 () Bool)

(assert (=> b!648578 (=> (not res!420211) (not e!371984))))

(assert (=> b!648578 (= res!420211 (validKeyInArray!0 k!1786))))

(declare-fun b!648579 () Bool)

(declare-fun e!371995 () Bool)

(assert (=> b!648579 (= e!371995 e!371994)))

(declare-fun res!420193 () Bool)

(assert (=> b!648579 (=> (not res!420193) (not e!371994))))

(declare-fun lt!301030 () SeekEntryResult!6904)

(assert (=> b!648579 (= res!420193 (and (= lt!301030 (Found!6904 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18464 a!2986) index!984) (select (arr!18464 a!2986) j!136))) (not (= (select (arr!18464 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!648579 (= lt!301030 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18464 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648580 () Bool)

(declare-fun e!371991 () Bool)

(declare-fun e!371996 () Bool)

(assert (=> b!648580 (= e!371991 e!371996)))

(declare-fun res!420208 () Bool)

(assert (=> b!648580 (=> res!420208 e!371996)))

(assert (=> b!648580 (= res!420208 (bvsge index!984 j!136))))

(declare-fun lt!301031 () Unit!22050)

(declare-fun e!371989 () Unit!22050)

(assert (=> b!648580 (= lt!301031 e!371989)))

(declare-fun c!74554 () Bool)

(assert (=> b!648580 (= c!74554 (bvslt j!136 index!984))))

(declare-fun b!648581 () Bool)

(declare-fun e!371997 () Bool)

(declare-fun e!371990 () Bool)

(assert (=> b!648581 (= e!371997 e!371990)))

(declare-fun res!420213 () Bool)

(assert (=> b!648581 (=> res!420213 e!371990)))

(declare-fun lt!301035 () (_ BitVec 64))

(assert (=> b!648581 (= res!420213 (or (not (= (select (arr!18464 a!2986) j!136) lt!301029)) (not (= (select (arr!18464 a!2986) j!136) lt!301035)) (bvsge j!136 index!984)))))

(declare-fun b!648582 () Bool)

(assert (=> b!648582 (= e!371983 e!371995)))

(declare-fun res!420210 () Bool)

(assert (=> b!648582 (=> (not res!420210) (not e!371995))))

(assert (=> b!648582 (= res!420210 (= (select (store (arr!18464 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648582 (= lt!301034 (array!38517 (store (arr!18464 a!2986) i!1108 k!1786) (size!18828 a!2986)))))

(declare-fun b!648583 () Bool)

(declare-fun res!420214 () Bool)

(assert (=> b!648583 (=> (not res!420214) (not e!371983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38516 (_ BitVec 32)) Bool)

(assert (=> b!648583 (= res!420214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648584 () Bool)

(assert (=> b!648584 (= e!371996 e!371993)))

(declare-fun res!420205 () Bool)

(assert (=> b!648584 (=> res!420205 e!371993)))

(assert (=> b!648584 (= res!420205 (or (bvsge (size!18828 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18828 a!2986))))))

(assert (=> b!648584 (arrayContainsKey!0 lt!301034 (select (arr!18464 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301025 () Unit!22050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38516 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22050)

(assert (=> b!648584 (= lt!301025 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301034 (select (arr!18464 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!371986 () Bool)

(assert (=> b!648584 e!371986))

(declare-fun res!420194 () Bool)

(assert (=> b!648584 (=> (not res!420194) (not e!371986))))

(assert (=> b!648584 (= res!420194 (arrayContainsKey!0 lt!301034 (select (arr!18464 a!2986) j!136) j!136))))

(declare-fun b!648585 () Bool)

(declare-fun res!420209 () Bool)

(assert (=> b!648585 (=> res!420209 e!371993)))

(declare-fun noDuplicate!422 (List!12505) Bool)

(assert (=> b!648585 (= res!420209 (not (noDuplicate!422 Nil!12502)))))

(declare-fun b!648586 () Bool)

(assert (=> b!648586 (= e!371992 e!371991)))

(declare-fun res!420202 () Bool)

(assert (=> b!648586 (=> res!420202 e!371991)))

(assert (=> b!648586 (= res!420202 (or (not (= (select (arr!18464 a!2986) j!136) lt!301029)) (not (= (select (arr!18464 a!2986) j!136) lt!301035))))))

(assert (=> b!648586 e!371997))

(declare-fun res!420197 () Bool)

(assert (=> b!648586 (=> (not res!420197) (not e!371997))))

(assert (=> b!648586 (= res!420197 (= lt!301035 (select (arr!18464 a!2986) j!136)))))

(assert (=> b!648586 (= lt!301035 (select (store (arr!18464 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!648587 () Bool)

(declare-fun Unit!22053 () Unit!22050)

(assert (=> b!648587 (= e!371989 Unit!22053)))

(declare-fun lt!301027 () Unit!22050)

(assert (=> b!648587 (= lt!301027 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301034 (select (arr!18464 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648587 (arrayContainsKey!0 lt!301034 (select (arr!18464 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301036 () Unit!22050)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38516 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12505) Unit!22050)

(assert (=> b!648587 (= lt!301036 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12502))))

(assert (=> b!648587 (arrayNoDuplicates!0 lt!301034 #b00000000000000000000000000000000 Nil!12502)))

(declare-fun lt!301028 () Unit!22050)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38516 (_ BitVec 32) (_ BitVec 32)) Unit!22050)

(assert (=> b!648587 (= lt!301028 (lemmaNoDuplicateFromThenFromBigger!0 lt!301034 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648587 (arrayNoDuplicates!0 lt!301034 j!136 Nil!12502)))

(declare-fun lt!301023 () Unit!22050)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38516 (_ BitVec 64) (_ BitVec 32) List!12505) Unit!22050)

(assert (=> b!648587 (= lt!301023 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301034 (select (arr!18464 a!2986) j!136) j!136 Nil!12502))))

(assert (=> b!648587 false))

(declare-fun b!648588 () Bool)

(declare-fun Unit!22054 () Unit!22050)

(assert (=> b!648588 (= e!371989 Unit!22054)))

(declare-fun b!648589 () Bool)

(declare-fun res!420201 () Bool)

(assert (=> b!648589 (=> (not res!420201) (not e!371983))))

(assert (=> b!648589 (= res!420201 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18464 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648590 () Bool)

(declare-fun res!420204 () Bool)

(assert (=> b!648590 (=> (not res!420204) (not e!371984))))

(assert (=> b!648590 (= res!420204 (and (= (size!18828 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18828 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18828 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648591 () Bool)

(assert (=> b!648591 (= e!371986 (arrayContainsKey!0 lt!301034 (select (arr!18464 a!2986) j!136) index!984))))

(declare-fun b!648592 () Bool)

(declare-fun Unit!22055 () Unit!22050)

(assert (=> b!648592 (= e!371985 Unit!22055)))

(declare-fun b!648593 () Bool)

(assert (=> b!648593 (= e!371982 (= lt!301030 lt!301032))))

(declare-fun b!648575 () Bool)

(assert (=> b!648575 (= e!371990 e!371987)))

(declare-fun res!420195 () Bool)

(assert (=> b!648575 (=> (not res!420195) (not e!371987))))

(assert (=> b!648575 (= res!420195 (arrayContainsKey!0 lt!301034 (select (arr!18464 a!2986) j!136) j!136))))

(declare-fun res!420200 () Bool)

(assert (=> start!58854 (=> (not res!420200) (not e!371984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58854 (= res!420200 (validMask!0 mask!3053))))

(assert (=> start!58854 e!371984))

(assert (=> start!58854 true))

(declare-fun array_inv!14260 (array!38516) Bool)

(assert (=> start!58854 (array_inv!14260 a!2986)))

(assert (= (and start!58854 res!420200) b!648590))

(assert (= (and b!648590 res!420204) b!648568))

(assert (= (and b!648568 res!420203) b!648578))

(assert (= (and b!648578 res!420211) b!648569))

(assert (= (and b!648569 res!420196) b!648570))

(assert (= (and b!648570 res!420207) b!648583))

(assert (= (and b!648583 res!420214) b!648571))

(assert (= (and b!648571 res!420199) b!648589))

(assert (= (and b!648589 res!420201) b!648582))

(assert (= (and b!648582 res!420210) b!648579))

(assert (= (and b!648579 res!420193) b!648574))

(assert (= (and b!648574 res!420215) b!648593))

(assert (= (and b!648574 c!74555) b!648572))

(assert (= (and b!648574 (not c!74555)) b!648592))

(assert (= (and b!648574 (not res!420212)) b!648586))

(assert (= (and b!648586 res!420197) b!648581))

(assert (= (and b!648581 (not res!420213)) b!648575))

(assert (= (and b!648575 res!420195) b!648573))

(assert (= (and b!648586 (not res!420202)) b!648580))

(assert (= (and b!648580 c!74554) b!648587))

(assert (= (and b!648580 (not c!74554)) b!648588))

(assert (= (and b!648580 (not res!420208)) b!648584))

(assert (= (and b!648584 res!420194) b!648591))

(assert (= (and b!648584 (not res!420205)) b!648585))

(assert (= (and b!648585 (not res!420209)) b!648577))

(assert (= (and b!648577 (not res!420198)) b!648567))

(assert (= (and b!648567 (not res!420206)) b!648576))

(declare-fun m!621917 () Bool)

(assert (=> b!648584 m!621917))

(assert (=> b!648584 m!621917))

(declare-fun m!621919 () Bool)

(assert (=> b!648584 m!621919))

(assert (=> b!648584 m!621917))

(declare-fun m!621921 () Bool)

(assert (=> b!648584 m!621921))

(assert (=> b!648584 m!621917))

(declare-fun m!621923 () Bool)

(assert (=> b!648584 m!621923))

(declare-fun m!621925 () Bool)

(assert (=> b!648589 m!621925))

(declare-fun m!621927 () Bool)

(assert (=> start!58854 m!621927))

(declare-fun m!621929 () Bool)

(assert (=> start!58854 m!621929))

(declare-fun m!621931 () Bool)

(assert (=> b!648579 m!621931))

(assert (=> b!648579 m!621917))

(assert (=> b!648579 m!621917))

(declare-fun m!621933 () Bool)

(assert (=> b!648579 m!621933))

(declare-fun m!621935 () Bool)

(assert (=> b!648567 m!621935))

(declare-fun m!621937 () Bool)

(assert (=> b!648583 m!621937))

(declare-fun m!621939 () Bool)

(assert (=> b!648569 m!621939))

(assert (=> b!648568 m!621917))

(assert (=> b!648568 m!621917))

(declare-fun m!621941 () Bool)

(assert (=> b!648568 m!621941))

(declare-fun m!621943 () Bool)

(assert (=> b!648576 m!621943))

(declare-fun m!621945 () Bool)

(assert (=> b!648582 m!621945))

(declare-fun m!621947 () Bool)

(assert (=> b!648582 m!621947))

(declare-fun m!621949 () Bool)

(assert (=> b!648570 m!621949))

(declare-fun m!621951 () Bool)

(assert (=> b!648571 m!621951))

(declare-fun m!621953 () Bool)

(assert (=> b!648577 m!621953))

(assert (=> b!648581 m!621917))

(assert (=> b!648575 m!621917))

(assert (=> b!648575 m!621917))

(assert (=> b!648575 m!621923))

(declare-fun m!621955 () Bool)

(assert (=> b!648585 m!621955))

(declare-fun m!621957 () Bool)

(assert (=> b!648574 m!621957))

(declare-fun m!621959 () Bool)

(assert (=> b!648574 m!621959))

(assert (=> b!648574 m!621917))

(declare-fun m!621961 () Bool)

(assert (=> b!648574 m!621961))

(declare-fun m!621963 () Bool)

(assert (=> b!648574 m!621963))

(assert (=> b!648574 m!621945))

(declare-fun m!621965 () Bool)

(assert (=> b!648574 m!621965))

(assert (=> b!648574 m!621917))

(declare-fun m!621967 () Bool)

(assert (=> b!648574 m!621967))

(assert (=> b!648573 m!621917))

(assert (=> b!648573 m!621917))

(declare-fun m!621969 () Bool)

(assert (=> b!648573 m!621969))

(assert (=> b!648587 m!621917))

(declare-fun m!621971 () Bool)

(assert (=> b!648587 m!621971))

(assert (=> b!648587 m!621917))

(declare-fun m!621973 () Bool)

(assert (=> b!648587 m!621973))

(assert (=> b!648587 m!621917))

(declare-fun m!621975 () Bool)

(assert (=> b!648587 m!621975))

(assert (=> b!648587 m!621917))

(declare-fun m!621977 () Bool)

(assert (=> b!648587 m!621977))

(declare-fun m!621979 () Bool)

(assert (=> b!648587 m!621979))

(declare-fun m!621981 () Bool)

(assert (=> b!648587 m!621981))

(declare-fun m!621983 () Bool)

(assert (=> b!648587 m!621983))

(assert (=> b!648591 m!621917))

(assert (=> b!648591 m!621917))

(assert (=> b!648591 m!621969))

(assert (=> b!648586 m!621917))

(assert (=> b!648586 m!621945))

(declare-fun m!621985 () Bool)

(assert (=> b!648586 m!621985))

(declare-fun m!621987 () Bool)

(assert (=> b!648578 m!621987))

(push 1)

