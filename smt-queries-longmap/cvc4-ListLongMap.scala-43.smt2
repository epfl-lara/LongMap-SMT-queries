; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!754 () Bool)

(assert start!754)

(declare-fun b_free!167 () Bool)

(declare-fun b_next!167 () Bool)

(assert (=> start!754 (= b_free!167 (not b_next!167))))

(declare-fun tp!727 () Bool)

(declare-fun b_and!311 () Bool)

(assert (=> start!754 (= tp!727 b_and!311)))

(declare-fun b!5360 () Bool)

(declare-fun res!6206 () Bool)

(declare-fun e!2894 () Bool)

(assert (=> b!5360 (=> (not res!6206) (not e!2894))))

(declare-datatypes ((array!425 0))(
  ( (array!426 (arr!202 (Array (_ BitVec 32) (_ BitVec 64))) (size!264 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!425)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!425 (_ BitVec 32)) Bool)

(assert (=> b!5360 (= res!6206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!5361 () Bool)

(declare-fun res!6204 () Bool)

(assert (=> b!5361 (=> (not res!6204) (not e!2894))))

(declare-datatypes ((V!503 0))(
  ( (V!504 (val!128 Int)) )
))
(declare-datatypes ((ValueCell!106 0))(
  ( (ValueCellFull!106 (v!1218 V!503)) (EmptyCell!106) )
))
(declare-datatypes ((array!427 0))(
  ( (array!428 (arr!203 (Array (_ BitVec 32) ValueCell!106)) (size!265 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!427)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!5361 (= res!6204 (and (= (size!265 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!264 _keys!1806) (size!265 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5362 () Bool)

(declare-fun res!6208 () Bool)

(assert (=> b!5362 (=> (not res!6208) (not e!2894))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5362 (= res!6208 (validKeyInArray!0 k!1278))))

(declare-fun b!5363 () Bool)

(declare-fun e!2893 () Bool)

(declare-fun tp_is_empty!245 () Bool)

(assert (=> b!5363 (= e!2893 tp_is_empty!245)))

(declare-fun mapNonEmpty!335 () Bool)

(declare-fun mapRes!335 () Bool)

(declare-fun tp!728 () Bool)

(assert (=> mapNonEmpty!335 (= mapRes!335 (and tp!728 e!2893))))

(declare-fun mapValue!335 () ValueCell!106)

(declare-fun mapRest!335 () (Array (_ BitVec 32) ValueCell!106))

(declare-fun mapKey!335 () (_ BitVec 32))

(assert (=> mapNonEmpty!335 (= (arr!203 _values!1492) (store mapRest!335 mapKey!335 mapValue!335))))

(declare-fun res!6207 () Bool)

(assert (=> start!754 (=> (not res!6207) (not e!2894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!754 (= res!6207 (validMask!0 mask!2250))))

(assert (=> start!754 e!2894))

(assert (=> start!754 tp!727))

(assert (=> start!754 true))

(declare-fun e!2891 () Bool)

(declare-fun array_inv!149 (array!427) Bool)

(assert (=> start!754 (and (array_inv!149 _values!1492) e!2891)))

(assert (=> start!754 tp_is_empty!245))

(declare-fun array_inv!150 (array!425) Bool)

(assert (=> start!754 (array_inv!150 _keys!1806)))

(declare-fun b!5364 () Bool)

(declare-fun res!6205 () Bool)

(assert (=> b!5364 (=> (not res!6205) (not e!2894))))

(declare-datatypes ((List!134 0))(
  ( (Nil!131) (Cons!130 (h!696 (_ BitVec 64)) (t!2267 List!134)) )
))
(declare-fun arrayNoDuplicates!0 (array!425 (_ BitVec 32) List!134) Bool)

(assert (=> b!5364 (= res!6205 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!131))))

(declare-fun b!5365 () Bool)

(declare-fun res!6203 () Bool)

(assert (=> b!5365 (=> (not res!6203) (not e!2894))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!503)

(declare-fun zeroValue!1434 () V!503)

(declare-datatypes ((tuple2!122 0))(
  ( (tuple2!123 (_1!61 (_ BitVec 64)) (_2!61 V!503)) )
))
(declare-datatypes ((List!135 0))(
  ( (Nil!132) (Cons!131 (h!697 tuple2!122) (t!2268 List!135)) )
))
(declare-datatypes ((ListLongMap!127 0))(
  ( (ListLongMap!128 (toList!79 List!135)) )
))
(declare-fun contains!52 (ListLongMap!127 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!38 (array!425 array!427 (_ BitVec 32) (_ BitVec 32) V!503 V!503 (_ BitVec 32) Int) ListLongMap!127)

(assert (=> b!5365 (= res!6203 (contains!52 (getCurrentListMap!38 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!5366 () Bool)

(declare-fun e!2896 () Bool)

(assert (=> b!5366 (= e!2896 tp_is_empty!245)))

(declare-fun b!5367 () Bool)

(declare-fun e!2895 () Bool)

(assert (=> b!5367 (= e!2894 (not e!2895))))

(declare-fun res!6202 () Bool)

(assert (=> b!5367 (=> res!6202 e!2895)))

(declare-fun arrayContainsKey!0 (array!425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5367 (= res!6202 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!2897 () Bool)

(assert (=> b!5367 e!2897))

(declare-fun c!353 () Bool)

(assert (=> b!5367 (= c!353 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!69 0))(
  ( (Unit!70) )
))
(declare-fun lt!921 () Unit!69)

(declare-fun lemmaKeyInListMapIsInArray!21 (array!425 array!427 (_ BitVec 32) (_ BitVec 32) V!503 V!503 (_ BitVec 64) Int) Unit!69)

(assert (=> b!5367 (= lt!921 (lemmaKeyInListMapIsInArray!21 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun mapIsEmpty!335 () Bool)

(assert (=> mapIsEmpty!335 mapRes!335))

(declare-fun b!5368 () Bool)

(assert (=> b!5368 (= e!2897 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!5369 () Bool)

(assert (=> b!5369 (= e!2897 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5370 () Bool)

(assert (=> b!5370 (= e!2891 (and e!2896 mapRes!335))))

(declare-fun condMapEmpty!335 () Bool)

(declare-fun mapDefault!335 () ValueCell!106)

