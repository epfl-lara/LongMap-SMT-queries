; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46780 () Bool)

(assert start!46780)

(declare-fun b!516733 () Bool)

(declare-fun res!316301 () Bool)

(declare-fun e!301539 () Bool)

(assert (=> b!516733 (=> (not res!316301) (not e!301539))))

(declare-datatypes ((array!33092 0))(
  ( (array!33093 (arr!15914 (Array (_ BitVec 32) (_ BitVec 64))) (size!16278 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33092)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33092 (_ BitVec 32)) Bool)

(assert (=> b!516733 (= res!316301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516734 () Bool)

(declare-fun res!316306 () Bool)

(declare-fun e!301535 () Bool)

(assert (=> b!516734 (=> res!316306 e!301535)))

(declare-datatypes ((SeekEntryResult!4381 0))(
  ( (MissingZero!4381 (index!19712 (_ BitVec 32))) (Found!4381 (index!19713 (_ BitVec 32))) (Intermediate!4381 (undefined!5193 Bool) (index!19714 (_ BitVec 32)) (x!48664 (_ BitVec 32))) (Undefined!4381) (MissingVacant!4381 (index!19715 (_ BitVec 32))) )
))
(declare-fun lt!236551 () SeekEntryResult!4381)

(assert (=> b!516734 (= res!316306 (or (undefined!5193 lt!236551) (not (is-Intermediate!4381 lt!236551))))))

(declare-fun b!516735 () Bool)

(declare-fun res!316299 () Bool)

(declare-fun e!301536 () Bool)

(assert (=> b!516735 (=> (not res!316299) (not e!301536))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516735 (= res!316299 (validKeyInArray!0 (select (arr!15914 a!3235) j!176)))))

(declare-fun b!516736 () Bool)

(assert (=> b!516736 (= e!301536 e!301539)))

(declare-fun res!316298 () Bool)

(assert (=> b!516736 (=> (not res!316298) (not e!301539))))

(declare-fun lt!236550 () SeekEntryResult!4381)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516736 (= res!316298 (or (= lt!236550 (MissingZero!4381 i!1204)) (= lt!236550 (MissingVacant!4381 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33092 (_ BitVec 32)) SeekEntryResult!4381)

(assert (=> b!516736 (= lt!236550 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!516737 () Bool)

(assert (=> b!516737 (= e!301539 (not e!301535))))

(declare-fun res!316300 () Bool)

(assert (=> b!516737 (=> res!316300 e!301535)))

(declare-fun lt!236552 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33092 (_ BitVec 32)) SeekEntryResult!4381)

(assert (=> b!516737 (= res!316300 (= lt!236551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236552 (select (store (arr!15914 a!3235) i!1204 k!2280) j!176) (array!33093 (store (arr!15914 a!3235) i!1204 k!2280) (size!16278 a!3235)) mask!3524)))))

(declare-fun lt!236554 () (_ BitVec 32))

(assert (=> b!516737 (= lt!236551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236554 (select (arr!15914 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516737 (= lt!236552 (toIndex!0 (select (store (arr!15914 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516737 (= lt!236554 (toIndex!0 (select (arr!15914 a!3235) j!176) mask!3524))))

(declare-fun e!301538 () Bool)

(assert (=> b!516737 e!301538))

(declare-fun res!316304 () Bool)

(assert (=> b!516737 (=> (not res!316304) (not e!301538))))

(assert (=> b!516737 (= res!316304 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16020 0))(
  ( (Unit!16021) )
))
(declare-fun lt!236553 () Unit!16020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16020)

(assert (=> b!516737 (= lt!236553 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516738 () Bool)

(declare-fun res!316302 () Bool)

(assert (=> b!516738 (=> (not res!316302) (not e!301536))))

(assert (=> b!516738 (= res!316302 (validKeyInArray!0 k!2280))))

(declare-fun b!516740 () Bool)

(assert (=> b!516740 (= e!301538 (= (seekEntryOrOpen!0 (select (arr!15914 a!3235) j!176) a!3235 mask!3524) (Found!4381 j!176)))))

(declare-fun b!516741 () Bool)

(declare-fun res!316305 () Bool)

(assert (=> b!516741 (=> (not res!316305) (not e!301536))))

(assert (=> b!516741 (= res!316305 (and (= (size!16278 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16278 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16278 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516742 () Bool)

(assert (=> b!516742 (= e!301535 (or (not (= (select (arr!15914 a!3235) (index!19714 lt!236551)) (select (arr!15914 a!3235) j!176))) (bvsgt (x!48664 lt!236551) #b01111111111111111111111111111110) (bvsle #b00000000000000000000000000000000 (x!48664 lt!236551))))))

(assert (=> b!516742 (and (bvslt (x!48664 lt!236551) #b01111111111111111111111111111110) (or (= (select (arr!15914 a!3235) (index!19714 lt!236551)) (select (arr!15914 a!3235) j!176)) (= (select (arr!15914 a!3235) (index!19714 lt!236551)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15914 a!3235) (index!19714 lt!236551)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516743 () Bool)

(declare-fun res!316307 () Bool)

(assert (=> b!516743 (=> (not res!316307) (not e!301539))))

(declare-datatypes ((List!10072 0))(
  ( (Nil!10069) (Cons!10068 (h!10966 (_ BitVec 64)) (t!16300 List!10072)) )
))
(declare-fun arrayNoDuplicates!0 (array!33092 (_ BitVec 32) List!10072) Bool)

(assert (=> b!516743 (= res!316307 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10069))))

(declare-fun b!516739 () Bool)

(declare-fun res!316297 () Bool)

(assert (=> b!516739 (=> (not res!316297) (not e!301536))))

(declare-fun arrayContainsKey!0 (array!33092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516739 (= res!316297 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!316303 () Bool)

(assert (=> start!46780 (=> (not res!316303) (not e!301536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46780 (= res!316303 (validMask!0 mask!3524))))

(assert (=> start!46780 e!301536))

(assert (=> start!46780 true))

(declare-fun array_inv!11710 (array!33092) Bool)

(assert (=> start!46780 (array_inv!11710 a!3235)))

(assert (= (and start!46780 res!316303) b!516741))

(assert (= (and b!516741 res!316305) b!516735))

(assert (= (and b!516735 res!316299) b!516738))

(assert (= (and b!516738 res!316302) b!516739))

(assert (= (and b!516739 res!316297) b!516736))

(assert (= (and b!516736 res!316298) b!516733))

(assert (= (and b!516733 res!316301) b!516743))

(assert (= (and b!516743 res!316307) b!516737))

(assert (= (and b!516737 res!316304) b!516740))

(assert (= (and b!516737 (not res!316300)) b!516734))

(assert (= (and b!516734 (not res!316306)) b!516742))

(declare-fun m!498265 () Bool)

(assert (=> b!516738 m!498265))

(declare-fun m!498267 () Bool)

(assert (=> b!516743 m!498267))

(declare-fun m!498269 () Bool)

(assert (=> start!46780 m!498269))

(declare-fun m!498271 () Bool)

(assert (=> start!46780 m!498271))

(declare-fun m!498273 () Bool)

(assert (=> b!516739 m!498273))

(declare-fun m!498275 () Bool)

(assert (=> b!516737 m!498275))

(declare-fun m!498277 () Bool)

(assert (=> b!516737 m!498277))

(declare-fun m!498279 () Bool)

(assert (=> b!516737 m!498279))

(assert (=> b!516737 m!498275))

(declare-fun m!498281 () Bool)

(assert (=> b!516737 m!498281))

(declare-fun m!498283 () Bool)

(assert (=> b!516737 m!498283))

(assert (=> b!516737 m!498281))

(declare-fun m!498285 () Bool)

(assert (=> b!516737 m!498285))

(assert (=> b!516737 m!498275))

(declare-fun m!498287 () Bool)

(assert (=> b!516737 m!498287))

(assert (=> b!516737 m!498281))

(declare-fun m!498289 () Bool)

(assert (=> b!516737 m!498289))

(declare-fun m!498291 () Bool)

(assert (=> b!516737 m!498291))

(declare-fun m!498293 () Bool)

(assert (=> b!516733 m!498293))

(declare-fun m!498295 () Bool)

(assert (=> b!516742 m!498295))

(assert (=> b!516742 m!498281))

(assert (=> b!516735 m!498281))

(assert (=> b!516735 m!498281))

(declare-fun m!498297 () Bool)

(assert (=> b!516735 m!498297))

(assert (=> b!516740 m!498281))

(assert (=> b!516740 m!498281))

(declare-fun m!498299 () Bool)

(assert (=> b!516740 m!498299))

(declare-fun m!498301 () Bool)

(assert (=> b!516736 m!498301))

(push 1)

(assert (not b!516738))

(assert (not b!516735))

(assert (not b!516743))

(assert (not b!516733))

(assert (not b!516739))

(assert (not b!516740))

(assert (not start!46780))

(assert (not b!516737))

(assert (not b!516736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!516849 () Bool)

(declare-fun e!301607 () SeekEntryResult!4381)

(declare-fun lt!236602 () SeekEntryResult!4381)

(assert (=> b!516849 (= e!301607 (MissingZero!4381 (index!19714 lt!236602)))))

(declare-fun d!79587 () Bool)

(declare-fun lt!236604 () SeekEntryResult!4381)

(assert (=> d!79587 (and (or (is-Undefined!4381 lt!236604) (not (is-Found!4381 lt!236604)) (and (bvsge (index!19713 lt!236604) #b00000000000000000000000000000000) (bvslt (index!19713 lt!236604) (size!16278 a!3235)))) (or (is-Undefined!4381 lt!236604) (is-Found!4381 lt!236604) (not (is-MissingZero!4381 lt!236604)) (and (bvsge (index!19712 lt!236604) #b00000000000000000000000000000000) (bvslt (index!19712 lt!236604) (size!16278 a!3235)))) (or (is-Undefined!4381 lt!236604) (is-Found!4381 lt!236604) (is-MissingZero!4381 lt!236604) (not (is-MissingVacant!4381 lt!236604)) (and (bvsge (index!19715 lt!236604) #b00000000000000000000000000000000) (bvslt (index!19715 lt!236604) (size!16278 a!3235)))) (or (is-Undefined!4381 lt!236604) (ite (is-Found!4381 lt!236604) (= (select (arr!15914 a!3235) (index!19713 lt!236604)) (select (arr!15914 a!3235) j!176)) (ite (is-MissingZero!4381 lt!236604) (= (select (arr!15914 a!3235) (index!19712 lt!236604)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4381 lt!236604) (= (select (arr!15914 a!3235) (index!19715 lt!236604)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!301606 () SeekEntryResult!4381)

(assert (=> d!79587 (= lt!236604 e!301606)))

(declare-fun c!60543 () Bool)

(assert (=> d!79587 (= c!60543 (and (is-Intermediate!4381 lt!236602) (undefined!5193 lt!236602)))))

(assert (=> d!79587 (= lt!236602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15914 a!3235) j!176) mask!3524) (select (arr!15914 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79587 (validMask!0 mask!3524)))

(assert (=> d!79587 (= (seekEntryOrOpen!0 (select (arr!15914 a!3235) j!176) a!3235 mask!3524) lt!236604)))

(declare-fun b!516850 () Bool)

(declare-fun e!301605 () SeekEntryResult!4381)

(assert (=> b!516850 (= e!301605 (Found!4381 (index!19714 lt!236602)))))

(declare-fun b!516851 () Bool)

(assert (=> b!516851 (= e!301606 e!301605)))

(declare-fun lt!236603 () (_ BitVec 64))

(assert (=> b!516851 (= lt!236603 (select (arr!15914 a!3235) (index!19714 lt!236602)))))

(declare-fun c!60545 () Bool)

(assert (=> b!516851 (= c!60545 (= lt!236603 (select (arr!15914 a!3235) j!176)))))

(declare-fun b!516852 () Bool)

(assert (=> b!516852 (= e!301606 Undefined!4381)))

(declare-fun b!516853 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33092 (_ BitVec 32)) SeekEntryResult!4381)

(assert (=> b!516853 (= e!301607 (seekKeyOrZeroReturnVacant!0 (x!48664 lt!236602) (index!19714 lt!236602) (index!19714 lt!236602) (select (arr!15914 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!516854 () Bool)

(declare-fun c!60544 () Bool)

(assert (=> b!516854 (= c!60544 (= lt!236603 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!516854 (= e!301605 e!301607)))

(assert (= (and d!79587 c!60543) b!516852))

(assert (= (and d!79587 (not c!60543)) b!516851))

(assert (= (and b!516851 c!60545) b!516850))

(assert (= (and b!516851 (not c!60545)) b!516854))

(assert (= (and b!516854 c!60544) b!516849))

(assert (= (and b!516854 (not c!60544)) b!516853))

(assert (=> d!79587 m!498283))

(assert (=> d!79587 m!498281))

(declare-fun m!498355 () Bool)

(assert (=> d!79587 m!498355))

(declare-fun m!498357 () Bool)

(assert (=> d!79587 m!498357))

(declare-fun m!498359 () Bool)

(assert (=> d!79587 m!498359))

(assert (=> d!79587 m!498281))

(assert (=> d!79587 m!498283))

(declare-fun m!498361 () Bool)

(assert (=> d!79587 m!498361))

(assert (=> d!79587 m!498269))

(declare-fun m!498363 () Bool)

(assert (=> b!516851 m!498363))

(assert (=> b!516853 m!498281))

(declare-fun m!498365 () Bool)

(assert (=> b!516853 m!498365))

(assert (=> b!516740 d!79587))

(declare-fun d!79599 () Bool)

(assert (=> d!79599 (= (validKeyInArray!0 (select (arr!15914 a!3235) j!176)) (and (not (= (select (arr!15914 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15914 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!516735 d!79599))

(declare-fun d!79603 () Bool)

(declare-fun res!316347 () Bool)

(declare-fun e!301612 () Bool)

(assert (=> d!79603 (=> res!316347 e!301612)))

(assert (=> d!79603 (= res!316347 (= (select (arr!15914 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79603 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!301612)))

(declare-fun b!516859 () Bool)

(declare-fun e!301613 () Bool)

(assert (=> b!516859 (= e!301612 e!301613)))

(declare-fun res!316348 () Bool)

(assert (=> b!516859 (=> (not res!316348) (not e!301613))))

(assert (=> b!516859 (= res!316348 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16278 a!3235)))))

(declare-fun b!516860 () Bool)

(assert (=> b!516860 (= e!301613 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79603 (not res!316347)) b!516859))

(assert (= (and b!516859 res!316348) b!516860))

(declare-fun m!498369 () Bool)

(assert (=> d!79603 m!498369))

(declare-fun m!498371 () Bool)

(assert (=> b!516860 m!498371))

(assert (=> b!516739 d!79603))

(declare-fun d!79609 () Bool)

(declare-fun res!316364 () Bool)

(declare-fun e!301634 () Bool)

(assert (=> d!79609 (=> res!316364 e!301634)))

(assert (=> d!79609 (= res!316364 (bvsge #b00000000000000000000000000000000 (size!16278 a!3235)))))

(assert (=> d!79609 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10069) e!301634)))

(declare-fun b!516881 () Bool)

(declare-fun e!301632 () Bool)

(declare-fun call!31653 () Bool)

(assert (=> b!516881 (= e!301632 call!31653)))

(declare-fun b!516882 () Bool)

(assert (=> b!516882 (= e!301632 call!31653)))

(declare-fun bm!31650 () Bool)

(declare-fun c!60549 () Bool)

(assert (=> bm!31650 (= call!31653 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60549 (Cons!10068 (select (arr!15914 a!3235) #b00000000000000000000000000000000) Nil!10069) Nil!10069)))))

(declare-fun b!516883 () Bool)

(declare-fun e!301631 () Bool)

(assert (=> b!516883 (= e!301634 e!301631)))

(declare-fun res!316363 () Bool)

(assert (=> b!516883 (=> (not res!316363) (not e!301631))))

(declare-fun e!301633 () Bool)

(assert (=> b!516883 (= res!316363 (not e!301633))))

(declare-fun res!316365 () Bool)

(assert (=> b!516883 (=> (not res!316365) (not e!301633))))

(assert (=> b!516883 (= res!316365 (validKeyInArray!0 (select (arr!15914 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!516884 () Bool)

(assert (=> b!516884 (= e!301631 e!301632)))

(assert (=> b!516884 (= c!60549 (validKeyInArray!0 (select (arr!15914 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!516885 () Bool)

(declare-fun contains!2741 (List!10072 (_ BitVec 64)) Bool)

(assert (=> b!516885 (= e!301633 (contains!2741 Nil!10069 (select (arr!15914 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79609 (not res!316364)) b!516883))

(assert (= (and b!516883 res!316365) b!516885))

(assert (= (and b!516883 res!316363) b!516884))

(assert (= (and b!516884 c!60549) b!516881))

(assert (= (and b!516884 (not c!60549)) b!516882))

(assert (= (or b!516881 b!516882) bm!31650))

(assert (=> bm!31650 m!498369))

(declare-fun m!498383 () Bool)

(assert (=> bm!31650 m!498383))

(assert (=> b!516883 m!498369))

(assert (=> b!516883 m!498369))

(declare-fun m!498385 () Bool)

(assert (=> b!516883 m!498385))

(assert (=> b!516884 m!498369))

(assert (=> b!516884 m!498369))

(assert (=> b!516884 m!498385))

(assert (=> b!516885 m!498369))

(assert (=> b!516885 m!498369))

(declare-fun m!498387 () Bool)

(assert (=> b!516885 m!498387))

(assert (=> b!516743 d!79609))

(declare-fun d!79619 () Bool)

(assert (=> d!79619 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46780 d!79619))

(declare-fun d!79635 () Bool)

(assert (=> d!79635 (= (array_inv!11710 a!3235) (bvsge (size!16278 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46780 d!79635))

(declare-fun d!79637 () Bool)

(assert (=> d!79637 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!516738 d!79637))

(declare-fun d!79639 () Bool)

(declare-fun res!316388 () Bool)

(declare-fun e!301669 () Bool)

(assert (=> d!79639 (=> res!316388 e!301669)))

(assert (=> d!79639 (= res!316388 (bvsge #b00000000000000000000000000000000 (size!16278 a!3235)))))

(assert (=> d!79639 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!301669)))

(declare-fun b!516937 () Bool)

(declare-fun e!301670 () Bool)

(declare-fun call!31660 () Bool)

(assert (=> b!516937 (= e!301670 call!31660)))

(declare-fun b!516938 () Bool)

(declare-fun e!301671 () Bool)

(assert (=> b!516938 (= e!301670 e!301671)))

(declare-fun lt!236640 () (_ BitVec 64))

(assert (=> b!516938 (= lt!236640 (select (arr!15914 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236642 () Unit!16020)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33092 (_ BitVec 64) (_ BitVec 32)) Unit!16020)

(assert (=> b!516938 (= lt!236642 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236640 #b00000000000000000000000000000000))))

(assert (=> b!516938 (arrayContainsKey!0 a!3235 lt!236640 #b00000000000000000000000000000000)))

(declare-fun lt!236641 () Unit!16020)

(assert (=> b!516938 (= lt!236641 lt!236642)))

(declare-fun res!316387 () Bool)

(assert (=> b!516938 (= res!316387 (= (seekEntryOrOpen!0 (select (arr!15914 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4381 #b00000000000000000000000000000000)))))

(assert (=> b!516938 (=> (not res!316387) (not e!301671))))

(declare-fun b!516939 () Bool)

(assert (=> b!516939 (= e!301671 call!31660)))

(declare-fun b!516940 () Bool)

(assert (=> b!516940 (= e!301669 e!301670)))

(declare-fun c!60565 () Bool)

(assert (=> b!516940 (= c!60565 (validKeyInArray!0 (select (arr!15914 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31657 () Bool)

(assert (=> bm!31657 (= call!31660 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79639 (not res!316388)) b!516940))

(assert (= (and b!516940 c!60565) b!516938))

(assert (= (and b!516940 (not c!60565)) b!516937))

(assert (= (and b!516938 res!316387) b!516939))

(assert (= (or b!516939 b!516937) bm!31657))

(assert (=> b!516938 m!498369))

(declare-fun m!498417 () Bool)

(assert (=> b!516938 m!498417))

(declare-fun m!498419 () Bool)

(assert (=> b!516938 m!498419))

(assert (=> b!516938 m!498369))

(declare-fun m!498421 () Bool)

(assert (=> b!516938 m!498421))

(assert (=> b!516940 m!498369))

(assert (=> b!516940 m!498369))

(assert (=> b!516940 m!498385))

(declare-fun m!498423 () Bool)

(assert (=> bm!31657 m!498423))

(assert (=> b!516733 d!79639))

(declare-fun b!516941 () Bool)

(declare-fun e!301674 () SeekEntryResult!4381)

(declare-fun lt!236643 () SeekEntryResult!4381)

(assert (=> b!516941 (= e!301674 (MissingZero!4381 (index!19714 lt!236643)))))

(declare-fun d!79643 () Bool)

(declare-fun lt!236645 () SeekEntryResult!4381)

(assert (=> d!79643 (and (or (is-Undefined!4381 lt!236645) (not (is-Found!4381 lt!236645)) (and (bvsge (index!19713 lt!236645) #b00000000000000000000000000000000) (bvslt (index!19713 lt!236645) (size!16278 a!3235)))) (or (is-Undefined!4381 lt!236645) (is-Found!4381 lt!236645) (not (is-MissingZero!4381 lt!236645)) (and (bvsge (index!19712 lt!236645) #b00000000000000000000000000000000) (bvslt (index!19712 lt!236645) (size!16278 a!3235)))) (or (is-Undefined!4381 lt!236645) (is-Found!4381 lt!236645) (is-MissingZero!4381 lt!236645) (not (is-MissingVacant!4381 lt!236645)) (and (bvsge (index!19715 lt!236645) #b00000000000000000000000000000000) (bvslt (index!19715 lt!236645) (size!16278 a!3235)))) (or (is-Undefined!4381 lt!236645) (ite (is-Found!4381 lt!236645) (= (select (arr!15914 a!3235) (index!19713 lt!236645)) k!2280) (ite (is-MissingZero!4381 lt!236645) (= (select (arr!15914 a!3235) (index!19712 lt!236645)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4381 lt!236645) (= (select (arr!15914 a!3235) (index!19715 lt!236645)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!301673 () SeekEntryResult!4381)

(assert (=> d!79643 (= lt!236645 e!301673)))

(declare-fun c!60566 () Bool)

(assert (=> d!79643 (= c!60566 (and (is-Intermediate!4381 lt!236643) (undefined!5193 lt!236643)))))

(assert (=> d!79643 (= lt!236643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79643 (validMask!0 mask!3524)))

(assert (=> d!79643 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!236645)))

(declare-fun b!516942 () Bool)

(declare-fun e!301672 () SeekEntryResult!4381)

(assert (=> b!516942 (= e!301672 (Found!4381 (index!19714 lt!236643)))))

(declare-fun b!516943 () Bool)

(assert (=> b!516943 (= e!301673 e!301672)))

(declare-fun lt!236644 () (_ BitVec 64))

(assert (=> b!516943 (= lt!236644 (select (arr!15914 a!3235) (index!19714 lt!236643)))))

(declare-fun c!60568 () Bool)

(assert (=> b!516943 (= c!60568 (= lt!236644 k!2280))))

(declare-fun b!516944 () Bool)

(assert (=> b!516944 (= e!301673 Undefined!4381)))

(declare-fun b!516945 () Bool)

(assert (=> b!516945 (= e!301674 (seekKeyOrZeroReturnVacant!0 (x!48664 lt!236643) (index!19714 lt!236643) (index!19714 lt!236643) k!2280 a!3235 mask!3524))))

(declare-fun b!516946 () Bool)

(declare-fun c!60567 () Bool)

(assert (=> b!516946 (= c!60567 (= lt!236644 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!516946 (= e!301672 e!301674)))

(assert (= (and d!79643 c!60566) b!516944))

(assert (= (and d!79643 (not c!60566)) b!516943))

(assert (= (and b!516943 c!60568) b!516942))

(assert (= (and b!516943 (not c!60568)) b!516946))

(assert (= (and b!516946 c!60567) b!516941))

(assert (= (and b!516946 (not c!60567)) b!516945))

(declare-fun m!498425 () Bool)

(assert (=> d!79643 m!498425))

(declare-fun m!498427 () Bool)

(assert (=> d!79643 m!498427))

(declare-fun m!498429 () Bool)

(assert (=> d!79643 m!498429))

(declare-fun m!498431 () Bool)

(assert (=> d!79643 m!498431))

(assert (=> d!79643 m!498425))

(declare-fun m!498433 () Bool)

(assert (=> d!79643 m!498433))

(assert (=> d!79643 m!498269))

(declare-fun m!498435 () Bool)

(assert (=> b!516943 m!498435))

(declare-fun m!498437 () Bool)

(assert (=> b!516945 m!498437))

(assert (=> b!516736 d!79643))

(declare-fun d!79645 () Bool)

(declare-fun lt!236655 () (_ BitVec 32))

(declare-fun lt!236654 () (_ BitVec 32))

(assert (=> d!79645 (= lt!236655 (bvmul (bvxor lt!236654 (bvlshr lt!236654 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79645 (= lt!236654 ((_ extract 31 0) (bvand (bvxor (select (arr!15914 a!3235) j!176) (bvlshr (select (arr!15914 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79645 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316389 (let ((h!10969 ((_ extract 31 0) (bvand (bvxor (select (arr!15914 a!3235) j!176) (bvlshr (select (arr!15914 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48669 (bvmul (bvxor h!10969 (bvlshr h!10969 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48669 (bvlshr x!48669 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316389 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316389 #b00000000000000000000000000000000))))))

(assert (=> d!79645 (= (toIndex!0 (select (arr!15914 a!3235) j!176) mask!3524) (bvand (bvxor lt!236655 (bvlshr lt!236655 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!516737 d!79645))

(declare-fun d!79651 () Bool)

(declare-fun res!316397 () Bool)

(declare-fun e!301685 () Bool)

(assert (=> d!79651 (=> res!316397 e!301685)))

(assert (=> d!79651 (= res!316397 (bvsge j!176 (size!16278 a!3235)))))

(assert (=> d!79651 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!301685)))

(declare-fun b!516965 () Bool)

(declare-fun e!301686 () Bool)

(declare-fun call!31661 () Bool)

(assert (=> b!516965 (= e!301686 call!31661)))

(declare-fun b!516966 () Bool)

(declare-fun e!301687 () Bool)

(assert (=> b!516966 (= e!301686 e!301687)))

(declare-fun lt!236656 () (_ BitVec 64))

(assert (=> b!516966 (= lt!236656 (select (arr!15914 a!3235) j!176))))

(declare-fun lt!236658 () Unit!16020)

(assert (=> b!516966 (= lt!236658 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236656 j!176))))

(assert (=> b!516966 (arrayContainsKey!0 a!3235 lt!236656 #b00000000000000000000000000000000)))

(declare-fun lt!236657 () Unit!16020)

(assert (=> b!516966 (= lt!236657 lt!236658)))

(declare-fun res!316396 () Bool)

(assert (=> b!516966 (= res!316396 (= (seekEntryOrOpen!0 (select (arr!15914 a!3235) j!176) a!3235 mask!3524) (Found!4381 j!176)))))

(assert (=> b!516966 (=> (not res!316396) (not e!301687))))

(declare-fun b!516967 () Bool)

(assert (=> b!516967 (= e!301687 call!31661)))

(declare-fun b!516968 () Bool)

(assert (=> b!516968 (= e!301685 e!301686)))

(declare-fun c!60575 () Bool)

(assert (=> b!516968 (= c!60575 (validKeyInArray!0 (select (arr!15914 a!3235) j!176)))))

(declare-fun bm!31658 () Bool)

(assert (=> bm!31658 (= call!31661 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79651 (not res!316397)) b!516968))

(assert (= (and b!516968 c!60575) b!516966))

(assert (= (and b!516968 (not c!60575)) b!516965))

(assert (= (and b!516966 res!316396) b!516967))

(assert (= (or b!516967 b!516965) bm!31658))

(assert (=> b!516966 m!498281))

(declare-fun m!498455 () Bool)

(assert (=> b!516966 m!498455))

(declare-fun m!498457 () Bool)

(assert (=> b!516966 m!498457))

(assert (=> b!516966 m!498281))

(assert (=> b!516966 m!498299))

(assert (=> b!516968 m!498281))

(assert (=> b!516968 m!498281))

(assert (=> b!516968 m!498297))

(declare-fun m!498459 () Bool)

(assert (=> bm!31658 m!498459))

(assert (=> b!516737 d!79651))

(declare-fun b!516999 () Bool)

(declare-fun lt!236670 () SeekEntryResult!4381)

(assert (=> b!516999 (and (bvsge (index!19714 lt!236670) #b00000000000000000000000000000000) (bvslt (index!19714 lt!236670) (size!16278 a!3235)))))

(declare-fun e!301704 () Bool)

(assert (=> b!516999 (= e!301704 (= (select (arr!15914 a!3235) (index!19714 lt!236670)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517000 () Bool)

