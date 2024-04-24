; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132242 () Bool)

(assert start!132242)

(declare-fun b!1545861 () Bool)

(declare-fun e!860461 () Bool)

(declare-fun tp_is_empty!37819 () Bool)

(assert (=> b!1545861 (= e!860461 tp_is_empty!37819)))

(declare-fun b!1545862 () Bool)

(declare-fun e!860462 () Bool)

(declare-fun e!860460 () Bool)

(declare-fun mapRes!58432 () Bool)

(assert (=> b!1545862 (= e!860462 (and e!860460 mapRes!58432))))

(declare-fun condMapEmpty!58432 () Bool)

(declare-datatypes ((V!58869 0))(
  ( (V!58870 (val!18987 Int)) )
))
(declare-datatypes ((ValueCell!17999 0))(
  ( (ValueCellFull!17999 (v!21780 V!58869)) (EmptyCell!17999) )
))
(declare-datatypes ((array!102980 0))(
  ( (array!102981 (arr!49685 (Array (_ BitVec 32) ValueCell!17999)) (size!50236 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102980)

(declare-fun mapDefault!58432 () ValueCell!17999)

(assert (=> b!1545862 (= condMapEmpty!58432 (= (arr!49685 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17999)) mapDefault!58432)))))

(declare-fun res!1059846 () Bool)

(declare-fun e!860459 () Bool)

(assert (=> start!132242 (=> (not res!1059846) (not e!860459))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132242 (= res!1059846 (validMask!0 mask!926))))

(assert (=> start!132242 e!860459))

(assert (=> start!132242 true))

(declare-fun array_inv!38915 (array!102980) Bool)

(assert (=> start!132242 (and (array_inv!38915 _values!470) e!860462)))

(declare-datatypes ((array!102982 0))(
  ( (array!102983 (arr!49686 (Array (_ BitVec 32) (_ BitVec 64))) (size!50237 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102982)

(declare-fun array_inv!38916 (array!102982) Bool)

(assert (=> start!132242 (array_inv!38916 _keys!618)))

(declare-fun b!1545863 () Bool)

(declare-fun res!1059847 () Bool)

(assert (=> b!1545863 (=> (not res!1059847) (not e!860459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102982 (_ BitVec 32)) Bool)

(assert (=> b!1545863 (= res!1059847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58432 () Bool)

(assert (=> mapIsEmpty!58432 mapRes!58432))

(declare-fun b!1545864 () Bool)

(assert (=> b!1545864 (= e!860460 tp_is_empty!37819)))

(declare-fun b!1545865 () Bool)

(declare-fun res!1059848 () Bool)

(assert (=> b!1545865 (=> (not res!1059848) (not e!860459))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545865 (= res!1059848 (and (= (size!50236 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50237 _keys!618) (size!50236 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58432 () Bool)

(declare-fun tp!110959 () Bool)

(assert (=> mapNonEmpty!58432 (= mapRes!58432 (and tp!110959 e!860461))))

(declare-fun mapValue!58432 () ValueCell!17999)

(declare-fun mapKey!58432 () (_ BitVec 32))

(declare-fun mapRest!58432 () (Array (_ BitVec 32) ValueCell!17999))

(assert (=> mapNonEmpty!58432 (= (arr!49685 _values!470) (store mapRest!58432 mapKey!58432 mapValue!58432))))

(declare-fun b!1545866 () Bool)

(assert (=> b!1545866 (= e!860459 false)))

(declare-fun lt!666889 () Bool)

(declare-datatypes ((List!35953 0))(
  ( (Nil!35950) (Cons!35949 (h!37412 (_ BitVec 64)) (t!50639 List!35953)) )
))
(declare-fun arrayNoDuplicates!0 (array!102982 (_ BitVec 32) List!35953) Bool)

(assert (=> b!1545866 (= lt!666889 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35950))))

(assert (= (and start!132242 res!1059846) b!1545865))

(assert (= (and b!1545865 res!1059848) b!1545863))

(assert (= (and b!1545863 res!1059847) b!1545866))

(assert (= (and b!1545862 condMapEmpty!58432) mapIsEmpty!58432))

(assert (= (and b!1545862 (not condMapEmpty!58432)) mapNonEmpty!58432))

(get-info :version)

(assert (= (and mapNonEmpty!58432 ((_ is ValueCellFull!17999) mapValue!58432)) b!1545861))

(assert (= (and b!1545862 ((_ is ValueCellFull!17999) mapDefault!58432)) b!1545864))

(assert (= start!132242 b!1545862))

(declare-fun m!1426995 () Bool)

(assert (=> start!132242 m!1426995))

(declare-fun m!1426997 () Bool)

(assert (=> start!132242 m!1426997))

(declare-fun m!1426999 () Bool)

(assert (=> start!132242 m!1426999))

(declare-fun m!1427001 () Bool)

(assert (=> b!1545863 m!1427001))

(declare-fun m!1427003 () Bool)

(assert (=> mapNonEmpty!58432 m!1427003))

(declare-fun m!1427005 () Bool)

(assert (=> b!1545866 m!1427005))

(check-sat (not start!132242) (not mapNonEmpty!58432) tp_is_empty!37819 (not b!1545866) (not b!1545863))
(check-sat)
