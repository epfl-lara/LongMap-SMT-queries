; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105072 () Bool)

(assert start!105072)

(declare-fun b_free!26819 () Bool)

(declare-fun b_next!26819 () Bool)

(assert (=> start!105072 (= b_free!26819 (not b_next!26819))))

(declare-fun tp!93956 () Bool)

(declare-fun b_and!44615 () Bool)

(assert (=> start!105072 (= tp!93956 b_and!44615)))

(declare-fun b!1252221 () Bool)

(declare-fun e!711188 () Bool)

(assert (=> b!1252221 (= e!711188 (not true))))

(declare-datatypes ((V!47659 0))(
  ( (V!47660 (val!15923 Int)) )
))
(declare-datatypes ((tuple2!20538 0))(
  ( (tuple2!20539 (_1!10280 (_ BitVec 64)) (_2!10280 V!47659)) )
))
(declare-datatypes ((List!27770 0))(
  ( (Nil!27767) (Cons!27766 (h!28975 tuple2!20538) (t!41247 List!27770)) )
))
(declare-datatypes ((ListLongMap!18411 0))(
  ( (ListLongMap!18412 (toList!9221 List!27770)) )
))
(declare-fun lt!565230 () ListLongMap!18411)

(declare-fun lt!565229 () ListLongMap!18411)

(assert (=> b!1252221 (= lt!565230 lt!565229)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47659)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47659)

(declare-datatypes ((array!81102 0))(
  ( (array!81103 (arr!39115 (Array (_ BitVec 32) (_ BitVec 64))) (size!39651 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81102)

(declare-datatypes ((ValueCell!15097 0))(
  ( (ValueCellFull!15097 (v!18621 V!47659)) (EmptyCell!15097) )
))
(declare-datatypes ((array!81104 0))(
  ( (array!81105 (arr!39116 (Array (_ BitVec 32) ValueCell!15097)) (size!39652 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81104)

(declare-fun minValueBefore!43 () V!47659)

(declare-datatypes ((Unit!41631 0))(
  ( (Unit!41632) )
))
(declare-fun lt!565231 () Unit!41631)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!981 (array!81102 array!81104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47659 V!47659 V!47659 V!47659 (_ BitVec 32) Int) Unit!41631)

(assert (=> b!1252221 (= lt!565231 (lemmaNoChangeToArrayThenSameMapNoExtras!981 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5617 (array!81102 array!81104 (_ BitVec 32) (_ BitVec 32) V!47659 V!47659 (_ BitVec 32) Int) ListLongMap!18411)

(assert (=> b!1252221 (= lt!565229 (getCurrentListMapNoExtraKeys!5617 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252221 (= lt!565230 (getCurrentListMapNoExtraKeys!5617 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252222 () Bool)

(declare-fun e!711186 () Bool)

(declare-fun tp_is_empty!31721 () Bool)

(assert (=> b!1252222 (= e!711186 tp_is_empty!31721)))

(declare-fun b!1252223 () Bool)

(declare-fun e!711189 () Bool)

(assert (=> b!1252223 (= e!711189 tp_is_empty!31721)))

(declare-fun b!1252224 () Bool)

(declare-fun res!835122 () Bool)

(assert (=> b!1252224 (=> (not res!835122) (not e!711188))))

(declare-datatypes ((List!27771 0))(
  ( (Nil!27768) (Cons!27767 (h!28976 (_ BitVec 64)) (t!41248 List!27771)) )
))
(declare-fun arrayNoDuplicates!0 (array!81102 (_ BitVec 32) List!27771) Bool)

(assert (=> b!1252224 (= res!835122 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27768))))

(declare-fun b!1252225 () Bool)

(declare-fun e!711190 () Bool)

(declare-fun mapRes!49351 () Bool)

(assert (=> b!1252225 (= e!711190 (and e!711186 mapRes!49351))))

(declare-fun condMapEmpty!49351 () Bool)

(declare-fun mapDefault!49351 () ValueCell!15097)

