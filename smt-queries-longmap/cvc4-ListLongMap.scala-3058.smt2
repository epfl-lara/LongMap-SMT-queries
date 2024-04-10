; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43194 () Bool)

(assert start!43194)

(declare-fun b!478732 () Bool)

(declare-fun res!285614 () Bool)

(declare-fun e!281522 () Bool)

(assert (=> b!478732 (=> (not res!285614) (not e!281522))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30843 0))(
  ( (array!30844 (arr!14829 (Array (_ BitVec 32) (_ BitVec 64))) (size!15187 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30843)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19181 0))(
  ( (V!19182 (val!6839 Int)) )
))
(declare-datatypes ((ValueCell!6430 0))(
  ( (ValueCellFull!6430 (v!9128 V!19181)) (EmptyCell!6430) )
))
(declare-datatypes ((array!30845 0))(
  ( (array!30846 (arr!14830 (Array (_ BitVec 32) ValueCell!6430)) (size!15188 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30845)

(assert (=> b!478732 (= res!285614 (and (= (size!15188 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15187 _keys!1874) (size!15188 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478733 () Bool)

(declare-fun e!281519 () Bool)

(declare-fun tp_is_empty!13583 () Bool)

(assert (=> b!478733 (= e!281519 tp_is_empty!13583)))

(declare-fun mapIsEmpty!22069 () Bool)

(declare-fun mapRes!22069 () Bool)

(assert (=> mapIsEmpty!22069 mapRes!22069))

(declare-fun res!285615 () Bool)

(assert (=> start!43194 (=> (not res!285615) (not e!281522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43194 (= res!285615 (validMask!0 mask!2352))))

(assert (=> start!43194 e!281522))

(assert (=> start!43194 true))

(declare-fun e!281521 () Bool)

(declare-fun array_inv!10698 (array!30845) Bool)

(assert (=> start!43194 (and (array_inv!10698 _values!1516) e!281521)))

(declare-fun array_inv!10699 (array!30843) Bool)

(assert (=> start!43194 (array_inv!10699 _keys!1874)))

(declare-fun mapNonEmpty!22069 () Bool)

(declare-fun tp!42544 () Bool)

(declare-fun e!281523 () Bool)

(assert (=> mapNonEmpty!22069 (= mapRes!22069 (and tp!42544 e!281523))))

(declare-fun mapValue!22069 () ValueCell!6430)

(declare-fun mapKey!22069 () (_ BitVec 32))

(declare-fun mapRest!22069 () (Array (_ BitVec 32) ValueCell!6430))

(assert (=> mapNonEmpty!22069 (= (arr!14830 _values!1516) (store mapRest!22069 mapKey!22069 mapValue!22069))))

(declare-fun b!478734 () Bool)

(declare-fun res!285613 () Bool)

(assert (=> b!478734 (=> (not res!285613) (not e!281522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30843 (_ BitVec 32)) Bool)

(assert (=> b!478734 (= res!285613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478735 () Bool)

(assert (=> b!478735 (= e!281523 tp_is_empty!13583)))

(declare-fun b!478736 () Bool)

(assert (=> b!478736 (= e!281522 false)))

(declare-fun lt!217759 () Bool)

(declare-datatypes ((List!9067 0))(
  ( (Nil!9064) (Cons!9063 (h!9919 (_ BitVec 64)) (t!15273 List!9067)) )
))
(declare-fun arrayNoDuplicates!0 (array!30843 (_ BitVec 32) List!9067) Bool)

(assert (=> b!478736 (= lt!217759 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9064))))

(declare-fun b!478737 () Bool)

(assert (=> b!478737 (= e!281521 (and e!281519 mapRes!22069))))

(declare-fun condMapEmpty!22069 () Bool)

(declare-fun mapDefault!22069 () ValueCell!6430)

