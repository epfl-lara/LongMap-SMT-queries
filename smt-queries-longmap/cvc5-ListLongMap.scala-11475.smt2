; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133648 () Bool)

(assert start!133648)

(declare-fun b!1562688 () Bool)

(declare-fun e!870823 () Bool)

(assert (=> b!1562688 (= e!870823 false)))

(declare-fun lt!671766 () Bool)

(declare-datatypes ((array!104176 0))(
  ( (array!104177 (arr!50280 (Array (_ BitVec 32) (_ BitVec 64))) (size!50830 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104176)

(declare-datatypes ((List!36497 0))(
  ( (Nil!36494) (Cons!36493 (h!37939 (_ BitVec 64)) (t!51344 List!36497)) )
))
(declare-fun arrayNoDuplicates!0 (array!104176 (_ BitVec 32) List!36497) Bool)

(assert (=> b!1562688 (= lt!671766 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36494))))

(declare-fun b!1562689 () Bool)

(declare-fun e!870822 () Bool)

(declare-fun tp_is_empty!38731 () Bool)

(assert (=> b!1562689 (= e!870822 tp_is_empty!38731)))

(declare-fun mapNonEmpty!59472 () Bool)

(declare-fun mapRes!59472 () Bool)

(declare-fun tp!113307 () Bool)

(declare-fun e!870821 () Bool)

(assert (=> mapNonEmpty!59472 (= mapRes!59472 (and tp!113307 e!870821))))

(declare-datatypes ((V!59849 0))(
  ( (V!59850 (val!19449 Int)) )
))
(declare-datatypes ((ValueCell!18335 0))(
  ( (ValueCellFull!18335 (v!22201 V!59849)) (EmptyCell!18335) )
))
(declare-fun mapValue!59472 () ValueCell!18335)

(declare-fun mapRest!59472 () (Array (_ BitVec 32) ValueCell!18335))

(declare-datatypes ((array!104178 0))(
  ( (array!104179 (arr!50281 (Array (_ BitVec 32) ValueCell!18335)) (size!50831 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104178)

(declare-fun mapKey!59472 () (_ BitVec 32))

(assert (=> mapNonEmpty!59472 (= (arr!50281 _values!487) (store mapRest!59472 mapKey!59472 mapValue!59472))))

(declare-fun res!1068394 () Bool)

(assert (=> start!133648 (=> (not res!1068394) (not e!870823))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133648 (= res!1068394 (validMask!0 mask!947))))

(assert (=> start!133648 e!870823))

(assert (=> start!133648 true))

(declare-fun e!870819 () Bool)

(declare-fun array_inv!39081 (array!104178) Bool)

(assert (=> start!133648 (and (array_inv!39081 _values!487) e!870819)))

(declare-fun array_inv!39082 (array!104176) Bool)

(assert (=> start!133648 (array_inv!39082 _keys!637)))

(declare-fun b!1562690 () Bool)

(declare-fun res!1068395 () Bool)

(assert (=> b!1562690 (=> (not res!1068395) (not e!870823))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562690 (= res!1068395 (and (= (size!50831 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50830 _keys!637) (size!50831 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59472 () Bool)

(assert (=> mapIsEmpty!59472 mapRes!59472))

(declare-fun b!1562691 () Bool)

(assert (=> b!1562691 (= e!870819 (and e!870822 mapRes!59472))))

(declare-fun condMapEmpty!59472 () Bool)

(declare-fun mapDefault!59472 () ValueCell!18335)

