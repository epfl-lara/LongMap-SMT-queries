; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81700 () Bool)

(assert start!81700)

(declare-fun b!953504 () Bool)

(declare-fun res!638673 () Bool)

(declare-fun e!537076 () Bool)

(assert (=> b!953504 (=> (not res!638673) (not e!537076))))

(declare-datatypes ((array!57740 0))(
  ( (array!57741 (arr!27756 (Array (_ BitVec 32) (_ BitVec 64))) (size!28235 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57740)

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57740 (_ BitVec 32)) Bool)

(assert (=> b!953504 (= res!638673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun res!638672 () Bool)

(assert (=> start!81700 (=> (not res!638672) (not e!537076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81700 (= res!638672 (validMask!0 mask!4034))))

(assert (=> start!81700 e!537076))

(assert (=> start!81700 true))

(declare-fun array_inv!21546 (array!57740) Bool)

(assert (=> start!81700 (array_inv!21546 a!3460)))

(declare-fun b!953505 () Bool)

(declare-fun res!638674 () Bool)

(assert (=> b!953505 (=> (not res!638674) (not e!537076))))

(assert (=> b!953505 (= res!638674 (= (size!28235 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953506 () Bool)

(declare-fun res!638671 () Bool)

(assert (=> b!953506 (=> (not res!638671) (not e!537076))))

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun i!1375 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9183 0))(
  ( (MissingZero!9183 (index!39103 (_ BitVec 32))) (Found!9183 (index!39104 (_ BitVec 32))) (Intermediate!9183 (undefined!9995 Bool) (index!39105 (_ BitVec 32)) (x!82087 (_ BitVec 32))) (Undefined!9183) (MissingVacant!9183 (index!39106 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57740 (_ BitVec 32)) SeekEntryResult!9183)

(assert (=> b!953506 (= res!638671 (= (seekEntryOrOpen!0 k!2725 a!3460 mask!4034) (Found!9183 i!1375)))))

(declare-fun b!953507 () Bool)

(declare-fun lt!429730 () SeekEntryResult!9183)

(assert (=> b!953507 (= e!537076 (or (not (is-Found!9183 lt!429730)) (not (= (index!39104 lt!429730) i!1375))))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57740 (_ BitVec 32)) SeekEntryResult!9183)

(assert (=> b!953507 (= lt!429730 (seekEntry!0 k!2725 a!3460 mask!4034))))

(declare-fun b!953508 () Bool)

(declare-fun res!638670 () Bool)

(assert (=> b!953508 (=> (not res!638670) (not e!537076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953508 (= res!638670 (validKeyInArray!0 k!2725))))

(assert (= (and start!81700 res!638672) b!953505))

(assert (= (and b!953505 res!638674) b!953504))

(assert (= (and b!953504 res!638673) b!953508))

(assert (= (and b!953508 res!638670) b!953506))

(assert (= (and b!953506 res!638671) b!953507))

(declare-fun m!885547 () Bool)

(assert (=> b!953507 m!885547))

(declare-fun m!885549 () Bool)

(assert (=> b!953504 m!885549))

(declare-fun m!885551 () Bool)

(assert (=> start!81700 m!885551))

(declare-fun m!885553 () Bool)

(assert (=> start!81700 m!885553))

(declare-fun m!885555 () Bool)

(assert (=> b!953506 m!885555))

(declare-fun m!885557 () Bool)

(assert (=> b!953508 m!885557))

(push 1)

(assert (not b!953508))

(assert (not start!81700))

(assert (not b!953504))

(assert (not b!953506))

(assert (not b!953507))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!953563 () Bool)

(declare-fun c!99815 () Bool)

(declare-fun lt!429771 () (_ BitVec 64))

(assert (=> b!953563 (= c!99815 (= lt!429771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537113 () SeekEntryResult!9183)

(declare-fun e!537112 () SeekEntryResult!9183)

(assert (=> b!953563 (= e!537113 e!537112)))

(declare-fun b!953565 () Bool)

(declare-fun e!537111 () SeekEntryResult!9183)

(assert (=> b!953565 (= e!537111 e!537113)))

(declare-fun lt!429770 () SeekEntryResult!9183)

(assert (=> b!953565 (= lt!429771 (select (arr!27756 a!3460) (index!39105 lt!429770)))))

(declare-fun c!99814 () Bool)

(assert (=> b!953565 (= c!99814 (= lt!429771 k!2725))))

(declare-fun b!953566 () Bool)

(assert (=> b!953566 (= e!537112 (MissingZero!9183 (index!39105 lt!429770)))))

(declare-fun b!953564 () Bool)

(assert (=> b!953564 (= e!537113 (Found!9183 (index!39105 lt!429770)))))

(declare-fun d!115681 () Bool)

(declare-fun lt!429769 () SeekEntryResult!9183)

(assert (=> d!115681 (and (or (is-MissingVacant!9183 lt!429769) (not (is-Found!9183 lt!429769)) (and (bvsge (index!39104 lt!429769) #b00000000000000000000000000000000) (bvslt (index!39104 lt!429769) (size!28235 a!3460)))) (not (is-MissingVacant!9183 lt!429769)) (or (not (is-Found!9183 lt!429769)) (= (select (arr!27756 a!3460) (index!39104 lt!429769)) k!2725)))))

(assert (=> d!115681 (= lt!429769 e!537111)))

(declare-fun c!99813 () Bool)

(assert (=> d!115681 (= c!99813 (and (is-Intermediate!9183 lt!429770) (undefined!9995 lt!429770)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57740 (_ BitVec 32)) SeekEntryResult!9183)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115681 (= lt!429770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2725 mask!4034) k!2725 a!3460 mask!4034))))

(assert (=> d!115681 (validMask!0 mask!4034)))

(assert (=> d!115681 (= (seekEntry!0 k!2725 a!3460 mask!4034) lt!429769)))

(declare-fun b!953567 () Bool)

(declare-fun lt!429772 () SeekEntryResult!9183)

(assert (=> b!953567 (= e!537112 (ite (is-MissingVacant!9183 lt!429772) (MissingZero!9183 (index!39106 lt!429772)) lt!429772))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57740 (_ BitVec 32)) SeekEntryResult!9183)

(assert (=> b!953567 (= lt!429772 (seekKeyOrZeroReturnVacant!0 (x!82087 lt!429770) (index!39105 lt!429770) (index!39105 lt!429770) k!2725 a!3460 mask!4034))))

(declare-fun b!953568 () Bool)

(assert (=> b!953568 (= e!537111 Undefined!9183)))

(assert (= (and d!115681 c!99813) b!953568))

(assert (= (and d!115681 (not c!99813)) b!953565))

(assert (= (and b!953565 c!99814) b!953564))

(assert (= (and b!953565 (not c!99814)) b!953563))

(assert (= (and b!953563 c!99815) b!953566))

(assert (= (and b!953563 (not c!99815)) b!953567))

(declare-fun m!885593 () Bool)

(assert (=> b!953565 m!885593))

(declare-fun m!885595 () Bool)

(assert (=> d!115681 m!885595))

(declare-fun m!885597 () Bool)

(assert (=> d!115681 m!885597))

(assert (=> d!115681 m!885597))

(declare-fun m!885599 () Bool)

(assert (=> d!115681 m!885599))

(assert (=> d!115681 m!885551))

(declare-fun m!885601 () Bool)

(assert (=> b!953567 m!885601))

(assert (=> b!953507 d!115681))

(declare-fun d!115693 () Bool)

(assert (=> d!115693 (= (validMask!0 mask!4034) (and (or (= mask!4034 #b00000000000000000000000000000111) (= mask!4034 #b00000000000000000000000000001111) (= mask!4034 #b00000000000000000000000000011111) (= mask!4034 #b00000000000000000000000000111111) (= mask!4034 #b00000000000000000000000001111111) (= mask!4034 #b00000000000000000000000011111111) (= mask!4034 #b00000000000000000000000111111111) (= mask!4034 #b00000000000000000000001111111111) (= mask!4034 #b00000000000000000000011111111111) (= mask!4034 #b00000000000000000000111111111111) (= mask!4034 #b00000000000000000001111111111111) (= mask!4034 #b00000000000000000011111111111111) (= mask!4034 #b00000000000000000111111111111111) (= mask!4034 #b00000000000000001111111111111111) (= mask!4034 #b00000000000000011111111111111111) (= mask!4034 #b00000000000000111111111111111111) (= mask!4034 #b00000000000001111111111111111111) (= mask!4034 #b00000000000011111111111111111111) (= mask!4034 #b00000000000111111111111111111111) (= mask!4034 #b00000000001111111111111111111111) (= mask!4034 #b00000000011111111111111111111111) (= mask!4034 #b00000000111111111111111111111111) (= mask!4034 #b00000001111111111111111111111111) (= mask!4034 #b00000011111111111111111111111111) (= mask!4034 #b00000111111111111111111111111111) (= mask!4034 #b00001111111111111111111111111111) (= mask!4034 #b00011111111111111111111111111111) (= mask!4034 #b00111111111111111111111111111111)) (bvsle mask!4034 #b00111111111111111111111111111111)))))

(assert (=> start!81700 d!115693))

(declare-fun d!115703 () Bool)

(assert (=> d!115703 (= (array_inv!21546 a!3460) (bvsge (size!28235 a!3460) #b00000000000000000000000000000000))))

(assert (=> start!81700 d!115703))

(declare-fun b!953617 () Bool)

(declare-fun e!537138 () SeekEntryResult!9183)

(declare-fun lt!429797 () SeekEntryResult!9183)

(assert (=> b!953617 (= e!537138 (MissingZero!9183 (index!39105 lt!429797)))))

(declare-fun b!953618 () Bool)

(declare-fun c!99840 () Bool)

(declare-fun lt!429799 () (_ BitVec 64))

(assert (=> b!953618 (= c!99840 (= lt!429799 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537140 () SeekEntryResult!9183)

(assert (=> b!953618 (= e!537140 e!537138)))

(declare-fun d!115705 () Bool)

(declare-fun lt!429798 () SeekEntryResult!9183)

(assert (=> d!115705 (and (or (is-Undefined!9183 lt!429798) (not (is-Found!9183 lt!429798)) (and (bvsge (index!39104 lt!429798) #b00000000000000000000000000000000) (bvslt (index!39104 lt!429798) (size!28235 a!3460)))) (or (is-Undefined!9183 lt!429798) (is-Found!9183 lt!429798) (not (is-MissingZero!9183 lt!429798)) (and (bvsge (index!39103 lt!429798) #b00000000000000000000000000000000) (bvslt (index!39103 lt!429798) (size!28235 a!3460)))) (or (is-Undefined!9183 lt!429798) (is-Found!9183 lt!429798) (is-MissingZero!9183 lt!429798) (not (is-MissingVacant!9183 lt!429798)) (and (bvsge (index!39106 lt!429798) #b00000000000000000000000000000000) (bvslt (index!39106 lt!429798) (size!28235 a!3460)))) (or (is-Undefined!9183 lt!429798) (ite (is-Found!9183 lt!429798) (= (select (arr!27756 a!3460) (index!39104 lt!429798)) k!2725) (ite (is-MissingZero!9183 lt!429798) (= (select (arr!27756 a!3460) (index!39103 lt!429798)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9183 lt!429798) (= (select (arr!27756 a!3460) (index!39106 lt!429798)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!537139 () SeekEntryResult!9183)

(assert (=> d!115705 (= lt!429798 e!537139)))

(declare-fun c!99842 () Bool)

(assert (=> d!115705 (= c!99842 (and (is-Intermediate!9183 lt!429797) (undefined!9995 lt!429797)))))

(assert (=> d!115705 (= lt!429797 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2725 mask!4034) k!2725 a!3460 mask!4034))))

(assert (=> d!115705 (validMask!0 mask!4034)))

(assert (=> d!115705 (= (seekEntryOrOpen!0 k!2725 a!3460 mask!4034) lt!429798)))

(declare-fun b!953619 () Bool)

(assert (=> b!953619 (= e!537139 Undefined!9183)))

(declare-fun b!953620 () Bool)

(assert (=> b!953620 (= e!537140 (Found!9183 (index!39105 lt!429797)))))

(declare-fun b!953621 () Bool)

(assert (=> b!953621 (= e!537139 e!537140)))

(assert (=> b!953621 (= lt!429799 (select (arr!27756 a!3460) (index!39105 lt!429797)))))

(declare-fun c!99841 () Bool)

(assert (=> b!953621 (= c!99841 (= lt!429799 k!2725))))

(declare-fun b!953622 () Bool)

(assert (=> b!953622 (= e!537138 (seekKeyOrZeroReturnVacant!0 (x!82087 lt!429797) (index!39105 lt!429797) (index!39105 lt!429797) k!2725 a!3460 mask!4034))))

(assert (= (and d!115705 c!99842) b!953619))

(assert (= (and d!115705 (not c!99842)) b!953621))

(assert (= (and b!953621 c!99841) b!953620))

(assert (= (and b!953621 (not c!99841)) b!953618))

(assert (= (and b!953618 c!99840) b!953617))

(assert (= (and b!953618 (not c!99840)) b!953622))

(assert (=> d!115705 m!885597))

(assert (=> d!115705 m!885599))

(assert (=> d!115705 m!885597))

(declare-fun m!885627 () Bool)

(assert (=> d!115705 m!885627))

(declare-fun m!885629 () Bool)

(assert (=> d!115705 m!885629))

(assert (=> d!115705 m!885551))

(declare-fun m!885631 () Bool)

(assert (=> d!115705 m!885631))

(declare-fun m!885633 () Bool)

(assert (=> b!953621 m!885633))

(declare-fun m!885635 () Bool)

(assert (=> b!953622 m!885635))

(assert (=> b!953506 d!115705))

(declare-fun bm!41663 () Bool)

(declare-fun call!41666 () Bool)

(assert (=> bm!41663 (= call!41666 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3460 mask!4034))))

(declare-fun b!953643 () Bool)

(declare-fun e!537155 () Bool)

(declare-fun e!537153 () Bool)

(assert (=> b!953643 (= e!537155 e!537153)))

(declare-fun lt!429816 () (_ BitVec 64))

(assert (=> b!953643 (= lt!429816 (select (arr!27756 a!3460) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32083 0))(
  ( (Unit!32084) )
))
(declare-fun lt!429815 () Unit!32083)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57740 (_ BitVec 64) (_ BitVec 32)) Unit!32083)

(assert (=> b!953643 (= lt!429815 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3460 lt!429816 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953643 (arrayContainsKey!0 a!3460 lt!429816 #b00000000000000000000000000000000)))

(declare-fun lt!429814 () Unit!32083)

(assert (=> b!953643 (= lt!429814 lt!429815)))

(declare-fun res!638692 () Bool)

(assert (=> b!953643 (= res!638692 (= (seekEntryOrOpen!0 (select (arr!27756 a!3460) #b00000000000000000000000000000000) a!3460 mask!4034) (Found!9183 #b00000000000000000000000000000000)))))

(assert (=> b!953643 (=> (not res!638692) (not e!537153))))

(declare-fun b!953644 () Bool)

(assert (=> b!953644 (= e!537155 call!41666)))

(declare-fun b!953645 () Bool)

(assert (=> b!953645 (= e!537153 call!41666)))

(declare-fun b!953646 () Bool)

(declare-fun e!537154 () Bool)

(assert (=> b!953646 (= e!537154 e!537155)))

(declare-fun c!99851 () Bool)

(assert (=> b!953646 (= c!99851 (validKeyInArray!0 (select (arr!27756 a!3460) #b00000000000000000000000000000000)))))

(declare-fun d!115709 () Bool)

(declare-fun res!638691 () Bool)

(assert (=> d!115709 (=> res!638691 e!537154)))

(assert (=> d!115709 (= res!638691 (bvsge #b00000000000000000000000000000000 (size!28235 a!3460)))))

(assert (=> d!115709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034) e!537154)))

(assert (= (and d!115709 (not res!638691)) b!953646))

(assert (= (and b!953646 c!99851) b!953643))

