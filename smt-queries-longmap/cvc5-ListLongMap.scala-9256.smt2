; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110884 () Bool)

(assert start!110884)

(declare-fun b_free!29719 () Bool)

(declare-fun b_next!29719 () Bool)

(assert (=> start!110884 (= b_free!29719 (not b_next!29719))))

(declare-fun tp!104478 () Bool)

(declare-fun b_and!47927 () Bool)

(assert (=> start!110884 (= tp!104478 b_and!47927)))

(declare-fun b!1312739 () Bool)

(declare-fun e!748754 () Bool)

(assert (=> b!1312739 (= e!748754 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87880 0))(
  ( (array!87881 (arr!42420 (Array (_ BitVec 32) (_ BitVec 64))) (size!42970 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87880)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52369 0))(
  ( (V!52370 (val!17799 Int)) )
))
(declare-fun minValue!1296 () V!52369)

(declare-datatypes ((ValueCell!16826 0))(
  ( (ValueCellFull!16826 (v!20426 V!52369)) (EmptyCell!16826) )
))
(declare-datatypes ((array!87882 0))(
  ( (array!87883 (arr!42421 (Array (_ BitVec 32) ValueCell!16826)) (size!42971 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87882)

(declare-fun zeroValue!1296 () V!52369)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585597 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22944 0))(
  ( (tuple2!22945 (_1!11483 (_ BitVec 64)) (_2!11483 V!52369)) )
))
(declare-datatypes ((List!30082 0))(
  ( (Nil!30079) (Cons!30078 (h!31287 tuple2!22944) (t!43688 List!30082)) )
))
(declare-datatypes ((ListLongMap!20601 0))(
  ( (ListLongMap!20602 (toList!10316 List!30082)) )
))
(declare-fun contains!8466 (ListLongMap!20601 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5329 (array!87880 array!87882 (_ BitVec 32) (_ BitVec 32) V!52369 V!52369 (_ BitVec 32) Int) ListLongMap!20601)

(assert (=> b!1312739 (= lt!585597 (contains!8466 (getCurrentListMap!5329 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1312740 () Bool)

(declare-fun res!871549 () Bool)

(assert (=> b!1312740 (=> (not res!871549) (not e!748754))))

(assert (=> b!1312740 (= res!871549 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42970 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!871550 () Bool)

(assert (=> start!110884 (=> (not res!871550) (not e!748754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110884 (= res!871550 (validMask!0 mask!2040))))

(assert (=> start!110884 e!748754))

(assert (=> start!110884 tp!104478))

(declare-fun array_inv!32049 (array!87880) Bool)

(assert (=> start!110884 (array_inv!32049 _keys!1628)))

(assert (=> start!110884 true))

(declare-fun tp_is_empty!35449 () Bool)

(assert (=> start!110884 tp_is_empty!35449))

(declare-fun e!748753 () Bool)

(declare-fun array_inv!32050 (array!87882) Bool)

(assert (=> start!110884 (and (array_inv!32050 _values!1354) e!748753)))

(declare-fun b!1312741 () Bool)

(declare-fun res!871548 () Bool)

(assert (=> b!1312741 (=> (not res!871548) (not e!748754))))

(declare-datatypes ((List!30083 0))(
  ( (Nil!30080) (Cons!30079 (h!31288 (_ BitVec 64)) (t!43689 List!30083)) )
))
(declare-fun arrayNoDuplicates!0 (array!87880 (_ BitVec 32) List!30083) Bool)

(assert (=> b!1312741 (= res!871548 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30080))))

(declare-fun b!1312742 () Bool)

(declare-fun e!748756 () Bool)

(assert (=> b!1312742 (= e!748756 tp_is_empty!35449)))

(declare-fun b!1312743 () Bool)

(declare-fun res!871547 () Bool)

(assert (=> b!1312743 (=> (not res!871547) (not e!748754))))

(assert (=> b!1312743 (= res!871547 (and (= (size!42971 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42970 _keys!1628) (size!42971 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54802 () Bool)

(declare-fun mapRes!54802 () Bool)

(assert (=> mapIsEmpty!54802 mapRes!54802))

(declare-fun b!1312744 () Bool)

(declare-fun e!748757 () Bool)

(assert (=> b!1312744 (= e!748757 tp_is_empty!35449)))

(declare-fun b!1312745 () Bool)

(assert (=> b!1312745 (= e!748753 (and e!748757 mapRes!54802))))

(declare-fun condMapEmpty!54802 () Bool)

(declare-fun mapDefault!54802 () ValueCell!16826)

