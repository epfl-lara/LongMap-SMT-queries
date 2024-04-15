; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109066 () Bool)

(assert start!109066)

(declare-fun b_free!28555 () Bool)

(declare-fun b_next!28555 () Bool)

(assert (=> start!109066 (= b_free!28555 (not b_next!28555))))

(declare-fun tp!100785 () Bool)

(declare-fun b_and!46627 () Bool)

(assert (=> start!109066 (= tp!100785 b_and!46627)))

(declare-fun b!1289209 () Bool)

(declare-fun res!856371 () Bool)

(declare-fun e!736102 () Bool)

(assert (=> b!1289209 (=> (not res!856371) (not e!736102))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85319 0))(
  ( (array!85320 (arr!41161 (Array (_ BitVec 32) (_ BitVec 64))) (size!41713 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85319)

(assert (=> b!1289209 (= res!856371 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41713 _keys!1741))))))

(declare-fun b!1289210 () Bool)

(declare-fun res!856374 () Bool)

(assert (=> b!1289210 (=> (not res!856374) (not e!736102))))

(declare-datatypes ((V!50697 0))(
  ( (V!50698 (val!17172 Int)) )
))
(declare-fun minValue!1387 () V!50697)

(declare-fun zeroValue!1387 () V!50697)

(declare-datatypes ((ValueCell!16199 0))(
  ( (ValueCellFull!16199 (v!19774 V!50697)) (EmptyCell!16199) )
))
(declare-datatypes ((array!85321 0))(
  ( (array!85322 (arr!41162 (Array (_ BitVec 32) ValueCell!16199)) (size!41714 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85321)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22102 0))(
  ( (tuple2!22103 (_1!11062 (_ BitVec 64)) (_2!11062 V!50697)) )
))
(declare-datatypes ((List!29266 0))(
  ( (Nil!29263) (Cons!29262 (h!30471 tuple2!22102) (t!42822 List!29266)) )
))
(declare-datatypes ((ListLongMap!19759 0))(
  ( (ListLongMap!19760 (toList!9895 List!29266)) )
))
(declare-fun contains!7943 (ListLongMap!19759 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4847 (array!85319 array!85321 (_ BitVec 32) (_ BitVec 32) V!50697 V!50697 (_ BitVec 32) Int) ListLongMap!19759)

(assert (=> b!1289210 (= res!856374 (contains!7943 (getCurrentListMap!4847 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289211 () Bool)

(declare-fun e!736105 () Bool)

(declare-fun e!736107 () Bool)

(declare-fun mapRes!52853 () Bool)

(assert (=> b!1289211 (= e!736105 (and e!736107 mapRes!52853))))

(declare-fun condMapEmpty!52853 () Bool)

(declare-fun mapDefault!52853 () ValueCell!16199)

(assert (=> b!1289211 (= condMapEmpty!52853 (= (arr!41162 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16199)) mapDefault!52853)))))

(declare-fun b!1289213 () Bool)

(declare-fun res!856370 () Bool)

(assert (=> b!1289213 (=> (not res!856370) (not e!736102))))

(assert (=> b!1289213 (= res!856370 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41713 _keys!1741))))))

(declare-fun mapIsEmpty!52853 () Bool)

(assert (=> mapIsEmpty!52853 mapRes!52853))

(declare-fun mapNonEmpty!52853 () Bool)

(declare-fun tp!100784 () Bool)

(declare-fun e!736106 () Bool)

(assert (=> mapNonEmpty!52853 (= mapRes!52853 (and tp!100784 e!736106))))

(declare-fun mapKey!52853 () (_ BitVec 32))

(declare-fun mapValue!52853 () ValueCell!16199)

(declare-fun mapRest!52853 () (Array (_ BitVec 32) ValueCell!16199))

(assert (=> mapNonEmpty!52853 (= (arr!41162 _values!1445) (store mapRest!52853 mapKey!52853 mapValue!52853))))

(declare-fun b!1289214 () Bool)

(declare-fun e!736104 () Bool)

(assert (=> b!1289214 (= e!736102 (not e!736104))))

(declare-fun res!856367 () Bool)

(assert (=> b!1289214 (=> res!856367 e!736104)))

(assert (=> b!1289214 (= res!856367 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289214 (not (contains!7943 (ListLongMap!19760 Nil!29263) k0!1205))))

(declare-datatypes ((Unit!42494 0))(
  ( (Unit!42495) )
))
(declare-fun lt!578026 () Unit!42494)

(declare-fun emptyContainsNothing!48 ((_ BitVec 64)) Unit!42494)

(assert (=> b!1289214 (= lt!578026 (emptyContainsNothing!48 k0!1205))))

(declare-fun b!1289215 () Bool)

(declare-fun tp_is_empty!34195 () Bool)

(assert (=> b!1289215 (= e!736107 tp_is_empty!34195)))

(declare-fun b!1289216 () Bool)

(declare-fun res!856366 () Bool)

(assert (=> b!1289216 (=> (not res!856366) (not e!736102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85319 (_ BitVec 32)) Bool)

(assert (=> b!1289216 (= res!856366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289217 () Bool)

(declare-fun res!856373 () Bool)

(assert (=> b!1289217 (=> (not res!856373) (not e!736102))))

(assert (=> b!1289217 (= res!856373 (and (= (size!41714 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41713 _keys!1741) (size!41714 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289218 () Bool)

(declare-fun res!856369 () Bool)

(assert (=> b!1289218 (=> (not res!856369) (not e!736102))))

(declare-datatypes ((List!29267 0))(
  ( (Nil!29264) (Cons!29263 (h!30472 (_ BitVec 64)) (t!42823 List!29267)) )
))
(declare-fun arrayNoDuplicates!0 (array!85319 (_ BitVec 32) List!29267) Bool)

(assert (=> b!1289218 (= res!856369 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29264))))

(declare-fun res!856372 () Bool)

(assert (=> start!109066 (=> (not res!856372) (not e!736102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109066 (= res!856372 (validMask!0 mask!2175))))

(assert (=> start!109066 e!736102))

(assert (=> start!109066 tp_is_empty!34195))

(assert (=> start!109066 true))

(declare-fun array_inv!31363 (array!85321) Bool)

(assert (=> start!109066 (and (array_inv!31363 _values!1445) e!736105)))

(declare-fun array_inv!31364 (array!85319) Bool)

(assert (=> start!109066 (array_inv!31364 _keys!1741)))

(assert (=> start!109066 tp!100785))

(declare-fun b!1289212 () Bool)

(assert (=> b!1289212 (= e!736106 tp_is_empty!34195)))

(declare-fun b!1289219 () Bool)

(assert (=> b!1289219 (= e!736104 true)))

(declare-fun lt!578025 () Bool)

(declare-fun lt!578024 () ListLongMap!19759)

(assert (=> b!1289219 (= lt!578025 (contains!7943 lt!578024 k0!1205))))

(declare-fun +!4383 (ListLongMap!19759 tuple2!22102) ListLongMap!19759)

(assert (=> b!1289219 (not (contains!7943 (+!4383 lt!578024 (tuple2!22103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578023 () Unit!42494)

(declare-fun addStillNotContains!360 (ListLongMap!19759 (_ BitVec 64) V!50697 (_ BitVec 64)) Unit!42494)

(assert (=> b!1289219 (= lt!578023 (addStillNotContains!360 lt!578024 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6014 (array!85319 array!85321 (_ BitVec 32) (_ BitVec 32) V!50697 V!50697 (_ BitVec 32) Int) ListLongMap!19759)

(assert (=> b!1289219 (= lt!578024 (getCurrentListMapNoExtraKeys!6014 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289220 () Bool)

(declare-fun res!856368 () Bool)

(assert (=> b!1289220 (=> (not res!856368) (not e!736102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289220 (= res!856368 (not (validKeyInArray!0 (select (arr!41161 _keys!1741) from!2144))))))

(assert (= (and start!109066 res!856372) b!1289217))

(assert (= (and b!1289217 res!856373) b!1289216))

(assert (= (and b!1289216 res!856366) b!1289218))

(assert (= (and b!1289218 res!856369) b!1289213))

(assert (= (and b!1289213 res!856370) b!1289210))

(assert (= (and b!1289210 res!856374) b!1289209))

(assert (= (and b!1289209 res!856371) b!1289220))

(assert (= (and b!1289220 res!856368) b!1289214))

(assert (= (and b!1289214 (not res!856367)) b!1289219))

(assert (= (and b!1289211 condMapEmpty!52853) mapIsEmpty!52853))

(assert (= (and b!1289211 (not condMapEmpty!52853)) mapNonEmpty!52853))

(get-info :version)

(assert (= (and mapNonEmpty!52853 ((_ is ValueCellFull!16199) mapValue!52853)) b!1289212))

(assert (= (and b!1289211 ((_ is ValueCellFull!16199) mapDefault!52853)) b!1289215))

(assert (= start!109066 b!1289211))

(declare-fun m!1181295 () Bool)

(assert (=> b!1289220 m!1181295))

(assert (=> b!1289220 m!1181295))

(declare-fun m!1181297 () Bool)

(assert (=> b!1289220 m!1181297))

(declare-fun m!1181299 () Bool)

(assert (=> b!1289210 m!1181299))

(assert (=> b!1289210 m!1181299))

(declare-fun m!1181301 () Bool)

(assert (=> b!1289210 m!1181301))

(declare-fun m!1181303 () Bool)

(assert (=> b!1289214 m!1181303))

(declare-fun m!1181305 () Bool)

(assert (=> b!1289214 m!1181305))

(declare-fun m!1181307 () Bool)

(assert (=> start!109066 m!1181307))

(declare-fun m!1181309 () Bool)

(assert (=> start!109066 m!1181309))

(declare-fun m!1181311 () Bool)

(assert (=> start!109066 m!1181311))

(declare-fun m!1181313 () Bool)

(assert (=> b!1289219 m!1181313))

(declare-fun m!1181315 () Bool)

(assert (=> b!1289219 m!1181315))

(assert (=> b!1289219 m!1181313))

(declare-fun m!1181317 () Bool)

(assert (=> b!1289219 m!1181317))

(declare-fun m!1181319 () Bool)

(assert (=> b!1289219 m!1181319))

(declare-fun m!1181321 () Bool)

(assert (=> b!1289219 m!1181321))

(declare-fun m!1181323 () Bool)

(assert (=> mapNonEmpty!52853 m!1181323))

(declare-fun m!1181325 () Bool)

(assert (=> b!1289216 m!1181325))

(declare-fun m!1181327 () Bool)

(assert (=> b!1289218 m!1181327))

(check-sat (not mapNonEmpty!52853) (not b!1289216) (not b!1289220) (not b!1289219) (not b!1289210) b_and!46627 tp_is_empty!34195 (not b!1289214) (not b!1289218) (not b_next!28555) (not start!109066))
(check-sat b_and!46627 (not b_next!28555))
