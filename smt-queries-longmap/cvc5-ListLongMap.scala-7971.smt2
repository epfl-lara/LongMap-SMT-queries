; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98666 () Bool)

(assert start!98666)

(declare-fun b_free!24271 () Bool)

(declare-fun b_next!24271 () Bool)

(assert (=> start!98666 (= b_free!24271 (not b_next!24271))))

(declare-fun tp!85523 () Bool)

(declare-fun b_and!39391 () Bool)

(assert (=> start!98666 (= tp!85523 b_and!39391)))

(declare-fun mapNonEmpty!45026 () Bool)

(declare-fun mapRes!45026 () Bool)

(declare-fun tp!85524 () Bool)

(declare-fun e!652698 () Bool)

(assert (=> mapNonEmpty!45026 (= mapRes!45026 (and tp!85524 e!652698))))

(declare-datatypes ((V!43529 0))(
  ( (V!43530 (val!14457 Int)) )
))
(declare-datatypes ((ValueCell!13691 0))(
  ( (ValueCellFull!13691 (v!17094 V!43529)) (EmptyCell!13691) )
))
(declare-fun mapRest!45026 () (Array (_ BitVec 32) ValueCell!13691))

(declare-fun mapValue!45026 () ValueCell!13691)

(declare-fun mapKey!45026 () (_ BitVec 32))

(declare-datatypes ((array!74449 0))(
  ( (array!74450 (arr!35875 (Array (_ BitVec 32) ValueCell!13691)) (size!36411 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74449)

(assert (=> mapNonEmpty!45026 (= (arr!35875 _values!996) (store mapRest!45026 mapKey!45026 mapValue!45026))))

(declare-fun b!1147478 () Bool)

(declare-fun e!652697 () Bool)

(declare-fun tp_is_empty!28801 () Bool)

(assert (=> b!1147478 (= e!652697 tp_is_empty!28801)))

(declare-fun b!1147479 () Bool)

(declare-datatypes ((Unit!37692 0))(
  ( (Unit!37693) )
))
(declare-fun e!652704 () Unit!37692)

(declare-fun Unit!37694 () Unit!37692)

(assert (=> b!1147479 (= e!652704 Unit!37694)))

(declare-fun b!1147480 () Bool)

(assert (=> b!1147480 (= e!652698 tp_is_empty!28801)))

(declare-datatypes ((tuple2!18326 0))(
  ( (tuple2!18327 (_1!9174 (_ BitVec 64)) (_2!9174 V!43529)) )
))
(declare-datatypes ((List!25077 0))(
  ( (Nil!25074) (Cons!25073 (h!26282 tuple2!18326) (t!36340 List!25077)) )
))
(declare-datatypes ((ListLongMap!16295 0))(
  ( (ListLongMap!16296 (toList!8163 List!25077)) )
))
(declare-fun lt!512734 () ListLongMap!16295)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!512737 () ListLongMap!16295)

(declare-fun b!1147481 () Bool)

(declare-fun e!652708 () Bool)

(declare-fun -!1299 (ListLongMap!16295 (_ BitVec 64)) ListLongMap!16295)

(assert (=> b!1147481 (= e!652708 (= (-!1299 lt!512734 k!934) lt!512737))))

(declare-fun bm!52791 () Bool)

(declare-fun call!52801 () Bool)

(declare-fun lt!512736 () ListLongMap!16295)

(declare-fun c!113302 () Bool)

(declare-fun call!52796 () ListLongMap!16295)

(declare-fun contains!6686 (ListLongMap!16295 (_ BitVec 64)) Bool)

(assert (=> bm!52791 (= call!52801 (contains!6686 (ite c!113302 lt!512736 call!52796) k!934))))

(declare-fun b!1147483 () Bool)

(declare-fun e!652709 () Bool)

(declare-fun e!652703 () Bool)

(assert (=> b!1147483 (= e!652709 e!652703)))

(declare-fun res!763767 () Bool)

(assert (=> b!1147483 (=> res!763767 e!652703)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147483 (= res!763767 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43529)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!512745 () ListLongMap!16295)

(declare-fun lt!512731 () array!74449)

(declare-datatypes ((array!74451 0))(
  ( (array!74452 (arr!35876 (Array (_ BitVec 32) (_ BitVec 64))) (size!36412 (_ BitVec 32))) )
))
(declare-fun lt!512735 () array!74451)

(declare-fun minValue!944 () V!43529)

(declare-fun getCurrentListMapNoExtraKeys!4637 (array!74451 array!74449 (_ BitVec 32) (_ BitVec 32) V!43529 V!43529 (_ BitVec 32) Int) ListLongMap!16295)

(assert (=> b!1147483 (= lt!512745 (getCurrentListMapNoExtraKeys!4637 lt!512735 lt!512731 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!512746 () V!43529)

(assert (=> b!1147483 (= lt!512731 (array!74450 (store (arr!35875 _values!996) i!673 (ValueCellFull!13691 lt!512746)) (size!36411 _values!996)))))

(declare-fun dynLambda!2667 (Int (_ BitVec 64)) V!43529)

(assert (=> b!1147483 (= lt!512746 (dynLambda!2667 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74451)

(assert (=> b!1147483 (= lt!512734 (getCurrentListMapNoExtraKeys!4637 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147484 () Bool)

(declare-fun e!652707 () Unit!37692)

(declare-fun lt!512743 () Unit!37692)

(assert (=> b!1147484 (= e!652707 lt!512743)))

(declare-fun call!52794 () Unit!37692)

(assert (=> b!1147484 (= lt!512743 call!52794)))

(declare-fun call!52797 () Bool)

(assert (=> b!1147484 call!52797))

(declare-fun b!1147485 () Bool)

(declare-fun res!763775 () Bool)

(declare-fun e!652699 () Bool)

(assert (=> b!1147485 (=> (not res!763775) (not e!652699))))

(assert (=> b!1147485 (= res!763775 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36412 _keys!1208))))))

(declare-fun b!1147486 () Bool)

(declare-fun e!652702 () Bool)

(assert (=> b!1147486 (= e!652702 true)))

(assert (=> b!1147486 e!652708))

(declare-fun res!763769 () Bool)

(assert (=> b!1147486 (=> (not res!763769) (not e!652708))))

(declare-fun lt!512728 () V!43529)

(declare-fun +!3586 (ListLongMap!16295 tuple2!18326) ListLongMap!16295)

(assert (=> b!1147486 (= res!763769 (= (-!1299 (+!3586 lt!512737 (tuple2!18327 (select (arr!35876 _keys!1208) from!1455) lt!512728)) (select (arr!35876 _keys!1208) from!1455)) lt!512737))))

(declare-fun lt!512741 () Unit!37692)

(declare-fun addThenRemoveForNewKeyIsSame!147 (ListLongMap!16295 (_ BitVec 64) V!43529) Unit!37692)

(assert (=> b!1147486 (= lt!512741 (addThenRemoveForNewKeyIsSame!147 lt!512737 (select (arr!35876 _keys!1208) from!1455) lt!512728))))

(declare-fun get!18251 (ValueCell!13691 V!43529) V!43529)

(assert (=> b!1147486 (= lt!512728 (get!18251 (select (arr!35875 _values!996) from!1455) lt!512746))))

(declare-fun lt!512748 () Unit!37692)

(assert (=> b!1147486 (= lt!512748 e!652704)))

(declare-fun c!113300 () Bool)

(assert (=> b!1147486 (= c!113300 (contains!6686 lt!512737 k!934))))

(assert (=> b!1147486 (= lt!512737 (getCurrentListMapNoExtraKeys!4637 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147487 () Bool)

(declare-fun res!763770 () Bool)

(assert (=> b!1147487 (=> (not res!763770) (not e!652699))))

(declare-datatypes ((List!25078 0))(
  ( (Nil!25075) (Cons!25074 (h!26283 (_ BitVec 64)) (t!36341 List!25078)) )
))
(declare-fun arrayNoDuplicates!0 (array!74451 (_ BitVec 32) List!25078) Bool)

(assert (=> b!1147487 (= res!763770 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25075))))

(declare-fun b!1147488 () Bool)

(declare-fun e!652710 () Unit!37692)

(declare-fun Unit!37695 () Unit!37692)

(assert (=> b!1147488 (= e!652710 Unit!37695)))

(declare-fun b!1147489 () Bool)

(declare-fun res!763768 () Bool)

(assert (=> b!1147489 (=> (not res!763768) (not e!652699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74451 (_ BitVec 32)) Bool)

(assert (=> b!1147489 (= res!763768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1147490 () Bool)

(declare-fun e!652694 () Bool)

(declare-fun call!52800 () ListLongMap!16295)

(declare-fun call!52799 () ListLongMap!16295)

(assert (=> b!1147490 (= e!652694 (= call!52800 call!52799))))

(declare-fun b!1147491 () Bool)

(declare-fun e!652706 () Bool)

(assert (=> b!1147491 (= e!652706 (and e!652697 mapRes!45026))))

(declare-fun condMapEmpty!45026 () Bool)

(declare-fun mapDefault!45026 () ValueCell!13691)

