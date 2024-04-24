; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15602 () Bool)

(assert start!15602)

(declare-fun b!155351 () Bool)

(declare-fun b_free!3265 () Bool)

(declare-fun b_next!3265 () Bool)

(assert (=> b!155351 (= b_free!3265 (not b_next!3265))))

(declare-fun tp!12319 () Bool)

(declare-fun b_and!9693 () Bool)

(assert (=> b!155351 (= tp!12319 b_and!9693)))

(declare-fun mapNonEmpty!5243 () Bool)

(declare-fun mapRes!5243 () Bool)

(declare-fun tp!12320 () Bool)

(declare-fun e!101485 () Bool)

(assert (=> mapNonEmpty!5243 (= mapRes!5243 (and tp!12320 e!101485))))

(declare-fun mapKey!5243 () (_ BitVec 32))

(declare-datatypes ((V!3737 0))(
  ( (V!3738 (val!1578 Int)) )
))
(declare-datatypes ((ValueCell!1190 0))(
  ( (ValueCellFull!1190 (v!3444 V!3737)) (EmptyCell!1190) )
))
(declare-fun mapRest!5243 () (Array (_ BitVec 32) ValueCell!1190))

(declare-fun mapValue!5243 () ValueCell!1190)

(declare-datatypes ((array!5173 0))(
  ( (array!5174 (arr!2444 (Array (_ BitVec 32) (_ BitVec 64))) (size!2722 (_ BitVec 32))) )
))
(declare-datatypes ((array!5175 0))(
  ( (array!5176 (arr!2445 (Array (_ BitVec 32) ValueCell!1190)) (size!2723 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1288 0))(
  ( (LongMapFixedSize!1289 (defaultEntry!3086 Int) (mask!7507 (_ BitVec 32)) (extraKeys!2827 (_ BitVec 32)) (zeroValue!2929 V!3737) (minValue!2929 V!3737) (_size!693 (_ BitVec 32)) (_keys!4861 array!5173) (_values!3069 array!5175) (_vacant!693 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1288)

(assert (=> mapNonEmpty!5243 (= (arr!2445 (_values!3069 thiss!1248)) (store mapRest!5243 mapKey!5243 mapValue!5243))))

(declare-fun b!155348 () Bool)

(declare-fun res!73356 () Bool)

(declare-fun e!101484 () Bool)

(assert (=> b!155348 (=> (not res!73356) (not e!101484))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155348 (= res!73356 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155349 () Bool)

(declare-fun res!73360 () Bool)

(assert (=> b!155349 (=> (not res!73360) (not e!101484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155349 (= res!73360 (validMask!0 (mask!7507 thiss!1248)))))

(declare-fun mapIsEmpty!5243 () Bool)

(assert (=> mapIsEmpty!5243 mapRes!5243))

(declare-fun res!73358 () Bool)

(assert (=> start!15602 (=> (not res!73358) (not e!101484))))

(declare-fun valid!647 (LongMapFixedSize!1288) Bool)

(assert (=> start!15602 (= res!73358 (valid!647 thiss!1248))))

(assert (=> start!15602 e!101484))

(declare-fun e!101483 () Bool)

(assert (=> start!15602 e!101483))

(assert (=> start!15602 true))

(declare-fun b!155350 () Bool)

(declare-fun tp_is_empty!3067 () Bool)

(assert (=> b!155350 (= e!101485 tp_is_empty!3067)))

(declare-fun e!101486 () Bool)

(declare-fun array_inv!1545 (array!5173) Bool)

(declare-fun array_inv!1546 (array!5175) Bool)

(assert (=> b!155351 (= e!101483 (and tp!12319 tp_is_empty!3067 (array_inv!1545 (_keys!4861 thiss!1248)) (array_inv!1546 (_values!3069 thiss!1248)) e!101486))))

(declare-fun b!155352 () Bool)

(declare-fun res!73359 () Bool)

(assert (=> b!155352 (=> (not res!73359) (not e!101484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5173 (_ BitVec 32)) Bool)

(assert (=> b!155352 (= res!73359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4861 thiss!1248) (mask!7507 thiss!1248)))))

(declare-fun b!155353 () Bool)

(declare-fun e!101482 () Bool)

(assert (=> b!155353 (= e!101482 tp_is_empty!3067)))

(declare-fun b!155354 () Bool)

(declare-fun res!73357 () Bool)

(assert (=> b!155354 (=> (not res!73357) (not e!101484))))

(assert (=> b!155354 (= res!73357 (and (= (size!2723 (_values!3069 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7507 thiss!1248))) (= (size!2722 (_keys!4861 thiss!1248)) (size!2723 (_values!3069 thiss!1248))) (bvsge (mask!7507 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2827 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2827 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2827 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2827 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2827 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2827 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2827 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155355 () Bool)

(assert (=> b!155355 (= e!101484 false)))

(declare-fun lt!81408 () Bool)

(declare-datatypes ((List!1804 0))(
  ( (Nil!1801) (Cons!1800 (h!2409 (_ BitVec 64)) (t!6598 List!1804)) )
))
(declare-fun arrayNoDuplicates!0 (array!5173 (_ BitVec 32) List!1804) Bool)

(assert (=> b!155355 (= lt!81408 (arrayNoDuplicates!0 (_keys!4861 thiss!1248) #b00000000000000000000000000000000 Nil!1801))))

(declare-fun b!155356 () Bool)

(assert (=> b!155356 (= e!101486 (and e!101482 mapRes!5243))))

(declare-fun condMapEmpty!5243 () Bool)

(declare-fun mapDefault!5243 () ValueCell!1190)

(assert (=> b!155356 (= condMapEmpty!5243 (= (arr!2445 (_values!3069 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1190)) mapDefault!5243)))))

(assert (= (and start!15602 res!73358) b!155348))

(assert (= (and b!155348 res!73356) b!155349))

(assert (= (and b!155349 res!73360) b!155354))

(assert (= (and b!155354 res!73357) b!155352))

(assert (= (and b!155352 res!73359) b!155355))

(assert (= (and b!155356 condMapEmpty!5243) mapIsEmpty!5243))

(assert (= (and b!155356 (not condMapEmpty!5243)) mapNonEmpty!5243))

(get-info :version)

(assert (= (and mapNonEmpty!5243 ((_ is ValueCellFull!1190) mapValue!5243)) b!155350))

(assert (= (and b!155356 ((_ is ValueCellFull!1190) mapDefault!5243)) b!155353))

(assert (= b!155351 b!155356))

(assert (= start!15602 b!155351))

(declare-fun m!189449 () Bool)

(assert (=> mapNonEmpty!5243 m!189449))

(declare-fun m!189451 () Bool)

(assert (=> start!15602 m!189451))

(declare-fun m!189453 () Bool)

(assert (=> b!155352 m!189453))

(declare-fun m!189455 () Bool)

(assert (=> b!155349 m!189455))

(declare-fun m!189457 () Bool)

(assert (=> b!155351 m!189457))

(declare-fun m!189459 () Bool)

(assert (=> b!155351 m!189459))

(declare-fun m!189461 () Bool)

(assert (=> b!155355 m!189461))

(check-sat (not b_next!3265) (not start!15602) b_and!9693 (not mapNonEmpty!5243) (not b!155351) (not b!155349) (not b!155355) (not b!155352) tp_is_empty!3067)
(check-sat b_and!9693 (not b_next!3265))
