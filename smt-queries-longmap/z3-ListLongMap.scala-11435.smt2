; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133410 () Bool)

(assert start!133410)

(declare-fun b!1559601 () Bool)

(declare-fun e!869026 () Bool)

(declare-fun e!869028 () Bool)

(declare-fun mapRes!59115 () Bool)

(assert (=> b!1559601 (= e!869026 (and e!869028 mapRes!59115))))

(declare-fun condMapEmpty!59115 () Bool)

(declare-datatypes ((V!59531 0))(
  ( (V!59532 (val!19330 Int)) )
))
(declare-datatypes ((ValueCell!18216 0))(
  ( (ValueCellFull!18216 (v!22082 V!59531)) (EmptyCell!18216) )
))
(declare-datatypes ((array!103712 0))(
  ( (array!103713 (arr!50048 (Array (_ BitVec 32) ValueCell!18216)) (size!50598 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103712)

(declare-fun mapDefault!59115 () ValueCell!18216)

(assert (=> b!1559601 (= condMapEmpty!59115 (= (arr!50048 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18216)) mapDefault!59115)))))

(declare-fun mapIsEmpty!59115 () Bool)

(assert (=> mapIsEmpty!59115 mapRes!59115))

(declare-fun b!1559602 () Bool)

(declare-fun res!1066494 () Bool)

(declare-fun e!869025 () Bool)

(assert (=> b!1559602 (=> (not res!1066494) (not e!869025))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103714 0))(
  ( (array!103715 (arr!50049 (Array (_ BitVec 32) (_ BitVec 64))) (size!50599 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103714)

(assert (=> b!1559602 (= res!1066494 (and (= (size!50598 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50599 _keys!637) (size!50598 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559603 () Bool)

(declare-fun res!1066492 () Bool)

(assert (=> b!1559603 (=> (not res!1066492) (not e!869025))))

(declare-datatypes ((List!36351 0))(
  ( (Nil!36348) (Cons!36347 (h!37793 (_ BitVec 64)) (t!51084 List!36351)) )
))
(declare-fun arrayNoDuplicates!0 (array!103714 (_ BitVec 32) List!36351) Bool)

(assert (=> b!1559603 (= res!1066492 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36348))))

(declare-fun b!1559604 () Bool)

(assert (=> b!1559604 (= e!869025 false)))

(declare-fun lt!670896 () Bool)

(declare-datatypes ((tuple2!25000 0))(
  ( (tuple2!25001 (_1!12511 (_ BitVec 64)) (_2!12511 V!59531)) )
))
(declare-datatypes ((List!36352 0))(
  ( (Nil!36349) (Cons!36348 (h!37794 tuple2!25000) (t!51085 List!36352)) )
))
(declare-datatypes ((ListLongMap!22435 0))(
  ( (ListLongMap!22436 (toList!11233 List!36352)) )
))
(declare-fun contains!10223 (ListLongMap!22435 (_ BitVec 64)) Bool)

(assert (=> b!1559604 (= lt!670896 (contains!10223 (ListLongMap!22436 Nil!36349) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559605 () Bool)

(declare-fun tp_is_empty!38493 () Bool)

(assert (=> b!1559605 (= e!869028 tp_is_empty!38493)))

(declare-fun b!1559606 () Bool)

(declare-fun res!1066495 () Bool)

(assert (=> b!1559606 (=> (not res!1066495) (not e!869025))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559606 (= res!1066495 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50599 _keys!637)) (bvsge from!782 (size!50599 _keys!637))))))

(declare-fun b!1559607 () Bool)

(declare-fun res!1066497 () Bool)

(assert (=> b!1559607 (=> (not res!1066497) (not e!869025))))

(assert (=> b!1559607 (= res!1066497 (not (contains!10223 (ListLongMap!22436 Nil!36349) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!59115 () Bool)

(declare-fun tp!112770 () Bool)

(declare-fun e!869027 () Bool)

(assert (=> mapNonEmpty!59115 (= mapRes!59115 (and tp!112770 e!869027))))

(declare-fun mapRest!59115 () (Array (_ BitVec 32) ValueCell!18216))

(declare-fun mapValue!59115 () ValueCell!18216)

(declare-fun mapKey!59115 () (_ BitVec 32))

(assert (=> mapNonEmpty!59115 (= (arr!50048 _values!487) (store mapRest!59115 mapKey!59115 mapValue!59115))))

(declare-fun b!1559608 () Bool)

(declare-fun res!1066496 () Bool)

(assert (=> b!1559608 (=> (not res!1066496) (not e!869025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103714 (_ BitVec 32)) Bool)

(assert (=> b!1559608 (= res!1066496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559609 () Bool)

(assert (=> b!1559609 (= e!869027 tp_is_empty!38493)))

(declare-fun res!1066493 () Bool)

(assert (=> start!133410 (=> (not res!1066493) (not e!869025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133410 (= res!1066493 (validMask!0 mask!947))))

(assert (=> start!133410 e!869025))

(assert (=> start!133410 true))

(declare-fun array_inv!38905 (array!103714) Bool)

(assert (=> start!133410 (array_inv!38905 _keys!637)))

(declare-fun array_inv!38906 (array!103712) Bool)

(assert (=> start!133410 (and (array_inv!38906 _values!487) e!869026)))

(assert (= (and start!133410 res!1066493) b!1559602))

(assert (= (and b!1559602 res!1066494) b!1559608))

(assert (= (and b!1559608 res!1066496) b!1559603))

(assert (= (and b!1559603 res!1066492) b!1559606))

(assert (= (and b!1559606 res!1066495) b!1559607))

(assert (= (and b!1559607 res!1066497) b!1559604))

(assert (= (and b!1559601 condMapEmpty!59115) mapIsEmpty!59115))

(assert (= (and b!1559601 (not condMapEmpty!59115)) mapNonEmpty!59115))

(get-info :version)

(assert (= (and mapNonEmpty!59115 ((_ is ValueCellFull!18216) mapValue!59115)) b!1559609))

(assert (= (and b!1559601 ((_ is ValueCellFull!18216) mapDefault!59115)) b!1559605))

(assert (= start!133410 b!1559601))

(declare-fun m!1435781 () Bool)

(assert (=> b!1559607 m!1435781))

(declare-fun m!1435783 () Bool)

(assert (=> b!1559603 m!1435783))

(declare-fun m!1435785 () Bool)

(assert (=> b!1559608 m!1435785))

(declare-fun m!1435787 () Bool)

(assert (=> b!1559604 m!1435787))

(declare-fun m!1435789 () Bool)

(assert (=> start!133410 m!1435789))

(declare-fun m!1435791 () Bool)

(assert (=> start!133410 m!1435791))

(declare-fun m!1435793 () Bool)

(assert (=> start!133410 m!1435793))

(declare-fun m!1435795 () Bool)

(assert (=> mapNonEmpty!59115 m!1435795))

(check-sat (not mapNonEmpty!59115) (not start!133410) (not b!1559607) (not b!1559608) tp_is_empty!38493 (not b!1559604) (not b!1559603))
(check-sat)
