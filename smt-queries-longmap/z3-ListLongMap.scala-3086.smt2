; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43442 () Bool)

(assert start!43442)

(declare-fun b_free!12235 () Bool)

(declare-fun b_next!12235 () Bool)

(assert (=> start!43442 (= b_free!12235 (not b_next!12235))))

(declare-fun tp!42987 () Bool)

(declare-fun b_and!21005 () Bool)

(assert (=> start!43442 (= tp!42987 b_and!21005)))

(declare-fun b!481290 () Bool)

(declare-fun e!283188 () Bool)

(declare-fun tp_is_empty!13747 () Bool)

(assert (=> b!481290 (= e!283188 tp_is_empty!13747)))

(declare-fun b!481291 () Bool)

(declare-fun res!286972 () Bool)

(declare-fun e!283185 () Bool)

(assert (=> b!481291 (=> (not res!286972) (not e!283185))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481291 (= res!286972 (validKeyInArray!0 k0!1332))))

(declare-fun b!481292 () Bool)

(declare-fun res!286971 () Bool)

(assert (=> b!481292 (=> (not res!286971) (not e!283185))))

(declare-datatypes ((array!31146 0))(
  ( (array!31147 (arr!14975 (Array (_ BitVec 32) (_ BitVec 64))) (size!15333 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31146)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31146 (_ BitVec 32)) Bool)

(assert (=> b!481292 (= res!286971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22330 () Bool)

(declare-fun mapRes!22330 () Bool)

(assert (=> mapIsEmpty!22330 mapRes!22330))

(declare-fun b!481293 () Bool)

(declare-fun e!283183 () Bool)

(declare-fun arrayContainsKey!0 (array!31146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481293 (= e!283183 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!22330 () Bool)

(declare-fun tp!42988 () Bool)

(assert (=> mapNonEmpty!22330 (= mapRes!22330 (and tp!42988 e!283188))))

(declare-datatypes ((V!19401 0))(
  ( (V!19402 (val!6921 Int)) )
))
(declare-datatypes ((ValueCell!6512 0))(
  ( (ValueCellFull!6512 (v!9215 V!19401)) (EmptyCell!6512) )
))
(declare-fun mapValue!22330 () ValueCell!6512)

(declare-fun mapRest!22330 () (Array (_ BitVec 32) ValueCell!6512))

(declare-fun mapKey!22330 () (_ BitVec 32))

(declare-datatypes ((array!31148 0))(
  ( (array!31149 (arr!14976 (Array (_ BitVec 32) ValueCell!6512)) (size!15334 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31148)

(assert (=> mapNonEmpty!22330 (= (arr!14976 _values!1516) (store mapRest!22330 mapKey!22330 mapValue!22330))))

(declare-fun b!481294 () Bool)

(declare-fun res!286970 () Bool)

(assert (=> b!481294 (=> (not res!286970) (not e!283185))))

(declare-datatypes ((List!9067 0))(
  ( (Nil!9064) (Cons!9063 (h!9919 (_ BitVec 64)) (t!15273 List!9067)) )
))
(declare-fun arrayNoDuplicates!0 (array!31146 (_ BitVec 32) List!9067) Bool)

(assert (=> b!481294 (= res!286970 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9064))))

(declare-fun b!481295 () Bool)

(declare-fun res!286969 () Bool)

(assert (=> b!481295 (=> (not res!286969) (not e!283185))))

(declare-fun minValue!1458 () V!19401)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19401)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!8998 0))(
  ( (tuple2!8999 (_1!4510 (_ BitVec 64)) (_2!4510 V!19401)) )
))
(declare-datatypes ((List!9068 0))(
  ( (Nil!9065) (Cons!9064 (h!9920 tuple2!8998) (t!15274 List!9068)) )
))
(declare-datatypes ((ListLongMap!7913 0))(
  ( (ListLongMap!7914 (toList!3972 List!9068)) )
))
(declare-fun contains!2604 (ListLongMap!7913 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2286 (array!31146 array!31148 (_ BitVec 32) (_ BitVec 32) V!19401 V!19401 (_ BitVec 32) Int) ListLongMap!7913)

(assert (=> b!481295 (= res!286969 (contains!2604 (getCurrentListMap!2286 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun res!286974 () Bool)

(assert (=> start!43442 (=> (not res!286974) (not e!283185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43442 (= res!286974 (validMask!0 mask!2352))))

(assert (=> start!43442 e!283185))

(assert (=> start!43442 true))

(assert (=> start!43442 tp_is_empty!13747))

(declare-fun e!283187 () Bool)

(declare-fun array_inv!10872 (array!31148) Bool)

(assert (=> start!43442 (and (array_inv!10872 _values!1516) e!283187)))

(assert (=> start!43442 tp!42987))

(declare-fun array_inv!10873 (array!31146) Bool)

(assert (=> start!43442 (array_inv!10873 _keys!1874)))

(declare-fun b!481296 () Bool)

(declare-fun res!286973 () Bool)

(assert (=> b!481296 (=> (not res!286973) (not e!283185))))

(assert (=> b!481296 (= res!286973 (and (= (size!15334 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15333 _keys!1874) (size!15334 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481297 () Bool)

(assert (=> b!481297 (= e!283185 (not true))))

(declare-fun lt!218516 () (_ BitVec 32))

(assert (=> b!481297 (arrayForallSeekEntryOrOpenFound!0 lt!218516 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14083 0))(
  ( (Unit!14084) )
))
(declare-fun lt!218518 () Unit!14083)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14083)

(assert (=> b!481297 (= lt!218518 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218516))))

(declare-fun arrayScanForKey!0 (array!31146 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481297 (= lt!218516 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!481297 e!283183))

(declare-fun c!57879 () Bool)

(assert (=> b!481297 (= c!57879 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218517 () Unit!14083)

(declare-fun lemmaKeyInListMapIsInArray!133 (array!31146 array!31148 (_ BitVec 32) (_ BitVec 32) V!19401 V!19401 (_ BitVec 64) Int) Unit!14083)

(assert (=> b!481297 (= lt!218517 (lemmaKeyInListMapIsInArray!133 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481298 () Bool)

(assert (=> b!481298 (= e!283183 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481299 () Bool)

(declare-fun e!283186 () Bool)

(assert (=> b!481299 (= e!283187 (and e!283186 mapRes!22330))))

(declare-fun condMapEmpty!22330 () Bool)

(declare-fun mapDefault!22330 () ValueCell!6512)

(assert (=> b!481299 (= condMapEmpty!22330 (= (arr!14976 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6512)) mapDefault!22330)))))

(declare-fun b!481300 () Bool)

(assert (=> b!481300 (= e!283186 tp_is_empty!13747)))

(assert (= (and start!43442 res!286974) b!481296))

(assert (= (and b!481296 res!286973) b!481292))

(assert (= (and b!481292 res!286971) b!481294))

(assert (= (and b!481294 res!286970) b!481295))

(assert (= (and b!481295 res!286969) b!481291))

(assert (= (and b!481291 res!286972) b!481297))

(assert (= (and b!481297 c!57879) b!481293))

(assert (= (and b!481297 (not c!57879)) b!481298))

(assert (= (and b!481299 condMapEmpty!22330) mapIsEmpty!22330))

(assert (= (and b!481299 (not condMapEmpty!22330)) mapNonEmpty!22330))

(get-info :version)

(assert (= (and mapNonEmpty!22330 ((_ is ValueCellFull!6512) mapValue!22330)) b!481290))

(assert (= (and b!481299 ((_ is ValueCellFull!6512) mapDefault!22330)) b!481300))

(assert (= start!43442 b!481299))

(declare-fun m!462997 () Bool)

(assert (=> b!481295 m!462997))

(assert (=> b!481295 m!462997))

(declare-fun m!462999 () Bool)

(assert (=> b!481295 m!462999))

(declare-fun m!463001 () Bool)

(assert (=> b!481291 m!463001))

(declare-fun m!463003 () Bool)

(assert (=> b!481297 m!463003))

(declare-fun m!463005 () Bool)

(assert (=> b!481297 m!463005))

(declare-fun m!463007 () Bool)

(assert (=> b!481297 m!463007))

(declare-fun m!463009 () Bool)

(assert (=> b!481297 m!463009))

(declare-fun m!463011 () Bool)

(assert (=> start!43442 m!463011))

(declare-fun m!463013 () Bool)

(assert (=> start!43442 m!463013))

(declare-fun m!463015 () Bool)

(assert (=> start!43442 m!463015))

(declare-fun m!463017 () Bool)

(assert (=> b!481293 m!463017))

(declare-fun m!463019 () Bool)

(assert (=> mapNonEmpty!22330 m!463019))

(declare-fun m!463021 () Bool)

(assert (=> b!481294 m!463021))

(declare-fun m!463023 () Bool)

(assert (=> b!481292 m!463023))

(check-sat (not b!481291) (not b!481294) (not start!43442) (not b!481293) tp_is_empty!13747 (not b!481295) (not b_next!12235) b_and!21005 (not mapNonEmpty!22330) (not b!481297) (not b!481292))
(check-sat b_and!21005 (not b_next!12235))
