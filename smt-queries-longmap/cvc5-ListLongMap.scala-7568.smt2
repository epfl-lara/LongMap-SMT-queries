; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95728 () Bool)

(assert start!95728)

(declare-fun b_free!22381 () Bool)

(declare-fun b_next!22381 () Bool)

(assert (=> start!95728 (= b_free!22381 (not b_next!22381))))

(declare-fun tp!78991 () Bool)

(declare-fun b_and!35437 () Bool)

(assert (=> start!95728 (= tp!78991 b_and!35437)))

(declare-fun mapNonEmpty!41329 () Bool)

(declare-fun mapRes!41329 () Bool)

(declare-fun tp!78992 () Bool)

(declare-fun e!618610 () Bool)

(assert (=> mapNonEmpty!41329 (= mapRes!41329 (and tp!78992 e!618610))))

(declare-datatypes ((V!40305 0))(
  ( (V!40306 (val!13248 Int)) )
))
(declare-datatypes ((ValueCell!12482 0))(
  ( (ValueCellFull!12482 (v!15869 V!40305)) (EmptyCell!12482) )
))
(declare-datatypes ((array!69713 0))(
  ( (array!69714 (arr!33530 (Array (_ BitVec 32) ValueCell!12482)) (size!34066 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69713)

(declare-fun mapValue!41329 () ValueCell!12482)

(declare-fun mapKey!41329 () (_ BitVec 32))

(declare-fun mapRest!41329 () (Array (_ BitVec 32) ValueCell!12482))

(assert (=> mapNonEmpty!41329 (= (arr!33530 _values!874) (store mapRest!41329 mapKey!41329 mapValue!41329))))

(declare-fun res!721543 () Bool)

(declare-fun e!618608 () Bool)

(assert (=> start!95728 (=> (not res!721543) (not e!618608))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95728 (= res!721543 (validMask!0 mask!1414))))

(assert (=> start!95728 e!618608))

(assert (=> start!95728 tp!78991))

(assert (=> start!95728 true))

(declare-fun tp_is_empty!26383 () Bool)

(assert (=> start!95728 tp_is_empty!26383))

(declare-datatypes ((array!69715 0))(
  ( (array!69716 (arr!33531 (Array (_ BitVec 32) (_ BitVec 64))) (size!34067 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69715)

(declare-fun array_inv!25882 (array!69715) Bool)

(assert (=> start!95728 (array_inv!25882 _keys!1070)))

(declare-fun e!618609 () Bool)

(declare-fun array_inv!25883 (array!69713) Bool)

(assert (=> start!95728 (and (array_inv!25883 _values!874) e!618609)))

(declare-fun b!1082451 () Bool)

(declare-fun res!721546 () Bool)

(declare-fun e!618607 () Bool)

(assert (=> b!1082451 (=> (not res!721546) (not e!618607))))

(declare-fun lt!479623 () array!69715)

(declare-datatypes ((List!23370 0))(
  ( (Nil!23367) (Cons!23366 (h!24575 (_ BitVec 64)) (t!32809 List!23370)) )
))
(declare-fun arrayNoDuplicates!0 (array!69715 (_ BitVec 32) List!23370) Bool)

(assert (=> b!1082451 (= res!721546 (arrayNoDuplicates!0 lt!479623 #b00000000000000000000000000000000 Nil!23367))))

(declare-fun b!1082452 () Bool)

(declare-fun e!618606 () Bool)

(assert (=> b!1082452 (= e!618609 (and e!618606 mapRes!41329))))

(declare-fun condMapEmpty!41329 () Bool)

(declare-fun mapDefault!41329 () ValueCell!12482)

