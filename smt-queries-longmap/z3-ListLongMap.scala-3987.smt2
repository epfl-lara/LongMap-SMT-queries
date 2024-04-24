; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54042 () Bool)

(assert start!54042)

(declare-fun b!590117 () Bool)

(declare-fun res!377473 () Bool)

(declare-fun e!336903 () Bool)

(assert (=> b!590117 (=> (not res!377473) (not e!336903))))

(declare-datatypes ((array!36831 0))(
  ( (array!36832 (arr!17686 (Array (_ BitVec 32) (_ BitVec 64))) (size!18050 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36831)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590117 (= res!377473 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590118 () Bool)

(declare-fun res!377472 () Bool)

(declare-fun e!336900 () Bool)

(assert (=> b!590118 (=> (not res!377472) (not e!336900))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!590118 (= res!377472 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17686 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590119 () Bool)

(declare-datatypes ((Unit!18421 0))(
  ( (Unit!18422) )
))
(declare-fun e!336901 () Unit!18421)

(declare-fun Unit!18423 () Unit!18421)

(assert (=> b!590119 (= e!336901 Unit!18423)))

(declare-fun b!590120 () Bool)

(declare-fun res!377467 () Bool)

(assert (=> b!590120 (=> (not res!377467) (not e!336903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590120 (= res!377467 (validKeyInArray!0 k0!1786))))

(declare-fun b!590121 () Bool)

(assert (=> b!590121 (= e!336903 e!336900)))

(declare-fun res!377468 () Bool)

(assert (=> b!590121 (=> (not res!377468) (not e!336900))))

(declare-datatypes ((SeekEntryResult!6082 0))(
  ( (MissingZero!6082 (index!26558 (_ BitVec 32))) (Found!6082 (index!26559 (_ BitVec 32))) (Intermediate!6082 (undefined!6894 Bool) (index!26560 (_ BitVec 32)) (x!55499 (_ BitVec 32))) (Undefined!6082) (MissingVacant!6082 (index!26561 (_ BitVec 32))) )
))
(declare-fun lt!267715 () SeekEntryResult!6082)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!590121 (= res!377468 (or (= lt!267715 (MissingZero!6082 i!1108)) (= lt!267715 (MissingVacant!6082 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36831 (_ BitVec 32)) SeekEntryResult!6082)

(assert (=> b!590121 (= lt!267715 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!590122 () Bool)

(declare-fun res!377469 () Bool)

(assert (=> b!590122 (=> (not res!377469) (not e!336903))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!590122 (= res!377469 (validKeyInArray!0 (select (arr!17686 a!2986) j!136)))))

(declare-fun b!590123 () Bool)

(declare-fun e!336898 () Bool)

(declare-fun e!336897 () Bool)

(assert (=> b!590123 (= e!336898 (not e!336897))))

(declare-fun res!377476 () Bool)

(assert (=> b!590123 (=> res!377476 e!336897)))

(declare-fun lt!267720 () SeekEntryResult!6082)

(assert (=> b!590123 (= res!377476 (not (= lt!267720 (Found!6082 index!984))))))

(declare-fun lt!267721 () Unit!18421)

(assert (=> b!590123 (= lt!267721 e!336901)))

(declare-fun c!66695 () Bool)

(assert (=> b!590123 (= c!66695 (= lt!267720 Undefined!6082))))

(declare-fun lt!267718 () array!36831)

(declare-fun lt!267714 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36831 (_ BitVec 32)) SeekEntryResult!6082)

(assert (=> b!590123 (= lt!267720 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267714 lt!267718 mask!3053))))

(declare-fun e!336902 () Bool)

(assert (=> b!590123 e!336902))

(declare-fun res!377466 () Bool)

(assert (=> b!590123 (=> (not res!377466) (not e!336902))))

(declare-fun lt!267719 () SeekEntryResult!6082)

(declare-fun lt!267713 () (_ BitVec 32))

(assert (=> b!590123 (= res!377466 (= lt!267719 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267713 vacantSpotIndex!68 lt!267714 lt!267718 mask!3053)))))

(assert (=> b!590123 (= lt!267719 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267713 vacantSpotIndex!68 (select (arr!17686 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590123 (= lt!267714 (select (store (arr!17686 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267716 () Unit!18421)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36831 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18421)

(assert (=> b!590123 (= lt!267716 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267713 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590123 (= lt!267713 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!590124 () Bool)

(declare-fun lt!267717 () SeekEntryResult!6082)

(assert (=> b!590124 (= e!336902 (= lt!267717 lt!267719))))

(declare-fun res!377471 () Bool)

(assert (=> start!54042 (=> (not res!377471) (not e!336903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54042 (= res!377471 (validMask!0 mask!3053))))

(assert (=> start!54042 e!336903))

(assert (=> start!54042 true))

(declare-fun array_inv!13545 (array!36831) Bool)

(assert (=> start!54042 (array_inv!13545 a!2986)))

(declare-fun b!590125 () Bool)

(declare-fun e!336896 () Bool)

(assert (=> b!590125 (= e!336900 e!336896)))

(declare-fun res!377470 () Bool)

(assert (=> b!590125 (=> (not res!377470) (not e!336896))))

(assert (=> b!590125 (= res!377470 (= (select (store (arr!17686 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590125 (= lt!267718 (array!36832 (store (arr!17686 a!2986) i!1108 k0!1786) (size!18050 a!2986)))))

(declare-fun b!590126 () Bool)

(declare-fun Unit!18424 () Unit!18421)

(assert (=> b!590126 (= e!336901 Unit!18424)))

(assert (=> b!590126 false))

(declare-fun b!590127 () Bool)

(declare-fun res!377464 () Bool)

(assert (=> b!590127 (=> (not res!377464) (not e!336900))))

(declare-datatypes ((List!11634 0))(
  ( (Nil!11631) (Cons!11630 (h!12678 (_ BitVec 64)) (t!17854 List!11634)) )
))
(declare-fun arrayNoDuplicates!0 (array!36831 (_ BitVec 32) List!11634) Bool)

(assert (=> b!590127 (= res!377464 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11631))))

(declare-fun b!590128 () Bool)

(declare-fun res!377465 () Bool)

(assert (=> b!590128 (=> (not res!377465) (not e!336900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36831 (_ BitVec 32)) Bool)

(assert (=> b!590128 (= res!377465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590129 () Bool)

(assert (=> b!590129 (= e!336897 (or (not (= (select (arr!17686 a!2986) j!136) lt!267714)) (not (= (select (arr!17686 a!2986) j!136) (select (store (arr!17686 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984) (bvslt (size!18050 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!590129 (= (select (store (arr!17686 a!2986) i!1108 k0!1786) index!984) (select (arr!17686 a!2986) j!136))))

(declare-fun b!590130 () Bool)

(declare-fun res!377475 () Bool)

(assert (=> b!590130 (=> (not res!377475) (not e!336903))))

(assert (=> b!590130 (= res!377475 (and (= (size!18050 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18050 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18050 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590131 () Bool)

(assert (=> b!590131 (= e!336896 e!336898)))

(declare-fun res!377474 () Bool)

(assert (=> b!590131 (=> (not res!377474) (not e!336898))))

(assert (=> b!590131 (= res!377474 (and (= lt!267717 (Found!6082 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17686 a!2986) index!984) (select (arr!17686 a!2986) j!136))) (not (= (select (arr!17686 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!590131 (= lt!267717 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17686 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!54042 res!377471) b!590130))

(assert (= (and b!590130 res!377475) b!590122))

(assert (= (and b!590122 res!377469) b!590120))

(assert (= (and b!590120 res!377467) b!590117))

(assert (= (and b!590117 res!377473) b!590121))

(assert (= (and b!590121 res!377468) b!590128))

(assert (= (and b!590128 res!377465) b!590127))

(assert (= (and b!590127 res!377464) b!590118))

(assert (= (and b!590118 res!377472) b!590125))

(assert (= (and b!590125 res!377470) b!590131))

(assert (= (and b!590131 res!377474) b!590123))

(assert (= (and b!590123 res!377466) b!590124))

(assert (= (and b!590123 c!66695) b!590126))

(assert (= (and b!590123 (not c!66695)) b!590119))

(assert (= (and b!590123 (not res!377476)) b!590129))

(declare-fun m!568769 () Bool)

(assert (=> start!54042 m!568769))

(declare-fun m!568771 () Bool)

(assert (=> start!54042 m!568771))

(declare-fun m!568773 () Bool)

(assert (=> b!590128 m!568773))

(declare-fun m!568775 () Bool)

(assert (=> b!590120 m!568775))

(declare-fun m!568777 () Bool)

(assert (=> b!590117 m!568777))

(declare-fun m!568779 () Bool)

(assert (=> b!590122 m!568779))

(assert (=> b!590122 m!568779))

(declare-fun m!568781 () Bool)

(assert (=> b!590122 m!568781))

(assert (=> b!590129 m!568779))

(declare-fun m!568783 () Bool)

(assert (=> b!590129 m!568783))

(declare-fun m!568785 () Bool)

(assert (=> b!590129 m!568785))

(declare-fun m!568787 () Bool)

(assert (=> b!590118 m!568787))

(declare-fun m!568789 () Bool)

(assert (=> b!590131 m!568789))

(assert (=> b!590131 m!568779))

(assert (=> b!590131 m!568779))

(declare-fun m!568791 () Bool)

(assert (=> b!590131 m!568791))

(declare-fun m!568793 () Bool)

(assert (=> b!590127 m!568793))

(declare-fun m!568795 () Bool)

(assert (=> b!590121 m!568795))

(declare-fun m!568797 () Bool)

(assert (=> b!590123 m!568797))

(declare-fun m!568799 () Bool)

(assert (=> b!590123 m!568799))

(assert (=> b!590123 m!568779))

(assert (=> b!590123 m!568783))

(declare-fun m!568801 () Bool)

(assert (=> b!590123 m!568801))

(declare-fun m!568803 () Bool)

(assert (=> b!590123 m!568803))

(declare-fun m!568805 () Bool)

(assert (=> b!590123 m!568805))

(assert (=> b!590123 m!568779))

(declare-fun m!568807 () Bool)

(assert (=> b!590123 m!568807))

(assert (=> b!590125 m!568783))

(declare-fun m!568809 () Bool)

(assert (=> b!590125 m!568809))

(check-sat (not b!590122) (not b!590120) (not b!590123) (not b!590128) (not b!590127) (not start!54042) (not b!590121) (not b!590117) (not b!590131))
(check-sat)
(get-model)

(declare-fun d!86139 () Bool)

(assert (=> d!86139 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!590120 d!86139))

(declare-fun d!86141 () Bool)

(declare-fun lt!267784 () SeekEntryResult!6082)

(get-info :version)

(assert (=> d!86141 (and (or ((_ is Undefined!6082) lt!267784) (not ((_ is Found!6082) lt!267784)) (and (bvsge (index!26559 lt!267784) #b00000000000000000000000000000000) (bvslt (index!26559 lt!267784) (size!18050 a!2986)))) (or ((_ is Undefined!6082) lt!267784) ((_ is Found!6082) lt!267784) (not ((_ is MissingZero!6082) lt!267784)) (and (bvsge (index!26558 lt!267784) #b00000000000000000000000000000000) (bvslt (index!26558 lt!267784) (size!18050 a!2986)))) (or ((_ is Undefined!6082) lt!267784) ((_ is Found!6082) lt!267784) ((_ is MissingZero!6082) lt!267784) (not ((_ is MissingVacant!6082) lt!267784)) (and (bvsge (index!26561 lt!267784) #b00000000000000000000000000000000) (bvslt (index!26561 lt!267784) (size!18050 a!2986)))) (or ((_ is Undefined!6082) lt!267784) (ite ((_ is Found!6082) lt!267784) (= (select (arr!17686 a!2986) (index!26559 lt!267784)) k0!1786) (ite ((_ is MissingZero!6082) lt!267784) (= (select (arr!17686 a!2986) (index!26558 lt!267784)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6082) lt!267784) (= (select (arr!17686 a!2986) (index!26561 lt!267784)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!336960 () SeekEntryResult!6082)

(assert (=> d!86141 (= lt!267784 e!336960)))

(declare-fun c!66709 () Bool)

(declare-fun lt!267783 () SeekEntryResult!6082)

(assert (=> d!86141 (= c!66709 (and ((_ is Intermediate!6082) lt!267783) (undefined!6894 lt!267783)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36831 (_ BitVec 32)) SeekEntryResult!6082)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86141 (= lt!267783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86141 (validMask!0 mask!3053)))

(assert (=> d!86141 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!267784)))

(declare-fun b!590234 () Bool)

(declare-fun e!336959 () SeekEntryResult!6082)

(assert (=> b!590234 (= e!336960 e!336959)))

(declare-fun lt!267782 () (_ BitVec 64))

(assert (=> b!590234 (= lt!267782 (select (arr!17686 a!2986) (index!26560 lt!267783)))))

(declare-fun c!66710 () Bool)

(assert (=> b!590234 (= c!66710 (= lt!267782 k0!1786))))

(declare-fun b!590235 () Bool)

(assert (=> b!590235 (= e!336960 Undefined!6082)))

(declare-fun e!336958 () SeekEntryResult!6082)

(declare-fun b!590236 () Bool)

(assert (=> b!590236 (= e!336958 (seekKeyOrZeroReturnVacant!0 (x!55499 lt!267783) (index!26560 lt!267783) (index!26560 lt!267783) k0!1786 a!2986 mask!3053))))

(declare-fun b!590237 () Bool)

(assert (=> b!590237 (= e!336959 (Found!6082 (index!26560 lt!267783)))))

(declare-fun b!590238 () Bool)

(assert (=> b!590238 (= e!336958 (MissingZero!6082 (index!26560 lt!267783)))))

(declare-fun b!590239 () Bool)

(declare-fun c!66708 () Bool)

(assert (=> b!590239 (= c!66708 (= lt!267782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590239 (= e!336959 e!336958)))

(assert (= (and d!86141 c!66709) b!590235))

(assert (= (and d!86141 (not c!66709)) b!590234))

(assert (= (and b!590234 c!66710) b!590237))

(assert (= (and b!590234 (not c!66710)) b!590239))

(assert (= (and b!590239 c!66708) b!590238))

(assert (= (and b!590239 (not c!66708)) b!590236))

(declare-fun m!568895 () Bool)

(assert (=> d!86141 m!568895))

(declare-fun m!568897 () Bool)

(assert (=> d!86141 m!568897))

(declare-fun m!568899 () Bool)

(assert (=> d!86141 m!568899))

(declare-fun m!568901 () Bool)

(assert (=> d!86141 m!568901))

(declare-fun m!568903 () Bool)

(assert (=> d!86141 m!568903))

(assert (=> d!86141 m!568897))

(assert (=> d!86141 m!568769))

(declare-fun m!568905 () Bool)

(assert (=> b!590234 m!568905))

(declare-fun m!568907 () Bool)

(assert (=> b!590236 m!568907))

(assert (=> b!590121 d!86141))

(declare-fun d!86143 () Bool)

(assert (=> d!86143 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54042 d!86143))

(declare-fun d!86147 () Bool)

(assert (=> d!86147 (= (array_inv!13545 a!2986) (bvsge (size!18050 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54042 d!86147))

(declare-fun b!590292 () Bool)

(declare-fun e!336994 () SeekEntryResult!6082)

(assert (=> b!590292 (= e!336994 Undefined!6082)))

(declare-fun b!590293 () Bool)

(declare-fun e!336993 () SeekEntryResult!6082)

(assert (=> b!590293 (= e!336993 (MissingVacant!6082 vacantSpotIndex!68))))

(declare-fun b!590294 () Bool)

(assert (=> b!590294 (= e!336993 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17686 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590295 () Bool)

(declare-fun c!66732 () Bool)

(declare-fun lt!267805 () (_ BitVec 64))

(assert (=> b!590295 (= c!66732 (= lt!267805 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!336995 () SeekEntryResult!6082)

(assert (=> b!590295 (= e!336995 e!336993)))

(declare-fun b!590296 () Bool)

(assert (=> b!590296 (= e!336995 (Found!6082 index!984))))

(declare-fun lt!267804 () SeekEntryResult!6082)

(declare-fun d!86149 () Bool)

(assert (=> d!86149 (and (or ((_ is Undefined!6082) lt!267804) (not ((_ is Found!6082) lt!267804)) (and (bvsge (index!26559 lt!267804) #b00000000000000000000000000000000) (bvslt (index!26559 lt!267804) (size!18050 a!2986)))) (or ((_ is Undefined!6082) lt!267804) ((_ is Found!6082) lt!267804) (not ((_ is MissingVacant!6082) lt!267804)) (not (= (index!26561 lt!267804) vacantSpotIndex!68)) (and (bvsge (index!26561 lt!267804) #b00000000000000000000000000000000) (bvslt (index!26561 lt!267804) (size!18050 a!2986)))) (or ((_ is Undefined!6082) lt!267804) (ite ((_ is Found!6082) lt!267804) (= (select (arr!17686 a!2986) (index!26559 lt!267804)) (select (arr!17686 a!2986) j!136)) (and ((_ is MissingVacant!6082) lt!267804) (= (index!26561 lt!267804) vacantSpotIndex!68) (= (select (arr!17686 a!2986) (index!26561 lt!267804)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86149 (= lt!267804 e!336994)))

(declare-fun c!66733 () Bool)

(assert (=> d!86149 (= c!66733 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86149 (= lt!267805 (select (arr!17686 a!2986) index!984))))

(assert (=> d!86149 (validMask!0 mask!3053)))

(assert (=> d!86149 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17686 a!2986) j!136) a!2986 mask!3053) lt!267804)))

(declare-fun b!590297 () Bool)

(assert (=> b!590297 (= e!336994 e!336995)))

(declare-fun c!66731 () Bool)

(assert (=> b!590297 (= c!66731 (= lt!267805 (select (arr!17686 a!2986) j!136)))))

(assert (= (and d!86149 c!66733) b!590292))

(assert (= (and d!86149 (not c!66733)) b!590297))

(assert (= (and b!590297 c!66731) b!590296))

(assert (= (and b!590297 (not c!66731)) b!590295))

(assert (= (and b!590295 c!66732) b!590293))

(assert (= (and b!590295 (not c!66732)) b!590294))

(declare-fun m!568931 () Bool)

(assert (=> b!590294 m!568931))

(assert (=> b!590294 m!568931))

(assert (=> b!590294 m!568779))

(declare-fun m!568933 () Bool)

(assert (=> b!590294 m!568933))

(declare-fun m!568935 () Bool)

(assert (=> d!86149 m!568935))

(declare-fun m!568937 () Bool)

(assert (=> d!86149 m!568937))

(assert (=> d!86149 m!568789))

(assert (=> d!86149 m!568769))

(assert (=> b!590131 d!86149))

(declare-fun d!86159 () Bool)

(declare-fun res!377574 () Bool)

(declare-fun e!337004 () Bool)

(assert (=> d!86159 (=> res!377574 e!337004)))

(assert (=> d!86159 (= res!377574 (= (select (arr!17686 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86159 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!337004)))

(declare-fun b!590307 () Bool)

(declare-fun e!337005 () Bool)

(assert (=> b!590307 (= e!337004 e!337005)))

(declare-fun res!377575 () Bool)

(assert (=> b!590307 (=> (not res!377575) (not e!337005))))

(assert (=> b!590307 (= res!377575 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18050 a!2986)))))

(declare-fun b!590308 () Bool)

(assert (=> b!590308 (= e!337005 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86159 (not res!377574)) b!590307))

(assert (= (and b!590307 res!377575) b!590308))

(declare-fun m!568947 () Bool)

(assert (=> d!86159 m!568947))

(declare-fun m!568949 () Bool)

(assert (=> b!590308 m!568949))

(assert (=> b!590117 d!86159))

(declare-fun b!590327 () Bool)

(declare-fun e!337020 () Bool)

(declare-fun call!32810 () Bool)

(assert (=> b!590327 (= e!337020 call!32810)))

(declare-fun bm!32807 () Bool)

(assert (=> bm!32807 (= call!32810 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!590328 () Bool)

(declare-fun e!337021 () Bool)

(assert (=> b!590328 (= e!337021 e!337020)))

(declare-fun c!66739 () Bool)

(assert (=> b!590328 (= c!66739 (validKeyInArray!0 (select (arr!17686 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86163 () Bool)

(declare-fun res!377586 () Bool)

(assert (=> d!86163 (=> res!377586 e!337021)))

(assert (=> d!86163 (= res!377586 (bvsge #b00000000000000000000000000000000 (size!18050 a!2986)))))

(assert (=> d!86163 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!337021)))

(declare-fun b!590329 () Bool)

(declare-fun e!337022 () Bool)

(assert (=> b!590329 (= e!337020 e!337022)))

(declare-fun lt!267821 () (_ BitVec 64))

(assert (=> b!590329 (= lt!267821 (select (arr!17686 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!267822 () Unit!18421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36831 (_ BitVec 64) (_ BitVec 32)) Unit!18421)

(assert (=> b!590329 (= lt!267822 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!267821 #b00000000000000000000000000000000))))

(assert (=> b!590329 (arrayContainsKey!0 a!2986 lt!267821 #b00000000000000000000000000000000)))

(declare-fun lt!267820 () Unit!18421)

(assert (=> b!590329 (= lt!267820 lt!267822)))

(declare-fun res!377587 () Bool)

(assert (=> b!590329 (= res!377587 (= (seekEntryOrOpen!0 (select (arr!17686 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6082 #b00000000000000000000000000000000)))))

(assert (=> b!590329 (=> (not res!377587) (not e!337022))))

(declare-fun b!590330 () Bool)

(assert (=> b!590330 (= e!337022 call!32810)))

(assert (= (and d!86163 (not res!377586)) b!590328))

(assert (= (and b!590328 c!66739) b!590329))

(assert (= (and b!590328 (not c!66739)) b!590327))

(assert (= (and b!590329 res!377587) b!590330))

(assert (= (or b!590330 b!590327) bm!32807))

(declare-fun m!568951 () Bool)

(assert (=> bm!32807 m!568951))

(assert (=> b!590328 m!568947))

(assert (=> b!590328 m!568947))

(declare-fun m!568953 () Bool)

(assert (=> b!590328 m!568953))

(assert (=> b!590329 m!568947))

(declare-fun m!568955 () Bool)

(assert (=> b!590329 m!568955))

(declare-fun m!568957 () Bool)

(assert (=> b!590329 m!568957))

(assert (=> b!590329 m!568947))

(declare-fun m!568959 () Bool)

(assert (=> b!590329 m!568959))

(assert (=> b!590128 d!86163))

(declare-fun b!590358 () Bool)

(declare-fun e!337041 () Bool)

(declare-fun call!32814 () Bool)

(assert (=> b!590358 (= e!337041 call!32814)))

(declare-fun b!590359 () Bool)

(declare-fun e!337043 () Bool)

(assert (=> b!590359 (= e!337043 e!337041)))

(declare-fun c!66749 () Bool)

(assert (=> b!590359 (= c!66749 (validKeyInArray!0 (select (arr!17686 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!590360 () Bool)

(assert (=> b!590360 (= e!337041 call!32814)))

(declare-fun d!86167 () Bool)

(declare-fun res!377598 () Bool)

(declare-fun e!337044 () Bool)

(assert (=> d!86167 (=> res!377598 e!337044)))

(assert (=> d!86167 (= res!377598 (bvsge #b00000000000000000000000000000000 (size!18050 a!2986)))))

(assert (=> d!86167 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11631) e!337044)))

(declare-fun b!590361 () Bool)

(assert (=> b!590361 (= e!337044 e!337043)))

(declare-fun res!377597 () Bool)

(assert (=> b!590361 (=> (not res!377597) (not e!337043))))

(declare-fun e!337042 () Bool)

(assert (=> b!590361 (= res!377597 (not e!337042))))

(declare-fun res!377599 () Bool)

(assert (=> b!590361 (=> (not res!377599) (not e!337042))))

(assert (=> b!590361 (= res!377599 (validKeyInArray!0 (select (arr!17686 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32811 () Bool)

(assert (=> bm!32811 (= call!32814 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66749 (Cons!11630 (select (arr!17686 a!2986) #b00000000000000000000000000000000) Nil!11631) Nil!11631)))))

(declare-fun b!590362 () Bool)

(declare-fun contains!2880 (List!11634 (_ BitVec 64)) Bool)

(assert (=> b!590362 (= e!337042 (contains!2880 Nil!11631 (select (arr!17686 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86167 (not res!377598)) b!590361))

(assert (= (and b!590361 res!377599) b!590362))

(assert (= (and b!590361 res!377597) b!590359))

(assert (= (and b!590359 c!66749) b!590360))

(assert (= (and b!590359 (not c!66749)) b!590358))

(assert (= (or b!590360 b!590358) bm!32811))

(assert (=> b!590359 m!568947))

(assert (=> b!590359 m!568947))

(assert (=> b!590359 m!568953))

(assert (=> b!590361 m!568947))

(assert (=> b!590361 m!568947))

(assert (=> b!590361 m!568953))

(assert (=> bm!32811 m!568947))

(declare-fun m!568993 () Bool)

(assert (=> bm!32811 m!568993))

(assert (=> b!590362 m!568947))

(assert (=> b!590362 m!568947))

(declare-fun m!568995 () Bool)

(assert (=> b!590362 m!568995))

(assert (=> b!590127 d!86167))

(declare-fun d!86183 () Bool)

(assert (=> d!86183 (= (validKeyInArray!0 (select (arr!17686 a!2986) j!136)) (and (not (= (select (arr!17686 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17686 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!590122 d!86183))

(declare-fun b!590363 () Bool)

(declare-fun e!337046 () SeekEntryResult!6082)

(assert (=> b!590363 (= e!337046 Undefined!6082)))

(declare-fun b!590364 () Bool)

(declare-fun e!337045 () SeekEntryResult!6082)

(assert (=> b!590364 (= e!337045 (MissingVacant!6082 vacantSpotIndex!68))))

(declare-fun b!590365 () Bool)

(assert (=> b!590365 (= e!337045 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267713 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!267714 lt!267718 mask!3053))))

(declare-fun b!590366 () Bool)

(declare-fun c!66751 () Bool)

(declare-fun lt!267835 () (_ BitVec 64))

(assert (=> b!590366 (= c!66751 (= lt!267835 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!337047 () SeekEntryResult!6082)

(assert (=> b!590366 (= e!337047 e!337045)))

(declare-fun b!590367 () Bool)

(assert (=> b!590367 (= e!337047 (Found!6082 lt!267713))))

(declare-fun lt!267834 () SeekEntryResult!6082)

(declare-fun d!86185 () Bool)

(assert (=> d!86185 (and (or ((_ is Undefined!6082) lt!267834) (not ((_ is Found!6082) lt!267834)) (and (bvsge (index!26559 lt!267834) #b00000000000000000000000000000000) (bvslt (index!26559 lt!267834) (size!18050 lt!267718)))) (or ((_ is Undefined!6082) lt!267834) ((_ is Found!6082) lt!267834) (not ((_ is MissingVacant!6082) lt!267834)) (not (= (index!26561 lt!267834) vacantSpotIndex!68)) (and (bvsge (index!26561 lt!267834) #b00000000000000000000000000000000) (bvslt (index!26561 lt!267834) (size!18050 lt!267718)))) (or ((_ is Undefined!6082) lt!267834) (ite ((_ is Found!6082) lt!267834) (= (select (arr!17686 lt!267718) (index!26559 lt!267834)) lt!267714) (and ((_ is MissingVacant!6082) lt!267834) (= (index!26561 lt!267834) vacantSpotIndex!68) (= (select (arr!17686 lt!267718) (index!26561 lt!267834)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86185 (= lt!267834 e!337046)))

(declare-fun c!66752 () Bool)

(assert (=> d!86185 (= c!66752 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86185 (= lt!267835 (select (arr!17686 lt!267718) lt!267713))))

(assert (=> d!86185 (validMask!0 mask!3053)))

(assert (=> d!86185 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267713 vacantSpotIndex!68 lt!267714 lt!267718 mask!3053) lt!267834)))

(declare-fun b!590368 () Bool)

(assert (=> b!590368 (= e!337046 e!337047)))

(declare-fun c!66750 () Bool)

(assert (=> b!590368 (= c!66750 (= lt!267835 lt!267714))))

(assert (= (and d!86185 c!66752) b!590363))

(assert (= (and d!86185 (not c!66752)) b!590368))

(assert (= (and b!590368 c!66750) b!590367))

(assert (= (and b!590368 (not c!66750)) b!590366))

(assert (= (and b!590366 c!66751) b!590364))

(assert (= (and b!590366 (not c!66751)) b!590365))

(declare-fun m!568997 () Bool)

(assert (=> b!590365 m!568997))

(assert (=> b!590365 m!568997))

(declare-fun m!568999 () Bool)

(assert (=> b!590365 m!568999))

(declare-fun m!569001 () Bool)

(assert (=> d!86185 m!569001))

(declare-fun m!569003 () Bool)

(assert (=> d!86185 m!569003))

(declare-fun m!569005 () Bool)

(assert (=> d!86185 m!569005))

(assert (=> d!86185 m!568769))

(assert (=> b!590123 d!86185))

(declare-fun b!590369 () Bool)

(declare-fun e!337049 () SeekEntryResult!6082)

(assert (=> b!590369 (= e!337049 Undefined!6082)))

(declare-fun b!590370 () Bool)

(declare-fun e!337048 () SeekEntryResult!6082)

(assert (=> b!590370 (= e!337048 (MissingVacant!6082 vacantSpotIndex!68))))

(declare-fun b!590371 () Bool)

(assert (=> b!590371 (= e!337048 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!267714 lt!267718 mask!3053))))

(declare-fun b!590372 () Bool)

(declare-fun c!66754 () Bool)

(declare-fun lt!267837 () (_ BitVec 64))

(assert (=> b!590372 (= c!66754 (= lt!267837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!337050 () SeekEntryResult!6082)

(assert (=> b!590372 (= e!337050 e!337048)))

(declare-fun b!590373 () Bool)

(assert (=> b!590373 (= e!337050 (Found!6082 index!984))))

(declare-fun lt!267836 () SeekEntryResult!6082)

(declare-fun d!86187 () Bool)

(assert (=> d!86187 (and (or ((_ is Undefined!6082) lt!267836) (not ((_ is Found!6082) lt!267836)) (and (bvsge (index!26559 lt!267836) #b00000000000000000000000000000000) (bvslt (index!26559 lt!267836) (size!18050 lt!267718)))) (or ((_ is Undefined!6082) lt!267836) ((_ is Found!6082) lt!267836) (not ((_ is MissingVacant!6082) lt!267836)) (not (= (index!26561 lt!267836) vacantSpotIndex!68)) (and (bvsge (index!26561 lt!267836) #b00000000000000000000000000000000) (bvslt (index!26561 lt!267836) (size!18050 lt!267718)))) (or ((_ is Undefined!6082) lt!267836) (ite ((_ is Found!6082) lt!267836) (= (select (arr!17686 lt!267718) (index!26559 lt!267836)) lt!267714) (and ((_ is MissingVacant!6082) lt!267836) (= (index!26561 lt!267836) vacantSpotIndex!68) (= (select (arr!17686 lt!267718) (index!26561 lt!267836)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86187 (= lt!267836 e!337049)))

(declare-fun c!66755 () Bool)

(assert (=> d!86187 (= c!66755 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86187 (= lt!267837 (select (arr!17686 lt!267718) index!984))))

(assert (=> d!86187 (validMask!0 mask!3053)))

(assert (=> d!86187 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267714 lt!267718 mask!3053) lt!267836)))

(declare-fun b!590374 () Bool)

(assert (=> b!590374 (= e!337049 e!337050)))

(declare-fun c!66753 () Bool)

(assert (=> b!590374 (= c!66753 (= lt!267837 lt!267714))))

(assert (= (and d!86187 c!66755) b!590369))

(assert (= (and d!86187 (not c!66755)) b!590374))

(assert (= (and b!590374 c!66753) b!590373))

(assert (= (and b!590374 (not c!66753)) b!590372))

(assert (= (and b!590372 c!66754) b!590370))

(assert (= (and b!590372 (not c!66754)) b!590371))

(assert (=> b!590371 m!568931))

(assert (=> b!590371 m!568931))

(declare-fun m!569007 () Bool)

(assert (=> b!590371 m!569007))

(declare-fun m!569009 () Bool)

(assert (=> d!86187 m!569009))

(declare-fun m!569011 () Bool)

(assert (=> d!86187 m!569011))

(declare-fun m!569013 () Bool)

(assert (=> d!86187 m!569013))

(assert (=> d!86187 m!568769))

(assert (=> b!590123 d!86187))

(declare-fun b!590375 () Bool)

(declare-fun e!337052 () SeekEntryResult!6082)

(assert (=> b!590375 (= e!337052 Undefined!6082)))

(declare-fun b!590376 () Bool)

(declare-fun e!337051 () SeekEntryResult!6082)

(assert (=> b!590376 (= e!337051 (MissingVacant!6082 vacantSpotIndex!68))))

(declare-fun b!590377 () Bool)

(assert (=> b!590377 (= e!337051 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267713 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17686 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590378 () Bool)

(declare-fun c!66757 () Bool)

(declare-fun lt!267839 () (_ BitVec 64))

(assert (=> b!590378 (= c!66757 (= lt!267839 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!337053 () SeekEntryResult!6082)

(assert (=> b!590378 (= e!337053 e!337051)))

(declare-fun b!590379 () Bool)

(assert (=> b!590379 (= e!337053 (Found!6082 lt!267713))))

(declare-fun d!86189 () Bool)

(declare-fun lt!267838 () SeekEntryResult!6082)

(assert (=> d!86189 (and (or ((_ is Undefined!6082) lt!267838) (not ((_ is Found!6082) lt!267838)) (and (bvsge (index!26559 lt!267838) #b00000000000000000000000000000000) (bvslt (index!26559 lt!267838) (size!18050 a!2986)))) (or ((_ is Undefined!6082) lt!267838) ((_ is Found!6082) lt!267838) (not ((_ is MissingVacant!6082) lt!267838)) (not (= (index!26561 lt!267838) vacantSpotIndex!68)) (and (bvsge (index!26561 lt!267838) #b00000000000000000000000000000000) (bvslt (index!26561 lt!267838) (size!18050 a!2986)))) (or ((_ is Undefined!6082) lt!267838) (ite ((_ is Found!6082) lt!267838) (= (select (arr!17686 a!2986) (index!26559 lt!267838)) (select (arr!17686 a!2986) j!136)) (and ((_ is MissingVacant!6082) lt!267838) (= (index!26561 lt!267838) vacantSpotIndex!68) (= (select (arr!17686 a!2986) (index!26561 lt!267838)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86189 (= lt!267838 e!337052)))

(declare-fun c!66758 () Bool)

(assert (=> d!86189 (= c!66758 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86189 (= lt!267839 (select (arr!17686 a!2986) lt!267713))))

(assert (=> d!86189 (validMask!0 mask!3053)))

(assert (=> d!86189 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267713 vacantSpotIndex!68 (select (arr!17686 a!2986) j!136) a!2986 mask!3053) lt!267838)))

(declare-fun b!590380 () Bool)

(assert (=> b!590380 (= e!337052 e!337053)))

(declare-fun c!66756 () Bool)

(assert (=> b!590380 (= c!66756 (= lt!267839 (select (arr!17686 a!2986) j!136)))))

(assert (= (and d!86189 c!66758) b!590375))

(assert (= (and d!86189 (not c!66758)) b!590380))

(assert (= (and b!590380 c!66756) b!590379))

(assert (= (and b!590380 (not c!66756)) b!590378))

(assert (= (and b!590378 c!66757) b!590376))

(assert (= (and b!590378 (not c!66757)) b!590377))

(assert (=> b!590377 m!568997))

(assert (=> b!590377 m!568997))

(assert (=> b!590377 m!568779))

(declare-fun m!569015 () Bool)

(assert (=> b!590377 m!569015))

(declare-fun m!569017 () Bool)

(assert (=> d!86189 m!569017))

(declare-fun m!569019 () Bool)

(assert (=> d!86189 m!569019))

(declare-fun m!569021 () Bool)

(assert (=> d!86189 m!569021))

(assert (=> d!86189 m!568769))

(assert (=> b!590123 d!86189))

(declare-fun d!86191 () Bool)

(declare-fun e!337058 () Bool)

(assert (=> d!86191 e!337058))

(declare-fun res!377604 () Bool)

(assert (=> d!86191 (=> (not res!377604) (not e!337058))))

(assert (=> d!86191 (= res!377604 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18050 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18050 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18050 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18050 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18050 a!2986))))))

(declare-fun lt!267844 () Unit!18421)

(declare-fun choose!9 (array!36831 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18421)

(assert (=> d!86191 (= lt!267844 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267713 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86191 (validMask!0 mask!3053)))

(assert (=> d!86191 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267713 vacantSpotIndex!68 mask!3053) lt!267844)))

(declare-fun b!590385 () Bool)

(assert (=> b!590385 (= e!337058 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267713 vacantSpotIndex!68 (select (arr!17686 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267713 vacantSpotIndex!68 (select (store (arr!17686 a!2986) i!1108 k0!1786) j!136) (array!36832 (store (arr!17686 a!2986) i!1108 k0!1786) (size!18050 a!2986)) mask!3053)))))

(assert (= (and d!86191 res!377604) b!590385))

(declare-fun m!569023 () Bool)

(assert (=> d!86191 m!569023))

(assert (=> d!86191 m!568769))

(assert (=> b!590385 m!568783))

(assert (=> b!590385 m!568779))

(assert (=> b!590385 m!568779))

(assert (=> b!590385 m!568807))

(assert (=> b!590385 m!568805))

(assert (=> b!590385 m!568805))

(declare-fun m!569025 () Bool)

(assert (=> b!590385 m!569025))

(assert (=> b!590123 d!86191))

(declare-fun d!86201 () Bool)

(declare-fun lt!267848 () (_ BitVec 32))

(assert (=> d!86201 (and (bvsge lt!267848 #b00000000000000000000000000000000) (bvslt lt!267848 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86201 (= lt!267848 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!86201 (validMask!0 mask!3053)))

(assert (=> d!86201 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!267848)))

(declare-fun bs!18267 () Bool)

(assert (= bs!18267 d!86201))

(declare-fun m!569031 () Bool)

(assert (=> bs!18267 m!569031))

(assert (=> bs!18267 m!568769))

(assert (=> b!590123 d!86201))

(check-sat (not b!590328) (not d!86189) (not b!590308) (not d!86201) (not d!86191) (not b!590377) (not b!590371) (not b!590236) (not b!590365) (not b!590294) (not b!590361) (not b!590329) (not bm!32811) (not bm!32807) (not d!86141) (not b!590359) (not d!86185) (not d!86187) (not b!590385) (not d!86149) (not b!590362))
(check-sat)
