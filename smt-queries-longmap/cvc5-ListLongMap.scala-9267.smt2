; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110950 () Bool)

(assert start!110950)

(declare-fun b_free!29785 () Bool)

(declare-fun b_next!29785 () Bool)

(assert (=> start!110950 (= b_free!29785 (not b_next!29785))))

(declare-fun tp!104677 () Bool)

(declare-fun b_and!47993 () Bool)

(assert (=> start!110950 (= tp!104677 b_and!47993)))

(declare-fun res!872072 () Bool)

(declare-fun e!749248 () Bool)

(assert (=> start!110950 (=> (not res!872072) (not e!749248))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110950 (= res!872072 (validMask!0 mask!2040))))

(assert (=> start!110950 e!749248))

(assert (=> start!110950 tp!104677))

(declare-datatypes ((array!88008 0))(
  ( (array!88009 (arr!42484 (Array (_ BitVec 32) (_ BitVec 64))) (size!43034 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88008)

(declare-fun array_inv!32089 (array!88008) Bool)

(assert (=> start!110950 (array_inv!32089 _keys!1628)))

(assert (=> start!110950 true))

(declare-fun tp_is_empty!35515 () Bool)

(assert (=> start!110950 tp_is_empty!35515))

(declare-datatypes ((V!52457 0))(
  ( (V!52458 (val!17832 Int)) )
))
(declare-datatypes ((ValueCell!16859 0))(
  ( (ValueCellFull!16859 (v!20459 V!52457)) (EmptyCell!16859) )
))
(declare-datatypes ((array!88010 0))(
  ( (array!88011 (arr!42485 (Array (_ BitVec 32) ValueCell!16859)) (size!43035 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88010)

(declare-fun e!749249 () Bool)

(declare-fun array_inv!32090 (array!88010) Bool)

(assert (=> start!110950 (and (array_inv!32090 _values!1354) e!749249)))

(declare-fun b!1313558 () Bool)

(declare-fun res!872069 () Bool)

(assert (=> b!1313558 (=> (not res!872069) (not e!749248))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313558 (= res!872069 (and (= (size!43035 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43034 _keys!1628) (size!43035 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313559 () Bool)

(declare-fun res!872070 () Bool)

(assert (=> b!1313559 (=> (not res!872070) (not e!749248))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313559 (= res!872070 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43034 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54901 () Bool)

(declare-fun mapRes!54901 () Bool)

(assert (=> mapIsEmpty!54901 mapRes!54901))

(declare-fun b!1313560 () Bool)

(declare-fun res!872073 () Bool)

(assert (=> b!1313560 (=> (not res!872073) (not e!749248))))

(declare-datatypes ((List!30126 0))(
  ( (Nil!30123) (Cons!30122 (h!31331 (_ BitVec 64)) (t!43732 List!30126)) )
))
(declare-fun arrayNoDuplicates!0 (array!88008 (_ BitVec 32) List!30126) Bool)

(assert (=> b!1313560 (= res!872073 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30123))))

(declare-fun mapNonEmpty!54901 () Bool)

(declare-fun tp!104676 () Bool)

(declare-fun e!749250 () Bool)

(assert (=> mapNonEmpty!54901 (= mapRes!54901 (and tp!104676 e!749250))))

(declare-fun mapKey!54901 () (_ BitVec 32))

(declare-fun mapValue!54901 () ValueCell!16859)

(declare-fun mapRest!54901 () (Array (_ BitVec 32) ValueCell!16859))

(assert (=> mapNonEmpty!54901 (= (arr!42485 _values!1354) (store mapRest!54901 mapKey!54901 mapValue!54901))))

(declare-fun b!1313561 () Bool)

(assert (=> b!1313561 (= e!749248 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52457)

(declare-fun zeroValue!1296 () V!52457)

(declare-fun lt!585687 () Bool)

(declare-datatypes ((tuple2!22990 0))(
  ( (tuple2!22991 (_1!11506 (_ BitVec 64)) (_2!11506 V!52457)) )
))
(declare-datatypes ((List!30127 0))(
  ( (Nil!30124) (Cons!30123 (h!31332 tuple2!22990) (t!43733 List!30127)) )
))
(declare-datatypes ((ListLongMap!20647 0))(
  ( (ListLongMap!20648 (toList!10339 List!30127)) )
))
(declare-fun contains!8489 (ListLongMap!20647 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5352 (array!88008 array!88010 (_ BitVec 32) (_ BitVec 32) V!52457 V!52457 (_ BitVec 32) Int) ListLongMap!20647)

(assert (=> b!1313561 (= lt!585687 (contains!8489 (getCurrentListMap!5352 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1313562 () Bool)

(declare-fun e!749252 () Bool)

(assert (=> b!1313562 (= e!749252 tp_is_empty!35515)))

(declare-fun b!1313563 () Bool)

(assert (=> b!1313563 (= e!749249 (and e!749252 mapRes!54901))))

(declare-fun condMapEmpty!54901 () Bool)

(declare-fun mapDefault!54901 () ValueCell!16859)

