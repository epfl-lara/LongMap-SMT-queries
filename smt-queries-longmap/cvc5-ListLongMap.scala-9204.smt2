; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110572 () Bool)

(assert start!110572)

(declare-fun b_free!29407 () Bool)

(declare-fun b_next!29407 () Bool)

(assert (=> start!110572 (= b_free!29407 (not b_next!29407))))

(declare-fun tp!103543 () Bool)

(declare-fun b_and!47615 () Bool)

(assert (=> start!110572 (= tp!103543 b_and!47615)))

(declare-fun b!1308103 () Bool)

(declare-fun e!746417 () Bool)

(declare-fun tp_is_empty!35137 () Bool)

(assert (=> b!1308103 (= e!746417 tp_is_empty!35137)))

(declare-fun b!1308104 () Bool)

(declare-fun res!868318 () Bool)

(declare-fun e!746416 () Bool)

(assert (=> b!1308104 (=> (not res!868318) (not e!746416))))

(declare-datatypes ((array!87272 0))(
  ( (array!87273 (arr!42116 (Array (_ BitVec 32) (_ BitVec 64))) (size!42666 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87272)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308104 (= res!868318 (validKeyInArray!0 (select (arr!42116 _keys!1628) from!2020)))))

(declare-fun b!1308105 () Bool)

(assert (=> b!1308105 (= e!746416 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!51953 0))(
  ( (V!51954 (val!17643 Int)) )
))
(declare-fun minValue!1296 () V!51953)

(declare-datatypes ((ValueCell!16670 0))(
  ( (ValueCellFull!16670 (v!20270 V!51953)) (EmptyCell!16670) )
))
(declare-datatypes ((array!87274 0))(
  ( (array!87275 (arr!42117 (Array (_ BitVec 32) ValueCell!16670)) (size!42667 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87274)

(declare-fun zeroValue!1296 () V!51953)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22716 0))(
  ( (tuple2!22717 (_1!11369 (_ BitVec 64)) (_2!11369 V!51953)) )
))
(declare-datatypes ((List!29858 0))(
  ( (Nil!29855) (Cons!29854 (h!31063 tuple2!22716) (t!43464 List!29858)) )
))
(declare-datatypes ((ListLongMap!20373 0))(
  ( (ListLongMap!20374 (toList!10202 List!29858)) )
))
(declare-fun contains!8352 (ListLongMap!20373 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5215 (array!87272 array!87274 (_ BitVec 32) (_ BitVec 32) V!51953 V!51953 (_ BitVec 32) Int) ListLongMap!20373)

(assert (=> b!1308105 (contains!8352 (getCurrentListMap!5215 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43284 0))(
  ( (Unit!43285) )
))
(declare-fun lt!585129 () Unit!43284)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!6 (array!87272 array!87274 (_ BitVec 32) (_ BitVec 32) V!51953 V!51953 (_ BitVec 64) (_ BitVec 32) Int) Unit!43284)

(assert (=> b!1308105 (= lt!585129 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!6 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308106 () Bool)

(declare-fun e!746413 () Bool)

(assert (=> b!1308106 (= e!746413 tp_is_empty!35137)))

(declare-fun b!1308107 () Bool)

(declare-fun res!868317 () Bool)

(assert (=> b!1308107 (=> (not res!868317) (not e!746416))))

(assert (=> b!1308107 (= res!868317 (and (= (size!42667 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42666 _keys!1628) (size!42667 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308108 () Bool)

(declare-fun res!868316 () Bool)

(assert (=> b!1308108 (=> (not res!868316) (not e!746416))))

(assert (=> b!1308108 (= res!868316 (contains!8352 (getCurrentListMap!5215 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1308109 () Bool)

(declare-fun res!868321 () Bool)

(assert (=> b!1308109 (=> (not res!868321) (not e!746416))))

(assert (=> b!1308109 (= res!868321 (not (= (select (arr!42116 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1308110 () Bool)

(declare-fun res!868322 () Bool)

(assert (=> b!1308110 (=> (not res!868322) (not e!746416))))

(assert (=> b!1308110 (= res!868322 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42666 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308111 () Bool)

(declare-fun res!868315 () Bool)

(assert (=> b!1308111 (=> (not res!868315) (not e!746416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87272 (_ BitVec 32)) Bool)

(assert (=> b!1308111 (= res!868315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308112 () Bool)

(declare-fun e!746414 () Bool)

(declare-fun mapRes!54334 () Bool)

(assert (=> b!1308112 (= e!746414 (and e!746417 mapRes!54334))))

(declare-fun condMapEmpty!54334 () Bool)

(declare-fun mapDefault!54334 () ValueCell!16670)

