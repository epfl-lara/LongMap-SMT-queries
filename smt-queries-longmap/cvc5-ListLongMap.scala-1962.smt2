; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34518 () Bool)

(assert start!34518)

(declare-fun b_free!7441 () Bool)

(declare-fun b_next!7441 () Bool)

(assert (=> start!34518 (= b_free!7441 (not b_next!7441))))

(declare-fun tp!25868 () Bool)

(declare-fun b_and!14649 () Bool)

(assert (=> start!34518 (= tp!25868 b_and!14649)))

(declare-fun b!345001 () Bool)

(declare-fun e!211463 () Bool)

(declare-fun tp_is_empty!7393 () Bool)

(assert (=> b!345001 (= e!211463 tp_is_empty!7393)))

(declare-fun mapNonEmpty!12528 () Bool)

(declare-fun mapRes!12528 () Bool)

(declare-fun tp!25869 () Bool)

(assert (=> mapNonEmpty!12528 (= mapRes!12528 (and tp!25869 e!211463))))

(declare-datatypes ((V!10835 0))(
  ( (V!10836 (val!3741 Int)) )
))
(declare-datatypes ((ValueCell!3353 0))(
  ( (ValueCellFull!3353 (v!5917 V!10835)) (EmptyCell!3353) )
))
(declare-fun mapRest!12528 () (Array (_ BitVec 32) ValueCell!3353))

(declare-fun mapKey!12528 () (_ BitVec 32))

(declare-datatypes ((array!18369 0))(
  ( (array!18370 (arr!8701 (Array (_ BitVec 32) ValueCell!3353)) (size!9053 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18369)

(declare-fun mapValue!12528 () ValueCell!3353)

(assert (=> mapNonEmpty!12528 (= (arr!8701 _values!1525) (store mapRest!12528 mapKey!12528 mapValue!12528))))

(declare-fun b!345002 () Bool)

(declare-fun res!190862 () Bool)

(declare-fun e!211461 () Bool)

(assert (=> b!345002 (=> (not res!190862) (not e!211461))))

(declare-datatypes ((array!18371 0))(
  ( (array!18372 (arr!8702 (Array (_ BitVec 32) (_ BitVec 64))) (size!9054 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18371)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun mask!2385 () (_ BitVec 32))

(assert (=> b!345002 (= res!190862 (and (= (size!9053 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9054 _keys!1895) (size!9053 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345004 () Bool)

(declare-fun e!211464 () Bool)

(declare-fun e!211462 () Bool)

(assert (=> b!345004 (= e!211464 (and e!211462 mapRes!12528))))

(declare-fun condMapEmpty!12528 () Bool)

(declare-fun mapDefault!12528 () ValueCell!3353)

