; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108874 () Bool)

(assert start!108874)

(declare-fun b_free!28387 () Bool)

(declare-fun b_next!28387 () Bool)

(assert (=> start!108874 (= b_free!28387 (not b_next!28387))))

(declare-fun tp!100277 () Bool)

(declare-fun b_and!46435 () Bool)

(assert (=> start!108874 (= tp!100277 b_and!46435)))

(declare-fun b!1285746 () Bool)

(declare-fun res!854150 () Bool)

(declare-fun e!734433 () Bool)

(assert (=> b!1285746 (=> (not res!854150) (not e!734433))))

(declare-datatypes ((array!84997 0))(
  ( (array!84998 (arr!41001 (Array (_ BitVec 32) (_ BitVec 64))) (size!41553 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84997)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84997 (_ BitVec 32)) Bool)

(assert (=> b!1285746 (= res!854150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52598 () Bool)

(declare-fun mapRes!52598 () Bool)

(assert (=> mapIsEmpty!52598 mapRes!52598))

(declare-fun b!1285747 () Bool)

(declare-fun res!854152 () Bool)

(assert (=> b!1285747 (=> (not res!854152) (not e!734433))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1285747 (= res!854152 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41553 _keys!1741))))))

(declare-fun mapNonEmpty!52598 () Bool)

(declare-fun tp!100278 () Bool)

(declare-fun e!734436 () Bool)

(assert (=> mapNonEmpty!52598 (= mapRes!52598 (and tp!100278 e!734436))))

(declare-fun mapKey!52598 () (_ BitVec 32))

(declare-datatypes ((V!50473 0))(
  ( (V!50474 (val!17088 Int)) )
))
(declare-datatypes ((ValueCell!16115 0))(
  ( (ValueCellFull!16115 (v!19689 V!50473)) (EmptyCell!16115) )
))
(declare-fun mapValue!52598 () ValueCell!16115)

(declare-datatypes ((array!84999 0))(
  ( (array!85000 (arr!41002 (Array (_ BitVec 32) ValueCell!16115)) (size!41554 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84999)

(declare-fun mapRest!52598 () (Array (_ BitVec 32) ValueCell!16115))

(assert (=> mapNonEmpty!52598 (= (arr!41002 _values!1445) (store mapRest!52598 mapKey!52598 mapValue!52598))))

(declare-fun b!1285748 () Bool)

(declare-fun res!854149 () Bool)

(assert (=> b!1285748 (=> (not res!854149) (not e!734433))))

(assert (=> b!1285748 (= res!854149 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41553 _keys!1741))))))

(declare-fun b!1285749 () Bool)

(declare-fun res!854155 () Bool)

(assert (=> b!1285749 (=> (not res!854155) (not e!734433))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285749 (= res!854155 (and (= (size!41554 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41553 _keys!1741) (size!41554 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285750 () Bool)

(declare-fun res!854153 () Bool)

(assert (=> b!1285750 (=> (not res!854153) (not e!734433))))

(declare-fun minValue!1387 () V!50473)

(declare-fun zeroValue!1387 () V!50473)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21972 0))(
  ( (tuple2!21973 (_1!10997 (_ BitVec 64)) (_2!10997 V!50473)) )
))
(declare-datatypes ((List!29148 0))(
  ( (Nil!29145) (Cons!29144 (h!30353 tuple2!21972) (t!42684 List!29148)) )
))
(declare-datatypes ((ListLongMap!19629 0))(
  ( (ListLongMap!19630 (toList!9830 List!29148)) )
))
(declare-fun contains!7877 (ListLongMap!19629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4800 (array!84997 array!84999 (_ BitVec 32) (_ BitVec 32) V!50473 V!50473 (_ BitVec 32) Int) ListLongMap!19629)

(assert (=> b!1285750 (= res!854153 (contains!7877 (getCurrentListMap!4800 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285752 () Bool)

(assert (=> b!1285752 (= e!734433 false)))

(declare-fun lt!576771 () Bool)

(declare-fun +!4345 (ListLongMap!19629 tuple2!21972) ListLongMap!19629)

(declare-fun getCurrentListMapNoExtraKeys!5976 (array!84997 array!84999 (_ BitVec 32) (_ BitVec 32) V!50473 V!50473 (_ BitVec 32) Int) ListLongMap!19629)

(assert (=> b!1285752 (= lt!576771 (contains!7877 (+!4345 (getCurrentListMapNoExtraKeys!5976 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21973 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1285753 () Bool)

(declare-fun e!734435 () Bool)

(declare-fun e!734432 () Bool)

(assert (=> b!1285753 (= e!734435 (and e!734432 mapRes!52598))))

(declare-fun condMapEmpty!52598 () Bool)

(declare-fun mapDefault!52598 () ValueCell!16115)

(assert (=> b!1285753 (= condMapEmpty!52598 (= (arr!41002 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16115)) mapDefault!52598)))))

(declare-fun b!1285751 () Bool)

(declare-fun res!854157 () Bool)

(assert (=> b!1285751 (=> (not res!854157) (not e!734433))))

(declare-datatypes ((List!29149 0))(
  ( (Nil!29146) (Cons!29145 (h!30354 (_ BitVec 64)) (t!42685 List!29149)) )
))
(declare-fun arrayNoDuplicates!0 (array!84997 (_ BitVec 32) List!29149) Bool)

(assert (=> b!1285751 (= res!854157 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29146))))

(declare-fun res!854151 () Bool)

(assert (=> start!108874 (=> (not res!854151) (not e!734433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108874 (= res!854151 (validMask!0 mask!2175))))

(assert (=> start!108874 e!734433))

(declare-fun tp_is_empty!34027 () Bool)

(assert (=> start!108874 tp_is_empty!34027))

(assert (=> start!108874 true))

(declare-fun array_inv!31255 (array!84999) Bool)

(assert (=> start!108874 (and (array_inv!31255 _values!1445) e!734435)))

(declare-fun array_inv!31256 (array!84997) Bool)

(assert (=> start!108874 (array_inv!31256 _keys!1741)))

(assert (=> start!108874 tp!100277))

(declare-fun b!1285754 () Bool)

(assert (=> b!1285754 (= e!734436 tp_is_empty!34027)))

(declare-fun b!1285755 () Bool)

(declare-fun res!854156 () Bool)

(assert (=> b!1285755 (=> (not res!854156) (not e!734433))))

(assert (=> b!1285755 (= res!854156 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1285756 () Bool)

(declare-fun res!854154 () Bool)

(assert (=> b!1285756 (=> (not res!854154) (not e!734433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285756 (= res!854154 (validKeyInArray!0 (select (arr!41001 _keys!1741) from!2144)))))

(declare-fun b!1285757 () Bool)

(assert (=> b!1285757 (= e!734432 tp_is_empty!34027)))

(assert (= (and start!108874 res!854151) b!1285749))

(assert (= (and b!1285749 res!854155) b!1285746))

(assert (= (and b!1285746 res!854150) b!1285751))

(assert (= (and b!1285751 res!854157) b!1285748))

(assert (= (and b!1285748 res!854149) b!1285750))

(assert (= (and b!1285750 res!854153) b!1285747))

(assert (= (and b!1285747 res!854152) b!1285756))

(assert (= (and b!1285756 res!854154) b!1285755))

(assert (= (and b!1285755 res!854156) b!1285752))

(assert (= (and b!1285753 condMapEmpty!52598) mapIsEmpty!52598))

(assert (= (and b!1285753 (not condMapEmpty!52598)) mapNonEmpty!52598))

(get-info :version)

(assert (= (and mapNonEmpty!52598 ((_ is ValueCellFull!16115) mapValue!52598)) b!1285754))

(assert (= (and b!1285753 ((_ is ValueCellFull!16115) mapDefault!52598)) b!1285757))

(assert (= start!108874 b!1285753))

(declare-fun m!1178533 () Bool)

(assert (=> b!1285756 m!1178533))

(assert (=> b!1285756 m!1178533))

(declare-fun m!1178535 () Bool)

(assert (=> b!1285756 m!1178535))

(declare-fun m!1178537 () Bool)

(assert (=> b!1285750 m!1178537))

(assert (=> b!1285750 m!1178537))

(declare-fun m!1178539 () Bool)

(assert (=> b!1285750 m!1178539))

(declare-fun m!1178541 () Bool)

(assert (=> b!1285746 m!1178541))

(declare-fun m!1178543 () Bool)

(assert (=> mapNonEmpty!52598 m!1178543))

(declare-fun m!1178545 () Bool)

(assert (=> start!108874 m!1178545))

(declare-fun m!1178547 () Bool)

(assert (=> start!108874 m!1178547))

(declare-fun m!1178549 () Bool)

(assert (=> start!108874 m!1178549))

(declare-fun m!1178551 () Bool)

(assert (=> b!1285752 m!1178551))

(assert (=> b!1285752 m!1178551))

(declare-fun m!1178553 () Bool)

(assert (=> b!1285752 m!1178553))

(assert (=> b!1285752 m!1178553))

(declare-fun m!1178555 () Bool)

(assert (=> b!1285752 m!1178555))

(declare-fun m!1178557 () Bool)

(assert (=> b!1285751 m!1178557))

(check-sat (not b!1285746) (not start!108874) (not b!1285751) (not b!1285752) b_and!46435 (not mapNonEmpty!52598) (not b!1285750) tp_is_empty!34027 (not b!1285756) (not b_next!28387))
(check-sat b_and!46435 (not b_next!28387))
