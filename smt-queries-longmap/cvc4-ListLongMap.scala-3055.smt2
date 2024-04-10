; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43154 () Bool)

(assert start!43154)

(declare-fun b!478482 () Bool)

(declare-fun res!285473 () Bool)

(declare-fun e!281326 () Bool)

(assert (=> b!478482 (=> (not res!285473) (not e!281326))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30803 0))(
  ( (array!30804 (arr!14811 (Array (_ BitVec 32) (_ BitVec 64))) (size!15169 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30803)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19157 0))(
  ( (V!19158 (val!6830 Int)) )
))
(declare-datatypes ((ValueCell!6421 0))(
  ( (ValueCellFull!6421 (v!9118 V!19157)) (EmptyCell!6421) )
))
(declare-datatypes ((array!30805 0))(
  ( (array!30806 (arr!14812 (Array (_ BitVec 32) ValueCell!6421)) (size!15170 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30805)

(assert (=> b!478482 (= res!285473 (and (= (size!15170 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15169 _keys!1874) (size!15170 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!285474 () Bool)

(assert (=> start!43154 (=> (not res!285474) (not e!281326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43154 (= res!285474 (validMask!0 mask!2352))))

(assert (=> start!43154 e!281326))

(assert (=> start!43154 true))

(declare-fun e!281327 () Bool)

(declare-fun array_inv!10686 (array!30805) Bool)

(assert (=> start!43154 (and (array_inv!10686 _values!1516) e!281327)))

(declare-fun array_inv!10687 (array!30803) Bool)

(assert (=> start!43154 (array_inv!10687 _keys!1874)))

(declare-fun b!478483 () Bool)

(declare-fun res!285472 () Bool)

(assert (=> b!478483 (=> (not res!285472) (not e!281326))))

(assert (=> b!478483 (= res!285472 (and (bvsle #b00000000000000000000000000000000 (size!15169 _keys!1874)) (bvslt (size!15169 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun b!478484 () Bool)

(declare-fun e!281328 () Bool)

(declare-fun tp_is_empty!13565 () Bool)

(assert (=> b!478484 (= e!281328 tp_is_empty!13565)))

(declare-fun b!478485 () Bool)

(declare-datatypes ((List!9061 0))(
  ( (Nil!9058) (Cons!9057 (h!9913 (_ BitVec 64)) (t!15267 List!9061)) )
))
(declare-fun noDuplicate!205 (List!9061) Bool)

(assert (=> b!478485 (= e!281326 (not (noDuplicate!205 Nil!9058)))))

(declare-fun b!478486 () Bool)

(declare-fun e!281329 () Bool)

(assert (=> b!478486 (= e!281329 tp_is_empty!13565)))

(declare-fun b!478487 () Bool)

(declare-fun res!285475 () Bool)

(assert (=> b!478487 (=> (not res!285475) (not e!281326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30803 (_ BitVec 32)) Bool)

(assert (=> b!478487 (= res!285475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22036 () Bool)

(declare-fun mapRes!22036 () Bool)

(assert (=> mapIsEmpty!22036 mapRes!22036))

(declare-fun b!478488 () Bool)

(assert (=> b!478488 (= e!281327 (and e!281329 mapRes!22036))))

(declare-fun condMapEmpty!22036 () Bool)

(declare-fun mapDefault!22036 () ValueCell!6421)

