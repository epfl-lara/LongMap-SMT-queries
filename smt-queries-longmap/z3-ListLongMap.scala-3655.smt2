; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50428 () Bool)

(assert start!50428)

(declare-fun b!551543 () Bool)

(declare-fun res!344323 () Bool)

(declare-fun e!318301 () Bool)

(assert (=> b!551543 (=> (not res!344323) (not e!318301))))

(declare-datatypes ((array!34767 0))(
  ( (array!34768 (arr!16696 (Array (_ BitVec 32) (_ BitVec 64))) (size!17060 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34767)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551543 (= res!344323 (validKeyInArray!0 (select (arr!16696 a!3118) j!142)))))

(declare-fun b!551544 () Bool)

(declare-fun res!344330 () Bool)

(assert (=> b!551544 (=> (not res!344330) (not e!318301))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551544 (= res!344330 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551545 () Bool)

(declare-fun res!344322 () Bool)

(declare-fun e!318300 () Bool)

(assert (=> b!551545 (=> (not res!344322) (not e!318300))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5145 0))(
  ( (MissingZero!5145 (index!22807 (_ BitVec 32))) (Found!5145 (index!22808 (_ BitVec 32))) (Intermediate!5145 (undefined!5957 Bool) (index!22809 (_ BitVec 32)) (x!51735 (_ BitVec 32))) (Undefined!5145) (MissingVacant!5145 (index!22810 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34767 (_ BitVec 32)) SeekEntryResult!5145)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551545 (= res!344322 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) (select (arr!16696 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) (array!34768 (store (arr!16696 a!3118) i!1132 k0!1914) (size!17060 a!3118)) mask!3119)))))

(declare-fun b!551547 () Bool)

(assert (=> b!551547 (= e!318301 e!318300)))

(declare-fun res!344321 () Bool)

(assert (=> b!551547 (=> (not res!344321) (not e!318300))))

(declare-fun lt!250852 () SeekEntryResult!5145)

(assert (=> b!551547 (= res!344321 (or (= lt!250852 (MissingZero!5145 i!1132)) (= lt!250852 (MissingVacant!5145 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34767 (_ BitVec 32)) SeekEntryResult!5145)

(assert (=> b!551547 (= lt!250852 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551548 () Bool)

(declare-fun res!344329 () Bool)

(assert (=> b!551548 (=> (not res!344329) (not e!318301))))

(assert (=> b!551548 (= res!344329 (validKeyInArray!0 k0!1914))))

(declare-fun b!551549 () Bool)

(declare-fun res!344327 () Bool)

(assert (=> b!551549 (=> (not res!344327) (not e!318300))))

(declare-datatypes ((List!10776 0))(
  ( (Nil!10773) (Cons!10772 (h!11751 (_ BitVec 64)) (t!17004 List!10776)) )
))
(declare-fun arrayNoDuplicates!0 (array!34767 (_ BitVec 32) List!10776) Bool)

(assert (=> b!551549 (= res!344327 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10773))))

(declare-fun b!551550 () Bool)

(declare-fun e!318303 () Bool)

(assert (=> b!551550 (= e!318303 (= (seekEntryOrOpen!0 (select (arr!16696 a!3118) j!142) a!3118 mask!3119) (Found!5145 j!142)))))

(declare-fun b!551546 () Bool)

(declare-fun res!344324 () Bool)

(assert (=> b!551546 (=> (not res!344324) (not e!318300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34767 (_ BitVec 32)) Bool)

(assert (=> b!551546 (= res!344324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!344328 () Bool)

(assert (=> start!50428 (=> (not res!344328) (not e!318301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50428 (= res!344328 (validMask!0 mask!3119))))

(assert (=> start!50428 e!318301))

(assert (=> start!50428 true))

(declare-fun array_inv!12492 (array!34767) Bool)

(assert (=> start!50428 (array_inv!12492 a!3118)))

(declare-fun b!551551 () Bool)

(assert (=> b!551551 (= e!318300 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvsle mask!3119 #b00111111111111111111111111111111))))))

(assert (=> b!551551 e!318303))

(declare-fun res!344326 () Bool)

(assert (=> b!551551 (=> (not res!344326) (not e!318303))))

(assert (=> b!551551 (= res!344326 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17064 0))(
  ( (Unit!17065) )
))
(declare-fun lt!250851 () Unit!17064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17064)

(assert (=> b!551551 (= lt!250851 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551552 () Bool)

(declare-fun res!344325 () Bool)

(assert (=> b!551552 (=> (not res!344325) (not e!318301))))

(assert (=> b!551552 (= res!344325 (and (= (size!17060 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17060 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17060 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50428 res!344328) b!551552))

(assert (= (and b!551552 res!344325) b!551543))

(assert (= (and b!551543 res!344323) b!551548))

(assert (= (and b!551548 res!344329) b!551544))

(assert (= (and b!551544 res!344330) b!551547))

(assert (= (and b!551547 res!344321) b!551546))

(assert (= (and b!551546 res!344324) b!551549))

(assert (= (and b!551549 res!344327) b!551545))

(assert (= (and b!551545 res!344322) b!551551))

(assert (= (and b!551551 res!344326) b!551550))

(declare-fun m!528549 () Bool)

(assert (=> b!551544 m!528549))

(declare-fun m!528551 () Bool)

(assert (=> b!551548 m!528551))

(declare-fun m!528553 () Bool)

(assert (=> b!551543 m!528553))

(assert (=> b!551543 m!528553))

(declare-fun m!528555 () Bool)

(assert (=> b!551543 m!528555))

(assert (=> b!551545 m!528553))

(declare-fun m!528557 () Bool)

(assert (=> b!551545 m!528557))

(assert (=> b!551545 m!528553))

(declare-fun m!528559 () Bool)

(assert (=> b!551545 m!528559))

(declare-fun m!528561 () Bool)

(assert (=> b!551545 m!528561))

(assert (=> b!551545 m!528559))

(declare-fun m!528563 () Bool)

(assert (=> b!551545 m!528563))

(assert (=> b!551545 m!528557))

(assert (=> b!551545 m!528553))

(declare-fun m!528565 () Bool)

(assert (=> b!551545 m!528565))

(declare-fun m!528567 () Bool)

(assert (=> b!551545 m!528567))

(assert (=> b!551545 m!528559))

(assert (=> b!551545 m!528561))

(declare-fun m!528569 () Bool)

(assert (=> b!551549 m!528569))

(declare-fun m!528571 () Bool)

(assert (=> b!551551 m!528571))

(declare-fun m!528573 () Bool)

(assert (=> b!551551 m!528573))

(declare-fun m!528575 () Bool)

(assert (=> b!551547 m!528575))

(declare-fun m!528577 () Bool)

(assert (=> b!551546 m!528577))

(assert (=> b!551550 m!528553))

(assert (=> b!551550 m!528553))

(declare-fun m!528579 () Bool)

(assert (=> b!551550 m!528579))

(declare-fun m!528581 () Bool)

(assert (=> start!50428 m!528581))

(declare-fun m!528583 () Bool)

(assert (=> start!50428 m!528583))

(check-sat (not b!551547) (not b!551549) (not b!551550) (not start!50428) (not b!551544) (not b!551551) (not b!551545) (not b!551546) (not b!551543) (not b!551548))
(check-sat)
(get-model)

(declare-fun b!551609 () Bool)

(declare-fun e!318336 () Bool)

(declare-fun lt!250869 () SeekEntryResult!5145)

(assert (=> b!551609 (= e!318336 (bvsge (x!51735 lt!250869) #b01111111111111111111111111111110))))

(declare-fun b!551610 () Bool)

(declare-fun e!318332 () SeekEntryResult!5145)

(assert (=> b!551610 (= e!318332 (Intermediate!5145 false (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551611 () Bool)

(declare-fun e!318335 () Bool)

(assert (=> b!551611 (= e!318336 e!318335)))

(declare-fun res!344372 () Bool)

(get-info :version)

(assert (=> b!551611 (= res!344372 (and ((_ is Intermediate!5145) lt!250869) (not (undefined!5957 lt!250869)) (bvslt (x!51735 lt!250869) #b01111111111111111111111111111110) (bvsge (x!51735 lt!250869) #b00000000000000000000000000000000) (bvsge (x!51735 lt!250869) #b00000000000000000000000000000000)))))

(assert (=> b!551611 (=> (not res!344372) (not e!318335))))

(declare-fun b!551612 () Bool)

(declare-fun e!318334 () SeekEntryResult!5145)

(assert (=> b!551612 (= e!318334 e!318332)))

(declare-fun c!63953 () Bool)

(declare-fun lt!250870 () (_ BitVec 64))

(assert (=> b!551612 (= c!63953 (or (= lt!250870 (select (arr!16696 a!3118) j!142)) (= (bvadd lt!250870 lt!250870) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!551613 () Bool)

(assert (=> b!551613 (and (bvsge (index!22809 lt!250869) #b00000000000000000000000000000000) (bvslt (index!22809 lt!250869) (size!17060 a!3118)))))

(declare-fun res!344373 () Bool)

(assert (=> b!551613 (= res!344373 (= (select (arr!16696 a!3118) (index!22809 lt!250869)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318333 () Bool)

(assert (=> b!551613 (=> res!344373 e!318333)))

(declare-fun b!551614 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551614 (= e!318332 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (arr!16696 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83005 () Bool)

(assert (=> d!83005 e!318336))

(declare-fun c!63955 () Bool)

(assert (=> d!83005 (= c!63955 (and ((_ is Intermediate!5145) lt!250869) (undefined!5957 lt!250869)))))

(assert (=> d!83005 (= lt!250869 e!318334)))

(declare-fun c!63954 () Bool)

(assert (=> d!83005 (= c!63954 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83005 (= lt!250870 (select (arr!16696 a!3118) (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119)))))

(assert (=> d!83005 (validMask!0 mask!3119)))

(assert (=> d!83005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) (select (arr!16696 a!3118) j!142) a!3118 mask!3119) lt!250869)))

(declare-fun b!551615 () Bool)

(assert (=> b!551615 (= e!318334 (Intermediate!5145 true (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551616 () Bool)

(assert (=> b!551616 (and (bvsge (index!22809 lt!250869) #b00000000000000000000000000000000) (bvslt (index!22809 lt!250869) (size!17060 a!3118)))))

(declare-fun res!344371 () Bool)

(assert (=> b!551616 (= res!344371 (= (select (arr!16696 a!3118) (index!22809 lt!250869)) (select (arr!16696 a!3118) j!142)))))

(assert (=> b!551616 (=> res!344371 e!318333)))

(assert (=> b!551616 (= e!318335 e!318333)))

(declare-fun b!551617 () Bool)

(assert (=> b!551617 (and (bvsge (index!22809 lt!250869) #b00000000000000000000000000000000) (bvslt (index!22809 lt!250869) (size!17060 a!3118)))))

(assert (=> b!551617 (= e!318333 (= (select (arr!16696 a!3118) (index!22809 lt!250869)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!83005 c!63954) b!551615))

(assert (= (and d!83005 (not c!63954)) b!551612))

(assert (= (and b!551612 c!63953) b!551610))

(assert (= (and b!551612 (not c!63953)) b!551614))

(assert (= (and d!83005 c!63955) b!551609))

(assert (= (and d!83005 (not c!63955)) b!551611))

(assert (= (and b!551611 res!344372) b!551616))

(assert (= (and b!551616 (not res!344371)) b!551613))

(assert (= (and b!551613 (not res!344373)) b!551617))

(declare-fun m!528621 () Bool)

(assert (=> b!551617 m!528621))

(assert (=> b!551614 m!528557))

(declare-fun m!528623 () Bool)

(assert (=> b!551614 m!528623))

(assert (=> b!551614 m!528623))

(assert (=> b!551614 m!528553))

(declare-fun m!528625 () Bool)

(assert (=> b!551614 m!528625))

(assert (=> b!551616 m!528621))

(assert (=> d!83005 m!528557))

(declare-fun m!528627 () Bool)

(assert (=> d!83005 m!528627))

(assert (=> d!83005 m!528581))

(assert (=> b!551613 m!528621))

(assert (=> b!551545 d!83005))

(declare-fun d!83009 () Bool)

(declare-fun lt!250879 () (_ BitVec 32))

(declare-fun lt!250878 () (_ BitVec 32))

(assert (=> d!83009 (= lt!250879 (bvmul (bvxor lt!250878 (bvlshr lt!250878 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83009 (= lt!250878 ((_ extract 31 0) (bvand (bvxor (select (arr!16696 a!3118) j!142) (bvlshr (select (arr!16696 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83009 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344374 (let ((h!11753 ((_ extract 31 0) (bvand (bvxor (select (arr!16696 a!3118) j!142) (bvlshr (select (arr!16696 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51738 (bvmul (bvxor h!11753 (bvlshr h!11753 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51738 (bvlshr x!51738 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344374 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344374 #b00000000000000000000000000000000))))))

(assert (=> d!83009 (= (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) (bvand (bvxor lt!250879 (bvlshr lt!250879 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!551545 d!83009))

(declare-fun b!551622 () Bool)

(declare-fun e!318344 () Bool)

(declare-fun lt!250880 () SeekEntryResult!5145)

(assert (=> b!551622 (= e!318344 (bvsge (x!51735 lt!250880) #b01111111111111111111111111111110))))

(declare-fun b!551623 () Bool)

(declare-fun e!318340 () SeekEntryResult!5145)

(assert (=> b!551623 (= e!318340 (Intermediate!5145 false (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551624 () Bool)

(declare-fun e!318343 () Bool)

(assert (=> b!551624 (= e!318344 e!318343)))

(declare-fun res!344378 () Bool)

(assert (=> b!551624 (= res!344378 (and ((_ is Intermediate!5145) lt!250880) (not (undefined!5957 lt!250880)) (bvslt (x!51735 lt!250880) #b01111111111111111111111111111110) (bvsge (x!51735 lt!250880) #b00000000000000000000000000000000) (bvsge (x!51735 lt!250880) #b00000000000000000000000000000000)))))

(assert (=> b!551624 (=> (not res!344378) (not e!318343))))

(declare-fun b!551625 () Bool)

(declare-fun e!318342 () SeekEntryResult!5145)

(assert (=> b!551625 (= e!318342 e!318340)))

(declare-fun c!63957 () Bool)

(declare-fun lt!250881 () (_ BitVec 64))

(assert (=> b!551625 (= c!63957 (or (= lt!250881 (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!250881 lt!250881) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!551626 () Bool)

(assert (=> b!551626 (and (bvsge (index!22809 lt!250880) #b00000000000000000000000000000000) (bvslt (index!22809 lt!250880) (size!17060 (array!34768 (store (arr!16696 a!3118) i!1132 k0!1914) (size!17060 a!3118)))))))

(declare-fun res!344379 () Bool)

(assert (=> b!551626 (= res!344379 (= (select (arr!16696 (array!34768 (store (arr!16696 a!3118) i!1132 k0!1914) (size!17060 a!3118))) (index!22809 lt!250880)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318341 () Bool)

(assert (=> b!551626 (=> res!344379 e!318341)))

(declare-fun b!551627 () Bool)

(assert (=> b!551627 (= e!318340 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) (array!34768 (store (arr!16696 a!3118) i!1132 k0!1914) (size!17060 a!3118)) mask!3119))))

(declare-fun d!83017 () Bool)

(assert (=> d!83017 e!318344))

(declare-fun c!63959 () Bool)

(assert (=> d!83017 (= c!63959 (and ((_ is Intermediate!5145) lt!250880) (undefined!5957 lt!250880)))))

(assert (=> d!83017 (= lt!250880 e!318342)))

(declare-fun c!63958 () Bool)

(assert (=> d!83017 (= c!63958 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83017 (= lt!250881 (select (arr!16696 (array!34768 (store (arr!16696 a!3118) i!1132 k0!1914) (size!17060 a!3118))) (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) mask!3119)))))

(assert (=> d!83017 (validMask!0 mask!3119)))

(assert (=> d!83017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) (array!34768 (store (arr!16696 a!3118) i!1132 k0!1914) (size!17060 a!3118)) mask!3119) lt!250880)))

(declare-fun b!551628 () Bool)

(assert (=> b!551628 (= e!318342 (Intermediate!5145 true (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551629 () Bool)

(assert (=> b!551629 (and (bvsge (index!22809 lt!250880) #b00000000000000000000000000000000) (bvslt (index!22809 lt!250880) (size!17060 (array!34768 (store (arr!16696 a!3118) i!1132 k0!1914) (size!17060 a!3118)))))))

(declare-fun res!344377 () Bool)

(assert (=> b!551629 (= res!344377 (= (select (arr!16696 (array!34768 (store (arr!16696 a!3118) i!1132 k0!1914) (size!17060 a!3118))) (index!22809 lt!250880)) (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!551629 (=> res!344377 e!318341)))

(assert (=> b!551629 (= e!318343 e!318341)))

(declare-fun b!551630 () Bool)

(assert (=> b!551630 (and (bvsge (index!22809 lt!250880) #b00000000000000000000000000000000) (bvslt (index!22809 lt!250880) (size!17060 (array!34768 (store (arr!16696 a!3118) i!1132 k0!1914) (size!17060 a!3118)))))))

(assert (=> b!551630 (= e!318341 (= (select (arr!16696 (array!34768 (store (arr!16696 a!3118) i!1132 k0!1914) (size!17060 a!3118))) (index!22809 lt!250880)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!83017 c!63958) b!551628))

(assert (= (and d!83017 (not c!63958)) b!551625))

(assert (= (and b!551625 c!63957) b!551623))

(assert (= (and b!551625 (not c!63957)) b!551627))

(assert (= (and d!83017 c!63959) b!551622))

(assert (= (and d!83017 (not c!63959)) b!551624))

(assert (= (and b!551624 res!344378) b!551629))

(assert (= (and b!551629 (not res!344377)) b!551626))

(assert (= (and b!551626 (not res!344379)) b!551630))

(declare-fun m!528641 () Bool)

(assert (=> b!551630 m!528641))

(assert (=> b!551627 m!528561))

(declare-fun m!528643 () Bool)

(assert (=> b!551627 m!528643))

(assert (=> b!551627 m!528643))

(assert (=> b!551627 m!528559))

(declare-fun m!528645 () Bool)

(assert (=> b!551627 m!528645))

(assert (=> b!551629 m!528641))

(assert (=> d!83017 m!528561))

(declare-fun m!528647 () Bool)

(assert (=> d!83017 m!528647))

(assert (=> d!83017 m!528581))

(assert (=> b!551626 m!528641))

(assert (=> b!551545 d!83017))

(declare-fun d!83019 () Bool)

(declare-fun lt!250883 () (_ BitVec 32))

(declare-fun lt!250882 () (_ BitVec 32))

(assert (=> d!83019 (= lt!250883 (bvmul (bvxor lt!250882 (bvlshr lt!250882 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83019 (= lt!250882 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83019 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344374 (let ((h!11753 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51738 (bvmul (bvxor h!11753 (bvlshr h!11753 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51738 (bvlshr x!51738 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344374 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344374 #b00000000000000000000000000000000))))))

(assert (=> d!83019 (= (toIndex!0 (select (store (arr!16696 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!250883 (bvlshr lt!250883 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!551545 d!83019))

(declare-fun b!551653 () Bool)

(declare-fun e!318361 () SeekEntryResult!5145)

(assert (=> b!551653 (= e!318361 Undefined!5145)))

(declare-fun d!83021 () Bool)

(declare-fun lt!250897 () SeekEntryResult!5145)

(assert (=> d!83021 (and (or ((_ is Undefined!5145) lt!250897) (not ((_ is Found!5145) lt!250897)) (and (bvsge (index!22808 lt!250897) #b00000000000000000000000000000000) (bvslt (index!22808 lt!250897) (size!17060 a!3118)))) (or ((_ is Undefined!5145) lt!250897) ((_ is Found!5145) lt!250897) (not ((_ is MissingZero!5145) lt!250897)) (and (bvsge (index!22807 lt!250897) #b00000000000000000000000000000000) (bvslt (index!22807 lt!250897) (size!17060 a!3118)))) (or ((_ is Undefined!5145) lt!250897) ((_ is Found!5145) lt!250897) ((_ is MissingZero!5145) lt!250897) (not ((_ is MissingVacant!5145) lt!250897)) (and (bvsge (index!22810 lt!250897) #b00000000000000000000000000000000) (bvslt (index!22810 lt!250897) (size!17060 a!3118)))) (or ((_ is Undefined!5145) lt!250897) (ite ((_ is Found!5145) lt!250897) (= (select (arr!16696 a!3118) (index!22808 lt!250897)) (select (arr!16696 a!3118) j!142)) (ite ((_ is MissingZero!5145) lt!250897) (= (select (arr!16696 a!3118) (index!22807 lt!250897)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5145) lt!250897) (= (select (arr!16696 a!3118) (index!22810 lt!250897)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83021 (= lt!250897 e!318361)))

(declare-fun c!63970 () Bool)

(declare-fun lt!250898 () SeekEntryResult!5145)

(assert (=> d!83021 (= c!63970 (and ((_ is Intermediate!5145) lt!250898) (undefined!5957 lt!250898)))))

(assert (=> d!83021 (= lt!250898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16696 a!3118) j!142) mask!3119) (select (arr!16696 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83021 (validMask!0 mask!3119)))

(assert (=> d!83021 (= (seekEntryOrOpen!0 (select (arr!16696 a!3118) j!142) a!3118 mask!3119) lt!250897)))

(declare-fun b!551654 () Bool)

(declare-fun c!63969 () Bool)

(declare-fun lt!250894 () (_ BitVec 64))

(assert (=> b!551654 (= c!63969 (= lt!250894 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318360 () SeekEntryResult!5145)

(declare-fun e!318359 () SeekEntryResult!5145)

(assert (=> b!551654 (= e!318360 e!318359)))

(declare-fun b!551655 () Bool)

(assert (=> b!551655 (= e!318361 e!318360)))

(assert (=> b!551655 (= lt!250894 (select (arr!16696 a!3118) (index!22809 lt!250898)))))

(declare-fun c!63968 () Bool)

(assert (=> b!551655 (= c!63968 (= lt!250894 (select (arr!16696 a!3118) j!142)))))

(declare-fun b!551656 () Bool)

(assert (=> b!551656 (= e!318359 (MissingZero!5145 (index!22809 lt!250898)))))

(declare-fun b!551657 () Bool)

(assert (=> b!551657 (= e!318360 (Found!5145 (index!22809 lt!250898)))))

(declare-fun b!551658 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34767 (_ BitVec 32)) SeekEntryResult!5145)

(assert (=> b!551658 (= e!318359 (seekKeyOrZeroReturnVacant!0 (x!51735 lt!250898) (index!22809 lt!250898) (index!22809 lt!250898) (select (arr!16696 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83021 c!63970) b!551653))

(assert (= (and d!83021 (not c!63970)) b!551655))

(assert (= (and b!551655 c!63968) b!551657))

(assert (= (and b!551655 (not c!63968)) b!551654))

(assert (= (and b!551654 c!63969) b!551656))

(assert (= (and b!551654 (not c!63969)) b!551658))

(assert (=> d!83021 m!528581))

(declare-fun m!528653 () Bool)

(assert (=> d!83021 m!528653))

(declare-fun m!528655 () Bool)

(assert (=> d!83021 m!528655))

(declare-fun m!528657 () Bool)

(assert (=> d!83021 m!528657))

(assert (=> d!83021 m!528553))

(assert (=> d!83021 m!528557))

(assert (=> d!83021 m!528557))

(assert (=> d!83021 m!528553))

(assert (=> d!83021 m!528565))

(declare-fun m!528659 () Bool)

(assert (=> b!551655 m!528659))

(assert (=> b!551658 m!528553))

(declare-fun m!528661 () Bool)

(assert (=> b!551658 m!528661))

(assert (=> b!551550 d!83021))

(declare-fun d!83029 () Bool)

(declare-fun res!344390 () Bool)

(declare-fun e!318370 () Bool)

(assert (=> d!83029 (=> res!344390 e!318370)))

(assert (=> d!83029 (= res!344390 (= (select (arr!16696 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83029 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!318370)))

(declare-fun b!551671 () Bool)

(declare-fun e!318371 () Bool)

(assert (=> b!551671 (= e!318370 e!318371)))

(declare-fun res!344391 () Bool)

(assert (=> b!551671 (=> (not res!344391) (not e!318371))))

(assert (=> b!551671 (= res!344391 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17060 a!3118)))))

(declare-fun b!551672 () Bool)

(assert (=> b!551672 (= e!318371 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83029 (not res!344390)) b!551671))

(assert (= (and b!551671 res!344391) b!551672))

(declare-fun m!528663 () Bool)

(assert (=> d!83029 m!528663))

(declare-fun m!528665 () Bool)

(assert (=> b!551672 m!528665))

(assert (=> b!551544 d!83029))

(declare-fun b!551701 () Bool)

(declare-fun e!318393 () Bool)

(declare-fun call!32297 () Bool)

(assert (=> b!551701 (= e!318393 call!32297)))

(declare-fun bm!32294 () Bool)

(declare-fun c!63983 () Bool)

(assert (=> bm!32294 (= call!32297 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63983 (Cons!10772 (select (arr!16696 a!3118) #b00000000000000000000000000000000) Nil!10773) Nil!10773)))))

(declare-fun b!551702 () Bool)

(declare-fun e!318394 () Bool)

(declare-fun contains!2839 (List!10776 (_ BitVec 64)) Bool)

(assert (=> b!551702 (= e!318394 (contains!2839 Nil!10773 (select (arr!16696 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551703 () Bool)

(assert (=> b!551703 (= e!318393 call!32297)))

(declare-fun d!83031 () Bool)

(declare-fun res!344405 () Bool)

(declare-fun e!318395 () Bool)

(assert (=> d!83031 (=> res!344405 e!318395)))

(assert (=> d!83031 (= res!344405 (bvsge #b00000000000000000000000000000000 (size!17060 a!3118)))))

(assert (=> d!83031 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10773) e!318395)))

(declare-fun b!551704 () Bool)

(declare-fun e!318392 () Bool)

(assert (=> b!551704 (= e!318392 e!318393)))

(assert (=> b!551704 (= c!63983 (validKeyInArray!0 (select (arr!16696 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551705 () Bool)

(assert (=> b!551705 (= e!318395 e!318392)))

(declare-fun res!344404 () Bool)

(assert (=> b!551705 (=> (not res!344404) (not e!318392))))

(assert (=> b!551705 (= res!344404 (not e!318394))))

(declare-fun res!344406 () Bool)

(assert (=> b!551705 (=> (not res!344406) (not e!318394))))

(assert (=> b!551705 (= res!344406 (validKeyInArray!0 (select (arr!16696 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83031 (not res!344405)) b!551705))

(assert (= (and b!551705 res!344406) b!551702))

(assert (= (and b!551705 res!344404) b!551704))

(assert (= (and b!551704 c!63983) b!551701))

(assert (= (and b!551704 (not c!63983)) b!551703))

(assert (= (or b!551701 b!551703) bm!32294))

(assert (=> bm!32294 m!528663))

(declare-fun m!528687 () Bool)

(assert (=> bm!32294 m!528687))

(assert (=> b!551702 m!528663))

(assert (=> b!551702 m!528663))

(declare-fun m!528689 () Bool)

(assert (=> b!551702 m!528689))

(assert (=> b!551704 m!528663))

(assert (=> b!551704 m!528663))

(declare-fun m!528691 () Bool)

(assert (=> b!551704 m!528691))

(assert (=> b!551705 m!528663))

(assert (=> b!551705 m!528663))

(assert (=> b!551705 m!528691))

(assert (=> b!551549 d!83031))

(declare-fun d!83037 () Bool)

(assert (=> d!83037 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50428 d!83037))

(declare-fun d!83047 () Bool)

(assert (=> d!83047 (= (array_inv!12492 a!3118) (bvsge (size!17060 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50428 d!83047))

(declare-fun d!83049 () Bool)

(assert (=> d!83049 (= (validKeyInArray!0 (select (arr!16696 a!3118) j!142)) (and (not (= (select (arr!16696 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16696 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551543 d!83049))

(declare-fun d!83051 () Bool)

(assert (=> d!83051 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551548 d!83051))

(declare-fun b!551718 () Bool)

(declare-fun e!318410 () SeekEntryResult!5145)

(assert (=> b!551718 (= e!318410 Undefined!5145)))

(declare-fun d!83053 () Bool)

(declare-fun lt!250924 () SeekEntryResult!5145)

(assert (=> d!83053 (and (or ((_ is Undefined!5145) lt!250924) (not ((_ is Found!5145) lt!250924)) (and (bvsge (index!22808 lt!250924) #b00000000000000000000000000000000) (bvslt (index!22808 lt!250924) (size!17060 a!3118)))) (or ((_ is Undefined!5145) lt!250924) ((_ is Found!5145) lt!250924) (not ((_ is MissingZero!5145) lt!250924)) (and (bvsge (index!22807 lt!250924) #b00000000000000000000000000000000) (bvslt (index!22807 lt!250924) (size!17060 a!3118)))) (or ((_ is Undefined!5145) lt!250924) ((_ is Found!5145) lt!250924) ((_ is MissingZero!5145) lt!250924) (not ((_ is MissingVacant!5145) lt!250924)) (and (bvsge (index!22810 lt!250924) #b00000000000000000000000000000000) (bvslt (index!22810 lt!250924) (size!17060 a!3118)))) (or ((_ is Undefined!5145) lt!250924) (ite ((_ is Found!5145) lt!250924) (= (select (arr!16696 a!3118) (index!22808 lt!250924)) k0!1914) (ite ((_ is MissingZero!5145) lt!250924) (= (select (arr!16696 a!3118) (index!22807 lt!250924)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5145) lt!250924) (= (select (arr!16696 a!3118) (index!22810 lt!250924)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83053 (= lt!250924 e!318410)))

(declare-fun c!63988 () Bool)

(declare-fun lt!250925 () SeekEntryResult!5145)

(assert (=> d!83053 (= c!63988 (and ((_ is Intermediate!5145) lt!250925) (undefined!5957 lt!250925)))))

(assert (=> d!83053 (= lt!250925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83053 (validMask!0 mask!3119)))

(assert (=> d!83053 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!250924)))

(declare-fun b!551719 () Bool)

(declare-fun c!63987 () Bool)

(declare-fun lt!250923 () (_ BitVec 64))

(assert (=> b!551719 (= c!63987 (= lt!250923 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318409 () SeekEntryResult!5145)

(declare-fun e!318408 () SeekEntryResult!5145)

(assert (=> b!551719 (= e!318409 e!318408)))

(declare-fun b!551720 () Bool)

(assert (=> b!551720 (= e!318410 e!318409)))

(assert (=> b!551720 (= lt!250923 (select (arr!16696 a!3118) (index!22809 lt!250925)))))

(declare-fun c!63986 () Bool)

(assert (=> b!551720 (= c!63986 (= lt!250923 k0!1914))))

(declare-fun b!551721 () Bool)

(assert (=> b!551721 (= e!318408 (MissingZero!5145 (index!22809 lt!250925)))))

(declare-fun b!551722 () Bool)

(assert (=> b!551722 (= e!318409 (Found!5145 (index!22809 lt!250925)))))

(declare-fun b!551723 () Bool)

(assert (=> b!551723 (= e!318408 (seekKeyOrZeroReturnVacant!0 (x!51735 lt!250925) (index!22809 lt!250925) (index!22809 lt!250925) k0!1914 a!3118 mask!3119))))

(assert (= (and d!83053 c!63988) b!551718))

(assert (= (and d!83053 (not c!63988)) b!551720))

(assert (= (and b!551720 c!63986) b!551722))

(assert (= (and b!551720 (not c!63986)) b!551719))

(assert (= (and b!551719 c!63987) b!551721))

(assert (= (and b!551719 (not c!63987)) b!551723))

(assert (=> d!83053 m!528581))

(declare-fun m!528713 () Bool)

(assert (=> d!83053 m!528713))

(declare-fun m!528715 () Bool)

(assert (=> d!83053 m!528715))

(declare-fun m!528717 () Bool)

(assert (=> d!83053 m!528717))

(declare-fun m!528719 () Bool)

(assert (=> d!83053 m!528719))

(assert (=> d!83053 m!528719))

(declare-fun m!528721 () Bool)

(assert (=> d!83053 m!528721))

(declare-fun m!528723 () Bool)

(assert (=> b!551720 m!528723))

(declare-fun m!528725 () Bool)

(assert (=> b!551723 m!528725))

(assert (=> b!551547 d!83053))

(declare-fun b!551758 () Bool)

(declare-fun e!318437 () Bool)

(declare-fun e!318436 () Bool)

(assert (=> b!551758 (= e!318437 e!318436)))

(declare-fun c!63997 () Bool)

(assert (=> b!551758 (= c!63997 (validKeyInArray!0 (select (arr!16696 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83055 () Bool)

(declare-fun res!344433 () Bool)

(assert (=> d!83055 (=> res!344433 e!318437)))

(assert (=> d!83055 (= res!344433 (bvsge #b00000000000000000000000000000000 (size!17060 a!3118)))))

(assert (=> d!83055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318437)))

(declare-fun b!551759 () Bool)

(declare-fun e!318435 () Bool)

(declare-fun call!32308 () Bool)

(assert (=> b!551759 (= e!318435 call!32308)))

(declare-fun b!551760 () Bool)

(assert (=> b!551760 (= e!318436 e!318435)))

(declare-fun lt!250934 () (_ BitVec 64))

(assert (=> b!551760 (= lt!250934 (select (arr!16696 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250933 () Unit!17064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34767 (_ BitVec 64) (_ BitVec 32)) Unit!17064)

(assert (=> b!551760 (= lt!250933 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250934 #b00000000000000000000000000000000))))

(assert (=> b!551760 (arrayContainsKey!0 a!3118 lt!250934 #b00000000000000000000000000000000)))

(declare-fun lt!250932 () Unit!17064)

(assert (=> b!551760 (= lt!250932 lt!250933)))

(declare-fun res!344434 () Bool)

(assert (=> b!551760 (= res!344434 (= (seekEntryOrOpen!0 (select (arr!16696 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5145 #b00000000000000000000000000000000)))))

(assert (=> b!551760 (=> (not res!344434) (not e!318435))))

(declare-fun bm!32305 () Bool)

(assert (=> bm!32305 (= call!32308 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!551761 () Bool)

(assert (=> b!551761 (= e!318436 call!32308)))

(assert (= (and d!83055 (not res!344433)) b!551758))

(assert (= (and b!551758 c!63997) b!551760))

(assert (= (and b!551758 (not c!63997)) b!551761))

(assert (= (and b!551760 res!344434) b!551759))

(assert (= (or b!551759 b!551761) bm!32305))

(assert (=> b!551758 m!528663))

(assert (=> b!551758 m!528663))

(assert (=> b!551758 m!528691))

(assert (=> b!551760 m!528663))

(declare-fun m!528735 () Bool)

(assert (=> b!551760 m!528735))

(declare-fun m!528737 () Bool)

(assert (=> b!551760 m!528737))

(assert (=> b!551760 m!528663))

(declare-fun m!528739 () Bool)

(assert (=> b!551760 m!528739))

(declare-fun m!528741 () Bool)

(assert (=> bm!32305 m!528741))

(assert (=> b!551546 d!83055))

(declare-fun b!551762 () Bool)

(declare-fun e!318440 () Bool)

(declare-fun e!318439 () Bool)

(assert (=> b!551762 (= e!318440 e!318439)))

(declare-fun c!63998 () Bool)

(assert (=> b!551762 (= c!63998 (validKeyInArray!0 (select (arr!16696 a!3118) j!142)))))

(declare-fun d!83063 () Bool)

(declare-fun res!344435 () Bool)

(assert (=> d!83063 (=> res!344435 e!318440)))

(assert (=> d!83063 (= res!344435 (bvsge j!142 (size!17060 a!3118)))))

(assert (=> d!83063 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!318440)))

(declare-fun b!551763 () Bool)

(declare-fun e!318438 () Bool)

(declare-fun call!32309 () Bool)

(assert (=> b!551763 (= e!318438 call!32309)))

(declare-fun b!551764 () Bool)

(assert (=> b!551764 (= e!318439 e!318438)))

(declare-fun lt!250937 () (_ BitVec 64))

(assert (=> b!551764 (= lt!250937 (select (arr!16696 a!3118) j!142))))

(declare-fun lt!250936 () Unit!17064)

(assert (=> b!551764 (= lt!250936 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250937 j!142))))

(assert (=> b!551764 (arrayContainsKey!0 a!3118 lt!250937 #b00000000000000000000000000000000)))

(declare-fun lt!250935 () Unit!17064)

(assert (=> b!551764 (= lt!250935 lt!250936)))

(declare-fun res!344436 () Bool)

(assert (=> b!551764 (= res!344436 (= (seekEntryOrOpen!0 (select (arr!16696 a!3118) j!142) a!3118 mask!3119) (Found!5145 j!142)))))

(assert (=> b!551764 (=> (not res!344436) (not e!318438))))

(declare-fun bm!32306 () Bool)

(assert (=> bm!32306 (= call!32309 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!551765 () Bool)

(assert (=> b!551765 (= e!318439 call!32309)))

(assert (= (and d!83063 (not res!344435)) b!551762))

(assert (= (and b!551762 c!63998) b!551764))

(assert (= (and b!551762 (not c!63998)) b!551765))

(assert (= (and b!551764 res!344436) b!551763))

(assert (= (or b!551763 b!551765) bm!32306))

(assert (=> b!551762 m!528553))

(assert (=> b!551762 m!528553))

(assert (=> b!551762 m!528555))

(assert (=> b!551764 m!528553))

(declare-fun m!528743 () Bool)

(assert (=> b!551764 m!528743))

(declare-fun m!528745 () Bool)

(assert (=> b!551764 m!528745))

(assert (=> b!551764 m!528553))

(assert (=> b!551764 m!528579))

(declare-fun m!528747 () Bool)

(assert (=> bm!32306 m!528747))

(assert (=> b!551551 d!83063))

(declare-fun d!83065 () Bool)

(assert (=> d!83065 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250940 () Unit!17064)

(declare-fun choose!38 (array!34767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17064)

(assert (=> d!83065 (= lt!250940 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83065 (validMask!0 mask!3119)))

(assert (=> d!83065 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250940)))

(declare-fun bs!17184 () Bool)

(assert (= bs!17184 d!83065))

(assert (=> bs!17184 m!528571))

(declare-fun m!528749 () Bool)

(assert (=> bs!17184 m!528749))

(assert (=> bs!17184 m!528581))

(assert (=> b!551551 d!83065))

(check-sat (not b!551764) (not bm!32306) (not b!551705) (not b!551758) (not d!83017) (not b!551658) (not b!551760) (not d!83053) (not bm!32294) (not b!551702) (not b!551723) (not b!551704) (not b!551672) (not b!551762) (not d!83021) (not b!551614) (not d!83005) (not d!83065) (not b!551627) (not bm!32305))
(check-sat)
