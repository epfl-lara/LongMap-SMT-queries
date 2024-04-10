; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100500 () Bool)

(assert start!100500)

(declare-fun b_free!25823 () Bool)

(declare-fun b_next!25823 () Bool)

(assert (=> start!100500 (= b_free!25823 (not b_next!25823))))

(declare-fun tp!90459 () Bool)

(declare-fun b_and!42533 () Bool)

(assert (=> start!100500 (= tp!90459 b_and!42533)))

(declare-datatypes ((V!45829 0))(
  ( (V!45830 (val!15320 Int)) )
))
(declare-datatypes ((tuple2!19612 0))(
  ( (tuple2!19613 (_1!9817 (_ BitVec 64)) (_2!9817 V!45829)) )
))
(declare-datatypes ((List!26432 0))(
  ( (Nil!26429) (Cons!26428 (h!27637 tuple2!19612) (t!39235 List!26432)) )
))
(declare-datatypes ((ListLongMap!17581 0))(
  ( (ListLongMap!17582 (toList!8806 List!26432)) )
))
(declare-fun call!57299 () ListLongMap!17581)

(declare-fun b!1200532 () Bool)

(declare-fun e!681778 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!57298 () ListLongMap!17581)

(declare-fun -!1782 (ListLongMap!17581 (_ BitVec 64)) ListLongMap!17581)

(assert (=> b!1200532 (= e!681778 (= call!57299 (-!1782 call!57298 k!934)))))

(declare-fun b!1200533 () Bool)

(declare-fun res!799171 () Bool)

(declare-fun e!681770 () Bool)

(assert (=> b!1200533 (=> (not res!799171) (not e!681770))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200533 (= res!799171 (validMask!0 mask!1564))))

(declare-fun b!1200534 () Bool)

(declare-fun e!681772 () Bool)

(assert (=> b!1200534 (= e!681770 e!681772)))

(declare-fun res!799172 () Bool)

(assert (=> b!1200534 (=> (not res!799172) (not e!681772))))

(declare-datatypes ((array!77827 0))(
  ( (array!77828 (arr!37558 (Array (_ BitVec 32) (_ BitVec 64))) (size!38094 (_ BitVec 32))) )
))
(declare-fun lt!544080 () array!77827)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77827 (_ BitVec 32)) Bool)

(assert (=> b!1200534 (= res!799172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544080 mask!1564))))

(declare-fun _keys!1208 () array!77827)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200534 (= lt!544080 (array!77828 (store (arr!37558 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38094 _keys!1208)))))

(declare-fun b!1200535 () Bool)

(declare-fun res!799175 () Bool)

(assert (=> b!1200535 (=> (not res!799175) (not e!681772))))

(declare-datatypes ((List!26433 0))(
  ( (Nil!26430) (Cons!26429 (h!27638 (_ BitVec 64)) (t!39236 List!26433)) )
))
(declare-fun arrayNoDuplicates!0 (array!77827 (_ BitVec 32) List!26433) Bool)

(assert (=> b!1200535 (= res!799175 (arrayNoDuplicates!0 lt!544080 #b00000000000000000000000000000000 Nil!26430))))

(declare-fun b!1200536 () Bool)

(assert (=> b!1200536 (= e!681778 (= call!57299 call!57298))))

(declare-fun b!1200537 () Bool)

(declare-fun res!799167 () Bool)

(assert (=> b!1200537 (=> (not res!799167) (not e!681770))))

(assert (=> b!1200537 (= res!799167 (= (select (arr!37558 _keys!1208) i!673) k!934))))

(declare-fun b!1200538 () Bool)

(declare-fun e!681771 () Bool)

(declare-fun tp_is_empty!30527 () Bool)

(assert (=> b!1200538 (= e!681771 tp_is_empty!30527)))

(declare-fun b!1200539 () Bool)

(declare-fun res!799174 () Bool)

(assert (=> b!1200539 (=> (not res!799174) (not e!681770))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14554 0))(
  ( (ValueCellFull!14554 (v!17958 V!45829)) (EmptyCell!14554) )
))
(declare-datatypes ((array!77829 0))(
  ( (array!77830 (arr!37559 (Array (_ BitVec 32) ValueCell!14554)) (size!38095 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77829)

(assert (=> b!1200539 (= res!799174 (and (= (size!38095 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38094 _keys!1208) (size!38095 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200540 () Bool)

(declare-fun e!681773 () Bool)

(assert (=> b!1200540 (= e!681773 tp_is_empty!30527)))

(declare-fun b!1200541 () Bool)

(declare-fun res!799166 () Bool)

(assert (=> b!1200541 (=> (not res!799166) (not e!681770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200541 (= res!799166 (validKeyInArray!0 k!934))))

(declare-fun b!1200542 () Bool)

(declare-fun e!681776 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1200542 (= e!681776 (bvslt from!1455 (size!38094 _keys!1208)))))

(assert (=> b!1200542 e!681778))

(declare-fun c!117446 () Bool)

(assert (=> b!1200542 (= c!117446 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!45829)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45829)

(declare-datatypes ((Unit!39804 0))(
  ( (Unit!39805) )
))
(declare-fun lt!544077 () Unit!39804)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!989 (array!77827 array!77829 (_ BitVec 32) (_ BitVec 32) V!45829 V!45829 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39804)

(assert (=> b!1200542 (= lt!544077 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!989 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200543 () Bool)

(declare-fun res!799168 () Bool)

(assert (=> b!1200543 (=> (not res!799168) (not e!681770))))

(assert (=> b!1200543 (= res!799168 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26430))))

(declare-fun res!799173 () Bool)

(assert (=> start!100500 (=> (not res!799173) (not e!681770))))

(assert (=> start!100500 (= res!799173 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38094 _keys!1208))))))

(assert (=> start!100500 e!681770))

(assert (=> start!100500 tp_is_empty!30527))

(declare-fun array_inv!28624 (array!77827) Bool)

(assert (=> start!100500 (array_inv!28624 _keys!1208)))

(assert (=> start!100500 true))

(assert (=> start!100500 tp!90459))

(declare-fun e!681777 () Bool)

(declare-fun array_inv!28625 (array!77829) Bool)

(assert (=> start!100500 (and (array_inv!28625 _values!996) e!681777)))

(declare-fun mapNonEmpty!47633 () Bool)

(declare-fun mapRes!47633 () Bool)

(declare-fun tp!90458 () Bool)

(assert (=> mapNonEmpty!47633 (= mapRes!47633 (and tp!90458 e!681771))))

(declare-fun mapKey!47633 () (_ BitVec 32))

(declare-fun mapRest!47633 () (Array (_ BitVec 32) ValueCell!14554))

(declare-fun mapValue!47633 () ValueCell!14554)

(assert (=> mapNonEmpty!47633 (= (arr!37559 _values!996) (store mapRest!47633 mapKey!47633 mapValue!47633))))

(declare-fun lt!544081 () array!77829)

(declare-fun bm!57295 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5245 (array!77827 array!77829 (_ BitVec 32) (_ BitVec 32) V!45829 V!45829 (_ BitVec 32) Int) ListLongMap!17581)

(assert (=> bm!57295 (= call!57299 (getCurrentListMapNoExtraKeys!5245 lt!544080 lt!544081 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200544 () Bool)

(declare-fun e!681774 () Bool)

(assert (=> b!1200544 (= e!681772 (not e!681774))))

(declare-fun res!799169 () Bool)

(assert (=> b!1200544 (=> res!799169 e!681774)))

(assert (=> b!1200544 (= res!799169 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200544 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!544076 () Unit!39804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77827 (_ BitVec 64) (_ BitVec 32)) Unit!39804)

(assert (=> b!1200544 (= lt!544076 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1200545 () Bool)

(assert (=> b!1200545 (= e!681774 e!681776)))

(declare-fun res!799176 () Bool)

(assert (=> b!1200545 (=> res!799176 e!681776)))

(assert (=> b!1200545 (= res!799176 (not (= from!1455 i!673)))))

(declare-fun lt!544079 () ListLongMap!17581)

(assert (=> b!1200545 (= lt!544079 (getCurrentListMapNoExtraKeys!5245 lt!544080 lt!544081 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3165 (Int (_ BitVec 64)) V!45829)

(assert (=> b!1200545 (= lt!544081 (array!77830 (store (arr!37559 _values!996) i!673 (ValueCellFull!14554 (dynLambda!3165 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38095 _values!996)))))

(declare-fun lt!544078 () ListLongMap!17581)

(assert (=> b!1200545 (= lt!544078 (getCurrentListMapNoExtraKeys!5245 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200546 () Bool)

(declare-fun res!799170 () Bool)

(assert (=> b!1200546 (=> (not res!799170) (not e!681770))))

(assert (=> b!1200546 (= res!799170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200547 () Bool)

(assert (=> b!1200547 (= e!681777 (and e!681773 mapRes!47633))))

(declare-fun condMapEmpty!47633 () Bool)

(declare-fun mapDefault!47633 () ValueCell!14554)

