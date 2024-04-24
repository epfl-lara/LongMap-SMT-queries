; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98158 () Bool)

(assert start!98158)

(declare-fun b_free!23623 () Bool)

(declare-fun b_next!23623 () Bool)

(assert (=> start!98158 (= b_free!23623 (not b_next!23623))))

(declare-fun tp!83573 () Bool)

(declare-fun b_and!38039 () Bool)

(assert (=> start!98158 (= tp!83573 b_and!38039)))

(declare-fun b!1123179 () Bool)

(declare-fun res!749994 () Bool)

(declare-fun e!639586 () Bool)

(assert (=> b!1123179 (=> (not res!749994) (not e!639586))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123179 (= res!749994 (validMask!0 mask!1564))))

(declare-fun b!1123180 () Bool)

(declare-fun res!750001 () Bool)

(assert (=> b!1123180 (=> (not res!750001) (not e!639586))))

(declare-datatypes ((array!73229 0))(
  ( (array!73230 (arr!35261 (Array (_ BitVec 32) (_ BitVec 64))) (size!35798 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73229)

(declare-datatypes ((V!42665 0))(
  ( (V!42666 (val!14133 Int)) )
))
(declare-datatypes ((ValueCell!13367 0))(
  ( (ValueCellFull!13367 (v!16762 V!42665)) (EmptyCell!13367) )
))
(declare-datatypes ((array!73231 0))(
  ( (array!73232 (arr!35262 (Array (_ BitVec 32) ValueCell!13367)) (size!35799 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73231)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1123180 (= res!750001 (and (= (size!35799 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35798 _keys!1208) (size!35799 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!17748 0))(
  ( (tuple2!17749 (_1!8885 (_ BitVec 64)) (_2!8885 V!42665)) )
))
(declare-datatypes ((List!24546 0))(
  ( (Nil!24543) (Cons!24542 (h!25760 tuple2!17748) (t!35153 List!24546)) )
))
(declare-datatypes ((ListLongMap!15725 0))(
  ( (ListLongMap!15726 (toList!7878 List!24546)) )
))
(declare-fun call!47219 () ListLongMap!15725)

(declare-fun call!47218 () ListLongMap!15725)

(declare-fun b!1123181 () Bool)

(declare-fun e!639583 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1077 (ListLongMap!15725 (_ BitVec 64)) ListLongMap!15725)

(assert (=> b!1123181 (= e!639583 (= call!47219 (-!1077 call!47218 k0!934)))))

(declare-fun mapNonEmpty!44047 () Bool)

(declare-fun mapRes!44047 () Bool)

(declare-fun tp!83572 () Bool)

(declare-fun e!639584 () Bool)

(assert (=> mapNonEmpty!44047 (= mapRes!44047 (and tp!83572 e!639584))))

(declare-fun mapKey!44047 () (_ BitVec 32))

(declare-fun mapValue!44047 () ValueCell!13367)

(declare-fun mapRest!44047 () (Array (_ BitVec 32) ValueCell!13367))

(assert (=> mapNonEmpty!44047 (= (arr!35262 _values!996) (store mapRest!44047 mapKey!44047 mapValue!44047))))

(declare-fun mapIsEmpty!44047 () Bool)

(assert (=> mapIsEmpty!44047 mapRes!44047))

(declare-fun b!1123182 () Bool)

(declare-fun e!639587 () Bool)

(declare-fun tp_is_empty!28153 () Bool)

(assert (=> b!1123182 (= e!639587 tp_is_empty!28153)))

(declare-fun b!1123183 () Bool)

(declare-fun res!750000 () Bool)

(assert (=> b!1123183 (=> (not res!750000) (not e!639586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123183 (= res!750000 (validKeyInArray!0 k0!934))))

(declare-fun zeroValue!944 () V!42665)

(declare-fun lt!499017 () array!73229)

(declare-fun lt!499015 () array!73231)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42665)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47215 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4407 (array!73229 array!73231 (_ BitVec 32) (_ BitVec 32) V!42665 V!42665 (_ BitVec 32) Int) ListLongMap!15725)

(assert (=> bm!47215 (= call!47219 (getCurrentListMapNoExtraKeys!4407 lt!499017 lt!499015 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123185 () Bool)

(declare-fun e!639581 () Bool)

(assert (=> b!1123185 (= e!639586 e!639581)))

(declare-fun res!749990 () Bool)

(assert (=> b!1123185 (=> (not res!749990) (not e!639581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73229 (_ BitVec 32)) Bool)

(assert (=> b!1123185 (= res!749990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499017 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123185 (= lt!499017 (array!73230 (store (arr!35261 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35798 _keys!1208)))))

(declare-fun b!1123186 () Bool)

(declare-fun e!639582 () Bool)

(assert (=> b!1123186 (= e!639582 (or (not (= (select (arr!35261 _keys!1208) from!1455) k0!934)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35798 _keys!1208)))))))

(assert (=> b!1123186 e!639583))

(declare-fun c!109835 () Bool)

(assert (=> b!1123186 (= c!109835 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36789 0))(
  ( (Unit!36790) )
))
(declare-fun lt!499018 () Unit!36789)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!339 (array!73229 array!73231 (_ BitVec 32) (_ BitVec 32) V!42665 V!42665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36789)

(assert (=> b!1123186 (= lt!499018 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!339 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123187 () Bool)

(declare-fun res!749996 () Bool)

(assert (=> b!1123187 (=> (not res!749996) (not e!639586))))

(assert (=> b!1123187 (= res!749996 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35798 _keys!1208))))))

(declare-fun b!1123188 () Bool)

(declare-fun e!639588 () Bool)

(assert (=> b!1123188 (= e!639588 e!639582)))

(declare-fun res!749998 () Bool)

(assert (=> b!1123188 (=> res!749998 e!639582)))

(assert (=> b!1123188 (= res!749998 (not (= from!1455 i!673)))))

(declare-fun lt!499016 () ListLongMap!15725)

(assert (=> b!1123188 (= lt!499016 (getCurrentListMapNoExtraKeys!4407 lt!499017 lt!499015 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2493 (Int (_ BitVec 64)) V!42665)

(assert (=> b!1123188 (= lt!499015 (array!73232 (store (arr!35262 _values!996) i!673 (ValueCellFull!13367 (dynLambda!2493 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35799 _values!996)))))

(declare-fun lt!499013 () ListLongMap!15725)

(assert (=> b!1123188 (= lt!499013 (getCurrentListMapNoExtraKeys!4407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123189 () Bool)

(declare-fun res!749991 () Bool)

(assert (=> b!1123189 (=> (not res!749991) (not e!639581))))

(declare-datatypes ((List!24547 0))(
  ( (Nil!24544) (Cons!24543 (h!25761 (_ BitVec 64)) (t!35154 List!24547)) )
))
(declare-fun arrayNoDuplicates!0 (array!73229 (_ BitVec 32) List!24547) Bool)

(assert (=> b!1123189 (= res!749991 (arrayNoDuplicates!0 lt!499017 #b00000000000000000000000000000000 Nil!24544))))

(declare-fun b!1123190 () Bool)

(assert (=> b!1123190 (= e!639581 (not e!639588))))

(declare-fun res!749997 () Bool)

(assert (=> b!1123190 (=> res!749997 e!639588)))

(assert (=> b!1123190 (= res!749997 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123190 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499014 () Unit!36789)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73229 (_ BitVec 64) (_ BitVec 32)) Unit!36789)

(assert (=> b!1123190 (= lt!499014 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!749992 () Bool)

(assert (=> start!98158 (=> (not res!749992) (not e!639586))))

(assert (=> start!98158 (= res!749992 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35798 _keys!1208))))))

(assert (=> start!98158 e!639586))

(assert (=> start!98158 tp_is_empty!28153))

(declare-fun array_inv!27144 (array!73229) Bool)

(assert (=> start!98158 (array_inv!27144 _keys!1208)))

(assert (=> start!98158 true))

(assert (=> start!98158 tp!83573))

(declare-fun e!639585 () Bool)

(declare-fun array_inv!27145 (array!73231) Bool)

(assert (=> start!98158 (and (array_inv!27145 _values!996) e!639585)))

(declare-fun b!1123184 () Bool)

(assert (=> b!1123184 (= e!639585 (and e!639587 mapRes!44047))))

(declare-fun condMapEmpty!44047 () Bool)

(declare-fun mapDefault!44047 () ValueCell!13367)

(assert (=> b!1123184 (= condMapEmpty!44047 (= (arr!35262 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13367)) mapDefault!44047)))))

(declare-fun b!1123191 () Bool)

(assert (=> b!1123191 (= e!639583 (= call!47219 call!47218))))

(declare-fun b!1123192 () Bool)

(declare-fun res!749999 () Bool)

(assert (=> b!1123192 (=> (not res!749999) (not e!639586))))

(assert (=> b!1123192 (= res!749999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123193 () Bool)

(declare-fun res!749993 () Bool)

(assert (=> b!1123193 (=> (not res!749993) (not e!639586))))

(assert (=> b!1123193 (= res!749993 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24544))))

(declare-fun bm!47216 () Bool)

(assert (=> bm!47216 (= call!47218 (getCurrentListMapNoExtraKeys!4407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123194 () Bool)

(declare-fun res!749995 () Bool)

(assert (=> b!1123194 (=> (not res!749995) (not e!639586))))

(assert (=> b!1123194 (= res!749995 (= (select (arr!35261 _keys!1208) i!673) k0!934))))

(declare-fun b!1123195 () Bool)

(assert (=> b!1123195 (= e!639584 tp_is_empty!28153)))

(assert (= (and start!98158 res!749992) b!1123179))

(assert (= (and b!1123179 res!749994) b!1123180))

(assert (= (and b!1123180 res!750001) b!1123192))

(assert (= (and b!1123192 res!749999) b!1123193))

(assert (= (and b!1123193 res!749993) b!1123187))

(assert (= (and b!1123187 res!749996) b!1123183))

(assert (= (and b!1123183 res!750000) b!1123194))

(assert (= (and b!1123194 res!749995) b!1123185))

(assert (= (and b!1123185 res!749990) b!1123189))

(assert (= (and b!1123189 res!749991) b!1123190))

(assert (= (and b!1123190 (not res!749997)) b!1123188))

(assert (= (and b!1123188 (not res!749998)) b!1123186))

(assert (= (and b!1123186 c!109835) b!1123181))

(assert (= (and b!1123186 (not c!109835)) b!1123191))

(assert (= (or b!1123181 b!1123191) bm!47215))

(assert (= (or b!1123181 b!1123191) bm!47216))

(assert (= (and b!1123184 condMapEmpty!44047) mapIsEmpty!44047))

(assert (= (and b!1123184 (not condMapEmpty!44047)) mapNonEmpty!44047))

(get-info :version)

(assert (= (and mapNonEmpty!44047 ((_ is ValueCellFull!13367) mapValue!44047)) b!1123195))

(assert (= (and b!1123184 ((_ is ValueCellFull!13367) mapDefault!44047)) b!1123182))

(assert (= start!98158 b!1123184))

(declare-fun b_lambda!18603 () Bool)

(assert (=> (not b_lambda!18603) (not b!1123188)))

(declare-fun t!35152 () Bool)

(declare-fun tb!8427 () Bool)

(assert (=> (and start!98158 (= defaultEntry!1004 defaultEntry!1004) t!35152) tb!8427))

(declare-fun result!17423 () Bool)

(assert (=> tb!8427 (= result!17423 tp_is_empty!28153)))

(assert (=> b!1123188 t!35152))

(declare-fun b_and!38041 () Bool)

(assert (= b_and!38039 (and (=> t!35152 result!17423) b_and!38041)))

(declare-fun m!1038279 () Bool)

(assert (=> mapNonEmpty!44047 m!1038279))

(declare-fun m!1038281 () Bool)

(assert (=> start!98158 m!1038281))

(declare-fun m!1038283 () Bool)

(assert (=> start!98158 m!1038283))

(declare-fun m!1038285 () Bool)

(assert (=> b!1123183 m!1038285))

(declare-fun m!1038287 () Bool)

(assert (=> b!1123185 m!1038287))

(declare-fun m!1038289 () Bool)

(assert (=> b!1123185 m!1038289))

(declare-fun m!1038291 () Bool)

(assert (=> bm!47216 m!1038291))

(declare-fun m!1038293 () Bool)

(assert (=> b!1123193 m!1038293))

(declare-fun m!1038295 () Bool)

(assert (=> b!1123181 m!1038295))

(declare-fun m!1038297 () Bool)

(assert (=> b!1123179 m!1038297))

(declare-fun m!1038299 () Bool)

(assert (=> b!1123188 m!1038299))

(declare-fun m!1038301 () Bool)

(assert (=> b!1123188 m!1038301))

(declare-fun m!1038303 () Bool)

(assert (=> b!1123188 m!1038303))

(declare-fun m!1038305 () Bool)

(assert (=> b!1123188 m!1038305))

(declare-fun m!1038307 () Bool)

(assert (=> bm!47215 m!1038307))

(declare-fun m!1038309 () Bool)

(assert (=> b!1123194 m!1038309))

(declare-fun m!1038311 () Bool)

(assert (=> b!1123186 m!1038311))

(declare-fun m!1038313 () Bool)

(assert (=> b!1123186 m!1038313))

(declare-fun m!1038315 () Bool)

(assert (=> b!1123189 m!1038315))

(declare-fun m!1038317 () Bool)

(assert (=> b!1123192 m!1038317))

(declare-fun m!1038319 () Bool)

(assert (=> b!1123190 m!1038319))

(declare-fun m!1038321 () Bool)

(assert (=> b!1123190 m!1038321))

(check-sat (not b_lambda!18603) (not b!1123181) (not b!1123193) (not b_next!23623) (not mapNonEmpty!44047) (not b!1123190) (not b!1123186) b_and!38041 (not b!1123188) (not b!1123185) (not bm!47216) (not start!98158) (not b!1123189) (not bm!47215) tp_is_empty!28153 (not b!1123179) (not b!1123192) (not b!1123183))
(check-sat b_and!38041 (not b_next!23623))
