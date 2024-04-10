; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111624 () Bool)

(assert start!111624)

(declare-fun b_free!30281 () Bool)

(declare-fun b_next!30281 () Bool)

(assert (=> start!111624 (= b_free!30281 (not b_next!30281))))

(declare-fun tp!106318 () Bool)

(declare-fun b_and!48721 () Bool)

(assert (=> start!111624 (= tp!106318 b_and!48721)))

(declare-fun b!1322135 () Bool)

(declare-fun res!877550 () Bool)

(declare-fun e!753949 () Bool)

(assert (=> b!1322135 (=> (not res!877550) (not e!753949))))

(declare-datatypes ((array!89124 0))(
  ( (array!89125 (arr!43036 (Array (_ BitVec 32) (_ BitVec 64))) (size!43586 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89124)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322135 (= res!877550 (validKeyInArray!0 (select (arr!43036 _keys!1609) from!2000)))))

(declare-fun b!1322136 () Bool)

(declare-fun res!877554 () Bool)

(assert (=> b!1322136 (=> (not res!877554) (not e!753949))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53237 0))(
  ( (V!53238 (val!18125 Int)) )
))
(declare-fun zeroValue!1279 () V!53237)

(declare-datatypes ((ValueCell!17152 0))(
  ( (ValueCellFull!17152 (v!20755 V!53237)) (EmptyCell!17152) )
))
(declare-datatypes ((array!89126 0))(
  ( (array!89127 (arr!43037 (Array (_ BitVec 32) ValueCell!17152)) (size!43587 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89126)

(declare-fun minValue!1279 () V!53237)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23348 0))(
  ( (tuple2!23349 (_1!11685 (_ BitVec 64)) (_2!11685 V!53237)) )
))
(declare-datatypes ((List!30495 0))(
  ( (Nil!30492) (Cons!30491 (h!31700 tuple2!23348) (t!44325 List!30495)) )
))
(declare-datatypes ((ListLongMap!21005 0))(
  ( (ListLongMap!21006 (toList!10518 List!30495)) )
))
(declare-fun contains!8673 (ListLongMap!21005 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5519 (array!89124 array!89126 (_ BitVec 32) (_ BitVec 32) V!53237 V!53237 (_ BitVec 32) Int) ListLongMap!21005)

(assert (=> b!1322136 (= res!877554 (contains!8673 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1322137 () Bool)

(assert (=> b!1322137 (= e!753949 (not true))))

(declare-fun lt!587940 () ListLongMap!21005)

(declare-fun lt!587937 () tuple2!23348)

(declare-fun +!4573 (ListLongMap!21005 tuple2!23348) ListLongMap!21005)

(assert (=> b!1322137 (contains!8673 (+!4573 lt!587940 lt!587937) k!1164)))

(declare-datatypes ((Unit!43566 0))(
  ( (Unit!43567) )
))
(declare-fun lt!587938 () Unit!43566)

(declare-fun addStillContains!1122 (ListLongMap!21005 (_ BitVec 64) V!53237 (_ BitVec 64)) Unit!43566)

(assert (=> b!1322137 (= lt!587938 (addStillContains!1122 lt!587940 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1322137 (contains!8673 lt!587940 k!1164)))

(declare-fun lt!587933 () Unit!43566)

(declare-fun lt!587939 () V!53237)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!169 ((_ BitVec 64) (_ BitVec 64) V!53237 ListLongMap!21005) Unit!43566)

(assert (=> b!1322137 (= lt!587933 (lemmaInListMapAfterAddingDiffThenInBefore!169 k!1164 (select (arr!43036 _keys!1609) from!2000) lt!587939 lt!587940))))

(declare-fun lt!587935 () ListLongMap!21005)

(assert (=> b!1322137 (contains!8673 lt!587935 k!1164)))

(declare-fun lt!587934 () Unit!43566)

(assert (=> b!1322137 (= lt!587934 (lemmaInListMapAfterAddingDiffThenInBefore!169 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587935))))

(declare-fun lt!587932 () ListLongMap!21005)

(assert (=> b!1322137 (contains!8673 lt!587932 k!1164)))

(declare-fun lt!587936 () Unit!43566)

(assert (=> b!1322137 (= lt!587936 (lemmaInListMapAfterAddingDiffThenInBefore!169 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587932))))

(assert (=> b!1322137 (= lt!587932 (+!4573 lt!587935 lt!587937))))

(assert (=> b!1322137 (= lt!587937 (tuple2!23349 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322137 (= lt!587935 (+!4573 lt!587940 (tuple2!23349 (select (arr!43036 _keys!1609) from!2000) lt!587939)))))

(declare-fun get!21657 (ValueCell!17152 V!53237) V!53237)

(declare-fun dynLambda!3512 (Int (_ BitVec 64)) V!53237)

(assert (=> b!1322137 (= lt!587939 (get!21657 (select (arr!43037 _values!1337) from!2000) (dynLambda!3512 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6208 (array!89124 array!89126 (_ BitVec 32) (_ BitVec 32) V!53237 V!53237 (_ BitVec 32) Int) ListLongMap!21005)

(assert (=> b!1322137 (= lt!587940 (getCurrentListMapNoExtraKeys!6208 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322138 () Bool)

(declare-fun res!877552 () Bool)

(assert (=> b!1322138 (=> (not res!877552) (not e!753949))))

(declare-datatypes ((List!30496 0))(
  ( (Nil!30493) (Cons!30492 (h!31701 (_ BitVec 64)) (t!44326 List!30496)) )
))
(declare-fun arrayNoDuplicates!0 (array!89124 (_ BitVec 32) List!30496) Bool)

(assert (=> b!1322138 (= res!877552 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30493))))

(declare-fun mapNonEmpty!55799 () Bool)

(declare-fun mapRes!55799 () Bool)

(declare-fun tp!106319 () Bool)

(declare-fun e!753948 () Bool)

(assert (=> mapNonEmpty!55799 (= mapRes!55799 (and tp!106319 e!753948))))

(declare-fun mapValue!55799 () ValueCell!17152)

(declare-fun mapKey!55799 () (_ BitVec 32))

(declare-fun mapRest!55799 () (Array (_ BitVec 32) ValueCell!17152))

(assert (=> mapNonEmpty!55799 (= (arr!43037 _values!1337) (store mapRest!55799 mapKey!55799 mapValue!55799))))

(declare-fun b!1322139 () Bool)

(declare-fun res!877549 () Bool)

(assert (=> b!1322139 (=> (not res!877549) (not e!753949))))

(assert (=> b!1322139 (= res!877549 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43586 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322140 () Bool)

(declare-fun e!753945 () Bool)

(declare-fun tp_is_empty!36101 () Bool)

(assert (=> b!1322140 (= e!753945 tp_is_empty!36101)))

(declare-fun res!877556 () Bool)

(assert (=> start!111624 (=> (not res!877556) (not e!753949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111624 (= res!877556 (validMask!0 mask!2019))))

(assert (=> start!111624 e!753949))

(declare-fun array_inv!32491 (array!89124) Bool)

(assert (=> start!111624 (array_inv!32491 _keys!1609)))

(assert (=> start!111624 true))

(assert (=> start!111624 tp_is_empty!36101))

(declare-fun e!753946 () Bool)

(declare-fun array_inv!32492 (array!89126) Bool)

(assert (=> start!111624 (and (array_inv!32492 _values!1337) e!753946)))

(assert (=> start!111624 tp!106318))

(declare-fun b!1322141 () Bool)

(declare-fun res!877553 () Bool)

(assert (=> b!1322141 (=> (not res!877553) (not e!753949))))

(assert (=> b!1322141 (= res!877553 (not (= (select (arr!43036 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1322142 () Bool)

(assert (=> b!1322142 (= e!753948 tp_is_empty!36101)))

(declare-fun b!1322143 () Bool)

(declare-fun res!877551 () Bool)

(assert (=> b!1322143 (=> (not res!877551) (not e!753949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89124 (_ BitVec 32)) Bool)

(assert (=> b!1322143 (= res!877551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322144 () Bool)

(declare-fun res!877555 () Bool)

(assert (=> b!1322144 (=> (not res!877555) (not e!753949))))

(assert (=> b!1322144 (= res!877555 (and (= (size!43587 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43586 _keys!1609) (size!43587 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55799 () Bool)

(assert (=> mapIsEmpty!55799 mapRes!55799))

(declare-fun b!1322145 () Bool)

(assert (=> b!1322145 (= e!753946 (and e!753945 mapRes!55799))))

(declare-fun condMapEmpty!55799 () Bool)

(declare-fun mapDefault!55799 () ValueCell!17152)

