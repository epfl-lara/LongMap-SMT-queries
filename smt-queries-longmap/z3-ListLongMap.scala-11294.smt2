; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132080 () Bool)

(assert start!132080)

(declare-fun b!1544403 () Bool)

(declare-fun res!1059117 () Bool)

(declare-fun e!859245 () Bool)

(assert (=> b!1544403 (=> (not res!1059117) (not e!859245))))

(declare-datatypes ((array!102674 0))(
  ( (array!102675 (arr!49532 (Array (_ BitVec 32) (_ BitVec 64))) (size!50083 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102674)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102674 (_ BitVec 32)) Bool)

(assert (=> b!1544403 (= res!1059117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58189 () Bool)

(declare-fun mapRes!58189 () Bool)

(declare-fun tp!110716 () Bool)

(declare-fun e!859248 () Bool)

(assert (=> mapNonEmpty!58189 (= mapRes!58189 (and tp!110716 e!859248))))

(declare-datatypes ((V!58653 0))(
  ( (V!58654 (val!18906 Int)) )
))
(declare-datatypes ((ValueCell!17918 0))(
  ( (ValueCellFull!17918 (v!21699 V!58653)) (EmptyCell!17918) )
))
(declare-fun mapRest!58189 () (Array (_ BitVec 32) ValueCell!17918))

(declare-datatypes ((array!102676 0))(
  ( (array!102677 (arr!49533 (Array (_ BitVec 32) ValueCell!17918)) (size!50084 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102676)

(declare-fun mapKey!58189 () (_ BitVec 32))

(declare-fun mapValue!58189 () ValueCell!17918)

(assert (=> mapNonEmpty!58189 (= (arr!49533 _values!470) (store mapRest!58189 mapKey!58189 mapValue!58189))))

(declare-fun mapIsEmpty!58189 () Bool)

(assert (=> mapIsEmpty!58189 mapRes!58189))

(declare-fun b!1544404 () Bool)

(assert (=> b!1544404 (= e!859245 false)))

(declare-fun lt!666646 () Bool)

(declare-datatypes ((List!35899 0))(
  ( (Nil!35896) (Cons!35895 (h!37358 (_ BitVec 64)) (t!50585 List!35899)) )
))
(declare-fun arrayNoDuplicates!0 (array!102674 (_ BitVec 32) List!35899) Bool)

(assert (=> b!1544404 (= lt!666646 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35896))))

(declare-fun b!1544405 () Bool)

(declare-fun e!859244 () Bool)

(declare-fun e!859247 () Bool)

(assert (=> b!1544405 (= e!859244 (and e!859247 mapRes!58189))))

(declare-fun condMapEmpty!58189 () Bool)

(declare-fun mapDefault!58189 () ValueCell!17918)

(assert (=> b!1544405 (= condMapEmpty!58189 (= (arr!49533 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17918)) mapDefault!58189)))))

(declare-fun b!1544406 () Bool)

(declare-fun tp_is_empty!37657 () Bool)

(assert (=> b!1544406 (= e!859247 tp_is_empty!37657)))

(declare-fun b!1544407 () Bool)

(assert (=> b!1544407 (= e!859248 tp_is_empty!37657)))

(declare-fun res!1059118 () Bool)

(assert (=> start!132080 (=> (not res!1059118) (not e!859245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132080 (= res!1059118 (validMask!0 mask!926))))

(assert (=> start!132080 e!859245))

(assert (=> start!132080 true))

(declare-fun array_inv!38803 (array!102676) Bool)

(assert (=> start!132080 (and (array_inv!38803 _values!470) e!859244)))

(declare-fun array_inv!38804 (array!102674) Bool)

(assert (=> start!132080 (array_inv!38804 _keys!618)))

(declare-fun b!1544408 () Bool)

(declare-fun res!1059119 () Bool)

(assert (=> b!1544408 (=> (not res!1059119) (not e!859245))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544408 (= res!1059119 (and (= (size!50084 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50083 _keys!618) (size!50084 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!132080 res!1059118) b!1544408))

(assert (= (and b!1544408 res!1059119) b!1544403))

(assert (= (and b!1544403 res!1059117) b!1544404))

(assert (= (and b!1544405 condMapEmpty!58189) mapIsEmpty!58189))

(assert (= (and b!1544405 (not condMapEmpty!58189)) mapNonEmpty!58189))

(get-info :version)

(assert (= (and mapNonEmpty!58189 ((_ is ValueCellFull!17918) mapValue!58189)) b!1544407))

(assert (= (and b!1544405 ((_ is ValueCellFull!17918) mapDefault!58189)) b!1544406))

(assert (= start!132080 b!1544405))

(declare-fun m!1426023 () Bool)

(assert (=> b!1544403 m!1426023))

(declare-fun m!1426025 () Bool)

(assert (=> mapNonEmpty!58189 m!1426025))

(declare-fun m!1426027 () Bool)

(assert (=> b!1544404 m!1426027))

(declare-fun m!1426029 () Bool)

(assert (=> start!132080 m!1426029))

(declare-fun m!1426031 () Bool)

(assert (=> start!132080 m!1426031))

(declare-fun m!1426033 () Bool)

(assert (=> start!132080 m!1426033))

(check-sat (not b!1544403) (not b!1544404) (not start!132080) (not mapNonEmpty!58189) tp_is_empty!37657)
(check-sat)
