; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34444 () Bool)

(assert start!34444)

(declare-fun b_free!7367 () Bool)

(declare-fun b_next!7367 () Bool)

(assert (=> start!34444 (= b_free!7367 (not b_next!7367))))

(declare-fun tp!25647 () Bool)

(declare-fun b_and!14575 () Bool)

(assert (=> start!34444 (= tp!25647 b_and!14575)))

(declare-fun b!344002 () Bool)

(declare-fun e!210909 () Bool)

(declare-fun tp_is_empty!7319 () Bool)

(assert (=> b!344002 (= e!210909 tp_is_empty!7319)))

(declare-fun b!344003 () Bool)

(declare-fun e!210907 () Bool)

(assert (=> b!344003 (= e!210907 tp_is_empty!7319)))

(declare-fun mapIsEmpty!12417 () Bool)

(declare-fun mapRes!12417 () Bool)

(assert (=> mapIsEmpty!12417 mapRes!12417))

(declare-fun b!344004 () Bool)

(declare-fun res!190194 () Bool)

(declare-fun e!210906 () Bool)

(assert (=> b!344004 (=> (not res!190194) (not e!210906))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10735 0))(
  ( (V!10736 (val!3704 Int)) )
))
(declare-fun zeroValue!1467 () V!10735)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3316 0))(
  ( (ValueCellFull!3316 (v!5880 V!10735)) (EmptyCell!3316) )
))
(declare-datatypes ((array!18229 0))(
  ( (array!18230 (arr!8631 (Array (_ BitVec 32) ValueCell!3316)) (size!8983 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18229)

(declare-datatypes ((array!18231 0))(
  ( (array!18232 (arr!8632 (Array (_ BitVec 32) (_ BitVec 64))) (size!8984 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18231)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10735)

(declare-datatypes ((tuple2!5362 0))(
  ( (tuple2!5363 (_1!2692 (_ BitVec 64)) (_2!2692 V!10735)) )
))
(declare-datatypes ((List!4984 0))(
  ( (Nil!4981) (Cons!4980 (h!5836 tuple2!5362) (t!10100 List!4984)) )
))
(declare-datatypes ((ListLongMap!4275 0))(
  ( (ListLongMap!4276 (toList!2153 List!4984)) )
))
(declare-fun contains!2211 (ListLongMap!4275 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1674 (array!18231 array!18229 (_ BitVec 32) (_ BitVec 32) V!10735 V!10735 (_ BitVec 32) Int) ListLongMap!4275)

(assert (=> b!344004 (= res!190194 (not (contains!2211 (getCurrentListMap!1674 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapNonEmpty!12417 () Bool)

(declare-fun tp!25646 () Bool)

(assert (=> mapNonEmpty!12417 (= mapRes!12417 (and tp!25646 e!210909))))

(declare-fun mapRest!12417 () (Array (_ BitVec 32) ValueCell!3316))

(declare-fun mapValue!12417 () ValueCell!3316)

(declare-fun mapKey!12417 () (_ BitVec 32))

(assert (=> mapNonEmpty!12417 (= (arr!8631 _values!1525) (store mapRest!12417 mapKey!12417 mapValue!12417))))

(declare-fun b!344005 () Bool)

(declare-fun e!210905 () Bool)

(assert (=> b!344005 (= e!210905 (and e!210907 mapRes!12417))))

(declare-fun condMapEmpty!12417 () Bool)

(declare-fun mapDefault!12417 () ValueCell!3316)

