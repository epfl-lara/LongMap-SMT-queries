; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108868 () Bool)

(assert start!108868)

(declare-fun b_free!28381 () Bool)

(declare-fun b_next!28381 () Bool)

(assert (=> start!108868 (= b_free!28381 (not b_next!28381))))

(declare-fun tp!100260 () Bool)

(declare-fun b_and!46429 () Bool)

(assert (=> start!108868 (= tp!100260 b_and!46429)))

(declare-fun b!1285645 () Bool)

(declare-fun res!854079 () Bool)

(declare-fun e!734389 () Bool)

(assert (=> b!1285645 (=> (not res!854079) (not e!734389))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84985 0))(
  ( (array!84986 (arr!40995 (Array (_ BitVec 32) (_ BitVec 64))) (size!41547 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84985)

(assert (=> b!1285645 (= res!854079 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41547 _keys!1741))))))

(declare-fun b!1285646 () Bool)

(declare-fun res!854078 () Bool)

(assert (=> b!1285646 (=> (not res!854078) (not e!734389))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1285646 (= res!854078 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41547 _keys!1741))))))

(declare-fun b!1285647 () Bool)

(declare-fun res!854082 () Bool)

(assert (=> b!1285647 (=> (not res!854082) (not e!734389))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84985 (_ BitVec 32)) Bool)

(assert (=> b!1285647 (= res!854082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285648 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285648 (= e!734389 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsgt from!2144 (size!41547 _keys!1741))))))

(declare-fun b!1285649 () Bool)

(declare-fun res!854075 () Bool)

(assert (=> b!1285649 (=> (not res!854075) (not e!734389))))

(declare-datatypes ((List!29143 0))(
  ( (Nil!29140) (Cons!29139 (h!30348 (_ BitVec 64)) (t!42679 List!29143)) )
))
(declare-fun arrayNoDuplicates!0 (array!84985 (_ BitVec 32) List!29143) Bool)

(assert (=> b!1285649 (= res!854075 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29140))))

(declare-fun mapIsEmpty!52589 () Bool)

(declare-fun mapRes!52589 () Bool)

(assert (=> mapIsEmpty!52589 mapRes!52589))

(declare-fun b!1285650 () Bool)

(declare-fun e!734388 () Bool)

(declare-fun e!734391 () Bool)

(assert (=> b!1285650 (= e!734388 (and e!734391 mapRes!52589))))

(declare-fun condMapEmpty!52589 () Bool)

(declare-datatypes ((V!50465 0))(
  ( (V!50466 (val!17085 Int)) )
))
(declare-datatypes ((ValueCell!16112 0))(
  ( (ValueCellFull!16112 (v!19686 V!50465)) (EmptyCell!16112) )
))
(declare-datatypes ((array!84987 0))(
  ( (array!84988 (arr!40996 (Array (_ BitVec 32) ValueCell!16112)) (size!41548 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84987)

(declare-fun mapDefault!52589 () ValueCell!16112)

(assert (=> b!1285650 (= condMapEmpty!52589 (= (arr!40996 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16112)) mapDefault!52589)))))

(declare-fun b!1285652 () Bool)

(declare-fun tp_is_empty!34021 () Bool)

(assert (=> b!1285652 (= e!734391 tp_is_empty!34021)))

(declare-fun b!1285653 () Bool)

(declare-fun e!734390 () Bool)

(assert (=> b!1285653 (= e!734390 tp_is_empty!34021)))

(declare-fun b!1285654 () Bool)

(declare-fun res!854077 () Bool)

(assert (=> b!1285654 (=> (not res!854077) (not e!734389))))

(declare-fun minValue!1387 () V!50465)

(declare-fun zeroValue!1387 () V!50465)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21966 0))(
  ( (tuple2!21967 (_1!10994 (_ BitVec 64)) (_2!10994 V!50465)) )
))
(declare-datatypes ((List!29144 0))(
  ( (Nil!29141) (Cons!29140 (h!30349 tuple2!21966) (t!42680 List!29144)) )
))
(declare-datatypes ((ListLongMap!19623 0))(
  ( (ListLongMap!19624 (toList!9827 List!29144)) )
))
(declare-fun contains!7874 (ListLongMap!19623 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4797 (array!84985 array!84987 (_ BitVec 32) (_ BitVec 32) V!50465 V!50465 (_ BitVec 32) Int) ListLongMap!19623)

(assert (=> b!1285654 (= res!854077 (contains!7874 (getCurrentListMap!4797 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52589 () Bool)

(declare-fun tp!100259 () Bool)

(assert (=> mapNonEmpty!52589 (= mapRes!52589 (and tp!100259 e!734390))))

(declare-fun mapKey!52589 () (_ BitVec 32))

(declare-fun mapRest!52589 () (Array (_ BitVec 32) ValueCell!16112))

(declare-fun mapValue!52589 () ValueCell!16112)

(assert (=> mapNonEmpty!52589 (= (arr!40996 _values!1445) (store mapRest!52589 mapKey!52589 mapValue!52589))))

(declare-fun b!1285655 () Bool)

(declare-fun res!854076 () Bool)

(assert (=> b!1285655 (=> (not res!854076) (not e!734389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285655 (= res!854076 (validKeyInArray!0 (select (arr!40995 _keys!1741) from!2144)))))

(declare-fun b!1285651 () Bool)

(declare-fun res!854081 () Bool)

(assert (=> b!1285651 (=> (not res!854081) (not e!734389))))

(assert (=> b!1285651 (= res!854081 (and (= (size!41548 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41547 _keys!1741) (size!41548 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!854080 () Bool)

(assert (=> start!108868 (=> (not res!854080) (not e!734389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108868 (= res!854080 (validMask!0 mask!2175))))

(assert (=> start!108868 e!734389))

(assert (=> start!108868 tp_is_empty!34021))

(assert (=> start!108868 true))

(declare-fun array_inv!31251 (array!84987) Bool)

(assert (=> start!108868 (and (array_inv!31251 _values!1445) e!734388)))

(declare-fun array_inv!31252 (array!84985) Bool)

(assert (=> start!108868 (array_inv!31252 _keys!1741)))

(assert (=> start!108868 tp!100260))

(assert (= (and start!108868 res!854080) b!1285651))

(assert (= (and b!1285651 res!854081) b!1285647))

(assert (= (and b!1285647 res!854082) b!1285649))

(assert (= (and b!1285649 res!854075) b!1285645))

(assert (= (and b!1285645 res!854079) b!1285654))

(assert (= (and b!1285654 res!854077) b!1285646))

(assert (= (and b!1285646 res!854078) b!1285655))

(assert (= (and b!1285655 res!854076) b!1285648))

(assert (= (and b!1285650 condMapEmpty!52589) mapIsEmpty!52589))

(assert (= (and b!1285650 (not condMapEmpty!52589)) mapNonEmpty!52589))

(get-info :version)

(assert (= (and mapNonEmpty!52589 ((_ is ValueCellFull!16112) mapValue!52589)) b!1285653))

(assert (= (and b!1285650 ((_ is ValueCellFull!16112) mapDefault!52589)) b!1285652))

(assert (= start!108868 b!1285650))

(declare-fun m!1178473 () Bool)

(assert (=> mapNonEmpty!52589 m!1178473))

(declare-fun m!1178475 () Bool)

(assert (=> b!1285655 m!1178475))

(assert (=> b!1285655 m!1178475))

(declare-fun m!1178477 () Bool)

(assert (=> b!1285655 m!1178477))

(declare-fun m!1178479 () Bool)

(assert (=> start!108868 m!1178479))

(declare-fun m!1178481 () Bool)

(assert (=> start!108868 m!1178481))

(declare-fun m!1178483 () Bool)

(assert (=> start!108868 m!1178483))

(declare-fun m!1178485 () Bool)

(assert (=> b!1285647 m!1178485))

(declare-fun m!1178487 () Bool)

(assert (=> b!1285649 m!1178487))

(declare-fun m!1178489 () Bool)

(assert (=> b!1285654 m!1178489))

(assert (=> b!1285654 m!1178489))

(declare-fun m!1178491 () Bool)

(assert (=> b!1285654 m!1178491))

(check-sat (not b!1285654) b_and!46429 (not start!108868) (not b!1285649) (not b_next!28381) (not mapNonEmpty!52589) tp_is_empty!34021 (not b!1285647) (not b!1285655))
(check-sat b_and!46429 (not b_next!28381))
