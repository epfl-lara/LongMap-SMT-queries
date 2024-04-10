; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41696 () Bool)

(assert start!41696)

(declare-fun b_free!11335 () Bool)

(declare-fun b_next!11335 () Bool)

(assert (=> start!41696 (= b_free!11335 (not b_next!11335))))

(declare-fun tp!40009 () Bool)

(declare-fun b_and!19691 () Bool)

(assert (=> start!41696 (= tp!40009 b_and!19691)))

(declare-fun b!465554 () Bool)

(declare-fun res!278287 () Bool)

(declare-fun e!272092 () Bool)

(assert (=> b!465554 (=> (not res!278287) (not e!272092))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29307 0))(
  ( (array!29308 (arr!14083 (Array (_ BitVec 32) (_ BitVec 64))) (size!14435 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29307)

(declare-datatypes ((V!18123 0))(
  ( (V!18124 (val!6426 Int)) )
))
(declare-datatypes ((ValueCell!6038 0))(
  ( (ValueCellFull!6038 (v!8713 V!18123)) (EmptyCell!6038) )
))
(declare-datatypes ((array!29309 0))(
  ( (array!29310 (arr!14084 (Array (_ BitVec 32) ValueCell!6038)) (size!14436 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29309)

(assert (=> b!465554 (= res!278287 (and (= (size!14436 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14435 _keys!1025) (size!14436 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20827 () Bool)

(declare-fun mapRes!20827 () Bool)

(assert (=> mapIsEmpty!20827 mapRes!20827))

(declare-fun b!465555 () Bool)

(declare-fun e!272088 () Bool)

(assert (=> b!465555 (= e!272092 (not e!272088))))

(declare-fun res!278286 () Bool)

(assert (=> b!465555 (=> res!278286 e!272088)))

(assert (=> b!465555 (= res!278286 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8418 0))(
  ( (tuple2!8419 (_1!4220 (_ BitVec 64)) (_2!4220 V!18123)) )
))
(declare-datatypes ((List!8511 0))(
  ( (Nil!8508) (Cons!8507 (h!9363 tuple2!8418) (t!14461 List!8511)) )
))
(declare-datatypes ((ListLongMap!7331 0))(
  ( (ListLongMap!7332 (toList!3681 List!8511)) )
))
(declare-fun lt!210234 () ListLongMap!7331)

(declare-fun lt!210233 () ListLongMap!7331)

(assert (=> b!465555 (= lt!210234 lt!210233)))

(declare-datatypes ((Unit!13530 0))(
  ( (Unit!13531) )
))
(declare-fun lt!210232 () Unit!13530)

(declare-fun minValueBefore!38 () V!18123)

(declare-fun zeroValue!794 () V!18123)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18123)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!41 (array!29307 array!29309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18123 V!18123 V!18123 V!18123 (_ BitVec 32) Int) Unit!13530)

(assert (=> b!465555 (= lt!210232 (lemmaNoChangeToArrayThenSameMapNoExtras!41 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1861 (array!29307 array!29309 (_ BitVec 32) (_ BitVec 32) V!18123 V!18123 (_ BitVec 32) Int) ListLongMap!7331)

(assert (=> b!465555 (= lt!210233 (getCurrentListMapNoExtraKeys!1861 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465555 (= lt!210234 (getCurrentListMapNoExtraKeys!1861 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20827 () Bool)

(declare-fun tp!40008 () Bool)

(declare-fun e!272093 () Bool)

(assert (=> mapNonEmpty!20827 (= mapRes!20827 (and tp!40008 e!272093))))

(declare-fun mapKey!20827 () (_ BitVec 32))

(declare-fun mapValue!20827 () ValueCell!6038)

(declare-fun mapRest!20827 () (Array (_ BitVec 32) ValueCell!6038))

(assert (=> mapNonEmpty!20827 (= (arr!14084 _values!833) (store mapRest!20827 mapKey!20827 mapValue!20827))))

(declare-fun b!465556 () Bool)

(declare-fun e!272091 () Bool)

(declare-fun tp_is_empty!12763 () Bool)

(assert (=> b!465556 (= e!272091 tp_is_empty!12763)))

(declare-fun b!465557 () Bool)

(assert (=> b!465557 (= e!272088 true)))

(declare-fun lt!210231 () ListLongMap!7331)

(declare-fun getCurrentListMap!2136 (array!29307 array!29309 (_ BitVec 32) (_ BitVec 32) V!18123 V!18123 (_ BitVec 32) Int) ListLongMap!7331)

(assert (=> b!465557 (= lt!210231 (getCurrentListMap!2136 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210235 () ListLongMap!7331)

(declare-fun +!1642 (ListLongMap!7331 tuple2!8418) ListLongMap!7331)

(assert (=> b!465557 (= lt!210235 (+!1642 (getCurrentListMap!2136 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8419 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465558 () Bool)

(declare-fun res!278285 () Bool)

(assert (=> b!465558 (=> (not res!278285) (not e!272092))))

(declare-datatypes ((List!8512 0))(
  ( (Nil!8509) (Cons!8508 (h!9364 (_ BitVec 64)) (t!14462 List!8512)) )
))
(declare-fun arrayNoDuplicates!0 (array!29307 (_ BitVec 32) List!8512) Bool)

(assert (=> b!465558 (= res!278285 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8509))))

(declare-fun b!465559 () Bool)

(assert (=> b!465559 (= e!272093 tp_is_empty!12763)))

(declare-fun b!465560 () Bool)

(declare-fun e!272089 () Bool)

(assert (=> b!465560 (= e!272089 (and e!272091 mapRes!20827))))

(declare-fun condMapEmpty!20827 () Bool)

(declare-fun mapDefault!20827 () ValueCell!6038)

