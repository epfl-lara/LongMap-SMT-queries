; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109350 () Bool)

(assert start!109350)

(declare-fun b_free!28615 () Bool)

(declare-fun b_next!28615 () Bool)

(assert (=> start!109350 (= b_free!28615 (not b_next!28615))))

(declare-fun tp!100964 () Bool)

(declare-fun b_and!46707 () Bool)

(assert (=> start!109350 (= tp!100964 b_and!46707)))

(declare-fun b!1291658 () Bool)

(declare-fun res!857728 () Bool)

(declare-fun e!737522 () Bool)

(assert (=> b!1291658 (=> (not res!857728) (not e!737522))))

(declare-datatypes ((V!50777 0))(
  ( (V!50778 (val!17202 Int)) )
))
(declare-fun minValue!1387 () V!50777)

(declare-fun zeroValue!1387 () V!50777)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16229 0))(
  ( (ValueCellFull!16229 (v!19800 V!50777)) (EmptyCell!16229) )
))
(declare-datatypes ((array!85589 0))(
  ( (array!85590 (arr!41291 (Array (_ BitVec 32) ValueCell!16229)) (size!41842 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85589)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85591 0))(
  ( (array!85592 (arr!41292 (Array (_ BitVec 32) (_ BitVec 64))) (size!41843 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85591)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22118 0))(
  ( (tuple2!22119 (_1!11070 (_ BitVec 64)) (_2!11070 V!50777)) )
))
(declare-datatypes ((List!29296 0))(
  ( (Nil!29293) (Cons!29292 (h!30510 tuple2!22118) (t!42852 List!29296)) )
))
(declare-datatypes ((ListLongMap!19783 0))(
  ( (ListLongMap!19784 (toList!9907 List!29296)) )
))
(declare-fun contains!8038 (ListLongMap!19783 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4949 (array!85591 array!85589 (_ BitVec 32) (_ BitVec 32) V!50777 V!50777 (_ BitVec 32) Int) ListLongMap!19783)

(assert (=> b!1291658 (= res!857728 (contains!8038 (getCurrentListMap!4949 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291659 () Bool)

(declare-fun e!737520 () Bool)

(declare-fun tp_is_empty!34255 () Bool)

(assert (=> b!1291659 (= e!737520 tp_is_empty!34255)))

(declare-fun b!1291660 () Bool)

(declare-fun res!857731 () Bool)

(assert (=> b!1291660 (=> (not res!857731) (not e!737522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291660 (= res!857731 (not (validKeyInArray!0 (select (arr!41292 _keys!1741) from!2144))))))

(declare-fun b!1291661 () Bool)

(declare-fun res!857723 () Bool)

(assert (=> b!1291661 (=> (not res!857723) (not e!737522))))

(declare-datatypes ((List!29297 0))(
  ( (Nil!29294) (Cons!29293 (h!30511 (_ BitVec 64)) (t!42853 List!29297)) )
))
(declare-fun arrayNoDuplicates!0 (array!85591 (_ BitVec 32) List!29297) Bool)

(assert (=> b!1291661 (= res!857723 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29294))))

(declare-fun res!857724 () Bool)

(assert (=> start!109350 (=> (not res!857724) (not e!737522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109350 (= res!857724 (validMask!0 mask!2175))))

(assert (=> start!109350 e!737522))

(assert (=> start!109350 tp_is_empty!34255))

(assert (=> start!109350 true))

(declare-fun e!737519 () Bool)

(declare-fun array_inv!31517 (array!85589) Bool)

(assert (=> start!109350 (and (array_inv!31517 _values!1445) e!737519)))

(declare-fun array_inv!31518 (array!85591) Bool)

(assert (=> start!109350 (array_inv!31518 _keys!1741)))

(assert (=> start!109350 tp!100964))

(declare-fun b!1291662 () Bool)

(declare-fun e!737523 () Bool)

(assert (=> b!1291662 (= e!737523 true)))

(declare-fun lt!579052 () Bool)

(declare-fun lt!579054 () tuple2!22118)

(declare-fun lt!579053 () ListLongMap!19783)

(declare-fun +!4408 (ListLongMap!19783 tuple2!22118) ListLongMap!19783)

(assert (=> b!1291662 (= lt!579052 (contains!8038 (+!4408 lt!579053 lt!579054) k0!1205))))

(declare-fun lt!579056 () ListLongMap!19783)

(assert (=> b!1291662 (not (contains!8038 (+!4408 lt!579056 lt!579054) k0!1205))))

(assert (=> b!1291662 (= lt!579054 (tuple2!22119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-datatypes ((Unit!42663 0))(
  ( (Unit!42664) )
))
(declare-fun lt!579055 () Unit!42663)

(declare-fun addStillNotContains!384 (ListLongMap!19783 (_ BitVec 64) V!50777 (_ BitVec 64)) Unit!42663)

(assert (=> b!1291662 (= lt!579055 (addStillNotContains!384 lt!579056 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291662 (not (contains!8038 lt!579053 k0!1205))))

(assert (=> b!1291662 (= lt!579053 (+!4408 lt!579056 (tuple2!22119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579051 () Unit!42663)

(assert (=> b!1291662 (= lt!579051 (addStillNotContains!384 lt!579056 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6046 (array!85591 array!85589 (_ BitVec 32) (_ BitVec 32) V!50777 V!50777 (_ BitVec 32) Int) ListLongMap!19783)

(assert (=> b!1291662 (= lt!579056 (getCurrentListMapNoExtraKeys!6046 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291663 () Bool)

(declare-fun e!737518 () Bool)

(assert (=> b!1291663 (= e!737518 tp_is_empty!34255)))

(declare-fun b!1291664 () Bool)

(declare-fun mapRes!52943 () Bool)

(assert (=> b!1291664 (= e!737519 (and e!737520 mapRes!52943))))

(declare-fun condMapEmpty!52943 () Bool)

(declare-fun mapDefault!52943 () ValueCell!16229)

(assert (=> b!1291664 (= condMapEmpty!52943 (= (arr!41291 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16229)) mapDefault!52943)))))

(declare-fun b!1291665 () Bool)

(assert (=> b!1291665 (= e!737522 (not e!737523))))

(declare-fun res!857730 () Bool)

(assert (=> b!1291665 (=> res!857730 e!737523)))

(assert (=> b!1291665 (= res!857730 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291665 (not (contains!8038 (ListLongMap!19784 Nil!29293) k0!1205))))

(declare-fun lt!579057 () Unit!42663)

(declare-fun emptyContainsNothing!82 ((_ BitVec 64)) Unit!42663)

(assert (=> b!1291665 (= lt!579057 (emptyContainsNothing!82 k0!1205))))

(declare-fun mapNonEmpty!52943 () Bool)

(declare-fun tp!100963 () Bool)

(assert (=> mapNonEmpty!52943 (= mapRes!52943 (and tp!100963 e!737518))))

(declare-fun mapKey!52943 () (_ BitVec 32))

(declare-fun mapValue!52943 () ValueCell!16229)

(declare-fun mapRest!52943 () (Array (_ BitVec 32) ValueCell!16229))

(assert (=> mapNonEmpty!52943 (= (arr!41291 _values!1445) (store mapRest!52943 mapKey!52943 mapValue!52943))))

(declare-fun b!1291666 () Bool)

(declare-fun res!857725 () Bool)

(assert (=> b!1291666 (=> (not res!857725) (not e!737522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85591 (_ BitVec 32)) Bool)

(assert (=> b!1291666 (= res!857725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52943 () Bool)

(assert (=> mapIsEmpty!52943 mapRes!52943))

(declare-fun b!1291667 () Bool)

(declare-fun res!857729 () Bool)

(assert (=> b!1291667 (=> (not res!857729) (not e!737522))))

(assert (=> b!1291667 (= res!857729 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41843 _keys!1741))))))

(declare-fun b!1291668 () Bool)

(declare-fun res!857726 () Bool)

(assert (=> b!1291668 (=> (not res!857726) (not e!737522))))

(assert (=> b!1291668 (= res!857726 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41843 _keys!1741))))))

(declare-fun b!1291669 () Bool)

(declare-fun res!857727 () Bool)

(assert (=> b!1291669 (=> (not res!857727) (not e!737522))))

(assert (=> b!1291669 (= res!857727 (and (= (size!41842 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41843 _keys!1741) (size!41842 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109350 res!857724) b!1291669))

(assert (= (and b!1291669 res!857727) b!1291666))

(assert (= (and b!1291666 res!857725) b!1291661))

(assert (= (and b!1291661 res!857723) b!1291667))

(assert (= (and b!1291667 res!857729) b!1291658))

(assert (= (and b!1291658 res!857728) b!1291668))

(assert (= (and b!1291668 res!857726) b!1291660))

(assert (= (and b!1291660 res!857731) b!1291665))

(assert (= (and b!1291665 (not res!857730)) b!1291662))

(assert (= (and b!1291664 condMapEmpty!52943) mapIsEmpty!52943))

(assert (= (and b!1291664 (not condMapEmpty!52943)) mapNonEmpty!52943))

(get-info :version)

(assert (= (and mapNonEmpty!52943 ((_ is ValueCellFull!16229) mapValue!52943)) b!1291663))

(assert (= (and b!1291664 ((_ is ValueCellFull!16229) mapDefault!52943)) b!1291659))

(assert (= start!109350 b!1291664))

(declare-fun m!1184541 () Bool)

(assert (=> mapNonEmpty!52943 m!1184541))

(declare-fun m!1184543 () Bool)

(assert (=> b!1291661 m!1184543))

(declare-fun m!1184545 () Bool)

(assert (=> b!1291658 m!1184545))

(assert (=> b!1291658 m!1184545))

(declare-fun m!1184547 () Bool)

(assert (=> b!1291658 m!1184547))

(declare-fun m!1184549 () Bool)

(assert (=> b!1291660 m!1184549))

(assert (=> b!1291660 m!1184549))

(declare-fun m!1184551 () Bool)

(assert (=> b!1291660 m!1184551))

(declare-fun m!1184553 () Bool)

(assert (=> b!1291665 m!1184553))

(declare-fun m!1184555 () Bool)

(assert (=> b!1291665 m!1184555))

(declare-fun m!1184557 () Bool)

(assert (=> start!109350 m!1184557))

(declare-fun m!1184559 () Bool)

(assert (=> start!109350 m!1184559))

(declare-fun m!1184561 () Bool)

(assert (=> start!109350 m!1184561))

(declare-fun m!1184563 () Bool)

(assert (=> b!1291666 m!1184563))

(declare-fun m!1184565 () Bool)

(assert (=> b!1291662 m!1184565))

(assert (=> b!1291662 m!1184565))

(declare-fun m!1184567 () Bool)

(assert (=> b!1291662 m!1184567))

(declare-fun m!1184569 () Bool)

(assert (=> b!1291662 m!1184569))

(assert (=> b!1291662 m!1184569))

(declare-fun m!1184571 () Bool)

(assert (=> b!1291662 m!1184571))

(declare-fun m!1184573 () Bool)

(assert (=> b!1291662 m!1184573))

(declare-fun m!1184575 () Bool)

(assert (=> b!1291662 m!1184575))

(declare-fun m!1184577 () Bool)

(assert (=> b!1291662 m!1184577))

(declare-fun m!1184579 () Bool)

(assert (=> b!1291662 m!1184579))

(declare-fun m!1184581 () Bool)

(assert (=> b!1291662 m!1184581))

(check-sat (not b_next!28615) (not b!1291662) (not b!1291666) (not start!109350) (not mapNonEmpty!52943) tp_is_empty!34255 (not b!1291661) b_and!46707 (not b!1291658) (not b!1291660) (not b!1291665))
(check-sat b_and!46707 (not b_next!28615))
