; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110776 () Bool)

(assert start!110776)

(declare-fun b_free!29611 () Bool)

(declare-fun b_next!29611 () Bool)

(assert (=> start!110776 (= b_free!29611 (not b_next!29611))))

(declare-fun tp!104155 () Bool)

(declare-fun b_and!47819 () Bool)

(assert (=> start!110776 (= tp!104155 b_and!47819)))

(declare-fun b!1311120 () Bool)

(declare-fun e!747943 () Bool)

(declare-fun tp_is_empty!35341 () Bool)

(assert (=> b!1311120 (= e!747943 tp_is_empty!35341)))

(declare-fun b!1311121 () Bool)

(declare-fun e!747945 () Bool)

(assert (=> b!1311121 (= e!747945 false)))

(declare-fun lt!585435 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87670 0))(
  ( (array!87671 (arr!42315 (Array (_ BitVec 32) (_ BitVec 64))) (size!42865 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87670)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52225 0))(
  ( (V!52226 (val!17745 Int)) )
))
(declare-fun minValue!1296 () V!52225)

(declare-datatypes ((ValueCell!16772 0))(
  ( (ValueCellFull!16772 (v!20372 V!52225)) (EmptyCell!16772) )
))
(declare-datatypes ((array!87672 0))(
  ( (array!87673 (arr!42316 (Array (_ BitVec 32) ValueCell!16772)) (size!42866 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87672)

(declare-fun zeroValue!1296 () V!52225)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22866 0))(
  ( (tuple2!22867 (_1!11444 (_ BitVec 64)) (_2!11444 V!52225)) )
))
(declare-datatypes ((List!30007 0))(
  ( (Nil!30004) (Cons!30003 (h!31212 tuple2!22866) (t!43613 List!30007)) )
))
(declare-datatypes ((ListLongMap!20523 0))(
  ( (ListLongMap!20524 (toList!10277 List!30007)) )
))
(declare-fun contains!8427 (ListLongMap!20523 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5290 (array!87670 array!87672 (_ BitVec 32) (_ BitVec 32) V!52225 V!52225 (_ BitVec 32) Int) ListLongMap!20523)

(assert (=> b!1311121 (= lt!585435 (contains!8427 (getCurrentListMap!5290 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1311122 () Bool)

(declare-fun res!870415 () Bool)

(assert (=> b!1311122 (=> (not res!870415) (not e!747945))))

(assert (=> b!1311122 (= res!870415 (and (= (size!42866 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42865 _keys!1628) (size!42866 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311123 () Bool)

(declare-fun res!870413 () Bool)

(assert (=> b!1311123 (=> (not res!870413) (not e!747945))))

(declare-datatypes ((List!30008 0))(
  ( (Nil!30005) (Cons!30004 (h!31213 (_ BitVec 64)) (t!43614 List!30008)) )
))
(declare-fun arrayNoDuplicates!0 (array!87670 (_ BitVec 32) List!30008) Bool)

(assert (=> b!1311123 (= res!870413 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30005))))

(declare-fun b!1311124 () Bool)

(declare-fun e!747947 () Bool)

(assert (=> b!1311124 (= e!747947 tp_is_empty!35341)))

(declare-fun b!1311125 () Bool)

(declare-fun e!747944 () Bool)

(declare-fun mapRes!54640 () Bool)

(assert (=> b!1311125 (= e!747944 (and e!747947 mapRes!54640))))

(declare-fun condMapEmpty!54640 () Bool)

(declare-fun mapDefault!54640 () ValueCell!16772)

