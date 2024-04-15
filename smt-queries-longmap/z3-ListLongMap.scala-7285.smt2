; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93070 () Bool)

(assert start!93070)

(declare-fun b!1055818 () Bool)

(declare-fun e!600150 () Bool)

(declare-fun e!600149 () Bool)

(assert (=> b!1055818 (= e!600150 e!600149)))

(declare-fun res!704719 () Bool)

(assert (=> b!1055818 (=> (not res!704719) (not e!600149))))

(declare-fun lt!465807 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055818 (= res!704719 (not (= lt!465807 i!1381)))))

(declare-datatypes ((array!66536 0))(
  ( (array!66537 (arr!31995 (Array (_ BitVec 32) (_ BitVec 64))) (size!32533 (_ BitVec 32))) )
))
(declare-fun lt!465808 () array!66536)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66536 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055818 (= lt!465807 (arrayScanForKey!0 lt!465808 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055819 () Bool)

(declare-fun e!600148 () Bool)

(declare-fun a!3488 () array!66536)

(declare-fun arrayContainsKey!0 (array!66536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055819 (= e!600148 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1055820 () Bool)

(declare-fun res!704721 () Bool)

(declare-fun e!600146 () Bool)

(assert (=> b!1055820 (=> (not res!704721) (not e!600146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055820 (= res!704721 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055821 () Bool)

(declare-fun res!704716 () Bool)

(assert (=> b!1055821 (=> (not res!704716) (not e!600146))))

(declare-datatypes ((List!22366 0))(
  ( (Nil!22363) (Cons!22362 (h!23571 (_ BitVec 64)) (t!31664 List!22366)) )
))
(declare-fun arrayNoDuplicates!0 (array!66536 (_ BitVec 32) List!22366) Bool)

(assert (=> b!1055821 (= res!704716 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22363))))

(declare-fun b!1055822 () Bool)

(assert (=> b!1055822 (= e!600146 e!600150)))

(declare-fun res!704720 () Bool)

(assert (=> b!1055822 (=> (not res!704720) (not e!600150))))

(assert (=> b!1055822 (= res!704720 (arrayContainsKey!0 lt!465808 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055822 (= lt!465808 (array!66537 (store (arr!31995 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32533 a!3488)))))

(declare-fun res!704722 () Bool)

(assert (=> start!93070 (=> (not res!704722) (not e!600146))))

(assert (=> start!93070 (= res!704722 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32533 a!3488)) (bvslt (size!32533 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93070 e!600146))

(assert (=> start!93070 true))

(declare-fun array_inv!24778 (array!66536) Bool)

(assert (=> start!93070 (array_inv!24778 a!3488)))

(declare-fun b!1055823 () Bool)

(declare-fun res!704718 () Bool)

(assert (=> b!1055823 (=> (not res!704718) (not e!600146))))

(assert (=> b!1055823 (= res!704718 (= (select (arr!31995 a!3488) i!1381) k0!2747))))

(declare-fun b!1055824 () Bool)

(assert (=> b!1055824 (= e!600149 (not e!600148))))

(declare-fun res!704717 () Bool)

(assert (=> b!1055824 (=> res!704717 e!600148)))

(assert (=> b!1055824 (= res!704717 (or (bvsgt lt!465807 i!1381) (bvsle i!1381 lt!465807)))))

(assert (=> b!1055824 (= (select (store (arr!31995 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465807) k0!2747)))

(assert (= (and start!93070 res!704722) b!1055821))

(assert (= (and b!1055821 res!704716) b!1055820))

(assert (= (and b!1055820 res!704721) b!1055823))

(assert (= (and b!1055823 res!704718) b!1055822))

(assert (= (and b!1055822 res!704720) b!1055818))

(assert (= (and b!1055818 res!704719) b!1055824))

(assert (= (and b!1055824 (not res!704717)) b!1055819))

(declare-fun m!975337 () Bool)

(assert (=> b!1055820 m!975337))

(declare-fun m!975339 () Bool)

(assert (=> b!1055824 m!975339))

(declare-fun m!975341 () Bool)

(assert (=> b!1055824 m!975341))

(declare-fun m!975343 () Bool)

(assert (=> b!1055821 m!975343))

(declare-fun m!975345 () Bool)

(assert (=> b!1055823 m!975345))

(declare-fun m!975347 () Bool)

(assert (=> b!1055822 m!975347))

(assert (=> b!1055822 m!975339))

(declare-fun m!975349 () Bool)

(assert (=> b!1055819 m!975349))

(declare-fun m!975351 () Bool)

(assert (=> b!1055818 m!975351))

(declare-fun m!975353 () Bool)

(assert (=> start!93070 m!975353))

(check-sat (not b!1055821) (not start!93070) (not b!1055819) (not b!1055822) (not b!1055818) (not b!1055820))
(check-sat)
(get-model)

(declare-fun d!128089 () Bool)

(assert (=> d!128089 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1055820 d!128089))

(declare-fun d!128091 () Bool)

(assert (=> d!128091 (= (array_inv!24778 a!3488) (bvsge (size!32533 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93070 d!128091))

(declare-fun d!128093 () Bool)

(declare-fun res!704769 () Bool)

(declare-fun e!600185 () Bool)

(assert (=> d!128093 (=> res!704769 e!600185)))

(assert (=> d!128093 (= res!704769 (= (select (arr!31995 a!3488) i!1381) k0!2747))))

(assert (=> d!128093 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!600185)))

(declare-fun b!1055871 () Bool)

(declare-fun e!600186 () Bool)

(assert (=> b!1055871 (= e!600185 e!600186)))

(declare-fun res!704770 () Bool)

(assert (=> b!1055871 (=> (not res!704770) (not e!600186))))

(assert (=> b!1055871 (= res!704770 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32533 a!3488)))))

(declare-fun b!1055872 () Bool)

(assert (=> b!1055872 (= e!600186 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128093 (not res!704769)) b!1055871))

(assert (= (and b!1055871 res!704770) b!1055872))

(assert (=> d!128093 m!975345))

(declare-fun m!975391 () Bool)

(assert (=> b!1055872 m!975391))

(assert (=> b!1055819 d!128093))

(declare-fun d!128095 () Bool)

(declare-fun lt!465823 () (_ BitVec 32))

(assert (=> d!128095 (and (or (bvslt lt!465823 #b00000000000000000000000000000000) (bvsge lt!465823 (size!32533 lt!465808)) (and (bvsge lt!465823 #b00000000000000000000000000000000) (bvslt lt!465823 (size!32533 lt!465808)))) (bvsge lt!465823 #b00000000000000000000000000000000) (bvslt lt!465823 (size!32533 lt!465808)) (= (select (arr!31995 lt!465808) lt!465823) k0!2747))))

(declare-fun e!600189 () (_ BitVec 32))

(assert (=> d!128095 (= lt!465823 e!600189)))

(declare-fun c!107016 () Bool)

(assert (=> d!128095 (= c!107016 (= (select (arr!31995 lt!465808) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128095 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32533 lt!465808)) (bvslt (size!32533 lt!465808) #b01111111111111111111111111111111))))

(assert (=> d!128095 (= (arrayScanForKey!0 lt!465808 k0!2747 #b00000000000000000000000000000000) lt!465823)))

(declare-fun b!1055877 () Bool)

(assert (=> b!1055877 (= e!600189 #b00000000000000000000000000000000)))

(declare-fun b!1055878 () Bool)

(assert (=> b!1055878 (= e!600189 (arrayScanForKey!0 lt!465808 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128095 c!107016) b!1055877))

(assert (= (and d!128095 (not c!107016)) b!1055878))

(declare-fun m!975393 () Bool)

(assert (=> d!128095 m!975393))

(declare-fun m!975395 () Bool)

(assert (=> d!128095 m!975395))

(declare-fun m!975397 () Bool)

(assert (=> b!1055878 m!975397))

(assert (=> b!1055818 d!128095))

(declare-fun d!128099 () Bool)

(declare-fun res!704771 () Bool)

(declare-fun e!600190 () Bool)

(assert (=> d!128099 (=> res!704771 e!600190)))

(assert (=> d!128099 (= res!704771 (= (select (arr!31995 lt!465808) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128099 (= (arrayContainsKey!0 lt!465808 k0!2747 #b00000000000000000000000000000000) e!600190)))

(declare-fun b!1055879 () Bool)

(declare-fun e!600191 () Bool)

(assert (=> b!1055879 (= e!600190 e!600191)))

(declare-fun res!704772 () Bool)

(assert (=> b!1055879 (=> (not res!704772) (not e!600191))))

(assert (=> b!1055879 (= res!704772 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32533 lt!465808)))))

(declare-fun b!1055880 () Bool)

(assert (=> b!1055880 (= e!600191 (arrayContainsKey!0 lt!465808 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128099 (not res!704771)) b!1055879))

(assert (= (and b!1055879 res!704772) b!1055880))

(assert (=> d!128099 m!975395))

(declare-fun m!975399 () Bool)

(assert (=> b!1055880 m!975399))

(assert (=> b!1055822 d!128099))

(declare-fun b!1055895 () Bool)

(declare-fun e!600203 () Bool)

(declare-fun e!600204 () Bool)

(assert (=> b!1055895 (= e!600203 e!600204)))

(declare-fun c!107021 () Bool)

(assert (=> b!1055895 (= c!107021 (validKeyInArray!0 (select (arr!31995 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055896 () Bool)

(declare-fun call!44786 () Bool)

(assert (=> b!1055896 (= e!600204 call!44786)))

(declare-fun b!1055897 () Bool)

(declare-fun e!600202 () Bool)

(declare-fun contains!6160 (List!22366 (_ BitVec 64)) Bool)

(assert (=> b!1055897 (= e!600202 (contains!6160 Nil!22363 (select (arr!31995 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128103 () Bool)

(declare-fun res!704780 () Bool)

(declare-fun e!600205 () Bool)

(assert (=> d!128103 (=> res!704780 e!600205)))

(assert (=> d!128103 (= res!704780 (bvsge #b00000000000000000000000000000000 (size!32533 a!3488)))))

(assert (=> d!128103 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22363) e!600205)))

(declare-fun bm!44783 () Bool)

(assert (=> bm!44783 (= call!44786 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107021 (Cons!22362 (select (arr!31995 a!3488) #b00000000000000000000000000000000) Nil!22363) Nil!22363)))))

(declare-fun b!1055898 () Bool)

(assert (=> b!1055898 (= e!600205 e!600203)))

(declare-fun res!704781 () Bool)

(assert (=> b!1055898 (=> (not res!704781) (not e!600203))))

(assert (=> b!1055898 (= res!704781 (not e!600202))))

(declare-fun res!704779 () Bool)

(assert (=> b!1055898 (=> (not res!704779) (not e!600202))))

(assert (=> b!1055898 (= res!704779 (validKeyInArray!0 (select (arr!31995 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055899 () Bool)

(assert (=> b!1055899 (= e!600204 call!44786)))

(assert (= (and d!128103 (not res!704780)) b!1055898))

(assert (= (and b!1055898 res!704779) b!1055897))

(assert (= (and b!1055898 res!704781) b!1055895))

(assert (= (and b!1055895 c!107021) b!1055896))

(assert (= (and b!1055895 (not c!107021)) b!1055899))

(assert (= (or b!1055896 b!1055899) bm!44783))

(declare-fun m!975407 () Bool)

(assert (=> b!1055895 m!975407))

(assert (=> b!1055895 m!975407))

(declare-fun m!975409 () Bool)

(assert (=> b!1055895 m!975409))

(assert (=> b!1055897 m!975407))

(assert (=> b!1055897 m!975407))

(declare-fun m!975411 () Bool)

(assert (=> b!1055897 m!975411))

(assert (=> bm!44783 m!975407))

(declare-fun m!975413 () Bool)

(assert (=> bm!44783 m!975413))

(assert (=> b!1055898 m!975407))

(assert (=> b!1055898 m!975407))

(assert (=> b!1055898 m!975409))

(assert (=> b!1055821 d!128103))

(check-sat (not b!1055898) (not b!1055878) (not b!1055897) (not bm!44783) (not b!1055895) (not b!1055880) (not b!1055872))
(check-sat)
