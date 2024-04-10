; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110720 () Bool)

(assert start!110720)

(declare-fun b_free!29555 () Bool)

(declare-fun b_next!29555 () Bool)

(assert (=> start!110720 (= b_free!29555 (not b_next!29555))))

(declare-fun tp!103987 () Bool)

(declare-fun b_and!47763 () Bool)

(assert (=> start!110720 (= tp!103987 b_and!47763)))

(declare-fun b!1310335 () Bool)

(declare-fun e!747526 () Bool)

(declare-fun tp_is_empty!35285 () Bool)

(assert (=> b!1310335 (= e!747526 tp_is_empty!35285)))

(declare-fun mapNonEmpty!54556 () Bool)

(declare-fun mapRes!54556 () Bool)

(declare-fun tp!103986 () Bool)

(assert (=> mapNonEmpty!54556 (= mapRes!54556 (and tp!103986 e!747526))))

(declare-datatypes ((V!52149 0))(
  ( (V!52150 (val!17717 Int)) )
))
(declare-datatypes ((ValueCell!16744 0))(
  ( (ValueCellFull!16744 (v!20344 V!52149)) (EmptyCell!16744) )
))
(declare-fun mapRest!54556 () (Array (_ BitVec 32) ValueCell!16744))

(declare-fun mapValue!54556 () ValueCell!16744)

(declare-datatypes ((array!87558 0))(
  ( (array!87559 (arr!42259 (Array (_ BitVec 32) ValueCell!16744)) (size!42809 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87558)

(declare-fun mapKey!54556 () (_ BitVec 32))

(assert (=> mapNonEmpty!54556 (= (arr!42259 _values!1354) (store mapRest!54556 mapKey!54556 mapValue!54556))))

(declare-fun b!1310336 () Bool)

(declare-fun res!869887 () Bool)

(declare-fun e!747527 () Bool)

(assert (=> b!1310336 (=> (not res!869887) (not e!747527))))

(declare-datatypes ((array!87560 0))(
  ( (array!87561 (arr!42260 (Array (_ BitVec 32) (_ BitVec 64))) (size!42810 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87560)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310336 (= res!869887 (validKeyInArray!0 (select (arr!42260 _keys!1628) from!2020)))))

(declare-fun b!1310337 () Bool)

(declare-fun res!869883 () Bool)

(assert (=> b!1310337 (=> (not res!869883) (not e!747527))))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1310337 (= res!869883 (not (= (select (arr!42260 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1310338 () Bool)

(declare-fun res!869889 () Bool)

(assert (=> b!1310338 (=> (not res!869889) (not e!747527))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52149)

(declare-fun zeroValue!1296 () V!52149)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22824 0))(
  ( (tuple2!22825 (_1!11423 (_ BitVec 64)) (_2!11423 V!52149)) )
))
(declare-datatypes ((List!29962 0))(
  ( (Nil!29959) (Cons!29958 (h!31167 tuple2!22824) (t!43568 List!29962)) )
))
(declare-datatypes ((ListLongMap!20481 0))(
  ( (ListLongMap!20482 (toList!10256 List!29962)) )
))
(declare-fun contains!8406 (ListLongMap!20481 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5269 (array!87560 array!87558 (_ BitVec 32) (_ BitVec 32) V!52149 V!52149 (_ BitVec 32) Int) ListLongMap!20481)

(assert (=> b!1310338 (= res!869889 (contains!8406 (getCurrentListMap!5269 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1310339 () Bool)

(declare-fun res!869888 () Bool)

(assert (=> b!1310339 (=> (not res!869888) (not e!747527))))

(declare-datatypes ((List!29963 0))(
  ( (Nil!29960) (Cons!29959 (h!31168 (_ BitVec 64)) (t!43569 List!29963)) )
))
(declare-fun arrayNoDuplicates!0 (array!87560 (_ BitVec 32) List!29963) Bool)

(assert (=> b!1310339 (= res!869888 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29960))))

(declare-fun res!869881 () Bool)

(assert (=> start!110720 (=> (not res!869881) (not e!747527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110720 (= res!869881 (validMask!0 mask!2040))))

(assert (=> start!110720 e!747527))

(assert (=> start!110720 tp!103987))

(declare-fun array_inv!31933 (array!87560) Bool)

(assert (=> start!110720 (array_inv!31933 _keys!1628)))

(assert (=> start!110720 true))

(assert (=> start!110720 tp_is_empty!35285))

(declare-fun e!747525 () Bool)

(declare-fun array_inv!31934 (array!87558) Bool)

(assert (=> start!110720 (and (array_inv!31934 _values!1354) e!747525)))

(declare-fun b!1310340 () Bool)

(declare-fun res!869885 () Bool)

(assert (=> b!1310340 (=> (not res!869885) (not e!747527))))

(assert (=> b!1310340 (= res!869885 (and (= (size!42809 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42810 _keys!1628) (size!42809 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310341 () Bool)

(assert (=> b!1310341 (= e!747527 (not true))))

(assert (=> b!1310341 (contains!8406 (getCurrentListMap!5269 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43330 0))(
  ( (Unit!43331) )
))
(declare-fun lt!585351 () Unit!43330)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!11 (array!87560 array!87558 (_ BitVec 32) (_ BitVec 32) V!52149 V!52149 (_ BitVec 64) (_ BitVec 32) Int) Unit!43330)

(assert (=> b!1310341 (= lt!585351 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!11 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310342 () Bool)

(declare-fun e!747524 () Bool)

(assert (=> b!1310342 (= e!747525 (and e!747524 mapRes!54556))))

(declare-fun condMapEmpty!54556 () Bool)

(declare-fun mapDefault!54556 () ValueCell!16744)

