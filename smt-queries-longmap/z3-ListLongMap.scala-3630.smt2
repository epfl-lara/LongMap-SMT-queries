; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50068 () Bool)

(assert start!50068)

(declare-fun b!548638 () Bool)

(declare-fun res!341963 () Bool)

(declare-fun e!316933 () Bool)

(assert (=> b!548638 (=> (not res!341963) (not e!316933))))

(declare-datatypes ((array!34605 0))(
  ( (array!34606 (arr!16621 (Array (_ BitVec 32) (_ BitVec 64))) (size!16985 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34605)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548638 (= res!341963 (validKeyInArray!0 (select (arr!16621 a!3118) j!142)))))

(declare-fun b!548639 () Bool)

(declare-fun e!316935 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!548639 (= e!316935 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsgt mask!3119 #b00111111111111111111111111111111)))))

(declare-fun b!548640 () Bool)

(assert (=> b!548640 (= e!316933 e!316935)))

(declare-fun res!341965 () Bool)

(assert (=> b!548640 (=> (not res!341965) (not e!316935))))

(declare-datatypes ((SeekEntryResult!5070 0))(
  ( (MissingZero!5070 (index!22507 (_ BitVec 32))) (Found!5070 (index!22508 (_ BitVec 32))) (Intermediate!5070 (undefined!5882 Bool) (index!22509 (_ BitVec 32)) (x!51445 (_ BitVec 32))) (Undefined!5070) (MissingVacant!5070 (index!22510 (_ BitVec 32))) )
))
(declare-fun lt!249877 () SeekEntryResult!5070)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548640 (= res!341965 (or (= lt!249877 (MissingZero!5070 i!1132)) (= lt!249877 (MissingVacant!5070 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34605 (_ BitVec 32)) SeekEntryResult!5070)

(assert (=> b!548640 (= lt!249877 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!341964 () Bool)

(assert (=> start!50068 (=> (not res!341964) (not e!316933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50068 (= res!341964 (validMask!0 mask!3119))))

(assert (=> start!50068 e!316933))

(assert (=> start!50068 true))

(declare-fun array_inv!12417 (array!34605) Bool)

(assert (=> start!50068 (array_inv!12417 a!3118)))

(declare-fun b!548641 () Bool)

(declare-fun res!341959 () Bool)

(assert (=> b!548641 (=> (not res!341959) (not e!316935))))

(declare-datatypes ((List!10701 0))(
  ( (Nil!10698) (Cons!10697 (h!11667 (_ BitVec 64)) (t!16929 List!10701)) )
))
(declare-fun arrayNoDuplicates!0 (array!34605 (_ BitVec 32) List!10701) Bool)

(assert (=> b!548641 (= res!341959 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10698))))

(declare-fun b!548642 () Bool)

(declare-fun res!341966 () Bool)

(assert (=> b!548642 (=> (not res!341966) (not e!316933))))

(declare-fun arrayContainsKey!0 (array!34605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548642 (= res!341966 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548643 () Bool)

(declare-fun res!341960 () Bool)

(assert (=> b!548643 (=> (not res!341960) (not e!316933))))

(assert (=> b!548643 (= res!341960 (validKeyInArray!0 k0!1914))))

(declare-fun b!548644 () Bool)

(declare-fun res!341962 () Bool)

(assert (=> b!548644 (=> (not res!341962) (not e!316933))))

(assert (=> b!548644 (= res!341962 (and (= (size!16985 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16985 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16985 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548645 () Bool)

(declare-fun res!341961 () Bool)

(assert (=> b!548645 (=> (not res!341961) (not e!316935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34605 (_ BitVec 32)) Bool)

(assert (=> b!548645 (= res!341961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50068 res!341964) b!548644))

(assert (= (and b!548644 res!341962) b!548638))

(assert (= (and b!548638 res!341963) b!548643))

(assert (= (and b!548643 res!341960) b!548642))

(assert (= (and b!548642 res!341966) b!548640))

(assert (= (and b!548640 res!341965) b!548645))

(assert (= (and b!548645 res!341961) b!548641))

(assert (= (and b!548641 res!341959) b!548639))

(declare-fun m!525615 () Bool)

(assert (=> b!548641 m!525615))

(declare-fun m!525617 () Bool)

(assert (=> b!548642 m!525617))

(declare-fun m!525619 () Bool)

(assert (=> b!548638 m!525619))

(assert (=> b!548638 m!525619))

(declare-fun m!525621 () Bool)

(assert (=> b!548638 m!525621))

(declare-fun m!525623 () Bool)

(assert (=> b!548645 m!525623))

(declare-fun m!525625 () Bool)

(assert (=> b!548640 m!525625))

(declare-fun m!525627 () Bool)

(assert (=> b!548643 m!525627))

(declare-fun m!525629 () Bool)

(assert (=> start!50068 m!525629))

(declare-fun m!525631 () Bool)

(assert (=> start!50068 m!525631))

(check-sat (not b!548645) (not b!548642) (not b!548638) (not b!548641) (not b!548640) (not b!548643) (not start!50068))
(check-sat)
(get-model)

(declare-fun d!82673 () Bool)

(declare-fun lt!249898 () SeekEntryResult!5070)

(get-info :version)

(assert (=> d!82673 (and (or ((_ is Undefined!5070) lt!249898) (not ((_ is Found!5070) lt!249898)) (and (bvsge (index!22508 lt!249898) #b00000000000000000000000000000000) (bvslt (index!22508 lt!249898) (size!16985 a!3118)))) (or ((_ is Undefined!5070) lt!249898) ((_ is Found!5070) lt!249898) (not ((_ is MissingZero!5070) lt!249898)) (and (bvsge (index!22507 lt!249898) #b00000000000000000000000000000000) (bvslt (index!22507 lt!249898) (size!16985 a!3118)))) (or ((_ is Undefined!5070) lt!249898) ((_ is Found!5070) lt!249898) ((_ is MissingZero!5070) lt!249898) (not ((_ is MissingVacant!5070) lt!249898)) (and (bvsge (index!22510 lt!249898) #b00000000000000000000000000000000) (bvslt (index!22510 lt!249898) (size!16985 a!3118)))) (or ((_ is Undefined!5070) lt!249898) (ite ((_ is Found!5070) lt!249898) (= (select (arr!16621 a!3118) (index!22508 lt!249898)) k0!1914) (ite ((_ is MissingZero!5070) lt!249898) (= (select (arr!16621 a!3118) (index!22507 lt!249898)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5070) lt!249898) (= (select (arr!16621 a!3118) (index!22510 lt!249898)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!316961 () SeekEntryResult!5070)

(assert (=> d!82673 (= lt!249898 e!316961)))

(declare-fun c!63679 () Bool)

(declare-fun lt!249896 () SeekEntryResult!5070)

(assert (=> d!82673 (= c!63679 (and ((_ is Intermediate!5070) lt!249896) (undefined!5882 lt!249896)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34605 (_ BitVec 32)) SeekEntryResult!5070)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82673 (= lt!249896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82673 (validMask!0 mask!3119)))

(assert (=> d!82673 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!249898)))

(declare-fun b!548694 () Bool)

(assert (=> b!548694 (= e!316961 Undefined!5070)))

(declare-fun b!548695 () Bool)

(declare-fun e!316962 () SeekEntryResult!5070)

(assert (=> b!548695 (= e!316962 (Found!5070 (index!22509 lt!249896)))))

(declare-fun b!548696 () Bool)

(assert (=> b!548696 (= e!316961 e!316962)))

(declare-fun lt!249897 () (_ BitVec 64))

(assert (=> b!548696 (= lt!249897 (select (arr!16621 a!3118) (index!22509 lt!249896)))))

(declare-fun c!63678 () Bool)

(assert (=> b!548696 (= c!63678 (= lt!249897 k0!1914))))

(declare-fun b!548697 () Bool)

(declare-fun e!316960 () SeekEntryResult!5070)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34605 (_ BitVec 32)) SeekEntryResult!5070)

(assert (=> b!548697 (= e!316960 (seekKeyOrZeroReturnVacant!0 (x!51445 lt!249896) (index!22509 lt!249896) (index!22509 lt!249896) k0!1914 a!3118 mask!3119))))

(declare-fun b!548698 () Bool)

(declare-fun c!63680 () Bool)

(assert (=> b!548698 (= c!63680 (= lt!249897 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!548698 (= e!316962 e!316960)))

(declare-fun b!548699 () Bool)

(assert (=> b!548699 (= e!316960 (MissingZero!5070 (index!22509 lt!249896)))))

(assert (= (and d!82673 c!63679) b!548694))

(assert (= (and d!82673 (not c!63679)) b!548696))

(assert (= (and b!548696 c!63678) b!548695))

(assert (= (and b!548696 (not c!63678)) b!548698))

(assert (= (and b!548698 c!63680) b!548699))

(assert (= (and b!548698 (not c!63680)) b!548697))

(declare-fun m!525663 () Bool)

(assert (=> d!82673 m!525663))

(declare-fun m!525665 () Bool)

(assert (=> d!82673 m!525665))

(assert (=> d!82673 m!525665))

(declare-fun m!525667 () Bool)

(assert (=> d!82673 m!525667))

(assert (=> d!82673 m!525629))

(declare-fun m!525669 () Bool)

(assert (=> d!82673 m!525669))

(declare-fun m!525671 () Bool)

(assert (=> d!82673 m!525671))

(declare-fun m!525673 () Bool)

(assert (=> b!548696 m!525673))

(declare-fun m!525675 () Bool)

(assert (=> b!548697 m!525675))

(assert (=> b!548640 d!82673))

(declare-fun b!548726 () Bool)

(declare-fun e!316979 () Bool)

(declare-fun e!316978 () Bool)

(assert (=> b!548726 (= e!316979 e!316978)))

(declare-fun c!63692 () Bool)

(assert (=> b!548726 (= c!63692 (validKeyInArray!0 (select (arr!16621 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548727 () Bool)

(declare-fun e!316980 () Bool)

(declare-fun call!32216 () Bool)

(assert (=> b!548727 (= e!316980 call!32216)))

(declare-fun d!82683 () Bool)

(declare-fun res!342001 () Bool)

(assert (=> d!82683 (=> res!342001 e!316979)))

(assert (=> d!82683 (= res!342001 (bvsge #b00000000000000000000000000000000 (size!16985 a!3118)))))

(assert (=> d!82683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316979)))

(declare-fun b!548728 () Bool)

(assert (=> b!548728 (= e!316978 e!316980)))

(declare-fun lt!249915 () (_ BitVec 64))

(assert (=> b!548728 (= lt!249915 (select (arr!16621 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16972 0))(
  ( (Unit!16973) )
))
(declare-fun lt!249914 () Unit!16972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34605 (_ BitVec 64) (_ BitVec 32)) Unit!16972)

(assert (=> b!548728 (= lt!249914 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249915 #b00000000000000000000000000000000))))

(assert (=> b!548728 (arrayContainsKey!0 a!3118 lt!249915 #b00000000000000000000000000000000)))

(declare-fun lt!249916 () Unit!16972)

(assert (=> b!548728 (= lt!249916 lt!249914)))

(declare-fun res!342002 () Bool)

(assert (=> b!548728 (= res!342002 (= (seekEntryOrOpen!0 (select (arr!16621 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5070 #b00000000000000000000000000000000)))))

(assert (=> b!548728 (=> (not res!342002) (not e!316980))))

(declare-fun b!548729 () Bool)

(assert (=> b!548729 (= e!316978 call!32216)))

(declare-fun bm!32213 () Bool)

(assert (=> bm!32213 (= call!32216 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!82683 (not res!342001)) b!548726))

(assert (= (and b!548726 c!63692) b!548728))

(assert (= (and b!548726 (not c!63692)) b!548729))

(assert (= (and b!548728 res!342002) b!548727))

(assert (= (or b!548727 b!548729) bm!32213))

(declare-fun m!525691 () Bool)

(assert (=> b!548726 m!525691))

(assert (=> b!548726 m!525691))

(declare-fun m!525693 () Bool)

(assert (=> b!548726 m!525693))

(assert (=> b!548728 m!525691))

(declare-fun m!525695 () Bool)

(assert (=> b!548728 m!525695))

(declare-fun m!525697 () Bool)

(assert (=> b!548728 m!525697))

(assert (=> b!548728 m!525691))

(declare-fun m!525699 () Bool)

(assert (=> b!548728 m!525699))

(declare-fun m!525701 () Bool)

(assert (=> bm!32213 m!525701))

(assert (=> b!548645 d!82683))

(declare-fun d!82691 () Bool)

(assert (=> d!82691 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50068 d!82691))

(declare-fun d!82703 () Bool)

(assert (=> d!82703 (= (array_inv!12417 a!3118) (bvsge (size!16985 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50068 d!82703))

(declare-fun d!82705 () Bool)

(assert (=> d!82705 (= (validKeyInArray!0 (select (arr!16621 a!3118) j!142)) (and (not (= (select (arr!16621 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16621 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548638 d!82705))

(declare-fun d!82707 () Bool)

(assert (=> d!82707 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548643 d!82707))

(declare-fun d!82709 () Bool)

(declare-fun res!342028 () Bool)

(declare-fun e!317009 () Bool)

(assert (=> d!82709 (=> res!342028 e!317009)))

(assert (=> d!82709 (= res!342028 (= (select (arr!16621 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82709 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!317009)))

(declare-fun b!548761 () Bool)

(declare-fun e!317010 () Bool)

(assert (=> b!548761 (= e!317009 e!317010)))

(declare-fun res!342029 () Bool)

(assert (=> b!548761 (=> (not res!342029) (not e!317010))))

(assert (=> b!548761 (= res!342029 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16985 a!3118)))))

(declare-fun b!548762 () Bool)

(assert (=> b!548762 (= e!317010 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82709 (not res!342028)) b!548761))

(assert (= (and b!548761 res!342029) b!548762))

(assert (=> d!82709 m!525691))

(declare-fun m!525713 () Bool)

(assert (=> b!548762 m!525713))

(assert (=> b!548642 d!82709))

(declare-fun d!82715 () Bool)

(declare-fun res!342045 () Bool)

(declare-fun e!317034 () Bool)

(assert (=> d!82715 (=> res!342045 e!317034)))

(assert (=> d!82715 (= res!342045 (bvsge #b00000000000000000000000000000000 (size!16985 a!3118)))))

(assert (=> d!82715 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10698) e!317034)))

(declare-fun b!548788 () Bool)

(declare-fun e!317032 () Bool)

(assert (=> b!548788 (= e!317034 e!317032)))

(declare-fun res!342047 () Bool)

(assert (=> b!548788 (=> (not res!342047) (not e!317032))))

(declare-fun e!317031 () Bool)

(assert (=> b!548788 (= res!342047 (not e!317031))))

(declare-fun res!342046 () Bool)

(assert (=> b!548788 (=> (not res!342046) (not e!317031))))

(assert (=> b!548788 (= res!342046 (validKeyInArray!0 (select (arr!16621 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32222 () Bool)

(declare-fun call!32225 () Bool)

(declare-fun c!63701 () Bool)

(assert (=> bm!32222 (= call!32225 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63701 (Cons!10697 (select (arr!16621 a!3118) #b00000000000000000000000000000000) Nil!10698) Nil!10698)))))

(declare-fun b!548789 () Bool)

(declare-fun e!317033 () Bool)

(assert (=> b!548789 (= e!317032 e!317033)))

(assert (=> b!548789 (= c!63701 (validKeyInArray!0 (select (arr!16621 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548790 () Bool)

(declare-fun contains!2827 (List!10701 (_ BitVec 64)) Bool)

(assert (=> b!548790 (= e!317031 (contains!2827 Nil!10698 (select (arr!16621 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548791 () Bool)

(assert (=> b!548791 (= e!317033 call!32225)))

(declare-fun b!548792 () Bool)

(assert (=> b!548792 (= e!317033 call!32225)))

(assert (= (and d!82715 (not res!342045)) b!548788))

(assert (= (and b!548788 res!342046) b!548790))

(assert (= (and b!548788 res!342047) b!548789))

(assert (= (and b!548789 c!63701) b!548791))

(assert (= (and b!548789 (not c!63701)) b!548792))

(assert (= (or b!548791 b!548792) bm!32222))

(assert (=> b!548788 m!525691))

(assert (=> b!548788 m!525691))

(assert (=> b!548788 m!525693))

(assert (=> bm!32222 m!525691))

(declare-fun m!525721 () Bool)

(assert (=> bm!32222 m!525721))

(assert (=> b!548789 m!525691))

(assert (=> b!548789 m!525691))

(assert (=> b!548789 m!525693))

(assert (=> b!548790 m!525691))

(assert (=> b!548790 m!525691))

(declare-fun m!525723 () Bool)

(assert (=> b!548790 m!525723))

(assert (=> b!548641 d!82715))

(check-sat (not d!82673) (not b!548726) (not b!548789) (not b!548728) (not b!548788) (not b!548790) (not b!548697) (not bm!32213) (not bm!32222) (not b!548762))
(check-sat)
