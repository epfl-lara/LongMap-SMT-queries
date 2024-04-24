; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132110 () Bool)

(assert start!132110)

(declare-fun b!1544673 () Bool)

(declare-fun res!1059253 () Bool)

(declare-fun e!859469 () Bool)

(assert (=> b!1544673 (=> (not res!1059253) (not e!859469))))

(declare-datatypes ((array!102730 0))(
  ( (array!102731 (arr!49560 (Array (_ BitVec 32) (_ BitVec 64))) (size!50111 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102730)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102730 (_ BitVec 32)) Bool)

(assert (=> b!1544673 (= res!1059253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544674 () Bool)

(declare-fun e!859472 () Bool)

(declare-fun tp_is_empty!37687 () Bool)

(assert (=> b!1544674 (= e!859472 tp_is_empty!37687)))

(declare-fun b!1544675 () Bool)

(assert (=> b!1544675 (= e!859469 false)))

(declare-fun lt!666691 () Bool)

(declare-datatypes ((List!35911 0))(
  ( (Nil!35908) (Cons!35907 (h!37370 (_ BitVec 64)) (t!50597 List!35911)) )
))
(declare-fun arrayNoDuplicates!0 (array!102730 (_ BitVec 32) List!35911) Bool)

(assert (=> b!1544675 (= lt!666691 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35908))))

(declare-fun b!1544676 () Bool)

(declare-fun e!859470 () Bool)

(declare-fun mapRes!58234 () Bool)

(assert (=> b!1544676 (= e!859470 (and e!859472 mapRes!58234))))

(declare-fun condMapEmpty!58234 () Bool)

(declare-datatypes ((V!58693 0))(
  ( (V!58694 (val!18921 Int)) )
))
(declare-datatypes ((ValueCell!17933 0))(
  ( (ValueCellFull!17933 (v!21714 V!58693)) (EmptyCell!17933) )
))
(declare-datatypes ((array!102732 0))(
  ( (array!102733 (arr!49561 (Array (_ BitVec 32) ValueCell!17933)) (size!50112 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102732)

(declare-fun mapDefault!58234 () ValueCell!17933)

(assert (=> b!1544676 (= condMapEmpty!58234 (= (arr!49561 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17933)) mapDefault!58234)))))

(declare-fun mapNonEmpty!58234 () Bool)

(declare-fun tp!110761 () Bool)

(declare-fun e!859471 () Bool)

(assert (=> mapNonEmpty!58234 (= mapRes!58234 (and tp!110761 e!859471))))

(declare-fun mapKey!58234 () (_ BitVec 32))

(declare-fun mapRest!58234 () (Array (_ BitVec 32) ValueCell!17933))

(declare-fun mapValue!58234 () ValueCell!17933)

(assert (=> mapNonEmpty!58234 (= (arr!49561 _values!470) (store mapRest!58234 mapKey!58234 mapValue!58234))))

(declare-fun mapIsEmpty!58234 () Bool)

(assert (=> mapIsEmpty!58234 mapRes!58234))

(declare-fun b!1544677 () Bool)

(declare-fun res!1059254 () Bool)

(assert (=> b!1544677 (=> (not res!1059254) (not e!859469))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544677 (= res!1059254 (and (= (size!50112 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50111 _keys!618) (size!50112 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1059252 () Bool)

(assert (=> start!132110 (=> (not res!1059252) (not e!859469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132110 (= res!1059252 (validMask!0 mask!926))))

(assert (=> start!132110 e!859469))

(assert (=> start!132110 true))

(declare-fun array_inv!38823 (array!102732) Bool)

(assert (=> start!132110 (and (array_inv!38823 _values!470) e!859470)))

(declare-fun array_inv!38824 (array!102730) Bool)

(assert (=> start!132110 (array_inv!38824 _keys!618)))

(declare-fun b!1544678 () Bool)

(assert (=> b!1544678 (= e!859471 tp_is_empty!37687)))

(assert (= (and start!132110 res!1059252) b!1544677))

(assert (= (and b!1544677 res!1059254) b!1544673))

(assert (= (and b!1544673 res!1059253) b!1544675))

(assert (= (and b!1544676 condMapEmpty!58234) mapIsEmpty!58234))

(assert (= (and b!1544676 (not condMapEmpty!58234)) mapNonEmpty!58234))

(get-info :version)

(assert (= (and mapNonEmpty!58234 ((_ is ValueCellFull!17933) mapValue!58234)) b!1544678))

(assert (= (and b!1544676 ((_ is ValueCellFull!17933) mapDefault!58234)) b!1544674))

(assert (= start!132110 b!1544676))

(declare-fun m!1426203 () Bool)

(assert (=> b!1544673 m!1426203))

(declare-fun m!1426205 () Bool)

(assert (=> b!1544675 m!1426205))

(declare-fun m!1426207 () Bool)

(assert (=> mapNonEmpty!58234 m!1426207))

(declare-fun m!1426209 () Bool)

(assert (=> start!132110 m!1426209))

(declare-fun m!1426211 () Bool)

(assert (=> start!132110 m!1426211))

(declare-fun m!1426213 () Bool)

(assert (=> start!132110 m!1426213))

(check-sat (not b!1544673) (not mapNonEmpty!58234) (not start!132110) tp_is_empty!37687 (not b!1544675))
(check-sat)
