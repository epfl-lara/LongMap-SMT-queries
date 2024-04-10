; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33780 () Bool)

(assert start!33780)

(declare-fun b_free!6997 () Bool)

(declare-fun b_next!6997 () Bool)

(assert (=> start!33780 (= b_free!6997 (not b_next!6997))))

(declare-fun tp!24498 () Bool)

(declare-fun b_and!14179 () Bool)

(assert (=> start!33780 (= tp!24498 b_and!14179)))

(declare-fun b!336042 () Bool)

(declare-fun res!185483 () Bool)

(declare-fun e!206274 () Bool)

(assert (=> b!336042 (=> (not res!185483) (not e!206274))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336042 (= res!185483 (validKeyInArray!0 k!1348))))

(declare-fun b!336043 () Bool)

(declare-fun e!206276 () Bool)

(declare-fun tp_is_empty!6949 () Bool)

(assert (=> b!336043 (= e!206276 tp_is_empty!6949)))

(declare-fun res!185485 () Bool)

(assert (=> start!33780 (=> (not res!185485) (not e!206274))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33780 (= res!185485 (validMask!0 mask!2385))))

(assert (=> start!33780 e!206274))

(assert (=> start!33780 true))

(assert (=> start!33780 tp_is_empty!6949))

(assert (=> start!33780 tp!24498))

(declare-datatypes ((V!10243 0))(
  ( (V!10244 (val!3519 Int)) )
))
(declare-datatypes ((ValueCell!3131 0))(
  ( (ValueCellFull!3131 (v!5682 V!10243)) (EmptyCell!3131) )
))
(declare-datatypes ((array!17493 0))(
  ( (array!17494 (arr!8276 (Array (_ BitVec 32) ValueCell!3131)) (size!8628 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17493)

(declare-fun e!206273 () Bool)

(declare-fun array_inv!6146 (array!17493) Bool)

(assert (=> start!33780 (and (array_inv!6146 _values!1525) e!206273)))

(declare-datatypes ((array!17495 0))(
  ( (array!17496 (arr!8277 (Array (_ BitVec 32) (_ BitVec 64))) (size!8629 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17495)

(declare-fun array_inv!6147 (array!17495) Bool)

(assert (=> start!33780 (array_inv!6147 _keys!1895)))

(declare-fun mapNonEmpty!11823 () Bool)

(declare-fun mapRes!11823 () Bool)

(declare-fun tp!24497 () Bool)

(assert (=> mapNonEmpty!11823 (= mapRes!11823 (and tp!24497 e!206276))))

(declare-fun mapValue!11823 () ValueCell!3131)

(declare-fun mapRest!11823 () (Array (_ BitVec 32) ValueCell!3131))

(declare-fun mapKey!11823 () (_ BitVec 32))

(assert (=> mapNonEmpty!11823 (= (arr!8276 _values!1525) (store mapRest!11823 mapKey!11823 mapValue!11823))))

(declare-fun b!336044 () Bool)

(declare-fun e!206275 () Bool)

(assert (=> b!336044 (= e!206273 (and e!206275 mapRes!11823))))

(declare-fun condMapEmpty!11823 () Bool)

(declare-fun mapDefault!11823 () ValueCell!3131)

