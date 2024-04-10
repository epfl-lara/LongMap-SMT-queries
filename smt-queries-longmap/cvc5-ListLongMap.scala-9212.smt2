; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110620 () Bool)

(assert start!110620)

(declare-fun b_free!29455 () Bool)

(declare-fun b_next!29455 () Bool)

(assert (=> start!110620 (= b_free!29455 (not b_next!29455))))

(declare-fun tp!103687 () Bool)

(declare-fun b_and!47663 () Bool)

(assert (=> start!110620 (= tp!103687 b_and!47663)))

(declare-fun b!1308923 () Bool)

(declare-fun e!746775 () Bool)

(declare-fun tp_is_empty!35185 () Bool)

(assert (=> b!1308923 (= e!746775 tp_is_empty!35185)))

(declare-fun b!1308924 () Bool)

(declare-fun res!868923 () Bool)

(declare-fun e!746776 () Bool)

(assert (=> b!1308924 (=> (not res!868923) (not e!746776))))

(declare-datatypes ((array!87364 0))(
  ( (array!87365 (arr!42162 (Array (_ BitVec 32) (_ BitVec 64))) (size!42712 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87364)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308924 (= res!868923 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42712 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308925 () Bool)

(declare-fun res!868922 () Bool)

(assert (=> b!1308925 (=> (not res!868922) (not e!746776))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52017 0))(
  ( (V!52018 (val!17667 Int)) )
))
(declare-datatypes ((ValueCell!16694 0))(
  ( (ValueCellFull!16694 (v!20294 V!52017)) (EmptyCell!16694) )
))
(declare-datatypes ((array!87366 0))(
  ( (array!87367 (arr!42163 (Array (_ BitVec 32) ValueCell!16694)) (size!42713 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87366)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308925 (= res!868922 (and (= (size!42713 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42712 _keys!1628) (size!42713 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308927 () Bool)

(declare-fun res!868919 () Bool)

(assert (=> b!1308927 (=> (not res!868919) (not e!746776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87364 (_ BitVec 32)) Bool)

(assert (=> b!1308927 (= res!868919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308928 () Bool)

(assert (=> b!1308928 (= e!746776 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52017)

(declare-fun zeroValue!1296 () V!52017)

(declare-fun lt!585201 () Bool)

(declare-datatypes ((tuple2!22750 0))(
  ( (tuple2!22751 (_1!11386 (_ BitVec 64)) (_2!11386 V!52017)) )
))
(declare-datatypes ((List!29891 0))(
  ( (Nil!29888) (Cons!29887 (h!31096 tuple2!22750) (t!43497 List!29891)) )
))
(declare-datatypes ((ListLongMap!20407 0))(
  ( (ListLongMap!20408 (toList!10219 List!29891)) )
))
(declare-fun contains!8369 (ListLongMap!20407 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5232 (array!87364 array!87366 (_ BitVec 32) (_ BitVec 32) V!52017 V!52017 (_ BitVec 32) Int) ListLongMap!20407)

(assert (=> b!1308928 (= lt!585201 (contains!8369 (getCurrentListMap!5232 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!54406 () Bool)

(declare-fun mapRes!54406 () Bool)

(declare-fun tp!103686 () Bool)

(declare-fun e!746773 () Bool)

(assert (=> mapNonEmpty!54406 (= mapRes!54406 (and tp!103686 e!746773))))

(declare-fun mapKey!54406 () (_ BitVec 32))

(declare-fun mapRest!54406 () (Array (_ BitVec 32) ValueCell!16694))

(declare-fun mapValue!54406 () ValueCell!16694)

(assert (=> mapNonEmpty!54406 (= (arr!42163 _values!1354) (store mapRest!54406 mapKey!54406 mapValue!54406))))

(declare-fun b!1308929 () Bool)

(assert (=> b!1308929 (= e!746773 tp_is_empty!35185)))

(declare-fun b!1308930 () Bool)

(declare-fun res!868920 () Bool)

(assert (=> b!1308930 (=> (not res!868920) (not e!746776))))

(declare-datatypes ((List!29892 0))(
  ( (Nil!29889) (Cons!29888 (h!31097 (_ BitVec 64)) (t!43498 List!29892)) )
))
(declare-fun arrayNoDuplicates!0 (array!87364 (_ BitVec 32) List!29892) Bool)

(assert (=> b!1308930 (= res!868920 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29889))))

(declare-fun mapIsEmpty!54406 () Bool)

(assert (=> mapIsEmpty!54406 mapRes!54406))

(declare-fun b!1308926 () Bool)

(declare-fun e!746777 () Bool)

(assert (=> b!1308926 (= e!746777 (and e!746775 mapRes!54406))))

(declare-fun condMapEmpty!54406 () Bool)

(declare-fun mapDefault!54406 () ValueCell!16694)

