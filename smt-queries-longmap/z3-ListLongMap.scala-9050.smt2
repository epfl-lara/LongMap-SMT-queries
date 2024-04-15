; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109084 () Bool)

(assert start!109084)

(declare-fun b_free!28573 () Bool)

(declare-fun b_next!28573 () Bool)

(assert (=> start!109084 (= b_free!28573 (not b_next!28573))))

(declare-fun tp!100838 () Bool)

(declare-fun b_and!46645 () Bool)

(assert (=> start!109084 (= tp!100838 b_and!46645)))

(declare-fun b!1289533 () Bool)

(declare-fun res!856614 () Bool)

(declare-fun e!736265 () Bool)

(assert (=> b!1289533 (=> (not res!856614) (not e!736265))))

(declare-datatypes ((array!85355 0))(
  ( (array!85356 (arr!41179 (Array (_ BitVec 32) (_ BitVec 64))) (size!41731 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85355)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289533 (= res!856614 (not (validKeyInArray!0 (select (arr!41179 _keys!1741) from!2144))))))

(declare-fun b!1289534 () Bool)

(declare-fun e!736267 () Bool)

(declare-fun e!736266 () Bool)

(declare-fun mapRes!52880 () Bool)

(assert (=> b!1289534 (= e!736267 (and e!736266 mapRes!52880))))

(declare-fun condMapEmpty!52880 () Bool)

(declare-datatypes ((V!50721 0))(
  ( (V!50722 (val!17181 Int)) )
))
(declare-datatypes ((ValueCell!16208 0))(
  ( (ValueCellFull!16208 (v!19783 V!50721)) (EmptyCell!16208) )
))
(declare-datatypes ((array!85357 0))(
  ( (array!85358 (arr!41180 (Array (_ BitVec 32) ValueCell!16208)) (size!41732 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85357)

(declare-fun mapDefault!52880 () ValueCell!16208)

(assert (=> b!1289534 (= condMapEmpty!52880 (= (arr!41180 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16208)) mapDefault!52880)))))

(declare-fun b!1289535 () Bool)

(declare-fun res!856610 () Bool)

(assert (=> b!1289535 (=> (not res!856610) (not e!736265))))

(declare-fun minValue!1387 () V!50721)

(declare-fun zeroValue!1387 () V!50721)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22118 0))(
  ( (tuple2!22119 (_1!11070 (_ BitVec 64)) (_2!11070 V!50721)) )
))
(declare-datatypes ((List!29281 0))(
  ( (Nil!29278) (Cons!29277 (h!30486 tuple2!22118) (t!42837 List!29281)) )
))
(declare-datatypes ((ListLongMap!19775 0))(
  ( (ListLongMap!19776 (toList!9903 List!29281)) )
))
(declare-fun contains!7951 (ListLongMap!19775 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4854 (array!85355 array!85357 (_ BitVec 32) (_ BitVec 32) V!50721 V!50721 (_ BitVec 32) Int) ListLongMap!19775)

(assert (=> b!1289535 (= res!856610 (contains!7951 (getCurrentListMap!4854 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289536 () Bool)

(declare-fun res!856617 () Bool)

(assert (=> b!1289536 (=> (not res!856617) (not e!736265))))

(assert (=> b!1289536 (= res!856617 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41731 _keys!1741))))))

(declare-fun mapNonEmpty!52880 () Bool)

(declare-fun tp!100839 () Bool)

(declare-fun e!736268 () Bool)

(assert (=> mapNonEmpty!52880 (= mapRes!52880 (and tp!100839 e!736268))))

(declare-fun mapValue!52880 () ValueCell!16208)

(declare-fun mapKey!52880 () (_ BitVec 32))

(declare-fun mapRest!52880 () (Array (_ BitVec 32) ValueCell!16208))

(assert (=> mapNonEmpty!52880 (= (arr!41180 _values!1445) (store mapRest!52880 mapKey!52880 mapValue!52880))))

(declare-fun mapIsEmpty!52880 () Bool)

(assert (=> mapIsEmpty!52880 mapRes!52880))

(declare-fun b!1289537 () Bool)

(declare-fun tp_is_empty!34213 () Bool)

(assert (=> b!1289537 (= e!736268 tp_is_empty!34213)))

(declare-fun b!1289538 () Bool)

(declare-fun e!736264 () Bool)

(assert (=> b!1289538 (= e!736265 (not e!736264))))

(declare-fun res!856616 () Bool)

(assert (=> b!1289538 (=> res!856616 e!736264)))

(assert (=> b!1289538 (= res!856616 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289538 (not (contains!7951 (ListLongMap!19776 Nil!29278) k0!1205))))

(declare-datatypes ((Unit!42508 0))(
  ( (Unit!42509) )
))
(declare-fun lt!578131 () Unit!42508)

(declare-fun emptyContainsNothing!55 ((_ BitVec 64)) Unit!42508)

(assert (=> b!1289538 (= lt!578131 (emptyContainsNothing!55 k0!1205))))

(declare-fun b!1289539 () Bool)

(assert (=> b!1289539 (= e!736266 tp_is_empty!34213)))

(declare-fun res!856613 () Bool)

(assert (=> start!109084 (=> (not res!856613) (not e!736265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109084 (= res!856613 (validMask!0 mask!2175))))

(assert (=> start!109084 e!736265))

(assert (=> start!109084 tp_is_empty!34213))

(assert (=> start!109084 true))

(declare-fun array_inv!31375 (array!85357) Bool)

(assert (=> start!109084 (and (array_inv!31375 _values!1445) e!736267)))

(declare-fun array_inv!31376 (array!85355) Bool)

(assert (=> start!109084 (array_inv!31376 _keys!1741)))

(assert (=> start!109084 tp!100838))

(declare-fun b!1289540 () Bool)

(assert (=> b!1289540 (= e!736264 true)))

(declare-fun lt!578133 () ListLongMap!19775)

(declare-fun +!4387 (ListLongMap!19775 tuple2!22118) ListLongMap!19775)

(assert (=> b!1289540 (not (contains!7951 (+!4387 lt!578133 (tuple2!22119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578132 () Unit!42508)

(declare-fun addStillNotContains!364 (ListLongMap!19775 (_ BitVec 64) V!50721 (_ BitVec 64)) Unit!42508)

(assert (=> b!1289540 (= lt!578132 (addStillNotContains!364 lt!578133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1289540 (not (contains!7951 (+!4387 lt!578133 (tuple2!22119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578134 () Unit!42508)

(assert (=> b!1289540 (= lt!578134 (addStillNotContains!364 lt!578133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6018 (array!85355 array!85357 (_ BitVec 32) (_ BitVec 32) V!50721 V!50721 (_ BitVec 32) Int) ListLongMap!19775)

(assert (=> b!1289540 (= lt!578133 (getCurrentListMapNoExtraKeys!6018 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289541 () Bool)

(declare-fun res!856611 () Bool)

(assert (=> b!1289541 (=> (not res!856611) (not e!736265))))

(declare-datatypes ((List!29282 0))(
  ( (Nil!29279) (Cons!29278 (h!30487 (_ BitVec 64)) (t!42838 List!29282)) )
))
(declare-fun arrayNoDuplicates!0 (array!85355 (_ BitVec 32) List!29282) Bool)

(assert (=> b!1289541 (= res!856611 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29279))))

(declare-fun b!1289542 () Bool)

(declare-fun res!856612 () Bool)

(assert (=> b!1289542 (=> (not res!856612) (not e!736265))))

(assert (=> b!1289542 (= res!856612 (and (= (size!41732 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41731 _keys!1741) (size!41732 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289543 () Bool)

(declare-fun res!856609 () Bool)

(assert (=> b!1289543 (=> (not res!856609) (not e!736265))))

(assert (=> b!1289543 (= res!856609 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41731 _keys!1741))))))

(declare-fun b!1289544 () Bool)

(declare-fun res!856615 () Bool)

(assert (=> b!1289544 (=> (not res!856615) (not e!736265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85355 (_ BitVec 32)) Bool)

(assert (=> b!1289544 (= res!856615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109084 res!856613) b!1289542))

(assert (= (and b!1289542 res!856612) b!1289544))

(assert (= (and b!1289544 res!856615) b!1289541))

(assert (= (and b!1289541 res!856611) b!1289543))

(assert (= (and b!1289543 res!856609) b!1289535))

(assert (= (and b!1289535 res!856610) b!1289536))

(assert (= (and b!1289536 res!856617) b!1289533))

(assert (= (and b!1289533 res!856614) b!1289538))

(assert (= (and b!1289538 (not res!856616)) b!1289540))

(assert (= (and b!1289534 condMapEmpty!52880) mapIsEmpty!52880))

(assert (= (and b!1289534 (not condMapEmpty!52880)) mapNonEmpty!52880))

(get-info :version)

(assert (= (and mapNonEmpty!52880 ((_ is ValueCellFull!16208) mapValue!52880)) b!1289537))

(assert (= (and b!1289534 ((_ is ValueCellFull!16208) mapDefault!52880)) b!1289539))

(assert (= start!109084 b!1289534))

(declare-fun m!1181625 () Bool)

(assert (=> mapNonEmpty!52880 m!1181625))

(declare-fun m!1181627 () Bool)

(assert (=> start!109084 m!1181627))

(declare-fun m!1181629 () Bool)

(assert (=> start!109084 m!1181629))

(declare-fun m!1181631 () Bool)

(assert (=> start!109084 m!1181631))

(declare-fun m!1181633 () Bool)

(assert (=> b!1289540 m!1181633))

(declare-fun m!1181635 () Bool)

(assert (=> b!1289540 m!1181635))

(declare-fun m!1181637 () Bool)

(assert (=> b!1289540 m!1181637))

(declare-fun m!1181639 () Bool)

(assert (=> b!1289540 m!1181639))

(assert (=> b!1289540 m!1181635))

(assert (=> b!1289540 m!1181639))

(declare-fun m!1181641 () Bool)

(assert (=> b!1289540 m!1181641))

(declare-fun m!1181643 () Bool)

(assert (=> b!1289540 m!1181643))

(declare-fun m!1181645 () Bool)

(assert (=> b!1289540 m!1181645))

(declare-fun m!1181647 () Bool)

(assert (=> b!1289541 m!1181647))

(declare-fun m!1181649 () Bool)

(assert (=> b!1289535 m!1181649))

(assert (=> b!1289535 m!1181649))

(declare-fun m!1181651 () Bool)

(assert (=> b!1289535 m!1181651))

(declare-fun m!1181653 () Bool)

(assert (=> b!1289544 m!1181653))

(declare-fun m!1181655 () Bool)

(assert (=> b!1289533 m!1181655))

(assert (=> b!1289533 m!1181655))

(declare-fun m!1181657 () Bool)

(assert (=> b!1289533 m!1181657))

(declare-fun m!1181659 () Bool)

(assert (=> b!1289538 m!1181659))

(declare-fun m!1181661 () Bool)

(assert (=> b!1289538 m!1181661))

(check-sat (not b!1289540) b_and!46645 (not b!1289533) (not start!109084) (not b!1289544) (not b!1289541) (not b!1289538) (not mapNonEmpty!52880) (not b_next!28573) tp_is_empty!34213 (not b!1289535))
(check-sat b_and!46645 (not b_next!28573))
