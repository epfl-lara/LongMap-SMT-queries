; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35664 () Bool)

(assert start!35664)

(declare-fun b!358338 () Bool)

(declare-fun e!219325 () Bool)

(declare-fun tp_is_empty!8131 () Bool)

(assert (=> b!358338 (= e!219325 tp_is_empty!8131)))

(declare-fun mapNonEmpty!13704 () Bool)

(declare-fun mapRes!13704 () Bool)

(declare-fun tp!27762 () Bool)

(declare-fun e!219327 () Bool)

(assert (=> mapNonEmpty!13704 (= mapRes!13704 (and tp!27762 e!219327))))

(declare-datatypes ((V!11819 0))(
  ( (V!11820 (val!4110 Int)) )
))
(declare-datatypes ((ValueCell!3722 0))(
  ( (ValueCellFull!3722 (v!6305 V!11819)) (EmptyCell!3722) )
))
(declare-fun mapRest!13704 () (Array (_ BitVec 32) ValueCell!3722))

(declare-datatypes ((array!19810 0))(
  ( (array!19811 (arr!9398 (Array (_ BitVec 32) ValueCell!3722)) (size!9750 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19810)

(declare-fun mapValue!13704 () ValueCell!3722)

(declare-fun mapKey!13704 () (_ BitVec 32))

(assert (=> mapNonEmpty!13704 (= (arr!9398 _values!1208) (store mapRest!13704 mapKey!13704 mapValue!13704))))

(declare-fun b!358339 () Bool)

(declare-fun e!219326 () Bool)

(assert (=> b!358339 (= e!219326 (and e!219325 mapRes!13704))))

(declare-fun condMapEmpty!13704 () Bool)

(declare-fun mapDefault!13704 () ValueCell!3722)

(assert (=> b!358339 (= condMapEmpty!13704 (= (arr!9398 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3722)) mapDefault!13704)))))

(declare-fun b!358340 () Bool)

(assert (=> b!358340 (= e!219327 tp_is_empty!8131)))

(declare-fun b!358341 () Bool)

(declare-fun res!199202 () Bool)

(declare-fun e!219328 () Bool)

(assert (=> b!358341 (=> (not res!199202) (not e!219328))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19812 0))(
  ( (array!19813 (arr!9399 (Array (_ BitVec 32) (_ BitVec 64))) (size!9751 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19812)

(assert (=> b!358341 (= res!199202 (and (= (size!9750 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9751 _keys!1456) (size!9750 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358342 () Bool)

(declare-fun res!199203 () Bool)

(assert (=> b!358342 (=> (not res!199203) (not e!219328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19812 (_ BitVec 32)) Bool)

(assert (=> b!358342 (= res!199203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358343 () Bool)

(assert (=> b!358343 (= e!219328 false)))

(declare-fun lt!166202 () Bool)

(declare-datatypes ((List!5339 0))(
  ( (Nil!5336) (Cons!5335 (h!6191 (_ BitVec 64)) (t!10481 List!5339)) )
))
(declare-fun arrayNoDuplicates!0 (array!19812 (_ BitVec 32) List!5339) Bool)

(assert (=> b!358343 (= lt!166202 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5336))))

(declare-fun mapIsEmpty!13704 () Bool)

(assert (=> mapIsEmpty!13704 mapRes!13704))

(declare-fun res!199204 () Bool)

(assert (=> start!35664 (=> (not res!199204) (not e!219328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35664 (= res!199204 (validMask!0 mask!1842))))

(assert (=> start!35664 e!219328))

(assert (=> start!35664 true))

(declare-fun array_inv!6946 (array!19810) Bool)

(assert (=> start!35664 (and (array_inv!6946 _values!1208) e!219326)))

(declare-fun array_inv!6947 (array!19812) Bool)

(assert (=> start!35664 (array_inv!6947 _keys!1456)))

(assert (= (and start!35664 res!199204) b!358341))

(assert (= (and b!358341 res!199202) b!358342))

(assert (= (and b!358342 res!199203) b!358343))

(assert (= (and b!358339 condMapEmpty!13704) mapIsEmpty!13704))

(assert (= (and b!358339 (not condMapEmpty!13704)) mapNonEmpty!13704))

(get-info :version)

(assert (= (and mapNonEmpty!13704 ((_ is ValueCellFull!3722) mapValue!13704)) b!358340))

(assert (= (and b!358339 ((_ is ValueCellFull!3722) mapDefault!13704)) b!358338))

(assert (= start!35664 b!358339))

(declare-fun m!356463 () Bool)

(assert (=> mapNonEmpty!13704 m!356463))

(declare-fun m!356465 () Bool)

(assert (=> b!358342 m!356465))

(declare-fun m!356467 () Bool)

(assert (=> b!358343 m!356467))

(declare-fun m!356469 () Bool)

(assert (=> start!35664 m!356469))

(declare-fun m!356471 () Bool)

(assert (=> start!35664 m!356471))

(declare-fun m!356473 () Bool)

(assert (=> start!35664 m!356473))

(check-sat (not mapNonEmpty!13704) (not start!35664) tp_is_empty!8131 (not b!358343) (not b!358342))
(check-sat)
