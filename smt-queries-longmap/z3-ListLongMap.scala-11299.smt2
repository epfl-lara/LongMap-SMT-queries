; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131700 () Bool)

(assert start!131700)

(declare-fun b!1542255 () Bool)

(declare-fun res!1058401 () Bool)

(declare-fun e!857977 () Bool)

(assert (=> b!1542255 (=> (not res!1058401) (not e!857977))))

(declare-datatypes ((array!102608 0))(
  ( (array!102609 (arr!49506 (Array (_ BitVec 32) (_ BitVec 64))) (size!50056 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102608)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102608 (_ BitVec 32)) Bool)

(assert (=> b!1542255 (= res!1058401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542256 () Bool)

(declare-fun e!857978 () Bool)

(declare-fun tp_is_empty!37689 () Bool)

(assert (=> b!1542256 (= e!857978 tp_is_empty!37689)))

(declare-fun mapIsEmpty!58237 () Bool)

(declare-fun mapRes!58237 () Bool)

(assert (=> mapIsEmpty!58237 mapRes!58237))

(declare-fun b!1542257 () Bool)

(assert (=> b!1542257 (= e!857977 false)))

(declare-fun lt!665786 () Bool)

(declare-datatypes ((List!35868 0))(
  ( (Nil!35865) (Cons!35864 (h!37309 (_ BitVec 64)) (t!50562 List!35868)) )
))
(declare-fun arrayNoDuplicates!0 (array!102608 (_ BitVec 32) List!35868) Bool)

(assert (=> b!1542257 (= lt!665786 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35865))))

(declare-fun b!1542258 () Bool)

(declare-fun e!857975 () Bool)

(assert (=> b!1542258 (= e!857975 tp_is_empty!37689)))

(declare-fun res!1058403 () Bool)

(assert (=> start!131700 (=> (not res!1058403) (not e!857977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131700 (= res!1058403 (validMask!0 mask!926))))

(assert (=> start!131700 e!857977))

(assert (=> start!131700 true))

(declare-datatypes ((V!58695 0))(
  ( (V!58696 (val!18922 Int)) )
))
(declare-datatypes ((ValueCell!17934 0))(
  ( (ValueCellFull!17934 (v!21723 V!58695)) (EmptyCell!17934) )
))
(declare-datatypes ((array!102610 0))(
  ( (array!102611 (arr!49507 (Array (_ BitVec 32) ValueCell!17934)) (size!50057 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102610)

(declare-fun e!857976 () Bool)

(declare-fun array_inv!38517 (array!102610) Bool)

(assert (=> start!131700 (and (array_inv!38517 _values!470) e!857976)))

(declare-fun array_inv!38518 (array!102608) Bool)

(assert (=> start!131700 (array_inv!38518 _keys!618)))

(declare-fun b!1542259 () Bool)

(assert (=> b!1542259 (= e!857976 (and e!857975 mapRes!58237))))

(declare-fun condMapEmpty!58237 () Bool)

(declare-fun mapDefault!58237 () ValueCell!17934)

(assert (=> b!1542259 (= condMapEmpty!58237 (= (arr!49507 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17934)) mapDefault!58237)))))

(declare-fun b!1542260 () Bool)

(declare-fun res!1058402 () Bool)

(assert (=> b!1542260 (=> (not res!1058402) (not e!857977))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542260 (= res!1058402 (and (= (size!50057 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50056 _keys!618) (size!50057 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58237 () Bool)

(declare-fun tp!110764 () Bool)

(assert (=> mapNonEmpty!58237 (= mapRes!58237 (and tp!110764 e!857978))))

(declare-fun mapKey!58237 () (_ BitVec 32))

(declare-fun mapValue!58237 () ValueCell!17934)

(declare-fun mapRest!58237 () (Array (_ BitVec 32) ValueCell!17934))

(assert (=> mapNonEmpty!58237 (= (arr!49507 _values!470) (store mapRest!58237 mapKey!58237 mapValue!58237))))

(assert (= (and start!131700 res!1058403) b!1542260))

(assert (= (and b!1542260 res!1058402) b!1542255))

(assert (= (and b!1542255 res!1058401) b!1542257))

(assert (= (and b!1542259 condMapEmpty!58237) mapIsEmpty!58237))

(assert (= (and b!1542259 (not condMapEmpty!58237)) mapNonEmpty!58237))

(get-info :version)

(assert (= (and mapNonEmpty!58237 ((_ is ValueCellFull!17934) mapValue!58237)) b!1542256))

(assert (= (and b!1542259 ((_ is ValueCellFull!17934) mapDefault!58237)) b!1542258))

(assert (= start!131700 b!1542259))

(declare-fun m!1423957 () Bool)

(assert (=> b!1542255 m!1423957))

(declare-fun m!1423959 () Bool)

(assert (=> b!1542257 m!1423959))

(declare-fun m!1423961 () Bool)

(assert (=> start!131700 m!1423961))

(declare-fun m!1423963 () Bool)

(assert (=> start!131700 m!1423963))

(declare-fun m!1423965 () Bool)

(assert (=> start!131700 m!1423965))

(declare-fun m!1423967 () Bool)

(assert (=> mapNonEmpty!58237 m!1423967))

(check-sat tp_is_empty!37689 (not start!131700) (not b!1542255) (not mapNonEmpty!58237) (not b!1542257))
(check-sat)
