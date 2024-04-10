; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110734 () Bool)

(assert start!110734)

(declare-fun b_free!29569 () Bool)

(declare-fun b_next!29569 () Bool)

(assert (=> start!110734 (= b_free!29569 (not b_next!29569))))

(declare-fun tp!104028 () Bool)

(declare-fun b_and!47777 () Bool)

(assert (=> start!110734 (= tp!104028 b_and!47777)))

(declare-fun b!1310587 () Bool)

(declare-fun res!870075 () Bool)

(declare-fun e!747629 () Bool)

(assert (=> b!1310587 (=> (not res!870075) (not e!747629))))

(declare-datatypes ((array!87586 0))(
  ( (array!87587 (arr!42273 (Array (_ BitVec 32) (_ BitVec 64))) (size!42823 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87586)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310587 (= res!870075 (validKeyInArray!0 (select (arr!42273 _keys!1628) from!2020)))))

(declare-fun b!1310588 () Bool)

(declare-fun res!870077 () Bool)

(assert (=> b!1310588 (=> (not res!870077) (not e!747629))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310588 (= res!870077 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310590 () Bool)

(declare-fun res!870073 () Bool)

(assert (=> b!1310590 (=> (not res!870073) (not e!747629))))

(declare-datatypes ((List!29975 0))(
  ( (Nil!29972) (Cons!29971 (h!31180 (_ BitVec 64)) (t!43581 List!29975)) )
))
(declare-fun arrayNoDuplicates!0 (array!87586 (_ BitVec 32) List!29975) Bool)

(assert (=> b!1310590 (= res!870073 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29972))))

(declare-fun b!1310591 () Bool)

(assert (=> b!1310591 (= e!747629 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52169 0))(
  ( (V!52170 (val!17724 Int)) )
))
(declare-fun minValue!1296 () V!52169)

(declare-datatypes ((ValueCell!16751 0))(
  ( (ValueCellFull!16751 (v!20351 V!52169)) (EmptyCell!16751) )
))
(declare-datatypes ((array!87588 0))(
  ( (array!87589 (arr!42274 (Array (_ BitVec 32) ValueCell!16751)) (size!42824 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87588)

(declare-fun zeroValue!1296 () V!52169)

(declare-datatypes ((tuple2!22836 0))(
  ( (tuple2!22837 (_1!11429 (_ BitVec 64)) (_2!11429 V!52169)) )
))
(declare-datatypes ((List!29976 0))(
  ( (Nil!29973) (Cons!29972 (h!31181 tuple2!22836) (t!43582 List!29976)) )
))
(declare-datatypes ((ListLongMap!20493 0))(
  ( (ListLongMap!20494 (toList!10262 List!29976)) )
))
(declare-fun contains!8412 (ListLongMap!20493 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5275 (array!87586 array!87588 (_ BitVec 32) (_ BitVec 32) V!52169 V!52169 (_ BitVec 32) Int) ListLongMap!20493)

(assert (=> b!1310591 (contains!8412 (getCurrentListMap!5275 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43342 0))(
  ( (Unit!43343) )
))
(declare-fun lt!585372 () Unit!43342)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!17 (array!87586 array!87588 (_ BitVec 32) (_ BitVec 32) V!52169 V!52169 (_ BitVec 64) (_ BitVec 32) Int) Unit!43342)

(assert (=> b!1310591 (= lt!585372 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!17 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310592 () Bool)

(declare-fun res!870078 () Bool)

(assert (=> b!1310592 (=> (not res!870078) (not e!747629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87586 (_ BitVec 32)) Bool)

(assert (=> b!1310592 (= res!870078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310593 () Bool)

(declare-fun res!870071 () Bool)

(assert (=> b!1310593 (=> (not res!870071) (not e!747629))))

(assert (=> b!1310593 (= res!870071 (contains!8412 (getCurrentListMap!5275 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1310594 () Bool)

(declare-fun e!747632 () Bool)

(declare-fun e!747628 () Bool)

(declare-fun mapRes!54577 () Bool)

(assert (=> b!1310594 (= e!747632 (and e!747628 mapRes!54577))))

(declare-fun condMapEmpty!54577 () Bool)

(declare-fun mapDefault!54577 () ValueCell!16751)

