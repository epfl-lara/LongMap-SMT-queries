; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49824 () Bool)

(assert start!49824)

(declare-fun b!547270 () Bool)

(declare-fun e!316217 () Bool)

(declare-datatypes ((List!10669 0))(
  ( (Nil!10666) (Cons!10665 (h!11632 (_ BitVec 64)) (t!16897 List!10669)) )
))
(declare-fun noDuplicate!221 (List!10669) Bool)

(assert (=> b!547270 (= e!316217 (not (noDuplicate!221 Nil!10666)))))

(declare-fun b!547272 () Bool)

(declare-fun res!340914 () Bool)

(assert (=> b!547272 (=> (not res!340914) (not e!316217))))

(declare-datatypes ((array!34529 0))(
  ( (array!34530 (arr!16589 (Array (_ BitVec 32) (_ BitVec 64))) (size!16953 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34529)

(assert (=> b!547272 (= res!340914 (and (bvsle #b00000000000000000000000000000000 (size!16953 a!3118)) (bvslt (size!16953 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547273 () Bool)

(declare-fun res!340918 () Bool)

(assert (=> b!547273 (=> (not res!340918) (not e!316217))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34529 (_ BitVec 32)) Bool)

(assert (=> b!547273 (= res!340918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547274 () Bool)

(declare-fun res!340913 () Bool)

(declare-fun e!316218 () Bool)

(assert (=> b!547274 (=> (not res!340913) (not e!316218))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547274 (= res!340913 (and (= (size!16953 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16953 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16953 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547275 () Bool)

(declare-fun res!340916 () Bool)

(assert (=> b!547275 (=> (not res!340916) (not e!316218))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547275 (= res!340916 (validKeyInArray!0 k!1914))))

(declare-fun b!547276 () Bool)

(declare-fun res!340915 () Bool)

(assert (=> b!547276 (=> (not res!340915) (not e!316218))))

(assert (=> b!547276 (= res!340915 (validKeyInArray!0 (select (arr!16589 a!3118) j!142)))))

(declare-fun b!547277 () Bool)

(assert (=> b!547277 (= e!316218 e!316217)))

(declare-fun res!340917 () Bool)

(assert (=> b!547277 (=> (not res!340917) (not e!316217))))

(declare-datatypes ((SeekEntryResult!5038 0))(
  ( (MissingZero!5038 (index!22379 (_ BitVec 32))) (Found!5038 (index!22380 (_ BitVec 32))) (Intermediate!5038 (undefined!5850 Bool) (index!22381 (_ BitVec 32)) (x!51322 (_ BitVec 32))) (Undefined!5038) (MissingVacant!5038 (index!22382 (_ BitVec 32))) )
))
(declare-fun lt!249481 () SeekEntryResult!5038)

(assert (=> b!547277 (= res!340917 (or (= lt!249481 (MissingZero!5038 i!1132)) (= lt!249481 (MissingVacant!5038 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34529 (_ BitVec 32)) SeekEntryResult!5038)

(assert (=> b!547277 (= lt!249481 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!547271 () Bool)

(declare-fun res!340912 () Bool)

(assert (=> b!547271 (=> (not res!340912) (not e!316218))))

(declare-fun arrayContainsKey!0 (array!34529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547271 (= res!340912 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!340919 () Bool)

(assert (=> start!49824 (=> (not res!340919) (not e!316218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49824 (= res!340919 (validMask!0 mask!3119))))

(assert (=> start!49824 e!316218))

(assert (=> start!49824 true))

(declare-fun array_inv!12385 (array!34529) Bool)

(assert (=> start!49824 (array_inv!12385 a!3118)))

(assert (= (and start!49824 res!340919) b!547274))

(assert (= (and b!547274 res!340913) b!547276))

(assert (= (and b!547276 res!340915) b!547275))

(assert (= (and b!547275 res!340916) b!547271))

(assert (= (and b!547271 res!340912) b!547277))

(assert (= (and b!547277 res!340917) b!547273))

(assert (= (and b!547273 res!340918) b!547272))

(assert (= (and b!547272 res!340914) b!547270))

(declare-fun m!524577 () Bool)

(assert (=> b!547275 m!524577))

(declare-fun m!524579 () Bool)

(assert (=> b!547276 m!524579))

(assert (=> b!547276 m!524579))

(declare-fun m!524581 () Bool)

(assert (=> b!547276 m!524581))

(declare-fun m!524583 () Bool)

(assert (=> b!547271 m!524583))

(declare-fun m!524585 () Bool)

(assert (=> start!49824 m!524585))

(declare-fun m!524587 () Bool)

(assert (=> start!49824 m!524587))

(declare-fun m!524589 () Bool)

(assert (=> b!547273 m!524589))

(declare-fun m!524591 () Bool)

(assert (=> b!547277 m!524591))

(declare-fun m!524593 () Bool)

(assert (=> b!547270 m!524593))

(push 1)

(assert (not b!547271))

(assert (not b!547277))

(assert (not b!547276))

(assert (not start!49824))

(assert (not b!547275))

(assert (not b!547270))

(assert (not b!547273))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!547316 () Bool)

(declare-fun e!316242 () SeekEntryResult!5038)

(declare-fun e!316240 () SeekEntryResult!5038)

(assert (=> b!547316 (= e!316242 e!316240)))

(declare-fun lt!249505 () (_ BitVec 64))

(declare-fun lt!249503 () SeekEntryResult!5038)

(assert (=> b!547316 (= lt!249505 (select (arr!16589 a!3118) (index!22381 lt!249503)))))

(declare-fun c!63525 () Bool)

(assert (=> b!547316 (= c!63525 (= lt!249505 k!1914))))

(declare-fun b!547317 () Bool)

(assert (=> b!547317 (= e!316240 (Found!5038 (index!22381 lt!249503)))))

(declare-fun d!82445 () Bool)

(declare-fun lt!249504 () SeekEntryResult!5038)

(assert (=> d!82445 (and (or (is-Undefined!5038 lt!249504) (not (is-Found!5038 lt!249504)) (and (bvsge (index!22380 lt!249504) #b00000000000000000000000000000000) (bvslt (index!22380 lt!249504) (size!16953 a!3118)))) (or (is-Undefined!5038 lt!249504) (is-Found!5038 lt!249504) (not (is-MissingZero!5038 lt!249504)) (and (bvsge (index!22379 lt!249504) #b00000000000000000000000000000000) (bvslt (index!22379 lt!249504) (size!16953 a!3118)))) (or (is-Undefined!5038 lt!249504) (is-Found!5038 lt!249504) (is-MissingZero!5038 lt!249504) (not (is-MissingVacant!5038 lt!249504)) (and (bvsge (index!22382 lt!249504) #b00000000000000000000000000000000) (bvslt (index!22382 lt!249504) (size!16953 a!3118)))) (or (is-Undefined!5038 lt!249504) (ite (is-Found!5038 lt!249504) (= (select (arr!16589 a!3118) (index!22380 lt!249504)) k!1914) (ite (is-MissingZero!5038 lt!249504) (= (select (arr!16589 a!3118) (index!22379 lt!249504)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5038 lt!249504) (= (select (arr!16589 a!3118) (index!22382 lt!249504)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82445 (= lt!249504 e!316242)))

(declare-fun c!63526 () Bool)

(assert (=> d!82445 (= c!63526 (and (is-Intermediate!5038 lt!249503) (undefined!5850 lt!249503)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34529 (_ BitVec 32)) SeekEntryResult!5038)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82445 (= lt!249503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82445 (validMask!0 mask!3119)))

(assert (=> d!82445 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249504)))

(declare-fun b!547318 () Bool)

(declare-fun e!316241 () SeekEntryResult!5038)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34529 (_ BitVec 32)) SeekEntryResult!5038)

(assert (=> b!547318 (= e!316241 (seekKeyOrZeroReturnVacant!0 (x!51322 lt!249503) (index!22381 lt!249503) (index!22381 lt!249503) k!1914 a!3118 mask!3119))))

(declare-fun b!547319 () Bool)

(assert (=> b!547319 (= e!316241 (MissingZero!5038 (index!22381 lt!249503)))))

(declare-fun b!547320 () Bool)

(declare-fun c!63524 () Bool)

(assert (=> b!547320 (= c!63524 (= lt!249505 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!547320 (= e!316240 e!316241)))

(declare-fun b!547321 () Bool)

(assert (=> b!547321 (= e!316242 Undefined!5038)))

(assert (= (and d!82445 c!63526) b!547321))

(assert (= (and d!82445 (not c!63526)) b!547316))

(assert (= (and b!547316 c!63525) b!547317))

(assert (= (and b!547316 (not c!63525)) b!547320))

(assert (= (and b!547320 c!63524) b!547319))

(assert (= (and b!547320 (not c!63524)) b!547318))

(declare-fun m!524609 () Bool)

(assert (=> b!547316 m!524609))

(assert (=> d!82445 m!524585))

(declare-fun m!524611 () Bool)

(assert (=> d!82445 m!524611))

(declare-fun m!524613 () Bool)

(assert (=> d!82445 m!524613))

(declare-fun m!524615 () Bool)

(assert (=> d!82445 m!524615))

(assert (=> d!82445 m!524613))

(declare-fun m!524617 () Bool)

(assert (=> d!82445 m!524617))

(declare-fun m!524619 () Bool)

(assert (=> d!82445 m!524619))

(declare-fun m!524621 () Bool)

(assert (=> b!547318 m!524621))

(assert (=> b!547277 d!82445))

(declare-fun d!82457 () Bool)

(assert (=> d!82457 (= (validKeyInArray!0 (select (arr!16589 a!3118) j!142)) (and (not (= (select (arr!16589 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16589 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547276 d!82457))

(declare-fun d!82461 () Bool)

(declare-fun res!340930 () Bool)

(declare-fun e!316250 () Bool)

(assert (=> d!82461 (=> res!340930 e!316250)))

(assert (=> d!82461 (= res!340930 (= (select (arr!16589 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82461 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!316250)))

(declare-fun b!547330 () Bool)

(declare-fun e!316251 () Bool)

(assert (=> b!547330 (= e!316250 e!316251)))

(declare-fun res!340931 () Bool)

(assert (=> b!547330 (=> (not res!340931) (not e!316251))))

(assert (=> b!547330 (= res!340931 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16953 a!3118)))))

(declare-fun b!547331 () Bool)

(assert (=> b!547331 (= e!316251 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82461 (not res!340930)) b!547330))

(assert (= (and b!547330 res!340931) b!547331))

(declare-fun m!524635 () Bool)

(assert (=> d!82461 m!524635))

(declare-fun m!524637 () Bool)

(assert (=> b!547331 m!524637))

(assert (=> b!547271 d!82461))

(declare-fun d!82463 () Bool)

(declare-fun res!340936 () Bool)

(declare-fun e!316262 () Bool)

(assert (=> d!82463 (=> res!340936 e!316262)))

(assert (=> d!82463 (= res!340936 (is-Nil!10666 Nil!10666))))

(assert (=> d!82463 (= (noDuplicate!221 Nil!10666) e!316262)))

(declare-fun b!547348 () Bool)

(declare-fun e!316263 () Bool)

(assert (=> b!547348 (= e!316262 e!316263)))

(declare-fun res!340937 () Bool)

(assert (=> b!547348 (=> (not res!340937) (not e!316263))))

(declare-fun contains!2818 (List!10669 (_ BitVec 64)) Bool)

(assert (=> b!547348 (= res!340937 (not (contains!2818 (t!16897 Nil!10666) (h!11632 Nil!10666))))))

(declare-fun b!547349 () Bool)

(assert (=> b!547349 (= e!316263 (noDuplicate!221 (t!16897 Nil!10666)))))

(assert (= (and d!82463 (not res!340936)) b!547348))

(assert (= (and b!547348 res!340937) b!547349))

(declare-fun m!524639 () Bool)

(assert (=> b!547348 m!524639))

(declare-fun m!524641 () Bool)

(assert (=> b!547349 m!524641))

(assert (=> b!547270 d!82463))

(declare-fun d!82465 () Bool)

(assert (=> d!82465 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

