; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59600 () Bool)

(assert start!59600)

(declare-fun b!658875 () Bool)

(declare-fun e!378510 () Bool)

(declare-fun e!378512 () Bool)

(assert (=> b!658875 (= e!378510 e!378512)))

(declare-fun res!427291 () Bool)

(assert (=> b!658875 (=> (not res!427291) (not e!378512))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7016 0))(
  ( (MissingZero!7016 (index!30429 (_ BitVec 32))) (Found!7016 (index!30430 (_ BitVec 32))) (Intermediate!7016 (undefined!7828 Bool) (index!30431 (_ BitVec 32)) (x!59219 (_ BitVec 32))) (Undefined!7016) (MissingVacant!7016 (index!30432 (_ BitVec 32))) )
))
(declare-fun lt!308235 () SeekEntryResult!7016)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38758 0))(
  ( (array!38759 (arr!18576 (Array (_ BitVec 32) (_ BitVec 64))) (size!18940 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38758)

(assert (=> b!658875 (= res!427291 (and (= lt!308235 (Found!7016 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18576 a!2986) index!984) (select (arr!18576 a!2986) j!136))) (not (= (select (arr!18576 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38758 (_ BitVec 32)) SeekEntryResult!7016)

(assert (=> b!658875 (= lt!308235 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18576 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658876 () Bool)

(declare-datatypes ((Unit!22914 0))(
  ( (Unit!22915) )
))
(declare-fun e!378516 () Unit!22914)

(declare-fun Unit!22916 () Unit!22914)

(assert (=> b!658876 (= e!378516 Unit!22916)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!427284 () Bool)

(assert (=> b!658876 (= res!427284 (= (select (store (arr!18576 a!2986) i!1108 k!1786) index!984) (select (arr!18576 a!2986) j!136)))))

(declare-fun e!378509 () Bool)

(assert (=> b!658876 (=> (not res!427284) (not e!378509))))

(assert (=> b!658876 e!378509))

(declare-fun c!76163 () Bool)

(assert (=> b!658876 (= c!76163 (bvslt j!136 index!984))))

(declare-fun lt!308230 () Unit!22914)

(declare-fun e!378514 () Unit!22914)

(assert (=> b!658876 (= lt!308230 e!378514)))

(declare-fun c!76164 () Bool)

(assert (=> b!658876 (= c!76164 (bvslt index!984 j!136))))

(declare-fun lt!308229 () Unit!22914)

(declare-fun e!378511 () Unit!22914)

(assert (=> b!658876 (= lt!308229 e!378511)))

(assert (=> b!658876 false))

(declare-fun b!658877 () Bool)

(declare-fun lt!308243 () array!38758)

(declare-fun res!427287 () Bool)

(declare-fun arrayContainsKey!0 (array!38758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658877 (= res!427287 (arrayContainsKey!0 lt!308243 (select (arr!18576 a!2986) j!136) j!136))))

(declare-fun e!378515 () Bool)

(assert (=> b!658877 (=> (not res!427287) (not e!378515))))

(declare-fun e!378513 () Bool)

(assert (=> b!658877 (= e!378513 e!378515)))

(declare-fun b!658878 () Bool)

(assert (=> b!658878 (= e!378512 (not true))))

(declare-fun lt!308237 () Unit!22914)

(assert (=> b!658878 (= lt!308237 e!378516)))

(declare-fun c!76166 () Bool)

(declare-fun lt!308248 () SeekEntryResult!7016)

(assert (=> b!658878 (= c!76166 (= lt!308248 (Found!7016 index!984)))))

(declare-fun lt!308239 () Unit!22914)

(declare-fun e!378518 () Unit!22914)

(assert (=> b!658878 (= lt!308239 e!378518)))

(declare-fun c!76165 () Bool)

(assert (=> b!658878 (= c!76165 (= lt!308248 Undefined!7016))))

(declare-fun lt!308232 () (_ BitVec 64))

(assert (=> b!658878 (= lt!308248 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308232 lt!308243 mask!3053))))

(declare-fun e!378520 () Bool)

(assert (=> b!658878 e!378520))

(declare-fun res!427289 () Bool)

(assert (=> b!658878 (=> (not res!427289) (not e!378520))))

(declare-fun lt!308245 () (_ BitVec 32))

(declare-fun lt!308234 () SeekEntryResult!7016)

(assert (=> b!658878 (= res!427289 (= lt!308234 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308245 vacantSpotIndex!68 lt!308232 lt!308243 mask!3053)))))

(assert (=> b!658878 (= lt!308234 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308245 vacantSpotIndex!68 (select (arr!18576 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658878 (= lt!308232 (select (store (arr!18576 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!308238 () Unit!22914)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38758 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22914)

(assert (=> b!658878 (= lt!308238 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308245 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658878 (= lt!308245 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658879 () Bool)

(declare-fun res!427285 () Bool)

(declare-fun e!378521 () Bool)

(assert (=> b!658879 (=> (not res!427285) (not e!378521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658879 (= res!427285 (validKeyInArray!0 k!1786))))

(declare-fun b!658880 () Bool)

(declare-fun e!378519 () Bool)

(assert (=> b!658880 (= e!378519 e!378510)))

(declare-fun res!427290 () Bool)

(assert (=> b!658880 (=> (not res!427290) (not e!378510))))

(assert (=> b!658880 (= res!427290 (= (select (store (arr!18576 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658880 (= lt!308243 (array!38759 (store (arr!18576 a!2986) i!1108 k!1786) (size!18940 a!2986)))))

(declare-fun b!658881 () Bool)

(declare-fun Unit!22917 () Unit!22914)

(assert (=> b!658881 (= e!378518 Unit!22917)))

(assert (=> b!658881 false))

(declare-fun b!658882 () Bool)

(declare-fun Unit!22918 () Unit!22914)

(assert (=> b!658882 (= e!378518 Unit!22918)))

(declare-fun b!658883 () Bool)

(assert (=> b!658883 (= e!378521 e!378519)))

(declare-fun res!427295 () Bool)

(assert (=> b!658883 (=> (not res!427295) (not e!378519))))

(declare-fun lt!308240 () SeekEntryResult!7016)

(assert (=> b!658883 (= res!427295 (or (= lt!308240 (MissingZero!7016 i!1108)) (= lt!308240 (MissingVacant!7016 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38758 (_ BitVec 32)) SeekEntryResult!7016)

(assert (=> b!658883 (= lt!308240 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!658884 () Bool)

(declare-fun res!427286 () Bool)

(assert (=> b!658884 (=> (not res!427286) (not e!378519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38758 (_ BitVec 32)) Bool)

(assert (=> b!658884 (= res!427286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658885 () Bool)

(declare-fun res!427292 () Bool)

(assert (=> b!658885 (=> (not res!427292) (not e!378521))))

(assert (=> b!658885 (= res!427292 (validKeyInArray!0 (select (arr!18576 a!2986) j!136)))))

(declare-fun b!658886 () Bool)

(declare-fun res!427294 () Bool)

(assert (=> b!658886 (=> (not res!427294) (not e!378519))))

(assert (=> b!658886 (= res!427294 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18576 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!378522 () Bool)

(declare-fun b!658887 () Bool)

(assert (=> b!658887 (= e!378522 (arrayContainsKey!0 lt!308243 (select (arr!18576 a!2986) j!136) index!984))))

(declare-fun b!658888 () Bool)

(assert (=> b!658888 false))

(declare-fun lt!308247 () Unit!22914)

(declare-datatypes ((List!12617 0))(
  ( (Nil!12614) (Cons!12613 (h!13658 (_ BitVec 64)) (t!18845 List!12617)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38758 (_ BitVec 64) (_ BitVec 32) List!12617) Unit!22914)

(assert (=> b!658888 (= lt!308247 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308243 (select (arr!18576 a!2986) j!136) j!136 Nil!12614))))

(declare-fun arrayNoDuplicates!0 (array!38758 (_ BitVec 32) List!12617) Bool)

(assert (=> b!658888 (arrayNoDuplicates!0 lt!308243 j!136 Nil!12614)))

(declare-fun lt!308246 () Unit!22914)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38758 (_ BitVec 32) (_ BitVec 32)) Unit!22914)

(assert (=> b!658888 (= lt!308246 (lemmaNoDuplicateFromThenFromBigger!0 lt!308243 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658888 (arrayNoDuplicates!0 lt!308243 #b00000000000000000000000000000000 Nil!12614)))

(declare-fun lt!308244 () Unit!22914)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38758 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12617) Unit!22914)

(assert (=> b!658888 (= lt!308244 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12614))))

(assert (=> b!658888 (arrayContainsKey!0 lt!308243 (select (arr!18576 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308236 () Unit!22914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38758 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22914)

(assert (=> b!658888 (= lt!308236 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308243 (select (arr!18576 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22919 () Unit!22914)

(assert (=> b!658888 (= e!378514 Unit!22919)))

(declare-fun b!658889 () Bool)

(declare-fun Unit!22920 () Unit!22914)

(assert (=> b!658889 (= e!378511 Unit!22920)))

(declare-fun b!658890 () Bool)

(declare-fun res!427297 () Bool)

(assert (=> b!658890 (=> (not res!427297) (not e!378519))))

(assert (=> b!658890 (= res!427297 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12614))))

(declare-fun res!427288 () Bool)

(assert (=> start!59600 (=> (not res!427288) (not e!378521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59600 (= res!427288 (validMask!0 mask!3053))))

(assert (=> start!59600 e!378521))

(assert (=> start!59600 true))

(declare-fun array_inv!14372 (array!38758) Bool)

(assert (=> start!59600 (array_inv!14372 a!2986)))

(declare-fun b!658891 () Bool)

(assert (=> b!658891 false))

(declare-fun lt!308231 () Unit!22914)

(assert (=> b!658891 (= lt!308231 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308243 (select (arr!18576 a!2986) j!136) index!984 Nil!12614))))

(assert (=> b!658891 (arrayNoDuplicates!0 lt!308243 index!984 Nil!12614)))

(declare-fun lt!308241 () Unit!22914)

(assert (=> b!658891 (= lt!308241 (lemmaNoDuplicateFromThenFromBigger!0 lt!308243 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658891 (arrayNoDuplicates!0 lt!308243 #b00000000000000000000000000000000 Nil!12614)))

(declare-fun lt!308233 () Unit!22914)

(assert (=> b!658891 (= lt!308233 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12614))))

(assert (=> b!658891 (arrayContainsKey!0 lt!308243 (select (arr!18576 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308242 () Unit!22914)

(assert (=> b!658891 (= lt!308242 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308243 (select (arr!18576 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!658891 e!378522))

(declare-fun res!427296 () Bool)

(assert (=> b!658891 (=> (not res!427296) (not e!378522))))

(assert (=> b!658891 (= res!427296 (arrayContainsKey!0 lt!308243 (select (arr!18576 a!2986) j!136) j!136))))

(declare-fun Unit!22921 () Unit!22914)

(assert (=> b!658891 (= e!378511 Unit!22921)))

(declare-fun b!658892 () Bool)

(assert (=> b!658892 (= e!378520 (= lt!308235 lt!308234))))

(declare-fun b!658893 () Bool)

(declare-fun res!427283 () Bool)

(assert (=> b!658893 (=> (not res!427283) (not e!378521))))

(assert (=> b!658893 (= res!427283 (and (= (size!18940 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18940 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18940 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658894 () Bool)

(declare-fun Unit!22922 () Unit!22914)

(assert (=> b!658894 (= e!378516 Unit!22922)))

(declare-fun b!658895 () Bool)

(declare-fun res!427293 () Bool)

(assert (=> b!658895 (=> (not res!427293) (not e!378521))))

(assert (=> b!658895 (= res!427293 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658896 () Bool)

(assert (=> b!658896 (= e!378515 (arrayContainsKey!0 lt!308243 (select (arr!18576 a!2986) j!136) index!984))))

(declare-fun b!658897 () Bool)

(declare-fun Unit!22923 () Unit!22914)

(assert (=> b!658897 (= e!378514 Unit!22923)))

(declare-fun b!658898 () Bool)

(declare-fun res!427298 () Bool)

(assert (=> b!658898 (= res!427298 (bvsge j!136 index!984))))

(assert (=> b!658898 (=> res!427298 e!378513)))

(assert (=> b!658898 (= e!378509 e!378513)))

(assert (= (and start!59600 res!427288) b!658893))

(assert (= (and b!658893 res!427283) b!658885))

(assert (= (and b!658885 res!427292) b!658879))

(assert (= (and b!658879 res!427285) b!658895))

(assert (= (and b!658895 res!427293) b!658883))

(assert (= (and b!658883 res!427295) b!658884))

(assert (= (and b!658884 res!427286) b!658890))

(assert (= (and b!658890 res!427297) b!658886))

(assert (= (and b!658886 res!427294) b!658880))

(assert (= (and b!658880 res!427290) b!658875))

(assert (= (and b!658875 res!427291) b!658878))

(assert (= (and b!658878 res!427289) b!658892))

(assert (= (and b!658878 c!76165) b!658881))

(assert (= (and b!658878 (not c!76165)) b!658882))

(assert (= (and b!658878 c!76166) b!658876))

(assert (= (and b!658878 (not c!76166)) b!658894))

(assert (= (and b!658876 res!427284) b!658898))

(assert (= (and b!658898 (not res!427298)) b!658877))

(assert (= (and b!658877 res!427287) b!658896))

(assert (= (and b!658876 c!76163) b!658888))

(assert (= (and b!658876 (not c!76163)) b!658897))

(assert (= (and b!658876 c!76164) b!658891))

(assert (= (and b!658876 (not c!76164)) b!658889))

(assert (= (and b!658891 res!427296) b!658887))

(declare-fun m!631847 () Bool)

(assert (=> b!658888 m!631847))

(declare-fun m!631849 () Bool)

(assert (=> b!658888 m!631849))

(assert (=> b!658888 m!631849))

(declare-fun m!631851 () Bool)

(assert (=> b!658888 m!631851))

(assert (=> b!658888 m!631849))

(declare-fun m!631853 () Bool)

(assert (=> b!658888 m!631853))

(declare-fun m!631855 () Bool)

(assert (=> b!658888 m!631855))

(declare-fun m!631857 () Bool)

(assert (=> b!658888 m!631857))

(assert (=> b!658888 m!631849))

(declare-fun m!631859 () Bool)

(assert (=> b!658888 m!631859))

(declare-fun m!631861 () Bool)

(assert (=> b!658888 m!631861))

(declare-fun m!631863 () Bool)

(assert (=> b!658876 m!631863))

(declare-fun m!631865 () Bool)

(assert (=> b!658876 m!631865))

(assert (=> b!658876 m!631849))

(declare-fun m!631867 () Bool)

(assert (=> b!658878 m!631867))

(declare-fun m!631869 () Bool)

(assert (=> b!658878 m!631869))

(assert (=> b!658878 m!631849))

(assert (=> b!658878 m!631863))

(declare-fun m!631871 () Bool)

(assert (=> b!658878 m!631871))

(declare-fun m!631873 () Bool)

(assert (=> b!658878 m!631873))

(declare-fun m!631875 () Bool)

(assert (=> b!658878 m!631875))

(assert (=> b!658878 m!631849))

(declare-fun m!631877 () Bool)

(assert (=> b!658878 m!631877))

(assert (=> b!658896 m!631849))

(assert (=> b!658896 m!631849))

(declare-fun m!631879 () Bool)

(assert (=> b!658896 m!631879))

(declare-fun m!631881 () Bool)

(assert (=> b!658890 m!631881))

(assert (=> b!658887 m!631849))

(assert (=> b!658887 m!631849))

(assert (=> b!658887 m!631879))

(declare-fun m!631883 () Bool)

(assert (=> b!658886 m!631883))

(declare-fun m!631885 () Bool)

(assert (=> start!59600 m!631885))

(declare-fun m!631887 () Bool)

(assert (=> start!59600 m!631887))

(assert (=> b!658877 m!631849))

(assert (=> b!658877 m!631849))

(declare-fun m!631889 () Bool)

(assert (=> b!658877 m!631889))

(declare-fun m!631891 () Bool)

(assert (=> b!658884 m!631891))

(assert (=> b!658885 m!631849))

(assert (=> b!658885 m!631849))

(declare-fun m!631893 () Bool)

(assert (=> b!658885 m!631893))

(declare-fun m!631895 () Bool)

(assert (=> b!658883 m!631895))

(declare-fun m!631897 () Bool)

(assert (=> b!658879 m!631897))

(assert (=> b!658880 m!631863))

(declare-fun m!631899 () Bool)

(assert (=> b!658880 m!631899))

(declare-fun m!631901 () Bool)

(assert (=> b!658875 m!631901))

(assert (=> b!658875 m!631849))

(assert (=> b!658875 m!631849))

(declare-fun m!631903 () Bool)

(assert (=> b!658875 m!631903))

(declare-fun m!631905 () Bool)

(assert (=> b!658895 m!631905))

(declare-fun m!631907 () Bool)

(assert (=> b!658891 m!631907))

(assert (=> b!658891 m!631849))

(declare-fun m!631909 () Bool)

(assert (=> b!658891 m!631909))

(declare-fun m!631911 () Bool)

(assert (=> b!658891 m!631911))

(assert (=> b!658891 m!631849))

(assert (=> b!658891 m!631849))

(declare-fun m!631913 () Bool)

(assert (=> b!658891 m!631913))

(assert (=> b!658891 m!631855))

(assert (=> b!658891 m!631861))

(assert (=> b!658891 m!631849))

(declare-fun m!631915 () Bool)

(assert (=> b!658891 m!631915))

(assert (=> b!658891 m!631849))

(assert (=> b!658891 m!631889))

(push 1)

