; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43354 () Bool)

(assert start!43354)

(declare-fun b_free!12181 () Bool)

(declare-fun b_next!12181 () Bool)

(assert (=> start!43354 (= b_free!12181 (not b_next!12181))))

(declare-fun tp!42819 () Bool)

(declare-fun b_and!20937 () Bool)

(assert (=> start!43354 (= tp!42819 b_and!20937)))

(declare-fun b!480198 () Bool)

(declare-fun e!282565 () Bool)

(assert (=> b!480198 (= e!282565 (not true))))

(declare-fun lt!218106 () (_ BitVec 32))

(declare-datatypes ((array!31055 0))(
  ( (array!31056 (arr!14932 (Array (_ BitVec 32) (_ BitVec 64))) (size!15290 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31055)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31055 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480198 (= lt!218106 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun e!282562 () Bool)

(assert (=> b!480198 e!282562))

(declare-fun c!57757 () Bool)

(assert (=> b!480198 (= c!57757 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((Unit!14078 0))(
  ( (Unit!14079) )
))
(declare-fun lt!218107 () Unit!14078)

(declare-datatypes ((V!19329 0))(
  ( (V!19330 (val!6894 Int)) )
))
(declare-fun minValue!1458 () V!19329)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19329)

(declare-datatypes ((ValueCell!6485 0))(
  ( (ValueCellFull!6485 (v!9185 V!19329)) (EmptyCell!6485) )
))
(declare-datatypes ((array!31057 0))(
  ( (array!31058 (arr!14933 (Array (_ BitVec 32) ValueCell!6485)) (size!15291 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31057)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!112 (array!31055 array!31057 (_ BitVec 32) (_ BitVec 32) V!19329 V!19329 (_ BitVec 64) Int) Unit!14078)

(assert (=> b!480198 (= lt!218107 (lemmaKeyInListMapIsInArray!112 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!480200 () Bool)

(declare-fun arrayContainsKey!0 (array!31055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480200 (= e!282562 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!480201 () Bool)

(declare-fun res!286385 () Bool)

(assert (=> b!480201 (=> (not res!286385) (not e!282565))))

(declare-datatypes ((tuple2!9050 0))(
  ( (tuple2!9051 (_1!4536 (_ BitVec 64)) (_2!4536 V!19329)) )
))
(declare-datatypes ((List!9128 0))(
  ( (Nil!9125) (Cons!9124 (h!9980 tuple2!9050) (t!15338 List!9128)) )
))
(declare-datatypes ((ListLongMap!7963 0))(
  ( (ListLongMap!7964 (toList!3997 List!9128)) )
))
(declare-fun contains!2609 (ListLongMap!7963 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2316 (array!31055 array!31057 (_ BitVec 32) (_ BitVec 32) V!19329 V!19329 (_ BitVec 32) Int) ListLongMap!7963)

(assert (=> b!480201 (= res!286385 (contains!2609 (getCurrentListMap!2316 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!480202 () Bool)

(declare-fun e!282563 () Bool)

(declare-fun e!282564 () Bool)

(declare-fun mapRes!22243 () Bool)

(assert (=> b!480202 (= e!282563 (and e!282564 mapRes!22243))))

(declare-fun condMapEmpty!22243 () Bool)

(declare-fun mapDefault!22243 () ValueCell!6485)

