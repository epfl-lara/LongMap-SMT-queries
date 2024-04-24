; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111994 () Bool)

(assert start!111994)

(declare-fun b_free!30427 () Bool)

(declare-fun b_next!30427 () Bool)

(assert (=> start!111994 (= b_free!30427 (not b_next!30427))))

(declare-fun tp!106756 () Bool)

(declare-fun b_and!48967 () Bool)

(assert (=> start!111994 (= tp!106756 b_and!48967)))

(declare-fun b!1325725 () Bool)

(declare-fun res!879603 () Bool)

(declare-fun e!755883 () Bool)

(assert (=> b!1325725 (=> (not res!879603) (not e!755883))))

(declare-datatypes ((array!89495 0))(
  ( (array!89496 (arr!43217 (Array (_ BitVec 32) (_ BitVec 64))) (size!43768 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89495)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53433 0))(
  ( (V!53434 (val!18198 Int)) )
))
(declare-datatypes ((ValueCell!17225 0))(
  ( (ValueCellFull!17225 (v!20823 V!53433)) (EmptyCell!17225) )
))
(declare-datatypes ((array!89497 0))(
  ( (array!89498 (arr!43218 (Array (_ BitVec 32) ValueCell!17225)) (size!43769 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89497)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1325725 (= res!879603 (and (= (size!43769 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43768 _keys!1609) (size!43769 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325726 () Bool)

(declare-fun res!879604 () Bool)

(assert (=> b!1325726 (=> (not res!879604) (not e!755883))))

(declare-datatypes ((List!30653 0))(
  ( (Nil!30650) (Cons!30649 (h!31867 (_ BitVec 64)) (t!44571 List!30653)) )
))
(declare-fun arrayNoDuplicates!0 (array!89495 (_ BitVec 32) List!30653) Bool)

(assert (=> b!1325726 (= res!879604 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30650))))

(declare-fun b!1325727 () Bool)

(declare-fun e!755887 () Bool)

(declare-fun tp_is_empty!36247 () Bool)

(assert (=> b!1325727 (= e!755887 tp_is_empty!36247)))

(declare-fun b!1325728 () Bool)

(declare-fun res!879608 () Bool)

(assert (=> b!1325728 (=> (not res!879608) (not e!755883))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325728 (= res!879608 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43768 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325729 () Bool)

(declare-fun res!879606 () Bool)

(assert (=> b!1325729 (=> (not res!879606) (not e!755883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325729 (= res!879606 (not (validKeyInArray!0 (select (arr!43217 _keys!1609) from!2000))))))

(declare-fun mapNonEmpty!56018 () Bool)

(declare-fun mapRes!56018 () Bool)

(declare-fun tp!106757 () Bool)

(assert (=> mapNonEmpty!56018 (= mapRes!56018 (and tp!106757 e!755887))))

(declare-fun mapRest!56018 () (Array (_ BitVec 32) ValueCell!17225))

(declare-fun mapValue!56018 () ValueCell!17225)

(declare-fun mapKey!56018 () (_ BitVec 32))

(assert (=> mapNonEmpty!56018 (= (arr!43218 _values!1337) (store mapRest!56018 mapKey!56018 mapValue!56018))))

(declare-fun b!1325730 () Bool)

(declare-fun res!879605 () Bool)

(assert (=> b!1325730 (=> (not res!879605) (not e!755883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89495 (_ BitVec 32)) Bool)

(assert (=> b!1325730 (= res!879605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!879607 () Bool)

(assert (=> start!111994 (=> (not res!879607) (not e!755883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111994 (= res!879607 (validMask!0 mask!2019))))

(assert (=> start!111994 e!755883))

(declare-fun array_inv!32899 (array!89495) Bool)

(assert (=> start!111994 (array_inv!32899 _keys!1609)))

(assert (=> start!111994 true))

(assert (=> start!111994 tp_is_empty!36247))

(declare-fun e!755885 () Bool)

(declare-fun array_inv!32900 (array!89497) Bool)

(assert (=> start!111994 (and (array_inv!32900 _values!1337) e!755885)))

(assert (=> start!111994 tp!106756))

(declare-fun b!1325731 () Bool)

(assert (=> b!1325731 (= e!755883 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!56018 () Bool)

(assert (=> mapIsEmpty!56018 mapRes!56018))

(declare-fun b!1325732 () Bool)

(declare-fun res!879610 () Bool)

(assert (=> b!1325732 (=> (not res!879610) (not e!755883))))

(assert (=> b!1325732 (= res!879610 (not (= (select (arr!43217 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325733 () Bool)

(declare-fun e!755884 () Bool)

(assert (=> b!1325733 (= e!755884 tp_is_empty!36247)))

(declare-fun b!1325734 () Bool)

(assert (=> b!1325734 (= e!755885 (and e!755884 mapRes!56018))))

(declare-fun condMapEmpty!56018 () Bool)

(declare-fun mapDefault!56018 () ValueCell!17225)

(assert (=> b!1325734 (= condMapEmpty!56018 (= (arr!43218 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17225)) mapDefault!56018)))))

(declare-fun b!1325735 () Bool)

(declare-fun res!879609 () Bool)

(assert (=> b!1325735 (=> (not res!879609) (not e!755883))))

(declare-fun zeroValue!1279 () V!53433)

(declare-fun minValue!1279 () V!53433)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23500 0))(
  ( (tuple2!23501 (_1!11761 (_ BitVec 64)) (_2!11761 V!53433)) )
))
(declare-datatypes ((List!30654 0))(
  ( (Nil!30651) (Cons!30650 (h!31868 tuple2!23500) (t!44572 List!30654)) )
))
(declare-datatypes ((ListLongMap!21165 0))(
  ( (ListLongMap!21166 (toList!10598 List!30654)) )
))
(declare-fun contains!8765 (ListLongMap!21165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5581 (array!89495 array!89497 (_ BitVec 32) (_ BitVec 32) V!53433 V!53433 (_ BitVec 32) Int) ListLongMap!21165)

(assert (=> b!1325735 (= res!879609 (contains!8765 (getCurrentListMap!5581 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111994 res!879607) b!1325725))

(assert (= (and b!1325725 res!879603) b!1325730))

(assert (= (and b!1325730 res!879605) b!1325726))

(assert (= (and b!1325726 res!879604) b!1325728))

(assert (= (and b!1325728 res!879608) b!1325735))

(assert (= (and b!1325735 res!879609) b!1325732))

(assert (= (and b!1325732 res!879610) b!1325729))

(assert (= (and b!1325729 res!879606) b!1325731))

(assert (= (and b!1325734 condMapEmpty!56018) mapIsEmpty!56018))

(assert (= (and b!1325734 (not condMapEmpty!56018)) mapNonEmpty!56018))

(get-info :version)

(assert (= (and mapNonEmpty!56018 ((_ is ValueCellFull!17225) mapValue!56018)) b!1325727))

(assert (= (and b!1325734 ((_ is ValueCellFull!17225) mapDefault!56018)) b!1325733))

(assert (= start!111994 b!1325734))

(declare-fun m!1214885 () Bool)

(assert (=> b!1325730 m!1214885))

(declare-fun m!1214887 () Bool)

(assert (=> b!1325729 m!1214887))

(assert (=> b!1325729 m!1214887))

(declare-fun m!1214889 () Bool)

(assert (=> b!1325729 m!1214889))

(declare-fun m!1214891 () Bool)

(assert (=> start!111994 m!1214891))

(declare-fun m!1214893 () Bool)

(assert (=> start!111994 m!1214893))

(declare-fun m!1214895 () Bool)

(assert (=> start!111994 m!1214895))

(declare-fun m!1214897 () Bool)

(assert (=> b!1325726 m!1214897))

(declare-fun m!1214899 () Bool)

(assert (=> b!1325735 m!1214899))

(assert (=> b!1325735 m!1214899))

(declare-fun m!1214901 () Bool)

(assert (=> b!1325735 m!1214901))

(declare-fun m!1214903 () Bool)

(assert (=> mapNonEmpty!56018 m!1214903))

(assert (=> b!1325732 m!1214887))

(check-sat tp_is_empty!36247 (not b_next!30427) (not b!1325730) (not b!1325726) (not start!111994) (not mapNonEmpty!56018) b_and!48967 (not b!1325729) (not b!1325735))
(check-sat b_and!48967 (not b_next!30427))
