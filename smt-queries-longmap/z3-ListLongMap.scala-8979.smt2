; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108636 () Bool)

(assert start!108636)

(declare-fun b_free!28149 () Bool)

(declare-fun b_next!28149 () Bool)

(assert (=> start!108636 (= b_free!28149 (not b_next!28149))))

(declare-fun tp!99562 () Bool)

(declare-fun b_and!46215 () Bool)

(assert (=> start!108636 (= tp!99562 b_and!46215)))

(declare-fun b!1282325 () Bool)

(declare-fun res!851764 () Bool)

(declare-fun e!732676 () Bool)

(assert (=> b!1282325 (=> (not res!851764) (not e!732676))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50155 0))(
  ( (V!50156 (val!16969 Int)) )
))
(declare-datatypes ((ValueCell!15996 0))(
  ( (ValueCellFull!15996 (v!19571 V!50155)) (EmptyCell!15996) )
))
(declare-datatypes ((array!84648 0))(
  ( (array!84649 (arr!40826 (Array (_ BitVec 32) ValueCell!15996)) (size!41376 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84648)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84650 0))(
  ( (array!84651 (arr!40827 (Array (_ BitVec 32) (_ BitVec 64))) (size!41377 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84650)

(assert (=> b!1282325 (= res!851764 (and (= (size!41376 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41377 _keys!1741) (size!41376 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282326 () Bool)

(declare-fun res!851762 () Bool)

(assert (=> b!1282326 (=> (not res!851762) (not e!732676))))

(declare-datatypes ((List!28924 0))(
  ( (Nil!28921) (Cons!28920 (h!30129 (_ BitVec 64)) (t!42468 List!28924)) )
))
(declare-fun arrayNoDuplicates!0 (array!84650 (_ BitVec 32) List!28924) Bool)

(assert (=> b!1282326 (= res!851762 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28921))))

(declare-fun mapIsEmpty!52241 () Bool)

(declare-fun mapRes!52241 () Bool)

(assert (=> mapIsEmpty!52241 mapRes!52241))

(declare-fun b!1282327 () Bool)

(declare-fun res!851766 () Bool)

(assert (=> b!1282327 (=> (not res!851766) (not e!732676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84650 (_ BitVec 32)) Bool)

(assert (=> b!1282327 (= res!851766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282328 () Bool)

(declare-fun e!732678 () Bool)

(declare-fun tp_is_empty!33789 () Bool)

(assert (=> b!1282328 (= e!732678 tp_is_empty!33789)))

(declare-fun b!1282329 () Bool)

(declare-fun e!732680 () Bool)

(assert (=> b!1282329 (= e!732680 (and e!732678 mapRes!52241))))

(declare-fun condMapEmpty!52241 () Bool)

(declare-fun mapDefault!52241 () ValueCell!15996)

(assert (=> b!1282329 (= condMapEmpty!52241 (= (arr!40826 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15996)) mapDefault!52241)))))

(declare-fun b!1282330 () Bool)

(assert (=> b!1282330 (= e!732676 false)))

(declare-fun minValue!1387 () V!50155)

(declare-fun zeroValue!1387 () V!50155)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576520 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21730 0))(
  ( (tuple2!21731 (_1!10876 (_ BitVec 64)) (_2!10876 V!50155)) )
))
(declare-datatypes ((List!28925 0))(
  ( (Nil!28922) (Cons!28921 (h!30130 tuple2!21730) (t!42469 List!28925)) )
))
(declare-datatypes ((ListLongMap!19387 0))(
  ( (ListLongMap!19388 (toList!9709 List!28925)) )
))
(declare-fun contains!7826 (ListLongMap!19387 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4793 (array!84650 array!84648 (_ BitVec 32) (_ BitVec 32) V!50155 V!50155 (_ BitVec 32) Int) ListLongMap!19387)

(assert (=> b!1282330 (= lt!576520 (contains!7826 (getCurrentListMap!4793 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282331 () Bool)

(declare-fun res!851763 () Bool)

(assert (=> b!1282331 (=> (not res!851763) (not e!732676))))

(assert (=> b!1282331 (= res!851763 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41377 _keys!1741))))))

(declare-fun res!851765 () Bool)

(assert (=> start!108636 (=> (not res!851765) (not e!732676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108636 (= res!851765 (validMask!0 mask!2175))))

(assert (=> start!108636 e!732676))

(assert (=> start!108636 tp_is_empty!33789))

(assert (=> start!108636 true))

(declare-fun array_inv!30975 (array!84648) Bool)

(assert (=> start!108636 (and (array_inv!30975 _values!1445) e!732680)))

(declare-fun array_inv!30976 (array!84650) Bool)

(assert (=> start!108636 (array_inv!30976 _keys!1741)))

(assert (=> start!108636 tp!99562))

(declare-fun mapNonEmpty!52241 () Bool)

(declare-fun tp!99563 () Bool)

(declare-fun e!732677 () Bool)

(assert (=> mapNonEmpty!52241 (= mapRes!52241 (and tp!99563 e!732677))))

(declare-fun mapValue!52241 () ValueCell!15996)

(declare-fun mapKey!52241 () (_ BitVec 32))

(declare-fun mapRest!52241 () (Array (_ BitVec 32) ValueCell!15996))

(assert (=> mapNonEmpty!52241 (= (arr!40826 _values!1445) (store mapRest!52241 mapKey!52241 mapValue!52241))))

(declare-fun b!1282332 () Bool)

(assert (=> b!1282332 (= e!732677 tp_is_empty!33789)))

(assert (= (and start!108636 res!851765) b!1282325))

(assert (= (and b!1282325 res!851764) b!1282327))

(assert (= (and b!1282327 res!851766) b!1282326))

(assert (= (and b!1282326 res!851762) b!1282331))

(assert (= (and b!1282331 res!851763) b!1282330))

(assert (= (and b!1282329 condMapEmpty!52241) mapIsEmpty!52241))

(assert (= (and b!1282329 (not condMapEmpty!52241)) mapNonEmpty!52241))

(get-info :version)

(assert (= (and mapNonEmpty!52241 ((_ is ValueCellFull!15996) mapValue!52241)) b!1282332))

(assert (= (and b!1282329 ((_ is ValueCellFull!15996) mapDefault!52241)) b!1282328))

(assert (= start!108636 b!1282329))

(declare-fun m!1176565 () Bool)

(assert (=> start!108636 m!1176565))

(declare-fun m!1176567 () Bool)

(assert (=> start!108636 m!1176567))

(declare-fun m!1176569 () Bool)

(assert (=> start!108636 m!1176569))

(declare-fun m!1176571 () Bool)

(assert (=> b!1282327 m!1176571))

(declare-fun m!1176573 () Bool)

(assert (=> b!1282326 m!1176573))

(declare-fun m!1176575 () Bool)

(assert (=> b!1282330 m!1176575))

(assert (=> b!1282330 m!1176575))

(declare-fun m!1176577 () Bool)

(assert (=> b!1282330 m!1176577))

(declare-fun m!1176579 () Bool)

(assert (=> mapNonEmpty!52241 m!1176579))

(check-sat (not b_next!28149) (not b!1282326) b_and!46215 (not b!1282327) (not b!1282330) (not mapNonEmpty!52241) (not start!108636) tp_is_empty!33789)
(check-sat b_and!46215 (not b_next!28149))
