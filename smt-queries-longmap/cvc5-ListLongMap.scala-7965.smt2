; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98630 () Bool)

(assert start!98630)

(declare-fun b_free!24235 () Bool)

(declare-fun b_next!24235 () Bool)

(assert (=> start!98630 (= b_free!24235 (not b_next!24235))))

(declare-fun tp!85415 () Bool)

(declare-fun b_and!39319 () Bool)

(assert (=> start!98630 (= tp!85415 b_and!39319)))

(declare-fun b!1145822 () Bool)

(declare-fun e!651782 () Bool)

(declare-datatypes ((V!43481 0))(
  ( (V!43482 (val!14439 Int)) )
))
(declare-datatypes ((tuple2!18290 0))(
  ( (tuple2!18291 (_1!9156 (_ BitVec 64)) (_2!9156 V!43481)) )
))
(declare-datatypes ((List!25043 0))(
  ( (Nil!25040) (Cons!25039 (h!26248 tuple2!18290) (t!36270 List!25043)) )
))
(declare-datatypes ((ListLongMap!16259 0))(
  ( (ListLongMap!16260 (toList!8145 List!25043)) )
))
(declare-fun call!52365 () ListLongMap!16259)

(declare-fun call!52362 () ListLongMap!16259)

(assert (=> b!1145822 (= e!651782 (= call!52365 call!52362))))

(declare-fun b!1145823 () Bool)

(declare-fun e!651787 () Bool)

(declare-fun e!651789 () Bool)

(assert (=> b!1145823 (= e!651787 e!651789)))

(declare-fun res!762962 () Bool)

(assert (=> b!1145823 (=> res!762962 e!651789)))

(declare-datatypes ((array!74379 0))(
  ( (array!74380 (arr!35840 (Array (_ BitVec 32) (_ BitVec 64))) (size!36376 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74379)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1145823 (= res!762962 (not (= (select (arr!35840 _keys!1208) from!1455) k!934)))))

(assert (=> b!1145823 e!651782))

(declare-fun c!112973 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1145823 (= c!112973 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43481)

(declare-datatypes ((Unit!37619 0))(
  ( (Unit!37620) )
))
(declare-fun lt!511602 () Unit!37619)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13673 0))(
  ( (ValueCellFull!13673 (v!17076 V!43481)) (EmptyCell!13673) )
))
(declare-datatypes ((array!74381 0))(
  ( (array!74382 (arr!35841 (Array (_ BitVec 32) ValueCell!13673)) (size!36377 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74381)

(declare-fun minValue!944 () V!43481)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!524 (array!74379 array!74381 (_ BitVec 32) (_ BitVec 32) V!43481 V!43481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37619)

(assert (=> b!1145823 (= lt!511602 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!524 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145824 () Bool)

(declare-fun e!651781 () Bool)

(declare-fun e!651791 () Bool)

(assert (=> b!1145824 (= e!651781 e!651791)))

(declare-fun res!762966 () Bool)

(assert (=> b!1145824 (=> (not res!762966) (not e!651791))))

(declare-fun lt!511601 () array!74379)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74379 (_ BitVec 32)) Bool)

(assert (=> b!1145824 (= res!762966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511601 mask!1564))))

(assert (=> b!1145824 (= lt!511601 (array!74380 (store (arr!35840 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36376 _keys!1208)))))

(declare-fun b!1145825 () Bool)

(declare-fun e!651778 () Bool)

(assert (=> b!1145825 (= e!651778 e!651787)))

(declare-fun res!762956 () Bool)

(assert (=> b!1145825 (=> res!762956 e!651787)))

(assert (=> b!1145825 (= res!762956 (not (= from!1455 i!673)))))

(declare-fun lt!511603 () ListLongMap!16259)

(declare-fun lt!511595 () array!74381)

(declare-fun getCurrentListMapNoExtraKeys!4621 (array!74379 array!74381 (_ BitVec 32) (_ BitVec 32) V!43481 V!43481 (_ BitVec 32) Int) ListLongMap!16259)

(assert (=> b!1145825 (= lt!511603 (getCurrentListMapNoExtraKeys!4621 lt!511601 lt!511595 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!511606 () V!43481)

(assert (=> b!1145825 (= lt!511595 (array!74382 (store (arr!35841 _values!996) i!673 (ValueCellFull!13673 lt!511606)) (size!36377 _values!996)))))

(declare-fun dynLambda!2655 (Int (_ BitVec 64)) V!43481)

(assert (=> b!1145825 (= lt!511606 (dynLambda!2655 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!511607 () ListLongMap!16259)

(assert (=> b!1145825 (= lt!511607 (getCurrentListMapNoExtraKeys!4621 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1145826 () Bool)

(declare-fun e!651776 () Unit!37619)

(declare-fun lt!511598 () Unit!37619)

(assert (=> b!1145826 (= e!651776 lt!511598)))

(declare-fun call!52363 () Unit!37619)

(assert (=> b!1145826 (= lt!511598 call!52363)))

(declare-fun call!52364 () Bool)

(assert (=> b!1145826 call!52364))

(declare-fun b!1145827 () Bool)

(declare-fun e!651783 () Unit!37619)

(declare-fun Unit!37621 () Unit!37619)

(assert (=> b!1145827 (= e!651783 Unit!37621)))

(declare-fun lt!511613 () Bool)

(assert (=> b!1145827 (= lt!511613 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112977 () Bool)

(assert (=> b!1145827 (= c!112977 (and (not lt!511613) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511596 () Unit!37619)

(declare-fun e!651792 () Unit!37619)

(assert (=> b!1145827 (= lt!511596 e!651792)))

(declare-fun lt!511594 () Unit!37619)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!418 (array!74379 array!74381 (_ BitVec 32) (_ BitVec 32) V!43481 V!43481 (_ BitVec 64) (_ BitVec 32) Int) Unit!37619)

(assert (=> b!1145827 (= lt!511594 (lemmaListMapContainsThenArrayContainsFrom!418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112975 () Bool)

(assert (=> b!1145827 (= c!112975 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762959 () Bool)

(declare-fun e!651786 () Bool)

(assert (=> b!1145827 (= res!762959 e!651786)))

(declare-fun e!651784 () Bool)

(assert (=> b!1145827 (=> (not res!762959) (not e!651784))))

(assert (=> b!1145827 e!651784))

(declare-fun lt!511604 () Unit!37619)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74379 (_ BitVec 32) (_ BitVec 32)) Unit!37619)

(assert (=> b!1145827 (= lt!511604 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25044 0))(
  ( (Nil!25041) (Cons!25040 (h!26249 (_ BitVec 64)) (t!36271 List!25044)) )
))
(declare-fun arrayNoDuplicates!0 (array!74379 (_ BitVec 32) List!25044) Bool)

(assert (=> b!1145827 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25041)))

(declare-fun lt!511605 () Unit!37619)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74379 (_ BitVec 64) (_ BitVec 32) List!25044) Unit!37619)

(assert (=> b!1145827 (= lt!511605 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25041))))

(assert (=> b!1145827 false))

(declare-fun bm!52359 () Bool)

(declare-fun call!52366 () Bool)

(assert (=> bm!52359 (= call!52364 call!52366)))

(declare-fun b!1145828 () Bool)

(declare-fun res!762964 () Bool)

(assert (=> b!1145828 (=> (not res!762964) (not e!651781))))

(assert (=> b!1145828 (= res!762964 (and (= (size!36377 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36376 _keys!1208) (size!36377 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145829 () Bool)

(declare-fun res!762965 () Bool)

(assert (=> b!1145829 (=> (not res!762965) (not e!651781))))

(assert (=> b!1145829 (= res!762965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1145830 () Bool)

(declare-fun res!762957 () Bool)

(assert (=> b!1145830 (=> (not res!762957) (not e!651781))))

(assert (=> b!1145830 (= res!762957 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36376 _keys!1208))))))

(declare-fun b!1145831 () Bool)

(assert (=> b!1145831 (= e!651791 (not e!651778))))

(declare-fun res!762960 () Bool)

(assert (=> b!1145831 (=> res!762960 e!651778)))

(assert (=> b!1145831 (= res!762960 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145831 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!511612 () Unit!37619)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74379 (_ BitVec 64) (_ BitVec 32)) Unit!37619)

(assert (=> b!1145831 (= lt!511612 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1145832 () Bool)

(declare-fun c!112978 () Bool)

(assert (=> b!1145832 (= c!112978 (and (not lt!511613) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1145832 (= e!651792 e!651776)))

(declare-fun b!1145833 () Bool)

(declare-fun Unit!37622 () Unit!37619)

(assert (=> b!1145833 (= e!651783 Unit!37622)))

(declare-fun b!1145834 () Bool)

(declare-fun res!762958 () Bool)

(assert (=> b!1145834 (=> (not res!762958) (not e!651781))))

(assert (=> b!1145834 (= res!762958 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25041))))

(declare-fun b!1145835 () Bool)

(declare-fun res!762968 () Bool)

(assert (=> b!1145835 (=> (not res!762968) (not e!651781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145835 (= res!762968 (validMask!0 mask!1564))))

(declare-fun b!1145836 () Bool)

(assert (=> b!1145836 (= e!651786 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511613) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1145837 () Bool)

(declare-fun e!651788 () Bool)

(declare-fun e!651779 () Bool)

(declare-fun mapRes!44972 () Bool)

(assert (=> b!1145837 (= e!651788 (and e!651779 mapRes!44972))))

(declare-fun condMapEmpty!44972 () Bool)

(declare-fun mapDefault!44972 () ValueCell!13673)

