; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109186 () Bool)

(assert start!109186)

(declare-fun b_free!28675 () Bool)

(declare-fun b_next!28675 () Bool)

(assert (=> start!109186 (= b_free!28675 (not b_next!28675))))

(declare-fun tp!101144 () Bool)

(declare-fun b_and!46747 () Bool)

(assert (=> start!109186 (= tp!101144 b_and!46747)))

(declare-fun b!1291369 () Bool)

(declare-fun res!857990 () Bool)

(declare-fun e!737183 () Bool)

(assert (=> b!1291369 (=> (not res!857990) (not e!737183))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85549 0))(
  ( (array!85550 (arr!41276 (Array (_ BitVec 32) (_ BitVec 64))) (size!41828 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85549)

(assert (=> b!1291369 (= res!857990 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41828 _keys!1741))))))

(declare-fun b!1291370 () Bool)

(declare-fun res!857992 () Bool)

(assert (=> b!1291370 (=> (not res!857992) (not e!737183))))

(assert (=> b!1291370 (= res!857992 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41828 _keys!1741))))))

(declare-fun res!857986 () Bool)

(assert (=> start!109186 (=> (not res!857986) (not e!737183))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109186 (= res!857986 (validMask!0 mask!2175))))

(assert (=> start!109186 e!737183))

(declare-fun tp_is_empty!34315 () Bool)

(assert (=> start!109186 tp_is_empty!34315))

(assert (=> start!109186 true))

(declare-datatypes ((V!50857 0))(
  ( (V!50858 (val!17232 Int)) )
))
(declare-datatypes ((ValueCell!16259 0))(
  ( (ValueCellFull!16259 (v!19834 V!50857)) (EmptyCell!16259) )
))
(declare-datatypes ((array!85551 0))(
  ( (array!85552 (arr!41277 (Array (_ BitVec 32) ValueCell!16259)) (size!41829 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85551)

(declare-fun e!737187 () Bool)

(declare-fun array_inv!31437 (array!85551) Bool)

(assert (=> start!109186 (and (array_inv!31437 _values!1445) e!737187)))

(declare-fun array_inv!31438 (array!85549) Bool)

(assert (=> start!109186 (array_inv!31438 _keys!1741)))

(assert (=> start!109186 tp!101144))

(declare-fun b!1291371 () Bool)

(declare-fun res!857994 () Bool)

(assert (=> b!1291371 (=> (not res!857994) (not e!737183))))

(declare-datatypes ((List!29353 0))(
  ( (Nil!29350) (Cons!29349 (h!30558 (_ BitVec 64)) (t!42909 List!29353)) )
))
(declare-fun arrayNoDuplicates!0 (array!85549 (_ BitVec 32) List!29353) Bool)

(assert (=> b!1291371 (= res!857994 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29350))))

(declare-fun mapNonEmpty!53033 () Bool)

(declare-fun mapRes!53033 () Bool)

(declare-fun tp!101145 () Bool)

(declare-fun e!737185 () Bool)

(assert (=> mapNonEmpty!53033 (= mapRes!53033 (and tp!101145 e!737185))))

(declare-fun mapKey!53033 () (_ BitVec 32))

(declare-fun mapRest!53033 () (Array (_ BitVec 32) ValueCell!16259))

(declare-fun mapValue!53033 () ValueCell!16259)

(assert (=> mapNonEmpty!53033 (= (arr!41277 _values!1445) (store mapRest!53033 mapKey!53033 mapValue!53033))))

(declare-fun b!1291372 () Bool)

(declare-fun e!737182 () Bool)

(assert (=> b!1291372 (= e!737182 tp_is_empty!34315)))

(declare-fun mapIsEmpty!53033 () Bool)

(assert (=> mapIsEmpty!53033 mapRes!53033))

(declare-fun b!1291373 () Bool)

(declare-fun e!737184 () Bool)

(assert (=> b!1291373 (= e!737184 true)))

(assert (=> b!1291373 false))

(declare-fun minValue!1387 () V!50857)

(declare-datatypes ((Unit!42578 0))(
  ( (Unit!42579) )
))
(declare-fun lt!578949 () Unit!42578)

(declare-datatypes ((tuple2!22198 0))(
  ( (tuple2!22199 (_1!11110 (_ BitVec 64)) (_2!11110 V!50857)) )
))
(declare-datatypes ((List!29354 0))(
  ( (Nil!29351) (Cons!29350 (h!30559 tuple2!22198) (t!42910 List!29354)) )
))
(declare-datatypes ((ListLongMap!19855 0))(
  ( (ListLongMap!19856 (toList!9943 List!29354)) )
))
(declare-fun lt!578946 () ListLongMap!19855)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!58 ((_ BitVec 64) (_ BitVec 64) V!50857 ListLongMap!19855) Unit!42578)

(assert (=> b!1291373 (= lt!578949 (lemmaInListMapAfterAddingDiffThenInBefore!58 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578946))))

(declare-fun lt!578950 () ListLongMap!19855)

(declare-fun contains!7991 (ListLongMap!19855 (_ BitVec 64)) Bool)

(declare-fun +!4417 (ListLongMap!19855 tuple2!22198) ListLongMap!19855)

(assert (=> b!1291373 (not (contains!7991 (+!4417 lt!578950 (tuple2!22199 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578947 () Unit!42578)

(declare-fun addStillNotContains!394 (ListLongMap!19855 (_ BitVec 64) V!50857 (_ BitVec 64)) Unit!42578)

(assert (=> b!1291373 (= lt!578947 (addStillNotContains!394 lt!578950 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291373 (not (contains!7991 lt!578946 k0!1205))))

(declare-fun zeroValue!1387 () V!50857)

(assert (=> b!1291373 (= lt!578946 (+!4417 lt!578950 (tuple2!22199 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578948 () Unit!42578)

(assert (=> b!1291373 (= lt!578948 (addStillNotContains!394 lt!578950 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6048 (array!85549 array!85551 (_ BitVec 32) (_ BitVec 32) V!50857 V!50857 (_ BitVec 32) Int) ListLongMap!19855)

(assert (=> b!1291373 (= lt!578950 (getCurrentListMapNoExtraKeys!6048 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291374 () Bool)

(assert (=> b!1291374 (= e!737183 (not e!737184))))

(declare-fun res!857988 () Bool)

(assert (=> b!1291374 (=> res!857988 e!737184)))

(assert (=> b!1291374 (= res!857988 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291374 (not (contains!7991 (ListLongMap!19856 Nil!29351) k0!1205))))

(declare-fun lt!578945 () Unit!42578)

(declare-fun emptyContainsNothing!87 ((_ BitVec 64)) Unit!42578)

(assert (=> b!1291374 (= lt!578945 (emptyContainsNothing!87 k0!1205))))

(declare-fun b!1291375 () Bool)

(assert (=> b!1291375 (= e!737187 (and e!737182 mapRes!53033))))

(declare-fun condMapEmpty!53033 () Bool)

(declare-fun mapDefault!53033 () ValueCell!16259)

(assert (=> b!1291375 (= condMapEmpty!53033 (= (arr!41277 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16259)) mapDefault!53033)))))

(declare-fun b!1291376 () Bool)

(declare-fun res!857991 () Bool)

(assert (=> b!1291376 (=> (not res!857991) (not e!737183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291376 (= res!857991 (not (validKeyInArray!0 (select (arr!41276 _keys!1741) from!2144))))))

(declare-fun b!1291377 () Bool)

(declare-fun res!857987 () Bool)

(assert (=> b!1291377 (=> (not res!857987) (not e!737183))))

(declare-fun getCurrentListMap!4890 (array!85549 array!85551 (_ BitVec 32) (_ BitVec 32) V!50857 V!50857 (_ BitVec 32) Int) ListLongMap!19855)

(assert (=> b!1291377 (= res!857987 (contains!7991 (getCurrentListMap!4890 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291378 () Bool)

(declare-fun res!857989 () Bool)

(assert (=> b!1291378 (=> (not res!857989) (not e!737183))))

(assert (=> b!1291378 (= res!857989 (and (= (size!41829 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41828 _keys!1741) (size!41829 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291379 () Bool)

(declare-fun res!857993 () Bool)

(assert (=> b!1291379 (=> (not res!857993) (not e!737183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85549 (_ BitVec 32)) Bool)

(assert (=> b!1291379 (= res!857993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291380 () Bool)

(assert (=> b!1291380 (= e!737185 tp_is_empty!34315)))

(assert (= (and start!109186 res!857986) b!1291378))

(assert (= (and b!1291378 res!857989) b!1291379))

(assert (= (and b!1291379 res!857993) b!1291371))

(assert (= (and b!1291371 res!857994) b!1291370))

(assert (= (and b!1291370 res!857992) b!1291377))

(assert (= (and b!1291377 res!857987) b!1291369))

(assert (= (and b!1291369 res!857990) b!1291376))

(assert (= (and b!1291376 res!857991) b!1291374))

(assert (= (and b!1291374 (not res!857988)) b!1291373))

(assert (= (and b!1291375 condMapEmpty!53033) mapIsEmpty!53033))

(assert (= (and b!1291375 (not condMapEmpty!53033)) mapNonEmpty!53033))

(get-info :version)

(assert (= (and mapNonEmpty!53033 ((_ is ValueCellFull!16259) mapValue!53033)) b!1291380))

(assert (= (and b!1291375 ((_ is ValueCellFull!16259) mapDefault!53033)) b!1291372))

(assert (= start!109186 b!1291375))

(declare-fun m!1183635 () Bool)

(assert (=> b!1291376 m!1183635))

(assert (=> b!1291376 m!1183635))

(declare-fun m!1183637 () Bool)

(assert (=> b!1291376 m!1183637))

(declare-fun m!1183639 () Bool)

(assert (=> start!109186 m!1183639))

(declare-fun m!1183641 () Bool)

(assert (=> start!109186 m!1183641))

(declare-fun m!1183643 () Bool)

(assert (=> start!109186 m!1183643))

(declare-fun m!1183645 () Bool)

(assert (=> b!1291377 m!1183645))

(assert (=> b!1291377 m!1183645))

(declare-fun m!1183647 () Bool)

(assert (=> b!1291377 m!1183647))

(declare-fun m!1183649 () Bool)

(assert (=> mapNonEmpty!53033 m!1183649))

(declare-fun m!1183651 () Bool)

(assert (=> b!1291374 m!1183651))

(declare-fun m!1183653 () Bool)

(assert (=> b!1291374 m!1183653))

(declare-fun m!1183655 () Bool)

(assert (=> b!1291371 m!1183655))

(declare-fun m!1183657 () Bool)

(assert (=> b!1291379 m!1183657))

(declare-fun m!1183659 () Bool)

(assert (=> b!1291373 m!1183659))

(declare-fun m!1183661 () Bool)

(assert (=> b!1291373 m!1183661))

(assert (=> b!1291373 m!1183659))

(declare-fun m!1183663 () Bool)

(assert (=> b!1291373 m!1183663))

(declare-fun m!1183665 () Bool)

(assert (=> b!1291373 m!1183665))

(declare-fun m!1183667 () Bool)

(assert (=> b!1291373 m!1183667))

(declare-fun m!1183669 () Bool)

(assert (=> b!1291373 m!1183669))

(declare-fun m!1183671 () Bool)

(assert (=> b!1291373 m!1183671))

(declare-fun m!1183673 () Bool)

(assert (=> b!1291373 m!1183673))

(check-sat tp_is_empty!34315 (not mapNonEmpty!53033) (not b_next!28675) (not b!1291373) (not b!1291376) (not b!1291374) (not start!109186) (not b!1291377) (not b!1291379) b_and!46747 (not b!1291371))
(check-sat b_and!46747 (not b_next!28675))
