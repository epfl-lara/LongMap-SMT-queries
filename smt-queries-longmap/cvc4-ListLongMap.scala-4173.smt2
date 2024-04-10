; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56838 () Bool)

(assert start!56838)

(declare-fun b!629648 () Bool)

(declare-fun res!407044 () Bool)

(declare-fun e!360059 () Bool)

(assert (=> b!629648 (=> (not res!407044) (not e!360059))))

(declare-datatypes ((array!38028 0))(
  ( (array!38029 (arr!18251 (Array (_ BitVec 32) (_ BitVec 64))) (size!18615 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38028)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38028 (_ BitVec 32)) Bool)

(assert (=> b!629648 (= res!407044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!407049 () Bool)

(declare-fun e!360060 () Bool)

(assert (=> start!56838 (=> (not res!407049) (not e!360060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56838 (= res!407049 (validMask!0 mask!3053))))

(assert (=> start!56838 e!360060))

(assert (=> start!56838 true))

(declare-fun array_inv!14047 (array!38028) Bool)

(assert (=> start!56838 (array_inv!14047 a!2986)))

(declare-fun b!629649 () Bool)

(declare-fun e!360057 () Bool)

(declare-datatypes ((SeekEntryResult!6691 0))(
  ( (MissingZero!6691 (index!29048 (_ BitVec 32))) (Found!6691 (index!29049 (_ BitVec 32))) (Intermediate!6691 (undefined!7503 Bool) (index!29050 (_ BitVec 32)) (x!57779 (_ BitVec 32))) (Undefined!6691) (MissingVacant!6691 (index!29051 (_ BitVec 32))) )
))
(declare-fun lt!290827 () SeekEntryResult!6691)

(declare-fun lt!290828 () SeekEntryResult!6691)

(assert (=> b!629649 (= e!360057 (not (= lt!290827 lt!290828)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!290826 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38028 (_ BitVec 32)) SeekEntryResult!6691)

(assert (=> b!629649 (= lt!290828 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290826 vacantSpotIndex!68 (select (store (arr!18251 a!2986) i!1108 k!1786) j!136) (array!38029 (store (arr!18251 a!2986) i!1108 k!1786) (size!18615 a!2986)) mask!3053))))

(assert (=> b!629649 (= lt!290828 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290826 vacantSpotIndex!68 (select (arr!18251 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21124 0))(
  ( (Unit!21125) )
))
(declare-fun lt!290829 () Unit!21124)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38028 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21124)

(assert (=> b!629649 (= lt!290829 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290826 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629649 (= lt!290826 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629650 () Bool)

(declare-fun res!407051 () Bool)

(assert (=> b!629650 (=> (not res!407051) (not e!360060))))

(assert (=> b!629650 (= res!407051 (and (= (size!18615 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18615 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18615 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629651 () Bool)

(declare-fun res!407042 () Bool)

(assert (=> b!629651 (=> (not res!407042) (not e!360059))))

(declare-datatypes ((List!12292 0))(
  ( (Nil!12289) (Cons!12288 (h!13333 (_ BitVec 64)) (t!18520 List!12292)) )
))
(declare-fun arrayNoDuplicates!0 (array!38028 (_ BitVec 32) List!12292) Bool)

(assert (=> b!629651 (= res!407042 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12289))))

(declare-fun b!629652 () Bool)

(declare-fun res!407043 () Bool)

(assert (=> b!629652 (=> (not res!407043) (not e!360060))))

(declare-fun arrayContainsKey!0 (array!38028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629652 (= res!407043 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629653 () Bool)

(declare-fun res!407046 () Bool)

(assert (=> b!629653 (=> (not res!407046) (not e!360059))))

(assert (=> b!629653 (= res!407046 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18251 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18251 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629654 () Bool)

(assert (=> b!629654 (= e!360060 e!360059)))

(declare-fun res!407045 () Bool)

(assert (=> b!629654 (=> (not res!407045) (not e!360059))))

(declare-fun lt!290830 () SeekEntryResult!6691)

(assert (=> b!629654 (= res!407045 (or (= lt!290830 (MissingZero!6691 i!1108)) (= lt!290830 (MissingVacant!6691 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38028 (_ BitVec 32)) SeekEntryResult!6691)

(assert (=> b!629654 (= lt!290830 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!629655 () Bool)

(declare-fun res!407047 () Bool)

(assert (=> b!629655 (=> (not res!407047) (not e!360060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629655 (= res!407047 (validKeyInArray!0 k!1786))))

(declare-fun b!629656 () Bool)

(declare-fun res!407048 () Bool)

(assert (=> b!629656 (=> (not res!407048) (not e!360060))))

(assert (=> b!629656 (= res!407048 (validKeyInArray!0 (select (arr!18251 a!2986) j!136)))))

(declare-fun b!629657 () Bool)

(assert (=> b!629657 (= e!360059 e!360057)))

(declare-fun res!407050 () Bool)

(assert (=> b!629657 (=> (not res!407050) (not e!360057))))

(assert (=> b!629657 (= res!407050 (and (= lt!290827 (Found!6691 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18251 a!2986) index!984) (select (arr!18251 a!2986) j!136))) (not (= (select (arr!18251 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!629657 (= lt!290827 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18251 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!56838 res!407049) b!629650))

(assert (= (and b!629650 res!407051) b!629656))

(assert (= (and b!629656 res!407048) b!629655))

(assert (= (and b!629655 res!407047) b!629652))

(assert (= (and b!629652 res!407043) b!629654))

(assert (= (and b!629654 res!407045) b!629648))

(assert (= (and b!629648 res!407044) b!629651))

(assert (= (and b!629651 res!407042) b!629653))

(assert (= (and b!629653 res!407046) b!629657))

(assert (= (and b!629657 res!407050) b!629649))

(declare-fun m!604693 () Bool)

(assert (=> b!629657 m!604693))

(declare-fun m!604695 () Bool)

(assert (=> b!629657 m!604695))

(assert (=> b!629657 m!604695))

(declare-fun m!604697 () Bool)

(assert (=> b!629657 m!604697))

(declare-fun m!604699 () Bool)

(assert (=> b!629648 m!604699))

(declare-fun m!604701 () Bool)

(assert (=> start!56838 m!604701))

(declare-fun m!604703 () Bool)

(assert (=> start!56838 m!604703))

(declare-fun m!604705 () Bool)

(assert (=> b!629655 m!604705))

(declare-fun m!604707 () Bool)

(assert (=> b!629651 m!604707))

(declare-fun m!604709 () Bool)

(assert (=> b!629652 m!604709))

(declare-fun m!604711 () Bool)

(assert (=> b!629649 m!604711))

(declare-fun m!604713 () Bool)

(assert (=> b!629649 m!604713))

(assert (=> b!629649 m!604695))

(declare-fun m!604715 () Bool)

(assert (=> b!629649 m!604715))

(assert (=> b!629649 m!604695))

(assert (=> b!629649 m!604713))

(declare-fun m!604717 () Bool)

(assert (=> b!629649 m!604717))

(declare-fun m!604719 () Bool)

(assert (=> b!629649 m!604719))

(declare-fun m!604721 () Bool)

(assert (=> b!629649 m!604721))

(declare-fun m!604723 () Bool)

(assert (=> b!629654 m!604723))

(assert (=> b!629656 m!604695))

(assert (=> b!629656 m!604695))

(declare-fun m!604725 () Bool)

(assert (=> b!629656 m!604725))

(declare-fun m!604727 () Bool)

(assert (=> b!629653 m!604727))

(assert (=> b!629653 m!604719))

(declare-fun m!604729 () Bool)

(assert (=> b!629653 m!604729))

(push 1)

(assert (not b!629652))

(assert (not b!629657))

(assert (not b!629649))

(assert (not b!629651))

(assert (not b!629656))

(assert (not start!56838))

(assert (not b!629654))

(assert (not b!629655))

(assert (not b!629648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89143 () Bool)

(declare-fun res!407062 () Bool)

(declare-fun e!360095 () Bool)

(assert (=> d!89143 (=> res!407062 e!360095)))

(assert (=> d!89143 (= res!407062 (= (select (arr!18251 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!89143 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!360095)))

(declare-fun b!629716 () Bool)

(declare-fun e!360096 () Bool)

(assert (=> b!629716 (= e!360095 e!360096)))

(declare-fun res!407063 () Bool)

(assert (=> b!629716 (=> (not res!407063) (not e!360096))))

(assert (=> b!629716 (= res!407063 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18615 a!2986)))))

(declare-fun b!629717 () Bool)

(assert (=> b!629717 (= e!360096 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89143 (not res!407062)) b!629716))

(assert (= (and b!629716 res!407063) b!629717))

(declare-fun m!604775 () Bool)

(assert (=> d!89143 m!604775))

(declare-fun m!604777 () Bool)

(assert (=> b!629717 m!604777))

(assert (=> b!629652 d!89143))

(declare-fun b!629755 () Bool)

(declare-fun e!360123 () Bool)

(declare-fun e!360121 () Bool)

(assert (=> b!629755 (= e!360123 e!360121)))

(declare-fun c!71708 () Bool)

(assert (=> b!629755 (= c!71708 (validKeyInArray!0 (select (arr!18251 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629756 () Bool)

(declare-fun e!360120 () Bool)

(assert (=> b!629756 (= e!360120 e!360123)))

(declare-fun res!407075 () Bool)

(assert (=> b!629756 (=> (not res!407075) (not e!360123))))

(declare-fun e!360122 () Bool)

(assert (=> b!629756 (= res!407075 (not e!360122))))

(declare-fun res!407073 () Bool)

(assert (=> b!629756 (=> (not res!407073) (not e!360122))))

(assert (=> b!629756 (= res!407073 (validKeyInArray!0 (select (arr!18251 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629757 () Bool)

(declare-fun contains!3084 (List!12292 (_ BitVec 64)) Bool)

(assert (=> b!629757 (= e!360122 (contains!3084 Nil!12289 (select (arr!18251 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629758 () Bool)

(declare-fun call!33296 () Bool)

(assert (=> b!629758 (= e!360121 call!33296)))

(declare-fun d!89149 () Bool)

(declare-fun res!407074 () Bool)

(assert (=> d!89149 (=> res!407074 e!360120)))

(assert (=> d!89149 (= res!407074 (bvsge #b00000000000000000000000000000000 (size!18615 a!2986)))))

(assert (=> d!89149 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12289) e!360120)))

(declare-fun b!629759 () Bool)

(assert (=> b!629759 (= e!360121 call!33296)))

(declare-fun bm!33293 () Bool)

(assert (=> bm!33293 (= call!33296 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71708 (Cons!12288 (select (arr!18251 a!2986) #b00000000000000000000000000000000) Nil!12289) Nil!12289)))))

(assert (= (and d!89149 (not res!407074)) b!629756))

(assert (= (and b!629756 res!407073) b!629757))

(assert (= (and b!629756 res!407075) b!629755))

(assert (= (and b!629755 c!71708) b!629758))

(assert (= (and b!629755 (not c!71708)) b!629759))

