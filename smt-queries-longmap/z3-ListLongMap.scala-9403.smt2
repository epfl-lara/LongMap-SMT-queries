; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112136 () Bool)

(assert start!112136)

(declare-fun b_free!30511 () Bool)

(declare-fun b_next!30511 () Bool)

(assert (=> start!112136 (= b_free!30511 (not b_next!30511))))

(declare-fun tp!107013 () Bool)

(declare-fun b_and!49119 () Bool)

(assert (=> start!112136 (= tp!107013 b_and!49119)))

(declare-fun b!1327522 () Bool)

(declare-fun res!880727 () Bool)

(declare-fun e!756774 () Bool)

(assert (=> b!1327522 (=> (not res!880727) (not e!756774))))

(declare-datatypes ((array!89663 0))(
  ( (array!89664 (arr!43300 (Array (_ BitVec 32) (_ BitVec 64))) (size!43851 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89663)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53545 0))(
  ( (V!53546 (val!18240 Int)) )
))
(declare-fun zeroValue!1279 () V!53545)

(declare-datatypes ((ValueCell!17267 0))(
  ( (ValueCellFull!17267 (v!20868 V!53545)) (EmptyCell!17267) )
))
(declare-datatypes ((array!89665 0))(
  ( (array!89666 (arr!43301 (Array (_ BitVec 32) ValueCell!17267)) (size!43852 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89665)

(declare-fun minValue!1279 () V!53545)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23562 0))(
  ( (tuple2!23563 (_1!11792 (_ BitVec 64)) (_2!11792 V!53545)) )
))
(declare-datatypes ((List!30714 0))(
  ( (Nil!30711) (Cons!30710 (h!31928 tuple2!23562) (t!44688 List!30714)) )
))
(declare-datatypes ((ListLongMap!21227 0))(
  ( (ListLongMap!21228 (toList!10629 List!30714)) )
))
(declare-fun contains!8797 (ListLongMap!21227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5607 (array!89663 array!89665 (_ BitVec 32) (_ BitVec 32) V!53545 V!53545 (_ BitVec 32) Int) ListLongMap!21227)

(assert (=> b!1327522 (= res!880727 (contains!8797 (getCurrentListMap!5607 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!56148 () Bool)

(declare-fun mapRes!56148 () Bool)

(declare-fun tp!107012 () Bool)

(declare-fun e!756773 () Bool)

(assert (=> mapNonEmpty!56148 (= mapRes!56148 (and tp!107012 e!756773))))

(declare-fun mapRest!56148 () (Array (_ BitVec 32) ValueCell!17267))

(declare-fun mapValue!56148 () ValueCell!17267)

(declare-fun mapKey!56148 () (_ BitVec 32))

(assert (=> mapNonEmpty!56148 (= (arr!43301 _values!1337) (store mapRest!56148 mapKey!56148 mapValue!56148))))

(declare-fun b!1327523 () Bool)

(declare-fun e!756771 () Bool)

(declare-fun e!756772 () Bool)

(assert (=> b!1327523 (= e!756771 (and e!756772 mapRes!56148))))

(declare-fun condMapEmpty!56148 () Bool)

(declare-fun mapDefault!56148 () ValueCell!17267)

(assert (=> b!1327523 (= condMapEmpty!56148 (= (arr!43301 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17267)) mapDefault!56148)))))

(declare-fun b!1327525 () Bool)

(declare-fun res!880734 () Bool)

(assert (=> b!1327525 (=> (not res!880734) (not e!756774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89663 (_ BitVec 32)) Bool)

(assert (=> b!1327525 (= res!880734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1327526 () Bool)

(assert (=> b!1327526 (= e!756774 (not (not (= k0!1164 (select (arr!43300 _keys!1609) from!2000)))))))

(declare-fun lt!590451 () ListLongMap!21227)

(assert (=> b!1327526 (contains!8797 lt!590451 k0!1164)))

(declare-datatypes ((Unit!43639 0))(
  ( (Unit!43640) )
))
(declare-fun lt!590450 () Unit!43639)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!223 ((_ BitVec 64) (_ BitVec 64) V!53545 ListLongMap!21227) Unit!43639)

(assert (=> b!1327526 (= lt!590450 (lemmaInListMapAfterAddingDiffThenInBefore!223 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590451))))

(declare-fun lt!590453 () ListLongMap!21227)

(assert (=> b!1327526 (contains!8797 lt!590453 k0!1164)))

(declare-fun lt!590452 () Unit!43639)

(assert (=> b!1327526 (= lt!590452 (lemmaInListMapAfterAddingDiffThenInBefore!223 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590453))))

(declare-fun +!4673 (ListLongMap!21227 tuple2!23562) ListLongMap!21227)

(assert (=> b!1327526 (= lt!590453 (+!4673 lt!590451 (tuple2!23563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6317 (array!89663 array!89665 (_ BitVec 32) (_ BitVec 32) V!53545 V!53545 (_ BitVec 32) Int) ListLongMap!21227)

(declare-fun get!21841 (ValueCell!17267 V!53545) V!53545)

(declare-fun dynLambda!3627 (Int (_ BitVec 64)) V!53545)

(assert (=> b!1327526 (= lt!590451 (+!4673 (getCurrentListMapNoExtraKeys!6317 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23563 (select (arr!43300 _keys!1609) from!2000) (get!21841 (select (arr!43301 _values!1337) from!2000) (dynLambda!3627 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1327527 () Bool)

(declare-fun res!880732 () Bool)

(assert (=> b!1327527 (=> (not res!880732) (not e!756774))))

(assert (=> b!1327527 (= res!880732 (not (= (select (arr!43300 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1327528 () Bool)

(declare-fun tp_is_empty!36331 () Bool)

(assert (=> b!1327528 (= e!756773 tp_is_empty!36331)))

(declare-fun b!1327529 () Bool)

(assert (=> b!1327529 (= e!756772 tp_is_empty!36331)))

(declare-fun b!1327524 () Bool)

(declare-fun res!880733 () Bool)

(assert (=> b!1327524 (=> (not res!880733) (not e!756774))))

(declare-datatypes ((List!30715 0))(
  ( (Nil!30712) (Cons!30711 (h!31929 (_ BitVec 64)) (t!44689 List!30715)) )
))
(declare-fun arrayNoDuplicates!0 (array!89663 (_ BitVec 32) List!30715) Bool)

(assert (=> b!1327524 (= res!880733 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30712))))

(declare-fun res!880729 () Bool)

(assert (=> start!112136 (=> (not res!880729) (not e!756774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112136 (= res!880729 (validMask!0 mask!2019))))

(assert (=> start!112136 e!756774))

(declare-fun array_inv!32947 (array!89663) Bool)

(assert (=> start!112136 (array_inv!32947 _keys!1609)))

(assert (=> start!112136 true))

(assert (=> start!112136 tp_is_empty!36331))

(declare-fun array_inv!32948 (array!89665) Bool)

(assert (=> start!112136 (and (array_inv!32948 _values!1337) e!756771)))

(assert (=> start!112136 tp!107013))

(declare-fun b!1327530 () Bool)

(declare-fun res!880731 () Bool)

(assert (=> b!1327530 (=> (not res!880731) (not e!756774))))

(assert (=> b!1327530 (= res!880731 (and (= (size!43852 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43851 _keys!1609) (size!43852 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1327531 () Bool)

(declare-fun res!880728 () Bool)

(assert (=> b!1327531 (=> (not res!880728) (not e!756774))))

(assert (=> b!1327531 (= res!880728 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43851 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1327532 () Bool)

(declare-fun res!880730 () Bool)

(assert (=> b!1327532 (=> (not res!880730) (not e!756774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327532 (= res!880730 (validKeyInArray!0 (select (arr!43300 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!56148 () Bool)

(assert (=> mapIsEmpty!56148 mapRes!56148))

(assert (= (and start!112136 res!880729) b!1327530))

(assert (= (and b!1327530 res!880731) b!1327525))

(assert (= (and b!1327525 res!880734) b!1327524))

(assert (= (and b!1327524 res!880733) b!1327531))

(assert (= (and b!1327531 res!880728) b!1327522))

(assert (= (and b!1327522 res!880727) b!1327527))

(assert (= (and b!1327527 res!880732) b!1327532))

(assert (= (and b!1327532 res!880730) b!1327526))

(assert (= (and b!1327523 condMapEmpty!56148) mapIsEmpty!56148))

(assert (= (and b!1327523 (not condMapEmpty!56148)) mapNonEmpty!56148))

(get-info :version)

(assert (= (and mapNonEmpty!56148 ((_ is ValueCellFull!17267) mapValue!56148)) b!1327528))

(assert (= (and b!1327523 ((_ is ValueCellFull!17267) mapDefault!56148)) b!1327529))

(assert (= start!112136 b!1327523))

(declare-fun b_lambda!23783 () Bool)

(assert (=> (not b_lambda!23783) (not b!1327526)))

(declare-fun t!44687 () Bool)

(declare-fun tb!11777 () Bool)

(assert (=> (and start!112136 (= defaultEntry!1340 defaultEntry!1340) t!44687) tb!11777))

(declare-fun result!24619 () Bool)

(assert (=> tb!11777 (= result!24619 tp_is_empty!36331)))

(assert (=> b!1327526 t!44687))

(declare-fun b_and!49121 () Bool)

(assert (= b_and!49119 (and (=> t!44687 result!24619) b_and!49121)))

(declare-fun m!1216767 () Bool)

(assert (=> b!1327522 m!1216767))

(assert (=> b!1327522 m!1216767))

(declare-fun m!1216769 () Bool)

(assert (=> b!1327522 m!1216769))

(declare-fun m!1216771 () Bool)

(assert (=> b!1327532 m!1216771))

(assert (=> b!1327532 m!1216771))

(declare-fun m!1216773 () Bool)

(assert (=> b!1327532 m!1216773))

(declare-fun m!1216775 () Bool)

(assert (=> mapNonEmpty!56148 m!1216775))

(declare-fun m!1216777 () Bool)

(assert (=> start!112136 m!1216777))

(declare-fun m!1216779 () Bool)

(assert (=> start!112136 m!1216779))

(declare-fun m!1216781 () Bool)

(assert (=> start!112136 m!1216781))

(declare-fun m!1216783 () Bool)

(assert (=> b!1327524 m!1216783))

(declare-fun m!1216785 () Bool)

(assert (=> b!1327525 m!1216785))

(assert (=> b!1327527 m!1216771))

(declare-fun m!1216787 () Bool)

(assert (=> b!1327526 m!1216787))

(declare-fun m!1216789 () Bool)

(assert (=> b!1327526 m!1216789))

(declare-fun m!1216791 () Bool)

(assert (=> b!1327526 m!1216791))

(assert (=> b!1327526 m!1216787))

(declare-fun m!1216793 () Bool)

(assert (=> b!1327526 m!1216793))

(declare-fun m!1216795 () Bool)

(assert (=> b!1327526 m!1216795))

(declare-fun m!1216797 () Bool)

(assert (=> b!1327526 m!1216797))

(declare-fun m!1216799 () Bool)

(assert (=> b!1327526 m!1216799))

(assert (=> b!1327526 m!1216799))

(assert (=> b!1327526 m!1216791))

(declare-fun m!1216801 () Bool)

(assert (=> b!1327526 m!1216801))

(assert (=> b!1327526 m!1216771))

(declare-fun m!1216803 () Bool)

(assert (=> b!1327526 m!1216803))

(declare-fun m!1216805 () Bool)

(assert (=> b!1327526 m!1216805))

(check-sat (not b!1327525) (not b_lambda!23783) b_and!49121 (not b_next!30511) (not start!112136) (not b!1327532) tp_is_empty!36331 (not mapNonEmpty!56148) (not b!1327524) (not b!1327526) (not b!1327522))
(check-sat b_and!49121 (not b_next!30511))
