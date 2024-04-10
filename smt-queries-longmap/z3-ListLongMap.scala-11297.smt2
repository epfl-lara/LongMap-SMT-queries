; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131688 () Bool)

(assert start!131688)

(declare-fun res!1058347 () Bool)

(declare-fun e!857887 () Bool)

(assert (=> start!131688 (=> (not res!1058347) (not e!857887))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131688 (= res!1058347 (validMask!0 mask!926))))

(assert (=> start!131688 e!857887))

(assert (=> start!131688 true))

(declare-datatypes ((V!58679 0))(
  ( (V!58680 (val!18916 Int)) )
))
(declare-datatypes ((ValueCell!17928 0))(
  ( (ValueCellFull!17928 (v!21717 V!58679)) (EmptyCell!17928) )
))
(declare-datatypes ((array!102586 0))(
  ( (array!102587 (arr!49495 (Array (_ BitVec 32) ValueCell!17928)) (size!50045 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102586)

(declare-fun e!857888 () Bool)

(declare-fun array_inv!38509 (array!102586) Bool)

(assert (=> start!131688 (and (array_inv!38509 _values!470) e!857888)))

(declare-datatypes ((array!102588 0))(
  ( (array!102589 (arr!49496 (Array (_ BitVec 32) (_ BitVec 64))) (size!50046 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102588)

(declare-fun array_inv!38510 (array!102588) Bool)

(assert (=> start!131688 (array_inv!38510 _keys!618)))

(declare-fun b!1542147 () Bool)

(declare-fun res!1058348 () Bool)

(assert (=> b!1542147 (=> (not res!1058348) (not e!857887))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542147 (= res!1058348 (and (= (size!50045 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50046 _keys!618) (size!50045 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542148 () Bool)

(declare-fun e!857885 () Bool)

(declare-fun tp_is_empty!37677 () Bool)

(assert (=> b!1542148 (= e!857885 tp_is_empty!37677)))

(declare-fun mapIsEmpty!58219 () Bool)

(declare-fun mapRes!58219 () Bool)

(assert (=> mapIsEmpty!58219 mapRes!58219))

(declare-fun mapNonEmpty!58219 () Bool)

(declare-fun tp!110746 () Bool)

(declare-fun e!857889 () Bool)

(assert (=> mapNonEmpty!58219 (= mapRes!58219 (and tp!110746 e!857889))))

(declare-fun mapValue!58219 () ValueCell!17928)

(declare-fun mapRest!58219 () (Array (_ BitVec 32) ValueCell!17928))

(declare-fun mapKey!58219 () (_ BitVec 32))

(assert (=> mapNonEmpty!58219 (= (arr!49495 _values!470) (store mapRest!58219 mapKey!58219 mapValue!58219))))

(declare-fun b!1542149 () Bool)

(assert (=> b!1542149 (= e!857887 false)))

(declare-fun lt!665768 () Bool)

(declare-datatypes ((List!35863 0))(
  ( (Nil!35860) (Cons!35859 (h!37304 (_ BitVec 64)) (t!50557 List!35863)) )
))
(declare-fun arrayNoDuplicates!0 (array!102588 (_ BitVec 32) List!35863) Bool)

(assert (=> b!1542149 (= lt!665768 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35860))))

(declare-fun b!1542150 () Bool)

(assert (=> b!1542150 (= e!857889 tp_is_empty!37677)))

(declare-fun b!1542151 () Bool)

(assert (=> b!1542151 (= e!857888 (and e!857885 mapRes!58219))))

(declare-fun condMapEmpty!58219 () Bool)

(declare-fun mapDefault!58219 () ValueCell!17928)

(assert (=> b!1542151 (= condMapEmpty!58219 (= (arr!49495 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17928)) mapDefault!58219)))))

(declare-fun b!1542152 () Bool)

(declare-fun res!1058349 () Bool)

(assert (=> b!1542152 (=> (not res!1058349) (not e!857887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102588 (_ BitVec 32)) Bool)

(assert (=> b!1542152 (= res!1058349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!131688 res!1058347) b!1542147))

(assert (= (and b!1542147 res!1058348) b!1542152))

(assert (= (and b!1542152 res!1058349) b!1542149))

(assert (= (and b!1542151 condMapEmpty!58219) mapIsEmpty!58219))

(assert (= (and b!1542151 (not condMapEmpty!58219)) mapNonEmpty!58219))

(get-info :version)

(assert (= (and mapNonEmpty!58219 ((_ is ValueCellFull!17928) mapValue!58219)) b!1542150))

(assert (= (and b!1542151 ((_ is ValueCellFull!17928) mapDefault!58219)) b!1542148))

(assert (= start!131688 b!1542151))

(declare-fun m!1423885 () Bool)

(assert (=> start!131688 m!1423885))

(declare-fun m!1423887 () Bool)

(assert (=> start!131688 m!1423887))

(declare-fun m!1423889 () Bool)

(assert (=> start!131688 m!1423889))

(declare-fun m!1423891 () Bool)

(assert (=> mapNonEmpty!58219 m!1423891))

(declare-fun m!1423893 () Bool)

(assert (=> b!1542149 m!1423893))

(declare-fun m!1423895 () Bool)

(assert (=> b!1542152 m!1423895))

(check-sat (not start!131688) (not mapNonEmpty!58219) (not b!1542152) (not b!1542149) tp_is_empty!37677)
(check-sat)
