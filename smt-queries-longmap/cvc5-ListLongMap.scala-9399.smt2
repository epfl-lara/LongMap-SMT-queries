; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111888 () Bool)

(assert start!111888)

(declare-fun b_free!30487 () Bool)

(declare-fun b_next!30487 () Bool)

(assert (=> start!111888 (= b_free!30487 (not b_next!30487))))

(declare-fun tp!106940 () Bool)

(declare-fun b_and!49069 () Bool)

(assert (=> start!111888 (= tp!106940 b_and!49069)))

(declare-fun mapIsEmpty!56112 () Bool)

(declare-fun mapRes!56112 () Bool)

(assert (=> mapIsEmpty!56112 mapRes!56112))

(declare-fun b!1325803 () Bool)

(declare-fun res!879927 () Bool)

(declare-fun e!755749 () Bool)

(assert (=> b!1325803 (=> (not res!879927) (not e!755749))))

(declare-datatypes ((array!89520 0))(
  ( (array!89521 (arr!43233 (Array (_ BitVec 32) (_ BitVec 64))) (size!43783 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89520)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1325803 (= res!879927 (not (= (select (arr!43233 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1325804 () Bool)

(declare-fun res!879928 () Bool)

(assert (=> b!1325804 (=> (not res!879928) (not e!755749))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1325804 (= res!879928 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43783 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325805 () Bool)

(declare-fun res!879925 () Bool)

(assert (=> b!1325805 (=> (not res!879925) (not e!755749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325805 (= res!879925 (validKeyInArray!0 (select (arr!43233 _keys!1609) from!2000)))))

(declare-fun b!1325806 () Bool)

(declare-fun e!755748 () Bool)

(declare-fun tp_is_empty!36307 () Bool)

(assert (=> b!1325806 (= e!755748 tp_is_empty!36307)))

(declare-fun b!1325807 () Bool)

(declare-fun res!879921 () Bool)

(assert (=> b!1325807 (=> (not res!879921) (not e!755749))))

(declare-datatypes ((List!30650 0))(
  ( (Nil!30647) (Cons!30646 (h!31855 (_ BitVec 64)) (t!44608 List!30650)) )
))
(declare-fun arrayNoDuplicates!0 (array!89520 (_ BitVec 32) List!30650) Bool)

(assert (=> b!1325807 (= res!879921 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30647))))

(declare-fun res!879922 () Bool)

(assert (=> start!111888 (=> (not res!879922) (not e!755749))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111888 (= res!879922 (validMask!0 mask!2019))))

(assert (=> start!111888 e!755749))

(declare-fun array_inv!32633 (array!89520) Bool)

(assert (=> start!111888 (array_inv!32633 _keys!1609)))

(assert (=> start!111888 true))

(assert (=> start!111888 tp_is_empty!36307))

(declare-datatypes ((V!53513 0))(
  ( (V!53514 (val!18228 Int)) )
))
(declare-datatypes ((ValueCell!17255 0))(
  ( (ValueCellFull!17255 (v!20861 V!53513)) (EmptyCell!17255) )
))
(declare-datatypes ((array!89522 0))(
  ( (array!89523 (arr!43234 (Array (_ BitVec 32) ValueCell!17255)) (size!43784 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89522)

(declare-fun e!755752 () Bool)

(declare-fun array_inv!32634 (array!89522) Bool)

(assert (=> start!111888 (and (array_inv!32634 _values!1337) e!755752)))

(assert (=> start!111888 tp!106940))

(declare-fun mapNonEmpty!56112 () Bool)

(declare-fun tp!106941 () Bool)

(assert (=> mapNonEmpty!56112 (= mapRes!56112 (and tp!106941 e!755748))))

(declare-fun mapValue!56112 () ValueCell!17255)

(declare-fun mapKey!56112 () (_ BitVec 32))

(declare-fun mapRest!56112 () (Array (_ BitVec 32) ValueCell!17255))

(assert (=> mapNonEmpty!56112 (= (arr!43234 _values!1337) (store mapRest!56112 mapKey!56112 mapValue!56112))))

(declare-fun b!1325808 () Bool)

(assert (=> b!1325808 (= e!755749 (not true))))

(declare-datatypes ((tuple2!23510 0))(
  ( (tuple2!23511 (_1!11766 (_ BitVec 64)) (_2!11766 V!53513)) )
))
(declare-datatypes ((List!30651 0))(
  ( (Nil!30648) (Cons!30647 (h!31856 tuple2!23510) (t!44609 List!30651)) )
))
(declare-datatypes ((ListLongMap!21167 0))(
  ( (ListLongMap!21168 (toList!10599 List!30651)) )
))
(declare-fun lt!589845 () ListLongMap!21167)

(declare-fun contains!8756 (ListLongMap!21167 (_ BitVec 64)) Bool)

(assert (=> b!1325808 (contains!8756 lt!589845 k!1164)))

(declare-fun minValue!1279 () V!53513)

(declare-datatypes ((Unit!43672 0))(
  ( (Unit!43673) )
))
(declare-fun lt!589844 () Unit!43672)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!214 ((_ BitVec 64) (_ BitVec 64) V!53513 ListLongMap!21167) Unit!43672)

(assert (=> b!1325808 (= lt!589844 (lemmaInListMapAfterAddingDiffThenInBefore!214 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589845))))

(declare-fun zeroValue!1279 () V!53513)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4622 (ListLongMap!21167 tuple2!23510) ListLongMap!21167)

(declare-fun getCurrentListMapNoExtraKeys!6260 (array!89520 array!89522 (_ BitVec 32) (_ BitVec 32) V!53513 V!53513 (_ BitVec 32) Int) ListLongMap!21167)

(declare-fun get!21779 (ValueCell!17255 V!53513) V!53513)

(declare-fun dynLambda!3561 (Int (_ BitVec 64)) V!53513)

(assert (=> b!1325808 (= lt!589845 (+!4622 (+!4622 (getCurrentListMapNoExtraKeys!6260 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23511 (select (arr!43233 _keys!1609) from!2000) (get!21779 (select (arr!43234 _values!1337) from!2000) (dynLambda!3561 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23511 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1325809 () Bool)

(declare-fun e!755750 () Bool)

(assert (=> b!1325809 (= e!755750 tp_is_empty!36307)))

(declare-fun b!1325810 () Bool)

(declare-fun res!879926 () Bool)

(assert (=> b!1325810 (=> (not res!879926) (not e!755749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89520 (_ BitVec 32)) Bool)

(assert (=> b!1325810 (= res!879926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325811 () Bool)

(declare-fun res!879924 () Bool)

(assert (=> b!1325811 (=> (not res!879924) (not e!755749))))

(assert (=> b!1325811 (= res!879924 (and (= (size!43784 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43783 _keys!1609) (size!43784 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325812 () Bool)

(assert (=> b!1325812 (= e!755752 (and e!755750 mapRes!56112))))

(declare-fun condMapEmpty!56112 () Bool)

(declare-fun mapDefault!56112 () ValueCell!17255)

