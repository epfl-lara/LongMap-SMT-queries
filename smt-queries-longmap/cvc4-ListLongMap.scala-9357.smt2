; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111582 () Bool)

(assert start!111582)

(declare-fun b_free!30239 () Bool)

(declare-fun b_next!30239 () Bool)

(assert (=> start!111582 (= b_free!30239 (not b_next!30239))))

(declare-fun tp!106192 () Bool)

(declare-fun b_and!48637 () Bool)

(assert (=> start!111582 (= tp!106192 b_and!48637)))

(declare-fun b!1321400 () Bool)

(declare-fun res!877046 () Bool)

(declare-fun e!753633 () Bool)

(assert (=> b!1321400 (=> (not res!877046) (not e!753633))))

(declare-datatypes ((array!89044 0))(
  ( (array!89045 (arr!42996 (Array (_ BitVec 32) (_ BitVec 64))) (size!43546 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89044)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53181 0))(
  ( (V!53182 (val!18104 Int)) )
))
(declare-datatypes ((ValueCell!17131 0))(
  ( (ValueCellFull!17131 (v!20734 V!53181)) (EmptyCell!17131) )
))
(declare-datatypes ((array!89046 0))(
  ( (array!89047 (arr!42997 (Array (_ BitVec 32) ValueCell!17131)) (size!43547 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89046)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1321400 (= res!877046 (and (= (size!43547 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43546 _keys!1609) (size!43547 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!877049 () Bool)

(assert (=> start!111582 (=> (not res!877049) (not e!753633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111582 (= res!877049 (validMask!0 mask!2019))))

(assert (=> start!111582 e!753633))

(declare-fun array_inv!32459 (array!89044) Bool)

(assert (=> start!111582 (array_inv!32459 _keys!1609)))

(assert (=> start!111582 true))

(declare-fun tp_is_empty!36059 () Bool)

(assert (=> start!111582 tp_is_empty!36059))

(declare-fun e!753632 () Bool)

(declare-fun array_inv!32460 (array!89046) Bool)

(assert (=> start!111582 (and (array_inv!32460 _values!1337) e!753632)))

(assert (=> start!111582 tp!106192))

(declare-fun b!1321401 () Bool)

(declare-fun e!753634 () Bool)

(assert (=> b!1321401 (= e!753634 tp_is_empty!36059)))

(declare-fun mapNonEmpty!55736 () Bool)

(declare-fun mapRes!55736 () Bool)

(declare-fun tp!106193 () Bool)

(assert (=> mapNonEmpty!55736 (= mapRes!55736 (and tp!106193 e!753634))))

(declare-fun mapKey!55736 () (_ BitVec 32))

(declare-fun mapValue!55736 () ValueCell!17131)

(declare-fun mapRest!55736 () (Array (_ BitVec 32) ValueCell!17131))

(assert (=> mapNonEmpty!55736 (= (arr!42997 _values!1337) (store mapRest!55736 mapKey!55736 mapValue!55736))))

(declare-fun b!1321402 () Bool)

(declare-fun res!877045 () Bool)

(assert (=> b!1321402 (=> (not res!877045) (not e!753633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89044 (_ BitVec 32)) Bool)

(assert (=> b!1321402 (= res!877045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321403 () Bool)

(declare-fun res!877052 () Bool)

(assert (=> b!1321403 (=> (not res!877052) (not e!753633))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1321403 (= res!877052 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43546 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321404 () Bool)

(declare-fun res!877048 () Bool)

(assert (=> b!1321404 (=> (not res!877048) (not e!753633))))

(declare-fun zeroValue!1279 () V!53181)

(declare-fun minValue!1279 () V!53181)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23316 0))(
  ( (tuple2!23317 (_1!11669 (_ BitVec 64)) (_2!11669 V!53181)) )
))
(declare-datatypes ((List!30465 0))(
  ( (Nil!30462) (Cons!30461 (h!31670 tuple2!23316) (t!44253 List!30465)) )
))
(declare-datatypes ((ListLongMap!20973 0))(
  ( (ListLongMap!20974 (toList!10502 List!30465)) )
))
(declare-fun contains!8657 (ListLongMap!20973 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5504 (array!89044 array!89046 (_ BitVec 32) (_ BitVec 32) V!53181 V!53181 (_ BitVec 32) Int) ListLongMap!20973)

(assert (=> b!1321404 (= res!877048 (contains!8657 (getCurrentListMap!5504 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1321405 () Bool)

(assert (=> b!1321405 (= e!753633 (not true))))

(declare-fun lt!587441 () ListLongMap!20973)

(assert (=> b!1321405 (contains!8657 lt!587441 k!1164)))

(declare-datatypes ((Unit!43538 0))(
  ( (Unit!43539) )
))
(declare-fun lt!587444 () Unit!43538)

(declare-fun lt!587440 () V!53181)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!155 ((_ BitVec 64) (_ BitVec 64) V!53181 ListLongMap!20973) Unit!43538)

(assert (=> b!1321405 (= lt!587444 (lemmaInListMapAfterAddingDiffThenInBefore!155 k!1164 (select (arr!42996 _keys!1609) from!2000) lt!587440 lt!587441))))

(declare-fun lt!587445 () ListLongMap!20973)

(assert (=> b!1321405 (contains!8657 lt!587445 k!1164)))

(declare-fun lt!587442 () Unit!43538)

(assert (=> b!1321405 (= lt!587442 (lemmaInListMapAfterAddingDiffThenInBefore!155 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587445))))

(declare-fun lt!587439 () ListLongMap!20973)

(assert (=> b!1321405 (contains!8657 lt!587439 k!1164)))

(declare-fun lt!587443 () Unit!43538)

(assert (=> b!1321405 (= lt!587443 (lemmaInListMapAfterAddingDiffThenInBefore!155 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587439))))

(declare-fun +!4559 (ListLongMap!20973 tuple2!23316) ListLongMap!20973)

(assert (=> b!1321405 (= lt!587439 (+!4559 lt!587445 (tuple2!23317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321405 (= lt!587445 (+!4559 lt!587441 (tuple2!23317 (select (arr!42996 _keys!1609) from!2000) lt!587440)))))

(declare-fun get!21629 (ValueCell!17131 V!53181) V!53181)

(declare-fun dynLambda!3498 (Int (_ BitVec 64)) V!53181)

(assert (=> b!1321405 (= lt!587440 (get!21629 (select (arr!42997 _values!1337) from!2000) (dynLambda!3498 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6194 (array!89044 array!89046 (_ BitVec 32) (_ BitVec 32) V!53181 V!53181 (_ BitVec 32) Int) ListLongMap!20973)

(assert (=> b!1321405 (= lt!587441 (getCurrentListMapNoExtraKeys!6194 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapIsEmpty!55736 () Bool)

(assert (=> mapIsEmpty!55736 mapRes!55736))

(declare-fun b!1321406 () Bool)

(declare-fun res!877047 () Bool)

(assert (=> b!1321406 (=> (not res!877047) (not e!753633))))

(assert (=> b!1321406 (= res!877047 (not (= (select (arr!42996 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1321407 () Bool)

(declare-fun res!877051 () Bool)

(assert (=> b!1321407 (=> (not res!877051) (not e!753633))))

(declare-datatypes ((List!30466 0))(
  ( (Nil!30463) (Cons!30462 (h!31671 (_ BitVec 64)) (t!44254 List!30466)) )
))
(declare-fun arrayNoDuplicates!0 (array!89044 (_ BitVec 32) List!30466) Bool)

(assert (=> b!1321407 (= res!877051 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30463))))

(declare-fun b!1321408 () Bool)

(declare-fun e!753630 () Bool)

(assert (=> b!1321408 (= e!753632 (and e!753630 mapRes!55736))))

(declare-fun condMapEmpty!55736 () Bool)

(declare-fun mapDefault!55736 () ValueCell!17131)

