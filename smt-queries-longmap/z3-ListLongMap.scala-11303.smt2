; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131724 () Bool)

(assert start!131724)

(declare-fun mapIsEmpty!58273 () Bool)

(declare-fun mapRes!58273 () Bool)

(assert (=> mapIsEmpty!58273 mapRes!58273))

(declare-fun b!1542471 () Bool)

(declare-fun res!1058509 () Bool)

(declare-fun e!858158 () Bool)

(assert (=> b!1542471 (=> (not res!1058509) (not e!858158))))

(declare-datatypes ((array!102656 0))(
  ( (array!102657 (arr!49530 (Array (_ BitVec 32) (_ BitVec 64))) (size!50080 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102656)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58727 0))(
  ( (V!58728 (val!18934 Int)) )
))
(declare-datatypes ((ValueCell!17946 0))(
  ( (ValueCellFull!17946 (v!21735 V!58727)) (EmptyCell!17946) )
))
(declare-datatypes ((array!102658 0))(
  ( (array!102659 (arr!49531 (Array (_ BitVec 32) ValueCell!17946)) (size!50081 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102658)

(assert (=> b!1542471 (= res!1058509 (and (= (size!50081 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50080 _keys!618) (size!50081 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542472 () Bool)

(declare-fun e!858155 () Bool)

(declare-fun tp_is_empty!37713 () Bool)

(assert (=> b!1542472 (= e!858155 tp_is_empty!37713)))

(declare-fun b!1542473 () Bool)

(declare-fun e!858159 () Bool)

(declare-fun e!858156 () Bool)

(assert (=> b!1542473 (= e!858159 (and e!858156 mapRes!58273))))

(declare-fun condMapEmpty!58273 () Bool)

(declare-fun mapDefault!58273 () ValueCell!17946)

(assert (=> b!1542473 (= condMapEmpty!58273 (= (arr!49531 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17946)) mapDefault!58273)))))

(declare-fun res!1058510 () Bool)

(assert (=> start!131724 (=> (not res!1058510) (not e!858158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131724 (= res!1058510 (validMask!0 mask!926))))

(assert (=> start!131724 e!858158))

(assert (=> start!131724 true))

(declare-fun array_inv!38539 (array!102658) Bool)

(assert (=> start!131724 (and (array_inv!38539 _values!470) e!858159)))

(declare-fun array_inv!38540 (array!102656) Bool)

(assert (=> start!131724 (array_inv!38540 _keys!618)))

(declare-fun b!1542474 () Bool)

(assert (=> b!1542474 (= e!858156 tp_is_empty!37713)))

(declare-fun mapNonEmpty!58273 () Bool)

(declare-fun tp!110800 () Bool)

(assert (=> mapNonEmpty!58273 (= mapRes!58273 (and tp!110800 e!858155))))

(declare-fun mapValue!58273 () ValueCell!17946)

(declare-fun mapRest!58273 () (Array (_ BitVec 32) ValueCell!17946))

(declare-fun mapKey!58273 () (_ BitVec 32))

(assert (=> mapNonEmpty!58273 (= (arr!49531 _values!470) (store mapRest!58273 mapKey!58273 mapValue!58273))))

(declare-fun b!1542475 () Bool)

(assert (=> b!1542475 (= e!858158 false)))

(declare-fun lt!665822 () Bool)

(declare-datatypes ((List!35877 0))(
  ( (Nil!35874) (Cons!35873 (h!37318 (_ BitVec 64)) (t!50571 List!35877)) )
))
(declare-fun arrayNoDuplicates!0 (array!102656 (_ BitVec 32) List!35877) Bool)

(assert (=> b!1542475 (= lt!665822 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35874))))

(declare-fun b!1542476 () Bool)

(declare-fun res!1058511 () Bool)

(assert (=> b!1542476 (=> (not res!1058511) (not e!858158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102656 (_ BitVec 32)) Bool)

(assert (=> b!1542476 (= res!1058511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!131724 res!1058510) b!1542471))

(assert (= (and b!1542471 res!1058509) b!1542476))

(assert (= (and b!1542476 res!1058511) b!1542475))

(assert (= (and b!1542473 condMapEmpty!58273) mapIsEmpty!58273))

(assert (= (and b!1542473 (not condMapEmpty!58273)) mapNonEmpty!58273))

(get-info :version)

(assert (= (and mapNonEmpty!58273 ((_ is ValueCellFull!17946) mapValue!58273)) b!1542472))

(assert (= (and b!1542473 ((_ is ValueCellFull!17946) mapDefault!58273)) b!1542474))

(assert (= start!131724 b!1542473))

(declare-fun m!1424101 () Bool)

(assert (=> start!131724 m!1424101))

(declare-fun m!1424103 () Bool)

(assert (=> start!131724 m!1424103))

(declare-fun m!1424105 () Bool)

(assert (=> start!131724 m!1424105))

(declare-fun m!1424107 () Bool)

(assert (=> mapNonEmpty!58273 m!1424107))

(declare-fun m!1424109 () Bool)

(assert (=> b!1542475 m!1424109))

(declare-fun m!1424111 () Bool)

(assert (=> b!1542476 m!1424111))

(check-sat (not mapNonEmpty!58273) (not b!1542476) (not start!131724) (not b!1542475) tp_is_empty!37713)
(check-sat)
