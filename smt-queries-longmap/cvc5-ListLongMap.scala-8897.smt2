; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108022 () Bool)

(assert start!108022)

(declare-fun mapNonEmpty!51470 () Bool)

(declare-fun mapRes!51470 () Bool)

(declare-fun tp!98228 () Bool)

(declare-fun e!728468 () Bool)

(assert (=> mapNonEmpty!51470 (= mapRes!51470 (and tp!98228 e!728468))))

(declare-datatypes ((V!49497 0))(
  ( (V!49498 (val!16722 Int)) )
))
(declare-datatypes ((ValueCell!15749 0))(
  ( (ValueCellFull!15749 (v!19319 V!49497)) (EmptyCell!15749) )
))
(declare-fun mapValue!51470 () ValueCell!15749)

(declare-fun mapKey!51470 () (_ BitVec 32))

(declare-datatypes ((array!83690 0))(
  ( (array!83691 (arr!40357 (Array (_ BitVec 32) ValueCell!15749)) (size!40907 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83690)

(declare-fun mapRest!51470 () (Array (_ BitVec 32) ValueCell!15749))

(assert (=> mapNonEmpty!51470 (= (arr!40357 _values!1187) (store mapRest!51470 mapKey!51470 mapValue!51470))))

(declare-fun b!1275892 () Bool)

(declare-fun e!728469 () Bool)

(declare-fun e!728467 () Bool)

(assert (=> b!1275892 (= e!728469 (and e!728467 mapRes!51470))))

(declare-fun condMapEmpty!51470 () Bool)

(declare-fun mapDefault!51470 () ValueCell!15749)

