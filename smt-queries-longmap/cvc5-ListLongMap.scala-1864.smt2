; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33618 () Bool)

(assert start!33618)

(declare-fun b_free!6853 () Bool)

(declare-fun b_next!6853 () Bool)

(assert (=> start!33618 (= b_free!6853 (not b_next!6853))))

(declare-fun tp!24062 () Bool)

(declare-fun b_and!14033 () Bool)

(assert (=> start!33618 (= tp!24062 b_and!14033)))

(declare-fun b!333611 () Bool)

(declare-fun res!183781 () Bool)

(declare-fun e!204842 () Bool)

(assert (=> b!333611 (=> (not res!183781) (not e!204842))))

(declare-datatypes ((array!17205 0))(
  ( (array!17206 (arr!8133 (Array (_ BitVec 32) (_ BitVec 64))) (size!8485 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17205)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17205 (_ BitVec 32)) Bool)

(assert (=> b!333611 (= res!183781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333612 () Bool)

(declare-fun res!183785 () Bool)

(assert (=> b!333612 (=> (not res!183785) (not e!204842))))

(declare-datatypes ((V!10051 0))(
  ( (V!10052 (val!3447 Int)) )
))
(declare-datatypes ((ValueCell!3059 0))(
  ( (ValueCellFull!3059 (v!5609 V!10051)) (EmptyCell!3059) )
))
(declare-datatypes ((array!17207 0))(
  ( (array!17208 (arr!8134 (Array (_ BitVec 32) ValueCell!3059)) (size!8486 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17207)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333612 (= res!183785 (and (= (size!8486 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8485 _keys!1895) (size!8486 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11604 () Bool)

(declare-fun mapRes!11604 () Bool)

(assert (=> mapIsEmpty!11604 mapRes!11604))

(declare-fun b!333613 () Bool)

(declare-fun e!204845 () Bool)

(declare-fun tp_is_empty!6805 () Bool)

(assert (=> b!333613 (= e!204845 tp_is_empty!6805)))

(declare-fun res!183780 () Bool)

(assert (=> start!33618 (=> (not res!183780) (not e!204842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33618 (= res!183780 (validMask!0 mask!2385))))

(assert (=> start!33618 e!204842))

(assert (=> start!33618 true))

(assert (=> start!33618 tp_is_empty!6805))

(assert (=> start!33618 tp!24062))

(declare-fun e!204844 () Bool)

(declare-fun array_inv!6048 (array!17207) Bool)

(assert (=> start!33618 (and (array_inv!6048 _values!1525) e!204844)))

(declare-fun array_inv!6049 (array!17205) Bool)

(assert (=> start!33618 (array_inv!6049 _keys!1895)))

(declare-fun b!333614 () Bool)

(assert (=> b!333614 (= e!204844 (and e!204845 mapRes!11604))))

(declare-fun condMapEmpty!11604 () Bool)

(declare-fun mapDefault!11604 () ValueCell!3059)

