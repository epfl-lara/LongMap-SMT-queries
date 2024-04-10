; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109338 () Bool)

(assert start!109338)

(declare-fun b_free!28827 () Bool)

(declare-fun b_next!28827 () Bool)

(assert (=> start!109338 (= b_free!28827 (not b_next!28827))))

(declare-fun tp!101599 () Bool)

(declare-fun b_and!46917 () Bool)

(assert (=> start!109338 (= tp!101599 b_and!46917)))

(declare-fun b!1294074 () Bool)

(declare-fun e!738487 () Bool)

(declare-fun tp_is_empty!34467 () Bool)

(assert (=> b!1294074 (= e!738487 tp_is_empty!34467)))

(declare-fun res!859974 () Bool)

(declare-fun e!738484 () Bool)

(assert (=> start!109338 (=> (not res!859974) (not e!738484))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109338 (= res!859974 (validMask!0 mask!2175))))

(assert (=> start!109338 e!738484))

(assert (=> start!109338 tp_is_empty!34467))

(assert (=> start!109338 true))

(declare-datatypes ((V!51059 0))(
  ( (V!51060 (val!17308 Int)) )
))
(declare-datatypes ((ValueCell!16335 0))(
  ( (ValueCellFull!16335 (v!19911 V!51059)) (EmptyCell!16335) )
))
(declare-datatypes ((array!85956 0))(
  ( (array!85957 (arr!41479 (Array (_ BitVec 32) ValueCell!16335)) (size!42029 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85956)

(declare-fun e!738486 () Bool)

(declare-fun array_inv!31417 (array!85956) Bool)

(assert (=> start!109338 (and (array_inv!31417 _values!1445) e!738486)))

(declare-datatypes ((array!85958 0))(
  ( (array!85959 (arr!41480 (Array (_ BitVec 32) (_ BitVec 64))) (size!42030 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85958)

(declare-fun array_inv!31418 (array!85958) Bool)

(assert (=> start!109338 (array_inv!31418 _keys!1741)))

(assert (=> start!109338 tp!101599))

(declare-fun b!1294075 () Bool)

(declare-fun res!859973 () Bool)

(assert (=> b!1294075 (=> (not res!859973) (not e!738484))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294075 (= res!859973 (and (= (size!42029 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42030 _keys!1741) (size!42029 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294076 () Bool)

(declare-fun res!859977 () Bool)

(assert (=> b!1294076 (=> (not res!859977) (not e!738484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85958 (_ BitVec 32)) Bool)

(assert (=> b!1294076 (= res!859977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294077 () Bool)

(declare-fun e!738485 () Bool)

(assert (=> b!1294077 (= e!738485 tp_is_empty!34467)))

(declare-fun b!1294078 () Bool)

(assert (=> b!1294078 (= e!738484 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22276 0))(
  ( (tuple2!22277 (_1!11149 (_ BitVec 64)) (_2!11149 V!51059)) )
))
(declare-datatypes ((List!29421 0))(
  ( (Nil!29418) (Cons!29417 (h!30626 tuple2!22276) (t!42985 List!29421)) )
))
(declare-datatypes ((ListLongMap!19933 0))(
  ( (ListLongMap!19934 (toList!9982 List!29421)) )
))
(declare-fun contains!8100 (ListLongMap!19933 (_ BitVec 64)) Bool)

(assert (=> b!1294078 (not (contains!8100 (ListLongMap!19934 Nil!29418) k0!1205))))

(declare-datatypes ((Unit!42856 0))(
  ( (Unit!42857) )
))
(declare-fun lt!579683 () Unit!42856)

(declare-fun emptyContainsNothing!149 ((_ BitVec 64)) Unit!42856)

(assert (=> b!1294078 (= lt!579683 (emptyContainsNothing!149 k0!1205))))

(declare-fun mapIsEmpty!53261 () Bool)

(declare-fun mapRes!53261 () Bool)

(assert (=> mapIsEmpty!53261 mapRes!53261))

(declare-fun b!1294079 () Bool)

(declare-fun res!859970 () Bool)

(assert (=> b!1294079 (=> (not res!859970) (not e!738484))))

(declare-fun minValue!1387 () V!51059)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!51059)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5022 (array!85958 array!85956 (_ BitVec 32) (_ BitVec 32) V!51059 V!51059 (_ BitVec 32) Int) ListLongMap!19933)

(assert (=> b!1294079 (= res!859970 (contains!8100 (getCurrentListMap!5022 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294080 () Bool)

(declare-fun res!859976 () Bool)

(assert (=> b!1294080 (=> (not res!859976) (not e!738484))))

(declare-datatypes ((List!29422 0))(
  ( (Nil!29419) (Cons!29418 (h!30627 (_ BitVec 64)) (t!42986 List!29422)) )
))
(declare-fun arrayNoDuplicates!0 (array!85958 (_ BitVec 32) List!29422) Bool)

(assert (=> b!1294080 (= res!859976 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29419))))

(declare-fun b!1294081 () Bool)

(declare-fun res!859972 () Bool)

(assert (=> b!1294081 (=> (not res!859972) (not e!738484))))

(assert (=> b!1294081 (= res!859972 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42030 _keys!1741))))))

(declare-fun b!1294082 () Bool)

(declare-fun res!859971 () Bool)

(assert (=> b!1294082 (=> (not res!859971) (not e!738484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294082 (= res!859971 (not (validKeyInArray!0 (select (arr!41480 _keys!1741) from!2144))))))

(declare-fun b!1294083 () Bool)

(declare-fun res!859975 () Bool)

(assert (=> b!1294083 (=> (not res!859975) (not e!738484))))

(assert (=> b!1294083 (= res!859975 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42030 _keys!1741))))))

(declare-fun b!1294084 () Bool)

(assert (=> b!1294084 (= e!738486 (and e!738487 mapRes!53261))))

(declare-fun condMapEmpty!53261 () Bool)

(declare-fun mapDefault!53261 () ValueCell!16335)

(assert (=> b!1294084 (= condMapEmpty!53261 (= (arr!41479 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16335)) mapDefault!53261)))))

(declare-fun mapNonEmpty!53261 () Bool)

(declare-fun tp!101600 () Bool)

(assert (=> mapNonEmpty!53261 (= mapRes!53261 (and tp!101600 e!738485))))

(declare-fun mapRest!53261 () (Array (_ BitVec 32) ValueCell!16335))

(declare-fun mapValue!53261 () ValueCell!16335)

(declare-fun mapKey!53261 () (_ BitVec 32))

(assert (=> mapNonEmpty!53261 (= (arr!41479 _values!1445) (store mapRest!53261 mapKey!53261 mapValue!53261))))

(assert (= (and start!109338 res!859974) b!1294075))

(assert (= (and b!1294075 res!859973) b!1294076))

(assert (= (and b!1294076 res!859977) b!1294080))

(assert (= (and b!1294080 res!859976) b!1294083))

(assert (= (and b!1294083 res!859975) b!1294079))

(assert (= (and b!1294079 res!859970) b!1294081))

(assert (= (and b!1294081 res!859972) b!1294082))

(assert (= (and b!1294082 res!859971) b!1294078))

(assert (= (and b!1294084 condMapEmpty!53261) mapIsEmpty!53261))

(assert (= (and b!1294084 (not condMapEmpty!53261)) mapNonEmpty!53261))

(get-info :version)

(assert (= (and mapNonEmpty!53261 ((_ is ValueCellFull!16335) mapValue!53261)) b!1294077))

(assert (= (and b!1294084 ((_ is ValueCellFull!16335) mapDefault!53261)) b!1294074))

(assert (= start!109338 b!1294084))

(declare-fun m!1186379 () Bool)

(assert (=> b!1294078 m!1186379))

(declare-fun m!1186381 () Bool)

(assert (=> b!1294078 m!1186381))

(declare-fun m!1186383 () Bool)

(assert (=> b!1294079 m!1186383))

(assert (=> b!1294079 m!1186383))

(declare-fun m!1186385 () Bool)

(assert (=> b!1294079 m!1186385))

(declare-fun m!1186387 () Bool)

(assert (=> start!109338 m!1186387))

(declare-fun m!1186389 () Bool)

(assert (=> start!109338 m!1186389))

(declare-fun m!1186391 () Bool)

(assert (=> start!109338 m!1186391))

(declare-fun m!1186393 () Bool)

(assert (=> b!1294082 m!1186393))

(assert (=> b!1294082 m!1186393))

(declare-fun m!1186395 () Bool)

(assert (=> b!1294082 m!1186395))

(declare-fun m!1186397 () Bool)

(assert (=> b!1294080 m!1186397))

(declare-fun m!1186399 () Bool)

(assert (=> mapNonEmpty!53261 m!1186399))

(declare-fun m!1186401 () Bool)

(assert (=> b!1294076 m!1186401))

(check-sat tp_is_empty!34467 (not b!1294076) (not b_next!28827) (not start!109338) (not b!1294082) (not b!1294078) b_and!46917 (not mapNonEmpty!53261) (not b!1294080) (not b!1294079))
(check-sat b_and!46917 (not b_next!28827))
