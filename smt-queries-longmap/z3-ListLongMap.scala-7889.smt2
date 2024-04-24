; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98314 () Bool)

(assert start!98314)

(declare-fun b_free!23779 () Bool)

(declare-fun b_next!23779 () Bool)

(assert (=> start!98314 (= b_free!23779 (not b_next!23779))))

(declare-fun tp!84041 () Bool)

(declare-fun b_and!38351 () Bool)

(assert (=> start!98314 (= tp!84041 b_and!38351)))

(declare-fun b!1127729 () Bool)

(declare-fun e!642012 () Bool)

(assert (=> b!1127729 (= e!642012 true)))

(declare-datatypes ((V!42873 0))(
  ( (V!42874 (val!14211 Int)) )
))
(declare-fun zeroValue!944 () V!42873)

(declare-fun lt!500726 () Bool)

(declare-datatypes ((array!73527 0))(
  ( (array!73528 (arr!35410 (Array (_ BitVec 32) (_ BitVec 64))) (size!35947 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73527)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13445 0))(
  ( (ValueCellFull!13445 (v!16840 V!42873)) (EmptyCell!13445) )
))
(declare-datatypes ((array!73529 0))(
  ( (array!73530 (arr!35411 (Array (_ BitVec 32) ValueCell!13445)) (size!35948 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73529)

(declare-fun minValue!944 () V!42873)

(declare-datatypes ((tuple2!17882 0))(
  ( (tuple2!17883 (_1!8952 (_ BitVec 64)) (_2!8952 V!42873)) )
))
(declare-datatypes ((List!24669 0))(
  ( (Nil!24666) (Cons!24665 (h!25883 tuple2!17882) (t!35432 List!24669)) )
))
(declare-datatypes ((ListLongMap!15859 0))(
  ( (ListLongMap!15860 (toList!7945 List!24669)) )
))
(declare-fun contains!6491 (ListLongMap!15859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4468 (array!73527 array!73529 (_ BitVec 32) (_ BitVec 32) V!42873 V!42873 (_ BitVec 32) Int) ListLongMap!15859)

(assert (=> b!1127729 (= lt!500726 (contains!6491 (getCurrentListMapNoExtraKeys!4468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127730 () Bool)

(declare-fun res!753219 () Bool)

(declare-fun e!642009 () Bool)

(assert (=> b!1127730 (=> (not res!753219) (not e!642009))))

(assert (=> b!1127730 (= res!753219 (and (= (size!35948 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35947 _keys!1208) (size!35948 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127731 () Bool)

(declare-fun res!753222 () Bool)

(assert (=> b!1127731 (=> (not res!753222) (not e!642009))))

(declare-datatypes ((List!24670 0))(
  ( (Nil!24667) (Cons!24666 (h!25884 (_ BitVec 64)) (t!35433 List!24670)) )
))
(declare-fun arrayNoDuplicates!0 (array!73527 (_ BitVec 32) List!24670) Bool)

(assert (=> b!1127731 (= res!753222 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24667))))

(declare-fun mapIsEmpty!44281 () Bool)

(declare-fun mapRes!44281 () Bool)

(assert (=> mapIsEmpty!44281 mapRes!44281))

(declare-fun bm!47683 () Bool)

(declare-fun call!47687 () ListLongMap!15859)

(assert (=> bm!47683 (= call!47687 (getCurrentListMapNoExtraKeys!4468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127733 () Bool)

(declare-fun e!642006 () Bool)

(declare-fun tp_is_empty!28309 () Bool)

(assert (=> b!1127733 (= e!642006 tp_is_empty!28309)))

(declare-fun mapNonEmpty!44281 () Bool)

(declare-fun tp!84040 () Bool)

(declare-fun e!642004 () Bool)

(assert (=> mapNonEmpty!44281 (= mapRes!44281 (and tp!84040 e!642004))))

(declare-fun mapRest!44281 () (Array (_ BitVec 32) ValueCell!13445))

(declare-fun mapKey!44281 () (_ BitVec 32))

(declare-fun mapValue!44281 () ValueCell!13445)

(assert (=> mapNonEmpty!44281 (= (arr!35411 _values!996) (store mapRest!44281 mapKey!44281 mapValue!44281))))

(declare-fun b!1127734 () Bool)

(declare-fun e!642008 () Bool)

(declare-fun call!47686 () ListLongMap!15859)

(assert (=> b!1127734 (= e!642008 (= call!47686 call!47687))))

(declare-fun b!1127735 () Bool)

(declare-fun res!753223 () Bool)

(assert (=> b!1127735 (=> (not res!753223) (not e!642009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127735 (= res!753223 (validKeyInArray!0 k0!934))))

(declare-fun b!1127736 () Bool)

(assert (=> b!1127736 (= e!642004 tp_is_empty!28309)))

(declare-fun b!1127737 () Bool)

(declare-fun -!1122 (ListLongMap!15859 (_ BitVec 64)) ListLongMap!15859)

(assert (=> b!1127737 (= e!642008 (= call!47686 (-!1122 call!47687 k0!934)))))

(declare-fun b!1127738 () Bool)

(declare-fun res!753214 () Bool)

(assert (=> b!1127738 (=> (not res!753214) (not e!642009))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127738 (= res!753214 (= (select (arr!35410 _keys!1208) i!673) k0!934))))

(declare-fun b!1127739 () Bool)

(declare-fun e!642010 () Bool)

(assert (=> b!1127739 (= e!642010 (and e!642006 mapRes!44281))))

(declare-fun condMapEmpty!44281 () Bool)

(declare-fun mapDefault!44281 () ValueCell!13445)

(assert (=> b!1127739 (= condMapEmpty!44281 (= (arr!35411 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13445)) mapDefault!44281)))))

(declare-fun b!1127740 () Bool)

(declare-fun e!642003 () Bool)

(assert (=> b!1127740 (= e!642009 e!642003)))

(declare-fun res!753215 () Bool)

(assert (=> b!1127740 (=> (not res!753215) (not e!642003))))

(declare-fun lt!500728 () array!73527)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73527 (_ BitVec 32)) Bool)

(assert (=> b!1127740 (= res!753215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500728 mask!1564))))

(assert (=> b!1127740 (= lt!500728 (array!73528 (store (arr!35410 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35947 _keys!1208)))))

(declare-fun b!1127741 () Bool)

(declare-fun res!753216 () Bool)

(assert (=> b!1127741 (=> (not res!753216) (not e!642009))))

(assert (=> b!1127741 (= res!753216 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35947 _keys!1208))))))

(declare-fun b!1127742 () Bool)

(declare-fun e!642007 () Bool)

(assert (=> b!1127742 (= e!642007 e!642012)))

(declare-fun res!753218 () Bool)

(assert (=> b!1127742 (=> res!753218 e!642012)))

(assert (=> b!1127742 (= res!753218 (not (= (select (arr!35410 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127742 e!642008))

(declare-fun c!110069 () Bool)

(assert (=> b!1127742 (= c!110069 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36903 0))(
  ( (Unit!36904) )
))
(declare-fun lt!500730 () Unit!36903)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!384 (array!73527 array!73529 (_ BitVec 32) (_ BitVec 32) V!42873 V!42873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36903)

(assert (=> b!1127742 (= lt!500730 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!384 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127743 () Bool)

(declare-fun e!642011 () Bool)

(assert (=> b!1127743 (= e!642003 (not e!642011))))

(declare-fun res!753226 () Bool)

(assert (=> b!1127743 (=> res!753226 e!642011)))

(assert (=> b!1127743 (= res!753226 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127743 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500729 () Unit!36903)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73527 (_ BitVec 64) (_ BitVec 32)) Unit!36903)

(assert (=> b!1127743 (= lt!500729 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127744 () Bool)

(declare-fun res!753217 () Bool)

(assert (=> b!1127744 (=> (not res!753217) (not e!642009))))

(assert (=> b!1127744 (= res!753217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!753220 () Bool)

(assert (=> start!98314 (=> (not res!753220) (not e!642009))))

(assert (=> start!98314 (= res!753220 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35947 _keys!1208))))))

(assert (=> start!98314 e!642009))

(assert (=> start!98314 tp_is_empty!28309))

(declare-fun array_inv!27232 (array!73527) Bool)

(assert (=> start!98314 (array_inv!27232 _keys!1208)))

(assert (=> start!98314 true))

(assert (=> start!98314 tp!84041))

(declare-fun array_inv!27233 (array!73529) Bool)

(assert (=> start!98314 (and (array_inv!27233 _values!996) e!642010)))

(declare-fun b!1127732 () Bool)

(declare-fun res!753224 () Bool)

(assert (=> b!1127732 (=> (not res!753224) (not e!642009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127732 (= res!753224 (validMask!0 mask!1564))))

(declare-fun bm!47684 () Bool)

(declare-fun lt!500727 () array!73529)

(assert (=> bm!47684 (= call!47686 (getCurrentListMapNoExtraKeys!4468 lt!500728 lt!500727 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127745 () Bool)

(declare-fun res!753221 () Bool)

(assert (=> b!1127745 (=> (not res!753221) (not e!642003))))

(assert (=> b!1127745 (= res!753221 (arrayNoDuplicates!0 lt!500728 #b00000000000000000000000000000000 Nil!24667))))

(declare-fun b!1127746 () Bool)

(assert (=> b!1127746 (= e!642011 e!642007)))

(declare-fun res!753225 () Bool)

(assert (=> b!1127746 (=> res!753225 e!642007)))

(assert (=> b!1127746 (= res!753225 (not (= from!1455 i!673)))))

(declare-fun lt!500731 () ListLongMap!15859)

(assert (=> b!1127746 (= lt!500731 (getCurrentListMapNoExtraKeys!4468 lt!500728 lt!500727 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2539 (Int (_ BitVec 64)) V!42873)

(assert (=> b!1127746 (= lt!500727 (array!73530 (store (arr!35411 _values!996) i!673 (ValueCellFull!13445 (dynLambda!2539 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35948 _values!996)))))

(declare-fun lt!500725 () ListLongMap!15859)

(assert (=> b!1127746 (= lt!500725 (getCurrentListMapNoExtraKeys!4468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!98314 res!753220) b!1127732))

(assert (= (and b!1127732 res!753224) b!1127730))

(assert (= (and b!1127730 res!753219) b!1127744))

(assert (= (and b!1127744 res!753217) b!1127731))

(assert (= (and b!1127731 res!753222) b!1127741))

(assert (= (and b!1127741 res!753216) b!1127735))

(assert (= (and b!1127735 res!753223) b!1127738))

(assert (= (and b!1127738 res!753214) b!1127740))

(assert (= (and b!1127740 res!753215) b!1127745))

(assert (= (and b!1127745 res!753221) b!1127743))

(assert (= (and b!1127743 (not res!753226)) b!1127746))

(assert (= (and b!1127746 (not res!753225)) b!1127742))

(assert (= (and b!1127742 c!110069) b!1127737))

(assert (= (and b!1127742 (not c!110069)) b!1127734))

(assert (= (or b!1127737 b!1127734) bm!47684))

(assert (= (or b!1127737 b!1127734) bm!47683))

(assert (= (and b!1127742 (not res!753218)) b!1127729))

(assert (= (and b!1127739 condMapEmpty!44281) mapIsEmpty!44281))

(assert (= (and b!1127739 (not condMapEmpty!44281)) mapNonEmpty!44281))

(get-info :version)

(assert (= (and mapNonEmpty!44281 ((_ is ValueCellFull!13445) mapValue!44281)) b!1127736))

(assert (= (and b!1127739 ((_ is ValueCellFull!13445) mapDefault!44281)) b!1127733))

(assert (= start!98314 b!1127739))

(declare-fun b_lambda!18759 () Bool)

(assert (=> (not b_lambda!18759) (not b!1127746)))

(declare-fun t!35431 () Bool)

(declare-fun tb!8583 () Bool)

(assert (=> (and start!98314 (= defaultEntry!1004 defaultEntry!1004) t!35431) tb!8583))

(declare-fun result!17735 () Bool)

(assert (=> tb!8583 (= result!17735 tp_is_empty!28309)))

(assert (=> b!1127746 t!35431))

(declare-fun b_and!38353 () Bool)

(assert (= b_and!38351 (and (=> t!35431 result!17735) b_and!38353)))

(declare-fun m!1042047 () Bool)

(assert (=> bm!47683 m!1042047))

(assert (=> b!1127729 m!1042047))

(assert (=> b!1127729 m!1042047))

(declare-fun m!1042049 () Bool)

(assert (=> b!1127729 m!1042049))

(declare-fun m!1042051 () Bool)

(assert (=> b!1127735 m!1042051))

(declare-fun m!1042053 () Bool)

(assert (=> b!1127742 m!1042053))

(declare-fun m!1042055 () Bool)

(assert (=> b!1127742 m!1042055))

(declare-fun m!1042057 () Bool)

(assert (=> b!1127746 m!1042057))

(declare-fun m!1042059 () Bool)

(assert (=> b!1127746 m!1042059))

(declare-fun m!1042061 () Bool)

(assert (=> b!1127746 m!1042061))

(declare-fun m!1042063 () Bool)

(assert (=> b!1127746 m!1042063))

(declare-fun m!1042065 () Bool)

(assert (=> b!1127740 m!1042065))

(declare-fun m!1042067 () Bool)

(assert (=> b!1127740 m!1042067))

(declare-fun m!1042069 () Bool)

(assert (=> b!1127737 m!1042069))

(declare-fun m!1042071 () Bool)

(assert (=> b!1127745 m!1042071))

(declare-fun m!1042073 () Bool)

(assert (=> b!1127732 m!1042073))

(declare-fun m!1042075 () Bool)

(assert (=> b!1127744 m!1042075))

(declare-fun m!1042077 () Bool)

(assert (=> b!1127738 m!1042077))

(declare-fun m!1042079 () Bool)

(assert (=> b!1127731 m!1042079))

(declare-fun m!1042081 () Bool)

(assert (=> bm!47684 m!1042081))

(declare-fun m!1042083 () Bool)

(assert (=> start!98314 m!1042083))

(declare-fun m!1042085 () Bool)

(assert (=> start!98314 m!1042085))

(declare-fun m!1042087 () Bool)

(assert (=> b!1127743 m!1042087))

(declare-fun m!1042089 () Bool)

(assert (=> b!1127743 m!1042089))

(declare-fun m!1042091 () Bool)

(assert (=> mapNonEmpty!44281 m!1042091))

(check-sat (not b_next!23779) (not b!1127744) (not b!1127731) (not b!1127729) (not b!1127746) (not bm!47683) (not b!1127740) (not bm!47684) (not b!1127745) b_and!38353 (not mapNonEmpty!44281) (not b!1127743) (not b!1127735) (not b!1127742) (not start!98314) (not b_lambda!18759) tp_is_empty!28309 (not b!1127737) (not b!1127732))
(check-sat b_and!38353 (not b_next!23779))
