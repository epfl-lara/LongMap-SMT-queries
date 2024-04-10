; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111584 () Bool)

(assert start!111584)

(declare-fun b_free!30241 () Bool)

(declare-fun b_next!30241 () Bool)

(assert (=> start!111584 (= b_free!30241 (not b_next!30241))))

(declare-fun tp!106199 () Bool)

(declare-fun b_and!48641 () Bool)

(assert (=> start!111584 (= tp!106199 b_and!48641)))

(declare-fun b!1321435 () Bool)

(declare-fun res!877075 () Bool)

(declare-fun e!753649 () Bool)

(assert (=> b!1321435 (=> (not res!877075) (not e!753649))))

(declare-datatypes ((array!89048 0))(
  ( (array!89049 (arr!42998 (Array (_ BitVec 32) (_ BitVec 64))) (size!43548 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89048)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53185 0))(
  ( (V!53186 (val!18105 Int)) )
))
(declare-datatypes ((ValueCell!17132 0))(
  ( (ValueCellFull!17132 (v!20735 V!53185)) (EmptyCell!17132) )
))
(declare-datatypes ((array!89050 0))(
  ( (array!89051 (arr!42999 (Array (_ BitVec 32) ValueCell!17132)) (size!43549 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89050)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1321435 (= res!877075 (and (= (size!43549 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43548 _keys!1609) (size!43549 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321436 () Bool)

(declare-fun e!753648 () Bool)

(declare-fun tp_is_empty!36061 () Bool)

(assert (=> b!1321436 (= e!753648 tp_is_empty!36061)))

(declare-fun b!1321437 () Bool)

(declare-fun e!753646 () Bool)

(assert (=> b!1321437 (= e!753646 tp_is_empty!36061)))

(declare-fun b!1321438 () Bool)

(declare-fun res!877073 () Bool)

(assert (=> b!1321438 (=> (not res!877073) (not e!753649))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1321438 (= res!877073 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43548 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55739 () Bool)

(declare-fun mapRes!55739 () Bool)

(declare-fun tp!106198 () Bool)

(assert (=> mapNonEmpty!55739 (= mapRes!55739 (and tp!106198 e!753646))))

(declare-fun mapValue!55739 () ValueCell!17132)

(declare-fun mapKey!55739 () (_ BitVec 32))

(declare-fun mapRest!55739 () (Array (_ BitVec 32) ValueCell!17132))

(assert (=> mapNonEmpty!55739 (= (arr!42999 _values!1337) (store mapRest!55739 mapKey!55739 mapValue!55739))))

(declare-fun b!1321439 () Bool)

(assert (=> b!1321439 (= e!753649 (not true))))

(declare-datatypes ((tuple2!23318 0))(
  ( (tuple2!23319 (_1!11670 (_ BitVec 64)) (_2!11670 V!53185)) )
))
(declare-datatypes ((List!30467 0))(
  ( (Nil!30464) (Cons!30463 (h!31672 tuple2!23318) (t!44257 List!30467)) )
))
(declare-datatypes ((ListLongMap!20975 0))(
  ( (ListLongMap!20976 (toList!10503 List!30467)) )
))
(declare-fun lt!587464 () ListLongMap!20975)

(declare-fun contains!8658 (ListLongMap!20975 (_ BitVec 64)) Bool)

(assert (=> b!1321439 (contains!8658 lt!587464 k!1164)))

(declare-fun lt!587460 () V!53185)

(declare-datatypes ((Unit!43540 0))(
  ( (Unit!43541) )
))
(declare-fun lt!587466 () Unit!43540)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!156 ((_ BitVec 64) (_ BitVec 64) V!53185 ListLongMap!20975) Unit!43540)

(assert (=> b!1321439 (= lt!587466 (lemmaInListMapAfterAddingDiffThenInBefore!156 k!1164 (select (arr!42998 _keys!1609) from!2000) lt!587460 lt!587464))))

(declare-fun lt!587462 () ListLongMap!20975)

(assert (=> b!1321439 (contains!8658 lt!587462 k!1164)))

(declare-fun zeroValue!1279 () V!53185)

(declare-fun lt!587463 () Unit!43540)

(assert (=> b!1321439 (= lt!587463 (lemmaInListMapAfterAddingDiffThenInBefore!156 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587462))))

(declare-fun lt!587461 () ListLongMap!20975)

(assert (=> b!1321439 (contains!8658 lt!587461 k!1164)))

(declare-fun minValue!1279 () V!53185)

(declare-fun lt!587465 () Unit!43540)

(assert (=> b!1321439 (= lt!587465 (lemmaInListMapAfterAddingDiffThenInBefore!156 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587461))))

(declare-fun +!4560 (ListLongMap!20975 tuple2!23318) ListLongMap!20975)

(assert (=> b!1321439 (= lt!587461 (+!4560 lt!587462 (tuple2!23319 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321439 (= lt!587462 (+!4560 lt!587464 (tuple2!23319 (select (arr!42998 _keys!1609) from!2000) lt!587460)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21632 (ValueCell!17132 V!53185) V!53185)

(declare-fun dynLambda!3499 (Int (_ BitVec 64)) V!53185)

(assert (=> b!1321439 (= lt!587460 (get!21632 (select (arr!42999 _values!1337) from!2000) (dynLambda!3499 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6195 (array!89048 array!89050 (_ BitVec 32) (_ BitVec 32) V!53185 V!53185 (_ BitVec 32) Int) ListLongMap!20975)

(assert (=> b!1321439 (= lt!587464 (getCurrentListMapNoExtraKeys!6195 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321440 () Bool)

(declare-fun e!753645 () Bool)

(assert (=> b!1321440 (= e!753645 (and e!753648 mapRes!55739))))

(declare-fun condMapEmpty!55739 () Bool)

(declare-fun mapDefault!55739 () ValueCell!17132)

