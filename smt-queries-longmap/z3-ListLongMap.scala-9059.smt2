; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109140 () Bool)

(assert start!109140)

(declare-fun b_free!28629 () Bool)

(declare-fun b_next!28629 () Bool)

(assert (=> start!109140 (= b_free!28629 (not b_next!28629))))

(declare-fun tp!101005 () Bool)

(declare-fun b_and!46719 () Bool)

(assert (=> start!109140 (= tp!101005 b_and!46719)))

(declare-fun b!1290605 () Bool)

(declare-fun res!857394 () Bool)

(declare-fun e!736802 () Bool)

(assert (=> b!1290605 (=> (not res!857394) (not e!736802))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85578 0))(
  ( (array!85579 (arr!41290 (Array (_ BitVec 32) (_ BitVec 64))) (size!41840 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85578)

(assert (=> b!1290605 (= res!857394 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41840 _keys!1741))))))

(declare-fun b!1290606 () Bool)

(declare-fun e!736800 () Bool)

(assert (=> b!1290606 (= e!736802 (not e!736800))))

(declare-fun res!857392 () Bool)

(assert (=> b!1290606 (=> res!857392 e!736800)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290606 (= res!857392 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!50795 0))(
  ( (V!50796 (val!17209 Int)) )
))
(declare-datatypes ((tuple2!22114 0))(
  ( (tuple2!22115 (_1!11068 (_ BitVec 64)) (_2!11068 V!50795)) )
))
(declare-datatypes ((List!29280 0))(
  ( (Nil!29277) (Cons!29276 (h!30485 tuple2!22114) (t!42844 List!29280)) )
))
(declare-datatypes ((ListLongMap!19771 0))(
  ( (ListLongMap!19772 (toList!9901 List!29280)) )
))
(declare-fun contains!8019 (ListLongMap!19771 (_ BitVec 64)) Bool)

(assert (=> b!1290606 (not (contains!8019 (ListLongMap!19772 Nil!29277) k0!1205))))

(declare-datatypes ((Unit!42716 0))(
  ( (Unit!42717) )
))
(declare-fun lt!578710 () Unit!42716)

(declare-fun emptyContainsNothing!84 ((_ BitVec 64)) Unit!42716)

(assert (=> b!1290606 (= lt!578710 (emptyContainsNothing!84 k0!1205))))

(declare-fun b!1290607 () Bool)

(declare-fun res!857400 () Bool)

(assert (=> b!1290607 (=> (not res!857400) (not e!736802))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85578 (_ BitVec 32)) Bool)

(assert (=> b!1290607 (= res!857400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!857398 () Bool)

(assert (=> start!109140 (=> (not res!857398) (not e!736802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109140 (= res!857398 (validMask!0 mask!2175))))

(assert (=> start!109140 e!736802))

(declare-fun tp_is_empty!34269 () Bool)

(assert (=> start!109140 tp_is_empty!34269))

(assert (=> start!109140 true))

(declare-datatypes ((ValueCell!16236 0))(
  ( (ValueCellFull!16236 (v!19812 V!50795)) (EmptyCell!16236) )
))
(declare-datatypes ((array!85580 0))(
  ( (array!85581 (arr!41291 (Array (_ BitVec 32) ValueCell!16236)) (size!41841 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85580)

(declare-fun e!736801 () Bool)

(declare-fun array_inv!31291 (array!85580) Bool)

(assert (=> start!109140 (and (array_inv!31291 _values!1445) e!736801)))

(declare-fun array_inv!31292 (array!85578) Bool)

(assert (=> start!109140 (array_inv!31292 _keys!1741)))

(assert (=> start!109140 tp!101005))

(declare-fun mapIsEmpty!52964 () Bool)

(declare-fun mapRes!52964 () Bool)

(assert (=> mapIsEmpty!52964 mapRes!52964))

(declare-fun b!1290608 () Bool)

(declare-fun res!857399 () Bool)

(assert (=> b!1290608 (=> (not res!857399) (not e!736802))))

(assert (=> b!1290608 (= res!857399 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41840 _keys!1741))))))

(declare-fun b!1290609 () Bool)

(declare-fun e!736799 () Bool)

(assert (=> b!1290609 (= e!736799 tp_is_empty!34269)))

(declare-fun b!1290610 () Bool)

(declare-fun res!857393 () Bool)

(assert (=> b!1290610 (=> (not res!857393) (not e!736802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290610 (= res!857393 (not (validKeyInArray!0 (select (arr!41290 _keys!1741) from!2144))))))

(declare-fun b!1290611 () Bool)

(declare-fun res!857396 () Bool)

(assert (=> b!1290611 (=> (not res!857396) (not e!736802))))

(declare-datatypes ((List!29281 0))(
  ( (Nil!29278) (Cons!29277 (h!30486 (_ BitVec 64)) (t!42845 List!29281)) )
))
(declare-fun arrayNoDuplicates!0 (array!85578 (_ BitVec 32) List!29281) Bool)

(assert (=> b!1290611 (= res!857396 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29278))))

(declare-fun b!1290612 () Bool)

(declare-fun res!857397 () Bool)

(assert (=> b!1290612 (=> (not res!857397) (not e!736802))))

(declare-fun minValue!1387 () V!50795)

(declare-fun zeroValue!1387 () V!50795)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4958 (array!85578 array!85580 (_ BitVec 32) (_ BitVec 32) V!50795 V!50795 (_ BitVec 32) Int) ListLongMap!19771)

(assert (=> b!1290612 (= res!857397 (contains!8019 (getCurrentListMap!4958 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290613 () Bool)

(declare-fun res!857395 () Bool)

(assert (=> b!1290613 (=> (not res!857395) (not e!736802))))

(assert (=> b!1290613 (= res!857395 (and (= (size!41841 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41840 _keys!1741) (size!41841 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290614 () Bool)

(assert (=> b!1290614 (= e!736801 (and e!736799 mapRes!52964))))

(declare-fun condMapEmpty!52964 () Bool)

(declare-fun mapDefault!52964 () ValueCell!16236)

(assert (=> b!1290614 (= condMapEmpty!52964 (= (arr!41291 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16236)) mapDefault!52964)))))

(declare-fun b!1290615 () Bool)

(assert (=> b!1290615 (= e!736800 true)))

(assert (=> b!1290615 false))

(declare-fun lt!578709 () Unit!42716)

(declare-fun lt!578712 () ListLongMap!19771)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!43 ((_ BitVec 64) (_ BitVec 64) V!50795 ListLongMap!19771) Unit!42716)

(assert (=> b!1290615 (= lt!578709 (lemmaInListMapAfterAddingDiffThenInBefore!43 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578712))))

(declare-fun lt!578714 () ListLongMap!19771)

(declare-fun +!4369 (ListLongMap!19771 tuple2!22114) ListLongMap!19771)

(assert (=> b!1290615 (not (contains!8019 (+!4369 lt!578714 (tuple2!22115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578711 () Unit!42716)

(declare-fun addStillNotContains!387 (ListLongMap!19771 (_ BitVec 64) V!50795 (_ BitVec 64)) Unit!42716)

(assert (=> b!1290615 (= lt!578711 (addStillNotContains!387 lt!578714 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290615 (not (contains!8019 lt!578712 k0!1205))))

(assert (=> b!1290615 (= lt!578712 (+!4369 lt!578714 (tuple2!22115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578713 () Unit!42716)

(assert (=> b!1290615 (= lt!578713 (addStillNotContains!387 lt!578714 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6000 (array!85578 array!85580 (_ BitVec 32) (_ BitVec 32) V!50795 V!50795 (_ BitVec 32) Int) ListLongMap!19771)

(assert (=> b!1290615 (= lt!578714 (getCurrentListMapNoExtraKeys!6000 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!52964 () Bool)

(declare-fun tp!101006 () Bool)

(declare-fun e!736798 () Bool)

(assert (=> mapNonEmpty!52964 (= mapRes!52964 (and tp!101006 e!736798))))

(declare-fun mapRest!52964 () (Array (_ BitVec 32) ValueCell!16236))

(declare-fun mapValue!52964 () ValueCell!16236)

(declare-fun mapKey!52964 () (_ BitVec 32))

(assert (=> mapNonEmpty!52964 (= (arr!41291 _values!1445) (store mapRest!52964 mapKey!52964 mapValue!52964))))

(declare-fun b!1290616 () Bool)

(assert (=> b!1290616 (= e!736798 tp_is_empty!34269)))

(assert (= (and start!109140 res!857398) b!1290613))

(assert (= (and b!1290613 res!857395) b!1290607))

(assert (= (and b!1290607 res!857400) b!1290611))

(assert (= (and b!1290611 res!857396) b!1290608))

(assert (= (and b!1290608 res!857399) b!1290612))

(assert (= (and b!1290612 res!857397) b!1290605))

(assert (= (and b!1290605 res!857394) b!1290610))

(assert (= (and b!1290610 res!857393) b!1290606))

(assert (= (and b!1290606 (not res!857392)) b!1290615))

(assert (= (and b!1290614 condMapEmpty!52964) mapIsEmpty!52964))

(assert (= (and b!1290614 (not condMapEmpty!52964)) mapNonEmpty!52964))

(get-info :version)

(assert (= (and mapNonEmpty!52964 ((_ is ValueCellFull!16236) mapValue!52964)) b!1290616))

(assert (= (and b!1290614 ((_ is ValueCellFull!16236) mapDefault!52964)) b!1290609))

(assert (= start!109140 b!1290614))

(declare-fun m!1183215 () Bool)

(assert (=> start!109140 m!1183215))

(declare-fun m!1183217 () Bool)

(assert (=> start!109140 m!1183217))

(declare-fun m!1183219 () Bool)

(assert (=> start!109140 m!1183219))

(declare-fun m!1183221 () Bool)

(assert (=> b!1290611 m!1183221))

(declare-fun m!1183223 () Bool)

(assert (=> mapNonEmpty!52964 m!1183223))

(declare-fun m!1183225 () Bool)

(assert (=> b!1290612 m!1183225))

(assert (=> b!1290612 m!1183225))

(declare-fun m!1183227 () Bool)

(assert (=> b!1290612 m!1183227))

(declare-fun m!1183229 () Bool)

(assert (=> b!1290610 m!1183229))

(assert (=> b!1290610 m!1183229))

(declare-fun m!1183231 () Bool)

(assert (=> b!1290610 m!1183231))

(declare-fun m!1183233 () Bool)

(assert (=> b!1290615 m!1183233))

(declare-fun m!1183235 () Bool)

(assert (=> b!1290615 m!1183235))

(declare-fun m!1183237 () Bool)

(assert (=> b!1290615 m!1183237))

(declare-fun m!1183239 () Bool)

(assert (=> b!1290615 m!1183239))

(assert (=> b!1290615 m!1183235))

(declare-fun m!1183241 () Bool)

(assert (=> b!1290615 m!1183241))

(declare-fun m!1183243 () Bool)

(assert (=> b!1290615 m!1183243))

(declare-fun m!1183245 () Bool)

(assert (=> b!1290615 m!1183245))

(declare-fun m!1183247 () Bool)

(assert (=> b!1290615 m!1183247))

(declare-fun m!1183249 () Bool)

(assert (=> b!1290606 m!1183249))

(declare-fun m!1183251 () Bool)

(assert (=> b!1290606 m!1183251))

(declare-fun m!1183253 () Bool)

(assert (=> b!1290607 m!1183253))

(check-sat (not b!1290615) (not b!1290606) tp_is_empty!34269 (not b!1290612) (not b!1290611) b_and!46719 (not mapNonEmpty!52964) (not b_next!28629) (not start!109140) (not b!1290610) (not b!1290607))
(check-sat b_and!46719 (not b_next!28629))
