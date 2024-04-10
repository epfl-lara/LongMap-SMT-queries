; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113604 () Bool)

(assert start!113604)

(declare-fun b_free!31571 () Bool)

(declare-fun b_next!31571 () Bool)

(assert (=> start!113604 (= b_free!31571 (not b_next!31571))))

(declare-fun tp!110524 () Bool)

(declare-fun b_and!50929 () Bool)

(assert (=> start!113604 (= tp!110524 b_and!50929)))

(declare-fun b!1348628 () Bool)

(declare-fun res!894800 () Bool)

(declare-fun e!767204 () Bool)

(assert (=> b!1348628 (=> (not res!894800) (not e!767204))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91970 0))(
  ( (array!91971 (arr!44439 (Array (_ BitVec 32) (_ BitVec 64))) (size!44989 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91970)

(declare-datatypes ((V!55197 0))(
  ( (V!55198 (val!18860 Int)) )
))
(declare-fun zeroValue!1245 () V!55197)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17887 0))(
  ( (ValueCellFull!17887 (v!21512 V!55197)) (EmptyCell!17887) )
))
(declare-datatypes ((array!91972 0))(
  ( (array!91973 (arr!44440 (Array (_ BitVec 32) ValueCell!17887)) (size!44990 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91972)

(declare-fun minValue!1245 () V!55197)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24320 0))(
  ( (tuple2!24321 (_1!12171 (_ BitVec 64)) (_2!12171 V!55197)) )
))
(declare-datatypes ((List!31472 0))(
  ( (Nil!31469) (Cons!31468 (h!32677 tuple2!24320) (t!46110 List!31472)) )
))
(declare-datatypes ((ListLongMap!21977 0))(
  ( (ListLongMap!21978 (toList!11004 List!31472)) )
))
(declare-fun contains!9184 (ListLongMap!21977 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5953 (array!91970 array!91972 (_ BitVec 32) (_ BitVec 32) V!55197 V!55197 (_ BitVec 32) Int) ListLongMap!21977)

(assert (=> b!1348628 (= res!894800 (contains!9184 (getCurrentListMap!5953 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapIsEmpty!58070 () Bool)

(declare-fun mapRes!58070 () Bool)

(assert (=> mapIsEmpty!58070 mapRes!58070))

(declare-fun b!1348629 () Bool)

(declare-fun e!767207 () Bool)

(declare-fun tp_is_empty!37571 () Bool)

(assert (=> b!1348629 (= e!767207 tp_is_empty!37571)))

(declare-fun b!1348630 () Bool)

(declare-fun res!894801 () Bool)

(assert (=> b!1348630 (=> (not res!894801) (not e!767204))))

(declare-datatypes ((List!31473 0))(
  ( (Nil!31470) (Cons!31469 (h!32678 (_ BitVec 64)) (t!46111 List!31473)) )
))
(declare-fun arrayNoDuplicates!0 (array!91970 (_ BitVec 32) List!31473) Bool)

(assert (=> b!1348630 (= res!894801 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31470))))

(declare-fun b!1348631 () Bool)

(declare-fun res!894798 () Bool)

(assert (=> b!1348631 (=> (not res!894798) (not e!767204))))

(assert (=> b!1348631 (= res!894798 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44989 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348632 () Bool)

(declare-fun res!894796 () Bool)

(assert (=> b!1348632 (=> (not res!894796) (not e!767204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348632 (= res!894796 (validKeyInArray!0 (select (arr!44439 _keys!1571) from!1960)))))

(declare-fun b!1348633 () Bool)

(declare-fun res!894802 () Bool)

(assert (=> b!1348633 (=> (not res!894802) (not e!767204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91970 (_ BitVec 32)) Bool)

(assert (=> b!1348633 (= res!894802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348634 () Bool)

(declare-fun res!894797 () Bool)

(assert (=> b!1348634 (=> (not res!894797) (not e!767204))))

(assert (=> b!1348634 (= res!894797 (not (= (select (arr!44439 _keys!1571) from!1960) k!1142)))))

(declare-fun res!894803 () Bool)

(assert (=> start!113604 (=> (not res!894803) (not e!767204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113604 (= res!894803 (validMask!0 mask!1977))))

(assert (=> start!113604 e!767204))

(assert (=> start!113604 tp_is_empty!37571))

(assert (=> start!113604 true))

(declare-fun array_inv!33475 (array!91970) Bool)

(assert (=> start!113604 (array_inv!33475 _keys!1571)))

(declare-fun e!767206 () Bool)

(declare-fun array_inv!33476 (array!91972) Bool)

(assert (=> start!113604 (and (array_inv!33476 _values!1303) e!767206)))

(assert (=> start!113604 tp!110524))

(declare-fun b!1348635 () Bool)

(assert (=> b!1348635 (= e!767204 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1960 (size!44990 _values!1303))))))

(declare-fun mapNonEmpty!58070 () Bool)

(declare-fun tp!110525 () Bool)

(assert (=> mapNonEmpty!58070 (= mapRes!58070 (and tp!110525 e!767207))))

(declare-fun mapRest!58070 () (Array (_ BitVec 32) ValueCell!17887))

(declare-fun mapValue!58070 () ValueCell!17887)

(declare-fun mapKey!58070 () (_ BitVec 32))

(assert (=> mapNonEmpty!58070 (= (arr!44440 _values!1303) (store mapRest!58070 mapKey!58070 mapValue!58070))))

(declare-fun b!1348636 () Bool)

(declare-fun e!767208 () Bool)

(assert (=> b!1348636 (= e!767206 (and e!767208 mapRes!58070))))

(declare-fun condMapEmpty!58070 () Bool)

(declare-fun mapDefault!58070 () ValueCell!17887)

