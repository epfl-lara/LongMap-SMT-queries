; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132086 () Bool)

(assert start!132086)

(declare-fun b!1544457 () Bool)

(declare-fun e!859293 () Bool)

(declare-fun e!859292 () Bool)

(declare-fun mapRes!58198 () Bool)

(assert (=> b!1544457 (= e!859293 (and e!859292 mapRes!58198))))

(declare-fun condMapEmpty!58198 () Bool)

(declare-datatypes ((V!58661 0))(
  ( (V!58662 (val!18909 Int)) )
))
(declare-datatypes ((ValueCell!17921 0))(
  ( (ValueCellFull!17921 (v!21702 V!58661)) (EmptyCell!17921) )
))
(declare-datatypes ((array!102686 0))(
  ( (array!102687 (arr!49538 (Array (_ BitVec 32) ValueCell!17921)) (size!50089 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102686)

(declare-fun mapDefault!58198 () ValueCell!17921)

(assert (=> b!1544457 (= condMapEmpty!58198 (= (arr!49538 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17921)) mapDefault!58198)))))

(declare-fun mapIsEmpty!58198 () Bool)

(assert (=> mapIsEmpty!58198 mapRes!58198))

(declare-fun b!1544458 () Bool)

(declare-fun e!859291 () Bool)

(assert (=> b!1544458 (= e!859291 false)))

(declare-fun lt!666655 () Bool)

(declare-datatypes ((array!102688 0))(
  ( (array!102689 (arr!49539 (Array (_ BitVec 32) (_ BitVec 64))) (size!50090 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102688)

(declare-datatypes ((List!35902 0))(
  ( (Nil!35899) (Cons!35898 (h!37361 (_ BitVec 64)) (t!50588 List!35902)) )
))
(declare-fun arrayNoDuplicates!0 (array!102688 (_ BitVec 32) List!35902) Bool)

(assert (=> b!1544458 (= lt!666655 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35899))))

(declare-fun b!1544459 () Bool)

(declare-fun res!1059146 () Bool)

(assert (=> b!1544459 (=> (not res!1059146) (not e!859291))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102688 (_ BitVec 32)) Bool)

(assert (=> b!1544459 (= res!1059146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58198 () Bool)

(declare-fun tp!110725 () Bool)

(declare-fun e!859289 () Bool)

(assert (=> mapNonEmpty!58198 (= mapRes!58198 (and tp!110725 e!859289))))

(declare-fun mapKey!58198 () (_ BitVec 32))

(declare-fun mapValue!58198 () ValueCell!17921)

(declare-fun mapRest!58198 () (Array (_ BitVec 32) ValueCell!17921))

(assert (=> mapNonEmpty!58198 (= (arr!49538 _values!470) (store mapRest!58198 mapKey!58198 mapValue!58198))))

(declare-fun res!1059145 () Bool)

(assert (=> start!132086 (=> (not res!1059145) (not e!859291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132086 (= res!1059145 (validMask!0 mask!926))))

(assert (=> start!132086 e!859291))

(assert (=> start!132086 true))

(declare-fun array_inv!38807 (array!102686) Bool)

(assert (=> start!132086 (and (array_inv!38807 _values!470) e!859293)))

(declare-fun array_inv!38808 (array!102688) Bool)

(assert (=> start!132086 (array_inv!38808 _keys!618)))

(declare-fun b!1544460 () Bool)

(declare-fun tp_is_empty!37663 () Bool)

(assert (=> b!1544460 (= e!859292 tp_is_empty!37663)))

(declare-fun b!1544461 () Bool)

(declare-fun res!1059144 () Bool)

(assert (=> b!1544461 (=> (not res!1059144) (not e!859291))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544461 (= res!1059144 (and (= (size!50089 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50090 _keys!618) (size!50089 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544462 () Bool)

(assert (=> b!1544462 (= e!859289 tp_is_empty!37663)))

(assert (= (and start!132086 res!1059145) b!1544461))

(assert (= (and b!1544461 res!1059144) b!1544459))

(assert (= (and b!1544459 res!1059146) b!1544458))

(assert (= (and b!1544457 condMapEmpty!58198) mapIsEmpty!58198))

(assert (= (and b!1544457 (not condMapEmpty!58198)) mapNonEmpty!58198))

(get-info :version)

(assert (= (and mapNonEmpty!58198 ((_ is ValueCellFull!17921) mapValue!58198)) b!1544462))

(assert (= (and b!1544457 ((_ is ValueCellFull!17921) mapDefault!58198)) b!1544460))

(assert (= start!132086 b!1544457))

(declare-fun m!1426059 () Bool)

(assert (=> b!1544458 m!1426059))

(declare-fun m!1426061 () Bool)

(assert (=> b!1544459 m!1426061))

(declare-fun m!1426063 () Bool)

(assert (=> mapNonEmpty!58198 m!1426063))

(declare-fun m!1426065 () Bool)

(assert (=> start!132086 m!1426065))

(declare-fun m!1426067 () Bool)

(assert (=> start!132086 m!1426067))

(declare-fun m!1426069 () Bool)

(assert (=> start!132086 m!1426069))

(check-sat (not mapNonEmpty!58198) (not b!1544459) tp_is_empty!37663 (not start!132086) (not b!1544458))
(check-sat)
