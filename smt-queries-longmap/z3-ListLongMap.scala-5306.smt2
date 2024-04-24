; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71222 () Bool)

(assert start!71222)

(declare-fun b_free!13243 () Bool)

(declare-fun b_next!13243 () Bool)

(assert (=> start!71222 (= b_free!13243 (not b_next!13243))))

(declare-fun tp!46485 () Bool)

(declare-fun b_and!22167 () Bool)

(assert (=> start!71222 (= tp!46485 b_and!22167)))

(declare-fun b!826002 () Bool)

(declare-fun e!459752 () Bool)

(declare-fun tp_is_empty!14953 () Bool)

(assert (=> b!826002 (= e!459752 tp_is_empty!14953)))

(declare-fun e!459753 () Bool)

(declare-datatypes ((V!24939 0))(
  ( (V!24940 (val!7524 Int)) )
))
(declare-datatypes ((tuple2!9880 0))(
  ( (tuple2!9881 (_1!4951 (_ BitVec 64)) (_2!4951 V!24939)) )
))
(declare-datatypes ((List!15665 0))(
  ( (Nil!15662) (Cons!15661 (h!16796 tuple2!9880) (t!22002 List!15665)) )
))
(declare-datatypes ((ListLongMap!8705 0))(
  ( (ListLongMap!8706 (toList!4368 List!15665)) )
))
(declare-fun lt!372574 () ListLongMap!8705)

(declare-fun b!826003 () Bool)

(declare-fun zeroValueAfter!34 () V!24939)

(declare-fun lt!372573 () tuple2!9880)

(declare-fun lt!372564 () ListLongMap!8705)

(declare-fun +!1915 (ListLongMap!8705 tuple2!9880) ListLongMap!8705)

(assert (=> b!826003 (= e!459753 (= lt!372564 (+!1915 (+!1915 lt!372574 (tuple2!9881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372573)))))

(declare-fun b!826004 () Bool)

(declare-fun e!459754 () Bool)

(declare-fun lt!372571 () tuple2!9880)

(assert (=> b!826004 (= e!459754 (= lt!372564 (+!1915 (+!1915 lt!372574 lt!372573) lt!372571)))))

(declare-fun b!826005 () Bool)

(declare-fun e!459751 () Bool)

(declare-fun e!459750 () Bool)

(assert (=> b!826005 (= e!459751 (not e!459750))))

(declare-fun res!562815 () Bool)

(assert (=> b!826005 (=> res!562815 e!459750)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826005 (= res!562815 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!372576 () ListLongMap!8705)

(assert (=> b!826005 (= lt!372576 lt!372574)))

(declare-fun zeroValueBefore!34 () V!24939)

(declare-datatypes ((array!46095 0))(
  ( (array!46096 (arr!22089 (Array (_ BitVec 32) (_ BitVec 64))) (size!22509 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46095)

(declare-fun minValue!754 () V!24939)

(declare-datatypes ((ValueCell!7061 0))(
  ( (ValueCellFull!7061 (v!9957 V!24939)) (EmptyCell!7061) )
))
(declare-datatypes ((array!46097 0))(
  ( (array!46098 (arr!22090 (Array (_ BitVec 32) ValueCell!7061)) (size!22510 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46097)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28288 0))(
  ( (Unit!28289) )
))
(declare-fun lt!372575 () Unit!28288)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!538 (array!46095 array!46097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24939 V!24939 V!24939 V!24939 (_ BitVec 32) Int) Unit!28288)

(assert (=> b!826005 (= lt!372575 (lemmaNoChangeToArrayThenSameMapNoExtras!538 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2450 (array!46095 array!46097 (_ BitVec 32) (_ BitVec 32) V!24939 V!24939 (_ BitVec 32) Int) ListLongMap!8705)

(assert (=> b!826005 (= lt!372574 (getCurrentListMapNoExtraKeys!2450 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826005 (= lt!372576 (getCurrentListMapNoExtraKeys!2450 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826006 () Bool)

(declare-fun res!562817 () Bool)

(assert (=> b!826006 (=> (not res!562817) (not e!459751))))

(declare-datatypes ((List!15666 0))(
  ( (Nil!15663) (Cons!15662 (h!16797 (_ BitVec 64)) (t!22003 List!15666)) )
))
(declare-fun arrayNoDuplicates!0 (array!46095 (_ BitVec 32) List!15666) Bool)

(assert (=> b!826006 (= res!562817 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15663))))

(declare-fun b!826007 () Bool)

(declare-fun e!459749 () Bool)

(declare-fun e!459755 () Bool)

(declare-fun mapRes!24052 () Bool)

(assert (=> b!826007 (= e!459749 (and e!459755 mapRes!24052))))

(declare-fun condMapEmpty!24052 () Bool)

(declare-fun mapDefault!24052 () ValueCell!7061)

(assert (=> b!826007 (= condMapEmpty!24052 (= (arr!22090 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7061)) mapDefault!24052)))))

(declare-fun mapNonEmpty!24052 () Bool)

(declare-fun tp!46486 () Bool)

(assert (=> mapNonEmpty!24052 (= mapRes!24052 (and tp!46486 e!459752))))

(declare-fun mapKey!24052 () (_ BitVec 32))

(declare-fun mapValue!24052 () ValueCell!7061)

(declare-fun mapRest!24052 () (Array (_ BitVec 32) ValueCell!7061))

(assert (=> mapNonEmpty!24052 (= (arr!22090 _values!788) (store mapRest!24052 mapKey!24052 mapValue!24052))))

(declare-fun b!826008 () Bool)

(declare-fun res!562814 () Bool)

(assert (=> b!826008 (=> (not res!562814) (not e!459751))))

(assert (=> b!826008 (= res!562814 (and (= (size!22510 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22509 _keys!976) (size!22510 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!562813 () Bool)

(assert (=> start!71222 (=> (not res!562813) (not e!459751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71222 (= res!562813 (validMask!0 mask!1312))))

(assert (=> start!71222 e!459751))

(assert (=> start!71222 tp_is_empty!14953))

(declare-fun array_inv!17655 (array!46095) Bool)

(assert (=> start!71222 (array_inv!17655 _keys!976)))

(assert (=> start!71222 true))

(declare-fun array_inv!17656 (array!46097) Bool)

(assert (=> start!71222 (and (array_inv!17656 _values!788) e!459749)))

(assert (=> start!71222 tp!46485))

(declare-fun b!826009 () Bool)

(assert (=> b!826009 (= e!459750 true)))

(declare-fun lt!372566 () ListLongMap!8705)

(assert (=> b!826009 (= lt!372566 (+!1915 (+!1915 lt!372576 lt!372571) lt!372573))))

(declare-fun lt!372563 () ListLongMap!8705)

(declare-fun lt!372565 () ListLongMap!8705)

(assert (=> b!826009 (and (= lt!372563 lt!372565) (= lt!372564 lt!372565) (= lt!372564 lt!372563))))

(declare-fun lt!372567 () ListLongMap!8705)

(assert (=> b!826009 (= lt!372565 (+!1915 lt!372567 lt!372571))))

(declare-fun lt!372570 () ListLongMap!8705)

(assert (=> b!826009 (= lt!372563 (+!1915 lt!372570 lt!372571))))

(declare-fun lt!372572 () Unit!28288)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!203 (ListLongMap!8705 (_ BitVec 64) V!24939 V!24939) Unit!28288)

(assert (=> b!826009 (= lt!372572 (addSameAsAddTwiceSameKeyDiffValues!203 lt!372570 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826009 e!459754))

(declare-fun res!562811 () Bool)

(assert (=> b!826009 (=> (not res!562811) (not e!459754))))

(declare-fun lt!372569 () ListLongMap!8705)

(assert (=> b!826009 (= res!562811 (= lt!372569 lt!372567))))

(declare-fun lt!372568 () tuple2!9880)

(assert (=> b!826009 (= lt!372567 (+!1915 lt!372570 lt!372568))))

(assert (=> b!826009 (= lt!372570 (+!1915 lt!372576 lt!372573))))

(assert (=> b!826009 (= lt!372571 (tuple2!9881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826009 e!459753))

(declare-fun res!562816 () Bool)

(assert (=> b!826009 (=> (not res!562816) (not e!459753))))

(assert (=> b!826009 (= res!562816 (= lt!372569 (+!1915 (+!1915 lt!372576 lt!372568) lt!372573)))))

(assert (=> b!826009 (= lt!372573 (tuple2!9881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826009 (= lt!372568 (tuple2!9881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2494 (array!46095 array!46097 (_ BitVec 32) (_ BitVec 32) V!24939 V!24939 (_ BitVec 32) Int) ListLongMap!8705)

(assert (=> b!826009 (= lt!372564 (getCurrentListMap!2494 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826009 (= lt!372569 (getCurrentListMap!2494 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24052 () Bool)

(assert (=> mapIsEmpty!24052 mapRes!24052))

(declare-fun b!826010 () Bool)

(assert (=> b!826010 (= e!459755 tp_is_empty!14953)))

(declare-fun b!826011 () Bool)

(declare-fun res!562812 () Bool)

(assert (=> b!826011 (=> (not res!562812) (not e!459751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46095 (_ BitVec 32)) Bool)

(assert (=> b!826011 (= res!562812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71222 res!562813) b!826008))

(assert (= (and b!826008 res!562814) b!826011))

(assert (= (and b!826011 res!562812) b!826006))

(assert (= (and b!826006 res!562817) b!826005))

(assert (= (and b!826005 (not res!562815)) b!826009))

(assert (= (and b!826009 res!562816) b!826003))

(assert (= (and b!826009 res!562811) b!826004))

(assert (= (and b!826007 condMapEmpty!24052) mapIsEmpty!24052))

(assert (= (and b!826007 (not condMapEmpty!24052)) mapNonEmpty!24052))

(get-info :version)

(assert (= (and mapNonEmpty!24052 ((_ is ValueCellFull!7061) mapValue!24052)) b!826002))

(assert (= (and b!826007 ((_ is ValueCellFull!7061) mapDefault!24052)) b!826010))

(assert (= start!71222 b!826007))

(declare-fun m!768351 () Bool)

(assert (=> b!826006 m!768351))

(declare-fun m!768353 () Bool)

(assert (=> b!826003 m!768353))

(assert (=> b!826003 m!768353))

(declare-fun m!768355 () Bool)

(assert (=> b!826003 m!768355))

(declare-fun m!768357 () Bool)

(assert (=> start!71222 m!768357))

(declare-fun m!768359 () Bool)

(assert (=> start!71222 m!768359))

(declare-fun m!768361 () Bool)

(assert (=> start!71222 m!768361))

(declare-fun m!768363 () Bool)

(assert (=> b!826009 m!768363))

(declare-fun m!768365 () Bool)

(assert (=> b!826009 m!768365))

(declare-fun m!768367 () Bool)

(assert (=> b!826009 m!768367))

(declare-fun m!768369 () Bool)

(assert (=> b!826009 m!768369))

(declare-fun m!768371 () Bool)

(assert (=> b!826009 m!768371))

(declare-fun m!768373 () Bool)

(assert (=> b!826009 m!768373))

(assert (=> b!826009 m!768371))

(declare-fun m!768375 () Bool)

(assert (=> b!826009 m!768375))

(declare-fun m!768377 () Bool)

(assert (=> b!826009 m!768377))

(declare-fun m!768379 () Bool)

(assert (=> b!826009 m!768379))

(declare-fun m!768381 () Bool)

(assert (=> b!826009 m!768381))

(assert (=> b!826009 m!768369))

(declare-fun m!768383 () Bool)

(assert (=> b!826009 m!768383))

(declare-fun m!768385 () Bool)

(assert (=> b!826005 m!768385))

(declare-fun m!768387 () Bool)

(assert (=> b!826005 m!768387))

(declare-fun m!768389 () Bool)

(assert (=> b!826005 m!768389))

(declare-fun m!768391 () Bool)

(assert (=> b!826011 m!768391))

(declare-fun m!768393 () Bool)

(assert (=> mapNonEmpty!24052 m!768393))

(declare-fun m!768395 () Bool)

(assert (=> b!826004 m!768395))

(assert (=> b!826004 m!768395))

(declare-fun m!768397 () Bool)

(assert (=> b!826004 m!768397))

(check-sat b_and!22167 (not b!826009) (not b!826006) (not b!826005) (not b!826003) (not b!826011) (not mapNonEmpty!24052) (not b_next!13243) (not b!826004) tp_is_empty!14953 (not start!71222))
(check-sat b_and!22167 (not b_next!13243))
