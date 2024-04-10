; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34206 () Bool)

(assert start!34206)

(declare-fun b_free!7229 () Bool)

(declare-fun b_next!7229 () Bool)

(assert (=> start!34206 (= b_free!7229 (not b_next!7229))))

(declare-fun tp!25220 () Bool)

(declare-fun b_and!14429 () Bool)

(assert (=> start!34206 (= tp!25220 b_and!14429)))

(declare-fun res!188525 () Bool)

(declare-fun e!209222 () Bool)

(assert (=> start!34206 (=> (not res!188525) (not e!209222))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34206 (= res!188525 (validMask!0 mask!2385))))

(assert (=> start!34206 e!209222))

(assert (=> start!34206 true))

(declare-fun tp_is_empty!7181 () Bool)

(assert (=> start!34206 tp_is_empty!7181))

(assert (=> start!34206 tp!25220))

(declare-datatypes ((V!10551 0))(
  ( (V!10552 (val!3635 Int)) )
))
(declare-datatypes ((ValueCell!3247 0))(
  ( (ValueCellFull!3247 (v!5807 V!10551)) (EmptyCell!3247) )
))
(declare-datatypes ((array!17957 0))(
  ( (array!17958 (arr!8499 (Array (_ BitVec 32) ValueCell!3247)) (size!8851 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17957)

(declare-fun e!209225 () Bool)

(declare-fun array_inv!6296 (array!17957) Bool)

(assert (=> start!34206 (and (array_inv!6296 _values!1525) e!209225)))

(declare-datatypes ((array!17959 0))(
  ( (array!17960 (arr!8500 (Array (_ BitVec 32) (_ BitVec 64))) (size!8852 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17959)

(declare-fun array_inv!6297 (array!17959) Bool)

(assert (=> start!34206 (array_inv!6297 _keys!1895)))

(declare-fun b!341122 () Bool)

(declare-fun e!209224 () Bool)

(assert (=> b!341122 (= e!209224 tp_is_empty!7181)))

(declare-fun b!341123 () Bool)

(declare-fun e!209223 () Bool)

(declare-fun mapRes!12198 () Bool)

(assert (=> b!341123 (= e!209225 (and e!209223 mapRes!12198))))

(declare-fun condMapEmpty!12198 () Bool)

(declare-fun mapDefault!12198 () ValueCell!3247)

