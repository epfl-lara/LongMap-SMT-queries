; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109724 () Bool)

(assert start!109724)

(declare-fun b_free!29157 () Bool)

(declare-fun b_next!29157 () Bool)

(assert (=> start!109724 (= b_free!29157 (not b_next!29157))))

(declare-fun tp!102599 () Bool)

(declare-fun b_and!47259 () Bool)

(assert (=> start!109724 (= tp!102599 b_and!47259)))

(declare-fun res!863685 () Bool)

(declare-fun e!741432 () Bool)

(assert (=> start!109724 (=> (not res!863685) (not e!741432))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109724 (= res!863685 (validMask!0 mask!2175))))

(assert (=> start!109724 e!741432))

(declare-fun tp_is_empty!34797 () Bool)

(assert (=> start!109724 tp_is_empty!34797))

(assert (=> start!109724 true))

(declare-datatypes ((V!51499 0))(
  ( (V!51500 (val!17473 Int)) )
))
(declare-datatypes ((ValueCell!16500 0))(
  ( (ValueCellFull!16500 (v!20079 V!51499)) (EmptyCell!16500) )
))
(declare-datatypes ((array!86602 0))(
  ( (array!86603 (arr!41799 (Array (_ BitVec 32) ValueCell!16500)) (size!42349 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86602)

(declare-fun e!741435 () Bool)

(declare-fun array_inv!31633 (array!86602) Bool)

(assert (=> start!109724 (and (array_inv!31633 _values!1445) e!741435)))

(declare-datatypes ((array!86604 0))(
  ( (array!86605 (arr!41800 (Array (_ BitVec 32) (_ BitVec 64))) (size!42350 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86604)

(declare-fun array_inv!31634 (array!86604) Bool)

(assert (=> start!109724 (array_inv!31634 _keys!1741)))

(assert (=> start!109724 tp!102599))

(declare-fun b!1299672 () Bool)

(assert (=> b!1299672 (= e!741432 (not true))))

(declare-datatypes ((tuple2!22536 0))(
  ( (tuple2!22537 (_1!11279 (_ BitVec 64)) (_2!11279 V!51499)) )
))
(declare-datatypes ((List!29666 0))(
  ( (Nil!29663) (Cons!29662 (h!30871 tuple2!22536) (t!43236 List!29666)) )
))
(declare-datatypes ((ListLongMap!20193 0))(
  ( (ListLongMap!20194 (toList!10112 List!29666)) )
))
(declare-fun lt!581112 () ListLongMap!20193)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8234 (ListLongMap!20193 (_ BitVec 64)) Bool)

(assert (=> b!1299672 (contains!8234 lt!581112 k0!1205)))

(declare-fun minValue!1387 () V!51499)

(declare-datatypes ((Unit!43026 0))(
  ( (Unit!43027) )
))
(declare-fun lt!581111 () Unit!43026)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!73 ((_ BitVec 64) (_ BitVec 64) V!51499 ListLongMap!20193) Unit!43026)

(assert (=> b!1299672 (= lt!581111 (lemmaInListMapAfterAddingDiffThenInBefore!73 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!581112))))

(declare-fun zeroValue!1387 () V!51499)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4444 (ListLongMap!20193 tuple2!22536) ListLongMap!20193)

(declare-fun getCurrentListMapNoExtraKeys!6075 (array!86604 array!86602 (_ BitVec 32) (_ BitVec 32) V!51499 V!51499 (_ BitVec 32) Int) ListLongMap!20193)

(assert (=> b!1299672 (= lt!581112 (+!4444 (getCurrentListMapNoExtraKeys!6075 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1299673 () Bool)

(declare-fun res!863690 () Bool)

(assert (=> b!1299673 (=> (not res!863690) (not e!741432))))

(assert (=> b!1299673 (= res!863690 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1299674 () Bool)

(declare-fun res!863687 () Bool)

(assert (=> b!1299674 (=> (not res!863687) (not e!741432))))

(assert (=> b!1299674 (= res!863687 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42350 _keys!1741))))))

(declare-fun mapNonEmpty!53765 () Bool)

(declare-fun mapRes!53765 () Bool)

(declare-fun tp!102598 () Bool)

(declare-fun e!741433 () Bool)

(assert (=> mapNonEmpty!53765 (= mapRes!53765 (and tp!102598 e!741433))))

(declare-fun mapRest!53765 () (Array (_ BitVec 32) ValueCell!16500))

(declare-fun mapKey!53765 () (_ BitVec 32))

(declare-fun mapValue!53765 () ValueCell!16500)

(assert (=> mapNonEmpty!53765 (= (arr!41799 _values!1445) (store mapRest!53765 mapKey!53765 mapValue!53765))))

(declare-fun b!1299675 () Bool)

(declare-fun res!863689 () Bool)

(assert (=> b!1299675 (=> (not res!863689) (not e!741432))))

(declare-datatypes ((List!29667 0))(
  ( (Nil!29664) (Cons!29663 (h!30872 (_ BitVec 64)) (t!43237 List!29667)) )
))
(declare-fun arrayNoDuplicates!0 (array!86604 (_ BitVec 32) List!29667) Bool)

(assert (=> b!1299675 (= res!863689 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29664))))

(declare-fun b!1299676 () Bool)

(declare-fun e!741436 () Bool)

(assert (=> b!1299676 (= e!741435 (and e!741436 mapRes!53765))))

(declare-fun condMapEmpty!53765 () Bool)

(declare-fun mapDefault!53765 () ValueCell!16500)

(assert (=> b!1299676 (= condMapEmpty!53765 (= (arr!41799 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16500)) mapDefault!53765)))))

(declare-fun mapIsEmpty!53765 () Bool)

(assert (=> mapIsEmpty!53765 mapRes!53765))

(declare-fun b!1299677 () Bool)

(declare-fun res!863684 () Bool)

(assert (=> b!1299677 (=> (not res!863684) (not e!741432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299677 (= res!863684 (validKeyInArray!0 (select (arr!41800 _keys!1741) from!2144)))))

(declare-fun b!1299678 () Bool)

(declare-fun res!863688 () Bool)

(assert (=> b!1299678 (=> (not res!863688) (not e!741432))))

(declare-fun getCurrentListMap!5140 (array!86604 array!86602 (_ BitVec 32) (_ BitVec 32) V!51499 V!51499 (_ BitVec 32) Int) ListLongMap!20193)

(assert (=> b!1299678 (= res!863688 (contains!8234 (getCurrentListMap!5140 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299679 () Bool)

(assert (=> b!1299679 (= e!741436 tp_is_empty!34797)))

(declare-fun b!1299680 () Bool)

(assert (=> b!1299680 (= e!741433 tp_is_empty!34797)))

(declare-fun b!1299681 () Bool)

(declare-fun res!863691 () Bool)

(assert (=> b!1299681 (=> (not res!863691) (not e!741432))))

(assert (=> b!1299681 (= res!863691 (and (= (size!42349 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42350 _keys!1741) (size!42349 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299682 () Bool)

(declare-fun res!863683 () Bool)

(assert (=> b!1299682 (=> (not res!863683) (not e!741432))))

(assert (=> b!1299682 (= res!863683 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42350 _keys!1741))))))

(declare-fun b!1299683 () Bool)

(declare-fun res!863686 () Bool)

(assert (=> b!1299683 (=> (not res!863686) (not e!741432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86604 (_ BitVec 32)) Bool)

(assert (=> b!1299683 (= res!863686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109724 res!863685) b!1299681))

(assert (= (and b!1299681 res!863691) b!1299683))

(assert (= (and b!1299683 res!863686) b!1299675))

(assert (= (and b!1299675 res!863689) b!1299674))

(assert (= (and b!1299674 res!863687) b!1299678))

(assert (= (and b!1299678 res!863688) b!1299682))

(assert (= (and b!1299682 res!863683) b!1299677))

(assert (= (and b!1299677 res!863684) b!1299673))

(assert (= (and b!1299673 res!863690) b!1299672))

(assert (= (and b!1299676 condMapEmpty!53765) mapIsEmpty!53765))

(assert (= (and b!1299676 (not condMapEmpty!53765)) mapNonEmpty!53765))

(get-info :version)

(assert (= (and mapNonEmpty!53765 ((_ is ValueCellFull!16500) mapValue!53765)) b!1299680))

(assert (= (and b!1299676 ((_ is ValueCellFull!16500) mapDefault!53765)) b!1299679))

(assert (= start!109724 b!1299676))

(declare-fun m!1190793 () Bool)

(assert (=> b!1299677 m!1190793))

(assert (=> b!1299677 m!1190793))

(declare-fun m!1190795 () Bool)

(assert (=> b!1299677 m!1190795))

(declare-fun m!1190797 () Bool)

(assert (=> b!1299683 m!1190797))

(declare-fun m!1190799 () Bool)

(assert (=> mapNonEmpty!53765 m!1190799))

(declare-fun m!1190801 () Bool)

(assert (=> b!1299675 m!1190801))

(declare-fun m!1190803 () Bool)

(assert (=> start!109724 m!1190803))

(declare-fun m!1190805 () Bool)

(assert (=> start!109724 m!1190805))

(declare-fun m!1190807 () Bool)

(assert (=> start!109724 m!1190807))

(declare-fun m!1190809 () Bool)

(assert (=> b!1299672 m!1190809))

(declare-fun m!1190811 () Bool)

(assert (=> b!1299672 m!1190811))

(declare-fun m!1190813 () Bool)

(assert (=> b!1299672 m!1190813))

(assert (=> b!1299672 m!1190813))

(declare-fun m!1190815 () Bool)

(assert (=> b!1299672 m!1190815))

(declare-fun m!1190817 () Bool)

(assert (=> b!1299678 m!1190817))

(assert (=> b!1299678 m!1190817))

(declare-fun m!1190819 () Bool)

(assert (=> b!1299678 m!1190819))

(check-sat (not b!1299677) (not start!109724) (not mapNonEmpty!53765) (not b_next!29157) (not b!1299672) (not b!1299675) tp_is_empty!34797 (not b!1299678) (not b!1299683) b_and!47259)
(check-sat b_and!47259 (not b_next!29157))
