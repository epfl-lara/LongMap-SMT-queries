; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98950 () Bool)

(assert start!98950)

(declare-fun b_free!24555 () Bool)

(declare-fun b_next!24555 () Bool)

(assert (=> start!98950 (= b_free!24555 (not b_next!24555))))

(declare-fun tp!86376 () Bool)

(declare-fun b_and!39959 () Bool)

(assert (=> start!98950 (= tp!86376 b_and!39959)))

(declare-fun b!1160542 () Bool)

(declare-datatypes ((Unit!38262 0))(
  ( (Unit!38263) )
))
(declare-fun e!659941 () Unit!38262)

(declare-fun Unit!38264 () Unit!38262)

(assert (=> b!1160542 (= e!659941 Unit!38264)))

(declare-fun lt!522056 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1160542 (= lt!522056 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115858 () Bool)

(assert (=> b!1160542 (= c!115858 (and (not lt!522056) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522049 () Unit!38262)

(declare-fun e!659947 () Unit!38262)

(assert (=> b!1160542 (= lt!522049 e!659947)))

(declare-datatypes ((V!43907 0))(
  ( (V!43908 (val!14599 Int)) )
))
(declare-fun zeroValue!944 () V!43907)

(declare-datatypes ((array!75011 0))(
  ( (array!75012 (arr!36156 (Array (_ BitVec 32) (_ BitVec 64))) (size!36692 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75011)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13833 0))(
  ( (ValueCellFull!13833 (v!17236 V!43907)) (EmptyCell!13833) )
))
(declare-datatypes ((array!75013 0))(
  ( (array!75014 (arr!36157 (Array (_ BitVec 32) ValueCell!13833)) (size!36693 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75013)

(declare-fun minValue!944 () V!43907)

(declare-fun lt!522061 () Unit!38262)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!531 (array!75011 array!75013 (_ BitVec 32) (_ BitVec 32) V!43907 V!43907 (_ BitVec 64) (_ BitVec 32) Int) Unit!38262)

(assert (=> b!1160542 (= lt!522061 (lemmaListMapContainsThenArrayContainsFrom!531 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115856 () Bool)

(assert (=> b!1160542 (= c!115856 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770166 () Bool)

(declare-fun e!659940 () Bool)

(assert (=> b!1160542 (= res!770166 e!659940)))

(declare-fun e!659945 () Bool)

(assert (=> b!1160542 (=> (not res!770166) (not e!659945))))

(assert (=> b!1160542 e!659945))

(declare-fun lt!522067 () Unit!38262)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75011 (_ BitVec 32) (_ BitVec 32)) Unit!38262)

(assert (=> b!1160542 (= lt!522067 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25333 0))(
  ( (Nil!25330) (Cons!25329 (h!26538 (_ BitVec 64)) (t!36880 List!25333)) )
))
(declare-fun arrayNoDuplicates!0 (array!75011 (_ BitVec 32) List!25333) Bool)

(assert (=> b!1160542 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25330)))

(declare-fun lt!522060 () Unit!38262)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75011 (_ BitVec 64) (_ BitVec 32) List!25333) Unit!38262)

(assert (=> b!1160542 (= lt!522060 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25330))))

(assert (=> b!1160542 false))

(declare-fun b!1160543 () Bool)

(declare-fun res!770164 () Bool)

(declare-fun e!659949 () Bool)

(assert (=> b!1160543 (=> (not res!770164) (not e!659949))))

(assert (=> b!1160543 (= res!770164 (and (= (size!36693 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36692 _keys!1208) (size!36693 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1160544 () Bool)

(declare-fun Unit!38265 () Unit!38262)

(assert (=> b!1160544 (= e!659941 Unit!38265)))

(declare-fun b!1160545 () Bool)

(declare-fun res!770154 () Bool)

(declare-fun e!659937 () Bool)

(assert (=> b!1160545 (=> (not res!770154) (not e!659937))))

(declare-fun lt!522050 () array!75011)

(assert (=> b!1160545 (= res!770154 (arrayNoDuplicates!0 lt!522050 #b00000000000000000000000000000000 Nil!25330))))

(declare-fun b!1160547 () Bool)

(declare-fun e!659952 () Bool)

(declare-fun e!659951 () Bool)

(assert (=> b!1160547 (= e!659952 e!659951)))

(declare-fun res!770156 () Bool)

(assert (=> b!1160547 (=> res!770156 e!659951)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160547 (= res!770156 (not (= from!1455 i!673)))))

(declare-datatypes ((tuple2!18596 0))(
  ( (tuple2!18597 (_1!9309 (_ BitVec 64)) (_2!9309 V!43907)) )
))
(declare-datatypes ((List!25334 0))(
  ( (Nil!25331) (Cons!25330 (h!26539 tuple2!18596) (t!36881 List!25334)) )
))
(declare-datatypes ((ListLongMap!16565 0))(
  ( (ListLongMap!16566 (toList!8298 List!25334)) )
))
(declare-fun lt!522048 () ListLongMap!16565)

(declare-fun lt!522057 () array!75013)

(declare-fun getCurrentListMapNoExtraKeys!4762 (array!75011 array!75013 (_ BitVec 32) (_ BitVec 32) V!43907 V!43907 (_ BitVec 32) Int) ListLongMap!16565)

(assert (=> b!1160547 (= lt!522048 (getCurrentListMapNoExtraKeys!4762 lt!522050 lt!522057 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!522054 () V!43907)

(assert (=> b!1160547 (= lt!522057 (array!75014 (store (arr!36157 _values!996) i!673 (ValueCellFull!13833 lt!522054)) (size!36693 _values!996)))))

(declare-fun dynLambda!2762 (Int (_ BitVec 64)) V!43907)

(assert (=> b!1160547 (= lt!522054 (dynLambda!2762 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!522062 () ListLongMap!16565)

(assert (=> b!1160547 (= lt!522062 (getCurrentListMapNoExtraKeys!4762 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160548 () Bool)

(declare-fun e!659946 () Unit!38262)

(declare-fun Unit!38266 () Unit!38262)

(assert (=> b!1160548 (= e!659946 Unit!38266)))

(declare-fun call!56203 () ListLongMap!16565)

(declare-fun e!659939 () Bool)

(declare-fun call!56209 () ListLongMap!16565)

(declare-fun b!1160549 () Bool)

(declare-fun -!1407 (ListLongMap!16565 (_ BitVec 64)) ListLongMap!16565)

(assert (=> b!1160549 (= e!659939 (= call!56209 (-!1407 call!56203 k0!934)))))

(declare-fun b!1160550 () Bool)

(declare-fun arrayContainsKey!0 (array!75011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160550 (= e!659945 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56199 () Bool)

(assert (=> bm!56199 (= call!56203 (getCurrentListMapNoExtraKeys!4762 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160551 () Bool)

(declare-fun res!770160 () Bool)

(assert (=> b!1160551 (=> (not res!770160) (not e!659949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160551 (= res!770160 (validKeyInArray!0 k0!934))))

(declare-fun call!56204 () ListLongMap!16565)

(declare-fun bm!56200 () Bool)

(declare-fun lt!522055 () ListLongMap!16565)

(declare-fun c!115854 () Bool)

(declare-fun +!3703 (ListLongMap!16565 tuple2!18596) ListLongMap!16565)

(assert (=> bm!56200 (= call!56204 (+!3703 lt!522055 (ite (or c!115858 c!115854) (tuple2!18597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1160552 () Bool)

(declare-fun e!659950 () Bool)

(declare-fun tp_is_empty!29085 () Bool)

(assert (=> b!1160552 (= e!659950 tp_is_empty!29085)))

(declare-fun b!1160553 () Bool)

(declare-fun e!659942 () Unit!38262)

(assert (=> b!1160553 (= e!659942 e!659946)))

(declare-fun c!115853 () Bool)

(assert (=> b!1160553 (= c!115853 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522056))))

(declare-fun b!1160554 () Bool)

(assert (=> b!1160554 (= e!659940 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522056) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160555 () Bool)

(declare-fun res!770167 () Bool)

(assert (=> b!1160555 (=> (not res!770167) (not e!659949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160555 (= res!770167 (validMask!0 mask!1564))))

(declare-fun b!1160556 () Bool)

(declare-fun e!659943 () Bool)

(declare-fun e!659936 () Bool)

(declare-fun mapRes!45452 () Bool)

(assert (=> b!1160556 (= e!659943 (and e!659936 mapRes!45452))))

(declare-fun condMapEmpty!45452 () Bool)

(declare-fun mapDefault!45452 () ValueCell!13833)

(assert (=> b!1160556 (= condMapEmpty!45452 (= (arr!36157 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13833)) mapDefault!45452)))))

(declare-fun b!1160557 () Bool)

(declare-fun e!659944 () Bool)

(assert (=> b!1160557 (= e!659944 true)))

(declare-fun e!659938 () Bool)

(assert (=> b!1160557 e!659938))

(declare-fun res!770162 () Bool)

(assert (=> b!1160557 (=> (not res!770162) (not e!659938))))

(declare-fun lt!522065 () ListLongMap!16565)

(assert (=> b!1160557 (= res!770162 (= lt!522065 lt!522055))))

(assert (=> b!1160557 (= lt!522065 (-!1407 lt!522062 k0!934))))

(declare-fun lt!522052 () V!43907)

(assert (=> b!1160557 (= (-!1407 (+!3703 lt!522055 (tuple2!18597 (select (arr!36156 _keys!1208) from!1455) lt!522052)) (select (arr!36156 _keys!1208) from!1455)) lt!522055)))

(declare-fun lt!522051 () Unit!38262)

(declare-fun addThenRemoveForNewKeyIsSame!241 (ListLongMap!16565 (_ BitVec 64) V!43907) Unit!38262)

(assert (=> b!1160557 (= lt!522051 (addThenRemoveForNewKeyIsSame!241 lt!522055 (select (arr!36156 _keys!1208) from!1455) lt!522052))))

(declare-fun get!18439 (ValueCell!13833 V!43907) V!43907)

(assert (=> b!1160557 (= lt!522052 (get!18439 (select (arr!36157 _values!996) from!1455) lt!522054))))

(declare-fun lt!522058 () Unit!38262)

(assert (=> b!1160557 (= lt!522058 e!659941)))

(declare-fun c!115855 () Bool)

(declare-fun contains!6804 (ListLongMap!16565 (_ BitVec 64)) Bool)

(assert (=> b!1160557 (= c!115855 (contains!6804 lt!522055 k0!934))))

(assert (=> b!1160557 (= lt!522055 (getCurrentListMapNoExtraKeys!4762 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!56201 () Bool)

(declare-fun call!56208 () Unit!38262)

(declare-fun call!56206 () Unit!38262)

(assert (=> bm!56201 (= call!56208 call!56206)))

(declare-fun call!56205 () Bool)

(declare-fun bm!56202 () Bool)

(declare-fun call!56207 () ListLongMap!16565)

(declare-fun lt!522069 () ListLongMap!16565)

(assert (=> bm!56202 (= call!56205 (contains!6804 (ite c!115858 lt!522069 call!56207) k0!934))))

(declare-fun b!1160558 () Bool)

(assert (=> b!1160558 (= c!115854 (and (not lt!522056) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1160558 (= e!659947 e!659942)))

(declare-fun b!1160559 () Bool)

(declare-fun res!770161 () Bool)

(assert (=> b!1160559 (=> (not res!770161) (not e!659949))))

(assert (=> b!1160559 (= res!770161 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25330))))

(declare-fun b!1160560 () Bool)

(declare-fun res!770165 () Bool)

(assert (=> b!1160560 (=> (not res!770165) (not e!659949))))

(assert (=> b!1160560 (= res!770165 (= (select (arr!36156 _keys!1208) i!673) k0!934))))

(declare-fun bm!56203 () Bool)

(declare-fun addStillContains!945 (ListLongMap!16565 (_ BitVec 64) V!43907 (_ BitVec 64)) Unit!38262)

(assert (=> bm!56203 (= call!56206 (addStillContains!945 lt!522055 (ite (or c!115858 c!115854) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115858 c!115854) zeroValue!944 minValue!944) k0!934))))

(declare-fun res!770155 () Bool)

(assert (=> start!98950 (=> (not res!770155) (not e!659949))))

(assert (=> start!98950 (= res!770155 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36692 _keys!1208))))))

(assert (=> start!98950 e!659949))

(assert (=> start!98950 tp_is_empty!29085))

(declare-fun array_inv!27666 (array!75011) Bool)

(assert (=> start!98950 (array_inv!27666 _keys!1208)))

(assert (=> start!98950 true))

(assert (=> start!98950 tp!86376))

(declare-fun array_inv!27667 (array!75013) Bool)

(assert (=> start!98950 (and (array_inv!27667 _values!996) e!659943)))

(declare-fun b!1160546 () Bool)

(declare-fun res!770159 () Bool)

(assert (=> b!1160546 (=> (not res!770159) (not e!659949))))

(assert (=> b!1160546 (= res!770159 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36692 _keys!1208))))))

(declare-fun bm!56204 () Bool)

(assert (=> bm!56204 (= call!56209 (getCurrentListMapNoExtraKeys!4762 lt!522050 lt!522057 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160561 () Bool)

(assert (=> b!1160561 (contains!6804 (+!3703 lt!522069 (tuple2!18597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!522063 () Unit!38262)

(assert (=> b!1160561 (= lt!522063 (addStillContains!945 lt!522069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1160561 call!56205))

(assert (=> b!1160561 (= lt!522069 call!56204)))

(declare-fun lt!522053 () Unit!38262)

(assert (=> b!1160561 (= lt!522053 call!56206)))

(assert (=> b!1160561 (= e!659947 lt!522063)))

(declare-fun b!1160562 () Bool)

(declare-fun lt!522059 () Unit!38262)

(assert (=> b!1160562 (= e!659942 lt!522059)))

(assert (=> b!1160562 (= lt!522059 call!56208)))

(declare-fun call!56202 () Bool)

(assert (=> b!1160562 call!56202))

(declare-fun bm!56205 () Bool)

(assert (=> bm!56205 (= call!56207 call!56204)))

(declare-fun b!1160563 () Bool)

(assert (=> b!1160563 call!56202))

(declare-fun lt!522064 () Unit!38262)

(assert (=> b!1160563 (= lt!522064 call!56208)))

(assert (=> b!1160563 (= e!659946 lt!522064)))

(declare-fun mapIsEmpty!45452 () Bool)

(assert (=> mapIsEmpty!45452 mapRes!45452))

(declare-fun b!1160564 () Bool)

(assert (=> b!1160564 (= e!659936 tp_is_empty!29085)))

(declare-fun b!1160565 () Bool)

(declare-fun res!770158 () Bool)

(assert (=> b!1160565 (=> (not res!770158) (not e!659949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75011 (_ BitVec 32)) Bool)

(assert (=> b!1160565 (= res!770158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1160566 () Bool)

(assert (=> b!1160566 (= e!659951 e!659944)))

(declare-fun res!770157 () Bool)

(assert (=> b!1160566 (=> res!770157 e!659944)))

(assert (=> b!1160566 (= res!770157 (not (= (select (arr!36156 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1160566 e!659939))

(declare-fun c!115857 () Bool)

(assert (=> b!1160566 (= c!115857 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522066 () Unit!38262)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!637 (array!75011 array!75013 (_ BitVec 32) (_ BitVec 32) V!43907 V!43907 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38262)

(assert (=> b!1160566 (= lt!522066 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!637 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45452 () Bool)

(declare-fun tp!86375 () Bool)

(assert (=> mapNonEmpty!45452 (= mapRes!45452 (and tp!86375 e!659950))))

(declare-fun mapKey!45452 () (_ BitVec 32))

(declare-fun mapRest!45452 () (Array (_ BitVec 32) ValueCell!13833))

(declare-fun mapValue!45452 () ValueCell!13833)

(assert (=> mapNonEmpty!45452 (= (arr!36157 _values!996) (store mapRest!45452 mapKey!45452 mapValue!45452))))

(declare-fun b!1160567 () Bool)

(assert (=> b!1160567 (= e!659940 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160568 () Bool)

(assert (=> b!1160568 (= e!659939 (= call!56209 call!56203))))

(declare-fun b!1160569 () Bool)

(assert (=> b!1160569 (= e!659938 (= lt!522065 (getCurrentListMapNoExtraKeys!4762 lt!522050 lt!522057 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!56206 () Bool)

(assert (=> bm!56206 (= call!56202 call!56205)))

(declare-fun b!1160570 () Bool)

(assert (=> b!1160570 (= e!659937 (not e!659952))))

(declare-fun res!770168 () Bool)

(assert (=> b!1160570 (=> res!770168 e!659952)))

(assert (=> b!1160570 (= res!770168 (bvsgt from!1455 i!673))))

(assert (=> b!1160570 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!522068 () Unit!38262)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75011 (_ BitVec 64) (_ BitVec 32)) Unit!38262)

(assert (=> b!1160570 (= lt!522068 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1160571 () Bool)

(assert (=> b!1160571 (= e!659949 e!659937)))

(declare-fun res!770163 () Bool)

(assert (=> b!1160571 (=> (not res!770163) (not e!659937))))

(assert (=> b!1160571 (= res!770163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522050 mask!1564))))

(assert (=> b!1160571 (= lt!522050 (array!75012 (store (arr!36156 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36692 _keys!1208)))))

(assert (= (and start!98950 res!770155) b!1160555))

(assert (= (and b!1160555 res!770167) b!1160543))

(assert (= (and b!1160543 res!770164) b!1160565))

(assert (= (and b!1160565 res!770158) b!1160559))

(assert (= (and b!1160559 res!770161) b!1160546))

(assert (= (and b!1160546 res!770159) b!1160551))

(assert (= (and b!1160551 res!770160) b!1160560))

(assert (= (and b!1160560 res!770165) b!1160571))

(assert (= (and b!1160571 res!770163) b!1160545))

(assert (= (and b!1160545 res!770154) b!1160570))

(assert (= (and b!1160570 (not res!770168)) b!1160547))

(assert (= (and b!1160547 (not res!770156)) b!1160566))

(assert (= (and b!1160566 c!115857) b!1160549))

(assert (= (and b!1160566 (not c!115857)) b!1160568))

(assert (= (or b!1160549 b!1160568) bm!56204))

(assert (= (or b!1160549 b!1160568) bm!56199))

(assert (= (and b!1160566 (not res!770157)) b!1160557))

(assert (= (and b!1160557 c!115855) b!1160542))

(assert (= (and b!1160557 (not c!115855)) b!1160544))

(assert (= (and b!1160542 c!115858) b!1160561))

(assert (= (and b!1160542 (not c!115858)) b!1160558))

(assert (= (and b!1160558 c!115854) b!1160562))

(assert (= (and b!1160558 (not c!115854)) b!1160553))

(assert (= (and b!1160553 c!115853) b!1160563))

(assert (= (and b!1160553 (not c!115853)) b!1160548))

(assert (= (or b!1160562 b!1160563) bm!56201))

(assert (= (or b!1160562 b!1160563) bm!56205))

(assert (= (or b!1160562 b!1160563) bm!56206))

(assert (= (or b!1160561 bm!56206) bm!56202))

(assert (= (or b!1160561 bm!56201) bm!56203))

(assert (= (or b!1160561 bm!56205) bm!56200))

(assert (= (and b!1160542 c!115856) b!1160567))

(assert (= (and b!1160542 (not c!115856)) b!1160554))

(assert (= (and b!1160542 res!770166) b!1160550))

(assert (= (and b!1160557 res!770162) b!1160569))

(assert (= (and b!1160556 condMapEmpty!45452) mapIsEmpty!45452))

(assert (= (and b!1160556 (not condMapEmpty!45452)) mapNonEmpty!45452))

(get-info :version)

(assert (= (and mapNonEmpty!45452 ((_ is ValueCellFull!13833) mapValue!45452)) b!1160552))

(assert (= (and b!1160556 ((_ is ValueCellFull!13833) mapDefault!45452)) b!1160564))

(assert (= start!98950 b!1160556))

(declare-fun b_lambda!19661 () Bool)

(assert (=> (not b_lambda!19661) (not b!1160547)))

(declare-fun t!36879 () Bool)

(declare-fun tb!9367 () Bool)

(assert (=> (and start!98950 (= defaultEntry!1004 defaultEntry!1004) t!36879) tb!9367))

(declare-fun result!19299 () Bool)

(assert (=> tb!9367 (= result!19299 tp_is_empty!29085)))

(assert (=> b!1160547 t!36879))

(declare-fun b_and!39961 () Bool)

(assert (= b_and!39959 (and (=> t!36879 result!19299) b_and!39961)))

(declare-fun m!1069477 () Bool)

(assert (=> bm!56200 m!1069477))

(declare-fun m!1069479 () Bool)

(assert (=> b!1160551 m!1069479))

(declare-fun m!1069481 () Bool)

(assert (=> b!1160542 m!1069481))

(declare-fun m!1069483 () Bool)

(assert (=> b!1160542 m!1069483))

(declare-fun m!1069485 () Bool)

(assert (=> b!1160542 m!1069485))

(declare-fun m!1069487 () Bool)

(assert (=> b!1160542 m!1069487))

(declare-fun m!1069489 () Bool)

(assert (=> b!1160566 m!1069489))

(declare-fun m!1069491 () Bool)

(assert (=> b!1160566 m!1069491))

(declare-fun m!1069493 () Bool)

(assert (=> b!1160570 m!1069493))

(declare-fun m!1069495 () Bool)

(assert (=> b!1160570 m!1069495))

(declare-fun m!1069497 () Bool)

(assert (=> b!1160545 m!1069497))

(declare-fun m!1069499 () Bool)

(assert (=> b!1160547 m!1069499))

(declare-fun m!1069501 () Bool)

(assert (=> b!1160547 m!1069501))

(declare-fun m!1069503 () Bool)

(assert (=> b!1160547 m!1069503))

(declare-fun m!1069505 () Bool)

(assert (=> b!1160547 m!1069505))

(declare-fun m!1069507 () Bool)

(assert (=> bm!56199 m!1069507))

(declare-fun m!1069509 () Bool)

(assert (=> b!1160567 m!1069509))

(declare-fun m!1069511 () Bool)

(assert (=> b!1160559 m!1069511))

(declare-fun m!1069513 () Bool)

(assert (=> b!1160549 m!1069513))

(declare-fun m!1069515 () Bool)

(assert (=> b!1160565 m!1069515))

(declare-fun m!1069517 () Bool)

(assert (=> b!1160569 m!1069517))

(declare-fun m!1069519 () Bool)

(assert (=> mapNonEmpty!45452 m!1069519))

(declare-fun m!1069521 () Bool)

(assert (=> b!1160557 m!1069521))

(declare-fun m!1069523 () Bool)

(assert (=> b!1160557 m!1069523))

(declare-fun m!1069525 () Bool)

(assert (=> b!1160557 m!1069525))

(assert (=> b!1160557 m!1069489))

(declare-fun m!1069527 () Bool)

(assert (=> b!1160557 m!1069527))

(declare-fun m!1069529 () Bool)

(assert (=> b!1160557 m!1069529))

(assert (=> b!1160557 m!1069521))

(declare-fun m!1069531 () Bool)

(assert (=> b!1160557 m!1069531))

(assert (=> b!1160557 m!1069525))

(assert (=> b!1160557 m!1069489))

(assert (=> b!1160557 m!1069507))

(assert (=> b!1160557 m!1069489))

(declare-fun m!1069533 () Bool)

(assert (=> b!1160557 m!1069533))

(declare-fun m!1069535 () Bool)

(assert (=> bm!56203 m!1069535))

(assert (=> b!1160550 m!1069509))

(assert (=> bm!56204 m!1069517))

(declare-fun m!1069537 () Bool)

(assert (=> b!1160561 m!1069537))

(assert (=> b!1160561 m!1069537))

(declare-fun m!1069539 () Bool)

(assert (=> b!1160561 m!1069539))

(declare-fun m!1069541 () Bool)

(assert (=> b!1160561 m!1069541))

(declare-fun m!1069543 () Bool)

(assert (=> b!1160571 m!1069543))

(declare-fun m!1069545 () Bool)

(assert (=> b!1160571 m!1069545))

(declare-fun m!1069547 () Bool)

(assert (=> start!98950 m!1069547))

(declare-fun m!1069549 () Bool)

(assert (=> start!98950 m!1069549))

(declare-fun m!1069551 () Bool)

(assert (=> bm!56202 m!1069551))

(declare-fun m!1069553 () Bool)

(assert (=> b!1160555 m!1069553))

(declare-fun m!1069555 () Bool)

(assert (=> b!1160560 m!1069555))

(check-sat (not bm!56200) (not b!1160570) (not b!1160551) (not bm!56204) (not b!1160566) (not start!98950) (not b!1160561) b_and!39961 (not b!1160567) (not b_lambda!19661) (not b!1160545) (not b!1160550) (not mapNonEmpty!45452) (not b!1160549) (not b!1160542) (not bm!56202) (not b!1160571) (not b_next!24555) (not b!1160559) (not b!1160569) (not b!1160565) tp_is_empty!29085 (not b!1160547) (not b!1160555) (not bm!56199) (not bm!56203) (not b!1160557))
(check-sat b_and!39961 (not b_next!24555))
