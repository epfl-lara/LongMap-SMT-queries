; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84228 () Bool)

(assert start!84228)

(declare-fun b_free!19929 () Bool)

(declare-fun b_next!19929 () Bool)

(assert (=> start!84228 (= b_free!19929 (not b_next!19929))))

(declare-fun tp!69391 () Bool)

(declare-fun b_and!31935 () Bool)

(assert (=> start!84228 (= tp!69391 b_and!31935)))

(declare-fun res!659326 () Bool)

(declare-fun e!555404 () Bool)

(assert (=> start!84228 (=> (not res!659326) (not e!555404))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84228 (= res!659326 (validMask!0 mask!1948))))

(assert (=> start!84228 e!555404))

(assert (=> start!84228 true))

(declare-fun tp_is_empty!23031 () Bool)

(assert (=> start!84228 tp_is_empty!23031))

(declare-datatypes ((V!35691 0))(
  ( (V!35692 (val!11566 Int)) )
))
(declare-datatypes ((ValueCell!11034 0))(
  ( (ValueCellFull!11034 (v!14128 V!35691)) (EmptyCell!11034) )
))
(declare-datatypes ((array!62037 0))(
  ( (array!62038 (arr!29876 (Array (_ BitVec 32) ValueCell!11034)) (size!30355 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62037)

(declare-fun e!555407 () Bool)

(declare-fun array_inv!23095 (array!62037) Bool)

(assert (=> start!84228 (and (array_inv!23095 _values!1278) e!555407)))

(assert (=> start!84228 tp!69391))

(declare-datatypes ((array!62039 0))(
  ( (array!62040 (arr!29877 (Array (_ BitVec 32) (_ BitVec 64))) (size!30356 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62039)

(declare-fun array_inv!23096 (array!62039) Bool)

(assert (=> start!84228 (array_inv!23096 _keys!1544)))

(declare-fun b!985297 () Bool)

(declare-fun e!555403 () Bool)

(assert (=> b!985297 (= e!555403 (not true))))

(declare-datatypes ((tuple2!14798 0))(
  ( (tuple2!14799 (_1!7410 (_ BitVec 64)) (_2!7410 V!35691)) )
))
(declare-datatypes ((List!20690 0))(
  ( (Nil!20687) (Cons!20686 (h!21848 tuple2!14798) (t!29563 List!20690)) )
))
(declare-datatypes ((ListLongMap!13495 0))(
  ( (ListLongMap!13496 (toList!6763 List!20690)) )
))
(declare-fun lt!437183 () ListLongMap!13495)

(declare-fun lt!437184 () tuple2!14798)

(declare-fun lt!437185 () tuple2!14798)

(declare-fun +!3053 (ListLongMap!13495 tuple2!14798) ListLongMap!13495)

(assert (=> b!985297 (= (+!3053 (+!3053 lt!437183 lt!437184) lt!437185) (+!3053 (+!3053 lt!437183 lt!437185) lt!437184))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!437186 () V!35691)

(assert (=> b!985297 (= lt!437185 (tuple2!14799 (select (arr!29877 _keys!1544) from!1932) lt!437186))))

(declare-fun minValue!1220 () V!35691)

(assert (=> b!985297 (= lt!437184 (tuple2!14799 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32745 0))(
  ( (Unit!32746) )
))
(declare-fun lt!437182 () Unit!32745)

(declare-fun addCommutativeForDiffKeys!681 (ListLongMap!13495 (_ BitVec 64) V!35691 (_ BitVec 64) V!35691) Unit!32745)

(assert (=> b!985297 (= lt!437182 (addCommutativeForDiffKeys!681 lt!437183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29877 _keys!1544) from!1932) lt!437186))))

(declare-fun b!985298 () Bool)

(declare-fun res!659323 () Bool)

(assert (=> b!985298 (=> (not res!659323) (not e!555404))))

(declare-datatypes ((List!20691 0))(
  ( (Nil!20688) (Cons!20687 (h!21849 (_ BitVec 64)) (t!29564 List!20691)) )
))
(declare-fun arrayNoDuplicates!0 (array!62039 (_ BitVec 32) List!20691) Bool)

(assert (=> b!985298 (= res!659323 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20688))))

(declare-fun b!985299 () Bool)

(declare-fun res!659325 () Bool)

(assert (=> b!985299 (=> (not res!659325) (not e!555404))))

(assert (=> b!985299 (= res!659325 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30356 _keys!1544))))))

(declare-fun mapIsEmpty!36575 () Bool)

(declare-fun mapRes!36575 () Bool)

(assert (=> mapIsEmpty!36575 mapRes!36575))

(declare-fun b!985300 () Bool)

(declare-fun res!659322 () Bool)

(assert (=> b!985300 (=> (not res!659322) (not e!555404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985300 (= res!659322 (validKeyInArray!0 (select (arr!29877 _keys!1544) from!1932)))))

(declare-fun b!985301 () Bool)

(declare-fun res!659320 () Bool)

(assert (=> b!985301 (=> (not res!659320) (not e!555404))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985301 (= res!659320 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985302 () Bool)

(declare-fun e!555408 () Bool)

(assert (=> b!985302 (= e!555407 (and e!555408 mapRes!36575))))

(declare-fun condMapEmpty!36575 () Bool)

(declare-fun mapDefault!36575 () ValueCell!11034)

(assert (=> b!985302 (= condMapEmpty!36575 (= (arr!29876 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11034)) mapDefault!36575)))))

(declare-fun b!985303 () Bool)

(assert (=> b!985303 (= e!555408 tp_is_empty!23031)))

(declare-fun b!985304 () Bool)

(declare-fun res!659324 () Bool)

(assert (=> b!985304 (=> (not res!659324) (not e!555404))))

(assert (=> b!985304 (= res!659324 (and (= (size!30355 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30356 _keys!1544) (size!30355 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985305 () Bool)

(assert (=> b!985305 (= e!555404 e!555403)))

(declare-fun res!659327 () Bool)

(assert (=> b!985305 (=> (not res!659327) (not e!555403))))

(assert (=> b!985305 (= res!659327 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29877 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15506 (ValueCell!11034 V!35691) V!35691)

(declare-fun dynLambda!1835 (Int (_ BitVec 64)) V!35691)

(assert (=> b!985305 (= lt!437186 (get!15506 (select (arr!29876 _values!1278) from!1932) (dynLambda!1835 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35691)

(declare-fun getCurrentListMapNoExtraKeys!3455 (array!62039 array!62037 (_ BitVec 32) (_ BitVec 32) V!35691 V!35691 (_ BitVec 32) Int) ListLongMap!13495)

(assert (=> b!985305 (= lt!437183 (getCurrentListMapNoExtraKeys!3455 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985306 () Bool)

(declare-fun e!555405 () Bool)

(assert (=> b!985306 (= e!555405 tp_is_empty!23031)))

(declare-fun mapNonEmpty!36575 () Bool)

(declare-fun tp!69390 () Bool)

(assert (=> mapNonEmpty!36575 (= mapRes!36575 (and tp!69390 e!555405))))

(declare-fun mapValue!36575 () ValueCell!11034)

(declare-fun mapRest!36575 () (Array (_ BitVec 32) ValueCell!11034))

(declare-fun mapKey!36575 () (_ BitVec 32))

(assert (=> mapNonEmpty!36575 (= (arr!29876 _values!1278) (store mapRest!36575 mapKey!36575 mapValue!36575))))

(declare-fun b!985307 () Bool)

(declare-fun res!659321 () Bool)

(assert (=> b!985307 (=> (not res!659321) (not e!555404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62039 (_ BitVec 32)) Bool)

(assert (=> b!985307 (= res!659321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84228 res!659326) b!985304))

(assert (= (and b!985304 res!659324) b!985307))

(assert (= (and b!985307 res!659321) b!985298))

(assert (= (and b!985298 res!659323) b!985299))

(assert (= (and b!985299 res!659325) b!985300))

(assert (= (and b!985300 res!659322) b!985301))

(assert (= (and b!985301 res!659320) b!985305))

(assert (= (and b!985305 res!659327) b!985297))

(assert (= (and b!985302 condMapEmpty!36575) mapIsEmpty!36575))

(assert (= (and b!985302 (not condMapEmpty!36575)) mapNonEmpty!36575))

(get-info :version)

(assert (= (and mapNonEmpty!36575 ((_ is ValueCellFull!11034) mapValue!36575)) b!985306))

(assert (= (and b!985302 ((_ is ValueCellFull!11034) mapDefault!36575)) b!985303))

(assert (= start!84228 b!985302))

(declare-fun b_lambda!14961 () Bool)

(assert (=> (not b_lambda!14961) (not b!985305)))

(declare-fun t!29562 () Bool)

(declare-fun tb!6723 () Bool)

(assert (=> (and start!84228 (= defaultEntry!1281 defaultEntry!1281) t!29562) tb!6723))

(declare-fun result!13435 () Bool)

(assert (=> tb!6723 (= result!13435 tp_is_empty!23031)))

(assert (=> b!985305 t!29562))

(declare-fun b_and!31937 () Bool)

(assert (= b_and!31935 (and (=> t!29562 result!13435) b_and!31937)))

(declare-fun m!912359 () Bool)

(assert (=> b!985298 m!912359))

(declare-fun m!912361 () Bool)

(assert (=> b!985300 m!912361))

(assert (=> b!985300 m!912361))

(declare-fun m!912363 () Bool)

(assert (=> b!985300 m!912363))

(assert (=> b!985297 m!912361))

(declare-fun m!912365 () Bool)

(assert (=> b!985297 m!912365))

(declare-fun m!912367 () Bool)

(assert (=> b!985297 m!912367))

(declare-fun m!912369 () Bool)

(assert (=> b!985297 m!912369))

(assert (=> b!985297 m!912361))

(declare-fun m!912371 () Bool)

(assert (=> b!985297 m!912371))

(assert (=> b!985297 m!912365))

(declare-fun m!912373 () Bool)

(assert (=> b!985297 m!912373))

(assert (=> b!985297 m!912367))

(assert (=> b!985305 m!912361))

(declare-fun m!912375 () Bool)

(assert (=> b!985305 m!912375))

(declare-fun m!912377 () Bool)

(assert (=> b!985305 m!912377))

(declare-fun m!912379 () Bool)

(assert (=> b!985305 m!912379))

(assert (=> b!985305 m!912375))

(assert (=> b!985305 m!912379))

(declare-fun m!912381 () Bool)

(assert (=> b!985305 m!912381))

(declare-fun m!912383 () Bool)

(assert (=> b!985307 m!912383))

(declare-fun m!912385 () Bool)

(assert (=> mapNonEmpty!36575 m!912385))

(declare-fun m!912387 () Bool)

(assert (=> start!84228 m!912387))

(declare-fun m!912389 () Bool)

(assert (=> start!84228 m!912389))

(declare-fun m!912391 () Bool)

(assert (=> start!84228 m!912391))

(check-sat (not b!985298) (not b_lambda!14961) (not b!985297) (not start!84228) (not b_next!19929) (not b!985300) tp_is_empty!23031 b_and!31937 (not b!985307) (not b!985305) (not mapNonEmpty!36575))
(check-sat b_and!31937 (not b_next!19929))
