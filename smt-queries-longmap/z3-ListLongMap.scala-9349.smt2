; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111532 () Bool)

(assert start!111532)

(declare-fun b_free!30189 () Bool)

(declare-fun b_next!30189 () Bool)

(assert (=> start!111532 (= b_free!30189 (not b_next!30189))))

(declare-fun tp!106043 () Bool)

(declare-fun b_and!48537 () Bool)

(assert (=> start!111532 (= tp!106043 b_and!48537)))

(declare-fun b!1320525 () Bool)

(declare-fun res!876447 () Bool)

(declare-fun e!753259 () Bool)

(assert (=> b!1320525 (=> (not res!876447) (not e!753259))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53115 0))(
  ( (V!53116 (val!18079 Int)) )
))
(declare-datatypes ((ValueCell!17106 0))(
  ( (ValueCellFull!17106 (v!20709 V!53115)) (EmptyCell!17106) )
))
(declare-datatypes ((array!88948 0))(
  ( (array!88949 (arr!42948 (Array (_ BitVec 32) ValueCell!17106)) (size!43498 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88948)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!88950 0))(
  ( (array!88951 (arr!42949 (Array (_ BitVec 32) (_ BitVec 64))) (size!43499 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88950)

(assert (=> b!1320525 (= res!876447 (and (= (size!43498 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43499 _keys!1609) (size!43498 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55661 () Bool)

(declare-fun mapRes!55661 () Bool)

(assert (=> mapIsEmpty!55661 mapRes!55661))

(declare-fun b!1320526 () Bool)

(declare-fun res!876448 () Bool)

(assert (=> b!1320526 (=> (not res!876448) (not e!753259))))

(declare-fun zeroValue!1279 () V!53115)

(declare-fun minValue!1279 () V!53115)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((tuple2!23280 0))(
  ( (tuple2!23281 (_1!11651 (_ BitVec 64)) (_2!11651 V!53115)) )
))
(declare-datatypes ((List!30430 0))(
  ( (Nil!30427) (Cons!30426 (h!31635 tuple2!23280) (t!44168 List!30430)) )
))
(declare-datatypes ((ListLongMap!20937 0))(
  ( (ListLongMap!20938 (toList!10484 List!30430)) )
))
(declare-fun contains!8639 (ListLongMap!20937 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5489 (array!88950 array!88948 (_ BitVec 32) (_ BitVec 32) V!53115 V!53115 (_ BitVec 32) Int) ListLongMap!20937)

(assert (=> b!1320526 (= res!876448 (contains!8639 (getCurrentListMap!5489 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320527 () Bool)

(declare-fun e!753258 () Bool)

(declare-fun e!753255 () Bool)

(assert (=> b!1320527 (= e!753258 (and e!753255 mapRes!55661))))

(declare-fun condMapEmpty!55661 () Bool)

(declare-fun mapDefault!55661 () ValueCell!17106)

(assert (=> b!1320527 (= condMapEmpty!55661 (= (arr!42948 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17106)) mapDefault!55661)))))

(declare-fun b!1320528 () Bool)

(declare-fun res!876451 () Bool)

(assert (=> b!1320528 (=> (not res!876451) (not e!753259))))

(declare-datatypes ((List!30431 0))(
  ( (Nil!30428) (Cons!30427 (h!31636 (_ BitVec 64)) (t!44169 List!30431)) )
))
(declare-fun arrayNoDuplicates!0 (array!88950 (_ BitVec 32) List!30431) Bool)

(assert (=> b!1320528 (= res!876451 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30428))))

(declare-fun b!1320529 () Bool)

(declare-fun res!876446 () Bool)

(assert (=> b!1320529 (=> (not res!876446) (not e!753259))))

(assert (=> b!1320529 (= res!876446 (not (= (select (arr!42949 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320530 () Bool)

(declare-fun e!753257 () Bool)

(declare-fun tp_is_empty!36009 () Bool)

(assert (=> b!1320530 (= e!753257 tp_is_empty!36009)))

(declare-fun res!876445 () Bool)

(assert (=> start!111532 (=> (not res!876445) (not e!753259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111532 (= res!876445 (validMask!0 mask!2019))))

(assert (=> start!111532 e!753259))

(declare-fun array_inv!32427 (array!88950) Bool)

(assert (=> start!111532 (array_inv!32427 _keys!1609)))

(assert (=> start!111532 true))

(assert (=> start!111532 tp_is_empty!36009))

(declare-fun array_inv!32428 (array!88948) Bool)

(assert (=> start!111532 (and (array_inv!32428 _values!1337) e!753258)))

(assert (=> start!111532 tp!106043))

(declare-fun b!1320531 () Bool)

(declare-fun res!876450 () Bool)

(assert (=> b!1320531 (=> (not res!876450) (not e!753259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320531 (= res!876450 (validKeyInArray!0 (select (arr!42949 _keys!1609) from!2000)))))

(declare-fun b!1320532 () Bool)

(assert (=> b!1320532 (= e!753259 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-fun lt!586980 () ListLongMap!20937)

(assert (=> b!1320532 (contains!8639 lt!586980 k0!1164)))

(declare-datatypes ((Unit!43506 0))(
  ( (Unit!43507) )
))
(declare-fun lt!586983 () Unit!43506)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!139 ((_ BitVec 64) (_ BitVec 64) V!53115 ListLongMap!20937) Unit!43506)

(assert (=> b!1320532 (= lt!586983 (lemmaInListMapAfterAddingDiffThenInBefore!139 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586980))))

(declare-fun lt!586982 () ListLongMap!20937)

(assert (=> b!1320532 (contains!8639 lt!586982 k0!1164)))

(declare-fun lt!586981 () Unit!43506)

(assert (=> b!1320532 (= lt!586981 (lemmaInListMapAfterAddingDiffThenInBefore!139 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586982))))

(declare-fun +!4543 (ListLongMap!20937 tuple2!23280) ListLongMap!20937)

(assert (=> b!1320532 (= lt!586982 (+!4543 lt!586980 (tuple2!23281 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6178 (array!88950 array!88948 (_ BitVec 32) (_ BitVec 32) V!53115 V!53115 (_ BitVec 32) Int) ListLongMap!20937)

(declare-fun get!21597 (ValueCell!17106 V!53115) V!53115)

(declare-fun dynLambda!3482 (Int (_ BitVec 64)) V!53115)

(assert (=> b!1320532 (= lt!586980 (+!4543 (getCurrentListMapNoExtraKeys!6178 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23281 (select (arr!42949 _keys!1609) from!2000) (get!21597 (select (arr!42948 _values!1337) from!2000) (dynLambda!3482 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320533 () Bool)

(declare-fun res!876452 () Bool)

(assert (=> b!1320533 (=> (not res!876452) (not e!753259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88950 (_ BitVec 32)) Bool)

(assert (=> b!1320533 (= res!876452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320534 () Bool)

(declare-fun res!876449 () Bool)

(assert (=> b!1320534 (=> (not res!876449) (not e!753259))))

(assert (=> b!1320534 (= res!876449 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43499 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320535 () Bool)

(assert (=> b!1320535 (= e!753255 tp_is_empty!36009)))

(declare-fun mapNonEmpty!55661 () Bool)

(declare-fun tp!106042 () Bool)

(assert (=> mapNonEmpty!55661 (= mapRes!55661 (and tp!106042 e!753257))))

(declare-fun mapKey!55661 () (_ BitVec 32))

(declare-fun mapValue!55661 () ValueCell!17106)

(declare-fun mapRest!55661 () (Array (_ BitVec 32) ValueCell!17106))

(assert (=> mapNonEmpty!55661 (= (arr!42948 _values!1337) (store mapRest!55661 mapKey!55661 mapValue!55661))))

(assert (= (and start!111532 res!876445) b!1320525))

(assert (= (and b!1320525 res!876447) b!1320533))

(assert (= (and b!1320533 res!876452) b!1320528))

(assert (= (and b!1320528 res!876451) b!1320534))

(assert (= (and b!1320534 res!876449) b!1320526))

(assert (= (and b!1320526 res!876448) b!1320529))

(assert (= (and b!1320529 res!876446) b!1320531))

(assert (= (and b!1320531 res!876450) b!1320532))

(assert (= (and b!1320527 condMapEmpty!55661) mapIsEmpty!55661))

(assert (= (and b!1320527 (not condMapEmpty!55661)) mapNonEmpty!55661))

(get-info :version)

(assert (= (and mapNonEmpty!55661 ((_ is ValueCellFull!17106) mapValue!55661)) b!1320530))

(assert (= (and b!1320527 ((_ is ValueCellFull!17106) mapDefault!55661)) b!1320535))

(assert (= start!111532 b!1320527))

(declare-fun b_lambda!23515 () Bool)

(assert (=> (not b_lambda!23515) (not b!1320532)))

(declare-fun t!44167 () Bool)

(declare-fun tb!11541 () Bool)

(assert (=> (and start!111532 (= defaultEntry!1340 defaultEntry!1340) t!44167) tb!11541))

(declare-fun result!24137 () Bool)

(assert (=> tb!11541 (= result!24137 tp_is_empty!36009)))

(assert (=> b!1320532 t!44167))

(declare-fun b_and!48539 () Bool)

(assert (= b_and!48537 (and (=> t!44167 result!24137) b_and!48539)))

(declare-fun m!1208251 () Bool)

(assert (=> mapNonEmpty!55661 m!1208251))

(declare-fun m!1208253 () Bool)

(assert (=> b!1320533 m!1208253))

(declare-fun m!1208255 () Bool)

(assert (=> b!1320531 m!1208255))

(assert (=> b!1320531 m!1208255))

(declare-fun m!1208257 () Bool)

(assert (=> b!1320531 m!1208257))

(declare-fun m!1208259 () Bool)

(assert (=> b!1320528 m!1208259))

(declare-fun m!1208261 () Bool)

(assert (=> b!1320526 m!1208261))

(assert (=> b!1320526 m!1208261))

(declare-fun m!1208263 () Bool)

(assert (=> b!1320526 m!1208263))

(declare-fun m!1208265 () Bool)

(assert (=> start!111532 m!1208265))

(declare-fun m!1208267 () Bool)

(assert (=> start!111532 m!1208267))

(declare-fun m!1208269 () Bool)

(assert (=> start!111532 m!1208269))

(assert (=> b!1320529 m!1208255))

(declare-fun m!1208271 () Bool)

(assert (=> b!1320532 m!1208271))

(declare-fun m!1208273 () Bool)

(assert (=> b!1320532 m!1208273))

(declare-fun m!1208275 () Bool)

(assert (=> b!1320532 m!1208275))

(declare-fun m!1208277 () Bool)

(assert (=> b!1320532 m!1208277))

(assert (=> b!1320532 m!1208277))

(assert (=> b!1320532 m!1208275))

(declare-fun m!1208279 () Bool)

(assert (=> b!1320532 m!1208279))

(assert (=> b!1320532 m!1208255))

(declare-fun m!1208281 () Bool)

(assert (=> b!1320532 m!1208281))

(assert (=> b!1320532 m!1208273))

(declare-fun m!1208283 () Bool)

(assert (=> b!1320532 m!1208283))

(declare-fun m!1208285 () Bool)

(assert (=> b!1320532 m!1208285))

(declare-fun m!1208287 () Bool)

(assert (=> b!1320532 m!1208287))

(declare-fun m!1208289 () Bool)

(assert (=> b!1320532 m!1208289))

(check-sat (not b!1320532) (not b!1320528) (not start!111532) (not b!1320531) (not mapNonEmpty!55661) (not b_next!30189) b_and!48539 (not b!1320533) (not b!1320526) tp_is_empty!36009 (not b_lambda!23515))
(check-sat b_and!48539 (not b_next!30189))
