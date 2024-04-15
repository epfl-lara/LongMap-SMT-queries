; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83250 () Bool)

(assert start!83250)

(declare-fun b_free!19261 () Bool)

(declare-fun b_next!19261 () Bool)

(assert (=> start!83250 (= b_free!19261 (not b_next!19261))))

(declare-fun tp!67062 () Bool)

(declare-fun b_and!30723 () Bool)

(assert (=> start!83250 (= tp!67062 b_and!30723)))

(declare-fun b!971480 () Bool)

(declare-fun res!650302 () Bool)

(declare-fun e!547611 () Bool)

(assert (=> b!971480 (=> (not res!650302) (not e!547611))))

(declare-datatypes ((array!60300 0))(
  ( (array!60301 (arr!29014 (Array (_ BitVec 32) (_ BitVec 64))) (size!29495 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60300)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60300 (_ BitVec 32)) Bool)

(assert (=> b!971480 (= res!650302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!650303 () Bool)

(assert (=> start!83250 (=> (not res!650303) (not e!547611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83250 (= res!650303 (validMask!0 mask!2147))))

(assert (=> start!83250 e!547611))

(assert (=> start!83250 true))

(declare-datatypes ((V!34529 0))(
  ( (V!34530 (val!11130 Int)) )
))
(declare-datatypes ((ValueCell!10598 0))(
  ( (ValueCellFull!10598 (v!13688 V!34529)) (EmptyCell!10598) )
))
(declare-datatypes ((array!60302 0))(
  ( (array!60303 (arr!29015 (Array (_ BitVec 32) ValueCell!10598)) (size!29496 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60302)

(declare-fun e!547607 () Bool)

(declare-fun array_inv!22513 (array!60302) Bool)

(assert (=> start!83250 (and (array_inv!22513 _values!1425) e!547607)))

(declare-fun tp_is_empty!22159 () Bool)

(assert (=> start!83250 tp_is_empty!22159))

(assert (=> start!83250 tp!67062))

(declare-fun array_inv!22514 (array!60300) Bool)

(assert (=> start!83250 (array_inv!22514 _keys!1717)))

(declare-fun b!971481 () Bool)

(declare-fun e!547610 () Bool)

(assert (=> b!971481 (= e!547610 tp_is_empty!22159)))

(declare-fun b!971482 () Bool)

(declare-fun res!650304 () Bool)

(assert (=> b!971482 (=> (not res!650304) (not e!547611))))

(declare-datatypes ((List!20169 0))(
  ( (Nil!20166) (Cons!20165 (h!21327 (_ BitVec 64)) (t!28523 List!20169)) )
))
(declare-fun arrayNoDuplicates!0 (array!60300 (_ BitVec 32) List!20169) Bool)

(assert (=> b!971482 (= res!650304 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20166))))

(declare-fun mapNonEmpty!35248 () Bool)

(declare-fun mapRes!35248 () Bool)

(declare-fun tp!67063 () Bool)

(declare-fun e!547609 () Bool)

(assert (=> mapNonEmpty!35248 (= mapRes!35248 (and tp!67063 e!547609))))

(declare-fun mapKey!35248 () (_ BitVec 32))

(declare-fun mapRest!35248 () (Array (_ BitVec 32) ValueCell!10598))

(declare-fun mapValue!35248 () ValueCell!10598)

(assert (=> mapNonEmpty!35248 (= (arr!29015 _values!1425) (store mapRest!35248 mapKey!35248 mapValue!35248))))

(declare-fun b!971483 () Bool)

(declare-fun res!650305 () Bool)

(assert (=> b!971483 (=> (not res!650305) (not e!547611))))

(declare-fun zeroValue!1367 () V!34529)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34529)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(declare-datatypes ((tuple2!14354 0))(
  ( (tuple2!14355 (_1!7188 (_ BitVec 64)) (_2!7188 V!34529)) )
))
(declare-datatypes ((List!20170 0))(
  ( (Nil!20167) (Cons!20166 (h!21328 tuple2!14354) (t!28524 List!20170)) )
))
(declare-datatypes ((ListLongMap!13041 0))(
  ( (ListLongMap!13042 (toList!6536 List!20170)) )
))
(declare-fun contains!5579 (ListLongMap!13041 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3698 (array!60300 array!60302 (_ BitVec 32) (_ BitVec 32) V!34529 V!34529 (_ BitVec 32) Int) ListLongMap!13041)

(assert (=> b!971483 (= res!650305 (contains!5579 (getCurrentListMap!3698 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29014 _keys!1717) i!822)))))

(declare-fun b!971484 () Bool)

(declare-fun res!650308 () Bool)

(assert (=> b!971484 (=> (not res!650308) (not e!547611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971484 (= res!650308 (validKeyInArray!0 (select (arr!29014 _keys!1717) i!822)))))

(declare-fun b!971485 () Bool)

(declare-fun res!650306 () Bool)

(assert (=> b!971485 (=> (not res!650306) (not e!547611))))

(assert (=> b!971485 (= res!650306 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29495 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29495 _keys!1717))))))

(declare-fun b!971486 () Bool)

(assert (=> b!971486 (= e!547611 false)))

(declare-fun lt!431625 () ListLongMap!13041)

(assert (=> b!971486 (= lt!431625 (getCurrentListMap!3698 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971487 () Bool)

(declare-fun res!650307 () Bool)

(assert (=> b!971487 (=> (not res!650307) (not e!547611))))

(assert (=> b!971487 (= res!650307 (and (= (size!29496 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29495 _keys!1717) (size!29496 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35248 () Bool)

(assert (=> mapIsEmpty!35248 mapRes!35248))

(declare-fun b!971488 () Bool)

(assert (=> b!971488 (= e!547607 (and e!547610 mapRes!35248))))

(declare-fun condMapEmpty!35248 () Bool)

(declare-fun mapDefault!35248 () ValueCell!10598)

(assert (=> b!971488 (= condMapEmpty!35248 (= (arr!29015 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10598)) mapDefault!35248)))))

(declare-fun b!971489 () Bool)

(assert (=> b!971489 (= e!547609 tp_is_empty!22159)))

(assert (= (and start!83250 res!650303) b!971487))

(assert (= (and b!971487 res!650307) b!971480))

(assert (= (and b!971480 res!650302) b!971482))

(assert (= (and b!971482 res!650304) b!971485))

(assert (= (and b!971485 res!650306) b!971484))

(assert (= (and b!971484 res!650308) b!971483))

(assert (= (and b!971483 res!650305) b!971486))

(assert (= (and b!971488 condMapEmpty!35248) mapIsEmpty!35248))

(assert (= (and b!971488 (not condMapEmpty!35248)) mapNonEmpty!35248))

(get-info :version)

(assert (= (and mapNonEmpty!35248 ((_ is ValueCellFull!10598) mapValue!35248)) b!971489))

(assert (= (and b!971488 ((_ is ValueCellFull!10598) mapDefault!35248)) b!971481))

(assert (= start!83250 b!971488))

(declare-fun m!898343 () Bool)

(assert (=> b!971486 m!898343))

(declare-fun m!898345 () Bool)

(assert (=> start!83250 m!898345))

(declare-fun m!898347 () Bool)

(assert (=> start!83250 m!898347))

(declare-fun m!898349 () Bool)

(assert (=> start!83250 m!898349))

(declare-fun m!898351 () Bool)

(assert (=> mapNonEmpty!35248 m!898351))

(declare-fun m!898353 () Bool)

(assert (=> b!971484 m!898353))

(assert (=> b!971484 m!898353))

(declare-fun m!898355 () Bool)

(assert (=> b!971484 m!898355))

(declare-fun m!898357 () Bool)

(assert (=> b!971480 m!898357))

(declare-fun m!898359 () Bool)

(assert (=> b!971483 m!898359))

(assert (=> b!971483 m!898353))

(assert (=> b!971483 m!898359))

(assert (=> b!971483 m!898353))

(declare-fun m!898361 () Bool)

(assert (=> b!971483 m!898361))

(declare-fun m!898363 () Bool)

(assert (=> b!971482 m!898363))

(check-sat (not mapNonEmpty!35248) (not start!83250) (not b_next!19261) (not b!971480) b_and!30723 (not b!971484) (not b!971482) (not b!971486) (not b!971483) tp_is_empty!22159)
(check-sat b_and!30723 (not b_next!19261))
