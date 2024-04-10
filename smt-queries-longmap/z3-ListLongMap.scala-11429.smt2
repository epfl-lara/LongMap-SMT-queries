; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133330 () Bool)

(assert start!133330)

(declare-fun res!1066261 () Bool)

(declare-fun e!868664 () Bool)

(assert (=> start!133330 (=> (not res!1066261) (not e!868664))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133330 (= res!1066261 (validMask!0 mask!947))))

(assert (=> start!133330 e!868664))

(assert (=> start!133330 true))

(declare-datatypes ((V!59483 0))(
  ( (V!59484 (val!19312 Int)) )
))
(declare-datatypes ((ValueCell!18198 0))(
  ( (ValueCellFull!18198 (v!22063 V!59483)) (EmptyCell!18198) )
))
(declare-datatypes ((array!103638 0))(
  ( (array!103639 (arr!50016 (Array (_ BitVec 32) ValueCell!18198)) (size!50566 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103638)

(declare-fun e!868662 () Bool)

(declare-fun array_inv!38881 (array!103638) Bool)

(assert (=> start!133330 (and (array_inv!38881 _values!487) e!868662)))

(declare-datatypes ((array!103640 0))(
  ( (array!103641 (arr!50017 (Array (_ BitVec 32) (_ BitVec 64))) (size!50567 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103640)

(declare-fun array_inv!38882 (array!103640) Bool)

(assert (=> start!133330 (array_inv!38882 _keys!637)))

(declare-fun b!1559144 () Bool)

(declare-fun e!868663 () Bool)

(declare-fun mapRes!59046 () Bool)

(assert (=> b!1559144 (= e!868662 (and e!868663 mapRes!59046))))

(declare-fun condMapEmpty!59046 () Bool)

(declare-fun mapDefault!59046 () ValueCell!18198)

(assert (=> b!1559144 (= condMapEmpty!59046 (= (arr!50016 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18198)) mapDefault!59046)))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun b!1559145 () Bool)

(assert (=> b!1559145 (= e!868664 (and (= (size!50566 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50567 _keys!637) (size!50566 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011) (not (= (size!50567 _keys!637) (bvadd #b00000000000000000000000000000001 mask!947)))))))

(declare-fun b!1559146 () Bool)

(declare-fun e!868660 () Bool)

(declare-fun tp_is_empty!38457 () Bool)

(assert (=> b!1559146 (= e!868660 tp_is_empty!38457)))

(declare-fun b!1559147 () Bool)

(assert (=> b!1559147 (= e!868663 tp_is_empty!38457)))

(declare-fun mapIsEmpty!59046 () Bool)

(assert (=> mapIsEmpty!59046 mapRes!59046))

(declare-fun mapNonEmpty!59046 () Bool)

(declare-fun tp!112701 () Bool)

(assert (=> mapNonEmpty!59046 (= mapRes!59046 (and tp!112701 e!868660))))

(declare-fun mapKey!59046 () (_ BitVec 32))

(declare-fun mapRest!59046 () (Array (_ BitVec 32) ValueCell!18198))

(declare-fun mapValue!59046 () ValueCell!18198)

(assert (=> mapNonEmpty!59046 (= (arr!50016 _values!487) (store mapRest!59046 mapKey!59046 mapValue!59046))))

(assert (= (and start!133330 res!1066261) b!1559145))

(assert (= (and b!1559144 condMapEmpty!59046) mapIsEmpty!59046))

(assert (= (and b!1559144 (not condMapEmpty!59046)) mapNonEmpty!59046))

(get-info :version)

(assert (= (and mapNonEmpty!59046 ((_ is ValueCellFull!18198) mapValue!59046)) b!1559146))

(assert (= (and b!1559144 ((_ is ValueCellFull!18198) mapDefault!59046)) b!1559147))

(assert (= start!133330 b!1559144))

(declare-fun m!1435505 () Bool)

(assert (=> start!133330 m!1435505))

(declare-fun m!1435507 () Bool)

(assert (=> start!133330 m!1435507))

(declare-fun m!1435509 () Bool)

(assert (=> start!133330 m!1435509))

(declare-fun m!1435511 () Bool)

(assert (=> mapNonEmpty!59046 m!1435511))

(check-sat (not start!133330) (not mapNonEmpty!59046) tp_is_empty!38457)
(check-sat)
