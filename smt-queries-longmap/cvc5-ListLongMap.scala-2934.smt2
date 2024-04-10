; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41792 () Bool)

(assert start!41792)

(declare-fun b_free!11413 () Bool)

(declare-fun b_next!11413 () Bool)

(assert (=> start!41792 (= b_free!11413 (not b_next!11413))))

(declare-fun tp!40245 () Bool)

(declare-fun b_and!19781 () Bool)

(assert (=> start!41792 (= tp!40245 b_and!19781)))

(declare-fun b!466674 () Bool)

(declare-fun e!272903 () Bool)

(declare-fun e!272900 () Bool)

(assert (=> b!466674 (= e!272903 (not e!272900))))

(declare-fun res!278950 () Bool)

(assert (=> b!466674 (=> res!278950 e!272900)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466674 (= res!278950 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!18227 0))(
  ( (V!18228 (val!6465 Int)) )
))
(declare-datatypes ((tuple2!8480 0))(
  ( (tuple2!8481 (_1!4251 (_ BitVec 64)) (_2!4251 V!18227)) )
))
(declare-datatypes ((List!8570 0))(
  ( (Nil!8567) (Cons!8566 (h!9422 tuple2!8480) (t!14522 List!8570)) )
))
(declare-datatypes ((ListLongMap!7393 0))(
  ( (ListLongMap!7394 (toList!3712 List!8570)) )
))
(declare-fun lt!210942 () ListLongMap!7393)

(declare-fun lt!210940 () ListLongMap!7393)

(assert (=> b!466674 (= lt!210942 lt!210940)))

(declare-fun minValueBefore!38 () V!18227)

(declare-fun zeroValue!794 () V!18227)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13586 0))(
  ( (Unit!13587) )
))
(declare-fun lt!210939 () Unit!13586)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29463 0))(
  ( (array!29464 (arr!14160 (Array (_ BitVec 32) (_ BitVec 64))) (size!14512 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29463)

(declare-datatypes ((ValueCell!6077 0))(
  ( (ValueCellFull!6077 (v!8753 V!18227)) (EmptyCell!6077) )
))
(declare-datatypes ((array!29465 0))(
  ( (array!29466 (arr!14161 (Array (_ BitVec 32) ValueCell!6077)) (size!14513 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29465)

(declare-fun minValueAfter!38 () V!18227)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!68 (array!29463 array!29465 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18227 V!18227 V!18227 V!18227 (_ BitVec 32) Int) Unit!13586)

(assert (=> b!466674 (= lt!210939 (lemmaNoChangeToArrayThenSameMapNoExtras!68 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1888 (array!29463 array!29465 (_ BitVec 32) (_ BitVec 32) V!18227 V!18227 (_ BitVec 32) Int) ListLongMap!7393)

(assert (=> b!466674 (= lt!210940 (getCurrentListMapNoExtraKeys!1888 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466674 (= lt!210942 (getCurrentListMapNoExtraKeys!1888 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466675 () Bool)

(declare-fun res!278953 () Bool)

(assert (=> b!466675 (=> (not res!278953) (not e!272903))))

(declare-datatypes ((List!8571 0))(
  ( (Nil!8568) (Cons!8567 (h!9423 (_ BitVec 64)) (t!14523 List!8571)) )
))
(declare-fun arrayNoDuplicates!0 (array!29463 (_ BitVec 32) List!8571) Bool)

(assert (=> b!466675 (= res!278953 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8568))))

(declare-fun res!278954 () Bool)

(assert (=> start!41792 (=> (not res!278954) (not e!272903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41792 (= res!278954 (validMask!0 mask!1365))))

(assert (=> start!41792 e!272903))

(declare-fun tp_is_empty!12841 () Bool)

(assert (=> start!41792 tp_is_empty!12841))

(assert (=> start!41792 tp!40245))

(assert (=> start!41792 true))

(declare-fun array_inv!10224 (array!29463) Bool)

(assert (=> start!41792 (array_inv!10224 _keys!1025)))

(declare-fun e!272904 () Bool)

(declare-fun array_inv!10225 (array!29465) Bool)

(assert (=> start!41792 (and (array_inv!10225 _values!833) e!272904)))

(declare-fun b!466676 () Bool)

(assert (=> b!466676 (= e!272900 true)))

(declare-fun lt!210938 () ListLongMap!7393)

(declare-fun getCurrentListMap!2161 (array!29463 array!29465 (_ BitVec 32) (_ BitVec 32) V!18227 V!18227 (_ BitVec 32) Int) ListLongMap!7393)

(assert (=> b!466676 (= lt!210938 (getCurrentListMap!2161 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210941 () ListLongMap!7393)

(declare-fun +!1667 (ListLongMap!7393 tuple2!8480) ListLongMap!7393)

(assert (=> b!466676 (= lt!210941 (+!1667 (getCurrentListMap!2161 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8481 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466677 () Bool)

(declare-fun e!272905 () Bool)

(declare-fun mapRes!20947 () Bool)

(assert (=> b!466677 (= e!272904 (and e!272905 mapRes!20947))))

(declare-fun condMapEmpty!20947 () Bool)

(declare-fun mapDefault!20947 () ValueCell!6077)

