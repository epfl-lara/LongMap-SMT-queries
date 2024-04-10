; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110914 () Bool)

(assert start!110914)

(declare-fun b_free!29749 () Bool)

(declare-fun b_next!29749 () Bool)

(assert (=> start!110914 (= b_free!29749 (not b_next!29749))))

(declare-fun tp!104569 () Bool)

(declare-fun b_and!47957 () Bool)

(assert (=> start!110914 (= tp!104569 b_and!47957)))

(declare-fun b!1313105 () Bool)

(declare-fun res!871778 () Bool)

(declare-fun e!748979 () Bool)

(assert (=> b!1313105 (=> (not res!871778) (not e!748979))))

(declare-datatypes ((array!87940 0))(
  ( (array!87941 (arr!42450 (Array (_ BitVec 32) (_ BitVec 64))) (size!43000 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87940)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313105 (= res!871778 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43000 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313106 () Bool)

(declare-fun e!748980 () Bool)

(declare-fun tp_is_empty!35479 () Bool)

(assert (=> b!1313106 (= e!748980 tp_is_empty!35479)))

(declare-fun mapIsEmpty!54847 () Bool)

(declare-fun mapRes!54847 () Bool)

(assert (=> mapIsEmpty!54847 mapRes!54847))

(declare-fun b!1313107 () Bool)

(declare-fun res!871781 () Bool)

(assert (=> b!1313107 (=> (not res!871781) (not e!748979))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((V!52409 0))(
  ( (V!52410 (val!17814 Int)) )
))
(declare-fun minValue!1296 () V!52409)

(declare-datatypes ((ValueCell!16841 0))(
  ( (ValueCellFull!16841 (v!20441 V!52409)) (EmptyCell!16841) )
))
(declare-datatypes ((array!87942 0))(
  ( (array!87943 (arr!42451 (Array (_ BitVec 32) ValueCell!16841)) (size!43001 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87942)

(declare-fun zeroValue!1296 () V!52409)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((tuple2!22968 0))(
  ( (tuple2!22969 (_1!11495 (_ BitVec 64)) (_2!11495 V!52409)) )
))
(declare-datatypes ((List!30103 0))(
  ( (Nil!30100) (Cons!30099 (h!31308 tuple2!22968) (t!43709 List!30103)) )
))
(declare-datatypes ((ListLongMap!20625 0))(
  ( (ListLongMap!20626 (toList!10328 List!30103)) )
))
(declare-fun contains!8478 (ListLongMap!20625 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5341 (array!87940 array!87942 (_ BitVec 32) (_ BitVec 32) V!52409 V!52409 (_ BitVec 32) Int) ListLongMap!20625)

(assert (=> b!1313107 (= res!871781 (contains!8478 (getCurrentListMap!5341 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!54847 () Bool)

(declare-fun tp!104568 () Bool)

(declare-fun e!748981 () Bool)

(assert (=> mapNonEmpty!54847 (= mapRes!54847 (and tp!104568 e!748981))))

(declare-fun mapKey!54847 () (_ BitVec 32))

(declare-fun mapValue!54847 () ValueCell!16841)

(declare-fun mapRest!54847 () (Array (_ BitVec 32) ValueCell!16841))

(assert (=> mapNonEmpty!54847 (= (arr!42451 _values!1354) (store mapRest!54847 mapKey!54847 mapValue!54847))))

(declare-fun b!1313108 () Bool)

(assert (=> b!1313108 (= e!748979 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000))))

(declare-fun b!1313109 () Bool)

(declare-fun res!871782 () Bool)

(assert (=> b!1313109 (=> (not res!871782) (not e!748979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1313109 (= res!871782 (not (validKeyInArray!0 (select (arr!42450 _keys!1628) from!2020))))))

(declare-fun b!1313110 () Bool)

(declare-fun e!748982 () Bool)

(assert (=> b!1313110 (= e!748982 (and e!748980 mapRes!54847))))

(declare-fun condMapEmpty!54847 () Bool)

(declare-fun mapDefault!54847 () ValueCell!16841)

