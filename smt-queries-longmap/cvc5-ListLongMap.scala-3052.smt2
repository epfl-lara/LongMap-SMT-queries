; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43110 () Bool)

(assert start!43110)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun b!478242 () Bool)

(declare-fun e!281125 () Bool)

(declare-datatypes ((array!30757 0))(
  ( (array!30758 (arr!14791 (Array (_ BitVec 32) (_ BitVec 64))) (size!15149 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30757)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19129 0))(
  ( (V!19130 (val!6819 Int)) )
))
(declare-datatypes ((ValueCell!6410 0))(
  ( (ValueCellFull!6410 (v!9107 V!19129)) (EmptyCell!6410) )
))
(declare-datatypes ((array!30759 0))(
  ( (array!30760 (arr!14792 (Array (_ BitVec 32) ValueCell!6410)) (size!15150 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30759)

(assert (=> b!478242 (= e!281125 (and (= (size!15150 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15149 _keys!1874) (size!15150 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011) (= (size!15149 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352)) (bvsgt #b00000000000000000000000000000000 (size!15149 _keys!1874))))))

(declare-fun b!478243 () Bool)

(declare-fun e!281126 () Bool)

(declare-fun e!281128 () Bool)

(declare-fun mapRes!21994 () Bool)

(assert (=> b!478243 (= e!281126 (and e!281128 mapRes!21994))))

(declare-fun condMapEmpty!21994 () Bool)

(declare-fun mapDefault!21994 () ValueCell!6410)

