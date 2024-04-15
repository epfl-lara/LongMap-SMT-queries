; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41850 () Bool)

(assert start!41850)

(declare-fun b_free!11467 () Bool)

(declare-fun b_next!11467 () Bool)

(assert (=> start!41850 (= b_free!11467 (not b_next!11467))))

(declare-fun tp!40411 () Bool)

(declare-fun b_and!19821 () Bool)

(assert (=> start!41850 (= tp!40411 b_and!19821)))

(declare-fun mapNonEmpty!21031 () Bool)

(declare-fun mapRes!21031 () Bool)

(declare-fun tp!40410 () Bool)

(declare-fun e!273266 () Bool)

(assert (=> mapNonEmpty!21031 (= mapRes!21031 (and tp!40410 e!273266))))

(declare-datatypes ((V!18299 0))(
  ( (V!18300 (val!6492 Int)) )
))
(declare-datatypes ((ValueCell!6104 0))(
  ( (ValueCellFull!6104 (v!8775 V!18299)) (EmptyCell!6104) )
))
(declare-datatypes ((array!29561 0))(
  ( (array!29562 (arr!14208 (Array (_ BitVec 32) ValueCell!6104)) (size!14561 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29561)

(declare-fun mapRest!21031 () (Array (_ BitVec 32) ValueCell!6104))

(declare-fun mapKey!21031 () (_ BitVec 32))

(declare-fun mapValue!21031 () ValueCell!6104)

(assert (=> mapNonEmpty!21031 (= (arr!14208 _values!833) (store mapRest!21031 mapKey!21031 mapValue!21031))))

(declare-fun mapIsEmpty!21031 () Bool)

(assert (=> mapIsEmpty!21031 mapRes!21031))

(declare-fun b!467179 () Bool)

(declare-fun res!279253 () Bool)

(declare-fun e!273267 () Bool)

(assert (=> b!467179 (=> (not res!279253) (not e!273267))))

(declare-datatypes ((array!29563 0))(
  ( (array!29564 (arr!14209 (Array (_ BitVec 32) (_ BitVec 64))) (size!14562 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29563)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29563 (_ BitVec 32)) Bool)

(assert (=> b!467179 (= res!279253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467180 () Bool)

(declare-fun res!279255 () Bool)

(assert (=> b!467180 (=> (not res!279255) (not e!273267))))

(declare-datatypes ((List!8643 0))(
  ( (Nil!8640) (Cons!8639 (h!9495 (_ BitVec 64)) (t!14588 List!8643)) )
))
(declare-fun arrayNoDuplicates!0 (array!29563 (_ BitVec 32) List!8643) Bool)

(assert (=> b!467180 (= res!279255 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8640))))

(declare-fun b!467181 () Bool)

(assert (=> b!467181 (= e!273267 (not true))))

(declare-datatypes ((tuple2!8564 0))(
  ( (tuple2!8565 (_1!4293 (_ BitVec 64)) (_2!4293 V!18299)) )
))
(declare-datatypes ((List!8644 0))(
  ( (Nil!8641) (Cons!8640 (h!9496 tuple2!8564) (t!14589 List!8644)) )
))
(declare-datatypes ((ListLongMap!7467 0))(
  ( (ListLongMap!7468 (toList!3749 List!8644)) )
))
(declare-fun lt!211121 () ListLongMap!7467)

(declare-fun lt!211119 () ListLongMap!7467)

(assert (=> b!467181 (= lt!211121 lt!211119)))

(declare-fun minValueBefore!38 () V!18299)

(declare-fun zeroValue!794 () V!18299)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13602 0))(
  ( (Unit!13603) )
))
(declare-fun lt!211120 () Unit!13602)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18299)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!90 (array!29563 array!29561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18299 V!18299 V!18299 V!18299 (_ BitVec 32) Int) Unit!13602)

(assert (=> b!467181 (= lt!211120 (lemmaNoChangeToArrayThenSameMapNoExtras!90 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1933 (array!29563 array!29561 (_ BitVec 32) (_ BitVec 32) V!18299 V!18299 (_ BitVec 32) Int) ListLongMap!7467)

(assert (=> b!467181 (= lt!211119 (getCurrentListMapNoExtraKeys!1933 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467181 (= lt!211121 (getCurrentListMapNoExtraKeys!1933 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467182 () Bool)

(declare-fun e!273270 () Bool)

(declare-fun e!273269 () Bool)

(assert (=> b!467182 (= e!273270 (and e!273269 mapRes!21031))))

(declare-fun condMapEmpty!21031 () Bool)

(declare-fun mapDefault!21031 () ValueCell!6104)

(assert (=> b!467182 (= condMapEmpty!21031 (= (arr!14208 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6104)) mapDefault!21031)))))

(declare-fun b!467184 () Bool)

(declare-fun tp_is_empty!12895 () Bool)

(assert (=> b!467184 (= e!273269 tp_is_empty!12895)))

(declare-fun b!467185 () Bool)

(declare-fun res!279252 () Bool)

(assert (=> b!467185 (=> (not res!279252) (not e!273267))))

(assert (=> b!467185 (= res!279252 (and (= (size!14561 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14562 _keys!1025) (size!14561 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!279254 () Bool)

(assert (=> start!41850 (=> (not res!279254) (not e!273267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41850 (= res!279254 (validMask!0 mask!1365))))

(assert (=> start!41850 e!273267))

(assert (=> start!41850 tp_is_empty!12895))

(assert (=> start!41850 tp!40411))

(assert (=> start!41850 true))

(declare-fun array_inv!10340 (array!29563) Bool)

(assert (=> start!41850 (array_inv!10340 _keys!1025)))

(declare-fun array_inv!10341 (array!29561) Bool)

(assert (=> start!41850 (and (array_inv!10341 _values!833) e!273270)))

(declare-fun b!467183 () Bool)

(assert (=> b!467183 (= e!273266 tp_is_empty!12895)))

(assert (= (and start!41850 res!279254) b!467185))

(assert (= (and b!467185 res!279252) b!467179))

(assert (= (and b!467179 res!279253) b!467180))

(assert (= (and b!467180 res!279255) b!467181))

(assert (= (and b!467182 condMapEmpty!21031) mapIsEmpty!21031))

(assert (= (and b!467182 (not condMapEmpty!21031)) mapNonEmpty!21031))

(get-info :version)

(assert (= (and mapNonEmpty!21031 ((_ is ValueCellFull!6104) mapValue!21031)) b!467183))

(assert (= (and b!467182 ((_ is ValueCellFull!6104) mapDefault!21031)) b!467184))

(assert (= start!41850 b!467182))

(declare-fun m!448867 () Bool)

(assert (=> mapNonEmpty!21031 m!448867))

(declare-fun m!448869 () Bool)

(assert (=> b!467179 m!448869))

(declare-fun m!448871 () Bool)

(assert (=> start!41850 m!448871))

(declare-fun m!448873 () Bool)

(assert (=> start!41850 m!448873))

(declare-fun m!448875 () Bool)

(assert (=> start!41850 m!448875))

(declare-fun m!448877 () Bool)

(assert (=> b!467180 m!448877))

(declare-fun m!448879 () Bool)

(assert (=> b!467181 m!448879))

(declare-fun m!448881 () Bool)

(assert (=> b!467181 m!448881))

(declare-fun m!448883 () Bool)

(assert (=> b!467181 m!448883))

(check-sat (not mapNonEmpty!21031) (not b!467179) (not b!467181) (not start!41850) (not b!467180) tp_is_empty!12895 b_and!19821 (not b_next!11467))
(check-sat b_and!19821 (not b_next!11467))
