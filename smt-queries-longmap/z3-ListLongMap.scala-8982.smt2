; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108876 () Bool)

(assert start!108876)

(declare-fun b_free!28165 () Bool)

(declare-fun b_next!28165 () Bool)

(assert (=> start!108876 (= b_free!28165 (not b_next!28165))))

(declare-fun tp!99611 () Bool)

(declare-fun b_and!46233 () Bool)

(assert (=> start!108876 (= tp!99611 b_and!46233)))

(declare-fun b!1283822 () Bool)

(declare-fun e!733645 () Bool)

(assert (=> b!1283822 (= e!733645 false)))

(declare-datatypes ((V!50177 0))(
  ( (V!50178 (val!16977 Int)) )
))
(declare-fun minValue!1387 () V!50177)

(declare-fun zeroValue!1387 () V!50177)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16004 0))(
  ( (ValueCellFull!16004 (v!19574 V!50177)) (EmptyCell!16004) )
))
(declare-datatypes ((array!84709 0))(
  ( (array!84710 (arr!40852 (Array (_ BitVec 32) ValueCell!16004)) (size!41403 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84709)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!577028 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!84711 0))(
  ( (array!84712 (arr!40853 (Array (_ BitVec 32) (_ BitVec 64))) (size!41404 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84711)

(declare-datatypes ((tuple2!21752 0))(
  ( (tuple2!21753 (_1!10887 (_ BitVec 64)) (_2!10887 V!50177)) )
))
(declare-datatypes ((List!28966 0))(
  ( (Nil!28963) (Cons!28962 (h!30180 tuple2!21752) (t!42502 List!28966)) )
))
(declare-datatypes ((ListLongMap!19417 0))(
  ( (ListLongMap!19418 (toList!9724 List!28966)) )
))
(declare-fun contains!7855 (ListLongMap!19417 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4793 (array!84711 array!84709 (_ BitVec 32) (_ BitVec 32) V!50177 V!50177 (_ BitVec 32) Int) ListLongMap!19417)

(assert (=> b!1283822 (= lt!577028 (contains!7855 (getCurrentListMap!4793 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283824 () Bool)

(declare-fun res!852403 () Bool)

(assert (=> b!1283824 (=> (not res!852403) (not e!733645))))

(declare-datatypes ((List!28967 0))(
  ( (Nil!28964) (Cons!28963 (h!30181 (_ BitVec 64)) (t!42503 List!28967)) )
))
(declare-fun arrayNoDuplicates!0 (array!84711 (_ BitVec 32) List!28967) Bool)

(assert (=> b!1283824 (= res!852403 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28964))))

(declare-fun b!1283825 () Bool)

(declare-fun e!733646 () Bool)

(declare-fun tp_is_empty!33805 () Bool)

(assert (=> b!1283825 (= e!733646 tp_is_empty!33805)))

(declare-fun b!1283826 () Bool)

(declare-fun res!852405 () Bool)

(assert (=> b!1283826 (=> (not res!852405) (not e!733645))))

(assert (=> b!1283826 (= res!852405 (and (= (size!41403 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41404 _keys!1741) (size!41403 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283827 () Bool)

(declare-fun res!852402 () Bool)

(assert (=> b!1283827 (=> (not res!852402) (not e!733645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84711 (_ BitVec 32)) Bool)

(assert (=> b!1283827 (= res!852402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52265 () Bool)

(declare-fun mapRes!52265 () Bool)

(declare-fun tp!99610 () Bool)

(declare-fun e!733643 () Bool)

(assert (=> mapNonEmpty!52265 (= mapRes!52265 (and tp!99610 e!733643))))

(declare-fun mapValue!52265 () ValueCell!16004)

(declare-fun mapKey!52265 () (_ BitVec 32))

(declare-fun mapRest!52265 () (Array (_ BitVec 32) ValueCell!16004))

(assert (=> mapNonEmpty!52265 (= (arr!40852 _values!1445) (store mapRest!52265 mapKey!52265 mapValue!52265))))

(declare-fun b!1283828 () Bool)

(declare-fun res!852406 () Bool)

(assert (=> b!1283828 (=> (not res!852406) (not e!733645))))

(assert (=> b!1283828 (= res!852406 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41404 _keys!1741))))))

(declare-fun res!852404 () Bool)

(assert (=> start!108876 (=> (not res!852404) (not e!733645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108876 (= res!852404 (validMask!0 mask!2175))))

(assert (=> start!108876 e!733645))

(assert (=> start!108876 tp_is_empty!33805))

(assert (=> start!108876 true))

(declare-fun e!733644 () Bool)

(declare-fun array_inv!31201 (array!84709) Bool)

(assert (=> start!108876 (and (array_inv!31201 _values!1445) e!733644)))

(declare-fun array_inv!31202 (array!84711) Bool)

(assert (=> start!108876 (array_inv!31202 _keys!1741)))

(assert (=> start!108876 tp!99611))

(declare-fun b!1283823 () Bool)

(assert (=> b!1283823 (= e!733643 tp_is_empty!33805)))

(declare-fun b!1283829 () Bool)

(assert (=> b!1283829 (= e!733644 (and e!733646 mapRes!52265))))

(declare-fun condMapEmpty!52265 () Bool)

(declare-fun mapDefault!52265 () ValueCell!16004)

(assert (=> b!1283829 (= condMapEmpty!52265 (= (arr!40852 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16004)) mapDefault!52265)))))

(declare-fun mapIsEmpty!52265 () Bool)

(assert (=> mapIsEmpty!52265 mapRes!52265))

(assert (= (and start!108876 res!852404) b!1283826))

(assert (= (and b!1283826 res!852405) b!1283827))

(assert (= (and b!1283827 res!852402) b!1283824))

(assert (= (and b!1283824 res!852403) b!1283828))

(assert (= (and b!1283828 res!852406) b!1283822))

(assert (= (and b!1283829 condMapEmpty!52265) mapIsEmpty!52265))

(assert (= (and b!1283829 (not condMapEmpty!52265)) mapNonEmpty!52265))

(get-info :version)

(assert (= (and mapNonEmpty!52265 ((_ is ValueCellFull!16004) mapValue!52265)) b!1283823))

(assert (= (and b!1283829 ((_ is ValueCellFull!16004) mapDefault!52265)) b!1283825))

(assert (= start!108876 b!1283829))

(declare-fun m!1178305 () Bool)

(assert (=> mapNonEmpty!52265 m!1178305))

(declare-fun m!1178307 () Bool)

(assert (=> b!1283822 m!1178307))

(assert (=> b!1283822 m!1178307))

(declare-fun m!1178309 () Bool)

(assert (=> b!1283822 m!1178309))

(declare-fun m!1178311 () Bool)

(assert (=> b!1283827 m!1178311))

(declare-fun m!1178313 () Bool)

(assert (=> b!1283824 m!1178313))

(declare-fun m!1178315 () Bool)

(assert (=> start!108876 m!1178315))

(declare-fun m!1178317 () Bool)

(assert (=> start!108876 m!1178317))

(declare-fun m!1178319 () Bool)

(assert (=> start!108876 m!1178319))

(check-sat (not mapNonEmpty!52265) (not b_next!28165) tp_is_empty!33805 b_and!46233 (not b!1283824) (not b!1283827) (not b!1283822) (not start!108876))
(check-sat b_and!46233 (not b_next!28165))
