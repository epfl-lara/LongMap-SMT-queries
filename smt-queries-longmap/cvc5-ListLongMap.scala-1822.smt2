; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32836 () Bool)

(assert start!32836)

(declare-fun b!327815 () Bool)

(declare-fun res!180569 () Bool)

(declare-fun e!201579 () Bool)

(assert (=> b!327815 (=> (not res!180569) (not e!201579))))

(declare-datatypes ((array!16783 0))(
  ( (array!16784 (arr!7943 (Array (_ BitVec 32) (_ BitVec 64))) (size!8295 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16783)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!327815 (= res!180569 (and (= (select (arr!7943 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8295 a!3305))))))

(declare-fun b!327816 () Bool)

(declare-datatypes ((SeekEntryResult!3074 0))(
  ( (MissingZero!3074 (index!14472 (_ BitVec 32))) (Found!3074 (index!14473 (_ BitVec 32))) (Intermediate!3074 (undefined!3886 Bool) (index!14474 (_ BitVec 32)) (x!32724 (_ BitVec 32))) (Undefined!3074) (MissingVacant!3074 (index!14475 (_ BitVec 32))) )
))
(declare-fun lt!157691 () SeekEntryResult!3074)

(assert (=> b!327816 (= e!201579 (and (is-Intermediate!3074 lt!157691) (bvslt (x!32724 lt!157691) (bvadd #b00000000000000000000000000000001 x!1490))))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16783 (_ BitVec 32)) SeekEntryResult!3074)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327816 (= lt!157691 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!327817 () Bool)

(declare-fun res!180567 () Bool)

(declare-fun e!201578 () Bool)

(assert (=> b!327817 (=> (not res!180567) (not e!201578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327817 (= res!180567 (validKeyInArray!0 k!2497))))

(declare-fun res!180570 () Bool)

(assert (=> start!32836 (=> (not res!180570) (not e!201578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32836 (= res!180570 (validMask!0 mask!3777))))

(assert (=> start!32836 e!201578))

(declare-fun array_inv!5906 (array!16783) Bool)

(assert (=> start!32836 (array_inv!5906 a!3305)))

(assert (=> start!32836 true))

(declare-fun b!327818 () Bool)

(declare-fun res!180572 () Bool)

(assert (=> b!327818 (=> (not res!180572) (not e!201578))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16783 (_ BitVec 32)) SeekEntryResult!3074)

(assert (=> b!327818 (= res!180572 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3074 i!1250)))))

(declare-fun b!327819 () Bool)

(declare-fun res!180564 () Bool)

(assert (=> b!327819 (=> (not res!180564) (not e!201578))))

(assert (=> b!327819 (= res!180564 (and (= (size!8295 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8295 a!3305))))))

(declare-fun b!327820 () Bool)

(declare-fun res!180573 () Bool)

(assert (=> b!327820 (=> (not res!180573) (not e!201578))))

(declare-fun arrayContainsKey!0 (array!16783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327820 (= res!180573 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327821 () Bool)

(declare-fun res!180565 () Bool)

(assert (=> b!327821 (=> (not res!180565) (not e!201579))))

(declare-fun lt!157692 () SeekEntryResult!3074)

(assert (=> b!327821 (= res!180565 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157692))))

(declare-fun b!327822 () Bool)

(declare-fun res!180566 () Bool)

(assert (=> b!327822 (=> (not res!180566) (not e!201578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16783 (_ BitVec 32)) Bool)

(assert (=> b!327822 (= res!180566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327823 () Bool)

(assert (=> b!327823 (= e!201578 e!201579)))

(declare-fun res!180571 () Bool)

(assert (=> b!327823 (=> (not res!180571) (not e!201579))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327823 (= res!180571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157692))))

(assert (=> b!327823 (= lt!157692 (Intermediate!3074 false resIndex!58 resX!58))))

(declare-fun b!327824 () Bool)

(declare-fun res!180568 () Bool)

(assert (=> b!327824 (=> (not res!180568) (not e!201579))))

(assert (=> b!327824 (= res!180568 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7943 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7943 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7943 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!32836 res!180570) b!327819))

(assert (= (and b!327819 res!180564) b!327817))

(assert (= (and b!327817 res!180567) b!327820))

(assert (= (and b!327820 res!180573) b!327818))

(assert (= (and b!327818 res!180572) b!327822))

(assert (= (and b!327822 res!180566) b!327823))

(assert (= (and b!327823 res!180571) b!327815))

(assert (= (and b!327815 res!180569) b!327821))

(assert (= (and b!327821 res!180565) b!327824))

(assert (= (and b!327824 res!180568) b!327816))

(declare-fun m!334025 () Bool)

(assert (=> b!327815 m!334025))

(declare-fun m!334027 () Bool)

(assert (=> b!327817 m!334027))

(declare-fun m!334029 () Bool)

(assert (=> b!327823 m!334029))

(assert (=> b!327823 m!334029))

(declare-fun m!334031 () Bool)

(assert (=> b!327823 m!334031))

(declare-fun m!334033 () Bool)

(assert (=> b!327824 m!334033))

(declare-fun m!334035 () Bool)

(assert (=> b!327816 m!334035))

(assert (=> b!327816 m!334035))

(declare-fun m!334037 () Bool)

(assert (=> b!327816 m!334037))

(declare-fun m!334039 () Bool)

(assert (=> b!327821 m!334039))

(declare-fun m!334041 () Bool)

(assert (=> start!32836 m!334041))

(declare-fun m!334043 () Bool)

(assert (=> start!32836 m!334043))

(declare-fun m!334045 () Bool)

(assert (=> b!327820 m!334045))

(declare-fun m!334047 () Bool)

(assert (=> b!327822 m!334047))

(declare-fun m!334049 () Bool)

(assert (=> b!327818 m!334049))

(push 1)

(assert (not b!327822))

(assert (not b!327817))

(assert (not b!327823))

(assert (not start!32836))

(assert (not b!327820))

(assert (not b!327821))

(assert (not b!327816))

(assert (not b!327818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!327915 () Bool)

(declare-fun e!201618 () Bool)

(declare-fun e!201617 () Bool)

(assert (=> b!327915 (= e!201618 e!201617)))

(declare-fun res!180642 () Bool)

(declare-fun lt!157715 () SeekEntryResult!3074)

(assert (=> b!327915 (= res!180642 (and (is-Intermediate!3074 lt!157715) (not (undefined!3886 lt!157715)) (bvslt (x!32724 lt!157715) #b01111111111111111111111111111110) (bvsge (x!32724 lt!157715) #b00000000000000000000000000000000) (bvsge (x!32724 lt!157715) #b00000000000000000000000000000000)))))

(assert (=> b!327915 (=> (not res!180642) (not e!201617))))

(declare-fun b!327916 () Bool)

(declare-fun e!201619 () SeekEntryResult!3074)

(declare-fun e!201615 () SeekEntryResult!3074)

(assert (=> b!327916 (= e!201619 e!201615)))

(declare-fun c!51273 () Bool)

(declare-fun lt!157716 () (_ BitVec 64))

(assert (=> b!327916 (= c!51273 (or (= lt!157716 k!2497) (= (bvadd lt!157716 lt!157716) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327917 () Bool)

(assert (=> b!327917 (= e!201618 (bvsge (x!32724 lt!157715) #b01111111111111111111111111111110))))

(declare-fun d!69915 () Bool)

(assert (=> d!69915 e!201618))

(declare-fun c!51272 () Bool)

(assert (=> d!69915 (= c!51272 (and (is-Intermediate!3074 lt!157715) (undefined!3886 lt!157715)))))

(assert (=> d!69915 (= lt!157715 e!201619)))

(declare-fun c!51271 () Bool)

(assert (=> d!69915 (= c!51271 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69915 (= lt!157716 (select (arr!7943 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69915 (validMask!0 mask!3777)))

(assert (=> d!69915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157715)))

(declare-fun b!327918 () Bool)

(assert (=> b!327918 (= e!201615 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!327919 () Bool)

(assert (=> b!327919 (and (bvsge (index!14474 lt!157715) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157715) (size!8295 a!3305)))))

(declare-fun e!201616 () Bool)

(assert (=> b!327919 (= e!201616 (= (select (arr!7943 a!3305) (index!14474 lt!157715)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327920 () Bool)

(assert (=> b!327920 (= e!201619 (Intermediate!3074 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327921 () Bool)

(assert (=> b!327921 (= e!201615 (Intermediate!3074 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327922 () Bool)

(assert (=> b!327922 (and (bvsge (index!14474 lt!157715) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157715) (size!8295 a!3305)))))

(declare-fun res!180641 () Bool)

(assert (=> b!327922 (= res!180641 (= (select (arr!7943 a!3305) (index!14474 lt!157715)) k!2497))))

(assert (=> b!327922 (=> res!180641 e!201616)))

(assert (=> b!327922 (= e!201617 e!201616)))

(declare-fun b!327923 () Bool)

(assert (=> b!327923 (and (bvsge (index!14474 lt!157715) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157715) (size!8295 a!3305)))))

(declare-fun res!180640 () Bool)

(assert (=> b!327923 (= res!180640 (= (select (arr!7943 a!3305) (index!14474 lt!157715)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327923 (=> res!180640 e!201616)))

(assert (= (and d!69915 c!51271) b!327920))

(assert (= (and d!69915 (not c!51271)) b!327916))

(assert (= (and b!327916 c!51273) b!327921))

(assert (= (and b!327916 (not c!51273)) b!327918))

(assert (= (and d!69915 c!51272) b!327917))

(assert (= (and d!69915 (not c!51272)) b!327915))

(assert (= (and b!327915 res!180642) b!327922))

(assert (= (and b!327922 (not res!180641)) b!327923))

(assert (= (and b!327923 (not res!180640)) b!327919))

(declare-fun m!334103 () Bool)

(assert (=> b!327922 m!334103))

(assert (=> b!327923 m!334103))

(assert (=> d!69915 m!334029))

(declare-fun m!334105 () Bool)

(assert (=> d!69915 m!334105))

(assert (=> d!69915 m!334041))

(assert (=> b!327918 m!334029))

(declare-fun m!334107 () Bool)

(assert (=> b!327918 m!334107))

(assert (=> b!327918 m!334107))

(declare-fun m!334109 () Bool)

(assert (=> b!327918 m!334109))

(assert (=> b!327919 m!334103))

(assert (=> b!327823 d!69915))

(declare-fun d!69917 () Bool)

(declare-fun lt!157725 () (_ BitVec 32))

(declare-fun lt!157724 () (_ BitVec 32))

(assert (=> d!69917 (= lt!157725 (bvmul (bvxor lt!157724 (bvlshr lt!157724 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69917 (= lt!157724 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69917 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180643 (let ((h!5403 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32728 (bvmul (bvxor h!5403 (bvlshr h!5403 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32728 (bvlshr x!32728 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180643 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180643 #b00000000000000000000000000000000))))))

(assert (=> d!69917 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157725 (bvlshr lt!157725 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327823 d!69917))

(declare-fun d!69925 () Bool)

(assert (=> d!69925 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327817 d!69925))

(declare-fun d!69927 () Bool)

(declare-fun res!180654 () Bool)

(declare-fun e!201637 () Bool)

(assert (=> d!69927 (=> res!180654 e!201637)))

(assert (=> d!69927 (= res!180654 (bvsge #b00000000000000000000000000000000 (size!8295 a!3305)))))

(assert (=> d!69927 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201637)))

(declare-fun b!327944 () Bool)

(declare-fun e!201636 () Bool)

(assert (=> b!327944 (= e!201637 e!201636)))

(declare-fun c!51279 () Bool)

(assert (=> b!327944 (= c!51279 (validKeyInArray!0 (select (arr!7943 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!327945 () Bool)

(declare-fun call!26110 () Bool)

(assert (=> b!327945 (= e!201636 call!26110)))

(declare-fun b!327946 () Bool)

(declare-fun e!201635 () Bool)

(assert (=> b!327946 (= e!201635 call!26110)))

(declare-fun bm!26107 () Bool)

(assert (=> bm!26107 (= call!26110 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!327947 () Bool)

(assert (=> b!327947 (= e!201636 e!201635)))

(declare-fun lt!157732 () (_ BitVec 64))

(assert (=> b!327947 (= lt!157732 (select (arr!7943 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10182 0))(
  ( (Unit!10183) )
))
(declare-fun lt!157733 () Unit!10182)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16783 (_ BitVec 64) (_ BitVec 32)) Unit!10182)

(assert (=> b!327947 (= lt!157733 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157732 #b00000000000000000000000000000000))))

(assert (=> b!327947 (arrayContainsKey!0 a!3305 lt!157732 #b00000000000000000000000000000000)))

(declare-fun lt!157734 () Unit!10182)

(assert (=> b!327947 (= lt!157734 lt!157733)))

(declare-fun res!180655 () Bool)

(assert (=> b!327947 (= res!180655 (= (seekEntryOrOpen!0 (select (arr!7943 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3074 #b00000000000000000000000000000000)))))

(assert (=> b!327947 (=> (not res!180655) (not e!201635))))

(assert (= (and d!69927 (not res!180654)) b!327944))

(assert (= (and b!327944 c!51279) b!327947))

(assert (= (and b!327944 (not c!51279)) b!327945))

(assert (= (and b!327947 res!180655) b!327946))

(assert (= (or b!327946 b!327945) bm!26107))

(declare-fun m!334125 () Bool)

(assert (=> b!327944 m!334125))

(assert (=> b!327944 m!334125))

(declare-fun m!334127 () Bool)

(assert (=> b!327944 m!334127))

(declare-fun m!334129 () Bool)

(assert (=> bm!26107 m!334129))

(assert (=> b!327947 m!334125))

(declare-fun m!334131 () Bool)

(assert (=> b!327947 m!334131))

(declare-fun m!334133 () Bool)

(assert (=> b!327947 m!334133))

(assert (=> b!327947 m!334125))

(declare-fun m!334135 () Bool)

(assert (=> b!327947 m!334135))

(assert (=> b!327822 d!69927))

(declare-fun d!69931 () Bool)

(assert (=> d!69931 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32836 d!69931))

(declare-fun d!69935 () Bool)

(assert (=> d!69935 (= (array_inv!5906 a!3305) (bvsge (size!8295 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32836 d!69935))

(declare-fun d!69937 () Bool)

(declare-fun lt!157779 () SeekEntryResult!3074)

(assert (=> d!69937 (and (or (is-Undefined!3074 lt!157779) (not (is-Found!3074 lt!157779)) (and (bvsge (index!14473 lt!157779) #b00000000000000000000000000000000) (bvslt (index!14473 lt!157779) (size!8295 a!3305)))) (or (is-Undefined!3074 lt!157779) (is-Found!3074 lt!157779) (not (is-MissingZero!3074 lt!157779)) (and (bvsge (index!14472 lt!157779) #b00000000000000000000000000000000) (bvslt (index!14472 lt!157779) (size!8295 a!3305)))) (or (is-Undefined!3074 lt!157779) (is-Found!3074 lt!157779) (is-MissingZero!3074 lt!157779) (not (is-MissingVacant!3074 lt!157779)) (and (bvsge (index!14475 lt!157779) #b00000000000000000000000000000000) (bvslt (index!14475 lt!157779) (size!8295 a!3305)))) (or (is-Undefined!3074 lt!157779) (ite (is-Found!3074 lt!157779) (= (select (arr!7943 a!3305) (index!14473 lt!157779)) k!2497) (ite (is-MissingZero!3074 lt!157779) (= (select (arr!7943 a!3305) (index!14472 lt!157779)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3074 lt!157779) (= (select (arr!7943 a!3305) (index!14475 lt!157779)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!201704 () SeekEntryResult!3074)

(assert (=> d!69937 (= lt!157779 e!201704)))

(declare-fun c!51324 () Bool)

(declare-fun lt!157778 () SeekEntryResult!3074)

(assert (=> d!69937 (= c!51324 (and (is-Intermediate!3074 lt!157778) (undefined!3886 lt!157778)))))

(assert (=> d!69937 (= lt!157778 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69937 (validMask!0 mask!3777)))

(assert (=> d!69937 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!157779)))

(declare-fun b!328062 () Bool)

(declare-fun e!201702 () SeekEntryResult!3074)

(assert (=> b!328062 (= e!201702 (MissingZero!3074 (index!14474 lt!157778)))))

(declare-fun b!328063 () Bool)

(declare-fun c!51322 () Bool)

(declare-fun lt!157780 () (_ BitVec 64))

(assert (=> b!328063 (= c!51322 (= lt!157780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201703 () SeekEntryResult!3074)

(assert (=> b!328063 (= e!201703 e!201702)))

(declare-fun b!328064 () Bool)

(assert (=> b!328064 (= e!201703 (Found!3074 (index!14474 lt!157778)))))

(declare-fun b!328065 () Bool)

(assert (=> b!328065 (= e!201704 e!201703)))

(assert (=> b!328065 (= lt!157780 (select (arr!7943 a!3305) (index!14474 lt!157778)))))

(declare-fun c!51323 () Bool)

(assert (=> b!328065 (= c!51323 (= lt!157780 k!2497))))

(declare-fun b!328066 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16783 (_ BitVec 32)) SeekEntryResult!3074)

(assert (=> b!328066 (= e!201702 (seekKeyOrZeroReturnVacant!0 (x!32724 lt!157778) (index!14474 lt!157778) (index!14474 lt!157778) k!2497 a!3305 mask!3777))))

(declare-fun b!328067 () Bool)

(assert (=> b!328067 (= e!201704 Undefined!3074)))

(assert (= (and d!69937 c!51324) b!328067))

(assert (= (and d!69937 (not c!51324)) b!328065))

(assert (= (and b!328065 c!51323) b!328064))

(assert (= (and b!328065 (not c!51323)) b!328063))

(assert (= (and b!328063 c!51322) b!328062))

(assert (= (and b!328063 (not c!51322)) b!328066))

(assert (=> d!69937 m!334029))

(assert (=> d!69937 m!334031))

(assert (=> d!69937 m!334029))

(declare-fun m!334187 () Bool)

(assert (=> d!69937 m!334187))

(declare-fun m!334189 () Bool)

(assert (=> d!69937 m!334189))

(declare-fun m!334191 () Bool)

(assert (=> d!69937 m!334191))

(assert (=> d!69937 m!334041))

(declare-fun m!334193 () Bool)

(assert (=> b!328065 m!334193))

(declare-fun m!334195 () Bool)

(assert (=> b!328066 m!334195))

(assert (=> b!327818 d!69937))

(declare-fun d!69951 () Bool)

(declare-fun res!180692 () Bool)

(declare-fun e!201709 () Bool)

(assert (=> d!69951 (=> res!180692 e!201709)))

(assert (=> d!69951 (= res!180692 (= (select (arr!7943 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69951 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!201709)))

(declare-fun b!328072 () Bool)

(declare-fun e!201710 () Bool)

(assert (=> b!328072 (= e!201709 e!201710)))

(declare-fun res!180693 () Bool)

(assert (=> b!328072 (=> (not res!180693) (not e!201710))))

(assert (=> b!328072 (= res!180693 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8295 a!3305)))))

(declare-fun b!328073 () Bool)

(assert (=> b!328073 (= e!201710 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69951 (not res!180692)) b!328072))

(assert (= (and b!328072 res!180693) b!328073))

(assert (=> d!69951 m!334125))

(declare-fun m!334197 () Bool)

(assert (=> b!328073 m!334197))

(assert (=> b!327820 d!69951))

(declare-fun b!328074 () Bool)

(declare-fun e!201714 () Bool)

(declare-fun e!201713 () Bool)

(assert (=> b!328074 (= e!201714 e!201713)))

(declare-fun res!180696 () Bool)

(declare-fun lt!157791 () SeekEntryResult!3074)

(assert (=> b!328074 (= res!180696 (and (is-Intermediate!3074 lt!157791) (not (undefined!3886 lt!157791)) (bvslt (x!32724 lt!157791) #b01111111111111111111111111111110) (bvsge (x!32724 lt!157791) #b00000000000000000000000000000000) (bvsge (x!32724 lt!157791) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!328074 (=> (not res!180696) (not e!201713))))

(declare-fun b!328075 () Bool)

(declare-fun e!201715 () SeekEntryResult!3074)

(declare-fun e!201711 () SeekEntryResult!3074)

(assert (=> b!328075 (= e!201715 e!201711)))

(declare-fun c!51327 () Bool)

(declare-fun lt!157792 () (_ BitVec 64))

(assert (=> b!328075 (= c!51327 (or (= lt!157792 k!2497) (= (bvadd lt!157792 lt!157792) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328076 () Bool)

(assert (=> b!328076 (= e!201714 (bvsge (x!32724 lt!157791) #b01111111111111111111111111111110))))

(declare-fun d!69955 () Bool)

(assert (=> d!69955 e!201714))

(declare-fun c!51326 () Bool)

(assert (=> d!69955 (= c!51326 (and (is-Intermediate!3074 lt!157791) (undefined!3886 lt!157791)))))

(assert (=> d!69955 (= lt!157791 e!201715)))

(declare-fun c!51325 () Bool)

(assert (=> d!69955 (= c!51325 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(assert (=> d!69955 (= lt!157792 (select (arr!7943 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!69955 (validMask!0 mask!3777)))

(assert (=> d!69955 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777) lt!157791)))

(declare-fun b!328077 () Bool)

(assert (=> b!328077 (= e!201711 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!328078 () Bool)

(assert (=> b!328078 (and (bvsge (index!14474 lt!157791) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157791) (size!8295 a!3305)))))

(declare-fun e!201712 () Bool)

(assert (=> b!328078 (= e!201712 (= (select (arr!7943 a!3305) (index!14474 lt!157791)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328079 () Bool)

(assert (=> b!328079 (= e!201715 (Intermediate!3074 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!328080 () Bool)

(assert (=> b!328080 (= e!201711 (Intermediate!3074 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!328081 () Bool)

(assert (=> b!328081 (and (bvsge (index!14474 lt!157791) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157791) (size!8295 a!3305)))))

(declare-fun res!180695 () Bool)

(assert (=> b!328081 (= res!180695 (= (select (arr!7943 a!3305) (index!14474 lt!157791)) k!2497))))

(assert (=> b!328081 (=> res!180695 e!201712)))

(assert (=> b!328081 (= e!201713 e!201712)))

(declare-fun b!328082 () Bool)

(assert (=> b!328082 (and (bvsge (index!14474 lt!157791) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157791) (size!8295 a!3305)))))

(declare-fun res!180694 () Bool)

(assert (=> b!328082 (= res!180694 (= (select (arr!7943 a!3305) (index!14474 lt!157791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328082 (=> res!180694 e!201712)))

(assert (= (and d!69955 c!51325) b!328079))

(assert (= (and d!69955 (not c!51325)) b!328075))

(assert (= (and b!328075 c!51327) b!328080))

(assert (= (and b!328075 (not c!51327)) b!328077))

(assert (= (and d!69955 c!51326) b!328076))

(assert (= (and d!69955 (not c!51326)) b!328074))

(assert (= (and b!328074 res!180696) b!328081))

(assert (= (and b!328081 (not res!180695)) b!328082))

(assert (= (and b!328082 (not res!180694)) b!328078))

(declare-fun m!334199 () Bool)

(assert (=> b!328081 m!334199))

(assert (=> b!328082 m!334199))

(assert (=> d!69955 m!334035))

(declare-fun m!334201 () Bool)

(assert (=> d!69955 m!334201))

(assert (=> d!69955 m!334041))

(assert (=> b!328077 m!334035))

(declare-fun m!334203 () Bool)

(assert (=> b!328077 m!334203))

(assert (=> b!328077 m!334203))

(declare-fun m!334205 () Bool)

(assert (=> b!328077 m!334205))

(assert (=> b!328078 m!334199))

(assert (=> b!327816 d!69955))

(declare-fun d!69959 () Bool)

(declare-fun lt!157799 () (_ BitVec 32))

(assert (=> d!69959 (and (bvsge lt!157799 #b00000000000000000000000000000000) (bvslt lt!157799 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69959 (= lt!157799 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69959 (validMask!0 mask!3777)))

(assert (=> d!69959 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!157799)))

(declare-fun bs!11382 () Bool)

(assert (= bs!11382 d!69959))

(declare-fun m!334215 () Bool)

(assert (=> bs!11382 m!334215))

(assert (=> bs!11382 m!334041))

(assert (=> b!327816 d!69959))

(declare-fun b!328092 () Bool)

(declare-fun e!201724 () Bool)

(declare-fun e!201723 () Bool)

(assert (=> b!328092 (= e!201724 e!201723)))

(declare-fun res!180702 () Bool)

(declare-fun lt!157802 () SeekEntryResult!3074)

(assert (=> b!328092 (= res!180702 (and (is-Intermediate!3074 lt!157802) (not (undefined!3886 lt!157802)) (bvslt (x!32724 lt!157802) #b01111111111111111111111111111110) (bvsge (x!32724 lt!157802) #b00000000000000000000000000000000) (bvsge (x!32724 lt!157802) x!1490)))))

(assert (=> b!328092 (=> (not res!180702) (not e!201723))))

(declare-fun b!328093 () Bool)

(declare-fun e!201725 () SeekEntryResult!3074)

(declare-fun e!201721 () SeekEntryResult!3074)

(assert (=> b!328093 (= e!201725 e!201721)))

(declare-fun c!51333 () Bool)

(declare-fun lt!157803 () (_ BitVec 64))

(assert (=> b!328093 (= c!51333 (or (= lt!157803 k!2497) (= (bvadd lt!157803 lt!157803) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328094 () Bool)

(assert (=> b!328094 (= e!201724 (bvsge (x!32724 lt!157802) #b01111111111111111111111111111110))))

(declare-fun d!69963 () Bool)

(assert (=> d!69963 e!201724))

(declare-fun c!51332 () Bool)

(assert (=> d!69963 (= c!51332 (and (is-Intermediate!3074 lt!157802) (undefined!3886 lt!157802)))))

(assert (=> d!69963 (= lt!157802 e!201725)))

(declare-fun c!51331 () Bool)

(assert (=> d!69963 (= c!51331 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69963 (= lt!157803 (select (arr!7943 a!3305) index!1840))))

(assert (=> d!69963 (validMask!0 mask!3777)))

(assert (=> d!69963 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157802)))

(declare-fun b!328095 () Bool)

(assert (=> b!328095 (= e!201721 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!328096 () Bool)

(assert (=> b!328096 (and (bvsge (index!14474 lt!157802) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157802) (size!8295 a!3305)))))

(declare-fun e!201722 () Bool)

(assert (=> b!328096 (= e!201722 (= (select (arr!7943 a!3305) (index!14474 lt!157802)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328097 () Bool)

(assert (=> b!328097 (= e!201725 (Intermediate!3074 true index!1840 x!1490))))

(declare-fun b!328098 () Bool)

(assert (=> b!328098 (= e!201721 (Intermediate!3074 false index!1840 x!1490))))

(declare-fun b!328099 () Bool)

(assert (=> b!328099 (and (bvsge (index!14474 lt!157802) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157802) (size!8295 a!3305)))))

(declare-fun res!180701 () Bool)

(assert (=> b!328099 (= res!180701 (= (select (arr!7943 a!3305) (index!14474 lt!157802)) k!2497))))

(assert (=> b!328099 (=> res!180701 e!201722)))

(assert (=> b!328099 (= e!201723 e!201722)))

(declare-fun b!328100 () Bool)

(assert (=> b!328100 (and (bvsge (index!14474 lt!157802) #b00000000000000000000000000000000) (bvslt (index!14474 lt!157802) (size!8295 a!3305)))))

(declare-fun res!180700 () Bool)

(assert (=> b!328100 (= res!180700 (= (select (arr!7943 a!3305) (index!14474 lt!157802)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328100 (=> res!180700 e!201722)))

(assert (= (and d!69963 c!51331) b!328097))

(assert (= (and d!69963 (not c!51331)) b!328093))

(assert (= (and b!328093 c!51333) b!328098))

(assert (= (and b!328093 (not c!51333)) b!328095))

(assert (= (and d!69963 c!51332) b!328094))

(assert (= (and d!69963 (not c!51332)) b!328092))

(assert (= (and b!328092 res!180702) b!328099))

(assert (= (and b!328099 (not res!180701)) b!328100))

(assert (= (and b!328100 (not res!180700)) b!328096))

(declare-fun m!334219 () Bool)

(assert (=> b!328099 m!334219))

(assert (=> b!328100 m!334219))

(assert (=> d!69963 m!334033))

(assert (=> d!69963 m!334041))

(assert (=> b!328095 m!334035))

(assert (=> b!328095 m!334035))

(declare-fun m!334221 () Bool)

(assert (=> b!328095 m!334221))

(assert (=> b!328096 m!334219))

(assert (=> b!327821 d!69963))

(push 1)

(assert (not d!69963))

(assert (not b!328073))

(assert (not d!69959))

(assert (not d!69937))

(assert (not b!327944))

(assert (not b!327947))

(assert (not bm!26107))

(assert (not b!327918))

(assert (not b!328066))

(assert (not b!328095))

(assert (not d!69915))

(assert (not d!69955))

(assert (not b!328077))

(check-sat)

(pop 1)

(push 1)

(check-sat)

