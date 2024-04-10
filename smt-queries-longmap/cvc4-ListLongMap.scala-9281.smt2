; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111038 () Bool)

(assert start!111038)

(declare-fun b_free!29873 () Bool)

(declare-fun b_next!29873 () Bool)

(assert (=> start!111038 (= b_free!29873 (not b_next!29873))))

(declare-fun tp!104940 () Bool)

(declare-fun b_and!48081 () Bool)

(assert (=> start!111038 (= tp!104940 b_and!48081)))

(declare-fun b!1314650 () Bool)

(declare-fun e!749909 () Bool)

(declare-fun tp_is_empty!35603 () Bool)

(assert (=> b!1314650 (= e!749909 tp_is_empty!35603)))

(declare-fun mapNonEmpty!55033 () Bool)

(declare-fun mapRes!55033 () Bool)

(declare-fun tp!104941 () Bool)

(declare-fun e!749912 () Bool)

(assert (=> mapNonEmpty!55033 (= mapRes!55033 (and tp!104941 e!749912))))

(declare-fun mapKey!55033 () (_ BitVec 32))

(declare-datatypes ((V!52573 0))(
  ( (V!52574 (val!17876 Int)) )
))
(declare-datatypes ((ValueCell!16903 0))(
  ( (ValueCellFull!16903 (v!20503 V!52573)) (EmptyCell!16903) )
))
(declare-fun mapRest!55033 () (Array (_ BitVec 32) ValueCell!16903))

(declare-datatypes ((array!88174 0))(
  ( (array!88175 (arr!42567 (Array (_ BitVec 32) ValueCell!16903)) (size!43117 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88174)

(declare-fun mapValue!55033 () ValueCell!16903)

(assert (=> mapNonEmpty!55033 (= (arr!42567 _values!1354) (store mapRest!55033 mapKey!55033 mapValue!55033))))

(declare-fun b!1314651 () Bool)

(declare-fun res!872768 () Bool)

(declare-fun e!749910 () Bool)

(assert (=> b!1314651 (=> (not res!872768) (not e!749910))))

(declare-datatypes ((array!88176 0))(
  ( (array!88177 (arr!42568 (Array (_ BitVec 32) (_ BitVec 64))) (size!43118 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88176)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314651 (= res!872768 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43118 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314652 () Bool)

(assert (=> b!1314652 (= e!749912 tp_is_empty!35603)))

(declare-fun b!1314653 () Bool)

(assert (=> b!1314653 (= e!749910 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52573)

(declare-fun zeroValue!1296 () V!52573)

(declare-fun lt!585819 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23052 0))(
  ( (tuple2!23053 (_1!11537 (_ BitVec 64)) (_2!11537 V!52573)) )
))
(declare-datatypes ((List!30189 0))(
  ( (Nil!30186) (Cons!30185 (h!31394 tuple2!23052) (t!43795 List!30189)) )
))
(declare-datatypes ((ListLongMap!20709 0))(
  ( (ListLongMap!20710 (toList!10370 List!30189)) )
))
(declare-fun contains!8520 (ListLongMap!20709 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5383 (array!88176 array!88174 (_ BitVec 32) (_ BitVec 32) V!52573 V!52573 (_ BitVec 32) Int) ListLongMap!20709)

(assert (=> b!1314653 (= lt!585819 (contains!8520 (getCurrentListMap!5383 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1314654 () Bool)

(declare-fun res!872767 () Bool)

(assert (=> b!1314654 (=> (not res!872767) (not e!749910))))

(declare-datatypes ((List!30190 0))(
  ( (Nil!30187) (Cons!30186 (h!31395 (_ BitVec 64)) (t!43796 List!30190)) )
))
(declare-fun arrayNoDuplicates!0 (array!88176 (_ BitVec 32) List!30190) Bool)

(assert (=> b!1314654 (= res!872767 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30187))))

(declare-fun b!1314655 () Bool)

(declare-fun e!749908 () Bool)

(assert (=> b!1314655 (= e!749908 (and e!749909 mapRes!55033))))

(declare-fun condMapEmpty!55033 () Bool)

(declare-fun mapDefault!55033 () ValueCell!16903)

