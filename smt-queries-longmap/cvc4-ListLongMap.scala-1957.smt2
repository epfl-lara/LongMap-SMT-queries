; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34492 () Bool)

(assert start!34492)

(declare-fun b_free!7415 () Bool)

(declare-fun b_next!7415 () Bool)

(assert (=> start!34492 (= b_free!7415 (not b_next!7415))))

(declare-fun tp!25790 () Bool)

(declare-fun b_and!14623 () Bool)

(assert (=> start!34492 (= tp!25790 b_and!14623)))

(declare-fun b!344650 () Bool)

(declare-fun res!190629 () Bool)

(declare-fun e!211269 () Bool)

(assert (=> b!344650 (=> (not res!190629) (not e!211269))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18321 0))(
  ( (array!18322 (arr!8677 (Array (_ BitVec 32) (_ BitVec 64))) (size!9029 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18321)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((V!10799 0))(
  ( (V!10800 (val!3728 Int)) )
))
(declare-datatypes ((ValueCell!3340 0))(
  ( (ValueCellFull!3340 (v!5904 V!10799)) (EmptyCell!3340) )
))
(declare-datatypes ((array!18323 0))(
  ( (array!18324 (arr!8678 (Array (_ BitVec 32) ValueCell!3340)) (size!9030 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18323)

(assert (=> b!344650 (= res!190629 (and (= (size!9030 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9029 _keys!1895) (size!9030 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344651 () Bool)

(assert (=> b!344651 (= e!211269 false)))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3345 0))(
  ( (MissingZero!3345 (index!15559 (_ BitVec 32))) (Found!3345 (index!15560 (_ BitVec 32))) (Intermediate!3345 (undefined!4157 Bool) (index!15561 (_ BitVec 32)) (x!34323 (_ BitVec 32))) (Undefined!3345) (MissingVacant!3345 (index!15562 (_ BitVec 32))) )
))
(declare-fun lt!162697 () SeekEntryResult!3345)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18321 (_ BitVec 32)) SeekEntryResult!3345)

(assert (=> b!344651 (= lt!162697 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!344652 () Bool)

(declare-fun e!211268 () Bool)

(declare-fun tp_is_empty!7367 () Bool)

(assert (=> b!344652 (= e!211268 tp_is_empty!7367)))

(declare-fun b!344654 () Bool)

(declare-fun e!211265 () Bool)

(assert (=> b!344654 (= e!211265 tp_is_empty!7367)))

(declare-fun b!344655 () Bool)

(declare-fun res!190628 () Bool)

(assert (=> b!344655 (=> (not res!190628) (not e!211269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344655 (= res!190628 (validKeyInArray!0 k!1348))))

(declare-fun mapNonEmpty!12489 () Bool)

(declare-fun mapRes!12489 () Bool)

(declare-fun tp!25791 () Bool)

(assert (=> mapNonEmpty!12489 (= mapRes!12489 (and tp!25791 e!211265))))

(declare-fun mapKey!12489 () (_ BitVec 32))

(declare-fun mapValue!12489 () ValueCell!3340)

(declare-fun mapRest!12489 () (Array (_ BitVec 32) ValueCell!3340))

(assert (=> mapNonEmpty!12489 (= (arr!8678 _values!1525) (store mapRest!12489 mapKey!12489 mapValue!12489))))

(declare-fun b!344656 () Bool)

(declare-fun res!190631 () Bool)

(assert (=> b!344656 (=> (not res!190631) (not e!211269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18321 (_ BitVec 32)) Bool)

(assert (=> b!344656 (= res!190631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12489 () Bool)

(assert (=> mapIsEmpty!12489 mapRes!12489))

(declare-fun b!344653 () Bool)

(declare-fun res!190630 () Bool)

(assert (=> b!344653 (=> (not res!190630) (not e!211269))))

(declare-datatypes ((List!5019 0))(
  ( (Nil!5016) (Cons!5015 (h!5871 (_ BitVec 64)) (t!10135 List!5019)) )
))
(declare-fun arrayNoDuplicates!0 (array!18321 (_ BitVec 32) List!5019) Bool)

(assert (=> b!344653 (= res!190630 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5016))))

(declare-fun res!190627 () Bool)

(assert (=> start!34492 (=> (not res!190627) (not e!211269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34492 (= res!190627 (validMask!0 mask!2385))))

(assert (=> start!34492 e!211269))

(assert (=> start!34492 true))

(assert (=> start!34492 tp_is_empty!7367))

(assert (=> start!34492 tp!25790))

(declare-fun e!211266 () Bool)

(declare-fun array_inv!6426 (array!18323) Bool)

(assert (=> start!34492 (and (array_inv!6426 _values!1525) e!211266)))

(declare-fun array_inv!6427 (array!18321) Bool)

(assert (=> start!34492 (array_inv!6427 _keys!1895)))

(declare-fun b!344657 () Bool)

(assert (=> b!344657 (= e!211266 (and e!211268 mapRes!12489))))

(declare-fun condMapEmpty!12489 () Bool)

(declare-fun mapDefault!12489 () ValueCell!3340)

