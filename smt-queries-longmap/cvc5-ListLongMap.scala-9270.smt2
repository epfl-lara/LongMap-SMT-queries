; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110968 () Bool)

(assert start!110968)

(declare-fun b_free!29803 () Bool)

(declare-fun b_next!29803 () Bool)

(assert (=> start!110968 (= b_free!29803 (not b_next!29803))))

(declare-fun tp!104730 () Bool)

(declare-fun b_and!48011 () Bool)

(assert (=> start!110968 (= tp!104730 b_and!48011)))

(declare-fun b!1313774 () Bool)

(declare-fun e!749383 () Bool)

(declare-fun tp_is_empty!35533 () Bool)

(assert (=> b!1313774 (= e!749383 tp_is_empty!35533)))

(declare-fun b!1313775 () Bool)

(declare-fun e!749385 () Bool)

(assert (=> b!1313775 (= e!749385 tp_is_empty!35533)))

(declare-fun b!1313776 () Bool)

(declare-fun res!872208 () Bool)

(declare-fun e!749387 () Bool)

(assert (=> b!1313776 (=> (not res!872208) (not e!749387))))

(declare-datatypes ((array!88038 0))(
  ( (array!88039 (arr!42499 (Array (_ BitVec 32) (_ BitVec 64))) (size!43049 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88038)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52481 0))(
  ( (V!52482 (val!17841 Int)) )
))
(declare-datatypes ((ValueCell!16868 0))(
  ( (ValueCellFull!16868 (v!20468 V!52481)) (EmptyCell!16868) )
))
(declare-datatypes ((array!88040 0))(
  ( (array!88041 (arr!42500 (Array (_ BitVec 32) ValueCell!16868)) (size!43050 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88040)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313776 (= res!872208 (and (= (size!43050 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43049 _keys!1628) (size!43050 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!872204 () Bool)

(assert (=> start!110968 (=> (not res!872204) (not e!749387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110968 (= res!872204 (validMask!0 mask!2040))))

(assert (=> start!110968 e!749387))

(assert (=> start!110968 tp!104730))

(declare-fun array_inv!32101 (array!88038) Bool)

(assert (=> start!110968 (array_inv!32101 _keys!1628)))

(assert (=> start!110968 true))

(assert (=> start!110968 tp_is_empty!35533))

(declare-fun e!749384 () Bool)

(declare-fun array_inv!32102 (array!88040) Bool)

(assert (=> start!110968 (and (array_inv!32102 _values!1354) e!749384)))

(declare-fun mapNonEmpty!54928 () Bool)

(declare-fun mapRes!54928 () Bool)

(declare-fun tp!104731 () Bool)

(assert (=> mapNonEmpty!54928 (= mapRes!54928 (and tp!104731 e!749385))))

(declare-fun mapValue!54928 () ValueCell!16868)

(declare-fun mapKey!54928 () (_ BitVec 32))

(declare-fun mapRest!54928 () (Array (_ BitVec 32) ValueCell!16868))

(assert (=> mapNonEmpty!54928 (= (arr!42500 _values!1354) (store mapRest!54928 mapKey!54928 mapValue!54928))))

(declare-fun b!1313777 () Bool)

(declare-fun res!872206 () Bool)

(assert (=> b!1313777 (=> (not res!872206) (not e!749387))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313777 (= res!872206 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43049 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313778 () Bool)

(declare-fun res!872205 () Bool)

(assert (=> b!1313778 (=> (not res!872205) (not e!749387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88038 (_ BitVec 32)) Bool)

(assert (=> b!1313778 (= res!872205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313779 () Bool)

(assert (=> b!1313779 (= e!749387 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52481)

(declare-fun zeroValue!1296 () V!52481)

(declare-fun lt!585714 () Bool)

(declare-datatypes ((tuple2!23000 0))(
  ( (tuple2!23001 (_1!11511 (_ BitVec 64)) (_2!11511 V!52481)) )
))
(declare-datatypes ((List!30136 0))(
  ( (Nil!30133) (Cons!30132 (h!31341 tuple2!23000) (t!43742 List!30136)) )
))
(declare-datatypes ((ListLongMap!20657 0))(
  ( (ListLongMap!20658 (toList!10344 List!30136)) )
))
(declare-fun contains!8494 (ListLongMap!20657 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5357 (array!88038 array!88040 (_ BitVec 32) (_ BitVec 32) V!52481 V!52481 (_ BitVec 32) Int) ListLongMap!20657)

(assert (=> b!1313779 (= lt!585714 (contains!8494 (getCurrentListMap!5357 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapIsEmpty!54928 () Bool)

(assert (=> mapIsEmpty!54928 mapRes!54928))

(declare-fun b!1313780 () Bool)

(declare-fun res!872207 () Bool)

(assert (=> b!1313780 (=> (not res!872207) (not e!749387))))

(declare-datatypes ((List!30137 0))(
  ( (Nil!30134) (Cons!30133 (h!31342 (_ BitVec 64)) (t!43743 List!30137)) )
))
(declare-fun arrayNoDuplicates!0 (array!88038 (_ BitVec 32) List!30137) Bool)

(assert (=> b!1313780 (= res!872207 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30134))))

(declare-fun b!1313781 () Bool)

(assert (=> b!1313781 (= e!749384 (and e!749383 mapRes!54928))))

(declare-fun condMapEmpty!54928 () Bool)

(declare-fun mapDefault!54928 () ValueCell!16868)

