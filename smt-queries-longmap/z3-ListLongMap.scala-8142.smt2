; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99720 () Bool)

(assert start!99720)

(declare-fun b_free!25299 () Bool)

(declare-fun b_next!25299 () Bool)

(assert (=> start!99720 (= b_free!25299 (not b_next!25299))))

(declare-fun tp!88611 () Bool)

(declare-fun b_and!41465 () Bool)

(assert (=> start!99720 (= tp!88611 b_and!41465)))

(declare-fun b!1183555 () Bool)

(declare-datatypes ((Unit!39172 0))(
  ( (Unit!39173) )
))
(declare-fun e!672914 () Unit!39172)

(declare-fun Unit!39174 () Unit!39172)

(assert (=> b!1183555 (= e!672914 Unit!39174)))

(declare-datatypes ((array!76459 0))(
  ( (array!76460 (arr!36879 (Array (_ BitVec 32) (_ BitVec 64))) (size!37415 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76459)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!536288 () Unit!39172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76459 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39172)

(assert (=> b!1183555 (= lt!536288 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183555 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536279 () Unit!39172)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76459 (_ BitVec 32) (_ BitVec 32)) Unit!39172)

(assert (=> b!1183555 (= lt!536279 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25933 0))(
  ( (Nil!25930) (Cons!25929 (h!27138 (_ BitVec 64)) (t!38224 List!25933)) )
))
(declare-fun arrayNoDuplicates!0 (array!76459 (_ BitVec 32) List!25933) Bool)

(assert (=> b!1183555 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25930)))

(declare-fun lt!536292 () Unit!39172)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76459 (_ BitVec 64) (_ BitVec 32) List!25933) Unit!39172)

(assert (=> b!1183555 (= lt!536292 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25930))))

(assert (=> b!1183555 false))

(declare-fun mapNonEmpty!46571 () Bool)

(declare-fun mapRes!46571 () Bool)

(declare-fun tp!88610 () Bool)

(declare-fun e!672917 () Bool)

(assert (=> mapNonEmpty!46571 (= mapRes!46571 (and tp!88610 e!672917))))

(declare-datatypes ((V!44899 0))(
  ( (V!44900 (val!14971 Int)) )
))
(declare-datatypes ((ValueCell!14205 0))(
  ( (ValueCellFull!14205 (v!17609 V!44899)) (EmptyCell!14205) )
))
(declare-fun mapRest!46571 () (Array (_ BitVec 32) ValueCell!14205))

(declare-fun mapValue!46571 () ValueCell!14205)

(declare-fun mapKey!46571 () (_ BitVec 32))

(declare-datatypes ((array!76461 0))(
  ( (array!76462 (arr!36880 (Array (_ BitVec 32) ValueCell!14205)) (size!37416 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76461)

(assert (=> mapNonEmpty!46571 (= (arr!36880 _values!996) (store mapRest!46571 mapKey!46571 mapValue!46571))))

(declare-fun b!1183556 () Bool)

(declare-fun Unit!39175 () Unit!39172)

(assert (=> b!1183556 (= e!672914 Unit!39175)))

(declare-fun b!1183557 () Bool)

(declare-fun e!672922 () Bool)

(declare-fun e!672915 () Bool)

(assert (=> b!1183557 (= e!672922 (not e!672915))))

(declare-fun res!786637 () Bool)

(assert (=> b!1183557 (=> res!786637 e!672915)))

(assert (=> b!1183557 (= res!786637 (bvsgt from!1455 i!673))))

(assert (=> b!1183557 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536291 () Unit!39172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76459 (_ BitVec 64) (_ BitVec 32)) Unit!39172)

(assert (=> b!1183557 (= lt!536291 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183558 () Bool)

(declare-fun e!672918 () Bool)

(assert (=> b!1183558 (= e!672918 true)))

(declare-datatypes ((tuple2!19194 0))(
  ( (tuple2!19195 (_1!9608 (_ BitVec 64)) (_2!9608 V!44899)) )
))
(declare-datatypes ((List!25934 0))(
  ( (Nil!25931) (Cons!25930 (h!27139 tuple2!19194) (t!38225 List!25934)) )
))
(declare-datatypes ((ListLongMap!17163 0))(
  ( (ListLongMap!17164 (toList!8597 List!25934)) )
))
(declare-fun lt!536280 () ListLongMap!17163)

(declare-fun lt!536289 () ListLongMap!17163)

(declare-fun -!1632 (ListLongMap!17163 (_ BitVec 64)) ListLongMap!17163)

(assert (=> b!1183558 (= (-!1632 lt!536280 k0!934) lt!536289)))

(declare-fun lt!536283 () V!44899)

(declare-fun lt!536281 () ListLongMap!17163)

(declare-fun lt!536290 () Unit!39172)

(declare-fun addRemoveCommutativeForDiffKeys!158 (ListLongMap!17163 (_ BitVec 64) V!44899 (_ BitVec 64)) Unit!39172)

(assert (=> b!1183558 (= lt!536290 (addRemoveCommutativeForDiffKeys!158 lt!536281 (select (arr!36879 _keys!1208) from!1455) lt!536283 k0!934))))

(declare-fun lt!536286 () ListLongMap!17163)

(declare-fun lt!536285 () ListLongMap!17163)

(declare-fun lt!536284 () ListLongMap!17163)

(assert (=> b!1183558 (and (= lt!536285 lt!536280) (= lt!536284 lt!536286))))

(declare-fun lt!536275 () tuple2!19194)

(declare-fun +!3895 (ListLongMap!17163 tuple2!19194) ListLongMap!17163)

(assert (=> b!1183558 (= lt!536280 (+!3895 lt!536281 lt!536275))))

(assert (=> b!1183558 (not (= (select (arr!36879 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536276 () Unit!39172)

(assert (=> b!1183558 (= lt!536276 e!672914)))

(declare-fun c!117072 () Bool)

(assert (=> b!1183558 (= c!117072 (= (select (arr!36879 _keys!1208) from!1455) k0!934))))

(declare-fun e!672921 () Bool)

(assert (=> b!1183558 e!672921))

(declare-fun res!786638 () Bool)

(assert (=> b!1183558 (=> (not res!786638) (not e!672921))))

(declare-fun lt!536287 () ListLongMap!17163)

(assert (=> b!1183558 (= res!786638 (= lt!536287 lt!536289))))

(assert (=> b!1183558 (= lt!536289 (+!3895 lt!536284 lt!536275))))

(assert (=> b!1183558 (= lt!536275 (tuple2!19195 (select (arr!36879 _keys!1208) from!1455) lt!536283))))

(declare-fun lt!536274 () V!44899)

(declare-fun get!18868 (ValueCell!14205 V!44899) V!44899)

(assert (=> b!1183558 (= lt!536283 (get!18868 (select (arr!36880 _values!996) from!1455) lt!536274))))

(declare-fun b!1183559 () Bool)

(declare-fun res!786631 () Bool)

(declare-fun e!672911 () Bool)

(assert (=> b!1183559 (=> (not res!786631) (not e!672911))))

(assert (=> b!1183559 (= res!786631 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37415 _keys!1208))))))

(declare-fun b!1183560 () Bool)

(declare-fun res!786636 () Bool)

(assert (=> b!1183560 (=> (not res!786636) (not e!672911))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76459 (_ BitVec 32)) Bool)

(assert (=> b!1183560 (= res!786636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183561 () Bool)

(declare-fun res!786630 () Bool)

(assert (=> b!1183561 (=> (not res!786630) (not e!672911))))

(assert (=> b!1183561 (= res!786630 (= (select (arr!36879 _keys!1208) i!673) k0!934))))

(declare-fun b!1183562 () Bool)

(declare-fun res!786643 () Bool)

(assert (=> b!1183562 (=> (not res!786643) (not e!672911))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1183562 (= res!786643 (and (= (size!37416 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37415 _keys!1208) (size!37416 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183563 () Bool)

(declare-fun res!786633 () Bool)

(assert (=> b!1183563 (=> (not res!786633) (not e!672922))))

(declare-fun lt!536277 () array!76459)

(assert (=> b!1183563 (= res!786633 (arrayNoDuplicates!0 lt!536277 #b00000000000000000000000000000000 Nil!25930))))

(declare-fun b!1183564 () Bool)

(declare-fun tp_is_empty!29829 () Bool)

(assert (=> b!1183564 (= e!672917 tp_is_empty!29829)))

(declare-fun b!1183565 () Bool)

(declare-fun res!786641 () Bool)

(assert (=> b!1183565 (=> (not res!786641) (not e!672911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183565 (= res!786641 (validKeyInArray!0 k0!934))))

(declare-fun b!1183566 () Bool)

(declare-fun e!672912 () Bool)

(assert (=> b!1183566 (= e!672912 e!672918)))

(declare-fun res!786635 () Bool)

(assert (=> b!1183566 (=> res!786635 e!672918)))

(assert (=> b!1183566 (= res!786635 (not (validKeyInArray!0 (select (arr!36879 _keys!1208) from!1455))))))

(assert (=> b!1183566 (= lt!536286 lt!536284)))

(assert (=> b!1183566 (= lt!536284 (-!1632 lt!536281 k0!934))))

(declare-fun zeroValue!944 () V!44899)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!536282 () array!76461)

(declare-fun minValue!944 () V!44899)

(declare-fun getCurrentListMapNoExtraKeys!5047 (array!76459 array!76461 (_ BitVec 32) (_ BitVec 32) V!44899 V!44899 (_ BitVec 32) Int) ListLongMap!17163)

(assert (=> b!1183566 (= lt!536286 (getCurrentListMapNoExtraKeys!5047 lt!536277 lt!536282 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183566 (= lt!536281 (getCurrentListMapNoExtraKeys!5047 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536278 () Unit!39172)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!853 (array!76459 array!76461 (_ BitVec 32) (_ BitVec 32) V!44899 V!44899 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39172)

(assert (=> b!1183566 (= lt!536278 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!853 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46571 () Bool)

(assert (=> mapIsEmpty!46571 mapRes!46571))

(declare-fun e!672919 () Bool)

(declare-fun b!1183567 () Bool)

(assert (=> b!1183567 (= e!672919 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183568 () Bool)

(assert (=> b!1183568 (= e!672915 e!672912)))

(declare-fun res!786639 () Bool)

(assert (=> b!1183568 (=> res!786639 e!672912)))

(assert (=> b!1183568 (= res!786639 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1183568 (= lt!536287 (getCurrentListMapNoExtraKeys!5047 lt!536277 lt!536282 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183568 (= lt!536282 (array!76462 (store (arr!36880 _values!996) i!673 (ValueCellFull!14205 lt!536274)) (size!37416 _values!996)))))

(declare-fun dynLambda!2998 (Int (_ BitVec 64)) V!44899)

(assert (=> b!1183568 (= lt!536274 (dynLambda!2998 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183568 (= lt!536285 (getCurrentListMapNoExtraKeys!5047 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183569 () Bool)

(declare-fun res!786640 () Bool)

(assert (=> b!1183569 (=> (not res!786640) (not e!672911))))

(assert (=> b!1183569 (= res!786640 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25930))))

(declare-fun b!1183570 () Bool)

(declare-fun e!672913 () Bool)

(declare-fun e!672920 () Bool)

(assert (=> b!1183570 (= e!672913 (and e!672920 mapRes!46571))))

(declare-fun condMapEmpty!46571 () Bool)

(declare-fun mapDefault!46571 () ValueCell!14205)

(assert (=> b!1183570 (= condMapEmpty!46571 (= (arr!36880 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14205)) mapDefault!46571)))))

(declare-fun b!1183571 () Bool)

(assert (=> b!1183571 (= e!672921 e!672919)))

(declare-fun res!786632 () Bool)

(assert (=> b!1183571 (=> res!786632 e!672919)))

(assert (=> b!1183571 (= res!786632 (not (= (select (arr!36879 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183572 () Bool)

(assert (=> b!1183572 (= e!672920 tp_is_empty!29829)))

(declare-fun res!786629 () Bool)

(assert (=> start!99720 (=> (not res!786629) (not e!672911))))

(assert (=> start!99720 (= res!786629 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37415 _keys!1208))))))

(assert (=> start!99720 e!672911))

(assert (=> start!99720 tp_is_empty!29829))

(declare-fun array_inv!28150 (array!76459) Bool)

(assert (=> start!99720 (array_inv!28150 _keys!1208)))

(assert (=> start!99720 true))

(assert (=> start!99720 tp!88611))

(declare-fun array_inv!28151 (array!76461) Bool)

(assert (=> start!99720 (and (array_inv!28151 _values!996) e!672913)))

(declare-fun b!1183573 () Bool)

(assert (=> b!1183573 (= e!672911 e!672922)))

(declare-fun res!786642 () Bool)

(assert (=> b!1183573 (=> (not res!786642) (not e!672922))))

(assert (=> b!1183573 (= res!786642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536277 mask!1564))))

(assert (=> b!1183573 (= lt!536277 (array!76460 (store (arr!36879 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37415 _keys!1208)))))

(declare-fun b!1183574 () Bool)

(declare-fun res!786634 () Bool)

(assert (=> b!1183574 (=> (not res!786634) (not e!672911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183574 (= res!786634 (validMask!0 mask!1564))))

(assert (= (and start!99720 res!786629) b!1183574))

(assert (= (and b!1183574 res!786634) b!1183562))

(assert (= (and b!1183562 res!786643) b!1183560))

(assert (= (and b!1183560 res!786636) b!1183569))

(assert (= (and b!1183569 res!786640) b!1183559))

(assert (= (and b!1183559 res!786631) b!1183565))

(assert (= (and b!1183565 res!786641) b!1183561))

(assert (= (and b!1183561 res!786630) b!1183573))

(assert (= (and b!1183573 res!786642) b!1183563))

(assert (= (and b!1183563 res!786633) b!1183557))

(assert (= (and b!1183557 (not res!786637)) b!1183568))

(assert (= (and b!1183568 (not res!786639)) b!1183566))

(assert (= (and b!1183566 (not res!786635)) b!1183558))

(assert (= (and b!1183558 res!786638) b!1183571))

(assert (= (and b!1183571 (not res!786632)) b!1183567))

(assert (= (and b!1183558 c!117072) b!1183555))

(assert (= (and b!1183558 (not c!117072)) b!1183556))

(assert (= (and b!1183570 condMapEmpty!46571) mapIsEmpty!46571))

(assert (= (and b!1183570 (not condMapEmpty!46571)) mapNonEmpty!46571))

(get-info :version)

(assert (= (and mapNonEmpty!46571 ((_ is ValueCellFull!14205) mapValue!46571)) b!1183564))

(assert (= (and b!1183570 ((_ is ValueCellFull!14205) mapDefault!46571)) b!1183572))

(assert (= start!99720 b!1183570))

(declare-fun b_lambda!20443 () Bool)

(assert (=> (not b_lambda!20443) (not b!1183568)))

(declare-fun t!38223 () Bool)

(declare-fun tb!10111 () Bool)

(assert (=> (and start!99720 (= defaultEntry!1004 defaultEntry!1004) t!38223) tb!10111))

(declare-fun result!20789 () Bool)

(assert (=> tb!10111 (= result!20789 tp_is_empty!29829)))

(assert (=> b!1183568 t!38223))

(declare-fun b_and!41467 () Bool)

(assert (= b_and!41465 (and (=> t!38223 result!20789) b_and!41467)))

(declare-fun m!1091725 () Bool)

(assert (=> b!1183563 m!1091725))

(declare-fun m!1091727 () Bool)

(assert (=> b!1183565 m!1091727))

(declare-fun m!1091729 () Bool)

(assert (=> b!1183560 m!1091729))

(declare-fun m!1091731 () Bool)

(assert (=> start!99720 m!1091731))

(declare-fun m!1091733 () Bool)

(assert (=> start!99720 m!1091733))

(declare-fun m!1091735 () Bool)

(assert (=> b!1183566 m!1091735))

(declare-fun m!1091737 () Bool)

(assert (=> b!1183566 m!1091737))

(declare-fun m!1091739 () Bool)

(assert (=> b!1183566 m!1091739))

(declare-fun m!1091741 () Bool)

(assert (=> b!1183566 m!1091741))

(declare-fun m!1091743 () Bool)

(assert (=> b!1183566 m!1091743))

(declare-fun m!1091745 () Bool)

(assert (=> b!1183566 m!1091745))

(assert (=> b!1183566 m!1091743))

(declare-fun m!1091747 () Bool)

(assert (=> b!1183555 m!1091747))

(declare-fun m!1091749 () Bool)

(assert (=> b!1183555 m!1091749))

(declare-fun m!1091751 () Bool)

(assert (=> b!1183555 m!1091751))

(declare-fun m!1091753 () Bool)

(assert (=> b!1183555 m!1091753))

(declare-fun m!1091755 () Bool)

(assert (=> b!1183555 m!1091755))

(assert (=> b!1183571 m!1091743))

(declare-fun m!1091757 () Bool)

(assert (=> b!1183557 m!1091757))

(declare-fun m!1091759 () Bool)

(assert (=> b!1183557 m!1091759))

(declare-fun m!1091761 () Bool)

(assert (=> b!1183569 m!1091761))

(declare-fun m!1091763 () Bool)

(assert (=> b!1183558 m!1091763))

(declare-fun m!1091765 () Bool)

(assert (=> b!1183558 m!1091765))

(assert (=> b!1183558 m!1091763))

(declare-fun m!1091767 () Bool)

(assert (=> b!1183558 m!1091767))

(declare-fun m!1091769 () Bool)

(assert (=> b!1183558 m!1091769))

(declare-fun m!1091771 () Bool)

(assert (=> b!1183558 m!1091771))

(assert (=> b!1183558 m!1091743))

(assert (=> b!1183558 m!1091743))

(declare-fun m!1091773 () Bool)

(assert (=> b!1183558 m!1091773))

(declare-fun m!1091775 () Bool)

(assert (=> mapNonEmpty!46571 m!1091775))

(declare-fun m!1091777 () Bool)

(assert (=> b!1183574 m!1091777))

(declare-fun m!1091779 () Bool)

(assert (=> b!1183561 m!1091779))

(declare-fun m!1091781 () Bool)

(assert (=> b!1183573 m!1091781))

(declare-fun m!1091783 () Bool)

(assert (=> b!1183573 m!1091783))

(declare-fun m!1091785 () Bool)

(assert (=> b!1183567 m!1091785))

(declare-fun m!1091787 () Bool)

(assert (=> b!1183568 m!1091787))

(declare-fun m!1091789 () Bool)

(assert (=> b!1183568 m!1091789))

(declare-fun m!1091791 () Bool)

(assert (=> b!1183568 m!1091791))

(declare-fun m!1091793 () Bool)

(assert (=> b!1183568 m!1091793))

(check-sat (not start!99720) (not mapNonEmpty!46571) b_and!41467 (not b!1183574) (not b!1183563) (not b_next!25299) (not b!1183573) (not b!1183569) (not b!1183555) (not b!1183568) (not b!1183567) (not b!1183566) (not b_lambda!20443) (not b!1183565) tp_is_empty!29829 (not b!1183558) (not b!1183557) (not b!1183560))
(check-sat b_and!41467 (not b_next!25299))
