; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110576 () Bool)

(assert start!110576)

(declare-fun b_free!29411 () Bool)

(declare-fun b_next!29411 () Bool)

(assert (=> start!110576 (= b_free!29411 (not b_next!29411))))

(declare-fun tp!103554 () Bool)

(declare-fun b_and!47619 () Bool)

(assert (=> start!110576 (= tp!103554 b_and!47619)))

(declare-fun b!1308175 () Bool)

(declare-fun res!868374 () Bool)

(declare-fun e!746444 () Bool)

(assert (=> b!1308175 (=> (not res!868374) (not e!746444))))

(declare-datatypes ((array!87280 0))(
  ( (array!87281 (arr!42120 (Array (_ BitVec 32) (_ BitVec 64))) (size!42670 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87280)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308175 (= res!868374 (validKeyInArray!0 (select (arr!42120 _keys!1628) from!2020)))))

(declare-fun b!1308176 () Bool)

(declare-fun e!746445 () Bool)

(declare-fun tp_is_empty!35141 () Bool)

(assert (=> b!1308176 (= e!746445 tp_is_empty!35141)))

(declare-fun b!1308177 () Bool)

(declare-fun res!868376 () Bool)

(assert (=> b!1308177 (=> (not res!868376) (not e!746444))))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1308177 (= res!868376 (not (= (select (arr!42120 _keys!1628) from!2020) k!1175)))))

(declare-fun res!868372 () Bool)

(assert (=> start!110576 (=> (not res!868372) (not e!746444))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110576 (= res!868372 (validMask!0 mask!2040))))

(assert (=> start!110576 e!746444))

(assert (=> start!110576 tp!103554))

(declare-fun array_inv!31833 (array!87280) Bool)

(assert (=> start!110576 (array_inv!31833 _keys!1628)))

(assert (=> start!110576 true))

(assert (=> start!110576 tp_is_empty!35141))

(declare-datatypes ((V!51957 0))(
  ( (V!51958 (val!17645 Int)) )
))
(declare-datatypes ((ValueCell!16672 0))(
  ( (ValueCellFull!16672 (v!20272 V!51957)) (EmptyCell!16672) )
))
(declare-datatypes ((array!87282 0))(
  ( (array!87283 (arr!42121 (Array (_ BitVec 32) ValueCell!16672)) (size!42671 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87282)

(declare-fun e!746446 () Bool)

(declare-fun array_inv!31834 (array!87282) Bool)

(assert (=> start!110576 (and (array_inv!31834 _values!1354) e!746446)))

(declare-fun b!1308178 () Bool)

(declare-fun e!746447 () Bool)

(assert (=> b!1308178 (= e!746447 tp_is_empty!35141)))

(declare-fun b!1308179 () Bool)

(assert (=> b!1308179 (= e!746444 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun zeroValue!1296 () V!51957)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun minValue!1296 () V!51957)

(declare-datatypes ((tuple2!22720 0))(
  ( (tuple2!22721 (_1!11371 (_ BitVec 64)) (_2!11371 V!51957)) )
))
(declare-datatypes ((List!29861 0))(
  ( (Nil!29858) (Cons!29857 (h!31066 tuple2!22720) (t!43467 List!29861)) )
))
(declare-datatypes ((ListLongMap!20377 0))(
  ( (ListLongMap!20378 (toList!10204 List!29861)) )
))
(declare-fun contains!8354 (ListLongMap!20377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5217 (array!87280 array!87282 (_ BitVec 32) (_ BitVec 32) V!51957 V!51957 (_ BitVec 32) Int) ListLongMap!20377)

(assert (=> b!1308179 (contains!8354 (getCurrentListMap!5217 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43288 0))(
  ( (Unit!43289) )
))
(declare-fun lt!585135 () Unit!43288)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!8 (array!87280 array!87282 (_ BitVec 32) (_ BitVec 32) V!51957 V!51957 (_ BitVec 64) (_ BitVec 32) Int) Unit!43288)

(assert (=> b!1308179 (= lt!585135 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!8 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308180 () Bool)

(declare-fun res!868369 () Bool)

(assert (=> b!1308180 (=> (not res!868369) (not e!746444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87280 (_ BitVec 32)) Bool)

(assert (=> b!1308180 (= res!868369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308181 () Bool)

(declare-fun res!868377 () Bool)

(assert (=> b!1308181 (=> (not res!868377) (not e!746444))))

(declare-datatypes ((List!29862 0))(
  ( (Nil!29859) (Cons!29858 (h!31067 (_ BitVec 64)) (t!43468 List!29862)) )
))
(declare-fun arrayNoDuplicates!0 (array!87280 (_ BitVec 32) List!29862) Bool)

(assert (=> b!1308181 (= res!868377 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29859))))

(declare-fun b!1308182 () Bool)

(declare-fun res!868370 () Bool)

(assert (=> b!1308182 (=> (not res!868370) (not e!746444))))

(assert (=> b!1308182 (= res!868370 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42670 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54340 () Bool)

(declare-fun mapRes!54340 () Bool)

(declare-fun tp!103555 () Bool)

(assert (=> mapNonEmpty!54340 (= mapRes!54340 (and tp!103555 e!746445))))

(declare-fun mapKey!54340 () (_ BitVec 32))

(declare-fun mapValue!54340 () ValueCell!16672)

(declare-fun mapRest!54340 () (Array (_ BitVec 32) ValueCell!16672))

(assert (=> mapNonEmpty!54340 (= (arr!42121 _values!1354) (store mapRest!54340 mapKey!54340 mapValue!54340))))

(declare-fun b!1308183 () Bool)

(declare-fun res!868373 () Bool)

(assert (=> b!1308183 (=> (not res!868373) (not e!746444))))

(assert (=> b!1308183 (= res!868373 (contains!8354 (getCurrentListMap!5217 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1308184 () Bool)

(declare-fun res!868375 () Bool)

(assert (=> b!1308184 (=> (not res!868375) (not e!746444))))

(assert (=> b!1308184 (= res!868375 (and (= (size!42671 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42670 _keys!1628) (size!42671 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308185 () Bool)

(declare-fun res!868371 () Bool)

(assert (=> b!1308185 (=> (not res!868371) (not e!746444))))

(assert (=> b!1308185 (= res!868371 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308186 () Bool)

(assert (=> b!1308186 (= e!746446 (and e!746447 mapRes!54340))))

(declare-fun condMapEmpty!54340 () Bool)

(declare-fun mapDefault!54340 () ValueCell!16672)

