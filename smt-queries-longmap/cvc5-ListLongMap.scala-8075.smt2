; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99316 () Bool)

(assert start!99316)

(declare-fun b_free!24895 () Bool)

(declare-fun b_next!24895 () Bool)

(assert (=> start!99316 (= b_free!24895 (not b_next!24895))))

(declare-fun tp!87398 () Bool)

(declare-fun b_and!40657 () Bool)

(assert (=> start!99316 (= tp!87398 b_and!40657)))

(declare-fun b!1170543 () Bool)

(declare-fun e!665307 () Bool)

(declare-fun e!665309 () Bool)

(assert (=> b!1170543 (= e!665307 (not e!665309))))

(declare-fun res!776858 () Bool)

(assert (=> b!1170543 (=> res!776858 e!665309)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170543 (= res!776858 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75669 0))(
  ( (array!75670 (arr!36484 (Array (_ BitVec 32) (_ BitVec 64))) (size!37020 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75669)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170543 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38616 0))(
  ( (Unit!38617) )
))
(declare-fun lt!527200 () Unit!38616)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75669 (_ BitVec 64) (_ BitVec 32)) Unit!38616)

(assert (=> b!1170543 (= lt!527200 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1170544 () Bool)

(declare-fun res!776863 () Bool)

(declare-fun e!665316 () Bool)

(assert (=> b!1170544 (=> (not res!776863) (not e!665316))))

(assert (=> b!1170544 (= res!776863 (= (select (arr!36484 _keys!1208) i!673) k!934))))

(declare-fun b!1170546 () Bool)

(declare-fun e!665308 () Bool)

(assert (=> b!1170546 (= e!665308 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1170547 () Bool)

(declare-fun res!776871 () Bool)

(assert (=> b!1170547 (=> (not res!776871) (not e!665316))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75669 (_ BitVec 32)) Bool)

(assert (=> b!1170547 (= res!776871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170548 () Bool)

(declare-fun e!665312 () Bool)

(assert (=> b!1170548 (= e!665312 true)))

(assert (=> b!1170548 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527198 () Unit!38616)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75669 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38616)

(assert (=> b!1170548 (= lt!527198 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170549 () Bool)

(declare-fun res!776859 () Bool)

(assert (=> b!1170549 (=> (not res!776859) (not e!665316))))

(assert (=> b!1170549 (= res!776859 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37020 _keys!1208))))))

(declare-fun b!1170550 () Bool)

(declare-fun res!776866 () Bool)

(assert (=> b!1170550 (=> (not res!776866) (not e!665316))))

(declare-datatypes ((List!25598 0))(
  ( (Nil!25595) (Cons!25594 (h!26803 (_ BitVec 64)) (t!37485 List!25598)) )
))
(declare-fun arrayNoDuplicates!0 (array!75669 (_ BitVec 32) List!25598) Bool)

(assert (=> b!1170550 (= res!776866 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25595))))

(declare-fun b!1170551 () Bool)

(declare-fun e!665315 () Bool)

(assert (=> b!1170551 (= e!665315 e!665308)))

(declare-fun res!776872 () Bool)

(assert (=> b!1170551 (=> res!776872 e!665308)))

(assert (=> b!1170551 (= res!776872 (not (= (select (arr!36484 _keys!1208) from!1455) k!934)))))

(declare-fun b!1170552 () Bool)

(declare-fun res!776861 () Bool)

(assert (=> b!1170552 (=> (not res!776861) (not e!665307))))

(declare-fun lt!527197 () array!75669)

(assert (=> b!1170552 (= res!776861 (arrayNoDuplicates!0 lt!527197 #b00000000000000000000000000000000 Nil!25595))))

(declare-fun mapIsEmpty!45965 () Bool)

(declare-fun mapRes!45965 () Bool)

(assert (=> mapIsEmpty!45965 mapRes!45965))

(declare-fun mapNonEmpty!45965 () Bool)

(declare-fun tp!87399 () Bool)

(declare-fun e!665306 () Bool)

(assert (=> mapNonEmpty!45965 (= mapRes!45965 (and tp!87399 e!665306))))

(declare-datatypes ((V!44361 0))(
  ( (V!44362 (val!14769 Int)) )
))
(declare-datatypes ((ValueCell!14003 0))(
  ( (ValueCellFull!14003 (v!17407 V!44361)) (EmptyCell!14003) )
))
(declare-fun mapValue!45965 () ValueCell!14003)

(declare-fun mapKey!45965 () (_ BitVec 32))

(declare-fun mapRest!45965 () (Array (_ BitVec 32) ValueCell!14003))

(declare-datatypes ((array!75671 0))(
  ( (array!75672 (arr!36485 (Array (_ BitVec 32) ValueCell!14003)) (size!37021 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75671)

(assert (=> mapNonEmpty!45965 (= (arr!36485 _values!996) (store mapRest!45965 mapKey!45965 mapValue!45965))))

(declare-fun b!1170553 () Bool)

(declare-fun e!665310 () Bool)

(declare-fun e!665311 () Bool)

(assert (=> b!1170553 (= e!665310 e!665311)))

(declare-fun res!776868 () Bool)

(assert (=> b!1170553 (=> res!776868 e!665311)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170553 (= res!776868 (not (validKeyInArray!0 (select (arr!36484 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18862 0))(
  ( (tuple2!18863 (_1!9442 (_ BitVec 64)) (_2!9442 V!44361)) )
))
(declare-datatypes ((List!25599 0))(
  ( (Nil!25596) (Cons!25595 (h!26804 tuple2!18862) (t!37486 List!25599)) )
))
(declare-datatypes ((ListLongMap!16831 0))(
  ( (ListLongMap!16832 (toList!8431 List!25599)) )
))
(declare-fun lt!527201 () ListLongMap!16831)

(declare-fun lt!527192 () ListLongMap!16831)

(assert (=> b!1170553 (= lt!527201 lt!527192)))

(declare-fun lt!527202 () ListLongMap!16831)

(declare-fun -!1501 (ListLongMap!16831 (_ BitVec 64)) ListLongMap!16831)

(assert (=> b!1170553 (= lt!527192 (-!1501 lt!527202 k!934))))

(declare-fun zeroValue!944 () V!44361)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527195 () array!75671)

(declare-fun minValue!944 () V!44361)

(declare-fun getCurrentListMapNoExtraKeys!4895 (array!75669 array!75671 (_ BitVec 32) (_ BitVec 32) V!44361 V!44361 (_ BitVec 32) Int) ListLongMap!16831)

(assert (=> b!1170553 (= lt!527201 (getCurrentListMapNoExtraKeys!4895 lt!527197 lt!527195 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170553 (= lt!527202 (getCurrentListMapNoExtraKeys!4895 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527196 () Unit!38616)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!728 (array!75669 array!75671 (_ BitVec 32) (_ BitVec 32) V!44361 V!44361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38616)

(assert (=> b!1170553 (= lt!527196 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!728 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170554 () Bool)

(declare-fun e!665314 () Bool)

(declare-fun tp_is_empty!29425 () Bool)

(assert (=> b!1170554 (= e!665314 tp_is_empty!29425)))

(declare-fun b!1170555 () Bool)

(assert (=> b!1170555 (= e!665311 e!665312)))

(declare-fun res!776862 () Bool)

(assert (=> b!1170555 (=> res!776862 e!665312)))

(assert (=> b!1170555 (= res!776862 (not (= (select (arr!36484 _keys!1208) from!1455) k!934)))))

(assert (=> b!1170555 e!665315))

(declare-fun res!776857 () Bool)

(assert (=> b!1170555 (=> (not res!776857) (not e!665315))))

(declare-fun lt!527194 () V!44361)

(declare-fun lt!527193 () ListLongMap!16831)

(declare-fun +!3759 (ListLongMap!16831 tuple2!18862) ListLongMap!16831)

(declare-fun get!18605 (ValueCell!14003 V!44361) V!44361)

(assert (=> b!1170555 (= res!776857 (= lt!527193 (+!3759 lt!527192 (tuple2!18863 (select (arr!36484 _keys!1208) from!1455) (get!18605 (select (arr!36485 _values!996) from!1455) lt!527194)))))))

(declare-fun b!1170556 () Bool)

(declare-fun res!776860 () Bool)

(assert (=> b!1170556 (=> (not res!776860) (not e!665316))))

(assert (=> b!1170556 (= res!776860 (and (= (size!37021 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37020 _keys!1208) (size!37021 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170557 () Bool)

(declare-fun res!776869 () Bool)

(assert (=> b!1170557 (=> (not res!776869) (not e!665316))))

(assert (=> b!1170557 (= res!776869 (validKeyInArray!0 k!934))))

(declare-fun b!1170545 () Bool)

(declare-fun e!665313 () Bool)

(assert (=> b!1170545 (= e!665313 (and e!665314 mapRes!45965))))

(declare-fun condMapEmpty!45965 () Bool)

(declare-fun mapDefault!45965 () ValueCell!14003)

