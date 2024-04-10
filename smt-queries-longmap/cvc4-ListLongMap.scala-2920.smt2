; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41694 () Bool)

(assert start!41694)

(declare-fun b_free!11333 () Bool)

(declare-fun b_next!11333 () Bool)

(assert (=> start!41694 (= b_free!11333 (not b_next!11333))))

(declare-fun tp!40003 () Bool)

(declare-fun b_and!19689 () Bool)

(assert (=> start!41694 (= tp!40003 b_and!19689)))

(declare-fun b!465530 () Bool)

(declare-fun res!278269 () Bool)

(declare-fun e!272072 () Bool)

(assert (=> b!465530 (=> (not res!278269) (not e!272072))))

(declare-datatypes ((array!29303 0))(
  ( (array!29304 (arr!14081 (Array (_ BitVec 32) (_ BitVec 64))) (size!14433 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29303)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29303 (_ BitVec 32)) Bool)

(assert (=> b!465530 (= res!278269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!278271 () Bool)

(assert (=> start!41694 (=> (not res!278271) (not e!272072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41694 (= res!278271 (validMask!0 mask!1365))))

(assert (=> start!41694 e!272072))

(declare-fun tp_is_empty!12761 () Bool)

(assert (=> start!41694 tp_is_empty!12761))

(assert (=> start!41694 tp!40003))

(assert (=> start!41694 true))

(declare-fun array_inv!10174 (array!29303) Bool)

(assert (=> start!41694 (array_inv!10174 _keys!1025)))

(declare-datatypes ((V!18119 0))(
  ( (V!18120 (val!6425 Int)) )
))
(declare-datatypes ((ValueCell!6037 0))(
  ( (ValueCellFull!6037 (v!8712 V!18119)) (EmptyCell!6037) )
))
(declare-datatypes ((array!29305 0))(
  ( (array!29306 (arr!14082 (Array (_ BitVec 32) ValueCell!6037)) (size!14434 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29305)

(declare-fun e!272075 () Bool)

(declare-fun array_inv!10175 (array!29305) Bool)

(assert (=> start!41694 (and (array_inv!10175 _values!833) e!272075)))

(declare-fun b!465531 () Bool)

(declare-fun e!272073 () Bool)

(assert (=> b!465531 (= e!272073 tp_is_empty!12761)))

(declare-fun b!465532 () Bool)

(declare-fun e!272070 () Bool)

(assert (=> b!465532 (= e!272072 (not e!272070))))

(declare-fun res!278270 () Bool)

(assert (=> b!465532 (=> res!278270 e!272070)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465532 (= res!278270 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8416 0))(
  ( (tuple2!8417 (_1!4219 (_ BitVec 64)) (_2!4219 V!18119)) )
))
(declare-datatypes ((List!8509 0))(
  ( (Nil!8506) (Cons!8505 (h!9361 tuple2!8416) (t!14459 List!8509)) )
))
(declare-datatypes ((ListLongMap!7329 0))(
  ( (ListLongMap!7330 (toList!3680 List!8509)) )
))
(declare-fun lt!210216 () ListLongMap!7329)

(declare-fun lt!210217 () ListLongMap!7329)

(assert (=> b!465532 (= lt!210216 lt!210217)))

(declare-datatypes ((Unit!13528 0))(
  ( (Unit!13529) )
))
(declare-fun lt!210219 () Unit!13528)

(declare-fun minValueBefore!38 () V!18119)

(declare-fun zeroValue!794 () V!18119)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18119)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!40 (array!29303 array!29305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18119 V!18119 V!18119 V!18119 (_ BitVec 32) Int) Unit!13528)

(assert (=> b!465532 (= lt!210219 (lemmaNoChangeToArrayThenSameMapNoExtras!40 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1860 (array!29303 array!29305 (_ BitVec 32) (_ BitVec 32) V!18119 V!18119 (_ BitVec 32) Int) ListLongMap!7329)

(assert (=> b!465532 (= lt!210217 (getCurrentListMapNoExtraKeys!1860 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465532 (= lt!210216 (getCurrentListMapNoExtraKeys!1860 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465533 () Bool)

(assert (=> b!465533 (= e!272070 true)))

(declare-fun lt!210218 () ListLongMap!7329)

(declare-fun getCurrentListMap!2135 (array!29303 array!29305 (_ BitVec 32) (_ BitVec 32) V!18119 V!18119 (_ BitVec 32) Int) ListLongMap!7329)

(assert (=> b!465533 (= lt!210218 (getCurrentListMap!2135 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210220 () ListLongMap!7329)

(declare-fun +!1641 (ListLongMap!7329 tuple2!8416) ListLongMap!7329)

(assert (=> b!465533 (= lt!210220 (+!1641 (getCurrentListMap!2135 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8417 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun mapIsEmpty!20824 () Bool)

(declare-fun mapRes!20824 () Bool)

(assert (=> mapIsEmpty!20824 mapRes!20824))

(declare-fun mapNonEmpty!20824 () Bool)

(declare-fun tp!40002 () Bool)

(declare-fun e!272074 () Bool)

(assert (=> mapNonEmpty!20824 (= mapRes!20824 (and tp!40002 e!272074))))

(declare-fun mapKey!20824 () (_ BitVec 32))

(declare-fun mapRest!20824 () (Array (_ BitVec 32) ValueCell!6037))

(declare-fun mapValue!20824 () ValueCell!6037)

(assert (=> mapNonEmpty!20824 (= (arr!14082 _values!833) (store mapRest!20824 mapKey!20824 mapValue!20824))))

(declare-fun b!465534 () Bool)

(declare-fun res!278268 () Bool)

(assert (=> b!465534 (=> (not res!278268) (not e!272072))))

(declare-datatypes ((List!8510 0))(
  ( (Nil!8507) (Cons!8506 (h!9362 (_ BitVec 64)) (t!14460 List!8510)) )
))
(declare-fun arrayNoDuplicates!0 (array!29303 (_ BitVec 32) List!8510) Bool)

(assert (=> b!465534 (= res!278268 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8507))))

(declare-fun b!465535 () Bool)

(assert (=> b!465535 (= e!272075 (and e!272073 mapRes!20824))))

(declare-fun condMapEmpty!20824 () Bool)

(declare-fun mapDefault!20824 () ValueCell!6037)

