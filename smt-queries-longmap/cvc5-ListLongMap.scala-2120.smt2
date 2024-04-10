; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35904 () Bool)

(assert start!35904)

(declare-fun mapIsEmpty!14022 () Bool)

(declare-fun mapRes!14022 () Bool)

(assert (=> mapIsEmpty!14022 mapRes!14022))

(declare-fun b!361013 () Bool)

(declare-fun e!220979 () Bool)

(declare-fun tp_is_empty!8341 () Bool)

(assert (=> b!361013 (= e!220979 tp_is_empty!8341)))

(declare-fun b!361014 () Bool)

(declare-fun e!220980 () Bool)

(assert (=> b!361014 (= e!220980 (and e!220979 mapRes!14022))))

(declare-fun condMapEmpty!14022 () Bool)

(declare-datatypes ((V!12099 0))(
  ( (V!12100 (val!4215 Int)) )
))
(declare-datatypes ((ValueCell!3827 0))(
  ( (ValueCellFull!3827 (v!6409 V!12099)) (EmptyCell!3827) )
))
(declare-datatypes ((array!20233 0))(
  ( (array!20234 (arr!9609 (Array (_ BitVec 32) ValueCell!3827)) (size!9961 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20233)

(declare-fun mapDefault!14022 () ValueCell!3827)

