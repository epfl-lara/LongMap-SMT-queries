; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97430 () Bool)

(assert start!97430)

(declare-fun b_free!23407 () Bool)

(declare-fun b_next!23407 () Bool)

(assert (=> start!97430 (= b_free!23407 (not b_next!23407))))

(declare-fun tp!82519 () Bool)

(declare-fun b_and!37629 () Bool)

(assert (=> start!97430 (= tp!82519 b_and!37629)))

(declare-fun b!1111452 () Bool)

(declare-fun res!741715 () Bool)

(declare-fun e!633757 () Bool)

(assert (=> b!1111452 (=> (not res!741715) (not e!633757))))

(declare-datatypes ((array!72144 0))(
  ( (array!72145 (arr!34725 (Array (_ BitVec 32) (_ BitVec 64))) (size!35263 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72144)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1111452 (= res!741715 (= (select (arr!34725 _keys!1208) i!673) k0!934))))

(declare-fun b!1111453 () Bool)

(declare-fun res!741718 () Bool)

(assert (=> b!1111453 (=> (not res!741718) (not e!633757))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72144 (_ BitVec 32)) Bool)

(assert (=> b!1111453 (= res!741718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!42017 0))(
  ( (V!42018 (val!13890 Int)) )
))
(declare-fun zeroValue!944 () V!42017)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17640 0))(
  ( (tuple2!17641 (_1!8831 (_ BitVec 64)) (_2!8831 V!42017)) )
))
(declare-datatypes ((List!24294 0))(
  ( (Nil!24291) (Cons!24290 (h!25499 tuple2!17640) (t!34738 List!24294)) )
))
(declare-datatypes ((ListLongMap!15609 0))(
  ( (ListLongMap!15610 (toList!7820 List!24294)) )
))
(declare-fun call!46894 () ListLongMap!15609)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46891 () Bool)

(declare-datatypes ((ValueCell!13124 0))(
  ( (ValueCellFull!13124 (v!16522 V!42017)) (EmptyCell!13124) )
))
(declare-datatypes ((array!72146 0))(
  ( (array!72147 (arr!34726 (Array (_ BitVec 32) ValueCell!13124)) (size!35264 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72146)

(declare-fun minValue!944 () V!42017)

(declare-fun getCurrentListMapNoExtraKeys!4332 (array!72144 array!72146 (_ BitVec 32) (_ BitVec 32) V!42017 V!42017 (_ BitVec 32) Int) ListLongMap!15609)

(assert (=> bm!46891 (= call!46894 (getCurrentListMapNoExtraKeys!4332 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111454 () Bool)

(declare-fun res!741714 () Bool)

(assert (=> b!1111454 (=> (not res!741714) (not e!633757))))

(assert (=> b!1111454 (= res!741714 (and (= (size!35264 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35263 _keys!1208) (size!35264 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43318 () Bool)

(declare-fun mapRes!43318 () Bool)

(assert (=> mapIsEmpty!43318 mapRes!43318))

(declare-fun b!1111455 () Bool)

(declare-fun e!633760 () Bool)

(declare-fun e!633756 () Bool)

(assert (=> b!1111455 (= e!633760 (not e!633756))))

(declare-fun res!741719 () Bool)

(assert (=> b!1111455 (=> res!741719 e!633756)))

(assert (=> b!1111455 (= res!741719 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35263 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111455 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36289 0))(
  ( (Unit!36290) )
))
(declare-fun lt!496168 () Unit!36289)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72144 (_ BitVec 64) (_ BitVec 32)) Unit!36289)

(assert (=> b!1111455 (= lt!496168 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111457 () Bool)

(declare-fun e!633755 () Bool)

(declare-fun tp_is_empty!27667 () Bool)

(assert (=> b!1111457 (= e!633755 tp_is_empty!27667)))

(declare-fun b!1111458 () Bool)

(assert (=> b!1111458 (= e!633756 true)))

(declare-fun e!633758 () Bool)

(assert (=> b!1111458 e!633758))

(declare-fun c!109281 () Bool)

(assert (=> b!1111458 (= c!109281 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496169 () Unit!36289)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!305 (array!72144 array!72146 (_ BitVec 32) (_ BitVec 32) V!42017 V!42017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36289)

(assert (=> b!1111458 (= lt!496169 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!305 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111459 () Bool)

(declare-fun call!46895 () ListLongMap!15609)

(declare-fun -!1032 (ListLongMap!15609 (_ BitVec 64)) ListLongMap!15609)

(assert (=> b!1111459 (= e!633758 (= call!46895 (-!1032 call!46894 k0!934)))))

(declare-fun mapNonEmpty!43318 () Bool)

(declare-fun tp!82520 () Bool)

(assert (=> mapNonEmpty!43318 (= mapRes!43318 (and tp!82520 e!633755))))

(declare-fun mapRest!43318 () (Array (_ BitVec 32) ValueCell!13124))

(declare-fun mapKey!43318 () (_ BitVec 32))

(declare-fun mapValue!43318 () ValueCell!13124)

(assert (=> mapNonEmpty!43318 (= (arr!34726 _values!996) (store mapRest!43318 mapKey!43318 mapValue!43318))))

(declare-fun b!1111460 () Bool)

(assert (=> b!1111460 (= e!633757 e!633760)))

(declare-fun res!741721 () Bool)

(assert (=> b!1111460 (=> (not res!741721) (not e!633760))))

(declare-fun lt!496170 () array!72144)

(assert (=> b!1111460 (= res!741721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496170 mask!1564))))

(assert (=> b!1111460 (= lt!496170 (array!72145 (store (arr!34725 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35263 _keys!1208)))))

(declare-fun res!741720 () Bool)

(assert (=> start!97430 (=> (not res!741720) (not e!633757))))

(assert (=> start!97430 (= res!741720 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35263 _keys!1208))))))

(assert (=> start!97430 e!633757))

(assert (=> start!97430 tp_is_empty!27667))

(declare-fun array_inv!26768 (array!72144) Bool)

(assert (=> start!97430 (array_inv!26768 _keys!1208)))

(assert (=> start!97430 true))

(assert (=> start!97430 tp!82519))

(declare-fun e!633759 () Bool)

(declare-fun array_inv!26769 (array!72146) Bool)

(assert (=> start!97430 (and (array_inv!26769 _values!996) e!633759)))

(declare-fun b!1111456 () Bool)

(declare-fun res!741713 () Bool)

(assert (=> b!1111456 (=> (not res!741713) (not e!633760))))

(declare-datatypes ((List!24295 0))(
  ( (Nil!24292) (Cons!24291 (h!25500 (_ BitVec 64)) (t!34739 List!24295)) )
))
(declare-fun arrayNoDuplicates!0 (array!72144 (_ BitVec 32) List!24295) Bool)

(assert (=> b!1111456 (= res!741713 (arrayNoDuplicates!0 lt!496170 #b00000000000000000000000000000000 Nil!24292))))

(declare-fun b!1111461 () Bool)

(declare-fun res!741712 () Bool)

(assert (=> b!1111461 (=> (not res!741712) (not e!633757))))

(assert (=> b!1111461 (= res!741712 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35263 _keys!1208))))))

(declare-fun bm!46892 () Bool)

(declare-fun dynLambda!2395 (Int (_ BitVec 64)) V!42017)

(assert (=> bm!46892 (= call!46895 (getCurrentListMapNoExtraKeys!4332 lt!496170 (array!72147 (store (arr!34726 _values!996) i!673 (ValueCellFull!13124 (dynLambda!2395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35264 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111462 () Bool)

(declare-fun e!633762 () Bool)

(assert (=> b!1111462 (= e!633759 (and e!633762 mapRes!43318))))

(declare-fun condMapEmpty!43318 () Bool)

(declare-fun mapDefault!43318 () ValueCell!13124)

(assert (=> b!1111462 (= condMapEmpty!43318 (= (arr!34726 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13124)) mapDefault!43318)))))

(declare-fun b!1111463 () Bool)

(declare-fun res!741717 () Bool)

(assert (=> b!1111463 (=> (not res!741717) (not e!633757))))

(assert (=> b!1111463 (= res!741717 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24292))))

(declare-fun b!1111464 () Bool)

(assert (=> b!1111464 (= e!633762 tp_is_empty!27667)))

(declare-fun b!1111465 () Bool)

(declare-fun res!741716 () Bool)

(assert (=> b!1111465 (=> (not res!741716) (not e!633757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111465 (= res!741716 (validMask!0 mask!1564))))

(declare-fun b!1111466 () Bool)

(assert (=> b!1111466 (= e!633758 (= call!46895 call!46894))))

(declare-fun b!1111467 () Bool)

(declare-fun res!741711 () Bool)

(assert (=> b!1111467 (=> (not res!741711) (not e!633757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111467 (= res!741711 (validKeyInArray!0 k0!934))))

(assert (= (and start!97430 res!741720) b!1111465))

(assert (= (and b!1111465 res!741716) b!1111454))

(assert (= (and b!1111454 res!741714) b!1111453))

(assert (= (and b!1111453 res!741718) b!1111463))

(assert (= (and b!1111463 res!741717) b!1111461))

(assert (= (and b!1111461 res!741712) b!1111467))

(assert (= (and b!1111467 res!741711) b!1111452))

(assert (= (and b!1111452 res!741715) b!1111460))

(assert (= (and b!1111460 res!741721) b!1111456))

(assert (= (and b!1111456 res!741713) b!1111455))

(assert (= (and b!1111455 (not res!741719)) b!1111458))

(assert (= (and b!1111458 c!109281) b!1111459))

(assert (= (and b!1111458 (not c!109281)) b!1111466))

(assert (= (or b!1111459 b!1111466) bm!46892))

(assert (= (or b!1111459 b!1111466) bm!46891))

(assert (= (and b!1111462 condMapEmpty!43318) mapIsEmpty!43318))

(assert (= (and b!1111462 (not condMapEmpty!43318)) mapNonEmpty!43318))

(get-info :version)

(assert (= (and mapNonEmpty!43318 ((_ is ValueCellFull!13124) mapValue!43318)) b!1111457))

(assert (= (and b!1111462 ((_ is ValueCellFull!13124) mapDefault!43318)) b!1111464))

(assert (= start!97430 b!1111462))

(declare-fun b_lambda!18413 () Bool)

(assert (=> (not b_lambda!18413) (not bm!46892)))

(declare-fun t!34737 () Bool)

(declare-fun tb!8265 () Bool)

(assert (=> (and start!97430 (= defaultEntry!1004 defaultEntry!1004) t!34737) tb!8265))

(declare-fun result!17099 () Bool)

(assert (=> tb!8265 (= result!17099 tp_is_empty!27667)))

(assert (=> bm!46892 t!34737))

(declare-fun b_and!37631 () Bool)

(assert (= b_and!37629 (and (=> t!34737 result!17099) b_and!37631)))

(declare-fun m!1028709 () Bool)

(assert (=> b!1111460 m!1028709))

(declare-fun m!1028711 () Bool)

(assert (=> b!1111460 m!1028711))

(declare-fun m!1028713 () Bool)

(assert (=> b!1111456 m!1028713))

(declare-fun m!1028715 () Bool)

(assert (=> b!1111458 m!1028715))

(declare-fun m!1028717 () Bool)

(assert (=> b!1111452 m!1028717))

(declare-fun m!1028719 () Bool)

(assert (=> bm!46892 m!1028719))

(declare-fun m!1028721 () Bool)

(assert (=> bm!46892 m!1028721))

(declare-fun m!1028723 () Bool)

(assert (=> bm!46892 m!1028723))

(declare-fun m!1028725 () Bool)

(assert (=> bm!46891 m!1028725))

(declare-fun m!1028727 () Bool)

(assert (=> b!1111465 m!1028727))

(declare-fun m!1028729 () Bool)

(assert (=> b!1111453 m!1028729))

(declare-fun m!1028731 () Bool)

(assert (=> start!97430 m!1028731))

(declare-fun m!1028733 () Bool)

(assert (=> start!97430 m!1028733))

(declare-fun m!1028735 () Bool)

(assert (=> b!1111459 m!1028735))

(declare-fun m!1028737 () Bool)

(assert (=> b!1111467 m!1028737))

(declare-fun m!1028739 () Bool)

(assert (=> b!1111455 m!1028739))

(declare-fun m!1028741 () Bool)

(assert (=> b!1111455 m!1028741))

(declare-fun m!1028743 () Bool)

(assert (=> b!1111463 m!1028743))

(declare-fun m!1028745 () Bool)

(assert (=> mapNonEmpty!43318 m!1028745))

(check-sat (not b!1111456) (not b_next!23407) (not b!1111455) (not bm!46891) (not b!1111467) (not b!1111463) (not b_lambda!18413) (not b!1111465) (not start!97430) (not b!1111460) tp_is_empty!27667 b_and!37631 (not b!1111458) (not b!1111459) (not mapNonEmpty!43318) (not b!1111453) (not bm!46892))
(check-sat b_and!37631 (not b_next!23407))
