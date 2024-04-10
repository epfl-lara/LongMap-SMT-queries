; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33854 () Bool)

(assert start!33854)

(declare-fun b_free!7033 () Bool)

(declare-fun b_next!7033 () Bool)

(assert (=> start!33854 (= b_free!7033 (not b_next!7033))))

(declare-fun tp!24612 () Bool)

(declare-fun b_and!14219 () Bool)

(assert (=> start!33854 (= tp!24612 b_and!14219)))

(declare-fun b!336864 () Bool)

(declare-fun res!185980 () Bool)

(declare-fun e!206749 () Bool)

(assert (=> b!336864 (=> (not res!185980) (not e!206749))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336864 (= res!185980 (validKeyInArray!0 k!1348))))

(declare-fun b!336865 () Bool)

(declare-fun e!206753 () Bool)

(declare-fun e!206754 () Bool)

(declare-fun mapRes!11883 () Bool)

(assert (=> b!336865 (= e!206753 (and e!206754 mapRes!11883))))

(declare-fun condMapEmpty!11883 () Bool)

(declare-datatypes ((V!10291 0))(
  ( (V!10292 (val!3537 Int)) )
))
(declare-datatypes ((ValueCell!3149 0))(
  ( (ValueCellFull!3149 (v!5702 V!10291)) (EmptyCell!3149) )
))
(declare-datatypes ((array!17567 0))(
  ( (array!17568 (arr!8311 (Array (_ BitVec 32) ValueCell!3149)) (size!8663 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17567)

(declare-fun mapDefault!11883 () ValueCell!3149)

