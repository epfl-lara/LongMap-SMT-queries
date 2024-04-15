; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41700 () Bool)

(assert start!41700)

(declare-fun b_free!11353 () Bool)

(declare-fun b_next!11353 () Bool)

(assert (=> start!41700 (= b_free!11353 (not b_next!11353))))

(declare-fun tp!40062 () Bool)

(declare-fun b_and!19683 () Bool)

(assert (=> start!41700 (= tp!40062 b_and!19683)))

(declare-fun mapIsEmpty!20854 () Bool)

(declare-fun mapRes!20854 () Bool)

(assert (=> mapIsEmpty!20854 mapRes!20854))

(declare-fun b!465499 () Bool)

(declare-fun e!272078 () Bool)

(declare-fun tp_is_empty!12781 () Bool)

(assert (=> b!465499 (= e!272078 tp_is_empty!12781)))

(declare-fun mapNonEmpty!20854 () Bool)

(declare-fun tp!40063 () Bool)

(declare-fun e!272079 () Bool)

(assert (=> mapNonEmpty!20854 (= mapRes!20854 (and tp!40063 e!272079))))

(declare-datatypes ((V!18147 0))(
  ( (V!18148 (val!6435 Int)) )
))
(declare-datatypes ((ValueCell!6047 0))(
  ( (ValueCellFull!6047 (v!8716 V!18147)) (EmptyCell!6047) )
))
(declare-datatypes ((array!29341 0))(
  ( (array!29342 (arr!14100 (Array (_ BitVec 32) ValueCell!6047)) (size!14453 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29341)

(declare-fun mapValue!20854 () ValueCell!6047)

(declare-fun mapKey!20854 () (_ BitVec 32))

(declare-fun mapRest!20854 () (Array (_ BitVec 32) ValueCell!6047))

(assert (=> mapNonEmpty!20854 (= (arr!14100 _values!833) (store mapRest!20854 mapKey!20854 mapValue!20854))))

(declare-fun b!465501 () Bool)

(declare-fun e!272081 () Bool)

(assert (=> b!465501 (= e!272081 (and e!272078 mapRes!20854))))

(declare-fun condMapEmpty!20854 () Bool)

(declare-fun mapDefault!20854 () ValueCell!6047)

(assert (=> b!465501 (= condMapEmpty!20854 (= (arr!14100 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6047)) mapDefault!20854)))))

(declare-fun b!465502 () Bool)

(declare-fun e!272077 () Bool)

(declare-fun e!272080 () Bool)

(assert (=> b!465502 (= e!272077 (not e!272080))))

(declare-fun res!278290 () Bool)

(assert (=> b!465502 (=> res!278290 e!272080)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465502 (= res!278290 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8476 0))(
  ( (tuple2!8477 (_1!4249 (_ BitVec 64)) (_2!4249 V!18147)) )
))
(declare-datatypes ((List!8560 0))(
  ( (Nil!8557) (Cons!8556 (h!9412 tuple2!8476) (t!14501 List!8560)) )
))
(declare-datatypes ((ListLongMap!7379 0))(
  ( (ListLongMap!7380 (toList!3705 List!8560)) )
))
(declare-fun lt!210136 () ListLongMap!7379)

(declare-fun lt!210133 () ListLongMap!7379)

(assert (=> b!465502 (= lt!210136 lt!210133)))

(declare-fun minValueBefore!38 () V!18147)

(declare-fun zeroValue!794 () V!18147)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13522 0))(
  ( (Unit!13523) )
))
(declare-fun lt!210135 () Unit!13522)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29343 0))(
  ( (array!29344 (arr!14101 (Array (_ BitVec 32) (_ BitVec 64))) (size!14454 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29343)

(declare-fun minValueAfter!38 () V!18147)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!52 (array!29343 array!29341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18147 V!18147 V!18147 V!18147 (_ BitVec 32) Int) Unit!13522)

(assert (=> b!465502 (= lt!210135 (lemmaNoChangeToArrayThenSameMapNoExtras!52 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1895 (array!29343 array!29341 (_ BitVec 32) (_ BitVec 32) V!18147 V!18147 (_ BitVec 32) Int) ListLongMap!7379)

(assert (=> b!465502 (= lt!210133 (getCurrentListMapNoExtraKeys!1895 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465502 (= lt!210136 (getCurrentListMapNoExtraKeys!1895 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465503 () Bool)

(assert (=> b!465503 (= e!272079 tp_is_empty!12781)))

(declare-fun b!465504 () Bool)

(declare-fun res!278292 () Bool)

(assert (=> b!465504 (=> (not res!278292) (not e!272077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29343 (_ BitVec 32)) Bool)

(assert (=> b!465504 (= res!278292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465505 () Bool)

(assert (=> b!465505 (= e!272080 true)))

(declare-fun lt!210134 () ListLongMap!7379)

(declare-fun getCurrentListMap!2098 (array!29343 array!29341 (_ BitVec 32) (_ BitVec 32) V!18147 V!18147 (_ BitVec 32) Int) ListLongMap!7379)

(assert (=> b!465505 (= lt!210134 (getCurrentListMap!2098 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210132 () ListLongMap!7379)

(declare-fun +!1679 (ListLongMap!7379 tuple2!8476) ListLongMap!7379)

(assert (=> b!465505 (= lt!210132 (+!1679 (getCurrentListMap!2098 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8477 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465506 () Bool)

(declare-fun res!278291 () Bool)

(assert (=> b!465506 (=> (not res!278291) (not e!272077))))

(assert (=> b!465506 (= res!278291 (and (= (size!14453 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14454 _keys!1025) (size!14453 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465500 () Bool)

(declare-fun res!278289 () Bool)

(assert (=> b!465500 (=> (not res!278289) (not e!272077))))

(declare-datatypes ((List!8561 0))(
  ( (Nil!8558) (Cons!8557 (h!9413 (_ BitVec 64)) (t!14502 List!8561)) )
))
(declare-fun arrayNoDuplicates!0 (array!29343 (_ BitVec 32) List!8561) Bool)

(assert (=> b!465500 (= res!278289 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8558))))

(declare-fun res!278293 () Bool)

(assert (=> start!41700 (=> (not res!278293) (not e!272077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41700 (= res!278293 (validMask!0 mask!1365))))

(assert (=> start!41700 e!272077))

(assert (=> start!41700 tp_is_empty!12781))

(assert (=> start!41700 tp!40062))

(assert (=> start!41700 true))

(declare-fun array_inv!10264 (array!29343) Bool)

(assert (=> start!41700 (array_inv!10264 _keys!1025)))

(declare-fun array_inv!10265 (array!29341) Bool)

(assert (=> start!41700 (and (array_inv!10265 _values!833) e!272081)))

(assert (= (and start!41700 res!278293) b!465506))

(assert (= (and b!465506 res!278291) b!465504))

(assert (= (and b!465504 res!278292) b!465500))

(assert (= (and b!465500 res!278289) b!465502))

(assert (= (and b!465502 (not res!278290)) b!465505))

(assert (= (and b!465501 condMapEmpty!20854) mapIsEmpty!20854))

(assert (= (and b!465501 (not condMapEmpty!20854)) mapNonEmpty!20854))

(get-info :version)

(assert (= (and mapNonEmpty!20854 ((_ is ValueCellFull!6047) mapValue!20854)) b!465503))

(assert (= (and b!465501 ((_ is ValueCellFull!6047) mapDefault!20854)) b!465499))

(assert (= start!41700 b!465501))

(declare-fun m!447267 () Bool)

(assert (=> mapNonEmpty!20854 m!447267))

(declare-fun m!447269 () Bool)

(assert (=> b!465500 m!447269))

(declare-fun m!447271 () Bool)

(assert (=> b!465502 m!447271))

(declare-fun m!447273 () Bool)

(assert (=> b!465502 m!447273))

(declare-fun m!447275 () Bool)

(assert (=> b!465502 m!447275))

(declare-fun m!447277 () Bool)

(assert (=> b!465505 m!447277))

(declare-fun m!447279 () Bool)

(assert (=> b!465505 m!447279))

(assert (=> b!465505 m!447279))

(declare-fun m!447281 () Bool)

(assert (=> b!465505 m!447281))

(declare-fun m!447283 () Bool)

(assert (=> b!465504 m!447283))

(declare-fun m!447285 () Bool)

(assert (=> start!41700 m!447285))

(declare-fun m!447287 () Bool)

(assert (=> start!41700 m!447287))

(declare-fun m!447289 () Bool)

(assert (=> start!41700 m!447289))

(check-sat (not b!465500) (not start!41700) (not b_next!11353) (not b!465505) (not b!465502) (not b!465504) (not mapNonEmpty!20854) b_and!19683 tp_is_empty!12781)
(check-sat b_and!19683 (not b_next!11353))
