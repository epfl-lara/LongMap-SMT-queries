; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133284 () Bool)

(assert start!133284)

(declare-fun mapNonEmpty!59052 () Bool)

(declare-fun mapRes!59052 () Bool)

(declare-fun tp!112708 () Bool)

(declare-fun e!868492 () Bool)

(assert (=> mapNonEmpty!59052 (= mapRes!59052 (and tp!112708 e!868492))))

(declare-datatypes ((V!59489 0))(
  ( (V!59490 (val!19314 Int)) )
))
(declare-datatypes ((ValueCell!18200 0))(
  ( (ValueCellFull!18200 (v!22061 V!59489)) (EmptyCell!18200) )
))
(declare-fun mapValue!59052 () ValueCell!18200)

(declare-fun mapRest!59052 () (Array (_ BitVec 32) ValueCell!18200))

(declare-datatypes ((array!103568 0))(
  ( (array!103569 (arr!49982 (Array (_ BitVec 32) ValueCell!18200)) (size!50534 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103568)

(declare-fun mapKey!59052 () (_ BitVec 32))

(assert (=> mapNonEmpty!59052 (= (arr!49982 _values!487) (store mapRest!59052 mapKey!59052 mapValue!59052))))

(declare-fun res!1066138 () Bool)

(declare-fun e!868494 () Bool)

(assert (=> start!133284 (=> (not res!1066138) (not e!868494))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133284 (= res!1066138 (validMask!0 mask!947))))

(assert (=> start!133284 e!868494))

(assert (=> start!133284 true))

(declare-fun e!868493 () Bool)

(declare-fun array_inv!39057 (array!103568) Bool)

(assert (=> start!133284 (and (array_inv!39057 _values!487) e!868493)))

(declare-datatypes ((array!103570 0))(
  ( (array!103571 (arr!49983 (Array (_ BitVec 32) (_ BitVec 64))) (size!50535 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103570)

(declare-fun array_inv!39058 (array!103570) Bool)

(assert (=> start!133284 (array_inv!39058 _keys!637)))

(declare-fun b!1558855 () Bool)

(declare-fun tp_is_empty!38461 () Bool)

(assert (=> b!1558855 (= e!868492 tp_is_empty!38461)))

(declare-fun mapIsEmpty!59052 () Bool)

(assert (=> mapIsEmpty!59052 mapRes!59052))

(declare-fun b!1558856 () Bool)

(declare-fun e!868496 () Bool)

(assert (=> b!1558856 (= e!868496 tp_is_empty!38461)))

(declare-fun b!1558857 () Bool)

(assert (=> b!1558857 (= e!868493 (and e!868496 mapRes!59052))))

(declare-fun condMapEmpty!59052 () Bool)

(declare-fun mapDefault!59052 () ValueCell!18200)

(assert (=> b!1558857 (= condMapEmpty!59052 (= (arr!49982 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18200)) mapDefault!59052)))))

(declare-fun b!1558858 () Bool)

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1558858 (= e!868494 (and (= (size!50534 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50535 _keys!637) (size!50534 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011) (= (size!50535 _keys!637) (bvadd #b00000000000000000000000000000001 mask!947)) (bvsgt #b00000000000000000000000000000000 (size!50535 _keys!637))))))

(assert (= (and start!133284 res!1066138) b!1558858))

(assert (= (and b!1558857 condMapEmpty!59052) mapIsEmpty!59052))

(assert (= (and b!1558857 (not condMapEmpty!59052)) mapNonEmpty!59052))

(get-info :version)

(assert (= (and mapNonEmpty!59052 ((_ is ValueCellFull!18200) mapValue!59052)) b!1558855))

(assert (= (and b!1558857 ((_ is ValueCellFull!18200) mapDefault!59052)) b!1558856))

(assert (= start!133284 b!1558857))

(declare-fun m!1434629 () Bool)

(assert (=> mapNonEmpty!59052 m!1434629))

(declare-fun m!1434631 () Bool)

(assert (=> start!133284 m!1434631))

(declare-fun m!1434633 () Bool)

(assert (=> start!133284 m!1434633))

(declare-fun m!1434635 () Bool)

(assert (=> start!133284 m!1434635))

(check-sat (not start!133284) (not mapNonEmpty!59052) tp_is_empty!38461)
(check-sat)
(get-model)

(declare-fun d!162641 () Bool)

(assert (=> d!162641 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133284 d!162641))

(declare-fun d!162643 () Bool)

(assert (=> d!162643 (= (array_inv!39057 _values!487) (bvsge (size!50534 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133284 d!162643))

(declare-fun d!162645 () Bool)

(assert (=> d!162645 (= (array_inv!39058 _keys!637) (bvsge (size!50535 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133284 d!162645))

(declare-fun b!1558890 () Bool)

(declare-fun e!868531 () Bool)

(assert (=> b!1558890 (= e!868531 tp_is_empty!38461)))

(declare-fun mapIsEmpty!59061 () Bool)

(declare-fun mapRes!59061 () Bool)

(assert (=> mapIsEmpty!59061 mapRes!59061))

(declare-fun condMapEmpty!59061 () Bool)

(declare-fun mapDefault!59061 () ValueCell!18200)

(assert (=> mapNonEmpty!59052 (= condMapEmpty!59061 (= mapRest!59052 ((as const (Array (_ BitVec 32) ValueCell!18200)) mapDefault!59061)))))

(assert (=> mapNonEmpty!59052 (= tp!112708 (and e!868531 mapRes!59061))))

(declare-fun mapNonEmpty!59061 () Bool)

(declare-fun tp!112717 () Bool)

(declare-fun e!868532 () Bool)

(assert (=> mapNonEmpty!59061 (= mapRes!59061 (and tp!112717 e!868532))))

(declare-fun mapKey!59061 () (_ BitVec 32))

(declare-fun mapRest!59061 () (Array (_ BitVec 32) ValueCell!18200))

(declare-fun mapValue!59061 () ValueCell!18200)

(assert (=> mapNonEmpty!59061 (= mapRest!59052 (store mapRest!59061 mapKey!59061 mapValue!59061))))

(declare-fun b!1558889 () Bool)

(assert (=> b!1558889 (= e!868532 tp_is_empty!38461)))

(assert (= (and mapNonEmpty!59052 condMapEmpty!59061) mapIsEmpty!59061))

(assert (= (and mapNonEmpty!59052 (not condMapEmpty!59061)) mapNonEmpty!59061))

(assert (= (and mapNonEmpty!59061 ((_ is ValueCellFull!18200) mapValue!59061)) b!1558889))

(assert (= (and mapNonEmpty!59052 ((_ is ValueCellFull!18200) mapDefault!59061)) b!1558890))

(declare-fun m!1434653 () Bool)

(assert (=> mapNonEmpty!59061 m!1434653))

(check-sat (not mapNonEmpty!59061) tp_is_empty!38461)
(check-sat)
