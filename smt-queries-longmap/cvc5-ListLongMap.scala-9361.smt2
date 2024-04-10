; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111602 () Bool)

(assert start!111602)

(declare-fun b_free!30259 () Bool)

(declare-fun b_next!30259 () Bool)

(assert (=> start!111602 (= b_free!30259 (not b_next!30259))))

(declare-fun tp!106253 () Bool)

(declare-fun b_and!48677 () Bool)

(assert (=> start!111602 (= tp!106253 b_and!48677)))

(declare-fun mapIsEmpty!55766 () Bool)

(declare-fun mapRes!55766 () Bool)

(assert (=> mapIsEmpty!55766 mapRes!55766))

(declare-fun b!1321750 () Bool)

(declare-fun res!877292 () Bool)

(declare-fun e!753780 () Bool)

(assert (=> b!1321750 (=> (not res!877292) (not e!753780))))

(declare-datatypes ((array!89082 0))(
  ( (array!89083 (arr!43015 (Array (_ BitVec 32) (_ BitVec 64))) (size!43565 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89082)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1321750 (= res!877292 (not (= (select (arr!43015 _keys!1609) from!2000) k!1164)))))

(declare-fun res!877286 () Bool)

(assert (=> start!111602 (=> (not res!877286) (not e!753780))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111602 (= res!877286 (validMask!0 mask!2019))))

(assert (=> start!111602 e!753780))

(declare-fun array_inv!32475 (array!89082) Bool)

(assert (=> start!111602 (array_inv!32475 _keys!1609)))

(assert (=> start!111602 true))

(declare-fun tp_is_empty!36079 () Bool)

(assert (=> start!111602 tp_is_empty!36079))

(declare-datatypes ((V!53209 0))(
  ( (V!53210 (val!18114 Int)) )
))
(declare-datatypes ((ValueCell!17141 0))(
  ( (ValueCellFull!17141 (v!20744 V!53209)) (EmptyCell!17141) )
))
(declare-datatypes ((array!89084 0))(
  ( (array!89085 (arr!43016 (Array (_ BitVec 32) ValueCell!17141)) (size!43566 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89084)

(declare-fun e!753783 () Bool)

(declare-fun array_inv!32476 (array!89084) Bool)

(assert (=> start!111602 (and (array_inv!32476 _values!1337) e!753783)))

(assert (=> start!111602 tp!106253))

(declare-fun b!1321751 () Bool)

(declare-fun res!877288 () Bool)

(assert (=> b!1321751 (=> (not res!877288) (not e!753780))))

(declare-datatypes ((List!30479 0))(
  ( (Nil!30476) (Cons!30475 (h!31684 (_ BitVec 64)) (t!44287 List!30479)) )
))
(declare-fun arrayNoDuplicates!0 (array!89082 (_ BitVec 32) List!30479) Bool)

(assert (=> b!1321751 (= res!877288 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30476))))

(declare-fun b!1321752 () Bool)

(assert (=> b!1321752 (= e!753780 (not true))))

(declare-datatypes ((tuple2!23330 0))(
  ( (tuple2!23331 (_1!11676 (_ BitVec 64)) (_2!11676 V!53209)) )
))
(declare-datatypes ((List!30480 0))(
  ( (Nil!30477) (Cons!30476 (h!31685 tuple2!23330) (t!44288 List!30480)) )
))
(declare-datatypes ((ListLongMap!20987 0))(
  ( (ListLongMap!20988 (toList!10509 List!30480)) )
))
(declare-fun lt!587652 () ListLongMap!20987)

(declare-fun contains!8664 (ListLongMap!20987 (_ BitVec 64)) Bool)

(assert (=> b!1321752 (contains!8664 lt!587652 k!1164)))

(declare-datatypes ((Unit!43550 0))(
  ( (Unit!43551) )
))
(declare-fun lt!587650 () Unit!43550)

(declare-fun lt!587651 () V!53209)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!161 ((_ BitVec 64) (_ BitVec 64) V!53209 ListLongMap!20987) Unit!43550)

(assert (=> b!1321752 (= lt!587650 (lemmaInListMapAfterAddingDiffThenInBefore!161 k!1164 (select (arr!43015 _keys!1609) from!2000) lt!587651 lt!587652))))

(declare-fun lt!587653 () ListLongMap!20987)

(assert (=> b!1321752 (contains!8664 lt!587653 k!1164)))

(declare-fun zeroValue!1279 () V!53209)

(declare-fun lt!587655 () Unit!43550)

(assert (=> b!1321752 (= lt!587655 (lemmaInListMapAfterAddingDiffThenInBefore!161 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587653))))

(declare-fun lt!587654 () ListLongMap!20987)

(assert (=> b!1321752 (contains!8664 lt!587654 k!1164)))

(declare-fun minValue!1279 () V!53209)

(declare-fun lt!587649 () Unit!43550)

(assert (=> b!1321752 (= lt!587649 (lemmaInListMapAfterAddingDiffThenInBefore!161 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587654))))

(declare-fun +!4565 (ListLongMap!20987 tuple2!23330) ListLongMap!20987)

(assert (=> b!1321752 (= lt!587654 (+!4565 lt!587653 (tuple2!23331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321752 (= lt!587653 (+!4565 lt!587652 (tuple2!23331 (select (arr!43015 _keys!1609) from!2000) lt!587651)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21643 (ValueCell!17141 V!53209) V!53209)

(declare-fun dynLambda!3504 (Int (_ BitVec 64)) V!53209)

(assert (=> b!1321752 (= lt!587651 (get!21643 (select (arr!43016 _values!1337) from!2000) (dynLambda!3504 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6200 (array!89082 array!89084 (_ BitVec 32) (_ BitVec 32) V!53209 V!53209 (_ BitVec 32) Int) ListLongMap!20987)

(assert (=> b!1321752 (= lt!587652 (getCurrentListMapNoExtraKeys!6200 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321753 () Bool)

(declare-fun res!877287 () Bool)

(assert (=> b!1321753 (=> (not res!877287) (not e!753780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321753 (= res!877287 (validKeyInArray!0 (select (arr!43015 _keys!1609) from!2000)))))

(declare-fun b!1321754 () Bool)

(declare-fun res!877290 () Bool)

(assert (=> b!1321754 (=> (not res!877290) (not e!753780))))

(declare-fun getCurrentListMap!5510 (array!89082 array!89084 (_ BitVec 32) (_ BitVec 32) V!53209 V!53209 (_ BitVec 32) Int) ListLongMap!20987)

(assert (=> b!1321754 (= res!877290 (contains!8664 (getCurrentListMap!5510 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1321755 () Bool)

(declare-fun e!753782 () Bool)

(assert (=> b!1321755 (= e!753782 tp_is_empty!36079)))

(declare-fun b!1321756 () Bool)

(declare-fun res!877285 () Bool)

(assert (=> b!1321756 (=> (not res!877285) (not e!753780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89082 (_ BitVec 32)) Bool)

(assert (=> b!1321756 (= res!877285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321757 () Bool)

(declare-fun e!753781 () Bool)

(assert (=> b!1321757 (= e!753781 tp_is_empty!36079)))

(declare-fun b!1321758 () Bool)

(declare-fun res!877291 () Bool)

(assert (=> b!1321758 (=> (not res!877291) (not e!753780))))

(assert (=> b!1321758 (= res!877291 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43565 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55766 () Bool)

(declare-fun tp!106252 () Bool)

(assert (=> mapNonEmpty!55766 (= mapRes!55766 (and tp!106252 e!753782))))

(declare-fun mapRest!55766 () (Array (_ BitVec 32) ValueCell!17141))

(declare-fun mapKey!55766 () (_ BitVec 32))

(declare-fun mapValue!55766 () ValueCell!17141)

(assert (=> mapNonEmpty!55766 (= (arr!43016 _values!1337) (store mapRest!55766 mapKey!55766 mapValue!55766))))

(declare-fun b!1321759 () Bool)

(assert (=> b!1321759 (= e!753783 (and e!753781 mapRes!55766))))

(declare-fun condMapEmpty!55766 () Bool)

(declare-fun mapDefault!55766 () ValueCell!17141)

