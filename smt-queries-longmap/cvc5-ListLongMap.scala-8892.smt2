; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107980 () Bool)

(assert start!107980)

(declare-fun b!1275567 () Bool)

(declare-fun e!728207 () Bool)

(declare-fun e!728208 () Bool)

(declare-fun mapRes!51422 () Bool)

(assert (=> b!1275567 (= e!728207 (and e!728208 mapRes!51422))))

(declare-fun condMapEmpty!51422 () Bool)

(declare-datatypes ((V!49457 0))(
  ( (V!49458 (val!16707 Int)) )
))
(declare-datatypes ((ValueCell!15734 0))(
  ( (ValueCellFull!15734 (v!19303 V!49457)) (EmptyCell!15734) )
))
(declare-datatypes ((array!83638 0))(
  ( (array!83639 (arr!40332 (Array (_ BitVec 32) ValueCell!15734)) (size!40882 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83638)

(declare-fun mapDefault!51422 () ValueCell!15734)

