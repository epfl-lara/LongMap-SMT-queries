; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105122 () Bool)

(assert start!105122)

(declare-fun b_free!26855 () Bool)

(declare-fun b_next!26855 () Bool)

(assert (=> start!105122 (= b_free!26855 (not b_next!26855))))

(declare-fun tp!94067 () Bool)

(declare-fun b_and!44659 () Bool)

(assert (=> start!105122 (= tp!94067 b_and!44659)))

(declare-fun b!1252728 () Bool)

(declare-fun e!711555 () Bool)

(assert (=> b!1252728 (= e!711555 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47707 0))(
  ( (V!47708 (val!15941 Int)) )
))
(declare-datatypes ((tuple2!20564 0))(
  ( (tuple2!20565 (_1!10293 (_ BitVec 64)) (_2!10293 V!47707)) )
))
(declare-datatypes ((List!27798 0))(
  ( (Nil!27795) (Cons!27794 (h!29003 tuple2!20564) (t!41277 List!27798)) )
))
(declare-datatypes ((ListLongMap!18437 0))(
  ( (ListLongMap!18438 (toList!9234 List!27798)) )
))
(declare-fun lt!565476 () ListLongMap!18437)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47707)

(declare-datatypes ((array!81176 0))(
  ( (array!81177 (arr!39151 (Array (_ BitVec 32) (_ BitVec 64))) (size!39687 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81176)

(declare-datatypes ((ValueCell!15115 0))(
  ( (ValueCellFull!15115 (v!18639 V!47707)) (EmptyCell!15115) )
))
(declare-datatypes ((array!81178 0))(
  ( (array!81179 (arr!39152 (Array (_ BitVec 32) ValueCell!15115)) (size!39688 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81178)

(declare-fun minValueBefore!43 () V!47707)

(declare-fun getCurrentListMap!4482 (array!81176 array!81178 (_ BitVec 32) (_ BitVec 32) V!47707 V!47707 (_ BitVec 32) Int) ListLongMap!18437)

(assert (=> b!1252728 (= lt!565476 (getCurrentListMap!4482 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252729 () Bool)

(declare-fun e!711558 () Bool)

(assert (=> b!1252729 (= e!711558 (not e!711555))))

(declare-fun res!835417 () Bool)

(assert (=> b!1252729 (=> res!835417 e!711555)))

(assert (=> b!1252729 (= res!835417 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565477 () ListLongMap!18437)

(declare-fun lt!565478 () ListLongMap!18437)

(assert (=> b!1252729 (= lt!565477 lt!565478)))

(declare-fun minValueAfter!43 () V!47707)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41655 0))(
  ( (Unit!41656) )
))
(declare-fun lt!565475 () Unit!41655)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!993 (array!81176 array!81178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47707 V!47707 V!47707 V!47707 (_ BitVec 32) Int) Unit!41655)

(assert (=> b!1252729 (= lt!565475 (lemmaNoChangeToArrayThenSameMapNoExtras!993 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5629 (array!81176 array!81178 (_ BitVec 32) (_ BitVec 32) V!47707 V!47707 (_ BitVec 32) Int) ListLongMap!18437)

(assert (=> b!1252729 (= lt!565478 (getCurrentListMapNoExtraKeys!5629 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252729 (= lt!565477 (getCurrentListMapNoExtraKeys!5629 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252730 () Bool)

(declare-fun e!711559 () Bool)

(declare-fun e!711556 () Bool)

(declare-fun mapRes!49408 () Bool)

(assert (=> b!1252730 (= e!711559 (and e!711556 mapRes!49408))))

(declare-fun condMapEmpty!49408 () Bool)

(declare-fun mapDefault!49408 () ValueCell!15115)

