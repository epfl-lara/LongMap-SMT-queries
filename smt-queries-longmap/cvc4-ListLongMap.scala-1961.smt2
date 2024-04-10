; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34516 () Bool)

(assert start!34516)

(declare-fun b_free!7439 () Bool)

(declare-fun b_next!7439 () Bool)

(assert (=> start!34516 (= b_free!7439 (not b_next!7439))))

(declare-fun tp!25862 () Bool)

(declare-fun b_and!14647 () Bool)

(assert (=> start!34516 (= tp!25862 b_and!14647)))

(declare-fun res!190847 () Bool)

(declare-fun e!211447 () Bool)

(assert (=> start!34516 (=> (not res!190847) (not e!211447))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34516 (= res!190847 (validMask!0 mask!2385))))

(assert (=> start!34516 e!211447))

(assert (=> start!34516 true))

(declare-fun tp_is_empty!7391 () Bool)

(assert (=> start!34516 tp_is_empty!7391))

(assert (=> start!34516 tp!25862))

(declare-datatypes ((V!10831 0))(
  ( (V!10832 (val!3740 Int)) )
))
(declare-datatypes ((ValueCell!3352 0))(
  ( (ValueCellFull!3352 (v!5916 V!10831)) (EmptyCell!3352) )
))
(declare-datatypes ((array!18365 0))(
  ( (array!18366 (arr!8699 (Array (_ BitVec 32) ValueCell!3352)) (size!9051 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18365)

(declare-fun e!211449 () Bool)

(declare-fun array_inv!6440 (array!18365) Bool)

(assert (=> start!34516 (and (array_inv!6440 _values!1525) e!211449)))

(declare-datatypes ((array!18367 0))(
  ( (array!18368 (arr!8700 (Array (_ BitVec 32) (_ BitVec 64))) (size!9052 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18367)

(declare-fun array_inv!6441 (array!18367) Bool)

(assert (=> start!34516 (array_inv!6441 _keys!1895)))

(declare-fun b!344974 () Bool)

(declare-fun res!190843 () Bool)

(assert (=> b!344974 (=> (not res!190843) (not e!211447))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344974 (= res!190843 (validKeyInArray!0 k!1348))))

(declare-fun b!344975 () Bool)

(declare-fun res!190844 () Bool)

(assert (=> b!344975 (=> (not res!190844) (not e!211447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18367 (_ BitVec 32)) Bool)

(assert (=> b!344975 (= res!190844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344976 () Bool)

(declare-fun e!211445 () Bool)

(assert (=> b!344976 (= e!211445 tp_is_empty!7391)))

(declare-fun mapNonEmpty!12525 () Bool)

(declare-fun mapRes!12525 () Bool)

(declare-fun tp!25863 () Bool)

(assert (=> mapNonEmpty!12525 (= mapRes!12525 (and tp!25863 e!211445))))

(declare-fun mapRest!12525 () (Array (_ BitVec 32) ValueCell!3352))

(declare-fun mapValue!12525 () ValueCell!3352)

(declare-fun mapKey!12525 () (_ BitVec 32))

(assert (=> mapNonEmpty!12525 (= (arr!8699 _values!1525) (store mapRest!12525 mapKey!12525 mapValue!12525))))

(declare-fun b!344977 () Bool)

(declare-fun res!190846 () Bool)

(assert (=> b!344977 (=> (not res!190846) (not e!211447))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344977 (= res!190846 (and (= (size!9051 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9052 _keys!1895) (size!9051 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344978 () Bool)

(declare-fun res!190842 () Bool)

(assert (=> b!344978 (=> (not res!190842) (not e!211447))))

(declare-fun zeroValue!1467 () V!10831)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10831)

(declare-datatypes ((tuple2!5408 0))(
  ( (tuple2!5409 (_1!2715 (_ BitVec 64)) (_2!2715 V!10831)) )
))
(declare-datatypes ((List!5031 0))(
  ( (Nil!5028) (Cons!5027 (h!5883 tuple2!5408) (t!10147 List!5031)) )
))
(declare-datatypes ((ListLongMap!4321 0))(
  ( (ListLongMap!4322 (toList!2176 List!5031)) )
))
(declare-fun contains!2234 (ListLongMap!4321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1697 (array!18367 array!18365 (_ BitVec 32) (_ BitVec 32) V!10831 V!10831 (_ BitVec 32) Int) ListLongMap!4321)

(assert (=> b!344978 (= res!190842 (not (contains!2234 (getCurrentListMap!1697 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!344979 () Bool)

(assert (=> b!344979 (= e!211447 false)))

(declare-datatypes ((SeekEntryResult!3353 0))(
  ( (MissingZero!3353 (index!15591 (_ BitVec 32))) (Found!3353 (index!15592 (_ BitVec 32))) (Intermediate!3353 (undefined!4165 Bool) (index!15593 (_ BitVec 32)) (x!34363 (_ BitVec 32))) (Undefined!3353) (MissingVacant!3353 (index!15594 (_ BitVec 32))) )
))
(declare-fun lt!162733 () SeekEntryResult!3353)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18367 (_ BitVec 32)) SeekEntryResult!3353)

(assert (=> b!344979 (= lt!162733 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!344980 () Bool)

(declare-fun res!190845 () Bool)

(assert (=> b!344980 (=> (not res!190845) (not e!211447))))

(declare-datatypes ((List!5032 0))(
  ( (Nil!5029) (Cons!5028 (h!5884 (_ BitVec 64)) (t!10148 List!5032)) )
))
(declare-fun arrayNoDuplicates!0 (array!18367 (_ BitVec 32) List!5032) Bool)

(assert (=> b!344980 (= res!190845 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5029))))

(declare-fun b!344981 () Bool)

(declare-fun e!211446 () Bool)

(assert (=> b!344981 (= e!211446 tp_is_empty!7391)))

(declare-fun mapIsEmpty!12525 () Bool)

(assert (=> mapIsEmpty!12525 mapRes!12525))

(declare-fun b!344982 () Bool)

(assert (=> b!344982 (= e!211449 (and e!211446 mapRes!12525))))

(declare-fun condMapEmpty!12525 () Bool)

(declare-fun mapDefault!12525 () ValueCell!3352)

