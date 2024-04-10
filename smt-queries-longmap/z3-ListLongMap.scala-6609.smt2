; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83540 () Bool)

(assert start!83540)

(declare-fun b_free!19527 () Bool)

(declare-fun b_next!19527 () Bool)

(assert (=> start!83540 (= b_free!19527 (not b_next!19527))))

(declare-fun tp!67869 () Bool)

(declare-fun b_and!31149 () Bool)

(assert (=> start!83540 (= tp!67869 b_and!31149)))

(declare-fun res!653458 () Bool)

(declare-fun e!550102 () Bool)

(assert (=> start!83540 (=> (not res!653458) (not e!550102))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83540 (= res!653458 (validMask!0 mask!2147))))

(assert (=> start!83540 e!550102))

(assert (=> start!83540 true))

(declare-datatypes ((V!34891 0))(
  ( (V!34892 (val!11266 Int)) )
))
(declare-datatypes ((ValueCell!10734 0))(
  ( (ValueCellFull!10734 (v!13825 V!34891)) (EmptyCell!10734) )
))
(declare-datatypes ((array!60891 0))(
  ( (array!60892 (arr!29309 (Array (_ BitVec 32) ValueCell!10734)) (size!29788 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60891)

(declare-fun e!550100 () Bool)

(declare-fun array_inv!22661 (array!60891) Bool)

(assert (=> start!83540 (and (array_inv!22661 _values!1425) e!550100)))

(declare-fun tp_is_empty!22431 () Bool)

(assert (=> start!83540 tp_is_empty!22431))

(assert (=> start!83540 tp!67869))

(declare-datatypes ((array!60893 0))(
  ( (array!60894 (arr!29310 (Array (_ BitVec 32) (_ BitVec 64))) (size!29789 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60893)

(declare-fun array_inv!22662 (array!60893) Bool)

(assert (=> start!83540 (array_inv!22662 _keys!1717)))

(declare-fun b!976118 () Bool)

(declare-fun res!653457 () Bool)

(assert (=> b!976118 (=> (not res!653457) (not e!550102))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!976118 (= res!653457 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29789 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29789 _keys!1717))))))

(declare-fun mapNonEmpty!35656 () Bool)

(declare-fun mapRes!35656 () Bool)

(declare-fun tp!67868 () Bool)

(declare-fun e!550097 () Bool)

(assert (=> mapNonEmpty!35656 (= mapRes!35656 (and tp!67868 e!550097))))

(declare-fun mapValue!35656 () ValueCell!10734)

(declare-fun mapKey!35656 () (_ BitVec 32))

(declare-fun mapRest!35656 () (Array (_ BitVec 32) ValueCell!10734))

(assert (=> mapNonEmpty!35656 (= (arr!29309 _values!1425) (store mapRest!35656 mapKey!35656 mapValue!35656))))

(declare-fun b!976119 () Bool)

(declare-fun res!653460 () Bool)

(assert (=> b!976119 (=> (not res!653460) (not e!550102))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!976119 (= res!653460 (and (= (size!29788 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29789 _keys!1717) (size!29788 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976120 () Bool)

(assert (=> b!976120 (= e!550097 tp_is_empty!22431)))

(declare-fun b!976121 () Bool)

(declare-fun res!653459 () Bool)

(assert (=> b!976121 (=> (not res!653459) (not e!550102))))

(declare-fun zeroValue!1367 () V!34891)

(declare-fun minValue!1367 () V!34891)

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14494 0))(
  ( (tuple2!14495 (_1!7258 (_ BitVec 64)) (_2!7258 V!34891)) )
))
(declare-datatypes ((List!20346 0))(
  ( (Nil!20343) (Cons!20342 (h!21504 tuple2!14494) (t!28845 List!20346)) )
))
(declare-datatypes ((ListLongMap!13191 0))(
  ( (ListLongMap!13192 (toList!6611 List!20346)) )
))
(declare-fun contains!5690 (ListLongMap!13191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3844 (array!60893 array!60891 (_ BitVec 32) (_ BitVec 32) V!34891 V!34891 (_ BitVec 32) Int) ListLongMap!13191)

(assert (=> b!976121 (= res!653459 (contains!5690 (getCurrentListMap!3844 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29310 _keys!1717) i!822)))))

(declare-fun b!976122 () Bool)

(declare-fun res!653454 () Bool)

(assert (=> b!976122 (=> (not res!653454) (not e!550102))))

(declare-datatypes ((List!20347 0))(
  ( (Nil!20344) (Cons!20343 (h!21505 (_ BitVec 64)) (t!28846 List!20347)) )
))
(declare-fun arrayNoDuplicates!0 (array!60893 (_ BitVec 32) List!20347) Bool)

(assert (=> b!976122 (= res!653454 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20344))))

(declare-fun b!976123 () Bool)

(declare-fun res!653453 () Bool)

(assert (=> b!976123 (=> (not res!653453) (not e!550102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60893 (_ BitVec 32)) Bool)

(assert (=> b!976123 (= res!653453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35656 () Bool)

(assert (=> mapIsEmpty!35656 mapRes!35656))

(declare-fun b!976124 () Bool)

(declare-fun res!653455 () Bool)

(assert (=> b!976124 (=> (not res!653455) (not e!550102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976124 (= res!653455 (validKeyInArray!0 (select (arr!29310 _keys!1717) i!822)))))

(declare-fun b!976125 () Bool)

(declare-fun e!550099 () Bool)

(assert (=> b!976125 (= e!550099 (not true))))

(declare-fun lt!432990 () ListLongMap!13191)

(declare-fun lt!432992 () (_ BitVec 64))

(declare-fun +!2922 (ListLongMap!13191 tuple2!14494) ListLongMap!13191)

(declare-fun get!15179 (ValueCell!10734 V!34891) V!34891)

(declare-fun dynLambda!1711 (Int (_ BitVec 64)) V!34891)

(assert (=> b!976125 (= lt!432990 (+!2922 (getCurrentListMap!3844 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14495 lt!432992 (get!15179 (select (arr!29309 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1711 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32465 0))(
  ( (Unit!32466) )
))
(declare-fun lt!432991 () Unit!32465)

(declare-fun lemmaListMapRecursiveValidKeyArray!288 (array!60893 array!60891 (_ BitVec 32) (_ BitVec 32) V!34891 V!34891 (_ BitVec 32) Int) Unit!32465)

(assert (=> b!976125 (= lt!432991 (lemmaListMapRecursiveValidKeyArray!288 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976126 () Bool)

(declare-fun e!550098 () Bool)

(assert (=> b!976126 (= e!550098 tp_is_empty!22431)))

(declare-fun b!976127 () Bool)

(assert (=> b!976127 (= e!550102 e!550099)))

(declare-fun res!653456 () Bool)

(assert (=> b!976127 (=> (not res!653456) (not e!550099))))

(assert (=> b!976127 (= res!653456 (validKeyInArray!0 lt!432992))))

(assert (=> b!976127 (= lt!432992 (select (arr!29310 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!976127 (= lt!432990 (getCurrentListMap!3844 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976128 () Bool)

(assert (=> b!976128 (= e!550100 (and e!550098 mapRes!35656))))

(declare-fun condMapEmpty!35656 () Bool)

(declare-fun mapDefault!35656 () ValueCell!10734)

(assert (=> b!976128 (= condMapEmpty!35656 (= (arr!29309 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10734)) mapDefault!35656)))))

(assert (= (and start!83540 res!653458) b!976119))

(assert (= (and b!976119 res!653460) b!976123))

(assert (= (and b!976123 res!653453) b!976122))

(assert (= (and b!976122 res!653454) b!976118))

(assert (= (and b!976118 res!653457) b!976124))

(assert (= (and b!976124 res!653455) b!976121))

(assert (= (and b!976121 res!653459) b!976127))

(assert (= (and b!976127 res!653456) b!976125))

(assert (= (and b!976128 condMapEmpty!35656) mapIsEmpty!35656))

(assert (= (and b!976128 (not condMapEmpty!35656)) mapNonEmpty!35656))

(get-info :version)

(assert (= (and mapNonEmpty!35656 ((_ is ValueCellFull!10734) mapValue!35656)) b!976120))

(assert (= (and b!976128 ((_ is ValueCellFull!10734) mapDefault!35656)) b!976126))

(assert (= start!83540 b!976128))

(declare-fun b_lambda!14565 () Bool)

(assert (=> (not b_lambda!14565) (not b!976125)))

(declare-fun t!28844 () Bool)

(declare-fun tb!6349 () Bool)

(assert (=> (and start!83540 (= defaultEntry!1428 defaultEntry!1428) t!28844) tb!6349))

(declare-fun result!12675 () Bool)

(assert (=> tb!6349 (= result!12675 tp_is_empty!22431)))

(assert (=> b!976125 t!28844))

(declare-fun b_and!31151 () Bool)

(assert (= b_and!31149 (and (=> t!28844 result!12675) b_and!31151)))

(declare-fun m!903309 () Bool)

(assert (=> b!976123 m!903309))

(declare-fun m!903311 () Bool)

(assert (=> b!976124 m!903311))

(assert (=> b!976124 m!903311))

(declare-fun m!903313 () Bool)

(assert (=> b!976124 m!903313))

(declare-fun m!903315 () Bool)

(assert (=> start!83540 m!903315))

(declare-fun m!903317 () Bool)

(assert (=> start!83540 m!903317))

(declare-fun m!903319 () Bool)

(assert (=> start!83540 m!903319))

(declare-fun m!903321 () Bool)

(assert (=> b!976121 m!903321))

(assert (=> b!976121 m!903311))

(assert (=> b!976121 m!903321))

(assert (=> b!976121 m!903311))

(declare-fun m!903323 () Bool)

(assert (=> b!976121 m!903323))

(declare-fun m!903325 () Bool)

(assert (=> mapNonEmpty!35656 m!903325))

(declare-fun m!903327 () Bool)

(assert (=> b!976127 m!903327))

(declare-fun m!903329 () Bool)

(assert (=> b!976127 m!903329))

(declare-fun m!903331 () Bool)

(assert (=> b!976127 m!903331))

(declare-fun m!903333 () Bool)

(assert (=> b!976125 m!903333))

(declare-fun m!903335 () Bool)

(assert (=> b!976125 m!903335))

(declare-fun m!903337 () Bool)

(assert (=> b!976125 m!903337))

(assert (=> b!976125 m!903335))

(declare-fun m!903339 () Bool)

(assert (=> b!976125 m!903339))

(assert (=> b!976125 m!903333))

(assert (=> b!976125 m!903337))

(declare-fun m!903341 () Bool)

(assert (=> b!976125 m!903341))

(declare-fun m!903343 () Bool)

(assert (=> b!976125 m!903343))

(declare-fun m!903345 () Bool)

(assert (=> b!976122 m!903345))

(check-sat (not b!976127) (not b!976121) (not mapNonEmpty!35656) (not b!976122) (not start!83540) (not b!976123) (not b_next!19527) (not b!976124) b_and!31151 (not b!976125) tp_is_empty!22431 (not b_lambda!14565))
(check-sat b_and!31151 (not b_next!19527))
