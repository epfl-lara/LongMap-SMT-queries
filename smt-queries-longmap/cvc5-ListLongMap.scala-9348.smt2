; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111524 () Bool)

(assert start!111524)

(declare-fun b_free!30181 () Bool)

(declare-fun b_next!30181 () Bool)

(assert (=> start!111524 (= b_free!30181 (not b_next!30181))))

(declare-fun tp!106019 () Bool)

(declare-fun b_and!48521 () Bool)

(assert (=> start!111524 (= tp!106019 b_and!48521)))

(declare-fun b!1320385 () Bool)

(declare-fun res!876349 () Bool)

(declare-fun e!753197 () Bool)

(assert (=> b!1320385 (=> (not res!876349) (not e!753197))))

(declare-datatypes ((array!88932 0))(
  ( (array!88933 (arr!42940 (Array (_ BitVec 32) (_ BitVec 64))) (size!43490 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88932)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1320385 (= res!876349 (not (= (select (arr!42940 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1320386 () Bool)

(declare-fun res!876353 () Bool)

(assert (=> b!1320386 (=> (not res!876353) (not e!753197))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88932 (_ BitVec 32)) Bool)

(assert (=> b!1320386 (= res!876353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320387 () Bool)

(declare-fun res!876350 () Bool)

(assert (=> b!1320387 (=> (not res!876350) (not e!753197))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53105 0))(
  ( (V!53106 (val!18075 Int)) )
))
(declare-fun zeroValue!1279 () V!53105)

(declare-datatypes ((ValueCell!17102 0))(
  ( (ValueCellFull!17102 (v!20705 V!53105)) (EmptyCell!17102) )
))
(declare-datatypes ((array!88934 0))(
  ( (array!88935 (arr!42941 (Array (_ BitVec 32) ValueCell!17102)) (size!43491 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88934)

(declare-fun minValue!1279 () V!53105)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23272 0))(
  ( (tuple2!23273 (_1!11647 (_ BitVec 64)) (_2!11647 V!53105)) )
))
(declare-datatypes ((List!30422 0))(
  ( (Nil!30419) (Cons!30418 (h!31627 tuple2!23272) (t!44152 List!30422)) )
))
(declare-datatypes ((ListLongMap!20929 0))(
  ( (ListLongMap!20930 (toList!10480 List!30422)) )
))
(declare-fun contains!8635 (ListLongMap!20929 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5485 (array!88932 array!88934 (_ BitVec 32) (_ BitVec 32) V!53105 V!53105 (_ BitVec 32) Int) ListLongMap!20929)

(assert (=> b!1320387 (= res!876350 (contains!8635 (getCurrentListMap!5485 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1320388 () Bool)

(declare-fun res!876354 () Bool)

(assert (=> b!1320388 (=> (not res!876354) (not e!753197))))

(assert (=> b!1320388 (= res!876354 (and (= (size!43491 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43490 _keys!1609) (size!43491 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320389 () Bool)

(declare-fun res!876356 () Bool)

(assert (=> b!1320389 (=> (not res!876356) (not e!753197))))

(declare-datatypes ((List!30423 0))(
  ( (Nil!30420) (Cons!30419 (h!31628 (_ BitVec 64)) (t!44153 List!30423)) )
))
(declare-fun arrayNoDuplicates!0 (array!88932 (_ BitVec 32) List!30423) Bool)

(assert (=> b!1320389 (= res!876356 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30420))))

(declare-fun b!1320390 () Bool)

(assert (=> b!1320390 (= e!753197 (not true))))

(declare-fun lt!586935 () ListLongMap!20929)

(assert (=> b!1320390 (contains!8635 lt!586935 k!1164)))

(declare-datatypes ((Unit!43498 0))(
  ( (Unit!43499) )
))
(declare-fun lt!586933 () Unit!43498)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!135 ((_ BitVec 64) (_ BitVec 64) V!53105 ListLongMap!20929) Unit!43498)

(assert (=> b!1320390 (= lt!586933 (lemmaInListMapAfterAddingDiffThenInBefore!135 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586935))))

(declare-fun lt!586934 () ListLongMap!20929)

(assert (=> b!1320390 (contains!8635 lt!586934 k!1164)))

(declare-fun lt!586932 () Unit!43498)

(assert (=> b!1320390 (= lt!586932 (lemmaInListMapAfterAddingDiffThenInBefore!135 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586934))))

(declare-fun +!4539 (ListLongMap!20929 tuple2!23272) ListLongMap!20929)

(assert (=> b!1320390 (= lt!586934 (+!4539 lt!586935 (tuple2!23273 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6174 (array!88932 array!88934 (_ BitVec 32) (_ BitVec 32) V!53105 V!53105 (_ BitVec 32) Int) ListLongMap!20929)

(declare-fun get!21591 (ValueCell!17102 V!53105) V!53105)

(declare-fun dynLambda!3478 (Int (_ BitVec 64)) V!53105)

(assert (=> b!1320390 (= lt!586935 (+!4539 (getCurrentListMapNoExtraKeys!6174 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23273 (select (arr!42940 _keys!1609) from!2000) (get!21591 (select (arr!42941 _values!1337) from!2000) (dynLambda!3478 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320391 () Bool)

(declare-fun e!753198 () Bool)

(declare-fun tp_is_empty!36001 () Bool)

(assert (=> b!1320391 (= e!753198 tp_is_empty!36001)))

(declare-fun res!876352 () Bool)

(assert (=> start!111524 (=> (not res!876352) (not e!753197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111524 (= res!876352 (validMask!0 mask!2019))))

(assert (=> start!111524 e!753197))

(declare-fun array_inv!32419 (array!88932) Bool)

(assert (=> start!111524 (array_inv!32419 _keys!1609)))

(assert (=> start!111524 true))

(assert (=> start!111524 tp_is_empty!36001))

(declare-fun e!753199 () Bool)

(declare-fun array_inv!32420 (array!88934) Bool)

(assert (=> start!111524 (and (array_inv!32420 _values!1337) e!753199)))

(assert (=> start!111524 tp!106019))

(declare-fun mapNonEmpty!55649 () Bool)

(declare-fun mapRes!55649 () Bool)

(declare-fun tp!106018 () Bool)

(declare-fun e!753195 () Bool)

(assert (=> mapNonEmpty!55649 (= mapRes!55649 (and tp!106018 e!753195))))

(declare-fun mapRest!55649 () (Array (_ BitVec 32) ValueCell!17102))

(declare-fun mapValue!55649 () ValueCell!17102)

(declare-fun mapKey!55649 () (_ BitVec 32))

(assert (=> mapNonEmpty!55649 (= (arr!42941 _values!1337) (store mapRest!55649 mapKey!55649 mapValue!55649))))

(declare-fun mapIsEmpty!55649 () Bool)

(assert (=> mapIsEmpty!55649 mapRes!55649))

(declare-fun b!1320392 () Bool)

(assert (=> b!1320392 (= e!753195 tp_is_empty!36001)))

(declare-fun b!1320393 () Bool)

(declare-fun res!876351 () Bool)

(assert (=> b!1320393 (=> (not res!876351) (not e!753197))))

(assert (=> b!1320393 (= res!876351 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43490 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320394 () Bool)

(declare-fun res!876355 () Bool)

(assert (=> b!1320394 (=> (not res!876355) (not e!753197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320394 (= res!876355 (validKeyInArray!0 (select (arr!42940 _keys!1609) from!2000)))))

(declare-fun b!1320395 () Bool)

(assert (=> b!1320395 (= e!753199 (and e!753198 mapRes!55649))))

(declare-fun condMapEmpty!55649 () Bool)

(declare-fun mapDefault!55649 () ValueCell!17102)

