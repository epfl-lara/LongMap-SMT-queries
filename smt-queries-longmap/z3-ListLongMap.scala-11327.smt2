; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131868 () Bool)

(assert start!131868)

(declare-fun res!1059159 () Bool)

(declare-fun e!859239 () Bool)

(assert (=> start!131868 (=> (not res!1059159) (not e!859239))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131868 (= res!1059159 (validMask!0 mask!926))))

(assert (=> start!131868 e!859239))

(assert (=> start!131868 true))

(declare-datatypes ((V!58919 0))(
  ( (V!58920 (val!19006 Int)) )
))
(declare-datatypes ((ValueCell!18018 0))(
  ( (ValueCellFull!18018 (v!21807 V!58919)) (EmptyCell!18018) )
))
(declare-datatypes ((array!102932 0))(
  ( (array!102933 (arr!49668 (Array (_ BitVec 32) ValueCell!18018)) (size!50218 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102932)

(declare-fun e!859236 () Bool)

(declare-fun array_inv!38637 (array!102932) Bool)

(assert (=> start!131868 (and (array_inv!38637 _values!470) e!859236)))

(declare-datatypes ((array!102934 0))(
  ( (array!102935 (arr!49669 (Array (_ BitVec 32) (_ BitVec 64))) (size!50219 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102934)

(declare-fun array_inv!38638 (array!102934) Bool)

(assert (=> start!131868 (array_inv!38638 _keys!618)))

(declare-fun b!1543767 () Bool)

(declare-fun res!1059157 () Bool)

(assert (=> b!1543767 (=> (not res!1059157) (not e!859239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102934 (_ BitVec 32)) Bool)

(assert (=> b!1543767 (= res!1059157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58489 () Bool)

(declare-fun mapRes!58489 () Bool)

(declare-fun tp!111016 () Bool)

(declare-fun e!859238 () Bool)

(assert (=> mapNonEmpty!58489 (= mapRes!58489 (and tp!111016 e!859238))))

(declare-fun mapRest!58489 () (Array (_ BitVec 32) ValueCell!18018))

(declare-fun mapValue!58489 () ValueCell!18018)

(declare-fun mapKey!58489 () (_ BitVec 32))

(assert (=> mapNonEmpty!58489 (= (arr!49668 _values!470) (store mapRest!58489 mapKey!58489 mapValue!58489))))

(declare-fun b!1543768 () Bool)

(declare-fun res!1059158 () Bool)

(assert (=> b!1543768 (=> (not res!1059158) (not e!859239))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543768 (= res!1059158 (and (= (size!50218 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50219 _keys!618) (size!50218 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58489 () Bool)

(assert (=> mapIsEmpty!58489 mapRes!58489))

(declare-fun b!1543769 () Bool)

(declare-fun e!859235 () Bool)

(assert (=> b!1543769 (= e!859236 (and e!859235 mapRes!58489))))

(declare-fun condMapEmpty!58489 () Bool)

(declare-fun mapDefault!58489 () ValueCell!18018)

(assert (=> b!1543769 (= condMapEmpty!58489 (= (arr!49668 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18018)) mapDefault!58489)))))

(declare-fun b!1543770 () Bool)

(assert (=> b!1543770 (= e!859239 false)))

(declare-fun lt!666038 () Bool)

(declare-datatypes ((List!35931 0))(
  ( (Nil!35928) (Cons!35927 (h!37372 (_ BitVec 64)) (t!50625 List!35931)) )
))
(declare-fun arrayNoDuplicates!0 (array!102934 (_ BitVec 32) List!35931) Bool)

(assert (=> b!1543770 (= lt!666038 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35928))))

(declare-fun b!1543771 () Bool)

(declare-fun tp_is_empty!37857 () Bool)

(assert (=> b!1543771 (= e!859235 tp_is_empty!37857)))

(declare-fun b!1543772 () Bool)

(assert (=> b!1543772 (= e!859238 tp_is_empty!37857)))

(assert (= (and start!131868 res!1059159) b!1543768))

(assert (= (and b!1543768 res!1059158) b!1543767))

(assert (= (and b!1543767 res!1059157) b!1543770))

(assert (= (and b!1543769 condMapEmpty!58489) mapIsEmpty!58489))

(assert (= (and b!1543769 (not condMapEmpty!58489)) mapNonEmpty!58489))

(get-info :version)

(assert (= (and mapNonEmpty!58489 ((_ is ValueCellFull!18018) mapValue!58489)) b!1543772))

(assert (= (and b!1543769 ((_ is ValueCellFull!18018) mapDefault!58489)) b!1543771))

(assert (= start!131868 b!1543769))

(declare-fun m!1424965 () Bool)

(assert (=> start!131868 m!1424965))

(declare-fun m!1424967 () Bool)

(assert (=> start!131868 m!1424967))

(declare-fun m!1424969 () Bool)

(assert (=> start!131868 m!1424969))

(declare-fun m!1424971 () Bool)

(assert (=> b!1543767 m!1424971))

(declare-fun m!1424973 () Bool)

(assert (=> mapNonEmpty!58489 m!1424973))

(declare-fun m!1424975 () Bool)

(assert (=> b!1543770 m!1424975))

(check-sat (not b!1543770) tp_is_empty!37857 (not b!1543767) (not start!131868) (not mapNonEmpty!58489))
(check-sat)
