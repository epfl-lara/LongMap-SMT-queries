; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1024 () Bool)

(assert start!1024)

(declare-fun b_free!353 () Bool)

(declare-fun b_next!353 () Bool)

(assert (=> start!1024 (= b_free!353 (not b_next!353))))

(declare-fun tp!1298 () Bool)

(declare-fun b_and!505 () Bool)

(assert (=> start!1024 (= tp!1298 b_and!505)))

(declare-fun b!8871 () Bool)

(declare-fun res!8189 () Bool)

(declare-fun e!5062 () Bool)

(assert (=> b!8871 (=> (not res!8189) (not e!5062))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!751 0))(
  ( (V!752 (val!221 Int)) )
))
(declare-datatypes ((ValueCell!199 0))(
  ( (ValueCellFull!199 (v!1315 V!751)) (EmptyCell!199) )
))
(declare-datatypes ((array!795 0))(
  ( (array!796 (arr!383 (Array (_ BitVec 32) ValueCell!199)) (size!445 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!795)

(declare-datatypes ((array!797 0))(
  ( (array!798 (arr!384 (Array (_ BitVec 32) (_ BitVec 64))) (size!446 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!797)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8871 (= res!8189 (and (= (size!445 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!446 _keys!1806) (size!445 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!8192 () Bool)

(assert (=> start!1024 (=> (not res!8192) (not e!5062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1024 (= res!8192 (validMask!0 mask!2250))))

(assert (=> start!1024 e!5062))

(assert (=> start!1024 tp!1298))

(assert (=> start!1024 true))

(declare-fun e!5059 () Bool)

(declare-fun array_inv!283 (array!795) Bool)

(assert (=> start!1024 (and (array_inv!283 _values!1492) e!5059)))

(declare-fun tp_is_empty!431 () Bool)

(assert (=> start!1024 tp_is_empty!431))

(declare-fun array_inv!284 (array!797) Bool)

(assert (=> start!1024 (array_inv!284 _keys!1806)))

(declare-fun mapNonEmpty!626 () Bool)

(declare-fun mapRes!626 () Bool)

(declare-fun tp!1297 () Bool)

(declare-fun e!5061 () Bool)

(assert (=> mapNonEmpty!626 (= mapRes!626 (and tp!1297 e!5061))))

(declare-fun mapKey!626 () (_ BitVec 32))

(declare-fun mapValue!626 () ValueCell!199)

(declare-fun mapRest!626 () (Array (_ BitVec 32) ValueCell!199))

(assert (=> mapNonEmpty!626 (= (arr!383 _values!1492) (store mapRest!626 mapKey!626 mapValue!626))))

(declare-fun b!8872 () Bool)

(declare-fun res!8190 () Bool)

(assert (=> b!8872 (=> (not res!8190) (not e!5062))))

(declare-datatypes ((List!264 0))(
  ( (Nil!261) (Cons!260 (h!826 (_ BitVec 64)) (t!2405 List!264)) )
))
(declare-fun arrayNoDuplicates!0 (array!797 (_ BitVec 32) List!264) Bool)

(assert (=> b!8872 (= res!8190 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!261))))

(declare-fun b!8873 () Bool)

(declare-fun res!8191 () Bool)

(assert (=> b!8873 (=> (not res!8191) (not e!5062))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!751)

(declare-fun zeroValue!1434 () V!751)

(declare-fun k!1278 () (_ BitVec 64))

(declare-datatypes ((tuple2!254 0))(
  ( (tuple2!255 (_1!127 (_ BitVec 64)) (_2!127 V!751)) )
))
(declare-datatypes ((List!265 0))(
  ( (Nil!262) (Cons!261 (h!827 tuple2!254) (t!2406 List!265)) )
))
(declare-datatypes ((ListLongMap!259 0))(
  ( (ListLongMap!260 (toList!145 List!265)) )
))
(declare-fun contains!122 (ListLongMap!259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!104 (array!797 array!795 (_ BitVec 32) (_ BitVec 32) V!751 V!751 (_ BitVec 32) Int) ListLongMap!259)

(assert (=> b!8873 (= res!8191 (contains!122 (getCurrentListMap!104 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!8874 () Bool)

(declare-fun e!5060 () Bool)

(assert (=> b!8874 (= e!5060 true)))

(declare-fun lt!1915 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!797 (_ BitVec 32)) Bool)

(assert (=> b!8874 (arrayForallSeekEntryOrOpenFound!0 lt!1915 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!175 0))(
  ( (Unit!176) )
))
(declare-fun lt!1917 () Unit!175)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!175)

(assert (=> b!8874 (= lt!1917 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1915))))

(declare-fun arrayScanForKey!0 (array!797 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8874 (= lt!1915 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!8875 () Bool)

(assert (=> b!8875 (= e!5061 tp_is_empty!431)))

(declare-fun mapIsEmpty!626 () Bool)

(assert (=> mapIsEmpty!626 mapRes!626))

(declare-fun b!8876 () Bool)

(declare-fun e!5063 () Bool)

(assert (=> b!8876 (= e!5059 (and e!5063 mapRes!626))))

(declare-fun condMapEmpty!626 () Bool)

(declare-fun mapDefault!626 () ValueCell!199)

