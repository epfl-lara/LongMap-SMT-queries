; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78058 () Bool)

(assert start!78058)

(declare-fun b_free!16585 () Bool)

(declare-fun b_next!16585 () Bool)

(assert (=> start!78058 (= b_free!16585 (not b_next!16585))))

(declare-fun tp!58026 () Bool)

(declare-fun b_and!27157 () Bool)

(assert (=> start!78058 (= tp!58026 b_and!27157)))

(declare-fun res!614774 () Bool)

(declare-fun e!510971 () Bool)

(assert (=> start!78058 (=> (not res!614774) (not e!510971))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78058 (= res!614774 (validMask!0 mask!1756))))

(assert (=> start!78058 e!510971))

(declare-datatypes ((V!30303 0))(
  ( (V!30304 (val!9552 Int)) )
))
(declare-datatypes ((ValueCell!9020 0))(
  ( (ValueCellFull!9020 (v!12061 V!30303)) (EmptyCell!9020) )
))
(declare-datatypes ((array!54010 0))(
  ( (array!54011 (arr!25961 (Array (_ BitVec 32) ValueCell!9020)) (size!26420 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54010)

(declare-fun e!510972 () Bool)

(declare-fun array_inv!20296 (array!54010) Bool)

(assert (=> start!78058 (and (array_inv!20296 _values!1152) e!510972)))

(assert (=> start!78058 tp!58026))

(assert (=> start!78058 true))

(declare-fun tp_is_empty!19003 () Bool)

(assert (=> start!78058 tp_is_empty!19003))

(declare-datatypes ((array!54012 0))(
  ( (array!54013 (arr!25962 (Array (_ BitVec 32) (_ BitVec 64))) (size!26421 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54012)

(declare-fun array_inv!20297 (array!54012) Bool)

(assert (=> start!78058 (array_inv!20297 _keys!1386)))

(declare-fun b!911157 () Bool)

(declare-fun e!510975 () Bool)

(assert (=> b!911157 (= e!510975 tp_is_empty!19003)))

(declare-fun b!911158 () Bool)

(declare-fun e!510973 () Bool)

(declare-fun mapRes!30226 () Bool)

(assert (=> b!911158 (= e!510972 (and e!510973 mapRes!30226))))

(declare-fun condMapEmpty!30226 () Bool)

(declare-fun mapDefault!30226 () ValueCell!9020)

