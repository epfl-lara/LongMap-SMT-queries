; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108492 () Bool)

(assert start!108492)

(declare-fun b_free!28039 () Bool)

(declare-fun b_next!28039 () Bool)

(assert (=> start!108492 (= b_free!28039 (not b_next!28039))))

(declare-fun tp!99227 () Bool)

(declare-fun b_and!46081 () Bool)

(assert (=> start!108492 (= tp!99227 b_and!46081)))

(declare-fun b!1280421 () Bool)

(declare-fun e!731630 () Bool)

(declare-fun e!731629 () Bool)

(declare-fun mapRes!52070 () Bool)

(assert (=> b!1280421 (= e!731630 (and e!731629 mapRes!52070))))

(declare-fun condMapEmpty!52070 () Bool)

(declare-datatypes ((V!50009 0))(
  ( (V!50010 (val!16914 Int)) )
))
(declare-datatypes ((ValueCell!15941 0))(
  ( (ValueCellFull!15941 (v!19513 V!50009)) (EmptyCell!15941) )
))
(declare-datatypes ((array!84327 0))(
  ( (array!84328 (arr!40668 (Array (_ BitVec 32) ValueCell!15941)) (size!41220 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84327)

(declare-fun mapDefault!52070 () ValueCell!15941)

(assert (=> b!1280421 (= condMapEmpty!52070 (= (arr!40668 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15941)) mapDefault!52070)))))

(declare-fun b!1280422 () Bool)

(declare-fun res!850543 () Bool)

(declare-fun e!731628 () Bool)

(assert (=> b!1280422 (=> (not res!850543) (not e!731628))))

(declare-datatypes ((array!84329 0))(
  ( (array!84330 (arr!40669 (Array (_ BitVec 32) (_ BitVec 64))) (size!41221 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84329)

(declare-datatypes ((List!28911 0))(
  ( (Nil!28908) (Cons!28907 (h!30116 (_ BitVec 64)) (t!42443 List!28911)) )
))
(declare-fun arrayNoDuplicates!0 (array!84329 (_ BitVec 32) List!28911) Bool)

(assert (=> b!1280422 (= res!850543 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28908))))

(declare-fun b!1280423 () Bool)

(declare-fun tp_is_empty!33679 () Bool)

(assert (=> b!1280423 (= e!731629 tp_is_empty!33679)))

(declare-fun b!1280424 () Bool)

(declare-fun res!850542 () Bool)

(assert (=> b!1280424 (=> (not res!850542) (not e!731628))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84329 (_ BitVec 32)) Bool)

(assert (=> b!1280424 (= res!850542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280425 () Bool)

(assert (=> b!1280425 (= e!731628 (not true))))

(declare-fun minValue!1387 () V!50009)

(declare-fun zeroValue!1387 () V!50009)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21718 0))(
  ( (tuple2!21719 (_1!10870 (_ BitVec 64)) (_2!10870 V!50009)) )
))
(declare-datatypes ((List!28912 0))(
  ( (Nil!28909) (Cons!28908 (h!30117 tuple2!21718) (t!42444 List!28912)) )
))
(declare-datatypes ((ListLongMap!19375 0))(
  ( (ListLongMap!19376 (toList!9703 List!28912)) )
))
(declare-fun contains!7748 (ListLongMap!19375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4677 (array!84329 array!84327 (_ BitVec 32) (_ BitVec 32) V!50009 V!50009 (_ BitVec 32) Int) ListLongMap!19375)

(assert (=> b!1280425 (contains!7748 (getCurrentListMap!4677 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42239 0))(
  ( (Unit!42240) )
))
(declare-fun lt!575953 () Unit!42239)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!1 (array!84329 array!84327 (_ BitVec 32) (_ BitVec 32) V!50009 V!50009 (_ BitVec 64) (_ BitVec 32) Int) Unit!42239)

(assert (=> b!1280425 (= lt!575953 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!1 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280426 () Bool)

(declare-fun res!850541 () Bool)

(assert (=> b!1280426 (=> (not res!850541) (not e!731628))))

(assert (=> b!1280426 (= res!850541 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41221 _keys!1741)) (not (= (select (arr!40669 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1280427 () Bool)

(declare-fun res!850538 () Bool)

(assert (=> b!1280427 (=> (not res!850538) (not e!731628))))

(assert (=> b!1280427 (= res!850538 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41221 _keys!1741))))))

(declare-fun mapNonEmpty!52070 () Bool)

(declare-fun tp!99228 () Bool)

(declare-fun e!731631 () Bool)

(assert (=> mapNonEmpty!52070 (= mapRes!52070 (and tp!99228 e!731631))))

(declare-fun mapValue!52070 () ValueCell!15941)

(declare-fun mapRest!52070 () (Array (_ BitVec 32) ValueCell!15941))

(declare-fun mapKey!52070 () (_ BitVec 32))

(assert (=> mapNonEmpty!52070 (= (arr!40668 _values!1445) (store mapRest!52070 mapKey!52070 mapValue!52070))))

(declare-fun b!1280428 () Bool)

(assert (=> b!1280428 (= e!731631 tp_is_empty!33679)))

(declare-fun b!1280429 () Bool)

(declare-fun res!850539 () Bool)

(assert (=> b!1280429 (=> (not res!850539) (not e!731628))))

(assert (=> b!1280429 (= res!850539 (and (= (size!41220 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41221 _keys!1741) (size!41220 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280430 () Bool)

(declare-fun res!850544 () Bool)

(assert (=> b!1280430 (=> (not res!850544) (not e!731628))))

(assert (=> b!1280430 (= res!850544 (contains!7748 (getCurrentListMap!4677 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!52070 () Bool)

(assert (=> mapIsEmpty!52070 mapRes!52070))

(declare-fun res!850540 () Bool)

(assert (=> start!108492 (=> (not res!850540) (not e!731628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108492 (= res!850540 (validMask!0 mask!2175))))

(assert (=> start!108492 e!731628))

(assert (=> start!108492 tp_is_empty!33679))

(assert (=> start!108492 true))

(declare-fun array_inv!31033 (array!84327) Bool)

(assert (=> start!108492 (and (array_inv!31033 _values!1445) e!731630)))

(declare-fun array_inv!31034 (array!84329) Bool)

(assert (=> start!108492 (array_inv!31034 _keys!1741)))

(assert (=> start!108492 tp!99227))

(assert (= (and start!108492 res!850540) b!1280429))

(assert (= (and b!1280429 res!850539) b!1280424))

(assert (= (and b!1280424 res!850542) b!1280422))

(assert (= (and b!1280422 res!850543) b!1280427))

(assert (= (and b!1280427 res!850538) b!1280430))

(assert (= (and b!1280430 res!850544) b!1280426))

(assert (= (and b!1280426 res!850541) b!1280425))

(assert (= (and b!1280421 condMapEmpty!52070) mapIsEmpty!52070))

(assert (= (and b!1280421 (not condMapEmpty!52070)) mapNonEmpty!52070))

(get-info :version)

(assert (= (and mapNonEmpty!52070 ((_ is ValueCellFull!15941) mapValue!52070)) b!1280428))

(assert (= (and b!1280421 ((_ is ValueCellFull!15941) mapDefault!52070)) b!1280423))

(assert (= start!108492 b!1280421))

(declare-fun m!1174593 () Bool)

(assert (=> b!1280425 m!1174593))

(assert (=> b!1280425 m!1174593))

(declare-fun m!1174595 () Bool)

(assert (=> b!1280425 m!1174595))

(declare-fun m!1174597 () Bool)

(assert (=> b!1280425 m!1174597))

(declare-fun m!1174599 () Bool)

(assert (=> b!1280424 m!1174599))

(declare-fun m!1174601 () Bool)

(assert (=> b!1280430 m!1174601))

(assert (=> b!1280430 m!1174601))

(declare-fun m!1174603 () Bool)

(assert (=> b!1280430 m!1174603))

(declare-fun m!1174605 () Bool)

(assert (=> start!108492 m!1174605))

(declare-fun m!1174607 () Bool)

(assert (=> start!108492 m!1174607))

(declare-fun m!1174609 () Bool)

(assert (=> start!108492 m!1174609))

(declare-fun m!1174611 () Bool)

(assert (=> b!1280422 m!1174611))

(declare-fun m!1174613 () Bool)

(assert (=> mapNonEmpty!52070 m!1174613))

(declare-fun m!1174615 () Bool)

(assert (=> b!1280426 m!1174615))

(check-sat (not b_next!28039) tp_is_empty!33679 (not start!108492) (not b!1280422) (not b!1280430) (not b!1280424) (not mapNonEmpty!52070) (not b!1280425) b_and!46081)
(check-sat b_and!46081 (not b_next!28039))
