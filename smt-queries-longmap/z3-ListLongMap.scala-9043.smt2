; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109042 () Bool)

(assert start!109042)

(declare-fun b_free!28531 () Bool)

(declare-fun b_next!28531 () Bool)

(assert (=> start!109042 (= b_free!28531 (not b_next!28531))))

(declare-fun tp!100713 () Bool)

(declare-fun b_and!46603 () Bool)

(assert (=> start!109042 (= tp!100713 b_and!46603)))

(declare-fun b!1288777 () Bool)

(declare-fun res!856042 () Bool)

(declare-fun e!735886 () Bool)

(assert (=> b!1288777 (=> (not res!856042) (not e!735886))))

(declare-datatypes ((array!85275 0))(
  ( (array!85276 (arr!41139 (Array (_ BitVec 32) (_ BitVec 64))) (size!41691 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85275)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288777 (= res!856042 (not (validKeyInArray!0 (select (arr!41139 _keys!1741) from!2144))))))

(declare-fun b!1288778 () Bool)

(declare-fun res!856046 () Bool)

(assert (=> b!1288778 (=> (not res!856046) (not e!735886))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1288778 (= res!856046 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41691 _keys!1741))))))

(declare-fun b!1288779 () Bool)

(declare-fun res!856045 () Bool)

(assert (=> b!1288779 (=> (not res!856045) (not e!735886))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85275 (_ BitVec 32)) Bool)

(assert (=> b!1288779 (= res!856045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288780 () Bool)

(declare-fun e!735891 () Bool)

(declare-fun e!735888 () Bool)

(declare-fun mapRes!52817 () Bool)

(assert (=> b!1288780 (= e!735891 (and e!735888 mapRes!52817))))

(declare-fun condMapEmpty!52817 () Bool)

(declare-datatypes ((V!50665 0))(
  ( (V!50666 (val!17160 Int)) )
))
(declare-datatypes ((ValueCell!16187 0))(
  ( (ValueCellFull!16187 (v!19762 V!50665)) (EmptyCell!16187) )
))
(declare-datatypes ((array!85277 0))(
  ( (array!85278 (arr!41140 (Array (_ BitVec 32) ValueCell!16187)) (size!41692 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85277)

(declare-fun mapDefault!52817 () ValueCell!16187)

(assert (=> b!1288780 (= condMapEmpty!52817 (= (arr!41140 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16187)) mapDefault!52817)))))

(declare-fun b!1288781 () Bool)

(declare-fun tp_is_empty!34171 () Bool)

(assert (=> b!1288781 (= e!735888 tp_is_empty!34171)))

(declare-fun res!856043 () Bool)

(assert (=> start!109042 (=> (not res!856043) (not e!735886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109042 (= res!856043 (validMask!0 mask!2175))))

(assert (=> start!109042 e!735886))

(assert (=> start!109042 tp_is_empty!34171))

(assert (=> start!109042 true))

(declare-fun array_inv!31351 (array!85277) Bool)

(assert (=> start!109042 (and (array_inv!31351 _values!1445) e!735891)))

(declare-fun array_inv!31352 (array!85275) Bool)

(assert (=> start!109042 (array_inv!31352 _keys!1741)))

(assert (=> start!109042 tp!100713))

(declare-fun b!1288782 () Bool)

(declare-fun e!735890 () Bool)

(assert (=> b!1288782 (= e!735886 (not e!735890))))

(declare-fun res!856047 () Bool)

(assert (=> b!1288782 (=> res!856047 e!735890)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288782 (= res!856047 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22088 0))(
  ( (tuple2!22089 (_1!11055 (_ BitVec 64)) (_2!11055 V!50665)) )
))
(declare-datatypes ((List!29253 0))(
  ( (Nil!29250) (Cons!29249 (h!30458 tuple2!22088) (t!42809 List!29253)) )
))
(declare-datatypes ((ListLongMap!19745 0))(
  ( (ListLongMap!19746 (toList!9888 List!29253)) )
))
(declare-fun contains!7936 (ListLongMap!19745 (_ BitVec 64)) Bool)

(assert (=> b!1288782 (not (contains!7936 (ListLongMap!19746 Nil!29250) k0!1205))))

(declare-datatypes ((Unit!42480 0))(
  ( (Unit!42481) )
))
(declare-fun lt!577914 () Unit!42480)

(declare-fun emptyContainsNothing!43 ((_ BitVec 64)) Unit!42480)

(assert (=> b!1288782 (= lt!577914 (emptyContainsNothing!43 k0!1205))))

(declare-fun mapIsEmpty!52817 () Bool)

(assert (=> mapIsEmpty!52817 mapRes!52817))

(declare-fun b!1288783 () Bool)

(declare-fun res!856044 () Bool)

(assert (=> b!1288783 (=> (not res!856044) (not e!735886))))

(declare-datatypes ((List!29254 0))(
  ( (Nil!29251) (Cons!29250 (h!30459 (_ BitVec 64)) (t!42810 List!29254)) )
))
(declare-fun arrayNoDuplicates!0 (array!85275 (_ BitVec 32) List!29254) Bool)

(assert (=> b!1288783 (= res!856044 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29251))))

(declare-fun b!1288784 () Bool)

(declare-fun e!735887 () Bool)

(assert (=> b!1288784 (= e!735887 tp_is_empty!34171)))

(declare-fun b!1288785 () Bool)

(assert (=> b!1288785 (= e!735890 true)))

(declare-fun lt!577913 () ListLongMap!19745)

(declare-fun zeroValue!1387 () V!50665)

(declare-fun +!4377 (ListLongMap!19745 tuple2!22088) ListLongMap!19745)

(assert (=> b!1288785 (not (contains!7936 (+!4377 lt!577913 (tuple2!22089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!577915 () Unit!42480)

(declare-fun addStillNotContains!354 (ListLongMap!19745 (_ BitVec 64) V!50665 (_ BitVec 64)) Unit!42480)

(assert (=> b!1288785 (= lt!577915 (addStillNotContains!354 lt!577913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50665)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6008 (array!85275 array!85277 (_ BitVec 32) (_ BitVec 32) V!50665 V!50665 (_ BitVec 32) Int) ListLongMap!19745)

(assert (=> b!1288785 (= lt!577913 (getCurrentListMapNoExtraKeys!6008 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288786 () Bool)

(declare-fun res!856048 () Bool)

(assert (=> b!1288786 (=> (not res!856048) (not e!735886))))

(declare-fun getCurrentListMap!4842 (array!85275 array!85277 (_ BitVec 32) (_ BitVec 32) V!50665 V!50665 (_ BitVec 32) Int) ListLongMap!19745)

(assert (=> b!1288786 (= res!856048 (contains!7936 (getCurrentListMap!4842 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288787 () Bool)

(declare-fun res!856049 () Bool)

(assert (=> b!1288787 (=> (not res!856049) (not e!735886))))

(assert (=> b!1288787 (= res!856049 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41691 _keys!1741))))))

(declare-fun b!1288788 () Bool)

(declare-fun res!856050 () Bool)

(assert (=> b!1288788 (=> (not res!856050) (not e!735886))))

(assert (=> b!1288788 (= res!856050 (and (= (size!41692 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41691 _keys!1741) (size!41692 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52817 () Bool)

(declare-fun tp!100712 () Bool)

(assert (=> mapNonEmpty!52817 (= mapRes!52817 (and tp!100712 e!735887))))

(declare-fun mapRest!52817 () (Array (_ BitVec 32) ValueCell!16187))

(declare-fun mapKey!52817 () (_ BitVec 32))

(declare-fun mapValue!52817 () ValueCell!16187)

(assert (=> mapNonEmpty!52817 (= (arr!41140 _values!1445) (store mapRest!52817 mapKey!52817 mapValue!52817))))

(assert (= (and start!109042 res!856043) b!1288788))

(assert (= (and b!1288788 res!856050) b!1288779))

(assert (= (and b!1288779 res!856045) b!1288783))

(assert (= (and b!1288783 res!856044) b!1288787))

(assert (= (and b!1288787 res!856049) b!1288786))

(assert (= (and b!1288786 res!856048) b!1288778))

(assert (= (and b!1288778 res!856046) b!1288777))

(assert (= (and b!1288777 res!856042) b!1288782))

(assert (= (and b!1288782 (not res!856047)) b!1288785))

(assert (= (and b!1288780 condMapEmpty!52817) mapIsEmpty!52817))

(assert (= (and b!1288780 (not condMapEmpty!52817)) mapNonEmpty!52817))

(get-info :version)

(assert (= (and mapNonEmpty!52817 ((_ is ValueCellFull!16187) mapValue!52817)) b!1288784))

(assert (= (and b!1288780 ((_ is ValueCellFull!16187) mapDefault!52817)) b!1288781))

(assert (= start!109042 b!1288780))

(declare-fun m!1180911 () Bool)

(assert (=> b!1288779 m!1180911))

(declare-fun m!1180913 () Bool)

(assert (=> b!1288782 m!1180913))

(declare-fun m!1180915 () Bool)

(assert (=> b!1288782 m!1180915))

(declare-fun m!1180917 () Bool)

(assert (=> b!1288777 m!1180917))

(assert (=> b!1288777 m!1180917))

(declare-fun m!1180919 () Bool)

(assert (=> b!1288777 m!1180919))

(declare-fun m!1180921 () Bool)

(assert (=> b!1288786 m!1180921))

(assert (=> b!1288786 m!1180921))

(declare-fun m!1180923 () Bool)

(assert (=> b!1288786 m!1180923))

(declare-fun m!1180925 () Bool)

(assert (=> b!1288783 m!1180925))

(declare-fun m!1180927 () Bool)

(assert (=> start!109042 m!1180927))

(declare-fun m!1180929 () Bool)

(assert (=> start!109042 m!1180929))

(declare-fun m!1180931 () Bool)

(assert (=> start!109042 m!1180931))

(declare-fun m!1180933 () Bool)

(assert (=> b!1288785 m!1180933))

(assert (=> b!1288785 m!1180933))

(declare-fun m!1180935 () Bool)

(assert (=> b!1288785 m!1180935))

(declare-fun m!1180937 () Bool)

(assert (=> b!1288785 m!1180937))

(declare-fun m!1180939 () Bool)

(assert (=> b!1288785 m!1180939))

(declare-fun m!1180941 () Bool)

(assert (=> mapNonEmpty!52817 m!1180941))

(check-sat (not b!1288782) (not start!109042) (not b!1288785) b_and!46603 (not b!1288777) tp_is_empty!34171 (not b!1288783) (not b!1288779) (not b_next!28531) (not b!1288786) (not mapNonEmpty!52817))
(check-sat b_and!46603 (not b_next!28531))
