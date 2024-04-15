; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109012 () Bool)

(assert start!109012)

(declare-fun b_free!28501 () Bool)

(declare-fun b_next!28501 () Bool)

(assert (=> start!109012 (= b_free!28501 (not b_next!28501))))

(declare-fun tp!100622 () Bool)

(declare-fun b_and!46573 () Bool)

(assert (=> start!109012 (= tp!100622 b_and!46573)))

(declare-fun b!1288237 () Bool)

(declare-fun res!855643 () Bool)

(declare-fun e!735616 () Bool)

(assert (=> b!1288237 (=> (not res!855643) (not e!735616))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85217 0))(
  ( (array!85218 (arr!41110 (Array (_ BitVec 32) (_ BitVec 64))) (size!41662 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85217)

(assert (=> b!1288237 (= res!855643 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41662 _keys!1741))))))

(declare-fun b!1288238 () Bool)

(declare-fun e!735621 () Bool)

(declare-fun tp_is_empty!34141 () Bool)

(assert (=> b!1288238 (= e!735621 tp_is_empty!34141)))

(declare-fun b!1288239 () Bool)

(declare-fun e!735618 () Bool)

(assert (=> b!1288239 (= e!735618 tp_is_empty!34141)))

(declare-fun b!1288240 () Bool)

(declare-fun res!855638 () Bool)

(assert (=> b!1288240 (=> (not res!855638) (not e!735616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288240 (= res!855638 (not (validKeyInArray!0 (select (arr!41110 _keys!1741) from!2144))))))

(declare-fun b!1288241 () Bool)

(declare-fun res!855641 () Bool)

(assert (=> b!1288241 (=> (not res!855641) (not e!735616))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50625 0))(
  ( (V!50626 (val!17145 Int)) )
))
(declare-datatypes ((ValueCell!16172 0))(
  ( (ValueCellFull!16172 (v!19747 V!50625)) (EmptyCell!16172) )
))
(declare-datatypes ((array!85219 0))(
  ( (array!85220 (arr!41111 (Array (_ BitVec 32) ValueCell!16172)) (size!41663 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85219)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288241 (= res!855641 (and (= (size!41663 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41662 _keys!1741) (size!41663 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52772 () Bool)

(declare-fun mapRes!52772 () Bool)

(declare-fun tp!100623 () Bool)

(assert (=> mapNonEmpty!52772 (= mapRes!52772 (and tp!100623 e!735621))))

(declare-fun mapKey!52772 () (_ BitVec 32))

(declare-fun mapRest!52772 () (Array (_ BitVec 32) ValueCell!16172))

(declare-fun mapValue!52772 () ValueCell!16172)

(assert (=> mapNonEmpty!52772 (= (arr!41111 _values!1445) (store mapRest!52772 mapKey!52772 mapValue!52772))))

(declare-fun mapIsEmpty!52772 () Bool)

(assert (=> mapIsEmpty!52772 mapRes!52772))

(declare-fun b!1288242 () Bool)

(declare-fun e!735620 () Bool)

(assert (=> b!1288242 (= e!735620 (and e!735618 mapRes!52772))))

(declare-fun condMapEmpty!52772 () Bool)

(declare-fun mapDefault!52772 () ValueCell!16172)

(assert (=> b!1288242 (= condMapEmpty!52772 (= (arr!41111 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16172)) mapDefault!52772)))))

(declare-fun res!855642 () Bool)

(assert (=> start!109012 (=> (not res!855642) (not e!735616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109012 (= res!855642 (validMask!0 mask!2175))))

(assert (=> start!109012 e!735616))

(assert (=> start!109012 tp_is_empty!34141))

(assert (=> start!109012 true))

(declare-fun array_inv!31331 (array!85219) Bool)

(assert (=> start!109012 (and (array_inv!31331 _values!1445) e!735620)))

(declare-fun array_inv!31332 (array!85217) Bool)

(assert (=> start!109012 (array_inv!31332 _keys!1741)))

(assert (=> start!109012 tp!100622))

(declare-fun b!1288243 () Bool)

(declare-fun e!735619 () Bool)

(assert (=> b!1288243 (= e!735616 (not e!735619))))

(declare-fun res!855639 () Bool)

(assert (=> b!1288243 (=> res!855639 e!735619)))

(assert (=> b!1288243 (= res!855639 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22062 0))(
  ( (tuple2!22063 (_1!11042 (_ BitVec 64)) (_2!11042 V!50625)) )
))
(declare-datatypes ((List!29233 0))(
  ( (Nil!29230) (Cons!29229 (h!30438 tuple2!22062) (t!42789 List!29233)) )
))
(declare-datatypes ((ListLongMap!19719 0))(
  ( (ListLongMap!19720 (toList!9875 List!29233)) )
))
(declare-fun contains!7923 (ListLongMap!19719 (_ BitVec 64)) Bool)

(assert (=> b!1288243 (not (contains!7923 (ListLongMap!19720 Nil!29230) k0!1205))))

(declare-datatypes ((Unit!42454 0))(
  ( (Unit!42455) )
))
(declare-fun lt!577778 () Unit!42454)

(declare-fun emptyContainsNothing!34 ((_ BitVec 64)) Unit!42454)

(assert (=> b!1288243 (= lt!577778 (emptyContainsNothing!34 k0!1205))))

(declare-fun b!1288244 () Bool)

(declare-fun res!855644 () Bool)

(assert (=> b!1288244 (=> (not res!855644) (not e!735616))))

(assert (=> b!1288244 (= res!855644 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41662 _keys!1741))))))

(declare-fun b!1288245 () Bool)

(declare-fun res!855640 () Bool)

(assert (=> b!1288245 (=> (not res!855640) (not e!735616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85217 (_ BitVec 32)) Bool)

(assert (=> b!1288245 (= res!855640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288246 () Bool)

(assert (=> b!1288246 (= e!735619 true)))

(declare-fun lt!577780 () ListLongMap!19719)

(declare-fun zeroValue!1387 () V!50625)

(declare-fun +!4365 (ListLongMap!19719 tuple2!22062) ListLongMap!19719)

(assert (=> b!1288246 (not (contains!7923 (+!4365 lt!577780 (tuple2!22063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!577779 () Unit!42454)

(declare-fun addStillNotContains!342 (ListLongMap!19719 (_ BitVec 64) V!50625 (_ BitVec 64)) Unit!42454)

(assert (=> b!1288246 (= lt!577779 (addStillNotContains!342 lt!577780 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50625)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5996 (array!85217 array!85219 (_ BitVec 32) (_ BitVec 32) V!50625 V!50625 (_ BitVec 32) Int) ListLongMap!19719)

(assert (=> b!1288246 (= lt!577780 (getCurrentListMapNoExtraKeys!5996 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288247 () Bool)

(declare-fun res!855637 () Bool)

(assert (=> b!1288247 (=> (not res!855637) (not e!735616))))

(declare-datatypes ((List!29234 0))(
  ( (Nil!29231) (Cons!29230 (h!30439 (_ BitVec 64)) (t!42790 List!29234)) )
))
(declare-fun arrayNoDuplicates!0 (array!85217 (_ BitVec 32) List!29234) Bool)

(assert (=> b!1288247 (= res!855637 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29231))))

(declare-fun b!1288248 () Bool)

(declare-fun res!855645 () Bool)

(assert (=> b!1288248 (=> (not res!855645) (not e!735616))))

(declare-fun getCurrentListMap!4834 (array!85217 array!85219 (_ BitVec 32) (_ BitVec 32) V!50625 V!50625 (_ BitVec 32) Int) ListLongMap!19719)

(assert (=> b!1288248 (= res!855645 (contains!7923 (getCurrentListMap!4834 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109012 res!855642) b!1288241))

(assert (= (and b!1288241 res!855641) b!1288245))

(assert (= (and b!1288245 res!855640) b!1288247))

(assert (= (and b!1288247 res!855637) b!1288237))

(assert (= (and b!1288237 res!855643) b!1288248))

(assert (= (and b!1288248 res!855645) b!1288244))

(assert (= (and b!1288244 res!855644) b!1288240))

(assert (= (and b!1288240 res!855638) b!1288243))

(assert (= (and b!1288243 (not res!855639)) b!1288246))

(assert (= (and b!1288242 condMapEmpty!52772) mapIsEmpty!52772))

(assert (= (and b!1288242 (not condMapEmpty!52772)) mapNonEmpty!52772))

(get-info :version)

(assert (= (and mapNonEmpty!52772 ((_ is ValueCellFull!16172) mapValue!52772)) b!1288238))

(assert (= (and b!1288242 ((_ is ValueCellFull!16172) mapDefault!52772)) b!1288239))

(assert (= start!109012 b!1288242))

(declare-fun m!1180431 () Bool)

(assert (=> mapNonEmpty!52772 m!1180431))

(declare-fun m!1180433 () Bool)

(assert (=> b!1288240 m!1180433))

(assert (=> b!1288240 m!1180433))

(declare-fun m!1180435 () Bool)

(assert (=> b!1288240 m!1180435))

(declare-fun m!1180437 () Bool)

(assert (=> b!1288248 m!1180437))

(assert (=> b!1288248 m!1180437))

(declare-fun m!1180439 () Bool)

(assert (=> b!1288248 m!1180439))

(declare-fun m!1180441 () Bool)

(assert (=> b!1288245 m!1180441))

(declare-fun m!1180443 () Bool)

(assert (=> b!1288243 m!1180443))

(declare-fun m!1180445 () Bool)

(assert (=> b!1288243 m!1180445))

(declare-fun m!1180447 () Bool)

(assert (=> b!1288247 m!1180447))

(declare-fun m!1180449 () Bool)

(assert (=> b!1288246 m!1180449))

(assert (=> b!1288246 m!1180449))

(declare-fun m!1180451 () Bool)

(assert (=> b!1288246 m!1180451))

(declare-fun m!1180453 () Bool)

(assert (=> b!1288246 m!1180453))

(declare-fun m!1180455 () Bool)

(assert (=> b!1288246 m!1180455))

(declare-fun m!1180457 () Bool)

(assert (=> start!109012 m!1180457))

(declare-fun m!1180459 () Bool)

(assert (=> start!109012 m!1180459))

(declare-fun m!1180461 () Bool)

(assert (=> start!109012 m!1180461))

(check-sat (not b!1288247) (not b!1288240) (not start!109012) (not b!1288245) (not b!1288243) (not mapNonEmpty!52772) (not b!1288246) (not b!1288248) b_and!46573 (not b_next!28501) tp_is_empty!34141)
(check-sat b_and!46573 (not b_next!28501))
