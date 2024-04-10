; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111870 () Bool)

(assert start!111870)

(declare-fun b_free!30469 () Bool)

(declare-fun b_next!30469 () Bool)

(assert (=> start!111870 (= b_free!30469 (not b_next!30469))))

(declare-fun tp!106887 () Bool)

(declare-fun b_and!49033 () Bool)

(assert (=> start!111870 (= tp!106887 b_and!49033)))

(declare-fun b!1325488 () Bool)

(declare-fun res!879709 () Bool)

(declare-fun e!755614 () Bool)

(assert (=> b!1325488 (=> (not res!879709) (not e!755614))))

(declare-datatypes ((array!89486 0))(
  ( (array!89487 (arr!43216 (Array (_ BitVec 32) (_ BitVec 64))) (size!43766 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89486)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53489 0))(
  ( (V!53490 (val!18219 Int)) )
))
(declare-datatypes ((ValueCell!17246 0))(
  ( (ValueCellFull!17246 (v!20852 V!53489)) (EmptyCell!17246) )
))
(declare-datatypes ((array!89488 0))(
  ( (array!89489 (arr!43217 (Array (_ BitVec 32) ValueCell!17246)) (size!43767 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89488)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1325488 (= res!879709 (and (= (size!43767 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43766 _keys!1609) (size!43767 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325489 () Bool)

(declare-fun e!755613 () Bool)

(declare-fun tp_is_empty!36289 () Bool)

(assert (=> b!1325489 (= e!755613 tp_is_empty!36289)))

(declare-fun b!1325490 () Bool)

(declare-fun res!879708 () Bool)

(assert (=> b!1325490 (=> (not res!879708) (not e!755614))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53489)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun minValue!1279 () V!53489)

(declare-datatypes ((tuple2!23496 0))(
  ( (tuple2!23497 (_1!11759 (_ BitVec 64)) (_2!11759 V!53489)) )
))
(declare-datatypes ((List!30636 0))(
  ( (Nil!30633) (Cons!30632 (h!31841 tuple2!23496) (t!44576 List!30636)) )
))
(declare-datatypes ((ListLongMap!21153 0))(
  ( (ListLongMap!21154 (toList!10592 List!30636)) )
))
(declare-fun contains!8749 (ListLongMap!21153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5588 (array!89486 array!89488 (_ BitVec 32) (_ BitVec 32) V!53489 V!53489 (_ BitVec 32) Int) ListLongMap!21153)

(assert (=> b!1325490 (= res!879708 (contains!8749 (getCurrentListMap!5588 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1325491 () Bool)

(declare-fun res!879711 () Bool)

(assert (=> b!1325491 (=> (not res!879711) (not e!755614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325491 (= res!879711 (validKeyInArray!0 (select (arr!43216 _keys!1609) from!2000)))))

(declare-fun res!879710 () Bool)

(assert (=> start!111870 (=> (not res!879710) (not e!755614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111870 (= res!879710 (validMask!0 mask!2019))))

(assert (=> start!111870 e!755614))

(declare-fun array_inv!32621 (array!89486) Bool)

(assert (=> start!111870 (array_inv!32621 _keys!1609)))

(assert (=> start!111870 true))

(assert (=> start!111870 tp_is_empty!36289))

(declare-fun e!755617 () Bool)

(declare-fun array_inv!32622 (array!89488) Bool)

(assert (=> start!111870 (and (array_inv!32622 _values!1337) e!755617)))

(assert (=> start!111870 tp!106887))

(declare-fun b!1325492 () Bool)

(assert (=> b!1325492 (= e!755614 (not true))))

(declare-fun lt!589790 () ListLongMap!21153)

(assert (=> b!1325492 (contains!8749 lt!589790 k!1164)))

(declare-datatypes ((Unit!43658 0))(
  ( (Unit!43659) )
))
(declare-fun lt!589791 () Unit!43658)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!207 ((_ BitVec 64) (_ BitVec 64) V!53489 ListLongMap!21153) Unit!43658)

(assert (=> b!1325492 (= lt!589791 (lemmaInListMapAfterAddingDiffThenInBefore!207 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589790))))

(declare-fun +!4615 (ListLongMap!21153 tuple2!23496) ListLongMap!21153)

(declare-fun getCurrentListMapNoExtraKeys!6253 (array!89486 array!89488 (_ BitVec 32) (_ BitVec 32) V!53489 V!53489 (_ BitVec 32) Int) ListLongMap!21153)

(declare-fun get!21766 (ValueCell!17246 V!53489) V!53489)

(declare-fun dynLambda!3554 (Int (_ BitVec 64)) V!53489)

(assert (=> b!1325492 (= lt!589790 (+!4615 (+!4615 (getCurrentListMapNoExtraKeys!6253 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23497 (select (arr!43216 _keys!1609) from!2000) (get!21766 (select (arr!43217 _values!1337) from!2000) (dynLambda!3554 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23497 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapNonEmpty!56085 () Bool)

(declare-fun mapRes!56085 () Bool)

(declare-fun tp!106886 () Bool)

(declare-fun e!755615 () Bool)

(assert (=> mapNonEmpty!56085 (= mapRes!56085 (and tp!106886 e!755615))))

(declare-fun mapKey!56085 () (_ BitVec 32))

(declare-fun mapRest!56085 () (Array (_ BitVec 32) ValueCell!17246))

(declare-fun mapValue!56085 () ValueCell!17246)

(assert (=> mapNonEmpty!56085 (= (arr!43217 _values!1337) (store mapRest!56085 mapKey!56085 mapValue!56085))))

(declare-fun b!1325493 () Bool)

(declare-fun res!879707 () Bool)

(assert (=> b!1325493 (=> (not res!879707) (not e!755614))))

(assert (=> b!1325493 (= res!879707 (not (= (select (arr!43216 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1325494 () Bool)

(declare-fun res!879705 () Bool)

(assert (=> b!1325494 (=> (not res!879705) (not e!755614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89486 (_ BitVec 32)) Bool)

(assert (=> b!1325494 (= res!879705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!56085 () Bool)

(assert (=> mapIsEmpty!56085 mapRes!56085))

(declare-fun b!1325495 () Bool)

(declare-fun res!879706 () Bool)

(assert (=> b!1325495 (=> (not res!879706) (not e!755614))))

(declare-datatypes ((List!30637 0))(
  ( (Nil!30634) (Cons!30633 (h!31842 (_ BitVec 64)) (t!44577 List!30637)) )
))
(declare-fun arrayNoDuplicates!0 (array!89486 (_ BitVec 32) List!30637) Bool)

(assert (=> b!1325495 (= res!879706 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30634))))

(declare-fun b!1325496 () Bool)

(declare-fun res!879712 () Bool)

(assert (=> b!1325496 (=> (not res!879712) (not e!755614))))

(assert (=> b!1325496 (= res!879712 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43766 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325497 () Bool)

(assert (=> b!1325497 (= e!755615 tp_is_empty!36289)))

(declare-fun b!1325498 () Bool)

(assert (=> b!1325498 (= e!755617 (and e!755613 mapRes!56085))))

(declare-fun condMapEmpty!56085 () Bool)

(declare-fun mapDefault!56085 () ValueCell!17246)

