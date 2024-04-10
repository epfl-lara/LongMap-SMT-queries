; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131754 () Bool)

(assert start!131754)

(declare-fun b!1542741 () Bool)

(declare-fun e!858384 () Bool)

(declare-fun e!858382 () Bool)

(declare-fun mapRes!58318 () Bool)

(assert (=> b!1542741 (= e!858384 (and e!858382 mapRes!58318))))

(declare-fun condMapEmpty!58318 () Bool)

(declare-datatypes ((V!58767 0))(
  ( (V!58768 (val!18949 Int)) )
))
(declare-datatypes ((ValueCell!17961 0))(
  ( (ValueCellFull!17961 (v!21750 V!58767)) (EmptyCell!17961) )
))
(declare-datatypes ((array!102714 0))(
  ( (array!102715 (arr!49559 (Array (_ BitVec 32) ValueCell!17961)) (size!50109 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102714)

(declare-fun mapDefault!58318 () ValueCell!17961)

(assert (=> b!1542741 (= condMapEmpty!58318 (= (arr!49559 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17961)) mapDefault!58318)))))

(declare-fun b!1542742 () Bool)

(declare-fun e!858380 () Bool)

(declare-fun tp_is_empty!37743 () Bool)

(assert (=> b!1542742 (= e!858380 tp_is_empty!37743)))

(declare-fun b!1542743 () Bool)

(declare-fun e!858381 () Bool)

(assert (=> b!1542743 (= e!858381 false)))

(declare-fun lt!665867 () Bool)

(declare-datatypes ((array!102716 0))(
  ( (array!102717 (arr!49560 (Array (_ BitVec 32) (_ BitVec 64))) (size!50110 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102716)

(declare-datatypes ((List!35890 0))(
  ( (Nil!35887) (Cons!35886 (h!37331 (_ BitVec 64)) (t!50584 List!35890)) )
))
(declare-fun arrayNoDuplicates!0 (array!102716 (_ BitVec 32) List!35890) Bool)

(assert (=> b!1542743 (= lt!665867 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35887))))

(declare-fun b!1542744 () Bool)

(assert (=> b!1542744 (= e!858382 tp_is_empty!37743)))

(declare-fun res!1058644 () Bool)

(assert (=> start!131754 (=> (not res!1058644) (not e!858381))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131754 (= res!1058644 (validMask!0 mask!926))))

(assert (=> start!131754 e!858381))

(assert (=> start!131754 true))

(declare-fun array_inv!38561 (array!102714) Bool)

(assert (=> start!131754 (and (array_inv!38561 _values!470) e!858384)))

(declare-fun array_inv!38562 (array!102716) Bool)

(assert (=> start!131754 (array_inv!38562 _keys!618)))

(declare-fun b!1542745 () Bool)

(declare-fun res!1058646 () Bool)

(assert (=> b!1542745 (=> (not res!1058646) (not e!858381))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542745 (= res!1058646 (and (= (size!50109 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50110 _keys!618) (size!50109 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542746 () Bool)

(declare-fun res!1058645 () Bool)

(assert (=> b!1542746 (=> (not res!1058645) (not e!858381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102716 (_ BitVec 32)) Bool)

(assert (=> b!1542746 (= res!1058645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58318 () Bool)

(assert (=> mapIsEmpty!58318 mapRes!58318))

(declare-fun mapNonEmpty!58318 () Bool)

(declare-fun tp!110845 () Bool)

(assert (=> mapNonEmpty!58318 (= mapRes!58318 (and tp!110845 e!858380))))

(declare-fun mapRest!58318 () (Array (_ BitVec 32) ValueCell!17961))

(declare-fun mapValue!58318 () ValueCell!17961)

(declare-fun mapKey!58318 () (_ BitVec 32))

(assert (=> mapNonEmpty!58318 (= (arr!49559 _values!470) (store mapRest!58318 mapKey!58318 mapValue!58318))))

(assert (= (and start!131754 res!1058644) b!1542745))

(assert (= (and b!1542745 res!1058646) b!1542746))

(assert (= (and b!1542746 res!1058645) b!1542743))

(assert (= (and b!1542741 condMapEmpty!58318) mapIsEmpty!58318))

(assert (= (and b!1542741 (not condMapEmpty!58318)) mapNonEmpty!58318))

(get-info :version)

(assert (= (and mapNonEmpty!58318 ((_ is ValueCellFull!17961) mapValue!58318)) b!1542742))

(assert (= (and b!1542741 ((_ is ValueCellFull!17961) mapDefault!58318)) b!1542744))

(assert (= start!131754 b!1542741))

(declare-fun m!1424281 () Bool)

(assert (=> b!1542743 m!1424281))

(declare-fun m!1424283 () Bool)

(assert (=> start!131754 m!1424283))

(declare-fun m!1424285 () Bool)

(assert (=> start!131754 m!1424285))

(declare-fun m!1424287 () Bool)

(assert (=> start!131754 m!1424287))

(declare-fun m!1424289 () Bool)

(assert (=> b!1542746 m!1424289))

(declare-fun m!1424291 () Bool)

(assert (=> mapNonEmpty!58318 m!1424291))

(check-sat (not b!1542743) (not b!1542746) tp_is_empty!37743 (not mapNonEmpty!58318) (not start!131754))
(check-sat)
