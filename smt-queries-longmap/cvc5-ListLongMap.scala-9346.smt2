; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111512 () Bool)

(assert start!111512)

(declare-fun b_free!30169 () Bool)

(declare-fun b_next!30169 () Bool)

(assert (=> start!111512 (= b_free!30169 (not b_next!30169))))

(declare-fun tp!105983 () Bool)

(declare-fun b_and!48497 () Bool)

(assert (=> start!111512 (= tp!105983 b_and!48497)))

(declare-fun b!1320176 () Bool)

(declare-fun e!753107 () Bool)

(assert (=> b!1320176 (= e!753107 (not true))))

(declare-datatypes ((V!53089 0))(
  ( (V!53090 (val!18069 Int)) )
))
(declare-datatypes ((tuple2!23262 0))(
  ( (tuple2!23263 (_1!11642 (_ BitVec 64)) (_2!11642 V!53089)) )
))
(declare-datatypes ((List!30414 0))(
  ( (Nil!30411) (Cons!30410 (h!31619 tuple2!23262) (t!44132 List!30414)) )
))
(declare-datatypes ((ListLongMap!20919 0))(
  ( (ListLongMap!20920 (toList!10475 List!30414)) )
))
(declare-fun lt!586863 () ListLongMap!20919)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8630 (ListLongMap!20919 (_ BitVec 64)) Bool)

(assert (=> b!1320176 (contains!8630 lt!586863 k!1164)))

(declare-fun zeroValue!1279 () V!53089)

(declare-datatypes ((Unit!43488 0))(
  ( (Unit!43489) )
))
(declare-fun lt!586861 () Unit!43488)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!130 ((_ BitVec 64) (_ BitVec 64) V!53089 ListLongMap!20919) Unit!43488)

(assert (=> b!1320176 (= lt!586861 (lemmaInListMapAfterAddingDiffThenInBefore!130 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586863))))

(declare-fun lt!586860 () ListLongMap!20919)

(assert (=> b!1320176 (contains!8630 lt!586860 k!1164)))

(declare-fun lt!586862 () Unit!43488)

(declare-fun minValue!1279 () V!53089)

(assert (=> b!1320176 (= lt!586862 (lemmaInListMapAfterAddingDiffThenInBefore!130 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586860))))

(declare-fun +!4534 (ListLongMap!20919 tuple2!23262) ListLongMap!20919)

(assert (=> b!1320176 (= lt!586860 (+!4534 lt!586863 (tuple2!23263 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((array!88908 0))(
  ( (array!88909 (arr!42928 (Array (_ BitVec 32) (_ BitVec 64))) (size!43478 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88908)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((ValueCell!17096 0))(
  ( (ValueCellFull!17096 (v!20699 V!53089)) (EmptyCell!17096) )
))
(declare-datatypes ((array!88910 0))(
  ( (array!88911 (arr!42929 (Array (_ BitVec 32) ValueCell!17096)) (size!43479 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88910)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6169 (array!88908 array!88910 (_ BitVec 32) (_ BitVec 32) V!53089 V!53089 (_ BitVec 32) Int) ListLongMap!20919)

(declare-fun get!21582 (ValueCell!17096 V!53089) V!53089)

(declare-fun dynLambda!3473 (Int (_ BitVec 64)) V!53089)

(assert (=> b!1320176 (= lt!586863 (+!4534 (getCurrentListMapNoExtraKeys!6169 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23263 (select (arr!42928 _keys!1609) from!2000) (get!21582 (select (arr!42929 _values!1337) from!2000) (dynLambda!3473 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320177 () Bool)

(declare-fun res!876209 () Bool)

(assert (=> b!1320177 (=> (not res!876209) (not e!753107))))

(assert (=> b!1320177 (= res!876209 (not (= (select (arr!42928 _keys!1609) from!2000) k!1164)))))

(declare-fun mapIsEmpty!55631 () Bool)

(declare-fun mapRes!55631 () Bool)

(assert (=> mapIsEmpty!55631 mapRes!55631))

(declare-fun b!1320178 () Bool)

(declare-fun res!876212 () Bool)

(assert (=> b!1320178 (=> (not res!876212) (not e!753107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88908 (_ BitVec 32)) Bool)

(assert (=> b!1320178 (= res!876212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320179 () Bool)

(declare-fun e!753108 () Bool)

(declare-fun tp_is_empty!35989 () Bool)

(assert (=> b!1320179 (= e!753108 tp_is_empty!35989)))

(declare-fun b!1320180 () Bool)

(declare-fun e!753109 () Bool)

(assert (=> b!1320180 (= e!753109 (and e!753108 mapRes!55631))))

(declare-fun condMapEmpty!55631 () Bool)

(declare-fun mapDefault!55631 () ValueCell!17096)

