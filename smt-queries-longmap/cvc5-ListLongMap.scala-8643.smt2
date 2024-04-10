; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105176 () Bool)

(assert start!105176)

(declare-fun b_free!26893 () Bool)

(declare-fun b_next!26893 () Bool)

(assert (=> start!105176 (= b_free!26893 (not b_next!26893))))

(declare-fun tp!94183 () Bool)

(declare-fun b_and!44707 () Bool)

(assert (=> start!105176 (= tp!94183 b_and!44707)))

(declare-fun b!1253341 () Bool)

(declare-fun res!835766 () Bool)

(declare-fun e!712001 () Bool)

(assert (=> b!1253341 (=> (not res!835766) (not e!712001))))

(declare-datatypes ((array!81250 0))(
  ( (array!81251 (arr!39187 (Array (_ BitVec 32) (_ BitVec 64))) (size!39723 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81250)

(declare-datatypes ((List!27825 0))(
  ( (Nil!27822) (Cons!27821 (h!29030 (_ BitVec 64)) (t!41306 List!27825)) )
))
(declare-fun arrayNoDuplicates!0 (array!81250 (_ BitVec 32) List!27825) Bool)

(assert (=> b!1253341 (= res!835766 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27822))))

(declare-fun b!1253342 () Bool)

(declare-fun res!835767 () Bool)

(assert (=> b!1253342 (=> (not res!835767) (not e!712001))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81250 (_ BitVec 32)) Bool)

(assert (=> b!1253342 (= res!835767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253344 () Bool)

(declare-fun res!835765 () Bool)

(assert (=> b!1253344 (=> (not res!835765) (not e!712001))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47759 0))(
  ( (V!47760 (val!15960 Int)) )
))
(declare-datatypes ((ValueCell!15134 0))(
  ( (ValueCellFull!15134 (v!18658 V!47759)) (EmptyCell!15134) )
))
(declare-datatypes ((array!81252 0))(
  ( (array!81253 (arr!39188 (Array (_ BitVec 32) ValueCell!15134)) (size!39724 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81252)

(assert (=> b!1253344 (= res!835765 (and (= (size!39724 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39723 _keys!1118) (size!39724 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253345 () Bool)

(declare-fun e!712000 () Bool)

(declare-fun tp_is_empty!31795 () Bool)

(assert (=> b!1253345 (= e!712000 tp_is_empty!31795)))

(declare-fun b!1253346 () Bool)

(declare-fun e!712005 () Bool)

(assert (=> b!1253346 (= e!712001 (not e!712005))))

(declare-fun res!835768 () Bool)

(assert (=> b!1253346 (=> res!835768 e!712005)))

(assert (=> b!1253346 (= res!835768 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20596 0))(
  ( (tuple2!20597 (_1!10309 (_ BitVec 64)) (_2!10309 V!47759)) )
))
(declare-datatypes ((List!27826 0))(
  ( (Nil!27823) (Cons!27822 (h!29031 tuple2!20596) (t!41307 List!27826)) )
))
(declare-datatypes ((ListLongMap!18469 0))(
  ( (ListLongMap!18470 (toList!9250 List!27826)) )
))
(declare-fun lt!565874 () ListLongMap!18469)

(declare-fun lt!565872 () ListLongMap!18469)

(assert (=> b!1253346 (= lt!565874 lt!565872)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47759)

(declare-fun zeroValue!871 () V!47759)

(declare-fun minValueBefore!43 () V!47759)

(declare-datatypes ((Unit!41682 0))(
  ( (Unit!41683) )
))
(declare-fun lt!565871 () Unit!41682)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1005 (array!81250 array!81252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47759 V!47759 V!47759 V!47759 (_ BitVec 32) Int) Unit!41682)

(assert (=> b!1253346 (= lt!565871 (lemmaNoChangeToArrayThenSameMapNoExtras!1005 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5641 (array!81250 array!81252 (_ BitVec 32) (_ BitVec 32) V!47759 V!47759 (_ BitVec 32) Int) ListLongMap!18469)

(assert (=> b!1253346 (= lt!565872 (getCurrentListMapNoExtraKeys!5641 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253346 (= lt!565874 (getCurrentListMapNoExtraKeys!5641 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49468 () Bool)

(declare-fun mapRes!49468 () Bool)

(assert (=> mapIsEmpty!49468 mapRes!49468))

(declare-fun b!1253347 () Bool)

(declare-fun e!712003 () Bool)

(declare-fun e!712004 () Bool)

(assert (=> b!1253347 (= e!712003 (and e!712004 mapRes!49468))))

(declare-fun condMapEmpty!49468 () Bool)

(declare-fun mapDefault!49468 () ValueCell!15134)

