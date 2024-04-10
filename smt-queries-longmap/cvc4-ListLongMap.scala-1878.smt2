; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33706 () Bool)

(assert start!33706)

(declare-fun b_free!6941 () Bool)

(declare-fun b_next!6941 () Bool)

(assert (=> start!33706 (= b_free!6941 (not b_next!6941))))

(declare-fun tp!24326 () Bool)

(declare-fun b_and!14121 () Bool)

(assert (=> start!33706 (= tp!24326 b_and!14121)))

(declare-fun mapNonEmpty!11736 () Bool)

(declare-fun mapRes!11736 () Bool)

(declare-fun tp!24327 () Bool)

(declare-fun e!205648 () Bool)

(assert (=> mapNonEmpty!11736 (= mapRes!11736 (and tp!24327 e!205648))))

(declare-fun mapKey!11736 () (_ BitVec 32))

(declare-datatypes ((V!10167 0))(
  ( (V!10168 (val!3491 Int)) )
))
(declare-datatypes ((ValueCell!3103 0))(
  ( (ValueCellFull!3103 (v!5653 V!10167)) (EmptyCell!3103) )
))
(declare-fun mapValue!11736 () ValueCell!3103)

(declare-datatypes ((array!17379 0))(
  ( (array!17380 (arr!8220 (Array (_ BitVec 32) ValueCell!3103)) (size!8572 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17379)

(declare-fun mapRest!11736 () (Array (_ BitVec 32) ValueCell!3103))

(assert (=> mapNonEmpty!11736 (= (arr!8220 _values!1525) (store mapRest!11736 mapKey!11736 mapValue!11736))))

(declare-fun b!335031 () Bool)

(declare-fun e!205646 () Bool)

(declare-fun e!205644 () Bool)

(assert (=> b!335031 (= e!205646 e!205644)))

(declare-fun res!184805 () Bool)

(assert (=> b!335031 (=> (not res!184805) (not e!205644))))

(declare-datatypes ((SeekEntryResult!3177 0))(
  ( (MissingZero!3177 (index!14887 (_ BitVec 32))) (Found!3177 (index!14888 (_ BitVec 32))) (Intermediate!3177 (undefined!3989 Bool) (index!14889 (_ BitVec 32)) (x!33383 (_ BitVec 32))) (Undefined!3177) (MissingVacant!3177 (index!14890 (_ BitVec 32))) )
))
(declare-fun lt!159685 () SeekEntryResult!3177)

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!17381 0))(
  ( (array!17382 (arr!8221 (Array (_ BitVec 32) (_ BitVec 64))) (size!8573 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17381)

(assert (=> b!335031 (= res!184805 (and (is-Found!3177 lt!159685) (= (select (arr!8221 _keys!1895) (index!14888 lt!159685)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17381 (_ BitVec 32)) SeekEntryResult!3177)

(assert (=> b!335031 (= lt!159685 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!335032 () Bool)

(declare-fun res!184806 () Bool)

(assert (=> b!335032 (=> (not res!184806) (not e!205644))))

(declare-fun arrayContainsKey!0 (array!17381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335032 (= res!184806 (arrayContainsKey!0 _keys!1895 k!1348 (index!14888 lt!159685)))))

(declare-fun b!335033 () Bool)

(assert (=> b!335033 (= e!205644 (not true))))

(declare-datatypes ((tuple2!5068 0))(
  ( (tuple2!5069 (_1!2545 (_ BitVec 64)) (_2!2545 V!10167)) )
))
(declare-datatypes ((List!4692 0))(
  ( (Nil!4689) (Cons!4688 (h!5544 tuple2!5068) (t!9780 List!4692)) )
))
(declare-datatypes ((ListLongMap!3981 0))(
  ( (ListLongMap!3982 (toList!2006 List!4692)) )
))
(declare-fun lt!159682 () ListLongMap!3981)

(declare-fun contains!2050 (ListLongMap!3981 (_ BitVec 64)) Bool)

(assert (=> b!335033 (contains!2050 lt!159682 (select (arr!8221 _keys!1895) (index!14888 lt!159685)))))

(declare-fun zeroValue!1467 () V!10167)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((Unit!10423 0))(
  ( (Unit!10424) )
))
(declare-fun lt!159683 () Unit!10423)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10167)

(declare-fun lemmaValidKeyInArrayIsInListMap!158 (array!17381 array!17379 (_ BitVec 32) (_ BitVec 32) V!10167 V!10167 (_ BitVec 32) Int) Unit!10423)

(assert (=> b!335033 (= lt!159683 (lemmaValidKeyInArrayIsInListMap!158 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14888 lt!159685) defaultEntry!1528))))

(assert (=> b!335033 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159684 () Unit!10423)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17381 (_ BitVec 64) (_ BitVec 32)) Unit!10423)

(assert (=> b!335033 (= lt!159684 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14888 lt!159685)))))

(declare-fun mapIsEmpty!11736 () Bool)

(assert (=> mapIsEmpty!11736 mapRes!11736))

(declare-fun b!335034 () Bool)

(declare-fun res!184810 () Bool)

(declare-fun e!205650 () Bool)

(assert (=> b!335034 (=> (not res!184810) (not e!205650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17381 (_ BitVec 32)) Bool)

(assert (=> b!335034 (= res!184810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335035 () Bool)

(declare-fun tp_is_empty!6893 () Bool)

(assert (=> b!335035 (= e!205648 tp_is_empty!6893)))

(declare-fun b!335036 () Bool)

(declare-fun e!205647 () Bool)

(declare-fun e!205645 () Bool)

(assert (=> b!335036 (= e!205647 (and e!205645 mapRes!11736))))

(declare-fun condMapEmpty!11736 () Bool)

(declare-fun mapDefault!11736 () ValueCell!3103)

