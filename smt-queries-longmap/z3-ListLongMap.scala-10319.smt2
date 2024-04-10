; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121238 () Bool)

(assert start!121238)

(declare-fun b!1409702 () Bool)

(declare-fun res!947427 () Bool)

(declare-fun e!797727 () Bool)

(assert (=> b!1409702 (=> (not res!947427) (not e!797727))))

(declare-datatypes ((array!96392 0))(
  ( (array!96393 (arr!46539 (Array (_ BitVec 32) (_ BitVec 64))) (size!47089 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96392)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96392 (_ BitVec 32)) Bool)

(assert (=> b!1409702 (= res!947427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!947425 () Bool)

(assert (=> start!121238 (=> (not res!947425) (not e!797727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121238 (= res!947425 (validMask!0 mask!2840))))

(assert (=> start!121238 e!797727))

(assert (=> start!121238 true))

(declare-fun array_inv!35567 (array!96392) Bool)

(assert (=> start!121238 (array_inv!35567 a!2901)))

(declare-fun b!1409703 () Bool)

(declare-fun res!947426 () Bool)

(assert (=> b!1409703 (=> (not res!947426) (not e!797727))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409703 (= res!947426 (validKeyInArray!0 (select (arr!46539 a!2901) j!112)))))

(declare-fun b!1409704 () Bool)

(declare-fun res!947424 () Bool)

(assert (=> b!1409704 (=> (not res!947424) (not e!797727))))

(declare-datatypes ((List!33058 0))(
  ( (Nil!33055) (Cons!33054 (h!34317 (_ BitVec 64)) (t!47752 List!33058)) )
))
(declare-fun arrayNoDuplicates!0 (array!96392 (_ BitVec 32) List!33058) Bool)

(assert (=> b!1409704 (= res!947424 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33055))))

(declare-fun b!1409705 () Bool)

(declare-fun e!797729 () Bool)

(assert (=> b!1409705 (= e!797727 (not e!797729))))

(declare-fun res!947430 () Bool)

(assert (=> b!1409705 (=> res!947430 e!797729)))

(declare-datatypes ((SeekEntryResult!10850 0))(
  ( (MissingZero!10850 (index!45777 (_ BitVec 32))) (Found!10850 (index!45778 (_ BitVec 32))) (Intermediate!10850 (undefined!11662 Bool) (index!45779 (_ BitVec 32)) (x!127363 (_ BitVec 32))) (Undefined!10850) (MissingVacant!10850 (index!45780 (_ BitVec 32))) )
))
(declare-fun lt!620823 () SeekEntryResult!10850)

(get-info :version)

(assert (=> b!1409705 (= res!947430 (or (not ((_ is Intermediate!10850) lt!620823)) (undefined!11662 lt!620823)))))

(declare-fun e!797726 () Bool)

(assert (=> b!1409705 e!797726))

(declare-fun res!947429 () Bool)

(assert (=> b!1409705 (=> (not res!947429) (not e!797726))))

(assert (=> b!1409705 (= res!947429 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47674 0))(
  ( (Unit!47675) )
))
(declare-fun lt!620821 () Unit!47674)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47674)

(assert (=> b!1409705 (= lt!620821 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96392 (_ BitVec 32)) SeekEntryResult!10850)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409705 (= lt!620823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46539 a!2901) j!112) mask!2840) (select (arr!46539 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409706 () Bool)

(declare-fun res!947431 () Bool)

(assert (=> b!1409706 (=> (not res!947431) (not e!797727))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409706 (= res!947431 (validKeyInArray!0 (select (arr!46539 a!2901) i!1037)))))

(declare-fun b!1409707 () Bool)

(declare-fun res!947428 () Bool)

(assert (=> b!1409707 (=> (not res!947428) (not e!797727))))

(assert (=> b!1409707 (= res!947428 (and (= (size!47089 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47089 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47089 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409708 () Bool)

(declare-fun lt!620822 () SeekEntryResult!10850)

(assert (=> b!1409708 (= e!797729 (or (= lt!620823 lt!620822) (not ((_ is Intermediate!10850) lt!620822)) (and (bvsge (x!127363 lt!620823) #b00000000000000000000000000000000) (bvsle (x!127363 lt!620823) #b01111111111111111111111111111110))))))

(assert (=> b!1409708 (= lt!620822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96393 (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47089 a!2901)) mask!2840))))

(declare-fun b!1409709 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96392 (_ BitVec 32)) SeekEntryResult!10850)

(assert (=> b!1409709 (= e!797726 (= (seekEntryOrOpen!0 (select (arr!46539 a!2901) j!112) a!2901 mask!2840) (Found!10850 j!112)))))

(assert (= (and start!121238 res!947425) b!1409707))

(assert (= (and b!1409707 res!947428) b!1409706))

(assert (= (and b!1409706 res!947431) b!1409703))

(assert (= (and b!1409703 res!947426) b!1409702))

(assert (= (and b!1409702 res!947427) b!1409704))

(assert (= (and b!1409704 res!947424) b!1409705))

(assert (= (and b!1409705 res!947429) b!1409709))

(assert (= (and b!1409705 (not res!947430)) b!1409708))

(declare-fun m!1299529 () Bool)

(assert (=> b!1409703 m!1299529))

(assert (=> b!1409703 m!1299529))

(declare-fun m!1299531 () Bool)

(assert (=> b!1409703 m!1299531))

(declare-fun m!1299533 () Bool)

(assert (=> b!1409708 m!1299533))

(declare-fun m!1299535 () Bool)

(assert (=> b!1409708 m!1299535))

(assert (=> b!1409708 m!1299535))

(declare-fun m!1299537 () Bool)

(assert (=> b!1409708 m!1299537))

(assert (=> b!1409708 m!1299537))

(assert (=> b!1409708 m!1299535))

(declare-fun m!1299539 () Bool)

(assert (=> b!1409708 m!1299539))

(declare-fun m!1299541 () Bool)

(assert (=> start!121238 m!1299541))

(declare-fun m!1299543 () Bool)

(assert (=> start!121238 m!1299543))

(assert (=> b!1409709 m!1299529))

(assert (=> b!1409709 m!1299529))

(declare-fun m!1299545 () Bool)

(assert (=> b!1409709 m!1299545))

(declare-fun m!1299547 () Bool)

(assert (=> b!1409706 m!1299547))

(assert (=> b!1409706 m!1299547))

(declare-fun m!1299549 () Bool)

(assert (=> b!1409706 m!1299549))

(declare-fun m!1299551 () Bool)

(assert (=> b!1409704 m!1299551))

(declare-fun m!1299553 () Bool)

(assert (=> b!1409702 m!1299553))

(assert (=> b!1409705 m!1299529))

(declare-fun m!1299555 () Bool)

(assert (=> b!1409705 m!1299555))

(assert (=> b!1409705 m!1299529))

(declare-fun m!1299557 () Bool)

(assert (=> b!1409705 m!1299557))

(assert (=> b!1409705 m!1299555))

(assert (=> b!1409705 m!1299529))

(declare-fun m!1299559 () Bool)

(assert (=> b!1409705 m!1299559))

(declare-fun m!1299561 () Bool)

(assert (=> b!1409705 m!1299561))

(check-sat (not b!1409706) (not b!1409704) (not b!1409703) (not b!1409702) (not b!1409708) (not b!1409705) (not b!1409709) (not start!121238))
(check-sat)
(get-model)

(declare-fun d!151727 () Bool)

(assert (=> d!151727 (= (validKeyInArray!0 (select (arr!46539 a!2901) i!1037)) (and (not (= (select (arr!46539 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46539 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1409706 d!151727))

(declare-fun b!1409742 () Bool)

(declare-fun e!797748 () Bool)

(declare-fun e!797749 () Bool)

(assert (=> b!1409742 (= e!797748 e!797749)))

(declare-fun c!130608 () Bool)

(assert (=> b!1409742 (= c!130608 (validKeyInArray!0 (select (arr!46539 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67012 () Bool)

(declare-fun call!67015 () Bool)

(assert (=> bm!67012 (= call!67015 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151729 () Bool)

(declare-fun res!947460 () Bool)

(assert (=> d!151729 (=> res!947460 e!797748)))

(assert (=> d!151729 (= res!947460 (bvsge #b00000000000000000000000000000000 (size!47089 a!2901)))))

(assert (=> d!151729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!797748)))

(declare-fun b!1409743 () Bool)

(assert (=> b!1409743 (= e!797749 call!67015)))

(declare-fun b!1409744 () Bool)

(declare-fun e!797750 () Bool)

(assert (=> b!1409744 (= e!797749 e!797750)))

(declare-fun lt!620839 () (_ BitVec 64))

(assert (=> b!1409744 (= lt!620839 (select (arr!46539 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!620840 () Unit!47674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96392 (_ BitVec 64) (_ BitVec 32)) Unit!47674)

(assert (=> b!1409744 (= lt!620840 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620839 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1409744 (arrayContainsKey!0 a!2901 lt!620839 #b00000000000000000000000000000000)))

(declare-fun lt!620841 () Unit!47674)

(assert (=> b!1409744 (= lt!620841 lt!620840)))

(declare-fun res!947461 () Bool)

(assert (=> b!1409744 (= res!947461 (= (seekEntryOrOpen!0 (select (arr!46539 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10850 #b00000000000000000000000000000000)))))

(assert (=> b!1409744 (=> (not res!947461) (not e!797750))))

(declare-fun b!1409745 () Bool)

(assert (=> b!1409745 (= e!797750 call!67015)))

(assert (= (and d!151729 (not res!947460)) b!1409742))

(assert (= (and b!1409742 c!130608) b!1409744))

(assert (= (and b!1409742 (not c!130608)) b!1409743))

(assert (= (and b!1409744 res!947461) b!1409745))

(assert (= (or b!1409745 b!1409743) bm!67012))

(declare-fun m!1299597 () Bool)

(assert (=> b!1409742 m!1299597))

(assert (=> b!1409742 m!1299597))

(declare-fun m!1299599 () Bool)

(assert (=> b!1409742 m!1299599))

(declare-fun m!1299601 () Bool)

(assert (=> bm!67012 m!1299601))

(assert (=> b!1409744 m!1299597))

(declare-fun m!1299603 () Bool)

(assert (=> b!1409744 m!1299603))

(declare-fun m!1299605 () Bool)

(assert (=> b!1409744 m!1299605))

(assert (=> b!1409744 m!1299597))

(declare-fun m!1299607 () Bool)

(assert (=> b!1409744 m!1299607))

(assert (=> b!1409702 d!151729))

(declare-fun b!1409782 () Bool)

(declare-fun c!130623 () Bool)

(declare-fun lt!620867 () (_ BitVec 64))

(assert (=> b!1409782 (= c!130623 (= lt!620867 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797775 () SeekEntryResult!10850)

(declare-fun e!797777 () SeekEntryResult!10850)

(assert (=> b!1409782 (= e!797775 e!797777)))

(declare-fun d!151731 () Bool)

(declare-fun lt!620866 () SeekEntryResult!10850)

(assert (=> d!151731 (and (or ((_ is Undefined!10850) lt!620866) (not ((_ is Found!10850) lt!620866)) (and (bvsge (index!45778 lt!620866) #b00000000000000000000000000000000) (bvslt (index!45778 lt!620866) (size!47089 a!2901)))) (or ((_ is Undefined!10850) lt!620866) ((_ is Found!10850) lt!620866) (not ((_ is MissingZero!10850) lt!620866)) (and (bvsge (index!45777 lt!620866) #b00000000000000000000000000000000) (bvslt (index!45777 lt!620866) (size!47089 a!2901)))) (or ((_ is Undefined!10850) lt!620866) ((_ is Found!10850) lt!620866) ((_ is MissingZero!10850) lt!620866) (not ((_ is MissingVacant!10850) lt!620866)) (and (bvsge (index!45780 lt!620866) #b00000000000000000000000000000000) (bvslt (index!45780 lt!620866) (size!47089 a!2901)))) (or ((_ is Undefined!10850) lt!620866) (ite ((_ is Found!10850) lt!620866) (= (select (arr!46539 a!2901) (index!45778 lt!620866)) (select (arr!46539 a!2901) j!112)) (ite ((_ is MissingZero!10850) lt!620866) (= (select (arr!46539 a!2901) (index!45777 lt!620866)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10850) lt!620866) (= (select (arr!46539 a!2901) (index!45780 lt!620866)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!797776 () SeekEntryResult!10850)

(assert (=> d!151731 (= lt!620866 e!797776)))

(declare-fun c!130621 () Bool)

(declare-fun lt!620868 () SeekEntryResult!10850)

(assert (=> d!151731 (= c!130621 (and ((_ is Intermediate!10850) lt!620868) (undefined!11662 lt!620868)))))

(assert (=> d!151731 (= lt!620868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46539 a!2901) j!112) mask!2840) (select (arr!46539 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151731 (validMask!0 mask!2840)))

(assert (=> d!151731 (= (seekEntryOrOpen!0 (select (arr!46539 a!2901) j!112) a!2901 mask!2840) lt!620866)))

(declare-fun b!1409783 () Bool)

(assert (=> b!1409783 (= e!797776 e!797775)))

(assert (=> b!1409783 (= lt!620867 (select (arr!46539 a!2901) (index!45779 lt!620868)))))

(declare-fun c!130622 () Bool)

(assert (=> b!1409783 (= c!130622 (= lt!620867 (select (arr!46539 a!2901) j!112)))))

(declare-fun b!1409784 () Bool)

(assert (=> b!1409784 (= e!797775 (Found!10850 (index!45779 lt!620868)))))

(declare-fun b!1409785 () Bool)

(assert (=> b!1409785 (= e!797777 (MissingZero!10850 (index!45779 lt!620868)))))

(declare-fun b!1409786 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96392 (_ BitVec 32)) SeekEntryResult!10850)

(assert (=> b!1409786 (= e!797777 (seekKeyOrZeroReturnVacant!0 (x!127363 lt!620868) (index!45779 lt!620868) (index!45779 lt!620868) (select (arr!46539 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409787 () Bool)

(assert (=> b!1409787 (= e!797776 Undefined!10850)))

(assert (= (and d!151731 c!130621) b!1409787))

(assert (= (and d!151731 (not c!130621)) b!1409783))

(assert (= (and b!1409783 c!130622) b!1409784))

(assert (= (and b!1409783 (not c!130622)) b!1409782))

(assert (= (and b!1409782 c!130623) b!1409785))

(assert (= (and b!1409782 (not c!130623)) b!1409786))

(assert (=> d!151731 m!1299529))

(assert (=> d!151731 m!1299555))

(assert (=> d!151731 m!1299555))

(assert (=> d!151731 m!1299529))

(assert (=> d!151731 m!1299559))

(declare-fun m!1299621 () Bool)

(assert (=> d!151731 m!1299621))

(declare-fun m!1299623 () Bool)

(assert (=> d!151731 m!1299623))

(declare-fun m!1299625 () Bool)

(assert (=> d!151731 m!1299625))

(assert (=> d!151731 m!1299541))

(declare-fun m!1299627 () Bool)

(assert (=> b!1409783 m!1299627))

(assert (=> b!1409786 m!1299529))

(declare-fun m!1299629 () Bool)

(assert (=> b!1409786 m!1299629))

(assert (=> b!1409709 d!151731))

(declare-fun d!151741 () Bool)

(assert (=> d!151741 (= (validKeyInArray!0 (select (arr!46539 a!2901) j!112)) (and (not (= (select (arr!46539 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46539 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1409703 d!151741))

(declare-fun d!151743 () Bool)

(declare-fun e!797808 () Bool)

(assert (=> d!151743 e!797808))

(declare-fun c!130643 () Bool)

(declare-fun lt!620887 () SeekEntryResult!10850)

(assert (=> d!151743 (= c!130643 (and ((_ is Intermediate!10850) lt!620887) (undefined!11662 lt!620887)))))

(declare-fun e!797810 () SeekEntryResult!10850)

(assert (=> d!151743 (= lt!620887 e!797810)))

(declare-fun c!130644 () Bool)

(assert (=> d!151743 (= c!130644 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620888 () (_ BitVec 64))

(assert (=> d!151743 (= lt!620888 (select (arr!46539 (array!96393 (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47089 a!2901))) (toIndex!0 (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151743 (validMask!0 mask!2840)))

(assert (=> d!151743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96393 (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47089 a!2901)) mask!2840) lt!620887)))

(declare-fun b!1409842 () Bool)

(assert (=> b!1409842 (and (bvsge (index!45779 lt!620887) #b00000000000000000000000000000000) (bvslt (index!45779 lt!620887) (size!47089 (array!96393 (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47089 a!2901)))))))

(declare-fun e!797809 () Bool)

(assert (=> b!1409842 (= e!797809 (= (select (arr!46539 (array!96393 (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47089 a!2901))) (index!45779 lt!620887)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1409843 () Bool)

(assert (=> b!1409843 (and (bvsge (index!45779 lt!620887) #b00000000000000000000000000000000) (bvslt (index!45779 lt!620887) (size!47089 (array!96393 (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47089 a!2901)))))))

(declare-fun res!947492 () Bool)

(assert (=> b!1409843 (= res!947492 (= (select (arr!46539 (array!96393 (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47089 a!2901))) (index!45779 lt!620887)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1409843 (=> res!947492 e!797809)))

(declare-fun b!1409844 () Bool)

(assert (=> b!1409844 (and (bvsge (index!45779 lt!620887) #b00000000000000000000000000000000) (bvslt (index!45779 lt!620887) (size!47089 (array!96393 (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47089 a!2901)))))))

(declare-fun res!947494 () Bool)

(assert (=> b!1409844 (= res!947494 (= (select (arr!46539 (array!96393 (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47089 a!2901))) (index!45779 lt!620887)) (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1409844 (=> res!947494 e!797809)))

(declare-fun e!797812 () Bool)

(assert (=> b!1409844 (= e!797812 e!797809)))

(declare-fun b!1409845 () Bool)

(assert (=> b!1409845 (= e!797808 (bvsge (x!127363 lt!620887) #b01111111111111111111111111111110))))

(declare-fun e!797811 () SeekEntryResult!10850)

(declare-fun b!1409846 () Bool)

(assert (=> b!1409846 (= e!797811 (Intermediate!10850 false (toIndex!0 (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409847 () Bool)

(assert (=> b!1409847 (= e!797808 e!797812)))

(declare-fun res!947493 () Bool)

(assert (=> b!1409847 (= res!947493 (and ((_ is Intermediate!10850) lt!620887) (not (undefined!11662 lt!620887)) (bvslt (x!127363 lt!620887) #b01111111111111111111111111111110) (bvsge (x!127363 lt!620887) #b00000000000000000000000000000000) (bvsge (x!127363 lt!620887) #b00000000000000000000000000000000)))))

(assert (=> b!1409847 (=> (not res!947493) (not e!797812))))

(declare-fun b!1409848 () Bool)

(assert (=> b!1409848 (= e!797810 e!797811)))

(declare-fun c!130642 () Bool)

(assert (=> b!1409848 (= c!130642 (or (= lt!620888 (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!620888 lt!620888) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1409849 () Bool)

(assert (=> b!1409849 (= e!797810 (Intermediate!10850 true (toIndex!0 (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409850 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409850 (= e!797811 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96393 (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47089 a!2901)) mask!2840))))

(assert (= (and d!151743 c!130644) b!1409849))

(assert (= (and d!151743 (not c!130644)) b!1409848))

(assert (= (and b!1409848 c!130642) b!1409846))

(assert (= (and b!1409848 (not c!130642)) b!1409850))

(assert (= (and d!151743 c!130643) b!1409845))

(assert (= (and d!151743 (not c!130643)) b!1409847))

(assert (= (and b!1409847 res!947493) b!1409844))

(assert (= (and b!1409844 (not res!947494)) b!1409843))

(assert (= (and b!1409843 (not res!947492)) b!1409842))

(assert (=> b!1409850 m!1299537))

(declare-fun m!1299635 () Bool)

(assert (=> b!1409850 m!1299635))

(assert (=> b!1409850 m!1299635))

(assert (=> b!1409850 m!1299535))

(declare-fun m!1299637 () Bool)

(assert (=> b!1409850 m!1299637))

(declare-fun m!1299639 () Bool)

(assert (=> b!1409843 m!1299639))

(assert (=> d!151743 m!1299537))

(declare-fun m!1299641 () Bool)

(assert (=> d!151743 m!1299641))

(assert (=> d!151743 m!1299541))

(assert (=> b!1409844 m!1299639))

(assert (=> b!1409842 m!1299639))

(assert (=> b!1409708 d!151743))

(declare-fun d!151749 () Bool)

(declare-fun lt!620906 () (_ BitVec 32))

(declare-fun lt!620905 () (_ BitVec 32))

(assert (=> d!151749 (= lt!620906 (bvmul (bvxor lt!620905 (bvlshr lt!620905 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151749 (= lt!620905 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151749 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947501 (let ((h!34319 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127368 (bvmul (bvxor h!34319 (bvlshr h!34319 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127368 (bvlshr x!127368 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947501 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947501 #b00000000000000000000000000000000))))))

(assert (=> d!151749 (= (toIndex!0 (select (store (arr!46539 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!620906 (bvlshr lt!620906 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1409708 d!151749))

(declare-fun b!1409869 () Bool)

(declare-fun e!797823 () Bool)

(declare-fun e!797824 () Bool)

(assert (=> b!1409869 (= e!797823 e!797824)))

(declare-fun c!130651 () Bool)

(assert (=> b!1409869 (= c!130651 (validKeyInArray!0 (select (arr!46539 a!2901) j!112)))))

(declare-fun call!67022 () Bool)

(declare-fun bm!67019 () Bool)

(assert (=> bm!67019 (= call!67022 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151755 () Bool)

(declare-fun res!947504 () Bool)

(assert (=> d!151755 (=> res!947504 e!797823)))

(assert (=> d!151755 (= res!947504 (bvsge j!112 (size!47089 a!2901)))))

(assert (=> d!151755 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!797823)))

(declare-fun b!1409870 () Bool)

(assert (=> b!1409870 (= e!797824 call!67022)))

(declare-fun b!1409871 () Bool)

(declare-fun e!797825 () Bool)

(assert (=> b!1409871 (= e!797824 e!797825)))

(declare-fun lt!620907 () (_ BitVec 64))

(assert (=> b!1409871 (= lt!620907 (select (arr!46539 a!2901) j!112))))

(declare-fun lt!620908 () Unit!47674)

(assert (=> b!1409871 (= lt!620908 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620907 j!112))))

(assert (=> b!1409871 (arrayContainsKey!0 a!2901 lt!620907 #b00000000000000000000000000000000)))

(declare-fun lt!620909 () Unit!47674)

(assert (=> b!1409871 (= lt!620909 lt!620908)))

(declare-fun res!947505 () Bool)

(assert (=> b!1409871 (= res!947505 (= (seekEntryOrOpen!0 (select (arr!46539 a!2901) j!112) a!2901 mask!2840) (Found!10850 j!112)))))

(assert (=> b!1409871 (=> (not res!947505) (not e!797825))))

(declare-fun b!1409872 () Bool)

(assert (=> b!1409872 (= e!797825 call!67022)))

(assert (= (and d!151755 (not res!947504)) b!1409869))

(assert (= (and b!1409869 c!130651) b!1409871))

(assert (= (and b!1409869 (not c!130651)) b!1409870))

(assert (= (and b!1409871 res!947505) b!1409872))

(assert (= (or b!1409872 b!1409870) bm!67019))

(assert (=> b!1409869 m!1299529))

(assert (=> b!1409869 m!1299529))

(assert (=> b!1409869 m!1299531))

(declare-fun m!1299659 () Bool)

(assert (=> bm!67019 m!1299659))

(assert (=> b!1409871 m!1299529))

(declare-fun m!1299661 () Bool)

(assert (=> b!1409871 m!1299661))

(declare-fun m!1299663 () Bool)

(assert (=> b!1409871 m!1299663))

(assert (=> b!1409871 m!1299529))

(assert (=> b!1409871 m!1299545))

(assert (=> b!1409705 d!151755))

(declare-fun d!151761 () Bool)

(assert (=> d!151761 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620919 () Unit!47674)

(declare-fun choose!38 (array!96392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47674)

(assert (=> d!151761 (= lt!620919 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151761 (validMask!0 mask!2840)))

(assert (=> d!151761 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!620919)))

(declare-fun bs!41107 () Bool)

(assert (= bs!41107 d!151761))

(assert (=> bs!41107 m!1299561))

(declare-fun m!1299677 () Bool)

(assert (=> bs!41107 m!1299677))

(assert (=> bs!41107 m!1299541))

(assert (=> b!1409705 d!151761))

(declare-fun d!151765 () Bool)

(declare-fun e!797837 () Bool)

(assert (=> d!151765 e!797837))

(declare-fun c!130656 () Bool)

(declare-fun lt!620920 () SeekEntryResult!10850)

(assert (=> d!151765 (= c!130656 (and ((_ is Intermediate!10850) lt!620920) (undefined!11662 lt!620920)))))

(declare-fun e!797839 () SeekEntryResult!10850)

(assert (=> d!151765 (= lt!620920 e!797839)))

(declare-fun c!130657 () Bool)

(assert (=> d!151765 (= c!130657 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620921 () (_ BitVec 64))

(assert (=> d!151765 (= lt!620921 (select (arr!46539 a!2901) (toIndex!0 (select (arr!46539 a!2901) j!112) mask!2840)))))

(assert (=> d!151765 (validMask!0 mask!2840)))

(assert (=> d!151765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46539 a!2901) j!112) mask!2840) (select (arr!46539 a!2901) j!112) a!2901 mask!2840) lt!620920)))

(declare-fun b!1409887 () Bool)

(assert (=> b!1409887 (and (bvsge (index!45779 lt!620920) #b00000000000000000000000000000000) (bvslt (index!45779 lt!620920) (size!47089 a!2901)))))

(declare-fun e!797838 () Bool)

(assert (=> b!1409887 (= e!797838 (= (select (arr!46539 a!2901) (index!45779 lt!620920)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1409888 () Bool)

(assert (=> b!1409888 (and (bvsge (index!45779 lt!620920) #b00000000000000000000000000000000) (bvslt (index!45779 lt!620920) (size!47089 a!2901)))))

(declare-fun res!947514 () Bool)

(assert (=> b!1409888 (= res!947514 (= (select (arr!46539 a!2901) (index!45779 lt!620920)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1409888 (=> res!947514 e!797838)))

(declare-fun b!1409889 () Bool)

(assert (=> b!1409889 (and (bvsge (index!45779 lt!620920) #b00000000000000000000000000000000) (bvslt (index!45779 lt!620920) (size!47089 a!2901)))))

(declare-fun res!947516 () Bool)

(assert (=> b!1409889 (= res!947516 (= (select (arr!46539 a!2901) (index!45779 lt!620920)) (select (arr!46539 a!2901) j!112)))))

(assert (=> b!1409889 (=> res!947516 e!797838)))

(declare-fun e!797841 () Bool)

(assert (=> b!1409889 (= e!797841 e!797838)))

(declare-fun b!1409890 () Bool)

(assert (=> b!1409890 (= e!797837 (bvsge (x!127363 lt!620920) #b01111111111111111111111111111110))))

(declare-fun e!797840 () SeekEntryResult!10850)

(declare-fun b!1409891 () Bool)

(assert (=> b!1409891 (= e!797840 (Intermediate!10850 false (toIndex!0 (select (arr!46539 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409892 () Bool)

(assert (=> b!1409892 (= e!797837 e!797841)))

(declare-fun res!947515 () Bool)

(assert (=> b!1409892 (= res!947515 (and ((_ is Intermediate!10850) lt!620920) (not (undefined!11662 lt!620920)) (bvslt (x!127363 lt!620920) #b01111111111111111111111111111110) (bvsge (x!127363 lt!620920) #b00000000000000000000000000000000) (bvsge (x!127363 lt!620920) #b00000000000000000000000000000000)))))

(assert (=> b!1409892 (=> (not res!947515) (not e!797841))))

(declare-fun b!1409893 () Bool)

(assert (=> b!1409893 (= e!797839 e!797840)))

(declare-fun c!130655 () Bool)

(assert (=> b!1409893 (= c!130655 (or (= lt!620921 (select (arr!46539 a!2901) j!112)) (= (bvadd lt!620921 lt!620921) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1409894 () Bool)

(assert (=> b!1409894 (= e!797839 (Intermediate!10850 true (toIndex!0 (select (arr!46539 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409895 () Bool)

(assert (=> b!1409895 (= e!797840 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46539 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46539 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!151765 c!130657) b!1409894))

(assert (= (and d!151765 (not c!130657)) b!1409893))

(assert (= (and b!1409893 c!130655) b!1409891))

(assert (= (and b!1409893 (not c!130655)) b!1409895))

(assert (= (and d!151765 c!130656) b!1409890))

(assert (= (and d!151765 (not c!130656)) b!1409892))

(assert (= (and b!1409892 res!947515) b!1409889))

(assert (= (and b!1409889 (not res!947516)) b!1409888))

(assert (= (and b!1409888 (not res!947514)) b!1409887))

(assert (=> b!1409895 m!1299555))

(declare-fun m!1299679 () Bool)

(assert (=> b!1409895 m!1299679))

(assert (=> b!1409895 m!1299679))

(assert (=> b!1409895 m!1299529))

(declare-fun m!1299681 () Bool)

(assert (=> b!1409895 m!1299681))

(declare-fun m!1299683 () Bool)

(assert (=> b!1409888 m!1299683))

(assert (=> d!151765 m!1299555))

(declare-fun m!1299685 () Bool)

(assert (=> d!151765 m!1299685))

(assert (=> d!151765 m!1299541))

(assert (=> b!1409889 m!1299683))

(assert (=> b!1409887 m!1299683))

(assert (=> b!1409705 d!151765))

(declare-fun d!151767 () Bool)

(declare-fun lt!620923 () (_ BitVec 32))

(declare-fun lt!620922 () (_ BitVec 32))

(assert (=> d!151767 (= lt!620923 (bvmul (bvxor lt!620922 (bvlshr lt!620922 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151767 (= lt!620922 ((_ extract 31 0) (bvand (bvxor (select (arr!46539 a!2901) j!112) (bvlshr (select (arr!46539 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151767 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947501 (let ((h!34319 ((_ extract 31 0) (bvand (bvxor (select (arr!46539 a!2901) j!112) (bvlshr (select (arr!46539 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127368 (bvmul (bvxor h!34319 (bvlshr h!34319 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127368 (bvlshr x!127368 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947501 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947501 #b00000000000000000000000000000000))))))

(assert (=> d!151767 (= (toIndex!0 (select (arr!46539 a!2901) j!112) mask!2840) (bvand (bvxor lt!620923 (bvlshr lt!620923 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1409705 d!151767))

(declare-fun d!151769 () Bool)

(assert (=> d!151769 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121238 d!151769))

(declare-fun d!151777 () Bool)

(assert (=> d!151777 (= (array_inv!35567 a!2901) (bvsge (size!47089 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121238 d!151777))

(declare-fun d!151779 () Bool)

(declare-fun res!947536 () Bool)

(declare-fun e!797878 () Bool)

(assert (=> d!151779 (=> res!947536 e!797878)))

(assert (=> d!151779 (= res!947536 (bvsge #b00000000000000000000000000000000 (size!47089 a!2901)))))

(assert (=> d!151779 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33055) e!797878)))

(declare-fun b!1409951 () Bool)

(declare-fun e!797879 () Bool)

(assert (=> b!1409951 (= e!797878 e!797879)))

(declare-fun res!947534 () Bool)

(assert (=> b!1409951 (=> (not res!947534) (not e!797879))))

(declare-fun e!797876 () Bool)

(assert (=> b!1409951 (= res!947534 (not e!797876))))

(declare-fun res!947535 () Bool)

(assert (=> b!1409951 (=> (not res!947535) (not e!797876))))

(assert (=> b!1409951 (= res!947535 (validKeyInArray!0 (select (arr!46539 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1409952 () Bool)

(declare-fun e!797877 () Bool)

(assert (=> b!1409952 (= e!797879 e!797877)))

(declare-fun c!130677 () Bool)

(assert (=> b!1409952 (= c!130677 (validKeyInArray!0 (select (arr!46539 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1409953 () Bool)

(declare-fun call!67030 () Bool)

(assert (=> b!1409953 (= e!797877 call!67030)))

(declare-fun bm!67027 () Bool)

(assert (=> bm!67027 (= call!67030 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130677 (Cons!33054 (select (arr!46539 a!2901) #b00000000000000000000000000000000) Nil!33055) Nil!33055)))))

(declare-fun b!1409954 () Bool)

(assert (=> b!1409954 (= e!797877 call!67030)))

(declare-fun b!1409955 () Bool)

(declare-fun contains!9804 (List!33058 (_ BitVec 64)) Bool)

(assert (=> b!1409955 (= e!797876 (contains!9804 Nil!33055 (select (arr!46539 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151779 (not res!947536)) b!1409951))

(assert (= (and b!1409951 res!947535) b!1409955))

(assert (= (and b!1409951 res!947534) b!1409952))

(assert (= (and b!1409952 c!130677) b!1409954))

(assert (= (and b!1409952 (not c!130677)) b!1409953))

(assert (= (or b!1409954 b!1409953) bm!67027))

(assert (=> b!1409951 m!1299597))

(assert (=> b!1409951 m!1299597))

(assert (=> b!1409951 m!1299599))

(assert (=> b!1409952 m!1299597))

(assert (=> b!1409952 m!1299597))

(assert (=> b!1409952 m!1299599))

(assert (=> bm!67027 m!1299597))

(declare-fun m!1299727 () Bool)

(assert (=> bm!67027 m!1299727))

(assert (=> b!1409955 m!1299597))

(assert (=> b!1409955 m!1299597))

(declare-fun m!1299731 () Bool)

(assert (=> b!1409955 m!1299731))

(assert (=> b!1409704 d!151779))

(check-sat (not d!151765) (not d!151761) (not b!1409951) (not bm!67012) (not bm!67019) (not bm!67027) (not d!151731) (not b!1409869) (not d!151743) (not b!1409744) (not b!1409786) (not b!1409955) (not b!1409952) (not b!1409895) (not b!1409871) (not b!1409742) (not b!1409850))
(check-sat)
