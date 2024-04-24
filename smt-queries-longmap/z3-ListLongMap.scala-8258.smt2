; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100732 () Bool)

(assert start!100732)

(declare-fun b_free!25819 () Bool)

(declare-fun b_next!25819 () Bool)

(assert (=> start!100732 (= b_free!25819 (not b_next!25819))))

(declare-fun tp!90447 () Bool)

(declare-fun b_and!42527 () Bool)

(assert (=> start!100732 (= tp!90447 b_and!42527)))

(declare-fun b!1201715 () Bool)

(declare-fun e!682556 () Bool)

(declare-fun e!682548 () Bool)

(assert (=> b!1201715 (= e!682556 e!682548)))

(declare-fun res!799606 () Bool)

(assert (=> b!1201715 (=> (not res!799606) (not e!682548))))

(declare-datatypes ((array!77857 0))(
  ( (array!77858 (arr!37567 (Array (_ BitVec 32) (_ BitVec 64))) (size!38104 (_ BitVec 32))) )
))
(declare-fun lt!544529 () array!77857)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77857 (_ BitVec 32)) Bool)

(assert (=> b!1201715 (= res!799606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544529 mask!1564))))

(declare-fun _keys!1208 () array!77857)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201715 (= lt!544529 (array!77858 (store (arr!37567 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38104 _keys!1208)))))

(declare-fun b!1201716 () Bool)

(declare-fun e!682552 () Bool)

(declare-fun tp_is_empty!30523 () Bool)

(assert (=> b!1201716 (= e!682552 tp_is_empty!30523)))

(declare-datatypes ((V!45825 0))(
  ( (V!45826 (val!15318 Int)) )
))
(declare-fun zeroValue!944 () V!45825)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!57348 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14552 0))(
  ( (ValueCellFull!14552 (v!17952 V!45825)) (EmptyCell!14552) )
))
(declare-datatypes ((array!77859 0))(
  ( (array!77860 (arr!37568 (Array (_ BitVec 32) ValueCell!14552)) (size!38105 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77859)

(declare-fun minValue!944 () V!45825)

(declare-datatypes ((tuple2!19626 0))(
  ( (tuple2!19627 (_1!9824 (_ BitVec 64)) (_2!9824 V!45825)) )
))
(declare-datatypes ((List!26442 0))(
  ( (Nil!26439) (Cons!26438 (h!27656 tuple2!19626) (t!39233 List!26442)) )
))
(declare-datatypes ((ListLongMap!17603 0))(
  ( (ListLongMap!17604 (toList!8817 List!26442)) )
))
(declare-fun call!57351 () ListLongMap!17603)

(declare-fun getCurrentListMapNoExtraKeys!5284 (array!77857 array!77859 (_ BitVec 32) (_ BitVec 32) V!45825 V!45825 (_ BitVec 32) Int) ListLongMap!17603)

(assert (=> bm!57348 (= call!57351 (getCurrentListMapNoExtraKeys!5284 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201718 () Bool)

(declare-fun res!799602 () Bool)

(assert (=> b!1201718 (=> (not res!799602) (not e!682556))))

(assert (=> b!1201718 (= res!799602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201719 () Bool)

(declare-fun e!682550 () Bool)

(declare-fun e!682551 () Bool)

(assert (=> b!1201719 (= e!682550 e!682551)))

(declare-fun res!799612 () Bool)

(assert (=> b!1201719 (=> res!799612 e!682551)))

(assert (=> b!1201719 (= res!799612 (not (= from!1455 i!673)))))

(declare-fun lt!544524 () ListLongMap!17603)

(declare-fun lt!544525 () array!77859)

(assert (=> b!1201719 (= lt!544524 (getCurrentListMapNoExtraKeys!5284 lt!544529 lt!544525 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3228 (Int (_ BitVec 64)) V!45825)

(assert (=> b!1201719 (= lt!544525 (array!77860 (store (arr!37568 _values!996) i!673 (ValueCellFull!14552 (dynLambda!3228 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38105 _values!996)))))

(declare-fun lt!544528 () ListLongMap!17603)

(assert (=> b!1201719 (= lt!544528 (getCurrentListMapNoExtraKeys!5284 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201720 () Bool)

(declare-fun res!799601 () Bool)

(assert (=> b!1201720 (=> (not res!799601) (not e!682556))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201720 (= res!799601 (validKeyInArray!0 k0!934))))

(declare-fun b!1201721 () Bool)

(assert (=> b!1201721 (= e!682548 (not e!682550))))

(declare-fun res!799608 () Bool)

(assert (=> b!1201721 (=> res!799608 e!682550)))

(assert (=> b!1201721 (= res!799608 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201721 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39763 0))(
  ( (Unit!39764) )
))
(declare-fun lt!544526 () Unit!39763)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77857 (_ BitVec 64) (_ BitVec 32)) Unit!39763)

(assert (=> b!1201721 (= lt!544526 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201722 () Bool)

(declare-fun res!799603 () Bool)

(assert (=> b!1201722 (=> (not res!799603) (not e!682556))))

(assert (=> b!1201722 (= res!799603 (and (= (size!38105 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38104 _keys!1208) (size!38105 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201723 () Bool)

(declare-fun res!799611 () Bool)

(assert (=> b!1201723 (=> (not res!799611) (not e!682556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201723 (= res!799611 (validMask!0 mask!1564))))

(declare-fun res!799609 () Bool)

(assert (=> start!100732 (=> (not res!799609) (not e!682556))))

(assert (=> start!100732 (= res!799609 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38104 _keys!1208))))))

(assert (=> start!100732 e!682556))

(assert (=> start!100732 tp_is_empty!30523))

(declare-fun array_inv!28696 (array!77857) Bool)

(assert (=> start!100732 (array_inv!28696 _keys!1208)))

(assert (=> start!100732 true))

(assert (=> start!100732 tp!90447))

(declare-fun e!682549 () Bool)

(declare-fun array_inv!28697 (array!77859) Bool)

(assert (=> start!100732 (and (array_inv!28697 _values!996) e!682549)))

(declare-fun b!1201717 () Bool)

(declare-fun res!799604 () Bool)

(assert (=> b!1201717 (=> (not res!799604) (not e!682556))))

(assert (=> b!1201717 (= res!799604 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38104 _keys!1208))))))

(declare-fun b!1201724 () Bool)

(assert (=> b!1201724 (= e!682551 (bvslt from!1455 (size!38104 _keys!1208)))))

(declare-fun e!682553 () Bool)

(assert (=> b!1201724 e!682553))

(declare-fun c!117838 () Bool)

(assert (=> b!1201724 (= c!117838 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544527 () Unit!39763)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!997 (array!77857 array!77859 (_ BitVec 32) (_ BitVec 32) V!45825 V!45825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39763)

(assert (=> b!1201724 (= lt!544527 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!997 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201725 () Bool)

(declare-fun call!57352 () ListLongMap!17603)

(assert (=> b!1201725 (= e!682553 (= call!57352 call!57351))))

(declare-fun b!1201726 () Bool)

(declare-fun res!799605 () Bool)

(assert (=> b!1201726 (=> (not res!799605) (not e!682556))))

(assert (=> b!1201726 (= res!799605 (= (select (arr!37567 _keys!1208) i!673) k0!934))))

(declare-fun b!1201727 () Bool)

(declare-fun res!799607 () Bool)

(assert (=> b!1201727 (=> (not res!799607) (not e!682556))))

(declare-datatypes ((List!26443 0))(
  ( (Nil!26440) (Cons!26439 (h!27657 (_ BitVec 64)) (t!39234 List!26443)) )
))
(declare-fun arrayNoDuplicates!0 (array!77857 (_ BitVec 32) List!26443) Bool)

(assert (=> b!1201727 (= res!799607 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26440))))

(declare-fun b!1201728 () Bool)

(declare-fun e!682555 () Bool)

(declare-fun mapRes!47627 () Bool)

(assert (=> b!1201728 (= e!682549 (and e!682555 mapRes!47627))))

(declare-fun condMapEmpty!47627 () Bool)

(declare-fun mapDefault!47627 () ValueCell!14552)

(assert (=> b!1201728 (= condMapEmpty!47627 (= (arr!37568 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14552)) mapDefault!47627)))))

(declare-fun b!1201729 () Bool)

(assert (=> b!1201729 (= e!682555 tp_is_empty!30523)))

(declare-fun bm!57349 () Bool)

(assert (=> bm!57349 (= call!57352 (getCurrentListMapNoExtraKeys!5284 lt!544529 lt!544525 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47627 () Bool)

(declare-fun tp!90446 () Bool)

(assert (=> mapNonEmpty!47627 (= mapRes!47627 (and tp!90446 e!682552))))

(declare-fun mapKey!47627 () (_ BitVec 32))

(declare-fun mapValue!47627 () ValueCell!14552)

(declare-fun mapRest!47627 () (Array (_ BitVec 32) ValueCell!14552))

(assert (=> mapNonEmpty!47627 (= (arr!37568 _values!996) (store mapRest!47627 mapKey!47627 mapValue!47627))))

(declare-fun b!1201730 () Bool)

(declare-fun res!799610 () Bool)

(assert (=> b!1201730 (=> (not res!799610) (not e!682548))))

(assert (=> b!1201730 (= res!799610 (arrayNoDuplicates!0 lt!544529 #b00000000000000000000000000000000 Nil!26440))))

(declare-fun b!1201731 () Bool)

(declare-fun -!1780 (ListLongMap!17603 (_ BitVec 64)) ListLongMap!17603)

(assert (=> b!1201731 (= e!682553 (= call!57352 (-!1780 call!57351 k0!934)))))

(declare-fun mapIsEmpty!47627 () Bool)

(assert (=> mapIsEmpty!47627 mapRes!47627))

(assert (= (and start!100732 res!799609) b!1201723))

(assert (= (and b!1201723 res!799611) b!1201722))

(assert (= (and b!1201722 res!799603) b!1201718))

(assert (= (and b!1201718 res!799602) b!1201727))

(assert (= (and b!1201727 res!799607) b!1201717))

(assert (= (and b!1201717 res!799604) b!1201720))

(assert (= (and b!1201720 res!799601) b!1201726))

(assert (= (and b!1201726 res!799605) b!1201715))

(assert (= (and b!1201715 res!799606) b!1201730))

(assert (= (and b!1201730 res!799610) b!1201721))

(assert (= (and b!1201721 (not res!799608)) b!1201719))

(assert (= (and b!1201719 (not res!799612)) b!1201724))

(assert (= (and b!1201724 c!117838) b!1201731))

(assert (= (and b!1201724 (not c!117838)) b!1201725))

(assert (= (or b!1201731 b!1201725) bm!57349))

(assert (= (or b!1201731 b!1201725) bm!57348))

(assert (= (and b!1201728 condMapEmpty!47627) mapIsEmpty!47627))

(assert (= (and b!1201728 (not condMapEmpty!47627)) mapNonEmpty!47627))

(get-info :version)

(assert (= (and mapNonEmpty!47627 ((_ is ValueCellFull!14552) mapValue!47627)) b!1201716))

(assert (= (and b!1201728 ((_ is ValueCellFull!14552) mapDefault!47627)) b!1201729))

(assert (= start!100732 b!1201728))

(declare-fun b_lambda!21009 () Bool)

(assert (=> (not b_lambda!21009) (not b!1201719)))

(declare-fun t!39232 () Bool)

(declare-fun tb!10611 () Bool)

(assert (=> (and start!100732 (= defaultEntry!1004 defaultEntry!1004) t!39232) tb!10611))

(declare-fun result!21807 () Bool)

(assert (=> tb!10611 (= result!21807 tp_is_empty!30523)))

(assert (=> b!1201719 t!39232))

(declare-fun b_and!42529 () Bool)

(assert (= b_and!42527 (and (=> t!39232 result!21807) b_and!42529)))

(declare-fun m!1108307 () Bool)

(assert (=> b!1201730 m!1108307))

(declare-fun m!1108309 () Bool)

(assert (=> bm!57349 m!1108309))

(declare-fun m!1108311 () Bool)

(assert (=> b!1201726 m!1108311))

(declare-fun m!1108313 () Bool)

(assert (=> b!1201724 m!1108313))

(declare-fun m!1108315 () Bool)

(assert (=> b!1201727 m!1108315))

(declare-fun m!1108317 () Bool)

(assert (=> bm!57348 m!1108317))

(declare-fun m!1108319 () Bool)

(assert (=> mapNonEmpty!47627 m!1108319))

(declare-fun m!1108321 () Bool)

(assert (=> start!100732 m!1108321))

(declare-fun m!1108323 () Bool)

(assert (=> start!100732 m!1108323))

(declare-fun m!1108325 () Bool)

(assert (=> b!1201715 m!1108325))

(declare-fun m!1108327 () Bool)

(assert (=> b!1201715 m!1108327))

(declare-fun m!1108329 () Bool)

(assert (=> b!1201720 m!1108329))

(declare-fun m!1108331 () Bool)

(assert (=> b!1201721 m!1108331))

(declare-fun m!1108333 () Bool)

(assert (=> b!1201721 m!1108333))

(declare-fun m!1108335 () Bool)

(assert (=> b!1201731 m!1108335))

(declare-fun m!1108337 () Bool)

(assert (=> b!1201718 m!1108337))

(declare-fun m!1108339 () Bool)

(assert (=> b!1201723 m!1108339))

(declare-fun m!1108341 () Bool)

(assert (=> b!1201719 m!1108341))

(declare-fun m!1108343 () Bool)

(assert (=> b!1201719 m!1108343))

(declare-fun m!1108345 () Bool)

(assert (=> b!1201719 m!1108345))

(declare-fun m!1108347 () Bool)

(assert (=> b!1201719 m!1108347))

(check-sat (not b!1201727) (not b!1201730) (not b!1201715) (not bm!57349) (not b!1201724) (not b!1201731) (not b!1201723) (not b!1201719) (not b_next!25819) tp_is_empty!30523 (not bm!57348) (not b_lambda!21009) (not mapNonEmpty!47627) (not b!1201718) (not b!1201720) (not start!100732) (not b!1201721) b_and!42529)
(check-sat b_and!42529 (not b_next!25819))
