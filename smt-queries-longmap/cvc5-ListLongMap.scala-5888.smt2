; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75858 () Bool)

(assert start!75858)

(declare-fun b!892720 () Bool)

(declare-fun b_free!15829 () Bool)

(declare-fun b_next!15829 () Bool)

(assert (=> b!892720 (= b_free!15829 (not b_next!15829))))

(declare-fun tp!55455 () Bool)

(declare-fun b_and!26081 () Bool)

(assert (=> b!892720 (= tp!55455 b_and!26081)))

(declare-fun bm!39548 () Bool)

(declare-datatypes ((V!29175 0))(
  ( (V!29176 (val!9129 Int)) )
))
(declare-fun call!39552 () V!29175)

(declare-datatypes ((tuple2!12008 0))(
  ( (tuple2!12009 (_1!6015 (_ BitVec 64)) (_2!6015 V!29175)) )
))
(declare-datatypes ((List!17791 0))(
  ( (Nil!17788) (Cons!17787 (h!18918 tuple2!12008) (t!25104 List!17791)) )
))
(declare-datatypes ((ListLongMap!10705 0))(
  ( (ListLongMap!10706 (toList!5368 List!17791)) )
))
(declare-fun lt!403315 () ListLongMap!10705)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun apply!405 (ListLongMap!10705 (_ BitVec 64)) V!29175)

(assert (=> bm!39548 (= call!39552 (apply!405 lt!403315 key!785))))

(declare-fun mapNonEmpty!28790 () Bool)

(declare-fun mapRes!28790 () Bool)

(declare-fun tp!55456 () Bool)

(declare-fun e!498423 () Bool)

(assert (=> mapNonEmpty!28790 (= mapRes!28790 (and tp!55456 e!498423))))

(declare-datatypes ((ValueCell!8597 0))(
  ( (ValueCellFull!8597 (v!11607 V!29175)) (EmptyCell!8597) )
))
(declare-fun mapRest!28790 () (Array (_ BitVec 32) ValueCell!8597))

(declare-datatypes ((array!52294 0))(
  ( (array!52295 (arr!25153 (Array (_ BitVec 32) (_ BitVec 64))) (size!25597 (_ BitVec 32))) )
))
(declare-datatypes ((array!52296 0))(
  ( (array!52297 (arr!25154 (Array (_ BitVec 32) ValueCell!8597)) (size!25598 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4210 0))(
  ( (LongMapFixedSize!4211 (defaultEntry!5302 Int) (mask!25819 (_ BitVec 32)) (extraKeys!4996 (_ BitVec 32)) (zeroValue!5100 V!29175) (minValue!5100 V!29175) (_size!2160 (_ BitVec 32)) (_keys!9985 array!52294) (_values!5287 array!52296) (_vacant!2160 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4210)

(declare-fun mapKey!28790 () (_ BitVec 32))

(declare-fun mapValue!28790 () ValueCell!8597)

(assert (=> mapNonEmpty!28790 (= (arr!25154 (_values!5287 thiss!1181)) (store mapRest!28790 mapKey!28790 mapValue!28790))))

(declare-fun b!892717 () Bool)

(declare-fun e!498414 () Bool)

(declare-fun e!498422 () Bool)

(assert (=> b!892717 (= e!498414 (not e!498422))))

(declare-fun res!604748 () Bool)

(assert (=> b!892717 (=> res!604748 e!498422)))

(declare-datatypes ((SeekEntryResult!8854 0))(
  ( (MissingZero!8854 (index!37787 (_ BitVec 32))) (Found!8854 (index!37788 (_ BitVec 32))) (Intermediate!8854 (undefined!9666 Bool) (index!37789 (_ BitVec 32)) (x!75884 (_ BitVec 32))) (Undefined!8854) (MissingVacant!8854 (index!37790 (_ BitVec 32))) )
))
(declare-fun lt!403312 () SeekEntryResult!8854)

(assert (=> b!892717 (= res!604748 (not (is-Found!8854 lt!403312)))))

(declare-fun e!498415 () Bool)

(assert (=> b!892717 e!498415))

(declare-fun res!604744 () Bool)

(assert (=> b!892717 (=> res!604744 e!498415)))

(assert (=> b!892717 (= res!604744 (not (is-Found!8854 lt!403312)))))

(declare-datatypes ((Unit!30402 0))(
  ( (Unit!30403) )
))
(declare-fun lt!403311 () Unit!30402)

(declare-fun lemmaSeekEntryGivesInRangeIndex!53 (array!52294 array!52296 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 64)) Unit!30402)

(assert (=> b!892717 (= lt!403311 (lemmaSeekEntryGivesInRangeIndex!53 (_keys!9985 thiss!1181) (_values!5287 thiss!1181) (mask!25819 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52294 (_ BitVec 32)) SeekEntryResult!8854)

(assert (=> b!892717 (= lt!403312 (seekEntry!0 key!785 (_keys!9985 thiss!1181) (mask!25819 thiss!1181)))))

(declare-fun b!892718 () Bool)

(declare-fun e!498419 () Bool)

(declare-fun e!498413 () Bool)

(assert (=> b!892718 (= e!498419 e!498413)))

(declare-fun res!604746 () Bool)

(assert (=> b!892718 (= res!604746 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892718 (=> (not res!604746) (not e!498413))))

(declare-fun b!892719 () Bool)

(declare-fun e!498417 () Bool)

(declare-fun e!498416 () Bool)

(assert (=> b!892719 (= e!498417 (and e!498416 mapRes!28790))))

(declare-fun condMapEmpty!28790 () Bool)

(declare-fun mapDefault!28790 () ValueCell!8597)

