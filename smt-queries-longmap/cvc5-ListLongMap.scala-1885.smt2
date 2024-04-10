; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33744 () Bool)

(assert start!33744)

(declare-fun b_free!6979 () Bool)

(declare-fun b_next!6979 () Bool)

(assert (=> start!33744 (= b_free!6979 (not b_next!6979))))

(declare-fun tp!24441 () Bool)

(declare-fun b_and!14159 () Bool)

(assert (=> start!33744 (= tp!24441 b_and!14159)))

(declare-fun res!185261 () Bool)

(declare-fun e!206043 () Bool)

(assert (=> start!33744 (=> (not res!185261) (not e!206043))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33744 (= res!185261 (validMask!0 mask!2385))))

(assert (=> start!33744 e!206043))

(assert (=> start!33744 true))

(declare-fun tp_is_empty!6931 () Bool)

(assert (=> start!33744 tp_is_empty!6931))

(assert (=> start!33744 tp!24441))

(declare-datatypes ((V!10219 0))(
  ( (V!10220 (val!3510 Int)) )
))
(declare-datatypes ((ValueCell!3122 0))(
  ( (ValueCellFull!3122 (v!5672 V!10219)) (EmptyCell!3122) )
))
(declare-datatypes ((array!17455 0))(
  ( (array!17456 (arr!8258 (Array (_ BitVec 32) ValueCell!3122)) (size!8610 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17455)

(declare-fun e!206049 () Bool)

(declare-fun array_inv!6132 (array!17455) Bool)

(assert (=> start!33744 (and (array_inv!6132 _values!1525) e!206049)))

(declare-datatypes ((array!17457 0))(
  ( (array!17458 (arr!8259 (Array (_ BitVec 32) (_ BitVec 64))) (size!8611 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17457)

(declare-fun array_inv!6133 (array!17457) Bool)

(assert (=> start!33744 (array_inv!6133 _keys!1895)))

(declare-fun b!335658 () Bool)

(declare-fun e!206044 () Bool)

(assert (=> b!335658 (= e!206044 tp_is_empty!6931)))

(declare-fun b!335659 () Bool)

(declare-fun e!206046 () Bool)

(declare-fun mapRes!11793 () Bool)

(assert (=> b!335659 (= e!206049 (and e!206046 mapRes!11793))))

(declare-fun condMapEmpty!11793 () Bool)

(declare-fun mapDefault!11793 () ValueCell!3122)

