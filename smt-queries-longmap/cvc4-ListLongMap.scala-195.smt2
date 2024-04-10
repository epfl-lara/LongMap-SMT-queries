; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3794 () Bool)

(assert start!3794)

(declare-fun b!26540 () Bool)

(declare-fun res!15747 () Bool)

(declare-fun e!17305 () Bool)

(assert (=> b!26540 (=> (not res!15747) (not e!17305))))

(declare-datatypes ((V!1311 0))(
  ( (V!1312 (val!584 Int)) )
))
(declare-datatypes ((ValueCell!358 0))(
  ( (ValueCellFull!358 (v!1670 V!1311)) (EmptyCell!358) )
))
(declare-datatypes ((array!1473 0))(
  ( (array!1474 (arr!694 (Array (_ BitVec 32) ValueCell!358)) (size!795 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1473)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1475 0))(
  ( (array!1476 (arr!695 (Array (_ BitVec 32) (_ BitVec 64))) (size!796 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1475)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26540 (= res!15747 (and (= (size!795 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!796 _keys!1833) (size!795 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!15746 () Bool)

(assert (=> start!3794 (=> (not res!15746) (not e!17305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3794 (= res!15746 (validMask!0 mask!2294))))

(assert (=> start!3794 e!17305))

(assert (=> start!3794 true))

(declare-fun e!17307 () Bool)

(declare-fun array_inv!477 (array!1473) Bool)

(assert (=> start!3794 (and (array_inv!477 _values!1501) e!17307)))

(declare-fun array_inv!478 (array!1475) Bool)

(assert (=> start!3794 (array_inv!478 _keys!1833)))

(declare-fun b!26541 () Bool)

(assert (=> b!26541 (= e!17305 false)))

(declare-fun lt!10382 () Bool)

(declare-datatypes ((List!594 0))(
  ( (Nil!591) (Cons!590 (h!1157 (_ BitVec 64)) (t!3281 List!594)) )
))
(declare-fun arrayNoDuplicates!0 (array!1475 (_ BitVec 32) List!594) Bool)

(assert (=> b!26541 (= lt!10382 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!591))))

(declare-fun b!26542 () Bool)

(declare-fun e!17309 () Bool)

(declare-fun tp_is_empty!1115 () Bool)

(assert (=> b!26542 (= e!17309 tp_is_empty!1115)))

(declare-fun mapIsEmpty!1189 () Bool)

(declare-fun mapRes!1189 () Bool)

(assert (=> mapIsEmpty!1189 mapRes!1189))

(declare-fun b!26543 () Bool)

(declare-fun e!17306 () Bool)

(assert (=> b!26543 (= e!17307 (and e!17306 mapRes!1189))))

(declare-fun condMapEmpty!1189 () Bool)

(declare-fun mapDefault!1189 () ValueCell!358)

