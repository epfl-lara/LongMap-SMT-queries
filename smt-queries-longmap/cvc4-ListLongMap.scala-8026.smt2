; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99000 () Bool)

(assert start!99000)

(declare-fun b_free!24605 () Bool)

(declare-fun b_next!24605 () Bool)

(assert (=> start!99000 (= b_free!24605 (not b_next!24605))))

(declare-fun tp!86525 () Bool)

(declare-fun b_and!40059 () Bool)

(assert (=> start!99000 (= tp!86525 b_and!40059)))

(declare-fun b!1162842 () Bool)

(declare-fun res!771283 () Bool)

(declare-fun e!661214 () Bool)

(assert (=> b!1162842 (=> (not res!771283) (not e!661214))))

(declare-datatypes ((array!75109 0))(
  ( (array!75110 (arr!36205 (Array (_ BitVec 32) (_ BitVec 64))) (size!36741 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75109)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1162842 (= res!771283 (= (select (arr!36205 _keys!1208) i!673) k!934))))

(declare-datatypes ((V!43973 0))(
  ( (V!43974 (val!14624 Int)) )
))
(declare-fun zeroValue!944 () V!43973)

(declare-fun b!1162843 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!661212 () Bool)

(declare-fun lt!523719 () array!75109)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13858 0))(
  ( (ValueCellFull!13858 (v!17261 V!43973)) (EmptyCell!13858) )
))
(declare-datatypes ((array!75111 0))(
  ( (array!75112 (arr!36206 (Array (_ BitVec 32) ValueCell!13858)) (size!36742 (_ BitVec 32))) )
))
(declare-fun lt!523699 () array!75111)

(declare-datatypes ((tuple2!18644 0))(
  ( (tuple2!18645 (_1!9333 (_ BitVec 64)) (_2!9333 V!43973)) )
))
(declare-datatypes ((List!25378 0))(
  ( (Nil!25375) (Cons!25374 (h!26583 tuple2!18644) (t!36975 List!25378)) )
))
(declare-datatypes ((ListLongMap!16613 0))(
  ( (ListLongMap!16614 (toList!8322 List!25378)) )
))
(declare-fun lt!523705 () ListLongMap!16613)

(declare-fun minValue!944 () V!43973)

(declare-fun getCurrentListMapNoExtraKeys!4786 (array!75109 array!75111 (_ BitVec 32) (_ BitVec 32) V!43973 V!43973 (_ BitVec 32) Int) ListLongMap!16613)

(assert (=> b!1162843 (= e!661212 (= lt!523705 (getCurrentListMapNoExtraKeys!4786 lt!523719 lt!523699 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun lt!523715 () Bool)

(declare-fun b!1162844 () Bool)

(declare-fun e!661219 () Bool)

(assert (=> b!1162844 (= e!661219 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523715) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!56799 () Bool)

(declare-fun c!116308 () Bool)

(declare-fun c!116303 () Bool)

(declare-fun lt!523707 () ListLongMap!16613)

(declare-fun call!56807 () ListLongMap!16613)

(declare-fun +!3726 (ListLongMap!16613 tuple2!18644) ListLongMap!16613)

(assert (=> bm!56799 (= call!56807 (+!3726 lt!523707 (ite (or c!116303 c!116308) (tuple2!18645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun _values!996 () array!75111)

(declare-fun call!56805 () ListLongMap!16613)

(declare-fun bm!56800 () Bool)

(assert (=> bm!56800 (= call!56805 (getCurrentListMapNoExtraKeys!4786 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162845 () Bool)

(declare-fun e!661216 () Bool)

(declare-fun e!661223 () Bool)

(declare-fun mapRes!45527 () Bool)

(assert (=> b!1162845 (= e!661216 (and e!661223 mapRes!45527))))

(declare-fun condMapEmpty!45527 () Bool)

(declare-fun mapDefault!45527 () ValueCell!13858)

