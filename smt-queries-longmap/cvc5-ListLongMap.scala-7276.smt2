; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92874 () Bool)

(assert start!92874)

(declare-fun b!1054770 () Bool)

(declare-fun e!599312 () Bool)

(declare-fun e!599309 () Bool)

(assert (=> b!1054770 (= e!599312 (not e!599309))))

(declare-fun res!703715 () Bool)

(assert (=> b!1054770 (=> res!703715 e!599309)))

(declare-fun lt!465552 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054770 (= res!703715 (bvsle lt!465552 i!1381))))

(declare-fun e!599311 () Bool)

(assert (=> b!1054770 e!599311))

(declare-fun res!703711 () Bool)

(assert (=> b!1054770 (=> (not res!703711) (not e!599311))))

(declare-datatypes ((array!66534 0))(
  ( (array!66535 (arr!31999 (Array (_ BitVec 32) (_ BitVec 64))) (size!32535 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66534)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1054770 (= res!703711 (= (select (store (arr!31999 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465552) k!2747))))

(declare-fun b!1054771 () Bool)

(declare-fun res!703717 () Bool)

(declare-fun e!599310 () Bool)

(assert (=> b!1054771 (=> (not res!703717) (not e!599310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054771 (= res!703717 (validKeyInArray!0 k!2747))))

(declare-fun b!1054772 () Bool)

(declare-fun e!599314 () Bool)

(assert (=> b!1054772 (= e!599310 e!599314)))

(declare-fun res!703714 () Bool)

(assert (=> b!1054772 (=> (not res!703714) (not e!599314))))

(declare-fun lt!465551 () array!66534)

(declare-fun arrayContainsKey!0 (array!66534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054772 (= res!703714 (arrayContainsKey!0 lt!465551 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054772 (= lt!465551 (array!66535 (store (arr!31999 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32535 a!3488)))))

(declare-fun b!1054773 () Bool)

(declare-fun e!599313 () Bool)

(assert (=> b!1054773 (= e!599313 (arrayContainsKey!0 a!3488 k!2747 lt!465552))))

(declare-fun b!1054774 () Bool)

(assert (=> b!1054774 (= e!599314 e!599312)))

(declare-fun res!703712 () Bool)

(assert (=> b!1054774 (=> (not res!703712) (not e!599312))))

(assert (=> b!1054774 (= res!703712 (not (= lt!465552 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66534 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054774 (= lt!465552 (arrayScanForKey!0 lt!465551 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054775 () Bool)

(declare-fun res!703710 () Bool)

(assert (=> b!1054775 (=> (not res!703710) (not e!599310))))

(assert (=> b!1054775 (= res!703710 (= (select (arr!31999 a!3488) i!1381) k!2747))))

(declare-fun b!1054776 () Bool)

(declare-fun res!703713 () Bool)

(assert (=> b!1054776 (=> (not res!703713) (not e!599310))))

(declare-datatypes ((List!22311 0))(
  ( (Nil!22308) (Cons!22307 (h!23516 (_ BitVec 64)) (t!31618 List!22311)) )
))
(declare-fun arrayNoDuplicates!0 (array!66534 (_ BitVec 32) List!22311) Bool)

(assert (=> b!1054776 (= res!703713 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22308))))

(declare-fun b!1054777 () Bool)

(assert (=> b!1054777 (= e!599309 (bvslt (bvadd #b00000000000000000000000000000001 i!1381) (size!32535 a!3488)))))

(assert (=> b!1054777 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34556 0))(
  ( (Unit!34557) )
))
(declare-fun lt!465549 () Unit!34556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66534 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34556)

(assert (=> b!1054777 (= lt!465549 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465552 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1054777 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22308)))

(declare-fun lt!465550 () Unit!34556)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66534 (_ BitVec 32) (_ BitVec 32)) Unit!34556)

(assert (=> b!1054777 (= lt!465550 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!703718 () Bool)

(assert (=> start!92874 (=> (not res!703718) (not e!599310))))

(assert (=> start!92874 (= res!703718 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32535 a!3488)) (bvslt (size!32535 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92874 e!599310))

(assert (=> start!92874 true))

(declare-fun array_inv!24779 (array!66534) Bool)

(assert (=> start!92874 (array_inv!24779 a!3488)))

(declare-fun b!1054778 () Bool)

(assert (=> b!1054778 (= e!599311 e!599313)))

(declare-fun res!703716 () Bool)

(assert (=> b!1054778 (=> res!703716 e!599313)))

(assert (=> b!1054778 (= res!703716 (bvsle lt!465552 i!1381))))

(assert (= (and start!92874 res!703718) b!1054776))

(assert (= (and b!1054776 res!703713) b!1054771))

(assert (= (and b!1054771 res!703717) b!1054775))

(assert (= (and b!1054775 res!703710) b!1054772))

(assert (= (and b!1054772 res!703714) b!1054774))

(assert (= (and b!1054774 res!703712) b!1054770))

(assert (= (and b!1054770 res!703711) b!1054778))

(assert (= (and b!1054778 (not res!703716)) b!1054773))

(assert (= (and b!1054770 (not res!703715)) b!1054777))

(declare-fun m!974813 () Bool)

(assert (=> b!1054771 m!974813))

(declare-fun m!974815 () Bool)

(assert (=> b!1054775 m!974815))

(declare-fun m!974817 () Bool)

(assert (=> b!1054772 m!974817))

(declare-fun m!974819 () Bool)

(assert (=> b!1054772 m!974819))

(declare-fun m!974821 () Bool)

(assert (=> b!1054776 m!974821))

(declare-fun m!974823 () Bool)

(assert (=> b!1054777 m!974823))

(declare-fun m!974825 () Bool)

(assert (=> b!1054777 m!974825))

(declare-fun m!974827 () Bool)

(assert (=> b!1054777 m!974827))

(declare-fun m!974829 () Bool)

(assert (=> b!1054777 m!974829))

(declare-fun m!974831 () Bool)

(assert (=> b!1054773 m!974831))

(assert (=> b!1054770 m!974819))

(declare-fun m!974833 () Bool)

(assert (=> b!1054770 m!974833))

(declare-fun m!974835 () Bool)

(assert (=> start!92874 m!974835))

(declare-fun m!974837 () Bool)

(assert (=> b!1054774 m!974837))

(push 1)

(assert (not b!1054773))

(assert (not b!1054777))

(assert (not b!1054774))

(assert (not b!1054771))

(assert (not start!92874))

(assert (not b!1054772))

(assert (not b!1054776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128025 () Bool)

(declare-fun res!703795 () Bool)

(declare-fun e!599383 () Bool)

(assert (=> d!128025 (=> res!703795 e!599383)))

(assert (=> d!128025 (= res!703795 (= (select (arr!31999 a!3488) lt!465552) k!2747))))

(assert (=> d!128025 (= (arrayContainsKey!0 a!3488 k!2747 lt!465552) e!599383)))

(declare-fun b!1054863 () Bool)

(declare-fun e!599384 () Bool)

(assert (=> b!1054863 (= e!599383 e!599384)))

(declare-fun res!703796 () Bool)

(assert (=> b!1054863 (=> (not res!703796) (not e!599384))))

(assert (=> b!1054863 (= res!703796 (bvslt (bvadd lt!465552 #b00000000000000000000000000000001) (size!32535 a!3488)))))

(declare-fun b!1054864 () Bool)

(assert (=> b!1054864 (= e!599384 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!465552 #b00000000000000000000000000000001)))))

(assert (= (and d!128025 (not res!703795)) b!1054863))

(assert (= (and b!1054863 res!703796) b!1054864))

(declare-fun m!974911 () Bool)

(assert (=> d!128025 m!974911))

(declare-fun m!974913 () Bool)

(assert (=> b!1054864 m!974913))

(assert (=> b!1054773 d!128025))

(declare-fun d!128031 () Bool)

(declare-fun res!703797 () Bool)

(declare-fun e!599385 () Bool)

(assert (=> d!128031 (=> res!703797 e!599385)))

(assert (=> d!128031 (= res!703797 (= (select (arr!31999 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k!2747))))

(assert (=> d!128031 (= (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!599385)))

(declare-fun b!1054865 () Bool)

(declare-fun e!599386 () Bool)

(assert (=> b!1054865 (= e!599385 e!599386)))

(declare-fun res!703798 () Bool)

(assert (=> b!1054865 (=> (not res!703798) (not e!599386))))

(assert (=> b!1054865 (= res!703798 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32535 a!3488)))))

(declare-fun b!1054866 () Bool)

(assert (=> b!1054866 (= e!599386 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128031 (not res!703797)) b!1054865))

(assert (= (and b!1054865 res!703798) b!1054866))

(declare-fun m!974915 () Bool)

(assert (=> d!128031 m!974915))

(declare-fun m!974917 () Bool)

(assert (=> b!1054866 m!974917))

(assert (=> b!1054777 d!128031))

(declare-fun d!128033 () Bool)

(assert (=> d!128033 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465585 () Unit!34556)

(declare-fun choose!114 (array!66534 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34556)

(assert (=> d!128033 (= lt!465585 (choose!114 a!3488 k!2747 lt!465552 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!128033 (bvsge lt!465552 #b00000000000000000000000000000000)))

(assert (=> d!128033 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465552 (bvadd #b00000000000000000000000000000001 i!1381)) lt!465585)))

(declare-fun bs!30915 () Bool)

(assert (= bs!30915 d!128033))

(assert (=> bs!30915 m!974823))

(declare-fun m!974921 () Bool)

(assert (=> bs!30915 m!974921))

(assert (=> b!1054777 d!128033))

(declare-fun c!107002 () Bool)

(declare-fun call!44780 () Bool)

(declare-fun bm!44777 () Bool)

(assert (=> bm!44777 (= call!44780 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!107002 (Cons!22307 (select (arr!31999 a!3488) i!1381) Nil!22308) Nil!22308)))))

(declare-fun b!1054898 () Bool)

(declare-fun e!599410 () Bool)

(assert (=> b!1054898 (= e!599410 call!44780)))

(declare-fun b!1054899 () Bool)

(declare-fun e!599411 () Bool)

(declare-fun contains!6176 (List!22311 (_ BitVec 64)) Bool)

(assert (=> b!1054899 (= e!599411 (contains!6176 Nil!22308 (select (arr!31999 a!3488) i!1381)))))

(declare-fun b!1054900 () Bool)

(declare-fun e!599412 () Bool)

(declare-fun e!599413 () Bool)

(assert (=> b!1054900 (= e!599412 e!599413)))

(declare-fun res!703814 () Bool)

(assert (=> b!1054900 (=> (not res!703814) (not e!599413))))

(assert (=> b!1054900 (= res!703814 (not e!599411))))

(declare-fun res!703815 () Bool)

(assert (=> b!1054900 (=> (not res!703815) (not e!599411))))

(assert (=> b!1054900 (= res!703815 (validKeyInArray!0 (select (arr!31999 a!3488) i!1381)))))

(declare-fun b!1054901 () Bool)

(assert (=> b!1054901 (= e!599413 e!599410)))

(assert (=> b!1054901 (= c!107002 (validKeyInArray!0 (select (arr!31999 a!3488) i!1381)))))

(declare-fun b!1054902 () Bool)

(assert (=> b!1054902 (= e!599410 call!44780)))

(declare-fun d!128041 () Bool)

(declare-fun res!703816 () Bool)

(assert (=> d!128041 (=> res!703816 e!599412)))

(assert (=> d!128041 (= res!703816 (bvsge i!1381 (size!32535 a!3488)))))

(assert (=> d!128041 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22308) e!599412)))

(assert (= (and d!128041 (not res!703816)) b!1054900))

(assert (= (and b!1054900 res!703815) b!1054899))

(assert (= (and b!1054900 res!703814) b!1054901))

(assert (= (and b!1054901 c!107002) b!1054902))

(assert (= (and b!1054901 (not c!107002)) b!1054898))

(assert (= (or b!1054902 b!1054898) bm!44777))

(assert (=> bm!44777 m!974815))

(declare-fun m!974937 () Bool)

(assert (=> bm!44777 m!974937))

(assert (=> b!1054899 m!974815))

(assert (=> b!1054899 m!974815))

(declare-fun m!974939 () Bool)

(assert (=> b!1054899 m!974939))

(assert (=> b!1054900 m!974815))

(assert (=> b!1054900 m!974815))

(declare-fun m!974941 () Bool)

(assert (=> b!1054900 m!974941))

(assert (=> b!1054901 m!974815))

(assert (=> b!1054901 m!974815))

(assert (=> b!1054901 m!974941))

(assert (=> b!1054777 d!128041))

(declare-fun d!128047 () Bool)

(assert (=> d!128047 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22308)))

(declare-fun lt!465591 () Unit!34556)

(declare-fun choose!39 (array!66534 (_ BitVec 32) (_ BitVec 32)) Unit!34556)

(assert (=> d!128047 (= lt!465591 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!128047 (bvslt (size!32535 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128047 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!465591)))

(declare-fun bs!30916 () Bool)

(assert (= bs!30916 d!128047))

(assert (=> bs!30916 m!974827))

(declare-fun m!974953 () Bool)

(assert (=> bs!30916 m!974953))

(assert (=> b!1054777 d!128047))

(declare-fun d!128055 () Bool)

(declare-fun res!703827 () Bool)

(declare-fun e!599424 () Bool)

(assert (=> d!128055 (=> res!703827 e!599424)))

(assert (=> d!128055 (= res!703827 (= (select (arr!31999 lt!465551) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128055 (= (arrayContainsKey!0 lt!465551 k!2747 #b00000000000000000000000000000000) e!599424)))

(declare-fun b!1054913 () Bool)

(declare-fun e!599425 () Bool)

(assert (=> b!1054913 (= e!599424 e!599425)))

(declare-fun res!703828 () Bool)

(assert (=> b!1054913 (=> (not res!703828) (not e!599425))))

(assert (=> b!1054913 (= res!703828 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32535 lt!465551)))))

(declare-fun b!1054914 () Bool)

(assert (=> b!1054914 (= e!599425 (arrayContainsKey!0 lt!465551 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128055 (not res!703827)) b!1054913))

(assert (= (and b!1054913 res!703828) b!1054914))

(declare-fun m!974955 () Bool)

(assert (=> d!128055 m!974955))

(declare-fun m!974957 () Bool)

(assert (=> b!1054914 m!974957))

(assert (=> b!1054772 d!128055))

(declare-fun bm!44778 () Bool)

(declare-fun call!44781 () Bool)

(declare-fun c!107003 () Bool)

(assert (=> bm!44778 (= call!44781 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107003 (Cons!22307 (select (arr!31999 a!3488) #b00000000000000000000000000000000) Nil!22308) Nil!22308)))))

(declare-fun b!1054915 () Bool)

(declare-fun e!599426 () Bool)

(assert (=> b!1054915 (= e!599426 call!44781)))

(declare-fun b!1054916 () Bool)

(declare-fun e!599427 () Bool)

(assert (=> b!1054916 (= e!599427 (contains!6176 Nil!22308 (select (arr!31999 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054917 () Bool)

(declare-fun e!599428 () Bool)

(declare-fun e!599429 () Bool)

(assert (=> b!1054917 (= e!599428 e!599429)))

(declare-fun res!703829 () Bool)

(assert (=> b!1054917 (=> (not res!703829) (not e!599429))))

(assert (=> b!1054917 (= res!703829 (not e!599427))))

(declare-fun res!703830 () Bool)

(assert (=> b!1054917 (=> (not res!703830) (not e!599427))))

(assert (=> b!1054917 (= res!703830 (validKeyInArray!0 (select (arr!31999 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054918 () Bool)

(assert (=> b!1054918 (= e!599429 e!599426)))

(assert (=> b!1054918 (= c!107003 (validKeyInArray!0 (select (arr!31999 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054919 () Bool)

(assert (=> b!1054919 (= e!599426 call!44781)))

(declare-fun d!128057 () Bool)

(declare-fun res!703831 () Bool)

(assert (=> d!128057 (=> res!703831 e!599428)))

(assert (=> d!128057 (= res!703831 (bvsge #b00000000000000000000000000000000 (size!32535 a!3488)))))

(assert (=> d!128057 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22308) e!599428)))

(assert (= (and d!128057 (not res!703831)) b!1054917))

(assert (= (and b!1054917 res!703830) b!1054916))

(assert (= (and b!1054917 res!703829) b!1054918))

(assert (= (and b!1054918 c!107003) b!1054919))

(assert (= (and b!1054918 (not c!107003)) b!1054915))

(assert (= (or b!1054919 b!1054915) bm!44778))

(declare-fun m!974959 () Bool)

(assert (=> bm!44778 m!974959))

(declare-fun m!974961 () Bool)

(assert (=> bm!44778 m!974961))

(assert (=> b!1054916 m!974959))

(assert (=> b!1054916 m!974959))

(declare-fun m!974963 () Bool)

(assert (=> b!1054916 m!974963))

(assert (=> b!1054917 m!974959))

(assert (=> b!1054917 m!974959))

(declare-fun m!974965 () Bool)

(assert (=> b!1054917 m!974965))

(assert (=> b!1054918 m!974959))

(assert (=> b!1054918 m!974959))

(assert (=> b!1054918 m!974965))

(assert (=> b!1054776 d!128057))

(declare-fun d!128059 () Bool)

(assert (=> d!128059 (= (array_inv!24779 a!3488) (bvsge (size!32535 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92874 d!128059))

(declare-fun d!128063 () Bool)

(assert (=> d!128063 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1054771 d!128063))

(declare-fun d!128067 () Bool)

(declare-fun lt!465600 () (_ BitVec 32))

(assert (=> d!128067 (and (or (bvslt lt!465600 #b00000000000000000000000000000000) (bvsge lt!465600 (size!32535 lt!465551)) (and (bvsge lt!465600 #b00000000000000000000000000000000) (bvslt lt!465600 (size!32535 lt!465551)))) (bvsge lt!465600 #b00000000000000000000000000000000) (bvslt lt!465600 (size!32535 lt!465551)) (= (select (arr!31999 lt!465551) lt!465600) k!2747))))

(declare-fun e!599436 () (_ BitVec 32))

(assert (=> d!128067 (= lt!465600 e!599436)))

(declare-fun c!107007 () Bool)

(assert (=> d!128067 (= c!107007 (= (select (arr!31999 lt!465551) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32535 lt!465551)) (bvslt (size!32535 lt!465551) #b01111111111111111111111111111111))))

(assert (=> d!128067 (= (arrayScanForKey!0 lt!465551 k!2747 #b00000000000000000000000000000000) lt!465600)))

(declare-fun b!1054929 () Bool)

(assert (=> b!1054929 (= e!599436 #b00000000000000000000000000000000)))

(declare-fun b!1054930 () Bool)

(assert (=> b!1054930 (= e!599436 (arrayScanForKey!0 lt!465551 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128067 c!107007) b!1054929))

(assert (= (and d!128067 (not c!107007)) b!1054930))

(declare-fun m!974977 () Bool)

(assert (=> d!128067 m!974977))

(assert (=> d!128067 m!974955))

(declare-fun m!974979 () Bool)

(assert (=> b!1054930 m!974979))

(assert (=> b!1054774 d!128067))

(push 1)

(assert (not b!1054864))

(assert (not bm!44778))

(assert (not b!1054917))

(assert (not b!1054899))

(assert (not bm!44777))

(assert (not b!1054918))

(assert (not b!1054914))

(assert (not d!128033))

(assert (not b!1054866))

(assert (not b!1054901))

(assert (not b!1054900))

(assert (not b!1054916))

(assert (not b!1054930))

(assert (not d!128047))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

