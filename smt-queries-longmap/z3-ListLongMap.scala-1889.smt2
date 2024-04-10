; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33806 () Bool)

(assert start!33806)

(declare-fun b_free!7005 () Bool)

(declare-fun b_next!7005 () Bool)

(assert (=> start!33806 (= b_free!7005 (not b_next!7005))))

(declare-fun tp!24524 () Bool)

(declare-fun b_and!14189 () Bool)

(assert (=> start!33806 (= tp!24524 b_and!14189)))

(declare-fun b!336287 () Bool)

(declare-fun e!206421 () Bool)

(declare-fun tp_is_empty!6957 () Bool)

(assert (=> b!336287 (= e!206421 tp_is_empty!6957)))

(declare-fun b!336288 () Bool)

(declare-fun e!206423 () Bool)

(declare-fun e!206420 () Bool)

(assert (=> b!336288 (= e!206423 e!206420)))

(declare-fun res!185608 () Bool)

(assert (=> b!336288 (=> (not res!185608) (not e!206420))))

(declare-datatypes ((SeekEntryResult!3201 0))(
  ( (MissingZero!3201 (index!14983 (_ BitVec 32))) (Found!3201 (index!14984 (_ BitVec 32))) (Intermediate!3201 (undefined!4013 Bool) (index!14985 (_ BitVec 32)) (x!33515 (_ BitVec 32))) (Undefined!3201) (MissingVacant!3201 (index!14986 (_ BitVec 32))) )
))
(declare-fun lt!160162 () SeekEntryResult!3201)

(get-info :version)

(assert (=> b!336288 (= res!185608 (and (not ((_ is Found!3201) lt!160162)) ((_ is MissingZero!3201) lt!160162)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17511 0))(
  ( (array!17512 (arr!8284 (Array (_ BitVec 32) (_ BitVec 64))) (size!8636 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17511)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17511 (_ BitVec 32)) SeekEntryResult!3201)

(assert (=> b!336288 (= lt!160162 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336289 () Bool)

(declare-fun e!206419 () Bool)

(assert (=> b!336289 (= e!206419 tp_is_empty!6957)))

(declare-fun res!185609 () Bool)

(assert (=> start!33806 (=> (not res!185609) (not e!206423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33806 (= res!185609 (validMask!0 mask!2385))))

(assert (=> start!33806 e!206423))

(assert (=> start!33806 true))

(assert (=> start!33806 tp_is_empty!6957))

(assert (=> start!33806 tp!24524))

(declare-datatypes ((V!10253 0))(
  ( (V!10254 (val!3523 Int)) )
))
(declare-datatypes ((ValueCell!3135 0))(
  ( (ValueCellFull!3135 (v!5687 V!10253)) (EmptyCell!3135) )
))
(declare-datatypes ((array!17513 0))(
  ( (array!17514 (arr!8285 (Array (_ BitVec 32) ValueCell!3135)) (size!8637 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17513)

(declare-fun e!206424 () Bool)

(declare-fun array_inv!6150 (array!17513) Bool)

(assert (=> start!33806 (and (array_inv!6150 _values!1525) e!206424)))

(declare-fun array_inv!6151 (array!17511) Bool)

(assert (=> start!33806 (array_inv!6151 _keys!1895)))

(declare-fun b!336290 () Bool)

(declare-fun res!185611 () Bool)

(assert (=> b!336290 (=> (not res!185611) (not e!206423))))

(declare-fun zeroValue!1467 () V!10253)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10253)

(declare-datatypes ((tuple2!5118 0))(
  ( (tuple2!5119 (_1!2570 (_ BitVec 64)) (_2!2570 V!10253)) )
))
(declare-datatypes ((List!4734 0))(
  ( (Nil!4731) (Cons!4730 (h!5586 tuple2!5118) (t!9826 List!4734)) )
))
(declare-datatypes ((ListLongMap!4031 0))(
  ( (ListLongMap!4032 (toList!2031 List!4734)) )
))
(declare-fun contains!2077 (ListLongMap!4031 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1552 (array!17511 array!17513 (_ BitVec 32) (_ BitVec 32) V!10253 V!10253 (_ BitVec 32) Int) ListLongMap!4031)

(assert (=> b!336290 (= res!185611 (not (contains!2077 (getCurrentListMap!1552 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336291 () Bool)

(declare-fun mapRes!11838 () Bool)

(assert (=> b!336291 (= e!206424 (and e!206421 mapRes!11838))))

(declare-fun condMapEmpty!11838 () Bool)

(declare-fun mapDefault!11838 () ValueCell!3135)

(assert (=> b!336291 (= condMapEmpty!11838 (= (arr!8285 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3135)) mapDefault!11838)))))

(declare-fun b!336292 () Bool)

(declare-fun res!185612 () Bool)

(assert (=> b!336292 (=> (not res!185612) (not e!206423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336292 (= res!185612 (validKeyInArray!0 k0!1348))))

(declare-fun b!336293 () Bool)

(assert (=> b!336293 (= e!206420 (or (bvsge #b00000000000000000000000000000000 (size!8636 _keys!1895)) (bvsge (size!8636 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!336294 () Bool)

(declare-fun res!185613 () Bool)

(assert (=> b!336294 (=> (not res!185613) (not e!206423))))

(assert (=> b!336294 (= res!185613 (and (= (size!8637 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8636 _keys!1895) (size!8637 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336295 () Bool)

(declare-fun res!185615 () Bool)

(assert (=> b!336295 (=> (not res!185615) (not e!206420))))

(declare-fun arrayContainsKey!0 (array!17511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336295 (= res!185615 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11838 () Bool)

(declare-fun tp!24525 () Bool)

(assert (=> mapNonEmpty!11838 (= mapRes!11838 (and tp!24525 e!206419))))

(declare-fun mapKey!11838 () (_ BitVec 32))

(declare-fun mapRest!11838 () (Array (_ BitVec 32) ValueCell!3135))

(declare-fun mapValue!11838 () ValueCell!3135)

(assert (=> mapNonEmpty!11838 (= (arr!8285 _values!1525) (store mapRest!11838 mapKey!11838 mapValue!11838))))

(declare-fun b!336296 () Bool)

(declare-fun res!185614 () Bool)

(assert (=> b!336296 (=> (not res!185614) (not e!206423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17511 (_ BitVec 32)) Bool)

(assert (=> b!336296 (= res!185614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336297 () Bool)

(declare-fun res!185610 () Bool)

(assert (=> b!336297 (=> (not res!185610) (not e!206423))))

(declare-datatypes ((List!4735 0))(
  ( (Nil!4732) (Cons!4731 (h!5587 (_ BitVec 64)) (t!9827 List!4735)) )
))
(declare-fun arrayNoDuplicates!0 (array!17511 (_ BitVec 32) List!4735) Bool)

(assert (=> b!336297 (= res!185610 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4732))))

(declare-fun mapIsEmpty!11838 () Bool)

(assert (=> mapIsEmpty!11838 mapRes!11838))

(assert (= (and start!33806 res!185609) b!336294))

(assert (= (and b!336294 res!185613) b!336296))

(assert (= (and b!336296 res!185614) b!336297))

(assert (= (and b!336297 res!185610) b!336292))

(assert (= (and b!336292 res!185612) b!336290))

(assert (= (and b!336290 res!185611) b!336288))

(assert (= (and b!336288 res!185608) b!336295))

(assert (= (and b!336295 res!185615) b!336293))

(assert (= (and b!336291 condMapEmpty!11838) mapIsEmpty!11838))

(assert (= (and b!336291 (not condMapEmpty!11838)) mapNonEmpty!11838))

(assert (= (and mapNonEmpty!11838 ((_ is ValueCellFull!3135) mapValue!11838)) b!336289))

(assert (= (and b!336291 ((_ is ValueCellFull!3135) mapDefault!11838)) b!336287))

(assert (= start!33806 b!336291))

(declare-fun m!340131 () Bool)

(assert (=> b!336288 m!340131))

(declare-fun m!340133 () Bool)

(assert (=> b!336290 m!340133))

(assert (=> b!336290 m!340133))

(declare-fun m!340135 () Bool)

(assert (=> b!336290 m!340135))

(declare-fun m!340137 () Bool)

(assert (=> b!336296 m!340137))

(declare-fun m!340139 () Bool)

(assert (=> b!336297 m!340139))

(declare-fun m!340141 () Bool)

(assert (=> mapNonEmpty!11838 m!340141))

(declare-fun m!340143 () Bool)

(assert (=> start!33806 m!340143))

(declare-fun m!340145 () Bool)

(assert (=> start!33806 m!340145))

(declare-fun m!340147 () Bool)

(assert (=> start!33806 m!340147))

(declare-fun m!340149 () Bool)

(assert (=> b!336292 m!340149))

(declare-fun m!340151 () Bool)

(assert (=> b!336295 m!340151))

(check-sat (not b_next!7005) (not b!336295) (not b!336288) b_and!14189 (not b!336297) (not b!336296) (not mapNonEmpty!11838) tp_is_empty!6957 (not b!336290) (not b!336292) (not start!33806))
(check-sat b_and!14189 (not b_next!7005))
(get-model)

(declare-fun d!70693 () Bool)

(assert (=> d!70693 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33806 d!70693))

(declare-fun d!70695 () Bool)

(assert (=> d!70695 (= (array_inv!6150 _values!1525) (bvsge (size!8637 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33806 d!70695))

(declare-fun d!70697 () Bool)

(assert (=> d!70697 (= (array_inv!6151 _keys!1895) (bvsge (size!8636 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33806 d!70697))

(declare-fun d!70699 () Bool)

(declare-fun e!206447 () Bool)

(assert (=> d!70699 e!206447))

(declare-fun res!185642 () Bool)

(assert (=> d!70699 (=> res!185642 e!206447)))

(declare-fun lt!160177 () Bool)

(assert (=> d!70699 (= res!185642 (not lt!160177))))

(declare-fun lt!160175 () Bool)

(assert (=> d!70699 (= lt!160177 lt!160175)))

(declare-datatypes ((Unit!10463 0))(
  ( (Unit!10464) )
))
(declare-fun lt!160174 () Unit!10463)

(declare-fun e!206448 () Unit!10463)

(assert (=> d!70699 (= lt!160174 e!206448)))

(declare-fun c!52269 () Bool)

(assert (=> d!70699 (= c!52269 lt!160175)))

(declare-fun containsKey!318 (List!4734 (_ BitVec 64)) Bool)

(assert (=> d!70699 (= lt!160175 (containsKey!318 (toList!2031 (getCurrentListMap!1552 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70699 (= (contains!2077 (getCurrentListMap!1552 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160177)))

(declare-fun b!336337 () Bool)

(declare-fun lt!160176 () Unit!10463)

(assert (=> b!336337 (= e!206448 lt!160176)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!266 (List!4734 (_ BitVec 64)) Unit!10463)

(assert (=> b!336337 (= lt!160176 (lemmaContainsKeyImpliesGetValueByKeyDefined!266 (toList!2031 (getCurrentListMap!1552 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!332 0))(
  ( (Some!331 (v!5689 V!10253)) (None!330) )
))
(declare-fun isDefined!267 (Option!332) Bool)

(declare-fun getValueByKey!326 (List!4734 (_ BitVec 64)) Option!332)

(assert (=> b!336337 (isDefined!267 (getValueByKey!326 (toList!2031 (getCurrentListMap!1552 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!336338 () Bool)

(declare-fun Unit!10465 () Unit!10463)

(assert (=> b!336338 (= e!206448 Unit!10465)))

(declare-fun b!336339 () Bool)

(assert (=> b!336339 (= e!206447 (isDefined!267 (getValueByKey!326 (toList!2031 (getCurrentListMap!1552 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70699 c!52269) b!336337))

(assert (= (and d!70699 (not c!52269)) b!336338))

(assert (= (and d!70699 (not res!185642)) b!336339))

(declare-fun m!340175 () Bool)

(assert (=> d!70699 m!340175))

(declare-fun m!340177 () Bool)

(assert (=> b!336337 m!340177))

(declare-fun m!340179 () Bool)

(assert (=> b!336337 m!340179))

(assert (=> b!336337 m!340179))

(declare-fun m!340181 () Bool)

(assert (=> b!336337 m!340181))

(assert (=> b!336339 m!340179))

(assert (=> b!336339 m!340179))

(assert (=> b!336339 m!340181))

(assert (=> b!336290 d!70699))

(declare-fun b!336382 () Bool)

(declare-fun e!206476 () Bool)

(declare-fun call!26370 () Bool)

(assert (=> b!336382 (= e!206476 (not call!26370))))

(declare-fun b!336383 () Bool)

(declare-fun c!52287 () Bool)

(assert (=> b!336383 (= c!52287 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!206483 () ListLongMap!4031)

(declare-fun e!206486 () ListLongMap!4031)

(assert (=> b!336383 (= e!206483 e!206486)))

(declare-fun bm!26362 () Bool)

(declare-fun call!26368 () ListLongMap!4031)

(declare-fun call!26369 () ListLongMap!4031)

(assert (=> bm!26362 (= call!26368 call!26369)))

(declare-fun bm!26363 () Bool)

(declare-fun lt!160243 () ListLongMap!4031)

(assert (=> bm!26363 (= call!26370 (contains!2077 lt!160243 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!336384 () Bool)

(declare-fun e!206482 () ListLongMap!4031)

(declare-fun call!26365 () ListLongMap!4031)

(declare-fun +!717 (ListLongMap!4031 tuple2!5118) ListLongMap!4031)

(assert (=> b!336384 (= e!206482 (+!717 call!26365 (tuple2!5119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!336385 () Bool)

(declare-fun res!185665 () Bool)

(declare-fun e!206480 () Bool)

(assert (=> b!336385 (=> (not res!185665) (not e!206480))))

(declare-fun e!206477 () Bool)

(assert (=> b!336385 (= res!185665 e!206477)))

(declare-fun res!185668 () Bool)

(assert (=> b!336385 (=> res!185668 e!206477)))

(declare-fun e!206478 () Bool)

(assert (=> b!336385 (= res!185668 (not e!206478))))

(declare-fun res!185662 () Bool)

(assert (=> b!336385 (=> (not res!185662) (not e!206478))))

(assert (=> b!336385 (= res!185662 (bvslt #b00000000000000000000000000000000 (size!8636 _keys!1895)))))

(declare-fun bm!26364 () Bool)

(declare-fun call!26367 () Bool)

(assert (=> bm!26364 (= call!26367 (contains!2077 lt!160243 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!336387 () Bool)

(declare-fun e!206475 () Bool)

(assert (=> b!336387 (= e!206477 e!206475)))

(declare-fun res!185669 () Bool)

(assert (=> b!336387 (=> (not res!185669) (not e!206475))))

(assert (=> b!336387 (= res!185669 (contains!2077 lt!160243 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!336387 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8636 _keys!1895)))))

(declare-fun b!336388 () Bool)

(declare-fun apply!268 (ListLongMap!4031 (_ BitVec 64)) V!10253)

(declare-fun get!4532 (ValueCell!3135 V!10253) V!10253)

(declare-fun dynLambda!611 (Int (_ BitVec 64)) V!10253)

(assert (=> b!336388 (= e!206475 (= (apply!268 lt!160243 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000)) (get!4532 (select (arr!8285 _values!1525) #b00000000000000000000000000000000) (dynLambda!611 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!336388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8637 _values!1525)))))

(assert (=> b!336388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8636 _keys!1895)))))

(declare-fun b!336389 () Bool)

(declare-fun e!206484 () Bool)

(declare-fun e!206479 () Bool)

(assert (=> b!336389 (= e!206484 e!206479)))

(declare-fun res!185664 () Bool)

(assert (=> b!336389 (= res!185664 call!26367)))

(assert (=> b!336389 (=> (not res!185664) (not e!206479))))

(declare-fun bm!26365 () Bool)

(declare-fun call!26366 () ListLongMap!4031)

(assert (=> bm!26365 (= call!26366 call!26365)))

(declare-fun b!336390 () Bool)

(declare-fun e!206487 () Unit!10463)

(declare-fun Unit!10466 () Unit!10463)

(assert (=> b!336390 (= e!206487 Unit!10466)))

(declare-fun b!336391 () Bool)

(assert (=> b!336391 (= e!206483 call!26366)))

(declare-fun b!336392 () Bool)

(declare-fun call!26371 () ListLongMap!4031)

(assert (=> b!336392 (= e!206486 call!26371)))

(declare-fun bm!26366 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!590 (array!17511 array!17513 (_ BitVec 32) (_ BitVec 32) V!10253 V!10253 (_ BitVec 32) Int) ListLongMap!4031)

(assert (=> bm!26366 (= call!26369 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun d!70701 () Bool)

(assert (=> d!70701 e!206480))

(declare-fun res!185667 () Bool)

(assert (=> d!70701 (=> (not res!185667) (not e!206480))))

(assert (=> d!70701 (= res!185667 (or (bvsge #b00000000000000000000000000000000 (size!8636 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8636 _keys!1895)))))))

(declare-fun lt!160223 () ListLongMap!4031)

(assert (=> d!70701 (= lt!160243 lt!160223)))

(declare-fun lt!160233 () Unit!10463)

(assert (=> d!70701 (= lt!160233 e!206487)))

(declare-fun c!52284 () Bool)

(declare-fun e!206481 () Bool)

(assert (=> d!70701 (= c!52284 e!206481)))

(declare-fun res!185666 () Bool)

(assert (=> d!70701 (=> (not res!185666) (not e!206481))))

(assert (=> d!70701 (= res!185666 (bvslt #b00000000000000000000000000000000 (size!8636 _keys!1895)))))

(assert (=> d!70701 (= lt!160223 e!206482)))

(declare-fun c!52283 () Bool)

(assert (=> d!70701 (= c!52283 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70701 (validMask!0 mask!2385)))

(assert (=> d!70701 (= (getCurrentListMap!1552 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160243)))

(declare-fun b!336386 () Bool)

(assert (=> b!336386 (= e!206479 (= (apply!268 lt!160243 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!336393 () Bool)

(declare-fun res!185661 () Bool)

(assert (=> b!336393 (=> (not res!185661) (not e!206480))))

(assert (=> b!336393 (= res!185661 e!206484)))

(declare-fun c!52286 () Bool)

(assert (=> b!336393 (= c!52286 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!336394 () Bool)

(declare-fun lt!160241 () Unit!10463)

(assert (=> b!336394 (= e!206487 lt!160241)))

(declare-fun lt!160242 () ListLongMap!4031)

(assert (=> b!336394 (= lt!160242 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160222 () (_ BitVec 64))

(assert (=> b!336394 (= lt!160222 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160228 () (_ BitVec 64))

(assert (=> b!336394 (= lt!160228 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160236 () Unit!10463)

(declare-fun addStillContains!244 (ListLongMap!4031 (_ BitVec 64) V!10253 (_ BitVec 64)) Unit!10463)

(assert (=> b!336394 (= lt!160236 (addStillContains!244 lt!160242 lt!160222 zeroValue!1467 lt!160228))))

(assert (=> b!336394 (contains!2077 (+!717 lt!160242 (tuple2!5119 lt!160222 zeroValue!1467)) lt!160228)))

(declare-fun lt!160227 () Unit!10463)

(assert (=> b!336394 (= lt!160227 lt!160236)))

(declare-fun lt!160238 () ListLongMap!4031)

(assert (=> b!336394 (= lt!160238 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160230 () (_ BitVec 64))

(assert (=> b!336394 (= lt!160230 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160240 () (_ BitVec 64))

(assert (=> b!336394 (= lt!160240 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160229 () Unit!10463)

(declare-fun addApplyDifferent!244 (ListLongMap!4031 (_ BitVec 64) V!10253 (_ BitVec 64)) Unit!10463)

(assert (=> b!336394 (= lt!160229 (addApplyDifferent!244 lt!160238 lt!160230 minValue!1467 lt!160240))))

(assert (=> b!336394 (= (apply!268 (+!717 lt!160238 (tuple2!5119 lt!160230 minValue!1467)) lt!160240) (apply!268 lt!160238 lt!160240))))

(declare-fun lt!160234 () Unit!10463)

(assert (=> b!336394 (= lt!160234 lt!160229)))

(declare-fun lt!160226 () ListLongMap!4031)

(assert (=> b!336394 (= lt!160226 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160224 () (_ BitVec 64))

(assert (=> b!336394 (= lt!160224 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160232 () (_ BitVec 64))

(assert (=> b!336394 (= lt!160232 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160237 () Unit!10463)

(assert (=> b!336394 (= lt!160237 (addApplyDifferent!244 lt!160226 lt!160224 zeroValue!1467 lt!160232))))

(assert (=> b!336394 (= (apply!268 (+!717 lt!160226 (tuple2!5119 lt!160224 zeroValue!1467)) lt!160232) (apply!268 lt!160226 lt!160232))))

(declare-fun lt!160225 () Unit!10463)

(assert (=> b!336394 (= lt!160225 lt!160237)))

(declare-fun lt!160235 () ListLongMap!4031)

(assert (=> b!336394 (= lt!160235 (getCurrentListMapNoExtraKeys!590 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160231 () (_ BitVec 64))

(assert (=> b!336394 (= lt!160231 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160239 () (_ BitVec 64))

(assert (=> b!336394 (= lt!160239 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!336394 (= lt!160241 (addApplyDifferent!244 lt!160235 lt!160231 minValue!1467 lt!160239))))

(assert (=> b!336394 (= (apply!268 (+!717 lt!160235 (tuple2!5119 lt!160231 minValue!1467)) lt!160239) (apply!268 lt!160235 lt!160239))))

(declare-fun b!336395 () Bool)

(assert (=> b!336395 (= e!206484 (not call!26367))))

(declare-fun b!336396 () Bool)

(assert (=> b!336396 (= e!206482 e!206483)))

(declare-fun c!52282 () Bool)

(assert (=> b!336396 (= c!52282 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!336397 () Bool)

(declare-fun e!206485 () Bool)

(assert (=> b!336397 (= e!206476 e!206485)))

(declare-fun res!185663 () Bool)

(assert (=> b!336397 (= res!185663 call!26370)))

(assert (=> b!336397 (=> (not res!185663) (not e!206485))))

(declare-fun b!336398 () Bool)

(assert (=> b!336398 (= e!206485 (= (apply!268 lt!160243 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26367 () Bool)

(assert (=> bm!26367 (= call!26365 (+!717 (ite c!52283 call!26369 (ite c!52282 call!26368 call!26371)) (ite (or c!52283 c!52282) (tuple2!5119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!336399 () Bool)

(assert (=> b!336399 (= e!206478 (validKeyInArray!0 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336400 () Bool)

(assert (=> b!336400 (= e!206481 (validKeyInArray!0 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336401 () Bool)

(assert (=> b!336401 (= e!206486 call!26366)))

(declare-fun b!336402 () Bool)

(assert (=> b!336402 (= e!206480 e!206476)))

(declare-fun c!52285 () Bool)

(assert (=> b!336402 (= c!52285 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26368 () Bool)

(assert (=> bm!26368 (= call!26371 call!26368)))

(assert (= (and d!70701 c!52283) b!336384))

(assert (= (and d!70701 (not c!52283)) b!336396))

(assert (= (and b!336396 c!52282) b!336391))

(assert (= (and b!336396 (not c!52282)) b!336383))

(assert (= (and b!336383 c!52287) b!336401))

(assert (= (and b!336383 (not c!52287)) b!336392))

(assert (= (or b!336401 b!336392) bm!26368))

(assert (= (or b!336391 bm!26368) bm!26362))

(assert (= (or b!336391 b!336401) bm!26365))

(assert (= (or b!336384 bm!26362) bm!26366))

(assert (= (or b!336384 bm!26365) bm!26367))

(assert (= (and d!70701 res!185666) b!336400))

(assert (= (and d!70701 c!52284) b!336394))

(assert (= (and d!70701 (not c!52284)) b!336390))

(assert (= (and d!70701 res!185667) b!336385))

(assert (= (and b!336385 res!185662) b!336399))

(assert (= (and b!336385 (not res!185668)) b!336387))

(assert (= (and b!336387 res!185669) b!336388))

(assert (= (and b!336385 res!185665) b!336393))

(assert (= (and b!336393 c!52286) b!336389))

(assert (= (and b!336393 (not c!52286)) b!336395))

(assert (= (and b!336389 res!185664) b!336386))

(assert (= (or b!336389 b!336395) bm!26364))

(assert (= (and b!336393 res!185661) b!336402))

(assert (= (and b!336402 c!52285) b!336397))

(assert (= (and b!336402 (not c!52285)) b!336382))

(assert (= (and b!336397 res!185663) b!336398))

(assert (= (or b!336397 b!336382) bm!26363))

(declare-fun b_lambda!8411 () Bool)

(assert (=> (not b_lambda!8411) (not b!336388)))

(declare-fun t!9830 () Bool)

(declare-fun tb!3051 () Bool)

(assert (=> (and start!33806 (= defaultEntry!1528 defaultEntry!1528) t!9830) tb!3051))

(declare-fun result!5483 () Bool)

(assert (=> tb!3051 (= result!5483 tp_is_empty!6957)))

(assert (=> b!336388 t!9830))

(declare-fun b_and!14193 () Bool)

(assert (= b_and!14189 (and (=> t!9830 result!5483) b_and!14193)))

(declare-fun m!340183 () Bool)

(assert (=> bm!26366 m!340183))

(declare-fun m!340185 () Bool)

(assert (=> b!336384 m!340185))

(declare-fun m!340187 () Bool)

(assert (=> b!336386 m!340187))

(declare-fun m!340189 () Bool)

(assert (=> b!336387 m!340189))

(assert (=> b!336387 m!340189))

(declare-fun m!340191 () Bool)

(assert (=> b!336387 m!340191))

(declare-fun m!340193 () Bool)

(assert (=> b!336398 m!340193))

(assert (=> b!336400 m!340189))

(assert (=> b!336400 m!340189))

(declare-fun m!340195 () Bool)

(assert (=> b!336400 m!340195))

(declare-fun m!340197 () Bool)

(assert (=> bm!26363 m!340197))

(declare-fun m!340199 () Bool)

(assert (=> b!336394 m!340199))

(declare-fun m!340201 () Bool)

(assert (=> b!336394 m!340201))

(assert (=> b!336394 m!340199))

(declare-fun m!340203 () Bool)

(assert (=> b!336394 m!340203))

(declare-fun m!340205 () Bool)

(assert (=> b!336394 m!340205))

(declare-fun m!340207 () Bool)

(assert (=> b!336394 m!340207))

(declare-fun m!340209 () Bool)

(assert (=> b!336394 m!340209))

(declare-fun m!340211 () Bool)

(assert (=> b!336394 m!340211))

(assert (=> b!336394 m!340209))

(declare-fun m!340213 () Bool)

(assert (=> b!336394 m!340213))

(assert (=> b!336394 m!340183))

(assert (=> b!336394 m!340213))

(declare-fun m!340215 () Bool)

(assert (=> b!336394 m!340215))

(declare-fun m!340217 () Bool)

(assert (=> b!336394 m!340217))

(assert (=> b!336394 m!340189))

(declare-fun m!340219 () Bool)

(assert (=> b!336394 m!340219))

(declare-fun m!340221 () Bool)

(assert (=> b!336394 m!340221))

(declare-fun m!340223 () Bool)

(assert (=> b!336394 m!340223))

(declare-fun m!340225 () Bool)

(assert (=> b!336394 m!340225))

(assert (=> b!336394 m!340205))

(declare-fun m!340227 () Bool)

(assert (=> b!336394 m!340227))

(declare-fun m!340229 () Bool)

(assert (=> b!336388 m!340229))

(declare-fun m!340231 () Bool)

(assert (=> b!336388 m!340231))

(declare-fun m!340233 () Bool)

(assert (=> b!336388 m!340233))

(assert (=> b!336388 m!340189))

(assert (=> b!336388 m!340229))

(assert (=> b!336388 m!340189))

(declare-fun m!340235 () Bool)

(assert (=> b!336388 m!340235))

(assert (=> b!336388 m!340231))

(declare-fun m!340237 () Bool)

(assert (=> bm!26367 m!340237))

(assert (=> d!70701 m!340143))

(assert (=> b!336399 m!340189))

(assert (=> b!336399 m!340189))

(assert (=> b!336399 m!340195))

(declare-fun m!340239 () Bool)

(assert (=> bm!26364 m!340239))

(assert (=> b!336290 d!70701))

(declare-fun d!70703 () Bool)

(declare-fun res!185674 () Bool)

(declare-fun e!206492 () Bool)

(assert (=> d!70703 (=> res!185674 e!206492)))

(assert (=> d!70703 (= res!185674 (= (select (arr!8284 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70703 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!206492)))

(declare-fun b!336409 () Bool)

(declare-fun e!206493 () Bool)

(assert (=> b!336409 (= e!206492 e!206493)))

(declare-fun res!185675 () Bool)

(assert (=> b!336409 (=> (not res!185675) (not e!206493))))

(assert (=> b!336409 (= res!185675 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8636 _keys!1895)))))

(declare-fun b!336410 () Bool)

(assert (=> b!336410 (= e!206493 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70703 (not res!185674)) b!336409))

(assert (= (and b!336409 res!185675) b!336410))

(assert (=> d!70703 m!340189))

(declare-fun m!340241 () Bool)

(assert (=> b!336410 m!340241))

(assert (=> b!336295 d!70703))

(declare-fun b!336419 () Bool)

(declare-fun e!206502 () Bool)

(declare-fun e!206501 () Bool)

(assert (=> b!336419 (= e!206502 e!206501)))

(declare-fun c!52290 () Bool)

(assert (=> b!336419 (= c!52290 (validKeyInArray!0 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336420 () Bool)

(declare-fun e!206500 () Bool)

(declare-fun call!26374 () Bool)

(assert (=> b!336420 (= e!206500 call!26374)))

(declare-fun b!336421 () Bool)

(assert (=> b!336421 (= e!206501 e!206500)))

(declare-fun lt!160251 () (_ BitVec 64))

(assert (=> b!336421 (= lt!160251 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160252 () Unit!10463)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17511 (_ BitVec 64) (_ BitVec 32)) Unit!10463)

(assert (=> b!336421 (= lt!160252 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160251 #b00000000000000000000000000000000))))

(assert (=> b!336421 (arrayContainsKey!0 _keys!1895 lt!160251 #b00000000000000000000000000000000)))

(declare-fun lt!160250 () Unit!10463)

(assert (=> b!336421 (= lt!160250 lt!160252)))

(declare-fun res!185681 () Bool)

(assert (=> b!336421 (= res!185681 (= (seekEntryOrOpen!0 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3201 #b00000000000000000000000000000000)))))

(assert (=> b!336421 (=> (not res!185681) (not e!206500))))

(declare-fun bm!26371 () Bool)

(assert (=> bm!26371 (= call!26374 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!336422 () Bool)

(assert (=> b!336422 (= e!206501 call!26374)))

(declare-fun d!70705 () Bool)

(declare-fun res!185680 () Bool)

(assert (=> d!70705 (=> res!185680 e!206502)))

(assert (=> d!70705 (= res!185680 (bvsge #b00000000000000000000000000000000 (size!8636 _keys!1895)))))

(assert (=> d!70705 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!206502)))

(assert (= (and d!70705 (not res!185680)) b!336419))

(assert (= (and b!336419 c!52290) b!336421))

(assert (= (and b!336419 (not c!52290)) b!336422))

(assert (= (and b!336421 res!185681) b!336420))

(assert (= (or b!336420 b!336422) bm!26371))

(assert (=> b!336419 m!340189))

(assert (=> b!336419 m!340189))

(assert (=> b!336419 m!340195))

(assert (=> b!336421 m!340189))

(declare-fun m!340243 () Bool)

(assert (=> b!336421 m!340243))

(declare-fun m!340245 () Bool)

(assert (=> b!336421 m!340245))

(assert (=> b!336421 m!340189))

(declare-fun m!340247 () Bool)

(assert (=> b!336421 m!340247))

(declare-fun m!340249 () Bool)

(assert (=> bm!26371 m!340249))

(assert (=> b!336296 d!70705))

(declare-fun b!336433 () Bool)

(declare-fun e!206512 () Bool)

(declare-fun call!26377 () Bool)

(assert (=> b!336433 (= e!206512 call!26377)))

(declare-fun b!336434 () Bool)

(declare-fun e!206514 () Bool)

(declare-fun e!206511 () Bool)

(assert (=> b!336434 (= e!206514 e!206511)))

(declare-fun res!185689 () Bool)

(assert (=> b!336434 (=> (not res!185689) (not e!206511))))

(declare-fun e!206513 () Bool)

(assert (=> b!336434 (= res!185689 (not e!206513))))

(declare-fun res!185688 () Bool)

(assert (=> b!336434 (=> (not res!185688) (not e!206513))))

(assert (=> b!336434 (= res!185688 (validKeyInArray!0 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336435 () Bool)

(declare-fun contains!2079 (List!4735 (_ BitVec 64)) Bool)

(assert (=> b!336435 (= e!206513 (contains!2079 Nil!4732 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336436 () Bool)

(assert (=> b!336436 (= e!206512 call!26377)))

(declare-fun bm!26374 () Bool)

(declare-fun c!52293 () Bool)

(assert (=> bm!26374 (= call!26377 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52293 (Cons!4731 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000) Nil!4732) Nil!4732)))))

(declare-fun b!336437 () Bool)

(assert (=> b!336437 (= e!206511 e!206512)))

(assert (=> b!336437 (= c!52293 (validKeyInArray!0 (select (arr!8284 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70707 () Bool)

(declare-fun res!185690 () Bool)

(assert (=> d!70707 (=> res!185690 e!206514)))

(assert (=> d!70707 (= res!185690 (bvsge #b00000000000000000000000000000000 (size!8636 _keys!1895)))))

(assert (=> d!70707 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4732) e!206514)))

(assert (= (and d!70707 (not res!185690)) b!336434))

(assert (= (and b!336434 res!185688) b!336435))

(assert (= (and b!336434 res!185689) b!336437))

(assert (= (and b!336437 c!52293) b!336436))

(assert (= (and b!336437 (not c!52293)) b!336433))

(assert (= (or b!336436 b!336433) bm!26374))

(assert (=> b!336434 m!340189))

(assert (=> b!336434 m!340189))

(assert (=> b!336434 m!340195))

(assert (=> b!336435 m!340189))

(assert (=> b!336435 m!340189))

(declare-fun m!340251 () Bool)

(assert (=> b!336435 m!340251))

(assert (=> bm!26374 m!340189))

(declare-fun m!340253 () Bool)

(assert (=> bm!26374 m!340253))

(assert (=> b!336437 m!340189))

(assert (=> b!336437 m!340189))

(assert (=> b!336437 m!340195))

(assert (=> b!336297 d!70707))

(declare-fun d!70709 () Bool)

(assert (=> d!70709 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!336292 d!70709))

(declare-fun b!336450 () Bool)

(declare-fun e!206521 () SeekEntryResult!3201)

(assert (=> b!336450 (= e!206521 Undefined!3201)))

(declare-fun lt!160261 () SeekEntryResult!3201)

(declare-fun b!336451 () Bool)

(declare-fun e!206523 () SeekEntryResult!3201)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17511 (_ BitVec 32)) SeekEntryResult!3201)

(assert (=> b!336451 (= e!206523 (seekKeyOrZeroReturnVacant!0 (x!33515 lt!160261) (index!14985 lt!160261) (index!14985 lt!160261) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336452 () Bool)

(declare-fun c!52300 () Bool)

(declare-fun lt!160260 () (_ BitVec 64))

(assert (=> b!336452 (= c!52300 (= lt!160260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!206522 () SeekEntryResult!3201)

(assert (=> b!336452 (= e!206522 e!206523)))

(declare-fun d!70711 () Bool)

(declare-fun lt!160259 () SeekEntryResult!3201)

(assert (=> d!70711 (and (or ((_ is Undefined!3201) lt!160259) (not ((_ is Found!3201) lt!160259)) (and (bvsge (index!14984 lt!160259) #b00000000000000000000000000000000) (bvslt (index!14984 lt!160259) (size!8636 _keys!1895)))) (or ((_ is Undefined!3201) lt!160259) ((_ is Found!3201) lt!160259) (not ((_ is MissingZero!3201) lt!160259)) (and (bvsge (index!14983 lt!160259) #b00000000000000000000000000000000) (bvslt (index!14983 lt!160259) (size!8636 _keys!1895)))) (or ((_ is Undefined!3201) lt!160259) ((_ is Found!3201) lt!160259) ((_ is MissingZero!3201) lt!160259) (not ((_ is MissingVacant!3201) lt!160259)) (and (bvsge (index!14986 lt!160259) #b00000000000000000000000000000000) (bvslt (index!14986 lt!160259) (size!8636 _keys!1895)))) (or ((_ is Undefined!3201) lt!160259) (ite ((_ is Found!3201) lt!160259) (= (select (arr!8284 _keys!1895) (index!14984 lt!160259)) k0!1348) (ite ((_ is MissingZero!3201) lt!160259) (= (select (arr!8284 _keys!1895) (index!14983 lt!160259)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3201) lt!160259) (= (select (arr!8284 _keys!1895) (index!14986 lt!160259)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70711 (= lt!160259 e!206521)))

(declare-fun c!52302 () Bool)

(assert (=> d!70711 (= c!52302 (and ((_ is Intermediate!3201) lt!160261) (undefined!4013 lt!160261)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17511 (_ BitVec 32)) SeekEntryResult!3201)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70711 (= lt!160261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70711 (validMask!0 mask!2385)))

(assert (=> d!70711 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160259)))

(declare-fun b!336453 () Bool)

(assert (=> b!336453 (= e!206521 e!206522)))

(assert (=> b!336453 (= lt!160260 (select (arr!8284 _keys!1895) (index!14985 lt!160261)))))

(declare-fun c!52301 () Bool)

(assert (=> b!336453 (= c!52301 (= lt!160260 k0!1348))))

(declare-fun b!336454 () Bool)

(assert (=> b!336454 (= e!206522 (Found!3201 (index!14985 lt!160261)))))

(declare-fun b!336455 () Bool)

(assert (=> b!336455 (= e!206523 (MissingZero!3201 (index!14985 lt!160261)))))

(assert (= (and d!70711 c!52302) b!336450))

(assert (= (and d!70711 (not c!52302)) b!336453))

(assert (= (and b!336453 c!52301) b!336454))

(assert (= (and b!336453 (not c!52301)) b!336452))

(assert (= (and b!336452 c!52300) b!336455))

(assert (= (and b!336452 (not c!52300)) b!336451))

(declare-fun m!340255 () Bool)

(assert (=> b!336451 m!340255))

(declare-fun m!340257 () Bool)

(assert (=> d!70711 m!340257))

(declare-fun m!340259 () Bool)

(assert (=> d!70711 m!340259))

(assert (=> d!70711 m!340143))

(assert (=> d!70711 m!340257))

(declare-fun m!340261 () Bool)

(assert (=> d!70711 m!340261))

(declare-fun m!340263 () Bool)

(assert (=> d!70711 m!340263))

(declare-fun m!340265 () Bool)

(assert (=> d!70711 m!340265))

(declare-fun m!340267 () Bool)

(assert (=> b!336453 m!340267))

(assert (=> b!336288 d!70711))

(declare-fun b!336462 () Bool)

(declare-fun e!206528 () Bool)

(assert (=> b!336462 (= e!206528 tp_is_empty!6957)))

(declare-fun mapIsEmpty!11844 () Bool)

(declare-fun mapRes!11844 () Bool)

(assert (=> mapIsEmpty!11844 mapRes!11844))

(declare-fun mapNonEmpty!11844 () Bool)

(declare-fun tp!24534 () Bool)

(assert (=> mapNonEmpty!11844 (= mapRes!11844 (and tp!24534 e!206528))))

(declare-fun mapValue!11844 () ValueCell!3135)

(declare-fun mapRest!11844 () (Array (_ BitVec 32) ValueCell!3135))

(declare-fun mapKey!11844 () (_ BitVec 32))

(assert (=> mapNonEmpty!11844 (= mapRest!11838 (store mapRest!11844 mapKey!11844 mapValue!11844))))

(declare-fun b!336463 () Bool)

(declare-fun e!206529 () Bool)

(assert (=> b!336463 (= e!206529 tp_is_empty!6957)))

(declare-fun condMapEmpty!11844 () Bool)

(declare-fun mapDefault!11844 () ValueCell!3135)

(assert (=> mapNonEmpty!11838 (= condMapEmpty!11844 (= mapRest!11838 ((as const (Array (_ BitVec 32) ValueCell!3135)) mapDefault!11844)))))

(assert (=> mapNonEmpty!11838 (= tp!24525 (and e!206529 mapRes!11844))))

(assert (= (and mapNonEmpty!11838 condMapEmpty!11844) mapIsEmpty!11844))

(assert (= (and mapNonEmpty!11838 (not condMapEmpty!11844)) mapNonEmpty!11844))

(assert (= (and mapNonEmpty!11844 ((_ is ValueCellFull!3135) mapValue!11844)) b!336462))

(assert (= (and mapNonEmpty!11838 ((_ is ValueCellFull!3135) mapDefault!11844)) b!336463))

(declare-fun m!340269 () Bool)

(assert (=> mapNonEmpty!11844 m!340269))

(declare-fun b_lambda!8413 () Bool)

(assert (= b_lambda!8411 (or (and start!33806 b_free!7005) b_lambda!8413)))

(check-sat (not b_lambda!8413) (not b!336398) (not b!336419) (not b!336437) (not d!70699) (not b!336435) (not d!70711) (not bm!26366) (not b!336421) (not b!336400) (not mapNonEmpty!11844) (not b!336434) (not b_next!7005) (not bm!26371) (not b!336388) tp_is_empty!6957 (not bm!26367) (not b!336386) (not d!70701) (not bm!26364) (not b!336399) (not b!336384) (not b!336451) (not bm!26374) (not b!336387) (not b!336410) (not b!336339) (not b!336337) (not b!336394) (not bm!26363) b_and!14193)
(check-sat b_and!14193 (not b_next!7005))
