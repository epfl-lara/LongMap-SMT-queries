; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131822 () Bool)

(assert start!131822)

(declare-fun b!1543490 () Bool)

(declare-fun e!859070 () Bool)

(declare-fun e!859071 () Bool)

(declare-fun mapRes!58495 () Bool)

(assert (=> b!1543490 (= e!859070 (and e!859071 mapRes!58495))))

(declare-fun condMapEmpty!58495 () Bool)

(declare-datatypes ((V!58925 0))(
  ( (V!58926 (val!19008 Int)) )
))
(declare-datatypes ((ValueCell!18020 0))(
  ( (ValueCellFull!18020 (v!21805 V!58925)) (EmptyCell!18020) )
))
(declare-datatypes ((array!102870 0))(
  ( (array!102871 (arr!49638 (Array (_ BitVec 32) ValueCell!18020)) (size!50190 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102870)

(declare-fun mapDefault!58495 () ValueCell!18020)

(assert (=> b!1543490 (= condMapEmpty!58495 (= (arr!49638 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18020)) mapDefault!58495)))))

(declare-fun b!1543491 () Bool)

(declare-fun e!859067 () Bool)

(declare-fun tp_is_empty!37861 () Bool)

(assert (=> b!1543491 (= e!859067 tp_is_empty!37861)))

(declare-fun res!1059046 () Bool)

(declare-fun e!859068 () Bool)

(assert (=> start!131822 (=> (not res!1059046) (not e!859068))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131822 (= res!1059046 (validMask!0 mask!926))))

(assert (=> start!131822 e!859068))

(assert (=> start!131822 true))

(declare-fun array_inv!38811 (array!102870) Bool)

(assert (=> start!131822 (and (array_inv!38811 _values!470) e!859070)))

(declare-datatypes ((array!102872 0))(
  ( (array!102873 (arr!49639 (Array (_ BitVec 32) (_ BitVec 64))) (size!50191 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102872)

(declare-fun array_inv!38812 (array!102872) Bool)

(assert (=> start!131822 (array_inv!38812 _keys!618)))

(declare-fun b!1543492 () Bool)

(declare-fun res!1059048 () Bool)

(assert (=> b!1543492 (=> (not res!1059048) (not e!859068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102872 (_ BitVec 32)) Bool)

(assert (=> b!1543492 (= res!1059048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58495 () Bool)

(assert (=> mapIsEmpty!58495 mapRes!58495))

(declare-fun b!1543493 () Bool)

(declare-fun res!1059047 () Bool)

(assert (=> b!1543493 (=> (not res!1059047) (not e!859068))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543493 (= res!1059047 (and (= (size!50190 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50191 _keys!618) (size!50190 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543494 () Bool)

(assert (=> b!1543494 (= e!859071 tp_is_empty!37861)))

(declare-fun b!1543495 () Bool)

(assert (=> b!1543495 (= e!859068 false)))

(declare-fun lt!665758 () Bool)

(declare-datatypes ((List!35980 0))(
  ( (Nil!35977) (Cons!35976 (h!37422 (_ BitVec 64)) (t!50666 List!35980)) )
))
(declare-fun arrayNoDuplicates!0 (array!102872 (_ BitVec 32) List!35980) Bool)

(assert (=> b!1543495 (= lt!665758 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35977))))

(declare-fun mapNonEmpty!58495 () Bool)

(declare-fun tp!111023 () Bool)

(assert (=> mapNonEmpty!58495 (= mapRes!58495 (and tp!111023 e!859067))))

(declare-fun mapValue!58495 () ValueCell!18020)

(declare-fun mapKey!58495 () (_ BitVec 32))

(declare-fun mapRest!58495 () (Array (_ BitVec 32) ValueCell!18020))

(assert (=> mapNonEmpty!58495 (= (arr!49638 _values!470) (store mapRest!58495 mapKey!58495 mapValue!58495))))

(assert (= (and start!131822 res!1059046) b!1543493))

(assert (= (and b!1543493 res!1059047) b!1543492))

(assert (= (and b!1543492 res!1059048) b!1543495))

(assert (= (and b!1543490 condMapEmpty!58495) mapIsEmpty!58495))

(assert (= (and b!1543490 (not condMapEmpty!58495)) mapNonEmpty!58495))

(get-info :version)

(assert (= (and mapNonEmpty!58495 ((_ is ValueCellFull!18020) mapValue!58495)) b!1543491))

(assert (= (and b!1543490 ((_ is ValueCellFull!18020) mapDefault!58495)) b!1543494))

(assert (= start!131822 b!1543490))

(declare-fun m!1424097 () Bool)

(assert (=> start!131822 m!1424097))

(declare-fun m!1424099 () Bool)

(assert (=> start!131822 m!1424099))

(declare-fun m!1424101 () Bool)

(assert (=> start!131822 m!1424101))

(declare-fun m!1424103 () Bool)

(assert (=> b!1543492 m!1424103))

(declare-fun m!1424105 () Bool)

(assert (=> b!1543495 m!1424105))

(declare-fun m!1424107 () Bool)

(assert (=> mapNonEmpty!58495 m!1424107))

(check-sat (not mapNonEmpty!58495) (not start!131822) (not b!1543495) (not b!1543492) tp_is_empty!37861)
(check-sat)
