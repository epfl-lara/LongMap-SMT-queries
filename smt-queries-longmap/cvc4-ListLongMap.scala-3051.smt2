; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43108 () Bool)

(assert start!43108)

(declare-fun b!478230 () Bool)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30753 0))(
  ( (array!30754 (arr!14789 (Array (_ BitVec 32) (_ BitVec 64))) (size!15147 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30753)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19125 0))(
  ( (V!19126 (val!6818 Int)) )
))
(declare-datatypes ((ValueCell!6409 0))(
  ( (ValueCellFull!6409 (v!9106 V!19125)) (EmptyCell!6409) )
))
(declare-datatypes ((array!30755 0))(
  ( (array!30756 (arr!14790 (Array (_ BitVec 32) ValueCell!6409)) (size!15148 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30755)

(declare-fun e!281110 () Bool)

(assert (=> b!478230 (= e!281110 (and (= (size!15148 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15147 _keys!1874) (size!15148 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011) (not (= (size!15147 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352)))))))

(declare-fun b!478231 () Bool)

(declare-fun e!281109 () Bool)

(declare-fun tp_is_empty!13541 () Bool)

(assert (=> b!478231 (= e!281109 tp_is_empty!13541)))

(declare-fun b!478232 () Bool)

(declare-fun e!281113 () Bool)

(assert (=> b!478232 (= e!281113 tp_is_empty!13541)))

(declare-fun res!285364 () Bool)

(assert (=> start!43108 (=> (not res!285364) (not e!281110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43108 (= res!285364 (validMask!0 mask!2352))))

(assert (=> start!43108 e!281110))

(assert (=> start!43108 true))

(declare-fun e!281111 () Bool)

(declare-fun array_inv!10672 (array!30755) Bool)

(assert (=> start!43108 (and (array_inv!10672 _values!1516) e!281111)))

(declare-fun array_inv!10673 (array!30753) Bool)

(assert (=> start!43108 (array_inv!10673 _keys!1874)))

(declare-fun b!478233 () Bool)

(declare-fun mapRes!21991 () Bool)

(assert (=> b!478233 (= e!281111 (and e!281109 mapRes!21991))))

(declare-fun condMapEmpty!21991 () Bool)

(declare-fun mapDefault!21991 () ValueCell!6409)

