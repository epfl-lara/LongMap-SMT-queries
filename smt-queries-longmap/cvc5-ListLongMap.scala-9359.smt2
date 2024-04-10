; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111590 () Bool)

(assert start!111590)

(declare-fun b_free!30247 () Bool)

(declare-fun b_next!30247 () Bool)

(assert (=> start!111590 (= b_free!30247 (not b_next!30247))))

(declare-fun tp!106217 () Bool)

(declare-fun b_and!48653 () Bool)

(assert (=> start!111590 (= tp!106217 b_and!48653)))

(declare-fun mapIsEmpty!55748 () Bool)

(declare-fun mapRes!55748 () Bool)

(assert (=> mapIsEmpty!55748 mapRes!55748))

(declare-fun b!1321540 () Bool)

(declare-fun e!753693 () Bool)

(declare-fun tp_is_empty!36067 () Bool)

(assert (=> b!1321540 (= e!753693 tp_is_empty!36067)))

(declare-fun res!877143 () Bool)

(declare-fun e!753691 () Bool)

(assert (=> start!111590 (=> (not res!877143) (not e!753691))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111590 (= res!877143 (validMask!0 mask!2019))))

(assert (=> start!111590 e!753691))

(declare-datatypes ((array!89058 0))(
  ( (array!89059 (arr!43003 (Array (_ BitVec 32) (_ BitVec 64))) (size!43553 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89058)

(declare-fun array_inv!32463 (array!89058) Bool)

(assert (=> start!111590 (array_inv!32463 _keys!1609)))

(assert (=> start!111590 true))

(assert (=> start!111590 tp_is_empty!36067))

(declare-datatypes ((V!53193 0))(
  ( (V!53194 (val!18108 Int)) )
))
(declare-datatypes ((ValueCell!17135 0))(
  ( (ValueCellFull!17135 (v!20738 V!53193)) (EmptyCell!17135) )
))
(declare-datatypes ((array!89060 0))(
  ( (array!89061 (arr!43004 (Array (_ BitVec 32) ValueCell!17135)) (size!43554 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89060)

(declare-fun e!753694 () Bool)

(declare-fun array_inv!32464 (array!89060) Bool)

(assert (=> start!111590 (and (array_inv!32464 _values!1337) e!753694)))

(assert (=> start!111590 tp!106217))

(declare-fun b!1321541 () Bool)

(declare-fun res!877144 () Bool)

(assert (=> b!1321541 (=> (not res!877144) (not e!753691))))

(declare-datatypes ((List!30470 0))(
  ( (Nil!30467) (Cons!30466 (h!31675 (_ BitVec 64)) (t!44266 List!30470)) )
))
(declare-fun arrayNoDuplicates!0 (array!89058 (_ BitVec 32) List!30470) Bool)

(assert (=> b!1321541 (= res!877144 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30467))))

(declare-fun mapNonEmpty!55748 () Bool)

(declare-fun tp!106216 () Bool)

(assert (=> mapNonEmpty!55748 (= mapRes!55748 (and tp!106216 e!753693))))

(declare-fun mapValue!55748 () ValueCell!17135)

(declare-fun mapRest!55748 () (Array (_ BitVec 32) ValueCell!17135))

(declare-fun mapKey!55748 () (_ BitVec 32))

(assert (=> mapNonEmpty!55748 (= (arr!43004 _values!1337) (store mapRest!55748 mapKey!55748 mapValue!55748))))

(declare-fun b!1321542 () Bool)

(declare-fun res!877141 () Bool)

(assert (=> b!1321542 (=> (not res!877141) (not e!753691))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1321542 (= res!877141 (and (= (size!43554 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43553 _keys!1609) (size!43554 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321543 () Bool)

(declare-fun e!753692 () Bool)

(assert (=> b!1321543 (= e!753692 tp_is_empty!36067)))

(declare-fun b!1321544 () Bool)

(declare-fun res!877146 () Bool)

(assert (=> b!1321544 (=> (not res!877146) (not e!753691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89058 (_ BitVec 32)) Bool)

(assert (=> b!1321544 (= res!877146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321545 () Bool)

(declare-fun res!877148 () Bool)

(assert (=> b!1321545 (=> (not res!877148) (not e!753691))))

(declare-fun zeroValue!1279 () V!53193)

(declare-fun minValue!1279 () V!53193)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((tuple2!23322 0))(
  ( (tuple2!23323 (_1!11672 (_ BitVec 64)) (_2!11672 V!53193)) )
))
(declare-datatypes ((List!30471 0))(
  ( (Nil!30468) (Cons!30467 (h!31676 tuple2!23322) (t!44267 List!30471)) )
))
(declare-datatypes ((ListLongMap!20979 0))(
  ( (ListLongMap!20980 (toList!10505 List!30471)) )
))
(declare-fun contains!8660 (ListLongMap!20979 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5506 (array!89058 array!89060 (_ BitVec 32) (_ BitVec 32) V!53193 V!53193 (_ BitVec 32) Int) ListLongMap!20979)

(assert (=> b!1321545 (= res!877148 (contains!8660 (getCurrentListMap!5506 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1321546 () Bool)

(declare-fun res!877147 () Bool)

(assert (=> b!1321546 (=> (not res!877147) (not e!753691))))

(assert (=> b!1321546 (= res!877147 (not (= (select (arr!43003 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1321547 () Bool)

(declare-fun res!877145 () Bool)

(assert (=> b!1321547 (=> (not res!877145) (not e!753691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321547 (= res!877145 (validKeyInArray!0 (select (arr!43003 _keys!1609) from!2000)))))

(declare-fun b!1321548 () Bool)

(assert (=> b!1321548 (= e!753691 (not true))))

(declare-fun lt!587528 () ListLongMap!20979)

(assert (=> b!1321548 (contains!8660 lt!587528 k!1164)))

(declare-datatypes ((Unit!43544 0))(
  ( (Unit!43545) )
))
(declare-fun lt!587529 () Unit!43544)

(declare-fun lt!587525 () V!53193)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!158 ((_ BitVec 64) (_ BitVec 64) V!53193 ListLongMap!20979) Unit!43544)

(assert (=> b!1321548 (= lt!587529 (lemmaInListMapAfterAddingDiffThenInBefore!158 k!1164 (select (arr!43003 _keys!1609) from!2000) lt!587525 lt!587528))))

(declare-fun lt!587527 () ListLongMap!20979)

(assert (=> b!1321548 (contains!8660 lt!587527 k!1164)))

(declare-fun lt!587523 () Unit!43544)

(assert (=> b!1321548 (= lt!587523 (lemmaInListMapAfterAddingDiffThenInBefore!158 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587527))))

(declare-fun lt!587524 () ListLongMap!20979)

(assert (=> b!1321548 (contains!8660 lt!587524 k!1164)))

(declare-fun lt!587526 () Unit!43544)

(assert (=> b!1321548 (= lt!587526 (lemmaInListMapAfterAddingDiffThenInBefore!158 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587524))))

(declare-fun +!4562 (ListLongMap!20979 tuple2!23322) ListLongMap!20979)

(assert (=> b!1321548 (= lt!587524 (+!4562 lt!587527 (tuple2!23323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321548 (= lt!587527 (+!4562 lt!587528 (tuple2!23323 (select (arr!43003 _keys!1609) from!2000) lt!587525)))))

(declare-fun get!21636 (ValueCell!17135 V!53193) V!53193)

(declare-fun dynLambda!3501 (Int (_ BitVec 64)) V!53193)

(assert (=> b!1321548 (= lt!587525 (get!21636 (select (arr!43004 _values!1337) from!2000) (dynLambda!3501 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6197 (array!89058 array!89060 (_ BitVec 32) (_ BitVec 32) V!53193 V!53193 (_ BitVec 32) Int) ListLongMap!20979)

(assert (=> b!1321548 (= lt!587528 (getCurrentListMapNoExtraKeys!6197 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321549 () Bool)

(declare-fun res!877142 () Bool)

(assert (=> b!1321549 (=> (not res!877142) (not e!753691))))

(assert (=> b!1321549 (= res!877142 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43553 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321550 () Bool)

(assert (=> b!1321550 (= e!753694 (and e!753692 mapRes!55748))))

(declare-fun condMapEmpty!55748 () Bool)

(declare-fun mapDefault!55748 () ValueCell!17135)

