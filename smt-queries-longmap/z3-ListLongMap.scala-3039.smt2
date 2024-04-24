; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42606 () Bool)

(assert start!42606)

(declare-fun b_free!12043 () Bool)

(declare-fun b_next!12043 () Bool)

(assert (=> start!42606 (= b_free!12043 (not b_next!12043))))

(declare-fun tp!42172 () Bool)

(declare-fun b_and!20541 () Bool)

(assert (=> start!42606 (= tp!42172 b_and!20541)))

(declare-fun mapIsEmpty!21928 () Bool)

(declare-fun mapRes!21928 () Bool)

(assert (=> mapIsEmpty!21928 mapRes!21928))

(declare-fun b!475366 () Bool)

(declare-fun res!283903 () Bool)

(declare-fun e!279127 () Bool)

(assert (=> b!475366 (=> (not res!283903) (not e!279127))))

(declare-datatypes ((array!30668 0))(
  ( (array!30669 (arr!14750 (Array (_ BitVec 32) (_ BitVec 64))) (size!15102 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30668)

(declare-datatypes ((List!8924 0))(
  ( (Nil!8921) (Cons!8920 (h!9776 (_ BitVec 64)) (t!14892 List!8924)) )
))
(declare-fun arrayNoDuplicates!0 (array!30668 (_ BitVec 32) List!8924) Bool)

(assert (=> b!475366 (= res!283903 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8921))))

(declare-fun b!475367 () Bool)

(declare-fun e!279124 () Bool)

(assert (=> b!475367 (= e!279127 (not e!279124))))

(declare-fun res!283905 () Bool)

(assert (=> b!475367 (=> res!283905 e!279124)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475367 (= res!283905 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!19067 0))(
  ( (V!19068 (val!6780 Int)) )
))
(declare-datatypes ((tuple2!8864 0))(
  ( (tuple2!8865 (_1!4443 (_ BitVec 64)) (_2!4443 V!19067)) )
))
(declare-datatypes ((List!8925 0))(
  ( (Nil!8922) (Cons!8921 (h!9777 tuple2!8864) (t!14893 List!8925)) )
))
(declare-datatypes ((ListLongMap!7779 0))(
  ( (ListLongMap!7780 (toList!3905 List!8925)) )
))
(declare-fun lt!216499 () ListLongMap!7779)

(declare-fun lt!216500 () ListLongMap!7779)

(assert (=> b!475367 (= lt!216499 lt!216500)))

(declare-fun zeroValue!794 () V!19067)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!19067)

(declare-datatypes ((Unit!13976 0))(
  ( (Unit!13977) )
))
(declare-fun lt!216501 () Unit!13976)

(declare-datatypes ((ValueCell!6392 0))(
  ( (ValueCellFull!6392 (v!9074 V!19067)) (EmptyCell!6392) )
))
(declare-datatypes ((array!30670 0))(
  ( (array!30671 (arr!14751 (Array (_ BitVec 32) ValueCell!6392)) (size!15103 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30670)

(declare-fun minValueAfter!38 () V!19067)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!250 (array!30668 array!30670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19067 V!19067 V!19067 V!19067 (_ BitVec 32) Int) Unit!13976)

(assert (=> b!475367 (= lt!216501 (lemmaNoChangeToArrayThenSameMapNoExtras!250 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2112 (array!30668 array!30670 (_ BitVec 32) (_ BitVec 32) V!19067 V!19067 (_ BitVec 32) Int) ListLongMap!7779)

(assert (=> b!475367 (= lt!216500 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475367 (= lt!216499 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475369 () Bool)

(declare-fun e!279125 () Bool)

(declare-fun tp_is_empty!13471 () Bool)

(assert (=> b!475369 (= e!279125 tp_is_empty!13471)))

(declare-fun b!475370 () Bool)

(declare-fun +!1763 (ListLongMap!7779 tuple2!8864) ListLongMap!7779)

(declare-fun getCurrentListMap!2242 (array!30668 array!30670 (_ BitVec 32) (_ BitVec 32) V!19067 V!19067 (_ BitVec 32) Int) ListLongMap!7779)

(assert (=> b!475370 (= e!279124 (= (+!1763 (getCurrentListMap!2242 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2242 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun b!475371 () Bool)

(declare-fun e!279123 () Bool)

(assert (=> b!475371 (= e!279123 tp_is_empty!13471)))

(declare-fun mapNonEmpty!21928 () Bool)

(declare-fun tp!42171 () Bool)

(assert (=> mapNonEmpty!21928 (= mapRes!21928 (and tp!42171 e!279125))))

(declare-fun mapRest!21928 () (Array (_ BitVec 32) ValueCell!6392))

(declare-fun mapKey!21928 () (_ BitVec 32))

(declare-fun mapValue!21928 () ValueCell!6392)

(assert (=> mapNonEmpty!21928 (= (arr!14751 _values!833) (store mapRest!21928 mapKey!21928 mapValue!21928))))

(declare-fun res!283904 () Bool)

(assert (=> start!42606 (=> (not res!283904) (not e!279127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42606 (= res!283904 (validMask!0 mask!1365))))

(assert (=> start!42606 e!279127))

(assert (=> start!42606 tp_is_empty!13471))

(assert (=> start!42606 tp!42172))

(assert (=> start!42606 true))

(declare-fun array_inv!10720 (array!30668) Bool)

(assert (=> start!42606 (array_inv!10720 _keys!1025)))

(declare-fun e!279122 () Bool)

(declare-fun array_inv!10721 (array!30670) Bool)

(assert (=> start!42606 (and (array_inv!10721 _values!833) e!279122)))

(declare-fun b!475368 () Bool)

(declare-fun res!283902 () Bool)

(assert (=> b!475368 (=> (not res!283902) (not e!279127))))

(assert (=> b!475368 (= res!283902 (and (= (size!15103 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15102 _keys!1025) (size!15103 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475372 () Bool)

(assert (=> b!475372 (= e!279122 (and e!279123 mapRes!21928))))

(declare-fun condMapEmpty!21928 () Bool)

(declare-fun mapDefault!21928 () ValueCell!6392)

(assert (=> b!475372 (= condMapEmpty!21928 (= (arr!14751 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6392)) mapDefault!21928)))))

(declare-fun b!475373 () Bool)

(declare-fun res!283901 () Bool)

(assert (=> b!475373 (=> (not res!283901) (not e!279127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30668 (_ BitVec 32)) Bool)

(assert (=> b!475373 (= res!283901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42606 res!283904) b!475368))

(assert (= (and b!475368 res!283902) b!475373))

(assert (= (and b!475373 res!283901) b!475366))

(assert (= (and b!475366 res!283903) b!475367))

(assert (= (and b!475367 (not res!283905)) b!475370))

(assert (= (and b!475372 condMapEmpty!21928) mapIsEmpty!21928))

(assert (= (and b!475372 (not condMapEmpty!21928)) mapNonEmpty!21928))

(get-info :version)

(assert (= (and mapNonEmpty!21928 ((_ is ValueCellFull!6392) mapValue!21928)) b!475369))

(assert (= (and b!475372 ((_ is ValueCellFull!6392) mapDefault!21928)) b!475371))

(assert (= start!42606 b!475372))

(declare-fun m!457789 () Bool)

(assert (=> mapNonEmpty!21928 m!457789))

(declare-fun m!457791 () Bool)

(assert (=> b!475366 m!457791))

(declare-fun m!457793 () Bool)

(assert (=> b!475373 m!457793))

(declare-fun m!457795 () Bool)

(assert (=> start!42606 m!457795))

(declare-fun m!457797 () Bool)

(assert (=> start!42606 m!457797))

(declare-fun m!457799 () Bool)

(assert (=> start!42606 m!457799))

(declare-fun m!457801 () Bool)

(assert (=> b!475370 m!457801))

(assert (=> b!475370 m!457801))

(declare-fun m!457803 () Bool)

(assert (=> b!475370 m!457803))

(declare-fun m!457805 () Bool)

(assert (=> b!475370 m!457805))

(declare-fun m!457807 () Bool)

(assert (=> b!475367 m!457807))

(declare-fun m!457809 () Bool)

(assert (=> b!475367 m!457809))

(declare-fun m!457811 () Bool)

(assert (=> b!475367 m!457811))

(check-sat (not mapNonEmpty!21928) (not b!475373) b_and!20541 tp_is_empty!13471 (not b!475370) (not b!475366) (not start!42606) (not b_next!12043) (not b!475367))
(check-sat b_and!20541 (not b_next!12043))
(get-model)

(declare-fun d!75649 () Bool)

(declare-fun e!279166 () Bool)

(assert (=> d!75649 e!279166))

(declare-fun res!283941 () Bool)

(assert (=> d!75649 (=> (not res!283941) (not e!279166))))

(declare-fun lt!216529 () ListLongMap!7779)

(declare-fun contains!2537 (ListLongMap!7779 (_ BitVec 64)) Bool)

(assert (=> d!75649 (= res!283941 (contains!2537 lt!216529 (_1!4443 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lt!216531 () List!8925)

(assert (=> d!75649 (= lt!216529 (ListLongMap!7780 lt!216531))))

(declare-fun lt!216528 () Unit!13976)

(declare-fun lt!216530 () Unit!13976)

(assert (=> d!75649 (= lt!216528 lt!216530)))

(declare-datatypes ((Option!389 0))(
  ( (Some!388 (v!9077 V!19067)) (None!387) )
))
(declare-fun getValueByKey!383 (List!8925 (_ BitVec 64)) Option!389)

(assert (=> d!75649 (= (getValueByKey!383 lt!216531 (_1!4443 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!388 (_2!4443 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!205 (List!8925 (_ BitVec 64) V!19067) Unit!13976)

(assert (=> d!75649 (= lt!216530 (lemmaContainsTupThenGetReturnValue!205 lt!216531 (_1!4443 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4443 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun insertStrictlySorted!208 (List!8925 (_ BitVec 64) V!19067) List!8925)

(assert (=> d!75649 (= lt!216531 (insertStrictlySorted!208 (toList!3905 (getCurrentListMap!2242 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841)) (_1!4443 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4443 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (=> d!75649 (= (+!1763 (getCurrentListMap!2242 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) lt!216529)))

(declare-fun b!475426 () Bool)

(declare-fun res!283940 () Bool)

(assert (=> b!475426 (=> (not res!283940) (not e!279166))))

(assert (=> b!475426 (= res!283940 (= (getValueByKey!383 (toList!3905 lt!216529) (_1!4443 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!388 (_2!4443 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))))

(declare-fun b!475427 () Bool)

(declare-fun contains!2538 (List!8925 tuple2!8864) Bool)

(assert (=> b!475427 (= e!279166 (contains!2538 (toList!3905 lt!216529) (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75649 res!283941) b!475426))

(assert (= (and b!475426 res!283940) b!475427))

(declare-fun m!457861 () Bool)

(assert (=> d!75649 m!457861))

(declare-fun m!457863 () Bool)

(assert (=> d!75649 m!457863))

(declare-fun m!457865 () Bool)

(assert (=> d!75649 m!457865))

(declare-fun m!457867 () Bool)

(assert (=> d!75649 m!457867))

(declare-fun m!457869 () Bool)

(assert (=> b!475426 m!457869))

(declare-fun m!457871 () Bool)

(assert (=> b!475427 m!457871))

(assert (=> b!475370 d!75649))

(declare-fun b!475470 () Bool)

(declare-fun e!279204 () ListLongMap!7779)

(declare-fun call!30582 () ListLongMap!7779)

(assert (=> b!475470 (= e!279204 (+!1763 call!30582 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun bm!30576 () Bool)

(declare-fun call!30583 () ListLongMap!7779)

(assert (=> bm!30576 (= call!30583 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475471 () Bool)

(declare-fun e!279205 () Unit!13976)

(declare-fun lt!216580 () Unit!13976)

(assert (=> b!475471 (= e!279205 lt!216580)))

(declare-fun lt!216586 () ListLongMap!7779)

(assert (=> b!475471 (= lt!216586 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216576 () (_ BitVec 64))

(assert (=> b!475471 (= lt!216576 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216590 () (_ BitVec 64))

(assert (=> b!475471 (= lt!216590 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216593 () Unit!13976)

(declare-fun addStillContains!293 (ListLongMap!7779 (_ BitVec 64) V!19067 (_ BitVec 64)) Unit!13976)

(assert (=> b!475471 (= lt!216593 (addStillContains!293 lt!216586 lt!216576 zeroValue!794 lt!216590))))

(assert (=> b!475471 (contains!2537 (+!1763 lt!216586 (tuple2!8865 lt!216576 zeroValue!794)) lt!216590)))

(declare-fun lt!216583 () Unit!13976)

(assert (=> b!475471 (= lt!216583 lt!216593)))

(declare-fun lt!216595 () ListLongMap!7779)

(assert (=> b!475471 (= lt!216595 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216597 () (_ BitVec 64))

(assert (=> b!475471 (= lt!216597 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216577 () (_ BitVec 64))

(assert (=> b!475471 (= lt!216577 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216591 () Unit!13976)

(declare-fun addApplyDifferent!293 (ListLongMap!7779 (_ BitVec 64) V!19067 (_ BitVec 64)) Unit!13976)

(assert (=> b!475471 (= lt!216591 (addApplyDifferent!293 lt!216595 lt!216597 minValueBefore!38 lt!216577))))

(declare-fun apply!335 (ListLongMap!7779 (_ BitVec 64)) V!19067)

(assert (=> b!475471 (= (apply!335 (+!1763 lt!216595 (tuple2!8865 lt!216597 minValueBefore!38)) lt!216577) (apply!335 lt!216595 lt!216577))))

(declare-fun lt!216594 () Unit!13976)

(assert (=> b!475471 (= lt!216594 lt!216591)))

(declare-fun lt!216585 () ListLongMap!7779)

(assert (=> b!475471 (= lt!216585 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216588 () (_ BitVec 64))

(assert (=> b!475471 (= lt!216588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216584 () (_ BitVec 64))

(assert (=> b!475471 (= lt!216584 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216582 () Unit!13976)

(assert (=> b!475471 (= lt!216582 (addApplyDifferent!293 lt!216585 lt!216588 zeroValue!794 lt!216584))))

(assert (=> b!475471 (= (apply!335 (+!1763 lt!216585 (tuple2!8865 lt!216588 zeroValue!794)) lt!216584) (apply!335 lt!216585 lt!216584))))

(declare-fun lt!216581 () Unit!13976)

(assert (=> b!475471 (= lt!216581 lt!216582)))

(declare-fun lt!216579 () ListLongMap!7779)

(assert (=> b!475471 (= lt!216579 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216589 () (_ BitVec 64))

(assert (=> b!475471 (= lt!216589 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216592 () (_ BitVec 64))

(assert (=> b!475471 (= lt!216592 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475471 (= lt!216580 (addApplyDifferent!293 lt!216579 lt!216589 minValueBefore!38 lt!216592))))

(assert (=> b!475471 (= (apply!335 (+!1763 lt!216579 (tuple2!8865 lt!216589 minValueBefore!38)) lt!216592) (apply!335 lt!216579 lt!216592))))

(declare-fun d!75651 () Bool)

(declare-fun e!279194 () Bool)

(assert (=> d!75651 e!279194))

(declare-fun res!283967 () Bool)

(assert (=> d!75651 (=> (not res!283967) (not e!279194))))

(assert (=> d!75651 (= res!283967 (or (bvsge #b00000000000000000000000000000000 (size!15102 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))))

(declare-fun lt!216587 () ListLongMap!7779)

(declare-fun lt!216596 () ListLongMap!7779)

(assert (=> d!75651 (= lt!216587 lt!216596)))

(declare-fun lt!216578 () Unit!13976)

(assert (=> d!75651 (= lt!216578 e!279205)))

(declare-fun c!57149 () Bool)

(declare-fun e!279195 () Bool)

(assert (=> d!75651 (= c!57149 e!279195)))

(declare-fun res!283968 () Bool)

(assert (=> d!75651 (=> (not res!283968) (not e!279195))))

(assert (=> d!75651 (= res!283968 (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(assert (=> d!75651 (= lt!216596 e!279204)))

(declare-fun c!57151 () Bool)

(assert (=> d!75651 (= c!57151 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75651 (validMask!0 mask!1365)))

(assert (=> d!75651 (= (getCurrentListMap!2242 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216587)))

(declare-fun bm!30577 () Bool)

(declare-fun call!30581 () ListLongMap!7779)

(assert (=> bm!30577 (= call!30581 call!30582)))

(declare-fun bm!30578 () Bool)

(declare-fun call!30580 () ListLongMap!7779)

(declare-fun call!30584 () ListLongMap!7779)

(assert (=> bm!30578 (= call!30580 call!30584)))

(declare-fun b!475472 () Bool)

(declare-fun e!279202 () Bool)

(assert (=> b!475472 (= e!279194 e!279202)))

(declare-fun c!57152 () Bool)

(assert (=> b!475472 (= c!57152 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30579 () Bool)

(declare-fun call!30579 () Bool)

(assert (=> bm!30579 (= call!30579 (contains!2537 lt!216587 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!57148 () Bool)

(declare-fun bm!30580 () Bool)

(assert (=> bm!30580 (= call!30582 (+!1763 (ite c!57151 call!30583 (ite c!57148 call!30584 call!30580)) (ite (or c!57151 c!57148) (tuple2!8865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!475473 () Bool)

(declare-fun e!279198 () ListLongMap!7779)

(assert (=> b!475473 (= e!279198 call!30581)))

(declare-fun bm!30581 () Bool)

(declare-fun call!30585 () Bool)

(assert (=> bm!30581 (= call!30585 (contains!2537 lt!216587 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!279199 () Bool)

(declare-fun b!475474 () Bool)

(declare-fun get!7165 (ValueCell!6392 V!19067) V!19067)

(declare-fun dynLambda!925 (Int (_ BitVec 64)) V!19067)

(assert (=> b!475474 (= e!279199 (= (apply!335 lt!216587 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)) (get!7165 (select (arr!14751 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475474 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15103 _values!833)))))

(assert (=> b!475474 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(declare-fun bm!30582 () Bool)

(assert (=> bm!30582 (= call!30584 call!30583)))

(declare-fun b!475475 () Bool)

(declare-fun res!283964 () Bool)

(assert (=> b!475475 (=> (not res!283964) (not e!279194))))

(declare-fun e!279196 () Bool)

(assert (=> b!475475 (= res!283964 e!279196)))

(declare-fun c!57150 () Bool)

(assert (=> b!475475 (= c!57150 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!475476 () Bool)

(declare-fun e!279200 () Bool)

(assert (=> b!475476 (= e!279196 e!279200)))

(declare-fun res!283962 () Bool)

(assert (=> b!475476 (= res!283962 call!30585)))

(assert (=> b!475476 (=> (not res!283962) (not e!279200))))

(declare-fun b!475477 () Bool)

(assert (=> b!475477 (= e!279200 (= (apply!335 lt!216587 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475478 () Bool)

(declare-fun e!279197 () ListLongMap!7779)

(assert (=> b!475478 (= e!279197 call!30581)))

(declare-fun b!475479 () Bool)

(declare-fun Unit!13980 () Unit!13976)

(assert (=> b!475479 (= e!279205 Unit!13980)))

(declare-fun b!475480 () Bool)

(assert (=> b!475480 (= e!279196 (not call!30585))))

(declare-fun b!475481 () Bool)

(assert (=> b!475481 (= e!279198 call!30580)))

(declare-fun b!475482 () Bool)

(declare-fun e!279193 () Bool)

(assert (=> b!475482 (= e!279202 e!279193)))

(declare-fun res!283965 () Bool)

(assert (=> b!475482 (= res!283965 call!30579)))

(assert (=> b!475482 (=> (not res!283965) (not e!279193))))

(declare-fun b!475483 () Bool)

(assert (=> b!475483 (= e!279193 (= (apply!335 lt!216587 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!475484 () Bool)

(declare-fun res!283963 () Bool)

(assert (=> b!475484 (=> (not res!283963) (not e!279194))))

(declare-fun e!279203 () Bool)

(assert (=> b!475484 (= res!283963 e!279203)))

(declare-fun res!283960 () Bool)

(assert (=> b!475484 (=> res!283960 e!279203)))

(declare-fun e!279201 () Bool)

(assert (=> b!475484 (= res!283960 (not e!279201))))

(declare-fun res!283961 () Bool)

(assert (=> b!475484 (=> (not res!283961) (not e!279201))))

(assert (=> b!475484 (= res!283961 (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(declare-fun b!475485 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!475485 (= e!279201 (validKeyInArray!0 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475486 () Bool)

(assert (=> b!475486 (= e!279204 e!279197)))

(assert (=> b!475486 (= c!57148 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475487 () Bool)

(assert (=> b!475487 (= e!279195 (validKeyInArray!0 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475488 () Bool)

(declare-fun c!57153 () Bool)

(assert (=> b!475488 (= c!57153 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!475488 (= e!279197 e!279198)))

(declare-fun b!475489 () Bool)

(assert (=> b!475489 (= e!279203 e!279199)))

(declare-fun res!283966 () Bool)

(assert (=> b!475489 (=> (not res!283966) (not e!279199))))

(assert (=> b!475489 (= res!283966 (contains!2537 lt!216587 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(declare-fun b!475490 () Bool)

(assert (=> b!475490 (= e!279202 (not call!30579))))

(assert (= (and d!75651 c!57151) b!475470))

(assert (= (and d!75651 (not c!57151)) b!475486))

(assert (= (and b!475486 c!57148) b!475478))

(assert (= (and b!475486 (not c!57148)) b!475488))

(assert (= (and b!475488 c!57153) b!475473))

(assert (= (and b!475488 (not c!57153)) b!475481))

(assert (= (or b!475473 b!475481) bm!30578))

(assert (= (or b!475478 bm!30578) bm!30582))

(assert (= (or b!475478 b!475473) bm!30577))

(assert (= (or b!475470 bm!30582) bm!30576))

(assert (= (or b!475470 bm!30577) bm!30580))

(assert (= (and d!75651 res!283968) b!475487))

(assert (= (and d!75651 c!57149) b!475471))

(assert (= (and d!75651 (not c!57149)) b!475479))

(assert (= (and d!75651 res!283967) b!475484))

(assert (= (and b!475484 res!283961) b!475485))

(assert (= (and b!475484 (not res!283960)) b!475489))

(assert (= (and b!475489 res!283966) b!475474))

(assert (= (and b!475484 res!283963) b!475475))

(assert (= (and b!475475 c!57150) b!475476))

(assert (= (and b!475475 (not c!57150)) b!475480))

(assert (= (and b!475476 res!283962) b!475477))

(assert (= (or b!475476 b!475480) bm!30581))

(assert (= (and b!475475 res!283964) b!475472))

(assert (= (and b!475472 c!57152) b!475482))

(assert (= (and b!475472 (not c!57152)) b!475490))

(assert (= (and b!475482 res!283965) b!475483))

(assert (= (or b!475482 b!475490) bm!30579))

(declare-fun b_lambda!10283 () Bool)

(assert (=> (not b_lambda!10283) (not b!475474)))

(declare-fun t!14897 () Bool)

(declare-fun tb!3927 () Bool)

(assert (=> (and start!42606 (= defaultEntry!841 defaultEntry!841) t!14897) tb!3927))

(declare-fun result!7455 () Bool)

(assert (=> tb!3927 (= result!7455 tp_is_empty!13471)))

(assert (=> b!475474 t!14897))

(declare-fun b_and!20547 () Bool)

(assert (= b_and!20541 (and (=> t!14897 result!7455) b_and!20547)))

(declare-fun m!457873 () Bool)

(assert (=> b!475477 m!457873))

(declare-fun m!457875 () Bool)

(assert (=> b!475487 m!457875))

(assert (=> b!475487 m!457875))

(declare-fun m!457877 () Bool)

(assert (=> b!475487 m!457877))

(declare-fun m!457879 () Bool)

(assert (=> bm!30581 m!457879))

(declare-fun m!457881 () Bool)

(assert (=> b!475471 m!457881))

(declare-fun m!457883 () Bool)

(assert (=> b!475471 m!457883))

(declare-fun m!457885 () Bool)

(assert (=> b!475471 m!457885))

(declare-fun m!457887 () Bool)

(assert (=> b!475471 m!457887))

(declare-fun m!457889 () Bool)

(assert (=> b!475471 m!457889))

(declare-fun m!457891 () Bool)

(assert (=> b!475471 m!457891))

(declare-fun m!457893 () Bool)

(assert (=> b!475471 m!457893))

(assert (=> b!475471 m!457887))

(declare-fun m!457895 () Bool)

(assert (=> b!475471 m!457895))

(assert (=> b!475471 m!457811))

(declare-fun m!457897 () Bool)

(assert (=> b!475471 m!457897))

(declare-fun m!457899 () Bool)

(assert (=> b!475471 m!457899))

(declare-fun m!457901 () Bool)

(assert (=> b!475471 m!457901))

(declare-fun m!457903 () Bool)

(assert (=> b!475471 m!457903))

(declare-fun m!457905 () Bool)

(assert (=> b!475471 m!457905))

(assert (=> b!475471 m!457891))

(assert (=> b!475471 m!457899))

(assert (=> b!475471 m!457875))

(declare-fun m!457907 () Bool)

(assert (=> b!475471 m!457907))

(declare-fun m!457909 () Bool)

(assert (=> b!475471 m!457909))

(assert (=> b!475471 m!457903))

(assert (=> b!475485 m!457875))

(assert (=> b!475485 m!457875))

(assert (=> b!475485 m!457877))

(assert (=> d!75651 m!457795))

(declare-fun m!457911 () Bool)

(assert (=> bm!30579 m!457911))

(declare-fun m!457913 () Bool)

(assert (=> b!475483 m!457913))

(assert (=> b!475489 m!457875))

(assert (=> b!475489 m!457875))

(declare-fun m!457915 () Bool)

(assert (=> b!475489 m!457915))

(assert (=> bm!30576 m!457811))

(declare-fun m!457917 () Bool)

(assert (=> b!475474 m!457917))

(declare-fun m!457919 () Bool)

(assert (=> b!475474 m!457919))

(assert (=> b!475474 m!457875))

(assert (=> b!475474 m!457919))

(assert (=> b!475474 m!457917))

(declare-fun m!457921 () Bool)

(assert (=> b!475474 m!457921))

(assert (=> b!475474 m!457875))

(declare-fun m!457923 () Bool)

(assert (=> b!475474 m!457923))

(declare-fun m!457925 () Bool)

(assert (=> b!475470 m!457925))

(declare-fun m!457927 () Bool)

(assert (=> bm!30580 m!457927))

(assert (=> b!475370 d!75651))

(declare-fun b!475493 () Bool)

(declare-fun e!279217 () ListLongMap!7779)

(declare-fun call!30589 () ListLongMap!7779)

(assert (=> b!475493 (= e!279217 (+!1763 call!30589 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun bm!30583 () Bool)

(declare-fun call!30590 () ListLongMap!7779)

(assert (=> bm!30583 (= call!30590 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475494 () Bool)

(declare-fun e!279218 () Unit!13976)

(declare-fun lt!216602 () Unit!13976)

(assert (=> b!475494 (= e!279218 lt!216602)))

(declare-fun lt!216608 () ListLongMap!7779)

(assert (=> b!475494 (= lt!216608 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216598 () (_ BitVec 64))

(assert (=> b!475494 (= lt!216598 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216612 () (_ BitVec 64))

(assert (=> b!475494 (= lt!216612 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216615 () Unit!13976)

(assert (=> b!475494 (= lt!216615 (addStillContains!293 lt!216608 lt!216598 zeroValue!794 lt!216612))))

(assert (=> b!475494 (contains!2537 (+!1763 lt!216608 (tuple2!8865 lt!216598 zeroValue!794)) lt!216612)))

(declare-fun lt!216605 () Unit!13976)

(assert (=> b!475494 (= lt!216605 lt!216615)))

(declare-fun lt!216617 () ListLongMap!7779)

(assert (=> b!475494 (= lt!216617 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216619 () (_ BitVec 64))

(assert (=> b!475494 (= lt!216619 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216599 () (_ BitVec 64))

(assert (=> b!475494 (= lt!216599 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216613 () Unit!13976)

(assert (=> b!475494 (= lt!216613 (addApplyDifferent!293 lt!216617 lt!216619 minValueAfter!38 lt!216599))))

(assert (=> b!475494 (= (apply!335 (+!1763 lt!216617 (tuple2!8865 lt!216619 minValueAfter!38)) lt!216599) (apply!335 lt!216617 lt!216599))))

(declare-fun lt!216616 () Unit!13976)

(assert (=> b!475494 (= lt!216616 lt!216613)))

(declare-fun lt!216607 () ListLongMap!7779)

(assert (=> b!475494 (= lt!216607 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216610 () (_ BitVec 64))

(assert (=> b!475494 (= lt!216610 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216606 () (_ BitVec 64))

(assert (=> b!475494 (= lt!216606 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216604 () Unit!13976)

(assert (=> b!475494 (= lt!216604 (addApplyDifferent!293 lt!216607 lt!216610 zeroValue!794 lt!216606))))

(assert (=> b!475494 (= (apply!335 (+!1763 lt!216607 (tuple2!8865 lt!216610 zeroValue!794)) lt!216606) (apply!335 lt!216607 lt!216606))))

(declare-fun lt!216603 () Unit!13976)

(assert (=> b!475494 (= lt!216603 lt!216604)))

(declare-fun lt!216601 () ListLongMap!7779)

(assert (=> b!475494 (= lt!216601 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216611 () (_ BitVec 64))

(assert (=> b!475494 (= lt!216611 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216614 () (_ BitVec 64))

(assert (=> b!475494 (= lt!216614 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475494 (= lt!216602 (addApplyDifferent!293 lt!216601 lt!216611 minValueAfter!38 lt!216614))))

(assert (=> b!475494 (= (apply!335 (+!1763 lt!216601 (tuple2!8865 lt!216611 minValueAfter!38)) lt!216614) (apply!335 lt!216601 lt!216614))))

(declare-fun d!75653 () Bool)

(declare-fun e!279207 () Bool)

(assert (=> d!75653 e!279207))

(declare-fun res!283976 () Bool)

(assert (=> d!75653 (=> (not res!283976) (not e!279207))))

(assert (=> d!75653 (= res!283976 (or (bvsge #b00000000000000000000000000000000 (size!15102 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))))

(declare-fun lt!216609 () ListLongMap!7779)

(declare-fun lt!216618 () ListLongMap!7779)

(assert (=> d!75653 (= lt!216609 lt!216618)))

(declare-fun lt!216600 () Unit!13976)

(assert (=> d!75653 (= lt!216600 e!279218)))

(declare-fun c!57155 () Bool)

(declare-fun e!279208 () Bool)

(assert (=> d!75653 (= c!57155 e!279208)))

(declare-fun res!283977 () Bool)

(assert (=> d!75653 (=> (not res!283977) (not e!279208))))

(assert (=> d!75653 (= res!283977 (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(assert (=> d!75653 (= lt!216618 e!279217)))

(declare-fun c!57157 () Bool)

(assert (=> d!75653 (= c!57157 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75653 (validMask!0 mask!1365)))

(assert (=> d!75653 (= (getCurrentListMap!2242 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216609)))

(declare-fun bm!30584 () Bool)

(declare-fun call!30588 () ListLongMap!7779)

(assert (=> bm!30584 (= call!30588 call!30589)))

(declare-fun bm!30585 () Bool)

(declare-fun call!30587 () ListLongMap!7779)

(declare-fun call!30591 () ListLongMap!7779)

(assert (=> bm!30585 (= call!30587 call!30591)))

(declare-fun b!475495 () Bool)

(declare-fun e!279215 () Bool)

(assert (=> b!475495 (= e!279207 e!279215)))

(declare-fun c!57158 () Bool)

(assert (=> b!475495 (= c!57158 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30586 () Bool)

(declare-fun call!30586 () Bool)

(assert (=> bm!30586 (= call!30586 (contains!2537 lt!216609 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30587 () Bool)

(declare-fun c!57154 () Bool)

(assert (=> bm!30587 (= call!30589 (+!1763 (ite c!57157 call!30590 (ite c!57154 call!30591 call!30587)) (ite (or c!57157 c!57154) (tuple2!8865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!475496 () Bool)

(declare-fun e!279211 () ListLongMap!7779)

(assert (=> b!475496 (= e!279211 call!30588)))

(declare-fun bm!30588 () Bool)

(declare-fun call!30592 () Bool)

(assert (=> bm!30588 (= call!30592 (contains!2537 lt!216609 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!279212 () Bool)

(declare-fun b!475497 () Bool)

(assert (=> b!475497 (= e!279212 (= (apply!335 lt!216609 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)) (get!7165 (select (arr!14751 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15103 _values!833)))))

(assert (=> b!475497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(declare-fun bm!30589 () Bool)

(assert (=> bm!30589 (= call!30591 call!30590)))

(declare-fun b!475498 () Bool)

(declare-fun res!283973 () Bool)

(assert (=> b!475498 (=> (not res!283973) (not e!279207))))

(declare-fun e!279209 () Bool)

(assert (=> b!475498 (= res!283973 e!279209)))

(declare-fun c!57156 () Bool)

(assert (=> b!475498 (= c!57156 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!475499 () Bool)

(declare-fun e!279213 () Bool)

(assert (=> b!475499 (= e!279209 e!279213)))

(declare-fun res!283971 () Bool)

(assert (=> b!475499 (= res!283971 call!30592)))

(assert (=> b!475499 (=> (not res!283971) (not e!279213))))

(declare-fun b!475500 () Bool)

(assert (=> b!475500 (= e!279213 (= (apply!335 lt!216609 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475501 () Bool)

(declare-fun e!279210 () ListLongMap!7779)

(assert (=> b!475501 (= e!279210 call!30588)))

(declare-fun b!475502 () Bool)

(declare-fun Unit!13981 () Unit!13976)

(assert (=> b!475502 (= e!279218 Unit!13981)))

(declare-fun b!475503 () Bool)

(assert (=> b!475503 (= e!279209 (not call!30592))))

(declare-fun b!475504 () Bool)

(assert (=> b!475504 (= e!279211 call!30587)))

(declare-fun b!475505 () Bool)

(declare-fun e!279206 () Bool)

(assert (=> b!475505 (= e!279215 e!279206)))

(declare-fun res!283974 () Bool)

(assert (=> b!475505 (= res!283974 call!30586)))

(assert (=> b!475505 (=> (not res!283974) (not e!279206))))

(declare-fun b!475506 () Bool)

(assert (=> b!475506 (= e!279206 (= (apply!335 lt!216609 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!475507 () Bool)

(declare-fun res!283972 () Bool)

(assert (=> b!475507 (=> (not res!283972) (not e!279207))))

(declare-fun e!279216 () Bool)

(assert (=> b!475507 (= res!283972 e!279216)))

(declare-fun res!283969 () Bool)

(assert (=> b!475507 (=> res!283969 e!279216)))

(declare-fun e!279214 () Bool)

(assert (=> b!475507 (= res!283969 (not e!279214))))

(declare-fun res!283970 () Bool)

(assert (=> b!475507 (=> (not res!283970) (not e!279214))))

(assert (=> b!475507 (= res!283970 (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(declare-fun b!475508 () Bool)

(assert (=> b!475508 (= e!279214 (validKeyInArray!0 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475509 () Bool)

(assert (=> b!475509 (= e!279217 e!279210)))

(assert (=> b!475509 (= c!57154 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475510 () Bool)

(assert (=> b!475510 (= e!279208 (validKeyInArray!0 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475511 () Bool)

(declare-fun c!57159 () Bool)

(assert (=> b!475511 (= c!57159 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!475511 (= e!279210 e!279211)))

(declare-fun b!475512 () Bool)

(assert (=> b!475512 (= e!279216 e!279212)))

(declare-fun res!283975 () Bool)

(assert (=> b!475512 (=> (not res!283975) (not e!279212))))

(assert (=> b!475512 (= res!283975 (contains!2537 lt!216609 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475512 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(declare-fun b!475513 () Bool)

(assert (=> b!475513 (= e!279215 (not call!30586))))

(assert (= (and d!75653 c!57157) b!475493))

(assert (= (and d!75653 (not c!57157)) b!475509))

(assert (= (and b!475509 c!57154) b!475501))

(assert (= (and b!475509 (not c!57154)) b!475511))

(assert (= (and b!475511 c!57159) b!475496))

(assert (= (and b!475511 (not c!57159)) b!475504))

(assert (= (or b!475496 b!475504) bm!30585))

(assert (= (or b!475501 bm!30585) bm!30589))

(assert (= (or b!475501 b!475496) bm!30584))

(assert (= (or b!475493 bm!30589) bm!30583))

(assert (= (or b!475493 bm!30584) bm!30587))

(assert (= (and d!75653 res!283977) b!475510))

(assert (= (and d!75653 c!57155) b!475494))

(assert (= (and d!75653 (not c!57155)) b!475502))

(assert (= (and d!75653 res!283976) b!475507))

(assert (= (and b!475507 res!283970) b!475508))

(assert (= (and b!475507 (not res!283969)) b!475512))

(assert (= (and b!475512 res!283975) b!475497))

(assert (= (and b!475507 res!283972) b!475498))

(assert (= (and b!475498 c!57156) b!475499))

(assert (= (and b!475498 (not c!57156)) b!475503))

(assert (= (and b!475499 res!283971) b!475500))

(assert (= (or b!475499 b!475503) bm!30588))

(assert (= (and b!475498 res!283973) b!475495))

(assert (= (and b!475495 c!57158) b!475505))

(assert (= (and b!475495 (not c!57158)) b!475513))

(assert (= (and b!475505 res!283974) b!475506))

(assert (= (or b!475505 b!475513) bm!30586))

(declare-fun b_lambda!10285 () Bool)

(assert (=> (not b_lambda!10285) (not b!475497)))

(assert (=> b!475497 t!14897))

(declare-fun b_and!20549 () Bool)

(assert (= b_and!20547 (and (=> t!14897 result!7455) b_and!20549)))

(declare-fun m!457929 () Bool)

(assert (=> b!475500 m!457929))

(assert (=> b!475510 m!457875))

(assert (=> b!475510 m!457875))

(assert (=> b!475510 m!457877))

(declare-fun m!457931 () Bool)

(assert (=> bm!30588 m!457931))

(declare-fun m!457933 () Bool)

(assert (=> b!475494 m!457933))

(declare-fun m!457935 () Bool)

(assert (=> b!475494 m!457935))

(declare-fun m!457937 () Bool)

(assert (=> b!475494 m!457937))

(declare-fun m!457939 () Bool)

(assert (=> b!475494 m!457939))

(declare-fun m!457941 () Bool)

(assert (=> b!475494 m!457941))

(declare-fun m!457943 () Bool)

(assert (=> b!475494 m!457943))

(declare-fun m!457945 () Bool)

(assert (=> b!475494 m!457945))

(assert (=> b!475494 m!457939))

(declare-fun m!457947 () Bool)

(assert (=> b!475494 m!457947))

(assert (=> b!475494 m!457809))

(declare-fun m!457949 () Bool)

(assert (=> b!475494 m!457949))

(declare-fun m!457951 () Bool)

(assert (=> b!475494 m!457951))

(declare-fun m!457953 () Bool)

(assert (=> b!475494 m!457953))

(declare-fun m!457955 () Bool)

(assert (=> b!475494 m!457955))

(declare-fun m!457957 () Bool)

(assert (=> b!475494 m!457957))

(assert (=> b!475494 m!457943))

(assert (=> b!475494 m!457951))

(assert (=> b!475494 m!457875))

(declare-fun m!457959 () Bool)

(assert (=> b!475494 m!457959))

(declare-fun m!457961 () Bool)

(assert (=> b!475494 m!457961))

(assert (=> b!475494 m!457955))

(assert (=> b!475508 m!457875))

(assert (=> b!475508 m!457875))

(assert (=> b!475508 m!457877))

(assert (=> d!75653 m!457795))

(declare-fun m!457963 () Bool)

(assert (=> bm!30586 m!457963))

(declare-fun m!457965 () Bool)

(assert (=> b!475506 m!457965))

(assert (=> b!475512 m!457875))

(assert (=> b!475512 m!457875))

(declare-fun m!457967 () Bool)

(assert (=> b!475512 m!457967))

(assert (=> bm!30583 m!457809))

(assert (=> b!475497 m!457917))

(assert (=> b!475497 m!457919))

(assert (=> b!475497 m!457875))

(assert (=> b!475497 m!457919))

(assert (=> b!475497 m!457917))

(assert (=> b!475497 m!457921))

(assert (=> b!475497 m!457875))

(declare-fun m!457969 () Bool)

(assert (=> b!475497 m!457969))

(declare-fun m!457971 () Bool)

(assert (=> b!475493 m!457971))

(declare-fun m!457973 () Bool)

(assert (=> bm!30587 m!457973))

(assert (=> b!475370 d!75653))

(declare-fun bm!30592 () Bool)

(declare-fun call!30595 () Bool)

(assert (=> bm!30592 (= call!30595 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!475522 () Bool)

(declare-fun e!279226 () Bool)

(declare-fun e!279225 () Bool)

(assert (=> b!475522 (= e!279226 e!279225)))

(declare-fun lt!216627 () (_ BitVec 64))

(assert (=> b!475522 (= lt!216627 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216628 () Unit!13976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30668 (_ BitVec 64) (_ BitVec 32)) Unit!13976)

(assert (=> b!475522 (= lt!216628 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!216627 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!475522 (arrayContainsKey!0 _keys!1025 lt!216627 #b00000000000000000000000000000000)))

(declare-fun lt!216626 () Unit!13976)

(assert (=> b!475522 (= lt!216626 lt!216628)))

(declare-fun res!283983 () Bool)

(declare-datatypes ((SeekEntryResult!3508 0))(
  ( (MissingZero!3508 (index!16211 (_ BitVec 32))) (Found!3508 (index!16212 (_ BitVec 32))) (Intermediate!3508 (undefined!4320 Bool) (index!16213 (_ BitVec 32)) (x!44582 (_ BitVec 32))) (Undefined!3508) (MissingVacant!3508 (index!16214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30668 (_ BitVec 32)) SeekEntryResult!3508)

(assert (=> b!475522 (= res!283983 (= (seekEntryOrOpen!0 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3508 #b00000000000000000000000000000000)))))

(assert (=> b!475522 (=> (not res!283983) (not e!279225))))

(declare-fun b!475523 () Bool)

(declare-fun e!279227 () Bool)

(assert (=> b!475523 (= e!279227 e!279226)))

(declare-fun c!57162 () Bool)

(assert (=> b!475523 (= c!57162 (validKeyInArray!0 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475524 () Bool)

(assert (=> b!475524 (= e!279226 call!30595)))

(declare-fun d!75655 () Bool)

(declare-fun res!283982 () Bool)

(assert (=> d!75655 (=> res!283982 e!279227)))

(assert (=> d!75655 (= res!283982 (bvsge #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(assert (=> d!75655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279227)))

(declare-fun b!475525 () Bool)

(assert (=> b!475525 (= e!279225 call!30595)))

(assert (= (and d!75655 (not res!283982)) b!475523))

(assert (= (and b!475523 c!57162) b!475522))

(assert (= (and b!475523 (not c!57162)) b!475524))

(assert (= (and b!475522 res!283983) b!475525))

(assert (= (or b!475525 b!475524) bm!30592))

(declare-fun m!457975 () Bool)

(assert (=> bm!30592 m!457975))

(assert (=> b!475522 m!457875))

(declare-fun m!457977 () Bool)

(assert (=> b!475522 m!457977))

(declare-fun m!457979 () Bool)

(assert (=> b!475522 m!457979))

(assert (=> b!475522 m!457875))

(declare-fun m!457981 () Bool)

(assert (=> b!475522 m!457981))

(assert (=> b!475523 m!457875))

(assert (=> b!475523 m!457875))

(assert (=> b!475523 m!457877))

(assert (=> b!475373 d!75655))

(declare-fun d!75657 () Bool)

(assert (=> d!75657 (= (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216631 () Unit!13976)

(declare-fun choose!1362 (array!30668 array!30670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19067 V!19067 V!19067 V!19067 (_ BitVec 32) Int) Unit!13976)

(assert (=> d!75657 (= lt!216631 (choose!1362 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75657 (validMask!0 mask!1365)))

(assert (=> d!75657 (= (lemmaNoChangeToArrayThenSameMapNoExtras!250 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216631)))

(declare-fun bs!15118 () Bool)

(assert (= bs!15118 d!75657))

(assert (=> bs!15118 m!457811))

(assert (=> bs!15118 m!457809))

(declare-fun m!457983 () Bool)

(assert (=> bs!15118 m!457983))

(assert (=> bs!15118 m!457795))

(assert (=> b!475367 d!75657))

(declare-fun b!475550 () Bool)

(declare-fun lt!216648 () Unit!13976)

(declare-fun lt!216647 () Unit!13976)

(assert (=> b!475550 (= lt!216648 lt!216647)))

(declare-fun lt!216646 () (_ BitVec 64))

(declare-fun lt!216649 () V!19067)

(declare-fun lt!216651 () (_ BitVec 64))

(declare-fun lt!216652 () ListLongMap!7779)

(assert (=> b!475550 (not (contains!2537 (+!1763 lt!216652 (tuple2!8865 lt!216646 lt!216649)) lt!216651))))

(declare-fun addStillNotContains!170 (ListLongMap!7779 (_ BitVec 64) V!19067 (_ BitVec 64)) Unit!13976)

(assert (=> b!475550 (= lt!216647 (addStillNotContains!170 lt!216652 lt!216646 lt!216649 lt!216651))))

(assert (=> b!475550 (= lt!216651 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475550 (= lt!216649 (get!7165 (select (arr!14751 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475550 (= lt!216646 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30598 () ListLongMap!7779)

(assert (=> b!475550 (= lt!216652 call!30598)))

(declare-fun e!279243 () ListLongMap!7779)

(assert (=> b!475550 (= e!279243 (+!1763 call!30598 (tuple2!8865 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000) (get!7165 (select (arr!14751 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475551 () Bool)

(declare-fun res!283995 () Bool)

(declare-fun e!279248 () Bool)

(assert (=> b!475551 (=> (not res!283995) (not e!279248))))

(declare-fun lt!216650 () ListLongMap!7779)

(assert (=> b!475551 (= res!283995 (not (contains!2537 lt!216650 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475552 () Bool)

(declare-fun e!279244 () Bool)

(declare-fun isEmpty!588 (ListLongMap!7779) Bool)

(assert (=> b!475552 (= e!279244 (isEmpty!588 lt!216650))))

(declare-fun bm!30595 () Bool)

(assert (=> bm!30595 (= call!30598 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475553 () Bool)

(declare-fun e!279242 () Bool)

(assert (=> b!475553 (= e!279248 e!279242)))

(declare-fun c!57174 () Bool)

(declare-fun e!279245 () Bool)

(assert (=> b!475553 (= c!57174 e!279245)))

(declare-fun res!283992 () Bool)

(assert (=> b!475553 (=> (not res!283992) (not e!279245))))

(assert (=> b!475553 (= res!283992 (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(declare-fun b!475554 () Bool)

(assert (=> b!475554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(assert (=> b!475554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15103 _values!833)))))

(declare-fun e!279246 () Bool)

(assert (=> b!475554 (= e!279246 (= (apply!335 lt!216650 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)) (get!7165 (select (arr!14751 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475556 () Bool)

(assert (=> b!475556 (= e!279243 call!30598)))

(declare-fun b!475557 () Bool)

(assert (=> b!475557 (= e!279245 (validKeyInArray!0 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475557 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475558 () Bool)

(declare-fun e!279247 () ListLongMap!7779)

(assert (=> b!475558 (= e!279247 e!279243)))

(declare-fun c!57171 () Bool)

(assert (=> b!475558 (= c!57171 (validKeyInArray!0 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475559 () Bool)

(assert (=> b!475559 (= e!279242 e!279246)))

(assert (=> b!475559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(declare-fun res!283994 () Bool)

(assert (=> b!475559 (= res!283994 (contains!2537 lt!216650 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475559 (=> (not res!283994) (not e!279246))))

(declare-fun b!475560 () Bool)

(assert (=> b!475560 (= e!279242 e!279244)))

(declare-fun c!57172 () Bool)

(assert (=> b!475560 (= c!57172 (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(declare-fun b!475561 () Bool)

(assert (=> b!475561 (= e!279247 (ListLongMap!7780 Nil!8922))))

(declare-fun d!75659 () Bool)

(assert (=> d!75659 e!279248))

(declare-fun res!283993 () Bool)

(assert (=> d!75659 (=> (not res!283993) (not e!279248))))

(assert (=> d!75659 (= res!283993 (not (contains!2537 lt!216650 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75659 (= lt!216650 e!279247)))

(declare-fun c!57173 () Bool)

(assert (=> d!75659 (= c!57173 (bvsge #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(assert (=> d!75659 (validMask!0 mask!1365)))

(assert (=> d!75659 (= (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216650)))

(declare-fun b!475555 () Bool)

(assert (=> b!475555 (= e!279244 (= lt!216650 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(assert (= (and d!75659 c!57173) b!475561))

(assert (= (and d!75659 (not c!57173)) b!475558))

(assert (= (and b!475558 c!57171) b!475550))

(assert (= (and b!475558 (not c!57171)) b!475556))

(assert (= (or b!475550 b!475556) bm!30595))

(assert (= (and d!75659 res!283993) b!475551))

(assert (= (and b!475551 res!283995) b!475553))

(assert (= (and b!475553 res!283992) b!475557))

(assert (= (and b!475553 c!57174) b!475559))

(assert (= (and b!475553 (not c!57174)) b!475560))

(assert (= (and b!475559 res!283994) b!475554))

(assert (= (and b!475560 c!57172) b!475555))

(assert (= (and b!475560 (not c!57172)) b!475552))

(declare-fun b_lambda!10287 () Bool)

(assert (=> (not b_lambda!10287) (not b!475550)))

(assert (=> b!475550 t!14897))

(declare-fun b_and!20551 () Bool)

(assert (= b_and!20549 (and (=> t!14897 result!7455) b_and!20551)))

(declare-fun b_lambda!10289 () Bool)

(assert (=> (not b_lambda!10289) (not b!475554)))

(assert (=> b!475554 t!14897))

(declare-fun b_and!20553 () Bool)

(assert (= b_and!20551 (and (=> t!14897 result!7455) b_and!20553)))

(declare-fun m!457985 () Bool)

(assert (=> bm!30595 m!457985))

(assert (=> b!475550 m!457875))

(declare-fun m!457987 () Bool)

(assert (=> b!475550 m!457987))

(assert (=> b!475550 m!457919))

(assert (=> b!475550 m!457919))

(assert (=> b!475550 m!457917))

(assert (=> b!475550 m!457921))

(declare-fun m!457989 () Bool)

(assert (=> b!475550 m!457989))

(declare-fun m!457991 () Bool)

(assert (=> b!475550 m!457991))

(assert (=> b!475550 m!457917))

(assert (=> b!475550 m!457989))

(declare-fun m!457993 () Bool)

(assert (=> b!475550 m!457993))

(assert (=> b!475559 m!457875))

(assert (=> b!475559 m!457875))

(declare-fun m!457995 () Bool)

(assert (=> b!475559 m!457995))

(declare-fun m!457997 () Bool)

(assert (=> d!75659 m!457997))

(assert (=> d!75659 m!457795))

(assert (=> b!475555 m!457985))

(assert (=> b!475557 m!457875))

(assert (=> b!475557 m!457875))

(assert (=> b!475557 m!457877))

(assert (=> b!475558 m!457875))

(assert (=> b!475558 m!457875))

(assert (=> b!475558 m!457877))

(assert (=> b!475554 m!457875))

(assert (=> b!475554 m!457919))

(assert (=> b!475554 m!457875))

(declare-fun m!457999 () Bool)

(assert (=> b!475554 m!457999))

(assert (=> b!475554 m!457919))

(assert (=> b!475554 m!457917))

(assert (=> b!475554 m!457921))

(assert (=> b!475554 m!457917))

(declare-fun m!458001 () Bool)

(assert (=> b!475552 m!458001))

(declare-fun m!458003 () Bool)

(assert (=> b!475551 m!458003))

(assert (=> b!475367 d!75659))

(declare-fun b!475562 () Bool)

(declare-fun lt!216655 () Unit!13976)

(declare-fun lt!216654 () Unit!13976)

(assert (=> b!475562 (= lt!216655 lt!216654)))

(declare-fun lt!216656 () V!19067)

(declare-fun lt!216659 () ListLongMap!7779)

(declare-fun lt!216653 () (_ BitVec 64))

(declare-fun lt!216658 () (_ BitVec 64))

(assert (=> b!475562 (not (contains!2537 (+!1763 lt!216659 (tuple2!8865 lt!216653 lt!216656)) lt!216658))))

(assert (=> b!475562 (= lt!216654 (addStillNotContains!170 lt!216659 lt!216653 lt!216656 lt!216658))))

(assert (=> b!475562 (= lt!216658 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475562 (= lt!216656 (get!7165 (select (arr!14751 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475562 (= lt!216653 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30599 () ListLongMap!7779)

(assert (=> b!475562 (= lt!216659 call!30599)))

(declare-fun e!279250 () ListLongMap!7779)

(assert (=> b!475562 (= e!279250 (+!1763 call!30599 (tuple2!8865 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000) (get!7165 (select (arr!14751 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475563 () Bool)

(declare-fun res!283999 () Bool)

(declare-fun e!279255 () Bool)

(assert (=> b!475563 (=> (not res!283999) (not e!279255))))

(declare-fun lt!216657 () ListLongMap!7779)

(assert (=> b!475563 (= res!283999 (not (contains!2537 lt!216657 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475564 () Bool)

(declare-fun e!279251 () Bool)

(assert (=> b!475564 (= e!279251 (isEmpty!588 lt!216657))))

(declare-fun bm!30596 () Bool)

(assert (=> bm!30596 (= call!30599 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475565 () Bool)

(declare-fun e!279249 () Bool)

(assert (=> b!475565 (= e!279255 e!279249)))

(declare-fun c!57178 () Bool)

(declare-fun e!279252 () Bool)

(assert (=> b!475565 (= c!57178 e!279252)))

(declare-fun res!283996 () Bool)

(assert (=> b!475565 (=> (not res!283996) (not e!279252))))

(assert (=> b!475565 (= res!283996 (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(declare-fun b!475566 () Bool)

(assert (=> b!475566 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(assert (=> b!475566 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15103 _values!833)))))

(declare-fun e!279253 () Bool)

(assert (=> b!475566 (= e!279253 (= (apply!335 lt!216657 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)) (get!7165 (select (arr!14751 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475568 () Bool)

(assert (=> b!475568 (= e!279250 call!30599)))

(declare-fun b!475569 () Bool)

(assert (=> b!475569 (= e!279252 (validKeyInArray!0 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475569 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475570 () Bool)

(declare-fun e!279254 () ListLongMap!7779)

(assert (=> b!475570 (= e!279254 e!279250)))

(declare-fun c!57175 () Bool)

(assert (=> b!475570 (= c!57175 (validKeyInArray!0 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475571 () Bool)

(assert (=> b!475571 (= e!279249 e!279253)))

(assert (=> b!475571 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(declare-fun res!283998 () Bool)

(assert (=> b!475571 (= res!283998 (contains!2537 lt!216657 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475571 (=> (not res!283998) (not e!279253))))

(declare-fun b!475572 () Bool)

(assert (=> b!475572 (= e!279249 e!279251)))

(declare-fun c!57176 () Bool)

(assert (=> b!475572 (= c!57176 (bvslt #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(declare-fun b!475573 () Bool)

(assert (=> b!475573 (= e!279254 (ListLongMap!7780 Nil!8922))))

(declare-fun d!75661 () Bool)

(assert (=> d!75661 e!279255))

(declare-fun res!283997 () Bool)

(assert (=> d!75661 (=> (not res!283997) (not e!279255))))

(assert (=> d!75661 (= res!283997 (not (contains!2537 lt!216657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75661 (= lt!216657 e!279254)))

(declare-fun c!57177 () Bool)

(assert (=> d!75661 (= c!57177 (bvsge #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(assert (=> d!75661 (validMask!0 mask!1365)))

(assert (=> d!75661 (= (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216657)))

(declare-fun b!475567 () Bool)

(assert (=> b!475567 (= e!279251 (= lt!216657 (getCurrentListMapNoExtraKeys!2112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(assert (= (and d!75661 c!57177) b!475573))

(assert (= (and d!75661 (not c!57177)) b!475570))

(assert (= (and b!475570 c!57175) b!475562))

(assert (= (and b!475570 (not c!57175)) b!475568))

(assert (= (or b!475562 b!475568) bm!30596))

(assert (= (and d!75661 res!283997) b!475563))

(assert (= (and b!475563 res!283999) b!475565))

(assert (= (and b!475565 res!283996) b!475569))

(assert (= (and b!475565 c!57178) b!475571))

(assert (= (and b!475565 (not c!57178)) b!475572))

(assert (= (and b!475571 res!283998) b!475566))

(assert (= (and b!475572 c!57176) b!475567))

(assert (= (and b!475572 (not c!57176)) b!475564))

(declare-fun b_lambda!10291 () Bool)

(assert (=> (not b_lambda!10291) (not b!475562)))

(assert (=> b!475562 t!14897))

(declare-fun b_and!20555 () Bool)

(assert (= b_and!20553 (and (=> t!14897 result!7455) b_and!20555)))

(declare-fun b_lambda!10293 () Bool)

(assert (=> (not b_lambda!10293) (not b!475566)))

(assert (=> b!475566 t!14897))

(declare-fun b_and!20557 () Bool)

(assert (= b_and!20555 (and (=> t!14897 result!7455) b_and!20557)))

(declare-fun m!458005 () Bool)

(assert (=> bm!30596 m!458005))

(assert (=> b!475562 m!457875))

(declare-fun m!458007 () Bool)

(assert (=> b!475562 m!458007))

(assert (=> b!475562 m!457919))

(assert (=> b!475562 m!457919))

(assert (=> b!475562 m!457917))

(assert (=> b!475562 m!457921))

(declare-fun m!458009 () Bool)

(assert (=> b!475562 m!458009))

(declare-fun m!458011 () Bool)

(assert (=> b!475562 m!458011))

(assert (=> b!475562 m!457917))

(assert (=> b!475562 m!458009))

(declare-fun m!458013 () Bool)

(assert (=> b!475562 m!458013))

(assert (=> b!475571 m!457875))

(assert (=> b!475571 m!457875))

(declare-fun m!458015 () Bool)

(assert (=> b!475571 m!458015))

(declare-fun m!458017 () Bool)

(assert (=> d!75661 m!458017))

(assert (=> d!75661 m!457795))

(assert (=> b!475567 m!458005))

(assert (=> b!475569 m!457875))

(assert (=> b!475569 m!457875))

(assert (=> b!475569 m!457877))

(assert (=> b!475570 m!457875))

(assert (=> b!475570 m!457875))

(assert (=> b!475570 m!457877))

(assert (=> b!475566 m!457875))

(assert (=> b!475566 m!457919))

(assert (=> b!475566 m!457875))

(declare-fun m!458019 () Bool)

(assert (=> b!475566 m!458019))

(assert (=> b!475566 m!457919))

(assert (=> b!475566 m!457917))

(assert (=> b!475566 m!457921))

(assert (=> b!475566 m!457917))

(declare-fun m!458021 () Bool)

(assert (=> b!475564 m!458021))

(declare-fun m!458023 () Bool)

(assert (=> b!475563 m!458023))

(assert (=> b!475367 d!75661))

(declare-fun d!75663 () Bool)

(assert (=> d!75663 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42606 d!75663))

(declare-fun d!75665 () Bool)

(assert (=> d!75665 (= (array_inv!10720 _keys!1025) (bvsge (size!15102 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42606 d!75665))

(declare-fun d!75667 () Bool)

(assert (=> d!75667 (= (array_inv!10721 _values!833) (bvsge (size!15103 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42606 d!75667))

(declare-fun b!475584 () Bool)

(declare-fun e!279267 () Bool)

(declare-fun call!30602 () Bool)

(assert (=> b!475584 (= e!279267 call!30602)))

(declare-fun b!475585 () Bool)

(assert (=> b!475585 (= e!279267 call!30602)))

(declare-fun d!75669 () Bool)

(declare-fun res!284008 () Bool)

(declare-fun e!279265 () Bool)

(assert (=> d!75669 (=> res!284008 e!279265)))

(assert (=> d!75669 (= res!284008 (bvsge #b00000000000000000000000000000000 (size!15102 _keys!1025)))))

(assert (=> d!75669 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8921) e!279265)))

(declare-fun b!475586 () Bool)

(declare-fun e!279266 () Bool)

(assert (=> b!475586 (= e!279266 e!279267)))

(declare-fun c!57181 () Bool)

(assert (=> b!475586 (= c!57181 (validKeyInArray!0 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30599 () Bool)

(assert (=> bm!30599 (= call!30602 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57181 (Cons!8920 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000) Nil!8921) Nil!8921)))))

(declare-fun b!475587 () Bool)

(declare-fun e!279264 () Bool)

(declare-fun contains!2539 (List!8924 (_ BitVec 64)) Bool)

(assert (=> b!475587 (= e!279264 (contains!2539 Nil!8921 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475588 () Bool)

(assert (=> b!475588 (= e!279265 e!279266)))

(declare-fun res!284007 () Bool)

(assert (=> b!475588 (=> (not res!284007) (not e!279266))))

(assert (=> b!475588 (= res!284007 (not e!279264))))

(declare-fun res!284006 () Bool)

(assert (=> b!475588 (=> (not res!284006) (not e!279264))))

(assert (=> b!475588 (= res!284006 (validKeyInArray!0 (select (arr!14750 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75669 (not res!284008)) b!475588))

(assert (= (and b!475588 res!284006) b!475587))

(assert (= (and b!475588 res!284007) b!475586))

(assert (= (and b!475586 c!57181) b!475584))

(assert (= (and b!475586 (not c!57181)) b!475585))

(assert (= (or b!475584 b!475585) bm!30599))

(assert (=> b!475586 m!457875))

(assert (=> b!475586 m!457875))

(assert (=> b!475586 m!457877))

(assert (=> bm!30599 m!457875))

(declare-fun m!458025 () Bool)

(assert (=> bm!30599 m!458025))

(assert (=> b!475587 m!457875))

(assert (=> b!475587 m!457875))

(declare-fun m!458027 () Bool)

(assert (=> b!475587 m!458027))

(assert (=> b!475588 m!457875))

(assert (=> b!475588 m!457875))

(assert (=> b!475588 m!457877))

(assert (=> b!475366 d!75669))

(declare-fun b!475596 () Bool)

(declare-fun e!279272 () Bool)

(assert (=> b!475596 (= e!279272 tp_is_empty!13471)))

(declare-fun mapNonEmpty!21937 () Bool)

(declare-fun mapRes!21937 () Bool)

(declare-fun tp!42187 () Bool)

(declare-fun e!279273 () Bool)

(assert (=> mapNonEmpty!21937 (= mapRes!21937 (and tp!42187 e!279273))))

(declare-fun mapRest!21937 () (Array (_ BitVec 32) ValueCell!6392))

(declare-fun mapValue!21937 () ValueCell!6392)

(declare-fun mapKey!21937 () (_ BitVec 32))

(assert (=> mapNonEmpty!21937 (= mapRest!21928 (store mapRest!21937 mapKey!21937 mapValue!21937))))

(declare-fun condMapEmpty!21937 () Bool)

(declare-fun mapDefault!21937 () ValueCell!6392)

(assert (=> mapNonEmpty!21928 (= condMapEmpty!21937 (= mapRest!21928 ((as const (Array (_ BitVec 32) ValueCell!6392)) mapDefault!21937)))))

(assert (=> mapNonEmpty!21928 (= tp!42171 (and e!279272 mapRes!21937))))

(declare-fun mapIsEmpty!21937 () Bool)

(assert (=> mapIsEmpty!21937 mapRes!21937))

(declare-fun b!475595 () Bool)

(assert (=> b!475595 (= e!279273 tp_is_empty!13471)))

(assert (= (and mapNonEmpty!21928 condMapEmpty!21937) mapIsEmpty!21937))

(assert (= (and mapNonEmpty!21928 (not condMapEmpty!21937)) mapNonEmpty!21937))

(assert (= (and mapNonEmpty!21937 ((_ is ValueCellFull!6392) mapValue!21937)) b!475595))

(assert (= (and mapNonEmpty!21928 ((_ is ValueCellFull!6392) mapDefault!21937)) b!475596))

(declare-fun m!458029 () Bool)

(assert (=> mapNonEmpty!21937 m!458029))

(declare-fun b_lambda!10295 () Bool)

(assert (= b_lambda!10291 (or (and start!42606 b_free!12043) b_lambda!10295)))

(declare-fun b_lambda!10297 () Bool)

(assert (= b_lambda!10293 (or (and start!42606 b_free!12043) b_lambda!10297)))

(declare-fun b_lambda!10299 () Bool)

(assert (= b_lambda!10287 (or (and start!42606 b_free!12043) b_lambda!10299)))

(declare-fun b_lambda!10301 () Bool)

(assert (= b_lambda!10285 (or (and start!42606 b_free!12043) b_lambda!10301)))

(declare-fun b_lambda!10303 () Bool)

(assert (= b_lambda!10289 (or (and start!42606 b_free!12043) b_lambda!10303)))

(declare-fun b_lambda!10305 () Bool)

(assert (= b_lambda!10283 (or (and start!42606 b_free!12043) b_lambda!10305)))

(check-sat (not b_lambda!10301) (not b!475570) (not b!475426) (not bm!30586) b_and!20557 (not b!475559) (not b!475522) (not b_lambda!10303) (not b!475588) (not b!475566) (not bm!30583) (not b!475485) (not b!475562) (not b!475563) (not b!475554) (not bm!30587) (not b!475427) (not b!475550) (not b_lambda!10305) (not mapNonEmpty!21937) (not d!75649) (not b!475508) (not b!475506) (not b!475555) (not b!475586) (not b!475470) (not b!475493) (not b!475523) (not b!475564) (not bm!30588) (not b!475512) (not bm!30596) (not b!475567) (not b!475474) (not d!75659) (not b!475557) (not bm!30581) (not b!475551) (not d!75661) (not bm!30599) (not b!475571) (not bm!30576) (not bm!30595) (not d!75653) (not b!475569) (not b!475471) (not d!75651) (not b!475510) (not b!475494) (not b!475483) (not b!475487) (not bm!30580) (not b_lambda!10299) (not b!475477) (not b_lambda!10297) (not b_lambda!10295) (not b!475552) tp_is_empty!13471 (not bm!30579) (not b!475497) (not b!475500) (not b!475558) (not b_next!12043) (not d!75657) (not bm!30592) (not b!475489) (not b!475587))
(check-sat b_and!20557 (not b_next!12043))
