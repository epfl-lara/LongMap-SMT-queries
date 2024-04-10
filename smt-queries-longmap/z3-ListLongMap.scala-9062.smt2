; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109158 () Bool)

(assert start!109158)

(declare-fun b_free!28647 () Bool)

(declare-fun b_next!28647 () Bool)

(assert (=> start!109158 (= b_free!28647 (not b_next!28647))))

(declare-fun tp!101060 () Bool)

(declare-fun b_and!46737 () Bool)

(assert (=> start!109158 (= tp!101060 b_and!46737)))

(declare-fun res!857639 () Bool)

(declare-fun e!736961 () Bool)

(assert (=> start!109158 (=> (not res!857639) (not e!736961))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109158 (= res!857639 (validMask!0 mask!2175))))

(assert (=> start!109158 e!736961))

(declare-fun tp_is_empty!34287 () Bool)

(assert (=> start!109158 tp_is_empty!34287))

(assert (=> start!109158 true))

(declare-datatypes ((V!50819 0))(
  ( (V!50820 (val!17218 Int)) )
))
(declare-datatypes ((ValueCell!16245 0))(
  ( (ValueCellFull!16245 (v!19821 V!50819)) (EmptyCell!16245) )
))
(declare-datatypes ((array!85610 0))(
  ( (array!85611 (arr!41306 (Array (_ BitVec 32) ValueCell!16245)) (size!41856 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85610)

(declare-fun e!736962 () Bool)

(declare-fun array_inv!31303 (array!85610) Bool)

(assert (=> start!109158 (and (array_inv!31303 _values!1445) e!736962)))

(declare-datatypes ((array!85612 0))(
  ( (array!85613 (arr!41307 (Array (_ BitVec 32) (_ BitVec 64))) (size!41857 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85612)

(declare-fun array_inv!31304 (array!85612) Bool)

(assert (=> start!109158 (array_inv!31304 _keys!1741)))

(assert (=> start!109158 tp!101060))

(declare-fun b!1290929 () Bool)

(declare-fun e!736959 () Bool)

(assert (=> b!1290929 (= e!736961 (not e!736959))))

(declare-fun res!857637 () Bool)

(assert (=> b!1290929 (=> res!857637 e!736959)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290929 (= res!857637 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22130 0))(
  ( (tuple2!22131 (_1!11076 (_ BitVec 64)) (_2!11076 V!50819)) )
))
(declare-datatypes ((List!29292 0))(
  ( (Nil!29289) (Cons!29288 (h!30497 tuple2!22130) (t!42856 List!29292)) )
))
(declare-datatypes ((ListLongMap!19787 0))(
  ( (ListLongMap!19788 (toList!9909 List!29292)) )
))
(declare-fun contains!8027 (ListLongMap!19787 (_ BitVec 64)) Bool)

(assert (=> b!1290929 (not (contains!8027 (ListLongMap!19788 Nil!29289) k0!1205))))

(declare-datatypes ((Unit!42732 0))(
  ( (Unit!42733) )
))
(declare-fun lt!578875 () Unit!42732)

(declare-fun emptyContainsNothing!91 ((_ BitVec 64)) Unit!42732)

(assert (=> b!1290929 (= lt!578875 (emptyContainsNothing!91 k0!1205))))

(declare-fun mapIsEmpty!52991 () Bool)

(declare-fun mapRes!52991 () Bool)

(assert (=> mapIsEmpty!52991 mapRes!52991))

(declare-fun b!1290930 () Bool)

(declare-fun e!736964 () Bool)

(assert (=> b!1290930 (= e!736964 tp_is_empty!34287)))

(declare-fun b!1290931 () Bool)

(declare-fun res!857638 () Bool)

(assert (=> b!1290931 (=> (not res!857638) (not e!736961))))

(declare-datatypes ((List!29293 0))(
  ( (Nil!29290) (Cons!29289 (h!30498 (_ BitVec 64)) (t!42857 List!29293)) )
))
(declare-fun arrayNoDuplicates!0 (array!85612 (_ BitVec 32) List!29293) Bool)

(assert (=> b!1290931 (= res!857638 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29290))))

(declare-fun b!1290932 () Bool)

(declare-fun e!736963 () Bool)

(assert (=> b!1290932 (= e!736962 (and e!736963 mapRes!52991))))

(declare-fun condMapEmpty!52991 () Bool)

(declare-fun mapDefault!52991 () ValueCell!16245)

(assert (=> b!1290932 (= condMapEmpty!52991 (= (arr!41306 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16245)) mapDefault!52991)))))

(declare-fun mapNonEmpty!52991 () Bool)

(declare-fun tp!101059 () Bool)

(assert (=> mapNonEmpty!52991 (= mapRes!52991 (and tp!101059 e!736964))))

(declare-fun mapRest!52991 () (Array (_ BitVec 32) ValueCell!16245))

(declare-fun mapKey!52991 () (_ BitVec 32))

(declare-fun mapValue!52991 () ValueCell!16245)

(assert (=> mapNonEmpty!52991 (= (arr!41306 _values!1445) (store mapRest!52991 mapKey!52991 mapValue!52991))))

(declare-fun b!1290933 () Bool)

(assert (=> b!1290933 (= e!736963 tp_is_empty!34287)))

(declare-fun b!1290934 () Bool)

(declare-fun res!857635 () Bool)

(assert (=> b!1290934 (=> (not res!857635) (not e!736961))))

(assert (=> b!1290934 (= res!857635 (and (= (size!41856 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41857 _keys!1741) (size!41856 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290935 () Bool)

(declare-fun res!857636 () Bool)

(assert (=> b!1290935 (=> (not res!857636) (not e!736961))))

(declare-fun minValue!1387 () V!50819)

(declare-fun zeroValue!1387 () V!50819)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4963 (array!85612 array!85610 (_ BitVec 32) (_ BitVec 32) V!50819 V!50819 (_ BitVec 32) Int) ListLongMap!19787)

(assert (=> b!1290935 (= res!857636 (contains!8027 (getCurrentListMap!4963 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290936 () Bool)

(declare-fun res!857640 () Bool)

(assert (=> b!1290936 (=> (not res!857640) (not e!736961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85612 (_ BitVec 32)) Bool)

(assert (=> b!1290936 (= res!857640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290937 () Bool)

(assert (=> b!1290937 (= e!736959 true)))

(assert (=> b!1290937 false))

(declare-fun lt!578873 () ListLongMap!19787)

(declare-fun lt!578871 () Unit!42732)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!49 ((_ BitVec 64) (_ BitVec 64) V!50819 ListLongMap!19787) Unit!42732)

(assert (=> b!1290937 (= lt!578871 (lemmaInListMapAfterAddingDiffThenInBefore!49 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578873))))

(declare-fun lt!578876 () ListLongMap!19787)

(declare-fun +!4375 (ListLongMap!19787 tuple2!22130) ListLongMap!19787)

(assert (=> b!1290937 (not (contains!8027 (+!4375 lt!578876 (tuple2!22131 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578872 () Unit!42732)

(declare-fun addStillNotContains!393 (ListLongMap!19787 (_ BitVec 64) V!50819 (_ BitVec 64)) Unit!42732)

(assert (=> b!1290937 (= lt!578872 (addStillNotContains!393 lt!578876 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290937 (not (contains!8027 lt!578873 k0!1205))))

(assert (=> b!1290937 (= lt!578873 (+!4375 lt!578876 (tuple2!22131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578874 () Unit!42732)

(assert (=> b!1290937 (= lt!578874 (addStillNotContains!393 lt!578876 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6006 (array!85612 array!85610 (_ BitVec 32) (_ BitVec 32) V!50819 V!50819 (_ BitVec 32) Int) ListLongMap!19787)

(assert (=> b!1290937 (= lt!578876 (getCurrentListMapNoExtraKeys!6006 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290938 () Bool)

(declare-fun res!857642 () Bool)

(assert (=> b!1290938 (=> (not res!857642) (not e!736961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290938 (= res!857642 (not (validKeyInArray!0 (select (arr!41307 _keys!1741) from!2144))))))

(declare-fun b!1290939 () Bool)

(declare-fun res!857643 () Bool)

(assert (=> b!1290939 (=> (not res!857643) (not e!736961))))

(assert (=> b!1290939 (= res!857643 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41857 _keys!1741))))))

(declare-fun b!1290940 () Bool)

(declare-fun res!857641 () Bool)

(assert (=> b!1290940 (=> (not res!857641) (not e!736961))))

(assert (=> b!1290940 (= res!857641 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41857 _keys!1741))))))

(assert (= (and start!109158 res!857639) b!1290934))

(assert (= (and b!1290934 res!857635) b!1290936))

(assert (= (and b!1290936 res!857640) b!1290931))

(assert (= (and b!1290931 res!857638) b!1290939))

(assert (= (and b!1290939 res!857643) b!1290935))

(assert (= (and b!1290935 res!857636) b!1290940))

(assert (= (and b!1290940 res!857641) b!1290938))

(assert (= (and b!1290938 res!857642) b!1290929))

(assert (= (and b!1290929 (not res!857637)) b!1290937))

(assert (= (and b!1290932 condMapEmpty!52991) mapIsEmpty!52991))

(assert (= (and b!1290932 (not condMapEmpty!52991)) mapNonEmpty!52991))

(get-info :version)

(assert (= (and mapNonEmpty!52991 ((_ is ValueCellFull!16245) mapValue!52991)) b!1290930))

(assert (= (and b!1290932 ((_ is ValueCellFull!16245) mapDefault!52991)) b!1290933))

(assert (= start!109158 b!1290932))

(declare-fun m!1183575 () Bool)

(assert (=> start!109158 m!1183575))

(declare-fun m!1183577 () Bool)

(assert (=> start!109158 m!1183577))

(declare-fun m!1183579 () Bool)

(assert (=> start!109158 m!1183579))

(declare-fun m!1183581 () Bool)

(assert (=> b!1290937 m!1183581))

(declare-fun m!1183583 () Bool)

(assert (=> b!1290937 m!1183583))

(declare-fun m!1183585 () Bool)

(assert (=> b!1290937 m!1183585))

(declare-fun m!1183587 () Bool)

(assert (=> b!1290937 m!1183587))

(declare-fun m!1183589 () Bool)

(assert (=> b!1290937 m!1183589))

(declare-fun m!1183591 () Bool)

(assert (=> b!1290937 m!1183591))

(assert (=> b!1290937 m!1183591))

(declare-fun m!1183593 () Bool)

(assert (=> b!1290937 m!1183593))

(declare-fun m!1183595 () Bool)

(assert (=> b!1290937 m!1183595))

(declare-fun m!1183597 () Bool)

(assert (=> b!1290929 m!1183597))

(declare-fun m!1183599 () Bool)

(assert (=> b!1290929 m!1183599))

(declare-fun m!1183601 () Bool)

(assert (=> b!1290935 m!1183601))

(assert (=> b!1290935 m!1183601))

(declare-fun m!1183603 () Bool)

(assert (=> b!1290935 m!1183603))

(declare-fun m!1183605 () Bool)

(assert (=> b!1290931 m!1183605))

(declare-fun m!1183607 () Bool)

(assert (=> mapNonEmpty!52991 m!1183607))

(declare-fun m!1183609 () Bool)

(assert (=> b!1290936 m!1183609))

(declare-fun m!1183611 () Bool)

(assert (=> b!1290938 m!1183611))

(assert (=> b!1290938 m!1183611))

(declare-fun m!1183613 () Bool)

(assert (=> b!1290938 m!1183613))

(check-sat (not b!1290935) (not b!1290937) b_and!46737 (not start!109158) (not b!1290938) tp_is_empty!34287 (not mapNonEmpty!52991) (not b!1290931) (not b!1290929) (not b_next!28647) (not b!1290936))
(check-sat b_and!46737 (not b_next!28647))
