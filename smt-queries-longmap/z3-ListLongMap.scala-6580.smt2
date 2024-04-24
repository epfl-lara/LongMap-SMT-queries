; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83532 () Bool)

(assert start!83532)

(declare-fun b_free!19357 () Bool)

(declare-fun b_next!19357 () Bool)

(assert (=> start!83532 (= b_free!19357 (not b_next!19357))))

(declare-fun tp!67350 () Bool)

(declare-fun b_and!30945 () Bool)

(assert (=> start!83532 (= tp!67350 b_and!30945)))

(declare-fun b!974289 () Bool)

(declare-fun e!549245 () Bool)

(declare-fun e!549247 () Bool)

(declare-fun mapRes!35392 () Bool)

(assert (=> b!974289 (= e!549245 (and e!549247 mapRes!35392))))

(declare-fun condMapEmpty!35392 () Bool)

(declare-datatypes ((V!34657 0))(
  ( (V!34658 (val!11178 Int)) )
))
(declare-datatypes ((ValueCell!10646 0))(
  ( (ValueCellFull!10646 (v!13734 V!34657)) (EmptyCell!10646) )
))
(declare-datatypes ((array!60582 0))(
  ( (array!60583 (arr!29150 (Array (_ BitVec 32) ValueCell!10646)) (size!29630 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60582)

(declare-fun mapDefault!35392 () ValueCell!10646)

(assert (=> b!974289 (= condMapEmpty!35392 (= (arr!29150 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10646)) mapDefault!35392)))))

(declare-fun b!974290 () Bool)

(declare-fun e!549244 () Bool)

(declare-fun e!549241 () Bool)

(assert (=> b!974290 (= e!549244 e!549241)))

(declare-fun res!651904 () Bool)

(assert (=> b!974290 (=> (not res!651904) (not e!549241))))

(declare-fun lt!432830 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974290 (= res!651904 (validKeyInArray!0 lt!432830))))

(declare-datatypes ((array!60584 0))(
  ( (array!60585 (arr!29151 (Array (_ BitVec 32) (_ BitVec 64))) (size!29631 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60584)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!974290 (= lt!432830 (select (arr!29151 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34657)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34657)

(declare-datatypes ((tuple2!14356 0))(
  ( (tuple2!14357 (_1!7189 (_ BitVec 64)) (_2!7189 V!34657)) )
))
(declare-datatypes ((List!20204 0))(
  ( (Nil!20201) (Cons!20200 (h!21368 tuple2!14356) (t!28651 List!20204)) )
))
(declare-datatypes ((ListLongMap!13055 0))(
  ( (ListLongMap!13056 (toList!6543 List!20204)) )
))
(declare-fun lt!432832 () ListLongMap!13055)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3776 (array!60584 array!60582 (_ BitVec 32) (_ BitVec 32) V!34657 V!34657 (_ BitVec 32) Int) ListLongMap!13055)

(assert (=> b!974290 (= lt!432832 (getCurrentListMap!3776 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974291 () Bool)

(declare-fun res!651907 () Bool)

(declare-fun e!549242 () Bool)

(assert (=> b!974291 (=> (not res!651907) (not e!549242))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974291 (= res!651907 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29631 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29631 _keys!1717))))))

(declare-fun b!974293 () Bool)

(assert (=> b!974293 (= e!549242 e!549244)))

(declare-fun res!651901 () Bool)

(assert (=> b!974293 (=> (not res!651901) (not e!549244))))

(declare-fun lt!432834 () ListLongMap!13055)

(declare-fun contains!5649 (ListLongMap!13055 (_ BitVec 64)) Bool)

(assert (=> b!974293 (= res!651901 (contains!5649 lt!432834 (select (arr!29151 _keys!1717) i!822)))))

(assert (=> b!974293 (= lt!432834 (getCurrentListMap!3776 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!974294 () Bool)

(declare-fun res!651906 () Bool)

(assert (=> b!974294 (=> (not res!651906) (not e!549242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60584 (_ BitVec 32)) Bool)

(assert (=> b!974294 (= res!651906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974295 () Bool)

(declare-fun tp_is_empty!22255 () Bool)

(assert (=> b!974295 (= e!549247 tp_is_empty!22255)))

(declare-fun b!974296 () Bool)

(declare-fun e!549243 () Bool)

(assert (=> b!974296 (= e!549243 tp_is_empty!22255)))

(declare-fun b!974297 () Bool)

(declare-fun res!651905 () Bool)

(assert (=> b!974297 (=> (not res!651905) (not e!549242))))

(assert (=> b!974297 (= res!651905 (and (= (size!29630 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29631 _keys!1717) (size!29630 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974298 () Bool)

(assert (=> b!974298 (= e!549241 (not true))))

(declare-fun lt!432829 () tuple2!14356)

(declare-fun +!2917 (ListLongMap!13055 tuple2!14356) ListLongMap!13055)

(assert (=> b!974298 (contains!5649 (+!2917 lt!432834 lt!432829) (select (arr!29151 _keys!1717) i!822))))

(declare-fun lt!432833 () V!34657)

(declare-datatypes ((Unit!32398 0))(
  ( (Unit!32399) )
))
(declare-fun lt!432831 () Unit!32398)

(declare-fun addStillContains!599 (ListLongMap!13055 (_ BitVec 64) V!34657 (_ BitVec 64)) Unit!32398)

(assert (=> b!974298 (= lt!432831 (addStillContains!599 lt!432834 lt!432830 lt!432833 (select (arr!29151 _keys!1717) i!822)))))

(assert (=> b!974298 (= lt!432832 (+!2917 (getCurrentListMap!3776 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432829))))

(assert (=> b!974298 (= lt!432829 (tuple2!14357 lt!432830 lt!432833))))

(declare-fun get!15128 (ValueCell!10646 V!34657) V!34657)

(declare-fun dynLambda!1714 (Int (_ BitVec 64)) V!34657)

(assert (=> b!974298 (= lt!432833 (get!15128 (select (arr!29150 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1714 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432828 () Unit!32398)

(declare-fun lemmaListMapRecursiveValidKeyArray!273 (array!60584 array!60582 (_ BitVec 32) (_ BitVec 32) V!34657 V!34657 (_ BitVec 32) Int) Unit!32398)

(assert (=> b!974298 (= lt!432828 (lemmaListMapRecursiveValidKeyArray!273 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974292 () Bool)

(declare-fun res!651902 () Bool)

(assert (=> b!974292 (=> (not res!651902) (not e!549242))))

(assert (=> b!974292 (= res!651902 (validKeyInArray!0 (select (arr!29151 _keys!1717) i!822)))))

(declare-fun res!651908 () Bool)

(assert (=> start!83532 (=> (not res!651908) (not e!549242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83532 (= res!651908 (validMask!0 mask!2147))))

(assert (=> start!83532 e!549242))

(assert (=> start!83532 true))

(declare-fun array_inv!22603 (array!60582) Bool)

(assert (=> start!83532 (and (array_inv!22603 _values!1425) e!549245)))

(assert (=> start!83532 tp_is_empty!22255))

(assert (=> start!83532 tp!67350))

(declare-fun array_inv!22604 (array!60584) Bool)

(assert (=> start!83532 (array_inv!22604 _keys!1717)))

(declare-fun b!974299 () Bool)

(declare-fun res!651903 () Bool)

(assert (=> b!974299 (=> (not res!651903) (not e!549242))))

(declare-datatypes ((List!20205 0))(
  ( (Nil!20202) (Cons!20201 (h!21369 (_ BitVec 64)) (t!28652 List!20205)) )
))
(declare-fun arrayNoDuplicates!0 (array!60584 (_ BitVec 32) List!20205) Bool)

(assert (=> b!974299 (= res!651903 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20202))))

(declare-fun mapIsEmpty!35392 () Bool)

(assert (=> mapIsEmpty!35392 mapRes!35392))

(declare-fun mapNonEmpty!35392 () Bool)

(declare-fun tp!67351 () Bool)

(assert (=> mapNonEmpty!35392 (= mapRes!35392 (and tp!67351 e!549243))))

(declare-fun mapRest!35392 () (Array (_ BitVec 32) ValueCell!10646))

(declare-fun mapValue!35392 () ValueCell!10646)

(declare-fun mapKey!35392 () (_ BitVec 32))

(assert (=> mapNonEmpty!35392 (= (arr!29150 _values!1425) (store mapRest!35392 mapKey!35392 mapValue!35392))))

(assert (= (and start!83532 res!651908) b!974297))

(assert (= (and b!974297 res!651905) b!974294))

(assert (= (and b!974294 res!651906) b!974299))

(assert (= (and b!974299 res!651903) b!974291))

(assert (= (and b!974291 res!651907) b!974292))

(assert (= (and b!974292 res!651902) b!974293))

(assert (= (and b!974293 res!651901) b!974290))

(assert (= (and b!974290 res!651904) b!974298))

(assert (= (and b!974289 condMapEmpty!35392) mapIsEmpty!35392))

(assert (= (and b!974289 (not condMapEmpty!35392)) mapNonEmpty!35392))

(get-info :version)

(assert (= (and mapNonEmpty!35392 ((_ is ValueCellFull!10646) mapValue!35392)) b!974296))

(assert (= (and b!974289 ((_ is ValueCellFull!10646) mapDefault!35392)) b!974295))

(assert (= start!83532 b!974289))

(declare-fun b_lambda!14535 () Bool)

(assert (=> (not b_lambda!14535) (not b!974298)))

(declare-fun t!28650 () Bool)

(declare-fun tb!6297 () Bool)

(assert (=> (and start!83532 (= defaultEntry!1428 defaultEntry!1428) t!28650) tb!6297))

(declare-fun result!12579 () Bool)

(assert (=> tb!6297 (= result!12579 tp_is_empty!22255)))

(assert (=> b!974298 t!28650))

(declare-fun b_and!30947 () Bool)

(assert (= b_and!30945 (and (=> t!28650 result!12579) b_and!30947)))

(declare-fun m!902261 () Bool)

(assert (=> b!974299 m!902261))

(declare-fun m!902263 () Bool)

(assert (=> b!974293 m!902263))

(assert (=> b!974293 m!902263))

(declare-fun m!902265 () Bool)

(assert (=> b!974293 m!902265))

(declare-fun m!902267 () Bool)

(assert (=> b!974293 m!902267))

(declare-fun m!902269 () Bool)

(assert (=> b!974290 m!902269))

(declare-fun m!902271 () Bool)

(assert (=> b!974290 m!902271))

(declare-fun m!902273 () Bool)

(assert (=> b!974290 m!902273))

(declare-fun m!902275 () Bool)

(assert (=> b!974294 m!902275))

(assert (=> b!974292 m!902263))

(assert (=> b!974292 m!902263))

(declare-fun m!902277 () Bool)

(assert (=> b!974292 m!902277))

(declare-fun m!902279 () Bool)

(assert (=> start!83532 m!902279))

(declare-fun m!902281 () Bool)

(assert (=> start!83532 m!902281))

(declare-fun m!902283 () Bool)

(assert (=> start!83532 m!902283))

(declare-fun m!902285 () Bool)

(assert (=> mapNonEmpty!35392 m!902285))

(declare-fun m!902287 () Bool)

(assert (=> b!974298 m!902287))

(declare-fun m!902289 () Bool)

(assert (=> b!974298 m!902289))

(declare-fun m!902291 () Bool)

(assert (=> b!974298 m!902291))

(assert (=> b!974298 m!902287))

(declare-fun m!902293 () Bool)

(assert (=> b!974298 m!902293))

(declare-fun m!902295 () Bool)

(assert (=> b!974298 m!902295))

(assert (=> b!974298 m!902291))

(assert (=> b!974298 m!902293))

(declare-fun m!902297 () Bool)

(assert (=> b!974298 m!902297))

(assert (=> b!974298 m!902295))

(assert (=> b!974298 m!902263))

(declare-fun m!902299 () Bool)

(assert (=> b!974298 m!902299))

(declare-fun m!902301 () Bool)

(assert (=> b!974298 m!902301))

(assert (=> b!974298 m!902263))

(declare-fun m!902303 () Bool)

(assert (=> b!974298 m!902303))

(assert (=> b!974298 m!902263))

(check-sat (not start!83532) (not b!974290) b_and!30947 tp_is_empty!22255 (not mapNonEmpty!35392) (not b!974298) (not b!974294) (not b!974293) (not b!974292) (not b!974299) (not b_lambda!14535) (not b_next!19357))
(check-sat b_and!30947 (not b_next!19357))
