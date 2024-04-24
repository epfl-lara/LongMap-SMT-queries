; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41632 () Bool)

(assert start!41632)

(declare-fun b_free!11299 () Bool)

(declare-fun b_next!11299 () Bool)

(assert (=> start!41632 (= b_free!11299 (not b_next!11299))))

(declare-fun tp!39897 () Bool)

(declare-fun b_and!19657 () Bool)

(assert (=> start!41632 (= tp!39897 b_and!19657)))

(declare-fun res!278009 () Bool)

(declare-fun e!271708 () Bool)

(assert (=> start!41632 (=> (not res!278009) (not e!271708))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41632 (= res!278009 (validMask!0 mask!1365))))

(assert (=> start!41632 e!271708))

(declare-fun tp_is_empty!12727 () Bool)

(assert (=> start!41632 tp_is_empty!12727))

(assert (=> start!41632 tp!39897))

(assert (=> start!41632 true))

(declare-datatypes ((array!29236 0))(
  ( (array!29237 (arr!14048 (Array (_ BitVec 32) (_ BitVec 64))) (size!14400 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29236)

(declare-fun array_inv!10228 (array!29236) Bool)

(assert (=> start!41632 (array_inv!10228 _keys!1025)))

(declare-datatypes ((V!18075 0))(
  ( (V!18076 (val!6408 Int)) )
))
(declare-datatypes ((ValueCell!6020 0))(
  ( (ValueCellFull!6020 (v!8696 V!18075)) (EmptyCell!6020) )
))
(declare-datatypes ((array!29238 0))(
  ( (array!29239 (arr!14049 (Array (_ BitVec 32) ValueCell!6020)) (size!14401 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29238)

(declare-fun e!271705 () Bool)

(declare-fun array_inv!10229 (array!29238) Bool)

(assert (=> start!41632 (and (array_inv!10229 _values!833) e!271705)))

(declare-fun b!465010 () Bool)

(declare-fun res!278011 () Bool)

(assert (=> b!465010 (=> (not res!278011) (not e!271708))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!465010 (= res!278011 (and (= (size!14401 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14400 _keys!1025) (size!14401 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20770 () Bool)

(declare-fun mapRes!20770 () Bool)

(declare-fun tp!39898 () Bool)

(declare-fun e!271704 () Bool)

(assert (=> mapNonEmpty!20770 (= mapRes!20770 (and tp!39898 e!271704))))

(declare-fun mapRest!20770 () (Array (_ BitVec 32) ValueCell!6020))

(declare-fun mapKey!20770 () (_ BitVec 32))

(declare-fun mapValue!20770 () ValueCell!6020)

(assert (=> mapNonEmpty!20770 (= (arr!14049 _values!833) (store mapRest!20770 mapKey!20770 mapValue!20770))))

(declare-fun b!465011 () Bool)

(declare-fun res!278010 () Bool)

(assert (=> b!465011 (=> (not res!278010) (not e!271708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29236 (_ BitVec 32)) Bool)

(assert (=> b!465011 (= res!278010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465012 () Bool)

(assert (=> b!465012 (= e!271708 (not true))))

(declare-datatypes ((tuple2!8334 0))(
  ( (tuple2!8335 (_1!4178 (_ BitVec 64)) (_2!4178 V!18075)) )
))
(declare-datatypes ((List!8420 0))(
  ( (Nil!8417) (Cons!8416 (h!9272 tuple2!8334) (t!14360 List!8420)) )
))
(declare-datatypes ((ListLongMap!7249 0))(
  ( (ListLongMap!7250 (toList!3640 List!8420)) )
))
(declare-fun lt!210003 () ListLongMap!7249)

(declare-fun lt!210002 () ListLongMap!7249)

(assert (=> b!465012 (= lt!210003 lt!210002)))

(declare-fun minValueBefore!38 () V!18075)

(declare-fun zeroValue!794 () V!18075)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13498 0))(
  ( (Unit!13499) )
))
(declare-fun lt!210001 () Unit!13498)

(declare-fun minValueAfter!38 () V!18075)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!27 (array!29236 array!29238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18075 V!18075 V!18075 V!18075 (_ BitVec 32) Int) Unit!13498)

(assert (=> b!465012 (= lt!210001 (lemmaNoChangeToArrayThenSameMapNoExtras!27 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1867 (array!29236 array!29238 (_ BitVec 32) (_ BitVec 32) V!18075 V!18075 (_ BitVec 32) Int) ListLongMap!7249)

(assert (=> b!465012 (= lt!210002 (getCurrentListMapNoExtraKeys!1867 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465012 (= lt!210003 (getCurrentListMapNoExtraKeys!1867 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465013 () Bool)

(declare-fun res!278012 () Bool)

(assert (=> b!465013 (=> (not res!278012) (not e!271708))))

(declare-datatypes ((List!8421 0))(
  ( (Nil!8418) (Cons!8417 (h!9273 (_ BitVec 64)) (t!14361 List!8421)) )
))
(declare-fun arrayNoDuplicates!0 (array!29236 (_ BitVec 32) List!8421) Bool)

(assert (=> b!465013 (= res!278012 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8418))))

(declare-fun mapIsEmpty!20770 () Bool)

(assert (=> mapIsEmpty!20770 mapRes!20770))

(declare-fun b!465014 () Bool)

(declare-fun e!271707 () Bool)

(assert (=> b!465014 (= e!271705 (and e!271707 mapRes!20770))))

(declare-fun condMapEmpty!20770 () Bool)

(declare-fun mapDefault!20770 () ValueCell!6020)

(assert (=> b!465014 (= condMapEmpty!20770 (= (arr!14049 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6020)) mapDefault!20770)))))

(declare-fun b!465015 () Bool)

(assert (=> b!465015 (= e!271704 tp_is_empty!12727)))

(declare-fun b!465016 () Bool)

(assert (=> b!465016 (= e!271707 tp_is_empty!12727)))

(assert (= (and start!41632 res!278009) b!465010))

(assert (= (and b!465010 res!278011) b!465011))

(assert (= (and b!465011 res!278010) b!465013))

(assert (= (and b!465013 res!278012) b!465012))

(assert (= (and b!465014 condMapEmpty!20770) mapIsEmpty!20770))

(assert (= (and b!465014 (not condMapEmpty!20770)) mapNonEmpty!20770))

(get-info :version)

(assert (= (and mapNonEmpty!20770 ((_ is ValueCellFull!6020) mapValue!20770)) b!465015))

(assert (= (and b!465014 ((_ is ValueCellFull!6020) mapDefault!20770)) b!465016))

(assert (= start!41632 b!465014))

(declare-fun m!447541 () Bool)

(assert (=> start!41632 m!447541))

(declare-fun m!447543 () Bool)

(assert (=> start!41632 m!447543))

(declare-fun m!447545 () Bool)

(assert (=> start!41632 m!447545))

(declare-fun m!447547 () Bool)

(assert (=> mapNonEmpty!20770 m!447547))

(declare-fun m!447549 () Bool)

(assert (=> b!465012 m!447549))

(declare-fun m!447551 () Bool)

(assert (=> b!465012 m!447551))

(declare-fun m!447553 () Bool)

(assert (=> b!465012 m!447553))

(declare-fun m!447555 () Bool)

(assert (=> b!465013 m!447555))

(declare-fun m!447557 () Bool)

(assert (=> b!465011 m!447557))

(check-sat (not start!41632) (not mapNonEmpty!20770) (not b!465011) b_and!19657 (not b!465012) (not b!465013) (not b_next!11299) tp_is_empty!12727)
(check-sat b_and!19657 (not b_next!11299))
