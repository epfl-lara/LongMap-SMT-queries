; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34416 () Bool)

(assert start!34416)

(declare-fun b_free!7339 () Bool)

(declare-fun b_next!7339 () Bool)

(assert (=> start!34416 (= b_free!7339 (not b_next!7339))))

(declare-fun tp!25563 () Bool)

(declare-fun b_and!14547 () Bool)

(assert (=> start!34416 (= tp!25563 b_and!14547)))

(declare-fun b!343625 () Bool)

(declare-fun res!189947 () Bool)

(declare-fun e!210695 () Bool)

(assert (=> b!343625 (=> (not res!189947) (not e!210695))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10699 0))(
  ( (V!10700 (val!3690 Int)) )
))
(declare-datatypes ((ValueCell!3302 0))(
  ( (ValueCellFull!3302 (v!5866 V!10699)) (EmptyCell!3302) )
))
(declare-datatypes ((array!18175 0))(
  ( (array!18176 (arr!8604 (Array (_ BitVec 32) ValueCell!3302)) (size!8956 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18175)

(declare-datatypes ((array!18177 0))(
  ( (array!18178 (arr!8605 (Array (_ BitVec 32) (_ BitVec 64))) (size!8957 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18177)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343625 (= res!189947 (and (= (size!8956 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8957 _keys!1895) (size!8956 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343626 () Bool)

(declare-fun res!189945 () Bool)

(assert (=> b!343626 (=> (not res!189945) (not e!210695))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343626 (= res!189945 (validKeyInArray!0 k!1348))))

(declare-fun b!343627 () Bool)

(declare-fun res!189942 () Bool)

(assert (=> b!343627 (=> (not res!189942) (not e!210695))))

(declare-datatypes ((List!4963 0))(
  ( (Nil!4960) (Cons!4959 (h!5815 (_ BitVec 64)) (t!10079 List!4963)) )
))
(declare-fun arrayNoDuplicates!0 (array!18177 (_ BitVec 32) List!4963) Bool)

(assert (=> b!343627 (= res!189942 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4960))))

(declare-fun mapNonEmpty!12375 () Bool)

(declare-fun mapRes!12375 () Bool)

(declare-fun tp!25562 () Bool)

(declare-fun e!210698 () Bool)

(assert (=> mapNonEmpty!12375 (= mapRes!12375 (and tp!25562 e!210698))))

(declare-fun mapRest!12375 () (Array (_ BitVec 32) ValueCell!3302))

(declare-fun mapValue!12375 () ValueCell!3302)

(declare-fun mapKey!12375 () (_ BitVec 32))

(assert (=> mapNonEmpty!12375 (= (arr!8604 _values!1525) (store mapRest!12375 mapKey!12375 mapValue!12375))))

(declare-fun b!343628 () Bool)

(declare-fun e!210696 () Bool)

(declare-fun tp_is_empty!7291 () Bool)

(assert (=> b!343628 (= e!210696 tp_is_empty!7291)))

(declare-fun b!343629 () Bool)

(assert (=> b!343629 (= e!210695 false)))

(declare-datatypes ((SeekEntryResult!3320 0))(
  ( (MissingZero!3320 (index!15459 (_ BitVec 32))) (Found!3320 (index!15460 (_ BitVec 32))) (Intermediate!3320 (undefined!4132 Bool) (index!15461 (_ BitVec 32)) (x!34202 (_ BitVec 32))) (Undefined!3320) (MissingVacant!3320 (index!15462 (_ BitVec 32))) )
))
(declare-fun lt!162583 () SeekEntryResult!3320)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18177 (_ BitVec 32)) SeekEntryResult!3320)

(assert (=> b!343629 (= lt!162583 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12375 () Bool)

(assert (=> mapIsEmpty!12375 mapRes!12375))

(declare-fun b!343630 () Bool)

(assert (=> b!343630 (= e!210698 tp_is_empty!7291)))

(declare-fun b!343624 () Bool)

(declare-fun res!189944 () Bool)

(assert (=> b!343624 (=> (not res!189944) (not e!210695))))

(declare-fun zeroValue!1467 () V!10699)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10699)

(declare-datatypes ((tuple2!5344 0))(
  ( (tuple2!5345 (_1!2683 (_ BitVec 64)) (_2!2683 V!10699)) )
))
(declare-datatypes ((List!4964 0))(
  ( (Nil!4961) (Cons!4960 (h!5816 tuple2!5344) (t!10080 List!4964)) )
))
(declare-datatypes ((ListLongMap!4257 0))(
  ( (ListLongMap!4258 (toList!2144 List!4964)) )
))
(declare-fun contains!2202 (ListLongMap!4257 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1665 (array!18177 array!18175 (_ BitVec 32) (_ BitVec 32) V!10699 V!10699 (_ BitVec 32) Int) ListLongMap!4257)

(assert (=> b!343624 (= res!189944 (not (contains!2202 (getCurrentListMap!1665 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!189943 () Bool)

(assert (=> start!34416 (=> (not res!189943) (not e!210695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34416 (= res!189943 (validMask!0 mask!2385))))

(assert (=> start!34416 e!210695))

(assert (=> start!34416 true))

(assert (=> start!34416 tp_is_empty!7291))

(assert (=> start!34416 tp!25563))

(declare-fun e!210697 () Bool)

(declare-fun array_inv!6372 (array!18175) Bool)

(assert (=> start!34416 (and (array_inv!6372 _values!1525) e!210697)))

(declare-fun array_inv!6373 (array!18177) Bool)

(assert (=> start!34416 (array_inv!6373 _keys!1895)))

(declare-fun b!343631 () Bool)

(declare-fun res!189946 () Bool)

(assert (=> b!343631 (=> (not res!189946) (not e!210695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18177 (_ BitVec 32)) Bool)

(assert (=> b!343631 (= res!189946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343632 () Bool)

(assert (=> b!343632 (= e!210697 (and e!210696 mapRes!12375))))

(declare-fun condMapEmpty!12375 () Bool)

(declare-fun mapDefault!12375 () ValueCell!3302)

