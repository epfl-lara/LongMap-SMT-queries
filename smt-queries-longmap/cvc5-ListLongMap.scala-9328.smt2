; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111404 () Bool)

(assert start!111404)

(declare-fun b_free!30061 () Bool)

(declare-fun b_next!30061 () Bool)

(assert (=> start!111404 (= b_free!30061 (not b_next!30061))))

(declare-fun tp!105658 () Bool)

(declare-fun b_and!48281 () Bool)

(assert (=> start!111404 (= tp!105658 b_and!48281)))

(declare-fun b!1318285 () Bool)

(declare-fun res!874912 () Bool)

(declare-fun e!752296 () Bool)

(assert (=> b!1318285 (=> (not res!874912) (not e!752296))))

(declare-datatypes ((array!88708 0))(
  ( (array!88709 (arr!42828 (Array (_ BitVec 32) (_ BitVec 64))) (size!43378 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88708)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52945 0))(
  ( (V!52946 (val!18015 Int)) )
))
(declare-fun zeroValue!1279 () V!52945)

(declare-datatypes ((ValueCell!17042 0))(
  ( (ValueCellFull!17042 (v!20645 V!52945)) (EmptyCell!17042) )
))
(declare-datatypes ((array!88710 0))(
  ( (array!88711 (arr!42829 (Array (_ BitVec 32) ValueCell!17042)) (size!43379 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88710)

(declare-fun minValue!1279 () V!52945)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23184 0))(
  ( (tuple2!23185 (_1!11603 (_ BitVec 64)) (_2!11603 V!52945)) )
))
(declare-datatypes ((List!30340 0))(
  ( (Nil!30337) (Cons!30336 (h!31545 tuple2!23184) (t!43950 List!30340)) )
))
(declare-datatypes ((ListLongMap!20841 0))(
  ( (ListLongMap!20842 (toList!10436 List!30340)) )
))
(declare-fun contains!8591 (ListLongMap!20841 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5449 (array!88708 array!88710 (_ BitVec 32) (_ BitVec 32) V!52945 V!52945 (_ BitVec 32) Int) ListLongMap!20841)

(assert (=> b!1318285 (= res!874912 (contains!8591 (getCurrentListMap!5449 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1318286 () Bool)

(declare-fun res!874914 () Bool)

(assert (=> b!1318286 (=> (not res!874914) (not e!752296))))

(assert (=> b!1318286 (= res!874914 (not (= (select (arr!42828 _keys!1609) from!2000) k!1164)))))

(declare-fun mapNonEmpty!55469 () Bool)

(declare-fun mapRes!55469 () Bool)

(declare-fun tp!105659 () Bool)

(declare-fun e!752297 () Bool)

(assert (=> mapNonEmpty!55469 (= mapRes!55469 (and tp!105659 e!752297))))

(declare-fun mapRest!55469 () (Array (_ BitVec 32) ValueCell!17042))

(declare-fun mapKey!55469 () (_ BitVec 32))

(declare-fun mapValue!55469 () ValueCell!17042)

(assert (=> mapNonEmpty!55469 (= (arr!42829 _values!1337) (store mapRest!55469 mapKey!55469 mapValue!55469))))

(declare-fun b!1318287 () Bool)

(assert (=> b!1318287 (= e!752296 false)))

(declare-fun lt!586458 () Bool)

(declare-fun +!4497 (ListLongMap!20841 tuple2!23184) ListLongMap!20841)

(declare-fun getCurrentListMapNoExtraKeys!6132 (array!88708 array!88710 (_ BitVec 32) (_ BitVec 32) V!52945 V!52945 (_ BitVec 32) Int) ListLongMap!20841)

(declare-fun get!21509 (ValueCell!17042 V!52945) V!52945)

(declare-fun dynLambda!3436 (Int (_ BitVec 64)) V!52945)

(assert (=> b!1318287 (= lt!586458 (contains!8591 (+!4497 (+!4497 (+!4497 (getCurrentListMapNoExtraKeys!6132 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23185 (select (arr!42828 _keys!1609) from!2000) (get!21509 (select (arr!42829 _values!1337) from!2000) (dynLambda!3436 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23185 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23185 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k!1164))))

(declare-fun mapIsEmpty!55469 () Bool)

(assert (=> mapIsEmpty!55469 mapRes!55469))

(declare-fun b!1318288 () Bool)

(declare-fun res!874915 () Bool)

(assert (=> b!1318288 (=> (not res!874915) (not e!752296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88708 (_ BitVec 32)) Bool)

(assert (=> b!1318288 (= res!874915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318289 () Bool)

(declare-fun e!752298 () Bool)

(declare-fun e!752299 () Bool)

(assert (=> b!1318289 (= e!752298 (and e!752299 mapRes!55469))))

(declare-fun condMapEmpty!55469 () Bool)

(declare-fun mapDefault!55469 () ValueCell!17042)

