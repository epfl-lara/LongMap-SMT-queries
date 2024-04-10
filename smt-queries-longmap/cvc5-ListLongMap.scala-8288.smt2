; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101000 () Bool)

(assert start!101000)

(declare-fun b_free!25999 () Bool)

(declare-fun b_next!25999 () Bool)

(assert (=> start!101000 (= b_free!25999 (not b_next!25999))))

(declare-fun tp!91013 () Bool)

(declare-fun b_and!43079 () Bool)

(assert (=> start!101000 (= tp!91013 b_and!43079)))

(declare-fun mapNonEmpty!47923 () Bool)

(declare-fun mapRes!47923 () Bool)

(declare-fun tp!91012 () Bool)

(declare-fun e!687029 () Bool)

(assert (=> mapNonEmpty!47923 (= mapRes!47923 (and tp!91012 e!687029))))

(declare-datatypes ((V!46065 0))(
  ( (V!46066 (val!15408 Int)) )
))
(declare-datatypes ((ValueCell!14642 0))(
  ( (ValueCellFull!14642 (v!18059 V!46065)) (EmptyCell!14642) )
))
(declare-fun mapValue!47923 () ValueCell!14642)

(declare-fun mapRest!47923 () (Array (_ BitVec 32) ValueCell!14642))

(declare-fun mapKey!47923 () (_ BitVec 32))

(declare-datatypes ((array!78191 0))(
  ( (array!78192 (arr!37732 (Array (_ BitVec 32) ValueCell!14642)) (size!38268 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78191)

(assert (=> mapNonEmpty!47923 (= (arr!37732 _values!996) (store mapRest!47923 mapKey!47923 mapValue!47923))))

(declare-fun b!1209687 () Bool)

(declare-fun res!803956 () Bool)

(declare-fun e!687031 () Bool)

(assert (=> b!1209687 (=> (not res!803956) (not e!687031))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209687 (= res!803956 (validMask!0 mask!1564))))

(declare-fun zeroValue!944 () V!46065)

(declare-fun c!119112 () Bool)

(declare-datatypes ((tuple2!19782 0))(
  ( (tuple2!19783 (_1!9902 (_ BitVec 64)) (_2!9902 V!46065)) )
))
(declare-datatypes ((List!26583 0))(
  ( (Nil!26580) (Cons!26579 (h!27788 tuple2!19782) (t!39562 List!26583)) )
))
(declare-datatypes ((ListLongMap!17751 0))(
  ( (ListLongMap!17752 (toList!8891 List!26583)) )
))
(declare-fun lt!549129 () ListLongMap!17751)

(declare-fun bm!59426 () Bool)

(declare-datatypes ((Unit!40091 0))(
  ( (Unit!40092) )
))
(declare-fun call!59433 () Unit!40091)

(declare-fun minValue!944 () V!46065)

(declare-fun lt!549119 () ListLongMap!17751)

(declare-fun c!119114 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun addStillContains!1038 (ListLongMap!17751 (_ BitVec 64) V!46065 (_ BitVec 64)) Unit!40091)

(assert (=> bm!59426 (= call!59433 (addStillContains!1038 (ite c!119114 lt!549129 lt!549119) (ite c!119114 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119112 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119114 minValue!944 (ite c!119112 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1209688 () Bool)

(declare-fun e!687030 () Bool)

(declare-fun call!59429 () ListLongMap!17751)

(declare-fun call!59435 () ListLongMap!17751)

(assert (=> b!1209688 (= e!687030 (= call!59429 call!59435))))

(declare-fun b!1209689 () Bool)

(declare-fun res!803954 () Bool)

(declare-fun e!687033 () Bool)

(assert (=> b!1209689 (=> (not res!803954) (not e!687033))))

(declare-datatypes ((array!78193 0))(
  ( (array!78194 (arr!37733 (Array (_ BitVec 32) (_ BitVec 64))) (size!38269 (_ BitVec 32))) )
))
(declare-fun lt!549123 () array!78193)

(declare-datatypes ((List!26584 0))(
  ( (Nil!26581) (Cons!26580 (h!27789 (_ BitVec 64)) (t!39563 List!26584)) )
))
(declare-fun arrayNoDuplicates!0 (array!78193 (_ BitVec 32) List!26584) Bool)

(assert (=> b!1209689 (= res!803954 (arrayNoDuplicates!0 lt!549123 #b00000000000000000000000000000000 Nil!26581))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!59427 () Bool)

(declare-fun lt!549127 () array!78191)

(declare-fun getCurrentListMapNoExtraKeys!5325 (array!78193 array!78191 (_ BitVec 32) (_ BitVec 32) V!46065 V!46065 (_ BitVec 32) Int) ListLongMap!17751)

(assert (=> bm!59427 (= call!59429 (getCurrentListMapNoExtraKeys!5325 lt!549123 lt!549127 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59428 () Bool)

(declare-fun call!59431 () Bool)

(declare-fun call!59432 () ListLongMap!17751)

(declare-fun contains!6962 (ListLongMap!17751 (_ BitVec 64)) Bool)

(assert (=> bm!59428 (= call!59431 (contains!6962 (ite c!119114 lt!549129 call!59432) k!934))))

(declare-fun b!1209691 () Bool)

(declare-fun e!687037 () Bool)

(declare-fun e!687027 () Bool)

(assert (=> b!1209691 (= e!687037 e!687027)))

(declare-fun res!803947 () Bool)

(assert (=> b!1209691 (=> res!803947 e!687027)))

(declare-fun _keys!1208 () array!78193)

(assert (=> b!1209691 (= res!803947 (not (= (select (arr!37733 _keys!1208) from!1455) k!934)))))

(assert (=> b!1209691 e!687030))

(declare-fun c!119113 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209691 (= c!119113 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549130 () Unit!40091)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1052 (array!78193 array!78191 (_ BitVec 32) (_ BitVec 32) V!46065 V!46065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40091)

(assert (=> b!1209691 (= lt!549130 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1052 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59429 () Bool)

(declare-fun call!59436 () ListLongMap!17751)

(assert (=> bm!59429 (= call!59432 call!59436)))

(declare-fun b!1209692 () Bool)

(declare-fun res!803945 () Bool)

(assert (=> b!1209692 (=> (not res!803945) (not e!687031))))

(assert (=> b!1209692 (= res!803945 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38269 _keys!1208))))))

(declare-fun b!1209693 () Bool)

(declare-fun e!687024 () Unit!40091)

(declare-fun lt!549133 () Unit!40091)

(assert (=> b!1209693 (= e!687024 lt!549133)))

(declare-fun lt!549126 () Unit!40091)

(assert (=> b!1209693 (= lt!549126 (addStillContains!1038 lt!549119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun +!4009 (ListLongMap!17751 tuple2!19782) ListLongMap!17751)

(assert (=> b!1209693 (= lt!549129 (+!4009 lt!549119 (tuple2!19783 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1209693 call!59431))

(assert (=> b!1209693 (= lt!549133 call!59433)))

(assert (=> b!1209693 (contains!6962 call!59436 k!934)))

(declare-fun b!1209694 () Bool)

(declare-fun e!687025 () Unit!40091)

(declare-fun lt!549125 () Unit!40091)

(assert (=> b!1209694 (= e!687025 lt!549125)))

(declare-fun call!59434 () Unit!40091)

(assert (=> b!1209694 (= lt!549125 call!59434)))

(declare-fun call!59430 () Bool)

(assert (=> b!1209694 call!59430))

(declare-fun bm!59430 () Bool)

(assert (=> bm!59430 (= call!59436 (+!4009 (ite c!119114 lt!549129 lt!549119) (ite c!119114 (tuple2!19783 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119112 (tuple2!19783 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19783 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1209695 () Bool)

(declare-fun e!687038 () Bool)

(declare-fun e!687035 () Bool)

(assert (=> b!1209695 (= e!687038 (and e!687035 mapRes!47923))))

(declare-fun condMapEmpty!47923 () Bool)

(declare-fun mapDefault!47923 () ValueCell!14642)

