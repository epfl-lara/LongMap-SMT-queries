; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97868 () Bool)

(assert start!97868)

(declare-fun b_free!23575 () Bool)

(declare-fun b_next!23575 () Bool)

(assert (=> start!97868 (= b_free!23575 (not b_next!23575))))

(declare-fun tp!83428 () Bool)

(declare-fun b_and!37911 () Bool)

(assert (=> start!97868 (= tp!83428 b_and!37911)))

(declare-fun b!1120451 () Bool)

(declare-fun res!748537 () Bool)

(declare-fun e!638003 () Bool)

(assert (=> b!1120451 (=> (not res!748537) (not e!638003))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73004 0))(
  ( (array!73005 (arr!35155 (Array (_ BitVec 32) (_ BitVec 64))) (size!35693 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73004)

(assert (=> b!1120451 (= res!748537 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35693 _keys!1208))))))

(declare-fun b!1120452 () Bool)

(declare-fun res!748542 () Bool)

(assert (=> b!1120452 (=> (not res!748542) (not e!638003))))

(declare-datatypes ((List!24541 0))(
  ( (Nil!24538) (Cons!24537 (h!25746 (_ BitVec 64)) (t!35099 List!24541)) )
))
(declare-fun arrayNoDuplicates!0 (array!73004 (_ BitVec 32) List!24541) Bool)

(assert (=> b!1120452 (= res!748542 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24538))))

(declare-fun b!1120453 () Bool)

(declare-fun res!748545 () Bool)

(assert (=> b!1120453 (=> (not res!748545) (not e!638003))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120453 (= res!748545 (validMask!0 mask!1564))))

(declare-fun b!1120454 () Bool)

(declare-fun res!748540 () Bool)

(declare-fun e!637997 () Bool)

(assert (=> b!1120454 (=> (not res!748540) (not e!637997))))

(declare-fun lt!497869 () array!73004)

(assert (=> b!1120454 (= res!748540 (arrayNoDuplicates!0 lt!497869 #b00000000000000000000000000000000 Nil!24538))))

(declare-datatypes ((V!42601 0))(
  ( (V!42602 (val!14109 Int)) )
))
(declare-fun zeroValue!944 () V!42601)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42601)

(declare-datatypes ((ValueCell!13343 0))(
  ( (ValueCellFull!13343 (v!16741 V!42601)) (EmptyCell!13343) )
))
(declare-datatypes ((array!73006 0))(
  ( (array!73007 (arr!35156 (Array (_ BitVec 32) ValueCell!13343)) (size!35694 (_ BitVec 32))) )
))
(declare-fun lt!497867 () array!73006)

(declare-fun bm!46981 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17768 0))(
  ( (tuple2!17769 (_1!8895 (_ BitVec 64)) (_2!8895 V!42601)) )
))
(declare-datatypes ((List!24542 0))(
  ( (Nil!24539) (Cons!24538 (h!25747 tuple2!17768) (t!35100 List!24542)) )
))
(declare-datatypes ((ListLongMap!15737 0))(
  ( (ListLongMap!15738 (toList!7884 List!24542)) )
))
(declare-fun call!46984 () ListLongMap!15737)

(declare-fun getCurrentListMapNoExtraKeys!4393 (array!73004 array!73006 (_ BitVec 32) (_ BitVec 32) V!42601 V!42601 (_ BitVec 32) Int) ListLongMap!15737)

(assert (=> bm!46981 (= call!46984 (getCurrentListMapNoExtraKeys!4393 lt!497869 lt!497867 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120455 () Bool)

(declare-fun e!638000 () Bool)

(declare-fun call!46985 () ListLongMap!15737)

(assert (=> b!1120455 (= e!638000 (= call!46984 call!46985))))

(declare-fun b!1120456 () Bool)

(declare-fun res!748539 () Bool)

(assert (=> b!1120456 (=> (not res!748539) (not e!638003))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120456 (= res!748539 (validKeyInArray!0 k0!934))))

(declare-fun b!1120458 () Bool)

(assert (=> b!1120458 (= e!638003 e!637997)))

(declare-fun res!748546 () Bool)

(assert (=> b!1120458 (=> (not res!748546) (not e!637997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73004 (_ BitVec 32)) Bool)

(assert (=> b!1120458 (= res!748546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497869 mask!1564))))

(assert (=> b!1120458 (= lt!497869 (array!73005 (store (arr!35155 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35693 _keys!1208)))))

(declare-fun b!1120459 () Bool)

(declare-fun e!637998 () Bool)

(declare-fun tp_is_empty!28105 () Bool)

(assert (=> b!1120459 (= e!637998 tp_is_empty!28105)))

(declare-fun b!1120460 () Bool)

(declare-fun res!748535 () Bool)

(assert (=> b!1120460 (=> (not res!748535) (not e!638003))))

(assert (=> b!1120460 (= res!748535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43975 () Bool)

(declare-fun mapRes!43975 () Bool)

(assert (=> mapIsEmpty!43975 mapRes!43975))

(declare-fun b!1120461 () Bool)

(declare-fun e!638001 () Bool)

(assert (=> b!1120461 (= e!637997 (not e!638001))))

(declare-fun res!748543 () Bool)

(assert (=> b!1120461 (=> res!748543 e!638001)))

(assert (=> b!1120461 (= res!748543 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120461 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36593 0))(
  ( (Unit!36594) )
))
(declare-fun lt!497868 () Unit!36593)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73004 (_ BitVec 64) (_ BitVec 32)) Unit!36593)

(assert (=> b!1120461 (= lt!497868 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!46982 () Bool)

(declare-fun _values!996 () array!73006)

(assert (=> bm!46982 (= call!46985 (getCurrentListMapNoExtraKeys!4393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120462 () Bool)

(declare-fun e!638002 () Bool)

(assert (=> b!1120462 (= e!638002 tp_is_empty!28105)))

(declare-fun b!1120463 () Bool)

(declare-fun -!1041 (ListLongMap!15737 (_ BitVec 64)) ListLongMap!15737)

(assert (=> b!1120463 (= e!638000 (= call!46984 (-!1041 call!46985 k0!934)))))

(declare-fun b!1120464 () Bool)

(declare-fun res!748538 () Bool)

(assert (=> b!1120464 (=> (not res!748538) (not e!638003))))

(assert (=> b!1120464 (= res!748538 (and (= (size!35694 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35693 _keys!1208) (size!35694 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43975 () Bool)

(declare-fun tp!83429 () Bool)

(assert (=> mapNonEmpty!43975 (= mapRes!43975 (and tp!83429 e!638002))))

(declare-fun mapValue!43975 () ValueCell!13343)

(declare-fun mapKey!43975 () (_ BitVec 32))

(declare-fun mapRest!43975 () (Array (_ BitVec 32) ValueCell!13343))

(assert (=> mapNonEmpty!43975 (= (arr!35156 _values!996) (store mapRest!43975 mapKey!43975 mapValue!43975))))

(declare-fun b!1120465 () Bool)

(declare-fun e!637996 () Bool)

(assert (=> b!1120465 (= e!637996 (and e!637998 mapRes!43975))))

(declare-fun condMapEmpty!43975 () Bool)

(declare-fun mapDefault!43975 () ValueCell!13343)

(assert (=> b!1120465 (= condMapEmpty!43975 (= (arr!35156 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13343)) mapDefault!43975)))))

(declare-fun res!748544 () Bool)

(assert (=> start!97868 (=> (not res!748544) (not e!638003))))

(assert (=> start!97868 (= res!748544 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35693 _keys!1208))))))

(assert (=> start!97868 e!638003))

(assert (=> start!97868 tp_is_empty!28105))

(declare-fun array_inv!27072 (array!73004) Bool)

(assert (=> start!97868 (array_inv!27072 _keys!1208)))

(assert (=> start!97868 true))

(assert (=> start!97868 tp!83428))

(declare-fun array_inv!27073 (array!73006) Bool)

(assert (=> start!97868 (and (array_inv!27073 _values!996) e!637996)))

(declare-fun b!1120457 () Bool)

(declare-fun e!637999 () Bool)

(assert (=> b!1120457 (= e!638001 e!637999)))

(declare-fun res!748536 () Bool)

(assert (=> b!1120457 (=> res!748536 e!637999)))

(assert (=> b!1120457 (= res!748536 (not (= from!1455 i!673)))))

(declare-fun lt!497871 () ListLongMap!15737)

(assert (=> b!1120457 (= lt!497871 (getCurrentListMapNoExtraKeys!4393 lt!497869 lt!497867 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2436 (Int (_ BitVec 64)) V!42601)

(assert (=> b!1120457 (= lt!497867 (array!73007 (store (arr!35156 _values!996) i!673 (ValueCellFull!13343 (dynLambda!2436 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35694 _values!996)))))

(declare-fun lt!497870 () ListLongMap!15737)

(assert (=> b!1120457 (= lt!497870 (getCurrentListMapNoExtraKeys!4393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120466 () Bool)

(declare-fun res!748541 () Bool)

(assert (=> b!1120466 (=> (not res!748541) (not e!638003))))

(assert (=> b!1120466 (= res!748541 (= (select (arr!35155 _keys!1208) i!673) k0!934))))

(declare-fun b!1120467 () Bool)

(assert (=> b!1120467 (= e!637999 true)))

(assert (=> b!1120467 e!638000))

(declare-fun c!109326 () Bool)

(assert (=> b!1120467 (= c!109326 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!497866 () Unit!36593)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!316 (array!73004 array!73006 (_ BitVec 32) (_ BitVec 32) V!42601 V!42601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36593)

(assert (=> b!1120467 (= lt!497866 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!316 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97868 res!748544) b!1120453))

(assert (= (and b!1120453 res!748545) b!1120464))

(assert (= (and b!1120464 res!748538) b!1120460))

(assert (= (and b!1120460 res!748535) b!1120452))

(assert (= (and b!1120452 res!748542) b!1120451))

(assert (= (and b!1120451 res!748537) b!1120456))

(assert (= (and b!1120456 res!748539) b!1120466))

(assert (= (and b!1120466 res!748541) b!1120458))

(assert (= (and b!1120458 res!748546) b!1120454))

(assert (= (and b!1120454 res!748540) b!1120461))

(assert (= (and b!1120461 (not res!748543)) b!1120457))

(assert (= (and b!1120457 (not res!748536)) b!1120467))

(assert (= (and b!1120467 c!109326) b!1120463))

(assert (= (and b!1120467 (not c!109326)) b!1120455))

(assert (= (or b!1120463 b!1120455) bm!46981))

(assert (= (or b!1120463 b!1120455) bm!46982))

(assert (= (and b!1120465 condMapEmpty!43975) mapIsEmpty!43975))

(assert (= (and b!1120465 (not condMapEmpty!43975)) mapNonEmpty!43975))

(get-info :version)

(assert (= (and mapNonEmpty!43975 ((_ is ValueCellFull!13343) mapValue!43975)) b!1120462))

(assert (= (and b!1120465 ((_ is ValueCellFull!13343) mapDefault!43975)) b!1120459))

(assert (= start!97868 b!1120465))

(declare-fun b_lambda!18527 () Bool)

(assert (=> (not b_lambda!18527) (not b!1120457)))

(declare-fun t!35098 () Bool)

(declare-fun tb!8379 () Bool)

(assert (=> (and start!97868 (= defaultEntry!1004 defaultEntry!1004) t!35098) tb!8379))

(declare-fun result!17327 () Bool)

(assert (=> tb!8379 (= result!17327 tp_is_empty!28105)))

(assert (=> b!1120457 t!35098))

(declare-fun b_and!37913 () Bool)

(assert (= b_and!37911 (and (=> t!35098 result!17327) b_and!37913)))

(declare-fun m!1034973 () Bool)

(assert (=> mapNonEmpty!43975 m!1034973))

(declare-fun m!1034975 () Bool)

(assert (=> b!1120467 m!1034975))

(declare-fun m!1034977 () Bool)

(assert (=> bm!46981 m!1034977))

(declare-fun m!1034979 () Bool)

(assert (=> b!1120460 m!1034979))

(declare-fun m!1034981 () Bool)

(assert (=> b!1120453 m!1034981))

(declare-fun m!1034983 () Bool)

(assert (=> b!1120454 m!1034983))

(declare-fun m!1034985 () Bool)

(assert (=> bm!46982 m!1034985))

(declare-fun m!1034987 () Bool)

(assert (=> b!1120463 m!1034987))

(declare-fun m!1034989 () Bool)

(assert (=> start!97868 m!1034989))

(declare-fun m!1034991 () Bool)

(assert (=> start!97868 m!1034991))

(declare-fun m!1034993 () Bool)

(assert (=> b!1120456 m!1034993))

(declare-fun m!1034995 () Bool)

(assert (=> b!1120452 m!1034995))

(declare-fun m!1034997 () Bool)

(assert (=> b!1120461 m!1034997))

(declare-fun m!1034999 () Bool)

(assert (=> b!1120461 m!1034999))

(declare-fun m!1035001 () Bool)

(assert (=> b!1120457 m!1035001))

(declare-fun m!1035003 () Bool)

(assert (=> b!1120457 m!1035003))

(declare-fun m!1035005 () Bool)

(assert (=> b!1120457 m!1035005))

(declare-fun m!1035007 () Bool)

(assert (=> b!1120457 m!1035007))

(declare-fun m!1035009 () Bool)

(assert (=> b!1120458 m!1035009))

(declare-fun m!1035011 () Bool)

(assert (=> b!1120458 m!1035011))

(declare-fun m!1035013 () Bool)

(assert (=> b!1120466 m!1035013))

(check-sat (not bm!46982) (not b!1120461) (not b!1120460) tp_is_empty!28105 (not b!1120463) (not bm!46981) (not b_next!23575) b_and!37913 (not b!1120457) (not b!1120452) (not b!1120454) (not b_lambda!18527) (not start!97868) (not b!1120467) (not b!1120453) (not mapNonEmpty!43975) (not b!1120456) (not b!1120458))
(check-sat b_and!37913 (not b_next!23575))
