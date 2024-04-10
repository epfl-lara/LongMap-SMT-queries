; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98792 () Bool)

(assert start!98792)

(declare-fun b_free!24397 () Bool)

(declare-fun b_next!24397 () Bool)

(assert (=> start!98792 (= b_free!24397 (not b_next!24397))))

(declare-fun tp!85902 () Bool)

(declare-fun b_and!39643 () Bool)

(assert (=> start!98792 (= tp!85902 b_and!39643)))

(declare-fun b!1153274 () Bool)

(declare-fun res!766610 () Bool)

(declare-fun e!655916 () Bool)

(assert (=> b!1153274 (=> (not res!766610) (not e!655916))))

(declare-datatypes ((array!74701 0))(
  ( (array!74702 (arr!36001 (Array (_ BitVec 32) (_ BitVec 64))) (size!36537 (_ BitVec 32))) )
))
(declare-fun lt!516836 () array!74701)

(declare-datatypes ((List!25194 0))(
  ( (Nil!25191) (Cons!25190 (h!26399 (_ BitVec 64)) (t!36583 List!25194)) )
))
(declare-fun arrayNoDuplicates!0 (array!74701 (_ BitVec 32) List!25194) Bool)

(assert (=> b!1153274 (= res!766610 (arrayNoDuplicates!0 lt!516836 #b00000000000000000000000000000000 Nil!25191))))

(declare-fun b!1153275 () Bool)

(declare-fun res!766606 () Bool)

(declare-fun e!655921 () Bool)

(assert (=> b!1153275 (=> (not res!766606) (not e!655921))))

(declare-fun _keys!1208 () array!74701)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1153275 (= res!766606 (= (select (arr!36001 _keys!1208) i!673) k!934))))

(declare-fun b!1153276 () Bool)

(declare-fun e!655918 () Bool)

(assert (=> b!1153276 (= e!655916 (not e!655918))))

(declare-fun res!766609 () Bool)

(assert (=> b!1153276 (=> res!766609 e!655918)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1153276 (= res!766609 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153276 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37956 0))(
  ( (Unit!37957) )
))
(declare-fun lt!516840 () Unit!37956)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74701 (_ BitVec 64) (_ BitVec 32)) Unit!37956)

(assert (=> b!1153276 (= lt!516840 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-datatypes ((V!43697 0))(
  ( (V!43698 (val!14520 Int)) )
))
(declare-fun zeroValue!944 () V!43697)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!54304 () Bool)

(declare-datatypes ((tuple2!18448 0))(
  ( (tuple2!18449 (_1!9235 (_ BitVec 64)) (_2!9235 V!43697)) )
))
(declare-datatypes ((List!25195 0))(
  ( (Nil!25192) (Cons!25191 (h!26400 tuple2!18448) (t!36584 List!25195)) )
))
(declare-datatypes ((ListLongMap!16417 0))(
  ( (ListLongMap!16418 (toList!8224 List!25195)) )
))
(declare-fun call!54312 () ListLongMap!16417)

(declare-datatypes ((ValueCell!13754 0))(
  ( (ValueCellFull!13754 (v!17157 V!43697)) (EmptyCell!13754) )
))
(declare-datatypes ((array!74703 0))(
  ( (array!74704 (arr!36002 (Array (_ BitVec 32) ValueCell!13754)) (size!36538 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74703)

(declare-fun minValue!944 () V!43697)

(declare-fun getCurrentListMapNoExtraKeys!4694 (array!74701 array!74703 (_ BitVec 32) (_ BitVec 32) V!43697 V!43697 (_ BitVec 32) Int) ListLongMap!16417)

(assert (=> bm!54304 (= call!54312 (getCurrentListMapNoExtraKeys!4694 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54305 () Bool)

(declare-fun call!54313 () Unit!37956)

(declare-fun call!54307 () Unit!37956)

(assert (=> bm!54305 (= call!54313 call!54307)))

(declare-fun b!1153277 () Bool)

(declare-fun e!655912 () Bool)

(assert (=> b!1153277 (= e!655912 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!54306 () Bool)

(declare-fun call!54306 () Bool)

(declare-fun call!54308 () Bool)

(assert (=> bm!54306 (= call!54306 call!54308)))

(declare-fun mapNonEmpty!45215 () Bool)

(declare-fun mapRes!45215 () Bool)

(declare-fun tp!85901 () Bool)

(declare-fun e!655917 () Bool)

(assert (=> mapNonEmpty!45215 (= mapRes!45215 (and tp!85901 e!655917))))

(declare-fun mapRest!45215 () (Array (_ BitVec 32) ValueCell!13754))

(declare-fun mapKey!45215 () (_ BitVec 32))

(declare-fun mapValue!45215 () ValueCell!13754)

(assert (=> mapNonEmpty!45215 (= (arr!36002 _values!996) (store mapRest!45215 mapKey!45215 mapValue!45215))))

(declare-fun b!1153278 () Bool)

(declare-fun e!655913 () Bool)

(declare-fun e!655915 () Bool)

(assert (=> b!1153278 (= e!655913 (and e!655915 mapRes!45215))))

(declare-fun condMapEmpty!45215 () Bool)

(declare-fun mapDefault!45215 () ValueCell!13754)

