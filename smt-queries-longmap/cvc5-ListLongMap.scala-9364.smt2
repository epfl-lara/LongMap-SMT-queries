; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111620 () Bool)

(assert start!111620)

(declare-fun b_free!30277 () Bool)

(declare-fun b_next!30277 () Bool)

(assert (=> start!111620 (= b_free!30277 (not b_next!30277))))

(declare-fun tp!106307 () Bool)

(declare-fun b_and!48713 () Bool)

(assert (=> start!111620 (= tp!106307 b_and!48713)))

(declare-fun b!1322065 () Bool)

(declare-fun e!753918 () Bool)

(assert (=> b!1322065 (= e!753918 (not true))))

(declare-datatypes ((V!53233 0))(
  ( (V!53234 (val!18123 Int)) )
))
(declare-datatypes ((tuple2!23344 0))(
  ( (tuple2!23345 (_1!11683 (_ BitVec 64)) (_2!11683 V!53233)) )
))
(declare-datatypes ((List!30492 0))(
  ( (Nil!30489) (Cons!30488 (h!31697 tuple2!23344) (t!44318 List!30492)) )
))
(declare-datatypes ((ListLongMap!21001 0))(
  ( (ListLongMap!21002 (toList!10516 List!30492)) )
))
(declare-fun lt!587880 () ListLongMap!21001)

(declare-fun lt!587878 () tuple2!23344)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8671 (ListLongMap!21001 (_ BitVec 64)) Bool)

(declare-fun +!4571 (ListLongMap!21001 tuple2!23344) ListLongMap!21001)

(assert (=> b!1322065 (contains!8671 (+!4571 lt!587880 lt!587878) k!1164)))

(declare-fun zeroValue!1279 () V!53233)

(declare-datatypes ((Unit!43562 0))(
  ( (Unit!43563) )
))
(declare-fun lt!587882 () Unit!43562)

(declare-fun addStillContains!1120 (ListLongMap!21001 (_ BitVec 64) V!53233 (_ BitVec 64)) Unit!43562)

(assert (=> b!1322065 (= lt!587882 (addStillContains!1120 lt!587880 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322065 (contains!8671 lt!587880 k!1164)))

(declare-datatypes ((array!89116 0))(
  ( (array!89117 (arr!43032 (Array (_ BitVec 32) (_ BitVec 64))) (size!43582 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89116)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!587883 () V!53233)

(declare-fun lt!587879 () Unit!43562)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!167 ((_ BitVec 64) (_ BitVec 64) V!53233 ListLongMap!21001) Unit!43562)

(assert (=> b!1322065 (= lt!587879 (lemmaInListMapAfterAddingDiffThenInBefore!167 k!1164 (select (arr!43032 _keys!1609) from!2000) lt!587883 lt!587880))))

(declare-fun lt!587885 () ListLongMap!21001)

(assert (=> b!1322065 (contains!8671 lt!587885 k!1164)))

(declare-fun lt!587886 () Unit!43562)

(assert (=> b!1322065 (= lt!587886 (lemmaInListMapAfterAddingDiffThenInBefore!167 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587885))))

(declare-fun lt!587881 () ListLongMap!21001)

(assert (=> b!1322065 (contains!8671 lt!587881 k!1164)))

(declare-fun lt!587884 () Unit!43562)

(declare-fun minValue!1279 () V!53233)

(assert (=> b!1322065 (= lt!587884 (lemmaInListMapAfterAddingDiffThenInBefore!167 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587881))))

(assert (=> b!1322065 (= lt!587881 (+!4571 lt!587885 lt!587878))))

(assert (=> b!1322065 (= lt!587878 (tuple2!23345 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322065 (= lt!587885 (+!4571 lt!587880 (tuple2!23345 (select (arr!43032 _keys!1609) from!2000) lt!587883)))))

(declare-datatypes ((ValueCell!17150 0))(
  ( (ValueCellFull!17150 (v!20753 V!53233)) (EmptyCell!17150) )
))
(declare-datatypes ((array!89118 0))(
  ( (array!89119 (arr!43033 (Array (_ BitVec 32) ValueCell!17150)) (size!43583 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89118)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21655 (ValueCell!17150 V!53233) V!53233)

(declare-fun dynLambda!3510 (Int (_ BitVec 64)) V!53233)

(assert (=> b!1322065 (= lt!587883 (get!21655 (select (arr!43033 _values!1337) from!2000) (dynLambda!3510 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6206 (array!89116 array!89118 (_ BitVec 32) (_ BitVec 32) V!53233 V!53233 (_ BitVec 32) Int) ListLongMap!21001)

(assert (=> b!1322065 (= lt!587880 (getCurrentListMapNoExtraKeys!6206 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapNonEmpty!55793 () Bool)

(declare-fun mapRes!55793 () Bool)

(declare-fun tp!106306 () Bool)

(declare-fun e!753919 () Bool)

(assert (=> mapNonEmpty!55793 (= mapRes!55793 (and tp!106306 e!753919))))

(declare-fun mapRest!55793 () (Array (_ BitVec 32) ValueCell!17150))

(declare-fun mapKey!55793 () (_ BitVec 32))

(declare-fun mapValue!55793 () ValueCell!17150)

(assert (=> mapNonEmpty!55793 (= (arr!43033 _values!1337) (store mapRest!55793 mapKey!55793 mapValue!55793))))

(declare-fun res!877506 () Bool)

(assert (=> start!111620 (=> (not res!877506) (not e!753918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111620 (= res!877506 (validMask!0 mask!2019))))

(assert (=> start!111620 e!753918))

(declare-fun array_inv!32487 (array!89116) Bool)

(assert (=> start!111620 (array_inv!32487 _keys!1609)))

(assert (=> start!111620 true))

(declare-fun tp_is_empty!36097 () Bool)

(assert (=> start!111620 tp_is_empty!36097))

(declare-fun e!753917 () Bool)

(declare-fun array_inv!32488 (array!89118) Bool)

(assert (=> start!111620 (and (array_inv!32488 _values!1337) e!753917)))

(assert (=> start!111620 tp!106307))

(declare-fun b!1322066 () Bool)

(declare-fun res!877508 () Bool)

(assert (=> b!1322066 (=> (not res!877508) (not e!753918))))

(declare-fun getCurrentListMap!5517 (array!89116 array!89118 (_ BitVec 32) (_ BitVec 32) V!53233 V!53233 (_ BitVec 32) Int) ListLongMap!21001)

(assert (=> b!1322066 (= res!877508 (contains!8671 (getCurrentListMap!5517 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1322067 () Bool)

(declare-fun e!753915 () Bool)

(assert (=> b!1322067 (= e!753915 tp_is_empty!36097)))

(declare-fun b!1322068 () Bool)

(declare-fun res!877505 () Bool)

(assert (=> b!1322068 (=> (not res!877505) (not e!753918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89116 (_ BitVec 32)) Bool)

(assert (=> b!1322068 (= res!877505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322069 () Bool)

(declare-fun res!877501 () Bool)

(assert (=> b!1322069 (=> (not res!877501) (not e!753918))))

(assert (=> b!1322069 (= res!877501 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43582 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55793 () Bool)

(assert (=> mapIsEmpty!55793 mapRes!55793))

(declare-fun b!1322070 () Bool)

(declare-fun res!877507 () Bool)

(assert (=> b!1322070 (=> (not res!877507) (not e!753918))))

(assert (=> b!1322070 (= res!877507 (not (= (select (arr!43032 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1322071 () Bool)

(assert (=> b!1322071 (= e!753917 (and e!753915 mapRes!55793))))

(declare-fun condMapEmpty!55793 () Bool)

(declare-fun mapDefault!55793 () ValueCell!17150)

