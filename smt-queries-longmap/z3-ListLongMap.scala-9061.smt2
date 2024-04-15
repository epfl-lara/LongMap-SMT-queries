; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109150 () Bool)

(assert start!109150)

(declare-fun b_free!28639 () Bool)

(declare-fun b_next!28639 () Bool)

(assert (=> start!109150 (= b_free!28639 (not b_next!28639))))

(declare-fun tp!101037 () Bool)

(declare-fun b_and!46711 () Bool)

(assert (=> start!109150 (= tp!101037 b_and!46711)))

(declare-fun b!1290721 () Bool)

(declare-fun res!857508 () Bool)

(declare-fun e!736858 () Bool)

(assert (=> b!1290721 (=> (not res!857508) (not e!736858))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50809 0))(
  ( (V!50810 (val!17214 Int)) )
))
(declare-datatypes ((ValueCell!16241 0))(
  ( (ValueCellFull!16241 (v!19816 V!50809)) (EmptyCell!16241) )
))
(declare-datatypes ((array!85487 0))(
  ( (array!85488 (arr!41245 (Array (_ BitVec 32) ValueCell!16241)) (size!41797 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85487)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85489 0))(
  ( (array!85490 (arr!41246 (Array (_ BitVec 32) (_ BitVec 64))) (size!41798 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85489)

(assert (=> b!1290721 (= res!857508 (and (= (size!41797 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41798 _keys!1741) (size!41797 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290722 () Bool)

(declare-fun e!736862 () Bool)

(declare-fun tp_is_empty!34279 () Bool)

(assert (=> b!1290722 (= e!736862 tp_is_empty!34279)))

(declare-fun b!1290723 () Bool)

(declare-fun res!857502 () Bool)

(assert (=> b!1290723 (=> (not res!857502) (not e!736858))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1290723 (= res!857502 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41798 _keys!1741))))))

(declare-fun b!1290724 () Bool)

(declare-fun res!857504 () Bool)

(assert (=> b!1290724 (=> (not res!857504) (not e!736858))))

(declare-datatypes ((List!29332 0))(
  ( (Nil!29329) (Cons!29328 (h!30537 (_ BitVec 64)) (t!42888 List!29332)) )
))
(declare-fun arrayNoDuplicates!0 (array!85489 (_ BitVec 32) List!29332) Bool)

(assert (=> b!1290724 (= res!857504 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29329))))

(declare-fun b!1290725 () Bool)

(declare-fun res!857503 () Bool)

(assert (=> b!1290725 (=> (not res!857503) (not e!736858))))

(assert (=> b!1290725 (= res!857503 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41798 _keys!1741))))))

(declare-fun b!1290726 () Bool)

(declare-fun res!857505 () Bool)

(assert (=> b!1290726 (=> (not res!857505) (not e!736858))))

(declare-fun minValue!1387 () V!50809)

(declare-fun zeroValue!1387 () V!50809)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22176 0))(
  ( (tuple2!22177 (_1!11099 (_ BitVec 64)) (_2!11099 V!50809)) )
))
(declare-datatypes ((List!29333 0))(
  ( (Nil!29330) (Cons!29329 (h!30538 tuple2!22176) (t!42889 List!29333)) )
))
(declare-datatypes ((ListLongMap!19833 0))(
  ( (ListLongMap!19834 (toList!9932 List!29333)) )
))
(declare-fun contains!7980 (ListLongMap!19833 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4880 (array!85489 array!85487 (_ BitVec 32) (_ BitVec 32) V!50809 V!50809 (_ BitVec 32) Int) ListLongMap!19833)

(assert (=> b!1290726 (= res!857505 (contains!7980 (getCurrentListMap!4880 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290727 () Bool)

(declare-fun e!736861 () Bool)

(assert (=> b!1290727 (= e!736861 true)))

(assert (=> b!1290727 false))

(declare-datatypes ((Unit!42556 0))(
  ( (Unit!42557) )
))
(declare-fun lt!578622 () Unit!42556)

(declare-fun lt!578623 () ListLongMap!19833)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!48 ((_ BitVec 64) (_ BitVec 64) V!50809 ListLongMap!19833) Unit!42556)

(assert (=> b!1290727 (= lt!578622 (lemmaInListMapAfterAddingDiffThenInBefore!48 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578623))))

(declare-fun lt!578621 () ListLongMap!19833)

(declare-fun +!4407 (ListLongMap!19833 tuple2!22176) ListLongMap!19833)

(assert (=> b!1290727 (not (contains!7980 (+!4407 lt!578621 (tuple2!22177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578624 () Unit!42556)

(declare-fun addStillNotContains!384 (ListLongMap!19833 (_ BitVec 64) V!50809 (_ BitVec 64)) Unit!42556)

(assert (=> b!1290727 (= lt!578624 (addStillNotContains!384 lt!578621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290727 (not (contains!7980 lt!578623 k0!1205))))

(assert (=> b!1290727 (= lt!578623 (+!4407 lt!578621 (tuple2!22177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578626 () Unit!42556)

(assert (=> b!1290727 (= lt!578626 (addStillNotContains!384 lt!578621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6038 (array!85489 array!85487 (_ BitVec 32) (_ BitVec 32) V!50809 V!50809 (_ BitVec 32) Int) ListLongMap!19833)

(assert (=> b!1290727 (= lt!578621 (getCurrentListMapNoExtraKeys!6038 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290728 () Bool)

(assert (=> b!1290728 (= e!736858 (not e!736861))))

(declare-fun res!857501 () Bool)

(assert (=> b!1290728 (=> res!857501 e!736861)))

(assert (=> b!1290728 (= res!857501 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290728 (not (contains!7980 (ListLongMap!19834 Nil!29330) k0!1205))))

(declare-fun lt!578625 () Unit!42556)

(declare-fun emptyContainsNothing!76 ((_ BitVec 64)) Unit!42556)

(assert (=> b!1290728 (= lt!578625 (emptyContainsNothing!76 k0!1205))))

(declare-fun mapNonEmpty!52979 () Bool)

(declare-fun mapRes!52979 () Bool)

(declare-fun tp!101036 () Bool)

(declare-fun e!736863 () Bool)

(assert (=> mapNonEmpty!52979 (= mapRes!52979 (and tp!101036 e!736863))))

(declare-fun mapRest!52979 () (Array (_ BitVec 32) ValueCell!16241))

(declare-fun mapValue!52979 () ValueCell!16241)

(declare-fun mapKey!52979 () (_ BitVec 32))

(assert (=> mapNonEmpty!52979 (= (arr!41245 _values!1445) (store mapRest!52979 mapKey!52979 mapValue!52979))))

(declare-fun b!1290729 () Bool)

(declare-fun res!857507 () Bool)

(assert (=> b!1290729 (=> (not res!857507) (not e!736858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290729 (= res!857507 (not (validKeyInArray!0 (select (arr!41246 _keys!1741) from!2144))))))

(declare-fun res!857506 () Bool)

(assert (=> start!109150 (=> (not res!857506) (not e!736858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109150 (= res!857506 (validMask!0 mask!2175))))

(assert (=> start!109150 e!736858))

(assert (=> start!109150 tp_is_empty!34279))

(assert (=> start!109150 true))

(declare-fun e!736860 () Bool)

(declare-fun array_inv!31421 (array!85487) Bool)

(assert (=> start!109150 (and (array_inv!31421 _values!1445) e!736860)))

(declare-fun array_inv!31422 (array!85489) Bool)

(assert (=> start!109150 (array_inv!31422 _keys!1741)))

(assert (=> start!109150 tp!101037))

(declare-fun b!1290730 () Bool)

(assert (=> b!1290730 (= e!736860 (and e!736862 mapRes!52979))))

(declare-fun condMapEmpty!52979 () Bool)

(declare-fun mapDefault!52979 () ValueCell!16241)

(assert (=> b!1290730 (= condMapEmpty!52979 (= (arr!41245 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16241)) mapDefault!52979)))))

(declare-fun b!1290731 () Bool)

(assert (=> b!1290731 (= e!736863 tp_is_empty!34279)))

(declare-fun b!1290732 () Bool)

(declare-fun res!857500 () Bool)

(assert (=> b!1290732 (=> (not res!857500) (not e!736858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85489 (_ BitVec 32)) Bool)

(assert (=> b!1290732 (= res!857500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52979 () Bool)

(assert (=> mapIsEmpty!52979 mapRes!52979))

(assert (= (and start!109150 res!857506) b!1290721))

(assert (= (and b!1290721 res!857508) b!1290732))

(assert (= (and b!1290732 res!857500) b!1290724))

(assert (= (and b!1290724 res!857504) b!1290725))

(assert (= (and b!1290725 res!857503) b!1290726))

(assert (= (and b!1290726 res!857505) b!1290723))

(assert (= (and b!1290723 res!857502) b!1290729))

(assert (= (and b!1290729 res!857507) b!1290728))

(assert (= (and b!1290728 (not res!857501)) b!1290727))

(assert (= (and b!1290730 condMapEmpty!52979) mapIsEmpty!52979))

(assert (= (and b!1290730 (not condMapEmpty!52979)) mapNonEmpty!52979))

(get-info :version)

(assert (= (and mapNonEmpty!52979 ((_ is ValueCellFull!16241) mapValue!52979)) b!1290731))

(assert (= (and b!1290730 ((_ is ValueCellFull!16241) mapDefault!52979)) b!1290722))

(assert (= start!109150 b!1290730))

(declare-fun m!1182915 () Bool)

(assert (=> b!1290729 m!1182915))

(assert (=> b!1290729 m!1182915))

(declare-fun m!1182917 () Bool)

(assert (=> b!1290729 m!1182917))

(declare-fun m!1182919 () Bool)

(assert (=> start!109150 m!1182919))

(declare-fun m!1182921 () Bool)

(assert (=> start!109150 m!1182921))

(declare-fun m!1182923 () Bool)

(assert (=> start!109150 m!1182923))

(declare-fun m!1182925 () Bool)

(assert (=> b!1290727 m!1182925))

(declare-fun m!1182927 () Bool)

(assert (=> b!1290727 m!1182927))

(declare-fun m!1182929 () Bool)

(assert (=> b!1290727 m!1182929))

(declare-fun m!1182931 () Bool)

(assert (=> b!1290727 m!1182931))

(declare-fun m!1182933 () Bool)

(assert (=> b!1290727 m!1182933))

(declare-fun m!1182935 () Bool)

(assert (=> b!1290727 m!1182935))

(declare-fun m!1182937 () Bool)

(assert (=> b!1290727 m!1182937))

(assert (=> b!1290727 m!1182929))

(declare-fun m!1182939 () Bool)

(assert (=> b!1290727 m!1182939))

(declare-fun m!1182941 () Bool)

(assert (=> mapNonEmpty!52979 m!1182941))

(declare-fun m!1182943 () Bool)

(assert (=> b!1290732 m!1182943))

(declare-fun m!1182945 () Bool)

(assert (=> b!1290726 m!1182945))

(assert (=> b!1290726 m!1182945))

(declare-fun m!1182947 () Bool)

(assert (=> b!1290726 m!1182947))

(declare-fun m!1182949 () Bool)

(assert (=> b!1290728 m!1182949))

(declare-fun m!1182951 () Bool)

(assert (=> b!1290728 m!1182951))

(declare-fun m!1182953 () Bool)

(assert (=> b!1290724 m!1182953))

(check-sat (not b_next!28639) (not b!1290732) b_and!46711 (not mapNonEmpty!52979) tp_is_empty!34279 (not b!1290729) (not b!1290727) (not b!1290724) (not b!1290726) (not b!1290728) (not start!109150))
(check-sat b_and!46711 (not b_next!28639))
