; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31256 () Bool)

(assert start!31256)

(declare-fun b!313769 () Bool)

(declare-fun res!169788 () Bool)

(declare-fun e!195523 () Bool)

(assert (=> b!313769 (=> (not res!169788) (not e!195523))))

(declare-datatypes ((array!16017 0))(
  ( (array!16018 (arr!7586 (Array (_ BitVec 32) (_ BitVec 64))) (size!7938 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16017)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313769 (= res!169788 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!313770 () Bool)

(declare-fun res!169782 () Bool)

(assert (=> b!313770 (=> (not res!169782) (not e!195523))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16017 (_ BitVec 32)) Bool)

(assert (=> b!313770 (= res!169782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!169784 () Bool)

(assert (=> start!31256 (=> (not res!169784) (not e!195523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31256 (= res!169784 (validMask!0 mask!3709))))

(assert (=> start!31256 e!195523))

(declare-fun array_inv!5549 (array!16017) Bool)

(assert (=> start!31256 (array_inv!5549 a!3293)))

(assert (=> start!31256 true))

(declare-fun b!313771 () Bool)

(declare-fun res!169786 () Bool)

(assert (=> b!313771 (=> (not res!169786) (not e!195523))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!313771 (= res!169786 (and (= (size!7938 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7938 a!3293))))))

(declare-fun b!313772 () Bool)

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!313772 (= e!195523 (or (bvslt resIndex!52 #b00000000000000000000000000000000) (bvsge resIndex!52 (size!7938 a!3293))))))

(declare-fun b!313773 () Bool)

(declare-fun res!169783 () Bool)

(assert (=> b!313773 (=> (not res!169783) (not e!195523))))

(declare-datatypes ((SeekEntryResult!2726 0))(
  ( (MissingZero!2726 (index!13080 (_ BitVec 32))) (Found!2726 (index!13081 (_ BitVec 32))) (Intermediate!2726 (undefined!3538 Bool) (index!13082 (_ BitVec 32)) (x!31304 (_ BitVec 32))) (Undefined!2726) (MissingVacant!2726 (index!13083 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16017 (_ BitVec 32)) SeekEntryResult!2726)

(assert (=> b!313773 (= res!169783 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2726 i!1240)))))

(declare-fun b!313774 () Bool)

(declare-fun res!169785 () Bool)

(assert (=> b!313774 (=> (not res!169785) (not e!195523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313774 (= res!169785 (validKeyInArray!0 k!2441))))

(declare-fun b!313775 () Bool)

(declare-fun res!169787 () Bool)

(assert (=> b!313775 (=> (not res!169787) (not e!195523))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16017 (_ BitVec 32)) SeekEntryResult!2726)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313775 (= res!169787 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2726 false resIndex!52 resX!52)))))

(assert (= (and start!31256 res!169784) b!313771))

(assert (= (and b!313771 res!169786) b!313774))

(assert (= (and b!313774 res!169785) b!313769))

(assert (= (and b!313769 res!169788) b!313773))

(assert (= (and b!313773 res!169783) b!313770))

(assert (= (and b!313770 res!169782) b!313775))

(assert (= (and b!313775 res!169787) b!313772))

(declare-fun m!323573 () Bool)

(assert (=> b!313769 m!323573))

(declare-fun m!323575 () Bool)

(assert (=> start!31256 m!323575))

(declare-fun m!323577 () Bool)

(assert (=> start!31256 m!323577))

(declare-fun m!323579 () Bool)

(assert (=> b!313775 m!323579))

(assert (=> b!313775 m!323579))

(declare-fun m!323581 () Bool)

(assert (=> b!313775 m!323581))

(declare-fun m!323583 () Bool)

(assert (=> b!313774 m!323583))

(declare-fun m!323585 () Bool)

(assert (=> b!313773 m!323585))

(declare-fun m!323587 () Bool)

(assert (=> b!313770 m!323587))

(push 1)

(assert (not b!313773))

(assert (not b!313774))

(assert (not b!313769))

(assert (not b!313775))

(assert (not b!313770))

(assert (not start!31256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68663 () Bool)

(declare-fun lt!153711 () SeekEntryResult!2726)

(assert (=> d!68663 (and (or (is-Undefined!2726 lt!153711) (not (is-Found!2726 lt!153711)) (and (bvsge (index!13081 lt!153711) #b00000000000000000000000000000000) (bvslt (index!13081 lt!153711) (size!7938 a!3293)))) (or (is-Undefined!2726 lt!153711) (is-Found!2726 lt!153711) (not (is-MissingZero!2726 lt!153711)) (and (bvsge (index!13080 lt!153711) #b00000000000000000000000000000000) (bvslt (index!13080 lt!153711) (size!7938 a!3293)))) (or (is-Undefined!2726 lt!153711) (is-Found!2726 lt!153711) (is-MissingZero!2726 lt!153711) (not (is-MissingVacant!2726 lt!153711)) (and (bvsge (index!13083 lt!153711) #b00000000000000000000000000000000) (bvslt (index!13083 lt!153711) (size!7938 a!3293)))) (or (is-Undefined!2726 lt!153711) (ite (is-Found!2726 lt!153711) (= (select (arr!7586 a!3293) (index!13081 lt!153711)) k!2441) (ite (is-MissingZero!2726 lt!153711) (= (select (arr!7586 a!3293) (index!13080 lt!153711)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2726 lt!153711) (= (select (arr!7586 a!3293) (index!13083 lt!153711)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195558 () SeekEntryResult!2726)

(assert (=> d!68663 (= lt!153711 e!195558)))

(declare-fun c!49620 () Bool)

(declare-fun lt!153710 () SeekEntryResult!2726)

(assert (=> d!68663 (= c!49620 (and (is-Intermediate!2726 lt!153710) (undefined!3538 lt!153710)))))

(assert (=> d!68663 (= lt!153710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68663 (validMask!0 mask!3709)))

(assert (=> d!68663 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!153711)))

(declare-fun b!313854 () Bool)

(declare-fun e!195559 () SeekEntryResult!2726)

(assert (=> b!313854 (= e!195559 (Found!2726 (index!13082 lt!153710)))))

(declare-fun b!313855 () Bool)

(assert (=> b!313855 (= e!195558 e!195559)))

(declare-fun lt!153709 () (_ BitVec 64))

(assert (=> b!313855 (= lt!153709 (select (arr!7586 a!3293) (index!13082 lt!153710)))))

(declare-fun c!49618 () Bool)

(assert (=> b!313855 (= c!49618 (= lt!153709 k!2441))))

(declare-fun b!313856 () Bool)

(assert (=> b!313856 (= e!195558 Undefined!2726)))

(declare-fun b!313857 () Bool)

(declare-fun c!49619 () Bool)

(assert (=> b!313857 (= c!49619 (= lt!153709 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195557 () SeekEntryResult!2726)

(assert (=> b!313857 (= e!195559 e!195557)))

(declare-fun b!313858 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16017 (_ BitVec 32)) SeekEntryResult!2726)

(assert (=> b!313858 (= e!195557 (seekKeyOrZeroReturnVacant!0 (x!31304 lt!153710) (index!13082 lt!153710) (index!13082 lt!153710) k!2441 a!3293 mask!3709))))

(declare-fun b!313859 () Bool)

(assert (=> b!313859 (= e!195557 (MissingZero!2726 (index!13082 lt!153710)))))

(assert (= (and d!68663 c!49620) b!313856))

(assert (= (and d!68663 (not c!49620)) b!313855))

(assert (= (and b!313855 c!49618) b!313854))

(assert (= (and b!313855 (not c!49618)) b!313857))

(assert (= (and b!313857 c!49619) b!313859))

(assert (= (and b!313857 (not c!49619)) b!313858))

(assert (=> d!68663 m!323579))

(assert (=> d!68663 m!323579))

(assert (=> d!68663 m!323581))

(declare-fun m!323635 () Bool)

(assert (=> d!68663 m!323635))

(declare-fun m!323637 () Bool)

(assert (=> d!68663 m!323637))

(assert (=> d!68663 m!323575))

(declare-fun m!323639 () Bool)

(assert (=> d!68663 m!323639))

(declare-fun m!323641 () Bool)

(assert (=> b!313855 m!323641))

(declare-fun m!323643 () Bool)

(assert (=> b!313858 m!323643))

(assert (=> b!313773 d!68663))

(declare-fun d!68671 () Bool)

(assert (=> d!68671 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313774 d!68671))

(declare-fun d!68673 () Bool)

(declare-fun res!169841 () Bool)

(declare-fun e!195564 () Bool)

(assert (=> d!68673 (=> res!169841 e!195564)))

(assert (=> d!68673 (= res!169841 (= (select (arr!7586 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68673 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!195564)))

(declare-fun b!313864 () Bool)

(declare-fun e!195565 () Bool)

(assert (=> b!313864 (= e!195564 e!195565)))

(declare-fun res!169842 () Bool)

(assert (=> b!313864 (=> (not res!169842) (not e!195565))))

(assert (=> b!313864 (= res!169842 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7938 a!3293)))))

(declare-fun b!313865 () Bool)

(assert (=> b!313865 (= e!195565 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68673 (not res!169841)) b!313864))

(assert (= (and b!313864 res!169842) b!313865))

(declare-fun m!323645 () Bool)

(assert (=> d!68673 m!323645))

(declare-fun m!323647 () Bool)

(assert (=> b!313865 m!323647))

(assert (=> b!313769 d!68673))

(declare-fun d!68675 () Bool)

(assert (=> d!68675 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31256 d!68675))

(declare-fun d!68681 () Bool)

(assert (=> d!68681 (= (array_inv!5549 a!3293) (bvsge (size!7938 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31256 d!68681))

(declare-fun b!313937 () Bool)

(declare-fun e!195610 () SeekEntryResult!2726)

(assert (=> b!313937 (= e!195610 (Intermediate!2726 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313938 () Bool)

(declare-fun e!195607 () Bool)

(declare-fun lt!153738 () SeekEntryResult!2726)

(assert (=> b!313938 (= e!195607 (bvsge (x!31304 lt!153738) #b01111111111111111111111111111110))))

(declare-fun d!68683 () Bool)

(assert (=> d!68683 e!195607))

(declare-fun c!49647 () Bool)

(assert (=> d!68683 (= c!49647 (and (is-Intermediate!2726 lt!153738) (undefined!3538 lt!153738)))))

(declare-fun e!195609 () SeekEntryResult!2726)

(assert (=> d!68683 (= lt!153738 e!195609)))

(declare-fun c!49649 () Bool)

(assert (=> d!68683 (= c!49649 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153737 () (_ BitVec 64))

(assert (=> d!68683 (= lt!153737 (select (arr!7586 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68683 (validMask!0 mask!3709)))

(assert (=> d!68683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153738)))

(declare-fun b!313939 () Bool)

(assert (=> b!313939 (and (bvsge (index!13082 lt!153738) #b00000000000000000000000000000000) (bvslt (index!13082 lt!153738) (size!7938 a!3293)))))

(declare-fun e!195608 () Bool)

(assert (=> b!313939 (= e!195608 (= (select (arr!7586 a!3293) (index!13082 lt!153738)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313940 () Bool)

(declare-fun e!195606 () Bool)

(assert (=> b!313940 (= e!195607 e!195606)))

(declare-fun res!169863 () Bool)

(assert (=> b!313940 (= res!169863 (and (is-Intermediate!2726 lt!153738) (not (undefined!3538 lt!153738)) (bvslt (x!31304 lt!153738) #b01111111111111111111111111111110) (bvsge (x!31304 lt!153738) #b00000000000000000000000000000000) (bvsge (x!31304 lt!153738) #b00000000000000000000000000000000)))))

(assert (=> b!313940 (=> (not res!169863) (not e!195606))))

(declare-fun b!313941 () Bool)

(assert (=> b!313941 (and (bvsge (index!13082 lt!153738) #b00000000000000000000000000000000) (bvslt (index!13082 lt!153738) (size!7938 a!3293)))))

(declare-fun res!169864 () Bool)

(assert (=> b!313941 (= res!169864 (= (select (arr!7586 a!3293) (index!13082 lt!153738)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313941 (=> res!169864 e!195608)))

(declare-fun b!313942 () Bool)

(assert (=> b!313942 (= e!195609 e!195610)))

(declare-fun c!49648 () Bool)

(assert (=> b!313942 (= c!49648 (or (= lt!153737 k!2441) (= (bvadd lt!153737 lt!153737) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313943 () Bool)

(assert (=> b!313943 (= e!195609 (Intermediate!2726 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313944 () Bool)

(assert (=> b!313944 (and (bvsge (index!13082 lt!153738) #b00000000000000000000000000000000) (bvslt (index!13082 lt!153738) (size!7938 a!3293)))))

(declare-fun res!169865 () Bool)

(assert (=> b!313944 (= res!169865 (= (select (arr!7586 a!3293) (index!13082 lt!153738)) k!2441))))

(assert (=> b!313944 (=> res!169865 e!195608)))

(assert (=> b!313944 (= e!195606 e!195608)))

(declare-fun b!313945 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313945 (= e!195610 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!68683 c!49649) b!313943))

(assert (= (and d!68683 (not c!49649)) b!313942))

(assert (= (and b!313942 c!49648) b!313937))

(assert (= (and b!313942 (not c!49648)) b!313945))

(assert (= (and d!68683 c!49647) b!313938))

(assert (= (and d!68683 (not c!49647)) b!313940))

(assert (= (and b!313940 res!169863) b!313944))

(assert (= (and b!313944 (not res!169865)) b!313941))

(assert (= (and b!313941 (not res!169864)) b!313939))

(declare-fun m!323667 () Bool)

(assert (=> b!313944 m!323667))

(assert (=> b!313941 m!323667))

(assert (=> b!313939 m!323667))

(assert (=> d!68683 m!323579))

(declare-fun m!323669 () Bool)

(assert (=> d!68683 m!323669))

(assert (=> d!68683 m!323575))

(assert (=> b!313945 m!323579))

(declare-fun m!323671 () Bool)

(assert (=> b!313945 m!323671))

(assert (=> b!313945 m!323671))

(declare-fun m!323673 () Bool)

(assert (=> b!313945 m!323673))

(assert (=> b!313775 d!68683))

(declare-fun d!68689 () Bool)

(declare-fun lt!153753 () (_ BitVec 32))

(declare-fun lt!153752 () (_ BitVec 32))

(assert (=> d!68689 (= lt!153753 (bvmul (bvxor lt!153752 (bvlshr lt!153752 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68689 (= lt!153752 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68689 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169866 (let ((h!5356 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31310 (bvmul (bvxor h!5356 (bvlshr h!5356 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31310 (bvlshr x!31310 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169866 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169866 #b00000000000000000000000000000000))))))

(assert (=> d!68689 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!153753 (bvlshr lt!153753 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313775 d!68689))

(declare-fun b!313970 () Bool)

(declare-fun e!195630 () Bool)

(declare-fun e!195631 () Bool)

(assert (=> b!313970 (= e!195630 e!195631)))

(declare-fun lt!153771 () (_ BitVec 64))

(assert (=> b!313970 (= lt!153771 (select (arr!7586 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9685 0))(
  ( (Unit!9686) )
))
(declare-fun lt!153769 () Unit!9685)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16017 (_ BitVec 64) (_ BitVec 32)) Unit!9685)

(assert (=> b!313970 (= lt!153769 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153771 #b00000000000000000000000000000000))))

(assert (=> b!313970 (arrayContainsKey!0 a!3293 lt!153771 #b00000000000000000000000000000000)))

(declare-fun lt!153770 () Unit!9685)

(assert (=> b!313970 (= lt!153770 lt!153769)))

(declare-fun res!169879 () Bool)

(assert (=> b!313970 (= res!169879 (= (seekEntryOrOpen!0 (select (arr!7586 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2726 #b00000000000000000000000000000000)))))

(assert (=> b!313970 (=> (not res!169879) (not e!195631))))

(declare-fun bm!25960 () Bool)

(declare-fun call!25963 () Bool)

(assert (=> bm!25960 (= call!25963 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!313971 () Bool)

(assert (=> b!313971 (= e!195630 call!25963)))

(declare-fun b!313972 () Bool)

(declare-fun e!195629 () Bool)

(assert (=> b!313972 (= e!195629 e!195630)))

(declare-fun c!49656 () Bool)

(assert (=> b!313972 (= c!49656 (validKeyInArray!0 (select (arr!7586 a!3293) #b00000000000000000000000000000000)))))

(declare-fun d!68695 () Bool)

(declare-fun res!169880 () Bool)

(assert (=> d!68695 (=> res!169880 e!195629)))

(assert (=> d!68695 (= res!169880 (bvsge #b00000000000000000000000000000000 (size!7938 a!3293)))))

(assert (=> d!68695 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195629)))

(declare-fun b!313973 () Bool)

(assert (=> b!313973 (= e!195631 call!25963)))

(assert (= (and d!68695 (not res!169880)) b!313972))

(assert (= (and b!313972 c!49656) b!313970))

(assert (= (and b!313972 (not c!49656)) b!313971))

(assert (= (and b!313970 res!169879) b!313973))

(assert (= (or b!313973 b!313971) bm!25960))

(assert (=> b!313970 m!323645))

(declare-fun m!323697 () Bool)

(assert (=> b!313970 m!323697))

(declare-fun m!323699 () Bool)

(assert (=> b!313970 m!323699))

(assert (=> b!313970 m!323645))

(declare-fun m!323701 () Bool)

(assert (=> b!313970 m!323701))

(declare-fun m!323703 () Bool)

(assert (=> bm!25960 m!323703))

(assert (=> b!313972 m!323645))

(assert (=> b!313972 m!323645))

(declare-fun m!323705 () Bool)

(assert (=> b!313972 m!323705))

(assert (=> b!313770 d!68695))

(push 1)

(assert (not b!313858))

(assert (not b!313970))

(assert (not d!68683))

(assert (not d!68663))

(assert (not bm!25960))

(assert (not b!313972))

(assert (not b!313865))

(assert (not b!313945))

(check-sat)

(pop 1)

(push 1)

(check-sat)

