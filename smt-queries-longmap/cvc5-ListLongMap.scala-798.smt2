; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19162 () Bool)

(assert start!19162)

(declare-fun b!188524 () Bool)

(declare-fun b_free!4627 () Bool)

(declare-fun b_next!4627 () Bool)

(assert (=> b!188524 (= b_free!4627 (not b_next!4627))))

(declare-fun tp!16704 () Bool)

(declare-fun b_and!11259 () Bool)

(assert (=> b!188524 (= tp!16704 b_and!11259)))

(declare-fun b!188519 () Bool)

(declare-fun e!124074 () Bool)

(declare-fun e!124070 () Bool)

(assert (=> b!188519 (= e!124074 e!124070)))

(declare-fun res!89117 () Bool)

(assert (=> b!188519 (=> (not res!89117) (not e!124070))))

(declare-datatypes ((V!5513 0))(
  ( (V!5514 (val!2244 Int)) )
))
(declare-datatypes ((ValueCell!1856 0))(
  ( (ValueCellFull!1856 (v!4162 V!5513)) (EmptyCell!1856) )
))
(declare-datatypes ((array!8021 0))(
  ( (array!8022 (arr!3783 (Array (_ BitVec 32) (_ BitVec 64))) (size!4103 (_ BitVec 32))) )
))
(declare-datatypes ((array!8023 0))(
  ( (array!8024 (arr!3784 (Array (_ BitVec 32) ValueCell!1856)) (size!4104 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2620 0))(
  ( (LongMapFixedSize!2621 (defaultEntry!3845 Int) (mask!9014 (_ BitVec 32)) (extraKeys!3582 (_ BitVec 32)) (zeroValue!3686 V!5513) (minValue!3686 V!5513) (_size!1359 (_ BitVec 32)) (_keys!5806 array!8021) (_values!3828 array!8023) (_vacant!1359 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2620)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188519 (= res!89117 (validMask!0 (mask!9014 thiss!1248)))))

(declare-datatypes ((Unit!5684 0))(
  ( (Unit!5685) )
))
(declare-fun lt!93317 () Unit!5684)

(declare-fun e!124069 () Unit!5684)

(assert (=> b!188519 (= lt!93317 e!124069)))

(declare-fun c!33887 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3492 0))(
  ( (tuple2!3493 (_1!1757 (_ BitVec 64)) (_2!1757 V!5513)) )
))
(declare-datatypes ((List!2392 0))(
  ( (Nil!2389) (Cons!2388 (h!3025 tuple2!3492) (t!7290 List!2392)) )
))
(declare-datatypes ((ListLongMap!2409 0))(
  ( (ListLongMap!2410 (toList!1220 List!2392)) )
))
(declare-fun contains!1324 (ListLongMap!2409 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!868 (array!8021 array!8023 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 32) Int) ListLongMap!2409)

(assert (=> b!188519 (= c!33887 (contains!1324 (getCurrentListMap!868 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)) key!828))))

(declare-fun b!188520 () Bool)

(declare-fun e!124066 () Bool)

(declare-fun e!124065 () Bool)

(declare-fun mapRes!7585 () Bool)

(assert (=> b!188520 (= e!124066 (and e!124065 mapRes!7585))))

(declare-fun condMapEmpty!7585 () Bool)

(declare-fun mapDefault!7585 () ValueCell!1856)

