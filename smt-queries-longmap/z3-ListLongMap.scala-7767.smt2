; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97340 () Bool)

(assert start!97340)

(declare-fun b_free!23317 () Bool)

(declare-fun b_next!23317 () Bool)

(assert (=> start!97340 (= b_free!23317 (not b_next!23317))))

(declare-fun tp!82250 () Bool)

(declare-fun b_and!37445 () Bool)

(assert (=> start!97340 (= tp!82250 b_and!37445)))

(declare-fun b!1109178 () Bool)

(declare-fun e!632666 () Bool)

(declare-fun e!632670 () Bool)

(assert (=> b!1109178 (= e!632666 (not e!632670))))

(declare-fun res!740228 () Bool)

(assert (=> b!1109178 (=> res!740228 e!632670)))

(declare-datatypes ((array!71966 0))(
  ( (array!71967 (arr!34636 (Array (_ BitVec 32) (_ BitVec 64))) (size!35174 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71966)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1109178 (= res!740228 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35174 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109178 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36213 0))(
  ( (Unit!36214) )
))
(declare-fun lt!495764 () Unit!36213)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71966 (_ BitVec 64) (_ BitVec 32)) Unit!36213)

(assert (=> b!1109178 (= lt!495764 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43183 () Bool)

(declare-fun mapRes!43183 () Bool)

(assert (=> mapIsEmpty!43183 mapRes!43183))

(declare-fun b!1109179 () Bool)

(declare-fun e!632665 () Bool)

(declare-fun tp_is_empty!27577 () Bool)

(assert (=> b!1109179 (= e!632665 tp_is_empty!27577)))

(declare-fun b!1109180 () Bool)

(declare-fun res!740235 () Bool)

(declare-fun e!632663 () Bool)

(assert (=> b!1109180 (=> (not res!740235) (not e!632663))))

(declare-datatypes ((List!24213 0))(
  ( (Nil!24210) (Cons!24209 (h!25418 (_ BitVec 64)) (t!34567 List!24213)) )
))
(declare-fun arrayNoDuplicates!0 (array!71966 (_ BitVec 32) List!24213) Bool)

(assert (=> b!1109180 (= res!740235 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24210))))

(declare-datatypes ((V!41897 0))(
  ( (V!41898 (val!13845 Int)) )
))
(declare-fun zeroValue!944 () V!41897)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13079 0))(
  ( (ValueCellFull!13079 (v!16477 V!41897)) (EmptyCell!13079) )
))
(declare-datatypes ((array!71968 0))(
  ( (array!71969 (arr!34637 (Array (_ BitVec 32) ValueCell!13079)) (size!35175 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71968)

(declare-datatypes ((tuple2!17556 0))(
  ( (tuple2!17557 (_1!8789 (_ BitVec 64)) (_2!8789 V!41897)) )
))
(declare-datatypes ((List!24214 0))(
  ( (Nil!24211) (Cons!24210 (h!25419 tuple2!17556) (t!34568 List!24214)) )
))
(declare-datatypes ((ListLongMap!15525 0))(
  ( (ListLongMap!15526 (toList!7778 List!24214)) )
))
(declare-fun call!46625 () ListLongMap!15525)

(declare-fun lt!495763 () array!71966)

(declare-fun bm!46621 () Bool)

(declare-fun minValue!944 () V!41897)

(declare-fun getCurrentListMapNoExtraKeys!4294 (array!71966 array!71968 (_ BitVec 32) (_ BitVec 32) V!41897 V!41897 (_ BitVec 32) Int) ListLongMap!15525)

(declare-fun dynLambda!2360 (Int (_ BitVec 64)) V!41897)

(assert (=> bm!46621 (= call!46625 (getCurrentListMapNoExtraKeys!4294 lt!495763 (array!71969 (store (arr!34637 _values!996) i!673 (ValueCellFull!13079 (dynLambda!2360 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35175 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109182 () Bool)

(declare-fun e!632667 () Bool)

(declare-fun call!46624 () ListLongMap!15525)

(assert (=> b!1109182 (= e!632667 (= call!46625 call!46624))))

(declare-fun b!1109183 () Bool)

(declare-fun res!740229 () Bool)

(assert (=> b!1109183 (=> (not res!740229) (not e!632663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109183 (= res!740229 (validKeyInArray!0 k0!934))))

(declare-fun b!1109184 () Bool)

(assert (=> b!1109184 (= e!632670 true)))

(assert (=> b!1109184 e!632667))

(declare-fun c!109134 () Bool)

(assert (=> b!1109184 (= c!109134 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495765 () Unit!36213)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!268 (array!71966 array!71968 (_ BitVec 32) (_ BitVec 32) V!41897 V!41897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36213)

(assert (=> b!1109184 (= lt!495765 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!268 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109185 () Bool)

(declare-fun res!740230 () Bool)

(assert (=> b!1109185 (=> (not res!740230) (not e!632663))))

(assert (=> b!1109185 (= res!740230 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35174 _keys!1208))))))

(declare-fun bm!46622 () Bool)

(assert (=> bm!46622 (= call!46624 (getCurrentListMapNoExtraKeys!4294 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109186 () Bool)

(declare-fun res!740232 () Bool)

(assert (=> b!1109186 (=> (not res!740232) (not e!632666))))

(assert (=> b!1109186 (= res!740232 (arrayNoDuplicates!0 lt!495763 #b00000000000000000000000000000000 Nil!24210))))

(declare-fun b!1109187 () Bool)

(declare-fun res!740226 () Bool)

(assert (=> b!1109187 (=> (not res!740226) (not e!632663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109187 (= res!740226 (validMask!0 mask!1564))))

(declare-fun b!1109188 () Bool)

(declare-fun res!740227 () Bool)

(assert (=> b!1109188 (=> (not res!740227) (not e!632663))))

(assert (=> b!1109188 (= res!740227 (= (select (arr!34636 _keys!1208) i!673) k0!934))))

(declare-fun b!1109181 () Bool)

(declare-fun res!740231 () Bool)

(assert (=> b!1109181 (=> (not res!740231) (not e!632663))))

(assert (=> b!1109181 (= res!740231 (and (= (size!35175 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35174 _keys!1208) (size!35175 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!740234 () Bool)

(assert (=> start!97340 (=> (not res!740234) (not e!632663))))

(assert (=> start!97340 (= res!740234 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35174 _keys!1208))))))

(assert (=> start!97340 e!632663))

(assert (=> start!97340 tp_is_empty!27577))

(declare-fun array_inv!26706 (array!71966) Bool)

(assert (=> start!97340 (array_inv!26706 _keys!1208)))

(assert (=> start!97340 true))

(assert (=> start!97340 tp!82250))

(declare-fun e!632668 () Bool)

(declare-fun array_inv!26707 (array!71968) Bool)

(assert (=> start!97340 (and (array_inv!26707 _values!996) e!632668)))

(declare-fun b!1109189 () Bool)

(assert (=> b!1109189 (= e!632663 e!632666)))

(declare-fun res!740236 () Bool)

(assert (=> b!1109189 (=> (not res!740236) (not e!632666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71966 (_ BitVec 32)) Bool)

(assert (=> b!1109189 (= res!740236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495763 mask!1564))))

(assert (=> b!1109189 (= lt!495763 (array!71967 (store (arr!34636 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35174 _keys!1208)))))

(declare-fun b!1109190 () Bool)

(declare-fun res!740233 () Bool)

(assert (=> b!1109190 (=> (not res!740233) (not e!632663))))

(assert (=> b!1109190 (= res!740233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109191 () Bool)

(declare-fun e!632664 () Bool)

(assert (=> b!1109191 (= e!632668 (and e!632664 mapRes!43183))))

(declare-fun condMapEmpty!43183 () Bool)

(declare-fun mapDefault!43183 () ValueCell!13079)

(assert (=> b!1109191 (= condMapEmpty!43183 (= (arr!34637 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13079)) mapDefault!43183)))))

(declare-fun b!1109192 () Bool)

(declare-fun -!997 (ListLongMap!15525 (_ BitVec 64)) ListLongMap!15525)

(assert (=> b!1109192 (= e!632667 (= call!46625 (-!997 call!46624 k0!934)))))

(declare-fun b!1109193 () Bool)

(assert (=> b!1109193 (= e!632664 tp_is_empty!27577)))

(declare-fun mapNonEmpty!43183 () Bool)

(declare-fun tp!82249 () Bool)

(assert (=> mapNonEmpty!43183 (= mapRes!43183 (and tp!82249 e!632665))))

(declare-fun mapKey!43183 () (_ BitVec 32))

(declare-fun mapRest!43183 () (Array (_ BitVec 32) ValueCell!13079))

(declare-fun mapValue!43183 () ValueCell!13079)

(assert (=> mapNonEmpty!43183 (= (arr!34637 _values!996) (store mapRest!43183 mapKey!43183 mapValue!43183))))

(assert (= (and start!97340 res!740234) b!1109187))

(assert (= (and b!1109187 res!740226) b!1109181))

(assert (= (and b!1109181 res!740231) b!1109190))

(assert (= (and b!1109190 res!740233) b!1109180))

(assert (= (and b!1109180 res!740235) b!1109185))

(assert (= (and b!1109185 res!740230) b!1109183))

(assert (= (and b!1109183 res!740229) b!1109188))

(assert (= (and b!1109188 res!740227) b!1109189))

(assert (= (and b!1109189 res!740236) b!1109186))

(assert (= (and b!1109186 res!740232) b!1109178))

(assert (= (and b!1109178 (not res!740228)) b!1109184))

(assert (= (and b!1109184 c!109134) b!1109192))

(assert (= (and b!1109184 (not c!109134)) b!1109182))

(assert (= (or b!1109192 b!1109182) bm!46621))

(assert (= (or b!1109192 b!1109182) bm!46622))

(assert (= (and b!1109191 condMapEmpty!43183) mapIsEmpty!43183))

(assert (= (and b!1109191 (not condMapEmpty!43183)) mapNonEmpty!43183))

(get-info :version)

(assert (= (and mapNonEmpty!43183 ((_ is ValueCellFull!13079) mapValue!43183)) b!1109179))

(assert (= (and b!1109191 ((_ is ValueCellFull!13079) mapDefault!43183)) b!1109193))

(assert (= start!97340 b!1109191))

(declare-fun b_lambda!18319 () Bool)

(assert (=> (not b_lambda!18319) (not bm!46621)))

(declare-fun t!34566 () Bool)

(declare-fun tb!8175 () Bool)

(assert (=> (and start!97340 (= defaultEntry!1004 defaultEntry!1004) t!34566) tb!8175))

(declare-fun result!16919 () Bool)

(assert (=> tb!8175 (= result!16919 tp_is_empty!27577)))

(assert (=> bm!46621 t!34566))

(declare-fun b_and!37447 () Bool)

(assert (= b_and!37445 (and (=> t!34566 result!16919) b_and!37447)))

(declare-fun m!1026999 () Bool)

(assert (=> start!97340 m!1026999))

(declare-fun m!1027001 () Bool)

(assert (=> start!97340 m!1027001))

(declare-fun m!1027003 () Bool)

(assert (=> b!1109184 m!1027003))

(declare-fun m!1027005 () Bool)

(assert (=> bm!46622 m!1027005))

(declare-fun m!1027007 () Bool)

(assert (=> b!1109180 m!1027007))

(declare-fun m!1027009 () Bool)

(assert (=> b!1109192 m!1027009))

(declare-fun m!1027011 () Bool)

(assert (=> b!1109189 m!1027011))

(declare-fun m!1027013 () Bool)

(assert (=> b!1109189 m!1027013))

(declare-fun m!1027015 () Bool)

(assert (=> bm!46621 m!1027015))

(declare-fun m!1027017 () Bool)

(assert (=> bm!46621 m!1027017))

(declare-fun m!1027019 () Bool)

(assert (=> bm!46621 m!1027019))

(declare-fun m!1027021 () Bool)

(assert (=> b!1109178 m!1027021))

(declare-fun m!1027023 () Bool)

(assert (=> b!1109178 m!1027023))

(declare-fun m!1027025 () Bool)

(assert (=> b!1109190 m!1027025))

(declare-fun m!1027027 () Bool)

(assert (=> b!1109188 m!1027027))

(declare-fun m!1027029 () Bool)

(assert (=> b!1109186 m!1027029))

(declare-fun m!1027031 () Bool)

(assert (=> b!1109187 m!1027031))

(declare-fun m!1027033 () Bool)

(assert (=> mapNonEmpty!43183 m!1027033))

(declare-fun m!1027035 () Bool)

(assert (=> b!1109183 m!1027035))

(check-sat (not b!1109190) (not b!1109189) (not b!1109180) (not b!1109183) (not b!1109184) (not bm!46621) (not bm!46622) (not b_next!23317) (not b_lambda!18319) b_and!37447 (not b!1109178) (not mapNonEmpty!43183) (not b!1109187) (not b!1109192) (not start!97340) (not b!1109186) tp_is_empty!27577)
(check-sat b_and!37447 (not b_next!23317))
