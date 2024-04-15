; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111362 () Bool)

(assert start!111362)

(declare-fun b_free!30019 () Bool)

(declare-fun b_next!30019 () Bool)

(assert (=> start!111362 (= b_free!30019 (not b_next!30019))))

(declare-fun tp!105534 () Bool)

(declare-fun b_and!48221 () Bool)

(assert (=> start!111362 (= tp!105534 b_and!48221)))

(declare-fun b!1317678 () Bool)

(declare-fun e!751948 () Bool)

(assert (=> b!1317678 (= e!751948 false)))

(declare-datatypes ((array!88547 0))(
  ( (array!88548 (arr!42748 (Array (_ BitVec 32) (_ BitVec 64))) (size!43300 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88547)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52889 0))(
  ( (V!52890 (val!17994 Int)) )
))
(declare-fun zeroValue!1279 () V!52889)

(declare-datatypes ((ValueCell!17021 0))(
  ( (ValueCellFull!17021 (v!20623 V!52889)) (EmptyCell!17021) )
))
(declare-datatypes ((array!88549 0))(
  ( (array!88550 (arr!42749 (Array (_ BitVec 32) ValueCell!17021)) (size!43301 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88549)

(declare-fun minValue!1279 () V!52889)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!586218 () Bool)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23240 0))(
  ( (tuple2!23241 (_1!11631 (_ BitVec 64)) (_2!11631 V!52889)) )
))
(declare-datatypes ((List!30380 0))(
  ( (Nil!30377) (Cons!30376 (h!31585 tuple2!23240) (t!43980 List!30380)) )
))
(declare-datatypes ((ListLongMap!20897 0))(
  ( (ListLongMap!20898 (toList!10464 List!30380)) )
))
(declare-fun contains!8547 (ListLongMap!20897 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5359 (array!88547 array!88549 (_ BitVec 32) (_ BitVec 32) V!52889 V!52889 (_ BitVec 32) Int) ListLongMap!20897)

(assert (=> b!1317678 (= lt!586218 (contains!8547 (getCurrentListMap!5359 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1317679 () Bool)

(declare-fun e!751951 () Bool)

(declare-fun tp_is_empty!35839 () Bool)

(assert (=> b!1317679 (= e!751951 tp_is_empty!35839)))

(declare-fun b!1317680 () Bool)

(declare-fun res!874534 () Bool)

(assert (=> b!1317680 (=> (not res!874534) (not e!751948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88547 (_ BitVec 32)) Bool)

(assert (=> b!1317680 (= res!874534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317681 () Bool)

(declare-fun e!751950 () Bool)

(assert (=> b!1317681 (= e!751950 tp_is_empty!35839)))

(declare-fun mapIsEmpty!55406 () Bool)

(declare-fun mapRes!55406 () Bool)

(assert (=> mapIsEmpty!55406 mapRes!55406))

(declare-fun res!874535 () Bool)

(assert (=> start!111362 (=> (not res!874535) (not e!751948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111362 (= res!874535 (validMask!0 mask!2019))))

(assert (=> start!111362 e!751948))

(declare-fun array_inv!32463 (array!88547) Bool)

(assert (=> start!111362 (array_inv!32463 _keys!1609)))

(assert (=> start!111362 true))

(assert (=> start!111362 tp_is_empty!35839))

(declare-fun e!751947 () Bool)

(declare-fun array_inv!32464 (array!88549) Bool)

(assert (=> start!111362 (and (array_inv!32464 _values!1337) e!751947)))

(assert (=> start!111362 tp!105534))

(declare-fun mapNonEmpty!55406 () Bool)

(declare-fun tp!105533 () Bool)

(assert (=> mapNonEmpty!55406 (= mapRes!55406 (and tp!105533 e!751951))))

(declare-fun mapKey!55406 () (_ BitVec 32))

(declare-fun mapRest!55406 () (Array (_ BitVec 32) ValueCell!17021))

(declare-fun mapValue!55406 () ValueCell!17021)

(assert (=> mapNonEmpty!55406 (= (arr!42749 _values!1337) (store mapRest!55406 mapKey!55406 mapValue!55406))))

(declare-fun b!1317682 () Bool)

(declare-fun res!874532 () Bool)

(assert (=> b!1317682 (=> (not res!874532) (not e!751948))))

(assert (=> b!1317682 (= res!874532 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43300 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317683 () Bool)

(assert (=> b!1317683 (= e!751947 (and e!751950 mapRes!55406))))

(declare-fun condMapEmpty!55406 () Bool)

(declare-fun mapDefault!55406 () ValueCell!17021)

(assert (=> b!1317683 (= condMapEmpty!55406 (= (arr!42749 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17021)) mapDefault!55406)))))

(declare-fun b!1317684 () Bool)

(declare-fun res!874533 () Bool)

(assert (=> b!1317684 (=> (not res!874533) (not e!751948))))

(declare-datatypes ((List!30381 0))(
  ( (Nil!30378) (Cons!30377 (h!31586 (_ BitVec 64)) (t!43981 List!30381)) )
))
(declare-fun arrayNoDuplicates!0 (array!88547 (_ BitVec 32) List!30381) Bool)

(assert (=> b!1317684 (= res!874533 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30378))))

(declare-fun b!1317685 () Bool)

(declare-fun res!874536 () Bool)

(assert (=> b!1317685 (=> (not res!874536) (not e!751948))))

(assert (=> b!1317685 (= res!874536 (and (= (size!43301 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43300 _keys!1609) (size!43301 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111362 res!874535) b!1317685))

(assert (= (and b!1317685 res!874536) b!1317680))

(assert (= (and b!1317680 res!874534) b!1317684))

(assert (= (and b!1317684 res!874533) b!1317682))

(assert (= (and b!1317682 res!874532) b!1317678))

(assert (= (and b!1317683 condMapEmpty!55406) mapIsEmpty!55406))

(assert (= (and b!1317683 (not condMapEmpty!55406)) mapNonEmpty!55406))

(get-info :version)

(assert (= (and mapNonEmpty!55406 ((_ is ValueCellFull!17021) mapValue!55406)) b!1317679))

(assert (= (and b!1317683 ((_ is ValueCellFull!17021) mapDefault!55406)) b!1317681))

(assert (= start!111362 b!1317683))

(declare-fun m!1204983 () Bool)

(assert (=> b!1317680 m!1204983))

(declare-fun m!1204985 () Bool)

(assert (=> b!1317684 m!1204985))

(declare-fun m!1204987 () Bool)

(assert (=> start!111362 m!1204987))

(declare-fun m!1204989 () Bool)

(assert (=> start!111362 m!1204989))

(declare-fun m!1204991 () Bool)

(assert (=> start!111362 m!1204991))

(declare-fun m!1204993 () Bool)

(assert (=> b!1317678 m!1204993))

(assert (=> b!1317678 m!1204993))

(declare-fun m!1204995 () Bool)

(assert (=> b!1317678 m!1204995))

(declare-fun m!1204997 () Bool)

(assert (=> mapNonEmpty!55406 m!1204997))

(check-sat (not b!1317680) (not start!111362) (not b_next!30019) b_and!48221 (not b!1317678) tp_is_empty!35839 (not b!1317684) (not mapNonEmpty!55406))
(check-sat b_and!48221 (not b_next!30019))
