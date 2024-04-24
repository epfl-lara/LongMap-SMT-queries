; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132104 () Bool)

(assert start!132104)

(declare-fun b!1544619 () Bool)

(declare-fun res!1059227 () Bool)

(declare-fun e!859426 () Bool)

(assert (=> b!1544619 (=> (not res!1059227) (not e!859426))))

(declare-datatypes ((array!102720 0))(
  ( (array!102721 (arr!49555 (Array (_ BitVec 32) (_ BitVec 64))) (size!50106 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102720)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58685 0))(
  ( (V!58686 (val!18918 Int)) )
))
(declare-datatypes ((ValueCell!17930 0))(
  ( (ValueCellFull!17930 (v!21711 V!58685)) (EmptyCell!17930) )
))
(declare-datatypes ((array!102722 0))(
  ( (array!102723 (arr!49556 (Array (_ BitVec 32) ValueCell!17930)) (size!50107 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102722)

(assert (=> b!1544619 (= res!1059227 (and (= (size!50107 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50106 _keys!618) (size!50107 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544620 () Bool)

(declare-fun res!1059226 () Bool)

(assert (=> b!1544620 (=> (not res!1059226) (not e!859426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102720 (_ BitVec 32)) Bool)

(assert (=> b!1544620 (= res!1059226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544621 () Bool)

(declare-fun e!859428 () Bool)

(declare-fun e!859424 () Bool)

(declare-fun mapRes!58225 () Bool)

(assert (=> b!1544621 (= e!859428 (and e!859424 mapRes!58225))))

(declare-fun condMapEmpty!58225 () Bool)

(declare-fun mapDefault!58225 () ValueCell!17930)

(assert (=> b!1544621 (= condMapEmpty!58225 (= (arr!49556 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17930)) mapDefault!58225)))))

(declare-fun mapIsEmpty!58225 () Bool)

(assert (=> mapIsEmpty!58225 mapRes!58225))

(declare-fun b!1544622 () Bool)

(declare-fun e!859427 () Bool)

(declare-fun tp_is_empty!37681 () Bool)

(assert (=> b!1544622 (= e!859427 tp_is_empty!37681)))

(declare-fun res!1059225 () Bool)

(assert (=> start!132104 (=> (not res!1059225) (not e!859426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132104 (= res!1059225 (validMask!0 mask!926))))

(assert (=> start!132104 e!859426))

(assert (=> start!132104 true))

(declare-fun array_inv!38819 (array!102722) Bool)

(assert (=> start!132104 (and (array_inv!38819 _values!470) e!859428)))

(declare-fun array_inv!38820 (array!102720) Bool)

(assert (=> start!132104 (array_inv!38820 _keys!618)))

(declare-fun b!1544623 () Bool)

(assert (=> b!1544623 (= e!859424 tp_is_empty!37681)))

(declare-fun b!1544624 () Bool)

(assert (=> b!1544624 (= e!859426 false)))

(declare-fun lt!666682 () Bool)

(declare-datatypes ((List!35909 0))(
  ( (Nil!35906) (Cons!35905 (h!37368 (_ BitVec 64)) (t!50595 List!35909)) )
))
(declare-fun arrayNoDuplicates!0 (array!102720 (_ BitVec 32) List!35909) Bool)

(assert (=> b!1544624 (= lt!666682 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35906))))

(declare-fun mapNonEmpty!58225 () Bool)

(declare-fun tp!110752 () Bool)

(assert (=> mapNonEmpty!58225 (= mapRes!58225 (and tp!110752 e!859427))))

(declare-fun mapRest!58225 () (Array (_ BitVec 32) ValueCell!17930))

(declare-fun mapValue!58225 () ValueCell!17930)

(declare-fun mapKey!58225 () (_ BitVec 32))

(assert (=> mapNonEmpty!58225 (= (arr!49556 _values!470) (store mapRest!58225 mapKey!58225 mapValue!58225))))

(assert (= (and start!132104 res!1059225) b!1544619))

(assert (= (and b!1544619 res!1059227) b!1544620))

(assert (= (and b!1544620 res!1059226) b!1544624))

(assert (= (and b!1544621 condMapEmpty!58225) mapIsEmpty!58225))

(assert (= (and b!1544621 (not condMapEmpty!58225)) mapNonEmpty!58225))

(get-info :version)

(assert (= (and mapNonEmpty!58225 ((_ is ValueCellFull!17930) mapValue!58225)) b!1544622))

(assert (= (and b!1544621 ((_ is ValueCellFull!17930) mapDefault!58225)) b!1544623))

(assert (= start!132104 b!1544621))

(declare-fun m!1426167 () Bool)

(assert (=> b!1544620 m!1426167))

(declare-fun m!1426169 () Bool)

(assert (=> start!132104 m!1426169))

(declare-fun m!1426171 () Bool)

(assert (=> start!132104 m!1426171))

(declare-fun m!1426173 () Bool)

(assert (=> start!132104 m!1426173))

(declare-fun m!1426175 () Bool)

(assert (=> b!1544624 m!1426175))

(declare-fun m!1426177 () Bool)

(assert (=> mapNonEmpty!58225 m!1426177))

(check-sat (not mapNonEmpty!58225) (not b!1544624) tp_is_empty!37681 (not start!132104) (not b!1544620))
(check-sat)
