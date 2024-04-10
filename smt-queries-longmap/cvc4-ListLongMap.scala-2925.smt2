; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41724 () Bool)

(assert start!41724)

(declare-fun b_free!11363 () Bool)

(declare-fun b_next!11363 () Bool)

(assert (=> start!41724 (= b_free!11363 (not b_next!11363))))

(declare-fun tp!40093 () Bool)

(declare-fun b_and!19719 () Bool)

(assert (=> start!41724 (= tp!40093 b_and!19719)))

(declare-fun b!465890 () Bool)

(declare-fun e!272344 () Bool)

(assert (=> b!465890 (= e!272344 true)))

(declare-datatypes ((V!18159 0))(
  ( (V!18160 (val!6440 Int)) )
))
(declare-fun zeroValue!794 () V!18159)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8436 0))(
  ( (tuple2!8437 (_1!4229 (_ BitVec 64)) (_2!4229 V!18159)) )
))
(declare-datatypes ((List!8530 0))(
  ( (Nil!8527) (Cons!8526 (h!9382 tuple2!8436) (t!14480 List!8530)) )
))
(declare-datatypes ((ListLongMap!7349 0))(
  ( (ListLongMap!7350 (toList!3690 List!8530)) )
))
(declare-fun lt!210441 () ListLongMap!7349)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29363 0))(
  ( (array!29364 (arr!14111 (Array (_ BitVec 32) (_ BitVec 64))) (size!14463 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29363)

(declare-datatypes ((ValueCell!6052 0))(
  ( (ValueCellFull!6052 (v!8727 V!18159)) (EmptyCell!6052) )
))
(declare-datatypes ((array!29365 0))(
  ( (array!29366 (arr!14112 (Array (_ BitVec 32) ValueCell!6052)) (size!14464 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29365)

(declare-fun minValueAfter!38 () V!18159)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2143 (array!29363 array!29365 (_ BitVec 32) (_ BitVec 32) V!18159 V!18159 (_ BitVec 32) Int) ListLongMap!7349)

(assert (=> b!465890 (= lt!210441 (getCurrentListMap!2143 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18159)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!210443 () ListLongMap!7349)

(declare-fun +!1649 (ListLongMap!7349 tuple2!8436) ListLongMap!7349)

(assert (=> b!465890 (= lt!210443 (+!1649 (getCurrentListMap!2143 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8437 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465891 () Bool)

(declare-fun e!272345 () Bool)

(declare-fun tp_is_empty!12791 () Bool)

(assert (=> b!465891 (= e!272345 tp_is_empty!12791)))

(declare-fun b!465892 () Bool)

(declare-fun e!272340 () Bool)

(assert (=> b!465892 (= e!272340 (not e!272344))))

(declare-fun res!278494 () Bool)

(assert (=> b!465892 (=> res!278494 e!272344)))

(assert (=> b!465892 (= res!278494 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210445 () ListLongMap!7349)

(declare-fun lt!210442 () ListLongMap!7349)

(assert (=> b!465892 (= lt!210445 lt!210442)))

(declare-datatypes ((Unit!13548 0))(
  ( (Unit!13549) )
))
(declare-fun lt!210444 () Unit!13548)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!50 (array!29363 array!29365 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18159 V!18159 V!18159 V!18159 (_ BitVec 32) Int) Unit!13548)

(assert (=> b!465892 (= lt!210444 (lemmaNoChangeToArrayThenSameMapNoExtras!50 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1870 (array!29363 array!29365 (_ BitVec 32) (_ BitVec 32) V!18159 V!18159 (_ BitVec 32) Int) ListLongMap!7349)

(assert (=> b!465892 (= lt!210442 (getCurrentListMapNoExtraKeys!1870 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465892 (= lt!210445 (getCurrentListMapNoExtraKeys!1870 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465893 () Bool)

(declare-fun res!278496 () Bool)

(assert (=> b!465893 (=> (not res!278496) (not e!272340))))

(assert (=> b!465893 (= res!278496 (and (= (size!14464 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14463 _keys!1025) (size!14464 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20869 () Bool)

(declare-fun mapRes!20869 () Bool)

(assert (=> mapIsEmpty!20869 mapRes!20869))

(declare-fun b!465894 () Bool)

(declare-fun res!278495 () Bool)

(assert (=> b!465894 (=> (not res!278495) (not e!272340))))

(declare-datatypes ((List!8531 0))(
  ( (Nil!8528) (Cons!8527 (h!9383 (_ BitVec 64)) (t!14481 List!8531)) )
))
(declare-fun arrayNoDuplicates!0 (array!29363 (_ BitVec 32) List!8531) Bool)

(assert (=> b!465894 (= res!278495 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8528))))

(declare-fun mapNonEmpty!20869 () Bool)

(declare-fun tp!40092 () Bool)

(assert (=> mapNonEmpty!20869 (= mapRes!20869 (and tp!40092 e!272345))))

(declare-fun mapRest!20869 () (Array (_ BitVec 32) ValueCell!6052))

(declare-fun mapKey!20869 () (_ BitVec 32))

(declare-fun mapValue!20869 () ValueCell!6052)

(assert (=> mapNonEmpty!20869 (= (arr!14112 _values!833) (store mapRest!20869 mapKey!20869 mapValue!20869))))

(declare-fun b!465896 () Bool)

(declare-fun res!278493 () Bool)

(assert (=> b!465896 (=> (not res!278493) (not e!272340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29363 (_ BitVec 32)) Bool)

(assert (=> b!465896 (= res!278493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465897 () Bool)

(declare-fun e!272343 () Bool)

(assert (=> b!465897 (= e!272343 tp_is_empty!12791)))

(declare-fun res!278497 () Bool)

(assert (=> start!41724 (=> (not res!278497) (not e!272340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41724 (= res!278497 (validMask!0 mask!1365))))

(assert (=> start!41724 e!272340))

(assert (=> start!41724 tp_is_empty!12791))

(assert (=> start!41724 tp!40093))

(assert (=> start!41724 true))

(declare-fun array_inv!10190 (array!29363) Bool)

(assert (=> start!41724 (array_inv!10190 _keys!1025)))

(declare-fun e!272342 () Bool)

(declare-fun array_inv!10191 (array!29365) Bool)

(assert (=> start!41724 (and (array_inv!10191 _values!833) e!272342)))

(declare-fun b!465895 () Bool)

(assert (=> b!465895 (= e!272342 (and e!272343 mapRes!20869))))

(declare-fun condMapEmpty!20869 () Bool)

(declare-fun mapDefault!20869 () ValueCell!6052)

