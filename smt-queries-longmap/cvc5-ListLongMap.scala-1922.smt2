; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34178 () Bool)

(assert start!34178)

(declare-fun b_free!7201 () Bool)

(declare-fun b_next!7201 () Bool)

(assert (=> start!34178 (= b_free!7201 (not b_next!7201))))

(declare-fun tp!25137 () Bool)

(declare-fun b_and!14401 () Bool)

(assert (=> start!34178 (= tp!25137 b_and!14401)))

(declare-fun res!188185 () Bool)

(declare-fun e!208972 () Bool)

(assert (=> start!34178 (=> (not res!188185) (not e!208972))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34178 (= res!188185 (validMask!0 mask!2385))))

(assert (=> start!34178 e!208972))

(assert (=> start!34178 true))

(declare-fun tp_is_empty!7153 () Bool)

(assert (=> start!34178 tp_is_empty!7153))

(assert (=> start!34178 tp!25137))

(declare-datatypes ((V!10515 0))(
  ( (V!10516 (val!3621 Int)) )
))
(declare-datatypes ((ValueCell!3233 0))(
  ( (ValueCellFull!3233 (v!5793 V!10515)) (EmptyCell!3233) )
))
(declare-datatypes ((array!17909 0))(
  ( (array!17910 (arr!8475 (Array (_ BitVec 32) ValueCell!3233)) (size!8827 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17909)

(declare-fun e!208974 () Bool)

(declare-fun array_inv!6278 (array!17909) Bool)

(assert (=> start!34178 (and (array_inv!6278 _values!1525) e!208974)))

(declare-datatypes ((array!17911 0))(
  ( (array!17912 (arr!8476 (Array (_ BitVec 32) (_ BitVec 64))) (size!8828 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17911)

(declare-fun array_inv!6279 (array!17911) Bool)

(assert (=> start!34178 (array_inv!6279 _keys!1895)))

(declare-fun b!340660 () Bool)

(declare-fun e!208973 () Bool)

(assert (=> b!340660 (= e!208973 tp_is_empty!7153)))

(declare-fun b!340661 () Bool)

(declare-fun e!208970 () Bool)

(assert (=> b!340661 (= e!208970 false)))

(declare-fun lt!161628 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17911 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340661 (= lt!161628 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!340662 () Bool)

(declare-fun e!208969 () Bool)

(assert (=> b!340662 (= e!208969 tp_is_empty!7153)))

(declare-fun b!340663 () Bool)

(declare-fun mapRes!12156 () Bool)

(assert (=> b!340663 (= e!208974 (and e!208973 mapRes!12156))))

(declare-fun condMapEmpty!12156 () Bool)

(declare-fun mapDefault!12156 () ValueCell!3233)

