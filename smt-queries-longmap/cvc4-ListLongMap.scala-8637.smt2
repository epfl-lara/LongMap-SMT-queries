; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105128 () Bool)

(assert start!105128)

(declare-fun b_free!26861 () Bool)

(declare-fun b_next!26861 () Bool)

(assert (=> start!105128 (= b_free!26861 (not b_next!26861))))

(declare-fun tp!94084 () Bool)

(declare-fun b_and!44665 () Bool)

(assert (=> start!105128 (= tp!94084 b_and!44665)))

(declare-fun b!1252800 () Bool)

(declare-fun e!711611 () Bool)

(declare-fun e!711610 () Bool)

(assert (=> b!1252800 (= e!711611 (not e!711610))))

(declare-fun res!835458 () Bool)

(assert (=> b!1252800 (=> res!835458 e!711610)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252800 (= res!835458 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47715 0))(
  ( (V!47716 (val!15944 Int)) )
))
(declare-datatypes ((tuple2!20570 0))(
  ( (tuple2!20571 (_1!10296 (_ BitVec 64)) (_2!10296 V!47715)) )
))
(declare-datatypes ((List!27802 0))(
  ( (Nil!27799) (Cons!27798 (h!29007 tuple2!20570) (t!41281 List!27802)) )
))
(declare-datatypes ((ListLongMap!18443 0))(
  ( (ListLongMap!18444 (toList!9237 List!27802)) )
))
(declare-fun lt!565514 () ListLongMap!18443)

(declare-fun lt!565513 () ListLongMap!18443)

(assert (=> b!1252800 (= lt!565514 lt!565513)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47715)

(declare-datatypes ((Unit!41661 0))(
  ( (Unit!41662) )
))
(declare-fun lt!565512 () Unit!41661)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81188 0))(
  ( (array!81189 (arr!39157 (Array (_ BitVec 32) (_ BitVec 64))) (size!39693 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81188)

(declare-datatypes ((ValueCell!15118 0))(
  ( (ValueCellFull!15118 (v!18642 V!47715)) (EmptyCell!15118) )
))
(declare-datatypes ((array!81190 0))(
  ( (array!81191 (arr!39158 (Array (_ BitVec 32) ValueCell!15118)) (size!39694 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81190)

(declare-fun minValueBefore!43 () V!47715)

(declare-fun zeroValue!871 () V!47715)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!996 (array!81188 array!81190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47715 V!47715 V!47715 V!47715 (_ BitVec 32) Int) Unit!41661)

(assert (=> b!1252800 (= lt!565512 (lemmaNoChangeToArrayThenSameMapNoExtras!996 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5632 (array!81188 array!81190 (_ BitVec 32) (_ BitVec 32) V!47715 V!47715 (_ BitVec 32) Int) ListLongMap!18443)

(assert (=> b!1252800 (= lt!565513 (getCurrentListMapNoExtraKeys!5632 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252800 (= lt!565514 (getCurrentListMapNoExtraKeys!5632 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252801 () Bool)

(declare-fun e!711612 () Bool)

(declare-fun tp_is_empty!31763 () Bool)

(assert (=> b!1252801 (= e!711612 tp_is_empty!31763)))

(declare-fun mapIsEmpty!49417 () Bool)

(declare-fun mapRes!49417 () Bool)

(assert (=> mapIsEmpty!49417 mapRes!49417))

(declare-fun b!1252802 () Bool)

(declare-fun res!835460 () Bool)

(assert (=> b!1252802 (=> (not res!835460) (not e!711611))))

(declare-datatypes ((List!27803 0))(
  ( (Nil!27800) (Cons!27799 (h!29008 (_ BitVec 64)) (t!41282 List!27803)) )
))
(declare-fun arrayNoDuplicates!0 (array!81188 (_ BitVec 32) List!27803) Bool)

(assert (=> b!1252802 (= res!835460 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27800))))

(declare-fun mapNonEmpty!49417 () Bool)

(declare-fun tp!94085 () Bool)

(assert (=> mapNonEmpty!49417 (= mapRes!49417 (and tp!94085 e!711612))))

(declare-fun mapRest!49417 () (Array (_ BitVec 32) ValueCell!15118))

(declare-fun mapKey!49417 () (_ BitVec 32))

(declare-fun mapValue!49417 () ValueCell!15118)

(assert (=> mapNonEmpty!49417 (= (arr!39158 _values!914) (store mapRest!49417 mapKey!49417 mapValue!49417))))

(declare-fun b!1252803 () Bool)

(declare-fun e!711609 () Bool)

(assert (=> b!1252803 (= e!711609 tp_is_empty!31763)))

(declare-fun b!1252805 () Bool)

(declare-fun e!711613 () Bool)

(assert (=> b!1252805 (= e!711613 (and e!711609 mapRes!49417))))

(declare-fun condMapEmpty!49417 () Bool)

(declare-fun mapDefault!49417 () ValueCell!15118)

