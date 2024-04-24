; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17172 () Bool)

(assert start!17172)

(declare-fun b!172487 () Bool)

(declare-fun b_free!4255 () Bool)

(declare-fun b_next!4255 () Bool)

(assert (=> b!172487 (= b_free!4255 (not b_next!4255))))

(declare-fun tp!15411 () Bool)

(declare-fun b_and!10709 () Bool)

(assert (=> b!172487 (= tp!15411 b_and!10709)))

(declare-fun b!172486 () Bool)

(declare-fun e!113848 () Bool)

(declare-datatypes ((V!5017 0))(
  ( (V!5018 (val!2058 Int)) )
))
(declare-datatypes ((ValueCell!1670 0))(
  ( (ValueCellFull!1670 (v!3927 V!5017)) (EmptyCell!1670) )
))
(declare-datatypes ((array!7161 0))(
  ( (array!7162 (arr!3404 (Array (_ BitVec 32) (_ BitVec 64))) (size!3701 (_ BitVec 32))) )
))
(declare-datatypes ((array!7163 0))(
  ( (array!7164 (arr!3405 (Array (_ BitVec 32) ValueCell!1670)) (size!3702 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2248 0))(
  ( (LongMapFixedSize!2249 (defaultEntry!3570 Int) (mask!8415 (_ BitVec 32)) (extraKeys!3309 (_ BitVec 32)) (zeroValue!3411 V!5017) (minValue!3413 V!5017) (_size!1173 (_ BitVec 32)) (_keys!5407 array!7161) (_values!3553 array!7163) (_vacant!1173 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2248)

(assert (=> b!172486 (= e!113848 (and (= (size!3702 (_values!3553 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8415 thiss!1248))) (= (size!3701 (_keys!5407 thiss!1248)) (size!3702 (_values!3553 thiss!1248))) (bvslt (mask!8415 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun e!113851 () Bool)

(declare-fun tp_is_empty!4027 () Bool)

(declare-fun e!113847 () Bool)

(declare-fun array_inv!2191 (array!7161) Bool)

(declare-fun array_inv!2192 (array!7163) Bool)

(assert (=> b!172487 (= e!113851 (and tp!15411 tp_is_empty!4027 (array_inv!2191 (_keys!5407 thiss!1248)) (array_inv!2192 (_values!3553 thiss!1248)) e!113847))))

(declare-fun mapIsEmpty!6850 () Bool)

(declare-fun mapRes!6850 () Bool)

(assert (=> mapIsEmpty!6850 mapRes!6850))

(declare-fun b!172488 () Bool)

(declare-fun res!81902 () Bool)

(assert (=> b!172488 (=> (not res!81902) (not e!113848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172488 (= res!81902 (validMask!0 (mask!8415 thiss!1248)))))

(declare-fun b!172489 () Bool)

(declare-fun e!113850 () Bool)

(assert (=> b!172489 (= e!113850 tp_is_empty!4027)))

(declare-fun b!172490 () Bool)

(declare-fun res!81903 () Bool)

(assert (=> b!172490 (=> (not res!81903) (not e!113848))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172490 (= res!81903 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172491 () Bool)

(assert (=> b!172491 (= e!113847 (and e!113850 mapRes!6850))))

(declare-fun condMapEmpty!6850 () Bool)

(declare-fun mapDefault!6850 () ValueCell!1670)

(assert (=> b!172491 (= condMapEmpty!6850 (= (arr!3405 (_values!3553 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1670)) mapDefault!6850)))))

(declare-fun b!172492 () Bool)

(declare-fun e!113849 () Bool)

(assert (=> b!172492 (= e!113849 tp_is_empty!4027)))

(declare-fun res!81901 () Bool)

(assert (=> start!17172 (=> (not res!81901) (not e!113848))))

(declare-fun valid!971 (LongMapFixedSize!2248) Bool)

(assert (=> start!17172 (= res!81901 (valid!971 thiss!1248))))

(assert (=> start!17172 e!113848))

(assert (=> start!17172 e!113851))

(assert (=> start!17172 true))

(declare-fun mapNonEmpty!6850 () Bool)

(declare-fun tp!15412 () Bool)

(assert (=> mapNonEmpty!6850 (= mapRes!6850 (and tp!15412 e!113849))))

(declare-fun mapKey!6850 () (_ BitVec 32))

(declare-fun mapRest!6850 () (Array (_ BitVec 32) ValueCell!1670))

(declare-fun mapValue!6850 () ValueCell!1670)

(assert (=> mapNonEmpty!6850 (= (arr!3405 (_values!3553 thiss!1248)) (store mapRest!6850 mapKey!6850 mapValue!6850))))

(assert (= (and start!17172 res!81901) b!172490))

(assert (= (and b!172490 res!81903) b!172488))

(assert (= (and b!172488 res!81902) b!172486))

(assert (= (and b!172491 condMapEmpty!6850) mapIsEmpty!6850))

(assert (= (and b!172491 (not condMapEmpty!6850)) mapNonEmpty!6850))

(get-info :version)

(assert (= (and mapNonEmpty!6850 ((_ is ValueCellFull!1670) mapValue!6850)) b!172492))

(assert (= (and b!172491 ((_ is ValueCellFull!1670) mapDefault!6850)) b!172489))

(assert (= b!172487 b!172491))

(assert (= start!17172 b!172487))

(declare-fun m!201411 () Bool)

(assert (=> b!172487 m!201411))

(declare-fun m!201413 () Bool)

(assert (=> b!172487 m!201413))

(declare-fun m!201415 () Bool)

(assert (=> b!172488 m!201415))

(declare-fun m!201417 () Bool)

(assert (=> start!17172 m!201417))

(declare-fun m!201419 () Bool)

(assert (=> mapNonEmpty!6850 m!201419))

(check-sat (not b!172488) tp_is_empty!4027 (not mapNonEmpty!6850) (not b_next!4255) (not b!172487) b_and!10709 (not start!17172))
(check-sat b_and!10709 (not b_next!4255))
(get-model)

(declare-fun d!52583 () Bool)

(assert (=> d!52583 (= (validMask!0 (mask!8415 thiss!1248)) (and (or (= (mask!8415 thiss!1248) #b00000000000000000000000000000111) (= (mask!8415 thiss!1248) #b00000000000000000000000000001111) (= (mask!8415 thiss!1248) #b00000000000000000000000000011111) (= (mask!8415 thiss!1248) #b00000000000000000000000000111111) (= (mask!8415 thiss!1248) #b00000000000000000000000001111111) (= (mask!8415 thiss!1248) #b00000000000000000000000011111111) (= (mask!8415 thiss!1248) #b00000000000000000000000111111111) (= (mask!8415 thiss!1248) #b00000000000000000000001111111111) (= (mask!8415 thiss!1248) #b00000000000000000000011111111111) (= (mask!8415 thiss!1248) #b00000000000000000000111111111111) (= (mask!8415 thiss!1248) #b00000000000000000001111111111111) (= (mask!8415 thiss!1248) #b00000000000000000011111111111111) (= (mask!8415 thiss!1248) #b00000000000000000111111111111111) (= (mask!8415 thiss!1248) #b00000000000000001111111111111111) (= (mask!8415 thiss!1248) #b00000000000000011111111111111111) (= (mask!8415 thiss!1248) #b00000000000000111111111111111111) (= (mask!8415 thiss!1248) #b00000000000001111111111111111111) (= (mask!8415 thiss!1248) #b00000000000011111111111111111111) (= (mask!8415 thiss!1248) #b00000000000111111111111111111111) (= (mask!8415 thiss!1248) #b00000000001111111111111111111111) (= (mask!8415 thiss!1248) #b00000000011111111111111111111111) (= (mask!8415 thiss!1248) #b00000000111111111111111111111111) (= (mask!8415 thiss!1248) #b00000001111111111111111111111111) (= (mask!8415 thiss!1248) #b00000011111111111111111111111111) (= (mask!8415 thiss!1248) #b00000111111111111111111111111111) (= (mask!8415 thiss!1248) #b00001111111111111111111111111111) (= (mask!8415 thiss!1248) #b00011111111111111111111111111111) (= (mask!8415 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8415 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172488 d!52583))

(declare-fun d!52585 () Bool)

(declare-fun res!81928 () Bool)

(declare-fun e!113890 () Bool)

(assert (=> d!52585 (=> (not res!81928) (not e!113890))))

(declare-fun simpleValid!139 (LongMapFixedSize!2248) Bool)

(assert (=> d!52585 (= res!81928 (simpleValid!139 thiss!1248))))

(assert (=> d!52585 (= (valid!971 thiss!1248) e!113890)))

(declare-fun b!172541 () Bool)

(declare-fun res!81929 () Bool)

(assert (=> b!172541 (=> (not res!81929) (not e!113890))))

(declare-fun arrayCountValidKeys!0 (array!7161 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172541 (= res!81929 (= (arrayCountValidKeys!0 (_keys!5407 thiss!1248) #b00000000000000000000000000000000 (size!3701 (_keys!5407 thiss!1248))) (_size!1173 thiss!1248)))))

(declare-fun b!172542 () Bool)

(declare-fun res!81930 () Bool)

(assert (=> b!172542 (=> (not res!81930) (not e!113890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7161 (_ BitVec 32)) Bool)

(assert (=> b!172542 (= res!81930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5407 thiss!1248) (mask!8415 thiss!1248)))))

(declare-fun b!172543 () Bool)

(declare-datatypes ((List!2182 0))(
  ( (Nil!2179) (Cons!2178 (h!2795 (_ BitVec 64)) (t!6981 List!2182)) )
))
(declare-fun arrayNoDuplicates!0 (array!7161 (_ BitVec 32) List!2182) Bool)

(assert (=> b!172543 (= e!113890 (arrayNoDuplicates!0 (_keys!5407 thiss!1248) #b00000000000000000000000000000000 Nil!2179))))

(assert (= (and d!52585 res!81928) b!172541))

(assert (= (and b!172541 res!81929) b!172542))

(assert (= (and b!172542 res!81930) b!172543))

(declare-fun m!201441 () Bool)

(assert (=> d!52585 m!201441))

(declare-fun m!201443 () Bool)

(assert (=> b!172541 m!201443))

(declare-fun m!201445 () Bool)

(assert (=> b!172542 m!201445))

(declare-fun m!201447 () Bool)

(assert (=> b!172543 m!201447))

(assert (=> start!17172 d!52585))

(declare-fun d!52587 () Bool)

(assert (=> d!52587 (= (array_inv!2191 (_keys!5407 thiss!1248)) (bvsge (size!3701 (_keys!5407 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172487 d!52587))

(declare-fun d!52589 () Bool)

(assert (=> d!52589 (= (array_inv!2192 (_values!3553 thiss!1248)) (bvsge (size!3702 (_values!3553 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172487 d!52589))

(declare-fun mapIsEmpty!6859 () Bool)

(declare-fun mapRes!6859 () Bool)

(assert (=> mapIsEmpty!6859 mapRes!6859))

(declare-fun condMapEmpty!6859 () Bool)

(declare-fun mapDefault!6859 () ValueCell!1670)

(assert (=> mapNonEmpty!6850 (= condMapEmpty!6859 (= mapRest!6850 ((as const (Array (_ BitVec 32) ValueCell!1670)) mapDefault!6859)))))

(declare-fun e!113896 () Bool)

(assert (=> mapNonEmpty!6850 (= tp!15412 (and e!113896 mapRes!6859))))

(declare-fun mapNonEmpty!6859 () Bool)

(declare-fun tp!15427 () Bool)

(declare-fun e!113895 () Bool)

(assert (=> mapNonEmpty!6859 (= mapRes!6859 (and tp!15427 e!113895))))

(declare-fun mapRest!6859 () (Array (_ BitVec 32) ValueCell!1670))

(declare-fun mapKey!6859 () (_ BitVec 32))

(declare-fun mapValue!6859 () ValueCell!1670)

(assert (=> mapNonEmpty!6859 (= mapRest!6850 (store mapRest!6859 mapKey!6859 mapValue!6859))))

(declare-fun b!172550 () Bool)

(assert (=> b!172550 (= e!113895 tp_is_empty!4027)))

(declare-fun b!172551 () Bool)

(assert (=> b!172551 (= e!113896 tp_is_empty!4027)))

(assert (= (and mapNonEmpty!6850 condMapEmpty!6859) mapIsEmpty!6859))

(assert (= (and mapNonEmpty!6850 (not condMapEmpty!6859)) mapNonEmpty!6859))

(assert (= (and mapNonEmpty!6859 ((_ is ValueCellFull!1670) mapValue!6859)) b!172550))

(assert (= (and mapNonEmpty!6850 ((_ is ValueCellFull!1670) mapDefault!6859)) b!172551))

(declare-fun m!201449 () Bool)

(assert (=> mapNonEmpty!6859 m!201449))

(check-sat (not mapNonEmpty!6859) tp_is_empty!4027 (not b!172543) (not d!52585) (not b!172541) (not b_next!4255) b_and!10709 (not b!172542))
(check-sat b_and!10709 (not b_next!4255))
