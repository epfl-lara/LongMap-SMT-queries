; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36636 () Bool)

(assert start!36636)

(declare-fun b!365672 () Bool)

(declare-fun e!223937 () Bool)

(declare-fun tp_is_empty!8471 () Bool)

(assert (=> b!365672 (= e!223937 tp_is_empty!8471)))

(declare-fun b!365673 () Bool)

(declare-fun e!223935 () Bool)

(declare-fun mapRes!14259 () Bool)

(assert (=> b!365673 (= e!223935 (and e!223937 mapRes!14259))))

(declare-fun condMapEmpty!14259 () Bool)

(declare-datatypes ((V!12399 0))(
  ( (V!12400 (val!4280 Int)) )
))
(declare-datatypes ((ValueCell!3892 0))(
  ( (ValueCellFull!3892 (v!6476 V!12399)) (EmptyCell!3892) )
))
(declare-datatypes ((array!20899 0))(
  ( (array!20900 (arr!9922 (Array (_ BitVec 32) ValueCell!3892)) (size!10274 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20899)

(declare-fun mapDefault!14259 () ValueCell!3892)

