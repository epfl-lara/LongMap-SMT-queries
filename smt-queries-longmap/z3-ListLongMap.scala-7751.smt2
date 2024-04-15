; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97244 () Bool)

(assert start!97244)

(declare-fun b_free!23221 () Bool)

(declare-fun b_next!23221 () Bool)

(assert (=> start!97244 (= b_free!23221 (not b_next!23221))))

(declare-fun tp!81961 () Bool)

(declare-fun b_and!37247 () Bool)

(assert (=> start!97244 (= tp!81961 b_and!37247)))

(declare-fun b!1106742 () Bool)

(declare-fun res!738646 () Bool)

(declare-fun e!631495 () Bool)

(assert (=> b!1106742 (=> (not res!738646) (not e!631495))))

(declare-datatypes ((array!71786 0))(
  ( (array!71787 (arr!34546 (Array (_ BitVec 32) (_ BitVec 64))) (size!35084 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71786)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41769 0))(
  ( (V!41770 (val!13797 Int)) )
))
(declare-datatypes ((ValueCell!13031 0))(
  ( (ValueCellFull!13031 (v!16429 V!41769)) (EmptyCell!13031) )
))
(declare-datatypes ((array!71788 0))(
  ( (array!71789 (arr!34547 (Array (_ BitVec 32) ValueCell!13031)) (size!35085 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71788)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1106742 (= res!738646 (and (= (size!35085 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35084 _keys!1208) (size!35085 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106743 () Bool)

(declare-fun res!738648 () Bool)

(assert (=> b!1106743 (=> (not res!738648) (not e!631495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106743 (= res!738648 (validMask!0 mask!1564))))

(declare-fun b!1106744 () Bool)

(declare-fun e!631493 () Bool)

(assert (=> b!1106744 (= e!631495 e!631493)))

(declare-fun res!738647 () Bool)

(assert (=> b!1106744 (=> (not res!738647) (not e!631493))))

(declare-fun lt!495331 () array!71786)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71786 (_ BitVec 32)) Bool)

(assert (=> b!1106744 (= res!738647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495331 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106744 (= lt!495331 (array!71787 (store (arr!34546 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35084 _keys!1208)))))

(declare-fun mapIsEmpty!43039 () Bool)

(declare-fun mapRes!43039 () Bool)

(assert (=> mapIsEmpty!43039 mapRes!43039))

(declare-fun b!1106746 () Bool)

(declare-fun e!631496 () Bool)

(assert (=> b!1106746 (= e!631496 true)))

(declare-fun e!631500 () Bool)

(assert (=> b!1106746 e!631500))

(declare-fun c!108972 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1106746 (= c!108972 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41769)

(declare-datatypes ((Unit!36141 0))(
  ( (Unit!36142) )
))
(declare-fun lt!495333 () Unit!36141)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!41769)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!239 (array!71786 array!71788 (_ BitVec 32) (_ BitVec 32) V!41769 V!41769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36141)

(assert (=> b!1106746 (= lt!495333 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!239 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((tuple2!17476 0))(
  ( (tuple2!17477 (_1!8749 (_ BitVec 64)) (_2!8749 V!41769)) )
))
(declare-datatypes ((List!24138 0))(
  ( (Nil!24135) (Cons!24134 (h!25343 tuple2!17476) (t!34396 List!24138)) )
))
(declare-datatypes ((ListLongMap!15445 0))(
  ( (ListLongMap!15446 (toList!7738 List!24138)) )
))
(declare-fun call!46337 () ListLongMap!15445)

(declare-fun bm!46333 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4257 (array!71786 array!71788 (_ BitVec 32) (_ BitVec 32) V!41769 V!41769 (_ BitVec 32) Int) ListLongMap!15445)

(declare-fun dynLambda!2326 (Int (_ BitVec 64)) V!41769)

(assert (=> bm!46333 (= call!46337 (getCurrentListMapNoExtraKeys!4257 lt!495331 (array!71789 (store (arr!34547 _values!996) i!673 (ValueCellFull!13031 (dynLambda!2326 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35085 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1106747 () Bool)

(declare-fun res!738652 () Bool)

(assert (=> b!1106747 (=> (not res!738652) (not e!631493))))

(declare-datatypes ((List!24139 0))(
  ( (Nil!24136) (Cons!24135 (h!25344 (_ BitVec 64)) (t!34397 List!24139)) )
))
(declare-fun arrayNoDuplicates!0 (array!71786 (_ BitVec 32) List!24139) Bool)

(assert (=> b!1106747 (= res!738652 (arrayNoDuplicates!0 lt!495331 #b00000000000000000000000000000000 Nil!24136))))

(declare-fun call!46336 () ListLongMap!15445)

(declare-fun bm!46334 () Bool)

(assert (=> bm!46334 (= call!46336 (getCurrentListMapNoExtraKeys!4257 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1106748 () Bool)

(declare-fun e!631497 () Bool)

(declare-fun tp_is_empty!27481 () Bool)

(assert (=> b!1106748 (= e!631497 tp_is_empty!27481)))

(declare-fun b!1106749 () Bool)

(declare-fun res!738643 () Bool)

(assert (=> b!1106749 (=> (not res!738643) (not e!631495))))

(assert (=> b!1106749 (= res!738643 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24136))))

(declare-fun b!1106750 () Bool)

(declare-fun res!738644 () Bool)

(assert (=> b!1106750 (=> (not res!738644) (not e!631495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106750 (= res!738644 (validKeyInArray!0 k0!934))))

(declare-fun b!1106751 () Bool)

(declare-fun -!965 (ListLongMap!15445 (_ BitVec 64)) ListLongMap!15445)

(assert (=> b!1106751 (= e!631500 (= call!46337 (-!965 call!46336 k0!934)))))

(declare-fun b!1106745 () Bool)

(declare-fun res!738651 () Bool)

(assert (=> b!1106745 (=> (not res!738651) (not e!631495))))

(assert (=> b!1106745 (= res!738651 (= (select (arr!34546 _keys!1208) i!673) k0!934))))

(declare-fun res!738642 () Bool)

(assert (=> start!97244 (=> (not res!738642) (not e!631495))))

(assert (=> start!97244 (= res!738642 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35084 _keys!1208))))))

(assert (=> start!97244 e!631495))

(assert (=> start!97244 tp_is_empty!27481))

(declare-fun array_inv!26640 (array!71786) Bool)

(assert (=> start!97244 (array_inv!26640 _keys!1208)))

(assert (=> start!97244 true))

(assert (=> start!97244 tp!81961))

(declare-fun e!631494 () Bool)

(declare-fun array_inv!26641 (array!71788) Bool)

(assert (=> start!97244 (and (array_inv!26641 _values!996) e!631494)))

(declare-fun mapNonEmpty!43039 () Bool)

(declare-fun tp!81962 () Bool)

(declare-fun e!631498 () Bool)

(assert (=> mapNonEmpty!43039 (= mapRes!43039 (and tp!81962 e!631498))))

(declare-fun mapValue!43039 () ValueCell!13031)

(declare-fun mapKey!43039 () (_ BitVec 32))

(declare-fun mapRest!43039 () (Array (_ BitVec 32) ValueCell!13031))

(assert (=> mapNonEmpty!43039 (= (arr!34547 _values!996) (store mapRest!43039 mapKey!43039 mapValue!43039))))

(declare-fun b!1106752 () Bool)

(assert (=> b!1106752 (= e!631493 (not e!631496))))

(declare-fun res!738645 () Bool)

(assert (=> b!1106752 (=> res!738645 e!631496)))

(assert (=> b!1106752 (= res!738645 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35084 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106752 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495332 () Unit!36141)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71786 (_ BitVec 64) (_ BitVec 32)) Unit!36141)

(assert (=> b!1106752 (= lt!495332 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106753 () Bool)

(declare-fun res!738650 () Bool)

(assert (=> b!1106753 (=> (not res!738650) (not e!631495))))

(assert (=> b!1106753 (= res!738650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106754 () Bool)

(assert (=> b!1106754 (= e!631498 tp_is_empty!27481)))

(declare-fun b!1106755 () Bool)

(assert (=> b!1106755 (= e!631500 (= call!46337 call!46336))))

(declare-fun b!1106756 () Bool)

(assert (=> b!1106756 (= e!631494 (and e!631497 mapRes!43039))))

(declare-fun condMapEmpty!43039 () Bool)

(declare-fun mapDefault!43039 () ValueCell!13031)

(assert (=> b!1106756 (= condMapEmpty!43039 (= (arr!34547 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13031)) mapDefault!43039)))))

(declare-fun b!1106757 () Bool)

(declare-fun res!738649 () Bool)

(assert (=> b!1106757 (=> (not res!738649) (not e!631495))))

(assert (=> b!1106757 (= res!738649 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35084 _keys!1208))))))

(assert (= (and start!97244 res!738642) b!1106743))

(assert (= (and b!1106743 res!738648) b!1106742))

(assert (= (and b!1106742 res!738646) b!1106753))

(assert (= (and b!1106753 res!738650) b!1106749))

(assert (= (and b!1106749 res!738643) b!1106757))

(assert (= (and b!1106757 res!738649) b!1106750))

(assert (= (and b!1106750 res!738644) b!1106745))

(assert (= (and b!1106745 res!738651) b!1106744))

(assert (= (and b!1106744 res!738647) b!1106747))

(assert (= (and b!1106747 res!738652) b!1106752))

(assert (= (and b!1106752 (not res!738645)) b!1106746))

(assert (= (and b!1106746 c!108972) b!1106751))

(assert (= (and b!1106746 (not c!108972)) b!1106755))

(assert (= (or b!1106751 b!1106755) bm!46333))

(assert (= (or b!1106751 b!1106755) bm!46334))

(assert (= (and b!1106756 condMapEmpty!43039) mapIsEmpty!43039))

(assert (= (and b!1106756 (not condMapEmpty!43039)) mapNonEmpty!43039))

(get-info :version)

(assert (= (and mapNonEmpty!43039 ((_ is ValueCellFull!13031) mapValue!43039)) b!1106754))

(assert (= (and b!1106756 ((_ is ValueCellFull!13031) mapDefault!43039)) b!1106748))

(assert (= start!97244 b!1106756))

(declare-fun b_lambda!18217 () Bool)

(assert (=> (not b_lambda!18217) (not bm!46333)))

(declare-fun t!34395 () Bool)

(declare-fun tb!8079 () Bool)

(assert (=> (and start!97244 (= defaultEntry!1004 defaultEntry!1004) t!34395) tb!8079))

(declare-fun result!16727 () Bool)

(assert (=> tb!8079 (= result!16727 tp_is_empty!27481)))

(assert (=> bm!46333 t!34395))

(declare-fun b_and!37249 () Bool)

(assert (= b_and!37247 (and (=> t!34395 result!16727) b_and!37249)))

(declare-fun m!1025175 () Bool)

(assert (=> b!1106745 m!1025175))

(declare-fun m!1025177 () Bool)

(assert (=> b!1106750 m!1025177))

(declare-fun m!1025179 () Bool)

(assert (=> b!1106744 m!1025179))

(declare-fun m!1025181 () Bool)

(assert (=> b!1106744 m!1025181))

(declare-fun m!1025183 () Bool)

(assert (=> b!1106752 m!1025183))

(declare-fun m!1025185 () Bool)

(assert (=> b!1106752 m!1025185))

(declare-fun m!1025187 () Bool)

(assert (=> b!1106753 m!1025187))

(declare-fun m!1025189 () Bool)

(assert (=> b!1106749 m!1025189))

(declare-fun m!1025191 () Bool)

(assert (=> bm!46333 m!1025191))

(declare-fun m!1025193 () Bool)

(assert (=> bm!46333 m!1025193))

(declare-fun m!1025195 () Bool)

(assert (=> bm!46333 m!1025195))

(declare-fun m!1025197 () Bool)

(assert (=> b!1106743 m!1025197))

(declare-fun m!1025199 () Bool)

(assert (=> start!97244 m!1025199))

(declare-fun m!1025201 () Bool)

(assert (=> start!97244 m!1025201))

(declare-fun m!1025203 () Bool)

(assert (=> mapNonEmpty!43039 m!1025203))

(declare-fun m!1025205 () Bool)

(assert (=> b!1106751 m!1025205))

(declare-fun m!1025207 () Bool)

(assert (=> b!1106746 m!1025207))

(declare-fun m!1025209 () Bool)

(assert (=> b!1106747 m!1025209))

(declare-fun m!1025211 () Bool)

(assert (=> bm!46334 m!1025211))

(check-sat (not mapNonEmpty!43039) (not b!1106752) (not b!1106746) b_and!37249 tp_is_empty!27481 (not b!1106753) (not bm!46333) (not b!1106744) (not start!97244) (not b_lambda!18217) (not b!1106747) (not b!1106749) (not b!1106743) (not b_next!23221) (not bm!46334) (not b!1106750) (not b!1106751))
(check-sat b_and!37249 (not b_next!23221))
