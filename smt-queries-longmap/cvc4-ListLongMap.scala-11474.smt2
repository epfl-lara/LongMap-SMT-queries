; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133646 () Bool)

(assert start!133646)

(declare-fun b!1562670 () Bool)

(declare-fun e!870806 () Bool)

(assert (=> b!1562670 (= e!870806 false)))

(declare-fun lt!671763 () Bool)

(declare-datatypes ((array!104172 0))(
  ( (array!104173 (arr!50278 (Array (_ BitVec 32) (_ BitVec 64))) (size!50828 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104172)

(declare-datatypes ((List!36496 0))(
  ( (Nil!36493) (Cons!36492 (h!37938 (_ BitVec 64)) (t!51343 List!36496)) )
))
(declare-fun arrayNoDuplicates!0 (array!104172 (_ BitVec 32) List!36496) Bool)

(assert (=> b!1562670 (= lt!671763 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36493))))

(declare-fun mapNonEmpty!59469 () Bool)

(declare-fun mapRes!59469 () Bool)

(declare-fun tp!113304 () Bool)

(declare-fun e!870805 () Bool)

(assert (=> mapNonEmpty!59469 (= mapRes!59469 (and tp!113304 e!870805))))

(declare-fun mapKey!59469 () (_ BitVec 32))

(declare-datatypes ((V!59845 0))(
  ( (V!59846 (val!19448 Int)) )
))
(declare-datatypes ((ValueCell!18334 0))(
  ( (ValueCellFull!18334 (v!22200 V!59845)) (EmptyCell!18334) )
))
(declare-datatypes ((array!104174 0))(
  ( (array!104175 (arr!50279 (Array (_ BitVec 32) ValueCell!18334)) (size!50829 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104174)

(declare-fun mapRest!59469 () (Array (_ BitVec 32) ValueCell!18334))

(declare-fun mapValue!59469 () ValueCell!18334)

(assert (=> mapNonEmpty!59469 (= (arr!50279 _values!487) (store mapRest!59469 mapKey!59469 mapValue!59469))))

(declare-fun res!1068387 () Bool)

(assert (=> start!133646 (=> (not res!1068387) (not e!870806))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133646 (= res!1068387 (validMask!0 mask!947))))

(assert (=> start!133646 e!870806))

(assert (=> start!133646 true))

(declare-fun e!870804 () Bool)

(declare-fun array_inv!39079 (array!104174) Bool)

(assert (=> start!133646 (and (array_inv!39079 _values!487) e!870804)))

(declare-fun array_inv!39080 (array!104172) Bool)

(assert (=> start!133646 (array_inv!39080 _keys!637)))

(declare-fun b!1562671 () Bool)

(declare-fun e!870807 () Bool)

(declare-fun tp_is_empty!38729 () Bool)

(assert (=> b!1562671 (= e!870807 tp_is_empty!38729)))

(declare-fun b!1562672 () Bool)

(declare-fun res!1068385 () Bool)

(assert (=> b!1562672 (=> (not res!1068385) (not e!870806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104172 (_ BitVec 32)) Bool)

(assert (=> b!1562672 (= res!1068385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562673 () Bool)

(declare-fun res!1068386 () Bool)

(assert (=> b!1562673 (=> (not res!1068386) (not e!870806))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562673 (= res!1068386 (and (= (size!50829 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50828 _keys!637) (size!50829 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562674 () Bool)

(assert (=> b!1562674 (= e!870805 tp_is_empty!38729)))

(declare-fun b!1562675 () Bool)

(assert (=> b!1562675 (= e!870804 (and e!870807 mapRes!59469))))

(declare-fun condMapEmpty!59469 () Bool)

(declare-fun mapDefault!59469 () ValueCell!18334)

