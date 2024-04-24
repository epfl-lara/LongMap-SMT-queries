; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99082 () Bool)

(assert start!99082)

(declare-fun b_free!24451 () Bool)

(declare-fun b_next!24451 () Bool)

(assert (=> start!99082 (= b_free!24451 (not b_next!24451))))

(declare-fun tp!86064 () Bool)

(declare-fun b_and!39753 () Bool)

(assert (=> start!99082 (= tp!86064 b_and!39753)))

(declare-fun b!1157048 () Bool)

(declare-fun res!768331 () Bool)

(declare-fun e!658123 () Bool)

(assert (=> b!1157048 (=> (not res!768331) (not e!658123))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157048 (= res!768331 (validMask!0 mask!1564))))

(declare-fun b!1157049 () Bool)

(declare-datatypes ((Unit!38039 0))(
  ( (Unit!38040) )
))
(declare-fun e!658127 () Unit!38039)

(declare-fun Unit!38041 () Unit!38039)

(assert (=> b!1157049 (= e!658127 Unit!38041)))

(declare-fun b!1157050 () Bool)

(declare-fun e!658131 () Bool)

(declare-fun e!658120 () Bool)

(assert (=> b!1157050 (= e!658131 (not e!658120))))

(declare-fun res!768329 () Bool)

(assert (=> b!1157050 (=> res!768329 e!658120)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157050 (= res!768329 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74853 0))(
  ( (array!74854 (arr!36071 (Array (_ BitVec 32) (_ BitVec 64))) (size!36608 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74853)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157050 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519103 () Unit!38039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74853 (_ BitVec 64) (_ BitVec 32)) Unit!38039)

(assert (=> b!1157050 (= lt!519103 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!658126 () Bool)

(declare-fun b!1157051 () Bool)

(declare-fun lt!519100 () Bool)

(assert (=> b!1157051 (= e!658126 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519100) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!45296 () Bool)

(declare-fun mapRes!45296 () Bool)

(assert (=> mapIsEmpty!45296 mapRes!45296))

(declare-fun b!1157052 () Bool)

(declare-fun res!768332 () Bool)

(assert (=> b!1157052 (=> (not res!768332) (not e!658123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74853 (_ BitVec 32)) Bool)

(assert (=> b!1157052 (= res!768332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1157053 () Bool)

(assert (=> b!1157053 (= e!658123 e!658131)))

(declare-fun res!768323 () Bool)

(assert (=> b!1157053 (=> (not res!768323) (not e!658131))))

(declare-fun lt!519109 () array!74853)

(assert (=> b!1157053 (= res!768323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519109 mask!1564))))

(assert (=> b!1157053 (= lt!519109 (array!74854 (store (arr!36071 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36608 _keys!1208)))))

(declare-fun bm!55016 () Bool)

(declare-fun call!55023 () Unit!38039)

(declare-fun call!55026 () Unit!38039)

(assert (=> bm!55016 (= call!55023 call!55026)))

(declare-fun b!1157054 () Bool)

(declare-fun res!768325 () Bool)

(assert (=> b!1157054 (=> (not res!768325) (not e!658123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157054 (= res!768325 (validKeyInArray!0 k0!934))))

(declare-fun b!1157055 () Bool)

(declare-fun res!768333 () Bool)

(assert (=> b!1157055 (=> (not res!768333) (not e!658123))))

(assert (=> b!1157055 (= res!768333 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36608 _keys!1208))))))

(declare-fun b!1157056 () Bool)

(declare-fun res!768328 () Bool)

(assert (=> b!1157056 (=> (not res!768328) (not e!658123))))

(declare-datatypes ((V!43769 0))(
  ( (V!43770 (val!14547 Int)) )
))
(declare-datatypes ((ValueCell!13781 0))(
  ( (ValueCellFull!13781 (v!17180 V!43769)) (EmptyCell!13781) )
))
(declare-datatypes ((array!74855 0))(
  ( (array!74856 (arr!36072 (Array (_ BitVec 32) ValueCell!13781)) (size!36609 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74855)

(assert (=> b!1157056 (= res!768328 (and (= (size!36609 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36608 _keys!1208) (size!36609 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1157057 () Bool)

(declare-fun e!658125 () Bool)

(declare-datatypes ((tuple2!18520 0))(
  ( (tuple2!18521 (_1!9271 (_ BitVec 64)) (_2!9271 V!43769)) )
))
(declare-datatypes ((List!25263 0))(
  ( (Nil!25260) (Cons!25259 (h!26477 tuple2!18520) (t!36698 List!25263)) )
))
(declare-datatypes ((ListLongMap!16497 0))(
  ( (ListLongMap!16498 (toList!8264 List!25263)) )
))
(declare-fun call!55019 () ListLongMap!16497)

(declare-fun call!55024 () ListLongMap!16497)

(assert (=> b!1157057 (= e!658125 (= call!55019 call!55024))))

(declare-fun b!1157058 () Bool)

(declare-fun res!768326 () Bool)

(assert (=> b!1157058 (=> (not res!768326) (not e!658123))))

(assert (=> b!1157058 (= res!768326 (= (select (arr!36071 _keys!1208) i!673) k0!934))))

(declare-fun b!1157059 () Bool)

(declare-fun e!658117 () Unit!38039)

(declare-fun lt!519110 () Unit!38039)

(assert (=> b!1157059 (= e!658117 lt!519110)))

(assert (=> b!1157059 (= lt!519110 call!55023)))

(declare-fun call!55021 () Bool)

(assert (=> b!1157059 call!55021))

(declare-fun b!1157060 () Bool)

(declare-fun e!658118 () Bool)

(assert (=> b!1157060 (= e!658118 true)))

(declare-fun e!658119 () Bool)

(assert (=> b!1157060 e!658119))

(declare-fun res!768335 () Bool)

(assert (=> b!1157060 (=> (not res!768335) (not e!658119))))

(declare-fun lt!519117 () ListLongMap!16497)

(declare-fun lt!519116 () ListLongMap!16497)

(assert (=> b!1157060 (= res!768335 (= lt!519117 lt!519116))))

(declare-fun lt!519111 () ListLongMap!16497)

(declare-fun -!1368 (ListLongMap!16497 (_ BitVec 64)) ListLongMap!16497)

(assert (=> b!1157060 (= lt!519117 (-!1368 lt!519111 k0!934))))

(declare-fun lt!519112 () V!43769)

(declare-fun +!3688 (ListLongMap!16497 tuple2!18520) ListLongMap!16497)

(assert (=> b!1157060 (= (-!1368 (+!3688 lt!519116 (tuple2!18521 (select (arr!36071 _keys!1208) from!1455) lt!519112)) (select (arr!36071 _keys!1208) from!1455)) lt!519116)))

(declare-fun lt!519119 () Unit!38039)

(declare-fun addThenRemoveForNewKeyIsSame!208 (ListLongMap!16497 (_ BitVec 64) V!43769) Unit!38039)

(assert (=> b!1157060 (= lt!519119 (addThenRemoveForNewKeyIsSame!208 lt!519116 (select (arr!36071 _keys!1208) from!1455) lt!519112))))

(declare-fun lt!519104 () V!43769)

(declare-fun get!18403 (ValueCell!13781 V!43769) V!43769)

(assert (=> b!1157060 (= lt!519112 (get!18403 (select (arr!36072 _values!996) from!1455) lt!519104))))

(declare-fun lt!519121 () Unit!38039)

(declare-fun e!658129 () Unit!38039)

(assert (=> b!1157060 (= lt!519121 e!658129)))

(declare-fun c!115318 () Bool)

(declare-fun contains!6789 (ListLongMap!16497 (_ BitVec 64)) Bool)

(assert (=> b!1157060 (= c!115318 (contains!6789 lt!519116 k0!934))))

(declare-fun zeroValue!944 () V!43769)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43769)

(declare-fun getCurrentListMapNoExtraKeys!4758 (array!74853 array!74855 (_ BitVec 32) (_ BitVec 32) V!43769 V!43769 (_ BitVec 32) Int) ListLongMap!16497)

(assert (=> b!1157060 (= lt!519116 (getCurrentListMapNoExtraKeys!4758 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!768327 () Bool)

(assert (=> start!99082 (=> (not res!768327) (not e!658123))))

(assert (=> start!99082 (= res!768327 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36608 _keys!1208))))))

(assert (=> start!99082 e!658123))

(declare-fun tp_is_empty!28981 () Bool)

(assert (=> start!99082 tp_is_empty!28981))

(declare-fun array_inv!27664 (array!74853) Bool)

(assert (=> start!99082 (array_inv!27664 _keys!1208)))

(assert (=> start!99082 true))

(assert (=> start!99082 tp!86064))

(declare-fun e!658121 () Bool)

(declare-fun array_inv!27665 (array!74855) Bool)

(assert (=> start!99082 (and (array_inv!27665 _values!996) e!658121)))

(declare-fun b!1157047 () Bool)

(declare-fun Unit!38042 () Unit!38039)

(assert (=> b!1157047 (= e!658129 Unit!38042)))

(declare-fun lt!519114 () array!74855)

(declare-fun b!1157061 () Bool)

(assert (=> b!1157061 (= e!658119 (= lt!519117 (getCurrentListMapNoExtraKeys!4758 lt!519109 lt!519114 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1157062 () Bool)

(declare-fun res!768330 () Bool)

(assert (=> b!1157062 (=> (not res!768330) (not e!658131))))

(declare-datatypes ((List!25264 0))(
  ( (Nil!25261) (Cons!25260 (h!26478 (_ BitVec 64)) (t!36699 List!25264)) )
))
(declare-fun arrayNoDuplicates!0 (array!74853 (_ BitVec 32) List!25264) Bool)

(assert (=> b!1157062 (= res!768330 (arrayNoDuplicates!0 lt!519109 #b00000000000000000000000000000000 Nil!25261))))

(declare-fun c!115320 () Bool)

(declare-fun c!115316 () Bool)

(declare-fun bm!55017 () Bool)

(declare-fun addStillContains!910 (ListLongMap!16497 (_ BitVec 64) V!43769 (_ BitVec 64)) Unit!38039)

(assert (=> bm!55017 (= call!55026 (addStillContains!910 lt!519116 (ite (or c!115316 c!115320) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115316 c!115320) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!55018 () Bool)

(assert (=> bm!55018 (= call!55019 (getCurrentListMapNoExtraKeys!4758 lt!519109 lt!519114 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157063 () Bool)

(declare-fun e!658130 () Bool)

(assert (=> b!1157063 (= e!658130 tp_is_empty!28981)))

(declare-fun b!1157064 () Bool)

(declare-fun res!768322 () Bool)

(assert (=> b!1157064 (=> (not res!768322) (not e!658123))))

(assert (=> b!1157064 (= res!768322 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25261))))

(declare-fun b!1157065 () Bool)

(declare-fun e!658116 () Bool)

(assert (=> b!1157065 (= e!658116 e!658118)))

(declare-fun res!768324 () Bool)

(assert (=> b!1157065 (=> res!768324 e!658118)))

(assert (=> b!1157065 (= res!768324 (not (= (select (arr!36071 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1157065 e!658125))

(declare-fun c!115315 () Bool)

(assert (=> b!1157065 (= c!115315 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519102 () Unit!38039)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!609 (array!74853 array!74855 (_ BitVec 32) (_ BitVec 32) V!43769 V!43769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38039)

(assert (=> b!1157065 (= lt!519102 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!609 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157066 () Bool)

(assert (=> b!1157066 call!55021))

(declare-fun lt!519105 () Unit!38039)

(assert (=> b!1157066 (= lt!519105 call!55023)))

(assert (=> b!1157066 (= e!658127 lt!519105)))

(declare-fun b!1157067 () Bool)

(assert (=> b!1157067 (= e!658120 e!658116)))

(declare-fun res!768334 () Bool)

(assert (=> b!1157067 (=> res!768334 e!658116)))

(assert (=> b!1157067 (= res!768334 (not (= from!1455 i!673)))))

(declare-fun lt!519101 () ListLongMap!16497)

(assert (=> b!1157067 (= lt!519101 (getCurrentListMapNoExtraKeys!4758 lt!519109 lt!519114 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1157067 (= lt!519114 (array!74856 (store (arr!36072 _values!996) i!673 (ValueCellFull!13781 lt!519104)) (size!36609 _values!996)))))

(declare-fun dynLambda!2772 (Int (_ BitVec 64)) V!43769)

(assert (=> b!1157067 (= lt!519104 (dynLambda!2772 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1157067 (= lt!519111 (getCurrentListMapNoExtraKeys!4758 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1157068 () Bool)

(assert (=> b!1157068 (= e!658117 e!658127)))

(declare-fun c!115317 () Bool)

(assert (=> b!1157068 (= c!115317 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519100))))

(declare-fun b!1157069 () Bool)

(assert (=> b!1157069 (= e!658121 (and e!658130 mapRes!45296))))

(declare-fun condMapEmpty!45296 () Bool)

(declare-fun mapDefault!45296 () ValueCell!13781)

(assert (=> b!1157069 (= condMapEmpty!45296 (= (arr!36072 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13781)) mapDefault!45296)))))

(declare-fun bm!55019 () Bool)

(declare-fun call!55025 () Bool)

(assert (=> bm!55019 (= call!55021 call!55025)))

(declare-fun e!658124 () Bool)

(declare-fun b!1157070 () Bool)

(assert (=> b!1157070 (= e!658124 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157071 () Bool)

(declare-fun Unit!38043 () Unit!38039)

(assert (=> b!1157071 (= e!658129 Unit!38043)))

(assert (=> b!1157071 (= lt!519100 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1157071 (= c!115316 (and (not lt!519100) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519106 () Unit!38039)

(declare-fun e!658132 () Unit!38039)

(assert (=> b!1157071 (= lt!519106 e!658132)))

(declare-fun lt!519113 () Unit!38039)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!502 (array!74853 array!74855 (_ BitVec 32) (_ BitVec 32) V!43769 V!43769 (_ BitVec 64) (_ BitVec 32) Int) Unit!38039)

(assert (=> b!1157071 (= lt!519113 (lemmaListMapContainsThenArrayContainsFrom!502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115319 () Bool)

(assert (=> b!1157071 (= c!115319 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768336 () Bool)

(assert (=> b!1157071 (= res!768336 e!658126)))

(assert (=> b!1157071 (=> (not res!768336) (not e!658124))))

(assert (=> b!1157071 e!658124))

(declare-fun lt!519107 () Unit!38039)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74853 (_ BitVec 32) (_ BitVec 32)) Unit!38039)

(assert (=> b!1157071 (= lt!519107 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1157071 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25261)))

(declare-fun lt!519118 () Unit!38039)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74853 (_ BitVec 64) (_ BitVec 32) List!25264) Unit!38039)

(assert (=> b!1157071 (= lt!519118 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25261))))

(assert (=> b!1157071 false))

(declare-fun call!55020 () ListLongMap!16497)

(declare-fun lt!519115 () ListLongMap!16497)

(declare-fun bm!55020 () Bool)

(assert (=> bm!55020 (= call!55020 (+!3688 (ite c!115316 lt!519115 lt!519116) (ite c!115316 (tuple2!18521 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115320 (tuple2!18521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18521 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!55021 () Bool)

(declare-fun call!55022 () ListLongMap!16497)

(assert (=> bm!55021 (= call!55022 call!55020)))

(declare-fun b!1157072 () Bool)

(assert (=> b!1157072 (= e!658125 (= call!55019 (-!1368 call!55024 k0!934)))))

(declare-fun mapNonEmpty!45296 () Bool)

(declare-fun tp!86063 () Bool)

(declare-fun e!658128 () Bool)

(assert (=> mapNonEmpty!45296 (= mapRes!45296 (and tp!86063 e!658128))))

(declare-fun mapRest!45296 () (Array (_ BitVec 32) ValueCell!13781))

(declare-fun mapKey!45296 () (_ BitVec 32))

(declare-fun mapValue!45296 () ValueCell!13781)

(assert (=> mapNonEmpty!45296 (= (arr!36072 _values!996) (store mapRest!45296 mapKey!45296 mapValue!45296))))

(declare-fun b!1157073 () Bool)

(assert (=> b!1157073 (contains!6789 call!55020 k0!934)))

(declare-fun lt!519120 () Unit!38039)

(assert (=> b!1157073 (= lt!519120 (addStillContains!910 lt!519115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1157073 call!55025))

(assert (=> b!1157073 (= lt!519115 (+!3688 lt!519116 (tuple2!18521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!519108 () Unit!38039)

(assert (=> b!1157073 (= lt!519108 call!55026)))

(assert (=> b!1157073 (= e!658132 lt!519120)))

(declare-fun b!1157074 () Bool)

(assert (=> b!1157074 (= e!658128 tp_is_empty!28981)))

(declare-fun bm!55022 () Bool)

(assert (=> bm!55022 (= call!55025 (contains!6789 (ite c!115316 lt!519115 call!55022) k0!934))))

(declare-fun b!1157075 () Bool)

(assert (=> b!1157075 (= c!115320 (and (not lt!519100) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1157075 (= e!658132 e!658117)))

(declare-fun bm!55023 () Bool)

(assert (=> bm!55023 (= call!55024 (getCurrentListMapNoExtraKeys!4758 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157076 () Bool)

(assert (=> b!1157076 (= e!658126 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!99082 res!768327) b!1157048))

(assert (= (and b!1157048 res!768331) b!1157056))

(assert (= (and b!1157056 res!768328) b!1157052))

(assert (= (and b!1157052 res!768332) b!1157064))

(assert (= (and b!1157064 res!768322) b!1157055))

(assert (= (and b!1157055 res!768333) b!1157054))

(assert (= (and b!1157054 res!768325) b!1157058))

(assert (= (and b!1157058 res!768326) b!1157053))

(assert (= (and b!1157053 res!768323) b!1157062))

(assert (= (and b!1157062 res!768330) b!1157050))

(assert (= (and b!1157050 (not res!768329)) b!1157067))

(assert (= (and b!1157067 (not res!768334)) b!1157065))

(assert (= (and b!1157065 c!115315) b!1157072))

(assert (= (and b!1157065 (not c!115315)) b!1157057))

(assert (= (or b!1157072 b!1157057) bm!55023))

(assert (= (or b!1157072 b!1157057) bm!55018))

(assert (= (and b!1157065 (not res!768324)) b!1157060))

(assert (= (and b!1157060 c!115318) b!1157071))

(assert (= (and b!1157060 (not c!115318)) b!1157047))

(assert (= (and b!1157071 c!115316) b!1157073))

(assert (= (and b!1157071 (not c!115316)) b!1157075))

(assert (= (and b!1157075 c!115320) b!1157059))

(assert (= (and b!1157075 (not c!115320)) b!1157068))

(assert (= (and b!1157068 c!115317) b!1157066))

(assert (= (and b!1157068 (not c!115317)) b!1157049))

(assert (= (or b!1157059 b!1157066) bm!55016))

(assert (= (or b!1157059 b!1157066) bm!55021))

(assert (= (or b!1157059 b!1157066) bm!55019))

(assert (= (or b!1157073 bm!55019) bm!55022))

(assert (= (or b!1157073 bm!55016) bm!55017))

(assert (= (or b!1157073 bm!55021) bm!55020))

(assert (= (and b!1157071 c!115319) b!1157076))

(assert (= (and b!1157071 (not c!115319)) b!1157051))

(assert (= (and b!1157071 res!768336) b!1157070))

(assert (= (and b!1157060 res!768335) b!1157061))

(assert (= (and b!1157069 condMapEmpty!45296) mapIsEmpty!45296))

(assert (= (and b!1157069 (not condMapEmpty!45296)) mapNonEmpty!45296))

(get-info :version)

(assert (= (and mapNonEmpty!45296 ((_ is ValueCellFull!13781) mapValue!45296)) b!1157074))

(assert (= (and b!1157069 ((_ is ValueCellFull!13781) mapDefault!45296)) b!1157063))

(assert (= start!99082 b!1157069))

(declare-fun b_lambda!19551 () Bool)

(assert (=> (not b_lambda!19551) (not b!1157067)))

(declare-fun t!36697 () Bool)

(declare-fun tb!9255 () Bool)

(assert (=> (and start!99082 (= defaultEntry!1004 defaultEntry!1004) t!36697) tb!9255))

(declare-fun result!19083 () Bool)

(assert (=> tb!9255 (= result!19083 tp_is_empty!28981)))

(assert (=> b!1157067 t!36697))

(declare-fun b_and!39755 () Bool)

(assert (= b_and!39753 (and (=> t!36697 result!19083) b_and!39755)))

(declare-fun m!1066877 () Bool)

(assert (=> b!1157070 m!1066877))

(declare-fun m!1066879 () Bool)

(assert (=> b!1157061 m!1066879))

(declare-fun m!1066881 () Bool)

(assert (=> b!1157064 m!1066881))

(declare-fun m!1066883 () Bool)

(assert (=> start!99082 m!1066883))

(declare-fun m!1066885 () Bool)

(assert (=> start!99082 m!1066885))

(assert (=> bm!55018 m!1066879))

(declare-fun m!1066887 () Bool)

(assert (=> b!1157054 m!1066887))

(declare-fun m!1066889 () Bool)

(assert (=> mapNonEmpty!45296 m!1066889))

(declare-fun m!1066891 () Bool)

(assert (=> b!1157058 m!1066891))

(declare-fun m!1066893 () Bool)

(assert (=> b!1157067 m!1066893))

(declare-fun m!1066895 () Bool)

(assert (=> b!1157067 m!1066895))

(declare-fun m!1066897 () Bool)

(assert (=> b!1157067 m!1066897))

(declare-fun m!1066899 () Bool)

(assert (=> b!1157067 m!1066899))

(assert (=> b!1157076 m!1066877))

(declare-fun m!1066901 () Bool)

(assert (=> b!1157052 m!1066901))

(declare-fun m!1066903 () Bool)

(assert (=> b!1157053 m!1066903))

(declare-fun m!1066905 () Bool)

(assert (=> b!1157053 m!1066905))

(declare-fun m!1066907 () Bool)

(assert (=> bm!55022 m!1066907))

(declare-fun m!1066909 () Bool)

(assert (=> b!1157073 m!1066909))

(declare-fun m!1066911 () Bool)

(assert (=> b!1157073 m!1066911))

(declare-fun m!1066913 () Bool)

(assert (=> b!1157073 m!1066913))

(declare-fun m!1066915 () Bool)

(assert (=> b!1157062 m!1066915))

(declare-fun m!1066917 () Bool)

(assert (=> b!1157050 m!1066917))

(declare-fun m!1066919 () Bool)

(assert (=> b!1157050 m!1066919))

(declare-fun m!1066921 () Bool)

(assert (=> b!1157060 m!1066921))

(declare-fun m!1066923 () Bool)

(assert (=> b!1157060 m!1066923))

(declare-fun m!1066925 () Bool)

(assert (=> b!1157060 m!1066925))

(declare-fun m!1066927 () Bool)

(assert (=> b!1157060 m!1066927))

(assert (=> b!1157060 m!1066925))

(declare-fun m!1066929 () Bool)

(assert (=> b!1157060 m!1066929))

(declare-fun m!1066931 () Bool)

(assert (=> b!1157060 m!1066931))

(declare-fun m!1066933 () Bool)

(assert (=> b!1157060 m!1066933))

(assert (=> b!1157060 m!1066925))

(assert (=> b!1157060 m!1066923))

(declare-fun m!1066935 () Bool)

(assert (=> b!1157060 m!1066935))

(assert (=> b!1157060 m!1066935))

(declare-fun m!1066937 () Bool)

(assert (=> b!1157060 m!1066937))

(assert (=> bm!55023 m!1066921))

(declare-fun m!1066939 () Bool)

(assert (=> bm!55017 m!1066939))

(declare-fun m!1066941 () Bool)

(assert (=> b!1157072 m!1066941))

(declare-fun m!1066943 () Bool)

(assert (=> b!1157071 m!1066943))

(declare-fun m!1066945 () Bool)

(assert (=> b!1157071 m!1066945))

(declare-fun m!1066947 () Bool)

(assert (=> b!1157071 m!1066947))

(declare-fun m!1066949 () Bool)

(assert (=> b!1157071 m!1066949))

(declare-fun m!1066951 () Bool)

(assert (=> b!1157048 m!1066951))

(assert (=> b!1157065 m!1066925))

(declare-fun m!1066953 () Bool)

(assert (=> b!1157065 m!1066953))

(declare-fun m!1066955 () Bool)

(assert (=> bm!55020 m!1066955))

(check-sat (not bm!55017) (not b!1157064) (not b!1157067) (not bm!55020) (not b_next!24451) (not b!1157076) tp_is_empty!28981 (not b!1157050) (not b!1157065) (not b!1157061) (not bm!55023) (not b!1157052) (not b!1157070) (not bm!55018) (not b!1157073) (not start!99082) (not b!1157048) (not b!1157054) (not mapNonEmpty!45296) b_and!39755 (not bm!55022) (not b!1157060) (not b!1157072) (not b!1157071) (not b!1157062) (not b!1157053) (not b_lambda!19551))
(check-sat b_and!39755 (not b_next!24451))
