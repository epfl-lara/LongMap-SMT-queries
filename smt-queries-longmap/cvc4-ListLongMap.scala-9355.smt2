; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111570 () Bool)

(assert start!111570)

(declare-fun b_free!30227 () Bool)

(declare-fun b_next!30227 () Bool)

(assert (=> start!111570 (= b_free!30227 (not b_next!30227))))

(declare-fun tp!106156 () Bool)

(declare-fun b_and!48613 () Bool)

(assert (=> start!111570 (= tp!106156 b_and!48613)))

(declare-fun res!876906 () Bool)

(declare-fun e!753540 () Bool)

(assert (=> start!111570 (=> (not res!876906) (not e!753540))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111570 (= res!876906 (validMask!0 mask!2019))))

(assert (=> start!111570 e!753540))

(declare-datatypes ((array!89022 0))(
  ( (array!89023 (arr!42985 (Array (_ BitVec 32) (_ BitVec 64))) (size!43535 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89022)

(declare-fun array_inv!32451 (array!89022) Bool)

(assert (=> start!111570 (array_inv!32451 _keys!1609)))

(assert (=> start!111570 true))

(declare-fun tp_is_empty!36047 () Bool)

(assert (=> start!111570 tp_is_empty!36047))

(declare-datatypes ((V!53165 0))(
  ( (V!53166 (val!18098 Int)) )
))
(declare-datatypes ((ValueCell!17125 0))(
  ( (ValueCellFull!17125 (v!20728 V!53165)) (EmptyCell!17125) )
))
(declare-datatypes ((array!89024 0))(
  ( (array!89025 (arr!42986 (Array (_ BitVec 32) ValueCell!17125)) (size!43536 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89024)

(declare-fun e!753541 () Bool)

(declare-fun array_inv!32452 (array!89024) Bool)

(assert (=> start!111570 (and (array_inv!32452 _values!1337) e!753541)))

(assert (=> start!111570 tp!106156))

(declare-fun b!1321190 () Bool)

(assert (=> b!1321190 (= e!753540 (not true))))

(declare-datatypes ((tuple2!23310 0))(
  ( (tuple2!23311 (_1!11666 (_ BitVec 64)) (_2!11666 V!53165)) )
))
(declare-datatypes ((List!30458 0))(
  ( (Nil!30455) (Cons!30454 (h!31663 tuple2!23310) (t!44234 List!30458)) )
))
(declare-datatypes ((ListLongMap!20967 0))(
  ( (ListLongMap!20968 (toList!10499 List!30458)) )
))
(declare-fun lt!587315 () ListLongMap!20967)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8654 (ListLongMap!20967 (_ BitVec 64)) Bool)

(assert (=> b!1321190 (contains!8654 lt!587315 k!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((Unit!43532 0))(
  ( (Unit!43533) )
))
(declare-fun lt!587314 () Unit!43532)

(declare-fun lt!587313 () V!53165)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!152 ((_ BitVec 64) (_ BitVec 64) V!53165 ListLongMap!20967) Unit!43532)

(assert (=> b!1321190 (= lt!587314 (lemmaInListMapAfterAddingDiffThenInBefore!152 k!1164 (select (arr!42985 _keys!1609) from!2000) lt!587313 lt!587315))))

(declare-fun lt!587319 () ListLongMap!20967)

(assert (=> b!1321190 (contains!8654 lt!587319 k!1164)))

(declare-fun zeroValue!1279 () V!53165)

(declare-fun lt!587317 () Unit!43532)

(assert (=> b!1321190 (= lt!587317 (lemmaInListMapAfterAddingDiffThenInBefore!152 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587319))))

(declare-fun lt!587316 () ListLongMap!20967)

(assert (=> b!1321190 (contains!8654 lt!587316 k!1164)))

(declare-fun lt!587318 () Unit!43532)

(declare-fun minValue!1279 () V!53165)

(assert (=> b!1321190 (= lt!587318 (lemmaInListMapAfterAddingDiffThenInBefore!152 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587316))))

(declare-fun +!4556 (ListLongMap!20967 tuple2!23310) ListLongMap!20967)

(assert (=> b!1321190 (= lt!587316 (+!4556 lt!587319 (tuple2!23311 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321190 (= lt!587319 (+!4556 lt!587315 (tuple2!23311 (select (arr!42985 _keys!1609) from!2000) lt!587313)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21622 (ValueCell!17125 V!53165) V!53165)

(declare-fun dynLambda!3495 (Int (_ BitVec 64)) V!53165)

(assert (=> b!1321190 (= lt!587313 (get!21622 (select (arr!42986 _values!1337) from!2000) (dynLambda!3495 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6191 (array!89022 array!89024 (_ BitVec 32) (_ BitVec 32) V!53165 V!53165 (_ BitVec 32) Int) ListLongMap!20967)

(assert (=> b!1321190 (= lt!587315 (getCurrentListMapNoExtraKeys!6191 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321191 () Bool)

(declare-fun res!876907 () Bool)

(assert (=> b!1321191 (=> (not res!876907) (not e!753540))))

(declare-datatypes ((List!30459 0))(
  ( (Nil!30456) (Cons!30455 (h!31664 (_ BitVec 64)) (t!44235 List!30459)) )
))
(declare-fun arrayNoDuplicates!0 (array!89022 (_ BitVec 32) List!30459) Bool)

(assert (=> b!1321191 (= res!876907 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30456))))

(declare-fun mapIsEmpty!55718 () Bool)

(declare-fun mapRes!55718 () Bool)

(assert (=> mapIsEmpty!55718 mapRes!55718))

(declare-fun b!1321192 () Bool)

(declare-fun res!876908 () Bool)

(assert (=> b!1321192 (=> (not res!876908) (not e!753540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321192 (= res!876908 (validKeyInArray!0 (select (arr!42985 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55718 () Bool)

(declare-fun tp!106157 () Bool)

(declare-fun e!753543 () Bool)

(assert (=> mapNonEmpty!55718 (= mapRes!55718 (and tp!106157 e!753543))))

(declare-fun mapValue!55718 () ValueCell!17125)

(declare-fun mapRest!55718 () (Array (_ BitVec 32) ValueCell!17125))

(declare-fun mapKey!55718 () (_ BitVec 32))

(assert (=> mapNonEmpty!55718 (= (arr!42986 _values!1337) (store mapRest!55718 mapKey!55718 mapValue!55718))))

(declare-fun b!1321193 () Bool)

(declare-fun res!876903 () Bool)

(assert (=> b!1321193 (=> (not res!876903) (not e!753540))))

(assert (=> b!1321193 (= res!876903 (not (= (select (arr!42985 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1321194 () Bool)

(declare-fun res!876905 () Bool)

(assert (=> b!1321194 (=> (not res!876905) (not e!753540))))

(assert (=> b!1321194 (= res!876905 (and (= (size!43536 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43535 _keys!1609) (size!43536 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321195 () Bool)

(declare-fun e!753542 () Bool)

(assert (=> b!1321195 (= e!753541 (and e!753542 mapRes!55718))))

(declare-fun condMapEmpty!55718 () Bool)

(declare-fun mapDefault!55718 () ValueCell!17125)

