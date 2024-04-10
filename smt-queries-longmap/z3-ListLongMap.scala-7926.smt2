; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98398 () Bool)

(assert start!98398)

(declare-fun b_free!24003 () Bool)

(declare-fun b_next!24003 () Bool)

(assert (=> start!98398 (= b_free!24003 (not b_next!24003))))

(declare-fun tp!84720 () Bool)

(declare-fun b_and!38855 () Bool)

(assert (=> start!98398 (= tp!84720 b_and!38855)))

(declare-fun b!1135362 () Bool)

(declare-fun res!757872 () Bool)

(declare-fun e!646120 () Bool)

(assert (=> b!1135362 (=> (not res!757872) (not e!646120))))

(declare-datatypes ((array!73927 0))(
  ( (array!73928 (arr!35614 (Array (_ BitVec 32) (_ BitVec 64))) (size!36150 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73927)

(declare-datatypes ((List!24834 0))(
  ( (Nil!24831) (Cons!24830 (h!26039 (_ BitVec 64)) (t!35829 List!24834)) )
))
(declare-fun arrayNoDuplicates!0 (array!73927 (_ BitVec 32) List!24834) Bool)

(assert (=> b!1135362 (= res!757872 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24831))))

(declare-fun bm!49575 () Bool)

(declare-fun call!49581 () Bool)

(declare-fun call!49584 () Bool)

(assert (=> bm!49575 (= call!49581 call!49584)))

(declare-fun b!1135363 () Bool)

(declare-fun e!646125 () Bool)

(assert (=> b!1135363 (= e!646125 true)))

(declare-fun lt!504710 () Bool)

(declare-fun contains!6569 (List!24834 (_ BitVec 64)) Bool)

(assert (=> b!1135363 (= lt!504710 (contains!6569 Nil!24831 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135364 () Bool)

(declare-fun e!646122 () Bool)

(declare-fun e!646127 () Bool)

(assert (=> b!1135364 (= e!646122 e!646127)))

(declare-fun res!757870 () Bool)

(assert (=> b!1135364 (=> res!757870 e!646127)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1135364 (= res!757870 (not (= (select (arr!35614 _keys!1208) from!1455) k0!934)))))

(declare-fun e!646124 () Bool)

(assert (=> b!1135364 e!646124))

(declare-fun c!110929 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1135364 (= c!110929 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43171 0))(
  ( (V!43172 (val!14323 Int)) )
))
(declare-fun zeroValue!944 () V!43171)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!37193 0))(
  ( (Unit!37194) )
))
(declare-fun lt!504721 () Unit!37193)

(declare-datatypes ((ValueCell!13557 0))(
  ( (ValueCellFull!13557 (v!16960 V!43171)) (EmptyCell!13557) )
))
(declare-datatypes ((array!73929 0))(
  ( (array!73930 (arr!35615 (Array (_ BitVec 32) ValueCell!13557)) (size!36151 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73929)

(declare-fun minValue!944 () V!43171)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!451 (array!73927 array!73929 (_ BitVec 32) (_ BitVec 32) V!43171 V!43171 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37193)

(assert (=> b!1135364 (= lt!504721 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135365 () Bool)

(declare-fun res!757877 () Bool)

(assert (=> b!1135365 (=> (not res!757877) (not e!646120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1135365 (= res!757877 (validMask!0 mask!1564))))

(declare-fun b!1135366 () Bool)

(declare-fun res!757873 () Bool)

(declare-fun e!646112 () Bool)

(assert (=> b!1135366 (=> (not res!757873) (not e!646112))))

(declare-fun lt!504720 () array!73927)

(assert (=> b!1135366 (= res!757873 (arrayNoDuplicates!0 lt!504720 #b00000000000000000000000000000000 Nil!24831))))

(declare-fun e!646119 () Bool)

(declare-fun b!1135368 () Bool)

(declare-fun arrayContainsKey!0 (array!73927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135368 (= e!646119 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135369 () Bool)

(declare-fun res!757882 () Bool)

(assert (=> b!1135369 (=> res!757882 e!646125)))

(declare-fun noDuplicate!1597 (List!24834) Bool)

(assert (=> b!1135369 (= res!757882 (not (noDuplicate!1597 Nil!24831)))))

(declare-fun b!1135370 () Bool)

(declare-fun e!646116 () Bool)

(declare-fun e!646115 () Bool)

(declare-fun mapRes!44624 () Bool)

(assert (=> b!1135370 (= e!646116 (and e!646115 mapRes!44624))))

(declare-fun condMapEmpty!44624 () Bool)

(declare-fun mapDefault!44624 () ValueCell!13557)

(assert (=> b!1135370 (= condMapEmpty!44624 (= (arr!35615 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13557)) mapDefault!44624)))))

(declare-fun c!110927 () Bool)

(declare-fun c!110925 () Bool)

(declare-fun bm!49576 () Bool)

(declare-datatypes ((tuple2!18076 0))(
  ( (tuple2!18077 (_1!9049 (_ BitVec 64)) (_2!9049 V!43171)) )
))
(declare-datatypes ((List!24835 0))(
  ( (Nil!24832) (Cons!24831 (h!26040 tuple2!18076) (t!35830 List!24835)) )
))
(declare-datatypes ((ListLongMap!16045 0))(
  ( (ListLongMap!16046 (toList!8038 List!24835)) )
))
(declare-fun lt!504713 () ListLongMap!16045)

(declare-fun call!49583 () Unit!37193)

(declare-fun addStillContains!738 (ListLongMap!16045 (_ BitVec 64) V!43171 (_ BitVec 64)) Unit!37193)

(assert (=> bm!49576 (= call!49583 (addStillContains!738 lt!504713 (ite (or c!110927 c!110925) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110927 c!110925) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1135371 () Bool)

(declare-fun lt!504709 () Bool)

(assert (=> b!1135371 (= e!646119 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504709) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1135372 () Bool)

(declare-fun e!646126 () Unit!37193)

(declare-fun lt!504711 () Unit!37193)

(assert (=> b!1135372 (= e!646126 lt!504711)))

(declare-fun call!49580 () Unit!37193)

(assert (=> b!1135372 (= lt!504711 call!49580)))

(assert (=> b!1135372 call!49581))

(declare-fun bm!49577 () Bool)

(declare-fun lt!504712 () ListLongMap!16045)

(declare-fun call!49579 () ListLongMap!16045)

(declare-fun contains!6570 (ListLongMap!16045 (_ BitVec 64)) Bool)

(assert (=> bm!49577 (= call!49584 (contains!6570 (ite c!110927 lt!504712 call!49579) k0!934))))

(declare-fun b!1135373 () Bool)

(declare-fun e!646118 () Bool)

(declare-fun tp_is_empty!28533 () Bool)

(assert (=> b!1135373 (= e!646118 tp_is_empty!28533)))

(declare-fun b!1135374 () Bool)

(declare-fun Unit!37195 () Unit!37193)

(assert (=> b!1135374 (= e!646126 Unit!37195)))

(declare-fun call!49582 () ListLongMap!16045)

(declare-fun bm!49578 () Bool)

(declare-fun +!3475 (ListLongMap!16045 tuple2!18076) ListLongMap!16045)

(assert (=> bm!49578 (= call!49582 (+!3475 (ite c!110927 lt!504712 lt!504713) (ite c!110927 (tuple2!18077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110925 (tuple2!18077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1135375 () Bool)

(declare-fun res!757879 () Bool)

(assert (=> b!1135375 (=> (not res!757879) (not e!646120))))

(assert (=> b!1135375 (= res!757879 (= (select (arr!35614 _keys!1208) i!673) k0!934))))

(declare-fun b!1135376 () Bool)

(declare-fun res!757876 () Bool)

(assert (=> b!1135376 (=> (not res!757876) (not e!646120))))

(assert (=> b!1135376 (= res!757876 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36150 _keys!1208))))))

(declare-fun b!1135377 () Bool)

(assert (=> b!1135377 (= e!646115 tp_is_empty!28533)))

(declare-fun b!1135378 () Bool)

(declare-fun e!646113 () Unit!37193)

(declare-fun lt!504717 () Unit!37193)

(assert (=> b!1135378 (= e!646113 lt!504717)))

(declare-fun lt!504719 () Unit!37193)

(assert (=> b!1135378 (= lt!504719 call!49583)))

(assert (=> b!1135378 (= lt!504712 (+!3475 lt!504713 (tuple2!18077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1135378 call!49584))

(assert (=> b!1135378 (= lt!504717 (addStillContains!738 lt!504712 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1135378 (contains!6570 call!49582 k0!934)))

(declare-fun b!1135379 () Bool)

(assert (=> b!1135379 (= e!646120 e!646112)))

(declare-fun res!757868 () Bool)

(assert (=> b!1135379 (=> (not res!757868) (not e!646112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73927 (_ BitVec 32)) Bool)

(assert (=> b!1135379 (= res!757868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504720 mask!1564))))

(assert (=> b!1135379 (= lt!504720 (array!73928 (store (arr!35614 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36150 _keys!1208)))))

(declare-fun b!1135380 () Bool)

(declare-fun e!646121 () Bool)

(assert (=> b!1135380 (= e!646121 e!646125)))

(declare-fun res!757880 () Bool)

(assert (=> b!1135380 (=> res!757880 e!646125)))

(assert (=> b!1135380 (= res!757880 (or (bvsge (size!36150 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36150 _keys!1208)) (bvsge from!1455 (size!36150 _keys!1208))))))

(assert (=> b!1135380 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24831)))

(declare-fun lt!504708 () Unit!37193)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73927 (_ BitVec 32) (_ BitVec 32)) Unit!37193)

(assert (=> b!1135380 (= lt!504708 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!646123 () Bool)

(assert (=> b!1135380 e!646123))

(declare-fun res!757874 () Bool)

(assert (=> b!1135380 (=> (not res!757874) (not e!646123))))

(assert (=> b!1135380 (= res!757874 e!646119)))

(declare-fun c!110926 () Bool)

(assert (=> b!1135380 (= c!110926 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504718 () Unit!37193)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!343 (array!73927 array!73929 (_ BitVec 32) (_ BitVec 32) V!43171 V!43171 (_ BitVec 64) (_ BitVec 32) Int) Unit!37193)

(assert (=> b!1135380 (= lt!504718 (lemmaListMapContainsThenArrayContainsFrom!343 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504722 () Unit!37193)

(assert (=> b!1135380 (= lt!504722 e!646113)))

(assert (=> b!1135380 (= c!110927 (and (not lt!504709) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1135380 (= lt!504709 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1135381 () Bool)

(declare-fun c!110928 () Bool)

(assert (=> b!1135381 (= c!110928 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504709))))

(declare-fun e!646128 () Unit!37193)

(assert (=> b!1135381 (= e!646128 e!646126)))

(declare-fun b!1135382 () Bool)

(declare-fun res!757867 () Bool)

(assert (=> b!1135382 (=> (not res!757867) (not e!646120))))

(assert (=> b!1135382 (= res!757867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!49579 () Bool)

(assert (=> bm!49579 (= call!49580 call!49583)))

(declare-fun call!49578 () ListLongMap!16045)

(declare-fun bm!49580 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4524 (array!73927 array!73929 (_ BitVec 32) (_ BitVec 32) V!43171 V!43171 (_ BitVec 32) Int) ListLongMap!16045)

(assert (=> bm!49580 (= call!49578 (getCurrentListMapNoExtraKeys!4524 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135383 () Bool)

(assert (=> b!1135383 call!49581))

(declare-fun lt!504723 () Unit!37193)

(assert (=> b!1135383 (= lt!504723 call!49580)))

(assert (=> b!1135383 (= e!646128 lt!504723)))

(declare-fun b!1135384 () Bool)

(declare-fun res!757878 () Bool)

(assert (=> b!1135384 (=> (not res!757878) (not e!646120))))

(assert (=> b!1135384 (= res!757878 (and (= (size!36151 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36150 _keys!1208) (size!36151 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!49585 () ListLongMap!16045)

(declare-fun b!1135385 () Bool)

(declare-fun -!1201 (ListLongMap!16045 (_ BitVec 64)) ListLongMap!16045)

(assert (=> b!1135385 (= e!646124 (= call!49585 (-!1201 call!49578 k0!934)))))

(declare-fun b!1135386 () Bool)

(assert (=> b!1135386 (= e!646124 (= call!49585 call!49578))))

(declare-fun b!1135387 () Bool)

(assert (=> b!1135387 (= e!646127 e!646121)))

(declare-fun res!757881 () Bool)

(assert (=> b!1135387 (=> res!757881 e!646121)))

(assert (=> b!1135387 (= res!757881 (not (contains!6570 lt!504713 k0!934)))))

(assert (=> b!1135387 (= lt!504713 (getCurrentListMapNoExtraKeys!4524 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135388 () Bool)

(declare-fun res!757875 () Bool)

(assert (=> b!1135388 (=> (not res!757875) (not e!646120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1135388 (= res!757875 (validKeyInArray!0 k0!934))))

(declare-fun b!1135367 () Bool)

(declare-fun e!646114 () Bool)

(assert (=> b!1135367 (= e!646112 (not e!646114))))

(declare-fun res!757871 () Bool)

(assert (=> b!1135367 (=> res!757871 e!646114)))

(assert (=> b!1135367 (= res!757871 (bvsgt from!1455 i!673))))

(assert (=> b!1135367 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504707 () Unit!37193)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73927 (_ BitVec 64) (_ BitVec 32)) Unit!37193)

(assert (=> b!1135367 (= lt!504707 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!757866 () Bool)

(assert (=> start!98398 (=> (not res!757866) (not e!646120))))

(assert (=> start!98398 (= res!757866 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36150 _keys!1208))))))

(assert (=> start!98398 e!646120))

(assert (=> start!98398 tp_is_empty!28533))

(declare-fun array_inv!27310 (array!73927) Bool)

(assert (=> start!98398 (array_inv!27310 _keys!1208)))

(assert (=> start!98398 true))

(assert (=> start!98398 tp!84720))

(declare-fun array_inv!27311 (array!73929) Bool)

(assert (=> start!98398 (and (array_inv!27311 _values!996) e!646116)))

(declare-fun b!1135389 () Bool)

(assert (=> b!1135389 (= e!646113 e!646128)))

(assert (=> b!1135389 (= c!110925 (and (not lt!504709) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!504716 () array!73929)

(declare-fun bm!49581 () Bool)

(assert (=> bm!49581 (= call!49585 (getCurrentListMapNoExtraKeys!4524 lt!504720 lt!504716 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135390 () Bool)

(assert (=> b!1135390 (= e!646114 e!646122)))

(declare-fun res!757869 () Bool)

(assert (=> b!1135390 (=> res!757869 e!646122)))

(assert (=> b!1135390 (= res!757869 (not (= from!1455 i!673)))))

(declare-fun lt!504714 () ListLongMap!16045)

(assert (=> b!1135390 (= lt!504714 (getCurrentListMapNoExtraKeys!4524 lt!504720 lt!504716 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2586 (Int (_ BitVec 64)) V!43171)

(assert (=> b!1135390 (= lt!504716 (array!73930 (store (arr!35615 _values!996) i!673 (ValueCellFull!13557 (dynLambda!2586 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36151 _values!996)))))

(declare-fun lt!504715 () ListLongMap!16045)

(assert (=> b!1135390 (= lt!504715 (getCurrentListMapNoExtraKeys!4524 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44624 () Bool)

(declare-fun tp!84719 () Bool)

(assert (=> mapNonEmpty!44624 (= mapRes!44624 (and tp!84719 e!646118))))

(declare-fun mapRest!44624 () (Array (_ BitVec 32) ValueCell!13557))

(declare-fun mapValue!44624 () ValueCell!13557)

(declare-fun mapKey!44624 () (_ BitVec 32))

(assert (=> mapNonEmpty!44624 (= (arr!35615 _values!996) (store mapRest!44624 mapKey!44624 mapValue!44624))))

(declare-fun mapIsEmpty!44624 () Bool)

(assert (=> mapIsEmpty!44624 mapRes!44624))

(declare-fun bm!49582 () Bool)

(assert (=> bm!49582 (= call!49579 call!49582)))

(declare-fun b!1135391 () Bool)

(declare-fun res!757883 () Bool)

(assert (=> b!1135391 (=> res!757883 e!646125)))

(assert (=> b!1135391 (= res!757883 (contains!6569 Nil!24831 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135392 () Bool)

(assert (=> b!1135392 (= e!646123 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98398 res!757866) b!1135365))

(assert (= (and b!1135365 res!757877) b!1135384))

(assert (= (and b!1135384 res!757878) b!1135382))

(assert (= (and b!1135382 res!757867) b!1135362))

(assert (= (and b!1135362 res!757872) b!1135376))

(assert (= (and b!1135376 res!757876) b!1135388))

(assert (= (and b!1135388 res!757875) b!1135375))

(assert (= (and b!1135375 res!757879) b!1135379))

(assert (= (and b!1135379 res!757868) b!1135366))

(assert (= (and b!1135366 res!757873) b!1135367))

(assert (= (and b!1135367 (not res!757871)) b!1135390))

(assert (= (and b!1135390 (not res!757869)) b!1135364))

(assert (= (and b!1135364 c!110929) b!1135385))

(assert (= (and b!1135364 (not c!110929)) b!1135386))

(assert (= (or b!1135385 b!1135386) bm!49581))

(assert (= (or b!1135385 b!1135386) bm!49580))

(assert (= (and b!1135364 (not res!757870)) b!1135387))

(assert (= (and b!1135387 (not res!757881)) b!1135380))

(assert (= (and b!1135380 c!110927) b!1135378))

(assert (= (and b!1135380 (not c!110927)) b!1135389))

(assert (= (and b!1135389 c!110925) b!1135383))

(assert (= (and b!1135389 (not c!110925)) b!1135381))

(assert (= (and b!1135381 c!110928) b!1135372))

(assert (= (and b!1135381 (not c!110928)) b!1135374))

(assert (= (or b!1135383 b!1135372) bm!49579))

(assert (= (or b!1135383 b!1135372) bm!49582))

(assert (= (or b!1135383 b!1135372) bm!49575))

(assert (= (or b!1135378 bm!49575) bm!49577))

(assert (= (or b!1135378 bm!49579) bm!49576))

(assert (= (or b!1135378 bm!49582) bm!49578))

(assert (= (and b!1135380 c!110926) b!1135368))

(assert (= (and b!1135380 (not c!110926)) b!1135371))

(assert (= (and b!1135380 res!757874) b!1135392))

(assert (= (and b!1135380 (not res!757880)) b!1135369))

(assert (= (and b!1135369 (not res!757882)) b!1135391))

(assert (= (and b!1135391 (not res!757883)) b!1135363))

(assert (= (and b!1135370 condMapEmpty!44624) mapIsEmpty!44624))

(assert (= (and b!1135370 (not condMapEmpty!44624)) mapNonEmpty!44624))

(get-info :version)

(assert (= (and mapNonEmpty!44624 ((_ is ValueCellFull!13557) mapValue!44624)) b!1135373))

(assert (= (and b!1135370 ((_ is ValueCellFull!13557) mapDefault!44624)) b!1135377))

(assert (= start!98398 b!1135370))

(declare-fun b_lambda!19109 () Bool)

(assert (=> (not b_lambda!19109) (not b!1135390)))

(declare-fun t!35828 () Bool)

(declare-fun tb!8815 () Bool)

(assert (=> (and start!98398 (= defaultEntry!1004 defaultEntry!1004) t!35828) tb!8815))

(declare-fun result!18195 () Bool)

(assert (=> tb!8815 (= result!18195 tp_is_empty!28533)))

(assert (=> b!1135390 t!35828))

(declare-fun b_and!38857 () Bool)

(assert (= b_and!38855 (and (=> t!35828 result!18195) b_and!38857)))

(declare-fun m!1047945 () Bool)

(assert (=> bm!49578 m!1047945))

(declare-fun m!1047947 () Bool)

(assert (=> b!1135378 m!1047947))

(declare-fun m!1047949 () Bool)

(assert (=> b!1135378 m!1047949))

(declare-fun m!1047951 () Bool)

(assert (=> b!1135378 m!1047951))

(declare-fun m!1047953 () Bool)

(assert (=> mapNonEmpty!44624 m!1047953))

(declare-fun m!1047955 () Bool)

(assert (=> bm!49580 m!1047955))

(declare-fun m!1047957 () Bool)

(assert (=> b!1135380 m!1047957))

(declare-fun m!1047959 () Bool)

(assert (=> b!1135380 m!1047959))

(declare-fun m!1047961 () Bool)

(assert (=> b!1135380 m!1047961))

(declare-fun m!1047963 () Bool)

(assert (=> bm!49581 m!1047963))

(declare-fun m!1047965 () Bool)

(assert (=> b!1135363 m!1047965))

(declare-fun m!1047967 () Bool)

(assert (=> b!1135369 m!1047967))

(declare-fun m!1047969 () Bool)

(assert (=> b!1135367 m!1047969))

(declare-fun m!1047971 () Bool)

(assert (=> b!1135367 m!1047971))

(declare-fun m!1047973 () Bool)

(assert (=> b!1135392 m!1047973))

(declare-fun m!1047975 () Bool)

(assert (=> b!1135382 m!1047975))

(declare-fun m!1047977 () Bool)

(assert (=> b!1135390 m!1047977))

(declare-fun m!1047979 () Bool)

(assert (=> b!1135390 m!1047979))

(declare-fun m!1047981 () Bool)

(assert (=> b!1135390 m!1047981))

(declare-fun m!1047983 () Bool)

(assert (=> b!1135390 m!1047983))

(declare-fun m!1047985 () Bool)

(assert (=> b!1135362 m!1047985))

(assert (=> b!1135368 m!1047973))

(declare-fun m!1047987 () Bool)

(assert (=> b!1135366 m!1047987))

(declare-fun m!1047989 () Bool)

(assert (=> b!1135391 m!1047989))

(declare-fun m!1047991 () Bool)

(assert (=> bm!49576 m!1047991))

(declare-fun m!1047993 () Bool)

(assert (=> b!1135387 m!1047993))

(assert (=> b!1135387 m!1047955))

(declare-fun m!1047995 () Bool)

(assert (=> b!1135375 m!1047995))

(declare-fun m!1047997 () Bool)

(assert (=> start!98398 m!1047997))

(declare-fun m!1047999 () Bool)

(assert (=> start!98398 m!1047999))

(declare-fun m!1048001 () Bool)

(assert (=> bm!49577 m!1048001))

(declare-fun m!1048003 () Bool)

(assert (=> b!1135364 m!1048003))

(declare-fun m!1048005 () Bool)

(assert (=> b!1135364 m!1048005))

(declare-fun m!1048007 () Bool)

(assert (=> b!1135385 m!1048007))

(declare-fun m!1048009 () Bool)

(assert (=> b!1135379 m!1048009))

(declare-fun m!1048011 () Bool)

(assert (=> b!1135379 m!1048011))

(declare-fun m!1048013 () Bool)

(assert (=> b!1135388 m!1048013))

(declare-fun m!1048015 () Bool)

(assert (=> b!1135365 m!1048015))

(check-sat (not bm!49581) (not b!1135365) (not b!1135382) (not b!1135390) (not b!1135369) (not b!1135367) (not b!1135380) (not start!98398) (not b!1135363) (not bm!49577) (not b!1135392) (not b!1135385) b_and!38857 (not b!1135366) (not b!1135388) (not b_lambda!19109) (not b!1135387) tp_is_empty!28533 (not bm!49578) (not b!1135368) (not bm!49576) (not b!1135379) (not b_next!24003) (not bm!49580) (not b!1135378) (not b!1135391) (not b!1135362) (not mapNonEmpty!44624) (not b!1135364))
(check-sat b_and!38857 (not b_next!24003))
