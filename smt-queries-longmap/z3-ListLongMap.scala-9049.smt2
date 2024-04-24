; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109302 () Bool)

(assert start!109302)

(declare-fun b_free!28567 () Bool)

(declare-fun b_next!28567 () Bool)

(assert (=> start!109302 (= b_free!28567 (not b_next!28567))))

(declare-fun tp!100819 () Bool)

(declare-fun b_and!46659 () Bool)

(assert (=> start!109302 (= tp!100819 b_and!46659)))

(declare-fun b!1290794 () Bool)

(declare-fun res!857082 () Bool)

(declare-fun e!737087 () Bool)

(assert (=> b!1290794 (=> (not res!857082) (not e!737087))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85493 0))(
  ( (array!85494 (arr!41243 (Array (_ BitVec 32) (_ BitVec 64))) (size!41794 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85493)

(assert (=> b!1290794 (= res!857082 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41794 _keys!1741))))))

(declare-fun b!1290796 () Bool)

(declare-fun e!737088 () Bool)

(assert (=> b!1290796 (= e!737087 (not e!737088))))

(declare-fun res!857075 () Bool)

(assert (=> b!1290796 (=> res!857075 e!737088)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290796 (= res!857075 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!50713 0))(
  ( (V!50714 (val!17178 Int)) )
))
(declare-datatypes ((tuple2!22078 0))(
  ( (tuple2!22079 (_1!11050 (_ BitVec 64)) (_2!11050 V!50713)) )
))
(declare-datatypes ((List!29259 0))(
  ( (Nil!29256) (Cons!29255 (h!30473 tuple2!22078) (t!42815 List!29259)) )
))
(declare-datatypes ((ListLongMap!19743 0))(
  ( (ListLongMap!19744 (toList!9887 List!29259)) )
))
(declare-fun contains!8018 (ListLongMap!19743 (_ BitVec 64)) Bool)

(assert (=> b!1290796 (not (contains!8018 (ListLongMap!19744 Nil!29256) k0!1205))))

(declare-datatypes ((Unit!42623 0))(
  ( (Unit!42624) )
))
(declare-fun lt!578757 () Unit!42623)

(declare-fun emptyContainsNothing!63 ((_ BitVec 64)) Unit!42623)

(assert (=> b!1290796 (= lt!578757 (emptyContainsNothing!63 k0!1205))))

(declare-fun b!1290797 () Bool)

(declare-fun e!737089 () Bool)

(declare-fun e!737091 () Bool)

(declare-fun mapRes!52871 () Bool)

(assert (=> b!1290797 (= e!737089 (and e!737091 mapRes!52871))))

(declare-fun condMapEmpty!52871 () Bool)

(declare-datatypes ((ValueCell!16205 0))(
  ( (ValueCellFull!16205 (v!19776 V!50713)) (EmptyCell!16205) )
))
(declare-datatypes ((array!85495 0))(
  ( (array!85496 (arr!41244 (Array (_ BitVec 32) ValueCell!16205)) (size!41795 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85495)

(declare-fun mapDefault!52871 () ValueCell!16205)

(assert (=> b!1290797 (= condMapEmpty!52871 (= (arr!41244 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16205)) mapDefault!52871)))))

(declare-fun b!1290798 () Bool)

(declare-fun res!857080 () Bool)

(assert (=> b!1290798 (=> (not res!857080) (not e!737087))))

(declare-datatypes ((List!29260 0))(
  ( (Nil!29257) (Cons!29256 (h!30474 (_ BitVec 64)) (t!42816 List!29260)) )
))
(declare-fun arrayNoDuplicates!0 (array!85493 (_ BitVec 32) List!29260) Bool)

(assert (=> b!1290798 (= res!857080 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29257))))

(declare-fun b!1290799 () Bool)

(declare-fun res!857081 () Bool)

(assert (=> b!1290799 (=> (not res!857081) (not e!737087))))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1290799 (= res!857081 (and (= (size!41795 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41794 _keys!1741) (size!41795 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!857077 () Bool)

(assert (=> start!109302 (=> (not res!857077) (not e!737087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109302 (= res!857077 (validMask!0 mask!2175))))

(assert (=> start!109302 e!737087))

(declare-fun tp_is_empty!34207 () Bool)

(assert (=> start!109302 tp_is_empty!34207))

(assert (=> start!109302 true))

(declare-fun array_inv!31475 (array!85495) Bool)

(assert (=> start!109302 (and (array_inv!31475 _values!1445) e!737089)))

(declare-fun array_inv!31476 (array!85493) Bool)

(assert (=> start!109302 (array_inv!31476 _keys!1741)))

(assert (=> start!109302 tp!100819))

(declare-fun b!1290795 () Bool)

(assert (=> b!1290795 (= e!737091 tp_is_empty!34207)))

(declare-fun b!1290800 () Bool)

(assert (=> b!1290800 (= e!737088 true)))

(declare-fun lt!578760 () ListLongMap!19743)

(declare-fun minValue!1387 () V!50713)

(declare-fun +!4390 (ListLongMap!19743 tuple2!22078) ListLongMap!19743)

(assert (=> b!1290800 (not (contains!8018 (+!4390 lt!578760 (tuple2!22079 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578759 () Unit!42623)

(declare-fun addStillNotContains!366 (ListLongMap!19743 (_ BitVec 64) V!50713 (_ BitVec 64)) Unit!42623)

(assert (=> b!1290800 (= lt!578759 (addStillNotContains!366 lt!578760 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50713)

(assert (=> b!1290800 (not (contains!8018 (+!4390 lt!578760 (tuple2!22079 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578758 () Unit!42623)

(assert (=> b!1290800 (= lt!578758 (addStillNotContains!366 lt!578760 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6028 (array!85493 array!85495 (_ BitVec 32) (_ BitVec 32) V!50713 V!50713 (_ BitVec 32) Int) ListLongMap!19743)

(assert (=> b!1290800 (= lt!578760 (getCurrentListMapNoExtraKeys!6028 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290801 () Bool)

(declare-fun res!857076 () Bool)

(assert (=> b!1290801 (=> (not res!857076) (not e!737087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85493 (_ BitVec 32)) Bool)

(assert (=> b!1290801 (= res!857076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290802 () Bool)

(declare-fun res!857078 () Bool)

(assert (=> b!1290802 (=> (not res!857078) (not e!737087))))

(assert (=> b!1290802 (= res!857078 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41794 _keys!1741))))))

(declare-fun b!1290803 () Bool)

(declare-fun res!857079 () Bool)

(assert (=> b!1290803 (=> (not res!857079) (not e!737087))))

(declare-fun getCurrentListMap!4932 (array!85493 array!85495 (_ BitVec 32) (_ BitVec 32) V!50713 V!50713 (_ BitVec 32) Int) ListLongMap!19743)

(assert (=> b!1290803 (= res!857079 (contains!8018 (getCurrentListMap!4932 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290804 () Bool)

(declare-fun e!737086 () Bool)

(assert (=> b!1290804 (= e!737086 tp_is_empty!34207)))

(declare-fun b!1290805 () Bool)

(declare-fun res!857083 () Bool)

(assert (=> b!1290805 (=> (not res!857083) (not e!737087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290805 (= res!857083 (not (validKeyInArray!0 (select (arr!41243 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!52871 () Bool)

(assert (=> mapIsEmpty!52871 mapRes!52871))

(declare-fun mapNonEmpty!52871 () Bool)

(declare-fun tp!100820 () Bool)

(assert (=> mapNonEmpty!52871 (= mapRes!52871 (and tp!100820 e!737086))))

(declare-fun mapKey!52871 () (_ BitVec 32))

(declare-fun mapValue!52871 () ValueCell!16205)

(declare-fun mapRest!52871 () (Array (_ BitVec 32) ValueCell!16205))

(assert (=> mapNonEmpty!52871 (= (arr!41244 _values!1445) (store mapRest!52871 mapKey!52871 mapValue!52871))))

(assert (= (and start!109302 res!857077) b!1290799))

(assert (= (and b!1290799 res!857081) b!1290801))

(assert (= (and b!1290801 res!857076) b!1290798))

(assert (= (and b!1290798 res!857080) b!1290802))

(assert (= (and b!1290802 res!857078) b!1290803))

(assert (= (and b!1290803 res!857079) b!1290794))

(assert (= (and b!1290794 res!857082) b!1290805))

(assert (= (and b!1290805 res!857083) b!1290796))

(assert (= (and b!1290796 (not res!857075)) b!1290800))

(assert (= (and b!1290797 condMapEmpty!52871) mapIsEmpty!52871))

(assert (= (and b!1290797 (not condMapEmpty!52871)) mapNonEmpty!52871))

(get-info :version)

(assert (= (and mapNonEmpty!52871 ((_ is ValueCellFull!16205) mapValue!52871)) b!1290804))

(assert (= (and b!1290797 ((_ is ValueCellFull!16205) mapDefault!52871)) b!1290795))

(assert (= start!109302 b!1290797))

(declare-fun m!1183629 () Bool)

(assert (=> b!1290805 m!1183629))

(assert (=> b!1290805 m!1183629))

(declare-fun m!1183631 () Bool)

(assert (=> b!1290805 m!1183631))

(declare-fun m!1183633 () Bool)

(assert (=> b!1290796 m!1183633))

(declare-fun m!1183635 () Bool)

(assert (=> b!1290796 m!1183635))

(declare-fun m!1183637 () Bool)

(assert (=> start!109302 m!1183637))

(declare-fun m!1183639 () Bool)

(assert (=> start!109302 m!1183639))

(declare-fun m!1183641 () Bool)

(assert (=> start!109302 m!1183641))

(declare-fun m!1183643 () Bool)

(assert (=> b!1290798 m!1183643))

(declare-fun m!1183645 () Bool)

(assert (=> b!1290801 m!1183645))

(declare-fun m!1183647 () Bool)

(assert (=> mapNonEmpty!52871 m!1183647))

(declare-fun m!1183649 () Bool)

(assert (=> b!1290803 m!1183649))

(assert (=> b!1290803 m!1183649))

(declare-fun m!1183651 () Bool)

(assert (=> b!1290803 m!1183651))

(declare-fun m!1183653 () Bool)

(assert (=> b!1290800 m!1183653))

(declare-fun m!1183655 () Bool)

(assert (=> b!1290800 m!1183655))

(declare-fun m!1183657 () Bool)

(assert (=> b!1290800 m!1183657))

(declare-fun m!1183659 () Bool)

(assert (=> b!1290800 m!1183659))

(assert (=> b!1290800 m!1183653))

(declare-fun m!1183661 () Bool)

(assert (=> b!1290800 m!1183661))

(assert (=> b!1290800 m!1183659))

(declare-fun m!1183663 () Bool)

(assert (=> b!1290800 m!1183663))

(declare-fun m!1183665 () Bool)

(assert (=> b!1290800 m!1183665))

(check-sat (not b!1290803) (not start!109302) (not b!1290800) b_and!46659 (not b!1290796) (not b!1290798) (not b!1290805) (not b_next!28567) (not mapNonEmpty!52871) tp_is_empty!34207 (not b!1290801))
(check-sat b_and!46659 (not b_next!28567))
