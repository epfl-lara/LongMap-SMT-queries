; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83244 () Bool)

(assert start!83244)

(declare-fun b_free!19255 () Bool)

(declare-fun b_next!19255 () Bool)

(assert (=> start!83244 (= b_free!19255 (not b_next!19255))))

(declare-fun tp!67045 () Bool)

(declare-fun b_and!30717 () Bool)

(assert (=> start!83244 (= tp!67045 b_and!30717)))

(declare-fun mapNonEmpty!35239 () Bool)

(declare-fun mapRes!35239 () Bool)

(declare-fun tp!67044 () Bool)

(declare-fun e!547566 () Bool)

(assert (=> mapNonEmpty!35239 (= mapRes!35239 (and tp!67044 e!547566))))

(declare-datatypes ((V!34521 0))(
  ( (V!34522 (val!11127 Int)) )
))
(declare-datatypes ((ValueCell!10595 0))(
  ( (ValueCellFull!10595 (v!13685 V!34521)) (EmptyCell!10595) )
))
(declare-fun mapRest!35239 () (Array (_ BitVec 32) ValueCell!10595))

(declare-datatypes ((array!60288 0))(
  ( (array!60289 (arr!29008 (Array (_ BitVec 32) ValueCell!10595)) (size!29489 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60288)

(declare-fun mapKey!35239 () (_ BitVec 32))

(declare-fun mapValue!35239 () ValueCell!10595)

(assert (=> mapNonEmpty!35239 (= (arr!29008 _values!1425) (store mapRest!35239 mapKey!35239 mapValue!35239))))

(declare-fun b!971390 () Bool)

(declare-fun res!650244 () Bool)

(declare-fun e!547564 () Bool)

(assert (=> b!971390 (=> (not res!650244) (not e!547564))))

(declare-datatypes ((array!60290 0))(
  ( (array!60291 (arr!29009 (Array (_ BitVec 32) (_ BitVec 64))) (size!29490 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60290)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971390 (= res!650244 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29490 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29490 _keys!1717))))))

(declare-fun b!971391 () Bool)

(declare-fun e!547565 () Bool)

(declare-fun tp_is_empty!22153 () Bool)

(assert (=> b!971391 (= e!547565 tp_is_empty!22153)))

(declare-fun b!971392 () Bool)

(declare-fun res!650241 () Bool)

(assert (=> b!971392 (=> (not res!650241) (not e!547564))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971392 (= res!650241 (and (= (size!29489 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29490 _keys!1717) (size!29489 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971393 () Bool)

(declare-fun res!650243 () Bool)

(assert (=> b!971393 (=> (not res!650243) (not e!547564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60290 (_ BitVec 32)) Bool)

(assert (=> b!971393 (= res!650243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971394 () Bool)

(declare-fun res!650242 () Bool)

(assert (=> b!971394 (=> (not res!650242) (not e!547564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971394 (= res!650242 (validKeyInArray!0 (select (arr!29009 _keys!1717) i!822)))))

(declare-fun res!650239 () Bool)

(assert (=> start!83244 (=> (not res!650239) (not e!547564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83244 (= res!650239 (validMask!0 mask!2147))))

(assert (=> start!83244 e!547564))

(assert (=> start!83244 true))

(declare-fun e!547562 () Bool)

(declare-fun array_inv!22509 (array!60288) Bool)

(assert (=> start!83244 (and (array_inv!22509 _values!1425) e!547562)))

(assert (=> start!83244 tp_is_empty!22153))

(assert (=> start!83244 tp!67045))

(declare-fun array_inv!22510 (array!60290) Bool)

(assert (=> start!83244 (array_inv!22510 _keys!1717)))

(declare-fun mapIsEmpty!35239 () Bool)

(assert (=> mapIsEmpty!35239 mapRes!35239))

(declare-fun b!971395 () Bool)

(declare-fun res!650240 () Bool)

(assert (=> b!971395 (=> (not res!650240) (not e!547564))))

(declare-fun zeroValue!1367 () V!34521)

(declare-fun minValue!1367 () V!34521)

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14352 0))(
  ( (tuple2!14353 (_1!7187 (_ BitVec 64)) (_2!7187 V!34521)) )
))
(declare-datatypes ((List!20166 0))(
  ( (Nil!20163) (Cons!20162 (h!21324 tuple2!14352) (t!28520 List!20166)) )
))
(declare-datatypes ((ListLongMap!13039 0))(
  ( (ListLongMap!13040 (toList!6535 List!20166)) )
))
(declare-fun contains!5578 (ListLongMap!13039 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3697 (array!60290 array!60288 (_ BitVec 32) (_ BitVec 32) V!34521 V!34521 (_ BitVec 32) Int) ListLongMap!13039)

(assert (=> b!971395 (= res!650240 (contains!5578 (getCurrentListMap!3697 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29009 _keys!1717) i!822)))))

(declare-fun b!971396 () Bool)

(assert (=> b!971396 (= e!547562 (and e!547565 mapRes!35239))))

(declare-fun condMapEmpty!35239 () Bool)

(declare-fun mapDefault!35239 () ValueCell!10595)

(assert (=> b!971396 (= condMapEmpty!35239 (= (arr!29008 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10595)) mapDefault!35239)))))

(declare-fun b!971397 () Bool)

(assert (=> b!971397 (= e!547566 tp_is_empty!22153)))

(declare-fun b!971398 () Bool)

(declare-fun res!650245 () Bool)

(assert (=> b!971398 (=> (not res!650245) (not e!547564))))

(declare-datatypes ((List!20167 0))(
  ( (Nil!20164) (Cons!20163 (h!21325 (_ BitVec 64)) (t!28521 List!20167)) )
))
(declare-fun arrayNoDuplicates!0 (array!60290 (_ BitVec 32) List!20167) Bool)

(assert (=> b!971398 (= res!650245 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20164))))

(declare-fun b!971399 () Bool)

(assert (=> b!971399 (= e!547564 false)))

(declare-fun lt!431616 () ListLongMap!13039)

(assert (=> b!971399 (= lt!431616 (getCurrentListMap!3697 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83244 res!650239) b!971392))

(assert (= (and b!971392 res!650241) b!971393))

(assert (= (and b!971393 res!650243) b!971398))

(assert (= (and b!971398 res!650245) b!971390))

(assert (= (and b!971390 res!650244) b!971394))

(assert (= (and b!971394 res!650242) b!971395))

(assert (= (and b!971395 res!650240) b!971399))

(assert (= (and b!971396 condMapEmpty!35239) mapIsEmpty!35239))

(assert (= (and b!971396 (not condMapEmpty!35239)) mapNonEmpty!35239))

(get-info :version)

(assert (= (and mapNonEmpty!35239 ((_ is ValueCellFull!10595) mapValue!35239)) b!971397))

(assert (= (and b!971396 ((_ is ValueCellFull!10595) mapDefault!35239)) b!971391))

(assert (= start!83244 b!971396))

(declare-fun m!898277 () Bool)

(assert (=> b!971398 m!898277))

(declare-fun m!898279 () Bool)

(assert (=> b!971394 m!898279))

(assert (=> b!971394 m!898279))

(declare-fun m!898281 () Bool)

(assert (=> b!971394 m!898281))

(declare-fun m!898283 () Bool)

(assert (=> b!971395 m!898283))

(assert (=> b!971395 m!898279))

(assert (=> b!971395 m!898283))

(assert (=> b!971395 m!898279))

(declare-fun m!898285 () Bool)

(assert (=> b!971395 m!898285))

(declare-fun m!898287 () Bool)

(assert (=> mapNonEmpty!35239 m!898287))

(declare-fun m!898289 () Bool)

(assert (=> b!971393 m!898289))

(declare-fun m!898291 () Bool)

(assert (=> b!971399 m!898291))

(declare-fun m!898293 () Bool)

(assert (=> start!83244 m!898293))

(declare-fun m!898295 () Bool)

(assert (=> start!83244 m!898295))

(declare-fun m!898297 () Bool)

(assert (=> start!83244 m!898297))

(check-sat (not b!971394) (not mapNonEmpty!35239) b_and!30717 (not b!971398) (not start!83244) (not b!971393) (not b!971395) tp_is_empty!22153 (not b!971399) (not b_next!19255))
(check-sat b_and!30717 (not b_next!19255))
