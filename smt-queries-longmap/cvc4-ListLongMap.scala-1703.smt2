; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31260 () Bool)

(assert start!31260)

(declare-fun b!313811 () Bool)

(declare-fun res!169827 () Bool)

(declare-fun e!195535 () Bool)

(assert (=> b!313811 (=> (not res!169827) (not e!195535))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313811 (= res!169827 (validKeyInArray!0 k!2441))))

(declare-fun b!313812 () Bool)

(declare-fun res!169825 () Bool)

(assert (=> b!313812 (=> (not res!169825) (not e!195535))))

(declare-datatypes ((array!16021 0))(
  ( (array!16022 (arr!7588 (Array (_ BitVec 32) (_ BitVec 64))) (size!7940 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16021)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!313812 (= res!169825 (and (= (size!7940 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7940 a!3293))))))

(declare-fun b!313814 () Bool)

(declare-fun res!169828 () Bool)

(assert (=> b!313814 (=> (not res!169828) (not e!195535))))

(declare-datatypes ((SeekEntryResult!2728 0))(
  ( (MissingZero!2728 (index!13088 (_ BitVec 32))) (Found!2728 (index!13089 (_ BitVec 32))) (Intermediate!2728 (undefined!3540 Bool) (index!13090 (_ BitVec 32)) (x!31306 (_ BitVec 32))) (Undefined!2728) (MissingVacant!2728 (index!13091 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16021 (_ BitVec 32)) SeekEntryResult!2728)

(assert (=> b!313814 (= res!169828 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2728 i!1240)))))

(declare-fun b!313815 () Bool)

(declare-fun res!169824 () Bool)

(assert (=> b!313815 (=> (not res!169824) (not e!195535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16021 (_ BitVec 32)) Bool)

(assert (=> b!313815 (= res!169824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!313816 () Bool)

(declare-fun res!169829 () Bool)

(assert (=> b!313816 (=> (not res!169829) (not e!195535))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16021 (_ BitVec 32)) SeekEntryResult!2728)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313816 (= res!169829 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2728 false resIndex!52 resX!52)))))

(declare-fun b!313817 () Bool)

(declare-fun res!169826 () Bool)

(assert (=> b!313817 (=> (not res!169826) (not e!195535))))

(declare-fun arrayContainsKey!0 (array!16021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313817 (= res!169826 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!313813 () Bool)

(assert (=> b!313813 (= e!195535 (or (bvslt resIndex!52 #b00000000000000000000000000000000) (bvsge resIndex!52 (size!7940 a!3293))))))

(declare-fun res!169830 () Bool)

(assert (=> start!31260 (=> (not res!169830) (not e!195535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31260 (= res!169830 (validMask!0 mask!3709))))

(assert (=> start!31260 e!195535))

(declare-fun array_inv!5551 (array!16021) Bool)

(assert (=> start!31260 (array_inv!5551 a!3293)))

(assert (=> start!31260 true))

(assert (= (and start!31260 res!169830) b!313812))

(assert (= (and b!313812 res!169825) b!313811))

(assert (= (and b!313811 res!169827) b!313817))

(assert (= (and b!313817 res!169826) b!313814))

(assert (= (and b!313814 res!169828) b!313815))

(assert (= (and b!313815 res!169824) b!313816))

(assert (= (and b!313816 res!169829) b!313813))

(declare-fun m!323605 () Bool)

(assert (=> b!313817 m!323605))

(declare-fun m!323607 () Bool)

(assert (=> b!313814 m!323607))

(declare-fun m!323609 () Bool)

(assert (=> b!313811 m!323609))

(declare-fun m!323611 () Bool)

(assert (=> b!313815 m!323611))

(declare-fun m!323613 () Bool)

(assert (=> b!313816 m!323613))

(assert (=> b!313816 m!323613))

(declare-fun m!323615 () Bool)

(assert (=> b!313816 m!323615))

(declare-fun m!323617 () Bool)

(assert (=> start!31260 m!323617))

(declare-fun m!323619 () Bool)

(assert (=> start!31260 m!323619))

(push 1)

(assert (not start!31260))

(assert (not b!313815))

(assert (not b!313817))

(assert (not b!313814))

(assert (not b!313816))

(assert (not b!313811))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68665 () Bool)

(declare-fun lt!153722 () SeekEntryResult!2728)

(assert (=> d!68665 (and (or (is-Undefined!2728 lt!153722) (not (is-Found!2728 lt!153722)) (and (bvsge (index!13089 lt!153722) #b00000000000000000000000000000000) (bvslt (index!13089 lt!153722) (size!7940 a!3293)))) (or (is-Undefined!2728 lt!153722) (is-Found!2728 lt!153722) (not (is-MissingZero!2728 lt!153722)) (and (bvsge (index!13088 lt!153722) #b00000000000000000000000000000000) (bvslt (index!13088 lt!153722) (size!7940 a!3293)))) (or (is-Undefined!2728 lt!153722) (is-Found!2728 lt!153722) (is-MissingZero!2728 lt!153722) (not (is-MissingVacant!2728 lt!153722)) (and (bvsge (index!13091 lt!153722) #b00000000000000000000000000000000) (bvslt (index!13091 lt!153722) (size!7940 a!3293)))) (or (is-Undefined!2728 lt!153722) (ite (is-Found!2728 lt!153722) (= (select (arr!7588 a!3293) (index!13089 lt!153722)) k!2441) (ite (is-MissingZero!2728 lt!153722) (= (select (arr!7588 a!3293) (index!13088 lt!153722)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2728 lt!153722) (= (select (arr!7588 a!3293) (index!13091 lt!153722)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195576 () SeekEntryResult!2728)

(assert (=> d!68665 (= lt!153722 e!195576)))

(declare-fun c!49631 () Bool)

(declare-fun lt!153724 () SeekEntryResult!2728)

(assert (=> d!68665 (= c!49631 (and (is-Intermediate!2728 lt!153724) (undefined!3540 lt!153724)))))

(assert (=> d!68665 (= lt!153724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68665 (validMask!0 mask!3709)))

(assert (=> d!68665 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!153722)))

(declare-fun b!313888 () Bool)

(assert (=> b!313888 (= e!195576 Undefined!2728)))

(declare-fun b!313889 () Bool)

(declare-fun e!195577 () SeekEntryResult!2728)

(assert (=> b!313889 (= e!195577 (MissingZero!2728 (index!13090 lt!153724)))))

(declare-fun b!313891 () Bool)

(declare-fun c!49633 () Bool)

(declare-fun lt!153723 () (_ BitVec 64))

(assert (=> b!313891 (= c!49633 (= lt!153723 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195578 () SeekEntryResult!2728)

(assert (=> b!313891 (= e!195578 e!195577)))

(declare-fun b!313892 () Bool)

(assert (=> b!313892 (= e!195576 e!195578)))

(assert (=> b!313892 (= lt!153723 (select (arr!7588 a!3293) (index!13090 lt!153724)))))

(declare-fun c!49632 () Bool)

(assert (=> b!313892 (= c!49632 (= lt!153723 k!2441))))

(declare-fun b!313893 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16021 (_ BitVec 32)) SeekEntryResult!2728)

(assert (=> b!313893 (= e!195577 (seekKeyOrZeroReturnVacant!0 (x!31306 lt!153724) (index!13090 lt!153724) (index!13090 lt!153724) k!2441 a!3293 mask!3709))))

(declare-fun b!313894 () Bool)

(assert (=> b!313894 (= e!195578 (Found!2728 (index!13090 lt!153724)))))

(assert (= (and d!68665 c!49631) b!313888))

(assert (= (and d!68665 (not c!49631)) b!313892))

(assert (= (and b!313892 c!49632) b!313894))

(assert (= (and b!313892 (not c!49632)) b!313891))

(assert (= (and b!313891 c!49633) b!313889))

(assert (= (and b!313891 (not c!49633)) b!313893))

(declare-fun m!323649 () Bool)

(assert (=> d!68665 m!323649))

(assert (=> d!68665 m!323617))

(assert (=> d!68665 m!323613))

(assert (=> d!68665 m!323615))

(assert (=> d!68665 m!323613))

(declare-fun m!323651 () Bool)

(assert (=> d!68665 m!323651))

(declare-fun m!323653 () Bool)

(assert (=> d!68665 m!323653))

(declare-fun m!323655 () Bool)

(assert (=> b!313892 m!323655))

(declare-fun m!323657 () Bool)

(assert (=> b!313893 m!323657))

(assert (=> b!313814 d!68665))

(declare-fun b!313946 () Bool)

(declare-fun e!195612 () Bool)

(declare-fun call!25957 () Bool)

(assert (=> b!313946 (= e!195612 call!25957)))

(declare-fun b!313947 () Bool)

(declare-fun e!195611 () Bool)

(declare-fun e!195613 () Bool)

(assert (=> b!313947 (= e!195611 e!195613)))

(declare-fun c!49650 () Bool)

(assert (=> b!313947 (= c!49650 (validKeyInArray!0 (select (arr!7588 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!313948 () Bool)

(assert (=> b!313948 (= e!195613 call!25957)))

(declare-fun d!68685 () Bool)

(declare-fun res!169868 () Bool)

(assert (=> d!68685 (=> res!169868 e!195611)))

(assert (=> d!68685 (= res!169868 (bvsge #b00000000000000000000000000000000 (size!7940 a!3293)))))

(assert (=> d!68685 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195611)))

(declare-fun b!313949 () Bool)

(assert (=> b!313949 (= e!195613 e!195612)))

(declare-fun lt!153747 () (_ BitVec 64))

(assert (=> b!313949 (= lt!153747 (select (arr!7588 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9687 0))(
  ( (Unit!9688) )
))
(declare-fun lt!153746 () Unit!9687)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16021 (_ BitVec 64) (_ BitVec 32)) Unit!9687)

(assert (=> b!313949 (= lt!153746 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153747 #b00000000000000000000000000000000))))

(assert (=> b!313949 (arrayContainsKey!0 a!3293 lt!153747 #b00000000000000000000000000000000)))

(declare-fun lt!153745 () Unit!9687)

(assert (=> b!313949 (= lt!153745 lt!153746)))

(declare-fun res!169867 () Bool)

(assert (=> b!313949 (= res!169867 (= (seekEntryOrOpen!0 (select (arr!7588 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2728 #b00000000000000000000000000000000)))))

(assert (=> b!313949 (=> (not res!169867) (not e!195612))))

(declare-fun bm!25954 () Bool)

(assert (=> bm!25954 (= call!25957 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!68685 (not res!169868)) b!313947))

(assert (= (and b!313947 c!49650) b!313949))

(assert (= (and b!313947 (not c!49650)) b!313948))

(assert (= (and b!313949 res!169867) b!313946))

(assert (= (or b!313946 b!313948) bm!25954))

(declare-fun m!323675 () Bool)

(assert (=> b!313947 m!323675))

(assert (=> b!313947 m!323675))

(declare-fun m!323677 () Bool)

(assert (=> b!313947 m!323677))

(assert (=> b!313949 m!323675))

(declare-fun m!323679 () Bool)

(assert (=> b!313949 m!323679))

(declare-fun m!323681 () Bool)

(assert (=> b!313949 m!323681))

(assert (=> b!313949 m!323675))

(declare-fun m!323683 () Bool)

(assert (=> b!313949 m!323683))

(declare-fun m!323685 () Bool)

(assert (=> bm!25954 m!323685))

(assert (=> b!313815 d!68685))

(declare-fun b!313992 () Bool)

(declare-fun e!195645 () Bool)

(declare-fun lt!153776 () SeekEntryResult!2728)

(assert (=> b!313992 (= e!195645 (bvsge (x!31306 lt!153776) #b01111111111111111111111111111110))))

(declare-fun b!313993 () Bool)

(declare-fun e!195642 () SeekEntryResult!2728)

(assert (=> b!313993 (= e!195642 (Intermediate!2728 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313994 () Bool)

(assert (=> b!313994 (and (bvsge (index!13090 lt!153776) #b00000000000000000000000000000000) (bvslt (index!13090 lt!153776) (size!7940 a!3293)))))

(declare-fun res!169889 () Bool)

(assert (=> b!313994 (= res!169889 (= (select (arr!7588 a!3293) (index!13090 lt!153776)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195643 () Bool)

(assert (=> b!313994 (=> res!169889 e!195643)))

(declare-fun d!68693 () Bool)

(assert (=> d!68693 e!195645))

(declare-fun c!49663 () Bool)

(assert (=> d!68693 (= c!49663 (and (is-Intermediate!2728 lt!153776) (undefined!3540 lt!153776)))))

(declare-fun e!195646 () SeekEntryResult!2728)

(assert (=> d!68693 (= lt!153776 e!195646)))

(declare-fun c!49665 () Bool)

(assert (=> d!68693 (= c!49665 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153777 () (_ BitVec 64))

(assert (=> d!68693 (= lt!153777 (select (arr!7588 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68693 (validMask!0 mask!3709)))

(assert (=> d!68693 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153776)))

(declare-fun b!313995 () Bool)

