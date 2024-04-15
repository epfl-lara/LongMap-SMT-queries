; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43454 () Bool)

(assert start!43454)

(declare-fun b_free!12247 () Bool)

(declare-fun b_next!12247 () Bool)

(assert (=> start!43454 (= b_free!12247 (not b_next!12247))))

(declare-fun tp!43024 () Bool)

(declare-fun b_and!20981 () Bool)

(assert (=> start!43454 (= tp!43024 b_and!20981)))

(declare-fun b!481278 () Bool)

(declare-fun e!283159 () Bool)

(declare-fun e!283157 () Bool)

(declare-fun mapRes!22348 () Bool)

(assert (=> b!481278 (= e!283159 (and e!283157 mapRes!22348))))

(declare-fun condMapEmpty!22348 () Bool)

(declare-datatypes ((V!19417 0))(
  ( (V!19418 (val!6927 Int)) )
))
(declare-datatypes ((ValueCell!6518 0))(
  ( (ValueCellFull!6518 (v!9214 V!19417)) (EmptyCell!6518) )
))
(declare-datatypes ((array!31181 0))(
  ( (array!31182 (arr!14993 (Array (_ BitVec 32) ValueCell!6518)) (size!15352 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31181)

(declare-fun mapDefault!22348 () ValueCell!6518)

(assert (=> b!481278 (= condMapEmpty!22348 (= (arr!14993 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6518)) mapDefault!22348)))))

(declare-fun b!481279 () Bool)

(declare-fun e!283160 () Bool)

(declare-datatypes ((array!31183 0))(
  ( (array!31184 (arr!14994 (Array (_ BitVec 32) (_ BitVec 64))) (size!15353 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31183)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481279 (= e!283160 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!22348 () Bool)

(declare-fun tp!43023 () Bool)

(declare-fun e!283158 () Bool)

(assert (=> mapNonEmpty!22348 (= mapRes!22348 (and tp!43023 e!283158))))

(declare-fun mapRest!22348 () (Array (_ BitVec 32) ValueCell!6518))

(declare-fun mapValue!22348 () ValueCell!6518)

(declare-fun mapKey!22348 () (_ BitVec 32))

(assert (=> mapNonEmpty!22348 (= (arr!14993 _values!1516) (store mapRest!22348 mapKey!22348 mapValue!22348))))

(declare-fun b!481280 () Bool)

(declare-fun res!286955 () Bool)

(declare-fun e!283156 () Bool)

(assert (=> b!481280 (=> (not res!286955) (not e!283156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481280 (= res!286955 (validKeyInArray!0 k0!1332))))

(declare-fun mapIsEmpty!22348 () Bool)

(assert (=> mapIsEmpty!22348 mapRes!22348))

(declare-fun b!481281 () Bool)

(declare-fun res!286957 () Bool)

(assert (=> b!481281 (=> (not res!286957) (not e!283156))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!481281 (= res!286957 (and (= (size!15352 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15353 _keys!1874) (size!15352 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481283 () Bool)

(declare-fun tp_is_empty!13759 () Bool)

(assert (=> b!481283 (= e!283158 tp_is_empty!13759)))

(declare-fun b!481284 () Bool)

(assert (=> b!481284 (= e!283160 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481285 () Bool)

(declare-fun res!286956 () Bool)

(assert (=> b!481285 (=> (not res!286956) (not e!283156))))

(declare-fun minValue!1458 () V!19417)

(declare-fun zeroValue!1458 () V!19417)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9140 0))(
  ( (tuple2!9141 (_1!4581 (_ BitVec 64)) (_2!4581 V!19417)) )
))
(declare-datatypes ((List!9205 0))(
  ( (Nil!9202) (Cons!9201 (h!10057 tuple2!9140) (t!15410 List!9205)) )
))
(declare-datatypes ((ListLongMap!8043 0))(
  ( (ListLongMap!8044 (toList!4037 List!9205)) )
))
(declare-fun contains!2616 (ListLongMap!8043 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2290 (array!31183 array!31181 (_ BitVec 32) (_ BitVec 32) V!19417 V!19417 (_ BitVec 32) Int) ListLongMap!8043)

(assert (=> b!481285 (= res!286956 (contains!2616 (getCurrentListMap!2290 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481286 () Bool)

(assert (=> b!481286 (= e!283157 tp_is_empty!13759)))

(declare-fun b!481287 () Bool)

(assert (=> b!481287 (= e!283156 (not (= (size!15353 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))))))

(declare-fun lt!218324 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31183 (_ BitVec 32)) Bool)

(assert (=> b!481287 (arrayForallSeekEntryOrOpenFound!0 lt!218324 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14110 0))(
  ( (Unit!14111) )
))
(declare-fun lt!218325 () Unit!14110)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14110)

(assert (=> b!481287 (= lt!218325 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218324))))

(declare-fun arrayScanForKey!0 (array!31183 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481287 (= lt!218324 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!481287 e!283160))

(declare-fun c!57853 () Bool)

(assert (=> b!481287 (= c!57853 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218326 () Unit!14110)

(declare-fun lemmaKeyInListMapIsInArray!142 (array!31183 array!31181 (_ BitVec 32) (_ BitVec 32) V!19417 V!19417 (_ BitVec 64) Int) Unit!14110)

(assert (=> b!481287 (= lt!218326 (lemmaKeyInListMapIsInArray!142 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481288 () Bool)

(declare-fun res!286958 () Bool)

(assert (=> b!481288 (=> (not res!286958) (not e!283156))))

(declare-datatypes ((List!9206 0))(
  ( (Nil!9203) (Cons!9202 (h!10058 (_ BitVec 64)) (t!15411 List!9206)) )
))
(declare-fun arrayNoDuplicates!0 (array!31183 (_ BitVec 32) List!9206) Bool)

(assert (=> b!481288 (= res!286958 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9203))))

(declare-fun res!286959 () Bool)

(assert (=> start!43454 (=> (not res!286959) (not e!283156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43454 (= res!286959 (validMask!0 mask!2352))))

(assert (=> start!43454 e!283156))

(assert (=> start!43454 true))

(assert (=> start!43454 tp_is_empty!13759))

(declare-fun array_inv!10902 (array!31181) Bool)

(assert (=> start!43454 (and (array_inv!10902 _values!1516) e!283159)))

(assert (=> start!43454 tp!43024))

(declare-fun array_inv!10903 (array!31183) Bool)

(assert (=> start!43454 (array_inv!10903 _keys!1874)))

(declare-fun b!481282 () Bool)

(declare-fun res!286960 () Bool)

(assert (=> b!481282 (=> (not res!286960) (not e!283156))))

(assert (=> b!481282 (= res!286960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(assert (= (and start!43454 res!286959) b!481281))

(assert (= (and b!481281 res!286957) b!481282))

(assert (= (and b!481282 res!286960) b!481288))

(assert (= (and b!481288 res!286958) b!481285))

(assert (= (and b!481285 res!286956) b!481280))

(assert (= (and b!481280 res!286955) b!481287))

(assert (= (and b!481287 c!57853) b!481279))

(assert (= (and b!481287 (not c!57853)) b!481284))

(assert (= (and b!481278 condMapEmpty!22348) mapIsEmpty!22348))

(assert (= (and b!481278 (not condMapEmpty!22348)) mapNonEmpty!22348))

(get-info :version)

(assert (= (and mapNonEmpty!22348 ((_ is ValueCellFull!6518) mapValue!22348)) b!481283))

(assert (= (and b!481278 ((_ is ValueCellFull!6518) mapDefault!22348)) b!481286))

(assert (= start!43454 b!481278))

(declare-fun m!462249 () Bool)

(assert (=> b!481285 m!462249))

(assert (=> b!481285 m!462249))

(declare-fun m!462251 () Bool)

(assert (=> b!481285 m!462251))

(declare-fun m!462253 () Bool)

(assert (=> start!43454 m!462253))

(declare-fun m!462255 () Bool)

(assert (=> start!43454 m!462255))

(declare-fun m!462257 () Bool)

(assert (=> start!43454 m!462257))

(declare-fun m!462259 () Bool)

(assert (=> b!481288 m!462259))

(declare-fun m!462261 () Bool)

(assert (=> mapNonEmpty!22348 m!462261))

(declare-fun m!462263 () Bool)

(assert (=> b!481282 m!462263))

(declare-fun m!462265 () Bool)

(assert (=> b!481279 m!462265))

(declare-fun m!462267 () Bool)

(assert (=> b!481280 m!462267))

(declare-fun m!462269 () Bool)

(assert (=> b!481287 m!462269))

(declare-fun m!462271 () Bool)

(assert (=> b!481287 m!462271))

(declare-fun m!462273 () Bool)

(assert (=> b!481287 m!462273))

(declare-fun m!462275 () Bool)

(assert (=> b!481287 m!462275))

(check-sat (not start!43454) (not b!481288) (not b!481280) (not b!481285) (not b!481287) b_and!20981 (not b!481282) (not b!481279) (not b_next!12247) tp_is_empty!13759 (not mapNonEmpty!22348))
(check-sat b_and!20981 (not b_next!12247))
