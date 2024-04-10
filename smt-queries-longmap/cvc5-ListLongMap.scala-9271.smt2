; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110974 () Bool)

(assert start!110974)

(declare-fun b_free!29809 () Bool)

(declare-fun b_next!29809 () Bool)

(assert (=> start!110974 (= b_free!29809 (not b_next!29809))))

(declare-fun tp!104749 () Bool)

(declare-fun b_and!48017 () Bool)

(assert (=> start!110974 (= tp!104749 b_and!48017)))

(declare-fun mapNonEmpty!54937 () Bool)

(declare-fun mapRes!54937 () Bool)

(declare-fun tp!104748 () Bool)

(declare-fun e!749429 () Bool)

(assert (=> mapNonEmpty!54937 (= mapRes!54937 (and tp!104748 e!749429))))

(declare-datatypes ((V!52489 0))(
  ( (V!52490 (val!17844 Int)) )
))
(declare-datatypes ((ValueCell!16871 0))(
  ( (ValueCellFull!16871 (v!20471 V!52489)) (EmptyCell!16871) )
))
(declare-fun mapValue!54937 () ValueCell!16871)

(declare-fun mapRest!54937 () (Array (_ BitVec 32) ValueCell!16871))

(declare-fun mapKey!54937 () (_ BitVec 32))

(declare-datatypes ((array!88050 0))(
  ( (array!88051 (arr!42505 (Array (_ BitVec 32) ValueCell!16871)) (size!43055 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88050)

(assert (=> mapNonEmpty!54937 (= (arr!42505 _values!1354) (store mapRest!54937 mapKey!54937 mapValue!54937))))

(declare-fun res!872251 () Bool)

(declare-fun e!749432 () Bool)

(assert (=> start!110974 (=> (not res!872251) (not e!749432))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110974 (= res!872251 (validMask!0 mask!2040))))

(assert (=> start!110974 e!749432))

(assert (=> start!110974 tp!104749))

(declare-datatypes ((array!88052 0))(
  ( (array!88053 (arr!42506 (Array (_ BitVec 32) (_ BitVec 64))) (size!43056 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88052)

(declare-fun array_inv!32107 (array!88052) Bool)

(assert (=> start!110974 (array_inv!32107 _keys!1628)))

(assert (=> start!110974 true))

(declare-fun tp_is_empty!35539 () Bool)

(assert (=> start!110974 tp_is_empty!35539))

(declare-fun e!749430 () Bool)

(declare-fun array_inv!32108 (array!88050) Bool)

(assert (=> start!110974 (and (array_inv!32108 _values!1354) e!749430)))

(declare-fun b!1313846 () Bool)

(assert (=> b!1313846 (= e!749429 tp_is_empty!35539)))

(declare-fun b!1313847 () Bool)

(declare-fun e!749431 () Bool)

(assert (=> b!1313847 (= e!749431 tp_is_empty!35539)))

(declare-fun b!1313848 () Bool)

(assert (=> b!1313848 (= e!749432 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585723 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun zeroValue!1296 () V!52489)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52489)

(declare-datatypes ((tuple2!23006 0))(
  ( (tuple2!23007 (_1!11514 (_ BitVec 64)) (_2!11514 V!52489)) )
))
(declare-datatypes ((List!30142 0))(
  ( (Nil!30139) (Cons!30138 (h!31347 tuple2!23006) (t!43748 List!30142)) )
))
(declare-datatypes ((ListLongMap!20663 0))(
  ( (ListLongMap!20664 (toList!10347 List!30142)) )
))
(declare-fun contains!8497 (ListLongMap!20663 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5360 (array!88052 array!88050 (_ BitVec 32) (_ BitVec 32) V!52489 V!52489 (_ BitVec 32) Int) ListLongMap!20663)

(assert (=> b!1313848 (= lt!585723 (contains!8497 (getCurrentListMap!5360 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1313849 () Bool)

(declare-fun res!872253 () Bool)

(assert (=> b!1313849 (=> (not res!872253) (not e!749432))))

(assert (=> b!1313849 (= res!872253 (and (= (size!43055 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43056 _keys!1628) (size!43055 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54937 () Bool)

(assert (=> mapIsEmpty!54937 mapRes!54937))

(declare-fun b!1313850 () Bool)

(declare-fun res!872252 () Bool)

(assert (=> b!1313850 (=> (not res!872252) (not e!749432))))

(declare-datatypes ((List!30143 0))(
  ( (Nil!30140) (Cons!30139 (h!31348 (_ BitVec 64)) (t!43749 List!30143)) )
))
(declare-fun arrayNoDuplicates!0 (array!88052 (_ BitVec 32) List!30143) Bool)

(assert (=> b!1313850 (= res!872252 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30140))))

(declare-fun b!1313851 () Bool)

(declare-fun res!872250 () Bool)

(assert (=> b!1313851 (=> (not res!872250) (not e!749432))))

(assert (=> b!1313851 (= res!872250 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43056 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313852 () Bool)

(declare-fun res!872249 () Bool)

(assert (=> b!1313852 (=> (not res!872249) (not e!749432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88052 (_ BitVec 32)) Bool)

(assert (=> b!1313852 (= res!872249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313853 () Bool)

(assert (=> b!1313853 (= e!749430 (and e!749431 mapRes!54937))))

(declare-fun condMapEmpty!54937 () Bool)

(declare-fun mapDefault!54937 () ValueCell!16871)

