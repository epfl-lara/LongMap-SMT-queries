; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109294 () Bool)

(assert start!109294)

(declare-fun b_free!28783 () Bool)

(declare-fun b_next!28783 () Bool)

(assert (=> start!109294 (= b_free!28783 (not b_next!28783))))

(declare-fun tp!101468 () Bool)

(declare-fun b_and!46855 () Bool)

(assert (=> start!109294 (= tp!101468 b_and!46855)))

(declare-fun b!1293232 () Bool)

(declare-fun res!859367 () Bool)

(declare-fun e!738076 () Bool)

(assert (=> b!1293232 (=> (not res!859367) (not e!738076))))

(declare-datatypes ((array!85761 0))(
  ( (array!85762 (arr!41382 (Array (_ BitVec 32) (_ BitVec 64))) (size!41934 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85761)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85761 (_ BitVec 32)) Bool)

(assert (=> b!1293232 (= res!859367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293233 () Bool)

(declare-fun res!859364 () Bool)

(assert (=> b!1293233 (=> (not res!859364) (not e!738076))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1293233 (= res!859364 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41934 _keys!1741))))))

(declare-fun b!1293234 () Bool)

(declare-fun e!738073 () Bool)

(declare-fun tp_is_empty!34423 () Bool)

(assert (=> b!1293234 (= e!738073 tp_is_empty!34423)))

(declare-fun b!1293235 () Bool)

(declare-fun e!738074 () Bool)

(assert (=> b!1293235 (= e!738076 (not e!738074))))

(declare-fun res!859365 () Bool)

(assert (=> b!1293235 (=> res!859365 e!738074)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293235 (= res!859365 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!51001 0))(
  ( (V!51002 (val!17286 Int)) )
))
(declare-datatypes ((tuple2!22282 0))(
  ( (tuple2!22283 (_1!11152 (_ BitVec 64)) (_2!11152 V!51001)) )
))
(declare-datatypes ((List!29432 0))(
  ( (Nil!29429) (Cons!29428 (h!30637 tuple2!22282) (t!42988 List!29432)) )
))
(declare-datatypes ((ListLongMap!19939 0))(
  ( (ListLongMap!19940 (toList!9985 List!29432)) )
))
(declare-fun contains!8033 (ListLongMap!19939 (_ BitVec 64)) Bool)

(assert (=> b!1293235 (not (contains!8033 (ListLongMap!19940 Nil!29429) k0!1205))))

(declare-datatypes ((Unit!42650 0))(
  ( (Unit!42651) )
))
(declare-fun lt!579336 () Unit!42650)

(declare-fun emptyContainsNothing!121 ((_ BitVec 64)) Unit!42650)

(assert (=> b!1293235 (= lt!579336 (emptyContainsNothing!121 k0!1205))))

(declare-fun b!1293236 () Bool)

(declare-fun res!859371 () Bool)

(assert (=> b!1293236 (=> (not res!859371) (not e!738076))))

(declare-datatypes ((ValueCell!16313 0))(
  ( (ValueCellFull!16313 (v!19888 V!51001)) (EmptyCell!16313) )
))
(declare-datatypes ((array!85763 0))(
  ( (array!85764 (arr!41383 (Array (_ BitVec 32) ValueCell!16313)) (size!41935 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85763)

(assert (=> b!1293236 (= res!859371 (and (= (size!41935 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41934 _keys!1741) (size!41935 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293237 () Bool)

(assert (=> b!1293237 (= e!738074 true)))

(declare-fun lt!579335 () ListLongMap!19939)

(declare-fun zeroValue!1387 () V!51001)

(declare-fun +!4433 (ListLongMap!19939 tuple2!22282) ListLongMap!19939)

(assert (=> b!1293237 (not (contains!8033 (+!4433 lt!579335 (tuple2!22283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579337 () Unit!42650)

(declare-fun addStillNotContains!410 (ListLongMap!19939 (_ BitVec 64) V!51001 (_ BitVec 64)) Unit!42650)

(assert (=> b!1293237 (= lt!579337 (addStillNotContains!410 lt!579335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!51001)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6065 (array!85761 array!85763 (_ BitVec 32) (_ BitVec 32) V!51001 V!51001 (_ BitVec 32) Int) ListLongMap!19939)

(assert (=> b!1293237 (= lt!579335 (getCurrentListMapNoExtraKeys!6065 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293238 () Bool)

(declare-fun res!859369 () Bool)

(assert (=> b!1293238 (=> (not res!859369) (not e!738076))))

(declare-fun getCurrentListMap!4923 (array!85761 array!85763 (_ BitVec 32) (_ BitVec 32) V!51001 V!51001 (_ BitVec 32) Int) ListLongMap!19939)

(assert (=> b!1293238 (= res!859369 (contains!8033 (getCurrentListMap!4923 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293239 () Bool)

(declare-fun res!859368 () Bool)

(assert (=> b!1293239 (=> (not res!859368) (not e!738076))))

(assert (=> b!1293239 (= res!859368 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41934 _keys!1741))))))

(declare-fun res!859370 () Bool)

(assert (=> start!109294 (=> (not res!859370) (not e!738076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109294 (= res!859370 (validMask!0 mask!2175))))

(assert (=> start!109294 e!738076))

(assert (=> start!109294 tp_is_empty!34423))

(assert (=> start!109294 true))

(declare-fun e!738075 () Bool)

(declare-fun array_inv!31513 (array!85763) Bool)

(assert (=> start!109294 (and (array_inv!31513 _values!1445) e!738075)))

(declare-fun array_inv!31514 (array!85761) Bool)

(assert (=> start!109294 (array_inv!31514 _keys!1741)))

(assert (=> start!109294 tp!101468))

(declare-fun b!1293240 () Bool)

(declare-fun res!859366 () Bool)

(assert (=> b!1293240 (=> (not res!859366) (not e!738076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293240 (= res!859366 (not (validKeyInArray!0 (select (arr!41382 _keys!1741) from!2144))))))

(declare-fun b!1293241 () Bool)

(declare-fun e!738078 () Bool)

(assert (=> b!1293241 (= e!738078 tp_is_empty!34423)))

(declare-fun mapNonEmpty!53195 () Bool)

(declare-fun mapRes!53195 () Bool)

(declare-fun tp!101469 () Bool)

(assert (=> mapNonEmpty!53195 (= mapRes!53195 (and tp!101469 e!738073))))

(declare-fun mapKey!53195 () (_ BitVec 32))

(declare-fun mapRest!53195 () (Array (_ BitVec 32) ValueCell!16313))

(declare-fun mapValue!53195 () ValueCell!16313)

(assert (=> mapNonEmpty!53195 (= (arr!41383 _values!1445) (store mapRest!53195 mapKey!53195 mapValue!53195))))

(declare-fun b!1293242 () Bool)

(declare-fun res!859363 () Bool)

(assert (=> b!1293242 (=> (not res!859363) (not e!738076))))

(declare-datatypes ((List!29433 0))(
  ( (Nil!29430) (Cons!29429 (h!30638 (_ BitVec 64)) (t!42989 List!29433)) )
))
(declare-fun arrayNoDuplicates!0 (array!85761 (_ BitVec 32) List!29433) Bool)

(assert (=> b!1293242 (= res!859363 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29430))))

(declare-fun b!1293243 () Bool)

(assert (=> b!1293243 (= e!738075 (and e!738078 mapRes!53195))))

(declare-fun condMapEmpty!53195 () Bool)

(declare-fun mapDefault!53195 () ValueCell!16313)

(assert (=> b!1293243 (= condMapEmpty!53195 (= (arr!41383 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16313)) mapDefault!53195)))))

(declare-fun mapIsEmpty!53195 () Bool)

(assert (=> mapIsEmpty!53195 mapRes!53195))

(assert (= (and start!109294 res!859370) b!1293236))

(assert (= (and b!1293236 res!859371) b!1293232))

(assert (= (and b!1293232 res!859367) b!1293242))

(assert (= (and b!1293242 res!859363) b!1293239))

(assert (= (and b!1293239 res!859368) b!1293238))

(assert (= (and b!1293238 res!859369) b!1293233))

(assert (= (and b!1293233 res!859364) b!1293240))

(assert (= (and b!1293240 res!859366) b!1293235))

(assert (= (and b!1293235 (not res!859365)) b!1293237))

(assert (= (and b!1293243 condMapEmpty!53195) mapIsEmpty!53195))

(assert (= (and b!1293243 (not condMapEmpty!53195)) mapNonEmpty!53195))

(get-info :version)

(assert (= (and mapNonEmpty!53195 ((_ is ValueCellFull!16313) mapValue!53195)) b!1293234))

(assert (= (and b!1293243 ((_ is ValueCellFull!16313) mapDefault!53195)) b!1293241))

(assert (= start!109294 b!1293243))

(declare-fun m!1185207 () Bool)

(assert (=> b!1293242 m!1185207))

(declare-fun m!1185209 () Bool)

(assert (=> mapNonEmpty!53195 m!1185209))

(declare-fun m!1185211 () Bool)

(assert (=> b!1293235 m!1185211))

(declare-fun m!1185213 () Bool)

(assert (=> b!1293235 m!1185213))

(declare-fun m!1185215 () Bool)

(assert (=> b!1293238 m!1185215))

(assert (=> b!1293238 m!1185215))

(declare-fun m!1185217 () Bool)

(assert (=> b!1293238 m!1185217))

(declare-fun m!1185219 () Bool)

(assert (=> start!109294 m!1185219))

(declare-fun m!1185221 () Bool)

(assert (=> start!109294 m!1185221))

(declare-fun m!1185223 () Bool)

(assert (=> start!109294 m!1185223))

(declare-fun m!1185225 () Bool)

(assert (=> b!1293240 m!1185225))

(assert (=> b!1293240 m!1185225))

(declare-fun m!1185227 () Bool)

(assert (=> b!1293240 m!1185227))

(declare-fun m!1185229 () Bool)

(assert (=> b!1293232 m!1185229))

(declare-fun m!1185231 () Bool)

(assert (=> b!1293237 m!1185231))

(assert (=> b!1293237 m!1185231))

(declare-fun m!1185233 () Bool)

(assert (=> b!1293237 m!1185233))

(declare-fun m!1185235 () Bool)

(assert (=> b!1293237 m!1185235))

(declare-fun m!1185237 () Bool)

(assert (=> b!1293237 m!1185237))

(check-sat (not b!1293235) (not b_next!28783) (not b!1293237) (not mapNonEmpty!53195) b_and!46855 (not start!109294) (not b!1293232) (not b!1293240) (not b!1293238) (not b!1293242) tp_is_empty!34423)
(check-sat b_and!46855 (not b_next!28783))
