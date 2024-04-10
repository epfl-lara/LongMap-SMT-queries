; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97402 () Bool)

(assert start!97402)

(declare-fun b_free!23373 () Bool)

(declare-fun b_next!23373 () Bool)

(assert (=> start!97402 (= b_free!23373 (not b_next!23373))))

(declare-fun tp!82418 () Bool)

(declare-fun b_and!37581 () Bool)

(assert (=> start!97402 (= tp!82418 b_and!37581)))

(declare-datatypes ((V!41971 0))(
  ( (V!41972 (val!13873 Int)) )
))
(declare-fun zeroValue!944 () V!41971)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!72183 0))(
  ( (array!72184 (arr!34744 (Array (_ BitVec 32) (_ BitVec 64))) (size!35280 (_ BitVec 32))) )
))
(declare-fun lt!496216 () array!72183)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46812 () Bool)

(declare-datatypes ((ValueCell!13107 0))(
  ( (ValueCellFull!13107 (v!16506 V!41971)) (EmptyCell!13107) )
))
(declare-datatypes ((array!72185 0))(
  ( (array!72186 (arr!34745 (Array (_ BitVec 32) ValueCell!13107)) (size!35281 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72185)

(declare-datatypes ((tuple2!17548 0))(
  ( (tuple2!17549 (_1!8785 (_ BitVec 64)) (_2!8785 V!41971)) )
))
(declare-datatypes ((List!24232 0))(
  ( (Nil!24229) (Cons!24228 (h!25437 tuple2!17548) (t!34651 List!24232)) )
))
(declare-datatypes ((ListLongMap!15517 0))(
  ( (ListLongMap!15518 (toList!7774 List!24232)) )
))
(declare-fun call!46816 () ListLongMap!15517)

(declare-fun minValue!944 () V!41971)

(declare-fun getCurrentListMapNoExtraKeys!4267 (array!72183 array!72185 (_ BitVec 32) (_ BitVec 32) V!41971 V!41971 (_ BitVec 32) Int) ListLongMap!15517)

(declare-fun dynLambda!2395 (Int (_ BitVec 64)) V!41971)

(assert (=> bm!46812 (= call!46816 (getCurrentListMapNoExtraKeys!4267 lt!496216 (array!72186 (store (arr!34745 _values!996) i!673 (ValueCellFull!13107 (dynLambda!2395 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35281 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _keys!1208 () array!72183)

(declare-fun bm!46813 () Bool)

(declare-fun call!46815 () ListLongMap!15517)

(assert (=> bm!46813 (= call!46815 (getCurrentListMapNoExtraKeys!4267 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110719 () Bool)

(declare-fun e!633428 () Bool)

(declare-fun tp_is_empty!27633 () Bool)

(assert (=> b!1110719 (= e!633428 tp_is_empty!27633)))

(declare-fun b!1110720 () Bool)

(declare-fun res!741227 () Bool)

(declare-fun e!633423 () Bool)

(assert (=> b!1110720 (=> (not res!741227) (not e!633423))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1110720 (= res!741227 (= (select (arr!34744 _keys!1208) i!673) k0!934))))

(declare-fun b!1110721 () Bool)

(declare-fun e!633425 () Bool)

(assert (=> b!1110721 (= e!633425 (= call!46816 call!46815))))

(declare-fun b!1110722 () Bool)

(declare-fun res!741226 () Bool)

(assert (=> b!1110722 (=> (not res!741226) (not e!633423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72183 (_ BitVec 32)) Bool)

(assert (=> b!1110722 (= res!741226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110723 () Bool)

(declare-fun e!633422 () Bool)

(assert (=> b!1110723 (= e!633423 e!633422)))

(declare-fun res!741222 () Bool)

(assert (=> b!1110723 (=> (not res!741222) (not e!633422))))

(assert (=> b!1110723 (= res!741222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496216 mask!1564))))

(assert (=> b!1110723 (= lt!496216 (array!72184 (store (arr!34744 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35280 _keys!1208)))))

(declare-fun b!1110725 () Bool)

(declare-fun res!741221 () Bool)

(assert (=> b!1110725 (=> (not res!741221) (not e!633422))))

(declare-datatypes ((List!24233 0))(
  ( (Nil!24230) (Cons!24229 (h!25438 (_ BitVec 64)) (t!34652 List!24233)) )
))
(declare-fun arrayNoDuplicates!0 (array!72183 (_ BitVec 32) List!24233) Bool)

(assert (=> b!1110725 (= res!741221 (arrayNoDuplicates!0 lt!496216 #b00000000000000000000000000000000 Nil!24230))))

(declare-fun b!1110726 () Bool)

(declare-fun res!741223 () Bool)

(assert (=> b!1110726 (=> (not res!741223) (not e!633423))))

(assert (=> b!1110726 (= res!741223 (and (= (size!35281 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35280 _keys!1208) (size!35281 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110727 () Bool)

(declare-fun e!633426 () Bool)

(declare-fun e!633427 () Bool)

(declare-fun mapRes!43267 () Bool)

(assert (=> b!1110727 (= e!633426 (and e!633427 mapRes!43267))))

(declare-fun condMapEmpty!43267 () Bool)

(declare-fun mapDefault!43267 () ValueCell!13107)

(assert (=> b!1110727 (= condMapEmpty!43267 (= (arr!34745 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13107)) mapDefault!43267)))))

(declare-fun b!1110728 () Bool)

(declare-fun res!741229 () Bool)

(assert (=> b!1110728 (=> (not res!741229) (not e!633423))))

(assert (=> b!1110728 (= res!741229 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35280 _keys!1208))))))

(declare-fun b!1110729 () Bool)

(assert (=> b!1110729 (= e!633427 tp_is_empty!27633)))

(declare-fun b!1110730 () Bool)

(declare-fun res!741224 () Bool)

(assert (=> b!1110730 (=> (not res!741224) (not e!633423))))

(assert (=> b!1110730 (= res!741224 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24230))))

(declare-fun b!1110731 () Bool)

(declare-fun -!1045 (ListLongMap!15517 (_ BitVec 64)) ListLongMap!15517)

(assert (=> b!1110731 (= e!633425 (= call!46816 (-!1045 call!46815 k0!934)))))

(declare-fun b!1110732 () Bool)

(declare-fun res!741228 () Bool)

(assert (=> b!1110732 (=> (not res!741228) (not e!633423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110732 (= res!741228 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43267 () Bool)

(assert (=> mapIsEmpty!43267 mapRes!43267))

(declare-fun b!1110733 () Bool)

(declare-fun e!633424 () Bool)

(assert (=> b!1110733 (= e!633422 (not e!633424))))

(declare-fun res!741225 () Bool)

(assert (=> b!1110733 (=> res!741225 e!633424)))

(assert (=> b!1110733 (= res!741225 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35280 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110733 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36450 0))(
  ( (Unit!36451) )
))
(declare-fun lt!496215 () Unit!36450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72183 (_ BitVec 64) (_ BitVec 32)) Unit!36450)

(assert (=> b!1110733 (= lt!496215 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110734 () Bool)

(declare-fun res!741219 () Bool)

(assert (=> b!1110734 (=> (not res!741219) (not e!633423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110734 (= res!741219 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43267 () Bool)

(declare-fun tp!82417 () Bool)

(assert (=> mapNonEmpty!43267 (= mapRes!43267 (and tp!82417 e!633428))))

(declare-fun mapRest!43267 () (Array (_ BitVec 32) ValueCell!13107))

(declare-fun mapValue!43267 () ValueCell!13107)

(declare-fun mapKey!43267 () (_ BitVec 32))

(assert (=> mapNonEmpty!43267 (= (arr!34745 _values!996) (store mapRest!43267 mapKey!43267 mapValue!43267))))

(declare-fun b!1110724 () Bool)

(assert (=> b!1110724 (= e!633424 true)))

(assert (=> b!1110724 e!633425))

(declare-fun c!109251 () Bool)

(assert (=> b!1110724 (= c!109251 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496217 () Unit!36450)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!294 (array!72183 array!72185 (_ BitVec 32) (_ BitVec 32) V!41971 V!41971 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36450)

(assert (=> b!1110724 (= lt!496217 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!294 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!741220 () Bool)

(assert (=> start!97402 (=> (not res!741220) (not e!633423))))

(assert (=> start!97402 (= res!741220 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35280 _keys!1208))))))

(assert (=> start!97402 e!633423))

(assert (=> start!97402 tp_is_empty!27633))

(declare-fun array_inv!26728 (array!72183) Bool)

(assert (=> start!97402 (array_inv!26728 _keys!1208)))

(assert (=> start!97402 true))

(assert (=> start!97402 tp!82418))

(declare-fun array_inv!26729 (array!72185) Bool)

(assert (=> start!97402 (and (array_inv!26729 _values!996) e!633426)))

(assert (= (and start!97402 res!741220) b!1110732))

(assert (= (and b!1110732 res!741228) b!1110726))

(assert (= (and b!1110726 res!741223) b!1110722))

(assert (= (and b!1110722 res!741226) b!1110730))

(assert (= (and b!1110730 res!741224) b!1110728))

(assert (= (and b!1110728 res!741229) b!1110734))

(assert (= (and b!1110734 res!741219) b!1110720))

(assert (= (and b!1110720 res!741227) b!1110723))

(assert (= (and b!1110723 res!741222) b!1110725))

(assert (= (and b!1110725 res!741221) b!1110733))

(assert (= (and b!1110733 (not res!741225)) b!1110724))

(assert (= (and b!1110724 c!109251) b!1110731))

(assert (= (and b!1110724 (not c!109251)) b!1110721))

(assert (= (or b!1110731 b!1110721) bm!46812))

(assert (= (or b!1110731 b!1110721) bm!46813))

(assert (= (and b!1110727 condMapEmpty!43267) mapIsEmpty!43267))

(assert (= (and b!1110727 (not condMapEmpty!43267)) mapNonEmpty!43267))

(get-info :version)

(assert (= (and mapNonEmpty!43267 ((_ is ValueCellFull!13107) mapValue!43267)) b!1110719))

(assert (= (and b!1110727 ((_ is ValueCellFull!13107) mapDefault!43267)) b!1110729))

(assert (= start!97402 b!1110727))

(declare-fun b_lambda!18395 () Bool)

(assert (=> (not b_lambda!18395) (not bm!46812)))

(declare-fun t!34650 () Bool)

(declare-fun tb!8239 () Bool)

(assert (=> (and start!97402 (= defaultEntry!1004 defaultEntry!1004) t!34650) tb!8239))

(declare-fun result!17039 () Bool)

(assert (=> tb!8239 (= result!17039 tp_is_empty!27633)))

(assert (=> bm!46812 t!34650))

(declare-fun b_and!37583 () Bool)

(assert (= b_and!37581 (and (=> t!34650 result!17039) b_and!37583)))

(declare-fun m!1028689 () Bool)

(assert (=> start!97402 m!1028689))

(declare-fun m!1028691 () Bool)

(assert (=> start!97402 m!1028691))

(declare-fun m!1028693 () Bool)

(assert (=> b!1110730 m!1028693))

(declare-fun m!1028695 () Bool)

(assert (=> b!1110725 m!1028695))

(declare-fun m!1028697 () Bool)

(assert (=> bm!46813 m!1028697))

(declare-fun m!1028699 () Bool)

(assert (=> b!1110733 m!1028699))

(declare-fun m!1028701 () Bool)

(assert (=> b!1110733 m!1028701))

(declare-fun m!1028703 () Bool)

(assert (=> b!1110731 m!1028703))

(declare-fun m!1028705 () Bool)

(assert (=> b!1110732 m!1028705))

(declare-fun m!1028707 () Bool)

(assert (=> bm!46812 m!1028707))

(declare-fun m!1028709 () Bool)

(assert (=> bm!46812 m!1028709))

(declare-fun m!1028711 () Bool)

(assert (=> bm!46812 m!1028711))

(declare-fun m!1028713 () Bool)

(assert (=> b!1110723 m!1028713))

(declare-fun m!1028715 () Bool)

(assert (=> b!1110723 m!1028715))

(declare-fun m!1028717 () Bool)

(assert (=> b!1110734 m!1028717))

(declare-fun m!1028719 () Bool)

(assert (=> b!1110720 m!1028719))

(declare-fun m!1028721 () Bool)

(assert (=> b!1110722 m!1028721))

(declare-fun m!1028723 () Bool)

(assert (=> b!1110724 m!1028723))

(declare-fun m!1028725 () Bool)

(assert (=> mapNonEmpty!43267 m!1028725))

(check-sat (not b!1110723) (not b_lambda!18395) (not b!1110732) (not b!1110734) (not b!1110733) b_and!37583 (not bm!46813) (not bm!46812) (not mapNonEmpty!43267) (not b!1110725) (not b!1110724) (not b!1110731) (not b!1110722) tp_is_empty!27633 (not start!97402) (not b!1110730) (not b_next!23373))
(check-sat b_and!37583 (not b_next!23373))
