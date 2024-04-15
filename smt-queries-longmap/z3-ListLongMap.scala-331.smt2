; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6034 () Bool)

(assert start!6034)

(declare-fun b_free!1447 () Bool)

(declare-fun b_next!1447 () Bool)

(assert (=> start!6034 (= b_free!1447 (not b_next!1447))))

(declare-fun tp!5858 () Bool)

(declare-fun b_and!2545 () Bool)

(assert (=> start!6034 (= tp!5858 b_and!2545)))

(declare-fun res!25006 () Bool)

(declare-fun e!26515 () Bool)

(assert (=> start!6034 (=> (not res!25006) (not e!26515))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6034 (= res!25006 (validMask!0 mask!853))))

(assert (=> start!6034 e!26515))

(assert (=> start!6034 true))

(assert (=> start!6034 tp!5858))

(declare-fun b!41947 () Bool)

(declare-fun e!26516 () Bool)

(assert (=> b!41947 (= e!26515 (not e!26516))))

(declare-fun res!25005 () Bool)

(assert (=> b!41947 (=> res!25005 e!26516)))

(declare-datatypes ((V!2209 0))(
  ( (V!2210 (val!957 Int)) )
))
(declare-datatypes ((tuple2!1572 0))(
  ( (tuple2!1573 (_1!797 (_ BitVec 64)) (_2!797 V!2209)) )
))
(declare-datatypes ((List!1129 0))(
  ( (Nil!1126) (Cons!1125 (h!1702 tuple2!1572) (t!4071 List!1129)) )
))
(declare-datatypes ((ListLongMap!1137 0))(
  ( (ListLongMap!1138 (toList!584 List!1129)) )
))
(declare-fun lt!17231 () ListLongMap!1137)

(assert (=> b!41947 (= res!25005 (= lt!17231 (ListLongMap!1138 Nil!1126)))))

(declare-fun lt!17234 () V!2209)

(declare-datatypes ((array!2733 0))(
  ( (array!2734 (arr!1310 (Array (_ BitVec 32) (_ BitVec 64))) (size!1468 (_ BitVec 32))) )
))
(declare-fun lt!17233 () array!2733)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!671 0))(
  ( (ValueCellFull!671 (v!2039 V!2209)) (EmptyCell!671) )
))
(declare-datatypes ((array!2735 0))(
  ( (array!2736 (arr!1311 (Array (_ BitVec 32) ValueCell!671)) (size!1469 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!322 0))(
  ( (LongMapFixedSize!323 (defaultEntry!1854 Int) (mask!5287 (_ BitVec 32)) (extraKeys!1745 (_ BitVec 32)) (zeroValue!1772 V!2209) (minValue!1772 V!2209) (_size!210 (_ BitVec 32)) (_keys!3366 array!2733) (_values!1837 array!2735) (_vacant!210 (_ BitVec 32))) )
))
(declare-fun map!760 (LongMapFixedSize!322) ListLongMap!1137)

(assert (=> b!41947 (= lt!17231 (map!760 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17234 lt!17234 #b00000000000000000000000000000000 lt!17233 (array!2736 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1130 0))(
  ( (Nil!1127) (Cons!1126 (h!1703 (_ BitVec 64)) (t!4072 List!1130)) )
))
(declare-fun arrayNoDuplicates!0 (array!2733 (_ BitVec 32) List!1130) Bool)

(assert (=> b!41947 (arrayNoDuplicates!0 lt!17233 #b00000000000000000000000000000000 Nil!1127)))

(declare-datatypes ((Unit!1090 0))(
  ( (Unit!1091) )
))
(declare-fun lt!17232 () Unit!1090)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2733 (_ BitVec 32) (_ BitVec 32) List!1130) Unit!1090)

(assert (=> b!41947 (= lt!17232 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17233 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2733 (_ BitVec 32)) Bool)

(assert (=> b!41947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17233 mask!853)))

(declare-fun lt!17230 () Unit!1090)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2733 (_ BitVec 32) (_ BitVec 32)) Unit!1090)

(assert (=> b!41947 (= lt!17230 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17233 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2733 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41947 (= (arrayCountValidKeys!0 lt!17233 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17229 () Unit!1090)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2733 (_ BitVec 32) (_ BitVec 32)) Unit!1090)

(assert (=> b!41947 (= lt!17229 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17233 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41947 (= lt!17233 (array!2734 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!231 (Int (_ BitVec 64)) V!2209)

(assert (=> b!41947 (= lt!17234 (dynLambda!231 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41948 () Bool)

(declare-fun isEmpty!273 (List!1129) Bool)

(assert (=> b!41948 (= e!26516 (not (isEmpty!273 (toList!584 lt!17231))))))

(assert (= (and start!6034 res!25006) b!41947))

(assert (= (and b!41947 (not res!25005)) b!41948))

(declare-fun b_lambda!2181 () Bool)

(assert (=> (not b_lambda!2181) (not b!41947)))

(declare-fun t!4070 () Bool)

(declare-fun tb!929 () Bool)

(assert (=> (and start!6034 (= defaultEntry!470 defaultEntry!470) t!4070) tb!929))

(declare-fun result!1609 () Bool)

(declare-fun tp_is_empty!1837 () Bool)

(assert (=> tb!929 (= result!1609 tp_is_empty!1837)))

(assert (=> b!41947 t!4070))

(declare-fun b_and!2547 () Bool)

(assert (= b_and!2545 (and (=> t!4070 result!1609) b_and!2547)))

(declare-fun m!35519 () Bool)

(assert (=> start!6034 m!35519))

(declare-fun m!35521 () Bool)

(assert (=> b!41947 m!35521))

(declare-fun m!35523 () Bool)

(assert (=> b!41947 m!35523))

(declare-fun m!35525 () Bool)

(assert (=> b!41947 m!35525))

(declare-fun m!35527 () Bool)

(assert (=> b!41947 m!35527))

(declare-fun m!35529 () Bool)

(assert (=> b!41947 m!35529))

(declare-fun m!35531 () Bool)

(assert (=> b!41947 m!35531))

(declare-fun m!35533 () Bool)

(assert (=> b!41947 m!35533))

(declare-fun m!35535 () Bool)

(assert (=> b!41947 m!35535))

(declare-fun m!35537 () Bool)

(assert (=> b!41948 m!35537))

(check-sat (not b_lambda!2181) (not b!41947) (not start!6034) (not b_next!1447) b_and!2547 (not b!41948) tp_is_empty!1837)
(check-sat b_and!2547 (not b_next!1447))
(get-model)

(declare-fun b_lambda!2191 () Bool)

(assert (= b_lambda!2181 (or (and start!6034 b_free!1447) b_lambda!2191)))

(check-sat (not b!41947) (not start!6034) (not b_lambda!2191) (not b_next!1447) b_and!2547 (not b!41948) tp_is_empty!1837)
(check-sat b_and!2547 (not b_next!1447))
(get-model)

(declare-fun d!7499 () Bool)

(get-info :version)

(assert (=> d!7499 (= (isEmpty!273 (toList!584 lt!17231)) ((_ is Nil!1126) (toList!584 lt!17231)))))

(assert (=> b!41948 d!7499))

(declare-fun b!41990 () Bool)

(declare-fun e!26546 () (_ BitVec 32))

(declare-fun e!26545 () (_ BitVec 32))

(assert (=> b!41990 (= e!26546 e!26545)))

(declare-fun c!5230 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!41990 (= c!5230 (validKeyInArray!0 (select (arr!1310 lt!17233) #b00000000000000000000000000000000)))))

(declare-fun b!41991 () Bool)

(declare-fun call!3263 () (_ BitVec 32))

(assert (=> b!41991 (= e!26545 (bvadd #b00000000000000000000000000000001 call!3263))))

(declare-fun b!41992 () Bool)

(assert (=> b!41992 (= e!26546 #b00000000000000000000000000000000)))

(declare-fun b!41993 () Bool)

(assert (=> b!41993 (= e!26545 call!3263)))

(declare-fun d!7501 () Bool)

(declare-fun lt!17282 () (_ BitVec 32))

(assert (=> d!7501 (and (bvsge lt!17282 #b00000000000000000000000000000000) (bvsle lt!17282 (bvsub (size!1468 lt!17233) #b00000000000000000000000000000000)))))

(assert (=> d!7501 (= lt!17282 e!26546)))

(declare-fun c!5231 () Bool)

(assert (=> d!7501 (= c!5231 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7501 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1468 lt!17233)))))

(assert (=> d!7501 (= (arrayCountValidKeys!0 lt!17233 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17282)))

(declare-fun bm!3260 () Bool)

(assert (=> bm!3260 (= call!3263 (arrayCountValidKeys!0 lt!17233 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7501 c!5231) b!41992))

(assert (= (and d!7501 (not c!5231)) b!41990))

(assert (= (and b!41990 c!5230) b!41991))

(assert (= (and b!41990 (not c!5230)) b!41993))

(assert (= (or b!41991 b!41993) bm!3260))

(declare-fun m!35593 () Bool)

(assert (=> b!41990 m!35593))

(assert (=> b!41990 m!35593))

(declare-fun m!35595 () Bool)

(assert (=> b!41990 m!35595))

(declare-fun m!35597 () Bool)

(assert (=> bm!3260 m!35597))

(assert (=> b!41947 d!7501))

(declare-fun d!7507 () Bool)

(assert (=> d!7507 (= (arrayCountValidKeys!0 lt!17233 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17285 () Unit!1090)

(declare-fun choose!59 (array!2733 (_ BitVec 32) (_ BitVec 32)) Unit!1090)

(assert (=> d!7507 (= lt!17285 (choose!59 lt!17233 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7507 (bvslt (size!1468 lt!17233) #b01111111111111111111111111111111)))

(assert (=> d!7507 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17233 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17285)))

(declare-fun bs!1810 () Bool)

(assert (= bs!1810 d!7507))

(assert (=> bs!1810 m!35523))

(declare-fun m!35600 () Bool)

(assert (=> bs!1810 m!35600))

(assert (=> b!41947 d!7507))

(declare-fun d!7509 () Bool)

(assert (=> d!7509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17233 mask!853)))

(declare-fun lt!17294 () Unit!1090)

(declare-fun choose!34 (array!2733 (_ BitVec 32) (_ BitVec 32)) Unit!1090)

(assert (=> d!7509 (= lt!17294 (choose!34 lt!17233 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7509 (validMask!0 mask!853)))

(assert (=> d!7509 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17233 mask!853 #b00000000000000000000000000000000) lt!17294)))

(declare-fun bs!1814 () Bool)

(assert (= bs!1814 d!7509))

(assert (=> bs!1814 m!35535))

(declare-fun m!35607 () Bool)

(assert (=> bs!1814 m!35607))

(assert (=> bs!1814 m!35519))

(assert (=> b!41947 d!7509))

(declare-fun d!7517 () Bool)

(declare-fun getCurrentListMap!334 (array!2733 array!2735 (_ BitVec 32) (_ BitVec 32) V!2209 V!2209 (_ BitVec 32) Int) ListLongMap!1137)

(assert (=> d!7517 (= (map!760 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17234 lt!17234 #b00000000000000000000000000000000 lt!17233 (array!2736 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (getCurrentListMap!334 (_keys!3366 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17234 lt!17234 #b00000000000000000000000000000000 lt!17233 (array!2736 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_values!1837 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17234 lt!17234 #b00000000000000000000000000000000 lt!17233 (array!2736 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5287 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17234 lt!17234 #b00000000000000000000000000000000 lt!17233 (array!2736 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (extraKeys!1745 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17234 lt!17234 #b00000000000000000000000000000000 lt!17233 (array!2736 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (zeroValue!1772 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17234 lt!17234 #b00000000000000000000000000000000 lt!17233 (array!2736 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (minValue!1772 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17234 lt!17234 #b00000000000000000000000000000000 lt!17233 (array!2736 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1854 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17234 lt!17234 #b00000000000000000000000000000000 lt!17233 (array!2736 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun bs!1816 () Bool)

(assert (= bs!1816 d!7517))

(declare-fun m!35619 () Bool)

(assert (=> bs!1816 m!35619))

(assert (=> b!41947 d!7517))

(declare-fun b!42039 () Bool)

(declare-fun e!26577 () Bool)

(declare-fun call!3274 () Bool)

(assert (=> b!42039 (= e!26577 call!3274)))

(declare-fun b!42040 () Bool)

(declare-fun e!26578 () Bool)

(assert (=> b!42040 (= e!26578 e!26577)))

(declare-fun c!5247 () Bool)

(assert (=> b!42040 (= c!5247 (validKeyInArray!0 (select (arr!1310 lt!17233) #b00000000000000000000000000000000)))))

(declare-fun d!7523 () Bool)

(declare-fun res!25045 () Bool)

(declare-fun e!26579 () Bool)

(assert (=> d!7523 (=> res!25045 e!26579)))

(assert (=> d!7523 (= res!25045 (bvsge #b00000000000000000000000000000000 (size!1468 lt!17233)))))

(assert (=> d!7523 (= (arrayNoDuplicates!0 lt!17233 #b00000000000000000000000000000000 Nil!1127) e!26579)))

(declare-fun b!42041 () Bool)

(declare-fun e!26580 () Bool)

(declare-fun contains!550 (List!1130 (_ BitVec 64)) Bool)

(assert (=> b!42041 (= e!26580 (contains!550 Nil!1127 (select (arr!1310 lt!17233) #b00000000000000000000000000000000)))))

(declare-fun bm!3271 () Bool)

(assert (=> bm!3271 (= call!3274 (arrayNoDuplicates!0 lt!17233 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5247 (Cons!1126 (select (arr!1310 lt!17233) #b00000000000000000000000000000000) Nil!1127) Nil!1127)))))

(declare-fun b!42042 () Bool)

(assert (=> b!42042 (= e!26579 e!26578)))

(declare-fun res!25044 () Bool)

(assert (=> b!42042 (=> (not res!25044) (not e!26578))))

(assert (=> b!42042 (= res!25044 (not e!26580))))

(declare-fun res!25043 () Bool)

(assert (=> b!42042 (=> (not res!25043) (not e!26580))))

(assert (=> b!42042 (= res!25043 (validKeyInArray!0 (select (arr!1310 lt!17233) #b00000000000000000000000000000000)))))

(declare-fun b!42043 () Bool)

(assert (=> b!42043 (= e!26577 call!3274)))

(assert (= (and d!7523 (not res!25045)) b!42042))

(assert (= (and b!42042 res!25043) b!42041))

(assert (= (and b!42042 res!25044) b!42040))

(assert (= (and b!42040 c!5247) b!42039))

(assert (= (and b!42040 (not c!5247)) b!42043))

(assert (= (or b!42039 b!42043) bm!3271))

(assert (=> b!42040 m!35593))

(assert (=> b!42040 m!35593))

(assert (=> b!42040 m!35595))

(assert (=> b!42041 m!35593))

(assert (=> b!42041 m!35593))

(declare-fun m!35627 () Bool)

(assert (=> b!42041 m!35627))

(assert (=> bm!3271 m!35593))

(declare-fun m!35629 () Bool)

(assert (=> bm!3271 m!35629))

(assert (=> b!42042 m!35593))

(assert (=> b!42042 m!35593))

(assert (=> b!42042 m!35595))

(assert (=> b!41947 d!7523))

(declare-fun d!7531 () Bool)

(assert (=> d!7531 (arrayNoDuplicates!0 lt!17233 #b00000000000000000000000000000000 Nil!1127)))

(declare-fun lt!17306 () Unit!1090)

(declare-fun choose!111 (array!2733 (_ BitVec 32) (_ BitVec 32) List!1130) Unit!1090)

(assert (=> d!7531 (= lt!17306 (choose!111 lt!17233 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1127))))

(assert (=> d!7531 (= (size!1468 lt!17233) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7531 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!17233 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1127) lt!17306)))

(declare-fun bs!1818 () Bool)

(assert (= bs!1818 d!7531))

(assert (=> bs!1818 m!35531))

(declare-fun m!35631 () Bool)

(assert (=> bs!1818 m!35631))

(assert (=> b!41947 d!7531))

(declare-fun d!7533 () Bool)

(declare-fun res!25063 () Bool)

(declare-fun e!26609 () Bool)

(assert (=> d!7533 (=> res!25063 e!26609)))

(assert (=> d!7533 (= res!25063 (bvsge #b00000000000000000000000000000000 (size!1468 lt!17233)))))

(assert (=> d!7533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17233 mask!853) e!26609)))

(declare-fun b!42080 () Bool)

(declare-fun e!26608 () Bool)

(assert (=> b!42080 (= e!26609 e!26608)))

(declare-fun c!5258 () Bool)

(assert (=> b!42080 (= c!5258 (validKeyInArray!0 (select (arr!1310 lt!17233) #b00000000000000000000000000000000)))))

(declare-fun b!42081 () Bool)

(declare-fun call!3284 () Bool)

(assert (=> b!42081 (= e!26608 call!3284)))

(declare-fun b!42082 () Bool)

(declare-fun e!26607 () Bool)

(assert (=> b!42082 (= e!26608 e!26607)))

(declare-fun lt!17331 () (_ BitVec 64))

(assert (=> b!42082 (= lt!17331 (select (arr!1310 lt!17233) #b00000000000000000000000000000000))))

(declare-fun lt!17333 () Unit!1090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2733 (_ BitVec 64) (_ BitVec 32)) Unit!1090)

(assert (=> b!42082 (= lt!17333 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17233 lt!17331 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42082 (arrayContainsKey!0 lt!17233 lt!17331 #b00000000000000000000000000000000)))

(declare-fun lt!17332 () Unit!1090)

(assert (=> b!42082 (= lt!17332 lt!17333)))

(declare-fun res!25062 () Bool)

(declare-datatypes ((SeekEntryResult!185 0))(
  ( (MissingZero!185 (index!2862 (_ BitVec 32))) (Found!185 (index!2863 (_ BitVec 32))) (Intermediate!185 (undefined!997 Bool) (index!2864 (_ BitVec 32)) (x!8013 (_ BitVec 32))) (Undefined!185) (MissingVacant!185 (index!2865 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2733 (_ BitVec 32)) SeekEntryResult!185)

(assert (=> b!42082 (= res!25062 (= (seekEntryOrOpen!0 (select (arr!1310 lt!17233) #b00000000000000000000000000000000) lt!17233 mask!853) (Found!185 #b00000000000000000000000000000000)))))

(assert (=> b!42082 (=> (not res!25062) (not e!26607))))

(declare-fun bm!3281 () Bool)

(assert (=> bm!3281 (= call!3284 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17233 mask!853))))

(declare-fun b!42083 () Bool)

(assert (=> b!42083 (= e!26607 call!3284)))

(assert (= (and d!7533 (not res!25063)) b!42080))

(assert (= (and b!42080 c!5258) b!42082))

(assert (= (and b!42080 (not c!5258)) b!42081))

(assert (= (and b!42082 res!25062) b!42083))

(assert (= (or b!42083 b!42081) bm!3281))

(assert (=> b!42080 m!35593))

(assert (=> b!42080 m!35593))

(assert (=> b!42080 m!35595))

(assert (=> b!42082 m!35593))

(declare-fun m!35649 () Bool)

(assert (=> b!42082 m!35649))

(declare-fun m!35651 () Bool)

(assert (=> b!42082 m!35651))

(assert (=> b!42082 m!35593))

(declare-fun m!35653 () Bool)

(assert (=> b!42082 m!35653))

(declare-fun m!35655 () Bool)

(assert (=> bm!3281 m!35655))

(assert (=> b!41947 d!7533))

(declare-fun d!7541 () Bool)

(assert (=> d!7541 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6034 d!7541))

(check-sat (not d!7509) (not b!42080) tp_is_empty!1837 (not bm!3271) (not b!41990) (not bm!3281) (not bm!3260) (not b!42042) (not d!7531) (not b!42082) (not b!42040) (not b_lambda!2191) (not d!7517) (not b_next!1447) (not b!42041) b_and!2547 (not d!7507))
(check-sat b_and!2547 (not b_next!1447))
