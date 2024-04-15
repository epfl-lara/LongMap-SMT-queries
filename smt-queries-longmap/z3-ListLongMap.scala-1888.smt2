; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33766 () Bool)

(assert start!33766)

(declare-fun b_free!6997 () Bool)

(declare-fun b_next!6997 () Bool)

(assert (=> start!33766 (= b_free!6997 (not b_next!6997))))

(declare-fun tp!24498 () Bool)

(declare-fun b_and!14153 () Bool)

(assert (=> start!33766 (= tp!24498 b_and!14153)))

(declare-fun res!185355 () Bool)

(declare-fun e!206101 () Bool)

(assert (=> start!33766 (=> (not res!185355) (not e!206101))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33766 (= res!185355 (validMask!0 mask!2385))))

(assert (=> start!33766 e!206101))

(assert (=> start!33766 true))

(declare-fun tp_is_empty!6949 () Bool)

(assert (=> start!33766 tp_is_empty!6949))

(assert (=> start!33766 tp!24498))

(declare-datatypes ((V!10243 0))(
  ( (V!10244 (val!3519 Int)) )
))
(declare-datatypes ((ValueCell!3131 0))(
  ( (ValueCellFull!3131 (v!5676 V!10243)) (EmptyCell!3131) )
))
(declare-datatypes ((array!17473 0))(
  ( (array!17474 (arr!8266 (Array (_ BitVec 32) ValueCell!3131)) (size!8619 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17473)

(declare-fun e!206100 () Bool)

(declare-fun array_inv!6170 (array!17473) Bool)

(assert (=> start!33766 (and (array_inv!6170 _values!1525) e!206100)))

(declare-datatypes ((array!17475 0))(
  ( (array!17476 (arr!8267 (Array (_ BitVec 32) (_ BitVec 64))) (size!8620 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17475)

(declare-fun array_inv!6171 (array!17475) Bool)

(assert (=> start!33766 (array_inv!6171 _keys!1895)))

(declare-fun b!335767 () Bool)

(declare-fun res!185357 () Bool)

(assert (=> b!335767 (=> (not res!185357) (not e!206101))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335767 (= res!185357 (validKeyInArray!0 k0!1348))))

(declare-fun b!335768 () Bool)

(declare-fun res!185353 () Bool)

(assert (=> b!335768 (=> (not res!185353) (not e!206101))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335768 (= res!185353 (and (= (size!8619 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8620 _keys!1895) (size!8619 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335769 () Bool)

(declare-fun res!185356 () Bool)

(assert (=> b!335769 (=> (not res!185356) (not e!206101))))

(declare-datatypes ((List!4693 0))(
  ( (Nil!4690) (Cons!4689 (h!5545 (_ BitVec 64)) (t!9774 List!4693)) )
))
(declare-fun arrayNoDuplicates!0 (array!17475 (_ BitVec 32) List!4693) Bool)

(assert (=> b!335769 (= res!185356 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4690))))

(declare-fun b!335770 () Bool)

(declare-fun e!206098 () Bool)

(assert (=> b!335770 (= e!206098 tp_is_empty!6949)))

(declare-fun b!335771 () Bool)

(declare-fun res!185354 () Bool)

(assert (=> b!335771 (=> (not res!185354) (not e!206101))))

(declare-fun zeroValue!1467 () V!10243)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10243)

(declare-datatypes ((tuple2!5060 0))(
  ( (tuple2!5061 (_1!2541 (_ BitVec 64)) (_2!2541 V!10243)) )
))
(declare-datatypes ((List!4694 0))(
  ( (Nil!4691) (Cons!4690 (h!5546 tuple2!5060) (t!9775 List!4694)) )
))
(declare-datatypes ((ListLongMap!3963 0))(
  ( (ListLongMap!3964 (toList!1997 List!4694)) )
))
(declare-fun contains!2053 (ListLongMap!3963 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1503 (array!17475 array!17473 (_ BitVec 32) (_ BitVec 32) V!10243 V!10243 (_ BitVec 32) Int) ListLongMap!3963)

(assert (=> b!335771 (= res!185354 (not (contains!2053 (getCurrentListMap!1503 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!11823 () Bool)

(declare-fun mapRes!11823 () Bool)

(declare-fun tp!24497 () Bool)

(assert (=> mapNonEmpty!11823 (= mapRes!11823 (and tp!24497 e!206098))))

(declare-fun mapKey!11823 () (_ BitVec 32))

(declare-fun mapValue!11823 () ValueCell!3131)

(declare-fun mapRest!11823 () (Array (_ BitVec 32) ValueCell!3131))

(assert (=> mapNonEmpty!11823 (= (arr!8266 _values!1525) (store mapRest!11823 mapKey!11823 mapValue!11823))))

(declare-fun b!335772 () Bool)

(declare-fun e!206099 () Bool)

(assert (=> b!335772 (= e!206099 tp_is_empty!6949)))

(declare-fun b!335773 () Bool)

(declare-datatypes ((SeekEntryResult!3198 0))(
  ( (MissingZero!3198 (index!14971 (_ BitVec 32))) (Found!3198 (index!14972 (_ BitVec 32))) (Intermediate!3198 (undefined!4010 Bool) (index!14973 (_ BitVec 32)) (x!33489 (_ BitVec 32))) (Undefined!3198) (MissingVacant!3198 (index!14974 (_ BitVec 32))) )
))
(declare-fun lt!159819 () SeekEntryResult!3198)

(get-info :version)

(assert (=> b!335773 (= e!206101 (and (not ((_ is Found!3198) lt!159819)) ((_ is MissingZero!3198) lt!159819) (bvslt #b00000000000000000000000000000000 (size!8620 _keys!1895)) (bvsge (size!8620 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17475 (_ BitVec 32)) SeekEntryResult!3198)

(assert (=> b!335773 (= lt!159819 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11823 () Bool)

(assert (=> mapIsEmpty!11823 mapRes!11823))

(declare-fun b!335774 () Bool)

(declare-fun res!185352 () Bool)

(assert (=> b!335774 (=> (not res!185352) (not e!206101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17475 (_ BitVec 32)) Bool)

(assert (=> b!335774 (= res!185352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335775 () Bool)

(assert (=> b!335775 (= e!206100 (and e!206099 mapRes!11823))))

(declare-fun condMapEmpty!11823 () Bool)

(declare-fun mapDefault!11823 () ValueCell!3131)

(assert (=> b!335775 (= condMapEmpty!11823 (= (arr!8266 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3131)) mapDefault!11823)))))

(assert (= (and start!33766 res!185355) b!335768))

(assert (= (and b!335768 res!185353) b!335774))

(assert (= (and b!335774 res!185352) b!335769))

(assert (= (and b!335769 res!185356) b!335767))

(assert (= (and b!335767 res!185357) b!335771))

(assert (= (and b!335771 res!185354) b!335773))

(assert (= (and b!335775 condMapEmpty!11823) mapIsEmpty!11823))

(assert (= (and b!335775 (not condMapEmpty!11823)) mapNonEmpty!11823))

(assert (= (and mapNonEmpty!11823 ((_ is ValueCellFull!3131) mapValue!11823)) b!335770))

(assert (= (and b!335775 ((_ is ValueCellFull!3131) mapDefault!11823)) b!335772))

(assert (= start!33766 b!335775))

(declare-fun m!339225 () Bool)

(assert (=> b!335774 m!339225))

(declare-fun m!339227 () Bool)

(assert (=> b!335769 m!339227))

(declare-fun m!339229 () Bool)

(assert (=> start!33766 m!339229))

(declare-fun m!339231 () Bool)

(assert (=> start!33766 m!339231))

(declare-fun m!339233 () Bool)

(assert (=> start!33766 m!339233))

(declare-fun m!339235 () Bool)

(assert (=> b!335773 m!339235))

(declare-fun m!339237 () Bool)

(assert (=> b!335771 m!339237))

(assert (=> b!335771 m!339237))

(declare-fun m!339239 () Bool)

(assert (=> b!335771 m!339239))

(declare-fun m!339241 () Bool)

(assert (=> b!335767 m!339241))

(declare-fun m!339243 () Bool)

(assert (=> mapNonEmpty!11823 m!339243))

(check-sat (not b!335771) (not b!335769) (not start!33766) (not b!335773) tp_is_empty!6949 (not mapNonEmpty!11823) (not b!335767) b_and!14153 (not b_next!6997) (not b!335774))
(check-sat b_and!14153 (not b_next!6997))
(get-model)

(declare-fun d!70467 () Bool)

(declare-fun e!206137 () Bool)

(assert (=> d!70467 e!206137))

(declare-fun res!185396 () Bool)

(assert (=> d!70467 (=> res!185396 e!206137)))

(declare-fun lt!159837 () Bool)

(assert (=> d!70467 (= res!185396 (not lt!159837))))

(declare-fun lt!159834 () Bool)

(assert (=> d!70467 (= lt!159837 lt!159834)))

(declare-datatypes ((Unit!10438 0))(
  ( (Unit!10439) )
))
(declare-fun lt!159835 () Unit!10438)

(declare-fun e!206136 () Unit!10438)

(assert (=> d!70467 (= lt!159835 e!206136)))

(declare-fun c!52160 () Bool)

(assert (=> d!70467 (= c!52160 lt!159834)))

(declare-fun containsKey!315 (List!4694 (_ BitVec 64)) Bool)

(assert (=> d!70467 (= lt!159834 (containsKey!315 (toList!1997 (getCurrentListMap!1503 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70467 (= (contains!2053 (getCurrentListMap!1503 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!159837)))

(declare-fun b!335836 () Bool)

(declare-fun lt!159836 () Unit!10438)

(assert (=> b!335836 (= e!206136 lt!159836)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!264 (List!4694 (_ BitVec 64)) Unit!10438)

(assert (=> b!335836 (= lt!159836 (lemmaContainsKeyImpliesGetValueByKeyDefined!264 (toList!1997 (getCurrentListMap!1503 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!329 0))(
  ( (Some!328 (v!5679 V!10243)) (None!327) )
))
(declare-fun isDefined!265 (Option!329) Bool)

(declare-fun getValueByKey!323 (List!4694 (_ BitVec 64)) Option!329)

(assert (=> b!335836 (isDefined!265 (getValueByKey!323 (toList!1997 (getCurrentListMap!1503 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!335837 () Bool)

(declare-fun Unit!10440 () Unit!10438)

(assert (=> b!335837 (= e!206136 Unit!10440)))

(declare-fun b!335838 () Bool)

(assert (=> b!335838 (= e!206137 (isDefined!265 (getValueByKey!323 (toList!1997 (getCurrentListMap!1503 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70467 c!52160) b!335836))

(assert (= (and d!70467 (not c!52160)) b!335837))

(assert (= (and d!70467 (not res!185396)) b!335838))

(declare-fun m!339285 () Bool)

(assert (=> d!70467 m!339285))

(declare-fun m!339287 () Bool)

(assert (=> b!335836 m!339287))

(declare-fun m!339289 () Bool)

(assert (=> b!335836 m!339289))

(assert (=> b!335836 m!339289))

(declare-fun m!339291 () Bool)

(assert (=> b!335836 m!339291))

(assert (=> b!335838 m!339289))

(assert (=> b!335838 m!339289))

(assert (=> b!335838 m!339291))

(assert (=> b!335771 d!70467))

(declare-fun d!70469 () Bool)

(declare-fun e!206169 () Bool)

(assert (=> d!70469 e!206169))

(declare-fun res!185415 () Bool)

(assert (=> d!70469 (=> (not res!185415) (not e!206169))))

(assert (=> d!70469 (= res!185415 (or (bvsge #b00000000000000000000000000000000 (size!8620 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8620 _keys!1895)))))))

(declare-fun lt!159902 () ListLongMap!3963)

(declare-fun lt!159884 () ListLongMap!3963)

(assert (=> d!70469 (= lt!159902 lt!159884)))

(declare-fun lt!159895 () Unit!10438)

(declare-fun e!206173 () Unit!10438)

(assert (=> d!70469 (= lt!159895 e!206173)))

(declare-fun c!52173 () Bool)

(declare-fun e!206170 () Bool)

(assert (=> d!70469 (= c!52173 e!206170)))

(declare-fun res!185416 () Bool)

(assert (=> d!70469 (=> (not res!185416) (not e!206170))))

(assert (=> d!70469 (= res!185416 (bvslt #b00000000000000000000000000000000 (size!8620 _keys!1895)))))

(declare-fun e!206171 () ListLongMap!3963)

(assert (=> d!70469 (= lt!159884 e!206171)))

(declare-fun c!52176 () Bool)

(assert (=> d!70469 (= c!52176 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70469 (validMask!0 mask!2385)))

(assert (=> d!70469 (= (getCurrentListMap!1503 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!159902)))

(declare-fun b!335881 () Bool)

(declare-fun e!206167 () Bool)

(declare-fun e!206164 () Bool)

(assert (=> b!335881 (= e!206167 e!206164)))

(declare-fun res!185421 () Bool)

(assert (=> b!335881 (=> (not res!185421) (not e!206164))))

(assert (=> b!335881 (= res!185421 (contains!2053 lt!159902 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!335881 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8620 _keys!1895)))))

(declare-fun bm!26309 () Bool)

(declare-fun call!26318 () ListLongMap!3963)

(declare-fun call!26314 () ListLongMap!3963)

(assert (=> bm!26309 (= call!26318 call!26314)))

(declare-fun b!335882 () Bool)

(declare-fun e!206174 () ListLongMap!3963)

(assert (=> b!335882 (= e!206174 call!26318)))

(declare-fun bm!26310 () Bool)

(declare-fun call!26313 () Bool)

(assert (=> bm!26310 (= call!26313 (contains!2053 lt!159902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!335883 () Bool)

(declare-fun Unit!10441 () Unit!10438)

(assert (=> b!335883 (= e!206173 Unit!10441)))

(declare-fun b!335884 () Bool)

(declare-fun e!206166 () Bool)

(assert (=> b!335884 (= e!206166 (validKeyInArray!0 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335885 () Bool)

(declare-fun e!206168 () Bool)

(declare-fun e!206165 () Bool)

(assert (=> b!335885 (= e!206168 e!206165)))

(declare-fun res!185419 () Bool)

(declare-fun call!26317 () Bool)

(assert (=> b!335885 (= res!185419 call!26317)))

(assert (=> b!335885 (=> (not res!185419) (not e!206165))))

(declare-fun b!335886 () Bool)

(declare-fun e!206176 () ListLongMap!3963)

(assert (=> b!335886 (= e!206176 call!26318)))

(declare-fun b!335887 () Bool)

(assert (=> b!335887 (= e!206171 e!206174)))

(declare-fun c!52177 () Bool)

(assert (=> b!335887 (= c!52177 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!335888 () Bool)

(assert (=> b!335888 (= e!206170 (validKeyInArray!0 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335889 () Bool)

(declare-fun lt!159891 () Unit!10438)

(assert (=> b!335889 (= e!206173 lt!159891)))

(declare-fun lt!159887 () ListLongMap!3963)

(declare-fun getCurrentListMapNoExtraKeys!583 (array!17475 array!17473 (_ BitVec 32) (_ BitVec 32) V!10243 V!10243 (_ BitVec 32) Int) ListLongMap!3963)

(assert (=> b!335889 (= lt!159887 (getCurrentListMapNoExtraKeys!583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159896 () (_ BitVec 64))

(assert (=> b!335889 (= lt!159896 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159883 () (_ BitVec 64))

(assert (=> b!335889 (= lt!159883 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159882 () Unit!10438)

(declare-fun addStillContains!243 (ListLongMap!3963 (_ BitVec 64) V!10243 (_ BitVec 64)) Unit!10438)

(assert (=> b!335889 (= lt!159882 (addStillContains!243 lt!159887 lt!159896 zeroValue!1467 lt!159883))))

(declare-fun +!720 (ListLongMap!3963 tuple2!5060) ListLongMap!3963)

(assert (=> b!335889 (contains!2053 (+!720 lt!159887 (tuple2!5061 lt!159896 zeroValue!1467)) lt!159883)))

(declare-fun lt!159900 () Unit!10438)

(assert (=> b!335889 (= lt!159900 lt!159882)))

(declare-fun lt!159890 () ListLongMap!3963)

(assert (=> b!335889 (= lt!159890 (getCurrentListMapNoExtraKeys!583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159889 () (_ BitVec 64))

(assert (=> b!335889 (= lt!159889 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159894 () (_ BitVec 64))

(assert (=> b!335889 (= lt!159894 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159893 () Unit!10438)

(declare-fun addApplyDifferent!243 (ListLongMap!3963 (_ BitVec 64) V!10243 (_ BitVec 64)) Unit!10438)

(assert (=> b!335889 (= lt!159893 (addApplyDifferent!243 lt!159890 lt!159889 minValue!1467 lt!159894))))

(declare-fun apply!267 (ListLongMap!3963 (_ BitVec 64)) V!10243)

(assert (=> b!335889 (= (apply!267 (+!720 lt!159890 (tuple2!5061 lt!159889 minValue!1467)) lt!159894) (apply!267 lt!159890 lt!159894))))

(declare-fun lt!159885 () Unit!10438)

(assert (=> b!335889 (= lt!159885 lt!159893)))

(declare-fun lt!159886 () ListLongMap!3963)

(assert (=> b!335889 (= lt!159886 (getCurrentListMapNoExtraKeys!583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159903 () (_ BitVec 64))

(assert (=> b!335889 (= lt!159903 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159901 () (_ BitVec 64))

(assert (=> b!335889 (= lt!159901 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159897 () Unit!10438)

(assert (=> b!335889 (= lt!159897 (addApplyDifferent!243 lt!159886 lt!159903 zeroValue!1467 lt!159901))))

(assert (=> b!335889 (= (apply!267 (+!720 lt!159886 (tuple2!5061 lt!159903 zeroValue!1467)) lt!159901) (apply!267 lt!159886 lt!159901))))

(declare-fun lt!159899 () Unit!10438)

(assert (=> b!335889 (= lt!159899 lt!159897)))

(declare-fun lt!159892 () ListLongMap!3963)

(assert (=> b!335889 (= lt!159892 (getCurrentListMapNoExtraKeys!583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159898 () (_ BitVec 64))

(assert (=> b!335889 (= lt!159898 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159888 () (_ BitVec 64))

(assert (=> b!335889 (= lt!159888 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!335889 (= lt!159891 (addApplyDifferent!243 lt!159892 lt!159898 minValue!1467 lt!159888))))

(assert (=> b!335889 (= (apply!267 (+!720 lt!159892 (tuple2!5061 lt!159898 minValue!1467)) lt!159888) (apply!267 lt!159892 lt!159888))))

(declare-fun b!335890 () Bool)

(declare-fun res!185422 () Bool)

(assert (=> b!335890 (=> (not res!185422) (not e!206169))))

(declare-fun e!206172 () Bool)

(assert (=> b!335890 (= res!185422 e!206172)))

(declare-fun c!52175 () Bool)

(assert (=> b!335890 (= c!52175 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!335891 () Bool)

(assert (=> b!335891 (= e!206168 (not call!26317))))

(declare-fun bm!26311 () Bool)

(assert (=> bm!26311 (= call!26317 (contains!2053 lt!159902 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!335892 () Bool)

(declare-fun e!206175 () Bool)

(assert (=> b!335892 (= e!206175 (= (apply!267 lt!159902 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!335893 () Bool)

(declare-fun c!52178 () Bool)

(assert (=> b!335893 (= c!52178 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!335893 (= e!206174 e!206176)))

(declare-fun bm!26312 () Bool)

(declare-fun call!26312 () ListLongMap!3963)

(assert (=> bm!26312 (= call!26312 (getCurrentListMapNoExtraKeys!583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26313 () Bool)

(declare-fun call!26316 () ListLongMap!3963)

(declare-fun call!26315 () ListLongMap!3963)

(assert (=> bm!26313 (= call!26316 call!26315)))

(declare-fun b!335894 () Bool)

(assert (=> b!335894 (= e!206176 call!26316)))

(declare-fun b!335895 () Bool)

(assert (=> b!335895 (= e!206171 (+!720 call!26314 (tuple2!5061 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!335896 () Bool)

(assert (=> b!335896 (= e!206172 e!206175)))

(declare-fun res!185423 () Bool)

(assert (=> b!335896 (= res!185423 call!26313)))

(assert (=> b!335896 (=> (not res!185423) (not e!206175))))

(declare-fun b!335897 () Bool)

(declare-fun res!185420 () Bool)

(assert (=> b!335897 (=> (not res!185420) (not e!206169))))

(assert (=> b!335897 (= res!185420 e!206167)))

(declare-fun res!185417 () Bool)

(assert (=> b!335897 (=> res!185417 e!206167)))

(assert (=> b!335897 (= res!185417 (not e!206166))))

(declare-fun res!185418 () Bool)

(assert (=> b!335897 (=> (not res!185418) (not e!206166))))

(assert (=> b!335897 (= res!185418 (bvslt #b00000000000000000000000000000000 (size!8620 _keys!1895)))))

(declare-fun bm!26314 () Bool)

(assert (=> bm!26314 (= call!26315 call!26312)))

(declare-fun b!335898 () Bool)

(assert (=> b!335898 (= e!206172 (not call!26313))))

(declare-fun b!335899 () Bool)

(declare-fun get!4523 (ValueCell!3131 V!10243) V!10243)

(declare-fun dynLambda!601 (Int (_ BitVec 64)) V!10243)

(assert (=> b!335899 (= e!206164 (= (apply!267 lt!159902 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000)) (get!4523 (select (arr!8266 _values!1525) #b00000000000000000000000000000000) (dynLambda!601 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!335899 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8619 _values!1525)))))

(assert (=> b!335899 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8620 _keys!1895)))))

(declare-fun bm!26315 () Bool)

(assert (=> bm!26315 (= call!26314 (+!720 (ite c!52176 call!26312 (ite c!52177 call!26315 call!26316)) (ite (or c!52176 c!52177) (tuple2!5061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5061 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!335900 () Bool)

(assert (=> b!335900 (= e!206169 e!206168)))

(declare-fun c!52174 () Bool)

(assert (=> b!335900 (= c!52174 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!335901 () Bool)

(assert (=> b!335901 (= e!206165 (= (apply!267 lt!159902 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(assert (= (and d!70469 c!52176) b!335895))

(assert (= (and d!70469 (not c!52176)) b!335887))

(assert (= (and b!335887 c!52177) b!335882))

(assert (= (and b!335887 (not c!52177)) b!335893))

(assert (= (and b!335893 c!52178) b!335886))

(assert (= (and b!335893 (not c!52178)) b!335894))

(assert (= (or b!335886 b!335894) bm!26313))

(assert (= (or b!335882 bm!26313) bm!26314))

(assert (= (or b!335882 b!335886) bm!26309))

(assert (= (or b!335895 bm!26314) bm!26312))

(assert (= (or b!335895 bm!26309) bm!26315))

(assert (= (and d!70469 res!185416) b!335888))

(assert (= (and d!70469 c!52173) b!335889))

(assert (= (and d!70469 (not c!52173)) b!335883))

(assert (= (and d!70469 res!185415) b!335897))

(assert (= (and b!335897 res!185418) b!335884))

(assert (= (and b!335897 (not res!185417)) b!335881))

(assert (= (and b!335881 res!185421) b!335899))

(assert (= (and b!335897 res!185420) b!335890))

(assert (= (and b!335890 c!52175) b!335896))

(assert (= (and b!335890 (not c!52175)) b!335898))

(assert (= (and b!335896 res!185423) b!335892))

(assert (= (or b!335896 b!335898) bm!26310))

(assert (= (and b!335890 res!185422) b!335900))

(assert (= (and b!335900 c!52174) b!335885))

(assert (= (and b!335900 (not c!52174)) b!335891))

(assert (= (and b!335885 res!185419) b!335901))

(assert (= (or b!335885 b!335891) bm!26311))

(declare-fun b_lambda!8389 () Bool)

(assert (=> (not b_lambda!8389) (not b!335899)))

(declare-fun t!9780 () Bool)

(declare-fun tb!3041 () Bool)

(assert (=> (and start!33766 (= defaultEntry!1528 defaultEntry!1528) t!9780) tb!3041))

(declare-fun result!5469 () Bool)

(assert (=> tb!3041 (= result!5469 tp_is_empty!6949)))

(assert (=> b!335899 t!9780))

(declare-fun b_and!14159 () Bool)

(assert (= b_and!14153 (and (=> t!9780 result!5469) b_and!14159)))

(declare-fun m!339293 () Bool)

(assert (=> bm!26310 m!339293))

(declare-fun m!339295 () Bool)

(assert (=> b!335888 m!339295))

(assert (=> b!335888 m!339295))

(declare-fun m!339297 () Bool)

(assert (=> b!335888 m!339297))

(declare-fun m!339299 () Bool)

(assert (=> b!335889 m!339299))

(declare-fun m!339301 () Bool)

(assert (=> b!335889 m!339301))

(declare-fun m!339303 () Bool)

(assert (=> b!335889 m!339303))

(declare-fun m!339305 () Bool)

(assert (=> b!335889 m!339305))

(assert (=> b!335889 m!339305))

(declare-fun m!339307 () Bool)

(assert (=> b!335889 m!339307))

(declare-fun m!339309 () Bool)

(assert (=> b!335889 m!339309))

(declare-fun m!339311 () Bool)

(assert (=> b!335889 m!339311))

(assert (=> b!335889 m!339295))

(assert (=> b!335889 m!339309))

(declare-fun m!339313 () Bool)

(assert (=> b!335889 m!339313))

(declare-fun m!339315 () Bool)

(assert (=> b!335889 m!339315))

(assert (=> b!335889 m!339313))

(declare-fun m!339317 () Bool)

(assert (=> b!335889 m!339317))

(assert (=> b!335889 m!339303))

(declare-fun m!339319 () Bool)

(assert (=> b!335889 m!339319))

(declare-fun m!339321 () Bool)

(assert (=> b!335889 m!339321))

(declare-fun m!339323 () Bool)

(assert (=> b!335889 m!339323))

(declare-fun m!339325 () Bool)

(assert (=> b!335889 m!339325))

(declare-fun m!339327 () Bool)

(assert (=> b!335889 m!339327))

(declare-fun m!339329 () Bool)

(assert (=> b!335889 m!339329))

(declare-fun m!339331 () Bool)

(assert (=> b!335892 m!339331))

(declare-fun m!339333 () Bool)

(assert (=> b!335899 m!339333))

(declare-fun m!339335 () Bool)

(assert (=> b!335899 m!339335))

(assert (=> b!335899 m!339335))

(assert (=> b!335899 m!339333))

(declare-fun m!339337 () Bool)

(assert (=> b!335899 m!339337))

(assert (=> b!335899 m!339295))

(assert (=> b!335899 m!339295))

(declare-fun m!339339 () Bool)

(assert (=> b!335899 m!339339))

(declare-fun m!339341 () Bool)

(assert (=> b!335901 m!339341))

(assert (=> d!70469 m!339229))

(assert (=> bm!26312 m!339315))

(assert (=> b!335881 m!339295))

(assert (=> b!335881 m!339295))

(declare-fun m!339343 () Bool)

(assert (=> b!335881 m!339343))

(declare-fun m!339345 () Bool)

(assert (=> b!335895 m!339345))

(declare-fun m!339347 () Bool)

(assert (=> bm!26315 m!339347))

(declare-fun m!339349 () Bool)

(assert (=> bm!26311 m!339349))

(assert (=> b!335884 m!339295))

(assert (=> b!335884 m!339295))

(assert (=> b!335884 m!339297))

(assert (=> b!335771 d!70469))

(declare-fun bm!26318 () Bool)

(declare-fun call!26321 () Bool)

(assert (=> bm!26318 (= call!26321 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!335912 () Bool)

(declare-fun e!206185 () Bool)

(assert (=> b!335912 (= e!206185 call!26321)))

(declare-fun b!335913 () Bool)

(declare-fun e!206183 () Bool)

(assert (=> b!335913 (= e!206183 e!206185)))

(declare-fun c!52181 () Bool)

(assert (=> b!335913 (= c!52181 (validKeyInArray!0 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70471 () Bool)

(declare-fun res!185429 () Bool)

(assert (=> d!70471 (=> res!185429 e!206183)))

(assert (=> d!70471 (= res!185429 (bvsge #b00000000000000000000000000000000 (size!8620 _keys!1895)))))

(assert (=> d!70471 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!206183)))

(declare-fun b!335914 () Bool)

(declare-fun e!206184 () Bool)

(assert (=> b!335914 (= e!206185 e!206184)))

(declare-fun lt!159911 () (_ BitVec 64))

(assert (=> b!335914 (= lt!159911 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159910 () Unit!10438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17475 (_ BitVec 64) (_ BitVec 32)) Unit!10438)

(assert (=> b!335914 (= lt!159910 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159911 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335914 (arrayContainsKey!0 _keys!1895 lt!159911 #b00000000000000000000000000000000)))

(declare-fun lt!159912 () Unit!10438)

(assert (=> b!335914 (= lt!159912 lt!159910)))

(declare-fun res!185428 () Bool)

(assert (=> b!335914 (= res!185428 (= (seekEntryOrOpen!0 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3198 #b00000000000000000000000000000000)))))

(assert (=> b!335914 (=> (not res!185428) (not e!206184))))

(declare-fun b!335915 () Bool)

(assert (=> b!335915 (= e!206184 call!26321)))

(assert (= (and d!70471 (not res!185429)) b!335913))

(assert (= (and b!335913 c!52181) b!335914))

(assert (= (and b!335913 (not c!52181)) b!335912))

(assert (= (and b!335914 res!185428) b!335915))

(assert (= (or b!335915 b!335912) bm!26318))

(declare-fun m!339351 () Bool)

(assert (=> bm!26318 m!339351))

(assert (=> b!335913 m!339295))

(assert (=> b!335913 m!339295))

(assert (=> b!335913 m!339297))

(assert (=> b!335914 m!339295))

(declare-fun m!339353 () Bool)

(assert (=> b!335914 m!339353))

(declare-fun m!339355 () Bool)

(assert (=> b!335914 m!339355))

(assert (=> b!335914 m!339295))

(declare-fun m!339357 () Bool)

(assert (=> b!335914 m!339357))

(assert (=> b!335774 d!70471))

(declare-fun b!335926 () Bool)

(declare-fun e!206196 () Bool)

(declare-fun contains!2055 (List!4693 (_ BitVec 64)) Bool)

(assert (=> b!335926 (= e!206196 (contains!2055 Nil!4690 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335927 () Bool)

(declare-fun e!206197 () Bool)

(declare-fun call!26324 () Bool)

(assert (=> b!335927 (= e!206197 call!26324)))

(declare-fun b!335928 () Bool)

(declare-fun e!206194 () Bool)

(declare-fun e!206195 () Bool)

(assert (=> b!335928 (= e!206194 e!206195)))

(declare-fun res!185438 () Bool)

(assert (=> b!335928 (=> (not res!185438) (not e!206195))))

(assert (=> b!335928 (= res!185438 (not e!206196))))

(declare-fun res!185436 () Bool)

(assert (=> b!335928 (=> (not res!185436) (not e!206196))))

(assert (=> b!335928 (= res!185436 (validKeyInArray!0 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335929 () Bool)

(assert (=> b!335929 (= e!206195 e!206197)))

(declare-fun c!52184 () Bool)

(assert (=> b!335929 (= c!52184 (validKeyInArray!0 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26321 () Bool)

(assert (=> bm!26321 (= call!26324 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52184 (Cons!4689 (select (arr!8267 _keys!1895) #b00000000000000000000000000000000) Nil!4690) Nil!4690)))))

(declare-fun b!335930 () Bool)

(assert (=> b!335930 (= e!206197 call!26324)))

(declare-fun d!70473 () Bool)

(declare-fun res!185437 () Bool)

(assert (=> d!70473 (=> res!185437 e!206194)))

(assert (=> d!70473 (= res!185437 (bvsge #b00000000000000000000000000000000 (size!8620 _keys!1895)))))

(assert (=> d!70473 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4690) e!206194)))

(assert (= (and d!70473 (not res!185437)) b!335928))

(assert (= (and b!335928 res!185436) b!335926))

(assert (= (and b!335928 res!185438) b!335929))

(assert (= (and b!335929 c!52184) b!335927))

(assert (= (and b!335929 (not c!52184)) b!335930))

(assert (= (or b!335927 b!335930) bm!26321))

(assert (=> b!335926 m!339295))

(assert (=> b!335926 m!339295))

(declare-fun m!339359 () Bool)

(assert (=> b!335926 m!339359))

(assert (=> b!335928 m!339295))

(assert (=> b!335928 m!339295))

(assert (=> b!335928 m!339297))

(assert (=> b!335929 m!339295))

(assert (=> b!335929 m!339295))

(assert (=> b!335929 m!339297))

(assert (=> bm!26321 m!339295))

(declare-fun m!339361 () Bool)

(assert (=> bm!26321 m!339361))

(assert (=> b!335769 d!70473))

(declare-fun b!335943 () Bool)

(declare-fun e!206206 () SeekEntryResult!3198)

(declare-fun e!206204 () SeekEntryResult!3198)

(assert (=> b!335943 (= e!206206 e!206204)))

(declare-fun lt!159920 () (_ BitVec 64))

(declare-fun lt!159919 () SeekEntryResult!3198)

(assert (=> b!335943 (= lt!159920 (select (arr!8267 _keys!1895) (index!14973 lt!159919)))))

(declare-fun c!52192 () Bool)

(assert (=> b!335943 (= c!52192 (= lt!159920 k0!1348))))

(declare-fun b!335944 () Bool)

(declare-fun e!206205 () SeekEntryResult!3198)

(assert (=> b!335944 (= e!206205 (MissingZero!3198 (index!14973 lt!159919)))))

(declare-fun b!335945 () Bool)

(assert (=> b!335945 (= e!206206 Undefined!3198)))

(declare-fun b!335946 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17475 (_ BitVec 32)) SeekEntryResult!3198)

(assert (=> b!335946 (= e!206205 (seekKeyOrZeroReturnVacant!0 (x!33489 lt!159919) (index!14973 lt!159919) (index!14973 lt!159919) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335947 () Bool)

(declare-fun c!52191 () Bool)

(assert (=> b!335947 (= c!52191 (= lt!159920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!335947 (= e!206204 e!206205)))

(declare-fun b!335948 () Bool)

(assert (=> b!335948 (= e!206204 (Found!3198 (index!14973 lt!159919)))))

(declare-fun d!70475 () Bool)

(declare-fun lt!159921 () SeekEntryResult!3198)

(assert (=> d!70475 (and (or ((_ is Undefined!3198) lt!159921) (not ((_ is Found!3198) lt!159921)) (and (bvsge (index!14972 lt!159921) #b00000000000000000000000000000000) (bvslt (index!14972 lt!159921) (size!8620 _keys!1895)))) (or ((_ is Undefined!3198) lt!159921) ((_ is Found!3198) lt!159921) (not ((_ is MissingZero!3198) lt!159921)) (and (bvsge (index!14971 lt!159921) #b00000000000000000000000000000000) (bvslt (index!14971 lt!159921) (size!8620 _keys!1895)))) (or ((_ is Undefined!3198) lt!159921) ((_ is Found!3198) lt!159921) ((_ is MissingZero!3198) lt!159921) (not ((_ is MissingVacant!3198) lt!159921)) (and (bvsge (index!14974 lt!159921) #b00000000000000000000000000000000) (bvslt (index!14974 lt!159921) (size!8620 _keys!1895)))) (or ((_ is Undefined!3198) lt!159921) (ite ((_ is Found!3198) lt!159921) (= (select (arr!8267 _keys!1895) (index!14972 lt!159921)) k0!1348) (ite ((_ is MissingZero!3198) lt!159921) (= (select (arr!8267 _keys!1895) (index!14971 lt!159921)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3198) lt!159921) (= (select (arr!8267 _keys!1895) (index!14974 lt!159921)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70475 (= lt!159921 e!206206)))

(declare-fun c!52193 () Bool)

(assert (=> d!70475 (= c!52193 (and ((_ is Intermediate!3198) lt!159919) (undefined!4010 lt!159919)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17475 (_ BitVec 32)) SeekEntryResult!3198)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70475 (= lt!159919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70475 (validMask!0 mask!2385)))

(assert (=> d!70475 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!159921)))

(assert (= (and d!70475 c!52193) b!335945))

(assert (= (and d!70475 (not c!52193)) b!335943))

(assert (= (and b!335943 c!52192) b!335948))

(assert (= (and b!335943 (not c!52192)) b!335947))

(assert (= (and b!335947 c!52191) b!335944))

(assert (= (and b!335947 (not c!52191)) b!335946))

(declare-fun m!339363 () Bool)

(assert (=> b!335943 m!339363))

(declare-fun m!339365 () Bool)

(assert (=> b!335946 m!339365))

(declare-fun m!339367 () Bool)

(assert (=> d!70475 m!339367))

(declare-fun m!339369 () Bool)

(assert (=> d!70475 m!339369))

(declare-fun m!339371 () Bool)

(assert (=> d!70475 m!339371))

(assert (=> d!70475 m!339367))

(declare-fun m!339373 () Bool)

(assert (=> d!70475 m!339373))

(assert (=> d!70475 m!339229))

(declare-fun m!339375 () Bool)

(assert (=> d!70475 m!339375))

(assert (=> b!335773 d!70475))

(declare-fun d!70477 () Bool)

(assert (=> d!70477 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!335767 d!70477))

(declare-fun d!70479 () Bool)

(assert (=> d!70479 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33766 d!70479))

(declare-fun d!70481 () Bool)

(assert (=> d!70481 (= (array_inv!6170 _values!1525) (bvsge (size!8619 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33766 d!70481))

(declare-fun d!70483 () Bool)

(assert (=> d!70483 (= (array_inv!6171 _keys!1895) (bvsge (size!8620 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33766 d!70483))

(declare-fun condMapEmpty!11832 () Bool)

(declare-fun mapDefault!11832 () ValueCell!3131)

(assert (=> mapNonEmpty!11823 (= condMapEmpty!11832 (= mapRest!11823 ((as const (Array (_ BitVec 32) ValueCell!3131)) mapDefault!11832)))))

(declare-fun e!206211 () Bool)

(declare-fun mapRes!11832 () Bool)

(assert (=> mapNonEmpty!11823 (= tp!24497 (and e!206211 mapRes!11832))))

(declare-fun b!335955 () Bool)

(declare-fun e!206212 () Bool)

(assert (=> b!335955 (= e!206212 tp_is_empty!6949)))

(declare-fun mapNonEmpty!11832 () Bool)

(declare-fun tp!24513 () Bool)

(assert (=> mapNonEmpty!11832 (= mapRes!11832 (and tp!24513 e!206212))))

(declare-fun mapRest!11832 () (Array (_ BitVec 32) ValueCell!3131))

(declare-fun mapKey!11832 () (_ BitVec 32))

(declare-fun mapValue!11832 () ValueCell!3131)

(assert (=> mapNonEmpty!11832 (= mapRest!11823 (store mapRest!11832 mapKey!11832 mapValue!11832))))

(declare-fun mapIsEmpty!11832 () Bool)

(assert (=> mapIsEmpty!11832 mapRes!11832))

(declare-fun b!335956 () Bool)

(assert (=> b!335956 (= e!206211 tp_is_empty!6949)))

(assert (= (and mapNonEmpty!11823 condMapEmpty!11832) mapIsEmpty!11832))

(assert (= (and mapNonEmpty!11823 (not condMapEmpty!11832)) mapNonEmpty!11832))

(assert (= (and mapNonEmpty!11832 ((_ is ValueCellFull!3131) mapValue!11832)) b!335955))

(assert (= (and mapNonEmpty!11823 ((_ is ValueCellFull!3131) mapDefault!11832)) b!335956))

(declare-fun m!339377 () Bool)

(assert (=> mapNonEmpty!11832 m!339377))

(declare-fun b_lambda!8391 () Bool)

(assert (= b_lambda!8389 (or (and start!33766 b_free!6997) b_lambda!8391)))

(check-sat (not mapNonEmpty!11832) (not b!335913) (not b!335946) (not bm!26318) (not b!335899) (not b_lambda!8391) (not b!335838) (not b!335929) (not b!335888) (not b!335892) (not b!335926) (not b!335881) (not b_next!6997) (not b!335884) (not bm!26310) (not d!70467) (not bm!26312) (not b!335895) (not d!70475) (not bm!26321) (not b!335836) (not b!335914) (not d!70469) (not b!335901) (not b!335889) (not bm!26311) tp_is_empty!6949 (not bm!26315) (not b!335928) b_and!14159)
(check-sat b_and!14159 (not b_next!6997))
