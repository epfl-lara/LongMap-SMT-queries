; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100472 () Bool)

(assert start!100472)

(declare-fun b_free!25795 () Bool)

(declare-fun b_next!25795 () Bool)

(assert (=> start!100472 (= b_free!25795 (not b_next!25795))))

(declare-fun tp!90374 () Bool)

(declare-fun b_and!42477 () Bool)

(assert (=> start!100472 (= tp!90374 b_and!42477)))

(declare-fun b!1199892 () Bool)

(declare-fun e!681466 () Bool)

(declare-fun e!681465 () Bool)

(assert (=> b!1199892 (= e!681466 (not e!681465))))

(declare-fun res!798704 () Bool)

(assert (=> b!1199892 (=> res!798704 e!681465)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199892 (= res!798704 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77773 0))(
  ( (array!77774 (arr!37531 (Array (_ BitVec 32) (_ BitVec 64))) (size!38067 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77773)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199892 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39782 0))(
  ( (Unit!39783) )
))
(declare-fun lt!543893 () Unit!39782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77773 (_ BitVec 64) (_ BitVec 32)) Unit!39782)

(assert (=> b!1199892 (= lt!543893 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1199893 () Bool)

(assert (=> b!1199893 (= e!681465 true)))

(declare-datatypes ((V!45793 0))(
  ( (V!45794 (val!15306 Int)) )
))
(declare-fun zeroValue!944 () V!45793)

(declare-fun lt!543892 () array!77773)

(declare-datatypes ((tuple2!19592 0))(
  ( (tuple2!19593 (_1!9807 (_ BitVec 64)) (_2!9807 V!45793)) )
))
(declare-datatypes ((List!26411 0))(
  ( (Nil!26408) (Cons!26407 (h!27616 tuple2!19592) (t!39186 List!26411)) )
))
(declare-datatypes ((ListLongMap!17561 0))(
  ( (ListLongMap!17562 (toList!8796 List!26411)) )
))
(declare-fun lt!543895 () ListLongMap!17561)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14540 0))(
  ( (ValueCellFull!14540 (v!17944 V!45793)) (EmptyCell!14540) )
))
(declare-datatypes ((array!77775 0))(
  ( (array!77776 (arr!37532 (Array (_ BitVec 32) ValueCell!14540)) (size!38068 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77775)

(declare-fun minValue!944 () V!45793)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5235 (array!77773 array!77775 (_ BitVec 32) (_ BitVec 32) V!45793 V!45793 (_ BitVec 32) Int) ListLongMap!17561)

(declare-fun dynLambda!3155 (Int (_ BitVec 64)) V!45793)

(assert (=> b!1199893 (= lt!543895 (getCurrentListMapNoExtraKeys!5235 lt!543892 (array!77776 (store (arr!37532 _values!996) i!673 (ValueCellFull!14540 (dynLambda!3155 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38068 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543894 () ListLongMap!17561)

(assert (=> b!1199893 (= lt!543894 (getCurrentListMapNoExtraKeys!5235 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199894 () Bool)

(declare-fun res!798695 () Bool)

(declare-fun e!681462 () Bool)

(assert (=> b!1199894 (=> (not res!798695) (not e!681462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77773 (_ BitVec 32)) Bool)

(assert (=> b!1199894 (= res!798695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199895 () Bool)

(assert (=> b!1199895 (= e!681462 e!681466)))

(declare-fun res!798697 () Bool)

(assert (=> b!1199895 (=> (not res!798697) (not e!681466))))

(assert (=> b!1199895 (= res!798697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543892 mask!1564))))

(assert (=> b!1199895 (= lt!543892 (array!77774 (store (arr!37531 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38067 _keys!1208)))))

(declare-fun b!1199896 () Bool)

(declare-fun res!798696 () Bool)

(assert (=> b!1199896 (=> (not res!798696) (not e!681462))))

(assert (=> b!1199896 (= res!798696 (= (select (arr!37531 _keys!1208) i!673) k!934))))

(declare-fun res!798700 () Bool)

(assert (=> start!100472 (=> (not res!798700) (not e!681462))))

(assert (=> start!100472 (= res!798700 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38067 _keys!1208))))))

(assert (=> start!100472 e!681462))

(declare-fun tp_is_empty!30499 () Bool)

(assert (=> start!100472 tp_is_empty!30499))

(declare-fun array_inv!28602 (array!77773) Bool)

(assert (=> start!100472 (array_inv!28602 _keys!1208)))

(assert (=> start!100472 true))

(assert (=> start!100472 tp!90374))

(declare-fun e!681463 () Bool)

(declare-fun array_inv!28603 (array!77775) Bool)

(assert (=> start!100472 (and (array_inv!28603 _values!996) e!681463)))

(declare-fun b!1199897 () Bool)

(declare-fun res!798698 () Bool)

(assert (=> b!1199897 (=> (not res!798698) (not e!681462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199897 (= res!798698 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47591 () Bool)

(declare-fun mapRes!47591 () Bool)

(declare-fun tp!90375 () Bool)

(declare-fun e!681460 () Bool)

(assert (=> mapNonEmpty!47591 (= mapRes!47591 (and tp!90375 e!681460))))

(declare-fun mapValue!47591 () ValueCell!14540)

(declare-fun mapRest!47591 () (Array (_ BitVec 32) ValueCell!14540))

(declare-fun mapKey!47591 () (_ BitVec 32))

(assert (=> mapNonEmpty!47591 (= (arr!37532 _values!996) (store mapRest!47591 mapKey!47591 mapValue!47591))))

(declare-fun b!1199898 () Bool)

(declare-fun e!681464 () Bool)

(assert (=> b!1199898 (= e!681463 (and e!681464 mapRes!47591))))

(declare-fun condMapEmpty!47591 () Bool)

(declare-fun mapDefault!47591 () ValueCell!14540)

