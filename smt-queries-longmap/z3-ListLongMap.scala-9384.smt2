; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111740 () Bool)

(assert start!111740)

(declare-fun b_free!30397 () Bool)

(declare-fun b_next!30397 () Bool)

(assert (=> start!111740 (= b_free!30397 (not b_next!30397))))

(declare-fun tp!106668 () Bool)

(declare-fun b_and!48917 () Bool)

(assert (=> start!111740 (= tp!106668 b_and!48917)))

(declare-fun mapNonEmpty!55973 () Bool)

(declare-fun mapRes!55973 () Bool)

(declare-fun tp!106667 () Bool)

(declare-fun e!754782 () Bool)

(assert (=> mapNonEmpty!55973 (= mapRes!55973 (and tp!106667 e!754782))))

(declare-datatypes ((V!53393 0))(
  ( (V!53394 (val!18183 Int)) )
))
(declare-datatypes ((ValueCell!17210 0))(
  ( (ValueCellFull!17210 (v!20812 V!53393)) (EmptyCell!17210) )
))
(declare-datatypes ((array!89279 0))(
  ( (array!89280 (arr!43114 (Array (_ BitVec 32) ValueCell!17210)) (size!43666 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89279)

(declare-fun mapValue!55973 () ValueCell!17210)

(declare-fun mapKey!55973 () (_ BitVec 32))

(declare-fun mapRest!55973 () (Array (_ BitVec 32) ValueCell!17210))

(assert (=> mapNonEmpty!55973 (= (arr!43114 _values!1337) (store mapRest!55973 mapKey!55973 mapValue!55973))))

(declare-fun b!1323990 () Bool)

(declare-fun res!878825 () Bool)

(declare-fun e!754784 () Bool)

(assert (=> b!1323990 (=> (not res!878825) (not e!754784))))

(declare-datatypes ((array!89281 0))(
  ( (array!89282 (arr!43115 (Array (_ BitVec 32) (_ BitVec 64))) (size!43667 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89281)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89281 (_ BitVec 32)) Bool)

(assert (=> b!1323990 (= res!878825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323991 () Bool)

(declare-fun res!878828 () Bool)

(assert (=> b!1323991 (=> (not res!878828) (not e!754784))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323991 (= res!878828 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43667 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55973 () Bool)

(assert (=> mapIsEmpty!55973 mapRes!55973))

(declare-fun b!1323992 () Bool)

(declare-fun tp_is_empty!36217 () Bool)

(assert (=> b!1323992 (= e!754782 tp_is_empty!36217)))

(declare-fun b!1323993 () Bool)

(declare-fun e!754786 () Bool)

(declare-fun e!754783 () Bool)

(assert (=> b!1323993 (= e!754786 (and e!754783 mapRes!55973))))

(declare-fun condMapEmpty!55973 () Bool)

(declare-fun mapDefault!55973 () ValueCell!17210)

(assert (=> b!1323993 (= condMapEmpty!55973 (= (arr!43114 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17210)) mapDefault!55973)))))

(declare-fun res!878829 () Bool)

(assert (=> start!111740 (=> (not res!878829) (not e!754784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111740 (= res!878829 (validMask!0 mask!2019))))

(assert (=> start!111740 e!754784))

(declare-fun array_inv!32731 (array!89281) Bool)

(assert (=> start!111740 (array_inv!32731 _keys!1609)))

(assert (=> start!111740 true))

(assert (=> start!111740 tp_is_empty!36217))

(declare-fun array_inv!32732 (array!89279) Bool)

(assert (=> start!111740 (and (array_inv!32732 _values!1337) e!754786)))

(assert (=> start!111740 tp!106668))

(declare-fun b!1323994 () Bool)

(declare-fun res!878827 () Bool)

(assert (=> b!1323994 (=> (not res!878827) (not e!754784))))

(assert (=> b!1323994 (= res!878827 (and (= (size!43666 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43667 _keys!1609) (size!43666 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323995 () Bool)

(assert (=> b!1323995 (= e!754784 false)))

(declare-fun zeroValue!1279 () V!53393)

(declare-fun minValue!1279 () V!53393)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589242 () Bool)

(declare-datatypes ((tuple2!23512 0))(
  ( (tuple2!23513 (_1!11767 (_ BitVec 64)) (_2!11767 V!53393)) )
))
(declare-datatypes ((List!30643 0))(
  ( (Nil!30640) (Cons!30639 (h!31848 tuple2!23512) (t!44561 List!30643)) )
))
(declare-datatypes ((ListLongMap!21169 0))(
  ( (ListLongMap!21170 (toList!10600 List!30643)) )
))
(declare-fun contains!8683 (ListLongMap!21169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5479 (array!89281 array!89279 (_ BitVec 32) (_ BitVec 32) V!53393 V!53393 (_ BitVec 32) Int) ListLongMap!21169)

(assert (=> b!1323995 (= lt!589242 (contains!8683 (getCurrentListMap!5479 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323996 () Bool)

(assert (=> b!1323996 (= e!754783 tp_is_empty!36217)))

(declare-fun b!1323997 () Bool)

(declare-fun res!878826 () Bool)

(assert (=> b!1323997 (=> (not res!878826) (not e!754784))))

(declare-datatypes ((List!30644 0))(
  ( (Nil!30641) (Cons!30640 (h!31849 (_ BitVec 64)) (t!44562 List!30644)) )
))
(declare-fun arrayNoDuplicates!0 (array!89281 (_ BitVec 32) List!30644) Bool)

(assert (=> b!1323997 (= res!878826 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30641))))

(assert (= (and start!111740 res!878829) b!1323994))

(assert (= (and b!1323994 res!878827) b!1323990))

(assert (= (and b!1323990 res!878825) b!1323997))

(assert (= (and b!1323997 res!878826) b!1323991))

(assert (= (and b!1323991 res!878828) b!1323995))

(assert (= (and b!1323993 condMapEmpty!55973) mapIsEmpty!55973))

(assert (= (and b!1323993 (not condMapEmpty!55973)) mapNonEmpty!55973))

(get-info :version)

(assert (= (and mapNonEmpty!55973 ((_ is ValueCellFull!17210) mapValue!55973)) b!1323992))

(assert (= (and b!1323993 ((_ is ValueCellFull!17210) mapDefault!55973)) b!1323996))

(assert (= start!111740 b!1323993))

(declare-fun m!1212531 () Bool)

(assert (=> b!1323997 m!1212531))

(declare-fun m!1212533 () Bool)

(assert (=> start!111740 m!1212533))

(declare-fun m!1212535 () Bool)

(assert (=> start!111740 m!1212535))

(declare-fun m!1212537 () Bool)

(assert (=> start!111740 m!1212537))

(declare-fun m!1212539 () Bool)

(assert (=> b!1323995 m!1212539))

(assert (=> b!1323995 m!1212539))

(declare-fun m!1212541 () Bool)

(assert (=> b!1323995 m!1212541))

(declare-fun m!1212543 () Bool)

(assert (=> mapNonEmpty!55973 m!1212543))

(declare-fun m!1212545 () Bool)

(assert (=> b!1323990 m!1212545))

(check-sat (not mapNonEmpty!55973) b_and!48917 (not b!1323997) (not start!111740) (not b!1323995) tp_is_empty!36217 (not b!1323990) (not b_next!30397))
(check-sat b_and!48917 (not b_next!30397))
