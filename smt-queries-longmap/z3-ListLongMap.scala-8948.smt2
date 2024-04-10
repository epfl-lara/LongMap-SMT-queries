; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108416 () Bool)

(assert start!108416)

(declare-fun b_free!27963 () Bool)

(declare-fun b_next!27963 () Bool)

(assert (=> start!108416 (= b_free!27963 (not b_next!27963))))

(declare-fun tp!98998 () Bool)

(declare-fun b_and!46023 () Bool)

(assert (=> start!108416 (= tp!98998 b_and!46023)))

(declare-fun b!1279560 () Bool)

(declare-fun e!731088 () Bool)

(assert (=> b!1279560 (= e!731088 false)))

(declare-datatypes ((V!49907 0))(
  ( (V!49908 (val!16876 Int)) )
))
(declare-fun minValue!1387 () V!49907)

(declare-fun zeroValue!1387 () V!49907)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576026 () Bool)

(declare-datatypes ((ValueCell!15903 0))(
  ( (ValueCellFull!15903 (v!19476 V!49907)) (EmptyCell!15903) )
))
(declare-datatypes ((array!84292 0))(
  ( (array!84293 (arr!40650 (Array (_ BitVec 32) ValueCell!15903)) (size!41200 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84292)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84294 0))(
  ( (array!84295 (arr!40651 (Array (_ BitVec 32) (_ BitVec 64))) (size!41201 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84294)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21592 0))(
  ( (tuple2!21593 (_1!10807 (_ BitVec 64)) (_2!10807 V!49907)) )
))
(declare-datatypes ((List!28792 0))(
  ( (Nil!28789) (Cons!28788 (h!29997 tuple2!21592) (t!42332 List!28792)) )
))
(declare-datatypes ((ListLongMap!19249 0))(
  ( (ListLongMap!19250 (toList!9640 List!28792)) )
))
(declare-fun contains!7755 (ListLongMap!19249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4724 (array!84294 array!84292 (_ BitVec 32) (_ BitVec 32) V!49907 V!49907 (_ BitVec 32) Int) ListLongMap!19249)

(assert (=> b!1279560 (= lt!576026 (contains!7755 (getCurrentListMap!4724 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279561 () Bool)

(declare-fun res!849982 () Bool)

(assert (=> b!1279561 (=> (not res!849982) (not e!731088))))

(assert (=> b!1279561 (= res!849982 (and (= (size!41200 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41201 _keys!1741) (size!41200 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!849986 () Bool)

(assert (=> start!108416 (=> (not res!849986) (not e!731088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108416 (= res!849986 (validMask!0 mask!2175))))

(assert (=> start!108416 e!731088))

(declare-fun tp_is_empty!33603 () Bool)

(assert (=> start!108416 tp_is_empty!33603))

(assert (=> start!108416 true))

(declare-fun e!731090 () Bool)

(declare-fun array_inv!30861 (array!84292) Bool)

(assert (=> start!108416 (and (array_inv!30861 _values!1445) e!731090)))

(declare-fun array_inv!30862 (array!84294) Bool)

(assert (=> start!108416 (array_inv!30862 _keys!1741)))

(assert (=> start!108416 tp!98998))

(declare-fun mapNonEmpty!51956 () Bool)

(declare-fun mapRes!51956 () Bool)

(declare-fun tp!98999 () Bool)

(declare-fun e!731089 () Bool)

(assert (=> mapNonEmpty!51956 (= mapRes!51956 (and tp!98999 e!731089))))

(declare-fun mapValue!51956 () ValueCell!15903)

(declare-fun mapRest!51956 () (Array (_ BitVec 32) ValueCell!15903))

(declare-fun mapKey!51956 () (_ BitVec 32))

(assert (=> mapNonEmpty!51956 (= (arr!40650 _values!1445) (store mapRest!51956 mapKey!51956 mapValue!51956))))

(declare-fun b!1279562 () Bool)

(declare-fun e!731086 () Bool)

(assert (=> b!1279562 (= e!731090 (and e!731086 mapRes!51956))))

(declare-fun condMapEmpty!51956 () Bool)

(declare-fun mapDefault!51956 () ValueCell!15903)

(assert (=> b!1279562 (= condMapEmpty!51956 (= (arr!40650 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15903)) mapDefault!51956)))))

(declare-fun b!1279563 () Bool)

(declare-fun res!849985 () Bool)

(assert (=> b!1279563 (=> (not res!849985) (not e!731088))))

(assert (=> b!1279563 (= res!849985 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41201 _keys!1741))))))

(declare-fun b!1279564 () Bool)

(declare-fun res!849984 () Bool)

(assert (=> b!1279564 (=> (not res!849984) (not e!731088))))

(declare-datatypes ((List!28793 0))(
  ( (Nil!28790) (Cons!28789 (h!29998 (_ BitVec 64)) (t!42333 List!28793)) )
))
(declare-fun arrayNoDuplicates!0 (array!84294 (_ BitVec 32) List!28793) Bool)

(assert (=> b!1279564 (= res!849984 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28790))))

(declare-fun b!1279565 () Bool)

(assert (=> b!1279565 (= e!731089 tp_is_empty!33603)))

(declare-fun b!1279566 () Bool)

(assert (=> b!1279566 (= e!731086 tp_is_empty!33603)))

(declare-fun mapIsEmpty!51956 () Bool)

(assert (=> mapIsEmpty!51956 mapRes!51956))

(declare-fun b!1279567 () Bool)

(declare-fun res!849983 () Bool)

(assert (=> b!1279567 (=> (not res!849983) (not e!731088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84294 (_ BitVec 32)) Bool)

(assert (=> b!1279567 (= res!849983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108416 res!849986) b!1279561))

(assert (= (and b!1279561 res!849982) b!1279567))

(assert (= (and b!1279567 res!849983) b!1279564))

(assert (= (and b!1279564 res!849984) b!1279563))

(assert (= (and b!1279563 res!849985) b!1279560))

(assert (= (and b!1279562 condMapEmpty!51956) mapIsEmpty!51956))

(assert (= (and b!1279562 (not condMapEmpty!51956)) mapNonEmpty!51956))

(get-info :version)

(assert (= (and mapNonEmpty!51956 ((_ is ValueCellFull!15903) mapValue!51956)) b!1279565))

(assert (= (and b!1279562 ((_ is ValueCellFull!15903) mapDefault!51956)) b!1279566))

(assert (= start!108416 b!1279562))

(declare-fun m!1174485 () Bool)

(assert (=> b!1279560 m!1174485))

(assert (=> b!1279560 m!1174485))

(declare-fun m!1174487 () Bool)

(assert (=> b!1279560 m!1174487))

(declare-fun m!1174489 () Bool)

(assert (=> start!108416 m!1174489))

(declare-fun m!1174491 () Bool)

(assert (=> start!108416 m!1174491))

(declare-fun m!1174493 () Bool)

(assert (=> start!108416 m!1174493))

(declare-fun m!1174495 () Bool)

(assert (=> mapNonEmpty!51956 m!1174495))

(declare-fun m!1174497 () Bool)

(assert (=> b!1279564 m!1174497))

(declare-fun m!1174499 () Bool)

(assert (=> b!1279567 m!1174499))

(check-sat (not mapNonEmpty!51956) (not b!1279564) (not b_next!27963) tp_is_empty!33603 (not b!1279567) b_and!46023 (not start!108416) (not b!1279560))
(check-sat b_and!46023 (not b_next!27963))
