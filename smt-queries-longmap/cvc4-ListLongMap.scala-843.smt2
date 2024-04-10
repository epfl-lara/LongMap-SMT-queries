; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20158 () Bool)

(assert start!20158)

(declare-fun b_free!4817 () Bool)

(declare-fun b_next!4817 () Bool)

(assert (=> start!20158 (= b_free!4817 (not b_next!4817))))

(declare-fun tp!17483 () Bool)

(declare-fun b_and!11563 () Bool)

(assert (=> start!20158 (= tp!17483 b_and!11563)))

(declare-fun mapIsEmpty!8078 () Bool)

(declare-fun mapRes!8078 () Bool)

(assert (=> mapIsEmpty!8078 mapRes!8078))

(declare-fun mapNonEmpty!8078 () Bool)

(declare-fun tp!17482 () Bool)

(declare-fun e!130105 () Bool)

(assert (=> mapNonEmpty!8078 (= mapRes!8078 (and tp!17482 e!130105))))

(declare-fun mapKey!8078 () (_ BitVec 32))

(declare-datatypes ((V!5877 0))(
  ( (V!5878 (val!2381 Int)) )
))
(declare-datatypes ((ValueCell!1993 0))(
  ( (ValueCellFull!1993 (v!4351 V!5877)) (EmptyCell!1993) )
))
(declare-fun mapRest!8078 () (Array (_ BitVec 32) ValueCell!1993))

(declare-fun mapValue!8078 () ValueCell!1993)

(declare-datatypes ((array!8599 0))(
  ( (array!8600 (arr!4050 (Array (_ BitVec 32) ValueCell!1993)) (size!4375 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8599)

(assert (=> mapNonEmpty!8078 (= (arr!4050 _values!649) (store mapRest!8078 mapKey!8078 mapValue!8078))))

(declare-fun res!93644 () Bool)

(declare-fun e!130108 () Bool)

(assert (=> start!20158 (=> (not res!93644) (not e!130108))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20158 (= res!93644 (validMask!0 mask!1149))))

(assert (=> start!20158 e!130108))

(declare-fun e!130107 () Bool)

(declare-fun array_inv!2645 (array!8599) Bool)

(assert (=> start!20158 (and (array_inv!2645 _values!649) e!130107)))

(assert (=> start!20158 true))

(declare-fun tp_is_empty!4673 () Bool)

(assert (=> start!20158 tp_is_empty!4673))

(declare-datatypes ((array!8601 0))(
  ( (array!8602 (arr!4051 (Array (_ BitVec 32) (_ BitVec 64))) (size!4376 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8601)

(declare-fun array_inv!2646 (array!8601) Bool)

(assert (=> start!20158 (array_inv!2646 _keys!825)))

(assert (=> start!20158 tp!17483))

(declare-fun b!197804 () Bool)

(declare-fun e!130106 () Bool)

(assert (=> b!197804 (= e!130107 (and e!130106 mapRes!8078))))

(declare-fun condMapEmpty!8078 () Bool)

(declare-fun mapDefault!8078 () ValueCell!1993)

