; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111664 () Bool)

(assert start!111664)

(declare-fun b_free!30097 () Bool)

(declare-fun b_next!30097 () Bool)

(assert (=> start!111664 (= b_free!30097 (not b_next!30097))))

(declare-fun tp!105766 () Bool)

(declare-fun b_and!48355 () Bool)

(assert (=> start!111664 (= tp!105766 b_and!48355)))

(declare-fun mapNonEmpty!55523 () Bool)

(declare-fun mapRes!55523 () Bool)

(declare-fun tp!105767 () Bool)

(declare-fun e!753409 () Bool)

(assert (=> mapNonEmpty!55523 (= mapRes!55523 (and tp!105767 e!753409))))

(declare-datatypes ((V!52993 0))(
  ( (V!52994 (val!18033 Int)) )
))
(declare-datatypes ((ValueCell!17060 0))(
  ( (ValueCellFull!17060 (v!20658 V!52993)) (EmptyCell!17060) )
))
(declare-fun mapValue!55523 () ValueCell!17060)

(declare-datatypes ((array!88847 0))(
  ( (array!88848 (arr!42893 (Array (_ BitVec 32) ValueCell!17060)) (size!43444 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88847)

(declare-fun mapRest!55523 () (Array (_ BitVec 32) ValueCell!17060))

(declare-fun mapKey!55523 () (_ BitVec 32))

(assert (=> mapNonEmpty!55523 (= (arr!42893 _values!1337) (store mapRest!55523 mapKey!55523 mapValue!55523))))

(declare-fun mapIsEmpty!55523 () Bool)

(assert (=> mapIsEmpty!55523 mapRes!55523))

(declare-fun b!1320214 () Bool)

(declare-fun res!875859 () Bool)

(declare-fun e!753412 () Bool)

(assert (=> b!1320214 (=> (not res!875859) (not e!753412))))

(declare-datatypes ((array!88849 0))(
  ( (array!88850 (arr!42894 (Array (_ BitVec 32) (_ BitVec 64))) (size!43445 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88849)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1320214 (= res!875859 (not (= (select (arr!42894 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!875861 () Bool)

(assert (=> start!111664 (=> (not res!875861) (not e!753412))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111664 (= res!875861 (validMask!0 mask!2019))))

(assert (=> start!111664 e!753412))

(declare-fun array_inv!32655 (array!88849) Bool)

(assert (=> start!111664 (array_inv!32655 _keys!1609)))

(assert (=> start!111664 true))

(declare-fun tp_is_empty!35917 () Bool)

(assert (=> start!111664 tp_is_empty!35917))

(declare-fun e!753411 () Bool)

(declare-fun array_inv!32656 (array!88847) Bool)

(assert (=> start!111664 (and (array_inv!32656 _values!1337) e!753411)))

(assert (=> start!111664 tp!105766))

(declare-fun b!1320215 () Bool)

(declare-fun e!753408 () Bool)

(assert (=> b!1320215 (= e!753411 (and e!753408 mapRes!55523))))

(declare-fun condMapEmpty!55523 () Bool)

(declare-fun mapDefault!55523 () ValueCell!17060)

(assert (=> b!1320215 (= condMapEmpty!55523 (= (arr!42893 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17060)) mapDefault!55523)))))

(declare-fun b!1320216 () Bool)

(assert (=> b!1320216 (= e!753409 tp_is_empty!35917)))

(declare-fun b!1320217 () Bool)

(declare-fun res!875865 () Bool)

(assert (=> b!1320217 (=> (not res!875865) (not e!753412))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1320217 (= res!875865 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43445 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320218 () Bool)

(declare-fun res!875864 () Bool)

(assert (=> b!1320218 (=> (not res!875864) (not e!753412))))

(declare-fun zeroValue!1279 () V!52993)

(declare-fun minValue!1279 () V!52993)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23238 0))(
  ( (tuple2!23239 (_1!11630 (_ BitVec 64)) (_2!11630 V!52993)) )
))
(declare-datatypes ((List!30400 0))(
  ( (Nil!30397) (Cons!30396 (h!31614 tuple2!23238) (t!44038 List!30400)) )
))
(declare-datatypes ((ListLongMap!20903 0))(
  ( (ListLongMap!20904 (toList!10467 List!30400)) )
))
(declare-fun contains!8634 (ListLongMap!20903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5468 (array!88849 array!88847 (_ BitVec 32) (_ BitVec 32) V!52993 V!52993 (_ BitVec 32) Int) ListLongMap!20903)

(assert (=> b!1320218 (= res!875864 (contains!8634 (getCurrentListMap!5468 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320219 () Bool)

(declare-fun res!875860 () Bool)

(assert (=> b!1320219 (=> (not res!875860) (not e!753412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88849 (_ BitVec 32)) Bool)

(assert (=> b!1320219 (= res!875860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320220 () Bool)

(declare-fun res!875866 () Bool)

(assert (=> b!1320220 (=> (not res!875866) (not e!753412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320220 (= res!875866 (validKeyInArray!0 (select (arr!42894 _keys!1609) from!2000)))))

(declare-fun b!1320221 () Bool)

(declare-fun res!875863 () Bool)

(assert (=> b!1320221 (=> (not res!875863) (not e!753412))))

(declare-datatypes ((List!30401 0))(
  ( (Nil!30398) (Cons!30397 (h!31615 (_ BitVec 64)) (t!44039 List!30401)) )
))
(declare-fun arrayNoDuplicates!0 (array!88849 (_ BitVec 32) List!30401) Bool)

(assert (=> b!1320221 (= res!875863 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30398))))

(declare-fun b!1320222 () Bool)

(assert (=> b!1320222 (= e!753412 (not true))))

(declare-fun lt!587027 () ListLongMap!20903)

(assert (=> b!1320222 (contains!8634 lt!587027 k0!1164)))

(declare-datatypes ((Unit!43399 0))(
  ( (Unit!43400) )
))
(declare-fun lt!587026 () Unit!43399)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!111 ((_ BitVec 64) (_ BitVec 64) V!52993 ListLongMap!20903) Unit!43399)

(assert (=> b!1320222 (= lt!587026 (lemmaInListMapAfterAddingDiffThenInBefore!111 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587027))))

(declare-fun +!4556 (ListLongMap!20903 tuple2!23238) ListLongMap!20903)

(declare-fun getCurrentListMapNoExtraKeys!6195 (array!88849 array!88847 (_ BitVec 32) (_ BitVec 32) V!52993 V!52993 (_ BitVec 32) Int) ListLongMap!20903)

(declare-fun get!21583 (ValueCell!17060 V!52993) V!52993)

(declare-fun dynLambda!3510 (Int (_ BitVec 64)) V!52993)

(assert (=> b!1320222 (= lt!587027 (+!4556 (+!4556 (getCurrentListMapNoExtraKeys!6195 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23239 (select (arr!42894 _keys!1609) from!2000) (get!21583 (select (arr!42893 _values!1337) from!2000) (dynLambda!3510 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1320223 () Bool)

(declare-fun res!875862 () Bool)

(assert (=> b!1320223 (=> (not res!875862) (not e!753412))))

(assert (=> b!1320223 (= res!875862 (and (= (size!43444 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43445 _keys!1609) (size!43444 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320224 () Bool)

(assert (=> b!1320224 (= e!753408 tp_is_empty!35917)))

(assert (= (and start!111664 res!875861) b!1320223))

(assert (= (and b!1320223 res!875862) b!1320219))

(assert (= (and b!1320219 res!875860) b!1320221))

(assert (= (and b!1320221 res!875863) b!1320217))

(assert (= (and b!1320217 res!875865) b!1320218))

(assert (= (and b!1320218 res!875864) b!1320214))

(assert (= (and b!1320214 res!875859) b!1320220))

(assert (= (and b!1320220 res!875866) b!1320222))

(assert (= (and b!1320215 condMapEmpty!55523) mapIsEmpty!55523))

(assert (= (and b!1320215 (not condMapEmpty!55523)) mapNonEmpty!55523))

(get-info :version)

(assert (= (and mapNonEmpty!55523 ((_ is ValueCellFull!17060) mapValue!55523)) b!1320216))

(assert (= (and b!1320215 ((_ is ValueCellFull!17060) mapDefault!55523)) b!1320224))

(assert (= start!111664 b!1320215))

(declare-fun b_lambda!23417 () Bool)

(assert (=> (not b_lambda!23417) (not b!1320222)))

(declare-fun t!44037 () Bool)

(declare-fun tb!11441 () Bool)

(assert (=> (and start!111664 (= defaultEntry!1340 defaultEntry!1340) t!44037) tb!11441))

(declare-fun result!23945 () Bool)

(assert (=> tb!11441 (= result!23945 tp_is_empty!35917)))

(assert (=> b!1320222 t!44037))

(declare-fun b_and!48357 () Bool)

(assert (= b_and!48355 (and (=> t!44037 result!23945) b_and!48357)))

(declare-fun m!1208093 () Bool)

(assert (=> mapNonEmpty!55523 m!1208093))

(declare-fun m!1208095 () Bool)

(assert (=> b!1320219 m!1208095))

(declare-fun m!1208097 () Bool)

(assert (=> b!1320214 m!1208097))

(declare-fun m!1208099 () Bool)

(assert (=> b!1320221 m!1208099))

(declare-fun m!1208101 () Bool)

(assert (=> b!1320218 m!1208101))

(assert (=> b!1320218 m!1208101))

(declare-fun m!1208103 () Bool)

(assert (=> b!1320218 m!1208103))

(declare-fun m!1208105 () Bool)

(assert (=> start!111664 m!1208105))

(declare-fun m!1208107 () Bool)

(assert (=> start!111664 m!1208107))

(declare-fun m!1208109 () Bool)

(assert (=> start!111664 m!1208109))

(assert (=> b!1320220 m!1208097))

(assert (=> b!1320220 m!1208097))

(declare-fun m!1208111 () Bool)

(assert (=> b!1320220 m!1208111))

(declare-fun m!1208113 () Bool)

(assert (=> b!1320222 m!1208113))

(declare-fun m!1208115 () Bool)

(assert (=> b!1320222 m!1208115))

(assert (=> b!1320222 m!1208113))

(declare-fun m!1208117 () Bool)

(assert (=> b!1320222 m!1208117))

(declare-fun m!1208119 () Bool)

(assert (=> b!1320222 m!1208119))

(declare-fun m!1208121 () Bool)

(assert (=> b!1320222 m!1208121))

(assert (=> b!1320222 m!1208117))

(declare-fun m!1208123 () Bool)

(assert (=> b!1320222 m!1208123))

(assert (=> b!1320222 m!1208121))

(assert (=> b!1320222 m!1208115))

(declare-fun m!1208125 () Bool)

(assert (=> b!1320222 m!1208125))

(declare-fun m!1208127 () Bool)

(assert (=> b!1320222 m!1208127))

(assert (=> b!1320222 m!1208097))

(check-sat (not b!1320220) (not b!1320222) (not start!111664) b_and!48357 (not mapNonEmpty!55523) (not b_lambda!23417) (not b!1320221) (not b!1320218) (not b_next!30097) (not b!1320219) tp_is_empty!35917)
(check-sat b_and!48357 (not b_next!30097))
