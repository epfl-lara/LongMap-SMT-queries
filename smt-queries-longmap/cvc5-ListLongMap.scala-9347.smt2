; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111518 () Bool)

(assert start!111518)

(declare-fun b_free!30175 () Bool)

(declare-fun b_next!30175 () Bool)

(assert (=> start!111518 (= b_free!30175 (not b_next!30175))))

(declare-fun tp!106001 () Bool)

(declare-fun b_and!48509 () Bool)

(assert (=> start!111518 (= tp!106001 b_and!48509)))

(declare-fun b!1320280 () Bool)

(declare-fun res!876284 () Bool)

(declare-fun e!753150 () Bool)

(assert (=> b!1320280 (=> (not res!876284) (not e!753150))))

(declare-datatypes ((array!88920 0))(
  ( (array!88921 (arr!42934 (Array (_ BitVec 32) (_ BitVec 64))) (size!43484 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88920)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1320280 (= res!876284 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43484 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320281 () Bool)

(assert (=> b!1320281 (= e!753150 (not true))))

(declare-datatypes ((V!53097 0))(
  ( (V!53098 (val!18072 Int)) )
))
(declare-datatypes ((tuple2!23266 0))(
  ( (tuple2!23267 (_1!11644 (_ BitVec 64)) (_2!11644 V!53097)) )
))
(declare-datatypes ((List!30417 0))(
  ( (Nil!30414) (Cons!30413 (h!31622 tuple2!23266) (t!44141 List!30417)) )
))
(declare-datatypes ((ListLongMap!20923 0))(
  ( (ListLongMap!20924 (toList!10477 List!30417)) )
))
(declare-fun lt!586897 () ListLongMap!20923)

(declare-fun contains!8632 (ListLongMap!20923 (_ BitVec 64)) Bool)

(assert (=> b!1320281 (contains!8632 lt!586897 k!1164)))

(declare-fun zeroValue!1279 () V!53097)

(declare-datatypes ((Unit!43492 0))(
  ( (Unit!43493) )
))
(declare-fun lt!586898 () Unit!43492)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!132 ((_ BitVec 64) (_ BitVec 64) V!53097 ListLongMap!20923) Unit!43492)

(assert (=> b!1320281 (= lt!586898 (lemmaInListMapAfterAddingDiffThenInBefore!132 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586897))))

(declare-fun lt!586899 () ListLongMap!20923)

(assert (=> b!1320281 (contains!8632 lt!586899 k!1164)))

(declare-fun lt!586896 () Unit!43492)

(declare-fun minValue!1279 () V!53097)

(assert (=> b!1320281 (= lt!586896 (lemmaInListMapAfterAddingDiffThenInBefore!132 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586899))))

(declare-fun +!4536 (ListLongMap!20923 tuple2!23266) ListLongMap!20923)

(assert (=> b!1320281 (= lt!586899 (+!4536 lt!586897 (tuple2!23267 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((ValueCell!17099 0))(
  ( (ValueCellFull!17099 (v!20702 V!53097)) (EmptyCell!17099) )
))
(declare-datatypes ((array!88922 0))(
  ( (array!88923 (arr!42935 (Array (_ BitVec 32) ValueCell!17099)) (size!43485 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88922)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6171 (array!88920 array!88922 (_ BitVec 32) (_ BitVec 32) V!53097 V!53097 (_ BitVec 32) Int) ListLongMap!20923)

(declare-fun get!21586 (ValueCell!17099 V!53097) V!53097)

(declare-fun dynLambda!3475 (Int (_ BitVec 64)) V!53097)

(assert (=> b!1320281 (= lt!586897 (+!4536 (getCurrentListMapNoExtraKeys!6171 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23267 (select (arr!42934 _keys!1609) from!2000) (get!21586 (select (arr!42935 _values!1337) from!2000) (dynLambda!3475 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320282 () Bool)

(declare-fun e!753153 () Bool)

(declare-fun tp_is_empty!35995 () Bool)

(assert (=> b!1320282 (= e!753153 tp_is_empty!35995)))

(declare-fun b!1320283 () Bool)

(declare-fun res!876279 () Bool)

(assert (=> b!1320283 (=> (not res!876279) (not e!753150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320283 (= res!876279 (validKeyInArray!0 (select (arr!42934 _keys!1609) from!2000)))))

(declare-fun b!1320284 () Bool)

(declare-fun res!876281 () Bool)

(assert (=> b!1320284 (=> (not res!876281) (not e!753150))))

(declare-fun getCurrentListMap!5483 (array!88920 array!88922 (_ BitVec 32) (_ BitVec 32) V!53097 V!53097 (_ BitVec 32) Int) ListLongMap!20923)

(assert (=> b!1320284 (= res!876281 (contains!8632 (getCurrentListMap!5483 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!876278 () Bool)

(assert (=> start!111518 (=> (not res!876278) (not e!753150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111518 (= res!876278 (validMask!0 mask!2019))))

(assert (=> start!111518 e!753150))

(declare-fun array_inv!32415 (array!88920) Bool)

(assert (=> start!111518 (array_inv!32415 _keys!1609)))

(assert (=> start!111518 true))

(assert (=> start!111518 tp_is_empty!35995))

(declare-fun e!753152 () Bool)

(declare-fun array_inv!32416 (array!88922) Bool)

(assert (=> start!111518 (and (array_inv!32416 _values!1337) e!753152)))

(assert (=> start!111518 tp!106001))

(declare-fun b!1320285 () Bool)

(declare-fun res!876283 () Bool)

(assert (=> b!1320285 (=> (not res!876283) (not e!753150))))

(declare-datatypes ((List!30418 0))(
  ( (Nil!30415) (Cons!30414 (h!31623 (_ BitVec 64)) (t!44142 List!30418)) )
))
(declare-fun arrayNoDuplicates!0 (array!88920 (_ BitVec 32) List!30418) Bool)

(assert (=> b!1320285 (= res!876283 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30415))))

(declare-fun b!1320286 () Bool)

(declare-fun res!876280 () Bool)

(assert (=> b!1320286 (=> (not res!876280) (not e!753150))))

(assert (=> b!1320286 (= res!876280 (not (= (select (arr!42934 _keys!1609) from!2000) k!1164)))))

(declare-fun mapIsEmpty!55640 () Bool)

(declare-fun mapRes!55640 () Bool)

(assert (=> mapIsEmpty!55640 mapRes!55640))

(declare-fun b!1320287 () Bool)

(declare-fun e!753151 () Bool)

(assert (=> b!1320287 (= e!753151 tp_is_empty!35995)))

(declare-fun mapNonEmpty!55640 () Bool)

(declare-fun tp!106000 () Bool)

(assert (=> mapNonEmpty!55640 (= mapRes!55640 (and tp!106000 e!753153))))

(declare-fun mapValue!55640 () ValueCell!17099)

(declare-fun mapKey!55640 () (_ BitVec 32))

(declare-fun mapRest!55640 () (Array (_ BitVec 32) ValueCell!17099))

(assert (=> mapNonEmpty!55640 (= (arr!42935 _values!1337) (store mapRest!55640 mapKey!55640 mapValue!55640))))

(declare-fun b!1320288 () Bool)

(declare-fun res!876282 () Bool)

(assert (=> b!1320288 (=> (not res!876282) (not e!753150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88920 (_ BitVec 32)) Bool)

(assert (=> b!1320288 (= res!876282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320289 () Bool)

(declare-fun res!876277 () Bool)

(assert (=> b!1320289 (=> (not res!876277) (not e!753150))))

(assert (=> b!1320289 (= res!876277 (and (= (size!43485 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43484 _keys!1609) (size!43485 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320290 () Bool)

(assert (=> b!1320290 (= e!753152 (and e!753151 mapRes!55640))))

(declare-fun condMapEmpty!55640 () Bool)

(declare-fun mapDefault!55640 () ValueCell!17099)

