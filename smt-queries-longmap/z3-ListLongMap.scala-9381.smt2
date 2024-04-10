; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111724 () Bool)

(assert start!111724)

(declare-fun b_free!30381 () Bool)

(declare-fun b_next!30381 () Bool)

(assert (=> start!111724 (= b_free!30381 (not b_next!30381))))

(declare-fun tp!106619 () Bool)

(declare-fun b_and!48919 () Bool)

(assert (=> start!111724 (= tp!106619 b_and!48919)))

(declare-fun b!1323868 () Bool)

(declare-fun e!754699 () Bool)

(declare-fun tp_is_empty!36201 () Bool)

(assert (=> b!1323868 (= e!754699 tp_is_empty!36201)))

(declare-fun b!1323869 () Bool)

(declare-fun e!754698 () Bool)

(assert (=> b!1323869 (= e!754698 tp_is_empty!36201)))

(declare-fun mapIsEmpty!55949 () Bool)

(declare-fun mapRes!55949 () Bool)

(assert (=> mapIsEmpty!55949 mapRes!55949))

(declare-fun mapNonEmpty!55949 () Bool)

(declare-fun tp!106618 () Bool)

(assert (=> mapNonEmpty!55949 (= mapRes!55949 (and tp!106618 e!754699))))

(declare-fun mapKey!55949 () (_ BitVec 32))

(declare-datatypes ((V!53371 0))(
  ( (V!53372 (val!18175 Int)) )
))
(declare-datatypes ((ValueCell!17202 0))(
  ( (ValueCellFull!17202 (v!20805 V!53371)) (EmptyCell!17202) )
))
(declare-datatypes ((array!89318 0))(
  ( (array!89319 (arr!43133 (Array (_ BitVec 32) ValueCell!17202)) (size!43683 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89318)

(declare-fun mapRest!55949 () (Array (_ BitVec 32) ValueCell!17202))

(declare-fun mapValue!55949 () ValueCell!17202)

(assert (=> mapNonEmpty!55949 (= (arr!43133 _values!1337) (store mapRest!55949 mapKey!55949 mapValue!55949))))

(declare-fun b!1323870 () Bool)

(declare-fun e!754697 () Bool)

(assert (=> b!1323870 (= e!754697 false)))

(declare-datatypes ((array!89320 0))(
  ( (array!89321 (arr!43134 (Array (_ BitVec 32) (_ BitVec 64))) (size!43684 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89320)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53371)

(declare-fun lt!589404 () Bool)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun minValue!1279 () V!53371)

(declare-datatypes ((tuple2!23434 0))(
  ( (tuple2!23435 (_1!11728 (_ BitVec 64)) (_2!11728 V!53371)) )
))
(declare-datatypes ((List!30574 0))(
  ( (Nil!30571) (Cons!30570 (h!31779 tuple2!23434) (t!44500 List!30574)) )
))
(declare-datatypes ((ListLongMap!21091 0))(
  ( (ListLongMap!21092 (toList!10561 List!30574)) )
))
(declare-fun contains!8716 (ListLongMap!21091 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5557 (array!89320 array!89318 (_ BitVec 32) (_ BitVec 32) V!53371 V!53371 (_ BitVec 32) Int) ListLongMap!21091)

(assert (=> b!1323870 (= lt!589404 (contains!8716 (getCurrentListMap!5557 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323871 () Bool)

(declare-fun res!878734 () Bool)

(assert (=> b!1323871 (=> (not res!878734) (not e!754697))))

(assert (=> b!1323871 (= res!878734 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43684 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323872 () Bool)

(declare-fun res!878736 () Bool)

(assert (=> b!1323872 (=> (not res!878736) (not e!754697))))

(declare-datatypes ((List!30575 0))(
  ( (Nil!30572) (Cons!30571 (h!31780 (_ BitVec 64)) (t!44501 List!30575)) )
))
(declare-fun arrayNoDuplicates!0 (array!89320 (_ BitVec 32) List!30575) Bool)

(assert (=> b!1323872 (= res!878736 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30572))))

(declare-fun res!878738 () Bool)

(assert (=> start!111724 (=> (not res!878738) (not e!754697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111724 (= res!878738 (validMask!0 mask!2019))))

(assert (=> start!111724 e!754697))

(declare-fun array_inv!32561 (array!89320) Bool)

(assert (=> start!111724 (array_inv!32561 _keys!1609)))

(assert (=> start!111724 true))

(assert (=> start!111724 tp_is_empty!36201))

(declare-fun e!754696 () Bool)

(declare-fun array_inv!32562 (array!89318) Bool)

(assert (=> start!111724 (and (array_inv!32562 _values!1337) e!754696)))

(assert (=> start!111724 tp!106619))

(declare-fun b!1323873 () Bool)

(assert (=> b!1323873 (= e!754696 (and e!754698 mapRes!55949))))

(declare-fun condMapEmpty!55949 () Bool)

(declare-fun mapDefault!55949 () ValueCell!17202)

(assert (=> b!1323873 (= condMapEmpty!55949 (= (arr!43133 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17202)) mapDefault!55949)))))

(declare-fun b!1323874 () Bool)

(declare-fun res!878737 () Bool)

(assert (=> b!1323874 (=> (not res!878737) (not e!754697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89320 (_ BitVec 32)) Bool)

(assert (=> b!1323874 (= res!878737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323875 () Bool)

(declare-fun res!878735 () Bool)

(assert (=> b!1323875 (=> (not res!878735) (not e!754697))))

(assert (=> b!1323875 (= res!878735 (and (= (size!43683 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43684 _keys!1609) (size!43683 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111724 res!878738) b!1323875))

(assert (= (and b!1323875 res!878735) b!1323874))

(assert (= (and b!1323874 res!878737) b!1323872))

(assert (= (and b!1323872 res!878736) b!1323871))

(assert (= (and b!1323871 res!878734) b!1323870))

(assert (= (and b!1323873 condMapEmpty!55949) mapIsEmpty!55949))

(assert (= (and b!1323873 (not condMapEmpty!55949)) mapNonEmpty!55949))

(get-info :version)

(assert (= (and mapNonEmpty!55949 ((_ is ValueCellFull!17202) mapValue!55949)) b!1323868))

(assert (= (and b!1323873 ((_ is ValueCellFull!17202) mapDefault!55949)) b!1323869))

(assert (= start!111724 b!1323873))

(declare-fun m!1212919 () Bool)

(assert (=> mapNonEmpty!55949 m!1212919))

(declare-fun m!1212921 () Bool)

(assert (=> b!1323874 m!1212921))

(declare-fun m!1212923 () Bool)

(assert (=> b!1323870 m!1212923))

(assert (=> b!1323870 m!1212923))

(declare-fun m!1212925 () Bool)

(assert (=> b!1323870 m!1212925))

(declare-fun m!1212927 () Bool)

(assert (=> b!1323872 m!1212927))

(declare-fun m!1212929 () Bool)

(assert (=> start!111724 m!1212929))

(declare-fun m!1212931 () Bool)

(assert (=> start!111724 m!1212931))

(declare-fun m!1212933 () Bool)

(assert (=> start!111724 m!1212933))

(check-sat (not b!1323870) (not b!1323872) b_and!48919 (not b_next!30381) (not mapNonEmpty!55949) (not start!111724) (not b!1323874) tp_is_empty!36201)
(check-sat b_and!48919 (not b_next!30381))
