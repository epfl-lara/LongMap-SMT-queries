; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113240 () Bool)

(assert start!113240)

(declare-fun b_free!31291 () Bool)

(declare-fun b_next!31291 () Bool)

(assert (=> start!113240 (= b_free!31291 (not b_next!31291))))

(declare-fun tp!109677 () Bool)

(declare-fun b_and!50489 () Bool)

(assert (=> start!113240 (= tp!109677 b_and!50489)))

(declare-fun b!1343423 () Bool)

(declare-fun res!891331 () Bool)

(declare-fun e!764661 () Bool)

(assert (=> b!1343423 (=> (not res!891331) (not e!764661))))

(declare-datatypes ((array!91428 0))(
  ( (array!91429 (arr!44170 (Array (_ BitVec 32) (_ BitVec 64))) (size!44720 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91428)

(declare-datatypes ((List!31273 0))(
  ( (Nil!31270) (Cons!31269 (h!32478 (_ BitVec 64)) (t!45775 List!31273)) )
))
(declare-fun arrayNoDuplicates!0 (array!91428 (_ BitVec 32) List!31273) Bool)

(assert (=> b!1343423 (= res!891331 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31270))))

(declare-fun b!1343424 () Bool)

(assert (=> b!1343424 (= e!764661 (not true))))

(declare-datatypes ((V!54825 0))(
  ( (V!54826 (val!18720 Int)) )
))
(declare-datatypes ((tuple2!24116 0))(
  ( (tuple2!24117 (_1!12069 (_ BitVec 64)) (_2!12069 V!54825)) )
))
(declare-datatypes ((List!31274 0))(
  ( (Nil!31271) (Cons!31270 (h!32479 tuple2!24116) (t!45776 List!31274)) )
))
(declare-datatypes ((ListLongMap!21773 0))(
  ( (ListLongMap!21774 (toList!10902 List!31274)) )
))
(declare-fun lt!594921 () ListLongMap!21773)

(declare-fun zeroValue!1245 () V!54825)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9078 (ListLongMap!21773 (_ BitVec 64)) Bool)

(declare-fun +!4810 (ListLongMap!21773 tuple2!24116) ListLongMap!21773)

(assert (=> b!1343424 (contains!9078 (+!4810 lt!594921 (tuple2!24117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142)))

(declare-datatypes ((Unit!44097 0))(
  ( (Unit!44098) )
))
(declare-fun lt!594916 () Unit!44097)

(declare-fun addStillContains!1203 (ListLongMap!21773 (_ BitVec 64) V!54825 (_ BitVec 64)) Unit!44097)

(assert (=> b!1343424 (= lt!594916 (addStillContains!1203 lt!594921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k!1142))))

(assert (=> b!1343424 (contains!9078 lt!594921 k!1142)))

(declare-fun lt!594917 () Unit!44097)

(declare-fun lt!594919 () V!54825)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!379 ((_ BitVec 64) (_ BitVec 64) V!54825 ListLongMap!21773) Unit!44097)

(assert (=> b!1343424 (= lt!594917 (lemmaInListMapAfterAddingDiffThenInBefore!379 k!1142 (select (arr!44170 _keys!1571) from!1960) lt!594919 lt!594921))))

(declare-fun lt!594920 () ListLongMap!21773)

(assert (=> b!1343424 (contains!9078 lt!594920 k!1142)))

(declare-fun lt!594918 () Unit!44097)

(assert (=> b!1343424 (= lt!594918 (lemmaInListMapAfterAddingDiffThenInBefore!379 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594920))))

(assert (=> b!1343424 (= lt!594920 (+!4810 lt!594921 (tuple2!24117 (select (arr!44170 _keys!1571) from!1960) lt!594919)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17747 0))(
  ( (ValueCellFull!17747 (v!21368 V!54825)) (EmptyCell!17747) )
))
(declare-datatypes ((array!91430 0))(
  ( (array!91431 (arr!44171 (Array (_ BitVec 32) ValueCell!17747)) (size!44721 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91430)

(declare-fun get!22313 (ValueCell!17747 V!54825) V!54825)

(declare-fun dynLambda!3749 (Int (_ BitVec 64)) V!54825)

(assert (=> b!1343424 (= lt!594919 (get!22313 (select (arr!44171 _values!1303) from!1960) (dynLambda!3749 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun minValue!1245 () V!54825)

(declare-fun getCurrentListMapNoExtraKeys!6452 (array!91428 array!91430 (_ BitVec 32) (_ BitVec 32) V!54825 V!54825 (_ BitVec 32) Int) ListLongMap!21773)

(assert (=> b!1343424 (= lt!594921 (getCurrentListMapNoExtraKeys!6452 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343426 () Bool)

(declare-fun res!891326 () Bool)

(assert (=> b!1343426 (=> (not res!891326) (not e!764661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91428 (_ BitVec 32)) Bool)

(assert (=> b!1343426 (= res!891326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343427 () Bool)

(declare-fun e!764660 () Bool)

(declare-fun tp_is_empty!37291 () Bool)

(assert (=> b!1343427 (= e!764660 tp_is_empty!37291)))

(declare-fun b!1343428 () Bool)

(declare-fun res!891332 () Bool)

(assert (=> b!1343428 (=> (not res!891332) (not e!764661))))

(assert (=> b!1343428 (= res!891332 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44720 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343429 () Bool)

(declare-fun res!891325 () Bool)

(assert (=> b!1343429 (=> (not res!891325) (not e!764661))))

(assert (=> b!1343429 (= res!891325 (and (= (size!44721 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44720 _keys!1571) (size!44721 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57643 () Bool)

(declare-fun mapRes!57643 () Bool)

(declare-fun tp!109678 () Bool)

(assert (=> mapNonEmpty!57643 (= mapRes!57643 (and tp!109678 e!764660))))

(declare-fun mapKey!57643 () (_ BitVec 32))

(declare-fun mapValue!57643 () ValueCell!17747)

(declare-fun mapRest!57643 () (Array (_ BitVec 32) ValueCell!17747))

(assert (=> mapNonEmpty!57643 (= (arr!44171 _values!1303) (store mapRest!57643 mapKey!57643 mapValue!57643))))

(declare-fun b!1343430 () Bool)

(declare-fun res!891328 () Bool)

(assert (=> b!1343430 (=> (not res!891328) (not e!764661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343430 (= res!891328 (validKeyInArray!0 (select (arr!44170 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57643 () Bool)

(assert (=> mapIsEmpty!57643 mapRes!57643))

(declare-fun b!1343425 () Bool)

(declare-fun e!764662 () Bool)

(declare-fun e!764659 () Bool)

(assert (=> b!1343425 (= e!764662 (and e!764659 mapRes!57643))))

(declare-fun condMapEmpty!57643 () Bool)

(declare-fun mapDefault!57643 () ValueCell!17747)

