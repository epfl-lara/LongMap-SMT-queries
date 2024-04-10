; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35908 () Bool)

(assert start!35908)

(declare-fun b!361037 () Bool)

(declare-fun e!221011 () Bool)

(declare-fun e!221009 () Bool)

(declare-fun mapRes!14028 () Bool)

(assert (=> b!361037 (= e!221011 (and e!221009 mapRes!14028))))

(declare-fun condMapEmpty!14028 () Bool)

(declare-datatypes ((V!12103 0))(
  ( (V!12104 (val!4217 Int)) )
))
(declare-datatypes ((ValueCell!3829 0))(
  ( (ValueCellFull!3829 (v!6411 V!12103)) (EmptyCell!3829) )
))
(declare-datatypes ((array!20239 0))(
  ( (array!20240 (arr!9612 (Array (_ BitVec 32) ValueCell!3829)) (size!9964 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20239)

(declare-fun mapDefault!14028 () ValueCell!3829)

