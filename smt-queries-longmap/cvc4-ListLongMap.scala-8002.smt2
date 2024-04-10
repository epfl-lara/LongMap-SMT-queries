; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98856 () Bool)

(assert start!98856)

(declare-fun b_free!24461 () Bool)

(declare-fun b_next!24461 () Bool)

(assert (=> start!98856 (= b_free!24461 (not b_next!24461))))

(declare-fun tp!86093 () Bool)

(declare-fun b_and!39771 () Bool)

(assert (=> start!98856 (= tp!86093 b_and!39771)))

(declare-fun mapNonEmpty!45311 () Bool)

(declare-fun mapRes!45311 () Bool)

(declare-fun tp!86094 () Bool)

(declare-fun e!657550 () Bool)

(assert (=> mapNonEmpty!45311 (= mapRes!45311 (and tp!86094 e!657550))))

(declare-datatypes ((V!43781 0))(
  ( (V!43782 (val!14552 Int)) )
))
(declare-datatypes ((ValueCell!13786 0))(
  ( (ValueCellFull!13786 (v!17189 V!43781)) (EmptyCell!13786) )
))
(declare-fun mapRest!45311 () (Array (_ BitVec 32) ValueCell!13786))

(declare-datatypes ((array!74829 0))(
  ( (array!74830 (arr!36065 (Array (_ BitVec 32) ValueCell!13786)) (size!36601 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74829)

(declare-fun mapKey!45311 () (_ BitVec 32))

(declare-fun mapValue!45311 () ValueCell!13786)

(assert (=> mapNonEmpty!45311 (= (arr!36065 _values!996) (store mapRest!45311 mapKey!45311 mapValue!45311))))

(declare-datatypes ((array!74831 0))(
  ( (array!74832 (arr!36066 (Array (_ BitVec 32) (_ BitVec 64))) (size!36602 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74831)

(declare-fun e!657540 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1156218 () Bool)

(declare-fun arrayContainsKey!0 (array!74831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156218 (= e!657540 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156219 () Bool)

(declare-fun res!768049 () Bool)

(declare-fun e!657547 () Bool)

(assert (=> b!1156219 (=> (not res!768049) (not e!657547))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156219 (= res!768049 (validMask!0 mask!1564))))

(declare-fun b!1156220 () Bool)

(declare-fun res!768046 () Bool)

(assert (=> b!1156220 (=> (not res!768046) (not e!657547))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1156220 (= res!768046 (= (select (arr!36066 _keys!1208) i!673) k!934))))

(declare-fun b!1156221 () Bool)

(declare-datatypes ((Unit!38086 0))(
  ( (Unit!38087) )
))
(declare-fun e!657552 () Unit!38086)

(declare-fun Unit!38088 () Unit!38086)

(assert (=> b!1156221 (= e!657552 Unit!38088)))

(declare-fun res!768040 () Bool)

(assert (=> start!98856 (=> (not res!768040) (not e!657547))))

(assert (=> start!98856 (= res!768040 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36602 _keys!1208))))))

(assert (=> start!98856 e!657547))

(declare-fun tp_is_empty!28991 () Bool)

(assert (=> start!98856 tp_is_empty!28991))

(declare-fun array_inv!27604 (array!74831) Bool)

(assert (=> start!98856 (array_inv!27604 _keys!1208)))

(assert (=> start!98856 true))

(assert (=> start!98856 tp!86093))

(declare-fun e!657554 () Bool)

(declare-fun array_inv!27605 (array!74829) Bool)

(assert (=> start!98856 (and (array_inv!27605 _values!996) e!657554)))

(declare-fun zeroValue!944 () V!43781)

(declare-fun bm!55071 () Bool)

(declare-fun c!115009 () Bool)

(declare-fun c!115007 () Bool)

(declare-datatypes ((tuple2!18512 0))(
  ( (tuple2!18513 (_1!9267 (_ BitVec 64)) (_2!9267 V!43781)) )
))
(declare-datatypes ((List!25255 0))(
  ( (Nil!25252) (Cons!25251 (h!26460 tuple2!18512) (t!36708 List!25255)) )
))
(declare-datatypes ((ListLongMap!16481 0))(
  ( (ListLongMap!16482 (toList!8256 List!25255)) )
))
(declare-fun call!55079 () ListLongMap!16481)

(declare-fun lt!518958 () ListLongMap!16481)

(declare-fun minValue!944 () V!43781)

(declare-fun +!3669 (ListLongMap!16481 tuple2!18512) ListLongMap!16481)

(assert (=> bm!55071 (= call!55079 (+!3669 lt!518958 (ite (or c!115007 c!115009) (tuple2!18513 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18513 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1156222 () Bool)

(declare-fun e!657548 () Bool)

(declare-fun e!657546 () Bool)

(assert (=> b!1156222 (= e!657548 e!657546)))

(declare-fun res!768051 () Bool)

(assert (=> b!1156222 (=> res!768051 e!657546)))

(assert (=> b!1156222 (= res!768051 (not (= from!1455 i!673)))))

(declare-fun lt!518953 () array!74829)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!518952 () array!74831)

(declare-fun lt!518948 () ListLongMap!16481)

(declare-fun getCurrentListMapNoExtraKeys!4725 (array!74831 array!74829 (_ BitVec 32) (_ BitVec 32) V!43781 V!43781 (_ BitVec 32) Int) ListLongMap!16481)

(assert (=> b!1156222 (= lt!518948 (getCurrentListMapNoExtraKeys!4725 lt!518952 lt!518953 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518963 () V!43781)

(assert (=> b!1156222 (= lt!518953 (array!74830 (store (arr!36065 _values!996) i!673 (ValueCellFull!13786 lt!518963)) (size!36601 _values!996)))))

(declare-fun dynLambda!2733 (Int (_ BitVec 64)) V!43781)

(assert (=> b!1156222 (= lt!518963 (dynLambda!2733 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!518959 () ListLongMap!16481)

(assert (=> b!1156222 (= lt!518959 (getCurrentListMapNoExtraKeys!4725 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1156223 () Bool)

(declare-fun res!768042 () Bool)

(assert (=> b!1156223 (=> (not res!768042) (not e!657547))))

(assert (=> b!1156223 (= res!768042 (and (= (size!36601 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36602 _keys!1208) (size!36601 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!55072 () Bool)

(declare-fun lt!518947 () ListLongMap!16481)

(declare-fun call!55075 () Bool)

(declare-fun call!55077 () ListLongMap!16481)

(declare-fun contains!6768 (ListLongMap!16481 (_ BitVec 64)) Bool)

(assert (=> bm!55072 (= call!55075 (contains!6768 (ite c!115007 lt!518947 call!55077) k!934))))

(declare-fun call!55076 () ListLongMap!16481)

(declare-fun bm!55073 () Bool)

(assert (=> bm!55073 (= call!55076 (getCurrentListMapNoExtraKeys!4725 lt!518952 lt!518953 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156224 () Bool)

(declare-fun res!768039 () Bool)

(assert (=> b!1156224 (=> (not res!768039) (not e!657547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74831 (_ BitVec 32)) Bool)

(assert (=> b!1156224 (= res!768039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1156225 () Bool)

(declare-fun e!657551 () Unit!38086)

(declare-fun lt!518964 () Unit!38086)

(assert (=> b!1156225 (= e!657551 lt!518964)))

(declare-fun call!55080 () Unit!38086)

(assert (=> b!1156225 (= lt!518964 call!55080)))

(declare-fun call!55074 () Bool)

(assert (=> b!1156225 call!55074))

(declare-fun b!1156226 () Bool)

(declare-fun e!657553 () Bool)

(assert (=> b!1156226 (= e!657554 (and e!657553 mapRes!45311))))

(declare-fun condMapEmpty!45311 () Bool)

(declare-fun mapDefault!45311 () ValueCell!13786)

