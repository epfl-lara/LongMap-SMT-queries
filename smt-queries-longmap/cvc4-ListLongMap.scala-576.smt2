; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15602 () Bool)

(assert start!15602)

(declare-fun b!155363 () Bool)

(declare-fun b_free!3269 () Bool)

(declare-fun b_next!3269 () Bool)

(assert (=> b!155363 (= b_free!3269 (not b_next!3269))))

(declare-fun tp!12332 () Bool)

(declare-fun b_and!9683 () Bool)

(assert (=> b!155363 (= tp!12332 b_and!9683)))

(declare-fun b!155356 () Bool)

(declare-fun e!101496 () Bool)

(assert (=> b!155356 (= e!101496 false)))

(declare-fun lt!81355 () Bool)

(declare-datatypes ((V!3741 0))(
  ( (V!3742 (val!1580 Int)) )
))
(declare-datatypes ((ValueCell!1192 0))(
  ( (ValueCellFull!1192 (v!3445 V!3741)) (EmptyCell!1192) )
))
(declare-datatypes ((array!5195 0))(
  ( (array!5196 (arr!2455 (Array (_ BitVec 32) (_ BitVec 64))) (size!2733 (_ BitVec 32))) )
))
(declare-datatypes ((array!5197 0))(
  ( (array!5198 (arr!2456 (Array (_ BitVec 32) ValueCell!1192)) (size!2734 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1292 0))(
  ( (LongMapFixedSize!1293 (defaultEntry!3088 Int) (mask!7509 (_ BitVec 32)) (extraKeys!2829 (_ BitVec 32)) (zeroValue!2931 V!3741) (minValue!2931 V!3741) (_size!695 (_ BitVec 32)) (_keys!4863 array!5195) (_values!3071 array!5197) (_vacant!695 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1292)

(declare-datatypes ((List!1823 0))(
  ( (Nil!1820) (Cons!1819 (h!2428 (_ BitVec 64)) (t!6625 List!1823)) )
))
(declare-fun arrayNoDuplicates!0 (array!5195 (_ BitVec 32) List!1823) Bool)

(assert (=> b!155356 (= lt!81355 (arrayNoDuplicates!0 (_keys!4863 thiss!1248) #b00000000000000000000000000000000 Nil!1820))))

(declare-fun b!155357 () Bool)

(declare-fun e!101499 () Bool)

(declare-fun tp_is_empty!3071 () Bool)

(assert (=> b!155357 (= e!101499 tp_is_empty!3071)))

(declare-fun b!155358 () Bool)

(declare-fun res!73368 () Bool)

(assert (=> b!155358 (=> (not res!73368) (not e!101496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5195 (_ BitVec 32)) Bool)

(assert (=> b!155358 (= res!73368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4863 thiss!1248) (mask!7509 thiss!1248)))))

(declare-fun b!155359 () Bool)

(declare-fun e!101495 () Bool)

(assert (=> b!155359 (= e!101495 tp_is_empty!3071)))

(declare-fun b!155360 () Bool)

(declare-fun res!73366 () Bool)

(assert (=> b!155360 (=> (not res!73366) (not e!101496))))

(assert (=> b!155360 (= res!73366 (and (= (size!2734 (_values!3071 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7509 thiss!1248))) (= (size!2733 (_keys!4863 thiss!1248)) (size!2734 (_values!3071 thiss!1248))) (bvsge (mask!7509 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2829 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2829 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2829 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2829 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2829 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2829 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2829 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5249 () Bool)

(declare-fun mapRes!5249 () Bool)

(declare-fun tp!12331 () Bool)

(assert (=> mapNonEmpty!5249 (= mapRes!5249 (and tp!12331 e!101499))))

(declare-fun mapRest!5249 () (Array (_ BitVec 32) ValueCell!1192))

(declare-fun mapKey!5249 () (_ BitVec 32))

(declare-fun mapValue!5249 () ValueCell!1192)

(assert (=> mapNonEmpty!5249 (= (arr!2456 (_values!3071 thiss!1248)) (store mapRest!5249 mapKey!5249 mapValue!5249))))

(declare-fun mapIsEmpty!5249 () Bool)

(assert (=> mapIsEmpty!5249 mapRes!5249))

(declare-fun b!155361 () Bool)

(declare-fun res!73369 () Bool)

(assert (=> b!155361 (=> (not res!73369) (not e!101496))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155361 (= res!73369 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!73367 () Bool)

(assert (=> start!15602 (=> (not res!73367) (not e!101496))))

(declare-fun valid!635 (LongMapFixedSize!1292) Bool)

(assert (=> start!15602 (= res!73367 (valid!635 thiss!1248))))

(assert (=> start!15602 e!101496))

(declare-fun e!101497 () Bool)

(assert (=> start!15602 e!101497))

(assert (=> start!15602 true))

(declare-fun b!155355 () Bool)

(declare-fun res!73365 () Bool)

(assert (=> b!155355 (=> (not res!73365) (not e!101496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155355 (= res!73365 (validMask!0 (mask!7509 thiss!1248)))))

(declare-fun b!155362 () Bool)

(declare-fun e!101498 () Bool)

(assert (=> b!155362 (= e!101498 (and e!101495 mapRes!5249))))

(declare-fun condMapEmpty!5249 () Bool)

(declare-fun mapDefault!5249 () ValueCell!1192)

