; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105136 () Bool)

(assert start!105136)

(declare-fun b_free!26869 () Bool)

(declare-fun b_next!26869 () Bool)

(assert (=> start!105136 (= b_free!26869 (not b_next!26869))))

(declare-fun tp!94109 () Bool)

(declare-fun b_and!44673 () Bool)

(assert (=> start!105136 (= tp!94109 b_and!44673)))

(declare-fun mapIsEmpty!49429 () Bool)

(declare-fun mapRes!49429 () Bool)

(assert (=> mapIsEmpty!49429 mapRes!49429))

(declare-fun b!1252896 () Bool)

(declare-fun e!711682 () Bool)

(declare-fun e!711684 () Bool)

(assert (=> b!1252896 (= e!711682 (not e!711684))))

(declare-fun res!835521 () Bool)

(assert (=> b!1252896 (=> res!835521 e!711684)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252896 (= res!835521 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47727 0))(
  ( (V!47728 (val!15948 Int)) )
))
(declare-datatypes ((tuple2!20576 0))(
  ( (tuple2!20577 (_1!10299 (_ BitVec 64)) (_2!10299 V!47727)) )
))
(declare-datatypes ((List!27808 0))(
  ( (Nil!27805) (Cons!27804 (h!29013 tuple2!20576) (t!41287 List!27808)) )
))
(declare-datatypes ((ListLongMap!18449 0))(
  ( (ListLongMap!18450 (toList!9240 List!27808)) )
))
(declare-fun lt!565561 () ListLongMap!18449)

(declare-fun lt!565559 () ListLongMap!18449)

(assert (=> b!1252896 (= lt!565561 lt!565559)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47727)

(declare-datatypes ((Unit!41665 0))(
  ( (Unit!41666) )
))
(declare-fun lt!565560 () Unit!41665)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47727)

(declare-datatypes ((array!81202 0))(
  ( (array!81203 (arr!39164 (Array (_ BitVec 32) (_ BitVec 64))) (size!39700 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81202)

(declare-datatypes ((ValueCell!15122 0))(
  ( (ValueCellFull!15122 (v!18646 V!47727)) (EmptyCell!15122) )
))
(declare-datatypes ((array!81204 0))(
  ( (array!81205 (arr!39165 (Array (_ BitVec 32) ValueCell!15122)) (size!39701 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81204)

(declare-fun minValueBefore!43 () V!47727)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!998 (array!81202 array!81204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47727 V!47727 V!47727 V!47727 (_ BitVec 32) Int) Unit!41665)

(assert (=> b!1252896 (= lt!565560 (lemmaNoChangeToArrayThenSameMapNoExtras!998 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5634 (array!81202 array!81204 (_ BitVec 32) (_ BitVec 32) V!47727 V!47727 (_ BitVec 32) Int) ListLongMap!18449)

(assert (=> b!1252896 (= lt!565559 (getCurrentListMapNoExtraKeys!5634 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252896 (= lt!565561 (getCurrentListMapNoExtraKeys!5634 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252897 () Bool)

(declare-fun e!711686 () Bool)

(declare-fun e!711685 () Bool)

(assert (=> b!1252897 (= e!711686 (and e!711685 mapRes!49429))))

(declare-fun condMapEmpty!49429 () Bool)

(declare-fun mapDefault!49429 () ValueCell!15122)

