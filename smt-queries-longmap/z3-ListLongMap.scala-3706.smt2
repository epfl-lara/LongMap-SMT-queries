; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50854 () Bool)

(assert start!50854)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5298 0))(
  ( (MissingZero!5298 (index!23419 (_ BitVec 32))) (Found!5298 (index!23420 (_ BitVec 32))) (Intermediate!5298 (undefined!6110 Bool) (index!23421 (_ BitVec 32)) (x!52308 (_ BitVec 32))) (Undefined!5298) (MissingVacant!5298 (index!23422 (_ BitVec 32))) )
))
(declare-fun lt!252933 () SeekEntryResult!5298)

(declare-fun e!320642 () Bool)

(declare-datatypes ((array!35079 0))(
  ( (array!35080 (arr!16849 (Array (_ BitVec 32) (_ BitVec 64))) (size!17213 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35079)

(declare-fun b!556590 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(get-info :version)

(assert (=> b!556590 (= e!320642 (not (or (not ((_ is Intermediate!5298) lt!252933)) (undefined!6110 lt!252933) (= (select (arr!16849 a!3118) (index!23421 lt!252933)) (select (arr!16849 a!3118) j!142)) (= (select (arr!16849 a!3118) (index!23421 lt!252933)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge (index!23421 lt!252933) #b00000000000000000000000000000000) (bvslt (index!23421 lt!252933) (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(declare-fun e!320639 () Bool)

(assert (=> b!556590 e!320639))

(declare-fun res!349009 () Bool)

(assert (=> b!556590 (=> (not res!349009) (not e!320639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35079 (_ BitVec 32)) Bool)

(assert (=> b!556590 (= res!349009 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17370 0))(
  ( (Unit!17371) )
))
(declare-fun lt!252935 () Unit!17370)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17370)

(assert (=> b!556590 (= lt!252935 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556591 () Bool)

(declare-fun e!320643 () Bool)

(assert (=> b!556591 (= e!320643 e!320642)))

(declare-fun res!349005 () Bool)

(assert (=> b!556591 (=> (not res!349005) (not e!320642))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!252936 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35079 (_ BitVec 32)) SeekEntryResult!5298)

(assert (=> b!556591 (= res!349005 (= lt!252933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252936 (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142) (array!35080 (store (arr!16849 a!3118) i!1132 k0!1914) (size!17213 a!3118)) mask!3119)))))

(declare-fun lt!252934 () (_ BitVec 32))

(assert (=> b!556591 (= lt!252933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252934 (select (arr!16849 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556591 (= lt!252936 (toIndex!0 (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!556591 (= lt!252934 (toIndex!0 (select (arr!16849 a!3118) j!142) mask!3119))))

(declare-fun b!556592 () Bool)

(declare-fun res!349010 () Bool)

(declare-fun e!320641 () Bool)

(assert (=> b!556592 (=> (not res!349010) (not e!320641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556592 (= res!349010 (validKeyInArray!0 k0!1914))))

(declare-fun b!556593 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35079 (_ BitVec 32)) SeekEntryResult!5298)

(assert (=> b!556593 (= e!320639 (= (seekEntryOrOpen!0 (select (arr!16849 a!3118) j!142) a!3118 mask!3119) (Found!5298 j!142)))))

(declare-fun b!556594 () Bool)

(declare-fun res!349002 () Bool)

(assert (=> b!556594 (=> (not res!349002) (not e!320641))))

(assert (=> b!556594 (= res!349002 (and (= (size!17213 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17213 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17213 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556589 () Bool)

(declare-fun res!349003 () Bool)

(assert (=> b!556589 (=> (not res!349003) (not e!320641))))

(assert (=> b!556589 (= res!349003 (validKeyInArray!0 (select (arr!16849 a!3118) j!142)))))

(declare-fun res!349007 () Bool)

(assert (=> start!50854 (=> (not res!349007) (not e!320641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50854 (= res!349007 (validMask!0 mask!3119))))

(assert (=> start!50854 e!320641))

(assert (=> start!50854 true))

(declare-fun array_inv!12645 (array!35079) Bool)

(assert (=> start!50854 (array_inv!12645 a!3118)))

(declare-fun b!556595 () Bool)

(declare-fun res!349006 () Bool)

(assert (=> b!556595 (=> (not res!349006) (not e!320643))))

(assert (=> b!556595 (= res!349006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556596 () Bool)

(declare-fun res!349008 () Bool)

(assert (=> b!556596 (=> (not res!349008) (not e!320643))))

(declare-datatypes ((List!10929 0))(
  ( (Nil!10926) (Cons!10925 (h!11910 (_ BitVec 64)) (t!17157 List!10929)) )
))
(declare-fun arrayNoDuplicates!0 (array!35079 (_ BitVec 32) List!10929) Bool)

(assert (=> b!556596 (= res!349008 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10926))))

(declare-fun b!556597 () Bool)

(assert (=> b!556597 (= e!320641 e!320643)))

(declare-fun res!349001 () Bool)

(assert (=> b!556597 (=> (not res!349001) (not e!320643))))

(declare-fun lt!252937 () SeekEntryResult!5298)

(assert (=> b!556597 (= res!349001 (or (= lt!252937 (MissingZero!5298 i!1132)) (= lt!252937 (MissingVacant!5298 i!1132))))))

(assert (=> b!556597 (= lt!252937 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556598 () Bool)

(declare-fun res!349004 () Bool)

(assert (=> b!556598 (=> (not res!349004) (not e!320641))))

(declare-fun arrayContainsKey!0 (array!35079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556598 (= res!349004 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50854 res!349007) b!556594))

(assert (= (and b!556594 res!349002) b!556589))

(assert (= (and b!556589 res!349003) b!556592))

(assert (= (and b!556592 res!349010) b!556598))

(assert (= (and b!556598 res!349004) b!556597))

(assert (= (and b!556597 res!349001) b!556595))

(assert (= (and b!556595 res!349006) b!556596))

(assert (= (and b!556596 res!349008) b!556591))

(assert (= (and b!556591 res!349005) b!556590))

(assert (= (and b!556590 res!349009) b!556593))

(declare-fun m!534617 () Bool)

(assert (=> b!556591 m!534617))

(declare-fun m!534619 () Bool)

(assert (=> b!556591 m!534619))

(assert (=> b!556591 m!534617))

(declare-fun m!534621 () Bool)

(assert (=> b!556591 m!534621))

(assert (=> b!556591 m!534617))

(declare-fun m!534623 () Bool)

(assert (=> b!556591 m!534623))

(declare-fun m!534625 () Bool)

(assert (=> b!556591 m!534625))

(declare-fun m!534627 () Bool)

(assert (=> b!556591 m!534627))

(assert (=> b!556591 m!534625))

(assert (=> b!556591 m!534625))

(declare-fun m!534629 () Bool)

(assert (=> b!556591 m!534629))

(declare-fun m!534631 () Bool)

(assert (=> start!50854 m!534631))

(declare-fun m!534633 () Bool)

(assert (=> start!50854 m!534633))

(assert (=> b!556589 m!534617))

(assert (=> b!556589 m!534617))

(declare-fun m!534635 () Bool)

(assert (=> b!556589 m!534635))

(declare-fun m!534637 () Bool)

(assert (=> b!556590 m!534637))

(assert (=> b!556590 m!534617))

(declare-fun m!534639 () Bool)

(assert (=> b!556590 m!534639))

(declare-fun m!534641 () Bool)

(assert (=> b!556590 m!534641))

(declare-fun m!534643 () Bool)

(assert (=> b!556597 m!534643))

(assert (=> b!556593 m!534617))

(assert (=> b!556593 m!534617))

(declare-fun m!534645 () Bool)

(assert (=> b!556593 m!534645))

(declare-fun m!534647 () Bool)

(assert (=> b!556596 m!534647))

(declare-fun m!534649 () Bool)

(assert (=> b!556598 m!534649))

(declare-fun m!534651 () Bool)

(assert (=> b!556592 m!534651))

(declare-fun m!534653 () Bool)

(assert (=> b!556595 m!534653))

(check-sat (not b!556591) (not b!556595) (not start!50854) (not b!556598) (not b!556592) (not b!556593) (not b!556590) (not b!556597) (not b!556589) (not b!556596))
(check-sat)
(get-model)

(declare-fun b!556637 () Bool)

(declare-fun e!320667 () Bool)

(declare-fun e!320665 () Bool)

(assert (=> b!556637 (= e!320667 e!320665)))

(declare-fun c!64133 () Bool)

(assert (=> b!556637 (= c!64133 (validKeyInArray!0 (select (arr!16849 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32330 () Bool)

(declare-fun call!32333 () Bool)

(assert (=> bm!32330 (= call!32333 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!556638 () Bool)

(declare-fun e!320666 () Bool)

(assert (=> b!556638 (= e!320665 e!320666)))

(declare-fun lt!252961 () (_ BitVec 64))

(assert (=> b!556638 (= lt!252961 (select (arr!16849 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!252960 () Unit!17370)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35079 (_ BitVec 64) (_ BitVec 32)) Unit!17370)

(assert (=> b!556638 (= lt!252960 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!252961 #b00000000000000000000000000000000))))

(assert (=> b!556638 (arrayContainsKey!0 a!3118 lt!252961 #b00000000000000000000000000000000)))

(declare-fun lt!252959 () Unit!17370)

(assert (=> b!556638 (= lt!252959 lt!252960)))

(declare-fun res!349045 () Bool)

(assert (=> b!556638 (= res!349045 (= (seekEntryOrOpen!0 (select (arr!16849 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5298 #b00000000000000000000000000000000)))))

(assert (=> b!556638 (=> (not res!349045) (not e!320666))))

(declare-fun b!556639 () Bool)

(assert (=> b!556639 (= e!320665 call!32333)))

(declare-fun d!83287 () Bool)

(declare-fun res!349046 () Bool)

(assert (=> d!83287 (=> res!349046 e!320667)))

(assert (=> d!83287 (= res!349046 (bvsge #b00000000000000000000000000000000 (size!17213 a!3118)))))

(assert (=> d!83287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!320667)))

(declare-fun b!556640 () Bool)

(assert (=> b!556640 (= e!320666 call!32333)))

(assert (= (and d!83287 (not res!349046)) b!556637))

(assert (= (and b!556637 c!64133) b!556638))

(assert (= (and b!556637 (not c!64133)) b!556639))

(assert (= (and b!556638 res!349045) b!556640))

(assert (= (or b!556640 b!556639) bm!32330))

(declare-fun m!534693 () Bool)

(assert (=> b!556637 m!534693))

(assert (=> b!556637 m!534693))

(declare-fun m!534695 () Bool)

(assert (=> b!556637 m!534695))

(declare-fun m!534697 () Bool)

(assert (=> bm!32330 m!534697))

(assert (=> b!556638 m!534693))

(declare-fun m!534699 () Bool)

(assert (=> b!556638 m!534699))

(declare-fun m!534701 () Bool)

(assert (=> b!556638 m!534701))

(assert (=> b!556638 m!534693))

(declare-fun m!534703 () Bool)

(assert (=> b!556638 m!534703))

(assert (=> b!556595 d!83287))

(declare-fun b!556641 () Bool)

(declare-fun e!320670 () Bool)

(declare-fun e!320668 () Bool)

(assert (=> b!556641 (= e!320670 e!320668)))

(declare-fun c!64134 () Bool)

(assert (=> b!556641 (= c!64134 (validKeyInArray!0 (select (arr!16849 a!3118) j!142)))))

(declare-fun call!32334 () Bool)

(declare-fun bm!32331 () Bool)

(assert (=> bm!32331 (= call!32334 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!556642 () Bool)

(declare-fun e!320669 () Bool)

(assert (=> b!556642 (= e!320668 e!320669)))

(declare-fun lt!252964 () (_ BitVec 64))

(assert (=> b!556642 (= lt!252964 (select (arr!16849 a!3118) j!142))))

(declare-fun lt!252963 () Unit!17370)

(assert (=> b!556642 (= lt!252963 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!252964 j!142))))

(assert (=> b!556642 (arrayContainsKey!0 a!3118 lt!252964 #b00000000000000000000000000000000)))

(declare-fun lt!252962 () Unit!17370)

(assert (=> b!556642 (= lt!252962 lt!252963)))

(declare-fun res!349047 () Bool)

(assert (=> b!556642 (= res!349047 (= (seekEntryOrOpen!0 (select (arr!16849 a!3118) j!142) a!3118 mask!3119) (Found!5298 j!142)))))

(assert (=> b!556642 (=> (not res!349047) (not e!320669))))

(declare-fun b!556643 () Bool)

(assert (=> b!556643 (= e!320668 call!32334)))

(declare-fun d!83289 () Bool)

(declare-fun res!349048 () Bool)

(assert (=> d!83289 (=> res!349048 e!320670)))

(assert (=> d!83289 (= res!349048 (bvsge j!142 (size!17213 a!3118)))))

(assert (=> d!83289 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!320670)))

(declare-fun b!556644 () Bool)

(assert (=> b!556644 (= e!320669 call!32334)))

(assert (= (and d!83289 (not res!349048)) b!556641))

(assert (= (and b!556641 c!64134) b!556642))

(assert (= (and b!556641 (not c!64134)) b!556643))

(assert (= (and b!556642 res!349047) b!556644))

(assert (= (or b!556644 b!556643) bm!32331))

(assert (=> b!556641 m!534617))

(assert (=> b!556641 m!534617))

(assert (=> b!556641 m!534635))

(declare-fun m!534705 () Bool)

(assert (=> bm!32331 m!534705))

(assert (=> b!556642 m!534617))

(declare-fun m!534707 () Bool)

(assert (=> b!556642 m!534707))

(declare-fun m!534709 () Bool)

(assert (=> b!556642 m!534709))

(assert (=> b!556642 m!534617))

(assert (=> b!556642 m!534645))

(assert (=> b!556590 d!83289))

(declare-fun d!83291 () Bool)

(assert (=> d!83291 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!252967 () Unit!17370)

(declare-fun choose!38 (array!35079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17370)

(assert (=> d!83291 (= lt!252967 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83291 (validMask!0 mask!3119)))

(assert (=> d!83291 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!252967)))

(declare-fun bs!17341 () Bool)

(assert (= bs!17341 d!83291))

(assert (=> bs!17341 m!534639))

(declare-fun m!534711 () Bool)

(assert (=> bs!17341 m!534711))

(assert (=> bs!17341 m!534631))

(assert (=> b!556590 d!83291))

(declare-fun b!556681 () Bool)

(declare-fun e!320693 () SeekEntryResult!5298)

(assert (=> b!556681 (= e!320693 (Intermediate!5298 true lt!252936 #b00000000000000000000000000000000))))

(declare-fun b!556682 () Bool)

(declare-fun e!320696 () SeekEntryResult!5298)

(assert (=> b!556682 (= e!320696 (Intermediate!5298 false lt!252936 #b00000000000000000000000000000000))))

(declare-fun b!556683 () Bool)

(declare-fun e!320694 () Bool)

(declare-fun e!320697 () Bool)

(assert (=> b!556683 (= e!320694 e!320697)))

(declare-fun res!349063 () Bool)

(declare-fun lt!252978 () SeekEntryResult!5298)

(assert (=> b!556683 (= res!349063 (and ((_ is Intermediate!5298) lt!252978) (not (undefined!6110 lt!252978)) (bvslt (x!52308 lt!252978) #b01111111111111111111111111111110) (bvsge (x!52308 lt!252978) #b00000000000000000000000000000000) (bvsge (x!52308 lt!252978) #b00000000000000000000000000000000)))))

(assert (=> b!556683 (=> (not res!349063) (not e!320697))))

(declare-fun d!83293 () Bool)

(assert (=> d!83293 e!320694))

(declare-fun c!64148 () Bool)

(assert (=> d!83293 (= c!64148 (and ((_ is Intermediate!5298) lt!252978) (undefined!6110 lt!252978)))))

(assert (=> d!83293 (= lt!252978 e!320693)))

(declare-fun c!64147 () Bool)

(assert (=> d!83293 (= c!64147 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!252979 () (_ BitVec 64))

(assert (=> d!83293 (= lt!252979 (select (arr!16849 (array!35080 (store (arr!16849 a!3118) i!1132 k0!1914) (size!17213 a!3118))) lt!252936))))

(assert (=> d!83293 (validMask!0 mask!3119)))

(assert (=> d!83293 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252936 (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142) (array!35080 (store (arr!16849 a!3118) i!1132 k0!1914) (size!17213 a!3118)) mask!3119) lt!252978)))

(declare-fun b!556684 () Bool)

(assert (=> b!556684 (= e!320693 e!320696)))

(declare-fun c!64149 () Bool)

(assert (=> b!556684 (= c!64149 (or (= lt!252979 (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!252979 lt!252979) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!556685 () Bool)

(assert (=> b!556685 (= e!320694 (bvsge (x!52308 lt!252978) #b01111111111111111111111111111110))))

(declare-fun b!556686 () Bool)

(assert (=> b!556686 (and (bvsge (index!23421 lt!252978) #b00000000000000000000000000000000) (bvslt (index!23421 lt!252978) (size!17213 (array!35080 (store (arr!16849 a!3118) i!1132 k0!1914) (size!17213 a!3118)))))))

(declare-fun res!349061 () Bool)

(assert (=> b!556686 (= res!349061 (= (select (arr!16849 (array!35080 (store (arr!16849 a!3118) i!1132 k0!1914) (size!17213 a!3118))) (index!23421 lt!252978)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!320695 () Bool)

(assert (=> b!556686 (=> res!349061 e!320695)))

(declare-fun b!556687 () Bool)

(assert (=> b!556687 (and (bvsge (index!23421 lt!252978) #b00000000000000000000000000000000) (bvslt (index!23421 lt!252978) (size!17213 (array!35080 (store (arr!16849 a!3118) i!1132 k0!1914) (size!17213 a!3118)))))))

(assert (=> b!556687 (= e!320695 (= (select (arr!16849 (array!35080 (store (arr!16849 a!3118) i!1132 k0!1914) (size!17213 a!3118))) (index!23421 lt!252978)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!556688 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556688 (= e!320696 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!252936 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142) (array!35080 (store (arr!16849 a!3118) i!1132 k0!1914) (size!17213 a!3118)) mask!3119))))

(declare-fun b!556689 () Bool)

(assert (=> b!556689 (and (bvsge (index!23421 lt!252978) #b00000000000000000000000000000000) (bvslt (index!23421 lt!252978) (size!17213 (array!35080 (store (arr!16849 a!3118) i!1132 k0!1914) (size!17213 a!3118)))))))

(declare-fun res!349062 () Bool)

(assert (=> b!556689 (= res!349062 (= (select (arr!16849 (array!35080 (store (arr!16849 a!3118) i!1132 k0!1914) (size!17213 a!3118))) (index!23421 lt!252978)) (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!556689 (=> res!349062 e!320695)))

(assert (=> b!556689 (= e!320697 e!320695)))

(assert (= (and d!83293 c!64147) b!556681))

(assert (= (and d!83293 (not c!64147)) b!556684))

(assert (= (and b!556684 c!64149) b!556682))

(assert (= (and b!556684 (not c!64149)) b!556688))

(assert (= (and d!83293 c!64148) b!556685))

(assert (= (and d!83293 (not c!64148)) b!556683))

(assert (= (and b!556683 res!349063) b!556689))

(assert (= (and b!556689 (not res!349062)) b!556686))

(assert (= (and b!556686 (not res!349061)) b!556687))

(declare-fun m!534717 () Bool)

(assert (=> b!556687 m!534717))

(declare-fun m!534719 () Bool)

(assert (=> d!83293 m!534719))

(assert (=> d!83293 m!534631))

(assert (=> b!556686 m!534717))

(declare-fun m!534721 () Bool)

(assert (=> b!556688 m!534721))

(assert (=> b!556688 m!534721))

(assert (=> b!556688 m!534625))

(declare-fun m!534723 () Bool)

(assert (=> b!556688 m!534723))

(assert (=> b!556689 m!534717))

(assert (=> b!556591 d!83293))

(declare-fun b!556690 () Bool)

(declare-fun e!320698 () SeekEntryResult!5298)

(assert (=> b!556690 (= e!320698 (Intermediate!5298 true lt!252934 #b00000000000000000000000000000000))))

(declare-fun b!556691 () Bool)

(declare-fun e!320701 () SeekEntryResult!5298)

(assert (=> b!556691 (= e!320701 (Intermediate!5298 false lt!252934 #b00000000000000000000000000000000))))

(declare-fun b!556692 () Bool)

(declare-fun e!320699 () Bool)

(declare-fun e!320702 () Bool)

(assert (=> b!556692 (= e!320699 e!320702)))

(declare-fun res!349066 () Bool)

(declare-fun lt!252980 () SeekEntryResult!5298)

(assert (=> b!556692 (= res!349066 (and ((_ is Intermediate!5298) lt!252980) (not (undefined!6110 lt!252980)) (bvslt (x!52308 lt!252980) #b01111111111111111111111111111110) (bvsge (x!52308 lt!252980) #b00000000000000000000000000000000) (bvsge (x!52308 lt!252980) #b00000000000000000000000000000000)))))

(assert (=> b!556692 (=> (not res!349066) (not e!320702))))

(declare-fun d!83301 () Bool)

(assert (=> d!83301 e!320699))

(declare-fun c!64151 () Bool)

(assert (=> d!83301 (= c!64151 (and ((_ is Intermediate!5298) lt!252980) (undefined!6110 lt!252980)))))

(assert (=> d!83301 (= lt!252980 e!320698)))

(declare-fun c!64150 () Bool)

(assert (=> d!83301 (= c!64150 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!252981 () (_ BitVec 64))

(assert (=> d!83301 (= lt!252981 (select (arr!16849 a!3118) lt!252934))))

(assert (=> d!83301 (validMask!0 mask!3119)))

(assert (=> d!83301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252934 (select (arr!16849 a!3118) j!142) a!3118 mask!3119) lt!252980)))

(declare-fun b!556693 () Bool)

(assert (=> b!556693 (= e!320698 e!320701)))

(declare-fun c!64152 () Bool)

(assert (=> b!556693 (= c!64152 (or (= lt!252981 (select (arr!16849 a!3118) j!142)) (= (bvadd lt!252981 lt!252981) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!556694 () Bool)

(assert (=> b!556694 (= e!320699 (bvsge (x!52308 lt!252980) #b01111111111111111111111111111110))))

(declare-fun b!556695 () Bool)

(assert (=> b!556695 (and (bvsge (index!23421 lt!252980) #b00000000000000000000000000000000) (bvslt (index!23421 lt!252980) (size!17213 a!3118)))))

(declare-fun res!349064 () Bool)

(assert (=> b!556695 (= res!349064 (= (select (arr!16849 a!3118) (index!23421 lt!252980)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!320700 () Bool)

(assert (=> b!556695 (=> res!349064 e!320700)))

(declare-fun b!556696 () Bool)

(assert (=> b!556696 (and (bvsge (index!23421 lt!252980) #b00000000000000000000000000000000) (bvslt (index!23421 lt!252980) (size!17213 a!3118)))))

(assert (=> b!556696 (= e!320700 (= (select (arr!16849 a!3118) (index!23421 lt!252980)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!556697 () Bool)

(assert (=> b!556697 (= e!320701 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!252934 #b00000000000000000000000000000000 mask!3119) (select (arr!16849 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!556698 () Bool)

(assert (=> b!556698 (and (bvsge (index!23421 lt!252980) #b00000000000000000000000000000000) (bvslt (index!23421 lt!252980) (size!17213 a!3118)))))

(declare-fun res!349065 () Bool)

(assert (=> b!556698 (= res!349065 (= (select (arr!16849 a!3118) (index!23421 lt!252980)) (select (arr!16849 a!3118) j!142)))))

(assert (=> b!556698 (=> res!349065 e!320700)))

(assert (=> b!556698 (= e!320702 e!320700)))

(assert (= (and d!83301 c!64150) b!556690))

(assert (= (and d!83301 (not c!64150)) b!556693))

(assert (= (and b!556693 c!64152) b!556691))

(assert (= (and b!556693 (not c!64152)) b!556697))

(assert (= (and d!83301 c!64151) b!556694))

(assert (= (and d!83301 (not c!64151)) b!556692))

(assert (= (and b!556692 res!349066) b!556698))

(assert (= (and b!556698 (not res!349065)) b!556695))

(assert (= (and b!556695 (not res!349064)) b!556696))

(declare-fun m!534725 () Bool)

(assert (=> b!556696 m!534725))

(declare-fun m!534727 () Bool)

(assert (=> d!83301 m!534727))

(assert (=> d!83301 m!534631))

(assert (=> b!556695 m!534725))

(declare-fun m!534729 () Bool)

(assert (=> b!556697 m!534729))

(assert (=> b!556697 m!534729))

(assert (=> b!556697 m!534617))

(declare-fun m!534731 () Bool)

(assert (=> b!556697 m!534731))

(assert (=> b!556698 m!534725))

(assert (=> b!556591 d!83301))

(declare-fun d!83303 () Bool)

(declare-fun lt!252990 () (_ BitVec 32))

(declare-fun lt!252989 () (_ BitVec 32))

(assert (=> d!83303 (= lt!252990 (bvmul (bvxor lt!252989 (bvlshr lt!252989 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83303 (= lt!252989 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83303 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349067 (let ((h!11912 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52311 (bvmul (bvxor h!11912 (bvlshr h!11912 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52311 (bvlshr x!52311 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349067 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349067 #b00000000000000000000000000000000))))))

(assert (=> d!83303 (= (toIndex!0 (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!252990 (bvlshr lt!252990 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556591 d!83303))

(declare-fun d!83307 () Bool)

(declare-fun lt!252992 () (_ BitVec 32))

(declare-fun lt!252991 () (_ BitVec 32))

(assert (=> d!83307 (= lt!252992 (bvmul (bvxor lt!252991 (bvlshr lt!252991 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83307 (= lt!252991 ((_ extract 31 0) (bvand (bvxor (select (arr!16849 a!3118) j!142) (bvlshr (select (arr!16849 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83307 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349067 (let ((h!11912 ((_ extract 31 0) (bvand (bvxor (select (arr!16849 a!3118) j!142) (bvlshr (select (arr!16849 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52311 (bvmul (bvxor h!11912 (bvlshr h!11912 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52311 (bvlshr x!52311 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349067 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349067 #b00000000000000000000000000000000))))))

(assert (=> d!83307 (= (toIndex!0 (select (arr!16849 a!3118) j!142) mask!3119) (bvand (bvxor lt!252992 (bvlshr lt!252992 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556591 d!83307))

(declare-fun bm!32337 () Bool)

(declare-fun call!32340 () Bool)

(declare-fun c!64170 () Bool)

(assert (=> bm!32337 (= call!32340 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64170 (Cons!10925 (select (arr!16849 a!3118) #b00000000000000000000000000000000) Nil!10926) Nil!10926)))))

(declare-fun d!83309 () Bool)

(declare-fun res!349089 () Bool)

(declare-fun e!320742 () Bool)

(assert (=> d!83309 (=> res!349089 e!320742)))

(assert (=> d!83309 (= res!349089 (bvsge #b00000000000000000000000000000000 (size!17213 a!3118)))))

(assert (=> d!83309 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10926) e!320742)))

(declare-fun b!556754 () Bool)

(declare-fun e!320741 () Bool)

(declare-fun contains!2846 (List!10929 (_ BitVec 64)) Bool)

(assert (=> b!556754 (= e!320741 (contains!2846 Nil!10926 (select (arr!16849 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556755 () Bool)

(declare-fun e!320739 () Bool)

(assert (=> b!556755 (= e!320742 e!320739)))

(declare-fun res!349090 () Bool)

(assert (=> b!556755 (=> (not res!349090) (not e!320739))))

(assert (=> b!556755 (= res!349090 (not e!320741))))

(declare-fun res!349091 () Bool)

(assert (=> b!556755 (=> (not res!349091) (not e!320741))))

(assert (=> b!556755 (= res!349091 (validKeyInArray!0 (select (arr!16849 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556756 () Bool)

(declare-fun e!320740 () Bool)

(assert (=> b!556756 (= e!320740 call!32340)))

(declare-fun b!556757 () Bool)

(assert (=> b!556757 (= e!320740 call!32340)))

(declare-fun b!556758 () Bool)

(assert (=> b!556758 (= e!320739 e!320740)))

(assert (=> b!556758 (= c!64170 (validKeyInArray!0 (select (arr!16849 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83309 (not res!349089)) b!556755))

(assert (= (and b!556755 res!349091) b!556754))

(assert (= (and b!556755 res!349090) b!556758))

(assert (= (and b!556758 c!64170) b!556757))

(assert (= (and b!556758 (not c!64170)) b!556756))

(assert (= (or b!556757 b!556756) bm!32337))

(assert (=> bm!32337 m!534693))

(declare-fun m!534767 () Bool)

(assert (=> bm!32337 m!534767))

(assert (=> b!556754 m!534693))

(assert (=> b!556754 m!534693))

(declare-fun m!534769 () Bool)

(assert (=> b!556754 m!534769))

(assert (=> b!556755 m!534693))

(assert (=> b!556755 m!534693))

(assert (=> b!556755 m!534695))

(assert (=> b!556758 m!534693))

(assert (=> b!556758 m!534693))

(assert (=> b!556758 m!534695))

(assert (=> b!556596 d!83309))

(declare-fun b!556811 () Bool)

(declare-fun e!320779 () SeekEntryResult!5298)

(assert (=> b!556811 (= e!320779 Undefined!5298)))

(declare-fun d!83315 () Bool)

(declare-fun lt!253035 () SeekEntryResult!5298)

(assert (=> d!83315 (and (or ((_ is Undefined!5298) lt!253035) (not ((_ is Found!5298) lt!253035)) (and (bvsge (index!23420 lt!253035) #b00000000000000000000000000000000) (bvslt (index!23420 lt!253035) (size!17213 a!3118)))) (or ((_ is Undefined!5298) lt!253035) ((_ is Found!5298) lt!253035) (not ((_ is MissingZero!5298) lt!253035)) (and (bvsge (index!23419 lt!253035) #b00000000000000000000000000000000) (bvslt (index!23419 lt!253035) (size!17213 a!3118)))) (or ((_ is Undefined!5298) lt!253035) ((_ is Found!5298) lt!253035) ((_ is MissingZero!5298) lt!253035) (not ((_ is MissingVacant!5298) lt!253035)) (and (bvsge (index!23422 lt!253035) #b00000000000000000000000000000000) (bvslt (index!23422 lt!253035) (size!17213 a!3118)))) (or ((_ is Undefined!5298) lt!253035) (ite ((_ is Found!5298) lt!253035) (= (select (arr!16849 a!3118) (index!23420 lt!253035)) k0!1914) (ite ((_ is MissingZero!5298) lt!253035) (= (select (arr!16849 a!3118) (index!23419 lt!253035)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5298) lt!253035) (= (select (arr!16849 a!3118) (index!23422 lt!253035)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83315 (= lt!253035 e!320779)))

(declare-fun c!64189 () Bool)

(declare-fun lt!253033 () SeekEntryResult!5298)

(assert (=> d!83315 (= c!64189 (and ((_ is Intermediate!5298) lt!253033) (undefined!6110 lt!253033)))))

(assert (=> d!83315 (= lt!253033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83315 (validMask!0 mask!3119)))

(assert (=> d!83315 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!253035)))

(declare-fun b!556812 () Bool)

(declare-fun e!320778 () SeekEntryResult!5298)

(assert (=> b!556812 (= e!320778 (Found!5298 (index!23421 lt!253033)))))

(declare-fun b!556813 () Bool)

(declare-fun e!320777 () SeekEntryResult!5298)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35079 (_ BitVec 32)) SeekEntryResult!5298)

(assert (=> b!556813 (= e!320777 (seekKeyOrZeroReturnVacant!0 (x!52308 lt!253033) (index!23421 lt!253033) (index!23421 lt!253033) k0!1914 a!3118 mask!3119))))

(declare-fun b!556814 () Bool)

(declare-fun c!64187 () Bool)

(declare-fun lt!253034 () (_ BitVec 64))

(assert (=> b!556814 (= c!64187 (= lt!253034 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556814 (= e!320778 e!320777)))

(declare-fun b!556815 () Bool)

(assert (=> b!556815 (= e!320777 (MissingZero!5298 (index!23421 lt!253033)))))

(declare-fun b!556816 () Bool)

(assert (=> b!556816 (= e!320779 e!320778)))

(assert (=> b!556816 (= lt!253034 (select (arr!16849 a!3118) (index!23421 lt!253033)))))

(declare-fun c!64188 () Bool)

(assert (=> b!556816 (= c!64188 (= lt!253034 k0!1914))))

(assert (= (and d!83315 c!64189) b!556811))

(assert (= (and d!83315 (not c!64189)) b!556816))

(assert (= (and b!556816 c!64188) b!556812))

(assert (= (and b!556816 (not c!64188)) b!556814))

(assert (= (and b!556814 c!64187) b!556815))

(assert (= (and b!556814 (not c!64187)) b!556813))

(declare-fun m!534805 () Bool)

(assert (=> d!83315 m!534805))

(assert (=> d!83315 m!534631))

(declare-fun m!534807 () Bool)

(assert (=> d!83315 m!534807))

(declare-fun m!534809 () Bool)

(assert (=> d!83315 m!534809))

(declare-fun m!534811 () Bool)

(assert (=> d!83315 m!534811))

(declare-fun m!534813 () Bool)

(assert (=> d!83315 m!534813))

(assert (=> d!83315 m!534811))

(declare-fun m!534815 () Bool)

(assert (=> b!556813 m!534815))

(declare-fun m!534817 () Bool)

(assert (=> b!556816 m!534817))

(assert (=> b!556597 d!83315))

(declare-fun d!83339 () Bool)

(assert (=> d!83339 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556592 d!83339))

(declare-fun b!556817 () Bool)

(declare-fun e!320782 () SeekEntryResult!5298)

(assert (=> b!556817 (= e!320782 Undefined!5298)))

(declare-fun d!83341 () Bool)

(declare-fun lt!253038 () SeekEntryResult!5298)

(assert (=> d!83341 (and (or ((_ is Undefined!5298) lt!253038) (not ((_ is Found!5298) lt!253038)) (and (bvsge (index!23420 lt!253038) #b00000000000000000000000000000000) (bvslt (index!23420 lt!253038) (size!17213 a!3118)))) (or ((_ is Undefined!5298) lt!253038) ((_ is Found!5298) lt!253038) (not ((_ is MissingZero!5298) lt!253038)) (and (bvsge (index!23419 lt!253038) #b00000000000000000000000000000000) (bvslt (index!23419 lt!253038) (size!17213 a!3118)))) (or ((_ is Undefined!5298) lt!253038) ((_ is Found!5298) lt!253038) ((_ is MissingZero!5298) lt!253038) (not ((_ is MissingVacant!5298) lt!253038)) (and (bvsge (index!23422 lt!253038) #b00000000000000000000000000000000) (bvslt (index!23422 lt!253038) (size!17213 a!3118)))) (or ((_ is Undefined!5298) lt!253038) (ite ((_ is Found!5298) lt!253038) (= (select (arr!16849 a!3118) (index!23420 lt!253038)) (select (arr!16849 a!3118) j!142)) (ite ((_ is MissingZero!5298) lt!253038) (= (select (arr!16849 a!3118) (index!23419 lt!253038)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5298) lt!253038) (= (select (arr!16849 a!3118) (index!23422 lt!253038)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83341 (= lt!253038 e!320782)))

(declare-fun c!64192 () Bool)

(declare-fun lt!253036 () SeekEntryResult!5298)

(assert (=> d!83341 (= c!64192 (and ((_ is Intermediate!5298) lt!253036) (undefined!6110 lt!253036)))))

(assert (=> d!83341 (= lt!253036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16849 a!3118) j!142) mask!3119) (select (arr!16849 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83341 (validMask!0 mask!3119)))

(assert (=> d!83341 (= (seekEntryOrOpen!0 (select (arr!16849 a!3118) j!142) a!3118 mask!3119) lt!253038)))

(declare-fun b!556818 () Bool)

(declare-fun e!320781 () SeekEntryResult!5298)

(assert (=> b!556818 (= e!320781 (Found!5298 (index!23421 lt!253036)))))

(declare-fun e!320780 () SeekEntryResult!5298)

(declare-fun b!556819 () Bool)

(assert (=> b!556819 (= e!320780 (seekKeyOrZeroReturnVacant!0 (x!52308 lt!253036) (index!23421 lt!253036) (index!23421 lt!253036) (select (arr!16849 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!556820 () Bool)

(declare-fun c!64190 () Bool)

(declare-fun lt!253037 () (_ BitVec 64))

(assert (=> b!556820 (= c!64190 (= lt!253037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556820 (= e!320781 e!320780)))

(declare-fun b!556821 () Bool)

(assert (=> b!556821 (= e!320780 (MissingZero!5298 (index!23421 lt!253036)))))

(declare-fun b!556822 () Bool)

(assert (=> b!556822 (= e!320782 e!320781)))

(assert (=> b!556822 (= lt!253037 (select (arr!16849 a!3118) (index!23421 lt!253036)))))

(declare-fun c!64191 () Bool)

(assert (=> b!556822 (= c!64191 (= lt!253037 (select (arr!16849 a!3118) j!142)))))

(assert (= (and d!83341 c!64192) b!556817))

(assert (= (and d!83341 (not c!64192)) b!556822))

(assert (= (and b!556822 c!64191) b!556818))

(assert (= (and b!556822 (not c!64191)) b!556820))

(assert (= (and b!556820 c!64190) b!556821))

(assert (= (and b!556820 (not c!64190)) b!556819))

(declare-fun m!534819 () Bool)

(assert (=> d!83341 m!534819))

(assert (=> d!83341 m!534631))

(declare-fun m!534821 () Bool)

(assert (=> d!83341 m!534821))

(declare-fun m!534823 () Bool)

(assert (=> d!83341 m!534823))

(assert (=> d!83341 m!534619))

(assert (=> d!83341 m!534617))

(declare-fun m!534825 () Bool)

(assert (=> d!83341 m!534825))

(assert (=> d!83341 m!534617))

(assert (=> d!83341 m!534619))

(assert (=> b!556819 m!534617))

(declare-fun m!534827 () Bool)

(assert (=> b!556819 m!534827))

(declare-fun m!534829 () Bool)

(assert (=> b!556822 m!534829))

(assert (=> b!556593 d!83341))

(declare-fun d!83343 () Bool)

(declare-fun res!349117 () Bool)

(declare-fun e!320789 () Bool)

(assert (=> d!83343 (=> res!349117 e!320789)))

(assert (=> d!83343 (= res!349117 (= (select (arr!16849 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83343 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!320789)))

(declare-fun b!556831 () Bool)

(declare-fun e!320790 () Bool)

(assert (=> b!556831 (= e!320789 e!320790)))

(declare-fun res!349118 () Bool)

(assert (=> b!556831 (=> (not res!349118) (not e!320790))))

(assert (=> b!556831 (= res!349118 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17213 a!3118)))))

(declare-fun b!556832 () Bool)

(assert (=> b!556832 (= e!320790 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83343 (not res!349117)) b!556831))

(assert (= (and b!556831 res!349118) b!556832))

(assert (=> d!83343 m!534693))

(declare-fun m!534831 () Bool)

(assert (=> b!556832 m!534831))

(assert (=> b!556598 d!83343))

(declare-fun d!83345 () Bool)

(assert (=> d!83345 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50854 d!83345))

(declare-fun d!83351 () Bool)

(assert (=> d!83351 (= (array_inv!12645 a!3118) (bvsge (size!17213 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50854 d!83351))

(declare-fun d!83353 () Bool)

(assert (=> d!83353 (= (validKeyInArray!0 (select (arr!16849 a!3118) j!142)) (and (not (= (select (arr!16849 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16849 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556589 d!83353))

(check-sat (not b!556754) (not b!556832) (not d!83301) (not d!83293) (not b!556758) (not b!556637) (not b!556641) (not b!556755) (not b!556697) (not d!83315) (not bm!32337) (not b!556688) (not b!556638) (not bm!32331) (not d!83341) (not b!556642) (not b!556813) (not b!556819) (not bm!32330) (not d!83291))
(check-sat)
