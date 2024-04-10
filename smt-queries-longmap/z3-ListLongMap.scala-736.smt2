; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17170 () Bool)

(assert start!17170)

(declare-fun b!172462 () Bool)

(declare-fun b_free!4257 () Bool)

(declare-fun b_next!4257 () Bool)

(assert (=> b!172462 (= b_free!4257 (not b_next!4257))))

(declare-fun tp!15417 () Bool)

(declare-fun b_and!10697 () Bool)

(assert (=> b!172462 (= tp!15417 b_and!10697)))

(declare-fun b!172460 () Bool)

(declare-fun e!113840 () Bool)

(declare-datatypes ((V!5019 0))(
  ( (V!5020 (val!2059 Int)) )
))
(declare-datatypes ((ValueCell!1671 0))(
  ( (ValueCellFull!1671 (v!3927 V!5019)) (EmptyCell!1671) )
))
(declare-datatypes ((array!7179 0))(
  ( (array!7180 (arr!3413 (Array (_ BitVec 32) (_ BitVec 64))) (size!3710 (_ BitVec 32))) )
))
(declare-datatypes ((array!7181 0))(
  ( (array!7182 (arr!3414 (Array (_ BitVec 32) ValueCell!1671)) (size!3711 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2250 0))(
  ( (LongMapFixedSize!2251 (defaultEntry!3571 Int) (mask!8416 (_ BitVec 32)) (extraKeys!3310 (_ BitVec 32)) (zeroValue!3412 V!5019) (minValue!3414 V!5019) (_size!1174 (_ BitVec 32)) (_keys!5408 array!7179) (_values!3554 array!7181) (_vacant!1174 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2250)

(assert (=> b!172460 (= e!113840 (and (= (size!3711 (_values!3554 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8416 thiss!1248))) (= (size!3710 (_keys!5408 thiss!1248)) (size!3711 (_values!3554 thiss!1248))) (bvslt (mask!8416 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6853 () Bool)

(declare-fun mapRes!6853 () Bool)

(declare-fun tp!15418 () Bool)

(declare-fun e!113845 () Bool)

(assert (=> mapNonEmpty!6853 (= mapRes!6853 (and tp!15418 e!113845))))

(declare-fun mapValue!6853 () ValueCell!1671)

(declare-fun mapKey!6853 () (_ BitVec 32))

(declare-fun mapRest!6853 () (Array (_ BitVec 32) ValueCell!1671))

(assert (=> mapNonEmpty!6853 (= (arr!3414 (_values!3554 thiss!1248)) (store mapRest!6853 mapKey!6853 mapValue!6853))))

(declare-fun b!172461 () Bool)

(declare-fun res!81890 () Bool)

(assert (=> b!172461 (=> (not res!81890) (not e!113840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172461 (= res!81890 (validMask!0 (mask!8416 thiss!1248)))))

(declare-fun tp_is_empty!4029 () Bool)

(declare-fun e!113842 () Bool)

(declare-fun e!113841 () Bool)

(declare-fun array_inv!2185 (array!7179) Bool)

(declare-fun array_inv!2186 (array!7181) Bool)

(assert (=> b!172462 (= e!113841 (and tp!15417 tp_is_empty!4029 (array_inv!2185 (_keys!5408 thiss!1248)) (array_inv!2186 (_values!3554 thiss!1248)) e!113842))))

(declare-fun b!172463 () Bool)

(declare-fun e!113844 () Bool)

(assert (=> b!172463 (= e!113842 (and e!113844 mapRes!6853))))

(declare-fun condMapEmpty!6853 () Bool)

(declare-fun mapDefault!6853 () ValueCell!1671)

(assert (=> b!172463 (= condMapEmpty!6853 (= (arr!3414 (_values!3554 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1671)) mapDefault!6853)))))

(declare-fun b!172464 () Bool)

(assert (=> b!172464 (= e!113844 tp_is_empty!4029)))

(declare-fun mapIsEmpty!6853 () Bool)

(assert (=> mapIsEmpty!6853 mapRes!6853))

(declare-fun res!81891 () Bool)

(assert (=> start!17170 (=> (not res!81891) (not e!113840))))

(declare-fun valid!955 (LongMapFixedSize!2250) Bool)

(assert (=> start!17170 (= res!81891 (valid!955 thiss!1248))))

(assert (=> start!17170 e!113840))

(assert (=> start!17170 e!113841))

(assert (=> start!17170 true))

(declare-fun b!172465 () Bool)

(declare-fun res!81889 () Bool)

(assert (=> b!172465 (=> (not res!81889) (not e!113840))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172465 (= res!81889 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172466 () Bool)

(assert (=> b!172466 (= e!113845 tp_is_empty!4029)))

(assert (= (and start!17170 res!81891) b!172465))

(assert (= (and b!172465 res!81889) b!172461))

(assert (= (and b!172461 res!81890) b!172460))

(assert (= (and b!172463 condMapEmpty!6853) mapIsEmpty!6853))

(assert (= (and b!172463 (not condMapEmpty!6853)) mapNonEmpty!6853))

(get-info :version)

(assert (= (and mapNonEmpty!6853 ((_ is ValueCellFull!1671) mapValue!6853)) b!172466))

(assert (= (and b!172463 ((_ is ValueCellFull!1671) mapDefault!6853)) b!172464))

(assert (= b!172462 b!172463))

(assert (= start!17170 b!172462))

(declare-fun m!201239 () Bool)

(assert (=> mapNonEmpty!6853 m!201239))

(declare-fun m!201241 () Bool)

(assert (=> b!172461 m!201241))

(declare-fun m!201243 () Bool)

(assert (=> b!172462 m!201243))

(declare-fun m!201245 () Bool)

(assert (=> b!172462 m!201245))

(declare-fun m!201247 () Bool)

(assert (=> start!17170 m!201247))

(check-sat (not b_next!4257) (not mapNonEmpty!6853) (not b!172461) (not b!172462) tp_is_empty!4029 b_and!10697 (not start!17170))
(check-sat b_and!10697 (not b_next!4257))
(get-model)

(declare-fun d!52509 () Bool)

(assert (=> d!52509 (= (array_inv!2185 (_keys!5408 thiss!1248)) (bvsge (size!3710 (_keys!5408 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172462 d!52509))

(declare-fun d!52511 () Bool)

(assert (=> d!52511 (= (array_inv!2186 (_values!3554 thiss!1248)) (bvsge (size!3711 (_values!3554 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172462 d!52511))

(declare-fun d!52513 () Bool)

(assert (=> d!52513 (= (validMask!0 (mask!8416 thiss!1248)) (and (or (= (mask!8416 thiss!1248) #b00000000000000000000000000000111) (= (mask!8416 thiss!1248) #b00000000000000000000000000001111) (= (mask!8416 thiss!1248) #b00000000000000000000000000011111) (= (mask!8416 thiss!1248) #b00000000000000000000000000111111) (= (mask!8416 thiss!1248) #b00000000000000000000000001111111) (= (mask!8416 thiss!1248) #b00000000000000000000000011111111) (= (mask!8416 thiss!1248) #b00000000000000000000000111111111) (= (mask!8416 thiss!1248) #b00000000000000000000001111111111) (= (mask!8416 thiss!1248) #b00000000000000000000011111111111) (= (mask!8416 thiss!1248) #b00000000000000000000111111111111) (= (mask!8416 thiss!1248) #b00000000000000000001111111111111) (= (mask!8416 thiss!1248) #b00000000000000000011111111111111) (= (mask!8416 thiss!1248) #b00000000000000000111111111111111) (= (mask!8416 thiss!1248) #b00000000000000001111111111111111) (= (mask!8416 thiss!1248) #b00000000000000011111111111111111) (= (mask!8416 thiss!1248) #b00000000000000111111111111111111) (= (mask!8416 thiss!1248) #b00000000000001111111111111111111) (= (mask!8416 thiss!1248) #b00000000000011111111111111111111) (= (mask!8416 thiss!1248) #b00000000000111111111111111111111) (= (mask!8416 thiss!1248) #b00000000001111111111111111111111) (= (mask!8416 thiss!1248) #b00000000011111111111111111111111) (= (mask!8416 thiss!1248) #b00000000111111111111111111111111) (= (mask!8416 thiss!1248) #b00000001111111111111111111111111) (= (mask!8416 thiss!1248) #b00000011111111111111111111111111) (= (mask!8416 thiss!1248) #b00000111111111111111111111111111) (= (mask!8416 thiss!1248) #b00001111111111111111111111111111) (= (mask!8416 thiss!1248) #b00011111111111111111111111111111) (= (mask!8416 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8416 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172461 d!52513))

(declare-fun d!52515 () Bool)

(declare-fun res!81907 () Bool)

(declare-fun e!113866 () Bool)

(assert (=> d!52515 (=> (not res!81907) (not e!113866))))

(declare-fun simpleValid!139 (LongMapFixedSize!2250) Bool)

(assert (=> d!52515 (= res!81907 (simpleValid!139 thiss!1248))))

(assert (=> d!52515 (= (valid!955 thiss!1248) e!113866)))

(declare-fun b!172494 () Bool)

(declare-fun res!81908 () Bool)

(assert (=> b!172494 (=> (not res!81908) (not e!113866))))

(declare-fun arrayCountValidKeys!0 (array!7179 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172494 (= res!81908 (= (arrayCountValidKeys!0 (_keys!5408 thiss!1248) #b00000000000000000000000000000000 (size!3710 (_keys!5408 thiss!1248))) (_size!1174 thiss!1248)))))

(declare-fun b!172495 () Bool)

(declare-fun res!81909 () Bool)

(assert (=> b!172495 (=> (not res!81909) (not e!113866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7179 (_ BitVec 32)) Bool)

(assert (=> b!172495 (= res!81909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5408 thiss!1248) (mask!8416 thiss!1248)))))

(declare-fun b!172496 () Bool)

(declare-datatypes ((List!2199 0))(
  ( (Nil!2196) (Cons!2195 (h!2812 (_ BitVec 64)) (t!7006 List!2199)) )
))
(declare-fun arrayNoDuplicates!0 (array!7179 (_ BitVec 32) List!2199) Bool)

(assert (=> b!172496 (= e!113866 (arrayNoDuplicates!0 (_keys!5408 thiss!1248) #b00000000000000000000000000000000 Nil!2196))))

(assert (= (and d!52515 res!81907) b!172494))

(assert (= (and b!172494 res!81908) b!172495))

(assert (= (and b!172495 res!81909) b!172496))

(declare-fun m!201259 () Bool)

(assert (=> d!52515 m!201259))

(declare-fun m!201261 () Bool)

(assert (=> b!172494 m!201261))

(declare-fun m!201263 () Bool)

(assert (=> b!172495 m!201263))

(declare-fun m!201265 () Bool)

(assert (=> b!172496 m!201265))

(assert (=> start!17170 d!52515))

(declare-fun condMapEmpty!6859 () Bool)

(declare-fun mapDefault!6859 () ValueCell!1671)

(assert (=> mapNonEmpty!6853 (= condMapEmpty!6859 (= mapRest!6853 ((as const (Array (_ BitVec 32) ValueCell!1671)) mapDefault!6859)))))

(declare-fun e!113872 () Bool)

(declare-fun mapRes!6859 () Bool)

(assert (=> mapNonEmpty!6853 (= tp!15418 (and e!113872 mapRes!6859))))

(declare-fun mapIsEmpty!6859 () Bool)

(assert (=> mapIsEmpty!6859 mapRes!6859))

(declare-fun mapNonEmpty!6859 () Bool)

(declare-fun tp!15427 () Bool)

(declare-fun e!113871 () Bool)

(assert (=> mapNonEmpty!6859 (= mapRes!6859 (and tp!15427 e!113871))))

(declare-fun mapKey!6859 () (_ BitVec 32))

(declare-fun mapRest!6859 () (Array (_ BitVec 32) ValueCell!1671))

(declare-fun mapValue!6859 () ValueCell!1671)

(assert (=> mapNonEmpty!6859 (= mapRest!6853 (store mapRest!6859 mapKey!6859 mapValue!6859))))

(declare-fun b!172504 () Bool)

(assert (=> b!172504 (= e!113872 tp_is_empty!4029)))

(declare-fun b!172503 () Bool)

(assert (=> b!172503 (= e!113871 tp_is_empty!4029)))

(assert (= (and mapNonEmpty!6853 condMapEmpty!6859) mapIsEmpty!6859))

(assert (= (and mapNonEmpty!6853 (not condMapEmpty!6859)) mapNonEmpty!6859))

(assert (= (and mapNonEmpty!6859 ((_ is ValueCellFull!1671) mapValue!6859)) b!172503))

(assert (= (and mapNonEmpty!6853 ((_ is ValueCellFull!1671) mapDefault!6859)) b!172504))

(declare-fun m!201267 () Bool)

(assert (=> mapNonEmpty!6859 m!201267))

(check-sat (not mapNonEmpty!6859) tp_is_empty!4029 (not d!52515) (not b!172495) (not b_next!4257) (not b!172496) (not b!172494) b_and!10697)
(check-sat b_and!10697 (not b_next!4257))
