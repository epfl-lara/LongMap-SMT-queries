; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131768 () Bool)

(assert start!131768)

(declare-fun b!1543004 () Bool)

(declare-fun res!1058804 () Bool)

(declare-fun e!858666 () Bool)

(assert (=> b!1543004 (=> (not res!1058804) (not e!858666))))

(declare-datatypes ((array!102766 0))(
  ( (array!102767 (arr!49586 (Array (_ BitVec 32) (_ BitVec 64))) (size!50138 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102766)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102766 (_ BitVec 32)) Bool)

(assert (=> b!1543004 (= res!1058804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58414 () Bool)

(declare-fun mapRes!58414 () Bool)

(declare-fun tp!110942 () Bool)

(declare-fun e!858664 () Bool)

(assert (=> mapNonEmpty!58414 (= mapRes!58414 (and tp!110942 e!858664))))

(declare-datatypes ((V!58853 0))(
  ( (V!58854 (val!18981 Int)) )
))
(declare-datatypes ((ValueCell!17993 0))(
  ( (ValueCellFull!17993 (v!21778 V!58853)) (EmptyCell!17993) )
))
(declare-fun mapValue!58414 () ValueCell!17993)

(declare-fun mapKey!58414 () (_ BitVec 32))

(declare-fun mapRest!58414 () (Array (_ BitVec 32) ValueCell!17993))

(declare-datatypes ((array!102768 0))(
  ( (array!102769 (arr!49587 (Array (_ BitVec 32) ValueCell!17993)) (size!50139 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102768)

(assert (=> mapNonEmpty!58414 (= (arr!49587 _values!470) (store mapRest!58414 mapKey!58414 mapValue!58414))))

(declare-fun mapIsEmpty!58414 () Bool)

(assert (=> mapIsEmpty!58414 mapRes!58414))

(declare-fun b!1543005 () Bool)

(declare-fun res!1058805 () Bool)

(assert (=> b!1543005 (=> (not res!1058805) (not e!858666))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543005 (= res!1058805 (and (= (size!50139 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50138 _keys!618) (size!50139 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1058803 () Bool)

(assert (=> start!131768 (=> (not res!1058803) (not e!858666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131768 (= res!1058803 (validMask!0 mask!926))))

(assert (=> start!131768 e!858666))

(assert (=> start!131768 true))

(declare-fun e!858665 () Bool)

(declare-fun array_inv!38773 (array!102768) Bool)

(assert (=> start!131768 (and (array_inv!38773 _values!470) e!858665)))

(declare-fun array_inv!38774 (array!102766) Bool)

(assert (=> start!131768 (array_inv!38774 _keys!618)))

(declare-fun b!1543006 () Bool)

(declare-fun tp_is_empty!37807 () Bool)

(assert (=> b!1543006 (= e!858664 tp_is_empty!37807)))

(declare-fun b!1543007 () Bool)

(declare-fun e!858663 () Bool)

(assert (=> b!1543007 (= e!858665 (and e!858663 mapRes!58414))))

(declare-fun condMapEmpty!58414 () Bool)

(declare-fun mapDefault!58414 () ValueCell!17993)

(assert (=> b!1543007 (= condMapEmpty!58414 (= (arr!49587 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17993)) mapDefault!58414)))))

(declare-fun b!1543008 () Bool)

(assert (=> b!1543008 (= e!858663 tp_is_empty!37807)))

(declare-fun b!1543009 () Bool)

(assert (=> b!1543009 (= e!858666 false)))

(declare-fun lt!665677 () Bool)

(declare-datatypes ((List!35959 0))(
  ( (Nil!35956) (Cons!35955 (h!37401 (_ BitVec 64)) (t!50645 List!35959)) )
))
(declare-fun arrayNoDuplicates!0 (array!102766 (_ BitVec 32) List!35959) Bool)

(assert (=> b!1543009 (= lt!665677 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35956))))

(assert (= (and start!131768 res!1058803) b!1543005))

(assert (= (and b!1543005 res!1058805) b!1543004))

(assert (= (and b!1543004 res!1058804) b!1543009))

(assert (= (and b!1543007 condMapEmpty!58414) mapIsEmpty!58414))

(assert (= (and b!1543007 (not condMapEmpty!58414)) mapNonEmpty!58414))

(get-info :version)

(assert (= (and mapNonEmpty!58414 ((_ is ValueCellFull!17993) mapValue!58414)) b!1543006))

(assert (= (and b!1543007 ((_ is ValueCellFull!17993) mapDefault!58414)) b!1543008))

(assert (= start!131768 b!1543007))

(declare-fun m!1423773 () Bool)

(assert (=> b!1543004 m!1423773))

(declare-fun m!1423775 () Bool)

(assert (=> mapNonEmpty!58414 m!1423775))

(declare-fun m!1423777 () Bool)

(assert (=> start!131768 m!1423777))

(declare-fun m!1423779 () Bool)

(assert (=> start!131768 m!1423779))

(declare-fun m!1423781 () Bool)

(assert (=> start!131768 m!1423781))

(declare-fun m!1423783 () Bool)

(assert (=> b!1543009 m!1423783))

(check-sat (not b!1543004) tp_is_empty!37807 (not mapNonEmpty!58414) (not b!1543009) (not start!131768))
(check-sat)
