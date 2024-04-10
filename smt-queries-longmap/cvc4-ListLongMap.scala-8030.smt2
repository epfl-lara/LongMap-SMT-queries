; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99024 () Bool)

(assert start!99024)

(declare-fun b_free!24629 () Bool)

(declare-fun b_next!24629 () Bool)

(assert (=> start!99024 (= b_free!24629 (not b_next!24629))))

(declare-fun tp!86597 () Bool)

(declare-fun b_and!40107 () Bool)

(assert (=> start!99024 (= tp!86597 b_and!40107)))

(declare-fun b!1163946 () Bool)

(declare-fun e!661830 () Bool)

(declare-fun tp_is_empty!29159 () Bool)

(assert (=> b!1163946 (= e!661830 tp_is_empty!29159)))

(declare-datatypes ((V!44005 0))(
  ( (V!44006 (val!14636 Int)) )
))
(declare-fun zeroValue!944 () V!44005)

(declare-datatypes ((array!75157 0))(
  ( (array!75158 (arr!36229 (Array (_ BitVec 32) (_ BitVec 64))) (size!36765 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75157)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!57087 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13870 0))(
  ( (ValueCellFull!13870 (v!17273 V!44005)) (EmptyCell!13870) )
))
(declare-datatypes ((array!75159 0))(
  ( (array!75160 (arr!36230 (Array (_ BitVec 32) ValueCell!13870)) (size!36766 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75159)

(declare-fun minValue!944 () V!44005)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18668 0))(
  ( (tuple2!18669 (_1!9345 (_ BitVec 64)) (_2!9345 V!44005)) )
))
(declare-datatypes ((List!25400 0))(
  ( (Nil!25397) (Cons!25396 (h!26605 tuple2!18668) (t!37021 List!25400)) )
))
(declare-datatypes ((ListLongMap!16637 0))(
  ( (ListLongMap!16638 (toList!8334 List!25400)) )
))
(declare-fun call!57095 () ListLongMap!16637)

(declare-fun getCurrentListMapNoExtraKeys!4798 (array!75157 array!75159 (_ BitVec 32) (_ BitVec 32) V!44005 V!44005 (_ BitVec 32) Int) ListLongMap!16637)

(assert (=> bm!57087 (= call!57095 (getCurrentListMapNoExtraKeys!4798 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!524490 () array!75159)

(declare-fun call!57091 () ListLongMap!16637)

(declare-fun bm!57088 () Bool)

(declare-fun lt!524502 () array!75157)

(assert (=> bm!57088 (= call!57091 (getCurrentListMapNoExtraKeys!4798 lt!524502 lt!524490 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163947 () Bool)

(declare-fun call!57097 () ListLongMap!16637)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6837 (ListLongMap!16637 (_ BitVec 64)) Bool)

(assert (=> b!1163947 (contains!6837 call!57097 k!934)))

(declare-datatypes ((Unit!38416 0))(
  ( (Unit!38417) )
))
(declare-fun lt!524495 () Unit!38416)

(declare-fun lt!524511 () ListLongMap!16637)

(declare-fun addStillContains!975 (ListLongMap!16637 (_ BitVec 64) V!44005 (_ BitVec 64)) Unit!38416)

(assert (=> b!1163947 (= lt!524495 (addStillContains!975 lt!524511 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!57096 () Bool)

(assert (=> b!1163947 call!57096))

(declare-fun lt!524501 () ListLongMap!16637)

(declare-fun +!3736 (ListLongMap!16637 tuple2!18668) ListLongMap!16637)

(assert (=> b!1163947 (= lt!524511 (+!3736 lt!524501 (tuple2!18669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!524504 () Unit!38416)

(declare-fun call!57090 () Unit!38416)

(assert (=> b!1163947 (= lt!524504 call!57090)))

(declare-fun e!661826 () Unit!38416)

(assert (=> b!1163947 (= e!661826 lt!524495)))

(declare-fun b!1163948 () Bool)

(declare-fun e!661832 () Unit!38416)

(declare-fun Unit!38418 () Unit!38416)

(assert (=> b!1163948 (= e!661832 Unit!38418)))

(declare-fun lt!524497 () Bool)

(assert (=> b!1163948 (= lt!524497 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116524 () Bool)

(assert (=> b!1163948 (= c!116524 (and (not lt!524497) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!524491 () Unit!38416)

(assert (=> b!1163948 (= lt!524491 e!661826)))

(declare-fun lt!524500 () Unit!38416)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!560 (array!75157 array!75159 (_ BitVec 32) (_ BitVec 32) V!44005 V!44005 (_ BitVec 64) (_ BitVec 32) Int) Unit!38416)

(assert (=> b!1163948 (= lt!524500 (lemmaListMapContainsThenArrayContainsFrom!560 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116522 () Bool)

(assert (=> b!1163948 (= c!116522 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771831 () Bool)

(declare-fun e!661837 () Bool)

(assert (=> b!1163948 (= res!771831 e!661837)))

(declare-fun e!661828 () Bool)

(assert (=> b!1163948 (=> (not res!771831) (not e!661828))))

(assert (=> b!1163948 e!661828))

(declare-fun lt!524499 () Unit!38416)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75157 (_ BitVec 32) (_ BitVec 32)) Unit!38416)

(assert (=> b!1163948 (= lt!524499 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25401 0))(
  ( (Nil!25398) (Cons!25397 (h!26606 (_ BitVec 64)) (t!37022 List!25401)) )
))
(declare-fun arrayNoDuplicates!0 (array!75157 (_ BitVec 32) List!25401) Bool)

(assert (=> b!1163948 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25398)))

(declare-fun lt!524509 () Unit!38416)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75157 (_ BitVec 64) (_ BitVec 32) List!25401) Unit!38416)

(assert (=> b!1163948 (= lt!524509 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25398))))

(assert (=> b!1163948 false))

(declare-fun b!1163949 () Bool)

(assert (=> b!1163949 (= e!661837 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!524497) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1163950 () Bool)

(declare-fun res!771829 () Bool)

(declare-fun e!661836 () Bool)

(assert (=> b!1163950 (=> (not res!771829) (not e!661836))))

(assert (=> b!1163950 (= res!771829 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25398))))

(declare-fun mapIsEmpty!45563 () Bool)

(declare-fun mapRes!45563 () Bool)

(assert (=> mapIsEmpty!45563 mapRes!45563))

(declare-fun b!1163951 () Bool)

(declare-fun call!57094 () Bool)

(assert (=> b!1163951 call!57094))

(declare-fun lt!524507 () Unit!38416)

(declare-fun call!57093 () Unit!38416)

(assert (=> b!1163951 (= lt!524507 call!57093)))

(declare-fun e!661835 () Unit!38416)

(assert (=> b!1163951 (= e!661835 lt!524507)))

(declare-fun b!1163952 () Bool)

(declare-fun res!771826 () Bool)

(assert (=> b!1163952 (=> (not res!771826) (not e!661836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75157 (_ BitVec 32)) Bool)

(assert (=> b!1163952 (= res!771826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1163953 () Bool)

(declare-fun Unit!38419 () Unit!38416)

(assert (=> b!1163953 (= e!661832 Unit!38419)))

(declare-fun bm!57089 () Bool)

(declare-fun c!116521 () Bool)

(assert (=> bm!57089 (= call!57097 (+!3736 (ite c!116524 lt!524511 lt!524501) (ite c!116524 (tuple2!18669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116521 (tuple2!18669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1163954 () Bool)

(declare-fun res!771819 () Bool)

(declare-fun e!661827 () Bool)

(assert (=> b!1163954 (=> (not res!771819) (not e!661827))))

(assert (=> b!1163954 (= res!771819 (arrayNoDuplicates!0 lt!524502 #b00000000000000000000000000000000 Nil!25398))))

(declare-fun b!1163955 () Bool)

(declare-fun e!661833 () Bool)

(assert (=> b!1163955 (= e!661833 (= call!57091 call!57095))))

(declare-fun b!1163956 () Bool)

(declare-fun e!661838 () Bool)

(declare-fun e!661825 () Bool)

(assert (=> b!1163956 (= e!661838 (and e!661825 mapRes!45563))))

(declare-fun condMapEmpty!45563 () Bool)

(declare-fun mapDefault!45563 () ValueCell!13870)

