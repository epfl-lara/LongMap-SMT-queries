; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41688 () Bool)

(assert start!41688)

(declare-fun b_free!11341 () Bool)

(declare-fun b_next!11341 () Bool)

(assert (=> start!41688 (= b_free!11341 (not b_next!11341))))

(declare-fun tp!40026 () Bool)

(declare-fun b_and!19707 () Bool)

(assert (=> start!41688 (= tp!40026 b_and!19707)))

(declare-fun b!465565 () Bool)

(declare-fun e!272107 () Bool)

(declare-fun tp_is_empty!12769 () Bool)

(assert (=> b!465565 (= e!272107 tp_is_empty!12769)))

(declare-fun b!465566 () Bool)

(declare-fun res!278321 () Bool)

(declare-fun e!272105 () Bool)

(assert (=> b!465566 (=> (not res!278321) (not e!272105))))

(declare-datatypes ((array!29320 0))(
  ( (array!29321 (arr!14089 (Array (_ BitVec 32) (_ BitVec 64))) (size!14441 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29320)

(declare-datatypes ((List!8449 0))(
  ( (Nil!8446) (Cons!8445 (h!9301 (_ BitVec 64)) (t!14391 List!8449)) )
))
(declare-fun arrayNoDuplicates!0 (array!29320 (_ BitVec 32) List!8449) Bool)

(assert (=> b!465566 (= res!278321 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8446))))

(declare-fun b!465567 () Bool)

(declare-fun e!272103 () Bool)

(assert (=> b!465567 (= e!272105 (not e!272103))))

(declare-fun res!278323 () Bool)

(assert (=> b!465567 (=> res!278323 e!272103)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465567 (= res!278323 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!18131 0))(
  ( (V!18132 (val!6429 Int)) )
))
(declare-datatypes ((tuple2!8360 0))(
  ( (tuple2!8361 (_1!4191 (_ BitVec 64)) (_2!4191 V!18131)) )
))
(declare-datatypes ((List!8450 0))(
  ( (Nil!8447) (Cons!8446 (h!9302 tuple2!8360) (t!14392 List!8450)) )
))
(declare-datatypes ((ListLongMap!7275 0))(
  ( (ListLongMap!7276 (toList!3653 List!8450)) )
))
(declare-fun lt!210290 () ListLongMap!7275)

(declare-fun lt!210289 () ListLongMap!7275)

(assert (=> b!465567 (= lt!210290 lt!210289)))

(declare-fun minValueBefore!38 () V!18131)

(declare-fun zeroValue!794 () V!18131)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13524 0))(
  ( (Unit!13525) )
))
(declare-fun lt!210288 () Unit!13524)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6041 0))(
  ( (ValueCellFull!6041 (v!8717 V!18131)) (EmptyCell!6041) )
))
(declare-datatypes ((array!29322 0))(
  ( (array!29323 (arr!14090 (Array (_ BitVec 32) ValueCell!6041)) (size!14442 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29322)

(declare-fun minValueAfter!38 () V!18131)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!40 (array!29320 array!29322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18131 V!18131 V!18131 V!18131 (_ BitVec 32) Int) Unit!13524)

(assert (=> b!465567 (= lt!210288 (lemmaNoChangeToArrayThenSameMapNoExtras!40 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1880 (array!29320 array!29322 (_ BitVec 32) (_ BitVec 32) V!18131 V!18131 (_ BitVec 32) Int) ListLongMap!7275)

(assert (=> b!465567 (= lt!210289 (getCurrentListMapNoExtraKeys!1880 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465567 (= lt!210290 (getCurrentListMapNoExtraKeys!1880 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465568 () Bool)

(declare-fun e!272108 () Bool)

(declare-fun mapRes!20836 () Bool)

(assert (=> b!465568 (= e!272108 (and e!272107 mapRes!20836))))

(declare-fun condMapEmpty!20836 () Bool)

(declare-fun mapDefault!20836 () ValueCell!6041)

(assert (=> b!465568 (= condMapEmpty!20836 (= (arr!14090 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6041)) mapDefault!20836)))))

(declare-fun b!465569 () Bool)

(assert (=> b!465569 (= e!272103 true)))

(declare-fun lt!210292 () ListLongMap!7275)

(declare-fun getCurrentListMap!2105 (array!29320 array!29322 (_ BitVec 32) (_ BitVec 32) V!18131 V!18131 (_ BitVec 32) Int) ListLongMap!7275)

(assert (=> b!465569 (= lt!210292 (getCurrentListMap!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210291 () ListLongMap!7275)

(declare-fun +!1654 (ListLongMap!7275 tuple2!8360) ListLongMap!7275)

(assert (=> b!465569 (= lt!210291 (+!1654 (getCurrentListMap!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8361 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465571 () Bool)

(declare-fun res!278324 () Bool)

(assert (=> b!465571 (=> (not res!278324) (not e!272105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29320 (_ BitVec 32)) Bool)

(assert (=> b!465571 (= res!278324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465572 () Bool)

(declare-fun e!272106 () Bool)

(assert (=> b!465572 (= e!272106 tp_is_empty!12769)))

(declare-fun mapIsEmpty!20836 () Bool)

(assert (=> mapIsEmpty!20836 mapRes!20836))

(declare-fun mapNonEmpty!20836 () Bool)

(declare-fun tp!40027 () Bool)

(assert (=> mapNonEmpty!20836 (= mapRes!20836 (and tp!40027 e!272106))))

(declare-fun mapValue!20836 () ValueCell!6041)

(declare-fun mapKey!20836 () (_ BitVec 32))

(declare-fun mapRest!20836 () (Array (_ BitVec 32) ValueCell!6041))

(assert (=> mapNonEmpty!20836 (= (arr!14090 _values!833) (store mapRest!20836 mapKey!20836 mapValue!20836))))

(declare-fun b!465570 () Bool)

(declare-fun res!278325 () Bool)

(assert (=> b!465570 (=> (not res!278325) (not e!272105))))

(assert (=> b!465570 (= res!278325 (and (= (size!14442 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14441 _keys!1025) (size!14442 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!278322 () Bool)

(assert (=> start!41688 (=> (not res!278322) (not e!272105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41688 (= res!278322 (validMask!0 mask!1365))))

(assert (=> start!41688 e!272105))

(assert (=> start!41688 tp_is_empty!12769))

(assert (=> start!41688 tp!40026))

(assert (=> start!41688 true))

(declare-fun array_inv!10256 (array!29320) Bool)

(assert (=> start!41688 (array_inv!10256 _keys!1025)))

(declare-fun array_inv!10257 (array!29322) Bool)

(assert (=> start!41688 (and (array_inv!10257 _values!833) e!272108)))

(assert (= (and start!41688 res!278322) b!465570))

(assert (= (and b!465570 res!278325) b!465571))

(assert (= (and b!465571 res!278324) b!465566))

(assert (= (and b!465566 res!278321) b!465567))

(assert (= (and b!465567 (not res!278323)) b!465569))

(assert (= (and b!465568 condMapEmpty!20836) mapIsEmpty!20836))

(assert (= (and b!465568 (not condMapEmpty!20836)) mapNonEmpty!20836))

(get-info :version)

(assert (= (and mapNonEmpty!20836 ((_ is ValueCellFull!6041) mapValue!20836)) b!465572))

(assert (= (and b!465568 ((_ is ValueCellFull!6041) mapDefault!20836)) b!465565))

(assert (= start!41688 b!465568))

(declare-fun m!448039 () Bool)

(assert (=> mapNonEmpty!20836 m!448039))

(declare-fun m!448041 () Bool)

(assert (=> b!465569 m!448041))

(declare-fun m!448043 () Bool)

(assert (=> b!465569 m!448043))

(assert (=> b!465569 m!448043))

(declare-fun m!448045 () Bool)

(assert (=> b!465569 m!448045))

(declare-fun m!448047 () Bool)

(assert (=> b!465567 m!448047))

(declare-fun m!448049 () Bool)

(assert (=> b!465567 m!448049))

(declare-fun m!448051 () Bool)

(assert (=> b!465567 m!448051))

(declare-fun m!448053 () Bool)

(assert (=> b!465571 m!448053))

(declare-fun m!448055 () Bool)

(assert (=> b!465566 m!448055))

(declare-fun m!448057 () Bool)

(assert (=> start!41688 m!448057))

(declare-fun m!448059 () Bool)

(assert (=> start!41688 m!448059))

(declare-fun m!448061 () Bool)

(assert (=> start!41688 m!448061))

(check-sat (not b!465567) b_and!19707 (not b!465571) tp_is_empty!12769 (not start!41688) (not b_next!11341) (not b!465569) (not b!465566) (not mapNonEmpty!20836))
(check-sat b_and!19707 (not b_next!11341))
