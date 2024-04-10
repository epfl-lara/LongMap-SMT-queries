; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100482 () Bool)

(assert start!100482)

(declare-fun b_free!25805 () Bool)

(declare-fun b_next!25805 () Bool)

(assert (=> start!100482 (= b_free!25805 (not b_next!25805))))

(declare-fun tp!90404 () Bool)

(declare-fun b_and!42497 () Bool)

(assert (=> start!100482 (= tp!90404 b_and!42497)))

(declare-fun b!1200112 () Bool)

(declare-fun e!681570 () Bool)

(declare-fun tp_is_empty!30509 () Bool)

(assert (=> b!1200112 (= e!681570 tp_is_empty!30509)))

(declare-fun b!1200113 () Bool)

(declare-fun res!798862 () Bool)

(declare-fun e!681569 () Bool)

(assert (=> b!1200113 (=> (not res!798862) (not e!681569))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200113 (= res!798862 (validKeyInArray!0 k!934))))

(declare-fun b!1200114 () Bool)

(declare-fun e!681571 () Bool)

(assert (=> b!1200114 (= e!681571 true)))

(declare-datatypes ((V!45805 0))(
  ( (V!45806 (val!15311 Int)) )
))
(declare-fun zeroValue!944 () V!45805)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14545 0))(
  ( (ValueCellFull!14545 (v!17949 V!45805)) (EmptyCell!14545) )
))
(declare-datatypes ((array!77791 0))(
  ( (array!77792 (arr!37540 (Array (_ BitVec 32) ValueCell!14545)) (size!38076 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77791)

(declare-fun minValue!944 () V!45805)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19598 0))(
  ( (tuple2!19599 (_1!9810 (_ BitVec 64)) (_2!9810 V!45805)) )
))
(declare-datatypes ((List!26417 0))(
  ( (Nil!26414) (Cons!26413 (h!27622 tuple2!19598) (t!39202 List!26417)) )
))
(declare-datatypes ((ListLongMap!17567 0))(
  ( (ListLongMap!17568 (toList!8799 List!26417)) )
))
(declare-fun lt!543955 () ListLongMap!17567)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!77793 0))(
  ( (array!77794 (arr!37541 (Array (_ BitVec 32) (_ BitVec 64))) (size!38077 (_ BitVec 32))) )
))
(declare-fun lt!543954 () array!77793)

(declare-fun getCurrentListMapNoExtraKeys!5238 (array!77793 array!77791 (_ BitVec 32) (_ BitVec 32) V!45805 V!45805 (_ BitVec 32) Int) ListLongMap!17567)

(declare-fun dynLambda!3158 (Int (_ BitVec 64)) V!45805)

(assert (=> b!1200114 (= lt!543955 (getCurrentListMapNoExtraKeys!5238 lt!543954 (array!77792 (store (arr!37540 _values!996) i!673 (ValueCellFull!14545 (dynLambda!3158 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38076 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!77793)

(declare-fun lt!543953 () ListLongMap!17567)

(assert (=> b!1200114 (= lt!543953 (getCurrentListMapNoExtraKeys!5238 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47606 () Bool)

(declare-fun mapRes!47606 () Bool)

(assert (=> mapIsEmpty!47606 mapRes!47606))

(declare-fun b!1200116 () Bool)

(declare-fun res!798866 () Bool)

(assert (=> b!1200116 (=> (not res!798866) (not e!681569))))

(assert (=> b!1200116 (= res!798866 (and (= (size!38076 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38077 _keys!1208) (size!38076 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200117 () Bool)

(declare-fun res!798869 () Bool)

(declare-fun e!681567 () Bool)

(assert (=> b!1200117 (=> (not res!798869) (not e!681567))))

(declare-datatypes ((List!26418 0))(
  ( (Nil!26415) (Cons!26414 (h!27623 (_ BitVec 64)) (t!39203 List!26418)) )
))
(declare-fun arrayNoDuplicates!0 (array!77793 (_ BitVec 32) List!26418) Bool)

(assert (=> b!1200117 (= res!798869 (arrayNoDuplicates!0 lt!543954 #b00000000000000000000000000000000 Nil!26415))))

(declare-fun b!1200118 () Bool)

(assert (=> b!1200118 (= e!681567 (not e!681571))))

(declare-fun res!798870 () Bool)

(assert (=> b!1200118 (=> res!798870 e!681571)))

(assert (=> b!1200118 (= res!798870 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200118 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39788 0))(
  ( (Unit!39789) )
))
(declare-fun lt!543952 () Unit!39788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77793 (_ BitVec 64) (_ BitVec 32)) Unit!39788)

(assert (=> b!1200118 (= lt!543952 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1200119 () Bool)

(declare-fun res!798867 () Bool)

(assert (=> b!1200119 (=> (not res!798867) (not e!681569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200119 (= res!798867 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47606 () Bool)

(declare-fun tp!90405 () Bool)

(declare-fun e!681568 () Bool)

(assert (=> mapNonEmpty!47606 (= mapRes!47606 (and tp!90405 e!681568))))

(declare-fun mapRest!47606 () (Array (_ BitVec 32) ValueCell!14545))

(declare-fun mapValue!47606 () ValueCell!14545)

(declare-fun mapKey!47606 () (_ BitVec 32))

(assert (=> mapNonEmpty!47606 (= (arr!37540 _values!996) (store mapRest!47606 mapKey!47606 mapValue!47606))))

(declare-fun b!1200120 () Bool)

(declare-fun res!798864 () Bool)

(assert (=> b!1200120 (=> (not res!798864) (not e!681569))))

(assert (=> b!1200120 (= res!798864 (= (select (arr!37541 _keys!1208) i!673) k!934))))

(declare-fun b!1200121 () Bool)

(declare-fun res!798861 () Bool)

(assert (=> b!1200121 (=> (not res!798861) (not e!681569))))

(assert (=> b!1200121 (= res!798861 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38077 _keys!1208))))))

(declare-fun b!1200122 () Bool)

(assert (=> b!1200122 (= e!681569 e!681567)))

(declare-fun res!798868 () Bool)

(assert (=> b!1200122 (=> (not res!798868) (not e!681567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77793 (_ BitVec 32)) Bool)

(assert (=> b!1200122 (= res!798868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543954 mask!1564))))

(assert (=> b!1200122 (= lt!543954 (array!77794 (store (arr!37541 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38077 _keys!1208)))))

(declare-fun res!798863 () Bool)

(assert (=> start!100482 (=> (not res!798863) (not e!681569))))

(assert (=> start!100482 (= res!798863 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38077 _keys!1208))))))

(assert (=> start!100482 e!681569))

(assert (=> start!100482 tp_is_empty!30509))

(declare-fun array_inv!28608 (array!77793) Bool)

(assert (=> start!100482 (array_inv!28608 _keys!1208)))

(assert (=> start!100482 true))

(assert (=> start!100482 tp!90404))

(declare-fun e!681566 () Bool)

(declare-fun array_inv!28609 (array!77791) Bool)

(assert (=> start!100482 (and (array_inv!28609 _values!996) e!681566)))

(declare-fun b!1200115 () Bool)

(assert (=> b!1200115 (= e!681568 tp_is_empty!30509)))

(declare-fun b!1200123 () Bool)

(declare-fun res!798860 () Bool)

(assert (=> b!1200123 (=> (not res!798860) (not e!681569))))

(assert (=> b!1200123 (= res!798860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200124 () Bool)

(declare-fun res!798865 () Bool)

(assert (=> b!1200124 (=> (not res!798865) (not e!681569))))

(assert (=> b!1200124 (= res!798865 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26415))))

(declare-fun b!1200125 () Bool)

(assert (=> b!1200125 (= e!681566 (and e!681570 mapRes!47606))))

(declare-fun condMapEmpty!47606 () Bool)

(declare-fun mapDefault!47606 () ValueCell!14545)

