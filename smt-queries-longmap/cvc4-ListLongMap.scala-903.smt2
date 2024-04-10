; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20518 () Bool)

(assert start!20518)

(declare-fun b_free!5177 () Bool)

(declare-fun b_next!5177 () Bool)

(assert (=> start!20518 (= b_free!5177 (not b_next!5177))))

(declare-fun tp!18562 () Bool)

(declare-fun b_and!11923 () Bool)

(assert (=> start!20518 (= tp!18562 b_and!11923)))

(declare-fun mapIsEmpty!8618 () Bool)

(declare-fun mapRes!8618 () Bool)

(assert (=> mapIsEmpty!8618 mapRes!8618))

(declare-fun b!203823 () Bool)

(declare-fun e!133410 () Bool)

(declare-fun e!133409 () Bool)

(assert (=> b!203823 (= e!133410 (and e!133409 mapRes!8618))))

(declare-fun condMapEmpty!8618 () Bool)

(declare-datatypes ((V!6357 0))(
  ( (V!6358 (val!2561 Int)) )
))
(declare-datatypes ((ValueCell!2173 0))(
  ( (ValueCellFull!2173 (v!4531 V!6357)) (EmptyCell!2173) )
))
(declare-datatypes ((array!9289 0))(
  ( (array!9290 (arr!4395 (Array (_ BitVec 32) ValueCell!2173)) (size!4720 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9289)

(declare-fun mapDefault!8618 () ValueCell!2173)

