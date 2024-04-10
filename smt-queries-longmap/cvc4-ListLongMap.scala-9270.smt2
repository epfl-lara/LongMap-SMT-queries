; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110972 () Bool)

(assert start!110972)

(declare-fun b_free!29807 () Bool)

(declare-fun b_next!29807 () Bool)

(assert (=> start!110972 (= b_free!29807 (not b_next!29807))))

(declare-fun tp!104743 () Bool)

(declare-fun b_and!48015 () Bool)

(assert (=> start!110972 (= tp!104743 b_and!48015)))

(declare-fun b!1313822 () Bool)

(declare-fun e!749417 () Bool)

(declare-fun tp_is_empty!35537 () Bool)

(assert (=> b!1313822 (= e!749417 tp_is_empty!35537)))

(declare-fun b!1313823 () Bool)

(declare-fun e!749414 () Bool)

(assert (=> b!1313823 (= e!749414 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88046 0))(
  ( (array!88047 (arr!42503 (Array (_ BitVec 32) (_ BitVec 64))) (size!43053 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88046)

(declare-datatypes ((V!52485 0))(
  ( (V!52486 (val!17843 Int)) )
))
(declare-fun minValue!1296 () V!52485)

(declare-datatypes ((ValueCell!16870 0))(
  ( (ValueCellFull!16870 (v!20470 V!52485)) (EmptyCell!16870) )
))
(declare-datatypes ((array!88048 0))(
  ( (array!88049 (arr!42504 (Array (_ BitVec 32) ValueCell!16870)) (size!43054 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88048)

(declare-fun zeroValue!1296 () V!52485)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun lt!585720 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((tuple2!23004 0))(
  ( (tuple2!23005 (_1!11513 (_ BitVec 64)) (_2!11513 V!52485)) )
))
(declare-datatypes ((List!30140 0))(
  ( (Nil!30137) (Cons!30136 (h!31345 tuple2!23004) (t!43746 List!30140)) )
))
(declare-datatypes ((ListLongMap!20661 0))(
  ( (ListLongMap!20662 (toList!10346 List!30140)) )
))
(declare-fun contains!8496 (ListLongMap!20661 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5359 (array!88046 array!88048 (_ BitVec 32) (_ BitVec 32) V!52485 V!52485 (_ BitVec 32) Int) ListLongMap!20661)

(assert (=> b!1313823 (= lt!585720 (contains!8496 (getCurrentListMap!5359 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1313824 () Bool)

(declare-fun res!872234 () Bool)

(assert (=> b!1313824 (=> (not res!872234) (not e!749414))))

(declare-datatypes ((List!30141 0))(
  ( (Nil!30138) (Cons!30137 (h!31346 (_ BitVec 64)) (t!43747 List!30141)) )
))
(declare-fun arrayNoDuplicates!0 (array!88046 (_ BitVec 32) List!30141) Bool)

(assert (=> b!1313824 (= res!872234 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30138))))

(declare-fun res!872235 () Bool)

(assert (=> start!110972 (=> (not res!872235) (not e!749414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110972 (= res!872235 (validMask!0 mask!2040))))

(assert (=> start!110972 e!749414))

(assert (=> start!110972 tp!104743))

(declare-fun array_inv!32105 (array!88046) Bool)

(assert (=> start!110972 (array_inv!32105 _keys!1628)))

(assert (=> start!110972 true))

(assert (=> start!110972 tp_is_empty!35537))

(declare-fun e!749413 () Bool)

(declare-fun array_inv!32106 (array!88048) Bool)

(assert (=> start!110972 (and (array_inv!32106 _values!1354) e!749413)))

(declare-fun b!1313825 () Bool)

(declare-fun res!872237 () Bool)

(assert (=> b!1313825 (=> (not res!872237) (not e!749414))))

(assert (=> b!1313825 (= res!872237 (and (= (size!43054 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43053 _keys!1628) (size!43054 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54934 () Bool)

(declare-fun mapRes!54934 () Bool)

(assert (=> mapIsEmpty!54934 mapRes!54934))

(declare-fun b!1313826 () Bool)

(declare-fun e!749416 () Bool)

(assert (=> b!1313826 (= e!749416 tp_is_empty!35537)))

(declare-fun mapNonEmpty!54934 () Bool)

(declare-fun tp!104742 () Bool)

(assert (=> mapNonEmpty!54934 (= mapRes!54934 (and tp!104742 e!749416))))

(declare-fun mapValue!54934 () ValueCell!16870)

(declare-fun mapRest!54934 () (Array (_ BitVec 32) ValueCell!16870))

(declare-fun mapKey!54934 () (_ BitVec 32))

(assert (=> mapNonEmpty!54934 (= (arr!42504 _values!1354) (store mapRest!54934 mapKey!54934 mapValue!54934))))

(declare-fun b!1313827 () Bool)

(assert (=> b!1313827 (= e!749413 (and e!749417 mapRes!54934))))

(declare-fun condMapEmpty!54934 () Bool)

(declare-fun mapDefault!54934 () ValueCell!16870)

