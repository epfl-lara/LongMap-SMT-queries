; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49778 () Bool)

(assert start!49778)

(declare-fun b!547049 () Bool)

(declare-fun res!340763 () Bool)

(declare-fun e!316101 () Bool)

(assert (=> b!547049 (=> (not res!340763) (not e!316101))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547049 (= res!340763 (validKeyInArray!0 k!1914))))

(declare-fun b!547050 () Bool)

(declare-fun res!340767 () Bool)

(assert (=> b!547050 (=> (not res!340767) (not e!316101))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34516 0))(
  ( (array!34517 (arr!16584 (Array (_ BitVec 32) (_ BitVec 64))) (size!16948 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34516)

(assert (=> b!547050 (= res!340767 (and (= (size!16948 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16948 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16948 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547051 () Bool)

(declare-fun e!316099 () Bool)

(assert (=> b!547051 (= e!316101 e!316099)))

(declare-fun res!340765 () Bool)

(assert (=> b!547051 (=> (not res!340765) (not e!316099))))

(declare-datatypes ((SeekEntryResult!5033 0))(
  ( (MissingZero!5033 (index!22359 (_ BitVec 32))) (Found!5033 (index!22360 (_ BitVec 32))) (Intermediate!5033 (undefined!5845 Bool) (index!22361 (_ BitVec 32)) (x!51309 (_ BitVec 32))) (Undefined!5033) (MissingVacant!5033 (index!22362 (_ BitVec 32))) )
))
(declare-fun lt!249412 () SeekEntryResult!5033)

(assert (=> b!547051 (= res!340765 (or (= lt!249412 (MissingZero!5033 i!1132)) (= lt!249412 (MissingVacant!5033 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34516 (_ BitVec 32)) SeekEntryResult!5033)

(assert (=> b!547051 (= lt!249412 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!340766 () Bool)

(assert (=> start!49778 (=> (not res!340766) (not e!316101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49778 (= res!340766 (validMask!0 mask!3119))))

(assert (=> start!49778 e!316101))

(assert (=> start!49778 true))

(declare-fun array_inv!12380 (array!34516) Bool)

(assert (=> start!49778 (array_inv!12380 a!3118)))

(declare-fun b!547052 () Bool)

(assert (=> b!547052 (= e!316099 (and (bvsle #b00000000000000000000000000000000 (size!16948 a!3118)) (bvsge (size!16948 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547053 () Bool)

(declare-fun res!340769 () Bool)

(assert (=> b!547053 (=> (not res!340769) (not e!316099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34516 (_ BitVec 32)) Bool)

(assert (=> b!547053 (= res!340769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547054 () Bool)

(declare-fun res!340768 () Bool)

(assert (=> b!547054 (=> (not res!340768) (not e!316101))))

(declare-fun arrayContainsKey!0 (array!34516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547054 (= res!340768 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547055 () Bool)

(declare-fun res!340764 () Bool)

(assert (=> b!547055 (=> (not res!340764) (not e!316101))))

(assert (=> b!547055 (= res!340764 (validKeyInArray!0 (select (arr!16584 a!3118) j!142)))))

(assert (= (and start!49778 res!340766) b!547050))

(assert (= (and b!547050 res!340767) b!547055))

(assert (= (and b!547055 res!340764) b!547049))

(assert (= (and b!547049 res!340763) b!547054))

(assert (= (and b!547054 res!340768) b!547051))

(assert (= (and b!547051 res!340765) b!547053))

(assert (= (and b!547053 res!340769) b!547052))

(declare-fun m!524409 () Bool)

(assert (=> b!547049 m!524409))

(declare-fun m!524411 () Bool)

(assert (=> start!49778 m!524411))

(declare-fun m!524413 () Bool)

(assert (=> start!49778 m!524413))

(declare-fun m!524415 () Bool)

(assert (=> b!547054 m!524415))

(declare-fun m!524417 () Bool)

(assert (=> b!547053 m!524417))

(declare-fun m!524419 () Bool)

(assert (=> b!547051 m!524419))

(declare-fun m!524421 () Bool)

(assert (=> b!547055 m!524421))

(assert (=> b!547055 m!524421))

(declare-fun m!524423 () Bool)

(assert (=> b!547055 m!524423))

(push 1)

(assert (not b!547049))

(assert (not b!547054))

(assert (not b!547053))

(assert (not b!547051))

(assert (not b!547055))

(assert (not start!49778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!547124 () Bool)

(declare-fun e!316143 () Bool)

(declare-fun e!316141 () Bool)

(assert (=> b!547124 (= e!316143 e!316141)))

(declare-fun lt!249435 () (_ BitVec 64))

(assert (=> b!547124 (= lt!249435 (select (arr!16584 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16948 0))(
  ( (Unit!16949) )
))
(declare-fun lt!249434 () Unit!16948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34516 (_ BitVec 64) (_ BitVec 32)) Unit!16948)

(assert (=> b!547124 (= lt!249434 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249435 #b00000000000000000000000000000000))))

(assert (=> b!547124 (arrayContainsKey!0 a!3118 lt!249435 #b00000000000000000000000000000000)))

(declare-fun lt!249436 () Unit!16948)

(assert (=> b!547124 (= lt!249436 lt!249434)))

(declare-fun res!340828 () Bool)

(assert (=> b!547124 (= res!340828 (= (seekEntryOrOpen!0 (select (arr!16584 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5033 #b00000000000000000000000000000000)))))

(assert (=> b!547124 (=> (not res!340828) (not e!316141))))

(declare-fun b!547125 () Bool)

(declare-fun e!316142 () Bool)

(assert (=> b!547125 (= e!316142 e!316143)))

(declare-fun c!63476 () Bool)

(assert (=> b!547125 (= c!63476 (validKeyInArray!0 (select (arr!16584 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32150 () Bool)

(declare-fun call!32153 () Bool)

(assert (=> bm!32150 (= call!32153 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!547126 () Bool)

(assert (=> b!547126 (= e!316141 call!32153)))

(declare-fun b!547127 () Bool)

(assert (=> b!547127 (= e!316143 call!32153)))

(declare-fun d!82401 () Bool)

(declare-fun res!340829 () Bool)

(assert (=> d!82401 (=> res!340829 e!316142)))

(assert (=> d!82401 (= res!340829 (bvsge #b00000000000000000000000000000000 (size!16948 a!3118)))))

(assert (=> d!82401 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316142)))

(assert (= (and d!82401 (not res!340829)) b!547125))

(assert (= (and b!547125 c!63476) b!547124))

(assert (= (and b!547125 (not c!63476)) b!547127))

(assert (= (and b!547124 res!340828) b!547126))

(assert (= (or b!547126 b!547127) bm!32150))

(declare-fun m!524473 () Bool)

(assert (=> b!547124 m!524473))

(declare-fun m!524475 () Bool)

(assert (=> b!547124 m!524475))

(declare-fun m!524477 () Bool)

(assert (=> b!547124 m!524477))

(assert (=> b!547124 m!524473))

(declare-fun m!524479 () Bool)

(assert (=> b!547124 m!524479))

(assert (=> b!547125 m!524473))

(assert (=> b!547125 m!524473))

(declare-fun m!524481 () Bool)

(assert (=> b!547125 m!524481))

(declare-fun m!524483 () Bool)

(assert (=> bm!32150 m!524483))

(assert (=> b!547053 d!82401))

(declare-fun d!82415 () Bool)

(declare-fun lt!249462 () SeekEntryResult!5033)

(assert (=> d!82415 (and (or (is-Undefined!5033 lt!249462) (not (is-Found!5033 lt!249462)) (and (bvsge (index!22360 lt!249462) #b00000000000000000000000000000000) (bvslt (index!22360 lt!249462) (size!16948 a!3118)))) (or (is-Undefined!5033 lt!249462) (is-Found!5033 lt!249462) (not (is-MissingZero!5033 lt!249462)) (and (bvsge (index!22359 lt!249462) #b00000000000000000000000000000000) (bvslt (index!22359 lt!249462) (size!16948 a!3118)))) (or (is-Undefined!5033 lt!249462) (is-Found!5033 lt!249462) (is-MissingZero!5033 lt!249462) (not (is-MissingVacant!5033 lt!249462)) (and (bvsge (index!22362 lt!249462) #b00000000000000000000000000000000) (bvslt (index!22362 lt!249462) (size!16948 a!3118)))) (or (is-Undefined!5033 lt!249462) (ite (is-Found!5033 lt!249462) (= (select (arr!16584 a!3118) (index!22360 lt!249462)) k!1914) (ite (is-MissingZero!5033 lt!249462) (= (select (arr!16584 a!3118) (index!22359 lt!249462)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5033 lt!249462) (= (select (arr!16584 a!3118) (index!22362 lt!249462)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!316175 () SeekEntryResult!5033)

(assert (=> d!82415 (= lt!249462 e!316175)))

(declare-fun c!63501 () Bool)

(declare-fun lt!249463 () SeekEntryResult!5033)

(assert (=> d!82415 (= c!63501 (and (is-Intermediate!5033 lt!249463) (undefined!5845 lt!249463)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34516 (_ BitVec 32)) SeekEntryResult!5033)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82415 (= lt!249463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82415 (validMask!0 mask!3119)))

(assert (=> d!82415 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249462)))

(declare-fun b!547182 () Bool)

(declare-fun e!316174 () SeekEntryResult!5033)

(assert (=> b!547182 (= e!316174 (MissingZero!5033 (index!22361 lt!249463)))))

(declare-fun b!547183 () Bool)

(declare-fun c!63503 () Bool)

(declare-fun lt!249461 () (_ BitVec 64))

(assert (=> b!547183 (= c!63503 (= lt!249461 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316176 () SeekEntryResult!5033)

(assert (=> b!547183 (= e!316176 e!316174)))

(declare-fun b!547184 () Bool)

(assert (=> b!547184 (= e!316175 Undefined!5033)))

(declare-fun b!547185 () Bool)

(assert (=> b!547185 (= e!316176 (Found!5033 (index!22361 lt!249463)))))

(declare-fun b!547186 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34516 (_ BitVec 32)) SeekEntryResult!5033)

(assert (=> b!547186 (= e!316174 (seekKeyOrZeroReturnVacant!0 (x!51309 lt!249463) (index!22361 lt!249463) (index!22361 lt!249463) k!1914 a!3118 mask!3119))))

(declare-fun b!547187 () Bool)

(assert (=> b!547187 (= e!316175 e!316176)))

(assert (=> b!547187 (= lt!249461 (select (arr!16584 a!3118) (index!22361 lt!249463)))))

(declare-fun c!63502 () Bool)

(assert (=> b!547187 (= c!63502 (= lt!249461 k!1914))))

(assert (= (and d!82415 c!63501) b!547184))

(assert (= (and d!82415 (not c!63501)) b!547187))

(assert (= (and b!547187 c!63502) b!547185))

(assert (= (and b!547187 (not c!63502)) b!547183))

(assert (= (and b!547183 c!63503) b!547182))

(assert (= (and b!547183 (not c!63503)) b!547186))

