; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108862 () Bool)

(assert start!108862)

(declare-fun b_free!28375 () Bool)

(declare-fun b_next!28375 () Bool)

(assert (=> start!108862 (= b_free!28375 (not b_next!28375))))

(declare-fun tp!100241 () Bool)

(declare-fun b_and!46423 () Bool)

(assert (=> start!108862 (= tp!100241 b_and!46423)))

(declare-fun b!1285567 () Bool)

(declare-fun res!854025 () Bool)

(declare-fun e!734344 () Bool)

(assert (=> b!1285567 (=> (not res!854025) (not e!734344))))

(declare-datatypes ((array!84973 0))(
  ( (array!84974 (arr!40989 (Array (_ BitVec 32) (_ BitVec 64))) (size!41541 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84973)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84973 (_ BitVec 32)) Bool)

(assert (=> b!1285567 (= res!854025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285568 () Bool)

(declare-fun res!854028 () Bool)

(assert (=> b!1285568 (=> (not res!854028) (not e!734344))))

(declare-datatypes ((List!29137 0))(
  ( (Nil!29134) (Cons!29133 (h!30342 (_ BitVec 64)) (t!42673 List!29137)) )
))
(declare-fun arrayNoDuplicates!0 (array!84973 (_ BitVec 32) List!29137) Bool)

(assert (=> b!1285568 (= res!854028 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29134))))

(declare-fun b!1285569 () Bool)

(declare-fun res!854026 () Bool)

(assert (=> b!1285569 (=> (not res!854026) (not e!734344))))

(declare-datatypes ((V!50457 0))(
  ( (V!50458 (val!17082 Int)) )
))
(declare-datatypes ((ValueCell!16109 0))(
  ( (ValueCellFull!16109 (v!19683 V!50457)) (EmptyCell!16109) )
))
(declare-datatypes ((array!84975 0))(
  ( (array!84976 (arr!40990 (Array (_ BitVec 32) ValueCell!16109)) (size!41542 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84975)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285569 (= res!854026 (and (= (size!41542 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41541 _keys!1741) (size!41542 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285570 () Bool)

(declare-fun e!734342 () Bool)

(declare-fun tp_is_empty!34015 () Bool)

(assert (=> b!1285570 (= e!734342 tp_is_empty!34015)))

(declare-fun b!1285571 () Bool)

(declare-fun e!734346 () Bool)

(declare-fun mapRes!52580 () Bool)

(assert (=> b!1285571 (= e!734346 (and e!734342 mapRes!52580))))

(declare-fun condMapEmpty!52580 () Bool)

(declare-fun mapDefault!52580 () ValueCell!16109)

(assert (=> b!1285571 (= condMapEmpty!52580 (= (arr!40990 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16109)) mapDefault!52580)))))

(declare-fun res!854024 () Bool)

(assert (=> start!108862 (=> (not res!854024) (not e!734344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108862 (= res!854024 (validMask!0 mask!2175))))

(assert (=> start!108862 e!734344))

(assert (=> start!108862 tp_is_empty!34015))

(assert (=> start!108862 true))

(declare-fun array_inv!31245 (array!84975) Bool)

(assert (=> start!108862 (and (array_inv!31245 _values!1445) e!734346)))

(declare-fun array_inv!31246 (array!84973) Bool)

(assert (=> start!108862 (array_inv!31246 _keys!1741)))

(assert (=> start!108862 tp!100241))

(declare-fun b!1285572 () Bool)

(declare-fun e!734345 () Bool)

(assert (=> b!1285572 (= e!734345 tp_is_empty!34015)))

(declare-fun b!1285573 () Bool)

(declare-fun res!854027 () Bool)

(assert (=> b!1285573 (=> (not res!854027) (not e!734344))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1285573 (= res!854027 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41541 _keys!1741))))))

(declare-fun mapIsEmpty!52580 () Bool)

(assert (=> mapIsEmpty!52580 mapRes!52580))

(declare-fun b!1285574 () Bool)

(assert (=> b!1285574 (= e!734344 false)))

(declare-fun minValue!1387 () V!50457)

(declare-fun zeroValue!1387 () V!50457)

(declare-fun lt!576762 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21960 0))(
  ( (tuple2!21961 (_1!10991 (_ BitVec 64)) (_2!10991 V!50457)) )
))
(declare-datatypes ((List!29138 0))(
  ( (Nil!29135) (Cons!29134 (h!30343 tuple2!21960) (t!42674 List!29138)) )
))
(declare-datatypes ((ListLongMap!19617 0))(
  ( (ListLongMap!19618 (toList!9824 List!29138)) )
))
(declare-fun contains!7871 (ListLongMap!19617 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4794 (array!84973 array!84975 (_ BitVec 32) (_ BitVec 32) V!50457 V!50457 (_ BitVec 32) Int) ListLongMap!19617)

(assert (=> b!1285574 (= lt!576762 (contains!7871 (getCurrentListMap!4794 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52580 () Bool)

(declare-fun tp!100242 () Bool)

(assert (=> mapNonEmpty!52580 (= mapRes!52580 (and tp!100242 e!734345))))

(declare-fun mapRest!52580 () (Array (_ BitVec 32) ValueCell!16109))

(declare-fun mapValue!52580 () ValueCell!16109)

(declare-fun mapKey!52580 () (_ BitVec 32))

(assert (=> mapNonEmpty!52580 (= (arr!40990 _values!1445) (store mapRest!52580 mapKey!52580 mapValue!52580))))

(assert (= (and start!108862 res!854024) b!1285569))

(assert (= (and b!1285569 res!854026) b!1285567))

(assert (= (and b!1285567 res!854025) b!1285568))

(assert (= (and b!1285568 res!854028) b!1285573))

(assert (= (and b!1285573 res!854027) b!1285574))

(assert (= (and b!1285571 condMapEmpty!52580) mapIsEmpty!52580))

(assert (= (and b!1285571 (not condMapEmpty!52580)) mapNonEmpty!52580))

(get-info :version)

(assert (= (and mapNonEmpty!52580 ((_ is ValueCellFull!16109) mapValue!52580)) b!1285572))

(assert (= (and b!1285571 ((_ is ValueCellFull!16109) mapDefault!52580)) b!1285570))

(assert (= start!108862 b!1285571))

(declare-fun m!1178425 () Bool)

(assert (=> b!1285568 m!1178425))

(declare-fun m!1178427 () Bool)

(assert (=> mapNonEmpty!52580 m!1178427))

(declare-fun m!1178429 () Bool)

(assert (=> b!1285574 m!1178429))

(assert (=> b!1285574 m!1178429))

(declare-fun m!1178431 () Bool)

(assert (=> b!1285574 m!1178431))

(declare-fun m!1178433 () Bool)

(assert (=> start!108862 m!1178433))

(declare-fun m!1178435 () Bool)

(assert (=> start!108862 m!1178435))

(declare-fun m!1178437 () Bool)

(assert (=> start!108862 m!1178437))

(declare-fun m!1178439 () Bool)

(assert (=> b!1285567 m!1178439))

(check-sat (not mapNonEmpty!52580) (not b!1285567) (not start!108862) (not b_next!28375) tp_is_empty!34015 b_and!46423 (not b!1285568) (not b!1285574))
(check-sat b_and!46423 (not b_next!28375))
