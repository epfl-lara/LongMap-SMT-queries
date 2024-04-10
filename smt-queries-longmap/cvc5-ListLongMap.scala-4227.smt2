; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58130 () Bool)

(assert start!58130)

(declare-fun res!416153 () Bool)

(declare-fun e!367908 () Bool)

(assert (=> start!58130 (=> (not res!416153) (not e!367908))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58130 (= res!416153 (validMask!0 mask!3053))))

(assert (=> start!58130 e!367908))

(assert (=> start!58130 true))

(declare-datatypes ((array!38389 0))(
  ( (array!38390 (arr!18411 (Array (_ BitVec 32) (_ BitVec 64))) (size!18775 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38389)

(declare-fun array_inv!14207 (array!38389) Bool)

(assert (=> start!58130 (array_inv!14207 a!2986)))

(declare-fun b!642431 () Bool)

(declare-fun e!367915 () Bool)

(declare-fun e!367913 () Bool)

(assert (=> b!642431 (= e!367915 e!367913)))

(declare-fun res!416161 () Bool)

(assert (=> b!642431 (=> (not res!416161) (not e!367913))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6851 0))(
  ( (MissingZero!6851 (index!29730 (_ BitVec 32))) (Found!6851 (index!29731 (_ BitVec 32))) (Intermediate!6851 (undefined!7663 Bool) (index!29732 (_ BitVec 32)) (x!58497 (_ BitVec 32))) (Undefined!6851) (MissingVacant!6851 (index!29733 (_ BitVec 32))) )
))
(declare-fun lt!297508 () SeekEntryResult!6851)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!642431 (= res!416161 (and (= lt!297508 (Found!6851 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18411 a!2986) index!984) (select (arr!18411 a!2986) j!136))) (not (= (select (arr!18411 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38389 (_ BitVec 32)) SeekEntryResult!6851)

(assert (=> b!642431 (= lt!297508 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18411 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642432 () Bool)

(declare-fun res!416152 () Bool)

(declare-fun e!367906 () Bool)

(assert (=> b!642432 (=> (not res!416152) (not e!367906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38389 (_ BitVec 32)) Bool)

(assert (=> b!642432 (= res!416152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642433 () Bool)

(declare-fun e!367916 () Bool)

(declare-fun e!367912 () Bool)

(assert (=> b!642433 (= e!367916 e!367912)))

(declare-fun res!416151 () Bool)

(assert (=> b!642433 (=> res!416151 e!367912)))

(declare-fun lt!297509 () (_ BitVec 64))

(declare-fun lt!297516 () (_ BitVec 64))

(assert (=> b!642433 (= res!416151 (or (not (= (select (arr!18411 a!2986) j!136) lt!297509)) (not (= (select (arr!18411 a!2986) j!136) lt!297516)) (bvsge j!136 index!984)))))

(declare-fun b!642434 () Bool)

(declare-fun res!416160 () Bool)

(assert (=> b!642434 (=> (not res!416160) (not e!367906))))

(assert (=> b!642434 (= res!416160 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18411 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642435 () Bool)

(declare-fun res!416164 () Bool)

(assert (=> b!642435 (=> (not res!416164) (not e!367908))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642435 (= res!416164 (validKeyInArray!0 k!1786))))

(declare-fun b!642436 () Bool)

(declare-fun e!367910 () Bool)

(assert (=> b!642436 (= e!367913 (not e!367910))))

(declare-fun res!416157 () Bool)

(assert (=> b!642436 (=> res!416157 e!367910)))

(declare-fun lt!297518 () SeekEntryResult!6851)

(assert (=> b!642436 (= res!416157 (not (= lt!297518 (Found!6851 index!984))))))

(declare-datatypes ((Unit!21738 0))(
  ( (Unit!21739) )
))
(declare-fun lt!297515 () Unit!21738)

(declare-fun e!367911 () Unit!21738)

(assert (=> b!642436 (= lt!297515 e!367911)))

(declare-fun c!73508 () Bool)

(assert (=> b!642436 (= c!73508 (= lt!297518 Undefined!6851))))

(declare-fun lt!297520 () array!38389)

(assert (=> b!642436 (= lt!297518 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297509 lt!297520 mask!3053))))

(declare-fun e!367909 () Bool)

(assert (=> b!642436 e!367909))

(declare-fun res!416149 () Bool)

(assert (=> b!642436 (=> (not res!416149) (not e!367909))))

(declare-fun lt!297513 () (_ BitVec 32))

(declare-fun lt!297512 () SeekEntryResult!6851)

(assert (=> b!642436 (= res!416149 (= lt!297512 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297513 vacantSpotIndex!68 lt!297509 lt!297520 mask!3053)))))

(assert (=> b!642436 (= lt!297512 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297513 vacantSpotIndex!68 (select (arr!18411 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!642436 (= lt!297509 (select (store (arr!18411 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!297510 () Unit!21738)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38389 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21738)

(assert (=> b!642436 (= lt!297510 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297513 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642436 (= lt!297513 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642437 () Bool)

(assert (=> b!642437 (= e!367909 (= lt!297508 lt!297512))))

(declare-fun b!642438 () Bool)

(declare-fun res!416150 () Bool)

(assert (=> b!642438 (=> (not res!416150) (not e!367908))))

(assert (=> b!642438 (= res!416150 (validKeyInArray!0 (select (arr!18411 a!2986) j!136)))))

(declare-fun b!642439 () Bool)

(assert (=> b!642439 (= e!367906 e!367915)))

(declare-fun res!416163 () Bool)

(assert (=> b!642439 (=> (not res!416163) (not e!367915))))

(assert (=> b!642439 (= res!416163 (= (select (store (arr!18411 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642439 (= lt!297520 (array!38390 (store (arr!18411 a!2986) i!1108 k!1786) (size!18775 a!2986)))))

(declare-fun b!642440 () Bool)

(declare-fun Unit!21740 () Unit!21738)

(assert (=> b!642440 (= e!367911 Unit!21740)))

(declare-fun b!642441 () Bool)

(assert (=> b!642441 (= e!367908 e!367906)))

(declare-fun res!416159 () Bool)

(assert (=> b!642441 (=> (not res!416159) (not e!367906))))

(declare-fun lt!297511 () SeekEntryResult!6851)

(assert (=> b!642441 (= res!416159 (or (= lt!297511 (MissingZero!6851 i!1108)) (= lt!297511 (MissingVacant!6851 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38389 (_ BitVec 32)) SeekEntryResult!6851)

(assert (=> b!642441 (= lt!297511 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!642442 () Bool)

(declare-fun Unit!21741 () Unit!21738)

(assert (=> b!642442 (= e!367911 Unit!21741)))

(assert (=> b!642442 false))

(declare-fun b!642443 () Bool)

(declare-fun e!367917 () Bool)

(declare-fun arrayContainsKey!0 (array!38389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642443 (= e!367917 (arrayContainsKey!0 lt!297520 (select (arr!18411 a!2986) j!136) index!984))))

(declare-fun b!642444 () Bool)

(declare-fun res!416165 () Bool)

(assert (=> b!642444 (=> (not res!416165) (not e!367908))))

(assert (=> b!642444 (= res!416165 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642445 () Bool)

(assert (=> b!642445 (= e!367912 e!367917)))

(declare-fun res!416158 () Bool)

(assert (=> b!642445 (=> (not res!416158) (not e!367917))))

(assert (=> b!642445 (= res!416158 (arrayContainsKey!0 lt!297520 (select (arr!18411 a!2986) j!136) j!136))))

(declare-fun b!642446 () Bool)

(declare-fun e!367907 () Bool)

(assert (=> b!642446 (= e!367910 e!367907)))

(declare-fun res!416156 () Bool)

(assert (=> b!642446 (=> res!416156 e!367907)))

(assert (=> b!642446 (= res!416156 (or (not (= (select (arr!18411 a!2986) j!136) lt!297509)) (not (= (select (arr!18411 a!2986) j!136) lt!297516)) (bvsge j!136 index!984)))))

(assert (=> b!642446 e!367916))

(declare-fun res!416154 () Bool)

(assert (=> b!642446 (=> (not res!416154) (not e!367916))))

(assert (=> b!642446 (= res!416154 (= lt!297516 (select (arr!18411 a!2986) j!136)))))

(assert (=> b!642446 (= lt!297516 (select (store (arr!18411 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!642447 () Bool)

(declare-fun res!416155 () Bool)

(assert (=> b!642447 (=> (not res!416155) (not e!367908))))

(assert (=> b!642447 (= res!416155 (and (= (size!18775 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18775 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18775 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642448 () Bool)

(declare-fun res!416162 () Bool)

(assert (=> b!642448 (=> (not res!416162) (not e!367906))))

(declare-datatypes ((List!12452 0))(
  ( (Nil!12449) (Cons!12448 (h!13493 (_ BitVec 64)) (t!18680 List!12452)) )
))
(declare-fun arrayNoDuplicates!0 (array!38389 (_ BitVec 32) List!12452) Bool)

(assert (=> b!642448 (= res!416162 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12449))))

(declare-fun b!642449 () Bool)

(assert (=> b!642449 (= e!367907 false)))

(assert (=> b!642449 (not (= lt!297509 (select (arr!18411 a!2986) j!136)))))

(declare-fun lt!297519 () Unit!21738)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38389 (_ BitVec 64) (_ BitVec 32) List!12452) Unit!21738)

(assert (=> b!642449 (= lt!297519 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297520 (select (arr!18411 a!2986) j!136) j!136 Nil!12449))))

(assert (=> b!642449 (arrayNoDuplicates!0 lt!297520 j!136 Nil!12449)))

(declare-fun lt!297507 () Unit!21738)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38389 (_ BitVec 32) (_ BitVec 32)) Unit!21738)

(assert (=> b!642449 (= lt!297507 (lemmaNoDuplicateFromThenFromBigger!0 lt!297520 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642449 (arrayNoDuplicates!0 lt!297520 #b00000000000000000000000000000000 Nil!12449)))

(declare-fun lt!297514 () Unit!21738)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12452) Unit!21738)

(assert (=> b!642449 (= lt!297514 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12449))))

(assert (=> b!642449 (arrayContainsKey!0 lt!297520 (select (arr!18411 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297517 () Unit!21738)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21738)

(assert (=> b!642449 (= lt!297517 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297520 (select (arr!18411 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!58130 res!416153) b!642447))

(assert (= (and b!642447 res!416155) b!642438))

(assert (= (and b!642438 res!416150) b!642435))

(assert (= (and b!642435 res!416164) b!642444))

(assert (= (and b!642444 res!416165) b!642441))

(assert (= (and b!642441 res!416159) b!642432))

(assert (= (and b!642432 res!416152) b!642448))

(assert (= (and b!642448 res!416162) b!642434))

(assert (= (and b!642434 res!416160) b!642439))

(assert (= (and b!642439 res!416163) b!642431))

(assert (= (and b!642431 res!416161) b!642436))

(assert (= (and b!642436 res!416149) b!642437))

(assert (= (and b!642436 c!73508) b!642442))

(assert (= (and b!642436 (not c!73508)) b!642440))

(assert (= (and b!642436 (not res!416157)) b!642446))

(assert (= (and b!642446 res!416154) b!642433))

(assert (= (and b!642433 (not res!416151)) b!642445))

(assert (= (and b!642445 res!416158) b!642443))

(assert (= (and b!642446 (not res!416156)) b!642449))

(declare-fun m!616205 () Bool)

(assert (=> b!642444 m!616205))

(declare-fun m!616207 () Bool)

(assert (=> b!642436 m!616207))

(declare-fun m!616209 () Bool)

(assert (=> b!642436 m!616209))

(declare-fun m!616211 () Bool)

(assert (=> b!642436 m!616211))

(declare-fun m!616213 () Bool)

(assert (=> b!642436 m!616213))

(declare-fun m!616215 () Bool)

(assert (=> b!642436 m!616215))

(assert (=> b!642436 m!616211))

(declare-fun m!616217 () Bool)

(assert (=> b!642436 m!616217))

(declare-fun m!616219 () Bool)

(assert (=> b!642436 m!616219))

(declare-fun m!616221 () Bool)

(assert (=> b!642436 m!616221))

(declare-fun m!616223 () Bool)

(assert (=> b!642431 m!616223))

(assert (=> b!642431 m!616211))

(assert (=> b!642431 m!616211))

(declare-fun m!616225 () Bool)

(assert (=> b!642431 m!616225))

(declare-fun m!616227 () Bool)

(assert (=> b!642441 m!616227))

(declare-fun m!616229 () Bool)

(assert (=> b!642432 m!616229))

(declare-fun m!616231 () Bool)

(assert (=> b!642434 m!616231))

(assert (=> b!642439 m!616221))

(declare-fun m!616233 () Bool)

(assert (=> b!642439 m!616233))

(assert (=> b!642443 m!616211))

(assert (=> b!642443 m!616211))

(declare-fun m!616235 () Bool)

(assert (=> b!642443 m!616235))

(assert (=> b!642449 m!616211))

(declare-fun m!616237 () Bool)

(assert (=> b!642449 m!616237))

(assert (=> b!642449 m!616211))

(assert (=> b!642449 m!616211))

(declare-fun m!616239 () Bool)

(assert (=> b!642449 m!616239))

(assert (=> b!642449 m!616211))

(declare-fun m!616241 () Bool)

(assert (=> b!642449 m!616241))

(declare-fun m!616243 () Bool)

(assert (=> b!642449 m!616243))

(declare-fun m!616245 () Bool)

(assert (=> b!642449 m!616245))

(declare-fun m!616247 () Bool)

(assert (=> b!642449 m!616247))

(declare-fun m!616249 () Bool)

(assert (=> b!642449 m!616249))

(assert (=> b!642438 m!616211))

(assert (=> b!642438 m!616211))

(declare-fun m!616251 () Bool)

(assert (=> b!642438 m!616251))

(declare-fun m!616253 () Bool)

(assert (=> b!642448 m!616253))

(declare-fun m!616255 () Bool)

(assert (=> start!58130 m!616255))

(declare-fun m!616257 () Bool)

(assert (=> start!58130 m!616257))

(assert (=> b!642445 m!616211))

(assert (=> b!642445 m!616211))

(declare-fun m!616259 () Bool)

(assert (=> b!642445 m!616259))

(assert (=> b!642446 m!616211))

(assert (=> b!642446 m!616221))

(declare-fun m!616261 () Bool)

(assert (=> b!642446 m!616261))

(assert (=> b!642433 m!616211))

(declare-fun m!616263 () Bool)

(assert (=> b!642435 m!616263))

(push 1)

