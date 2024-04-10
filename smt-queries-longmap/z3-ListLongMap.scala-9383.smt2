; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111736 () Bool)

(assert start!111736)

(declare-fun b_free!30393 () Bool)

(declare-fun b_next!30393 () Bool)

(assert (=> start!111736 (= b_free!30393 (not b_next!30393))))

(declare-fun tp!106655 () Bool)

(declare-fun b_and!48931 () Bool)

(assert (=> start!111736 (= tp!106655 b_and!48931)))

(declare-fun mapNonEmpty!55967 () Bool)

(declare-fun mapRes!55967 () Bool)

(declare-fun tp!106654 () Bool)

(declare-fun e!754787 () Bool)

(assert (=> mapNonEmpty!55967 (= mapRes!55967 (and tp!106654 e!754787))))

(declare-datatypes ((V!53387 0))(
  ( (V!53388 (val!18181 Int)) )
))
(declare-datatypes ((ValueCell!17208 0))(
  ( (ValueCellFull!17208 (v!20811 V!53387)) (EmptyCell!17208) )
))
(declare-fun mapValue!55967 () ValueCell!17208)

(declare-datatypes ((array!89342 0))(
  ( (array!89343 (arr!43145 (Array (_ BitVec 32) ValueCell!17208)) (size!43695 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89342)

(declare-fun mapRest!55967 () (Array (_ BitVec 32) ValueCell!17208))

(declare-fun mapKey!55967 () (_ BitVec 32))

(assert (=> mapNonEmpty!55967 (= (arr!43145 _values!1337) (store mapRest!55967 mapKey!55967 mapValue!55967))))

(declare-fun b!1324012 () Bool)

(declare-fun tp_is_empty!36213 () Bool)

(assert (=> b!1324012 (= e!754787 tp_is_empty!36213)))

(declare-fun b!1324013 () Bool)

(declare-fun res!878826 () Bool)

(declare-fun e!754788 () Bool)

(assert (=> b!1324013 (=> (not res!878826) (not e!754788))))

(declare-datatypes ((array!89344 0))(
  ( (array!89345 (arr!43146 (Array (_ BitVec 32) (_ BitVec 64))) (size!43696 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89344)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1324013 (= res!878826 (and (= (size!43695 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43696 _keys!1609) (size!43695 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324014 () Bool)

(declare-fun res!878827 () Bool)

(assert (=> b!1324014 (=> (not res!878827) (not e!754788))))

(declare-datatypes ((List!30582 0))(
  ( (Nil!30579) (Cons!30578 (h!31787 (_ BitVec 64)) (t!44508 List!30582)) )
))
(declare-fun arrayNoDuplicates!0 (array!89344 (_ BitVec 32) List!30582) Bool)

(assert (=> b!1324014 (= res!878827 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30579))))

(declare-fun b!1324015 () Bool)

(declare-fun res!878825 () Bool)

(assert (=> b!1324015 (=> (not res!878825) (not e!754788))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324015 (= res!878825 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43696 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324016 () Bool)

(declare-fun e!754786 () Bool)

(assert (=> b!1324016 (= e!754786 tp_is_empty!36213)))

(declare-fun mapIsEmpty!55967 () Bool)

(assert (=> mapIsEmpty!55967 mapRes!55967))

(declare-fun b!1324017 () Bool)

(assert (=> b!1324017 (= e!754788 false)))

(declare-fun zeroValue!1279 () V!53387)

(declare-fun minValue!1279 () V!53387)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589422 () Bool)

(declare-datatypes ((tuple2!23442 0))(
  ( (tuple2!23443 (_1!11732 (_ BitVec 64)) (_2!11732 V!53387)) )
))
(declare-datatypes ((List!30583 0))(
  ( (Nil!30580) (Cons!30579 (h!31788 tuple2!23442) (t!44509 List!30583)) )
))
(declare-datatypes ((ListLongMap!21099 0))(
  ( (ListLongMap!21100 (toList!10565 List!30583)) )
))
(declare-fun contains!8720 (ListLongMap!21099 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5561 (array!89344 array!89342 (_ BitVec 32) (_ BitVec 32) V!53387 V!53387 (_ BitVec 32) Int) ListLongMap!21099)

(assert (=> b!1324017 (= lt!589422 (contains!8720 (getCurrentListMap!5561 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!878828 () Bool)

(assert (=> start!111736 (=> (not res!878828) (not e!754788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111736 (= res!878828 (validMask!0 mask!2019))))

(assert (=> start!111736 e!754788))

(declare-fun array_inv!32569 (array!89344) Bool)

(assert (=> start!111736 (array_inv!32569 _keys!1609)))

(assert (=> start!111736 true))

(assert (=> start!111736 tp_is_empty!36213))

(declare-fun e!754789 () Bool)

(declare-fun array_inv!32570 (array!89342) Bool)

(assert (=> start!111736 (and (array_inv!32570 _values!1337) e!754789)))

(assert (=> start!111736 tp!106655))

(declare-fun b!1324018 () Bool)

(assert (=> b!1324018 (= e!754789 (and e!754786 mapRes!55967))))

(declare-fun condMapEmpty!55967 () Bool)

(declare-fun mapDefault!55967 () ValueCell!17208)

(assert (=> b!1324018 (= condMapEmpty!55967 (= (arr!43145 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17208)) mapDefault!55967)))))

(declare-fun b!1324019 () Bool)

(declare-fun res!878824 () Bool)

(assert (=> b!1324019 (=> (not res!878824) (not e!754788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89344 (_ BitVec 32)) Bool)

(assert (=> b!1324019 (= res!878824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111736 res!878828) b!1324013))

(assert (= (and b!1324013 res!878826) b!1324019))

(assert (= (and b!1324019 res!878824) b!1324014))

(assert (= (and b!1324014 res!878827) b!1324015))

(assert (= (and b!1324015 res!878825) b!1324017))

(assert (= (and b!1324018 condMapEmpty!55967) mapIsEmpty!55967))

(assert (= (and b!1324018 (not condMapEmpty!55967)) mapNonEmpty!55967))

(get-info :version)

(assert (= (and mapNonEmpty!55967 ((_ is ValueCellFull!17208) mapValue!55967)) b!1324012))

(assert (= (and b!1324018 ((_ is ValueCellFull!17208) mapDefault!55967)) b!1324016))

(assert (= start!111736 b!1324018))

(declare-fun m!1213015 () Bool)

(assert (=> b!1324019 m!1213015))

(declare-fun m!1213017 () Bool)

(assert (=> b!1324014 m!1213017))

(declare-fun m!1213019 () Bool)

(assert (=> mapNonEmpty!55967 m!1213019))

(declare-fun m!1213021 () Bool)

(assert (=> start!111736 m!1213021))

(declare-fun m!1213023 () Bool)

(assert (=> start!111736 m!1213023))

(declare-fun m!1213025 () Bool)

(assert (=> start!111736 m!1213025))

(declare-fun m!1213027 () Bool)

(assert (=> b!1324017 m!1213027))

(assert (=> b!1324017 m!1213027))

(declare-fun m!1213029 () Bool)

(assert (=> b!1324017 m!1213029))

(check-sat tp_is_empty!36213 (not b!1324017) b_and!48931 (not b_next!30393) (not mapNonEmpty!55967) (not start!111736) (not b!1324019) (not b!1324014))
(check-sat b_and!48931 (not b_next!30393))
