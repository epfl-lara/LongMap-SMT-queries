; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108864 () Bool)

(assert start!108864)

(declare-fun b_free!28377 () Bool)

(declare-fun b_next!28377 () Bool)

(assert (=> start!108864 (= b_free!28377 (not b_next!28377))))

(declare-fun tp!100246 () Bool)

(declare-fun b_and!46443 () Bool)

(assert (=> start!108864 (= tp!100246 b_and!46443)))

(declare-fun res!854066 () Bool)

(declare-fun e!734389 () Bool)

(assert (=> start!108864 (=> (not res!854066) (not e!734389))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108864 (= res!854066 (validMask!0 mask!2175))))

(assert (=> start!108864 e!734389))

(declare-fun tp_is_empty!34017 () Bool)

(assert (=> start!108864 tp_is_empty!34017))

(assert (=> start!108864 true))

(declare-datatypes ((V!50459 0))(
  ( (V!50460 (val!17083 Int)) )
))
(declare-datatypes ((ValueCell!16110 0))(
  ( (ValueCellFull!16110 (v!19685 V!50459)) (EmptyCell!16110) )
))
(declare-datatypes ((array!85088 0))(
  ( (array!85089 (arr!41046 (Array (_ BitVec 32) ValueCell!16110)) (size!41596 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85088)

(declare-fun e!734386 () Bool)

(declare-fun array_inv!31125 (array!85088) Bool)

(assert (=> start!108864 (and (array_inv!31125 _values!1445) e!734386)))

(declare-datatypes ((array!85090 0))(
  ( (array!85091 (arr!41047 (Array (_ BitVec 32) (_ BitVec 64))) (size!41597 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85090)

(declare-fun array_inv!31126 (array!85090) Bool)

(assert (=> start!108864 (array_inv!31126 _keys!1741)))

(assert (=> start!108864 tp!100246))

(declare-fun mapIsEmpty!52583 () Bool)

(declare-fun mapRes!52583 () Bool)

(assert (=> mapIsEmpty!52583 mapRes!52583))

(declare-fun b!1285655 () Bool)

(declare-fun res!854070 () Bool)

(assert (=> b!1285655 (=> (not res!854070) (not e!734389))))

(declare-datatypes ((List!29086 0))(
  ( (Nil!29083) (Cons!29082 (h!30291 (_ BitVec 64)) (t!42630 List!29086)) )
))
(declare-fun arrayNoDuplicates!0 (array!85090 (_ BitVec 32) List!29086) Bool)

(assert (=> b!1285655 (= res!854070 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29083))))

(declare-fun b!1285656 () Bool)

(declare-fun e!734388 () Bool)

(assert (=> b!1285656 (= e!734386 (and e!734388 mapRes!52583))))

(declare-fun condMapEmpty!52583 () Bool)

(declare-fun mapDefault!52583 () ValueCell!16110)

(assert (=> b!1285656 (= condMapEmpty!52583 (= (arr!41046 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16110)) mapDefault!52583)))))

(declare-fun b!1285657 () Bool)

(assert (=> b!1285657 (= e!734389 false)))

(declare-fun minValue!1387 () V!50459)

(declare-fun zeroValue!1387 () V!50459)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576943 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21898 0))(
  ( (tuple2!21899 (_1!10960 (_ BitVec 64)) (_2!10960 V!50459)) )
))
(declare-datatypes ((List!29087 0))(
  ( (Nil!29084) (Cons!29083 (h!30292 tuple2!21898) (t!42631 List!29087)) )
))
(declare-datatypes ((ListLongMap!19555 0))(
  ( (ListLongMap!19556 (toList!9793 List!29087)) )
))
(declare-fun contains!7910 (ListLongMap!19555 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4871 (array!85090 array!85088 (_ BitVec 32) (_ BitVec 32) V!50459 V!50459 (_ BitVec 32) Int) ListLongMap!19555)

(assert (=> b!1285657 (= lt!576943 (contains!7910 (getCurrentListMap!4871 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52583 () Bool)

(declare-fun tp!100247 () Bool)

(declare-fun e!734390 () Bool)

(assert (=> mapNonEmpty!52583 (= mapRes!52583 (and tp!100247 e!734390))))

(declare-fun mapKey!52583 () (_ BitVec 32))

(declare-fun mapValue!52583 () ValueCell!16110)

(declare-fun mapRest!52583 () (Array (_ BitVec 32) ValueCell!16110))

(assert (=> mapNonEmpty!52583 (= (arr!41046 _values!1445) (store mapRest!52583 mapKey!52583 mapValue!52583))))

(declare-fun b!1285658 () Bool)

(declare-fun res!854067 () Bool)

(assert (=> b!1285658 (=> (not res!854067) (not e!734389))))

(assert (=> b!1285658 (= res!854067 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41597 _keys!1741))))))

(declare-fun b!1285659 () Bool)

(assert (=> b!1285659 (= e!734388 tp_is_empty!34017)))

(declare-fun b!1285660 () Bool)

(declare-fun res!854068 () Bool)

(assert (=> b!1285660 (=> (not res!854068) (not e!734389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85090 (_ BitVec 32)) Bool)

(assert (=> b!1285660 (= res!854068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285661 () Bool)

(declare-fun res!854069 () Bool)

(assert (=> b!1285661 (=> (not res!854069) (not e!734389))))

(assert (=> b!1285661 (= res!854069 (and (= (size!41596 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41597 _keys!1741) (size!41596 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285662 () Bool)

(assert (=> b!1285662 (= e!734390 tp_is_empty!34017)))

(assert (= (and start!108864 res!854066) b!1285661))

(assert (= (and b!1285661 res!854069) b!1285660))

(assert (= (and b!1285660 res!854068) b!1285655))

(assert (= (and b!1285655 res!854070) b!1285658))

(assert (= (and b!1285658 res!854067) b!1285657))

(assert (= (and b!1285656 condMapEmpty!52583) mapIsEmpty!52583))

(assert (= (and b!1285656 (not condMapEmpty!52583)) mapNonEmpty!52583))

(get-info :version)

(assert (= (and mapNonEmpty!52583 ((_ is ValueCellFull!16110) mapValue!52583)) b!1285662))

(assert (= (and b!1285656 ((_ is ValueCellFull!16110) mapDefault!52583)) b!1285659))

(assert (= start!108864 b!1285656))

(declare-fun m!1178941 () Bool)

(assert (=> b!1285655 m!1178941))

(declare-fun m!1178943 () Bool)

(assert (=> b!1285657 m!1178943))

(assert (=> b!1285657 m!1178943))

(declare-fun m!1178945 () Bool)

(assert (=> b!1285657 m!1178945))

(declare-fun m!1178947 () Bool)

(assert (=> b!1285660 m!1178947))

(declare-fun m!1178949 () Bool)

(assert (=> start!108864 m!1178949))

(declare-fun m!1178951 () Bool)

(assert (=> start!108864 m!1178951))

(declare-fun m!1178953 () Bool)

(assert (=> start!108864 m!1178953))

(declare-fun m!1178955 () Bool)

(assert (=> mapNonEmpty!52583 m!1178955))

(check-sat (not mapNonEmpty!52583) (not b!1285655) (not b!1285660) b_and!46443 (not b!1285657) (not b_next!28377) tp_is_empty!34017 (not start!108864))
(check-sat b_and!46443 (not b_next!28377))
