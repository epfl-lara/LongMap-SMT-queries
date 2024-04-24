; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109452 () Bool)

(assert start!109452)

(declare-fun b_free!28717 () Bool)

(declare-fun b_next!28717 () Bool)

(assert (=> start!109452 (= b_free!28717 (not b_next!28717))))

(declare-fun tp!101270 () Bool)

(declare-fun b_and!46809 () Bool)

(assert (=> start!109452 (= tp!101270 b_and!46809)))

(declare-fun b!1293456 () Bool)

(declare-fun res!859068 () Bool)

(declare-fun e!738401 () Bool)

(assert (=> b!1293456 (=> (not res!859068) (not e!738401))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50913 0))(
  ( (V!50914 (val!17253 Int)) )
))
(declare-datatypes ((ValueCell!16280 0))(
  ( (ValueCellFull!16280 (v!19851 V!50913)) (EmptyCell!16280) )
))
(declare-datatypes ((array!85779 0))(
  ( (array!85780 (arr!41386 (Array (_ BitVec 32) ValueCell!16280)) (size!41937 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85779)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85781 0))(
  ( (array!85782 (arr!41387 (Array (_ BitVec 32) (_ BitVec 64))) (size!41938 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85781)

(assert (=> b!1293456 (= res!859068 (and (= (size!41937 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41938 _keys!1741) (size!41937 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293457 () Bool)

(declare-fun e!738398 () Bool)

(declare-fun tp_is_empty!34357 () Bool)

(assert (=> b!1293457 (= e!738398 tp_is_empty!34357)))

(declare-fun b!1293458 () Bool)

(assert (=> b!1293458 (= e!738401 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22206 0))(
  ( (tuple2!22207 (_1!11114 (_ BitVec 64)) (_2!11114 V!50913)) )
))
(declare-datatypes ((List!29377 0))(
  ( (Nil!29374) (Cons!29373 (h!30591 tuple2!22206) (t!42933 List!29377)) )
))
(declare-datatypes ((ListLongMap!19871 0))(
  ( (ListLongMap!19872 (toList!9951 List!29377)) )
))
(declare-fun contains!8082 (ListLongMap!19871 (_ BitVec 64)) Bool)

(assert (=> b!1293458 (not (contains!8082 (ListLongMap!19872 Nil!29374) k0!1205))))

(declare-datatypes ((Unit!42743 0))(
  ( (Unit!42744) )
))
(declare-fun lt!579795 () Unit!42743)

(declare-fun emptyContainsNothing!117 ((_ BitVec 64)) Unit!42743)

(assert (=> b!1293458 (= lt!579795 (emptyContainsNothing!117 k0!1205))))

(declare-fun b!1293459 () Bool)

(declare-fun res!859066 () Bool)

(assert (=> b!1293459 (=> (not res!859066) (not e!738401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85781 (_ BitVec 32)) Bool)

(assert (=> b!1293459 (= res!859066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293460 () Bool)

(declare-fun res!859062 () Bool)

(assert (=> b!1293460 (=> (not res!859062) (not e!738401))))

(declare-datatypes ((List!29378 0))(
  ( (Nil!29375) (Cons!29374 (h!30592 (_ BitVec 64)) (t!42934 List!29378)) )
))
(declare-fun arrayNoDuplicates!0 (array!85781 (_ BitVec 32) List!29378) Bool)

(assert (=> b!1293460 (= res!859062 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29375))))

(declare-fun res!859067 () Bool)

(assert (=> start!109452 (=> (not res!859067) (not e!738401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109452 (= res!859067 (validMask!0 mask!2175))))

(assert (=> start!109452 e!738401))

(assert (=> start!109452 tp_is_empty!34357))

(assert (=> start!109452 true))

(declare-fun e!738399 () Bool)

(declare-fun array_inv!31587 (array!85779) Bool)

(assert (=> start!109452 (and (array_inv!31587 _values!1445) e!738399)))

(declare-fun array_inv!31588 (array!85781) Bool)

(assert (=> start!109452 (array_inv!31588 _keys!1741)))

(assert (=> start!109452 tp!101270))

(declare-fun b!1293461 () Bool)

(declare-fun res!859065 () Bool)

(assert (=> b!1293461 (=> (not res!859065) (not e!738401))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293461 (= res!859065 (not (validKeyInArray!0 (select (arr!41387 _keys!1741) from!2144))))))

(declare-fun b!1293462 () Bool)

(declare-fun e!738402 () Bool)

(assert (=> b!1293462 (= e!738402 tp_is_empty!34357)))

(declare-fun b!1293463 () Bool)

(declare-fun res!859064 () Bool)

(assert (=> b!1293463 (=> (not res!859064) (not e!738401))))

(declare-fun minValue!1387 () V!50913)

(declare-fun zeroValue!1387 () V!50913)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4984 (array!85781 array!85779 (_ BitVec 32) (_ BitVec 32) V!50913 V!50913 (_ BitVec 32) Int) ListLongMap!19871)

(assert (=> b!1293463 (= res!859064 (contains!8082 (getCurrentListMap!4984 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53096 () Bool)

(declare-fun mapRes!53096 () Bool)

(declare-fun tp!101269 () Bool)

(assert (=> mapNonEmpty!53096 (= mapRes!53096 (and tp!101269 e!738398))))

(declare-fun mapValue!53096 () ValueCell!16280)

(declare-fun mapRest!53096 () (Array (_ BitVec 32) ValueCell!16280))

(declare-fun mapKey!53096 () (_ BitVec 32))

(assert (=> mapNonEmpty!53096 (= (arr!41386 _values!1445) (store mapRest!53096 mapKey!53096 mapValue!53096))))

(declare-fun b!1293464 () Bool)

(assert (=> b!1293464 (= e!738399 (and e!738402 mapRes!53096))))

(declare-fun condMapEmpty!53096 () Bool)

(declare-fun mapDefault!53096 () ValueCell!16280)

(assert (=> b!1293464 (= condMapEmpty!53096 (= (arr!41386 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16280)) mapDefault!53096)))))

(declare-fun mapIsEmpty!53096 () Bool)

(assert (=> mapIsEmpty!53096 mapRes!53096))

(declare-fun b!1293465 () Bool)

(declare-fun res!859069 () Bool)

(assert (=> b!1293465 (=> (not res!859069) (not e!738401))))

(assert (=> b!1293465 (= res!859069 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41938 _keys!1741))))))

(declare-fun b!1293466 () Bool)

(declare-fun res!859063 () Bool)

(assert (=> b!1293466 (=> (not res!859063) (not e!738401))))

(assert (=> b!1293466 (= res!859063 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41938 _keys!1741))))))

(assert (= (and start!109452 res!859067) b!1293456))

(assert (= (and b!1293456 res!859068) b!1293459))

(assert (= (and b!1293459 res!859066) b!1293460))

(assert (= (and b!1293460 res!859062) b!1293465))

(assert (= (and b!1293465 res!859069) b!1293463))

(assert (= (and b!1293463 res!859064) b!1293466))

(assert (= (and b!1293466 res!859063) b!1293461))

(assert (= (and b!1293461 res!859065) b!1293458))

(assert (= (and b!1293464 condMapEmpty!53096) mapIsEmpty!53096))

(assert (= (and b!1293464 (not condMapEmpty!53096)) mapNonEmpty!53096))

(get-info :version)

(assert (= (and mapNonEmpty!53096 ((_ is ValueCellFull!16280) mapValue!53096)) b!1293457))

(assert (= (and b!1293464 ((_ is ValueCellFull!16280) mapDefault!53096)) b!1293462))

(assert (= start!109452 b!1293464))

(declare-fun m!1186401 () Bool)

(assert (=> b!1293463 m!1186401))

(assert (=> b!1293463 m!1186401))

(declare-fun m!1186403 () Bool)

(assert (=> b!1293463 m!1186403))

(declare-fun m!1186405 () Bool)

(assert (=> mapNonEmpty!53096 m!1186405))

(declare-fun m!1186407 () Bool)

(assert (=> b!1293459 m!1186407))

(declare-fun m!1186409 () Bool)

(assert (=> b!1293461 m!1186409))

(assert (=> b!1293461 m!1186409))

(declare-fun m!1186411 () Bool)

(assert (=> b!1293461 m!1186411))

(declare-fun m!1186413 () Bool)

(assert (=> b!1293460 m!1186413))

(declare-fun m!1186415 () Bool)

(assert (=> b!1293458 m!1186415))

(declare-fun m!1186417 () Bool)

(assert (=> b!1293458 m!1186417))

(declare-fun m!1186419 () Bool)

(assert (=> start!109452 m!1186419))

(declare-fun m!1186421 () Bool)

(assert (=> start!109452 m!1186421))

(declare-fun m!1186423 () Bool)

(assert (=> start!109452 m!1186423))

(check-sat (not b!1293463) tp_is_empty!34357 (not b!1293461) b_and!46809 (not mapNonEmpty!53096) (not b!1293459) (not b!1293458) (not b!1293460) (not start!109452) (not b_next!28717))
(check-sat b_and!46809 (not b_next!28717))
