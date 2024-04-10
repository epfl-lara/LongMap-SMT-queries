; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113170 () Bool)

(assert start!113170)

(declare-fun b_free!31221 () Bool)

(declare-fun b_next!31221 () Bool)

(assert (=> start!113170 (= b_free!31221 (not b_next!31221))))

(declare-fun tp!109467 () Bool)

(declare-fun b_and!50349 () Bool)

(assert (=> start!113170 (= tp!109467 b_and!50349)))

(declare-fun b!1342093 () Bool)

(declare-fun e!764138 () Bool)

(assert (=> b!1342093 (= e!764138 (not true))))

(declare-datatypes ((V!54731 0))(
  ( (V!54732 (val!18685 Int)) )
))
(declare-datatypes ((tuple2!24068 0))(
  ( (tuple2!24069 (_1!12045 (_ BitVec 64)) (_2!12045 V!54731)) )
))
(declare-datatypes ((List!31224 0))(
  ( (Nil!31221) (Cons!31220 (h!32429 tuple2!24068) (t!45656 List!31224)) )
))
(declare-datatypes ((ListLongMap!21725 0))(
  ( (ListLongMap!21726 (toList!10878 List!31224)) )
))
(declare-fun lt!594345 () ListLongMap!21725)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9054 (ListLongMap!21725 (_ BitVec 64)) Bool)

(assert (=> b!1342093 (contains!9054 lt!594345 k0!1142)))

(declare-datatypes ((array!91294 0))(
  ( (array!91295 (arr!44103 (Array (_ BitVec 32) (_ BitVec 64))) (size!44653 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91294)

(declare-datatypes ((Unit!44055 0))(
  ( (Unit!44056) )
))
(declare-fun lt!594348 () Unit!44055)

(declare-fun lt!594347 () V!54731)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!358 ((_ BitVec 64) (_ BitVec 64) V!54731 ListLongMap!21725) Unit!44055)

(assert (=> b!1342093 (= lt!594348 (lemmaInListMapAfterAddingDiffThenInBefore!358 k0!1142 (select (arr!44103 _keys!1571) from!1960) lt!594347 lt!594345))))

(declare-fun lt!594344 () ListLongMap!21725)

(assert (=> b!1342093 (contains!9054 lt!594344 k0!1142)))

(declare-fun zeroValue!1245 () V!54731)

(declare-fun lt!594346 () Unit!44055)

(assert (=> b!1342093 (= lt!594346 (lemmaInListMapAfterAddingDiffThenInBefore!358 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594344))))

(declare-fun +!4789 (ListLongMap!21725 tuple2!24068) ListLongMap!21725)

(assert (=> b!1342093 (= lt!594344 (+!4789 lt!594345 (tuple2!24069 (select (arr!44103 _keys!1571) from!1960) lt!594347)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17712 0))(
  ( (ValueCellFull!17712 (v!21333 V!54731)) (EmptyCell!17712) )
))
(declare-datatypes ((array!91296 0))(
  ( (array!91297 (arr!44104 (Array (_ BitVec 32) ValueCell!17712)) (size!44654 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91296)

(declare-fun get!22268 (ValueCell!17712 V!54731) V!54731)

(declare-fun dynLambda!3728 (Int (_ BitVec 64)) V!54731)

(assert (=> b!1342093 (= lt!594347 (get!22268 (select (arr!44104 _values!1303) from!1960) (dynLambda!3728 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54731)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6431 (array!91294 array!91296 (_ BitVec 32) (_ BitVec 32) V!54731 V!54731 (_ BitVec 32) Int) ListLongMap!21725)

(assert (=> b!1342093 (= lt!594345 (getCurrentListMapNoExtraKeys!6431 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342094 () Bool)

(declare-fun res!890381 () Bool)

(assert (=> b!1342094 (=> (not res!890381) (not e!764138))))

(assert (=> b!1342094 (= res!890381 (and (= (size!44654 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44653 _keys!1571) (size!44654 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342095 () Bool)

(declare-fun res!890383 () Bool)

(assert (=> b!1342095 (=> (not res!890383) (not e!764138))))

(assert (=> b!1342095 (= res!890383 (not (= (select (arr!44103 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapNonEmpty!57538 () Bool)

(declare-fun mapRes!57538 () Bool)

(declare-fun tp!109468 () Bool)

(declare-fun e!764134 () Bool)

(assert (=> mapNonEmpty!57538 (= mapRes!57538 (and tp!109468 e!764134))))

(declare-fun mapRest!57538 () (Array (_ BitVec 32) ValueCell!17712))

(declare-fun mapValue!57538 () ValueCell!17712)

(declare-fun mapKey!57538 () (_ BitVec 32))

(assert (=> mapNonEmpty!57538 (= (arr!44104 _values!1303) (store mapRest!57538 mapKey!57538 mapValue!57538))))

(declare-fun b!1342096 () Bool)

(declare-fun res!890382 () Bool)

(assert (=> b!1342096 (=> (not res!890382) (not e!764138))))

(declare-datatypes ((List!31225 0))(
  ( (Nil!31222) (Cons!31221 (h!32430 (_ BitVec 64)) (t!45657 List!31225)) )
))
(declare-fun arrayNoDuplicates!0 (array!91294 (_ BitVec 32) List!31225) Bool)

(assert (=> b!1342096 (= res!890382 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31222))))

(declare-fun res!890380 () Bool)

(assert (=> start!113170 (=> (not res!890380) (not e!764138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113170 (= res!890380 (validMask!0 mask!1977))))

(assert (=> start!113170 e!764138))

(declare-fun tp_is_empty!37221 () Bool)

(assert (=> start!113170 tp_is_empty!37221))

(assert (=> start!113170 true))

(declare-fun array_inv!33247 (array!91294) Bool)

(assert (=> start!113170 (array_inv!33247 _keys!1571)))

(declare-fun e!764137 () Bool)

(declare-fun array_inv!33248 (array!91296) Bool)

(assert (=> start!113170 (and (array_inv!33248 _values!1303) e!764137)))

(assert (=> start!113170 tp!109467))

(declare-fun b!1342097 () Bool)

(declare-fun res!890387 () Bool)

(assert (=> b!1342097 (=> (not res!890387) (not e!764138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342097 (= res!890387 (validKeyInArray!0 (select (arr!44103 _keys!1571) from!1960)))))

(declare-fun b!1342098 () Bool)

(declare-fun res!890386 () Bool)

(assert (=> b!1342098 (=> (not res!890386) (not e!764138))))

(declare-fun getCurrentListMap!5842 (array!91294 array!91296 (_ BitVec 32) (_ BitVec 32) V!54731 V!54731 (_ BitVec 32) Int) ListLongMap!21725)

(assert (=> b!1342098 (= res!890386 (contains!9054 (getCurrentListMap!5842 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342099 () Bool)

(declare-fun e!764135 () Bool)

(assert (=> b!1342099 (= e!764137 (and e!764135 mapRes!57538))))

(declare-fun condMapEmpty!57538 () Bool)

(declare-fun mapDefault!57538 () ValueCell!17712)

(assert (=> b!1342099 (= condMapEmpty!57538 (= (arr!44104 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17712)) mapDefault!57538)))))

(declare-fun b!1342100 () Bool)

(assert (=> b!1342100 (= e!764135 tp_is_empty!37221)))

(declare-fun b!1342101 () Bool)

(declare-fun res!890385 () Bool)

(assert (=> b!1342101 (=> (not res!890385) (not e!764138))))

(assert (=> b!1342101 (= res!890385 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44653 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342102 () Bool)

(declare-fun res!890384 () Bool)

(assert (=> b!1342102 (=> (not res!890384) (not e!764138))))

(assert (=> b!1342102 (= res!890384 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342103 () Bool)

(assert (=> b!1342103 (= e!764134 tp_is_empty!37221)))

(declare-fun b!1342104 () Bool)

(declare-fun res!890388 () Bool)

(assert (=> b!1342104 (=> (not res!890388) (not e!764138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91294 (_ BitVec 32)) Bool)

(assert (=> b!1342104 (= res!890388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57538 () Bool)

(assert (=> mapIsEmpty!57538 mapRes!57538))

(assert (= (and start!113170 res!890380) b!1342094))

(assert (= (and b!1342094 res!890381) b!1342104))

(assert (= (and b!1342104 res!890388) b!1342096))

(assert (= (and b!1342096 res!890382) b!1342101))

(assert (= (and b!1342101 res!890385) b!1342098))

(assert (= (and b!1342098 res!890386) b!1342095))

(assert (= (and b!1342095 res!890383) b!1342097))

(assert (= (and b!1342097 res!890387) b!1342102))

(assert (= (and b!1342102 res!890384) b!1342093))

(assert (= (and b!1342099 condMapEmpty!57538) mapIsEmpty!57538))

(assert (= (and b!1342099 (not condMapEmpty!57538)) mapNonEmpty!57538))

(get-info :version)

(assert (= (and mapNonEmpty!57538 ((_ is ValueCellFull!17712) mapValue!57538)) b!1342103))

(assert (= (and b!1342099 ((_ is ValueCellFull!17712) mapDefault!57538)) b!1342100))

(assert (= start!113170 b!1342099))

(declare-fun b_lambda!24397 () Bool)

(assert (=> (not b_lambda!24397) (not b!1342093)))

(declare-fun t!45655 () Bool)

(declare-fun tb!12235 () Bool)

(assert (=> (and start!113170 (= defaultEntry!1306 defaultEntry!1306) t!45655) tb!12235))

(declare-fun result!25561 () Bool)

(assert (=> tb!12235 (= result!25561 tp_is_empty!37221)))

(assert (=> b!1342093 t!45655))

(declare-fun b_and!50351 () Bool)

(assert (= b_and!50349 (and (=> t!45655 result!25561) b_and!50351)))

(declare-fun m!1229715 () Bool)

(assert (=> b!1342104 m!1229715))

(declare-fun m!1229717 () Bool)

(assert (=> mapNonEmpty!57538 m!1229717))

(declare-fun m!1229719 () Bool)

(assert (=> start!113170 m!1229719))

(declare-fun m!1229721 () Bool)

(assert (=> start!113170 m!1229721))

(declare-fun m!1229723 () Bool)

(assert (=> start!113170 m!1229723))

(declare-fun m!1229725 () Bool)

(assert (=> b!1342096 m!1229725))

(declare-fun m!1229727 () Bool)

(assert (=> b!1342097 m!1229727))

(assert (=> b!1342097 m!1229727))

(declare-fun m!1229729 () Bool)

(assert (=> b!1342097 m!1229729))

(declare-fun m!1229731 () Bool)

(assert (=> b!1342093 m!1229731))

(declare-fun m!1229733 () Bool)

(assert (=> b!1342093 m!1229733))

(declare-fun m!1229735 () Bool)

(assert (=> b!1342093 m!1229735))

(declare-fun m!1229737 () Bool)

(assert (=> b!1342093 m!1229737))

(assert (=> b!1342093 m!1229735))

(declare-fun m!1229739 () Bool)

(assert (=> b!1342093 m!1229739))

(declare-fun m!1229741 () Bool)

(assert (=> b!1342093 m!1229741))

(declare-fun m!1229743 () Bool)

(assert (=> b!1342093 m!1229743))

(assert (=> b!1342093 m!1229733))

(declare-fun m!1229745 () Bool)

(assert (=> b!1342093 m!1229745))

(assert (=> b!1342093 m!1229727))

(declare-fun m!1229747 () Bool)

(assert (=> b!1342093 m!1229747))

(assert (=> b!1342093 m!1229727))

(declare-fun m!1229749 () Bool)

(assert (=> b!1342098 m!1229749))

(assert (=> b!1342098 m!1229749))

(declare-fun m!1229751 () Bool)

(assert (=> b!1342098 m!1229751))

(assert (=> b!1342095 m!1229727))

(check-sat (not b_lambda!24397) (not b!1342096) (not mapNonEmpty!57538) (not b!1342097) (not b_next!31221) (not start!113170) tp_is_empty!37221 (not b!1342104) (not b!1342098) b_and!50351 (not b!1342093))
(check-sat b_and!50351 (not b_next!31221))
