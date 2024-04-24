; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133746 () Bool)

(assert start!133746)

(declare-fun b!1561604 () Bool)

(declare-fun e!870199 () Bool)

(declare-fun tp_is_empty!38461 () Bool)

(assert (=> b!1561604 (= e!870199 tp_is_empty!38461)))

(declare-fun b!1561605 () Bool)

(declare-fun e!870203 () Bool)

(declare-fun e!870201 () Bool)

(declare-fun mapRes!59052 () Bool)

(assert (=> b!1561605 (= e!870203 (and e!870201 mapRes!59052))))

(declare-fun condMapEmpty!59052 () Bool)

(declare-datatypes ((V!59489 0))(
  ( (V!59490 (val!19314 Int)) )
))
(declare-datatypes ((ValueCell!18200 0))(
  ( (ValueCellFull!18200 (v!22057 V!59489)) (EmptyCell!18200) )
))
(declare-datatypes ((array!103770 0))(
  ( (array!103771 (arr!50075 (Array (_ BitVec 32) ValueCell!18200)) (size!50626 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103770)

(declare-fun mapDefault!59052 () ValueCell!18200)

(assert (=> b!1561605 (= condMapEmpty!59052 (= (arr!50075 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18200)) mapDefault!59052)))))

(declare-fun b!1561606 () Bool)

(assert (=> b!1561606 (= e!870201 tp_is_empty!38461)))

(declare-fun mapNonEmpty!59052 () Bool)

(declare-fun tp!112707 () Bool)

(assert (=> mapNonEmpty!59052 (= mapRes!59052 (and tp!112707 e!870199))))

(declare-fun mapValue!59052 () ValueCell!18200)

(declare-fun mapRest!59052 () (Array (_ BitVec 32) ValueCell!18200))

(declare-fun mapKey!59052 () (_ BitVec 32))

(assert (=> mapNonEmpty!59052 (= (arr!50075 _values!487) (store mapRest!59052 mapKey!59052 mapValue!59052))))

(declare-fun mapIsEmpty!59052 () Bool)

(assert (=> mapIsEmpty!59052 mapRes!59052))

(declare-fun res!1067127 () Bool)

(declare-fun e!870200 () Bool)

(assert (=> start!133746 (=> (not res!1067127) (not e!870200))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133746 (= res!1067127 (validMask!0 mask!947))))

(assert (=> start!133746 e!870200))

(assert (=> start!133746 true))

(declare-fun array_inv!39187 (array!103770) Bool)

(assert (=> start!133746 (and (array_inv!39187 _values!487) e!870203)))

(declare-datatypes ((array!103772 0))(
  ( (array!103773 (arr!50076 (Array (_ BitVec 32) (_ BitVec 64))) (size!50627 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103772)

(declare-fun array_inv!39188 (array!103772) Bool)

(assert (=> start!133746 (array_inv!39188 _keys!637)))

(declare-fun b!1561607 () Bool)

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561607 (= e!870200 (and (= (size!50626 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50627 _keys!637) (size!50626 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011) (= (size!50627 _keys!637) (bvadd #b00000000000000000000000000000001 mask!947)) (bvsgt #b00000000000000000000000000000000 (size!50627 _keys!637))))))

(assert (= (and start!133746 res!1067127) b!1561607))

(assert (= (and b!1561605 condMapEmpty!59052) mapIsEmpty!59052))

(assert (= (and b!1561605 (not condMapEmpty!59052)) mapNonEmpty!59052))

(get-info :version)

(assert (= (and mapNonEmpty!59052 ((_ is ValueCellFull!18200) mapValue!59052)) b!1561604))

(assert (= (and b!1561605 ((_ is ValueCellFull!18200) mapDefault!59052)) b!1561606))

(assert (= start!133746 b!1561605))

(declare-fun m!1437779 () Bool)

(assert (=> mapNonEmpty!59052 m!1437779))

(declare-fun m!1437781 () Bool)

(assert (=> start!133746 m!1437781))

(declare-fun m!1437783 () Bool)

(assert (=> start!133746 m!1437783))

(declare-fun m!1437785 () Bool)

(assert (=> start!133746 m!1437785))

(check-sat (not start!133746) (not mapNonEmpty!59052) tp_is_empty!38461)
(check-sat)
(get-model)

(declare-fun d!163595 () Bool)

(assert (=> d!163595 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133746 d!163595))

(declare-fun d!163597 () Bool)

(assert (=> d!163597 (= (array_inv!39187 _values!487) (bvsge (size!50626 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133746 d!163597))

(declare-fun d!163599 () Bool)

(assert (=> d!163599 (= (array_inv!39188 _keys!637) (bvsge (size!50627 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133746 d!163599))

(declare-fun b!1561638 () Bool)

(declare-fun e!870238 () Bool)

(assert (=> b!1561638 (= e!870238 tp_is_empty!38461)))

(declare-fun mapNonEmpty!59061 () Bool)

(declare-fun mapRes!59061 () Bool)

(declare-fun tp!112716 () Bool)

(assert (=> mapNonEmpty!59061 (= mapRes!59061 (and tp!112716 e!870238))))

(declare-fun mapRest!59061 () (Array (_ BitVec 32) ValueCell!18200))

(declare-fun mapValue!59061 () ValueCell!18200)

(declare-fun mapKey!59061 () (_ BitVec 32))

(assert (=> mapNonEmpty!59061 (= mapRest!59052 (store mapRest!59061 mapKey!59061 mapValue!59061))))

(declare-fun condMapEmpty!59061 () Bool)

(declare-fun mapDefault!59061 () ValueCell!18200)

(assert (=> mapNonEmpty!59052 (= condMapEmpty!59061 (= mapRest!59052 ((as const (Array (_ BitVec 32) ValueCell!18200)) mapDefault!59061)))))

(declare-fun e!870239 () Bool)

(assert (=> mapNonEmpty!59052 (= tp!112707 (and e!870239 mapRes!59061))))

(declare-fun b!1561639 () Bool)

(assert (=> b!1561639 (= e!870239 tp_is_empty!38461)))

(declare-fun mapIsEmpty!59061 () Bool)

(assert (=> mapIsEmpty!59061 mapRes!59061))

(assert (= (and mapNonEmpty!59052 condMapEmpty!59061) mapIsEmpty!59061))

(assert (= (and mapNonEmpty!59052 (not condMapEmpty!59061)) mapNonEmpty!59061))

(assert (= (and mapNonEmpty!59061 ((_ is ValueCellFull!18200) mapValue!59061)) b!1561638))

(assert (= (and mapNonEmpty!59052 ((_ is ValueCellFull!18200) mapDefault!59061)) b!1561639))

(declare-fun m!1437803 () Bool)

(assert (=> mapNonEmpty!59061 m!1437803))

(check-sat (not mapNonEmpty!59061) tp_is_empty!38461)
(check-sat)
