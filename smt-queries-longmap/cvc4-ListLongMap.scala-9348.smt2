; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111528 () Bool)

(assert start!111528)

(declare-fun b_free!30185 () Bool)

(declare-fun b_next!30185 () Bool)

(assert (=> start!111528 (= b_free!30185 (not b_next!30185))))

(declare-fun tp!106030 () Bool)

(declare-fun b_and!48529 () Bool)

(assert (=> start!111528 (= tp!106030 b_and!48529)))

(declare-fun mapIsEmpty!55655 () Bool)

(declare-fun mapRes!55655 () Bool)

(assert (=> mapIsEmpty!55655 mapRes!55655))

(declare-fun mapNonEmpty!55655 () Bool)

(declare-fun tp!106031 () Bool)

(declare-fun e!753226 () Bool)

(assert (=> mapNonEmpty!55655 (= mapRes!55655 (and tp!106031 e!753226))))

(declare-fun mapKey!55655 () (_ BitVec 32))

(declare-datatypes ((V!53109 0))(
  ( (V!53110 (val!18077 Int)) )
))
(declare-datatypes ((ValueCell!17104 0))(
  ( (ValueCellFull!17104 (v!20707 V!53109)) (EmptyCell!17104) )
))
(declare-fun mapValue!55655 () ValueCell!17104)

(declare-datatypes ((array!88940 0))(
  ( (array!88941 (arr!42944 (Array (_ BitVec 32) ValueCell!17104)) (size!43494 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88940)

(declare-fun mapRest!55655 () (Array (_ BitVec 32) ValueCell!17104))

(assert (=> mapNonEmpty!55655 (= (arr!42944 _values!1337) (store mapRest!55655 mapKey!55655 mapValue!55655))))

(declare-fun b!1320455 () Bool)

(declare-fun res!876402 () Bool)

(declare-fun e!753228 () Bool)

(assert (=> b!1320455 (=> (not res!876402) (not e!753228))))

(declare-datatypes ((array!88942 0))(
  ( (array!88943 (arr!42945 (Array (_ BitVec 32) (_ BitVec 64))) (size!43495 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88942)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88942 (_ BitVec 32)) Bool)

(assert (=> b!1320455 (= res!876402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320456 () Bool)

(declare-fun res!876401 () Bool)

(assert (=> b!1320456 (=> (not res!876401) (not e!753228))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53109)

(declare-fun minValue!1279 () V!53109)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((tuple2!23276 0))(
  ( (tuple2!23277 (_1!11649 (_ BitVec 64)) (_2!11649 V!53109)) )
))
(declare-datatypes ((List!30426 0))(
  ( (Nil!30423) (Cons!30422 (h!31631 tuple2!23276) (t!44160 List!30426)) )
))
(declare-datatypes ((ListLongMap!20933 0))(
  ( (ListLongMap!20934 (toList!10482 List!30426)) )
))
(declare-fun contains!8637 (ListLongMap!20933 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5487 (array!88942 array!88940 (_ BitVec 32) (_ BitVec 32) V!53109 V!53109 (_ BitVec 32) Int) ListLongMap!20933)

(assert (=> b!1320456 (= res!876401 (contains!8637 (getCurrentListMap!5487 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1320458 () Bool)

(declare-fun res!876398 () Bool)

(assert (=> b!1320458 (=> (not res!876398) (not e!753228))))

(assert (=> b!1320458 (= res!876398 (not (= (select (arr!42945 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1320459 () Bool)

(declare-fun e!753229 () Bool)

(declare-fun tp_is_empty!36005 () Bool)

(assert (=> b!1320459 (= e!753229 tp_is_empty!36005)))

(declare-fun b!1320460 () Bool)

(assert (=> b!1320460 (= e!753228 (not true))))

(declare-fun lt!586957 () ListLongMap!20933)

(assert (=> b!1320460 (contains!8637 lt!586957 k!1164)))

(declare-datatypes ((Unit!43502 0))(
  ( (Unit!43503) )
))
(declare-fun lt!586958 () Unit!43502)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!137 ((_ BitVec 64) (_ BitVec 64) V!53109 ListLongMap!20933) Unit!43502)

(assert (=> b!1320460 (= lt!586958 (lemmaInListMapAfterAddingDiffThenInBefore!137 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586957))))

(declare-fun lt!586959 () ListLongMap!20933)

(assert (=> b!1320460 (contains!8637 lt!586959 k!1164)))

(declare-fun lt!586956 () Unit!43502)

(assert (=> b!1320460 (= lt!586956 (lemmaInListMapAfterAddingDiffThenInBefore!137 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586959))))

(declare-fun +!4541 (ListLongMap!20933 tuple2!23276) ListLongMap!20933)

(assert (=> b!1320460 (= lt!586959 (+!4541 lt!586957 (tuple2!23277 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6176 (array!88942 array!88940 (_ BitVec 32) (_ BitVec 32) V!53109 V!53109 (_ BitVec 32) Int) ListLongMap!20933)

(declare-fun get!21593 (ValueCell!17104 V!53109) V!53109)

(declare-fun dynLambda!3480 (Int (_ BitVec 64)) V!53109)

(assert (=> b!1320460 (= lt!586957 (+!4541 (getCurrentListMapNoExtraKeys!6176 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23277 (select (arr!42945 _keys!1609) from!2000) (get!21593 (select (arr!42944 _values!1337) from!2000) (dynLambda!3480 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320461 () Bool)

(declare-fun res!876403 () Bool)

(assert (=> b!1320461 (=> (not res!876403) (not e!753228))))

(declare-datatypes ((List!30427 0))(
  ( (Nil!30424) (Cons!30423 (h!31632 (_ BitVec 64)) (t!44161 List!30427)) )
))
(declare-fun arrayNoDuplicates!0 (array!88942 (_ BitVec 32) List!30427) Bool)

(assert (=> b!1320461 (= res!876403 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30424))))

(declare-fun b!1320462 () Bool)

(declare-fun res!876404 () Bool)

(assert (=> b!1320462 (=> (not res!876404) (not e!753228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320462 (= res!876404 (validKeyInArray!0 (select (arr!42945 _keys!1609) from!2000)))))

(declare-fun b!1320463 () Bool)

(declare-fun res!876399 () Bool)

(assert (=> b!1320463 (=> (not res!876399) (not e!753228))))

(assert (=> b!1320463 (= res!876399 (and (= (size!43494 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43495 _keys!1609) (size!43494 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!876400 () Bool)

(assert (=> start!111528 (=> (not res!876400) (not e!753228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111528 (= res!876400 (validMask!0 mask!2019))))

(assert (=> start!111528 e!753228))

(declare-fun array_inv!32423 (array!88942) Bool)

(assert (=> start!111528 (array_inv!32423 _keys!1609)))

(assert (=> start!111528 true))

(assert (=> start!111528 tp_is_empty!36005))

(declare-fun e!753227 () Bool)

(declare-fun array_inv!32424 (array!88940) Bool)

(assert (=> start!111528 (and (array_inv!32424 _values!1337) e!753227)))

(assert (=> start!111528 tp!106030))

(declare-fun b!1320457 () Bool)

(declare-fun res!876397 () Bool)

(assert (=> b!1320457 (=> (not res!876397) (not e!753228))))

(assert (=> b!1320457 (= res!876397 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43495 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320464 () Bool)

(assert (=> b!1320464 (= e!753227 (and e!753229 mapRes!55655))))

(declare-fun condMapEmpty!55655 () Bool)

(declare-fun mapDefault!55655 () ValueCell!17104)

