; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116356 () Bool)

(assert start!116356)

(declare-fun b!1373396 () Bool)

(declare-fun res!916646 () Bool)

(declare-fun e!777961 () Bool)

(assert (=> b!1373396 (=> (not res!916646) (not e!777961))))

(declare-datatypes ((array!93134 0))(
  ( (array!93135 (arr!44976 (Array (_ BitVec 32) (_ BitVec 64))) (size!45526 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93134)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373396 (= res!916646 (not (validKeyInArray!0 (select (arr!44976 a!3861) from!3239))))))

(declare-fun b!1373397 () Bool)

(declare-fun e!777959 () Bool)

(assert (=> b!1373397 (= e!777959 e!777961)))

(declare-fun res!916641 () Bool)

(assert (=> b!1373397 (=> (not res!916641) (not e!777961))))

(declare-datatypes ((List!32044 0))(
  ( (Nil!32041) (Cons!32040 (h!33249 (_ BitVec 64)) (t!46738 List!32044)) )
))
(declare-fun acc!866 () List!32044)

(declare-fun arrayNoDuplicates!0 (array!93134 (_ BitVec 32) List!32044) Bool)

(assert (=> b!1373397 (= res!916641 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45389 0))(
  ( (Unit!45390) )
))
(declare-fun lt!603046 () Unit!45389)

(declare-fun newAcc!98 () List!32044)

(declare-fun noDuplicateSubseq!315 (List!32044 List!32044) Unit!45389)

(assert (=> b!1373397 (= lt!603046 (noDuplicateSubseq!315 newAcc!98 acc!866))))

(declare-fun b!1373398 () Bool)

(declare-fun res!916645 () Bool)

(assert (=> b!1373398 (=> (not res!916645) (not e!777961))))

(assert (=> b!1373398 (= res!916645 (bvslt from!3239 (size!45526 a!3861)))))

(declare-fun res!916642 () Bool)

(assert (=> start!116356 (=> (not res!916642) (not e!777959))))

(assert (=> start!116356 (= res!916642 (and (bvslt (size!45526 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45526 a!3861))))))

(assert (=> start!116356 e!777959))

(declare-fun array_inv!34004 (array!93134) Bool)

(assert (=> start!116356 (array_inv!34004 a!3861)))

(assert (=> start!116356 true))

(declare-fun b!1373399 () Bool)

(declare-fun res!916643 () Bool)

(assert (=> b!1373399 (=> (not res!916643) (not e!777961))))

(assert (=> b!1373399 (= res!916643 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1373400 () Bool)

(declare-fun res!916640 () Bool)

(assert (=> b!1373400 (=> (not res!916640) (not e!777959))))

(declare-fun contains!9726 (List!32044 (_ BitVec 64)) Bool)

(assert (=> b!1373400 (= res!916640 (not (contains!9726 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373401 () Bool)

(declare-fun res!916644 () Bool)

(assert (=> b!1373401 (=> (not res!916644) (not e!777959))))

(assert (=> b!1373401 (= res!916644 (not (contains!9726 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373402 () Bool)

(declare-fun res!916650 () Bool)

(assert (=> b!1373402 (=> (not res!916650) (not e!777959))))

(assert (=> b!1373402 (= res!916650 (not (contains!9726 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373403 () Bool)

(declare-fun res!916651 () Bool)

(assert (=> b!1373403 (=> (not res!916651) (not e!777961))))

(assert (=> b!1373403 (= res!916651 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1373404 () Bool)

(declare-fun res!916649 () Bool)

(assert (=> b!1373404 (=> (not res!916649) (not e!777959))))

(declare-fun noDuplicate!2583 (List!32044) Bool)

(assert (=> b!1373404 (= res!916649 (noDuplicate!2583 acc!866))))

(declare-fun b!1373405 () Bool)

(declare-fun res!916648 () Bool)

(assert (=> b!1373405 (=> (not res!916648) (not e!777959))))

(declare-fun subseq!1128 (List!32044 List!32044) Bool)

(assert (=> b!1373405 (= res!916648 (subseq!1128 newAcc!98 acc!866))))

(declare-fun b!1373406 () Bool)

(assert (=> b!1373406 (= e!777961 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(assert (=> b!1373406 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!603045 () Unit!45389)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!93134 List!32044 List!32044 (_ BitVec 32)) Unit!45389)

(assert (=> b!1373406 (= lt!603045 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1373407 () Bool)

(declare-fun res!916647 () Bool)

(assert (=> b!1373407 (=> (not res!916647) (not e!777959))))

(assert (=> b!1373407 (= res!916647 (not (contains!9726 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116356 res!916642) b!1373404))

(assert (= (and b!1373404 res!916649) b!1373407))

(assert (= (and b!1373407 res!916647) b!1373400))

(assert (= (and b!1373400 res!916640) b!1373401))

(assert (= (and b!1373401 res!916644) b!1373402))

(assert (= (and b!1373402 res!916650) b!1373405))

(assert (= (and b!1373405 res!916648) b!1373397))

(assert (= (and b!1373397 res!916641) b!1373398))

(assert (= (and b!1373398 res!916645) b!1373396))

(assert (= (and b!1373396 res!916646) b!1373403))

(assert (= (and b!1373403 res!916651) b!1373399))

(assert (= (and b!1373399 res!916643) b!1373406))

(declare-fun m!1256647 () Bool)

(assert (=> b!1373404 m!1256647))

(declare-fun m!1256649 () Bool)

(assert (=> b!1373402 m!1256649))

(declare-fun m!1256651 () Bool)

(assert (=> start!116356 m!1256651))

(declare-fun m!1256653 () Bool)

(assert (=> b!1373406 m!1256653))

(declare-fun m!1256655 () Bool)

(assert (=> b!1373406 m!1256655))

(declare-fun m!1256657 () Bool)

(assert (=> b!1373406 m!1256657))

(declare-fun m!1256659 () Bool)

(assert (=> b!1373405 m!1256659))

(declare-fun m!1256661 () Bool)

(assert (=> b!1373397 m!1256661))

(declare-fun m!1256663 () Bool)

(assert (=> b!1373397 m!1256663))

(declare-fun m!1256665 () Bool)

(assert (=> b!1373396 m!1256665))

(assert (=> b!1373396 m!1256665))

(declare-fun m!1256667 () Bool)

(assert (=> b!1373396 m!1256667))

(declare-fun m!1256669 () Bool)

(assert (=> b!1373401 m!1256669))

(declare-fun m!1256671 () Bool)

(assert (=> b!1373400 m!1256671))

(declare-fun m!1256673 () Bool)

(assert (=> b!1373407 m!1256673))

(declare-fun m!1256675 () Bool)

(assert (=> b!1373399 m!1256675))

(check-sat (not b!1373399) (not b!1373401) (not b!1373405) (not b!1373396) (not b!1373400) (not b!1373406) (not start!116356) (not b!1373397) (not b!1373407) (not b!1373404) (not b!1373402))
(check-sat)
(get-model)

(declare-fun b!1373460 () Bool)

(declare-fun e!777987 () Bool)

(assert (=> b!1373460 (= e!777987 (contains!9726 acc!866 (select (arr!44976 a!3861) from!3239)))))

(declare-fun b!1373461 () Bool)

(declare-fun e!777986 () Bool)

(declare-fun e!777985 () Bool)

(assert (=> b!1373461 (= e!777986 e!777985)))

(declare-fun c!127820 () Bool)

(assert (=> b!1373461 (= c!127820 (validKeyInArray!0 (select (arr!44976 a!3861) from!3239)))))

(declare-fun bm!65612 () Bool)

(declare-fun call!65615 () Bool)

(assert (=> bm!65612 (= call!65615 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127820 (Cons!32040 (select (arr!44976 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1373462 () Bool)

(assert (=> b!1373462 (= e!777985 call!65615)))

(declare-fun d!147955 () Bool)

(declare-fun res!916702 () Bool)

(declare-fun e!777988 () Bool)

(assert (=> d!147955 (=> res!916702 e!777988)))

(assert (=> d!147955 (= res!916702 (bvsge from!3239 (size!45526 a!3861)))))

(assert (=> d!147955 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!777988)))

(declare-fun b!1373463 () Bool)

(assert (=> b!1373463 (= e!777988 e!777986)))

(declare-fun res!916701 () Bool)

(assert (=> b!1373463 (=> (not res!916701) (not e!777986))))

(assert (=> b!1373463 (= res!916701 (not e!777987))))

(declare-fun res!916700 () Bool)

(assert (=> b!1373463 (=> (not res!916700) (not e!777987))))

(assert (=> b!1373463 (= res!916700 (validKeyInArray!0 (select (arr!44976 a!3861) from!3239)))))

(declare-fun b!1373464 () Bool)

(assert (=> b!1373464 (= e!777985 call!65615)))

(assert (= (and d!147955 (not res!916702)) b!1373463))

(assert (= (and b!1373463 res!916700) b!1373460))

(assert (= (and b!1373463 res!916701) b!1373461))

(assert (= (and b!1373461 c!127820) b!1373464))

(assert (= (and b!1373461 (not c!127820)) b!1373462))

(assert (= (or b!1373464 b!1373462) bm!65612))

(assert (=> b!1373460 m!1256665))

(assert (=> b!1373460 m!1256665))

(declare-fun m!1256713 () Bool)

(assert (=> b!1373460 m!1256713))

(assert (=> b!1373461 m!1256665))

(assert (=> b!1373461 m!1256665))

(assert (=> b!1373461 m!1256667))

(assert (=> bm!65612 m!1256665))

(declare-fun m!1256715 () Bool)

(assert (=> bm!65612 m!1256715))

(assert (=> b!1373463 m!1256665))

(assert (=> b!1373463 m!1256665))

(assert (=> b!1373463 m!1256667))

(assert (=> b!1373397 d!147955))

(declare-fun d!147961 () Bool)

(assert (=> d!147961 (noDuplicate!2583 newAcc!98)))

(declare-fun lt!603060 () Unit!45389)

(declare-fun choose!2024 (List!32044 List!32044) Unit!45389)

(assert (=> d!147961 (= lt!603060 (choose!2024 newAcc!98 acc!866))))

(declare-fun e!778001 () Bool)

(assert (=> d!147961 e!778001))

(declare-fun res!916715 () Bool)

(assert (=> d!147961 (=> (not res!916715) (not e!778001))))

(assert (=> d!147961 (= res!916715 (subseq!1128 newAcc!98 acc!866))))

(assert (=> d!147961 (= (noDuplicateSubseq!315 newAcc!98 acc!866) lt!603060)))

(declare-fun b!1373477 () Bool)

(assert (=> b!1373477 (= e!778001 (noDuplicate!2583 acc!866))))

(assert (= (and d!147961 res!916715) b!1373477))

(declare-fun m!1256721 () Bool)

(assert (=> d!147961 m!1256721))

(declare-fun m!1256723 () Bool)

(assert (=> d!147961 m!1256723))

(assert (=> d!147961 m!1256659))

(assert (=> b!1373477 m!1256647))

(assert (=> b!1373397 d!147961))

(declare-fun d!147969 () Bool)

(declare-fun lt!603068 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!752 (List!32044) (InoxSet (_ BitVec 64)))

(assert (=> d!147969 (= lt!603068 (select (content!752 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778016 () Bool)

(assert (=> d!147969 (= lt!603068 e!778016)))

(declare-fun res!916731 () Bool)

(assert (=> d!147969 (=> (not res!916731) (not e!778016))))

(get-info :version)

(assert (=> d!147969 (= res!916731 ((_ is Cons!32040) newAcc!98))))

(assert (=> d!147969 (= (contains!9726 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603068)))

(declare-fun b!1373492 () Bool)

(declare-fun e!778017 () Bool)

(assert (=> b!1373492 (= e!778016 e!778017)))

(declare-fun res!916730 () Bool)

(assert (=> b!1373492 (=> res!916730 e!778017)))

(assert (=> b!1373492 (= res!916730 (= (h!33249 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373493 () Bool)

(assert (=> b!1373493 (= e!778017 (contains!9726 (t!46738 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147969 res!916731) b!1373492))

(assert (= (and b!1373492 (not res!916730)) b!1373493))

(declare-fun m!1256751 () Bool)

(assert (=> d!147969 m!1256751))

(declare-fun m!1256753 () Bool)

(assert (=> d!147969 m!1256753))

(declare-fun m!1256755 () Bool)

(assert (=> b!1373493 m!1256755))

(assert (=> b!1373402 d!147969))

(declare-fun d!147985 () Bool)

(declare-fun lt!603069 () Bool)

(assert (=> d!147985 (= lt!603069 (select (content!752 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778020 () Bool)

(assert (=> d!147985 (= lt!603069 e!778020)))

(declare-fun res!916735 () Bool)

(assert (=> d!147985 (=> (not res!916735) (not e!778020))))

(assert (=> d!147985 (= res!916735 ((_ is Cons!32040) acc!866))))

(assert (=> d!147985 (= (contains!9726 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603069)))

(declare-fun b!1373494 () Bool)

(declare-fun e!778021 () Bool)

(assert (=> b!1373494 (= e!778020 e!778021)))

(declare-fun res!916734 () Bool)

(assert (=> b!1373494 (=> res!916734 e!778021)))

(assert (=> b!1373494 (= res!916734 (= (h!33249 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373495 () Bool)

(assert (=> b!1373495 (= e!778021 (contains!9726 (t!46738 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147985 res!916735) b!1373494))

(assert (= (and b!1373494 (not res!916734)) b!1373495))

(declare-fun m!1256757 () Bool)

(assert (=> d!147985 m!1256757))

(declare-fun m!1256759 () Bool)

(assert (=> d!147985 m!1256759))

(declare-fun m!1256761 () Bool)

(assert (=> b!1373495 m!1256761))

(assert (=> b!1373407 d!147985))

(declare-fun d!147987 () Bool)

(assert (=> d!147987 (= (validKeyInArray!0 (select (arr!44976 a!3861) from!3239)) (and (not (= (select (arr!44976 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44976 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1373396 d!147987))

(declare-fun d!147989 () Bool)

(declare-fun lt!603070 () Bool)

(assert (=> d!147989 (= lt!603070 (select (content!752 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778028 () Bool)

(assert (=> d!147989 (= lt!603070 e!778028)))

(declare-fun res!916741 () Bool)

(assert (=> d!147989 (=> (not res!916741) (not e!778028))))

(assert (=> d!147989 (= res!916741 ((_ is Cons!32040) newAcc!98))))

(assert (=> d!147989 (= (contains!9726 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603070)))

(declare-fun b!1373506 () Bool)

(declare-fun e!778029 () Bool)

(assert (=> b!1373506 (= e!778028 e!778029)))

(declare-fun res!916740 () Bool)

(assert (=> b!1373506 (=> res!916740 e!778029)))

(assert (=> b!1373506 (= res!916740 (= (h!33249 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373507 () Bool)

(assert (=> b!1373507 (= e!778029 (contains!9726 (t!46738 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147989 res!916741) b!1373506))

(assert (= (and b!1373506 (not res!916740)) b!1373507))

(assert (=> d!147989 m!1256751))

(declare-fun m!1256763 () Bool)

(assert (=> d!147989 m!1256763))

(declare-fun m!1256765 () Bool)

(assert (=> b!1373507 m!1256765))

(assert (=> b!1373401 d!147989))

(declare-fun e!778032 () Bool)

(declare-fun b!1373508 () Bool)

(assert (=> b!1373508 (= e!778032 (contains!9726 newAcc!98 (select (arr!44976 a!3861) from!3239)))))

(declare-fun b!1373509 () Bool)

(declare-fun e!778031 () Bool)

(declare-fun e!778030 () Bool)

(assert (=> b!1373509 (= e!778031 e!778030)))

(declare-fun c!127823 () Bool)

(assert (=> b!1373509 (= c!127823 (validKeyInArray!0 (select (arr!44976 a!3861) from!3239)))))

(declare-fun call!65618 () Bool)

(declare-fun bm!65615 () Bool)

(assert (=> bm!65615 (= call!65618 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127823 (Cons!32040 (select (arr!44976 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1373510 () Bool)

(assert (=> b!1373510 (= e!778030 call!65618)))

(declare-fun d!147991 () Bool)

(declare-fun res!916744 () Bool)

(declare-fun e!778033 () Bool)

(assert (=> d!147991 (=> res!916744 e!778033)))

(assert (=> d!147991 (= res!916744 (bvsge from!3239 (size!45526 a!3861)))))

(assert (=> d!147991 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!778033)))

(declare-fun b!1373511 () Bool)

(assert (=> b!1373511 (= e!778033 e!778031)))

(declare-fun res!916743 () Bool)

(assert (=> b!1373511 (=> (not res!916743) (not e!778031))))

(assert (=> b!1373511 (= res!916743 (not e!778032))))

(declare-fun res!916742 () Bool)

(assert (=> b!1373511 (=> (not res!916742) (not e!778032))))

(assert (=> b!1373511 (= res!916742 (validKeyInArray!0 (select (arr!44976 a!3861) from!3239)))))

(declare-fun b!1373512 () Bool)

(assert (=> b!1373512 (= e!778030 call!65618)))

(assert (= (and d!147991 (not res!916744)) b!1373511))

(assert (= (and b!1373511 res!916742) b!1373508))

(assert (= (and b!1373511 res!916743) b!1373509))

(assert (= (and b!1373509 c!127823) b!1373512))

(assert (= (and b!1373509 (not c!127823)) b!1373510))

(assert (= (or b!1373512 b!1373510) bm!65615))

(assert (=> b!1373508 m!1256665))

(assert (=> b!1373508 m!1256665))

(declare-fun m!1256767 () Bool)

(assert (=> b!1373508 m!1256767))

(assert (=> b!1373509 m!1256665))

(assert (=> b!1373509 m!1256665))

(assert (=> b!1373509 m!1256667))

(assert (=> bm!65615 m!1256665))

(declare-fun m!1256769 () Bool)

(assert (=> bm!65615 m!1256769))

(assert (=> b!1373511 m!1256665))

(assert (=> b!1373511 m!1256665))

(assert (=> b!1373511 m!1256667))

(assert (=> b!1373406 d!147991))

(declare-fun b!1373515 () Bool)

(declare-fun e!778038 () Bool)

(assert (=> b!1373515 (= e!778038 (contains!9726 newAcc!98 (select (arr!44976 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373516 () Bool)

(declare-fun e!778037 () Bool)

(declare-fun e!778036 () Bool)

(assert (=> b!1373516 (= e!778037 e!778036)))

(declare-fun c!127824 () Bool)

(assert (=> b!1373516 (= c!127824 (validKeyInArray!0 (select (arr!44976 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun call!65619 () Bool)

(declare-fun bm!65616 () Bool)

(assert (=> bm!65616 (= call!65619 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127824 (Cons!32040 (select (arr!44976 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) newAcc!98) newAcc!98)))))

(declare-fun b!1373517 () Bool)

(assert (=> b!1373517 (= e!778036 call!65619)))

(declare-fun d!147993 () Bool)

(declare-fun res!916749 () Bool)

(declare-fun e!778040 () Bool)

(assert (=> d!147993 (=> res!916749 e!778040)))

(assert (=> d!147993 (= res!916749 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45526 a!3861)))))

(assert (=> d!147993 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98) e!778040)))

(declare-fun b!1373518 () Bool)

(assert (=> b!1373518 (= e!778040 e!778037)))

(declare-fun res!916748 () Bool)

(assert (=> b!1373518 (=> (not res!916748) (not e!778037))))

(assert (=> b!1373518 (= res!916748 (not e!778038))))

(declare-fun res!916747 () Bool)

(assert (=> b!1373518 (=> (not res!916747) (not e!778038))))

(assert (=> b!1373518 (= res!916747 (validKeyInArray!0 (select (arr!44976 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373519 () Bool)

(assert (=> b!1373519 (= e!778036 call!65619)))

(assert (= (and d!147993 (not res!916749)) b!1373518))

(assert (= (and b!1373518 res!916747) b!1373515))

(assert (= (and b!1373518 res!916748) b!1373516))

(assert (= (and b!1373516 c!127824) b!1373519))

(assert (= (and b!1373516 (not c!127824)) b!1373517))

(assert (= (or b!1373519 b!1373517) bm!65616))

(declare-fun m!1256771 () Bool)

(assert (=> b!1373515 m!1256771))

(assert (=> b!1373515 m!1256771))

(declare-fun m!1256773 () Bool)

(assert (=> b!1373515 m!1256773))

(assert (=> b!1373516 m!1256771))

(assert (=> b!1373516 m!1256771))

(declare-fun m!1256775 () Bool)

(assert (=> b!1373516 m!1256775))

(assert (=> bm!65616 m!1256771))

(declare-fun m!1256777 () Bool)

(assert (=> bm!65616 m!1256777))

(assert (=> b!1373518 m!1256771))

(assert (=> b!1373518 m!1256771))

(assert (=> b!1373518 m!1256775))

(assert (=> b!1373406 d!147993))

(declare-fun d!147995 () Bool)

(assert (=> d!147995 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!603073 () Unit!45389)

(declare-fun choose!80 (array!93134 List!32044 List!32044 (_ BitVec 32)) Unit!45389)

(assert (=> d!147995 (= lt!603073 (choose!80 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!147995 (bvslt (size!45526 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!147995 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)) lt!603073)))

(declare-fun bs!39366 () Bool)

(assert (= bs!39366 d!147995))

(assert (=> bs!39366 m!1256655))

(declare-fun m!1256787 () Bool)

(assert (=> bs!39366 m!1256787))

(assert (=> b!1373406 d!147995))

(declare-fun d!147999 () Bool)

(assert (=> d!147999 (= (array_inv!34004 a!3861) (bvsge (size!45526 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116356 d!147999))

(declare-fun d!148003 () Bool)

(declare-fun lt!603074 () Bool)

(assert (=> d!148003 (= lt!603074 (select (content!752 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778066 () Bool)

(assert (=> d!148003 (= lt!603074 e!778066)))

(declare-fun res!916772 () Bool)

(assert (=> d!148003 (=> (not res!916772) (not e!778066))))

(assert (=> d!148003 (= res!916772 ((_ is Cons!32040) acc!866))))

(assert (=> d!148003 (= (contains!9726 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603074)))

(declare-fun b!1373551 () Bool)

(declare-fun e!778067 () Bool)

(assert (=> b!1373551 (= e!778066 e!778067)))

(declare-fun res!916771 () Bool)

(assert (=> b!1373551 (=> res!916771 e!778067)))

(assert (=> b!1373551 (= res!916771 (= (h!33249 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373552 () Bool)

(assert (=> b!1373552 (= e!778067 (contains!9726 (t!46738 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148003 res!916772) b!1373551))

(assert (= (and b!1373551 (not res!916771)) b!1373552))

(assert (=> d!148003 m!1256757))

(declare-fun m!1256793 () Bool)

(assert (=> d!148003 m!1256793))

(declare-fun m!1256795 () Bool)

(assert (=> b!1373552 m!1256795))

(assert (=> b!1373400 d!148003))

(declare-fun b!1373581 () Bool)

(declare-fun e!778093 () Bool)

(assert (=> b!1373581 (= e!778093 (subseq!1128 (t!46738 newAcc!98) (t!46738 acc!866)))))

(declare-fun b!1373582 () Bool)

(declare-fun e!778095 () Bool)

(assert (=> b!1373582 (= e!778095 (subseq!1128 newAcc!98 (t!46738 acc!866)))))

(declare-fun b!1373580 () Bool)

(declare-fun e!778094 () Bool)

(assert (=> b!1373580 (= e!778094 e!778095)))

(declare-fun res!916795 () Bool)

(assert (=> b!1373580 (=> res!916795 e!778095)))

(assert (=> b!1373580 (= res!916795 e!778093)))

(declare-fun res!916798 () Bool)

(assert (=> b!1373580 (=> (not res!916798) (not e!778093))))

(assert (=> b!1373580 (= res!916798 (= (h!33249 newAcc!98) (h!33249 acc!866)))))

(declare-fun b!1373579 () Bool)

(declare-fun e!778092 () Bool)

(assert (=> b!1373579 (= e!778092 e!778094)))

(declare-fun res!916796 () Bool)

(assert (=> b!1373579 (=> (not res!916796) (not e!778094))))

(assert (=> b!1373579 (= res!916796 ((_ is Cons!32040) acc!866))))

(declare-fun d!148005 () Bool)

(declare-fun res!916797 () Bool)

(assert (=> d!148005 (=> res!916797 e!778092)))

(assert (=> d!148005 (= res!916797 ((_ is Nil!32041) newAcc!98))))

(assert (=> d!148005 (= (subseq!1128 newAcc!98 acc!866) e!778092)))

(assert (= (and d!148005 (not res!916797)) b!1373579))

(assert (= (and b!1373579 res!916796) b!1373580))

(assert (= (and b!1373580 res!916798) b!1373581))

(assert (= (and b!1373580 (not res!916795)) b!1373582))

(declare-fun m!1256823 () Bool)

(assert (=> b!1373581 m!1256823))

(declare-fun m!1256825 () Bool)

(assert (=> b!1373582 m!1256825))

(assert (=> b!1373405 d!148005))

(declare-fun e!778098 () Bool)

(declare-fun b!1373583 () Bool)

(assert (=> b!1373583 (= e!778098 (contains!9726 acc!866 (select (arr!44976 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373584 () Bool)

(declare-fun e!778097 () Bool)

(declare-fun e!778096 () Bool)

(assert (=> b!1373584 (= e!778097 e!778096)))

(declare-fun c!127832 () Bool)

(assert (=> b!1373584 (= c!127832 (validKeyInArray!0 (select (arr!44976 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun call!65627 () Bool)

(declare-fun bm!65624 () Bool)

(assert (=> bm!65624 (= call!65627 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127832 (Cons!32040 (select (arr!44976 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(declare-fun b!1373585 () Bool)

(assert (=> b!1373585 (= e!778096 call!65627)))

(declare-fun d!148021 () Bool)

(declare-fun res!916801 () Bool)

(declare-fun e!778099 () Bool)

(assert (=> d!148021 (=> res!916801 e!778099)))

(assert (=> d!148021 (= res!916801 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45526 a!3861)))))

(assert (=> d!148021 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!778099)))

(declare-fun b!1373586 () Bool)

(assert (=> b!1373586 (= e!778099 e!778097)))

(declare-fun res!916800 () Bool)

(assert (=> b!1373586 (=> (not res!916800) (not e!778097))))

(assert (=> b!1373586 (= res!916800 (not e!778098))))

(declare-fun res!916799 () Bool)

(assert (=> b!1373586 (=> (not res!916799) (not e!778098))))

(assert (=> b!1373586 (= res!916799 (validKeyInArray!0 (select (arr!44976 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373587 () Bool)

(assert (=> b!1373587 (= e!778096 call!65627)))

(assert (= (and d!148021 (not res!916801)) b!1373586))

(assert (= (and b!1373586 res!916799) b!1373583))

(assert (= (and b!1373586 res!916800) b!1373584))

(assert (= (and b!1373584 c!127832) b!1373587))

(assert (= (and b!1373584 (not c!127832)) b!1373585))

(assert (= (or b!1373587 b!1373585) bm!65624))

(assert (=> b!1373583 m!1256771))

(assert (=> b!1373583 m!1256771))

(declare-fun m!1256831 () Bool)

(assert (=> b!1373583 m!1256831))

(assert (=> b!1373584 m!1256771))

(assert (=> b!1373584 m!1256771))

(assert (=> b!1373584 m!1256775))

(assert (=> bm!65624 m!1256771))

(declare-fun m!1256833 () Bool)

(assert (=> bm!65624 m!1256833))

(assert (=> b!1373586 m!1256771))

(assert (=> b!1373586 m!1256771))

(assert (=> b!1373586 m!1256775))

(assert (=> b!1373399 d!148021))

(declare-fun d!148025 () Bool)

(declare-fun res!916818 () Bool)

(declare-fun e!778118 () Bool)

(assert (=> d!148025 (=> res!916818 e!778118)))

(assert (=> d!148025 (= res!916818 ((_ is Nil!32041) acc!866))))

(assert (=> d!148025 (= (noDuplicate!2583 acc!866) e!778118)))

(declare-fun b!1373608 () Bool)

(declare-fun e!778119 () Bool)

(assert (=> b!1373608 (= e!778118 e!778119)))

(declare-fun res!916819 () Bool)

(assert (=> b!1373608 (=> (not res!916819) (not e!778119))))

(assert (=> b!1373608 (= res!916819 (not (contains!9726 (t!46738 acc!866) (h!33249 acc!866))))))

(declare-fun b!1373609 () Bool)

(assert (=> b!1373609 (= e!778119 (noDuplicate!2583 (t!46738 acc!866)))))

(assert (= (and d!148025 (not res!916818)) b!1373608))

(assert (= (and b!1373608 res!916819) b!1373609))

(declare-fun m!1256845 () Bool)

(assert (=> b!1373608 m!1256845))

(declare-fun m!1256849 () Bool)

(assert (=> b!1373609 m!1256849))

(assert (=> b!1373404 d!148025))

(check-sat (not d!147961) (not b!1373511) (not b!1373552) (not b!1373461) (not b!1373609) (not b!1373477) (not d!147989) (not b!1373509) (not b!1373508) (not d!148003) (not b!1373495) (not b!1373582) (not b!1373507) (not b!1373518) (not b!1373516) (not b!1373460) (not b!1373583) (not b!1373515) (not d!147995) (not bm!65616) (not b!1373493) (not b!1373586) (not bm!65615) (not b!1373581) (not bm!65624) (not d!147969) (not b!1373463) (not bm!65612) (not b!1373608) (not b!1373584) (not d!147985))
(check-sat)
