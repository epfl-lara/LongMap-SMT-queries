; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98708 () Bool)

(assert start!98708)

(declare-fun b_free!24313 () Bool)

(declare-fun b_next!24313 () Bool)

(assert (=> start!98708 (= b_free!24313 (not b_next!24313))))

(declare-fun tp!85649 () Bool)

(declare-fun b_and!39475 () Bool)

(assert (=> start!98708 (= tp!85649 b_and!39475)))

(declare-fun b!1149410 () Bool)

(declare-fun e!653780 () Bool)

(declare-fun e!653773 () Bool)

(assert (=> b!1149410 (= e!653780 e!653773)))

(declare-fun res!764713 () Bool)

(assert (=> b!1149410 (=> res!764713 e!653773)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149410 (= res!764713 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!43585 0))(
  ( (V!43586 (val!14478 Int)) )
))
(declare-datatypes ((ValueCell!13712 0))(
  ( (ValueCellFull!13712 (v!17115 V!43585)) (EmptyCell!13712) )
))
(declare-datatypes ((array!74533 0))(
  ( (array!74534 (arr!35917 (Array (_ BitVec 32) ValueCell!13712)) (size!36453 (_ BitVec 32))) )
))
(declare-fun lt!514078 () array!74533)

(declare-fun minValue!944 () V!43585)

(declare-fun zeroValue!944 () V!43585)

(declare-datatypes ((tuple2!18368 0))(
  ( (tuple2!18369 (_1!9195 (_ BitVec 64)) (_2!9195 V!43585)) )
))
(declare-datatypes ((List!25118 0))(
  ( (Nil!25115) (Cons!25114 (h!26323 tuple2!18368) (t!36423 List!25118)) )
))
(declare-datatypes ((ListLongMap!16337 0))(
  ( (ListLongMap!16338 (toList!8184 List!25118)) )
))
(declare-fun lt!514075 () ListLongMap!16337)

(declare-datatypes ((array!74535 0))(
  ( (array!74536 (arr!35918 (Array (_ BitVec 32) (_ BitVec 64))) (size!36454 (_ BitVec 32))) )
))
(declare-fun lt!514079 () array!74535)

(declare-fun getCurrentListMapNoExtraKeys!4657 (array!74535 array!74533 (_ BitVec 32) (_ BitVec 32) V!43585 V!43585 (_ BitVec 32) Int) ListLongMap!16337)

(assert (=> b!1149410 (= lt!514075 (getCurrentListMapNoExtraKeys!4657 lt!514079 lt!514078 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!514076 () V!43585)

(declare-fun _values!996 () array!74533)

(assert (=> b!1149410 (= lt!514078 (array!74534 (store (arr!35917 _values!996) i!673 (ValueCellFull!13712 lt!514076)) (size!36453 _values!996)))))

(declare-fun dynLambda!2682 (Int (_ BitVec 64)) V!43585)

(assert (=> b!1149410 (= lt!514076 (dynLambda!2682 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74535)

(declare-fun lt!514071 () ListLongMap!16337)

(assert (=> b!1149410 (= lt!514071 (getCurrentListMapNoExtraKeys!4657 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!53295 () Bool)

(declare-fun call!53299 () ListLongMap!16337)

(assert (=> bm!53295 (= call!53299 (getCurrentListMapNoExtraKeys!4657 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149411 () Bool)

(declare-fun e!653781 () Bool)

(assert (=> b!1149411 (= e!653781 (not e!653780))))

(declare-fun res!764716 () Bool)

(assert (=> b!1149411 (=> res!764716 e!653780)))

(assert (=> b!1149411 (= res!764716 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149411 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37785 0))(
  ( (Unit!37786) )
))
(declare-fun lt!514081 () Unit!37785)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74535 (_ BitVec 64) (_ BitVec 32)) Unit!37785)

(assert (=> b!1149411 (= lt!514081 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1149412 () Bool)

(declare-fun res!764715 () Bool)

(declare-fun e!653769 () Bool)

(assert (=> b!1149412 (=> (not res!764715) (not e!653769))))

(assert (=> b!1149412 (= res!764715 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36454 _keys!1208))))))

(declare-fun b!1149413 () Bool)

(declare-fun res!764712 () Bool)

(assert (=> b!1149413 (=> (not res!764712) (not e!653769))))

(assert (=> b!1149413 (= res!764712 (and (= (size!36453 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36454 _keys!1208) (size!36453 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!653774 () Bool)

(declare-fun b!1149414 () Bool)

(assert (=> b!1149414 (= e!653774 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!53302 () ListLongMap!16337)

(declare-fun bm!53296 () Bool)

(assert (=> bm!53296 (= call!53302 (getCurrentListMapNoExtraKeys!4657 lt!514079 lt!514078 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45089 () Bool)

(declare-fun mapRes!45089 () Bool)

(declare-fun tp!85650 () Bool)

(declare-fun e!653767 () Bool)

(assert (=> mapNonEmpty!45089 (= mapRes!45089 (and tp!85650 e!653767))))

(declare-fun mapValue!45089 () ValueCell!13712)

(declare-fun mapKey!45089 () (_ BitVec 32))

(declare-fun mapRest!45089 () (Array (_ BitVec 32) ValueCell!13712))

(assert (=> mapNonEmpty!45089 (= (arr!35917 _values!996) (store mapRest!45089 mapKey!45089 mapValue!45089))))

(declare-fun b!1149415 () Bool)

(declare-fun lt!514080 () Bool)

(assert (=> b!1149415 (= e!653774 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514080) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1149416 () Bool)

(declare-fun e!653775 () Bool)

(declare-fun e!653776 () Bool)

(assert (=> b!1149416 (= e!653775 (and e!653776 mapRes!45089))))

(declare-fun condMapEmpty!45089 () Bool)

(declare-fun mapDefault!45089 () ValueCell!13712)

