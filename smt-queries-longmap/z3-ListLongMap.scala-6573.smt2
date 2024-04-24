; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83490 () Bool)

(assert start!83490)

(declare-fun b_free!19315 () Bool)

(declare-fun b_next!19315 () Bool)

(assert (=> start!83490 (= b_free!19315 (not b_next!19315))))

(declare-fun tp!67224 () Bool)

(declare-fun b_and!30861 () Bool)

(assert (=> start!83490 (= tp!67224 b_and!30861)))

(declare-fun mapIsEmpty!35329 () Bool)

(declare-fun mapRes!35329 () Bool)

(assert (=> mapIsEmpty!35329 mapRes!35329))

(declare-fun b!973554 () Bool)

(declare-fun res!651397 () Bool)

(declare-fun e!548818 () Bool)

(assert (=> b!973554 (=> (not res!651397) (not e!548818))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34601 0))(
  ( (V!34602 (val!11157 Int)) )
))
(declare-datatypes ((ValueCell!10625 0))(
  ( (ValueCellFull!10625 (v!13713 V!34601)) (EmptyCell!10625) )
))
(declare-datatypes ((array!60498 0))(
  ( (array!60499 (arr!29108 (Array (_ BitVec 32) ValueCell!10625)) (size!29588 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60498)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60500 0))(
  ( (array!60501 (arr!29109 (Array (_ BitVec 32) (_ BitVec 64))) (size!29589 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60500)

(assert (=> b!973554 (= res!651397 (and (= (size!29588 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29589 _keys!1717) (size!29588 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973555 () Bool)

(declare-fun e!548819 () Bool)

(declare-fun e!548820 () Bool)

(assert (=> b!973555 (= e!548819 (and e!548820 mapRes!35329))))

(declare-fun condMapEmpty!35329 () Bool)

(declare-fun mapDefault!35329 () ValueCell!10625)

(assert (=> b!973555 (= condMapEmpty!35329 (= (arr!29108 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10625)) mapDefault!35329)))))

(declare-fun b!973556 () Bool)

(declare-fun e!548817 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973556 (= e!548817 (not (and (bvsge from!2118 #b00000000000000000000000000000000) (bvsle from!2118 (size!29589 _keys!1717)))))))

(declare-fun zeroValue!1367 () V!34601)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34601)

(declare-fun lt!432451 () (_ BitVec 64))

(declare-datatypes ((tuple2!14320 0))(
  ( (tuple2!14321 (_1!7171 (_ BitVec 64)) (_2!7171 V!34601)) )
))
(declare-datatypes ((List!20169 0))(
  ( (Nil!20166) (Cons!20165 (h!21333 tuple2!14320) (t!28574 List!20169)) )
))
(declare-datatypes ((ListLongMap!13019 0))(
  ( (ListLongMap!13020 (toList!6525 List!20169)) )
))
(declare-fun lt!432452 () ListLongMap!13019)

(declare-fun +!2901 (ListLongMap!13019 tuple2!14320) ListLongMap!13019)

(declare-fun getCurrentListMap!3758 (array!60500 array!60498 (_ BitVec 32) (_ BitVec 32) V!34601 V!34601 (_ BitVec 32) Int) ListLongMap!13019)

(declare-fun get!15098 (ValueCell!10625 V!34601) V!34601)

(declare-fun dynLambda!1698 (Int (_ BitVec 64)) V!34601)

(assert (=> b!973556 (= lt!432452 (+!2901 (getCurrentListMap!3758 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14321 lt!432451 (get!15098 (select (arr!29108 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1698 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32366 0))(
  ( (Unit!32367) )
))
(declare-fun lt!432453 () Unit!32366)

(declare-fun lemmaListMapRecursiveValidKeyArray!257 (array!60500 array!60498 (_ BitVec 32) (_ BitVec 32) V!34601 V!34601 (_ BitVec 32) Int) Unit!32366)

(assert (=> b!973556 (= lt!432453 (lemmaListMapRecursiveValidKeyArray!257 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973557 () Bool)

(declare-fun res!651402 () Bool)

(assert (=> b!973557 (=> (not res!651402) (not e!548818))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973557 (= res!651402 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29589 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29589 _keys!1717))))))

(declare-fun b!973558 () Bool)

(declare-fun res!651399 () Bool)

(assert (=> b!973558 (=> (not res!651399) (not e!548818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60500 (_ BitVec 32)) Bool)

(assert (=> b!973558 (= res!651399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973559 () Bool)

(declare-fun res!651400 () Bool)

(assert (=> b!973559 (=> (not res!651400) (not e!548818))))

(declare-fun contains!5635 (ListLongMap!13019 (_ BitVec 64)) Bool)

(assert (=> b!973559 (= res!651400 (contains!5635 (getCurrentListMap!3758 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29109 _keys!1717) i!822)))))

(declare-fun res!651403 () Bool)

(assert (=> start!83490 (=> (not res!651403) (not e!548818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83490 (= res!651403 (validMask!0 mask!2147))))

(assert (=> start!83490 e!548818))

(assert (=> start!83490 true))

(declare-fun array_inv!22573 (array!60498) Bool)

(assert (=> start!83490 (and (array_inv!22573 _values!1425) e!548819)))

(declare-fun tp_is_empty!22213 () Bool)

(assert (=> start!83490 tp_is_empty!22213))

(assert (=> start!83490 tp!67224))

(declare-fun array_inv!22574 (array!60500) Bool)

(assert (=> start!83490 (array_inv!22574 _keys!1717)))

(declare-fun b!973560 () Bool)

(assert (=> b!973560 (= e!548820 tp_is_empty!22213)))

(declare-fun b!973561 () Bool)

(declare-fun res!651401 () Bool)

(assert (=> b!973561 (=> (not res!651401) (not e!548818))))

(declare-datatypes ((List!20170 0))(
  ( (Nil!20167) (Cons!20166 (h!21334 (_ BitVec 64)) (t!28575 List!20170)) )
))
(declare-fun arrayNoDuplicates!0 (array!60500 (_ BitVec 32) List!20170) Bool)

(assert (=> b!973561 (= res!651401 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20167))))

(declare-fun b!973562 () Bool)

(assert (=> b!973562 (= e!548818 e!548817)))

(declare-fun res!651398 () Bool)

(assert (=> b!973562 (=> (not res!651398) (not e!548817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973562 (= res!651398 (validKeyInArray!0 lt!432451))))

(assert (=> b!973562 (= lt!432451 (select (arr!29109 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973562 (= lt!432452 (getCurrentListMap!3758 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973563 () Bool)

(declare-fun e!548816 () Bool)

(assert (=> b!973563 (= e!548816 tp_is_empty!22213)))

(declare-fun b!973564 () Bool)

(declare-fun res!651404 () Bool)

(assert (=> b!973564 (=> (not res!651404) (not e!548818))))

(assert (=> b!973564 (= res!651404 (validKeyInArray!0 (select (arr!29109 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35329 () Bool)

(declare-fun tp!67225 () Bool)

(assert (=> mapNonEmpty!35329 (= mapRes!35329 (and tp!67225 e!548816))))

(declare-fun mapRest!35329 () (Array (_ BitVec 32) ValueCell!10625))

(declare-fun mapValue!35329 () ValueCell!10625)

(declare-fun mapKey!35329 () (_ BitVec 32))

(assert (=> mapNonEmpty!35329 (= (arr!29108 _values!1425) (store mapRest!35329 mapKey!35329 mapValue!35329))))

(assert (= (and start!83490 res!651403) b!973554))

(assert (= (and b!973554 res!651397) b!973558))

(assert (= (and b!973558 res!651399) b!973561))

(assert (= (and b!973561 res!651401) b!973557))

(assert (= (and b!973557 res!651402) b!973564))

(assert (= (and b!973564 res!651404) b!973559))

(assert (= (and b!973559 res!651400) b!973562))

(assert (= (and b!973562 res!651398) b!973556))

(assert (= (and b!973555 condMapEmpty!35329) mapIsEmpty!35329))

(assert (= (and b!973555 (not condMapEmpty!35329)) mapNonEmpty!35329))

(get-info :version)

(assert (= (and mapNonEmpty!35329 ((_ is ValueCellFull!10625) mapValue!35329)) b!973563))

(assert (= (and b!973555 ((_ is ValueCellFull!10625) mapDefault!35329)) b!973560))

(assert (= start!83490 b!973555))

(declare-fun b_lambda!14493 () Bool)

(assert (=> (not b_lambda!14493) (not b!973556)))

(declare-fun t!28573 () Bool)

(declare-fun tb!6255 () Bool)

(assert (=> (and start!83490 (= defaultEntry!1428 defaultEntry!1428) t!28573) tb!6255))

(declare-fun result!12495 () Bool)

(assert (=> tb!6255 (= result!12495 tp_is_empty!22213)))

(assert (=> b!973556 t!28573))

(declare-fun b_and!30863 () Bool)

(assert (= b_and!30861 (and (=> t!28573 result!12495) b_and!30863)))

(declare-fun m!901373 () Bool)

(assert (=> b!973561 m!901373))

(declare-fun m!901375 () Bool)

(assert (=> b!973562 m!901375))

(declare-fun m!901377 () Bool)

(assert (=> b!973562 m!901377))

(declare-fun m!901379 () Bool)

(assert (=> b!973562 m!901379))

(declare-fun m!901381 () Bool)

(assert (=> start!83490 m!901381))

(declare-fun m!901383 () Bool)

(assert (=> start!83490 m!901383))

(declare-fun m!901385 () Bool)

(assert (=> start!83490 m!901385))

(declare-fun m!901387 () Bool)

(assert (=> b!973559 m!901387))

(declare-fun m!901389 () Bool)

(assert (=> b!973559 m!901389))

(assert (=> b!973559 m!901387))

(assert (=> b!973559 m!901389))

(declare-fun m!901391 () Bool)

(assert (=> b!973559 m!901391))

(assert (=> b!973564 m!901389))

(assert (=> b!973564 m!901389))

(declare-fun m!901393 () Bool)

(assert (=> b!973564 m!901393))

(declare-fun m!901395 () Bool)

(assert (=> mapNonEmpty!35329 m!901395))

(declare-fun m!901397 () Bool)

(assert (=> b!973558 m!901397))

(declare-fun m!901399 () Bool)

(assert (=> b!973556 m!901399))

(declare-fun m!901401 () Bool)

(assert (=> b!973556 m!901401))

(declare-fun m!901403 () Bool)

(assert (=> b!973556 m!901403))

(assert (=> b!973556 m!901401))

(declare-fun m!901405 () Bool)

(assert (=> b!973556 m!901405))

(assert (=> b!973556 m!901399))

(assert (=> b!973556 m!901403))

(declare-fun m!901407 () Bool)

(assert (=> b!973556 m!901407))

(declare-fun m!901409 () Bool)

(assert (=> b!973556 m!901409))

(check-sat (not mapNonEmpty!35329) (not b!973556) (not b!973562) (not b!973558) (not b!973561) (not start!83490) (not b_lambda!14493) (not b!973564) tp_is_empty!22213 b_and!30863 (not b_next!19315) (not b!973559))
(check-sat b_and!30863 (not b_next!19315))
