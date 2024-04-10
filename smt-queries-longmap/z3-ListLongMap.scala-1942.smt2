; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34348 () Bool)

(assert start!34348)

(declare-fun b_free!7323 () Bool)

(declare-fun b_next!7323 () Bool)

(assert (=> start!34348 (= b_free!7323 (not b_next!7323))))

(declare-fun tp!25509 () Bool)

(declare-fun b_and!14527 () Bool)

(assert (=> start!34348 (= tp!25509 b_and!14527)))

(declare-fun b!343065 () Bool)

(declare-datatypes ((Unit!10707 0))(
  ( (Unit!10708) )
))
(declare-fun e!210360 () Unit!10707)

(declare-fun Unit!10709 () Unit!10707)

(assert (=> b!343065 (= e!210360 Unit!10709)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun lt!162318 () Unit!10707)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10677 0))(
  ( (V!10678 (val!3682 Int)) )
))
(declare-fun zeroValue!1467 () V!10677)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3294 0))(
  ( (ValueCellFull!3294 (v!5856 V!10677)) (EmptyCell!3294) )
))
(declare-datatypes ((array!18139 0))(
  ( (array!18140 (arr!8588 (Array (_ BitVec 32) ValueCell!3294)) (size!8940 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18139)

(declare-datatypes ((array!18141 0))(
  ( (array!18142 (arr!8589 (Array (_ BitVec 32) (_ BitVec 64))) (size!8941 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18141)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10677)

(declare-fun lemmaArrayContainsKeyThenInListMap!311 (array!18141 array!18139 (_ BitVec 32) (_ BitVec 32) V!10677 V!10677 (_ BitVec 64) (_ BitVec 32) Int) Unit!10707)

(declare-fun arrayScanForKey!0 (array!18141 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!343065 (= lt!162318 (lemmaArrayContainsKeyThenInListMap!311 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!343065 false))

(declare-fun mapIsEmpty!12345 () Bool)

(declare-fun mapRes!12345 () Bool)

(assert (=> mapIsEmpty!12345 mapRes!12345))

(declare-fun b!343066 () Bool)

(declare-fun res!189665 () Bool)

(declare-fun e!210358 () Bool)

(assert (=> b!343066 (=> (not res!189665) (not e!210358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343066 (= res!189665 (validKeyInArray!0 k0!1348))))

(declare-fun b!343067 () Bool)

(declare-fun e!210363 () Bool)

(declare-fun tp_is_empty!7275 () Bool)

(assert (=> b!343067 (= e!210363 tp_is_empty!7275)))

(declare-fun b!343069 () Bool)

(declare-fun res!189657 () Bool)

(assert (=> b!343069 (=> (not res!189657) (not e!210358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18141 (_ BitVec 32)) Bool)

(assert (=> b!343069 (= res!189657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343070 () Bool)

(declare-fun e!210359 () Bool)

(assert (=> b!343070 (= e!210359 tp_is_empty!7275)))

(declare-fun b!343071 () Bool)

(declare-fun res!189664 () Bool)

(assert (=> b!343071 (=> (not res!189664) (not e!210358))))

(declare-datatypes ((List!4953 0))(
  ( (Nil!4950) (Cons!4949 (h!5805 (_ BitVec 64)) (t!10065 List!4953)) )
))
(declare-fun arrayNoDuplicates!0 (array!18141 (_ BitVec 32) List!4953) Bool)

(assert (=> b!343071 (= res!189664 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4950))))

(declare-fun b!343072 () Bool)

(declare-fun res!189659 () Bool)

(assert (=> b!343072 (=> (not res!189659) (not e!210358))))

(declare-datatypes ((tuple2!5334 0))(
  ( (tuple2!5335 (_1!2678 (_ BitVec 64)) (_2!2678 V!10677)) )
))
(declare-datatypes ((List!4954 0))(
  ( (Nil!4951) (Cons!4950 (h!5806 tuple2!5334) (t!10066 List!4954)) )
))
(declare-datatypes ((ListLongMap!4247 0))(
  ( (ListLongMap!4248 (toList!2139 List!4954)) )
))
(declare-fun contains!2195 (ListLongMap!4247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1660 (array!18141 array!18139 (_ BitVec 32) (_ BitVec 32) V!10677 V!10677 (_ BitVec 32) Int) ListLongMap!4247)

(assert (=> b!343072 (= res!189659 (not (contains!2195 (getCurrentListMap!1660 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343073 () Bool)

(declare-fun e!210362 () Bool)

(assert (=> b!343073 (= e!210358 e!210362)))

(declare-fun res!189658 () Bool)

(assert (=> b!343073 (=> (not res!189658) (not e!210362))))

(declare-datatypes ((SeekEntryResult!3313 0))(
  ( (MissingZero!3313 (index!15431 (_ BitVec 32))) (Found!3313 (index!15432 (_ BitVec 32))) (Intermediate!3313 (undefined!4125 Bool) (index!15433 (_ BitVec 32)) (x!34151 (_ BitVec 32))) (Undefined!3313) (MissingVacant!3313 (index!15434 (_ BitVec 32))) )
))
(declare-fun lt!162317 () SeekEntryResult!3313)

(get-info :version)

(assert (=> b!343073 (= res!189658 (and (not ((_ is Found!3313) lt!162317)) (not ((_ is MissingZero!3313) lt!162317)) ((_ is MissingVacant!3313) lt!162317)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18141 (_ BitVec 32)) SeekEntryResult!3313)

(assert (=> b!343073 (= lt!162317 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343074 () Bool)

(declare-fun e!210357 () Bool)

(assert (=> b!343074 (= e!210357 (and (= (select (arr!8589 _keys!1895) (index!15434 lt!162317)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!8941 _keys!1895))))))

(declare-fun b!343075 () Bool)

(assert (=> b!343075 (= e!210362 e!210357)))

(declare-fun res!189661 () Bool)

(assert (=> b!343075 (=> (not res!189661) (not e!210357))))

(declare-fun lt!162316 () Bool)

(assert (=> b!343075 (= res!189661 (not lt!162316))))

(declare-fun lt!162319 () Unit!10707)

(assert (=> b!343075 (= lt!162319 e!210360)))

(declare-fun c!52866 () Bool)

(assert (=> b!343075 (= c!52866 lt!162316)))

(declare-fun arrayContainsKey!0 (array!18141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!343075 (= lt!162316 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!343076 () Bool)

(declare-fun e!210356 () Bool)

(assert (=> b!343076 (= e!210356 (and e!210359 mapRes!12345))))

(declare-fun condMapEmpty!12345 () Bool)

(declare-fun mapDefault!12345 () ValueCell!3294)

(assert (=> b!343076 (= condMapEmpty!12345 (= (arr!8588 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3294)) mapDefault!12345)))))

(declare-fun b!343077 () Bool)

(declare-fun Unit!10710 () Unit!10707)

(assert (=> b!343077 (= e!210360 Unit!10710)))

(declare-fun b!343068 () Bool)

(declare-fun res!189662 () Bool)

(assert (=> b!343068 (=> (not res!189662) (not e!210358))))

(assert (=> b!343068 (= res!189662 (and (= (size!8940 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8941 _keys!1895) (size!8940 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!189660 () Bool)

(assert (=> start!34348 (=> (not res!189660) (not e!210358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34348 (= res!189660 (validMask!0 mask!2385))))

(assert (=> start!34348 e!210358))

(assert (=> start!34348 true))

(assert (=> start!34348 tp_is_empty!7275))

(assert (=> start!34348 tp!25509))

(declare-fun array_inv!6360 (array!18139) Bool)

(assert (=> start!34348 (and (array_inv!6360 _values!1525) e!210356)))

(declare-fun array_inv!6361 (array!18141) Bool)

(assert (=> start!34348 (array_inv!6361 _keys!1895)))

(declare-fun mapNonEmpty!12345 () Bool)

(declare-fun tp!25508 () Bool)

(assert (=> mapNonEmpty!12345 (= mapRes!12345 (and tp!25508 e!210363))))

(declare-fun mapRest!12345 () (Array (_ BitVec 32) ValueCell!3294))

(declare-fun mapKey!12345 () (_ BitVec 32))

(declare-fun mapValue!12345 () ValueCell!3294)

(assert (=> mapNonEmpty!12345 (= (arr!8588 _values!1525) (store mapRest!12345 mapKey!12345 mapValue!12345))))

(declare-fun b!343078 () Bool)

(declare-fun res!189663 () Bool)

(assert (=> b!343078 (=> (not res!189663) (not e!210357))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!343078 (= res!189663 (inRange!0 (index!15434 lt!162317) mask!2385))))

(assert (= (and start!34348 res!189660) b!343068))

(assert (= (and b!343068 res!189662) b!343069))

(assert (= (and b!343069 res!189657) b!343071))

(assert (= (and b!343071 res!189664) b!343066))

(assert (= (and b!343066 res!189665) b!343072))

(assert (= (and b!343072 res!189659) b!343073))

(assert (= (and b!343073 res!189658) b!343075))

(assert (= (and b!343075 c!52866) b!343065))

(assert (= (and b!343075 (not c!52866)) b!343077))

(assert (= (and b!343075 res!189661) b!343078))

(assert (= (and b!343078 res!189663) b!343074))

(assert (= (and b!343076 condMapEmpty!12345) mapIsEmpty!12345))

(assert (= (and b!343076 (not condMapEmpty!12345)) mapNonEmpty!12345))

(assert (= (and mapNonEmpty!12345 ((_ is ValueCellFull!3294) mapValue!12345)) b!343067))

(assert (= (and b!343076 ((_ is ValueCellFull!3294) mapDefault!12345)) b!343070))

(assert (= start!34348 b!343076))

(declare-fun m!345043 () Bool)

(assert (=> b!343073 m!345043))

(declare-fun m!345045 () Bool)

(assert (=> b!343071 m!345045))

(declare-fun m!345047 () Bool)

(assert (=> b!343074 m!345047))

(declare-fun m!345049 () Bool)

(assert (=> mapNonEmpty!12345 m!345049))

(declare-fun m!345051 () Bool)

(assert (=> b!343069 m!345051))

(declare-fun m!345053 () Bool)

(assert (=> b!343078 m!345053))

(declare-fun m!345055 () Bool)

(assert (=> b!343075 m!345055))

(declare-fun m!345057 () Bool)

(assert (=> start!34348 m!345057))

(declare-fun m!345059 () Bool)

(assert (=> start!34348 m!345059))

(declare-fun m!345061 () Bool)

(assert (=> start!34348 m!345061))

(declare-fun m!345063 () Bool)

(assert (=> b!343072 m!345063))

(assert (=> b!343072 m!345063))

(declare-fun m!345065 () Bool)

(assert (=> b!343072 m!345065))

(declare-fun m!345067 () Bool)

(assert (=> b!343066 m!345067))

(declare-fun m!345069 () Bool)

(assert (=> b!343065 m!345069))

(assert (=> b!343065 m!345069))

(declare-fun m!345071 () Bool)

(assert (=> b!343065 m!345071))

(check-sat (not b!343071) (not start!34348) b_and!14527 (not b!343066) tp_is_empty!7275 (not b!343078) (not b!343073) (not b!343069) (not mapNonEmpty!12345) (not b_next!7323) (not b!343072) (not b!343075) (not b!343065))
(check-sat b_and!14527 (not b_next!7323))
(get-model)

(declare-fun d!71023 () Bool)

(declare-fun e!210392 () Bool)

(assert (=> d!71023 e!210392))

(declare-fun res!189695 () Bool)

(assert (=> d!71023 (=> res!189695 e!210392)))

(declare-fun lt!162342 () Bool)

(assert (=> d!71023 (= res!189695 (not lt!162342))))

(declare-fun lt!162340 () Bool)

(assert (=> d!71023 (= lt!162342 lt!162340)))

(declare-fun lt!162341 () Unit!10707)

(declare-fun e!210393 () Unit!10707)

(assert (=> d!71023 (= lt!162341 e!210393)))

(declare-fun c!52872 () Bool)

(assert (=> d!71023 (= c!52872 lt!162340)))

(declare-fun containsKey!328 (List!4954 (_ BitVec 64)) Bool)

(assert (=> d!71023 (= lt!162340 (containsKey!328 (toList!2139 (getCurrentListMap!1660 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71023 (= (contains!2195 (getCurrentListMap!1660 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162342)))

(declare-fun b!343127 () Bool)

(declare-fun lt!162343 () Unit!10707)

(assert (=> b!343127 (= e!210393 lt!162343)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!276 (List!4954 (_ BitVec 64)) Unit!10707)

(assert (=> b!343127 (= lt!162343 (lemmaContainsKeyImpliesGetValueByKeyDefined!276 (toList!2139 (getCurrentListMap!1660 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!342 0))(
  ( (Some!341 (v!5858 V!10677)) (None!340) )
))
(declare-fun isDefined!277 (Option!342) Bool)

(declare-fun getValueByKey!336 (List!4954 (_ BitVec 64)) Option!342)

(assert (=> b!343127 (isDefined!277 (getValueByKey!336 (toList!2139 (getCurrentListMap!1660 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!343128 () Bool)

(declare-fun Unit!10714 () Unit!10707)

(assert (=> b!343128 (= e!210393 Unit!10714)))

(declare-fun b!343129 () Bool)

(assert (=> b!343129 (= e!210392 (isDefined!277 (getValueByKey!336 (toList!2139 (getCurrentListMap!1660 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71023 c!52872) b!343127))

(assert (= (and d!71023 (not c!52872)) b!343128))

(assert (= (and d!71023 (not res!189695)) b!343129))

(declare-fun m!345103 () Bool)

(assert (=> d!71023 m!345103))

(declare-fun m!345105 () Bool)

(assert (=> b!343127 m!345105))

(declare-fun m!345107 () Bool)

(assert (=> b!343127 m!345107))

(assert (=> b!343127 m!345107))

(declare-fun m!345109 () Bool)

(assert (=> b!343127 m!345109))

(assert (=> b!343129 m!345107))

(assert (=> b!343129 m!345107))

(assert (=> b!343129 m!345109))

(assert (=> b!343072 d!71023))

(declare-fun c!52888 () Bool)

(declare-fun c!52890 () Bool)

(declare-fun call!26640 () ListLongMap!4247)

(declare-fun call!26641 () ListLongMap!4247)

(declare-fun call!26635 () ListLongMap!4247)

(declare-fun bm!26632 () Bool)

(declare-fun call!26637 () ListLongMap!4247)

(declare-fun +!727 (ListLongMap!4247 tuple2!5334) ListLongMap!4247)

(assert (=> bm!26632 (= call!26635 (+!727 (ite c!52890 call!26641 (ite c!52888 call!26637 call!26640)) (ite (or c!52890 c!52888) (tuple2!5335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!343172 () Bool)

(declare-fun e!210422 () Bool)

(declare-fun lt!162392 () ListLongMap!4247)

(declare-fun apply!278 (ListLongMap!4247 (_ BitVec 64)) V!10677)

(declare-fun get!4648 (ValueCell!3294 V!10677) V!10677)

(declare-fun dynLambda!621 (Int (_ BitVec 64)) V!10677)

(assert (=> b!343172 (= e!210422 (= (apply!278 lt!162392 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000)) (get!4648 (select (arr!8588 _values!1525) #b00000000000000000000000000000000) (dynLambda!621 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!343172 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8940 _values!1525)))))

(assert (=> b!343172 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)))))

(declare-fun b!343173 () Bool)

(declare-fun e!210428 () Bool)

(assert (=> b!343173 (= e!210428 (validKeyInArray!0 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26633 () Bool)

(declare-fun call!26636 () Bool)

(assert (=> bm!26633 (= call!26636 (contains!2195 lt!162392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!343174 () Bool)

(declare-fun e!210429 () ListLongMap!4247)

(declare-fun call!26639 () ListLongMap!4247)

(assert (=> b!343174 (= e!210429 call!26639)))

(declare-fun b!343175 () Bool)

(declare-fun e!210427 () ListLongMap!4247)

(assert (=> b!343175 (= e!210427 call!26640)))

(declare-fun b!343176 () Bool)

(declare-fun e!210423 () Bool)

(assert (=> b!343176 (= e!210423 (not call!26636))))

(declare-fun b!343177 () Bool)

(declare-fun c!52885 () Bool)

(assert (=> b!343177 (= c!52885 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!343177 (= e!210429 e!210427)))

(declare-fun bm!26634 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!600 (array!18141 array!18139 (_ BitVec 32) (_ BitVec 32) V!10677 V!10677 (_ BitVec 32) Int) ListLongMap!4247)

(assert (=> bm!26634 (= call!26641 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!343178 () Bool)

(declare-fun e!210431 () Unit!10707)

(declare-fun Unit!10715 () Unit!10707)

(assert (=> b!343178 (= e!210431 Unit!10715)))

(declare-fun b!343179 () Bool)

(declare-fun e!210432 () Bool)

(declare-fun e!210420 () Bool)

(assert (=> b!343179 (= e!210432 e!210420)))

(declare-fun res!189716 () Bool)

(declare-fun call!26638 () Bool)

(assert (=> b!343179 (= res!189716 call!26638)))

(assert (=> b!343179 (=> (not res!189716) (not e!210420))))

(declare-fun b!343180 () Bool)

(declare-fun e!210426 () ListLongMap!4247)

(assert (=> b!343180 (= e!210426 (+!727 call!26635 (tuple2!5335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!343181 () Bool)

(declare-fun e!210421 () Bool)

(assert (=> b!343181 (= e!210423 e!210421)))

(declare-fun res!189715 () Bool)

(assert (=> b!343181 (= res!189715 call!26636)))

(assert (=> b!343181 (=> (not res!189715) (not e!210421))))

(declare-fun b!343182 () Bool)

(declare-fun e!210424 () Bool)

(assert (=> b!343182 (= e!210424 e!210432)))

(declare-fun c!52886 () Bool)

(assert (=> b!343182 (= c!52886 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!343183 () Bool)

(declare-fun res!189718 () Bool)

(assert (=> b!343183 (=> (not res!189718) (not e!210424))))

(assert (=> b!343183 (= res!189718 e!210423)))

(declare-fun c!52887 () Bool)

(assert (=> b!343183 (= c!52887 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!343184 () Bool)

(assert (=> b!343184 (= e!210420 (= (apply!278 lt!162392 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!343185 () Bool)

(declare-fun e!210425 () Bool)

(assert (=> b!343185 (= e!210425 e!210422)))

(declare-fun res!189717 () Bool)

(assert (=> b!343185 (=> (not res!189717) (not e!210422))))

(assert (=> b!343185 (= res!189717 (contains!2195 lt!162392 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!343185 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)))))

(declare-fun bm!26636 () Bool)

(assert (=> bm!26636 (= call!26637 call!26641)))

(declare-fun b!343186 () Bool)

(assert (=> b!343186 (= e!210426 e!210429)))

(assert (=> b!343186 (= c!52888 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26637 () Bool)

(assert (=> bm!26637 (= call!26638 (contains!2195 lt!162392 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!343187 () Bool)

(declare-fun lt!162393 () Unit!10707)

(assert (=> b!343187 (= e!210431 lt!162393)))

(declare-fun lt!162391 () ListLongMap!4247)

(assert (=> b!343187 (= lt!162391 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162397 () (_ BitVec 64))

(assert (=> b!343187 (= lt!162397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162409 () (_ BitVec 64))

(assert (=> b!343187 (= lt!162409 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162407 () Unit!10707)

(declare-fun addStillContains!254 (ListLongMap!4247 (_ BitVec 64) V!10677 (_ BitVec 64)) Unit!10707)

(assert (=> b!343187 (= lt!162407 (addStillContains!254 lt!162391 lt!162397 zeroValue!1467 lt!162409))))

(assert (=> b!343187 (contains!2195 (+!727 lt!162391 (tuple2!5335 lt!162397 zeroValue!1467)) lt!162409)))

(declare-fun lt!162395 () Unit!10707)

(assert (=> b!343187 (= lt!162395 lt!162407)))

(declare-fun lt!162405 () ListLongMap!4247)

(assert (=> b!343187 (= lt!162405 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162406 () (_ BitVec 64))

(assert (=> b!343187 (= lt!162406 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162404 () (_ BitVec 64))

(assert (=> b!343187 (= lt!162404 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162399 () Unit!10707)

(declare-fun addApplyDifferent!254 (ListLongMap!4247 (_ BitVec 64) V!10677 (_ BitVec 64)) Unit!10707)

(assert (=> b!343187 (= lt!162399 (addApplyDifferent!254 lt!162405 lt!162406 minValue!1467 lt!162404))))

(assert (=> b!343187 (= (apply!278 (+!727 lt!162405 (tuple2!5335 lt!162406 minValue!1467)) lt!162404) (apply!278 lt!162405 lt!162404))))

(declare-fun lt!162390 () Unit!10707)

(assert (=> b!343187 (= lt!162390 lt!162399)))

(declare-fun lt!162401 () ListLongMap!4247)

(assert (=> b!343187 (= lt!162401 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162388 () (_ BitVec 64))

(assert (=> b!343187 (= lt!162388 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162398 () (_ BitVec 64))

(assert (=> b!343187 (= lt!162398 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162402 () Unit!10707)

(assert (=> b!343187 (= lt!162402 (addApplyDifferent!254 lt!162401 lt!162388 zeroValue!1467 lt!162398))))

(assert (=> b!343187 (= (apply!278 (+!727 lt!162401 (tuple2!5335 lt!162388 zeroValue!1467)) lt!162398) (apply!278 lt!162401 lt!162398))))

(declare-fun lt!162403 () Unit!10707)

(assert (=> b!343187 (= lt!162403 lt!162402)))

(declare-fun lt!162389 () ListLongMap!4247)

(assert (=> b!343187 (= lt!162389 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162400 () (_ BitVec 64))

(assert (=> b!343187 (= lt!162400 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162396 () (_ BitVec 64))

(assert (=> b!343187 (= lt!162396 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!343187 (= lt!162393 (addApplyDifferent!254 lt!162389 lt!162400 minValue!1467 lt!162396))))

(assert (=> b!343187 (= (apply!278 (+!727 lt!162389 (tuple2!5335 lt!162400 minValue!1467)) lt!162396) (apply!278 lt!162389 lt!162396))))

(declare-fun b!343188 () Bool)

(assert (=> b!343188 (= e!210427 call!26639)))

(declare-fun b!343189 () Bool)

(assert (=> b!343189 (= e!210432 (not call!26638))))

(declare-fun bm!26638 () Bool)

(assert (=> bm!26638 (= call!26640 call!26637)))

(declare-fun b!343190 () Bool)

(declare-fun res!189719 () Bool)

(assert (=> b!343190 (=> (not res!189719) (not e!210424))))

(assert (=> b!343190 (= res!189719 e!210425)))

(declare-fun res!189714 () Bool)

(assert (=> b!343190 (=> res!189714 e!210425)))

(declare-fun e!210430 () Bool)

(assert (=> b!343190 (= res!189714 (not e!210430))))

(declare-fun res!189721 () Bool)

(assert (=> b!343190 (=> (not res!189721) (not e!210430))))

(assert (=> b!343190 (= res!189721 (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)))))

(declare-fun d!71025 () Bool)

(assert (=> d!71025 e!210424))

(declare-fun res!189720 () Bool)

(assert (=> d!71025 (=> (not res!189720) (not e!210424))))

(assert (=> d!71025 (= res!189720 (or (bvsge #b00000000000000000000000000000000 (size!8941 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)))))))

(declare-fun lt!162394 () ListLongMap!4247)

(assert (=> d!71025 (= lt!162392 lt!162394)))

(declare-fun lt!162408 () Unit!10707)

(assert (=> d!71025 (= lt!162408 e!210431)))

(declare-fun c!52889 () Bool)

(assert (=> d!71025 (= c!52889 e!210428)))

(declare-fun res!189722 () Bool)

(assert (=> d!71025 (=> (not res!189722) (not e!210428))))

(assert (=> d!71025 (= res!189722 (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)))))

(assert (=> d!71025 (= lt!162394 e!210426)))

(assert (=> d!71025 (= c!52890 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71025 (validMask!0 mask!2385)))

(assert (=> d!71025 (= (getCurrentListMap!1660 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162392)))

(declare-fun bm!26635 () Bool)

(assert (=> bm!26635 (= call!26639 call!26635)))

(declare-fun b!343191 () Bool)

(assert (=> b!343191 (= e!210430 (validKeyInArray!0 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343192 () Bool)

(assert (=> b!343192 (= e!210421 (= (apply!278 lt!162392 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(assert (= (and d!71025 c!52890) b!343180))

(assert (= (and d!71025 (not c!52890)) b!343186))

(assert (= (and b!343186 c!52888) b!343174))

(assert (= (and b!343186 (not c!52888)) b!343177))

(assert (= (and b!343177 c!52885) b!343188))

(assert (= (and b!343177 (not c!52885)) b!343175))

(assert (= (or b!343188 b!343175) bm!26638))

(assert (= (or b!343174 bm!26638) bm!26636))

(assert (= (or b!343174 b!343188) bm!26635))

(assert (= (or b!343180 bm!26636) bm!26634))

(assert (= (or b!343180 bm!26635) bm!26632))

(assert (= (and d!71025 res!189722) b!343173))

(assert (= (and d!71025 c!52889) b!343187))

(assert (= (and d!71025 (not c!52889)) b!343178))

(assert (= (and d!71025 res!189720) b!343190))

(assert (= (and b!343190 res!189721) b!343191))

(assert (= (and b!343190 (not res!189714)) b!343185))

(assert (= (and b!343185 res!189717) b!343172))

(assert (= (and b!343190 res!189719) b!343183))

(assert (= (and b!343183 c!52887) b!343181))

(assert (= (and b!343183 (not c!52887)) b!343176))

(assert (= (and b!343181 res!189715) b!343192))

(assert (= (or b!343181 b!343176) bm!26633))

(assert (= (and b!343183 res!189718) b!343182))

(assert (= (and b!343182 c!52886) b!343179))

(assert (= (and b!343182 (not c!52886)) b!343189))

(assert (= (and b!343179 res!189716) b!343184))

(assert (= (or b!343179 b!343189) bm!26637))

(declare-fun b_lambda!8451 () Bool)

(assert (=> (not b_lambda!8451) (not b!343172)))

(declare-fun t!10070 () Bool)

(declare-fun tb!3071 () Bool)

(assert (=> (and start!34348 (= defaultEntry!1528 defaultEntry!1528) t!10070) tb!3071))

(declare-fun result!5543 () Bool)

(assert (=> tb!3071 (= result!5543 tp_is_empty!7275)))

(assert (=> b!343172 t!10070))

(declare-fun b_and!14531 () Bool)

(assert (= b_and!14527 (and (=> t!10070 result!5543) b_and!14531)))

(assert (=> d!71025 m!345057))

(declare-fun m!345111 () Bool)

(assert (=> b!343187 m!345111))

(declare-fun m!345113 () Bool)

(assert (=> b!343187 m!345113))

(declare-fun m!345115 () Bool)

(assert (=> b!343187 m!345115))

(declare-fun m!345117 () Bool)

(assert (=> b!343187 m!345117))

(declare-fun m!345119 () Bool)

(assert (=> b!343187 m!345119))

(declare-fun m!345121 () Bool)

(assert (=> b!343187 m!345121))

(declare-fun m!345123 () Bool)

(assert (=> b!343187 m!345123))

(declare-fun m!345125 () Bool)

(assert (=> b!343187 m!345125))

(declare-fun m!345127 () Bool)

(assert (=> b!343187 m!345127))

(declare-fun m!345129 () Bool)

(assert (=> b!343187 m!345129))

(declare-fun m!345131 () Bool)

(assert (=> b!343187 m!345131))

(declare-fun m!345133 () Bool)

(assert (=> b!343187 m!345133))

(assert (=> b!343187 m!345127))

(declare-fun m!345135 () Bool)

(assert (=> b!343187 m!345135))

(assert (=> b!343187 m!345131))

(declare-fun m!345137 () Bool)

(assert (=> b!343187 m!345137))

(declare-fun m!345139 () Bool)

(assert (=> b!343187 m!345139))

(assert (=> b!343187 m!345115))

(declare-fun m!345141 () Bool)

(assert (=> b!343187 m!345141))

(declare-fun m!345143 () Bool)

(assert (=> b!343187 m!345143))

(assert (=> b!343187 m!345119))

(assert (=> b!343173 m!345133))

(assert (=> b!343173 m!345133))

(declare-fun m!345145 () Bool)

(assert (=> b!343173 m!345145))

(declare-fun m!345147 () Bool)

(assert (=> bm!26633 m!345147))

(declare-fun m!345149 () Bool)

(assert (=> bm!26637 m!345149))

(assert (=> bm!26634 m!345135))

(assert (=> b!343191 m!345133))

(assert (=> b!343191 m!345133))

(assert (=> b!343191 m!345145))

(declare-fun m!345151 () Bool)

(assert (=> b!343184 m!345151))

(assert (=> b!343185 m!345133))

(assert (=> b!343185 m!345133))

(declare-fun m!345153 () Bool)

(assert (=> b!343185 m!345153))

(declare-fun m!345155 () Bool)

(assert (=> b!343180 m!345155))

(declare-fun m!345157 () Bool)

(assert (=> b!343172 m!345157))

(assert (=> b!343172 m!345157))

(declare-fun m!345159 () Bool)

(assert (=> b!343172 m!345159))

(declare-fun m!345161 () Bool)

(assert (=> b!343172 m!345161))

(assert (=> b!343172 m!345133))

(assert (=> b!343172 m!345133))

(declare-fun m!345163 () Bool)

(assert (=> b!343172 m!345163))

(assert (=> b!343172 m!345159))

(declare-fun m!345165 () Bool)

(assert (=> b!343192 m!345165))

(declare-fun m!345167 () Bool)

(assert (=> bm!26632 m!345167))

(assert (=> b!343072 d!71025))

(declare-fun d!71027 () Bool)

(assert (=> d!71027 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34348 d!71027))

(declare-fun d!71029 () Bool)

(assert (=> d!71029 (= (array_inv!6360 _values!1525) (bvsge (size!8940 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34348 d!71029))

(declare-fun d!71031 () Bool)

(assert (=> d!71031 (= (array_inv!6361 _keys!1895) (bvsge (size!8941 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34348 d!71031))

(declare-fun b!343207 () Bool)

(declare-fun e!210439 () SeekEntryResult!3313)

(declare-fun lt!162417 () SeekEntryResult!3313)

(assert (=> b!343207 (= e!210439 (Found!3313 (index!15433 lt!162417)))))

(declare-fun b!343208 () Bool)

(declare-fun e!210440 () SeekEntryResult!3313)

(assert (=> b!343208 (= e!210440 (MissingZero!3313 (index!15433 lt!162417)))))

(declare-fun b!343209 () Bool)

(declare-fun e!210441 () SeekEntryResult!3313)

(assert (=> b!343209 (= e!210441 Undefined!3313)))

(declare-fun b!343210 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18141 (_ BitVec 32)) SeekEntryResult!3313)

(assert (=> b!343210 (= e!210440 (seekKeyOrZeroReturnVacant!0 (x!34151 lt!162417) (index!15433 lt!162417) (index!15433 lt!162417) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343211 () Bool)

(declare-fun c!52899 () Bool)

(declare-fun lt!162416 () (_ BitVec 64))

(assert (=> b!343211 (= c!52899 (= lt!162416 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!343211 (= e!210439 e!210440)))

(declare-fun b!343212 () Bool)

(assert (=> b!343212 (= e!210441 e!210439)))

(assert (=> b!343212 (= lt!162416 (select (arr!8589 _keys!1895) (index!15433 lt!162417)))))

(declare-fun c!52897 () Bool)

(assert (=> b!343212 (= c!52897 (= lt!162416 k0!1348))))

(declare-fun d!71033 () Bool)

(declare-fun lt!162418 () SeekEntryResult!3313)

(assert (=> d!71033 (and (or ((_ is Undefined!3313) lt!162418) (not ((_ is Found!3313) lt!162418)) (and (bvsge (index!15432 lt!162418) #b00000000000000000000000000000000) (bvslt (index!15432 lt!162418) (size!8941 _keys!1895)))) (or ((_ is Undefined!3313) lt!162418) ((_ is Found!3313) lt!162418) (not ((_ is MissingZero!3313) lt!162418)) (and (bvsge (index!15431 lt!162418) #b00000000000000000000000000000000) (bvslt (index!15431 lt!162418) (size!8941 _keys!1895)))) (or ((_ is Undefined!3313) lt!162418) ((_ is Found!3313) lt!162418) ((_ is MissingZero!3313) lt!162418) (not ((_ is MissingVacant!3313) lt!162418)) (and (bvsge (index!15434 lt!162418) #b00000000000000000000000000000000) (bvslt (index!15434 lt!162418) (size!8941 _keys!1895)))) (or ((_ is Undefined!3313) lt!162418) (ite ((_ is Found!3313) lt!162418) (= (select (arr!8589 _keys!1895) (index!15432 lt!162418)) k0!1348) (ite ((_ is MissingZero!3313) lt!162418) (= (select (arr!8589 _keys!1895) (index!15431 lt!162418)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3313) lt!162418) (= (select (arr!8589 _keys!1895) (index!15434 lt!162418)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71033 (= lt!162418 e!210441)))

(declare-fun c!52898 () Bool)

(assert (=> d!71033 (= c!52898 (and ((_ is Intermediate!3313) lt!162417) (undefined!4125 lt!162417)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18141 (_ BitVec 32)) SeekEntryResult!3313)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71033 (= lt!162417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71033 (validMask!0 mask!2385)))

(assert (=> d!71033 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162418)))

(assert (= (and d!71033 c!52898) b!343209))

(assert (= (and d!71033 (not c!52898)) b!343212))

(assert (= (and b!343212 c!52897) b!343207))

(assert (= (and b!343212 (not c!52897)) b!343211))

(assert (= (and b!343211 c!52899) b!343208))

(assert (= (and b!343211 (not c!52899)) b!343210))

(declare-fun m!345169 () Bool)

(assert (=> b!343210 m!345169))

(declare-fun m!345171 () Bool)

(assert (=> b!343212 m!345171))

(declare-fun m!345173 () Bool)

(assert (=> d!71033 m!345173))

(declare-fun m!345175 () Bool)

(assert (=> d!71033 m!345175))

(declare-fun m!345177 () Bool)

(assert (=> d!71033 m!345177))

(assert (=> d!71033 m!345175))

(declare-fun m!345179 () Bool)

(assert (=> d!71033 m!345179))

(assert (=> d!71033 m!345057))

(declare-fun m!345181 () Bool)

(assert (=> d!71033 m!345181))

(assert (=> b!343073 d!71033))

(declare-fun d!71035 () Bool)

(assert (=> d!71035 (= (inRange!0 (index!15434 lt!162317) mask!2385) (and (bvsge (index!15434 lt!162317) #b00000000000000000000000000000000) (bvslt (index!15434 lt!162317) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!343078 d!71035))

(declare-fun d!71037 () Bool)

(assert (=> d!71037 (contains!2195 (getCurrentListMap!1660 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!162421 () Unit!10707)

(declare-fun choose!1304 (array!18141 array!18139 (_ BitVec 32) (_ BitVec 32) V!10677 V!10677 (_ BitVec 64) (_ BitVec 32) Int) Unit!10707)

(assert (=> d!71037 (= lt!162421 (choose!1304 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71037 (validMask!0 mask!2385)))

(assert (=> d!71037 (= (lemmaArrayContainsKeyThenInListMap!311 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!162421)))

(declare-fun bs!11762 () Bool)

(assert (= bs!11762 d!71037))

(assert (=> bs!11762 m!345063))

(assert (=> bs!11762 m!345063))

(assert (=> bs!11762 m!345065))

(assert (=> bs!11762 m!345069))

(declare-fun m!345183 () Bool)

(assert (=> bs!11762 m!345183))

(assert (=> bs!11762 m!345057))

(assert (=> b!343065 d!71037))

(declare-fun d!71039 () Bool)

(declare-fun lt!162424 () (_ BitVec 32))

(assert (=> d!71039 (and (or (bvslt lt!162424 #b00000000000000000000000000000000) (bvsge lt!162424 (size!8941 _keys!1895)) (and (bvsge lt!162424 #b00000000000000000000000000000000) (bvslt lt!162424 (size!8941 _keys!1895)))) (bvsge lt!162424 #b00000000000000000000000000000000) (bvslt lt!162424 (size!8941 _keys!1895)) (= (select (arr!8589 _keys!1895) lt!162424) k0!1348))))

(declare-fun e!210444 () (_ BitVec 32))

(assert (=> d!71039 (= lt!162424 e!210444)))

(declare-fun c!52902 () Bool)

(assert (=> d!71039 (= c!52902 (= (select (arr!8589 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71039 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)) (bvslt (size!8941 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71039 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!162424)))

(declare-fun b!343217 () Bool)

(assert (=> b!343217 (= e!210444 #b00000000000000000000000000000000)))

(declare-fun b!343218 () Bool)

(assert (=> b!343218 (= e!210444 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71039 c!52902) b!343217))

(assert (= (and d!71039 (not c!52902)) b!343218))

(declare-fun m!345185 () Bool)

(assert (=> d!71039 m!345185))

(assert (=> d!71039 m!345133))

(declare-fun m!345187 () Bool)

(assert (=> b!343218 m!345187))

(assert (=> b!343065 d!71039))

(declare-fun b!343227 () Bool)

(declare-fun e!210453 () Bool)

(declare-fun call!26644 () Bool)

(assert (=> b!343227 (= e!210453 call!26644)))

(declare-fun d!71041 () Bool)

(declare-fun res!189728 () Bool)

(declare-fun e!210452 () Bool)

(assert (=> d!71041 (=> res!189728 e!210452)))

(assert (=> d!71041 (= res!189728 (bvsge #b00000000000000000000000000000000 (size!8941 _keys!1895)))))

(assert (=> d!71041 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!210452)))

(declare-fun b!343228 () Bool)

(declare-fun e!210451 () Bool)

(assert (=> b!343228 (= e!210451 e!210453)))

(declare-fun lt!162431 () (_ BitVec 64))

(assert (=> b!343228 (= lt!162431 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162432 () Unit!10707)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18141 (_ BitVec 64) (_ BitVec 32)) Unit!10707)

(assert (=> b!343228 (= lt!162432 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162431 #b00000000000000000000000000000000))))

(assert (=> b!343228 (arrayContainsKey!0 _keys!1895 lt!162431 #b00000000000000000000000000000000)))

(declare-fun lt!162433 () Unit!10707)

(assert (=> b!343228 (= lt!162433 lt!162432)))

(declare-fun res!189727 () Bool)

(assert (=> b!343228 (= res!189727 (= (seekEntryOrOpen!0 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3313 #b00000000000000000000000000000000)))))

(assert (=> b!343228 (=> (not res!189727) (not e!210453))))

(declare-fun bm!26641 () Bool)

(assert (=> bm!26641 (= call!26644 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!343229 () Bool)

(assert (=> b!343229 (= e!210452 e!210451)))

(declare-fun c!52905 () Bool)

(assert (=> b!343229 (= c!52905 (validKeyInArray!0 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343230 () Bool)

(assert (=> b!343230 (= e!210451 call!26644)))

(assert (= (and d!71041 (not res!189728)) b!343229))

(assert (= (and b!343229 c!52905) b!343228))

(assert (= (and b!343229 (not c!52905)) b!343230))

(assert (= (and b!343228 res!189727) b!343227))

(assert (= (or b!343227 b!343230) bm!26641))

(assert (=> b!343228 m!345133))

(declare-fun m!345189 () Bool)

(assert (=> b!343228 m!345189))

(declare-fun m!345191 () Bool)

(assert (=> b!343228 m!345191))

(assert (=> b!343228 m!345133))

(declare-fun m!345193 () Bool)

(assert (=> b!343228 m!345193))

(declare-fun m!345195 () Bool)

(assert (=> bm!26641 m!345195))

(assert (=> b!343229 m!345133))

(assert (=> b!343229 m!345133))

(assert (=> b!343229 m!345145))

(assert (=> b!343069 d!71041))

(declare-fun d!71043 () Bool)

(declare-fun res!189733 () Bool)

(declare-fun e!210458 () Bool)

(assert (=> d!71043 (=> res!189733 e!210458)))

(assert (=> d!71043 (= res!189733 (= (select (arr!8589 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71043 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!210458)))

(declare-fun b!343235 () Bool)

(declare-fun e!210459 () Bool)

(assert (=> b!343235 (= e!210458 e!210459)))

(declare-fun res!189734 () Bool)

(assert (=> b!343235 (=> (not res!189734) (not e!210459))))

(assert (=> b!343235 (= res!189734 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8941 _keys!1895)))))

(declare-fun b!343236 () Bool)

(assert (=> b!343236 (= e!210459 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71043 (not res!189733)) b!343235))

(assert (= (and b!343235 res!189734) b!343236))

(assert (=> d!71043 m!345133))

(declare-fun m!345197 () Bool)

(assert (=> b!343236 m!345197))

(assert (=> b!343075 d!71043))

(declare-fun d!71045 () Bool)

(assert (=> d!71045 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!343066 d!71045))

(declare-fun b!343247 () Bool)

(declare-fun e!210471 () Bool)

(declare-fun e!210470 () Bool)

(assert (=> b!343247 (= e!210471 e!210470)))

(declare-fun c!52908 () Bool)

(assert (=> b!343247 (= c!52908 (validKeyInArray!0 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343248 () Bool)

(declare-fun call!26647 () Bool)

(assert (=> b!343248 (= e!210470 call!26647)))

(declare-fun b!343249 () Bool)

(declare-fun e!210468 () Bool)

(declare-fun contains!2197 (List!4953 (_ BitVec 64)) Bool)

(assert (=> b!343249 (= e!210468 (contains!2197 Nil!4950 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26644 () Bool)

(assert (=> bm!26644 (= call!26647 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52908 (Cons!4949 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000) Nil!4950) Nil!4950)))))

(declare-fun d!71047 () Bool)

(declare-fun res!189741 () Bool)

(declare-fun e!210469 () Bool)

(assert (=> d!71047 (=> res!189741 e!210469)))

(assert (=> d!71047 (= res!189741 (bvsge #b00000000000000000000000000000000 (size!8941 _keys!1895)))))

(assert (=> d!71047 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4950) e!210469)))

(declare-fun b!343250 () Bool)

(assert (=> b!343250 (= e!210469 e!210471)))

(declare-fun res!189743 () Bool)

(assert (=> b!343250 (=> (not res!189743) (not e!210471))))

(assert (=> b!343250 (= res!189743 (not e!210468))))

(declare-fun res!189742 () Bool)

(assert (=> b!343250 (=> (not res!189742) (not e!210468))))

(assert (=> b!343250 (= res!189742 (validKeyInArray!0 (select (arr!8589 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343251 () Bool)

(assert (=> b!343251 (= e!210470 call!26647)))

(assert (= (and d!71047 (not res!189741)) b!343250))

(assert (= (and b!343250 res!189742) b!343249))

(assert (= (and b!343250 res!189743) b!343247))

(assert (= (and b!343247 c!52908) b!343248))

(assert (= (and b!343247 (not c!52908)) b!343251))

(assert (= (or b!343248 b!343251) bm!26644))

(assert (=> b!343247 m!345133))

(assert (=> b!343247 m!345133))

(assert (=> b!343247 m!345145))

(assert (=> b!343249 m!345133))

(assert (=> b!343249 m!345133))

(declare-fun m!345199 () Bool)

(assert (=> b!343249 m!345199))

(assert (=> bm!26644 m!345133))

(declare-fun m!345201 () Bool)

(assert (=> bm!26644 m!345201))

(assert (=> b!343250 m!345133))

(assert (=> b!343250 m!345133))

(assert (=> b!343250 m!345145))

(assert (=> b!343071 d!71047))

(declare-fun mapNonEmpty!12351 () Bool)

(declare-fun mapRes!12351 () Bool)

(declare-fun tp!25518 () Bool)

(declare-fun e!210477 () Bool)

(assert (=> mapNonEmpty!12351 (= mapRes!12351 (and tp!25518 e!210477))))

(declare-fun mapKey!12351 () (_ BitVec 32))

(declare-fun mapRest!12351 () (Array (_ BitVec 32) ValueCell!3294))

(declare-fun mapValue!12351 () ValueCell!3294)

(assert (=> mapNonEmpty!12351 (= mapRest!12345 (store mapRest!12351 mapKey!12351 mapValue!12351))))

(declare-fun b!343259 () Bool)

(declare-fun e!210476 () Bool)

(assert (=> b!343259 (= e!210476 tp_is_empty!7275)))

(declare-fun mapIsEmpty!12351 () Bool)

(assert (=> mapIsEmpty!12351 mapRes!12351))

(declare-fun b!343258 () Bool)

(assert (=> b!343258 (= e!210477 tp_is_empty!7275)))

(declare-fun condMapEmpty!12351 () Bool)

(declare-fun mapDefault!12351 () ValueCell!3294)

(assert (=> mapNonEmpty!12345 (= condMapEmpty!12351 (= mapRest!12345 ((as const (Array (_ BitVec 32) ValueCell!3294)) mapDefault!12351)))))

(assert (=> mapNonEmpty!12345 (= tp!25508 (and e!210476 mapRes!12351))))

(assert (= (and mapNonEmpty!12345 condMapEmpty!12351) mapIsEmpty!12351))

(assert (= (and mapNonEmpty!12345 (not condMapEmpty!12351)) mapNonEmpty!12351))

(assert (= (and mapNonEmpty!12351 ((_ is ValueCellFull!3294) mapValue!12351)) b!343258))

(assert (= (and mapNonEmpty!12345 ((_ is ValueCellFull!3294) mapDefault!12351)) b!343259))

(declare-fun m!345203 () Bool)

(assert (=> mapNonEmpty!12351 m!345203))

(declare-fun b_lambda!8453 () Bool)

(assert (= b_lambda!8451 (or (and start!34348 b_free!7323) b_lambda!8453)))

(check-sat (not b!343185) (not b!343127) (not b!343180) (not b!343172) tp_is_empty!7275 (not b!343250) (not b!343229) (not b!343249) (not b!343247) (not d!71033) (not b!343228) (not bm!26633) (not b!343173) (not bm!26637) (not d!71023) (not bm!26644) (not b!343191) (not bm!26634) (not mapNonEmpty!12351) b_and!14531 (not b!343187) (not b!343236) (not bm!26632) (not b!343184) (not d!71025) (not d!71037) (not b!343210) (not b_next!7323) (not b_lambda!8453) (not b!343192) (not b!343218) (not bm!26641) (not b!343129))
(check-sat b_and!14531 (not b_next!7323))
