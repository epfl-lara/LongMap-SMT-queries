; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15680 () Bool)

(assert start!15680)

(declare-fun b!156292 () Bool)

(declare-fun b_free!3347 () Bool)

(declare-fun b_next!3347 () Bool)

(assert (=> b!156292 (= b_free!3347 (not b_next!3347))))

(declare-fun tp!12565 () Bool)

(declare-fun b_and!9761 () Bool)

(assert (=> b!156292 (= tp!12565 b_and!9761)))

(declare-fun b!156291 () Bool)

(declare-fun res!73836 () Bool)

(declare-fun e!102219 () Bool)

(assert (=> b!156291 (=> (not res!73836) (not e!102219))))

(declare-datatypes ((V!3845 0))(
  ( (V!3846 (val!1619 Int)) )
))
(declare-datatypes ((ValueCell!1231 0))(
  ( (ValueCellFull!1231 (v!3484 V!3845)) (EmptyCell!1231) )
))
(declare-datatypes ((array!5351 0))(
  ( (array!5352 (arr!2533 (Array (_ BitVec 32) (_ BitVec 64))) (size!2811 (_ BitVec 32))) )
))
(declare-datatypes ((array!5353 0))(
  ( (array!5354 (arr!2534 (Array (_ BitVec 32) ValueCell!1231)) (size!2812 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1370 0))(
  ( (LongMapFixedSize!1371 (defaultEntry!3127 Int) (mask!7574 (_ BitVec 32)) (extraKeys!2868 (_ BitVec 32)) (zeroValue!2970 V!3845) (minValue!2970 V!3845) (_size!734 (_ BitVec 32)) (_keys!4902 array!5351) (_values!3110 array!5353) (_vacant!734 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1370)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5351 (_ BitVec 32)) Bool)

(assert (=> b!156291 (= res!73836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4902 thiss!1248) (mask!7574 thiss!1248)))))

(declare-fun tp_is_empty!3149 () Bool)

(declare-fun e!102218 () Bool)

(declare-fun e!102216 () Bool)

(declare-fun array_inv!1601 (array!5351) Bool)

(declare-fun array_inv!1602 (array!5353) Bool)

(assert (=> b!156292 (= e!102218 (and tp!12565 tp_is_empty!3149 (array_inv!1601 (_keys!4902 thiss!1248)) (array_inv!1602 (_values!3110 thiss!1248)) e!102216))))

(declare-fun b!156293 () Bool)

(declare-fun e!102215 () Bool)

(assert (=> b!156293 (= e!102215 tp_is_empty!3149)))

(declare-fun b!156294 () Bool)

(declare-fun res!73835 () Bool)

(assert (=> b!156294 (=> (not res!73835) (not e!102219))))

(assert (=> b!156294 (= res!73835 (and (= (size!2812 (_values!3110 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7574 thiss!1248))) (= (size!2811 (_keys!4902 thiss!1248)) (size!2812 (_values!3110 thiss!1248))) (bvsge (mask!7574 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2868 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2868 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2868 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2868 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2868 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2868 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2868 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156295 () Bool)

(assert (=> b!156295 (= e!102219 false)))

(declare-fun lt!81535 () Bool)

(declare-datatypes ((List!1851 0))(
  ( (Nil!1848) (Cons!1847 (h!2456 (_ BitVec 64)) (t!6653 List!1851)) )
))
(declare-fun arrayNoDuplicates!0 (array!5351 (_ BitVec 32) List!1851) Bool)

(assert (=> b!156295 (= lt!81535 (arrayNoDuplicates!0 (_keys!4902 thiss!1248) #b00000000000000000000000000000000 Nil!1848))))

(declare-fun b!156296 () Bool)

(declare-fun res!73833 () Bool)

(assert (=> b!156296 (=> (not res!73833) (not e!102219))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156296 (= res!73833 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5366 () Bool)

(declare-fun mapRes!5366 () Bool)

(assert (=> mapIsEmpty!5366 mapRes!5366))

(declare-fun res!73837 () Bool)

(assert (=> start!15680 (=> (not res!73837) (not e!102219))))

(declare-fun valid!664 (LongMapFixedSize!1370) Bool)

(assert (=> start!15680 (= res!73837 (valid!664 thiss!1248))))

(assert (=> start!15680 e!102219))

(assert (=> start!15680 e!102218))

(assert (=> start!15680 true))

(declare-fun mapNonEmpty!5366 () Bool)

(declare-fun tp!12566 () Bool)

(assert (=> mapNonEmpty!5366 (= mapRes!5366 (and tp!12566 e!102215))))

(declare-fun mapKey!5366 () (_ BitVec 32))

(declare-fun mapValue!5366 () ValueCell!1231)

(declare-fun mapRest!5366 () (Array (_ BitVec 32) ValueCell!1231))

(assert (=> mapNonEmpty!5366 (= (arr!2534 (_values!3110 thiss!1248)) (store mapRest!5366 mapKey!5366 mapValue!5366))))

(declare-fun b!156297 () Bool)

(declare-fun e!102214 () Bool)

(assert (=> b!156297 (= e!102214 tp_is_empty!3149)))

(declare-fun b!156298 () Bool)

(assert (=> b!156298 (= e!102216 (and e!102214 mapRes!5366))))

(declare-fun condMapEmpty!5366 () Bool)

(declare-fun mapDefault!5366 () ValueCell!1231)

