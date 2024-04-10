; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111720 () Bool)

(assert start!111720)

(declare-fun b_free!30377 () Bool)

(declare-fun b_next!30377 () Bool)

(assert (=> start!111720 (= b_free!30377 (not b_next!30377))))

(declare-fun tp!106607 () Bool)

(declare-fun b_and!48913 () Bool)

(assert (=> start!111720 (= tp!106607 b_and!48913)))

(declare-fun b!1323815 () Bool)

(declare-fun res!878704 () Bool)

(declare-fun e!754668 () Bool)

(assert (=> b!1323815 (=> (not res!878704) (not e!754668))))

(declare-datatypes ((array!89310 0))(
  ( (array!89311 (arr!43129 (Array (_ BitVec 32) (_ BitVec 64))) (size!43679 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89310)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1323815 (= res!878704 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43679 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55943 () Bool)

(declare-fun mapRes!55943 () Bool)

(declare-fun tp!106606 () Bool)

(declare-fun e!754665 () Bool)

(assert (=> mapNonEmpty!55943 (= mapRes!55943 (and tp!106606 e!754665))))

(declare-datatypes ((V!53365 0))(
  ( (V!53366 (val!18173 Int)) )
))
(declare-datatypes ((ValueCell!17200 0))(
  ( (ValueCellFull!17200 (v!20803 V!53365)) (EmptyCell!17200) )
))
(declare-fun mapValue!55943 () ValueCell!17200)

(declare-datatypes ((array!89312 0))(
  ( (array!89313 (arr!43130 (Array (_ BitVec 32) ValueCell!17200)) (size!43680 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89312)

(declare-fun mapRest!55943 () (Array (_ BitVec 32) ValueCell!17200))

(declare-fun mapKey!55943 () (_ BitVec 32))

(assert (=> mapNonEmpty!55943 (= (arr!43130 _values!1337) (store mapRest!55943 mapKey!55943 mapValue!55943))))

(declare-fun b!1323816 () Bool)

(declare-fun res!878703 () Bool)

(assert (=> b!1323816 (=> (not res!878703) (not e!754668))))

(declare-fun zeroValue!1279 () V!53365)

(declare-fun minValue!1279 () V!53365)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23430 0))(
  ( (tuple2!23431 (_1!11726 (_ BitVec 64)) (_2!11726 V!53365)) )
))
(declare-datatypes ((List!30571 0))(
  ( (Nil!30568) (Cons!30567 (h!31776 tuple2!23430) (t!44497 List!30571)) )
))
(declare-datatypes ((ListLongMap!21087 0))(
  ( (ListLongMap!21088 (toList!10559 List!30571)) )
))
(declare-fun contains!8714 (ListLongMap!21087 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5555 (array!89310 array!89312 (_ BitVec 32) (_ BitVec 32) V!53365 V!53365 (_ BitVec 32) Int) ListLongMap!21087)

(assert (=> b!1323816 (= res!878703 (contains!8714 (getCurrentListMap!5555 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!878705 () Bool)

(assert (=> start!111720 (=> (not res!878705) (not e!754668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111720 (= res!878705 (validMask!0 mask!2019))))

(assert (=> start!111720 e!754668))

(declare-fun array_inv!32557 (array!89310) Bool)

(assert (=> start!111720 (array_inv!32557 _keys!1609)))

(assert (=> start!111720 true))

(declare-fun tp_is_empty!36197 () Bool)

(assert (=> start!111720 tp_is_empty!36197))

(declare-fun e!754666 () Bool)

(declare-fun array_inv!32558 (array!89312) Bool)

(assert (=> start!111720 (and (array_inv!32558 _values!1337) e!754666)))

(assert (=> start!111720 tp!106607))

(declare-fun b!1323817 () Bool)

(declare-fun res!878707 () Bool)

(assert (=> b!1323817 (=> (not res!878707) (not e!754668))))

(assert (=> b!1323817 (= res!878707 (and (= (size!43680 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43679 _keys!1609) (size!43680 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323818 () Bool)

(assert (=> b!1323818 (= e!754665 tp_is_empty!36197)))

(declare-fun b!1323819 () Bool)

(declare-fun res!878702 () Bool)

(assert (=> b!1323819 (=> (not res!878702) (not e!754668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89310 (_ BitVec 32)) Bool)

(assert (=> b!1323819 (= res!878702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323820 () Bool)

(declare-fun e!754667 () Bool)

(assert (=> b!1323820 (= e!754667 tp_is_empty!36197)))

(declare-fun b!1323821 () Bool)

(declare-fun res!878708 () Bool)

(assert (=> b!1323821 (=> (not res!878708) (not e!754668))))

(assert (=> b!1323821 (= res!878708 (not (= (select (arr!43129 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1323822 () Bool)

(declare-fun res!878701 () Bool)

(assert (=> b!1323822 (=> (not res!878701) (not e!754668))))

(declare-datatypes ((List!30572 0))(
  ( (Nil!30569) (Cons!30568 (h!31777 (_ BitVec 64)) (t!44498 List!30572)) )
))
(declare-fun arrayNoDuplicates!0 (array!89310 (_ BitVec 32) List!30572) Bool)

(assert (=> b!1323822 (= res!878701 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30569))))

(declare-fun mapIsEmpty!55943 () Bool)

(assert (=> mapIsEmpty!55943 mapRes!55943))

(declare-fun b!1323823 () Bool)

(assert (=> b!1323823 (= e!754668 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-fun lt!589388 () ListLongMap!21087)

(declare-fun +!4610 (ListLongMap!21087 tuple2!23430) ListLongMap!21087)

(assert (=> b!1323823 (contains!8714 (+!4610 lt!589388 (tuple2!23431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43640 0))(
  ( (Unit!43641) )
))
(declare-fun lt!589391 () Unit!43640)

(declare-fun addStillContains!1159 (ListLongMap!21087 (_ BitVec 64) V!53365 (_ BitVec 64)) Unit!43640)

(assert (=> b!1323823 (= lt!589391 (addStillContains!1159 lt!589388 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1323823 (contains!8714 lt!589388 k!1164)))

(declare-fun lt!589397 () ListLongMap!21087)

(declare-fun lt!589393 () tuple2!23430)

(assert (=> b!1323823 (= lt!589388 (+!4610 lt!589397 lt!589393))))

(declare-fun lt!589398 () Unit!43640)

(assert (=> b!1323823 (= lt!589398 (addStillContains!1159 lt!589397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1323823 (contains!8714 lt!589397 k!1164)))

(declare-fun lt!589396 () V!53365)

(declare-fun lt!589394 () Unit!43640)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!206 ((_ BitVec 64) (_ BitVec 64) V!53365 ListLongMap!21087) Unit!43640)

(assert (=> b!1323823 (= lt!589394 (lemmaInListMapAfterAddingDiffThenInBefore!206 k!1164 (select (arr!43129 _keys!1609) from!2000) lt!589396 lt!589397))))

(declare-fun lt!589395 () ListLongMap!21087)

(assert (=> b!1323823 (contains!8714 lt!589395 k!1164)))

(declare-fun lt!589390 () Unit!43640)

(assert (=> b!1323823 (= lt!589390 (lemmaInListMapAfterAddingDiffThenInBefore!206 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589395))))

(declare-fun lt!589392 () ListLongMap!21087)

(assert (=> b!1323823 (contains!8714 lt!589392 k!1164)))

(declare-fun lt!589389 () Unit!43640)

(assert (=> b!1323823 (= lt!589389 (lemmaInListMapAfterAddingDiffThenInBefore!206 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589392))))

(assert (=> b!1323823 (= lt!589392 (+!4610 lt!589395 lt!589393))))

(assert (=> b!1323823 (= lt!589393 (tuple2!23431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323823 (= lt!589395 (+!4610 lt!589397 (tuple2!23431 (select (arr!43129 _keys!1609) from!2000) lt!589396)))))

(declare-fun get!21726 (ValueCell!17200 V!53365) V!53365)

(declare-fun dynLambda!3549 (Int (_ BitVec 64)) V!53365)

(assert (=> b!1323823 (= lt!589396 (get!21726 (select (arr!43130 _values!1337) from!2000) (dynLambda!3549 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6245 (array!89310 array!89312 (_ BitVec 32) (_ BitVec 32) V!53365 V!53365 (_ BitVec 32) Int) ListLongMap!21087)

(assert (=> b!1323823 (= lt!589397 (getCurrentListMapNoExtraKeys!6245 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323824 () Bool)

(assert (=> b!1323824 (= e!754666 (and e!754667 mapRes!55943))))

(declare-fun condMapEmpty!55943 () Bool)

(declare-fun mapDefault!55943 () ValueCell!17200)

