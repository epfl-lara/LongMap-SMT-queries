; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83436 () Bool)

(assert start!83436)

(declare-fun b_free!19261 () Bool)

(declare-fun b_next!19261 () Bool)

(assert (=> start!83436 (= b_free!19261 (not b_next!19261))))

(declare-fun tp!67062 () Bool)

(declare-fun b_and!30759 () Bool)

(assert (=> start!83436 (= tp!67062 b_and!30759)))

(declare-fun b!972622 () Bool)

(declare-fun e!548337 () Bool)

(declare-fun tp_is_empty!22159 () Bool)

(assert (=> b!972622 (= e!548337 tp_is_empty!22159)))

(declare-fun b!972623 () Bool)

(declare-fun e!548339 () Bool)

(assert (=> b!972623 (= e!548339 tp_is_empty!22159)))

(declare-fun b!972624 () Bool)

(declare-fun res!650756 () Bool)

(declare-fun e!548338 () Bool)

(assert (=> b!972624 (=> (not res!650756) (not e!548338))))

(declare-datatypes ((array!60390 0))(
  ( (array!60391 (arr!29054 (Array (_ BitVec 32) (_ BitVec 64))) (size!29534 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60390)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972624 (= res!650756 (validKeyInArray!0 (select (arr!29054 _keys!1717) i!822)))))

(declare-fun b!972625 () Bool)

(declare-fun e!548341 () Bool)

(declare-fun mapRes!35248 () Bool)

(assert (=> b!972625 (= e!548341 (and e!548339 mapRes!35248))))

(declare-fun condMapEmpty!35248 () Bool)

(declare-datatypes ((V!34529 0))(
  ( (V!34530 (val!11130 Int)) )
))
(declare-datatypes ((ValueCell!10598 0))(
  ( (ValueCellFull!10598 (v!13686 V!34529)) (EmptyCell!10598) )
))
(declare-datatypes ((array!60392 0))(
  ( (array!60393 (arr!29055 (Array (_ BitVec 32) ValueCell!10598)) (size!29535 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60392)

(declare-fun mapDefault!35248 () ValueCell!10598)

(assert (=> b!972625 (= condMapEmpty!35248 (= (arr!29055 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10598)) mapDefault!35248)))))

(declare-fun mapNonEmpty!35248 () Bool)

(declare-fun tp!67063 () Bool)

(assert (=> mapNonEmpty!35248 (= mapRes!35248 (and tp!67063 e!548337))))

(declare-fun mapRest!35248 () (Array (_ BitVec 32) ValueCell!10598))

(declare-fun mapKey!35248 () (_ BitVec 32))

(declare-fun mapValue!35248 () ValueCell!10598)

(assert (=> mapNonEmpty!35248 (= (arr!29055 _values!1425) (store mapRest!35248 mapKey!35248 mapValue!35248))))

(declare-fun res!650761 () Bool)

(assert (=> start!83436 (=> (not res!650761) (not e!548338))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83436 (= res!650761 (validMask!0 mask!2147))))

(assert (=> start!83436 e!548338))

(assert (=> start!83436 true))

(declare-fun array_inv!22531 (array!60392) Bool)

(assert (=> start!83436 (and (array_inv!22531 _values!1425) e!548341)))

(assert (=> start!83436 tp_is_empty!22159))

(assert (=> start!83436 tp!67062))

(declare-fun array_inv!22532 (array!60390) Bool)

(assert (=> start!83436 (array_inv!22532 _keys!1717)))

(declare-fun b!972626 () Bool)

(assert (=> b!972626 (= e!548338 false)))

(declare-fun zeroValue!1367 () V!34529)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34529)

(declare-datatypes ((tuple2!14272 0))(
  ( (tuple2!14273 (_1!7147 (_ BitVec 64)) (_2!7147 V!34529)) )
))
(declare-datatypes ((List!20124 0))(
  ( (Nil!20121) (Cons!20120 (h!21288 tuple2!14272) (t!28479 List!20124)) )
))
(declare-datatypes ((ListLongMap!12971 0))(
  ( (ListLongMap!12972 (toList!6501 List!20124)) )
))
(declare-fun lt!432222 () ListLongMap!12971)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3734 (array!60390 array!60392 (_ BitVec 32) (_ BitVec 32) V!34529 V!34529 (_ BitVec 32) Int) ListLongMap!12971)

(assert (=> b!972626 (= lt!432222 (getCurrentListMap!3734 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35248 () Bool)

(assert (=> mapIsEmpty!35248 mapRes!35248))

(declare-fun b!972627 () Bool)

(declare-fun res!650762 () Bool)

(assert (=> b!972627 (=> (not res!650762) (not e!548338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60390 (_ BitVec 32)) Bool)

(assert (=> b!972627 (= res!650762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972628 () Bool)

(declare-fun res!650758 () Bool)

(assert (=> b!972628 (=> (not res!650758) (not e!548338))))

(assert (=> b!972628 (= res!650758 (and (= (size!29535 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29534 _keys!1717) (size!29535 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972629 () Bool)

(declare-fun res!650757 () Bool)

(assert (=> b!972629 (=> (not res!650757) (not e!548338))))

(assert (=> b!972629 (= res!650757 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29534 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29534 _keys!1717))))))

(declare-fun b!972630 () Bool)

(declare-fun res!650759 () Bool)

(assert (=> b!972630 (=> (not res!650759) (not e!548338))))

(declare-datatypes ((List!20125 0))(
  ( (Nil!20122) (Cons!20121 (h!21289 (_ BitVec 64)) (t!28480 List!20125)) )
))
(declare-fun arrayNoDuplicates!0 (array!60390 (_ BitVec 32) List!20125) Bool)

(assert (=> b!972630 (= res!650759 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20122))))

(declare-fun b!972631 () Bool)

(declare-fun res!650760 () Bool)

(assert (=> b!972631 (=> (not res!650760) (not e!548338))))

(declare-fun contains!5614 (ListLongMap!12971 (_ BitVec 64)) Bool)

(assert (=> b!972631 (= res!650760 (contains!5614 (getCurrentListMap!3734 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29054 _keys!1717) i!822)))))

(assert (= (and start!83436 res!650761) b!972628))

(assert (= (and b!972628 res!650758) b!972627))

(assert (= (and b!972627 res!650762) b!972630))

(assert (= (and b!972630 res!650759) b!972629))

(assert (= (and b!972629 res!650757) b!972624))

(assert (= (and b!972624 res!650756) b!972631))

(assert (= (and b!972631 res!650760) b!972626))

(assert (= (and b!972625 condMapEmpty!35248) mapIsEmpty!35248))

(assert (= (and b!972625 (not condMapEmpty!35248)) mapNonEmpty!35248))

(get-info :version)

(assert (= (and mapNonEmpty!35248 ((_ is ValueCellFull!10598) mapValue!35248)) b!972622))

(assert (= (and b!972625 ((_ is ValueCellFull!10598) mapDefault!35248)) b!972623))

(assert (= start!83436 b!972625))

(declare-fun m!900395 () Bool)

(assert (=> b!972631 m!900395))

(declare-fun m!900397 () Bool)

(assert (=> b!972631 m!900397))

(assert (=> b!972631 m!900395))

(assert (=> b!972631 m!900397))

(declare-fun m!900399 () Bool)

(assert (=> b!972631 m!900399))

(declare-fun m!900401 () Bool)

(assert (=> b!972630 m!900401))

(declare-fun m!900403 () Bool)

(assert (=> mapNonEmpty!35248 m!900403))

(declare-fun m!900405 () Bool)

(assert (=> b!972627 m!900405))

(declare-fun m!900407 () Bool)

(assert (=> b!972626 m!900407))

(declare-fun m!900409 () Bool)

(assert (=> start!83436 m!900409))

(declare-fun m!900411 () Bool)

(assert (=> start!83436 m!900411))

(declare-fun m!900413 () Bool)

(assert (=> start!83436 m!900413))

(assert (=> b!972624 m!900397))

(assert (=> b!972624 m!900397))

(declare-fun m!900415 () Bool)

(assert (=> b!972624 m!900415))

(check-sat tp_is_empty!22159 (not b!972626) (not b!972631) (not b!972627) (not b!972624) (not start!83436) b_and!30759 (not b_next!19261) (not b!972630) (not mapNonEmpty!35248))
(check-sat b_and!30759 (not b_next!19261))
