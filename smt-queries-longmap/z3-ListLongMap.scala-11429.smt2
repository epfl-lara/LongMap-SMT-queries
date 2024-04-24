; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133740 () Bool)

(assert start!133740)

(declare-fun b!1561568 () Bool)

(declare-fun e!870154 () Bool)

(declare-fun e!870157 () Bool)

(declare-fun mapRes!59043 () Bool)

(assert (=> b!1561568 (= e!870154 (and e!870157 mapRes!59043))))

(declare-fun condMapEmpty!59043 () Bool)

(declare-datatypes ((V!59481 0))(
  ( (V!59482 (val!19311 Int)) )
))
(declare-datatypes ((ValueCell!18197 0))(
  ( (ValueCellFull!18197 (v!22054 V!59481)) (EmptyCell!18197) )
))
(declare-datatypes ((array!103760 0))(
  ( (array!103761 (arr!50070 (Array (_ BitVec 32) ValueCell!18197)) (size!50621 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103760)

(declare-fun mapDefault!59043 () ValueCell!18197)

(assert (=> b!1561568 (= condMapEmpty!59043 (= (arr!50070 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18197)) mapDefault!59043)))))

(declare-fun res!1067118 () Bool)

(declare-fun e!870158 () Bool)

(assert (=> start!133740 (=> (not res!1067118) (not e!870158))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133740 (= res!1067118 (validMask!0 mask!947))))

(assert (=> start!133740 e!870158))

(assert (=> start!133740 true))

(declare-fun array_inv!39183 (array!103760) Bool)

(assert (=> start!133740 (and (array_inv!39183 _values!487) e!870154)))

(declare-datatypes ((array!103762 0))(
  ( (array!103763 (arr!50071 (Array (_ BitVec 32) (_ BitVec 64))) (size!50622 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103762)

(declare-fun array_inv!39184 (array!103762) Bool)

(assert (=> start!133740 (array_inv!39184 _keys!637)))

(declare-fun b!1561569 () Bool)

(declare-fun e!870156 () Bool)

(declare-fun tp_is_empty!38455 () Bool)

(assert (=> b!1561569 (= e!870156 tp_is_empty!38455)))

(declare-fun mapIsEmpty!59043 () Bool)

(assert (=> mapIsEmpty!59043 mapRes!59043))

(declare-fun b!1561570 () Bool)

(assert (=> b!1561570 (= e!870157 tp_is_empty!38455)))

(declare-fun mapNonEmpty!59043 () Bool)

(declare-fun tp!112698 () Bool)

(assert (=> mapNonEmpty!59043 (= mapRes!59043 (and tp!112698 e!870156))))

(declare-fun mapValue!59043 () ValueCell!18197)

(declare-fun mapKey!59043 () (_ BitVec 32))

(declare-fun mapRest!59043 () (Array (_ BitVec 32) ValueCell!18197))

(assert (=> mapNonEmpty!59043 (= (arr!50070 _values!487) (store mapRest!59043 mapKey!59043 mapValue!59043))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun b!1561571 () Bool)

(assert (=> b!1561571 (= e!870158 (and (= (size!50621 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50622 _keys!637) (size!50621 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011) (not (= (size!50622 _keys!637) (bvadd #b00000000000000000000000000000001 mask!947)))))))

(assert (= (and start!133740 res!1067118) b!1561571))

(assert (= (and b!1561568 condMapEmpty!59043) mapIsEmpty!59043))

(assert (= (and b!1561568 (not condMapEmpty!59043)) mapNonEmpty!59043))

(get-info :version)

(assert (= (and mapNonEmpty!59043 ((_ is ValueCellFull!18197) mapValue!59043)) b!1561569))

(assert (= (and b!1561568 ((_ is ValueCellFull!18197) mapDefault!59043)) b!1561570))

(assert (= start!133740 b!1561568))

(declare-fun m!1437755 () Bool)

(assert (=> start!133740 m!1437755))

(declare-fun m!1437757 () Bool)

(assert (=> start!133740 m!1437757))

(declare-fun m!1437759 () Bool)

(assert (=> start!133740 m!1437759))

(declare-fun m!1437761 () Bool)

(assert (=> mapNonEmpty!59043 m!1437761))

(check-sat (not start!133740) (not mapNonEmpty!59043) tp_is_empty!38455)
(check-sat)
