; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33476 () Bool)

(assert start!33476)

(declare-fun b!332271 () Bool)

(declare-fun e!204003 () Bool)

(declare-fun e!204005 () Bool)

(declare-fun mapRes!11478 () Bool)

(assert (=> b!332271 (= e!204003 (and e!204005 mapRes!11478))))

(declare-fun condMapEmpty!11478 () Bool)

(declare-datatypes ((V!9949 0))(
  ( (V!9950 (val!3409 Int)) )
))
(declare-datatypes ((ValueCell!3021 0))(
  ( (ValueCellFull!3021 (v!5568 V!9949)) (EmptyCell!3021) )
))
(declare-datatypes ((array!17053 0))(
  ( (array!17054 (arr!8061 (Array (_ BitVec 32) ValueCell!3021)) (size!8413 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17053)

(declare-fun mapDefault!11478 () ValueCell!3021)

(assert (=> b!332271 (= condMapEmpty!11478 (= (arr!8061 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3021)) mapDefault!11478)))))

(declare-fun b!332272 () Bool)

(declare-fun e!204004 () Bool)

(assert (=> b!332272 (= e!204004 false)))

(declare-fun lt!158989 () Bool)

(declare-datatypes ((array!17055 0))(
  ( (array!17056 (arr!8062 (Array (_ BitVec 32) (_ BitVec 64))) (size!8414 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17055)

(declare-datatypes ((List!4588 0))(
  ( (Nil!4585) (Cons!4584 (h!5440 (_ BitVec 64)) (t!9670 List!4588)) )
))
(declare-fun arrayNoDuplicates!0 (array!17055 (_ BitVec 32) List!4588) Bool)

(assert (=> b!332272 (= lt!158989 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4585))))

(declare-fun res!183049 () Bool)

(assert (=> start!33476 (=> (not res!183049) (not e!204004))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33476 (= res!183049 (validMask!0 mask!2385))))

(assert (=> start!33476 e!204004))

(assert (=> start!33476 true))

(declare-fun array_inv!6004 (array!17053) Bool)

(assert (=> start!33476 (and (array_inv!6004 _values!1525) e!204003)))

(declare-fun array_inv!6005 (array!17055) Bool)

(assert (=> start!33476 (array_inv!6005 _keys!1895)))

(declare-fun b!332273 () Bool)

(declare-fun e!204006 () Bool)

(declare-fun tp_is_empty!6729 () Bool)

(assert (=> b!332273 (= e!204006 tp_is_empty!6729)))

(declare-fun mapIsEmpty!11478 () Bool)

(assert (=> mapIsEmpty!11478 mapRes!11478))

(declare-fun b!332274 () Bool)

(declare-fun res!183050 () Bool)

(assert (=> b!332274 (=> (not res!183050) (not e!204004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17055 (_ BitVec 32)) Bool)

(assert (=> b!332274 (= res!183050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332275 () Bool)

(declare-fun res!183048 () Bool)

(assert (=> b!332275 (=> (not res!183048) (not e!204004))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332275 (= res!183048 (and (= (size!8413 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8414 _keys!1895) (size!8413 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11478 () Bool)

(declare-fun tp!23853 () Bool)

(assert (=> mapNonEmpty!11478 (= mapRes!11478 (and tp!23853 e!204006))))

(declare-fun mapKey!11478 () (_ BitVec 32))

(declare-fun mapValue!11478 () ValueCell!3021)

(declare-fun mapRest!11478 () (Array (_ BitVec 32) ValueCell!3021))

(assert (=> mapNonEmpty!11478 (= (arr!8061 _values!1525) (store mapRest!11478 mapKey!11478 mapValue!11478))))

(declare-fun b!332276 () Bool)

(assert (=> b!332276 (= e!204005 tp_is_empty!6729)))

(assert (= (and start!33476 res!183049) b!332275))

(assert (= (and b!332275 res!183048) b!332274))

(assert (= (and b!332274 res!183050) b!332272))

(assert (= (and b!332271 condMapEmpty!11478) mapIsEmpty!11478))

(assert (= (and b!332271 (not condMapEmpty!11478)) mapNonEmpty!11478))

(get-info :version)

(assert (= (and mapNonEmpty!11478 ((_ is ValueCellFull!3021) mapValue!11478)) b!332273))

(assert (= (and b!332271 ((_ is ValueCellFull!3021) mapDefault!11478)) b!332276))

(assert (= start!33476 b!332271))

(declare-fun m!336849 () Bool)

(assert (=> b!332272 m!336849))

(declare-fun m!336851 () Bool)

(assert (=> start!33476 m!336851))

(declare-fun m!336853 () Bool)

(assert (=> start!33476 m!336853))

(declare-fun m!336855 () Bool)

(assert (=> start!33476 m!336855))

(declare-fun m!336857 () Bool)

(assert (=> b!332274 m!336857))

(declare-fun m!336859 () Bool)

(assert (=> mapNonEmpty!11478 m!336859))

(check-sat (not mapNonEmpty!11478) (not b!332274) (not start!33476) tp_is_empty!6729 (not b!332272))
(check-sat)
