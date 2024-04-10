; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40202 () Bool)

(assert start!40202)

(declare-fun b_free!10469 () Bool)

(declare-fun b_next!10469 () Bool)

(assert (=> start!40202 (= b_free!10469 (not b_next!10469))))

(declare-fun tp!36936 () Bool)

(declare-fun b_and!18437 () Bool)

(assert (=> start!40202 (= tp!36936 b_and!18437)))

(declare-fun b!440612 () Bool)

(declare-fun res!260641 () Bool)

(declare-fun e!259571 () Bool)

(assert (=> b!440612 (=> (not res!260641) (not e!259571))))

(declare-datatypes ((array!27055 0))(
  ( (array!27056 (arr!12977 (Array (_ BitVec 32) (_ BitVec 64))) (size!13329 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27055)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440612 (= res!260641 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!440613 () Bool)

(declare-fun res!260639 () Bool)

(assert (=> b!440613 (=> (not res!260639) (not e!259571))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27055 (_ BitVec 32)) Bool)

(assert (=> b!440613 (= res!260639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440614 () Bool)

(declare-fun e!259569 () Bool)

(declare-fun tp_is_empty!11621 () Bool)

(assert (=> b!440614 (= e!259569 tp_is_empty!11621)))

(declare-fun b!440615 () Bool)

(declare-fun res!260638 () Bool)

(assert (=> b!440615 (=> (not res!260638) (not e!259571))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440615 (= res!260638 (or (= (select (arr!12977 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12977 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440616 () Bool)

(declare-fun e!259566 () Bool)

(declare-fun e!259568 () Bool)

(declare-fun mapRes!19053 () Bool)

(assert (=> b!440616 (= e!259566 (and e!259568 mapRes!19053))))

(declare-fun condMapEmpty!19053 () Bool)

(declare-datatypes ((V!16599 0))(
  ( (V!16600 (val!5855 Int)) )
))
(declare-datatypes ((ValueCell!5467 0))(
  ( (ValueCellFull!5467 (v!8102 V!16599)) (EmptyCell!5467) )
))
(declare-datatypes ((array!27057 0))(
  ( (array!27058 (arr!12978 (Array (_ BitVec 32) ValueCell!5467)) (size!13330 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27057)

(declare-fun mapDefault!19053 () ValueCell!5467)

