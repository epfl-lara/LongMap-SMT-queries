; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111784 () Bool)

(assert start!111784)

(declare-fun b_free!30441 () Bool)

(declare-fun b_next!30441 () Bool)

(assert (=> start!111784 (= b_free!30441 (not b_next!30441))))

(declare-fun tp!106798 () Bool)

(declare-fun b_and!48979 () Bool)

(assert (=> start!111784 (= tp!106798 b_and!48979)))

(declare-fun b!1324615 () Bool)

(declare-fun res!879211 () Bool)

(declare-fun e!755145 () Bool)

(assert (=> b!1324615 (=> (not res!879211) (not e!755145))))

(declare-datatypes ((array!89436 0))(
  ( (array!89437 (arr!43192 (Array (_ BitVec 32) (_ BitVec 64))) (size!43742 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89436)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324615 (= res!879211 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43742 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324616 () Bool)

(declare-fun e!755149 () Bool)

(declare-fun tp_is_empty!36261 () Bool)

(assert (=> b!1324616 (= e!755149 tp_is_empty!36261)))

(declare-fun b!1324617 () Bool)

(declare-fun res!879212 () Bool)

(assert (=> b!1324617 (=> (not res!879212) (not e!755145))))

(declare-datatypes ((List!30618 0))(
  ( (Nil!30615) (Cons!30614 (h!31823 (_ BitVec 64)) (t!44544 List!30618)) )
))
(declare-fun arrayNoDuplicates!0 (array!89436 (_ BitVec 32) List!30618) Bool)

(assert (=> b!1324617 (= res!879212 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30615))))

(declare-fun res!879213 () Bool)

(assert (=> start!111784 (=> (not res!879213) (not e!755145))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111784 (= res!879213 (validMask!0 mask!2019))))

(assert (=> start!111784 e!755145))

(declare-fun array_inv!32603 (array!89436) Bool)

(assert (=> start!111784 (array_inv!32603 _keys!1609)))

(assert (=> start!111784 true))

(assert (=> start!111784 tp_is_empty!36261))

(declare-datatypes ((V!53451 0))(
  ( (V!53452 (val!18205 Int)) )
))
(declare-datatypes ((ValueCell!17232 0))(
  ( (ValueCellFull!17232 (v!20835 V!53451)) (EmptyCell!17232) )
))
(declare-datatypes ((array!89438 0))(
  ( (array!89439 (arr!43193 (Array (_ BitVec 32) ValueCell!17232)) (size!43743 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89438)

(declare-fun e!755146 () Bool)

(declare-fun array_inv!32604 (array!89438) Bool)

(assert (=> start!111784 (and (array_inv!32604 _values!1337) e!755146)))

(assert (=> start!111784 tp!106798))

(declare-fun b!1324618 () Bool)

(declare-fun res!879215 () Bool)

(assert (=> b!1324618 (=> (not res!879215) (not e!755145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89436 (_ BitVec 32)) Bool)

(assert (=> b!1324618 (= res!879215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324619 () Bool)

(declare-fun res!879214 () Bool)

(assert (=> b!1324619 (=> (not res!879214) (not e!755145))))

(assert (=> b!1324619 (= res!879214 (and (= (size!43743 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43742 _keys!1609) (size!43743 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56039 () Bool)

(declare-fun mapRes!56039 () Bool)

(assert (=> mapIsEmpty!56039 mapRes!56039))

(declare-fun b!1324620 () Bool)

(assert (=> b!1324620 (= e!755145 false)))

(declare-fun zeroValue!1279 () V!53451)

(declare-fun minValue!1279 () V!53451)

(declare-fun lt!589485 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23478 0))(
  ( (tuple2!23479 (_1!11750 (_ BitVec 64)) (_2!11750 V!53451)) )
))
(declare-datatypes ((List!30619 0))(
  ( (Nil!30616) (Cons!30615 (h!31824 tuple2!23478) (t!44545 List!30619)) )
))
(declare-datatypes ((ListLongMap!21135 0))(
  ( (ListLongMap!21136 (toList!10583 List!30619)) )
))
(declare-fun contains!8738 (ListLongMap!21135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5579 (array!89436 array!89438 (_ BitVec 32) (_ BitVec 32) V!53451 V!53451 (_ BitVec 32) Int) ListLongMap!21135)

(assert (=> b!1324620 (= lt!589485 (contains!8738 (getCurrentListMap!5579 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324621 () Bool)

(declare-fun e!755148 () Bool)

(assert (=> b!1324621 (= e!755148 tp_is_empty!36261)))

(declare-fun mapNonEmpty!56039 () Bool)

(declare-fun tp!106799 () Bool)

(assert (=> mapNonEmpty!56039 (= mapRes!56039 (and tp!106799 e!755149))))

(declare-fun mapValue!56039 () ValueCell!17232)

(declare-fun mapRest!56039 () (Array (_ BitVec 32) ValueCell!17232))

(declare-fun mapKey!56039 () (_ BitVec 32))

(assert (=> mapNonEmpty!56039 (= (arr!43193 _values!1337) (store mapRest!56039 mapKey!56039 mapValue!56039))))

(declare-fun b!1324622 () Bool)

(assert (=> b!1324622 (= e!755146 (and e!755148 mapRes!56039))))

(declare-fun condMapEmpty!56039 () Bool)

(declare-fun mapDefault!56039 () ValueCell!17232)

(assert (=> b!1324622 (= condMapEmpty!56039 (= (arr!43193 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17232)) mapDefault!56039)))))

(assert (= (and start!111784 res!879213) b!1324619))

(assert (= (and b!1324619 res!879214) b!1324618))

(assert (= (and b!1324618 res!879215) b!1324617))

(assert (= (and b!1324617 res!879212) b!1324615))

(assert (= (and b!1324615 res!879211) b!1324620))

(assert (= (and b!1324622 condMapEmpty!56039) mapIsEmpty!56039))

(assert (= (and b!1324622 (not condMapEmpty!56039)) mapNonEmpty!56039))

(get-info :version)

(assert (= (and mapNonEmpty!56039 ((_ is ValueCellFull!17232) mapValue!56039)) b!1324616))

(assert (= (and b!1324622 ((_ is ValueCellFull!17232) mapDefault!56039)) b!1324621))

(assert (= start!111784 b!1324622))

(declare-fun m!1213411 () Bool)

(assert (=> b!1324620 m!1213411))

(assert (=> b!1324620 m!1213411))

(declare-fun m!1213413 () Bool)

(assert (=> b!1324620 m!1213413))

(declare-fun m!1213415 () Bool)

(assert (=> mapNonEmpty!56039 m!1213415))

(declare-fun m!1213417 () Bool)

(assert (=> b!1324617 m!1213417))

(declare-fun m!1213419 () Bool)

(assert (=> start!111784 m!1213419))

(declare-fun m!1213421 () Bool)

(assert (=> start!111784 m!1213421))

(declare-fun m!1213423 () Bool)

(assert (=> start!111784 m!1213423))

(declare-fun m!1213425 () Bool)

(assert (=> b!1324618 m!1213425))

(check-sat (not b!1324620) (not b!1324618) (not start!111784) b_and!48979 (not b_next!30441) (not b!1324617) (not mapNonEmpty!56039) tp_is_empty!36261)
(check-sat b_and!48979 (not b_next!30441))
