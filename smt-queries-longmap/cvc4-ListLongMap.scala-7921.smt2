; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98370 () Bool)

(assert start!98370)

(declare-fun b_free!23975 () Bool)

(declare-fun b_next!23975 () Bool)

(assert (=> start!98370 (= b_free!23975 (not b_next!23975))))

(declare-fun tp!84635 () Bool)

(declare-fun b_and!38799 () Bool)

(assert (=> start!98370 (= tp!84635 b_and!38799)))

(declare-datatypes ((V!43133 0))(
  ( (V!43134 (val!14309 Int)) )
))
(declare-fun zeroValue!944 () V!43133)

(declare-datatypes ((tuple2!18050 0))(
  ( (tuple2!18051 (_1!9036 (_ BitVec 64)) (_2!9036 V!43133)) )
))
(declare-datatypes ((List!24810 0))(
  ( (Nil!24807) (Cons!24806 (h!26015 tuple2!18050) (t!35777 List!24810)) )
))
(declare-datatypes ((ListLongMap!16019 0))(
  ( (ListLongMap!16020 (toList!8025 List!24810)) )
))
(declare-fun lt!504006 () ListLongMap!16019)

(declare-fun c!110716 () Bool)

(declare-fun bm!49239 () Bool)

(declare-fun lt!504009 () ListLongMap!16019)

(declare-fun call!49246 () ListLongMap!16019)

(declare-fun c!110718 () Bool)

(declare-fun minValue!944 () V!43133)

(declare-fun +!3465 (ListLongMap!16019 tuple2!18050) ListLongMap!16019)

(assert (=> bm!49239 (= call!49246 (+!3465 (ite c!110718 lt!504006 lt!504009) (ite c!110718 (tuple2!18051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110716 (tuple2!18051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapNonEmpty!44582 () Bool)

(declare-fun mapRes!44582 () Bool)

(declare-fun tp!84636 () Bool)

(declare-fun e!645412 () Bool)

(assert (=> mapNonEmpty!44582 (= mapRes!44582 (and tp!84636 e!645412))))

(declare-fun mapKey!44582 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13543 0))(
  ( (ValueCellFull!13543 (v!16946 V!43133)) (EmptyCell!13543) )
))
(declare-datatypes ((array!73871 0))(
  ( (array!73872 (arr!35586 (Array (_ BitVec 32) ValueCell!13543)) (size!36122 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73871)

(declare-fun mapRest!44582 () (Array (_ BitVec 32) ValueCell!13543))

(declare-fun mapValue!44582 () ValueCell!13543)

(assert (=> mapNonEmpty!44582 (= (arr!35586 _values!996) (store mapRest!44582 mapKey!44582 mapValue!44582))))

(declare-fun b!1134035 () Bool)

(declare-fun e!645404 () Bool)

(declare-fun tp_is_empty!28505 () Bool)

(assert (=> b!1134035 (= e!645404 tp_is_empty!28505)))

(declare-fun b!1134036 () Bool)

(declare-fun e!645399 () Bool)

(declare-fun e!645410 () Bool)

(assert (=> b!1134036 (= e!645399 e!645410)))

(declare-fun res!757122 () Bool)

(assert (=> b!1134036 (=> (not res!757122) (not e!645410))))

(declare-datatypes ((array!73873 0))(
  ( (array!73874 (arr!35587 (Array (_ BitVec 32) (_ BitVec 64))) (size!36123 (_ BitVec 32))) )
))
(declare-fun lt!504005 () array!73873)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73873 (_ BitVec 32)) Bool)

(assert (=> b!1134036 (= res!757122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504005 mask!1564))))

(declare-fun _keys!1208 () array!73873)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134036 (= lt!504005 (array!73874 (store (arr!35587 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36123 _keys!1208)))))

(declare-fun b!1134037 () Bool)

(declare-fun c!110717 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!504004 () Bool)

(assert (=> b!1134037 (= c!110717 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504004))))

(declare-datatypes ((Unit!37158 0))(
  ( (Unit!37159) )
))
(declare-fun e!645414 () Unit!37158)

(declare-fun e!645406 () Unit!37158)

(assert (=> b!1134037 (= e!645414 e!645406)))

(declare-fun bm!49240 () Bool)

(declare-fun call!49247 () ListLongMap!16019)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4511 (array!73873 array!73871 (_ BitVec 32) (_ BitVec 32) V!43133 V!43133 (_ BitVec 32) Int) ListLongMap!16019)

(assert (=> bm!49240 (= call!49247 (getCurrentListMapNoExtraKeys!4511 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134038 () Bool)

(declare-fun res!757118 () Bool)

(assert (=> b!1134038 (=> (not res!757118) (not e!645399))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134038 (= res!757118 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!44582 () Bool)

(assert (=> mapIsEmpty!44582 mapRes!44582))

(declare-fun b!1134039 () Bool)

(declare-fun e!645411 () Bool)

(assert (=> b!1134039 (= e!645411 (and e!645404 mapRes!44582))))

(declare-fun condMapEmpty!44582 () Bool)

(declare-fun mapDefault!44582 () ValueCell!13543)

