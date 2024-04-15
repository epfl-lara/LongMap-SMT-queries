; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109036 () Bool)

(assert start!109036)

(declare-fun b_free!28525 () Bool)

(declare-fun b_next!28525 () Bool)

(assert (=> start!109036 (= b_free!28525 (not b_next!28525))))

(declare-fun tp!100694 () Bool)

(declare-fun b_and!46597 () Bool)

(assert (=> start!109036 (= tp!100694 b_and!46597)))

(declare-fun b!1288669 () Bool)

(declare-fun res!855964 () Bool)

(declare-fun e!735836 () Bool)

(assert (=> b!1288669 (=> (not res!855964) (not e!735836))))

(declare-datatypes ((array!85263 0))(
  ( (array!85264 (arr!41133 (Array (_ BitVec 32) (_ BitVec 64))) (size!41685 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85263)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85263 (_ BitVec 32)) Bool)

(assert (=> b!1288669 (= res!855964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52808 () Bool)

(declare-fun mapRes!52808 () Bool)

(declare-fun tp!100695 () Bool)

(declare-fun e!735837 () Bool)

(assert (=> mapNonEmpty!52808 (= mapRes!52808 (and tp!100695 e!735837))))

(declare-fun mapKey!52808 () (_ BitVec 32))

(declare-datatypes ((V!50657 0))(
  ( (V!50658 (val!17157 Int)) )
))
(declare-datatypes ((ValueCell!16184 0))(
  ( (ValueCellFull!16184 (v!19759 V!50657)) (EmptyCell!16184) )
))
(declare-datatypes ((array!85265 0))(
  ( (array!85266 (arr!41134 (Array (_ BitVec 32) ValueCell!16184)) (size!41686 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85265)

(declare-fun mapValue!52808 () ValueCell!16184)

(declare-fun mapRest!52808 () (Array (_ BitVec 32) ValueCell!16184))

(assert (=> mapNonEmpty!52808 (= (arr!41134 _values!1445) (store mapRest!52808 mapKey!52808 mapValue!52808))))

(declare-fun b!1288670 () Bool)

(declare-fun res!855965 () Bool)

(assert (=> b!1288670 (=> (not res!855965) (not e!735836))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1288670 (= res!855965 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41685 _keys!1741))))))

(declare-fun b!1288671 () Bool)

(declare-fun e!735833 () Bool)

(assert (=> b!1288671 (= e!735836 (not e!735833))))

(declare-fun res!855968 () Bool)

(assert (=> b!1288671 (=> res!855968 e!735833)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288671 (= res!855968 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22082 0))(
  ( (tuple2!22083 (_1!11052 (_ BitVec 64)) (_2!11052 V!50657)) )
))
(declare-datatypes ((List!29249 0))(
  ( (Nil!29246) (Cons!29245 (h!30454 tuple2!22082) (t!42805 List!29249)) )
))
(declare-datatypes ((ListLongMap!19739 0))(
  ( (ListLongMap!19740 (toList!9885 List!29249)) )
))
(declare-fun contains!7933 (ListLongMap!19739 (_ BitVec 64)) Bool)

(assert (=> b!1288671 (not (contains!7933 (ListLongMap!19740 Nil!29246) k0!1205))))

(declare-datatypes ((Unit!42474 0))(
  ( (Unit!42475) )
))
(declare-fun lt!577888 () Unit!42474)

(declare-fun emptyContainsNothing!42 ((_ BitVec 64)) Unit!42474)

(assert (=> b!1288671 (= lt!577888 (emptyContainsNothing!42 k0!1205))))

(declare-fun b!1288672 () Bool)

(declare-fun res!855961 () Bool)

(assert (=> b!1288672 (=> (not res!855961) (not e!735836))))

(assert (=> b!1288672 (= res!855961 (and (= (size!41686 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41685 _keys!1741) (size!41686 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288673 () Bool)

(declare-fun res!855963 () Bool)

(assert (=> b!1288673 (=> (not res!855963) (not e!735836))))

(assert (=> b!1288673 (= res!855963 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41685 _keys!1741))))))

(declare-fun b!1288674 () Bool)

(declare-fun res!855966 () Bool)

(assert (=> b!1288674 (=> (not res!855966) (not e!735836))))

(declare-fun minValue!1387 () V!50657)

(declare-fun zeroValue!1387 () V!50657)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4840 (array!85263 array!85265 (_ BitVec 32) (_ BitVec 32) V!50657 V!50657 (_ BitVec 32) Int) ListLongMap!19739)

(assert (=> b!1288674 (= res!855966 (contains!7933 (getCurrentListMap!4840 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288676 () Bool)

(declare-fun tp_is_empty!34165 () Bool)

(assert (=> b!1288676 (= e!735837 tp_is_empty!34165)))

(declare-fun b!1288677 () Bool)

(declare-fun res!855969 () Bool)

(assert (=> b!1288677 (=> (not res!855969) (not e!735836))))

(declare-datatypes ((List!29250 0))(
  ( (Nil!29247) (Cons!29246 (h!30455 (_ BitVec 64)) (t!42806 List!29250)) )
))
(declare-fun arrayNoDuplicates!0 (array!85263 (_ BitVec 32) List!29250) Bool)

(assert (=> b!1288677 (= res!855969 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29247))))

(declare-fun b!1288678 () Bool)

(assert (=> b!1288678 (= e!735833 true)))

(declare-fun lt!577887 () ListLongMap!19739)

(declare-fun +!4374 (ListLongMap!19739 tuple2!22082) ListLongMap!19739)

(assert (=> b!1288678 (not (contains!7933 (+!4374 lt!577887 (tuple2!22083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!577886 () Unit!42474)

(declare-fun addStillNotContains!351 (ListLongMap!19739 (_ BitVec 64) V!50657 (_ BitVec 64)) Unit!42474)

(assert (=> b!1288678 (= lt!577886 (addStillNotContains!351 lt!577887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6005 (array!85263 array!85265 (_ BitVec 32) (_ BitVec 32) V!50657 V!50657 (_ BitVec 32) Int) ListLongMap!19739)

(assert (=> b!1288678 (= lt!577887 (getCurrentListMapNoExtraKeys!6005 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288679 () Bool)

(declare-fun res!855962 () Bool)

(assert (=> b!1288679 (=> (not res!855962) (not e!735836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288679 (= res!855962 (not (validKeyInArray!0 (select (arr!41133 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!52808 () Bool)

(assert (=> mapIsEmpty!52808 mapRes!52808))

(declare-fun b!1288680 () Bool)

(declare-fun e!735834 () Bool)

(declare-fun e!735835 () Bool)

(assert (=> b!1288680 (= e!735834 (and e!735835 mapRes!52808))))

(declare-fun condMapEmpty!52808 () Bool)

(declare-fun mapDefault!52808 () ValueCell!16184)

(assert (=> b!1288680 (= condMapEmpty!52808 (= (arr!41134 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16184)) mapDefault!52808)))))

(declare-fun res!855967 () Bool)

(assert (=> start!109036 (=> (not res!855967) (not e!735836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109036 (= res!855967 (validMask!0 mask!2175))))

(assert (=> start!109036 e!735836))

(assert (=> start!109036 tp_is_empty!34165))

(assert (=> start!109036 true))

(declare-fun array_inv!31347 (array!85265) Bool)

(assert (=> start!109036 (and (array_inv!31347 _values!1445) e!735834)))

(declare-fun array_inv!31348 (array!85263) Bool)

(assert (=> start!109036 (array_inv!31348 _keys!1741)))

(assert (=> start!109036 tp!100694))

(declare-fun b!1288675 () Bool)

(assert (=> b!1288675 (= e!735835 tp_is_empty!34165)))

(assert (= (and start!109036 res!855967) b!1288672))

(assert (= (and b!1288672 res!855961) b!1288669))

(assert (= (and b!1288669 res!855964) b!1288677))

(assert (= (and b!1288677 res!855969) b!1288673))

(assert (= (and b!1288673 res!855963) b!1288674))

(assert (= (and b!1288674 res!855966) b!1288670))

(assert (= (and b!1288670 res!855965) b!1288679))

(assert (= (and b!1288679 res!855962) b!1288671))

(assert (= (and b!1288671 (not res!855968)) b!1288678))

(assert (= (and b!1288680 condMapEmpty!52808) mapIsEmpty!52808))

(assert (= (and b!1288680 (not condMapEmpty!52808)) mapNonEmpty!52808))

(get-info :version)

(assert (= (and mapNonEmpty!52808 ((_ is ValueCellFull!16184) mapValue!52808)) b!1288676))

(assert (= (and b!1288680 ((_ is ValueCellFull!16184) mapDefault!52808)) b!1288675))

(assert (= start!109036 b!1288680))

(declare-fun m!1180815 () Bool)

(assert (=> b!1288674 m!1180815))

(assert (=> b!1288674 m!1180815))

(declare-fun m!1180817 () Bool)

(assert (=> b!1288674 m!1180817))

(declare-fun m!1180819 () Bool)

(assert (=> b!1288679 m!1180819))

(assert (=> b!1288679 m!1180819))

(declare-fun m!1180821 () Bool)

(assert (=> b!1288679 m!1180821))

(declare-fun m!1180823 () Bool)

(assert (=> b!1288671 m!1180823))

(declare-fun m!1180825 () Bool)

(assert (=> b!1288671 m!1180825))

(declare-fun m!1180827 () Bool)

(assert (=> start!109036 m!1180827))

(declare-fun m!1180829 () Bool)

(assert (=> start!109036 m!1180829))

(declare-fun m!1180831 () Bool)

(assert (=> start!109036 m!1180831))

(declare-fun m!1180833 () Bool)

(assert (=> b!1288669 m!1180833))

(declare-fun m!1180835 () Bool)

(assert (=> b!1288678 m!1180835))

(assert (=> b!1288678 m!1180835))

(declare-fun m!1180837 () Bool)

(assert (=> b!1288678 m!1180837))

(declare-fun m!1180839 () Bool)

(assert (=> b!1288678 m!1180839))

(declare-fun m!1180841 () Bool)

(assert (=> b!1288678 m!1180841))

(declare-fun m!1180843 () Bool)

(assert (=> b!1288677 m!1180843))

(declare-fun m!1180845 () Bool)

(assert (=> mapNonEmpty!52808 m!1180845))

(check-sat b_and!46597 (not mapNonEmpty!52808) (not b!1288678) (not b!1288677) (not b!1288679) (not b_next!28525) (not b!1288669) (not b!1288674) (not start!109036) (not b!1288671) tp_is_empty!34165)
(check-sat b_and!46597 (not b_next!28525))
