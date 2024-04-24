; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38142 () Bool)

(assert start!38142)

(declare-fun b_free!9037 () Bool)

(declare-fun b_next!9037 () Bool)

(assert (=> start!38142 (= b_free!9037 (not b_next!9037))))

(declare-fun tp!31892 () Bool)

(declare-fun b_and!16413 () Bool)

(assert (=> start!38142 (= tp!31892 b_and!16413)))

(declare-fun b!393291 () Bool)

(declare-fun res!225349 () Bool)

(declare-fun e!238123 () Bool)

(assert (=> b!393291 (=> (not res!225349) (not e!238123))))

(declare-datatypes ((array!23312 0))(
  ( (array!23313 (arr!11114 (Array (_ BitVec 32) (_ BitVec 64))) (size!11466 (_ BitVec 32))) )
))
(declare-fun lt!186154 () array!23312)

(declare-datatypes ((List!6323 0))(
  ( (Nil!6320) (Cons!6319 (h!7175 (_ BitVec 64)) (t!11485 List!6323)) )
))
(declare-fun arrayNoDuplicates!0 (array!23312 (_ BitVec 32) List!6323) Bool)

(assert (=> b!393291 (= res!225349 (arrayNoDuplicates!0 lt!186154 #b00000000000000000000000000000000 Nil!6320))))

(declare-fun b!393292 () Bool)

(declare-fun res!225356 () Bool)

(declare-fun e!238126 () Bool)

(assert (=> b!393292 (=> (not res!225356) (not e!238126))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393292 (= res!225356 (validKeyInArray!0 k0!778))))

(declare-fun b!393293 () Bool)

(declare-fun res!225357 () Bool)

(assert (=> b!393293 (=> (not res!225357) (not e!238126))))

(declare-fun _keys!658 () array!23312)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393293 (= res!225357 (or (= (select (arr!11114 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11114 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393294 () Bool)

(declare-fun res!225354 () Bool)

(assert (=> b!393294 (=> (not res!225354) (not e!238126))))

(assert (=> b!393294 (= res!225354 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11466 _keys!658))))))

(declare-fun res!225352 () Bool)

(assert (=> start!38142 (=> (not res!225352) (not e!238126))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38142 (= res!225352 (validMask!0 mask!970))))

(assert (=> start!38142 e!238126))

(declare-datatypes ((V!14051 0))(
  ( (V!14052 (val!4899 Int)) )
))
(declare-datatypes ((ValueCell!4511 0))(
  ( (ValueCellFull!4511 (v!7137 V!14051)) (EmptyCell!4511) )
))
(declare-datatypes ((array!23314 0))(
  ( (array!23315 (arr!11115 (Array (_ BitVec 32) ValueCell!4511)) (size!11467 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23314)

(declare-fun e!238127 () Bool)

(declare-fun array_inv!8212 (array!23314) Bool)

(assert (=> start!38142 (and (array_inv!8212 _values!506) e!238127)))

(assert (=> start!38142 tp!31892))

(assert (=> start!38142 true))

(declare-fun tp_is_empty!9709 () Bool)

(assert (=> start!38142 tp_is_empty!9709))

(declare-fun array_inv!8213 (array!23312) Bool)

(assert (=> start!38142 (array_inv!8213 _keys!658)))

(declare-fun b!393295 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((tuple2!6476 0))(
  ( (tuple2!6477 (_1!3249 (_ BitVec 64)) (_2!3249 V!14051)) )
))
(declare-datatypes ((List!6324 0))(
  ( (Nil!6321) (Cons!6320 (h!7176 tuple2!6476) (t!11486 List!6324)) )
))
(declare-datatypes ((ListLongMap!5391 0))(
  ( (ListLongMap!5392 (toList!2711 List!6324)) )
))
(declare-fun lt!186160 () ListLongMap!5391)

(declare-fun lt!186153 () ListLongMap!5391)

(declare-fun lt!186156 () Bool)

(assert (=> b!393295 (= e!238123 (not (or (and (not lt!186156) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186156) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186156) (= lt!186160 lt!186153))))))

(assert (=> b!393295 (= lt!186156 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!186161 () ListLongMap!5391)

(declare-fun zeroValue!472 () V!14051)

(declare-fun minValue!472 () V!14051)

(declare-fun getCurrentListMap!2084 (array!23312 array!23314 (_ BitVec 32) (_ BitVec 32) V!14051 V!14051 (_ BitVec 32) Int) ListLongMap!5391)

(assert (=> b!393295 (= lt!186161 (getCurrentListMap!2084 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186158 () array!23314)

(assert (=> b!393295 (= lt!186160 (getCurrentListMap!2084 lt!186154 lt!186158 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186157 () ListLongMap!5391)

(assert (=> b!393295 (and (= lt!186153 lt!186157) (= lt!186157 lt!186153))))

(declare-fun v!373 () V!14051)

(declare-fun lt!186159 () ListLongMap!5391)

(declare-fun +!1065 (ListLongMap!5391 tuple2!6476) ListLongMap!5391)

(assert (=> b!393295 (= lt!186157 (+!1065 lt!186159 (tuple2!6477 k0!778 v!373)))))

(declare-datatypes ((Unit!11997 0))(
  ( (Unit!11998) )
))
(declare-fun lt!186155 () Unit!11997)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!275 (array!23312 array!23314 (_ BitVec 32) (_ BitVec 32) V!14051 V!14051 (_ BitVec 32) (_ BitVec 64) V!14051 (_ BitVec 32) Int) Unit!11997)

(assert (=> b!393295 (= lt!186155 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!275 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!973 (array!23312 array!23314 (_ BitVec 32) (_ BitVec 32) V!14051 V!14051 (_ BitVec 32) Int) ListLongMap!5391)

(assert (=> b!393295 (= lt!186153 (getCurrentListMapNoExtraKeys!973 lt!186154 lt!186158 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393295 (= lt!186158 (array!23315 (store (arr!11115 _values!506) i!548 (ValueCellFull!4511 v!373)) (size!11467 _values!506)))))

(assert (=> b!393295 (= lt!186159 (getCurrentListMapNoExtraKeys!973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393296 () Bool)

(declare-fun res!225350 () Bool)

(assert (=> b!393296 (=> (not res!225350) (not e!238126))))

(declare-fun arrayContainsKey!0 (array!23312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393296 (= res!225350 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393297 () Bool)

(declare-fun res!225353 () Bool)

(assert (=> b!393297 (=> (not res!225353) (not e!238126))))

(assert (=> b!393297 (= res!225353 (and (= (size!11467 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11466 _keys!658) (size!11467 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16158 () Bool)

(declare-fun mapRes!16158 () Bool)

(declare-fun tp!31893 () Bool)

(declare-fun e!238124 () Bool)

(assert (=> mapNonEmpty!16158 (= mapRes!16158 (and tp!31893 e!238124))))

(declare-fun mapRest!16158 () (Array (_ BitVec 32) ValueCell!4511))

(declare-fun mapKey!16158 () (_ BitVec 32))

(declare-fun mapValue!16158 () ValueCell!4511)

(assert (=> mapNonEmpty!16158 (= (arr!11115 _values!506) (store mapRest!16158 mapKey!16158 mapValue!16158))))

(declare-fun b!393298 () Bool)

(declare-fun e!238122 () Bool)

(assert (=> b!393298 (= e!238127 (and e!238122 mapRes!16158))))

(declare-fun condMapEmpty!16158 () Bool)

(declare-fun mapDefault!16158 () ValueCell!4511)

(assert (=> b!393298 (= condMapEmpty!16158 (= (arr!11115 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4511)) mapDefault!16158)))))

(declare-fun b!393299 () Bool)

(assert (=> b!393299 (= e!238124 tp_is_empty!9709)))

(declare-fun mapIsEmpty!16158 () Bool)

(assert (=> mapIsEmpty!16158 mapRes!16158))

(declare-fun b!393300 () Bool)

(declare-fun res!225348 () Bool)

(assert (=> b!393300 (=> (not res!225348) (not e!238126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23312 (_ BitVec 32)) Bool)

(assert (=> b!393300 (= res!225348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393301 () Bool)

(declare-fun res!225351 () Bool)

(assert (=> b!393301 (=> (not res!225351) (not e!238126))))

(assert (=> b!393301 (= res!225351 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6320))))

(declare-fun b!393302 () Bool)

(assert (=> b!393302 (= e!238122 tp_is_empty!9709)))

(declare-fun b!393303 () Bool)

(assert (=> b!393303 (= e!238126 e!238123)))

(declare-fun res!225355 () Bool)

(assert (=> b!393303 (=> (not res!225355) (not e!238123))))

(assert (=> b!393303 (= res!225355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186154 mask!970))))

(assert (=> b!393303 (= lt!186154 (array!23313 (store (arr!11114 _keys!658) i!548 k0!778) (size!11466 _keys!658)))))

(assert (= (and start!38142 res!225352) b!393297))

(assert (= (and b!393297 res!225353) b!393300))

(assert (= (and b!393300 res!225348) b!393301))

(assert (= (and b!393301 res!225351) b!393294))

(assert (= (and b!393294 res!225354) b!393292))

(assert (= (and b!393292 res!225356) b!393293))

(assert (= (and b!393293 res!225357) b!393296))

(assert (= (and b!393296 res!225350) b!393303))

(assert (= (and b!393303 res!225355) b!393291))

(assert (= (and b!393291 res!225349) b!393295))

(assert (= (and b!393298 condMapEmpty!16158) mapIsEmpty!16158))

(assert (= (and b!393298 (not condMapEmpty!16158)) mapNonEmpty!16158))

(get-info :version)

(assert (= (and mapNonEmpty!16158 ((_ is ValueCellFull!4511) mapValue!16158)) b!393299))

(assert (= (and b!393298 ((_ is ValueCellFull!4511) mapDefault!16158)) b!393302))

(assert (= start!38142 b!393298))

(declare-fun m!390043 () Bool)

(assert (=> b!393301 m!390043))

(declare-fun m!390045 () Bool)

(assert (=> b!393293 m!390045))

(declare-fun m!390047 () Bool)

(assert (=> b!393303 m!390047))

(declare-fun m!390049 () Bool)

(assert (=> b!393303 m!390049))

(declare-fun m!390051 () Bool)

(assert (=> b!393291 m!390051))

(declare-fun m!390053 () Bool)

(assert (=> b!393295 m!390053))

(declare-fun m!390055 () Bool)

(assert (=> b!393295 m!390055))

(declare-fun m!390057 () Bool)

(assert (=> b!393295 m!390057))

(declare-fun m!390059 () Bool)

(assert (=> b!393295 m!390059))

(declare-fun m!390061 () Bool)

(assert (=> b!393295 m!390061))

(declare-fun m!390063 () Bool)

(assert (=> b!393295 m!390063))

(declare-fun m!390065 () Bool)

(assert (=> b!393295 m!390065))

(declare-fun m!390067 () Bool)

(assert (=> b!393292 m!390067))

(declare-fun m!390069 () Bool)

(assert (=> b!393300 m!390069))

(declare-fun m!390071 () Bool)

(assert (=> b!393296 m!390071))

(declare-fun m!390073 () Bool)

(assert (=> mapNonEmpty!16158 m!390073))

(declare-fun m!390075 () Bool)

(assert (=> start!38142 m!390075))

(declare-fun m!390077 () Bool)

(assert (=> start!38142 m!390077))

(declare-fun m!390079 () Bool)

(assert (=> start!38142 m!390079))

(check-sat (not b!393301) (not b!393303) (not b!393296) (not b!393292) (not b!393300) b_and!16413 (not mapNonEmpty!16158) (not b_next!9037) (not b!393291) tp_is_empty!9709 (not start!38142) (not b!393295))
(check-sat b_and!16413 (not b_next!9037))
(get-model)

(declare-fun b!393392 () Bool)

(declare-fun e!238173 () Bool)

(declare-fun call!27758 () Bool)

(assert (=> b!393392 (= e!238173 call!27758)))

(declare-fun bm!27755 () Bool)

(declare-fun c!54414 () Bool)

(assert (=> bm!27755 (= call!27758 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54414 (Cons!6319 (select (arr!11114 _keys!658) #b00000000000000000000000000000000) Nil!6320) Nil!6320)))))

(declare-fun b!393393 () Bool)

(declare-fun e!238175 () Bool)

(declare-fun e!238172 () Bool)

(assert (=> b!393393 (= e!238175 e!238172)))

(declare-fun res!225425 () Bool)

(assert (=> b!393393 (=> (not res!225425) (not e!238172))))

(declare-fun e!238174 () Bool)

(assert (=> b!393393 (= res!225425 (not e!238174))))

(declare-fun res!225424 () Bool)

(assert (=> b!393393 (=> (not res!225424) (not e!238174))))

(assert (=> b!393393 (= res!225424 (validKeyInArray!0 (select (arr!11114 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393394 () Bool)

(assert (=> b!393394 (= e!238172 e!238173)))

(assert (=> b!393394 (= c!54414 (validKeyInArray!0 (select (arr!11114 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393395 () Bool)

(assert (=> b!393395 (= e!238173 call!27758)))

(declare-fun b!393396 () Bool)

(declare-fun contains!2449 (List!6323 (_ BitVec 64)) Bool)

(assert (=> b!393396 (= e!238174 (contains!2449 Nil!6320 (select (arr!11114 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!73239 () Bool)

(declare-fun res!225426 () Bool)

(assert (=> d!73239 (=> res!225426 e!238175)))

(assert (=> d!73239 (= res!225426 (bvsge #b00000000000000000000000000000000 (size!11466 _keys!658)))))

(assert (=> d!73239 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6320) e!238175)))

(assert (= (and d!73239 (not res!225426)) b!393393))

(assert (= (and b!393393 res!225424) b!393396))

(assert (= (and b!393393 res!225425) b!393394))

(assert (= (and b!393394 c!54414) b!393395))

(assert (= (and b!393394 (not c!54414)) b!393392))

(assert (= (or b!393395 b!393392) bm!27755))

(declare-fun m!390157 () Bool)

(assert (=> bm!27755 m!390157))

(declare-fun m!390159 () Bool)

(assert (=> bm!27755 m!390159))

(assert (=> b!393393 m!390157))

(assert (=> b!393393 m!390157))

(declare-fun m!390161 () Bool)

(assert (=> b!393393 m!390161))

(assert (=> b!393394 m!390157))

(assert (=> b!393394 m!390157))

(assert (=> b!393394 m!390161))

(assert (=> b!393396 m!390157))

(assert (=> b!393396 m!390157))

(declare-fun m!390163 () Bool)

(assert (=> b!393396 m!390163))

(assert (=> b!393301 d!73239))

(declare-fun d!73241 () Bool)

(assert (=> d!73241 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38142 d!73241))

(declare-fun d!73243 () Bool)

(assert (=> d!73243 (= (array_inv!8212 _values!506) (bvsge (size!11467 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38142 d!73243))

(declare-fun d!73245 () Bool)

(assert (=> d!73245 (= (array_inv!8213 _keys!658) (bvsge (size!11466 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38142 d!73245))

(declare-fun d!73247 () Bool)

(assert (=> d!73247 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393292 d!73247))

(declare-fun b!393421 () Bool)

(declare-fun e!238193 () Bool)

(declare-fun e!238194 () Bool)

(assert (=> b!393421 (= e!238193 e!238194)))

(declare-fun c!54423 () Bool)

(declare-fun e!238190 () Bool)

(assert (=> b!393421 (= c!54423 e!238190)))

(declare-fun res!225435 () Bool)

(assert (=> b!393421 (=> (not res!225435) (not e!238190))))

(assert (=> b!393421 (= res!225435 (bvslt #b00000000000000000000000000000000 (size!11466 _keys!658)))))

(declare-fun b!393422 () Bool)

(declare-fun e!238191 () Bool)

(declare-fun lt!186230 () ListLongMap!5391)

(declare-fun isEmpty!559 (ListLongMap!5391) Bool)

(assert (=> b!393422 (= e!238191 (isEmpty!559 lt!186230))))

(declare-fun b!393423 () Bool)

(assert (=> b!393423 (= e!238190 (validKeyInArray!0 (select (arr!11114 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!393423 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!393424 () Bool)

(declare-fun e!238192 () Bool)

(assert (=> b!393424 (= e!238194 e!238192)))

(assert (=> b!393424 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 _keys!658)))))

(declare-fun res!225436 () Bool)

(declare-fun contains!2450 (ListLongMap!5391 (_ BitVec 64)) Bool)

(assert (=> b!393424 (= res!225436 (contains!2450 lt!186230 (select (arr!11114 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!393424 (=> (not res!225436) (not e!238192))))

(declare-fun d!73249 () Bool)

(assert (=> d!73249 e!238193))

(declare-fun res!225438 () Bool)

(assert (=> d!73249 (=> (not res!225438) (not e!238193))))

(assert (=> d!73249 (= res!225438 (not (contains!2450 lt!186230 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!238196 () ListLongMap!5391)

(assert (=> d!73249 (= lt!186230 e!238196)))

(declare-fun c!54424 () Bool)

(assert (=> d!73249 (= c!54424 (bvsge #b00000000000000000000000000000000 (size!11466 _keys!658)))))

(assert (=> d!73249 (validMask!0 mask!970)))

(assert (=> d!73249 (= (getCurrentListMapNoExtraKeys!973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186230)))

(declare-fun b!393425 () Bool)

(assert (=> b!393425 (= e!238196 (ListLongMap!5392 Nil!6321))))

(declare-fun b!393426 () Bool)

(assert (=> b!393426 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 _keys!658)))))

(assert (=> b!393426 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11467 _values!506)))))

(declare-fun apply!307 (ListLongMap!5391 (_ BitVec 64)) V!14051)

(declare-fun get!5623 (ValueCell!4511 V!14051) V!14051)

(declare-fun dynLambda!650 (Int (_ BitVec 64)) V!14051)

(assert (=> b!393426 (= e!238192 (= (apply!307 lt!186230 (select (arr!11114 _keys!658) #b00000000000000000000000000000000)) (get!5623 (select (arr!11115 _values!506) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!393427 () Bool)

(declare-fun e!238195 () ListLongMap!5391)

(declare-fun call!27761 () ListLongMap!5391)

(assert (=> b!393427 (= e!238195 call!27761)))

(declare-fun b!393428 () Bool)

(declare-fun res!225437 () Bool)

(assert (=> b!393428 (=> (not res!225437) (not e!238193))))

(assert (=> b!393428 (= res!225437 (not (contains!2450 lt!186230 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!27758 () Bool)

(assert (=> bm!27758 (= call!27761 (getCurrentListMapNoExtraKeys!973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!393429 () Bool)

(assert (=> b!393429 (= e!238191 (= lt!186230 (getCurrentListMapNoExtraKeys!973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!393430 () Bool)

(declare-fun lt!186232 () Unit!11997)

(declare-fun lt!186231 () Unit!11997)

(assert (=> b!393430 (= lt!186232 lt!186231)))

(declare-fun lt!186234 () V!14051)

(declare-fun lt!186235 () (_ BitVec 64))

(declare-fun lt!186233 () ListLongMap!5391)

(declare-fun lt!186236 () (_ BitVec 64))

(assert (=> b!393430 (not (contains!2450 (+!1065 lt!186233 (tuple2!6477 lt!186235 lt!186234)) lt!186236))))

(declare-fun addStillNotContains!142 (ListLongMap!5391 (_ BitVec 64) V!14051 (_ BitVec 64)) Unit!11997)

(assert (=> b!393430 (= lt!186231 (addStillNotContains!142 lt!186233 lt!186235 lt!186234 lt!186236))))

(assert (=> b!393430 (= lt!186236 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!393430 (= lt!186234 (get!5623 (select (arr!11115 _values!506) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!393430 (= lt!186235 (select (arr!11114 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!393430 (= lt!186233 call!27761)))

(assert (=> b!393430 (= e!238195 (+!1065 call!27761 (tuple2!6477 (select (arr!11114 _keys!658) #b00000000000000000000000000000000) (get!5623 (select (arr!11115 _values!506) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!393431 () Bool)

(assert (=> b!393431 (= e!238196 e!238195)))

(declare-fun c!54425 () Bool)

(assert (=> b!393431 (= c!54425 (validKeyInArray!0 (select (arr!11114 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393432 () Bool)

(assert (=> b!393432 (= e!238194 e!238191)))

(declare-fun c!54426 () Bool)

(assert (=> b!393432 (= c!54426 (bvslt #b00000000000000000000000000000000 (size!11466 _keys!658)))))

(assert (= (and d!73249 c!54424) b!393425))

(assert (= (and d!73249 (not c!54424)) b!393431))

(assert (= (and b!393431 c!54425) b!393430))

(assert (= (and b!393431 (not c!54425)) b!393427))

(assert (= (or b!393430 b!393427) bm!27758))

(assert (= (and d!73249 res!225438) b!393428))

(assert (= (and b!393428 res!225437) b!393421))

(assert (= (and b!393421 res!225435) b!393423))

(assert (= (and b!393421 c!54423) b!393424))

(assert (= (and b!393421 (not c!54423)) b!393432))

(assert (= (and b!393424 res!225436) b!393426))

(assert (= (and b!393432 c!54426) b!393429))

(assert (= (and b!393432 (not c!54426)) b!393422))

(declare-fun b_lambda!8789 () Bool)

(assert (=> (not b_lambda!8789) (not b!393426)))

(declare-fun t!11491 () Bool)

(declare-fun tb!3121 () Bool)

(assert (=> (and start!38142 (= defaultEntry!514 defaultEntry!514) t!11491) tb!3121))

(declare-fun result!5759 () Bool)

(assert (=> tb!3121 (= result!5759 tp_is_empty!9709)))

(assert (=> b!393426 t!11491))

(declare-fun b_and!16419 () Bool)

(assert (= b_and!16413 (and (=> t!11491 result!5759) b_and!16419)))

(declare-fun b_lambda!8791 () Bool)

(assert (=> (not b_lambda!8791) (not b!393430)))

(assert (=> b!393430 t!11491))

(declare-fun b_and!16421 () Bool)

(assert (= b_and!16419 (and (=> t!11491 result!5759) b_and!16421)))

(assert (=> b!393431 m!390157))

(assert (=> b!393431 m!390157))

(assert (=> b!393431 m!390161))

(declare-fun m!390165 () Bool)

(assert (=> b!393428 m!390165))

(assert (=> b!393424 m!390157))

(assert (=> b!393424 m!390157))

(declare-fun m!390167 () Bool)

(assert (=> b!393424 m!390167))

(declare-fun m!390169 () Bool)

(assert (=> bm!27758 m!390169))

(declare-fun m!390171 () Bool)

(assert (=> b!393430 m!390171))

(declare-fun m!390173 () Bool)

(assert (=> b!393430 m!390173))

(declare-fun m!390175 () Bool)

(assert (=> b!393430 m!390175))

(declare-fun m!390177 () Bool)

(assert (=> b!393430 m!390177))

(assert (=> b!393430 m!390173))

(declare-fun m!390179 () Bool)

(assert (=> b!393430 m!390179))

(assert (=> b!393430 m!390157))

(assert (=> b!393430 m!390175))

(declare-fun m!390181 () Bool)

(assert (=> b!393430 m!390181))

(declare-fun m!390183 () Bool)

(assert (=> b!393430 m!390183))

(assert (=> b!393430 m!390177))

(assert (=> b!393423 m!390157))

(assert (=> b!393423 m!390157))

(assert (=> b!393423 m!390161))

(assert (=> b!393426 m!390173))

(assert (=> b!393426 m!390177))

(assert (=> b!393426 m!390173))

(assert (=> b!393426 m!390179))

(assert (=> b!393426 m!390157))

(assert (=> b!393426 m!390157))

(declare-fun m!390185 () Bool)

(assert (=> b!393426 m!390185))

(assert (=> b!393426 m!390177))

(declare-fun m!390187 () Bool)

(assert (=> d!73249 m!390187))

(assert (=> d!73249 m!390075))

(declare-fun m!390189 () Bool)

(assert (=> b!393422 m!390189))

(assert (=> b!393429 m!390169))

(assert (=> b!393295 d!73249))

(declare-fun b!393477 () Bool)

(declare-fun e!238226 () Bool)

(assert (=> b!393477 (= e!238226 (validKeyInArray!0 (select (arr!11114 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393478 () Bool)

(declare-fun e!238229 () Bool)

(declare-fun call!27779 () Bool)

(assert (=> b!393478 (= e!238229 (not call!27779))))

(declare-fun b!393479 () Bool)

(declare-fun e!238234 () Bool)

(declare-fun lt!186298 () ListLongMap!5391)

(assert (=> b!393479 (= e!238234 (= (apply!307 lt!186298 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!393480 () Bool)

(declare-fun e!238225 () Bool)

(declare-fun e!238228 () Bool)

(assert (=> b!393480 (= e!238225 e!238228)))

(declare-fun res!225460 () Bool)

(assert (=> b!393480 (=> (not res!225460) (not e!238228))))

(assert (=> b!393480 (= res!225460 (contains!2450 lt!186298 (select (arr!11114 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!393480 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 _keys!658)))))

(declare-fun b!393481 () Bool)

(declare-fun e!238230 () Unit!11997)

(declare-fun Unit!12001 () Unit!11997)

(assert (=> b!393481 (= e!238230 Unit!12001)))

(declare-fun b!393482 () Bool)

(declare-fun res!225462 () Bool)

(declare-fun e!238224 () Bool)

(assert (=> b!393482 (=> (not res!225462) (not e!238224))))

(assert (=> b!393482 (= res!225462 e!238225)))

(declare-fun res!225458 () Bool)

(assert (=> b!393482 (=> res!225458 e!238225)))

(assert (=> b!393482 (= res!225458 (not e!238226))))

(declare-fun res!225459 () Bool)

(assert (=> b!393482 (=> (not res!225459) (not e!238226))))

(assert (=> b!393482 (= res!225459 (bvslt #b00000000000000000000000000000000 (size!11466 _keys!658)))))

(declare-fun b!393483 () Bool)

(declare-fun e!238235 () ListLongMap!5391)

(declare-fun e!238232 () ListLongMap!5391)

(assert (=> b!393483 (= e!238235 e!238232)))

(declare-fun c!54439 () Bool)

(assert (=> b!393483 (= c!54439 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!393484 () Bool)

(declare-fun e!238227 () Bool)

(declare-fun e!238223 () Bool)

(assert (=> b!393484 (= e!238227 e!238223)))

(declare-fun res!225463 () Bool)

(declare-fun call!27782 () Bool)

(assert (=> b!393484 (= res!225463 call!27782)))

(assert (=> b!393484 (=> (not res!225463) (not e!238223))))

(declare-fun b!393485 () Bool)

(declare-fun e!238233 () ListLongMap!5391)

(declare-fun call!27780 () ListLongMap!5391)

(assert (=> b!393485 (= e!238233 call!27780)))

(declare-fun bm!27773 () Bool)

(assert (=> bm!27773 (= call!27782 (contains!2450 lt!186298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!393487 () Bool)

(assert (=> b!393487 (= e!238229 e!238234)))

(declare-fun res!225464 () Bool)

(assert (=> b!393487 (= res!225464 call!27779)))

(assert (=> b!393487 (=> (not res!225464) (not e!238234))))

(declare-fun b!393488 () Bool)

(declare-fun lt!186289 () Unit!11997)

(assert (=> b!393488 (= e!238230 lt!186289)))

(declare-fun lt!186295 () ListLongMap!5391)

(assert (=> b!393488 (= lt!186295 (getCurrentListMapNoExtraKeys!973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186301 () (_ BitVec 64))

(assert (=> b!393488 (= lt!186301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186288 () (_ BitVec 64))

(assert (=> b!393488 (= lt!186288 (select (arr!11114 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186287 () Unit!11997)

(declare-fun addStillContains!283 (ListLongMap!5391 (_ BitVec 64) V!14051 (_ BitVec 64)) Unit!11997)

(assert (=> b!393488 (= lt!186287 (addStillContains!283 lt!186295 lt!186301 zeroValue!472 lt!186288))))

(assert (=> b!393488 (contains!2450 (+!1065 lt!186295 (tuple2!6477 lt!186301 zeroValue!472)) lt!186288)))

(declare-fun lt!186292 () Unit!11997)

(assert (=> b!393488 (= lt!186292 lt!186287)))

(declare-fun lt!186299 () ListLongMap!5391)

(assert (=> b!393488 (= lt!186299 (getCurrentListMapNoExtraKeys!973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186296 () (_ BitVec 64))

(assert (=> b!393488 (= lt!186296 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186284 () (_ BitVec 64))

(assert (=> b!393488 (= lt!186284 (select (arr!11114 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186302 () Unit!11997)

(declare-fun addApplyDifferent!283 (ListLongMap!5391 (_ BitVec 64) V!14051 (_ BitVec 64)) Unit!11997)

(assert (=> b!393488 (= lt!186302 (addApplyDifferent!283 lt!186299 lt!186296 minValue!472 lt!186284))))

(assert (=> b!393488 (= (apply!307 (+!1065 lt!186299 (tuple2!6477 lt!186296 minValue!472)) lt!186284) (apply!307 lt!186299 lt!186284))))

(declare-fun lt!186290 () Unit!11997)

(assert (=> b!393488 (= lt!186290 lt!186302)))

(declare-fun lt!186285 () ListLongMap!5391)

(assert (=> b!393488 (= lt!186285 (getCurrentListMapNoExtraKeys!973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186293 () (_ BitVec 64))

(assert (=> b!393488 (= lt!186293 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186297 () (_ BitVec 64))

(assert (=> b!393488 (= lt!186297 (select (arr!11114 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186282 () Unit!11997)

(assert (=> b!393488 (= lt!186282 (addApplyDifferent!283 lt!186285 lt!186293 zeroValue!472 lt!186297))))

(assert (=> b!393488 (= (apply!307 (+!1065 lt!186285 (tuple2!6477 lt!186293 zeroValue!472)) lt!186297) (apply!307 lt!186285 lt!186297))))

(declare-fun lt!186281 () Unit!11997)

(assert (=> b!393488 (= lt!186281 lt!186282)))

(declare-fun lt!186286 () ListLongMap!5391)

(assert (=> b!393488 (= lt!186286 (getCurrentListMapNoExtraKeys!973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186294 () (_ BitVec 64))

(assert (=> b!393488 (= lt!186294 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186283 () (_ BitVec 64))

(assert (=> b!393488 (= lt!186283 (select (arr!11114 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!393488 (= lt!186289 (addApplyDifferent!283 lt!186286 lt!186294 minValue!472 lt!186283))))

(assert (=> b!393488 (= (apply!307 (+!1065 lt!186286 (tuple2!6477 lt!186294 minValue!472)) lt!186283) (apply!307 lt!186286 lt!186283))))

(declare-fun b!393489 () Bool)

(assert (=> b!393489 (= e!238224 e!238229)))

(declare-fun c!54442 () Bool)

(assert (=> b!393489 (= c!54442 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!393490 () Bool)

(assert (=> b!393490 (= e!238227 (not call!27782))))

(declare-fun bm!27774 () Bool)

(declare-fun call!27778 () ListLongMap!5391)

(declare-fun call!27781 () ListLongMap!5391)

(assert (=> bm!27774 (= call!27778 call!27781)))

(declare-fun b!393491 () Bool)

(assert (=> b!393491 (= e!238232 call!27780)))

(declare-fun b!393492 () Bool)

(declare-fun e!238231 () Bool)

(assert (=> b!393492 (= e!238231 (validKeyInArray!0 (select (arr!11114 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27775 () Bool)

(declare-fun call!27777 () ListLongMap!5391)

(declare-fun c!54443 () Bool)

(declare-fun call!27776 () ListLongMap!5391)

(assert (=> bm!27775 (= call!27777 (+!1065 (ite c!54443 call!27776 (ite c!54439 call!27781 call!27778)) (ite (or c!54443 c!54439) (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27776 () Bool)

(assert (=> bm!27776 (= call!27779 (contains!2450 lt!186298 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27777 () Bool)

(assert (=> bm!27777 (= call!27781 call!27776)))

(declare-fun b!393493 () Bool)

(assert (=> b!393493 (= e!238233 call!27778)))

(declare-fun b!393494 () Bool)

(assert (=> b!393494 (= e!238228 (= (apply!307 lt!186298 (select (arr!11114 _keys!658) #b00000000000000000000000000000000)) (get!5623 (select (arr!11115 _values!506) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393494 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11467 _values!506)))))

(assert (=> b!393494 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 _keys!658)))))

(declare-fun b!393486 () Bool)

(declare-fun c!54441 () Bool)

(assert (=> b!393486 (= c!54441 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!393486 (= e!238232 e!238233)))

(declare-fun d!73251 () Bool)

(assert (=> d!73251 e!238224))

(declare-fun res!225461 () Bool)

(assert (=> d!73251 (=> (not res!225461) (not e!238224))))

(assert (=> d!73251 (= res!225461 (or (bvsge #b00000000000000000000000000000000 (size!11466 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 _keys!658)))))))

(declare-fun lt!186291 () ListLongMap!5391)

(assert (=> d!73251 (= lt!186298 lt!186291)))

(declare-fun lt!186300 () Unit!11997)

(assert (=> d!73251 (= lt!186300 e!238230)))

(declare-fun c!54440 () Bool)

(assert (=> d!73251 (= c!54440 e!238231)))

(declare-fun res!225457 () Bool)

(assert (=> d!73251 (=> (not res!225457) (not e!238231))))

(assert (=> d!73251 (= res!225457 (bvslt #b00000000000000000000000000000000 (size!11466 _keys!658)))))

(assert (=> d!73251 (= lt!186291 e!238235)))

(assert (=> d!73251 (= c!54443 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73251 (validMask!0 mask!970)))

(assert (=> d!73251 (= (getCurrentListMap!2084 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186298)))

(declare-fun b!393495 () Bool)

(assert (=> b!393495 (= e!238235 (+!1065 call!27777 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!393496 () Bool)

(assert (=> b!393496 (= e!238223 (= (apply!307 lt!186298 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27778 () Bool)

(assert (=> bm!27778 (= call!27780 call!27777)))

(declare-fun bm!27779 () Bool)

(assert (=> bm!27779 (= call!27776 (getCurrentListMapNoExtraKeys!973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393497 () Bool)

(declare-fun res!225465 () Bool)

(assert (=> b!393497 (=> (not res!225465) (not e!238224))))

(assert (=> b!393497 (= res!225465 e!238227)))

(declare-fun c!54444 () Bool)

(assert (=> b!393497 (= c!54444 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!73251 c!54443) b!393495))

(assert (= (and d!73251 (not c!54443)) b!393483))

(assert (= (and b!393483 c!54439) b!393491))

(assert (= (and b!393483 (not c!54439)) b!393486))

(assert (= (and b!393486 c!54441) b!393485))

(assert (= (and b!393486 (not c!54441)) b!393493))

(assert (= (or b!393485 b!393493) bm!27774))

(assert (= (or b!393491 bm!27774) bm!27777))

(assert (= (or b!393491 b!393485) bm!27778))

(assert (= (or b!393495 bm!27777) bm!27779))

(assert (= (or b!393495 bm!27778) bm!27775))

(assert (= (and d!73251 res!225457) b!393492))

(assert (= (and d!73251 c!54440) b!393488))

(assert (= (and d!73251 (not c!54440)) b!393481))

(assert (= (and d!73251 res!225461) b!393482))

(assert (= (and b!393482 res!225459) b!393477))

(assert (= (and b!393482 (not res!225458)) b!393480))

(assert (= (and b!393480 res!225460) b!393494))

(assert (= (and b!393482 res!225462) b!393497))

(assert (= (and b!393497 c!54444) b!393484))

(assert (= (and b!393497 (not c!54444)) b!393490))

(assert (= (and b!393484 res!225463) b!393496))

(assert (= (or b!393484 b!393490) bm!27773))

(assert (= (and b!393497 res!225465) b!393489))

(assert (= (and b!393489 c!54442) b!393487))

(assert (= (and b!393489 (not c!54442)) b!393478))

(assert (= (and b!393487 res!225464) b!393479))

(assert (= (or b!393487 b!393478) bm!27776))

(declare-fun b_lambda!8793 () Bool)

(assert (=> (not b_lambda!8793) (not b!393494)))

(assert (=> b!393494 t!11491))

(declare-fun b_and!16423 () Bool)

(assert (= b_and!16421 (and (=> t!11491 result!5759) b_and!16423)))

(declare-fun m!390191 () Bool)

(assert (=> b!393496 m!390191))

(declare-fun m!390193 () Bool)

(assert (=> b!393495 m!390193))

(declare-fun m!390195 () Bool)

(assert (=> b!393488 m!390195))

(declare-fun m!390197 () Bool)

(assert (=> b!393488 m!390197))

(declare-fun m!390199 () Bool)

(assert (=> b!393488 m!390199))

(declare-fun m!390201 () Bool)

(assert (=> b!393488 m!390201))

(declare-fun m!390203 () Bool)

(assert (=> b!393488 m!390203))

(declare-fun m!390205 () Bool)

(assert (=> b!393488 m!390205))

(declare-fun m!390207 () Bool)

(assert (=> b!393488 m!390207))

(assert (=> b!393488 m!390157))

(declare-fun m!390209 () Bool)

(assert (=> b!393488 m!390209))

(declare-fun m!390211 () Bool)

(assert (=> b!393488 m!390211))

(assert (=> b!393488 m!390203))

(declare-fun m!390213 () Bool)

(assert (=> b!393488 m!390213))

(declare-fun m!390215 () Bool)

(assert (=> b!393488 m!390215))

(declare-fun m!390217 () Bool)

(assert (=> b!393488 m!390217))

(assert (=> b!393488 m!390215))

(declare-fun m!390219 () Bool)

(assert (=> b!393488 m!390219))

(assert (=> b!393488 m!390205))

(declare-fun m!390221 () Bool)

(assert (=> b!393488 m!390221))

(declare-fun m!390223 () Bool)

(assert (=> b!393488 m!390223))

(assert (=> b!393488 m!390053))

(assert (=> b!393488 m!390221))

(assert (=> d!73251 m!390075))

(assert (=> b!393477 m!390157))

(assert (=> b!393477 m!390157))

(assert (=> b!393477 m!390161))

(declare-fun m!390225 () Bool)

(assert (=> bm!27775 m!390225))

(assert (=> b!393492 m!390157))

(assert (=> b!393492 m!390157))

(assert (=> b!393492 m!390161))

(declare-fun m!390227 () Bool)

(assert (=> bm!27773 m!390227))

(assert (=> b!393494 m!390173))

(assert (=> b!393494 m!390157))

(declare-fun m!390229 () Bool)

(assert (=> b!393494 m!390229))

(assert (=> b!393494 m!390157))

(assert (=> b!393494 m!390177))

(assert (=> b!393494 m!390173))

(assert (=> b!393494 m!390179))

(assert (=> b!393494 m!390177))

(assert (=> bm!27779 m!390053))

(declare-fun m!390231 () Bool)

(assert (=> bm!27776 m!390231))

(assert (=> b!393480 m!390157))

(assert (=> b!393480 m!390157))

(declare-fun m!390233 () Bool)

(assert (=> b!393480 m!390233))

(declare-fun m!390235 () Bool)

(assert (=> b!393479 m!390235))

(assert (=> b!393295 d!73251))

(declare-fun b!393498 () Bool)

(declare-fun e!238239 () Bool)

(assert (=> b!393498 (= e!238239 (validKeyInArray!0 (select (arr!11114 lt!186154) #b00000000000000000000000000000000)))))

(declare-fun b!393499 () Bool)

(declare-fun e!238242 () Bool)

(declare-fun call!27786 () Bool)

(assert (=> b!393499 (= e!238242 (not call!27786))))

(declare-fun b!393500 () Bool)

(declare-fun e!238247 () Bool)

(declare-fun lt!186320 () ListLongMap!5391)

(assert (=> b!393500 (= e!238247 (= (apply!307 lt!186320 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!393501 () Bool)

(declare-fun e!238238 () Bool)

(declare-fun e!238241 () Bool)

(assert (=> b!393501 (= e!238238 e!238241)))

(declare-fun res!225469 () Bool)

(assert (=> b!393501 (=> (not res!225469) (not e!238241))))

(assert (=> b!393501 (= res!225469 (contains!2450 lt!186320 (select (arr!11114 lt!186154) #b00000000000000000000000000000000)))))

(assert (=> b!393501 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 lt!186154)))))

(declare-fun b!393502 () Bool)

(declare-fun e!238243 () Unit!11997)

(declare-fun Unit!12002 () Unit!11997)

(assert (=> b!393502 (= e!238243 Unit!12002)))

(declare-fun b!393503 () Bool)

(declare-fun res!225471 () Bool)

(declare-fun e!238237 () Bool)

(assert (=> b!393503 (=> (not res!225471) (not e!238237))))

(assert (=> b!393503 (= res!225471 e!238238)))

(declare-fun res!225467 () Bool)

(assert (=> b!393503 (=> res!225467 e!238238)))

(assert (=> b!393503 (= res!225467 (not e!238239))))

(declare-fun res!225468 () Bool)

(assert (=> b!393503 (=> (not res!225468) (not e!238239))))

(assert (=> b!393503 (= res!225468 (bvslt #b00000000000000000000000000000000 (size!11466 lt!186154)))))

(declare-fun b!393504 () Bool)

(declare-fun e!238248 () ListLongMap!5391)

(declare-fun e!238245 () ListLongMap!5391)

(assert (=> b!393504 (= e!238248 e!238245)))

(declare-fun c!54445 () Bool)

(assert (=> b!393504 (= c!54445 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!393505 () Bool)

(declare-fun e!238240 () Bool)

(declare-fun e!238236 () Bool)

(assert (=> b!393505 (= e!238240 e!238236)))

(declare-fun res!225472 () Bool)

(declare-fun call!27789 () Bool)

(assert (=> b!393505 (= res!225472 call!27789)))

(assert (=> b!393505 (=> (not res!225472) (not e!238236))))

(declare-fun b!393506 () Bool)

(declare-fun e!238246 () ListLongMap!5391)

(declare-fun call!27787 () ListLongMap!5391)

(assert (=> b!393506 (= e!238246 call!27787)))

(declare-fun bm!27780 () Bool)

(assert (=> bm!27780 (= call!27789 (contains!2450 lt!186320 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!393508 () Bool)

(assert (=> b!393508 (= e!238242 e!238247)))

(declare-fun res!225473 () Bool)

(assert (=> b!393508 (= res!225473 call!27786)))

(assert (=> b!393508 (=> (not res!225473) (not e!238247))))

(declare-fun b!393509 () Bool)

(declare-fun lt!186311 () Unit!11997)

(assert (=> b!393509 (= e!238243 lt!186311)))

(declare-fun lt!186317 () ListLongMap!5391)

(assert (=> b!393509 (= lt!186317 (getCurrentListMapNoExtraKeys!973 lt!186154 lt!186158 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186323 () (_ BitVec 64))

(assert (=> b!393509 (= lt!186323 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186310 () (_ BitVec 64))

(assert (=> b!393509 (= lt!186310 (select (arr!11114 lt!186154) #b00000000000000000000000000000000))))

(declare-fun lt!186309 () Unit!11997)

(assert (=> b!393509 (= lt!186309 (addStillContains!283 lt!186317 lt!186323 zeroValue!472 lt!186310))))

(assert (=> b!393509 (contains!2450 (+!1065 lt!186317 (tuple2!6477 lt!186323 zeroValue!472)) lt!186310)))

(declare-fun lt!186314 () Unit!11997)

(assert (=> b!393509 (= lt!186314 lt!186309)))

(declare-fun lt!186321 () ListLongMap!5391)

(assert (=> b!393509 (= lt!186321 (getCurrentListMapNoExtraKeys!973 lt!186154 lt!186158 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186318 () (_ BitVec 64))

(assert (=> b!393509 (= lt!186318 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186306 () (_ BitVec 64))

(assert (=> b!393509 (= lt!186306 (select (arr!11114 lt!186154) #b00000000000000000000000000000000))))

(declare-fun lt!186324 () Unit!11997)

(assert (=> b!393509 (= lt!186324 (addApplyDifferent!283 lt!186321 lt!186318 minValue!472 lt!186306))))

(assert (=> b!393509 (= (apply!307 (+!1065 lt!186321 (tuple2!6477 lt!186318 minValue!472)) lt!186306) (apply!307 lt!186321 lt!186306))))

(declare-fun lt!186312 () Unit!11997)

(assert (=> b!393509 (= lt!186312 lt!186324)))

(declare-fun lt!186307 () ListLongMap!5391)

(assert (=> b!393509 (= lt!186307 (getCurrentListMapNoExtraKeys!973 lt!186154 lt!186158 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186315 () (_ BitVec 64))

(assert (=> b!393509 (= lt!186315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186319 () (_ BitVec 64))

(assert (=> b!393509 (= lt!186319 (select (arr!11114 lt!186154) #b00000000000000000000000000000000))))

(declare-fun lt!186304 () Unit!11997)

(assert (=> b!393509 (= lt!186304 (addApplyDifferent!283 lt!186307 lt!186315 zeroValue!472 lt!186319))))

(assert (=> b!393509 (= (apply!307 (+!1065 lt!186307 (tuple2!6477 lt!186315 zeroValue!472)) lt!186319) (apply!307 lt!186307 lt!186319))))

(declare-fun lt!186303 () Unit!11997)

(assert (=> b!393509 (= lt!186303 lt!186304)))

(declare-fun lt!186308 () ListLongMap!5391)

(assert (=> b!393509 (= lt!186308 (getCurrentListMapNoExtraKeys!973 lt!186154 lt!186158 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186316 () (_ BitVec 64))

(assert (=> b!393509 (= lt!186316 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186305 () (_ BitVec 64))

(assert (=> b!393509 (= lt!186305 (select (arr!11114 lt!186154) #b00000000000000000000000000000000))))

(assert (=> b!393509 (= lt!186311 (addApplyDifferent!283 lt!186308 lt!186316 minValue!472 lt!186305))))

(assert (=> b!393509 (= (apply!307 (+!1065 lt!186308 (tuple2!6477 lt!186316 minValue!472)) lt!186305) (apply!307 lt!186308 lt!186305))))

(declare-fun b!393510 () Bool)

(assert (=> b!393510 (= e!238237 e!238242)))

(declare-fun c!54448 () Bool)

(assert (=> b!393510 (= c!54448 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!393511 () Bool)

(assert (=> b!393511 (= e!238240 (not call!27789))))

(declare-fun bm!27781 () Bool)

(declare-fun call!27785 () ListLongMap!5391)

(declare-fun call!27788 () ListLongMap!5391)

(assert (=> bm!27781 (= call!27785 call!27788)))

(declare-fun b!393512 () Bool)

(assert (=> b!393512 (= e!238245 call!27787)))

(declare-fun b!393513 () Bool)

(declare-fun e!238244 () Bool)

(assert (=> b!393513 (= e!238244 (validKeyInArray!0 (select (arr!11114 lt!186154) #b00000000000000000000000000000000)))))

(declare-fun c!54449 () Bool)

(declare-fun call!27784 () ListLongMap!5391)

(declare-fun bm!27782 () Bool)

(declare-fun call!27783 () ListLongMap!5391)

(assert (=> bm!27782 (= call!27784 (+!1065 (ite c!54449 call!27783 (ite c!54445 call!27788 call!27785)) (ite (or c!54449 c!54445) (tuple2!6477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27783 () Bool)

(assert (=> bm!27783 (= call!27786 (contains!2450 lt!186320 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27784 () Bool)

(assert (=> bm!27784 (= call!27788 call!27783)))

(declare-fun b!393514 () Bool)

(assert (=> b!393514 (= e!238246 call!27785)))

(declare-fun b!393515 () Bool)

(assert (=> b!393515 (= e!238241 (= (apply!307 lt!186320 (select (arr!11114 lt!186154) #b00000000000000000000000000000000)) (get!5623 (select (arr!11115 lt!186158) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393515 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11467 lt!186158)))))

(assert (=> b!393515 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 lt!186154)))))

(declare-fun b!393507 () Bool)

(declare-fun c!54447 () Bool)

(assert (=> b!393507 (= c!54447 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!393507 (= e!238245 e!238246)))

(declare-fun d!73253 () Bool)

(assert (=> d!73253 e!238237))

(declare-fun res!225470 () Bool)

(assert (=> d!73253 (=> (not res!225470) (not e!238237))))

(assert (=> d!73253 (= res!225470 (or (bvsge #b00000000000000000000000000000000 (size!11466 lt!186154)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 lt!186154)))))))

(declare-fun lt!186313 () ListLongMap!5391)

(assert (=> d!73253 (= lt!186320 lt!186313)))

(declare-fun lt!186322 () Unit!11997)

(assert (=> d!73253 (= lt!186322 e!238243)))

(declare-fun c!54446 () Bool)

(assert (=> d!73253 (= c!54446 e!238244)))

(declare-fun res!225466 () Bool)

(assert (=> d!73253 (=> (not res!225466) (not e!238244))))

(assert (=> d!73253 (= res!225466 (bvslt #b00000000000000000000000000000000 (size!11466 lt!186154)))))

(assert (=> d!73253 (= lt!186313 e!238248)))

(assert (=> d!73253 (= c!54449 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73253 (validMask!0 mask!970)))

(assert (=> d!73253 (= (getCurrentListMap!2084 lt!186154 lt!186158 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186320)))

(declare-fun b!393516 () Bool)

(assert (=> b!393516 (= e!238248 (+!1065 call!27784 (tuple2!6477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!393517 () Bool)

(assert (=> b!393517 (= e!238236 (= (apply!307 lt!186320 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27785 () Bool)

(assert (=> bm!27785 (= call!27787 call!27784)))

(declare-fun bm!27786 () Bool)

(assert (=> bm!27786 (= call!27783 (getCurrentListMapNoExtraKeys!973 lt!186154 lt!186158 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393518 () Bool)

(declare-fun res!225474 () Bool)

(assert (=> b!393518 (=> (not res!225474) (not e!238237))))

(assert (=> b!393518 (= res!225474 e!238240)))

(declare-fun c!54450 () Bool)

(assert (=> b!393518 (= c!54450 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!73253 c!54449) b!393516))

(assert (= (and d!73253 (not c!54449)) b!393504))

(assert (= (and b!393504 c!54445) b!393512))

(assert (= (and b!393504 (not c!54445)) b!393507))

(assert (= (and b!393507 c!54447) b!393506))

(assert (= (and b!393507 (not c!54447)) b!393514))

(assert (= (or b!393506 b!393514) bm!27781))

(assert (= (or b!393512 bm!27781) bm!27784))

(assert (= (or b!393512 b!393506) bm!27785))

(assert (= (or b!393516 bm!27784) bm!27786))

(assert (= (or b!393516 bm!27785) bm!27782))

(assert (= (and d!73253 res!225466) b!393513))

(assert (= (and d!73253 c!54446) b!393509))

(assert (= (and d!73253 (not c!54446)) b!393502))

(assert (= (and d!73253 res!225470) b!393503))

(assert (= (and b!393503 res!225468) b!393498))

(assert (= (and b!393503 (not res!225467)) b!393501))

(assert (= (and b!393501 res!225469) b!393515))

(assert (= (and b!393503 res!225471) b!393518))

(assert (= (and b!393518 c!54450) b!393505))

(assert (= (and b!393518 (not c!54450)) b!393511))

(assert (= (and b!393505 res!225472) b!393517))

(assert (= (or b!393505 b!393511) bm!27780))

(assert (= (and b!393518 res!225474) b!393510))

(assert (= (and b!393510 c!54448) b!393508))

(assert (= (and b!393510 (not c!54448)) b!393499))

(assert (= (and b!393508 res!225473) b!393500))

(assert (= (or b!393508 b!393499) bm!27783))

(declare-fun b_lambda!8795 () Bool)

(assert (=> (not b_lambda!8795) (not b!393515)))

(assert (=> b!393515 t!11491))

(declare-fun b_and!16425 () Bool)

(assert (= b_and!16423 (and (=> t!11491 result!5759) b_and!16425)))

(declare-fun m!390237 () Bool)

(assert (=> b!393517 m!390237))

(declare-fun m!390239 () Bool)

(assert (=> b!393516 m!390239))

(declare-fun m!390241 () Bool)

(assert (=> b!393509 m!390241))

(declare-fun m!390243 () Bool)

(assert (=> b!393509 m!390243))

(declare-fun m!390245 () Bool)

(assert (=> b!393509 m!390245))

(declare-fun m!390247 () Bool)

(assert (=> b!393509 m!390247))

(declare-fun m!390249 () Bool)

(assert (=> b!393509 m!390249))

(declare-fun m!390251 () Bool)

(assert (=> b!393509 m!390251))

(declare-fun m!390253 () Bool)

(assert (=> b!393509 m!390253))

(declare-fun m!390255 () Bool)

(assert (=> b!393509 m!390255))

(declare-fun m!390257 () Bool)

(assert (=> b!393509 m!390257))

(declare-fun m!390259 () Bool)

(assert (=> b!393509 m!390259))

(assert (=> b!393509 m!390249))

(declare-fun m!390261 () Bool)

(assert (=> b!393509 m!390261))

(declare-fun m!390263 () Bool)

(assert (=> b!393509 m!390263))

(declare-fun m!390265 () Bool)

(assert (=> b!393509 m!390265))

(assert (=> b!393509 m!390263))

(declare-fun m!390267 () Bool)

(assert (=> b!393509 m!390267))

(assert (=> b!393509 m!390251))

(declare-fun m!390269 () Bool)

(assert (=> b!393509 m!390269))

(declare-fun m!390271 () Bool)

(assert (=> b!393509 m!390271))

(assert (=> b!393509 m!390055))

(assert (=> b!393509 m!390269))

(assert (=> d!73253 m!390075))

(assert (=> b!393498 m!390255))

(assert (=> b!393498 m!390255))

(declare-fun m!390273 () Bool)

(assert (=> b!393498 m!390273))

(declare-fun m!390275 () Bool)

(assert (=> bm!27782 m!390275))

(assert (=> b!393513 m!390255))

(assert (=> b!393513 m!390255))

(assert (=> b!393513 m!390273))

(declare-fun m!390277 () Bool)

(assert (=> bm!27780 m!390277))

(assert (=> b!393515 m!390173))

(assert (=> b!393515 m!390255))

(declare-fun m!390279 () Bool)

(assert (=> b!393515 m!390279))

(assert (=> b!393515 m!390255))

(declare-fun m!390281 () Bool)

(assert (=> b!393515 m!390281))

(assert (=> b!393515 m!390173))

(declare-fun m!390283 () Bool)

(assert (=> b!393515 m!390283))

(assert (=> b!393515 m!390281))

(assert (=> bm!27786 m!390055))

(declare-fun m!390285 () Bool)

(assert (=> bm!27783 m!390285))

(assert (=> b!393501 m!390255))

(assert (=> b!393501 m!390255))

(declare-fun m!390287 () Bool)

(assert (=> b!393501 m!390287))

(declare-fun m!390289 () Bool)

(assert (=> b!393500 m!390289))

(assert (=> b!393295 d!73253))

(declare-fun d!73255 () Bool)

(declare-fun e!238251 () Bool)

(assert (=> d!73255 e!238251))

(declare-fun res!225479 () Bool)

(assert (=> d!73255 (=> (not res!225479) (not e!238251))))

(declare-fun lt!186336 () ListLongMap!5391)

(assert (=> d!73255 (= res!225479 (contains!2450 lt!186336 (_1!3249 (tuple2!6477 k0!778 v!373))))))

(declare-fun lt!186333 () List!6324)

(assert (=> d!73255 (= lt!186336 (ListLongMap!5392 lt!186333))))

(declare-fun lt!186334 () Unit!11997)

(declare-fun lt!186335 () Unit!11997)

(assert (=> d!73255 (= lt!186334 lt!186335)))

(declare-datatypes ((Option!372 0))(
  ( (Some!371 (v!7143 V!14051)) (None!370) )
))
(declare-fun getValueByKey!366 (List!6324 (_ BitVec 64)) Option!372)

(assert (=> d!73255 (= (getValueByKey!366 lt!186333 (_1!3249 (tuple2!6477 k0!778 v!373))) (Some!371 (_2!3249 (tuple2!6477 k0!778 v!373))))))

(declare-fun lemmaContainsTupThenGetReturnValue!188 (List!6324 (_ BitVec 64) V!14051) Unit!11997)

(assert (=> d!73255 (= lt!186335 (lemmaContainsTupThenGetReturnValue!188 lt!186333 (_1!3249 (tuple2!6477 k0!778 v!373)) (_2!3249 (tuple2!6477 k0!778 v!373))))))

(declare-fun insertStrictlySorted!191 (List!6324 (_ BitVec 64) V!14051) List!6324)

(assert (=> d!73255 (= lt!186333 (insertStrictlySorted!191 (toList!2711 lt!186159) (_1!3249 (tuple2!6477 k0!778 v!373)) (_2!3249 (tuple2!6477 k0!778 v!373))))))

(assert (=> d!73255 (= (+!1065 lt!186159 (tuple2!6477 k0!778 v!373)) lt!186336)))

(declare-fun b!393523 () Bool)

(declare-fun res!225480 () Bool)

(assert (=> b!393523 (=> (not res!225480) (not e!238251))))

(assert (=> b!393523 (= res!225480 (= (getValueByKey!366 (toList!2711 lt!186336) (_1!3249 (tuple2!6477 k0!778 v!373))) (Some!371 (_2!3249 (tuple2!6477 k0!778 v!373)))))))

(declare-fun b!393524 () Bool)

(declare-fun contains!2451 (List!6324 tuple2!6476) Bool)

(assert (=> b!393524 (= e!238251 (contains!2451 (toList!2711 lt!186336) (tuple2!6477 k0!778 v!373)))))

(assert (= (and d!73255 res!225479) b!393523))

(assert (= (and b!393523 res!225480) b!393524))

(declare-fun m!390291 () Bool)

(assert (=> d!73255 m!390291))

(declare-fun m!390293 () Bool)

(assert (=> d!73255 m!390293))

(declare-fun m!390295 () Bool)

(assert (=> d!73255 m!390295))

(declare-fun m!390297 () Bool)

(assert (=> d!73255 m!390297))

(declare-fun m!390299 () Bool)

(assert (=> b!393523 m!390299))

(declare-fun m!390301 () Bool)

(assert (=> b!393524 m!390301))

(assert (=> b!393295 d!73255))

(declare-fun bm!27791 () Bool)

(declare-fun call!27795 () ListLongMap!5391)

(assert (=> bm!27791 (= call!27795 (getCurrentListMapNoExtraKeys!973 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393531 () Bool)

(declare-fun call!27794 () ListLongMap!5391)

(declare-fun e!238256 () Bool)

(assert (=> b!393531 (= e!238256 (= call!27794 (+!1065 call!27795 (tuple2!6477 k0!778 v!373))))))

(declare-fun b!393532 () Bool)

(declare-fun e!238257 () Bool)

(assert (=> b!393532 (= e!238257 e!238256)))

(declare-fun c!54453 () Bool)

(assert (=> b!393532 (= c!54453 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun d!73257 () Bool)

(assert (=> d!73257 e!238257))

(declare-fun res!225483 () Bool)

(assert (=> d!73257 (=> (not res!225483) (not e!238257))))

(assert (=> d!73257 (= res!225483 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11466 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11467 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11466 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11467 _values!506))))))))

(declare-fun lt!186339 () Unit!11997)

(declare-fun choose!1329 (array!23312 array!23314 (_ BitVec 32) (_ BitVec 32) V!14051 V!14051 (_ BitVec 32) (_ BitVec 64) V!14051 (_ BitVec 32) Int) Unit!11997)

(assert (=> d!73257 (= lt!186339 (choose!1329 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11466 _keys!658)))))

(assert (=> d!73257 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!275 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!186339)))

(declare-fun b!393533 () Bool)

(assert (=> b!393533 (= e!238256 (= call!27794 call!27795))))

(declare-fun bm!27792 () Bool)

(assert (=> bm!27792 (= call!27794 (getCurrentListMapNoExtraKeys!973 (array!23313 (store (arr!11114 _keys!658) i!548 k0!778) (size!11466 _keys!658)) (array!23315 (store (arr!11115 _values!506) i!548 (ValueCellFull!4511 v!373)) (size!11467 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!73257 res!225483) b!393532))

(assert (= (and b!393532 c!54453) b!393531))

(assert (= (and b!393532 (not c!54453)) b!393533))

(assert (= (or b!393531 b!393533) bm!27791))

(assert (= (or b!393531 b!393533) bm!27792))

(assert (=> bm!27791 m!390053))

(declare-fun m!390303 () Bool)

(assert (=> b!393531 m!390303))

(declare-fun m!390305 () Bool)

(assert (=> d!73257 m!390305))

(assert (=> bm!27792 m!390049))

(assert (=> bm!27792 m!390061))

(declare-fun m!390307 () Bool)

(assert (=> bm!27792 m!390307))

(assert (=> b!393295 d!73257))

(declare-fun b!393534 () Bool)

(declare-fun e!238261 () Bool)

(declare-fun e!238262 () Bool)

(assert (=> b!393534 (= e!238261 e!238262)))

(declare-fun c!54454 () Bool)

(declare-fun e!238258 () Bool)

(assert (=> b!393534 (= c!54454 e!238258)))

(declare-fun res!225484 () Bool)

(assert (=> b!393534 (=> (not res!225484) (not e!238258))))

(assert (=> b!393534 (= res!225484 (bvslt #b00000000000000000000000000000000 (size!11466 lt!186154)))))

(declare-fun b!393535 () Bool)

(declare-fun e!238259 () Bool)

(declare-fun lt!186340 () ListLongMap!5391)

(assert (=> b!393535 (= e!238259 (isEmpty!559 lt!186340))))

(declare-fun b!393536 () Bool)

(assert (=> b!393536 (= e!238258 (validKeyInArray!0 (select (arr!11114 lt!186154) #b00000000000000000000000000000000)))))

(assert (=> b!393536 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!393537 () Bool)

(declare-fun e!238260 () Bool)

(assert (=> b!393537 (= e!238262 e!238260)))

(assert (=> b!393537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 lt!186154)))))

(declare-fun res!225485 () Bool)

(assert (=> b!393537 (= res!225485 (contains!2450 lt!186340 (select (arr!11114 lt!186154) #b00000000000000000000000000000000)))))

(assert (=> b!393537 (=> (not res!225485) (not e!238260))))

(declare-fun d!73259 () Bool)

(assert (=> d!73259 e!238261))

(declare-fun res!225487 () Bool)

(assert (=> d!73259 (=> (not res!225487) (not e!238261))))

(assert (=> d!73259 (= res!225487 (not (contains!2450 lt!186340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!238264 () ListLongMap!5391)

(assert (=> d!73259 (= lt!186340 e!238264)))

(declare-fun c!54455 () Bool)

(assert (=> d!73259 (= c!54455 (bvsge #b00000000000000000000000000000000 (size!11466 lt!186154)))))

(assert (=> d!73259 (validMask!0 mask!970)))

(assert (=> d!73259 (= (getCurrentListMapNoExtraKeys!973 lt!186154 lt!186158 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186340)))

(declare-fun b!393538 () Bool)

(assert (=> b!393538 (= e!238264 (ListLongMap!5392 Nil!6321))))

(declare-fun b!393539 () Bool)

(assert (=> b!393539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11466 lt!186154)))))

(assert (=> b!393539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11467 lt!186158)))))

(assert (=> b!393539 (= e!238260 (= (apply!307 lt!186340 (select (arr!11114 lt!186154) #b00000000000000000000000000000000)) (get!5623 (select (arr!11115 lt!186158) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!393540 () Bool)

(declare-fun e!238263 () ListLongMap!5391)

(declare-fun call!27796 () ListLongMap!5391)

(assert (=> b!393540 (= e!238263 call!27796)))

(declare-fun b!393541 () Bool)

(declare-fun res!225486 () Bool)

(assert (=> b!393541 (=> (not res!225486) (not e!238261))))

(assert (=> b!393541 (= res!225486 (not (contains!2450 lt!186340 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!27793 () Bool)

(assert (=> bm!27793 (= call!27796 (getCurrentListMapNoExtraKeys!973 lt!186154 lt!186158 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!393542 () Bool)

(assert (=> b!393542 (= e!238259 (= lt!186340 (getCurrentListMapNoExtraKeys!973 lt!186154 lt!186158 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!393543 () Bool)

(declare-fun lt!186342 () Unit!11997)

(declare-fun lt!186341 () Unit!11997)

(assert (=> b!393543 (= lt!186342 lt!186341)))

(declare-fun lt!186344 () V!14051)

(declare-fun lt!186345 () (_ BitVec 64))

(declare-fun lt!186343 () ListLongMap!5391)

(declare-fun lt!186346 () (_ BitVec 64))

(assert (=> b!393543 (not (contains!2450 (+!1065 lt!186343 (tuple2!6477 lt!186345 lt!186344)) lt!186346))))

(assert (=> b!393543 (= lt!186341 (addStillNotContains!142 lt!186343 lt!186345 lt!186344 lt!186346))))

(assert (=> b!393543 (= lt!186346 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!393543 (= lt!186344 (get!5623 (select (arr!11115 lt!186158) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!393543 (= lt!186345 (select (arr!11114 lt!186154) #b00000000000000000000000000000000))))

(assert (=> b!393543 (= lt!186343 call!27796)))

(assert (=> b!393543 (= e!238263 (+!1065 call!27796 (tuple2!6477 (select (arr!11114 lt!186154) #b00000000000000000000000000000000) (get!5623 (select (arr!11115 lt!186158) #b00000000000000000000000000000000) (dynLambda!650 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!393544 () Bool)

(assert (=> b!393544 (= e!238264 e!238263)))

(declare-fun c!54456 () Bool)

(assert (=> b!393544 (= c!54456 (validKeyInArray!0 (select (arr!11114 lt!186154) #b00000000000000000000000000000000)))))

(declare-fun b!393545 () Bool)

(assert (=> b!393545 (= e!238262 e!238259)))

(declare-fun c!54457 () Bool)

(assert (=> b!393545 (= c!54457 (bvslt #b00000000000000000000000000000000 (size!11466 lt!186154)))))

(assert (= (and d!73259 c!54455) b!393538))

(assert (= (and d!73259 (not c!54455)) b!393544))

(assert (= (and b!393544 c!54456) b!393543))

(assert (= (and b!393544 (not c!54456)) b!393540))

(assert (= (or b!393543 b!393540) bm!27793))

(assert (= (and d!73259 res!225487) b!393541))

(assert (= (and b!393541 res!225486) b!393534))

(assert (= (and b!393534 res!225484) b!393536))

(assert (= (and b!393534 c!54454) b!393537))

(assert (= (and b!393534 (not c!54454)) b!393545))

(assert (= (and b!393537 res!225485) b!393539))

(assert (= (and b!393545 c!54457) b!393542))

(assert (= (and b!393545 (not c!54457)) b!393535))

(declare-fun b_lambda!8797 () Bool)

(assert (=> (not b_lambda!8797) (not b!393539)))

(assert (=> b!393539 t!11491))

(declare-fun b_and!16427 () Bool)

(assert (= b_and!16425 (and (=> t!11491 result!5759) b_and!16427)))

(declare-fun b_lambda!8799 () Bool)

(assert (=> (not b_lambda!8799) (not b!393543)))

(assert (=> b!393543 t!11491))

(declare-fun b_and!16429 () Bool)

(assert (= b_and!16427 (and (=> t!11491 result!5759) b_and!16429)))

(assert (=> b!393544 m!390255))

(assert (=> b!393544 m!390255))

(assert (=> b!393544 m!390273))

(declare-fun m!390309 () Bool)

(assert (=> b!393541 m!390309))

(assert (=> b!393537 m!390255))

(assert (=> b!393537 m!390255))

(declare-fun m!390311 () Bool)

(assert (=> b!393537 m!390311))

(declare-fun m!390313 () Bool)

(assert (=> bm!27793 m!390313))

(declare-fun m!390315 () Bool)

(assert (=> b!393543 m!390315))

(assert (=> b!393543 m!390173))

(declare-fun m!390317 () Bool)

(assert (=> b!393543 m!390317))

(assert (=> b!393543 m!390281))

(assert (=> b!393543 m!390173))

(assert (=> b!393543 m!390283))

(assert (=> b!393543 m!390255))

(assert (=> b!393543 m!390317))

(declare-fun m!390319 () Bool)

(assert (=> b!393543 m!390319))

(declare-fun m!390321 () Bool)

(assert (=> b!393543 m!390321))

(assert (=> b!393543 m!390281))

(assert (=> b!393536 m!390255))

(assert (=> b!393536 m!390255))

(assert (=> b!393536 m!390273))

(assert (=> b!393539 m!390173))

(assert (=> b!393539 m!390281))

(assert (=> b!393539 m!390173))

(assert (=> b!393539 m!390283))

(assert (=> b!393539 m!390255))

(assert (=> b!393539 m!390255))

(declare-fun m!390323 () Bool)

(assert (=> b!393539 m!390323))

(assert (=> b!393539 m!390281))

(declare-fun m!390325 () Bool)

(assert (=> d!73259 m!390325))

(assert (=> d!73259 m!390075))

(declare-fun m!390327 () Bool)

(assert (=> b!393535 m!390327))

(assert (=> b!393542 m!390313))

(assert (=> b!393295 d!73259))

(declare-fun bm!27796 () Bool)

(declare-fun call!27799 () Bool)

(assert (=> bm!27796 (= call!27799 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!186154 mask!970))))

(declare-fun d!73261 () Bool)

(declare-fun res!225492 () Bool)

(declare-fun e!238273 () Bool)

(assert (=> d!73261 (=> res!225492 e!238273)))

(assert (=> d!73261 (= res!225492 (bvsge #b00000000000000000000000000000000 (size!11466 lt!186154)))))

(assert (=> d!73261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186154 mask!970) e!238273)))

(declare-fun b!393554 () Bool)

(declare-fun e!238272 () Bool)

(assert (=> b!393554 (= e!238272 call!27799)))

(declare-fun b!393555 () Bool)

(assert (=> b!393555 (= e!238273 e!238272)))

(declare-fun c!54460 () Bool)

(assert (=> b!393555 (= c!54460 (validKeyInArray!0 (select (arr!11114 lt!186154) #b00000000000000000000000000000000)))))

(declare-fun b!393556 () Bool)

(declare-fun e!238271 () Bool)

(assert (=> b!393556 (= e!238271 call!27799)))

(declare-fun b!393557 () Bool)

(assert (=> b!393557 (= e!238272 e!238271)))

(declare-fun lt!186353 () (_ BitVec 64))

(assert (=> b!393557 (= lt!186353 (select (arr!11114 lt!186154) #b00000000000000000000000000000000))))

(declare-fun lt!186354 () Unit!11997)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23312 (_ BitVec 64) (_ BitVec 32)) Unit!11997)

(assert (=> b!393557 (= lt!186354 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!186154 lt!186353 #b00000000000000000000000000000000))))

(assert (=> b!393557 (arrayContainsKey!0 lt!186154 lt!186353 #b00000000000000000000000000000000)))

(declare-fun lt!186355 () Unit!11997)

(assert (=> b!393557 (= lt!186355 lt!186354)))

(declare-fun res!225493 () Bool)

(declare-datatypes ((SeekEntryResult!3467 0))(
  ( (MissingZero!3467 (index!16047 (_ BitVec 32))) (Found!3467 (index!16048 (_ BitVec 32))) (Intermediate!3467 (undefined!4279 Bool) (index!16049 (_ BitVec 32)) (x!38423 (_ BitVec 32))) (Undefined!3467) (MissingVacant!3467 (index!16050 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23312 (_ BitVec 32)) SeekEntryResult!3467)

(assert (=> b!393557 (= res!225493 (= (seekEntryOrOpen!0 (select (arr!11114 lt!186154) #b00000000000000000000000000000000) lt!186154 mask!970) (Found!3467 #b00000000000000000000000000000000)))))

(assert (=> b!393557 (=> (not res!225493) (not e!238271))))

(assert (= (and d!73261 (not res!225492)) b!393555))

(assert (= (and b!393555 c!54460) b!393557))

(assert (= (and b!393555 (not c!54460)) b!393554))

(assert (= (and b!393557 res!225493) b!393556))

(assert (= (or b!393556 b!393554) bm!27796))

(declare-fun m!390329 () Bool)

(assert (=> bm!27796 m!390329))

(assert (=> b!393555 m!390255))

(assert (=> b!393555 m!390255))

(assert (=> b!393555 m!390273))

(assert (=> b!393557 m!390255))

(declare-fun m!390331 () Bool)

(assert (=> b!393557 m!390331))

(declare-fun m!390333 () Bool)

(assert (=> b!393557 m!390333))

(assert (=> b!393557 m!390255))

(declare-fun m!390335 () Bool)

(assert (=> b!393557 m!390335))

(assert (=> b!393303 d!73261))

(declare-fun b!393558 () Bool)

(declare-fun e!238275 () Bool)

(declare-fun call!27800 () Bool)

(assert (=> b!393558 (= e!238275 call!27800)))

(declare-fun bm!27797 () Bool)

(declare-fun c!54461 () Bool)

(assert (=> bm!27797 (= call!27800 (arrayNoDuplicates!0 lt!186154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54461 (Cons!6319 (select (arr!11114 lt!186154) #b00000000000000000000000000000000) Nil!6320) Nil!6320)))))

(declare-fun b!393559 () Bool)

(declare-fun e!238277 () Bool)

(declare-fun e!238274 () Bool)

(assert (=> b!393559 (= e!238277 e!238274)))

(declare-fun res!225495 () Bool)

(assert (=> b!393559 (=> (not res!225495) (not e!238274))))

(declare-fun e!238276 () Bool)

(assert (=> b!393559 (= res!225495 (not e!238276))))

(declare-fun res!225494 () Bool)

(assert (=> b!393559 (=> (not res!225494) (not e!238276))))

(assert (=> b!393559 (= res!225494 (validKeyInArray!0 (select (arr!11114 lt!186154) #b00000000000000000000000000000000)))))

(declare-fun b!393560 () Bool)

(assert (=> b!393560 (= e!238274 e!238275)))

(assert (=> b!393560 (= c!54461 (validKeyInArray!0 (select (arr!11114 lt!186154) #b00000000000000000000000000000000)))))

(declare-fun b!393561 () Bool)

(assert (=> b!393561 (= e!238275 call!27800)))

(declare-fun b!393562 () Bool)

(assert (=> b!393562 (= e!238276 (contains!2449 Nil!6320 (select (arr!11114 lt!186154) #b00000000000000000000000000000000)))))

(declare-fun d!73263 () Bool)

(declare-fun res!225496 () Bool)

(assert (=> d!73263 (=> res!225496 e!238277)))

(assert (=> d!73263 (= res!225496 (bvsge #b00000000000000000000000000000000 (size!11466 lt!186154)))))

(assert (=> d!73263 (= (arrayNoDuplicates!0 lt!186154 #b00000000000000000000000000000000 Nil!6320) e!238277)))

(assert (= (and d!73263 (not res!225496)) b!393559))

(assert (= (and b!393559 res!225494) b!393562))

(assert (= (and b!393559 res!225495) b!393560))

(assert (= (and b!393560 c!54461) b!393561))

(assert (= (and b!393560 (not c!54461)) b!393558))

(assert (= (or b!393561 b!393558) bm!27797))

(assert (=> bm!27797 m!390255))

(declare-fun m!390337 () Bool)

(assert (=> bm!27797 m!390337))

(assert (=> b!393559 m!390255))

(assert (=> b!393559 m!390255))

(assert (=> b!393559 m!390273))

(assert (=> b!393560 m!390255))

(assert (=> b!393560 m!390255))

(assert (=> b!393560 m!390273))

(assert (=> b!393562 m!390255))

(assert (=> b!393562 m!390255))

(declare-fun m!390339 () Bool)

(assert (=> b!393562 m!390339))

(assert (=> b!393291 d!73263))

(declare-fun bm!27798 () Bool)

(declare-fun call!27801 () Bool)

(assert (=> bm!27798 (= call!27801 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun d!73265 () Bool)

(declare-fun res!225497 () Bool)

(declare-fun e!238280 () Bool)

(assert (=> d!73265 (=> res!225497 e!238280)))

(assert (=> d!73265 (= res!225497 (bvsge #b00000000000000000000000000000000 (size!11466 _keys!658)))))

(assert (=> d!73265 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!238280)))

(declare-fun b!393563 () Bool)

(declare-fun e!238279 () Bool)

(assert (=> b!393563 (= e!238279 call!27801)))

(declare-fun b!393564 () Bool)

(assert (=> b!393564 (= e!238280 e!238279)))

(declare-fun c!54462 () Bool)

(assert (=> b!393564 (= c!54462 (validKeyInArray!0 (select (arr!11114 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!393565 () Bool)

(declare-fun e!238278 () Bool)

(assert (=> b!393565 (= e!238278 call!27801)))

(declare-fun b!393566 () Bool)

(assert (=> b!393566 (= e!238279 e!238278)))

(declare-fun lt!186356 () (_ BitVec 64))

(assert (=> b!393566 (= lt!186356 (select (arr!11114 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186357 () Unit!11997)

(assert (=> b!393566 (= lt!186357 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!186356 #b00000000000000000000000000000000))))

(assert (=> b!393566 (arrayContainsKey!0 _keys!658 lt!186356 #b00000000000000000000000000000000)))

(declare-fun lt!186358 () Unit!11997)

(assert (=> b!393566 (= lt!186358 lt!186357)))

(declare-fun res!225498 () Bool)

(assert (=> b!393566 (= res!225498 (= (seekEntryOrOpen!0 (select (arr!11114 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3467 #b00000000000000000000000000000000)))))

(assert (=> b!393566 (=> (not res!225498) (not e!238278))))

(assert (= (and d!73265 (not res!225497)) b!393564))

(assert (= (and b!393564 c!54462) b!393566))

(assert (= (and b!393564 (not c!54462)) b!393563))

(assert (= (and b!393566 res!225498) b!393565))

(assert (= (or b!393565 b!393563) bm!27798))

(declare-fun m!390341 () Bool)

(assert (=> bm!27798 m!390341))

(assert (=> b!393564 m!390157))

(assert (=> b!393564 m!390157))

(assert (=> b!393564 m!390161))

(assert (=> b!393566 m!390157))

(declare-fun m!390343 () Bool)

(assert (=> b!393566 m!390343))

(declare-fun m!390345 () Bool)

(assert (=> b!393566 m!390345))

(assert (=> b!393566 m!390157))

(declare-fun m!390347 () Bool)

(assert (=> b!393566 m!390347))

(assert (=> b!393300 d!73265))

(declare-fun d!73267 () Bool)

(declare-fun res!225503 () Bool)

(declare-fun e!238285 () Bool)

(assert (=> d!73267 (=> res!225503 e!238285)))

(assert (=> d!73267 (= res!225503 (= (select (arr!11114 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73267 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!238285)))

(declare-fun b!393571 () Bool)

(declare-fun e!238286 () Bool)

(assert (=> b!393571 (= e!238285 e!238286)))

(declare-fun res!225504 () Bool)

(assert (=> b!393571 (=> (not res!225504) (not e!238286))))

(assert (=> b!393571 (= res!225504 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11466 _keys!658)))))

(declare-fun b!393572 () Bool)

(assert (=> b!393572 (= e!238286 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73267 (not res!225503)) b!393571))

(assert (= (and b!393571 res!225504) b!393572))

(assert (=> d!73267 m!390157))

(declare-fun m!390349 () Bool)

(assert (=> b!393572 m!390349))

(assert (=> b!393296 d!73267))

(declare-fun mapNonEmpty!16167 () Bool)

(declare-fun mapRes!16167 () Bool)

(declare-fun tp!31908 () Bool)

(declare-fun e!238291 () Bool)

(assert (=> mapNonEmpty!16167 (= mapRes!16167 (and tp!31908 e!238291))))

(declare-fun mapKey!16167 () (_ BitVec 32))

(declare-fun mapValue!16167 () ValueCell!4511)

(declare-fun mapRest!16167 () (Array (_ BitVec 32) ValueCell!4511))

(assert (=> mapNonEmpty!16167 (= mapRest!16158 (store mapRest!16167 mapKey!16167 mapValue!16167))))

(declare-fun mapIsEmpty!16167 () Bool)

(assert (=> mapIsEmpty!16167 mapRes!16167))

(declare-fun condMapEmpty!16167 () Bool)

(declare-fun mapDefault!16167 () ValueCell!4511)

(assert (=> mapNonEmpty!16158 (= condMapEmpty!16167 (= mapRest!16158 ((as const (Array (_ BitVec 32) ValueCell!4511)) mapDefault!16167)))))

(declare-fun e!238292 () Bool)

(assert (=> mapNonEmpty!16158 (= tp!31893 (and e!238292 mapRes!16167))))

(declare-fun b!393579 () Bool)

(assert (=> b!393579 (= e!238291 tp_is_empty!9709)))

(declare-fun b!393580 () Bool)

(assert (=> b!393580 (= e!238292 tp_is_empty!9709)))

(assert (= (and mapNonEmpty!16158 condMapEmpty!16167) mapIsEmpty!16167))

(assert (= (and mapNonEmpty!16158 (not condMapEmpty!16167)) mapNonEmpty!16167))

(assert (= (and mapNonEmpty!16167 ((_ is ValueCellFull!4511) mapValue!16167)) b!393579))

(assert (= (and mapNonEmpty!16158 ((_ is ValueCellFull!4511) mapDefault!16167)) b!393580))

(declare-fun m!390351 () Bool)

(assert (=> mapNonEmpty!16167 m!390351))

(declare-fun b_lambda!8801 () Bool)

(assert (= b_lambda!8793 (or (and start!38142 b_free!9037) b_lambda!8801)))

(declare-fun b_lambda!8803 () Bool)

(assert (= b_lambda!8789 (or (and start!38142 b_free!9037) b_lambda!8803)))

(declare-fun b_lambda!8805 () Bool)

(assert (= b_lambda!8799 (or (and start!38142 b_free!9037) b_lambda!8805)))

(declare-fun b_lambda!8807 () Bool)

(assert (= b_lambda!8791 (or (and start!38142 b_free!9037) b_lambda!8807)))

(declare-fun b_lambda!8809 () Bool)

(assert (= b_lambda!8795 (or (and start!38142 b_free!9037) b_lambda!8809)))

(declare-fun b_lambda!8811 () Bool)

(assert (= b_lambda!8797 (or (and start!38142 b_free!9037) b_lambda!8811)))

(check-sat (not b!393515) (not b!393524) (not d!73255) (not b!393535) (not b!393424) (not b!393564) (not b!393559) (not b!393555) (not bm!27780) (not b!393494) (not b!393422) (not bm!27783) (not bm!27773) (not b!393480) (not b!393396) (not bm!27792) (not b!393501) (not b!393492) (not bm!27779) (not bm!27755) (not b_lambda!8801) (not b!393488) (not d!73251) (not b!393544) (not b_lambda!8805) (not b!393566) (not b!393394) (not b!393513) (not bm!27797) (not bm!27775) (not bm!27758) (not b_lambda!8809) (not b!393562) (not b_lambda!8811) (not b!393572) (not b!393498) (not b!393428) (not b!393393) (not d!73259) (not b!393509) (not b!393496) b_and!16429 (not b!393543) (not b!393541) (not bm!27786) (not d!73253) (not bm!27796) (not bm!27793) (not b!393542) (not b!393536) (not b!393537) (not mapNonEmpty!16167) (not bm!27798) (not b!393429) (not b!393523) (not bm!27782) (not b!393539) (not b_next!9037) (not b!393560) (not b!393516) (not b!393500) (not d!73249) (not b!393477) (not b!393557) (not b!393426) (not b!393423) (not b!393531) (not b!393479) (not b_lambda!8807) (not bm!27776) (not bm!27791) tp_is_empty!9709 (not b_lambda!8803) (not b!393431) (not b!393495) (not b!393430) (not d!73257) (not b!393517))
(check-sat b_and!16429 (not b_next!9037))
