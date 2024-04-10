; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110564 () Bool)

(assert start!110564)

(declare-fun b_free!29399 () Bool)

(declare-fun b_next!29399 () Bool)

(assert (=> start!110564 (= b_free!29399 (not b_next!29399))))

(declare-fun tp!103519 () Bool)

(declare-fun b_and!47607 () Bool)

(assert (=> start!110564 (= tp!103519 b_and!47607)))

(declare-fun b!1307959 () Bool)

(declare-fun res!868209 () Bool)

(declare-fun e!746353 () Bool)

(assert (=> b!1307959 (=> (not res!868209) (not e!746353))))

(declare-datatypes ((array!87258 0))(
  ( (array!87259 (arr!42109 (Array (_ BitVec 32) (_ BitVec 64))) (size!42659 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87258)

(declare-datatypes ((List!29852 0))(
  ( (Nil!29849) (Cons!29848 (h!31057 (_ BitVec 64)) (t!43458 List!29852)) )
))
(declare-fun arrayNoDuplicates!0 (array!87258 (_ BitVec 32) List!29852) Bool)

(assert (=> b!1307959 (= res!868209 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29849))))

(declare-fun b!1307960 () Bool)

(declare-fun res!868215 () Bool)

(assert (=> b!1307960 (=> (not res!868215) (not e!746353))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307960 (= res!868215 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42659 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!868212 () Bool)

(assert (=> start!110564 (=> (not res!868212) (not e!746353))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110564 (= res!868212 (validMask!0 mask!2040))))

(assert (=> start!110564 e!746353))

(assert (=> start!110564 tp!103519))

(declare-fun array_inv!31825 (array!87258) Bool)

(assert (=> start!110564 (array_inv!31825 _keys!1628)))

(assert (=> start!110564 true))

(declare-fun tp_is_empty!35129 () Bool)

(assert (=> start!110564 tp_is_empty!35129))

(declare-datatypes ((V!51941 0))(
  ( (V!51942 (val!17639 Int)) )
))
(declare-datatypes ((ValueCell!16666 0))(
  ( (ValueCellFull!16666 (v!20266 V!51941)) (EmptyCell!16666) )
))
(declare-datatypes ((array!87260 0))(
  ( (array!87261 (arr!42110 (Array (_ BitVec 32) ValueCell!16666)) (size!42660 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87260)

(declare-fun e!746354 () Bool)

(declare-fun array_inv!31826 (array!87260) Bool)

(assert (=> start!110564 (and (array_inv!31826 _values!1354) e!746354)))

(declare-fun b!1307961 () Bool)

(declare-fun e!746355 () Bool)

(assert (=> b!1307961 (= e!746355 tp_is_empty!35129)))

(declare-fun mapNonEmpty!54322 () Bool)

(declare-fun mapRes!54322 () Bool)

(declare-fun tp!103518 () Bool)

(declare-fun e!746356 () Bool)

(assert (=> mapNonEmpty!54322 (= mapRes!54322 (and tp!103518 e!746356))))

(declare-fun mapKey!54322 () (_ BitVec 32))

(declare-fun mapValue!54322 () ValueCell!16666)

(declare-fun mapRest!54322 () (Array (_ BitVec 32) ValueCell!16666))

(assert (=> mapNonEmpty!54322 (= (arr!42110 _values!1354) (store mapRest!54322 mapKey!54322 mapValue!54322))))

(declare-fun b!1307962 () Bool)

(assert (=> b!1307962 (= e!746353 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51941)

(declare-fun zeroValue!1296 () V!51941)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22710 0))(
  ( (tuple2!22711 (_1!11366 (_ BitVec 64)) (_2!11366 V!51941)) )
))
(declare-datatypes ((List!29853 0))(
  ( (Nil!29850) (Cons!29849 (h!31058 tuple2!22710) (t!43459 List!29853)) )
))
(declare-datatypes ((ListLongMap!20367 0))(
  ( (ListLongMap!20368 (toList!10199 List!29853)) )
))
(declare-fun contains!8349 (ListLongMap!20367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5212 (array!87258 array!87260 (_ BitVec 32) (_ BitVec 32) V!51941 V!51941 (_ BitVec 32) Int) ListLongMap!20367)

(assert (=> b!1307962 (contains!8349 (getCurrentListMap!5212 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43278 0))(
  ( (Unit!43279) )
))
(declare-fun lt!585117 () Unit!43278)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!3 (array!87258 array!87260 (_ BitVec 32) (_ BitVec 32) V!51941 V!51941 (_ BitVec 64) (_ BitVec 32) Int) Unit!43278)

(assert (=> b!1307962 (= lt!585117 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!3 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1307963 () Bool)

(declare-fun res!868210 () Bool)

(assert (=> b!1307963 (=> (not res!868210) (not e!746353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87258 (_ BitVec 32)) Bool)

(assert (=> b!1307963 (= res!868210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54322 () Bool)

(assert (=> mapIsEmpty!54322 mapRes!54322))

(declare-fun b!1307964 () Bool)

(assert (=> b!1307964 (= e!746354 (and e!746355 mapRes!54322))))

(declare-fun condMapEmpty!54322 () Bool)

(declare-fun mapDefault!54322 () ValueCell!16666)

