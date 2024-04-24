; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132146 () Bool)

(assert start!132146)

(declare-fun res!1059414 () Bool)

(declare-fun e!859743 () Bool)

(assert (=> start!132146 (=> (not res!1059414) (not e!859743))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132146 (= res!1059414 (validMask!0 mask!926))))

(assert (=> start!132146 e!859743))

(assert (=> start!132146 true))

(declare-datatypes ((V!58741 0))(
  ( (V!58742 (val!18939 Int)) )
))
(declare-datatypes ((ValueCell!17951 0))(
  ( (ValueCellFull!17951 (v!21732 V!58741)) (EmptyCell!17951) )
))
(declare-datatypes ((array!102798 0))(
  ( (array!102799 (arr!49594 (Array (_ BitVec 32) ValueCell!17951)) (size!50145 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102798)

(declare-fun e!859740 () Bool)

(declare-fun array_inv!38845 (array!102798) Bool)

(assert (=> start!132146 (and (array_inv!38845 _values!470) e!859740)))

(declare-datatypes ((array!102800 0))(
  ( (array!102801 (arr!49595 (Array (_ BitVec 32) (_ BitVec 64))) (size!50146 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102800)

(declare-fun array_inv!38846 (array!102800) Bool)

(assert (=> start!132146 (array_inv!38846 _keys!618)))

(declare-fun b!1544997 () Bool)

(declare-fun e!859742 () Bool)

(declare-fun tp_is_empty!37723 () Bool)

(assert (=> b!1544997 (= e!859742 tp_is_empty!37723)))

(declare-fun b!1544998 () Bool)

(declare-fun e!859741 () Bool)

(assert (=> b!1544998 (= e!859741 tp_is_empty!37723)))

(declare-fun b!1544999 () Bool)

(declare-fun res!1059415 () Bool)

(assert (=> b!1544999 (=> (not res!1059415) (not e!859743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102800 (_ BitVec 32)) Bool)

(assert (=> b!1544999 (= res!1059415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545000 () Bool)

(declare-fun mapRes!58288 () Bool)

(assert (=> b!1545000 (= e!859740 (and e!859741 mapRes!58288))))

(declare-fun condMapEmpty!58288 () Bool)

(declare-fun mapDefault!58288 () ValueCell!17951)

(assert (=> b!1545000 (= condMapEmpty!58288 (= (arr!49594 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17951)) mapDefault!58288)))))

(declare-fun b!1545001 () Bool)

(declare-fun res!1059416 () Bool)

(assert (=> b!1545001 (=> (not res!1059416) (not e!859743))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545001 (= res!1059416 (and (= (size!50145 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50146 _keys!618) (size!50145 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58288 () Bool)

(assert (=> mapIsEmpty!58288 mapRes!58288))

(declare-fun mapNonEmpty!58288 () Bool)

(declare-fun tp!110815 () Bool)

(assert (=> mapNonEmpty!58288 (= mapRes!58288 (and tp!110815 e!859742))))

(declare-fun mapRest!58288 () (Array (_ BitVec 32) ValueCell!17951))

(declare-fun mapValue!58288 () ValueCell!17951)

(declare-fun mapKey!58288 () (_ BitVec 32))

(assert (=> mapNonEmpty!58288 (= (arr!49594 _values!470) (store mapRest!58288 mapKey!58288 mapValue!58288))))

(declare-fun b!1545002 () Bool)

(assert (=> b!1545002 (= e!859743 false)))

(declare-fun lt!666745 () Bool)

(declare-datatypes ((List!35923 0))(
  ( (Nil!35920) (Cons!35919 (h!37382 (_ BitVec 64)) (t!50609 List!35923)) )
))
(declare-fun arrayNoDuplicates!0 (array!102800 (_ BitVec 32) List!35923) Bool)

(assert (=> b!1545002 (= lt!666745 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35920))))

(assert (= (and start!132146 res!1059414) b!1545001))

(assert (= (and b!1545001 res!1059416) b!1544999))

(assert (= (and b!1544999 res!1059415) b!1545002))

(assert (= (and b!1545000 condMapEmpty!58288) mapIsEmpty!58288))

(assert (= (and b!1545000 (not condMapEmpty!58288)) mapNonEmpty!58288))

(get-info :version)

(assert (= (and mapNonEmpty!58288 ((_ is ValueCellFull!17951) mapValue!58288)) b!1544997))

(assert (= (and b!1545000 ((_ is ValueCellFull!17951) mapDefault!58288)) b!1544998))

(assert (= start!132146 b!1545000))

(declare-fun m!1426419 () Bool)

(assert (=> start!132146 m!1426419))

(declare-fun m!1426421 () Bool)

(assert (=> start!132146 m!1426421))

(declare-fun m!1426423 () Bool)

(assert (=> start!132146 m!1426423))

(declare-fun m!1426425 () Bool)

(assert (=> b!1544999 m!1426425))

(declare-fun m!1426427 () Bool)

(assert (=> mapNonEmpty!58288 m!1426427))

(declare-fun m!1426429 () Bool)

(assert (=> b!1545002 m!1426429))

(check-sat (not mapNonEmpty!58288) (not start!132146) tp_is_empty!37723 (not b!1545002) (not b!1544999))
(check-sat)
