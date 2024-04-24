; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83484 () Bool)

(assert start!83484)

(declare-fun b_free!19309 () Bool)

(declare-fun b_next!19309 () Bool)

(assert (=> start!83484 (= b_free!19309 (not b_next!19309))))

(declare-fun tp!67207 () Bool)

(declare-fun b_and!30849 () Bool)

(assert (=> start!83484 (= tp!67207 b_and!30849)))

(declare-fun mapNonEmpty!35320 () Bool)

(declare-fun mapRes!35320 () Bool)

(declare-fun tp!67206 () Bool)

(declare-fun e!548766 () Bool)

(assert (=> mapNonEmpty!35320 (= mapRes!35320 (and tp!67206 e!548766))))

(declare-datatypes ((V!34593 0))(
  ( (V!34594 (val!11154 Int)) )
))
(declare-datatypes ((ValueCell!10622 0))(
  ( (ValueCellFull!10622 (v!13710 V!34593)) (EmptyCell!10622) )
))
(declare-fun mapRest!35320 () (Array (_ BitVec 32) ValueCell!10622))

(declare-datatypes ((array!60486 0))(
  ( (array!60487 (arr!29102 (Array (_ BitVec 32) ValueCell!10622)) (size!29582 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60486)

(declare-fun mapKey!35320 () (_ BitVec 32))

(declare-fun mapValue!35320 () ValueCell!10622)

(assert (=> mapNonEmpty!35320 (= (arr!29102 _values!1425) (store mapRest!35320 mapKey!35320 mapValue!35320))))

(declare-fun res!651329 () Bool)

(declare-fun e!548767 () Bool)

(assert (=> start!83484 (=> (not res!651329) (not e!548767))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83484 (= res!651329 (validMask!0 mask!2147))))

(assert (=> start!83484 e!548767))

(assert (=> start!83484 true))

(declare-fun e!548765 () Bool)

(declare-fun array_inv!22571 (array!60486) Bool)

(assert (=> start!83484 (and (array_inv!22571 _values!1425) e!548765)))

(declare-fun tp_is_empty!22207 () Bool)

(assert (=> start!83484 tp_is_empty!22207))

(assert (=> start!83484 tp!67207))

(declare-datatypes ((array!60488 0))(
  ( (array!60489 (arr!29103 (Array (_ BitVec 32) (_ BitVec 64))) (size!29583 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60488)

(declare-fun array_inv!22572 (array!60488) Bool)

(assert (=> start!83484 (array_inv!22572 _keys!1717)))

(declare-fun b!973449 () Bool)

(declare-fun e!548763 () Bool)

(assert (=> b!973449 (= e!548763 tp_is_empty!22207)))

(declare-fun b!973450 () Bool)

(declare-fun e!548762 () Bool)

(assert (=> b!973450 (= e!548762 (not true))))

(declare-fun lt!432426 () (_ BitVec 64))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34593)

(declare-datatypes ((tuple2!14316 0))(
  ( (tuple2!14317 (_1!7169 (_ BitVec 64)) (_2!7169 V!34593)) )
))
(declare-datatypes ((List!20164 0))(
  ( (Nil!20161) (Cons!20160 (h!21328 tuple2!14316) (t!28563 List!20164)) )
))
(declare-datatypes ((ListLongMap!13015 0))(
  ( (ListLongMap!13016 (toList!6523 List!20164)) )
))
(declare-fun lt!432425 () ListLongMap!13015)

(declare-fun minValue!1367 () V!34593)

(declare-fun +!2900 (ListLongMap!13015 tuple2!14316) ListLongMap!13015)

(declare-fun getCurrentListMap!3756 (array!60488 array!60486 (_ BitVec 32) (_ BitVec 32) V!34593 V!34593 (_ BitVec 32) Int) ListLongMap!13015)

(declare-fun get!15095 (ValueCell!10622 V!34593) V!34593)

(declare-fun dynLambda!1697 (Int (_ BitVec 64)) V!34593)

(assert (=> b!973450 (= lt!432425 (+!2900 (getCurrentListMap!3756 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14317 lt!432426 (get!15095 (select (arr!29102 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1697 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32364 0))(
  ( (Unit!32365) )
))
(declare-fun lt!432424 () Unit!32364)

(declare-fun lemmaListMapRecursiveValidKeyArray!256 (array!60488 array!60486 (_ BitVec 32) (_ BitVec 32) V!34593 V!34593 (_ BitVec 32) Int) Unit!32364)

(assert (=> b!973450 (= lt!432424 (lemmaListMapRecursiveValidKeyArray!256 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973451 () Bool)

(declare-fun res!651327 () Bool)

(assert (=> b!973451 (=> (not res!651327) (not e!548767))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5634 (ListLongMap!13015 (_ BitVec 64)) Bool)

(assert (=> b!973451 (= res!651327 (contains!5634 (getCurrentListMap!3756 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29103 _keys!1717) i!822)))))

(declare-fun b!973452 () Bool)

(declare-fun res!651332 () Bool)

(assert (=> b!973452 (=> (not res!651332) (not e!548767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60488 (_ BitVec 32)) Bool)

(assert (=> b!973452 (= res!651332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35320 () Bool)

(assert (=> mapIsEmpty!35320 mapRes!35320))

(declare-fun b!973453 () Bool)

(declare-fun res!651328 () Bool)

(assert (=> b!973453 (=> (not res!651328) (not e!548767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973453 (= res!651328 (validKeyInArray!0 (select (arr!29103 _keys!1717) i!822)))))

(declare-fun b!973454 () Bool)

(declare-fun res!651325 () Bool)

(assert (=> b!973454 (=> (not res!651325) (not e!548767))))

(assert (=> b!973454 (= res!651325 (and (= (size!29582 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29583 _keys!1717) (size!29582 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973455 () Bool)

(assert (=> b!973455 (= e!548767 e!548762)))

(declare-fun res!651326 () Bool)

(assert (=> b!973455 (=> (not res!651326) (not e!548762))))

(assert (=> b!973455 (= res!651326 (validKeyInArray!0 lt!432426))))

(assert (=> b!973455 (= lt!432426 (select (arr!29103 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973455 (= lt!432425 (getCurrentListMap!3756 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973456 () Bool)

(assert (=> b!973456 (= e!548765 (and e!548763 mapRes!35320))))

(declare-fun condMapEmpty!35320 () Bool)

(declare-fun mapDefault!35320 () ValueCell!10622)

(assert (=> b!973456 (= condMapEmpty!35320 (= (arr!29102 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10622)) mapDefault!35320)))))

(declare-fun b!973457 () Bool)

(assert (=> b!973457 (= e!548766 tp_is_empty!22207)))

(declare-fun b!973458 () Bool)

(declare-fun res!651330 () Bool)

(assert (=> b!973458 (=> (not res!651330) (not e!548767))))

(assert (=> b!973458 (= res!651330 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29583 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29583 _keys!1717))))))

(declare-fun b!973459 () Bool)

(declare-fun res!651331 () Bool)

(assert (=> b!973459 (=> (not res!651331) (not e!548767))))

(declare-datatypes ((List!20165 0))(
  ( (Nil!20162) (Cons!20161 (h!21329 (_ BitVec 64)) (t!28564 List!20165)) )
))
(declare-fun arrayNoDuplicates!0 (array!60488 (_ BitVec 32) List!20165) Bool)

(assert (=> b!973459 (= res!651331 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20162))))

(assert (= (and start!83484 res!651329) b!973454))

(assert (= (and b!973454 res!651325) b!973452))

(assert (= (and b!973452 res!651332) b!973459))

(assert (= (and b!973459 res!651331) b!973458))

(assert (= (and b!973458 res!651330) b!973453))

(assert (= (and b!973453 res!651328) b!973451))

(assert (= (and b!973451 res!651327) b!973455))

(assert (= (and b!973455 res!651326) b!973450))

(assert (= (and b!973456 condMapEmpty!35320) mapIsEmpty!35320))

(assert (= (and b!973456 (not condMapEmpty!35320)) mapNonEmpty!35320))

(get-info :version)

(assert (= (and mapNonEmpty!35320 ((_ is ValueCellFull!10622) mapValue!35320)) b!973457))

(assert (= (and b!973456 ((_ is ValueCellFull!10622) mapDefault!35320)) b!973449))

(assert (= start!83484 b!973456))

(declare-fun b_lambda!14487 () Bool)

(assert (=> (not b_lambda!14487) (not b!973450)))

(declare-fun t!28562 () Bool)

(declare-fun tb!6249 () Bool)

(assert (=> (and start!83484 (= defaultEntry!1428 defaultEntry!1428) t!28562) tb!6249))

(declare-fun result!12483 () Bool)

(assert (=> tb!6249 (= result!12483 tp_is_empty!22207)))

(assert (=> b!973450 t!28562))

(declare-fun b_and!30851 () Bool)

(assert (= b_and!30849 (and (=> t!28562 result!12483) b_and!30851)))

(declare-fun m!901259 () Bool)

(assert (=> mapNonEmpty!35320 m!901259))

(declare-fun m!901261 () Bool)

(assert (=> start!83484 m!901261))

(declare-fun m!901263 () Bool)

(assert (=> start!83484 m!901263))

(declare-fun m!901265 () Bool)

(assert (=> start!83484 m!901265))

(declare-fun m!901267 () Bool)

(assert (=> b!973452 m!901267))

(declare-fun m!901269 () Bool)

(assert (=> b!973455 m!901269))

(declare-fun m!901271 () Bool)

(assert (=> b!973455 m!901271))

(declare-fun m!901273 () Bool)

(assert (=> b!973455 m!901273))

(declare-fun m!901275 () Bool)

(assert (=> b!973459 m!901275))

(declare-fun m!901277 () Bool)

(assert (=> b!973453 m!901277))

(assert (=> b!973453 m!901277))

(declare-fun m!901279 () Bool)

(assert (=> b!973453 m!901279))

(declare-fun m!901281 () Bool)

(assert (=> b!973451 m!901281))

(assert (=> b!973451 m!901277))

(assert (=> b!973451 m!901281))

(assert (=> b!973451 m!901277))

(declare-fun m!901283 () Bool)

(assert (=> b!973451 m!901283))

(declare-fun m!901285 () Bool)

(assert (=> b!973450 m!901285))

(declare-fun m!901287 () Bool)

(assert (=> b!973450 m!901287))

(declare-fun m!901289 () Bool)

(assert (=> b!973450 m!901289))

(assert (=> b!973450 m!901287))

(declare-fun m!901291 () Bool)

(assert (=> b!973450 m!901291))

(assert (=> b!973450 m!901285))

(assert (=> b!973450 m!901291))

(declare-fun m!901293 () Bool)

(assert (=> b!973450 m!901293))

(declare-fun m!901295 () Bool)

(assert (=> b!973450 m!901295))

(check-sat (not b_next!19309) b_and!30851 (not b!973451) tp_is_empty!22207 (not b!973450) (not mapNonEmpty!35320) (not start!83484) (not b!973453) (not b!973455) (not b!973452) (not b_lambda!14487) (not b!973459))
(check-sat b_and!30851 (not b_next!19309))
