; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105662 () Bool)

(assert start!105662)

(declare-fun b_free!27263 () Bool)

(declare-fun b_next!27263 () Bool)

(assert (=> start!105662 (= b_free!27263 (not b_next!27263))))

(declare-fun tp!95311 () Bool)

(declare-fun b_and!45137 () Bool)

(assert (=> start!105662 (= tp!95311 b_and!45137)))

(declare-fun mapIsEmpty!50041 () Bool)

(declare-fun mapRes!50041 () Bool)

(assert (=> mapIsEmpty!50041 mapRes!50041))

(declare-fun b!1258633 () Bool)

(declare-fun e!715879 () Bool)

(declare-fun tp_is_empty!32165 () Bool)

(assert (=> b!1258633 (= e!715879 tp_is_empty!32165)))

(declare-fun b!1258634 () Bool)

(declare-fun e!715880 () Bool)

(declare-fun e!715878 () Bool)

(assert (=> b!1258634 (= e!715880 (not e!715878))))

(declare-fun res!838889 () Bool)

(assert (=> b!1258634 (=> res!838889 e!715878)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258634 (= res!838889 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48251 0))(
  ( (V!48252 (val!16145 Int)) )
))
(declare-datatypes ((tuple2!20858 0))(
  ( (tuple2!20859 (_1!10440 (_ BitVec 64)) (_2!10440 V!48251)) )
))
(declare-datatypes ((List!28071 0))(
  ( (Nil!28068) (Cons!28067 (h!29276 tuple2!20858) (t!41564 List!28071)) )
))
(declare-datatypes ((ListLongMap!18731 0))(
  ( (ListLongMap!18732 (toList!9381 List!28071)) )
))
(declare-fun lt!569299 () ListLongMap!18731)

(declare-fun lt!569302 () ListLongMap!18731)

(assert (=> b!1258634 (= lt!569299 lt!569302)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48251)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48251)

(declare-datatypes ((array!81950 0))(
  ( (array!81951 (arr!39531 (Array (_ BitVec 32) (_ BitVec 64))) (size!40067 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81950)

(declare-fun minValueBefore!43 () V!48251)

(declare-datatypes ((Unit!41944 0))(
  ( (Unit!41945) )
))
(declare-fun lt!569300 () Unit!41944)

(declare-datatypes ((ValueCell!15319 0))(
  ( (ValueCellFull!15319 (v!18847 V!48251)) (EmptyCell!15319) )
))
(declare-datatypes ((array!81952 0))(
  ( (array!81953 (arr!39532 (Array (_ BitVec 32) ValueCell!15319)) (size!40068 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81952)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1122 (array!81950 array!81952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48251 V!48251 V!48251 V!48251 (_ BitVec 32) Int) Unit!41944)

(assert (=> b!1258634 (= lt!569300 (lemmaNoChangeToArrayThenSameMapNoExtras!1122 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5758 (array!81950 array!81952 (_ BitVec 32) (_ BitVec 32) V!48251 V!48251 (_ BitVec 32) Int) ListLongMap!18731)

(assert (=> b!1258634 (= lt!569302 (getCurrentListMapNoExtraKeys!5758 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258634 (= lt!569299 (getCurrentListMapNoExtraKeys!5758 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258635 () Bool)

(assert (=> b!1258635 (= e!715878 true)))

(declare-fun lt!569301 () ListLongMap!18731)

(declare-fun getCurrentListMap!4583 (array!81950 array!81952 (_ BitVec 32) (_ BitVec 32) V!48251 V!48251 (_ BitVec 32) Int) ListLongMap!18731)

(assert (=> b!1258635 (= lt!569301 (getCurrentListMap!4583 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258636 () Bool)

(declare-fun e!715881 () Bool)

(assert (=> b!1258636 (= e!715881 (and e!715879 mapRes!50041))))

(declare-fun condMapEmpty!50041 () Bool)

(declare-fun mapDefault!50041 () ValueCell!15319)

