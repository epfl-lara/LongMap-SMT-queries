; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109416 () Bool)

(assert start!109416)

(declare-fun b_free!28681 () Bool)

(declare-fun b_next!28681 () Bool)

(assert (=> start!109416 (= b_free!28681 (not b_next!28681))))

(declare-fun tp!101162 () Bool)

(declare-fun b_and!46773 () Bool)

(assert (=> start!109416 (= tp!101162 b_and!46773)))

(declare-fun b!1292846 () Bool)

(declare-fun res!858621 () Bool)

(declare-fun e!738117 () Bool)

(assert (=> b!1292846 (=> (not res!858621) (not e!738117))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85711 0))(
  ( (array!85712 (arr!41352 (Array (_ BitVec 32) (_ BitVec 64))) (size!41903 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85711)

(assert (=> b!1292846 (= res!858621 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41903 _keys!1741))))))

(declare-fun b!1292847 () Bool)

(declare-fun res!858615 () Bool)

(assert (=> b!1292847 (=> (not res!858615) (not e!738117))))

(declare-datatypes ((List!29349 0))(
  ( (Nil!29346) (Cons!29345 (h!30563 (_ BitVec 64)) (t!42905 List!29349)) )
))
(declare-fun arrayNoDuplicates!0 (array!85711 (_ BitVec 32) List!29349) Bool)

(assert (=> b!1292847 (= res!858615 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29346))))

(declare-fun mapNonEmpty!53042 () Bool)

(declare-fun mapRes!53042 () Bool)

(declare-fun tp!101161 () Bool)

(declare-fun e!738113 () Bool)

(assert (=> mapNonEmpty!53042 (= mapRes!53042 (and tp!101161 e!738113))))

(declare-datatypes ((V!50865 0))(
  ( (V!50866 (val!17235 Int)) )
))
(declare-datatypes ((ValueCell!16262 0))(
  ( (ValueCellFull!16262 (v!19833 V!50865)) (EmptyCell!16262) )
))
(declare-fun mapValue!53042 () ValueCell!16262)

(declare-fun mapRest!53042 () (Array (_ BitVec 32) ValueCell!16262))

(declare-datatypes ((array!85713 0))(
  ( (array!85714 (arr!41353 (Array (_ BitVec 32) ValueCell!16262)) (size!41904 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85713)

(declare-fun mapKey!53042 () (_ BitVec 32))

(assert (=> mapNonEmpty!53042 (= (arr!41353 _values!1445) (store mapRest!53042 mapKey!53042 mapValue!53042))))

(declare-fun b!1292848 () Bool)

(declare-fun tp_is_empty!34321 () Bool)

(assert (=> b!1292848 (= e!738113 tp_is_empty!34321)))

(declare-fun res!858614 () Bool)

(assert (=> start!109416 (=> (not res!858614) (not e!738117))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109416 (= res!858614 (validMask!0 mask!2175))))

(assert (=> start!109416 e!738117))

(assert (=> start!109416 tp_is_empty!34321))

(assert (=> start!109416 true))

(declare-fun e!738112 () Bool)

(declare-fun array_inv!31563 (array!85713) Bool)

(assert (=> start!109416 (and (array_inv!31563 _values!1445) e!738112)))

(declare-fun array_inv!31564 (array!85711) Bool)

(assert (=> start!109416 (array_inv!31564 _keys!1741)))

(assert (=> start!109416 tp!101162))

(declare-fun b!1292849 () Bool)

(declare-fun e!738114 () Bool)

(assert (=> b!1292849 (= e!738114 true)))

(assert (=> b!1292849 false))

(declare-fun minValue!1387 () V!50865)

(declare-datatypes ((tuple2!22176 0))(
  ( (tuple2!22177 (_1!11099 (_ BitVec 64)) (_2!11099 V!50865)) )
))
(declare-datatypes ((List!29350 0))(
  ( (Nil!29347) (Cons!29346 (h!30564 tuple2!22176) (t!42906 List!29350)) )
))
(declare-datatypes ((ListLongMap!19841 0))(
  ( (ListLongMap!19842 (toList!9936 List!29350)) )
))
(declare-fun lt!579665 () ListLongMap!19841)

(declare-datatypes ((Unit!42719 0))(
  ( (Unit!42720) )
))
(declare-fun lt!579664 () Unit!42719)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!62 ((_ BitVec 64) (_ BitVec 64) V!50865 ListLongMap!19841) Unit!42719)

(assert (=> b!1292849 (= lt!579664 (lemmaInListMapAfterAddingDiffThenInBefore!62 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579665))))

(declare-fun lt!579666 () ListLongMap!19841)

(declare-fun contains!8067 (ListLongMap!19841 (_ BitVec 64)) Bool)

(declare-fun +!4433 (ListLongMap!19841 tuple2!22176) ListLongMap!19841)

(assert (=> b!1292849 (not (contains!8067 (+!4433 lt!579666 (tuple2!22177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579663 () Unit!42719)

(declare-fun addStillNotContains!409 (ListLongMap!19841 (_ BitVec 64) V!50865 (_ BitVec 64)) Unit!42719)

(assert (=> b!1292849 (= lt!579663 (addStillNotContains!409 lt!579666 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1292849 (not (contains!8067 lt!579665 k0!1205))))

(declare-fun zeroValue!1387 () V!50865)

(assert (=> b!1292849 (= lt!579665 (+!4433 lt!579666 (tuple2!22177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579662 () Unit!42719)

(assert (=> b!1292849 (= lt!579662 (addStillNotContains!409 lt!579666 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6071 (array!85711 array!85713 (_ BitVec 32) (_ BitVec 32) V!50865 V!50865 (_ BitVec 32) Int) ListLongMap!19841)

(assert (=> b!1292849 (= lt!579666 (getCurrentListMapNoExtraKeys!6071 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1292850 () Bool)

(declare-fun res!858619 () Bool)

(assert (=> b!1292850 (=> (not res!858619) (not e!738117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85711 (_ BitVec 32)) Bool)

(assert (=> b!1292850 (= res!858619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292851 () Bool)

(declare-fun res!858617 () Bool)

(assert (=> b!1292851 (=> (not res!858617) (not e!738117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292851 (= res!858617 (not (validKeyInArray!0 (select (arr!41352 _keys!1741) from!2144))))))

(declare-fun b!1292852 () Bool)

(declare-fun res!858618 () Bool)

(assert (=> b!1292852 (=> (not res!858618) (not e!738117))))

(assert (=> b!1292852 (= res!858618 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41903 _keys!1741))))))

(declare-fun b!1292853 () Bool)

(declare-fun e!738116 () Bool)

(assert (=> b!1292853 (= e!738116 tp_is_empty!34321)))

(declare-fun b!1292854 () Bool)

(assert (=> b!1292854 (= e!738117 (not e!738114))))

(declare-fun res!858620 () Bool)

(assert (=> b!1292854 (=> res!858620 e!738114)))

(assert (=> b!1292854 (= res!858620 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1292854 (not (contains!8067 (ListLongMap!19842 Nil!29347) k0!1205))))

(declare-fun lt!579661 () Unit!42719)

(declare-fun emptyContainsNothing!106 ((_ BitVec 64)) Unit!42719)

(assert (=> b!1292854 (= lt!579661 (emptyContainsNothing!106 k0!1205))))

(declare-fun mapIsEmpty!53042 () Bool)

(assert (=> mapIsEmpty!53042 mapRes!53042))

(declare-fun b!1292855 () Bool)

(declare-fun res!858622 () Bool)

(assert (=> b!1292855 (=> (not res!858622) (not e!738117))))

(assert (=> b!1292855 (= res!858622 (and (= (size!41904 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41903 _keys!1741) (size!41904 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292856 () Bool)

(declare-fun res!858616 () Bool)

(assert (=> b!1292856 (=> (not res!858616) (not e!738117))))

(declare-fun getCurrentListMap!4970 (array!85711 array!85713 (_ BitVec 32) (_ BitVec 32) V!50865 V!50865 (_ BitVec 32) Int) ListLongMap!19841)

(assert (=> b!1292856 (= res!858616 (contains!8067 (getCurrentListMap!4970 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292857 () Bool)

(assert (=> b!1292857 (= e!738112 (and e!738116 mapRes!53042))))

(declare-fun condMapEmpty!53042 () Bool)

(declare-fun mapDefault!53042 () ValueCell!16262)

(assert (=> b!1292857 (= condMapEmpty!53042 (= (arr!41353 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16262)) mapDefault!53042)))))

(assert (= (and start!109416 res!858614) b!1292855))

(assert (= (and b!1292855 res!858622) b!1292850))

(assert (= (and b!1292850 res!858619) b!1292847))

(assert (= (and b!1292847 res!858615) b!1292852))

(assert (= (and b!1292852 res!858618) b!1292856))

(assert (= (and b!1292856 res!858616) b!1292846))

(assert (= (and b!1292846 res!858621) b!1292851))

(assert (= (and b!1292851 res!858617) b!1292854))

(assert (= (and b!1292854 (not res!858620)) b!1292849))

(assert (= (and b!1292857 condMapEmpty!53042) mapIsEmpty!53042))

(assert (= (and b!1292857 (not condMapEmpty!53042)) mapNonEmpty!53042))

(get-info :version)

(assert (= (and mapNonEmpty!53042 ((_ is ValueCellFull!16262) mapValue!53042)) b!1292848))

(assert (= (and b!1292857 ((_ is ValueCellFull!16262) mapDefault!53042)) b!1292853))

(assert (= start!109416 b!1292857))

(declare-fun m!1185873 () Bool)

(assert (=> b!1292851 m!1185873))

(assert (=> b!1292851 m!1185873))

(declare-fun m!1185875 () Bool)

(assert (=> b!1292851 m!1185875))

(declare-fun m!1185877 () Bool)

(assert (=> start!109416 m!1185877))

(declare-fun m!1185879 () Bool)

(assert (=> start!109416 m!1185879))

(declare-fun m!1185881 () Bool)

(assert (=> start!109416 m!1185881))

(declare-fun m!1185883 () Bool)

(assert (=> b!1292847 m!1185883))

(declare-fun m!1185885 () Bool)

(assert (=> mapNonEmpty!53042 m!1185885))

(declare-fun m!1185887 () Bool)

(assert (=> b!1292850 m!1185887))

(declare-fun m!1185889 () Bool)

(assert (=> b!1292856 m!1185889))

(assert (=> b!1292856 m!1185889))

(declare-fun m!1185891 () Bool)

(assert (=> b!1292856 m!1185891))

(declare-fun m!1185893 () Bool)

(assert (=> b!1292854 m!1185893))

(declare-fun m!1185895 () Bool)

(assert (=> b!1292854 m!1185895))

(declare-fun m!1185897 () Bool)

(assert (=> b!1292849 m!1185897))

(declare-fun m!1185899 () Bool)

(assert (=> b!1292849 m!1185899))

(declare-fun m!1185901 () Bool)

(assert (=> b!1292849 m!1185901))

(assert (=> b!1292849 m!1185901))

(declare-fun m!1185903 () Bool)

(assert (=> b!1292849 m!1185903))

(declare-fun m!1185905 () Bool)

(assert (=> b!1292849 m!1185905))

(declare-fun m!1185907 () Bool)

(assert (=> b!1292849 m!1185907))

(declare-fun m!1185909 () Bool)

(assert (=> b!1292849 m!1185909))

(declare-fun m!1185911 () Bool)

(assert (=> b!1292849 m!1185911))

(check-sat (not b!1292849) (not b!1292851) (not b!1292850) b_and!46773 (not b_next!28681) tp_is_empty!34321 (not b!1292854) (not b!1292847) (not mapNonEmpty!53042) (not b!1292856) (not start!109416))
(check-sat b_and!46773 (not b_next!28681))
