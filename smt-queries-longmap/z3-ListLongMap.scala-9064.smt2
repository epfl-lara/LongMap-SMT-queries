; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109170 () Bool)

(assert start!109170)

(declare-fun b_free!28659 () Bool)

(declare-fun b_next!28659 () Bool)

(assert (=> start!109170 (= b_free!28659 (not b_next!28659))))

(declare-fun tp!101096 () Bool)

(declare-fun b_and!46749 () Bool)

(assert (=> start!109170 (= tp!101096 b_and!46749)))

(declare-fun b!1291145 () Bool)

(declare-fun e!737067 () Bool)

(assert (=> b!1291145 (= e!737067 true)))

(assert (=> b!1291145 false))

(declare-datatypes ((V!50835 0))(
  ( (V!50836 (val!17224 Int)) )
))
(declare-datatypes ((tuple2!22140 0))(
  ( (tuple2!22141 (_1!11081 (_ BitVec 64)) (_2!11081 V!50835)) )
))
(declare-datatypes ((List!29301 0))(
  ( (Nil!29298) (Cons!29297 (h!30506 tuple2!22140) (t!42865 List!29301)) )
))
(declare-datatypes ((ListLongMap!19797 0))(
  ( (ListLongMap!19798 (toList!9914 List!29301)) )
))
(declare-fun lt!578982 () ListLongMap!19797)

(declare-fun minValue!1387 () V!50835)

(declare-datatypes ((Unit!42740 0))(
  ( (Unit!42741) )
))
(declare-fun lt!578981 () Unit!42740)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!53 ((_ BitVec 64) (_ BitVec 64) V!50835 ListLongMap!19797) Unit!42740)

(assert (=> b!1291145 (= lt!578981 (lemmaInListMapAfterAddingDiffThenInBefore!53 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578982))))

(declare-fun lt!578979 () ListLongMap!19797)

(declare-fun contains!8032 (ListLongMap!19797 (_ BitVec 64)) Bool)

(declare-fun +!4379 (ListLongMap!19797 tuple2!22140) ListLongMap!19797)

(assert (=> b!1291145 (not (contains!8032 (+!4379 lt!578979 (tuple2!22141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578984 () Unit!42740)

(declare-fun addStillNotContains!397 (ListLongMap!19797 (_ BitVec 64) V!50835 (_ BitVec 64)) Unit!42740)

(assert (=> b!1291145 (= lt!578984 (addStillNotContains!397 lt!578979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291145 (not (contains!8032 lt!578982 k0!1205))))

(declare-fun zeroValue!1387 () V!50835)

(assert (=> b!1291145 (= lt!578982 (+!4379 lt!578979 (tuple2!22141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578980 () Unit!42740)

(assert (=> b!1291145 (= lt!578980 (addStillNotContains!397 lt!578979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16251 0))(
  ( (ValueCellFull!16251 (v!19827 V!50835)) (EmptyCell!16251) )
))
(declare-datatypes ((array!85634 0))(
  ( (array!85635 (arr!41318 (Array (_ BitVec 32) ValueCell!16251)) (size!41868 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85634)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85636 0))(
  ( (array!85637 (arr!41319 (Array (_ BitVec 32) (_ BitVec 64))) (size!41869 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85636)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6010 (array!85636 array!85634 (_ BitVec 32) (_ BitVec 32) V!50835 V!50835 (_ BitVec 32) Int) ListLongMap!19797)

(assert (=> b!1291145 (= lt!578979 (getCurrentListMapNoExtraKeys!6010 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291146 () Bool)

(declare-fun res!857799 () Bool)

(declare-fun e!737071 () Bool)

(assert (=> b!1291146 (=> (not res!857799) (not e!737071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291146 (= res!857799 (not (validKeyInArray!0 (select (arr!41319 _keys!1741) from!2144))))))

(declare-fun b!1291147 () Bool)

(declare-fun e!737069 () Bool)

(declare-fun tp_is_empty!34299 () Bool)

(assert (=> b!1291147 (= e!737069 tp_is_empty!34299)))

(declare-fun b!1291148 () Bool)

(declare-fun res!857798 () Bool)

(assert (=> b!1291148 (=> (not res!857798) (not e!737071))))

(assert (=> b!1291148 (= res!857798 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41869 _keys!1741))))))

(declare-fun b!1291149 () Bool)

(assert (=> b!1291149 (= e!737071 (not e!737067))))

(declare-fun res!857805 () Bool)

(assert (=> b!1291149 (=> res!857805 e!737067)))

(assert (=> b!1291149 (= res!857805 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291149 (not (contains!8032 (ListLongMap!19798 Nil!29298) k0!1205))))

(declare-fun lt!578983 () Unit!42740)

(declare-fun emptyContainsNothing!94 ((_ BitVec 64)) Unit!42740)

(assert (=> b!1291149 (= lt!578983 (emptyContainsNothing!94 k0!1205))))

(declare-fun b!1291150 () Bool)

(declare-fun res!857800 () Bool)

(assert (=> b!1291150 (=> (not res!857800) (not e!737071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85636 (_ BitVec 32)) Bool)

(assert (=> b!1291150 (= res!857800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291151 () Bool)

(declare-fun e!737068 () Bool)

(declare-fun mapRes!53009 () Bool)

(assert (=> b!1291151 (= e!737068 (and e!737069 mapRes!53009))))

(declare-fun condMapEmpty!53009 () Bool)

(declare-fun mapDefault!53009 () ValueCell!16251)

(assert (=> b!1291151 (= condMapEmpty!53009 (= (arr!41318 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16251)) mapDefault!53009)))))

(declare-fun b!1291152 () Bool)

(declare-fun res!857803 () Bool)

(assert (=> b!1291152 (=> (not res!857803) (not e!737071))))

(declare-fun getCurrentListMap!4967 (array!85636 array!85634 (_ BitVec 32) (_ BitVec 32) V!50835 V!50835 (_ BitVec 32) Int) ListLongMap!19797)

(assert (=> b!1291152 (= res!857803 (contains!8032 (getCurrentListMap!4967 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291153 () Bool)

(declare-fun e!737070 () Bool)

(assert (=> b!1291153 (= e!737070 tp_is_empty!34299)))

(declare-fun res!857801 () Bool)

(assert (=> start!109170 (=> (not res!857801) (not e!737071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109170 (= res!857801 (validMask!0 mask!2175))))

(assert (=> start!109170 e!737071))

(assert (=> start!109170 tp_is_empty!34299))

(assert (=> start!109170 true))

(declare-fun array_inv!31311 (array!85634) Bool)

(assert (=> start!109170 (and (array_inv!31311 _values!1445) e!737068)))

(declare-fun array_inv!31312 (array!85636) Bool)

(assert (=> start!109170 (array_inv!31312 _keys!1741)))

(assert (=> start!109170 tp!101096))

(declare-fun b!1291154 () Bool)

(declare-fun res!857804 () Bool)

(assert (=> b!1291154 (=> (not res!857804) (not e!737071))))

(assert (=> b!1291154 (= res!857804 (and (= (size!41868 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41869 _keys!1741) (size!41868 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53009 () Bool)

(declare-fun tp!101095 () Bool)

(assert (=> mapNonEmpty!53009 (= mapRes!53009 (and tp!101095 e!737070))))

(declare-fun mapKey!53009 () (_ BitVec 32))

(declare-fun mapRest!53009 () (Array (_ BitVec 32) ValueCell!16251))

(declare-fun mapValue!53009 () ValueCell!16251)

(assert (=> mapNonEmpty!53009 (= (arr!41318 _values!1445) (store mapRest!53009 mapKey!53009 mapValue!53009))))

(declare-fun b!1291155 () Bool)

(declare-fun res!857802 () Bool)

(assert (=> b!1291155 (=> (not res!857802) (not e!737071))))

(declare-datatypes ((List!29302 0))(
  ( (Nil!29299) (Cons!29298 (h!30507 (_ BitVec 64)) (t!42866 List!29302)) )
))
(declare-fun arrayNoDuplicates!0 (array!85636 (_ BitVec 32) List!29302) Bool)

(assert (=> b!1291155 (= res!857802 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29299))))

(declare-fun b!1291156 () Bool)

(declare-fun res!857797 () Bool)

(assert (=> b!1291156 (=> (not res!857797) (not e!737071))))

(assert (=> b!1291156 (= res!857797 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41869 _keys!1741))))))

(declare-fun mapIsEmpty!53009 () Bool)

(assert (=> mapIsEmpty!53009 mapRes!53009))

(assert (= (and start!109170 res!857801) b!1291154))

(assert (= (and b!1291154 res!857804) b!1291150))

(assert (= (and b!1291150 res!857800) b!1291155))

(assert (= (and b!1291155 res!857802) b!1291156))

(assert (= (and b!1291156 res!857797) b!1291152))

(assert (= (and b!1291152 res!857803) b!1291148))

(assert (= (and b!1291148 res!857798) b!1291146))

(assert (= (and b!1291146 res!857799) b!1291149))

(assert (= (and b!1291149 (not res!857805)) b!1291145))

(assert (= (and b!1291151 condMapEmpty!53009) mapIsEmpty!53009))

(assert (= (and b!1291151 (not condMapEmpty!53009)) mapNonEmpty!53009))

(get-info :version)

(assert (= (and mapNonEmpty!53009 ((_ is ValueCellFull!16251) mapValue!53009)) b!1291153))

(assert (= (and b!1291151 ((_ is ValueCellFull!16251) mapDefault!53009)) b!1291147))

(assert (= start!109170 b!1291151))

(declare-fun m!1183815 () Bool)

(assert (=> b!1291152 m!1183815))

(assert (=> b!1291152 m!1183815))

(declare-fun m!1183817 () Bool)

(assert (=> b!1291152 m!1183817))

(declare-fun m!1183819 () Bool)

(assert (=> b!1291146 m!1183819))

(assert (=> b!1291146 m!1183819))

(declare-fun m!1183821 () Bool)

(assert (=> b!1291146 m!1183821))

(declare-fun m!1183823 () Bool)

(assert (=> b!1291149 m!1183823))

(declare-fun m!1183825 () Bool)

(assert (=> b!1291149 m!1183825))

(declare-fun m!1183827 () Bool)

(assert (=> b!1291150 m!1183827))

(declare-fun m!1183829 () Bool)

(assert (=> start!109170 m!1183829))

(declare-fun m!1183831 () Bool)

(assert (=> start!109170 m!1183831))

(declare-fun m!1183833 () Bool)

(assert (=> start!109170 m!1183833))

(declare-fun m!1183835 () Bool)

(assert (=> b!1291155 m!1183835))

(declare-fun m!1183837 () Bool)

(assert (=> b!1291145 m!1183837))

(declare-fun m!1183839 () Bool)

(assert (=> b!1291145 m!1183839))

(declare-fun m!1183841 () Bool)

(assert (=> b!1291145 m!1183841))

(declare-fun m!1183843 () Bool)

(assert (=> b!1291145 m!1183843))

(declare-fun m!1183845 () Bool)

(assert (=> b!1291145 m!1183845))

(declare-fun m!1183847 () Bool)

(assert (=> b!1291145 m!1183847))

(assert (=> b!1291145 m!1183845))

(declare-fun m!1183849 () Bool)

(assert (=> b!1291145 m!1183849))

(declare-fun m!1183851 () Bool)

(assert (=> b!1291145 m!1183851))

(declare-fun m!1183853 () Bool)

(assert (=> mapNonEmpty!53009 m!1183853))

(check-sat (not start!109170) (not b!1291152) (not b!1291155) (not b!1291146) (not b_next!28659) tp_is_empty!34299 (not b!1291145) (not mapNonEmpty!53009) b_and!46749 (not b!1291149) (not b!1291150))
(check-sat b_and!46749 (not b_next!28659))
