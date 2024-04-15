; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38096 () Bool)

(assert start!38096)

(declare-fun b_free!9013 () Bool)

(declare-fun b_next!9013 () Bool)

(assert (=> start!38096 (= b_free!9013 (not b_next!9013))))

(declare-fun tp!31817 () Bool)

(declare-fun b_and!16337 () Bool)

(assert (=> start!38096 (= tp!31817 b_and!16337)))

(declare-fun b!392321 () Bool)

(declare-fun res!224704 () Bool)

(declare-fun e!237571 () Bool)

(assert (=> b!392321 (=> (not res!224704) (not e!237571))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23261 0))(
  ( (array!23262 (arr!11090 (Array (_ BitVec 32) (_ BitVec 64))) (size!11443 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23261)

(assert (=> b!392321 (= res!224704 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11443 _keys!658))))))

(declare-fun b!392322 () Bool)

(declare-fun e!237565 () Bool)

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!392322 (= e!237565 (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!237564 () Bool)

(assert (=> b!392322 e!237564))

(declare-fun res!224706 () Bool)

(assert (=> b!392322 (=> (not res!224706) (not e!237564))))

(declare-datatypes ((V!14019 0))(
  ( (V!14020 (val!4887 Int)) )
))
(declare-datatypes ((tuple2!6562 0))(
  ( (tuple2!6563 (_1!3292 (_ BitVec 64)) (_2!3292 V!14019)) )
))
(declare-fun lt!185314 () tuple2!6562)

(declare-datatypes ((List!6405 0))(
  ( (Nil!6402) (Cons!6401 (h!7257 tuple2!6562) (t!11564 List!6405)) )
))
(declare-datatypes ((ListLongMap!5465 0))(
  ( (ListLongMap!5466 (toList!2748 List!6405)) )
))
(declare-fun lt!185317 () ListLongMap!5465)

(declare-fun lt!185315 () ListLongMap!5465)

(declare-fun +!1068 (ListLongMap!5465 tuple2!6562) ListLongMap!5465)

(assert (=> b!392322 (= res!224706 (= lt!185317 (+!1068 lt!185315 lt!185314)))))

(declare-fun minValue!472 () V!14019)

(assert (=> b!392322 (= lt!185314 (tuple2!6563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392323 () Bool)

(declare-fun e!237570 () Bool)

(assert (=> b!392323 (= e!237571 e!237570)))

(declare-fun res!224705 () Bool)

(assert (=> b!392323 (=> (not res!224705) (not e!237570))))

(declare-fun lt!185318 () array!23261)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23261 (_ BitVec 32)) Bool)

(assert (=> b!392323 (= res!224705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185318 mask!970))))

(assert (=> b!392323 (= lt!185318 (array!23262 (store (arr!11090 _keys!658) i!548 k0!778) (size!11443 _keys!658)))))

(declare-fun b!392324 () Bool)

(assert (=> b!392324 (= e!237570 (not e!237565))))

(declare-fun res!224695 () Bool)

(assert (=> b!392324 (=> res!224695 e!237565)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392324 (= res!224695 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!185319 () ListLongMap!5465)

(declare-datatypes ((ValueCell!4499 0))(
  ( (ValueCellFull!4499 (v!7114 V!14019)) (EmptyCell!4499) )
))
(declare-datatypes ((array!23263 0))(
  ( (array!23264 (arr!11091 (Array (_ BitVec 32) ValueCell!4499)) (size!11444 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23263)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14019)

(declare-fun getCurrentListMap!2067 (array!23261 array!23263 (_ BitVec 32) (_ BitVec 32) V!14019 V!14019 (_ BitVec 32) Int) ListLongMap!5465)

(assert (=> b!392324 (= lt!185319 (getCurrentListMap!2067 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185313 () array!23263)

(assert (=> b!392324 (= lt!185317 (getCurrentListMap!2067 lt!185318 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185320 () ListLongMap!5465)

(assert (=> b!392324 (and (= lt!185315 lt!185320) (= lt!185320 lt!185315))))

(declare-fun lt!185321 () ListLongMap!5465)

(declare-fun v!373 () V!14019)

(assert (=> b!392324 (= lt!185320 (+!1068 lt!185321 (tuple2!6563 k0!778 v!373)))))

(declare-datatypes ((Unit!11984 0))(
  ( (Unit!11985) )
))
(declare-fun lt!185316 () Unit!11984)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!268 (array!23261 array!23263 (_ BitVec 32) (_ BitVec 32) V!14019 V!14019 (_ BitVec 32) (_ BitVec 64) V!14019 (_ BitVec 32) Int) Unit!11984)

(assert (=> b!392324 (= lt!185316 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!268 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!977 (array!23261 array!23263 (_ BitVec 32) (_ BitVec 32) V!14019 V!14019 (_ BitVec 32) Int) ListLongMap!5465)

(assert (=> b!392324 (= lt!185315 (getCurrentListMapNoExtraKeys!977 lt!185318 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392324 (= lt!185313 (array!23264 (store (arr!11091 _values!506) i!548 (ValueCellFull!4499 v!373)) (size!11444 _values!506)))))

(assert (=> b!392324 (= lt!185321 (getCurrentListMapNoExtraKeys!977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!16119 () Bool)

(declare-fun mapRes!16119 () Bool)

(declare-fun tp!31818 () Bool)

(declare-fun e!237569 () Bool)

(assert (=> mapNonEmpty!16119 (= mapRes!16119 (and tp!31818 e!237569))))

(declare-fun mapRest!16119 () (Array (_ BitVec 32) ValueCell!4499))

(declare-fun mapKey!16119 () (_ BitVec 32))

(declare-fun mapValue!16119 () ValueCell!4499)

(assert (=> mapNonEmpty!16119 (= (arr!11091 _values!506) (store mapRest!16119 mapKey!16119 mapValue!16119))))

(declare-fun mapIsEmpty!16119 () Bool)

(assert (=> mapIsEmpty!16119 mapRes!16119))

(declare-fun b!392325 () Bool)

(declare-fun e!237566 () Bool)

(declare-fun e!237568 () Bool)

(assert (=> b!392325 (= e!237566 (and e!237568 mapRes!16119))))

(declare-fun condMapEmpty!16119 () Bool)

(declare-fun mapDefault!16119 () ValueCell!4499)

(assert (=> b!392325 (= condMapEmpty!16119 (= (arr!11091 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4499)) mapDefault!16119)))))

(declare-fun b!392327 () Bool)

(declare-fun res!224699 () Bool)

(assert (=> b!392327 (=> (not res!224699) (not e!237571))))

(declare-datatypes ((List!6406 0))(
  ( (Nil!6403) (Cons!6402 (h!7258 (_ BitVec 64)) (t!11565 List!6406)) )
))
(declare-fun arrayNoDuplicates!0 (array!23261 (_ BitVec 32) List!6406) Bool)

(assert (=> b!392327 (= res!224699 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6403))))

(declare-fun b!392328 () Bool)

(declare-fun res!224703 () Bool)

(assert (=> b!392328 (=> (not res!224703) (not e!237570))))

(assert (=> b!392328 (= res!224703 (arrayNoDuplicates!0 lt!185318 #b00000000000000000000000000000000 Nil!6403))))

(declare-fun b!392329 () Bool)

(declare-fun res!224702 () Bool)

(assert (=> b!392329 (=> (not res!224702) (not e!237571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392329 (= res!224702 (validKeyInArray!0 k0!778))))

(declare-fun b!392330 () Bool)

(declare-fun res!224698 () Bool)

(assert (=> b!392330 (=> (not res!224698) (not e!237564))))

(assert (=> b!392330 (= res!224698 (= lt!185317 (+!1068 lt!185320 lt!185314)))))

(declare-fun b!392331 () Bool)

(declare-fun res!224701 () Bool)

(assert (=> b!392331 (=> (not res!224701) (not e!237571))))

(assert (=> b!392331 (= res!224701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392332 () Bool)

(declare-fun res!224694 () Bool)

(assert (=> b!392332 (=> (not res!224694) (not e!237571))))

(declare-fun arrayContainsKey!0 (array!23261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392332 (= res!224694 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!392333 () Bool)

(declare-fun res!224697 () Bool)

(assert (=> b!392333 (=> (not res!224697) (not e!237571))))

(assert (=> b!392333 (= res!224697 (and (= (size!11444 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11443 _keys!658) (size!11444 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392334 () Bool)

(declare-fun tp_is_empty!9685 () Bool)

(assert (=> b!392334 (= e!237569 tp_is_empty!9685)))

(declare-fun res!224696 () Bool)

(assert (=> start!38096 (=> (not res!224696) (not e!237571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38096 (= res!224696 (validMask!0 mask!970))))

(assert (=> start!38096 e!237571))

(declare-fun array_inv!8148 (array!23263) Bool)

(assert (=> start!38096 (and (array_inv!8148 _values!506) e!237566)))

(assert (=> start!38096 tp!31817))

(assert (=> start!38096 true))

(assert (=> start!38096 tp_is_empty!9685))

(declare-fun array_inv!8149 (array!23261) Bool)

(assert (=> start!38096 (array_inv!8149 _keys!658)))

(declare-fun b!392326 () Bool)

(assert (=> b!392326 (= e!237564 (= lt!185319 (+!1068 lt!185321 lt!185314)))))

(declare-fun b!392335 () Bool)

(declare-fun res!224700 () Bool)

(assert (=> b!392335 (=> (not res!224700) (not e!237571))))

(assert (=> b!392335 (= res!224700 (or (= (select (arr!11090 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11090 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392336 () Bool)

(assert (=> b!392336 (= e!237568 tp_is_empty!9685)))

(assert (= (and start!38096 res!224696) b!392333))

(assert (= (and b!392333 res!224697) b!392331))

(assert (= (and b!392331 res!224701) b!392327))

(assert (= (and b!392327 res!224699) b!392321))

(assert (= (and b!392321 res!224704) b!392329))

(assert (= (and b!392329 res!224702) b!392335))

(assert (= (and b!392335 res!224700) b!392332))

(assert (= (and b!392332 res!224694) b!392323))

(assert (= (and b!392323 res!224705) b!392328))

(assert (= (and b!392328 res!224703) b!392324))

(assert (= (and b!392324 (not res!224695)) b!392322))

(assert (= (and b!392322 res!224706) b!392330))

(assert (= (and b!392330 res!224698) b!392326))

(assert (= (and b!392325 condMapEmpty!16119) mapIsEmpty!16119))

(assert (= (and b!392325 (not condMapEmpty!16119)) mapNonEmpty!16119))

(get-info :version)

(assert (= (and mapNonEmpty!16119 ((_ is ValueCellFull!4499) mapValue!16119)) b!392334))

(assert (= (and b!392325 ((_ is ValueCellFull!4499) mapDefault!16119)) b!392336))

(assert (= start!38096 b!392325))

(declare-fun m!388287 () Bool)

(assert (=> b!392330 m!388287))

(declare-fun m!388289 () Bool)

(assert (=> b!392335 m!388289))

(declare-fun m!388291 () Bool)

(assert (=> b!392328 m!388291))

(declare-fun m!388293 () Bool)

(assert (=> start!38096 m!388293))

(declare-fun m!388295 () Bool)

(assert (=> start!38096 m!388295))

(declare-fun m!388297 () Bool)

(assert (=> start!38096 m!388297))

(declare-fun m!388299 () Bool)

(assert (=> b!392327 m!388299))

(declare-fun m!388301 () Bool)

(assert (=> b!392324 m!388301))

(declare-fun m!388303 () Bool)

(assert (=> b!392324 m!388303))

(declare-fun m!388305 () Bool)

(assert (=> b!392324 m!388305))

(declare-fun m!388307 () Bool)

(assert (=> b!392324 m!388307))

(declare-fun m!388309 () Bool)

(assert (=> b!392324 m!388309))

(declare-fun m!388311 () Bool)

(assert (=> b!392324 m!388311))

(declare-fun m!388313 () Bool)

(assert (=> b!392324 m!388313))

(declare-fun m!388315 () Bool)

(assert (=> b!392323 m!388315))

(declare-fun m!388317 () Bool)

(assert (=> b!392323 m!388317))

(declare-fun m!388319 () Bool)

(assert (=> mapNonEmpty!16119 m!388319))

(declare-fun m!388321 () Bool)

(assert (=> b!392326 m!388321))

(declare-fun m!388323 () Bool)

(assert (=> b!392329 m!388323))

(declare-fun m!388325 () Bool)

(assert (=> b!392332 m!388325))

(declare-fun m!388327 () Bool)

(assert (=> b!392322 m!388327))

(declare-fun m!388329 () Bool)

(assert (=> b!392331 m!388329))

(check-sat (not b!392330) b_and!16337 (not b_next!9013) (not start!38096) (not b!392331) (not b!392332) (not b!392329) (not b!392327) tp_is_empty!9685 (not b!392326) (not b!392328) (not b!392323) (not b!392324) (not b!392322) (not mapNonEmpty!16119))
(check-sat b_and!16337 (not b_next!9013))
(get-model)

(declare-fun d!72961 () Bool)

(assert (=> d!72961 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392329 d!72961))

(declare-fun d!72963 () Bool)

(declare-fun e!237622 () Bool)

(assert (=> d!72963 e!237622))

(declare-fun res!224790 () Bool)

(assert (=> d!72963 (=> (not res!224790) (not e!237622))))

(declare-fun lt!185387 () ListLongMap!5465)

(declare-fun contains!2457 (ListLongMap!5465 (_ BitVec 64)) Bool)

(assert (=> d!72963 (= res!224790 (contains!2457 lt!185387 (_1!3292 lt!185314)))))

(declare-fun lt!185385 () List!6405)

(assert (=> d!72963 (= lt!185387 (ListLongMap!5466 lt!185385))))

(declare-fun lt!185386 () Unit!11984)

(declare-fun lt!185384 () Unit!11984)

(assert (=> d!72963 (= lt!185386 lt!185384)))

(declare-datatypes ((Option!368 0))(
  ( (Some!367 (v!7120 V!14019)) (None!366) )
))
(declare-fun getValueByKey!362 (List!6405 (_ BitVec 64)) Option!368)

(assert (=> d!72963 (= (getValueByKey!362 lt!185385 (_1!3292 lt!185314)) (Some!367 (_2!3292 lt!185314)))))

(declare-fun lemmaContainsTupThenGetReturnValue!187 (List!6405 (_ BitVec 64) V!14019) Unit!11984)

(assert (=> d!72963 (= lt!185384 (lemmaContainsTupThenGetReturnValue!187 lt!185385 (_1!3292 lt!185314) (_2!3292 lt!185314)))))

(declare-fun insertStrictlySorted!190 (List!6405 (_ BitVec 64) V!14019) List!6405)

(assert (=> d!72963 (= lt!185385 (insertStrictlySorted!190 (toList!2748 lt!185320) (_1!3292 lt!185314) (_2!3292 lt!185314)))))

(assert (=> d!72963 (= (+!1068 lt!185320 lt!185314) lt!185387)))

(declare-fun b!392437 () Bool)

(declare-fun res!224789 () Bool)

(assert (=> b!392437 (=> (not res!224789) (not e!237622))))

(assert (=> b!392437 (= res!224789 (= (getValueByKey!362 (toList!2748 lt!185387) (_1!3292 lt!185314)) (Some!367 (_2!3292 lt!185314))))))

(declare-fun b!392438 () Bool)

(declare-fun contains!2458 (List!6405 tuple2!6562) Bool)

(assert (=> b!392438 (= e!237622 (contains!2458 (toList!2748 lt!185387) lt!185314))))

(assert (= (and d!72963 res!224790) b!392437))

(assert (= (and b!392437 res!224789) b!392438))

(declare-fun m!388419 () Bool)

(assert (=> d!72963 m!388419))

(declare-fun m!388421 () Bool)

(assert (=> d!72963 m!388421))

(declare-fun m!388423 () Bool)

(assert (=> d!72963 m!388423))

(declare-fun m!388425 () Bool)

(assert (=> d!72963 m!388425))

(declare-fun m!388427 () Bool)

(assert (=> b!392437 m!388427))

(declare-fun m!388429 () Bool)

(assert (=> b!392438 m!388429))

(assert (=> b!392330 d!72963))

(declare-fun d!72965 () Bool)

(declare-fun e!237623 () Bool)

(assert (=> d!72965 e!237623))

(declare-fun res!224792 () Bool)

(assert (=> d!72965 (=> (not res!224792) (not e!237623))))

(declare-fun lt!185391 () ListLongMap!5465)

(assert (=> d!72965 (= res!224792 (contains!2457 lt!185391 (_1!3292 lt!185314)))))

(declare-fun lt!185389 () List!6405)

(assert (=> d!72965 (= lt!185391 (ListLongMap!5466 lt!185389))))

(declare-fun lt!185390 () Unit!11984)

(declare-fun lt!185388 () Unit!11984)

(assert (=> d!72965 (= lt!185390 lt!185388)))

(assert (=> d!72965 (= (getValueByKey!362 lt!185389 (_1!3292 lt!185314)) (Some!367 (_2!3292 lt!185314)))))

(assert (=> d!72965 (= lt!185388 (lemmaContainsTupThenGetReturnValue!187 lt!185389 (_1!3292 lt!185314) (_2!3292 lt!185314)))))

(assert (=> d!72965 (= lt!185389 (insertStrictlySorted!190 (toList!2748 lt!185315) (_1!3292 lt!185314) (_2!3292 lt!185314)))))

(assert (=> d!72965 (= (+!1068 lt!185315 lt!185314) lt!185391)))

(declare-fun b!392439 () Bool)

(declare-fun res!224791 () Bool)

(assert (=> b!392439 (=> (not res!224791) (not e!237623))))

(assert (=> b!392439 (= res!224791 (= (getValueByKey!362 (toList!2748 lt!185391) (_1!3292 lt!185314)) (Some!367 (_2!3292 lt!185314))))))

(declare-fun b!392440 () Bool)

(assert (=> b!392440 (= e!237623 (contains!2458 (toList!2748 lt!185391) lt!185314))))

(assert (= (and d!72965 res!224792) b!392439))

(assert (= (and b!392439 res!224791) b!392440))

(declare-fun m!388431 () Bool)

(assert (=> d!72965 m!388431))

(declare-fun m!388433 () Bool)

(assert (=> d!72965 m!388433))

(declare-fun m!388435 () Bool)

(assert (=> d!72965 m!388435))

(declare-fun m!388437 () Bool)

(assert (=> d!72965 m!388437))

(declare-fun m!388439 () Bool)

(assert (=> b!392439 m!388439))

(declare-fun m!388441 () Bool)

(assert (=> b!392440 m!388441))

(assert (=> b!392322 d!72965))

(declare-fun b!392449 () Bool)

(declare-fun e!237632 () Bool)

(declare-fun e!237630 () Bool)

(assert (=> b!392449 (= e!237632 e!237630)))

(declare-fun lt!185400 () (_ BitVec 64))

(assert (=> b!392449 (= lt!185400 (select (arr!11090 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185399 () Unit!11984)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23261 (_ BitVec 64) (_ BitVec 32)) Unit!11984)

(assert (=> b!392449 (= lt!185399 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!185400 #b00000000000000000000000000000000))))

(assert (=> b!392449 (arrayContainsKey!0 _keys!658 lt!185400 #b00000000000000000000000000000000)))

(declare-fun lt!185398 () Unit!11984)

(assert (=> b!392449 (= lt!185398 lt!185399)))

(declare-fun res!224798 () Bool)

(declare-datatypes ((SeekEntryResult!3512 0))(
  ( (MissingZero!3512 (index!16227 (_ BitVec 32))) (Found!3512 (index!16228 (_ BitVec 32))) (Intermediate!3512 (undefined!4324 Bool) (index!16229 (_ BitVec 32)) (x!38423 (_ BitVec 32))) (Undefined!3512) (MissingVacant!3512 (index!16230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23261 (_ BitVec 32)) SeekEntryResult!3512)

(assert (=> b!392449 (= res!224798 (= (seekEntryOrOpen!0 (select (arr!11090 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3512 #b00000000000000000000000000000000)))))

(assert (=> b!392449 (=> (not res!224798) (not e!237630))))

(declare-fun bm!27697 () Bool)

(declare-fun call!27700 () Bool)

(assert (=> bm!27697 (= call!27700 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!392450 () Bool)

(assert (=> b!392450 (= e!237630 call!27700)))

(declare-fun b!392451 () Bool)

(assert (=> b!392451 (= e!237632 call!27700)))

(declare-fun d!72967 () Bool)

(declare-fun res!224797 () Bool)

(declare-fun e!237631 () Bool)

(assert (=> d!72967 (=> res!224797 e!237631)))

(assert (=> d!72967 (= res!224797 (bvsge #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(assert (=> d!72967 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!237631)))

(declare-fun b!392452 () Bool)

(assert (=> b!392452 (= e!237631 e!237632)))

(declare-fun c!54315 () Bool)

(assert (=> b!392452 (= c!54315 (validKeyInArray!0 (select (arr!11090 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72967 (not res!224797)) b!392452))

(assert (= (and b!392452 c!54315) b!392449))

(assert (= (and b!392452 (not c!54315)) b!392451))

(assert (= (and b!392449 res!224798) b!392450))

(assert (= (or b!392450 b!392451) bm!27697))

(declare-fun m!388443 () Bool)

(assert (=> b!392449 m!388443))

(declare-fun m!388445 () Bool)

(assert (=> b!392449 m!388445))

(declare-fun m!388447 () Bool)

(assert (=> b!392449 m!388447))

(assert (=> b!392449 m!388443))

(declare-fun m!388449 () Bool)

(assert (=> b!392449 m!388449))

(declare-fun m!388451 () Bool)

(assert (=> bm!27697 m!388451))

(assert (=> b!392452 m!388443))

(assert (=> b!392452 m!388443))

(declare-fun m!388453 () Bool)

(assert (=> b!392452 m!388453))

(assert (=> b!392331 d!72967))

(declare-fun d!72969 () Bool)

(declare-fun e!237633 () Bool)

(assert (=> d!72969 e!237633))

(declare-fun res!224800 () Bool)

(assert (=> d!72969 (=> (not res!224800) (not e!237633))))

(declare-fun lt!185404 () ListLongMap!5465)

(assert (=> d!72969 (= res!224800 (contains!2457 lt!185404 (_1!3292 lt!185314)))))

(declare-fun lt!185402 () List!6405)

(assert (=> d!72969 (= lt!185404 (ListLongMap!5466 lt!185402))))

(declare-fun lt!185403 () Unit!11984)

(declare-fun lt!185401 () Unit!11984)

(assert (=> d!72969 (= lt!185403 lt!185401)))

(assert (=> d!72969 (= (getValueByKey!362 lt!185402 (_1!3292 lt!185314)) (Some!367 (_2!3292 lt!185314)))))

(assert (=> d!72969 (= lt!185401 (lemmaContainsTupThenGetReturnValue!187 lt!185402 (_1!3292 lt!185314) (_2!3292 lt!185314)))))

(assert (=> d!72969 (= lt!185402 (insertStrictlySorted!190 (toList!2748 lt!185321) (_1!3292 lt!185314) (_2!3292 lt!185314)))))

(assert (=> d!72969 (= (+!1068 lt!185321 lt!185314) lt!185404)))

(declare-fun b!392453 () Bool)

(declare-fun res!224799 () Bool)

(assert (=> b!392453 (=> (not res!224799) (not e!237633))))

(assert (=> b!392453 (= res!224799 (= (getValueByKey!362 (toList!2748 lt!185404) (_1!3292 lt!185314)) (Some!367 (_2!3292 lt!185314))))))

(declare-fun b!392454 () Bool)

(assert (=> b!392454 (= e!237633 (contains!2458 (toList!2748 lt!185404) lt!185314))))

(assert (= (and d!72969 res!224800) b!392453))

(assert (= (and b!392453 res!224799) b!392454))

(declare-fun m!388455 () Bool)

(assert (=> d!72969 m!388455))

(declare-fun m!388457 () Bool)

(assert (=> d!72969 m!388457))

(declare-fun m!388459 () Bool)

(assert (=> d!72969 m!388459))

(declare-fun m!388461 () Bool)

(assert (=> d!72969 m!388461))

(declare-fun m!388463 () Bool)

(assert (=> b!392453 m!388463))

(declare-fun m!388465 () Bool)

(assert (=> b!392454 m!388465))

(assert (=> b!392326 d!72969))

(declare-fun d!72971 () Bool)

(assert (=> d!72971 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38096 d!72971))

(declare-fun d!72973 () Bool)

(assert (=> d!72973 (= (array_inv!8148 _values!506) (bvsge (size!11444 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38096 d!72973))

(declare-fun d!72975 () Bool)

(assert (=> d!72975 (= (array_inv!8149 _keys!658) (bvsge (size!11443 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38096 d!72975))

(declare-fun b!392455 () Bool)

(declare-fun e!237636 () Bool)

(declare-fun e!237634 () Bool)

(assert (=> b!392455 (= e!237636 e!237634)))

(declare-fun lt!185407 () (_ BitVec 64))

(assert (=> b!392455 (= lt!185407 (select (arr!11090 lt!185318) #b00000000000000000000000000000000))))

(declare-fun lt!185406 () Unit!11984)

(assert (=> b!392455 (= lt!185406 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!185318 lt!185407 #b00000000000000000000000000000000))))

(assert (=> b!392455 (arrayContainsKey!0 lt!185318 lt!185407 #b00000000000000000000000000000000)))

(declare-fun lt!185405 () Unit!11984)

(assert (=> b!392455 (= lt!185405 lt!185406)))

(declare-fun res!224802 () Bool)

(assert (=> b!392455 (= res!224802 (= (seekEntryOrOpen!0 (select (arr!11090 lt!185318) #b00000000000000000000000000000000) lt!185318 mask!970) (Found!3512 #b00000000000000000000000000000000)))))

(assert (=> b!392455 (=> (not res!224802) (not e!237634))))

(declare-fun bm!27698 () Bool)

(declare-fun call!27701 () Bool)

(assert (=> bm!27698 (= call!27701 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!185318 mask!970))))

(declare-fun b!392456 () Bool)

(assert (=> b!392456 (= e!237634 call!27701)))

(declare-fun b!392457 () Bool)

(assert (=> b!392457 (= e!237636 call!27701)))

(declare-fun d!72977 () Bool)

(declare-fun res!224801 () Bool)

(declare-fun e!237635 () Bool)

(assert (=> d!72977 (=> res!224801 e!237635)))

(assert (=> d!72977 (= res!224801 (bvsge #b00000000000000000000000000000000 (size!11443 lt!185318)))))

(assert (=> d!72977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185318 mask!970) e!237635)))

(declare-fun b!392458 () Bool)

(assert (=> b!392458 (= e!237635 e!237636)))

(declare-fun c!54316 () Bool)

(assert (=> b!392458 (= c!54316 (validKeyInArray!0 (select (arr!11090 lt!185318) #b00000000000000000000000000000000)))))

(assert (= (and d!72977 (not res!224801)) b!392458))

(assert (= (and b!392458 c!54316) b!392455))

(assert (= (and b!392458 (not c!54316)) b!392457))

(assert (= (and b!392455 res!224802) b!392456))

(assert (= (or b!392456 b!392457) bm!27698))

(declare-fun m!388467 () Bool)

(assert (=> b!392455 m!388467))

(declare-fun m!388469 () Bool)

(assert (=> b!392455 m!388469))

(declare-fun m!388471 () Bool)

(assert (=> b!392455 m!388471))

(assert (=> b!392455 m!388467))

(declare-fun m!388473 () Bool)

(assert (=> b!392455 m!388473))

(declare-fun m!388475 () Bool)

(assert (=> bm!27698 m!388475))

(assert (=> b!392458 m!388467))

(assert (=> b!392458 m!388467))

(declare-fun m!388477 () Bool)

(assert (=> b!392458 m!388477))

(assert (=> b!392323 d!72977))

(declare-fun d!72979 () Bool)

(declare-fun res!224807 () Bool)

(declare-fun e!237641 () Bool)

(assert (=> d!72979 (=> res!224807 e!237641)))

(assert (=> d!72979 (= res!224807 (= (select (arr!11090 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72979 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!237641)))

(declare-fun b!392463 () Bool)

(declare-fun e!237642 () Bool)

(assert (=> b!392463 (= e!237641 e!237642)))

(declare-fun res!224808 () Bool)

(assert (=> b!392463 (=> (not res!224808) (not e!237642))))

(assert (=> b!392463 (= res!224808 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11443 _keys!658)))))

(declare-fun b!392464 () Bool)

(assert (=> b!392464 (= e!237642 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72979 (not res!224807)) b!392463))

(assert (= (and b!392463 res!224808) b!392464))

(assert (=> d!72979 m!388443))

(declare-fun m!388479 () Bool)

(assert (=> b!392464 m!388479))

(assert (=> b!392332 d!72979))

(declare-fun b!392475 () Bool)

(declare-fun e!237651 () Bool)

(declare-fun contains!2459 (List!6406 (_ BitVec 64)) Bool)

(assert (=> b!392475 (= e!237651 (contains!2459 Nil!6403 (select (arr!11090 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392476 () Bool)

(declare-fun e!237654 () Bool)

(declare-fun call!27704 () Bool)

(assert (=> b!392476 (= e!237654 call!27704)))

(declare-fun b!392478 () Bool)

(declare-fun e!237653 () Bool)

(assert (=> b!392478 (= e!237653 e!237654)))

(declare-fun c!54319 () Bool)

(assert (=> b!392478 (= c!54319 (validKeyInArray!0 (select (arr!11090 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27701 () Bool)

(assert (=> bm!27701 (= call!27704 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54319 (Cons!6402 (select (arr!11090 _keys!658) #b00000000000000000000000000000000) Nil!6403) Nil!6403)))))

(declare-fun b!392479 () Bool)

(assert (=> b!392479 (= e!237654 call!27704)))

(declare-fun b!392477 () Bool)

(declare-fun e!237652 () Bool)

(assert (=> b!392477 (= e!237652 e!237653)))

(declare-fun res!224817 () Bool)

(assert (=> b!392477 (=> (not res!224817) (not e!237653))))

(assert (=> b!392477 (= res!224817 (not e!237651))))

(declare-fun res!224815 () Bool)

(assert (=> b!392477 (=> (not res!224815) (not e!237651))))

(assert (=> b!392477 (= res!224815 (validKeyInArray!0 (select (arr!11090 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72981 () Bool)

(declare-fun res!224816 () Bool)

(assert (=> d!72981 (=> res!224816 e!237652)))

(assert (=> d!72981 (= res!224816 (bvsge #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(assert (=> d!72981 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6403) e!237652)))

(assert (= (and d!72981 (not res!224816)) b!392477))

(assert (= (and b!392477 res!224815) b!392475))

(assert (= (and b!392477 res!224817) b!392478))

(assert (= (and b!392478 c!54319) b!392479))

(assert (= (and b!392478 (not c!54319)) b!392476))

(assert (= (or b!392479 b!392476) bm!27701))

(assert (=> b!392475 m!388443))

(assert (=> b!392475 m!388443))

(declare-fun m!388481 () Bool)

(assert (=> b!392475 m!388481))

(assert (=> b!392478 m!388443))

(assert (=> b!392478 m!388443))

(assert (=> b!392478 m!388453))

(assert (=> bm!27701 m!388443))

(declare-fun m!388483 () Bool)

(assert (=> bm!27701 m!388483))

(assert (=> b!392477 m!388443))

(assert (=> b!392477 m!388443))

(assert (=> b!392477 m!388453))

(assert (=> b!392327 d!72981))

(declare-fun b!392504 () Bool)

(assert (=> b!392504 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(assert (=> b!392504 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11444 _values!506)))))

(declare-fun e!237675 () Bool)

(declare-fun lt!185427 () ListLongMap!5465)

(declare-fun apply!306 (ListLongMap!5465 (_ BitVec 64)) V!14019)

(declare-fun get!5602 (ValueCell!4499 V!14019) V!14019)

(declare-fun dynLambda!640 (Int (_ BitVec 64)) V!14019)

(assert (=> b!392504 (= e!237675 (= (apply!306 lt!185427 (select (arr!11090 _keys!658) #b00000000000000000000000000000000)) (get!5602 (select (arr!11091 _values!506) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!392505 () Bool)

(declare-fun e!237670 () Bool)

(assert (=> b!392505 (= e!237670 (validKeyInArray!0 (select (arr!11090 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392505 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!392506 () Bool)

(declare-fun e!237672 () Bool)

(declare-fun e!237674 () Bool)

(assert (=> b!392506 (= e!237672 e!237674)))

(declare-fun c!54328 () Bool)

(assert (=> b!392506 (= c!54328 (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun b!392507 () Bool)

(declare-fun lt!185425 () Unit!11984)

(declare-fun lt!185428 () Unit!11984)

(assert (=> b!392507 (= lt!185425 lt!185428)))

(declare-fun lt!185422 () (_ BitVec 64))

(declare-fun lt!185424 () V!14019)

(declare-fun lt!185426 () ListLongMap!5465)

(declare-fun lt!185423 () (_ BitVec 64))

(assert (=> b!392507 (not (contains!2457 (+!1068 lt!185426 (tuple2!6563 lt!185422 lt!185424)) lt!185423))))

(declare-fun addStillNotContains!140 (ListLongMap!5465 (_ BitVec 64) V!14019 (_ BitVec 64)) Unit!11984)

(assert (=> b!392507 (= lt!185428 (addStillNotContains!140 lt!185426 lt!185422 lt!185424 lt!185423))))

(assert (=> b!392507 (= lt!185423 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392507 (= lt!185424 (get!5602 (select (arr!11091 _values!506) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392507 (= lt!185422 (select (arr!11090 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27707 () ListLongMap!5465)

(assert (=> b!392507 (= lt!185426 call!27707)))

(declare-fun e!237673 () ListLongMap!5465)

(assert (=> b!392507 (= e!237673 (+!1068 call!27707 (tuple2!6563 (select (arr!11090 _keys!658) #b00000000000000000000000000000000) (get!5602 (select (arr!11091 _values!506) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392508 () Bool)

(assert (=> b!392508 (= e!237673 call!27707)))

(declare-fun b!392509 () Bool)

(declare-fun e!237671 () ListLongMap!5465)

(assert (=> b!392509 (= e!237671 (ListLongMap!5466 Nil!6402))))

(declare-fun d!72983 () Bool)

(declare-fun e!237669 () Bool)

(assert (=> d!72983 e!237669))

(declare-fun res!224826 () Bool)

(assert (=> d!72983 (=> (not res!224826) (not e!237669))))

(assert (=> d!72983 (= res!224826 (not (contains!2457 lt!185427 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72983 (= lt!185427 e!237671)))

(declare-fun c!54331 () Bool)

(assert (=> d!72983 (= c!54331 (bvsge #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(assert (=> d!72983 (validMask!0 mask!970)))

(assert (=> d!72983 (= (getCurrentListMapNoExtraKeys!977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185427)))

(declare-fun b!392510 () Bool)

(assert (=> b!392510 (= e!237669 e!237672)))

(declare-fun c!54330 () Bool)

(assert (=> b!392510 (= c!54330 e!237670)))

(declare-fun res!224827 () Bool)

(assert (=> b!392510 (=> (not res!224827) (not e!237670))))

(assert (=> b!392510 (= res!224827 (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun b!392511 () Bool)

(declare-fun isEmpty!556 (ListLongMap!5465) Bool)

(assert (=> b!392511 (= e!237674 (isEmpty!556 lt!185427))))

(declare-fun b!392512 () Bool)

(assert (=> b!392512 (= e!237671 e!237673)))

(declare-fun c!54329 () Bool)

(assert (=> b!392512 (= c!54329 (validKeyInArray!0 (select (arr!11090 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392513 () Bool)

(assert (=> b!392513 (= e!237674 (= lt!185427 (getCurrentListMapNoExtraKeys!977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun bm!27704 () Bool)

(assert (=> bm!27704 (= call!27707 (getCurrentListMapNoExtraKeys!977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!392514 () Bool)

(assert (=> b!392514 (= e!237672 e!237675)))

(assert (=> b!392514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun res!224828 () Bool)

(assert (=> b!392514 (= res!224828 (contains!2457 lt!185427 (select (arr!11090 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392514 (=> (not res!224828) (not e!237675))))

(declare-fun b!392515 () Bool)

(declare-fun res!224829 () Bool)

(assert (=> b!392515 (=> (not res!224829) (not e!237669))))

(assert (=> b!392515 (= res!224829 (not (contains!2457 lt!185427 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!72983 c!54331) b!392509))

(assert (= (and d!72983 (not c!54331)) b!392512))

(assert (= (and b!392512 c!54329) b!392507))

(assert (= (and b!392512 (not c!54329)) b!392508))

(assert (= (or b!392507 b!392508) bm!27704))

(assert (= (and d!72983 res!224826) b!392515))

(assert (= (and b!392515 res!224829) b!392510))

(assert (= (and b!392510 res!224827) b!392505))

(assert (= (and b!392510 c!54330) b!392514))

(assert (= (and b!392510 (not c!54330)) b!392506))

(assert (= (and b!392514 res!224828) b!392504))

(assert (= (and b!392506 c!54328) b!392513))

(assert (= (and b!392506 (not c!54328)) b!392511))

(declare-fun b_lambda!8725 () Bool)

(assert (=> (not b_lambda!8725) (not b!392504)))

(declare-fun t!11569 () Bool)

(declare-fun tb!3119 () Bool)

(assert (=> (and start!38096 (= defaultEntry!514 defaultEntry!514) t!11569) tb!3119))

(declare-fun result!5753 () Bool)

(assert (=> tb!3119 (= result!5753 tp_is_empty!9685)))

(assert (=> b!392504 t!11569))

(declare-fun b_and!16343 () Bool)

(assert (= b_and!16337 (and (=> t!11569 result!5753) b_and!16343)))

(declare-fun b_lambda!8727 () Bool)

(assert (=> (not b_lambda!8727) (not b!392507)))

(assert (=> b!392507 t!11569))

(declare-fun b_and!16345 () Bool)

(assert (= b_and!16343 (and (=> t!11569 result!5753) b_and!16345)))

(declare-fun m!388485 () Bool)

(assert (=> b!392515 m!388485))

(declare-fun m!388487 () Bool)

(assert (=> d!72983 m!388487))

(assert (=> d!72983 m!388293))

(declare-fun m!388489 () Bool)

(assert (=> b!392511 m!388489))

(assert (=> b!392504 m!388443))

(declare-fun m!388491 () Bool)

(assert (=> b!392504 m!388491))

(declare-fun m!388493 () Bool)

(assert (=> b!392504 m!388493))

(declare-fun m!388495 () Bool)

(assert (=> b!392504 m!388495))

(assert (=> b!392504 m!388491))

(assert (=> b!392504 m!388493))

(assert (=> b!392504 m!388443))

(declare-fun m!388497 () Bool)

(assert (=> b!392504 m!388497))

(assert (=> b!392507 m!388443))

(assert (=> b!392507 m!388491))

(assert (=> b!392507 m!388493))

(assert (=> b!392507 m!388495))

(assert (=> b!392507 m!388491))

(assert (=> b!392507 m!388493))

(declare-fun m!388499 () Bool)

(assert (=> b!392507 m!388499))

(declare-fun m!388501 () Bool)

(assert (=> b!392507 m!388501))

(declare-fun m!388503 () Bool)

(assert (=> b!392507 m!388503))

(declare-fun m!388505 () Bool)

(assert (=> b!392507 m!388505))

(assert (=> b!392507 m!388501))

(declare-fun m!388507 () Bool)

(assert (=> b!392513 m!388507))

(assert (=> bm!27704 m!388507))

(assert (=> b!392505 m!388443))

(assert (=> b!392505 m!388443))

(assert (=> b!392505 m!388453))

(assert (=> b!392514 m!388443))

(assert (=> b!392514 m!388443))

(declare-fun m!388509 () Bool)

(assert (=> b!392514 m!388509))

(assert (=> b!392512 m!388443))

(assert (=> b!392512 m!388443))

(assert (=> b!392512 m!388453))

(assert (=> b!392324 d!72983))

(declare-fun b!392518 () Bool)

(assert (=> b!392518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 lt!185318)))))

(assert (=> b!392518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11444 lt!185313)))))

(declare-fun lt!185434 () ListLongMap!5465)

(declare-fun e!237682 () Bool)

(assert (=> b!392518 (= e!237682 (= (apply!306 lt!185434 (select (arr!11090 lt!185318) #b00000000000000000000000000000000)) (get!5602 (select (arr!11091 lt!185313) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!392519 () Bool)

(declare-fun e!237677 () Bool)

(assert (=> b!392519 (= e!237677 (validKeyInArray!0 (select (arr!11090 lt!185318) #b00000000000000000000000000000000)))))

(assert (=> b!392519 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!392520 () Bool)

(declare-fun e!237679 () Bool)

(declare-fun e!237681 () Bool)

(assert (=> b!392520 (= e!237679 e!237681)))

(declare-fun c!54332 () Bool)

(assert (=> b!392520 (= c!54332 (bvslt #b00000000000000000000000000000000 (size!11443 lt!185318)))))

(declare-fun b!392521 () Bool)

(declare-fun lt!185432 () Unit!11984)

(declare-fun lt!185435 () Unit!11984)

(assert (=> b!392521 (= lt!185432 lt!185435)))

(declare-fun lt!185433 () ListLongMap!5465)

(declare-fun lt!185431 () V!14019)

(declare-fun lt!185430 () (_ BitVec 64))

(declare-fun lt!185429 () (_ BitVec 64))

(assert (=> b!392521 (not (contains!2457 (+!1068 lt!185433 (tuple2!6563 lt!185429 lt!185431)) lt!185430))))

(assert (=> b!392521 (= lt!185435 (addStillNotContains!140 lt!185433 lt!185429 lt!185431 lt!185430))))

(assert (=> b!392521 (= lt!185430 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392521 (= lt!185431 (get!5602 (select (arr!11091 lt!185313) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392521 (= lt!185429 (select (arr!11090 lt!185318) #b00000000000000000000000000000000))))

(declare-fun call!27708 () ListLongMap!5465)

(assert (=> b!392521 (= lt!185433 call!27708)))

(declare-fun e!237680 () ListLongMap!5465)

(assert (=> b!392521 (= e!237680 (+!1068 call!27708 (tuple2!6563 (select (arr!11090 lt!185318) #b00000000000000000000000000000000) (get!5602 (select (arr!11091 lt!185313) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392522 () Bool)

(assert (=> b!392522 (= e!237680 call!27708)))

(declare-fun b!392523 () Bool)

(declare-fun e!237678 () ListLongMap!5465)

(assert (=> b!392523 (= e!237678 (ListLongMap!5466 Nil!6402))))

(declare-fun d!72985 () Bool)

(declare-fun e!237676 () Bool)

(assert (=> d!72985 e!237676))

(declare-fun res!224830 () Bool)

(assert (=> d!72985 (=> (not res!224830) (not e!237676))))

(assert (=> d!72985 (= res!224830 (not (contains!2457 lt!185434 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72985 (= lt!185434 e!237678)))

(declare-fun c!54335 () Bool)

(assert (=> d!72985 (= c!54335 (bvsge #b00000000000000000000000000000000 (size!11443 lt!185318)))))

(assert (=> d!72985 (validMask!0 mask!970)))

(assert (=> d!72985 (= (getCurrentListMapNoExtraKeys!977 lt!185318 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185434)))

(declare-fun b!392524 () Bool)

(assert (=> b!392524 (= e!237676 e!237679)))

(declare-fun c!54334 () Bool)

(assert (=> b!392524 (= c!54334 e!237677)))

(declare-fun res!224831 () Bool)

(assert (=> b!392524 (=> (not res!224831) (not e!237677))))

(assert (=> b!392524 (= res!224831 (bvslt #b00000000000000000000000000000000 (size!11443 lt!185318)))))

(declare-fun b!392525 () Bool)

(assert (=> b!392525 (= e!237681 (isEmpty!556 lt!185434))))

(declare-fun b!392526 () Bool)

(assert (=> b!392526 (= e!237678 e!237680)))

(declare-fun c!54333 () Bool)

(assert (=> b!392526 (= c!54333 (validKeyInArray!0 (select (arr!11090 lt!185318) #b00000000000000000000000000000000)))))

(declare-fun b!392527 () Bool)

(assert (=> b!392527 (= e!237681 (= lt!185434 (getCurrentListMapNoExtraKeys!977 lt!185318 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun bm!27705 () Bool)

(assert (=> bm!27705 (= call!27708 (getCurrentListMapNoExtraKeys!977 lt!185318 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!392528 () Bool)

(assert (=> b!392528 (= e!237679 e!237682)))

(assert (=> b!392528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 lt!185318)))))

(declare-fun res!224832 () Bool)

(assert (=> b!392528 (= res!224832 (contains!2457 lt!185434 (select (arr!11090 lt!185318) #b00000000000000000000000000000000)))))

(assert (=> b!392528 (=> (not res!224832) (not e!237682))))

(declare-fun b!392529 () Bool)

(declare-fun res!224833 () Bool)

(assert (=> b!392529 (=> (not res!224833) (not e!237676))))

(assert (=> b!392529 (= res!224833 (not (contains!2457 lt!185434 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!72985 c!54335) b!392523))

(assert (= (and d!72985 (not c!54335)) b!392526))

(assert (= (and b!392526 c!54333) b!392521))

(assert (= (and b!392526 (not c!54333)) b!392522))

(assert (= (or b!392521 b!392522) bm!27705))

(assert (= (and d!72985 res!224830) b!392529))

(assert (= (and b!392529 res!224833) b!392524))

(assert (= (and b!392524 res!224831) b!392519))

(assert (= (and b!392524 c!54334) b!392528))

(assert (= (and b!392524 (not c!54334)) b!392520))

(assert (= (and b!392528 res!224832) b!392518))

(assert (= (and b!392520 c!54332) b!392527))

(assert (= (and b!392520 (not c!54332)) b!392525))

(declare-fun b_lambda!8729 () Bool)

(assert (=> (not b_lambda!8729) (not b!392518)))

(assert (=> b!392518 t!11569))

(declare-fun b_and!16347 () Bool)

(assert (= b_and!16345 (and (=> t!11569 result!5753) b_and!16347)))

(declare-fun b_lambda!8731 () Bool)

(assert (=> (not b_lambda!8731) (not b!392521)))

(assert (=> b!392521 t!11569))

(declare-fun b_and!16349 () Bool)

(assert (= b_and!16347 (and (=> t!11569 result!5753) b_and!16349)))

(declare-fun m!388511 () Bool)

(assert (=> b!392529 m!388511))

(declare-fun m!388513 () Bool)

(assert (=> d!72985 m!388513))

(assert (=> d!72985 m!388293))

(declare-fun m!388515 () Bool)

(assert (=> b!392525 m!388515))

(assert (=> b!392518 m!388467))

(declare-fun m!388517 () Bool)

(assert (=> b!392518 m!388517))

(assert (=> b!392518 m!388493))

(declare-fun m!388519 () Bool)

(assert (=> b!392518 m!388519))

(assert (=> b!392518 m!388517))

(assert (=> b!392518 m!388493))

(assert (=> b!392518 m!388467))

(declare-fun m!388521 () Bool)

(assert (=> b!392518 m!388521))

(assert (=> b!392521 m!388467))

(assert (=> b!392521 m!388517))

(assert (=> b!392521 m!388493))

(assert (=> b!392521 m!388519))

(assert (=> b!392521 m!388517))

(assert (=> b!392521 m!388493))

(declare-fun m!388523 () Bool)

(assert (=> b!392521 m!388523))

(declare-fun m!388525 () Bool)

(assert (=> b!392521 m!388525))

(declare-fun m!388527 () Bool)

(assert (=> b!392521 m!388527))

(declare-fun m!388529 () Bool)

(assert (=> b!392521 m!388529))

(assert (=> b!392521 m!388525))

(declare-fun m!388531 () Bool)

(assert (=> b!392527 m!388531))

(assert (=> bm!27705 m!388531))

(assert (=> b!392519 m!388467))

(assert (=> b!392519 m!388467))

(assert (=> b!392519 m!388477))

(assert (=> b!392528 m!388467))

(assert (=> b!392528 m!388467))

(declare-fun m!388533 () Bool)

(assert (=> b!392528 m!388533))

(assert (=> b!392526 m!388467))

(assert (=> b!392526 m!388467))

(assert (=> b!392526 m!388477))

(assert (=> b!392324 d!72985))

(declare-fun bm!27720 () Bool)

(declare-fun call!27727 () Bool)

(declare-fun lt!185490 () ListLongMap!5465)

(assert (=> bm!27720 (= call!27727 (contains!2457 lt!185490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!392572 () Bool)

(declare-fun res!224852 () Bool)

(declare-fun e!237712 () Bool)

(assert (=> b!392572 (=> (not res!224852) (not e!237712))))

(declare-fun e!237709 () Bool)

(assert (=> b!392572 (= res!224852 e!237709)))

(declare-fun c!54348 () Bool)

(assert (=> b!392572 (= c!54348 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392573 () Bool)

(declare-fun e!237710 () Bool)

(declare-fun e!237713 () Bool)

(assert (=> b!392573 (= e!237710 e!237713)))

(declare-fun res!224857 () Bool)

(declare-fun call!27726 () Bool)

(assert (=> b!392573 (= res!224857 call!27726)))

(assert (=> b!392573 (=> (not res!224857) (not e!237713))))

(declare-fun b!392574 () Bool)

(declare-fun e!237719 () Bool)

(assert (=> b!392574 (= e!237719 (validKeyInArray!0 (select (arr!11090 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392575 () Bool)

(declare-fun e!237717 () Unit!11984)

(declare-fun Unit!11988 () Unit!11984)

(assert (=> b!392575 (= e!237717 Unit!11988)))

(declare-fun e!237718 () Bool)

(declare-fun b!392576 () Bool)

(assert (=> b!392576 (= e!237718 (= (apply!306 lt!185490 (select (arr!11090 _keys!658) #b00000000000000000000000000000000)) (get!5602 (select (arr!11091 _values!506) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392576 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11444 _values!506)))))

(assert (=> b!392576 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun b!392577 () Bool)

(declare-fun res!224854 () Bool)

(assert (=> b!392577 (=> (not res!224854) (not e!237712))))

(declare-fun e!237715 () Bool)

(assert (=> b!392577 (= res!224854 e!237715)))

(declare-fun res!224860 () Bool)

(assert (=> b!392577 (=> res!224860 e!237715)))

(declare-fun e!237721 () Bool)

(assert (=> b!392577 (= res!224860 (not e!237721))))

(declare-fun res!224853 () Bool)

(assert (=> b!392577 (=> (not res!224853) (not e!237721))))

(assert (=> b!392577 (= res!224853 (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun b!392578 () Bool)

(assert (=> b!392578 (= e!237709 (not call!27727))))

(declare-fun b!392580 () Bool)

(declare-fun e!237714 () ListLongMap!5465)

(declare-fun call!27729 () ListLongMap!5465)

(assert (=> b!392580 (= e!237714 (+!1068 call!27729 (tuple2!6563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!392581 () Bool)

(declare-fun e!237716 () ListLongMap!5465)

(assert (=> b!392581 (= e!237714 e!237716)))

(declare-fun c!54349 () Bool)

(assert (=> b!392581 (= c!54349 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392582 () Bool)

(declare-fun e!237711 () Bool)

(assert (=> b!392582 (= e!237711 (= (apply!306 lt!185490 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!392583 () Bool)

(assert (=> b!392583 (= e!237710 (not call!27726))))

(declare-fun bm!27721 () Bool)

(assert (=> bm!27721 (= call!27726 (contains!2457 lt!185490 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27722 () Bool)

(declare-fun call!27725 () ListLongMap!5465)

(declare-fun call!27723 () ListLongMap!5465)

(assert (=> bm!27722 (= call!27725 call!27723)))

(declare-fun bm!27723 () Bool)

(declare-fun call!27728 () ListLongMap!5465)

(assert (=> bm!27723 (= call!27728 call!27729)))

(declare-fun b!392584 () Bool)

(assert (=> b!392584 (= e!237713 (= (apply!306 lt!185490 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392585 () Bool)

(assert (=> b!392585 (= e!237712 e!237710)))

(declare-fun c!54353 () Bool)

(assert (=> b!392585 (= c!54353 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392586 () Bool)

(declare-fun lt!185480 () Unit!11984)

(assert (=> b!392586 (= e!237717 lt!185480)))

(declare-fun lt!185492 () ListLongMap!5465)

(assert (=> b!392586 (= lt!185492 (getCurrentListMapNoExtraKeys!977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185491 () (_ BitVec 64))

(assert (=> b!392586 (= lt!185491 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185481 () (_ BitVec 64))

(assert (=> b!392586 (= lt!185481 (select (arr!11090 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185489 () Unit!11984)

(declare-fun addStillContains!282 (ListLongMap!5465 (_ BitVec 64) V!14019 (_ BitVec 64)) Unit!11984)

(assert (=> b!392586 (= lt!185489 (addStillContains!282 lt!185492 lt!185491 zeroValue!472 lt!185481))))

(assert (=> b!392586 (contains!2457 (+!1068 lt!185492 (tuple2!6563 lt!185491 zeroValue!472)) lt!185481)))

(declare-fun lt!185486 () Unit!11984)

(assert (=> b!392586 (= lt!185486 lt!185489)))

(declare-fun lt!185501 () ListLongMap!5465)

(assert (=> b!392586 (= lt!185501 (getCurrentListMapNoExtraKeys!977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185487 () (_ BitVec 64))

(assert (=> b!392586 (= lt!185487 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185484 () (_ BitVec 64))

(assert (=> b!392586 (= lt!185484 (select (arr!11090 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185493 () Unit!11984)

(declare-fun addApplyDifferent!282 (ListLongMap!5465 (_ BitVec 64) V!14019 (_ BitVec 64)) Unit!11984)

(assert (=> b!392586 (= lt!185493 (addApplyDifferent!282 lt!185501 lt!185487 minValue!472 lt!185484))))

(assert (=> b!392586 (= (apply!306 (+!1068 lt!185501 (tuple2!6563 lt!185487 minValue!472)) lt!185484) (apply!306 lt!185501 lt!185484))))

(declare-fun lt!185485 () Unit!11984)

(assert (=> b!392586 (= lt!185485 lt!185493)))

(declare-fun lt!185500 () ListLongMap!5465)

(assert (=> b!392586 (= lt!185500 (getCurrentListMapNoExtraKeys!977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185495 () (_ BitVec 64))

(assert (=> b!392586 (= lt!185495 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185498 () (_ BitVec 64))

(assert (=> b!392586 (= lt!185498 (select (arr!11090 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185488 () Unit!11984)

(assert (=> b!392586 (= lt!185488 (addApplyDifferent!282 lt!185500 lt!185495 zeroValue!472 lt!185498))))

(assert (=> b!392586 (= (apply!306 (+!1068 lt!185500 (tuple2!6563 lt!185495 zeroValue!472)) lt!185498) (apply!306 lt!185500 lt!185498))))

(declare-fun lt!185497 () Unit!11984)

(assert (=> b!392586 (= lt!185497 lt!185488)))

(declare-fun lt!185499 () ListLongMap!5465)

(assert (=> b!392586 (= lt!185499 (getCurrentListMapNoExtraKeys!977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185483 () (_ BitVec 64))

(assert (=> b!392586 (= lt!185483 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185482 () (_ BitVec 64))

(assert (=> b!392586 (= lt!185482 (select (arr!11090 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!392586 (= lt!185480 (addApplyDifferent!282 lt!185499 lt!185483 minValue!472 lt!185482))))

(assert (=> b!392586 (= (apply!306 (+!1068 lt!185499 (tuple2!6563 lt!185483 minValue!472)) lt!185482) (apply!306 lt!185499 lt!185482))))

(declare-fun b!392587 () Bool)

(assert (=> b!392587 (= e!237709 e!237711)))

(declare-fun res!224858 () Bool)

(assert (=> b!392587 (= res!224858 call!27727)))

(assert (=> b!392587 (=> (not res!224858) (not e!237711))))

(declare-fun b!392588 () Bool)

(assert (=> b!392588 (= e!237715 e!237718)))

(declare-fun res!224856 () Bool)

(assert (=> b!392588 (=> (not res!224856) (not e!237718))))

(assert (=> b!392588 (= res!224856 (contains!2457 lt!185490 (select (arr!11090 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392588 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun call!27724 () ListLongMap!5465)

(declare-fun bm!27724 () Bool)

(assert (=> bm!27724 (= call!27724 (getCurrentListMapNoExtraKeys!977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392589 () Bool)

(declare-fun e!237720 () ListLongMap!5465)

(assert (=> b!392589 (= e!237720 call!27725)))

(declare-fun bm!27725 () Bool)

(assert (=> bm!27725 (= call!27723 call!27724)))

(declare-fun bm!27726 () Bool)

(declare-fun c!54350 () Bool)

(assert (=> bm!27726 (= call!27729 (+!1068 (ite c!54350 call!27724 (ite c!54349 call!27723 call!27725)) (ite (or c!54350 c!54349) (tuple2!6563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!392590 () Bool)

(assert (=> b!392590 (= e!237720 call!27728)))

(declare-fun b!392579 () Bool)

(assert (=> b!392579 (= e!237716 call!27728)))

(declare-fun d!72987 () Bool)

(assert (=> d!72987 e!237712))

(declare-fun res!224855 () Bool)

(assert (=> d!72987 (=> (not res!224855) (not e!237712))))

(assert (=> d!72987 (= res!224855 (or (bvsge #b00000000000000000000000000000000 (size!11443 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))))

(declare-fun lt!185496 () ListLongMap!5465)

(assert (=> d!72987 (= lt!185490 lt!185496)))

(declare-fun lt!185494 () Unit!11984)

(assert (=> d!72987 (= lt!185494 e!237717)))

(declare-fun c!54351 () Bool)

(assert (=> d!72987 (= c!54351 e!237719)))

(declare-fun res!224859 () Bool)

(assert (=> d!72987 (=> (not res!224859) (not e!237719))))

(assert (=> d!72987 (= res!224859 (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(assert (=> d!72987 (= lt!185496 e!237714)))

(assert (=> d!72987 (= c!54350 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72987 (validMask!0 mask!970)))

(assert (=> d!72987 (= (getCurrentListMap!2067 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185490)))

(declare-fun b!392591 () Bool)

(declare-fun c!54352 () Bool)

(assert (=> b!392591 (= c!54352 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!392591 (= e!237716 e!237720)))

(declare-fun b!392592 () Bool)

(assert (=> b!392592 (= e!237721 (validKeyInArray!0 (select (arr!11090 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72987 c!54350) b!392580))

(assert (= (and d!72987 (not c!54350)) b!392581))

(assert (= (and b!392581 c!54349) b!392579))

(assert (= (and b!392581 (not c!54349)) b!392591))

(assert (= (and b!392591 c!54352) b!392590))

(assert (= (and b!392591 (not c!54352)) b!392589))

(assert (= (or b!392590 b!392589) bm!27722))

(assert (= (or b!392579 bm!27722) bm!27725))

(assert (= (or b!392579 b!392590) bm!27723))

(assert (= (or b!392580 bm!27725) bm!27724))

(assert (= (or b!392580 bm!27723) bm!27726))

(assert (= (and d!72987 res!224859) b!392574))

(assert (= (and d!72987 c!54351) b!392586))

(assert (= (and d!72987 (not c!54351)) b!392575))

(assert (= (and d!72987 res!224855) b!392577))

(assert (= (and b!392577 res!224853) b!392592))

(assert (= (and b!392577 (not res!224860)) b!392588))

(assert (= (and b!392588 res!224856) b!392576))

(assert (= (and b!392577 res!224854) b!392572))

(assert (= (and b!392572 c!54348) b!392587))

(assert (= (and b!392572 (not c!54348)) b!392578))

(assert (= (and b!392587 res!224858) b!392582))

(assert (= (or b!392587 b!392578) bm!27720))

(assert (= (and b!392572 res!224852) b!392585))

(assert (= (and b!392585 c!54353) b!392573))

(assert (= (and b!392585 (not c!54353)) b!392583))

(assert (= (and b!392573 res!224857) b!392584))

(assert (= (or b!392573 b!392583) bm!27721))

(declare-fun b_lambda!8733 () Bool)

(assert (=> (not b_lambda!8733) (not b!392576)))

(assert (=> b!392576 t!11569))

(declare-fun b_and!16351 () Bool)

(assert (= b_and!16349 (and (=> t!11569 result!5753) b_and!16351)))

(declare-fun m!388535 () Bool)

(assert (=> bm!27726 m!388535))

(assert (=> bm!27724 m!388301))

(declare-fun m!388537 () Bool)

(assert (=> b!392586 m!388537))

(declare-fun m!388539 () Bool)

(assert (=> b!392586 m!388539))

(declare-fun m!388541 () Bool)

(assert (=> b!392586 m!388541))

(assert (=> b!392586 m!388443))

(declare-fun m!388543 () Bool)

(assert (=> b!392586 m!388543))

(declare-fun m!388545 () Bool)

(assert (=> b!392586 m!388545))

(declare-fun m!388547 () Bool)

(assert (=> b!392586 m!388547))

(declare-fun m!388549 () Bool)

(assert (=> b!392586 m!388549))

(declare-fun m!388551 () Bool)

(assert (=> b!392586 m!388551))

(declare-fun m!388553 () Bool)

(assert (=> b!392586 m!388553))

(declare-fun m!388555 () Bool)

(assert (=> b!392586 m!388555))

(declare-fun m!388557 () Bool)

(assert (=> b!392586 m!388557))

(assert (=> b!392586 m!388549))

(declare-fun m!388559 () Bool)

(assert (=> b!392586 m!388559))

(assert (=> b!392586 m!388543))

(declare-fun m!388561 () Bool)

(assert (=> b!392586 m!388561))

(declare-fun m!388563 () Bool)

(assert (=> b!392586 m!388563))

(assert (=> b!392586 m!388551))

(declare-fun m!388565 () Bool)

(assert (=> b!392586 m!388565))

(assert (=> b!392586 m!388555))

(assert (=> b!392586 m!388301))

(declare-fun m!388567 () Bool)

(assert (=> bm!27720 m!388567))

(declare-fun m!388569 () Bool)

(assert (=> b!392580 m!388569))

(assert (=> d!72987 m!388293))

(declare-fun m!388571 () Bool)

(assert (=> bm!27721 m!388571))

(assert (=> b!392592 m!388443))

(assert (=> b!392592 m!388443))

(assert (=> b!392592 m!388453))

(assert (=> b!392574 m!388443))

(assert (=> b!392574 m!388443))

(assert (=> b!392574 m!388453))

(declare-fun m!388573 () Bool)

(assert (=> b!392584 m!388573))

(assert (=> b!392588 m!388443))

(assert (=> b!392588 m!388443))

(declare-fun m!388575 () Bool)

(assert (=> b!392588 m!388575))

(declare-fun m!388577 () Bool)

(assert (=> b!392582 m!388577))

(assert (=> b!392576 m!388443))

(assert (=> b!392576 m!388491))

(assert (=> b!392576 m!388493))

(assert (=> b!392576 m!388491))

(assert (=> b!392576 m!388493))

(assert (=> b!392576 m!388495))

(assert (=> b!392576 m!388443))

(declare-fun m!388579 () Bool)

(assert (=> b!392576 m!388579))

(assert (=> b!392324 d!72987))

(declare-fun d!72989 () Bool)

(declare-fun e!237722 () Bool)

(assert (=> d!72989 e!237722))

(declare-fun res!224862 () Bool)

(assert (=> d!72989 (=> (not res!224862) (not e!237722))))

(declare-fun lt!185505 () ListLongMap!5465)

(assert (=> d!72989 (= res!224862 (contains!2457 lt!185505 (_1!3292 (tuple2!6563 k0!778 v!373))))))

(declare-fun lt!185503 () List!6405)

(assert (=> d!72989 (= lt!185505 (ListLongMap!5466 lt!185503))))

(declare-fun lt!185504 () Unit!11984)

(declare-fun lt!185502 () Unit!11984)

(assert (=> d!72989 (= lt!185504 lt!185502)))

(assert (=> d!72989 (= (getValueByKey!362 lt!185503 (_1!3292 (tuple2!6563 k0!778 v!373))) (Some!367 (_2!3292 (tuple2!6563 k0!778 v!373))))))

(assert (=> d!72989 (= lt!185502 (lemmaContainsTupThenGetReturnValue!187 lt!185503 (_1!3292 (tuple2!6563 k0!778 v!373)) (_2!3292 (tuple2!6563 k0!778 v!373))))))

(assert (=> d!72989 (= lt!185503 (insertStrictlySorted!190 (toList!2748 lt!185321) (_1!3292 (tuple2!6563 k0!778 v!373)) (_2!3292 (tuple2!6563 k0!778 v!373))))))

(assert (=> d!72989 (= (+!1068 lt!185321 (tuple2!6563 k0!778 v!373)) lt!185505)))

(declare-fun b!392593 () Bool)

(declare-fun res!224861 () Bool)

(assert (=> b!392593 (=> (not res!224861) (not e!237722))))

(assert (=> b!392593 (= res!224861 (= (getValueByKey!362 (toList!2748 lt!185505) (_1!3292 (tuple2!6563 k0!778 v!373))) (Some!367 (_2!3292 (tuple2!6563 k0!778 v!373)))))))

(declare-fun b!392594 () Bool)

(assert (=> b!392594 (= e!237722 (contains!2458 (toList!2748 lt!185505) (tuple2!6563 k0!778 v!373)))))

(assert (= (and d!72989 res!224862) b!392593))

(assert (= (and b!392593 res!224861) b!392594))

(declare-fun m!388581 () Bool)

(assert (=> d!72989 m!388581))

(declare-fun m!388583 () Bool)

(assert (=> d!72989 m!388583))

(declare-fun m!388585 () Bool)

(assert (=> d!72989 m!388585))

(declare-fun m!388587 () Bool)

(assert (=> d!72989 m!388587))

(declare-fun m!388589 () Bool)

(assert (=> b!392593 m!388589))

(declare-fun m!388591 () Bool)

(assert (=> b!392594 m!388591))

(assert (=> b!392324 d!72989))

(declare-fun bm!27727 () Bool)

(declare-fun call!27734 () Bool)

(declare-fun lt!185516 () ListLongMap!5465)

(assert (=> bm!27727 (= call!27734 (contains!2457 lt!185516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!392595 () Bool)

(declare-fun res!224863 () Bool)

(declare-fun e!237726 () Bool)

(assert (=> b!392595 (=> (not res!224863) (not e!237726))))

(declare-fun e!237723 () Bool)

(assert (=> b!392595 (= res!224863 e!237723)))

(declare-fun c!54354 () Bool)

(assert (=> b!392595 (= c!54354 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392596 () Bool)

(declare-fun e!237724 () Bool)

(declare-fun e!237727 () Bool)

(assert (=> b!392596 (= e!237724 e!237727)))

(declare-fun res!224868 () Bool)

(declare-fun call!27733 () Bool)

(assert (=> b!392596 (= res!224868 call!27733)))

(assert (=> b!392596 (=> (not res!224868) (not e!237727))))

(declare-fun b!392597 () Bool)

(declare-fun e!237733 () Bool)

(assert (=> b!392597 (= e!237733 (validKeyInArray!0 (select (arr!11090 lt!185318) #b00000000000000000000000000000000)))))

(declare-fun b!392598 () Bool)

(declare-fun e!237731 () Unit!11984)

(declare-fun Unit!11989 () Unit!11984)

(assert (=> b!392598 (= e!237731 Unit!11989)))

(declare-fun e!237732 () Bool)

(declare-fun b!392599 () Bool)

(assert (=> b!392599 (= e!237732 (= (apply!306 lt!185516 (select (arr!11090 lt!185318) #b00000000000000000000000000000000)) (get!5602 (select (arr!11091 lt!185313) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392599 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11444 lt!185313)))))

(assert (=> b!392599 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 lt!185318)))))

(declare-fun b!392600 () Bool)

(declare-fun res!224865 () Bool)

(assert (=> b!392600 (=> (not res!224865) (not e!237726))))

(declare-fun e!237729 () Bool)

(assert (=> b!392600 (= res!224865 e!237729)))

(declare-fun res!224871 () Bool)

(assert (=> b!392600 (=> res!224871 e!237729)))

(declare-fun e!237735 () Bool)

(assert (=> b!392600 (= res!224871 (not e!237735))))

(declare-fun res!224864 () Bool)

(assert (=> b!392600 (=> (not res!224864) (not e!237735))))

(assert (=> b!392600 (= res!224864 (bvslt #b00000000000000000000000000000000 (size!11443 lt!185318)))))

(declare-fun b!392601 () Bool)

(assert (=> b!392601 (= e!237723 (not call!27734))))

(declare-fun b!392603 () Bool)

(declare-fun e!237728 () ListLongMap!5465)

(declare-fun call!27736 () ListLongMap!5465)

(assert (=> b!392603 (= e!237728 (+!1068 call!27736 (tuple2!6563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!392604 () Bool)

(declare-fun e!237730 () ListLongMap!5465)

(assert (=> b!392604 (= e!237728 e!237730)))

(declare-fun c!54355 () Bool)

(assert (=> b!392604 (= c!54355 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392605 () Bool)

(declare-fun e!237725 () Bool)

(assert (=> b!392605 (= e!237725 (= (apply!306 lt!185516 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!392606 () Bool)

(assert (=> b!392606 (= e!237724 (not call!27733))))

(declare-fun bm!27728 () Bool)

(assert (=> bm!27728 (= call!27733 (contains!2457 lt!185516 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27729 () Bool)

(declare-fun call!27732 () ListLongMap!5465)

(declare-fun call!27730 () ListLongMap!5465)

(assert (=> bm!27729 (= call!27732 call!27730)))

(declare-fun bm!27730 () Bool)

(declare-fun call!27735 () ListLongMap!5465)

(assert (=> bm!27730 (= call!27735 call!27736)))

(declare-fun b!392607 () Bool)

(assert (=> b!392607 (= e!237727 (= (apply!306 lt!185516 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392608 () Bool)

(assert (=> b!392608 (= e!237726 e!237724)))

(declare-fun c!54359 () Bool)

(assert (=> b!392608 (= c!54359 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392609 () Bool)

(declare-fun lt!185506 () Unit!11984)

(assert (=> b!392609 (= e!237731 lt!185506)))

(declare-fun lt!185518 () ListLongMap!5465)

(assert (=> b!392609 (= lt!185518 (getCurrentListMapNoExtraKeys!977 lt!185318 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185517 () (_ BitVec 64))

(assert (=> b!392609 (= lt!185517 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185507 () (_ BitVec 64))

(assert (=> b!392609 (= lt!185507 (select (arr!11090 lt!185318) #b00000000000000000000000000000000))))

(declare-fun lt!185515 () Unit!11984)

(assert (=> b!392609 (= lt!185515 (addStillContains!282 lt!185518 lt!185517 zeroValue!472 lt!185507))))

(assert (=> b!392609 (contains!2457 (+!1068 lt!185518 (tuple2!6563 lt!185517 zeroValue!472)) lt!185507)))

(declare-fun lt!185512 () Unit!11984)

(assert (=> b!392609 (= lt!185512 lt!185515)))

(declare-fun lt!185527 () ListLongMap!5465)

(assert (=> b!392609 (= lt!185527 (getCurrentListMapNoExtraKeys!977 lt!185318 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185513 () (_ BitVec 64))

(assert (=> b!392609 (= lt!185513 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185510 () (_ BitVec 64))

(assert (=> b!392609 (= lt!185510 (select (arr!11090 lt!185318) #b00000000000000000000000000000000))))

(declare-fun lt!185519 () Unit!11984)

(assert (=> b!392609 (= lt!185519 (addApplyDifferent!282 lt!185527 lt!185513 minValue!472 lt!185510))))

(assert (=> b!392609 (= (apply!306 (+!1068 lt!185527 (tuple2!6563 lt!185513 minValue!472)) lt!185510) (apply!306 lt!185527 lt!185510))))

(declare-fun lt!185511 () Unit!11984)

(assert (=> b!392609 (= lt!185511 lt!185519)))

(declare-fun lt!185526 () ListLongMap!5465)

(assert (=> b!392609 (= lt!185526 (getCurrentListMapNoExtraKeys!977 lt!185318 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185521 () (_ BitVec 64))

(assert (=> b!392609 (= lt!185521 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185524 () (_ BitVec 64))

(assert (=> b!392609 (= lt!185524 (select (arr!11090 lt!185318) #b00000000000000000000000000000000))))

(declare-fun lt!185514 () Unit!11984)

(assert (=> b!392609 (= lt!185514 (addApplyDifferent!282 lt!185526 lt!185521 zeroValue!472 lt!185524))))

(assert (=> b!392609 (= (apply!306 (+!1068 lt!185526 (tuple2!6563 lt!185521 zeroValue!472)) lt!185524) (apply!306 lt!185526 lt!185524))))

(declare-fun lt!185523 () Unit!11984)

(assert (=> b!392609 (= lt!185523 lt!185514)))

(declare-fun lt!185525 () ListLongMap!5465)

(assert (=> b!392609 (= lt!185525 (getCurrentListMapNoExtraKeys!977 lt!185318 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185509 () (_ BitVec 64))

(assert (=> b!392609 (= lt!185509 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185508 () (_ BitVec 64))

(assert (=> b!392609 (= lt!185508 (select (arr!11090 lt!185318) #b00000000000000000000000000000000))))

(assert (=> b!392609 (= lt!185506 (addApplyDifferent!282 lt!185525 lt!185509 minValue!472 lt!185508))))

(assert (=> b!392609 (= (apply!306 (+!1068 lt!185525 (tuple2!6563 lt!185509 minValue!472)) lt!185508) (apply!306 lt!185525 lt!185508))))

(declare-fun b!392610 () Bool)

(assert (=> b!392610 (= e!237723 e!237725)))

(declare-fun res!224869 () Bool)

(assert (=> b!392610 (= res!224869 call!27734)))

(assert (=> b!392610 (=> (not res!224869) (not e!237725))))

(declare-fun b!392611 () Bool)

(assert (=> b!392611 (= e!237729 e!237732)))

(declare-fun res!224867 () Bool)

(assert (=> b!392611 (=> (not res!224867) (not e!237732))))

(assert (=> b!392611 (= res!224867 (contains!2457 lt!185516 (select (arr!11090 lt!185318) #b00000000000000000000000000000000)))))

(assert (=> b!392611 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 lt!185318)))))

(declare-fun call!27731 () ListLongMap!5465)

(declare-fun bm!27731 () Bool)

(assert (=> bm!27731 (= call!27731 (getCurrentListMapNoExtraKeys!977 lt!185318 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392612 () Bool)

(declare-fun e!237734 () ListLongMap!5465)

(assert (=> b!392612 (= e!237734 call!27732)))

(declare-fun bm!27732 () Bool)

(assert (=> bm!27732 (= call!27730 call!27731)))

(declare-fun c!54356 () Bool)

(declare-fun bm!27733 () Bool)

(assert (=> bm!27733 (= call!27736 (+!1068 (ite c!54356 call!27731 (ite c!54355 call!27730 call!27732)) (ite (or c!54356 c!54355) (tuple2!6563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!392613 () Bool)

(assert (=> b!392613 (= e!237734 call!27735)))

(declare-fun b!392602 () Bool)

(assert (=> b!392602 (= e!237730 call!27735)))

(declare-fun d!72991 () Bool)

(assert (=> d!72991 e!237726))

(declare-fun res!224866 () Bool)

(assert (=> d!72991 (=> (not res!224866) (not e!237726))))

(assert (=> d!72991 (= res!224866 (or (bvsge #b00000000000000000000000000000000 (size!11443 lt!185318)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 lt!185318)))))))

(declare-fun lt!185522 () ListLongMap!5465)

(assert (=> d!72991 (= lt!185516 lt!185522)))

(declare-fun lt!185520 () Unit!11984)

(assert (=> d!72991 (= lt!185520 e!237731)))

(declare-fun c!54357 () Bool)

(assert (=> d!72991 (= c!54357 e!237733)))

(declare-fun res!224870 () Bool)

(assert (=> d!72991 (=> (not res!224870) (not e!237733))))

(assert (=> d!72991 (= res!224870 (bvslt #b00000000000000000000000000000000 (size!11443 lt!185318)))))

(assert (=> d!72991 (= lt!185522 e!237728)))

(assert (=> d!72991 (= c!54356 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72991 (validMask!0 mask!970)))

(assert (=> d!72991 (= (getCurrentListMap!2067 lt!185318 lt!185313 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185516)))

(declare-fun b!392614 () Bool)

(declare-fun c!54358 () Bool)

(assert (=> b!392614 (= c!54358 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!392614 (= e!237730 e!237734)))

(declare-fun b!392615 () Bool)

(assert (=> b!392615 (= e!237735 (validKeyInArray!0 (select (arr!11090 lt!185318) #b00000000000000000000000000000000)))))

(assert (= (and d!72991 c!54356) b!392603))

(assert (= (and d!72991 (not c!54356)) b!392604))

(assert (= (and b!392604 c!54355) b!392602))

(assert (= (and b!392604 (not c!54355)) b!392614))

(assert (= (and b!392614 c!54358) b!392613))

(assert (= (and b!392614 (not c!54358)) b!392612))

(assert (= (or b!392613 b!392612) bm!27729))

(assert (= (or b!392602 bm!27729) bm!27732))

(assert (= (or b!392602 b!392613) bm!27730))

(assert (= (or b!392603 bm!27732) bm!27731))

(assert (= (or b!392603 bm!27730) bm!27733))

(assert (= (and d!72991 res!224870) b!392597))

(assert (= (and d!72991 c!54357) b!392609))

(assert (= (and d!72991 (not c!54357)) b!392598))

(assert (= (and d!72991 res!224866) b!392600))

(assert (= (and b!392600 res!224864) b!392615))

(assert (= (and b!392600 (not res!224871)) b!392611))

(assert (= (and b!392611 res!224867) b!392599))

(assert (= (and b!392600 res!224865) b!392595))

(assert (= (and b!392595 c!54354) b!392610))

(assert (= (and b!392595 (not c!54354)) b!392601))

(assert (= (and b!392610 res!224869) b!392605))

(assert (= (or b!392610 b!392601) bm!27727))

(assert (= (and b!392595 res!224863) b!392608))

(assert (= (and b!392608 c!54359) b!392596))

(assert (= (and b!392608 (not c!54359)) b!392606))

(assert (= (and b!392596 res!224868) b!392607))

(assert (= (or b!392596 b!392606) bm!27728))

(declare-fun b_lambda!8735 () Bool)

(assert (=> (not b_lambda!8735) (not b!392599)))

(assert (=> b!392599 t!11569))

(declare-fun b_and!16353 () Bool)

(assert (= b_and!16351 (and (=> t!11569 result!5753) b_and!16353)))

(declare-fun m!388593 () Bool)

(assert (=> bm!27733 m!388593))

(assert (=> bm!27731 m!388311))

(declare-fun m!388595 () Bool)

(assert (=> b!392609 m!388595))

(declare-fun m!388597 () Bool)

(assert (=> b!392609 m!388597))

(declare-fun m!388599 () Bool)

(assert (=> b!392609 m!388599))

(assert (=> b!392609 m!388467))

(declare-fun m!388601 () Bool)

(assert (=> b!392609 m!388601))

(declare-fun m!388603 () Bool)

(assert (=> b!392609 m!388603))

(declare-fun m!388605 () Bool)

(assert (=> b!392609 m!388605))

(declare-fun m!388607 () Bool)

(assert (=> b!392609 m!388607))

(declare-fun m!388609 () Bool)

(assert (=> b!392609 m!388609))

(declare-fun m!388611 () Bool)

(assert (=> b!392609 m!388611))

(declare-fun m!388613 () Bool)

(assert (=> b!392609 m!388613))

(declare-fun m!388615 () Bool)

(assert (=> b!392609 m!388615))

(assert (=> b!392609 m!388607))

(declare-fun m!388617 () Bool)

(assert (=> b!392609 m!388617))

(assert (=> b!392609 m!388601))

(declare-fun m!388619 () Bool)

(assert (=> b!392609 m!388619))

(declare-fun m!388621 () Bool)

(assert (=> b!392609 m!388621))

(assert (=> b!392609 m!388609))

(declare-fun m!388623 () Bool)

(assert (=> b!392609 m!388623))

(assert (=> b!392609 m!388613))

(assert (=> b!392609 m!388311))

(declare-fun m!388625 () Bool)

(assert (=> bm!27727 m!388625))

(declare-fun m!388627 () Bool)

(assert (=> b!392603 m!388627))

(assert (=> d!72991 m!388293))

(declare-fun m!388629 () Bool)

(assert (=> bm!27728 m!388629))

(assert (=> b!392615 m!388467))

(assert (=> b!392615 m!388467))

(assert (=> b!392615 m!388477))

(assert (=> b!392597 m!388467))

(assert (=> b!392597 m!388467))

(assert (=> b!392597 m!388477))

(declare-fun m!388631 () Bool)

(assert (=> b!392607 m!388631))

(assert (=> b!392611 m!388467))

(assert (=> b!392611 m!388467))

(declare-fun m!388633 () Bool)

(assert (=> b!392611 m!388633))

(declare-fun m!388635 () Bool)

(assert (=> b!392605 m!388635))

(assert (=> b!392599 m!388467))

(assert (=> b!392599 m!388517))

(assert (=> b!392599 m!388493))

(assert (=> b!392599 m!388517))

(assert (=> b!392599 m!388493))

(assert (=> b!392599 m!388519))

(assert (=> b!392599 m!388467))

(declare-fun m!388637 () Bool)

(assert (=> b!392599 m!388637))

(assert (=> b!392324 d!72991))

(declare-fun b!392622 () Bool)

(declare-fun e!237741 () Bool)

(declare-fun call!27742 () ListLongMap!5465)

(declare-fun call!27741 () ListLongMap!5465)

(assert (=> b!392622 (= e!237741 (= call!27742 call!27741))))

(declare-fun b!392623 () Bool)

(assert (=> b!392623 (= e!237741 (= call!27742 (+!1068 call!27741 (tuple2!6563 k0!778 v!373))))))

(declare-fun bm!27739 () Bool)

(assert (=> bm!27739 (= call!27741 (getCurrentListMapNoExtraKeys!977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392624 () Bool)

(declare-fun e!237740 () Bool)

(assert (=> b!392624 (= e!237740 e!237741)))

(declare-fun c!54362 () Bool)

(assert (=> b!392624 (= c!54362 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun d!72993 () Bool)

(assert (=> d!72993 e!237740))

(declare-fun res!224874 () Bool)

(assert (=> d!72993 (=> (not res!224874) (not e!237740))))

(assert (=> d!72993 (= res!224874 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11443 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11444 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11443 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11444 _values!506))))))))

(declare-fun lt!185530 () Unit!11984)

(declare-fun choose!1328 (array!23261 array!23263 (_ BitVec 32) (_ BitVec 32) V!14019 V!14019 (_ BitVec 32) (_ BitVec 64) V!14019 (_ BitVec 32) Int) Unit!11984)

(assert (=> d!72993 (= lt!185530 (choose!1328 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72993 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(assert (=> d!72993 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!268 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!185530)))

(declare-fun bm!27738 () Bool)

(assert (=> bm!27738 (= call!27742 (getCurrentListMapNoExtraKeys!977 (array!23262 (store (arr!11090 _keys!658) i!548 k0!778) (size!11443 _keys!658)) (array!23264 (store (arr!11091 _values!506) i!548 (ValueCellFull!4499 v!373)) (size!11444 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!72993 res!224874) b!392624))

(assert (= (and b!392624 c!54362) b!392623))

(assert (= (and b!392624 (not c!54362)) b!392622))

(assert (= (or b!392623 b!392622) bm!27739))

(assert (= (or b!392623 b!392622) bm!27738))

(declare-fun m!388639 () Bool)

(assert (=> b!392623 m!388639))

(assert (=> bm!27739 m!388301))

(declare-fun m!388641 () Bool)

(assert (=> d!72993 m!388641))

(assert (=> bm!27738 m!388317))

(assert (=> bm!27738 m!388309))

(declare-fun m!388643 () Bool)

(assert (=> bm!27738 m!388643))

(assert (=> b!392324 d!72993))

(declare-fun b!392625 () Bool)

(declare-fun e!237742 () Bool)

(assert (=> b!392625 (= e!237742 (contains!2459 Nil!6403 (select (arr!11090 lt!185318) #b00000000000000000000000000000000)))))

(declare-fun b!392626 () Bool)

(declare-fun e!237745 () Bool)

(declare-fun call!27743 () Bool)

(assert (=> b!392626 (= e!237745 call!27743)))

(declare-fun b!392628 () Bool)

(declare-fun e!237744 () Bool)

(assert (=> b!392628 (= e!237744 e!237745)))

(declare-fun c!54363 () Bool)

(assert (=> b!392628 (= c!54363 (validKeyInArray!0 (select (arr!11090 lt!185318) #b00000000000000000000000000000000)))))

(declare-fun bm!27740 () Bool)

(assert (=> bm!27740 (= call!27743 (arrayNoDuplicates!0 lt!185318 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54363 (Cons!6402 (select (arr!11090 lt!185318) #b00000000000000000000000000000000) Nil!6403) Nil!6403)))))

(declare-fun b!392629 () Bool)

(assert (=> b!392629 (= e!237745 call!27743)))

(declare-fun b!392627 () Bool)

(declare-fun e!237743 () Bool)

(assert (=> b!392627 (= e!237743 e!237744)))

(declare-fun res!224877 () Bool)

(assert (=> b!392627 (=> (not res!224877) (not e!237744))))

(assert (=> b!392627 (= res!224877 (not e!237742))))

(declare-fun res!224875 () Bool)

(assert (=> b!392627 (=> (not res!224875) (not e!237742))))

(assert (=> b!392627 (= res!224875 (validKeyInArray!0 (select (arr!11090 lt!185318) #b00000000000000000000000000000000)))))

(declare-fun d!72995 () Bool)

(declare-fun res!224876 () Bool)

(assert (=> d!72995 (=> res!224876 e!237743)))

(assert (=> d!72995 (= res!224876 (bvsge #b00000000000000000000000000000000 (size!11443 lt!185318)))))

(assert (=> d!72995 (= (arrayNoDuplicates!0 lt!185318 #b00000000000000000000000000000000 Nil!6403) e!237743)))

(assert (= (and d!72995 (not res!224876)) b!392627))

(assert (= (and b!392627 res!224875) b!392625))

(assert (= (and b!392627 res!224877) b!392628))

(assert (= (and b!392628 c!54363) b!392629))

(assert (= (and b!392628 (not c!54363)) b!392626))

(assert (= (or b!392629 b!392626) bm!27740))

(assert (=> b!392625 m!388467))

(assert (=> b!392625 m!388467))

(declare-fun m!388645 () Bool)

(assert (=> b!392625 m!388645))

(assert (=> b!392628 m!388467))

(assert (=> b!392628 m!388467))

(assert (=> b!392628 m!388477))

(assert (=> bm!27740 m!388467))

(declare-fun m!388647 () Bool)

(assert (=> bm!27740 m!388647))

(assert (=> b!392627 m!388467))

(assert (=> b!392627 m!388467))

(assert (=> b!392627 m!388477))

(assert (=> b!392328 d!72995))

(declare-fun mapIsEmpty!16128 () Bool)

(declare-fun mapRes!16128 () Bool)

(assert (=> mapIsEmpty!16128 mapRes!16128))

(declare-fun b!392637 () Bool)

(declare-fun e!237750 () Bool)

(assert (=> b!392637 (= e!237750 tp_is_empty!9685)))

(declare-fun mapNonEmpty!16128 () Bool)

(declare-fun tp!31833 () Bool)

(declare-fun e!237751 () Bool)

(assert (=> mapNonEmpty!16128 (= mapRes!16128 (and tp!31833 e!237751))))

(declare-fun mapRest!16128 () (Array (_ BitVec 32) ValueCell!4499))

(declare-fun mapKey!16128 () (_ BitVec 32))

(declare-fun mapValue!16128 () ValueCell!4499)

(assert (=> mapNonEmpty!16128 (= mapRest!16119 (store mapRest!16128 mapKey!16128 mapValue!16128))))

(declare-fun condMapEmpty!16128 () Bool)

(declare-fun mapDefault!16128 () ValueCell!4499)

(assert (=> mapNonEmpty!16119 (= condMapEmpty!16128 (= mapRest!16119 ((as const (Array (_ BitVec 32) ValueCell!4499)) mapDefault!16128)))))

(assert (=> mapNonEmpty!16119 (= tp!31818 (and e!237750 mapRes!16128))))

(declare-fun b!392636 () Bool)

(assert (=> b!392636 (= e!237751 tp_is_empty!9685)))

(assert (= (and mapNonEmpty!16119 condMapEmpty!16128) mapIsEmpty!16128))

(assert (= (and mapNonEmpty!16119 (not condMapEmpty!16128)) mapNonEmpty!16128))

(assert (= (and mapNonEmpty!16128 ((_ is ValueCellFull!4499) mapValue!16128)) b!392636))

(assert (= (and mapNonEmpty!16119 ((_ is ValueCellFull!4499) mapDefault!16128)) b!392637))

(declare-fun m!388649 () Bool)

(assert (=> mapNonEmpty!16128 m!388649))

(declare-fun b_lambda!8737 () Bool)

(assert (= b_lambda!8733 (or (and start!38096 b_free!9013) b_lambda!8737)))

(declare-fun b_lambda!8739 () Bool)

(assert (= b_lambda!8731 (or (and start!38096 b_free!9013) b_lambda!8739)))

(declare-fun b_lambda!8741 () Bool)

(assert (= b_lambda!8729 (or (and start!38096 b_free!9013) b_lambda!8741)))

(declare-fun b_lambda!8743 () Bool)

(assert (= b_lambda!8727 (or (and start!38096 b_free!9013) b_lambda!8743)))

(declare-fun b_lambda!8745 () Bool)

(assert (= b_lambda!8725 (or (and start!38096 b_free!9013) b_lambda!8745)))

(declare-fun b_lambda!8747 () Bool)

(assert (= b_lambda!8735 (or (and start!38096 b_free!9013) b_lambda!8747)))

(check-sat (not b!392580) (not b!392507) (not b_lambda!8739) (not d!72969) (not b!392477) (not bm!27740) (not b!392521) (not bm!27727) (not b!392455) (not d!72987) (not bm!27698) (not b!392586) (not b!392597) (not bm!27705) (not b_next!9013) (not b!392454) (not b!392603) (not bm!27697) (not b!392625) b_and!16353 (not b!392615) (not b!392513) (not b!392437) (not d!72983) (not b!392592) (not b!392464) (not b!392582) (not b_lambda!8745) (not b!392505) (not b!392519) (not b!392593) (not b!392452) (not bm!27701) (not b!392605) (not b!392527) (not d!72963) (not d!72991) (not b!392588) (not b!392453) (not bm!27726) (not d!72985) (not b!392607) (not b!392438) (not b!392609) (not b!392518) (not mapNonEmpty!16128) (not d!72965) (not b_lambda!8743) (not b!392526) (not b!392594) (not b!392576) (not b_lambda!8747) (not b!392449) (not b!392529) (not bm!27739) (not b!392623) (not b!392611) (not b!392628) (not d!72989) (not b!392584) (not b!392574) (not bm!27733) (not b!392504) (not b!392514) (not b!392627) (not b!392475) (not bm!27724) (not b!392439) (not bm!27704) (not bm!27731) (not b!392515) (not b!392478) (not b!392511) (not b_lambda!8741) (not b!392440) (not b!392512) (not bm!27721) (not b!392525) (not bm!27738) (not b!392528) tp_is_empty!9685 (not b!392458) (not d!72993) (not b_lambda!8737) (not bm!27728) (not bm!27720) (not b!392599))
(check-sat b_and!16353 (not b_next!9013))
