; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83890 () Bool)

(assert start!83890)

(declare-fun b_free!19717 () Bool)

(declare-fun b_next!19717 () Bool)

(assert (=> start!83890 (= b_free!19717 (not b_next!19717))))

(declare-fun tp!68593 () Bool)

(declare-fun b_and!31497 () Bool)

(assert (=> start!83890 (= tp!68593 b_and!31497)))

(declare-fun b!980352 () Bool)

(declare-fun res!656147 () Bool)

(declare-fun e!552556 () Bool)

(assert (=> b!980352 (=> (not res!656147) (not e!552556))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61356 0))(
  ( (array!61357 (arr!29536 (Array (_ BitVec 32) (_ BitVec 64))) (size!30017 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61356)

(assert (=> b!980352 (= res!656147 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30017 _keys!1544))))))

(declare-fun b!980353 () Bool)

(declare-fun e!552559 () Bool)

(declare-fun e!552558 () Bool)

(declare-fun mapRes!36095 () Bool)

(assert (=> b!980353 (= e!552559 (and e!552558 mapRes!36095))))

(declare-fun condMapEmpty!36095 () Bool)

(declare-datatypes ((V!35265 0))(
  ( (V!35266 (val!11406 Int)) )
))
(declare-datatypes ((ValueCell!10874 0))(
  ( (ValueCellFull!10874 (v!13967 V!35265)) (EmptyCell!10874) )
))
(declare-datatypes ((array!61358 0))(
  ( (array!61359 (arr!29537 (Array (_ BitVec 32) ValueCell!10874)) (size!30018 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61358)

(declare-fun mapDefault!36095 () ValueCell!10874)

(assert (=> b!980353 (= condMapEmpty!36095 (= (arr!29537 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10874)) mapDefault!36095)))))

(declare-fun b!980354 () Bool)

(declare-fun tp_is_empty!22711 () Bool)

(assert (=> b!980354 (= e!552558 tp_is_empty!22711)))

(declare-fun mapNonEmpty!36095 () Bool)

(declare-fun tp!68594 () Bool)

(declare-fun e!552557 () Bool)

(assert (=> mapNonEmpty!36095 (= mapRes!36095 (and tp!68594 e!552557))))

(declare-fun mapKey!36095 () (_ BitVec 32))

(declare-fun mapRest!36095 () (Array (_ BitVec 32) ValueCell!10874))

(declare-fun mapValue!36095 () ValueCell!10874)

(assert (=> mapNonEmpty!36095 (= (arr!29537 _values!1278) (store mapRest!36095 mapKey!36095 mapValue!36095))))

(declare-fun b!980355 () Bool)

(declare-fun e!552560 () Bool)

(assert (=> b!980355 (= e!552560 true)))

(declare-datatypes ((tuple2!14702 0))(
  ( (tuple2!14703 (_1!7362 (_ BitVec 64)) (_2!7362 V!35265)) )
))
(declare-fun lt!435208 () tuple2!14702)

(declare-datatypes ((List!20525 0))(
  ( (Nil!20522) (Cons!20521 (h!21683 tuple2!14702) (t!29189 List!20525)) )
))
(declare-datatypes ((ListLongMap!13389 0))(
  ( (ListLongMap!13390 (toList!6710 List!20525)) )
))
(declare-fun lt!435212 () ListLongMap!13389)

(declare-fun lt!435204 () tuple2!14702)

(declare-fun lt!435206 () ListLongMap!13389)

(declare-fun +!3010 (ListLongMap!13389 tuple2!14702) ListLongMap!13389)

(assert (=> b!980355 (= lt!435212 (+!3010 (+!3010 lt!435206 lt!435204) lt!435208))))

(declare-datatypes ((Unit!32486 0))(
  ( (Unit!32487) )
))
(declare-fun lt!435205 () Unit!32486)

(declare-fun lt!435210 () V!35265)

(declare-fun zeroValue!1220 () V!35265)

(declare-fun addCommutativeForDiffKeys!614 (ListLongMap!13389 (_ BitVec 64) V!35265 (_ BitVec 64) V!35265) Unit!32486)

(assert (=> b!980355 (= lt!435205 (addCommutativeForDiffKeys!614 lt!435206 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29536 _keys!1544) from!1932) lt!435210))))

(declare-fun b!980356 () Bool)

(declare-fun res!656145 () Bool)

(assert (=> b!980356 (=> (not res!656145) (not e!552556))))

(declare-datatypes ((List!20526 0))(
  ( (Nil!20523) (Cons!20522 (h!21684 (_ BitVec 64)) (t!29190 List!20526)) )
))
(declare-fun arrayNoDuplicates!0 (array!61356 (_ BitVec 32) List!20526) Bool)

(assert (=> b!980356 (= res!656145 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20523))))

(declare-fun b!980357 () Bool)

(assert (=> b!980357 (= e!552557 tp_is_empty!22711)))

(declare-fun b!980358 () Bool)

(declare-fun res!656144 () Bool)

(assert (=> b!980358 (=> (not res!656144) (not e!552556))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980358 (= res!656144 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!656151 () Bool)

(assert (=> start!83890 (=> (not res!656151) (not e!552556))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83890 (= res!656151 (validMask!0 mask!1948))))

(assert (=> start!83890 e!552556))

(assert (=> start!83890 true))

(assert (=> start!83890 tp_is_empty!22711))

(declare-fun array_inv!22859 (array!61358) Bool)

(assert (=> start!83890 (and (array_inv!22859 _values!1278) e!552559)))

(assert (=> start!83890 tp!68593))

(declare-fun array_inv!22860 (array!61356) Bool)

(assert (=> start!83890 (array_inv!22860 _keys!1544)))

(declare-fun b!980359 () Bool)

(declare-fun res!656149 () Bool)

(assert (=> b!980359 (=> (not res!656149) (not e!552556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61356 (_ BitVec 32)) Bool)

(assert (=> b!980359 (= res!656149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36095 () Bool)

(assert (=> mapIsEmpty!36095 mapRes!36095))

(declare-fun b!980360 () Bool)

(declare-fun res!656150 () Bool)

(assert (=> b!980360 (=> (not res!656150) (not e!552556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980360 (= res!656150 (validKeyInArray!0 (select (arr!29536 _keys!1544) from!1932)))))

(declare-fun b!980361 () Bool)

(declare-fun res!656146 () Bool)

(assert (=> b!980361 (=> (not res!656146) (not e!552556))))

(assert (=> b!980361 (= res!656146 (and (= (size!30018 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30017 _keys!1544) (size!30018 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980362 () Bool)

(assert (=> b!980362 (= e!552556 (not e!552560))))

(declare-fun res!656148 () Bool)

(assert (=> b!980362 (=> res!656148 e!552560)))

(assert (=> b!980362 (= res!656148 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29536 _keys!1544) from!1932)))))

(declare-fun lt!435207 () ListLongMap!13389)

(declare-fun lt!435213 () tuple2!14702)

(assert (=> b!980362 (= (+!3010 lt!435207 lt!435204) (+!3010 lt!435212 lt!435213))))

(declare-fun lt!435209 () ListLongMap!13389)

(assert (=> b!980362 (= lt!435212 (+!3010 lt!435209 lt!435204))))

(assert (=> b!980362 (= lt!435204 (tuple2!14703 (select (arr!29536 _keys!1544) from!1932) lt!435210))))

(assert (=> b!980362 (= lt!435207 (+!3010 lt!435209 lt!435213))))

(declare-fun minValue!1220 () V!35265)

(assert (=> b!980362 (= lt!435213 (tuple2!14703 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!435211 () Unit!32486)

(assert (=> b!980362 (= lt!435211 (addCommutativeForDiffKeys!614 lt!435209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29536 _keys!1544) from!1932) lt!435210))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15326 (ValueCell!10874 V!35265) V!35265)

(declare-fun dynLambda!1756 (Int (_ BitVec 64)) V!35265)

(assert (=> b!980362 (= lt!435210 (get!15326 (select (arr!29537 _values!1278) from!1932) (dynLambda!1756 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!980362 (= lt!435209 (+!3010 lt!435206 lt!435208))))

(assert (=> b!980362 (= lt!435208 (tuple2!14703 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3423 (array!61356 array!61358 (_ BitVec 32) (_ BitVec 32) V!35265 V!35265 (_ BitVec 32) Int) ListLongMap!13389)

(assert (=> b!980362 (= lt!435206 (getCurrentListMapNoExtraKeys!3423 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!83890 res!656151) b!980361))

(assert (= (and b!980361 res!656146) b!980359))

(assert (= (and b!980359 res!656149) b!980356))

(assert (= (and b!980356 res!656145) b!980352))

(assert (= (and b!980352 res!656147) b!980360))

(assert (= (and b!980360 res!656150) b!980358))

(assert (= (and b!980358 res!656144) b!980362))

(assert (= (and b!980362 (not res!656148)) b!980355))

(assert (= (and b!980353 condMapEmpty!36095) mapIsEmpty!36095))

(assert (= (and b!980353 (not condMapEmpty!36095)) mapNonEmpty!36095))

(get-info :version)

(assert (= (and mapNonEmpty!36095 ((_ is ValueCellFull!10874) mapValue!36095)) b!980357))

(assert (= (and b!980353 ((_ is ValueCellFull!10874) mapDefault!36095)) b!980354))

(assert (= start!83890 b!980353))

(declare-fun b_lambda!14743 () Bool)

(assert (=> (not b_lambda!14743) (not b!980362)))

(declare-fun t!29188 () Bool)

(declare-fun tb!6515 () Bool)

(assert (=> (and start!83890 (= defaultEntry!1281 defaultEntry!1281) t!29188) tb!6515))

(declare-fun result!13027 () Bool)

(assert (=> tb!6515 (= result!13027 tp_is_empty!22711)))

(assert (=> b!980362 t!29188))

(declare-fun b_and!31499 () Bool)

(assert (= b_and!31497 (and (=> t!29188 result!13027) b_and!31499)))

(declare-fun m!907373 () Bool)

(assert (=> b!980359 m!907373))

(declare-fun m!907375 () Bool)

(assert (=> b!980355 m!907375))

(assert (=> b!980355 m!907375))

(declare-fun m!907377 () Bool)

(assert (=> b!980355 m!907377))

(declare-fun m!907379 () Bool)

(assert (=> b!980355 m!907379))

(assert (=> b!980355 m!907379))

(declare-fun m!907381 () Bool)

(assert (=> b!980355 m!907381))

(assert (=> b!980362 m!907379))

(declare-fun m!907383 () Bool)

(assert (=> b!980362 m!907383))

(declare-fun m!907385 () Bool)

(assert (=> b!980362 m!907385))

(declare-fun m!907387 () Bool)

(assert (=> b!980362 m!907387))

(declare-fun m!907389 () Bool)

(assert (=> b!980362 m!907389))

(declare-fun m!907391 () Bool)

(assert (=> b!980362 m!907391))

(assert (=> b!980362 m!907379))

(declare-fun m!907393 () Bool)

(assert (=> b!980362 m!907393))

(declare-fun m!907395 () Bool)

(assert (=> b!980362 m!907395))

(declare-fun m!907397 () Bool)

(assert (=> b!980362 m!907397))

(declare-fun m!907399 () Bool)

(assert (=> b!980362 m!907399))

(assert (=> b!980362 m!907383))

(assert (=> b!980362 m!907399))

(declare-fun m!907401 () Bool)

(assert (=> b!980362 m!907401))

(assert (=> b!980360 m!907379))

(assert (=> b!980360 m!907379))

(declare-fun m!907403 () Bool)

(assert (=> b!980360 m!907403))

(declare-fun m!907405 () Bool)

(assert (=> start!83890 m!907405))

(declare-fun m!907407 () Bool)

(assert (=> start!83890 m!907407))

(declare-fun m!907409 () Bool)

(assert (=> start!83890 m!907409))

(declare-fun m!907411 () Bool)

(assert (=> mapNonEmpty!36095 m!907411))

(declare-fun m!907413 () Bool)

(assert (=> b!980356 m!907413))

(check-sat b_and!31499 (not b!980359) (not b!980355) (not b!980360) (not b!980356) (not b!980362) (not b_lambda!14743) tp_is_empty!22711 (not b_next!19717) (not start!83890) (not mapNonEmpty!36095))
(check-sat b_and!31499 (not b_next!19717))
