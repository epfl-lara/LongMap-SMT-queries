; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111522 () Bool)

(assert start!111522)

(declare-fun b_free!30179 () Bool)

(declare-fun b_next!30179 () Bool)

(assert (=> start!111522 (= b_free!30179 (not b_next!30179))))

(declare-fun tp!106013 () Bool)

(declare-fun b_and!48517 () Bool)

(assert (=> start!111522 (= tp!106013 b_and!48517)))

(declare-fun b!1320350 () Bool)

(declare-fun e!753184 () Bool)

(assert (=> b!1320350 (= e!753184 (not true))))

(declare-datatypes ((V!53101 0))(
  ( (V!53102 (val!18074 Int)) )
))
(declare-datatypes ((tuple2!23270 0))(
  ( (tuple2!23271 (_1!11646 (_ BitVec 64)) (_2!11646 V!53101)) )
))
(declare-datatypes ((List!30421 0))(
  ( (Nil!30418) (Cons!30417 (h!31626 tuple2!23270) (t!44149 List!30421)) )
))
(declare-datatypes ((ListLongMap!20927 0))(
  ( (ListLongMap!20928 (toList!10479 List!30421)) )
))
(declare-fun lt!586921 () ListLongMap!20927)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8634 (ListLongMap!20927 (_ BitVec 64)) Bool)

(assert (=> b!1320350 (contains!8634 lt!586921 k!1164)))

(declare-fun zeroValue!1279 () V!53101)

(declare-datatypes ((Unit!43496 0))(
  ( (Unit!43497) )
))
(declare-fun lt!586922 () Unit!43496)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!134 ((_ BitVec 64) (_ BitVec 64) V!53101 ListLongMap!20927) Unit!43496)

(assert (=> b!1320350 (= lt!586922 (lemmaInListMapAfterAddingDiffThenInBefore!134 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586921))))

(declare-fun lt!586920 () ListLongMap!20927)

(assert (=> b!1320350 (contains!8634 lt!586920 k!1164)))

(declare-fun minValue!1279 () V!53101)

(declare-fun lt!586923 () Unit!43496)

(assert (=> b!1320350 (= lt!586923 (lemmaInListMapAfterAddingDiffThenInBefore!134 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586920))))

(declare-fun +!4538 (ListLongMap!20927 tuple2!23270) ListLongMap!20927)

(assert (=> b!1320350 (= lt!586920 (+!4538 lt!586921 (tuple2!23271 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((array!88928 0))(
  ( (array!88929 (arr!42938 (Array (_ BitVec 32) (_ BitVec 64))) (size!43488 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88928)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17101 0))(
  ( (ValueCellFull!17101 (v!20704 V!53101)) (EmptyCell!17101) )
))
(declare-datatypes ((array!88930 0))(
  ( (array!88931 (arr!42939 (Array (_ BitVec 32) ValueCell!17101)) (size!43489 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88930)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6173 (array!88928 array!88930 (_ BitVec 32) (_ BitVec 32) V!53101 V!53101 (_ BitVec 32) Int) ListLongMap!20927)

(declare-fun get!21588 (ValueCell!17101 V!53101) V!53101)

(declare-fun dynLambda!3477 (Int (_ BitVec 64)) V!53101)

(assert (=> b!1320350 (= lt!586921 (+!4538 (getCurrentListMapNoExtraKeys!6173 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23271 (select (arr!42938 _keys!1609) from!2000) (get!21588 (select (arr!42939 _values!1337) from!2000) (dynLambda!3477 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!55646 () Bool)

(declare-fun mapRes!55646 () Bool)

(declare-fun tp!106012 () Bool)

(declare-fun e!753181 () Bool)

(assert (=> mapNonEmpty!55646 (= mapRes!55646 (and tp!106012 e!753181))))

(declare-fun mapRest!55646 () (Array (_ BitVec 32) ValueCell!17101))

(declare-fun mapKey!55646 () (_ BitVec 32))

(declare-fun mapValue!55646 () ValueCell!17101)

(assert (=> mapNonEmpty!55646 (= (arr!42939 _values!1337) (store mapRest!55646 mapKey!55646 mapValue!55646))))

(declare-fun b!1320351 () Bool)

(declare-fun res!876325 () Bool)

(assert (=> b!1320351 (=> (not res!876325) (not e!753184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88928 (_ BitVec 32)) Bool)

(assert (=> b!1320351 (= res!876325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55646 () Bool)

(assert (=> mapIsEmpty!55646 mapRes!55646))

(declare-fun b!1320352 () Bool)

(declare-fun e!753182 () Bool)

(declare-fun e!753183 () Bool)

(assert (=> b!1320352 (= e!753182 (and e!753183 mapRes!55646))))

(declare-fun condMapEmpty!55646 () Bool)

(declare-fun mapDefault!55646 () ValueCell!17101)

