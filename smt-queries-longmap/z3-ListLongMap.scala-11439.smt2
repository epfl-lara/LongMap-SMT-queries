; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133382 () Bool)

(assert start!133382)

(declare-fun b!1559585 () Bool)

(declare-fun res!1066563 () Bool)

(declare-fun e!868995 () Bool)

(assert (=> b!1559585 (=> (not res!1066563) (not e!868995))))

(declare-datatypes ((array!103676 0))(
  ( (array!103677 (arr!50031 (Array (_ BitVec 32) (_ BitVec 64))) (size!50583 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103676)

(declare-datatypes ((List!36410 0))(
  ( (Nil!36407) (Cons!36406 (h!37853 (_ BitVec 64)) (t!51135 List!36410)) )
))
(declare-fun arrayNoDuplicates!0 (array!103676 (_ BitVec 32) List!36410) Bool)

(assert (=> b!1559585 (= res!1066563 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36407))))

(declare-fun b!1559586 () Bool)

(declare-fun e!868993 () Bool)

(declare-fun tp_is_empty!38515 () Bool)

(assert (=> b!1559586 (= e!868993 tp_is_empty!38515)))

(declare-fun res!1066562 () Bool)

(assert (=> start!133382 (=> (not res!1066562) (not e!868995))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133382 (= res!1066562 (validMask!0 mask!947))))

(assert (=> start!133382 e!868995))

(assert (=> start!133382 true))

(declare-fun array_inv!39097 (array!103676) Bool)

(assert (=> start!133382 (array_inv!39097 _keys!637)))

(declare-datatypes ((V!59561 0))(
  ( (V!59562 (val!19341 Int)) )
))
(declare-datatypes ((ValueCell!18227 0))(
  ( (ValueCellFull!18227 (v!22089 V!59561)) (EmptyCell!18227) )
))
(declare-datatypes ((array!103678 0))(
  ( (array!103679 (arr!50032 (Array (_ BitVec 32) ValueCell!18227)) (size!50584 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103678)

(declare-fun e!868996 () Bool)

(declare-fun array_inv!39098 (array!103678) Bool)

(assert (=> start!133382 (and (array_inv!39098 _values!487) e!868996)))

(declare-fun b!1559587 () Bool)

(declare-fun res!1066564 () Bool)

(assert (=> b!1559587 (=> (not res!1066564) (not e!868995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103676 (_ BitVec 32)) Bool)

(assert (=> b!1559587 (= res!1066564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559588 () Bool)

(declare-fun res!1066565 () Bool)

(assert (=> b!1559588 (=> (not res!1066565) (not e!868995))))

(declare-datatypes ((tuple2!25090 0))(
  ( (tuple2!25091 (_1!12556 (_ BitVec 64)) (_2!12556 V!59561)) )
))
(declare-datatypes ((List!36411 0))(
  ( (Nil!36408) (Cons!36407 (h!37854 tuple2!25090) (t!51136 List!36411)) )
))
(declare-datatypes ((ListLongMap!22525 0))(
  ( (ListLongMap!22526 (toList!11278 List!36411)) )
))
(declare-fun contains!10188 (ListLongMap!22525 (_ BitVec 64)) Bool)

(assert (=> b!1559588 (= res!1066565 (not (contains!10188 (ListLongMap!22526 Nil!36408) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559589 () Bool)

(declare-fun res!1066561 () Bool)

(assert (=> b!1559589 (=> (not res!1066561) (not e!868995))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559589 (= res!1066561 (and (= (size!50584 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50583 _keys!637) (size!50584 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59148 () Bool)

(declare-fun mapRes!59148 () Bool)

(declare-fun tp!112804 () Bool)

(declare-fun e!868992 () Bool)

(assert (=> mapNonEmpty!59148 (= mapRes!59148 (and tp!112804 e!868992))))

(declare-fun mapValue!59148 () ValueCell!18227)

(declare-fun mapRest!59148 () (Array (_ BitVec 32) ValueCell!18227))

(declare-fun mapKey!59148 () (_ BitVec 32))

(assert (=> mapNonEmpty!59148 (= (arr!50032 _values!487) (store mapRest!59148 mapKey!59148 mapValue!59148))))

(declare-fun b!1559590 () Bool)

(assert (=> b!1559590 (= e!868992 tp_is_empty!38515)))

(declare-fun mapIsEmpty!59148 () Bool)

(assert (=> mapIsEmpty!59148 mapRes!59148))

(declare-fun b!1559591 () Bool)

(assert (=> b!1559591 (= e!868996 (and e!868993 mapRes!59148))))

(declare-fun condMapEmpty!59148 () Bool)

(declare-fun mapDefault!59148 () ValueCell!18227)

(assert (=> b!1559591 (= condMapEmpty!59148 (= (arr!50032 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18227)) mapDefault!59148)))))

(declare-fun b!1559592 () Bool)

(declare-fun res!1066566 () Bool)

(assert (=> b!1559592 (=> (not res!1066566) (not e!868995))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559592 (= res!1066566 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50583 _keys!637)) (bvsge from!782 (size!50583 _keys!637))))))

(declare-fun b!1559593 () Bool)

(assert (=> b!1559593 (= e!868995 false)))

(declare-fun lt!670643 () Bool)

(assert (=> b!1559593 (= lt!670643 (contains!10188 (ListLongMap!22526 Nil!36408) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!133382 res!1066562) b!1559589))

(assert (= (and b!1559589 res!1066561) b!1559587))

(assert (= (and b!1559587 res!1066564) b!1559585))

(assert (= (and b!1559585 res!1066563) b!1559592))

(assert (= (and b!1559592 res!1066566) b!1559588))

(assert (= (and b!1559588 res!1066565) b!1559593))

(assert (= (and b!1559591 condMapEmpty!59148) mapIsEmpty!59148))

(assert (= (and b!1559591 (not condMapEmpty!59148)) mapNonEmpty!59148))

(get-info :version)

(assert (= (and mapNonEmpty!59148 ((_ is ValueCellFull!18227) mapValue!59148)) b!1559590))

(assert (= (and b!1559591 ((_ is ValueCellFull!18227) mapDefault!59148)) b!1559586))

(assert (= start!133382 b!1559591))

(declare-fun m!1435065 () Bool)

(assert (=> start!133382 m!1435065))

(declare-fun m!1435067 () Bool)

(assert (=> start!133382 m!1435067))

(declare-fun m!1435069 () Bool)

(assert (=> start!133382 m!1435069))

(declare-fun m!1435071 () Bool)

(assert (=> b!1559588 m!1435071))

(declare-fun m!1435073 () Bool)

(assert (=> mapNonEmpty!59148 m!1435073))

(declare-fun m!1435075 () Bool)

(assert (=> b!1559585 m!1435075))

(declare-fun m!1435077 () Bool)

(assert (=> b!1559587 m!1435077))

(declare-fun m!1435079 () Bool)

(assert (=> b!1559593 m!1435079))

(check-sat (not mapNonEmpty!59148) (not b!1559593) (not start!133382) (not b!1559587) (not b!1559585) (not b!1559588) tp_is_empty!38515)
(check-sat)
