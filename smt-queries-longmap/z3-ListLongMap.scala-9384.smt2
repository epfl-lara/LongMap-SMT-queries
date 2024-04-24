; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111964 () Bool)

(assert start!111964)

(declare-fun b_free!30397 () Bool)

(declare-fun b_next!30397 () Bool)

(assert (=> start!111964 (= b_free!30397 (not b_next!30397))))

(declare-fun tp!106667 () Bool)

(declare-fun b_and!48937 () Bool)

(assert (=> start!111964 (= tp!106667 b_and!48937)))

(declare-fun b!1325359 () Bool)

(declare-fun res!879373 () Bool)

(declare-fun e!755659 () Bool)

(assert (=> b!1325359 (=> (not res!879373) (not e!755659))))

(declare-datatypes ((array!89439 0))(
  ( (array!89440 (arr!43189 (Array (_ BitVec 32) (_ BitVec 64))) (size!43740 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89439)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89439 (_ BitVec 32)) Bool)

(assert (=> b!1325359 (= res!879373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325360 () Bool)

(declare-fun e!755661 () Bool)

(declare-fun e!755658 () Bool)

(declare-fun mapRes!55973 () Bool)

(assert (=> b!1325360 (= e!755661 (and e!755658 mapRes!55973))))

(declare-fun condMapEmpty!55973 () Bool)

(declare-datatypes ((V!53393 0))(
  ( (V!53394 (val!18183 Int)) )
))
(declare-datatypes ((ValueCell!17210 0))(
  ( (ValueCellFull!17210 (v!20808 V!53393)) (EmptyCell!17210) )
))
(declare-datatypes ((array!89441 0))(
  ( (array!89442 (arr!43190 (Array (_ BitVec 32) ValueCell!17210)) (size!43741 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89441)

(declare-fun mapDefault!55973 () ValueCell!17210)

(assert (=> b!1325360 (= condMapEmpty!55973 (= (arr!43190 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17210)) mapDefault!55973)))))

(declare-fun b!1325361 () Bool)

(assert (=> b!1325361 (= e!755659 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53393)

(declare-fun minValue!1279 () V!53393)

(declare-fun lt!589904 () Bool)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23482 0))(
  ( (tuple2!23483 (_1!11752 (_ BitVec 64)) (_2!11752 V!53393)) )
))
(declare-datatypes ((List!30632 0))(
  ( (Nil!30629) (Cons!30628 (h!31846 tuple2!23482) (t!44550 List!30632)) )
))
(declare-datatypes ((ListLongMap!21147 0))(
  ( (ListLongMap!21148 (toList!10589 List!30632)) )
))
(declare-fun contains!8756 (ListLongMap!21147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5572 (array!89439 array!89441 (_ BitVec 32) (_ BitVec 32) V!53393 V!53393 (_ BitVec 32) Int) ListLongMap!21147)

(assert (=> b!1325361 (= lt!589904 (contains!8756 (getCurrentListMap!5572 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55973 () Bool)

(assert (=> mapIsEmpty!55973 mapRes!55973))

(declare-fun b!1325362 () Bool)

(declare-fun e!755660 () Bool)

(declare-fun tp_is_empty!36217 () Bool)

(assert (=> b!1325362 (= e!755660 tp_is_empty!36217)))

(declare-fun b!1325363 () Bool)

(declare-fun res!879374 () Bool)

(assert (=> b!1325363 (=> (not res!879374) (not e!755659))))

(declare-datatypes ((List!30633 0))(
  ( (Nil!30630) (Cons!30629 (h!31847 (_ BitVec 64)) (t!44551 List!30633)) )
))
(declare-fun arrayNoDuplicates!0 (array!89439 (_ BitVec 32) List!30633) Bool)

(assert (=> b!1325363 (= res!879374 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30630))))

(declare-fun b!1325364 () Bool)

(declare-fun res!879372 () Bool)

(assert (=> b!1325364 (=> (not res!879372) (not e!755659))))

(assert (=> b!1325364 (= res!879372 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43740 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325365 () Bool)

(assert (=> b!1325365 (= e!755658 tp_is_empty!36217)))

(declare-fun b!1325366 () Bool)

(declare-fun res!879375 () Bool)

(assert (=> b!1325366 (=> (not res!879375) (not e!755659))))

(assert (=> b!1325366 (= res!879375 (and (= (size!43741 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43740 _keys!1609) (size!43741 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!879376 () Bool)

(assert (=> start!111964 (=> (not res!879376) (not e!755659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111964 (= res!879376 (validMask!0 mask!2019))))

(assert (=> start!111964 e!755659))

(declare-fun array_inv!32879 (array!89439) Bool)

(assert (=> start!111964 (array_inv!32879 _keys!1609)))

(assert (=> start!111964 true))

(assert (=> start!111964 tp_is_empty!36217))

(declare-fun array_inv!32880 (array!89441) Bool)

(assert (=> start!111964 (and (array_inv!32880 _values!1337) e!755661)))

(assert (=> start!111964 tp!106667))

(declare-fun mapNonEmpty!55973 () Bool)

(declare-fun tp!106666 () Bool)

(assert (=> mapNonEmpty!55973 (= mapRes!55973 (and tp!106666 e!755660))))

(declare-fun mapRest!55973 () (Array (_ BitVec 32) ValueCell!17210))

(declare-fun mapKey!55973 () (_ BitVec 32))

(declare-fun mapValue!55973 () ValueCell!17210)

(assert (=> mapNonEmpty!55973 (= (arr!43190 _values!1337) (store mapRest!55973 mapKey!55973 mapValue!55973))))

(assert (= (and start!111964 res!879376) b!1325366))

(assert (= (and b!1325366 res!879375) b!1325359))

(assert (= (and b!1325359 res!879373) b!1325363))

(assert (= (and b!1325363 res!879374) b!1325364))

(assert (= (and b!1325364 res!879372) b!1325361))

(assert (= (and b!1325360 condMapEmpty!55973) mapIsEmpty!55973))

(assert (= (and b!1325360 (not condMapEmpty!55973)) mapNonEmpty!55973))

(get-info :version)

(assert (= (and mapNonEmpty!55973 ((_ is ValueCellFull!17210) mapValue!55973)) b!1325362))

(assert (= (and b!1325360 ((_ is ValueCellFull!17210) mapDefault!55973)) b!1325365))

(assert (= start!111964 b!1325360))

(declare-fun m!1214645 () Bool)

(assert (=> start!111964 m!1214645))

(declare-fun m!1214647 () Bool)

(assert (=> start!111964 m!1214647))

(declare-fun m!1214649 () Bool)

(assert (=> start!111964 m!1214649))

(declare-fun m!1214651 () Bool)

(assert (=> b!1325361 m!1214651))

(assert (=> b!1325361 m!1214651))

(declare-fun m!1214653 () Bool)

(assert (=> b!1325361 m!1214653))

(declare-fun m!1214655 () Bool)

(assert (=> b!1325363 m!1214655))

(declare-fun m!1214657 () Bool)

(assert (=> b!1325359 m!1214657))

(declare-fun m!1214659 () Bool)

(assert (=> mapNonEmpty!55973 m!1214659))

(check-sat (not b_next!30397) (not b!1325361) (not b!1325359) (not b!1325363) b_and!48937 (not mapNonEmpty!55973) (not start!111964) tp_is_empty!36217)
(check-sat b_and!48937 (not b_next!30397))
