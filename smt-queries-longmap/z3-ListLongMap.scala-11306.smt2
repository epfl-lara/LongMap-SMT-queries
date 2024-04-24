; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132152 () Bool)

(assert start!132152)

(declare-fun res!1059443 () Bool)

(declare-fun e!859785 () Bool)

(assert (=> start!132152 (=> (not res!1059443) (not e!859785))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132152 (= res!1059443 (validMask!0 mask!926))))

(assert (=> start!132152 e!859785))

(assert (=> start!132152 true))

(declare-datatypes ((V!58749 0))(
  ( (V!58750 (val!18942 Int)) )
))
(declare-datatypes ((ValueCell!17954 0))(
  ( (ValueCellFull!17954 (v!21735 V!58749)) (EmptyCell!17954) )
))
(declare-datatypes ((array!102810 0))(
  ( (array!102811 (arr!49600 (Array (_ BitVec 32) ValueCell!17954)) (size!50151 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102810)

(declare-fun e!859784 () Bool)

(declare-fun array_inv!38851 (array!102810) Bool)

(assert (=> start!132152 (and (array_inv!38851 _values!470) e!859784)))

(declare-datatypes ((array!102812 0))(
  ( (array!102813 (arr!49601 (Array (_ BitVec 32) (_ BitVec 64))) (size!50152 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102812)

(declare-fun array_inv!38852 (array!102812) Bool)

(assert (=> start!132152 (array_inv!38852 _keys!618)))

(declare-fun b!1545051 () Bool)

(declare-fun res!1059441 () Bool)

(assert (=> b!1545051 (=> (not res!1059441) (not e!859785))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545051 (= res!1059441 (and (= (size!50151 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50152 _keys!618) (size!50151 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58297 () Bool)

(declare-fun mapRes!58297 () Bool)

(declare-fun tp!110824 () Bool)

(declare-fun e!859786 () Bool)

(assert (=> mapNonEmpty!58297 (= mapRes!58297 (and tp!110824 e!859786))))

(declare-fun mapKey!58297 () (_ BitVec 32))

(declare-fun mapValue!58297 () ValueCell!17954)

(declare-fun mapRest!58297 () (Array (_ BitVec 32) ValueCell!17954))

(assert (=> mapNonEmpty!58297 (= (arr!49600 _values!470) (store mapRest!58297 mapKey!58297 mapValue!58297))))

(declare-fun b!1545052 () Bool)

(declare-fun tp_is_empty!37729 () Bool)

(assert (=> b!1545052 (= e!859786 tp_is_empty!37729)))

(declare-fun b!1545053 () Bool)

(declare-fun e!859788 () Bool)

(assert (=> b!1545053 (= e!859788 tp_is_empty!37729)))

(declare-fun mapIsEmpty!58297 () Bool)

(assert (=> mapIsEmpty!58297 mapRes!58297))

(declare-fun b!1545054 () Bool)

(assert (=> b!1545054 (= e!859784 (and e!859788 mapRes!58297))))

(declare-fun condMapEmpty!58297 () Bool)

(declare-fun mapDefault!58297 () ValueCell!17954)

(assert (=> b!1545054 (= condMapEmpty!58297 (= (arr!49600 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17954)) mapDefault!58297)))))

(declare-fun b!1545055 () Bool)

(declare-fun res!1059442 () Bool)

(assert (=> b!1545055 (=> (not res!1059442) (not e!859785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102812 (_ BitVec 32)) Bool)

(assert (=> b!1545055 (= res!1059442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545056 () Bool)

(assert (=> b!1545056 (= e!859785 false)))

(declare-fun lt!666754 () Bool)

(declare-datatypes ((List!35925 0))(
  ( (Nil!35922) (Cons!35921 (h!37384 (_ BitVec 64)) (t!50611 List!35925)) )
))
(declare-fun arrayNoDuplicates!0 (array!102812 (_ BitVec 32) List!35925) Bool)

(assert (=> b!1545056 (= lt!666754 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35922))))

(assert (= (and start!132152 res!1059443) b!1545051))

(assert (= (and b!1545051 res!1059441) b!1545055))

(assert (= (and b!1545055 res!1059442) b!1545056))

(assert (= (and b!1545054 condMapEmpty!58297) mapIsEmpty!58297))

(assert (= (and b!1545054 (not condMapEmpty!58297)) mapNonEmpty!58297))

(get-info :version)

(assert (= (and mapNonEmpty!58297 ((_ is ValueCellFull!17954) mapValue!58297)) b!1545052))

(assert (= (and b!1545054 ((_ is ValueCellFull!17954) mapDefault!58297)) b!1545053))

(assert (= start!132152 b!1545054))

(declare-fun m!1426455 () Bool)

(assert (=> start!132152 m!1426455))

(declare-fun m!1426457 () Bool)

(assert (=> start!132152 m!1426457))

(declare-fun m!1426459 () Bool)

(assert (=> start!132152 m!1426459))

(declare-fun m!1426461 () Bool)

(assert (=> mapNonEmpty!58297 m!1426461))

(declare-fun m!1426463 () Bool)

(assert (=> b!1545055 m!1426463))

(declare-fun m!1426465 () Bool)

(assert (=> b!1545056 m!1426465))

(check-sat (not mapNonEmpty!58297) (not start!132152) (not b!1545055) (not b!1545056) tp_is_empty!37729)
(check-sat)
