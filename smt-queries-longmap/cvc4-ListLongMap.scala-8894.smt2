; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108008 () Bool)

(assert start!108008)

(declare-fun b!1275766 () Bool)

(declare-fun e!728362 () Bool)

(declare-fun e!728363 () Bool)

(declare-fun mapRes!51449 () Bool)

(assert (=> b!1275766 (= e!728362 (and e!728363 mapRes!51449))))

(declare-fun condMapEmpty!51449 () Bool)

(declare-datatypes ((V!49477 0))(
  ( (V!49478 (val!16715 Int)) )
))
(declare-datatypes ((ValueCell!15742 0))(
  ( (ValueCellFull!15742 (v!19312 V!49477)) (EmptyCell!15742) )
))
(declare-datatypes ((array!83666 0))(
  ( (array!83667 (arr!40345 (Array (_ BitVec 32) ValueCell!15742)) (size!40895 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83666)

(declare-fun mapDefault!51449 () ValueCell!15742)

