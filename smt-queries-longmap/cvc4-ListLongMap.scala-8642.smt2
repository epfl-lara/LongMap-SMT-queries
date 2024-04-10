; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105174 () Bool)

(assert start!105174)

(declare-fun b_free!26891 () Bool)

(declare-fun b_next!26891 () Bool)

(assert (=> start!105174 (= b_free!26891 (not b_next!26891))))

(declare-fun tp!94178 () Bool)

(declare-fun b_and!44705 () Bool)

(assert (=> start!105174 (= tp!94178 b_and!44705)))

(declare-fun mapNonEmpty!49465 () Bool)

(declare-fun mapRes!49465 () Bool)

(declare-fun tp!94177 () Bool)

(declare-fun e!711985 () Bool)

(assert (=> mapNonEmpty!49465 (= mapRes!49465 (and tp!94177 e!711985))))

(declare-fun mapKey!49465 () (_ BitVec 32))

(declare-datatypes ((V!47755 0))(
  ( (V!47756 (val!15959 Int)) )
))
(declare-datatypes ((ValueCell!15133 0))(
  ( (ValueCellFull!15133 (v!18657 V!47755)) (EmptyCell!15133) )
))
(declare-fun mapValue!49465 () ValueCell!15133)

(declare-datatypes ((array!81246 0))(
  ( (array!81247 (arr!39185 (Array (_ BitVec 32) ValueCell!15133)) (size!39721 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81246)

(declare-fun mapRest!49465 () (Array (_ BitVec 32) ValueCell!15133))

(assert (=> mapNonEmpty!49465 (= (arr!39185 _values!914) (store mapRest!49465 mapKey!49465 mapValue!49465))))

(declare-fun mapIsEmpty!49465 () Bool)

(assert (=> mapIsEmpty!49465 mapRes!49465))

(declare-fun b!1253318 () Bool)

(declare-fun e!711983 () Bool)

(assert (=> b!1253318 (= e!711983 true)))

(declare-datatypes ((tuple2!20594 0))(
  ( (tuple2!20595 (_1!10308 (_ BitVec 64)) (_2!10308 V!47755)) )
))
(declare-datatypes ((List!27824 0))(
  ( (Nil!27821) (Cons!27820 (h!29029 tuple2!20594) (t!41305 List!27824)) )
))
(declare-datatypes ((ListLongMap!18467 0))(
  ( (ListLongMap!18468 (toList!9249 List!27824)) )
))
(declare-fun lt!565849 () ListLongMap!18467)

(declare-fun lt!565848 () ListLongMap!18467)

(declare-fun -!2023 (ListLongMap!18467 (_ BitVec 64)) ListLongMap!18467)

(assert (=> b!1253318 (= lt!565849 (-!2023 lt!565848 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565847 () ListLongMap!18467)

(declare-fun lt!565850 () ListLongMap!18467)

(assert (=> b!1253318 (= (-!2023 lt!565847 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565850)))

(declare-datatypes ((Unit!41680 0))(
  ( (Unit!41681) )
))
(declare-fun lt!565852 () Unit!41680)

(declare-fun minValueBefore!43 () V!47755)

(declare-fun addThenRemoveForNewKeyIsSame!293 (ListLongMap!18467 (_ BitVec 64) V!47755) Unit!41680)

(assert (=> b!1253318 (= lt!565852 (addThenRemoveForNewKeyIsSame!293 lt!565850 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565853 () ListLongMap!18467)

(declare-fun lt!565854 () ListLongMap!18467)

(assert (=> b!1253318 (and (= lt!565848 lt!565847) (= lt!565854 lt!565853))))

(declare-fun +!4146 (ListLongMap!18467 tuple2!20594) ListLongMap!18467)

(assert (=> b!1253318 (= lt!565847 (+!4146 lt!565850 (tuple2!20595 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47755)

(declare-fun zeroValue!871 () V!47755)

(declare-datatypes ((array!81248 0))(
  ( (array!81249 (arr!39186 (Array (_ BitVec 32) (_ BitVec 64))) (size!39722 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81248)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4494 (array!81248 array!81246 (_ BitVec 32) (_ BitVec 32) V!47755 V!47755 (_ BitVec 32) Int) ListLongMap!18467)

(assert (=> b!1253318 (= lt!565854 (getCurrentListMap!4494 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253318 (= lt!565848 (getCurrentListMap!4494 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253319 () Bool)

(declare-fun tp_is_empty!31793 () Bool)

(assert (=> b!1253319 (= e!711985 tp_is_empty!31793)))

(declare-fun b!1253320 () Bool)

(declare-fun e!711986 () Bool)

(assert (=> b!1253320 (= e!711986 tp_is_empty!31793)))

(declare-fun b!1253321 () Bool)

(declare-fun res!835754 () Bool)

(declare-fun e!711987 () Bool)

(assert (=> b!1253321 (=> (not res!835754) (not e!711987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81248 (_ BitVec 32)) Bool)

(assert (=> b!1253321 (= res!835754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253322 () Bool)

(declare-fun e!711984 () Bool)

(assert (=> b!1253322 (= e!711984 (and e!711986 mapRes!49465))))

(declare-fun condMapEmpty!49465 () Bool)

(declare-fun mapDefault!49465 () ValueCell!15133)

