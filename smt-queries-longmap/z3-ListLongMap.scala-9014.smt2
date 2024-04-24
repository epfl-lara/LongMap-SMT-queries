; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109068 () Bool)

(assert start!109068)

(declare-fun b_free!28357 () Bool)

(declare-fun b_next!28357 () Bool)

(assert (=> start!109068 (= b_free!28357 (not b_next!28357))))

(declare-fun tp!100186 () Bool)

(declare-fun b_and!46425 () Bool)

(assert (=> start!109068 (= tp!100186 b_and!46425)))

(declare-fun b!1286720 () Bool)

(declare-fun res!854438 () Bool)

(declare-fun e!735086 () Bool)

(assert (=> b!1286720 (=> (not res!854438) (not e!735086))))

(declare-datatypes ((array!85079 0))(
  ( (array!85080 (arr!41037 (Array (_ BitVec 32) (_ BitVec 64))) (size!41588 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85079)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85079 (_ BitVec 32)) Bool)

(assert (=> b!1286720 (= res!854438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286721 () Bool)

(declare-fun e!735085 () Bool)

(declare-fun tp_is_empty!33997 () Bool)

(assert (=> b!1286721 (= e!735085 tp_is_empty!33997)))

(declare-fun mapIsEmpty!52553 () Bool)

(declare-fun mapRes!52553 () Bool)

(assert (=> mapIsEmpty!52553 mapRes!52553))

(declare-fun b!1286722 () Bool)

(declare-fun res!854439 () Bool)

(assert (=> b!1286722 (=> (not res!854439) (not e!735086))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1286722 (= res!854439 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41588 _keys!1741))))))

(declare-fun b!1286723 () Bool)

(declare-fun res!854440 () Bool)

(assert (=> b!1286723 (=> (not res!854440) (not e!735086))))

(declare-datatypes ((List!29107 0))(
  ( (Nil!29104) (Cons!29103 (h!30321 (_ BitVec 64)) (t!42643 List!29107)) )
))
(declare-fun arrayNoDuplicates!0 (array!85079 (_ BitVec 32) List!29107) Bool)

(assert (=> b!1286723 (= res!854440 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29104))))

(declare-fun b!1286724 () Bool)

(declare-fun res!854437 () Bool)

(assert (=> b!1286724 (=> (not res!854437) (not e!735086))))

(declare-datatypes ((V!50433 0))(
  ( (V!50434 (val!17073 Int)) )
))
(declare-datatypes ((ValueCell!16100 0))(
  ( (ValueCellFull!16100 (v!19670 V!50433)) (EmptyCell!16100) )
))
(declare-datatypes ((array!85081 0))(
  ( (array!85082 (arr!41038 (Array (_ BitVec 32) ValueCell!16100)) (size!41589 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85081)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1286724 (= res!854437 (and (= (size!41589 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41588 _keys!1741) (size!41589 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286725 () Bool)

(declare-fun e!735087 () Bool)

(assert (=> b!1286725 (= e!735087 tp_is_empty!33997)))

(declare-fun b!1286726 () Bool)

(declare-fun e!735083 () Bool)

(assert (=> b!1286726 (= e!735083 (and e!735087 mapRes!52553))))

(declare-fun condMapEmpty!52553 () Bool)

(declare-fun mapDefault!52553 () ValueCell!16100)

(assert (=> b!1286726 (= condMapEmpty!52553 (= (arr!41038 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16100)) mapDefault!52553)))))

(declare-fun b!1286727 () Bool)

(assert (=> b!1286727 (= e!735086 false)))

(declare-fun minValue!1387 () V!50433)

(declare-fun zeroValue!1387 () V!50433)

(declare-fun lt!577397 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21906 0))(
  ( (tuple2!21907 (_1!10964 (_ BitVec 64)) (_2!10964 V!50433)) )
))
(declare-datatypes ((List!29108 0))(
  ( (Nil!29105) (Cons!29104 (h!30322 tuple2!21906) (t!42644 List!29108)) )
))
(declare-datatypes ((ListLongMap!19571 0))(
  ( (ListLongMap!19572 (toList!9801 List!29108)) )
))
(declare-fun contains!7932 (ListLongMap!19571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4865 (array!85079 array!85081 (_ BitVec 32) (_ BitVec 32) V!50433 V!50433 (_ BitVec 32) Int) ListLongMap!19571)

(assert (=> b!1286727 (= lt!577397 (contains!7932 (getCurrentListMap!4865 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!854436 () Bool)

(assert (=> start!109068 (=> (not res!854436) (not e!735086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109068 (= res!854436 (validMask!0 mask!2175))))

(assert (=> start!109068 e!735086))

(assert (=> start!109068 tp_is_empty!33997))

(assert (=> start!109068 true))

(declare-fun array_inv!31335 (array!85081) Bool)

(assert (=> start!109068 (and (array_inv!31335 _values!1445) e!735083)))

(declare-fun array_inv!31336 (array!85079) Bool)

(assert (=> start!109068 (array_inv!31336 _keys!1741)))

(assert (=> start!109068 tp!100186))

(declare-fun mapNonEmpty!52553 () Bool)

(declare-fun tp!100187 () Bool)

(assert (=> mapNonEmpty!52553 (= mapRes!52553 (and tp!100187 e!735085))))

(declare-fun mapRest!52553 () (Array (_ BitVec 32) ValueCell!16100))

(declare-fun mapKey!52553 () (_ BitVec 32))

(declare-fun mapValue!52553 () ValueCell!16100)

(assert (=> mapNonEmpty!52553 (= (arr!41038 _values!1445) (store mapRest!52553 mapKey!52553 mapValue!52553))))

(assert (= (and start!109068 res!854436) b!1286724))

(assert (= (and b!1286724 res!854437) b!1286720))

(assert (= (and b!1286720 res!854438) b!1286723))

(assert (= (and b!1286723 res!854440) b!1286722))

(assert (= (and b!1286722 res!854439) b!1286727))

(assert (= (and b!1286726 condMapEmpty!52553) mapIsEmpty!52553))

(assert (= (and b!1286726 (not condMapEmpty!52553)) mapNonEmpty!52553))

(get-info :version)

(assert (= (and mapNonEmpty!52553 ((_ is ValueCellFull!16100) mapValue!52553)) b!1286721))

(assert (= (and b!1286726 ((_ is ValueCellFull!16100) mapDefault!52553)) b!1286725))

(assert (= start!109068 b!1286726))

(declare-fun m!1180393 () Bool)

(assert (=> mapNonEmpty!52553 m!1180393))

(declare-fun m!1180395 () Bool)

(assert (=> b!1286723 m!1180395))

(declare-fun m!1180397 () Bool)

(assert (=> b!1286720 m!1180397))

(declare-fun m!1180399 () Bool)

(assert (=> start!109068 m!1180399))

(declare-fun m!1180401 () Bool)

(assert (=> start!109068 m!1180401))

(declare-fun m!1180403 () Bool)

(assert (=> start!109068 m!1180403))

(declare-fun m!1180405 () Bool)

(assert (=> b!1286727 m!1180405))

(assert (=> b!1286727 m!1180405))

(declare-fun m!1180407 () Bool)

(assert (=> b!1286727 m!1180407))

(check-sat tp_is_empty!33997 (not b!1286720) (not b_next!28357) (not start!109068) b_and!46425 (not b!1286727) (not mapNonEmpty!52553) (not b!1286723))
(check-sat b_and!46425 (not b_next!28357))
