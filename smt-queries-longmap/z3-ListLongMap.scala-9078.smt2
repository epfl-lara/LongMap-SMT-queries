; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109476 () Bool)

(assert start!109476)

(declare-fun b_free!28741 () Bool)

(declare-fun b_next!28741 () Bool)

(assert (=> start!109476 (= b_free!28741 (not b_next!28741))))

(declare-fun tp!101342 () Bool)

(declare-fun b_and!46833 () Bool)

(assert (=> start!109476 (= tp!101342 b_and!46833)))

(declare-fun mapNonEmpty!53132 () Bool)

(declare-fun mapRes!53132 () Bool)

(declare-fun tp!101341 () Bool)

(declare-fun e!738582 () Bool)

(assert (=> mapNonEmpty!53132 (= mapRes!53132 (and tp!101341 e!738582))))

(declare-datatypes ((V!50945 0))(
  ( (V!50946 (val!17265 Int)) )
))
(declare-datatypes ((ValueCell!16292 0))(
  ( (ValueCellFull!16292 (v!19863 V!50945)) (EmptyCell!16292) )
))
(declare-fun mapRest!53132 () (Array (_ BitVec 32) ValueCell!16292))

(declare-fun mapValue!53132 () ValueCell!16292)

(declare-datatypes ((array!85825 0))(
  ( (array!85826 (arr!41409 (Array (_ BitVec 32) ValueCell!16292)) (size!41960 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85825)

(declare-fun mapKey!53132 () (_ BitVec 32))

(assert (=> mapNonEmpty!53132 (= (arr!41409 _values!1445) (store mapRest!53132 mapKey!53132 mapValue!53132))))

(declare-fun b!1293852 () Bool)

(declare-fun res!859352 () Bool)

(declare-fun e!738579 () Bool)

(assert (=> b!1293852 (=> (not res!859352) (not e!738579))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85827 0))(
  ( (array!85828 (arr!41410 (Array (_ BitVec 32) (_ BitVec 64))) (size!41961 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85827)

(assert (=> b!1293852 (= res!859352 (and (= (size!41960 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41961 _keys!1741) (size!41960 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293853 () Bool)

(declare-fun tp_is_empty!34381 () Bool)

(assert (=> b!1293853 (= e!738582 tp_is_empty!34381)))

(declare-fun b!1293854 () Bool)

(declare-fun e!738581 () Bool)

(assert (=> b!1293854 (= e!738581 tp_is_empty!34381)))

(declare-fun b!1293855 () Bool)

(declare-fun res!859357 () Bool)

(assert (=> b!1293855 (=> (not res!859357) (not e!738579))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293855 (= res!859357 (not (validKeyInArray!0 (select (arr!41410 _keys!1741) from!2144))))))

(declare-fun b!1293856 () Bool)

(assert (=> b!1293856 (= e!738579 (not (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle from!2144 (size!41961 _keys!1741)))))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22226 0))(
  ( (tuple2!22227 (_1!11124 (_ BitVec 64)) (_2!11124 V!50945)) )
))
(declare-datatypes ((List!29394 0))(
  ( (Nil!29391) (Cons!29390 (h!30608 tuple2!22226) (t!42950 List!29394)) )
))
(declare-datatypes ((ListLongMap!19891 0))(
  ( (ListLongMap!19892 (toList!9961 List!29394)) )
))
(declare-fun contains!8092 (ListLongMap!19891 (_ BitVec 64)) Bool)

(assert (=> b!1293856 (not (contains!8092 (ListLongMap!19892 Nil!29391) k0!1205))))

(declare-datatypes ((Unit!42761 0))(
  ( (Unit!42762) )
))
(declare-fun lt!579831 () Unit!42761)

(declare-fun emptyContainsNothing!126 ((_ BitVec 64)) Unit!42761)

(assert (=> b!1293856 (= lt!579831 (emptyContainsNothing!126 k0!1205))))

(declare-fun b!1293857 () Bool)

(declare-fun res!859353 () Bool)

(assert (=> b!1293857 (=> (not res!859353) (not e!738579))))

(assert (=> b!1293857 (= res!859353 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41961 _keys!1741))))))

(declare-fun b!1293858 () Bool)

(declare-fun res!859355 () Bool)

(assert (=> b!1293858 (=> (not res!859355) (not e!738579))))

(declare-datatypes ((List!29395 0))(
  ( (Nil!29392) (Cons!29391 (h!30609 (_ BitVec 64)) (t!42951 List!29395)) )
))
(declare-fun arrayNoDuplicates!0 (array!85827 (_ BitVec 32) List!29395) Bool)

(assert (=> b!1293858 (= res!859355 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29392))))

(declare-fun b!1293859 () Bool)

(declare-fun res!859350 () Bool)

(assert (=> b!1293859 (=> (not res!859350) (not e!738579))))

(assert (=> b!1293859 (= res!859350 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41961 _keys!1741))))))

(declare-fun b!1293860 () Bool)

(declare-fun res!859351 () Bool)

(assert (=> b!1293860 (=> (not res!859351) (not e!738579))))

(declare-fun minValue!1387 () V!50945)

(declare-fun zeroValue!1387 () V!50945)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4993 (array!85827 array!85825 (_ BitVec 32) (_ BitVec 32) V!50945 V!50945 (_ BitVec 32) Int) ListLongMap!19891)

(assert (=> b!1293860 (= res!859351 (contains!8092 (getCurrentListMap!4993 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293861 () Bool)

(declare-fun e!738578 () Bool)

(assert (=> b!1293861 (= e!738578 (and e!738581 mapRes!53132))))

(declare-fun condMapEmpty!53132 () Bool)

(declare-fun mapDefault!53132 () ValueCell!16292)

(assert (=> b!1293861 (= condMapEmpty!53132 (= (arr!41409 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16292)) mapDefault!53132)))))

(declare-fun b!1293862 () Bool)

(declare-fun res!859356 () Bool)

(assert (=> b!1293862 (=> (not res!859356) (not e!738579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85827 (_ BitVec 32)) Bool)

(assert (=> b!1293862 (= res!859356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53132 () Bool)

(assert (=> mapIsEmpty!53132 mapRes!53132))

(declare-fun res!859354 () Bool)

(assert (=> start!109476 (=> (not res!859354) (not e!738579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109476 (= res!859354 (validMask!0 mask!2175))))

(assert (=> start!109476 e!738579))

(assert (=> start!109476 tp_is_empty!34381))

(assert (=> start!109476 true))

(declare-fun array_inv!31603 (array!85825) Bool)

(assert (=> start!109476 (and (array_inv!31603 _values!1445) e!738578)))

(declare-fun array_inv!31604 (array!85827) Bool)

(assert (=> start!109476 (array_inv!31604 _keys!1741)))

(assert (=> start!109476 tp!101342))

(assert (= (and start!109476 res!859354) b!1293852))

(assert (= (and b!1293852 res!859352) b!1293862))

(assert (= (and b!1293862 res!859356) b!1293858))

(assert (= (and b!1293858 res!859355) b!1293859))

(assert (= (and b!1293859 res!859350) b!1293860))

(assert (= (and b!1293860 res!859351) b!1293857))

(assert (= (and b!1293857 res!859353) b!1293855))

(assert (= (and b!1293855 res!859357) b!1293856))

(assert (= (and b!1293861 condMapEmpty!53132) mapIsEmpty!53132))

(assert (= (and b!1293861 (not condMapEmpty!53132)) mapNonEmpty!53132))

(get-info :version)

(assert (= (and mapNonEmpty!53132 ((_ is ValueCellFull!16292) mapValue!53132)) b!1293853))

(assert (= (and b!1293861 ((_ is ValueCellFull!16292) mapDefault!53132)) b!1293854))

(assert (= start!109476 b!1293861))

(declare-fun m!1186689 () Bool)

(assert (=> b!1293856 m!1186689))

(declare-fun m!1186691 () Bool)

(assert (=> b!1293856 m!1186691))

(declare-fun m!1186693 () Bool)

(assert (=> b!1293860 m!1186693))

(assert (=> b!1293860 m!1186693))

(declare-fun m!1186695 () Bool)

(assert (=> b!1293860 m!1186695))

(declare-fun m!1186697 () Bool)

(assert (=> start!109476 m!1186697))

(declare-fun m!1186699 () Bool)

(assert (=> start!109476 m!1186699))

(declare-fun m!1186701 () Bool)

(assert (=> start!109476 m!1186701))

(declare-fun m!1186703 () Bool)

(assert (=> b!1293862 m!1186703))

(declare-fun m!1186705 () Bool)

(assert (=> mapNonEmpty!53132 m!1186705))

(declare-fun m!1186707 () Bool)

(assert (=> b!1293858 m!1186707))

(declare-fun m!1186709 () Bool)

(assert (=> b!1293855 m!1186709))

(assert (=> b!1293855 m!1186709))

(declare-fun m!1186711 () Bool)

(assert (=> b!1293855 m!1186711))

(check-sat (not b!1293862) b_and!46833 (not b!1293858) tp_is_empty!34381 (not b!1293856) (not b!1293855) (not b_next!28741) (not b!1293860) (not mapNonEmpty!53132) (not start!109476))
(check-sat b_and!46833 (not b_next!28741))
