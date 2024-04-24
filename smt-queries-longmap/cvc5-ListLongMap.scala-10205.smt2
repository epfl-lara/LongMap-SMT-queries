; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120408 () Bool)

(assert start!120408)

(declare-fun b!1400541 () Bool)

(declare-fun res!938606 () Bool)

(declare-fun e!792987 () Bool)

(assert (=> b!1400541 (=> (not res!938606) (not e!792987))))

(declare-datatypes ((array!95802 0))(
  ( (array!95803 (arr!46251 (Array (_ BitVec 32) (_ BitVec 64))) (size!46802 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95802)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95802 (_ BitVec 32)) Bool)

(assert (=> b!1400541 (= res!938606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400542 () Bool)

(declare-fun e!792988 () Bool)

(assert (=> b!1400542 (= e!792987 (not e!792988))))

(declare-fun res!938609 () Bool)

(assert (=> b!1400542 (=> res!938609 e!792988)))

(declare-datatypes ((SeekEntryResult!10471 0))(
  ( (MissingZero!10471 (index!44258 (_ BitVec 32))) (Found!10471 (index!44259 (_ BitVec 32))) (Intermediate!10471 (undefined!11283 Bool) (index!44260 (_ BitVec 32)) (x!126049 (_ BitVec 32))) (Undefined!10471) (MissingVacant!10471 (index!44261 (_ BitVec 32))) )
))
(declare-fun lt!615933 () SeekEntryResult!10471)

(assert (=> b!1400542 (= res!938609 (or (not (is-Intermediate!10471 lt!615933)) (undefined!11283 lt!615933)))))

(declare-fun e!792991 () Bool)

(assert (=> b!1400542 e!792991))

(declare-fun res!938605 () Bool)

(assert (=> b!1400542 (=> (not res!938605) (not e!792991))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400542 (= res!938605 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46973 0))(
  ( (Unit!46974) )
))
(declare-fun lt!615932 () Unit!46973)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46973)

(assert (=> b!1400542 (= lt!615932 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615934 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95802 (_ BitVec 32)) SeekEntryResult!10471)

(assert (=> b!1400542 (= lt!615933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615934 (select (arr!46251 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400542 (= lt!615934 (toIndex!0 (select (arr!46251 a!2901) j!112) mask!2840))))

(declare-fun b!1400543 () Bool)

(declare-fun res!938611 () Bool)

(assert (=> b!1400543 (=> (not res!938611) (not e!792987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400543 (= res!938611 (validKeyInArray!0 (select (arr!46251 a!2901) j!112)))))

(declare-fun b!1400544 () Bool)

(declare-fun res!938607 () Bool)

(assert (=> b!1400544 (=> (not res!938607) (not e!792987))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400544 (= res!938607 (validKeyInArray!0 (select (arr!46251 a!2901) i!1037)))))

(declare-fun b!1400546 () Bool)

(declare-fun res!938614 () Bool)

(assert (=> b!1400546 (=> (not res!938614) (not e!792987))))

(declare-datatypes ((List!32757 0))(
  ( (Nil!32754) (Cons!32753 (h!34006 (_ BitVec 64)) (t!47443 List!32757)) )
))
(declare-fun arrayNoDuplicates!0 (array!95802 (_ BitVec 32) List!32757) Bool)

(assert (=> b!1400546 (= res!938614 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32754))))

(declare-fun b!1400545 () Bool)

(declare-fun res!938612 () Bool)

(assert (=> b!1400545 (=> (not res!938612) (not e!792987))))

(assert (=> b!1400545 (= res!938612 (and (= (size!46802 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46802 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46802 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!938610 () Bool)

(assert (=> start!120408 (=> (not res!938610) (not e!792987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120408 (= res!938610 (validMask!0 mask!2840))))

(assert (=> start!120408 e!792987))

(assert (=> start!120408 true))

(declare-fun array_inv!35532 (array!95802) Bool)

(assert (=> start!120408 (array_inv!35532 a!2901)))

(declare-fun e!792989 () Bool)

(declare-fun lt!615931 () array!95802)

(declare-fun b!1400547 () Bool)

(declare-fun lt!615935 () SeekEntryResult!10471)

(declare-fun lt!615929 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95802 (_ BitVec 32)) SeekEntryResult!10471)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95802 (_ BitVec 32)) SeekEntryResult!10471)

(assert (=> b!1400547 (= e!792989 (= (seekEntryOrOpen!0 lt!615929 lt!615931 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126049 lt!615935) (index!44260 lt!615935) (index!44260 lt!615935) (select (arr!46251 a!2901) j!112) lt!615931 mask!2840)))))

(declare-fun b!1400548 () Bool)

(declare-fun e!792990 () Bool)

(assert (=> b!1400548 (= e!792988 e!792990)))

(declare-fun res!938613 () Bool)

(assert (=> b!1400548 (=> res!938613 e!792990)))

(assert (=> b!1400548 (= res!938613 (or (= lt!615933 lt!615935) (not (is-Intermediate!10471 lt!615935))))))

(assert (=> b!1400548 (= lt!615935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615929 mask!2840) lt!615929 lt!615931 mask!2840))))

(assert (=> b!1400548 (= lt!615929 (select (store (arr!46251 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400548 (= lt!615931 (array!95803 (store (arr!46251 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46802 a!2901)))))

(declare-fun b!1400549 () Bool)

(assert (=> b!1400549 (= e!792991 (= (seekEntryOrOpen!0 (select (arr!46251 a!2901) j!112) a!2901 mask!2840) (Found!10471 j!112)))))

(declare-fun b!1400550 () Bool)

(assert (=> b!1400550 (= e!792990 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> b!1400550 e!792989))

(declare-fun res!938608 () Bool)

(assert (=> b!1400550 (=> (not res!938608) (not e!792989))))

(assert (=> b!1400550 (= res!938608 (and (not (undefined!11283 lt!615935)) (= (index!44260 lt!615935) i!1037) (bvslt (x!126049 lt!615935) (x!126049 lt!615933)) (= (select (store (arr!46251 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44260 lt!615935)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615930 () Unit!46973)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46973)

(assert (=> b!1400550 (= lt!615930 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615934 (x!126049 lt!615933) (index!44260 lt!615933) (x!126049 lt!615935) (index!44260 lt!615935) (undefined!11283 lt!615935) mask!2840))))

(assert (= (and start!120408 res!938610) b!1400545))

(assert (= (and b!1400545 res!938612) b!1400544))

(assert (= (and b!1400544 res!938607) b!1400543))

(assert (= (and b!1400543 res!938611) b!1400541))

(assert (= (and b!1400541 res!938606) b!1400546))

(assert (= (and b!1400546 res!938614) b!1400542))

(assert (= (and b!1400542 res!938605) b!1400549))

(assert (= (and b!1400542 (not res!938609)) b!1400548))

(assert (= (and b!1400548 (not res!938613)) b!1400550))

(assert (= (and b!1400550 res!938608) b!1400547))

(declare-fun m!1288093 () Bool)

(assert (=> b!1400547 m!1288093))

(declare-fun m!1288095 () Bool)

(assert (=> b!1400547 m!1288095))

(assert (=> b!1400547 m!1288095))

(declare-fun m!1288097 () Bool)

(assert (=> b!1400547 m!1288097))

(declare-fun m!1288099 () Bool)

(assert (=> b!1400550 m!1288099))

(declare-fun m!1288101 () Bool)

(assert (=> b!1400550 m!1288101))

(declare-fun m!1288103 () Bool)

(assert (=> b!1400550 m!1288103))

(declare-fun m!1288105 () Bool)

(assert (=> b!1400548 m!1288105))

(assert (=> b!1400548 m!1288105))

(declare-fun m!1288107 () Bool)

(assert (=> b!1400548 m!1288107))

(assert (=> b!1400548 m!1288099))

(declare-fun m!1288109 () Bool)

(assert (=> b!1400548 m!1288109))

(declare-fun m!1288111 () Bool)

(assert (=> start!120408 m!1288111))

(declare-fun m!1288113 () Bool)

(assert (=> start!120408 m!1288113))

(assert (=> b!1400542 m!1288095))

(declare-fun m!1288115 () Bool)

(assert (=> b!1400542 m!1288115))

(assert (=> b!1400542 m!1288095))

(assert (=> b!1400542 m!1288095))

(declare-fun m!1288117 () Bool)

(assert (=> b!1400542 m!1288117))

(declare-fun m!1288119 () Bool)

(assert (=> b!1400542 m!1288119))

(declare-fun m!1288121 () Bool)

(assert (=> b!1400542 m!1288121))

(assert (=> b!1400549 m!1288095))

(assert (=> b!1400549 m!1288095))

(declare-fun m!1288123 () Bool)

(assert (=> b!1400549 m!1288123))

(declare-fun m!1288125 () Bool)

(assert (=> b!1400546 m!1288125))

(declare-fun m!1288127 () Bool)

(assert (=> b!1400541 m!1288127))

(declare-fun m!1288129 () Bool)

(assert (=> b!1400544 m!1288129))

(assert (=> b!1400544 m!1288129))

(declare-fun m!1288131 () Bool)

(assert (=> b!1400544 m!1288131))

(assert (=> b!1400543 m!1288095))

(assert (=> b!1400543 m!1288095))

(declare-fun m!1288133 () Bool)

(assert (=> b!1400543 m!1288133))

(push 1)

(assert (not b!1400549))

(assert (not b!1400544))

(assert (not start!120408))

(assert (not b!1400547))

(assert (not b!1400546))

(assert (not b!1400543))

(assert (not b!1400548))

(assert (not b!1400550))

(assert (not b!1400541))

(assert (not b!1400542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!151387 () Bool)

(assert (=> d!151387 (= (validKeyInArray!0 (select (arr!46251 a!2901) j!112)) (and (not (= (select (arr!46251 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46251 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1400543 d!151387))

(declare-fun d!151389 () Bool)

(declare-fun e!793009 () Bool)

(assert (=> d!151389 e!793009))

(declare-fun c!130446 () Bool)

(declare-fun lt!615946 () SeekEntryResult!10471)

(assert (=> d!151389 (= c!130446 (and (is-Intermediate!10471 lt!615946) (undefined!11283 lt!615946)))))

(declare-fun e!793012 () SeekEntryResult!10471)

(assert (=> d!151389 (= lt!615946 e!793012)))

(declare-fun c!130445 () Bool)

(assert (=> d!151389 (= c!130445 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!615947 () (_ BitVec 64))

(assert (=> d!151389 (= lt!615947 (select (arr!46251 lt!615931) (toIndex!0 lt!615929 mask!2840)))))

(assert (=> d!151389 (validMask!0 mask!2840)))

(assert (=> d!151389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615929 mask!2840) lt!615929 lt!615931 mask!2840) lt!615946)))

(declare-fun b!1400581 () Bool)

(assert (=> b!1400581 (= e!793009 (bvsge (x!126049 lt!615946) #b01111111111111111111111111111110))))

(declare-fun b!1400582 () Bool)

(assert (=> b!1400582 (= e!793012 (Intermediate!10471 true (toIndex!0 lt!615929 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1400583 () Bool)

(assert (=> b!1400583 (and (bvsge (index!44260 lt!615946) #b00000000000000000000000000000000) (bvslt (index!44260 lt!615946) (size!46802 lt!615931)))))

(declare-fun e!793011 () Bool)

(assert (=> b!1400583 (= e!793011 (= (select (arr!46251 lt!615931) (index!44260 lt!615946)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1400584 () Bool)

(assert (=> b!1400584 (and (bvsge (index!44260 lt!615946) #b00000000000000000000000000000000) (bvslt (index!44260 lt!615946) (size!46802 lt!615931)))))

(declare-fun res!938621 () Bool)

(assert (=> b!1400584 (= res!938621 (= (select (arr!46251 lt!615931) (index!44260 lt!615946)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1400584 (=> res!938621 e!793011)))

(declare-fun b!1400585 () Bool)

(declare-fun e!793010 () Bool)

(assert (=> b!1400585 (= e!793009 e!793010)))

(declare-fun res!938622 () Bool)

(assert (=> b!1400585 (= res!938622 (and (is-Intermediate!10471 lt!615946) (not (undefined!11283 lt!615946)) (bvslt (x!126049 lt!615946) #b01111111111111111111111111111110) (bvsge (x!126049 lt!615946) #b00000000000000000000000000000000) (bvsge (x!126049 lt!615946) #b00000000000000000000000000000000)))))

(assert (=> b!1400585 (=> (not res!938622) (not e!793010))))

(declare-fun b!1400586 () Bool)

(declare-fun e!793013 () SeekEntryResult!10471)

(assert (=> b!1400586 (= e!793013 (Intermediate!10471 false (toIndex!0 lt!615929 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1400587 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400587 (= e!793013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!615929 mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) lt!615929 lt!615931 mask!2840))))

(declare-fun b!1400588 () Bool)

(assert (=> b!1400588 (= e!793012 e!793013)))

(declare-fun c!130447 () Bool)

(assert (=> b!1400588 (= c!130447 (or (= lt!615947 lt!615929) (= (bvadd lt!615947 lt!615947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1400589 () Bool)

(assert (=> b!1400589 (and (bvsge (index!44260 lt!615946) #b00000000000000000000000000000000) (bvslt (index!44260 lt!615946) (size!46802 lt!615931)))))

(declare-fun res!938623 () Bool)

(assert (=> b!1400589 (= res!938623 (= (select (arr!46251 lt!615931) (index!44260 lt!615946)) lt!615929))))

(assert (=> b!1400589 (=> res!938623 e!793011)))

(assert (=> b!1400589 (= e!793010 e!793011)))

(assert (= (and d!151389 c!130445) b!1400582))

(assert (= (and d!151389 (not c!130445)) b!1400588))

(assert (= (and b!1400588 c!130447) b!1400586))

(assert (= (and b!1400588 (not c!130447)) b!1400587))

(assert (= (and d!151389 c!130446) b!1400581))

(assert (= (and d!151389 (not c!130446)) b!1400585))

(assert (= (and b!1400585 res!938622) b!1400589))

(assert (= (and b!1400589 (not res!938623)) b!1400584))

(assert (= (and b!1400584 (not res!938621)) b!1400583))

(declare-fun m!1288135 () Bool)

(assert (=> b!1400583 m!1288135))

(assert (=> b!1400587 m!1288105))

(declare-fun m!1288137 () Bool)

(assert (=> b!1400587 m!1288137))

(assert (=> b!1400587 m!1288137))

(declare-fun m!1288139 () Bool)

(assert (=> b!1400587 m!1288139))

(assert (=> b!1400589 m!1288135))

(assert (=> b!1400584 m!1288135))

(assert (=> d!151389 m!1288105))

(declare-fun m!1288141 () Bool)

(assert (=> d!151389 m!1288141))

(assert (=> d!151389 m!1288111))

(assert (=> b!1400548 d!151389))

(declare-fun d!151393 () Bool)

(declare-fun lt!615956 () (_ BitVec 32))

(declare-fun lt!615955 () (_ BitVec 32))

(assert (=> d!151393 (= lt!615956 (bvmul (bvxor lt!615955 (bvlshr lt!615955 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151393 (= lt!615955 ((_ extract 31 0) (bvand (bvxor lt!615929 (bvlshr lt!615929 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151393 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!938624 (let ((h!34007 ((_ extract 31 0) (bvand (bvxor lt!615929 (bvlshr lt!615929 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126051 (bvmul (bvxor h!34007 (bvlshr h!34007 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126051 (bvlshr x!126051 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!938624 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!938624 #b00000000000000000000000000000000))))))

(assert (=> d!151393 (= (toIndex!0 lt!615929 mask!2840) (bvand (bvxor lt!615956 (bvlshr lt!615956 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1400548 d!151393))

(declare-fun call!66951 () Bool)

(declare-fun bm!66948 () Bool)

(assert (=> bm!66948 (= call!66951 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1400619 () Bool)

(declare-fun e!793035 () Bool)

(declare-fun e!793037 () Bool)

(assert (=> b!1400619 (= e!793035 e!793037)))

(declare-fun c!130456 () Bool)

(assert (=> b!1400619 (= c!130456 (validKeyInArray!0 (select (arr!46251 a!2901) j!112)))))

(declare-fun d!151397 () Bool)

(declare-fun res!938639 () Bool)

(assert (=> d!151397 (=> res!938639 e!793035)))

(assert (=> d!151397 (= res!938639 (bvsge j!112 (size!46802 a!2901)))))

(assert (=> d!151397 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!793035)))

(declare-fun b!1400620 () Bool)

(declare-fun e!793036 () Bool)

(assert (=> b!1400620 (= e!793036 call!66951)))

(declare-fun b!1400621 () Bool)

(assert (=> b!1400621 (= e!793037 call!66951)))

(declare-fun b!1400622 () Bool)

(assert (=> b!1400622 (= e!793037 e!793036)))

(declare-fun lt!615964 () (_ BitVec 64))

(assert (=> b!1400622 (= lt!615964 (select (arr!46251 a!2901) j!112))))

(declare-fun lt!615963 () Unit!46973)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95802 (_ BitVec 64) (_ BitVec 32)) Unit!46973)

(assert (=> b!1400622 (= lt!615963 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!615964 j!112))))

(declare-fun arrayContainsKey!0 (array!95802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1400622 (arrayContainsKey!0 a!2901 lt!615964 #b00000000000000000000000000000000)))

(declare-fun lt!615965 () Unit!46973)

(assert (=> b!1400622 (= lt!615965 lt!615963)))

(declare-fun res!938638 () Bool)

(assert (=> b!1400622 (= res!938638 (= (seekEntryOrOpen!0 (select (arr!46251 a!2901) j!112) a!2901 mask!2840) (Found!10471 j!112)))))

(assert (=> b!1400622 (=> (not res!938638) (not e!793036))))

(assert (= (and d!151397 (not res!938639)) b!1400619))

(assert (= (and b!1400619 c!130456) b!1400622))

(assert (= (and b!1400619 (not c!130456)) b!1400621))

(assert (= (and b!1400622 res!938638) b!1400620))

(assert (= (or b!1400620 b!1400621) bm!66948))

(declare-fun m!1288163 () Bool)

(assert (=> bm!66948 m!1288163))

(assert (=> b!1400619 m!1288095))

(assert (=> b!1400619 m!1288095))

(assert (=> b!1400619 m!1288133))

(assert (=> b!1400622 m!1288095))

(declare-fun m!1288165 () Bool)

(assert (=> b!1400622 m!1288165))

(declare-fun m!1288167 () Bool)

(assert (=> b!1400622 m!1288167))

(assert (=> b!1400622 m!1288095))

(assert (=> b!1400622 m!1288123))

(assert (=> b!1400542 d!151397))

(declare-fun d!151401 () Bool)

(assert (=> d!151401 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!615974 () Unit!46973)

(declare-fun choose!38 (array!95802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46973)

(assert (=> d!151401 (= lt!615974 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151401 (validMask!0 mask!2840)))

(assert (=> d!151401 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!615974)))

(declare-fun bs!40747 () Bool)

(assert (= bs!40747 d!151401))

(assert (=> bs!40747 m!1288121))

(declare-fun m!1288169 () Bool)

(assert (=> bs!40747 m!1288169))

(assert (=> bs!40747 m!1288111))

(assert (=> b!1400542 d!151401))

(declare-fun d!151405 () Bool)

(declare-fun e!793044 () Bool)

(assert (=> d!151405 e!793044))

(declare-fun c!130464 () Bool)

(declare-fun lt!615975 () SeekEntryResult!10471)

(assert (=> d!151405 (= c!130464 (and (is-Intermediate!10471 lt!615975) (undefined!11283 lt!615975)))))

(declare-fun e!793047 () SeekEntryResult!10471)

(assert (=> d!151405 (= lt!615975 e!793047)))

(declare-fun c!130463 () Bool)

(assert (=> d!151405 (= c!130463 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!615976 () (_ BitVec 64))

(assert (=> d!151405 (= lt!615976 (select (arr!46251 a!2901) lt!615934))))

(assert (=> d!151405 (validMask!0 mask!2840)))

(assert (=> d!151405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615934 (select (arr!46251 a!2901) j!112) a!2901 mask!2840) lt!615975)))

(declare-fun b!1400635 () Bool)

(assert (=> b!1400635 (= e!793044 (bvsge (x!126049 lt!615975) #b01111111111111111111111111111110))))

(declare-fun b!1400636 () Bool)

(assert (=> b!1400636 (= e!793047 (Intermediate!10471 true lt!615934 #b00000000000000000000000000000000))))

(declare-fun b!1400637 () Bool)

(assert (=> b!1400637 (and (bvsge (index!44260 lt!615975) #b00000000000000000000000000000000) (bvslt (index!44260 lt!615975) (size!46802 a!2901)))))

(declare-fun e!793046 () Bool)

(assert (=> b!1400637 (= e!793046 (= (select (arr!46251 a!2901) (index!44260 lt!615975)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1400638 () Bool)

(assert (=> b!1400638 (and (bvsge (index!44260 lt!615975) #b00000000000000000000000000000000) (bvslt (index!44260 lt!615975) (size!46802 a!2901)))))

(declare-fun res!938640 () Bool)

(assert (=> b!1400638 (= res!938640 (= (select (arr!46251 a!2901) (index!44260 lt!615975)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1400638 (=> res!938640 e!793046)))

(declare-fun b!1400639 () Bool)

(declare-fun e!793045 () Bool)

(assert (=> b!1400639 (= e!793044 e!793045)))

(declare-fun res!938641 () Bool)

(assert (=> b!1400639 (= res!938641 (and (is-Intermediate!10471 lt!615975) (not (undefined!11283 lt!615975)) (bvslt (x!126049 lt!615975) #b01111111111111111111111111111110) (bvsge (x!126049 lt!615975) #b00000000000000000000000000000000) (bvsge (x!126049 lt!615975) #b00000000000000000000000000000000)))))

(assert (=> b!1400639 (=> (not res!938641) (not e!793045))))

(declare-fun b!1400640 () Bool)

(declare-fun e!793048 () SeekEntryResult!10471)

(assert (=> b!1400640 (= e!793048 (Intermediate!10471 false lt!615934 #b00000000000000000000000000000000))))

(declare-fun b!1400641 () Bool)

(assert (=> b!1400641 (= e!793048 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!615934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46251 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1400642 () Bool)

(assert (=> b!1400642 (= e!793047 e!793048)))

(declare-fun c!130465 () Bool)

(assert (=> b!1400642 (= c!130465 (or (= lt!615976 (select (arr!46251 a!2901) j!112)) (= (bvadd lt!615976 lt!615976) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1400643 () Bool)

(assert (=> b!1400643 (and (bvsge (index!44260 lt!615975) #b00000000000000000000000000000000) (bvslt (index!44260 lt!615975) (size!46802 a!2901)))))

(declare-fun res!938642 () Bool)

(assert (=> b!1400643 (= res!938642 (= (select (arr!46251 a!2901) (index!44260 lt!615975)) (select (arr!46251 a!2901) j!112)))))

(assert (=> b!1400643 (=> res!938642 e!793046)))

(assert (=> b!1400643 (= e!793045 e!793046)))

(assert (= (and d!151405 c!130463) b!1400636))

(assert (= (and d!151405 (not c!130463)) b!1400642))

(assert (= (and b!1400642 c!130465) b!1400640))

(assert (= (and b!1400642 (not c!130465)) b!1400641))

(assert (= (and d!151405 c!130464) b!1400635))

(assert (= (and d!151405 (not c!130464)) b!1400639))

(assert (= (and b!1400639 res!938641) b!1400643))

(assert (= (and b!1400643 (not res!938642)) b!1400638))

(assert (= (and b!1400638 (not res!938640)) b!1400637))

(declare-fun m!1288171 () Bool)

(assert (=> b!1400637 m!1288171))

(declare-fun m!1288173 () Bool)

(assert (=> b!1400641 m!1288173))

(assert (=> b!1400641 m!1288173))

(assert (=> b!1400641 m!1288095))

(declare-fun m!1288175 () Bool)

(assert (=> b!1400641 m!1288175))

(assert (=> b!1400643 m!1288171))

(assert (=> b!1400638 m!1288171))

(declare-fun m!1288177 () Bool)

(assert (=> d!151405 m!1288177))

(assert (=> d!151405 m!1288111))

(assert (=> b!1400542 d!151405))

(declare-fun d!151407 () Bool)

(declare-fun lt!615978 () (_ BitVec 32))

(declare-fun lt!615977 () (_ BitVec 32))

(assert (=> d!151407 (= lt!615978 (bvmul (bvxor lt!615977 (bvlshr lt!615977 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151407 (= lt!615977 ((_ extract 31 0) (bvand (bvxor (select (arr!46251 a!2901) j!112) (bvlshr (select (arr!46251 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151407 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!938624 (let ((h!34007 ((_ extract 31 0) (bvand (bvxor (select (arr!46251 a!2901) j!112) (bvlshr (select (arr!46251 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126051 (bvmul (bvxor h!34007 (bvlshr h!34007 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126051 (bvlshr x!126051 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!938624 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!938624 #b00000000000000000000000000000000))))))

(assert (=> d!151407 (= (toIndex!0 (select (arr!46251 a!2901) j!112) mask!2840) (bvand (bvxor lt!615978 (bvlshr lt!615978 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1400542 d!151407))

(declare-fun d!151409 () Bool)

(assert (=> d!151409 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120408 d!151409))

(declare-fun d!151413 () Bool)

(assert (=> d!151413 (= (array_inv!35532 a!2901) (bvsge (size!46802 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120408 d!151413))

(declare-fun lt!616008 () SeekEntryResult!10471)

(declare-fun b!1400686 () Bool)

(declare-fun e!793077 () SeekEntryResult!10471)

(assert (=> b!1400686 (= e!793077 (seekKeyOrZeroReturnVacant!0 (x!126049 lt!616008) (index!44260 lt!616008) (index!44260 lt!616008) lt!615929 lt!615931 mask!2840))))

(declare-fun b!1400687 () Bool)

(assert (=> b!1400687 (= e!793077 (MissingZero!10471 (index!44260 lt!616008)))))

(declare-fun b!1400688 () Bool)

(declare-fun e!793076 () SeekEntryResult!10471)

(declare-fun e!793078 () SeekEntryResult!10471)

(assert (=> b!1400688 (= e!793076 e!793078)))

(declare-fun lt!616007 () (_ BitVec 64))

(assert (=> b!1400688 (= lt!616007 (select (arr!46251 lt!615931) (index!44260 lt!616008)))))

(declare-fun c!130482 () Bool)

(assert (=> b!1400688 (= c!130482 (= lt!616007 lt!615929))))

(declare-fun b!1400689 () Bool)

(assert (=> b!1400689 (= e!793076 Undefined!10471)))

(declare-fun d!151417 () Bool)

(declare-fun lt!616006 () SeekEntryResult!10471)

(assert (=> d!151417 (and (or (is-Undefined!10471 lt!616006) (not (is-Found!10471 lt!616006)) (and (bvsge (index!44259 lt!616006) #b00000000000000000000000000000000) (bvslt (index!44259 lt!616006) (size!46802 lt!615931)))) (or (is-Undefined!10471 lt!616006) (is-Found!10471 lt!616006) (not (is-MissingZero!10471 lt!616006)) (and (bvsge (index!44258 lt!616006) #b00000000000000000000000000000000) (bvslt (index!44258 lt!616006) (size!46802 lt!615931)))) (or (is-Undefined!10471 lt!616006) (is-Found!10471 lt!616006) (is-MissingZero!10471 lt!616006) (not (is-MissingVacant!10471 lt!616006)) (and (bvsge (index!44261 lt!616006) #b00000000000000000000000000000000) (bvslt (index!44261 lt!616006) (size!46802 lt!615931)))) (or (is-Undefined!10471 lt!616006) (ite (is-Found!10471 lt!616006) (= (select (arr!46251 lt!615931) (index!44259 lt!616006)) lt!615929) (ite (is-MissingZero!10471 lt!616006) (= (select (arr!46251 lt!615931) (index!44258 lt!616006)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10471 lt!616006) (= (select (arr!46251 lt!615931) (index!44261 lt!616006)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151417 (= lt!616006 e!793076)))

(declare-fun c!130483 () Bool)

(assert (=> d!151417 (= c!130483 (and (is-Intermediate!10471 lt!616008) (undefined!11283 lt!616008)))))

(assert (=> d!151417 (= lt!616008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615929 mask!2840) lt!615929 lt!615931 mask!2840))))

(assert (=> d!151417 (validMask!0 mask!2840)))

(assert (=> d!151417 (= (seekEntryOrOpen!0 lt!615929 lt!615931 mask!2840) lt!616006)))

(declare-fun b!1400690 () Bool)

(declare-fun c!130481 () Bool)

(assert (=> b!1400690 (= c!130481 (= lt!616007 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1400690 (= e!793078 e!793077)))

(declare-fun b!1400691 () Bool)

(assert (=> b!1400691 (= e!793078 (Found!10471 (index!44260 lt!616008)))))

(assert (= (and d!151417 c!130483) b!1400689))

(assert (= (and d!151417 (not c!130483)) b!1400688))

(assert (= (and b!1400688 c!130482) b!1400691))

(assert (= (and b!1400688 (not c!130482)) b!1400690))

(assert (= (and b!1400690 c!130481) b!1400687))

(assert (= (and b!1400690 (not c!130481)) b!1400686))

(declare-fun m!1288211 () Bool)

(assert (=> b!1400686 m!1288211))

(declare-fun m!1288213 () Bool)

(assert (=> b!1400688 m!1288213))

(declare-fun m!1288215 () Bool)

(assert (=> d!151417 m!1288215))

(declare-fun m!1288217 () Bool)

(assert (=> d!151417 m!1288217))

(assert (=> d!151417 m!1288105))

(assert (=> d!151417 m!1288107))

(assert (=> d!151417 m!1288105))

(declare-fun m!1288219 () Bool)

(assert (=> d!151417 m!1288219))

(assert (=> d!151417 m!1288111))

(assert (=> b!1400547 d!151417))

(declare-fun b!1400737 () Bool)

(declare-fun e!793103 () SeekEntryResult!10471)

(declare-fun e!793104 () SeekEntryResult!10471)

(assert (=> b!1400737 (= e!793103 e!793104)))

(declare-fun c!130503 () Bool)

(declare-fun lt!616023 () (_ BitVec 64))

(assert (=> b!1400737 (= c!130503 (= lt!616023 (select (arr!46251 a!2901) j!112)))))

(declare-fun lt!616022 () SeekEntryResult!10471)

(declare-fun d!151421 () Bool)

(assert (=> d!151421 (and (or (is-Undefined!10471 lt!616022) (not (is-Found!10471 lt!616022)) (and (bvsge (index!44259 lt!616022) #b00000000000000000000000000000000) (bvslt (index!44259 lt!616022) (size!46802 lt!615931)))) (or (is-Undefined!10471 lt!616022) (is-Found!10471 lt!616022) (not (is-MissingVacant!10471 lt!616022)) (not (= (index!44261 lt!616022) (index!44260 lt!615935))) (and (bvsge (index!44261 lt!616022) #b00000000000000000000000000000000) (bvslt (index!44261 lt!616022) (size!46802 lt!615931)))) (or (is-Undefined!10471 lt!616022) (ite (is-Found!10471 lt!616022) (= (select (arr!46251 lt!615931) (index!44259 lt!616022)) (select (arr!46251 a!2901) j!112)) (and (is-MissingVacant!10471 lt!616022) (= (index!44261 lt!616022) (index!44260 lt!615935)) (= (select (arr!46251 lt!615931) (index!44261 lt!616022)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!151421 (= lt!616022 e!793103)))

(declare-fun c!130504 () Bool)

(assert (=> d!151421 (= c!130504 (bvsge (x!126049 lt!615935) #b01111111111111111111111111111110))))

(assert (=> d!151421 (= lt!616023 (select (arr!46251 lt!615931) (index!44260 lt!615935)))))

(assert (=> d!151421 (validMask!0 mask!2840)))

(assert (=> d!151421 (= (seekKeyOrZeroReturnVacant!0 (x!126049 lt!615935) (index!44260 lt!615935) (index!44260 lt!615935) (select (arr!46251 a!2901) j!112) lt!615931 mask!2840) lt!616022)))

(declare-fun b!1400738 () Bool)

(assert (=> b!1400738 (= e!793104 (Found!10471 (index!44260 lt!615935)))))

(declare-fun b!1400739 () Bool)

(declare-fun c!130502 () Bool)

(assert (=> b!1400739 (= c!130502 (= lt!616023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!793105 () SeekEntryResult!10471)

(assert (=> b!1400739 (= e!793104 e!793105)))

(declare-fun b!1400740 () Bool)

(assert (=> b!1400740 (= e!793103 Undefined!10471)))

(declare-fun b!1400741 () Bool)

(assert (=> b!1400741 (= e!793105 (MissingVacant!10471 (index!44260 lt!615935)))))

(declare-fun b!1400742 () Bool)

(assert (=> b!1400742 (= e!793105 (seekKeyOrZeroReturnVacant!0 (bvadd (x!126049 lt!615935) #b00000000000000000000000000000001) (nextIndex!0 (index!44260 lt!615935) (bvadd (x!126049 lt!615935) #b00000000000000000000000000000001) mask!2840) (index!44260 lt!615935) (select (arr!46251 a!2901) j!112) lt!615931 mask!2840))))

(assert (= (and d!151421 c!130504) b!1400740))

(assert (= (and d!151421 (not c!130504)) b!1400737))

(assert (= (and b!1400737 c!130503) b!1400738))

(assert (= (and b!1400737 (not c!130503)) b!1400739))

(assert (= (and b!1400739 c!130502) b!1400741))

(assert (= (and b!1400739 (not c!130502)) b!1400742))

(declare-fun m!1288239 () Bool)

(assert (=> d!151421 m!1288239))

(declare-fun m!1288241 () Bool)

(assert (=> d!151421 m!1288241))

(declare-fun m!1288243 () Bool)

(assert (=> d!151421 m!1288243))

(assert (=> d!151421 m!1288111))

(declare-fun m!1288245 () Bool)

(assert (=> b!1400742 m!1288245))

(assert (=> b!1400742 m!1288245))

(assert (=> b!1400742 m!1288095))

(declare-fun m!1288247 () Bool)

(assert (=> b!1400742 m!1288247))

(assert (=> b!1400547 d!151421))

(declare-fun bm!66955 () Bool)

(declare-fun call!66958 () Bool)

(assert (=> bm!66955 (= call!66958 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1400743 () Bool)

(declare-fun e!793106 () Bool)

(declare-fun e!793108 () Bool)

(assert (=> b!1400743 (= e!793106 e!793108)))

(declare-fun c!130505 () Bool)

(assert (=> b!1400743 (= c!130505 (validKeyInArray!0 (select (arr!46251 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151431 () Bool)

(declare-fun res!938666 () Bool)

(assert (=> d!151431 (=> res!938666 e!793106)))

(assert (=> d!151431 (= res!938666 (bvsge #b00000000000000000000000000000000 (size!46802 a!2901)))))

(assert (=> d!151431 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!793106)))

(declare-fun b!1400744 () Bool)

(declare-fun e!793107 () Bool)

(assert (=> b!1400744 (= e!793107 call!66958)))

(declare-fun b!1400745 () Bool)

(assert (=> b!1400745 (= e!793108 call!66958)))

(declare-fun b!1400746 () Bool)

(assert (=> b!1400746 (= e!793108 e!793107)))

(declare-fun lt!616025 () (_ BitVec 64))

(assert (=> b!1400746 (= lt!616025 (select (arr!46251 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!616024 () Unit!46973)

(assert (=> b!1400746 (= lt!616024 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!616025 #b00000000000000000000000000000000))))

(assert (=> b!1400746 (arrayContainsKey!0 a!2901 lt!616025 #b00000000000000000000000000000000)))

(declare-fun lt!616026 () Unit!46973)

(assert (=> b!1400746 (= lt!616026 lt!616024)))

(declare-fun res!938665 () Bool)

(assert (=> b!1400746 (= res!938665 (= (seekEntryOrOpen!0 (select (arr!46251 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10471 #b00000000000000000000000000000000)))))

(assert (=> b!1400746 (=> (not res!938665) (not e!793107))))

(assert (= (and d!151431 (not res!938666)) b!1400743))

(assert (= (and b!1400743 c!130505) b!1400746))

(assert (= (and b!1400743 (not c!130505)) b!1400745))

(assert (= (and b!1400746 res!938665) b!1400744))

(assert (= (or b!1400744 b!1400745) bm!66955))

(declare-fun m!1288249 () Bool)

(assert (=> bm!66955 m!1288249))

(declare-fun m!1288251 () Bool)

(assert (=> b!1400743 m!1288251))

(assert (=> b!1400743 m!1288251))

(declare-fun m!1288253 () Bool)

(assert (=> b!1400743 m!1288253))

(assert (=> b!1400746 m!1288251))

(declare-fun m!1288255 () Bool)

(assert (=> b!1400746 m!1288255))

(declare-fun m!1288257 () Bool)

(assert (=> b!1400746 m!1288257))

(assert (=> b!1400746 m!1288251))

(declare-fun m!1288259 () Bool)

(assert (=> b!1400746 m!1288259))

(assert (=> b!1400541 d!151431))

(declare-fun b!1400757 () Bool)

(declare-fun e!793118 () Bool)

(declare-fun call!66961 () Bool)

(assert (=> b!1400757 (= e!793118 call!66961)))

(declare-fun b!1400758 () Bool)

(assert (=> b!1400758 (= e!793118 call!66961)))

(declare-fun d!151433 () Bool)

(declare-fun res!938674 () Bool)

(declare-fun e!793119 () Bool)

(assert (=> d!151433 (=> res!938674 e!793119)))

(assert (=> d!151433 (= res!938674 (bvsge #b00000000000000000000000000000000 (size!46802 a!2901)))))

(assert (=> d!151433 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32754) e!793119)))

(declare-fun b!1400759 () Bool)

(declare-fun e!793120 () Bool)

(declare-fun contains!9829 (List!32757 (_ BitVec 64)) Bool)

(assert (=> b!1400759 (= e!793120 (contains!9829 Nil!32754 (select (arr!46251 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66958 () Bool)

(declare-fun c!130508 () Bool)

(assert (=> bm!66958 (= call!66961 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130508 (Cons!32753 (select (arr!46251 a!2901) #b00000000000000000000000000000000) Nil!32754) Nil!32754)))))

(declare-fun b!1400760 () Bool)

(declare-fun e!793117 () Bool)

(assert (=> b!1400760 (= e!793117 e!793118)))

(assert (=> b!1400760 (= c!130508 (validKeyInArray!0 (select (arr!46251 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1400761 () Bool)

(assert (=> b!1400761 (= e!793119 e!793117)))

(declare-fun res!938673 () Bool)

(assert (=> b!1400761 (=> (not res!938673) (not e!793117))))

(assert (=> b!1400761 (= res!938673 (not e!793120))))

(declare-fun res!938675 () Bool)

(assert (=> b!1400761 (=> (not res!938675) (not e!793120))))

(assert (=> b!1400761 (= res!938675 (validKeyInArray!0 (select (arr!46251 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151433 (not res!938674)) b!1400761))

(assert (= (and b!1400761 res!938675) b!1400759))

(assert (= (and b!1400761 res!938673) b!1400760))

(assert (= (and b!1400760 c!130508) b!1400757))

(assert (= (and b!1400760 (not c!130508)) b!1400758))

(assert (= (or b!1400757 b!1400758) bm!66958))

(assert (=> b!1400759 m!1288251))

(assert (=> b!1400759 m!1288251))

(declare-fun m!1288261 () Bool)

(assert (=> b!1400759 m!1288261))

(assert (=> bm!66958 m!1288251))

(declare-fun m!1288263 () Bool)

(assert (=> bm!66958 m!1288263))

(assert (=> b!1400760 m!1288251))

(assert (=> b!1400760 m!1288251))

(assert (=> b!1400760 m!1288253))

(assert (=> b!1400761 m!1288251))

(assert (=> b!1400761 m!1288251))

(assert (=> b!1400761 m!1288253))

(assert (=> b!1400546 d!151433))

(declare-fun d!151437 () Bool)

(assert (=> d!151437 (and (not (undefined!11283 lt!615935)) (= (index!44260 lt!615935) i!1037) (bvslt (x!126049 lt!615935) (x!126049 lt!615933)))))

(declare-fun lt!616045 () Unit!46973)

(declare-fun choose!62 (array!95802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46973)

(assert (=> d!151437 (= lt!616045 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615934 (x!126049 lt!615933) (index!44260 lt!615933) (x!126049 lt!615935) (index!44260 lt!615935) (undefined!11283 lt!615935) mask!2840))))

(assert (=> d!151437 (validMask!0 mask!2840)))

(assert (=> d!151437 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615934 (x!126049 lt!615933) (index!44260 lt!615933) (x!126049 lt!615935) (index!44260 lt!615935) (undefined!11283 lt!615935) mask!2840) lt!616045)))

(declare-fun bs!40749 () Bool)

(assert (= bs!40749 d!151437))

(declare-fun m!1288269 () Bool)

(assert (=> bs!40749 m!1288269))

(assert (=> bs!40749 m!1288111))

(assert (=> b!1400550 d!151437))

(declare-fun d!151441 () Bool)

(assert (=> d!151441 (= (validKeyInArray!0 (select (arr!46251 a!2901) i!1037)) (and (not (= (select (arr!46251 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46251 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1400544 d!151441))

(declare-fun lt!616048 () SeekEntryResult!10471)

(declare-fun b!1400780 () Bool)

(declare-fun e!793131 () SeekEntryResult!10471)

(assert (=> b!1400780 (= e!793131 (seekKeyOrZeroReturnVacant!0 (x!126049 lt!616048) (index!44260 lt!616048) (index!44260 lt!616048) (select (arr!46251 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1400781 () Bool)

(assert (=> b!1400781 (= e!793131 (MissingZero!10471 (index!44260 lt!616048)))))

(declare-fun b!1400782 () Bool)

(declare-fun e!793130 () SeekEntryResult!10471)

(declare-fun e!793132 () SeekEntryResult!10471)

(assert (=> b!1400782 (= e!793130 e!793132)))

(declare-fun lt!616047 () (_ BitVec 64))

(assert (=> b!1400782 (= lt!616047 (select (arr!46251 a!2901) (index!44260 lt!616048)))))

(declare-fun c!130519 () Bool)

(assert (=> b!1400782 (= c!130519 (= lt!616047 (select (arr!46251 a!2901) j!112)))))

(declare-fun b!1400783 () Bool)

(assert (=> b!1400783 (= e!793130 Undefined!10471)))

(declare-fun d!151443 () Bool)

(declare-fun lt!616046 () SeekEntryResult!10471)

(assert (=> d!151443 (and (or (is-Undefined!10471 lt!616046) (not (is-Found!10471 lt!616046)) (and (bvsge (index!44259 lt!616046) #b00000000000000000000000000000000) (bvslt (index!44259 lt!616046) (size!46802 a!2901)))) (or (is-Undefined!10471 lt!616046) (is-Found!10471 lt!616046) (not (is-MissingZero!10471 lt!616046)) (and (bvsge (index!44258 lt!616046) #b00000000000000000000000000000000) (bvslt (index!44258 lt!616046) (size!46802 a!2901)))) (or (is-Undefined!10471 lt!616046) (is-Found!10471 lt!616046) (is-MissingZero!10471 lt!616046) (not (is-MissingVacant!10471 lt!616046)) (and (bvsge (index!44261 lt!616046) #b00000000000000000000000000000000) (bvslt (index!44261 lt!616046) (size!46802 a!2901)))) (or (is-Undefined!10471 lt!616046) (ite (is-Found!10471 lt!616046) (= (select (arr!46251 a!2901) (index!44259 lt!616046)) (select (arr!46251 a!2901) j!112)) (ite (is-MissingZero!10471 lt!616046) (= (select (arr!46251 a!2901) (index!44258 lt!616046)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10471 lt!616046) (= (select (arr!46251 a!2901) (index!44261 lt!616046)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151443 (= lt!616046 e!793130)))

(declare-fun c!130520 () Bool)

(assert (=> d!151443 (= c!130520 (and (is-Intermediate!10471 lt!616048) (undefined!11283 lt!616048)))))

(assert (=> d!151443 (= lt!616048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46251 a!2901) j!112) mask!2840) (select (arr!46251 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151443 (validMask!0 mask!2840)))

(assert (=> d!151443 (= (seekEntryOrOpen!0 (select (arr!46251 a!2901) j!112) a!2901 mask!2840) lt!616046)))

(declare-fun b!1400784 () Bool)

(declare-fun c!130518 () Bool)

(assert (=> b!1400784 (= c!130518 (= lt!616047 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1400784 (= e!793132 e!793131)))

(declare-fun b!1400785 () Bool)

(assert (=> b!1400785 (= e!793132 (Found!10471 (index!44260 lt!616048)))))

(assert (= (and d!151443 c!130520) b!1400783))

(assert (= (and d!151443 (not c!130520)) b!1400782))

(assert (= (and b!1400782 c!130519) b!1400785))

(assert (= (and b!1400782 (not c!130519)) b!1400784))

(assert (= (and b!1400784 c!130518) b!1400781))

(assert (= (and b!1400784 (not c!130518)) b!1400780))

(assert (=> b!1400780 m!1288095))

(declare-fun m!1288279 () Bool)

(assert (=> b!1400780 m!1288279))

(declare-fun m!1288281 () Bool)

(assert (=> b!1400782 m!1288281))

(declare-fun m!1288283 () Bool)

(assert (=> d!151443 m!1288283))

(declare-fun m!1288285 () Bool)

(assert (=> d!151443 m!1288285))

(assert (=> d!151443 m!1288115))

(assert (=> d!151443 m!1288095))

(declare-fun m!1288287 () Bool)

(assert (=> d!151443 m!1288287))

(assert (=> d!151443 m!1288095))

(assert (=> d!151443 m!1288115))

(declare-fun m!1288289 () Bool)

(assert (=> d!151443 m!1288289))

(assert (=> d!151443 m!1288111))

(assert (=> b!1400549 d!151443))

(push 1)

(assert (not b!1400587))

(assert (not b!1400641))

(assert (not d!151405))

(assert (not b!1400780))

(assert (not bm!66958))

(assert (not b!1400760))

(assert (not b!1400743))

(assert (not d!151421))

(assert (not b!1400622))

(assert (not b!1400746))

(assert (not d!151443))

(assert (not bm!66955))

(assert (not bm!66948))

(assert (not b!1400742))

(assert (not d!151389))

(assert (not b!1400619))

(assert (not b!1400759))

(assert (not b!1400761))

(assert (not d!151417))

(assert (not d!151401))

(assert (not b!1400686))

(assert (not d!151437))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

