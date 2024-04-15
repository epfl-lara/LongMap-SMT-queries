; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83292 () Bool)

(assert start!83292)

(declare-fun b_free!19303 () Bool)

(declare-fun b_next!19303 () Bool)

(assert (=> start!83292 (= b_free!19303 (not b_next!19303))))

(declare-fun tp!67189 () Bool)

(declare-fun b_and!30801 () Bool)

(assert (=> start!83292 (= tp!67189 b_and!30801)))

(declare-fun mapIsEmpty!35311 () Bool)

(declare-fun mapRes!35311 () Bool)

(assert (=> mapIsEmpty!35311 mapRes!35311))

(declare-fun b!972202 () Bool)

(declare-fun res!650800 () Bool)

(declare-fun e!547980 () Bool)

(assert (=> b!972202 (=> (not res!650800) (not e!547980))))

(declare-datatypes ((array!60380 0))(
  ( (array!60381 (arr!29054 (Array (_ BitVec 32) (_ BitVec 64))) (size!29535 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60380)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60380 (_ BitVec 32)) Bool)

(assert (=> b!972202 (= res!650800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972203 () Bool)

(declare-fun e!547979 () Bool)

(declare-fun tp_is_empty!22201 () Bool)

(assert (=> b!972203 (= e!547979 tp_is_empty!22201)))

(declare-fun b!972204 () Bool)

(declare-fun res!650805 () Bool)

(assert (=> b!972204 (=> (not res!650805) (not e!547980))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972204 (= res!650805 (validKeyInArray!0 (select (arr!29054 _keys!1717) i!822)))))

(declare-fun b!972205 () Bool)

(declare-fun res!650804 () Bool)

(assert (=> b!972205 (=> (not res!650804) (not e!547980))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972205 (= res!650804 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29535 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29535 _keys!1717))))))

(declare-fun b!972206 () Bool)

(declare-fun res!650806 () Bool)

(assert (=> b!972206 (=> (not res!650806) (not e!547980))))

(declare-datatypes ((V!34585 0))(
  ( (V!34586 (val!11151 Int)) )
))
(declare-datatypes ((ValueCell!10619 0))(
  ( (ValueCellFull!10619 (v!13709 V!34585)) (EmptyCell!10619) )
))
(declare-datatypes ((array!60382 0))(
  ( (array!60383 (arr!29055 (Array (_ BitVec 32) ValueCell!10619)) (size!29536 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60382)

(declare-fun zeroValue!1367 () V!34585)

(declare-fun minValue!1367 () V!34585)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14384 0))(
  ( (tuple2!14385 (_1!7203 (_ BitVec 64)) (_2!7203 V!34585)) )
))
(declare-datatypes ((List!20194 0))(
  ( (Nil!20191) (Cons!20190 (h!21352 tuple2!14384) (t!28586 List!20194)) )
))
(declare-datatypes ((ListLongMap!13071 0))(
  ( (ListLongMap!13072 (toList!6551 List!20194)) )
))
(declare-fun contains!5592 (ListLongMap!13071 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3713 (array!60380 array!60382 (_ BitVec 32) (_ BitVec 32) V!34585 V!34585 (_ BitVec 32) Int) ListLongMap!13071)

(assert (=> b!972206 (= res!650806 (contains!5592 (getCurrentListMap!3713 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29054 _keys!1717) i!822)))))

(declare-fun b!972207 () Bool)

(declare-fun res!650802 () Bool)

(assert (=> b!972207 (=> (not res!650802) (not e!547980))))

(declare-datatypes ((List!20195 0))(
  ( (Nil!20192) (Cons!20191 (h!21353 (_ BitVec 64)) (t!28587 List!20195)) )
))
(declare-fun arrayNoDuplicates!0 (array!60380 (_ BitVec 32) List!20195) Bool)

(assert (=> b!972207 (= res!650802 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20192))))

(declare-fun b!972208 () Bool)

(declare-fun e!547983 () Bool)

(assert (=> b!972208 (= e!547983 tp_is_empty!22201)))

(declare-fun b!972209 () Bool)

(declare-fun e!547981 () Bool)

(assert (=> b!972209 (= e!547981 (not true))))

(declare-fun lt!431800 () ListLongMap!13071)

(declare-fun lt!431801 () (_ BitVec 64))

(declare-fun +!2905 (ListLongMap!13071 tuple2!14384) ListLongMap!13071)

(declare-fun get!15058 (ValueCell!10619 V!34585) V!34585)

(declare-fun dynLambda!1661 (Int (_ BitVec 64)) V!34585)

(assert (=> b!972209 (= lt!431800 (+!2905 (getCurrentListMap!3713 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14385 lt!431801 (get!15058 (select (arr!29055 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1661 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32262 0))(
  ( (Unit!32263) )
))
(declare-fun lt!431802 () Unit!32262)

(declare-fun lemmaListMapRecursiveValidKeyArray!245 (array!60380 array!60382 (_ BitVec 32) (_ BitVec 32) V!34585 V!34585 (_ BitVec 32) Int) Unit!32262)

(assert (=> b!972209 (= lt!431802 (lemmaListMapRecursiveValidKeyArray!245 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35311 () Bool)

(declare-fun tp!67188 () Bool)

(assert (=> mapNonEmpty!35311 (= mapRes!35311 (and tp!67188 e!547983))))

(declare-fun mapValue!35311 () ValueCell!10619)

(declare-fun mapKey!35311 () (_ BitVec 32))

(declare-fun mapRest!35311 () (Array (_ BitVec 32) ValueCell!10619))

(assert (=> mapNonEmpty!35311 (= (arr!29055 _values!1425) (store mapRest!35311 mapKey!35311 mapValue!35311))))

(declare-fun res!650803 () Bool)

(assert (=> start!83292 (=> (not res!650803) (not e!547980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83292 (= res!650803 (validMask!0 mask!2147))))

(assert (=> start!83292 e!547980))

(assert (=> start!83292 true))

(declare-fun e!547978 () Bool)

(declare-fun array_inv!22539 (array!60382) Bool)

(assert (=> start!83292 (and (array_inv!22539 _values!1425) e!547978)))

(assert (=> start!83292 tp_is_empty!22201))

(assert (=> start!83292 tp!67189))

(declare-fun array_inv!22540 (array!60380) Bool)

(assert (=> start!83292 (array_inv!22540 _keys!1717)))

(declare-fun b!972210 () Bool)

(declare-fun res!650801 () Bool)

(assert (=> b!972210 (=> (not res!650801) (not e!547980))))

(assert (=> b!972210 (= res!650801 (and (= (size!29536 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29535 _keys!1717) (size!29536 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972211 () Bool)

(assert (=> b!972211 (= e!547980 e!547981)))

(declare-fun res!650799 () Bool)

(assert (=> b!972211 (=> (not res!650799) (not e!547981))))

(assert (=> b!972211 (= res!650799 (validKeyInArray!0 lt!431801))))

(assert (=> b!972211 (= lt!431801 (select (arr!29054 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972211 (= lt!431800 (getCurrentListMap!3713 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972212 () Bool)

(assert (=> b!972212 (= e!547978 (and e!547979 mapRes!35311))))

(declare-fun condMapEmpty!35311 () Bool)

(declare-fun mapDefault!35311 () ValueCell!10619)

(assert (=> b!972212 (= condMapEmpty!35311 (= (arr!29055 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10619)) mapDefault!35311)))))

(assert (= (and start!83292 res!650803) b!972210))

(assert (= (and b!972210 res!650801) b!972202))

(assert (= (and b!972202 res!650800) b!972207))

(assert (= (and b!972207 res!650802) b!972205))

(assert (= (and b!972205 res!650804) b!972204))

(assert (= (and b!972204 res!650805) b!972206))

(assert (= (and b!972206 res!650806) b!972211))

(assert (= (and b!972211 res!650799) b!972209))

(assert (= (and b!972212 condMapEmpty!35311) mapIsEmpty!35311))

(assert (= (and b!972212 (not condMapEmpty!35311)) mapNonEmpty!35311))

(get-info :version)

(assert (= (and mapNonEmpty!35311 ((_ is ValueCellFull!10619) mapValue!35311)) b!972208))

(assert (= (and b!972212 ((_ is ValueCellFull!10619) mapDefault!35311)) b!972203))

(assert (= start!83292 b!972212))

(declare-fun b_lambda!14449 () Bool)

(assert (=> (not b_lambda!14449) (not b!972209)))

(declare-fun t!28585 () Bool)

(declare-fun tb!6243 () Bool)

(assert (=> (and start!83292 (= defaultEntry!1428 defaultEntry!1428) t!28585) tb!6243))

(declare-fun result!12471 () Bool)

(assert (=> tb!6243 (= result!12471 tp_is_empty!22201)))

(assert (=> b!972209 t!28585))

(declare-fun b_and!30803 () Bool)

(assert (= b_and!30801 (and (=> t!28585 result!12471) b_and!30803)))

(declare-fun m!899093 () Bool)

(assert (=> start!83292 m!899093))

(declare-fun m!899095 () Bool)

(assert (=> start!83292 m!899095))

(declare-fun m!899097 () Bool)

(assert (=> start!83292 m!899097))

(declare-fun m!899099 () Bool)

(assert (=> b!972207 m!899099))

(declare-fun m!899101 () Bool)

(assert (=> b!972209 m!899101))

(declare-fun m!899103 () Bool)

(assert (=> b!972209 m!899103))

(declare-fun m!899105 () Bool)

(assert (=> b!972209 m!899105))

(assert (=> b!972209 m!899101))

(assert (=> b!972209 m!899105))

(declare-fun m!899107 () Bool)

(assert (=> b!972209 m!899107))

(declare-fun m!899109 () Bool)

(assert (=> b!972209 m!899109))

(assert (=> b!972209 m!899103))

(declare-fun m!899111 () Bool)

(assert (=> b!972209 m!899111))

(declare-fun m!899113 () Bool)

(assert (=> b!972202 m!899113))

(declare-fun m!899115 () Bool)

(assert (=> mapNonEmpty!35311 m!899115))

(declare-fun m!899117 () Bool)

(assert (=> b!972204 m!899117))

(assert (=> b!972204 m!899117))

(declare-fun m!899119 () Bool)

(assert (=> b!972204 m!899119))

(declare-fun m!899121 () Bool)

(assert (=> b!972211 m!899121))

(declare-fun m!899123 () Bool)

(assert (=> b!972211 m!899123))

(declare-fun m!899125 () Bool)

(assert (=> b!972211 m!899125))

(declare-fun m!899127 () Bool)

(assert (=> b!972206 m!899127))

(assert (=> b!972206 m!899117))

(assert (=> b!972206 m!899127))

(assert (=> b!972206 m!899117))

(declare-fun m!899129 () Bool)

(assert (=> b!972206 m!899129))

(check-sat (not b!972211) (not b!972206) (not b!972204) (not b_next!19303) (not b!972207) (not start!83292) (not mapNonEmpty!35311) (not b_lambda!14449) (not b!972202) tp_is_empty!22201 (not b!972209) b_and!30803)
(check-sat b_and!30803 (not b_next!19303))
