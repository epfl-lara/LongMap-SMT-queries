; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133278 () Bool)

(assert start!133278)

(declare-fun b!1558819 () Bool)

(declare-fun e!868451 () Bool)

(declare-fun tp_is_empty!38455 () Bool)

(assert (=> b!1558819 (= e!868451 tp_is_empty!38455)))

(declare-fun mapIsEmpty!59043 () Bool)

(declare-fun mapRes!59043 () Bool)

(assert (=> mapIsEmpty!59043 mapRes!59043))

(declare-fun b!1558821 () Bool)

(declare-fun e!868450 () Bool)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103556 0))(
  ( (array!103557 (arr!49976 (Array (_ BitVec 32) (_ BitVec 64))) (size!50528 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103556)

(declare-datatypes ((V!59481 0))(
  ( (V!59482 (val!19311 Int)) )
))
(declare-datatypes ((ValueCell!18197 0))(
  ( (ValueCellFull!18197 (v!22058 V!59481)) (EmptyCell!18197) )
))
(declare-datatypes ((array!103558 0))(
  ( (array!103559 (arr!49977 (Array (_ BitVec 32) ValueCell!18197)) (size!50529 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103558)

(assert (=> b!1558821 (= e!868450 (and (= (size!50529 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50528 _keys!637) (size!50529 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011) (not (= (size!50528 _keys!637) (bvadd #b00000000000000000000000000000001 mask!947)))))))

(declare-fun b!1558822 () Bool)

(declare-fun e!868447 () Bool)

(assert (=> b!1558822 (= e!868447 (and e!868451 mapRes!59043))))

(declare-fun condMapEmpty!59043 () Bool)

(declare-fun mapDefault!59043 () ValueCell!18197)

(assert (=> b!1558822 (= condMapEmpty!59043 (= (arr!49977 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18197)) mapDefault!59043)))))

(declare-fun mapNonEmpty!59043 () Bool)

(declare-fun tp!112699 () Bool)

(declare-fun e!868449 () Bool)

(assert (=> mapNonEmpty!59043 (= mapRes!59043 (and tp!112699 e!868449))))

(declare-fun mapValue!59043 () ValueCell!18197)

(declare-fun mapKey!59043 () (_ BitVec 32))

(declare-fun mapRest!59043 () (Array (_ BitVec 32) ValueCell!18197))

(assert (=> mapNonEmpty!59043 (= (arr!49977 _values!487) (store mapRest!59043 mapKey!59043 mapValue!59043))))

(declare-fun res!1066129 () Bool)

(assert (=> start!133278 (=> (not res!1066129) (not e!868450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133278 (= res!1066129 (validMask!0 mask!947))))

(assert (=> start!133278 e!868450))

(assert (=> start!133278 true))

(declare-fun array_inv!39055 (array!103558) Bool)

(assert (=> start!133278 (and (array_inv!39055 _values!487) e!868447)))

(declare-fun array_inv!39056 (array!103556) Bool)

(assert (=> start!133278 (array_inv!39056 _keys!637)))

(declare-fun b!1558820 () Bool)

(assert (=> b!1558820 (= e!868449 tp_is_empty!38455)))

(assert (= (and start!133278 res!1066129) b!1558821))

(assert (= (and b!1558822 condMapEmpty!59043) mapIsEmpty!59043))

(assert (= (and b!1558822 (not condMapEmpty!59043)) mapNonEmpty!59043))

(get-info :version)

(assert (= (and mapNonEmpty!59043 ((_ is ValueCellFull!18197) mapValue!59043)) b!1558820))

(assert (= (and b!1558822 ((_ is ValueCellFull!18197) mapDefault!59043)) b!1558819))

(assert (= start!133278 b!1558822))

(declare-fun m!1434605 () Bool)

(assert (=> mapNonEmpty!59043 m!1434605))

(declare-fun m!1434607 () Bool)

(assert (=> start!133278 m!1434607))

(declare-fun m!1434609 () Bool)

(assert (=> start!133278 m!1434609))

(declare-fun m!1434611 () Bool)

(assert (=> start!133278 m!1434611))

(check-sat (not start!133278) (not mapNonEmpty!59043) tp_is_empty!38455)
(check-sat)
