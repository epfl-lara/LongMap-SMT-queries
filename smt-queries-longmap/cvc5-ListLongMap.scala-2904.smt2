; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41566 () Bool)

(assert start!41566)

(declare-fun b_free!11233 () Bool)

(declare-fun b_next!11233 () Bool)

(assert (=> start!41566 (= b_free!11233 (not b_next!11233))))

(declare-fun tp!39696 () Bool)

(declare-fun b_and!19573 () Bool)

(assert (=> start!41566 (= tp!39696 b_and!19573)))

(declare-fun b!464293 () Bool)

(declare-fun e!271194 () Bool)

(declare-fun tp_is_empty!12661 () Bool)

(assert (=> b!464293 (= e!271194 tp_is_empty!12661)))

(declare-fun b!464294 () Bool)

(declare-fun e!271195 () Bool)

(declare-fun mapRes!20668 () Bool)

(assert (=> b!464294 (= e!271195 (and e!271194 mapRes!20668))))

(declare-fun condMapEmpty!20668 () Bool)

(declare-datatypes ((V!17987 0))(
  ( (V!17988 (val!6375 Int)) )
))
(declare-datatypes ((ValueCell!5987 0))(
  ( (ValueCellFull!5987 (v!8662 V!17987)) (EmptyCell!5987) )
))
(declare-datatypes ((array!29111 0))(
  ( (array!29112 (arr!13987 (Array (_ BitVec 32) ValueCell!5987)) (size!14339 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29111)

(declare-fun mapDefault!20668 () ValueCell!5987)

