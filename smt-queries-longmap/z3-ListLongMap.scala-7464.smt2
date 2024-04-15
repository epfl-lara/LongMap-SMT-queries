; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94686 () Bool)

(assert start!94686)

(declare-fun b_free!21961 () Bool)

(declare-fun b_next!21961 () Bool)

(assert (=> start!94686 (= b_free!21961 (not b_next!21961))))

(declare-fun tp!77338 () Bool)

(declare-fun b_and!34755 () Bool)

(assert (=> start!94686 (= tp!77338 b_and!34755)))

(declare-fun b!1070484 () Bool)

(declare-fun e!611099 () Bool)

(declare-fun tp_is_empty!25771 () Bool)

(assert (=> b!1070484 (= e!611099 tp_is_empty!25771)))

(declare-fun b!1070485 () Bool)

(declare-fun e!611104 () Bool)

(declare-fun mapRes!40360 () Bool)

(assert (=> b!1070485 (= e!611104 (and e!611099 mapRes!40360))))

(declare-fun condMapEmpty!40360 () Bool)

(declare-datatypes ((V!39497 0))(
  ( (V!39498 (val!12936 Int)) )
))
(declare-datatypes ((ValueCell!12182 0))(
  ( (ValueCellFull!12182 (v!15551 V!39497)) (EmptyCell!12182) )
))
(declare-datatypes ((array!68452 0))(
  ( (array!68453 (arr!32923 (Array (_ BitVec 32) ValueCell!12182)) (size!33461 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68452)

(declare-fun mapDefault!40360 () ValueCell!12182)

(assert (=> b!1070485 (= condMapEmpty!40360 (= (arr!32923 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12182)) mapDefault!40360)))))

(declare-fun b!1070486 () Bool)

(declare-fun res!714181 () Bool)

(declare-fun e!611100 () Bool)

(assert (=> b!1070486 (=> (not res!714181) (not e!611100))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68454 0))(
  ( (array!68455 (arr!32924 (Array (_ BitVec 32) (_ BitVec 64))) (size!33462 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68454)

(assert (=> b!1070486 (= res!714181 (and (= (size!33461 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33462 _keys!1163) (size!33461 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40360 () Bool)

(declare-fun tp!77339 () Bool)

(declare-fun e!611103 () Bool)

(assert (=> mapNonEmpty!40360 (= mapRes!40360 (and tp!77339 e!611103))))

(declare-fun mapValue!40360 () ValueCell!12182)

(declare-fun mapRest!40360 () (Array (_ BitVec 32) ValueCell!12182))

(declare-fun mapKey!40360 () (_ BitVec 32))

(assert (=> mapNonEmpty!40360 (= (arr!32923 _values!955) (store mapRest!40360 mapKey!40360 mapValue!40360))))

(declare-fun b!1070488 () Bool)

(declare-fun e!611101 () Bool)

(assert (=> b!1070488 (= e!611101 (bvsle #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(declare-fun zeroValueBefore!47 () V!39497)

(declare-datatypes ((tuple2!16502 0))(
  ( (tuple2!16503 (_1!8262 (_ BitVec 64)) (_2!8262 V!39497)) )
))
(declare-datatypes ((List!23030 0))(
  ( (Nil!23027) (Cons!23026 (h!24235 tuple2!16502) (t!32352 List!23030)) )
))
(declare-datatypes ((ListLongMap!14471 0))(
  ( (ListLongMap!14472 (toList!7251 List!23030)) )
))
(declare-fun lt!472973 () ListLongMap!14471)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39497)

(declare-fun getCurrentListMap!4064 (array!68454 array!68452 (_ BitVec 32) (_ BitVec 32) V!39497 V!39497 (_ BitVec 32) Int) ListLongMap!14471)

(assert (=> b!1070488 (= lt!472973 (getCurrentListMap!4064 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40360 () Bool)

(assert (=> mapIsEmpty!40360 mapRes!40360))

(declare-fun b!1070489 () Bool)

(assert (=> b!1070489 (= e!611103 tp_is_empty!25771)))

(declare-fun b!1070487 () Bool)

(declare-fun res!714182 () Bool)

(assert (=> b!1070487 (=> (not res!714182) (not e!611100))))

(declare-datatypes ((List!23031 0))(
  ( (Nil!23028) (Cons!23027 (h!24236 (_ BitVec 64)) (t!32353 List!23031)) )
))
(declare-fun arrayNoDuplicates!0 (array!68454 (_ BitVec 32) List!23031) Bool)

(assert (=> b!1070487 (= res!714182 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23028))))

(declare-fun res!714179 () Bool)

(assert (=> start!94686 (=> (not res!714179) (not e!611100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94686 (= res!714179 (validMask!0 mask!1515))))

(assert (=> start!94686 e!611100))

(assert (=> start!94686 true))

(assert (=> start!94686 tp_is_empty!25771))

(declare-fun array_inv!25472 (array!68452) Bool)

(assert (=> start!94686 (and (array_inv!25472 _values!955) e!611104)))

(assert (=> start!94686 tp!77338))

(declare-fun array_inv!25473 (array!68454) Bool)

(assert (=> start!94686 (array_inv!25473 _keys!1163)))

(declare-fun b!1070490 () Bool)

(declare-fun res!714180 () Bool)

(assert (=> b!1070490 (=> (not res!714180) (not e!611100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68454 (_ BitVec 32)) Bool)

(assert (=> b!1070490 (= res!714180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070491 () Bool)

(assert (=> b!1070491 (= e!611100 (not e!611101))))

(declare-fun res!714183 () Bool)

(assert (=> b!1070491 (=> res!714183 e!611101)))

(assert (=> b!1070491 (= res!714183 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!472971 () ListLongMap!14471)

(declare-fun lt!472972 () ListLongMap!14471)

(assert (=> b!1070491 (= lt!472971 lt!472972)))

(declare-datatypes ((Unit!35086 0))(
  ( (Unit!35087) )
))
(declare-fun lt!472970 () Unit!35086)

(declare-fun zeroValueAfter!47 () V!39497)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!832 (array!68454 array!68452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39497 V!39497 V!39497 V!39497 (_ BitVec 32) Int) Unit!35086)

(assert (=> b!1070491 (= lt!472970 (lemmaNoChangeToArrayThenSameMapNoExtras!832 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3838 (array!68454 array!68452 (_ BitVec 32) (_ BitVec 32) V!39497 V!39497 (_ BitVec 32) Int) ListLongMap!14471)

(assert (=> b!1070491 (= lt!472972 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070491 (= lt!472971 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94686 res!714179) b!1070486))

(assert (= (and b!1070486 res!714181) b!1070490))

(assert (= (and b!1070490 res!714180) b!1070487))

(assert (= (and b!1070487 res!714182) b!1070491))

(assert (= (and b!1070491 (not res!714183)) b!1070488))

(assert (= (and b!1070485 condMapEmpty!40360) mapIsEmpty!40360))

(assert (= (and b!1070485 (not condMapEmpty!40360)) mapNonEmpty!40360))

(get-info :version)

(assert (= (and mapNonEmpty!40360 ((_ is ValueCellFull!12182) mapValue!40360)) b!1070489))

(assert (= (and b!1070485 ((_ is ValueCellFull!12182) mapDefault!40360)) b!1070484))

(assert (= start!94686 b!1070485))

(declare-fun m!988327 () Bool)

(assert (=> start!94686 m!988327))

(declare-fun m!988329 () Bool)

(assert (=> start!94686 m!988329))

(declare-fun m!988331 () Bool)

(assert (=> start!94686 m!988331))

(declare-fun m!988333 () Bool)

(assert (=> b!1070491 m!988333))

(declare-fun m!988335 () Bool)

(assert (=> b!1070491 m!988335))

(declare-fun m!988337 () Bool)

(assert (=> b!1070491 m!988337))

(declare-fun m!988339 () Bool)

(assert (=> mapNonEmpty!40360 m!988339))

(declare-fun m!988341 () Bool)

(assert (=> b!1070490 m!988341))

(declare-fun m!988343 () Bool)

(assert (=> b!1070488 m!988343))

(declare-fun m!988345 () Bool)

(assert (=> b!1070487 m!988345))

(check-sat (not start!94686) (not b!1070491) (not b_next!21961) b_and!34755 (not b!1070488) (not b!1070490) (not b!1070487) (not mapNonEmpty!40360) tp_is_empty!25771)
(check-sat b_and!34755 (not b_next!21961))
(get-model)

(declare-fun b!1070548 () Bool)

(declare-fun e!611148 () Bool)

(declare-fun e!611147 () Bool)

(assert (=> b!1070548 (= e!611148 e!611147)))

(declare-fun c!107573 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1070548 (= c!107573 (validKeyInArray!0 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129109 () Bool)

(declare-fun res!714219 () Bool)

(assert (=> d!129109 (=> res!714219 e!611148)))

(assert (=> d!129109 (= res!714219 (bvsge #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(assert (=> d!129109 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!611148)))

(declare-fun b!1070549 () Bool)

(declare-fun call!45150 () Bool)

(assert (=> b!1070549 (= e!611147 call!45150)))

(declare-fun b!1070550 () Bool)

(declare-fun e!611149 () Bool)

(assert (=> b!1070550 (= e!611149 call!45150)))

(declare-fun bm!45147 () Bool)

(assert (=> bm!45147 (= call!45150 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1070551 () Bool)

(assert (=> b!1070551 (= e!611147 e!611149)))

(declare-fun lt!473004 () (_ BitVec 64))

(assert (=> b!1070551 (= lt!473004 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473006 () Unit!35086)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68454 (_ BitVec 64) (_ BitVec 32)) Unit!35086)

(assert (=> b!1070551 (= lt!473006 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!473004 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1070551 (arrayContainsKey!0 _keys!1163 lt!473004 #b00000000000000000000000000000000)))

(declare-fun lt!473005 () Unit!35086)

(assert (=> b!1070551 (= lt!473005 lt!473006)))

(declare-fun res!714218 () Bool)

(declare-datatypes ((SeekEntryResult!9881 0))(
  ( (MissingZero!9881 (index!41895 (_ BitVec 32))) (Found!9881 (index!41896 (_ BitVec 32))) (Intermediate!9881 (undefined!10693 Bool) (index!41897 (_ BitVec 32)) (x!95930 (_ BitVec 32))) (Undefined!9881) (MissingVacant!9881 (index!41898 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68454 (_ BitVec 32)) SeekEntryResult!9881)

(assert (=> b!1070551 (= res!714218 (= (seekEntryOrOpen!0 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9881 #b00000000000000000000000000000000)))))

(assert (=> b!1070551 (=> (not res!714218) (not e!611149))))

(assert (= (and d!129109 (not res!714219)) b!1070548))

(assert (= (and b!1070548 c!107573) b!1070551))

(assert (= (and b!1070548 (not c!107573)) b!1070549))

(assert (= (and b!1070551 res!714218) b!1070550))

(assert (= (or b!1070550 b!1070549) bm!45147))

(declare-fun m!988387 () Bool)

(assert (=> b!1070548 m!988387))

(assert (=> b!1070548 m!988387))

(declare-fun m!988389 () Bool)

(assert (=> b!1070548 m!988389))

(declare-fun m!988391 () Bool)

(assert (=> bm!45147 m!988391))

(assert (=> b!1070551 m!988387))

(declare-fun m!988393 () Bool)

(assert (=> b!1070551 m!988393))

(declare-fun m!988395 () Bool)

(assert (=> b!1070551 m!988395))

(assert (=> b!1070551 m!988387))

(declare-fun m!988397 () Bool)

(assert (=> b!1070551 m!988397))

(assert (=> b!1070490 d!129109))

(declare-fun b!1070562 () Bool)

(declare-fun e!611161 () Bool)

(declare-fun e!611159 () Bool)

(assert (=> b!1070562 (= e!611161 e!611159)))

(declare-fun c!107576 () Bool)

(assert (=> b!1070562 (= c!107576 (validKeyInArray!0 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070563 () Bool)

(declare-fun call!45153 () Bool)

(assert (=> b!1070563 (= e!611159 call!45153)))

(declare-fun bm!45150 () Bool)

(assert (=> bm!45150 (= call!45153 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107576 (Cons!23027 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000) Nil!23028) Nil!23028)))))

(declare-fun b!1070564 () Bool)

(declare-fun e!611158 () Bool)

(assert (=> b!1070564 (= e!611158 e!611161)))

(declare-fun res!714227 () Bool)

(assert (=> b!1070564 (=> (not res!714227) (not e!611161))))

(declare-fun e!611160 () Bool)

(assert (=> b!1070564 (= res!714227 (not e!611160))))

(declare-fun res!714228 () Bool)

(assert (=> b!1070564 (=> (not res!714228) (not e!611160))))

(assert (=> b!1070564 (= res!714228 (validKeyInArray!0 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129111 () Bool)

(declare-fun res!714226 () Bool)

(assert (=> d!129111 (=> res!714226 e!611158)))

(assert (=> d!129111 (= res!714226 (bvsge #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(assert (=> d!129111 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23028) e!611158)))

(declare-fun b!1070565 () Bool)

(declare-fun contains!6286 (List!23031 (_ BitVec 64)) Bool)

(assert (=> b!1070565 (= e!611160 (contains!6286 Nil!23028 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070566 () Bool)

(assert (=> b!1070566 (= e!611159 call!45153)))

(assert (= (and d!129111 (not res!714226)) b!1070564))

(assert (= (and b!1070564 res!714228) b!1070565))

(assert (= (and b!1070564 res!714227) b!1070562))

(assert (= (and b!1070562 c!107576) b!1070566))

(assert (= (and b!1070562 (not c!107576)) b!1070563))

(assert (= (or b!1070566 b!1070563) bm!45150))

(assert (=> b!1070562 m!988387))

(assert (=> b!1070562 m!988387))

(assert (=> b!1070562 m!988389))

(assert (=> bm!45150 m!988387))

(declare-fun m!988399 () Bool)

(assert (=> bm!45150 m!988399))

(assert (=> b!1070564 m!988387))

(assert (=> b!1070564 m!988387))

(assert (=> b!1070564 m!988389))

(assert (=> b!1070565 m!988387))

(assert (=> b!1070565 m!988387))

(declare-fun m!988401 () Bool)

(assert (=> b!1070565 m!988401))

(assert (=> b!1070487 d!129111))

(declare-fun d!129113 () Bool)

(assert (=> d!129113 (= (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473009 () Unit!35086)

(declare-fun choose!1747 (array!68454 array!68452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39497 V!39497 V!39497 V!39497 (_ BitVec 32) Int) Unit!35086)

(assert (=> d!129113 (= lt!473009 (choose!1747 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129113 (validMask!0 mask!1515)))

(assert (=> d!129113 (= (lemmaNoChangeToArrayThenSameMapNoExtras!832 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473009)))

(declare-fun bs!31512 () Bool)

(assert (= bs!31512 d!129113))

(assert (=> bs!31512 m!988337))

(assert (=> bs!31512 m!988335))

(declare-fun m!988403 () Bool)

(assert (=> bs!31512 m!988403))

(assert (=> bs!31512 m!988327))

(assert (=> b!1070491 d!129113))

(declare-fun call!45156 () ListLongMap!14471)

(declare-fun bm!45153 () Bool)

(assert (=> bm!45153 (= call!45156 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1070591 () Bool)

(declare-fun res!714240 () Bool)

(declare-fun e!611179 () Bool)

(assert (=> b!1070591 (=> (not res!714240) (not e!611179))))

(declare-fun lt!473026 () ListLongMap!14471)

(declare-fun contains!6287 (ListLongMap!14471 (_ BitVec 64)) Bool)

(assert (=> b!1070591 (= res!714240 (not (contains!6287 lt!473026 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129115 () Bool)

(assert (=> d!129115 e!611179))

(declare-fun res!714238 () Bool)

(assert (=> d!129115 (=> (not res!714238) (not e!611179))))

(assert (=> d!129115 (= res!714238 (not (contains!6287 lt!473026 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!611176 () ListLongMap!14471)

(assert (=> d!129115 (= lt!473026 e!611176)))

(declare-fun c!107586 () Bool)

(assert (=> d!129115 (= c!107586 (bvsge #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(assert (=> d!129115 (validMask!0 mask!1515)))

(assert (=> d!129115 (= (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473026)))

(declare-fun b!1070592 () Bool)

(declare-fun e!611180 () ListLongMap!14471)

(assert (=> b!1070592 (= e!611176 e!611180)))

(declare-fun c!107587 () Bool)

(assert (=> b!1070592 (= c!107587 (validKeyInArray!0 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070593 () Bool)

(assert (=> b!1070593 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(assert (=> b!1070593 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33461 _values!955)))))

(declare-fun e!611178 () Bool)

(declare-fun apply!922 (ListLongMap!14471 (_ BitVec 64)) V!39497)

(declare-fun get!17140 (ValueCell!12182 V!39497) V!39497)

(declare-fun dynLambda!2021 (Int (_ BitVec 64)) V!39497)

(assert (=> b!1070593 (= e!611178 (= (apply!922 lt!473026 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)) (get!17140 (select (arr!32923 _values!955) #b00000000000000000000000000000000) (dynLambda!2021 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1070594 () Bool)

(declare-fun e!611182 () Bool)

(assert (=> b!1070594 (= e!611182 (validKeyInArray!0 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070594 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1070595 () Bool)

(declare-fun e!611181 () Bool)

(declare-fun isEmpty!952 (ListLongMap!14471) Bool)

(assert (=> b!1070595 (= e!611181 (isEmpty!952 lt!473026))))

(declare-fun b!1070596 () Bool)

(declare-fun e!611177 () Bool)

(assert (=> b!1070596 (= e!611177 e!611178)))

(assert (=> b!1070596 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(declare-fun res!714239 () Bool)

(assert (=> b!1070596 (= res!714239 (contains!6287 lt!473026 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070596 (=> (not res!714239) (not e!611178))))

(declare-fun b!1070597 () Bool)

(assert (=> b!1070597 (= e!611176 (ListLongMap!14472 Nil!23027))))

(declare-fun b!1070598 () Bool)

(assert (=> b!1070598 (= e!611177 e!611181)))

(declare-fun c!107585 () Bool)

(assert (=> b!1070598 (= c!107585 (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(declare-fun b!1070599 () Bool)

(assert (=> b!1070599 (= e!611181 (= lt!473026 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1070600 () Bool)

(declare-fun lt!473029 () Unit!35086)

(declare-fun lt!473030 () Unit!35086)

(assert (=> b!1070600 (= lt!473029 lt!473030)))

(declare-fun lt!473024 () (_ BitVec 64))

(declare-fun lt!473025 () (_ BitVec 64))

(declare-fun lt!473028 () ListLongMap!14471)

(declare-fun lt!473027 () V!39497)

(declare-fun +!3188 (ListLongMap!14471 tuple2!16502) ListLongMap!14471)

(assert (=> b!1070600 (not (contains!6287 (+!3188 lt!473028 (tuple2!16503 lt!473024 lt!473027)) lt!473025))))

(declare-fun addStillNotContains!258 (ListLongMap!14471 (_ BitVec 64) V!39497 (_ BitVec 64)) Unit!35086)

(assert (=> b!1070600 (= lt!473030 (addStillNotContains!258 lt!473028 lt!473024 lt!473027 lt!473025))))

(assert (=> b!1070600 (= lt!473025 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1070600 (= lt!473027 (get!17140 (select (arr!32923 _values!955) #b00000000000000000000000000000000) (dynLambda!2021 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1070600 (= lt!473024 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1070600 (= lt!473028 call!45156)))

(assert (=> b!1070600 (= e!611180 (+!3188 call!45156 (tuple2!16503 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000) (get!17140 (select (arr!32923 _values!955) #b00000000000000000000000000000000) (dynLambda!2021 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1070601 () Bool)

(assert (=> b!1070601 (= e!611179 e!611177)))

(declare-fun c!107588 () Bool)

(assert (=> b!1070601 (= c!107588 e!611182)))

(declare-fun res!714237 () Bool)

(assert (=> b!1070601 (=> (not res!714237) (not e!611182))))

(assert (=> b!1070601 (= res!714237 (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(declare-fun b!1070602 () Bool)

(assert (=> b!1070602 (= e!611180 call!45156)))

(assert (= (and d!129115 c!107586) b!1070597))

(assert (= (and d!129115 (not c!107586)) b!1070592))

(assert (= (and b!1070592 c!107587) b!1070600))

(assert (= (and b!1070592 (not c!107587)) b!1070602))

(assert (= (or b!1070600 b!1070602) bm!45153))

(assert (= (and d!129115 res!714238) b!1070591))

(assert (= (and b!1070591 res!714240) b!1070601))

(assert (= (and b!1070601 res!714237) b!1070594))

(assert (= (and b!1070601 c!107588) b!1070596))

(assert (= (and b!1070601 (not c!107588)) b!1070598))

(assert (= (and b!1070596 res!714239) b!1070593))

(assert (= (and b!1070598 c!107585) b!1070599))

(assert (= (and b!1070598 (not c!107585)) b!1070595))

(declare-fun b_lambda!16635 () Bool)

(assert (=> (not b_lambda!16635) (not b!1070593)))

(declare-fun t!32358 () Bool)

(declare-fun tb!7145 () Bool)

(assert (=> (and start!94686 (= defaultEntry!963 defaultEntry!963) t!32358) tb!7145))

(declare-fun result!14759 () Bool)

(assert (=> tb!7145 (= result!14759 tp_is_empty!25771)))

(assert (=> b!1070593 t!32358))

(declare-fun b_and!34761 () Bool)

(assert (= b_and!34755 (and (=> t!32358 result!14759) b_and!34761)))

(declare-fun b_lambda!16637 () Bool)

(assert (=> (not b_lambda!16637) (not b!1070600)))

(assert (=> b!1070600 t!32358))

(declare-fun b_and!34763 () Bool)

(assert (= b_and!34761 (and (=> t!32358 result!14759) b_and!34763)))

(assert (=> b!1070596 m!988387))

(assert (=> b!1070596 m!988387))

(declare-fun m!988405 () Bool)

(assert (=> b!1070596 m!988405))

(declare-fun m!988407 () Bool)

(assert (=> bm!45153 m!988407))

(declare-fun m!988409 () Bool)

(assert (=> b!1070595 m!988409))

(declare-fun m!988411 () Bool)

(assert (=> d!129115 m!988411))

(assert (=> d!129115 m!988327))

(assert (=> b!1070592 m!988387))

(assert (=> b!1070592 m!988387))

(assert (=> b!1070592 m!988389))

(assert (=> b!1070593 m!988387))

(assert (=> b!1070593 m!988387))

(declare-fun m!988413 () Bool)

(assert (=> b!1070593 m!988413))

(declare-fun m!988415 () Bool)

(assert (=> b!1070593 m!988415))

(declare-fun m!988417 () Bool)

(assert (=> b!1070593 m!988417))

(assert (=> b!1070593 m!988415))

(assert (=> b!1070593 m!988417))

(declare-fun m!988419 () Bool)

(assert (=> b!1070593 m!988419))

(assert (=> b!1070600 m!988387))

(declare-fun m!988421 () Bool)

(assert (=> b!1070600 m!988421))

(assert (=> b!1070600 m!988415))

(assert (=> b!1070600 m!988417))

(assert (=> b!1070600 m!988415))

(assert (=> b!1070600 m!988417))

(assert (=> b!1070600 m!988419))

(declare-fun m!988423 () Bool)

(assert (=> b!1070600 m!988423))

(declare-fun m!988425 () Bool)

(assert (=> b!1070600 m!988425))

(declare-fun m!988427 () Bool)

(assert (=> b!1070600 m!988427))

(assert (=> b!1070600 m!988423))

(assert (=> b!1070599 m!988407))

(assert (=> b!1070594 m!988387))

(assert (=> b!1070594 m!988387))

(assert (=> b!1070594 m!988389))

(declare-fun m!988429 () Bool)

(assert (=> b!1070591 m!988429))

(assert (=> b!1070491 d!129115))

(declare-fun call!45157 () ListLongMap!14471)

(declare-fun bm!45154 () Bool)

(assert (=> bm!45154 (= call!45157 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1070605 () Bool)

(declare-fun res!714244 () Bool)

(declare-fun e!611186 () Bool)

(assert (=> b!1070605 (=> (not res!714244) (not e!611186))))

(declare-fun lt!473033 () ListLongMap!14471)

(assert (=> b!1070605 (= res!714244 (not (contains!6287 lt!473033 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129117 () Bool)

(assert (=> d!129117 e!611186))

(declare-fun res!714242 () Bool)

(assert (=> d!129117 (=> (not res!714242) (not e!611186))))

(assert (=> d!129117 (= res!714242 (not (contains!6287 lt!473033 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!611183 () ListLongMap!14471)

(assert (=> d!129117 (= lt!473033 e!611183)))

(declare-fun c!107590 () Bool)

(assert (=> d!129117 (= c!107590 (bvsge #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(assert (=> d!129117 (validMask!0 mask!1515)))

(assert (=> d!129117 (= (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473033)))

(declare-fun b!1070606 () Bool)

(declare-fun e!611187 () ListLongMap!14471)

(assert (=> b!1070606 (= e!611183 e!611187)))

(declare-fun c!107591 () Bool)

(assert (=> b!1070606 (= c!107591 (validKeyInArray!0 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1070607 () Bool)

(assert (=> b!1070607 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(assert (=> b!1070607 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33461 _values!955)))))

(declare-fun e!611185 () Bool)

(assert (=> b!1070607 (= e!611185 (= (apply!922 lt!473033 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)) (get!17140 (select (arr!32923 _values!955) #b00000000000000000000000000000000) (dynLambda!2021 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1070608 () Bool)

(declare-fun e!611189 () Bool)

(assert (=> b!1070608 (= e!611189 (validKeyInArray!0 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070608 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1070609 () Bool)

(declare-fun e!611188 () Bool)

(assert (=> b!1070609 (= e!611188 (isEmpty!952 lt!473033))))

(declare-fun b!1070610 () Bool)

(declare-fun e!611184 () Bool)

(assert (=> b!1070610 (= e!611184 e!611185)))

(assert (=> b!1070610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(declare-fun res!714243 () Bool)

(assert (=> b!1070610 (= res!714243 (contains!6287 lt!473033 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070610 (=> (not res!714243) (not e!611185))))

(declare-fun b!1070611 () Bool)

(assert (=> b!1070611 (= e!611183 (ListLongMap!14472 Nil!23027))))

(declare-fun b!1070612 () Bool)

(assert (=> b!1070612 (= e!611184 e!611188)))

(declare-fun c!107589 () Bool)

(assert (=> b!1070612 (= c!107589 (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(declare-fun b!1070613 () Bool)

(assert (=> b!1070613 (= e!611188 (= lt!473033 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1070614 () Bool)

(declare-fun lt!473036 () Unit!35086)

(declare-fun lt!473037 () Unit!35086)

(assert (=> b!1070614 (= lt!473036 lt!473037)))

(declare-fun lt!473032 () (_ BitVec 64))

(declare-fun lt!473031 () (_ BitVec 64))

(declare-fun lt!473034 () V!39497)

(declare-fun lt!473035 () ListLongMap!14471)

(assert (=> b!1070614 (not (contains!6287 (+!3188 lt!473035 (tuple2!16503 lt!473031 lt!473034)) lt!473032))))

(assert (=> b!1070614 (= lt!473037 (addStillNotContains!258 lt!473035 lt!473031 lt!473034 lt!473032))))

(assert (=> b!1070614 (= lt!473032 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1070614 (= lt!473034 (get!17140 (select (arr!32923 _values!955) #b00000000000000000000000000000000) (dynLambda!2021 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1070614 (= lt!473031 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1070614 (= lt!473035 call!45157)))

(assert (=> b!1070614 (= e!611187 (+!3188 call!45157 (tuple2!16503 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000) (get!17140 (select (arr!32923 _values!955) #b00000000000000000000000000000000) (dynLambda!2021 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1070615 () Bool)

(assert (=> b!1070615 (= e!611186 e!611184)))

(declare-fun c!107592 () Bool)

(assert (=> b!1070615 (= c!107592 e!611189)))

(declare-fun res!714241 () Bool)

(assert (=> b!1070615 (=> (not res!714241) (not e!611189))))

(assert (=> b!1070615 (= res!714241 (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(declare-fun b!1070616 () Bool)

(assert (=> b!1070616 (= e!611187 call!45157)))

(assert (= (and d!129117 c!107590) b!1070611))

(assert (= (and d!129117 (not c!107590)) b!1070606))

(assert (= (and b!1070606 c!107591) b!1070614))

(assert (= (and b!1070606 (not c!107591)) b!1070616))

(assert (= (or b!1070614 b!1070616) bm!45154))

(assert (= (and d!129117 res!714242) b!1070605))

(assert (= (and b!1070605 res!714244) b!1070615))

(assert (= (and b!1070615 res!714241) b!1070608))

(assert (= (and b!1070615 c!107592) b!1070610))

(assert (= (and b!1070615 (not c!107592)) b!1070612))

(assert (= (and b!1070610 res!714243) b!1070607))

(assert (= (and b!1070612 c!107589) b!1070613))

(assert (= (and b!1070612 (not c!107589)) b!1070609))

(declare-fun b_lambda!16639 () Bool)

(assert (=> (not b_lambda!16639) (not b!1070607)))

(assert (=> b!1070607 t!32358))

(declare-fun b_and!34765 () Bool)

(assert (= b_and!34763 (and (=> t!32358 result!14759) b_and!34765)))

(declare-fun b_lambda!16641 () Bool)

(assert (=> (not b_lambda!16641) (not b!1070614)))

(assert (=> b!1070614 t!32358))

(declare-fun b_and!34767 () Bool)

(assert (= b_and!34765 (and (=> t!32358 result!14759) b_and!34767)))

(assert (=> b!1070610 m!988387))

(assert (=> b!1070610 m!988387))

(declare-fun m!988431 () Bool)

(assert (=> b!1070610 m!988431))

(declare-fun m!988433 () Bool)

(assert (=> bm!45154 m!988433))

(declare-fun m!988435 () Bool)

(assert (=> b!1070609 m!988435))

(declare-fun m!988437 () Bool)

(assert (=> d!129117 m!988437))

(assert (=> d!129117 m!988327))

(assert (=> b!1070606 m!988387))

(assert (=> b!1070606 m!988387))

(assert (=> b!1070606 m!988389))

(assert (=> b!1070607 m!988387))

(assert (=> b!1070607 m!988387))

(declare-fun m!988439 () Bool)

(assert (=> b!1070607 m!988439))

(assert (=> b!1070607 m!988415))

(assert (=> b!1070607 m!988417))

(assert (=> b!1070607 m!988415))

(assert (=> b!1070607 m!988417))

(assert (=> b!1070607 m!988419))

(assert (=> b!1070614 m!988387))

(declare-fun m!988441 () Bool)

(assert (=> b!1070614 m!988441))

(assert (=> b!1070614 m!988415))

(assert (=> b!1070614 m!988417))

(assert (=> b!1070614 m!988415))

(assert (=> b!1070614 m!988417))

(assert (=> b!1070614 m!988419))

(declare-fun m!988443 () Bool)

(assert (=> b!1070614 m!988443))

(declare-fun m!988445 () Bool)

(assert (=> b!1070614 m!988445))

(declare-fun m!988447 () Bool)

(assert (=> b!1070614 m!988447))

(assert (=> b!1070614 m!988443))

(assert (=> b!1070613 m!988433))

(assert (=> b!1070608 m!988387))

(assert (=> b!1070608 m!988387))

(assert (=> b!1070608 m!988389))

(declare-fun m!988449 () Bool)

(assert (=> b!1070605 m!988449))

(assert (=> b!1070491 d!129117))

(declare-fun d!129119 () Bool)

(assert (=> d!129119 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94686 d!129119))

(declare-fun d!129121 () Bool)

(assert (=> d!129121 (= (array_inv!25472 _values!955) (bvsge (size!33461 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94686 d!129121))

(declare-fun d!129123 () Bool)

(assert (=> d!129123 (= (array_inv!25473 _keys!1163) (bvsge (size!33462 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94686 d!129123))

(declare-fun bm!45169 () Bool)

(declare-fun call!45174 () ListLongMap!14471)

(declare-fun call!45176 () ListLongMap!14471)

(assert (=> bm!45169 (= call!45174 call!45176)))

(declare-fun b!1070659 () Bool)

(declare-fun e!611216 () Bool)

(declare-fun call!45172 () Bool)

(assert (=> b!1070659 (= e!611216 (not call!45172))))

(declare-fun b!1070660 () Bool)

(declare-fun e!611220 () Bool)

(declare-fun e!611224 () Bool)

(assert (=> b!1070660 (= e!611220 e!611224)))

(declare-fun res!714267 () Bool)

(declare-fun call!45178 () Bool)

(assert (=> b!1070660 (= res!714267 call!45178)))

(assert (=> b!1070660 (=> (not res!714267) (not e!611224))))

(declare-fun call!45175 () ListLongMap!14471)

(declare-fun c!107605 () Bool)

(declare-fun call!45177 () ListLongMap!14471)

(declare-fun call!45173 () ListLongMap!14471)

(declare-fun c!107607 () Bool)

(declare-fun bm!45170 () Bool)

(assert (=> bm!45170 (= call!45176 (+!3188 (ite c!107605 call!45177 (ite c!107607 call!45173 call!45175)) (ite (or c!107605 c!107607) (tuple2!16503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1070661 () Bool)

(declare-fun e!611217 () Unit!35086)

(declare-fun lt!473095 () Unit!35086)

(assert (=> b!1070661 (= e!611217 lt!473095)))

(declare-fun lt!473085 () ListLongMap!14471)

(assert (=> b!1070661 (= lt!473085 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473090 () (_ BitVec 64))

(assert (=> b!1070661 (= lt!473090 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473084 () (_ BitVec 64))

(assert (=> b!1070661 (= lt!473084 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473103 () Unit!35086)

(declare-fun addStillContains!636 (ListLongMap!14471 (_ BitVec 64) V!39497 (_ BitVec 64)) Unit!35086)

(assert (=> b!1070661 (= lt!473103 (addStillContains!636 lt!473085 lt!473090 zeroValueBefore!47 lt!473084))))

(assert (=> b!1070661 (contains!6287 (+!3188 lt!473085 (tuple2!16503 lt!473090 zeroValueBefore!47)) lt!473084)))

(declare-fun lt!473101 () Unit!35086)

(assert (=> b!1070661 (= lt!473101 lt!473103)))

(declare-fun lt!473083 () ListLongMap!14471)

(assert (=> b!1070661 (= lt!473083 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473092 () (_ BitVec 64))

(assert (=> b!1070661 (= lt!473092 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473097 () (_ BitVec 64))

(assert (=> b!1070661 (= lt!473097 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473086 () Unit!35086)

(declare-fun addApplyDifferent!492 (ListLongMap!14471 (_ BitVec 64) V!39497 (_ BitVec 64)) Unit!35086)

(assert (=> b!1070661 (= lt!473086 (addApplyDifferent!492 lt!473083 lt!473092 minValue!907 lt!473097))))

(assert (=> b!1070661 (= (apply!922 (+!3188 lt!473083 (tuple2!16503 lt!473092 minValue!907)) lt!473097) (apply!922 lt!473083 lt!473097))))

(declare-fun lt!473094 () Unit!35086)

(assert (=> b!1070661 (= lt!473094 lt!473086)))

(declare-fun lt!473089 () ListLongMap!14471)

(assert (=> b!1070661 (= lt!473089 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473087 () (_ BitVec 64))

(assert (=> b!1070661 (= lt!473087 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473082 () (_ BitVec 64))

(assert (=> b!1070661 (= lt!473082 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!473091 () Unit!35086)

(assert (=> b!1070661 (= lt!473091 (addApplyDifferent!492 lt!473089 lt!473087 zeroValueBefore!47 lt!473082))))

(assert (=> b!1070661 (= (apply!922 (+!3188 lt!473089 (tuple2!16503 lt!473087 zeroValueBefore!47)) lt!473082) (apply!922 lt!473089 lt!473082))))

(declare-fun lt!473093 () Unit!35086)

(assert (=> b!1070661 (= lt!473093 lt!473091)))

(declare-fun lt!473102 () ListLongMap!14471)

(assert (=> b!1070661 (= lt!473102 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473096 () (_ BitVec 64))

(assert (=> b!1070661 (= lt!473096 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!473100 () (_ BitVec 64))

(assert (=> b!1070661 (= lt!473100 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1070661 (= lt!473095 (addApplyDifferent!492 lt!473102 lt!473096 minValue!907 lt!473100))))

(assert (=> b!1070661 (= (apply!922 (+!3188 lt!473102 (tuple2!16503 lt!473096 minValue!907)) lt!473100) (apply!922 lt!473102 lt!473100))))

(declare-fun bm!45171 () Bool)

(declare-fun lt!473088 () ListLongMap!14471)

(assert (=> bm!45171 (= call!45178 (contains!6287 lt!473088 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1070662 () Bool)

(declare-fun e!611218 () Bool)

(assert (=> b!1070662 (= e!611218 (validKeyInArray!0 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45172 () Bool)

(assert (=> bm!45172 (= call!45175 call!45173)))

(declare-fun b!1070663 () Bool)

(assert (=> b!1070663 (= e!611224 (= (apply!922 lt!473088 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1070664 () Bool)

(declare-fun e!611226 () Bool)

(assert (=> b!1070664 (= e!611226 (= (apply!922 lt!473088 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1070665 () Bool)

(assert (=> b!1070665 (= e!611220 (not call!45178))))

(declare-fun bm!45173 () Bool)

(assert (=> bm!45173 (= call!45172 (contains!6287 lt!473088 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1070666 () Bool)

(declare-fun e!611219 () ListLongMap!14471)

(declare-fun e!611227 () ListLongMap!14471)

(assert (=> b!1070666 (= e!611219 e!611227)))

(assert (=> b!1070666 (= c!107607 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1070667 () Bool)

(assert (=> b!1070667 (= e!611216 e!611226)))

(declare-fun res!714265 () Bool)

(assert (=> b!1070667 (= res!714265 call!45172)))

(assert (=> b!1070667 (=> (not res!714265) (not e!611226))))

(declare-fun b!1070668 () Bool)

(declare-fun e!611223 () Bool)

(declare-fun e!611221 () Bool)

(assert (=> b!1070668 (= e!611223 e!611221)))

(declare-fun res!714269 () Bool)

(assert (=> b!1070668 (=> (not res!714269) (not e!611221))))

(assert (=> b!1070668 (= res!714269 (contains!6287 lt!473088 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1070668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(declare-fun b!1070669 () Bool)

(declare-fun res!714263 () Bool)

(declare-fun e!611228 () Bool)

(assert (=> b!1070669 (=> (not res!714263) (not e!611228))))

(assert (=> b!1070669 (= res!714263 e!611216)))

(declare-fun c!107609 () Bool)

(assert (=> b!1070669 (= c!107609 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070670 () Bool)

(declare-fun c!107606 () Bool)

(assert (=> b!1070670 (= c!107606 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!611225 () ListLongMap!14471)

(assert (=> b!1070670 (= e!611227 e!611225)))

(declare-fun b!1070671 () Bool)

(declare-fun Unit!35088 () Unit!35086)

(assert (=> b!1070671 (= e!611217 Unit!35088)))

(declare-fun b!1070672 () Bool)

(assert (=> b!1070672 (= e!611221 (= (apply!922 lt!473088 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)) (get!17140 (select (arr!32923 _values!955) #b00000000000000000000000000000000) (dynLambda!2021 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1070672 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33461 _values!955)))))

(assert (=> b!1070672 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(declare-fun b!1070673 () Bool)

(declare-fun e!611222 () Bool)

(assert (=> b!1070673 (= e!611222 (validKeyInArray!0 (select (arr!32924 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129125 () Bool)

(assert (=> d!129125 e!611228))

(declare-fun res!714271 () Bool)

(assert (=> d!129125 (=> (not res!714271) (not e!611228))))

(assert (=> d!129125 (= res!714271 (or (bvsge #b00000000000000000000000000000000 (size!33462 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))))

(declare-fun lt!473099 () ListLongMap!14471)

(assert (=> d!129125 (= lt!473088 lt!473099)))

(declare-fun lt!473098 () Unit!35086)

(assert (=> d!129125 (= lt!473098 e!611217)))

(declare-fun c!107608 () Bool)

(assert (=> d!129125 (= c!107608 e!611222)))

(declare-fun res!714266 () Bool)

(assert (=> d!129125 (=> (not res!714266) (not e!611222))))

(assert (=> d!129125 (= res!714266 (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(assert (=> d!129125 (= lt!473099 e!611219)))

(assert (=> d!129125 (= c!107605 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129125 (validMask!0 mask!1515)))

(assert (=> d!129125 (= (getCurrentListMap!4064 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!473088)))

(declare-fun b!1070674 () Bool)

(assert (=> b!1070674 (= e!611225 call!45174)))

(declare-fun b!1070675 () Bool)

(declare-fun res!714270 () Bool)

(assert (=> b!1070675 (=> (not res!714270) (not e!611228))))

(assert (=> b!1070675 (= res!714270 e!611223)))

(declare-fun res!714264 () Bool)

(assert (=> b!1070675 (=> res!714264 e!611223)))

(assert (=> b!1070675 (= res!714264 (not e!611218))))

(declare-fun res!714268 () Bool)

(assert (=> b!1070675 (=> (not res!714268) (not e!611218))))

(assert (=> b!1070675 (= res!714268 (bvslt #b00000000000000000000000000000000 (size!33462 _keys!1163)))))

(declare-fun b!1070676 () Bool)

(assert (=> b!1070676 (= e!611225 call!45175)))

(declare-fun b!1070677 () Bool)

(assert (=> b!1070677 (= e!611219 (+!3188 call!45176 (tuple2!16503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45174 () Bool)

(assert (=> bm!45174 (= call!45177 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070678 () Bool)

(assert (=> b!1070678 (= e!611227 call!45174)))

(declare-fun b!1070679 () Bool)

(assert (=> b!1070679 (= e!611228 e!611220)))

(declare-fun c!107610 () Bool)

(assert (=> b!1070679 (= c!107610 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45175 () Bool)

(assert (=> bm!45175 (= call!45173 call!45177)))

(assert (= (and d!129125 c!107605) b!1070677))

(assert (= (and d!129125 (not c!107605)) b!1070666))

(assert (= (and b!1070666 c!107607) b!1070678))

(assert (= (and b!1070666 (not c!107607)) b!1070670))

(assert (= (and b!1070670 c!107606) b!1070674))

(assert (= (and b!1070670 (not c!107606)) b!1070676))

(assert (= (or b!1070674 b!1070676) bm!45172))

(assert (= (or b!1070678 bm!45172) bm!45175))

(assert (= (or b!1070678 b!1070674) bm!45169))

(assert (= (or b!1070677 bm!45175) bm!45174))

(assert (= (or b!1070677 bm!45169) bm!45170))

(assert (= (and d!129125 res!714266) b!1070673))

(assert (= (and d!129125 c!107608) b!1070661))

(assert (= (and d!129125 (not c!107608)) b!1070671))

(assert (= (and d!129125 res!714271) b!1070675))

(assert (= (and b!1070675 res!714268) b!1070662))

(assert (= (and b!1070675 (not res!714264)) b!1070668))

(assert (= (and b!1070668 res!714269) b!1070672))

(assert (= (and b!1070675 res!714270) b!1070669))

(assert (= (and b!1070669 c!107609) b!1070667))

(assert (= (and b!1070669 (not c!107609)) b!1070659))

(assert (= (and b!1070667 res!714265) b!1070664))

(assert (= (or b!1070667 b!1070659) bm!45173))

(assert (= (and b!1070669 res!714263) b!1070679))

(assert (= (and b!1070679 c!107610) b!1070660))

(assert (= (and b!1070679 (not c!107610)) b!1070665))

(assert (= (and b!1070660 res!714267) b!1070663))

(assert (= (or b!1070660 b!1070665) bm!45171))

(declare-fun b_lambda!16643 () Bool)

(assert (=> (not b_lambda!16643) (not b!1070672)))

(assert (=> b!1070672 t!32358))

(declare-fun b_and!34769 () Bool)

(assert (= b_and!34767 (and (=> t!32358 result!14759) b_and!34769)))

(declare-fun m!988451 () Bool)

(assert (=> bm!45171 m!988451))

(declare-fun m!988453 () Bool)

(assert (=> b!1070663 m!988453))

(declare-fun m!988455 () Bool)

(assert (=> bm!45170 m!988455))

(assert (=> b!1070673 m!988387))

(assert (=> b!1070673 m!988387))

(assert (=> b!1070673 m!988389))

(declare-fun m!988457 () Bool)

(assert (=> b!1070664 m!988457))

(declare-fun m!988459 () Bool)

(assert (=> b!1070661 m!988459))

(assert (=> b!1070661 m!988459))

(declare-fun m!988461 () Bool)

(assert (=> b!1070661 m!988461))

(declare-fun m!988463 () Bool)

(assert (=> b!1070661 m!988463))

(declare-fun m!988465 () Bool)

(assert (=> b!1070661 m!988465))

(declare-fun m!988467 () Bool)

(assert (=> b!1070661 m!988467))

(declare-fun m!988469 () Bool)

(assert (=> b!1070661 m!988469))

(declare-fun m!988471 () Bool)

(assert (=> b!1070661 m!988471))

(assert (=> b!1070661 m!988463))

(declare-fun m!988473 () Bool)

(assert (=> b!1070661 m!988473))

(declare-fun m!988475 () Bool)

(assert (=> b!1070661 m!988475))

(declare-fun m!988477 () Bool)

(assert (=> b!1070661 m!988477))

(declare-fun m!988479 () Bool)

(assert (=> b!1070661 m!988479))

(declare-fun m!988481 () Bool)

(assert (=> b!1070661 m!988481))

(declare-fun m!988483 () Bool)

(assert (=> b!1070661 m!988483))

(assert (=> b!1070661 m!988469))

(declare-fun m!988485 () Bool)

(assert (=> b!1070661 m!988485))

(assert (=> b!1070661 m!988481))

(declare-fun m!988487 () Bool)

(assert (=> b!1070661 m!988487))

(assert (=> b!1070661 m!988387))

(assert (=> b!1070661 m!988337))

(assert (=> bm!45174 m!988337))

(declare-fun m!988489 () Bool)

(assert (=> bm!45173 m!988489))

(declare-fun m!988491 () Bool)

(assert (=> b!1070677 m!988491))

(assert (=> b!1070662 m!988387))

(assert (=> b!1070662 m!988387))

(assert (=> b!1070662 m!988389))

(assert (=> b!1070672 m!988417))

(assert (=> b!1070672 m!988415))

(assert (=> b!1070672 m!988417))

(assert (=> b!1070672 m!988419))

(assert (=> b!1070672 m!988387))

(declare-fun m!988493 () Bool)

(assert (=> b!1070672 m!988493))

(assert (=> b!1070672 m!988415))

(assert (=> b!1070672 m!988387))

(assert (=> b!1070668 m!988387))

(assert (=> b!1070668 m!988387))

(declare-fun m!988495 () Bool)

(assert (=> b!1070668 m!988495))

(assert (=> d!129125 m!988327))

(assert (=> b!1070488 d!129125))

(declare-fun condMapEmpty!40369 () Bool)

(declare-fun mapDefault!40369 () ValueCell!12182)

(assert (=> mapNonEmpty!40360 (= condMapEmpty!40369 (= mapRest!40360 ((as const (Array (_ BitVec 32) ValueCell!12182)) mapDefault!40369)))))

(declare-fun e!611234 () Bool)

(declare-fun mapRes!40369 () Bool)

(assert (=> mapNonEmpty!40360 (= tp!77339 (and e!611234 mapRes!40369))))

(declare-fun b!1070687 () Bool)

(assert (=> b!1070687 (= e!611234 tp_is_empty!25771)))

(declare-fun mapIsEmpty!40369 () Bool)

(assert (=> mapIsEmpty!40369 mapRes!40369))

(declare-fun mapNonEmpty!40369 () Bool)

(declare-fun tp!77354 () Bool)

(declare-fun e!611233 () Bool)

(assert (=> mapNonEmpty!40369 (= mapRes!40369 (and tp!77354 e!611233))))

(declare-fun mapRest!40369 () (Array (_ BitVec 32) ValueCell!12182))

(declare-fun mapValue!40369 () ValueCell!12182)

(declare-fun mapKey!40369 () (_ BitVec 32))

(assert (=> mapNonEmpty!40369 (= mapRest!40360 (store mapRest!40369 mapKey!40369 mapValue!40369))))

(declare-fun b!1070686 () Bool)

(assert (=> b!1070686 (= e!611233 tp_is_empty!25771)))

(assert (= (and mapNonEmpty!40360 condMapEmpty!40369) mapIsEmpty!40369))

(assert (= (and mapNonEmpty!40360 (not condMapEmpty!40369)) mapNonEmpty!40369))

(assert (= (and mapNonEmpty!40369 ((_ is ValueCellFull!12182) mapValue!40369)) b!1070686))

(assert (= (and mapNonEmpty!40360 ((_ is ValueCellFull!12182) mapDefault!40369)) b!1070687))

(declare-fun m!988497 () Bool)

(assert (=> mapNonEmpty!40369 m!988497))

(declare-fun b_lambda!16645 () Bool)

(assert (= b_lambda!16641 (or (and start!94686 b_free!21961) b_lambda!16645)))

(declare-fun b_lambda!16647 () Bool)

(assert (= b_lambda!16637 (or (and start!94686 b_free!21961) b_lambda!16647)))

(declare-fun b_lambda!16649 () Bool)

(assert (= b_lambda!16635 (or (and start!94686 b_free!21961) b_lambda!16649)))

(declare-fun b_lambda!16651 () Bool)

(assert (= b_lambda!16639 (or (and start!94686 b_free!21961) b_lambda!16651)))

(declare-fun b_lambda!16653 () Bool)

(assert (= b_lambda!16643 (or (and start!94686 b_free!21961) b_lambda!16653)))

(check-sat (not b!1070662) (not d!129117) (not b!1070596) (not b!1070551) (not b_lambda!16649) (not b!1070672) (not b!1070673) (not b!1070608) (not b!1070606) (not b!1070594) (not b!1070593) (not b!1070607) (not b!1070592) (not b!1070565) (not bm!45150) (not b!1070600) (not b_lambda!16647) (not b!1070599) (not b!1070661) (not bm!45173) (not b!1070663) (not b!1070562) b_and!34769 (not b!1070548) (not b!1070609) (not bm!45171) (not b_next!21961) (not b!1070595) (not b!1070613) (not bm!45147) (not b!1070591) (not b!1070610) (not d!129125) (not b!1070564) (not bm!45153) (not b!1070664) (not bm!45154) (not d!129113) (not b_lambda!16645) (not mapNonEmpty!40369) tp_is_empty!25771 (not b_lambda!16653) (not bm!45174) (not b!1070668) (not b!1070605) (not b_lambda!16651) (not d!129115) (not bm!45170) (not b!1070614) (not b!1070677))
(check-sat b_and!34769 (not b_next!21961))
