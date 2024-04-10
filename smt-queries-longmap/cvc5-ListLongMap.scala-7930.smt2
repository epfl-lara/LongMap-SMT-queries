; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98420 () Bool)

(assert start!98420)

(declare-fun b_free!24025 () Bool)

(declare-fun b_next!24025 () Bool)

(assert (=> start!98420 (= b_free!24025 (not b_next!24025))))

(declare-fun tp!84785 () Bool)

(declare-fun b_and!38899 () Bool)

(assert (=> start!98420 (= tp!84785 b_and!38899)))

(declare-fun b!1136407 () Bool)

(declare-fun res!758474 () Bool)

(declare-fun e!646677 () Bool)

(assert (=> b!1136407 (=> (not res!758474) (not e!646677))))

(declare-datatypes ((array!73971 0))(
  ( (array!73972 (arr!35636 (Array (_ BitVec 32) (_ BitVec 64))) (size!36172 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73971)

(declare-datatypes ((List!24855 0))(
  ( (Nil!24852) (Cons!24851 (h!26060 (_ BitVec 64)) (t!35872 List!24855)) )
))
(declare-fun arrayNoDuplicates!0 (array!73971 (_ BitVec 32) List!24855) Bool)

(assert (=> b!1136407 (= res!758474 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24852))))

(declare-fun b!1136408 () Bool)

(declare-fun res!758472 () Bool)

(assert (=> b!1136408 (=> (not res!758472) (not e!646677))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136408 (= res!758472 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36172 _keys!1208))))))

(declare-fun mapIsEmpty!44657 () Bool)

(declare-fun mapRes!44657 () Bool)

(assert (=> mapIsEmpty!44657 mapRes!44657))

(declare-fun b!1136409 () Bool)

(declare-fun e!646679 () Bool)

(assert (=> b!1136409 (= e!646679 true)))

(declare-fun lt!505282 () Bool)

(declare-fun contains!6585 (List!24855 (_ BitVec 64)) Bool)

(assert (=> b!1136409 (= lt!505282 (contains!6585 Nil!24852 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!758473 () Bool)

(assert (=> start!98420 (=> (not res!758473) (not e!646677))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98420 (= res!758473 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36172 _keys!1208))))))

(assert (=> start!98420 e!646677))

(declare-fun tp_is_empty!28555 () Bool)

(assert (=> start!98420 tp_is_empty!28555))

(declare-fun array_inv!27326 (array!73971) Bool)

(assert (=> start!98420 (array_inv!27326 _keys!1208)))

(assert (=> start!98420 true))

(assert (=> start!98420 tp!84785))

(declare-datatypes ((V!43201 0))(
  ( (V!43202 (val!14334 Int)) )
))
(declare-datatypes ((ValueCell!13568 0))(
  ( (ValueCellFull!13568 (v!16971 V!43201)) (EmptyCell!13568) )
))
(declare-datatypes ((array!73973 0))(
  ( (array!73974 (arr!35637 (Array (_ BitVec 32) ValueCell!13568)) (size!36173 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73973)

(declare-fun e!646680 () Bool)

(declare-fun array_inv!27327 (array!73973) Bool)

(assert (=> start!98420 (and (array_inv!27327 _values!996) e!646680)))

(declare-fun b!1136410 () Bool)

(declare-fun e!646676 () Bool)

(declare-datatypes ((tuple2!18096 0))(
  ( (tuple2!18097 (_1!9059 (_ BitVec 64)) (_2!9059 V!43201)) )
))
(declare-datatypes ((List!24856 0))(
  ( (Nil!24853) (Cons!24852 (h!26061 tuple2!18096) (t!35873 List!24856)) )
))
(declare-datatypes ((ListLongMap!16065 0))(
  ( (ListLongMap!16066 (toList!8048 List!24856)) )
))
(declare-fun call!49843 () ListLongMap!16065)

(declare-fun call!49842 () ListLongMap!16065)

(assert (=> b!1136410 (= e!646676 (= call!49843 call!49842))))

(declare-fun bm!49839 () Bool)

(declare-fun call!49847 () Bool)

(declare-fun call!49844 () Bool)

(assert (=> bm!49839 (= call!49847 call!49844)))

(declare-fun e!646681 () Bool)

(declare-fun b!1136411 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136411 (= e!646681 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49840 () Bool)

(declare-fun c!111094 () Bool)

(declare-fun lt!505270 () ListLongMap!16065)

(declare-fun call!49846 () ListLongMap!16065)

(declare-fun contains!6586 (ListLongMap!16065 (_ BitVec 64)) Bool)

(assert (=> bm!49840 (= call!49844 (contains!6586 (ite c!111094 lt!505270 call!49846) k!934))))

(declare-fun b!1136412 () Bool)

(declare-fun -!1209 (ListLongMap!16065 (_ BitVec 64)) ListLongMap!16065)

(assert (=> b!1136412 (= e!646676 (= call!49843 (-!1209 call!49842 k!934)))))

(declare-fun b!1136413 () Bool)

(declare-fun c!111093 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!505276 () Bool)

(assert (=> b!1136413 (= c!111093 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505276))))

(declare-datatypes ((Unit!37216 0))(
  ( (Unit!37217) )
))
(declare-fun e!646673 () Unit!37216)

(declare-fun e!646674 () Unit!37216)

(assert (=> b!1136413 (= e!646673 e!646674)))

(declare-fun b!1136414 () Bool)

(declare-fun res!758470 () Bool)

(assert (=> b!1136414 (=> res!758470 e!646679)))

(declare-fun noDuplicate!1603 (List!24855) Bool)

(assert (=> b!1136414 (= res!758470 (not (noDuplicate!1603 Nil!24852)))))

(declare-fun b!1136415 () Bool)

(declare-fun e!646687 () Unit!37216)

(declare-fun lt!505268 () Unit!37216)

(assert (=> b!1136415 (= e!646687 lt!505268)))

(declare-fun zeroValue!944 () V!43201)

(declare-fun lt!505271 () Unit!37216)

(declare-fun lt!505283 () ListLongMap!16065)

(declare-fun addStillContains!745 (ListLongMap!16065 (_ BitVec 64) V!43201 (_ BitVec 64)) Unit!37216)

(assert (=> b!1136415 (= lt!505271 (addStillContains!745 lt!505283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun call!49849 () ListLongMap!16065)

(assert (=> b!1136415 (= lt!505270 call!49849)))

(assert (=> b!1136415 call!49844))

(declare-fun call!49845 () Unit!37216)

(assert (=> b!1136415 (= lt!505268 call!49845)))

(declare-fun minValue!944 () V!43201)

(declare-fun +!3484 (ListLongMap!16065 tuple2!18096) ListLongMap!16065)

(assert (=> b!1136415 (contains!6586 (+!3484 lt!505270 (tuple2!18097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1136416 () Bool)

(declare-fun res!758466 () Bool)

(assert (=> b!1136416 (=> res!758466 e!646679)))

(assert (=> b!1136416 (= res!758466 (contains!6585 Nil!24852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1136417 () Bool)

(declare-fun res!758461 () Bool)

(assert (=> b!1136417 (=> (not res!758461) (not e!646677))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136417 (= res!758461 (validMask!0 mask!1564))))

(declare-fun b!1136418 () Bool)

(declare-fun e!646686 () Bool)

(declare-fun e!646689 () Bool)

(assert (=> b!1136418 (= e!646686 (not e!646689))))

(declare-fun res!758477 () Bool)

(assert (=> b!1136418 (=> res!758477 e!646689)))

(assert (=> b!1136418 (= res!758477 (bvsgt from!1455 i!673))))

(assert (=> b!1136418 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!505280 () Unit!37216)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73971 (_ BitVec 64) (_ BitVec 32)) Unit!37216)

(assert (=> b!1136418 (= lt!505280 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!49841 () Bool)

(declare-fun call!49848 () Unit!37216)

(assert (=> bm!49841 (= call!49848 call!49845)))

(declare-fun b!1136419 () Bool)

(assert (=> b!1136419 call!49847))

(declare-fun lt!505273 () Unit!37216)

(assert (=> b!1136419 (= lt!505273 call!49848)))

(assert (=> b!1136419 (= e!646673 lt!505273)))

(declare-fun e!646685 () Bool)

(declare-fun b!1136420 () Bool)

(assert (=> b!1136420 (= e!646685 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136421 () Bool)

(declare-fun res!758468 () Bool)

(assert (=> b!1136421 (=> (not res!758468) (not e!646686))))

(declare-fun lt!505274 () array!73971)

(assert (=> b!1136421 (= res!758468 (arrayNoDuplicates!0 lt!505274 #b00000000000000000000000000000000 Nil!24852))))

(declare-fun b!1136422 () Bool)

(declare-fun e!646678 () Bool)

(declare-fun e!646682 () Bool)

(assert (=> b!1136422 (= e!646678 e!646682)))

(declare-fun res!758465 () Bool)

(assert (=> b!1136422 (=> res!758465 e!646682)))

(assert (=> b!1136422 (= res!758465 (not (contains!6586 lt!505283 k!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4532 (array!73971 array!73973 (_ BitVec 32) (_ BitVec 32) V!43201 V!43201 (_ BitVec 32) Int) ListLongMap!16065)

(assert (=> b!1136422 (= lt!505283 (getCurrentListMapNoExtraKeys!4532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136423 () Bool)

(declare-fun e!646688 () Bool)

(assert (=> b!1136423 (= e!646680 (and e!646688 mapRes!44657))))

(declare-fun condMapEmpty!44657 () Bool)

(declare-fun mapDefault!44657 () ValueCell!13568)

