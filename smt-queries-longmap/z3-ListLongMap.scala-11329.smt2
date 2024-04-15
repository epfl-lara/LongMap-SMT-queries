; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131828 () Bool)

(assert start!131828)

(declare-fun b!1543544 () Bool)

(declare-fun e!859116 () Bool)

(declare-fun tp_is_empty!37867 () Bool)

(assert (=> b!1543544 (= e!859116 tp_is_empty!37867)))

(declare-fun mapNonEmpty!58504 () Bool)

(declare-fun mapRes!58504 () Bool)

(declare-fun tp!111032 () Bool)

(assert (=> mapNonEmpty!58504 (= mapRes!58504 (and tp!111032 e!859116))))

(declare-datatypes ((V!58933 0))(
  ( (V!58934 (val!19011 Int)) )
))
(declare-datatypes ((ValueCell!18023 0))(
  ( (ValueCellFull!18023 (v!21808 V!58933)) (EmptyCell!18023) )
))
(declare-fun mapRest!58504 () (Array (_ BitVec 32) ValueCell!18023))

(declare-fun mapValue!58504 () ValueCell!18023)

(declare-datatypes ((array!102880 0))(
  ( (array!102881 (arr!49643 (Array (_ BitVec 32) ValueCell!18023)) (size!50195 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102880)

(declare-fun mapKey!58504 () (_ BitVec 32))

(assert (=> mapNonEmpty!58504 (= (arr!49643 _values!470) (store mapRest!58504 mapKey!58504 mapValue!58504))))

(declare-fun b!1543545 () Bool)

(declare-fun res!1059073 () Bool)

(declare-fun e!859114 () Bool)

(assert (=> b!1543545 (=> (not res!1059073) (not e!859114))))

(declare-datatypes ((array!102882 0))(
  ( (array!102883 (arr!49644 (Array (_ BitVec 32) (_ BitVec 64))) (size!50196 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102882)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102882 (_ BitVec 32)) Bool)

(assert (=> b!1543545 (= res!1059073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543546 () Bool)

(assert (=> b!1543546 (= e!859114 false)))

(declare-fun lt!665767 () Bool)

(declare-datatypes ((List!35982 0))(
  ( (Nil!35979) (Cons!35978 (h!37424 (_ BitVec 64)) (t!50668 List!35982)) )
))
(declare-fun arrayNoDuplicates!0 (array!102882 (_ BitVec 32) List!35982) Bool)

(assert (=> b!1543546 (= lt!665767 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35979))))

(declare-fun mapIsEmpty!58504 () Bool)

(assert (=> mapIsEmpty!58504 mapRes!58504))

(declare-fun res!1059075 () Bool)

(assert (=> start!131828 (=> (not res!1059075) (not e!859114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131828 (= res!1059075 (validMask!0 mask!926))))

(assert (=> start!131828 e!859114))

(assert (=> start!131828 true))

(declare-fun e!859112 () Bool)

(declare-fun array_inv!38815 (array!102880) Bool)

(assert (=> start!131828 (and (array_inv!38815 _values!470) e!859112)))

(declare-fun array_inv!38816 (array!102882) Bool)

(assert (=> start!131828 (array_inv!38816 _keys!618)))

(declare-fun b!1543547 () Bool)

(declare-fun e!859113 () Bool)

(assert (=> b!1543547 (= e!859112 (and e!859113 mapRes!58504))))

(declare-fun condMapEmpty!58504 () Bool)

(declare-fun mapDefault!58504 () ValueCell!18023)

(assert (=> b!1543547 (= condMapEmpty!58504 (= (arr!49643 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18023)) mapDefault!58504)))))

(declare-fun b!1543548 () Bool)

(declare-fun res!1059074 () Bool)

(assert (=> b!1543548 (=> (not res!1059074) (not e!859114))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543548 (= res!1059074 (and (= (size!50195 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50196 _keys!618) (size!50195 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543549 () Bool)

(assert (=> b!1543549 (= e!859113 tp_is_empty!37867)))

(assert (= (and start!131828 res!1059075) b!1543548))

(assert (= (and b!1543548 res!1059074) b!1543545))

(assert (= (and b!1543545 res!1059073) b!1543546))

(assert (= (and b!1543547 condMapEmpty!58504) mapIsEmpty!58504))

(assert (= (and b!1543547 (not condMapEmpty!58504)) mapNonEmpty!58504))

(get-info :version)

(assert (= (and mapNonEmpty!58504 ((_ is ValueCellFull!18023) mapValue!58504)) b!1543544))

(assert (= (and b!1543547 ((_ is ValueCellFull!18023) mapDefault!58504)) b!1543549))

(assert (= start!131828 b!1543547))

(declare-fun m!1424133 () Bool)

(assert (=> mapNonEmpty!58504 m!1424133))

(declare-fun m!1424135 () Bool)

(assert (=> b!1543545 m!1424135))

(declare-fun m!1424137 () Bool)

(assert (=> b!1543546 m!1424137))

(declare-fun m!1424139 () Bool)

(assert (=> start!131828 m!1424139))

(declare-fun m!1424141 () Bool)

(assert (=> start!131828 m!1424141))

(declare-fun m!1424143 () Bool)

(assert (=> start!131828 m!1424143))

(check-sat (not start!131828) (not b!1543545) (not mapNonEmpty!58504) tp_is_empty!37867 (not b!1543546))
(check-sat)
