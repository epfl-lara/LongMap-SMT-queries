; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16894 () Bool)

(assert start!16894)

(declare-fun b!170086 () Bool)

(declare-fun b_free!4177 () Bool)

(declare-fun b_next!4177 () Bool)

(assert (=> b!170086 (= b_free!4177 (not b_next!4177))))

(declare-fun tp!15144 () Bool)

(declare-fun b_and!10605 () Bool)

(assert (=> b!170086 (= tp!15144 b_and!10605)))

(declare-fun b!170081 () Bool)

(declare-fun e!112182 () Bool)

(declare-datatypes ((V!4913 0))(
  ( (V!4914 (val!2019 Int)) )
))
(declare-datatypes ((ValueCell!1631 0))(
  ( (ValueCellFull!1631 (v!3885 V!4913)) (EmptyCell!1631) )
))
(declare-datatypes ((array!6987 0))(
  ( (array!6988 (arr!3326 (Array (_ BitVec 32) (_ BitVec 64))) (size!3617 (_ BitVec 32))) )
))
(declare-datatypes ((array!6989 0))(
  ( (array!6990 (arr!3327 (Array (_ BitVec 32) ValueCell!1631)) (size!3618 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2170 0))(
  ( (LongMapFixedSize!2171 (defaultEntry!3527 Int) (mask!8328 (_ BitVec 32)) (extraKeys!3268 (_ BitVec 32)) (zeroValue!3370 V!4913) (minValue!3370 V!4913) (_size!1134 (_ BitVec 32)) (_keys!5355 array!6987) (_values!3510 array!6989) (_vacant!1134 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2170)

(assert (=> b!170081 (= e!112182 (and (= (size!3618 (_values!3510 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8328 thiss!1248))) (= (size!3617 (_keys!5355 thiss!1248)) (size!3618 (_values!3510 thiss!1248))) (bvslt (mask!8328 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!170082 () Bool)

(declare-fun e!112185 () Bool)

(declare-fun tp_is_empty!3949 () Bool)

(assert (=> b!170082 (= e!112185 tp_is_empty!3949)))

(declare-fun b!170083 () Bool)

(declare-fun res!80857 () Bool)

(assert (=> b!170083 (=> (not res!80857) (not e!112182))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170083 (= res!80857 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170084 () Bool)

(declare-fun e!112187 () Bool)

(declare-fun e!112184 () Bool)

(declare-fun mapRes!6699 () Bool)

(assert (=> b!170084 (= e!112187 (and e!112184 mapRes!6699))))

(declare-fun condMapEmpty!6699 () Bool)

(declare-fun mapDefault!6699 () ValueCell!1631)

(assert (=> b!170084 (= condMapEmpty!6699 (= (arr!3327 (_values!3510 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1631)) mapDefault!6699)))))

(declare-fun mapIsEmpty!6699 () Bool)

(assert (=> mapIsEmpty!6699 mapRes!6699))

(declare-fun res!80859 () Bool)

(assert (=> start!16894 (=> (not res!80859) (not e!112182))))

(declare-fun valid!945 (LongMapFixedSize!2170) Bool)

(assert (=> start!16894 (= res!80859 (valid!945 thiss!1248))))

(assert (=> start!16894 e!112182))

(declare-fun e!112183 () Bool)

(assert (=> start!16894 e!112183))

(assert (=> start!16894 true))

(declare-fun b!170085 () Bool)

(declare-fun res!80858 () Bool)

(assert (=> b!170085 (=> (not res!80858) (not e!112182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170085 (= res!80858 (validMask!0 (mask!8328 thiss!1248)))))

(declare-fun array_inv!2137 (array!6987) Bool)

(declare-fun array_inv!2138 (array!6989) Bool)

(assert (=> b!170086 (= e!112183 (and tp!15144 tp_is_empty!3949 (array_inv!2137 (_keys!5355 thiss!1248)) (array_inv!2138 (_values!3510 thiss!1248)) e!112187))))

(declare-fun b!170087 () Bool)

(assert (=> b!170087 (= e!112184 tp_is_empty!3949)))

(declare-fun mapNonEmpty!6699 () Bool)

(declare-fun tp!15143 () Bool)

(assert (=> mapNonEmpty!6699 (= mapRes!6699 (and tp!15143 e!112185))))

(declare-fun mapValue!6699 () ValueCell!1631)

(declare-fun mapRest!6699 () (Array (_ BitVec 32) ValueCell!1631))

(declare-fun mapKey!6699 () (_ BitVec 32))

(assert (=> mapNonEmpty!6699 (= (arr!3327 (_values!3510 thiss!1248)) (store mapRest!6699 mapKey!6699 mapValue!6699))))

(assert (= (and start!16894 res!80859) b!170083))

(assert (= (and b!170083 res!80857) b!170085))

(assert (= (and b!170085 res!80858) b!170081))

(assert (= (and b!170084 condMapEmpty!6699) mapIsEmpty!6699))

(assert (= (and b!170084 (not condMapEmpty!6699)) mapNonEmpty!6699))

(get-info :version)

(assert (= (and mapNonEmpty!6699 ((_ is ValueCellFull!1631) mapValue!6699)) b!170082))

(assert (= (and b!170084 ((_ is ValueCellFull!1631) mapDefault!6699)) b!170087))

(assert (= b!170086 b!170084))

(assert (= start!16894 b!170086))

(declare-fun m!198941 () Bool)

(assert (=> start!16894 m!198941))

(declare-fun m!198943 () Bool)

(assert (=> b!170085 m!198943))

(declare-fun m!198945 () Bool)

(assert (=> b!170086 m!198945))

(declare-fun m!198947 () Bool)

(assert (=> b!170086 m!198947))

(declare-fun m!198949 () Bool)

(assert (=> mapNonEmpty!6699 m!198949))

(check-sat (not b_next!4177) tp_is_empty!3949 b_and!10605 (not start!16894) (not mapNonEmpty!6699) (not b!170085) (not b!170086))
(check-sat b_and!10605 (not b_next!4177))
(get-model)

(declare-fun d!51761 () Bool)

(assert (=> d!51761 (= (array_inv!2137 (_keys!5355 thiss!1248)) (bvsge (size!3617 (_keys!5355 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170086 d!51761))

(declare-fun d!51763 () Bool)

(assert (=> d!51763 (= (array_inv!2138 (_values!3510 thiss!1248)) (bvsge (size!3618 (_values!3510 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170086 d!51763))

(declare-fun d!51765 () Bool)

(assert (=> d!51765 (= (validMask!0 (mask!8328 thiss!1248)) (and (or (= (mask!8328 thiss!1248) #b00000000000000000000000000000111) (= (mask!8328 thiss!1248) #b00000000000000000000000000001111) (= (mask!8328 thiss!1248) #b00000000000000000000000000011111) (= (mask!8328 thiss!1248) #b00000000000000000000000000111111) (= (mask!8328 thiss!1248) #b00000000000000000000000001111111) (= (mask!8328 thiss!1248) #b00000000000000000000000011111111) (= (mask!8328 thiss!1248) #b00000000000000000000000111111111) (= (mask!8328 thiss!1248) #b00000000000000000000001111111111) (= (mask!8328 thiss!1248) #b00000000000000000000011111111111) (= (mask!8328 thiss!1248) #b00000000000000000000111111111111) (= (mask!8328 thiss!1248) #b00000000000000000001111111111111) (= (mask!8328 thiss!1248) #b00000000000000000011111111111111) (= (mask!8328 thiss!1248) #b00000000000000000111111111111111) (= (mask!8328 thiss!1248) #b00000000000000001111111111111111) (= (mask!8328 thiss!1248) #b00000000000000011111111111111111) (= (mask!8328 thiss!1248) #b00000000000000111111111111111111) (= (mask!8328 thiss!1248) #b00000000000001111111111111111111) (= (mask!8328 thiss!1248) #b00000000000011111111111111111111) (= (mask!8328 thiss!1248) #b00000000000111111111111111111111) (= (mask!8328 thiss!1248) #b00000000001111111111111111111111) (= (mask!8328 thiss!1248) #b00000000011111111111111111111111) (= (mask!8328 thiss!1248) #b00000000111111111111111111111111) (= (mask!8328 thiss!1248) #b00000001111111111111111111111111) (= (mask!8328 thiss!1248) #b00000011111111111111111111111111) (= (mask!8328 thiss!1248) #b00000111111111111111111111111111) (= (mask!8328 thiss!1248) #b00001111111111111111111111111111) (= (mask!8328 thiss!1248) #b00011111111111111111111111111111) (= (mask!8328 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8328 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170085 d!51765))

(declare-fun d!51767 () Bool)

(declare-fun res!80884 () Bool)

(declare-fun e!112226 () Bool)

(assert (=> d!51767 (=> (not res!80884) (not e!112226))))

(declare-fun simpleValid!130 (LongMapFixedSize!2170) Bool)

(assert (=> d!51767 (= res!80884 (simpleValid!130 thiss!1248))))

(assert (=> d!51767 (= (valid!945 thiss!1248) e!112226)))

(declare-fun b!170136 () Bool)

(declare-fun res!80885 () Bool)

(assert (=> b!170136 (=> (not res!80885) (not e!112226))))

(declare-fun arrayCountValidKeys!0 (array!6987 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170136 (= res!80885 (= (arrayCountValidKeys!0 (_keys!5355 thiss!1248) #b00000000000000000000000000000000 (size!3617 (_keys!5355 thiss!1248))) (_size!1134 thiss!1248)))))

(declare-fun b!170137 () Bool)

(declare-fun res!80886 () Bool)

(assert (=> b!170137 (=> (not res!80886) (not e!112226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6987 (_ BitVec 32)) Bool)

(assert (=> b!170137 (= res!80886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5355 thiss!1248) (mask!8328 thiss!1248)))))

(declare-fun b!170138 () Bool)

(declare-datatypes ((List!2169 0))(
  ( (Nil!2166) (Cons!2165 (h!2782 (_ BitVec 64)) (t!6963 List!2169)) )
))
(declare-fun arrayNoDuplicates!0 (array!6987 (_ BitVec 32) List!2169) Bool)

(assert (=> b!170138 (= e!112226 (arrayNoDuplicates!0 (_keys!5355 thiss!1248) #b00000000000000000000000000000000 Nil!2166))))

(assert (= (and d!51767 res!80884) b!170136))

(assert (= (and b!170136 res!80885) b!170137))

(assert (= (and b!170137 res!80886) b!170138))

(declare-fun m!198971 () Bool)

(assert (=> d!51767 m!198971))

(declare-fun m!198973 () Bool)

(assert (=> b!170136 m!198973))

(declare-fun m!198975 () Bool)

(assert (=> b!170137 m!198975))

(declare-fun m!198977 () Bool)

(assert (=> b!170138 m!198977))

(assert (=> start!16894 d!51767))

(declare-fun b!170146 () Bool)

(declare-fun e!112231 () Bool)

(assert (=> b!170146 (= e!112231 tp_is_empty!3949)))

(declare-fun b!170145 () Bool)

(declare-fun e!112232 () Bool)

(assert (=> b!170145 (= e!112232 tp_is_empty!3949)))

(declare-fun condMapEmpty!6708 () Bool)

(declare-fun mapDefault!6708 () ValueCell!1631)

(assert (=> mapNonEmpty!6699 (= condMapEmpty!6708 (= mapRest!6699 ((as const (Array (_ BitVec 32) ValueCell!1631)) mapDefault!6708)))))

(declare-fun mapRes!6708 () Bool)

(assert (=> mapNonEmpty!6699 (= tp!15143 (and e!112231 mapRes!6708))))

(declare-fun mapIsEmpty!6708 () Bool)

(assert (=> mapIsEmpty!6708 mapRes!6708))

(declare-fun mapNonEmpty!6708 () Bool)

(declare-fun tp!15159 () Bool)

(assert (=> mapNonEmpty!6708 (= mapRes!6708 (and tp!15159 e!112232))))

(declare-fun mapValue!6708 () ValueCell!1631)

(declare-fun mapRest!6708 () (Array (_ BitVec 32) ValueCell!1631))

(declare-fun mapKey!6708 () (_ BitVec 32))

(assert (=> mapNonEmpty!6708 (= mapRest!6699 (store mapRest!6708 mapKey!6708 mapValue!6708))))

(assert (= (and mapNonEmpty!6699 condMapEmpty!6708) mapIsEmpty!6708))

(assert (= (and mapNonEmpty!6699 (not condMapEmpty!6708)) mapNonEmpty!6708))

(assert (= (and mapNonEmpty!6708 ((_ is ValueCellFull!1631) mapValue!6708)) b!170145))

(assert (= (and mapNonEmpty!6699 ((_ is ValueCellFull!1631) mapDefault!6708)) b!170146))

(declare-fun m!198979 () Bool)

(assert (=> mapNonEmpty!6708 m!198979))

(check-sat (not b!170136) (not b_next!4177) (not b!170138) b_and!10605 tp_is_empty!3949 (not b!170137) (not mapNonEmpty!6708) (not d!51767))
(check-sat b_and!10605 (not b_next!4177))
