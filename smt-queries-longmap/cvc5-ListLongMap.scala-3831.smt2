; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52538 () Bool)

(assert start!52538)

(declare-fun b!573548 () Bool)

(declare-fun e!329955 () Bool)

(declare-fun e!329958 () Bool)

(assert (=> b!573548 (= e!329955 e!329958)))

(declare-fun res!362783 () Bool)

(assert (=> b!573548 (=> res!362783 e!329958)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261904 () (_ BitVec 64))

(declare-datatypes ((array!35872 0))(
  ( (array!35873 (arr!17223 (Array (_ BitVec 32) (_ BitVec 64))) (size!17587 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35872)

(assert (=> b!573548 (= res!362783 (or (= lt!261904 (select (arr!17223 a!3118) j!142)) (= lt!261904 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5672 0))(
  ( (MissingZero!5672 (index!24915 (_ BitVec 32))) (Found!5672 (index!24916 (_ BitVec 32))) (Intermediate!5672 (undefined!6484 Bool) (index!24917 (_ BitVec 32)) (x!53790 (_ BitVec 32))) (Undefined!5672) (MissingVacant!5672 (index!24918 (_ BitVec 32))) )
))
(declare-fun lt!261905 () SeekEntryResult!5672)

(assert (=> b!573548 (= lt!261904 (select (arr!17223 a!3118) (index!24917 lt!261905)))))

(declare-fun b!573549 () Bool)

(declare-fun res!362787 () Bool)

(declare-fun e!329954 () Bool)

(assert (=> b!573549 (=> (not res!362787) (not e!329954))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35872 (_ BitVec 32)) Bool)

(assert (=> b!573549 (= res!362787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!573550 () Bool)

(declare-fun e!329957 () Bool)

(assert (=> b!573550 (= e!329957 e!329954)))

(declare-fun res!362789 () Bool)

(assert (=> b!573550 (=> (not res!362789) (not e!329954))))

(declare-fun lt!261908 () SeekEntryResult!5672)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!573550 (= res!362789 (or (= lt!261908 (MissingZero!5672 i!1132)) (= lt!261908 (MissingVacant!5672 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35872 (_ BitVec 32)) SeekEntryResult!5672)

(assert (=> b!573550 (= lt!261908 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!362795 () Bool)

(assert (=> start!52538 (=> (not res!362795) (not e!329957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52538 (= res!362795 (validMask!0 mask!3119))))

(assert (=> start!52538 e!329957))

(assert (=> start!52538 true))

(declare-fun array_inv!13019 (array!35872) Bool)

(assert (=> start!52538 (array_inv!13019 a!3118)))

(declare-fun e!329959 () Bool)

(declare-fun b!573551 () Bool)

(declare-fun lt!261903 () array!35872)

(declare-fun lt!261909 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35872 (_ BitVec 32)) SeekEntryResult!5672)

(assert (=> b!573551 (= e!329959 (= (seekEntryOrOpen!0 lt!261909 lt!261903 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53790 lt!261905) (index!24917 lt!261905) (index!24917 lt!261905) lt!261909 lt!261903 mask!3119)))))

(declare-fun e!329961 () Bool)

(declare-fun b!573552 () Bool)

(assert (=> b!573552 (= e!329961 (not (or (undefined!6484 lt!261905) (not (is-Intermediate!5672 lt!261905)) (let ((bdg!17977 (select (arr!17223 a!3118) (index!24917 lt!261905)))) (or (= bdg!17977 (select (arr!17223 a!3118) j!142)) (= bdg!17977 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24917 lt!261905) #b00000000000000000000000000000000) (bvsge (index!24917 lt!261905) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!53790 lt!261905) #b01111111111111111111111111111110) (bvsge (x!53790 lt!261905) #b00000000000000000000000000000000)))))))))

(declare-fun e!329960 () Bool)

(assert (=> b!573552 e!329960))

(declare-fun res!362792 () Bool)

(assert (=> b!573552 (=> (not res!362792) (not e!329960))))

(declare-fun lt!261906 () SeekEntryResult!5672)

(assert (=> b!573552 (= res!362792 (= lt!261906 (Found!5672 j!142)))))

(assert (=> b!573552 (= lt!261906 (seekEntryOrOpen!0 (select (arr!17223 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!573552 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18046 0))(
  ( (Unit!18047) )
))
(declare-fun lt!261910 () Unit!18046)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18046)

(assert (=> b!573552 (= lt!261910 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573553 () Bool)

(declare-fun res!362791 () Bool)

(assert (=> b!573553 (=> (not res!362791) (not e!329957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573553 (= res!362791 (validKeyInArray!0 k!1914))))

(declare-fun b!573554 () Bool)

(assert (=> b!573554 (= e!329960 e!329955)))

(declare-fun res!362793 () Bool)

(assert (=> b!573554 (=> res!362793 e!329955)))

(assert (=> b!573554 (= res!362793 (or (undefined!6484 lt!261905) (not (is-Intermediate!5672 lt!261905))))))

(declare-fun b!573555 () Bool)

(assert (=> b!573555 (= e!329954 e!329961)))

(declare-fun res!362790 () Bool)

(assert (=> b!573555 (=> (not res!362790) (not e!329961))))

(declare-fun lt!261907 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35872 (_ BitVec 32)) SeekEntryResult!5672)

(assert (=> b!573555 (= res!362790 (= lt!261905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261907 lt!261909 lt!261903 mask!3119)))))

(declare-fun lt!261902 () (_ BitVec 32))

(assert (=> b!573555 (= lt!261905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261902 (select (arr!17223 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573555 (= lt!261907 (toIndex!0 lt!261909 mask!3119))))

(assert (=> b!573555 (= lt!261909 (select (store (arr!17223 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!573555 (= lt!261902 (toIndex!0 (select (arr!17223 a!3118) j!142) mask!3119))))

(assert (=> b!573555 (= lt!261903 (array!35873 (store (arr!17223 a!3118) i!1132 k!1914) (size!17587 a!3118)))))

(declare-fun b!573556 () Bool)

(declare-fun res!362784 () Bool)

(assert (=> b!573556 (=> (not res!362784) (not e!329957))))

(assert (=> b!573556 (= res!362784 (validKeyInArray!0 (select (arr!17223 a!3118) j!142)))))

(declare-fun b!573557 () Bool)

(assert (=> b!573557 (= e!329958 e!329959)))

(declare-fun res!362785 () Bool)

(assert (=> b!573557 (=> (not res!362785) (not e!329959))))

(assert (=> b!573557 (= res!362785 (= lt!261906 (seekKeyOrZeroReturnVacant!0 (x!53790 lt!261905) (index!24917 lt!261905) (index!24917 lt!261905) (select (arr!17223 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573558 () Bool)

(declare-fun res!362794 () Bool)

(assert (=> b!573558 (=> (not res!362794) (not e!329954))))

(declare-datatypes ((List!11303 0))(
  ( (Nil!11300) (Cons!11299 (h!12329 (_ BitVec 64)) (t!17531 List!11303)) )
))
(declare-fun arrayNoDuplicates!0 (array!35872 (_ BitVec 32) List!11303) Bool)

(assert (=> b!573558 (= res!362794 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11300))))

(declare-fun b!573559 () Bool)

(declare-fun res!362788 () Bool)

(assert (=> b!573559 (=> (not res!362788) (not e!329957))))

(declare-fun arrayContainsKey!0 (array!35872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573559 (= res!362788 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!573560 () Bool)

(declare-fun res!362786 () Bool)

(assert (=> b!573560 (=> (not res!362786) (not e!329957))))

(assert (=> b!573560 (= res!362786 (and (= (size!17587 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17587 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17587 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52538 res!362795) b!573560))

(assert (= (and b!573560 res!362786) b!573556))

(assert (= (and b!573556 res!362784) b!573553))

(assert (= (and b!573553 res!362791) b!573559))

(assert (= (and b!573559 res!362788) b!573550))

(assert (= (and b!573550 res!362789) b!573549))

(assert (= (and b!573549 res!362787) b!573558))

(assert (= (and b!573558 res!362794) b!573555))

(assert (= (and b!573555 res!362790) b!573552))

(assert (= (and b!573552 res!362792) b!573554))

(assert (= (and b!573554 (not res!362793)) b!573548))

(assert (= (and b!573548 (not res!362783)) b!573557))

(assert (= (and b!573557 res!362785) b!573551))

(declare-fun m!552525 () Bool)

(assert (=> b!573557 m!552525))

(assert (=> b!573557 m!552525))

(declare-fun m!552527 () Bool)

(assert (=> b!573557 m!552527))

(declare-fun m!552529 () Bool)

(assert (=> b!573550 m!552529))

(assert (=> b!573548 m!552525))

(declare-fun m!552531 () Bool)

(assert (=> b!573548 m!552531))

(declare-fun m!552533 () Bool)

(assert (=> b!573558 m!552533))

(declare-fun m!552535 () Bool)

(assert (=> b!573553 m!552535))

(assert (=> b!573556 m!552525))

(assert (=> b!573556 m!552525))

(declare-fun m!552537 () Bool)

(assert (=> b!573556 m!552537))

(declare-fun m!552539 () Bool)

(assert (=> b!573549 m!552539))

(declare-fun m!552541 () Bool)

(assert (=> start!52538 m!552541))

(declare-fun m!552543 () Bool)

(assert (=> start!52538 m!552543))

(declare-fun m!552545 () Bool)

(assert (=> b!573559 m!552545))

(declare-fun m!552547 () Bool)

(assert (=> b!573551 m!552547))

(declare-fun m!552549 () Bool)

(assert (=> b!573551 m!552549))

(assert (=> b!573555 m!552525))

(declare-fun m!552551 () Bool)

(assert (=> b!573555 m!552551))

(declare-fun m!552553 () Bool)

(assert (=> b!573555 m!552553))

(assert (=> b!573555 m!552525))

(declare-fun m!552555 () Bool)

(assert (=> b!573555 m!552555))

(declare-fun m!552557 () Bool)

(assert (=> b!573555 m!552557))

(declare-fun m!552559 () Bool)

(assert (=> b!573555 m!552559))

(assert (=> b!573555 m!552525))

(declare-fun m!552561 () Bool)

(assert (=> b!573555 m!552561))

(assert (=> b!573552 m!552531))

(assert (=> b!573552 m!552525))

(declare-fun m!552563 () Bool)

(assert (=> b!573552 m!552563))

(declare-fun m!552565 () Bool)

(assert (=> b!573552 m!552565))

(assert (=> b!573552 m!552525))

(declare-fun m!552567 () Bool)

(assert (=> b!573552 m!552567))

(push 1)

(assert (not b!573558))

(assert (not b!573549))

(assert (not b!573550))

(assert (not b!573557))

(assert (not b!573556))

(assert (not b!573553))

(assert (not b!573551))

(assert (not b!573555))

(assert (not b!573559))

(assert (not b!573552))

(assert (not start!52538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!573692 () Bool)

(declare-fun e!330048 () Bool)

(declare-fun e!330047 () Bool)

(assert (=> b!573692 (= e!330048 e!330047)))

(declare-fun lt!261984 () (_ BitVec 64))

(assert (=> b!573692 (= lt!261984 (select (arr!17223 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!261985 () Unit!18046)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35872 (_ BitVec 64) (_ BitVec 32)) Unit!18046)

(assert (=> b!573692 (= lt!261985 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261984 #b00000000000000000000000000000000))))

(assert (=> b!573692 (arrayContainsKey!0 a!3118 lt!261984 #b00000000000000000000000000000000)))

(declare-fun lt!261983 () Unit!18046)

(assert (=> b!573692 (= lt!261983 lt!261985)))

(declare-fun res!362894 () Bool)

(assert (=> b!573692 (= res!362894 (= (seekEntryOrOpen!0 (select (arr!17223 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5672 #b00000000000000000000000000000000)))))

(assert (=> b!573692 (=> (not res!362894) (not e!330047))))

(declare-fun b!573693 () Bool)

(declare-fun call!32651 () Bool)

(assert (=> b!573693 (= e!330048 call!32651)))

(declare-fun b!573694 () Bool)

(declare-fun e!330046 () Bool)

(assert (=> b!573694 (= e!330046 e!330048)))

(declare-fun c!65759 () Bool)

(assert (=> b!573694 (= c!65759 (validKeyInArray!0 (select (arr!17223 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84965 () Bool)

(declare-fun res!362893 () Bool)

(assert (=> d!84965 (=> res!362893 e!330046)))

(assert (=> d!84965 (= res!362893 (bvsge #b00000000000000000000000000000000 (size!17587 a!3118)))))

(assert (=> d!84965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330046)))

(declare-fun bm!32648 () Bool)

(assert (=> bm!32648 (= call!32651 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573695 () Bool)

(assert (=> b!573695 (= e!330047 call!32651)))

(assert (= (and d!84965 (not res!362893)) b!573694))

(assert (= (and b!573694 c!65759) b!573692))

(assert (= (and b!573694 (not c!65759)) b!573693))

(assert (= (and b!573692 res!362894) b!573695))

(assert (= (or b!573695 b!573693) bm!32648))

(declare-fun m!552693 () Bool)

(assert (=> b!573692 m!552693))

(declare-fun m!552695 () Bool)

(assert (=> b!573692 m!552695))

(declare-fun m!552697 () Bool)

(assert (=> b!573692 m!552697))

(assert (=> b!573692 m!552693))

(declare-fun m!552699 () Bool)

(assert (=> b!573692 m!552699))

(assert (=> b!573694 m!552693))

(assert (=> b!573694 m!552693))

(declare-fun m!552701 () Bool)

(assert (=> b!573694 m!552701))

(declare-fun m!552703 () Bool)

(assert (=> bm!32648 m!552703))

(assert (=> b!573549 d!84965))

(declare-fun d!84973 () Bool)

(declare-fun res!362899 () Bool)

(declare-fun e!330053 () Bool)

(assert (=> d!84973 (=> res!362899 e!330053)))

(assert (=> d!84973 (= res!362899 (= (select (arr!17223 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84973 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!330053)))

(declare-fun b!573700 () Bool)

(declare-fun e!330054 () Bool)

(assert (=> b!573700 (= e!330053 e!330054)))

(declare-fun res!362900 () Bool)

(assert (=> b!573700 (=> (not res!362900) (not e!330054))))

(assert (=> b!573700 (= res!362900 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17587 a!3118)))))

(declare-fun b!573701 () Bool)

(assert (=> b!573701 (= e!330054 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84973 (not res!362899)) b!573700))

(assert (= (and b!573700 res!362900) b!573701))

(assert (=> d!84973 m!552693))

(declare-fun m!552705 () Bool)

(assert (=> b!573701 m!552705))

(assert (=> b!573559 d!84973))

(declare-fun b!573750 () Bool)

(declare-fun e!330082 () SeekEntryResult!5672)

(assert (=> b!573750 (= e!330082 Undefined!5672)))

(declare-fun b!573751 () Bool)

(declare-fun c!65783 () Bool)

(declare-fun lt!262012 () (_ BitVec 64))

(assert (=> b!573751 (= c!65783 (= lt!262012 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330083 () SeekEntryResult!5672)

(declare-fun e!330084 () SeekEntryResult!5672)

(assert (=> b!573751 (= e!330083 e!330084)))

(declare-fun d!84975 () Bool)

(declare-fun lt!262010 () SeekEntryResult!5672)

(assert (=> d!84975 (and (or (is-Undefined!5672 lt!262010) (not (is-Found!5672 lt!262010)) (and (bvsge (index!24916 lt!262010) #b00000000000000000000000000000000) (bvslt (index!24916 lt!262010) (size!17587 a!3118)))) (or (is-Undefined!5672 lt!262010) (is-Found!5672 lt!262010) (not (is-MissingZero!5672 lt!262010)) (and (bvsge (index!24915 lt!262010) #b00000000000000000000000000000000) (bvslt (index!24915 lt!262010) (size!17587 a!3118)))) (or (is-Undefined!5672 lt!262010) (is-Found!5672 lt!262010) (is-MissingZero!5672 lt!262010) (not (is-MissingVacant!5672 lt!262010)) (and (bvsge (index!24918 lt!262010) #b00000000000000000000000000000000) (bvslt (index!24918 lt!262010) (size!17587 a!3118)))) (or (is-Undefined!5672 lt!262010) (ite (is-Found!5672 lt!262010) (= (select (arr!17223 a!3118) (index!24916 lt!262010)) k!1914) (ite (is-MissingZero!5672 lt!262010) (= (select (arr!17223 a!3118) (index!24915 lt!262010)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5672 lt!262010) (= (select (arr!17223 a!3118) (index!24918 lt!262010)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84975 (= lt!262010 e!330082)))

(declare-fun c!65782 () Bool)

(declare-fun lt!262011 () SeekEntryResult!5672)

(assert (=> d!84975 (= c!65782 (and (is-Intermediate!5672 lt!262011) (undefined!6484 lt!262011)))))

(assert (=> d!84975 (= lt!262011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84975 (validMask!0 mask!3119)))

(assert (=> d!84975 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!262010)))

(declare-fun b!573752 () Bool)

(assert (=> b!573752 (= e!330083 (Found!5672 (index!24917 lt!262011)))))

(declare-fun b!573753 () Bool)

(assert (=> b!573753 (= e!330084 (MissingZero!5672 (index!24917 lt!262011)))))

(declare-fun b!573754 () Bool)

(assert (=> b!573754 (= e!330082 e!330083)))

(assert (=> b!573754 (= lt!262012 (select (arr!17223 a!3118) (index!24917 lt!262011)))))

(declare-fun c!65781 () Bool)

(assert (=> b!573754 (= c!65781 (= lt!262012 k!1914))))

(declare-fun b!573755 () Bool)

(assert (=> b!573755 (= e!330084 (seekKeyOrZeroReturnVacant!0 (x!53790 lt!262011) (index!24917 lt!262011) (index!24917 lt!262011) k!1914 a!3118 mask!3119))))

(assert (= (and d!84975 c!65782) b!573750))

(assert (= (and d!84975 (not c!65782)) b!573754))

(assert (= (and b!573754 c!65781) b!573752))

(assert (= (and b!573754 (not c!65781)) b!573751))

(assert (= (and b!573751 c!65783) b!573753))

(assert (= (and b!573751 (not c!65783)) b!573755))

(assert (=> d!84975 m!552541))

(declare-fun m!552741 () Bool)

(assert (=> d!84975 m!552741))

(declare-fun m!552743 () Bool)

(assert (=> d!84975 m!552743))

(declare-fun m!552745 () Bool)

(assert (=> d!84975 m!552745))

(assert (=> d!84975 m!552741))

(declare-fun m!552747 () Bool)

(assert (=> d!84975 m!552747))

(declare-fun m!552749 () Bool)

(assert (=> d!84975 m!552749))

(declare-fun m!552751 () Bool)

(assert (=> b!573754 m!552751))

(declare-fun m!552753 () Bool)

(assert (=> b!573755 m!552753))

(assert (=> b!573550 d!84975))

(declare-fun b!573808 () Bool)

(declare-fun e!330117 () SeekEntryResult!5672)

(declare-fun e!330115 () SeekEntryResult!5672)

(assert (=> b!573808 (= e!330117 e!330115)))

(declare-fun lt!262040 () (_ BitVec 64))

(declare-fun c!65807 () Bool)

(assert (=> b!573808 (= c!65807 (= lt!262040 (select (arr!17223 a!3118) j!142)))))

(declare-fun b!573809 () Bool)

(declare-fun c!65808 () Bool)

(assert (=> b!573809 (= c!65808 (= lt!262040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330116 () SeekEntryResult!5672)

(assert (=> b!573809 (= e!330115 e!330116)))

(declare-fun b!573810 () Bool)

(assert (=> b!573810 (= e!330115 (Found!5672 (index!24917 lt!261905)))))

(declare-fun d!84993 () Bool)

(declare-fun lt!262041 () SeekEntryResult!5672)

(assert (=> d!84993 (and (or (is-Undefined!5672 lt!262041) (not (is-Found!5672 lt!262041)) (and (bvsge (index!24916 lt!262041) #b00000000000000000000000000000000) (bvslt (index!24916 lt!262041) (size!17587 a!3118)))) (or (is-Undefined!5672 lt!262041) (is-Found!5672 lt!262041) (not (is-MissingVacant!5672 lt!262041)) (not (= (index!24918 lt!262041) (index!24917 lt!261905))) (and (bvsge (index!24918 lt!262041) #b00000000000000000000000000000000) (bvslt (index!24918 lt!262041) (size!17587 a!3118)))) (or (is-Undefined!5672 lt!262041) (ite (is-Found!5672 lt!262041) (= (select (arr!17223 a!3118) (index!24916 lt!262041)) (select (arr!17223 a!3118) j!142)) (and (is-MissingVacant!5672 lt!262041) (= (index!24918 lt!262041) (index!24917 lt!261905)) (= (select (arr!17223 a!3118) (index!24918 lt!262041)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84993 (= lt!262041 e!330117)))

(declare-fun c!65806 () Bool)

(assert (=> d!84993 (= c!65806 (bvsge (x!53790 lt!261905) #b01111111111111111111111111111110))))

(assert (=> d!84993 (= lt!262040 (select (arr!17223 a!3118) (index!24917 lt!261905)))))

(assert (=> d!84993 (validMask!0 mask!3119)))

(assert (=> d!84993 (= (seekKeyOrZeroReturnVacant!0 (x!53790 lt!261905) (index!24917 lt!261905) (index!24917 lt!261905) (select (arr!17223 a!3118) j!142) a!3118 mask!3119) lt!262041)))

(declare-fun b!573811 () Bool)

(assert (=> b!573811 (= e!330117 Undefined!5672)))

(declare-fun b!573812 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573812 (= e!330116 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53790 lt!261905) #b00000000000000000000000000000001) (nextIndex!0 (index!24917 lt!261905) (x!53790 lt!261905) mask!3119) (index!24917 lt!261905) (select (arr!17223 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573813 () Bool)

(assert (=> b!573813 (= e!330116 (MissingVacant!5672 (index!24917 lt!261905)))))

(assert (= (and d!84993 c!65806) b!573811))

(assert (= (and d!84993 (not c!65806)) b!573808))

(assert (= (and b!573808 c!65807) b!573810))

(assert (= (and b!573808 (not c!65807)) b!573809))

(assert (= (and b!573809 c!65808) b!573813))

(assert (= (and b!573809 (not c!65808)) b!573812))

(declare-fun m!552785 () Bool)

(assert (=> d!84993 m!552785))

(declare-fun m!552787 () Bool)

(assert (=> d!84993 m!552787))

(assert (=> d!84993 m!552531))

(assert (=> d!84993 m!552541))

(declare-fun m!552789 () Bool)

(assert (=> b!573812 m!552789))

(assert (=> b!573812 m!552789))

(assert (=> b!573812 m!552525))

(declare-fun m!552791 () Bool)

(assert (=> b!573812 m!552791))

(assert (=> b!573557 d!84993))

(declare-fun d!85007 () Bool)

(assert (=> d!85007 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52538 d!85007))

(declare-fun d!85009 () Bool)

(assert (=> d!85009 (= (array_inv!13019 a!3118) (bvsge (size!17587 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52538 d!85009))

(declare-fun d!85011 () Bool)

(assert (=> d!85011 (= (validKeyInArray!0 (select (arr!17223 a!3118) j!142)) (and (not (= (select (arr!17223 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17223 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573556 d!85011))

(declare-fun b!573875 () Bool)

(declare-fun e!330154 () Bool)

(declare-fun contains!2887 (List!11303 (_ BitVec 64)) Bool)

(assert (=> b!573875 (= e!330154 (contains!2887 Nil!11300 (select (arr!17223 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32658 () Bool)

(declare-fun call!32661 () Bool)

(declare-fun c!65832 () Bool)

(assert (=> bm!32658 (= call!32661 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65832 (Cons!11299 (select (arr!17223 a!3118) #b00000000000000000000000000000000) Nil!11300) Nil!11300)))))

(declare-fun b!573876 () Bool)

(declare-fun e!330155 () Bool)

(assert (=> b!573876 (= e!330155 call!32661)))

(declare-fun d!85015 () Bool)

(declare-fun res!362931 () Bool)

(declare-fun e!330156 () Bool)

(assert (=> d!85015 (=> res!362931 e!330156)))

(assert (=> d!85015 (= res!362931 (bvsge #b00000000000000000000000000000000 (size!17587 a!3118)))))

(assert (=> d!85015 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11300) e!330156)))

(declare-fun b!573877 () Bool)

(assert (=> b!573877 (= e!330155 call!32661)))

(declare-fun b!573878 () Bool)

(declare-fun e!330153 () Bool)

(assert (=> b!573878 (= e!330156 e!330153)))

(declare-fun res!362930 () Bool)

(assert (=> b!573878 (=> (not res!362930) (not e!330153))))

(assert (=> b!573878 (= res!362930 (not e!330154))))

(declare-fun res!362932 () Bool)

(assert (=> b!573878 (=> (not res!362932) (not e!330154))))

(assert (=> b!573878 (= res!362932 (validKeyInArray!0 (select (arr!17223 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573879 () Bool)

(assert (=> b!573879 (= e!330153 e!330155)))

(assert (=> b!573879 (= c!65832 (validKeyInArray!0 (select (arr!17223 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!85015 (not res!362931)) b!573878))

(assert (= (and b!573878 res!362932) b!573875))

(assert (= (and b!573878 res!362930) b!573879))

(assert (= (and b!573879 c!65832) b!573876))

(assert (= (and b!573879 (not c!65832)) b!573877))

(assert (= (or b!573876 b!573877) bm!32658))

(assert (=> b!573875 m!552693))

(assert (=> b!573875 m!552693))

(declare-fun m!552813 () Bool)

(assert (=> b!573875 m!552813))

(assert (=> bm!32658 m!552693))

(declare-fun m!552815 () Bool)

(assert (=> bm!32658 m!552815))

(assert (=> b!573878 m!552693))

(assert (=> b!573878 m!552693))

(assert (=> b!573878 m!552701))

(assert (=> b!573879 m!552693))

(assert (=> b!573879 m!552693))

(assert (=> b!573879 m!552701))

(assert (=> b!573558 d!85015))

(declare-fun b!573943 () Bool)

(declare-fun lt!262081 () SeekEntryResult!5672)

(assert (=> b!573943 (and (bvsge (index!24917 lt!262081) #b00000000000000000000000000000000) (bvslt (index!24917 lt!262081) (size!17587 lt!261903)))))

(declare-fun e!330194 () Bool)

(assert (=> b!573943 (= e!330194 (= (select (arr!17223 lt!261903) (index!24917 lt!262081)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!573944 () Bool)

(declare-fun e!330193 () Bool)

(assert (=> b!573944 (= e!330193 (bvsge (x!53790 lt!262081) #b01111111111111111111111111111110))))

(declare-fun b!573945 () Bool)

(declare-fun e!330192 () Bool)

(assert (=> b!573945 (= e!330193 e!330192)))

(declare-fun res!362957 () Bool)

(assert (=> b!573945 (= res!362957 (and (is-Intermediate!5672 lt!262081) (not (undefined!6484 lt!262081)) (bvslt (x!53790 lt!262081) #b01111111111111111111111111111110) (bvsge (x!53790 lt!262081) #b00000000000000000000000000000000) (bvsge (x!53790 lt!262081) #b00000000000000000000000000000000)))))

(assert (=> b!573945 (=> (not res!362957) (not e!330192))))

(declare-fun d!85021 () Bool)

(assert (=> d!85021 e!330193))

(declare-fun c!65855 () Bool)

(assert (=> d!85021 (= c!65855 (and (is-Intermediate!5672 lt!262081) (undefined!6484 lt!262081)))))

(declare-fun e!330195 () SeekEntryResult!5672)

(assert (=> d!85021 (= lt!262081 e!330195)))

(declare-fun c!65854 () Bool)

(assert (=> d!85021 (= c!65854 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262082 () (_ BitVec 64))

(assert (=> d!85021 (= lt!262082 (select (arr!17223 lt!261903) lt!261907))))

(assert (=> d!85021 (validMask!0 mask!3119)))

(assert (=> d!85021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261907 lt!261909 lt!261903 mask!3119) lt!262081)))

(declare-fun b!573946 () Bool)

(declare-fun e!330196 () SeekEntryResult!5672)

(assert (=> b!573946 (= e!330196 (Intermediate!5672 false lt!261907 #b00000000000000000000000000000000))))

(declare-fun b!573947 () Bool)

(assert (=> b!573947 (and (bvsge (index!24917 lt!262081) #b00000000000000000000000000000000) (bvslt (index!24917 lt!262081) (size!17587 lt!261903)))))

(declare-fun res!362958 () Bool)

(assert (=> b!573947 (= res!362958 (= (select (arr!17223 lt!261903) (index!24917 lt!262081)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573947 (=> res!362958 e!330194)))

(declare-fun b!573948 () Bool)

(assert (=> b!573948 (= e!330195 (Intermediate!5672 true lt!261907 #b00000000000000000000000000000000))))

(declare-fun b!573949 () Bool)

(assert (=> b!573949 (= e!330195 e!330196)))

(declare-fun c!65856 () Bool)

(assert (=> b!573949 (= c!65856 (or (= lt!262082 lt!261909) (= (bvadd lt!262082 lt!262082) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573950 () Bool)

(assert (=> b!573950 (and (bvsge (index!24917 lt!262081) #b00000000000000000000000000000000) (bvslt (index!24917 lt!262081) (size!17587 lt!261903)))))

(declare-fun res!362956 () Bool)

(assert (=> b!573950 (= res!362956 (= (select (arr!17223 lt!261903) (index!24917 lt!262081)) lt!261909))))

(assert (=> b!573950 (=> res!362956 e!330194)))

(assert (=> b!573950 (= e!330192 e!330194)))

(declare-fun b!573951 () Bool)

(assert (=> b!573951 (= e!330196 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261907 #b00000000000000000000000000000000 mask!3119) lt!261909 lt!261903 mask!3119))))

(assert (= (and d!85021 c!65854) b!573948))

(assert (= (and d!85021 (not c!65854)) b!573949))

(assert (= (and b!573949 c!65856) b!573946))

(assert (= (and b!573949 (not c!65856)) b!573951))

(assert (= (and d!85021 c!65855) b!573944))

(assert (= (and d!85021 (not c!65855)) b!573945))

(assert (= (and b!573945 res!362957) b!573950))

(assert (= (and b!573950 (not res!362956)) b!573947))

(assert (= (and b!573947 (not res!362958)) b!573943))

(declare-fun m!552849 () Bool)

(assert (=> d!85021 m!552849))

(assert (=> d!85021 m!552541))

(declare-fun m!552851 () Bool)

(assert (=> b!573951 m!552851))

(assert (=> b!573951 m!552851))

(declare-fun m!552853 () Bool)

(assert (=> b!573951 m!552853))

(declare-fun m!552855 () Bool)

(assert (=> b!573950 m!552855))

(assert (=> b!573943 m!552855))

(assert (=> b!573947 m!552855))

(assert (=> b!573555 d!85021))

(declare-fun b!573952 () Bool)

(declare-fun lt!262087 () SeekEntryResult!5672)

(assert (=> b!573952 (and (bvsge (index!24917 lt!262087) #b00000000000000000000000000000000) (bvslt (index!24917 lt!262087) (size!17587 a!3118)))))

(declare-fun e!330199 () Bool)

(assert (=> b!573952 (= e!330199 (= (select (arr!17223 a!3118) (index!24917 lt!262087)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!573953 () Bool)

(declare-fun e!330198 () Bool)

(assert (=> b!573953 (= e!330198 (bvsge (x!53790 lt!262087) #b01111111111111111111111111111110))))

(declare-fun b!573954 () Bool)

(declare-fun e!330197 () Bool)

(assert (=> b!573954 (= e!330198 e!330197)))

(declare-fun res!362960 () Bool)

(assert (=> b!573954 (= res!362960 (and (is-Intermediate!5672 lt!262087) (not (undefined!6484 lt!262087)) (bvslt (x!53790 lt!262087) #b01111111111111111111111111111110) (bvsge (x!53790 lt!262087) #b00000000000000000000000000000000) (bvsge (x!53790 lt!262087) #b00000000000000000000000000000000)))))

(assert (=> b!573954 (=> (not res!362960) (not e!330197))))

(declare-fun d!85033 () Bool)

(assert (=> d!85033 e!330198))

(declare-fun c!65858 () Bool)

(assert (=> d!85033 (= c!65858 (and (is-Intermediate!5672 lt!262087) (undefined!6484 lt!262087)))))

(declare-fun e!330200 () SeekEntryResult!5672)

(assert (=> d!85033 (= lt!262087 e!330200)))

(declare-fun c!65857 () Bool)

(assert (=> d!85033 (= c!65857 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262088 () (_ BitVec 64))

(assert (=> d!85033 (= lt!262088 (select (arr!17223 a!3118) lt!261902))))

(assert (=> d!85033 (validMask!0 mask!3119)))

(assert (=> d!85033 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261902 (select (arr!17223 a!3118) j!142) a!3118 mask!3119) lt!262087)))

(declare-fun b!573955 () Bool)

(declare-fun e!330201 () SeekEntryResult!5672)

(assert (=> b!573955 (= e!330201 (Intermediate!5672 false lt!261902 #b00000000000000000000000000000000))))

(declare-fun b!573956 () Bool)

(assert (=> b!573956 (and (bvsge (index!24917 lt!262087) #b00000000000000000000000000000000) (bvslt (index!24917 lt!262087) (size!17587 a!3118)))))

(declare-fun res!362961 () Bool)

(assert (=> b!573956 (= res!362961 (= (select (arr!17223 a!3118) (index!24917 lt!262087)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573956 (=> res!362961 e!330199)))

(declare-fun b!573957 () Bool)

(assert (=> b!573957 (= e!330200 (Intermediate!5672 true lt!261902 #b00000000000000000000000000000000))))

(declare-fun b!573958 () Bool)

(assert (=> b!573958 (= e!330200 e!330201)))

(declare-fun c!65859 () Bool)

(assert (=> b!573958 (= c!65859 (or (= lt!262088 (select (arr!17223 a!3118) j!142)) (= (bvadd lt!262088 lt!262088) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573959 () Bool)

(assert (=> b!573959 (and (bvsge (index!24917 lt!262087) #b00000000000000000000000000000000) (bvslt (index!24917 lt!262087) (size!17587 a!3118)))))

(declare-fun res!362959 () Bool)

(assert (=> b!573959 (= res!362959 (= (select (arr!17223 a!3118) (index!24917 lt!262087)) (select (arr!17223 a!3118) j!142)))))

(assert (=> b!573959 (=> res!362959 e!330199)))

(assert (=> b!573959 (= e!330197 e!330199)))

(declare-fun b!573960 () Bool)

(assert (=> b!573960 (= e!330201 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261902 #b00000000000000000000000000000000 mask!3119) (select (arr!17223 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!85033 c!65857) b!573957))

(assert (= (and d!85033 (not c!65857)) b!573958))

(assert (= (and b!573958 c!65859) b!573955))

(assert (= (and b!573958 (not c!65859)) b!573960))

(assert (= (and d!85033 c!65858) b!573953))

(assert (= (and d!85033 (not c!65858)) b!573954))

(assert (= (and b!573954 res!362960) b!573959))

(assert (= (and b!573959 (not res!362959)) b!573956))

(assert (= (and b!573956 (not res!362961)) b!573952))

(declare-fun m!552857 () Bool)

(assert (=> d!85033 m!552857))

(assert (=> d!85033 m!552541))

(declare-fun m!552859 () Bool)

(assert (=> b!573960 m!552859))

(assert (=> b!573960 m!552859))

(assert (=> b!573960 m!552525))

(declare-fun m!552861 () Bool)

(assert (=> b!573960 m!552861))

(declare-fun m!552863 () Bool)

(assert (=> b!573959 m!552863))

(assert (=> b!573952 m!552863))

(assert (=> b!573956 m!552863))

(assert (=> b!573555 d!85033))

(declare-fun d!85039 () Bool)

(declare-fun lt!262098 () (_ BitVec 32))

(declare-fun lt!262097 () (_ BitVec 32))

(assert (=> d!85039 (= lt!262098 (bvmul (bvxor lt!262097 (bvlshr lt!262097 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85039 (= lt!262097 ((_ extract 31 0) (bvand (bvxor lt!261909 (bvlshr lt!261909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85039 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362962 (let ((h!12334 ((_ extract 31 0) (bvand (bvxor lt!261909 (bvlshr lt!261909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53801 (bvmul (bvxor h!12334 (bvlshr h!12334 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53801 (bvlshr x!53801 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362962 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362962 #b00000000000000000000000000000000))))))

(assert (=> d!85039 (= (toIndex!0 lt!261909 mask!3119) (bvand (bvxor lt!262098 (bvlshr lt!262098 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573555 d!85039))

(declare-fun d!85041 () Bool)

(declare-fun lt!262100 () (_ BitVec 32))

(declare-fun lt!262099 () (_ BitVec 32))

(assert (=> d!85041 (= lt!262100 (bvmul (bvxor lt!262099 (bvlshr lt!262099 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85041 (= lt!262099 ((_ extract 31 0) (bvand (bvxor (select (arr!17223 a!3118) j!142) (bvlshr (select (arr!17223 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85041 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362962 (let ((h!12334 ((_ extract 31 0) (bvand (bvxor (select (arr!17223 a!3118) j!142) (bvlshr (select (arr!17223 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53801 (bvmul (bvxor h!12334 (bvlshr h!12334 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53801 (bvlshr x!53801 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362962 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362962 #b00000000000000000000000000000000))))))

(assert (=> d!85041 (= (toIndex!0 (select (arr!17223 a!3118) j!142) mask!3119) (bvand (bvxor lt!262100 (bvlshr lt!262100 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573555 d!85041))

(declare-fun b!573971 () Bool)

(declare-fun e!330210 () SeekEntryResult!5672)

(assert (=> b!573971 (= e!330210 Undefined!5672)))

(declare-fun b!573972 () Bool)

(declare-fun c!65864 () Bool)

(declare-fun lt!262103 () (_ BitVec 64))

(assert (=> b!573972 (= c!65864 (= lt!262103 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330211 () SeekEntryResult!5672)

(declare-fun e!330212 () SeekEntryResult!5672)

(assert (=> b!573972 (= e!330211 e!330212)))

(declare-fun d!85043 () Bool)

(declare-fun lt!262101 () SeekEntryResult!5672)

(assert (=> d!85043 (and (or (is-Undefined!5672 lt!262101) (not (is-Found!5672 lt!262101)) (and (bvsge (index!24916 lt!262101) #b00000000000000000000000000000000) (bvslt (index!24916 lt!262101) (size!17587 lt!261903)))) (or (is-Undefined!5672 lt!262101) (is-Found!5672 lt!262101) (not (is-MissingZero!5672 lt!262101)) (and (bvsge (index!24915 lt!262101) #b00000000000000000000000000000000) (bvslt (index!24915 lt!262101) (size!17587 lt!261903)))) (or (is-Undefined!5672 lt!262101) (is-Found!5672 lt!262101) (is-MissingZero!5672 lt!262101) (not (is-MissingVacant!5672 lt!262101)) (and (bvsge (index!24918 lt!262101) #b00000000000000000000000000000000) (bvslt (index!24918 lt!262101) (size!17587 lt!261903)))) (or (is-Undefined!5672 lt!262101) (ite (is-Found!5672 lt!262101) (= (select (arr!17223 lt!261903) (index!24916 lt!262101)) lt!261909) (ite (is-MissingZero!5672 lt!262101) (= (select (arr!17223 lt!261903) (index!24915 lt!262101)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5672 lt!262101) (= (select (arr!17223 lt!261903) (index!24918 lt!262101)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85043 (= lt!262101 e!330210)))

(declare-fun c!65863 () Bool)

(declare-fun lt!262102 () SeekEntryResult!5672)

(assert (=> d!85043 (= c!65863 (and (is-Intermediate!5672 lt!262102) (undefined!6484 lt!262102)))))

(assert (=> d!85043 (= lt!262102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!261909 mask!3119) lt!261909 lt!261903 mask!3119))))

(assert (=> d!85043 (validMask!0 mask!3119)))

(assert (=> d!85043 (= (seekEntryOrOpen!0 lt!261909 lt!261903 mask!3119) lt!262101)))

(declare-fun b!573973 () Bool)

(assert (=> b!573973 (= e!330211 (Found!5672 (index!24917 lt!262102)))))

(declare-fun b!573974 () Bool)

(assert (=> b!573974 (= e!330212 (MissingZero!5672 (index!24917 lt!262102)))))

(declare-fun b!573975 () Bool)

(assert (=> b!573975 (= e!330210 e!330211)))

(assert (=> b!573975 (= lt!262103 (select (arr!17223 lt!261903) (index!24917 lt!262102)))))

(declare-fun c!65862 () Bool)

(assert (=> b!573975 (= c!65862 (= lt!262103 lt!261909))))

(declare-fun b!573976 () Bool)

(assert (=> b!573976 (= e!330212 (seekKeyOrZeroReturnVacant!0 (x!53790 lt!262102) (index!24917 lt!262102) (index!24917 lt!262102) lt!261909 lt!261903 mask!3119))))

(assert (= (and d!85043 c!65863) b!573971))

(assert (= (and d!85043 (not c!65863)) b!573975))

(assert (= (and b!573975 c!65862) b!573973))

(assert (= (and b!573975 (not c!65862)) b!573972))

(assert (= (and b!573972 c!65864) b!573974))

(assert (= (and b!573972 (not c!65864)) b!573976))

(assert (=> d!85043 m!552541))

(assert (=> d!85043 m!552555))

(declare-fun m!552865 () Bool)

(assert (=> d!85043 m!552865))

(declare-fun m!552867 () Bool)

(assert (=> d!85043 m!552867))

(assert (=> d!85043 m!552555))

(declare-fun m!552869 () Bool)

(assert (=> d!85043 m!552869))

(declare-fun m!552871 () Bool)

(assert (=> d!85043 m!552871))

(declare-fun m!552873 () Bool)

(assert (=> b!573975 m!552873))

(declare-fun m!552875 () Bool)

(assert (=> b!573976 m!552875))

(assert (=> b!573551 d!85043))

(declare-fun b!573982 () Bool)

(declare-fun e!330219 () SeekEntryResult!5672)

(declare-fun e!330217 () SeekEntryResult!5672)

(assert (=> b!573982 (= e!330219 e!330217)))

(declare-fun c!65867 () Bool)

(declare-fun lt!262104 () (_ BitVec 64))

(assert (=> b!573982 (= c!65867 (= lt!262104 lt!261909))))

(declare-fun b!573983 () Bool)

(declare-fun c!65868 () Bool)

(assert (=> b!573983 (= c!65868 (= lt!262104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330218 () SeekEntryResult!5672)

(assert (=> b!573983 (= e!330217 e!330218)))

(declare-fun b!573984 () Bool)

(assert (=> b!573984 (= e!330217 (Found!5672 (index!24917 lt!261905)))))

(declare-fun lt!262105 () SeekEntryResult!5672)

(declare-fun d!85045 () Bool)

(assert (=> d!85045 (and (or (is-Undefined!5672 lt!262105) (not (is-Found!5672 lt!262105)) (and (bvsge (index!24916 lt!262105) #b00000000000000000000000000000000) (bvslt (index!24916 lt!262105) (size!17587 lt!261903)))) (or (is-Undefined!5672 lt!262105) (is-Found!5672 lt!262105) (not (is-MissingVacant!5672 lt!262105)) (not (= (index!24918 lt!262105) (index!24917 lt!261905))) (and (bvsge (index!24918 lt!262105) #b00000000000000000000000000000000) (bvslt (index!24918 lt!262105) (size!17587 lt!261903)))) (or (is-Undefined!5672 lt!262105) (ite (is-Found!5672 lt!262105) (= (select (arr!17223 lt!261903) (index!24916 lt!262105)) lt!261909) (and (is-MissingVacant!5672 lt!262105) (= (index!24918 lt!262105) (index!24917 lt!261905)) (= (select (arr!17223 lt!261903) (index!24918 lt!262105)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85045 (= lt!262105 e!330219)))

(declare-fun c!65866 () Bool)

(assert (=> d!85045 (= c!65866 (bvsge (x!53790 lt!261905) #b01111111111111111111111111111110))))

(assert (=> d!85045 (= lt!262104 (select (arr!17223 lt!261903) (index!24917 lt!261905)))))

(assert (=> d!85045 (validMask!0 mask!3119)))

(assert (=> d!85045 (= (seekKeyOrZeroReturnVacant!0 (x!53790 lt!261905) (index!24917 lt!261905) (index!24917 lt!261905) lt!261909 lt!261903 mask!3119) lt!262105)))

(declare-fun b!573985 () Bool)

(assert (=> b!573985 (= e!330219 Undefined!5672)))

(declare-fun b!573986 () Bool)

(assert (=> b!573986 (= e!330218 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53790 lt!261905) #b00000000000000000000000000000001) (nextIndex!0 (index!24917 lt!261905) (x!53790 lt!261905) mask!3119) (index!24917 lt!261905) lt!261909 lt!261903 mask!3119))))

(declare-fun b!573987 () Bool)

(assert (=> b!573987 (= e!330218 (MissingVacant!5672 (index!24917 lt!261905)))))

(assert (= (and d!85045 c!65866) b!573985))

(assert (= (and d!85045 (not c!65866)) b!573982))

(assert (= (and b!573982 c!65867) b!573984))

(assert (= (and b!573982 (not c!65867)) b!573983))

(assert (= (and b!573983 c!65868) b!573987))

(assert (= (and b!573983 (not c!65868)) b!573986))

(declare-fun m!552881 () Bool)

(assert (=> d!85045 m!552881))

(declare-fun m!552883 () Bool)

(assert (=> d!85045 m!552883))

(declare-fun m!552885 () Bool)

(assert (=> d!85045 m!552885))

(assert (=> d!85045 m!552541))

(assert (=> b!573986 m!552789))

(assert (=> b!573986 m!552789))

(declare-fun m!552887 () Bool)

(assert (=> b!573986 m!552887))

(assert (=> b!573551 d!85045))

(declare-fun d!85049 () Bool)

(assert (=> d!85049 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573553 d!85049))

(declare-fun b!573988 () Bool)

(declare-fun e!330220 () SeekEntryResult!5672)

(assert (=> b!573988 (= e!330220 Undefined!5672)))

(declare-fun b!573989 () Bool)

(declare-fun c!65871 () Bool)

(declare-fun lt!262108 () (_ BitVec 64))

(assert (=> b!573989 (= c!65871 (= lt!262108 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330221 () SeekEntryResult!5672)

(declare-fun e!330222 () SeekEntryResult!5672)

(assert (=> b!573989 (= e!330221 e!330222)))

(declare-fun d!85051 () Bool)

(declare-fun lt!262106 () SeekEntryResult!5672)

(assert (=> d!85051 (and (or (is-Undefined!5672 lt!262106) (not (is-Found!5672 lt!262106)) (and (bvsge (index!24916 lt!262106) #b00000000000000000000000000000000) (bvslt (index!24916 lt!262106) (size!17587 a!3118)))) (or (is-Undefined!5672 lt!262106) (is-Found!5672 lt!262106) (not (is-MissingZero!5672 lt!262106)) (and (bvsge (index!24915 lt!262106) #b00000000000000000000000000000000) (bvslt (index!24915 lt!262106) (size!17587 a!3118)))) (or (is-Undefined!5672 lt!262106) (is-Found!5672 lt!262106) (is-MissingZero!5672 lt!262106) (not (is-MissingVacant!5672 lt!262106)) (and (bvsge (index!24918 lt!262106) #b00000000000000000000000000000000) (bvslt (index!24918 lt!262106) (size!17587 a!3118)))) (or (is-Undefined!5672 lt!262106) (ite (is-Found!5672 lt!262106) (= (select (arr!17223 a!3118) (index!24916 lt!262106)) (select (arr!17223 a!3118) j!142)) (ite (is-MissingZero!5672 lt!262106) (= (select (arr!17223 a!3118) (index!24915 lt!262106)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5672 lt!262106) (= (select (arr!17223 a!3118) (index!24918 lt!262106)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85051 (= lt!262106 e!330220)))

(declare-fun c!65870 () Bool)

(declare-fun lt!262107 () SeekEntryResult!5672)

(assert (=> d!85051 (= c!65870 (and (is-Intermediate!5672 lt!262107) (undefined!6484 lt!262107)))))

(assert (=> d!85051 (= lt!262107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17223 a!3118) j!142) mask!3119) (select (arr!17223 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85051 (validMask!0 mask!3119)))

(assert (=> d!85051 (= (seekEntryOrOpen!0 (select (arr!17223 a!3118) j!142) a!3118 mask!3119) lt!262106)))

(declare-fun b!573990 () Bool)

(assert (=> b!573990 (= e!330221 (Found!5672 (index!24917 lt!262107)))))

(declare-fun b!573991 () Bool)

(assert (=> b!573991 (= e!330222 (MissingZero!5672 (index!24917 lt!262107)))))

(declare-fun b!573992 () Bool)

(assert (=> b!573992 (= e!330220 e!330221)))

(assert (=> b!573992 (= lt!262108 (select (arr!17223 a!3118) (index!24917 lt!262107)))))

(declare-fun c!65869 () Bool)

(assert (=> b!573992 (= c!65869 (= lt!262108 (select (arr!17223 a!3118) j!142)))))

(declare-fun b!573993 () Bool)

(assert (=> b!573993 (= e!330222 (seekKeyOrZeroReturnVacant!0 (x!53790 lt!262107) (index!24917 lt!262107) (index!24917 lt!262107) (select (arr!17223 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!85051 c!65870) b!573988))

(assert (= (and d!85051 (not c!65870)) b!573992))

(assert (= (and b!573992 c!65869) b!573990))

(assert (= (and b!573992 (not c!65869)) b!573989))

(assert (= (and b!573989 c!65871) b!573991))

(assert (= (and b!573989 (not c!65871)) b!573993))

(assert (=> d!85051 m!552541))

(assert (=> d!85051 m!552525))

(assert (=> d!85051 m!552551))

(declare-fun m!552889 () Bool)

(assert (=> d!85051 m!552889))

(declare-fun m!552891 () Bool)

(assert (=> d!85051 m!552891))

(assert (=> d!85051 m!552551))

(assert (=> d!85051 m!552525))

(declare-fun m!552893 () Bool)

(assert (=> d!85051 m!552893))

(declare-fun m!552895 () Bool)

(assert (=> d!85051 m!552895))

(declare-fun m!552897 () Bool)

(assert (=> b!573992 m!552897))

(assert (=> b!573993 m!552525))

(declare-fun m!552899 () Bool)

(assert (=> b!573993 m!552899))

(assert (=> b!573552 d!85051))

(declare-fun b!573998 () Bool)

(declare-fun e!330229 () Bool)

(declare-fun e!330228 () Bool)

(assert (=> b!573998 (= e!330229 e!330228)))

(declare-fun lt!262110 () (_ BitVec 64))

(assert (=> b!573998 (= lt!262110 (select (arr!17223 a!3118) j!142))))

(declare-fun lt!262111 () Unit!18046)

(assert (=> b!573998 (= lt!262111 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262110 j!142))))

(assert (=> b!573998 (arrayContainsKey!0 a!3118 lt!262110 #b00000000000000000000000000000000)))

(declare-fun lt!262109 () Unit!18046)

(assert (=> b!573998 (= lt!262109 lt!262111)))

(declare-fun res!362977 () Bool)

(assert (=> b!573998 (= res!362977 (= (seekEntryOrOpen!0 (select (arr!17223 a!3118) j!142) a!3118 mask!3119) (Found!5672 j!142)))))

(assert (=> b!573998 (=> (not res!362977) (not e!330228))))

(declare-fun b!573999 () Bool)

(declare-fun call!32665 () Bool)

(assert (=> b!573999 (= e!330229 call!32665)))

(declare-fun b!574000 () Bool)

(declare-fun e!330227 () Bool)

(assert (=> b!574000 (= e!330227 e!330229)))

(declare-fun c!65872 () Bool)

(assert (=> b!574000 (= c!65872 (validKeyInArray!0 (select (arr!17223 a!3118) j!142)))))

(declare-fun d!85053 () Bool)

(declare-fun res!362976 () Bool)

(assert (=> d!85053 (=> res!362976 e!330227)))

(assert (=> d!85053 (= res!362976 (bvsge j!142 (size!17587 a!3118)))))

(assert (=> d!85053 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330227)))

(declare-fun bm!32662 () Bool)

(assert (=> bm!32662 (= call!32665 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!574001 () Bool)

(assert (=> b!574001 (= e!330228 call!32665)))

(assert (= (and d!85053 (not res!362976)) b!574000))

(assert (= (and b!574000 c!65872) b!573998))

(assert (= (and b!574000 (not c!65872)) b!573999))

(assert (= (and b!573998 res!362977) b!574001))

(assert (= (or b!574001 b!573999) bm!32662))

(assert (=> b!573998 m!552525))

(declare-fun m!552901 () Bool)

(assert (=> b!573998 m!552901))

(declare-fun m!552903 () Bool)

(assert (=> b!573998 m!552903))

(assert (=> b!573998 m!552525))

(assert (=> b!573998 m!552567))

(assert (=> b!574000 m!552525))

(assert (=> b!574000 m!552525))

(assert (=> b!574000 m!552537))

(declare-fun m!552905 () Bool)

(assert (=> bm!32662 m!552905))

(assert (=> b!573552 d!85053))

(declare-fun d!85055 () Bool)

(assert (=> d!85055 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262120 () Unit!18046)

(declare-fun choose!38 (array!35872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18046)

(assert (=> d!85055 (= lt!262120 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85055 (validMask!0 mask!3119)))

(assert (=> d!85055 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262120)))

(declare-fun bs!17762 () Bool)

(assert (= bs!17762 d!85055))

(assert (=> bs!17762 m!552563))

(declare-fun m!552927 () Bool)

(assert (=> bs!17762 m!552927))

(assert (=> bs!17762 m!552541))

(assert (=> b!573552 d!85055))

(push 1)

