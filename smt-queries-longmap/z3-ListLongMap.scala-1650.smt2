; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30666 () Bool)

(assert start!30666)

(declare-fun b!307767 () Bool)

(declare-fun res!164667 () Bool)

(declare-fun e!192518 () Bool)

(assert (=> b!307767 (=> (not res!164667) (not e!192518))))

(declare-datatypes ((array!15674 0))(
  ( (array!15675 (arr!7422 (Array (_ BitVec 32) (_ BitVec 64))) (size!7775 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15674)

(declare-datatypes ((SeekEntryResult!2561 0))(
  ( (MissingZero!2561 (index!12420 (_ BitVec 32))) (Found!2561 (index!12421 (_ BitVec 32))) (Intermediate!2561 (undefined!3373 Bool) (index!12422 (_ BitVec 32)) (x!30671 (_ BitVec 32))) (Undefined!2561) (MissingVacant!2561 (index!12423 (_ BitVec 32))) )
))
(declare-fun lt!150991 () SeekEntryResult!2561)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15674 (_ BitVec 32)) SeekEntryResult!2561)

(assert (=> b!307767 (= res!164667 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150991))))

(declare-fun b!307768 () Bool)

(declare-fun res!164671 () Bool)

(declare-fun e!192517 () Bool)

(assert (=> b!307768 (=> (not res!164671) (not e!192517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15674 (_ BitVec 32)) Bool)

(assert (=> b!307768 (= res!164671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307769 () Bool)

(declare-fun res!164672 () Bool)

(assert (=> b!307769 (=> (not res!164672) (not e!192517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307769 (= res!164672 (validKeyInArray!0 k0!2441))))

(declare-fun b!307770 () Bool)

(declare-fun res!164670 () Bool)

(assert (=> b!307770 (=> (not res!164670) (not e!192518))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307770 (= res!164670 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7422 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!307771 () Bool)

(declare-fun res!164676 () Bool)

(assert (=> b!307771 (=> (not res!164676) (not e!192518))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307771 (= res!164676 (and (= (select (arr!7422 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7775 a!3293))))))

(declare-fun res!164668 () Bool)

(assert (=> start!30666 (=> (not res!164668) (not e!192517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30666 (= res!164668 (validMask!0 mask!3709))))

(assert (=> start!30666 e!192517))

(declare-fun array_inv!5394 (array!15674) Bool)

(assert (=> start!30666 (array_inv!5394 a!3293)))

(assert (=> start!30666 true))

(declare-fun b!307772 () Bool)

(declare-fun res!164669 () Bool)

(assert (=> b!307772 (=> (not res!164669) (not e!192517))))

(assert (=> b!307772 (= res!164669 (and (= (size!7775 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7775 a!3293))))))

(declare-fun b!307773 () Bool)

(declare-fun res!164675 () Bool)

(assert (=> b!307773 (=> (not res!164675) (not e!192517))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15674 (_ BitVec 32)) SeekEntryResult!2561)

(assert (=> b!307773 (= res!164675 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2561 i!1240)))))

(declare-fun b!307774 () Bool)

(assert (=> b!307774 (= e!192517 e!192518)))

(declare-fun res!164674 () Bool)

(assert (=> b!307774 (=> (not res!164674) (not e!192518))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307774 (= res!164674 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150991))))

(assert (=> b!307774 (= lt!150991 (Intermediate!2561 false resIndex!52 resX!52))))

(declare-fun b!307775 () Bool)

(declare-fun res!164673 () Bool)

(assert (=> b!307775 (=> (not res!164673) (not e!192517))))

(declare-fun arrayContainsKey!0 (array!15674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307775 (= res!164673 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307776 () Bool)

(declare-fun lt!150992 () (_ BitVec 32))

(assert (=> b!307776 (= e!192518 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!150992 #b00000000000000000000000000000000) (bvsge lt!150992 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307776 (= lt!150992 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30666 res!164668) b!307772))

(assert (= (and b!307772 res!164669) b!307769))

(assert (= (and b!307769 res!164672) b!307775))

(assert (= (and b!307775 res!164673) b!307773))

(assert (= (and b!307773 res!164675) b!307768))

(assert (= (and b!307768 res!164671) b!307774))

(assert (= (and b!307774 res!164674) b!307771))

(assert (= (and b!307771 res!164676) b!307767))

(assert (= (and b!307767 res!164667) b!307770))

(assert (= (and b!307770 res!164670) b!307776))

(declare-fun m!317503 () Bool)

(assert (=> b!307768 m!317503))

(declare-fun m!317505 () Bool)

(assert (=> b!307767 m!317505))

(declare-fun m!317507 () Bool)

(assert (=> b!307774 m!317507))

(assert (=> b!307774 m!317507))

(declare-fun m!317509 () Bool)

(assert (=> b!307774 m!317509))

(declare-fun m!317511 () Bool)

(assert (=> b!307776 m!317511))

(declare-fun m!317513 () Bool)

(assert (=> b!307771 m!317513))

(declare-fun m!317515 () Bool)

(assert (=> b!307770 m!317515))

(declare-fun m!317517 () Bool)

(assert (=> start!30666 m!317517))

(declare-fun m!317519 () Bool)

(assert (=> start!30666 m!317519))

(declare-fun m!317521 () Bool)

(assert (=> b!307775 m!317521))

(declare-fun m!317523 () Bool)

(assert (=> b!307773 m!317523))

(declare-fun m!317525 () Bool)

(assert (=> b!307769 m!317525))

(check-sat (not b!307775) (not b!307776) (not b!307774) (not b!307767) (not start!30666) (not b!307769) (not b!307773) (not b!307768))
(check-sat)
(get-model)

(declare-fun d!68047 () Bool)

(assert (=> d!68047 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!307769 d!68047))

(declare-fun b!307855 () Bool)

(declare-fun e!192550 () SeekEntryResult!2561)

(declare-fun e!192547 () SeekEntryResult!2561)

(assert (=> b!307855 (= e!192550 e!192547)))

(declare-fun c!49160 () Bool)

(declare-fun lt!151009 () (_ BitVec 64))

(assert (=> b!307855 (= c!49160 (or (= lt!151009 k0!2441) (= (bvadd lt!151009 lt!151009) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!307856 () Bool)

(assert (=> b!307856 (= e!192550 (Intermediate!2561 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!307857 () Bool)

(declare-fun lt!151010 () SeekEntryResult!2561)

(assert (=> b!307857 (and (bvsge (index!12422 lt!151010) #b00000000000000000000000000000000) (bvslt (index!12422 lt!151010) (size!7775 a!3293)))))

(declare-fun res!164743 () Bool)

(assert (=> b!307857 (= res!164743 (= (select (arr!7422 a!3293) (index!12422 lt!151010)) k0!2441))))

(declare-fun e!192551 () Bool)

(assert (=> b!307857 (=> res!164743 e!192551)))

(declare-fun e!192549 () Bool)

(assert (=> b!307857 (= e!192549 e!192551)))

(declare-fun d!68049 () Bool)

(declare-fun e!192548 () Bool)

(assert (=> d!68049 e!192548))

(declare-fun c!49158 () Bool)

(get-info :version)

(assert (=> d!68049 (= c!49158 (and ((_ is Intermediate!2561) lt!151010) (undefined!3373 lt!151010)))))

(assert (=> d!68049 (= lt!151010 e!192550)))

(declare-fun c!49159 () Bool)

(assert (=> d!68049 (= c!49159 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68049 (= lt!151009 (select (arr!7422 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68049 (validMask!0 mask!3709)))

(assert (=> d!68049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151010)))

(declare-fun b!307858 () Bool)

(assert (=> b!307858 (= e!192547 (Intermediate!2561 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!307859 () Bool)

(assert (=> b!307859 (= e!192548 e!192549)))

(declare-fun res!164744 () Bool)

(assert (=> b!307859 (= res!164744 (and ((_ is Intermediate!2561) lt!151010) (not (undefined!3373 lt!151010)) (bvslt (x!30671 lt!151010) #b01111111111111111111111111111110) (bvsge (x!30671 lt!151010) #b00000000000000000000000000000000) (bvsge (x!30671 lt!151010) #b00000000000000000000000000000000)))))

(assert (=> b!307859 (=> (not res!164744) (not e!192549))))

(declare-fun b!307860 () Bool)

(assert (=> b!307860 (= e!192547 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!307861 () Bool)

(assert (=> b!307861 (and (bvsge (index!12422 lt!151010) #b00000000000000000000000000000000) (bvslt (index!12422 lt!151010) (size!7775 a!3293)))))

(assert (=> b!307861 (= e!192551 (= (select (arr!7422 a!3293) (index!12422 lt!151010)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!307862 () Bool)

(assert (=> b!307862 (= e!192548 (bvsge (x!30671 lt!151010) #b01111111111111111111111111111110))))

(declare-fun b!307863 () Bool)

(assert (=> b!307863 (and (bvsge (index!12422 lt!151010) #b00000000000000000000000000000000) (bvslt (index!12422 lt!151010) (size!7775 a!3293)))))

(declare-fun res!164745 () Bool)

(assert (=> b!307863 (= res!164745 (= (select (arr!7422 a!3293) (index!12422 lt!151010)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!307863 (=> res!164745 e!192551)))

(assert (= (and d!68049 c!49159) b!307856))

(assert (= (and d!68049 (not c!49159)) b!307855))

(assert (= (and b!307855 c!49160) b!307858))

(assert (= (and b!307855 (not c!49160)) b!307860))

(assert (= (and d!68049 c!49158) b!307862))

(assert (= (and d!68049 (not c!49158)) b!307859))

(assert (= (and b!307859 res!164744) b!307857))

(assert (= (and b!307857 (not res!164743)) b!307863))

(assert (= (and b!307863 (not res!164745)) b!307861))

(declare-fun m!317575 () Bool)

(assert (=> b!307863 m!317575))

(assert (=> d!68049 m!317507))

(declare-fun m!317577 () Bool)

(assert (=> d!68049 m!317577))

(assert (=> d!68049 m!317517))

(assert (=> b!307860 m!317507))

(declare-fun m!317579 () Bool)

(assert (=> b!307860 m!317579))

(assert (=> b!307860 m!317579))

(declare-fun m!317581 () Bool)

(assert (=> b!307860 m!317581))

(assert (=> b!307861 m!317575))

(assert (=> b!307857 m!317575))

(assert (=> b!307774 d!68049))

(declare-fun d!68051 () Bool)

(declare-fun lt!151016 () (_ BitVec 32))

(declare-fun lt!151015 () (_ BitVec 32))

(assert (=> d!68051 (= lt!151016 (bvmul (bvxor lt!151015 (bvlshr lt!151015 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68051 (= lt!151015 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68051 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!164746 (let ((h!5308 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30675 (bvmul (bvxor h!5308 (bvlshr h!5308 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30675 (bvlshr x!30675 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!164746 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!164746 #b00000000000000000000000000000000))))))

(assert (=> d!68051 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!151016 (bvlshr lt!151016 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!307774 d!68051))

(declare-fun d!68053 () Bool)

(assert (=> d!68053 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30666 d!68053))

(declare-fun d!68057 () Bool)

(assert (=> d!68057 (= (array_inv!5394 a!3293) (bvsge (size!7775 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30666 d!68057))

(declare-fun d!68059 () Bool)

(declare-fun lt!151028 () (_ BitVec 32))

(assert (=> d!68059 (and (bvsge lt!151028 #b00000000000000000000000000000000) (bvslt lt!151028 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68059 (= lt!151028 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68059 (validMask!0 mask!3709)))

(assert (=> d!68059 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!151028)))

(declare-fun bs!10799 () Bool)

(assert (= bs!10799 d!68059))

(declare-fun m!317595 () Bool)

(assert (=> bs!10799 m!317595))

(assert (=> bs!10799 m!317517))

(assert (=> b!307776 d!68059))

(declare-fun d!68065 () Bool)

(declare-fun res!164757 () Bool)

(declare-fun e!192565 () Bool)

(assert (=> d!68065 (=> res!164757 e!192565)))

(assert (=> d!68065 (= res!164757 (= (select (arr!7422 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68065 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!192565)))

(declare-fun b!307880 () Bool)

(declare-fun e!192566 () Bool)

(assert (=> b!307880 (= e!192565 e!192566)))

(declare-fun res!164758 () Bool)

(assert (=> b!307880 (=> (not res!164758) (not e!192566))))

(assert (=> b!307880 (= res!164758 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7775 a!3293)))))

(declare-fun b!307881 () Bool)

(assert (=> b!307881 (= e!192566 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68065 (not res!164757)) b!307880))

(assert (= (and b!307880 res!164758) b!307881))

(declare-fun m!317597 () Bool)

(assert (=> d!68065 m!317597))

(declare-fun m!317599 () Bool)

(assert (=> b!307881 m!317599))

(assert (=> b!307775 d!68065))

(declare-fun b!307916 () Bool)

(declare-fun e!192585 () SeekEntryResult!2561)

(assert (=> b!307916 (= e!192585 Undefined!2561)))

(declare-fun b!307917 () Bool)

(declare-fun e!192583 () SeekEntryResult!2561)

(declare-fun lt!151045 () SeekEntryResult!2561)

(assert (=> b!307917 (= e!192583 (Found!2561 (index!12422 lt!151045)))))

(declare-fun b!307918 () Bool)

(declare-fun c!49181 () Bool)

(declare-fun lt!151047 () (_ BitVec 64))

(assert (=> b!307918 (= c!49181 (= lt!151047 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!192584 () SeekEntryResult!2561)

(assert (=> b!307918 (= e!192583 e!192584)))

(declare-fun d!68067 () Bool)

(declare-fun lt!151046 () SeekEntryResult!2561)

(assert (=> d!68067 (and (or ((_ is Undefined!2561) lt!151046) (not ((_ is Found!2561) lt!151046)) (and (bvsge (index!12421 lt!151046) #b00000000000000000000000000000000) (bvslt (index!12421 lt!151046) (size!7775 a!3293)))) (or ((_ is Undefined!2561) lt!151046) ((_ is Found!2561) lt!151046) (not ((_ is MissingZero!2561) lt!151046)) (and (bvsge (index!12420 lt!151046) #b00000000000000000000000000000000) (bvslt (index!12420 lt!151046) (size!7775 a!3293)))) (or ((_ is Undefined!2561) lt!151046) ((_ is Found!2561) lt!151046) ((_ is MissingZero!2561) lt!151046) (not ((_ is MissingVacant!2561) lt!151046)) (and (bvsge (index!12423 lt!151046) #b00000000000000000000000000000000) (bvslt (index!12423 lt!151046) (size!7775 a!3293)))) (or ((_ is Undefined!2561) lt!151046) (ite ((_ is Found!2561) lt!151046) (= (select (arr!7422 a!3293) (index!12421 lt!151046)) k0!2441) (ite ((_ is MissingZero!2561) lt!151046) (= (select (arr!7422 a!3293) (index!12420 lt!151046)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2561) lt!151046) (= (select (arr!7422 a!3293) (index!12423 lt!151046)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68067 (= lt!151046 e!192585)))

(declare-fun c!49180 () Bool)

(assert (=> d!68067 (= c!49180 (and ((_ is Intermediate!2561) lt!151045) (undefined!3373 lt!151045)))))

(assert (=> d!68067 (= lt!151045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68067 (validMask!0 mask!3709)))

(assert (=> d!68067 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!151046)))

(declare-fun b!307919 () Bool)

(assert (=> b!307919 (= e!192585 e!192583)))

(assert (=> b!307919 (= lt!151047 (select (arr!7422 a!3293) (index!12422 lt!151045)))))

(declare-fun c!49182 () Bool)

(assert (=> b!307919 (= c!49182 (= lt!151047 k0!2441))))

(declare-fun b!307920 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15674 (_ BitVec 32)) SeekEntryResult!2561)

(assert (=> b!307920 (= e!192584 (seekKeyOrZeroReturnVacant!0 (x!30671 lt!151045) (index!12422 lt!151045) (index!12422 lt!151045) k0!2441 a!3293 mask!3709))))

(declare-fun b!307921 () Bool)

(assert (=> b!307921 (= e!192584 (MissingZero!2561 (index!12422 lt!151045)))))

(assert (= (and d!68067 c!49180) b!307916))

(assert (= (and d!68067 (not c!49180)) b!307919))

(assert (= (and b!307919 c!49182) b!307917))

(assert (= (and b!307919 (not c!49182)) b!307918))

(assert (= (and b!307918 c!49181) b!307921))

(assert (= (and b!307918 (not c!49181)) b!307920))

(declare-fun m!317601 () Bool)

(assert (=> d!68067 m!317601))

(assert (=> d!68067 m!317517))

(declare-fun m!317603 () Bool)

(assert (=> d!68067 m!317603))

(assert (=> d!68067 m!317507))

(assert (=> d!68067 m!317507))

(assert (=> d!68067 m!317509))

(declare-fun m!317605 () Bool)

(assert (=> d!68067 m!317605))

(declare-fun m!317607 () Bool)

(assert (=> b!307919 m!317607))

(declare-fun m!317609 () Bool)

(assert (=> b!307920 m!317609))

(assert (=> b!307773 d!68067))

(declare-fun b!307953 () Bool)

(declare-fun e!192608 () Bool)

(declare-fun e!192607 () Bool)

(assert (=> b!307953 (= e!192608 e!192607)))

(declare-fun lt!151059 () (_ BitVec 64))

(assert (=> b!307953 (= lt!151059 (select (arr!7422 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9541 0))(
  ( (Unit!9542) )
))
(declare-fun lt!151060 () Unit!9541)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15674 (_ BitVec 64) (_ BitVec 32)) Unit!9541)

(assert (=> b!307953 (= lt!151060 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!151059 #b00000000000000000000000000000000))))

(assert (=> b!307953 (arrayContainsKey!0 a!3293 lt!151059 #b00000000000000000000000000000000)))

(declare-fun lt!151061 () Unit!9541)

(assert (=> b!307953 (= lt!151061 lt!151060)))

(declare-fun res!164773 () Bool)

(assert (=> b!307953 (= res!164773 (= (seekEntryOrOpen!0 (select (arr!7422 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2561 #b00000000000000000000000000000000)))))

(assert (=> b!307953 (=> (not res!164773) (not e!192607))))

(declare-fun b!307954 () Bool)

(declare-fun e!192606 () Bool)

(assert (=> b!307954 (= e!192606 e!192608)))

(declare-fun c!49193 () Bool)

(assert (=> b!307954 (= c!49193 (validKeyInArray!0 (select (arr!7422 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!307955 () Bool)

(declare-fun call!25889 () Bool)

(assert (=> b!307955 (= e!192607 call!25889)))

(declare-fun d!68069 () Bool)

(declare-fun res!164774 () Bool)

(assert (=> d!68069 (=> res!164774 e!192606)))

(assert (=> d!68069 (= res!164774 (bvsge #b00000000000000000000000000000000 (size!7775 a!3293)))))

(assert (=> d!68069 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!192606)))

(declare-fun b!307956 () Bool)

(assert (=> b!307956 (= e!192608 call!25889)))

(declare-fun bm!25886 () Bool)

(assert (=> bm!25886 (= call!25889 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!68069 (not res!164774)) b!307954))

(assert (= (and b!307954 c!49193) b!307953))

(assert (= (and b!307954 (not c!49193)) b!307956))

(assert (= (and b!307953 res!164773) b!307955))

(assert (= (or b!307955 b!307956) bm!25886))

(assert (=> b!307953 m!317597))

(declare-fun m!317629 () Bool)

(assert (=> b!307953 m!317629))

(declare-fun m!317631 () Bool)

(assert (=> b!307953 m!317631))

(assert (=> b!307953 m!317597))

(declare-fun m!317633 () Bool)

(assert (=> b!307953 m!317633))

(assert (=> b!307954 m!317597))

(assert (=> b!307954 m!317597))

(declare-fun m!317635 () Bool)

(assert (=> b!307954 m!317635))

(declare-fun m!317637 () Bool)

(assert (=> bm!25886 m!317637))

(assert (=> b!307768 d!68069))

(declare-fun b!307957 () Bool)

(declare-fun e!192612 () SeekEntryResult!2561)

(declare-fun e!192609 () SeekEntryResult!2561)

(assert (=> b!307957 (= e!192612 e!192609)))

(declare-fun c!49196 () Bool)

(declare-fun lt!151062 () (_ BitVec 64))

(assert (=> b!307957 (= c!49196 (or (= lt!151062 k0!2441) (= (bvadd lt!151062 lt!151062) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!307958 () Bool)

(assert (=> b!307958 (= e!192612 (Intermediate!2561 true index!1781 x!1427))))

(declare-fun b!307959 () Bool)

(declare-fun lt!151063 () SeekEntryResult!2561)

(assert (=> b!307959 (and (bvsge (index!12422 lt!151063) #b00000000000000000000000000000000) (bvslt (index!12422 lt!151063) (size!7775 a!3293)))))

(declare-fun res!164775 () Bool)

(assert (=> b!307959 (= res!164775 (= (select (arr!7422 a!3293) (index!12422 lt!151063)) k0!2441))))

(declare-fun e!192613 () Bool)

(assert (=> b!307959 (=> res!164775 e!192613)))

(declare-fun e!192611 () Bool)

(assert (=> b!307959 (= e!192611 e!192613)))

(declare-fun d!68077 () Bool)

(declare-fun e!192610 () Bool)

(assert (=> d!68077 e!192610))

(declare-fun c!49194 () Bool)

(assert (=> d!68077 (= c!49194 (and ((_ is Intermediate!2561) lt!151063) (undefined!3373 lt!151063)))))

(assert (=> d!68077 (= lt!151063 e!192612)))

(declare-fun c!49195 () Bool)

(assert (=> d!68077 (= c!49195 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68077 (= lt!151062 (select (arr!7422 a!3293) index!1781))))

(assert (=> d!68077 (validMask!0 mask!3709)))

(assert (=> d!68077 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151063)))

(declare-fun b!307960 () Bool)

(assert (=> b!307960 (= e!192609 (Intermediate!2561 false index!1781 x!1427))))

(declare-fun b!307961 () Bool)

(assert (=> b!307961 (= e!192610 e!192611)))

(declare-fun res!164776 () Bool)

(assert (=> b!307961 (= res!164776 (and ((_ is Intermediate!2561) lt!151063) (not (undefined!3373 lt!151063)) (bvslt (x!30671 lt!151063) #b01111111111111111111111111111110) (bvsge (x!30671 lt!151063) #b00000000000000000000000000000000) (bvsge (x!30671 lt!151063) x!1427)))))

(assert (=> b!307961 (=> (not res!164776) (not e!192611))))

(declare-fun b!307962 () Bool)

(assert (=> b!307962 (= e!192609 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!307963 () Bool)

(assert (=> b!307963 (and (bvsge (index!12422 lt!151063) #b00000000000000000000000000000000) (bvslt (index!12422 lt!151063) (size!7775 a!3293)))))

(assert (=> b!307963 (= e!192613 (= (select (arr!7422 a!3293) (index!12422 lt!151063)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!307964 () Bool)

(assert (=> b!307964 (= e!192610 (bvsge (x!30671 lt!151063) #b01111111111111111111111111111110))))

(declare-fun b!307965 () Bool)

(assert (=> b!307965 (and (bvsge (index!12422 lt!151063) #b00000000000000000000000000000000) (bvslt (index!12422 lt!151063) (size!7775 a!3293)))))

(declare-fun res!164777 () Bool)

(assert (=> b!307965 (= res!164777 (= (select (arr!7422 a!3293) (index!12422 lt!151063)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!307965 (=> res!164777 e!192613)))

(assert (= (and d!68077 c!49195) b!307958))

(assert (= (and d!68077 (not c!49195)) b!307957))

(assert (= (and b!307957 c!49196) b!307960))

(assert (= (and b!307957 (not c!49196)) b!307962))

(assert (= (and d!68077 c!49194) b!307964))

(assert (= (and d!68077 (not c!49194)) b!307961))

(assert (= (and b!307961 res!164776) b!307959))

(assert (= (and b!307959 (not res!164775)) b!307965))

(assert (= (and b!307965 (not res!164777)) b!307963))

(declare-fun m!317639 () Bool)

(assert (=> b!307965 m!317639))

(assert (=> d!68077 m!317515))

(assert (=> d!68077 m!317517))

(assert (=> b!307962 m!317511))

(assert (=> b!307962 m!317511))

(declare-fun m!317641 () Bool)

(assert (=> b!307962 m!317641))

(assert (=> b!307963 m!317639))

(assert (=> b!307959 m!317639))

(assert (=> b!307767 d!68077))

(check-sat (not b!307920) (not b!307954) (not b!307953) (not d!68059) (not bm!25886) (not d!68067) (not b!307962) (not d!68049) (not b!307881) (not d!68077) (not b!307860))
(check-sat)
