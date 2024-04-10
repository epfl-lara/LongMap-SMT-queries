; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49998 () Bool)

(assert start!49998)

(declare-fun b!548221 () Bool)

(declare-fun e!316728 () Bool)

(declare-fun e!316727 () Bool)

(assert (=> b!548221 (= e!316728 e!316727)))

(declare-fun res!341629 () Bool)

(assert (=> b!548221 (=> (not res!341629) (not e!316727))))

(declare-datatypes ((SeekEntryResult!5059 0))(
  ( (MissingZero!5059 (index!22463 (_ BitVec 32))) (Found!5059 (index!22464 (_ BitVec 32))) (Intermediate!5059 (undefined!5871 Bool) (index!22465 (_ BitVec 32)) (x!51399 (_ BitVec 32))) (Undefined!5059) (MissingVacant!5059 (index!22466 (_ BitVec 32))) )
))
(declare-fun lt!249754 () SeekEntryResult!5059)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548221 (= res!341629 (or (= lt!249754 (MissingZero!5059 i!1132)) (= lt!249754 (MissingVacant!5059 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34580 0))(
  ( (array!34581 (arr!16610 (Array (_ BitVec 32) (_ BitVec 64))) (size!16974 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34580)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34580 (_ BitVec 32)) SeekEntryResult!5059)

(assert (=> b!548221 (= lt!249754 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!548222 () Bool)

(declare-fun res!341631 () Bool)

(assert (=> b!548222 (=> (not res!341631) (not e!316728))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548222 (= res!341631 (validKeyInArray!0 (select (arr!16610 a!3118) j!142)))))

(declare-fun b!548223 () Bool)

(declare-fun lt!249753 () (_ BitVec 32))

(assert (=> b!548223 (= e!316727 (and (bvsge mask!3119 #b00000000000000000000000000000000) (or (bvslt lt!249753 #b00000000000000000000000000000000) (bvsge lt!249753 (bvadd #b00000000000000000000000000000001 mask!3119)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548223 (= lt!249753 (toIndex!0 (select (arr!16610 a!3118) j!142) mask!3119))))

(declare-fun b!548224 () Bool)

(declare-fun res!341634 () Bool)

(assert (=> b!548224 (=> (not res!341634) (not e!316728))))

(assert (=> b!548224 (= res!341634 (validKeyInArray!0 k!1914))))

(declare-fun b!548226 () Bool)

(declare-fun res!341633 () Bool)

(assert (=> b!548226 (=> (not res!341633) (not e!316728))))

(declare-fun arrayContainsKey!0 (array!34580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548226 (= res!341633 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548227 () Bool)

(declare-fun res!341636 () Bool)

(assert (=> b!548227 (=> (not res!341636) (not e!316727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34580 (_ BitVec 32)) Bool)

(assert (=> b!548227 (= res!341636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548228 () Bool)

(declare-fun res!341632 () Bool)

(assert (=> b!548228 (=> (not res!341632) (not e!316728))))

(assert (=> b!548228 (= res!341632 (and (= (size!16974 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16974 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16974 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548225 () Bool)

(declare-fun res!341635 () Bool)

(assert (=> b!548225 (=> (not res!341635) (not e!316727))))

(declare-datatypes ((List!10690 0))(
  ( (Nil!10687) (Cons!10686 (h!11653 (_ BitVec 64)) (t!16918 List!10690)) )
))
(declare-fun arrayNoDuplicates!0 (array!34580 (_ BitVec 32) List!10690) Bool)

(assert (=> b!548225 (= res!341635 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10687))))

(declare-fun res!341630 () Bool)

(assert (=> start!49998 (=> (not res!341630) (not e!316728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49998 (= res!341630 (validMask!0 mask!3119))))

(assert (=> start!49998 e!316728))

(assert (=> start!49998 true))

(declare-fun array_inv!12406 (array!34580) Bool)

(assert (=> start!49998 (array_inv!12406 a!3118)))

(assert (= (and start!49998 res!341630) b!548228))

(assert (= (and b!548228 res!341632) b!548222))

(assert (= (and b!548222 res!341631) b!548224))

(assert (= (and b!548224 res!341634) b!548226))

(assert (= (and b!548226 res!341633) b!548221))

(assert (= (and b!548221 res!341629) b!548227))

(assert (= (and b!548227 res!341636) b!548225))

(assert (= (and b!548225 res!341635) b!548223))

(declare-fun m!525307 () Bool)

(assert (=> b!548221 m!525307))

(declare-fun m!525309 () Bool)

(assert (=> b!548222 m!525309))

(assert (=> b!548222 m!525309))

(declare-fun m!525311 () Bool)

(assert (=> b!548222 m!525311))

(assert (=> b!548223 m!525309))

(assert (=> b!548223 m!525309))

(declare-fun m!525313 () Bool)

(assert (=> b!548223 m!525313))

(declare-fun m!525315 () Bool)

(assert (=> b!548225 m!525315))

(declare-fun m!525317 () Bool)

(assert (=> b!548227 m!525317))

(declare-fun m!525319 () Bool)

(assert (=> b!548226 m!525319))

(declare-fun m!525321 () Bool)

(assert (=> b!548224 m!525321))

(declare-fun m!525323 () Bool)

(assert (=> start!49998 m!525323))

(declare-fun m!525325 () Bool)

(assert (=> start!49998 m!525325))

(push 1)

(assert (not b!548224))

(assert (not b!548223))

(assert (not start!49998))

(assert (not b!548226))

(assert (not b!548221))

(assert (not b!548227))

(assert (not b!548225))

(assert (not b!548222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82617 () Bool)

(declare-fun res!341650 () Bool)

(declare-fun e!316745 () Bool)

(assert (=> d!82617 (=> res!341650 e!316745)))

(assert (=> d!82617 (= res!341650 (bvsge #b00000000000000000000000000000000 (size!16974 a!3118)))))

(assert (=> d!82617 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10687) e!316745)))

(declare-fun bm!32192 () Bool)

(declare-fun call!32195 () Bool)

(declare-fun c!63626 () Bool)

(assert (=> bm!32192 (= call!32195 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63626 (Cons!10686 (select (arr!16610 a!3118) #b00000000000000000000000000000000) Nil!10687) Nil!10687)))))

(declare-fun b!548245 () Bool)

(declare-fun e!316743 () Bool)

(declare-fun e!316744 () Bool)

(assert (=> b!548245 (= e!316743 e!316744)))

(assert (=> b!548245 (= c!63626 (validKeyInArray!0 (select (arr!16610 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548246 () Bool)

(assert (=> b!548246 (= e!316745 e!316743)))

(declare-fun res!341652 () Bool)

(assert (=> b!548246 (=> (not res!341652) (not e!316743))))

(declare-fun e!316746 () Bool)

(assert (=> b!548246 (= res!341652 (not e!316746))))

(declare-fun res!341651 () Bool)

(assert (=> b!548246 (=> (not res!341651) (not e!316746))))

(assert (=> b!548246 (= res!341651 (validKeyInArray!0 (select (arr!16610 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548247 () Bool)

(assert (=> b!548247 (= e!316744 call!32195)))

(declare-fun b!548248 () Bool)

(declare-fun contains!2824 (List!10690 (_ BitVec 64)) Bool)

(assert (=> b!548248 (= e!316746 (contains!2824 Nil!10687 (select (arr!16610 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548249 () Bool)

(assert (=> b!548249 (= e!316744 call!32195)))

(assert (= (and d!82617 (not res!341650)) b!548246))

(assert (= (and b!548246 res!341651) b!548248))

(assert (= (and b!548246 res!341652) b!548245))

(assert (= (and b!548245 c!63626) b!548249))

(assert (= (and b!548245 (not c!63626)) b!548247))

(assert (= (or b!548249 b!548247) bm!32192))

(declare-fun m!525331 () Bool)

(assert (=> bm!32192 m!525331))

(declare-fun m!525333 () Bool)

(assert (=> bm!32192 m!525333))

(assert (=> b!548245 m!525331))

(assert (=> b!548245 m!525331))

(declare-fun m!525335 () Bool)

(assert (=> b!548245 m!525335))

(assert (=> b!548246 m!525331))

(assert (=> b!548246 m!525331))

(assert (=> b!548246 m!525335))

(assert (=> b!548248 m!525331))

(assert (=> b!548248 m!525331))

(declare-fun m!525337 () Bool)

(assert (=> b!548248 m!525337))

(assert (=> b!548225 d!82617))

(declare-fun d!82623 () Bool)

(declare-fun res!341657 () Bool)

(declare-fun e!316757 () Bool)

(assert (=> d!82623 (=> res!341657 e!316757)))

(assert (=> d!82623 (= res!341657 (= (select (arr!16610 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82623 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!316757)))

(declare-fun b!548266 () Bool)

(declare-fun e!316758 () Bool)

(assert (=> b!548266 (= e!316757 e!316758)))

(declare-fun res!341658 () Bool)

(assert (=> b!548266 (=> (not res!341658) (not e!316758))))

(assert (=> b!548266 (= res!341658 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16974 a!3118)))))

(declare-fun b!548267 () Bool)

(assert (=> b!548267 (= e!316758 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82623 (not res!341657)) b!548266))

(assert (= (and b!548266 res!341658) b!548267))

(assert (=> d!82623 m!525331))

(declare-fun m!525339 () Bool)

(assert (=> b!548267 m!525339))

(assert (=> b!548226 d!82623))

(declare-fun b!548326 () Bool)

(declare-fun c!63652 () Bool)

(declare-fun lt!249796 () (_ BitVec 64))

(assert (=> b!548326 (= c!63652 (= lt!249796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316800 () SeekEntryResult!5059)

(declare-fun e!316802 () SeekEntryResult!5059)

(assert (=> b!548326 (= e!316800 e!316802)))

(declare-fun d!82625 () Bool)

(declare-fun lt!249794 () SeekEntryResult!5059)

(assert (=> d!82625 (and (or (is-Undefined!5059 lt!249794) (not (is-Found!5059 lt!249794)) (and (bvsge (index!22464 lt!249794) #b00000000000000000000000000000000) (bvslt (index!22464 lt!249794) (size!16974 a!3118)))) (or (is-Undefined!5059 lt!249794) (is-Found!5059 lt!249794) (not (is-MissingZero!5059 lt!249794)) (and (bvsge (index!22463 lt!249794) #b00000000000000000000000000000000) (bvslt (index!22463 lt!249794) (size!16974 a!3118)))) (or (is-Undefined!5059 lt!249794) (is-Found!5059 lt!249794) (is-MissingZero!5059 lt!249794) (not (is-MissingVacant!5059 lt!249794)) (and (bvsge (index!22466 lt!249794) #b00000000000000000000000000000000) (bvslt (index!22466 lt!249794) (size!16974 a!3118)))) (or (is-Undefined!5059 lt!249794) (ite (is-Found!5059 lt!249794) (= (select (arr!16610 a!3118) (index!22464 lt!249794)) k!1914) (ite (is-MissingZero!5059 lt!249794) (= (select (arr!16610 a!3118) (index!22463 lt!249794)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5059 lt!249794) (= (select (arr!16610 a!3118) (index!22466 lt!249794)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!316801 () SeekEntryResult!5059)

(assert (=> d!82625 (= lt!249794 e!316801)))

(declare-fun c!63651 () Bool)

(declare-fun lt!249795 () SeekEntryResult!5059)

(assert (=> d!82625 (= c!63651 (and (is-Intermediate!5059 lt!249795) (undefined!5871 lt!249795)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34580 (_ BitVec 32)) SeekEntryResult!5059)

(assert (=> d!82625 (= lt!249795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82625 (validMask!0 mask!3119)))

(assert (=> d!82625 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249794)))

(declare-fun b!548327 () Bool)

(assert (=> b!548327 (= e!316800 (Found!5059 (index!22465 lt!249795)))))

(declare-fun b!548328 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34580 (_ BitVec 32)) SeekEntryResult!5059)

(assert (=> b!548328 (= e!316802 (seekKeyOrZeroReturnVacant!0 (x!51399 lt!249795) (index!22465 lt!249795) (index!22465 lt!249795) k!1914 a!3118 mask!3119))))

(declare-fun b!548329 () Bool)

(assert (=> b!548329 (= e!316801 Undefined!5059)))

(declare-fun b!548330 () Bool)

(assert (=> b!548330 (= e!316801 e!316800)))

(assert (=> b!548330 (= lt!249796 (select (arr!16610 a!3118) (index!22465 lt!249795)))))

(declare-fun c!63650 () Bool)

(assert (=> b!548330 (= c!63650 (= lt!249796 k!1914))))

(declare-fun b!548331 () Bool)

(assert (=> b!548331 (= e!316802 (MissingZero!5059 (index!22465 lt!249795)))))

(assert (= (and d!82625 c!63651) b!548329))

(assert (= (and d!82625 (not c!63651)) b!548330))

(assert (= (and b!548330 c!63650) b!548327))

(assert (= (and b!548330 (not c!63650)) b!548326))

(assert (= (and b!548326 c!63652) b!548331))

(assert (= (and b!548326 (not c!63652)) b!548328))

(declare-fun m!525379 () Bool)

(assert (=> d!82625 m!525379))

(declare-fun m!525381 () Bool)

(assert (=> d!82625 m!525381))

(declare-fun m!525383 () Bool)

(assert (=> d!82625 m!525383))

(assert (=> d!82625 m!525323))

(assert (=> d!82625 m!525381))

(declare-fun m!525385 () Bool)

(assert (=> d!82625 m!525385))

(declare-fun m!525387 () Bool)

(assert (=> d!82625 m!525387))

(declare-fun m!525389 () Bool)

(assert (=> b!548328 m!525389))

(declare-fun m!525391 () Bool)

(assert (=> b!548330 m!525391))

(assert (=> b!548221 d!82625))

(declare-fun d!82641 () Bool)

(assert (=> d!82641 (= (validKeyInArray!0 (select (arr!16610 a!3118) j!142)) (and (not (= (select (arr!16610 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16610 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548222 d!82641))

(declare-fun d!82643 () Bool)

(declare-fun res!341691 () Bool)

(declare-fun e!316815 () Bool)

(assert (=> d!82643 (=> res!341691 e!316815)))

(assert (=> d!82643 (= res!341691 (bvsge #b00000000000000000000000000000000 (size!16974 a!3118)))))

(assert (=> d!82643 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316815)))

(declare-fun b!548345 () Bool)

(declare-fun e!316813 () Bool)

(declare-fun call!32207 () Bool)

(assert (=> b!548345 (= e!316813 call!32207)))

(declare-fun bm!32204 () Bool)

(assert (=> bm!32204 (= call!32207 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!548346 () Bool)

(declare-fun e!316814 () Bool)

(assert (=> b!548346 (= e!316814 call!32207)))

(declare-fun b!548347 () Bool)

(assert (=> b!548347 (= e!316815 e!316814)))

(declare-fun c!63656 () Bool)

(assert (=> b!548347 (= c!63656 (validKeyInArray!0 (select (arr!16610 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!548348 () Bool)

(assert (=> b!548348 (= e!316814 e!316813)))

(declare-fun lt!249804 () (_ BitVec 64))

(assert (=> b!548348 (= lt!249804 (select (arr!16610 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16970 0))(
  ( (Unit!16971) )
))
(declare-fun lt!249805 () Unit!16970)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34580 (_ BitVec 64) (_ BitVec 32)) Unit!16970)

(assert (=> b!548348 (= lt!249805 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249804 #b00000000000000000000000000000000))))

(assert (=> b!548348 (arrayContainsKey!0 a!3118 lt!249804 #b00000000000000000000000000000000)))

(declare-fun lt!249803 () Unit!16970)

(assert (=> b!548348 (= lt!249803 lt!249805)))

(declare-fun res!341690 () Bool)

(assert (=> b!548348 (= res!341690 (= (seekEntryOrOpen!0 (select (arr!16610 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5059 #b00000000000000000000000000000000)))))

(assert (=> b!548348 (=> (not res!341690) (not e!316813))))

(assert (= (and d!82643 (not res!341691)) b!548347))

(assert (= (and b!548347 c!63656) b!548348))

(assert (= (and b!548347 (not c!63656)) b!548346))

(assert (= (and b!548348 res!341690) b!548345))

(assert (= (or b!548345 b!548346) bm!32204))

(declare-fun m!525397 () Bool)

(assert (=> bm!32204 m!525397))

(assert (=> b!548347 m!525331))

(assert (=> b!548347 m!525331))

(assert (=> b!548347 m!525335))

(assert (=> b!548348 m!525331))

(declare-fun m!525399 () Bool)

(assert (=> b!548348 m!525399))

(declare-fun m!525401 () Bool)

(assert (=> b!548348 m!525401))

(assert (=> b!548348 m!525331))

(declare-fun m!525403 () Bool)

(assert (=> b!548348 m!525403))

(assert (=> b!548227 d!82643))

(declare-fun d!82649 () Bool)

(declare-fun lt!249820 () (_ BitVec 32))

(declare-fun lt!249819 () (_ BitVec 32))

(assert (=> d!82649 (= lt!249820 (bvmul (bvxor lt!249819 (bvlshr lt!249819 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82649 (= lt!249819 ((_ extract 31 0) (bvand (bvxor (select (arr!16610 a!3118) j!142) (bvlshr (select (arr!16610 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82649 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!341692 (let ((h!11655 ((_ extract 31 0) (bvand (bvxor (select (arr!16610 a!3118) j!142) (bvlshr (select (arr!16610 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51401 (bvmul (bvxor h!11655 (bvlshr h!11655 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51401 (bvlshr x!51401 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!341692 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!341692 #b00000000000000000000000000000000))))))

(assert (=> d!82649 (= (toIndex!0 (select (arr!16610 a!3118) j!142) mask!3119) (bvand (bvxor lt!249820 (bvlshr lt!249820 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!548223 d!82649))

(declare-fun d!82655 () Bool)

(assert (=> d!82655 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!548224 d!82655))

(declare-fun d!82657 () Bool)

(assert (=> d!82657 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49998 d!82657))

(declare-fun d!82663 () Bool)

(assert (=> d!82663 (= (array_inv!12406 a!3118) (bvsge (size!16974 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49998 d!82663))

(push 1)

