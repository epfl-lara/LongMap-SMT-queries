; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31312 () Bool)

(assert start!31312)

(declare-fun b!314052 () Bool)

(declare-fun res!169947 () Bool)

(declare-fun e!195668 () Bool)

(assert (=> b!314052 (=> (not res!169947) (not e!195668))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314052 (= res!169947 (validKeyInArray!0 k0!2441))))

(declare-fun b!314053 () Bool)

(declare-fun e!195669 () Bool)

(assert (=> b!314053 (= e!195668 e!195669)))

(declare-fun res!169945 () Bool)

(assert (=> b!314053 (=> (not res!169945) (not e!195669))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2730 0))(
  ( (MissingZero!2730 (index!13096 (_ BitVec 32))) (Found!2730 (index!13097 (_ BitVec 32))) (Intermediate!2730 (undefined!3542 Bool) (index!13098 (_ BitVec 32)) (x!31322 (_ BitVec 32))) (Undefined!2730) (MissingVacant!2730 (index!13099 (_ BitVec 32))) )
))
(declare-fun lt!153789 () SeekEntryResult!2730)

(declare-datatypes ((array!16028 0))(
  ( (array!16029 (arr!7590 (Array (_ BitVec 32) (_ BitVec 64))) (size!7942 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16028)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16028 (_ BitVec 32)) SeekEntryResult!2730)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314053 (= res!169945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153789))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!314053 (= lt!153789 (Intermediate!2730 false resIndex!52 resX!52))))

(declare-fun b!314054 () Bool)

(declare-fun res!169949 () Bool)

(assert (=> b!314054 (=> (not res!169949) (not e!195668))))

(declare-fun arrayContainsKey!0 (array!16028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314054 (= res!169949 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314055 () Bool)

(declare-fun res!169948 () Bool)

(assert (=> b!314055 (=> (not res!169948) (not e!195668))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16028 (_ BitVec 32)) SeekEntryResult!2730)

(assert (=> b!314055 (= res!169948 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2730 i!1240)))))

(declare-fun b!314056 () Bool)

(declare-fun res!169944 () Bool)

(assert (=> b!314056 (=> (not res!169944) (not e!195668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16028 (_ BitVec 32)) Bool)

(assert (=> b!314056 (= res!169944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314057 () Bool)

(declare-fun res!169946 () Bool)

(assert (=> b!314057 (=> (not res!169946) (not e!195668))))

(assert (=> b!314057 (= res!169946 (and (= (size!7942 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7942 a!3293))))))

(declare-fun res!169942 () Bool)

(assert (=> start!31312 (=> (not res!169942) (not e!195668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31312 (= res!169942 (validMask!0 mask!3709))))

(assert (=> start!31312 e!195668))

(declare-fun array_inv!5553 (array!16028) Bool)

(assert (=> start!31312 (array_inv!5553 a!3293)))

(assert (=> start!31312 true))

(declare-fun b!314058 () Bool)

(declare-fun res!169943 () Bool)

(assert (=> b!314058 (=> (not res!169943) (not e!195669))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314058 (= res!169943 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153789))))

(declare-fun b!314059 () Bool)

(assert (=> b!314059 (= e!195669 (bvslt (bvsub #b01111111111111111111111111111110 x!1427) #b00000000000000000000000000000000))))

(declare-fun b!314060 () Bool)

(declare-fun res!169950 () Bool)

(assert (=> b!314060 (=> (not res!169950) (not e!195669))))

(assert (=> b!314060 (= res!169950 (and (= (select (arr!7590 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7942 a!3293))))))

(assert (= (and start!31312 res!169942) b!314057))

(assert (= (and b!314057 res!169946) b!314052))

(assert (= (and b!314052 res!169947) b!314054))

(assert (= (and b!314054 res!169949) b!314055))

(assert (= (and b!314055 res!169948) b!314056))

(assert (= (and b!314056 res!169944) b!314053))

(assert (= (and b!314053 res!169945) b!314060))

(assert (= (and b!314060 res!169950) b!314058))

(assert (= (and b!314058 res!169943) b!314059))

(declare-fun m!323737 () Bool)

(assert (=> start!31312 m!323737))

(declare-fun m!323739 () Bool)

(assert (=> start!31312 m!323739))

(declare-fun m!323741 () Bool)

(assert (=> b!314060 m!323741))

(declare-fun m!323743 () Bool)

(assert (=> b!314053 m!323743))

(assert (=> b!314053 m!323743))

(declare-fun m!323745 () Bool)

(assert (=> b!314053 m!323745))

(declare-fun m!323747 () Bool)

(assert (=> b!314058 m!323747))

(declare-fun m!323749 () Bool)

(assert (=> b!314052 m!323749))

(declare-fun m!323751 () Bool)

(assert (=> b!314054 m!323751))

(declare-fun m!323753 () Bool)

(assert (=> b!314055 m!323753))

(declare-fun m!323755 () Bool)

(assert (=> b!314056 m!323755))

(check-sat (not b!314058) (not b!314056) (not b!314055) (not start!31312) (not b!314052) (not b!314053) (not b!314054))
(check-sat)
(get-model)

(declare-fun d!68709 () Bool)

(declare-fun res!169982 () Bool)

(declare-fun e!195684 () Bool)

(assert (=> d!68709 (=> res!169982 e!195684)))

(assert (=> d!68709 (= res!169982 (= (select (arr!7590 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68709 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195684)))

(declare-fun b!314092 () Bool)

(declare-fun e!195685 () Bool)

(assert (=> b!314092 (= e!195684 e!195685)))

(declare-fun res!169983 () Bool)

(assert (=> b!314092 (=> (not res!169983) (not e!195685))))

(assert (=> b!314092 (= res!169983 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7942 a!3293)))))

(declare-fun b!314093 () Bool)

(assert (=> b!314093 (= e!195685 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68709 (not res!169982)) b!314092))

(assert (= (and b!314092 res!169983) b!314093))

(declare-fun m!323777 () Bool)

(assert (=> d!68709 m!323777))

(declare-fun m!323779 () Bool)

(assert (=> b!314093 m!323779))

(assert (=> b!314054 d!68709))

(declare-fun d!68711 () Bool)

(declare-fun e!195702 () Bool)

(assert (=> d!68711 e!195702))

(declare-fun c!49672 () Bool)

(declare-fun lt!153797 () SeekEntryResult!2730)

(get-info :version)

(assert (=> d!68711 (= c!49672 (and ((_ is Intermediate!2730) lt!153797) (undefined!3542 lt!153797)))))

(declare-fun e!195704 () SeekEntryResult!2730)

(assert (=> d!68711 (= lt!153797 e!195704)))

(declare-fun c!49673 () Bool)

(assert (=> d!68711 (= c!49673 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153798 () (_ BitVec 64))

(assert (=> d!68711 (= lt!153798 (select (arr!7590 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68711 (validMask!0 mask!3709)))

(assert (=> d!68711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153797)))

(declare-fun b!314118 () Bool)

(declare-fun e!195703 () SeekEntryResult!2730)

(assert (=> b!314118 (= e!195703 (Intermediate!2730 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314119 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314119 (= e!195703 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314120 () Bool)

(assert (=> b!314120 (= e!195702 (bvsge (x!31322 lt!153797) #b01111111111111111111111111111110))))

(declare-fun b!314121 () Bool)

(assert (=> b!314121 (and (bvsge (index!13098 lt!153797) #b00000000000000000000000000000000) (bvslt (index!13098 lt!153797) (size!7942 a!3293)))))

(declare-fun e!195705 () Bool)

(assert (=> b!314121 (= e!195705 (= (select (arr!7590 a!3293) (index!13098 lt!153797)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314122 () Bool)

(assert (=> b!314122 (= e!195704 (Intermediate!2730 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314123 () Bool)

(assert (=> b!314123 (and (bvsge (index!13098 lt!153797) #b00000000000000000000000000000000) (bvslt (index!13098 lt!153797) (size!7942 a!3293)))))

(declare-fun res!169998 () Bool)

(assert (=> b!314123 (= res!169998 (= (select (arr!7590 a!3293) (index!13098 lt!153797)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314123 (=> res!169998 e!195705)))

(declare-fun b!314124 () Bool)

(assert (=> b!314124 (= e!195704 e!195703)))

(declare-fun c!49674 () Bool)

(assert (=> b!314124 (= c!49674 (or (= lt!153798 k0!2441) (= (bvadd lt!153798 lt!153798) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314125 () Bool)

(declare-fun e!195706 () Bool)

(assert (=> b!314125 (= e!195702 e!195706)))

(declare-fun res!169996 () Bool)

(assert (=> b!314125 (= res!169996 (and ((_ is Intermediate!2730) lt!153797) (not (undefined!3542 lt!153797)) (bvslt (x!31322 lt!153797) #b01111111111111111111111111111110) (bvsge (x!31322 lt!153797) #b00000000000000000000000000000000) (bvsge (x!31322 lt!153797) #b00000000000000000000000000000000)))))

(assert (=> b!314125 (=> (not res!169996) (not e!195706))))

(declare-fun b!314126 () Bool)

(assert (=> b!314126 (and (bvsge (index!13098 lt!153797) #b00000000000000000000000000000000) (bvslt (index!13098 lt!153797) (size!7942 a!3293)))))

(declare-fun res!169997 () Bool)

(assert (=> b!314126 (= res!169997 (= (select (arr!7590 a!3293) (index!13098 lt!153797)) k0!2441))))

(assert (=> b!314126 (=> res!169997 e!195705)))

(assert (=> b!314126 (= e!195706 e!195705)))

(assert (= (and d!68711 c!49673) b!314122))

(assert (= (and d!68711 (not c!49673)) b!314124))

(assert (= (and b!314124 c!49674) b!314118))

(assert (= (and b!314124 (not c!49674)) b!314119))

(assert (= (and d!68711 c!49672) b!314120))

(assert (= (and d!68711 (not c!49672)) b!314125))

(assert (= (and b!314125 res!169996) b!314126))

(assert (= (and b!314126 (not res!169997)) b!314123))

(assert (= (and b!314123 (not res!169998)) b!314121))

(assert (=> d!68711 m!323743))

(declare-fun m!323785 () Bool)

(assert (=> d!68711 m!323785))

(assert (=> d!68711 m!323737))

(declare-fun m!323787 () Bool)

(assert (=> b!314126 m!323787))

(assert (=> b!314123 m!323787))

(assert (=> b!314121 m!323787))

(assert (=> b!314119 m!323743))

(declare-fun m!323789 () Bool)

(assert (=> b!314119 m!323789))

(assert (=> b!314119 m!323789))

(declare-fun m!323791 () Bool)

(assert (=> b!314119 m!323791))

(assert (=> b!314053 d!68711))

(declare-fun d!68723 () Bool)

(declare-fun lt!153804 () (_ BitVec 32))

(declare-fun lt!153803 () (_ BitVec 32))

(assert (=> d!68723 (= lt!153804 (bvmul (bvxor lt!153803 (bvlshr lt!153803 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68723 (= lt!153803 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68723 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169999 (let ((h!5358 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31325 (bvmul (bvxor h!5358 (bvlshr h!5358 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31325 (bvlshr x!31325 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169999 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169999 #b00000000000000000000000000000000))))))

(assert (=> d!68723 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153804 (bvlshr lt!153804 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!314053 d!68723))

(declare-fun d!68725 () Bool)

(assert (=> d!68725 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31312 d!68725))

(declare-fun d!68727 () Bool)

(assert (=> d!68727 (= (array_inv!5553 a!3293) (bvsge (size!7942 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31312 d!68727))

(declare-fun d!68729 () Bool)

(declare-fun e!195713 () Bool)

(assert (=> d!68729 e!195713))

(declare-fun c!49681 () Bool)

(declare-fun lt!153811 () SeekEntryResult!2730)

(assert (=> d!68729 (= c!49681 (and ((_ is Intermediate!2730) lt!153811) (undefined!3542 lt!153811)))))

(declare-fun e!195715 () SeekEntryResult!2730)

(assert (=> d!68729 (= lt!153811 e!195715)))

(declare-fun c!49682 () Bool)

(assert (=> d!68729 (= c!49682 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153812 () (_ BitVec 64))

(assert (=> d!68729 (= lt!153812 (select (arr!7590 a!3293) index!1781))))

(assert (=> d!68729 (validMask!0 mask!3709)))

(assert (=> d!68729 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153811)))

(declare-fun b!314139 () Bool)

(declare-fun e!195714 () SeekEntryResult!2730)

(assert (=> b!314139 (= e!195714 (Intermediate!2730 false index!1781 x!1427))))

(declare-fun b!314140 () Bool)

(assert (=> b!314140 (= e!195714 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314141 () Bool)

(assert (=> b!314141 (= e!195713 (bvsge (x!31322 lt!153811) #b01111111111111111111111111111110))))

(declare-fun b!314142 () Bool)

(assert (=> b!314142 (and (bvsge (index!13098 lt!153811) #b00000000000000000000000000000000) (bvslt (index!13098 lt!153811) (size!7942 a!3293)))))

(declare-fun e!195716 () Bool)

(assert (=> b!314142 (= e!195716 (= (select (arr!7590 a!3293) (index!13098 lt!153811)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314143 () Bool)

(assert (=> b!314143 (= e!195715 (Intermediate!2730 true index!1781 x!1427))))

(declare-fun b!314144 () Bool)

(assert (=> b!314144 (and (bvsge (index!13098 lt!153811) #b00000000000000000000000000000000) (bvslt (index!13098 lt!153811) (size!7942 a!3293)))))

(declare-fun res!170002 () Bool)

(assert (=> b!314144 (= res!170002 (= (select (arr!7590 a!3293) (index!13098 lt!153811)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314144 (=> res!170002 e!195716)))

(declare-fun b!314145 () Bool)

(assert (=> b!314145 (= e!195715 e!195714)))

(declare-fun c!49683 () Bool)

(assert (=> b!314145 (= c!49683 (or (= lt!153812 k0!2441) (= (bvadd lt!153812 lt!153812) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314146 () Bool)

(declare-fun e!195717 () Bool)

(assert (=> b!314146 (= e!195713 e!195717)))

(declare-fun res!170000 () Bool)

(assert (=> b!314146 (= res!170000 (and ((_ is Intermediate!2730) lt!153811) (not (undefined!3542 lt!153811)) (bvslt (x!31322 lt!153811) #b01111111111111111111111111111110) (bvsge (x!31322 lt!153811) #b00000000000000000000000000000000) (bvsge (x!31322 lt!153811) x!1427)))))

(assert (=> b!314146 (=> (not res!170000) (not e!195717))))

(declare-fun b!314147 () Bool)

(assert (=> b!314147 (and (bvsge (index!13098 lt!153811) #b00000000000000000000000000000000) (bvslt (index!13098 lt!153811) (size!7942 a!3293)))))

(declare-fun res!170001 () Bool)

(assert (=> b!314147 (= res!170001 (= (select (arr!7590 a!3293) (index!13098 lt!153811)) k0!2441))))

(assert (=> b!314147 (=> res!170001 e!195716)))

(assert (=> b!314147 (= e!195717 e!195716)))

(assert (= (and d!68729 c!49682) b!314143))

(assert (= (and d!68729 (not c!49682)) b!314145))

(assert (= (and b!314145 c!49683) b!314139))

(assert (= (and b!314145 (not c!49683)) b!314140))

(assert (= (and d!68729 c!49681) b!314141))

(assert (= (and d!68729 (not c!49681)) b!314146))

(assert (= (and b!314146 res!170000) b!314147))

(assert (= (and b!314147 (not res!170001)) b!314144))

(assert (= (and b!314144 (not res!170002)) b!314142))

(declare-fun m!323793 () Bool)

(assert (=> d!68729 m!323793))

(assert (=> d!68729 m!323737))

(declare-fun m!323795 () Bool)

(assert (=> b!314147 m!323795))

(assert (=> b!314144 m!323795))

(assert (=> b!314142 m!323795))

(declare-fun m!323797 () Bool)

(assert (=> b!314140 m!323797))

(assert (=> b!314140 m!323797))

(declare-fun m!323799 () Bool)

(assert (=> b!314140 m!323799))

(assert (=> b!314058 d!68729))

(declare-fun d!68731 () Bool)

(assert (=> d!68731 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314052 d!68731))

(declare-fun bm!25965 () Bool)

(declare-fun call!25968 () Bool)

(assert (=> bm!25965 (= call!25968 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!314188 () Bool)

(declare-fun e!195744 () Bool)

(declare-fun e!195743 () Bool)

(assert (=> b!314188 (= e!195744 e!195743)))

(declare-fun lt!153834 () (_ BitVec 64))

(assert (=> b!314188 (= lt!153834 (select (arr!7590 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9691 0))(
  ( (Unit!9692) )
))
(declare-fun lt!153832 () Unit!9691)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16028 (_ BitVec 64) (_ BitVec 32)) Unit!9691)

(assert (=> b!314188 (= lt!153832 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153834 #b00000000000000000000000000000000))))

(assert (=> b!314188 (arrayContainsKey!0 a!3293 lt!153834 #b00000000000000000000000000000000)))

(declare-fun lt!153833 () Unit!9691)

(assert (=> b!314188 (= lt!153833 lt!153832)))

(declare-fun res!170017 () Bool)

(assert (=> b!314188 (= res!170017 (= (seekEntryOrOpen!0 (select (arr!7590 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2730 #b00000000000000000000000000000000)))))

(assert (=> b!314188 (=> (not res!170017) (not e!195743))))

(declare-fun d!68733 () Bool)

(declare-fun res!170018 () Bool)

(declare-fun e!195745 () Bool)

(assert (=> d!68733 (=> res!170018 e!195745)))

(assert (=> d!68733 (= res!170018 (bvsge #b00000000000000000000000000000000 (size!7942 a!3293)))))

(assert (=> d!68733 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195745)))

(declare-fun b!314189 () Bool)

(assert (=> b!314189 (= e!195744 call!25968)))

(declare-fun b!314190 () Bool)

(assert (=> b!314190 (= e!195743 call!25968)))

(declare-fun b!314191 () Bool)

(assert (=> b!314191 (= e!195745 e!195744)))

(declare-fun c!49697 () Bool)

(assert (=> b!314191 (= c!49697 (validKeyInArray!0 (select (arr!7590 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!68733 (not res!170018)) b!314191))

(assert (= (and b!314191 c!49697) b!314188))

(assert (= (and b!314191 (not c!49697)) b!314189))

(assert (= (and b!314188 res!170017) b!314190))

(assert (= (or b!314190 b!314189) bm!25965))

(declare-fun m!323811 () Bool)

(assert (=> bm!25965 m!323811))

(assert (=> b!314188 m!323777))

(declare-fun m!323813 () Bool)

(assert (=> b!314188 m!323813))

(declare-fun m!323815 () Bool)

(assert (=> b!314188 m!323815))

(assert (=> b!314188 m!323777))

(declare-fun m!323817 () Bool)

(assert (=> b!314188 m!323817))

(assert (=> b!314191 m!323777))

(assert (=> b!314191 m!323777))

(declare-fun m!323819 () Bool)

(assert (=> b!314191 m!323819))

(assert (=> b!314056 d!68733))

(declare-fun b!314235 () Bool)

(declare-fun e!195772 () SeekEntryResult!2730)

(assert (=> b!314235 (= e!195772 Undefined!2730)))

(declare-fun d!68737 () Bool)

(declare-fun lt!153856 () SeekEntryResult!2730)

(assert (=> d!68737 (and (or ((_ is Undefined!2730) lt!153856) (not ((_ is Found!2730) lt!153856)) (and (bvsge (index!13097 lt!153856) #b00000000000000000000000000000000) (bvslt (index!13097 lt!153856) (size!7942 a!3293)))) (or ((_ is Undefined!2730) lt!153856) ((_ is Found!2730) lt!153856) (not ((_ is MissingZero!2730) lt!153856)) (and (bvsge (index!13096 lt!153856) #b00000000000000000000000000000000) (bvslt (index!13096 lt!153856) (size!7942 a!3293)))) (or ((_ is Undefined!2730) lt!153856) ((_ is Found!2730) lt!153856) ((_ is MissingZero!2730) lt!153856) (not ((_ is MissingVacant!2730) lt!153856)) (and (bvsge (index!13099 lt!153856) #b00000000000000000000000000000000) (bvslt (index!13099 lt!153856) (size!7942 a!3293)))) (or ((_ is Undefined!2730) lt!153856) (ite ((_ is Found!2730) lt!153856) (= (select (arr!7590 a!3293) (index!13097 lt!153856)) k0!2441) (ite ((_ is MissingZero!2730) lt!153856) (= (select (arr!7590 a!3293) (index!13096 lt!153856)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2730) lt!153856) (= (select (arr!7590 a!3293) (index!13099 lt!153856)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68737 (= lt!153856 e!195772)))

(declare-fun c!49716 () Bool)

(declare-fun lt!153858 () SeekEntryResult!2730)

(assert (=> d!68737 (= c!49716 (and ((_ is Intermediate!2730) lt!153858) (undefined!3542 lt!153858)))))

(assert (=> d!68737 (= lt!153858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68737 (validMask!0 mask!3709)))

(assert (=> d!68737 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153856)))

(declare-fun b!314236 () Bool)

(declare-fun e!195770 () SeekEntryResult!2730)

(assert (=> b!314236 (= e!195772 e!195770)))

(declare-fun lt!153857 () (_ BitVec 64))

(assert (=> b!314236 (= lt!153857 (select (arr!7590 a!3293) (index!13098 lt!153858)))))

(declare-fun c!49714 () Bool)

(assert (=> b!314236 (= c!49714 (= lt!153857 k0!2441))))

(declare-fun b!314237 () Bool)

(declare-fun c!49715 () Bool)

(assert (=> b!314237 (= c!49715 (= lt!153857 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!195771 () SeekEntryResult!2730)

(assert (=> b!314237 (= e!195770 e!195771)))

(declare-fun b!314238 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16028 (_ BitVec 32)) SeekEntryResult!2730)

(assert (=> b!314238 (= e!195771 (seekKeyOrZeroReturnVacant!0 (x!31322 lt!153858) (index!13098 lt!153858) (index!13098 lt!153858) k0!2441 a!3293 mask!3709))))

(declare-fun b!314239 () Bool)

(assert (=> b!314239 (= e!195771 (MissingZero!2730 (index!13098 lt!153858)))))

(declare-fun b!314240 () Bool)

(assert (=> b!314240 (= e!195770 (Found!2730 (index!13098 lt!153858)))))

(assert (= (and d!68737 c!49716) b!314235))

(assert (= (and d!68737 (not c!49716)) b!314236))

(assert (= (and b!314236 c!49714) b!314240))

(assert (= (and b!314236 (not c!49714)) b!314237))

(assert (= (and b!314237 c!49715) b!314239))

(assert (= (and b!314237 (not c!49715)) b!314238))

(declare-fun m!323839 () Bool)

(assert (=> d!68737 m!323839))

(declare-fun m!323841 () Bool)

(assert (=> d!68737 m!323841))

(assert (=> d!68737 m!323737))

(assert (=> d!68737 m!323743))

(assert (=> d!68737 m!323745))

(assert (=> d!68737 m!323743))

(declare-fun m!323843 () Bool)

(assert (=> d!68737 m!323843))

(declare-fun m!323845 () Bool)

(assert (=> b!314236 m!323845))

(declare-fun m!323847 () Bool)

(assert (=> b!314238 m!323847))

(assert (=> b!314055 d!68737))

(check-sat (not b!314140) (not b!314238) (not d!68737) (not d!68711) (not b!314188) (not bm!25965) (not b!314191) (not d!68729) (not b!314119) (not b!314093))
(check-sat)
