; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92926 () Bool)

(assert start!92926)

(declare-fun e!599433 () Bool)

(declare-datatypes ((array!66488 0))(
  ( (array!66489 (arr!31974 (Array (_ BitVec 32) (_ BitVec 64))) (size!32512 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66488)

(declare-fun lt!465449 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun b!1054891 () Bool)

(declare-fun arrayContainsKey!0 (array!66488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054891 (= e!599433 (arrayContainsKey!0 a!3488 k0!2747 lt!465449))))

(declare-fun b!1054892 () Bool)

(declare-fun e!599435 () Bool)

(declare-fun e!599436 () Bool)

(assert (=> b!1054892 (= e!599435 e!599436)))

(declare-fun res!703879 () Bool)

(assert (=> b!1054892 (=> res!703879 e!599436)))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054892 (= res!703879 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32512 a!3488)))))

(assert (=> b!1054892 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34439 0))(
  ( (Unit!34440) )
))
(declare-fun lt!465451 () Unit!34439)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66488 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34439)

(assert (=> b!1054892 (= lt!465451 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465449 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22345 0))(
  ( (Nil!22342) (Cons!22341 (h!23550 (_ BitVec 64)) (t!31643 List!22345)) )
))
(declare-fun arrayNoDuplicates!0 (array!66488 (_ BitVec 32) List!22345) Bool)

(assert (=> b!1054892 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22342)))

(declare-fun lt!465450 () Unit!34439)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66488 (_ BitVec 32) (_ BitVec 32)) Unit!34439)

(assert (=> b!1054892 (= lt!465450 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054893 () Bool)

(declare-fun res!703880 () Bool)

(declare-fun e!599439 () Bool)

(assert (=> b!1054893 (=> (not res!703880) (not e!599439))))

(assert (=> b!1054893 (= res!703880 (= (select (arr!31974 a!3488) i!1381) k0!2747))))

(declare-fun b!1054894 () Bool)

(declare-fun res!703875 () Bool)

(assert (=> b!1054894 (=> (not res!703875) (not e!599439))))

(assert (=> b!1054894 (= res!703875 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22342))))

(declare-fun b!1054895 () Bool)

(declare-fun noDuplicate!1558 (List!22345) Bool)

(assert (=> b!1054895 (= e!599436 (noDuplicate!1558 Nil!22342))))

(declare-fun b!1054896 () Bool)

(declare-fun e!599437 () Bool)

(assert (=> b!1054896 (= e!599437 (not e!599435))))

(declare-fun res!703878 () Bool)

(assert (=> b!1054896 (=> res!703878 e!599435)))

(assert (=> b!1054896 (= res!703878 (bvsle lt!465449 i!1381))))

(declare-fun e!599434 () Bool)

(assert (=> b!1054896 e!599434))

(declare-fun res!703881 () Bool)

(assert (=> b!1054896 (=> (not res!703881) (not e!599434))))

(assert (=> b!1054896 (= res!703881 (= (select (store (arr!31974 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465449) k0!2747))))

(declare-fun b!1054897 () Bool)

(declare-fun res!703877 () Bool)

(assert (=> b!1054897 (=> (not res!703877) (not e!599439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054897 (= res!703877 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054898 () Bool)

(declare-fun e!599432 () Bool)

(assert (=> b!1054898 (= e!599439 e!599432)))

(declare-fun res!703882 () Bool)

(assert (=> b!1054898 (=> (not res!703882) (not e!599432))))

(declare-fun lt!465448 () array!66488)

(assert (=> b!1054898 (= res!703882 (arrayContainsKey!0 lt!465448 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054898 (= lt!465448 (array!66489 (store (arr!31974 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32512 a!3488)))))

(declare-fun b!1054899 () Bool)

(assert (=> b!1054899 (= e!599432 e!599437)))

(declare-fun res!703874 () Bool)

(assert (=> b!1054899 (=> (not res!703874) (not e!599437))))

(assert (=> b!1054899 (= res!703874 (not (= lt!465449 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66488 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054899 (= lt!465449 (arrayScanForKey!0 lt!465448 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!703873 () Bool)

(assert (=> start!92926 (=> (not res!703873) (not e!599439))))

(assert (=> start!92926 (= res!703873 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32512 a!3488)) (bvslt (size!32512 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92926 e!599439))

(assert (=> start!92926 true))

(declare-fun array_inv!24757 (array!66488) Bool)

(assert (=> start!92926 (array_inv!24757 a!3488)))

(declare-fun b!1054900 () Bool)

(assert (=> b!1054900 (= e!599434 e!599433)))

(declare-fun res!703876 () Bool)

(assert (=> b!1054900 (=> res!703876 e!599433)))

(assert (=> b!1054900 (= res!703876 (bvsle lt!465449 i!1381))))

(assert (= (and start!92926 res!703873) b!1054894))

(assert (= (and b!1054894 res!703875) b!1054897))

(assert (= (and b!1054897 res!703877) b!1054893))

(assert (= (and b!1054893 res!703880) b!1054898))

(assert (= (and b!1054898 res!703882) b!1054899))

(assert (= (and b!1054899 res!703874) b!1054896))

(assert (= (and b!1054896 res!703881) b!1054900))

(assert (= (and b!1054900 (not res!703876)) b!1054891))

(assert (= (and b!1054896 (not res!703878)) b!1054892))

(assert (= (and b!1054892 (not res!703879)) b!1054895))

(declare-fun m!974455 () Bool)

(assert (=> b!1054893 m!974455))

(declare-fun m!974457 () Bool)

(assert (=> b!1054891 m!974457))

(declare-fun m!974459 () Bool)

(assert (=> b!1054897 m!974459))

(declare-fun m!974461 () Bool)

(assert (=> b!1054895 m!974461))

(declare-fun m!974463 () Bool)

(assert (=> b!1054898 m!974463))

(declare-fun m!974465 () Bool)

(assert (=> b!1054898 m!974465))

(declare-fun m!974467 () Bool)

(assert (=> start!92926 m!974467))

(declare-fun m!974469 () Bool)

(assert (=> b!1054899 m!974469))

(declare-fun m!974471 () Bool)

(assert (=> b!1054892 m!974471))

(declare-fun m!974473 () Bool)

(assert (=> b!1054892 m!974473))

(declare-fun m!974475 () Bool)

(assert (=> b!1054892 m!974475))

(declare-fun m!974477 () Bool)

(assert (=> b!1054892 m!974477))

(declare-fun m!974479 () Bool)

(assert (=> b!1054894 m!974479))

(assert (=> b!1054896 m!974465))

(declare-fun m!974481 () Bool)

(assert (=> b!1054896 m!974481))

(check-sat (not start!92926) (not b!1054899) (not b!1054898) (not b!1054897) (not b!1054894) (not b!1054892) (not b!1054891) (not b!1054895))
(check-sat)
(get-model)

(declare-fun d!127931 () Bool)

(declare-fun res!703947 () Bool)

(declare-fun e!599492 () Bool)

(assert (=> d!127931 (=> res!703947 e!599492)))

(assert (=> d!127931 (= res!703947 (= (select (arr!31974 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k0!2747))))

(assert (=> d!127931 (= (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!599492)))

(declare-fun b!1054965 () Bool)

(declare-fun e!599493 () Bool)

(assert (=> b!1054965 (= e!599492 e!599493)))

(declare-fun res!703948 () Bool)

(assert (=> b!1054965 (=> (not res!703948) (not e!599493))))

(assert (=> b!1054965 (= res!703948 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32512 a!3488)))))

(declare-fun b!1054966 () Bool)

(assert (=> b!1054966 (= e!599493 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!127931 (not res!703947)) b!1054965))

(assert (= (and b!1054965 res!703948) b!1054966))

(declare-fun m!974539 () Bool)

(assert (=> d!127931 m!974539))

(declare-fun m!974541 () Bool)

(assert (=> b!1054966 m!974541))

(assert (=> b!1054892 d!127931))

(declare-fun d!127933 () Bool)

(assert (=> d!127933 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465478 () Unit!34439)

(declare-fun choose!114 (array!66488 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34439)

(assert (=> d!127933 (= lt!465478 (choose!114 a!3488 k0!2747 lt!465449 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!127933 (bvsge lt!465449 #b00000000000000000000000000000000)))

(assert (=> d!127933 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465449 (bvadd #b00000000000000000000000000000001 i!1381)) lt!465478)))

(declare-fun bs!30896 () Bool)

(assert (= bs!30896 d!127933))

(assert (=> bs!30896 m!974471))

(declare-fun m!974543 () Bool)

(assert (=> bs!30896 m!974543))

(assert (=> b!1054892 d!127933))

(declare-fun b!1054977 () Bool)

(declare-fun e!599505 () Bool)

(declare-fun call!44762 () Bool)

(assert (=> b!1054977 (= e!599505 call!44762)))

(declare-fun b!1054978 () Bool)

(assert (=> b!1054978 (= e!599505 call!44762)))

(declare-fun b!1054979 () Bool)

(declare-fun e!599502 () Bool)

(assert (=> b!1054979 (= e!599502 e!599505)))

(declare-fun c!106974 () Bool)

(assert (=> b!1054979 (= c!106974 (validKeyInArray!0 (select (arr!31974 a!3488) i!1381)))))

(declare-fun b!1054980 () Bool)

(declare-fun e!599503 () Bool)

(assert (=> b!1054980 (= e!599503 e!599502)))

(declare-fun res!703957 () Bool)

(assert (=> b!1054980 (=> (not res!703957) (not e!599502))))

(declare-fun e!599504 () Bool)

(assert (=> b!1054980 (= res!703957 (not e!599504))))

(declare-fun res!703956 () Bool)

(assert (=> b!1054980 (=> (not res!703956) (not e!599504))))

(assert (=> b!1054980 (= res!703956 (validKeyInArray!0 (select (arr!31974 a!3488) i!1381)))))

(declare-fun b!1054981 () Bool)

(declare-fun contains!6149 (List!22345 (_ BitVec 64)) Bool)

(assert (=> b!1054981 (= e!599504 (contains!6149 Nil!22342 (select (arr!31974 a!3488) i!1381)))))

(declare-fun d!127935 () Bool)

(declare-fun res!703955 () Bool)

(assert (=> d!127935 (=> res!703955 e!599503)))

(assert (=> d!127935 (= res!703955 (bvsge i!1381 (size!32512 a!3488)))))

(assert (=> d!127935 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22342) e!599503)))

(declare-fun bm!44759 () Bool)

(assert (=> bm!44759 (= call!44762 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!106974 (Cons!22341 (select (arr!31974 a!3488) i!1381) Nil!22342) Nil!22342)))))

(assert (= (and d!127935 (not res!703955)) b!1054980))

(assert (= (and b!1054980 res!703956) b!1054981))

(assert (= (and b!1054980 res!703957) b!1054979))

(assert (= (and b!1054979 c!106974) b!1054978))

(assert (= (and b!1054979 (not c!106974)) b!1054977))

(assert (= (or b!1054978 b!1054977) bm!44759))

(assert (=> b!1054979 m!974455))

(assert (=> b!1054979 m!974455))

(declare-fun m!974545 () Bool)

(assert (=> b!1054979 m!974545))

(assert (=> b!1054980 m!974455))

(assert (=> b!1054980 m!974455))

(assert (=> b!1054980 m!974545))

(assert (=> b!1054981 m!974455))

(assert (=> b!1054981 m!974455))

(declare-fun m!974547 () Bool)

(assert (=> b!1054981 m!974547))

(assert (=> bm!44759 m!974455))

(declare-fun m!974549 () Bool)

(assert (=> bm!44759 m!974549))

(assert (=> b!1054892 d!127935))

(declare-fun d!127941 () Bool)

(assert (=> d!127941 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22342)))

(declare-fun lt!465481 () Unit!34439)

(declare-fun choose!39 (array!66488 (_ BitVec 32) (_ BitVec 32)) Unit!34439)

(assert (=> d!127941 (= lt!465481 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!127941 (bvslt (size!32512 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!127941 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465481)))

(declare-fun bs!30897 () Bool)

(assert (= bs!30897 d!127941))

(assert (=> bs!30897 m!974475))

(declare-fun m!974551 () Bool)

(assert (=> bs!30897 m!974551))

(assert (=> b!1054892 d!127941))

(declare-fun d!127943 () Bool)

(declare-fun res!703960 () Bool)

(declare-fun e!599508 () Bool)

(assert (=> d!127943 (=> res!703960 e!599508)))

(assert (=> d!127943 (= res!703960 (= (select (arr!31974 lt!465448) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127943 (= (arrayContainsKey!0 lt!465448 k0!2747 #b00000000000000000000000000000000) e!599508)))

(declare-fun b!1054984 () Bool)

(declare-fun e!599509 () Bool)

(assert (=> b!1054984 (= e!599508 e!599509)))

(declare-fun res!703961 () Bool)

(assert (=> b!1054984 (=> (not res!703961) (not e!599509))))

(assert (=> b!1054984 (= res!703961 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32512 lt!465448)))))

(declare-fun b!1054985 () Bool)

(assert (=> b!1054985 (= e!599509 (arrayContainsKey!0 lt!465448 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127943 (not res!703960)) b!1054984))

(assert (= (and b!1054984 res!703961) b!1054985))

(declare-fun m!974553 () Bool)

(assert (=> d!127943 m!974553))

(declare-fun m!974555 () Bool)

(assert (=> b!1054985 m!974555))

(assert (=> b!1054898 d!127943))

(declare-fun d!127945 () Bool)

(declare-fun res!703966 () Bool)

(declare-fun e!599514 () Bool)

(assert (=> d!127945 (=> res!703966 e!599514)))

(assert (=> d!127945 (= res!703966 (= (select (arr!31974 a!3488) lt!465449) k0!2747))))

(assert (=> d!127945 (= (arrayContainsKey!0 a!3488 k0!2747 lt!465449) e!599514)))

(declare-fun b!1054992 () Bool)

(declare-fun e!599515 () Bool)

(assert (=> b!1054992 (= e!599514 e!599515)))

(declare-fun res!703967 () Bool)

(assert (=> b!1054992 (=> (not res!703967) (not e!599515))))

(assert (=> b!1054992 (= res!703967 (bvslt (bvadd lt!465449 #b00000000000000000000000000000001) (size!32512 a!3488)))))

(declare-fun b!1054993 () Bool)

(assert (=> b!1054993 (= e!599515 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!465449 #b00000000000000000000000000000001)))))

(assert (= (and d!127945 (not res!703966)) b!1054992))

(assert (= (and b!1054992 res!703967) b!1054993))

(declare-fun m!974557 () Bool)

(assert (=> d!127945 m!974557))

(declare-fun m!974559 () Bool)

(assert (=> b!1054993 m!974559))

(assert (=> b!1054891 d!127945))

(declare-fun d!127949 () Bool)

(assert (=> d!127949 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1054897 d!127949))

(declare-fun d!127951 () Bool)

(assert (=> d!127951 (= (array_inv!24757 a!3488) (bvsge (size!32512 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92926 d!127951))

(declare-fun d!127953 () Bool)

(declare-fun res!703978 () Bool)

(declare-fun e!599528 () Bool)

(assert (=> d!127953 (=> res!703978 e!599528)))

(get-info :version)

(assert (=> d!127953 (= res!703978 ((_ is Nil!22342) Nil!22342))))

(assert (=> d!127953 (= (noDuplicate!1558 Nil!22342) e!599528)))

(declare-fun b!1055006 () Bool)

(declare-fun e!599529 () Bool)

(assert (=> b!1055006 (= e!599528 e!599529)))

(declare-fun res!703979 () Bool)

(assert (=> b!1055006 (=> (not res!703979) (not e!599529))))

(assert (=> b!1055006 (= res!703979 (not (contains!6149 (t!31643 Nil!22342) (h!23550 Nil!22342))))))

(declare-fun b!1055007 () Bool)

(assert (=> b!1055007 (= e!599529 (noDuplicate!1558 (t!31643 Nil!22342)))))

(assert (= (and d!127953 (not res!703978)) b!1055006))

(assert (= (and b!1055006 res!703979) b!1055007))

(declare-fun m!974561 () Bool)

(assert (=> b!1055006 m!974561))

(declare-fun m!974563 () Bool)

(assert (=> b!1055007 m!974563))

(assert (=> b!1054895 d!127953))

(declare-fun d!127955 () Bool)

(declare-fun lt!465484 () (_ BitVec 32))

(assert (=> d!127955 (and (or (bvslt lt!465484 #b00000000000000000000000000000000) (bvsge lt!465484 (size!32512 lt!465448)) (and (bvsge lt!465484 #b00000000000000000000000000000000) (bvslt lt!465484 (size!32512 lt!465448)))) (bvsge lt!465484 #b00000000000000000000000000000000) (bvslt lt!465484 (size!32512 lt!465448)) (= (select (arr!31974 lt!465448) lt!465484) k0!2747))))

(declare-fun e!599544 () (_ BitVec 32))

(assert (=> d!127955 (= lt!465484 e!599544)))

(declare-fun c!106980 () Bool)

(assert (=> d!127955 (= c!106980 (= (select (arr!31974 lt!465448) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127955 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32512 lt!465448)) (bvslt (size!32512 lt!465448) #b01111111111111111111111111111111))))

(assert (=> d!127955 (= (arrayScanForKey!0 lt!465448 k0!2747 #b00000000000000000000000000000000) lt!465484)))

(declare-fun b!1055025 () Bool)

(assert (=> b!1055025 (= e!599544 #b00000000000000000000000000000000)))

(declare-fun b!1055026 () Bool)

(assert (=> b!1055026 (= e!599544 (arrayScanForKey!0 lt!465448 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127955 c!106980) b!1055025))

(assert (= (and d!127955 (not c!106980)) b!1055026))

(declare-fun m!974585 () Bool)

(assert (=> d!127955 m!974585))

(assert (=> d!127955 m!974553))

(declare-fun m!974587 () Bool)

(assert (=> b!1055026 m!974587))

(assert (=> b!1054899 d!127955))

(declare-fun b!1055027 () Bool)

(declare-fun e!599548 () Bool)

(declare-fun call!44766 () Bool)

(assert (=> b!1055027 (= e!599548 call!44766)))

(declare-fun b!1055028 () Bool)

(assert (=> b!1055028 (= e!599548 call!44766)))

(declare-fun b!1055029 () Bool)

(declare-fun e!599545 () Bool)

(assert (=> b!1055029 (= e!599545 e!599548)))

(declare-fun c!106981 () Bool)

(assert (=> b!1055029 (= c!106981 (validKeyInArray!0 (select (arr!31974 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055030 () Bool)

(declare-fun e!599546 () Bool)

(assert (=> b!1055030 (= e!599546 e!599545)))

(declare-fun res!703993 () Bool)

(assert (=> b!1055030 (=> (not res!703993) (not e!599545))))

(declare-fun e!599547 () Bool)

(assert (=> b!1055030 (= res!703993 (not e!599547))))

(declare-fun res!703992 () Bool)

(assert (=> b!1055030 (=> (not res!703992) (not e!599547))))

(assert (=> b!1055030 (= res!703992 (validKeyInArray!0 (select (arr!31974 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055031 () Bool)

(assert (=> b!1055031 (= e!599547 (contains!6149 Nil!22342 (select (arr!31974 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!127965 () Bool)

(declare-fun res!703991 () Bool)

(assert (=> d!127965 (=> res!703991 e!599546)))

(assert (=> d!127965 (= res!703991 (bvsge #b00000000000000000000000000000000 (size!32512 a!3488)))))

(assert (=> d!127965 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22342) e!599546)))

(declare-fun bm!44763 () Bool)

(assert (=> bm!44763 (= call!44766 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106981 (Cons!22341 (select (arr!31974 a!3488) #b00000000000000000000000000000000) Nil!22342) Nil!22342)))))

(assert (= (and d!127965 (not res!703991)) b!1055030))

(assert (= (and b!1055030 res!703992) b!1055031))

(assert (= (and b!1055030 res!703993) b!1055029))

(assert (= (and b!1055029 c!106981) b!1055028))

(assert (= (and b!1055029 (not c!106981)) b!1055027))

(assert (= (or b!1055028 b!1055027) bm!44763))

(declare-fun m!974589 () Bool)

(assert (=> b!1055029 m!974589))

(assert (=> b!1055029 m!974589))

(declare-fun m!974591 () Bool)

(assert (=> b!1055029 m!974591))

(assert (=> b!1055030 m!974589))

(assert (=> b!1055030 m!974589))

(assert (=> b!1055030 m!974591))

(assert (=> b!1055031 m!974589))

(assert (=> b!1055031 m!974589))

(declare-fun m!974593 () Bool)

(assert (=> b!1055031 m!974593))

(assert (=> bm!44763 m!974589))

(declare-fun m!974595 () Bool)

(assert (=> bm!44763 m!974595))

(assert (=> b!1054894 d!127965))

(check-sat (not b!1054980) (not b!1055026) (not b!1055007) (not bm!44759) (not b!1055029) (not b!1054979) (not b!1055030) (not bm!44763) (not d!127933) (not b!1054993) (not b!1054985) (not b!1054966) (not b!1055006) (not b!1054981) (not d!127941) (not b!1055031))
(check-sat)
