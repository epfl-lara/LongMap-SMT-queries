; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109482 () Bool)

(assert start!109482)

(declare-fun b_free!28747 () Bool)

(declare-fun b_next!28747 () Bool)

(assert (=> start!109482 (= b_free!28747 (not b_next!28747))))

(declare-fun tp!101360 () Bool)

(declare-fun b_and!46839 () Bool)

(assert (=> start!109482 (= tp!101360 b_and!46839)))

(declare-fun b!1293953 () Bool)

(declare-fun e!738626 () Bool)

(declare-fun e!738625 () Bool)

(declare-fun mapRes!53141 () Bool)

(assert (=> b!1293953 (= e!738626 (and e!738625 mapRes!53141))))

(declare-fun condMapEmpty!53141 () Bool)

(declare-datatypes ((V!50953 0))(
  ( (V!50954 (val!17268 Int)) )
))
(declare-datatypes ((ValueCell!16295 0))(
  ( (ValueCellFull!16295 (v!19866 V!50953)) (EmptyCell!16295) )
))
(declare-datatypes ((array!85837 0))(
  ( (array!85838 (arr!41415 (Array (_ BitVec 32) ValueCell!16295)) (size!41966 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85837)

(declare-fun mapDefault!53141 () ValueCell!16295)

(assert (=> b!1293953 (= condMapEmpty!53141 (= (arr!41415 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16295)) mapDefault!53141)))))

(declare-fun b!1293954 () Bool)

(declare-fun e!738627 () Bool)

(declare-fun e!738630 () Bool)

(assert (=> b!1293954 (= e!738627 (not e!738630))))

(declare-fun res!859430 () Bool)

(assert (=> b!1293954 (=> res!859430 e!738630)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293954 (= res!859430 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22230 0))(
  ( (tuple2!22231 (_1!11126 (_ BitVec 64)) (_2!11126 V!50953)) )
))
(declare-datatypes ((List!29397 0))(
  ( (Nil!29394) (Cons!29393 (h!30611 tuple2!22230) (t!42953 List!29397)) )
))
(declare-datatypes ((ListLongMap!19895 0))(
  ( (ListLongMap!19896 (toList!9963 List!29397)) )
))
(declare-fun contains!8094 (ListLongMap!19895 (_ BitVec 64)) Bool)

(assert (=> b!1293954 (not (contains!8094 (ListLongMap!19896 Nil!29394) k0!1205))))

(declare-datatypes ((Unit!42765 0))(
  ( (Unit!42766) )
))
(declare-fun lt!579842 () Unit!42765)

(declare-fun emptyContainsNothing!128 ((_ BitVec 64)) Unit!42765)

(assert (=> b!1293954 (= lt!579842 (emptyContainsNothing!128 k0!1205))))

(declare-fun mapIsEmpty!53141 () Bool)

(assert (=> mapIsEmpty!53141 mapRes!53141))

(declare-fun res!859427 () Bool)

(assert (=> start!109482 (=> (not res!859427) (not e!738627))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109482 (= res!859427 (validMask!0 mask!2175))))

(assert (=> start!109482 e!738627))

(declare-fun tp_is_empty!34387 () Bool)

(assert (=> start!109482 tp_is_empty!34387))

(assert (=> start!109482 true))

(declare-fun array_inv!31605 (array!85837) Bool)

(assert (=> start!109482 (and (array_inv!31605 _values!1445) e!738626)))

(declare-datatypes ((array!85839 0))(
  ( (array!85840 (arr!41416 (Array (_ BitVec 32) (_ BitVec 64))) (size!41967 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85839)

(declare-fun array_inv!31606 (array!85839) Bool)

(assert (=> start!109482 (array_inv!31606 _keys!1741)))

(assert (=> start!109482 tp!101360))

(declare-fun b!1293955 () Bool)

(declare-fun res!859426 () Bool)

(assert (=> b!1293955 (=> (not res!859426) (not e!738627))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1293955 (= res!859426 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41967 _keys!1741))))))

(declare-fun b!1293956 () Bool)

(assert (=> b!1293956 (= e!738630 true)))

(declare-fun minValue!1387 () V!50953)

(declare-fun zeroValue!1387 () V!50953)

(declare-fun lt!579843 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6075 (array!85839 array!85837 (_ BitVec 32) (_ BitVec 32) V!50953 V!50953 (_ BitVec 32) Int) ListLongMap!19895)

(assert (=> b!1293956 (= lt!579843 (contains!8094 (getCurrentListMapNoExtraKeys!6075 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293957 () Bool)

(declare-fun res!859428 () Bool)

(assert (=> b!1293957 (=> (not res!859428) (not e!738627))))

(declare-fun getCurrentListMap!4994 (array!85839 array!85837 (_ BitVec 32) (_ BitVec 32) V!50953 V!50953 (_ BitVec 32) Int) ListLongMap!19895)

(assert (=> b!1293957 (= res!859428 (contains!8094 (getCurrentListMap!4994 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293958 () Bool)

(declare-fun res!859429 () Bool)

(assert (=> b!1293958 (=> (not res!859429) (not e!738627))))

(assert (=> b!1293958 (= res!859429 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41967 _keys!1741))))))

(declare-fun b!1293959 () Bool)

(declare-fun res!859432 () Bool)

(assert (=> b!1293959 (=> (not res!859432) (not e!738627))))

(declare-datatypes ((List!29398 0))(
  ( (Nil!29395) (Cons!29394 (h!30612 (_ BitVec 64)) (t!42954 List!29398)) )
))
(declare-fun arrayNoDuplicates!0 (array!85839 (_ BitVec 32) List!29398) Bool)

(assert (=> b!1293959 (= res!859432 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29395))))

(declare-fun b!1293960 () Bool)

(assert (=> b!1293960 (= e!738625 tp_is_empty!34387)))

(declare-fun mapNonEmpty!53141 () Bool)

(declare-fun tp!101359 () Bool)

(declare-fun e!738628 () Bool)

(assert (=> mapNonEmpty!53141 (= mapRes!53141 (and tp!101359 e!738628))))

(declare-fun mapRest!53141 () (Array (_ BitVec 32) ValueCell!16295))

(declare-fun mapValue!53141 () ValueCell!16295)

(declare-fun mapKey!53141 () (_ BitVec 32))

(assert (=> mapNonEmpty!53141 (= (arr!41415 _values!1445) (store mapRest!53141 mapKey!53141 mapValue!53141))))

(declare-fun b!1293961 () Bool)

(declare-fun res!859424 () Bool)

(assert (=> b!1293961 (=> (not res!859424) (not e!738627))))

(assert (=> b!1293961 (= res!859424 (and (= (size!41966 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41967 _keys!1741) (size!41966 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293962 () Bool)

(declare-fun res!859431 () Bool)

(assert (=> b!1293962 (=> (not res!859431) (not e!738627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293962 (= res!859431 (not (validKeyInArray!0 (select (arr!41416 _keys!1741) from!2144))))))

(declare-fun b!1293963 () Bool)

(assert (=> b!1293963 (= e!738628 tp_is_empty!34387)))

(declare-fun b!1293964 () Bool)

(declare-fun res!859425 () Bool)

(assert (=> b!1293964 (=> (not res!859425) (not e!738627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85839 (_ BitVec 32)) Bool)

(assert (=> b!1293964 (= res!859425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109482 res!859427) b!1293961))

(assert (= (and b!1293961 res!859424) b!1293964))

(assert (= (and b!1293964 res!859425) b!1293959))

(assert (= (and b!1293959 res!859432) b!1293958))

(assert (= (and b!1293958 res!859429) b!1293957))

(assert (= (and b!1293957 res!859428) b!1293955))

(assert (= (and b!1293955 res!859426) b!1293962))

(assert (= (and b!1293962 res!859431) b!1293954))

(assert (= (and b!1293954 (not res!859430)) b!1293956))

(assert (= (and b!1293953 condMapEmpty!53141) mapIsEmpty!53141))

(assert (= (and b!1293953 (not condMapEmpty!53141)) mapNonEmpty!53141))

(get-info :version)

(assert (= (and mapNonEmpty!53141 ((_ is ValueCellFull!16295) mapValue!53141)) b!1293963))

(assert (= (and b!1293953 ((_ is ValueCellFull!16295) mapDefault!53141)) b!1293960))

(assert (= start!109482 b!1293953))

(declare-fun m!1186761 () Bool)

(assert (=> b!1293954 m!1186761))

(declare-fun m!1186763 () Bool)

(assert (=> b!1293954 m!1186763))

(declare-fun m!1186765 () Bool)

(assert (=> b!1293956 m!1186765))

(assert (=> b!1293956 m!1186765))

(declare-fun m!1186767 () Bool)

(assert (=> b!1293956 m!1186767))

(declare-fun m!1186769 () Bool)

(assert (=> b!1293957 m!1186769))

(assert (=> b!1293957 m!1186769))

(declare-fun m!1186771 () Bool)

(assert (=> b!1293957 m!1186771))

(declare-fun m!1186773 () Bool)

(assert (=> b!1293962 m!1186773))

(assert (=> b!1293962 m!1186773))

(declare-fun m!1186775 () Bool)

(assert (=> b!1293962 m!1186775))

(declare-fun m!1186777 () Bool)

(assert (=> b!1293959 m!1186777))

(declare-fun m!1186779 () Bool)

(assert (=> mapNonEmpty!53141 m!1186779))

(declare-fun m!1186781 () Bool)

(assert (=> start!109482 m!1186781))

(declare-fun m!1186783 () Bool)

(assert (=> start!109482 m!1186783))

(declare-fun m!1186785 () Bool)

(assert (=> start!109482 m!1186785))

(declare-fun m!1186787 () Bool)

(assert (=> b!1293964 m!1186787))

(check-sat (not b_next!28747) (not b!1293962) (not b!1293964) b_and!46839 (not b!1293959) (not b!1293957) (not b!1293956) (not b!1293954) (not start!109482) (not mapNonEmpty!53141) tp_is_empty!34387)
(check-sat b_and!46839 (not b_next!28747))
