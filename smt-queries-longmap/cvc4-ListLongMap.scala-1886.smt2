; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33754 () Bool)

(assert start!33754)

(declare-fun b_free!6989 () Bool)

(declare-fun b_next!6989 () Bool)

(assert (=> start!33754 (= b_free!6989 (not b_next!6989))))

(declare-fun tp!24470 () Bool)

(declare-fun b_and!14169 () Bool)

(assert (=> start!33754 (= tp!24470 b_and!14169)))

(declare-fun b!335807 () Bool)

(declare-fun res!185364 () Bool)

(declare-fun e!206134 () Bool)

(assert (=> b!335807 (=> (not res!185364) (not e!206134))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335807 (= res!185364 (validKeyInArray!0 k!1348))))

(declare-fun mapIsEmpty!11808 () Bool)

(declare-fun mapRes!11808 () Bool)

(assert (=> mapIsEmpty!11808 mapRes!11808))

(declare-fun b!335808 () Bool)

(declare-fun e!206135 () Bool)

(declare-fun tp_is_empty!6941 () Bool)

(assert (=> b!335808 (= e!206135 tp_is_empty!6941)))

(declare-fun b!335809 () Bool)

(declare-fun res!185367 () Bool)

(assert (=> b!335809 (=> (not res!185367) (not e!206134))))

(declare-datatypes ((array!17475 0))(
  ( (array!17476 (arr!8268 (Array (_ BitVec 32) (_ BitVec 64))) (size!8620 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17475)

(declare-datatypes ((List!4726 0))(
  ( (Nil!4723) (Cons!4722 (h!5578 (_ BitVec 64)) (t!9814 List!4726)) )
))
(declare-fun arrayNoDuplicates!0 (array!17475 (_ BitVec 32) List!4726) Bool)

(assert (=> b!335809 (= res!185367 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4723))))

(declare-fun b!335810 () Bool)

(declare-fun e!206132 () Bool)

(assert (=> b!335810 (= e!206132 tp_is_empty!6941)))

(declare-fun b!335811 () Bool)

(declare-fun e!206136 () Bool)

(assert (=> b!335811 (= e!206136 (and e!206132 mapRes!11808))))

(declare-fun condMapEmpty!11808 () Bool)

(declare-datatypes ((V!10231 0))(
  ( (V!10232 (val!3515 Int)) )
))
(declare-datatypes ((ValueCell!3127 0))(
  ( (ValueCellFull!3127 (v!5677 V!10231)) (EmptyCell!3127) )
))
(declare-datatypes ((array!17477 0))(
  ( (array!17478 (arr!8269 (Array (_ BitVec 32) ValueCell!3127)) (size!8621 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17477)

(declare-fun mapDefault!11808 () ValueCell!3127)

