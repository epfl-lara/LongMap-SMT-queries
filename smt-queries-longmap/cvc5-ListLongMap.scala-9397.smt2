; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111876 () Bool)

(assert start!111876)

(declare-fun b_free!30475 () Bool)

(declare-fun b_next!30475 () Bool)

(assert (=> start!111876 (= b_free!30475 (not b_next!30475))))

(declare-fun tp!106904 () Bool)

(declare-fun b_and!49045 () Bool)

(assert (=> start!111876 (= tp!106904 b_and!49045)))

(declare-fun b!1325593 () Bool)

(declare-fun res!879777 () Bool)

(declare-fun e!755658 () Bool)

(assert (=> b!1325593 (=> (not res!879777) (not e!755658))))

(declare-datatypes ((array!89498 0))(
  ( (array!89499 (arr!43222 (Array (_ BitVec 32) (_ BitVec 64))) (size!43772 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89498)

(declare-datatypes ((List!30642 0))(
  ( (Nil!30639) (Cons!30638 (h!31847 (_ BitVec 64)) (t!44588 List!30642)) )
))
(declare-fun arrayNoDuplicates!0 (array!89498 (_ BitVec 32) List!30642) Bool)

(assert (=> b!1325593 (= res!879777 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30639))))

(declare-fun b!1325594 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53497 0))(
  ( (V!53498 (val!18222 Int)) )
))
(declare-datatypes ((ValueCell!17249 0))(
  ( (ValueCellFull!17249 (v!20855 V!53497)) (EmptyCell!17249) )
))
(declare-datatypes ((array!89500 0))(
  ( (array!89501 (arr!43223 (Array (_ BitVec 32) ValueCell!17249)) (size!43773 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89500)

(assert (=> b!1325594 (= e!755658 (not (bvslt from!2000 (size!43773 _values!1337))))))

(declare-datatypes ((tuple2!23502 0))(
  ( (tuple2!23503 (_1!11762 (_ BitVec 64)) (_2!11762 V!53497)) )
))
(declare-datatypes ((List!30643 0))(
  ( (Nil!30640) (Cons!30639 (h!31848 tuple2!23502) (t!44589 List!30643)) )
))
(declare-datatypes ((ListLongMap!21159 0))(
  ( (ListLongMap!21160 (toList!10595 List!30643)) )
))
(declare-fun lt!589808 () ListLongMap!21159)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8752 (ListLongMap!21159 (_ BitVec 64)) Bool)

(assert (=> b!1325594 (contains!8752 lt!589808 k!1164)))

(declare-fun minValue!1279 () V!53497)

(declare-datatypes ((Unit!43664 0))(
  ( (Unit!43665) )
))
(declare-fun lt!589809 () Unit!43664)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!210 ((_ BitVec 64) (_ BitVec 64) V!53497 ListLongMap!21159) Unit!43664)

(assert (=> b!1325594 (= lt!589809 (lemmaInListMapAfterAddingDiffThenInBefore!210 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589808))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53497)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun +!4618 (ListLongMap!21159 tuple2!23502) ListLongMap!21159)

(declare-fun getCurrentListMapNoExtraKeys!6256 (array!89498 array!89500 (_ BitVec 32) (_ BitVec 32) V!53497 V!53497 (_ BitVec 32) Int) ListLongMap!21159)

(declare-fun get!21771 (ValueCell!17249 V!53497) V!53497)

(declare-fun dynLambda!3557 (Int (_ BitVec 64)) V!53497)

(assert (=> b!1325594 (= lt!589808 (+!4618 (+!4618 (getCurrentListMapNoExtraKeys!6256 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23503 (select (arr!43222 _keys!1609) from!2000) (get!21771 (select (arr!43223 _values!1337) from!2000) (dynLambda!3557 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1325595 () Bool)

(declare-fun e!755659 () Bool)

(declare-fun tp_is_empty!36295 () Bool)

(assert (=> b!1325595 (= e!755659 tp_is_empty!36295)))

(declare-fun b!1325596 () Bool)

(declare-fun res!879781 () Bool)

(assert (=> b!1325596 (=> (not res!879781) (not e!755658))))

(assert (=> b!1325596 (= res!879781 (not (= (select (arr!43222 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1325597 () Bool)

(declare-fun e!755661 () Bool)

(assert (=> b!1325597 (= e!755661 tp_is_empty!36295)))

(declare-fun mapNonEmpty!56094 () Bool)

(declare-fun mapRes!56094 () Bool)

(declare-fun tp!106905 () Bool)

(assert (=> mapNonEmpty!56094 (= mapRes!56094 (and tp!106905 e!755661))))

(declare-fun mapValue!56094 () ValueCell!17249)

(declare-fun mapKey!56094 () (_ BitVec 32))

(declare-fun mapRest!56094 () (Array (_ BitVec 32) ValueCell!17249))

(assert (=> mapNonEmpty!56094 (= (arr!43223 _values!1337) (store mapRest!56094 mapKey!56094 mapValue!56094))))

(declare-fun b!1325598 () Bool)

(declare-fun res!879783 () Bool)

(assert (=> b!1325598 (=> (not res!879783) (not e!755658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325598 (= res!879783 (validKeyInArray!0 (select (arr!43222 _keys!1609) from!2000)))))

(declare-fun b!1325599 () Bool)

(declare-fun res!879779 () Bool)

(assert (=> b!1325599 (=> (not res!879779) (not e!755658))))

(assert (=> b!1325599 (= res!879779 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43772 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325600 () Bool)

(declare-fun res!879782 () Bool)

(assert (=> b!1325600 (=> (not res!879782) (not e!755658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89498 (_ BitVec 32)) Bool)

(assert (=> b!1325600 (= res!879782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325601 () Bool)

(declare-fun e!755662 () Bool)

(assert (=> b!1325601 (= e!755662 (and e!755659 mapRes!56094))))

(declare-fun condMapEmpty!56094 () Bool)

(declare-fun mapDefault!56094 () ValueCell!17249)

