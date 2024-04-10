; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111526 () Bool)

(assert start!111526)

(declare-fun b_free!30183 () Bool)

(declare-fun b_next!30183 () Bool)

(assert (=> start!111526 (= b_free!30183 (not b_next!30183))))

(declare-fun tp!106025 () Bool)

(declare-fun b_and!48525 () Bool)

(assert (=> start!111526 (= tp!106025 b_and!48525)))

(declare-fun b!1320420 () Bool)

(declare-fun e!753214 () Bool)

(declare-fun tp_is_empty!36003 () Bool)

(assert (=> b!1320420 (= e!753214 tp_is_empty!36003)))

(declare-fun res!876374 () Bool)

(declare-fun e!753211 () Bool)

(assert (=> start!111526 (=> (not res!876374) (not e!753211))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111526 (= res!876374 (validMask!0 mask!2019))))

(assert (=> start!111526 e!753211))

(declare-datatypes ((array!88936 0))(
  ( (array!88937 (arr!42942 (Array (_ BitVec 32) (_ BitVec 64))) (size!43492 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88936)

(declare-fun array_inv!32421 (array!88936) Bool)

(assert (=> start!111526 (array_inv!32421 _keys!1609)))

(assert (=> start!111526 true))

(assert (=> start!111526 tp_is_empty!36003))

(declare-datatypes ((V!53107 0))(
  ( (V!53108 (val!18076 Int)) )
))
(declare-datatypes ((ValueCell!17103 0))(
  ( (ValueCellFull!17103 (v!20706 V!53107)) (EmptyCell!17103) )
))
(declare-datatypes ((array!88938 0))(
  ( (array!88939 (arr!42943 (Array (_ BitVec 32) ValueCell!17103)) (size!43493 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88938)

(declare-fun e!753213 () Bool)

(declare-fun array_inv!32422 (array!88938) Bool)

(assert (=> start!111526 (and (array_inv!32422 _values!1337) e!753213)))

(assert (=> start!111526 tp!106025))

(declare-fun b!1320421 () Bool)

(declare-fun mapRes!55652 () Bool)

(assert (=> b!1320421 (= e!753213 (and e!753214 mapRes!55652))))

(declare-fun condMapEmpty!55652 () Bool)

(declare-fun mapDefault!55652 () ValueCell!17103)

(assert (=> b!1320421 (= condMapEmpty!55652 (= (arr!42943 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17103)) mapDefault!55652)))))

(declare-fun b!1320422 () Bool)

(declare-fun e!753210 () Bool)

(assert (=> b!1320422 (= e!753210 tp_is_empty!36003)))

(declare-fun b!1320423 () Bool)

(declare-fun res!876375 () Bool)

(assert (=> b!1320423 (=> (not res!876375) (not e!753211))))

(declare-datatypes ((List!30424 0))(
  ( (Nil!30421) (Cons!30420 (h!31629 (_ BitVec 64)) (t!44156 List!30424)) )
))
(declare-fun arrayNoDuplicates!0 (array!88936 (_ BitVec 32) List!30424) Bool)

(assert (=> b!1320423 (= res!876375 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30421))))

(declare-fun b!1320424 () Bool)

(declare-fun res!876373 () Bool)

(assert (=> b!1320424 (=> (not res!876373) (not e!753211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88936 (_ BitVec 32)) Bool)

(assert (=> b!1320424 (= res!876373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55652 () Bool)

(declare-fun tp!106024 () Bool)

(assert (=> mapNonEmpty!55652 (= mapRes!55652 (and tp!106024 e!753210))))

(declare-fun mapValue!55652 () ValueCell!17103)

(declare-fun mapKey!55652 () (_ BitVec 32))

(declare-fun mapRest!55652 () (Array (_ BitVec 32) ValueCell!17103))

(assert (=> mapNonEmpty!55652 (= (arr!42943 _values!1337) (store mapRest!55652 mapKey!55652 mapValue!55652))))

(declare-fun b!1320425 () Bool)

(declare-fun res!876377 () Bool)

(assert (=> b!1320425 (=> (not res!876377) (not e!753211))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53107)

(declare-fun minValue!1279 () V!53107)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23274 0))(
  ( (tuple2!23275 (_1!11648 (_ BitVec 64)) (_2!11648 V!53107)) )
))
(declare-datatypes ((List!30425 0))(
  ( (Nil!30422) (Cons!30421 (h!31630 tuple2!23274) (t!44157 List!30425)) )
))
(declare-datatypes ((ListLongMap!20931 0))(
  ( (ListLongMap!20932 (toList!10481 List!30425)) )
))
(declare-fun contains!8636 (ListLongMap!20931 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5486 (array!88936 array!88938 (_ BitVec 32) (_ BitVec 32) V!53107 V!53107 (_ BitVec 32) Int) ListLongMap!20931)

(assert (=> b!1320425 (= res!876377 (contains!8636 (getCurrentListMap!5486 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320426 () Bool)

(declare-fun res!876380 () Bool)

(assert (=> b!1320426 (=> (not res!876380) (not e!753211))))

(assert (=> b!1320426 (= res!876380 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43492 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320427 () Bool)

(declare-fun res!876378 () Bool)

(assert (=> b!1320427 (=> (not res!876378) (not e!753211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320427 (= res!876378 (validKeyInArray!0 (select (arr!42942 _keys!1609) from!2000)))))

(declare-fun b!1320428 () Bool)

(declare-fun res!876379 () Bool)

(assert (=> b!1320428 (=> (not res!876379) (not e!753211))))

(assert (=> b!1320428 (= res!876379 (and (= (size!43493 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43492 _keys!1609) (size!43493 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55652 () Bool)

(assert (=> mapIsEmpty!55652 mapRes!55652))

(declare-fun b!1320429 () Bool)

(assert (=> b!1320429 (= e!753211 (not true))))

(declare-fun lt!586946 () ListLongMap!20931)

(assert (=> b!1320429 (contains!8636 lt!586946 k0!1164)))

(declare-datatypes ((Unit!43500 0))(
  ( (Unit!43501) )
))
(declare-fun lt!586945 () Unit!43500)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!136 ((_ BitVec 64) (_ BitVec 64) V!53107 ListLongMap!20931) Unit!43500)

(assert (=> b!1320429 (= lt!586945 (lemmaInListMapAfterAddingDiffThenInBefore!136 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586946))))

(declare-fun lt!586947 () ListLongMap!20931)

(assert (=> b!1320429 (contains!8636 lt!586947 k0!1164)))

(declare-fun lt!586944 () Unit!43500)

(assert (=> b!1320429 (= lt!586944 (lemmaInListMapAfterAddingDiffThenInBefore!136 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586947))))

(declare-fun +!4540 (ListLongMap!20931 tuple2!23274) ListLongMap!20931)

(assert (=> b!1320429 (= lt!586947 (+!4540 lt!586946 (tuple2!23275 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6175 (array!88936 array!88938 (_ BitVec 32) (_ BitVec 32) V!53107 V!53107 (_ BitVec 32) Int) ListLongMap!20931)

(declare-fun get!21592 (ValueCell!17103 V!53107) V!53107)

(declare-fun dynLambda!3479 (Int (_ BitVec 64)) V!53107)

(assert (=> b!1320429 (= lt!586946 (+!4540 (getCurrentListMapNoExtraKeys!6175 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23275 (select (arr!42942 _keys!1609) from!2000) (get!21592 (select (arr!42943 _values!1337) from!2000) (dynLambda!3479 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320430 () Bool)

(declare-fun res!876376 () Bool)

(assert (=> b!1320430 (=> (not res!876376) (not e!753211))))

(assert (=> b!1320430 (= res!876376 (not (= (select (arr!42942 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111526 res!876374) b!1320428))

(assert (= (and b!1320428 res!876379) b!1320424))

(assert (= (and b!1320424 res!876373) b!1320423))

(assert (= (and b!1320423 res!876375) b!1320426))

(assert (= (and b!1320426 res!876380) b!1320425))

(assert (= (and b!1320425 res!876377) b!1320430))

(assert (= (and b!1320430 res!876376) b!1320427))

(assert (= (and b!1320427 res!876378) b!1320429))

(assert (= (and b!1320421 condMapEmpty!55652) mapIsEmpty!55652))

(assert (= (and b!1320421 (not condMapEmpty!55652)) mapNonEmpty!55652))

(get-info :version)

(assert (= (and mapNonEmpty!55652 ((_ is ValueCellFull!17103) mapValue!55652)) b!1320422))

(assert (= (and b!1320421 ((_ is ValueCellFull!17103) mapDefault!55652)) b!1320420))

(assert (= start!111526 b!1320421))

(declare-fun b_lambda!23509 () Bool)

(assert (=> (not b_lambda!23509) (not b!1320429)))

(declare-fun t!44155 () Bool)

(declare-fun tb!11535 () Bool)

(assert (=> (and start!111526 (= defaultEntry!1340 defaultEntry!1340) t!44155) tb!11535))

(declare-fun result!24125 () Bool)

(assert (=> tb!11535 (= result!24125 tp_is_empty!36003)))

(assert (=> b!1320429 t!44155))

(declare-fun b_and!48527 () Bool)

(assert (= b_and!48525 (and (=> t!44155 result!24125) b_and!48527)))

(declare-fun m!1208131 () Bool)

(assert (=> mapNonEmpty!55652 m!1208131))

(declare-fun m!1208133 () Bool)

(assert (=> b!1320425 m!1208133))

(assert (=> b!1320425 m!1208133))

(declare-fun m!1208135 () Bool)

(assert (=> b!1320425 m!1208135))

(declare-fun m!1208137 () Bool)

(assert (=> b!1320423 m!1208137))

(declare-fun m!1208139 () Bool)

(assert (=> b!1320429 m!1208139))

(declare-fun m!1208141 () Bool)

(assert (=> b!1320429 m!1208141))

(declare-fun m!1208143 () Bool)

(assert (=> b!1320429 m!1208143))

(declare-fun m!1208145 () Bool)

(assert (=> b!1320429 m!1208145))

(assert (=> b!1320429 m!1208139))

(declare-fun m!1208147 () Bool)

(assert (=> b!1320429 m!1208147))

(declare-fun m!1208149 () Bool)

(assert (=> b!1320429 m!1208149))

(declare-fun m!1208151 () Bool)

(assert (=> b!1320429 m!1208151))

(declare-fun m!1208153 () Bool)

(assert (=> b!1320429 m!1208153))

(assert (=> b!1320429 m!1208153))

(assert (=> b!1320429 m!1208145))

(declare-fun m!1208155 () Bool)

(assert (=> b!1320429 m!1208155))

(declare-fun m!1208157 () Bool)

(assert (=> b!1320429 m!1208157))

(declare-fun m!1208159 () Bool)

(assert (=> b!1320429 m!1208159))

(assert (=> b!1320427 m!1208159))

(assert (=> b!1320427 m!1208159))

(declare-fun m!1208161 () Bool)

(assert (=> b!1320427 m!1208161))

(assert (=> b!1320430 m!1208159))

(declare-fun m!1208163 () Bool)

(assert (=> start!111526 m!1208163))

(declare-fun m!1208165 () Bool)

(assert (=> start!111526 m!1208165))

(declare-fun m!1208167 () Bool)

(assert (=> start!111526 m!1208167))

(declare-fun m!1208169 () Bool)

(assert (=> b!1320424 m!1208169))

(check-sat (not b!1320423) (not start!111526) (not b!1320424) (not b!1320425) (not b_lambda!23509) (not b!1320429) (not b_next!30183) tp_is_empty!36003 (not b!1320427) (not mapNonEmpty!55652) b_and!48527)
(check-sat b_and!48527 (not b_next!30183))
