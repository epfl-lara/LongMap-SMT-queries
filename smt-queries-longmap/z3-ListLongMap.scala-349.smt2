; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6376 () Bool)

(assert start!6376)

(declare-fun b_free!1471 () Bool)

(declare-fun b_next!1471 () Bool)

(assert (=> start!6376 (= b_free!1471 (not b_next!1471))))

(declare-fun tp!5894 () Bool)

(declare-fun b_and!2593 () Bool)

(assert (=> start!6376 (= tp!5894 b_and!2593)))

(declare-fun res!25408 () Bool)

(declare-fun e!27058 () Bool)

(assert (=> start!6376 (=> (not res!25408) (not e!27058))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6376 (= res!25408 (validMask!0 mask!853))))

(assert (=> start!6376 e!27058))

(assert (=> start!6376 true))

(assert (=> start!6376 tp!5894))

(declare-fun b!42696 () Bool)

(declare-fun e!27059 () Bool)

(assert (=> b!42696 (= e!27058 (not e!27059))))

(declare-fun res!25407 () Bool)

(assert (=> b!42696 (=> res!25407 e!27059)))

(declare-datatypes ((V!2269 0))(
  ( (V!2270 (val!969 Int)) )
))
(declare-datatypes ((tuple2!1596 0))(
  ( (tuple2!1597 (_1!809 (_ BitVec 64)) (_2!809 V!2269)) )
))
(declare-datatypes ((List!1159 0))(
  ( (Nil!1156) (Cons!1155 (h!1732 tuple2!1596) (t!4125 List!1159)) )
))
(declare-datatypes ((ListLongMap!1161 0))(
  ( (ListLongMap!1162 (toList!596 List!1159)) )
))
(declare-fun lt!18001 () ListLongMap!1161)

(assert (=> b!42696 (= res!25407 (= lt!18001 (ListLongMap!1162 Nil!1156)))))

(declare-datatypes ((array!2841 0))(
  ( (array!2842 (arr!1364 (Array (_ BitVec 32) (_ BitVec 64))) (size!1543 (_ BitVec 32))) )
))
(declare-fun lt!18005 () array!2841)

(declare-fun lt!18003 () V!2269)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!683 0))(
  ( (ValueCellFull!683 (v!2057 V!2269)) (EmptyCell!683) )
))
(declare-datatypes ((array!2843 0))(
  ( (array!2844 (arr!1365 (Array (_ BitVec 32) ValueCell!683)) (size!1544 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!346 0))(
  ( (LongMapFixedSize!347 (defaultEntry!1866 Int) (mask!5395 (_ BitVec 32)) (extraKeys!1757 (_ BitVec 32)) (zeroValue!1784 V!2269) (minValue!1784 V!2269) (_size!222 (_ BitVec 32)) (_keys!3408 array!2841) (_values!1849 array!2843) (_vacant!222 (_ BitVec 32))) )
))
(declare-fun map!808 (LongMapFixedSize!346) ListLongMap!1161)

(assert (=> b!42696 (= lt!18001 (map!808 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18003 lt!18003 #b00000000000000000000000000000000 lt!18005 (array!2844 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1160 0))(
  ( (Nil!1157) (Cons!1156 (h!1733 (_ BitVec 64)) (t!4126 List!1160)) )
))
(declare-fun arrayNoDuplicates!0 (array!2841 (_ BitVec 32) List!1160) Bool)

(assert (=> b!42696 (arrayNoDuplicates!0 lt!18005 #b00000000000000000000000000000000 Nil!1157)))

(declare-datatypes ((Unit!1174 0))(
  ( (Unit!1175) )
))
(declare-fun lt!18004 () Unit!1174)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2841 (_ BitVec 32) (_ BitVec 32) List!1160) Unit!1174)

(assert (=> b!42696 (= lt!18004 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18005 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2841 (_ BitVec 32)) Bool)

(assert (=> b!42696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18005 mask!853)))

(declare-fun lt!18002 () Unit!1174)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2841 (_ BitVec 32) (_ BitVec 32)) Unit!1174)

(assert (=> b!42696 (= lt!18002 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18005 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2841 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42696 (= (arrayCountValidKeys!0 lt!18005 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18000 () Unit!1174)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2841 (_ BitVec 32) (_ BitVec 32)) Unit!1174)

(assert (=> b!42696 (= lt!18000 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18005 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42696 (= lt!18005 (array!2842 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!243 (Int (_ BitVec 64)) V!2269)

(assert (=> b!42696 (= lt!18003 (dynLambda!243 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42697 () Bool)

(declare-fun res!25406 () Bool)

(assert (=> b!42697 (=> res!25406 e!27059)))

(declare-fun isEmpty!276 (List!1159) Bool)

(assert (=> b!42697 (= res!25406 (isEmpty!276 (toList!596 lt!18001)))))

(declare-fun b!42698 () Bool)

(assert (=> b!42698 (= e!27059 (bvsge mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!6376 res!25408) b!42696))

(assert (= (and b!42696 (not res!25407)) b!42697))

(assert (= (and b!42697 (not res!25406)) b!42698))

(declare-fun b_lambda!2211 () Bool)

(assert (=> (not b_lambda!2211) (not b!42696)))

(declare-fun t!4124 () Bool)

(declare-fun tb!953 () Bool)

(assert (=> (and start!6376 (= defaultEntry!470 defaultEntry!470) t!4124) tb!953))

(declare-fun result!1657 () Bool)

(declare-fun tp_is_empty!1861 () Bool)

(assert (=> tb!953 (= result!1657 tp_is_empty!1861)))

(assert (=> b!42696 t!4124))

(declare-fun b_and!2595 () Bool)

(assert (= b_and!2593 (and (=> t!4124 result!1657) b_and!2595)))

(declare-fun m!36437 () Bool)

(assert (=> start!6376 m!36437))

(declare-fun m!36439 () Bool)

(assert (=> b!42696 m!36439))

(declare-fun m!36441 () Bool)

(assert (=> b!42696 m!36441))

(declare-fun m!36443 () Bool)

(assert (=> b!42696 m!36443))

(declare-fun m!36445 () Bool)

(assert (=> b!42696 m!36445))

(declare-fun m!36447 () Bool)

(assert (=> b!42696 m!36447))

(declare-fun m!36449 () Bool)

(assert (=> b!42696 m!36449))

(declare-fun m!36451 () Bool)

(assert (=> b!42696 m!36451))

(declare-fun m!36453 () Bool)

(assert (=> b!42696 m!36453))

(declare-fun m!36455 () Bool)

(assert (=> b!42697 m!36455))

(check-sat (not b!42696) (not b!42697) b_and!2595 (not b_next!1471) (not b_lambda!2211) tp_is_empty!1861 (not start!6376))
(check-sat b_and!2595 (not b_next!1471))
(get-model)

(declare-fun b_lambda!2221 () Bool)

(assert (= b_lambda!2211 (or (and start!6376 b_free!1471) b_lambda!2221)))

(check-sat (not b!42696) (not b_lambda!2221) (not b!42697) b_and!2595 (not b_next!1471) tp_is_empty!1861 (not start!6376))
(check-sat b_and!2595 (not b_next!1471))
(get-model)

(declare-fun d!7779 () Bool)

(assert (=> d!7779 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6376 d!7779))

(declare-fun d!7787 () Bool)

(get-info :version)

(assert (=> d!7787 (= (isEmpty!276 (toList!596 lt!18001)) ((_ is Nil!1156) (toList!596 lt!18001)))))

(assert (=> b!42697 d!7787))

(declare-fun b!42758 () Bool)

(declare-fun e!27098 () (_ BitVec 32))

(declare-fun call!3374 () (_ BitVec 32))

(assert (=> b!42758 (= e!27098 (bvadd #b00000000000000000000000000000001 call!3374))))

(declare-fun d!7789 () Bool)

(declare-fun lt!18056 () (_ BitVec 32))

(assert (=> d!7789 (and (bvsge lt!18056 #b00000000000000000000000000000000) (bvsle lt!18056 (bvsub (size!1543 lt!18005) #b00000000000000000000000000000000)))))

(declare-fun e!27097 () (_ BitVec 32))

(assert (=> d!7789 (= lt!18056 e!27097)))

(declare-fun c!5395 () Bool)

(assert (=> d!7789 (= c!5395 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7789 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1543 lt!18005)))))

(assert (=> d!7789 (= (arrayCountValidKeys!0 lt!18005 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18056)))

(declare-fun b!42759 () Bool)

(assert (=> b!42759 (= e!27097 #b00000000000000000000000000000000)))

(declare-fun b!42760 () Bool)

(assert (=> b!42760 (= e!27098 call!3374)))

(declare-fun bm!3371 () Bool)

(assert (=> bm!3371 (= call!3374 (arrayCountValidKeys!0 lt!18005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42761 () Bool)

(assert (=> b!42761 (= e!27097 e!27098)))

(declare-fun c!5396 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42761 (= c!5396 (validKeyInArray!0 (select (arr!1364 lt!18005) #b00000000000000000000000000000000)))))

(assert (= (and d!7789 c!5395) b!42759))

(assert (= (and d!7789 (not c!5395)) b!42761))

(assert (= (and b!42761 c!5396) b!42758))

(assert (= (and b!42761 (not c!5396)) b!42760))

(assert (= (or b!42758 b!42760) bm!3371))

(declare-fun m!36523 () Bool)

(assert (=> bm!3371 m!36523))

(declare-fun m!36525 () Bool)

(assert (=> b!42761 m!36525))

(assert (=> b!42761 m!36525))

(declare-fun m!36527 () Bool)

(assert (=> b!42761 m!36527))

(assert (=> b!42696 d!7789))

(declare-fun d!7795 () Bool)

(assert (=> d!7795 (arrayNoDuplicates!0 lt!18005 #b00000000000000000000000000000000 Nil!1157)))

(declare-fun lt!18064 () Unit!1174)

(declare-fun choose!111 (array!2841 (_ BitVec 32) (_ BitVec 32) List!1160) Unit!1174)

(assert (=> d!7795 (= lt!18064 (choose!111 lt!18005 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1157))))

(assert (=> d!7795 (= (size!1543 lt!18005) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7795 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!18005 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1157) lt!18064)))

(declare-fun bs!1904 () Bool)

(assert (= bs!1904 d!7795))

(assert (=> bs!1904 m!36443))

(declare-fun m!36531 () Bool)

(assert (=> bs!1904 m!36531))

(assert (=> b!42696 d!7795))

(declare-fun d!7799 () Bool)

(assert (=> d!7799 (= (arrayCountValidKeys!0 lt!18005 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18069 () Unit!1174)

(declare-fun choose!59 (array!2841 (_ BitVec 32) (_ BitVec 32)) Unit!1174)

(assert (=> d!7799 (= lt!18069 (choose!59 lt!18005 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7799 (bvslt (size!1543 lt!18005) #b01111111111111111111111111111111)))

(assert (=> d!7799 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18005 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18069)))

(declare-fun bs!1905 () Bool)

(assert (= bs!1905 d!7799))

(assert (=> bs!1905 m!36439))

(declare-fun m!36533 () Bool)

(assert (=> bs!1905 m!36533))

(assert (=> b!42696 d!7799))

(declare-fun bm!3381 () Bool)

(declare-fun call!3384 () Bool)

(assert (=> bm!3381 (= call!3384 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18005 mask!853))))

(declare-fun b!42800 () Bool)

(declare-fun e!27125 () Bool)

(assert (=> b!42800 (= e!27125 call!3384)))

(declare-fun b!42801 () Bool)

(declare-fun e!27126 () Bool)

(assert (=> b!42801 (= e!27126 call!3384)))

(declare-fun d!7801 () Bool)

(declare-fun res!25456 () Bool)

(declare-fun e!27127 () Bool)

(assert (=> d!7801 (=> res!25456 e!27127)))

(assert (=> d!7801 (= res!25456 (bvsge #b00000000000000000000000000000000 (size!1543 lt!18005)))))

(assert (=> d!7801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18005 mask!853) e!27127)))

(declare-fun b!42802 () Bool)

(assert (=> b!42802 (= e!27125 e!27126)))

(declare-fun lt!18087 () (_ BitVec 64))

(assert (=> b!42802 (= lt!18087 (select (arr!1364 lt!18005) #b00000000000000000000000000000000))))

(declare-fun lt!18089 () Unit!1174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2841 (_ BitVec 64) (_ BitVec 32)) Unit!1174)

(assert (=> b!42802 (= lt!18089 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18005 lt!18087 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42802 (arrayContainsKey!0 lt!18005 lt!18087 #b00000000000000000000000000000000)))

(declare-fun lt!18088 () Unit!1174)

(assert (=> b!42802 (= lt!18088 lt!18089)))

(declare-fun res!25457 () Bool)

(declare-datatypes ((SeekEntryResult!197 0))(
  ( (MissingZero!197 (index!2910 (_ BitVec 32))) (Found!197 (index!2911 (_ BitVec 32))) (Intermediate!197 (undefined!1009 Bool) (index!2912 (_ BitVec 32)) (x!8204 (_ BitVec 32))) (Undefined!197) (MissingVacant!197 (index!2913 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2841 (_ BitVec 32)) SeekEntryResult!197)

(assert (=> b!42802 (= res!25457 (= (seekEntryOrOpen!0 (select (arr!1364 lt!18005) #b00000000000000000000000000000000) lt!18005 mask!853) (Found!197 #b00000000000000000000000000000000)))))

(assert (=> b!42802 (=> (not res!25457) (not e!27126))))

(declare-fun b!42803 () Bool)

(assert (=> b!42803 (= e!27127 e!27125)))

(declare-fun c!5409 () Bool)

(assert (=> b!42803 (= c!5409 (validKeyInArray!0 (select (arr!1364 lt!18005) #b00000000000000000000000000000000)))))

(assert (= (and d!7801 (not res!25456)) b!42803))

(assert (= (and b!42803 c!5409) b!42802))

(assert (= (and b!42803 (not c!5409)) b!42800))

(assert (= (and b!42802 res!25457) b!42801))

(assert (= (or b!42801 b!42800) bm!3381))

(declare-fun m!36541 () Bool)

(assert (=> bm!3381 m!36541))

(assert (=> b!42802 m!36525))

(declare-fun m!36543 () Bool)

(assert (=> b!42802 m!36543))

(declare-fun m!36547 () Bool)

(assert (=> b!42802 m!36547))

(assert (=> b!42802 m!36525))

(declare-fun m!36549 () Bool)

(assert (=> b!42802 m!36549))

(assert (=> b!42803 m!36525))

(assert (=> b!42803 m!36525))

(assert (=> b!42803 m!36527))

(assert (=> b!42696 d!7801))

(declare-fun d!7809 () Bool)

(declare-fun getCurrentListMap!338 (array!2841 array!2843 (_ BitVec 32) (_ BitVec 32) V!2269 V!2269 (_ BitVec 32) Int) ListLongMap!1161)

(assert (=> d!7809 (= (map!808 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18003 lt!18003 #b00000000000000000000000000000000 lt!18005 (array!2844 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (getCurrentListMap!338 (_keys!3408 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18003 lt!18003 #b00000000000000000000000000000000 lt!18005 (array!2844 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_values!1849 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18003 lt!18003 #b00000000000000000000000000000000 lt!18005 (array!2844 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5395 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18003 lt!18003 #b00000000000000000000000000000000 lt!18005 (array!2844 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (extraKeys!1757 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18003 lt!18003 #b00000000000000000000000000000000 lt!18005 (array!2844 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (zeroValue!1784 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18003 lt!18003 #b00000000000000000000000000000000 lt!18005 (array!2844 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (minValue!1784 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18003 lt!18003 #b00000000000000000000000000000000 lt!18005 (array!2844 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1866 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18003 lt!18003 #b00000000000000000000000000000000 lt!18005 (array!2844 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun bs!1910 () Bool)

(assert (= bs!1910 d!7809))

(declare-fun m!36567 () Bool)

(assert (=> bs!1910 m!36567))

(assert (=> b!42696 d!7809))

(declare-fun b!42835 () Bool)

(declare-fun e!27152 () Bool)

(declare-fun call!3392 () Bool)

(assert (=> b!42835 (= e!27152 call!3392)))

(declare-fun d!7821 () Bool)

(declare-fun res!25470 () Bool)

(declare-fun e!27151 () Bool)

(assert (=> d!7821 (=> res!25470 e!27151)))

(assert (=> d!7821 (= res!25470 (bvsge #b00000000000000000000000000000000 (size!1543 lt!18005)))))

(assert (=> d!7821 (= (arrayNoDuplicates!0 lt!18005 #b00000000000000000000000000000000 Nil!1157) e!27151)))

(declare-fun bm!3389 () Bool)

(declare-fun c!5420 () Bool)

(assert (=> bm!3389 (= call!3392 (arrayNoDuplicates!0 lt!18005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5420 (Cons!1156 (select (arr!1364 lt!18005) #b00000000000000000000000000000000) Nil!1157) Nil!1157)))))

(declare-fun b!42836 () Bool)

(declare-fun e!27150 () Bool)

(assert (=> b!42836 (= e!27151 e!27150)))

(declare-fun res!25471 () Bool)

(assert (=> b!42836 (=> (not res!25471) (not e!27150))))

(declare-fun e!27149 () Bool)

(assert (=> b!42836 (= res!25471 (not e!27149))))

(declare-fun res!25469 () Bool)

(assert (=> b!42836 (=> (not res!25469) (not e!27149))))

(assert (=> b!42836 (= res!25469 (validKeyInArray!0 (select (arr!1364 lt!18005) #b00000000000000000000000000000000)))))

(declare-fun b!42837 () Bool)

(declare-fun contains!558 (List!1160 (_ BitVec 64)) Bool)

(assert (=> b!42837 (= e!27149 (contains!558 Nil!1157 (select (arr!1364 lt!18005) #b00000000000000000000000000000000)))))

(declare-fun b!42838 () Bool)

(assert (=> b!42838 (= e!27152 call!3392)))

(declare-fun b!42839 () Bool)

(assert (=> b!42839 (= e!27150 e!27152)))

(assert (=> b!42839 (= c!5420 (validKeyInArray!0 (select (arr!1364 lt!18005) #b00000000000000000000000000000000)))))

(assert (= (and d!7821 (not res!25470)) b!42836))

(assert (= (and b!42836 res!25469) b!42837))

(assert (= (and b!42836 res!25471) b!42839))

(assert (= (and b!42839 c!5420) b!42838))

(assert (= (and b!42839 (not c!5420)) b!42835))

(assert (= (or b!42838 b!42835) bm!3389))

(assert (=> bm!3389 m!36525))

(declare-fun m!36569 () Bool)

(assert (=> bm!3389 m!36569))

(assert (=> b!42836 m!36525))

(assert (=> b!42836 m!36525))

(assert (=> b!42836 m!36527))

(assert (=> b!42837 m!36525))

(assert (=> b!42837 m!36525))

(declare-fun m!36571 () Bool)

(assert (=> b!42837 m!36571))

(assert (=> b!42839 m!36525))

(assert (=> b!42839 m!36525))

(assert (=> b!42839 m!36527))

(assert (=> b!42696 d!7821))

(declare-fun d!7823 () Bool)

(assert (=> d!7823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18005 mask!853)))

(declare-fun lt!18104 () Unit!1174)

(declare-fun choose!34 (array!2841 (_ BitVec 32) (_ BitVec 32)) Unit!1174)

(assert (=> d!7823 (= lt!18104 (choose!34 lt!18005 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7823 (validMask!0 mask!853)))

(assert (=> d!7823 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18005 mask!853 #b00000000000000000000000000000000) lt!18104)))

(declare-fun bs!1911 () Bool)

(assert (= bs!1911 d!7823))

(assert (=> bs!1911 m!36453))

(declare-fun m!36573 () Bool)

(assert (=> bs!1911 m!36573))

(assert (=> bs!1911 m!36437))

(assert (=> b!42696 d!7823))

(check-sat (not d!7795) (not b!42803) (not d!7799) b_and!2595 (not b_next!1471) (not d!7809) (not b!42837) tp_is_empty!1861 (not b!42839) (not b!42836) (not bm!3381) (not d!7823) (not b_lambda!2221) (not bm!3371) (not bm!3389) (not b!42802) (not b!42761))
(check-sat b_and!2595 (not b_next!1471))
