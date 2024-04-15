; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113222 () Bool)

(assert start!113222)

(declare-fun b_free!31273 () Bool)

(declare-fun b_next!31273 () Bool)

(assert (=> start!113222 (= b_free!31273 (not b_next!31273))))

(declare-fun tp!109624 () Bool)

(declare-fun b_and!50435 () Bool)

(assert (=> start!113222 (= tp!109624 b_and!50435)))

(declare-fun b!1343011 () Bool)

(declare-fun e!764493 () Bool)

(declare-fun tp_is_empty!37273 () Bool)

(assert (=> b!1343011 (= e!764493 tp_is_empty!37273)))

(declare-fun b!1343012 () Bool)

(declare-fun e!764494 () Bool)

(assert (=> b!1343012 (= e!764494 tp_is_empty!37273)))

(declare-fun b!1343013 () Bool)

(declare-fun e!764491 () Bool)

(assert (=> b!1343013 (= e!764491 (not true))))

(declare-datatypes ((V!54801 0))(
  ( (V!54802 (val!18711 Int)) )
))
(declare-datatypes ((tuple2!24164 0))(
  ( (tuple2!24165 (_1!12093 (_ BitVec 64)) (_2!12093 V!54801)) )
))
(declare-datatypes ((List!31309 0))(
  ( (Nil!31306) (Cons!31305 (h!32514 tuple2!24164) (t!45785 List!31309)) )
))
(declare-datatypes ((ListLongMap!21821 0))(
  ( (ListLongMap!21822 (toList!10926 List!31309)) )
))
(declare-fun lt!594570 () ListLongMap!21821)

(declare-fun zeroValue!1245 () V!54801)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9031 (ListLongMap!21821 (_ BitVec 64)) Bool)

(declare-fun +!4828 (ListLongMap!21821 tuple2!24164) ListLongMap!21821)

(assert (=> b!1343013 (contains!9031 (+!4828 lt!594570 (tuple2!24165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!43898 0))(
  ( (Unit!43899) )
))
(declare-fun lt!594569 () Unit!43898)

(declare-fun addStillContains!1192 (ListLongMap!21821 (_ BitVec 64) V!54801 (_ BitVec 64)) Unit!43898)

(assert (=> b!1343013 (= lt!594569 (addStillContains!1192 lt!594570 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343013 (contains!9031 lt!594570 k0!1142)))

(declare-datatypes ((array!91335 0))(
  ( (array!91336 (arr!44124 (Array (_ BitVec 32) (_ BitVec 64))) (size!44676 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91335)

(declare-fun lt!594573 () V!54801)

(declare-fun lt!594571 () Unit!43898)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!367 ((_ BitVec 64) (_ BitVec 64) V!54801 ListLongMap!21821) Unit!43898)

(assert (=> b!1343013 (= lt!594571 (lemmaInListMapAfterAddingDiffThenInBefore!367 k0!1142 (select (arr!44124 _keys!1571) from!1960) lt!594573 lt!594570))))

(declare-fun lt!594572 () ListLongMap!21821)

(assert (=> b!1343013 (contains!9031 lt!594572 k0!1142)))

(declare-fun lt!594568 () Unit!43898)

(assert (=> b!1343013 (= lt!594568 (lemmaInListMapAfterAddingDiffThenInBefore!367 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594572))))

(assert (=> b!1343013 (= lt!594572 (+!4828 lt!594570 (tuple2!24165 (select (arr!44124 _keys!1571) from!1960) lt!594573)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17738 0))(
  ( (ValueCellFull!17738 (v!21358 V!54801)) (EmptyCell!17738) )
))
(declare-datatypes ((array!91337 0))(
  ( (array!91338 (arr!44125 (Array (_ BitVec 32) ValueCell!17738)) (size!44677 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91337)

(declare-fun get!22292 (ValueCell!17738 V!54801) V!54801)

(declare-fun dynLambda!3758 (Int (_ BitVec 64)) V!54801)

(assert (=> b!1343013 (= lt!594573 (get!22292 (select (arr!44125 _values!1303) from!1960) (dynLambda!3758 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54801)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6471 (array!91335 array!91337 (_ BitVec 32) (_ BitVec 32) V!54801 V!54801 (_ BitVec 32) Int) ListLongMap!21821)

(assert (=> b!1343013 (= lt!594570 (getCurrentListMapNoExtraKeys!6471 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapNonEmpty!57616 () Bool)

(declare-fun mapRes!57616 () Bool)

(declare-fun tp!109625 () Bool)

(assert (=> mapNonEmpty!57616 (= mapRes!57616 (and tp!109625 e!764493))))

(declare-fun mapValue!57616 () ValueCell!17738)

(declare-fun mapRest!57616 () (Array (_ BitVec 32) ValueCell!17738))

(declare-fun mapKey!57616 () (_ BitVec 32))

(assert (=> mapNonEmpty!57616 (= (arr!44125 _values!1303) (store mapRest!57616 mapKey!57616 mapValue!57616))))

(declare-fun b!1343014 () Bool)

(declare-fun res!891053 () Bool)

(assert (=> b!1343014 (=> (not res!891053) (not e!764491))))

(assert (=> b!1343014 (= res!891053 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!891060 () Bool)

(assert (=> start!113222 (=> (not res!891060) (not e!764491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113222 (= res!891060 (validMask!0 mask!1977))))

(assert (=> start!113222 e!764491))

(assert (=> start!113222 tp_is_empty!37273))

(assert (=> start!113222 true))

(declare-fun array_inv!33451 (array!91335) Bool)

(assert (=> start!113222 (array_inv!33451 _keys!1571)))

(declare-fun e!764495 () Bool)

(declare-fun array_inv!33452 (array!91337) Bool)

(assert (=> start!113222 (and (array_inv!33452 _values!1303) e!764495)))

(assert (=> start!113222 tp!109624))

(declare-fun b!1343015 () Bool)

(declare-fun res!891059 () Bool)

(assert (=> b!1343015 (=> (not res!891059) (not e!764491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91335 (_ BitVec 32)) Bool)

(assert (=> b!1343015 (= res!891059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343016 () Bool)

(declare-fun res!891058 () Bool)

(assert (=> b!1343016 (=> (not res!891058) (not e!764491))))

(assert (=> b!1343016 (= res!891058 (and (= (size!44677 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44676 _keys!1571) (size!44677 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343017 () Bool)

(declare-fun res!891057 () Bool)

(assert (=> b!1343017 (=> (not res!891057) (not e!764491))))

(declare-fun getCurrentListMap!5775 (array!91335 array!91337 (_ BitVec 32) (_ BitVec 32) V!54801 V!54801 (_ BitVec 32) Int) ListLongMap!21821)

(assert (=> b!1343017 (= res!891057 (contains!9031 (getCurrentListMap!5775 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343018 () Bool)

(declare-fun res!891056 () Bool)

(assert (=> b!1343018 (=> (not res!891056) (not e!764491))))

(assert (=> b!1343018 (= res!891056 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44676 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343019 () Bool)

(assert (=> b!1343019 (= e!764495 (and e!764494 mapRes!57616))))

(declare-fun condMapEmpty!57616 () Bool)

(declare-fun mapDefault!57616 () ValueCell!17738)

(assert (=> b!1343019 (= condMapEmpty!57616 (= (arr!44125 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17738)) mapDefault!57616)))))

(declare-fun b!1343020 () Bool)

(declare-fun res!891061 () Bool)

(assert (=> b!1343020 (=> (not res!891061) (not e!764491))))

(assert (=> b!1343020 (= res!891061 (not (= (select (arr!44124 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57616 () Bool)

(assert (=> mapIsEmpty!57616 mapRes!57616))

(declare-fun b!1343021 () Bool)

(declare-fun res!891055 () Bool)

(assert (=> b!1343021 (=> (not res!891055) (not e!764491))))

(declare-datatypes ((List!31310 0))(
  ( (Nil!31307) (Cons!31306 (h!32515 (_ BitVec 64)) (t!45786 List!31310)) )
))
(declare-fun arrayNoDuplicates!0 (array!91335 (_ BitVec 32) List!31310) Bool)

(assert (=> b!1343021 (= res!891055 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31307))))

(declare-fun b!1343022 () Bool)

(declare-fun res!891054 () Bool)

(assert (=> b!1343022 (=> (not res!891054) (not e!764491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343022 (= res!891054 (validKeyInArray!0 (select (arr!44124 _keys!1571) from!1960)))))

(assert (= (and start!113222 res!891060) b!1343016))

(assert (= (and b!1343016 res!891058) b!1343015))

(assert (= (and b!1343015 res!891059) b!1343021))

(assert (= (and b!1343021 res!891055) b!1343018))

(assert (= (and b!1343018 res!891056) b!1343017))

(assert (= (and b!1343017 res!891057) b!1343020))

(assert (= (and b!1343020 res!891061) b!1343022))

(assert (= (and b!1343022 res!891054) b!1343014))

(assert (= (and b!1343014 res!891053) b!1343013))

(assert (= (and b!1343019 condMapEmpty!57616) mapIsEmpty!57616))

(assert (= (and b!1343019 (not condMapEmpty!57616)) mapNonEmpty!57616))

(get-info :version)

(assert (= (and mapNonEmpty!57616 ((_ is ValueCellFull!17738) mapValue!57616)) b!1343011))

(assert (= (and b!1343019 ((_ is ValueCellFull!17738) mapDefault!57616)) b!1343012))

(assert (= start!113222 b!1343019))

(declare-fun b_lambda!24439 () Bool)

(assert (=> (not b_lambda!24439) (not b!1343013)))

(declare-fun t!45784 () Bool)

(declare-fun tb!12279 () Bool)

(assert (=> (and start!113222 (= defaultEntry!1306 defaultEntry!1306) t!45784) tb!12279))

(declare-fun result!25657 () Bool)

(assert (=> tb!12279 (= result!25657 tp_is_empty!37273)))

(assert (=> b!1343013 t!45784))

(declare-fun b_and!50437 () Bool)

(assert (= b_and!50435 (and (=> t!45784 result!25657) b_and!50437)))

(declare-fun m!1230223 () Bool)

(assert (=> b!1343022 m!1230223))

(assert (=> b!1343022 m!1230223))

(declare-fun m!1230225 () Bool)

(assert (=> b!1343022 m!1230225))

(declare-fun m!1230227 () Bool)

(assert (=> mapNonEmpty!57616 m!1230227))

(assert (=> b!1343020 m!1230223))

(declare-fun m!1230229 () Bool)

(assert (=> start!113222 m!1230229))

(declare-fun m!1230231 () Bool)

(assert (=> start!113222 m!1230231))

(declare-fun m!1230233 () Bool)

(assert (=> start!113222 m!1230233))

(declare-fun m!1230235 () Bool)

(assert (=> b!1343021 m!1230235))

(declare-fun m!1230237 () Bool)

(assert (=> b!1343015 m!1230237))

(declare-fun m!1230239 () Bool)

(assert (=> b!1343017 m!1230239))

(assert (=> b!1343017 m!1230239))

(declare-fun m!1230241 () Bool)

(assert (=> b!1343017 m!1230241))

(declare-fun m!1230243 () Bool)

(assert (=> b!1343013 m!1230243))

(declare-fun m!1230245 () Bool)

(assert (=> b!1343013 m!1230245))

(declare-fun m!1230247 () Bool)

(assert (=> b!1343013 m!1230247))

(declare-fun m!1230249 () Bool)

(assert (=> b!1343013 m!1230249))

(assert (=> b!1343013 m!1230243))

(declare-fun m!1230251 () Bool)

(assert (=> b!1343013 m!1230251))

(declare-fun m!1230253 () Bool)

(assert (=> b!1343013 m!1230253))

(declare-fun m!1230255 () Bool)

(assert (=> b!1343013 m!1230255))

(assert (=> b!1343013 m!1230245))

(declare-fun m!1230257 () Bool)

(assert (=> b!1343013 m!1230257))

(assert (=> b!1343013 m!1230223))

(declare-fun m!1230259 () Bool)

(assert (=> b!1343013 m!1230259))

(assert (=> b!1343013 m!1230223))

(assert (=> b!1343013 m!1230251))

(declare-fun m!1230261 () Bool)

(assert (=> b!1343013 m!1230261))

(declare-fun m!1230263 () Bool)

(assert (=> b!1343013 m!1230263))

(declare-fun m!1230265 () Bool)

(assert (=> b!1343013 m!1230265))

(check-sat (not b_next!31273) b_and!50437 (not b!1343013) (not b!1343021) tp_is_empty!37273 (not start!113222) (not b!1343017) (not mapNonEmpty!57616) (not b!1343015) (not b_lambda!24439) (not b!1343022))
(check-sat b_and!50437 (not b_next!31273))
