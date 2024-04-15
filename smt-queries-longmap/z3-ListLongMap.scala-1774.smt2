; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32276 () Bool)

(assert start!32276)

(declare-fun b!321519 () Bool)

(declare-fun res!175794 () Bool)

(declare-fun e!199109 () Bool)

(assert (=> b!321519 (=> (not res!175794) (not e!199109))))

(declare-datatypes ((array!16470 0))(
  ( (array!16471 (arr!7794 (Array (_ BitVec 32) (_ BitVec 64))) (size!8147 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16470)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16470 (_ BitVec 32)) Bool)

(assert (=> b!321519 (= res!175794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321520 () Bool)

(declare-fun res!175786 () Bool)

(assert (=> b!321520 (=> (not res!175786) (not e!199109))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2924 0))(
  ( (MissingZero!2924 (index!13872 (_ BitVec 32))) (Found!2924 (index!13873 (_ BitVec 32))) (Intermediate!2924 (undefined!3736 Bool) (index!13874 (_ BitVec 32)) (x!32146 (_ BitVec 32))) (Undefined!2924) (MissingVacant!2924 (index!13875 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16470 (_ BitVec 32)) SeekEntryResult!2924)

(assert (=> b!321520 (= res!175786 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2924 i!1250)))))

(declare-fun b!321521 () Bool)

(declare-fun res!175793 () Bool)

(declare-fun e!199107 () Bool)

(assert (=> b!321521 (=> (not res!175793) (not e!199107))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321521 (= res!175793 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7794 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7794 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7794 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321522 () Bool)

(declare-fun res!175788 () Bool)

(assert (=> b!321522 (=> (not res!175788) (not e!199109))))

(assert (=> b!321522 (= res!175788 (and (= (size!8147 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8147 a!3305))))))

(declare-fun b!321523 () Bool)

(declare-fun res!175787 () Bool)

(assert (=> b!321523 (=> (not res!175787) (not e!199107))))

(assert (=> b!321523 (= res!175787 (and (= (select (arr!7794 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8147 a!3305))))))

(declare-fun b!321524 () Bool)

(declare-fun res!175785 () Bool)

(assert (=> b!321524 (=> (not res!175785) (not e!199109))))

(declare-fun arrayContainsKey!0 (array!16470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321524 (= res!175785 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!175792 () Bool)

(assert (=> start!32276 (=> (not res!175792) (not e!199109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32276 (= res!175792 (validMask!0 mask!3777))))

(assert (=> start!32276 e!199109))

(declare-fun array_inv!5766 (array!16470) Bool)

(assert (=> start!32276 (array_inv!5766 a!3305)))

(assert (=> start!32276 true))

(declare-fun b!321525 () Bool)

(declare-fun res!175789 () Bool)

(assert (=> b!321525 (=> (not res!175789) (not e!199109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321525 (= res!175789 (validKeyInArray!0 k0!2497))))

(declare-fun b!321526 () Bool)

(declare-fun res!175790 () Bool)

(assert (=> b!321526 (=> (not res!175790) (not e!199107))))

(declare-fun lt!156025 () SeekEntryResult!2924)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16470 (_ BitVec 32)) SeekEntryResult!2924)

(assert (=> b!321526 (= res!175790 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156025))))

(declare-fun b!321527 () Bool)

(declare-fun lt!156026 () (_ BitVec 32))

(assert (=> b!321527 (= e!199107 (and (bvsge mask!3777 #b00000000000000000000000000000000) (or (bvslt lt!156026 #b00000000000000000000000000000000) (bvsge lt!156026 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321527 (= lt!156026 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321528 () Bool)

(assert (=> b!321528 (= e!199109 e!199107)))

(declare-fun res!175791 () Bool)

(assert (=> b!321528 (=> (not res!175791) (not e!199107))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321528 (= res!175791 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156025))))

(assert (=> b!321528 (= lt!156025 (Intermediate!2924 false resIndex!58 resX!58))))

(assert (= (and start!32276 res!175792) b!321522))

(assert (= (and b!321522 res!175788) b!321525))

(assert (= (and b!321525 res!175789) b!321524))

(assert (= (and b!321524 res!175785) b!321520))

(assert (= (and b!321520 res!175786) b!321519))

(assert (= (and b!321519 res!175794) b!321528))

(assert (= (and b!321528 res!175791) b!321523))

(assert (= (and b!321523 res!175787) b!321526))

(assert (= (and b!321526 res!175790) b!321521))

(assert (= (and b!321521 res!175793) b!321527))

(declare-fun m!329137 () Bool)

(assert (=> b!321528 m!329137))

(assert (=> b!321528 m!329137))

(declare-fun m!329139 () Bool)

(assert (=> b!321528 m!329139))

(declare-fun m!329141 () Bool)

(assert (=> b!321524 m!329141))

(declare-fun m!329143 () Bool)

(assert (=> b!321521 m!329143))

(declare-fun m!329145 () Bool)

(assert (=> b!321526 m!329145))

(declare-fun m!329147 () Bool)

(assert (=> b!321527 m!329147))

(declare-fun m!329149 () Bool)

(assert (=> b!321520 m!329149))

(declare-fun m!329151 () Bool)

(assert (=> start!32276 m!329151))

(declare-fun m!329153 () Bool)

(assert (=> start!32276 m!329153))

(declare-fun m!329155 () Bool)

(assert (=> b!321523 m!329155))

(declare-fun m!329157 () Bool)

(assert (=> b!321525 m!329157))

(declare-fun m!329159 () Bool)

(assert (=> b!321519 m!329159))

(check-sat (not b!321527) (not b!321519) (not b!321520) (not b!321525) (not b!321528) (not b!321524) (not start!32276) (not b!321526))
(check-sat)
(get-model)

(declare-fun d!69317 () Bool)

(declare-fun lt!156049 () SeekEntryResult!2924)

(get-info :version)

(assert (=> d!69317 (and (or ((_ is Undefined!2924) lt!156049) (not ((_ is Found!2924) lt!156049)) (and (bvsge (index!13873 lt!156049) #b00000000000000000000000000000000) (bvslt (index!13873 lt!156049) (size!8147 a!3305)))) (or ((_ is Undefined!2924) lt!156049) ((_ is Found!2924) lt!156049) (not ((_ is MissingZero!2924) lt!156049)) (and (bvsge (index!13872 lt!156049) #b00000000000000000000000000000000) (bvslt (index!13872 lt!156049) (size!8147 a!3305)))) (or ((_ is Undefined!2924) lt!156049) ((_ is Found!2924) lt!156049) ((_ is MissingZero!2924) lt!156049) (not ((_ is MissingVacant!2924) lt!156049)) (and (bvsge (index!13875 lt!156049) #b00000000000000000000000000000000) (bvslt (index!13875 lt!156049) (size!8147 a!3305)))) (or ((_ is Undefined!2924) lt!156049) (ite ((_ is Found!2924) lt!156049) (= (select (arr!7794 a!3305) (index!13873 lt!156049)) k0!2497) (ite ((_ is MissingZero!2924) lt!156049) (= (select (arr!7794 a!3305) (index!13872 lt!156049)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2924) lt!156049) (= (select (arr!7794 a!3305) (index!13875 lt!156049)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!199134 () SeekEntryResult!2924)

(assert (=> d!69317 (= lt!156049 e!199134)))

(declare-fun c!50501 () Bool)

(declare-fun lt!156050 () SeekEntryResult!2924)

(assert (=> d!69317 (= c!50501 (and ((_ is Intermediate!2924) lt!156050) (undefined!3736 lt!156050)))))

(assert (=> d!69317 (= lt!156050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69317 (validMask!0 mask!3777)))

(assert (=> d!69317 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!156049)))

(declare-fun b!321601 () Bool)

(declare-fun e!199135 () SeekEntryResult!2924)

(assert (=> b!321601 (= e!199135 (Found!2924 (index!13874 lt!156050)))))

(declare-fun e!199136 () SeekEntryResult!2924)

(declare-fun b!321602 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16470 (_ BitVec 32)) SeekEntryResult!2924)

(assert (=> b!321602 (= e!199136 (seekKeyOrZeroReturnVacant!0 (x!32146 lt!156050) (index!13874 lt!156050) (index!13874 lt!156050) k0!2497 a!3305 mask!3777))))

(declare-fun b!321603 () Bool)

(assert (=> b!321603 (= e!199134 e!199135)))

(declare-fun lt!156048 () (_ BitVec 64))

(assert (=> b!321603 (= lt!156048 (select (arr!7794 a!3305) (index!13874 lt!156050)))))

(declare-fun c!50500 () Bool)

(assert (=> b!321603 (= c!50500 (= lt!156048 k0!2497))))

(declare-fun b!321604 () Bool)

(declare-fun c!50499 () Bool)

(assert (=> b!321604 (= c!50499 (= lt!156048 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!321604 (= e!199135 e!199136)))

(declare-fun b!321605 () Bool)

(assert (=> b!321605 (= e!199134 Undefined!2924)))

(declare-fun b!321606 () Bool)

(assert (=> b!321606 (= e!199136 (MissingZero!2924 (index!13874 lt!156050)))))

(assert (= (and d!69317 c!50501) b!321605))

(assert (= (and d!69317 (not c!50501)) b!321603))

(assert (= (and b!321603 c!50500) b!321601))

(assert (= (and b!321603 (not c!50500)) b!321604))

(assert (= (and b!321604 c!50499) b!321606))

(assert (= (and b!321604 (not c!50499)) b!321602))

(declare-fun m!329211 () Bool)

(assert (=> d!69317 m!329211))

(assert (=> d!69317 m!329137))

(declare-fun m!329213 () Bool)

(assert (=> d!69317 m!329213))

(assert (=> d!69317 m!329137))

(assert (=> d!69317 m!329139))

(assert (=> d!69317 m!329151))

(declare-fun m!329215 () Bool)

(assert (=> d!69317 m!329215))

(declare-fun m!329217 () Bool)

(assert (=> b!321602 m!329217))

(declare-fun m!329219 () Bool)

(assert (=> b!321603 m!329219))

(assert (=> b!321520 d!69317))

(declare-fun d!69325 () Bool)

(assert (=> d!69325 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!321525 d!69325))

(declare-fun b!321661 () Bool)

(declare-fun e!199171 () SeekEntryResult!2924)

(assert (=> b!321661 (= e!199171 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!321662 () Bool)

(declare-fun e!199172 () SeekEntryResult!2924)

(assert (=> b!321662 (= e!199172 e!199171)))

(declare-fun c!50521 () Bool)

(declare-fun lt!156076 () (_ BitVec 64))

(assert (=> b!321662 (= c!50521 (or (= lt!156076 k0!2497) (= (bvadd lt!156076 lt!156076) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!321663 () Bool)

(declare-fun e!199174 () Bool)

(declare-fun lt!156077 () SeekEntryResult!2924)

(assert (=> b!321663 (= e!199174 (bvsge (x!32146 lt!156077) #b01111111111111111111111111111110))))

(declare-fun b!321664 () Bool)

(assert (=> b!321664 (= e!199172 (Intermediate!2924 true index!1840 x!1490))))

(declare-fun b!321665 () Bool)

(assert (=> b!321665 (= e!199171 (Intermediate!2924 false index!1840 x!1490))))

(declare-fun d!69327 () Bool)

(assert (=> d!69327 e!199174))

(declare-fun c!50522 () Bool)

(assert (=> d!69327 (= c!50522 (and ((_ is Intermediate!2924) lt!156077) (undefined!3736 lt!156077)))))

(assert (=> d!69327 (= lt!156077 e!199172)))

(declare-fun c!50520 () Bool)

(assert (=> d!69327 (= c!50520 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69327 (= lt!156076 (select (arr!7794 a!3305) index!1840))))

(assert (=> d!69327 (validMask!0 mask!3777)))

(assert (=> d!69327 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156077)))

(declare-fun b!321666 () Bool)

(assert (=> b!321666 (and (bvsge (index!13874 lt!156077) #b00000000000000000000000000000000) (bvslt (index!13874 lt!156077) (size!8147 a!3305)))))

(declare-fun res!175875 () Bool)

(assert (=> b!321666 (= res!175875 (= (select (arr!7794 a!3305) (index!13874 lt!156077)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!199173 () Bool)

(assert (=> b!321666 (=> res!175875 e!199173)))

(declare-fun b!321667 () Bool)

(declare-fun e!199175 () Bool)

(assert (=> b!321667 (= e!199174 e!199175)))

(declare-fun res!175873 () Bool)

(assert (=> b!321667 (= res!175873 (and ((_ is Intermediate!2924) lt!156077) (not (undefined!3736 lt!156077)) (bvslt (x!32146 lt!156077) #b01111111111111111111111111111110) (bvsge (x!32146 lt!156077) #b00000000000000000000000000000000) (bvsge (x!32146 lt!156077) x!1490)))))

(assert (=> b!321667 (=> (not res!175873) (not e!199175))))

(declare-fun b!321668 () Bool)

(assert (=> b!321668 (and (bvsge (index!13874 lt!156077) #b00000000000000000000000000000000) (bvslt (index!13874 lt!156077) (size!8147 a!3305)))))

(declare-fun res!175874 () Bool)

(assert (=> b!321668 (= res!175874 (= (select (arr!7794 a!3305) (index!13874 lt!156077)) k0!2497))))

(assert (=> b!321668 (=> res!175874 e!199173)))

(assert (=> b!321668 (= e!199175 e!199173)))

(declare-fun b!321669 () Bool)

(assert (=> b!321669 (and (bvsge (index!13874 lt!156077) #b00000000000000000000000000000000) (bvslt (index!13874 lt!156077) (size!8147 a!3305)))))

(assert (=> b!321669 (= e!199173 (= (select (arr!7794 a!3305) (index!13874 lt!156077)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!69327 c!50520) b!321664))

(assert (= (and d!69327 (not c!50520)) b!321662))

(assert (= (and b!321662 c!50521) b!321665))

(assert (= (and b!321662 (not c!50521)) b!321661))

(assert (= (and d!69327 c!50522) b!321663))

(assert (= (and d!69327 (not c!50522)) b!321667))

(assert (= (and b!321667 res!175873) b!321668))

(assert (= (and b!321668 (not res!175874)) b!321666))

(assert (= (and b!321666 (not res!175875)) b!321669))

(assert (=> b!321661 m!329147))

(assert (=> b!321661 m!329147))

(declare-fun m!329247 () Bool)

(assert (=> b!321661 m!329247))

(declare-fun m!329249 () Bool)

(assert (=> b!321668 m!329249))

(assert (=> d!69327 m!329143))

(assert (=> d!69327 m!329151))

(assert (=> b!321669 m!329249))

(assert (=> b!321666 m!329249))

(assert (=> b!321526 d!69327))

(declare-fun d!69339 () Bool)

(declare-fun lt!156080 () (_ BitVec 32))

(assert (=> d!69339 (and (bvsge lt!156080 #b00000000000000000000000000000000) (bvslt lt!156080 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69339 (= lt!156080 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69339 (validMask!0 mask!3777)))

(assert (=> d!69339 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!156080)))

(declare-fun bs!11200 () Bool)

(assert (= bs!11200 d!69339))

(declare-fun m!329251 () Bool)

(assert (=> bs!11200 m!329251))

(assert (=> bs!11200 m!329151))

(assert (=> b!321527 d!69339))

(declare-fun b!321670 () Bool)

(declare-fun e!199176 () SeekEntryResult!2924)

(assert (=> b!321670 (= e!199176 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!321671 () Bool)

(declare-fun e!199177 () SeekEntryResult!2924)

(assert (=> b!321671 (= e!199177 e!199176)))

(declare-fun c!50524 () Bool)

(declare-fun lt!156081 () (_ BitVec 64))

(assert (=> b!321671 (= c!50524 (or (= lt!156081 k0!2497) (= (bvadd lt!156081 lt!156081) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!321672 () Bool)

(declare-fun e!199179 () Bool)

(declare-fun lt!156082 () SeekEntryResult!2924)

(assert (=> b!321672 (= e!199179 (bvsge (x!32146 lt!156082) #b01111111111111111111111111111110))))

(declare-fun b!321673 () Bool)

(assert (=> b!321673 (= e!199177 (Intermediate!2924 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!321674 () Bool)

(assert (=> b!321674 (= e!199176 (Intermediate!2924 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun d!69341 () Bool)

(assert (=> d!69341 e!199179))

(declare-fun c!50525 () Bool)

(assert (=> d!69341 (= c!50525 (and ((_ is Intermediate!2924) lt!156082) (undefined!3736 lt!156082)))))

(assert (=> d!69341 (= lt!156082 e!199177)))

(declare-fun c!50523 () Bool)

(assert (=> d!69341 (= c!50523 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69341 (= lt!156081 (select (arr!7794 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69341 (validMask!0 mask!3777)))

(assert (=> d!69341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156082)))

(declare-fun b!321675 () Bool)

(assert (=> b!321675 (and (bvsge (index!13874 lt!156082) #b00000000000000000000000000000000) (bvslt (index!13874 lt!156082) (size!8147 a!3305)))))

(declare-fun res!175878 () Bool)

(assert (=> b!321675 (= res!175878 (= (select (arr!7794 a!3305) (index!13874 lt!156082)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!199178 () Bool)

(assert (=> b!321675 (=> res!175878 e!199178)))

(declare-fun b!321676 () Bool)

(declare-fun e!199180 () Bool)

(assert (=> b!321676 (= e!199179 e!199180)))

(declare-fun res!175876 () Bool)

(assert (=> b!321676 (= res!175876 (and ((_ is Intermediate!2924) lt!156082) (not (undefined!3736 lt!156082)) (bvslt (x!32146 lt!156082) #b01111111111111111111111111111110) (bvsge (x!32146 lt!156082) #b00000000000000000000000000000000) (bvsge (x!32146 lt!156082) #b00000000000000000000000000000000)))))

(assert (=> b!321676 (=> (not res!175876) (not e!199180))))

(declare-fun b!321677 () Bool)

(assert (=> b!321677 (and (bvsge (index!13874 lt!156082) #b00000000000000000000000000000000) (bvslt (index!13874 lt!156082) (size!8147 a!3305)))))

(declare-fun res!175877 () Bool)

(assert (=> b!321677 (= res!175877 (= (select (arr!7794 a!3305) (index!13874 lt!156082)) k0!2497))))

(assert (=> b!321677 (=> res!175877 e!199178)))

(assert (=> b!321677 (= e!199180 e!199178)))

(declare-fun b!321678 () Bool)

(assert (=> b!321678 (and (bvsge (index!13874 lt!156082) #b00000000000000000000000000000000) (bvslt (index!13874 lt!156082) (size!8147 a!3305)))))

(assert (=> b!321678 (= e!199178 (= (select (arr!7794 a!3305) (index!13874 lt!156082)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!69341 c!50523) b!321673))

(assert (= (and d!69341 (not c!50523)) b!321671))

(assert (= (and b!321671 c!50524) b!321674))

(assert (= (and b!321671 (not c!50524)) b!321670))

(assert (= (and d!69341 c!50525) b!321672))

(assert (= (and d!69341 (not c!50525)) b!321676))

(assert (= (and b!321676 res!175876) b!321677))

(assert (= (and b!321677 (not res!175877)) b!321675))

(assert (= (and b!321675 (not res!175878)) b!321678))

(assert (=> b!321670 m!329137))

(declare-fun m!329253 () Bool)

(assert (=> b!321670 m!329253))

(assert (=> b!321670 m!329253))

(declare-fun m!329255 () Bool)

(assert (=> b!321670 m!329255))

(declare-fun m!329257 () Bool)

(assert (=> b!321677 m!329257))

(assert (=> d!69341 m!329137))

(declare-fun m!329259 () Bool)

(assert (=> d!69341 m!329259))

(assert (=> d!69341 m!329151))

(assert (=> b!321678 m!329257))

(assert (=> b!321675 m!329257))

(assert (=> b!321528 d!69341))

(declare-fun d!69343 () Bool)

(declare-fun lt!156096 () (_ BitVec 32))

(declare-fun lt!156095 () (_ BitVec 32))

(assert (=> d!69343 (= lt!156096 (bvmul (bvxor lt!156095 (bvlshr lt!156095 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69343 (= lt!156095 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69343 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!175879 (let ((h!5356 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32153 (bvmul (bvxor h!5356 (bvlshr h!5356 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32153 (bvlshr x!32153 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!175879 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!175879 #b00000000000000000000000000000000))))))

(assert (=> d!69343 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!156096 (bvlshr lt!156096 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!321528 d!69343))

(declare-fun d!69345 () Bool)

(assert (=> d!69345 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32276 d!69345))

(declare-fun d!69355 () Bool)

(assert (=> d!69355 (= (array_inv!5766 a!3305) (bvsge (size!8147 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32276 d!69355))

(declare-fun d!69357 () Bool)

(declare-fun res!175910 () Bool)

(declare-fun e!199225 () Bool)

(assert (=> d!69357 (=> res!175910 e!199225)))

(assert (=> d!69357 (= res!175910 (= (select (arr!7794 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69357 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!199225)))

(declare-fun b!321755 () Bool)

(declare-fun e!199226 () Bool)

(assert (=> b!321755 (= e!199225 e!199226)))

(declare-fun res!175911 () Bool)

(assert (=> b!321755 (=> (not res!175911) (not e!199226))))

(assert (=> b!321755 (= res!175911 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8147 a!3305)))))

(declare-fun b!321756 () Bool)

(assert (=> b!321756 (= e!199226 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69357 (not res!175910)) b!321755))

(assert (= (and b!321755 res!175911) b!321756))

(declare-fun m!329285 () Bool)

(assert (=> d!69357 m!329285))

(declare-fun m!329287 () Bool)

(assert (=> b!321756 m!329287))

(assert (=> b!321524 d!69357))

(declare-fun b!321777 () Bool)

(declare-fun e!199242 () Bool)

(declare-fun e!199243 () Bool)

(assert (=> b!321777 (= e!199242 e!199243)))

(declare-fun c!50555 () Bool)

(assert (=> b!321777 (= c!50555 (validKeyInArray!0 (select (arr!7794 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!321778 () Bool)

(declare-fun e!199244 () Bool)

(declare-fun call!26045 () Bool)

(assert (=> b!321778 (= e!199244 call!26045)))

(declare-fun d!69363 () Bool)

(declare-fun res!175923 () Bool)

(assert (=> d!69363 (=> res!175923 e!199242)))

(assert (=> d!69363 (= res!175923 (bvsge #b00000000000000000000000000000000 (size!8147 a!3305)))))

(assert (=> d!69363 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!199242)))

(declare-fun b!321779 () Bool)

(assert (=> b!321779 (= e!199243 e!199244)))

(declare-fun lt!156134 () (_ BitVec 64))

(assert (=> b!321779 (= lt!156134 (select (arr!7794 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9796 0))(
  ( (Unit!9797) )
))
(declare-fun lt!156132 () Unit!9796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16470 (_ BitVec 64) (_ BitVec 32)) Unit!9796)

(assert (=> b!321779 (= lt!156132 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!156134 #b00000000000000000000000000000000))))

(assert (=> b!321779 (arrayContainsKey!0 a!3305 lt!156134 #b00000000000000000000000000000000)))

(declare-fun lt!156133 () Unit!9796)

(assert (=> b!321779 (= lt!156133 lt!156132)))

(declare-fun res!175922 () Bool)

(assert (=> b!321779 (= res!175922 (= (seekEntryOrOpen!0 (select (arr!7794 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2924 #b00000000000000000000000000000000)))))

(assert (=> b!321779 (=> (not res!175922) (not e!199244))))

(declare-fun bm!26042 () Bool)

(assert (=> bm!26042 (= call!26045 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!321780 () Bool)

(assert (=> b!321780 (= e!199243 call!26045)))

(assert (= (and d!69363 (not res!175923)) b!321777))

(assert (= (and b!321777 c!50555) b!321779))

(assert (= (and b!321777 (not c!50555)) b!321780))

(assert (= (and b!321779 res!175922) b!321778))

(assert (= (or b!321778 b!321780) bm!26042))

(assert (=> b!321777 m!329285))

(assert (=> b!321777 m!329285))

(declare-fun m!329301 () Bool)

(assert (=> b!321777 m!329301))

(assert (=> b!321779 m!329285))

(declare-fun m!329303 () Bool)

(assert (=> b!321779 m!329303))

(declare-fun m!329305 () Bool)

(assert (=> b!321779 m!329305))

(assert (=> b!321779 m!329285))

(declare-fun m!329307 () Bool)

(assert (=> b!321779 m!329307))

(declare-fun m!329309 () Bool)

(assert (=> bm!26042 m!329309))

(assert (=> b!321519 d!69363))

(check-sat (not d!69339) (not d!69327) (not b!321779) (not b!321661) (not b!321777) (not b!321756) (not d!69317) (not b!321602) (not b!321670) (not bm!26042) (not d!69341))
(check-sat)
