; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!782 () Bool)

(assert start!782)

(declare-fun b_free!175 () Bool)

(declare-fun b_next!175 () Bool)

(assert (=> start!782 (= b_free!175 (not b_next!175))))

(declare-fun tp!755 () Bool)

(declare-fun b_and!321 () Bool)

(assert (=> start!782 (= tp!755 b_and!321)))

(declare-fun b!5616 () Bool)

(declare-fun e!3051 () Bool)

(declare-fun e!3053 () Bool)

(assert (=> b!5616 (= e!3051 (not e!3053))))

(declare-fun res!6330 () Bool)

(assert (=> b!5616 (=> res!6330 e!3053)))

(declare-datatypes ((array!443 0))(
  ( (array!444 (arr!210 (Array (_ BitVec 32) (_ BitVec 64))) (size!272 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!443)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5616 (= res!6330 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!3049 () Bool)

(assert (=> b!5616 e!3049))

(declare-fun c!395 () Bool)

(assert (=> b!5616 (= c!395 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!515 0))(
  ( (V!516 (val!132 Int)) )
))
(declare-datatypes ((ValueCell!110 0))(
  ( (ValueCellFull!110 (v!1223 V!515)) (EmptyCell!110) )
))
(declare-datatypes ((array!445 0))(
  ( (array!446 (arr!211 (Array (_ BitVec 32) ValueCell!110)) (size!273 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!445)

(declare-fun minValue!1434 () V!515)

(declare-datatypes ((Unit!77 0))(
  ( (Unit!78) )
))
(declare-fun lt!1026 () Unit!77)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!515)

(declare-fun lemmaKeyInListMapIsInArray!24 (array!443 array!445 (_ BitVec 32) (_ BitVec 32) V!515 V!515 (_ BitVec 64) Int) Unit!77)

(assert (=> b!5616 (= lt!1026 (lemmaKeyInListMapIsInArray!24 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!5617 () Bool)

(declare-fun e!3052 () Bool)

(declare-fun tp_is_empty!253 () Bool)

(assert (=> b!5617 (= e!3052 tp_is_empty!253)))

(declare-fun mapIsEmpty!350 () Bool)

(declare-fun mapRes!350 () Bool)

(assert (=> mapIsEmpty!350 mapRes!350))

(declare-fun b!5618 () Bool)

(declare-fun res!6333 () Bool)

(assert (=> b!5618 (=> (not res!6333) (not e!3051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!443 (_ BitVec 32)) Bool)

(assert (=> b!5618 (= res!6333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!5619 () Bool)

(assert (=> b!5619 (= e!3049 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!5620 () Bool)

(declare-fun res!6328 () Bool)

(assert (=> b!5620 (=> (not res!6328) (not e!3051))))

(declare-datatypes ((tuple2!128 0))(
  ( (tuple2!129 (_1!64 (_ BitVec 64)) (_2!64 V!515)) )
))
(declare-datatypes ((List!141 0))(
  ( (Nil!138) (Cons!137 (h!703 tuple2!128) (t!2276 List!141)) )
))
(declare-datatypes ((ListLongMap!133 0))(
  ( (ListLongMap!134 (toList!82 List!141)) )
))
(declare-fun contains!56 (ListLongMap!133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!41 (array!443 array!445 (_ BitVec 32) (_ BitVec 32) V!515 V!515 (_ BitVec 32) Int) ListLongMap!133)

(assert (=> b!5620 (= res!6328 (contains!56 (getCurrentListMap!41 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!5621 () Bool)

(assert (=> b!5621 (= e!3053 true)))

(declare-fun lt!1025 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!443 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!5621 (= lt!1025 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!350 () Bool)

(declare-fun tp!754 () Bool)

(assert (=> mapNonEmpty!350 (= mapRes!350 (and tp!754 e!3052))))

(declare-fun mapValue!350 () ValueCell!110)

(declare-fun mapRest!350 () (Array (_ BitVec 32) ValueCell!110))

(declare-fun mapKey!350 () (_ BitVec 32))

(assert (=> mapNonEmpty!350 (= (arr!211 _values!1492) (store mapRest!350 mapKey!350 mapValue!350))))

(declare-fun b!5622 () Bool)

(assert (=> b!5622 (= e!3049 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5623 () Bool)

(declare-fun res!6331 () Bool)

(assert (=> b!5623 (=> (not res!6331) (not e!3051))))

(assert (=> b!5623 (= res!6331 (and (= (size!273 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!272 _keys!1806) (size!273 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5624 () Bool)

(declare-fun res!6329 () Bool)

(assert (=> b!5624 (=> (not res!6329) (not e!3051))))

(declare-datatypes ((List!142 0))(
  ( (Nil!139) (Cons!138 (h!704 (_ BitVec 64)) (t!2277 List!142)) )
))
(declare-fun arrayNoDuplicates!0 (array!443 (_ BitVec 32) List!142) Bool)

(assert (=> b!5624 (= res!6329 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!139))))

(declare-fun b!5625 () Bool)

(declare-fun res!6332 () Bool)

(assert (=> b!5625 (=> (not res!6332) (not e!3051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5625 (= res!6332 (validKeyInArray!0 k!1278))))

(declare-fun b!5626 () Bool)

(declare-fun e!3047 () Bool)

(declare-fun e!3048 () Bool)

(assert (=> b!5626 (= e!3047 (and e!3048 mapRes!350))))

(declare-fun condMapEmpty!350 () Bool)

(declare-fun mapDefault!350 () ValueCell!110)

