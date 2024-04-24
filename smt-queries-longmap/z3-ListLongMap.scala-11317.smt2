; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132218 () Bool)

(assert start!132218)

(declare-fun b!1545645 () Bool)

(declare-fun res!1059739 () Bool)

(declare-fun e!860281 () Bool)

(assert (=> b!1545645 (=> (not res!1059739) (not e!860281))))

(declare-datatypes ((array!102936 0))(
  ( (array!102937 (arr!49663 (Array (_ BitVec 32) (_ BitVec 64))) (size!50214 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102936)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58837 0))(
  ( (V!58838 (val!18975 Int)) )
))
(declare-datatypes ((ValueCell!17987 0))(
  ( (ValueCellFull!17987 (v!21768 V!58837)) (EmptyCell!17987) )
))
(declare-datatypes ((array!102938 0))(
  ( (array!102939 (arr!49664 (Array (_ BitVec 32) ValueCell!17987)) (size!50215 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102938)

(assert (=> b!1545645 (= res!1059739 (and (= (size!50215 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50214 _keys!618) (size!50215 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545646 () Bool)

(declare-fun e!860279 () Bool)

(declare-fun tp_is_empty!37795 () Bool)

(assert (=> b!1545646 (= e!860279 tp_is_empty!37795)))

(declare-fun mapNonEmpty!58396 () Bool)

(declare-fun mapRes!58396 () Bool)

(declare-fun tp!110923 () Bool)

(declare-fun e!860283 () Bool)

(assert (=> mapNonEmpty!58396 (= mapRes!58396 (and tp!110923 e!860283))))

(declare-fun mapValue!58396 () ValueCell!17987)

(declare-fun mapKey!58396 () (_ BitVec 32))

(declare-fun mapRest!58396 () (Array (_ BitVec 32) ValueCell!17987))

(assert (=> mapNonEmpty!58396 (= (arr!49664 _values!470) (store mapRest!58396 mapKey!58396 mapValue!58396))))

(declare-fun mapIsEmpty!58396 () Bool)

(assert (=> mapIsEmpty!58396 mapRes!58396))

(declare-fun b!1545648 () Bool)

(declare-fun e!860282 () Bool)

(assert (=> b!1545648 (= e!860282 (and e!860279 mapRes!58396))))

(declare-fun condMapEmpty!58396 () Bool)

(declare-fun mapDefault!58396 () ValueCell!17987)

(assert (=> b!1545648 (= condMapEmpty!58396 (= (arr!49664 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17987)) mapDefault!58396)))))

(declare-fun b!1545649 () Bool)

(assert (=> b!1545649 (= e!860283 tp_is_empty!37795)))

(declare-fun b!1545650 () Bool)

(declare-fun res!1059738 () Bool)

(assert (=> b!1545650 (=> (not res!1059738) (not e!860281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102936 (_ BitVec 32)) Bool)

(assert (=> b!1545650 (= res!1059738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545647 () Bool)

(assert (=> b!1545647 (= e!860281 false)))

(declare-fun lt!666853 () Bool)

(declare-datatypes ((List!35945 0))(
  ( (Nil!35942) (Cons!35941 (h!37404 (_ BitVec 64)) (t!50631 List!35945)) )
))
(declare-fun arrayNoDuplicates!0 (array!102936 (_ BitVec 32) List!35945) Bool)

(assert (=> b!1545647 (= lt!666853 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35942))))

(declare-fun res!1059740 () Bool)

(assert (=> start!132218 (=> (not res!1059740) (not e!860281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132218 (= res!1059740 (validMask!0 mask!926))))

(assert (=> start!132218 e!860281))

(assert (=> start!132218 true))

(declare-fun array_inv!38895 (array!102938) Bool)

(assert (=> start!132218 (and (array_inv!38895 _values!470) e!860282)))

(declare-fun array_inv!38896 (array!102936) Bool)

(assert (=> start!132218 (array_inv!38896 _keys!618)))

(assert (= (and start!132218 res!1059740) b!1545645))

(assert (= (and b!1545645 res!1059739) b!1545650))

(assert (= (and b!1545650 res!1059738) b!1545647))

(assert (= (and b!1545648 condMapEmpty!58396) mapIsEmpty!58396))

(assert (= (and b!1545648 (not condMapEmpty!58396)) mapNonEmpty!58396))

(get-info :version)

(assert (= (and mapNonEmpty!58396 ((_ is ValueCellFull!17987) mapValue!58396)) b!1545649))

(assert (= (and b!1545648 ((_ is ValueCellFull!17987) mapDefault!58396)) b!1545646))

(assert (= start!132218 b!1545648))

(declare-fun m!1426851 () Bool)

(assert (=> mapNonEmpty!58396 m!1426851))

(declare-fun m!1426853 () Bool)

(assert (=> b!1545650 m!1426853))

(declare-fun m!1426855 () Bool)

(assert (=> b!1545647 m!1426855))

(declare-fun m!1426857 () Bool)

(assert (=> start!132218 m!1426857))

(declare-fun m!1426859 () Bool)

(assert (=> start!132218 m!1426859))

(declare-fun m!1426861 () Bool)

(assert (=> start!132218 m!1426861))

(check-sat tp_is_empty!37795 (not start!132218) (not b!1545650) (not mapNonEmpty!58396) (not b!1545647))
(check-sat)
