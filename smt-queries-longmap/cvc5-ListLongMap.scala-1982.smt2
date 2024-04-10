; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34776 () Bool)

(assert start!34776)

(declare-fun b_free!7561 () Bool)

(declare-fun b_next!7561 () Bool)

(assert (=> start!34776 (= b_free!7561 (not b_next!7561))))

(declare-fun tp!26250 () Bool)

(declare-fun b_and!14783 () Bool)

(assert (=> start!34776 (= tp!26250 b_and!14783)))

(declare-fun b!347816 () Bool)

(declare-fun res!192568 () Bool)

(declare-fun e!213116 () Bool)

(assert (=> b!347816 (=> (not res!192568) (not e!213116))))

(declare-datatypes ((array!18615 0))(
  ( (array!18616 (arr!8817 (Array (_ BitVec 32) (_ BitVec 64))) (size!9169 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18615)

(declare-datatypes ((List!5121 0))(
  ( (Nil!5118) (Cons!5117 (h!5973 (_ BitVec 64)) (t!10251 List!5121)) )
))
(declare-fun arrayNoDuplicates!0 (array!18615 (_ BitVec 32) List!5121) Bool)

(assert (=> b!347816 (= res!192568 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5118))))

(declare-fun b!347817 () Bool)

(declare-fun e!213120 () Bool)

(declare-fun e!213118 () Bool)

(assert (=> b!347817 (= e!213120 e!213118)))

(declare-fun res!192563 () Bool)

(assert (=> b!347817 (=> (not res!192563) (not e!213118))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3402 0))(
  ( (MissingZero!3402 (index!15787 (_ BitVec 32))) (Found!3402 (index!15788 (_ BitVec 32))) (Intermediate!3402 (undefined!4214 Bool) (index!15789 (_ BitVec 32)) (x!34650 (_ BitVec 32))) (Undefined!3402) (MissingVacant!3402 (index!15790 (_ BitVec 32))) )
))
(declare-fun lt!163714 () SeekEntryResult!3402)

(assert (=> b!347817 (= res!192563 (and (is-Found!3402 lt!163714) (= (select (arr!8817 _keys!1895) (index!15788 lt!163714)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18615 (_ BitVec 32)) SeekEntryResult!3402)

(assert (=> b!347817 (= lt!163714 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!347818 () Bool)

(declare-fun res!192561 () Bool)

(assert (=> b!347818 (=> (not res!192561) (not e!213116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18615 (_ BitVec 32)) Bool)

(assert (=> b!347818 (= res!192561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12729 () Bool)

(declare-fun mapRes!12729 () Bool)

(declare-fun tp!26249 () Bool)

(declare-fun e!213119 () Bool)

(assert (=> mapNonEmpty!12729 (= mapRes!12729 (and tp!26249 e!213119))))

(declare-datatypes ((V!10995 0))(
  ( (V!10996 (val!3801 Int)) )
))
(declare-datatypes ((ValueCell!3413 0))(
  ( (ValueCellFull!3413 (v!5984 V!10995)) (EmptyCell!3413) )
))
(declare-fun mapRest!12729 () (Array (_ BitVec 32) ValueCell!3413))

(declare-datatypes ((array!18617 0))(
  ( (array!18618 (arr!8818 (Array (_ BitVec 32) ValueCell!3413)) (size!9170 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18617)

(declare-fun mapValue!12729 () ValueCell!3413)

(declare-fun mapKey!12729 () (_ BitVec 32))

(assert (=> mapNonEmpty!12729 (= (arr!8818 _values!1525) (store mapRest!12729 mapKey!12729 mapValue!12729))))

(declare-fun b!347819 () Bool)

(declare-fun e!213122 () Bool)

(declare-fun tp_is_empty!7513 () Bool)

(assert (=> b!347819 (= e!213122 tp_is_empty!7513)))

(declare-fun res!192565 () Bool)

(assert (=> start!34776 (=> (not res!192565) (not e!213116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34776 (= res!192565 (validMask!0 mask!2385))))

(assert (=> start!34776 e!213116))

(assert (=> start!34776 true))

(assert (=> start!34776 tp_is_empty!7513))

(assert (=> start!34776 tp!26250))

(declare-fun e!213117 () Bool)

(declare-fun array_inv!6528 (array!18617) Bool)

(assert (=> start!34776 (and (array_inv!6528 _values!1525) e!213117)))

(declare-fun array_inv!6529 (array!18615) Bool)

(assert (=> start!34776 (array_inv!6529 _keys!1895)))

(declare-fun mapIsEmpty!12729 () Bool)

(assert (=> mapIsEmpty!12729 mapRes!12729))

(declare-fun b!347820 () Bool)

(assert (=> b!347820 (= e!213117 (and e!213122 mapRes!12729))))

(declare-fun condMapEmpty!12729 () Bool)

(declare-fun mapDefault!12729 () ValueCell!3413)

