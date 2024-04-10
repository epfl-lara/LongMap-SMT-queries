; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105664 () Bool)

(assert start!105664)

(declare-fun b_free!27265 () Bool)

(declare-fun b_next!27265 () Bool)

(assert (=> start!105664 (= b_free!27265 (not b_next!27265))))

(declare-fun tp!95318 () Bool)

(declare-fun b_and!45139 () Bool)

(assert (=> start!105664 (= tp!95318 b_and!45139)))

(declare-fun b!1258657 () Bool)

(declare-fun e!715897 () Bool)

(declare-fun e!715901 () Bool)

(assert (=> b!1258657 (= e!715897 (not e!715901))))

(declare-fun res!838905 () Bool)

(assert (=> b!1258657 (=> res!838905 e!715901)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258657 (= res!838905 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48255 0))(
  ( (V!48256 (val!16146 Int)) )
))
(declare-datatypes ((tuple2!20860 0))(
  ( (tuple2!20861 (_1!10441 (_ BitVec 64)) (_2!10441 V!48255)) )
))
(declare-datatypes ((List!28072 0))(
  ( (Nil!28069) (Cons!28068 (h!29277 tuple2!20860) (t!41565 List!28072)) )
))
(declare-datatypes ((ListLongMap!18733 0))(
  ( (ListLongMap!18734 (toList!9382 List!28072)) )
))
(declare-fun lt!569313 () ListLongMap!18733)

(declare-fun lt!569314 () ListLongMap!18733)

(assert (=> b!1258657 (= lt!569313 lt!569314)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48255)

(declare-datatypes ((Unit!41946 0))(
  ( (Unit!41947) )
))
(declare-fun lt!569312 () Unit!41946)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48255)

(declare-datatypes ((array!81954 0))(
  ( (array!81955 (arr!39533 (Array (_ BitVec 32) (_ BitVec 64))) (size!40069 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81954)

(declare-datatypes ((ValueCell!15320 0))(
  ( (ValueCellFull!15320 (v!18848 V!48255)) (EmptyCell!15320) )
))
(declare-datatypes ((array!81956 0))(
  ( (array!81957 (arr!39534 (Array (_ BitVec 32) ValueCell!15320)) (size!40070 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81956)

(declare-fun minValueBefore!43 () V!48255)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1123 (array!81954 array!81956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48255 V!48255 V!48255 V!48255 (_ BitVec 32) Int) Unit!41946)

(assert (=> b!1258657 (= lt!569312 (lemmaNoChangeToArrayThenSameMapNoExtras!1123 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5759 (array!81954 array!81956 (_ BitVec 32) (_ BitVec 32) V!48255 V!48255 (_ BitVec 32) Int) ListLongMap!18733)

(assert (=> b!1258657 (= lt!569314 (getCurrentListMapNoExtraKeys!5759 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258657 (= lt!569313 (getCurrentListMapNoExtraKeys!5759 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!838906 () Bool)

(assert (=> start!105664 (=> (not res!838906) (not e!715897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105664 (= res!838906 (validMask!0 mask!1466))))

(assert (=> start!105664 e!715897))

(assert (=> start!105664 true))

(assert (=> start!105664 tp!95318))

(declare-fun tp_is_empty!32167 () Bool)

(assert (=> start!105664 tp_is_empty!32167))

(declare-fun array_inv!30103 (array!81954) Bool)

(assert (=> start!105664 (array_inv!30103 _keys!1118)))

(declare-fun e!715898 () Bool)

(declare-fun array_inv!30104 (array!81956) Bool)

(assert (=> start!105664 (and (array_inv!30104 _values!914) e!715898)))

(declare-fun b!1258658 () Bool)

(declare-fun e!715899 () Bool)

(assert (=> b!1258658 (= e!715899 tp_is_empty!32167)))

(declare-fun b!1258659 () Bool)

(declare-fun mapRes!50044 () Bool)

(assert (=> b!1258659 (= e!715898 (and e!715899 mapRes!50044))))

(declare-fun condMapEmpty!50044 () Bool)

(declare-fun mapDefault!50044 () ValueCell!15320)

