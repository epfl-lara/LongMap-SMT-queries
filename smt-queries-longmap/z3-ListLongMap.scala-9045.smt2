; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109278 () Bool)

(assert start!109278)

(declare-fun b_free!28543 () Bool)

(declare-fun b_next!28543 () Bool)

(assert (=> start!109278 (= b_free!28543 (not b_next!28543))))

(declare-fun tp!100748 () Bool)

(declare-fun b_and!46635 () Bool)

(assert (=> start!109278 (= tp!100748 b_and!46635)))

(declare-fun b!1290362 () Bool)

(declare-fun e!736870 () Bool)

(declare-fun e!736873 () Bool)

(assert (=> b!1290362 (= e!736870 (not e!736873))))

(declare-fun res!856757 () Bool)

(assert (=> b!1290362 (=> res!856757 e!736873)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290362 (= res!856757 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50681 0))(
  ( (V!50682 (val!17166 Int)) )
))
(declare-datatypes ((tuple2!22056 0))(
  ( (tuple2!22057 (_1!11039 (_ BitVec 64)) (_2!11039 V!50681)) )
))
(declare-datatypes ((List!29238 0))(
  ( (Nil!29235) (Cons!29234 (h!30452 tuple2!22056) (t!42794 List!29238)) )
))
(declare-datatypes ((ListLongMap!19721 0))(
  ( (ListLongMap!19722 (toList!9876 List!29238)) )
))
(declare-fun contains!8007 (ListLongMap!19721 (_ BitVec 64)) Bool)

(assert (=> b!1290362 (not (contains!8007 (ListLongMap!19722 Nil!29235) k0!1205))))

(declare-datatypes ((Unit!42601 0))(
  ( (Unit!42602) )
))
(declare-fun lt!578631 () Unit!42601)

(declare-fun emptyContainsNothing!52 ((_ BitVec 64)) Unit!42601)

(assert (=> b!1290362 (= lt!578631 (emptyContainsNothing!52 k0!1205))))

(declare-fun b!1290363 () Bool)

(assert (=> b!1290363 (= e!736873 true)))

(declare-fun lt!578629 () ListLongMap!19721)

(declare-fun zeroValue!1387 () V!50681)

(declare-fun +!4382 (ListLongMap!19721 tuple2!22056) ListLongMap!19721)

(assert (=> b!1290363 (not (contains!8007 (+!4382 lt!578629 (tuple2!22057 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578630 () Unit!42601)

(declare-fun addStillNotContains!358 (ListLongMap!19721 (_ BitVec 64) V!50681 (_ BitVec 64)) Unit!42601)

(assert (=> b!1290363 (= lt!578630 (addStillNotContains!358 lt!578629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16193 0))(
  ( (ValueCellFull!16193 (v!19764 V!50681)) (EmptyCell!16193) )
))
(declare-datatypes ((array!85445 0))(
  ( (array!85446 (arr!41219 (Array (_ BitVec 32) ValueCell!16193)) (size!41770 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85445)

(declare-datatypes ((array!85447 0))(
  ( (array!85448 (arr!41220 (Array (_ BitVec 32) (_ BitVec 64))) (size!41771 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85447)

(declare-fun minValue!1387 () V!50681)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6020 (array!85447 array!85445 (_ BitVec 32) (_ BitVec 32) V!50681 V!50681 (_ BitVec 32) Int) ListLongMap!19721)

(assert (=> b!1290363 (= lt!578629 (getCurrentListMapNoExtraKeys!6020 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290364 () Bool)

(declare-fun e!736874 () Bool)

(declare-fun tp_is_empty!34183 () Bool)

(assert (=> b!1290364 (= e!736874 tp_is_empty!34183)))

(declare-fun b!1290365 () Bool)

(declare-fun res!856756 () Bool)

(assert (=> b!1290365 (=> (not res!856756) (not e!736870))))

(assert (=> b!1290365 (= res!856756 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41771 _keys!1741))))))

(declare-fun b!1290366 () Bool)

(declare-fun e!736871 () Bool)

(declare-fun e!736872 () Bool)

(declare-fun mapRes!52835 () Bool)

(assert (=> b!1290366 (= e!736871 (and e!736872 mapRes!52835))))

(declare-fun condMapEmpty!52835 () Bool)

(declare-fun mapDefault!52835 () ValueCell!16193)

(assert (=> b!1290366 (= condMapEmpty!52835 (= (arr!41219 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16193)) mapDefault!52835)))))

(declare-fun b!1290367 () Bool)

(assert (=> b!1290367 (= e!736872 tp_is_empty!34183)))

(declare-fun mapIsEmpty!52835 () Bool)

(assert (=> mapIsEmpty!52835 mapRes!52835))

(declare-fun b!1290368 () Bool)

(declare-fun res!856751 () Bool)

(assert (=> b!1290368 (=> (not res!856751) (not e!736870))))

(declare-datatypes ((List!29239 0))(
  ( (Nil!29236) (Cons!29235 (h!30453 (_ BitVec 64)) (t!42795 List!29239)) )
))
(declare-fun arrayNoDuplicates!0 (array!85447 (_ BitVec 32) List!29239) Bool)

(assert (=> b!1290368 (= res!856751 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29236))))

(declare-fun mapNonEmpty!52835 () Bool)

(declare-fun tp!100747 () Bool)

(assert (=> mapNonEmpty!52835 (= mapRes!52835 (and tp!100747 e!736874))))

(declare-fun mapValue!52835 () ValueCell!16193)

(declare-fun mapRest!52835 () (Array (_ BitVec 32) ValueCell!16193))

(declare-fun mapKey!52835 () (_ BitVec 32))

(assert (=> mapNonEmpty!52835 (= (arr!41219 _values!1445) (store mapRest!52835 mapKey!52835 mapValue!52835))))

(declare-fun b!1290369 () Bool)

(declare-fun res!856758 () Bool)

(assert (=> b!1290369 (=> (not res!856758) (not e!736870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290369 (= res!856758 (not (validKeyInArray!0 (select (arr!41220 _keys!1741) from!2144))))))

(declare-fun b!1290370 () Bool)

(declare-fun res!856759 () Bool)

(assert (=> b!1290370 (=> (not res!856759) (not e!736870))))

(assert (=> b!1290370 (= res!856759 (and (= (size!41770 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41771 _keys!1741) (size!41770 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!856752 () Bool)

(assert (=> start!109278 (=> (not res!856752) (not e!736870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109278 (= res!856752 (validMask!0 mask!2175))))

(assert (=> start!109278 e!736870))

(assert (=> start!109278 tp_is_empty!34183))

(assert (=> start!109278 true))

(declare-fun array_inv!31457 (array!85445) Bool)

(assert (=> start!109278 (and (array_inv!31457 _values!1445) e!736871)))

(declare-fun array_inv!31458 (array!85447) Bool)

(assert (=> start!109278 (array_inv!31458 _keys!1741)))

(assert (=> start!109278 tp!100748))

(declare-fun b!1290371 () Bool)

(declare-fun res!856753 () Bool)

(assert (=> b!1290371 (=> (not res!856753) (not e!736870))))

(assert (=> b!1290371 (= res!856753 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41771 _keys!1741))))))

(declare-fun b!1290372 () Bool)

(declare-fun res!856755 () Bool)

(assert (=> b!1290372 (=> (not res!856755) (not e!736870))))

(declare-fun getCurrentListMap!4922 (array!85447 array!85445 (_ BitVec 32) (_ BitVec 32) V!50681 V!50681 (_ BitVec 32) Int) ListLongMap!19721)

(assert (=> b!1290372 (= res!856755 (contains!8007 (getCurrentListMap!4922 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290373 () Bool)

(declare-fun res!856754 () Bool)

(assert (=> b!1290373 (=> (not res!856754) (not e!736870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85447 (_ BitVec 32)) Bool)

(assert (=> b!1290373 (= res!856754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109278 res!856752) b!1290370))

(assert (= (and b!1290370 res!856759) b!1290373))

(assert (= (and b!1290373 res!856754) b!1290368))

(assert (= (and b!1290368 res!856751) b!1290371))

(assert (= (and b!1290371 res!856753) b!1290372))

(assert (= (and b!1290372 res!856755) b!1290365))

(assert (= (and b!1290365 res!856756) b!1290369))

(assert (= (and b!1290369 res!856758) b!1290362))

(assert (= (and b!1290362 (not res!856757)) b!1290363))

(assert (= (and b!1290366 condMapEmpty!52835) mapIsEmpty!52835))

(assert (= (and b!1290366 (not condMapEmpty!52835)) mapNonEmpty!52835))

(get-info :version)

(assert (= (and mapNonEmpty!52835 ((_ is ValueCellFull!16193) mapValue!52835)) b!1290364))

(assert (= (and b!1290366 ((_ is ValueCellFull!16193) mapDefault!52835)) b!1290367))

(assert (= start!109278 b!1290366))

(declare-fun m!1183221 () Bool)

(assert (=> b!1290362 m!1183221))

(declare-fun m!1183223 () Bool)

(assert (=> b!1290362 m!1183223))

(declare-fun m!1183225 () Bool)

(assert (=> b!1290369 m!1183225))

(assert (=> b!1290369 m!1183225))

(declare-fun m!1183227 () Bool)

(assert (=> b!1290369 m!1183227))

(declare-fun m!1183229 () Bool)

(assert (=> b!1290363 m!1183229))

(assert (=> b!1290363 m!1183229))

(declare-fun m!1183231 () Bool)

(assert (=> b!1290363 m!1183231))

(declare-fun m!1183233 () Bool)

(assert (=> b!1290363 m!1183233))

(declare-fun m!1183235 () Bool)

(assert (=> b!1290363 m!1183235))

(declare-fun m!1183237 () Bool)

(assert (=> mapNonEmpty!52835 m!1183237))

(declare-fun m!1183239 () Bool)

(assert (=> start!109278 m!1183239))

(declare-fun m!1183241 () Bool)

(assert (=> start!109278 m!1183241))

(declare-fun m!1183243 () Bool)

(assert (=> start!109278 m!1183243))

(declare-fun m!1183245 () Bool)

(assert (=> b!1290368 m!1183245))

(declare-fun m!1183247 () Bool)

(assert (=> b!1290373 m!1183247))

(declare-fun m!1183249 () Bool)

(assert (=> b!1290372 m!1183249))

(assert (=> b!1290372 m!1183249))

(declare-fun m!1183251 () Bool)

(assert (=> b!1290372 m!1183251))

(check-sat (not b!1290368) (not b_next!28543) (not b!1290369) tp_is_empty!34183 b_and!46635 (not b!1290362) (not mapNonEmpty!52835) (not b!1290373) (not b!1290372) (not b!1290363) (not start!109278))
(check-sat b_and!46635 (not b_next!28543))
