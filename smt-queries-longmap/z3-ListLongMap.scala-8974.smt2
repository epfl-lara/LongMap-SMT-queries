; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108814 () Bool)

(assert start!108814)

(declare-fun b_free!28117 () Bool)

(declare-fun b_next!28117 () Bool)

(assert (=> start!108814 (= b_free!28117 (not b_next!28117))))

(declare-fun tp!99463 () Bool)

(declare-fun b_and!46183 () Bool)

(assert (=> start!108814 (= tp!99463 b_and!46183)))

(declare-fun b!1283128 () Bool)

(declare-fun e!733214 () Bool)

(declare-fun e!733211 () Bool)

(declare-fun mapRes!52190 () Bool)

(assert (=> b!1283128 (= e!733214 (and e!733211 mapRes!52190))))

(declare-fun condMapEmpty!52190 () Bool)

(declare-datatypes ((V!50113 0))(
  ( (V!50114 (val!16953 Int)) )
))
(declare-datatypes ((ValueCell!15980 0))(
  ( (ValueCellFull!15980 (v!19549 V!50113)) (EmptyCell!15980) )
))
(declare-datatypes ((array!84619 0))(
  ( (array!84620 (arr!40808 (Array (_ BitVec 32) ValueCell!15980)) (size!41359 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84619)

(declare-fun mapDefault!52190 () ValueCell!15980)

(assert (=> b!1283128 (= condMapEmpty!52190 (= (arr!40808 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15980)) mapDefault!52190)))))

(declare-fun res!851991 () Bool)

(declare-fun e!733213 () Bool)

(assert (=> start!108814 (=> (not res!851991) (not e!733213))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108814 (= res!851991 (validMask!0 mask!2175))))

(assert (=> start!108814 e!733213))

(declare-fun tp_is_empty!33757 () Bool)

(assert (=> start!108814 tp_is_empty!33757))

(assert (=> start!108814 true))

(declare-fun array_inv!31177 (array!84619) Bool)

(assert (=> start!108814 (and (array_inv!31177 _values!1445) e!733214)))

(declare-datatypes ((array!84621 0))(
  ( (array!84622 (arr!40809 (Array (_ BitVec 32) (_ BitVec 64))) (size!41360 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84621)

(declare-fun array_inv!31178 (array!84621) Bool)

(assert (=> start!108814 (array_inv!31178 _keys!1741)))

(assert (=> start!108814 tp!99463))

(declare-fun mapIsEmpty!52190 () Bool)

(assert (=> mapIsEmpty!52190 mapRes!52190))

(declare-fun mapNonEmpty!52190 () Bool)

(declare-fun tp!99464 () Bool)

(declare-fun e!733215 () Bool)

(assert (=> mapNonEmpty!52190 (= mapRes!52190 (and tp!99464 e!733215))))

(declare-fun mapKey!52190 () (_ BitVec 32))

(declare-fun mapValue!52190 () ValueCell!15980)

(declare-fun mapRest!52190 () (Array (_ BitVec 32) ValueCell!15980))

(assert (=> mapNonEmpty!52190 (= (arr!40808 _values!1445) (store mapRest!52190 mapKey!52190 mapValue!52190))))

(declare-fun b!1283129 () Bool)

(declare-fun res!851990 () Bool)

(assert (=> b!1283129 (=> (not res!851990) (not e!733213))))

(declare-datatypes ((List!28945 0))(
  ( (Nil!28942) (Cons!28941 (h!30159 (_ BitVec 64)) (t!42479 List!28945)) )
))
(declare-fun arrayNoDuplicates!0 (array!84621 (_ BitVec 32) List!28945) Bool)

(assert (=> b!1283129 (= res!851990 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28942))))

(declare-fun b!1283130 () Bool)

(assert (=> b!1283130 (= e!733211 tp_is_empty!33757)))

(declare-fun b!1283131 () Bool)

(assert (=> b!1283131 (= e!733213 false)))

(declare-fun minValue!1387 () V!50113)

(declare-fun zeroValue!1387 () V!50113)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576878 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21732 0))(
  ( (tuple2!21733 (_1!10877 (_ BitVec 64)) (_2!10877 V!50113)) )
))
(declare-datatypes ((List!28946 0))(
  ( (Nil!28943) (Cons!28942 (h!30160 tuple2!21732) (t!42480 List!28946)) )
))
(declare-datatypes ((ListLongMap!19397 0))(
  ( (ListLongMap!19398 (toList!9714 List!28946)) )
))
(declare-fun contains!7844 (ListLongMap!19397 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4783 (array!84621 array!84619 (_ BitVec 32) (_ BitVec 32) V!50113 V!50113 (_ BitVec 32) Int) ListLongMap!19397)

(assert (=> b!1283131 (= lt!576878 (contains!7844 (getCurrentListMap!4783 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283132 () Bool)

(declare-fun res!851988 () Bool)

(assert (=> b!1283132 (=> (not res!851988) (not e!733213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84621 (_ BitVec 32)) Bool)

(assert (=> b!1283132 (= res!851988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283133 () Bool)

(declare-fun res!851992 () Bool)

(assert (=> b!1283133 (=> (not res!851992) (not e!733213))))

(assert (=> b!1283133 (= res!851992 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41360 _keys!1741))))))

(declare-fun b!1283134 () Bool)

(declare-fun res!851989 () Bool)

(assert (=> b!1283134 (=> (not res!851989) (not e!733213))))

(assert (=> b!1283134 (= res!851989 (and (= (size!41359 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41360 _keys!1741) (size!41359 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283135 () Bool)

(assert (=> b!1283135 (= e!733215 tp_is_empty!33757)))

(assert (= (and start!108814 res!851991) b!1283134))

(assert (= (and b!1283134 res!851989) b!1283132))

(assert (= (and b!1283132 res!851988) b!1283129))

(assert (= (and b!1283129 res!851990) b!1283133))

(assert (= (and b!1283133 res!851992) b!1283131))

(assert (= (and b!1283128 condMapEmpty!52190) mapIsEmpty!52190))

(assert (= (and b!1283128 (not condMapEmpty!52190)) mapNonEmpty!52190))

(get-info :version)

(assert (= (and mapNonEmpty!52190 ((_ is ValueCellFull!15980) mapValue!52190)) b!1283135))

(assert (= (and b!1283128 ((_ is ValueCellFull!15980) mapDefault!52190)) b!1283130))

(assert (= start!108814 b!1283128))

(declare-fun m!1177833 () Bool)

(assert (=> b!1283132 m!1177833))

(declare-fun m!1177835 () Bool)

(assert (=> b!1283131 m!1177835))

(assert (=> b!1283131 m!1177835))

(declare-fun m!1177837 () Bool)

(assert (=> b!1283131 m!1177837))

(declare-fun m!1177839 () Bool)

(assert (=> start!108814 m!1177839))

(declare-fun m!1177841 () Bool)

(assert (=> start!108814 m!1177841))

(declare-fun m!1177843 () Bool)

(assert (=> start!108814 m!1177843))

(declare-fun m!1177845 () Bool)

(assert (=> b!1283129 m!1177845))

(declare-fun m!1177847 () Bool)

(assert (=> mapNonEmpty!52190 m!1177847))

(check-sat (not b!1283129) (not b_next!28117) (not mapNonEmpty!52190) (not b!1283131) (not start!108814) b_and!46183 tp_is_empty!33757 (not b!1283132))
(check-sat b_and!46183 (not b_next!28117))
