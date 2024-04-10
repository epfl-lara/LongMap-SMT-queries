; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110510 () Bool)

(assert start!110510)

(declare-fun b_free!29345 () Bool)

(declare-fun b_next!29345 () Bool)

(assert (=> start!110510 (= b_free!29345 (not b_next!29345))))

(declare-fun tp!103356 () Bool)

(declare-fun b_and!47553 () Bool)

(assert (=> start!110510 (= tp!103356 b_and!47553)))

(declare-fun b!1307279 () Bool)

(declare-fun res!867772 () Bool)

(declare-fun e!745951 () Bool)

(assert (=> b!1307279 (=> (not res!867772) (not e!745951))))

(declare-datatypes ((array!87154 0))(
  ( (array!87155 (arr!42057 (Array (_ BitVec 32) (_ BitVec 64))) (size!42607 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87154)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87154 (_ BitVec 32)) Bool)

(assert (=> b!1307279 (= res!867772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!867770 () Bool)

(assert (=> start!110510 (=> (not res!867770) (not e!745951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110510 (= res!867770 (validMask!0 mask!2040))))

(assert (=> start!110510 e!745951))

(assert (=> start!110510 tp!103356))

(declare-fun array_inv!31793 (array!87154) Bool)

(assert (=> start!110510 (array_inv!31793 _keys!1628)))

(assert (=> start!110510 true))

(declare-fun tp_is_empty!35075 () Bool)

(assert (=> start!110510 tp_is_empty!35075))

(declare-datatypes ((V!51869 0))(
  ( (V!51870 (val!17612 Int)) )
))
(declare-datatypes ((ValueCell!16639 0))(
  ( (ValueCellFull!16639 (v!20239 V!51869)) (EmptyCell!16639) )
))
(declare-datatypes ((array!87156 0))(
  ( (array!87157 (arr!42058 (Array (_ BitVec 32) ValueCell!16639)) (size!42608 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87156)

(declare-fun e!745948 () Bool)

(declare-fun array_inv!31794 (array!87156) Bool)

(assert (=> start!110510 (and (array_inv!31794 _values!1354) e!745948)))

(declare-fun b!1307280 () Bool)

(declare-fun e!745952 () Bool)

(assert (=> b!1307280 (= e!745952 tp_is_empty!35075)))

(declare-fun b!1307281 () Bool)

(declare-fun res!867773 () Bool)

(assert (=> b!1307281 (=> (not res!867773) (not e!745951))))

(declare-datatypes ((List!29818 0))(
  ( (Nil!29815) (Cons!29814 (h!31023 (_ BitVec 64)) (t!43424 List!29818)) )
))
(declare-fun arrayNoDuplicates!0 (array!87154 (_ BitVec 32) List!29818) Bool)

(assert (=> b!1307281 (= res!867773 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29815))))

(declare-fun mapNonEmpty!54241 () Bool)

(declare-fun mapRes!54241 () Bool)

(declare-fun tp!103357 () Bool)

(declare-fun e!745949 () Bool)

(assert (=> mapNonEmpty!54241 (= mapRes!54241 (and tp!103357 e!745949))))

(declare-fun mapKey!54241 () (_ BitVec 32))

(declare-fun mapValue!54241 () ValueCell!16639)

(declare-fun mapRest!54241 () (Array (_ BitVec 32) ValueCell!16639))

(assert (=> mapNonEmpty!54241 (= (arr!42058 _values!1354) (store mapRest!54241 mapKey!54241 mapValue!54241))))

(declare-fun b!1307282 () Bool)

(assert (=> b!1307282 (= e!745951 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585036 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51869)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!51869)

(declare-datatypes ((tuple2!22678 0))(
  ( (tuple2!22679 (_1!11350 (_ BitVec 64)) (_2!11350 V!51869)) )
))
(declare-datatypes ((List!29819 0))(
  ( (Nil!29816) (Cons!29815 (h!31024 tuple2!22678) (t!43425 List!29819)) )
))
(declare-datatypes ((ListLongMap!20335 0))(
  ( (ListLongMap!20336 (toList!10183 List!29819)) )
))
(declare-fun contains!8333 (ListLongMap!20335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5196 (array!87154 array!87156 (_ BitVec 32) (_ BitVec 32) V!51869 V!51869 (_ BitVec 32) Int) ListLongMap!20335)

(assert (=> b!1307282 (= lt!585036 (contains!8333 (getCurrentListMap!5196 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1307283 () Bool)

(assert (=> b!1307283 (= e!745949 tp_is_empty!35075)))

(declare-fun mapIsEmpty!54241 () Bool)

(assert (=> mapIsEmpty!54241 mapRes!54241))

(declare-fun b!1307284 () Bool)

(declare-fun res!867774 () Bool)

(assert (=> b!1307284 (=> (not res!867774) (not e!745951))))

(assert (=> b!1307284 (= res!867774 (and (= (size!42608 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42607 _keys!1628) (size!42608 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307285 () Bool)

(assert (=> b!1307285 (= e!745948 (and e!745952 mapRes!54241))))

(declare-fun condMapEmpty!54241 () Bool)

(declare-fun mapDefault!54241 () ValueCell!16639)

