; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109120 () Bool)

(assert start!109120)

(declare-fun b_free!28609 () Bool)

(declare-fun b_next!28609 () Bool)

(assert (=> start!109120 (= b_free!28609 (not b_next!28609))))

(declare-fun tp!100947 () Bool)

(declare-fun b_and!46681 () Bool)

(assert (=> start!109120 (= tp!100947 b_and!46681)))

(declare-fun b!1290181 () Bool)

(declare-fun res!857103 () Bool)

(declare-fun e!736592 () Bool)

(assert (=> b!1290181 (=> (not res!857103) (not e!736592))))

(declare-datatypes ((array!85427 0))(
  ( (array!85428 (arr!41215 (Array (_ BitVec 32) (_ BitVec 64))) (size!41767 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85427)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290181 (= res!857103 (not (validKeyInArray!0 (select (arr!41215 _keys!1741) from!2144))))))

(declare-fun b!1290182 () Bool)

(declare-fun e!736590 () Bool)

(declare-fun e!736591 () Bool)

(declare-fun mapRes!52934 () Bool)

(assert (=> b!1290182 (= e!736590 (and e!736591 mapRes!52934))))

(declare-fun condMapEmpty!52934 () Bool)

(declare-datatypes ((V!50769 0))(
  ( (V!50770 (val!17199 Int)) )
))
(declare-datatypes ((ValueCell!16226 0))(
  ( (ValueCellFull!16226 (v!19801 V!50769)) (EmptyCell!16226) )
))
(declare-datatypes ((array!85429 0))(
  ( (array!85430 (arr!41216 (Array (_ BitVec 32) ValueCell!16226)) (size!41768 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85429)

(declare-fun mapDefault!52934 () ValueCell!16226)

(assert (=> b!1290182 (= condMapEmpty!52934 (= (arr!41216 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16226)) mapDefault!52934)))))

(declare-fun res!857095 () Bool)

(assert (=> start!109120 (=> (not res!857095) (not e!736592))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109120 (= res!857095 (validMask!0 mask!2175))))

(assert (=> start!109120 e!736592))

(declare-fun tp_is_empty!34249 () Bool)

(assert (=> start!109120 tp_is_empty!34249))

(assert (=> start!109120 true))

(declare-fun array_inv!31403 (array!85429) Bool)

(assert (=> start!109120 (and (array_inv!31403 _values!1445) e!736590)))

(declare-fun array_inv!31404 (array!85427) Bool)

(assert (=> start!109120 (array_inv!31404 _keys!1741)))

(assert (=> start!109120 tp!100947))

(declare-fun b!1290183 () Bool)

(declare-fun res!857097 () Bool)

(assert (=> b!1290183 (=> (not res!857097) (not e!736592))))

(declare-datatypes ((List!29309 0))(
  ( (Nil!29306) (Cons!29305 (h!30514 (_ BitVec 64)) (t!42865 List!29309)) )
))
(declare-fun arrayNoDuplicates!0 (array!85427 (_ BitVec 32) List!29309) Bool)

(assert (=> b!1290183 (= res!857097 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29306))))

(declare-fun b!1290184 () Bool)

(assert (=> b!1290184 (= e!736591 tp_is_empty!34249)))

(declare-fun b!1290185 () Bool)

(declare-fun e!736588 () Bool)

(assert (=> b!1290185 (= e!736588 (bvsle from!2144 (size!41767 _keys!1741)))))

(declare-datatypes ((tuple2!22150 0))(
  ( (tuple2!22151 (_1!11086 (_ BitVec 64)) (_2!11086 V!50769)) )
))
(declare-datatypes ((List!29310 0))(
  ( (Nil!29307) (Cons!29306 (h!30515 tuple2!22150) (t!42866 List!29310)) )
))
(declare-datatypes ((ListLongMap!19807 0))(
  ( (ListLongMap!19808 (toList!9919 List!29310)) )
))
(declare-fun lt!578348 () ListLongMap!19807)

(declare-fun minValue!1387 () V!50769)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7967 (ListLongMap!19807 (_ BitVec 64)) Bool)

(declare-fun +!4398 (ListLongMap!19807 tuple2!22150) ListLongMap!19807)

(assert (=> b!1290185 (not (contains!7967 (+!4398 lt!578348 (tuple2!22151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42536 0))(
  ( (Unit!42537) )
))
(declare-fun lt!578347 () Unit!42536)

(declare-fun addStillNotContains!375 (ListLongMap!19807 (_ BitVec 64) V!50769 (_ BitVec 64)) Unit!42536)

(assert (=> b!1290185 (= lt!578347 (addStillNotContains!375 lt!578348 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50769)

(assert (=> b!1290185 (not (contains!7967 (+!4398 lt!578348 (tuple2!22151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578349 () Unit!42536)

(assert (=> b!1290185 (= lt!578349 (addStillNotContains!375 lt!578348 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6029 (array!85427 array!85429 (_ BitVec 32) (_ BitVec 32) V!50769 V!50769 (_ BitVec 32) Int) ListLongMap!19807)

(assert (=> b!1290185 (= lt!578348 (getCurrentListMapNoExtraKeys!6029 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!52934 () Bool)

(declare-fun tp!100946 () Bool)

(declare-fun e!736589 () Bool)

(assert (=> mapNonEmpty!52934 (= mapRes!52934 (and tp!100946 e!736589))))

(declare-fun mapRest!52934 () (Array (_ BitVec 32) ValueCell!16226))

(declare-fun mapValue!52934 () ValueCell!16226)

(declare-fun mapKey!52934 () (_ BitVec 32))

(assert (=> mapNonEmpty!52934 (= (arr!41216 _values!1445) (store mapRest!52934 mapKey!52934 mapValue!52934))))

(declare-fun b!1290186 () Bool)

(declare-fun res!857100 () Bool)

(assert (=> b!1290186 (=> (not res!857100) (not e!736592))))

(assert (=> b!1290186 (= res!857100 (and (= (size!41768 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41767 _keys!1741) (size!41768 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290187 () Bool)

(declare-fun res!857096 () Bool)

(assert (=> b!1290187 (=> (not res!857096) (not e!736592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85427 (_ BitVec 32)) Bool)

(assert (=> b!1290187 (= res!857096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290188 () Bool)

(assert (=> b!1290188 (= e!736592 (not e!736588))))

(declare-fun res!857102 () Bool)

(assert (=> b!1290188 (=> res!857102 e!736588)))

(assert (=> b!1290188 (= res!857102 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290188 (not (contains!7967 (ListLongMap!19808 Nil!29307) k0!1205))))

(declare-fun lt!578350 () Unit!42536)

(declare-fun emptyContainsNothing!68 ((_ BitVec 64)) Unit!42536)

(assert (=> b!1290188 (= lt!578350 (emptyContainsNothing!68 k0!1205))))

(declare-fun b!1290189 () Bool)

(declare-fun res!857098 () Bool)

(assert (=> b!1290189 (=> (not res!857098) (not e!736592))))

(declare-fun getCurrentListMap!4869 (array!85427 array!85429 (_ BitVec 32) (_ BitVec 32) V!50769 V!50769 (_ BitVec 32) Int) ListLongMap!19807)

(assert (=> b!1290189 (= res!857098 (contains!7967 (getCurrentListMap!4869 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290190 () Bool)

(declare-fun res!857101 () Bool)

(assert (=> b!1290190 (=> (not res!857101) (not e!736592))))

(assert (=> b!1290190 (= res!857101 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41767 _keys!1741))))))

(declare-fun b!1290191 () Bool)

(assert (=> b!1290191 (= e!736589 tp_is_empty!34249)))

(declare-fun b!1290192 () Bool)

(declare-fun res!857099 () Bool)

(assert (=> b!1290192 (=> (not res!857099) (not e!736592))))

(assert (=> b!1290192 (= res!857099 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41767 _keys!1741))))))

(declare-fun mapIsEmpty!52934 () Bool)

(assert (=> mapIsEmpty!52934 mapRes!52934))

(assert (= (and start!109120 res!857095) b!1290186))

(assert (= (and b!1290186 res!857100) b!1290187))

(assert (= (and b!1290187 res!857096) b!1290183))

(assert (= (and b!1290183 res!857097) b!1290190))

(assert (= (and b!1290190 res!857101) b!1290189))

(assert (= (and b!1290189 res!857098) b!1290192))

(assert (= (and b!1290192 res!857099) b!1290181))

(assert (= (and b!1290181 res!857103) b!1290188))

(assert (= (and b!1290188 (not res!857102)) b!1290185))

(assert (= (and b!1290182 condMapEmpty!52934) mapIsEmpty!52934))

(assert (= (and b!1290182 (not condMapEmpty!52934)) mapNonEmpty!52934))

(get-info :version)

(assert (= (and mapNonEmpty!52934 ((_ is ValueCellFull!16226) mapValue!52934)) b!1290191))

(assert (= (and b!1290182 ((_ is ValueCellFull!16226) mapDefault!52934)) b!1290184))

(assert (= start!109120 b!1290182))

(declare-fun m!1182309 () Bool)

(assert (=> b!1290188 m!1182309))

(declare-fun m!1182311 () Bool)

(assert (=> b!1290188 m!1182311))

(declare-fun m!1182313 () Bool)

(assert (=> b!1290189 m!1182313))

(assert (=> b!1290189 m!1182313))

(declare-fun m!1182315 () Bool)

(assert (=> b!1290189 m!1182315))

(declare-fun m!1182317 () Bool)

(assert (=> b!1290183 m!1182317))

(declare-fun m!1182319 () Bool)

(assert (=> b!1290187 m!1182319))

(declare-fun m!1182321 () Bool)

(assert (=> b!1290181 m!1182321))

(assert (=> b!1290181 m!1182321))

(declare-fun m!1182323 () Bool)

(assert (=> b!1290181 m!1182323))

(declare-fun m!1182325 () Bool)

(assert (=> b!1290185 m!1182325))

(declare-fun m!1182327 () Bool)

(assert (=> b!1290185 m!1182327))

(declare-fun m!1182329 () Bool)

(assert (=> b!1290185 m!1182329))

(assert (=> b!1290185 m!1182325))

(declare-fun m!1182331 () Bool)

(assert (=> b!1290185 m!1182331))

(declare-fun m!1182333 () Bool)

(assert (=> b!1290185 m!1182333))

(assert (=> b!1290185 m!1182333))

(declare-fun m!1182335 () Bool)

(assert (=> b!1290185 m!1182335))

(declare-fun m!1182337 () Bool)

(assert (=> b!1290185 m!1182337))

(declare-fun m!1182339 () Bool)

(assert (=> mapNonEmpty!52934 m!1182339))

(declare-fun m!1182341 () Bool)

(assert (=> start!109120 m!1182341))

(declare-fun m!1182343 () Bool)

(assert (=> start!109120 m!1182343))

(declare-fun m!1182345 () Bool)

(assert (=> start!109120 m!1182345))

(check-sat (not b!1290189) (not b!1290188) (not b!1290185) (not b!1290181) (not b!1290183) (not b_next!28609) tp_is_empty!34249 (not start!109120) b_and!46681 (not mapNonEmpty!52934) (not b!1290187))
(check-sat b_and!46681 (not b_next!28609))
