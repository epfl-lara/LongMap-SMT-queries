; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56332 () Bool)

(assert start!56332)

(declare-fun b!624647 () Bool)

(declare-fun e!358161 () Bool)

(declare-fun e!358159 () Bool)

(assert (=> b!624647 (= e!358161 e!358159)))

(declare-fun res!402797 () Bool)

(assert (=> b!624647 (=> (not res!402797) (not e!358159))))

(declare-datatypes ((SeekEntryResult!6563 0))(
  ( (MissingZero!6563 (index!28536 (_ BitVec 32))) (Found!6563 (index!28537 (_ BitVec 32))) (Intermediate!6563 (undefined!7375 Bool) (index!28538 (_ BitVec 32)) (x!57294 (_ BitVec 32))) (Undefined!6563) (MissingVacant!6563 (index!28539 (_ BitVec 32))) )
))
(declare-fun lt!289642 () SeekEntryResult!6563)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624647 (= res!402797 (or (= lt!289642 (MissingZero!6563 i!1108)) (= lt!289642 (MissingVacant!6563 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37757 0))(
  ( (array!37758 (arr!18123 (Array (_ BitVec 32) (_ BitVec 64))) (size!18487 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37757)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37757 (_ BitVec 32)) SeekEntryResult!6563)

(assert (=> b!624647 (= lt!289642 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624648 () Bool)

(declare-fun res!402802 () Bool)

(assert (=> b!624648 (=> (not res!402802) (not e!358159))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624648 (= res!402802 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18123 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18123 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624649 () Bool)

(declare-fun res!402806 () Bool)

(assert (=> b!624649 (=> (not res!402806) (not e!358159))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37757 (_ BitVec 32)) SeekEntryResult!6563)

(assert (=> b!624649 (= res!402806 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18123 a!2986) j!136) a!2986 mask!3053) (Found!6563 j!136)))))

(declare-fun b!624650 () Bool)

(declare-fun res!402804 () Bool)

(assert (=> b!624650 (=> (not res!402804) (not e!358161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624650 (= res!402804 (validKeyInArray!0 (select (arr!18123 a!2986) j!136)))))

(declare-fun b!624651 () Bool)

(assert (=> b!624651 (= e!358159 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun b!624652 () Bool)

(declare-fun res!402799 () Bool)

(assert (=> b!624652 (=> (not res!402799) (not e!358161))))

(declare-fun arrayContainsKey!0 (array!37757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624652 (= res!402799 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624653 () Bool)

(declare-fun res!402801 () Bool)

(assert (=> b!624653 (=> (not res!402801) (not e!358161))))

(assert (=> b!624653 (= res!402801 (and (= (size!18487 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18487 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18487 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624654 () Bool)

(declare-fun res!402803 () Bool)

(assert (=> b!624654 (=> (not res!402803) (not e!358161))))

(assert (=> b!624654 (= res!402803 (validKeyInArray!0 k!1786))))

(declare-fun b!624655 () Bool)

(declare-fun res!402805 () Bool)

(assert (=> b!624655 (=> (not res!402805) (not e!358159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37757 (_ BitVec 32)) Bool)

(assert (=> b!624655 (= res!402805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!402798 () Bool)

(assert (=> start!56332 (=> (not res!402798) (not e!358161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56332 (= res!402798 (validMask!0 mask!3053))))

(assert (=> start!56332 e!358161))

(assert (=> start!56332 true))

(declare-fun array_inv!13919 (array!37757) Bool)

(assert (=> start!56332 (array_inv!13919 a!2986)))

(declare-fun b!624656 () Bool)

(declare-fun res!402800 () Bool)

(assert (=> b!624656 (=> (not res!402800) (not e!358159))))

(declare-datatypes ((List!12164 0))(
  ( (Nil!12161) (Cons!12160 (h!13205 (_ BitVec 64)) (t!18392 List!12164)) )
))
(declare-fun arrayNoDuplicates!0 (array!37757 (_ BitVec 32) List!12164) Bool)

(assert (=> b!624656 (= res!402800 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12161))))

(assert (= (and start!56332 res!402798) b!624653))

(assert (= (and b!624653 res!402801) b!624650))

(assert (= (and b!624650 res!402804) b!624654))

(assert (= (and b!624654 res!402803) b!624652))

(assert (= (and b!624652 res!402799) b!624647))

(assert (= (and b!624647 res!402797) b!624655))

(assert (= (and b!624655 res!402805) b!624656))

(assert (= (and b!624656 res!402800) b!624648))

(assert (= (and b!624648 res!402802) b!624649))

(assert (= (and b!624649 res!402806) b!624651))

(declare-fun m!600335 () Bool)

(assert (=> b!624654 m!600335))

(declare-fun m!600337 () Bool)

(assert (=> b!624648 m!600337))

(declare-fun m!600339 () Bool)

(assert (=> b!624648 m!600339))

(declare-fun m!600341 () Bool)

(assert (=> b!624648 m!600341))

(declare-fun m!600343 () Bool)

(assert (=> b!624649 m!600343))

(assert (=> b!624649 m!600343))

(declare-fun m!600345 () Bool)

(assert (=> b!624649 m!600345))

(declare-fun m!600347 () Bool)

(assert (=> b!624652 m!600347))

(declare-fun m!600349 () Bool)

(assert (=> b!624647 m!600349))

(assert (=> b!624650 m!600343))

(assert (=> b!624650 m!600343))

(declare-fun m!600351 () Bool)

(assert (=> b!624650 m!600351))

(declare-fun m!600353 () Bool)

(assert (=> b!624655 m!600353))

(declare-fun m!600355 () Bool)

(assert (=> b!624656 m!600355))

(declare-fun m!600357 () Bool)

(assert (=> start!56332 m!600357))

(declare-fun m!600359 () Bool)

(assert (=> start!56332 m!600359))

(push 1)

(assert (not b!624647))

(assert (not b!624655))

(assert (not b!624652))

(assert (not b!624656))

(assert (not b!624649))

(assert (not start!56332))

(assert (not b!624654))

(assert (not b!624650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!624727 () Bool)

(declare-fun e!358191 () Bool)

(declare-fun call!33203 () Bool)

(assert (=> b!624727 (= e!358191 call!33203)))

(declare-fun bm!33200 () Bool)

(declare-fun c!71294 () Bool)

(assert (=> bm!33200 (= call!33203 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71294 (Cons!12160 (select (arr!18123 a!2986) #b00000000000000000000000000000000) Nil!12161) Nil!12161)))))

(declare-fun b!624728 () Bool)

(declare-fun e!358189 () Bool)

(declare-fun e!358190 () Bool)

(assert (=> b!624728 (= e!358189 e!358190)))

(declare-fun res!402873 () Bool)

(assert (=> b!624728 (=> (not res!402873) (not e!358190))))

(declare-fun e!358188 () Bool)

(assert (=> b!624728 (= res!402873 (not e!358188))))

(declare-fun res!402875 () Bool)

(assert (=> b!624728 (=> (not res!402875) (not e!358188))))

(assert (=> b!624728 (= res!402875 (validKeyInArray!0 (select (arr!18123 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!624729 () Bool)

(assert (=> b!624729 (= e!358190 e!358191)))

(assert (=> b!624729 (= c!71294 (validKeyInArray!0 (select (arr!18123 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!624730 () Bool)

(declare-fun contains!3074 (List!12164 (_ BitVec 64)) Bool)

(assert (=> b!624730 (= e!358188 (contains!3074 Nil!12161 (select (arr!18123 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88759 () Bool)

(declare-fun res!402874 () Bool)

(assert (=> d!88759 (=> res!402874 e!358189)))

(assert (=> d!88759 (= res!402874 (bvsge #b00000000000000000000000000000000 (size!18487 a!2986)))))

(assert (=> d!88759 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12161) e!358189)))

(declare-fun b!624731 () Bool)

(assert (=> b!624731 (= e!358191 call!33203)))

(assert (= (and d!88759 (not res!402874)) b!624728))

(assert (= (and b!624728 res!402875) b!624730))

(assert (= (and b!624728 res!402873) b!624729))

(assert (= (and b!624729 c!71294) b!624731))

(assert (= (and b!624729 (not c!71294)) b!624727))

(assert (= (or b!624731 b!624727) bm!33200))

(declare-fun m!600413 () Bool)

(assert (=> bm!33200 m!600413))

(declare-fun m!600415 () Bool)

(assert (=> bm!33200 m!600415))

(assert (=> b!624728 m!600413))

(assert (=> b!624728 m!600413))

(declare-fun m!600417 () Bool)

(assert (=> b!624728 m!600417))

(assert (=> b!624729 m!600413))

(assert (=> b!624729 m!600413))

(assert (=> b!624729 m!600417))

(assert (=> b!624730 m!600413))

(assert (=> b!624730 m!600413))

(declare-fun m!600419 () Bool)

(assert (=> b!624730 m!600419))

(assert (=> b!624656 d!88759))

(declare-fun d!88761 () Bool)

(assert (=> d!88761 (= (validKeyInArray!0 (select (arr!18123 a!2986) j!136)) (and (not (= (select (arr!18123 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18123 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!624650 d!88761))

(declare-fun b!624758 () Bool)

(declare-fun e!358207 () Bool)

(declare-fun call!33206 () Bool)

(assert (=> b!624758 (= e!358207 call!33206)))

(declare-fun d!88763 () Bool)

(declare-fun res!402880 () Bool)

(declare-fun e!358208 () Bool)

(assert (=> d!88763 (=> res!402880 e!358208)))

(assert (=> d!88763 (= res!402880 (bvsge #b00000000000000000000000000000000 (size!18487 a!2986)))))

(assert (=> d!88763 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!358208)))

(declare-fun b!624759 () Bool)

(declare-fun e!358209 () Bool)

(assert (=> b!624759 (= e!358209 e!358207)))

(declare-fun lt!289664 () (_ BitVec 64))

(assert (=> b!624759 (= lt!289664 (select (arr!18123 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21090 0))(
  ( (Unit!21091) )
))
(declare-fun lt!289665 () Unit!21090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37757 (_ BitVec 64) (_ BitVec 32)) Unit!21090)

(assert (=> b!624759 (= lt!289665 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!289664 #b00000000000000000000000000000000))))

(assert (=> b!624759 (arrayContainsKey!0 a!2986 lt!289664 #b00000000000000000000000000000000)))

(declare-fun lt!289666 () Unit!21090)

(assert (=> b!624759 (= lt!289666 lt!289665)))

(declare-fun res!402881 () Bool)

(assert (=> b!624759 (= res!402881 (= (seekEntryOrOpen!0 (select (arr!18123 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6563 #b00000000000000000000000000000000)))))

(assert (=> b!624759 (=> (not res!402881) (not e!358207))))

(declare-fun b!624760 () Bool)

(assert (=> b!624760 (= e!358209 call!33206)))

(declare-fun b!624761 () Bool)

(assert (=> b!624761 (= e!358208 e!358209)))

(declare-fun c!71306 () Bool)

(assert (=> b!624761 (= c!71306 (validKeyInArray!0 (select (arr!18123 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33203 () Bool)

(assert (=> bm!33203 (= call!33206 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!88763 (not res!402880)) b!624761))

(assert (= (and b!624761 c!71306) b!624759))

(assert (= (and b!624761 (not c!71306)) b!624760))

(assert (= (and b!624759 res!402881) b!624758))

(assert (= (or b!624758 b!624760) bm!33203))

(assert (=> b!624759 m!600413))

(declare-fun m!600435 () Bool)

(assert (=> b!624759 m!600435))

(declare-fun m!600437 () Bool)

(assert (=> b!624759 m!600437))

(assert (=> b!624759 m!600413))

(declare-fun m!600439 () Bool)

(assert (=> b!624759 m!600439))

(assert (=> b!624761 m!600413))

(assert (=> b!624761 m!600413))

(assert (=> b!624761 m!600417))

(declare-fun m!600441 () Bool)

(assert (=> bm!33203 m!600441))

(assert (=> b!624655 d!88763))

(declare-fun b!624807 () Bool)

(declare-fun e!358245 () SeekEntryResult!6563)

(assert (=> b!624807 (= e!358245 (MissingVacant!6563 vacantSpotIndex!68))))

(declare-fun b!624808 () Bool)

(declare-fun e!358244 () SeekEntryResult!6563)

(declare-fun e!358243 () SeekEntryResult!6563)

(assert (=> b!624808 (= e!358244 e!358243)))

(declare-fun lt!289681 () (_ BitVec 64))

(declare-fun c!71320 () Bool)

(assert (=> b!624808 (= c!71320 (= lt!289681 (select (arr!18123 a!2986) j!136)))))

(declare-fun b!624809 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!624809 (= e!358245 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18123 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!289680 () SeekEntryResult!6563)

(declare-fun d!88767 () Bool)

(assert (=> d!88767 (and (or (is-Undefined!6563 lt!289680) (not (is-Found!6563 lt!289680)) (and (bvsge (index!28537 lt!289680) #b00000000000000000000000000000000) (bvslt (index!28537 lt!289680) (size!18487 a!2986)))) (or (is-Undefined!6563 lt!289680) (is-Found!6563 lt!289680) (not (is-MissingVacant!6563 lt!289680)) (not (= (index!28539 lt!289680) vacantSpotIndex!68)) (and (bvsge (index!28539 lt!289680) #b00000000000000000000000000000000) (bvslt (index!28539 lt!289680) (size!18487 a!2986)))) (or (is-Undefined!6563 lt!289680) (ite (is-Found!6563 lt!289680) (= (select (arr!18123 a!2986) (index!28537 lt!289680)) (select (arr!18123 a!2986) j!136)) (and (is-MissingVacant!6563 lt!289680) (= (index!28539 lt!289680) vacantSpotIndex!68) (= (select (arr!18123 a!2986) (index!28539 lt!289680)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88767 (= lt!289680 e!358244)))

(declare-fun c!71319 () Bool)

(assert (=> d!88767 (= c!71319 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88767 (= lt!289681 (select (arr!18123 a!2986) index!984))))

(assert (=> d!88767 (validMask!0 mask!3053)))

(assert (=> d!88767 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18123 a!2986) j!136) a!2986 mask!3053) lt!289680)))

(declare-fun b!624810 () Bool)

(assert (=> b!624810 (= e!358243 (Found!6563 index!984))))

(declare-fun b!624811 () Bool)

(assert (=> b!624811 (= e!358244 Undefined!6563)))

(declare-fun b!624812 () Bool)

(declare-fun c!71321 () Bool)

(assert (=> b!624812 (= c!71321 (= lt!289681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!624812 (= e!358243 e!358245)))

(assert (= (and d!88767 c!71319) b!624811))

(assert (= (and d!88767 (not c!71319)) b!624808))

(assert (= (and b!624808 c!71320) b!624810))

(assert (= (and b!624808 (not c!71320)) b!624812))

(assert (= (and b!624812 c!71321) b!624807))

(assert (= (and b!624812 (not c!71321)) b!624809))

(declare-fun m!600465 () Bool)

(assert (=> b!624809 m!600465))

(assert (=> b!624809 m!600465))

(assert (=> b!624809 m!600343))

(declare-fun m!600467 () Bool)

(assert (=> b!624809 m!600467))

(declare-fun m!600469 () Bool)

(assert (=> d!88767 m!600469))

(declare-fun m!600471 () Bool)

(assert (=> d!88767 m!600471))

(declare-fun m!600473 () Bool)

(assert (=> d!88767 m!600473))

(assert (=> d!88767 m!600357))

(assert (=> b!624649 d!88767))

(declare-fun d!88777 () Bool)

(assert (=> d!88777 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!624654 d!88777))

(declare-fun d!88779 () Bool)

(assert (=> d!88779 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56332 d!88779))

(declare-fun d!88781 () Bool)

(assert (=> d!88781 (= (array_inv!13919 a!2986) (bvsge (size!18487 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56332 d!88781))

(declare-fun b!624894 () Bool)

(declare-fun e!358297 () SeekEntryResult!6563)

(assert (=> b!624894 (= e!358297 Undefined!6563)))

(declare-fun b!624895 () Bool)

(declare-fun c!71353 () Bool)

(declare-fun lt!289709 () (_ BitVec 64))

(assert (=> b!624895 (= c!71353 (= lt!289709 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358298 () SeekEntryResult!6563)

(declare-fun e!358299 () SeekEntryResult!6563)

(assert (=> b!624895 (= e!358298 e!358299)))

(declare-fun d!88783 () Bool)

(declare-fun lt!289711 () SeekEntryResult!6563)

(assert (=> d!88783 (and (or (is-Undefined!6563 lt!289711) (not (is-Found!6563 lt!289711)) (and (bvsge (index!28537 lt!289711) #b00000000000000000000000000000000) (bvslt (index!28537 lt!289711) (size!18487 a!2986)))) (or (is-Undefined!6563 lt!289711) (is-Found!6563 lt!289711) (not (is-MissingZero!6563 lt!289711)) (and (bvsge (index!28536 lt!289711) #b00000000000000000000000000000000) (bvslt (index!28536 lt!289711) (size!18487 a!2986)))) (or (is-Undefined!6563 lt!289711) (is-Found!6563 lt!289711) (is-MissingZero!6563 lt!289711) (not (is-MissingVacant!6563 lt!289711)) (and (bvsge (index!28539 lt!289711) #b00000000000000000000000000000000) (bvslt (index!28539 lt!289711) (size!18487 a!2986)))) (or (is-Undefined!6563 lt!289711) (ite (is-Found!6563 lt!289711) (= (select (arr!18123 a!2986) (index!28537 lt!289711)) k!1786) (ite (is-MissingZero!6563 lt!289711) (= (select (arr!18123 a!2986) (index!28536 lt!289711)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6563 lt!289711) (= (select (arr!18123 a!2986) (index!28539 lt!289711)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88783 (= lt!289711 e!358297)))

(declare-fun c!71354 () Bool)

(declare-fun lt!289710 () SeekEntryResult!6563)

(assert (=> d!88783 (= c!71354 (and (is-Intermediate!6563 lt!289710) (undefined!7375 lt!289710)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37757 (_ BitVec 32)) SeekEntryResult!6563)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88783 (= lt!289710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!88783 (validMask!0 mask!3053)))

(assert (=> d!88783 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!289711)))

(declare-fun b!624896 () Bool)

(assert (=> b!624896 (= e!358298 (Found!6563 (index!28538 lt!289710)))))

(declare-fun b!624897 () Bool)

(assert (=> b!624897 (= e!358299 (seekKeyOrZeroReturnVacant!0 (x!57294 lt!289710) (index!28538 lt!289710) (index!28538 lt!289710) k!1786 a!2986 mask!3053))))

(declare-fun b!624898 () Bool)

(assert (=> b!624898 (= e!358297 e!358298)))

(assert (=> b!624898 (= lt!289709 (select (arr!18123 a!2986) (index!28538 lt!289710)))))

(declare-fun c!71352 () Bool)

(assert (=> b!624898 (= c!71352 (= lt!289709 k!1786))))

(declare-fun b!624899 () Bool)

(assert (=> b!624899 (= e!358299 (MissingZero!6563 (index!28538 lt!289710)))))

(assert (= (and d!88783 c!71354) b!624894))

(assert (= (and d!88783 (not c!71354)) b!624898))

(assert (= (and b!624898 c!71352) b!624896))

(assert (= (and b!624898 (not c!71352)) b!624895))

(assert (= (and b!624895 c!71353) b!624899))

(assert (= (and b!624895 (not c!71353)) b!624897))

(declare-fun m!600509 () Bool)

(assert (=> d!88783 m!600509))

(declare-fun m!600511 () Bool)

(assert (=> d!88783 m!600511))

(assert (=> d!88783 m!600357))

(declare-fun m!600513 () Bool)

(assert (=> d!88783 m!600513))

(declare-fun m!600515 () Bool)

(assert (=> d!88783 m!600515))

(assert (=> d!88783 m!600509))

(declare-fun m!600517 () Bool)

(assert (=> d!88783 m!600517))

(declare-fun m!600519 () Bool)

(assert (=> b!624897 m!600519))

(declare-fun m!600521 () Bool)

(assert (=> b!624898 m!600521))

(assert (=> b!624647 d!88783))

(declare-fun d!88801 () Bool)

(declare-fun res!402928 () Bool)

(declare-fun e!358304 () Bool)

(assert (=> d!88801 (=> res!402928 e!358304)))

(assert (=> d!88801 (= res!402928 (= (select (arr!18123 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!88801 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!358304)))

(declare-fun b!624904 () Bool)

(declare-fun e!358305 () Bool)

(assert (=> b!624904 (= e!358304 e!358305)))

(declare-fun res!402929 () Bool)

(assert (=> b!624904 (=> (not res!402929) (not e!358305))))

(assert (=> b!624904 (= res!402929 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18487 a!2986)))))

(declare-fun b!624905 () Bool)

(assert (=> b!624905 (= e!358305 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88801 (not res!402928)) b!624904))

(assert (= (and b!624904 res!402929) b!624905))

(assert (=> d!88801 m!600413))

(declare-fun m!600523 () Bool)

(assert (=> b!624905 m!600523))

(assert (=> b!624652 d!88801))

(push 1)

