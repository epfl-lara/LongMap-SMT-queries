; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132182 () Bool)

(assert start!132182)

(declare-fun b!1545321 () Bool)

(declare-fun e!860010 () Bool)

(assert (=> b!1545321 (= e!860010 false)))

(declare-fun lt!666799 () Bool)

(declare-datatypes ((array!102866 0))(
  ( (array!102867 (arr!49628 (Array (_ BitVec 32) (_ BitVec 64))) (size!50179 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102866)

(declare-datatypes ((List!35933 0))(
  ( (Nil!35930) (Cons!35929 (h!37392 (_ BitVec 64)) (t!50619 List!35933)) )
))
(declare-fun arrayNoDuplicates!0 (array!102866 (_ BitVec 32) List!35933) Bool)

(assert (=> b!1545321 (= lt!666799 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35930))))

(declare-fun mapNonEmpty!58342 () Bool)

(declare-fun mapRes!58342 () Bool)

(declare-fun tp!110869 () Bool)

(declare-fun e!860013 () Bool)

(assert (=> mapNonEmpty!58342 (= mapRes!58342 (and tp!110869 e!860013))))

(declare-datatypes ((V!58789 0))(
  ( (V!58790 (val!18957 Int)) )
))
(declare-datatypes ((ValueCell!17969 0))(
  ( (ValueCellFull!17969 (v!21750 V!58789)) (EmptyCell!17969) )
))
(declare-fun mapRest!58342 () (Array (_ BitVec 32) ValueCell!17969))

(declare-datatypes ((array!102868 0))(
  ( (array!102869 (arr!49629 (Array (_ BitVec 32) ValueCell!17969)) (size!50180 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102868)

(declare-fun mapKey!58342 () (_ BitVec 32))

(declare-fun mapValue!58342 () ValueCell!17969)

(assert (=> mapNonEmpty!58342 (= (arr!49629 _values!470) (store mapRest!58342 mapKey!58342 mapValue!58342))))

(declare-fun b!1545322 () Bool)

(declare-fun res!1059576 () Bool)

(assert (=> b!1545322 (=> (not res!1059576) (not e!860010))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102866 (_ BitVec 32)) Bool)

(assert (=> b!1545322 (= res!1059576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1059578 () Bool)

(assert (=> start!132182 (=> (not res!1059578) (not e!860010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132182 (= res!1059578 (validMask!0 mask!926))))

(assert (=> start!132182 e!860010))

(assert (=> start!132182 true))

(declare-fun e!860011 () Bool)

(declare-fun array_inv!38873 (array!102868) Bool)

(assert (=> start!132182 (and (array_inv!38873 _values!470) e!860011)))

(declare-fun array_inv!38874 (array!102866) Bool)

(assert (=> start!132182 (array_inv!38874 _keys!618)))

(declare-fun b!1545323 () Bool)

(declare-fun tp_is_empty!37759 () Bool)

(assert (=> b!1545323 (= e!860013 tp_is_empty!37759)))

(declare-fun mapIsEmpty!58342 () Bool)

(assert (=> mapIsEmpty!58342 mapRes!58342))

(declare-fun b!1545324 () Bool)

(declare-fun res!1059577 () Bool)

(assert (=> b!1545324 (=> (not res!1059577) (not e!860010))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545324 (= res!1059577 (and (= (size!50180 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50179 _keys!618) (size!50180 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545325 () Bool)

(declare-fun e!860009 () Bool)

(assert (=> b!1545325 (= e!860009 tp_is_empty!37759)))

(declare-fun b!1545326 () Bool)

(assert (=> b!1545326 (= e!860011 (and e!860009 mapRes!58342))))

(declare-fun condMapEmpty!58342 () Bool)

(declare-fun mapDefault!58342 () ValueCell!17969)

(assert (=> b!1545326 (= condMapEmpty!58342 (= (arr!49629 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17969)) mapDefault!58342)))))

(assert (= (and start!132182 res!1059578) b!1545324))

(assert (= (and b!1545324 res!1059577) b!1545322))

(assert (= (and b!1545322 res!1059576) b!1545321))

(assert (= (and b!1545326 condMapEmpty!58342) mapIsEmpty!58342))

(assert (= (and b!1545326 (not condMapEmpty!58342)) mapNonEmpty!58342))

(get-info :version)

(assert (= (and mapNonEmpty!58342 ((_ is ValueCellFull!17969) mapValue!58342)) b!1545323))

(assert (= (and b!1545326 ((_ is ValueCellFull!17969) mapDefault!58342)) b!1545325))

(assert (= start!132182 b!1545326))

(declare-fun m!1426635 () Bool)

(assert (=> b!1545321 m!1426635))

(declare-fun m!1426637 () Bool)

(assert (=> mapNonEmpty!58342 m!1426637))

(declare-fun m!1426639 () Bool)

(assert (=> b!1545322 m!1426639))

(declare-fun m!1426641 () Bool)

(assert (=> start!132182 m!1426641))

(declare-fun m!1426643 () Bool)

(assert (=> start!132182 m!1426643))

(declare-fun m!1426645 () Bool)

(assert (=> start!132182 m!1426645))

(check-sat (not b!1545322) (not mapNonEmpty!58342) (not start!132182) (not b!1545321) tp_is_empty!37759)
(check-sat)
