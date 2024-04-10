; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113160 () Bool)

(assert start!113160)

(declare-fun b_free!31211 () Bool)

(declare-fun b_next!31211 () Bool)

(assert (=> start!113160 (= b_free!31211 (not b_next!31211))))

(declare-fun tp!109438 () Bool)

(declare-fun b_and!50329 () Bool)

(assert (=> start!113160 (= tp!109438 b_and!50329)))

(declare-fun b!1341903 () Bool)

(declare-fun res!890252 () Bool)

(declare-fun e!764062 () Bool)

(assert (=> b!1341903 (=> (not res!890252) (not e!764062))))

(declare-datatypes ((V!54717 0))(
  ( (V!54718 (val!18680 Int)) )
))
(declare-fun minValue!1245 () V!54717)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91274 0))(
  ( (array!91275 (arr!44093 (Array (_ BitVec 32) (_ BitVec 64))) (size!44643 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91274)

(declare-fun zeroValue!1245 () V!54717)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17707 0))(
  ( (ValueCellFull!17707 (v!21328 V!54717)) (EmptyCell!17707) )
))
(declare-datatypes ((array!91276 0))(
  ( (array!91277 (arr!44094 (Array (_ BitVec 32) ValueCell!17707)) (size!44644 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91276)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24058 0))(
  ( (tuple2!24059 (_1!12040 (_ BitVec 64)) (_2!12040 V!54717)) )
))
(declare-datatypes ((List!31215 0))(
  ( (Nil!31212) (Cons!31211 (h!32420 tuple2!24058) (t!45637 List!31215)) )
))
(declare-datatypes ((ListLongMap!21715 0))(
  ( (ListLongMap!21716 (toList!10873 List!31215)) )
))
(declare-fun contains!9049 (ListLongMap!21715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5837 (array!91274 array!91276 (_ BitVec 32) (_ BitVec 32) V!54717 V!54717 (_ BitVec 32) Int) ListLongMap!21715)

(assert (=> b!1341903 (= res!890252 (contains!9049 (getCurrentListMap!5837 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun res!890246 () Bool)

(assert (=> start!113160 (=> (not res!890246) (not e!764062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113160 (= res!890246 (validMask!0 mask!1977))))

(assert (=> start!113160 e!764062))

(declare-fun tp_is_empty!37211 () Bool)

(assert (=> start!113160 tp_is_empty!37211))

(assert (=> start!113160 true))

(declare-fun array_inv!33237 (array!91274) Bool)

(assert (=> start!113160 (array_inv!33237 _keys!1571)))

(declare-fun e!764059 () Bool)

(declare-fun array_inv!33238 (array!91276) Bool)

(assert (=> start!113160 (and (array_inv!33238 _values!1303) e!764059)))

(assert (=> start!113160 tp!109438))

(declare-fun b!1341904 () Bool)

(declare-fun res!890253 () Bool)

(assert (=> b!1341904 (=> (not res!890253) (not e!764062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341904 (= res!890253 (validKeyInArray!0 (select (arr!44093 _keys!1571) from!1960)))))

(declare-fun b!1341905 () Bool)

(assert (=> b!1341905 (= e!764062 (not true))))

(declare-fun lt!594272 () ListLongMap!21715)

(assert (=> b!1341905 (contains!9049 lt!594272 k!1142)))

(declare-datatypes ((Unit!44047 0))(
  ( (Unit!44048) )
))
(declare-fun lt!594273 () Unit!44047)

(declare-fun lt!594271 () V!54717)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!354 ((_ BitVec 64) (_ BitVec 64) V!54717 ListLongMap!21715) Unit!44047)

(assert (=> b!1341905 (= lt!594273 (lemmaInListMapAfterAddingDiffThenInBefore!354 k!1142 (select (arr!44093 _keys!1571) from!1960) lt!594271 lt!594272))))

(declare-fun lt!594270 () ListLongMap!21715)

(assert (=> b!1341905 (contains!9049 lt!594270 k!1142)))

(declare-fun lt!594269 () Unit!44047)

(assert (=> b!1341905 (= lt!594269 (lemmaInListMapAfterAddingDiffThenInBefore!354 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594270))))

(declare-fun +!4785 (ListLongMap!21715 tuple2!24058) ListLongMap!21715)

(assert (=> b!1341905 (= lt!594270 (+!4785 lt!594272 (tuple2!24059 (select (arr!44093 _keys!1571) from!1960) lt!594271)))))

(declare-fun get!22260 (ValueCell!17707 V!54717) V!54717)

(declare-fun dynLambda!3724 (Int (_ BitVec 64)) V!54717)

(assert (=> b!1341905 (= lt!594271 (get!22260 (select (arr!44094 _values!1303) from!1960) (dynLambda!3724 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6427 (array!91274 array!91276 (_ BitVec 32) (_ BitVec 32) V!54717 V!54717 (_ BitVec 32) Int) ListLongMap!21715)

(assert (=> b!1341905 (= lt!594272 (getCurrentListMapNoExtraKeys!6427 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1341906 () Bool)

(declare-fun res!890245 () Bool)

(assert (=> b!1341906 (=> (not res!890245) (not e!764062))))

(assert (=> b!1341906 (= res!890245 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341907 () Bool)

(declare-fun res!890247 () Bool)

(assert (=> b!1341907 (=> (not res!890247) (not e!764062))))

(assert (=> b!1341907 (= res!890247 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44643 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341908 () Bool)

(declare-fun res!890251 () Bool)

(assert (=> b!1341908 (=> (not res!890251) (not e!764062))))

(assert (=> b!1341908 (= res!890251 (not (= (select (arr!44093 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1341909 () Bool)

(declare-fun e!764063 () Bool)

(declare-fun mapRes!57523 () Bool)

(assert (=> b!1341909 (= e!764059 (and e!764063 mapRes!57523))))

(declare-fun condMapEmpty!57523 () Bool)

(declare-fun mapDefault!57523 () ValueCell!17707)

