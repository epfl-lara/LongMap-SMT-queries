; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109014 () Bool)

(assert start!109014)

(declare-fun b_free!28503 () Bool)

(declare-fun b_next!28503 () Bool)

(assert (=> start!109014 (= b_free!28503 (not b_next!28503))))

(declare-fun tp!100627 () Bool)

(declare-fun b_and!46593 () Bool)

(assert (=> start!109014 (= tp!100627 b_and!46593)))

(declare-fun b!1288337 () Bool)

(declare-fun e!735665 () Bool)

(declare-fun tp_is_empty!34143 () Bool)

(assert (=> b!1288337 (= e!735665 tp_is_empty!34143)))

(declare-fun b!1288338 () Bool)

(declare-fun res!855695 () Bool)

(declare-fun e!735668 () Bool)

(assert (=> b!1288338 (=> (not res!855695) (not e!735668))))

(declare-datatypes ((array!85332 0))(
  ( (array!85333 (arr!41167 (Array (_ BitVec 32) (_ BitVec 64))) (size!41717 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85332)

(declare-datatypes ((List!29182 0))(
  ( (Nil!29179) (Cons!29178 (h!30387 (_ BitVec 64)) (t!42746 List!29182)) )
))
(declare-fun arrayNoDuplicates!0 (array!85332 (_ BitVec 32) List!29182) Bool)

(assert (=> b!1288338 (= res!855695 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29179))))

(declare-fun b!1288339 () Bool)

(declare-fun res!855692 () Bool)

(assert (=> b!1288339 (=> (not res!855692) (not e!735668))))

(declare-datatypes ((V!50627 0))(
  ( (V!50628 (val!17146 Int)) )
))
(declare-datatypes ((ValueCell!16173 0))(
  ( (ValueCellFull!16173 (v!19749 V!50627)) (EmptyCell!16173) )
))
(declare-datatypes ((array!85334 0))(
  ( (array!85335 (arr!41168 (Array (_ BitVec 32) ValueCell!16173)) (size!41718 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85334)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1288339 (= res!855692 (and (= (size!41718 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41717 _keys!1741) (size!41718 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288340 () Bool)

(declare-fun e!735663 () Bool)

(assert (=> b!1288340 (= e!735663 tp_is_empty!34143)))

(declare-fun b!1288341 () Bool)

(declare-fun res!855696 () Bool)

(assert (=> b!1288341 (=> (not res!855696) (not e!735668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85332 (_ BitVec 32)) Bool)

(assert (=> b!1288341 (= res!855696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288342 () Bool)

(declare-fun e!735667 () Bool)

(assert (=> b!1288342 (= e!735668 (not e!735667))))

(declare-fun res!855698 () Bool)

(assert (=> b!1288342 (=> res!855698 e!735667)))

(assert (=> b!1288342 (= res!855698 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22008 0))(
  ( (tuple2!22009 (_1!11015 (_ BitVec 64)) (_2!11015 V!50627)) )
))
(declare-datatypes ((List!29183 0))(
  ( (Nil!29180) (Cons!29179 (h!30388 tuple2!22008) (t!42747 List!29183)) )
))
(declare-datatypes ((ListLongMap!19665 0))(
  ( (ListLongMap!19666 (toList!9848 List!29183)) )
))
(declare-fun contains!7966 (ListLongMap!19665 (_ BitVec 64)) Bool)

(assert (=> b!1288342 (not (contains!7966 (ListLongMap!19666 Nil!29180) k0!1205))))

(declare-datatypes ((Unit!42616 0))(
  ( (Unit!42617) )
))
(declare-fun lt!577966 () Unit!42616)

(declare-fun emptyContainsNothing!37 ((_ BitVec 64)) Unit!42616)

(assert (=> b!1288342 (= lt!577966 (emptyContainsNothing!37 k0!1205))))

(declare-fun b!1288343 () Bool)

(assert (=> b!1288343 (= e!735667 true)))

(declare-fun lt!577965 () ListLongMap!19665)

(declare-fun zeroValue!1387 () V!50627)

(declare-fun +!4324 (ListLongMap!19665 tuple2!22008) ListLongMap!19665)

(assert (=> b!1288343 (not (contains!7966 (+!4324 lt!577965 (tuple2!22009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!577967 () Unit!42616)

(declare-fun addStillNotContains!342 (ListLongMap!19665 (_ BitVec 64) V!50627 (_ BitVec 64)) Unit!42616)

(assert (=> b!1288343 (= lt!577967 (addStillNotContains!342 lt!577965 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50627)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5955 (array!85332 array!85334 (_ BitVec 32) (_ BitVec 32) V!50627 V!50627 (_ BitVec 32) Int) ListLongMap!19665)

(assert (=> b!1288343 (= lt!577965 (getCurrentListMapNoExtraKeys!5955 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!52775 () Bool)

(declare-fun mapRes!52775 () Bool)

(assert (=> mapIsEmpty!52775 mapRes!52775))

(declare-fun b!1288344 () Bool)

(declare-fun res!855691 () Bool)

(assert (=> b!1288344 (=> (not res!855691) (not e!735668))))

(assert (=> b!1288344 (= res!855691 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41717 _keys!1741))))))

(declare-fun res!855699 () Bool)

(assert (=> start!109014 (=> (not res!855699) (not e!735668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109014 (= res!855699 (validMask!0 mask!2175))))

(assert (=> start!109014 e!735668))

(assert (=> start!109014 tp_is_empty!34143))

(assert (=> start!109014 true))

(declare-fun e!735664 () Bool)

(declare-fun array_inv!31215 (array!85334) Bool)

(assert (=> start!109014 (and (array_inv!31215 _values!1445) e!735664)))

(declare-fun array_inv!31216 (array!85332) Bool)

(assert (=> start!109014 (array_inv!31216 _keys!1741)))

(assert (=> start!109014 tp!100627))

(declare-fun mapNonEmpty!52775 () Bool)

(declare-fun tp!100628 () Bool)

(assert (=> mapNonEmpty!52775 (= mapRes!52775 (and tp!100628 e!735665))))

(declare-fun mapRest!52775 () (Array (_ BitVec 32) ValueCell!16173))

(declare-fun mapValue!52775 () ValueCell!16173)

(declare-fun mapKey!52775 () (_ BitVec 32))

(assert (=> mapNonEmpty!52775 (= (arr!41168 _values!1445) (store mapRest!52775 mapKey!52775 mapValue!52775))))

(declare-fun b!1288345 () Bool)

(declare-fun res!855694 () Bool)

(assert (=> b!1288345 (=> (not res!855694) (not e!735668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288345 (= res!855694 (not (validKeyInArray!0 (select (arr!41167 _keys!1741) from!2144))))))

(declare-fun b!1288346 () Bool)

(declare-fun res!855693 () Bool)

(assert (=> b!1288346 (=> (not res!855693) (not e!735668))))

(assert (=> b!1288346 (= res!855693 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41717 _keys!1741))))))

(declare-fun b!1288347 () Bool)

(declare-fun res!855697 () Bool)

(assert (=> b!1288347 (=> (not res!855697) (not e!735668))))

(declare-fun getCurrentListMap!4914 (array!85332 array!85334 (_ BitVec 32) (_ BitVec 32) V!50627 V!50627 (_ BitVec 32) Int) ListLongMap!19665)

(assert (=> b!1288347 (= res!855697 (contains!7966 (getCurrentListMap!4914 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288348 () Bool)

(assert (=> b!1288348 (= e!735664 (and e!735663 mapRes!52775))))

(declare-fun condMapEmpty!52775 () Bool)

(declare-fun mapDefault!52775 () ValueCell!16173)

(assert (=> b!1288348 (= condMapEmpty!52775 (= (arr!41168 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16173)) mapDefault!52775)))))

(assert (= (and start!109014 res!855699) b!1288339))

(assert (= (and b!1288339 res!855692) b!1288341))

(assert (= (and b!1288341 res!855696) b!1288338))

(assert (= (and b!1288338 res!855695) b!1288344))

(assert (= (and b!1288344 res!855691) b!1288347))

(assert (= (and b!1288347 res!855697) b!1288346))

(assert (= (and b!1288346 res!855693) b!1288345))

(assert (= (and b!1288345 res!855694) b!1288342))

(assert (= (and b!1288342 (not res!855698)) b!1288343))

(assert (= (and b!1288348 condMapEmpty!52775) mapIsEmpty!52775))

(assert (= (and b!1288348 (not condMapEmpty!52775)) mapNonEmpty!52775))

(get-info :version)

(assert (= (and mapNonEmpty!52775 ((_ is ValueCellFull!16173) mapValue!52775)) b!1288337))

(assert (= (and b!1288348 ((_ is ValueCellFull!16173) mapDefault!52775)) b!1288340))

(assert (= start!109014 b!1288348))

(declare-fun m!1180963 () Bool)

(assert (=> b!1288345 m!1180963))

(assert (=> b!1288345 m!1180963))

(declare-fun m!1180965 () Bool)

(assert (=> b!1288345 m!1180965))

(declare-fun m!1180967 () Bool)

(assert (=> b!1288347 m!1180967))

(assert (=> b!1288347 m!1180967))

(declare-fun m!1180969 () Bool)

(assert (=> b!1288347 m!1180969))

(declare-fun m!1180971 () Bool)

(assert (=> mapNonEmpty!52775 m!1180971))

(declare-fun m!1180973 () Bool)

(assert (=> b!1288338 m!1180973))

(declare-fun m!1180975 () Bool)

(assert (=> b!1288343 m!1180975))

(assert (=> b!1288343 m!1180975))

(declare-fun m!1180977 () Bool)

(assert (=> b!1288343 m!1180977))

(declare-fun m!1180979 () Bool)

(assert (=> b!1288343 m!1180979))

(declare-fun m!1180981 () Bool)

(assert (=> b!1288343 m!1180981))

(declare-fun m!1180983 () Bool)

(assert (=> b!1288342 m!1180983))

(declare-fun m!1180985 () Bool)

(assert (=> b!1288342 m!1180985))

(declare-fun m!1180987 () Bool)

(assert (=> start!109014 m!1180987))

(declare-fun m!1180989 () Bool)

(assert (=> start!109014 m!1180989))

(declare-fun m!1180991 () Bool)

(assert (=> start!109014 m!1180991))

(declare-fun m!1180993 () Bool)

(assert (=> b!1288341 m!1180993))

(check-sat (not b!1288338) (not b!1288347) (not b_next!28503) b_and!46593 tp_is_empty!34143 (not b!1288343) (not start!109014) (not b!1288341) (not b!1288345) (not mapNonEmpty!52775) (not b!1288342))
(check-sat b_and!46593 (not b_next!28503))
