; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99936 () Bool)

(assert start!99936)

(declare-fun b_free!25279 () Bool)

(declare-fun b_next!25279 () Bool)

(assert (=> start!99936 (= b_free!25279 (not b_next!25279))))

(declare-fun tp!88551 () Bool)

(declare-fun b_and!41427 () Bool)

(assert (=> start!99936 (= tp!88551 b_and!41427)))

(declare-fun b!1184224 () Bool)

(declare-fun e!673383 () Bool)

(declare-fun e!673394 () Bool)

(assert (=> b!1184224 (= e!673383 e!673394)))

(declare-fun res!786696 () Bool)

(assert (=> b!1184224 (=> res!786696 e!673394)))

(declare-datatypes ((array!76465 0))(
  ( (array!76466 (arr!36876 (Array (_ BitVec 32) (_ BitVec 64))) (size!37413 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76465)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1184224 (= res!786696 (not (= (select (arr!36876 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184225 () Bool)

(declare-fun res!786700 () Bool)

(declare-fun e!673393 () Bool)

(assert (=> b!1184225 (=> (not res!786700) (not e!673393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184225 (= res!786700 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46541 () Bool)

(declare-fun mapRes!46541 () Bool)

(declare-fun tp!88550 () Bool)

(declare-fun e!673392 () Bool)

(assert (=> mapNonEmpty!46541 (= mapRes!46541 (and tp!88550 e!673392))))

(declare-fun mapKey!46541 () (_ BitVec 32))

(declare-datatypes ((V!44873 0))(
  ( (V!44874 (val!14961 Int)) )
))
(declare-datatypes ((ValueCell!14195 0))(
  ( (ValueCellFull!14195 (v!17595 V!44873)) (EmptyCell!14195) )
))
(declare-fun mapRest!46541 () (Array (_ BitVec 32) ValueCell!14195))

(declare-fun mapValue!46541 () ValueCell!14195)

(declare-datatypes ((array!76467 0))(
  ( (array!76468 (arr!36877 (Array (_ BitVec 32) ValueCell!14195)) (size!37414 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76467)

(assert (=> mapNonEmpty!46541 (= (arr!36877 _values!996) (store mapRest!46541 mapKey!46541 mapValue!46541))))

(declare-fun b!1184227 () Bool)

(declare-fun res!786701 () Bool)

(assert (=> b!1184227 (=> (not res!786701) (not e!673393))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184227 (= res!786701 (validMask!0 mask!1564))))

(declare-fun b!1184228 () Bool)

(declare-fun res!786688 () Bool)

(assert (=> b!1184228 (=> (not res!786688) (not e!673393))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1184228 (= res!786688 (and (= (size!37414 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37413 _keys!1208) (size!37414 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184229 () Bool)

(declare-fun res!786692 () Bool)

(assert (=> b!1184229 (=> (not res!786692) (not e!673393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76465 (_ BitVec 32)) Bool)

(assert (=> b!1184229 (= res!786692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184230 () Bool)

(declare-datatypes ((Unit!39141 0))(
  ( (Unit!39142) )
))
(declare-fun e!673390 () Unit!39141)

(declare-fun Unit!39143 () Unit!39141)

(assert (=> b!1184230 (= e!673390 Unit!39143)))

(declare-fun b!1184231 () Bool)

(declare-fun e!673384 () Bool)

(declare-fun tp_is_empty!29809 () Bool)

(assert (=> b!1184231 (= e!673384 tp_is_empty!29809)))

(declare-fun b!1184232 () Bool)

(declare-fun e!673391 () Bool)

(declare-fun e!673387 () Bool)

(assert (=> b!1184232 (= e!673391 e!673387)))

(declare-fun res!786687 () Bool)

(assert (=> b!1184232 (=> res!786687 e!673387)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1184232 (= res!786687 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44873)

(declare-fun lt!536201 () array!76465)

(declare-fun lt!536199 () array!76467)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19218 0))(
  ( (tuple2!19219 (_1!9620 (_ BitVec 64)) (_2!9620 V!44873)) )
))
(declare-datatypes ((List!25950 0))(
  ( (Nil!25947) (Cons!25946 (h!27164 tuple2!19218) (t!38213 List!25950)) )
))
(declare-datatypes ((ListLongMap!17195 0))(
  ( (ListLongMap!17196 (toList!8613 List!25950)) )
))
(declare-fun lt!536188 () ListLongMap!17195)

(declare-fun minValue!944 () V!44873)

(declare-fun getCurrentListMapNoExtraKeys!5085 (array!76465 array!76467 (_ BitVec 32) (_ BitVec 32) V!44873 V!44873 (_ BitVec 32) Int) ListLongMap!17195)

(assert (=> b!1184232 (= lt!536188 (getCurrentListMapNoExtraKeys!5085 lt!536201 lt!536199 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!536191 () V!44873)

(assert (=> b!1184232 (= lt!536199 (array!76468 (store (arr!36877 _values!996) i!673 (ValueCellFull!14195 lt!536191)) (size!37414 _values!996)))))

(declare-fun dynLambda!3049 (Int (_ BitVec 64)) V!44873)

(assert (=> b!1184232 (= lt!536191 (dynLambda!3049 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!536189 () ListLongMap!17195)

(assert (=> b!1184232 (= lt!536189 (getCurrentListMapNoExtraKeys!5085 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184233 () Bool)

(declare-fun e!673385 () Bool)

(assert (=> b!1184233 (= e!673385 (not e!673391))))

(declare-fun res!786691 () Bool)

(assert (=> b!1184233 (=> res!786691 e!673391)))

(assert (=> b!1184233 (= res!786691 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184233 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536195 () Unit!39141)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76465 (_ BitVec 64) (_ BitVec 32)) Unit!39141)

(assert (=> b!1184233 (= lt!536195 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184234 () Bool)

(declare-fun Unit!39144 () Unit!39141)

(assert (=> b!1184234 (= e!673390 Unit!39144)))

(declare-fun lt!536190 () Unit!39141)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76465 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39141)

(assert (=> b!1184234 (= lt!536190 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184234 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536196 () Unit!39141)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76465 (_ BitVec 32) (_ BitVec 32)) Unit!39141)

(assert (=> b!1184234 (= lt!536196 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25951 0))(
  ( (Nil!25948) (Cons!25947 (h!27165 (_ BitVec 64)) (t!38214 List!25951)) )
))
(declare-fun arrayNoDuplicates!0 (array!76465 (_ BitVec 32) List!25951) Bool)

(assert (=> b!1184234 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25948)))

(declare-fun lt!536194 () Unit!39141)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76465 (_ BitVec 64) (_ BitVec 32) List!25951) Unit!39141)

(assert (=> b!1184234 (= lt!536194 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25948))))

(assert (=> b!1184234 false))

(declare-fun b!1184235 () Bool)

(declare-fun e!673389 () Bool)

(assert (=> b!1184235 (= e!673387 e!673389)))

(declare-fun res!786694 () Bool)

(assert (=> b!1184235 (=> res!786694 e!673389)))

(assert (=> b!1184235 (= res!786694 (not (validKeyInArray!0 (select (arr!36876 _keys!1208) from!1455))))))

(declare-fun lt!536193 () ListLongMap!17195)

(declare-fun lt!536206 () ListLongMap!17195)

(assert (=> b!1184235 (= lt!536193 lt!536206)))

(declare-fun lt!536192 () ListLongMap!17195)

(declare-fun -!1635 (ListLongMap!17195 (_ BitVec 64)) ListLongMap!17195)

(assert (=> b!1184235 (= lt!536206 (-!1635 lt!536192 k0!934))))

(assert (=> b!1184235 (= lt!536193 (getCurrentListMapNoExtraKeys!5085 lt!536201 lt!536199 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184235 (= lt!536192 (getCurrentListMapNoExtraKeys!5085 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536204 () Unit!39141)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!858 (array!76465 array!76467 (_ BitVec 32) (_ BitVec 32) V!44873 V!44873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39141)

(assert (=> b!1184235 (= lt!536204 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!858 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184236 () Bool)

(assert (=> b!1184236 (= e!673393 e!673385)))

(declare-fun res!786689 () Bool)

(assert (=> b!1184236 (=> (not res!786689) (not e!673385))))

(assert (=> b!1184236 (= res!786689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536201 mask!1564))))

(assert (=> b!1184236 (= lt!536201 (array!76466 (store (arr!36876 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37413 _keys!1208)))))

(declare-fun mapIsEmpty!46541 () Bool)

(assert (=> mapIsEmpty!46541 mapRes!46541))

(declare-fun b!1184237 () Bool)

(assert (=> b!1184237 (= e!673394 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184238 () Bool)

(declare-fun e!673386 () Bool)

(assert (=> b!1184238 (= e!673386 (and e!673384 mapRes!46541))))

(declare-fun condMapEmpty!46541 () Bool)

(declare-fun mapDefault!46541 () ValueCell!14195)

(assert (=> b!1184238 (= condMapEmpty!46541 (= (arr!36877 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14195)) mapDefault!46541)))))

(declare-fun b!1184239 () Bool)

(declare-fun res!786699 () Bool)

(assert (=> b!1184239 (=> (not res!786699) (not e!673393))))

(assert (=> b!1184239 (= res!786699 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37413 _keys!1208))))))

(declare-fun res!786695 () Bool)

(assert (=> start!99936 (=> (not res!786695) (not e!673393))))

(assert (=> start!99936 (= res!786695 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37413 _keys!1208))))))

(assert (=> start!99936 e!673393))

(assert (=> start!99936 tp_is_empty!29809))

(declare-fun array_inv!28224 (array!76465) Bool)

(assert (=> start!99936 (array_inv!28224 _keys!1208)))

(assert (=> start!99936 true))

(assert (=> start!99936 tp!88551))

(declare-fun array_inv!28225 (array!76467) Bool)

(assert (=> start!99936 (and (array_inv!28225 _values!996) e!673386)))

(declare-fun b!1184226 () Bool)

(declare-fun res!786698 () Bool)

(assert (=> b!1184226 (=> (not res!786698) (not e!673393))))

(assert (=> b!1184226 (= res!786698 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25948))))

(declare-fun b!1184240 () Bool)

(declare-fun res!786690 () Bool)

(assert (=> b!1184240 (=> (not res!786690) (not e!673393))))

(assert (=> b!1184240 (= res!786690 (= (select (arr!36876 _keys!1208) i!673) k0!934))))

(declare-fun b!1184241 () Bool)

(declare-fun res!786693 () Bool)

(assert (=> b!1184241 (=> (not res!786693) (not e!673385))))

(assert (=> b!1184241 (= res!786693 (arrayNoDuplicates!0 lt!536201 #b00000000000000000000000000000000 Nil!25948))))

(declare-fun b!1184242 () Bool)

(assert (=> b!1184242 (= e!673389 true)))

(declare-fun lt!536197 () ListLongMap!17195)

(declare-fun lt!536198 () ListLongMap!17195)

(assert (=> b!1184242 (= (-!1635 lt!536197 k0!934) lt!536198)))

(declare-fun lt!536203 () V!44873)

(declare-fun lt!536202 () Unit!39141)

(declare-fun addRemoveCommutativeForDiffKeys!149 (ListLongMap!17195 (_ BitVec 64) V!44873 (_ BitVec 64)) Unit!39141)

(assert (=> b!1184242 (= lt!536202 (addRemoveCommutativeForDiffKeys!149 lt!536192 (select (arr!36876 _keys!1208) from!1455) lt!536203 k0!934))))

(assert (=> b!1184242 (and (= lt!536189 lt!536197) (= lt!536206 lt!536193))))

(declare-fun lt!536200 () tuple2!19218)

(declare-fun +!3933 (ListLongMap!17195 tuple2!19218) ListLongMap!17195)

(assert (=> b!1184242 (= lt!536197 (+!3933 lt!536192 lt!536200))))

(assert (=> b!1184242 (not (= (select (arr!36876 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536205 () Unit!39141)

(assert (=> b!1184242 (= lt!536205 e!673390)))

(declare-fun c!117440 () Bool)

(assert (=> b!1184242 (= c!117440 (= (select (arr!36876 _keys!1208) from!1455) k0!934))))

(assert (=> b!1184242 e!673383))

(declare-fun res!786697 () Bool)

(assert (=> b!1184242 (=> (not res!786697) (not e!673383))))

(assert (=> b!1184242 (= res!786697 (= lt!536188 lt!536198))))

(assert (=> b!1184242 (= lt!536198 (+!3933 lt!536206 lt!536200))))

(assert (=> b!1184242 (= lt!536200 (tuple2!19219 (select (arr!36876 _keys!1208) from!1455) lt!536203))))

(declare-fun get!18904 (ValueCell!14195 V!44873) V!44873)

(assert (=> b!1184242 (= lt!536203 (get!18904 (select (arr!36877 _values!996) from!1455) lt!536191))))

(declare-fun b!1184243 () Bool)

(assert (=> b!1184243 (= e!673392 tp_is_empty!29809)))

(assert (= (and start!99936 res!786695) b!1184227))

(assert (= (and b!1184227 res!786701) b!1184228))

(assert (= (and b!1184228 res!786688) b!1184229))

(assert (= (and b!1184229 res!786692) b!1184226))

(assert (= (and b!1184226 res!786698) b!1184239))

(assert (= (and b!1184239 res!786699) b!1184225))

(assert (= (and b!1184225 res!786700) b!1184240))

(assert (= (and b!1184240 res!786690) b!1184236))

(assert (= (and b!1184236 res!786689) b!1184241))

(assert (= (and b!1184241 res!786693) b!1184233))

(assert (= (and b!1184233 (not res!786691)) b!1184232))

(assert (= (and b!1184232 (not res!786687)) b!1184235))

(assert (= (and b!1184235 (not res!786694)) b!1184242))

(assert (= (and b!1184242 res!786697) b!1184224))

(assert (= (and b!1184224 (not res!786696)) b!1184237))

(assert (= (and b!1184242 c!117440) b!1184234))

(assert (= (and b!1184242 (not c!117440)) b!1184230))

(assert (= (and b!1184238 condMapEmpty!46541) mapIsEmpty!46541))

(assert (= (and b!1184238 (not condMapEmpty!46541)) mapNonEmpty!46541))

(get-info :version)

(assert (= (and mapNonEmpty!46541 ((_ is ValueCellFull!14195) mapValue!46541)) b!1184243))

(assert (= (and b!1184238 ((_ is ValueCellFull!14195) mapDefault!46541)) b!1184231))

(assert (= start!99936 b!1184238))

(declare-fun b_lambda!20417 () Bool)

(assert (=> (not b_lambda!20417) (not b!1184232)))

(declare-fun t!38212 () Bool)

(declare-fun tb!10083 () Bool)

(assert (=> (and start!99936 (= defaultEntry!1004 defaultEntry!1004) t!38212) tb!10083))

(declare-fun result!20741 () Bool)

(assert (=> tb!10083 (= result!20741 tp_is_empty!29809)))

(assert (=> b!1184232 t!38212))

(declare-fun b_and!41429 () Bool)

(assert (= b_and!41427 (and (=> t!38212 result!20741) b_and!41429)))

(declare-fun m!1092597 () Bool)

(assert (=> b!1184227 m!1092597))

(declare-fun m!1092599 () Bool)

(assert (=> b!1184242 m!1092599))

(declare-fun m!1092601 () Bool)

(assert (=> b!1184242 m!1092601))

(declare-fun m!1092603 () Bool)

(assert (=> b!1184242 m!1092603))

(declare-fun m!1092605 () Bool)

(assert (=> b!1184242 m!1092605))

(declare-fun m!1092607 () Bool)

(assert (=> b!1184242 m!1092607))

(assert (=> b!1184242 m!1092603))

(assert (=> b!1184242 m!1092601))

(declare-fun m!1092609 () Bool)

(assert (=> b!1184242 m!1092609))

(declare-fun m!1092611 () Bool)

(assert (=> b!1184242 m!1092611))

(declare-fun m!1092613 () Bool)

(assert (=> b!1184232 m!1092613))

(declare-fun m!1092615 () Bool)

(assert (=> b!1184232 m!1092615))

(declare-fun m!1092617 () Bool)

(assert (=> b!1184232 m!1092617))

(declare-fun m!1092619 () Bool)

(assert (=> b!1184232 m!1092619))

(declare-fun m!1092621 () Bool)

(assert (=> start!99936 m!1092621))

(declare-fun m!1092623 () Bool)

(assert (=> start!99936 m!1092623))

(assert (=> b!1184224 m!1092603))

(declare-fun m!1092625 () Bool)

(assert (=> b!1184234 m!1092625))

(declare-fun m!1092627 () Bool)

(assert (=> b!1184234 m!1092627))

(declare-fun m!1092629 () Bool)

(assert (=> b!1184234 m!1092629))

(declare-fun m!1092631 () Bool)

(assert (=> b!1184234 m!1092631))

(declare-fun m!1092633 () Bool)

(assert (=> b!1184234 m!1092633))

(declare-fun m!1092635 () Bool)

(assert (=> b!1184229 m!1092635))

(declare-fun m!1092637 () Bool)

(assert (=> b!1184241 m!1092637))

(declare-fun m!1092639 () Bool)

(assert (=> b!1184237 m!1092639))

(declare-fun m!1092641 () Bool)

(assert (=> b!1184240 m!1092641))

(declare-fun m!1092643 () Bool)

(assert (=> b!1184236 m!1092643))

(declare-fun m!1092645 () Bool)

(assert (=> b!1184236 m!1092645))

(declare-fun m!1092647 () Bool)

(assert (=> b!1184233 m!1092647))

(declare-fun m!1092649 () Bool)

(assert (=> b!1184233 m!1092649))

(declare-fun m!1092651 () Bool)

(assert (=> b!1184235 m!1092651))

(declare-fun m!1092653 () Bool)

(assert (=> b!1184235 m!1092653))

(declare-fun m!1092655 () Bool)

(assert (=> b!1184235 m!1092655))

(declare-fun m!1092657 () Bool)

(assert (=> b!1184235 m!1092657))

(assert (=> b!1184235 m!1092603))

(declare-fun m!1092659 () Bool)

(assert (=> b!1184235 m!1092659))

(assert (=> b!1184235 m!1092603))

(declare-fun m!1092661 () Bool)

(assert (=> b!1184225 m!1092661))

(declare-fun m!1092663 () Bool)

(assert (=> mapNonEmpty!46541 m!1092663))

(declare-fun m!1092665 () Bool)

(assert (=> b!1184226 m!1092665))

(check-sat (not b!1184232) (not start!99936) (not b!1184237) (not b_lambda!20417) (not b!1184233) (not mapNonEmpty!46541) (not b!1184225) (not b!1184242) (not b!1184235) (not b!1184227) b_and!41429 (not b!1184236) (not b!1184226) (not b!1184234) (not b_next!25279) (not b!1184241) (not b!1184229) tp_is_empty!29809)
(check-sat b_and!41429 (not b_next!25279))
