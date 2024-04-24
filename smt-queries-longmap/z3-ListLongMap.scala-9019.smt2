; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109098 () Bool)

(assert start!109098)

(declare-fun b_free!28387 () Bool)

(declare-fun b_next!28387 () Bool)

(assert (=> start!109098 (= b_free!28387 (not b_next!28387))))

(declare-fun tp!100277 () Bool)

(declare-fun b_and!46455 () Bool)

(assert (=> start!109098 (= tp!100277 b_and!46455)))

(declare-fun b!1287115 () Bool)

(declare-fun res!854697 () Bool)

(declare-fun e!735308 () Bool)

(assert (=> b!1287115 (=> (not res!854697) (not e!735308))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287115 (= res!854697 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1287116 () Bool)

(declare-fun res!854702 () Bool)

(assert (=> b!1287116 (=> (not res!854702) (not e!735308))))

(declare-datatypes ((array!85139 0))(
  ( (array!85140 (arr!41067 (Array (_ BitVec 32) (_ BitVec 64))) (size!41618 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85139)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85139 (_ BitVec 32)) Bool)

(assert (=> b!1287116 (= res!854702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287117 () Bool)

(declare-fun res!854704 () Bool)

(assert (=> b!1287117 (=> (not res!854704) (not e!735308))))

(declare-datatypes ((V!50473 0))(
  ( (V!50474 (val!17088 Int)) )
))
(declare-fun zeroValue!1387 () V!50473)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16115 0))(
  ( (ValueCellFull!16115 (v!19685 V!50473)) (EmptyCell!16115) )
))
(declare-datatypes ((array!85141 0))(
  ( (array!85142 (arr!41068 (Array (_ BitVec 32) ValueCell!16115)) (size!41619 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85141)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun minValue!1387 () V!50473)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21924 0))(
  ( (tuple2!21925 (_1!10973 (_ BitVec 64)) (_2!10973 V!50473)) )
))
(declare-datatypes ((List!29125 0))(
  ( (Nil!29122) (Cons!29121 (h!30339 tuple2!21924) (t!42661 List!29125)) )
))
(declare-datatypes ((ListLongMap!19589 0))(
  ( (ListLongMap!19590 (toList!9810 List!29125)) )
))
(declare-fun contains!7941 (ListLongMap!19589 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4874 (array!85139 array!85141 (_ BitVec 32) (_ BitVec 32) V!50473 V!50473 (_ BitVec 32) Int) ListLongMap!19589)

(assert (=> b!1287117 (= res!854704 (contains!7941 (getCurrentListMap!4874 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287118 () Bool)

(declare-fun res!854699 () Bool)

(assert (=> b!1287118 (=> (not res!854699) (not e!735308))))

(declare-datatypes ((List!29126 0))(
  ( (Nil!29123) (Cons!29122 (h!30340 (_ BitVec 64)) (t!42662 List!29126)) )
))
(declare-fun arrayNoDuplicates!0 (array!85139 (_ BitVec 32) List!29126) Bool)

(assert (=> b!1287118 (= res!854699 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29123))))

(declare-fun b!1287119 () Bool)

(declare-fun e!735311 () Bool)

(declare-fun tp_is_empty!34027 () Bool)

(assert (=> b!1287119 (= e!735311 tp_is_empty!34027)))

(declare-fun b!1287120 () Bool)

(declare-fun e!735312 () Bool)

(assert (=> b!1287120 (= e!735312 tp_is_empty!34027)))

(declare-fun b!1287121 () Bool)

(declare-fun res!854701 () Bool)

(assert (=> b!1287121 (=> (not res!854701) (not e!735308))))

(assert (=> b!1287121 (= res!854701 (and (= (size!41619 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41618 _keys!1741) (size!41619 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287122 () Bool)

(declare-fun res!854696 () Bool)

(assert (=> b!1287122 (=> (not res!854696) (not e!735308))))

(assert (=> b!1287122 (= res!854696 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41618 _keys!1741))))))

(declare-fun res!854700 () Bool)

(assert (=> start!109098 (=> (not res!854700) (not e!735308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109098 (= res!854700 (validMask!0 mask!2175))))

(assert (=> start!109098 e!735308))

(assert (=> start!109098 tp_is_empty!34027))

(assert (=> start!109098 true))

(declare-fun e!735309 () Bool)

(declare-fun array_inv!31357 (array!85141) Bool)

(assert (=> start!109098 (and (array_inv!31357 _values!1445) e!735309)))

(declare-fun array_inv!31358 (array!85139) Bool)

(assert (=> start!109098 (array_inv!31358 _keys!1741)))

(assert (=> start!109098 tp!100277))

(declare-fun b!1287123 () Bool)

(declare-fun res!854703 () Bool)

(assert (=> b!1287123 (=> (not res!854703) (not e!735308))))

(assert (=> b!1287123 (= res!854703 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41618 _keys!1741))))))

(declare-fun mapIsEmpty!52598 () Bool)

(declare-fun mapRes!52598 () Bool)

(assert (=> mapIsEmpty!52598 mapRes!52598))

(declare-fun b!1287124 () Bool)

(declare-fun res!854698 () Bool)

(assert (=> b!1287124 (=> (not res!854698) (not e!735308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287124 (= res!854698 (validKeyInArray!0 (select (arr!41067 _keys!1741) from!2144)))))

(declare-fun b!1287125 () Bool)

(assert (=> b!1287125 (= e!735308 false)))

(declare-fun lt!577433 () Bool)

(declare-fun +!4352 (ListLongMap!19589 tuple2!21924) ListLongMap!19589)

(declare-fun getCurrentListMapNoExtraKeys!5984 (array!85139 array!85141 (_ BitVec 32) (_ BitVec 32) V!50473 V!50473 (_ BitVec 32) Int) ListLongMap!19589)

(assert (=> b!1287125 (= lt!577433 (contains!7941 (+!4352 (getCurrentListMapNoExtraKeys!5984 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21925 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1287126 () Bool)

(assert (=> b!1287126 (= e!735309 (and e!735312 mapRes!52598))))

(declare-fun condMapEmpty!52598 () Bool)

(declare-fun mapDefault!52598 () ValueCell!16115)

(assert (=> b!1287126 (= condMapEmpty!52598 (= (arr!41068 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16115)) mapDefault!52598)))))

(declare-fun mapNonEmpty!52598 () Bool)

(declare-fun tp!100276 () Bool)

(assert (=> mapNonEmpty!52598 (= mapRes!52598 (and tp!100276 e!735311))))

(declare-fun mapRest!52598 () (Array (_ BitVec 32) ValueCell!16115))

(declare-fun mapValue!52598 () ValueCell!16115)

(declare-fun mapKey!52598 () (_ BitVec 32))

(assert (=> mapNonEmpty!52598 (= (arr!41068 _values!1445) (store mapRest!52598 mapKey!52598 mapValue!52598))))

(assert (= (and start!109098 res!854700) b!1287121))

(assert (= (and b!1287121 res!854701) b!1287116))

(assert (= (and b!1287116 res!854702) b!1287118))

(assert (= (and b!1287118 res!854699) b!1287122))

(assert (= (and b!1287122 res!854696) b!1287117))

(assert (= (and b!1287117 res!854704) b!1287123))

(assert (= (and b!1287123 res!854703) b!1287124))

(assert (= (and b!1287124 res!854698) b!1287115))

(assert (= (and b!1287115 res!854697) b!1287125))

(assert (= (and b!1287126 condMapEmpty!52598) mapIsEmpty!52598))

(assert (= (and b!1287126 (not condMapEmpty!52598)) mapNonEmpty!52598))

(get-info :version)

(assert (= (and mapNonEmpty!52598 ((_ is ValueCellFull!16115) mapValue!52598)) b!1287119))

(assert (= (and b!1287126 ((_ is ValueCellFull!16115) mapDefault!52598)) b!1287120))

(assert (= start!109098 b!1287126))

(declare-fun m!1180645 () Bool)

(assert (=> b!1287125 m!1180645))

(assert (=> b!1287125 m!1180645))

(declare-fun m!1180647 () Bool)

(assert (=> b!1287125 m!1180647))

(assert (=> b!1287125 m!1180647))

(declare-fun m!1180649 () Bool)

(assert (=> b!1287125 m!1180649))

(declare-fun m!1180651 () Bool)

(assert (=> b!1287124 m!1180651))

(assert (=> b!1287124 m!1180651))

(declare-fun m!1180653 () Bool)

(assert (=> b!1287124 m!1180653))

(declare-fun m!1180655 () Bool)

(assert (=> mapNonEmpty!52598 m!1180655))

(declare-fun m!1180657 () Bool)

(assert (=> b!1287116 m!1180657))

(declare-fun m!1180659 () Bool)

(assert (=> b!1287117 m!1180659))

(assert (=> b!1287117 m!1180659))

(declare-fun m!1180661 () Bool)

(assert (=> b!1287117 m!1180661))

(declare-fun m!1180663 () Bool)

(assert (=> start!109098 m!1180663))

(declare-fun m!1180665 () Bool)

(assert (=> start!109098 m!1180665))

(declare-fun m!1180667 () Bool)

(assert (=> start!109098 m!1180667))

(declare-fun m!1180669 () Bool)

(assert (=> b!1287118 m!1180669))

(check-sat (not b!1287116) (not b!1287124) tp_is_empty!34027 b_and!46455 (not mapNonEmpty!52598) (not b_next!28387) (not start!109098) (not b!1287117) (not b!1287125) (not b!1287118))
(check-sat b_and!46455 (not b_next!28387))
