; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36660 () Bool)

(assert start!36660)

(declare-fun b!365845 () Bool)

(declare-fun e!224051 () Bool)

(declare-fun e!224054 () Bool)

(declare-fun mapRes!14280 () Bool)

(assert (=> b!365845 (= e!224051 (and e!224054 mapRes!14280))))

(declare-fun condMapEmpty!14280 () Bool)

(declare-datatypes ((V!12415 0))(
  ( (V!12416 (val!4286 Int)) )
))
(declare-datatypes ((ValueCell!3898 0))(
  ( (ValueCellFull!3898 (v!6482 V!12415)) (EmptyCell!3898) )
))
(declare-datatypes ((array!20921 0))(
  ( (array!20922 (arr!9932 (Array (_ BitVec 32) ValueCell!3898)) (size!10284 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20921)

(declare-fun mapDefault!14280 () ValueCell!3898)

