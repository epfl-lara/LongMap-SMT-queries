; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49820 () Bool)

(assert start!49820)

(declare-fun b!547222 () Bool)

(declare-fun e!316198 () Bool)

(declare-fun e!316200 () Bool)

(assert (=> b!547222 (= e!316198 e!316200)))

(declare-fun res!340865 () Bool)

(assert (=> b!547222 (=> (not res!340865) (not e!316200))))

(declare-datatypes ((SeekEntryResult!5036 0))(
  ( (MissingZero!5036 (index!22371 (_ BitVec 32))) (Found!5036 (index!22372 (_ BitVec 32))) (Intermediate!5036 (undefined!5848 Bool) (index!22373 (_ BitVec 32)) (x!51320 (_ BitVec 32))) (Undefined!5036) (MissingVacant!5036 (index!22374 (_ BitVec 32))) )
))
(declare-fun lt!249475 () SeekEntryResult!5036)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547222 (= res!340865 (or (= lt!249475 (MissingZero!5036 i!1132)) (= lt!249475 (MissingVacant!5036 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34525 0))(
  ( (array!34526 (arr!16587 (Array (_ BitVec 32) (_ BitVec 64))) (size!16951 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34525)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34525 (_ BitVec 32)) SeekEntryResult!5036)

(assert (=> b!547222 (= lt!249475 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!340869 () Bool)

(assert (=> start!49820 (=> (not res!340869) (not e!316198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49820 (= res!340869 (validMask!0 mask!3119))))

(assert (=> start!49820 e!316198))

(assert (=> start!49820 true))

(declare-fun array_inv!12383 (array!34525) Bool)

(assert (=> start!49820 (array_inv!12383 a!3118)))

(declare-fun b!547223 () Bool)

(declare-fun res!340866 () Bool)

(assert (=> b!547223 (=> (not res!340866) (not e!316198))))

(declare-fun arrayContainsKey!0 (array!34525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547223 (= res!340866 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547224 () Bool)

(declare-fun res!340868 () Bool)

(assert (=> b!547224 (=> (not res!340868) (not e!316200))))

(assert (=> b!547224 (= res!340868 (and (bvsle #b00000000000000000000000000000000 (size!16951 a!3118)) (bvslt (size!16951 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547225 () Bool)

(declare-fun res!340871 () Bool)

(assert (=> b!547225 (=> (not res!340871) (not e!316200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34525 (_ BitVec 32)) Bool)

(assert (=> b!547225 (= res!340871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547226 () Bool)

(declare-fun res!340864 () Bool)

(assert (=> b!547226 (=> (not res!340864) (not e!316198))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!547226 (= res!340864 (and (= (size!16951 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16951 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16951 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547227 () Bool)

(declare-datatypes ((List!10667 0))(
  ( (Nil!10664) (Cons!10663 (h!11630 (_ BitVec 64)) (t!16895 List!10667)) )
))
(declare-fun noDuplicate!219 (List!10667) Bool)

(assert (=> b!547227 (= e!316200 (not (noDuplicate!219 Nil!10664)))))

(declare-fun b!547228 () Bool)

(declare-fun res!340867 () Bool)

(assert (=> b!547228 (=> (not res!340867) (not e!316198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547228 (= res!340867 (validKeyInArray!0 (select (arr!16587 a!3118) j!142)))))

(declare-fun b!547229 () Bool)

(declare-fun res!340870 () Bool)

(assert (=> b!547229 (=> (not res!340870) (not e!316198))))

(assert (=> b!547229 (= res!340870 (validKeyInArray!0 k!1914))))

(assert (= (and start!49820 res!340869) b!547226))

(assert (= (and b!547226 res!340864) b!547228))

(assert (= (and b!547228 res!340867) b!547229))

(assert (= (and b!547229 res!340870) b!547223))

(assert (= (and b!547223 res!340866) b!547222))

(assert (= (and b!547222 res!340865) b!547225))

(assert (= (and b!547225 res!340871) b!547224))

(assert (= (and b!547224 res!340868) b!547227))

(declare-fun m!524541 () Bool)

(assert (=> b!547229 m!524541))

(declare-fun m!524543 () Bool)

(assert (=> b!547225 m!524543))

(declare-fun m!524545 () Bool)

(assert (=> b!547228 m!524545))

(assert (=> b!547228 m!524545))

(declare-fun m!524547 () Bool)

(assert (=> b!547228 m!524547))

(declare-fun m!524549 () Bool)

(assert (=> b!547227 m!524549))

(declare-fun m!524551 () Bool)

(assert (=> b!547222 m!524551))

(declare-fun m!524553 () Bool)

(assert (=> b!547223 m!524553))

(declare-fun m!524555 () Bool)

(assert (=> start!49820 m!524555))

(declare-fun m!524557 () Bool)

(assert (=> start!49820 m!524557))

(push 1)

(assert (not b!547223))

(assert (not b!547229))

(assert (not b!547227))

(assert (not b!547228))

(assert (not start!49820))

(assert (not b!547225))

(assert (not b!547222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82443 () Bool)

(assert (=> d!82443 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49820 d!82443))

(declare-fun d!82447 () Bool)

(assert (=> d!82447 (= (array_inv!12383 a!3118) (bvsge (size!16951 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49820 d!82447))

(declare-fun d!82449 () Bool)

(declare-fun lt!249516 () SeekEntryResult!5036)

(assert (=> d!82449 (and (or (is-Undefined!5036 lt!249516) (not (is-Found!5036 lt!249516)) (and (bvsge (index!22372 lt!249516) #b00000000000000000000000000000000) (bvslt (index!22372 lt!249516) (size!16951 a!3118)))) (or (is-Undefined!5036 lt!249516) (is-Found!5036 lt!249516) (not (is-MissingZero!5036 lt!249516)) (and (bvsge (index!22371 lt!249516) #b00000000000000000000000000000000) (bvslt (index!22371 lt!249516) (size!16951 a!3118)))) (or (is-Undefined!5036 lt!249516) (is-Found!5036 lt!249516) (is-MissingZero!5036 lt!249516) (not (is-MissingVacant!5036 lt!249516)) (and (bvsge (index!22374 lt!249516) #b00000000000000000000000000000000) (bvslt (index!22374 lt!249516) (size!16951 a!3118)))) (or (is-Undefined!5036 lt!249516) (ite (is-Found!5036 lt!249516) (= (select (arr!16587 a!3118) (index!22372 lt!249516)) k!1914) (ite (is-MissingZero!5036 lt!249516) (= (select (arr!16587 a!3118) (index!22371 lt!249516)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5036 lt!249516) (= (select (arr!16587 a!3118) (index!22374 lt!249516)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!316266 () SeekEntryResult!5036)

(assert (=> d!82449 (= lt!249516 e!316266)))

(declare-fun c!63536 () Bool)

(declare-fun lt!249515 () SeekEntryResult!5036)

(assert (=> d!82449 (= c!63536 (and (is-Intermediate!5036 lt!249515) (undefined!5848 lt!249515)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34525 (_ BitVec 32)) SeekEntryResult!5036)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82449 (= lt!249515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82449 (validMask!0 mask!3119)))

(assert (=> d!82449 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249516)))

(declare-fun b!547350 () Bool)

(assert (=> b!547350 (= e!316266 Undefined!5036)))

(declare-fun b!547351 () Bool)

(declare-fun c!63534 () Bool)

(declare-fun lt!249517 () (_ BitVec 64))

(assert (=> b!547351 (= c!63534 (= lt!249517 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316265 () SeekEntryResult!5036)

(declare-fun e!316264 () SeekEntryResult!5036)

(assert (=> b!547351 (= e!316265 e!316264)))

(declare-fun b!547352 () Bool)

(assert (=> b!547352 (= e!316264 (MissingZero!5036 (index!22373 lt!249515)))))

(declare-fun b!547353 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34525 (_ BitVec 32)) SeekEntryResult!5036)

(assert (=> b!547353 (= e!316264 (seekKeyOrZeroReturnVacant!0 (x!51320 lt!249515) (index!22373 lt!249515) (index!22373 lt!249515) k!1914 a!3118 mask!3119))))

(declare-fun b!547354 () Bool)

(assert (=> b!547354 (= e!316265 (Found!5036 (index!22373 lt!249515)))))

(declare-fun b!547355 () Bool)

(assert (=> b!547355 (= e!316266 e!316265)))

(assert (=> b!547355 (= lt!249517 (select (arr!16587 a!3118) (index!22373 lt!249515)))))

(declare-fun c!63535 () Bool)

(assert (=> b!547355 (= c!63535 (= lt!249517 k!1914))))

(assert (= (and d!82449 c!63536) b!547350))

(assert (= (and d!82449 (not c!63536)) b!547355))

(assert (= (and b!547355 c!63535) b!547354))

(assert (= (and b!547355 (not c!63535)) b!547351))

(assert (= (and b!547351 c!63534) b!547352))

(assert (= (and b!547351 (not c!63534)) b!547353))

(declare-fun m!524643 () Bool)

(assert (=> d!82449 m!524643))

(declare-fun m!524645 () Bool)

(assert (=> d!82449 m!524645))

(declare-fun m!524647 () Bool)

(assert (=> d!82449 m!524647))

(assert (=> d!82449 m!524555))

(assert (=> d!82449 m!524643))

(declare-fun m!524649 () Bool)

(assert (=> d!82449 m!524649))

(declare-fun m!524651 () Bool)

(assert (=> d!82449 m!524651))

(declare-fun m!524653 () Bool)

(assert (=> b!547353 m!524653))

(declare-fun m!524655 () Bool)

(assert (=> b!547355 m!524655))

(assert (=> b!547222 d!82449))

(declare-fun d!82467 () Bool)

(declare-fun res!340942 () Bool)

(declare-fun e!316271 () Bool)

(assert (=> d!82467 (=> res!340942 e!316271)))

(assert (=> d!82467 (= res!340942 (is-Nil!10664 Nil!10664))))

(assert (=> d!82467 (= (noDuplicate!219 Nil!10664) e!316271)))

(declare-fun b!547360 () Bool)

(declare-fun e!316272 () Bool)

(assert (=> b!547360 (= e!316271 e!316272)))

(declare-fun res!340943 () Bool)

(assert (=> b!547360 (=> (not res!340943) (not e!316272))))

(declare-fun contains!2816 (List!10667 (_ BitVec 64)) Bool)

(assert (=> b!547360 (= res!340943 (not (contains!2816 (t!16895 Nil!10664) (h!11630 Nil!10664))))))

(declare-fun b!547361 () Bool)

(assert (=> b!547361 (= e!316272 (noDuplicate!219 (t!16895 Nil!10664)))))

(assert (= (and d!82467 (not res!340942)) b!547360))

(assert (= (and b!547360 res!340943) b!547361))

(declare-fun m!524657 () Bool)

(assert (=> b!547360 m!524657))

(declare-fun m!524659 () Bool)

(assert (=> b!547361 m!524659))

(assert (=> b!547227 d!82467))

(declare-fun b!547382 () Bool)

(declare-fun e!316292 () Bool)

(declare-fun call!32162 () Bool)

(assert (=> b!547382 (= e!316292 call!32162)))

(declare-fun b!547383 () Bool)

(declare-fun e!316291 () Bool)

(declare-fun e!316293 () Bool)

(assert (=> b!547383 (= e!316291 e!316293)))

(declare-fun c!63539 () Bool)

(assert (=> b!547383 (= c!63539 (validKeyInArray!0 (select (arr!16587 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547384 () Bool)

(assert (=> b!547384 (= e!316293 call!32162)))

(declare-fun b!547385 () Bool)

(assert (=> b!547385 (= e!316293 e!316292)))

(declare-fun lt!249525 () (_ BitVec 64))

(assert (=> b!547385 (= lt!249525 (select (arr!16587 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16954 0))(
  ( (Unit!16955) )
))
(declare-fun lt!249526 () Unit!16954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34525 (_ BitVec 64) (_ BitVec 32)) Unit!16954)

(assert (=> b!547385 (= lt!249526 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249525 #b00000000000000000000000000000000))))

(assert (=> b!547385 (arrayContainsKey!0 a!3118 lt!249525 #b00000000000000000000000000000000)))

(declare-fun lt!249524 () Unit!16954)

(assert (=> b!547385 (= lt!249524 lt!249526)))

(declare-fun res!340960 () Bool)

(assert (=> b!547385 (= res!340960 (= (seekEntryOrOpen!0 (select (arr!16587 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5036 #b00000000000000000000000000000000)))))

(assert (=> b!547385 (=> (not res!340960) (not e!316292))))

(declare-fun bm!32159 () Bool)

(assert (=> bm!32159 (= call!32162 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!82473 () Bool)

(declare-fun res!340961 () Bool)

(assert (=> d!82473 (=> res!340961 e!316291)))

(assert (=> d!82473 (= res!340961 (bvsge #b00000000000000000000000000000000 (size!16951 a!3118)))))

(assert (=> d!82473 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316291)))

(assert (= (and d!82473 (not res!340961)) b!547383))

(assert (= (and b!547383 c!63539) b!547385))

(assert (= (and b!547383 (not c!63539)) b!547384))

(assert (= (and b!547385 res!340960) b!547382))

(assert (= (or b!547382 b!547384) bm!32159))

(declare-fun m!524667 () Bool)

(assert (=> b!547383 m!524667))

(assert (=> b!547383 m!524667))

(declare-fun m!524669 () Bool)

(assert (=> b!547383 m!524669))

(assert (=> b!547385 m!524667))

(declare-fun m!524671 () Bool)

(assert (=> b!547385 m!524671))

(declare-fun m!524673 () Bool)

(assert (=> b!547385 m!524673))

(assert (=> b!547385 m!524667))

(declare-fun m!524675 () Bool)

(assert (=> b!547385 m!524675))

(declare-fun m!524677 () Bool)

(assert (=> bm!32159 m!524677))

(assert (=> b!547225 d!82473))

(declare-fun d!82483 () Bool)

(assert (=> d!82483 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547229 d!82483))

(declare-fun d!82485 () Bool)

(assert (=> d!82485 (= (validKeyInArray!0 (select (arr!16587 a!3118) j!142)) (and (not (= (select (arr!16587 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16587 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547228 d!82485))

(declare-fun d!82487 () Bool)

(declare-fun res!340970 () Bool)

(declare-fun e!316304 () Bool)

(assert (=> d!82487 (=> res!340970 e!316304)))

(assert (=> d!82487 (= res!340970 (= (select (arr!16587 a!3118) #b00000000000000000000000000000000) k!1914))))

