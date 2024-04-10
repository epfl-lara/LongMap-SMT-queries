; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110554 () Bool)

(assert start!110554)

(declare-fun b_free!29389 () Bool)

(declare-fun b_next!29389 () Bool)

(assert (=> start!110554 (= b_free!29389 (not b_next!29389))))

(declare-fun tp!103489 () Bool)

(declare-fun b_and!47597 () Bool)

(assert (=> start!110554 (= tp!103489 b_and!47597)))

(declare-fun b!1307807 () Bool)

(declare-fun res!868100 () Bool)

(declare-fun e!746281 () Bool)

(assert (=> b!1307807 (=> (not res!868100) (not e!746281))))

(declare-datatypes ((array!87238 0))(
  ( (array!87239 (arr!42099 (Array (_ BitVec 32) (_ BitVec 64))) (size!42649 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87238)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307807 (= res!868100 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42649 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307808 () Bool)

(assert (=> b!1307808 (= e!746281 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51929 0))(
  ( (V!51930 (val!17634 Int)) )
))
(declare-fun minValue!1296 () V!51929)

(declare-datatypes ((ValueCell!16661 0))(
  ( (ValueCellFull!16661 (v!20261 V!51929)) (EmptyCell!16661) )
))
(declare-datatypes ((array!87240 0))(
  ( (array!87241 (arr!42100 (Array (_ BitVec 32) ValueCell!16661)) (size!42650 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87240)

(declare-fun zeroValue!1296 () V!51929)

(declare-fun lt!585102 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22700 0))(
  ( (tuple2!22701 (_1!11361 (_ BitVec 64)) (_2!11361 V!51929)) )
))
(declare-datatypes ((List!29843 0))(
  ( (Nil!29840) (Cons!29839 (h!31048 tuple2!22700) (t!43449 List!29843)) )
))
(declare-datatypes ((ListLongMap!20357 0))(
  ( (ListLongMap!20358 (toList!10194 List!29843)) )
))
(declare-fun contains!8344 (ListLongMap!20357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5207 (array!87238 array!87240 (_ BitVec 32) (_ BitVec 32) V!51929 V!51929 (_ BitVec 32) Int) ListLongMap!20357)

(assert (=> b!1307808 (= lt!585102 (contains!8344 (getCurrentListMap!5207 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1307809 () Bool)

(declare-fun e!746280 () Bool)

(declare-fun tp_is_empty!35119 () Bool)

(assert (=> b!1307809 (= e!746280 tp_is_empty!35119)))

(declare-fun res!868103 () Bool)

(assert (=> start!110554 (=> (not res!868103) (not e!746281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110554 (= res!868103 (validMask!0 mask!2040))))

(assert (=> start!110554 e!746281))

(assert (=> start!110554 tp!103489))

(declare-fun array_inv!31819 (array!87238) Bool)

(assert (=> start!110554 (array_inv!31819 _keys!1628)))

(assert (=> start!110554 true))

(assert (=> start!110554 tp_is_empty!35119))

(declare-fun e!746279 () Bool)

(declare-fun array_inv!31820 (array!87240) Bool)

(assert (=> start!110554 (and (array_inv!31820 _values!1354) e!746279)))

(declare-fun b!1307810 () Bool)

(declare-fun res!868104 () Bool)

(assert (=> b!1307810 (=> (not res!868104) (not e!746281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87238 (_ BitVec 32)) Bool)

(assert (=> b!1307810 (= res!868104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307811 () Bool)

(declare-fun res!868102 () Bool)

(assert (=> b!1307811 (=> (not res!868102) (not e!746281))))

(assert (=> b!1307811 (= res!868102 (and (= (size!42650 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42649 _keys!1628) (size!42650 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307812 () Bool)

(declare-fun e!746282 () Bool)

(assert (=> b!1307812 (= e!746282 tp_is_empty!35119)))

(declare-fun mapNonEmpty!54307 () Bool)

(declare-fun mapRes!54307 () Bool)

(declare-fun tp!103488 () Bool)

(assert (=> mapNonEmpty!54307 (= mapRes!54307 (and tp!103488 e!746280))))

(declare-fun mapKey!54307 () (_ BitVec 32))

(declare-fun mapValue!54307 () ValueCell!16661)

(declare-fun mapRest!54307 () (Array (_ BitVec 32) ValueCell!16661))

(assert (=> mapNonEmpty!54307 (= (arr!42100 _values!1354) (store mapRest!54307 mapKey!54307 mapValue!54307))))

(declare-fun b!1307813 () Bool)

(declare-fun res!868101 () Bool)

(assert (=> b!1307813 (=> (not res!868101) (not e!746281))))

(declare-datatypes ((List!29844 0))(
  ( (Nil!29841) (Cons!29840 (h!31049 (_ BitVec 64)) (t!43450 List!29844)) )
))
(declare-fun arrayNoDuplicates!0 (array!87238 (_ BitVec 32) List!29844) Bool)

(assert (=> b!1307813 (= res!868101 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29841))))

(declare-fun mapIsEmpty!54307 () Bool)

(assert (=> mapIsEmpty!54307 mapRes!54307))

(declare-fun b!1307814 () Bool)

(assert (=> b!1307814 (= e!746279 (and e!746282 mapRes!54307))))

(declare-fun condMapEmpty!54307 () Bool)

(declare-fun mapDefault!54307 () ValueCell!16661)

