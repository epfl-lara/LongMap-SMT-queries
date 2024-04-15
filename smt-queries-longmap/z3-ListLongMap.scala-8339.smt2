; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101512 () Bool)

(assert start!101512)

(declare-fun b_free!26305 () Bool)

(declare-fun b_next!26305 () Bool)

(assert (=> start!101512 (= b_free!26305 (not b_next!26305))))

(declare-fun tp!91952 () Bool)

(declare-fun b_and!43799 () Bool)

(assert (=> start!101512 (= tp!91952 b_and!43799)))

(declare-fun b!1220238 () Bool)

(declare-fun res!810551 () Bool)

(declare-fun e!692883 () Bool)

(assert (=> b!1220238 (=> (not res!810551) (not e!692883))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78718 0))(
  ( (array!78719 (arr!37989 (Array (_ BitVec 32) (_ BitVec 64))) (size!38527 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78718)

(assert (=> b!1220238 (= res!810551 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38527 _keys!1208))))))

(declare-fun mapIsEmpty!48403 () Bool)

(declare-fun mapRes!48403 () Bool)

(assert (=> mapIsEmpty!48403 mapRes!48403))

(declare-fun b!1220239 () Bool)

(declare-fun res!810556 () Bool)

(assert (=> b!1220239 (=> (not res!810556) (not e!692883))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220239 (= res!810556 (validMask!0 mask!1564))))

(declare-fun b!1220240 () Bool)

(declare-fun e!692884 () Bool)

(declare-fun e!692892 () Bool)

(assert (=> b!1220240 (= e!692884 e!692892)))

(declare-fun res!810549 () Bool)

(assert (=> b!1220240 (=> res!810549 e!692892)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1220240 (= res!810549 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46473 0))(
  ( (V!46474 (val!15561 Int)) )
))
(declare-fun zeroValue!944 () V!46473)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!20112 0))(
  ( (tuple2!20113 (_1!10067 (_ BitVec 64)) (_2!10067 V!46473)) )
))
(declare-datatypes ((List!26891 0))(
  ( (Nil!26888) (Cons!26887 (h!28096 tuple2!20112) (t!40167 List!26891)) )
))
(declare-datatypes ((ListLongMap!18081 0))(
  ( (ListLongMap!18082 (toList!9056 List!26891)) )
))
(declare-fun lt!554773 () ListLongMap!18081)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46473)

(declare-datatypes ((ValueCell!14795 0))(
  ( (ValueCellFull!14795 (v!18218 V!46473)) (EmptyCell!14795) )
))
(declare-datatypes ((array!78720 0))(
  ( (array!78721 (arr!37990 (Array (_ BitVec 32) ValueCell!14795)) (size!38528 (_ BitVec 32))) )
))
(declare-fun lt!554767 () array!78720)

(declare-fun lt!554774 () array!78718)

(declare-fun getCurrentListMapNoExtraKeys!5493 (array!78718 array!78720 (_ BitVec 32) (_ BitVec 32) V!46473 V!46473 (_ BitVec 32) Int) ListLongMap!18081)

(assert (=> b!1220240 (= lt!554773 (getCurrentListMapNoExtraKeys!5493 lt!554774 lt!554767 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554770 () V!46473)

(declare-fun _values!996 () array!78720)

(assert (=> b!1220240 (= lt!554767 (array!78721 (store (arr!37990 _values!996) i!673 (ValueCellFull!14795 lt!554770)) (size!38528 _values!996)))))

(declare-fun dynLambda!3341 (Int (_ BitVec 64)) V!46473)

(assert (=> b!1220240 (= lt!554770 (dynLambda!3341 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554772 () ListLongMap!18081)

(assert (=> b!1220240 (= lt!554772 (getCurrentListMapNoExtraKeys!5493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220241 () Bool)

(declare-fun res!810550 () Bool)

(assert (=> b!1220241 (=> (not res!810550) (not e!692883))))

(declare-datatypes ((List!26892 0))(
  ( (Nil!26889) (Cons!26888 (h!28097 (_ BitVec 64)) (t!40168 List!26892)) )
))
(declare-fun arrayNoDuplicates!0 (array!78718 (_ BitVec 32) List!26892) Bool)

(assert (=> b!1220241 (= res!810550 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26889))))

(declare-fun b!1220242 () Bool)

(declare-fun e!692891 () Bool)

(assert (=> b!1220242 (= e!692891 (not e!692884))))

(declare-fun res!810545 () Bool)

(assert (=> b!1220242 (=> res!810545 e!692884)))

(assert (=> b!1220242 (= res!810545 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220242 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40285 0))(
  ( (Unit!40286) )
))
(declare-fun lt!554766 () Unit!40285)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78718 (_ BitVec 64) (_ BitVec 32)) Unit!40285)

(assert (=> b!1220242 (= lt!554766 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220243 () Bool)

(assert (=> b!1220243 (= e!692883 e!692891)))

(declare-fun res!810548 () Bool)

(assert (=> b!1220243 (=> (not res!810548) (not e!692891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78718 (_ BitVec 32)) Bool)

(assert (=> b!1220243 (= res!810548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554774 mask!1564))))

(assert (=> b!1220243 (= lt!554774 (array!78719 (store (arr!37989 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38527 _keys!1208)))))

(declare-fun mapNonEmpty!48403 () Bool)

(declare-fun tp!91951 () Bool)

(declare-fun e!692893 () Bool)

(assert (=> mapNonEmpty!48403 (= mapRes!48403 (and tp!91951 e!692893))))

(declare-fun mapRest!48403 () (Array (_ BitVec 32) ValueCell!14795))

(declare-fun mapKey!48403 () (_ BitVec 32))

(declare-fun mapValue!48403 () ValueCell!14795)

(assert (=> mapNonEmpty!48403 (= (arr!37990 _values!996) (store mapRest!48403 mapKey!48403 mapValue!48403))))

(declare-fun e!692889 () Bool)

(declare-fun b!1220245 () Bool)

(assert (=> b!1220245 (= e!692889 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220246 () Bool)

(declare-fun res!810553 () Bool)

(assert (=> b!1220246 (=> (not res!810553) (not e!692883))))

(assert (=> b!1220246 (= res!810553 (= (select (arr!37989 _keys!1208) i!673) k0!934))))

(declare-fun b!1220247 () Bool)

(declare-fun e!692888 () Bool)

(assert (=> b!1220247 (= e!692888 e!692889)))

(declare-fun res!810546 () Bool)

(assert (=> b!1220247 (=> res!810546 e!692889)))

(assert (=> b!1220247 (= res!810546 (not (= (select (arr!37989 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1220248 () Bool)

(declare-fun e!692885 () Bool)

(declare-fun e!692887 () Bool)

(assert (=> b!1220248 (= e!692885 (and e!692887 mapRes!48403))))

(declare-fun condMapEmpty!48403 () Bool)

(declare-fun mapDefault!48403 () ValueCell!14795)

(assert (=> b!1220248 (= condMapEmpty!48403 (= (arr!37990 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14795)) mapDefault!48403)))))

(declare-fun b!1220249 () Bool)

(declare-fun e!692890 () Bool)

(assert (=> b!1220249 (= e!692892 e!692890)))

(declare-fun res!810544 () Bool)

(assert (=> b!1220249 (=> res!810544 e!692890)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220249 (= res!810544 (not (validKeyInArray!0 (select (arr!37989 _keys!1208) from!1455))))))

(declare-fun lt!554763 () ListLongMap!18081)

(declare-fun lt!554764 () ListLongMap!18081)

(assert (=> b!1220249 (= lt!554763 lt!554764)))

(declare-fun lt!554765 () ListLongMap!18081)

(declare-fun -!1886 (ListLongMap!18081 (_ BitVec 64)) ListLongMap!18081)

(assert (=> b!1220249 (= lt!554764 (-!1886 lt!554765 k0!934))))

(assert (=> b!1220249 (= lt!554763 (getCurrentListMapNoExtraKeys!5493 lt!554774 lt!554767 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220249 (= lt!554765 (getCurrentListMapNoExtraKeys!5493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554771 () Unit!40285)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1121 (array!78718 array!78720 (_ BitVec 32) (_ BitVec 32) V!46473 V!46473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40285)

(assert (=> b!1220249 (= lt!554771 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1121 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220250 () Bool)

(declare-fun res!810554 () Bool)

(assert (=> b!1220250 (=> (not res!810554) (not e!692891))))

(assert (=> b!1220250 (= res!810554 (arrayNoDuplicates!0 lt!554774 #b00000000000000000000000000000000 Nil!26889))))

(declare-fun b!1220251 () Bool)

(declare-fun e!692886 () Bool)

(assert (=> b!1220251 (= e!692890 e!692886)))

(declare-fun res!810552 () Bool)

(assert (=> b!1220251 (=> res!810552 e!692886)))

(assert (=> b!1220251 (= res!810552 (not (= (select (arr!37989 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1220251 e!692888))

(declare-fun res!810547 () Bool)

(assert (=> b!1220251 (=> (not res!810547) (not e!692888))))

(declare-fun +!4122 (ListLongMap!18081 tuple2!20112) ListLongMap!18081)

(declare-fun get!19393 (ValueCell!14795 V!46473) V!46473)

(assert (=> b!1220251 (= res!810547 (= lt!554773 (+!4122 lt!554764 (tuple2!20113 (select (arr!37989 _keys!1208) from!1455) (get!19393 (select (arr!37990 _values!996) from!1455) lt!554770)))))))

(declare-fun b!1220252 () Bool)

(declare-fun res!810543 () Bool)

(assert (=> b!1220252 (=> (not res!810543) (not e!692883))))

(assert (=> b!1220252 (= res!810543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!810557 () Bool)

(assert (=> start!101512 (=> (not res!810557) (not e!692883))))

(assert (=> start!101512 (= res!810557 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38527 _keys!1208))))))

(assert (=> start!101512 e!692883))

(declare-fun tp_is_empty!31009 () Bool)

(assert (=> start!101512 tp_is_empty!31009))

(declare-fun array_inv!29032 (array!78718) Bool)

(assert (=> start!101512 (array_inv!29032 _keys!1208)))

(assert (=> start!101512 true))

(assert (=> start!101512 tp!91952))

(declare-fun array_inv!29033 (array!78720) Bool)

(assert (=> start!101512 (and (array_inv!29033 _values!996) e!692885)))

(declare-fun b!1220244 () Bool)

(assert (=> b!1220244 (= e!692887 tp_is_empty!31009)))

(declare-fun b!1220253 () Bool)

(assert (=> b!1220253 (= e!692893 tp_is_empty!31009)))

(declare-fun b!1220254 () Bool)

(declare-fun res!810555 () Bool)

(assert (=> b!1220254 (=> (not res!810555) (not e!692883))))

(assert (=> b!1220254 (= res!810555 (validKeyInArray!0 k0!934))))

(declare-fun b!1220255 () Bool)

(declare-fun res!810542 () Bool)

(assert (=> b!1220255 (=> (not res!810542) (not e!692883))))

(assert (=> b!1220255 (= res!810542 (and (= (size!38528 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38527 _keys!1208) (size!38528 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220256 () Bool)

(assert (=> b!1220256 (= e!692886 true)))

(assert (=> b!1220256 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26889)))

(declare-fun lt!554768 () Unit!40285)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78718 (_ BitVec 32) (_ BitVec 32)) Unit!40285)

(assert (=> b!1220256 (= lt!554768 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1220256 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554769 () Unit!40285)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78718 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40285)

(assert (=> b!1220256 (= lt!554769 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!101512 res!810557) b!1220239))

(assert (= (and b!1220239 res!810556) b!1220255))

(assert (= (and b!1220255 res!810542) b!1220252))

(assert (= (and b!1220252 res!810543) b!1220241))

(assert (= (and b!1220241 res!810550) b!1220238))

(assert (= (and b!1220238 res!810551) b!1220254))

(assert (= (and b!1220254 res!810555) b!1220246))

(assert (= (and b!1220246 res!810553) b!1220243))

(assert (= (and b!1220243 res!810548) b!1220250))

(assert (= (and b!1220250 res!810554) b!1220242))

(assert (= (and b!1220242 (not res!810545)) b!1220240))

(assert (= (and b!1220240 (not res!810549)) b!1220249))

(assert (= (and b!1220249 (not res!810544)) b!1220251))

(assert (= (and b!1220251 res!810547) b!1220247))

(assert (= (and b!1220247 (not res!810546)) b!1220245))

(assert (= (and b!1220251 (not res!810552)) b!1220256))

(assert (= (and b!1220248 condMapEmpty!48403) mapIsEmpty!48403))

(assert (= (and b!1220248 (not condMapEmpty!48403)) mapNonEmpty!48403))

(get-info :version)

(assert (= (and mapNonEmpty!48403 ((_ is ValueCellFull!14795) mapValue!48403)) b!1220253))

(assert (= (and b!1220248 ((_ is ValueCellFull!14795) mapDefault!48403)) b!1220244))

(assert (= start!101512 b!1220248))

(declare-fun b_lambda!22161 () Bool)

(assert (=> (not b_lambda!22161) (not b!1220240)))

(declare-fun t!40166 () Bool)

(declare-fun tb!11097 () Bool)

(assert (=> (and start!101512 (= defaultEntry!1004 defaultEntry!1004) t!40166) tb!11097))

(declare-fun result!22809 () Bool)

(assert (=> tb!11097 (= result!22809 tp_is_empty!31009)))

(assert (=> b!1220240 t!40166))

(declare-fun b_and!43801 () Bool)

(assert (= b_and!43799 (and (=> t!40166 result!22809) b_and!43801)))

(declare-fun m!1124595 () Bool)

(assert (=> b!1220246 m!1124595))

(declare-fun m!1124597 () Bool)

(assert (=> b!1220247 m!1124597))

(declare-fun m!1124599 () Bool)

(assert (=> b!1220239 m!1124599))

(declare-fun m!1124601 () Bool)

(assert (=> mapNonEmpty!48403 m!1124601))

(declare-fun m!1124603 () Bool)

(assert (=> start!101512 m!1124603))

(declare-fun m!1124605 () Bool)

(assert (=> start!101512 m!1124605))

(declare-fun m!1124607 () Bool)

(assert (=> b!1220242 m!1124607))

(declare-fun m!1124609 () Bool)

(assert (=> b!1220242 m!1124609))

(declare-fun m!1124611 () Bool)

(assert (=> b!1220252 m!1124611))

(declare-fun m!1124613 () Bool)

(assert (=> b!1220241 m!1124613))

(assert (=> b!1220251 m!1124597))

(declare-fun m!1124615 () Bool)

(assert (=> b!1220251 m!1124615))

(assert (=> b!1220251 m!1124615))

(declare-fun m!1124617 () Bool)

(assert (=> b!1220251 m!1124617))

(declare-fun m!1124619 () Bool)

(assert (=> b!1220251 m!1124619))

(declare-fun m!1124621 () Bool)

(assert (=> b!1220249 m!1124621))

(declare-fun m!1124623 () Bool)

(assert (=> b!1220249 m!1124623))

(assert (=> b!1220249 m!1124597))

(declare-fun m!1124625 () Bool)

(assert (=> b!1220249 m!1124625))

(assert (=> b!1220249 m!1124597))

(declare-fun m!1124627 () Bool)

(assert (=> b!1220249 m!1124627))

(declare-fun m!1124629 () Bool)

(assert (=> b!1220249 m!1124629))

(declare-fun m!1124631 () Bool)

(assert (=> b!1220256 m!1124631))

(declare-fun m!1124633 () Bool)

(assert (=> b!1220256 m!1124633))

(declare-fun m!1124635 () Bool)

(assert (=> b!1220256 m!1124635))

(declare-fun m!1124637 () Bool)

(assert (=> b!1220256 m!1124637))

(declare-fun m!1124639 () Bool)

(assert (=> b!1220250 m!1124639))

(declare-fun m!1124641 () Bool)

(assert (=> b!1220243 m!1124641))

(declare-fun m!1124643 () Bool)

(assert (=> b!1220243 m!1124643))

(declare-fun m!1124645 () Bool)

(assert (=> b!1220254 m!1124645))

(declare-fun m!1124647 () Bool)

(assert (=> b!1220245 m!1124647))

(declare-fun m!1124649 () Bool)

(assert (=> b!1220240 m!1124649))

(declare-fun m!1124651 () Bool)

(assert (=> b!1220240 m!1124651))

(declare-fun m!1124653 () Bool)

(assert (=> b!1220240 m!1124653))

(declare-fun m!1124655 () Bool)

(assert (=> b!1220240 m!1124655))

(check-sat (not b!1220256) (not b!1220239) (not b!1220254) (not b!1220250) (not b!1220242) (not b!1220240) (not b_lambda!22161) (not b!1220252) (not b!1220243) (not b_next!26305) b_and!43801 (not b!1220249) (not b!1220245) (not mapNonEmpty!48403) (not start!101512) (not b!1220251) tp_is_empty!31009 (not b!1220241))
(check-sat b_and!43801 (not b_next!26305))
