; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21938 () Bool)

(assert start!21938)

(declare-fun b!223721 () Bool)

(declare-fun b_free!6005 () Bool)

(declare-fun b_next!6005 () Bool)

(assert (=> b!223721 (= b_free!6005 (not b_next!6005))))

(declare-fun tp!21157 () Bool)

(declare-fun b_and!12903 () Bool)

(assert (=> b!223721 (= tp!21157 b_and!12903)))

(declare-fun bm!20846 () Bool)

(declare-fun call!20849 () Bool)

(declare-datatypes ((V!7469 0))(
  ( (V!7470 (val!2978 Int)) )
))
(declare-datatypes ((ValueCell!2590 0))(
  ( (ValueCellFull!2590 (v!4998 V!7469)) (EmptyCell!2590) )
))
(declare-datatypes ((array!10977 0))(
  ( (array!10978 (arr!5208 (Array (_ BitVec 32) ValueCell!2590)) (size!5541 (_ BitVec 32))) )
))
(declare-datatypes ((array!10979 0))(
  ( (array!10980 (arr!5209 (Array (_ BitVec 32) (_ BitVec 64))) (size!5542 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3080 0))(
  ( (LongMapFixedSize!3081 (defaultEntry!4199 Int) (mask!10027 (_ BitVec 32)) (extraKeys!3936 (_ BitVec 32)) (zeroValue!4040 V!7469) (minValue!4040 V!7469) (_size!1589 (_ BitVec 32)) (_keys!6253 array!10979) (_values!4182 array!10977) (_vacant!1589 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3080)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20846 (= call!20849 (arrayContainsKey!0 (_keys!6253 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223701 () Bool)

(declare-fun e!145306 () Bool)

(declare-fun e!145298 () Bool)

(assert (=> b!223701 (= e!145306 e!145298)))

(declare-fun res!109978 () Bool)

(declare-fun call!20850 () Bool)

(assert (=> b!223701 (= res!109978 call!20850)))

(assert (=> b!223701 (=> (not res!109978) (not e!145298))))

(declare-fun mapNonEmpty!9970 () Bool)

(declare-fun mapRes!9970 () Bool)

(declare-fun tp!21156 () Bool)

(declare-fun e!145299 () Bool)

(assert (=> mapNonEmpty!9970 (= mapRes!9970 (and tp!21156 e!145299))))

(declare-fun mapKey!9970 () (_ BitVec 32))

(declare-fun mapValue!9970 () ValueCell!2590)

(declare-fun mapRest!9970 () (Array (_ BitVec 32) ValueCell!2590))

(assert (=> mapNonEmpty!9970 (= (arr!5208 (_values!4182 thiss!1504)) (store mapRest!9970 mapKey!9970 mapValue!9970))))

(declare-fun b!223702 () Bool)

(declare-fun res!109983 () Bool)

(declare-fun e!145301 () Bool)

(assert (=> b!223702 (=> (not res!109983) (not e!145301))))

(declare-datatypes ((SeekEntryResult!851 0))(
  ( (MissingZero!851 (index!5574 (_ BitVec 32))) (Found!851 (index!5575 (_ BitVec 32))) (Intermediate!851 (undefined!1663 Bool) (index!5576 (_ BitVec 32)) (x!23103 (_ BitVec 32))) (Undefined!851) (MissingVacant!851 (index!5577 (_ BitVec 32))) )
))
(declare-fun lt!112967 () SeekEntryResult!851)

(assert (=> b!223702 (= res!109983 (= (select (arr!5209 (_keys!6253 thiss!1504)) (index!5574 lt!112967)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223703 () Bool)

(declare-fun e!145294 () Bool)

(declare-fun e!145307 () Bool)

(assert (=> b!223703 (= e!145294 e!145307)))

(declare-fun res!109971 () Bool)

(assert (=> b!223703 (=> (not res!109971) (not e!145307))))

(assert (=> b!223703 (= res!109971 (and (bvslt (size!5542 (_keys!6253 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5542 (_keys!6253 thiss!1504)))))))

(declare-datatypes ((Unit!6726 0))(
  ( (Unit!6727) )
))
(declare-fun lt!112970 () Unit!6726)

(declare-fun e!145302 () Unit!6726)

(assert (=> b!223703 (= lt!112970 e!145302)))

(declare-fun c!37127 () Bool)

(declare-fun lt!112969 () Bool)

(assert (=> b!223703 (= c!37127 lt!112969)))

(assert (=> b!223703 (= lt!112969 (arrayContainsKey!0 (_keys!6253 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223704 () Bool)

(declare-fun e!145290 () Bool)

(declare-datatypes ((List!3325 0))(
  ( (Nil!3322) (Cons!3321 (h!3969 (_ BitVec 64)) (t!8284 List!3325)) )
))
(declare-fun contains!1545 (List!3325 (_ BitVec 64)) Bool)

(assert (=> b!223704 (= e!145290 (contains!1545 Nil!3322 key!932))))

(declare-fun b!223705 () Bool)

(declare-fun e!145300 () Bool)

(declare-fun tp_is_empty!5867 () Bool)

(assert (=> b!223705 (= e!145300 tp_is_empty!5867)))

(declare-fun b!223706 () Bool)

(declare-fun e!145305 () Bool)

(assert (=> b!223706 (= e!145305 (not (contains!1545 Nil!3322 key!932)))))

(declare-fun b!223707 () Bool)

(declare-fun res!109972 () Bool)

(assert (=> b!223707 (=> (not res!109972) (not e!145301))))

(assert (=> b!223707 (= res!109972 call!20850)))

(declare-fun e!145303 () Bool)

(assert (=> b!223707 (= e!145303 e!145301)))

(declare-fun b!223708 () Bool)

(declare-fun Unit!6728 () Unit!6726)

(assert (=> b!223708 (= e!145302 Unit!6728)))

(declare-fun res!109977 () Bool)

(declare-fun e!145292 () Bool)

(assert (=> start!21938 (=> (not res!109977) (not e!145292))))

(declare-fun valid!1241 (LongMapFixedSize!3080) Bool)

(assert (=> start!21938 (= res!109977 (valid!1241 thiss!1504))))

(assert (=> start!21938 e!145292))

(declare-fun e!145295 () Bool)

(assert (=> start!21938 e!145295))

(assert (=> start!21938 true))

(declare-fun b!223709 () Bool)

(declare-fun res!109982 () Bool)

(assert (=> b!223709 (=> (not res!109982) (not e!145307))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!223709 (= res!109982 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5542 (_keys!6253 thiss!1504)))))))

(declare-fun b!223710 () Bool)

(declare-fun Unit!6729 () Unit!6726)

(assert (=> b!223710 (= e!145302 Unit!6729)))

(declare-fun lt!112972 () Unit!6726)

(declare-fun lemmaArrayContainsKeyThenInListMap!74 (array!10979 array!10977 (_ BitVec 32) (_ BitVec 32) V!7469 V!7469 (_ BitVec 64) (_ BitVec 32) Int) Unit!6726)

(assert (=> b!223710 (= lt!112972 (lemmaArrayContainsKeyThenInListMap!74 (_keys!6253 thiss!1504) (_values!4182 thiss!1504) (mask!10027 thiss!1504) (extraKeys!3936 thiss!1504) (zeroValue!4040 thiss!1504) (minValue!4040 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4199 thiss!1504)))))

(assert (=> b!223710 false))

(declare-fun b!223711 () Bool)

(declare-fun res!109984 () Bool)

(assert (=> b!223711 (=> (not res!109984) (not e!145307))))

(declare-fun noDuplicate!80 (List!3325) Bool)

(assert (=> b!223711 (= res!109984 (noDuplicate!80 Nil!3322))))

(declare-fun b!223712 () Bool)

(assert (=> b!223712 (= e!145307 false)))

(declare-fun lt!112973 () Bool)

(assert (=> b!223712 (= lt!112973 (contains!1545 Nil!3322 key!932))))

(declare-fun b!223713 () Bool)

(assert (=> b!223713 (= e!145306 (is-Undefined!851 lt!112967))))

(declare-fun b!223714 () Bool)

(declare-fun res!109985 () Bool)

(assert (=> b!223714 (=> (not res!109985) (not e!145307))))

(assert (=> b!223714 (= res!109985 (not (contains!1545 Nil!3322 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!9970 () Bool)

(assert (=> mapIsEmpty!9970 mapRes!9970))

(declare-fun b!223715 () Bool)

(declare-fun res!109974 () Bool)

(assert (=> b!223715 (=> (not res!109974) (not e!145307))))

(declare-fun arrayNoDuplicates!0 (array!10979 (_ BitVec 32) List!3325) Bool)

(assert (=> b!223715 (= res!109974 (arrayNoDuplicates!0 (_keys!6253 thiss!1504) #b00000000000000000000000000000000 Nil!3322))))

(declare-fun b!223716 () Bool)

(declare-fun e!145304 () Bool)

(assert (=> b!223716 (= e!145304 (and e!145300 mapRes!9970))))

(declare-fun condMapEmpty!9970 () Bool)

(declare-fun mapDefault!9970 () ValueCell!2590)

