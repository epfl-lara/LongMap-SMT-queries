; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58126 () Bool)

(assert start!58126)

(declare-fun b!642305 () Bool)

(declare-fun e!367833 () Bool)

(declare-fun e!367837 () Bool)

(assert (=> b!642305 (= e!367833 e!367837)))

(declare-fun res!416053 () Bool)

(assert (=> b!642305 (=> res!416053 e!367837)))

(declare-datatypes ((array!38385 0))(
  ( (array!38386 (arr!18409 (Array (_ BitVec 32) (_ BitVec 64))) (size!18773 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38385)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!642305 (= res!416053 (or (bvsge (size!18773 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18773 a!2986))))))

(declare-fun lt!297436 () array!38385)

(declare-datatypes ((List!12450 0))(
  ( (Nil!12447) (Cons!12446 (h!13491 (_ BitVec 64)) (t!18678 List!12450)) )
))
(declare-fun arrayNoDuplicates!0 (array!38385 (_ BitVec 32) List!12450) Bool)

(assert (=> b!642305 (arrayNoDuplicates!0 lt!297436 j!136 Nil!12447)))

(declare-datatypes ((Unit!21730 0))(
  ( (Unit!21731) )
))
(declare-fun lt!297434 () Unit!21730)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38385 (_ BitVec 32) (_ BitVec 32)) Unit!21730)

(assert (=> b!642305 (= lt!297434 (lemmaNoDuplicateFromThenFromBigger!0 lt!297436 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642305 (arrayNoDuplicates!0 lt!297436 #b00000000000000000000000000000000 Nil!12447)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!297427 () Unit!21730)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38385 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12450) Unit!21730)

(assert (=> b!642305 (= lt!297427 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12447))))

(declare-fun arrayContainsKey!0 (array!38385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642305 (arrayContainsKey!0 lt!297436 (select (arr!18409 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297432 () Unit!21730)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38385 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21730)

(assert (=> b!642305 (= lt!297432 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297436 (select (arr!18409 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!642306 () Bool)

(declare-fun res!416045 () Bool)

(declare-fun e!367839 () Bool)

(assert (=> b!642306 (=> (not res!416045) (not e!367839))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!642306 (= res!416045 (and (= (size!18773 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18773 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18773 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642307 () Bool)

(declare-fun res!416049 () Bool)

(assert (=> b!642307 (=> res!416049 e!367837)))

(declare-fun contains!3137 (List!12450 (_ BitVec 64)) Bool)

(assert (=> b!642307 (= res!416049 (contains!3137 Nil!12447 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642308 () Bool)

(declare-fun e!367831 () Bool)

(declare-fun e!367832 () Bool)

(assert (=> b!642308 (= e!367831 e!367832)))

(declare-fun res!416039 () Bool)

(assert (=> b!642308 (=> (not res!416039) (not e!367832))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6849 0))(
  ( (MissingZero!6849 (index!29722 (_ BitVec 32))) (Found!6849 (index!29723 (_ BitVec 32))) (Intermediate!6849 (undefined!7661 Bool) (index!29724 (_ BitVec 32)) (x!58487 (_ BitVec 32))) (Undefined!6849) (MissingVacant!6849 (index!29725 (_ BitVec 32))) )
))
(declare-fun lt!297423 () SeekEntryResult!6849)

(assert (=> b!642308 (= res!416039 (and (= lt!297423 (Found!6849 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18409 a!2986) index!984) (select (arr!18409 a!2986) j!136))) (not (= (select (arr!18409 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38385 (_ BitVec 32)) SeekEntryResult!6849)

(assert (=> b!642308 (= lt!297423 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18409 a!2986) j!136) a!2986 mask!3053))))

(declare-fun e!367835 () Bool)

(declare-fun b!642309 () Bool)

(assert (=> b!642309 (= e!367835 (arrayContainsKey!0 lt!297436 (select (arr!18409 a!2986) j!136) index!984))))

(declare-fun b!642310 () Bool)

(assert (=> b!642310 (= e!367837 true)))

(declare-fun lt!297424 () Bool)

(assert (=> b!642310 (= lt!297424 (contains!3137 Nil!12447 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642311 () Bool)

(declare-fun e!367841 () Bool)

(assert (=> b!642311 (= e!367841 e!367833)))

(declare-fun res!416035 () Bool)

(assert (=> b!642311 (=> res!416035 e!367833)))

(declare-fun lt!297433 () (_ BitVec 64))

(declare-fun lt!297426 () (_ BitVec 64))

(assert (=> b!642311 (= res!416035 (or (not (= (select (arr!18409 a!2986) j!136) lt!297426)) (not (= (select (arr!18409 a!2986) j!136) lt!297433)) (bvsge j!136 index!984)))))

(declare-fun e!367836 () Bool)

(assert (=> b!642311 e!367836))

(declare-fun res!416037 () Bool)

(assert (=> b!642311 (=> (not res!416037) (not e!367836))))

(assert (=> b!642311 (= res!416037 (= lt!297433 (select (arr!18409 a!2986) j!136)))))

(assert (=> b!642311 (= lt!297433 (select (store (arr!18409 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!642312 () Bool)

(assert (=> b!642312 (= e!367832 (not e!367841))))

(declare-fun res!416046 () Bool)

(assert (=> b!642312 (=> res!416046 e!367841)))

(declare-fun lt!297428 () SeekEntryResult!6849)

(assert (=> b!642312 (= res!416046 (not (= lt!297428 (Found!6849 index!984))))))

(declare-fun lt!297430 () Unit!21730)

(declare-fun e!367840 () Unit!21730)

(assert (=> b!642312 (= lt!297430 e!367840)))

(declare-fun c!73502 () Bool)

(assert (=> b!642312 (= c!73502 (= lt!297428 Undefined!6849))))

(assert (=> b!642312 (= lt!297428 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297426 lt!297436 mask!3053))))

(declare-fun e!367834 () Bool)

(assert (=> b!642312 e!367834))

(declare-fun res!416052 () Bool)

(assert (=> b!642312 (=> (not res!416052) (not e!367834))))

(declare-fun lt!297425 () SeekEntryResult!6849)

(declare-fun lt!297429 () (_ BitVec 32))

(assert (=> b!642312 (= res!416052 (= lt!297425 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297429 vacantSpotIndex!68 lt!297426 lt!297436 mask!3053)))))

(assert (=> b!642312 (= lt!297425 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297429 vacantSpotIndex!68 (select (arr!18409 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642312 (= lt!297426 (select (store (arr!18409 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297431 () Unit!21730)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21730)

(assert (=> b!642312 (= lt!297431 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297429 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642312 (= lt!297429 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642314 () Bool)

(declare-fun e!367830 () Bool)

(assert (=> b!642314 (= e!367836 e!367830)))

(declare-fun res!416044 () Bool)

(assert (=> b!642314 (=> res!416044 e!367830)))

(assert (=> b!642314 (= res!416044 (or (not (= (select (arr!18409 a!2986) j!136) lt!297426)) (not (= (select (arr!18409 a!2986) j!136) lt!297433)) (bvsge j!136 index!984)))))

(declare-fun b!642315 () Bool)

(assert (=> b!642315 (= e!367830 e!367835)))

(declare-fun res!416054 () Bool)

(assert (=> b!642315 (=> (not res!416054) (not e!367835))))

(assert (=> b!642315 (= res!416054 (arrayContainsKey!0 lt!297436 (select (arr!18409 a!2986) j!136) j!136))))

(declare-fun b!642316 () Bool)

(declare-fun res!416048 () Bool)

(assert (=> b!642316 (=> res!416048 e!367837)))

(declare-fun noDuplicate!409 (List!12450) Bool)

(assert (=> b!642316 (= res!416048 (not (noDuplicate!409 Nil!12447)))))

(declare-fun b!642317 () Bool)

(declare-fun res!416042 () Bool)

(assert (=> b!642317 (=> (not res!416042) (not e!367839))))

(assert (=> b!642317 (= res!416042 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642318 () Bool)

(declare-fun Unit!21732 () Unit!21730)

(assert (=> b!642318 (= e!367840 Unit!21732)))

(declare-fun b!642319 () Bool)

(declare-fun res!416050 () Bool)

(declare-fun e!367838 () Bool)

(assert (=> b!642319 (=> (not res!416050) (not e!367838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38385 (_ BitVec 32)) Bool)

(assert (=> b!642319 (= res!416050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642320 () Bool)

(declare-fun Unit!21733 () Unit!21730)

(assert (=> b!642320 (= e!367840 Unit!21733)))

(assert (=> b!642320 false))

(declare-fun b!642321 () Bool)

(declare-fun res!416047 () Bool)

(assert (=> b!642321 (=> (not res!416047) (not e!367838))))

(assert (=> b!642321 (= res!416047 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12447))))

(declare-fun b!642322 () Bool)

(declare-fun res!416043 () Bool)

(assert (=> b!642322 (=> (not res!416043) (not e!367839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642322 (= res!416043 (validKeyInArray!0 k0!1786))))

(declare-fun b!642323 () Bool)

(assert (=> b!642323 (= e!367834 (= lt!297423 lt!297425))))

(declare-fun b!642313 () Bool)

(assert (=> b!642313 (= e!367839 e!367838)))

(declare-fun res!416040 () Bool)

(assert (=> b!642313 (=> (not res!416040) (not e!367838))))

(declare-fun lt!297435 () SeekEntryResult!6849)

(assert (=> b!642313 (= res!416040 (or (= lt!297435 (MissingZero!6849 i!1108)) (= lt!297435 (MissingVacant!6849 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38385 (_ BitVec 32)) SeekEntryResult!6849)

(assert (=> b!642313 (= lt!297435 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!416041 () Bool)

(assert (=> start!58126 (=> (not res!416041) (not e!367839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58126 (= res!416041 (validMask!0 mask!3053))))

(assert (=> start!58126 e!367839))

(assert (=> start!58126 true))

(declare-fun array_inv!14205 (array!38385) Bool)

(assert (=> start!58126 (array_inv!14205 a!2986)))

(declare-fun b!642324 () Bool)

(declare-fun res!416036 () Bool)

(assert (=> b!642324 (=> (not res!416036) (not e!367838))))

(assert (=> b!642324 (= res!416036 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18409 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642325 () Bool)

(declare-fun res!416051 () Bool)

(assert (=> b!642325 (=> (not res!416051) (not e!367839))))

(assert (=> b!642325 (= res!416051 (validKeyInArray!0 (select (arr!18409 a!2986) j!136)))))

(declare-fun b!642326 () Bool)

(assert (=> b!642326 (= e!367838 e!367831)))

(declare-fun res!416038 () Bool)

(assert (=> b!642326 (=> (not res!416038) (not e!367831))))

(assert (=> b!642326 (= res!416038 (= (select (store (arr!18409 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642326 (= lt!297436 (array!38386 (store (arr!18409 a!2986) i!1108 k0!1786) (size!18773 a!2986)))))

(assert (= (and start!58126 res!416041) b!642306))

(assert (= (and b!642306 res!416045) b!642325))

(assert (= (and b!642325 res!416051) b!642322))

(assert (= (and b!642322 res!416043) b!642317))

(assert (= (and b!642317 res!416042) b!642313))

(assert (= (and b!642313 res!416040) b!642319))

(assert (= (and b!642319 res!416050) b!642321))

(assert (= (and b!642321 res!416047) b!642324))

(assert (= (and b!642324 res!416036) b!642326))

(assert (= (and b!642326 res!416038) b!642308))

(assert (= (and b!642308 res!416039) b!642312))

(assert (= (and b!642312 res!416052) b!642323))

(assert (= (and b!642312 c!73502) b!642320))

(assert (= (and b!642312 (not c!73502)) b!642318))

(assert (= (and b!642312 (not res!416046)) b!642311))

(assert (= (and b!642311 res!416037) b!642314))

(assert (= (and b!642314 (not res!416044)) b!642315))

(assert (= (and b!642315 res!416054) b!642309))

(assert (= (and b!642311 (not res!416035)) b!642305))

(assert (= (and b!642305 (not res!416053)) b!642316))

(assert (= (and b!642316 (not res!416048)) b!642307))

(assert (= (and b!642307 (not res!416049)) b!642310))

(declare-fun m!616077 () Bool)

(assert (=> b!642310 m!616077))

(declare-fun m!616079 () Bool)

(assert (=> start!58126 m!616079))

(declare-fun m!616081 () Bool)

(assert (=> start!58126 m!616081))

(declare-fun m!616083 () Bool)

(assert (=> b!642319 m!616083))

(declare-fun m!616085 () Bool)

(assert (=> b!642309 m!616085))

(assert (=> b!642309 m!616085))

(declare-fun m!616087 () Bool)

(assert (=> b!642309 m!616087))

(declare-fun m!616089 () Bool)

(assert (=> b!642316 m!616089))

(assert (=> b!642325 m!616085))

(assert (=> b!642325 m!616085))

(declare-fun m!616091 () Bool)

(assert (=> b!642325 m!616091))

(declare-fun m!616093 () Bool)

(assert (=> b!642305 m!616093))

(assert (=> b!642305 m!616085))

(assert (=> b!642305 m!616085))

(declare-fun m!616095 () Bool)

(assert (=> b!642305 m!616095))

(declare-fun m!616097 () Bool)

(assert (=> b!642305 m!616097))

(assert (=> b!642305 m!616085))

(declare-fun m!616099 () Bool)

(assert (=> b!642305 m!616099))

(declare-fun m!616101 () Bool)

(assert (=> b!642305 m!616101))

(declare-fun m!616103 () Bool)

(assert (=> b!642305 m!616103))

(declare-fun m!616105 () Bool)

(assert (=> b!642312 m!616105))

(declare-fun m!616107 () Bool)

(assert (=> b!642312 m!616107))

(assert (=> b!642312 m!616085))

(declare-fun m!616109 () Bool)

(assert (=> b!642312 m!616109))

(assert (=> b!642312 m!616085))

(declare-fun m!616111 () Bool)

(assert (=> b!642312 m!616111))

(declare-fun m!616113 () Bool)

(assert (=> b!642312 m!616113))

(declare-fun m!616115 () Bool)

(assert (=> b!642312 m!616115))

(declare-fun m!616117 () Bool)

(assert (=> b!642312 m!616117))

(declare-fun m!616119 () Bool)

(assert (=> b!642317 m!616119))

(assert (=> b!642315 m!616085))

(assert (=> b!642315 m!616085))

(declare-fun m!616121 () Bool)

(assert (=> b!642315 m!616121))

(assert (=> b!642314 m!616085))

(declare-fun m!616123 () Bool)

(assert (=> b!642324 m!616123))

(declare-fun m!616125 () Bool)

(assert (=> b!642307 m!616125))

(declare-fun m!616127 () Bool)

(assert (=> b!642313 m!616127))

(declare-fun m!616129 () Bool)

(assert (=> b!642322 m!616129))

(assert (=> b!642311 m!616085))

(assert (=> b!642311 m!616111))

(declare-fun m!616131 () Bool)

(assert (=> b!642311 m!616131))

(declare-fun m!616133 () Bool)

(assert (=> b!642321 m!616133))

(assert (=> b!642326 m!616111))

(declare-fun m!616135 () Bool)

(assert (=> b!642326 m!616135))

(declare-fun m!616137 () Bool)

(assert (=> b!642308 m!616137))

(assert (=> b!642308 m!616085))

(assert (=> b!642308 m!616085))

(declare-fun m!616139 () Bool)

(assert (=> b!642308 m!616139))

(check-sat (not b!642312) (not b!642309) (not b!642308) (not b!642305) (not start!58126) (not b!642319) (not b!642307) (not b!642325) (not b!642315) (not b!642322) (not b!642316) (not b!642317) (not b!642321) (not b!642313) (not b!642310))
(check-sat)
