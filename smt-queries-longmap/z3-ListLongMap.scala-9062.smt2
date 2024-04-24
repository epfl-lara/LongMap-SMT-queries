; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109380 () Bool)

(assert start!109380)

(declare-fun b_free!28645 () Bool)

(declare-fun b_next!28645 () Bool)

(assert (=> start!109380 (= b_free!28645 (not b_next!28645))))

(declare-fun tp!101053 () Bool)

(declare-fun b_and!46737 () Bool)

(assert (=> start!109380 (= tp!101053 b_and!46737)))

(declare-fun mapNonEmpty!52988 () Bool)

(declare-fun mapRes!52988 () Bool)

(declare-fun tp!101054 () Bool)

(declare-fun e!737793 () Bool)

(assert (=> mapNonEmpty!52988 (= mapRes!52988 (and tp!101054 e!737793))))

(declare-fun mapKey!52988 () (_ BitVec 32))

(declare-datatypes ((V!50817 0))(
  ( (V!50818 (val!17217 Int)) )
))
(declare-datatypes ((ValueCell!16244 0))(
  ( (ValueCellFull!16244 (v!19815 V!50817)) (EmptyCell!16244) )
))
(declare-datatypes ((array!85645 0))(
  ( (array!85646 (arr!41319 (Array (_ BitVec 32) ValueCell!16244)) (size!41870 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85645)

(declare-fun mapRest!52988 () (Array (_ BitVec 32) ValueCell!16244))

(declare-fun mapValue!52988 () ValueCell!16244)

(assert (=> mapNonEmpty!52988 (= (arr!41319 _values!1445) (store mapRest!52988 mapKey!52988 mapValue!52988))))

(declare-fun b!1292198 () Bool)

(declare-fun res!858135 () Bool)

(declare-fun e!737791 () Bool)

(assert (=> b!1292198 (=> (not res!858135) (not e!737791))))

(declare-datatypes ((array!85647 0))(
  ( (array!85648 (arr!41320 (Array (_ BitVec 32) (_ BitVec 64))) (size!41871 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85647)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85647 (_ BitVec 32)) Bool)

(assert (=> b!1292198 (= res!858135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292199 () Bool)

(declare-fun res!858133 () Bool)

(assert (=> b!1292199 (=> (not res!858133) (not e!737791))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292199 (= res!858133 (not (validKeyInArray!0 (select (arr!41320 _keys!1741) from!2144))))))

(declare-fun b!1292200 () Bool)

(declare-fun res!858132 () Bool)

(assert (=> b!1292200 (=> (not res!858132) (not e!737791))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1292200 (= res!858132 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41871 _keys!1741))))))

(declare-fun b!1292201 () Bool)

(declare-fun e!737788 () Bool)

(declare-fun e!737789 () Bool)

(assert (=> b!1292201 (= e!737788 (and e!737789 mapRes!52988))))

(declare-fun condMapEmpty!52988 () Bool)

(declare-fun mapDefault!52988 () ValueCell!16244)

(assert (=> b!1292201 (= condMapEmpty!52988 (= (arr!41319 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16244)) mapDefault!52988)))))

(declare-fun b!1292202 () Bool)

(declare-fun e!737792 () Bool)

(assert (=> b!1292202 (= e!737792 true)))

(assert (=> b!1292202 false))

(declare-fun minValue!1387 () V!50817)

(declare-datatypes ((Unit!42691 0))(
  ( (Unit!42692) )
))
(declare-fun lt!579338 () Unit!42691)

(declare-datatypes ((tuple2!22148 0))(
  ( (tuple2!22149 (_1!11085 (_ BitVec 64)) (_2!11085 V!50817)) )
))
(declare-datatypes ((List!29320 0))(
  ( (Nil!29317) (Cons!29316 (h!30534 tuple2!22148) (t!42876 List!29320)) )
))
(declare-datatypes ((ListLongMap!19813 0))(
  ( (ListLongMap!19814 (toList!9922 List!29320)) )
))
(declare-fun lt!579341 () ListLongMap!19813)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!49 ((_ BitVec 64) (_ BitVec 64) V!50817 ListLongMap!19813) Unit!42691)

(assert (=> b!1292202 (= lt!579338 (lemmaInListMapAfterAddingDiffThenInBefore!49 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579341))))

(declare-fun lt!579340 () ListLongMap!19813)

(declare-fun contains!8053 (ListLongMap!19813 (_ BitVec 64)) Bool)

(declare-fun +!4420 (ListLongMap!19813 tuple2!22148) ListLongMap!19813)

(assert (=> b!1292202 (not (contains!8053 (+!4420 lt!579340 (tuple2!22149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579342 () Unit!42691)

(declare-fun addStillNotContains!396 (ListLongMap!19813 (_ BitVec 64) V!50817 (_ BitVec 64)) Unit!42691)

(assert (=> b!1292202 (= lt!579342 (addStillNotContains!396 lt!579340 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1292202 (not (contains!8053 lt!579341 k0!1205))))

(declare-fun zeroValue!1387 () V!50817)

(assert (=> b!1292202 (= lt!579341 (+!4420 lt!579340 (tuple2!22149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579339 () Unit!42691)

(assert (=> b!1292202 (= lt!579339 (addStillNotContains!396 lt!579340 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6058 (array!85647 array!85645 (_ BitVec 32) (_ BitVec 32) V!50817 V!50817 (_ BitVec 32) Int) ListLongMap!19813)

(assert (=> b!1292202 (= lt!579340 (getCurrentListMapNoExtraKeys!6058 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1292203 () Bool)

(assert (=> b!1292203 (= e!737791 (not e!737792))))

(declare-fun res!858131 () Bool)

(assert (=> b!1292203 (=> res!858131 e!737792)))

(assert (=> b!1292203 (= res!858131 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1292203 (not (contains!8053 (ListLongMap!19814 Nil!29317) k0!1205))))

(declare-fun lt!579337 () Unit!42691)

(declare-fun emptyContainsNothing!94 ((_ BitVec 64)) Unit!42691)

(assert (=> b!1292203 (= lt!579337 (emptyContainsNothing!94 k0!1205))))

(declare-fun res!858136 () Bool)

(assert (=> start!109380 (=> (not res!858136) (not e!737791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109380 (= res!858136 (validMask!0 mask!2175))))

(assert (=> start!109380 e!737791))

(declare-fun tp_is_empty!34285 () Bool)

(assert (=> start!109380 tp_is_empty!34285))

(assert (=> start!109380 true))

(declare-fun array_inv!31541 (array!85645) Bool)

(assert (=> start!109380 (and (array_inv!31541 _values!1445) e!737788)))

(declare-fun array_inv!31542 (array!85647) Bool)

(assert (=> start!109380 (array_inv!31542 _keys!1741)))

(assert (=> start!109380 tp!101053))

(declare-fun b!1292204 () Bool)

(declare-fun res!858134 () Bool)

(assert (=> b!1292204 (=> (not res!858134) (not e!737791))))

(declare-datatypes ((List!29321 0))(
  ( (Nil!29318) (Cons!29317 (h!30535 (_ BitVec 64)) (t!42877 List!29321)) )
))
(declare-fun arrayNoDuplicates!0 (array!85647 (_ BitVec 32) List!29321) Bool)

(assert (=> b!1292204 (= res!858134 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29318))))

(declare-fun b!1292205 () Bool)

(assert (=> b!1292205 (= e!737793 tp_is_empty!34285)))

(declare-fun b!1292206 () Bool)

(declare-fun res!858128 () Bool)

(assert (=> b!1292206 (=> (not res!858128) (not e!737791))))

(assert (=> b!1292206 (= res!858128 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41871 _keys!1741))))))

(declare-fun b!1292207 () Bool)

(declare-fun res!858130 () Bool)

(assert (=> b!1292207 (=> (not res!858130) (not e!737791))))

(assert (=> b!1292207 (= res!858130 (and (= (size!41870 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41871 _keys!1741) (size!41870 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52988 () Bool)

(assert (=> mapIsEmpty!52988 mapRes!52988))

(declare-fun b!1292208 () Bool)

(assert (=> b!1292208 (= e!737789 tp_is_empty!34285)))

(declare-fun b!1292209 () Bool)

(declare-fun res!858129 () Bool)

(assert (=> b!1292209 (=> (not res!858129) (not e!737791))))

(declare-fun getCurrentListMap!4959 (array!85647 array!85645 (_ BitVec 32) (_ BitVec 32) V!50817 V!50817 (_ BitVec 32) Int) ListLongMap!19813)

(assert (=> b!1292209 (= res!858129 (contains!8053 (getCurrentListMap!4959 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109380 res!858136) b!1292207))

(assert (= (and b!1292207 res!858130) b!1292198))

(assert (= (and b!1292198 res!858135) b!1292204))

(assert (= (and b!1292204 res!858134) b!1292206))

(assert (= (and b!1292206 res!858128) b!1292209))

(assert (= (and b!1292209 res!858129) b!1292200))

(assert (= (and b!1292200 res!858132) b!1292199))

(assert (= (and b!1292199 res!858133) b!1292203))

(assert (= (and b!1292203 (not res!858131)) b!1292202))

(assert (= (and b!1292201 condMapEmpty!52988) mapIsEmpty!52988))

(assert (= (and b!1292201 (not condMapEmpty!52988)) mapNonEmpty!52988))

(get-info :version)

(assert (= (and mapNonEmpty!52988 ((_ is ValueCellFull!16244) mapValue!52988)) b!1292205))

(assert (= (and b!1292201 ((_ is ValueCellFull!16244) mapDefault!52988)) b!1292208))

(assert (= start!109380 b!1292201))

(declare-fun m!1185153 () Bool)

(assert (=> start!109380 m!1185153))

(declare-fun m!1185155 () Bool)

(assert (=> start!109380 m!1185155))

(declare-fun m!1185157 () Bool)

(assert (=> start!109380 m!1185157))

(declare-fun m!1185159 () Bool)

(assert (=> b!1292209 m!1185159))

(assert (=> b!1292209 m!1185159))

(declare-fun m!1185161 () Bool)

(assert (=> b!1292209 m!1185161))

(declare-fun m!1185163 () Bool)

(assert (=> b!1292204 m!1185163))

(declare-fun m!1185165 () Bool)

(assert (=> b!1292199 m!1185165))

(assert (=> b!1292199 m!1185165))

(declare-fun m!1185167 () Bool)

(assert (=> b!1292199 m!1185167))

(declare-fun m!1185169 () Bool)

(assert (=> b!1292202 m!1185169))

(declare-fun m!1185171 () Bool)

(assert (=> b!1292202 m!1185171))

(declare-fun m!1185173 () Bool)

(assert (=> b!1292202 m!1185173))

(declare-fun m!1185175 () Bool)

(assert (=> b!1292202 m!1185175))

(declare-fun m!1185177 () Bool)

(assert (=> b!1292202 m!1185177))

(declare-fun m!1185179 () Bool)

(assert (=> b!1292202 m!1185179))

(declare-fun m!1185181 () Bool)

(assert (=> b!1292202 m!1185181))

(assert (=> b!1292202 m!1185171))

(declare-fun m!1185183 () Bool)

(assert (=> b!1292202 m!1185183))

(declare-fun m!1185185 () Bool)

(assert (=> b!1292198 m!1185185))

(declare-fun m!1185187 () Bool)

(assert (=> mapNonEmpty!52988 m!1185187))

(declare-fun m!1185189 () Bool)

(assert (=> b!1292203 m!1185189))

(declare-fun m!1185191 () Bool)

(assert (=> b!1292203 m!1185191))

(check-sat (not b!1292198) (not b!1292199) (not b!1292203) b_and!46737 (not b!1292202) tp_is_empty!34285 (not mapNonEmpty!52988) (not start!109380) (not b!1292209) (not b!1292204) (not b_next!28645))
(check-sat b_and!46737 (not b_next!28645))
