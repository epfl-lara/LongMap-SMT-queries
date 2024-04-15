; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131538 () Bool)

(assert start!131538)

(declare-fun b!1541218 () Bool)

(declare-datatypes ((array!102424 0))(
  ( (array!102425 (arr!49420 (Array (_ BitVec 32) (_ BitVec 64))) (size!49972 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102424)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58605 0))(
  ( (V!58606 (val!18888 Int)) )
))
(declare-datatypes ((ValueCell!17900 0))(
  ( (ValueCellFull!17900 (v!21684 V!58605)) (EmptyCell!17900) )
))
(declare-datatypes ((array!102426 0))(
  ( (array!102427 (arr!49421 (Array (_ BitVec 32) ValueCell!17900)) (size!49973 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102426)

(declare-fun e!857176 () Bool)

(assert (=> b!1541218 (= e!857176 (and (= (size!49973 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!49972 _keys!618) (size!49973 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011) (not (= (size!49972 _keys!618) (bvadd #b00000000000000000000000000000001 mask!926)))))))

(declare-fun b!1541219 () Bool)

(declare-fun e!857173 () Bool)

(declare-fun tp_is_empty!37621 () Bool)

(assert (=> b!1541219 (= e!857173 tp_is_empty!37621)))

(declare-fun b!1541220 () Bool)

(declare-fun e!857175 () Bool)

(declare-fun mapRes!58120 () Bool)

(assert (=> b!1541220 (= e!857175 (and e!857173 mapRes!58120))))

(declare-fun condMapEmpty!58120 () Bool)

(declare-fun mapDefault!58120 () ValueCell!17900)

(assert (=> b!1541220 (= condMapEmpty!58120 (= (arr!49421 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17900)) mapDefault!58120)))))

(declare-fun mapIsEmpty!58120 () Bool)

(assert (=> mapIsEmpty!58120 mapRes!58120))

(declare-fun res!1057918 () Bool)

(assert (=> start!131538 (=> (not res!1057918) (not e!857176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131538 (= res!1057918 (validMask!0 mask!926))))

(assert (=> start!131538 e!857176))

(assert (=> start!131538 true))

(declare-fun array_inv!38653 (array!102426) Bool)

(assert (=> start!131538 (and (array_inv!38653 _values!470) e!857175)))

(declare-fun array_inv!38654 (array!102424) Bool)

(assert (=> start!131538 (array_inv!38654 _keys!618)))

(declare-fun mapNonEmpty!58120 () Bool)

(declare-fun tp!110648 () Bool)

(declare-fun e!857172 () Bool)

(assert (=> mapNonEmpty!58120 (= mapRes!58120 (and tp!110648 e!857172))))

(declare-fun mapValue!58120 () ValueCell!17900)

(declare-fun mapKey!58120 () (_ BitVec 32))

(declare-fun mapRest!58120 () (Array (_ BitVec 32) ValueCell!17900))

(assert (=> mapNonEmpty!58120 (= (arr!49421 _values!470) (store mapRest!58120 mapKey!58120 mapValue!58120))))

(declare-fun b!1541221 () Bool)

(assert (=> b!1541221 (= e!857172 tp_is_empty!37621)))

(assert (= (and start!131538 res!1057918) b!1541218))

(assert (= (and b!1541220 condMapEmpty!58120) mapIsEmpty!58120))

(assert (= (and b!1541220 (not condMapEmpty!58120)) mapNonEmpty!58120))

(get-info :version)

(assert (= (and mapNonEmpty!58120 ((_ is ValueCellFull!17900) mapValue!58120)) b!1541221))

(assert (= (and b!1541220 ((_ is ValueCellFull!17900) mapDefault!58120)) b!1541219))

(assert (= start!131538 b!1541220))

(declare-fun m!1422605 () Bool)

(assert (=> start!131538 m!1422605))

(declare-fun m!1422607 () Bool)

(assert (=> start!131538 m!1422607))

(declare-fun m!1422609 () Bool)

(assert (=> start!131538 m!1422609))

(declare-fun m!1422611 () Bool)

(assert (=> mapNonEmpty!58120 m!1422611))

(check-sat (not start!131538) (not mapNonEmpty!58120) tp_is_empty!37621)
(check-sat)
