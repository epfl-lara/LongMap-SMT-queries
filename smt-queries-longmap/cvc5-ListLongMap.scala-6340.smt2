; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81696 () Bool)

(assert start!81696)

(declare-fun b!953474 () Bool)

(declare-fun res!638641 () Bool)

(declare-fun e!537064 () Bool)

(assert (=> b!953474 (=> (not res!638641) (not e!537064))))

(declare-datatypes ((array!57736 0))(
  ( (array!57737 (arr!27754 (Array (_ BitVec 32) (_ BitVec 64))) (size!28233 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57736)

(declare-fun mask!4034 () (_ BitVec 32))

(assert (=> b!953474 (= res!638641 (= (size!28233 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953475 () Bool)

(declare-fun res!638642 () Bool)

(assert (=> b!953475 (=> (not res!638642) (not e!537064))))

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953475 (= res!638642 (validKeyInArray!0 k!2725))))

(declare-fun res!638644 () Bool)

(assert (=> start!81696 (=> (not res!638644) (not e!537064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81696 (= res!638644 (validMask!0 mask!4034))))

(assert (=> start!81696 e!537064))

(assert (=> start!81696 true))

(declare-fun array_inv!21544 (array!57736) Bool)

(assert (=> start!81696 (array_inv!21544 a!3460)))

(declare-fun b!953476 () Bool)

(declare-fun res!638640 () Bool)

(assert (=> b!953476 (=> (not res!638640) (not e!537064))))

(declare-fun i!1375 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9181 0))(
  ( (MissingZero!9181 (index!39095 (_ BitVec 32))) (Found!9181 (index!39096 (_ BitVec 32))) (Intermediate!9181 (undefined!9993 Bool) (index!39097 (_ BitVec 32)) (x!82085 (_ BitVec 32))) (Undefined!9181) (MissingVacant!9181 (index!39098 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57736 (_ BitVec 32)) SeekEntryResult!9181)

(assert (=> b!953476 (= res!638640 (= (seekEntryOrOpen!0 k!2725 a!3460 mask!4034) (Found!9181 i!1375)))))

(declare-fun b!953477 () Bool)

(declare-fun res!638643 () Bool)

(assert (=> b!953477 (=> (not res!638643) (not e!537064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57736 (_ BitVec 32)) Bool)

(assert (=> b!953477 (= res!638643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun b!953478 () Bool)

(declare-fun lt!429724 () SeekEntryResult!9181)

(assert (=> b!953478 (= e!537064 (or (not (is-Found!9181 lt!429724)) (not (= (index!39096 lt!429724) i!1375))))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57736 (_ BitVec 32)) SeekEntryResult!9181)

(assert (=> b!953478 (= lt!429724 (seekEntry!0 k!2725 a!3460 mask!4034))))

(assert (= (and start!81696 res!638644) b!953474))

(assert (= (and b!953474 res!638641) b!953477))

(assert (= (and b!953477 res!638643) b!953475))

(assert (= (and b!953475 res!638642) b!953476))

(assert (= (and b!953476 res!638640) b!953478))

(declare-fun m!885523 () Bool)

(assert (=> start!81696 m!885523))

(declare-fun m!885525 () Bool)

(assert (=> start!81696 m!885525))

(declare-fun m!885527 () Bool)

(assert (=> b!953477 m!885527))

(declare-fun m!885529 () Bool)

(assert (=> b!953475 m!885529))

(declare-fun m!885531 () Bool)

(assert (=> b!953476 m!885531))

(declare-fun m!885533 () Bool)

(assert (=> b!953478 m!885533))

(push 1)

(assert (not start!81696))

(assert (not b!953478))

(assert (not b!953476))

(assert (not b!953475))

(assert (not b!953477))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!115677 () Bool)

(assert (=> d!115677 (= (validKeyInArray!0 k!2725) (and (not (= k!2725 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2725 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953475 d!115677))

(declare-fun b!953521 () Bool)

(declare-fun e!537085 () SeekEntryResult!9181)

(declare-fun lt!429739 () SeekEntryResult!9181)

(assert (=> b!953521 (= e!537085 (MissingZero!9181 (index!39097 lt!429739)))))

(declare-fun d!115679 () Bool)

(declare-fun lt!429742 () SeekEntryResult!9181)

(assert (=> d!115679 (and (or (is-MissingVacant!9181 lt!429742) (not (is-Found!9181 lt!429742)) (and (bvsge (index!39096 lt!429742) #b00000000000000000000000000000000) (bvslt (index!39096 lt!429742) (size!28233 a!3460)))) (not (is-MissingVacant!9181 lt!429742)) (or (not (is-Found!9181 lt!429742)) (= (select (arr!27754 a!3460) (index!39096 lt!429742)) k!2725)))))

(declare-fun e!537086 () SeekEntryResult!9181)

(assert (=> d!115679 (= lt!429742 e!537086)))

(declare-fun c!99799 () Bool)

(assert (=> d!115679 (= c!99799 (and (is-Intermediate!9181 lt!429739) (undefined!9993 lt!429739)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57736 (_ BitVec 32)) SeekEntryResult!9181)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115679 (= lt!429739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2725 mask!4034) k!2725 a!3460 mask!4034))))

(assert (=> d!115679 (validMask!0 mask!4034)))

(assert (=> d!115679 (= (seekEntry!0 k!2725 a!3460 mask!4034) lt!429742)))

(declare-fun b!953522 () Bool)

(assert (=> b!953522 (= e!537086 Undefined!9181)))

(declare-fun b!953523 () Bool)

(declare-fun c!99798 () Bool)

(declare-fun lt!429740 () (_ BitVec 64))

(assert (=> b!953523 (= c!99798 (= lt!429740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537084 () SeekEntryResult!9181)

(assert (=> b!953523 (= e!537084 e!537085)))

(declare-fun b!953524 () Bool)

(assert (=> b!953524 (= e!537086 e!537084)))

(assert (=> b!953524 (= lt!429740 (select (arr!27754 a!3460) (index!39097 lt!429739)))))

(declare-fun c!99800 () Bool)

(assert (=> b!953524 (= c!99800 (= lt!429740 k!2725))))

(declare-fun b!953525 () Bool)

(declare-fun lt!429741 () SeekEntryResult!9181)

(assert (=> b!953525 (= e!537085 (ite (is-MissingVacant!9181 lt!429741) (MissingZero!9181 (index!39098 lt!429741)) lt!429741))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57736 (_ BitVec 32)) SeekEntryResult!9181)

(assert (=> b!953525 (= lt!429741 (seekKeyOrZeroReturnVacant!0 (x!82085 lt!429739) (index!39097 lt!429739) (index!39097 lt!429739) k!2725 a!3460 mask!4034))))

(declare-fun b!953526 () Bool)

(assert (=> b!953526 (= e!537084 (Found!9181 (index!39097 lt!429739)))))

(assert (= (and d!115679 c!99799) b!953522))

(assert (= (and d!115679 (not c!99799)) b!953524))

(assert (= (and b!953524 c!99800) b!953526))

(assert (= (and b!953524 (not c!99800)) b!953523))

(assert (= (and b!953523 c!99798) b!953521))

(assert (= (and b!953523 (not c!99798)) b!953525))

(declare-fun m!885559 () Bool)

(assert (=> d!115679 m!885559))

(declare-fun m!885561 () Bool)

(assert (=> d!115679 m!885561))

(assert (=> d!115679 m!885561))

(declare-fun m!885563 () Bool)

(assert (=> d!115679 m!885563))

(assert (=> d!115679 m!885523))

(declare-fun m!885565 () Bool)

(assert (=> b!953524 m!885565))

(declare-fun m!885567 () Bool)

(assert (=> b!953525 m!885567))

(assert (=> b!953478 d!115679))

(declare-fun b!953559 () Bool)

(declare-fun e!537108 () Bool)

(declare-fun call!41663 () Bool)

(assert (=> b!953559 (= e!537108 call!41663)))

(declare-fun bm!41660 () Bool)

(assert (=> bm!41660 (= call!41663 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3460 mask!4034))))

(declare-fun b!953560 () Bool)

(declare-fun e!537110 () Bool)

(assert (=> b!953560 (= e!537110 e!537108)))

(declare-fun c!99812 () Bool)

(assert (=> b!953560 (= c!99812 (validKeyInArray!0 (select (arr!27754 a!3460) #b00000000000000000000000000000000)))))

(declare-fun d!115685 () Bool)

(declare-fun res!638686 () Bool)

(assert (=> d!115685 (=> res!638686 e!537110)))

(assert (=> d!115685 (= res!638686 (bvsge #b00000000000000000000000000000000 (size!28233 a!3460)))))

(assert (=> d!115685 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034) e!537110)))

(declare-fun b!953561 () Bool)

(declare-fun e!537109 () Bool)

(assert (=> b!953561 (= e!537108 e!537109)))

(declare-fun lt!429766 () (_ BitVec 64))

(assert (=> b!953561 (= lt!429766 (select (arr!27754 a!3460) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32079 0))(
  ( (Unit!32080) )
))
(declare-fun lt!429768 () Unit!32079)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57736 (_ BitVec 64) (_ BitVec 32)) Unit!32079)

(assert (=> b!953561 (= lt!429768 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3460 lt!429766 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953561 (arrayContainsKey!0 a!3460 lt!429766 #b00000000000000000000000000000000)))

(declare-fun lt!429767 () Unit!32079)

(assert (=> b!953561 (= lt!429767 lt!429768)))

(declare-fun res!638685 () Bool)

(assert (=> b!953561 (= res!638685 (= (seekEntryOrOpen!0 (select (arr!27754 a!3460) #b00000000000000000000000000000000) a!3460 mask!4034) (Found!9181 #b00000000000000000000000000000000)))))

(assert (=> b!953561 (=> (not res!638685) (not e!537109))))

(declare-fun b!953562 () Bool)

(assert (=> b!953562 (= e!537109 call!41663)))

(assert (= (and d!115685 (not res!638686)) b!953560))

(assert (= (and b!953560 c!99812) b!953561))

(assert (= (and b!953560 (not c!99812)) b!953559))

(assert (= (and b!953561 res!638685) b!953562))

(assert (= (or b!953562 b!953559) bm!41660))

(declare-fun m!885581 () Bool)

(assert (=> bm!41660 m!885581))

(declare-fun m!885583 () Bool)

(assert (=> b!953560 m!885583))

(assert (=> b!953560 m!885583))

(declare-fun m!885585 () Bool)

(assert (=> b!953560 m!885585))

(assert (=> b!953561 m!885583))

(declare-fun m!885587 () Bool)

(assert (=> b!953561 m!885587))

(declare-fun m!885589 () Bool)

(assert (=> b!953561 m!885589))

(assert (=> b!953561 m!885583))

(declare-fun m!885591 () Bool)

(assert (=> b!953561 m!885591))

(assert (=> b!953477 d!115685))

(declare-fun d!115691 () Bool)

(assert (=> d!115691 (= (validMask!0 mask!4034) (and (or (= mask!4034 #b00000000000000000000000000000111) (= mask!4034 #b00000000000000000000000000001111) (= mask!4034 #b00000000000000000000000000011111) (= mask!4034 #b00000000000000000000000000111111) (= mask!4034 #b00000000000000000000000001111111) (= mask!4034 #b00000000000000000000000011111111) (= mask!4034 #b00000000000000000000000111111111) (= mask!4034 #b00000000000000000000001111111111) (= mask!4034 #b00000000000000000000011111111111) (= mask!4034 #b00000000000000000000111111111111) (= mask!4034 #b00000000000000000001111111111111) (= mask!4034 #b00000000000000000011111111111111) (= mask!4034 #b00000000000000000111111111111111) (= mask!4034 #b00000000000000001111111111111111) (= mask!4034 #b00000000000000011111111111111111) (= mask!4034 #b00000000000000111111111111111111) (= mask!4034 #b00000000000001111111111111111111) (= mask!4034 #b00000000000011111111111111111111) (= mask!4034 #b00000000000111111111111111111111) (= mask!4034 #b00000000001111111111111111111111) (= mask!4034 #b00000000011111111111111111111111) (= mask!4034 #b00000000111111111111111111111111) (= mask!4034 #b00000001111111111111111111111111) (= mask!4034 #b00000011111111111111111111111111) (= mask!4034 #b00000111111111111111111111111111) (= mask!4034 #b00001111111111111111111111111111) (= mask!4034 #b00011111111111111111111111111111) (= mask!4034 #b00111111111111111111111111111111)) (bvsle mask!4034 #b00111111111111111111111111111111)))))

(assert (=> start!81696 d!115691))

(declare-fun d!115699 () Bool)

(assert (=> d!115699 (= (array_inv!21544 a!3460) (bvsge (size!28233 a!3460) #b00000000000000000000000000000000))))

(assert (=> start!81696 d!115699))

(declare-fun b!953611 () Bool)

(declare-fun e!537135 () SeekEntryResult!9181)

(declare-fun lt!429794 () SeekEntryResult!9181)

(assert (=> b!953611 (= e!537135 (Found!9181 (index!39097 lt!429794)))))

(declare-fun b!953612 () Bool)

(declare-fun c!99837 () Bool)

(declare-fun lt!429796 () (_ BitVec 64))

(assert (=> b!953612 (= c!99837 (= lt!429796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537137 () SeekEntryResult!9181)

(assert (=> b!953612 (= e!537135 e!537137)))

(declare-fun d!115701 () Bool)

(declare-fun lt!429795 () SeekEntryResult!9181)

(assert (=> d!115701 (and (or (is-Undefined!9181 lt!429795) (not (is-Found!9181 lt!429795)) (and (bvsge (index!39096 lt!429795) #b00000000000000000000000000000000) (bvslt (index!39096 lt!429795) (size!28233 a!3460)))) (or (is-Undefined!9181 lt!429795) (is-Found!9181 lt!429795) (not (is-MissingZero!9181 lt!429795)) (and (bvsge (index!39095 lt!429795) #b00000000000000000000000000000000) (bvslt (index!39095 lt!429795) (size!28233 a!3460)))) (or (is-Undefined!9181 lt!429795) (is-Found!9181 lt!429795) (is-MissingZero!9181 lt!429795) (not (is-MissingVacant!9181 lt!429795)) (and (bvsge (index!39098 lt!429795) #b00000000000000000000000000000000) (bvslt (index!39098 lt!429795) (size!28233 a!3460)))) (or (is-Undefined!9181 lt!429795) (ite (is-Found!9181 lt!429795) (= (select (arr!27754 a!3460) (index!39096 lt!429795)) k!2725) (ite (is-MissingZero!9181 lt!429795) (= (select (arr!27754 a!3460) (index!39095 lt!429795)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9181 lt!429795) (= (select (arr!27754 a!3460) (index!39098 lt!429795)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!537136 () SeekEntryResult!9181)

(assert (=> d!115701 (= lt!429795 e!537136)))

(declare-fun c!99839 () Bool)

(assert (=> d!115701 (= c!99839 (and (is-Intermediate!9181 lt!429794) (undefined!9993 lt!429794)))))

(assert (=> d!115701 (= lt!429794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2725 mask!4034) k!2725 a!3460 mask!4034))))

(assert (=> d!115701 (validMask!0 mask!4034)))

(assert (=> d!115701 (= (seekEntryOrOpen!0 k!2725 a!3460 mask!4034) lt!429795)))

(declare-fun b!953613 () Bool)

(assert (=> b!953613 (= e!537137 (MissingZero!9181 (index!39097 lt!429794)))))

(declare-fun b!953614 () Bool)

(assert (=> b!953614 (= e!537136 e!537135)))

(assert (=> b!953614 (= lt!429796 (select (arr!27754 a!3460) (index!39097 lt!429794)))))

(declare-fun c!99838 () Bool)

(assert (=> b!953614 (= c!99838 (= lt!429796 k!2725))))

(declare-fun b!953615 () Bool)

(assert (=> b!953615 (= e!537136 Undefined!9181)))

(declare-fun b!953616 () Bool)

(assert (=> b!953616 (= e!537137 (seekKeyOrZeroReturnVacant!0 (x!82085 lt!429794) (index!39097 lt!429794) (index!39097 lt!429794) k!2725 a!3460 mask!4034))))

(assert (= (and d!115701 c!99839) b!953615))

(assert (= (and d!115701 (not c!99839)) b!953614))

(assert (= (and b!953614 c!99838) b!953611))

(assert (= (and b!953614 (not c!99838)) b!953612))

(assert (= (and b!953612 c!99837) b!953613))

(assert (= (and b!953612 (not c!99837)) b!953616))

(assert (=> d!115701 m!885523))

(declare-fun m!885617 () Bool)

(assert (=> d!115701 m!885617))

(declare-fun m!885619 () Bool)

(assert (=> d!115701 m!885619))

(declare-fun m!885621 () Bool)

(assert (=> d!115701 m!885621))

(assert (=> d!115701 m!885561))

(assert (=> d!115701 m!885561))

(assert (=> d!115701 m!885563))

(declare-fun m!885623 () Bool)

(assert (=> b!953614 m!885623))

(declare-fun m!885625 () Bool)

(assert (=> b!953616 m!885625))

(assert (=> b!953476 d!115701))

(push 1)

(assert (not b!953560))

(assert (not d!115701))

(assert (not b!953616))

(assert (not d!115679))

(assert (not b!953525))

(assert (not b!953561))

(assert (not bm!41660))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

