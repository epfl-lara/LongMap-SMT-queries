; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108948 () Bool)

(assert start!108948)

(declare-fun b_free!28237 () Bool)

(declare-fun b_next!28237 () Bool)

(assert (=> start!108948 (= b_free!28237 (not b_next!28237))))

(declare-fun tp!99827 () Bool)

(declare-fun b_and!46305 () Bool)

(assert (=> start!108948 (= tp!99827 b_and!46305)))

(declare-fun b!1285009 () Bool)

(declare-fun res!853271 () Bool)

(declare-fun e!734183 () Bool)

(assert (=> b!1285009 (=> (not res!853271) (not e!734183))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50273 0))(
  ( (V!50274 (val!17013 Int)) )
))
(declare-datatypes ((ValueCell!16040 0))(
  ( (ValueCellFull!16040 (v!19610 V!50273)) (EmptyCell!16040) )
))
(declare-datatypes ((array!84843 0))(
  ( (array!84844 (arr!40919 (Array (_ BitVec 32) ValueCell!16040)) (size!41470 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84843)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84845 0))(
  ( (array!84846 (arr!40920 (Array (_ BitVec 32) (_ BitVec 64))) (size!41471 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84845)

(assert (=> b!1285009 (= res!853271 (and (= (size!41470 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41471 _keys!1741) (size!41470 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52373 () Bool)

(declare-fun mapRes!52373 () Bool)

(declare-fun tp!99826 () Bool)

(declare-fun e!734184 () Bool)

(assert (=> mapNonEmpty!52373 (= mapRes!52373 (and tp!99826 e!734184))))

(declare-fun mapKey!52373 () (_ BitVec 32))

(declare-fun mapValue!52373 () ValueCell!16040)

(declare-fun mapRest!52373 () (Array (_ BitVec 32) ValueCell!16040))

(assert (=> mapNonEmpty!52373 (= (arr!40919 _values!1445) (store mapRest!52373 mapKey!52373 mapValue!52373))))

(declare-fun b!1285011 () Bool)

(declare-fun e!734185 () Bool)

(declare-fun e!734187 () Bool)

(assert (=> b!1285011 (= e!734185 (and e!734187 mapRes!52373))))

(declare-fun condMapEmpty!52373 () Bool)

(declare-fun mapDefault!52373 () ValueCell!16040)

(assert (=> b!1285011 (= condMapEmpty!52373 (= (arr!40919 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16040)) mapDefault!52373)))))

(declare-fun b!1285012 () Bool)

(declare-fun res!853270 () Bool)

(assert (=> b!1285012 (=> (not res!853270) (not e!734183))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1285012 (= res!853270 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41471 _keys!1741))))))

(declare-fun mapIsEmpty!52373 () Bool)

(assert (=> mapIsEmpty!52373 mapRes!52373))

(declare-fun b!1285013 () Bool)

(declare-fun res!853269 () Bool)

(assert (=> b!1285013 (=> (not res!853269) (not e!734183))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1285013 (= res!853269 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41471 _keys!1741))))))

(declare-fun b!1285014 () Bool)

(declare-fun res!853272 () Bool)

(assert (=> b!1285014 (=> (not res!853272) (not e!734183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285014 (= res!853272 (validKeyInArray!0 (select (arr!40920 _keys!1741) from!2144)))))

(declare-fun b!1285010 () Bool)

(declare-fun res!853265 () Bool)

(assert (=> b!1285010 (=> (not res!853265) (not e!734183))))

(declare-fun minValue!1387 () V!50273)

(declare-fun zeroValue!1387 () V!50273)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21808 0))(
  ( (tuple2!21809 (_1!10915 (_ BitVec 64)) (_2!10915 V!50273)) )
))
(declare-datatypes ((List!29016 0))(
  ( (Nil!29013) (Cons!29012 (h!30230 tuple2!21808) (t!42552 List!29016)) )
))
(declare-datatypes ((ListLongMap!19473 0))(
  ( (ListLongMap!19474 (toList!9752 List!29016)) )
))
(declare-fun contains!7883 (ListLongMap!19473 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4818 (array!84845 array!84843 (_ BitVec 32) (_ BitVec 32) V!50273 V!50273 (_ BitVec 32) Int) ListLongMap!19473)

(assert (=> b!1285010 (= res!853265 (contains!7883 (getCurrentListMap!4818 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!853273 () Bool)

(assert (=> start!108948 (=> (not res!853273) (not e!734183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108948 (= res!853273 (validMask!0 mask!2175))))

(assert (=> start!108948 e!734183))

(declare-fun tp_is_empty!33877 () Bool)

(assert (=> start!108948 tp_is_empty!33877))

(assert (=> start!108948 true))

(declare-fun array_inv!31251 (array!84843) Bool)

(assert (=> start!108948 (and (array_inv!31251 _values!1445) e!734185)))

(declare-fun array_inv!31252 (array!84845) Bool)

(assert (=> start!108948 (array_inv!31252 _keys!1741)))

(assert (=> start!108948 tp!99827))

(declare-fun b!1285015 () Bool)

(assert (=> b!1285015 (= e!734184 tp_is_empty!33877)))

(declare-fun b!1285016 () Bool)

(assert (=> b!1285016 (= e!734183 (not true))))

(declare-fun lt!577183 () ListLongMap!19473)

(assert (=> b!1285016 (contains!7883 lt!577183 k0!1205)))

(declare-datatypes ((Unit!42446 0))(
  ( (Unit!42447) )
))
(declare-fun lt!577184 () Unit!42446)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!13 ((_ BitVec 64) (_ BitVec 64) V!50273 ListLongMap!19473) Unit!42446)

(assert (=> b!1285016 (= lt!577184 (lemmaInListMapAfterAddingDiffThenInBefore!13 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577183))))

(declare-fun +!4338 (ListLongMap!19473 tuple2!21808) ListLongMap!19473)

(declare-fun getCurrentListMapNoExtraKeys!5970 (array!84845 array!84843 (_ BitVec 32) (_ BitVec 32) V!50273 V!50273 (_ BitVec 32) Int) ListLongMap!19473)

(assert (=> b!1285016 (= lt!577183 (+!4338 (getCurrentListMapNoExtraKeys!5970 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1285017 () Bool)

(declare-fun res!853267 () Bool)

(assert (=> b!1285017 (=> (not res!853267) (not e!734183))))

(declare-datatypes ((List!29017 0))(
  ( (Nil!29014) (Cons!29013 (h!30231 (_ BitVec 64)) (t!42553 List!29017)) )
))
(declare-fun arrayNoDuplicates!0 (array!84845 (_ BitVec 32) List!29017) Bool)

(assert (=> b!1285017 (= res!853267 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29014))))

(declare-fun b!1285018 () Bool)

(assert (=> b!1285018 (= e!734187 tp_is_empty!33877)))

(declare-fun b!1285019 () Bool)

(declare-fun res!853268 () Bool)

(assert (=> b!1285019 (=> (not res!853268) (not e!734183))))

(assert (=> b!1285019 (= res!853268 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1285020 () Bool)

(declare-fun res!853266 () Bool)

(assert (=> b!1285020 (=> (not res!853266) (not e!734183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84845 (_ BitVec 32)) Bool)

(assert (=> b!1285020 (= res!853266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108948 res!853273) b!1285009))

(assert (= (and b!1285009 res!853271) b!1285020))

(assert (= (and b!1285020 res!853266) b!1285017))

(assert (= (and b!1285017 res!853267) b!1285012))

(assert (= (and b!1285012 res!853270) b!1285010))

(assert (= (and b!1285010 res!853265) b!1285013))

(assert (= (and b!1285013 res!853269) b!1285014))

(assert (= (and b!1285014 res!853272) b!1285019))

(assert (= (and b!1285019 res!853268) b!1285016))

(assert (= (and b!1285011 condMapEmpty!52373) mapIsEmpty!52373))

(assert (= (and b!1285011 (not condMapEmpty!52373)) mapNonEmpty!52373))

(get-info :version)

(assert (= (and mapNonEmpty!52373 ((_ is ValueCellFull!16040) mapValue!52373)) b!1285015))

(assert (= (and b!1285011 ((_ is ValueCellFull!16040) mapDefault!52373)) b!1285018))

(assert (= start!108948 b!1285011))

(declare-fun m!1179181 () Bool)

(assert (=> b!1285017 m!1179181))

(declare-fun m!1179183 () Bool)

(assert (=> b!1285020 m!1179183))

(declare-fun m!1179185 () Bool)

(assert (=> start!108948 m!1179185))

(declare-fun m!1179187 () Bool)

(assert (=> start!108948 m!1179187))

(declare-fun m!1179189 () Bool)

(assert (=> start!108948 m!1179189))

(declare-fun m!1179191 () Bool)

(assert (=> b!1285010 m!1179191))

(assert (=> b!1285010 m!1179191))

(declare-fun m!1179193 () Bool)

(assert (=> b!1285010 m!1179193))

(declare-fun m!1179195 () Bool)

(assert (=> b!1285016 m!1179195))

(declare-fun m!1179197 () Bool)

(assert (=> b!1285016 m!1179197))

(declare-fun m!1179199 () Bool)

(assert (=> b!1285016 m!1179199))

(assert (=> b!1285016 m!1179199))

(declare-fun m!1179201 () Bool)

(assert (=> b!1285016 m!1179201))

(declare-fun m!1179203 () Bool)

(assert (=> mapNonEmpty!52373 m!1179203))

(declare-fun m!1179205 () Bool)

(assert (=> b!1285014 m!1179205))

(assert (=> b!1285014 m!1179205))

(declare-fun m!1179207 () Bool)

(assert (=> b!1285014 m!1179207))

(check-sat (not b!1285020) (not b!1285010) (not b_next!28237) (not b!1285016) tp_is_empty!33877 b_and!46305 (not start!108948) (not b!1285017) (not b!1285014) (not mapNonEmpty!52373))
(check-sat b_and!46305 (not b_next!28237))
