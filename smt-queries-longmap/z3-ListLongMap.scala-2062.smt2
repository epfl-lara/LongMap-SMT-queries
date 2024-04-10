; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35542 () Bool)

(assert start!35542)

(declare-fun b!356150 () Bool)

(declare-fun res!197577 () Bool)

(declare-fun e!218261 () Bool)

(assert (=> b!356150 (=> (not res!197577) (not e!218261))))

(declare-datatypes ((array!19561 0))(
  ( (array!19562 (arr!9274 (Array (_ BitVec 32) (_ BitVec 64))) (size!9626 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19561)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19561 (_ BitVec 32)) Bool)

(assert (=> b!356150 (= res!197577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356151 () Bool)

(declare-fun e!218258 () Bool)

(declare-fun e!218260 () Bool)

(declare-fun mapRes!13500 () Bool)

(assert (=> b!356151 (= e!218258 (and e!218260 mapRes!13500))))

(declare-fun condMapEmpty!13500 () Bool)

(declare-datatypes ((V!11637 0))(
  ( (V!11638 (val!4042 Int)) )
))
(declare-datatypes ((ValueCell!3654 0))(
  ( (ValueCellFull!3654 (v!6236 V!11637)) (EmptyCell!3654) )
))
(declare-datatypes ((array!19563 0))(
  ( (array!19564 (arr!9275 (Array (_ BitVec 32) ValueCell!3654)) (size!9627 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19563)

(declare-fun mapDefault!13500 () ValueCell!3654)

(assert (=> b!356151 (= condMapEmpty!13500 (= (arr!9275 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3654)) mapDefault!13500)))))

(declare-fun res!197576 () Bool)

(assert (=> start!35542 (=> (not res!197576) (not e!218261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35542 (= res!197576 (validMask!0 mask!1842))))

(assert (=> start!35542 e!218261))

(assert (=> start!35542 true))

(declare-fun array_inv!6816 (array!19563) Bool)

(assert (=> start!35542 (and (array_inv!6816 _values!1208) e!218258)))

(declare-fun array_inv!6817 (array!19561) Bool)

(assert (=> start!35542 (array_inv!6817 _keys!1456)))

(declare-fun mapNonEmpty!13500 () Bool)

(declare-fun tp!27477 () Bool)

(declare-fun e!218259 () Bool)

(assert (=> mapNonEmpty!13500 (= mapRes!13500 (and tp!27477 e!218259))))

(declare-fun mapKey!13500 () (_ BitVec 32))

(declare-fun mapRest!13500 () (Array (_ BitVec 32) ValueCell!3654))

(declare-fun mapValue!13500 () ValueCell!3654)

(assert (=> mapNonEmpty!13500 (= (arr!9275 _values!1208) (store mapRest!13500 mapKey!13500 mapValue!13500))))

(declare-fun b!356152 () Bool)

(declare-fun tp_is_empty!7995 () Bool)

(assert (=> b!356152 (= e!218259 tp_is_empty!7995)))

(declare-fun b!356153 () Bool)

(assert (=> b!356153 (= e!218260 tp_is_empty!7995)))

(declare-fun b!356154 () Bool)

(declare-fun res!197578 () Bool)

(assert (=> b!356154 (=> (not res!197578) (not e!218261))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356154 (= res!197578 (and (= (size!9627 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9626 _keys!1456) (size!9627 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13500 () Bool)

(assert (=> mapIsEmpty!13500 mapRes!13500))

(declare-fun b!356155 () Bool)

(assert (=> b!356155 (= e!218261 false)))

(declare-fun lt!165908 () Bool)

(declare-datatypes ((List!5363 0))(
  ( (Nil!5360) (Cons!5359 (h!6215 (_ BitVec 64)) (t!10513 List!5363)) )
))
(declare-fun arrayNoDuplicates!0 (array!19561 (_ BitVec 32) List!5363) Bool)

(assert (=> b!356155 (= lt!165908 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5360))))

(assert (= (and start!35542 res!197576) b!356154))

(assert (= (and b!356154 res!197578) b!356150))

(assert (= (and b!356150 res!197577) b!356155))

(assert (= (and b!356151 condMapEmpty!13500) mapIsEmpty!13500))

(assert (= (and b!356151 (not condMapEmpty!13500)) mapNonEmpty!13500))

(get-info :version)

(assert (= (and mapNonEmpty!13500 ((_ is ValueCellFull!3654) mapValue!13500)) b!356152))

(assert (= (and b!356151 ((_ is ValueCellFull!3654) mapDefault!13500)) b!356153))

(assert (= start!35542 b!356151))

(declare-fun m!354649 () Bool)

(assert (=> b!356150 m!354649))

(declare-fun m!354651 () Bool)

(assert (=> start!35542 m!354651))

(declare-fun m!354653 () Bool)

(assert (=> start!35542 m!354653))

(declare-fun m!354655 () Bool)

(assert (=> start!35542 m!354655))

(declare-fun m!354657 () Bool)

(assert (=> mapNonEmpty!13500 m!354657))

(declare-fun m!354659 () Bool)

(assert (=> b!356155 m!354659))

(check-sat (not start!35542) (not b!356155) tp_is_empty!7995 (not mapNonEmpty!13500) (not b!356150))
(check-sat)
