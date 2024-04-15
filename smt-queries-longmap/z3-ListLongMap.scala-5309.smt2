; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71054 () Bool)

(assert start!71054)

(declare-fun b_free!13261 () Bool)

(declare-fun b_next!13261 () Bool)

(assert (=> start!71054 (= b_free!13261 (not b_next!13261))))

(declare-fun tp!46539 () Bool)

(declare-fun b_and!22149 () Bool)

(assert (=> start!71054 (= tp!46539 b_and!22149)))

(declare-fun b!825132 () Bool)

(declare-fun res!562552 () Bool)

(declare-fun e!459242 () Bool)

(assert (=> b!825132 (=> (not res!562552) (not e!459242))))

(declare-datatypes ((array!46093 0))(
  ( (array!46094 (arr!22093 (Array (_ BitVec 32) (_ BitVec 64))) (size!22514 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46093)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46093 (_ BitVec 32)) Bool)

(assert (=> b!825132 (= res!562552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825133 () Bool)

(declare-fun e!459238 () Bool)

(assert (=> b!825133 (= e!459242 (not e!459238))))

(declare-fun res!562554 () Bool)

(assert (=> b!825133 (=> res!562554 e!459238)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825133 (= res!562554 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24963 0))(
  ( (V!24964 (val!7533 Int)) )
))
(declare-datatypes ((tuple2!9976 0))(
  ( (tuple2!9977 (_1!4999 (_ BitVec 64)) (_2!4999 V!24963)) )
))
(declare-datatypes ((List!15772 0))(
  ( (Nil!15769) (Cons!15768 (h!16897 tuple2!9976) (t!22108 List!15772)) )
))
(declare-datatypes ((ListLongMap!8789 0))(
  ( (ListLongMap!8790 (toList!4410 List!15772)) )
))
(declare-fun lt!372348 () ListLongMap!8789)

(declare-fun lt!372357 () ListLongMap!8789)

(assert (=> b!825133 (= lt!372348 lt!372357)))

(declare-fun zeroValueAfter!34 () V!24963)

(declare-fun minValue!754 () V!24963)

(declare-datatypes ((ValueCell!7070 0))(
  ( (ValueCellFull!7070 (v!9960 V!24963)) (EmptyCell!7070) )
))
(declare-datatypes ((array!46095 0))(
  ( (array!46096 (arr!22094 (Array (_ BitVec 32) ValueCell!7070)) (size!22515 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46095)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28237 0))(
  ( (Unit!28238) )
))
(declare-fun lt!372351 () Unit!28237)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24963)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!543 (array!46093 array!46095 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24963 V!24963 V!24963 V!24963 (_ BitVec 32) Int) Unit!28237)

(assert (=> b!825133 (= lt!372351 (lemmaNoChangeToArrayThenSameMapNoExtras!543 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2450 (array!46093 array!46095 (_ BitVec 32) (_ BitVec 32) V!24963 V!24963 (_ BitVec 32) Int) ListLongMap!8789)

(assert (=> b!825133 (= lt!372357 (getCurrentListMapNoExtraKeys!2450 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825133 (= lt!372348 (getCurrentListMapNoExtraKeys!2450 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825134 () Bool)

(declare-fun res!562549 () Bool)

(assert (=> b!825134 (=> (not res!562549) (not e!459242))))

(declare-datatypes ((List!15773 0))(
  ( (Nil!15770) (Cons!15769 (h!16898 (_ BitVec 64)) (t!22109 List!15773)) )
))
(declare-fun arrayNoDuplicates!0 (array!46093 (_ BitVec 32) List!15773) Bool)

(assert (=> b!825134 (= res!562549 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15770))))

(declare-fun b!825135 () Bool)

(declare-fun res!562553 () Bool)

(assert (=> b!825135 (=> (not res!562553) (not e!459242))))

(assert (=> b!825135 (= res!562553 (and (= (size!22515 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22514 _keys!976) (size!22515 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!24079 () Bool)

(declare-fun mapRes!24079 () Bool)

(declare-fun tp!46540 () Bool)

(declare-fun e!459240 () Bool)

(assert (=> mapNonEmpty!24079 (= mapRes!24079 (and tp!46540 e!459240))))

(declare-fun mapValue!24079 () ValueCell!7070)

(declare-fun mapKey!24079 () (_ BitVec 32))

(declare-fun mapRest!24079 () (Array (_ BitVec 32) ValueCell!7070))

(assert (=> mapNonEmpty!24079 (= (arr!22094 _values!788) (store mapRest!24079 mapKey!24079 mapValue!24079))))

(declare-fun mapIsEmpty!24079 () Bool)

(assert (=> mapIsEmpty!24079 mapRes!24079))

(declare-fun b!825136 () Bool)

(declare-fun e!459241 () Bool)

(declare-fun e!459243 () Bool)

(assert (=> b!825136 (= e!459241 (and e!459243 mapRes!24079))))

(declare-fun condMapEmpty!24079 () Bool)

(declare-fun mapDefault!24079 () ValueCell!7070)

(assert (=> b!825136 (= condMapEmpty!24079 (= (arr!22094 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7070)) mapDefault!24079)))))

(declare-fun b!825137 () Bool)

(declare-fun tp_is_empty!14971 () Bool)

(assert (=> b!825137 (= e!459243 tp_is_empty!14971)))

(declare-fun b!825138 () Bool)

(declare-fun e!459237 () Bool)

(declare-fun lt!372355 () ListLongMap!8789)

(declare-fun lt!372344 () tuple2!9976)

(declare-fun +!1947 (ListLongMap!8789 tuple2!9976) ListLongMap!8789)

(assert (=> b!825138 (= e!459237 (= lt!372355 (+!1947 (+!1947 lt!372357 (tuple2!9977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372344)))))

(declare-fun b!825139 () Bool)

(assert (=> b!825139 (= e!459240 tp_is_empty!14971)))

(declare-fun res!562548 () Bool)

(assert (=> start!71054 (=> (not res!562548) (not e!459242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71054 (= res!562548 (validMask!0 mask!1312))))

(assert (=> start!71054 e!459242))

(assert (=> start!71054 tp_is_empty!14971))

(declare-fun array_inv!17685 (array!46093) Bool)

(assert (=> start!71054 (array_inv!17685 _keys!976)))

(assert (=> start!71054 true))

(declare-fun array_inv!17686 (array!46095) Bool)

(assert (=> start!71054 (and (array_inv!17686 _values!788) e!459241)))

(assert (=> start!71054 tp!46539))

(declare-fun b!825140 () Bool)

(assert (=> b!825140 (= e!459238 true)))

(declare-fun lt!372356 () tuple2!9976)

(declare-fun lt!372345 () ListLongMap!8789)

(assert (=> b!825140 (= lt!372345 (+!1947 (+!1947 lt!372348 lt!372356) lt!372344))))

(declare-fun lt!372354 () ListLongMap!8789)

(declare-fun lt!372349 () ListLongMap!8789)

(assert (=> b!825140 (and (= lt!372354 lt!372349) (= lt!372355 lt!372349) (= lt!372355 lt!372354))))

(declare-fun lt!372347 () ListLongMap!8789)

(assert (=> b!825140 (= lt!372349 (+!1947 lt!372347 lt!372356))))

(declare-fun lt!372352 () ListLongMap!8789)

(assert (=> b!825140 (= lt!372354 (+!1947 lt!372352 lt!372356))))

(declare-fun lt!372350 () Unit!28237)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!217 (ListLongMap!8789 (_ BitVec 64) V!24963 V!24963) Unit!28237)

(assert (=> b!825140 (= lt!372350 (addSameAsAddTwiceSameKeyDiffValues!217 lt!372352 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459236 () Bool)

(assert (=> b!825140 e!459236))

(declare-fun res!562550 () Bool)

(assert (=> b!825140 (=> (not res!562550) (not e!459236))))

(declare-fun lt!372353 () ListLongMap!8789)

(assert (=> b!825140 (= res!562550 (= lt!372353 lt!372347))))

(declare-fun lt!372346 () tuple2!9976)

(assert (=> b!825140 (= lt!372347 (+!1947 lt!372352 lt!372346))))

(assert (=> b!825140 (= lt!372352 (+!1947 lt!372348 lt!372344))))

(assert (=> b!825140 (= lt!372356 (tuple2!9977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!825140 e!459237))

(declare-fun res!562551 () Bool)

(assert (=> b!825140 (=> (not res!562551) (not e!459237))))

(assert (=> b!825140 (= res!562551 (= lt!372353 (+!1947 (+!1947 lt!372348 lt!372346) lt!372344)))))

(assert (=> b!825140 (= lt!372344 (tuple2!9977 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825140 (= lt!372346 (tuple2!9977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2500 (array!46093 array!46095 (_ BitVec 32) (_ BitVec 32) V!24963 V!24963 (_ BitVec 32) Int) ListLongMap!8789)

(assert (=> b!825140 (= lt!372355 (getCurrentListMap!2500 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825140 (= lt!372353 (getCurrentListMap!2500 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825141 () Bool)

(assert (=> b!825141 (= e!459236 (= lt!372355 (+!1947 (+!1947 lt!372357 lt!372344) lt!372356)))))

(assert (= (and start!71054 res!562548) b!825135))

(assert (= (and b!825135 res!562553) b!825132))

(assert (= (and b!825132 res!562552) b!825134))

(assert (= (and b!825134 res!562549) b!825133))

(assert (= (and b!825133 (not res!562554)) b!825140))

(assert (= (and b!825140 res!562551) b!825138))

(assert (= (and b!825140 res!562550) b!825141))

(assert (= (and b!825136 condMapEmpty!24079) mapIsEmpty!24079))

(assert (= (and b!825136 (not condMapEmpty!24079)) mapNonEmpty!24079))

(get-info :version)

(assert (= (and mapNonEmpty!24079 ((_ is ValueCellFull!7070) mapValue!24079)) b!825139))

(assert (= (and b!825136 ((_ is ValueCellFull!7070) mapDefault!24079)) b!825137))

(assert (= start!71054 b!825136))

(declare-fun m!766749 () Bool)

(assert (=> b!825133 m!766749))

(declare-fun m!766751 () Bool)

(assert (=> b!825133 m!766751))

(declare-fun m!766753 () Bool)

(assert (=> b!825133 m!766753))

(declare-fun m!766755 () Bool)

(assert (=> b!825132 m!766755))

(declare-fun m!766757 () Bool)

(assert (=> mapNonEmpty!24079 m!766757))

(declare-fun m!766759 () Bool)

(assert (=> b!825141 m!766759))

(assert (=> b!825141 m!766759))

(declare-fun m!766761 () Bool)

(assert (=> b!825141 m!766761))

(declare-fun m!766763 () Bool)

(assert (=> b!825138 m!766763))

(assert (=> b!825138 m!766763))

(declare-fun m!766765 () Bool)

(assert (=> b!825138 m!766765))

(declare-fun m!766767 () Bool)

(assert (=> start!71054 m!766767))

(declare-fun m!766769 () Bool)

(assert (=> start!71054 m!766769))

(declare-fun m!766771 () Bool)

(assert (=> start!71054 m!766771))

(declare-fun m!766773 () Bool)

(assert (=> b!825140 m!766773))

(assert (=> b!825140 m!766773))

(declare-fun m!766775 () Bool)

(assert (=> b!825140 m!766775))

(declare-fun m!766777 () Bool)

(assert (=> b!825140 m!766777))

(declare-fun m!766779 () Bool)

(assert (=> b!825140 m!766779))

(declare-fun m!766781 () Bool)

(assert (=> b!825140 m!766781))

(declare-fun m!766783 () Bool)

(assert (=> b!825140 m!766783))

(declare-fun m!766785 () Bool)

(assert (=> b!825140 m!766785))

(declare-fun m!766787 () Bool)

(assert (=> b!825140 m!766787))

(assert (=> b!825140 m!766783))

(declare-fun m!766789 () Bool)

(assert (=> b!825140 m!766789))

(declare-fun m!766791 () Bool)

(assert (=> b!825140 m!766791))

(declare-fun m!766793 () Bool)

(assert (=> b!825140 m!766793))

(declare-fun m!766795 () Bool)

(assert (=> b!825134 m!766795))

(check-sat (not b!825132) (not b!825133) (not start!71054) (not b!825141) (not b!825140) (not b!825138) (not mapNonEmpty!24079) tp_is_empty!14971 (not b_next!13261) b_and!22149 (not b!825134))
(check-sat b_and!22149 (not b_next!13261))
