; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111452 () Bool)

(assert start!111452)

(declare-fun b_free!30109 () Bool)

(declare-fun b_next!30109 () Bool)

(assert (=> start!111452 (= b_free!30109 (not b_next!30109))))

(declare-fun tp!105802 () Bool)

(declare-fun b_and!48377 () Bool)

(assert (=> start!111452 (= tp!105802 b_and!48377)))

(declare-fun b!1319125 () Bool)

(declare-fun res!875488 () Bool)

(declare-fun e!752659 () Bool)

(assert (=> b!1319125 (=> (not res!875488) (not e!752659))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(declare-datatypes ((array!88796 0))(
  ( (array!88797 (arr!42872 (Array (_ BitVec 32) (_ BitVec 64))) (size!43422 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88796)

(assert (=> b!1319125 (= res!875488 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43422 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319126 () Bool)

(assert (=> b!1319126 (= e!752659 (not true))))

(declare-datatypes ((V!53009 0))(
  ( (V!53010 (val!18039 Int)) )
))
(declare-datatypes ((tuple2!23212 0))(
  ( (tuple2!23213 (_1!11617 (_ BitVec 64)) (_2!11617 V!53009)) )
))
(declare-datatypes ((List!30367 0))(
  ( (Nil!30364) (Cons!30363 (h!31572 tuple2!23212) (t!44025 List!30367)) )
))
(declare-datatypes ((ListLongMap!20869 0))(
  ( (ListLongMap!20870 (toList!10450 List!30367)) )
))
(declare-fun lt!586586 () ListLongMap!20869)

(declare-fun contains!8605 (ListLongMap!20869 (_ BitVec 64)) Bool)

(assert (=> b!1319126 (contains!8605 lt!586586 k!1164)))

(declare-datatypes ((Unit!43442 0))(
  ( (Unit!43443) )
))
(declare-fun lt!586587 () Unit!43442)

(declare-fun minValue!1279 () V!53009)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!107 ((_ BitVec 64) (_ BitVec 64) V!53009 ListLongMap!20869) Unit!43442)

(assert (=> b!1319126 (= lt!586587 (lemmaInListMapAfterAddingDiffThenInBefore!107 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586586))))

(declare-fun zeroValue!1279 () V!53009)

(declare-datatypes ((ValueCell!17066 0))(
  ( (ValueCellFull!17066 (v!20669 V!53009)) (EmptyCell!17066) )
))
(declare-datatypes ((array!88798 0))(
  ( (array!88799 (arr!42873 (Array (_ BitVec 32) ValueCell!17066)) (size!43423 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88798)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun +!4511 (ListLongMap!20869 tuple2!23212) ListLongMap!20869)

(declare-fun getCurrentListMapNoExtraKeys!6146 (array!88796 array!88798 (_ BitVec 32) (_ BitVec 32) V!53009 V!53009 (_ BitVec 32) Int) ListLongMap!20869)

(declare-fun get!21539 (ValueCell!17066 V!53009) V!53009)

(declare-fun dynLambda!3450 (Int (_ BitVec 64)) V!53009)

(assert (=> b!1319126 (= lt!586586 (+!4511 (+!4511 (getCurrentListMapNoExtraKeys!6146 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23213 (select (arr!42872 _keys!1609) from!2000) (get!21539 (select (arr!42873 _values!1337) from!2000) (dynLambda!3450 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319127 () Bool)

(declare-fun e!752657 () Bool)

(declare-fun e!752656 () Bool)

(declare-fun mapRes!55541 () Bool)

(assert (=> b!1319127 (= e!752657 (and e!752656 mapRes!55541))))

(declare-fun condMapEmpty!55541 () Bool)

(declare-fun mapDefault!55541 () ValueCell!17066)

