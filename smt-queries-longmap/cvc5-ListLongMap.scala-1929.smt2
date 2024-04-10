; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34220 () Bool)

(assert start!34220)

(declare-fun b_free!7243 () Bool)

(declare-fun b_next!7243 () Bool)

(assert (=> start!34220 (= b_free!7243 (not b_next!7243))))

(declare-fun tp!25262 () Bool)

(declare-fun b_and!14443 () Bool)

(assert (=> start!34220 (= tp!25262 b_and!14443)))

(declare-fun mapNonEmpty!12219 () Bool)

(declare-fun mapRes!12219 () Bool)

(declare-fun tp!25263 () Bool)

(declare-fun e!209348 () Bool)

(assert (=> mapNonEmpty!12219 (= mapRes!12219 (and tp!25263 e!209348))))

(declare-fun mapKey!12219 () (_ BitVec 32))

(declare-datatypes ((V!10571 0))(
  ( (V!10572 (val!3642 Int)) )
))
(declare-datatypes ((ValueCell!3254 0))(
  ( (ValueCellFull!3254 (v!5814 V!10571)) (EmptyCell!3254) )
))
(declare-datatypes ((array!17985 0))(
  ( (array!17986 (arr!8513 (Array (_ BitVec 32) ValueCell!3254)) (size!8865 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17985)

(declare-fun mapRest!12219 () (Array (_ BitVec 32) ValueCell!3254))

(declare-fun mapValue!12219 () ValueCell!3254)

(assert (=> mapNonEmpty!12219 (= (arr!8513 _values!1525) (store mapRest!12219 mapKey!12219 mapValue!12219))))

(declare-fun b!341353 () Bool)

(declare-fun res!188692 () Bool)

(declare-fun e!209347 () Bool)

(assert (=> b!341353 (=> (not res!188692) (not e!209347))))

(declare-datatypes ((array!17987 0))(
  ( (array!17988 (arr!8514 (Array (_ BitVec 32) (_ BitVec 64))) (size!8866 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17987)

(declare-datatypes ((List!4898 0))(
  ( (Nil!4895) (Cons!4894 (h!5750 (_ BitVec 64)) (t!10006 List!4898)) )
))
(declare-fun arrayNoDuplicates!0 (array!17987 (_ BitVec 32) List!4898) Bool)

(assert (=> b!341353 (= res!188692 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4895))))

(declare-fun b!341354 () Bool)

(declare-fun e!209350 () Bool)

(declare-fun e!209351 () Bool)

(assert (=> b!341354 (= e!209350 (and e!209351 mapRes!12219))))

(declare-fun condMapEmpty!12219 () Bool)

(declare-fun mapDefault!12219 () ValueCell!3254)

