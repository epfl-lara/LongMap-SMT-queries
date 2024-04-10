; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110980 () Bool)

(assert start!110980)

(declare-fun b_free!29815 () Bool)

(declare-fun b_next!29815 () Bool)

(assert (=> start!110980 (= b_free!29815 (not b_next!29815))))

(declare-fun tp!104766 () Bool)

(declare-fun b_and!48023 () Bool)

(assert (=> start!110980 (= tp!104766 b_and!48023)))

(declare-fun b!1313918 () Bool)

(declare-fun e!749476 () Bool)

(declare-fun tp_is_empty!35545 () Bool)

(assert (=> b!1313918 (= e!749476 tp_is_empty!35545)))

(declare-fun b!1313919 () Bool)

(declare-fun res!872295 () Bool)

(declare-fun e!749475 () Bool)

(assert (=> b!1313919 (=> (not res!872295) (not e!749475))))

(declare-datatypes ((array!88062 0))(
  ( (array!88063 (arr!42511 (Array (_ BitVec 32) (_ BitVec 64))) (size!43061 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88062)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313919 (= res!872295 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43061 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313920 () Bool)

(declare-fun e!749473 () Bool)

(assert (=> b!1313920 (= e!749473 tp_is_empty!35545)))

(declare-fun b!1313921 () Bool)

(declare-fun res!872298 () Bool)

(assert (=> b!1313921 (=> (not res!872298) (not e!749475))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52497 0))(
  ( (V!52498 (val!17847 Int)) )
))
(declare-datatypes ((ValueCell!16874 0))(
  ( (ValueCellFull!16874 (v!20474 V!52497)) (EmptyCell!16874) )
))
(declare-datatypes ((array!88064 0))(
  ( (array!88065 (arr!42512 (Array (_ BitVec 32) ValueCell!16874)) (size!43062 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88064)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313921 (= res!872298 (and (= (size!43062 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43061 _keys!1628) (size!43062 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!872296 () Bool)

(assert (=> start!110980 (=> (not res!872296) (not e!749475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110980 (= res!872296 (validMask!0 mask!2040))))

(assert (=> start!110980 e!749475))

(assert (=> start!110980 tp!104766))

(declare-fun array_inv!32113 (array!88062) Bool)

(assert (=> start!110980 (array_inv!32113 _keys!1628)))

(assert (=> start!110980 true))

(assert (=> start!110980 tp_is_empty!35545))

(declare-fun e!749474 () Bool)

(declare-fun array_inv!32114 (array!88064) Bool)

(assert (=> start!110980 (and (array_inv!32114 _values!1354) e!749474)))

(declare-fun b!1313922 () Bool)

(declare-fun res!872297 () Bool)

(assert (=> b!1313922 (=> (not res!872297) (not e!749475))))

(declare-datatypes ((List!30148 0))(
  ( (Nil!30145) (Cons!30144 (h!31353 (_ BitVec 64)) (t!43754 List!30148)) )
))
(declare-fun arrayNoDuplicates!0 (array!88062 (_ BitVec 32) List!30148) Bool)

(assert (=> b!1313922 (= res!872297 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30145))))

(declare-fun b!1313923 () Bool)

(assert (=> b!1313923 (= e!749475 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52497)

(declare-fun zeroValue!1296 () V!52497)

(declare-fun lt!585732 () Bool)

(declare-datatypes ((tuple2!23012 0))(
  ( (tuple2!23013 (_1!11517 (_ BitVec 64)) (_2!11517 V!52497)) )
))
(declare-datatypes ((List!30149 0))(
  ( (Nil!30146) (Cons!30145 (h!31354 tuple2!23012) (t!43755 List!30149)) )
))
(declare-datatypes ((ListLongMap!20669 0))(
  ( (ListLongMap!20670 (toList!10350 List!30149)) )
))
(declare-fun contains!8500 (ListLongMap!20669 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5363 (array!88062 array!88064 (_ BitVec 32) (_ BitVec 32) V!52497 V!52497 (_ BitVec 32) Int) ListLongMap!20669)

(assert (=> b!1313923 (= lt!585732 (contains!8500 (getCurrentListMap!5363 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!54946 () Bool)

(declare-fun mapRes!54946 () Bool)

(declare-fun tp!104767 () Bool)

(assert (=> mapNonEmpty!54946 (= mapRes!54946 (and tp!104767 e!749476))))

(declare-fun mapValue!54946 () ValueCell!16874)

(declare-fun mapKey!54946 () (_ BitVec 32))

(declare-fun mapRest!54946 () (Array (_ BitVec 32) ValueCell!16874))

(assert (=> mapNonEmpty!54946 (= (arr!42512 _values!1354) (store mapRest!54946 mapKey!54946 mapValue!54946))))

(declare-fun b!1313924 () Bool)

(declare-fun res!872294 () Bool)

(assert (=> b!1313924 (=> (not res!872294) (not e!749475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88062 (_ BitVec 32)) Bool)

(assert (=> b!1313924 (= res!872294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54946 () Bool)

(assert (=> mapIsEmpty!54946 mapRes!54946))

(declare-fun b!1313925 () Bool)

(assert (=> b!1313925 (= e!749474 (and e!749473 mapRes!54946))))

(declare-fun condMapEmpty!54946 () Bool)

(declare-fun mapDefault!54946 () ValueCell!16874)

