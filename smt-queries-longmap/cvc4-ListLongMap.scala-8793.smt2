; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106986 () Bool)

(assert start!106986)

(declare-fun b!1268573 () Bool)

(declare-fun e!722896 () Bool)

(declare-fun tp_is_empty!32675 () Bool)

(assert (=> b!1268573 (= e!722896 tp_is_empty!32675)))

(declare-fun b!1268574 () Bool)

(declare-fun e!722894 () Bool)

(declare-fun e!722898 () Bool)

(declare-fun mapRes!50593 () Bool)

(assert (=> b!1268574 (= e!722894 (and e!722898 mapRes!50593))))

(declare-fun condMapEmpty!50593 () Bool)

(declare-datatypes ((V!48759 0))(
  ( (V!48760 (val!16412 Int)) )
))
(declare-datatypes ((ValueCell!15484 0))(
  ( (ValueCellFull!15484 (v!19049 V!48759)) (EmptyCell!15484) )
))
(declare-datatypes ((array!82624 0))(
  ( (array!82625 (arr!39849 (Array (_ BitVec 32) ValueCell!15484)) (size!40385 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82624)

(declare-fun mapDefault!50593 () ValueCell!15484)

