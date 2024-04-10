; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38050 () Bool)

(assert start!38050)

(declare-fun b_free!8997 () Bool)

(declare-fun b_next!8997 () Bool)

(assert (=> start!38050 (= b_free!8997 (not b_next!8997))))

(declare-fun tp!31764 () Bool)

(declare-fun b_and!16323 () Bool)

(assert (=> start!38050 (= tp!31764 b_and!16323)))

(declare-fun b!391837 () Bool)

(declare-fun e!237298 () Bool)

(declare-fun e!237297 () Bool)

(assert (=> b!391837 (= e!237298 e!237297)))

(declare-fun res!224369 () Bool)

(assert (=> b!391837 (=> (not res!224369) (not e!237297))))

(declare-datatypes ((array!23241 0))(
  ( (array!23242 (arr!11082 (Array (_ BitVec 32) (_ BitVec 64))) (size!11434 (_ BitVec 32))) )
))
(declare-fun lt!185034 () array!23241)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23241 (_ BitVec 32)) Bool)

(assert (=> b!391837 (= res!224369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185034 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23241)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391837 (= lt!185034 (array!23242 (store (arr!11082 _keys!658) i!548 k0!778) (size!11434 _keys!658)))))

(declare-fun b!391838 () Bool)

(declare-fun e!237300 () Bool)

(assert (=> b!391838 (= e!237297 (not e!237300))))

(declare-fun res!224367 () Bool)

(assert (=> b!391838 (=> res!224367 e!237300)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391838 (= res!224367 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13997 0))(
  ( (V!13998 (val!4879 Int)) )
))
(declare-datatypes ((ValueCell!4491 0))(
  ( (ValueCellFull!4491 (v!7104 V!13997)) (EmptyCell!4491) )
))
(declare-datatypes ((array!23243 0))(
  ( (array!23244 (arr!11083 (Array (_ BitVec 32) ValueCell!4491)) (size!11435 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23243)

(declare-fun zeroValue!472 () V!13997)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6576 0))(
  ( (tuple2!6577 (_1!3299 (_ BitVec 64)) (_2!3299 V!13997)) )
))
(declare-datatypes ((List!6430 0))(
  ( (Nil!6427) (Cons!6426 (h!7282 tuple2!6576) (t!11594 List!6430)) )
))
(declare-datatypes ((ListLongMap!5489 0))(
  ( (ListLongMap!5490 (toList!2760 List!6430)) )
))
(declare-fun lt!185039 () ListLongMap!5489)

(declare-fun minValue!472 () V!13997)

(declare-fun getCurrentListMap!2102 (array!23241 array!23243 (_ BitVec 32) (_ BitVec 32) V!13997 V!13997 (_ BitVec 32) Int) ListLongMap!5489)

(assert (=> b!391838 (= lt!185039 (getCurrentListMap!2102 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185040 () array!23243)

(declare-fun lt!185037 () ListLongMap!5489)

(assert (=> b!391838 (= lt!185037 (getCurrentListMap!2102 lt!185034 lt!185040 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185033 () ListLongMap!5489)

(declare-fun lt!185038 () ListLongMap!5489)

(assert (=> b!391838 (and (= lt!185033 lt!185038) (= lt!185038 lt!185033))))

(declare-fun v!373 () V!13997)

(declare-fun lt!185036 () ListLongMap!5489)

(declare-fun +!1055 (ListLongMap!5489 tuple2!6576) ListLongMap!5489)

(assert (=> b!391838 (= lt!185038 (+!1055 lt!185036 (tuple2!6577 k0!778 v!373)))))

(declare-datatypes ((Unit!11992 0))(
  ( (Unit!11993) )
))
(declare-fun lt!185035 () Unit!11992)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!266 (array!23241 array!23243 (_ BitVec 32) (_ BitVec 32) V!13997 V!13997 (_ BitVec 32) (_ BitVec 64) V!13997 (_ BitVec 32) Int) Unit!11992)

(assert (=> b!391838 (= lt!185035 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!266 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!982 (array!23241 array!23243 (_ BitVec 32) (_ BitVec 32) V!13997 V!13997 (_ BitVec 32) Int) ListLongMap!5489)

(assert (=> b!391838 (= lt!185033 (getCurrentListMapNoExtraKeys!982 lt!185034 lt!185040 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391838 (= lt!185040 (array!23244 (store (arr!11083 _values!506) i!548 (ValueCellFull!4491 v!373)) (size!11435 _values!506)))))

(assert (=> b!391838 (= lt!185036 (getCurrentListMapNoExtraKeys!982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391839 () Bool)

(declare-fun res!224373 () Bool)

(assert (=> b!391839 (=> (not res!224373) (not e!237298))))

(assert (=> b!391839 (= res!224373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391840 () Bool)

(declare-fun res!224368 () Bool)

(assert (=> b!391840 (=> (not res!224368) (not e!237298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391840 (= res!224368 (validKeyInArray!0 k0!778))))

(declare-fun b!391841 () Bool)

(assert (=> b!391841 (= e!237300 (= lt!185037 (+!1055 lt!185033 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!391842 () Bool)

(declare-fun res!224366 () Bool)

(assert (=> b!391842 (=> (not res!224366) (not e!237297))))

(declare-datatypes ((List!6431 0))(
  ( (Nil!6428) (Cons!6427 (h!7283 (_ BitVec 64)) (t!11595 List!6431)) )
))
(declare-fun arrayNoDuplicates!0 (array!23241 (_ BitVec 32) List!6431) Bool)

(assert (=> b!391842 (= res!224366 (arrayNoDuplicates!0 lt!185034 #b00000000000000000000000000000000 Nil!6428))))

(declare-fun b!391843 () Bool)

(declare-fun res!224365 () Bool)

(assert (=> b!391843 (=> (not res!224365) (not e!237298))))

(assert (=> b!391843 (= res!224365 (or (= (select (arr!11082 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11082 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391844 () Bool)

(declare-fun e!237299 () Bool)

(declare-fun e!237302 () Bool)

(declare-fun mapRes!16089 () Bool)

(assert (=> b!391844 (= e!237299 (and e!237302 mapRes!16089))))

(declare-fun condMapEmpty!16089 () Bool)

(declare-fun mapDefault!16089 () ValueCell!4491)

(assert (=> b!391844 (= condMapEmpty!16089 (= (arr!11083 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4491)) mapDefault!16089)))))

(declare-fun b!391845 () Bool)

(declare-fun res!224374 () Bool)

(assert (=> b!391845 (=> (not res!224374) (not e!237298))))

(assert (=> b!391845 (= res!224374 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11434 _keys!658))))))

(declare-fun mapIsEmpty!16089 () Bool)

(assert (=> mapIsEmpty!16089 mapRes!16089))

(declare-fun b!391847 () Bool)

(declare-fun res!224370 () Bool)

(assert (=> b!391847 (=> (not res!224370) (not e!237298))))

(assert (=> b!391847 (= res!224370 (and (= (size!11435 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11434 _keys!658) (size!11435 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391848 () Bool)

(declare-fun res!224372 () Bool)

(assert (=> b!391848 (=> (not res!224372) (not e!237298))))

(declare-fun arrayContainsKey!0 (array!23241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391848 (= res!224372 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!224371 () Bool)

(assert (=> start!38050 (=> (not res!224371) (not e!237298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38050 (= res!224371 (validMask!0 mask!970))))

(assert (=> start!38050 e!237298))

(declare-fun array_inv!8140 (array!23243) Bool)

(assert (=> start!38050 (and (array_inv!8140 _values!506) e!237299)))

(assert (=> start!38050 tp!31764))

(assert (=> start!38050 true))

(declare-fun tp_is_empty!9669 () Bool)

(assert (=> start!38050 tp_is_empty!9669))

(declare-fun array_inv!8141 (array!23241) Bool)

(assert (=> start!38050 (array_inv!8141 _keys!658)))

(declare-fun b!391846 () Bool)

(assert (=> b!391846 (= e!237302 tp_is_empty!9669)))

(declare-fun mapNonEmpty!16089 () Bool)

(declare-fun tp!31763 () Bool)

(declare-fun e!237301 () Bool)

(assert (=> mapNonEmpty!16089 (= mapRes!16089 (and tp!31763 e!237301))))

(declare-fun mapRest!16089 () (Array (_ BitVec 32) ValueCell!4491))

(declare-fun mapValue!16089 () ValueCell!4491)

(declare-fun mapKey!16089 () (_ BitVec 32))

(assert (=> mapNonEmpty!16089 (= (arr!11083 _values!506) (store mapRest!16089 mapKey!16089 mapValue!16089))))

(declare-fun b!391849 () Bool)

(assert (=> b!391849 (= e!237301 tp_is_empty!9669)))

(declare-fun b!391850 () Bool)

(declare-fun res!224364 () Bool)

(assert (=> b!391850 (=> (not res!224364) (not e!237298))))

(assert (=> b!391850 (= res!224364 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6428))))

(assert (= (and start!38050 res!224371) b!391847))

(assert (= (and b!391847 res!224370) b!391839))

(assert (= (and b!391839 res!224373) b!391850))

(assert (= (and b!391850 res!224364) b!391845))

(assert (= (and b!391845 res!224374) b!391840))

(assert (= (and b!391840 res!224368) b!391843))

(assert (= (and b!391843 res!224365) b!391848))

(assert (= (and b!391848 res!224372) b!391837))

(assert (= (and b!391837 res!224369) b!391842))

(assert (= (and b!391842 res!224366) b!391838))

(assert (= (and b!391838 (not res!224367)) b!391841))

(assert (= (and b!391844 condMapEmpty!16089) mapIsEmpty!16089))

(assert (= (and b!391844 (not condMapEmpty!16089)) mapNonEmpty!16089))

(get-info :version)

(assert (= (and mapNonEmpty!16089 ((_ is ValueCellFull!4491) mapValue!16089)) b!391849))

(assert (= (and b!391844 ((_ is ValueCellFull!4491) mapDefault!16089)) b!391846))

(assert (= start!38050 b!391844))

(declare-fun m!388233 () Bool)

(assert (=> b!391843 m!388233))

(declare-fun m!388235 () Bool)

(assert (=> b!391850 m!388235))

(declare-fun m!388237 () Bool)

(assert (=> b!391837 m!388237))

(declare-fun m!388239 () Bool)

(assert (=> b!391837 m!388239))

(declare-fun m!388241 () Bool)

(assert (=> b!391848 m!388241))

(declare-fun m!388243 () Bool)

(assert (=> b!391840 m!388243))

(declare-fun m!388245 () Bool)

(assert (=> b!391841 m!388245))

(declare-fun m!388247 () Bool)

(assert (=> b!391839 m!388247))

(declare-fun m!388249 () Bool)

(assert (=> mapNonEmpty!16089 m!388249))

(declare-fun m!388251 () Bool)

(assert (=> b!391838 m!388251))

(declare-fun m!388253 () Bool)

(assert (=> b!391838 m!388253))

(declare-fun m!388255 () Bool)

(assert (=> b!391838 m!388255))

(declare-fun m!388257 () Bool)

(assert (=> b!391838 m!388257))

(declare-fun m!388259 () Bool)

(assert (=> b!391838 m!388259))

(declare-fun m!388261 () Bool)

(assert (=> b!391838 m!388261))

(declare-fun m!388263 () Bool)

(assert (=> b!391838 m!388263))

(declare-fun m!388265 () Bool)

(assert (=> start!38050 m!388265))

(declare-fun m!388267 () Bool)

(assert (=> start!38050 m!388267))

(declare-fun m!388269 () Bool)

(assert (=> start!38050 m!388269))

(declare-fun m!388271 () Bool)

(assert (=> b!391842 m!388271))

(check-sat (not b!391841) (not b!391842) (not start!38050) (not b!391837) (not b!391848) (not b_next!8997) tp_is_empty!9669 (not b!391839) (not b!391838) (not mapNonEmpty!16089) b_and!16323 (not b!391850) (not b!391840))
(check-sat b_and!16323 (not b_next!8997))
(get-model)

(declare-fun d!73091 () Bool)

(assert (=> d!73091 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391840 d!73091))

(declare-fun bm!27630 () Bool)

(declare-fun call!27633 () Bool)

(assert (=> bm!27630 (= call!27633 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!391901 () Bool)

(declare-fun e!237332 () Bool)

(assert (=> b!391901 (= e!237332 call!27633)))

(declare-fun b!391902 () Bool)

(declare-fun e!237331 () Bool)

(assert (=> b!391902 (= e!237331 call!27633)))

(declare-fun b!391904 () Bool)

(declare-fun e!237333 () Bool)

(assert (=> b!391904 (= e!237333 e!237332)))

(declare-fun c!54284 () Bool)

(assert (=> b!391904 (= c!54284 (validKeyInArray!0 (select (arr!11082 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!73093 () Bool)

(declare-fun res!224413 () Bool)

(assert (=> d!73093 (=> res!224413 e!237333)))

(assert (=> d!73093 (= res!224413 (bvsge #b00000000000000000000000000000000 (size!11434 _keys!658)))))

(assert (=> d!73093 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!237333)))

(declare-fun b!391903 () Bool)

(assert (=> b!391903 (= e!237332 e!237331)))

(declare-fun lt!185073 () (_ BitVec 64))

(assert (=> b!391903 (= lt!185073 (select (arr!11082 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185072 () Unit!11992)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23241 (_ BitVec 64) (_ BitVec 32)) Unit!11992)

(assert (=> b!391903 (= lt!185072 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!185073 #b00000000000000000000000000000000))))

(assert (=> b!391903 (arrayContainsKey!0 _keys!658 lt!185073 #b00000000000000000000000000000000)))

(declare-fun lt!185071 () Unit!11992)

(assert (=> b!391903 (= lt!185071 lt!185072)))

(declare-fun res!224412 () Bool)

(declare-datatypes ((SeekEntryResult!3515 0))(
  ( (MissingZero!3515 (index!16239 (_ BitVec 32))) (Found!3515 (index!16240 (_ BitVec 32))) (Intermediate!3515 (undefined!4327 Bool) (index!16241 (_ BitVec 32)) (x!38385 (_ BitVec 32))) (Undefined!3515) (MissingVacant!3515 (index!16242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23241 (_ BitVec 32)) SeekEntryResult!3515)

(assert (=> b!391903 (= res!224412 (= (seekEntryOrOpen!0 (select (arr!11082 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3515 #b00000000000000000000000000000000)))))

(assert (=> b!391903 (=> (not res!224412) (not e!237331))))

(assert (= (and d!73093 (not res!224413)) b!391904))

(assert (= (and b!391904 c!54284) b!391903))

(assert (= (and b!391904 (not c!54284)) b!391901))

(assert (= (and b!391903 res!224412) b!391902))

(assert (= (or b!391902 b!391901) bm!27630))

(declare-fun m!388313 () Bool)

(assert (=> bm!27630 m!388313))

(declare-fun m!388315 () Bool)

(assert (=> b!391904 m!388315))

(assert (=> b!391904 m!388315))

(declare-fun m!388317 () Bool)

(assert (=> b!391904 m!388317))

(assert (=> b!391903 m!388315))

(declare-fun m!388319 () Bool)

(assert (=> b!391903 m!388319))

(declare-fun m!388321 () Bool)

(assert (=> b!391903 m!388321))

(assert (=> b!391903 m!388315))

(declare-fun m!388323 () Bool)

(assert (=> b!391903 m!388323))

(assert (=> b!391839 d!73093))

(declare-fun d!73095 () Bool)

(declare-fun e!237336 () Bool)

(assert (=> d!73095 e!237336))

(declare-fun res!224418 () Bool)

(assert (=> d!73095 (=> (not res!224418) (not e!237336))))

(declare-fun lt!185083 () ListLongMap!5489)

(declare-fun contains!2461 (ListLongMap!5489 (_ BitVec 64)) Bool)

(assert (=> d!73095 (= res!224418 (contains!2461 lt!185083 (_1!3299 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun lt!185084 () List!6430)

(assert (=> d!73095 (= lt!185083 (ListLongMap!5490 lt!185084))))

(declare-fun lt!185085 () Unit!11992)

(declare-fun lt!185082 () Unit!11992)

(assert (=> d!73095 (= lt!185085 lt!185082)))

(declare-datatypes ((Option!368 0))(
  ( (Some!367 (v!7109 V!13997)) (None!366) )
))
(declare-fun getValueByKey!362 (List!6430 (_ BitVec 64)) Option!368)

(assert (=> d!73095 (= (getValueByKey!362 lt!185084 (_1!3299 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))) (Some!367 (_2!3299 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun lemmaContainsTupThenGetReturnValue!184 (List!6430 (_ BitVec 64) V!13997) Unit!11992)

(assert (=> d!73095 (= lt!185082 (lemmaContainsTupThenGetReturnValue!184 lt!185084 (_1!3299 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) (_2!3299 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun insertStrictlySorted!187 (List!6430 (_ BitVec 64) V!13997) List!6430)

(assert (=> d!73095 (= lt!185084 (insertStrictlySorted!187 (toList!2760 lt!185033) (_1!3299 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) (_2!3299 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (=> d!73095 (= (+!1055 lt!185033 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) lt!185083)))

(declare-fun b!391909 () Bool)

(declare-fun res!224419 () Bool)

(assert (=> b!391909 (=> (not res!224419) (not e!237336))))

(assert (=> b!391909 (= res!224419 (= (getValueByKey!362 (toList!2760 lt!185083) (_1!3299 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))) (Some!367 (_2!3299 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))))

(declare-fun b!391910 () Bool)

(declare-fun contains!2462 (List!6430 tuple2!6576) Bool)

(assert (=> b!391910 (= e!237336 (contains!2462 (toList!2760 lt!185083) (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!73095 res!224418) b!391909))

(assert (= (and b!391909 res!224419) b!391910))

(declare-fun m!388325 () Bool)

(assert (=> d!73095 m!388325))

(declare-fun m!388327 () Bool)

(assert (=> d!73095 m!388327))

(declare-fun m!388329 () Bool)

(assert (=> d!73095 m!388329))

(declare-fun m!388331 () Bool)

(assert (=> d!73095 m!388331))

(declare-fun m!388333 () Bool)

(assert (=> b!391909 m!388333))

(declare-fun m!388335 () Bool)

(assert (=> b!391910 m!388335))

(assert (=> b!391841 d!73095))

(declare-fun bm!27633 () Bool)

(declare-fun call!27636 () Bool)

(declare-fun c!54287 () Bool)

(assert (=> bm!27633 (= call!27636 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54287 (Cons!6427 (select (arr!11082 _keys!658) #b00000000000000000000000000000000) Nil!6428) Nil!6428)))))

(declare-fun b!391922 () Bool)

(declare-fun e!237348 () Bool)

(declare-fun e!237346 () Bool)

(assert (=> b!391922 (= e!237348 e!237346)))

(declare-fun res!224428 () Bool)

(assert (=> b!391922 (=> (not res!224428) (not e!237346))))

(declare-fun e!237347 () Bool)

(assert (=> b!391922 (= res!224428 (not e!237347))))

(declare-fun res!224426 () Bool)

(assert (=> b!391922 (=> (not res!224426) (not e!237347))))

(assert (=> b!391922 (= res!224426 (validKeyInArray!0 (select (arr!11082 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391923 () Bool)

(declare-fun e!237345 () Bool)

(assert (=> b!391923 (= e!237346 e!237345)))

(assert (=> b!391923 (= c!54287 (validKeyInArray!0 (select (arr!11082 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391924 () Bool)

(declare-fun contains!2463 (List!6431 (_ BitVec 64)) Bool)

(assert (=> b!391924 (= e!237347 (contains!2463 Nil!6428 (select (arr!11082 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391925 () Bool)

(assert (=> b!391925 (= e!237345 call!27636)))

(declare-fun b!391921 () Bool)

(assert (=> b!391921 (= e!237345 call!27636)))

(declare-fun d!73097 () Bool)

(declare-fun res!224427 () Bool)

(assert (=> d!73097 (=> res!224427 e!237348)))

(assert (=> d!73097 (= res!224427 (bvsge #b00000000000000000000000000000000 (size!11434 _keys!658)))))

(assert (=> d!73097 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6428) e!237348)))

(assert (= (and d!73097 (not res!224427)) b!391922))

(assert (= (and b!391922 res!224426) b!391924))

(assert (= (and b!391922 res!224428) b!391923))

(assert (= (and b!391923 c!54287) b!391925))

(assert (= (and b!391923 (not c!54287)) b!391921))

(assert (= (or b!391925 b!391921) bm!27633))

(assert (=> bm!27633 m!388315))

(declare-fun m!388337 () Bool)

(assert (=> bm!27633 m!388337))

(assert (=> b!391922 m!388315))

(assert (=> b!391922 m!388315))

(assert (=> b!391922 m!388317))

(assert (=> b!391923 m!388315))

(assert (=> b!391923 m!388315))

(assert (=> b!391923 m!388317))

(assert (=> b!391924 m!388315))

(assert (=> b!391924 m!388315))

(declare-fun m!388339 () Bool)

(assert (=> b!391924 m!388339))

(assert (=> b!391850 d!73097))

(declare-fun bm!27634 () Bool)

(declare-fun call!27637 () Bool)

(assert (=> bm!27634 (= call!27637 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!185034 mask!970))))

(declare-fun b!391926 () Bool)

(declare-fun e!237350 () Bool)

(assert (=> b!391926 (= e!237350 call!27637)))

(declare-fun b!391927 () Bool)

(declare-fun e!237349 () Bool)

(assert (=> b!391927 (= e!237349 call!27637)))

(declare-fun b!391929 () Bool)

(declare-fun e!237351 () Bool)

(assert (=> b!391929 (= e!237351 e!237350)))

(declare-fun c!54288 () Bool)

(assert (=> b!391929 (= c!54288 (validKeyInArray!0 (select (arr!11082 lt!185034) #b00000000000000000000000000000000)))))

(declare-fun d!73099 () Bool)

(declare-fun res!224430 () Bool)

(assert (=> d!73099 (=> res!224430 e!237351)))

(assert (=> d!73099 (= res!224430 (bvsge #b00000000000000000000000000000000 (size!11434 lt!185034)))))

(assert (=> d!73099 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185034 mask!970) e!237351)))

(declare-fun b!391928 () Bool)

(assert (=> b!391928 (= e!237350 e!237349)))

(declare-fun lt!185088 () (_ BitVec 64))

(assert (=> b!391928 (= lt!185088 (select (arr!11082 lt!185034) #b00000000000000000000000000000000))))

(declare-fun lt!185087 () Unit!11992)

(assert (=> b!391928 (= lt!185087 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!185034 lt!185088 #b00000000000000000000000000000000))))

(assert (=> b!391928 (arrayContainsKey!0 lt!185034 lt!185088 #b00000000000000000000000000000000)))

(declare-fun lt!185086 () Unit!11992)

(assert (=> b!391928 (= lt!185086 lt!185087)))

(declare-fun res!224429 () Bool)

(assert (=> b!391928 (= res!224429 (= (seekEntryOrOpen!0 (select (arr!11082 lt!185034) #b00000000000000000000000000000000) lt!185034 mask!970) (Found!3515 #b00000000000000000000000000000000)))))

(assert (=> b!391928 (=> (not res!224429) (not e!237349))))

(assert (= (and d!73099 (not res!224430)) b!391929))

(assert (= (and b!391929 c!54288) b!391928))

(assert (= (and b!391929 (not c!54288)) b!391926))

(assert (= (and b!391928 res!224429) b!391927))

(assert (= (or b!391927 b!391926) bm!27634))

(declare-fun m!388341 () Bool)

(assert (=> bm!27634 m!388341))

(declare-fun m!388343 () Bool)

(assert (=> b!391929 m!388343))

(assert (=> b!391929 m!388343))

(declare-fun m!388345 () Bool)

(assert (=> b!391929 m!388345))

(assert (=> b!391928 m!388343))

(declare-fun m!388347 () Bool)

(assert (=> b!391928 m!388347))

(declare-fun m!388349 () Bool)

(assert (=> b!391928 m!388349))

(assert (=> b!391928 m!388343))

(declare-fun m!388351 () Bool)

(assert (=> b!391928 m!388351))

(assert (=> b!391837 d!73099))

(declare-fun bm!27635 () Bool)

(declare-fun call!27638 () Bool)

(declare-fun c!54289 () Bool)

(assert (=> bm!27635 (= call!27638 (arrayNoDuplicates!0 lt!185034 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54289 (Cons!6427 (select (arr!11082 lt!185034) #b00000000000000000000000000000000) Nil!6428) Nil!6428)))))

(declare-fun b!391931 () Bool)

(declare-fun e!237355 () Bool)

(declare-fun e!237353 () Bool)

(assert (=> b!391931 (= e!237355 e!237353)))

(declare-fun res!224433 () Bool)

(assert (=> b!391931 (=> (not res!224433) (not e!237353))))

(declare-fun e!237354 () Bool)

(assert (=> b!391931 (= res!224433 (not e!237354))))

(declare-fun res!224431 () Bool)

(assert (=> b!391931 (=> (not res!224431) (not e!237354))))

(assert (=> b!391931 (= res!224431 (validKeyInArray!0 (select (arr!11082 lt!185034) #b00000000000000000000000000000000)))))

(declare-fun b!391932 () Bool)

(declare-fun e!237352 () Bool)

(assert (=> b!391932 (= e!237353 e!237352)))

(assert (=> b!391932 (= c!54289 (validKeyInArray!0 (select (arr!11082 lt!185034) #b00000000000000000000000000000000)))))

(declare-fun b!391933 () Bool)

(assert (=> b!391933 (= e!237354 (contains!2463 Nil!6428 (select (arr!11082 lt!185034) #b00000000000000000000000000000000)))))

(declare-fun b!391934 () Bool)

(assert (=> b!391934 (= e!237352 call!27638)))

(declare-fun b!391930 () Bool)

(assert (=> b!391930 (= e!237352 call!27638)))

(declare-fun d!73101 () Bool)

(declare-fun res!224432 () Bool)

(assert (=> d!73101 (=> res!224432 e!237355)))

(assert (=> d!73101 (= res!224432 (bvsge #b00000000000000000000000000000000 (size!11434 lt!185034)))))

(assert (=> d!73101 (= (arrayNoDuplicates!0 lt!185034 #b00000000000000000000000000000000 Nil!6428) e!237355)))

(assert (= (and d!73101 (not res!224432)) b!391931))

(assert (= (and b!391931 res!224431) b!391933))

(assert (= (and b!391931 res!224433) b!391932))

(assert (= (and b!391932 c!54289) b!391934))

(assert (= (and b!391932 (not c!54289)) b!391930))

(assert (= (or b!391934 b!391930) bm!27635))

(assert (=> bm!27635 m!388343))

(declare-fun m!388353 () Bool)

(assert (=> bm!27635 m!388353))

(assert (=> b!391931 m!388343))

(assert (=> b!391931 m!388343))

(assert (=> b!391931 m!388345))

(assert (=> b!391932 m!388343))

(assert (=> b!391932 m!388343))

(assert (=> b!391932 m!388345))

(assert (=> b!391933 m!388343))

(assert (=> b!391933 m!388343))

(declare-fun m!388355 () Bool)

(assert (=> b!391933 m!388355))

(assert (=> b!391842 d!73101))

(declare-fun d!73103 () Bool)

(declare-fun res!224438 () Bool)

(declare-fun e!237360 () Bool)

(assert (=> d!73103 (=> res!224438 e!237360)))

(assert (=> d!73103 (= res!224438 (= (select (arr!11082 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73103 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!237360)))

(declare-fun b!391939 () Bool)

(declare-fun e!237361 () Bool)

(assert (=> b!391939 (= e!237360 e!237361)))

(declare-fun res!224439 () Bool)

(assert (=> b!391939 (=> (not res!224439) (not e!237361))))

(assert (=> b!391939 (= res!224439 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11434 _keys!658)))))

(declare-fun b!391940 () Bool)

(assert (=> b!391940 (= e!237361 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73103 (not res!224438)) b!391939))

(assert (= (and b!391939 res!224439) b!391940))

(assert (=> d!73103 m!388315))

(declare-fun m!388357 () Bool)

(assert (=> b!391940 m!388357))

(assert (=> b!391848 d!73103))

(declare-fun d!73105 () Bool)

(assert (=> d!73105 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38050 d!73105))

(declare-fun d!73107 () Bool)

(assert (=> d!73107 (= (array_inv!8140 _values!506) (bvsge (size!11435 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38050 d!73107))

(declare-fun d!73109 () Bool)

(assert (=> d!73109 (= (array_inv!8141 _keys!658) (bvsge (size!11434 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38050 d!73109))

(declare-fun b!391965 () Bool)

(declare-fun e!237377 () Bool)

(declare-fun e!237380 () Bool)

(assert (=> b!391965 (= e!237377 e!237380)))

(assert (=> b!391965 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11434 _keys!658)))))

(declare-fun res!224449 () Bool)

(declare-fun lt!185108 () ListLongMap!5489)

(assert (=> b!391965 (= res!224449 (contains!2461 lt!185108 (select (arr!11082 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391965 (=> (not res!224449) (not e!237380))))

(declare-fun b!391966 () Bool)

(declare-fun e!237381 () Bool)

(declare-fun isEmpty!550 (ListLongMap!5489) Bool)

(assert (=> b!391966 (= e!237381 (isEmpty!550 lt!185108))))

(declare-fun b!391967 () Bool)

(assert (=> b!391967 (= e!237377 e!237381)))

(declare-fun c!54298 () Bool)

(assert (=> b!391967 (= c!54298 (bvslt #b00000000000000000000000000000000 (size!11434 _keys!658)))))

(declare-fun b!391968 () Bool)

(declare-fun e!237379 () ListLongMap!5489)

(declare-fun call!27641 () ListLongMap!5489)

(assert (=> b!391968 (= e!237379 call!27641)))

(declare-fun b!391969 () Bool)

(declare-fun res!224448 () Bool)

(declare-fun e!237378 () Bool)

(assert (=> b!391969 (=> (not res!224448) (not e!237378))))

(assert (=> b!391969 (= res!224448 (not (contains!2461 lt!185108 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391970 () Bool)

(assert (=> b!391970 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11434 _keys!658)))))

(assert (=> b!391970 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11435 _values!506)))))

(declare-fun apply!304 (ListLongMap!5489 (_ BitVec 64)) V!13997)

(declare-fun get!5600 (ValueCell!4491 V!13997) V!13997)

(declare-fun dynLambda!647 (Int (_ BitVec 64)) V!13997)

(assert (=> b!391970 (= e!237380 (= (apply!304 lt!185108 (select (arr!11082 _keys!658) #b00000000000000000000000000000000)) (get!5600 (select (arr!11083 _values!506) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!391971 () Bool)

(declare-fun e!237382 () Bool)

(assert (=> b!391971 (= e!237382 (validKeyInArray!0 (select (arr!11082 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391971 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!27638 () Bool)

(assert (=> bm!27638 (= call!27641 (getCurrentListMapNoExtraKeys!982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!391972 () Bool)

(declare-fun e!237376 () ListLongMap!5489)

(assert (=> b!391972 (= e!237376 (ListLongMap!5490 Nil!6427))))

(declare-fun b!391973 () Bool)

(declare-fun lt!185104 () Unit!11992)

(declare-fun lt!185107 () Unit!11992)

(assert (=> b!391973 (= lt!185104 lt!185107)))

(declare-fun lt!185109 () (_ BitVec 64))

(declare-fun lt!185105 () ListLongMap!5489)

(declare-fun lt!185106 () V!13997)

(declare-fun lt!185103 () (_ BitVec 64))

(assert (=> b!391973 (not (contains!2461 (+!1055 lt!185105 (tuple2!6577 lt!185109 lt!185106)) lt!185103))))

(declare-fun addStillNotContains!137 (ListLongMap!5489 (_ BitVec 64) V!13997 (_ BitVec 64)) Unit!11992)

(assert (=> b!391973 (= lt!185107 (addStillNotContains!137 lt!185105 lt!185109 lt!185106 lt!185103))))

(assert (=> b!391973 (= lt!185103 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!391973 (= lt!185106 (get!5600 (select (arr!11083 _values!506) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!391973 (= lt!185109 (select (arr!11082 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!391973 (= lt!185105 call!27641)))

(assert (=> b!391973 (= e!237379 (+!1055 call!27641 (tuple2!6577 (select (arr!11082 _keys!658) #b00000000000000000000000000000000) (get!5600 (select (arr!11083 _values!506) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!391974 () Bool)

(assert (=> b!391974 (= e!237378 e!237377)))

(declare-fun c!54301 () Bool)

(assert (=> b!391974 (= c!54301 e!237382)))

(declare-fun res!224451 () Bool)

(assert (=> b!391974 (=> (not res!224451) (not e!237382))))

(assert (=> b!391974 (= res!224451 (bvslt #b00000000000000000000000000000000 (size!11434 _keys!658)))))

(declare-fun b!391975 () Bool)

(assert (=> b!391975 (= e!237381 (= lt!185108 (getCurrentListMapNoExtraKeys!982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun d!73111 () Bool)

(assert (=> d!73111 e!237378))

(declare-fun res!224450 () Bool)

(assert (=> d!73111 (=> (not res!224450) (not e!237378))))

(assert (=> d!73111 (= res!224450 (not (contains!2461 lt!185108 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73111 (= lt!185108 e!237376)))

(declare-fun c!54299 () Bool)

(assert (=> d!73111 (= c!54299 (bvsge #b00000000000000000000000000000000 (size!11434 _keys!658)))))

(assert (=> d!73111 (validMask!0 mask!970)))

(assert (=> d!73111 (= (getCurrentListMapNoExtraKeys!982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185108)))

(declare-fun b!391976 () Bool)

(assert (=> b!391976 (= e!237376 e!237379)))

(declare-fun c!54300 () Bool)

(assert (=> b!391976 (= c!54300 (validKeyInArray!0 (select (arr!11082 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73111 c!54299) b!391972))

(assert (= (and d!73111 (not c!54299)) b!391976))

(assert (= (and b!391976 c!54300) b!391973))

(assert (= (and b!391976 (not c!54300)) b!391968))

(assert (= (or b!391973 b!391968) bm!27638))

(assert (= (and d!73111 res!224450) b!391969))

(assert (= (and b!391969 res!224448) b!391974))

(assert (= (and b!391974 res!224451) b!391971))

(assert (= (and b!391974 c!54301) b!391965))

(assert (= (and b!391974 (not c!54301)) b!391967))

(assert (= (and b!391965 res!224449) b!391970))

(assert (= (and b!391967 c!54298) b!391975))

(assert (= (and b!391967 (not c!54298)) b!391966))

(declare-fun b_lambda!8695 () Bool)

(assert (=> (not b_lambda!8695) (not b!391970)))

(declare-fun t!11599 () Bool)

(declare-fun tb!3123 () Bool)

(assert (=> (and start!38050 (= defaultEntry!514 defaultEntry!514) t!11599) tb!3123))

(declare-fun result!5749 () Bool)

(assert (=> tb!3123 (= result!5749 tp_is_empty!9669)))

(assert (=> b!391970 t!11599))

(declare-fun b_and!16327 () Bool)

(assert (= b_and!16323 (and (=> t!11599 result!5749) b_and!16327)))

(declare-fun b_lambda!8697 () Bool)

(assert (=> (not b_lambda!8697) (not b!391973)))

(assert (=> b!391973 t!11599))

(declare-fun b_and!16329 () Bool)

(assert (= b_and!16327 (and (=> t!11599 result!5749) b_and!16329)))

(assert (=> b!391971 m!388315))

(assert (=> b!391971 m!388315))

(assert (=> b!391971 m!388317))

(declare-fun m!388359 () Bool)

(assert (=> b!391973 m!388359))

(declare-fun m!388361 () Bool)

(assert (=> b!391973 m!388361))

(declare-fun m!388363 () Bool)

(assert (=> b!391973 m!388363))

(declare-fun m!388365 () Bool)

(assert (=> b!391973 m!388365))

(assert (=> b!391973 m!388315))

(declare-fun m!388367 () Bool)

(assert (=> b!391973 m!388367))

(assert (=> b!391973 m!388363))

(declare-fun m!388369 () Bool)

(assert (=> b!391973 m!388369))

(assert (=> b!391973 m!388359))

(assert (=> b!391973 m!388367))

(declare-fun m!388371 () Bool)

(assert (=> b!391973 m!388371))

(assert (=> b!391970 m!388359))

(assert (=> b!391970 m!388315))

(declare-fun m!388373 () Bool)

(assert (=> b!391970 m!388373))

(assert (=> b!391970 m!388315))

(assert (=> b!391970 m!388367))

(assert (=> b!391970 m!388359))

(assert (=> b!391970 m!388367))

(assert (=> b!391970 m!388371))

(declare-fun m!388375 () Bool)

(assert (=> bm!27638 m!388375))

(assert (=> b!391965 m!388315))

(assert (=> b!391965 m!388315))

(declare-fun m!388377 () Bool)

(assert (=> b!391965 m!388377))

(declare-fun m!388379 () Bool)

(assert (=> d!73111 m!388379))

(assert (=> d!73111 m!388265))

(assert (=> b!391976 m!388315))

(assert (=> b!391976 m!388315))

(assert (=> b!391976 m!388317))

(declare-fun m!388381 () Bool)

(assert (=> b!391969 m!388381))

(assert (=> b!391975 m!388375))

(declare-fun m!388383 () Bool)

(assert (=> b!391966 m!388383))

(assert (=> b!391838 d!73111))

(declare-fun bm!27653 () Bool)

(declare-fun call!27661 () Bool)

(declare-fun lt!185159 () ListLongMap!5489)

(assert (=> bm!27653 (= call!27661 (contains!2461 lt!185159 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27654 () Bool)

(declare-fun call!27660 () Bool)

(assert (=> bm!27654 (= call!27660 (contains!2461 lt!185159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!392021 () Bool)

(declare-fun e!237411 () ListLongMap!5489)

(declare-fun call!27657 () ListLongMap!5489)

(assert (=> b!392021 (= e!237411 call!27657)))

(declare-fun b!392022 () Bool)

(declare-fun e!237416 () Bool)

(declare-fun e!237415 () Bool)

(assert (=> b!392022 (= e!237416 e!237415)))

(declare-fun res!224475 () Bool)

(assert (=> b!392022 (=> (not res!224475) (not e!237415))))

(assert (=> b!392022 (= res!224475 (contains!2461 lt!185159 (select (arr!11082 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392022 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11434 _keys!658)))))

(declare-fun b!392023 () Bool)

(declare-fun e!237419 () Unit!11992)

(declare-fun lt!185170 () Unit!11992)

(assert (=> b!392023 (= e!237419 lt!185170)))

(declare-fun lt!185156 () ListLongMap!5489)

(assert (=> b!392023 (= lt!185156 (getCurrentListMapNoExtraKeys!982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185160 () (_ BitVec 64))

(assert (=> b!392023 (= lt!185160 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185171 () (_ BitVec 64))

(assert (=> b!392023 (= lt!185171 (select (arr!11082 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185157 () Unit!11992)

(declare-fun addStillContains!280 (ListLongMap!5489 (_ BitVec 64) V!13997 (_ BitVec 64)) Unit!11992)

(assert (=> b!392023 (= lt!185157 (addStillContains!280 lt!185156 lt!185160 zeroValue!472 lt!185171))))

(assert (=> b!392023 (contains!2461 (+!1055 lt!185156 (tuple2!6577 lt!185160 zeroValue!472)) lt!185171)))

(declare-fun lt!185168 () Unit!11992)

(assert (=> b!392023 (= lt!185168 lt!185157)))

(declare-fun lt!185175 () ListLongMap!5489)

(assert (=> b!392023 (= lt!185175 (getCurrentListMapNoExtraKeys!982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185158 () (_ BitVec 64))

(assert (=> b!392023 (= lt!185158 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185172 () (_ BitVec 64))

(assert (=> b!392023 (= lt!185172 (select (arr!11082 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185163 () Unit!11992)

(declare-fun addApplyDifferent!280 (ListLongMap!5489 (_ BitVec 64) V!13997 (_ BitVec 64)) Unit!11992)

(assert (=> b!392023 (= lt!185163 (addApplyDifferent!280 lt!185175 lt!185158 minValue!472 lt!185172))))

(assert (=> b!392023 (= (apply!304 (+!1055 lt!185175 (tuple2!6577 lt!185158 minValue!472)) lt!185172) (apply!304 lt!185175 lt!185172))))

(declare-fun lt!185161 () Unit!11992)

(assert (=> b!392023 (= lt!185161 lt!185163)))

(declare-fun lt!185166 () ListLongMap!5489)

(assert (=> b!392023 (= lt!185166 (getCurrentListMapNoExtraKeys!982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185162 () (_ BitVec 64))

(assert (=> b!392023 (= lt!185162 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185164 () (_ BitVec 64))

(assert (=> b!392023 (= lt!185164 (select (arr!11082 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185169 () Unit!11992)

(assert (=> b!392023 (= lt!185169 (addApplyDifferent!280 lt!185166 lt!185162 zeroValue!472 lt!185164))))

(assert (=> b!392023 (= (apply!304 (+!1055 lt!185166 (tuple2!6577 lt!185162 zeroValue!472)) lt!185164) (apply!304 lt!185166 lt!185164))))

(declare-fun lt!185154 () Unit!11992)

(assert (=> b!392023 (= lt!185154 lt!185169)))

(declare-fun lt!185165 () ListLongMap!5489)

(assert (=> b!392023 (= lt!185165 (getCurrentListMapNoExtraKeys!982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185167 () (_ BitVec 64))

(assert (=> b!392023 (= lt!185167 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185174 () (_ BitVec 64))

(assert (=> b!392023 (= lt!185174 (select (arr!11082 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!392023 (= lt!185170 (addApplyDifferent!280 lt!185165 lt!185167 minValue!472 lt!185174))))

(assert (=> b!392023 (= (apply!304 (+!1055 lt!185165 (tuple2!6577 lt!185167 minValue!472)) lt!185174) (apply!304 lt!185165 lt!185174))))

(declare-fun b!392024 () Bool)

(declare-fun e!237414 () Bool)

(declare-fun e!237420 () Bool)

(assert (=> b!392024 (= e!237414 e!237420)))

(declare-fun c!54318 () Bool)

(assert (=> b!392024 (= c!54318 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392026 () Bool)

(declare-fun res!224471 () Bool)

(assert (=> b!392026 (=> (not res!224471) (not e!237414))))

(declare-fun e!237417 () Bool)

(assert (=> b!392026 (= res!224471 e!237417)))

(declare-fun c!54317 () Bool)

(assert (=> b!392026 (= c!54317 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392027 () Bool)

(declare-fun call!27656 () ListLongMap!5489)

(assert (=> b!392027 (= e!237411 call!27656)))

(declare-fun b!392028 () Bool)

(assert (=> b!392028 (= e!237417 (not call!27660))))

(declare-fun b!392029 () Bool)

(declare-fun e!237409 () ListLongMap!5489)

(declare-fun call!27662 () ListLongMap!5489)

(assert (=> b!392029 (= e!237409 (+!1055 call!27662 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27655 () Bool)

(assert (=> bm!27655 (= call!27656 call!27662)))

(declare-fun b!392030 () Bool)

(declare-fun e!237410 () ListLongMap!5489)

(assert (=> b!392030 (= e!237409 e!237410)))

(declare-fun c!54319 () Bool)

(assert (=> b!392030 (= c!54319 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392031 () Bool)

(declare-fun e!237413 () Bool)

(assert (=> b!392031 (= e!237413 (validKeyInArray!0 (select (arr!11082 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392032 () Bool)

(declare-fun e!237418 () Bool)

(assert (=> b!392032 (= e!237418 (= (apply!304 lt!185159 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392033 () Bool)

(assert (=> b!392033 (= e!237415 (= (apply!304 lt!185159 (select (arr!11082 _keys!658) #b00000000000000000000000000000000)) (get!5600 (select (arr!11083 _values!506) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392033 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11435 _values!506)))))

(assert (=> b!392033 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11434 _keys!658)))))

(declare-fun b!392034 () Bool)

(declare-fun e!237421 () Bool)

(assert (=> b!392034 (= e!237417 e!237421)))

(declare-fun res!224470 () Bool)

(assert (=> b!392034 (= res!224470 call!27660)))

(assert (=> b!392034 (=> (not res!224470) (not e!237421))))

(declare-fun b!392035 () Bool)

(declare-fun c!54314 () Bool)

(assert (=> b!392035 (= c!54314 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!392035 (= e!237410 e!237411)))

(declare-fun b!392036 () Bool)

(assert (=> b!392036 (= e!237420 e!237418)))

(declare-fun res!224478 () Bool)

(assert (=> b!392036 (= res!224478 call!27661)))

(assert (=> b!392036 (=> (not res!224478) (not e!237418))))

(declare-fun b!392037 () Bool)

(declare-fun e!237412 () Bool)

(assert (=> b!392037 (= e!237412 (validKeyInArray!0 (select (arr!11082 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392038 () Bool)

(declare-fun Unit!11996 () Unit!11992)

(assert (=> b!392038 (= e!237419 Unit!11996)))

(declare-fun b!392039 () Bool)

(assert (=> b!392039 (= e!237410 call!27656)))

(declare-fun bm!27656 () Bool)

(declare-fun call!27659 () ListLongMap!5489)

(declare-fun call!27658 () ListLongMap!5489)

(assert (=> bm!27656 (= call!27659 call!27658)))

(declare-fun bm!27657 () Bool)

(declare-fun c!54315 () Bool)

(assert (=> bm!27657 (= call!27662 (+!1055 (ite c!54315 call!27658 (ite c!54319 call!27659 call!27657)) (ite (or c!54315 c!54319) (tuple2!6577 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27658 () Bool)

(assert (=> bm!27658 (= call!27658 (getCurrentListMapNoExtraKeys!982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27659 () Bool)

(assert (=> bm!27659 (= call!27657 call!27659)))

(declare-fun b!392025 () Bool)

(declare-fun res!224477 () Bool)

(assert (=> b!392025 (=> (not res!224477) (not e!237414))))

(assert (=> b!392025 (= res!224477 e!237416)))

(declare-fun res!224476 () Bool)

(assert (=> b!392025 (=> res!224476 e!237416)))

(assert (=> b!392025 (= res!224476 (not e!237412))))

(declare-fun res!224472 () Bool)

(assert (=> b!392025 (=> (not res!224472) (not e!237412))))

(assert (=> b!392025 (= res!224472 (bvslt #b00000000000000000000000000000000 (size!11434 _keys!658)))))

(declare-fun d!73113 () Bool)

(assert (=> d!73113 e!237414))

(declare-fun res!224473 () Bool)

(assert (=> d!73113 (=> (not res!224473) (not e!237414))))

(assert (=> d!73113 (= res!224473 (or (bvsge #b00000000000000000000000000000000 (size!11434 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11434 _keys!658)))))))

(declare-fun lt!185173 () ListLongMap!5489)

(assert (=> d!73113 (= lt!185159 lt!185173)))

(declare-fun lt!185155 () Unit!11992)

(assert (=> d!73113 (= lt!185155 e!237419)))

(declare-fun c!54316 () Bool)

(assert (=> d!73113 (= c!54316 e!237413)))

(declare-fun res!224474 () Bool)

(assert (=> d!73113 (=> (not res!224474) (not e!237413))))

(assert (=> d!73113 (= res!224474 (bvslt #b00000000000000000000000000000000 (size!11434 _keys!658)))))

(assert (=> d!73113 (= lt!185173 e!237409)))

(assert (=> d!73113 (= c!54315 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73113 (validMask!0 mask!970)))

(assert (=> d!73113 (= (getCurrentListMap!2102 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185159)))

(declare-fun b!392040 () Bool)

(assert (=> b!392040 (= e!237421 (= (apply!304 lt!185159 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!392041 () Bool)

(assert (=> b!392041 (= e!237420 (not call!27661))))

(assert (= (and d!73113 c!54315) b!392029))

(assert (= (and d!73113 (not c!54315)) b!392030))

(assert (= (and b!392030 c!54319) b!392039))

(assert (= (and b!392030 (not c!54319)) b!392035))

(assert (= (and b!392035 c!54314) b!392027))

(assert (= (and b!392035 (not c!54314)) b!392021))

(assert (= (or b!392027 b!392021) bm!27659))

(assert (= (or b!392039 bm!27659) bm!27656))

(assert (= (or b!392039 b!392027) bm!27655))

(assert (= (or b!392029 bm!27656) bm!27658))

(assert (= (or b!392029 bm!27655) bm!27657))

(assert (= (and d!73113 res!224474) b!392031))

(assert (= (and d!73113 c!54316) b!392023))

(assert (= (and d!73113 (not c!54316)) b!392038))

(assert (= (and d!73113 res!224473) b!392025))

(assert (= (and b!392025 res!224472) b!392037))

(assert (= (and b!392025 (not res!224476)) b!392022))

(assert (= (and b!392022 res!224475) b!392033))

(assert (= (and b!392025 res!224477) b!392026))

(assert (= (and b!392026 c!54317) b!392034))

(assert (= (and b!392026 (not c!54317)) b!392028))

(assert (= (and b!392034 res!224470) b!392040))

(assert (= (or b!392034 b!392028) bm!27654))

(assert (= (and b!392026 res!224471) b!392024))

(assert (= (and b!392024 c!54318) b!392036))

(assert (= (and b!392024 (not c!54318)) b!392041))

(assert (= (and b!392036 res!224478) b!392032))

(assert (= (or b!392036 b!392041) bm!27653))

(declare-fun b_lambda!8699 () Bool)

(assert (=> (not b_lambda!8699) (not b!392033)))

(assert (=> b!392033 t!11599))

(declare-fun b_and!16331 () Bool)

(assert (= b_and!16329 (and (=> t!11599 result!5749) b_and!16331)))

(assert (=> b!392022 m!388315))

(assert (=> b!392022 m!388315))

(declare-fun m!388385 () Bool)

(assert (=> b!392022 m!388385))

(declare-fun m!388387 () Bool)

(assert (=> bm!27653 m!388387))

(declare-fun m!388389 () Bool)

(assert (=> b!392023 m!388389))

(declare-fun m!388391 () Bool)

(assert (=> b!392023 m!388391))

(assert (=> b!392023 m!388389))

(declare-fun m!388393 () Bool)

(assert (=> b!392023 m!388393))

(assert (=> b!392023 m!388391))

(declare-fun m!388395 () Bool)

(assert (=> b!392023 m!388395))

(declare-fun m!388397 () Bool)

(assert (=> b!392023 m!388397))

(declare-fun m!388399 () Bool)

(assert (=> b!392023 m!388399))

(declare-fun m!388401 () Bool)

(assert (=> b!392023 m!388401))

(assert (=> b!392023 m!388401))

(declare-fun m!388403 () Bool)

(assert (=> b!392023 m!388403))

(assert (=> b!392023 m!388315))

(declare-fun m!388405 () Bool)

(assert (=> b!392023 m!388405))

(declare-fun m!388407 () Bool)

(assert (=> b!392023 m!388407))

(declare-fun m!388409 () Bool)

(assert (=> b!392023 m!388409))

(declare-fun m!388411 () Bool)

(assert (=> b!392023 m!388411))

(declare-fun m!388413 () Bool)

(assert (=> b!392023 m!388413))

(assert (=> b!392023 m!388251))

(assert (=> b!392023 m!388399))

(declare-fun m!388415 () Bool)

(assert (=> b!392023 m!388415))

(declare-fun m!388417 () Bool)

(assert (=> b!392023 m!388417))

(declare-fun m!388419 () Bool)

(assert (=> b!392040 m!388419))

(declare-fun m!388421 () Bool)

(assert (=> b!392029 m!388421))

(declare-fun m!388423 () Bool)

(assert (=> b!392032 m!388423))

(assert (=> b!392033 m!388315))

(assert (=> b!392033 m!388367))

(assert (=> b!392033 m!388315))

(declare-fun m!388425 () Bool)

(assert (=> b!392033 m!388425))

(assert (=> b!392033 m!388359))

(assert (=> b!392033 m!388367))

(assert (=> b!392033 m!388371))

(assert (=> b!392033 m!388359))

(declare-fun m!388427 () Bool)

(assert (=> bm!27654 m!388427))

(declare-fun m!388429 () Bool)

(assert (=> bm!27657 m!388429))

(assert (=> bm!27658 m!388251))

(assert (=> b!392031 m!388315))

(assert (=> b!392031 m!388315))

(assert (=> b!392031 m!388317))

(assert (=> b!392037 m!388315))

(assert (=> b!392037 m!388315))

(assert (=> b!392037 m!388317))

(assert (=> d!73113 m!388265))

(assert (=> b!391838 d!73113))

(declare-fun b!392042 () Bool)

(declare-fun e!237423 () Bool)

(declare-fun e!237426 () Bool)

(assert (=> b!392042 (= e!237423 e!237426)))

(assert (=> b!392042 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11434 lt!185034)))))

(declare-fun res!224480 () Bool)

(declare-fun lt!185181 () ListLongMap!5489)

(assert (=> b!392042 (= res!224480 (contains!2461 lt!185181 (select (arr!11082 lt!185034) #b00000000000000000000000000000000)))))

(assert (=> b!392042 (=> (not res!224480) (not e!237426))))

(declare-fun b!392043 () Bool)

(declare-fun e!237427 () Bool)

(assert (=> b!392043 (= e!237427 (isEmpty!550 lt!185181))))

(declare-fun b!392044 () Bool)

(assert (=> b!392044 (= e!237423 e!237427)))

(declare-fun c!54320 () Bool)

(assert (=> b!392044 (= c!54320 (bvslt #b00000000000000000000000000000000 (size!11434 lt!185034)))))

(declare-fun b!392045 () Bool)

(declare-fun e!237425 () ListLongMap!5489)

(declare-fun call!27663 () ListLongMap!5489)

(assert (=> b!392045 (= e!237425 call!27663)))

(declare-fun b!392046 () Bool)

(declare-fun res!224479 () Bool)

(declare-fun e!237424 () Bool)

(assert (=> b!392046 (=> (not res!224479) (not e!237424))))

(assert (=> b!392046 (= res!224479 (not (contains!2461 lt!185181 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392047 () Bool)

(assert (=> b!392047 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11434 lt!185034)))))

(assert (=> b!392047 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11435 lt!185040)))))

(assert (=> b!392047 (= e!237426 (= (apply!304 lt!185181 (select (arr!11082 lt!185034) #b00000000000000000000000000000000)) (get!5600 (select (arr!11083 lt!185040) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!392048 () Bool)

(declare-fun e!237428 () Bool)

(assert (=> b!392048 (= e!237428 (validKeyInArray!0 (select (arr!11082 lt!185034) #b00000000000000000000000000000000)))))

(assert (=> b!392048 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!27660 () Bool)

(assert (=> bm!27660 (= call!27663 (getCurrentListMapNoExtraKeys!982 lt!185034 lt!185040 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!392049 () Bool)

(declare-fun e!237422 () ListLongMap!5489)

(assert (=> b!392049 (= e!237422 (ListLongMap!5490 Nil!6427))))

(declare-fun b!392050 () Bool)

(declare-fun lt!185177 () Unit!11992)

(declare-fun lt!185180 () Unit!11992)

(assert (=> b!392050 (= lt!185177 lt!185180)))

(declare-fun lt!185178 () ListLongMap!5489)

(declare-fun lt!185182 () (_ BitVec 64))

(declare-fun lt!185176 () (_ BitVec 64))

(declare-fun lt!185179 () V!13997)

(assert (=> b!392050 (not (contains!2461 (+!1055 lt!185178 (tuple2!6577 lt!185182 lt!185179)) lt!185176))))

(assert (=> b!392050 (= lt!185180 (addStillNotContains!137 lt!185178 lt!185182 lt!185179 lt!185176))))

(assert (=> b!392050 (= lt!185176 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392050 (= lt!185179 (get!5600 (select (arr!11083 lt!185040) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392050 (= lt!185182 (select (arr!11082 lt!185034) #b00000000000000000000000000000000))))

(assert (=> b!392050 (= lt!185178 call!27663)))

(assert (=> b!392050 (= e!237425 (+!1055 call!27663 (tuple2!6577 (select (arr!11082 lt!185034) #b00000000000000000000000000000000) (get!5600 (select (arr!11083 lt!185040) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392051 () Bool)

(assert (=> b!392051 (= e!237424 e!237423)))

(declare-fun c!54323 () Bool)

(assert (=> b!392051 (= c!54323 e!237428)))

(declare-fun res!224482 () Bool)

(assert (=> b!392051 (=> (not res!224482) (not e!237428))))

(assert (=> b!392051 (= res!224482 (bvslt #b00000000000000000000000000000000 (size!11434 lt!185034)))))

(declare-fun b!392052 () Bool)

(assert (=> b!392052 (= e!237427 (= lt!185181 (getCurrentListMapNoExtraKeys!982 lt!185034 lt!185040 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun d!73115 () Bool)

(assert (=> d!73115 e!237424))

(declare-fun res!224481 () Bool)

(assert (=> d!73115 (=> (not res!224481) (not e!237424))))

(assert (=> d!73115 (= res!224481 (not (contains!2461 lt!185181 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73115 (= lt!185181 e!237422)))

(declare-fun c!54321 () Bool)

(assert (=> d!73115 (= c!54321 (bvsge #b00000000000000000000000000000000 (size!11434 lt!185034)))))

(assert (=> d!73115 (validMask!0 mask!970)))

(assert (=> d!73115 (= (getCurrentListMapNoExtraKeys!982 lt!185034 lt!185040 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185181)))

(declare-fun b!392053 () Bool)

(assert (=> b!392053 (= e!237422 e!237425)))

(declare-fun c!54322 () Bool)

(assert (=> b!392053 (= c!54322 (validKeyInArray!0 (select (arr!11082 lt!185034) #b00000000000000000000000000000000)))))

(assert (= (and d!73115 c!54321) b!392049))

(assert (= (and d!73115 (not c!54321)) b!392053))

(assert (= (and b!392053 c!54322) b!392050))

(assert (= (and b!392053 (not c!54322)) b!392045))

(assert (= (or b!392050 b!392045) bm!27660))

(assert (= (and d!73115 res!224481) b!392046))

(assert (= (and b!392046 res!224479) b!392051))

(assert (= (and b!392051 res!224482) b!392048))

(assert (= (and b!392051 c!54323) b!392042))

(assert (= (and b!392051 (not c!54323)) b!392044))

(assert (= (and b!392042 res!224480) b!392047))

(assert (= (and b!392044 c!54320) b!392052))

(assert (= (and b!392044 (not c!54320)) b!392043))

(declare-fun b_lambda!8701 () Bool)

(assert (=> (not b_lambda!8701) (not b!392047)))

(assert (=> b!392047 t!11599))

(declare-fun b_and!16333 () Bool)

(assert (= b_and!16331 (and (=> t!11599 result!5749) b_and!16333)))

(declare-fun b_lambda!8703 () Bool)

(assert (=> (not b_lambda!8703) (not b!392050)))

(assert (=> b!392050 t!11599))

(declare-fun b_and!16335 () Bool)

(assert (= b_and!16333 (and (=> t!11599 result!5749) b_and!16335)))

(assert (=> b!392048 m!388343))

(assert (=> b!392048 m!388343))

(assert (=> b!392048 m!388345))

(declare-fun m!388431 () Bool)

(assert (=> b!392050 m!388431))

(declare-fun m!388433 () Bool)

(assert (=> b!392050 m!388433))

(declare-fun m!388435 () Bool)

(assert (=> b!392050 m!388435))

(declare-fun m!388437 () Bool)

(assert (=> b!392050 m!388437))

(assert (=> b!392050 m!388343))

(assert (=> b!392050 m!388367))

(assert (=> b!392050 m!388435))

(declare-fun m!388439 () Bool)

(assert (=> b!392050 m!388439))

(assert (=> b!392050 m!388431))

(assert (=> b!392050 m!388367))

(declare-fun m!388441 () Bool)

(assert (=> b!392050 m!388441))

(assert (=> b!392047 m!388431))

(assert (=> b!392047 m!388343))

(declare-fun m!388443 () Bool)

(assert (=> b!392047 m!388443))

(assert (=> b!392047 m!388343))

(assert (=> b!392047 m!388367))

(assert (=> b!392047 m!388431))

(assert (=> b!392047 m!388367))

(assert (=> b!392047 m!388441))

(declare-fun m!388445 () Bool)

(assert (=> bm!27660 m!388445))

(assert (=> b!392042 m!388343))

(assert (=> b!392042 m!388343))

(declare-fun m!388447 () Bool)

(assert (=> b!392042 m!388447))

(declare-fun m!388449 () Bool)

(assert (=> d!73115 m!388449))

(assert (=> d!73115 m!388265))

(assert (=> b!392053 m!388343))

(assert (=> b!392053 m!388343))

(assert (=> b!392053 m!388345))

(declare-fun m!388451 () Bool)

(assert (=> b!392046 m!388451))

(assert (=> b!392052 m!388445))

(declare-fun m!388453 () Bool)

(assert (=> b!392043 m!388453))

(assert (=> b!391838 d!73115))

(declare-fun b!392060 () Bool)

(declare-fun e!237433 () Bool)

(declare-fun call!27669 () ListLongMap!5489)

(declare-fun call!27668 () ListLongMap!5489)

(assert (=> b!392060 (= e!237433 (= call!27669 call!27668))))

(declare-fun d!73117 () Bool)

(declare-fun e!237434 () Bool)

(assert (=> d!73117 e!237434))

(declare-fun res!224485 () Bool)

(assert (=> d!73117 (=> (not res!224485) (not e!237434))))

(assert (=> d!73117 (= res!224485 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11434 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11435 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11434 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11435 _values!506))))))))

(declare-fun lt!185185 () Unit!11992)

(declare-fun choose!1319 (array!23241 array!23243 (_ BitVec 32) (_ BitVec 32) V!13997 V!13997 (_ BitVec 32) (_ BitVec 64) V!13997 (_ BitVec 32) Int) Unit!11992)

(assert (=> d!73117 (= lt!185185 (choose!1319 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73117 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11434 _keys!658)))))

(assert (=> d!73117 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!266 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!185185)))

(declare-fun b!392061 () Bool)

(assert (=> b!392061 (= e!237433 (= call!27669 (+!1055 call!27668 (tuple2!6577 k0!778 v!373))))))

(declare-fun b!392062 () Bool)

(assert (=> b!392062 (= e!237434 e!237433)))

(declare-fun c!54326 () Bool)

(assert (=> b!392062 (= c!54326 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun bm!27665 () Bool)

(assert (=> bm!27665 (= call!27669 (getCurrentListMapNoExtraKeys!982 (array!23242 (store (arr!11082 _keys!658) i!548 k0!778) (size!11434 _keys!658)) (array!23244 (store (arr!11083 _values!506) i!548 (ValueCellFull!4491 v!373)) (size!11435 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27666 () Bool)

(assert (=> bm!27666 (= call!27668 (getCurrentListMapNoExtraKeys!982 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!73117 res!224485) b!392062))

(assert (= (and b!392062 c!54326) b!392061))

(assert (= (and b!392062 (not c!54326)) b!392060))

(assert (= (or b!392061 b!392060) bm!27666))

(assert (= (or b!392061 b!392060) bm!27665))

(declare-fun m!388455 () Bool)

(assert (=> d!73117 m!388455))

(declare-fun m!388457 () Bool)

(assert (=> b!392061 m!388457))

(assert (=> bm!27665 m!388239))

(assert (=> bm!27665 m!388263))

(declare-fun m!388459 () Bool)

(assert (=> bm!27665 m!388459))

(assert (=> bm!27666 m!388251))

(assert (=> b!391838 d!73117))

(declare-fun bm!27667 () Bool)

(declare-fun call!27675 () Bool)

(declare-fun lt!185191 () ListLongMap!5489)

(assert (=> bm!27667 (= call!27675 (contains!2461 lt!185191 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27668 () Bool)

(declare-fun call!27674 () Bool)

(assert (=> bm!27668 (= call!27674 (contains!2461 lt!185191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!392063 () Bool)

(declare-fun e!237437 () ListLongMap!5489)

(declare-fun call!27671 () ListLongMap!5489)

(assert (=> b!392063 (= e!237437 call!27671)))

(declare-fun b!392064 () Bool)

(declare-fun e!237442 () Bool)

(declare-fun e!237441 () Bool)

(assert (=> b!392064 (= e!237442 e!237441)))

(declare-fun res!224491 () Bool)

(assert (=> b!392064 (=> (not res!224491) (not e!237441))))

(assert (=> b!392064 (= res!224491 (contains!2461 lt!185191 (select (arr!11082 lt!185034) #b00000000000000000000000000000000)))))

(assert (=> b!392064 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11434 lt!185034)))))

(declare-fun b!392065 () Bool)

(declare-fun e!237445 () Unit!11992)

(declare-fun lt!185202 () Unit!11992)

(assert (=> b!392065 (= e!237445 lt!185202)))

(declare-fun lt!185188 () ListLongMap!5489)

(assert (=> b!392065 (= lt!185188 (getCurrentListMapNoExtraKeys!982 lt!185034 lt!185040 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185192 () (_ BitVec 64))

(assert (=> b!392065 (= lt!185192 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185203 () (_ BitVec 64))

(assert (=> b!392065 (= lt!185203 (select (arr!11082 lt!185034) #b00000000000000000000000000000000))))

(declare-fun lt!185189 () Unit!11992)

(assert (=> b!392065 (= lt!185189 (addStillContains!280 lt!185188 lt!185192 zeroValue!472 lt!185203))))

(assert (=> b!392065 (contains!2461 (+!1055 lt!185188 (tuple2!6577 lt!185192 zeroValue!472)) lt!185203)))

(declare-fun lt!185200 () Unit!11992)

(assert (=> b!392065 (= lt!185200 lt!185189)))

(declare-fun lt!185207 () ListLongMap!5489)

(assert (=> b!392065 (= lt!185207 (getCurrentListMapNoExtraKeys!982 lt!185034 lt!185040 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185190 () (_ BitVec 64))

(assert (=> b!392065 (= lt!185190 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185204 () (_ BitVec 64))

(assert (=> b!392065 (= lt!185204 (select (arr!11082 lt!185034) #b00000000000000000000000000000000))))

(declare-fun lt!185195 () Unit!11992)

(assert (=> b!392065 (= lt!185195 (addApplyDifferent!280 lt!185207 lt!185190 minValue!472 lt!185204))))

(assert (=> b!392065 (= (apply!304 (+!1055 lt!185207 (tuple2!6577 lt!185190 minValue!472)) lt!185204) (apply!304 lt!185207 lt!185204))))

(declare-fun lt!185193 () Unit!11992)

(assert (=> b!392065 (= lt!185193 lt!185195)))

(declare-fun lt!185198 () ListLongMap!5489)

(assert (=> b!392065 (= lt!185198 (getCurrentListMapNoExtraKeys!982 lt!185034 lt!185040 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185194 () (_ BitVec 64))

(assert (=> b!392065 (= lt!185194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185196 () (_ BitVec 64))

(assert (=> b!392065 (= lt!185196 (select (arr!11082 lt!185034) #b00000000000000000000000000000000))))

(declare-fun lt!185201 () Unit!11992)

(assert (=> b!392065 (= lt!185201 (addApplyDifferent!280 lt!185198 lt!185194 zeroValue!472 lt!185196))))

(assert (=> b!392065 (= (apply!304 (+!1055 lt!185198 (tuple2!6577 lt!185194 zeroValue!472)) lt!185196) (apply!304 lt!185198 lt!185196))))

(declare-fun lt!185186 () Unit!11992)

(assert (=> b!392065 (= lt!185186 lt!185201)))

(declare-fun lt!185197 () ListLongMap!5489)

(assert (=> b!392065 (= lt!185197 (getCurrentListMapNoExtraKeys!982 lt!185034 lt!185040 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185199 () (_ BitVec 64))

(assert (=> b!392065 (= lt!185199 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185206 () (_ BitVec 64))

(assert (=> b!392065 (= lt!185206 (select (arr!11082 lt!185034) #b00000000000000000000000000000000))))

(assert (=> b!392065 (= lt!185202 (addApplyDifferent!280 lt!185197 lt!185199 minValue!472 lt!185206))))

(assert (=> b!392065 (= (apply!304 (+!1055 lt!185197 (tuple2!6577 lt!185199 minValue!472)) lt!185206) (apply!304 lt!185197 lt!185206))))

(declare-fun b!392066 () Bool)

(declare-fun e!237440 () Bool)

(declare-fun e!237446 () Bool)

(assert (=> b!392066 (= e!237440 e!237446)))

(declare-fun c!54331 () Bool)

(assert (=> b!392066 (= c!54331 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392068 () Bool)

(declare-fun res!224487 () Bool)

(assert (=> b!392068 (=> (not res!224487) (not e!237440))))

(declare-fun e!237443 () Bool)

(assert (=> b!392068 (= res!224487 e!237443)))

(declare-fun c!54330 () Bool)

(assert (=> b!392068 (= c!54330 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392069 () Bool)

(declare-fun call!27670 () ListLongMap!5489)

(assert (=> b!392069 (= e!237437 call!27670)))

(declare-fun b!392070 () Bool)

(assert (=> b!392070 (= e!237443 (not call!27674))))

(declare-fun b!392071 () Bool)

(declare-fun e!237435 () ListLongMap!5489)

(declare-fun call!27676 () ListLongMap!5489)

(assert (=> b!392071 (= e!237435 (+!1055 call!27676 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27669 () Bool)

(assert (=> bm!27669 (= call!27670 call!27676)))

(declare-fun b!392072 () Bool)

(declare-fun e!237436 () ListLongMap!5489)

(assert (=> b!392072 (= e!237435 e!237436)))

(declare-fun c!54332 () Bool)

(assert (=> b!392072 (= c!54332 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392073 () Bool)

(declare-fun e!237439 () Bool)

(assert (=> b!392073 (= e!237439 (validKeyInArray!0 (select (arr!11082 lt!185034) #b00000000000000000000000000000000)))))

(declare-fun b!392074 () Bool)

(declare-fun e!237444 () Bool)

(assert (=> b!392074 (= e!237444 (= (apply!304 lt!185191 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392075 () Bool)

(assert (=> b!392075 (= e!237441 (= (apply!304 lt!185191 (select (arr!11082 lt!185034) #b00000000000000000000000000000000)) (get!5600 (select (arr!11083 lt!185040) #b00000000000000000000000000000000) (dynLambda!647 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11435 lt!185040)))))

(assert (=> b!392075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11434 lt!185034)))))

(declare-fun b!392076 () Bool)

(declare-fun e!237447 () Bool)

(assert (=> b!392076 (= e!237443 e!237447)))

(declare-fun res!224486 () Bool)

(assert (=> b!392076 (= res!224486 call!27674)))

(assert (=> b!392076 (=> (not res!224486) (not e!237447))))

(declare-fun b!392077 () Bool)

(declare-fun c!54327 () Bool)

(assert (=> b!392077 (= c!54327 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!392077 (= e!237436 e!237437)))

(declare-fun b!392078 () Bool)

(assert (=> b!392078 (= e!237446 e!237444)))

(declare-fun res!224494 () Bool)

(assert (=> b!392078 (= res!224494 call!27675)))

(assert (=> b!392078 (=> (not res!224494) (not e!237444))))

(declare-fun b!392079 () Bool)

(declare-fun e!237438 () Bool)

(assert (=> b!392079 (= e!237438 (validKeyInArray!0 (select (arr!11082 lt!185034) #b00000000000000000000000000000000)))))

(declare-fun b!392080 () Bool)

(declare-fun Unit!11997 () Unit!11992)

(assert (=> b!392080 (= e!237445 Unit!11997)))

(declare-fun b!392081 () Bool)

(assert (=> b!392081 (= e!237436 call!27670)))

(declare-fun bm!27670 () Bool)

(declare-fun call!27673 () ListLongMap!5489)

(declare-fun call!27672 () ListLongMap!5489)

(assert (=> bm!27670 (= call!27673 call!27672)))

(declare-fun c!54328 () Bool)

(declare-fun bm!27671 () Bool)

(assert (=> bm!27671 (= call!27676 (+!1055 (ite c!54328 call!27672 (ite c!54332 call!27673 call!27671)) (ite (or c!54328 c!54332) (tuple2!6577 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27672 () Bool)

(assert (=> bm!27672 (= call!27672 (getCurrentListMapNoExtraKeys!982 lt!185034 lt!185040 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27673 () Bool)

(assert (=> bm!27673 (= call!27671 call!27673)))

(declare-fun b!392067 () Bool)

(declare-fun res!224493 () Bool)

(assert (=> b!392067 (=> (not res!224493) (not e!237440))))

(assert (=> b!392067 (= res!224493 e!237442)))

(declare-fun res!224492 () Bool)

(assert (=> b!392067 (=> res!224492 e!237442)))

(assert (=> b!392067 (= res!224492 (not e!237438))))

(declare-fun res!224488 () Bool)

(assert (=> b!392067 (=> (not res!224488) (not e!237438))))

(assert (=> b!392067 (= res!224488 (bvslt #b00000000000000000000000000000000 (size!11434 lt!185034)))))

(declare-fun d!73119 () Bool)

(assert (=> d!73119 e!237440))

(declare-fun res!224489 () Bool)

(assert (=> d!73119 (=> (not res!224489) (not e!237440))))

(assert (=> d!73119 (= res!224489 (or (bvsge #b00000000000000000000000000000000 (size!11434 lt!185034)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11434 lt!185034)))))))

(declare-fun lt!185205 () ListLongMap!5489)

(assert (=> d!73119 (= lt!185191 lt!185205)))

(declare-fun lt!185187 () Unit!11992)

(assert (=> d!73119 (= lt!185187 e!237445)))

(declare-fun c!54329 () Bool)

(assert (=> d!73119 (= c!54329 e!237439)))

(declare-fun res!224490 () Bool)

(assert (=> d!73119 (=> (not res!224490) (not e!237439))))

(assert (=> d!73119 (= res!224490 (bvslt #b00000000000000000000000000000000 (size!11434 lt!185034)))))

(assert (=> d!73119 (= lt!185205 e!237435)))

(assert (=> d!73119 (= c!54328 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73119 (validMask!0 mask!970)))

(assert (=> d!73119 (= (getCurrentListMap!2102 lt!185034 lt!185040 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185191)))

(declare-fun b!392082 () Bool)

(assert (=> b!392082 (= e!237447 (= (apply!304 lt!185191 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!392083 () Bool)

(assert (=> b!392083 (= e!237446 (not call!27675))))

(assert (= (and d!73119 c!54328) b!392071))

(assert (= (and d!73119 (not c!54328)) b!392072))

(assert (= (and b!392072 c!54332) b!392081))

(assert (= (and b!392072 (not c!54332)) b!392077))

(assert (= (and b!392077 c!54327) b!392069))

(assert (= (and b!392077 (not c!54327)) b!392063))

(assert (= (or b!392069 b!392063) bm!27673))

(assert (= (or b!392081 bm!27673) bm!27670))

(assert (= (or b!392081 b!392069) bm!27669))

(assert (= (or b!392071 bm!27670) bm!27672))

(assert (= (or b!392071 bm!27669) bm!27671))

(assert (= (and d!73119 res!224490) b!392073))

(assert (= (and d!73119 c!54329) b!392065))

(assert (= (and d!73119 (not c!54329)) b!392080))

(assert (= (and d!73119 res!224489) b!392067))

(assert (= (and b!392067 res!224488) b!392079))

(assert (= (and b!392067 (not res!224492)) b!392064))

(assert (= (and b!392064 res!224491) b!392075))

(assert (= (and b!392067 res!224493) b!392068))

(assert (= (and b!392068 c!54330) b!392076))

(assert (= (and b!392068 (not c!54330)) b!392070))

(assert (= (and b!392076 res!224486) b!392082))

(assert (= (or b!392076 b!392070) bm!27668))

(assert (= (and b!392068 res!224487) b!392066))

(assert (= (and b!392066 c!54331) b!392078))

(assert (= (and b!392066 (not c!54331)) b!392083))

(assert (= (and b!392078 res!224494) b!392074))

(assert (= (or b!392078 b!392083) bm!27667))

(declare-fun b_lambda!8705 () Bool)

(assert (=> (not b_lambda!8705) (not b!392075)))

(assert (=> b!392075 t!11599))

(declare-fun b_and!16337 () Bool)

(assert (= b_and!16335 (and (=> t!11599 result!5749) b_and!16337)))

(assert (=> b!392064 m!388343))

(assert (=> b!392064 m!388343))

(declare-fun m!388461 () Bool)

(assert (=> b!392064 m!388461))

(declare-fun m!388463 () Bool)

(assert (=> bm!27667 m!388463))

(declare-fun m!388465 () Bool)

(assert (=> b!392065 m!388465))

(declare-fun m!388467 () Bool)

(assert (=> b!392065 m!388467))

(assert (=> b!392065 m!388465))

(declare-fun m!388469 () Bool)

(assert (=> b!392065 m!388469))

(assert (=> b!392065 m!388467))

(declare-fun m!388471 () Bool)

(assert (=> b!392065 m!388471))

(declare-fun m!388473 () Bool)

(assert (=> b!392065 m!388473))

(declare-fun m!388475 () Bool)

(assert (=> b!392065 m!388475))

(declare-fun m!388477 () Bool)

(assert (=> b!392065 m!388477))

(assert (=> b!392065 m!388477))

(declare-fun m!388479 () Bool)

(assert (=> b!392065 m!388479))

(assert (=> b!392065 m!388343))

(declare-fun m!388481 () Bool)

(assert (=> b!392065 m!388481))

(declare-fun m!388483 () Bool)

(assert (=> b!392065 m!388483))

(declare-fun m!388485 () Bool)

(assert (=> b!392065 m!388485))

(declare-fun m!388487 () Bool)

(assert (=> b!392065 m!388487))

(declare-fun m!388489 () Bool)

(assert (=> b!392065 m!388489))

(assert (=> b!392065 m!388257))

(assert (=> b!392065 m!388475))

(declare-fun m!388491 () Bool)

(assert (=> b!392065 m!388491))

(declare-fun m!388493 () Bool)

(assert (=> b!392065 m!388493))

(declare-fun m!388495 () Bool)

(assert (=> b!392082 m!388495))

(declare-fun m!388497 () Bool)

(assert (=> b!392071 m!388497))

(declare-fun m!388499 () Bool)

(assert (=> b!392074 m!388499))

(assert (=> b!392075 m!388343))

(assert (=> b!392075 m!388367))

(assert (=> b!392075 m!388343))

(declare-fun m!388501 () Bool)

(assert (=> b!392075 m!388501))

(assert (=> b!392075 m!388431))

(assert (=> b!392075 m!388367))

(assert (=> b!392075 m!388441))

(assert (=> b!392075 m!388431))

(declare-fun m!388503 () Bool)

(assert (=> bm!27668 m!388503))

(declare-fun m!388505 () Bool)

(assert (=> bm!27671 m!388505))

(assert (=> bm!27672 m!388257))

(assert (=> b!392073 m!388343))

(assert (=> b!392073 m!388343))

(assert (=> b!392073 m!388345))

(assert (=> b!392079 m!388343))

(assert (=> b!392079 m!388343))

(assert (=> b!392079 m!388345))

(assert (=> d!73119 m!388265))

(assert (=> b!391838 d!73119))

(declare-fun d!73121 () Bool)

(declare-fun e!237448 () Bool)

(assert (=> d!73121 e!237448))

(declare-fun res!224495 () Bool)

(assert (=> d!73121 (=> (not res!224495) (not e!237448))))

(declare-fun lt!185209 () ListLongMap!5489)

(assert (=> d!73121 (= res!224495 (contains!2461 lt!185209 (_1!3299 (tuple2!6577 k0!778 v!373))))))

(declare-fun lt!185210 () List!6430)

(assert (=> d!73121 (= lt!185209 (ListLongMap!5490 lt!185210))))

(declare-fun lt!185211 () Unit!11992)

(declare-fun lt!185208 () Unit!11992)

(assert (=> d!73121 (= lt!185211 lt!185208)))

(assert (=> d!73121 (= (getValueByKey!362 lt!185210 (_1!3299 (tuple2!6577 k0!778 v!373))) (Some!367 (_2!3299 (tuple2!6577 k0!778 v!373))))))

(assert (=> d!73121 (= lt!185208 (lemmaContainsTupThenGetReturnValue!184 lt!185210 (_1!3299 (tuple2!6577 k0!778 v!373)) (_2!3299 (tuple2!6577 k0!778 v!373))))))

(assert (=> d!73121 (= lt!185210 (insertStrictlySorted!187 (toList!2760 lt!185036) (_1!3299 (tuple2!6577 k0!778 v!373)) (_2!3299 (tuple2!6577 k0!778 v!373))))))

(assert (=> d!73121 (= (+!1055 lt!185036 (tuple2!6577 k0!778 v!373)) lt!185209)))

(declare-fun b!392084 () Bool)

(declare-fun res!224496 () Bool)

(assert (=> b!392084 (=> (not res!224496) (not e!237448))))

(assert (=> b!392084 (= res!224496 (= (getValueByKey!362 (toList!2760 lt!185209) (_1!3299 (tuple2!6577 k0!778 v!373))) (Some!367 (_2!3299 (tuple2!6577 k0!778 v!373)))))))

(declare-fun b!392085 () Bool)

(assert (=> b!392085 (= e!237448 (contains!2462 (toList!2760 lt!185209) (tuple2!6577 k0!778 v!373)))))

(assert (= (and d!73121 res!224495) b!392084))

(assert (= (and b!392084 res!224496) b!392085))

(declare-fun m!388507 () Bool)

(assert (=> d!73121 m!388507))

(declare-fun m!388509 () Bool)

(assert (=> d!73121 m!388509))

(declare-fun m!388511 () Bool)

(assert (=> d!73121 m!388511))

(declare-fun m!388513 () Bool)

(assert (=> d!73121 m!388513))

(declare-fun m!388515 () Bool)

(assert (=> b!392084 m!388515))

(declare-fun m!388517 () Bool)

(assert (=> b!392085 m!388517))

(assert (=> b!391838 d!73121))

(declare-fun mapIsEmpty!16095 () Bool)

(declare-fun mapRes!16095 () Bool)

(assert (=> mapIsEmpty!16095 mapRes!16095))

(declare-fun mapNonEmpty!16095 () Bool)

(declare-fun tp!31773 () Bool)

(declare-fun e!237454 () Bool)

(assert (=> mapNonEmpty!16095 (= mapRes!16095 (and tp!31773 e!237454))))

(declare-fun mapRest!16095 () (Array (_ BitVec 32) ValueCell!4491))

(declare-fun mapKey!16095 () (_ BitVec 32))

(declare-fun mapValue!16095 () ValueCell!4491)

(assert (=> mapNonEmpty!16095 (= mapRest!16089 (store mapRest!16095 mapKey!16095 mapValue!16095))))

(declare-fun b!392092 () Bool)

(assert (=> b!392092 (= e!237454 tp_is_empty!9669)))

(declare-fun condMapEmpty!16095 () Bool)

(declare-fun mapDefault!16095 () ValueCell!4491)

(assert (=> mapNonEmpty!16089 (= condMapEmpty!16095 (= mapRest!16089 ((as const (Array (_ BitVec 32) ValueCell!4491)) mapDefault!16095)))))

(declare-fun e!237453 () Bool)

(assert (=> mapNonEmpty!16089 (= tp!31763 (and e!237453 mapRes!16095))))

(declare-fun b!392093 () Bool)

(assert (=> b!392093 (= e!237453 tp_is_empty!9669)))

(assert (= (and mapNonEmpty!16089 condMapEmpty!16095) mapIsEmpty!16095))

(assert (= (and mapNonEmpty!16089 (not condMapEmpty!16095)) mapNonEmpty!16095))

(assert (= (and mapNonEmpty!16095 ((_ is ValueCellFull!4491) mapValue!16095)) b!392092))

(assert (= (and mapNonEmpty!16089 ((_ is ValueCellFull!4491) mapDefault!16095)) b!392093))

(declare-fun m!388519 () Bool)

(assert (=> mapNonEmpty!16095 m!388519))

(declare-fun b_lambda!8707 () Bool)

(assert (= b_lambda!8695 (or (and start!38050 b_free!8997) b_lambda!8707)))

(declare-fun b_lambda!8709 () Bool)

(assert (= b_lambda!8697 (or (and start!38050 b_free!8997) b_lambda!8709)))

(declare-fun b_lambda!8711 () Bool)

(assert (= b_lambda!8701 (or (and start!38050 b_free!8997) b_lambda!8711)))

(declare-fun b_lambda!8713 () Bool)

(assert (= b_lambda!8703 (or (and start!38050 b_free!8997) b_lambda!8713)))

(declare-fun b_lambda!8715 () Bool)

(assert (= b_lambda!8699 (or (and start!38050 b_free!8997) b_lambda!8715)))

(declare-fun b_lambda!8717 () Bool)

(assert (= b_lambda!8705 (or (and start!38050 b_free!8997) b_lambda!8717)))

(check-sat (not bm!27654) (not b!391910) (not b!391904) (not b!391973) (not b!391966) (not b!391909) (not bm!27635) (not d!73113) (not b!392071) (not b_next!8997) (not b!392042) tp_is_empty!9669 (not bm!27658) (not b_lambda!8711) (not b!392043) (not b!392037) (not bm!27633) (not b!392079) (not b!392046) (not d!73095) (not b_lambda!8707) (not b!392040) (not b!392052) (not b!391928) (not b!392085) (not b!392053) (not bm!27634) (not bm!27660) b_and!16337 (not b!391971) (not b!391932) (not b!391922) (not b!392073) (not b!392033) (not b!392031) (not b!392065) (not b!391965) (not b!392023) (not bm!27672) (not bm!27653) (not b!392022) (not b!391931) (not b!391975) (not bm!27666) (not b!392032) (not bm!27665) (not bm!27638) (not b!391940) (not b!392084) (not b!391923) (not b!392050) (not d!73119) (not d!73117) (not b_lambda!8713) (not bm!27668) (not b_lambda!8717) (not mapNonEmpty!16095) (not b!391969) (not b!392075) (not b!391970) (not b!392061) (not bm!27630) (not b!391933) (not bm!27667) (not bm!27671) (not b!392082) (not b!392074) (not d!73111) (not b!392029) (not bm!27657) (not b!392048) (not b!391929) (not d!73115) (not b_lambda!8715) (not b!391903) (not d!73121) (not b_lambda!8709) (not b!392064) (not b!392047) (not b!391924) (not b!391976))
(check-sat b_and!16337 (not b_next!8997))
