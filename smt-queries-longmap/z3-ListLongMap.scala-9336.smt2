; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111452 () Bool)

(assert start!111452)

(declare-fun b_free!30109 () Bool)

(declare-fun b_next!30109 () Bool)

(assert (=> start!111452 (= b_free!30109 (not b_next!30109))))

(declare-fun tp!105803 () Bool)

(declare-fun b_and!48359 () Bool)

(assert (=> start!111452 (= tp!105803 b_and!48359)))

(declare-fun res!875457 () Bool)

(declare-fun e!752625 () Bool)

(assert (=> start!111452 (=> (not res!875457) (not e!752625))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111452 (= res!875457 (validMask!0 mask!2019))))

(assert (=> start!111452 e!752625))

(declare-datatypes ((array!88725 0))(
  ( (array!88726 (arr!42837 (Array (_ BitVec 32) (_ BitVec 64))) (size!43389 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88725)

(declare-fun array_inv!32531 (array!88725) Bool)

(assert (=> start!111452 (array_inv!32531 _keys!1609)))

(assert (=> start!111452 true))

(declare-fun tp_is_empty!35929 () Bool)

(assert (=> start!111452 tp_is_empty!35929))

(declare-datatypes ((V!53009 0))(
  ( (V!53010 (val!18039 Int)) )
))
(declare-datatypes ((ValueCell!17066 0))(
  ( (ValueCellFull!17066 (v!20668 V!53009)) (EmptyCell!17066) )
))
(declare-datatypes ((array!88727 0))(
  ( (array!88728 (arr!42838 (Array (_ BitVec 32) ValueCell!17066)) (size!43390 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88727)

(declare-fun e!752622 () Bool)

(declare-fun array_inv!32532 (array!88727) Bool)

(assert (=> start!111452 (and (array_inv!32532 _values!1337) e!752622)))

(assert (=> start!111452 tp!105803))

(declare-fun b!1319055 () Bool)

(declare-fun res!875460 () Bool)

(assert (=> b!1319055 (=> (not res!875460) (not e!752625))))

(declare-datatypes ((List!30443 0))(
  ( (Nil!30440) (Cons!30439 (h!31648 (_ BitVec 64)) (t!44093 List!30443)) )
))
(declare-fun arrayNoDuplicates!0 (array!88725 (_ BitVec 32) List!30443) Bool)

(assert (=> b!1319055 (= res!875460 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30440))))

(declare-fun mapIsEmpty!55541 () Bool)

(declare-fun mapRes!55541 () Bool)

(assert (=> mapIsEmpty!55541 mapRes!55541))

(declare-fun mapNonEmpty!55541 () Bool)

(declare-fun tp!105804 () Bool)

(declare-fun e!752623 () Bool)

(assert (=> mapNonEmpty!55541 (= mapRes!55541 (and tp!105804 e!752623))))

(declare-fun mapRest!55541 () (Array (_ BitVec 32) ValueCell!17066))

(declare-fun mapKey!55541 () (_ BitVec 32))

(declare-fun mapValue!55541 () ValueCell!17066)

(assert (=> mapNonEmpty!55541 (= (arr!42838 _values!1337) (store mapRest!55541 mapKey!55541 mapValue!55541))))

(declare-fun b!1319056 () Bool)

(assert (=> b!1319056 (= e!752623 tp_is_empty!35929)))

(declare-fun b!1319057 () Bool)

(declare-fun res!875461 () Bool)

(assert (=> b!1319057 (=> (not res!875461) (not e!752625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88725 (_ BitVec 32)) Bool)

(assert (=> b!1319057 (= res!875461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319058 () Bool)

(declare-fun e!752624 () Bool)

(assert (=> b!1319058 (= e!752622 (and e!752624 mapRes!55541))))

(declare-fun condMapEmpty!55541 () Bool)

(declare-fun mapDefault!55541 () ValueCell!17066)

(assert (=> b!1319058 (= condMapEmpty!55541 (= (arr!42838 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17066)) mapDefault!55541)))))

(declare-fun b!1319059 () Bool)

(assert (=> b!1319059 (= e!752625 (not true))))

(declare-datatypes ((tuple2!23306 0))(
  ( (tuple2!23307 (_1!11664 (_ BitVec 64)) (_2!11664 V!53009)) )
))
(declare-datatypes ((List!30444 0))(
  ( (Nil!30441) (Cons!30440 (h!31649 tuple2!23306) (t!44094 List!30444)) )
))
(declare-datatypes ((ListLongMap!20963 0))(
  ( (ListLongMap!20964 (toList!10497 List!30444)) )
))
(declare-fun lt!586400 () ListLongMap!20963)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8580 (ListLongMap!20963 (_ BitVec 64)) Bool)

(assert (=> b!1319059 (contains!8580 lt!586400 k0!1164)))

(declare-datatypes ((Unit!43273 0))(
  ( (Unit!43274) )
))
(declare-fun lt!586401 () Unit!43273)

(declare-fun minValue!1279 () V!53009)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!110 ((_ BitVec 64) (_ BitVec 64) V!53009 ListLongMap!20963) Unit!43273)

(assert (=> b!1319059 (= lt!586401 (lemmaInListMapAfterAddingDiffThenInBefore!110 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586400))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53009)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4545 (ListLongMap!20963 tuple2!23306) ListLongMap!20963)

(declare-fun getCurrentListMapNoExtraKeys!6178 (array!88725 array!88727 (_ BitVec 32) (_ BitVec 32) V!53009 V!53009 (_ BitVec 32) Int) ListLongMap!20963)

(declare-fun get!21540 (ValueCell!17066 V!53009) V!53009)

(declare-fun dynLambda!3475 (Int (_ BitVec 64)) V!53009)

(assert (=> b!1319059 (= lt!586400 (+!4545 (+!4545 (getCurrentListMapNoExtraKeys!6178 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23307 (select (arr!42837 _keys!1609) from!2000) (get!21540 (select (arr!42838 _values!1337) from!2000) (dynLambda!3475 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319060 () Bool)

(declare-fun res!875462 () Bool)

(assert (=> b!1319060 (=> (not res!875462) (not e!752625))))

(declare-fun getCurrentListMap!5390 (array!88725 array!88727 (_ BitVec 32) (_ BitVec 32) V!53009 V!53009 (_ BitVec 32) Int) ListLongMap!20963)

(assert (=> b!1319060 (= res!875462 (contains!8580 (getCurrentListMap!5390 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319061 () Bool)

(assert (=> b!1319061 (= e!752624 tp_is_empty!35929)))

(declare-fun b!1319062 () Bool)

(declare-fun res!875459 () Bool)

(assert (=> b!1319062 (=> (not res!875459) (not e!752625))))

(assert (=> b!1319062 (= res!875459 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43389 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319063 () Bool)

(declare-fun res!875458 () Bool)

(assert (=> b!1319063 (=> (not res!875458) (not e!752625))))

(assert (=> b!1319063 (= res!875458 (not (= (select (arr!42837 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319064 () Bool)

(declare-fun res!875456 () Bool)

(assert (=> b!1319064 (=> (not res!875456) (not e!752625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319064 (= res!875456 (validKeyInArray!0 (select (arr!42837 _keys!1609) from!2000)))))

(declare-fun b!1319065 () Bool)

(declare-fun res!875463 () Bool)

(assert (=> b!1319065 (=> (not res!875463) (not e!752625))))

(assert (=> b!1319065 (= res!875463 (and (= (size!43390 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43389 _keys!1609) (size!43390 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111452 res!875457) b!1319065))

(assert (= (and b!1319065 res!875463) b!1319057))

(assert (= (and b!1319057 res!875461) b!1319055))

(assert (= (and b!1319055 res!875460) b!1319062))

(assert (= (and b!1319062 res!875459) b!1319060))

(assert (= (and b!1319060 res!875462) b!1319063))

(assert (= (and b!1319063 res!875458) b!1319064))

(assert (= (and b!1319064 res!875456) b!1319059))

(assert (= (and b!1319058 condMapEmpty!55541) mapIsEmpty!55541))

(assert (= (and b!1319058 (not condMapEmpty!55541)) mapNonEmpty!55541))

(get-info :version)

(assert (= (and mapNonEmpty!55541 ((_ is ValueCellFull!17066) mapValue!55541)) b!1319056))

(assert (= (and b!1319058 ((_ is ValueCellFull!17066) mapDefault!55541)) b!1319061))

(assert (= start!111452 b!1319058))

(declare-fun b_lambda!23425 () Bool)

(assert (=> (not b_lambda!23425) (not b!1319059)))

(declare-fun t!44092 () Bool)

(declare-fun tb!11453 () Bool)

(assert (=> (and start!111452 (= defaultEntry!1340 defaultEntry!1340) t!44092) tb!11453))

(declare-fun result!23969 () Bool)

(assert (=> tb!11453 (= result!23969 tp_is_empty!35929)))

(assert (=> b!1319059 t!44092))

(declare-fun b_and!48361 () Bool)

(assert (= b_and!48359 (and (=> t!44092 result!23969) b_and!48361)))

(declare-fun m!1206195 () Bool)

(assert (=> b!1319055 m!1206195))

(declare-fun m!1206197 () Bool)

(assert (=> b!1319060 m!1206197))

(assert (=> b!1319060 m!1206197))

(declare-fun m!1206199 () Bool)

(assert (=> b!1319060 m!1206199))

(declare-fun m!1206201 () Bool)

(assert (=> mapNonEmpty!55541 m!1206201))

(declare-fun m!1206203 () Bool)

(assert (=> b!1319057 m!1206203))

(declare-fun m!1206205 () Bool)

(assert (=> b!1319064 m!1206205))

(assert (=> b!1319064 m!1206205))

(declare-fun m!1206207 () Bool)

(assert (=> b!1319064 m!1206207))

(declare-fun m!1206209 () Bool)

(assert (=> start!111452 m!1206209))

(declare-fun m!1206211 () Bool)

(assert (=> start!111452 m!1206211))

(declare-fun m!1206213 () Bool)

(assert (=> start!111452 m!1206213))

(declare-fun m!1206215 () Bool)

(assert (=> b!1319059 m!1206215))

(declare-fun m!1206217 () Bool)

(assert (=> b!1319059 m!1206217))

(declare-fun m!1206219 () Bool)

(assert (=> b!1319059 m!1206219))

(assert (=> b!1319059 m!1206215))

(declare-fun m!1206221 () Bool)

(assert (=> b!1319059 m!1206221))

(declare-fun m!1206223 () Bool)

(assert (=> b!1319059 m!1206223))

(declare-fun m!1206225 () Bool)

(assert (=> b!1319059 m!1206225))

(assert (=> b!1319059 m!1206221))

(declare-fun m!1206227 () Bool)

(assert (=> b!1319059 m!1206227))

(assert (=> b!1319059 m!1206225))

(assert (=> b!1319059 m!1206219))

(declare-fun m!1206229 () Bool)

(assert (=> b!1319059 m!1206229))

(assert (=> b!1319059 m!1206205))

(assert (=> b!1319063 m!1206205))

(check-sat (not b_lambda!23425) (not b!1319060) (not mapNonEmpty!55541) (not b!1319057) (not b!1319059) (not b!1319064) (not b!1319055) tp_is_empty!35929 b_and!48361 (not start!111452) (not b_next!30109))
(check-sat b_and!48361 (not b_next!30109))
