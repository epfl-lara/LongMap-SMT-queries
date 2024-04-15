; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131654 () Bool)

(assert start!131654)

(declare-fun res!1058292 () Bool)

(declare-fun e!857808 () Bool)

(assert (=> start!131654 (=> (not res!1058292) (not e!857808))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131654 (= res!1058292 (validMask!0 mask!926))))

(assert (=> start!131654 e!857808))

(assert (=> start!131654 true))

(declare-datatypes ((V!58701 0))(
  ( (V!58702 (val!18924 Int)) )
))
(declare-datatypes ((ValueCell!17936 0))(
  ( (ValueCellFull!17936 (v!21721 V!58701)) (EmptyCell!17936) )
))
(declare-datatypes ((array!102560 0))(
  ( (array!102561 (arr!49483 (Array (_ BitVec 32) ValueCell!17936)) (size!50035 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102560)

(declare-fun e!857807 () Bool)

(declare-fun array_inv!38697 (array!102560) Bool)

(assert (=> start!131654 (and (array_inv!38697 _values!470) e!857807)))

(declare-datatypes ((array!102562 0))(
  ( (array!102563 (arr!49484 (Array (_ BitVec 32) (_ BitVec 64))) (size!50036 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102562)

(declare-fun array_inv!38698 (array!102562) Bool)

(assert (=> start!131654 (array_inv!38698 _keys!618)))

(declare-fun mapNonEmpty!58243 () Bool)

(declare-fun mapRes!58243 () Bool)

(declare-fun tp!110771 () Bool)

(declare-fun e!857811 () Bool)

(assert (=> mapNonEmpty!58243 (= mapRes!58243 (and tp!110771 e!857811))))

(declare-fun mapValue!58243 () ValueCell!17936)

(declare-fun mapRest!58243 () (Array (_ BitVec 32) ValueCell!17936))

(declare-fun mapKey!58243 () (_ BitVec 32))

(assert (=> mapNonEmpty!58243 (= (arr!49483 _values!470) (store mapRest!58243 mapKey!58243 mapValue!58243))))

(declare-fun b!1541978 () Bool)

(assert (=> b!1541978 (= e!857808 false)))

(declare-fun lt!665506 () Bool)

(declare-datatypes ((List!35923 0))(
  ( (Nil!35920) (Cons!35919 (h!37365 (_ BitVec 64)) (t!50609 List!35923)) )
))
(declare-fun arrayNoDuplicates!0 (array!102562 (_ BitVec 32) List!35923) Bool)

(assert (=> b!1541978 (= lt!665506 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35920))))

(declare-fun mapIsEmpty!58243 () Bool)

(assert (=> mapIsEmpty!58243 mapRes!58243))

(declare-fun b!1541979 () Bool)

(declare-fun tp_is_empty!37693 () Bool)

(assert (=> b!1541979 (= e!857811 tp_is_empty!37693)))

(declare-fun b!1541980 () Bool)

(declare-fun res!1058290 () Bool)

(assert (=> b!1541980 (=> (not res!1058290) (not e!857808))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1541980 (= res!1058290 (and (= (size!50035 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50036 _keys!618) (size!50035 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1541981 () Bool)

(declare-fun e!857809 () Bool)

(assert (=> b!1541981 (= e!857807 (and e!857809 mapRes!58243))))

(declare-fun condMapEmpty!58243 () Bool)

(declare-fun mapDefault!58243 () ValueCell!17936)

(assert (=> b!1541981 (= condMapEmpty!58243 (= (arr!49483 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17936)) mapDefault!58243)))))

(declare-fun b!1541982 () Bool)

(assert (=> b!1541982 (= e!857809 tp_is_empty!37693)))

(declare-fun b!1541983 () Bool)

(declare-fun res!1058291 () Bool)

(assert (=> b!1541983 (=> (not res!1058291) (not e!857808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102562 (_ BitVec 32)) Bool)

(assert (=> b!1541983 (= res!1058291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!131654 res!1058292) b!1541980))

(assert (= (and b!1541980 res!1058290) b!1541983))

(assert (= (and b!1541983 res!1058291) b!1541978))

(assert (= (and b!1541981 condMapEmpty!58243) mapIsEmpty!58243))

(assert (= (and b!1541981 (not condMapEmpty!58243)) mapNonEmpty!58243))

(get-info :version)

(assert (= (and mapNonEmpty!58243 ((_ is ValueCellFull!17936) mapValue!58243)) b!1541979))

(assert (= (and b!1541981 ((_ is ValueCellFull!17936) mapDefault!58243)) b!1541982))

(assert (= start!131654 b!1541981))

(declare-fun m!1423089 () Bool)

(assert (=> start!131654 m!1423089))

(declare-fun m!1423091 () Bool)

(assert (=> start!131654 m!1423091))

(declare-fun m!1423093 () Bool)

(assert (=> start!131654 m!1423093))

(declare-fun m!1423095 () Bool)

(assert (=> mapNonEmpty!58243 m!1423095))

(declare-fun m!1423097 () Bool)

(assert (=> b!1541978 m!1423097))

(declare-fun m!1423099 () Bool)

(assert (=> b!1541983 m!1423099))

(check-sat (not start!131654) (not mapNonEmpty!58243) tp_is_empty!37693 (not b!1541978) (not b!1541983))
(check-sat)
