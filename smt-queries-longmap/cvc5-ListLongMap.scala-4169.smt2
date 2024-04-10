; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56756 () Bool)

(assert start!56756)

(declare-fun res!406509 () Bool)

(declare-fun e!359747 () Bool)

(assert (=> start!56756 (=> (not res!406509) (not e!359747))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56756 (= res!406509 (validMask!0 mask!3053))))

(assert (=> start!56756 e!359747))

(assert (=> start!56756 true))

(declare-datatypes ((array!37997 0))(
  ( (array!37998 (arr!18237 (Array (_ BitVec 32) (_ BitVec 64))) (size!18601 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37997)

(declare-fun array_inv!14033 (array!37997) Bool)

(assert (=> start!56756 (array_inv!14033 a!2986)))

(declare-fun b!628944 () Bool)

(declare-fun res!406505 () Bool)

(assert (=> b!628944 (=> (not res!406505) (not e!359747))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628944 (= res!406505 (validKeyInArray!0 (select (arr!18237 a!2986) j!136)))))

(declare-fun b!628945 () Bool)

(declare-fun e!359749 () Bool)

(assert (=> b!628945 (= e!359747 e!359749)))

(declare-fun res!406508 () Bool)

(assert (=> b!628945 (=> (not res!406508) (not e!359749))))

(declare-datatypes ((SeekEntryResult!6677 0))(
  ( (MissingZero!6677 (index!28992 (_ BitVec 32))) (Found!6677 (index!28993 (_ BitVec 32))) (Intermediate!6677 (undefined!7489 Bool) (index!28994 (_ BitVec 32)) (x!57727 (_ BitVec 32))) (Undefined!6677) (MissingVacant!6677 (index!28995 (_ BitVec 32))) )
))
(declare-fun lt!290597 () SeekEntryResult!6677)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628945 (= res!406508 (or (= lt!290597 (MissingZero!6677 i!1108)) (= lt!290597 (MissingVacant!6677 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37997 (_ BitVec 32)) SeekEntryResult!6677)

(assert (=> b!628945 (= lt!290597 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628946 () Bool)

(declare-fun res!406501 () Bool)

(assert (=> b!628946 (=> (not res!406501) (not e!359747))))

(declare-fun arrayContainsKey!0 (array!37997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628946 (= res!406501 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628947 () Bool)

(declare-fun res!406511 () Bool)

(assert (=> b!628947 (=> (not res!406511) (not e!359747))))

(assert (=> b!628947 (= res!406511 (and (= (size!18601 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18601 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18601 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628948 () Bool)

(declare-fun res!406506 () Bool)

(assert (=> b!628948 (=> (not res!406506) (not e!359747))))

(assert (=> b!628948 (= res!406506 (validKeyInArray!0 k!1786))))

(declare-fun lt!290599 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!628949 () Bool)

(declare-fun lt!290598 () SeekEntryResult!6677)

(declare-fun e!359750 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37997 (_ BitVec 32)) SeekEntryResult!6677)

(assert (=> b!628949 (= e!359750 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290599 vacantSpotIndex!68 (select (arr!18237 a!2986) j!136) a!2986 mask!3053) lt!290598)))))

(declare-fun b!628950 () Bool)

(declare-fun res!406500 () Bool)

(assert (=> b!628950 (=> (not res!406500) (not e!359749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37997 (_ BitVec 32)) Bool)

(assert (=> b!628950 (= res!406500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628951 () Bool)

(declare-fun res!406503 () Bool)

(assert (=> b!628951 (=> (not res!406503) (not e!359749))))

(declare-datatypes ((List!12278 0))(
  ( (Nil!12275) (Cons!12274 (h!13319 (_ BitVec 64)) (t!18506 List!12278)) )
))
(declare-fun arrayNoDuplicates!0 (array!37997 (_ BitVec 32) List!12278) Bool)

(assert (=> b!628951 (= res!406503 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12275))))

(declare-fun b!628952 () Bool)

(declare-fun e!359751 () Bool)

(assert (=> b!628952 (= e!359751 e!359750)))

(declare-fun res!406507 () Bool)

(assert (=> b!628952 (=> (not res!406507) (not e!359750))))

(assert (=> b!628952 (= res!406507 (and (bvsge lt!290599 #b00000000000000000000000000000000) (bvslt lt!290599 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628952 (= lt!290599 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628953 () Bool)

(declare-fun res!406504 () Bool)

(assert (=> b!628953 (=> (not res!406504) (not e!359749))))

(assert (=> b!628953 (= res!406504 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18237 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18237 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628954 () Bool)

(assert (=> b!628954 (= e!359749 e!359751)))

(declare-fun res!406510 () Bool)

(assert (=> b!628954 (=> (not res!406510) (not e!359751))))

(assert (=> b!628954 (= res!406510 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18237 a!2986) j!136) a!2986 mask!3053) lt!290598))))

(assert (=> b!628954 (= lt!290598 (Found!6677 j!136))))

(declare-fun b!628955 () Bool)

(declare-fun res!406502 () Bool)

(assert (=> b!628955 (=> (not res!406502) (not e!359751))))

(assert (=> b!628955 (= res!406502 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18237 a!2986) index!984) (select (arr!18237 a!2986) j!136))) (not (= (select (arr!18237 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!56756 res!406509) b!628947))

(assert (= (and b!628947 res!406511) b!628944))

(assert (= (and b!628944 res!406505) b!628948))

(assert (= (and b!628948 res!406506) b!628946))

(assert (= (and b!628946 res!406501) b!628945))

(assert (= (and b!628945 res!406508) b!628950))

(assert (= (and b!628950 res!406500) b!628951))

(assert (= (and b!628951 res!406503) b!628953))

(assert (= (and b!628953 res!406504) b!628954))

(assert (= (and b!628954 res!406510) b!628955))

(assert (= (and b!628955 res!406502) b!628952))

(assert (= (and b!628952 res!406507) b!628949))

(declare-fun m!604047 () Bool)

(assert (=> b!628949 m!604047))

(assert (=> b!628949 m!604047))

(declare-fun m!604049 () Bool)

(assert (=> b!628949 m!604049))

(declare-fun m!604051 () Bool)

(assert (=> b!628948 m!604051))

(declare-fun m!604053 () Bool)

(assert (=> b!628955 m!604053))

(assert (=> b!628955 m!604047))

(declare-fun m!604055 () Bool)

(assert (=> b!628953 m!604055))

(declare-fun m!604057 () Bool)

(assert (=> b!628953 m!604057))

(declare-fun m!604059 () Bool)

(assert (=> b!628953 m!604059))

(declare-fun m!604061 () Bool)

(assert (=> b!628946 m!604061))

(declare-fun m!604063 () Bool)

(assert (=> b!628945 m!604063))

(declare-fun m!604065 () Bool)

(assert (=> b!628952 m!604065))

(declare-fun m!604067 () Bool)

(assert (=> b!628951 m!604067))

(declare-fun m!604069 () Bool)

(assert (=> b!628950 m!604069))

(assert (=> b!628954 m!604047))

(assert (=> b!628954 m!604047))

(declare-fun m!604071 () Bool)

(assert (=> b!628954 m!604071))

(assert (=> b!628944 m!604047))

(assert (=> b!628944 m!604047))

(declare-fun m!604073 () Bool)

(assert (=> b!628944 m!604073))

(declare-fun m!604075 () Bool)

(assert (=> start!56756 m!604075))

(declare-fun m!604077 () Bool)

(assert (=> start!56756 m!604077))

(push 1)

(assert (not b!628951))

(assert (not b!628952))

(assert (not b!628954))

(assert (not b!628949))

(assert (not b!628944))

(assert (not b!628946))

(assert (not start!56756))

(assert (not b!628948))

(assert (not b!628950))

(assert (not b!628945))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89063 () Bool)

(assert (=> d!89063 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628948 d!89063))

(declare-fun b!629052 () Bool)

(declare-fun e!359798 () SeekEntryResult!6677)

(assert (=> b!629052 (= e!359798 (MissingVacant!6677 vacantSpotIndex!68))))

(declare-fun b!629053 () Bool)

(declare-fun c!71598 () Bool)

(declare-fun lt!290634 () (_ BitVec 64))

(assert (=> b!629053 (= c!71598 (= lt!290634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!359799 () SeekEntryResult!6677)

(assert (=> b!629053 (= e!359799 e!359798)))

(declare-fun b!629054 () Bool)

(assert (=> b!629054 (= e!359799 (Found!6677 index!984))))

(declare-fun b!629055 () Bool)

(declare-fun e!359797 () SeekEntryResult!6677)

(assert (=> b!629055 (= e!359797 e!359799)))

(declare-fun c!71599 () Bool)

(assert (=> b!629055 (= c!71599 (= lt!290634 (select (arr!18237 a!2986) j!136)))))

(declare-fun d!89065 () Bool)

(declare-fun lt!290635 () SeekEntryResult!6677)

(assert (=> d!89065 (and (or (is-Undefined!6677 lt!290635) (not (is-Found!6677 lt!290635)) (and (bvsge (index!28993 lt!290635) #b00000000000000000000000000000000) (bvslt (index!28993 lt!290635) (size!18601 a!2986)))) (or (is-Undefined!6677 lt!290635) (is-Found!6677 lt!290635) (not (is-MissingVacant!6677 lt!290635)) (not (= (index!28995 lt!290635) vacantSpotIndex!68)) (and (bvsge (index!28995 lt!290635) #b00000000000000000000000000000000) (bvslt (index!28995 lt!290635) (size!18601 a!2986)))) (or (is-Undefined!6677 lt!290635) (ite (is-Found!6677 lt!290635) (= (select (arr!18237 a!2986) (index!28993 lt!290635)) (select (arr!18237 a!2986) j!136)) (and (is-MissingVacant!6677 lt!290635) (= (index!28995 lt!290635) vacantSpotIndex!68) (= (select (arr!18237 a!2986) (index!28995 lt!290635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89065 (= lt!290635 e!359797)))

(declare-fun c!71600 () Bool)

(assert (=> d!89065 (= c!71600 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89065 (= lt!290634 (select (arr!18237 a!2986) index!984))))

(assert (=> d!89065 (validMask!0 mask!3053)))

(assert (=> d!89065 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18237 a!2986) j!136) a!2986 mask!3053) lt!290635)))

(declare-fun b!629056 () Bool)

(assert (=> b!629056 (= e!359797 Undefined!6677)))

(declare-fun b!629057 () Bool)

(assert (=> b!629057 (= e!359798 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18237 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89065 c!71600) b!629056))

(assert (= (and d!89065 (not c!71600)) b!629055))

(assert (= (and b!629055 c!71599) b!629054))

(assert (= (and b!629055 (not c!71599)) b!629053))

(assert (= (and b!629053 c!71598) b!629052))

(assert (= (and b!629053 (not c!71598)) b!629057))

(declare-fun m!604157 () Bool)

(assert (=> d!89065 m!604157))

(declare-fun m!604159 () Bool)

(assert (=> d!89065 m!604159))

(assert (=> d!89065 m!604053))

(assert (=> d!89065 m!604075))

(assert (=> b!629057 m!604065))

(assert (=> b!629057 m!604065))

(assert (=> b!629057 m!604047))

(declare-fun m!604161 () Bool)

(assert (=> b!629057 m!604161))

(assert (=> b!628954 d!89065))

(declare-fun d!89073 () Bool)

(assert (=> d!89073 (= (validKeyInArray!0 (select (arr!18237 a!2986) j!136)) (and (not (= (select (arr!18237 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18237 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628944 d!89073))

(declare-fun b!629070 () Bool)

(declare-fun e!359807 () SeekEntryResult!6677)

(assert (=> b!629070 (= e!359807 (MissingVacant!6677 vacantSpotIndex!68))))

(declare-fun b!629071 () Bool)

(declare-fun c!71607 () Bool)

(declare-fun lt!290640 () (_ BitVec 64))

(assert (=> b!629071 (= c!71607 (= lt!290640 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!359808 () SeekEntryResult!6677)

(assert (=> b!629071 (= e!359808 e!359807)))

(declare-fun b!629072 () Bool)

(assert (=> b!629072 (= e!359808 (Found!6677 lt!290599))))

(declare-fun b!629073 () Bool)

(declare-fun e!359806 () SeekEntryResult!6677)

(assert (=> b!629073 (= e!359806 e!359808)))

(declare-fun c!71608 () Bool)

(assert (=> b!629073 (= c!71608 (= lt!290640 (select (arr!18237 a!2986) j!136)))))

(declare-fun d!89075 () Bool)

(declare-fun lt!290641 () SeekEntryResult!6677)

(assert (=> d!89075 (and (or (is-Undefined!6677 lt!290641) (not (is-Found!6677 lt!290641)) (and (bvsge (index!28993 lt!290641) #b00000000000000000000000000000000) (bvslt (index!28993 lt!290641) (size!18601 a!2986)))) (or (is-Undefined!6677 lt!290641) (is-Found!6677 lt!290641) (not (is-MissingVacant!6677 lt!290641)) (not (= (index!28995 lt!290641) vacantSpotIndex!68)) (and (bvsge (index!28995 lt!290641) #b00000000000000000000000000000000) (bvslt (index!28995 lt!290641) (size!18601 a!2986)))) (or (is-Undefined!6677 lt!290641) (ite (is-Found!6677 lt!290641) (= (select (arr!18237 a!2986) (index!28993 lt!290641)) (select (arr!18237 a!2986) j!136)) (and (is-MissingVacant!6677 lt!290641) (= (index!28995 lt!290641) vacantSpotIndex!68) (= (select (arr!18237 a!2986) (index!28995 lt!290641)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89075 (= lt!290641 e!359806)))

(declare-fun c!71609 () Bool)

(assert (=> d!89075 (= c!71609 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89075 (= lt!290640 (select (arr!18237 a!2986) lt!290599))))

(assert (=> d!89075 (validMask!0 mask!3053)))

(assert (=> d!89075 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290599 vacantSpotIndex!68 (select (arr!18237 a!2986) j!136) a!2986 mask!3053) lt!290641)))

(declare-fun b!629074 () Bool)

(assert (=> b!629074 (= e!359806 Undefined!6677)))

(declare-fun b!629075 () Bool)

(assert (=> b!629075 (= e!359807 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!290599 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18237 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89075 c!71609) b!629074))

(assert (= (and d!89075 (not c!71609)) b!629073))

(assert (= (and b!629073 c!71608) b!629072))

(assert (= (and b!629073 (not c!71608)) b!629071))

(assert (= (and b!629071 c!71607) b!629070))

(assert (= (and b!629071 (not c!71607)) b!629075))

(declare-fun m!604163 () Bool)

(assert (=> d!89075 m!604163))

(declare-fun m!604165 () Bool)

(assert (=> d!89075 m!604165))

(declare-fun m!604167 () Bool)

(assert (=> d!89075 m!604167))

(assert (=> d!89075 m!604075))

(declare-fun m!604169 () Bool)

(assert (=> b!629075 m!604169))

(assert (=> b!629075 m!604169))

(assert (=> b!629075 m!604047))

(declare-fun m!604171 () Bool)

(assert (=> b!629075 m!604171))

(assert (=> b!628949 d!89075))

(declare-fun d!89077 () Bool)

(declare-fun res!406601 () Bool)

(declare-fun e!359828 () Bool)

(assert (=> d!89077 (=> res!406601 e!359828)))

(assert (=> d!89077 (= res!406601 (bvsge #b00000000000000000000000000000000 (size!18601 a!2986)))))

(assert (=> d!89077 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!359828)))

(declare-fun b!629100 () Bool)

(declare-fun e!359827 () Bool)

(declare-fun e!359826 () Bool)

(assert (=> b!629100 (= e!359827 e!359826)))

(declare-fun lt!290652 () (_ BitVec 64))

(assert (=> b!629100 (= lt!290652 (select (arr!18237 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21106 0))(
  ( (Unit!21107) )
))
(declare-fun lt!290650 () Unit!21106)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37997 (_ BitVec 64) (_ BitVec 32)) Unit!21106)

(assert (=> b!629100 (= lt!290650 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290652 #b00000000000000000000000000000000))))

(assert (=> b!629100 (arrayContainsKey!0 a!2986 lt!290652 #b00000000000000000000000000000000)))

(declare-fun lt!290651 () Unit!21106)

(assert (=> b!629100 (= lt!290651 lt!290650)))

(declare-fun res!406600 () Bool)

(assert (=> b!629100 (= res!406600 (= (seekEntryOrOpen!0 (select (arr!18237 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6677 #b00000000000000000000000000000000)))))

(assert (=> b!629100 (=> (not res!406600) (not e!359826))))

(declare-fun b!629101 () Bool)

(declare-fun call!33280 () Bool)

(assert (=> b!629101 (= e!359826 call!33280)))

(declare-fun bm!33277 () Bool)

(assert (=> bm!33277 (= call!33280 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!629102 () Bool)

(assert (=> b!629102 (= e!359828 e!359827)))

(declare-fun c!71617 () Bool)

(assert (=> b!629102 (= c!71617 (validKeyInArray!0 (select (arr!18237 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629103 () Bool)

(assert (=> b!629103 (= e!359827 call!33280)))

(assert (= (and d!89077 (not res!406601)) b!629102))

(assert (= (and b!629102 c!71617) b!629100))

(assert (= (and b!629102 (not c!71617)) b!629103))

(assert (= (and b!629100 res!406600) b!629101))

(assert (= (or b!629101 b!629103) bm!33277))

(declare-fun m!604183 () Bool)

(assert (=> b!629100 m!604183))

(declare-fun m!604185 () Bool)

(assert (=> b!629100 m!604185))

(declare-fun m!604187 () Bool)

(assert (=> b!629100 m!604187))

(assert (=> b!629100 m!604183))

(declare-fun m!604189 () Bool)

(assert (=> b!629100 m!604189))

(declare-fun m!604191 () Bool)

(assert (=> bm!33277 m!604191))

(assert (=> b!629102 m!604183))

(assert (=> b!629102 m!604183))

(declare-fun m!604193 () Bool)

(assert (=> b!629102 m!604193))

(assert (=> b!628950 d!89077))

(declare-fun d!89085 () Bool)

(assert (=> d!89085 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56756 d!89085))

(declare-fun d!89093 () Bool)

(assert (=> d!89093 (= (array_inv!14033 a!2986) (bvsge (size!18601 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56756 d!89093))

(declare-fun b!629193 () Bool)

(declare-fun e!359884 () SeekEntryResult!6677)

(declare-fun e!359885 () SeekEntryResult!6677)

(assert (=> b!629193 (= e!359884 e!359885)))

(declare-fun lt!290691 () (_ BitVec 64))

(declare-fun lt!290690 () SeekEntryResult!6677)

(assert (=> b!629193 (= lt!290691 (select (arr!18237 a!2986) (index!28994 lt!290690)))))

(declare-fun c!71653 () Bool)

(assert (=> b!629193 (= c!71653 (= lt!290691 k!1786))))

(declare-fun b!629194 () Bool)

(declare-fun e!359886 () SeekEntryResult!6677)

(assert (=> b!629194 (= e!359886 (MissingZero!6677 (index!28994 lt!290690)))))

(declare-fun b!629195 () Bool)

(assert (=> b!629195 (= e!359886 (seekKeyOrZeroReturnVacant!0 (x!57727 lt!290690) (index!28994 lt!290690) (index!28994 lt!290690) k!1786 a!2986 mask!3053))))

(declare-fun b!629196 () Bool)

(declare-fun c!71654 () Bool)

(assert (=> b!629196 (= c!71654 (= lt!290691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629196 (= e!359885 e!359886)))

(declare-fun b!629197 () Bool)

(assert (=> b!629197 (= e!359885 (Found!6677 (index!28994 lt!290690)))))

(declare-fun b!629198 () Bool)

(assert (=> b!629198 (= e!359884 Undefined!6677)))

(declare-fun d!89095 () Bool)

(declare-fun lt!290692 () SeekEntryResult!6677)

(assert (=> d!89095 (and (or (is-Undefined!6677 lt!290692) (not (is-Found!6677 lt!290692)) (and (bvsge (index!28993 lt!290692) #b00000000000000000000000000000000) (bvslt (index!28993 lt!290692) (size!18601 a!2986)))) (or (is-Undefined!6677 lt!290692) (is-Found!6677 lt!290692) (not (is-MissingZero!6677 lt!290692)) (and (bvsge (index!28992 lt!290692) #b00000000000000000000000000000000) (bvslt (index!28992 lt!290692) (size!18601 a!2986)))) (or (is-Undefined!6677 lt!290692) (is-Found!6677 lt!290692) (is-MissingZero!6677 lt!290692) (not (is-MissingVacant!6677 lt!290692)) (and (bvsge (index!28995 lt!290692) #b00000000000000000000000000000000) (bvslt (index!28995 lt!290692) (size!18601 a!2986)))) (or (is-Undefined!6677 lt!290692) (ite (is-Found!6677 lt!290692) (= (select (arr!18237 a!2986) (index!28993 lt!290692)) k!1786) (ite (is-MissingZero!6677 lt!290692) (= (select (arr!18237 a!2986) (index!28992 lt!290692)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6677 lt!290692) (= (select (arr!18237 a!2986) (index!28995 lt!290692)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

