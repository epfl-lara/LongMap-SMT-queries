; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108858 () Bool)

(assert start!108858)

(declare-fun b_free!28371 () Bool)

(declare-fun b_next!28371 () Bool)

(assert (=> start!108858 (= b_free!28371 (not b_next!28371))))

(declare-fun tp!100228 () Bool)

(declare-fun b_and!46437 () Bool)

(assert (=> start!108858 (= tp!100228 b_and!46437)))

(declare-fun res!854023 () Bool)

(declare-fun e!734342 () Bool)

(assert (=> start!108858 (=> (not res!854023) (not e!734342))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108858 (= res!854023 (validMask!0 mask!2175))))

(assert (=> start!108858 e!734342))

(declare-fun tp_is_empty!34011 () Bool)

(assert (=> start!108858 tp_is_empty!34011))

(assert (=> start!108858 true))

(declare-datatypes ((V!50451 0))(
  ( (V!50452 (val!17080 Int)) )
))
(declare-datatypes ((ValueCell!16107 0))(
  ( (ValueCellFull!16107 (v!19682 V!50451)) (EmptyCell!16107) )
))
(declare-datatypes ((array!85076 0))(
  ( (array!85077 (arr!41040 (Array (_ BitVec 32) ValueCell!16107)) (size!41590 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85076)

(declare-fun e!734345 () Bool)

(declare-fun array_inv!31121 (array!85076) Bool)

(assert (=> start!108858 (and (array_inv!31121 _values!1445) e!734345)))

(declare-datatypes ((array!85078 0))(
  ( (array!85079 (arr!41041 (Array (_ BitVec 32) (_ BitVec 64))) (size!41591 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85078)

(declare-fun array_inv!31122 (array!85078) Bool)

(assert (=> start!108858 (array_inv!31122 _keys!1741)))

(assert (=> start!108858 tp!100228))

(declare-fun b!1285583 () Bool)

(declare-fun res!854021 () Bool)

(assert (=> b!1285583 (=> (not res!854021) (not e!734342))))

(declare-datatypes ((List!29083 0))(
  ( (Nil!29080) (Cons!29079 (h!30288 (_ BitVec 64)) (t!42627 List!29083)) )
))
(declare-fun arrayNoDuplicates!0 (array!85078 (_ BitVec 32) List!29083) Bool)

(assert (=> b!1285583 (= res!854021 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29080))))

(declare-fun b!1285584 () Bool)

(declare-fun e!734343 () Bool)

(declare-fun mapRes!52574 () Bool)

(assert (=> b!1285584 (= e!734345 (and e!734343 mapRes!52574))))

(declare-fun condMapEmpty!52574 () Bool)

(declare-fun mapDefault!52574 () ValueCell!16107)

(assert (=> b!1285584 (= condMapEmpty!52574 (= (arr!41040 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16107)) mapDefault!52574)))))

(declare-fun b!1285585 () Bool)

(declare-fun res!854025 () Bool)

(assert (=> b!1285585 (=> (not res!854025) (not e!734342))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1285585 (= res!854025 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41591 _keys!1741))))))

(declare-fun b!1285586 () Bool)

(declare-fun res!854024 () Bool)

(assert (=> b!1285586 (=> (not res!854024) (not e!734342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85078 (_ BitVec 32)) Bool)

(assert (=> b!1285586 (= res!854024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285587 () Bool)

(declare-fun res!854022 () Bool)

(assert (=> b!1285587 (=> (not res!854022) (not e!734342))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285587 (= res!854022 (and (= (size!41590 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41591 _keys!1741) (size!41590 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52574 () Bool)

(declare-fun tp!100229 () Bool)

(declare-fun e!734344 () Bool)

(assert (=> mapNonEmpty!52574 (= mapRes!52574 (and tp!100229 e!734344))))

(declare-fun mapValue!52574 () ValueCell!16107)

(declare-fun mapKey!52574 () (_ BitVec 32))

(declare-fun mapRest!52574 () (Array (_ BitVec 32) ValueCell!16107))

(assert (=> mapNonEmpty!52574 (= (arr!41040 _values!1445) (store mapRest!52574 mapKey!52574 mapValue!52574))))

(declare-fun mapIsEmpty!52574 () Bool)

(assert (=> mapIsEmpty!52574 mapRes!52574))

(declare-fun b!1285588 () Bool)

(assert (=> b!1285588 (= e!734342 false)))

(declare-fun minValue!1387 () V!50451)

(declare-fun zeroValue!1387 () V!50451)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576934 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21894 0))(
  ( (tuple2!21895 (_1!10958 (_ BitVec 64)) (_2!10958 V!50451)) )
))
(declare-datatypes ((List!29084 0))(
  ( (Nil!29081) (Cons!29080 (h!30289 tuple2!21894) (t!42628 List!29084)) )
))
(declare-datatypes ((ListLongMap!19551 0))(
  ( (ListLongMap!19552 (toList!9791 List!29084)) )
))
(declare-fun contains!7908 (ListLongMap!19551 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4869 (array!85078 array!85076 (_ BitVec 32) (_ BitVec 32) V!50451 V!50451 (_ BitVec 32) Int) ListLongMap!19551)

(assert (=> b!1285588 (= lt!576934 (contains!7908 (getCurrentListMap!4869 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285589 () Bool)

(assert (=> b!1285589 (= e!734344 tp_is_empty!34011)))

(declare-fun b!1285590 () Bool)

(assert (=> b!1285590 (= e!734343 tp_is_empty!34011)))

(assert (= (and start!108858 res!854023) b!1285587))

(assert (= (and b!1285587 res!854022) b!1285586))

(assert (= (and b!1285586 res!854024) b!1285583))

(assert (= (and b!1285583 res!854021) b!1285585))

(assert (= (and b!1285585 res!854025) b!1285588))

(assert (= (and b!1285584 condMapEmpty!52574) mapIsEmpty!52574))

(assert (= (and b!1285584 (not condMapEmpty!52574)) mapNonEmpty!52574))

(get-info :version)

(assert (= (and mapNonEmpty!52574 ((_ is ValueCellFull!16107) mapValue!52574)) b!1285589))

(assert (= (and b!1285584 ((_ is ValueCellFull!16107) mapDefault!52574)) b!1285590))

(assert (= start!108858 b!1285584))

(declare-fun m!1178893 () Bool)

(assert (=> b!1285588 m!1178893))

(assert (=> b!1285588 m!1178893))

(declare-fun m!1178895 () Bool)

(assert (=> b!1285588 m!1178895))

(declare-fun m!1178897 () Bool)

(assert (=> mapNonEmpty!52574 m!1178897))

(declare-fun m!1178899 () Bool)

(assert (=> b!1285583 m!1178899))

(declare-fun m!1178901 () Bool)

(assert (=> start!108858 m!1178901))

(declare-fun m!1178903 () Bool)

(assert (=> start!108858 m!1178903))

(declare-fun m!1178905 () Bool)

(assert (=> start!108858 m!1178905))

(declare-fun m!1178907 () Bool)

(assert (=> b!1285586 m!1178907))

(check-sat (not b!1285583) tp_is_empty!34011 (not b!1285588) (not mapNonEmpty!52574) (not start!108858) b_and!46437 (not b!1285586) (not b_next!28371))
(check-sat b_and!46437 (not b_next!28371))
