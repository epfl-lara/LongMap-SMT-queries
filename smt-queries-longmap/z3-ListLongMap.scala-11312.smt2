; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131726 () Bool)

(assert start!131726)

(declare-fun b!1542626 () Bool)

(declare-fun e!858348 () Bool)

(declare-fun tp_is_empty!37765 () Bool)

(assert (=> b!1542626 (= e!858348 tp_is_empty!37765)))

(declare-fun b!1542627 () Bool)

(declare-fun res!1058614 () Bool)

(declare-fun e!858351 () Bool)

(assert (=> b!1542627 (=> (not res!1058614) (not e!858351))))

(declare-datatypes ((array!102690 0))(
  ( (array!102691 (arr!49548 (Array (_ BitVec 32) (_ BitVec 64))) (size!50100 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102690)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102690 (_ BitVec 32)) Bool)

(assert (=> b!1542627 (= res!1058614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542628 () Bool)

(assert (=> b!1542628 (= e!858351 false)))

(declare-fun lt!665614 () Bool)

(declare-datatypes ((List!35948 0))(
  ( (Nil!35945) (Cons!35944 (h!37390 (_ BitVec 64)) (t!50634 List!35948)) )
))
(declare-fun arrayNoDuplicates!0 (array!102690 (_ BitVec 32) List!35948) Bool)

(assert (=> b!1542628 (= lt!665614 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35945))))

(declare-fun b!1542629 () Bool)

(declare-fun res!1058616 () Bool)

(assert (=> b!1542629 (=> (not res!1058616) (not e!858351))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((V!58797 0))(
  ( (V!58798 (val!18960 Int)) )
))
(declare-datatypes ((ValueCell!17972 0))(
  ( (ValueCellFull!17972 (v!21757 V!58797)) (EmptyCell!17972) )
))
(declare-datatypes ((array!102692 0))(
  ( (array!102693 (arr!49549 (Array (_ BitVec 32) ValueCell!17972)) (size!50101 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102692)

(assert (=> b!1542629 (= res!1058616 (and (= (size!50101 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50100 _keys!618) (size!50101 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58351 () Bool)

(declare-fun mapRes!58351 () Bool)

(assert (=> mapIsEmpty!58351 mapRes!58351))

(declare-fun b!1542630 () Bool)

(declare-fun e!858349 () Bool)

(assert (=> b!1542630 (= e!858349 tp_is_empty!37765)))

(declare-fun res!1058615 () Bool)

(assert (=> start!131726 (=> (not res!1058615) (not e!858351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131726 (= res!1058615 (validMask!0 mask!926))))

(assert (=> start!131726 e!858351))

(assert (=> start!131726 true))

(declare-fun e!858350 () Bool)

(declare-fun array_inv!38743 (array!102692) Bool)

(assert (=> start!131726 (and (array_inv!38743 _values!470) e!858350)))

(declare-fun array_inv!38744 (array!102690) Bool)

(assert (=> start!131726 (array_inv!38744 _keys!618)))

(declare-fun mapNonEmpty!58351 () Bool)

(declare-fun tp!110879 () Bool)

(assert (=> mapNonEmpty!58351 (= mapRes!58351 (and tp!110879 e!858349))))

(declare-fun mapValue!58351 () ValueCell!17972)

(declare-fun mapKey!58351 () (_ BitVec 32))

(declare-fun mapRest!58351 () (Array (_ BitVec 32) ValueCell!17972))

(assert (=> mapNonEmpty!58351 (= (arr!49549 _values!470) (store mapRest!58351 mapKey!58351 mapValue!58351))))

(declare-fun b!1542631 () Bool)

(assert (=> b!1542631 (= e!858350 (and e!858348 mapRes!58351))))

(declare-fun condMapEmpty!58351 () Bool)

(declare-fun mapDefault!58351 () ValueCell!17972)

(assert (=> b!1542631 (= condMapEmpty!58351 (= (arr!49549 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17972)) mapDefault!58351)))))

(assert (= (and start!131726 res!1058615) b!1542629))

(assert (= (and b!1542629 res!1058616) b!1542627))

(assert (= (and b!1542627 res!1058614) b!1542628))

(assert (= (and b!1542631 condMapEmpty!58351) mapIsEmpty!58351))

(assert (= (and b!1542631 (not condMapEmpty!58351)) mapNonEmpty!58351))

(get-info :version)

(assert (= (and mapNonEmpty!58351 ((_ is ValueCellFull!17972) mapValue!58351)) b!1542630))

(assert (= (and b!1542631 ((_ is ValueCellFull!17972) mapDefault!58351)) b!1542626))

(assert (= start!131726 b!1542631))

(declare-fun m!1423521 () Bool)

(assert (=> b!1542627 m!1423521))

(declare-fun m!1423523 () Bool)

(assert (=> b!1542628 m!1423523))

(declare-fun m!1423525 () Bool)

(assert (=> start!131726 m!1423525))

(declare-fun m!1423527 () Bool)

(assert (=> start!131726 m!1423527))

(declare-fun m!1423529 () Bool)

(assert (=> start!131726 m!1423529))

(declare-fun m!1423531 () Bool)

(assert (=> mapNonEmpty!58351 m!1423531))

(check-sat (not b!1542627) (not b!1542628) tp_is_empty!37765 (not start!131726) (not mapNonEmpty!58351))
(check-sat)
