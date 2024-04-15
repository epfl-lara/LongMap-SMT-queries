; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109168 () Bool)

(assert start!109168)

(declare-fun b_free!28657 () Bool)

(declare-fun b_next!28657 () Bool)

(assert (=> start!109168 (= b_free!28657 (not b_next!28657))))

(declare-fun tp!101091 () Bool)

(declare-fun b_and!46729 () Bool)

(assert (=> start!109168 (= tp!101091 b_and!46729)))

(declare-fun b!1291045 () Bool)

(declare-fun e!737023 () Bool)

(declare-fun tp_is_empty!34297 () Bool)

(assert (=> b!1291045 (= e!737023 tp_is_empty!34297)))

(declare-fun b!1291046 () Bool)

(declare-fun e!737021 () Bool)

(declare-fun e!737025 () Bool)

(assert (=> b!1291046 (= e!737021 (not e!737025))))

(declare-fun res!857747 () Bool)

(assert (=> b!1291046 (=> res!857747 e!737025)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291046 (= res!857747 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50833 0))(
  ( (V!50834 (val!17223 Int)) )
))
(declare-datatypes ((tuple2!22188 0))(
  ( (tuple2!22189 (_1!11105 (_ BitVec 64)) (_2!11105 V!50833)) )
))
(declare-datatypes ((List!29344 0))(
  ( (Nil!29341) (Cons!29340 (h!30549 tuple2!22188) (t!42900 List!29344)) )
))
(declare-datatypes ((ListLongMap!19845 0))(
  ( (ListLongMap!19846 (toList!9938 List!29344)) )
))
(declare-fun contains!7986 (ListLongMap!19845 (_ BitVec 64)) Bool)

(assert (=> b!1291046 (not (contains!7986 (ListLongMap!19846 Nil!29341) k0!1205))))

(declare-datatypes ((Unit!42568 0))(
  ( (Unit!42569) )
))
(declare-fun lt!578788 () Unit!42568)

(declare-fun emptyContainsNothing!82 ((_ BitVec 64)) Unit!42568)

(assert (=> b!1291046 (= lt!578788 (emptyContainsNothing!82 k0!1205))))

(declare-fun b!1291047 () Bool)

(declare-fun res!857743 () Bool)

(assert (=> b!1291047 (=> (not res!857743) (not e!737021))))

(declare-datatypes ((array!85519 0))(
  ( (array!85520 (arr!41261 (Array (_ BitVec 32) (_ BitVec 64))) (size!41813 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85519)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85519 (_ BitVec 32)) Bool)

(assert (=> b!1291047 (= res!857743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291048 () Bool)

(declare-fun res!857745 () Bool)

(assert (=> b!1291048 (=> (not res!857745) (not e!737021))))

(declare-datatypes ((List!29345 0))(
  ( (Nil!29342) (Cons!29341 (h!30550 (_ BitVec 64)) (t!42901 List!29345)) )
))
(declare-fun arrayNoDuplicates!0 (array!85519 (_ BitVec 32) List!29345) Bool)

(assert (=> b!1291048 (= res!857745 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29342))))

(declare-fun b!1291049 () Bool)

(declare-fun e!737024 () Bool)

(declare-fun e!737020 () Bool)

(declare-fun mapRes!53006 () Bool)

(assert (=> b!1291049 (= e!737024 (and e!737020 mapRes!53006))))

(declare-fun condMapEmpty!53006 () Bool)

(declare-datatypes ((ValueCell!16250 0))(
  ( (ValueCellFull!16250 (v!19825 V!50833)) (EmptyCell!16250) )
))
(declare-datatypes ((array!85521 0))(
  ( (array!85522 (arr!41262 (Array (_ BitVec 32) ValueCell!16250)) (size!41814 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85521)

(declare-fun mapDefault!53006 () ValueCell!16250)

(assert (=> b!1291049 (= condMapEmpty!53006 (= (arr!41262 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16250)) mapDefault!53006)))))

(declare-fun b!1291050 () Bool)

(assert (=> b!1291050 (= e!737025 true)))

(assert (=> b!1291050 false))

(declare-fun minValue!1387 () V!50833)

(declare-fun lt!578786 () Unit!42568)

(declare-fun lt!578785 () ListLongMap!19845)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!53 ((_ BitVec 64) (_ BitVec 64) V!50833 ListLongMap!19845) Unit!42568)

(assert (=> b!1291050 (= lt!578786 (lemmaInListMapAfterAddingDiffThenInBefore!53 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578785))))

(declare-fun lt!578784 () ListLongMap!19845)

(declare-fun +!4412 (ListLongMap!19845 tuple2!22188) ListLongMap!19845)

(assert (=> b!1291050 (not (contains!7986 (+!4412 lt!578784 (tuple2!22189 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578783 () Unit!42568)

(declare-fun addStillNotContains!389 (ListLongMap!19845 (_ BitVec 64) V!50833 (_ BitVec 64)) Unit!42568)

(assert (=> b!1291050 (= lt!578783 (addStillNotContains!389 lt!578784 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291050 (not (contains!7986 lt!578785 k0!1205))))

(declare-fun zeroValue!1387 () V!50833)

(assert (=> b!1291050 (= lt!578785 (+!4412 lt!578784 (tuple2!22189 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578787 () Unit!42568)

(assert (=> b!1291050 (= lt!578787 (addStillNotContains!389 lt!578784 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6043 (array!85519 array!85521 (_ BitVec 32) (_ BitVec 32) V!50833 V!50833 (_ BitVec 32) Int) ListLongMap!19845)

(assert (=> b!1291050 (= lt!578784 (getCurrentListMapNoExtraKeys!6043 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!857748 () Bool)

(assert (=> start!109168 (=> (not res!857748) (not e!737021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109168 (= res!857748 (validMask!0 mask!2175))))

(assert (=> start!109168 e!737021))

(assert (=> start!109168 tp_is_empty!34297))

(assert (=> start!109168 true))

(declare-fun array_inv!31431 (array!85521) Bool)

(assert (=> start!109168 (and (array_inv!31431 _values!1445) e!737024)))

(declare-fun array_inv!31432 (array!85519) Bool)

(assert (=> start!109168 (array_inv!31432 _keys!1741)))

(assert (=> start!109168 tp!101091))

(declare-fun b!1291051 () Bool)

(declare-fun res!857746 () Bool)

(assert (=> b!1291051 (=> (not res!857746) (not e!737021))))

(declare-fun getCurrentListMap!4885 (array!85519 array!85521 (_ BitVec 32) (_ BitVec 32) V!50833 V!50833 (_ BitVec 32) Int) ListLongMap!19845)

(assert (=> b!1291051 (= res!857746 (contains!7986 (getCurrentListMap!4885 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53006 () Bool)

(declare-fun tp!101090 () Bool)

(assert (=> mapNonEmpty!53006 (= mapRes!53006 (and tp!101090 e!737023))))

(declare-fun mapRest!53006 () (Array (_ BitVec 32) ValueCell!16250))

(declare-fun mapKey!53006 () (_ BitVec 32))

(declare-fun mapValue!53006 () ValueCell!16250)

(assert (=> mapNonEmpty!53006 (= (arr!41262 _values!1445) (store mapRest!53006 mapKey!53006 mapValue!53006))))

(declare-fun b!1291052 () Bool)

(declare-fun res!857744 () Bool)

(assert (=> b!1291052 (=> (not res!857744) (not e!737021))))

(assert (=> b!1291052 (= res!857744 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41813 _keys!1741))))))

(declare-fun mapIsEmpty!53006 () Bool)

(assert (=> mapIsEmpty!53006 mapRes!53006))

(declare-fun b!1291053 () Bool)

(declare-fun res!857750 () Bool)

(assert (=> b!1291053 (=> (not res!857750) (not e!737021))))

(assert (=> b!1291053 (= res!857750 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41813 _keys!1741))))))

(declare-fun b!1291054 () Bool)

(assert (=> b!1291054 (= e!737020 tp_is_empty!34297)))

(declare-fun b!1291055 () Bool)

(declare-fun res!857751 () Bool)

(assert (=> b!1291055 (=> (not res!857751) (not e!737021))))

(assert (=> b!1291055 (= res!857751 (and (= (size!41814 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41813 _keys!1741) (size!41814 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291056 () Bool)

(declare-fun res!857749 () Bool)

(assert (=> b!1291056 (=> (not res!857749) (not e!737021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291056 (= res!857749 (not (validKeyInArray!0 (select (arr!41261 _keys!1741) from!2144))))))

(assert (= (and start!109168 res!857748) b!1291055))

(assert (= (and b!1291055 res!857751) b!1291047))

(assert (= (and b!1291047 res!857743) b!1291048))

(assert (= (and b!1291048 res!857745) b!1291053))

(assert (= (and b!1291053 res!857750) b!1291051))

(assert (= (and b!1291051 res!857746) b!1291052))

(assert (= (and b!1291052 res!857744) b!1291056))

(assert (= (and b!1291056 res!857749) b!1291046))

(assert (= (and b!1291046 (not res!857747)) b!1291050))

(assert (= (and b!1291049 condMapEmpty!53006) mapIsEmpty!53006))

(assert (= (and b!1291049 (not condMapEmpty!53006)) mapNonEmpty!53006))

(get-info :version)

(assert (= (and mapNonEmpty!53006 ((_ is ValueCellFull!16250) mapValue!53006)) b!1291045))

(assert (= (and b!1291049 ((_ is ValueCellFull!16250) mapDefault!53006)) b!1291054))

(assert (= start!109168 b!1291049))

(declare-fun m!1183275 () Bool)

(assert (=> b!1291047 m!1183275))

(declare-fun m!1183277 () Bool)

(assert (=> b!1291051 m!1183277))

(assert (=> b!1291051 m!1183277))

(declare-fun m!1183279 () Bool)

(assert (=> b!1291051 m!1183279))

(declare-fun m!1183281 () Bool)

(assert (=> b!1291056 m!1183281))

(assert (=> b!1291056 m!1183281))

(declare-fun m!1183283 () Bool)

(assert (=> b!1291056 m!1183283))

(declare-fun m!1183285 () Bool)

(assert (=> b!1291050 m!1183285))

(declare-fun m!1183287 () Bool)

(assert (=> b!1291050 m!1183287))

(declare-fun m!1183289 () Bool)

(assert (=> b!1291050 m!1183289))

(declare-fun m!1183291 () Bool)

(assert (=> b!1291050 m!1183291))

(declare-fun m!1183293 () Bool)

(assert (=> b!1291050 m!1183293))

(declare-fun m!1183295 () Bool)

(assert (=> b!1291050 m!1183295))

(declare-fun m!1183297 () Bool)

(assert (=> b!1291050 m!1183297))

(assert (=> b!1291050 m!1183285))

(declare-fun m!1183299 () Bool)

(assert (=> b!1291050 m!1183299))

(declare-fun m!1183301 () Bool)

(assert (=> b!1291046 m!1183301))

(declare-fun m!1183303 () Bool)

(assert (=> b!1291046 m!1183303))

(declare-fun m!1183305 () Bool)

(assert (=> b!1291048 m!1183305))

(declare-fun m!1183307 () Bool)

(assert (=> mapNonEmpty!53006 m!1183307))

(declare-fun m!1183309 () Bool)

(assert (=> start!109168 m!1183309))

(declare-fun m!1183311 () Bool)

(assert (=> start!109168 m!1183311))

(declare-fun m!1183313 () Bool)

(assert (=> start!109168 m!1183313))

(check-sat (not b!1291048) (not b!1291047) tp_is_empty!34297 (not mapNonEmpty!53006) (not b!1291051) (not b!1291046) (not b!1291050) (not start!109168) (not b!1291056) b_and!46729 (not b_next!28657))
(check-sat b_and!46729 (not b_next!28657))
