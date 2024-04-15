; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109258 () Bool)

(assert start!109258)

(declare-fun b_free!28747 () Bool)

(declare-fun b_next!28747 () Bool)

(assert (=> start!109258 (= b_free!28747 (not b_next!28747))))

(declare-fun tp!101361 () Bool)

(declare-fun b_and!46819 () Bool)

(assert (=> start!109258 (= tp!101361 b_and!46819)))

(declare-fun b!1292584 () Bool)

(declare-fun e!737753 () Bool)

(declare-fun e!737750 () Bool)

(assert (=> b!1292584 (= e!737753 (not e!737750))))

(declare-fun res!858878 () Bool)

(assert (=> b!1292584 (=> res!858878 e!737750)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292584 (= res!858878 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50953 0))(
  ( (V!50954 (val!17268 Int)) )
))
(declare-datatypes ((tuple2!22256 0))(
  ( (tuple2!22257 (_1!11139 (_ BitVec 64)) (_2!11139 V!50953)) )
))
(declare-datatypes ((List!29406 0))(
  ( (Nil!29403) (Cons!29402 (h!30611 tuple2!22256) (t!42962 List!29406)) )
))
(declare-datatypes ((ListLongMap!19913 0))(
  ( (ListLongMap!19914 (toList!9972 List!29406)) )
))
(declare-fun contains!8020 (ListLongMap!19913 (_ BitVec 64)) Bool)

(assert (=> b!1292584 (not (contains!8020 (ListLongMap!19914 Nil!29403) k0!1205))))

(declare-datatypes ((Unit!42624 0))(
  ( (Unit!42625) )
))
(declare-fun lt!579180 () Unit!42624)

(declare-fun emptyContainsNothing!109 ((_ BitVec 64)) Unit!42624)

(assert (=> b!1292584 (= lt!579180 (emptyContainsNothing!109 k0!1205))))

(declare-fun mapIsEmpty!53141 () Bool)

(declare-fun mapRes!53141 () Bool)

(assert (=> mapIsEmpty!53141 mapRes!53141))

(declare-fun b!1292585 () Bool)

(declare-fun res!858883 () Bool)

(assert (=> b!1292585 (=> (not res!858883) (not e!737753))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16295 0))(
  ( (ValueCellFull!16295 (v!19870 V!50953)) (EmptyCell!16295) )
))
(declare-datatypes ((array!85691 0))(
  ( (array!85692 (arr!41347 (Array (_ BitVec 32) ValueCell!16295)) (size!41899 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85691)

(declare-datatypes ((array!85693 0))(
  ( (array!85694 (arr!41348 (Array (_ BitVec 32) (_ BitVec 64))) (size!41900 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85693)

(assert (=> b!1292585 (= res!858883 (and (= (size!41899 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41900 _keys!1741) (size!41899 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292586 () Bool)

(declare-fun res!858881 () Bool)

(assert (=> b!1292586 (=> (not res!858881) (not e!737753))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1292586 (= res!858881 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41900 _keys!1741))))))

(declare-fun b!1292587 () Bool)

(declare-fun e!737752 () Bool)

(declare-fun tp_is_empty!34387 () Bool)

(assert (=> b!1292587 (= e!737752 tp_is_empty!34387)))

(declare-fun mapNonEmpty!53141 () Bool)

(declare-fun tp!101360 () Bool)

(declare-fun e!737749 () Bool)

(assert (=> mapNonEmpty!53141 (= mapRes!53141 (and tp!101360 e!737749))))

(declare-fun mapKey!53141 () (_ BitVec 32))

(declare-fun mapValue!53141 () ValueCell!16295)

(declare-fun mapRest!53141 () (Array (_ BitVec 32) ValueCell!16295))

(assert (=> mapNonEmpty!53141 (= (arr!41347 _values!1445) (store mapRest!53141 mapKey!53141 mapValue!53141))))

(declare-fun b!1292588 () Bool)

(declare-fun res!858884 () Bool)

(assert (=> b!1292588 (=> (not res!858884) (not e!737753))))

(declare-datatypes ((List!29407 0))(
  ( (Nil!29404) (Cons!29403 (h!30612 (_ BitVec 64)) (t!42963 List!29407)) )
))
(declare-fun arrayNoDuplicates!0 (array!85693 (_ BitVec 32) List!29407) Bool)

(assert (=> b!1292588 (= res!858884 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29404))))

(declare-fun b!1292589 () Bool)

(declare-fun res!858877 () Bool)

(assert (=> b!1292589 (=> (not res!858877) (not e!737753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85693 (_ BitVec 32)) Bool)

(assert (=> b!1292589 (= res!858877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292590 () Bool)

(declare-fun res!858885 () Bool)

(assert (=> b!1292590 (=> (not res!858885) (not e!737753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292590 (= res!858885 (not (validKeyInArray!0 (select (arr!41348 _keys!1741) from!2144))))))

(declare-fun b!1292591 () Bool)

(declare-fun res!858882 () Bool)

(assert (=> b!1292591 (=> (not res!858882) (not e!737753))))

(assert (=> b!1292591 (= res!858882 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41900 _keys!1741))))))

(declare-fun res!858880 () Bool)

(assert (=> start!109258 (=> (not res!858880) (not e!737753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109258 (= res!858880 (validMask!0 mask!2175))))

(assert (=> start!109258 e!737753))

(assert (=> start!109258 tp_is_empty!34387))

(assert (=> start!109258 true))

(declare-fun e!737754 () Bool)

(declare-fun array_inv!31487 (array!85691) Bool)

(assert (=> start!109258 (and (array_inv!31487 _values!1445) e!737754)))

(declare-fun array_inv!31488 (array!85693) Bool)

(assert (=> start!109258 (array_inv!31488 _keys!1741)))

(assert (=> start!109258 tp!101361))

(declare-fun b!1292592 () Bool)

(assert (=> b!1292592 (= e!737749 tp_is_empty!34387)))

(declare-fun b!1292593 () Bool)

(assert (=> b!1292593 (= e!737754 (and e!737752 mapRes!53141))))

(declare-fun condMapEmpty!53141 () Bool)

(declare-fun mapDefault!53141 () ValueCell!16295)

(assert (=> b!1292593 (= condMapEmpty!53141 (= (arr!41347 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16295)) mapDefault!53141)))))

(declare-fun b!1292594 () Bool)

(declare-fun res!858879 () Bool)

(assert (=> b!1292594 (=> (not res!858879) (not e!737753))))

(declare-fun minValue!1387 () V!50953)

(declare-fun zeroValue!1387 () V!50953)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4914 (array!85693 array!85691 (_ BitVec 32) (_ BitVec 32) V!50953 V!50953 (_ BitVec 32) Int) ListLongMap!19913)

(assert (=> b!1292594 (= res!858879 (contains!8020 (getCurrentListMap!4914 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292595 () Bool)

(assert (=> b!1292595 (= e!737750 true)))

(declare-fun lt!579181 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6055 (array!85693 array!85691 (_ BitVec 32) (_ BitVec 32) V!50953 V!50953 (_ BitVec 32) Int) ListLongMap!19913)

(assert (=> b!1292595 (= lt!579181 (contains!8020 (getCurrentListMapNoExtraKeys!6055 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109258 res!858880) b!1292585))

(assert (= (and b!1292585 res!858883) b!1292589))

(assert (= (and b!1292589 res!858877) b!1292588))

(assert (= (and b!1292588 res!858884) b!1292586))

(assert (= (and b!1292586 res!858881) b!1292594))

(assert (= (and b!1292594 res!858879) b!1292591))

(assert (= (and b!1292591 res!858882) b!1292590))

(assert (= (and b!1292590 res!858885) b!1292584))

(assert (= (and b!1292584 (not res!858878)) b!1292595))

(assert (= (and b!1292593 condMapEmpty!53141) mapIsEmpty!53141))

(assert (= (and b!1292593 (not condMapEmpty!53141)) mapNonEmpty!53141))

(get-info :version)

(assert (= (and mapNonEmpty!53141 ((_ is ValueCellFull!16295) mapValue!53141)) b!1292592))

(assert (= (and b!1292593 ((_ is ValueCellFull!16295) mapDefault!53141)) b!1292587))

(assert (= start!109258 b!1292593))

(declare-fun m!1184643 () Bool)

(assert (=> b!1292594 m!1184643))

(assert (=> b!1292594 m!1184643))

(declare-fun m!1184645 () Bool)

(assert (=> b!1292594 m!1184645))

(declare-fun m!1184647 () Bool)

(assert (=> b!1292584 m!1184647))

(declare-fun m!1184649 () Bool)

(assert (=> b!1292584 m!1184649))

(declare-fun m!1184651 () Bool)

(assert (=> b!1292595 m!1184651))

(assert (=> b!1292595 m!1184651))

(declare-fun m!1184653 () Bool)

(assert (=> b!1292595 m!1184653))

(declare-fun m!1184655 () Bool)

(assert (=> b!1292588 m!1184655))

(declare-fun m!1184657 () Bool)

(assert (=> mapNonEmpty!53141 m!1184657))

(declare-fun m!1184659 () Bool)

(assert (=> b!1292590 m!1184659))

(assert (=> b!1292590 m!1184659))

(declare-fun m!1184661 () Bool)

(assert (=> b!1292590 m!1184661))

(declare-fun m!1184663 () Bool)

(assert (=> start!109258 m!1184663))

(declare-fun m!1184665 () Bool)

(assert (=> start!109258 m!1184665))

(declare-fun m!1184667 () Bool)

(assert (=> start!109258 m!1184667))

(declare-fun m!1184669 () Bool)

(assert (=> b!1292589 m!1184669))

(check-sat (not b!1292589) (not mapNonEmpty!53141) (not b!1292595) (not b!1292594) (not b_next!28747) (not b!1292590) (not b!1292584) (not b!1292588) b_and!46819 tp_is_empty!34387 (not start!109258))
(check-sat b_and!46819 (not b_next!28747))
