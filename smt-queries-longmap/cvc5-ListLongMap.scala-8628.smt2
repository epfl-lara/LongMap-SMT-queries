; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105056 () Bool)

(assert start!105056)

(declare-fun b_free!26803 () Bool)

(declare-fun b_next!26803 () Bool)

(assert (=> start!105056 (= b_free!26803 (not b_next!26803))))

(declare-fun tp!93908 () Bool)

(declare-fun b_and!44599 () Bool)

(assert (=> start!105056 (= tp!93908 b_and!44599)))

(declare-fun b!1252053 () Bool)

(declare-fun e!711068 () Bool)

(assert (=> b!1252053 (= e!711068 (not true))))

(declare-datatypes ((V!47639 0))(
  ( (V!47640 (val!15915 Int)) )
))
(declare-datatypes ((tuple2!20528 0))(
  ( (tuple2!20529 (_1!10275 (_ BitVec 64)) (_2!10275 V!47639)) )
))
(declare-datatypes ((List!27760 0))(
  ( (Nil!27757) (Cons!27756 (h!28965 tuple2!20528) (t!41237 List!27760)) )
))
(declare-datatypes ((ListLongMap!18401 0))(
  ( (ListLongMap!18402 (toList!9216 List!27760)) )
))
(declare-fun lt!565158 () ListLongMap!18401)

(declare-fun lt!565159 () ListLongMap!18401)

(assert (=> b!1252053 (= lt!565158 lt!565159)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41621 0))(
  ( (Unit!41622) )
))
(declare-fun lt!565157 () Unit!41621)

(declare-fun minValueAfter!43 () V!47639)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47639)

(declare-datatypes ((array!81074 0))(
  ( (array!81075 (arr!39101 (Array (_ BitVec 32) (_ BitVec 64))) (size!39637 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81074)

(declare-datatypes ((ValueCell!15089 0))(
  ( (ValueCellFull!15089 (v!18613 V!47639)) (EmptyCell!15089) )
))
(declare-datatypes ((array!81076 0))(
  ( (array!81077 (arr!39102 (Array (_ BitVec 32) ValueCell!15089)) (size!39638 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81076)

(declare-fun minValueBefore!43 () V!47639)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!976 (array!81074 array!81076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47639 V!47639 V!47639 V!47639 (_ BitVec 32) Int) Unit!41621)

(assert (=> b!1252053 (= lt!565157 (lemmaNoChangeToArrayThenSameMapNoExtras!976 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5612 (array!81074 array!81076 (_ BitVec 32) (_ BitVec 32) V!47639 V!47639 (_ BitVec 32) Int) ListLongMap!18401)

(assert (=> b!1252053 (= lt!565159 (getCurrentListMapNoExtraKeys!5612 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252053 (= lt!565158 (getCurrentListMapNoExtraKeys!5612 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252054 () Bool)

(declare-fun e!711070 () Bool)

(declare-fun tp_is_empty!31705 () Bool)

(assert (=> b!1252054 (= e!711070 tp_is_empty!31705)))

(declare-fun b!1252055 () Bool)

(declare-fun res!835027 () Bool)

(assert (=> b!1252055 (=> (not res!835027) (not e!711068))))

(assert (=> b!1252055 (= res!835027 (and (= (size!39638 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39637 _keys!1118) (size!39638 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49327 () Bool)

(declare-fun mapRes!49327 () Bool)

(declare-fun tp!93907 () Bool)

(assert (=> mapNonEmpty!49327 (= mapRes!49327 (and tp!93907 e!711070))))

(declare-fun mapKey!49327 () (_ BitVec 32))

(declare-fun mapValue!49327 () ValueCell!15089)

(declare-fun mapRest!49327 () (Array (_ BitVec 32) ValueCell!15089))

(assert (=> mapNonEmpty!49327 (= (arr!39102 _values!914) (store mapRest!49327 mapKey!49327 mapValue!49327))))

(declare-fun mapIsEmpty!49327 () Bool)

(assert (=> mapIsEmpty!49327 mapRes!49327))

(declare-fun b!1252056 () Bool)

(declare-fun e!711069 () Bool)

(assert (=> b!1252056 (= e!711069 tp_is_empty!31705)))

(declare-fun b!1252057 () Bool)

(declare-fun e!711066 () Bool)

(assert (=> b!1252057 (= e!711066 (and e!711069 mapRes!49327))))

(declare-fun condMapEmpty!49327 () Bool)

(declare-fun mapDefault!49327 () ValueCell!15089)

