; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1114 () Bool)

(assert start!1114)

(declare-fun b_free!385 () Bool)

(declare-fun b_next!385 () Bool)

(assert (=> start!1114 (= b_free!385 (not b_next!385))))

(declare-fun tp!1400 () Bool)

(declare-fun b_and!541 () Bool)

(assert (=> start!1114 (= tp!1400 b_and!541)))

(declare-fun mapNonEmpty!680 () Bool)

(declare-fun mapRes!680 () Bool)

(declare-fun tp!1399 () Bool)

(declare-fun e!5629 () Bool)

(assert (=> mapNonEmpty!680 (= mapRes!680 (and tp!1399 e!5629))))

(declare-datatypes ((V!795 0))(
  ( (V!796 (val!237 Int)) )
))
(declare-datatypes ((ValueCell!215 0))(
  ( (ValueCellFull!215 (v!1333 V!795)) (EmptyCell!215) )
))
(declare-fun mapValue!680 () ValueCell!215)

(declare-fun mapKey!680 () (_ BitVec 32))

(declare-datatypes ((array!859 0))(
  ( (array!860 (arr!413 (Array (_ BitVec 32) ValueCell!215)) (size!475 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!859)

(declare-fun mapRest!680 () (Array (_ BitVec 32) ValueCell!215))

(assert (=> mapNonEmpty!680 (= (arr!413 _values!1492) (store mapRest!680 mapKey!680 mapValue!680))))

(declare-fun b!9816 () Bool)

(declare-fun e!5626 () Bool)

(declare-datatypes ((array!861 0))(
  ( (array!862 (arr!414 (Array (_ BitVec 32) (_ BitVec 64))) (size!476 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!861)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9816 (= e!5626 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!9817 () Bool)

(declare-fun res!8684 () Bool)

(declare-fun e!5630 () Bool)

(assert (=> b!9817 (=> (not res!8684) (not e!5630))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun minValue!1434 () V!795)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!795)

(declare-datatypes ((tuple2!276 0))(
  ( (tuple2!277 (_1!138 (_ BitVec 64)) (_2!138 V!795)) )
))
(declare-datatypes ((List!288 0))(
  ( (Nil!285) (Cons!284 (h!850 tuple2!276) (t!2433 List!288)) )
))
(declare-datatypes ((ListLongMap!281 0))(
  ( (ListLongMap!282 (toList!156 List!288)) )
))
(declare-fun contains!135 (ListLongMap!281 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!115 (array!861 array!859 (_ BitVec 32) (_ BitVec 32) V!795 V!795 (_ BitVec 32) Int) ListLongMap!281)

(assert (=> b!9817 (= res!8684 (contains!135 (getCurrentListMap!115 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!9818 () Bool)

(declare-fun res!8683 () Bool)

(assert (=> b!9818 (=> (not res!8683) (not e!5630))))

(declare-datatypes ((List!289 0))(
  ( (Nil!286) (Cons!285 (h!851 (_ BitVec 64)) (t!2434 List!289)) )
))
(declare-fun arrayNoDuplicates!0 (array!861 (_ BitVec 32) List!289) Bool)

(assert (=> b!9818 (= res!8683 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!286))))

(declare-fun b!9819 () Bool)

(declare-fun res!8690 () Bool)

(assert (=> b!9819 (=> (not res!8690) (not e!5630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9819 (= res!8690 (validKeyInArray!0 k!1278))))

(declare-datatypes ((SeekEntryResult!37 0))(
  ( (MissingZero!37 (index!2267 (_ BitVec 32))) (Found!37 (index!2268 (_ BitVec 32))) (Intermediate!37 (undefined!849 Bool) (index!2269 (_ BitVec 32)) (x!2817 (_ BitVec 32))) (Undefined!37) (MissingVacant!37 (index!2270 (_ BitVec 32))) )
))
(declare-fun lt!2318 () SeekEntryResult!37)

(declare-fun b!9820 () Bool)

(declare-fun e!5631 () Bool)

(assert (=> b!9820 (= e!5631 (= (select (arr!414 _keys!1806) (index!2268 lt!2318)) k!1278))))

(declare-fun b!9821 () Bool)

(declare-fun e!5627 () Bool)

(assert (=> b!9821 (= e!5627 e!5631)))

(declare-fun res!8693 () Bool)

(assert (=> b!9821 (=> (not res!8693) (not e!5631))))

(assert (=> b!9821 (= res!8693 (is-Found!37 lt!2318))))

(declare-fun lt!2316 () (_ BitVec 32))

(assert (=> b!9821 (and (is-Found!37 lt!2318) (= (index!2268 lt!2318) lt!2316))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!861 (_ BitVec 32)) SeekEntryResult!37)

(assert (=> b!9821 (= lt!2318 (seekEntry!0 k!1278 _keys!1806 mask!2250))))

(declare-datatypes ((Unit!199 0))(
  ( (Unit!200) )
))
(declare-fun lt!2315 () Unit!199)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!861 (_ BitVec 32)) Unit!199)

(assert (=> b!9821 (= lt!2315 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1278 lt!2316 _keys!1806 mask!2250))))

(declare-fun b!9822 () Bool)

(declare-fun e!5632 () Bool)

(assert (=> b!9822 (= e!5630 (not e!5632))))

(declare-fun res!8689 () Bool)

(assert (=> b!9822 (=> res!8689 e!5632)))

(assert (=> b!9822 (= res!8689 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!9822 e!5626))

(declare-fun c!820 () Bool)

(assert (=> b!9822 (= c!820 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!2317 () Unit!199)

(declare-fun lemmaKeyInListMapIsInArray!74 (array!861 array!859 (_ BitVec 32) (_ BitVec 32) V!795 V!795 (_ BitVec 64) Int) Unit!199)

(assert (=> b!9822 (= lt!2317 (lemmaKeyInListMapIsInArray!74 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!9823 () Bool)

(declare-fun e!5633 () Bool)

(declare-fun tp_is_empty!463 () Bool)

(assert (=> b!9823 (= e!5633 tp_is_empty!463)))

(declare-fun mapIsEmpty!680 () Bool)

(assert (=> mapIsEmpty!680 mapRes!680))

(declare-fun b!9824 () Bool)

(declare-fun res!8687 () Bool)

(assert (=> b!9824 (=> res!8687 e!5627)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!861 (_ BitVec 32)) SeekEntryResult!37)

(assert (=> b!9824 (= res!8687 (not (= (seekEntryOrOpen!0 k!1278 _keys!1806 mask!2250) (Found!37 lt!2316))))))

(declare-fun b!9825 () Bool)

(assert (=> b!9825 (= e!5626 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!9826 () Bool)

(declare-fun res!8692 () Bool)

(assert (=> b!9826 (=> (not res!8692) (not e!5630))))

(assert (=> b!9826 (= res!8692 (and (= (size!475 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!476 _keys!1806) (size!475 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!9827 () Bool)

(declare-fun e!5625 () Bool)

(assert (=> b!9827 (= e!5625 (and e!5633 mapRes!680))))

(declare-fun condMapEmpty!680 () Bool)

(declare-fun mapDefault!680 () ValueCell!215)

