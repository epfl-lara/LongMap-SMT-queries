; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111710 () Bool)

(assert start!111710)

(declare-fun b_free!30367 () Bool)

(declare-fun b_next!30367 () Bool)

(assert (=> start!111710 (= b_free!30367 (not b_next!30367))))

(declare-fun tp!106576 () Bool)

(declare-fun b_and!48893 () Bool)

(assert (=> start!111710 (= tp!106576 b_and!48893)))

(declare-fun mapIsEmpty!55928 () Bool)

(declare-fun mapRes!55928 () Bool)

(assert (=> mapIsEmpty!55928 mapRes!55928))

(declare-fun b!1323640 () Bool)

(declare-fun res!878584 () Bool)

(declare-fun e!754591 () Bool)

(assert (=> b!1323640 (=> (not res!878584) (not e!754591))))

(declare-datatypes ((array!89290 0))(
  ( (array!89291 (arr!43119 (Array (_ BitVec 32) (_ BitVec 64))) (size!43669 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89290)

(declare-datatypes ((List!30563 0))(
  ( (Nil!30560) (Cons!30559 (h!31768 (_ BitVec 64)) (t!44479 List!30563)) )
))
(declare-fun arrayNoDuplicates!0 (array!89290 (_ BitVec 32) List!30563) Bool)

(assert (=> b!1323640 (= res!878584 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30560))))

(declare-fun b!1323641 () Bool)

(declare-fun res!878586 () Bool)

(assert (=> b!1323641 (=> (not res!878586) (not e!754591))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1323641 (= res!878586 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43669 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323642 () Bool)

(declare-fun res!878588 () Bool)

(assert (=> b!1323642 (=> (not res!878588) (not e!754591))))

(declare-datatypes ((V!53353 0))(
  ( (V!53354 (val!18168 Int)) )
))
(declare-fun zeroValue!1279 () V!53353)

(declare-datatypes ((ValueCell!17195 0))(
  ( (ValueCellFull!17195 (v!20798 V!53353)) (EmptyCell!17195) )
))
(declare-datatypes ((array!89292 0))(
  ( (array!89293 (arr!43120 (Array (_ BitVec 32) ValueCell!17195)) (size!43670 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89292)

(declare-fun minValue!1279 () V!53353)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23420 0))(
  ( (tuple2!23421 (_1!11721 (_ BitVec 64)) (_2!11721 V!53353)) )
))
(declare-datatypes ((List!30564 0))(
  ( (Nil!30561) (Cons!30560 (h!31769 tuple2!23420) (t!44480 List!30564)) )
))
(declare-datatypes ((ListLongMap!21077 0))(
  ( (ListLongMap!21078 (toList!10554 List!30564)) )
))
(declare-fun contains!8709 (ListLongMap!21077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5551 (array!89290 array!89292 (_ BitVec 32) (_ BitVec 32) V!53353 V!53353 (_ BitVec 32) Int) ListLongMap!21077)

(assert (=> b!1323642 (= res!878588 (contains!8709 (getCurrentListMap!5551 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1323644 () Bool)

(declare-fun res!878582 () Bool)

(assert (=> b!1323644 (=> (not res!878582) (not e!754591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89290 (_ BitVec 32)) Bool)

(assert (=> b!1323644 (= res!878582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323645 () Bool)

(declare-fun e!754593 () Bool)

(declare-fun tp_is_empty!36187 () Bool)

(assert (=> b!1323645 (= e!754593 tp_is_empty!36187)))

(declare-fun b!1323646 () Bool)

(declare-fun res!878587 () Bool)

(assert (=> b!1323646 (=> (not res!878587) (not e!754591))))

(assert (=> b!1323646 (= res!878587 (and (= (size!43670 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43669 _keys!1609) (size!43670 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55928 () Bool)

(declare-fun tp!106577 () Bool)

(declare-fun e!754590 () Bool)

(assert (=> mapNonEmpty!55928 (= mapRes!55928 (and tp!106577 e!754590))))

(declare-fun mapKey!55928 () (_ BitVec 32))

(declare-fun mapValue!55928 () ValueCell!17195)

(declare-fun mapRest!55928 () (Array (_ BitVec 32) ValueCell!17195))

(assert (=> mapNonEmpty!55928 (= (arr!43120 _values!1337) (store mapRest!55928 mapKey!55928 mapValue!55928))))

(declare-fun b!1323647 () Bool)

(assert (=> b!1323647 (= e!754591 (not true))))

(declare-fun lt!589228 () ListLongMap!21077)

(declare-fun +!4605 (ListLongMap!21077 tuple2!23420) ListLongMap!21077)

(assert (=> b!1323647 (contains!8709 (+!4605 lt!589228 (tuple2!23421 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164)))

(declare-datatypes ((Unit!43630 0))(
  ( (Unit!43631) )
))
(declare-fun lt!589232 () Unit!43630)

(declare-fun addStillContains!1154 (ListLongMap!21077 (_ BitVec 64) V!53353 (_ BitVec 64)) Unit!43630)

(assert (=> b!1323647 (= lt!589232 (addStillContains!1154 lt!589228 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k!1164))))

(assert (=> b!1323647 (contains!8709 lt!589228 k!1164)))

(declare-fun lt!589223 () ListLongMap!21077)

(declare-fun lt!589226 () tuple2!23420)

(assert (=> b!1323647 (= lt!589228 (+!4605 lt!589223 lt!589226))))

(declare-fun lt!589225 () Unit!43630)

(assert (=> b!1323647 (= lt!589225 (addStillContains!1154 lt!589223 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k!1164))))

(assert (=> b!1323647 (contains!8709 lt!589223 k!1164)))

(declare-fun lt!589227 () V!53353)

(declare-fun lt!589231 () Unit!43630)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!201 ((_ BitVec 64) (_ BitVec 64) V!53353 ListLongMap!21077) Unit!43630)

(assert (=> b!1323647 (= lt!589231 (lemmaInListMapAfterAddingDiffThenInBefore!201 k!1164 (select (arr!43119 _keys!1609) from!2000) lt!589227 lt!589223))))

(declare-fun lt!589233 () ListLongMap!21077)

(assert (=> b!1323647 (contains!8709 lt!589233 k!1164)))

(declare-fun lt!589224 () Unit!43630)

(assert (=> b!1323647 (= lt!589224 (lemmaInListMapAfterAddingDiffThenInBefore!201 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589233))))

(declare-fun lt!589229 () ListLongMap!21077)

(assert (=> b!1323647 (contains!8709 lt!589229 k!1164)))

(declare-fun lt!589230 () Unit!43630)

(assert (=> b!1323647 (= lt!589230 (lemmaInListMapAfterAddingDiffThenInBefore!201 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589229))))

(assert (=> b!1323647 (= lt!589229 (+!4605 lt!589233 lt!589226))))

(assert (=> b!1323647 (= lt!589226 (tuple2!23421 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323647 (= lt!589233 (+!4605 lt!589223 (tuple2!23421 (select (arr!43119 _keys!1609) from!2000) lt!589227)))))

(declare-fun get!21719 (ValueCell!17195 V!53353) V!53353)

(declare-fun dynLambda!3544 (Int (_ BitVec 64)) V!53353)

(assert (=> b!1323647 (= lt!589227 (get!21719 (select (arr!43120 _values!1337) from!2000) (dynLambda!3544 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6240 (array!89290 array!89292 (_ BitVec 32) (_ BitVec 32) V!53353 V!53353 (_ BitVec 32) Int) ListLongMap!21077)

(assert (=> b!1323647 (= lt!589223 (getCurrentListMapNoExtraKeys!6240 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323648 () Bool)

(declare-fun e!754594 () Bool)

(assert (=> b!1323648 (= e!754594 (and e!754593 mapRes!55928))))

(declare-fun condMapEmpty!55928 () Bool)

(declare-fun mapDefault!55928 () ValueCell!17195)

