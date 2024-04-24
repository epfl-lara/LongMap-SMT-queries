; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109014 () Bool)

(assert start!109014)

(declare-fun b_free!28303 () Bool)

(declare-fun b_next!28303 () Bool)

(assert (=> start!109014 (= b_free!28303 (not b_next!28303))))

(declare-fun tp!100024 () Bool)

(declare-fun b_and!46371 () Bool)

(assert (=> start!109014 (= tp!100024 b_and!46371)))

(declare-fun mapNonEmpty!52472 () Bool)

(declare-fun mapRes!52472 () Bool)

(declare-fun tp!100025 () Bool)

(declare-fun e!734680 () Bool)

(assert (=> mapNonEmpty!52472 (= mapRes!52472 (and tp!100025 e!734680))))

(declare-fun mapKey!52472 () (_ BitVec 32))

(declare-datatypes ((V!50361 0))(
  ( (V!50362 (val!17046 Int)) )
))
(declare-datatypes ((ValueCell!16073 0))(
  ( (ValueCellFull!16073 (v!19643 V!50361)) (EmptyCell!16073) )
))
(declare-datatypes ((array!84973 0))(
  ( (array!84974 (arr!40984 (Array (_ BitVec 32) ValueCell!16073)) (size!41535 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84973)

(declare-fun mapValue!52472 () ValueCell!16073)

(declare-fun mapRest!52472 () (Array (_ BitVec 32) ValueCell!16073))

(assert (=> mapNonEmpty!52472 (= (arr!40984 _values!1445) (store mapRest!52472 mapKey!52472 mapValue!52472))))

(declare-fun b!1285973 () Bool)

(declare-fun res!853935 () Bool)

(declare-fun e!734681 () Bool)

(assert (=> b!1285973 (=> (not res!853935) (not e!734681))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!84975 0))(
  ( (array!84976 (arr!40985 (Array (_ BitVec 32) (_ BitVec 64))) (size!41536 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84975)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285973 (= res!853935 (and (= (size!41535 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41536 _keys!1741) (size!41535 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285974 () Bool)

(declare-fun res!853934 () Bool)

(assert (=> b!1285974 (=> (not res!853934) (not e!734681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84975 (_ BitVec 32)) Bool)

(assert (=> b!1285974 (= res!853934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52472 () Bool)

(assert (=> mapIsEmpty!52472 mapRes!52472))

(declare-fun b!1285975 () Bool)

(declare-fun e!734679 () Bool)

(declare-fun e!734678 () Bool)

(assert (=> b!1285975 (= e!734679 (and e!734678 mapRes!52472))))

(declare-fun condMapEmpty!52472 () Bool)

(declare-fun mapDefault!52472 () ValueCell!16073)

(assert (=> b!1285975 (= condMapEmpty!52472 (= (arr!40984 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16073)) mapDefault!52472)))))

(declare-fun b!1285976 () Bool)

(assert (=> b!1285976 (= e!734681 false)))

(declare-fun minValue!1387 () V!50361)

(declare-fun zeroValue!1387 () V!50361)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!577325 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21866 0))(
  ( (tuple2!21867 (_1!10944 (_ BitVec 64)) (_2!10944 V!50361)) )
))
(declare-datatypes ((List!29068 0))(
  ( (Nil!29065) (Cons!29064 (h!30282 tuple2!21866) (t!42604 List!29068)) )
))
(declare-datatypes ((ListLongMap!19531 0))(
  ( (ListLongMap!19532 (toList!9781 List!29068)) )
))
(declare-fun contains!7912 (ListLongMap!19531 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4845 (array!84975 array!84973 (_ BitVec 32) (_ BitVec 32) V!50361 V!50361 (_ BitVec 32) Int) ListLongMap!19531)

(assert (=> b!1285976 (= lt!577325 (contains!7912 (getCurrentListMap!4845 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285977 () Bool)

(declare-fun res!853933 () Bool)

(assert (=> b!1285977 (=> (not res!853933) (not e!734681))))

(declare-datatypes ((List!29069 0))(
  ( (Nil!29066) (Cons!29065 (h!30283 (_ BitVec 64)) (t!42605 List!29069)) )
))
(declare-fun arrayNoDuplicates!0 (array!84975 (_ BitVec 32) List!29069) Bool)

(assert (=> b!1285977 (= res!853933 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29066))))

(declare-fun res!853932 () Bool)

(assert (=> start!109014 (=> (not res!853932) (not e!734681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109014 (= res!853932 (validMask!0 mask!2175))))

(assert (=> start!109014 e!734681))

(declare-fun tp_is_empty!33943 () Bool)

(assert (=> start!109014 tp_is_empty!33943))

(assert (=> start!109014 true))

(declare-fun array_inv!31299 (array!84973) Bool)

(assert (=> start!109014 (and (array_inv!31299 _values!1445) e!734679)))

(declare-fun array_inv!31300 (array!84975) Bool)

(assert (=> start!109014 (array_inv!31300 _keys!1741)))

(assert (=> start!109014 tp!100024))

(declare-fun b!1285978 () Bool)

(assert (=> b!1285978 (= e!734680 tp_is_empty!33943)))

(declare-fun b!1285979 () Bool)

(declare-fun res!853936 () Bool)

(assert (=> b!1285979 (=> (not res!853936) (not e!734681))))

(assert (=> b!1285979 (= res!853936 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41536 _keys!1741))))))

(declare-fun b!1285980 () Bool)

(assert (=> b!1285980 (= e!734678 tp_is_empty!33943)))

(assert (= (and start!109014 res!853932) b!1285973))

(assert (= (and b!1285973 res!853935) b!1285974))

(assert (= (and b!1285974 res!853934) b!1285977))

(assert (= (and b!1285977 res!853933) b!1285979))

(assert (= (and b!1285979 res!853936) b!1285976))

(assert (= (and b!1285975 condMapEmpty!52472) mapIsEmpty!52472))

(assert (= (and b!1285975 (not condMapEmpty!52472)) mapNonEmpty!52472))

(get-info :version)

(assert (= (and mapNonEmpty!52472 ((_ is ValueCellFull!16073) mapValue!52472)) b!1285978))

(assert (= (and b!1285975 ((_ is ValueCellFull!16073) mapDefault!52472)) b!1285980))

(assert (= start!109014 b!1285975))

(declare-fun m!1179889 () Bool)

(assert (=> b!1285977 m!1179889))

(declare-fun m!1179891 () Bool)

(assert (=> b!1285974 m!1179891))

(declare-fun m!1179893 () Bool)

(assert (=> start!109014 m!1179893))

(declare-fun m!1179895 () Bool)

(assert (=> start!109014 m!1179895))

(declare-fun m!1179897 () Bool)

(assert (=> start!109014 m!1179897))

(declare-fun m!1179899 () Bool)

(assert (=> b!1285976 m!1179899))

(assert (=> b!1285976 m!1179899))

(declare-fun m!1179901 () Bool)

(assert (=> b!1285976 m!1179901))

(declare-fun m!1179903 () Bool)

(assert (=> mapNonEmpty!52472 m!1179903))

(check-sat (not start!109014) tp_is_empty!33943 (not mapNonEmpty!52472) (not b!1285977) (not b_next!28303) (not b!1285974) b_and!46371 (not b!1285976))
(check-sat b_and!46371 (not b_next!28303))
