; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111930 () Bool)

(assert start!111930)

(declare-fun b_free!30529 () Bool)

(declare-fun b_next!30529 () Bool)

(assert (=> start!111930 (= b_free!30529 (not b_next!30529))))

(declare-fun tp!107066 () Bool)

(declare-fun b_and!49153 () Bool)

(assert (=> start!111930 (= tp!107066 b_and!49153)))

(declare-fun b!1326538 () Bool)

(declare-fun res!880431 () Bool)

(declare-fun e!756066 () Bool)

(assert (=> b!1326538 (=> (not res!880431) (not e!756066))))

(declare-datatypes ((array!89604 0))(
  ( (array!89605 (arr!43275 (Array (_ BitVec 32) (_ BitVec 64))) (size!43825 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89604)

(declare-datatypes ((List!30682 0))(
  ( (Nil!30679) (Cons!30678 (h!31887 (_ BitVec 64)) (t!44682 List!30682)) )
))
(declare-fun arrayNoDuplicates!0 (array!89604 (_ BitVec 32) List!30682) Bool)

(assert (=> b!1326538 (= res!880431 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30679))))

(declare-fun b!1326540 () Bool)

(declare-fun res!880432 () Bool)

(assert (=> b!1326540 (=> (not res!880432) (not e!756066))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326540 (= res!880432 (validKeyInArray!0 (select (arr!43275 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!56175 () Bool)

(declare-fun mapRes!56175 () Bool)

(declare-fun tp!107067 () Bool)

(declare-fun e!756065 () Bool)

(assert (=> mapNonEmpty!56175 (= mapRes!56175 (and tp!107067 e!756065))))

(declare-datatypes ((V!53569 0))(
  ( (V!53570 (val!18249 Int)) )
))
(declare-datatypes ((ValueCell!17276 0))(
  ( (ValueCellFull!17276 (v!20882 V!53569)) (EmptyCell!17276) )
))
(declare-datatypes ((array!89606 0))(
  ( (array!89607 (arr!43276 (Array (_ BitVec 32) ValueCell!17276)) (size!43826 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89606)

(declare-fun mapValue!56175 () ValueCell!17276)

(declare-fun mapRest!56175 () (Array (_ BitVec 32) ValueCell!17276))

(declare-fun mapKey!56175 () (_ BitVec 32))

(assert (=> mapNonEmpty!56175 (= (arr!43276 _values!1337) (store mapRest!56175 mapKey!56175 mapValue!56175))))

(declare-fun b!1326541 () Bool)

(declare-fun res!880428 () Bool)

(assert (=> b!1326541 (=> (not res!880428) (not e!756066))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1326541 (= res!880428 (and (= (size!43826 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43825 _keys!1609) (size!43826 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326542 () Bool)

(declare-fun res!880425 () Bool)

(assert (=> b!1326542 (=> (not res!880425) (not e!756066))))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1326542 (= res!880425 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43825 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326543 () Bool)

(declare-fun res!880426 () Bool)

(assert (=> b!1326543 (=> (not res!880426) (not e!756066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89604 (_ BitVec 32)) Bool)

(assert (=> b!1326543 (= res!880426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326544 () Bool)

(declare-fun res!880427 () Bool)

(assert (=> b!1326544 (=> (not res!880427) (not e!756066))))

(declare-fun zeroValue!1279 () V!53569)

(declare-fun minValue!1279 () V!53569)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23546 0))(
  ( (tuple2!23547 (_1!11784 (_ BitVec 64)) (_2!11784 V!53569)) )
))
(declare-datatypes ((List!30683 0))(
  ( (Nil!30680) (Cons!30679 (h!31888 tuple2!23546) (t!44683 List!30683)) )
))
(declare-datatypes ((ListLongMap!21203 0))(
  ( (ListLongMap!21204 (toList!10617 List!30683)) )
))
(declare-fun contains!8774 (ListLongMap!21203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5608 (array!89604 array!89606 (_ BitVec 32) (_ BitVec 32) V!53569 V!53569 (_ BitVec 32) Int) ListLongMap!21203)

(assert (=> b!1326544 (= res!880427 (contains!8774 (getCurrentListMap!5608 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1326545 () Bool)

(assert (=> b!1326545 (= e!756066 (not (contains!8774 (getCurrentListMap!5608 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k!1164)))))

(declare-fun lt!590178 () ListLongMap!21203)

(declare-fun +!4638 (ListLongMap!21203 tuple2!23546) ListLongMap!21203)

(assert (=> b!1326545 (contains!8774 (+!4638 lt!590178 (tuple2!23547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43704 0))(
  ( (Unit!43705) )
))
(declare-fun lt!590168 () Unit!43704)

(declare-fun addStillContains!1162 (ListLongMap!21203 (_ BitVec 64) V!53569 (_ BitVec 64)) Unit!43704)

(assert (=> b!1326545 (= lt!590168 (addStillContains!1162 lt!590178 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1326545 (contains!8774 lt!590178 k!1164)))

(declare-fun lt!590176 () ListLongMap!21203)

(declare-fun lt!590171 () tuple2!23546)

(assert (=> b!1326545 (= lt!590178 (+!4638 lt!590176 lt!590171))))

(declare-fun lt!590174 () Unit!43704)

(assert (=> b!1326545 (= lt!590174 (addStillContains!1162 lt!590176 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1326545 (contains!8774 lt!590176 k!1164)))

(declare-fun lt!590175 () Unit!43704)

(declare-fun lt!590177 () V!53569)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!230 ((_ BitVec 64) (_ BitVec 64) V!53569 ListLongMap!21203) Unit!43704)

(assert (=> b!1326545 (= lt!590175 (lemmaInListMapAfterAddingDiffThenInBefore!230 k!1164 (select (arr!43275 _keys!1609) from!2000) lt!590177 lt!590176))))

(declare-fun lt!590169 () ListLongMap!21203)

(assert (=> b!1326545 (contains!8774 lt!590169 k!1164)))

(declare-fun lt!590172 () Unit!43704)

(assert (=> b!1326545 (= lt!590172 (lemmaInListMapAfterAddingDiffThenInBefore!230 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590169))))

(declare-fun lt!590170 () ListLongMap!21203)

(assert (=> b!1326545 (contains!8774 lt!590170 k!1164)))

(declare-fun lt!590173 () Unit!43704)

(assert (=> b!1326545 (= lt!590173 (lemmaInListMapAfterAddingDiffThenInBefore!230 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590170))))

(assert (=> b!1326545 (= lt!590170 (+!4638 lt!590169 lt!590171))))

(assert (=> b!1326545 (= lt!590171 (tuple2!23547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1326545 (= lt!590169 (+!4638 lt!590176 (tuple2!23547 (select (arr!43275 _keys!1609) from!2000) lt!590177)))))

(declare-fun get!21809 (ValueCell!17276 V!53569) V!53569)

(declare-fun dynLambda!3577 (Int (_ BitVec 64)) V!53569)

(assert (=> b!1326545 (= lt!590177 (get!21809 (select (arr!43276 _values!1337) from!2000) (dynLambda!3577 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6276 (array!89604 array!89606 (_ BitVec 32) (_ BitVec 32) V!53569 V!53569 (_ BitVec 32) Int) ListLongMap!21203)

(assert (=> b!1326545 (= lt!590176 (getCurrentListMapNoExtraKeys!6276 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1326546 () Bool)

(declare-fun e!756063 () Bool)

(declare-fun tp_is_empty!36349 () Bool)

(assert (=> b!1326546 (= e!756063 tp_is_empty!36349)))

(declare-fun mapIsEmpty!56175 () Bool)

(assert (=> mapIsEmpty!56175 mapRes!56175))

(declare-fun b!1326539 () Bool)

(declare-fun e!756064 () Bool)

(assert (=> b!1326539 (= e!756064 (and e!756063 mapRes!56175))))

(declare-fun condMapEmpty!56175 () Bool)

(declare-fun mapDefault!56175 () ValueCell!17276)

