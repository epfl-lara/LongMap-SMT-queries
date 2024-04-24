; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41700 () Bool)

(assert start!41700)

(declare-fun b_free!11353 () Bool)

(declare-fun b_next!11353 () Bool)

(assert (=> start!41700 (= b_free!11353 (not b_next!11353))))

(declare-fun tp!40063 () Bool)

(declare-fun b_and!19719 () Bool)

(assert (=> start!41700 (= tp!40063 b_and!19719)))

(declare-fun b!465709 () Bool)

(declare-fun res!278412 () Bool)

(declare-fun e!272211 () Bool)

(assert (=> b!465709 (=> (not res!278412) (not e!272211))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29344 0))(
  ( (array!29345 (arr!14101 (Array (_ BitVec 32) (_ BitVec 64))) (size!14453 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29344)

(declare-datatypes ((V!18147 0))(
  ( (V!18148 (val!6435 Int)) )
))
(declare-datatypes ((ValueCell!6047 0))(
  ( (ValueCellFull!6047 (v!8723 V!18147)) (EmptyCell!6047) )
))
(declare-datatypes ((array!29346 0))(
  ( (array!29347 (arr!14102 (Array (_ BitVec 32) ValueCell!6047)) (size!14454 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29346)

(assert (=> b!465709 (= res!278412 (and (= (size!14454 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14453 _keys!1025) (size!14454 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465710 () Bool)

(declare-fun e!272216 () Bool)

(assert (=> b!465710 (= e!272216 true)))

(declare-datatypes ((tuple2!8370 0))(
  ( (tuple2!8371 (_1!4196 (_ BitVec 64)) (_2!4196 V!18147)) )
))
(declare-datatypes ((List!8457 0))(
  ( (Nil!8454) (Cons!8453 (h!9309 tuple2!8370) (t!14399 List!8457)) )
))
(declare-datatypes ((ListLongMap!7285 0))(
  ( (ListLongMap!7286 (toList!3658 List!8457)) )
))
(declare-fun lt!210381 () ListLongMap!7285)

(declare-fun zeroValue!794 () V!18147)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18147)

(declare-fun getCurrentListMap!2108 (array!29344 array!29346 (_ BitVec 32) (_ BitVec 32) V!18147 V!18147 (_ BitVec 32) Int) ListLongMap!7285)

(assert (=> b!465710 (= lt!210381 (getCurrentListMap!2108 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210382 () ListLongMap!7285)

(declare-fun minValueBefore!38 () V!18147)

(declare-fun +!1657 (ListLongMap!7285 tuple2!8370) ListLongMap!7285)

(assert (=> b!465710 (= lt!210382 (+!1657 (getCurrentListMap!2108 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8371 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465711 () Bool)

(declare-fun e!272215 () Bool)

(declare-fun e!272214 () Bool)

(declare-fun mapRes!20854 () Bool)

(assert (=> b!465711 (= e!272215 (and e!272214 mapRes!20854))))

(declare-fun condMapEmpty!20854 () Bool)

(declare-fun mapDefault!20854 () ValueCell!6047)

(assert (=> b!465711 (= condMapEmpty!20854 (= (arr!14102 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6047)) mapDefault!20854)))))

(declare-fun b!465712 () Bool)

(assert (=> b!465712 (= e!272211 (not e!272216))))

(declare-fun res!278411 () Bool)

(assert (=> b!465712 (=> res!278411 e!272216)))

(assert (=> b!465712 (= res!278411 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210378 () ListLongMap!7285)

(declare-fun lt!210380 () ListLongMap!7285)

(assert (=> b!465712 (= lt!210378 lt!210380)))

(declare-datatypes ((Unit!13532 0))(
  ( (Unit!13533) )
))
(declare-fun lt!210379 () Unit!13532)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!44 (array!29344 array!29346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18147 V!18147 V!18147 V!18147 (_ BitVec 32) Int) Unit!13532)

(assert (=> b!465712 (= lt!210379 (lemmaNoChangeToArrayThenSameMapNoExtras!44 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1884 (array!29344 array!29346 (_ BitVec 32) (_ BitVec 32) V!18147 V!18147 (_ BitVec 32) Int) ListLongMap!7285)

(assert (=> b!465712 (= lt!210380 (getCurrentListMapNoExtraKeys!1884 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465712 (= lt!210378 (getCurrentListMapNoExtraKeys!1884 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20854 () Bool)

(assert (=> mapIsEmpty!20854 mapRes!20854))

(declare-fun res!278413 () Bool)

(assert (=> start!41700 (=> (not res!278413) (not e!272211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41700 (= res!278413 (validMask!0 mask!1365))))

(assert (=> start!41700 e!272211))

(declare-fun tp_is_empty!12781 () Bool)

(assert (=> start!41700 tp_is_empty!12781))

(assert (=> start!41700 tp!40063))

(assert (=> start!41700 true))

(declare-fun array_inv!10264 (array!29344) Bool)

(assert (=> start!41700 (array_inv!10264 _keys!1025)))

(declare-fun array_inv!10265 (array!29346) Bool)

(assert (=> start!41700 (and (array_inv!10265 _values!833) e!272215)))

(declare-fun b!465713 () Bool)

(declare-fun res!278414 () Bool)

(assert (=> b!465713 (=> (not res!278414) (not e!272211))))

(declare-datatypes ((List!8458 0))(
  ( (Nil!8455) (Cons!8454 (h!9310 (_ BitVec 64)) (t!14400 List!8458)) )
))
(declare-fun arrayNoDuplicates!0 (array!29344 (_ BitVec 32) List!8458) Bool)

(assert (=> b!465713 (= res!278414 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8455))))

(declare-fun b!465714 () Bool)

(declare-fun e!272213 () Bool)

(assert (=> b!465714 (= e!272213 tp_is_empty!12781)))

(declare-fun b!465715 () Bool)

(assert (=> b!465715 (= e!272214 tp_is_empty!12781)))

(declare-fun b!465716 () Bool)

(declare-fun res!278415 () Bool)

(assert (=> b!465716 (=> (not res!278415) (not e!272211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29344 (_ BitVec 32)) Bool)

(assert (=> b!465716 (= res!278415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20854 () Bool)

(declare-fun tp!40062 () Bool)

(assert (=> mapNonEmpty!20854 (= mapRes!20854 (and tp!40062 e!272213))))

(declare-fun mapRest!20854 () (Array (_ BitVec 32) ValueCell!6047))

(declare-fun mapValue!20854 () ValueCell!6047)

(declare-fun mapKey!20854 () (_ BitVec 32))

(assert (=> mapNonEmpty!20854 (= (arr!14102 _values!833) (store mapRest!20854 mapKey!20854 mapValue!20854))))

(assert (= (and start!41700 res!278413) b!465709))

(assert (= (and b!465709 res!278412) b!465716))

(assert (= (and b!465716 res!278415) b!465713))

(assert (= (and b!465713 res!278414) b!465712))

(assert (= (and b!465712 (not res!278411)) b!465710))

(assert (= (and b!465711 condMapEmpty!20854) mapIsEmpty!20854))

(assert (= (and b!465711 (not condMapEmpty!20854)) mapNonEmpty!20854))

(get-info :version)

(assert (= (and mapNonEmpty!20854 ((_ is ValueCellFull!6047) mapValue!20854)) b!465714))

(assert (= (and b!465711 ((_ is ValueCellFull!6047) mapDefault!20854)) b!465715))

(assert (= start!41700 b!465711))

(declare-fun m!448183 () Bool)

(assert (=> start!41700 m!448183))

(declare-fun m!448185 () Bool)

(assert (=> start!41700 m!448185))

(declare-fun m!448187 () Bool)

(assert (=> start!41700 m!448187))

(declare-fun m!448189 () Bool)

(assert (=> b!465716 m!448189))

(declare-fun m!448191 () Bool)

(assert (=> mapNonEmpty!20854 m!448191))

(declare-fun m!448193 () Bool)

(assert (=> b!465713 m!448193))

(declare-fun m!448195 () Bool)

(assert (=> b!465712 m!448195))

(declare-fun m!448197 () Bool)

(assert (=> b!465712 m!448197))

(declare-fun m!448199 () Bool)

(assert (=> b!465712 m!448199))

(declare-fun m!448201 () Bool)

(assert (=> b!465710 m!448201))

(declare-fun m!448203 () Bool)

(assert (=> b!465710 m!448203))

(assert (=> b!465710 m!448203))

(declare-fun m!448205 () Bool)

(assert (=> b!465710 m!448205))

(check-sat (not start!41700) tp_is_empty!12781 (not b!465712) b_and!19719 (not b_next!11353) (not mapNonEmpty!20854) (not b!465716) (not b!465710) (not b!465713))
(check-sat b_and!19719 (not b_next!11353))
