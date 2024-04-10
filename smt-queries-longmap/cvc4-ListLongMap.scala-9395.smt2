; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111868 () Bool)

(assert start!111868)

(declare-fun b_free!30467 () Bool)

(declare-fun b_next!30467 () Bool)

(assert (=> start!111868 (= b_free!30467 (not b_next!30467))))

(declare-fun tp!106880 () Bool)

(declare-fun b_and!49029 () Bool)

(assert (=> start!111868 (= tp!106880 b_and!49029)))

(declare-fun b!1325453 () Bool)

(declare-fun res!879687 () Bool)

(declare-fun e!755600 () Bool)

(assert (=> b!1325453 (=> (not res!879687) (not e!755600))))

(declare-datatypes ((array!89482 0))(
  ( (array!89483 (arr!43214 (Array (_ BitVec 32) (_ BitVec 64))) (size!43764 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89482)

(declare-datatypes ((List!30634 0))(
  ( (Nil!30631) (Cons!30630 (h!31839 (_ BitVec 64)) (t!44572 List!30634)) )
))
(declare-fun arrayNoDuplicates!0 (array!89482 (_ BitVec 32) List!30634) Bool)

(assert (=> b!1325453 (= res!879687 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30631))))

(declare-fun b!1325454 () Bool)

(declare-fun res!879682 () Bool)

(assert (=> b!1325454 (=> (not res!879682) (not e!755600))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1325454 (= res!879682 (not (= (select (arr!43214 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1325455 () Bool)

(declare-fun e!755599 () Bool)

(declare-fun tp_is_empty!36287 () Bool)

(assert (=> b!1325455 (= e!755599 tp_is_empty!36287)))

(declare-fun b!1325456 () Bool)

(declare-fun e!755601 () Bool)

(assert (=> b!1325456 (= e!755601 tp_is_empty!36287)))

(declare-fun b!1325457 () Bool)

(declare-fun res!879681 () Bool)

(assert (=> b!1325457 (=> (not res!879681) (not e!755600))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53485 0))(
  ( (V!53486 (val!18218 Int)) )
))
(declare-fun zeroValue!1279 () V!53485)

(declare-datatypes ((ValueCell!17245 0))(
  ( (ValueCellFull!17245 (v!20851 V!53485)) (EmptyCell!17245) )
))
(declare-datatypes ((array!89484 0))(
  ( (array!89485 (arr!43215 (Array (_ BitVec 32) ValueCell!17245)) (size!43765 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89484)

(declare-fun minValue!1279 () V!53485)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23494 0))(
  ( (tuple2!23495 (_1!11758 (_ BitVec 64)) (_2!11758 V!53485)) )
))
(declare-datatypes ((List!30635 0))(
  ( (Nil!30632) (Cons!30631 (h!31840 tuple2!23494) (t!44573 List!30635)) )
))
(declare-datatypes ((ListLongMap!21151 0))(
  ( (ListLongMap!21152 (toList!10591 List!30635)) )
))
(declare-fun contains!8748 (ListLongMap!21151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5587 (array!89482 array!89484 (_ BitVec 32) (_ BitVec 32) V!53485 V!53485 (_ BitVec 32) Int) ListLongMap!21151)

(assert (=> b!1325457 (= res!879681 (contains!8748 (getCurrentListMap!5587 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!879688 () Bool)

(assert (=> start!111868 (=> (not res!879688) (not e!755600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111868 (= res!879688 (validMask!0 mask!2019))))

(assert (=> start!111868 e!755600))

(declare-fun array_inv!32619 (array!89482) Bool)

(assert (=> start!111868 (array_inv!32619 _keys!1609)))

(assert (=> start!111868 true))

(assert (=> start!111868 tp_is_empty!36287))

(declare-fun e!755598 () Bool)

(declare-fun array_inv!32620 (array!89484) Bool)

(assert (=> start!111868 (and (array_inv!32620 _values!1337) e!755598)))

(assert (=> start!111868 tp!106880))

(declare-fun b!1325458 () Bool)

(declare-fun res!879683 () Bool)

(assert (=> b!1325458 (=> (not res!879683) (not e!755600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325458 (= res!879683 (validKeyInArray!0 (select (arr!43214 _keys!1609) from!2000)))))

(declare-fun b!1325459 () Bool)

(declare-fun res!879686 () Bool)

(assert (=> b!1325459 (=> (not res!879686) (not e!755600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89482 (_ BitVec 32)) Bool)

(assert (=> b!1325459 (= res!879686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325460 () Bool)

(assert (=> b!1325460 (= e!755600 false)))

(declare-fun lt!589785 () Bool)

(declare-fun +!4614 (ListLongMap!21151 tuple2!23494) ListLongMap!21151)

(declare-fun getCurrentListMapNoExtraKeys!6252 (array!89482 array!89484 (_ BitVec 32) (_ BitVec 32) V!53485 V!53485 (_ BitVec 32) Int) ListLongMap!21151)

(declare-fun get!21763 (ValueCell!17245 V!53485) V!53485)

(declare-fun dynLambda!3553 (Int (_ BitVec 64)) V!53485)

(assert (=> b!1325460 (= lt!589785 (contains!8748 (+!4614 (+!4614 (+!4614 (getCurrentListMapNoExtraKeys!6252 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23495 (select (arr!43214 _keys!1609) from!2000) (get!21763 (select (arr!43215 _values!1337) from!2000) (dynLambda!3553 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164))))

(declare-fun mapNonEmpty!56082 () Bool)

(declare-fun mapRes!56082 () Bool)

(declare-fun tp!106881 () Bool)

(assert (=> mapNonEmpty!56082 (= mapRes!56082 (and tp!106881 e!755599))))

(declare-fun mapValue!56082 () ValueCell!17245)

(declare-fun mapKey!56082 () (_ BitVec 32))

(declare-fun mapRest!56082 () (Array (_ BitVec 32) ValueCell!17245))

(assert (=> mapNonEmpty!56082 (= (arr!43215 _values!1337) (store mapRest!56082 mapKey!56082 mapValue!56082))))

(declare-fun b!1325461 () Bool)

(declare-fun res!879684 () Bool)

(assert (=> b!1325461 (=> (not res!879684) (not e!755600))))

(assert (=> b!1325461 (= res!879684 (and (= (size!43765 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43764 _keys!1609) (size!43765 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325462 () Bool)

(declare-fun res!879685 () Bool)

(assert (=> b!1325462 (=> (not res!879685) (not e!755600))))

(assert (=> b!1325462 (= res!879685 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43764 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56082 () Bool)

(assert (=> mapIsEmpty!56082 mapRes!56082))

(declare-fun b!1325463 () Bool)

(assert (=> b!1325463 (= e!755598 (and e!755601 mapRes!56082))))

(declare-fun condMapEmpty!56082 () Bool)

(declare-fun mapDefault!56082 () ValueCell!17245)

