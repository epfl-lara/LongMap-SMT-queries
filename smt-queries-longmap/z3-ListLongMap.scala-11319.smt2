; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132230 () Bool)

(assert start!132230)

(declare-fun b!1545753 () Bool)

(declare-fun res!1059792 () Bool)

(declare-fun e!860373 () Bool)

(assert (=> b!1545753 (=> (not res!1059792) (not e!860373))))

(declare-datatypes ((array!102958 0))(
  ( (array!102959 (arr!49674 (Array (_ BitVec 32) (_ BitVec 64))) (size!50225 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102958)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102958 (_ BitVec 32)) Bool)

(assert (=> b!1545753 (= res!1059792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545754 () Bool)

(declare-fun e!860371 () Bool)

(declare-fun tp_is_empty!37807 () Bool)

(assert (=> b!1545754 (= e!860371 tp_is_empty!37807)))

(declare-fun mapIsEmpty!58414 () Bool)

(declare-fun mapRes!58414 () Bool)

(assert (=> mapIsEmpty!58414 mapRes!58414))

(declare-fun b!1545756 () Bool)

(assert (=> b!1545756 (= e!860373 false)))

(declare-fun lt!666871 () Bool)

(declare-datatypes ((List!35949 0))(
  ( (Nil!35946) (Cons!35945 (h!37408 (_ BitVec 64)) (t!50635 List!35949)) )
))
(declare-fun arrayNoDuplicates!0 (array!102958 (_ BitVec 32) List!35949) Bool)

(assert (=> b!1545756 (= lt!666871 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35946))))

(declare-fun b!1545757 () Bool)

(declare-fun e!860372 () Bool)

(assert (=> b!1545757 (= e!860372 tp_is_empty!37807)))

(declare-fun b!1545758 () Bool)

(declare-fun res!1059794 () Bool)

(assert (=> b!1545758 (=> (not res!1059794) (not e!860373))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((V!58853 0))(
  ( (V!58854 (val!18981 Int)) )
))
(declare-datatypes ((ValueCell!17993 0))(
  ( (ValueCellFull!17993 (v!21774 V!58853)) (EmptyCell!17993) )
))
(declare-datatypes ((array!102960 0))(
  ( (array!102961 (arr!49675 (Array (_ BitVec 32) ValueCell!17993)) (size!50226 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102960)

(assert (=> b!1545758 (= res!1059794 (and (= (size!50226 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50225 _keys!618) (size!50226 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58414 () Bool)

(declare-fun tp!110941 () Bool)

(assert (=> mapNonEmpty!58414 (= mapRes!58414 (and tp!110941 e!860371))))

(declare-fun mapKey!58414 () (_ BitVec 32))

(declare-fun mapValue!58414 () ValueCell!17993)

(declare-fun mapRest!58414 () (Array (_ BitVec 32) ValueCell!17993))

(assert (=> mapNonEmpty!58414 (= (arr!49675 _values!470) (store mapRest!58414 mapKey!58414 mapValue!58414))))

(declare-fun b!1545755 () Bool)

(declare-fun e!860369 () Bool)

(assert (=> b!1545755 (= e!860369 (and e!860372 mapRes!58414))))

(declare-fun condMapEmpty!58414 () Bool)

(declare-fun mapDefault!58414 () ValueCell!17993)

(assert (=> b!1545755 (= condMapEmpty!58414 (= (arr!49675 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17993)) mapDefault!58414)))))

(declare-fun res!1059793 () Bool)

(assert (=> start!132230 (=> (not res!1059793) (not e!860373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132230 (= res!1059793 (validMask!0 mask!926))))

(assert (=> start!132230 e!860373))

(assert (=> start!132230 true))

(declare-fun array_inv!38905 (array!102960) Bool)

(assert (=> start!132230 (and (array_inv!38905 _values!470) e!860369)))

(declare-fun array_inv!38906 (array!102958) Bool)

(assert (=> start!132230 (array_inv!38906 _keys!618)))

(assert (= (and start!132230 res!1059793) b!1545758))

(assert (= (and b!1545758 res!1059794) b!1545753))

(assert (= (and b!1545753 res!1059792) b!1545756))

(assert (= (and b!1545755 condMapEmpty!58414) mapIsEmpty!58414))

(assert (= (and b!1545755 (not condMapEmpty!58414)) mapNonEmpty!58414))

(get-info :version)

(assert (= (and mapNonEmpty!58414 ((_ is ValueCellFull!17993) mapValue!58414)) b!1545754))

(assert (= (and b!1545755 ((_ is ValueCellFull!17993) mapDefault!58414)) b!1545757))

(assert (= start!132230 b!1545755))

(declare-fun m!1426923 () Bool)

(assert (=> b!1545753 m!1426923))

(declare-fun m!1426925 () Bool)

(assert (=> b!1545756 m!1426925))

(declare-fun m!1426927 () Bool)

(assert (=> mapNonEmpty!58414 m!1426927))

(declare-fun m!1426929 () Bool)

(assert (=> start!132230 m!1426929))

(declare-fun m!1426931 () Bool)

(assert (=> start!132230 m!1426931))

(declare-fun m!1426933 () Bool)

(assert (=> start!132230 m!1426933))

(check-sat (not start!132230) (not mapNonEmpty!58414) (not b!1545756) (not b!1545753) tp_is_empty!37807)
(check-sat)
