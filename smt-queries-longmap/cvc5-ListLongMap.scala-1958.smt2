; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34494 () Bool)

(assert start!34494)

(declare-fun b_free!7417 () Bool)

(declare-fun b_next!7417 () Bool)

(assert (=> start!34494 (= b_free!7417 (not b_next!7417))))

(declare-fun tp!25796 () Bool)

(declare-fun b_and!14625 () Bool)

(assert (=> start!34494 (= tp!25796 b_and!14625)))

(declare-fun b!344677 () Bool)

(declare-fun res!190644 () Bool)

(declare-fun e!211282 () Bool)

(assert (=> b!344677 (=> (not res!190644) (not e!211282))))

(declare-datatypes ((array!18325 0))(
  ( (array!18326 (arr!8679 (Array (_ BitVec 32) (_ BitVec 64))) (size!9031 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18325)

(declare-datatypes ((List!5020 0))(
  ( (Nil!5017) (Cons!5016 (h!5872 (_ BitVec 64)) (t!10136 List!5020)) )
))
(declare-fun arrayNoDuplicates!0 (array!18325 (_ BitVec 32) List!5020) Bool)

(assert (=> b!344677 (= res!190644 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5017))))

(declare-fun b!344679 () Bool)

(declare-fun res!190646 () Bool)

(assert (=> b!344679 (=> (not res!190646) (not e!211282))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10803 0))(
  ( (V!10804 (val!3729 Int)) )
))
(declare-fun zeroValue!1467 () V!10803)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3341 0))(
  ( (ValueCellFull!3341 (v!5905 V!10803)) (EmptyCell!3341) )
))
(declare-datatypes ((array!18327 0))(
  ( (array!18328 (arr!8680 (Array (_ BitVec 32) ValueCell!3341)) (size!9032 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18327)

(declare-fun minValue!1467 () V!10803)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5398 0))(
  ( (tuple2!5399 (_1!2710 (_ BitVec 64)) (_2!2710 V!10803)) )
))
(declare-datatypes ((List!5021 0))(
  ( (Nil!5018) (Cons!5017 (h!5873 tuple2!5398) (t!10137 List!5021)) )
))
(declare-datatypes ((ListLongMap!4311 0))(
  ( (ListLongMap!4312 (toList!2171 List!5021)) )
))
(declare-fun contains!2229 (ListLongMap!4311 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1692 (array!18325 array!18327 (_ BitVec 32) (_ BitVec 32) V!10803 V!10803 (_ BitVec 32) Int) ListLongMap!4311)

(assert (=> b!344679 (= res!190646 (not (contains!2229 (getCurrentListMap!1692 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!344680 () Bool)

(declare-fun e!211283 () Bool)

(declare-fun tp_is_empty!7369 () Bool)

(assert (=> b!344680 (= e!211283 tp_is_empty!7369)))

(declare-fun b!344681 () Bool)

(declare-fun res!190645 () Bool)

(assert (=> b!344681 (=> (not res!190645) (not e!211282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344681 (= res!190645 (validKeyInArray!0 k!1348))))

(declare-fun mapNonEmpty!12492 () Bool)

(declare-fun mapRes!12492 () Bool)

(declare-fun tp!25797 () Bool)

(assert (=> mapNonEmpty!12492 (= mapRes!12492 (and tp!25797 e!211283))))

(declare-fun mapRest!12492 () (Array (_ BitVec 32) ValueCell!3341))

(declare-fun mapValue!12492 () ValueCell!3341)

(declare-fun mapKey!12492 () (_ BitVec 32))

(assert (=> mapNonEmpty!12492 (= (arr!8680 _values!1525) (store mapRest!12492 mapKey!12492 mapValue!12492))))

(declare-fun mapIsEmpty!12492 () Bool)

(assert (=> mapIsEmpty!12492 mapRes!12492))

(declare-fun b!344682 () Bool)

(declare-fun res!190649 () Bool)

(assert (=> b!344682 (=> (not res!190649) (not e!211282))))

(assert (=> b!344682 (= res!190649 (and (= (size!9032 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9031 _keys!1895) (size!9032 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344683 () Bool)

(declare-fun e!211281 () Bool)

(declare-fun e!211284 () Bool)

(assert (=> b!344683 (= e!211281 (and e!211284 mapRes!12492))))

(declare-fun condMapEmpty!12492 () Bool)

(declare-fun mapDefault!12492 () ValueCell!3341)

