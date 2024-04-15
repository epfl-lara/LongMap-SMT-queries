; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131798 () Bool)

(assert start!131798)

(declare-fun b!1543274 () Bool)

(declare-fun res!1058940 () Bool)

(declare-fun e!858887 () Bool)

(assert (=> b!1543274 (=> (not res!1058940) (not e!858887))))

(declare-datatypes ((array!102822 0))(
  ( (array!102823 (arr!49614 (Array (_ BitVec 32) (_ BitVec 64))) (size!50166 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102822)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58893 0))(
  ( (V!58894 (val!18996 Int)) )
))
(declare-datatypes ((ValueCell!18008 0))(
  ( (ValueCellFull!18008 (v!21793 V!58893)) (EmptyCell!18008) )
))
(declare-datatypes ((array!102824 0))(
  ( (array!102825 (arr!49615 (Array (_ BitVec 32) ValueCell!18008)) (size!50167 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102824)

(assert (=> b!1543274 (= res!1058940 (and (= (size!50167 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50166 _keys!618) (size!50167 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1058939 () Bool)

(assert (=> start!131798 (=> (not res!1058939) (not e!858887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131798 (= res!1058939 (validMask!0 mask!926))))

(assert (=> start!131798 e!858887))

(assert (=> start!131798 true))

(declare-fun e!858888 () Bool)

(declare-fun array_inv!38793 (array!102824) Bool)

(assert (=> start!131798 (and (array_inv!38793 _values!470) e!858888)))

(declare-fun array_inv!38794 (array!102822) Bool)

(assert (=> start!131798 (array_inv!38794 _keys!618)))

(declare-fun mapNonEmpty!58459 () Bool)

(declare-fun mapRes!58459 () Bool)

(declare-fun tp!110987 () Bool)

(declare-fun e!858889 () Bool)

(assert (=> mapNonEmpty!58459 (= mapRes!58459 (and tp!110987 e!858889))))

(declare-fun mapRest!58459 () (Array (_ BitVec 32) ValueCell!18008))

(declare-fun mapValue!58459 () ValueCell!18008)

(declare-fun mapKey!58459 () (_ BitVec 32))

(assert (=> mapNonEmpty!58459 (= (arr!49615 _values!470) (store mapRest!58459 mapKey!58459 mapValue!58459))))

(declare-fun b!1543275 () Bool)

(assert (=> b!1543275 (= e!858887 false)))

(declare-fun lt!665722 () Bool)

(declare-datatypes ((List!35970 0))(
  ( (Nil!35967) (Cons!35966 (h!37412 (_ BitVec 64)) (t!50656 List!35970)) )
))
(declare-fun arrayNoDuplicates!0 (array!102822 (_ BitVec 32) List!35970) Bool)

(assert (=> b!1543275 (= lt!665722 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35967))))

(declare-fun b!1543276 () Bool)

(declare-fun e!858890 () Bool)

(declare-fun tp_is_empty!37837 () Bool)

(assert (=> b!1543276 (= e!858890 tp_is_empty!37837)))

(declare-fun mapIsEmpty!58459 () Bool)

(assert (=> mapIsEmpty!58459 mapRes!58459))

(declare-fun b!1543277 () Bool)

(declare-fun res!1058938 () Bool)

(assert (=> b!1543277 (=> (not res!1058938) (not e!858887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102822 (_ BitVec 32)) Bool)

(assert (=> b!1543277 (= res!1058938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543278 () Bool)

(assert (=> b!1543278 (= e!858888 (and e!858890 mapRes!58459))))

(declare-fun condMapEmpty!58459 () Bool)

(declare-fun mapDefault!58459 () ValueCell!18008)

(assert (=> b!1543278 (= condMapEmpty!58459 (= (arr!49615 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18008)) mapDefault!58459)))))

(declare-fun b!1543279 () Bool)

(assert (=> b!1543279 (= e!858889 tp_is_empty!37837)))

(assert (= (and start!131798 res!1058939) b!1543274))

(assert (= (and b!1543274 res!1058940) b!1543277))

(assert (= (and b!1543277 res!1058938) b!1543275))

(assert (= (and b!1543278 condMapEmpty!58459) mapIsEmpty!58459))

(assert (= (and b!1543278 (not condMapEmpty!58459)) mapNonEmpty!58459))

(get-info :version)

(assert (= (and mapNonEmpty!58459 ((_ is ValueCellFull!18008) mapValue!58459)) b!1543279))

(assert (= (and b!1543278 ((_ is ValueCellFull!18008) mapDefault!58459)) b!1543276))

(assert (= start!131798 b!1543278))

(declare-fun m!1423953 () Bool)

(assert (=> start!131798 m!1423953))

(declare-fun m!1423955 () Bool)

(assert (=> start!131798 m!1423955))

(declare-fun m!1423957 () Bool)

(assert (=> start!131798 m!1423957))

(declare-fun m!1423959 () Bool)

(assert (=> mapNonEmpty!58459 m!1423959))

(declare-fun m!1423961 () Bool)

(assert (=> b!1543275 m!1423961))

(declare-fun m!1423963 () Bool)

(assert (=> b!1543277 m!1423963))

(check-sat (not b!1543275) tp_is_empty!37837 (not start!131798) (not mapNonEmpty!58459) (not b!1543277))
(check-sat)
