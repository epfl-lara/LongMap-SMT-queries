; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111654 () Bool)

(assert start!111654)

(declare-fun b_free!30311 () Bool)

(declare-fun b_next!30311 () Bool)

(assert (=> start!111654 (= b_free!30311 (not b_next!30311))))

(declare-fun tp!106409 () Bool)

(declare-fun b_and!48781 () Bool)

(assert (=> start!111654 (= tp!106409 b_and!48781)))

(declare-fun mapIsEmpty!55844 () Bool)

(declare-fun mapRes!55844 () Bool)

(assert (=> mapIsEmpty!55844 mapRes!55844))

(declare-fun b!1322660 () Bool)

(declare-fun res!877909 () Bool)

(declare-fun e!754174 () Bool)

(assert (=> b!1322660 (=> (not res!877909) (not e!754174))))

(declare-datatypes ((array!89182 0))(
  ( (array!89183 (arr!43065 (Array (_ BitVec 32) (_ BitVec 64))) (size!43615 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89182)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1322660 (= res!877909 (not (= (select (arr!43065 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1322661 () Bool)

(assert (=> b!1322661 (= e!754174 (not true))))

(declare-datatypes ((V!53277 0))(
  ( (V!53278 (val!18140 Int)) )
))
(declare-datatypes ((tuple2!23374 0))(
  ( (tuple2!23375 (_1!11698 (_ BitVec 64)) (_2!11698 V!53277)) )
))
(declare-datatypes ((List!30519 0))(
  ( (Nil!30516) (Cons!30515 (h!31724 tuple2!23374) (t!44379 List!30519)) )
))
(declare-datatypes ((ListLongMap!21031 0))(
  ( (ListLongMap!21032 (toList!10531 List!30519)) )
))
(declare-fun lt!588338 () ListLongMap!21031)

(declare-fun lt!588343 () tuple2!23374)

(declare-fun contains!8686 (ListLongMap!21031 (_ BitVec 64)) Bool)

(declare-fun +!4583 (ListLongMap!21031 tuple2!23374) ListLongMap!21031)

(assert (=> b!1322661 (contains!8686 (+!4583 lt!588338 lt!588343) k!1164)))

(declare-fun zeroValue!1279 () V!53277)

(declare-datatypes ((Unit!43586 0))(
  ( (Unit!43587) )
))
(declare-fun lt!588342 () Unit!43586)

(declare-fun addStillContains!1132 (ListLongMap!21031 (_ BitVec 64) V!53277 (_ BitVec 64)) Unit!43586)

(assert (=> b!1322661 (= lt!588342 (addStillContains!1132 lt!588338 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322661 (contains!8686 lt!588338 k!1164)))

(declare-fun lt!588341 () V!53277)

(declare-fun lt!588340 () Unit!43586)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!179 ((_ BitVec 64) (_ BitVec 64) V!53277 ListLongMap!21031) Unit!43586)

(assert (=> b!1322661 (= lt!588340 (lemmaInListMapAfterAddingDiffThenInBefore!179 k!1164 (select (arr!43065 _keys!1609) from!2000) lt!588341 lt!588338))))

(declare-fun lt!588344 () ListLongMap!21031)

(assert (=> b!1322661 (contains!8686 lt!588344 k!1164)))

(declare-fun lt!588339 () Unit!43586)

(assert (=> b!1322661 (= lt!588339 (lemmaInListMapAfterAddingDiffThenInBefore!179 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588344))))

(declare-fun lt!588345 () ListLongMap!21031)

(assert (=> b!1322661 (contains!8686 lt!588345 k!1164)))

(declare-fun lt!588337 () Unit!43586)

(declare-fun minValue!1279 () V!53277)

(assert (=> b!1322661 (= lt!588337 (lemmaInListMapAfterAddingDiffThenInBefore!179 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588345))))

(assert (=> b!1322661 (= lt!588345 (+!4583 lt!588344 lt!588343))))

(assert (=> b!1322661 (= lt!588343 (tuple2!23375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322661 (= lt!588344 (+!4583 lt!588338 (tuple2!23375 (select (arr!43065 _keys!1609) from!2000) lt!588341)))))

(declare-datatypes ((ValueCell!17167 0))(
  ( (ValueCellFull!17167 (v!20770 V!53277)) (EmptyCell!17167) )
))
(declare-datatypes ((array!89184 0))(
  ( (array!89185 (arr!43066 (Array (_ BitVec 32) ValueCell!17167)) (size!43616 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89184)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21677 (ValueCell!17167 V!53277) V!53277)

(declare-fun dynLambda!3522 (Int (_ BitVec 64)) V!53277)

(assert (=> b!1322661 (= lt!588341 (get!21677 (select (arr!43066 _values!1337) from!2000) (dynLambda!3522 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6218 (array!89182 array!89184 (_ BitVec 32) (_ BitVec 32) V!53277 V!53277 (_ BitVec 32) Int) ListLongMap!21031)

(assert (=> b!1322661 (= lt!588338 (getCurrentListMapNoExtraKeys!6218 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322662 () Bool)

(declare-fun res!877911 () Bool)

(assert (=> b!1322662 (=> (not res!877911) (not e!754174))))

(declare-datatypes ((List!30520 0))(
  ( (Nil!30517) (Cons!30516 (h!31725 (_ BitVec 64)) (t!44380 List!30520)) )
))
(declare-fun arrayNoDuplicates!0 (array!89182 (_ BitVec 32) List!30520) Bool)

(assert (=> b!1322662 (= res!877911 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30517))))

(declare-fun b!1322663 () Bool)

(declare-fun res!877915 () Bool)

(assert (=> b!1322663 (=> (not res!877915) (not e!754174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89182 (_ BitVec 32)) Bool)

(assert (=> b!1322663 (= res!877915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322664 () Bool)

(declare-fun res!877912 () Bool)

(assert (=> b!1322664 (=> (not res!877912) (not e!754174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322664 (= res!877912 (validKeyInArray!0 (select (arr!43065 _keys!1609) from!2000)))))

(declare-fun res!877916 () Bool)

(assert (=> start!111654 (=> (not res!877916) (not e!754174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111654 (= res!877916 (validMask!0 mask!2019))))

(assert (=> start!111654 e!754174))

(declare-fun array_inv!32515 (array!89182) Bool)

(assert (=> start!111654 (array_inv!32515 _keys!1609)))

(assert (=> start!111654 true))

(declare-fun tp_is_empty!36131 () Bool)

(assert (=> start!111654 tp_is_empty!36131))

(declare-fun e!754172 () Bool)

(declare-fun array_inv!32516 (array!89184) Bool)

(assert (=> start!111654 (and (array_inv!32516 _values!1337) e!754172)))

(assert (=> start!111654 tp!106409))

(declare-fun b!1322665 () Bool)

(declare-fun res!877910 () Bool)

(assert (=> b!1322665 (=> (not res!877910) (not e!754174))))

(assert (=> b!1322665 (= res!877910 (and (= (size!43616 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43615 _keys!1609) (size!43616 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322666 () Bool)

(declare-fun e!754171 () Bool)

(assert (=> b!1322666 (= e!754171 tp_is_empty!36131)))

(declare-fun b!1322667 () Bool)

(assert (=> b!1322667 (= e!754172 (and e!754171 mapRes!55844))))

(declare-fun condMapEmpty!55844 () Bool)

(declare-fun mapDefault!55844 () ValueCell!17167)

