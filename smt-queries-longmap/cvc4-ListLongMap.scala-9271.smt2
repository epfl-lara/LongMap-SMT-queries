; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110978 () Bool)

(assert start!110978)

(declare-fun b_free!29813 () Bool)

(declare-fun b_next!29813 () Bool)

(assert (=> start!110978 (= b_free!29813 (not b_next!29813))))

(declare-fun tp!104760 () Bool)

(declare-fun b_and!48021 () Bool)

(assert (=> start!110978 (= tp!104760 b_and!48021)))

(declare-fun res!872281 () Bool)

(declare-fun e!749459 () Bool)

(assert (=> start!110978 (=> (not res!872281) (not e!749459))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110978 (= res!872281 (validMask!0 mask!2040))))

(assert (=> start!110978 e!749459))

(assert (=> start!110978 tp!104760))

(declare-datatypes ((array!88058 0))(
  ( (array!88059 (arr!42509 (Array (_ BitVec 32) (_ BitVec 64))) (size!43059 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88058)

(declare-fun array_inv!32111 (array!88058) Bool)

(assert (=> start!110978 (array_inv!32111 _keys!1628)))

(assert (=> start!110978 true))

(declare-fun tp_is_empty!35543 () Bool)

(assert (=> start!110978 tp_is_empty!35543))

(declare-datatypes ((V!52493 0))(
  ( (V!52494 (val!17846 Int)) )
))
(declare-datatypes ((ValueCell!16873 0))(
  ( (ValueCellFull!16873 (v!20473 V!52493)) (EmptyCell!16873) )
))
(declare-datatypes ((array!88060 0))(
  ( (array!88061 (arr!42510 (Array (_ BitVec 32) ValueCell!16873)) (size!43060 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88060)

(declare-fun e!749458 () Bool)

(declare-fun array_inv!32112 (array!88060) Bool)

(assert (=> start!110978 (and (array_inv!32112 _values!1354) e!749458)))

(declare-fun mapIsEmpty!54943 () Bool)

(declare-fun mapRes!54943 () Bool)

(assert (=> mapIsEmpty!54943 mapRes!54943))

(declare-fun b!1313894 () Bool)

(declare-fun res!872280 () Bool)

(assert (=> b!1313894 (=> (not res!872280) (not e!749459))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313894 (= res!872280 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43059 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313895 () Bool)

(declare-fun e!749462 () Bool)

(assert (=> b!1313895 (= e!749462 tp_is_empty!35543)))

(declare-fun b!1313896 () Bool)

(declare-fun res!872283 () Bool)

(assert (=> b!1313896 (=> (not res!872283) (not e!749459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88058 (_ BitVec 32)) Bool)

(assert (=> b!1313896 (= res!872283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313897 () Bool)

(declare-fun res!872282 () Bool)

(assert (=> b!1313897 (=> (not res!872282) (not e!749459))))

(declare-datatypes ((List!30146 0))(
  ( (Nil!30143) (Cons!30142 (h!31351 (_ BitVec 64)) (t!43752 List!30146)) )
))
(declare-fun arrayNoDuplicates!0 (array!88058 (_ BitVec 32) List!30146) Bool)

(assert (=> b!1313897 (= res!872282 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30143))))

(declare-fun mapNonEmpty!54943 () Bool)

(declare-fun tp!104761 () Bool)

(assert (=> mapNonEmpty!54943 (= mapRes!54943 (and tp!104761 e!749462))))

(declare-fun mapValue!54943 () ValueCell!16873)

(declare-fun mapRest!54943 () (Array (_ BitVec 32) ValueCell!16873))

(declare-fun mapKey!54943 () (_ BitVec 32))

(assert (=> mapNonEmpty!54943 (= (arr!42510 _values!1354) (store mapRest!54943 mapKey!54943 mapValue!54943))))

(declare-fun b!1313898 () Bool)

(declare-fun e!749461 () Bool)

(assert (=> b!1313898 (= e!749461 tp_is_empty!35543)))

(declare-fun b!1313899 () Bool)

(assert (=> b!1313899 (= e!749459 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52493)

(declare-fun zeroValue!1296 () V!52493)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585729 () Bool)

(declare-datatypes ((tuple2!23010 0))(
  ( (tuple2!23011 (_1!11516 (_ BitVec 64)) (_2!11516 V!52493)) )
))
(declare-datatypes ((List!30147 0))(
  ( (Nil!30144) (Cons!30143 (h!31352 tuple2!23010) (t!43753 List!30147)) )
))
(declare-datatypes ((ListLongMap!20667 0))(
  ( (ListLongMap!20668 (toList!10349 List!30147)) )
))
(declare-fun contains!8499 (ListLongMap!20667 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5362 (array!88058 array!88060 (_ BitVec 32) (_ BitVec 32) V!52493 V!52493 (_ BitVec 32) Int) ListLongMap!20667)

(assert (=> b!1313899 (= lt!585729 (contains!8499 (getCurrentListMap!5362 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1313900 () Bool)

(declare-fun res!872279 () Bool)

(assert (=> b!1313900 (=> (not res!872279) (not e!749459))))

(assert (=> b!1313900 (= res!872279 (and (= (size!43060 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43059 _keys!1628) (size!43060 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313901 () Bool)

(assert (=> b!1313901 (= e!749458 (and e!749461 mapRes!54943))))

(declare-fun condMapEmpty!54943 () Bool)

(declare-fun mapDefault!54943 () ValueCell!16873)

