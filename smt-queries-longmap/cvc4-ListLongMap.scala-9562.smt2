; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113238 () Bool)

(assert start!113238)

(declare-fun b_free!31289 () Bool)

(declare-fun b_next!31289 () Bool)

(assert (=> start!113238 (= b_free!31289 (not b_next!31289))))

(declare-fun tp!109671 () Bool)

(declare-fun b_and!50485 () Bool)

(assert (=> start!113238 (= tp!109671 b_and!50485)))

(declare-fun res!891302 () Bool)

(declare-fun e!764644 () Bool)

(assert (=> start!113238 (=> (not res!891302) (not e!764644))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113238 (= res!891302 (validMask!0 mask!1977))))

(assert (=> start!113238 e!764644))

(declare-fun tp_is_empty!37289 () Bool)

(assert (=> start!113238 tp_is_empty!37289))

(assert (=> start!113238 true))

(declare-datatypes ((array!91424 0))(
  ( (array!91425 (arr!44168 (Array (_ BitVec 32) (_ BitVec 64))) (size!44718 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91424)

(declare-fun array_inv!33293 (array!91424) Bool)

(assert (=> start!113238 (array_inv!33293 _keys!1571)))

(declare-datatypes ((V!54821 0))(
  ( (V!54822 (val!18719 Int)) )
))
(declare-datatypes ((ValueCell!17746 0))(
  ( (ValueCellFull!17746 (v!21367 V!54821)) (EmptyCell!17746) )
))
(declare-datatypes ((array!91426 0))(
  ( (array!91427 (arr!44169 (Array (_ BitVec 32) ValueCell!17746)) (size!44719 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91426)

(declare-fun e!764646 () Bool)

(declare-fun array_inv!33294 (array!91426) Bool)

(assert (=> start!113238 (and (array_inv!33294 _values!1303) e!764646)))

(assert (=> start!113238 tp!109671))

(declare-fun b!1343385 () Bool)

(assert (=> b!1343385 (= e!764644 (not true))))

(declare-datatypes ((tuple2!24114 0))(
  ( (tuple2!24115 (_1!12068 (_ BitVec 64)) (_2!12068 V!54821)) )
))
(declare-datatypes ((List!31272 0))(
  ( (Nil!31269) (Cons!31268 (h!32477 tuple2!24114) (t!45772 List!31272)) )
))
(declare-datatypes ((ListLongMap!21771 0))(
  ( (ListLongMap!21772 (toList!10901 List!31272)) )
))
(declare-fun lt!594899 () ListLongMap!21771)

(declare-fun zeroValue!1245 () V!54821)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9077 (ListLongMap!21771 (_ BitVec 64)) Bool)

(declare-fun +!4809 (ListLongMap!21771 tuple2!24114) ListLongMap!21771)

(assert (=> b!1343385 (contains!9077 (+!4809 lt!594899 (tuple2!24115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142)))

(declare-datatypes ((Unit!44095 0))(
  ( (Unit!44096) )
))
(declare-fun lt!594900 () Unit!44095)

(declare-fun addStillContains!1202 (ListLongMap!21771 (_ BitVec 64) V!54821 (_ BitVec 64)) Unit!44095)

(assert (=> b!1343385 (= lt!594900 (addStillContains!1202 lt!594899 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k!1142))))

(assert (=> b!1343385 (contains!9077 lt!594899 k!1142)))

(declare-fun lt!594903 () V!54821)

(declare-fun lt!594898 () Unit!44095)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!378 ((_ BitVec 64) (_ BitVec 64) V!54821 ListLongMap!21771) Unit!44095)

(assert (=> b!1343385 (= lt!594898 (lemmaInListMapAfterAddingDiffThenInBefore!378 k!1142 (select (arr!44168 _keys!1571) from!1960) lt!594903 lt!594899))))

(declare-fun lt!594901 () ListLongMap!21771)

(assert (=> b!1343385 (contains!9077 lt!594901 k!1142)))

(declare-fun lt!594902 () Unit!44095)

(assert (=> b!1343385 (= lt!594902 (lemmaInListMapAfterAddingDiffThenInBefore!378 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594901))))

(assert (=> b!1343385 (= lt!594901 (+!4809 lt!594899 (tuple2!24115 (select (arr!44168 _keys!1571) from!1960) lt!594903)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22310 (ValueCell!17746 V!54821) V!54821)

(declare-fun dynLambda!3748 (Int (_ BitVec 64)) V!54821)

(assert (=> b!1343385 (= lt!594903 (get!22310 (select (arr!44169 _values!1303) from!1960) (dynLambda!3748 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54821)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6451 (array!91424 array!91426 (_ BitVec 32) (_ BitVec 32) V!54821 V!54821 (_ BitVec 32) Int) ListLongMap!21771)

(assert (=> b!1343385 (= lt!594899 (getCurrentListMapNoExtraKeys!6451 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343386 () Bool)

(declare-fun res!891298 () Bool)

(assert (=> b!1343386 (=> (not res!891298) (not e!764644))))

(assert (=> b!1343386 (= res!891298 (and (= (size!44719 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44718 _keys!1571) (size!44719 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343387 () Bool)

(declare-fun res!891303 () Bool)

(assert (=> b!1343387 (=> (not res!891303) (not e!764644))))

(assert (=> b!1343387 (= res!891303 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44718 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57640 () Bool)

(declare-fun mapRes!57640 () Bool)

(assert (=> mapIsEmpty!57640 mapRes!57640))

(declare-fun b!1343388 () Bool)

(declare-fun res!891300 () Bool)

(assert (=> b!1343388 (=> (not res!891300) (not e!764644))))

(declare-fun getCurrentListMap!5861 (array!91424 array!91426 (_ BitVec 32) (_ BitVec 32) V!54821 V!54821 (_ BitVec 32) Int) ListLongMap!21771)

(assert (=> b!1343388 (= res!891300 (contains!9077 (getCurrentListMap!5861 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1343389 () Bool)

(declare-fun res!891305 () Bool)

(assert (=> b!1343389 (=> (not res!891305) (not e!764644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91424 (_ BitVec 32)) Bool)

(assert (=> b!1343389 (= res!891305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343390 () Bool)

(declare-fun res!891306 () Bool)

(assert (=> b!1343390 (=> (not res!891306) (not e!764644))))

(assert (=> b!1343390 (= res!891306 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57640 () Bool)

(declare-fun tp!109672 () Bool)

(declare-fun e!764645 () Bool)

(assert (=> mapNonEmpty!57640 (= mapRes!57640 (and tp!109672 e!764645))))

(declare-fun mapRest!57640 () (Array (_ BitVec 32) ValueCell!17746))

(declare-fun mapKey!57640 () (_ BitVec 32))

(declare-fun mapValue!57640 () ValueCell!17746)

(assert (=> mapNonEmpty!57640 (= (arr!44169 _values!1303) (store mapRest!57640 mapKey!57640 mapValue!57640))))

(declare-fun b!1343391 () Bool)

(declare-fun e!764647 () Bool)

(assert (=> b!1343391 (= e!764646 (and e!764647 mapRes!57640))))

(declare-fun condMapEmpty!57640 () Bool)

(declare-fun mapDefault!57640 () ValueCell!17746)

