; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132260 () Bool)

(assert start!132260)

(declare-fun b!1546023 () Bool)

(declare-fun e!860594 () Bool)

(declare-fun e!860595 () Bool)

(declare-fun mapRes!58459 () Bool)

(assert (=> b!1546023 (= e!860594 (and e!860595 mapRes!58459))))

(declare-fun condMapEmpty!58459 () Bool)

(declare-datatypes ((V!58893 0))(
  ( (V!58894 (val!18996 Int)) )
))
(declare-datatypes ((ValueCell!18008 0))(
  ( (ValueCellFull!18008 (v!21789 V!58893)) (EmptyCell!18008) )
))
(declare-datatypes ((array!103014 0))(
  ( (array!103015 (arr!49702 (Array (_ BitVec 32) ValueCell!18008)) (size!50253 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103014)

(declare-fun mapDefault!58459 () ValueCell!18008)

(assert (=> b!1546023 (= condMapEmpty!58459 (= (arr!49702 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18008)) mapDefault!58459)))))

(declare-fun b!1546025 () Bool)

(declare-fun e!860597 () Bool)

(assert (=> b!1546025 (= e!860597 false)))

(declare-fun lt!666916 () Bool)

(declare-datatypes ((array!103016 0))(
  ( (array!103017 (arr!49703 (Array (_ BitVec 32) (_ BitVec 64))) (size!50254 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103016)

(declare-datatypes ((List!35960 0))(
  ( (Nil!35957) (Cons!35956 (h!37419 (_ BitVec 64)) (t!50646 List!35960)) )
))
(declare-fun arrayNoDuplicates!0 (array!103016 (_ BitVec 32) List!35960) Bool)

(assert (=> b!1546025 (= lt!666916 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35957))))

(declare-fun mapIsEmpty!58459 () Bool)

(assert (=> mapIsEmpty!58459 mapRes!58459))

(declare-fun mapNonEmpty!58459 () Bool)

(declare-fun tp!110986 () Bool)

(declare-fun e!860598 () Bool)

(assert (=> mapNonEmpty!58459 (= mapRes!58459 (and tp!110986 e!860598))))

(declare-fun mapValue!58459 () ValueCell!18008)

(declare-fun mapKey!58459 () (_ BitVec 32))

(declare-fun mapRest!58459 () (Array (_ BitVec 32) ValueCell!18008))

(assert (=> mapNonEmpty!58459 (= (arr!49702 _values!470) (store mapRest!58459 mapKey!58459 mapValue!58459))))

(declare-fun b!1546026 () Bool)

(declare-fun tp_is_empty!37837 () Bool)

(assert (=> b!1546026 (= e!860595 tp_is_empty!37837)))

(declare-fun b!1546027 () Bool)

(assert (=> b!1546027 (= e!860598 tp_is_empty!37837)))

(declare-fun b!1546028 () Bool)

(declare-fun res!1059927 () Bool)

(assert (=> b!1546028 (=> (not res!1059927) (not e!860597))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103016 (_ BitVec 32)) Bool)

(assert (=> b!1546028 (= res!1059927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1059928 () Bool)

(assert (=> start!132260 (=> (not res!1059928) (not e!860597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132260 (= res!1059928 (validMask!0 mask!926))))

(assert (=> start!132260 e!860597))

(assert (=> start!132260 true))

(declare-fun array_inv!38925 (array!103014) Bool)

(assert (=> start!132260 (and (array_inv!38925 _values!470) e!860594)))

(declare-fun array_inv!38926 (array!103016) Bool)

(assert (=> start!132260 (array_inv!38926 _keys!618)))

(declare-fun b!1546024 () Bool)

(declare-fun res!1059929 () Bool)

(assert (=> b!1546024 (=> (not res!1059929) (not e!860597))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546024 (= res!1059929 (and (= (size!50253 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50254 _keys!618) (size!50253 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!132260 res!1059928) b!1546024))

(assert (= (and b!1546024 res!1059929) b!1546028))

(assert (= (and b!1546028 res!1059927) b!1546025))

(assert (= (and b!1546023 condMapEmpty!58459) mapIsEmpty!58459))

(assert (= (and b!1546023 (not condMapEmpty!58459)) mapNonEmpty!58459))

(get-info :version)

(assert (= (and mapNonEmpty!58459 ((_ is ValueCellFull!18008) mapValue!58459)) b!1546027))

(assert (= (and b!1546023 ((_ is ValueCellFull!18008) mapDefault!58459)) b!1546026))

(assert (= start!132260 b!1546023))

(declare-fun m!1427103 () Bool)

(assert (=> b!1546025 m!1427103))

(declare-fun m!1427105 () Bool)

(assert (=> mapNonEmpty!58459 m!1427105))

(declare-fun m!1427107 () Bool)

(assert (=> b!1546028 m!1427107))

(declare-fun m!1427109 () Bool)

(assert (=> start!132260 m!1427109))

(declare-fun m!1427111 () Bool)

(assert (=> start!132260 m!1427111))

(declare-fun m!1427113 () Bool)

(assert (=> start!132260 m!1427113))

(check-sat (not start!132260) (not mapNonEmpty!58459) (not b!1546028) tp_is_empty!37837 (not b!1546025))
(check-sat)
