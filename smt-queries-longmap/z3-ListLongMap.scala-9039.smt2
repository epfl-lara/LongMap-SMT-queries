; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109242 () Bool)

(assert start!109242)

(declare-fun b_free!28507 () Bool)

(declare-fun b_next!28507 () Bool)

(assert (=> start!109242 (= b_free!28507 (not b_next!28507))))

(declare-fun tp!100639 () Bool)

(declare-fun b_and!46599 () Bool)

(assert (=> start!109242 (= tp!100639 b_and!46599)))

(declare-fun b!1289714 () Bool)

(declare-fun res!856272 () Bool)

(declare-fun e!736547 () Bool)

(assert (=> b!1289714 (=> (not res!856272) (not e!736547))))

(declare-datatypes ((array!85375 0))(
  ( (array!85376 (arr!41184 (Array (_ BitVec 32) (_ BitVec 64))) (size!41735 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85375)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289714 (= res!856272 (not (validKeyInArray!0 (select (arr!41184 _keys!1741) from!2144))))))

(declare-fun b!1289715 () Bool)

(declare-fun e!736550 () Bool)

(declare-fun tp_is_empty!34147 () Bool)

(assert (=> b!1289715 (= e!736550 tp_is_empty!34147)))

(declare-fun mapNonEmpty!52781 () Bool)

(declare-fun mapRes!52781 () Bool)

(declare-fun tp!100640 () Bool)

(declare-fun e!736549 () Bool)

(assert (=> mapNonEmpty!52781 (= mapRes!52781 (and tp!100640 e!736549))))

(declare-fun mapKey!52781 () (_ BitVec 32))

(declare-datatypes ((V!50633 0))(
  ( (V!50634 (val!17148 Int)) )
))
(declare-datatypes ((ValueCell!16175 0))(
  ( (ValueCellFull!16175 (v!19746 V!50633)) (EmptyCell!16175) )
))
(declare-datatypes ((array!85377 0))(
  ( (array!85378 (arr!41185 (Array (_ BitVec 32) ValueCell!16175)) (size!41736 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85377)

(declare-fun mapValue!52781 () ValueCell!16175)

(declare-fun mapRest!52781 () (Array (_ BitVec 32) ValueCell!16175))

(assert (=> mapNonEmpty!52781 (= (arr!41185 _values!1445) (store mapRest!52781 mapKey!52781 mapValue!52781))))

(declare-fun b!1289716 () Bool)

(declare-fun res!856266 () Bool)

(assert (=> b!1289716 (=> (not res!856266) (not e!736547))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85375 (_ BitVec 32)) Bool)

(assert (=> b!1289716 (= res!856266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!856271 () Bool)

(assert (=> start!109242 (=> (not res!856271) (not e!736547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109242 (= res!856271 (validMask!0 mask!2175))))

(assert (=> start!109242 e!736547))

(assert (=> start!109242 tp_is_empty!34147))

(assert (=> start!109242 true))

(declare-fun e!736546 () Bool)

(declare-fun array_inv!31435 (array!85377) Bool)

(assert (=> start!109242 (and (array_inv!31435 _values!1445) e!736546)))

(declare-fun array_inv!31436 (array!85375) Bool)

(assert (=> start!109242 (array_inv!31436 _keys!1741)))

(assert (=> start!109242 tp!100639))

(declare-fun b!1289717 () Bool)

(declare-fun res!856269 () Bool)

(assert (=> b!1289717 (=> (not res!856269) (not e!736547))))

(declare-fun minValue!1387 () V!50633)

(declare-fun zeroValue!1387 () V!50633)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22028 0))(
  ( (tuple2!22029 (_1!11025 (_ BitVec 64)) (_2!11025 V!50633)) )
))
(declare-datatypes ((List!29214 0))(
  ( (Nil!29211) (Cons!29210 (h!30428 tuple2!22028) (t!42770 List!29214)) )
))
(declare-datatypes ((ListLongMap!19693 0))(
  ( (ListLongMap!19694 (toList!9862 List!29214)) )
))
(declare-fun contains!7993 (ListLongMap!19693 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4912 (array!85375 array!85377 (_ BitVec 32) (_ BitVec 32) V!50633 V!50633 (_ BitVec 32) Int) ListLongMap!19693)

(assert (=> b!1289717 (= res!856269 (contains!7993 (getCurrentListMap!4912 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289718 () Bool)

(declare-fun e!736548 () Bool)

(assert (=> b!1289718 (= e!736547 (not e!736548))))

(declare-fun res!856270 () Bool)

(assert (=> b!1289718 (=> res!856270 e!736548)))

(assert (=> b!1289718 (= res!856270 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289718 (not (contains!7993 (ListLongMap!19694 Nil!29211) k0!1205))))

(declare-datatypes ((Unit!42573 0))(
  ( (Unit!42574) )
))
(declare-fun lt!578469 () Unit!42573)

(declare-fun emptyContainsNothing!40 ((_ BitVec 64)) Unit!42573)

(assert (=> b!1289718 (= lt!578469 (emptyContainsNothing!40 k0!1205))))

(declare-fun b!1289719 () Bool)

(declare-fun res!856273 () Bool)

(assert (=> b!1289719 (=> (not res!856273) (not e!736547))))

(assert (=> b!1289719 (= res!856273 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41735 _keys!1741))))))

(declare-fun b!1289720 () Bool)

(assert (=> b!1289720 (= e!736546 (and e!736550 mapRes!52781))))

(declare-fun condMapEmpty!52781 () Bool)

(declare-fun mapDefault!52781 () ValueCell!16175)

(assert (=> b!1289720 (= condMapEmpty!52781 (= (arr!41185 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16175)) mapDefault!52781)))))

(declare-fun b!1289721 () Bool)

(assert (=> b!1289721 (= e!736548 true)))

(declare-fun lt!578468 () ListLongMap!19693)

(declare-fun +!4369 (ListLongMap!19693 tuple2!22028) ListLongMap!19693)

(assert (=> b!1289721 (not (contains!7993 (+!4369 lt!578468 (tuple2!22029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578467 () Unit!42573)

(declare-fun addStillNotContains!345 (ListLongMap!19693 (_ BitVec 64) V!50633 (_ BitVec 64)) Unit!42573)

(assert (=> b!1289721 (= lt!578467 (addStillNotContains!345 lt!578468 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6007 (array!85375 array!85377 (_ BitVec 32) (_ BitVec 32) V!50633 V!50633 (_ BitVec 32) Int) ListLongMap!19693)

(assert (=> b!1289721 (= lt!578468 (getCurrentListMapNoExtraKeys!6007 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289722 () Bool)

(assert (=> b!1289722 (= e!736549 tp_is_empty!34147)))

(declare-fun b!1289723 () Bool)

(declare-fun res!856268 () Bool)

(assert (=> b!1289723 (=> (not res!856268) (not e!736547))))

(assert (=> b!1289723 (= res!856268 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41735 _keys!1741))))))

(declare-fun b!1289724 () Bool)

(declare-fun res!856265 () Bool)

(assert (=> b!1289724 (=> (not res!856265) (not e!736547))))

(assert (=> b!1289724 (= res!856265 (and (= (size!41736 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41735 _keys!1741) (size!41736 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52781 () Bool)

(assert (=> mapIsEmpty!52781 mapRes!52781))

(declare-fun b!1289725 () Bool)

(declare-fun res!856267 () Bool)

(assert (=> b!1289725 (=> (not res!856267) (not e!736547))))

(declare-datatypes ((List!29215 0))(
  ( (Nil!29212) (Cons!29211 (h!30429 (_ BitVec 64)) (t!42771 List!29215)) )
))
(declare-fun arrayNoDuplicates!0 (array!85375 (_ BitVec 32) List!29215) Bool)

(assert (=> b!1289725 (= res!856267 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29212))))

(assert (= (and start!109242 res!856271) b!1289724))

(assert (= (and b!1289724 res!856265) b!1289716))

(assert (= (and b!1289716 res!856266) b!1289725))

(assert (= (and b!1289725 res!856267) b!1289723))

(assert (= (and b!1289723 res!856268) b!1289717))

(assert (= (and b!1289717 res!856269) b!1289719))

(assert (= (and b!1289719 res!856273) b!1289714))

(assert (= (and b!1289714 res!856272) b!1289718))

(assert (= (and b!1289718 (not res!856270)) b!1289721))

(assert (= (and b!1289720 condMapEmpty!52781) mapIsEmpty!52781))

(assert (= (and b!1289720 (not condMapEmpty!52781)) mapNonEmpty!52781))

(get-info :version)

(assert (= (and mapNonEmpty!52781 ((_ is ValueCellFull!16175) mapValue!52781)) b!1289722))

(assert (= (and b!1289720 ((_ is ValueCellFull!16175) mapDefault!52781)) b!1289715))

(assert (= start!109242 b!1289720))

(declare-fun m!1182645 () Bool)

(assert (=> b!1289721 m!1182645))

(assert (=> b!1289721 m!1182645))

(declare-fun m!1182647 () Bool)

(assert (=> b!1289721 m!1182647))

(declare-fun m!1182649 () Bool)

(assert (=> b!1289721 m!1182649))

(declare-fun m!1182651 () Bool)

(assert (=> b!1289721 m!1182651))

(declare-fun m!1182653 () Bool)

(assert (=> b!1289725 m!1182653))

(declare-fun m!1182655 () Bool)

(assert (=> start!109242 m!1182655))

(declare-fun m!1182657 () Bool)

(assert (=> start!109242 m!1182657))

(declare-fun m!1182659 () Bool)

(assert (=> start!109242 m!1182659))

(declare-fun m!1182661 () Bool)

(assert (=> mapNonEmpty!52781 m!1182661))

(declare-fun m!1182663 () Bool)

(assert (=> b!1289714 m!1182663))

(assert (=> b!1289714 m!1182663))

(declare-fun m!1182665 () Bool)

(assert (=> b!1289714 m!1182665))

(declare-fun m!1182667 () Bool)

(assert (=> b!1289718 m!1182667))

(declare-fun m!1182669 () Bool)

(assert (=> b!1289718 m!1182669))

(declare-fun m!1182671 () Bool)

(assert (=> b!1289716 m!1182671))

(declare-fun m!1182673 () Bool)

(assert (=> b!1289717 m!1182673))

(assert (=> b!1289717 m!1182673))

(declare-fun m!1182675 () Bool)

(assert (=> b!1289717 m!1182675))

(check-sat (not b!1289721) (not b!1289716) (not start!109242) b_and!46599 (not mapNonEmpty!52781) (not b!1289714) tp_is_empty!34147 (not b!1289718) (not b_next!28507) (not b!1289717) (not b!1289725))
(check-sat b_and!46599 (not b_next!28507))
