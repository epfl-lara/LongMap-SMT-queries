; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43188 () Bool)

(assert start!43188)

(declare-fun b!478678 () Bool)

(declare-fun e!281475 () Bool)

(declare-fun tp_is_empty!13577 () Bool)

(assert (=> b!478678 (= e!281475 tp_is_empty!13577)))

(declare-fun b!478679 () Bool)

(declare-fun e!281476 () Bool)

(assert (=> b!478679 (= e!281476 tp_is_empty!13577)))

(declare-fun res!285588 () Bool)

(declare-fun e!281478 () Bool)

(assert (=> start!43188 (=> (not res!285588) (not e!281478))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43188 (= res!285588 (validMask!0 mask!2352))))

(assert (=> start!43188 e!281478))

(assert (=> start!43188 true))

(declare-datatypes ((V!19173 0))(
  ( (V!19174 (val!6836 Int)) )
))
(declare-datatypes ((ValueCell!6427 0))(
  ( (ValueCellFull!6427 (v!9125 V!19173)) (EmptyCell!6427) )
))
(declare-datatypes ((array!30831 0))(
  ( (array!30832 (arr!14823 (Array (_ BitVec 32) ValueCell!6427)) (size!15181 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30831)

(declare-fun e!281477 () Bool)

(declare-fun array_inv!10694 (array!30831) Bool)

(assert (=> start!43188 (and (array_inv!10694 _values!1516) e!281477)))

(declare-datatypes ((array!30833 0))(
  ( (array!30834 (arr!14824 (Array (_ BitVec 32) (_ BitVec 64))) (size!15182 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30833)

(declare-fun array_inv!10695 (array!30833) Bool)

(assert (=> start!43188 (array_inv!10695 _keys!1874)))

(declare-fun b!478680 () Bool)

(declare-fun res!285587 () Bool)

(assert (=> b!478680 (=> (not res!285587) (not e!281478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30833 (_ BitVec 32)) Bool)

(assert (=> b!478680 (= res!285587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478681 () Bool)

(declare-fun mapRes!22060 () Bool)

(assert (=> b!478681 (= e!281477 (and e!281475 mapRes!22060))))

(declare-fun condMapEmpty!22060 () Bool)

(declare-fun mapDefault!22060 () ValueCell!6427)

