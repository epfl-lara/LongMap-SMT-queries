; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132188 () Bool)

(assert start!132188)

(declare-fun b!1545375 () Bool)

(declare-fun res!1059604 () Bool)

(declare-fun e!860058 () Bool)

(assert (=> b!1545375 (=> (not res!1059604) (not e!860058))))

(declare-datatypes ((array!102878 0))(
  ( (array!102879 (arr!49634 (Array (_ BitVec 32) (_ BitVec 64))) (size!50185 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102878)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102878 (_ BitVec 32)) Bool)

(assert (=> b!1545375 (= res!1059604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58351 () Bool)

(declare-fun mapRes!58351 () Bool)

(assert (=> mapIsEmpty!58351 mapRes!58351))

(declare-fun b!1545376 () Bool)

(declare-fun e!860057 () Bool)

(declare-fun tp_is_empty!37765 () Bool)

(assert (=> b!1545376 (= e!860057 tp_is_empty!37765)))

(declare-fun mapNonEmpty!58351 () Bool)

(declare-fun tp!110878 () Bool)

(assert (=> mapNonEmpty!58351 (= mapRes!58351 (and tp!110878 e!860057))))

(declare-fun mapKey!58351 () (_ BitVec 32))

(declare-datatypes ((V!58797 0))(
  ( (V!58798 (val!18960 Int)) )
))
(declare-datatypes ((ValueCell!17972 0))(
  ( (ValueCellFull!17972 (v!21753 V!58797)) (EmptyCell!17972) )
))
(declare-fun mapValue!58351 () ValueCell!17972)

(declare-datatypes ((array!102880 0))(
  ( (array!102881 (arr!49635 (Array (_ BitVec 32) ValueCell!17972)) (size!50186 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102880)

(declare-fun mapRest!58351 () (Array (_ BitVec 32) ValueCell!17972))

(assert (=> mapNonEmpty!58351 (= (arr!49635 _values!470) (store mapRest!58351 mapKey!58351 mapValue!58351))))

(declare-fun b!1545377 () Bool)

(declare-fun e!860056 () Bool)

(assert (=> b!1545377 (= e!860056 tp_is_empty!37765)))

(declare-fun b!1545378 () Bool)

(assert (=> b!1545378 (= e!860058 false)))

(declare-fun lt!666808 () Bool)

(declare-datatypes ((List!35935 0))(
  ( (Nil!35932) (Cons!35931 (h!37394 (_ BitVec 64)) (t!50621 List!35935)) )
))
(declare-fun arrayNoDuplicates!0 (array!102878 (_ BitVec 32) List!35935) Bool)

(assert (=> b!1545378 (= lt!666808 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35932))))

(declare-fun b!1545379 () Bool)

(declare-fun res!1059605 () Bool)

(assert (=> b!1545379 (=> (not res!1059605) (not e!860058))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545379 (= res!1059605 (and (= (size!50186 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50185 _keys!618) (size!50186 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545380 () Bool)

(declare-fun e!860054 () Bool)

(assert (=> b!1545380 (= e!860054 (and e!860056 mapRes!58351))))

(declare-fun condMapEmpty!58351 () Bool)

(declare-fun mapDefault!58351 () ValueCell!17972)

(assert (=> b!1545380 (= condMapEmpty!58351 (= (arr!49635 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17972)) mapDefault!58351)))))

(declare-fun res!1059603 () Bool)

(assert (=> start!132188 (=> (not res!1059603) (not e!860058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132188 (= res!1059603 (validMask!0 mask!926))))

(assert (=> start!132188 e!860058))

(assert (=> start!132188 true))

(declare-fun array_inv!38877 (array!102880) Bool)

(assert (=> start!132188 (and (array_inv!38877 _values!470) e!860054)))

(declare-fun array_inv!38878 (array!102878) Bool)

(assert (=> start!132188 (array_inv!38878 _keys!618)))

(assert (= (and start!132188 res!1059603) b!1545379))

(assert (= (and b!1545379 res!1059605) b!1545375))

(assert (= (and b!1545375 res!1059604) b!1545378))

(assert (= (and b!1545380 condMapEmpty!58351) mapIsEmpty!58351))

(assert (= (and b!1545380 (not condMapEmpty!58351)) mapNonEmpty!58351))

(get-info :version)

(assert (= (and mapNonEmpty!58351 ((_ is ValueCellFull!17972) mapValue!58351)) b!1545376))

(assert (= (and b!1545380 ((_ is ValueCellFull!17972) mapDefault!58351)) b!1545377))

(assert (= start!132188 b!1545380))

(declare-fun m!1426671 () Bool)

(assert (=> b!1545375 m!1426671))

(declare-fun m!1426673 () Bool)

(assert (=> mapNonEmpty!58351 m!1426673))

(declare-fun m!1426675 () Bool)

(assert (=> b!1545378 m!1426675))

(declare-fun m!1426677 () Bool)

(assert (=> start!132188 m!1426677))

(declare-fun m!1426679 () Bool)

(assert (=> start!132188 m!1426679))

(declare-fun m!1426681 () Bool)

(assert (=> start!132188 m!1426681))

(check-sat tp_is_empty!37765 (not b!1545378) (not start!132188) (not b!1545375) (not mapNonEmpty!58351))
(check-sat)
