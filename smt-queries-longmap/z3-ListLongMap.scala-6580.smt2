; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83346 () Bool)

(assert start!83346)

(declare-fun b_free!19357 () Bool)

(declare-fun b_next!19357 () Bool)

(assert (=> start!83346 (= b_free!19357 (not b_next!19357))))

(declare-fun tp!67351 () Bool)

(declare-fun b_and!30909 () Bool)

(assert (=> start!83346 (= tp!67351 b_and!30909)))

(declare-fun res!651452 () Bool)

(declare-fun e!548513 () Bool)

(assert (=> start!83346 (=> (not res!651452) (not e!548513))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83346 (= res!651452 (validMask!0 mask!2147))))

(assert (=> start!83346 e!548513))

(assert (=> start!83346 true))

(declare-datatypes ((V!34657 0))(
  ( (V!34658 (val!11178 Int)) )
))
(declare-datatypes ((ValueCell!10646 0))(
  ( (ValueCellFull!10646 (v!13736 V!34657)) (EmptyCell!10646) )
))
(declare-datatypes ((array!60480 0))(
  ( (array!60481 (arr!29104 (Array (_ BitVec 32) ValueCell!10646)) (size!29585 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60480)

(declare-fun e!548512 () Bool)

(declare-fun array_inv!22569 (array!60480) Bool)

(assert (=> start!83346 (and (array_inv!22569 _values!1425) e!548512)))

(declare-fun tp_is_empty!22255 () Bool)

(assert (=> start!83346 tp_is_empty!22255))

(assert (=> start!83346 tp!67351))

(declare-datatypes ((array!60482 0))(
  ( (array!60483 (arr!29105 (Array (_ BitVec 32) (_ BitVec 64))) (size!29586 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60482)

(declare-fun array_inv!22570 (array!60482) Bool)

(assert (=> start!83346 (array_inv!22570 _keys!1717)))

(declare-fun mapIsEmpty!35392 () Bool)

(declare-fun mapRes!35392 () Bool)

(assert (=> mapIsEmpty!35392 mapRes!35392))

(declare-fun b!973147 () Bool)

(declare-fun res!651447 () Bool)

(assert (=> b!973147 (=> (not res!651447) (not e!548513))))

(declare-datatypes ((List!20231 0))(
  ( (Nil!20228) (Cons!20227 (h!21389 (_ BitVec 64)) (t!28677 List!20231)) )
))
(declare-fun arrayNoDuplicates!0 (array!60482 (_ BitVec 32) List!20231) Bool)

(assert (=> b!973147 (= res!651447 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20228))))

(declare-fun b!973148 () Bool)

(declare-fun res!651449 () Bool)

(assert (=> b!973148 (=> (not res!651449) (not e!548513))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973148 (= res!651449 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29586 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29586 _keys!1717))))))

(declare-fun b!973149 () Bool)

(declare-fun e!548517 () Bool)

(declare-fun e!548511 () Bool)

(assert (=> b!973149 (= e!548517 e!548511)))

(declare-fun res!651448 () Bool)

(assert (=> b!973149 (=> (not res!651448) (not e!548511))))

(declare-fun lt!432231 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973149 (= res!651448 (validKeyInArray!0 lt!432231))))

(assert (=> b!973149 (= lt!432231 (select (arr!29105 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34657)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14422 0))(
  ( (tuple2!14423 (_1!7222 (_ BitVec 64)) (_2!7222 V!34657)) )
))
(declare-datatypes ((List!20232 0))(
  ( (Nil!20229) (Cons!20228 (h!21390 tuple2!14422) (t!28678 List!20232)) )
))
(declare-datatypes ((ListLongMap!13109 0))(
  ( (ListLongMap!13110 (toList!6570 List!20232)) )
))
(declare-fun lt!432236 () ListLongMap!13109)

(declare-fun zeroValue!1367 () V!34657)

(declare-fun getCurrentListMap!3732 (array!60482 array!60480 (_ BitVec 32) (_ BitVec 32) V!34657 V!34657 (_ BitVec 32) Int) ListLongMap!13109)

(assert (=> b!973149 (= lt!432236 (getCurrentListMap!3732 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973150 () Bool)

(declare-fun e!548514 () Bool)

(assert (=> b!973150 (= e!548514 tp_is_empty!22255)))

(declare-fun b!973151 () Bool)

(assert (=> b!973151 (= e!548512 (and e!548514 mapRes!35392))))

(declare-fun condMapEmpty!35392 () Bool)

(declare-fun mapDefault!35392 () ValueCell!10646)

(assert (=> b!973151 (= condMapEmpty!35392 (= (arr!29104 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10646)) mapDefault!35392)))))

(declare-fun b!973152 () Bool)

(assert (=> b!973152 (= e!548511 (not true))))

(declare-fun lt!432234 () ListLongMap!13109)

(declare-fun lt!432233 () tuple2!14422)

(declare-fun contains!5611 (ListLongMap!13109 (_ BitVec 64)) Bool)

(declare-fun +!2923 (ListLongMap!13109 tuple2!14422) ListLongMap!13109)

(assert (=> b!973152 (contains!5611 (+!2923 lt!432234 lt!432233) (select (arr!29105 _keys!1717) i!822))))

(declare-fun lt!432235 () V!34657)

(declare-datatypes ((Unit!32298 0))(
  ( (Unit!32299) )
))
(declare-fun lt!432232 () Unit!32298)

(declare-fun addStillContains!593 (ListLongMap!13109 (_ BitVec 64) V!34657 (_ BitVec 64)) Unit!32298)

(assert (=> b!973152 (= lt!432232 (addStillContains!593 lt!432234 lt!432231 lt!432235 (select (arr!29105 _keys!1717) i!822)))))

(assert (=> b!973152 (= lt!432236 (+!2923 (getCurrentListMap!3732 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432233))))

(assert (=> b!973152 (= lt!432233 (tuple2!14423 lt!432231 lt!432235))))

(declare-fun get!15094 (ValueCell!10646 V!34657) V!34657)

(declare-fun dynLambda!1679 (Int (_ BitVec 64)) V!34657)

(assert (=> b!973152 (= lt!432235 (get!15094 (select (arr!29104 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1679 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432237 () Unit!32298)

(declare-fun lemmaListMapRecursiveValidKeyArray!263 (array!60482 array!60480 (_ BitVec 32) (_ BitVec 32) V!34657 V!34657 (_ BitVec 32) Int) Unit!32298)

(assert (=> b!973152 (= lt!432237 (lemmaListMapRecursiveValidKeyArray!263 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973153 () Bool)

(declare-fun res!651450 () Bool)

(assert (=> b!973153 (=> (not res!651450) (not e!548513))))

(assert (=> b!973153 (= res!651450 (validKeyInArray!0 (select (arr!29105 _keys!1717) i!822)))))

(declare-fun b!973154 () Bool)

(assert (=> b!973154 (= e!548513 e!548517)))

(declare-fun res!651451 () Bool)

(assert (=> b!973154 (=> (not res!651451) (not e!548517))))

(assert (=> b!973154 (= res!651451 (contains!5611 lt!432234 (select (arr!29105 _keys!1717) i!822)))))

(assert (=> b!973154 (= lt!432234 (getCurrentListMap!3732 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973155 () Bool)

(declare-fun res!651454 () Bool)

(assert (=> b!973155 (=> (not res!651454) (not e!548513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60482 (_ BitVec 32)) Bool)

(assert (=> b!973155 (= res!651454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35392 () Bool)

(declare-fun tp!67350 () Bool)

(declare-fun e!548515 () Bool)

(assert (=> mapNonEmpty!35392 (= mapRes!35392 (and tp!67350 e!548515))))

(declare-fun mapKey!35392 () (_ BitVec 32))

(declare-fun mapValue!35392 () ValueCell!10646)

(declare-fun mapRest!35392 () (Array (_ BitVec 32) ValueCell!10646))

(assert (=> mapNonEmpty!35392 (= (arr!29104 _values!1425) (store mapRest!35392 mapKey!35392 mapValue!35392))))

(declare-fun b!973156 () Bool)

(assert (=> b!973156 (= e!548515 tp_is_empty!22255)))

(declare-fun b!973157 () Bool)

(declare-fun res!651453 () Bool)

(assert (=> b!973157 (=> (not res!651453) (not e!548513))))

(assert (=> b!973157 (= res!651453 (and (= (size!29585 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29586 _keys!1717) (size!29585 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83346 res!651452) b!973157))

(assert (= (and b!973157 res!651453) b!973155))

(assert (= (and b!973155 res!651454) b!973147))

(assert (= (and b!973147 res!651447) b!973148))

(assert (= (and b!973148 res!651449) b!973153))

(assert (= (and b!973153 res!651450) b!973154))

(assert (= (and b!973154 res!651451) b!973149))

(assert (= (and b!973149 res!651448) b!973152))

(assert (= (and b!973151 condMapEmpty!35392) mapIsEmpty!35392))

(assert (= (and b!973151 (not condMapEmpty!35392)) mapNonEmpty!35392))

(get-info :version)

(assert (= (and mapNonEmpty!35392 ((_ is ValueCellFull!10646) mapValue!35392)) b!973156))

(assert (= (and b!973151 ((_ is ValueCellFull!10646) mapDefault!35392)) b!973150))

(assert (= start!83346 b!973151))

(declare-fun b_lambda!14503 () Bool)

(assert (=> (not b_lambda!14503) (not b!973152)))

(declare-fun t!28676 () Bool)

(declare-fun tb!6297 () Bool)

(assert (=> (and start!83346 (= defaultEntry!1428 defaultEntry!1428) t!28676) tb!6297))

(declare-fun result!12579 () Bool)

(assert (=> tb!6297 (= result!12579 tp_is_empty!22255)))

(assert (=> b!973152 t!28676))

(declare-fun b_and!30911 () Bool)

(assert (= b_and!30909 (and (=> t!28676 result!12579) b_and!30911)))

(declare-fun m!900209 () Bool)

(assert (=> start!83346 m!900209))

(declare-fun m!900211 () Bool)

(assert (=> start!83346 m!900211))

(declare-fun m!900213 () Bool)

(assert (=> start!83346 m!900213))

(declare-fun m!900215 () Bool)

(assert (=> b!973155 m!900215))

(declare-fun m!900217 () Bool)

(assert (=> mapNonEmpty!35392 m!900217))

(declare-fun m!900219 () Bool)

(assert (=> b!973153 m!900219))

(assert (=> b!973153 m!900219))

(declare-fun m!900221 () Bool)

(assert (=> b!973153 m!900221))

(assert (=> b!973154 m!900219))

(assert (=> b!973154 m!900219))

(declare-fun m!900223 () Bool)

(assert (=> b!973154 m!900223))

(declare-fun m!900225 () Bool)

(assert (=> b!973154 m!900225))

(declare-fun m!900227 () Bool)

(assert (=> b!973147 m!900227))

(declare-fun m!900229 () Bool)

(assert (=> b!973149 m!900229))

(declare-fun m!900231 () Bool)

(assert (=> b!973149 m!900231))

(declare-fun m!900233 () Bool)

(assert (=> b!973149 m!900233))

(declare-fun m!900235 () Bool)

(assert (=> b!973152 m!900235))

(declare-fun m!900237 () Bool)

(assert (=> b!973152 m!900237))

(declare-fun m!900239 () Bool)

(assert (=> b!973152 m!900239))

(assert (=> b!973152 m!900219))

(assert (=> b!973152 m!900237))

(declare-fun m!900241 () Bool)

(assert (=> b!973152 m!900241))

(declare-fun m!900243 () Bool)

(assert (=> b!973152 m!900243))

(declare-fun m!900245 () Bool)

(assert (=> b!973152 m!900245))

(assert (=> b!973152 m!900243))

(assert (=> b!973152 m!900219))

(declare-fun m!900247 () Bool)

(assert (=> b!973152 m!900247))

(assert (=> b!973152 m!900235))

(assert (=> b!973152 m!900239))

(declare-fun m!900249 () Bool)

(assert (=> b!973152 m!900249))

(assert (=> b!973152 m!900219))

(declare-fun m!900251 () Bool)

(assert (=> b!973152 m!900251))

(check-sat b_and!30911 tp_is_empty!22255 (not mapNonEmpty!35392) (not b_next!19357) (not b!973149) (not b!973147) (not b!973152) (not b!973153) (not start!83346) (not b!973154) (not b_lambda!14503) (not b!973155))
(check-sat b_and!30911 (not b_next!19357))
