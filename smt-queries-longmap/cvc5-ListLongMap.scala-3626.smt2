; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49994 () Bool)

(assert start!49994)

(declare-fun b!548173 () Bool)

(declare-fun res!341586 () Bool)

(declare-fun e!316709 () Bool)

(assert (=> b!548173 (=> (not res!341586) (not e!316709))))

(declare-datatypes ((array!34576 0))(
  ( (array!34577 (arr!16608 (Array (_ BitVec 32) (_ BitVec 64))) (size!16972 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34576)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548173 (= res!341586 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548174 () Bool)

(declare-fun res!341588 () Bool)

(assert (=> b!548174 (=> (not res!341588) (not e!316709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548174 (= res!341588 (validKeyInArray!0 k!1914))))

(declare-fun b!548175 () Bool)

(declare-fun res!341585 () Bool)

(declare-fun e!316708 () Bool)

(assert (=> b!548175 (=> (not res!341585) (not e!316708))))

(declare-datatypes ((List!10688 0))(
  ( (Nil!10685) (Cons!10684 (h!11651 (_ BitVec 64)) (t!16916 List!10688)) )
))
(declare-fun arrayNoDuplicates!0 (array!34576 (_ BitVec 32) List!10688) Bool)

(assert (=> b!548175 (= res!341585 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10685))))

(declare-fun res!341584 () Bool)

(assert (=> start!49994 (=> (not res!341584) (not e!316709))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49994 (= res!341584 (validMask!0 mask!3119))))

(assert (=> start!49994 e!316709))

(assert (=> start!49994 true))

(declare-fun array_inv!12404 (array!34576) Bool)

(assert (=> start!49994 (array_inv!12404 a!3118)))

(declare-fun b!548176 () Bool)

(assert (=> b!548176 (= e!316709 e!316708)))

(declare-fun res!341582 () Bool)

(assert (=> b!548176 (=> (not res!341582) (not e!316708))))

(declare-datatypes ((SeekEntryResult!5057 0))(
  ( (MissingZero!5057 (index!22455 (_ BitVec 32))) (Found!5057 (index!22456 (_ BitVec 32))) (Intermediate!5057 (undefined!5869 Bool) (index!22457 (_ BitVec 32)) (x!51397 (_ BitVec 32))) (Undefined!5057) (MissingVacant!5057 (index!22458 (_ BitVec 32))) )
))
(declare-fun lt!249741 () SeekEntryResult!5057)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548176 (= res!341582 (or (= lt!249741 (MissingZero!5057 i!1132)) (= lt!249741 (MissingVacant!5057 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34576 (_ BitVec 32)) SeekEntryResult!5057)

(assert (=> b!548176 (= lt!249741 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548177 () Bool)

(declare-fun res!341583 () Bool)

(assert (=> b!548177 (=> (not res!341583) (not e!316709))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!548177 (= res!341583 (and (= (size!16972 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16972 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16972 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548178 () Bool)

(declare-fun lt!249742 () (_ BitVec 32))

(assert (=> b!548178 (= e!316708 (and (bvsge mask!3119 #b00000000000000000000000000000000) (or (bvslt lt!249742 #b00000000000000000000000000000000) (bvsge lt!249742 (bvadd #b00000000000000000000000000000001 mask!3119)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548178 (= lt!249742 (toIndex!0 (select (arr!16608 a!3118) j!142) mask!3119))))

(declare-fun b!548179 () Bool)

(declare-fun res!341581 () Bool)

(assert (=> b!548179 (=> (not res!341581) (not e!316708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34576 (_ BitVec 32)) Bool)

(assert (=> b!548179 (= res!341581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548180 () Bool)

(declare-fun res!341587 () Bool)

(assert (=> b!548180 (=> (not res!341587) (not e!316709))))

(assert (=> b!548180 (= res!341587 (validKeyInArray!0 (select (arr!16608 a!3118) j!142)))))

(assert (= (and start!49994 res!341584) b!548177))

(assert (= (and b!548177 res!341583) b!548180))

(assert (= (and b!548180 res!341587) b!548174))

(assert (= (and b!548174 res!341588) b!548173))

(assert (= (and b!548173 res!341586) b!548176))

(assert (= (and b!548176 res!341582) b!548179))

(assert (= (and b!548179 res!341581) b!548175))

(assert (= (and b!548175 res!341585) b!548178))

(declare-fun m!525267 () Bool)

(assert (=> b!548173 m!525267))

(declare-fun m!525269 () Bool)

(assert (=> b!548175 m!525269))

(declare-fun m!525271 () Bool)

(assert (=> b!548179 m!525271))

(declare-fun m!525273 () Bool)

(assert (=> start!49994 m!525273))

(declare-fun m!525275 () Bool)

(assert (=> start!49994 m!525275))

(declare-fun m!525277 () Bool)

(assert (=> b!548176 m!525277))

(declare-fun m!525279 () Bool)

(assert (=> b!548180 m!525279))

(assert (=> b!548180 m!525279))

(declare-fun m!525281 () Bool)

(assert (=> b!548180 m!525281))

(declare-fun m!525283 () Bool)

(assert (=> b!548174 m!525283))

(assert (=> b!548178 m!525279))

(assert (=> b!548178 m!525279))

(declare-fun m!525285 () Bool)

(assert (=> b!548178 m!525285))

(push 1)

(assert (not b!548178))

(assert (not b!548174))

(assert (not b!548176))

(assert (not b!548175))

(assert (not b!548180))

(assert (not start!49994))

(assert (not b!548179))

(assert (not b!548173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82613 () Bool)

(declare-fun res!341641 () Bool)

(declare-fun e!316733 () Bool)

(assert (=> d!82613 (=> res!341641 e!316733)))

(assert (=> d!82613 (= res!341641 (= (select (arr!16608 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82613 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!316733)))

(declare-fun b!548233 () Bool)

(declare-fun e!316734 () Bool)

(assert (=> b!548233 (= e!316733 e!316734)))

(declare-fun res!341642 () Bool)

(assert (=> b!548233 (=> (not res!341642) (not e!316734))))

(assert (=> b!548233 (= res!341642 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16972 a!3118)))))

(declare-fun b!548234 () Bool)

(assert (=> b!548234 (= e!316734 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82613 (not res!341641)) b!548233))

(assert (= (and b!548233 res!341642) b!548234))

(declare-fun m!525327 () Bool)

(assert (=> d!82613 m!525327))

(declare-fun m!525329 () Bool)

(assert (=> b!548234 m!525329))

(assert (=> b!548173 d!82613))

(declare-fun d!82615 () Bool)

(declare-fun lt!249760 () (_ BitVec 32))

(declare-fun lt!249759 () (_ BitVec 32))

(assert (=> d!82615 (= lt!249760 (bvmul (bvxor lt!249759 (bvlshr lt!249759 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82615 (= lt!249759 ((_ extract 31 0) (bvand (bvxor (select (arr!16608 a!3118) j!142) (bvlshr (select (arr!16608 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82615 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!341643 (let ((h!11654 ((_ extract 31 0) (bvand (bvxor (select (arr!16608 a!3118) j!142) (bvlshr (select (arr!16608 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51400 (bvmul (bvxor h!11654 (bvlshr h!11654 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51400 (bvlshr x!51400 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!341643 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!341643 #b00000000000000000000000000000000))))))

(assert (=> d!82615 (= (toIndex!0 (select (arr!16608 a!3118) j!142) mask!3119) (bvand (bvxor lt!249760 (bvlshr lt!249760 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!548178 d!82615))

(declare-fun d!82619 () Bool)

(assert (=> d!82619 (= (validKeyInArray!0 (select (arr!16608 a!3118) j!142)) (and (not (= (select (arr!16608 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16608 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548180 d!82619))

(declare-fun bm!32195 () Bool)

(declare-fun call!32198 () Bool)

(assert (=> bm!32195 (= call!32198 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!548283 () Bool)

(declare-fun e!316769 () Bool)

(declare-fun e!316770 () Bool)

(assert (=> b!548283 (= e!316769 e!316770)))

(declare-fun c!63638 () Bool)

(assert (=> b!548283 (= c!63638 (validKeyInArray!0 (select (arr!16608 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548282 () Bool)

(declare-fun e!316768 () Bool)

(assert (=> b!548282 (= e!316768 call!32198)))

(declare-fun d!82621 () Bool)

(declare-fun res!341664 () Bool)

(assert (=> d!82621 (=> res!341664 e!316769)))

(assert (=> d!82621 (= res!341664 (bvsge #b00000000000000000000000000000000 (size!16972 a!3118)))))

(assert (=> d!82621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316769)))

(declare-fun b!548284 () Bool)

(assert (=> b!548284 (= e!316770 e!316768)))

(declare-fun lt!249778 () (_ BitVec 64))

(assert (=> b!548284 (= lt!249778 (select (arr!16608 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16968 0))(
  ( (Unit!16969) )
))
(declare-fun lt!249777 () Unit!16968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34576 (_ BitVec 64) (_ BitVec 32)) Unit!16968)

(assert (=> b!548284 (= lt!249777 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249778 #b00000000000000000000000000000000))))

(assert (=> b!548284 (arrayContainsKey!0 a!3118 lt!249778 #b00000000000000000000000000000000)))

(declare-fun lt!249776 () Unit!16968)

(assert (=> b!548284 (= lt!249776 lt!249777)))

(declare-fun res!341663 () Bool)

(assert (=> b!548284 (= res!341663 (= (seekEntryOrOpen!0 (select (arr!16608 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5057 #b00000000000000000000000000000000)))))

(assert (=> b!548284 (=> (not res!341663) (not e!316768))))

(declare-fun b!548285 () Bool)

(assert (=> b!548285 (= e!316770 call!32198)))

(assert (= (and d!82621 (not res!341664)) b!548283))

(assert (= (and b!548283 c!63638) b!548284))

(assert (= (and b!548283 (not c!63638)) b!548285))

(assert (= (and b!548284 res!341663) b!548282))

(assert (= (or b!548282 b!548285) bm!32195))

(declare-fun m!525355 () Bool)

(assert (=> bm!32195 m!525355))

(assert (=> b!548283 m!525327))

(assert (=> b!548283 m!525327))

(declare-fun m!525357 () Bool)

(assert (=> b!548283 m!525357))

(assert (=> b!548284 m!525327))

(declare-fun m!525359 () Bool)

(assert (=> b!548284 m!525359))

(declare-fun m!525361 () Bool)

(assert (=> b!548284 m!525361))

(assert (=> b!548284 m!525327))

(declare-fun m!525363 () Bool)

(assert (=> b!548284 m!525363))

(assert (=> b!548179 d!82621))

(declare-fun d!82629 () Bool)

(assert (=> d!82629 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548174 d!82629))

(declare-fun d!82631 () Bool)

(assert (=> d!82631 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49994 d!82631))

(declare-fun d!82635 () Bool)

(assert (=> d!82635 (= (array_inv!12404 a!3118) (bvsge (size!16972 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49994 d!82635))

(declare-fun lt!249816 () SeekEntryResult!5057)

(declare-fun b!548361 () Bool)

(declare-fun e!316824 () SeekEntryResult!5057)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34576 (_ BitVec 32)) SeekEntryResult!5057)

(assert (=> b!548361 (= e!316824 (seekKeyOrZeroReturnVacant!0 (x!51397 lt!249816) (index!22457 lt!249816) (index!22457 lt!249816) k!1914 a!3118 mask!3119))))

(declare-fun b!548362 () Bool)

(declare-fun c!63664 () Bool)

(declare-fun lt!249817 () (_ BitVec 64))

(assert (=> b!548362 (= c!63664 (= lt!249817 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316822 () SeekEntryResult!5057)

(assert (=> b!548362 (= e!316822 e!316824)))

(declare-fun b!548363 () Bool)

(declare-fun e!316823 () SeekEntryResult!5057)

(assert (=> b!548363 (= e!316823 Undefined!5057)))

(declare-fun d!82637 () Bool)

(declare-fun lt!249818 () SeekEntryResult!5057)

(assert (=> d!82637 (and (or (is-Undefined!5057 lt!249818) (not (is-Found!5057 lt!249818)) (and (bvsge (index!22456 lt!249818) #b00000000000000000000000000000000) (bvslt (index!22456 lt!249818) (size!16972 a!3118)))) (or (is-Undefined!5057 lt!249818) (is-Found!5057 lt!249818) (not (is-MissingZero!5057 lt!249818)) (and (bvsge (index!22455 lt!249818) #b00000000000000000000000000000000) (bvslt (index!22455 lt!249818) (size!16972 a!3118)))) (or (is-Undefined!5057 lt!249818) (is-Found!5057 lt!249818) (is-MissingZero!5057 lt!249818) (not (is-MissingVacant!5057 lt!249818)) (and (bvsge (index!22458 lt!249818) #b00000000000000000000000000000000) (bvslt (index!22458 lt!249818) (size!16972 a!3118)))) (or (is-Undefined!5057 lt!249818) (ite (is-Found!5057 lt!249818) (= (select (arr!16608 a!3118) (index!22456 lt!249818)) k!1914) (ite (is-MissingZero!5057 lt!249818) (= (select (arr!16608 a!3118) (index!22455 lt!249818)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5057 lt!249818) (= (select (arr!16608 a!3118) (index!22458 lt!249818)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82637 (= lt!249818 e!316823)))

(declare-fun c!63665 () Bool)

(assert (=> d!82637 (= c!63665 (and (is-Intermediate!5057 lt!249816) (undefined!5869 lt!249816)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34576 (_ BitVec 32)) SeekEntryResult!5057)

(assert (=> d!82637 (= lt!249816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82637 (validMask!0 mask!3119)))

(assert (=> d!82637 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249818)))

(declare-fun b!548364 () Bool)

(assert (=> b!548364 (= e!316824 (MissingZero!5057 (index!22457 lt!249816)))))

(declare-fun b!548365 () Bool)

(assert (=> b!548365 (= e!316822 (Found!5057 (index!22457 lt!249816)))))

(declare-fun b!548366 () Bool)

(assert (=> b!548366 (= e!316823 e!316822)))

(assert (=> b!548366 (= lt!249817 (select (arr!16608 a!3118) (index!22457 lt!249816)))))

(declare-fun c!63663 () Bool)

(assert (=> b!548366 (= c!63663 (= lt!249817 k!1914))))

(assert (= (and d!82637 c!63665) b!548363))

(assert (= (and d!82637 (not c!63665)) b!548366))

(assert (= (and b!548366 c!63663) b!548365))

(assert (= (and b!548366 (not c!63663)) b!548362))

(assert (= (and b!548362 c!63664) b!548364))

(assert (= (and b!548362 (not c!63664)) b!548361))

(declare-fun m!525405 () Bool)

(assert (=> b!548361 m!525405))

(assert (=> d!82637 m!525273))

(declare-fun m!525407 () Bool)

(assert (=> d!82637 m!525407))

(declare-fun m!525409 () Bool)

(assert (=> d!82637 m!525409))

(declare-fun m!525411 () Bool)

(assert (=> d!82637 m!525411))

(declare-fun m!525413 () Bool)

(assert (=> d!82637 m!525413))

(assert (=> d!82637 m!525411))

(declare-fun m!525415 () Bool)

(assert (=> d!82637 m!525415))

(declare-fun m!525417 () Bool)

(assert (=> b!548366 m!525417))

(assert (=> b!548176 d!82637))

(declare-fun b!548377 () Bool)

(declare-fun e!316836 () Bool)

(declare-fun e!316833 () Bool)

(assert (=> b!548377 (= e!316836 e!316833)))

(declare-fun res!341701 () Bool)

(assert (=> b!548377 (=> (not res!341701) (not e!316833))))

(declare-fun e!316835 () Bool)

(assert (=> b!548377 (= res!341701 (not e!316835))))

(declare-fun res!341700 () Bool)

(assert (=> b!548377 (=> (not res!341700) (not e!316835))))

(assert (=> b!548377 (= res!341700 (validKeyInArray!0 (select (arr!16608 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548378 () Bool)

(declare-fun e!316834 () Bool)

(declare-fun call!32210 () Bool)

(assert (=> b!548378 (= e!316834 call!32210)))

(declare-fun b!548379 () Bool)

(assert (=> b!548379 (= e!316834 call!32210)))

(declare-fun d!82659 () Bool)

(declare-fun res!341702 () Bool)

(assert (=> d!82659 (=> res!341702 e!316836)))

(assert (=> d!82659 (= res!341702 (bvsge #b00000000000000000000000000000000 (size!16972 a!3118)))))

(assert (=> d!82659 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10685) e!316836)))

(declare-fun b!548380 () Bool)

(declare-fun contains!2826 (List!10688 (_ BitVec 64)) Bool)

(assert (=> b!548380 (= e!316835 (contains!2826 Nil!10685 (select (arr!16608 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32207 () Bool)

(declare-fun c!63668 () Bool)

(assert (=> bm!32207 (= call!32210 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63668 (Cons!10684 (select (arr!16608 a!3118) #b00000000000000000000000000000000) Nil!10685) Nil!10685)))))

(declare-fun b!548381 () Bool)

(assert (=> b!548381 (= e!316833 e!316834)))

(assert (=> b!548381 (= c!63668 (validKeyInArray!0 (select (arr!16608 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!82659 (not res!341702)) b!548377))

(assert (= (and b!548377 res!341700) b!548380))

(assert (= (and b!548377 res!341701) b!548381))

(assert (= (and b!548381 c!63668) b!548378))

(assert (= (and b!548381 (not c!63668)) b!548379))

(assert (= (or b!548378 b!548379) bm!32207))

(assert (=> b!548377 m!525327))

(assert (=> b!548377 m!525327))

(assert (=> b!548377 m!525357))

(assert (=> b!548380 m!525327))

(assert (=> b!548380 m!525327))

(declare-fun m!525419 () Bool)

(assert (=> b!548380 m!525419))

(assert (=> bm!32207 m!525327))

(declare-fun m!525421 () Bool)

(assert (=> bm!32207 m!525421))

(assert (=> b!548381 m!525327))

(assert (=> b!548381 m!525327))

(assert (=> b!548381 m!525357))

(assert (=> b!548175 d!82659))

(push 1)

(assert (not b!548284))

(assert (not b!548283))

(assert (not b!548380))

(assert (not b!548377))

(assert (not b!548234))

(assert (not b!548361))

(assert (not d!82637))

(assert (not bm!32207))

(assert (not bm!32195))

(assert (not b!548381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

