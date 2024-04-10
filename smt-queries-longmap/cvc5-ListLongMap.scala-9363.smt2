; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111614 () Bool)

(assert start!111614)

(declare-fun b_free!30271 () Bool)

(declare-fun b_next!30271 () Bool)

(assert (=> start!111614 (= b_free!30271 (not b_next!30271))))

(declare-fun tp!106288 () Bool)

(declare-fun b_and!48701 () Bool)

(assert (=> start!111614 (= tp!106288 b_and!48701)))

(declare-fun b!1321960 () Bool)

(declare-fun res!877432 () Bool)

(declare-fun e!753874 () Bool)

(assert (=> b!1321960 (=> (not res!877432) (not e!753874))))

(declare-datatypes ((array!89104 0))(
  ( (array!89105 (arr!43026 (Array (_ BitVec 32) (_ BitVec 64))) (size!43576 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89104)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53225 0))(
  ( (V!53226 (val!18120 Int)) )
))
(declare-fun zeroValue!1279 () V!53225)

(declare-datatypes ((ValueCell!17147 0))(
  ( (ValueCellFull!17147 (v!20750 V!53225)) (EmptyCell!17147) )
))
(declare-datatypes ((array!89106 0))(
  ( (array!89107 (arr!43027 (Array (_ BitVec 32) ValueCell!17147)) (size!43577 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89106)

(declare-fun minValue!1279 () V!53225)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((tuple2!23338 0))(
  ( (tuple2!23339 (_1!11680 (_ BitVec 64)) (_2!11680 V!53225)) )
))
(declare-datatypes ((List!30486 0))(
  ( (Nil!30483) (Cons!30482 (h!31691 tuple2!23338) (t!44306 List!30486)) )
))
(declare-datatypes ((ListLongMap!20995 0))(
  ( (ListLongMap!20996 (toList!10513 List!30486)) )
))
(declare-fun contains!8668 (ListLongMap!20995 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5514 (array!89104 array!89106 (_ BitVec 32) (_ BitVec 32) V!53225 V!53225 (_ BitVec 32) Int) ListLongMap!20995)

(assert (=> b!1321960 (= res!877432 (contains!8668 (getCurrentListMap!5514 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!877434 () Bool)

(assert (=> start!111614 (=> (not res!877434) (not e!753874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111614 (= res!877434 (validMask!0 mask!2019))))

(assert (=> start!111614 e!753874))

(declare-fun array_inv!32483 (array!89104) Bool)

(assert (=> start!111614 (array_inv!32483 _keys!1609)))

(assert (=> start!111614 true))

(declare-fun tp_is_empty!36091 () Bool)

(assert (=> start!111614 tp_is_empty!36091))

(declare-fun e!753872 () Bool)

(declare-fun array_inv!32484 (array!89106) Bool)

(assert (=> start!111614 (and (array_inv!32484 _values!1337) e!753872)))

(assert (=> start!111614 tp!106288))

(declare-fun b!1321961 () Bool)

(declare-fun e!753871 () Bool)

(assert (=> b!1321961 (= e!753871 tp_is_empty!36091)))

(declare-fun b!1321962 () Bool)

(declare-fun res!877431 () Bool)

(assert (=> b!1321962 (=> (not res!877431) (not e!753874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89104 (_ BitVec 32)) Bool)

(assert (=> b!1321962 (= res!877431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321963 () Bool)

(assert (=> b!1321963 (= e!753874 (not true))))

(declare-fun lt!587799 () ListLongMap!20995)

(declare-fun lt!587802 () tuple2!23338)

(declare-fun +!4569 (ListLongMap!20995 tuple2!23338) ListLongMap!20995)

(assert (=> b!1321963 (contains!8668 (+!4569 lt!587799 lt!587802) k!1164)))

(declare-datatypes ((Unit!43558 0))(
  ( (Unit!43559) )
))
(declare-fun lt!587800 () Unit!43558)

(declare-fun addStillContains!1118 (ListLongMap!20995 (_ BitVec 64) V!53225 (_ BitVec 64)) Unit!43558)

(assert (=> b!1321963 (= lt!587800 (addStillContains!1118 lt!587799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1321963 (contains!8668 lt!587799 k!1164)))

(declare-fun lt!587797 () V!53225)

(declare-fun lt!587803 () Unit!43558)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!165 ((_ BitVec 64) (_ BitVec 64) V!53225 ListLongMap!20995) Unit!43558)

(assert (=> b!1321963 (= lt!587803 (lemmaInListMapAfterAddingDiffThenInBefore!165 k!1164 (select (arr!43026 _keys!1609) from!2000) lt!587797 lt!587799))))

(declare-fun lt!587801 () ListLongMap!20995)

(assert (=> b!1321963 (contains!8668 lt!587801 k!1164)))

(declare-fun lt!587804 () Unit!43558)

(assert (=> b!1321963 (= lt!587804 (lemmaInListMapAfterAddingDiffThenInBefore!165 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587801))))

(declare-fun lt!587798 () ListLongMap!20995)

(assert (=> b!1321963 (contains!8668 lt!587798 k!1164)))

(declare-fun lt!587805 () Unit!43558)

(assert (=> b!1321963 (= lt!587805 (lemmaInListMapAfterAddingDiffThenInBefore!165 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587798))))

(assert (=> b!1321963 (= lt!587798 (+!4569 lt!587801 lt!587802))))

(assert (=> b!1321963 (= lt!587802 (tuple2!23339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1321963 (= lt!587801 (+!4569 lt!587799 (tuple2!23339 (select (arr!43026 _keys!1609) from!2000) lt!587797)))))

(declare-fun get!21651 (ValueCell!17147 V!53225) V!53225)

(declare-fun dynLambda!3508 (Int (_ BitVec 64)) V!53225)

(assert (=> b!1321963 (= lt!587797 (get!21651 (select (arr!43027 _values!1337) from!2000) (dynLambda!3508 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6204 (array!89104 array!89106 (_ BitVec 32) (_ BitVec 32) V!53225 V!53225 (_ BitVec 32) Int) ListLongMap!20995)

(assert (=> b!1321963 (= lt!587799 (getCurrentListMapNoExtraKeys!6204 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321964 () Bool)

(declare-fun res!877429 () Bool)

(assert (=> b!1321964 (=> (not res!877429) (not e!753874))))

(assert (=> b!1321964 (= res!877429 (and (= (size!43577 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43576 _keys!1609) (size!43577 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321965 () Bool)

(declare-fun res!877433 () Bool)

(assert (=> b!1321965 (=> (not res!877433) (not e!753874))))

(declare-datatypes ((List!30487 0))(
  ( (Nil!30484) (Cons!30483 (h!31692 (_ BitVec 64)) (t!44307 List!30487)) )
))
(declare-fun arrayNoDuplicates!0 (array!89104 (_ BitVec 32) List!30487) Bool)

(assert (=> b!1321965 (= res!877433 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30484))))

(declare-fun mapIsEmpty!55784 () Bool)

(declare-fun mapRes!55784 () Bool)

(assert (=> mapIsEmpty!55784 mapRes!55784))

(declare-fun b!1321966 () Bool)

(declare-fun res!877436 () Bool)

(assert (=> b!1321966 (=> (not res!877436) (not e!753874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321966 (= res!877436 (validKeyInArray!0 (select (arr!43026 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55784 () Bool)

(declare-fun tp!106289 () Bool)

(assert (=> mapNonEmpty!55784 (= mapRes!55784 (and tp!106289 e!753871))))

(declare-fun mapValue!55784 () ValueCell!17147)

(declare-fun mapRest!55784 () (Array (_ BitVec 32) ValueCell!17147))

(declare-fun mapKey!55784 () (_ BitVec 32))

(assert (=> mapNonEmpty!55784 (= (arr!43027 _values!1337) (store mapRest!55784 mapKey!55784 mapValue!55784))))

(declare-fun b!1321967 () Bool)

(declare-fun res!877435 () Bool)

(assert (=> b!1321967 (=> (not res!877435) (not e!753874))))

(assert (=> b!1321967 (= res!877435 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43576 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321968 () Bool)

(declare-fun e!753873 () Bool)

(assert (=> b!1321968 (= e!753872 (and e!753873 mapRes!55784))))

(declare-fun condMapEmpty!55784 () Bool)

(declare-fun mapDefault!55784 () ValueCell!17147)

