; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109162 () Bool)

(assert start!109162)

(declare-fun b_free!28651 () Bool)

(declare-fun b_next!28651 () Bool)

(assert (=> start!109162 (= b_free!28651 (not b_next!28651))))

(declare-fun tp!101073 () Bool)

(declare-fun b_and!46723 () Bool)

(assert (=> start!109162 (= tp!101073 b_and!46723)))

(declare-fun b!1290937 () Bool)

(declare-fun res!857667 () Bool)

(declare-fun e!736969 () Bool)

(assert (=> b!1290937 (=> (not res!857667) (not e!736969))))

(declare-datatypes ((array!85509 0))(
  ( (array!85510 (arr!41256 (Array (_ BitVec 32) (_ BitVec 64))) (size!41808 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85509)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85509 (_ BitVec 32)) Bool)

(assert (=> b!1290937 (= res!857667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290938 () Bool)

(declare-fun e!736967 () Bool)

(assert (=> b!1290938 (= e!736969 (not e!736967))))

(declare-fun res!857665 () Bool)

(assert (=> b!1290938 (=> res!857665 e!736967)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290938 (= res!857665 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50825 0))(
  ( (V!50826 (val!17220 Int)) )
))
(declare-datatypes ((tuple2!22184 0))(
  ( (tuple2!22185 (_1!11103 (_ BitVec 64)) (_2!11103 V!50825)) )
))
(declare-datatypes ((List!29340 0))(
  ( (Nil!29337) (Cons!29336 (h!30545 tuple2!22184) (t!42896 List!29340)) )
))
(declare-datatypes ((ListLongMap!19841 0))(
  ( (ListLongMap!19842 (toList!9936 List!29340)) )
))
(declare-fun contains!7984 (ListLongMap!19841 (_ BitVec 64)) Bool)

(assert (=> b!1290938 (not (contains!7984 (ListLongMap!19842 Nil!29337) k0!1205))))

(declare-datatypes ((Unit!42564 0))(
  ( (Unit!42565) )
))
(declare-fun lt!578734 () Unit!42564)

(declare-fun emptyContainsNothing!80 ((_ BitVec 64)) Unit!42564)

(assert (=> b!1290938 (= lt!578734 (emptyContainsNothing!80 k0!1205))))

(declare-fun b!1290939 () Bool)

(declare-fun res!857663 () Bool)

(assert (=> b!1290939 (=> (not res!857663) (not e!736969))))

(declare-datatypes ((ValueCell!16247 0))(
  ( (ValueCellFull!16247 (v!19822 V!50825)) (EmptyCell!16247) )
))
(declare-datatypes ((array!85511 0))(
  ( (array!85512 (arr!41257 (Array (_ BitVec 32) ValueCell!16247)) (size!41809 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85511)

(assert (=> b!1290939 (= res!857663 (and (= (size!41809 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41808 _keys!1741) (size!41809 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290940 () Bool)

(declare-fun e!736971 () Bool)

(declare-fun tp_is_empty!34291 () Bool)

(assert (=> b!1290940 (= e!736971 tp_is_empty!34291)))

(declare-fun mapIsEmpty!52997 () Bool)

(declare-fun mapRes!52997 () Bool)

(assert (=> mapIsEmpty!52997 mapRes!52997))

(declare-fun b!1290941 () Bool)

(declare-fun res!857666 () Bool)

(assert (=> b!1290941 (=> (not res!857666) (not e!736969))))

(declare-fun minValue!1387 () V!50825)

(declare-fun zeroValue!1387 () V!50825)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4884 (array!85509 array!85511 (_ BitVec 32) (_ BitVec 32) V!50825 V!50825 (_ BitVec 32) Int) ListLongMap!19841)

(assert (=> b!1290941 (= res!857666 (contains!7984 (getCurrentListMap!4884 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290942 () Bool)

(declare-fun e!736970 () Bool)

(declare-fun e!736968 () Bool)

(assert (=> b!1290942 (= e!736970 (and e!736968 mapRes!52997))))

(declare-fun condMapEmpty!52997 () Bool)

(declare-fun mapDefault!52997 () ValueCell!16247)

(assert (=> b!1290942 (= condMapEmpty!52997 (= (arr!41257 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16247)) mapDefault!52997)))))

(declare-fun b!1290943 () Bool)

(declare-fun res!857668 () Bool)

(assert (=> b!1290943 (=> (not res!857668) (not e!736969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290943 (= res!857668 (not (validKeyInArray!0 (select (arr!41256 _keys!1741) from!2144))))))

(declare-fun b!1290944 () Bool)

(declare-fun res!857670 () Bool)

(assert (=> b!1290944 (=> (not res!857670) (not e!736969))))

(assert (=> b!1290944 (= res!857670 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41808 _keys!1741))))))

(declare-fun b!1290945 () Bool)

(assert (=> b!1290945 (= e!736967 true)))

(assert (=> b!1290945 false))

(declare-fun lt!578733 () Unit!42564)

(declare-fun lt!578732 () ListLongMap!19841)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!51 ((_ BitVec 64) (_ BitVec 64) V!50825 ListLongMap!19841) Unit!42564)

(assert (=> b!1290945 (= lt!578733 (lemmaInListMapAfterAddingDiffThenInBefore!51 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578732))))

(declare-fun lt!578729 () ListLongMap!19841)

(declare-fun +!4410 (ListLongMap!19841 tuple2!22184) ListLongMap!19841)

(assert (=> b!1290945 (not (contains!7984 (+!4410 lt!578729 (tuple2!22185 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578731 () Unit!42564)

(declare-fun addStillNotContains!387 (ListLongMap!19841 (_ BitVec 64) V!50825 (_ BitVec 64)) Unit!42564)

(assert (=> b!1290945 (= lt!578731 (addStillNotContains!387 lt!578729 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290945 (not (contains!7984 lt!578732 k0!1205))))

(assert (=> b!1290945 (= lt!578732 (+!4410 lt!578729 (tuple2!22185 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578730 () Unit!42564)

(assert (=> b!1290945 (= lt!578730 (addStillNotContains!387 lt!578729 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6041 (array!85509 array!85511 (_ BitVec 32) (_ BitVec 32) V!50825 V!50825 (_ BitVec 32) Int) ListLongMap!19841)

(assert (=> b!1290945 (= lt!578729 (getCurrentListMapNoExtraKeys!6041 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290946 () Bool)

(assert (=> b!1290946 (= e!736968 tp_is_empty!34291)))

(declare-fun mapNonEmpty!52997 () Bool)

(declare-fun tp!101072 () Bool)

(assert (=> mapNonEmpty!52997 (= mapRes!52997 (and tp!101072 e!736971))))

(declare-fun mapKey!52997 () (_ BitVec 32))

(declare-fun mapRest!52997 () (Array (_ BitVec 32) ValueCell!16247))

(declare-fun mapValue!52997 () ValueCell!16247)

(assert (=> mapNonEmpty!52997 (= (arr!41257 _values!1445) (store mapRest!52997 mapKey!52997 mapValue!52997))))

(declare-fun b!1290948 () Bool)

(declare-fun res!857662 () Bool)

(assert (=> b!1290948 (=> (not res!857662) (not e!736969))))

(assert (=> b!1290948 (= res!857662 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41808 _keys!1741))))))

(declare-fun res!857664 () Bool)

(assert (=> start!109162 (=> (not res!857664) (not e!736969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109162 (= res!857664 (validMask!0 mask!2175))))

(assert (=> start!109162 e!736969))

(assert (=> start!109162 tp_is_empty!34291))

(assert (=> start!109162 true))

(declare-fun array_inv!31429 (array!85511) Bool)

(assert (=> start!109162 (and (array_inv!31429 _values!1445) e!736970)))

(declare-fun array_inv!31430 (array!85509) Bool)

(assert (=> start!109162 (array_inv!31430 _keys!1741)))

(assert (=> start!109162 tp!101073))

(declare-fun b!1290947 () Bool)

(declare-fun res!857669 () Bool)

(assert (=> b!1290947 (=> (not res!857669) (not e!736969))))

(declare-datatypes ((List!29341 0))(
  ( (Nil!29338) (Cons!29337 (h!30546 (_ BitVec 64)) (t!42897 List!29341)) )
))
(declare-fun arrayNoDuplicates!0 (array!85509 (_ BitVec 32) List!29341) Bool)

(assert (=> b!1290947 (= res!857669 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29338))))

(assert (= (and start!109162 res!857664) b!1290939))

(assert (= (and b!1290939 res!857663) b!1290937))

(assert (= (and b!1290937 res!857667) b!1290947))

(assert (= (and b!1290947 res!857669) b!1290944))

(assert (= (and b!1290944 res!857670) b!1290941))

(assert (= (and b!1290941 res!857666) b!1290948))

(assert (= (and b!1290948 res!857662) b!1290943))

(assert (= (and b!1290943 res!857668) b!1290938))

(assert (= (and b!1290938 (not res!857665)) b!1290945))

(assert (= (and b!1290942 condMapEmpty!52997) mapIsEmpty!52997))

(assert (= (and b!1290942 (not condMapEmpty!52997)) mapNonEmpty!52997))

(get-info :version)

(assert (= (and mapNonEmpty!52997 ((_ is ValueCellFull!16247) mapValue!52997)) b!1290940))

(assert (= (and b!1290942 ((_ is ValueCellFull!16247) mapDefault!52997)) b!1290946))

(assert (= start!109162 b!1290942))

(declare-fun m!1183155 () Bool)

(assert (=> b!1290941 m!1183155))

(assert (=> b!1290941 m!1183155))

(declare-fun m!1183157 () Bool)

(assert (=> b!1290941 m!1183157))

(declare-fun m!1183159 () Bool)

(assert (=> mapNonEmpty!52997 m!1183159))

(declare-fun m!1183161 () Bool)

(assert (=> b!1290945 m!1183161))

(declare-fun m!1183163 () Bool)

(assert (=> b!1290945 m!1183163))

(declare-fun m!1183165 () Bool)

(assert (=> b!1290945 m!1183165))

(declare-fun m!1183167 () Bool)

(assert (=> b!1290945 m!1183167))

(assert (=> b!1290945 m!1183161))

(declare-fun m!1183169 () Bool)

(assert (=> b!1290945 m!1183169))

(declare-fun m!1183171 () Bool)

(assert (=> b!1290945 m!1183171))

(declare-fun m!1183173 () Bool)

(assert (=> b!1290945 m!1183173))

(declare-fun m!1183175 () Bool)

(assert (=> b!1290945 m!1183175))

(declare-fun m!1183177 () Bool)

(assert (=> b!1290947 m!1183177))

(declare-fun m!1183179 () Bool)

(assert (=> b!1290938 m!1183179))

(declare-fun m!1183181 () Bool)

(assert (=> b!1290938 m!1183181))

(declare-fun m!1183183 () Bool)

(assert (=> b!1290937 m!1183183))

(declare-fun m!1183185 () Bool)

(assert (=> b!1290943 m!1183185))

(assert (=> b!1290943 m!1183185))

(declare-fun m!1183187 () Bool)

(assert (=> b!1290943 m!1183187))

(declare-fun m!1183189 () Bool)

(assert (=> start!109162 m!1183189))

(declare-fun m!1183191 () Bool)

(assert (=> start!109162 m!1183191))

(declare-fun m!1183193 () Bool)

(assert (=> start!109162 m!1183193))

(check-sat (not b!1290938) (not start!109162) tp_is_empty!34291 (not b!1290945) (not b!1290947) (not b!1290943) b_and!46723 (not b!1290941) (not b!1290937) (not mapNonEmpty!52997) (not b_next!28651))
(check-sat b_and!46723 (not b_next!28651))
