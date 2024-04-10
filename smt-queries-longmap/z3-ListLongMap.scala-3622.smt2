; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49930 () Bool)

(assert start!49930)

(declare-fun b!547756 () Bool)

(declare-fun res!341261 () Bool)

(declare-fun e!316501 () Bool)

(assert (=> b!547756 (=> (not res!341261) (not e!316501))))

(declare-datatypes ((array!34551 0))(
  ( (array!34552 (arr!16597 (Array (_ BitVec 32) (_ BitVec 64))) (size!16961 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34551)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547756 (= res!341261 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547757 () Bool)

(declare-fun res!341257 () Bool)

(declare-fun e!316502 () Bool)

(assert (=> b!547757 (=> (not res!341257) (not e!316502))))

(declare-datatypes ((List!10677 0))(
  ( (Nil!10674) (Cons!10673 (h!11640 (_ BitVec 64)) (t!16905 List!10677)) )
))
(declare-fun arrayNoDuplicates!0 (array!34551 (_ BitVec 32) List!10677) Bool)

(assert (=> b!547757 (= res!341257 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10674))))

(declare-fun b!547758 () Bool)

(declare-fun res!341260 () Bool)

(assert (=> b!547758 (=> (not res!341260) (not e!316501))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547758 (= res!341260 (and (= (size!16961 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16961 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16961 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547760 () Bool)

(assert (=> b!547760 (= e!316501 e!316502)))

(declare-fun res!341254 () Bool)

(assert (=> b!547760 (=> (not res!341254) (not e!316502))))

(declare-datatypes ((SeekEntryResult!5046 0))(
  ( (MissingZero!5046 (index!22411 (_ BitVec 32))) (Found!5046 (index!22412 (_ BitVec 32))) (Intermediate!5046 (undefined!5858 Bool) (index!22413 (_ BitVec 32)) (x!51354 (_ BitVec 32))) (Undefined!5046) (MissingVacant!5046 (index!22414 (_ BitVec 32))) )
))
(declare-fun lt!249625 () SeekEntryResult!5046)

(assert (=> b!547760 (= res!341254 (or (= lt!249625 (MissingZero!5046 i!1132)) (= lt!249625 (MissingVacant!5046 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34551 (_ BitVec 32)) SeekEntryResult!5046)

(assert (=> b!547760 (= lt!249625 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547761 () Bool)

(declare-fun res!341258 () Bool)

(assert (=> b!547761 (=> (not res!341258) (not e!316501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547761 (= res!341258 (validKeyInArray!0 k0!1914))))

(declare-fun b!547762 () Bool)

(declare-fun res!341256 () Bool)

(assert (=> b!547762 (=> (not res!341256) (not e!316502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34551 (_ BitVec 32)) Bool)

(assert (=> b!547762 (= res!341256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547763 () Bool)

(assert (=> b!547763 (= e!316502 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsgt mask!3119 #b00111111111111111111111111111111)))))

(declare-fun res!341255 () Bool)

(assert (=> start!49930 (=> (not res!341255) (not e!316501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49930 (= res!341255 (validMask!0 mask!3119))))

(assert (=> start!49930 e!316501))

(assert (=> start!49930 true))

(declare-fun array_inv!12393 (array!34551) Bool)

(assert (=> start!49930 (array_inv!12393 a!3118)))

(declare-fun b!547759 () Bool)

(declare-fun res!341259 () Bool)

(assert (=> b!547759 (=> (not res!341259) (not e!316501))))

(assert (=> b!547759 (= res!341259 (validKeyInArray!0 (select (arr!16597 a!3118) j!142)))))

(assert (= (and start!49930 res!341255) b!547758))

(assert (= (and b!547758 res!341260) b!547759))

(assert (= (and b!547759 res!341259) b!547761))

(assert (= (and b!547761 res!341258) b!547756))

(assert (= (and b!547756 res!341261) b!547760))

(assert (= (and b!547760 res!341254) b!547762))

(assert (= (and b!547762 res!341256) b!547757))

(assert (= (and b!547757 res!341257) b!547763))

(declare-fun m!524955 () Bool)

(assert (=> start!49930 m!524955))

(declare-fun m!524957 () Bool)

(assert (=> start!49930 m!524957))

(declare-fun m!524959 () Bool)

(assert (=> b!547759 m!524959))

(assert (=> b!547759 m!524959))

(declare-fun m!524961 () Bool)

(assert (=> b!547759 m!524961))

(declare-fun m!524963 () Bool)

(assert (=> b!547762 m!524963))

(declare-fun m!524965 () Bool)

(assert (=> b!547760 m!524965))

(declare-fun m!524967 () Bool)

(assert (=> b!547756 m!524967))

(declare-fun m!524969 () Bool)

(assert (=> b!547761 m!524969))

(declare-fun m!524971 () Bool)

(assert (=> b!547757 m!524971))

(check-sat (not start!49930) (not b!547762) (not b!547757) (not b!547760) (not b!547756) (not b!547761) (not b!547759))
(check-sat)
(get-model)

(declare-fun b!547812 () Bool)

(declare-fun e!316526 () SeekEntryResult!5046)

(declare-fun lt!249642 () SeekEntryResult!5046)

(assert (=> b!547812 (= e!316526 (Found!5046 (index!22413 lt!249642)))))

(declare-fun b!547813 () Bool)

(declare-fun e!316525 () SeekEntryResult!5046)

(assert (=> b!547813 (= e!316525 e!316526)))

(declare-fun lt!249641 () (_ BitVec 64))

(assert (=> b!547813 (= lt!249641 (select (arr!16597 a!3118) (index!22413 lt!249642)))))

(declare-fun c!63592 () Bool)

(assert (=> b!547813 (= c!63592 (= lt!249641 k0!1914))))

(declare-fun b!547814 () Bool)

(declare-fun e!316527 () SeekEntryResult!5046)

(assert (=> b!547814 (= e!316527 (MissingZero!5046 (index!22413 lt!249642)))))

(declare-fun d!82555 () Bool)

(declare-fun lt!249643 () SeekEntryResult!5046)

(get-info :version)

(assert (=> d!82555 (and (or ((_ is Undefined!5046) lt!249643) (not ((_ is Found!5046) lt!249643)) (and (bvsge (index!22412 lt!249643) #b00000000000000000000000000000000) (bvslt (index!22412 lt!249643) (size!16961 a!3118)))) (or ((_ is Undefined!5046) lt!249643) ((_ is Found!5046) lt!249643) (not ((_ is MissingZero!5046) lt!249643)) (and (bvsge (index!22411 lt!249643) #b00000000000000000000000000000000) (bvslt (index!22411 lt!249643) (size!16961 a!3118)))) (or ((_ is Undefined!5046) lt!249643) ((_ is Found!5046) lt!249643) ((_ is MissingZero!5046) lt!249643) (not ((_ is MissingVacant!5046) lt!249643)) (and (bvsge (index!22414 lt!249643) #b00000000000000000000000000000000) (bvslt (index!22414 lt!249643) (size!16961 a!3118)))) (or ((_ is Undefined!5046) lt!249643) (ite ((_ is Found!5046) lt!249643) (= (select (arr!16597 a!3118) (index!22412 lt!249643)) k0!1914) (ite ((_ is MissingZero!5046) lt!249643) (= (select (arr!16597 a!3118) (index!22411 lt!249643)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5046) lt!249643) (= (select (arr!16597 a!3118) (index!22414 lt!249643)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82555 (= lt!249643 e!316525)))

(declare-fun c!63591 () Bool)

(assert (=> d!82555 (= c!63591 (and ((_ is Intermediate!5046) lt!249642) (undefined!5858 lt!249642)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34551 (_ BitVec 32)) SeekEntryResult!5046)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82555 (= lt!249642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82555 (validMask!0 mask!3119)))

(assert (=> d!82555 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!249643)))

(declare-fun b!547815 () Bool)

(assert (=> b!547815 (= e!316525 Undefined!5046)))

(declare-fun b!547816 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34551 (_ BitVec 32)) SeekEntryResult!5046)

(assert (=> b!547816 (= e!316527 (seekKeyOrZeroReturnVacant!0 (x!51354 lt!249642) (index!22413 lt!249642) (index!22413 lt!249642) k0!1914 a!3118 mask!3119))))

(declare-fun b!547817 () Bool)

(declare-fun c!63593 () Bool)

(assert (=> b!547817 (= c!63593 (= lt!249641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!547817 (= e!316526 e!316527)))

(assert (= (and d!82555 c!63591) b!547815))

(assert (= (and d!82555 (not c!63591)) b!547813))

(assert (= (and b!547813 c!63592) b!547812))

(assert (= (and b!547813 (not c!63592)) b!547817))

(assert (= (and b!547817 c!63593) b!547814))

(assert (= (and b!547817 (not c!63593)) b!547816))

(declare-fun m!524991 () Bool)

(assert (=> b!547813 m!524991))

(declare-fun m!524993 () Bool)

(assert (=> d!82555 m!524993))

(assert (=> d!82555 m!524955))

(declare-fun m!524995 () Bool)

(assert (=> d!82555 m!524995))

(declare-fun m!524997 () Bool)

(assert (=> d!82555 m!524997))

(declare-fun m!524999 () Bool)

(assert (=> d!82555 m!524999))

(declare-fun m!525001 () Bool)

(assert (=> d!82555 m!525001))

(assert (=> d!82555 m!524997))

(declare-fun m!525005 () Bool)

(assert (=> b!547816 m!525005))

(assert (=> b!547760 d!82555))

(declare-fun d!82561 () Bool)

(assert (=> d!82561 (= (validKeyInArray!0 (select (arr!16597 a!3118) j!142)) (and (not (= (select (arr!16597 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16597 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547759 d!82561))

(declare-fun b!547861 () Bool)

(declare-fun e!316560 () Bool)

(declare-fun e!316557 () Bool)

(assert (=> b!547861 (= e!316560 e!316557)))

(declare-fun res!341302 () Bool)

(assert (=> b!547861 (=> (not res!341302) (not e!316557))))

(declare-fun e!316558 () Bool)

(assert (=> b!547861 (= res!341302 (not e!316558))))

(declare-fun res!341303 () Bool)

(assert (=> b!547861 (=> (not res!341303) (not e!316558))))

(assert (=> b!547861 (= res!341303 (validKeyInArray!0 (select (arr!16597 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547862 () Bool)

(declare-fun contains!2823 (List!10677 (_ BitVec 64)) Bool)

(assert (=> b!547862 (= e!316558 (contains!2823 Nil!10674 (select (arr!16597 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547863 () Bool)

(declare-fun e!316559 () Bool)

(declare-fun call!32180 () Bool)

(assert (=> b!547863 (= e!316559 call!32180)))

(declare-fun b!547864 () Bool)

(assert (=> b!547864 (= e!316557 e!316559)))

(declare-fun c!63608 () Bool)

(assert (=> b!547864 (= c!63608 (validKeyInArray!0 (select (arr!16597 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32177 () Bool)

(assert (=> bm!32177 (= call!32180 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63608 (Cons!10673 (select (arr!16597 a!3118) #b00000000000000000000000000000000) Nil!10674) Nil!10674)))))

(declare-fun b!547865 () Bool)

(assert (=> b!547865 (= e!316559 call!32180)))

(declare-fun d!82567 () Bool)

(declare-fun res!341301 () Bool)

(assert (=> d!82567 (=> res!341301 e!316560)))

(assert (=> d!82567 (= res!341301 (bvsge #b00000000000000000000000000000000 (size!16961 a!3118)))))

(assert (=> d!82567 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10674) e!316560)))

(assert (= (and d!82567 (not res!341301)) b!547861))

(assert (= (and b!547861 res!341303) b!547862))

(assert (= (and b!547861 res!341302) b!547864))

(assert (= (and b!547864 c!63608) b!547863))

(assert (= (and b!547864 (not c!63608)) b!547865))

(assert (= (or b!547863 b!547865) bm!32177))

(declare-fun m!525027 () Bool)

(assert (=> b!547861 m!525027))

(assert (=> b!547861 m!525027))

(declare-fun m!525029 () Bool)

(assert (=> b!547861 m!525029))

(assert (=> b!547862 m!525027))

(assert (=> b!547862 m!525027))

(declare-fun m!525031 () Bool)

(assert (=> b!547862 m!525031))

(assert (=> b!547864 m!525027))

(assert (=> b!547864 m!525027))

(assert (=> b!547864 m!525029))

(assert (=> bm!32177 m!525027))

(declare-fun m!525033 () Bool)

(assert (=> bm!32177 m!525033))

(assert (=> b!547757 d!82567))

(declare-fun d!82571 () Bool)

(assert (=> d!82571 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547761 d!82571))

(declare-fun d!82573 () Bool)

(declare-fun res!341312 () Bool)

(declare-fun e!316574 () Bool)

(assert (=> d!82573 (=> res!341312 e!316574)))

(assert (=> d!82573 (= res!341312 (= (select (arr!16597 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82573 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!316574)))

(declare-fun b!547884 () Bool)

(declare-fun e!316575 () Bool)

(assert (=> b!547884 (= e!316574 e!316575)))

(declare-fun res!341313 () Bool)

(assert (=> b!547884 (=> (not res!341313) (not e!316575))))

(assert (=> b!547884 (= res!341313 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16961 a!3118)))))

(declare-fun b!547885 () Bool)

(assert (=> b!547885 (= e!316575 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82573 (not res!341312)) b!547884))

(assert (= (and b!547884 res!341313) b!547885))

(assert (=> d!82573 m!525027))

(declare-fun m!525049 () Bool)

(assert (=> b!547885 m!525049))

(assert (=> b!547756 d!82573))

(declare-fun d!82577 () Bool)

(assert (=> d!82577 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49930 d!82577))

(declare-fun d!82591 () Bool)

(assert (=> d!82591 (= (array_inv!12393 a!3118) (bvsge (size!16961 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49930 d!82591))

(declare-fun b!547918 () Bool)

(declare-fun e!316603 () Bool)

(declare-fun e!316605 () Bool)

(assert (=> b!547918 (= e!316603 e!316605)))

(declare-fun c!63619 () Bool)

(assert (=> b!547918 (= c!63619 (validKeyInArray!0 (select (arr!16597 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547919 () Bool)

(declare-fun e!316604 () Bool)

(assert (=> b!547919 (= e!316605 e!316604)))

(declare-fun lt!249678 () (_ BitVec 64))

(assert (=> b!547919 (= lt!249678 (select (arr!16597 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16964 0))(
  ( (Unit!16965) )
))
(declare-fun lt!249679 () Unit!16964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34551 (_ BitVec 64) (_ BitVec 32)) Unit!16964)

(assert (=> b!547919 (= lt!249679 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249678 #b00000000000000000000000000000000))))

(assert (=> b!547919 (arrayContainsKey!0 a!3118 lt!249678 #b00000000000000000000000000000000)))

(declare-fun lt!249677 () Unit!16964)

(assert (=> b!547919 (= lt!249677 lt!249679)))

(declare-fun res!341336 () Bool)

