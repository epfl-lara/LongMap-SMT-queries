; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72298 () Bool)

(assert start!72298)

(declare-fun res!569668 () Bool)

(declare-fun e!467533 () Bool)

(assert (=> start!72298 (=> (not res!569668) (not e!467533))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!46996 0))(
  ( (array!46997 (arr!22529 (Array (_ BitVec 32) (_ BitVec 64))) (size!22969 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46996)

(assert (=> start!72298 (= res!569668 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22969 _keys!868))))))

(assert (=> start!72298 e!467533))

(assert (=> start!72298 true))

(declare-fun array_inv!17956 (array!46996) Bool)

(assert (=> start!72298 (array_inv!17956 _keys!868)))

(declare-datatypes ((V!25513 0))(
  ( (V!25514 (val!7722 Int)) )
))
(declare-datatypes ((ValueCell!7235 0))(
  ( (ValueCellFull!7235 (v!10147 V!25513)) (EmptyCell!7235) )
))
(declare-datatypes ((array!46998 0))(
  ( (array!46999 (arr!22530 (Array (_ BitVec 32) ValueCell!7235)) (size!22970 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46998)

(declare-fun e!467529 () Bool)

(declare-fun array_inv!17957 (array!46998) Bool)

(assert (=> start!72298 (and (array_inv!17957 _values!688) e!467529)))

(declare-fun b!837650 () Bool)

(declare-fun e!467530 () Bool)

(declare-fun tp_is_empty!15349 () Bool)

(assert (=> b!837650 (= e!467530 tp_is_empty!15349)))

(declare-fun b!837651 () Bool)

(declare-fun e!467531 () Bool)

(declare-fun mapRes!24623 () Bool)

(assert (=> b!837651 (= e!467529 (and e!467531 mapRes!24623))))

(declare-fun condMapEmpty!24623 () Bool)

(declare-fun mapDefault!24623 () ValueCell!7235)

