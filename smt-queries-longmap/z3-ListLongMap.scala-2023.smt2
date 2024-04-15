; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35218 () Bool)

(assert start!35218)

(declare-fun b_free!7807 () Bool)

(declare-fun b_next!7807 () Bool)

(assert (=> start!35218 (= b_free!7807 (not b_next!7807))))

(declare-fun tp!27015 () Bool)

(declare-fun b_and!15021 () Bool)

(assert (=> start!35218 (= tp!27015 b_and!15021)))

(declare-fun b!352956 () Bool)

(declare-fun e!216109 () Bool)

(declare-fun tp_is_empty!7759 () Bool)

(assert (=> b!352956 (= e!216109 tp_is_empty!7759)))

(declare-fun b!352957 () Bool)

(declare-fun res!195756 () Bool)

(declare-fun e!216112 () Bool)

(assert (=> b!352957 (=> (not res!195756) (not e!216112))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11323 0))(
  ( (V!11324 (val!3924 Int)) )
))
(declare-fun zeroValue!1467 () V!11323)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3536 0))(
  ( (ValueCellFull!3536 (v!6110 V!11323)) (EmptyCell!3536) )
))
(declare-datatypes ((array!19083 0))(
  ( (array!19084 (arr!9042 (Array (_ BitVec 32) ValueCell!3536)) (size!9395 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19083)

(declare-datatypes ((array!19085 0))(
  ( (array!19086 (arr!9043 (Array (_ BitVec 32) (_ BitVec 64))) (size!9396 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19085)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11323)

(declare-datatypes ((tuple2!5630 0))(
  ( (tuple2!5631 (_1!2826 (_ BitVec 64)) (_2!2826 V!11323)) )
))
(declare-datatypes ((List!5244 0))(
  ( (Nil!5241) (Cons!5240 (h!6096 tuple2!5630) (t!10383 List!5244)) )
))
(declare-datatypes ((ListLongMap!4533 0))(
  ( (ListLongMap!4534 (toList!2282 List!5244)) )
))
(declare-fun contains!2367 (ListLongMap!4533 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1787 (array!19085 array!19083 (_ BitVec 32) (_ BitVec 32) V!11323 V!11323 (_ BitVec 32) Int) ListLongMap!4533)

(assert (=> b!352957 (= res!195756 (not (contains!2367 (getCurrentListMap!1787 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352958 () Bool)

(declare-fun e!216108 () Bool)

(declare-fun e!216111 () Bool)

(declare-fun mapRes!13125 () Bool)

(assert (=> b!352958 (= e!216108 (and e!216111 mapRes!13125))))

(declare-fun condMapEmpty!13125 () Bool)

(declare-fun mapDefault!13125 () ValueCell!3536)

(assert (=> b!352958 (= condMapEmpty!13125 (= (arr!9042 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3536)) mapDefault!13125)))))

(declare-fun b!352959 () Bool)

(declare-fun res!195761 () Bool)

(assert (=> b!352959 (=> (not res!195761) (not e!216112))))

(declare-datatypes ((List!5245 0))(
  ( (Nil!5242) (Cons!5241 (h!6097 (_ BitVec 64)) (t!10384 List!5245)) )
))
(declare-fun arrayNoDuplicates!0 (array!19085 (_ BitVec 32) List!5245) Bool)

(assert (=> b!352959 (= res!195761 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5242))))

(declare-fun mapIsEmpty!13125 () Bool)

(assert (=> mapIsEmpty!13125 mapRes!13125))

(declare-fun res!195757 () Bool)

(assert (=> start!35218 (=> (not res!195757) (not e!216112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35218 (= res!195757 (validMask!0 mask!2385))))

(assert (=> start!35218 e!216112))

(assert (=> start!35218 true))

(assert (=> start!35218 tp_is_empty!7759))

(assert (=> start!35218 tp!27015))

(declare-fun array_inv!6694 (array!19083) Bool)

(assert (=> start!35218 (and (array_inv!6694 _values!1525) e!216108)))

(declare-fun array_inv!6695 (array!19085) Bool)

(assert (=> start!35218 (array_inv!6695 _keys!1895)))

(declare-fun b!352960 () Bool)

(declare-datatypes ((SeekEntryResult!3479 0))(
  ( (MissingZero!3479 (index!16095 (_ BitVec 32))) (Found!3479 (index!16096 (_ BitVec 32))) (Intermediate!3479 (undefined!4291 Bool) (index!16097 (_ BitVec 32)) (x!35140 (_ BitVec 32))) (Undefined!3479) (MissingVacant!3479 (index!16098 (_ BitVec 32))) )
))
(declare-fun lt!165237 () SeekEntryResult!3479)

(get-info :version)

(assert (=> b!352960 (= e!216112 (and (not ((_ is Found!3479) lt!165237)) (not ((_ is MissingZero!3479) lt!165237)) (not ((_ is MissingVacant!3479) lt!165237)) (not ((_ is Undefined!3479) lt!165237))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19085 (_ BitVec 32)) SeekEntryResult!3479)

(assert (=> b!352960 (= lt!165237 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352961 () Bool)

(declare-fun res!195758 () Bool)

(assert (=> b!352961 (=> (not res!195758) (not e!216112))))

(assert (=> b!352961 (= res!195758 (and (= (size!9395 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9396 _keys!1895) (size!9395 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352962 () Bool)

(declare-fun res!195760 () Bool)

(assert (=> b!352962 (=> (not res!195760) (not e!216112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352962 (= res!195760 (validKeyInArray!0 k0!1348))))

(declare-fun b!352963 () Bool)

(declare-fun res!195759 () Bool)

(assert (=> b!352963 (=> (not res!195759) (not e!216112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19085 (_ BitVec 32)) Bool)

(assert (=> b!352963 (= res!195759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352964 () Bool)

(assert (=> b!352964 (= e!216111 tp_is_empty!7759)))

(declare-fun mapNonEmpty!13125 () Bool)

(declare-fun tp!27014 () Bool)

(assert (=> mapNonEmpty!13125 (= mapRes!13125 (and tp!27014 e!216109))))

(declare-fun mapKey!13125 () (_ BitVec 32))

(declare-fun mapRest!13125 () (Array (_ BitVec 32) ValueCell!3536))

(declare-fun mapValue!13125 () ValueCell!3536)

(assert (=> mapNonEmpty!13125 (= (arr!9042 _values!1525) (store mapRest!13125 mapKey!13125 mapValue!13125))))

(assert (= (and start!35218 res!195757) b!352961))

(assert (= (and b!352961 res!195758) b!352963))

(assert (= (and b!352963 res!195759) b!352959))

(assert (= (and b!352959 res!195761) b!352962))

(assert (= (and b!352962 res!195760) b!352957))

(assert (= (and b!352957 res!195756) b!352960))

(assert (= (and b!352958 condMapEmpty!13125) mapIsEmpty!13125))

(assert (= (and b!352958 (not condMapEmpty!13125)) mapNonEmpty!13125))

(assert (= (and mapNonEmpty!13125 ((_ is ValueCellFull!3536) mapValue!13125)) b!352956))

(assert (= (and b!352958 ((_ is ValueCellFull!3536) mapDefault!13125)) b!352964))

(assert (= start!35218 b!352958))

(declare-fun m!351931 () Bool)

(assert (=> b!352959 m!351931))

(declare-fun m!351933 () Bool)

(assert (=> b!352962 m!351933))

(declare-fun m!351935 () Bool)

(assert (=> mapNonEmpty!13125 m!351935))

(declare-fun m!351937 () Bool)

(assert (=> b!352957 m!351937))

(assert (=> b!352957 m!351937))

(declare-fun m!351939 () Bool)

(assert (=> b!352957 m!351939))

(declare-fun m!351941 () Bool)

(assert (=> b!352960 m!351941))

(declare-fun m!351943 () Bool)

(assert (=> start!35218 m!351943))

(declare-fun m!351945 () Bool)

(assert (=> start!35218 m!351945))

(declare-fun m!351947 () Bool)

(assert (=> start!35218 m!351947))

(declare-fun m!351949 () Bool)

(assert (=> b!352963 m!351949))

(check-sat (not mapNonEmpty!13125) (not start!35218) (not b_next!7807) (not b!352963) (not b!352962) (not b!352959) (not b!352960) b_and!15021 tp_is_empty!7759 (not b!352957))
(check-sat b_and!15021 (not b_next!7807))
(get-model)

(declare-fun d!71385 () Bool)

(assert (=> d!71385 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35218 d!71385))

(declare-fun d!71387 () Bool)

(assert (=> d!71387 (= (array_inv!6694 _values!1525) (bvsge (size!9395 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35218 d!71387))

(declare-fun d!71389 () Bool)

(assert (=> d!71389 (= (array_inv!6695 _keys!1895) (bvsge (size!9396 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35218 d!71389))

(declare-fun d!71391 () Bool)

(declare-fun e!216147 () Bool)

(assert (=> d!71391 e!216147))

(declare-fun res!195800 () Bool)

(assert (=> d!71391 (=> res!195800 e!216147)))

(declare-fun lt!165253 () Bool)

(assert (=> d!71391 (= res!195800 (not lt!165253))))

(declare-fun lt!165254 () Bool)

(assert (=> d!71391 (= lt!165253 lt!165254)))

(declare-datatypes ((Unit!10900 0))(
  ( (Unit!10901) )
))
(declare-fun lt!165252 () Unit!10900)

(declare-fun e!216148 () Unit!10900)

(assert (=> d!71391 (= lt!165252 e!216148)))

(declare-fun c!53585 () Bool)

(assert (=> d!71391 (= c!53585 lt!165254)))

(declare-fun containsKey!344 (List!5244 (_ BitVec 64)) Bool)

(assert (=> d!71391 (= lt!165254 (containsKey!344 (toList!2282 (getCurrentListMap!1787 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71391 (= (contains!2367 (getCurrentListMap!1787 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!165253)))

(declare-fun b!353025 () Bool)

(declare-fun lt!165255 () Unit!10900)

(assert (=> b!353025 (= e!216148 lt!165255)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!293 (List!5244 (_ BitVec 64)) Unit!10900)

(assert (=> b!353025 (= lt!165255 (lemmaContainsKeyImpliesGetValueByKeyDefined!293 (toList!2282 (getCurrentListMap!1787 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!358 0))(
  ( (Some!357 (v!6113 V!11323)) (None!356) )
))
(declare-fun isDefined!294 (Option!358) Bool)

(declare-fun getValueByKey!352 (List!5244 (_ BitVec 64)) Option!358)

(assert (=> b!353025 (isDefined!294 (getValueByKey!352 (toList!2282 (getCurrentListMap!1787 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!353026 () Bool)

(declare-fun Unit!10902 () Unit!10900)

(assert (=> b!353026 (= e!216148 Unit!10902)))

(declare-fun b!353027 () Bool)

(assert (=> b!353027 (= e!216147 (isDefined!294 (getValueByKey!352 (toList!2282 (getCurrentListMap!1787 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71391 c!53585) b!353025))

(assert (= (and d!71391 (not c!53585)) b!353026))

(assert (= (and d!71391 (not res!195800)) b!353027))

(declare-fun m!351991 () Bool)

(assert (=> d!71391 m!351991))

(declare-fun m!351993 () Bool)

(assert (=> b!353025 m!351993))

(declare-fun m!351995 () Bool)

(assert (=> b!353025 m!351995))

(assert (=> b!353025 m!351995))

(declare-fun m!351997 () Bool)

(assert (=> b!353025 m!351997))

(assert (=> b!353027 m!351995))

(assert (=> b!353027 m!351995))

(assert (=> b!353027 m!351997))

(assert (=> b!352957 d!71391))

(declare-fun d!71393 () Bool)

(declare-fun e!216187 () Bool)

(assert (=> d!71393 e!216187))

(declare-fun res!195823 () Bool)

(assert (=> d!71393 (=> (not res!195823) (not e!216187))))

(assert (=> d!71393 (= res!195823 (or (bvsge #b00000000000000000000000000000000 (size!9396 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9396 _keys!1895)))))))

(declare-fun lt!165317 () ListLongMap!4533)

(declare-fun lt!165312 () ListLongMap!4533)

(assert (=> d!71393 (= lt!165317 lt!165312)))

(declare-fun lt!165303 () Unit!10900)

(declare-fun e!216186 () Unit!10900)

(assert (=> d!71393 (= lt!165303 e!216186)))

(declare-fun c!53602 () Bool)

(declare-fun e!216182 () Bool)

(assert (=> d!71393 (= c!53602 e!216182)))

(declare-fun res!195824 () Bool)

(assert (=> d!71393 (=> (not res!195824) (not e!216182))))

(assert (=> d!71393 (= res!195824 (bvslt #b00000000000000000000000000000000 (size!9396 _keys!1895)))))

(declare-fun e!216184 () ListLongMap!4533)

(assert (=> d!71393 (= lt!165312 e!216184)))

(declare-fun c!53601 () Bool)

(assert (=> d!71393 (= c!53601 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71393 (validMask!0 mask!2385)))

(assert (=> d!71393 (= (getCurrentListMap!1787 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!165317)))

(declare-fun b!353070 () Bool)

(declare-fun Unit!10903 () Unit!10900)

(assert (=> b!353070 (= e!216186 Unit!10903)))

(declare-fun b!353071 () Bool)

(declare-fun e!216176 () Bool)

(declare-fun call!27107 () Bool)

(assert (=> b!353071 (= e!216176 (not call!27107))))

(declare-fun b!353072 () Bool)

(declare-fun e!216180 () Bool)

(declare-fun e!216185 () Bool)

(assert (=> b!353072 (= e!216180 e!216185)))

(declare-fun res!195819 () Bool)

(declare-fun call!27109 () Bool)

(assert (=> b!353072 (= res!195819 call!27109)))

(assert (=> b!353072 (=> (not res!195819) (not e!216185))))

(declare-fun call!27104 () ListLongMap!4533)

(declare-fun bm!27101 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!612 (array!19085 array!19083 (_ BitVec 32) (_ BitVec 32) V!11323 V!11323 (_ BitVec 32) Int) ListLongMap!4533)

(assert (=> bm!27101 (= call!27104 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!353073 () Bool)

(declare-fun res!195826 () Bool)

(assert (=> b!353073 (=> (not res!195826) (not e!216187))))

(declare-fun e!216179 () Bool)

(assert (=> b!353073 (= res!195826 e!216179)))

(declare-fun res!195821 () Bool)

(assert (=> b!353073 (=> res!195821 e!216179)))

(declare-fun e!216183 () Bool)

(assert (=> b!353073 (= res!195821 (not e!216183))))

(declare-fun res!195820 () Bool)

(assert (=> b!353073 (=> (not res!195820) (not e!216183))))

(assert (=> b!353073 (= res!195820 (bvslt #b00000000000000000000000000000000 (size!9396 _keys!1895)))))

(declare-fun b!353074 () Bool)

(declare-fun call!27110 () ListLongMap!4533)

(declare-fun +!749 (ListLongMap!4533 tuple2!5630) ListLongMap!4533)

(assert (=> b!353074 (= e!216184 (+!749 call!27110 (tuple2!5631 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!27102 () Bool)

(declare-fun call!27108 () ListLongMap!4533)

(assert (=> bm!27102 (= call!27108 call!27104)))

(declare-fun b!353075 () Bool)

(declare-fun e!216181 () Bool)

(assert (=> b!353075 (= e!216179 e!216181)))

(declare-fun res!195825 () Bool)

(assert (=> b!353075 (=> (not res!195825) (not e!216181))))

(assert (=> b!353075 (= res!195825 (contains!2367 lt!165317 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!353075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9396 _keys!1895)))))

(declare-fun b!353076 () Bool)

(assert (=> b!353076 (= e!216183 (validKeyInArray!0 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!353077 () Bool)

(declare-fun apply!296 (ListLongMap!4533 (_ BitVec 64)) V!11323)

(assert (=> b!353077 (= e!216185 (= (apply!296 lt!165317 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!353078 () Bool)

(declare-fun c!53603 () Bool)

(assert (=> b!353078 (= c!53603 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!216175 () ListLongMap!4533)

(declare-fun e!216177 () ListLongMap!4533)

(assert (=> b!353078 (= e!216175 e!216177)))

(declare-fun b!353079 () Bool)

(declare-fun lt!165308 () Unit!10900)

(assert (=> b!353079 (= e!216186 lt!165308)))

(declare-fun lt!165315 () ListLongMap!4533)

(assert (=> b!353079 (= lt!165315 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165310 () (_ BitVec 64))

(assert (=> b!353079 (= lt!165310 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165302 () (_ BitVec 64))

(assert (=> b!353079 (= lt!165302 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165300 () Unit!10900)

(declare-fun addStillContains!272 (ListLongMap!4533 (_ BitVec 64) V!11323 (_ BitVec 64)) Unit!10900)

(assert (=> b!353079 (= lt!165300 (addStillContains!272 lt!165315 lt!165310 zeroValue!1467 lt!165302))))

(assert (=> b!353079 (contains!2367 (+!749 lt!165315 (tuple2!5631 lt!165310 zeroValue!1467)) lt!165302)))

(declare-fun lt!165313 () Unit!10900)

(assert (=> b!353079 (= lt!165313 lt!165300)))

(declare-fun lt!165305 () ListLongMap!4533)

(assert (=> b!353079 (= lt!165305 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165320 () (_ BitVec 64))

(assert (=> b!353079 (= lt!165320 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165307 () (_ BitVec 64))

(assert (=> b!353079 (= lt!165307 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165316 () Unit!10900)

(declare-fun addApplyDifferent!272 (ListLongMap!4533 (_ BitVec 64) V!11323 (_ BitVec 64)) Unit!10900)

(assert (=> b!353079 (= lt!165316 (addApplyDifferent!272 lt!165305 lt!165320 minValue!1467 lt!165307))))

(assert (=> b!353079 (= (apply!296 (+!749 lt!165305 (tuple2!5631 lt!165320 minValue!1467)) lt!165307) (apply!296 lt!165305 lt!165307))))

(declare-fun lt!165306 () Unit!10900)

(assert (=> b!353079 (= lt!165306 lt!165316)))

(declare-fun lt!165314 () ListLongMap!4533)

(assert (=> b!353079 (= lt!165314 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165311 () (_ BitVec 64))

(assert (=> b!353079 (= lt!165311 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165304 () (_ BitVec 64))

(assert (=> b!353079 (= lt!165304 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165309 () Unit!10900)

(assert (=> b!353079 (= lt!165309 (addApplyDifferent!272 lt!165314 lt!165311 zeroValue!1467 lt!165304))))

(assert (=> b!353079 (= (apply!296 (+!749 lt!165314 (tuple2!5631 lt!165311 zeroValue!1467)) lt!165304) (apply!296 lt!165314 lt!165304))))

(declare-fun lt!165319 () Unit!10900)

(assert (=> b!353079 (= lt!165319 lt!165309)))

(declare-fun lt!165318 () ListLongMap!4533)

(assert (=> b!353079 (= lt!165318 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165301 () (_ BitVec 64))

(assert (=> b!353079 (= lt!165301 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165321 () (_ BitVec 64))

(assert (=> b!353079 (= lt!165321 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!353079 (= lt!165308 (addApplyDifferent!272 lt!165318 lt!165301 minValue!1467 lt!165321))))

(assert (=> b!353079 (= (apply!296 (+!749 lt!165318 (tuple2!5631 lt!165301 minValue!1467)) lt!165321) (apply!296 lt!165318 lt!165321))))

(declare-fun b!353080 () Bool)

(declare-fun call!27106 () ListLongMap!4533)

(assert (=> b!353080 (= e!216175 call!27106)))

(declare-fun b!353081 () Bool)

(declare-fun call!27105 () ListLongMap!4533)

(assert (=> b!353081 (= e!216177 call!27105)))

(declare-fun bm!27103 () Bool)

(assert (=> bm!27103 (= call!27107 (contains!2367 lt!165317 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353082 () Bool)

(declare-fun e!216178 () Bool)

(assert (=> b!353082 (= e!216178 (= (apply!296 lt!165317 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!353083 () Bool)

(assert (=> b!353083 (= e!216187 e!216176)))

(declare-fun c!53599 () Bool)

(assert (=> b!353083 (= c!53599 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!353084 () Bool)

(assert (=> b!353084 (= e!216177 call!27106)))

(declare-fun bm!27104 () Bool)

(assert (=> bm!27104 (= call!27109 (contains!2367 lt!165317 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27105 () Bool)

(declare-fun c!53600 () Bool)

(assert (=> bm!27105 (= call!27110 (+!749 (ite c!53601 call!27104 (ite c!53600 call!27108 call!27105)) (ite (or c!53601 c!53600) (tuple2!5631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5631 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!353085 () Bool)

(declare-fun get!4822 (ValueCell!3536 V!11323) V!11323)

(declare-fun dynLambda!630 (Int (_ BitVec 64)) V!11323)

(assert (=> b!353085 (= e!216181 (= (apply!296 lt!165317 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000)) (get!4822 (select (arr!9042 _values!1525) #b00000000000000000000000000000000) (dynLambda!630 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!353085 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9395 _values!1525)))))

(assert (=> b!353085 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9396 _keys!1895)))))

(declare-fun b!353086 () Bool)

(assert (=> b!353086 (= e!216176 e!216178)))

(declare-fun res!195822 () Bool)

(assert (=> b!353086 (= res!195822 call!27107)))

(assert (=> b!353086 (=> (not res!195822) (not e!216178))))

(declare-fun b!353087 () Bool)

(assert (=> b!353087 (= e!216180 (not call!27109))))

(declare-fun b!353088 () Bool)

(assert (=> b!353088 (= e!216182 (validKeyInArray!0 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!353089 () Bool)

(assert (=> b!353089 (= e!216184 e!216175)))

(assert (=> b!353089 (= c!53600 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27106 () Bool)

(assert (=> bm!27106 (= call!27106 call!27110)))

(declare-fun bm!27107 () Bool)

(assert (=> bm!27107 (= call!27105 call!27108)))

(declare-fun b!353090 () Bool)

(declare-fun res!195827 () Bool)

(assert (=> b!353090 (=> (not res!195827) (not e!216187))))

(assert (=> b!353090 (= res!195827 e!216180)))

(declare-fun c!53598 () Bool)

(assert (=> b!353090 (= c!53598 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!71393 c!53601) b!353074))

(assert (= (and d!71393 (not c!53601)) b!353089))

(assert (= (and b!353089 c!53600) b!353080))

(assert (= (and b!353089 (not c!53600)) b!353078))

(assert (= (and b!353078 c!53603) b!353084))

(assert (= (and b!353078 (not c!53603)) b!353081))

(assert (= (or b!353084 b!353081) bm!27107))

(assert (= (or b!353080 bm!27107) bm!27102))

(assert (= (or b!353080 b!353084) bm!27106))

(assert (= (or b!353074 bm!27102) bm!27101))

(assert (= (or b!353074 bm!27106) bm!27105))

(assert (= (and d!71393 res!195824) b!353088))

(assert (= (and d!71393 c!53602) b!353079))

(assert (= (and d!71393 (not c!53602)) b!353070))

(assert (= (and d!71393 res!195823) b!353073))

(assert (= (and b!353073 res!195820) b!353076))

(assert (= (and b!353073 (not res!195821)) b!353075))

(assert (= (and b!353075 res!195825) b!353085))

(assert (= (and b!353073 res!195826) b!353090))

(assert (= (and b!353090 c!53598) b!353072))

(assert (= (and b!353090 (not c!53598)) b!353087))

(assert (= (and b!353072 res!195819) b!353077))

(assert (= (or b!353072 b!353087) bm!27104))

(assert (= (and b!353090 res!195827) b!353083))

(assert (= (and b!353083 c!53599) b!353086))

(assert (= (and b!353083 (not c!53599)) b!353071))

(assert (= (and b!353086 res!195822) b!353082))

(assert (= (or b!353086 b!353071) bm!27103))

(declare-fun b_lambda!8505 () Bool)

(assert (=> (not b_lambda!8505) (not b!353085)))

(declare-fun t!10387 () Bool)

(declare-fun tb!3099 () Bool)

(assert (=> (and start!35218 (= defaultEntry!1528 defaultEntry!1528) t!10387) tb!3099))

(declare-fun result!5643 () Bool)

(assert (=> tb!3099 (= result!5643 tp_is_empty!7759)))

(assert (=> b!353085 t!10387))

(declare-fun b_and!15027 () Bool)

(assert (= b_and!15021 (and (=> t!10387 result!5643) b_and!15027)))

(declare-fun m!351999 () Bool)

(assert (=> bm!27101 m!351999))

(declare-fun m!352001 () Bool)

(assert (=> b!353077 m!352001))

(declare-fun m!352003 () Bool)

(assert (=> b!353082 m!352003))

(declare-fun m!352005 () Bool)

(assert (=> b!353088 m!352005))

(assert (=> b!353088 m!352005))

(declare-fun m!352007 () Bool)

(assert (=> b!353088 m!352007))

(declare-fun m!352009 () Bool)

(assert (=> bm!27103 m!352009))

(assert (=> b!353076 m!352005))

(assert (=> b!353076 m!352005))

(assert (=> b!353076 m!352007))

(assert (=> d!71393 m!351943))

(declare-fun m!352011 () Bool)

(assert (=> b!353074 m!352011))

(declare-fun m!352013 () Bool)

(assert (=> bm!27104 m!352013))

(assert (=> b!353075 m!352005))

(assert (=> b!353075 m!352005))

(declare-fun m!352015 () Bool)

(assert (=> b!353075 m!352015))

(assert (=> b!353085 m!352005))

(declare-fun m!352017 () Bool)

(assert (=> b!353085 m!352017))

(declare-fun m!352019 () Bool)

(assert (=> b!353085 m!352019))

(declare-fun m!352021 () Bool)

(assert (=> b!353085 m!352021))

(declare-fun m!352023 () Bool)

(assert (=> b!353085 m!352023))

(assert (=> b!353085 m!352021))

(assert (=> b!353085 m!352005))

(assert (=> b!353085 m!352019))

(declare-fun m!352025 () Bool)

(assert (=> b!353079 m!352025))

(declare-fun m!352027 () Bool)

(assert (=> b!353079 m!352027))

(declare-fun m!352029 () Bool)

(assert (=> b!353079 m!352029))

(declare-fun m!352031 () Bool)

(assert (=> b!353079 m!352031))

(assert (=> b!353079 m!352029))

(declare-fun m!352033 () Bool)

(assert (=> b!353079 m!352033))

(declare-fun m!352035 () Bool)

(assert (=> b!353079 m!352035))

(declare-fun m!352037 () Bool)

(assert (=> b!353079 m!352037))

(declare-fun m!352039 () Bool)

(assert (=> b!353079 m!352039))

(declare-fun m!352041 () Bool)

(assert (=> b!353079 m!352041))

(declare-fun m!352043 () Bool)

(assert (=> b!353079 m!352043))

(assert (=> b!353079 m!352005))

(assert (=> b!353079 m!352025))

(declare-fun m!352045 () Bool)

(assert (=> b!353079 m!352045))

(assert (=> b!353079 m!352045))

(declare-fun m!352047 () Bool)

(assert (=> b!353079 m!352047))

(declare-fun m!352049 () Bool)

(assert (=> b!353079 m!352049))

(assert (=> b!353079 m!351999))

(declare-fun m!352051 () Bool)

(assert (=> b!353079 m!352051))

(assert (=> b!353079 m!352043))

(declare-fun m!352053 () Bool)

(assert (=> b!353079 m!352053))

(declare-fun m!352055 () Bool)

(assert (=> bm!27105 m!352055))

(assert (=> b!352957 d!71393))

(declare-fun b!353105 () Bool)

(declare-fun lt!165329 () SeekEntryResult!3479)

(declare-fun e!216195 () SeekEntryResult!3479)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19085 (_ BitVec 32)) SeekEntryResult!3479)

(assert (=> b!353105 (= e!216195 (seekKeyOrZeroReturnVacant!0 (x!35140 lt!165329) (index!16097 lt!165329) (index!16097 lt!165329) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!353106 () Bool)

(declare-fun e!216194 () SeekEntryResult!3479)

(assert (=> b!353106 (= e!216194 (Found!3479 (index!16097 lt!165329)))))

(declare-fun b!353107 () Bool)

(declare-fun e!216196 () SeekEntryResult!3479)

(assert (=> b!353107 (= e!216196 Undefined!3479)))

(declare-fun b!353108 () Bool)

(assert (=> b!353108 (= e!216196 e!216194)))

(declare-fun lt!165328 () (_ BitVec 64))

(assert (=> b!353108 (= lt!165328 (select (arr!9043 _keys!1895) (index!16097 lt!165329)))))

(declare-fun c!53610 () Bool)

(assert (=> b!353108 (= c!53610 (= lt!165328 k0!1348))))

(declare-fun d!71395 () Bool)

(declare-fun lt!165330 () SeekEntryResult!3479)

(assert (=> d!71395 (and (or ((_ is Undefined!3479) lt!165330) (not ((_ is Found!3479) lt!165330)) (and (bvsge (index!16096 lt!165330) #b00000000000000000000000000000000) (bvslt (index!16096 lt!165330) (size!9396 _keys!1895)))) (or ((_ is Undefined!3479) lt!165330) ((_ is Found!3479) lt!165330) (not ((_ is MissingZero!3479) lt!165330)) (and (bvsge (index!16095 lt!165330) #b00000000000000000000000000000000) (bvslt (index!16095 lt!165330) (size!9396 _keys!1895)))) (or ((_ is Undefined!3479) lt!165330) ((_ is Found!3479) lt!165330) ((_ is MissingZero!3479) lt!165330) (not ((_ is MissingVacant!3479) lt!165330)) (and (bvsge (index!16098 lt!165330) #b00000000000000000000000000000000) (bvslt (index!16098 lt!165330) (size!9396 _keys!1895)))) (or ((_ is Undefined!3479) lt!165330) (ite ((_ is Found!3479) lt!165330) (= (select (arr!9043 _keys!1895) (index!16096 lt!165330)) k0!1348) (ite ((_ is MissingZero!3479) lt!165330) (= (select (arr!9043 _keys!1895) (index!16095 lt!165330)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3479) lt!165330) (= (select (arr!9043 _keys!1895) (index!16098 lt!165330)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71395 (= lt!165330 e!216196)))

(declare-fun c!53611 () Bool)

(assert (=> d!71395 (= c!53611 (and ((_ is Intermediate!3479) lt!165329) (undefined!4291 lt!165329)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19085 (_ BitVec 32)) SeekEntryResult!3479)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71395 (= lt!165329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71395 (validMask!0 mask!2385)))

(assert (=> d!71395 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!165330)))

(declare-fun b!353109 () Bool)

(declare-fun c!53612 () Bool)

(assert (=> b!353109 (= c!53612 (= lt!165328 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!353109 (= e!216194 e!216195)))

(declare-fun b!353110 () Bool)

(assert (=> b!353110 (= e!216195 (MissingZero!3479 (index!16097 lt!165329)))))

(assert (= (and d!71395 c!53611) b!353107))

(assert (= (and d!71395 (not c!53611)) b!353108))

(assert (= (and b!353108 c!53610) b!353106))

(assert (= (and b!353108 (not c!53610)) b!353109))

(assert (= (and b!353109 c!53612) b!353110))

(assert (= (and b!353109 (not c!53612)) b!353105))

(declare-fun m!352057 () Bool)

(assert (=> b!353105 m!352057))

(declare-fun m!352059 () Bool)

(assert (=> b!353108 m!352059))

(declare-fun m!352061 () Bool)

(assert (=> d!71395 m!352061))

(assert (=> d!71395 m!351943))

(declare-fun m!352063 () Bool)

(assert (=> d!71395 m!352063))

(declare-fun m!352065 () Bool)

(assert (=> d!71395 m!352065))

(declare-fun m!352067 () Bool)

(assert (=> d!71395 m!352067))

(assert (=> d!71395 m!352063))

(declare-fun m!352069 () Bool)

(assert (=> d!71395 m!352069))

(assert (=> b!352960 d!71395))

(declare-fun b!353121 () Bool)

(declare-fun e!216207 () Bool)

(declare-fun e!216206 () Bool)

(assert (=> b!353121 (= e!216207 e!216206)))

(declare-fun c!53615 () Bool)

(assert (=> b!353121 (= c!53615 (validKeyInArray!0 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!353122 () Bool)

(declare-fun call!27113 () Bool)

(assert (=> b!353122 (= e!216206 call!27113)))

(declare-fun b!353123 () Bool)

(declare-fun e!216205 () Bool)

(assert (=> b!353123 (= e!216205 e!216207)))

(declare-fun res!195834 () Bool)

(assert (=> b!353123 (=> (not res!195834) (not e!216207))))

(declare-fun e!216208 () Bool)

(assert (=> b!353123 (= res!195834 (not e!216208))))

(declare-fun res!195835 () Bool)

(assert (=> b!353123 (=> (not res!195835) (not e!216208))))

(assert (=> b!353123 (= res!195835 (validKeyInArray!0 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!353124 () Bool)

(declare-fun contains!2369 (List!5245 (_ BitVec 64)) Bool)

(assert (=> b!353124 (= e!216208 (contains!2369 Nil!5242 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27110 () Bool)

(assert (=> bm!27110 (= call!27113 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53615 (Cons!5241 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000) Nil!5242) Nil!5242)))))

(declare-fun b!353125 () Bool)

(assert (=> b!353125 (= e!216206 call!27113)))

(declare-fun d!71397 () Bool)

(declare-fun res!195836 () Bool)

(assert (=> d!71397 (=> res!195836 e!216205)))

(assert (=> d!71397 (= res!195836 (bvsge #b00000000000000000000000000000000 (size!9396 _keys!1895)))))

(assert (=> d!71397 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5242) e!216205)))

(assert (= (and d!71397 (not res!195836)) b!353123))

(assert (= (and b!353123 res!195835) b!353124))

(assert (= (and b!353123 res!195834) b!353121))

(assert (= (and b!353121 c!53615) b!353122))

(assert (= (and b!353121 (not c!53615)) b!353125))

(assert (= (or b!353122 b!353125) bm!27110))

(assert (=> b!353121 m!352005))

(assert (=> b!353121 m!352005))

(assert (=> b!353121 m!352007))

(assert (=> b!353123 m!352005))

(assert (=> b!353123 m!352005))

(assert (=> b!353123 m!352007))

(assert (=> b!353124 m!352005))

(assert (=> b!353124 m!352005))

(declare-fun m!352071 () Bool)

(assert (=> b!353124 m!352071))

(assert (=> bm!27110 m!352005))

(declare-fun m!352073 () Bool)

(assert (=> bm!27110 m!352073))

(assert (=> b!352959 d!71397))

(declare-fun d!71399 () Bool)

(assert (=> d!71399 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352962 d!71399))

(declare-fun d!71401 () Bool)

(declare-fun res!195842 () Bool)

(declare-fun e!216216 () Bool)

(assert (=> d!71401 (=> res!195842 e!216216)))

(assert (=> d!71401 (= res!195842 (bvsge #b00000000000000000000000000000000 (size!9396 _keys!1895)))))

(assert (=> d!71401 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!216216)))

(declare-fun b!353134 () Bool)

(declare-fun e!216215 () Bool)

(declare-fun call!27116 () Bool)

(assert (=> b!353134 (= e!216215 call!27116)))

(declare-fun bm!27113 () Bool)

(assert (=> bm!27113 (= call!27116 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!353135 () Bool)

(declare-fun e!216217 () Bool)

(assert (=> b!353135 (= e!216215 e!216217)))

(declare-fun lt!165337 () (_ BitVec 64))

(assert (=> b!353135 (= lt!165337 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165339 () Unit!10900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19085 (_ BitVec 64) (_ BitVec 32)) Unit!10900)

(assert (=> b!353135 (= lt!165339 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!165337 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353135 (arrayContainsKey!0 _keys!1895 lt!165337 #b00000000000000000000000000000000)))

(declare-fun lt!165338 () Unit!10900)

(assert (=> b!353135 (= lt!165338 lt!165339)))

(declare-fun res!195841 () Bool)

(assert (=> b!353135 (= res!195841 (= (seekEntryOrOpen!0 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3479 #b00000000000000000000000000000000)))))

(assert (=> b!353135 (=> (not res!195841) (not e!216217))))

(declare-fun b!353136 () Bool)

(assert (=> b!353136 (= e!216216 e!216215)))

(declare-fun c!53618 () Bool)

(assert (=> b!353136 (= c!53618 (validKeyInArray!0 (select (arr!9043 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!353137 () Bool)

(assert (=> b!353137 (= e!216217 call!27116)))

(assert (= (and d!71401 (not res!195842)) b!353136))

(assert (= (and b!353136 c!53618) b!353135))

(assert (= (and b!353136 (not c!53618)) b!353134))

(assert (= (and b!353135 res!195841) b!353137))

(assert (= (or b!353137 b!353134) bm!27113))

(declare-fun m!352075 () Bool)

(assert (=> bm!27113 m!352075))

(assert (=> b!353135 m!352005))

(declare-fun m!352077 () Bool)

(assert (=> b!353135 m!352077))

(declare-fun m!352079 () Bool)

(assert (=> b!353135 m!352079))

(assert (=> b!353135 m!352005))

(declare-fun m!352081 () Bool)

(assert (=> b!353135 m!352081))

(assert (=> b!353136 m!352005))

(assert (=> b!353136 m!352005))

(assert (=> b!353136 m!352007))

(assert (=> b!352963 d!71401))

(declare-fun b!353144 () Bool)

(declare-fun e!216222 () Bool)

(assert (=> b!353144 (= e!216222 tp_is_empty!7759)))

(declare-fun b!353145 () Bool)

(declare-fun e!216223 () Bool)

(assert (=> b!353145 (= e!216223 tp_is_empty!7759)))

(declare-fun mapNonEmpty!13134 () Bool)

(declare-fun mapRes!13134 () Bool)

(declare-fun tp!27030 () Bool)

(assert (=> mapNonEmpty!13134 (= mapRes!13134 (and tp!27030 e!216222))))

(declare-fun mapValue!13134 () ValueCell!3536)

(declare-fun mapRest!13134 () (Array (_ BitVec 32) ValueCell!3536))

(declare-fun mapKey!13134 () (_ BitVec 32))

(assert (=> mapNonEmpty!13134 (= mapRest!13125 (store mapRest!13134 mapKey!13134 mapValue!13134))))

(declare-fun mapIsEmpty!13134 () Bool)

(assert (=> mapIsEmpty!13134 mapRes!13134))

(declare-fun condMapEmpty!13134 () Bool)

(declare-fun mapDefault!13134 () ValueCell!3536)

(assert (=> mapNonEmpty!13125 (= condMapEmpty!13134 (= mapRest!13125 ((as const (Array (_ BitVec 32) ValueCell!3536)) mapDefault!13134)))))

(assert (=> mapNonEmpty!13125 (= tp!27014 (and e!216223 mapRes!13134))))

(assert (= (and mapNonEmpty!13125 condMapEmpty!13134) mapIsEmpty!13134))

(assert (= (and mapNonEmpty!13125 (not condMapEmpty!13134)) mapNonEmpty!13134))

(assert (= (and mapNonEmpty!13134 ((_ is ValueCellFull!3536) mapValue!13134)) b!353144))

(assert (= (and mapNonEmpty!13125 ((_ is ValueCellFull!3536) mapDefault!13134)) b!353145))

(declare-fun m!352083 () Bool)

(assert (=> mapNonEmpty!13134 m!352083))

(declare-fun b_lambda!8507 () Bool)

(assert (= b_lambda!8505 (or (and start!35218 b_free!7807) b_lambda!8507)))

(check-sat (not d!71395) (not bm!27113) (not b_lambda!8507) b_and!15027 (not d!71391) (not mapNonEmpty!13134) (not bm!27110) (not bm!27104) (not b!353079) (not b!353136) (not bm!27103) tp_is_empty!7759 (not b!353123) (not b!353025) (not bm!27105) (not b!353027) (not b!353135) (not b!353124) (not b!353076) (not b!353082) (not b_next!7807) (not b!353074) (not b!353088) (not d!71393) (not b!353075) (not b!353085) (not bm!27101) (not b!353105) (not b!353121) (not b!353077))
(check-sat b_and!15027 (not b_next!7807))
