; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100436 () Bool)

(assert start!100436)

(declare-fun b_free!25759 () Bool)

(declare-fun b_next!25759 () Bool)

(assert (=> start!100436 (= b_free!25759 (not b_next!25759))))

(declare-fun tp!90266 () Bool)

(declare-fun b_and!42405 () Bool)

(assert (=> start!100436 (= tp!90266 b_and!42405)))

(declare-fun mapNonEmpty!47537 () Bool)

(declare-fun mapRes!47537 () Bool)

(declare-fun tp!90267 () Bool)

(declare-fun e!681086 () Bool)

(assert (=> mapNonEmpty!47537 (= mapRes!47537 (and tp!90267 e!681086))))

(declare-fun mapKey!47537 () (_ BitVec 32))

(declare-datatypes ((V!45745 0))(
  ( (V!45746 (val!15288 Int)) )
))
(declare-datatypes ((ValueCell!14522 0))(
  ( (ValueCellFull!14522 (v!17926 V!45745)) (EmptyCell!14522) )
))
(declare-datatypes ((array!77703 0))(
  ( (array!77704 (arr!37496 (Array (_ BitVec 32) ValueCell!14522)) (size!38032 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77703)

(declare-fun mapRest!47537 () (Array (_ BitVec 32) ValueCell!14522))

(declare-fun mapValue!47537 () ValueCell!14522)

(assert (=> mapNonEmpty!47537 (= (arr!37496 _values!996) (store mapRest!47537 mapKey!47537 mapValue!47537))))

(declare-fun b!1199100 () Bool)

(declare-fun e!681082 () Bool)

(declare-fun e!681087 () Bool)

(assert (=> b!1199100 (= e!681082 e!681087)))

(declare-fun res!798106 () Bool)

(assert (=> b!1199100 (=> (not res!798106) (not e!681087))))

(declare-datatypes ((array!77705 0))(
  ( (array!77706 (arr!37497 (Array (_ BitVec 32) (_ BitVec 64))) (size!38033 (_ BitVec 32))) )
))
(declare-fun lt!543679 () array!77705)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77705 (_ BitVec 32)) Bool)

(assert (=> b!1199100 (= res!798106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543679 mask!1564))))

(declare-fun _keys!1208 () array!77705)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199100 (= lt!543679 (array!77706 (store (arr!37497 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38033 _keys!1208)))))

(declare-fun b!1199101 () Bool)

(declare-fun e!681083 () Bool)

(declare-fun tp_is_empty!30463 () Bool)

(assert (=> b!1199101 (= e!681083 tp_is_empty!30463)))

(declare-fun b!1199102 () Bool)

(declare-fun res!798111 () Bool)

(assert (=> b!1199102 (=> (not res!798111) (not e!681082))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1199102 (= res!798111 (and (= (size!38032 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38033 _keys!1208) (size!38032 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199104 () Bool)

(assert (=> b!1199104 (= e!681086 tp_is_empty!30463)))

(declare-fun b!1199105 () Bool)

(declare-fun e!681084 () Bool)

(assert (=> b!1199105 (= e!681084 true)))

(declare-fun zeroValue!944 () V!45745)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45745)

(declare-datatypes ((tuple2!19566 0))(
  ( (tuple2!19567 (_1!9794 (_ BitVec 64)) (_2!9794 V!45745)) )
))
(declare-datatypes ((List!26382 0))(
  ( (Nil!26379) (Cons!26378 (h!27587 tuple2!19566) (t!39121 List!26382)) )
))
(declare-datatypes ((ListLongMap!17535 0))(
  ( (ListLongMap!17536 (toList!8783 List!26382)) )
))
(declare-fun lt!543678 () ListLongMap!17535)

(declare-fun getCurrentListMapNoExtraKeys!5222 (array!77705 array!77703 (_ BitVec 32) (_ BitVec 32) V!45745 V!45745 (_ BitVec 32) Int) ListLongMap!17535)

(declare-fun dynLambda!3142 (Int (_ BitVec 64)) V!45745)

(assert (=> b!1199105 (= lt!543678 (getCurrentListMapNoExtraKeys!5222 lt!543679 (array!77704 (store (arr!37496 _values!996) i!673 (ValueCellFull!14522 (dynLambda!3142 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38032 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543676 () ListLongMap!17535)

(assert (=> b!1199105 (= lt!543676 (getCurrentListMapNoExtraKeys!5222 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199106 () Bool)

(declare-fun res!798109 () Bool)

(assert (=> b!1199106 (=> (not res!798109) (not e!681082))))

(declare-datatypes ((List!26383 0))(
  ( (Nil!26380) (Cons!26379 (h!27588 (_ BitVec 64)) (t!39122 List!26383)) )
))
(declare-fun arrayNoDuplicates!0 (array!77705 (_ BitVec 32) List!26383) Bool)

(assert (=> b!1199106 (= res!798109 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26380))))

(declare-fun b!1199107 () Bool)

(declare-fun res!798105 () Bool)

(assert (=> b!1199107 (=> (not res!798105) (not e!681082))))

(assert (=> b!1199107 (= res!798105 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38033 _keys!1208))))))

(declare-fun mapIsEmpty!47537 () Bool)

(assert (=> mapIsEmpty!47537 mapRes!47537))

(declare-fun b!1199108 () Bool)

(declare-fun res!798101 () Bool)

(assert (=> b!1199108 (=> (not res!798101) (not e!681082))))

(assert (=> b!1199108 (= res!798101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199109 () Bool)

(declare-fun res!798108 () Bool)

(assert (=> b!1199109 (=> (not res!798108) (not e!681087))))

(assert (=> b!1199109 (= res!798108 (arrayNoDuplicates!0 lt!543679 #b00000000000000000000000000000000 Nil!26380))))

(declare-fun b!1199110 () Bool)

(declare-fun res!798110 () Bool)

(assert (=> b!1199110 (=> (not res!798110) (not e!681082))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199110 (= res!798110 (validKeyInArray!0 k!934))))

(declare-fun b!1199111 () Bool)

(assert (=> b!1199111 (= e!681087 (not e!681084))))

(declare-fun res!798107 () Bool)

(assert (=> b!1199111 (=> res!798107 e!681084)))

(assert (=> b!1199111 (= res!798107 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199111 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39758 0))(
  ( (Unit!39759) )
))
(declare-fun lt!543677 () Unit!39758)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77705 (_ BitVec 64) (_ BitVec 32)) Unit!39758)

(assert (=> b!1199111 (= lt!543677 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1199112 () Bool)

(declare-fun res!798104 () Bool)

(assert (=> b!1199112 (=> (not res!798104) (not e!681082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199112 (= res!798104 (validMask!0 mask!1564))))

(declare-fun b!1199113 () Bool)

(declare-fun e!681088 () Bool)

(assert (=> b!1199113 (= e!681088 (and e!681083 mapRes!47537))))

(declare-fun condMapEmpty!47537 () Bool)

(declare-fun mapDefault!47537 () ValueCell!14522)

