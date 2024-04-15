; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111728 () Bool)

(assert start!111728)

(declare-fun b_free!30385 () Bool)

(declare-fun b_next!30385 () Bool)

(assert (=> start!111728 (= b_free!30385 (not b_next!30385))))

(declare-fun tp!106631 () Bool)

(declare-fun b_and!48905 () Bool)

(assert (=> start!111728 (= tp!106631 b_and!48905)))

(declare-fun b!1323846 () Bool)

(declare-fun res!878735 () Bool)

(declare-fun e!754696 () Bool)

(assert (=> b!1323846 (=> (not res!878735) (not e!754696))))

(declare-datatypes ((array!89257 0))(
  ( (array!89258 (arr!43103 (Array (_ BitVec 32) (_ BitVec 64))) (size!43655 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89257)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53377 0))(
  ( (V!53378 (val!18177 Int)) )
))
(declare-datatypes ((ValueCell!17204 0))(
  ( (ValueCellFull!17204 (v!20806 V!53377)) (EmptyCell!17204) )
))
(declare-datatypes ((array!89259 0))(
  ( (array!89260 (arr!43104 (Array (_ BitVec 32) ValueCell!17204)) (size!43656 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89259)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1323846 (= res!878735 (and (= (size!43656 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43655 _keys!1609) (size!43656 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55955 () Bool)

(declare-fun mapRes!55955 () Bool)

(declare-fun tp!106632 () Bool)

(declare-fun e!754695 () Bool)

(assert (=> mapNonEmpty!55955 (= mapRes!55955 (and tp!106632 e!754695))))

(declare-fun mapValue!55955 () ValueCell!17204)

(declare-fun mapKey!55955 () (_ BitVec 32))

(declare-fun mapRest!55955 () (Array (_ BitVec 32) ValueCell!17204))

(assert (=> mapNonEmpty!55955 (= (arr!43104 _values!1337) (store mapRest!55955 mapKey!55955 mapValue!55955))))

(declare-fun b!1323847 () Bool)

(assert (=> b!1323847 (= e!754696 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53377)

(declare-fun minValue!1279 () V!53377)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun lt!589224 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23502 0))(
  ( (tuple2!23503 (_1!11762 (_ BitVec 64)) (_2!11762 V!53377)) )
))
(declare-datatypes ((List!30633 0))(
  ( (Nil!30630) (Cons!30629 (h!31838 tuple2!23502) (t!44551 List!30633)) )
))
(declare-datatypes ((ListLongMap!21159 0))(
  ( (ListLongMap!21160 (toList!10595 List!30633)) )
))
(declare-fun contains!8678 (ListLongMap!21159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5474 (array!89257 array!89259 (_ BitVec 32) (_ BitVec 32) V!53377 V!53377 (_ BitVec 32) Int) ListLongMap!21159)

(assert (=> b!1323847 (= lt!589224 (contains!8678 (getCurrentListMap!5474 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!878738 () Bool)

(assert (=> start!111728 (=> (not res!878738) (not e!754696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111728 (= res!878738 (validMask!0 mask!2019))))

(assert (=> start!111728 e!754696))

(declare-fun array_inv!32723 (array!89257) Bool)

(assert (=> start!111728 (array_inv!32723 _keys!1609)))

(assert (=> start!111728 true))

(declare-fun tp_is_empty!36205 () Bool)

(assert (=> start!111728 tp_is_empty!36205))

(declare-fun e!754693 () Bool)

(declare-fun array_inv!32724 (array!89259) Bool)

(assert (=> start!111728 (and (array_inv!32724 _values!1337) e!754693)))

(assert (=> start!111728 tp!106631))

(declare-fun b!1323848 () Bool)

(declare-fun e!754692 () Bool)

(assert (=> b!1323848 (= e!754693 (and e!754692 mapRes!55955))))

(declare-fun condMapEmpty!55955 () Bool)

(declare-fun mapDefault!55955 () ValueCell!17204)

(assert (=> b!1323848 (= condMapEmpty!55955 (= (arr!43104 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17204)) mapDefault!55955)))))

(declare-fun mapIsEmpty!55955 () Bool)

(assert (=> mapIsEmpty!55955 mapRes!55955))

(declare-fun b!1323849 () Bool)

(assert (=> b!1323849 (= e!754692 tp_is_empty!36205)))

(declare-fun b!1323850 () Bool)

(declare-fun res!878736 () Bool)

(assert (=> b!1323850 (=> (not res!878736) (not e!754696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89257 (_ BitVec 32)) Bool)

(assert (=> b!1323850 (= res!878736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323851 () Bool)

(declare-fun res!878737 () Bool)

(assert (=> b!1323851 (=> (not res!878737) (not e!754696))))

(assert (=> b!1323851 (= res!878737 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43655 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323852 () Bool)

(declare-fun res!878739 () Bool)

(assert (=> b!1323852 (=> (not res!878739) (not e!754696))))

(declare-datatypes ((List!30634 0))(
  ( (Nil!30631) (Cons!30630 (h!31839 (_ BitVec 64)) (t!44552 List!30634)) )
))
(declare-fun arrayNoDuplicates!0 (array!89257 (_ BitVec 32) List!30634) Bool)

(assert (=> b!1323852 (= res!878739 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30631))))

(declare-fun b!1323853 () Bool)

(assert (=> b!1323853 (= e!754695 tp_is_empty!36205)))

(assert (= (and start!111728 res!878738) b!1323846))

(assert (= (and b!1323846 res!878735) b!1323850))

(assert (= (and b!1323850 res!878736) b!1323852))

(assert (= (and b!1323852 res!878739) b!1323851))

(assert (= (and b!1323851 res!878737) b!1323847))

(assert (= (and b!1323848 condMapEmpty!55955) mapIsEmpty!55955))

(assert (= (and b!1323848 (not condMapEmpty!55955)) mapNonEmpty!55955))

(get-info :version)

(assert (= (and mapNonEmpty!55955 ((_ is ValueCellFull!17204) mapValue!55955)) b!1323853))

(assert (= (and b!1323848 ((_ is ValueCellFull!17204) mapDefault!55955)) b!1323849))

(assert (= start!111728 b!1323848))

(declare-fun m!1212435 () Bool)

(assert (=> b!1323850 m!1212435))

(declare-fun m!1212437 () Bool)

(assert (=> b!1323847 m!1212437))

(assert (=> b!1323847 m!1212437))

(declare-fun m!1212439 () Bool)

(assert (=> b!1323847 m!1212439))

(declare-fun m!1212441 () Bool)

(assert (=> b!1323852 m!1212441))

(declare-fun m!1212443 () Bool)

(assert (=> mapNonEmpty!55955 m!1212443))

(declare-fun m!1212445 () Bool)

(assert (=> start!111728 m!1212445))

(declare-fun m!1212447 () Bool)

(assert (=> start!111728 m!1212447))

(declare-fun m!1212449 () Bool)

(assert (=> start!111728 m!1212449))

(check-sat (not mapNonEmpty!55955) (not b!1323852) (not b!1323850) tp_is_empty!36205 b_and!48905 (not b_next!30385) (not b!1323847) (not start!111728))
(check-sat b_and!48905 (not b_next!30385))
