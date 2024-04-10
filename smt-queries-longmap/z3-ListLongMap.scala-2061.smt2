; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35536 () Bool)

(assert start!35536)

(declare-fun mapNonEmpty!13491 () Bool)

(declare-fun mapRes!13491 () Bool)

(declare-fun tp!27468 () Bool)

(declare-fun e!218215 () Bool)

(assert (=> mapNonEmpty!13491 (= mapRes!13491 (and tp!27468 e!218215))))

(declare-datatypes ((V!11629 0))(
  ( (V!11630 (val!4039 Int)) )
))
(declare-datatypes ((ValueCell!3651 0))(
  ( (ValueCellFull!3651 (v!6233 V!11629)) (EmptyCell!3651) )
))
(declare-fun mapRest!13491 () (Array (_ BitVec 32) ValueCell!3651))

(declare-fun mapKey!13491 () (_ BitVec 32))

(declare-fun mapValue!13491 () ValueCell!3651)

(declare-datatypes ((array!19551 0))(
  ( (array!19552 (arr!9269 (Array (_ BitVec 32) ValueCell!3651)) (size!9621 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19551)

(assert (=> mapNonEmpty!13491 (= (arr!9269 _values!1208) (store mapRest!13491 mapKey!13491 mapValue!13491))))

(declare-fun b!356096 () Bool)

(declare-fun res!197551 () Bool)

(declare-fun e!218213 () Bool)

(assert (=> b!356096 (=> (not res!197551) (not e!218213))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((array!19553 0))(
  ( (array!19554 (arr!9270 (Array (_ BitVec 32) (_ BitVec 64))) (size!9622 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19553)

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!356096 (= res!197551 (and (= (size!9621 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9622 _keys!1456) (size!9621 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13491 () Bool)

(assert (=> mapIsEmpty!13491 mapRes!13491))

(declare-fun b!356097 () Bool)

(assert (=> b!356097 (= e!218213 false)))

(declare-fun lt!165899 () Bool)

(declare-datatypes ((List!5361 0))(
  ( (Nil!5358) (Cons!5357 (h!6213 (_ BitVec 64)) (t!10511 List!5361)) )
))
(declare-fun arrayNoDuplicates!0 (array!19553 (_ BitVec 32) List!5361) Bool)

(assert (=> b!356097 (= lt!165899 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5358))))

(declare-fun res!197549 () Bool)

(assert (=> start!35536 (=> (not res!197549) (not e!218213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35536 (= res!197549 (validMask!0 mask!1842))))

(assert (=> start!35536 e!218213))

(assert (=> start!35536 true))

(declare-fun e!218214 () Bool)

(declare-fun array_inv!6812 (array!19551) Bool)

(assert (=> start!35536 (and (array_inv!6812 _values!1208) e!218214)))

(declare-fun array_inv!6813 (array!19553) Bool)

(assert (=> start!35536 (array_inv!6813 _keys!1456)))

(declare-fun b!356098 () Bool)

(declare-fun e!218212 () Bool)

(assert (=> b!356098 (= e!218214 (and e!218212 mapRes!13491))))

(declare-fun condMapEmpty!13491 () Bool)

(declare-fun mapDefault!13491 () ValueCell!3651)

(assert (=> b!356098 (= condMapEmpty!13491 (= (arr!9269 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3651)) mapDefault!13491)))))

(declare-fun b!356099 () Bool)

(declare-fun tp_is_empty!7989 () Bool)

(assert (=> b!356099 (= e!218215 tp_is_empty!7989)))

(declare-fun b!356100 () Bool)

(assert (=> b!356100 (= e!218212 tp_is_empty!7989)))

(declare-fun b!356101 () Bool)

(declare-fun res!197550 () Bool)

(assert (=> b!356101 (=> (not res!197550) (not e!218213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19553 (_ BitVec 32)) Bool)

(assert (=> b!356101 (= res!197550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35536 res!197549) b!356096))

(assert (= (and b!356096 res!197551) b!356101))

(assert (= (and b!356101 res!197550) b!356097))

(assert (= (and b!356098 condMapEmpty!13491) mapIsEmpty!13491))

(assert (= (and b!356098 (not condMapEmpty!13491)) mapNonEmpty!13491))

(get-info :version)

(assert (= (and mapNonEmpty!13491 ((_ is ValueCellFull!3651) mapValue!13491)) b!356099))

(assert (= (and b!356098 ((_ is ValueCellFull!3651) mapDefault!13491)) b!356100))

(assert (= start!35536 b!356098))

(declare-fun m!354613 () Bool)

(assert (=> mapNonEmpty!13491 m!354613))

(declare-fun m!354615 () Bool)

(assert (=> b!356097 m!354615))

(declare-fun m!354617 () Bool)

(assert (=> start!35536 m!354617))

(declare-fun m!354619 () Bool)

(assert (=> start!35536 m!354619))

(declare-fun m!354621 () Bool)

(assert (=> start!35536 m!354621))

(declare-fun m!354623 () Bool)

(assert (=> b!356101 m!354623))

(check-sat (not mapNonEmpty!13491) (not start!35536) tp_is_empty!7989 (not b!356097) (not b!356101))
(check-sat)
