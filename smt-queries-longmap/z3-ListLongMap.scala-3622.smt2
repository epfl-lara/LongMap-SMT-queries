; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49976 () Bool)

(assert start!49976)

(declare-fun b!547932 () Bool)

(declare-fun res!341332 () Bool)

(declare-fun e!316622 () Bool)

(assert (=> b!547932 (=> (not res!341332) (not e!316622))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547932 (= res!341332 (validKeyInArray!0 k0!1914))))

(declare-fun b!547933 () Bool)

(declare-fun res!341329 () Bool)

(declare-fun e!316623 () Bool)

(assert (=> b!547933 (=> (not res!341329) (not e!316623))))

(declare-datatypes ((array!34543 0))(
  ( (array!34544 (arr!16591 (Array (_ BitVec 32) (_ BitVec 64))) (size!16955 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34543)

(declare-datatypes ((List!10578 0))(
  ( (Nil!10575) (Cons!10574 (h!11544 (_ BitVec 64)) (t!16798 List!10578)) )
))
(declare-fun arrayNoDuplicates!0 (array!34543 (_ BitVec 32) List!10578) Bool)

(assert (=> b!547933 (= res!341329 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10575))))

(declare-fun b!547934 () Bool)

(declare-fun res!341330 () Bool)

(assert (=> b!547934 (=> (not res!341330) (not e!316622))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!547934 (= res!341330 (validKeyInArray!0 (select (arr!16591 a!3118) j!142)))))

(declare-fun b!547935 () Bool)

(declare-fun res!341328 () Bool)

(assert (=> b!547935 (=> (not res!341328) (not e!316623))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34543 (_ BitVec 32)) Bool)

(assert (=> b!547935 (= res!341328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!341327 () Bool)

(assert (=> start!49976 (=> (not res!341327) (not e!316622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49976 (= res!341327 (validMask!0 mask!3119))))

(assert (=> start!49976 e!316622))

(assert (=> start!49976 true))

(declare-fun array_inv!12450 (array!34543) Bool)

(assert (=> start!49976 (array_inv!12450 a!3118)))

(declare-fun b!547936 () Bool)

(declare-fun res!341326 () Bool)

(assert (=> b!547936 (=> (not res!341326) (not e!316622))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547936 (= res!341326 (and (= (size!16955 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16955 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16955 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547937 () Bool)

(declare-fun res!341325 () Bool)

(assert (=> b!547937 (=> (not res!341325) (not e!316622))))

(declare-fun arrayContainsKey!0 (array!34543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547937 (= res!341325 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547938 () Bool)

(assert (=> b!547938 (= e!316623 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsgt mask!3119 #b00111111111111111111111111111111)))))

(declare-fun b!547939 () Bool)

(assert (=> b!547939 (= e!316622 e!316623)))

(declare-fun res!341331 () Bool)

(assert (=> b!547939 (=> (not res!341331) (not e!316623))))

(declare-datatypes ((SeekEntryResult!4996 0))(
  ( (MissingZero!4996 (index!22211 (_ BitVec 32))) (Found!4996 (index!22212 (_ BitVec 32))) (Intermediate!4996 (undefined!5808 Bool) (index!22213 (_ BitVec 32)) (x!51307 (_ BitVec 32))) (Undefined!4996) (MissingVacant!4996 (index!22214 (_ BitVec 32))) )
))
(declare-fun lt!249733 () SeekEntryResult!4996)

(assert (=> b!547939 (= res!341331 (or (= lt!249733 (MissingZero!4996 i!1132)) (= lt!249733 (MissingVacant!4996 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34543 (_ BitVec 32)) SeekEntryResult!4996)

(assert (=> b!547939 (= lt!249733 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!49976 res!341327) b!547936))

(assert (= (and b!547936 res!341326) b!547934))

(assert (= (and b!547934 res!341330) b!547932))

(assert (= (and b!547932 res!341332) b!547937))

(assert (= (and b!547937 res!341325) b!547939))

(assert (= (and b!547939 res!341331) b!547935))

(assert (= (and b!547935 res!341328) b!547933))

(assert (= (and b!547933 res!341329) b!547938))

(declare-fun m!525289 () Bool)

(assert (=> start!49976 m!525289))

(declare-fun m!525291 () Bool)

(assert (=> start!49976 m!525291))

(declare-fun m!525293 () Bool)

(assert (=> b!547939 m!525293))

(declare-fun m!525295 () Bool)

(assert (=> b!547937 m!525295))

(declare-fun m!525297 () Bool)

(assert (=> b!547933 m!525297))

(declare-fun m!525299 () Bool)

(assert (=> b!547934 m!525299))

(assert (=> b!547934 m!525299))

(declare-fun m!525301 () Bool)

(assert (=> b!547934 m!525301))

(declare-fun m!525303 () Bool)

(assert (=> b!547932 m!525303))

(declare-fun m!525305 () Bool)

(assert (=> b!547935 m!525305))

(check-sat (not start!49976) (not b!547939) (not b!547934) (not b!547932) (not b!547933) (not b!547937) (not b!547935))
(check-sat)
(get-model)

(declare-fun e!316649 () SeekEntryResult!4996)

(declare-fun b!548000 () Bool)

(declare-fun lt!249747 () SeekEntryResult!4996)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34543 (_ BitVec 32)) SeekEntryResult!4996)

(assert (=> b!548000 (= e!316649 (seekKeyOrZeroReturnVacant!0 (x!51307 lt!249747) (index!22213 lt!249747) (index!22213 lt!249747) k0!1914 a!3118 mask!3119))))

(declare-fun b!548002 () Bool)

(declare-fun e!316648 () SeekEntryResult!4996)

(assert (=> b!548002 (= e!316648 (Found!4996 (index!22213 lt!249747)))))

(declare-fun b!548003 () Bool)

(assert (=> b!548003 (= e!316649 (MissingZero!4996 (index!22213 lt!249747)))))

(declare-fun b!548004 () Bool)

(declare-fun c!63640 () Bool)

(declare-fun lt!249748 () (_ BitVec 64))

(assert (=> b!548004 (= c!63640 (= lt!249748 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!548004 (= e!316648 e!316649)))

(declare-fun b!548005 () Bool)

(declare-fun e!316650 () SeekEntryResult!4996)

(assert (=> b!548005 (= e!316650 Undefined!4996)))

(declare-fun d!82667 () Bool)

(declare-fun lt!249746 () SeekEntryResult!4996)

(get-info :version)

(assert (=> d!82667 (and (or ((_ is Undefined!4996) lt!249746) (not ((_ is Found!4996) lt!249746)) (and (bvsge (index!22212 lt!249746) #b00000000000000000000000000000000) (bvslt (index!22212 lt!249746) (size!16955 a!3118)))) (or ((_ is Undefined!4996) lt!249746) ((_ is Found!4996) lt!249746) (not ((_ is MissingZero!4996) lt!249746)) (and (bvsge (index!22211 lt!249746) #b00000000000000000000000000000000) (bvslt (index!22211 lt!249746) (size!16955 a!3118)))) (or ((_ is Undefined!4996) lt!249746) ((_ is Found!4996) lt!249746) ((_ is MissingZero!4996) lt!249746) (not ((_ is MissingVacant!4996) lt!249746)) (and (bvsge (index!22214 lt!249746) #b00000000000000000000000000000000) (bvslt (index!22214 lt!249746) (size!16955 a!3118)))) (or ((_ is Undefined!4996) lt!249746) (ite ((_ is Found!4996) lt!249746) (= (select (arr!16591 a!3118) (index!22212 lt!249746)) k0!1914) (ite ((_ is MissingZero!4996) lt!249746) (= (select (arr!16591 a!3118) (index!22211 lt!249746)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4996) lt!249746) (= (select (arr!16591 a!3118) (index!22214 lt!249746)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82667 (= lt!249746 e!316650)))

(declare-fun c!63639 () Bool)

(assert (=> d!82667 (= c!63639 (and ((_ is Intermediate!4996) lt!249747) (undefined!5808 lt!249747)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34543 (_ BitVec 32)) SeekEntryResult!4996)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82667 (= lt!249747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82667 (validMask!0 mask!3119)))

(assert (=> d!82667 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!249746)))

(declare-fun b!548001 () Bool)

(assert (=> b!548001 (= e!316650 e!316648)))

(assert (=> b!548001 (= lt!249748 (select (arr!16591 a!3118) (index!22213 lt!249747)))))

(declare-fun c!63641 () Bool)

(assert (=> b!548001 (= c!63641 (= lt!249748 k0!1914))))

(assert (= (and d!82667 c!63639) b!548005))

(assert (= (and d!82667 (not c!63639)) b!548001))

(assert (= (and b!548001 c!63641) b!548002))

(assert (= (and b!548001 (not c!63641)) b!548004))

(assert (= (and b!548004 c!63640) b!548003))

(assert (= (and b!548004 (not c!63640)) b!548000))

(declare-fun m!525343 () Bool)

(assert (=> b!548000 m!525343))

(declare-fun m!525345 () Bool)

(assert (=> d!82667 m!525345))

(declare-fun m!525347 () Bool)

(assert (=> d!82667 m!525347))

(declare-fun m!525349 () Bool)

(assert (=> d!82667 m!525349))

(declare-fun m!525351 () Bool)

(assert (=> d!82667 m!525351))

(declare-fun m!525353 () Bool)

(assert (=> d!82667 m!525353))

(assert (=> d!82667 m!525347))

(assert (=> d!82667 m!525289))

(declare-fun m!525355 () Bool)

(assert (=> b!548001 m!525355))

(assert (=> b!547939 d!82667))

(declare-fun d!82679 () Bool)

(assert (=> d!82679 (= (validKeyInArray!0 (select (arr!16591 a!3118) j!142)) (and (not (= (select (arr!16591 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16591 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547934 d!82679))

(declare-fun d!82681 () Bool)

(assert (=> d!82681 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547932 d!82681))

(declare-fun d!82683 () Bool)

(assert (=> d!82683 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49976 d!82683))

(declare-fun d!82689 () Bool)

(assert (=> d!82689 (= (array_inv!12450 a!3118) (bvsge (size!16955 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49976 d!82689))

(declare-fun bm!32181 () Bool)

(declare-fun call!32184 () Bool)

(declare-fun c!63656 () Bool)

(assert (=> bm!32181 (= call!32184 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63656 (Cons!10574 (select (arr!16591 a!3118) #b00000000000000000000000000000000) Nil!10575) Nil!10575)))))

(declare-fun b!548055 () Bool)

(declare-fun e!316688 () Bool)

(assert (=> b!548055 (= e!316688 call!32184)))

(declare-fun d!82693 () Bool)

(declare-fun res!341403 () Bool)

(declare-fun e!316686 () Bool)

(assert (=> d!82693 (=> res!341403 e!316686)))

(assert (=> d!82693 (= res!341403 (bvsge #b00000000000000000000000000000000 (size!16955 a!3118)))))

(assert (=> d!82693 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10575) e!316686)))

(declare-fun b!548056 () Bool)

(declare-fun e!316687 () Bool)

(declare-fun contains!2799 (List!10578 (_ BitVec 64)) Bool)

(assert (=> b!548056 (= e!316687 (contains!2799 Nil!10575 (select (arr!16591 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548057 () Bool)

(declare-fun e!316689 () Bool)

(assert (=> b!548057 (= e!316689 e!316688)))

(assert (=> b!548057 (= c!63656 (validKeyInArray!0 (select (arr!16591 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548058 () Bool)

(assert (=> b!548058 (= e!316688 call!32184)))

(declare-fun b!548059 () Bool)

(assert (=> b!548059 (= e!316686 e!316689)))

(declare-fun res!341404 () Bool)

(assert (=> b!548059 (=> (not res!341404) (not e!316689))))

(assert (=> b!548059 (= res!341404 (not e!316687))))

(declare-fun res!341402 () Bool)

(assert (=> b!548059 (=> (not res!341402) (not e!316687))))

(assert (=> b!548059 (= res!341402 (validKeyInArray!0 (select (arr!16591 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!82693 (not res!341403)) b!548059))

(assert (= (and b!548059 res!341402) b!548056))

(assert (= (and b!548059 res!341404) b!548057))

(assert (= (and b!548057 c!63656) b!548058))

(assert (= (and b!548057 (not c!63656)) b!548055))

(assert (= (or b!548058 b!548055) bm!32181))

(declare-fun m!525383 () Bool)

(assert (=> bm!32181 m!525383))

(declare-fun m!525385 () Bool)

(assert (=> bm!32181 m!525385))

(assert (=> b!548056 m!525383))

(assert (=> b!548056 m!525383))

(declare-fun m!525387 () Bool)

(assert (=> b!548056 m!525387))

(assert (=> b!548057 m!525383))

(assert (=> b!548057 m!525383))

(declare-fun m!525389 () Bool)

(assert (=> b!548057 m!525389))

(assert (=> b!548059 m!525383))

(assert (=> b!548059 m!525383))

(assert (=> b!548059 m!525389))

(assert (=> b!547933 d!82693))

(declare-fun d!82699 () Bool)

(declare-fun res!341409 () Bool)

(declare-fun e!316694 () Bool)

(assert (=> d!82699 (=> res!341409 e!316694)))

(assert (=> d!82699 (= res!341409 (= (select (arr!16591 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82699 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!316694)))

(declare-fun b!548064 () Bool)

(declare-fun e!316695 () Bool)

(assert (=> b!548064 (= e!316694 e!316695)))

(declare-fun res!341410 () Bool)

(assert (=> b!548064 (=> (not res!341410) (not e!316695))))

(assert (=> b!548064 (= res!341410 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16955 a!3118)))))

(declare-fun b!548065 () Bool)

(assert (=> b!548065 (= e!316695 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82699 (not res!341409)) b!548064))

(assert (= (and b!548064 res!341410) b!548065))

(assert (=> d!82699 m!525383))

(declare-fun m!525391 () Bool)

(assert (=> b!548065 m!525391))

(assert (=> b!547937 d!82699))

(declare-fun b!548102 () Bool)

(declare-fun e!316719 () Bool)

(declare-fun e!316721 () Bool)

(assert (=> b!548102 (= e!316719 e!316721)))

(declare-fun lt!249775 () (_ BitVec 64))

(assert (=> b!548102 (= lt!249775 (select (arr!16591 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16939 0))(
  ( (Unit!16940) )
))
(declare-fun lt!249774 () Unit!16939)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34543 (_ BitVec 64) (_ BitVec 32)) Unit!16939)

(assert (=> b!548102 (= lt!249774 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249775 #b00000000000000000000000000000000))))

(assert (=> b!548102 (arrayContainsKey!0 a!3118 lt!249775 #b00000000000000000000000000000000)))

(declare-fun lt!249773 () Unit!16939)

(assert (=> b!548102 (= lt!249773 lt!249774)))

(declare-fun res!341421 () Bool)

(assert (=> b!548102 (= res!341421 (= (seekEntryOrOpen!0 (select (arr!16591 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!4996 #b00000000000000000000000000000000)))))

(assert (=> b!548102 (=> (not res!341421) (not e!316721))))

(declare-fun b!548103 () Bool)

(declare-fun e!316720 () Bool)

(assert (=> b!548103 (= e!316720 e!316719)))

(declare-fun c!63670 () Bool)

(assert (=> b!548103 (= c!63670 (validKeyInArray!0 (select (arr!16591 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32186 () Bool)

(declare-fun call!32189 () Bool)

(assert (=> bm!32186 (= call!32189 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!82701 () Bool)

(declare-fun res!341422 () Bool)

(assert (=> d!82701 (=> res!341422 e!316720)))

(assert (=> d!82701 (= res!341422 (bvsge #b00000000000000000000000000000000 (size!16955 a!3118)))))

(assert (=> d!82701 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316720)))

(declare-fun b!548104 () Bool)

(assert (=> b!548104 (= e!316719 call!32189)))

(declare-fun b!548105 () Bool)

(assert (=> b!548105 (= e!316721 call!32189)))

(assert (= (and d!82701 (not res!341422)) b!548103))

(assert (= (and b!548103 c!63670) b!548102))

(assert (= (and b!548103 (not c!63670)) b!548104))

(assert (= (and b!548102 res!341421) b!548105))

(assert (= (or b!548105 b!548104) bm!32186))

(assert (=> b!548102 m!525383))

(declare-fun m!525407 () Bool)

(assert (=> b!548102 m!525407))

(declare-fun m!525409 () Bool)

(assert (=> b!548102 m!525409))

(assert (=> b!548102 m!525383))

(declare-fun m!525411 () Bool)

(assert (=> b!548102 m!525411))

(assert (=> b!548103 m!525383))

(assert (=> b!548103 m!525383))

(assert (=> b!548103 m!525389))

(declare-fun m!525413 () Bool)

(assert (=> bm!32186 m!525413))

(assert (=> b!547935 d!82701))

(check-sat (not b!548057) (not b!548059) (not b!548103) (not d!82667) (not bm!32181) (not b!548065) (not bm!32186) (not b!548000) (not b!548102) (not b!548056))
(check-sat)
