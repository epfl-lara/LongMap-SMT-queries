; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98798 () Bool)

(assert start!98798)

(declare-fun b_free!24403 () Bool)

(declare-fun b_next!24403 () Bool)

(assert (=> start!98798 (= b_free!24403 (not b_next!24403))))

(declare-fun tp!85920 () Bool)

(declare-fun b_and!39655 () Bool)

(assert (=> start!98798 (= tp!85920 b_and!39655)))

(declare-fun b!1153550 () Bool)

(declare-fun e!656073 () Bool)

(declare-fun e!656062 () Bool)

(assert (=> b!1153550 (= e!656073 e!656062)))

(declare-fun res!766740 () Bool)

(assert (=> b!1153550 (=> (not res!766740) (not e!656062))))

(declare-datatypes ((array!74713 0))(
  ( (array!74714 (arr!36007 (Array (_ BitVec 32) (_ BitVec 64))) (size!36543 (_ BitVec 32))) )
))
(declare-fun lt!517051 () array!74713)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74713 (_ BitVec 32)) Bool)

(assert (=> b!1153550 (= res!766740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517051 mask!1564))))

(declare-fun _keys!1208 () array!74713)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153550 (= lt!517051 (array!74714 (store (arr!36007 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36543 _keys!1208)))))

(declare-fun b!1153551 () Bool)

(declare-fun res!766746 () Bool)

(assert (=> b!1153551 (=> (not res!766746) (not e!656073))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1153551 (= res!766746 (= (select (arr!36007 _keys!1208) i!673) k!934))))

(declare-fun b!1153552 () Bool)

(declare-fun e!656072 () Bool)

(declare-fun tp_is_empty!28933 () Bool)

(assert (=> b!1153552 (= e!656072 tp_is_empty!28933)))

(declare-fun b!1153553 () Bool)

(declare-datatypes ((Unit!37967 0))(
  ( (Unit!37968) )
))
(declare-fun e!656064 () Unit!37967)

(declare-fun lt!517034 () Unit!37967)

(assert (=> b!1153553 (= e!656064 lt!517034)))

(declare-fun call!54382 () Unit!37967)

(assert (=> b!1153553 (= lt!517034 call!54382)))

(declare-fun call!54384 () Bool)

(assert (=> b!1153553 call!54384))

(declare-datatypes ((V!43705 0))(
  ( (V!43706 (val!14523 Int)) )
))
(declare-fun zeroValue!944 () V!43705)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43705)

(declare-datatypes ((ValueCell!13757 0))(
  ( (ValueCellFull!13757 (v!17160 V!43705)) (EmptyCell!13757) )
))
(declare-datatypes ((array!74715 0))(
  ( (array!74716 (arr!36008 (Array (_ BitVec 32) ValueCell!13757)) (size!36544 (_ BitVec 32))) )
))
(declare-fun lt!517048 () array!74715)

(declare-fun bm!54375 () Bool)

(declare-datatypes ((tuple2!18454 0))(
  ( (tuple2!18455 (_1!9238 (_ BitVec 64)) (_2!9238 V!43705)) )
))
(declare-datatypes ((List!25200 0))(
  ( (Nil!25197) (Cons!25196 (h!26405 tuple2!18454) (t!36595 List!25200)) )
))
(declare-datatypes ((ListLongMap!16423 0))(
  ( (ListLongMap!16424 (toList!8227 List!25200)) )
))
(declare-fun call!54385 () ListLongMap!16423)

(declare-fun getCurrentListMapNoExtraKeys!4697 (array!74713 array!74715 (_ BitVec 32) (_ BitVec 32) V!43705 V!43705 (_ BitVec 32) Int) ListLongMap!16423)

(assert (=> bm!54375 (= call!54385 (getCurrentListMapNoExtraKeys!4697 lt!517051 lt!517048 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54376 () Bool)

(declare-fun call!54381 () Unit!37967)

(assert (=> bm!54376 (= call!54382 call!54381)))

(declare-fun b!1153554 () Bool)

(declare-fun e!656067 () Bool)

(declare-fun mapRes!45224 () Bool)

(assert (=> b!1153554 (= e!656067 (and e!656072 mapRes!45224))))

(declare-fun condMapEmpty!45224 () Bool)

(declare-fun _values!996 () array!74715)

(declare-fun mapDefault!45224 () ValueCell!13757)

