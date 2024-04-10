; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106894 () Bool)

(assert start!106894)

(declare-fun mapIsEmpty!50506 () Bool)

(declare-fun mapRes!50506 () Bool)

(assert (=> mapIsEmpty!50506 mapRes!50506))

(declare-fun res!844041 () Bool)

(declare-fun e!722441 () Bool)

(assert (=> start!106894 (=> (not res!844041) (not e!722441))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106894 (= res!844041 (validMask!0 mask!1730))))

(assert (=> start!106894 e!722441))

(declare-datatypes ((V!48695 0))(
  ( (V!48696 (val!16388 Int)) )
))
(declare-datatypes ((ValueCell!15460 0))(
  ( (ValueCellFull!15460 (v!19024 V!48695)) (EmptyCell!15460) )
))
(declare-datatypes ((array!82520 0))(
  ( (array!82521 (arr!39802 (Array (_ BitVec 32) ValueCell!15460)) (size!40338 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82520)

(declare-fun e!722439 () Bool)

(declare-fun array_inv!30291 (array!82520) Bool)

(assert (=> start!106894 (and (array_inv!30291 _values!1134) e!722439)))

(assert (=> start!106894 true))

(declare-datatypes ((array!82522 0))(
  ( (array!82523 (arr!39803 (Array (_ BitVec 32) (_ BitVec 64))) (size!40339 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82522)

(declare-fun array_inv!30292 (array!82522) Bool)

(assert (=> start!106894 (array_inv!30292 _keys!1364)))

(declare-fun b!1268017 () Bool)

(declare-fun e!722443 () Bool)

(declare-fun tp_is_empty!32627 () Bool)

(assert (=> b!1268017 (= e!722443 tp_is_empty!32627)))

(declare-fun b!1268018 () Bool)

(declare-fun e!722442 () Bool)

(assert (=> b!1268018 (= e!722439 (and e!722442 mapRes!50506))))

(declare-fun condMapEmpty!50506 () Bool)

(declare-fun mapDefault!50506 () ValueCell!15460)

