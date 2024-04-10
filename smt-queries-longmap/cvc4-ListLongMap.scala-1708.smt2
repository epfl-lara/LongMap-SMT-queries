; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31386 () Bool)

(assert start!31386)

(declare-datatypes ((array!16057 0))(
  ( (array!16058 (arr!7603 (Array (_ BitVec 32) (_ BitVec 64))) (size!7955 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16057)

(declare-fun e!195890 () Bool)

(declare-datatypes ((SeekEntryResult!2743 0))(
  ( (MissingZero!2743 (index!13148 (_ BitVec 32))) (Found!2743 (index!13149 (_ BitVec 32))) (Intermediate!2743 (undefined!3555 Bool) (index!13150 (_ BitVec 32)) (x!31373 (_ BitVec 32))) (Undefined!2743) (MissingVacant!2743 (index!13151 (_ BitVec 32))) )
))
(declare-fun lt!153933 () SeekEntryResult!2743)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!153932 () SeekEntryResult!2743)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun b!314584 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!314584 (= e!195890 (and (= lt!153933 lt!153932) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7603 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7603 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7603 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!153933 (Intermediate!2743 false index!1781 resX!52)))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16057 (_ BitVec 32)) SeekEntryResult!2743)

(assert (=> b!314584 (= lt!153933 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314585 () Bool)

(declare-fun res!170340 () Bool)

(declare-fun e!195892 () Bool)

(assert (=> b!314585 (=> (not res!170340) (not e!195892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16057 (_ BitVec 32)) Bool)

(assert (=> b!314585 (= res!170340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!170337 () Bool)

(assert (=> start!31386 (=> (not res!170337) (not e!195892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31386 (= res!170337 (validMask!0 mask!3709))))

(assert (=> start!31386 e!195892))

(declare-fun array_inv!5566 (array!16057) Bool)

(assert (=> start!31386 (array_inv!5566 a!3293)))

(assert (=> start!31386 true))

(declare-fun b!314586 () Bool)

(declare-fun res!170335 () Bool)

(assert (=> b!314586 (=> (not res!170335) (not e!195892))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16057 (_ BitVec 32)) SeekEntryResult!2743)

(assert (=> b!314586 (= res!170335 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2743 i!1240)))))

(declare-fun b!314587 () Bool)

(declare-fun res!170336 () Bool)

(assert (=> b!314587 (=> (not res!170336) (not e!195892))))

(declare-fun arrayContainsKey!0 (array!16057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314587 (= res!170336 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314588 () Bool)

(declare-fun res!170338 () Bool)

(assert (=> b!314588 (=> (not res!170338) (not e!195892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314588 (= res!170338 (validKeyInArray!0 k!2441))))

(declare-fun b!314589 () Bool)

(assert (=> b!314589 (= e!195892 e!195890)))

(declare-fun res!170333 () Bool)

(assert (=> b!314589 (=> (not res!170333) (not e!195890))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314589 (= res!170333 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153932))))

(assert (=> b!314589 (= lt!153932 (Intermediate!2743 false resIndex!52 resX!52))))

(declare-fun b!314590 () Bool)

(declare-fun res!170339 () Bool)

(assert (=> b!314590 (=> (not res!170339) (not e!195890))))

(assert (=> b!314590 (= res!170339 (and (= (select (arr!7603 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7955 a!3293))))))

(declare-fun b!314591 () Bool)

(declare-fun res!170334 () Bool)

(assert (=> b!314591 (=> (not res!170334) (not e!195892))))

(assert (=> b!314591 (= res!170334 (and (= (size!7955 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7955 a!3293))))))

(assert (= (and start!31386 res!170337) b!314591))

(assert (= (and b!314591 res!170334) b!314588))

(assert (= (and b!314588 res!170338) b!314587))

(assert (= (and b!314587 res!170336) b!314586))

(assert (= (and b!314586 res!170335) b!314585))

(assert (= (and b!314585 res!170340) b!314589))

(assert (= (and b!314589 res!170333) b!314590))

(assert (= (and b!314590 res!170339) b!314584))

(declare-fun m!324121 () Bool)

(assert (=> b!314590 m!324121))

(declare-fun m!324123 () Bool)

(assert (=> b!314584 m!324123))

(declare-fun m!324125 () Bool)

(assert (=> b!314584 m!324125))

(declare-fun m!324127 () Bool)

(assert (=> b!314587 m!324127))

(declare-fun m!324129 () Bool)

(assert (=> b!314586 m!324129))

(declare-fun m!324131 () Bool)

(assert (=> b!314588 m!324131))

(declare-fun m!324133 () Bool)

(assert (=> b!314585 m!324133))

(declare-fun m!324135 () Bool)

(assert (=> b!314589 m!324135))

(assert (=> b!314589 m!324135))

(declare-fun m!324137 () Bool)

(assert (=> b!314589 m!324137))

(declare-fun m!324139 () Bool)

(assert (=> start!31386 m!324139))

(declare-fun m!324141 () Bool)

(assert (=> start!31386 m!324141))

(push 1)

(assert (not b!314587))

(assert (not start!31386))

(assert (not b!314589))

(assert (not b!314584))

(assert (not b!314586))

(assert (not b!314585))

(assert (not b!314588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!314634 () Bool)

(declare-fun e!195922 () Bool)

(declare-fun e!195918 () Bool)

(assert (=> b!314634 (= e!195922 e!195918)))

(declare-fun res!170354 () Bool)

(declare-fun lt!153947 () SeekEntryResult!2743)

(assert (=> b!314634 (= res!170354 (and (is-Intermediate!2743 lt!153947) (not (undefined!3555 lt!153947)) (bvslt (x!31373 lt!153947) #b01111111111111111111111111111110) (bvsge (x!31373 lt!153947) #b00000000000000000000000000000000) (bvsge (x!31373 lt!153947) #b00000000000000000000000000000000)))))

(assert (=> b!314634 (=> (not res!170354) (not e!195918))))

(declare-fun b!314635 () Bool)

(assert (=> b!314635 (and (bvsge (index!13150 lt!153947) #b00000000000000000000000000000000) (bvslt (index!13150 lt!153947) (size!7955 a!3293)))))

(declare-fun res!170355 () Bool)

(assert (=> b!314635 (= res!170355 (= (select (arr!7603 a!3293) (index!13150 lt!153947)) k!2441))))

(declare-fun e!195921 () Bool)

(assert (=> b!314635 (=> res!170355 e!195921)))

(assert (=> b!314635 (= e!195918 e!195921)))

(declare-fun b!314636 () Bool)

(declare-fun e!195920 () SeekEntryResult!2743)

(declare-fun e!195919 () SeekEntryResult!2743)

(assert (=> b!314636 (= e!195920 e!195919)))

(declare-fun c!49753 () Bool)

(declare-fun lt!153948 () (_ BitVec 64))

(assert (=> b!314636 (= c!49753 (or (= lt!153948 k!2441) (= (bvadd lt!153948 lt!153948) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314637 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314637 (= e!195919 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!314638 () Bool)

(assert (=> b!314638 (= e!195920 (Intermediate!2743 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314639 () Bool)

(assert (=> b!314639 (and (bvsge (index!13150 lt!153947) #b00000000000000000000000000000000) (bvslt (index!13150 lt!153947) (size!7955 a!3293)))))

(declare-fun res!170353 () Bool)

(assert (=> b!314639 (= res!170353 (= (select (arr!7603 a!3293) (index!13150 lt!153947)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314639 (=> res!170353 e!195921)))

(declare-fun b!314640 () Bool)

(assert (=> b!314640 (= e!195919 (Intermediate!2743 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!68779 () Bool)

(assert (=> d!68779 e!195922))

(declare-fun c!49755 () Bool)

(assert (=> d!68779 (= c!49755 (and (is-Intermediate!2743 lt!153947) (undefined!3555 lt!153947)))))

(assert (=> d!68779 (= lt!153947 e!195920)))

(declare-fun c!49754 () Bool)

(assert (=> d!68779 (= c!49754 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68779 (= lt!153948 (select (arr!7603 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68779 (validMask!0 mask!3709)))

(assert (=> d!68779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153947)))

(declare-fun b!314641 () Bool)

(assert (=> b!314641 (= e!195922 (bvsge (x!31373 lt!153947) #b01111111111111111111111111111110))))

(declare-fun b!314642 () Bool)

(assert (=> b!314642 (and (bvsge (index!13150 lt!153947) #b00000000000000000000000000000000) (bvslt (index!13150 lt!153947) (size!7955 a!3293)))))

(assert (=> b!314642 (= e!195921 (= (select (arr!7603 a!3293) (index!13150 lt!153947)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68779 c!49754) b!314638))

(assert (= (and d!68779 (not c!49754)) b!314636))

(assert (= (and b!314636 c!49753) b!314640))

(assert (= (and b!314636 (not c!49753)) b!314637))

(assert (= (and d!68779 c!49755) b!314641))

(assert (= (and d!68779 (not c!49755)) b!314634))

(assert (= (and b!314634 res!170354) b!314635))

(assert (= (and b!314635 (not res!170355)) b!314639))

(assert (= (and b!314639 (not res!170353)) b!314642))

(declare-fun m!324157 () Bool)

(assert (=> b!314635 m!324157))

(assert (=> b!314637 m!324135))

(declare-fun m!324159 () Bool)

(assert (=> b!314637 m!324159))

(assert (=> b!314637 m!324159))

(declare-fun m!324161 () Bool)

(assert (=> b!314637 m!324161))

(assert (=> b!314639 m!324157))

(assert (=> b!314642 m!324157))

(assert (=> d!68779 m!324135))

(declare-fun m!324163 () Bool)

(assert (=> d!68779 m!324163))

(assert (=> d!68779 m!324139))

(assert (=> b!314589 d!68779))

(declare-fun d!68787 () Bool)

(declare-fun lt!153954 () (_ BitVec 32))

(declare-fun lt!153953 () (_ BitVec 32))

(assert (=> d!68787 (= lt!153954 (bvmul (bvxor lt!153953 (bvlshr lt!153953 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68787 (= lt!153953 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68787 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170356 (let ((h!5361 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31375 (bvmul (bvxor h!5361 (bvlshr h!5361 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31375 (bvlshr x!31375 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170356 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170356 #b00000000000000000000000000000000))))))

(assert (=> d!68787 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!153954 (bvlshr lt!153954 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!314589 d!68787))

(declare-fun b!314643 () Bool)

(declare-fun e!195927 () Bool)

(declare-fun e!195923 () Bool)

(assert (=> b!314643 (= e!195927 e!195923)))

(declare-fun res!170358 () Bool)

(declare-fun lt!153955 () SeekEntryResult!2743)

(assert (=> b!314643 (= res!170358 (and (is-Intermediate!2743 lt!153955) (not (undefined!3555 lt!153955)) (bvslt (x!31373 lt!153955) #b01111111111111111111111111111110) (bvsge (x!31373 lt!153955) #b00000000000000000000000000000000) (bvsge (x!31373 lt!153955) x!1427)))))

(assert (=> b!314643 (=> (not res!170358) (not e!195923))))

(declare-fun b!314644 () Bool)

(assert (=> b!314644 (and (bvsge (index!13150 lt!153955) #b00000000000000000000000000000000) (bvslt (index!13150 lt!153955) (size!7955 a!3293)))))

(declare-fun res!170359 () Bool)

(assert (=> b!314644 (= res!170359 (= (select (arr!7603 a!3293) (index!13150 lt!153955)) k!2441))))

(declare-fun e!195926 () Bool)

(assert (=> b!314644 (=> res!170359 e!195926)))

(assert (=> b!314644 (= e!195923 e!195926)))

(declare-fun b!314645 () Bool)

(declare-fun e!195925 () SeekEntryResult!2743)

(declare-fun e!195924 () SeekEntryResult!2743)

(assert (=> b!314645 (= e!195925 e!195924)))

(declare-fun c!49756 () Bool)

(declare-fun lt!153956 () (_ BitVec 64))

(assert (=> b!314645 (= c!49756 (or (= lt!153956 k!2441) (= (bvadd lt!153956 lt!153956) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314646 () Bool)

(assert (=> b!314646 (= e!195924 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!314647 () Bool)

(assert (=> b!314647 (= e!195925 (Intermediate!2743 true index!1781 x!1427))))

(declare-fun b!314648 () Bool)

(assert (=> b!314648 (and (bvsge (index!13150 lt!153955) #b00000000000000000000000000000000) (bvslt (index!13150 lt!153955) (size!7955 a!3293)))))

(declare-fun res!170357 () Bool)

(assert (=> b!314648 (= res!170357 (= (select (arr!7603 a!3293) (index!13150 lt!153955)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314648 (=> res!170357 e!195926)))

(declare-fun b!314649 () Bool)

(assert (=> b!314649 (= e!195924 (Intermediate!2743 false index!1781 x!1427))))

(declare-fun d!68789 () Bool)

(assert (=> d!68789 e!195927))

(declare-fun c!49758 () Bool)

(assert (=> d!68789 (= c!49758 (and (is-Intermediate!2743 lt!153955) (undefined!3555 lt!153955)))))

(assert (=> d!68789 (= lt!153955 e!195925)))

(declare-fun c!49757 () Bool)

(assert (=> d!68789 (= c!49757 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68789 (= lt!153956 (select (arr!7603 a!3293) index!1781))))

(assert (=> d!68789 (validMask!0 mask!3709)))

(assert (=> d!68789 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153955)))

(declare-fun b!314650 () Bool)

(assert (=> b!314650 (= e!195927 (bvsge (x!31373 lt!153955) #b01111111111111111111111111111110))))

(declare-fun b!314651 () Bool)

(assert (=> b!314651 (and (bvsge (index!13150 lt!153955) #b00000000000000000000000000000000) (bvslt (index!13150 lt!153955) (size!7955 a!3293)))))

(assert (=> b!314651 (= e!195926 (= (select (arr!7603 a!3293) (index!13150 lt!153955)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68789 c!49757) b!314647))

(assert (= (and d!68789 (not c!49757)) b!314645))

(assert (= (and b!314645 c!49756) b!314649))

(assert (= (and b!314645 (not c!49756)) b!314646))

(assert (= (and d!68789 c!49758) b!314650))

(assert (= (and d!68789 (not c!49758)) b!314643))

(assert (= (and b!314643 res!170358) b!314644))

(assert (= (and b!314644 (not res!170359)) b!314648))

(assert (= (and b!314648 (not res!170357)) b!314651))

(declare-fun m!324165 () Bool)

(assert (=> b!314644 m!324165))

(declare-fun m!324167 () Bool)

(assert (=> b!314646 m!324167))

(assert (=> b!314646 m!324167))

(declare-fun m!324169 () Bool)

(assert (=> b!314646 m!324169))

(assert (=> b!314648 m!324165))

(assert (=> b!314651 m!324165))

(assert (=> d!68789 m!324123))

(assert (=> d!68789 m!324139))

(assert (=> b!314584 d!68789))

(declare-fun d!68791 () Bool)

(declare-fun res!170364 () Bool)

(declare-fun e!195932 () Bool)

(assert (=> d!68791 (=> res!170364 e!195932)))

(assert (=> d!68791 (= res!170364 (= (select (arr!7603 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68791 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!195932)))

(declare-fun b!314656 () Bool)

(declare-fun e!195933 () Bool)

(assert (=> b!314656 (= e!195932 e!195933)))

(declare-fun res!170365 () Bool)

(assert (=> b!314656 (=> (not res!170365) (not e!195933))))

(assert (=> b!314656 (= res!170365 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7955 a!3293)))))

(declare-fun b!314657 () Bool)

(assert (=> b!314657 (= e!195933 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68791 (not res!170364)) b!314656))

(assert (= (and b!314656 res!170365) b!314657))

(declare-fun m!324171 () Bool)

(assert (=> d!68791 m!324171))

(declare-fun m!324173 () Bool)

(assert (=> b!314657 m!324173))

(assert (=> b!314587 d!68791))

(declare-fun d!68793 () Bool)

(assert (=> d!68793 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314588 d!68793))

(declare-fun b!314754 () Bool)

(declare-fun e!195991 () SeekEntryResult!2743)

(declare-fun lt!153994 () SeekEntryResult!2743)

(assert (=> b!314754 (= e!195991 (Found!2743 (index!13150 lt!153994)))))

(declare-fun b!314755 () Bool)

(declare-fun e!195989 () SeekEntryResult!2743)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16057 (_ BitVec 32)) SeekEntryResult!2743)

(assert (=> b!314755 (= e!195989 (seekKeyOrZeroReturnVacant!0 (x!31373 lt!153994) (index!13150 lt!153994) (index!13150 lt!153994) k!2441 a!3293 mask!3709))))

(declare-fun b!314756 () Bool)

(declare-fun e!195990 () SeekEntryResult!2743)

(assert (=> b!314756 (= e!195990 Undefined!2743)))

(declare-fun b!314757 () Bool)

(assert (=> b!314757 (= e!195989 (MissingZero!2743 (index!13150 lt!153994)))))

(declare-fun d!68795 () Bool)

(declare-fun lt!153995 () SeekEntryResult!2743)

(assert (=> d!68795 (and (or (is-Undefined!2743 lt!153995) (not (is-Found!2743 lt!153995)) (and (bvsge (index!13149 lt!153995) #b00000000000000000000000000000000) (bvslt (index!13149 lt!153995) (size!7955 a!3293)))) (or (is-Undefined!2743 lt!153995) (is-Found!2743 lt!153995) (not (is-MissingZero!2743 lt!153995)) (and (bvsge (index!13148 lt!153995) #b00000000000000000000000000000000) (bvslt (index!13148 lt!153995) (size!7955 a!3293)))) (or (is-Undefined!2743 lt!153995) (is-Found!2743 lt!153995) (is-MissingZero!2743 lt!153995) (not (is-MissingVacant!2743 lt!153995)) (and (bvsge (index!13151 lt!153995) #b00000000000000000000000000000000) (bvslt (index!13151 lt!153995) (size!7955 a!3293)))) (or (is-Undefined!2743 lt!153995) (ite (is-Found!2743 lt!153995) (= (select (arr!7603 a!3293) (index!13149 lt!153995)) k!2441) (ite (is-MissingZero!2743 lt!153995) (= (select (arr!7603 a!3293) (index!13148 lt!153995)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2743 lt!153995) (= (select (arr!7603 a!3293) (index!13151 lt!153995)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68795 (= lt!153995 e!195990)))

(declare-fun c!49793 () Bool)

(assert (=> d!68795 (= c!49793 (and (is-Intermediate!2743 lt!153994) (undefined!3555 lt!153994)))))

(assert (=> d!68795 (= lt!153994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68795 (validMask!0 mask!3709)))

(assert (=> d!68795 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!153995)))

(declare-fun b!314758 () Bool)

(declare-fun c!49794 () Bool)

(declare-fun lt!153996 () (_ BitVec 64))

(assert (=> b!314758 (= c!49794 (= lt!153996 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314758 (= e!195991 e!195989)))

(declare-fun b!314759 () Bool)

(assert (=> b!314759 (= e!195990 e!195991)))

(assert (=> b!314759 (= lt!153996 (select (arr!7603 a!3293) (index!13150 lt!153994)))))

(declare-fun c!49792 () Bool)

(assert (=> b!314759 (= c!49792 (= lt!153996 k!2441))))

(assert (= (and d!68795 c!49793) b!314756))

(assert (= (and d!68795 (not c!49793)) b!314759))

(assert (= (and b!314759 c!49792) b!314754))

(assert (= (and b!314759 (not c!49792)) b!314758))

(assert (= (and b!314758 c!49794) b!314757))

(assert (= (and b!314758 (not c!49794)) b!314755))

(declare-fun m!324213 () Bool)

(assert (=> b!314755 m!324213))

(declare-fun m!324215 () Bool)

(assert (=> d!68795 m!324215))

(assert (=> d!68795 m!324135))

(assert (=> d!68795 m!324137))

(declare-fun m!324217 () Bool)

(assert (=> d!68795 m!324217))

(declare-fun m!324219 () Bool)

(assert (=> d!68795 m!324219))

(assert (=> d!68795 m!324135))

(assert (=> d!68795 m!324139))

(declare-fun m!324221 () Bool)

(assert (=> b!314759 m!324221))

(assert (=> b!314586 d!68795))

(declare-fun d!68811 () Bool)

(assert (=> d!68811 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31386 d!68811))

(declare-fun d!68815 () Bool)

(assert (=> d!68815 (= (array_inv!5566 a!3293) (bvsge (size!7955 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31386 d!68815))

(declare-fun b!314780 () Bool)

(declare-fun e!196008 () Bool)

(declare-fun call!25981 () Bool)

(assert (=> b!314780 (= e!196008 call!25981)))

(declare-fun b!314781 () Bool)

(declare-fun e!196009 () Bool)

(assert (=> b!314781 (= e!196009 call!25981)))

(declare-fun bm!25978 () Bool)

(assert (=> bm!25978 (= call!25981 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!68817 () Bool)

(declare-fun res!170409 () Bool)

(declare-fun e!196007 () Bool)

(assert (=> d!68817 (=> res!170409 e!196007)))

(assert (=> d!68817 (= res!170409 (bvsge #b00000000000000000000000000000000 (size!7955 a!3293)))))

(assert (=> d!68817 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196007)))

(declare-fun b!314782 () Bool)

(assert (=> b!314782 (= e!196009 e!196008)))

