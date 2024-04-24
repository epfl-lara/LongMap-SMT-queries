; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132224 () Bool)

(assert start!132224)

(declare-fun b!1545699 () Bool)

(declare-fun res!1059766 () Bool)

(declare-fun e!860325 () Bool)

(assert (=> b!1545699 (=> (not res!1059766) (not e!860325))))

(declare-datatypes ((array!102946 0))(
  ( (array!102947 (arr!49668 (Array (_ BitVec 32) (_ BitVec 64))) (size!50219 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102946)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58845 0))(
  ( (V!58846 (val!18978 Int)) )
))
(declare-datatypes ((ValueCell!17990 0))(
  ( (ValueCellFull!17990 (v!21771 V!58845)) (EmptyCell!17990) )
))
(declare-datatypes ((array!102948 0))(
  ( (array!102949 (arr!49669 (Array (_ BitVec 32) ValueCell!17990)) (size!50220 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102948)

(assert (=> b!1545699 (= res!1059766 (and (= (size!50220 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50219 _keys!618) (size!50220 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1059765 () Bool)

(assert (=> start!132224 (=> (not res!1059765) (not e!860325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132224 (= res!1059765 (validMask!0 mask!926))))

(assert (=> start!132224 e!860325))

(assert (=> start!132224 true))

(declare-fun e!860326 () Bool)

(declare-fun array_inv!38899 (array!102948) Bool)

(assert (=> start!132224 (and (array_inv!38899 _values!470) e!860326)))

(declare-fun array_inv!38900 (array!102946) Bool)

(assert (=> start!132224 (array_inv!38900 _keys!618)))

(declare-fun mapNonEmpty!58405 () Bool)

(declare-fun mapRes!58405 () Bool)

(declare-fun tp!110932 () Bool)

(declare-fun e!860327 () Bool)

(assert (=> mapNonEmpty!58405 (= mapRes!58405 (and tp!110932 e!860327))))

(declare-fun mapRest!58405 () (Array (_ BitVec 32) ValueCell!17990))

(declare-fun mapValue!58405 () ValueCell!17990)

(declare-fun mapKey!58405 () (_ BitVec 32))

(assert (=> mapNonEmpty!58405 (= (arr!49669 _values!470) (store mapRest!58405 mapKey!58405 mapValue!58405))))

(declare-fun b!1545700 () Bool)

(declare-fun tp_is_empty!37801 () Bool)

(assert (=> b!1545700 (= e!860327 tp_is_empty!37801)))

(declare-fun mapIsEmpty!58405 () Bool)

(assert (=> mapIsEmpty!58405 mapRes!58405))

(declare-fun b!1545701 () Bool)

(declare-fun e!860328 () Bool)

(assert (=> b!1545701 (= e!860326 (and e!860328 mapRes!58405))))

(declare-fun condMapEmpty!58405 () Bool)

(declare-fun mapDefault!58405 () ValueCell!17990)

(assert (=> b!1545701 (= condMapEmpty!58405 (= (arr!49669 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17990)) mapDefault!58405)))))

(declare-fun b!1545702 () Bool)

(declare-fun res!1059767 () Bool)

(assert (=> b!1545702 (=> (not res!1059767) (not e!860325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102946 (_ BitVec 32)) Bool)

(assert (=> b!1545702 (= res!1059767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545703 () Bool)

(assert (=> b!1545703 (= e!860325 false)))

(declare-fun lt!666862 () Bool)

(declare-datatypes ((List!35946 0))(
  ( (Nil!35943) (Cons!35942 (h!37405 (_ BitVec 64)) (t!50632 List!35946)) )
))
(declare-fun arrayNoDuplicates!0 (array!102946 (_ BitVec 32) List!35946) Bool)

(assert (=> b!1545703 (= lt!666862 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35943))))

(declare-fun b!1545704 () Bool)

(assert (=> b!1545704 (= e!860328 tp_is_empty!37801)))

(assert (= (and start!132224 res!1059765) b!1545699))

(assert (= (and b!1545699 res!1059766) b!1545702))

(assert (= (and b!1545702 res!1059767) b!1545703))

(assert (= (and b!1545701 condMapEmpty!58405) mapIsEmpty!58405))

(assert (= (and b!1545701 (not condMapEmpty!58405)) mapNonEmpty!58405))

(get-info :version)

(assert (= (and mapNonEmpty!58405 ((_ is ValueCellFull!17990) mapValue!58405)) b!1545700))

(assert (= (and b!1545701 ((_ is ValueCellFull!17990) mapDefault!58405)) b!1545704))

(assert (= start!132224 b!1545701))

(declare-fun m!1426887 () Bool)

(assert (=> start!132224 m!1426887))

(declare-fun m!1426889 () Bool)

(assert (=> start!132224 m!1426889))

(declare-fun m!1426891 () Bool)

(assert (=> start!132224 m!1426891))

(declare-fun m!1426893 () Bool)

(assert (=> mapNonEmpty!58405 m!1426893))

(declare-fun m!1426895 () Bool)

(assert (=> b!1545702 m!1426895))

(declare-fun m!1426897 () Bool)

(assert (=> b!1545703 m!1426897))

(check-sat (not b!1545702) (not b!1545703) (not mapNonEmpty!58405) tp_is_empty!37801 (not start!132224))
(check-sat)
