; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35232 () Bool)

(assert start!35232)

(declare-fun b_free!7807 () Bool)

(declare-fun b_next!7807 () Bool)

(assert (=> start!35232 (= b_free!7807 (not b_next!7807))))

(declare-fun tp!27014 () Bool)

(declare-fun b_and!15047 () Bool)

(assert (=> start!35232 (= tp!27014 b_and!15047)))

(declare-fun b!353231 () Bool)

(declare-fun res!195887 () Bool)

(declare-fun e!216285 () Bool)

(assert (=> b!353231 (=> (not res!195887) (not e!216285))))

(declare-datatypes ((array!19109 0))(
  ( (array!19110 (arr!9055 (Array (_ BitVec 32) (_ BitVec 64))) (size!9407 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19109)

(declare-datatypes ((List!5274 0))(
  ( (Nil!5271) (Cons!5270 (h!6126 (_ BitVec 64)) (t!10422 List!5274)) )
))
(declare-fun arrayNoDuplicates!0 (array!19109 (_ BitVec 32) List!5274) Bool)

(assert (=> b!353231 (= res!195887 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5271))))

(declare-fun res!195889 () Bool)

(assert (=> start!35232 (=> (not res!195889) (not e!216285))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35232 (= res!195889 (validMask!0 mask!2385))))

(assert (=> start!35232 e!216285))

(assert (=> start!35232 true))

(declare-fun tp_is_empty!7759 () Bool)

(assert (=> start!35232 tp_is_empty!7759))

(assert (=> start!35232 tp!27014))

(declare-datatypes ((V!11323 0))(
  ( (V!11324 (val!3924 Int)) )
))
(declare-datatypes ((ValueCell!3536 0))(
  ( (ValueCellFull!3536 (v!6116 V!11323)) (EmptyCell!3536) )
))
(declare-datatypes ((array!19111 0))(
  ( (array!19112 (arr!9056 (Array (_ BitVec 32) ValueCell!3536)) (size!9408 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19111)

(declare-fun e!216286 () Bool)

(declare-fun array_inv!6672 (array!19111) Bool)

(assert (=> start!35232 (and (array_inv!6672 _values!1525) e!216286)))

(declare-fun array_inv!6673 (array!19109) Bool)

(assert (=> start!35232 (array_inv!6673 _keys!1895)))

(declare-fun b!353232 () Bool)

(declare-fun res!195888 () Bool)

(assert (=> b!353232 (=> (not res!195888) (not e!216285))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11323)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11323)

(declare-datatypes ((tuple2!5656 0))(
  ( (tuple2!5657 (_1!2839 (_ BitVec 64)) (_2!2839 V!11323)) )
))
(declare-datatypes ((List!5275 0))(
  ( (Nil!5272) (Cons!5271 (h!6127 tuple2!5656) (t!10423 List!5275)) )
))
(declare-datatypes ((ListLongMap!4569 0))(
  ( (ListLongMap!4570 (toList!2300 List!5275)) )
))
(declare-fun contains!2374 (ListLongMap!4569 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1821 (array!19109 array!19111 (_ BitVec 32) (_ BitVec 32) V!11323 V!11323 (_ BitVec 32) Int) ListLongMap!4569)

(assert (=> b!353232 (= res!195888 (not (contains!2374 (getCurrentListMap!1821 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!353233 () Bool)

(declare-fun e!216287 () Bool)

(assert (=> b!353233 (= e!216287 tp_is_empty!7759)))

(declare-fun mapIsEmpty!13125 () Bool)

(declare-fun mapRes!13125 () Bool)

(assert (=> mapIsEmpty!13125 mapRes!13125))

(declare-fun b!353234 () Bool)

(declare-datatypes ((SeekEntryResult!3483 0))(
  ( (MissingZero!3483 (index!16111 (_ BitVec 32))) (Found!3483 (index!16112 (_ BitVec 32))) (Intermediate!3483 (undefined!4295 Bool) (index!16113 (_ BitVec 32)) (x!35149 (_ BitVec 32))) (Undefined!3483) (MissingVacant!3483 (index!16114 (_ BitVec 32))) )
))
(declare-fun lt!165472 () SeekEntryResult!3483)

(assert (=> b!353234 (= e!216285 (and (not (is-Found!3483 lt!165472)) (not (is-MissingZero!3483 lt!165472)) (not (is-MissingVacant!3483 lt!165472)) (not (is-Undefined!3483 lt!165472))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19109 (_ BitVec 32)) SeekEntryResult!3483)

(assert (=> b!353234 (= lt!165472 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!353235 () Bool)

(declare-fun res!195890 () Bool)

(assert (=> b!353235 (=> (not res!195890) (not e!216285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353235 (= res!195890 (validKeyInArray!0 k!1348))))

(declare-fun b!353236 () Bool)

(declare-fun e!216284 () Bool)

(assert (=> b!353236 (= e!216286 (and e!216284 mapRes!13125))))

(declare-fun condMapEmpty!13125 () Bool)

(declare-fun mapDefault!13125 () ValueCell!3536)

