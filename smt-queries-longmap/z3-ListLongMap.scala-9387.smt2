; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111982 () Bool)

(assert start!111982)

(declare-fun b_free!30415 () Bool)

(declare-fun b_next!30415 () Bool)

(assert (=> start!111982 (= b_free!30415 (not b_next!30415))))

(declare-fun tp!106721 () Bool)

(declare-fun b_and!48955 () Bool)

(assert (=> start!111982 (= tp!106721 b_and!48955)))

(declare-fun b!1325575 () Bool)

(declare-fun res!879508 () Bool)

(declare-fun e!755793 () Bool)

(assert (=> b!1325575 (=> (not res!879508) (not e!755793))))

(declare-datatypes ((array!89475 0))(
  ( (array!89476 (arr!43207 (Array (_ BitVec 32) (_ BitVec 64))) (size!43758 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89475)

(declare-datatypes ((List!30646 0))(
  ( (Nil!30643) (Cons!30642 (h!31860 (_ BitVec 64)) (t!44564 List!30646)) )
))
(declare-fun arrayNoDuplicates!0 (array!89475 (_ BitVec 32) List!30646) Bool)

(assert (=> b!1325575 (= res!879508 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30643))))

(declare-fun b!1325576 () Bool)

(declare-fun res!879510 () Bool)

(assert (=> b!1325576 (=> (not res!879510) (not e!755793))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53417 0))(
  ( (V!53418 (val!18192 Int)) )
))
(declare-datatypes ((ValueCell!17219 0))(
  ( (ValueCellFull!17219 (v!20817 V!53417)) (EmptyCell!17219) )
))
(declare-datatypes ((array!89477 0))(
  ( (array!89478 (arr!43208 (Array (_ BitVec 32) ValueCell!17219)) (size!43759 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89477)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1325576 (= res!879510 (and (= (size!43759 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43758 _keys!1609) (size!43759 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56000 () Bool)

(declare-fun mapRes!56000 () Bool)

(assert (=> mapIsEmpty!56000 mapRes!56000))

(declare-fun b!1325577 () Bool)

(declare-fun res!879511 () Bool)

(assert (=> b!1325577 (=> (not res!879511) (not e!755793))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325577 (= res!879511 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43758 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!879507 () Bool)

(assert (=> start!111982 (=> (not res!879507) (not e!755793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111982 (= res!879507 (validMask!0 mask!2019))))

(assert (=> start!111982 e!755793))

(declare-fun array_inv!32891 (array!89475) Bool)

(assert (=> start!111982 (array_inv!32891 _keys!1609)))

(assert (=> start!111982 true))

(declare-fun tp_is_empty!36235 () Bool)

(assert (=> start!111982 tp_is_empty!36235))

(declare-fun e!755796 () Bool)

(declare-fun array_inv!32892 (array!89477) Bool)

(assert (=> start!111982 (and (array_inv!32892 _values!1337) e!755796)))

(assert (=> start!111982 tp!106721))

(declare-fun mapNonEmpty!56000 () Bool)

(declare-fun tp!106720 () Bool)

(declare-fun e!755797 () Bool)

(assert (=> mapNonEmpty!56000 (= mapRes!56000 (and tp!106720 e!755797))))

(declare-fun mapValue!56000 () ValueCell!17219)

(declare-fun mapKey!56000 () (_ BitVec 32))

(declare-fun mapRest!56000 () (Array (_ BitVec 32) ValueCell!17219))

(assert (=> mapNonEmpty!56000 (= (arr!43208 _values!1337) (store mapRest!56000 mapKey!56000 mapValue!56000))))

(declare-fun b!1325578 () Bool)

(declare-fun res!879509 () Bool)

(assert (=> b!1325578 (=> (not res!879509) (not e!755793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89475 (_ BitVec 32)) Bool)

(assert (=> b!1325578 (= res!879509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325579 () Bool)

(assert (=> b!1325579 (= e!755793 false)))

(declare-fun lt!589931 () Bool)

(declare-fun zeroValue!1279 () V!53417)

(declare-fun minValue!1279 () V!53417)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23494 0))(
  ( (tuple2!23495 (_1!11758 (_ BitVec 64)) (_2!11758 V!53417)) )
))
(declare-datatypes ((List!30647 0))(
  ( (Nil!30644) (Cons!30643 (h!31861 tuple2!23494) (t!44565 List!30647)) )
))
(declare-datatypes ((ListLongMap!21159 0))(
  ( (ListLongMap!21160 (toList!10595 List!30647)) )
))
(declare-fun contains!8762 (ListLongMap!21159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5578 (array!89475 array!89477 (_ BitVec 32) (_ BitVec 32) V!53417 V!53417 (_ BitVec 32) Int) ListLongMap!21159)

(assert (=> b!1325579 (= lt!589931 (contains!8762 (getCurrentListMap!5578 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325580 () Bool)

(declare-fun e!755795 () Bool)

(assert (=> b!1325580 (= e!755795 tp_is_empty!36235)))

(declare-fun b!1325581 () Bool)

(assert (=> b!1325581 (= e!755797 tp_is_empty!36235)))

(declare-fun b!1325582 () Bool)

(assert (=> b!1325582 (= e!755796 (and e!755795 mapRes!56000))))

(declare-fun condMapEmpty!56000 () Bool)

(declare-fun mapDefault!56000 () ValueCell!17219)

(assert (=> b!1325582 (= condMapEmpty!56000 (= (arr!43208 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17219)) mapDefault!56000)))))

(assert (= (and start!111982 res!879507) b!1325576))

(assert (= (and b!1325576 res!879510) b!1325578))

(assert (= (and b!1325578 res!879509) b!1325575))

(assert (= (and b!1325575 res!879508) b!1325577))

(assert (= (and b!1325577 res!879511) b!1325579))

(assert (= (and b!1325582 condMapEmpty!56000) mapIsEmpty!56000))

(assert (= (and b!1325582 (not condMapEmpty!56000)) mapNonEmpty!56000))

(get-info :version)

(assert (= (and mapNonEmpty!56000 ((_ is ValueCellFull!17219) mapValue!56000)) b!1325581))

(assert (= (and b!1325582 ((_ is ValueCellFull!17219) mapDefault!56000)) b!1325580))

(assert (= start!111982 b!1325582))

(declare-fun m!1214789 () Bool)

(assert (=> b!1325575 m!1214789))

(declare-fun m!1214791 () Bool)

(assert (=> start!111982 m!1214791))

(declare-fun m!1214793 () Bool)

(assert (=> start!111982 m!1214793))

(declare-fun m!1214795 () Bool)

(assert (=> start!111982 m!1214795))

(declare-fun m!1214797 () Bool)

(assert (=> b!1325579 m!1214797))

(assert (=> b!1325579 m!1214797))

(declare-fun m!1214799 () Bool)

(assert (=> b!1325579 m!1214799))

(declare-fun m!1214801 () Bool)

(assert (=> mapNonEmpty!56000 m!1214801))

(declare-fun m!1214803 () Bool)

(assert (=> b!1325578 m!1214803))

(check-sat (not b!1325578) (not b_next!30415) tp_is_empty!36235 b_and!48955 (not mapNonEmpty!56000) (not b!1325575) (not start!111982) (not b!1325579))
(check-sat b_and!48955 (not b_next!30415))
