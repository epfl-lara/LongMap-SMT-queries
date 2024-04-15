; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108958 () Bool)

(assert start!108958)

(declare-fun b_free!28447 () Bool)

(declare-fun b_next!28447 () Bool)

(assert (=> start!108958 (= b_free!28447 (not b_next!28447))))

(declare-fun tp!100460 () Bool)

(declare-fun b_and!46519 () Bool)

(assert (=> start!108958 (= tp!100460 b_and!46519)))

(declare-fun b!1287335 () Bool)

(declare-fun e!735200 () Bool)

(declare-fun e!735201 () Bool)

(declare-fun mapRes!52691 () Bool)

(assert (=> b!1287335 (= e!735200 (and e!735201 mapRes!52691))))

(declare-fun condMapEmpty!52691 () Bool)

(declare-datatypes ((V!50553 0))(
  ( (V!50554 (val!17118 Int)) )
))
(declare-datatypes ((ValueCell!16145 0))(
  ( (ValueCellFull!16145 (v!19720 V!50553)) (EmptyCell!16145) )
))
(declare-datatypes ((array!85115 0))(
  ( (array!85116 (arr!41059 (Array (_ BitVec 32) ValueCell!16145)) (size!41611 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85115)

(declare-fun mapDefault!52691 () ValueCell!16145)

(assert (=> b!1287335 (= condMapEmpty!52691 (= (arr!41059 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16145)) mapDefault!52691)))))

(declare-fun res!854985 () Bool)

(declare-fun e!735204 () Bool)

(assert (=> start!108958 (=> (not res!854985) (not e!735204))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108958 (= res!854985 (validMask!0 mask!2175))))

(assert (=> start!108958 e!735204))

(declare-fun tp_is_empty!34087 () Bool)

(assert (=> start!108958 tp_is_empty!34087))

(assert (=> start!108958 true))

(declare-fun array_inv!31291 (array!85115) Bool)

(assert (=> start!108958 (and (array_inv!31291 _values!1445) e!735200)))

(declare-datatypes ((array!85117 0))(
  ( (array!85118 (arr!41060 (Array (_ BitVec 32) (_ BitVec 64))) (size!41612 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85117)

(declare-fun array_inv!31292 (array!85117) Bool)

(assert (=> start!108958 (array_inv!31292 _keys!1741)))

(assert (=> start!108958 tp!100460))

(declare-fun b!1287336 () Bool)

(declare-fun res!854984 () Bool)

(assert (=> b!1287336 (=> (not res!854984) (not e!735204))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287336 (= res!854984 (and (= (size!41611 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41612 _keys!1741) (size!41611 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287337 () Bool)

(declare-fun res!854979 () Bool)

(assert (=> b!1287337 (=> (not res!854979) (not e!735204))))

(declare-fun minValue!1387 () V!50553)

(declare-fun zeroValue!1387 () V!50553)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22020 0))(
  ( (tuple2!22021 (_1!11021 (_ BitVec 64)) (_2!11021 V!50553)) )
))
(declare-datatypes ((List!29194 0))(
  ( (Nil!29191) (Cons!29190 (h!30399 tuple2!22020) (t!42750 List!29194)) )
))
(declare-datatypes ((ListLongMap!19677 0))(
  ( (ListLongMap!19678 (toList!9854 List!29194)) )
))
(declare-fun contains!7902 (ListLongMap!19677 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4818 (array!85117 array!85115 (_ BitVec 32) (_ BitVec 32) V!50553 V!50553 (_ BitVec 32) Int) ListLongMap!19677)

(assert (=> b!1287337 (= res!854979 (contains!7902 (getCurrentListMap!4818 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287338 () Bool)

(declare-fun res!854981 () Bool)

(assert (=> b!1287338 (=> (not res!854981) (not e!735204))))

(declare-datatypes ((List!29195 0))(
  ( (Nil!29192) (Cons!29191 (h!30400 (_ BitVec 64)) (t!42751 List!29195)) )
))
(declare-fun arrayNoDuplicates!0 (array!85117 (_ BitVec 32) List!29195) Bool)

(assert (=> b!1287338 (= res!854981 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29192))))

(declare-fun b!1287339 () Bool)

(assert (=> b!1287339 (= e!735201 tp_is_empty!34087)))

(declare-fun b!1287340 () Bool)

(declare-fun res!854982 () Bool)

(assert (=> b!1287340 (=> (not res!854982) (not e!735204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287340 (= res!854982 (not (validKeyInArray!0 (select (arr!41060 _keys!1741) from!2144))))))

(declare-fun b!1287341 () Bool)

(declare-fun res!854980 () Bool)

(assert (=> b!1287341 (=> (not res!854980) (not e!735204))))

(assert (=> b!1287341 (= res!854980 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41612 _keys!1741))))))

(declare-fun b!1287342 () Bool)

(declare-fun e!735202 () Bool)

(assert (=> b!1287342 (= e!735202 tp_is_empty!34087)))

(declare-fun b!1287343 () Bool)

(declare-fun res!854983 () Bool)

(assert (=> b!1287343 (=> (not res!854983) (not e!735204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85117 (_ BitVec 32)) Bool)

(assert (=> b!1287343 (= res!854983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52691 () Bool)

(declare-fun tp!100461 () Bool)

(assert (=> mapNonEmpty!52691 (= mapRes!52691 (and tp!100461 e!735202))))

(declare-fun mapRest!52691 () (Array (_ BitVec 32) ValueCell!16145))

(declare-fun mapValue!52691 () ValueCell!16145)

(declare-fun mapKey!52691 () (_ BitVec 32))

(assert (=> mapNonEmpty!52691 (= (arr!41059 _values!1445) (store mapRest!52691 mapKey!52691 mapValue!52691))))

(declare-fun b!1287344 () Bool)

(declare-fun res!854978 () Bool)

(assert (=> b!1287344 (=> (not res!854978) (not e!735204))))

(assert (=> b!1287344 (= res!854978 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41612 _keys!1741))))))

(declare-fun mapIsEmpty!52691 () Bool)

(assert (=> mapIsEmpty!52691 mapRes!52691))

(declare-fun b!1287345 () Bool)

(assert (=> b!1287345 (= e!735204 (not true))))

(assert (=> b!1287345 (not (contains!7902 (ListLongMap!19678 Nil!29191) k0!1205))))

(declare-datatypes ((Unit!42416 0))(
  ( (Unit!42417) )
))
(declare-fun lt!577684 () Unit!42416)

(declare-fun emptyContainsNothing!15 ((_ BitVec 64)) Unit!42416)

(assert (=> b!1287345 (= lt!577684 (emptyContainsNothing!15 k0!1205))))

(assert (= (and start!108958 res!854985) b!1287336))

(assert (= (and b!1287336 res!854984) b!1287343))

(assert (= (and b!1287343 res!854983) b!1287338))

(assert (= (and b!1287338 res!854981) b!1287344))

(assert (= (and b!1287344 res!854978) b!1287337))

(assert (= (and b!1287337 res!854979) b!1287341))

(assert (= (and b!1287341 res!854980) b!1287340))

(assert (= (and b!1287340 res!854982) b!1287345))

(assert (= (and b!1287335 condMapEmpty!52691) mapIsEmpty!52691))

(assert (= (and b!1287335 (not condMapEmpty!52691)) mapNonEmpty!52691))

(get-info :version)

(assert (= (and mapNonEmpty!52691 ((_ is ValueCellFull!16145) mapValue!52691)) b!1287342))

(assert (= (and b!1287335 ((_ is ValueCellFull!16145) mapDefault!52691)) b!1287339))

(assert (= start!108958 b!1287335))

(declare-fun m!1179771 () Bool)

(assert (=> b!1287338 m!1179771))

(declare-fun m!1179773 () Bool)

(assert (=> b!1287343 m!1179773))

(declare-fun m!1179775 () Bool)

(assert (=> b!1287337 m!1179775))

(assert (=> b!1287337 m!1179775))

(declare-fun m!1179777 () Bool)

(assert (=> b!1287337 m!1179777))

(declare-fun m!1179779 () Bool)

(assert (=> mapNonEmpty!52691 m!1179779))

(declare-fun m!1179781 () Bool)

(assert (=> b!1287345 m!1179781))

(declare-fun m!1179783 () Bool)

(assert (=> b!1287345 m!1179783))

(declare-fun m!1179785 () Bool)

(assert (=> b!1287340 m!1179785))

(assert (=> b!1287340 m!1179785))

(declare-fun m!1179787 () Bool)

(assert (=> b!1287340 m!1179787))

(declare-fun m!1179789 () Bool)

(assert (=> start!108958 m!1179789))

(declare-fun m!1179791 () Bool)

(assert (=> start!108958 m!1179791))

(declare-fun m!1179793 () Bool)

(assert (=> start!108958 m!1179793))

(check-sat (not start!108958) (not b!1287345) (not b_next!28447) (not mapNonEmpty!52691) (not b!1287337) (not b!1287340) (not b!1287343) (not b!1287338) tp_is_empty!34087 b_and!46519)
(check-sat b_and!46519 (not b_next!28447))
