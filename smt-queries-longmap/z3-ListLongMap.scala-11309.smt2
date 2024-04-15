; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131708 () Bool)

(assert start!131708)

(declare-fun b!1542464 () Bool)

(declare-fun e!858216 () Bool)

(declare-fun e!858212 () Bool)

(declare-fun mapRes!58324 () Bool)

(assert (=> b!1542464 (= e!858216 (and e!858212 mapRes!58324))))

(declare-fun condMapEmpty!58324 () Bool)

(declare-datatypes ((V!58773 0))(
  ( (V!58774 (val!18951 Int)) )
))
(declare-datatypes ((ValueCell!17963 0))(
  ( (ValueCellFull!17963 (v!21748 V!58773)) (EmptyCell!17963) )
))
(declare-datatypes ((array!102658 0))(
  ( (array!102659 (arr!49532 (Array (_ BitVec 32) ValueCell!17963)) (size!50084 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102658)

(declare-fun mapDefault!58324 () ValueCell!17963)

(assert (=> b!1542464 (= condMapEmpty!58324 (= (arr!49532 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17963)) mapDefault!58324)))))

(declare-fun b!1542465 () Bool)

(declare-fun e!858213 () Bool)

(assert (=> b!1542465 (= e!858213 false)))

(declare-fun lt!665587 () Bool)

(declare-datatypes ((array!102660 0))(
  ( (array!102661 (arr!49533 (Array (_ BitVec 32) (_ BitVec 64))) (size!50085 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102660)

(declare-datatypes ((List!35942 0))(
  ( (Nil!35939) (Cons!35938 (h!37384 (_ BitVec 64)) (t!50628 List!35942)) )
))
(declare-fun arrayNoDuplicates!0 (array!102660 (_ BitVec 32) List!35942) Bool)

(assert (=> b!1542465 (= lt!665587 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35939))))

(declare-fun b!1542466 () Bool)

(declare-fun tp_is_empty!37747 () Bool)

(assert (=> b!1542466 (= e!858212 tp_is_empty!37747)))

(declare-fun b!1542467 () Bool)

(declare-fun res!1058533 () Bool)

(assert (=> b!1542467 (=> (not res!1058533) (not e!858213))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1542467 (= res!1058533 (and (= (size!50084 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50085 _keys!618) (size!50084 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1058535 () Bool)

(assert (=> start!131708 (=> (not res!1058535) (not e!858213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131708 (= res!1058535 (validMask!0 mask!926))))

(assert (=> start!131708 e!858213))

(assert (=> start!131708 true))

(declare-fun array_inv!38729 (array!102658) Bool)

(assert (=> start!131708 (and (array_inv!38729 _values!470) e!858216)))

(declare-fun array_inv!38730 (array!102660) Bool)

(assert (=> start!131708 (array_inv!38730 _keys!618)))

(declare-fun mapNonEmpty!58324 () Bool)

(declare-fun tp!110852 () Bool)

(declare-fun e!858214 () Bool)

(assert (=> mapNonEmpty!58324 (= mapRes!58324 (and tp!110852 e!858214))))

(declare-fun mapValue!58324 () ValueCell!17963)

(declare-fun mapKey!58324 () (_ BitVec 32))

(declare-fun mapRest!58324 () (Array (_ BitVec 32) ValueCell!17963))

(assert (=> mapNonEmpty!58324 (= (arr!49532 _values!470) (store mapRest!58324 mapKey!58324 mapValue!58324))))

(declare-fun mapIsEmpty!58324 () Bool)

(assert (=> mapIsEmpty!58324 mapRes!58324))

(declare-fun b!1542468 () Bool)

(declare-fun res!1058534 () Bool)

(assert (=> b!1542468 (=> (not res!1058534) (not e!858213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102660 (_ BitVec 32)) Bool)

(assert (=> b!1542468 (= res!1058534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542469 () Bool)

(assert (=> b!1542469 (= e!858214 tp_is_empty!37747)))

(assert (= (and start!131708 res!1058535) b!1542467))

(assert (= (and b!1542467 res!1058533) b!1542468))

(assert (= (and b!1542468 res!1058534) b!1542465))

(assert (= (and b!1542464 condMapEmpty!58324) mapIsEmpty!58324))

(assert (= (and b!1542464 (not condMapEmpty!58324)) mapNonEmpty!58324))

(get-info :version)

(assert (= (and mapNonEmpty!58324 ((_ is ValueCellFull!17963) mapValue!58324)) b!1542469))

(assert (= (and b!1542464 ((_ is ValueCellFull!17963) mapDefault!58324)) b!1542466))

(assert (= start!131708 b!1542464))

(declare-fun m!1423413 () Bool)

(assert (=> b!1542465 m!1423413))

(declare-fun m!1423415 () Bool)

(assert (=> start!131708 m!1423415))

(declare-fun m!1423417 () Bool)

(assert (=> start!131708 m!1423417))

(declare-fun m!1423419 () Bool)

(assert (=> start!131708 m!1423419))

(declare-fun m!1423421 () Bool)

(assert (=> mapNonEmpty!58324 m!1423421))

(declare-fun m!1423423 () Bool)

(assert (=> b!1542468 m!1423423))

(check-sat (not start!131708) (not b!1542468) (not mapNonEmpty!58324) tp_is_empty!37747 (not b!1542465))
(check-sat)
