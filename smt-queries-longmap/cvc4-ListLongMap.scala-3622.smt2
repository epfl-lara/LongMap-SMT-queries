; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49932 () Bool)

(assert start!49932)

(declare-fun b!547780 () Bool)

(declare-fun res!341280 () Bool)

(declare-fun e!316511 () Bool)

(assert (=> b!547780 (=> (not res!341280) (not e!316511))))

(declare-datatypes ((array!34553 0))(
  ( (array!34554 (arr!16598 (Array (_ BitVec 32) (_ BitVec 64))) (size!16962 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34553)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547780 (= res!341280 (validKeyInArray!0 (select (arr!16598 a!3118) j!142)))))

(declare-fun b!547781 () Bool)

(declare-fun res!341279 () Bool)

(declare-fun e!316512 () Bool)

(assert (=> b!547781 (=> (not res!341279) (not e!316512))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34553 (_ BitVec 32)) Bool)

(assert (=> b!547781 (= res!341279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547782 () Bool)

(declare-fun res!341283 () Bool)

(assert (=> b!547782 (=> (not res!341283) (not e!316511))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!547782 (= res!341283 (validKeyInArray!0 k!1914))))

(declare-fun b!547783 () Bool)

(assert (=> b!547783 (= e!316511 e!316512)))

(declare-fun res!341282 () Bool)

(assert (=> b!547783 (=> (not res!341282) (not e!316512))))

(declare-datatypes ((SeekEntryResult!5047 0))(
  ( (MissingZero!5047 (index!22415 (_ BitVec 32))) (Found!5047 (index!22416 (_ BitVec 32))) (Intermediate!5047 (undefined!5859 Bool) (index!22417 (_ BitVec 32)) (x!51355 (_ BitVec 32))) (Undefined!5047) (MissingVacant!5047 (index!22418 (_ BitVec 32))) )
))
(declare-fun lt!249628 () SeekEntryResult!5047)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547783 (= res!341282 (or (= lt!249628 (MissingZero!5047 i!1132)) (= lt!249628 (MissingVacant!5047 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34553 (_ BitVec 32)) SeekEntryResult!5047)

(assert (=> b!547783 (= lt!249628 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!547784 () Bool)

(declare-fun res!341281 () Bool)

(assert (=> b!547784 (=> (not res!341281) (not e!316511))))

(declare-fun arrayContainsKey!0 (array!34553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547784 (= res!341281 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547785 () Bool)

(declare-fun res!341284 () Bool)

(assert (=> b!547785 (=> (not res!341284) (not e!316512))))

(declare-datatypes ((List!10678 0))(
  ( (Nil!10675) (Cons!10674 (h!11641 (_ BitVec 64)) (t!16906 List!10678)) )
))
(declare-fun arrayNoDuplicates!0 (array!34553 (_ BitVec 32) List!10678) Bool)

(assert (=> b!547785 (= res!341284 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10675))))

(declare-fun res!341285 () Bool)

(assert (=> start!49932 (=> (not res!341285) (not e!316511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49932 (= res!341285 (validMask!0 mask!3119))))

(assert (=> start!49932 e!316511))

(assert (=> start!49932 true))

(declare-fun array_inv!12394 (array!34553) Bool)

(assert (=> start!49932 (array_inv!12394 a!3118)))

(declare-fun b!547786 () Bool)

(declare-fun res!341278 () Bool)

(assert (=> b!547786 (=> (not res!341278) (not e!316511))))

(assert (=> b!547786 (= res!341278 (and (= (size!16962 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16962 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16962 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547787 () Bool)

(assert (=> b!547787 (= e!316512 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsgt mask!3119 #b00111111111111111111111111111111)))))

(assert (= (and start!49932 res!341285) b!547786))

(assert (= (and b!547786 res!341278) b!547780))

(assert (= (and b!547780 res!341280) b!547782))

(assert (= (and b!547782 res!341283) b!547784))

(assert (= (and b!547784 res!341281) b!547783))

(assert (= (and b!547783 res!341282) b!547781))

(assert (= (and b!547781 res!341279) b!547785))

(assert (= (and b!547785 res!341284) b!547787))

(declare-fun m!524973 () Bool)

(assert (=> b!547781 m!524973))

(declare-fun m!524975 () Bool)

(assert (=> b!547780 m!524975))

(assert (=> b!547780 m!524975))

(declare-fun m!524977 () Bool)

(assert (=> b!547780 m!524977))

(declare-fun m!524979 () Bool)

(assert (=> b!547783 m!524979))

(declare-fun m!524981 () Bool)

(assert (=> b!547784 m!524981))

(declare-fun m!524983 () Bool)

(assert (=> start!49932 m!524983))

(declare-fun m!524985 () Bool)

(assert (=> start!49932 m!524985))

(declare-fun m!524987 () Bool)

(assert (=> b!547782 m!524987))

(declare-fun m!524989 () Bool)

(assert (=> b!547785 m!524989))

(push 1)

(assert (not b!547780))

(assert (not b!547781))

(assert (not b!547782))

(assert (not b!547784))

(assert (not b!547783))

(assert (not start!49932))

(assert (not b!547785))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!547866 () Bool)

(declare-fun e!316563 () SeekEntryResult!5047)

(declare-fun e!316561 () SeekEntryResult!5047)

(assert (=> b!547866 (= e!316563 e!316561)))

(declare-fun lt!249655 () (_ BitVec 64))

(declare-fun lt!249653 () SeekEntryResult!5047)

(assert (=> b!547866 (= lt!249655 (select (arr!16598 a!3118) (index!22417 lt!249653)))))

(declare-fun c!63610 () Bool)

(assert (=> b!547866 (= c!63610 (= lt!249655 k!1914))))

(declare-fun e!316562 () SeekEntryResult!5047)

(declare-fun b!547867 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34553 (_ BitVec 32)) SeekEntryResult!5047)

(assert (=> b!547867 (= e!316562 (seekKeyOrZeroReturnVacant!0 (x!51355 lt!249653) (index!22417 lt!249653) (index!22417 lt!249653) k!1914 a!3118 mask!3119))))

(declare-fun b!547868 () Bool)

(assert (=> b!547868 (= e!316563 Undefined!5047)))

(declare-fun b!547869 () Bool)

(assert (=> b!547869 (= e!316562 (MissingZero!5047 (index!22417 lt!249653)))))

(declare-fun b!547871 () Bool)

(assert (=> b!547871 (= e!316561 (Found!5047 (index!22417 lt!249653)))))

(declare-fun d!82559 () Bool)

(declare-fun lt!249654 () SeekEntryResult!5047)

(assert (=> d!82559 (and (or (is-Undefined!5047 lt!249654) (not (is-Found!5047 lt!249654)) (and (bvsge (index!22416 lt!249654) #b00000000000000000000000000000000) (bvslt (index!22416 lt!249654) (size!16962 a!3118)))) (or (is-Undefined!5047 lt!249654) (is-Found!5047 lt!249654) (not (is-MissingZero!5047 lt!249654)) (and (bvsge (index!22415 lt!249654) #b00000000000000000000000000000000) (bvslt (index!22415 lt!249654) (size!16962 a!3118)))) (or (is-Undefined!5047 lt!249654) (is-Found!5047 lt!249654) (is-MissingZero!5047 lt!249654) (not (is-MissingVacant!5047 lt!249654)) (and (bvsge (index!22418 lt!249654) #b00000000000000000000000000000000) (bvslt (index!22418 lt!249654) (size!16962 a!3118)))) (or (is-Undefined!5047 lt!249654) (ite (is-Found!5047 lt!249654) (= (select (arr!16598 a!3118) (index!22416 lt!249654)) k!1914) (ite (is-MissingZero!5047 lt!249654) (= (select (arr!16598 a!3118) (index!22415 lt!249654)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5047 lt!249654) (= (select (arr!16598 a!3118) (index!22418 lt!249654)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82559 (= lt!249654 e!316563)))

(declare-fun c!63611 () Bool)

(assert (=> d!82559 (= c!63611 (and (is-Intermediate!5047 lt!249653) (undefined!5859 lt!249653)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34553 (_ BitVec 32)) SeekEntryResult!5047)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82559 (= lt!249653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82559 (validMask!0 mask!3119)))

(assert (=> d!82559 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249654)))

(declare-fun b!547870 () Bool)

(declare-fun c!63609 () Bool)

(assert (=> b!547870 (= c!63609 (= lt!249655 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!547870 (= e!316561 e!316562)))

(assert (= (and d!82559 c!63611) b!547868))

(assert (= (and d!82559 (not c!63611)) b!547866))

(assert (= (and b!547866 c!63610) b!547871))

(assert (= (and b!547866 (not c!63610)) b!547870))

(assert (= (and b!547870 c!63609) b!547869))

(assert (= (and b!547870 (not c!63609)) b!547867))

(declare-fun m!525035 () Bool)

(assert (=> b!547866 m!525035))

(declare-fun m!525037 () Bool)

(assert (=> b!547867 m!525037))

(declare-fun m!525039 () Bool)

(assert (=> d!82559 m!525039))

(assert (=> d!82559 m!524983))

