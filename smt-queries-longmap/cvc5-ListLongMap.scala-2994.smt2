; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42268 () Bool)

(assert start!42268)

(declare-fun b_free!11773 () Bool)

(declare-fun b_next!11773 () Bool)

(assert (=> start!42268 (= b_free!11773 (not b_next!11773))))

(declare-fun tp!41347 () Bool)

(declare-fun b_and!20211 () Bool)

(assert (=> start!42268 (= tp!41347 b_and!20211)))

(declare-fun res!281766 () Bool)

(declare-fun e!276462 () Bool)

(assert (=> start!42268 (=> (not res!281766) (not e!276462))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42268 (= res!281766 (validMask!0 mask!1365))))

(assert (=> start!42268 e!276462))

(declare-fun tp_is_empty!13201 () Bool)

(assert (=> start!42268 tp_is_empty!13201))

(assert (=> start!42268 tp!41347))

(assert (=> start!42268 true))

(declare-datatypes ((array!30163 0))(
  ( (array!30164 (arr!14503 (Array (_ BitVec 32) (_ BitVec 64))) (size!14855 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30163)

(declare-fun array_inv!10454 (array!30163) Bool)

(assert (=> start!42268 (array_inv!10454 _keys!1025)))

(declare-datatypes ((V!18707 0))(
  ( (V!18708 (val!6645 Int)) )
))
(declare-datatypes ((ValueCell!6257 0))(
  ( (ValueCellFull!6257 (v!8936 V!18707)) (EmptyCell!6257) )
))
(declare-datatypes ((array!30165 0))(
  ( (array!30166 (arr!14504 (Array (_ BitVec 32) ValueCell!6257)) (size!14856 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30165)

(declare-fun e!276464 () Bool)

(declare-fun array_inv!10455 (array!30165) Bool)

(assert (=> start!42268 (and (array_inv!10455 _values!833) e!276464)))

(declare-fun b!471667 () Bool)

(declare-fun e!276463 () Bool)

(assert (=> b!471667 (= e!276463 tp_is_empty!13201)))

(declare-fun b!471668 () Bool)

(declare-fun e!276465 () Bool)

(declare-fun mapRes!21508 () Bool)

(assert (=> b!471668 (= e!276464 (and e!276465 mapRes!21508))))

(declare-fun condMapEmpty!21508 () Bool)

(declare-fun mapDefault!21508 () ValueCell!6257)

