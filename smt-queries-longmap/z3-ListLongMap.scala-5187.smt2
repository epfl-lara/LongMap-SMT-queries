; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70088 () Bool)

(assert start!70088)

(declare-fun b_free!12529 () Bool)

(declare-fun b_next!12529 () Bool)

(assert (=> start!70088 (= b_free!12529 (not b_next!12529))))

(declare-fun tp!44302 () Bool)

(declare-fun b_and!21275 () Bool)

(assert (=> start!70088 (= tp!44302 b_and!21275)))

(declare-fun b!814463 () Bool)

(declare-fun res!556326 () Bool)

(declare-fun e!451502 () Bool)

(assert (=> b!814463 (=> (not res!556326) (not e!451502))))

(declare-datatypes ((array!44671 0))(
  ( (array!44672 (arr!21396 (Array (_ BitVec 32) (_ BitVec 64))) (size!21817 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44671)

(declare-datatypes ((List!15252 0))(
  ( (Nil!15249) (Cons!15248 (h!16377 (_ BitVec 64)) (t!21560 List!15252)) )
))
(declare-fun arrayNoDuplicates!0 (array!44671 (_ BitVec 32) List!15252) Bool)

(assert (=> b!814463 (= res!556326 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15249))))

(declare-fun b!814464 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!814464 (= e!451502 (not (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!21817 _keys!976)))))))

(declare-datatypes ((V!23987 0))(
  ( (V!23988 (val!7167 Int)) )
))
(declare-datatypes ((tuple2!9424 0))(
  ( (tuple2!9425 (_1!4723 (_ BitVec 64)) (_2!4723 V!23987)) )
))
(declare-datatypes ((List!15253 0))(
  ( (Nil!15250) (Cons!15249 (h!16378 tuple2!9424) (t!21561 List!15253)) )
))
(declare-datatypes ((ListLongMap!8237 0))(
  ( (ListLongMap!8238 (toList!4134 List!15253)) )
))
(declare-fun lt!364491 () ListLongMap!8237)

(declare-fun lt!364490 () ListLongMap!8237)

(assert (=> b!814464 (= lt!364491 lt!364490)))

(declare-fun zeroValueBefore!34 () V!23987)

(declare-fun zeroValueAfter!34 () V!23987)

(declare-fun minValue!754 () V!23987)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!6704 0))(
  ( (ValueCellFull!6704 (v!9588 V!23987)) (EmptyCell!6704) )
))
(declare-datatypes ((array!44673 0))(
  ( (array!44674 (arr!21397 (Array (_ BitVec 32) ValueCell!6704)) (size!21818 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44673)

(declare-datatypes ((Unit!27702 0))(
  ( (Unit!27703) )
))
(declare-fun lt!364489 () Unit!27702)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!292 (array!44671 array!44673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23987 V!23987 V!23987 V!23987 (_ BitVec 32) Int) Unit!27702)

(assert (=> b!814464 (= lt!364489 (lemmaNoChangeToArrayThenSameMapNoExtras!292 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2199 (array!44671 array!44673 (_ BitVec 32) (_ BitVec 32) V!23987 V!23987 (_ BitVec 32) Int) ListLongMap!8237)

(assert (=> b!814464 (= lt!364490 (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814464 (= lt!364491 (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22939 () Bool)

(declare-fun mapRes!22939 () Bool)

(declare-fun tp!44301 () Bool)

(declare-fun e!451503 () Bool)

(assert (=> mapNonEmpty!22939 (= mapRes!22939 (and tp!44301 e!451503))))

(declare-fun mapValue!22939 () ValueCell!6704)

(declare-fun mapKey!22939 () (_ BitVec 32))

(declare-fun mapRest!22939 () (Array (_ BitVec 32) ValueCell!6704))

(assert (=> mapNonEmpty!22939 (= (arr!21397 _values!788) (store mapRest!22939 mapKey!22939 mapValue!22939))))

(declare-fun b!814465 () Bool)

(declare-fun e!451499 () Bool)

(declare-fun e!451500 () Bool)

(assert (=> b!814465 (= e!451499 (and e!451500 mapRes!22939))))

(declare-fun condMapEmpty!22939 () Bool)

(declare-fun mapDefault!22939 () ValueCell!6704)

(assert (=> b!814465 (= condMapEmpty!22939 (= (arr!21397 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6704)) mapDefault!22939)))))

(declare-fun b!814466 () Bool)

(declare-fun tp_is_empty!14239 () Bool)

(assert (=> b!814466 (= e!451500 tp_is_empty!14239)))

(declare-fun b!814467 () Bool)

(declare-fun res!556328 () Bool)

(assert (=> b!814467 (=> (not res!556328) (not e!451502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44671 (_ BitVec 32)) Bool)

(assert (=> b!814467 (= res!556328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556327 () Bool)

(assert (=> start!70088 (=> (not res!556327) (not e!451502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70088 (= res!556327 (validMask!0 mask!1312))))

(assert (=> start!70088 e!451502))

(assert (=> start!70088 tp_is_empty!14239))

(declare-fun array_inv!17201 (array!44671) Bool)

(assert (=> start!70088 (array_inv!17201 _keys!976)))

(assert (=> start!70088 true))

(declare-fun array_inv!17202 (array!44673) Bool)

(assert (=> start!70088 (and (array_inv!17202 _values!788) e!451499)))

(assert (=> start!70088 tp!44302))

(declare-fun b!814468 () Bool)

(assert (=> b!814468 (= e!451503 tp_is_empty!14239)))

(declare-fun b!814469 () Bool)

(declare-fun res!556325 () Bool)

(assert (=> b!814469 (=> (not res!556325) (not e!451502))))

(assert (=> b!814469 (= res!556325 (and (= (size!21818 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21817 _keys!976) (size!21818 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22939 () Bool)

(assert (=> mapIsEmpty!22939 mapRes!22939))

(assert (= (and start!70088 res!556327) b!814469))

(assert (= (and b!814469 res!556325) b!814467))

(assert (= (and b!814467 res!556328) b!814463))

(assert (= (and b!814463 res!556326) b!814464))

(assert (= (and b!814465 condMapEmpty!22939) mapIsEmpty!22939))

(assert (= (and b!814465 (not condMapEmpty!22939)) mapNonEmpty!22939))

(get-info :version)

(assert (= (and mapNonEmpty!22939 ((_ is ValueCellFull!6704) mapValue!22939)) b!814468))

(assert (= (and b!814465 ((_ is ValueCellFull!6704) mapDefault!22939)) b!814466))

(assert (= start!70088 b!814465))

(declare-fun m!755733 () Bool)

(assert (=> b!814463 m!755733))

(declare-fun m!755735 () Bool)

(assert (=> b!814467 m!755735))

(declare-fun m!755737 () Bool)

(assert (=> mapNonEmpty!22939 m!755737))

(declare-fun m!755739 () Bool)

(assert (=> b!814464 m!755739))

(declare-fun m!755741 () Bool)

(assert (=> b!814464 m!755741))

(declare-fun m!755743 () Bool)

(assert (=> b!814464 m!755743))

(declare-fun m!755745 () Bool)

(assert (=> start!70088 m!755745))

(declare-fun m!755747 () Bool)

(assert (=> start!70088 m!755747))

(declare-fun m!755749 () Bool)

(assert (=> start!70088 m!755749))

(check-sat (not start!70088) (not b!814467) (not b!814464) b_and!21275 (not mapNonEmpty!22939) (not b!814463) tp_is_empty!14239 (not b_next!12529))
(check-sat b_and!21275 (not b_next!12529))
(get-model)

(declare-fun d!104239 () Bool)

(assert (=> d!104239 (= (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!364512 () Unit!27702)

(declare-fun choose!1396 (array!44671 array!44673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23987 V!23987 V!23987 V!23987 (_ BitVec 32) Int) Unit!27702)

(assert (=> d!104239 (= lt!364512 (choose!1396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104239 (validMask!0 mask!1312)))

(assert (=> d!104239 (= (lemmaNoChangeToArrayThenSameMapNoExtras!292 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!364512)))

(declare-fun bs!22640 () Bool)

(assert (= bs!22640 d!104239))

(assert (=> bs!22640 m!755743))

(assert (=> bs!22640 m!755741))

(declare-fun m!755787 () Bool)

(assert (=> bs!22640 m!755787))

(assert (=> bs!22640 m!755745))

(assert (=> b!814464 d!104239))

(declare-fun b!814536 () Bool)

(declare-fun e!451554 () ListLongMap!8237)

(declare-fun e!451552 () ListLongMap!8237)

(assert (=> b!814536 (= e!451554 e!451552)))

(declare-fun c!88865 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!814536 (= c!88865 (validKeyInArray!0 (select (arr!21396 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!814537 () Bool)

(declare-fun call!35476 () ListLongMap!8237)

(assert (=> b!814537 (= e!451552 call!35476)))

(declare-fun bm!35473 () Bool)

(assert (=> bm!35473 (= call!35476 (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!814539 () Bool)

(declare-fun e!451553 () Bool)

(declare-fun e!451550 () Bool)

(assert (=> b!814539 (= e!451553 e!451550)))

(declare-fun c!88863 () Bool)

(declare-fun e!451548 () Bool)

(assert (=> b!814539 (= c!88863 e!451548)))

(declare-fun res!556363 () Bool)

(assert (=> b!814539 (=> (not res!556363) (not e!451548))))

(assert (=> b!814539 (= res!556363 (bvslt #b00000000000000000000000000000000 (size!21817 _keys!976)))))

(declare-fun b!814540 () Bool)

(assert (=> b!814540 (= e!451548 (validKeyInArray!0 (select (arr!21396 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!814540 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!814541 () Bool)

(declare-fun e!451551 () Bool)

(declare-fun lt!364530 () ListLongMap!8237)

(declare-fun isEmpty!635 (ListLongMap!8237) Bool)

(assert (=> b!814541 (= e!451551 (isEmpty!635 lt!364530))))

(declare-fun b!814542 () Bool)

(assert (=> b!814542 (= e!451551 (= lt!364530 (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!814543 () Bool)

(declare-fun e!451549 () Bool)

(assert (=> b!814543 (= e!451550 e!451549)))

(assert (=> b!814543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21817 _keys!976)))))

(declare-fun res!556364 () Bool)

(declare-fun contains!4124 (ListLongMap!8237 (_ BitVec 64)) Bool)

(assert (=> b!814543 (= res!556364 (contains!4124 lt!364530 (select (arr!21396 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!814543 (=> (not res!556364) (not e!451549))))

(declare-fun b!814544 () Bool)

(declare-fun lt!364532 () Unit!27702)

(declare-fun lt!364531 () Unit!27702)

(assert (=> b!814544 (= lt!364532 lt!364531)))

(declare-fun lt!364528 () (_ BitVec 64))

(declare-fun lt!364527 () (_ BitVec 64))

(declare-fun lt!364529 () ListLongMap!8237)

(declare-fun lt!364533 () V!23987)

(declare-fun +!1816 (ListLongMap!8237 tuple2!9424) ListLongMap!8237)

(assert (=> b!814544 (not (contains!4124 (+!1816 lt!364529 (tuple2!9425 lt!364527 lt!364533)) lt!364528))))

(declare-fun addStillNotContains!174 (ListLongMap!8237 (_ BitVec 64) V!23987 (_ BitVec 64)) Unit!27702)

(assert (=> b!814544 (= lt!364531 (addStillNotContains!174 lt!364529 lt!364527 lt!364533 lt!364528))))

(assert (=> b!814544 (= lt!364528 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11477 (ValueCell!6704 V!23987) V!23987)

(declare-fun dynLambda!962 (Int (_ BitVec 64)) V!23987)

(assert (=> b!814544 (= lt!364533 (get!11477 (select (arr!21397 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!814544 (= lt!364527 (select (arr!21396 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!814544 (= lt!364529 call!35476)))

(assert (=> b!814544 (= e!451552 (+!1816 call!35476 (tuple2!9425 (select (arr!21396 _keys!976) #b00000000000000000000000000000000) (get!11477 (select (arr!21397 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!814545 () Bool)

(assert (=> b!814545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21817 _keys!976)))))

(assert (=> b!814545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21818 _values!788)))))

(declare-fun apply!348 (ListLongMap!8237 (_ BitVec 64)) V!23987)

(assert (=> b!814545 (= e!451549 (= (apply!348 lt!364530 (select (arr!21396 _keys!976) #b00000000000000000000000000000000)) (get!11477 (select (arr!21397 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!104241 () Bool)

(assert (=> d!104241 e!451553))

(declare-fun res!556362 () Bool)

(assert (=> d!104241 (=> (not res!556362) (not e!451553))))

(assert (=> d!104241 (= res!556362 (not (contains!4124 lt!364530 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104241 (= lt!364530 e!451554)))

(declare-fun c!88864 () Bool)

(assert (=> d!104241 (= c!88864 (bvsge #b00000000000000000000000000000000 (size!21817 _keys!976)))))

(assert (=> d!104241 (validMask!0 mask!1312)))

(assert (=> d!104241 (= (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!364530)))

(declare-fun b!814538 () Bool)

(assert (=> b!814538 (= e!451554 (ListLongMap!8238 Nil!15250))))

(declare-fun b!814546 () Bool)

(declare-fun res!556361 () Bool)

(assert (=> b!814546 (=> (not res!556361) (not e!451553))))

(assert (=> b!814546 (= res!556361 (not (contains!4124 lt!364530 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!814547 () Bool)

(assert (=> b!814547 (= e!451550 e!451551)))

(declare-fun c!88866 () Bool)

(assert (=> b!814547 (= c!88866 (bvslt #b00000000000000000000000000000000 (size!21817 _keys!976)))))

(assert (= (and d!104241 c!88864) b!814538))

(assert (= (and d!104241 (not c!88864)) b!814536))

(assert (= (and b!814536 c!88865) b!814544))

(assert (= (and b!814536 (not c!88865)) b!814537))

(assert (= (or b!814544 b!814537) bm!35473))

(assert (= (and d!104241 res!556362) b!814546))

(assert (= (and b!814546 res!556361) b!814539))

(assert (= (and b!814539 res!556363) b!814540))

(assert (= (and b!814539 c!88863) b!814543))

(assert (= (and b!814539 (not c!88863)) b!814547))

(assert (= (and b!814543 res!556364) b!814545))

(assert (= (and b!814547 c!88866) b!814542))

(assert (= (and b!814547 (not c!88866)) b!814541))

(declare-fun b_lambda!10813 () Bool)

(assert (=> (not b_lambda!10813) (not b!814544)))

(declare-fun t!21567 () Bool)

(declare-fun tb!4169 () Bool)

(assert (=> (and start!70088 (= defaultEntry!796 defaultEntry!796) t!21567) tb!4169))

(declare-fun result!7863 () Bool)

(assert (=> tb!4169 (= result!7863 tp_is_empty!14239)))

(assert (=> b!814544 t!21567))

(declare-fun b_and!21281 () Bool)

(assert (= b_and!21275 (and (=> t!21567 result!7863) b_and!21281)))

(declare-fun b_lambda!10815 () Bool)

(assert (=> (not b_lambda!10815) (not b!814545)))

(assert (=> b!814545 t!21567))

(declare-fun b_and!21283 () Bool)

(assert (= b_and!21281 (and (=> t!21567 result!7863) b_and!21283)))

(declare-fun m!755789 () Bool)

(assert (=> b!814546 m!755789))

(declare-fun m!755791 () Bool)

(assert (=> b!814542 m!755791))

(declare-fun m!755793 () Bool)

(assert (=> b!814541 m!755793))

(declare-fun m!755795 () Bool)

(assert (=> b!814544 m!755795))

(declare-fun m!755797 () Bool)

(assert (=> b!814544 m!755797))

(declare-fun m!755799 () Bool)

(assert (=> b!814544 m!755799))

(declare-fun m!755801 () Bool)

(assert (=> b!814544 m!755801))

(declare-fun m!755803 () Bool)

(assert (=> b!814544 m!755803))

(declare-fun m!755805 () Bool)

(assert (=> b!814544 m!755805))

(assert (=> b!814544 m!755803))

(assert (=> b!814544 m!755801))

(declare-fun m!755807 () Bool)

(assert (=> b!814544 m!755807))

(declare-fun m!755809 () Bool)

(assert (=> b!814544 m!755809))

(assert (=> b!814544 m!755797))

(assert (=> b!814536 m!755807))

(assert (=> b!814536 m!755807))

(declare-fun m!755811 () Bool)

(assert (=> b!814536 m!755811))

(assert (=> bm!35473 m!755791))

(assert (=> b!814540 m!755807))

(assert (=> b!814540 m!755807))

(assert (=> b!814540 m!755811))

(assert (=> b!814543 m!755807))

(assert (=> b!814543 m!755807))

(declare-fun m!755813 () Bool)

(assert (=> b!814543 m!755813))

(assert (=> b!814545 m!755803))

(assert (=> b!814545 m!755801))

(assert (=> b!814545 m!755807))

(assert (=> b!814545 m!755807))

(declare-fun m!755815 () Bool)

(assert (=> b!814545 m!755815))

(assert (=> b!814545 m!755801))

(assert (=> b!814545 m!755803))

(assert (=> b!814545 m!755805))

(declare-fun m!755817 () Bool)

(assert (=> d!104241 m!755817))

(assert (=> d!104241 m!755745))

(assert (=> b!814464 d!104241))

(declare-fun b!814550 () Bool)

(declare-fun e!451561 () ListLongMap!8237)

(declare-fun e!451559 () ListLongMap!8237)

(assert (=> b!814550 (= e!451561 e!451559)))

(declare-fun c!88869 () Bool)

(assert (=> b!814550 (= c!88869 (validKeyInArray!0 (select (arr!21396 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!814551 () Bool)

(declare-fun call!35477 () ListLongMap!8237)

(assert (=> b!814551 (= e!451559 call!35477)))

(declare-fun bm!35474 () Bool)

(assert (=> bm!35474 (= call!35477 (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!814553 () Bool)

(declare-fun e!451560 () Bool)

(declare-fun e!451557 () Bool)

(assert (=> b!814553 (= e!451560 e!451557)))

(declare-fun c!88867 () Bool)

(declare-fun e!451555 () Bool)

(assert (=> b!814553 (= c!88867 e!451555)))

(declare-fun res!556367 () Bool)

(assert (=> b!814553 (=> (not res!556367) (not e!451555))))

(assert (=> b!814553 (= res!556367 (bvslt #b00000000000000000000000000000000 (size!21817 _keys!976)))))

(declare-fun b!814554 () Bool)

(assert (=> b!814554 (= e!451555 (validKeyInArray!0 (select (arr!21396 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!814554 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!814555 () Bool)

(declare-fun e!451558 () Bool)

(declare-fun lt!364537 () ListLongMap!8237)

(assert (=> b!814555 (= e!451558 (isEmpty!635 lt!364537))))

(declare-fun b!814556 () Bool)

(assert (=> b!814556 (= e!451558 (= lt!364537 (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!814557 () Bool)

(declare-fun e!451556 () Bool)

(assert (=> b!814557 (= e!451557 e!451556)))

(assert (=> b!814557 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21817 _keys!976)))))

(declare-fun res!556368 () Bool)

(assert (=> b!814557 (= res!556368 (contains!4124 lt!364537 (select (arr!21396 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!814557 (=> (not res!556368) (not e!451556))))

(declare-fun b!814558 () Bool)

(declare-fun lt!364539 () Unit!27702)

(declare-fun lt!364538 () Unit!27702)

(assert (=> b!814558 (= lt!364539 lt!364538)))

(declare-fun lt!364535 () (_ BitVec 64))

(declare-fun lt!364534 () (_ BitVec 64))

(declare-fun lt!364540 () V!23987)

(declare-fun lt!364536 () ListLongMap!8237)

(assert (=> b!814558 (not (contains!4124 (+!1816 lt!364536 (tuple2!9425 lt!364534 lt!364540)) lt!364535))))

(assert (=> b!814558 (= lt!364538 (addStillNotContains!174 lt!364536 lt!364534 lt!364540 lt!364535))))

(assert (=> b!814558 (= lt!364535 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!814558 (= lt!364540 (get!11477 (select (arr!21397 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!814558 (= lt!364534 (select (arr!21396 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!814558 (= lt!364536 call!35477)))

(assert (=> b!814558 (= e!451559 (+!1816 call!35477 (tuple2!9425 (select (arr!21396 _keys!976) #b00000000000000000000000000000000) (get!11477 (select (arr!21397 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!814559 () Bool)

(assert (=> b!814559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21817 _keys!976)))))

(assert (=> b!814559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21818 _values!788)))))

(assert (=> b!814559 (= e!451556 (= (apply!348 lt!364537 (select (arr!21396 _keys!976) #b00000000000000000000000000000000)) (get!11477 (select (arr!21397 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!104243 () Bool)

(assert (=> d!104243 e!451560))

(declare-fun res!556366 () Bool)

(assert (=> d!104243 (=> (not res!556366) (not e!451560))))

(assert (=> d!104243 (= res!556366 (not (contains!4124 lt!364537 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104243 (= lt!364537 e!451561)))

(declare-fun c!88868 () Bool)

(assert (=> d!104243 (= c!88868 (bvsge #b00000000000000000000000000000000 (size!21817 _keys!976)))))

(assert (=> d!104243 (validMask!0 mask!1312)))

(assert (=> d!104243 (= (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!364537)))

(declare-fun b!814552 () Bool)

(assert (=> b!814552 (= e!451561 (ListLongMap!8238 Nil!15250))))

(declare-fun b!814560 () Bool)

(declare-fun res!556365 () Bool)

(assert (=> b!814560 (=> (not res!556365) (not e!451560))))

(assert (=> b!814560 (= res!556365 (not (contains!4124 lt!364537 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!814561 () Bool)

(assert (=> b!814561 (= e!451557 e!451558)))

(declare-fun c!88870 () Bool)

(assert (=> b!814561 (= c!88870 (bvslt #b00000000000000000000000000000000 (size!21817 _keys!976)))))

(assert (= (and d!104243 c!88868) b!814552))

(assert (= (and d!104243 (not c!88868)) b!814550))

(assert (= (and b!814550 c!88869) b!814558))

(assert (= (and b!814550 (not c!88869)) b!814551))

(assert (= (or b!814558 b!814551) bm!35474))

(assert (= (and d!104243 res!556366) b!814560))

(assert (= (and b!814560 res!556365) b!814553))

(assert (= (and b!814553 res!556367) b!814554))

(assert (= (and b!814553 c!88867) b!814557))

(assert (= (and b!814553 (not c!88867)) b!814561))

(assert (= (and b!814557 res!556368) b!814559))

(assert (= (and b!814561 c!88870) b!814556))

(assert (= (and b!814561 (not c!88870)) b!814555))

(declare-fun b_lambda!10817 () Bool)

(assert (=> (not b_lambda!10817) (not b!814558)))

(assert (=> b!814558 t!21567))

(declare-fun b_and!21285 () Bool)

(assert (= b_and!21283 (and (=> t!21567 result!7863) b_and!21285)))

(declare-fun b_lambda!10819 () Bool)

(assert (=> (not b_lambda!10819) (not b!814559)))

(assert (=> b!814559 t!21567))

(declare-fun b_and!21287 () Bool)

(assert (= b_and!21285 (and (=> t!21567 result!7863) b_and!21287)))

(declare-fun m!755819 () Bool)

(assert (=> b!814560 m!755819))

(declare-fun m!755821 () Bool)

(assert (=> b!814556 m!755821))

(declare-fun m!755823 () Bool)

(assert (=> b!814555 m!755823))

(declare-fun m!755825 () Bool)

(assert (=> b!814558 m!755825))

(declare-fun m!755827 () Bool)

(assert (=> b!814558 m!755827))

(declare-fun m!755829 () Bool)

(assert (=> b!814558 m!755829))

(assert (=> b!814558 m!755801))

(assert (=> b!814558 m!755803))

(assert (=> b!814558 m!755805))

(assert (=> b!814558 m!755803))

(assert (=> b!814558 m!755801))

(assert (=> b!814558 m!755807))

(declare-fun m!755831 () Bool)

(assert (=> b!814558 m!755831))

(assert (=> b!814558 m!755827))

(assert (=> b!814550 m!755807))

(assert (=> b!814550 m!755807))

(assert (=> b!814550 m!755811))

(assert (=> bm!35474 m!755821))

(assert (=> b!814554 m!755807))

(assert (=> b!814554 m!755807))

(assert (=> b!814554 m!755811))

(assert (=> b!814557 m!755807))

(assert (=> b!814557 m!755807))

(declare-fun m!755833 () Bool)

(assert (=> b!814557 m!755833))

(assert (=> b!814559 m!755803))

(assert (=> b!814559 m!755801))

(assert (=> b!814559 m!755807))

(assert (=> b!814559 m!755807))

(declare-fun m!755835 () Bool)

(assert (=> b!814559 m!755835))

(assert (=> b!814559 m!755801))

(assert (=> b!814559 m!755803))

(assert (=> b!814559 m!755805))

(declare-fun m!755837 () Bool)

(assert (=> d!104243 m!755837))

(assert (=> d!104243 m!755745))

(assert (=> b!814464 d!104243))

(declare-fun b!814570 () Bool)

(declare-fun e!451569 () Bool)

(declare-fun call!35480 () Bool)

(assert (=> b!814570 (= e!451569 call!35480)))

(declare-fun b!814571 () Bool)

(declare-fun e!451570 () Bool)

(assert (=> b!814571 (= e!451570 call!35480)))

(declare-fun bm!35477 () Bool)

(assert (=> bm!35477 (= call!35480 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!814572 () Bool)

(assert (=> b!814572 (= e!451570 e!451569)))

(declare-fun lt!364547 () (_ BitVec 64))

(assert (=> b!814572 (= lt!364547 (select (arr!21396 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!364549 () Unit!27702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44671 (_ BitVec 64) (_ BitVec 32)) Unit!27702)

(assert (=> b!814572 (= lt!364549 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364547 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!814572 (arrayContainsKey!0 _keys!976 lt!364547 #b00000000000000000000000000000000)))

(declare-fun lt!364548 () Unit!27702)

(assert (=> b!814572 (= lt!364548 lt!364549)))

(declare-fun res!556374 () Bool)

(declare-datatypes ((SeekEntryResult!8716 0))(
  ( (MissingZero!8716 (index!37235 (_ BitVec 32))) (Found!8716 (index!37236 (_ BitVec 32))) (Intermediate!8716 (undefined!9528 Bool) (index!37237 (_ BitVec 32)) (x!68524 (_ BitVec 32))) (Undefined!8716) (MissingVacant!8716 (index!37238 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44671 (_ BitVec 32)) SeekEntryResult!8716)

(assert (=> b!814572 (= res!556374 (= (seekEntryOrOpen!0 (select (arr!21396 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8716 #b00000000000000000000000000000000)))))

(assert (=> b!814572 (=> (not res!556374) (not e!451569))))

(declare-fun b!814573 () Bool)

(declare-fun e!451568 () Bool)

(assert (=> b!814573 (= e!451568 e!451570)))

(declare-fun c!88873 () Bool)

(assert (=> b!814573 (= c!88873 (validKeyInArray!0 (select (arr!21396 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104245 () Bool)

(declare-fun res!556373 () Bool)

(assert (=> d!104245 (=> res!556373 e!451568)))

(assert (=> d!104245 (= res!556373 (bvsge #b00000000000000000000000000000000 (size!21817 _keys!976)))))

(assert (=> d!104245 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!451568)))

(assert (= (and d!104245 (not res!556373)) b!814573))

(assert (= (and b!814573 c!88873) b!814572))

(assert (= (and b!814573 (not c!88873)) b!814571))

(assert (= (and b!814572 res!556374) b!814570))

(assert (= (or b!814570 b!814571) bm!35477))

(declare-fun m!755839 () Bool)

(assert (=> bm!35477 m!755839))

(assert (=> b!814572 m!755807))

(declare-fun m!755841 () Bool)

(assert (=> b!814572 m!755841))

(declare-fun m!755843 () Bool)

(assert (=> b!814572 m!755843))

(assert (=> b!814572 m!755807))

(declare-fun m!755845 () Bool)

(assert (=> b!814572 m!755845))

(assert (=> b!814573 m!755807))

(assert (=> b!814573 m!755807))

(assert (=> b!814573 m!755811))

(assert (=> b!814467 d!104245))

(declare-fun b!814584 () Bool)

(declare-fun e!451582 () Bool)

(declare-fun call!35483 () Bool)

(assert (=> b!814584 (= e!451582 call!35483)))

(declare-fun b!814585 () Bool)

(declare-fun e!451579 () Bool)

(assert (=> b!814585 (= e!451579 e!451582)))

(declare-fun c!88876 () Bool)

(assert (=> b!814585 (= c!88876 (validKeyInArray!0 (select (arr!21396 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35480 () Bool)

(assert (=> bm!35480 (= call!35483 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88876 (Cons!15248 (select (arr!21396 _keys!976) #b00000000000000000000000000000000) Nil!15249) Nil!15249)))))

(declare-fun b!814587 () Bool)

(declare-fun e!451581 () Bool)

(declare-fun contains!4125 (List!15252 (_ BitVec 64)) Bool)

(assert (=> b!814587 (= e!451581 (contains!4125 Nil!15249 (select (arr!21396 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!814588 () Bool)

(assert (=> b!814588 (= e!451582 call!35483)))

(declare-fun d!104247 () Bool)

(declare-fun res!556381 () Bool)

(declare-fun e!451580 () Bool)

(assert (=> d!104247 (=> res!556381 e!451580)))

(assert (=> d!104247 (= res!556381 (bvsge #b00000000000000000000000000000000 (size!21817 _keys!976)))))

(assert (=> d!104247 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15249) e!451580)))

(declare-fun b!814586 () Bool)

(assert (=> b!814586 (= e!451580 e!451579)))

(declare-fun res!556382 () Bool)

(assert (=> b!814586 (=> (not res!556382) (not e!451579))))

(assert (=> b!814586 (= res!556382 (not e!451581))))

(declare-fun res!556383 () Bool)

(assert (=> b!814586 (=> (not res!556383) (not e!451581))))

(assert (=> b!814586 (= res!556383 (validKeyInArray!0 (select (arr!21396 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104247 (not res!556381)) b!814586))

(assert (= (and b!814586 res!556383) b!814587))

(assert (= (and b!814586 res!556382) b!814585))

(assert (= (and b!814585 c!88876) b!814584))

(assert (= (and b!814585 (not c!88876)) b!814588))

(assert (= (or b!814584 b!814588) bm!35480))

(assert (=> b!814585 m!755807))

(assert (=> b!814585 m!755807))

(assert (=> b!814585 m!755811))

(assert (=> bm!35480 m!755807))

(declare-fun m!755847 () Bool)

(assert (=> bm!35480 m!755847))

(assert (=> b!814587 m!755807))

(assert (=> b!814587 m!755807))

(declare-fun m!755849 () Bool)

(assert (=> b!814587 m!755849))

(assert (=> b!814586 m!755807))

(assert (=> b!814586 m!755807))

(assert (=> b!814586 m!755811))

(assert (=> b!814463 d!104247))

(declare-fun d!104249 () Bool)

(assert (=> d!104249 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70088 d!104249))

(declare-fun d!104251 () Bool)

(assert (=> d!104251 (= (array_inv!17201 _keys!976) (bvsge (size!21817 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70088 d!104251))

(declare-fun d!104253 () Bool)

(assert (=> d!104253 (= (array_inv!17202 _values!788) (bvsge (size!21818 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70088 d!104253))

(declare-fun mapIsEmpty!22948 () Bool)

(declare-fun mapRes!22948 () Bool)

(assert (=> mapIsEmpty!22948 mapRes!22948))

(declare-fun mapNonEmpty!22948 () Bool)

(declare-fun tp!44317 () Bool)

(declare-fun e!451588 () Bool)

(assert (=> mapNonEmpty!22948 (= mapRes!22948 (and tp!44317 e!451588))))

(declare-fun mapRest!22948 () (Array (_ BitVec 32) ValueCell!6704))

(declare-fun mapValue!22948 () ValueCell!6704)

(declare-fun mapKey!22948 () (_ BitVec 32))

(assert (=> mapNonEmpty!22948 (= mapRest!22939 (store mapRest!22948 mapKey!22948 mapValue!22948))))

(declare-fun b!814596 () Bool)

(declare-fun e!451587 () Bool)

(assert (=> b!814596 (= e!451587 tp_is_empty!14239)))

(declare-fun b!814595 () Bool)

(assert (=> b!814595 (= e!451588 tp_is_empty!14239)))

(declare-fun condMapEmpty!22948 () Bool)

(declare-fun mapDefault!22948 () ValueCell!6704)

(assert (=> mapNonEmpty!22939 (= condMapEmpty!22948 (= mapRest!22939 ((as const (Array (_ BitVec 32) ValueCell!6704)) mapDefault!22948)))))

(assert (=> mapNonEmpty!22939 (= tp!44301 (and e!451587 mapRes!22948))))

(assert (= (and mapNonEmpty!22939 condMapEmpty!22948) mapIsEmpty!22948))

(assert (= (and mapNonEmpty!22939 (not condMapEmpty!22948)) mapNonEmpty!22948))

(assert (= (and mapNonEmpty!22948 ((_ is ValueCellFull!6704) mapValue!22948)) b!814595))

(assert (= (and mapNonEmpty!22939 ((_ is ValueCellFull!6704) mapDefault!22948)) b!814596))

(declare-fun m!755851 () Bool)

(assert (=> mapNonEmpty!22948 m!755851))

(declare-fun b_lambda!10821 () Bool)

(assert (= b_lambda!10819 (or (and start!70088 b_free!12529) b_lambda!10821)))

(declare-fun b_lambda!10823 () Bool)

(assert (= b_lambda!10817 (or (and start!70088 b_free!12529) b_lambda!10823)))

(declare-fun b_lambda!10825 () Bool)

(assert (= b_lambda!10813 (or (and start!70088 b_free!12529) b_lambda!10825)))

(declare-fun b_lambda!10827 () Bool)

(assert (= b_lambda!10815 (or (and start!70088 b_free!12529) b_lambda!10827)))

(check-sat (not b!814558) (not b!814557) (not b!814542) (not b!814573) (not b!814543) (not bm!35474) (not b!814586) (not b!814559) (not b!814536) b_and!21287 (not d!104241) (not bm!35477) (not b!814550) (not b!814554) (not b!814556) (not b!814546) (not d!104243) (not b!814540) (not mapNonEmpty!22948) (not b_lambda!10823) (not b_lambda!10825) (not b!814541) (not b!814545) (not b_lambda!10821) (not b_lambda!10827) (not bm!35480) (not b!814544) (not b!814572) (not b!814585) (not b!814560) (not b!814587) (not b!814555) tp_is_empty!14239 (not b_next!12529) (not bm!35473) (not d!104239))
(check-sat b_and!21287 (not b_next!12529))
