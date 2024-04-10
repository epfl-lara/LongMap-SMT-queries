; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35020 () Bool)

(assert start!35020)

(declare-fun b_free!7709 () Bool)

(declare-fun b_next!7709 () Bool)

(assert (=> start!35020 (= b_free!7709 (not b_next!7709))))

(declare-fun tp!26705 () Bool)

(declare-fun b_and!14939 () Bool)

(assert (=> start!35020 (= tp!26705 b_and!14939)))

(declare-fun b!350942 () Bool)

(declare-fun res!194566 () Bool)

(declare-fun e!214935 () Bool)

(assert (=> b!350942 (=> (not res!194566) (not e!214935))))

(declare-datatypes ((V!11191 0))(
  ( (V!11192 (val!3875 Int)) )
))
(declare-datatypes ((ValueCell!3487 0))(
  ( (ValueCellFull!3487 (v!6062 V!11191)) (EmptyCell!3487) )
))
(declare-datatypes ((array!18909 0))(
  ( (array!18910 (arr!8960 (Array (_ BitVec 32) ValueCell!3487)) (size!9312 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18909)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18911 0))(
  ( (array!18912 (arr!8961 (Array (_ BitVec 32) (_ BitVec 64))) (size!9313 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18911)

(assert (=> b!350942 (= res!194566 (and (= (size!9312 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9313 _keys!1895) (size!9312 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!194568 () Bool)

(assert (=> start!35020 (=> (not res!194568) (not e!214935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35020 (= res!194568 (validMask!0 mask!2385))))

(assert (=> start!35020 e!214935))

(assert (=> start!35020 true))

(declare-fun tp_is_empty!7661 () Bool)

(assert (=> start!35020 tp_is_empty!7661))

(assert (=> start!35020 tp!26705))

(declare-fun e!214936 () Bool)

(declare-fun array_inv!6614 (array!18909) Bool)

(assert (=> start!35020 (and (array_inv!6614 _values!1525) e!214936)))

(declare-fun array_inv!6615 (array!18911) Bool)

(assert (=> start!35020 (array_inv!6615 _keys!1895)))

(declare-fun b!350943 () Bool)

(declare-fun e!214934 () Bool)

(declare-fun mapRes!12963 () Bool)

(assert (=> b!350943 (= e!214936 (and e!214934 mapRes!12963))))

(declare-fun condMapEmpty!12963 () Bool)

(declare-fun mapDefault!12963 () ValueCell!3487)

