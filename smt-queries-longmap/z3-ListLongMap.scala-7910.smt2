; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98440 () Bool)

(assert start!98440)

(declare-fun b_free!23905 () Bool)

(declare-fun b_next!23905 () Bool)

(assert (=> start!98440 (= b_free!23905 (not b_next!23905))))

(declare-fun tp!84418 () Bool)

(declare-fun b_and!38603 () Bool)

(assert (=> start!98440 (= tp!84418 b_and!38603)))

(declare-fun b!1131724 () Bool)

(declare-fun res!755814 () Bool)

(declare-fun e!644180 () Bool)

(assert (=> b!1131724 (=> (not res!755814) (not e!644180))))

(declare-datatypes ((array!73773 0))(
  ( (array!73774 (arr!35533 (Array (_ BitVec 32) (_ BitVec 64))) (size!36070 (_ BitVec 32))) )
))
(declare-fun lt!502485 () array!73773)

(declare-datatypes ((List!24773 0))(
  ( (Nil!24770) (Cons!24769 (h!25987 (_ BitVec 64)) (t!35662 List!24773)) )
))
(declare-fun arrayNoDuplicates!0 (array!73773 (_ BitVec 32) List!24773) Bool)

(assert (=> b!1131724 (= res!755814 (arrayNoDuplicates!0 lt!502485 #b00000000000000000000000000000000 Nil!24770))))

(declare-fun b!1131725 () Bool)

(declare-fun e!644181 () Bool)

(assert (=> b!1131725 (= e!644181 e!644180)))

(declare-fun res!755812 () Bool)

(assert (=> b!1131725 (=> (not res!755812) (not e!644180))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73773 (_ BitVec 32)) Bool)

(assert (=> b!1131725 (= res!755812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502485 mask!1564))))

(declare-fun _keys!1208 () array!73773)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131725 (= lt!502485 (array!73774 (store (arr!35533 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36070 _keys!1208)))))

(declare-fun b!1131726 () Bool)

(declare-fun res!755807 () Bool)

(assert (=> b!1131726 (=> (not res!755807) (not e!644181))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!43041 0))(
  ( (V!43042 (val!14274 Int)) )
))
(declare-datatypes ((ValueCell!13508 0))(
  ( (ValueCellFull!13508 (v!16903 V!43041)) (EmptyCell!13508) )
))
(declare-datatypes ((array!73775 0))(
  ( (array!73776 (arr!35534 (Array (_ BitVec 32) ValueCell!13508)) (size!36071 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73775)

(assert (=> b!1131726 (= res!755807 (and (= (size!36071 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36070 _keys!1208) (size!36071 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1131727 () Bool)

(declare-fun e!644184 () Bool)

(declare-fun tp_is_empty!28435 () Bool)

(assert (=> b!1131727 (= e!644184 tp_is_empty!28435)))

(declare-fun b!1131728 () Bool)

(declare-fun res!755815 () Bool)

(assert (=> b!1131728 (=> (not res!755815) (not e!644181))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1131728 (= res!755815 (= (select (arr!35533 _keys!1208) i!673) k0!934))))

(declare-fun b!1131729 () Bool)

(declare-fun res!755810 () Bool)

(assert (=> b!1131729 (=> (not res!755810) (not e!644181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131729 (= res!755810 (validMask!0 mask!1564))))

(declare-fun b!1131730 () Bool)

(declare-fun res!755811 () Bool)

(assert (=> b!1131730 (=> (not res!755811) (not e!644181))))

(assert (=> b!1131730 (= res!755811 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36070 _keys!1208))))))

(declare-fun mapIsEmpty!44470 () Bool)

(declare-fun mapRes!44470 () Bool)

(assert (=> mapIsEmpty!44470 mapRes!44470))

(declare-fun call!48405 () Bool)

(declare-datatypes ((tuple2!17994 0))(
  ( (tuple2!17995 (_1!9008 (_ BitVec 64)) (_2!9008 V!43041)) )
))
(declare-datatypes ((List!24774 0))(
  ( (Nil!24771) (Cons!24770 (h!25988 tuple2!17994) (t!35663 List!24774)) )
))
(declare-datatypes ((ListLongMap!15971 0))(
  ( (ListLongMap!15972 (toList!8001 List!24774)) )
))
(declare-fun lt!502484 () ListLongMap!15971)

(declare-fun call!48403 () ListLongMap!15971)

(declare-fun bm!48397 () Bool)

(declare-fun c!110429 () Bool)

(declare-fun contains!6536 (ListLongMap!15971 (_ BitVec 64)) Bool)

(assert (=> bm!48397 (= call!48405 (contains!6536 (ite c!110429 lt!502484 call!48403) k0!934))))

(declare-fun zeroValue!944 () V!43041)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43041)

(declare-fun call!48401 () ListLongMap!15971)

(declare-fun bm!48398 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4520 (array!73773 array!73775 (_ BitVec 32) (_ BitVec 32) V!43041 V!43041 (_ BitVec 32) Int) ListLongMap!15971)

(assert (=> bm!48398 (= call!48401 (getCurrentListMapNoExtraKeys!4520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131723 () Bool)

(declare-fun e!644175 () Bool)

(assert (=> b!1131723 (= e!644175 tp_is_empty!28435)))

(declare-fun res!755804 () Bool)

(assert (=> start!98440 (=> (not res!755804) (not e!644181))))

(assert (=> start!98440 (= res!755804 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36070 _keys!1208))))))

(assert (=> start!98440 e!644181))

(assert (=> start!98440 tp_is_empty!28435))

(declare-fun array_inv!27316 (array!73773) Bool)

(assert (=> start!98440 (array_inv!27316 _keys!1208)))

(assert (=> start!98440 true))

(assert (=> start!98440 tp!84418))

(declare-fun e!644186 () Bool)

(declare-fun array_inv!27317 (array!73775) Bool)

(assert (=> start!98440 (and (array_inv!27317 _values!996) e!644186)))

(declare-fun b!1131731 () Bool)

(declare-fun e!644173 () Bool)

(declare-fun e!644178 () Bool)

(assert (=> b!1131731 (= e!644173 e!644178)))

(declare-fun res!755802 () Bool)

(assert (=> b!1131731 (=> res!755802 e!644178)))

(assert (=> b!1131731 (= res!755802 (not (= (select (arr!35533 _keys!1208) from!1455) k0!934)))))

(declare-fun e!644183 () Bool)

(assert (=> b!1131731 e!644183))

(declare-fun c!110426 () Bool)

(assert (=> b!1131731 (= c!110426 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!37010 0))(
  ( (Unit!37011) )
))
(declare-fun lt!502481 () Unit!37010)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!423 (array!73773 array!73775 (_ BitVec 32) (_ BitVec 32) V!43041 V!43041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37010)

(assert (=> b!1131731 (= lt!502481 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131732 () Bool)

(declare-fun e!644179 () Unit!37010)

(declare-fun Unit!37012 () Unit!37010)

(assert (=> b!1131732 (= e!644179 Unit!37012)))

(declare-fun b!1131733 () Bool)

(declare-fun res!755809 () Bool)

(assert (=> b!1131733 (=> (not res!755809) (not e!644181))))

(assert (=> b!1131733 (= res!755809 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24770))))

(declare-fun b!1131734 () Bool)

(declare-fun e!644185 () Bool)

(assert (=> b!1131734 (= e!644185 true)))

(declare-fun lt!502483 () Bool)

(declare-fun getCurrentListMap!4432 (array!73773 array!73775 (_ BitVec 32) (_ BitVec 32) V!43041 V!43041 (_ BitVec 32) Int) ListLongMap!15971)

(assert (=> b!1131734 (= lt!502483 (contains!6536 (getCurrentListMap!4432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1131735 () Bool)

(declare-fun lt!502478 () Unit!37010)

(assert (=> b!1131735 (= e!644179 lt!502478)))

(declare-fun call!48400 () Unit!37010)

(assert (=> b!1131735 (= lt!502478 call!48400)))

(declare-fun call!48406 () Bool)

(assert (=> b!1131735 call!48406))

(declare-fun b!1131736 () Bool)

(declare-fun e!644174 () Bool)

(assert (=> b!1131736 (= e!644178 e!644174)))

(declare-fun res!755806 () Bool)

(assert (=> b!1131736 (=> res!755806 e!644174)))

(declare-fun lt!502489 () ListLongMap!15971)

(assert (=> b!1131736 (= res!755806 (not (contains!6536 lt!502489 k0!934)))))

(assert (=> b!1131736 (= lt!502489 (getCurrentListMapNoExtraKeys!4520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!110428 () Bool)

(declare-fun call!48404 () ListLongMap!15971)

(declare-fun bm!48399 () Bool)

(declare-fun +!3468 (ListLongMap!15971 tuple2!17994) ListLongMap!15971)

(assert (=> bm!48399 (= call!48404 (+!3468 (ite c!110429 lt!502484 lt!502489) (ite c!110429 (tuple2!17995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110428 (tuple2!17995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1131737 () Bool)

(declare-fun call!48402 () ListLongMap!15971)

(assert (=> b!1131737 (= e!644183 (= call!48402 call!48401))))

(declare-fun b!1131738 () Bool)

(declare-fun e!644177 () Bool)

(assert (=> b!1131738 (= e!644180 (not e!644177))))

(declare-fun res!755813 () Bool)

(assert (=> b!1131738 (=> res!755813 e!644177)))

(assert (=> b!1131738 (= res!755813 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131738 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502488 () Unit!37010)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73773 (_ BitVec 64) (_ BitVec 32)) Unit!37010)

(assert (=> b!1131738 (= lt!502488 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1131739 () Bool)

(declare-fun e!644187 () Unit!37010)

(declare-fun e!644176 () Unit!37010)

(assert (=> b!1131739 (= e!644187 e!644176)))

(declare-fun lt!502486 () Bool)

(assert (=> b!1131739 (= c!110428 (and (not lt!502486) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1131740 () Bool)

(assert (=> b!1131740 (= e!644174 e!644185)))

(declare-fun res!755801 () Bool)

(assert (=> b!1131740 (=> res!755801 e!644185)))

(assert (=> b!1131740 (= res!755801 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36070 _keys!1208))))))

(declare-fun lt!502482 () Unit!37010)

(assert (=> b!1131740 (= lt!502482 e!644187)))

(assert (=> b!1131740 (= c!110429 (and (not lt!502486) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1131740 (= lt!502486 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1131741 () Bool)

(assert (=> b!1131741 call!48406))

(declare-fun lt!502492 () Unit!37010)

(assert (=> b!1131741 (= lt!502492 call!48400)))

(assert (=> b!1131741 (= e!644176 lt!502492)))

(declare-fun b!1131742 () Bool)

(declare-fun res!755803 () Bool)

(assert (=> b!1131742 (=> (not res!755803) (not e!644181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1131742 (= res!755803 (validKeyInArray!0 k0!934))))

(declare-fun bm!48400 () Bool)

(declare-fun call!48407 () Unit!37010)

(assert (=> bm!48400 (= call!48400 call!48407)))

(declare-fun b!1131743 () Bool)

(assert (=> b!1131743 (= e!644186 (and e!644184 mapRes!44470))))

(declare-fun condMapEmpty!44470 () Bool)

(declare-fun mapDefault!44470 () ValueCell!13508)

(assert (=> b!1131743 (= condMapEmpty!44470 (= (arr!35534 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13508)) mapDefault!44470)))))

(declare-fun b!1131744 () Bool)

(declare-fun res!755808 () Bool)

(assert (=> b!1131744 (=> (not res!755808) (not e!644181))))

(assert (=> b!1131744 (= res!755808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1131745 () Bool)

(declare-fun lt!502479 () Unit!37010)

(assert (=> b!1131745 (= e!644187 lt!502479)))

(declare-fun lt!502487 () Unit!37010)

(declare-fun addStillContains!694 (ListLongMap!15971 (_ BitVec 64) V!43041 (_ BitVec 64)) Unit!37010)

(assert (=> b!1131745 (= lt!502487 (addStillContains!694 lt!502489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1131745 (= lt!502484 (+!3468 lt!502489 (tuple2!17995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1131745 call!48405))

(assert (=> b!1131745 (= lt!502479 call!48407)))

(assert (=> b!1131745 (contains!6536 call!48404 k0!934)))

(declare-fun b!1131746 () Bool)

(declare-fun -!1164 (ListLongMap!15971 (_ BitVec 64)) ListLongMap!15971)

(assert (=> b!1131746 (= e!644183 (= call!48402 (-!1164 call!48401 k0!934)))))

(declare-fun bm!48401 () Bool)

(declare-fun lt!502490 () array!73775)

(assert (=> bm!48401 (= call!48402 (getCurrentListMapNoExtraKeys!4520 lt!502485 lt!502490 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131747 () Bool)

(assert (=> b!1131747 (= e!644177 e!644173)))

(declare-fun res!755805 () Bool)

(assert (=> b!1131747 (=> res!755805 e!644173)))

(assert (=> b!1131747 (= res!755805 (not (= from!1455 i!673)))))

(declare-fun lt!502480 () ListLongMap!15971)

(assert (=> b!1131747 (= lt!502480 (getCurrentListMapNoExtraKeys!4520 lt!502485 lt!502490 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2581 (Int (_ BitVec 64)) V!43041)

(assert (=> b!1131747 (= lt!502490 (array!73776 (store (arr!35534 _values!996) i!673 (ValueCellFull!13508 (dynLambda!2581 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36071 _values!996)))))

(declare-fun lt!502491 () ListLongMap!15971)

(assert (=> b!1131747 (= lt!502491 (getCurrentListMapNoExtraKeys!4520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!48402 () Bool)

(assert (=> bm!48402 (= call!48406 call!48405)))

(declare-fun bm!48403 () Bool)

(assert (=> bm!48403 (= call!48403 call!48404)))

(declare-fun bm!48404 () Bool)

(assert (=> bm!48404 (= call!48407 (addStillContains!694 (ite c!110429 lt!502484 lt!502489) (ite c!110429 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110428 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110429 minValue!944 (ite c!110428 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1131748 () Bool)

(declare-fun c!110427 () Bool)

(assert (=> b!1131748 (= c!110427 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502486))))

(assert (=> b!1131748 (= e!644176 e!644179)))

(declare-fun mapNonEmpty!44470 () Bool)

(declare-fun tp!84419 () Bool)

(assert (=> mapNonEmpty!44470 (= mapRes!44470 (and tp!84419 e!644175))))

(declare-fun mapRest!44470 () (Array (_ BitVec 32) ValueCell!13508))

(declare-fun mapValue!44470 () ValueCell!13508)

(declare-fun mapKey!44470 () (_ BitVec 32))

(assert (=> mapNonEmpty!44470 (= (arr!35534 _values!996) (store mapRest!44470 mapKey!44470 mapValue!44470))))

(assert (= (and start!98440 res!755804) b!1131729))

(assert (= (and b!1131729 res!755810) b!1131726))

(assert (= (and b!1131726 res!755807) b!1131744))

(assert (= (and b!1131744 res!755808) b!1131733))

(assert (= (and b!1131733 res!755809) b!1131730))

(assert (= (and b!1131730 res!755811) b!1131742))

(assert (= (and b!1131742 res!755803) b!1131728))

(assert (= (and b!1131728 res!755815) b!1131725))

(assert (= (and b!1131725 res!755812) b!1131724))

(assert (= (and b!1131724 res!755814) b!1131738))

(assert (= (and b!1131738 (not res!755813)) b!1131747))

(assert (= (and b!1131747 (not res!755805)) b!1131731))

(assert (= (and b!1131731 c!110426) b!1131746))

(assert (= (and b!1131731 (not c!110426)) b!1131737))

(assert (= (or b!1131746 b!1131737) bm!48401))

(assert (= (or b!1131746 b!1131737) bm!48398))

(assert (= (and b!1131731 (not res!755802)) b!1131736))

(assert (= (and b!1131736 (not res!755806)) b!1131740))

(assert (= (and b!1131740 c!110429) b!1131745))

(assert (= (and b!1131740 (not c!110429)) b!1131739))

(assert (= (and b!1131739 c!110428) b!1131741))

(assert (= (and b!1131739 (not c!110428)) b!1131748))

(assert (= (and b!1131748 c!110427) b!1131735))

(assert (= (and b!1131748 (not c!110427)) b!1131732))

(assert (= (or b!1131741 b!1131735) bm!48400))

(assert (= (or b!1131741 b!1131735) bm!48403))

(assert (= (or b!1131741 b!1131735) bm!48402))

(assert (= (or b!1131745 bm!48402) bm!48397))

(assert (= (or b!1131745 bm!48400) bm!48404))

(assert (= (or b!1131745 bm!48403) bm!48399))

(assert (= (and b!1131740 (not res!755801)) b!1131734))

(assert (= (and b!1131743 condMapEmpty!44470) mapIsEmpty!44470))

(assert (= (and b!1131743 (not condMapEmpty!44470)) mapNonEmpty!44470))

(get-info :version)

(assert (= (and mapNonEmpty!44470 ((_ is ValueCellFull!13508) mapValue!44470)) b!1131723))

(assert (= (and b!1131743 ((_ is ValueCellFull!13508) mapDefault!44470)) b!1131727))

(assert (= start!98440 b!1131743))

(declare-fun b_lambda!18885 () Bool)

(assert (=> (not b_lambda!18885) (not b!1131747)))

(declare-fun t!35661 () Bool)

(declare-fun tb!8709 () Bool)

(assert (=> (and start!98440 (= defaultEntry!1004 defaultEntry!1004) t!35661) tb!8709))

(declare-fun result!17987 () Bool)

(assert (=> tb!8709 (= result!17987 tp_is_empty!28435)))

(assert (=> b!1131747 t!35661))

(declare-fun b_and!38605 () Bool)

(assert (= b_and!38603 (and (=> t!35661 result!17987) b_and!38605)))

(declare-fun m!1045239 () Bool)

(assert (=> b!1131728 m!1045239))

(declare-fun m!1045241 () Bool)

(assert (=> b!1131742 m!1045241))

(declare-fun m!1045243 () Bool)

(assert (=> b!1131745 m!1045243))

(declare-fun m!1045245 () Bool)

(assert (=> b!1131745 m!1045245))

(declare-fun m!1045247 () Bool)

(assert (=> b!1131745 m!1045247))

(declare-fun m!1045249 () Bool)

(assert (=> b!1131725 m!1045249))

(declare-fun m!1045251 () Bool)

(assert (=> b!1131725 m!1045251))

(declare-fun m!1045253 () Bool)

(assert (=> b!1131729 m!1045253))

(declare-fun m!1045255 () Bool)

(assert (=> start!98440 m!1045255))

(declare-fun m!1045257 () Bool)

(assert (=> start!98440 m!1045257))

(declare-fun m!1045259 () Bool)

(assert (=> b!1131744 m!1045259))

(declare-fun m!1045261 () Bool)

(assert (=> bm!48398 m!1045261))

(declare-fun m!1045263 () Bool)

(assert (=> b!1131724 m!1045263))

(declare-fun m!1045265 () Bool)

(assert (=> b!1131734 m!1045265))

(assert (=> b!1131734 m!1045265))

(declare-fun m!1045267 () Bool)

(assert (=> b!1131734 m!1045267))

(declare-fun m!1045269 () Bool)

(assert (=> b!1131736 m!1045269))

(assert (=> b!1131736 m!1045261))

(declare-fun m!1045271 () Bool)

(assert (=> bm!48401 m!1045271))

(declare-fun m!1045273 () Bool)

(assert (=> b!1131731 m!1045273))

(declare-fun m!1045275 () Bool)

(assert (=> b!1131731 m!1045275))

(declare-fun m!1045277 () Bool)

(assert (=> bm!48399 m!1045277))

(declare-fun m!1045279 () Bool)

(assert (=> b!1131733 m!1045279))

(declare-fun m!1045281 () Bool)

(assert (=> mapNonEmpty!44470 m!1045281))

(declare-fun m!1045283 () Bool)

(assert (=> bm!48397 m!1045283))

(declare-fun m!1045285 () Bool)

(assert (=> b!1131747 m!1045285))

(declare-fun m!1045287 () Bool)

(assert (=> b!1131747 m!1045287))

(declare-fun m!1045289 () Bool)

(assert (=> b!1131747 m!1045289))

(declare-fun m!1045291 () Bool)

(assert (=> b!1131747 m!1045291))

(declare-fun m!1045293 () Bool)

(assert (=> b!1131738 m!1045293))

(declare-fun m!1045295 () Bool)

(assert (=> b!1131738 m!1045295))

(declare-fun m!1045297 () Bool)

(assert (=> bm!48404 m!1045297))

(declare-fun m!1045299 () Bool)

(assert (=> b!1131746 m!1045299))

(check-sat (not bm!48404) (not b!1131731) (not start!98440) (not b!1131724) (not b_lambda!18885) (not mapNonEmpty!44470) (not bm!48397) (not b!1131745) (not bm!48401) (not b!1131725) (not b!1131738) (not b!1131747) (not bm!48399) tp_is_empty!28435 (not bm!48398) (not b!1131746) (not b!1131729) (not b!1131736) (not b!1131733) b_and!38605 (not b!1131742) (not b!1131744) (not b_next!23905) (not b!1131734))
(check-sat b_and!38605 (not b_next!23905))
