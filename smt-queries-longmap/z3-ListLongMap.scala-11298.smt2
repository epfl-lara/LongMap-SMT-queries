; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131694 () Bool)

(assert start!131694)

(declare-fun b!1542201 () Bool)

(declare-fun e!857931 () Bool)

(declare-fun tp_is_empty!37683 () Bool)

(assert (=> b!1542201 (= e!857931 tp_is_empty!37683)))

(declare-fun b!1542202 () Bool)

(declare-fun res!1058374 () Bool)

(declare-fun e!857930 () Bool)

(assert (=> b!1542202 (=> (not res!1058374) (not e!857930))))

(declare-datatypes ((array!102598 0))(
  ( (array!102599 (arr!49501 (Array (_ BitVec 32) (_ BitVec 64))) (size!50051 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102598)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102598 (_ BitVec 32)) Bool)

(assert (=> b!1542202 (= res!1058374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542203 () Bool)

(declare-fun e!857934 () Bool)

(assert (=> b!1542203 (= e!857934 tp_is_empty!37683)))

(declare-fun res!1058376 () Bool)

(assert (=> start!131694 (=> (not res!1058376) (not e!857930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131694 (= res!1058376 (validMask!0 mask!926))))

(assert (=> start!131694 e!857930))

(assert (=> start!131694 true))

(declare-datatypes ((V!58687 0))(
  ( (V!58688 (val!18919 Int)) )
))
(declare-datatypes ((ValueCell!17931 0))(
  ( (ValueCellFull!17931 (v!21720 V!58687)) (EmptyCell!17931) )
))
(declare-datatypes ((array!102600 0))(
  ( (array!102601 (arr!49502 (Array (_ BitVec 32) ValueCell!17931)) (size!50052 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102600)

(declare-fun e!857932 () Bool)

(declare-fun array_inv!38515 (array!102600) Bool)

(assert (=> start!131694 (and (array_inv!38515 _values!470) e!857932)))

(declare-fun array_inv!38516 (array!102598) Bool)

(assert (=> start!131694 (array_inv!38516 _keys!618)))

(declare-fun b!1542204 () Bool)

(assert (=> b!1542204 (= e!857930 false)))

(declare-fun lt!665777 () Bool)

(declare-datatypes ((List!35866 0))(
  ( (Nil!35863) (Cons!35862 (h!37307 (_ BitVec 64)) (t!50560 List!35866)) )
))
(declare-fun arrayNoDuplicates!0 (array!102598 (_ BitVec 32) List!35866) Bool)

(assert (=> b!1542204 (= lt!665777 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35863))))

(declare-fun mapIsEmpty!58228 () Bool)

(declare-fun mapRes!58228 () Bool)

(assert (=> mapIsEmpty!58228 mapRes!58228))

(declare-fun b!1542205 () Bool)

(declare-fun res!1058375 () Bool)

(assert (=> b!1542205 (=> (not res!1058375) (not e!857930))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542205 (= res!1058375 (and (= (size!50052 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50051 _keys!618) (size!50052 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58228 () Bool)

(declare-fun tp!110755 () Bool)

(assert (=> mapNonEmpty!58228 (= mapRes!58228 (and tp!110755 e!857934))))

(declare-fun mapRest!58228 () (Array (_ BitVec 32) ValueCell!17931))

(declare-fun mapKey!58228 () (_ BitVec 32))

(declare-fun mapValue!58228 () ValueCell!17931)

(assert (=> mapNonEmpty!58228 (= (arr!49502 _values!470) (store mapRest!58228 mapKey!58228 mapValue!58228))))

(declare-fun b!1542206 () Bool)

(assert (=> b!1542206 (= e!857932 (and e!857931 mapRes!58228))))

(declare-fun condMapEmpty!58228 () Bool)

(declare-fun mapDefault!58228 () ValueCell!17931)

(assert (=> b!1542206 (= condMapEmpty!58228 (= (arr!49502 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17931)) mapDefault!58228)))))

(assert (= (and start!131694 res!1058376) b!1542205))

(assert (= (and b!1542205 res!1058375) b!1542202))

(assert (= (and b!1542202 res!1058374) b!1542204))

(assert (= (and b!1542206 condMapEmpty!58228) mapIsEmpty!58228))

(assert (= (and b!1542206 (not condMapEmpty!58228)) mapNonEmpty!58228))

(get-info :version)

(assert (= (and mapNonEmpty!58228 ((_ is ValueCellFull!17931) mapValue!58228)) b!1542203))

(assert (= (and b!1542206 ((_ is ValueCellFull!17931) mapDefault!58228)) b!1542201))

(assert (= start!131694 b!1542206))

(declare-fun m!1423921 () Bool)

(assert (=> b!1542202 m!1423921))

(declare-fun m!1423923 () Bool)

(assert (=> start!131694 m!1423923))

(declare-fun m!1423925 () Bool)

(assert (=> start!131694 m!1423925))

(declare-fun m!1423927 () Bool)

(assert (=> start!131694 m!1423927))

(declare-fun m!1423929 () Bool)

(assert (=> b!1542204 m!1423929))

(declare-fun m!1423931 () Bool)

(assert (=> mapNonEmpty!58228 m!1423931))

(check-sat (not mapNonEmpty!58228) (not b!1542204) (not b!1542202) (not start!131694) tp_is_empty!37683)
(check-sat)
