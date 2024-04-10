; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105726 () Bool)

(assert start!105726)

(declare-fun b_free!27311 () Bool)

(declare-fun b_next!27311 () Bool)

(assert (=> start!105726 (= b_free!27311 (not b_next!27311))))

(declare-fun tp!95459 () Bool)

(declare-fun b_and!45195 () Bool)

(assert (=> start!105726 (= tp!95459 b_and!45195)))

(declare-fun b!1259419 () Bool)

(declare-fun res!839368 () Bool)

(declare-fun e!716468 () Bool)

(assert (=> b!1259419 (=> (not res!839368) (not e!716468))))

(declare-datatypes ((array!82044 0))(
  ( (array!82045 (arr!39577 (Array (_ BitVec 32) (_ BitVec 64))) (size!40113 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82044)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82044 (_ BitVec 32)) Bool)

(assert (=> b!1259419 (= res!839368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!839371 () Bool)

(assert (=> start!105726 (=> (not res!839371) (not e!716468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105726 (= res!839371 (validMask!0 mask!1466))))

(assert (=> start!105726 e!716468))

(assert (=> start!105726 true))

(assert (=> start!105726 tp!95459))

(declare-fun tp_is_empty!32213 () Bool)

(assert (=> start!105726 tp_is_empty!32213))

(declare-fun array_inv!30133 (array!82044) Bool)

(assert (=> start!105726 (array_inv!30133 _keys!1118)))

(declare-datatypes ((V!48315 0))(
  ( (V!48316 (val!16169 Int)) )
))
(declare-datatypes ((ValueCell!15343 0))(
  ( (ValueCellFull!15343 (v!18871 V!48315)) (EmptyCell!15343) )
))
(declare-datatypes ((array!82046 0))(
  ( (array!82047 (arr!39578 (Array (_ BitVec 32) ValueCell!15343)) (size!40114 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82046)

(declare-fun e!716466 () Bool)

(declare-fun array_inv!30134 (array!82046) Bool)

(assert (=> start!105726 (and (array_inv!30134 _values!914) e!716466)))

(declare-fun mapIsEmpty!50116 () Bool)

(declare-fun mapRes!50116 () Bool)

(assert (=> mapIsEmpty!50116 mapRes!50116))

(declare-fun b!1259420 () Bool)

(declare-fun e!716467 () Bool)

(assert (=> b!1259420 (= e!716467 true)))

(declare-datatypes ((tuple2!20900 0))(
  ( (tuple2!20901 (_1!10461 (_ BitVec 64)) (_2!10461 V!48315)) )
))
(declare-datatypes ((List!28108 0))(
  ( (Nil!28105) (Cons!28104 (h!29313 tuple2!20900) (t!41603 List!28108)) )
))
(declare-datatypes ((ListLongMap!18773 0))(
  ( (ListLongMap!18774 (toList!9402 List!28108)) )
))
(declare-fun lt!570052 () ListLongMap!18773)

(declare-fun lt!570056 () ListLongMap!18773)

(declare-fun -!2109 (ListLongMap!18773 (_ BitVec 64)) ListLongMap!18773)

(assert (=> b!1259420 (= lt!570052 (-!2109 lt!570056 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570048 () ListLongMap!18773)

(declare-fun lt!570049 () ListLongMap!18773)

(assert (=> b!1259420 (= (-!2109 lt!570048 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570049)))

(declare-datatypes ((Unit!41987 0))(
  ( (Unit!41988) )
))
(declare-fun lt!570050 () Unit!41987)

(declare-fun minValueBefore!43 () V!48315)

(declare-fun addThenRemoveForNewKeyIsSame!346 (ListLongMap!18773 (_ BitVec 64) V!48315) Unit!41987)

(assert (=> b!1259420 (= lt!570050 (addThenRemoveForNewKeyIsSame!346 lt!570049 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716470 () Bool)

(assert (=> b!1259420 e!716470))

(declare-fun res!839369 () Bool)

(assert (=> b!1259420 (=> (not res!839369) (not e!716470))))

(assert (=> b!1259420 (= res!839369 (= lt!570056 lt!570048))))

(declare-fun +!4207 (ListLongMap!18773 tuple2!20900) ListLongMap!18773)

(assert (=> b!1259420 (= lt!570048 (+!4207 lt!570049 (tuple2!20901 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570053 () ListLongMap!18773)

(declare-fun lt!570054 () tuple2!20900)

(assert (=> b!1259420 (= lt!570049 (+!4207 lt!570053 lt!570054))))

(declare-fun zeroValue!871 () V!48315)

(assert (=> b!1259420 (= lt!570054 (tuple2!20901 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!570047 () ListLongMap!18773)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48315)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4600 (array!82044 array!82046 (_ BitVec 32) (_ BitVec 32) V!48315 V!48315 (_ BitVec 32) Int) ListLongMap!18773)

(assert (=> b!1259420 (= lt!570047 (getCurrentListMap!4600 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259420 (= lt!570056 (getCurrentListMap!4600 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50116 () Bool)

(declare-fun tp!95458 () Bool)

(declare-fun e!716472 () Bool)

(assert (=> mapNonEmpty!50116 (= mapRes!50116 (and tp!95458 e!716472))))

(declare-fun mapRest!50116 () (Array (_ BitVec 32) ValueCell!15343))

(declare-fun mapValue!50116 () ValueCell!15343)

(declare-fun mapKey!50116 () (_ BitVec 32))

(assert (=> mapNonEmpty!50116 (= (arr!39578 _values!914) (store mapRest!50116 mapKey!50116 mapValue!50116))))

(declare-fun lt!570055 () ListLongMap!18773)

(declare-fun b!1259421 () Bool)

(assert (=> b!1259421 (= e!716470 (= lt!570047 (+!4207 lt!570055 lt!570054)))))

(declare-fun b!1259422 () Bool)

(assert (=> b!1259422 (= e!716468 (not e!716467))))

(declare-fun res!839373 () Bool)

(assert (=> b!1259422 (=> res!839373 e!716467)))

(assert (=> b!1259422 (= res!839373 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1259422 (= lt!570053 lt!570055)))

(declare-fun lt!570051 () Unit!41987)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1142 (array!82044 array!82046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48315 V!48315 V!48315 V!48315 (_ BitVec 32) Int) Unit!41987)

(assert (=> b!1259422 (= lt!570051 (lemmaNoChangeToArrayThenSameMapNoExtras!1142 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5778 (array!82044 array!82046 (_ BitVec 32) (_ BitVec 32) V!48315 V!48315 (_ BitVec 32) Int) ListLongMap!18773)

(assert (=> b!1259422 (= lt!570055 (getCurrentListMapNoExtraKeys!5778 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259422 (= lt!570053 (getCurrentListMapNoExtraKeys!5778 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259423 () Bool)

(assert (=> b!1259423 (= e!716472 tp_is_empty!32213)))

(declare-fun b!1259424 () Bool)

(declare-fun e!716469 () Bool)

(assert (=> b!1259424 (= e!716466 (and e!716469 mapRes!50116))))

(declare-fun condMapEmpty!50116 () Bool)

(declare-fun mapDefault!50116 () ValueCell!15343)

