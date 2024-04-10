; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111534 () Bool)

(assert start!111534)

(declare-fun b_free!30191 () Bool)

(declare-fun b_next!30191 () Bool)

(assert (=> start!111534 (= b_free!30191 (not b_next!30191))))

(declare-fun tp!106048 () Bool)

(declare-fun b_and!48541 () Bool)

(assert (=> start!111534 (= tp!106048 b_and!48541)))

(declare-fun b!1320561 () Bool)

(declare-fun res!876469 () Bool)

(declare-fun e!753270 () Bool)

(assert (=> b!1320561 (=> (not res!876469) (not e!753270))))

(declare-datatypes ((array!88952 0))(
  ( (array!88953 (arr!42950 (Array (_ BitVec 32) (_ BitVec 64))) (size!43500 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88952)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1320561 (= res!876469 (not (= (select (arr!42950 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1320562 () Bool)

(declare-fun res!876474 () Bool)

(assert (=> b!1320562 (=> (not res!876474) (not e!753270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320562 (= res!876474 (validKeyInArray!0 (select (arr!42950 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55664 () Bool)

(declare-fun mapRes!55664 () Bool)

(declare-fun tp!106049 () Bool)

(declare-fun e!753273 () Bool)

(assert (=> mapNonEmpty!55664 (= mapRes!55664 (and tp!106049 e!753273))))

(declare-datatypes ((V!53117 0))(
  ( (V!53118 (val!18080 Int)) )
))
(declare-datatypes ((ValueCell!17107 0))(
  ( (ValueCellFull!17107 (v!20710 V!53117)) (EmptyCell!17107) )
))
(declare-fun mapRest!55664 () (Array (_ BitVec 32) ValueCell!17107))

(declare-datatypes ((array!88954 0))(
  ( (array!88955 (arr!42951 (Array (_ BitVec 32) ValueCell!17107)) (size!43501 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88954)

(declare-fun mapValue!55664 () ValueCell!17107)

(declare-fun mapKey!55664 () (_ BitVec 32))

(assert (=> mapNonEmpty!55664 (= (arr!42951 _values!1337) (store mapRest!55664 mapKey!55664 mapValue!55664))))

(declare-fun b!1320563 () Bool)

(assert (=> b!1320563 (= e!753270 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23282 0))(
  ( (tuple2!23283 (_1!11652 (_ BitVec 64)) (_2!11652 V!53117)) )
))
(declare-datatypes ((List!30432 0))(
  ( (Nil!30429) (Cons!30428 (h!31637 tuple2!23282) (t!44172 List!30432)) )
))
(declare-datatypes ((ListLongMap!20939 0))(
  ( (ListLongMap!20940 (toList!10485 List!30432)) )
))
(declare-fun lt!586995 () ListLongMap!20939)

(declare-fun contains!8640 (ListLongMap!20939 (_ BitVec 64)) Bool)

(assert (=> b!1320563 (contains!8640 lt!586995 k!1164)))

(declare-datatypes ((Unit!43508 0))(
  ( (Unit!43509) )
))
(declare-fun lt!586994 () Unit!43508)

(declare-fun zeroValue!1279 () V!53117)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!140 ((_ BitVec 64) (_ BitVec 64) V!53117 ListLongMap!20939) Unit!43508)

(assert (=> b!1320563 (= lt!586994 (lemmaInListMapAfterAddingDiffThenInBefore!140 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586995))))

(declare-fun lt!586993 () ListLongMap!20939)

(assert (=> b!1320563 (contains!8640 lt!586993 k!1164)))

(declare-fun minValue!1279 () V!53117)

(declare-fun lt!586992 () Unit!43508)

(assert (=> b!1320563 (= lt!586992 (lemmaInListMapAfterAddingDiffThenInBefore!140 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586993))))

(declare-fun +!4544 (ListLongMap!20939 tuple2!23282) ListLongMap!20939)

(assert (=> b!1320563 (= lt!586993 (+!4544 lt!586995 (tuple2!23283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6179 (array!88952 array!88954 (_ BitVec 32) (_ BitVec 32) V!53117 V!53117 (_ BitVec 32) Int) ListLongMap!20939)

(declare-fun get!21598 (ValueCell!17107 V!53117) V!53117)

(declare-fun dynLambda!3483 (Int (_ BitVec 64)) V!53117)

(assert (=> b!1320563 (= lt!586995 (+!4544 (getCurrentListMapNoExtraKeys!6179 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23283 (select (arr!42950 _keys!1609) from!2000) (get!21598 (select (arr!42951 _values!1337) from!2000) (dynLambda!3483 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320564 () Bool)

(declare-fun res!876476 () Bool)

(assert (=> b!1320564 (=> (not res!876476) (not e!753270))))

(assert (=> b!1320564 (= res!876476 (and (= (size!43501 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43500 _keys!1609) (size!43501 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55664 () Bool)

(assert (=> mapIsEmpty!55664 mapRes!55664))

(declare-fun b!1320565 () Bool)

(declare-fun res!876471 () Bool)

(assert (=> b!1320565 (=> (not res!876471) (not e!753270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88952 (_ BitVec 32)) Bool)

(assert (=> b!1320565 (= res!876471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320566 () Bool)

(declare-fun e!753272 () Bool)

(declare-fun e!753271 () Bool)

(assert (=> b!1320566 (= e!753272 (and e!753271 mapRes!55664))))

(declare-fun condMapEmpty!55664 () Bool)

(declare-fun mapDefault!55664 () ValueCell!17107)

