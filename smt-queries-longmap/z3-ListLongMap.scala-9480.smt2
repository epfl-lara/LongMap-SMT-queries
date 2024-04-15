; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112488 () Bool)

(assert start!112488)

(declare-fun b_free!30883 () Bool)

(declare-fun b_next!30883 () Bool)

(assert (=> start!112488 (= b_free!30883 (not b_next!30883))))

(declare-fun tp!108286 () Bool)

(declare-fun b_and!49749 () Bool)

(assert (=> start!112488 (= tp!108286 b_and!49749)))

(declare-fun b!1334013 () Bool)

(declare-fun e!759837 () Bool)

(declare-fun e!759838 () Bool)

(declare-fun mapRes!56863 () Bool)

(assert (=> b!1334013 (= e!759837 (and e!759838 mapRes!56863))))

(declare-fun condMapEmpty!56863 () Bool)

(declare-datatypes ((V!54161 0))(
  ( (V!54162 (val!18471 Int)) )
))
(declare-datatypes ((ValueCell!17498 0))(
  ( (ValueCellFull!17498 (v!21107 V!54161)) (EmptyCell!17498) )
))
(declare-datatypes ((array!90399 0))(
  ( (array!90400 (arr!43666 (Array (_ BitVec 32) ValueCell!17498)) (size!44218 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90399)

(declare-fun mapDefault!56863 () ValueCell!17498)

(assert (=> b!1334013 (= condMapEmpty!56863 (= (arr!43666 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17498)) mapDefault!56863)))))

(declare-fun b!1334014 () Bool)

(declare-fun e!759841 () Bool)

(declare-fun tp_is_empty!36793 () Bool)

(assert (=> b!1334014 (= e!759841 tp_is_empty!36793)))

(declare-fun b!1334015 () Bool)

(assert (=> b!1334015 (= e!759838 tp_is_empty!36793)))

(declare-fun b!1334016 () Bool)

(declare-fun res!885345 () Bool)

(declare-fun e!759836 () Bool)

(assert (=> b!1334016 (=> (not res!885345) (not e!759836))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90401 0))(
  ( (array!90402 (arr!43667 (Array (_ BitVec 32) (_ BitVec 64))) (size!44219 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90401)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334016 (= res!885345 (not (= (select (arr!43667 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapNonEmpty!56863 () Bool)

(declare-fun tp!108287 () Bool)

(assert (=> mapNonEmpty!56863 (= mapRes!56863 (and tp!108287 e!759841))))

(declare-fun mapRest!56863 () (Array (_ BitVec 32) ValueCell!17498))

(declare-fun mapKey!56863 () (_ BitVec 32))

(declare-fun mapValue!56863 () ValueCell!17498)

(assert (=> mapNonEmpty!56863 (= (arr!43666 _values!1320) (store mapRest!56863 mapKey!56863 mapValue!56863))))

(declare-fun b!1334017 () Bool)

(declare-fun res!885349 () Bool)

(assert (=> b!1334017 (=> (not res!885349) (not e!759836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334017 (= res!885349 (validKeyInArray!0 (select (arr!43667 _keys!1590) from!1980)))))

(declare-fun mapIsEmpty!56863 () Bool)

(assert (=> mapIsEmpty!56863 mapRes!56863))

(declare-fun b!1334012 () Bool)

(declare-fun res!885354 () Bool)

(declare-fun e!759840 () Bool)

(assert (=> b!1334012 (=> (not res!885354) (not e!759840))))

(assert (=> b!1334012 (= res!885354 (not (= k0!1153 (select (arr!43667 _keys!1590) from!1980))))))

(declare-fun res!885347 () Bool)

(assert (=> start!112488 (=> (not res!885347) (not e!759836))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112488 (= res!885347 (validMask!0 mask!1998))))

(assert (=> start!112488 e!759836))

(declare-fun array_inv!33129 (array!90399) Bool)

(assert (=> start!112488 (and (array_inv!33129 _values!1320) e!759837)))

(assert (=> start!112488 true))

(declare-fun array_inv!33130 (array!90401) Bool)

(assert (=> start!112488 (array_inv!33130 _keys!1590)))

(assert (=> start!112488 tp!108286))

(assert (=> start!112488 tp_is_empty!36793))

(declare-fun b!1334018 () Bool)

(declare-fun res!885353 () Bool)

(assert (=> b!1334018 (=> (not res!885353) (not e!759836))))

(declare-datatypes ((List!31015 0))(
  ( (Nil!31012) (Cons!31011 (h!32220 (_ BitVec 64)) (t!45249 List!31015)) )
))
(declare-fun arrayNoDuplicates!0 (array!90401 (_ BitVec 32) List!31015) Bool)

(assert (=> b!1334018 (= res!885353 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31012))))

(declare-fun b!1334019 () Bool)

(declare-fun res!885346 () Bool)

(assert (=> b!1334019 (=> (not res!885346) (not e!759836))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334019 (= res!885346 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44219 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334020 () Bool)

(assert (=> b!1334020 (= e!759840 (not true))))

(declare-datatypes ((tuple2!23878 0))(
  ( (tuple2!23879 (_1!11950 (_ BitVec 64)) (_2!11950 V!54161)) )
))
(declare-datatypes ((List!31016 0))(
  ( (Nil!31013) (Cons!31012 (h!32221 tuple2!23878) (t!45250 List!31016)) )
))
(declare-datatypes ((ListLongMap!21535 0))(
  ( (ListLongMap!21536 (toList!10783 List!31016)) )
))
(declare-fun lt!592078 () ListLongMap!21535)

(declare-fun contains!8875 (ListLongMap!21535 (_ BitVec 64)) Bool)

(assert (=> b!1334020 (contains!8875 lt!592078 k0!1153)))

(declare-fun lt!592076 () V!54161)

(declare-datatypes ((Unit!43688 0))(
  ( (Unit!43689) )
))
(declare-fun lt!592077 () Unit!43688)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!294 ((_ BitVec 64) (_ BitVec 64) V!54161 ListLongMap!21535) Unit!43688)

(assert (=> b!1334020 (= lt!592077 (lemmaInListMapAfterAddingDiffThenInBefore!294 k0!1153 (select (arr!43667 _keys!1590) from!1980) lt!592076 lt!592078))))

(declare-fun b!1334021 () Bool)

(declare-fun res!885348 () Bool)

(assert (=> b!1334021 (=> (not res!885348) (not e!759836))))

(assert (=> b!1334021 (= res!885348 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334022 () Bool)

(declare-fun res!885352 () Bool)

(assert (=> b!1334022 (=> (not res!885352) (not e!759836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90401 (_ BitVec 32)) Bool)

(assert (=> b!1334022 (= res!885352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334023 () Bool)

(assert (=> b!1334023 (= e!759836 e!759840)))

(declare-fun res!885350 () Bool)

(assert (=> b!1334023 (=> (not res!885350) (not e!759840))))

(declare-fun +!4744 (ListLongMap!21535 tuple2!23878) ListLongMap!21535)

(assert (=> b!1334023 (= res!885350 (contains!8875 (+!4744 lt!592078 (tuple2!23879 (select (arr!43667 _keys!1590) from!1980) lt!592076)) k0!1153))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54161)

(declare-fun zeroValue!1262 () V!54161)

(declare-fun getCurrentListMapNoExtraKeys!6382 (array!90401 array!90399 (_ BitVec 32) (_ BitVec 32) V!54161 V!54161 (_ BitVec 32) Int) ListLongMap!21535)

(assert (=> b!1334023 (= lt!592078 (getCurrentListMapNoExtraKeys!6382 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22035 (ValueCell!17498 V!54161) V!54161)

(declare-fun dynLambda!3674 (Int (_ BitVec 64)) V!54161)

(assert (=> b!1334023 (= lt!592076 (get!22035 (select (arr!43666 _values!1320) from!1980) (dynLambda!3674 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334024 () Bool)

(declare-fun res!885351 () Bool)

(assert (=> b!1334024 (=> (not res!885351) (not e!759836))))

(assert (=> b!1334024 (= res!885351 (and (= (size!44218 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44219 _keys!1590) (size!44218 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334025 () Bool)

(declare-fun res!885355 () Bool)

(assert (=> b!1334025 (=> (not res!885355) (not e!759836))))

(declare-fun getCurrentListMap!5637 (array!90401 array!90399 (_ BitVec 32) (_ BitVec 32) V!54161 V!54161 (_ BitVec 32) Int) ListLongMap!21535)

(assert (=> b!1334025 (= res!885355 (contains!8875 (getCurrentListMap!5637 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112488 res!885347) b!1334024))

(assert (= (and b!1334024 res!885351) b!1334022))

(assert (= (and b!1334022 res!885352) b!1334018))

(assert (= (and b!1334018 res!885353) b!1334019))

(assert (= (and b!1334019 res!885346) b!1334025))

(assert (= (and b!1334025 res!885355) b!1334016))

(assert (= (and b!1334016 res!885345) b!1334017))

(assert (= (and b!1334017 res!885349) b!1334021))

(assert (= (and b!1334021 res!885348) b!1334023))

(assert (= (and b!1334023 res!885350) b!1334012))

(assert (= (and b!1334012 res!885354) b!1334020))

(assert (= (and b!1334013 condMapEmpty!56863) mapIsEmpty!56863))

(assert (= (and b!1334013 (not condMapEmpty!56863)) mapNonEmpty!56863))

(get-info :version)

(assert (= (and mapNonEmpty!56863 ((_ is ValueCellFull!17498) mapValue!56863)) b!1334014))

(assert (= (and b!1334013 ((_ is ValueCellFull!17498) mapDefault!56863)) b!1334015))

(assert (= start!112488 b!1334013))

(declare-fun b_lambda!24079 () Bool)

(assert (=> (not b_lambda!24079) (not b!1334023)))

(declare-fun t!45248 () Bool)

(declare-fun tb!12037 () Bool)

(assert (=> (and start!112488 (= defaultEntry!1323 defaultEntry!1323) t!45248) tb!12037))

(declare-fun result!25153 () Bool)

(assert (=> tb!12037 (= result!25153 tp_is_empty!36793)))

(assert (=> b!1334023 t!45248))

(declare-fun b_and!49751 () Bool)

(assert (= b_and!49749 (and (=> t!45248 result!25153) b_and!49751)))

(declare-fun m!1221999 () Bool)

(assert (=> b!1334018 m!1221999))

(declare-fun m!1222001 () Bool)

(assert (=> mapNonEmpty!56863 m!1222001))

(declare-fun m!1222003 () Bool)

(assert (=> b!1334016 m!1222003))

(assert (=> b!1334012 m!1222003))

(declare-fun m!1222005 () Bool)

(assert (=> b!1334020 m!1222005))

(assert (=> b!1334020 m!1222003))

(assert (=> b!1334020 m!1222003))

(declare-fun m!1222007 () Bool)

(assert (=> b!1334020 m!1222007))

(declare-fun m!1222009 () Bool)

(assert (=> b!1334023 m!1222009))

(declare-fun m!1222011 () Bool)

(assert (=> b!1334023 m!1222011))

(assert (=> b!1334023 m!1222009))

(declare-fun m!1222013 () Bool)

(assert (=> b!1334023 m!1222013))

(declare-fun m!1222015 () Bool)

(assert (=> b!1334023 m!1222015))

(assert (=> b!1334023 m!1222015))

(declare-fun m!1222017 () Bool)

(assert (=> b!1334023 m!1222017))

(declare-fun m!1222019 () Bool)

(assert (=> b!1334023 m!1222019))

(assert (=> b!1334023 m!1222011))

(assert (=> b!1334023 m!1222003))

(assert (=> b!1334017 m!1222003))

(assert (=> b!1334017 m!1222003))

(declare-fun m!1222021 () Bool)

(assert (=> b!1334017 m!1222021))

(declare-fun m!1222023 () Bool)

(assert (=> b!1334022 m!1222023))

(declare-fun m!1222025 () Bool)

(assert (=> start!112488 m!1222025))

(declare-fun m!1222027 () Bool)

(assert (=> start!112488 m!1222027))

(declare-fun m!1222029 () Bool)

(assert (=> start!112488 m!1222029))

(declare-fun m!1222031 () Bool)

(assert (=> b!1334025 m!1222031))

(assert (=> b!1334025 m!1222031))

(declare-fun m!1222033 () Bool)

(assert (=> b!1334025 m!1222033))

(check-sat b_and!49751 (not b!1334022) (not b!1334025) (not start!112488) (not b!1334017) (not mapNonEmpty!56863) (not b!1334023) (not b!1334018) (not b_next!30883) (not b_lambda!24079) (not b!1334020) tp_is_empty!36793)
(check-sat b_and!49751 (not b_next!30883))
