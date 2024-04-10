; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108004 () Bool)

(assert start!108004)

(declare-fun b!1275730 () Bool)

(declare-fun e!728331 () Bool)

(declare-fun e!728334 () Bool)

(declare-fun mapRes!51443 () Bool)

(assert (=> b!1275730 (= e!728331 (and e!728334 mapRes!51443))))

(declare-fun condMapEmpty!51443 () Bool)

(declare-datatypes ((V!49473 0))(
  ( (V!49474 (val!16713 Int)) )
))
(declare-datatypes ((ValueCell!15740 0))(
  ( (ValueCellFull!15740 (v!19310 V!49473)) (EmptyCell!15740) )
))
(declare-datatypes ((array!83660 0))(
  ( (array!83661 (arr!40342 (Array (_ BitVec 32) ValueCell!15740)) (size!40892 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83660)

(declare-fun mapDefault!51443 () ValueCell!15740)

