; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108658 () Bool)

(assert start!108658)

(declare-fun b_free!28171 () Bool)

(declare-fun b_next!28171 () Bool)

(assert (=> start!108658 (= b_free!28171 (not b_next!28171))))

(declare-fun tp!99629 () Bool)

(declare-fun b_and!46219 () Bool)

(assert (=> start!108658 (= tp!99629 b_and!46219)))

(declare-fun b!1282525 () Bool)

(declare-fun res!851904 () Bool)

(declare-fun e!732813 () Bool)

(assert (=> b!1282525 (=> (not res!851904) (not e!732813))))

(declare-datatypes ((array!84585 0))(
  ( (array!84586 (arr!40795 (Array (_ BitVec 32) (_ BitVec 64))) (size!41347 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84585)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84585 (_ BitVec 32)) Bool)

(assert (=> b!1282525 (= res!851904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282526 () Bool)

(declare-fun res!851901 () Bool)

(assert (=> b!1282526 (=> (not res!851901) (not e!732813))))

(declare-datatypes ((List!28996 0))(
  ( (Nil!28993) (Cons!28992 (h!30201 (_ BitVec 64)) (t!42532 List!28996)) )
))
(declare-fun arrayNoDuplicates!0 (array!84585 (_ BitVec 32) List!28996) Bool)

(assert (=> b!1282526 (= res!851901 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28993))))

(declare-fun mapIsEmpty!52274 () Bool)

(declare-fun mapRes!52274 () Bool)

(assert (=> mapIsEmpty!52274 mapRes!52274))

(declare-fun b!1282527 () Bool)

(assert (=> b!1282527 (= e!732813 false)))

(declare-datatypes ((V!50185 0))(
  ( (V!50186 (val!16980 Int)) )
))
(declare-fun minValue!1387 () V!50185)

(declare-fun zeroValue!1387 () V!50185)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576375 () Bool)

(declare-datatypes ((ValueCell!16007 0))(
  ( (ValueCellFull!16007 (v!19581 V!50185)) (EmptyCell!16007) )
))
(declare-datatypes ((array!84587 0))(
  ( (array!84588 (arr!40796 (Array (_ BitVec 32) ValueCell!16007)) (size!41348 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84587)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21808 0))(
  ( (tuple2!21809 (_1!10915 (_ BitVec 64)) (_2!10915 V!50185)) )
))
(declare-datatypes ((List!28997 0))(
  ( (Nil!28994) (Cons!28993 (h!30202 tuple2!21808) (t!42533 List!28997)) )
))
(declare-datatypes ((ListLongMap!19465 0))(
  ( (ListLongMap!19466 (toList!9748 List!28997)) )
))
(declare-fun contains!7795 (ListLongMap!19465 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4722 (array!84585 array!84587 (_ BitVec 32) (_ BitVec 32) V!50185 V!50185 (_ BitVec 32) Int) ListLongMap!19465)

(assert (=> b!1282527 (= lt!576375 (contains!7795 (getCurrentListMap!4722 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52274 () Bool)

(declare-fun tp!99630 () Bool)

(declare-fun e!732815 () Bool)

(assert (=> mapNonEmpty!52274 (= mapRes!52274 (and tp!99630 e!732815))))

(declare-fun mapKey!52274 () (_ BitVec 32))

(declare-fun mapValue!52274 () ValueCell!16007)

(declare-fun mapRest!52274 () (Array (_ BitVec 32) ValueCell!16007))

(assert (=> mapNonEmpty!52274 (= (arr!40796 _values!1445) (store mapRest!52274 mapKey!52274 mapValue!52274))))

(declare-fun res!851902 () Bool)

(assert (=> start!108658 (=> (not res!851902) (not e!732813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108658 (= res!851902 (validMask!0 mask!2175))))

(assert (=> start!108658 e!732813))

(declare-fun tp_is_empty!33811 () Bool)

(assert (=> start!108658 tp_is_empty!33811))

(assert (=> start!108658 true))

(declare-fun e!732814 () Bool)

(declare-fun array_inv!31105 (array!84587) Bool)

(assert (=> start!108658 (and (array_inv!31105 _values!1445) e!732814)))

(declare-fun array_inv!31106 (array!84585) Bool)

(assert (=> start!108658 (array_inv!31106 _keys!1741)))

(assert (=> start!108658 tp!99629))

(declare-fun b!1282528 () Bool)

(declare-fun res!851900 () Bool)

(assert (=> b!1282528 (=> (not res!851900) (not e!732813))))

(assert (=> b!1282528 (= res!851900 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41347 _keys!1741))))))

(declare-fun b!1282529 () Bool)

(declare-fun e!732812 () Bool)

(assert (=> b!1282529 (= e!732812 tp_is_empty!33811)))

(declare-fun b!1282530 () Bool)

(assert (=> b!1282530 (= e!732814 (and e!732812 mapRes!52274))))

(declare-fun condMapEmpty!52274 () Bool)

(declare-fun mapDefault!52274 () ValueCell!16007)

(assert (=> b!1282530 (= condMapEmpty!52274 (= (arr!40796 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16007)) mapDefault!52274)))))

(declare-fun b!1282531 () Bool)

(declare-fun res!851903 () Bool)

(assert (=> b!1282531 (=> (not res!851903) (not e!732813))))

(assert (=> b!1282531 (= res!851903 (and (= (size!41348 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41347 _keys!1741) (size!41348 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282532 () Bool)

(assert (=> b!1282532 (= e!732815 tp_is_empty!33811)))

(assert (= (and start!108658 res!851902) b!1282531))

(assert (= (and b!1282531 res!851903) b!1282525))

(assert (= (and b!1282525 res!851904) b!1282526))

(assert (= (and b!1282526 res!851901) b!1282528))

(assert (= (and b!1282528 res!851900) b!1282527))

(assert (= (and b!1282530 condMapEmpty!52274) mapIsEmpty!52274))

(assert (= (and b!1282530 (not condMapEmpty!52274)) mapNonEmpty!52274))

(get-info :version)

(assert (= (and mapNonEmpty!52274 ((_ is ValueCellFull!16007) mapValue!52274)) b!1282532))

(assert (= (and b!1282530 ((_ is ValueCellFull!16007) mapDefault!52274)) b!1282529))

(assert (= start!108658 b!1282530))

(declare-fun m!1176241 () Bool)

(assert (=> b!1282527 m!1176241))

(assert (=> b!1282527 m!1176241))

(declare-fun m!1176243 () Bool)

(assert (=> b!1282527 m!1176243))

(declare-fun m!1176245 () Bool)

(assert (=> b!1282526 m!1176245))

(declare-fun m!1176247 () Bool)

(assert (=> mapNonEmpty!52274 m!1176247))

(declare-fun m!1176249 () Bool)

(assert (=> b!1282525 m!1176249))

(declare-fun m!1176251 () Bool)

(assert (=> start!108658 m!1176251))

(declare-fun m!1176253 () Bool)

(assert (=> start!108658 m!1176253))

(declare-fun m!1176255 () Bool)

(assert (=> start!108658 m!1176255))

(check-sat (not start!108658) (not mapNonEmpty!52274) (not b!1282525) (not b_next!28171) tp_is_empty!33811 b_and!46219 (not b!1282527) (not b!1282526))
(check-sat b_and!46219 (not b_next!28171))
