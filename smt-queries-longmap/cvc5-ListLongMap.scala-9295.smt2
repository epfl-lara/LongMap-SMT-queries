; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111118 () Bool)

(assert start!111118)

(declare-fun b_free!29953 () Bool)

(declare-fun b_next!29953 () Bool)

(assert (=> start!111118 (= b_free!29953 (not b_next!29953))))

(declare-fun tp!105180 () Bool)

(declare-fun b_and!48161 () Bool)

(assert (=> start!111118 (= tp!105180 b_and!48161)))

(declare-fun b!1315646 () Bool)

(declare-fun res!873402 () Bool)

(declare-fun e!750512 () Bool)

(assert (=> b!1315646 (=> (not res!873402) (not e!750512))))

(declare-datatypes ((array!88328 0))(
  ( (array!88329 (arr!42644 (Array (_ BitVec 32) (_ BitVec 64))) (size!43194 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88328)

(declare-datatypes ((List!30251 0))(
  ( (Nil!30248) (Cons!30247 (h!31456 (_ BitVec 64)) (t!43857 List!30251)) )
))
(declare-fun arrayNoDuplicates!0 (array!88328 (_ BitVec 32) List!30251) Bool)

(assert (=> b!1315646 (= res!873402 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30248))))

(declare-fun mapNonEmpty!55153 () Bool)

(declare-fun mapRes!55153 () Bool)

(declare-fun tp!105181 () Bool)

(declare-fun e!750508 () Bool)

(assert (=> mapNonEmpty!55153 (= mapRes!55153 (and tp!105181 e!750508))))

(declare-datatypes ((V!52681 0))(
  ( (V!52682 (val!17916 Int)) )
))
(declare-datatypes ((ValueCell!16943 0))(
  ( (ValueCellFull!16943 (v!20543 V!52681)) (EmptyCell!16943) )
))
(declare-fun mapValue!55153 () ValueCell!16943)

(declare-datatypes ((array!88330 0))(
  ( (array!88331 (arr!42645 (Array (_ BitVec 32) ValueCell!16943)) (size!43195 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88330)

(declare-fun mapKey!55153 () (_ BitVec 32))

(declare-fun mapRest!55153 () (Array (_ BitVec 32) ValueCell!16943))

(assert (=> mapNonEmpty!55153 (= (arr!42645 _values!1354) (store mapRest!55153 mapKey!55153 mapValue!55153))))

(declare-fun b!1315647 () Bool)

(assert (=> b!1315647 (= e!750512 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52681)

(declare-fun zeroValue!1296 () V!52681)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun lt!585939 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((tuple2!23116 0))(
  ( (tuple2!23117 (_1!11569 (_ BitVec 64)) (_2!11569 V!52681)) )
))
(declare-datatypes ((List!30252 0))(
  ( (Nil!30249) (Cons!30248 (h!31457 tuple2!23116) (t!43858 List!30252)) )
))
(declare-datatypes ((ListLongMap!20773 0))(
  ( (ListLongMap!20774 (toList!10402 List!30252)) )
))
(declare-fun contains!8552 (ListLongMap!20773 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5415 (array!88328 array!88330 (_ BitVec 32) (_ BitVec 32) V!52681 V!52681 (_ BitVec 32) Int) ListLongMap!20773)

(assert (=> b!1315647 (= lt!585939 (contains!8552 (getCurrentListMap!5415 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1315648 () Bool)

(declare-fun e!750510 () Bool)

(declare-fun e!750511 () Bool)

(assert (=> b!1315648 (= e!750510 (and e!750511 mapRes!55153))))

(declare-fun condMapEmpty!55153 () Bool)

(declare-fun mapDefault!55153 () ValueCell!16943)

