; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81698 () Bool)

(assert start!81698)

(declare-fun res!638655 () Bool)

(declare-fun e!537071 () Bool)

(assert (=> start!81698 (=> (not res!638655) (not e!537071))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81698 (= res!638655 (validMask!0 mask!4034))))

(assert (=> start!81698 e!537071))

(assert (=> start!81698 true))

(declare-datatypes ((array!57738 0))(
  ( (array!57739 (arr!27755 (Array (_ BitVec 32) (_ BitVec 64))) (size!28234 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57738)

(declare-fun array_inv!21545 (array!57738) Bool)

(assert (=> start!81698 (array_inv!21545 a!3460)))

(declare-fun b!953489 () Bool)

(declare-datatypes ((SeekEntryResult!9182 0))(
  ( (MissingZero!9182 (index!39099 (_ BitVec 32))) (Found!9182 (index!39100 (_ BitVec 32))) (Intermediate!9182 (undefined!9994 Bool) (index!39101 (_ BitVec 32)) (x!82086 (_ BitVec 32))) (Undefined!9182) (MissingVacant!9182 (index!39102 (_ BitVec 32))) )
))
(declare-fun lt!429727 () SeekEntryResult!9182)

(declare-fun i!1375 () (_ BitVec 32))

(get-info :version)

(assert (=> b!953489 (= e!537071 (or (not ((_ is Found!9182) lt!429727)) (not (= (index!39100 lt!429727) i!1375))))))

(declare-fun k0!2725 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57738 (_ BitVec 32)) SeekEntryResult!9182)

(assert (=> b!953489 (= lt!429727 (seekEntry!0 k0!2725 a!3460 mask!4034))))

(declare-fun b!953490 () Bool)

(declare-fun res!638658 () Bool)

(assert (=> b!953490 (=> (not res!638658) (not e!537071))))

(assert (=> b!953490 (= res!638658 (= (size!28234 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953491 () Bool)

(declare-fun res!638657 () Bool)

(assert (=> b!953491 (=> (not res!638657) (not e!537071))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57738 (_ BitVec 32)) SeekEntryResult!9182)

(assert (=> b!953491 (= res!638657 (= (seekEntryOrOpen!0 k0!2725 a!3460 mask!4034) (Found!9182 i!1375)))))

(declare-fun b!953492 () Bool)

(declare-fun res!638656 () Bool)

(assert (=> b!953492 (=> (not res!638656) (not e!537071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953492 (= res!638656 (validKeyInArray!0 k0!2725))))

(declare-fun b!953493 () Bool)

(declare-fun res!638659 () Bool)

(assert (=> b!953493 (=> (not res!638659) (not e!537071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57738 (_ BitVec 32)) Bool)

(assert (=> b!953493 (= res!638659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81698 res!638655) b!953490))

(assert (= (and b!953490 res!638658) b!953493))

(assert (= (and b!953493 res!638659) b!953492))

(assert (= (and b!953492 res!638656) b!953491))

(assert (= (and b!953491 res!638657) b!953489))

(declare-fun m!885535 () Bool)

(assert (=> b!953489 m!885535))

(declare-fun m!885537 () Bool)

(assert (=> b!953491 m!885537))

(declare-fun m!885539 () Bool)

(assert (=> b!953493 m!885539))

(declare-fun m!885541 () Bool)

(assert (=> start!81698 m!885541))

(declare-fun m!885543 () Bool)

(assert (=> start!81698 m!885543))

(declare-fun m!885545 () Bool)

(assert (=> b!953492 m!885545))

(check-sat (not b!953493) (not b!953489) (not b!953491) (not b!953492) (not start!81698))
(check-sat)
(get-model)

(declare-fun b!953535 () Bool)

(declare-fun e!537093 () Bool)

(declare-fun call!41660 () Bool)

(assert (=> b!953535 (= e!537093 call!41660)))

(declare-fun b!953536 () Bool)

(declare-fun e!537095 () Bool)

(declare-fun e!537094 () Bool)

(assert (=> b!953536 (= e!537095 e!537094)))

(declare-fun c!99803 () Bool)

(assert (=> b!953536 (= c!99803 (validKeyInArray!0 (select (arr!27755 a!3460) #b00000000000000000000000000000000)))))

(declare-fun d!115683 () Bool)

(declare-fun res!638679 () Bool)

(assert (=> d!115683 (=> res!638679 e!537095)))

(assert (=> d!115683 (= res!638679 (bvsge #b00000000000000000000000000000000 (size!28234 a!3460)))))

(assert (=> d!115683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034) e!537095)))

(declare-fun b!953537 () Bool)

(assert (=> b!953537 (= e!537094 call!41660)))

(declare-fun b!953538 () Bool)

(assert (=> b!953538 (= e!537094 e!537093)))

(declare-fun lt!429751 () (_ BitVec 64))

(assert (=> b!953538 (= lt!429751 (select (arr!27755 a!3460) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32081 0))(
  ( (Unit!32082) )
))
(declare-fun lt!429749 () Unit!32081)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57738 (_ BitVec 64) (_ BitVec 32)) Unit!32081)

(assert (=> b!953538 (= lt!429749 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3460 lt!429751 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953538 (arrayContainsKey!0 a!3460 lt!429751 #b00000000000000000000000000000000)))

(declare-fun lt!429750 () Unit!32081)

(assert (=> b!953538 (= lt!429750 lt!429749)))

(declare-fun res!638680 () Bool)

(assert (=> b!953538 (= res!638680 (= (seekEntryOrOpen!0 (select (arr!27755 a!3460) #b00000000000000000000000000000000) a!3460 mask!4034) (Found!9182 #b00000000000000000000000000000000)))))

(assert (=> b!953538 (=> (not res!638680) (not e!537093))))

(declare-fun bm!41657 () Bool)

(assert (=> bm!41657 (= call!41660 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3460 mask!4034))))

(assert (= (and d!115683 (not res!638679)) b!953536))

(assert (= (and b!953536 c!99803) b!953538))

(assert (= (and b!953536 (not c!99803)) b!953537))

(assert (= (and b!953538 res!638680) b!953535))

(assert (= (or b!953535 b!953537) bm!41657))

(declare-fun m!885569 () Bool)

(assert (=> b!953536 m!885569))

(assert (=> b!953536 m!885569))

(declare-fun m!885571 () Bool)

(assert (=> b!953536 m!885571))

(assert (=> b!953538 m!885569))

(declare-fun m!885573 () Bool)

(assert (=> b!953538 m!885573))

(declare-fun m!885575 () Bool)

(assert (=> b!953538 m!885575))

(assert (=> b!953538 m!885569))

(declare-fun m!885577 () Bool)

(assert (=> b!953538 m!885577))

(declare-fun m!885579 () Bool)

(assert (=> bm!41657 m!885579))

(assert (=> b!953493 d!115683))

(declare-fun d!115687 () Bool)

(assert (=> d!115687 (= (validKeyInArray!0 k0!2725) (and (not (= k0!2725 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2725 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953492 d!115687))

(declare-fun d!115689 () Bool)

(assert (=> d!115689 (= (validMask!0 mask!4034) (and (or (= mask!4034 #b00000000000000000000000000000111) (= mask!4034 #b00000000000000000000000000001111) (= mask!4034 #b00000000000000000000000000011111) (= mask!4034 #b00000000000000000000000000111111) (= mask!4034 #b00000000000000000000000001111111) (= mask!4034 #b00000000000000000000000011111111) (= mask!4034 #b00000000000000000000000111111111) (= mask!4034 #b00000000000000000000001111111111) (= mask!4034 #b00000000000000000000011111111111) (= mask!4034 #b00000000000000000000111111111111) (= mask!4034 #b00000000000000000001111111111111) (= mask!4034 #b00000000000000000011111111111111) (= mask!4034 #b00000000000000000111111111111111) (= mask!4034 #b00000000000000001111111111111111) (= mask!4034 #b00000000000000011111111111111111) (= mask!4034 #b00000000000000111111111111111111) (= mask!4034 #b00000000000001111111111111111111) (= mask!4034 #b00000000000011111111111111111111) (= mask!4034 #b00000000000111111111111111111111) (= mask!4034 #b00000000001111111111111111111111) (= mask!4034 #b00000000011111111111111111111111) (= mask!4034 #b00000000111111111111111111111111) (= mask!4034 #b00000001111111111111111111111111) (= mask!4034 #b00000011111111111111111111111111) (= mask!4034 #b00000111111111111111111111111111) (= mask!4034 #b00001111111111111111111111111111) (= mask!4034 #b00011111111111111111111111111111) (= mask!4034 #b00111111111111111111111111111111)) (bvsle mask!4034 #b00111111111111111111111111111111)))))

(assert (=> start!81698 d!115689))

(declare-fun d!115695 () Bool)

(assert (=> d!115695 (= (array_inv!21545 a!3460) (bvsge (size!28234 a!3460) #b00000000000000000000000000000000))))

(assert (=> start!81698 d!115695))

(declare-fun b!953599 () Bool)

(declare-fun e!537129 () SeekEntryResult!9182)

(declare-fun lt!429791 () SeekEntryResult!9182)

(assert (=> b!953599 (= e!537129 (Found!9182 (index!39101 lt!429791)))))

(declare-fun b!953600 () Bool)

(declare-fun c!99831 () Bool)

(declare-fun lt!429793 () (_ BitVec 64))

(assert (=> b!953600 (= c!99831 (= lt!429793 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537130 () SeekEntryResult!9182)

(assert (=> b!953600 (= e!537129 e!537130)))

(declare-fun b!953601 () Bool)

(declare-fun e!537128 () SeekEntryResult!9182)

(assert (=> b!953601 (= e!537128 e!537129)))

(assert (=> b!953601 (= lt!429793 (select (arr!27755 a!3460) (index!39101 lt!429791)))))

(declare-fun c!99830 () Bool)

(assert (=> b!953601 (= c!99830 (= lt!429793 k0!2725))))

(declare-fun b!953602 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57738 (_ BitVec 32)) SeekEntryResult!9182)

(assert (=> b!953602 (= e!537130 (seekKeyOrZeroReturnVacant!0 (x!82086 lt!429791) (index!39101 lt!429791) (index!39101 lt!429791) k0!2725 a!3460 mask!4034))))

(declare-fun b!953603 () Bool)

(assert (=> b!953603 (= e!537128 Undefined!9182)))

(declare-fun b!953604 () Bool)

(assert (=> b!953604 (= e!537130 (MissingZero!9182 (index!39101 lt!429791)))))

(declare-fun d!115697 () Bool)

(declare-fun lt!429792 () SeekEntryResult!9182)

(assert (=> d!115697 (and (or ((_ is Undefined!9182) lt!429792) (not ((_ is Found!9182) lt!429792)) (and (bvsge (index!39100 lt!429792) #b00000000000000000000000000000000) (bvslt (index!39100 lt!429792) (size!28234 a!3460)))) (or ((_ is Undefined!9182) lt!429792) ((_ is Found!9182) lt!429792) (not ((_ is MissingZero!9182) lt!429792)) (and (bvsge (index!39099 lt!429792) #b00000000000000000000000000000000) (bvslt (index!39099 lt!429792) (size!28234 a!3460)))) (or ((_ is Undefined!9182) lt!429792) ((_ is Found!9182) lt!429792) ((_ is MissingZero!9182) lt!429792) (not ((_ is MissingVacant!9182) lt!429792)) (and (bvsge (index!39102 lt!429792) #b00000000000000000000000000000000) (bvslt (index!39102 lt!429792) (size!28234 a!3460)))) (or ((_ is Undefined!9182) lt!429792) (ite ((_ is Found!9182) lt!429792) (= (select (arr!27755 a!3460) (index!39100 lt!429792)) k0!2725) (ite ((_ is MissingZero!9182) lt!429792) (= (select (arr!27755 a!3460) (index!39099 lt!429792)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9182) lt!429792) (= (select (arr!27755 a!3460) (index!39102 lt!429792)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!115697 (= lt!429792 e!537128)))

(declare-fun c!99832 () Bool)

(assert (=> d!115697 (= c!99832 (and ((_ is Intermediate!9182) lt!429791) (undefined!9994 lt!429791)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57738 (_ BitVec 32)) SeekEntryResult!9182)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115697 (= lt!429791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2725 mask!4034) k0!2725 a!3460 mask!4034))))

(assert (=> d!115697 (validMask!0 mask!4034)))

(assert (=> d!115697 (= (seekEntryOrOpen!0 k0!2725 a!3460 mask!4034) lt!429792)))

(assert (= (and d!115697 c!99832) b!953603))

(assert (= (and d!115697 (not c!99832)) b!953601))

(assert (= (and b!953601 c!99830) b!953599))

(assert (= (and b!953601 (not c!99830)) b!953600))

(assert (= (and b!953600 c!99831) b!953604))

(assert (= (and b!953600 (not c!99831)) b!953602))

(declare-fun m!885603 () Bool)

(assert (=> b!953601 m!885603))

(declare-fun m!885605 () Bool)

(assert (=> b!953602 m!885605))

(declare-fun m!885607 () Bool)

(assert (=> d!115697 m!885607))

(declare-fun m!885609 () Bool)

(assert (=> d!115697 m!885609))

(declare-fun m!885611 () Bool)

(assert (=> d!115697 m!885611))

(assert (=> d!115697 m!885541))

(declare-fun m!885613 () Bool)

(assert (=> d!115697 m!885613))

(declare-fun m!885615 () Bool)

(assert (=> d!115697 m!885615))

(assert (=> d!115697 m!885613))

(assert (=> b!953491 d!115697))

(declare-fun b!953647 () Bool)

(declare-fun c!99854 () Bool)

(declare-fun lt!429819 () (_ BitVec 64))

(assert (=> b!953647 (= c!99854 (= lt!429819 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537156 () SeekEntryResult!9182)

(declare-fun e!537158 () SeekEntryResult!9182)

(assert (=> b!953647 (= e!537156 e!537158)))

(declare-fun b!953648 () Bool)

(declare-fun lt!429817 () SeekEntryResult!9182)

(assert (=> b!953648 (= e!537158 (MissingZero!9182 (index!39101 lt!429817)))))

(declare-fun b!953649 () Bool)

(assert (=> b!953649 (= e!537156 (Found!9182 (index!39101 lt!429817)))))

(declare-fun d!115707 () Bool)

(declare-fun lt!429818 () SeekEntryResult!9182)

(assert (=> d!115707 (and (or ((_ is MissingVacant!9182) lt!429818) (not ((_ is Found!9182) lt!429818)) (and (bvsge (index!39100 lt!429818) #b00000000000000000000000000000000) (bvslt (index!39100 lt!429818) (size!28234 a!3460)))) (not ((_ is MissingVacant!9182) lt!429818)) (or (not ((_ is Found!9182) lt!429818)) (= (select (arr!27755 a!3460) (index!39100 lt!429818)) k0!2725)))))

(declare-fun e!537157 () SeekEntryResult!9182)

(assert (=> d!115707 (= lt!429818 e!537157)))

(declare-fun c!99852 () Bool)

(assert (=> d!115707 (= c!99852 (and ((_ is Intermediate!9182) lt!429817) (undefined!9994 lt!429817)))))

(assert (=> d!115707 (= lt!429817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2725 mask!4034) k0!2725 a!3460 mask!4034))))

(assert (=> d!115707 (validMask!0 mask!4034)))

(assert (=> d!115707 (= (seekEntry!0 k0!2725 a!3460 mask!4034) lt!429818)))

(declare-fun b!953650 () Bool)

(assert (=> b!953650 (= e!537157 Undefined!9182)))

(declare-fun b!953651 () Bool)

(declare-fun lt!429820 () SeekEntryResult!9182)

(assert (=> b!953651 (= e!537158 (ite ((_ is MissingVacant!9182) lt!429820) (MissingZero!9182 (index!39102 lt!429820)) lt!429820))))

(assert (=> b!953651 (= lt!429820 (seekKeyOrZeroReturnVacant!0 (x!82086 lt!429817) (index!39101 lt!429817) (index!39101 lt!429817) k0!2725 a!3460 mask!4034))))

(declare-fun b!953652 () Bool)

(assert (=> b!953652 (= e!537157 e!537156)))

(assert (=> b!953652 (= lt!429819 (select (arr!27755 a!3460) (index!39101 lt!429817)))))

(declare-fun c!99853 () Bool)

(assert (=> b!953652 (= c!99853 (= lt!429819 k0!2725))))

(assert (= (and d!115707 c!99852) b!953650))

(assert (= (and d!115707 (not c!99852)) b!953652))

(assert (= (and b!953652 c!99853) b!953649))

(assert (= (and b!953652 (not c!99853)) b!953647))

(assert (= (and b!953647 c!99854) b!953648))

(assert (= (and b!953647 (not c!99854)) b!953651))

(declare-fun m!885649 () Bool)

(assert (=> d!115707 m!885649))

(assert (=> d!115707 m!885613))

(assert (=> d!115707 m!885613))

(assert (=> d!115707 m!885615))

(assert (=> d!115707 m!885541))

(declare-fun m!885651 () Bool)

(assert (=> b!953651 m!885651))

(declare-fun m!885653 () Bool)

(assert (=> b!953652 m!885653))

(assert (=> b!953489 d!115707))

(check-sat (not b!953536) (not b!953538) (not bm!41657) (not b!953602) (not b!953651) (not d!115697) (not d!115707))
