; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108488 () Bool)

(assert start!108488)

(declare-fun b_free!28035 () Bool)

(declare-fun b_next!28035 () Bool)

(assert (=> start!108488 (= b_free!28035 (not b_next!28035))))

(declare-fun tp!99215 () Bool)

(declare-fun b_and!46095 () Bool)

(assert (=> start!108488 (= tp!99215 b_and!46095)))

(declare-fun mapIsEmpty!52064 () Bool)

(declare-fun mapRes!52064 () Bool)

(assert (=> mapIsEmpty!52064 mapRes!52064))

(declare-fun b!1280433 () Bool)

(declare-fun e!731629 () Bool)

(declare-fun tp_is_empty!33675 () Bool)

(assert (=> b!1280433 (= e!731629 tp_is_empty!33675)))

(declare-fun b!1280434 () Bool)

(declare-fun e!731627 () Bool)

(assert (=> b!1280434 (= e!731627 (and e!731629 mapRes!52064))))

(declare-fun condMapEmpty!52064 () Bool)

(declare-datatypes ((V!50003 0))(
  ( (V!50004 (val!16912 Int)) )
))
(declare-datatypes ((ValueCell!15939 0))(
  ( (ValueCellFull!15939 (v!19512 V!50003)) (EmptyCell!15939) )
))
(declare-datatypes ((array!84428 0))(
  ( (array!84429 (arr!40718 (Array (_ BitVec 32) ValueCell!15939)) (size!41268 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84428)

(declare-fun mapDefault!52064 () ValueCell!15939)

(assert (=> b!1280434 (= condMapEmpty!52064 (= (arr!40718 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15939)) mapDefault!52064)))))

(declare-fun b!1280435 () Bool)

(declare-fun res!850535 () Bool)

(declare-fun e!731628 () Bool)

(assert (=> b!1280435 (=> (not res!850535) (not e!731628))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84430 0))(
  ( (array!84431 (arr!40719 (Array (_ BitVec 32) (_ BitVec 64))) (size!41269 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84430)

(assert (=> b!1280435 (= res!850535 (and (= (size!41268 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41269 _keys!1741) (size!41268 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280436 () Bool)

(assert (=> b!1280436 (= e!731628 false)))

(declare-fun minValue!1387 () V!50003)

(declare-fun zeroValue!1387 () V!50003)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576125 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21644 0))(
  ( (tuple2!21645 (_1!10833 (_ BitVec 64)) (_2!10833 V!50003)) )
))
(declare-datatypes ((List!28842 0))(
  ( (Nil!28839) (Cons!28838 (h!30047 tuple2!21644) (t!42382 List!28842)) )
))
(declare-datatypes ((ListLongMap!19301 0))(
  ( (ListLongMap!19302 (toList!9666 List!28842)) )
))
(declare-fun contains!7781 (ListLongMap!19301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4750 (array!84430 array!84428 (_ BitVec 32) (_ BitVec 32) V!50003 V!50003 (_ BitVec 32) Int) ListLongMap!19301)

(assert (=> b!1280436 (= lt!576125 (contains!7781 (getCurrentListMap!4750 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280437 () Bool)

(declare-fun e!731630 () Bool)

(assert (=> b!1280437 (= e!731630 tp_is_empty!33675)))

(declare-fun res!850534 () Bool)

(assert (=> start!108488 (=> (not res!850534) (not e!731628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108488 (= res!850534 (validMask!0 mask!2175))))

(assert (=> start!108488 e!731628))

(assert (=> start!108488 tp_is_empty!33675))

(assert (=> start!108488 true))

(declare-fun array_inv!30903 (array!84428) Bool)

(assert (=> start!108488 (and (array_inv!30903 _values!1445) e!731627)))

(declare-fun array_inv!30904 (array!84430) Bool)

(assert (=> start!108488 (array_inv!30904 _keys!1741)))

(assert (=> start!108488 tp!99215))

(declare-fun b!1280438 () Bool)

(declare-fun res!850532 () Bool)

(assert (=> b!1280438 (=> (not res!850532) (not e!731628))))

(assert (=> b!1280438 (= res!850532 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41269 _keys!1741))))))

(declare-fun b!1280439 () Bool)

(declare-fun res!850533 () Bool)

(assert (=> b!1280439 (=> (not res!850533) (not e!731628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84430 (_ BitVec 32)) Bool)

(assert (=> b!1280439 (= res!850533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280440 () Bool)

(declare-fun res!850531 () Bool)

(assert (=> b!1280440 (=> (not res!850531) (not e!731628))))

(declare-datatypes ((List!28843 0))(
  ( (Nil!28840) (Cons!28839 (h!30048 (_ BitVec 64)) (t!42383 List!28843)) )
))
(declare-fun arrayNoDuplicates!0 (array!84430 (_ BitVec 32) List!28843) Bool)

(assert (=> b!1280440 (= res!850531 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28840))))

(declare-fun mapNonEmpty!52064 () Bool)

(declare-fun tp!99214 () Bool)

(assert (=> mapNonEmpty!52064 (= mapRes!52064 (and tp!99214 e!731630))))

(declare-fun mapRest!52064 () (Array (_ BitVec 32) ValueCell!15939))

(declare-fun mapValue!52064 () ValueCell!15939)

(declare-fun mapKey!52064 () (_ BitVec 32))

(assert (=> mapNonEmpty!52064 (= (arr!40718 _values!1445) (store mapRest!52064 mapKey!52064 mapValue!52064))))

(assert (= (and start!108488 res!850534) b!1280435))

(assert (= (and b!1280435 res!850535) b!1280439))

(assert (= (and b!1280439 res!850533) b!1280440))

(assert (= (and b!1280440 res!850531) b!1280438))

(assert (= (and b!1280438 res!850532) b!1280436))

(assert (= (and b!1280434 condMapEmpty!52064) mapIsEmpty!52064))

(assert (= (and b!1280434 (not condMapEmpty!52064)) mapNonEmpty!52064))

(get-info :version)

(assert (= (and mapNonEmpty!52064 ((_ is ValueCellFull!15939) mapValue!52064)) b!1280437))

(assert (= (and b!1280434 ((_ is ValueCellFull!15939) mapDefault!52064)) b!1280433))

(assert (= start!108488 b!1280434))

(declare-fun m!1175061 () Bool)

(assert (=> start!108488 m!1175061))

(declare-fun m!1175063 () Bool)

(assert (=> start!108488 m!1175063))

(declare-fun m!1175065 () Bool)

(assert (=> start!108488 m!1175065))

(declare-fun m!1175067 () Bool)

(assert (=> b!1280436 m!1175067))

(assert (=> b!1280436 m!1175067))

(declare-fun m!1175069 () Bool)

(assert (=> b!1280436 m!1175069))

(declare-fun m!1175071 () Bool)

(assert (=> b!1280439 m!1175071))

(declare-fun m!1175073 () Bool)

(assert (=> mapNonEmpty!52064 m!1175073))

(declare-fun m!1175075 () Bool)

(assert (=> b!1280440 m!1175075))

(check-sat (not b!1280440) (not mapNonEmpty!52064) tp_is_empty!33675 (not start!108488) (not b!1280439) b_and!46095 (not b_next!28035) (not b!1280436))
(check-sat b_and!46095 (not b_next!28035))
