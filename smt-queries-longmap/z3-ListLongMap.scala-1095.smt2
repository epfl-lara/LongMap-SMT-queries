; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22484 () Bool)

(assert start!22484)

(declare-fun b!234907 () Bool)

(declare-fun b_free!6319 () Bool)

(declare-fun b_next!6319 () Bool)

(assert (=> b!234907 (= b_free!6319 (not b_next!6319))))

(declare-fun tp!22120 () Bool)

(declare-fun b_and!13219 () Bool)

(assert (=> b!234907 (= tp!22120 b_and!13219)))

(declare-fun b!234899 () Bool)

(declare-fun res!115165 () Bool)

(declare-fun e!152556 () Bool)

(assert (=> b!234899 (=> (not res!115165) (not e!152556))))

(declare-datatypes ((V!7889 0))(
  ( (V!7890 (val!3135 Int)) )
))
(declare-datatypes ((ValueCell!2747 0))(
  ( (ValueCellFull!2747 (v!5155 V!7889)) (EmptyCell!2747) )
))
(declare-datatypes ((array!11609 0))(
  ( (array!11610 (arr!5517 (Array (_ BitVec 32) ValueCell!2747)) (size!5855 (_ BitVec 32))) )
))
(declare-datatypes ((array!11611 0))(
  ( (array!11612 (arr!5518 (Array (_ BitVec 32) (_ BitVec 64))) (size!5856 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3394 0))(
  ( (LongMapFixedSize!3395 (defaultEntry!4366 Int) (mask!10327 (_ BitVec 32)) (extraKeys!4103 (_ BitVec 32)) (zeroValue!4207 V!7889) (minValue!4207 V!7889) (_size!1746 (_ BitVec 32)) (_keys!6437 array!11611) (_values!4349 array!11609) (_vacant!1746 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3394)

(assert (=> b!234899 (= res!115165 (and (= (size!5855 (_values!4349 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10327 thiss!1504))) (= (size!5856 (_keys!6437 thiss!1504)) (size!5855 (_values!4349 thiss!1504))) (bvsge (mask!10327 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4103 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4103 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!234900 () Bool)

(declare-fun e!152552 () Bool)

(assert (=> b!234900 (= e!152552 e!152556)))

(declare-fun res!115167 () Bool)

(assert (=> b!234900 (=> (not res!115167) (not e!152556))))

(declare-datatypes ((SeekEntryResult!988 0))(
  ( (MissingZero!988 (index!6122 (_ BitVec 32))) (Found!988 (index!6123 (_ BitVec 32))) (Intermediate!988 (undefined!1800 Bool) (index!6124 (_ BitVec 32)) (x!23755 (_ BitVec 32))) (Undefined!988) (MissingVacant!988 (index!6125 (_ BitVec 32))) )
))
(declare-fun lt!118743 () SeekEntryResult!988)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!234900 (= res!115167 (or (= lt!118743 (MissingZero!988 index!297)) (= lt!118743 (MissingVacant!988 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11611 (_ BitVec 32)) SeekEntryResult!988)

(assert (=> b!234900 (= lt!118743 (seekEntryOrOpen!0 key!932 (_keys!6437 thiss!1504) (mask!10327 thiss!1504)))))

(declare-fun b!234901 () Bool)

(declare-fun e!152558 () Bool)

(declare-fun tp_is_empty!6181 () Bool)

(assert (=> b!234901 (= e!152558 tp_is_empty!6181)))

(declare-fun b!234902 () Bool)

(declare-fun res!115168 () Bool)

(assert (=> b!234902 (=> (not res!115168) (not e!152556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234902 (= res!115168 (validMask!0 (mask!10327 thiss!1504)))))

(declare-fun mapIsEmpty!10463 () Bool)

(declare-fun mapRes!10463 () Bool)

(assert (=> mapIsEmpty!10463 mapRes!10463))

(declare-fun b!234903 () Bool)

(declare-fun res!115164 () Bool)

(assert (=> b!234903 (=> (not res!115164) (not e!152552))))

(assert (=> b!234903 (= res!115164 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!115166 () Bool)

(assert (=> start!22484 (=> (not res!115166) (not e!152552))))

(declare-fun valid!1354 (LongMapFixedSize!3394) Bool)

(assert (=> start!22484 (= res!115166 (valid!1354 thiss!1504))))

(assert (=> start!22484 e!152552))

(declare-fun e!152557 () Bool)

(assert (=> start!22484 e!152557))

(assert (=> start!22484 true))

(declare-fun b!234904 () Bool)

(declare-fun e!152555 () Bool)

(assert (=> b!234904 (= e!152555 tp_is_empty!6181)))

(declare-fun b!234905 () Bool)

(declare-fun res!115163 () Bool)

(assert (=> b!234905 (=> (not res!115163) (not e!152556))))

(declare-datatypes ((tuple2!4598 0))(
  ( (tuple2!4599 (_1!2310 (_ BitVec 64)) (_2!2310 V!7889)) )
))
(declare-datatypes ((List!3526 0))(
  ( (Nil!3523) (Cons!3522 (h!4174 tuple2!4598) (t!8488 List!3526)) )
))
(declare-datatypes ((ListLongMap!3501 0))(
  ( (ListLongMap!3502 (toList!1766 List!3526)) )
))
(declare-fun contains!1645 (ListLongMap!3501 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1275 (array!11611 array!11609 (_ BitVec 32) (_ BitVec 32) V!7889 V!7889 (_ BitVec 32) Int) ListLongMap!3501)

(assert (=> b!234905 (= res!115163 (contains!1645 (getCurrentListMap!1275 (_keys!6437 thiss!1504) (_values!4349 thiss!1504) (mask!10327 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)) key!932))))

(declare-fun b!234906 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11611 (_ BitVec 32)) Bool)

(assert (=> b!234906 (= e!152556 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6437 thiss!1504) (mask!10327 thiss!1504))))))

(declare-fun e!152554 () Bool)

(declare-fun array_inv!3643 (array!11611) Bool)

(declare-fun array_inv!3644 (array!11609) Bool)

(assert (=> b!234907 (= e!152557 (and tp!22120 tp_is_empty!6181 (array_inv!3643 (_keys!6437 thiss!1504)) (array_inv!3644 (_values!4349 thiss!1504)) e!152554))))

(declare-fun mapNonEmpty!10463 () Bool)

(declare-fun tp!22121 () Bool)

(assert (=> mapNonEmpty!10463 (= mapRes!10463 (and tp!22121 e!152555))))

(declare-fun mapValue!10463 () ValueCell!2747)

(declare-fun mapKey!10463 () (_ BitVec 32))

(declare-fun mapRest!10463 () (Array (_ BitVec 32) ValueCell!2747))

(assert (=> mapNonEmpty!10463 (= (arr!5517 (_values!4349 thiss!1504)) (store mapRest!10463 mapKey!10463 mapValue!10463))))

(declare-fun b!234908 () Bool)

(assert (=> b!234908 (= e!152554 (and e!152558 mapRes!10463))))

(declare-fun condMapEmpty!10463 () Bool)

(declare-fun mapDefault!10463 () ValueCell!2747)

(assert (=> b!234908 (= condMapEmpty!10463 (= (arr!5517 (_values!4349 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2747)) mapDefault!10463)))))

(assert (= (and start!22484 res!115166) b!234903))

(assert (= (and b!234903 res!115164) b!234900))

(assert (= (and b!234900 res!115167) b!234905))

(assert (= (and b!234905 res!115163) b!234902))

(assert (= (and b!234902 res!115168) b!234899))

(assert (= (and b!234899 res!115165) b!234906))

(assert (= (and b!234908 condMapEmpty!10463) mapIsEmpty!10463))

(assert (= (and b!234908 (not condMapEmpty!10463)) mapNonEmpty!10463))

(get-info :version)

(assert (= (and mapNonEmpty!10463 ((_ is ValueCellFull!2747) mapValue!10463)) b!234904))

(assert (= (and b!234908 ((_ is ValueCellFull!2747) mapDefault!10463)) b!234901))

(assert (= b!234907 b!234908))

(assert (= start!22484 b!234907))

(declare-fun m!255669 () Bool)

(assert (=> b!234906 m!255669))

(declare-fun m!255671 () Bool)

(assert (=> b!234900 m!255671))

(declare-fun m!255673 () Bool)

(assert (=> start!22484 m!255673))

(declare-fun m!255675 () Bool)

(assert (=> mapNonEmpty!10463 m!255675))

(declare-fun m!255677 () Bool)

(assert (=> b!234907 m!255677))

(declare-fun m!255679 () Bool)

(assert (=> b!234907 m!255679))

(declare-fun m!255681 () Bool)

(assert (=> b!234905 m!255681))

(assert (=> b!234905 m!255681))

(declare-fun m!255683 () Bool)

(assert (=> b!234905 m!255683))

(declare-fun m!255685 () Bool)

(assert (=> b!234902 m!255685))

(check-sat (not b!234907) tp_is_empty!6181 (not b_next!6319) (not b!234905) (not mapNonEmpty!10463) (not b!234902) b_and!13219 (not b!234906) (not start!22484) (not b!234900))
(check-sat b_and!13219 (not b_next!6319))
(get-model)

(declare-fun d!59107 () Bool)

(assert (=> d!59107 (= (array_inv!3643 (_keys!6437 thiss!1504)) (bvsge (size!5856 (_keys!6437 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234907 d!59107))

(declare-fun d!59109 () Bool)

(assert (=> d!59109 (= (array_inv!3644 (_values!4349 thiss!1504)) (bvsge (size!5855 (_values!4349 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234907 d!59109))

(declare-fun d!59111 () Bool)

(assert (=> d!59111 (= (validMask!0 (mask!10327 thiss!1504)) (and (or (= (mask!10327 thiss!1504) #b00000000000000000000000000000111) (= (mask!10327 thiss!1504) #b00000000000000000000000000001111) (= (mask!10327 thiss!1504) #b00000000000000000000000000011111) (= (mask!10327 thiss!1504) #b00000000000000000000000000111111) (= (mask!10327 thiss!1504) #b00000000000000000000000001111111) (= (mask!10327 thiss!1504) #b00000000000000000000000011111111) (= (mask!10327 thiss!1504) #b00000000000000000000000111111111) (= (mask!10327 thiss!1504) #b00000000000000000000001111111111) (= (mask!10327 thiss!1504) #b00000000000000000000011111111111) (= (mask!10327 thiss!1504) #b00000000000000000000111111111111) (= (mask!10327 thiss!1504) #b00000000000000000001111111111111) (= (mask!10327 thiss!1504) #b00000000000000000011111111111111) (= (mask!10327 thiss!1504) #b00000000000000000111111111111111) (= (mask!10327 thiss!1504) #b00000000000000001111111111111111) (= (mask!10327 thiss!1504) #b00000000000000011111111111111111) (= (mask!10327 thiss!1504) #b00000000000000111111111111111111) (= (mask!10327 thiss!1504) #b00000000000001111111111111111111) (= (mask!10327 thiss!1504) #b00000000000011111111111111111111) (= (mask!10327 thiss!1504) #b00000000000111111111111111111111) (= (mask!10327 thiss!1504) #b00000000001111111111111111111111) (= (mask!10327 thiss!1504) #b00000000011111111111111111111111) (= (mask!10327 thiss!1504) #b00000000111111111111111111111111) (= (mask!10327 thiss!1504) #b00000001111111111111111111111111) (= (mask!10327 thiss!1504) #b00000011111111111111111111111111) (= (mask!10327 thiss!1504) #b00000111111111111111111111111111) (= (mask!10327 thiss!1504) #b00001111111111111111111111111111) (= (mask!10327 thiss!1504) #b00011111111111111111111111111111) (= (mask!10327 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10327 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!234902 d!59111))

(declare-fun d!59113 () Bool)

(declare-fun res!115211 () Bool)

(declare-fun e!152603 () Bool)

(assert (=> d!59113 (=> (not res!115211) (not e!152603))))

(declare-fun simpleValid!232 (LongMapFixedSize!3394) Bool)

(assert (=> d!59113 (= res!115211 (simpleValid!232 thiss!1504))))

(assert (=> d!59113 (= (valid!1354 thiss!1504) e!152603)))

(declare-fun b!234975 () Bool)

(declare-fun res!115212 () Bool)

(assert (=> b!234975 (=> (not res!115212) (not e!152603))))

(declare-fun arrayCountValidKeys!0 (array!11611 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234975 (= res!115212 (= (arrayCountValidKeys!0 (_keys!6437 thiss!1504) #b00000000000000000000000000000000 (size!5856 (_keys!6437 thiss!1504))) (_size!1746 thiss!1504)))))

(declare-fun b!234976 () Bool)

(declare-fun res!115213 () Bool)

(assert (=> b!234976 (=> (not res!115213) (not e!152603))))

(assert (=> b!234976 (= res!115213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6437 thiss!1504) (mask!10327 thiss!1504)))))

(declare-fun b!234977 () Bool)

(declare-datatypes ((List!3528 0))(
  ( (Nil!3525) (Cons!3524 (h!4176 (_ BitVec 64)) (t!8492 List!3528)) )
))
(declare-fun arrayNoDuplicates!0 (array!11611 (_ BitVec 32) List!3528) Bool)

(assert (=> b!234977 (= e!152603 (arrayNoDuplicates!0 (_keys!6437 thiss!1504) #b00000000000000000000000000000000 Nil!3525))))

(assert (= (and d!59113 res!115211) b!234975))

(assert (= (and b!234975 res!115212) b!234976))

(assert (= (and b!234976 res!115213) b!234977))

(declare-fun m!255723 () Bool)

(assert (=> d!59113 m!255723))

(declare-fun m!255725 () Bool)

(assert (=> b!234975 m!255725))

(assert (=> b!234976 m!255669))

(declare-fun m!255727 () Bool)

(assert (=> b!234977 m!255727))

(assert (=> start!22484 d!59113))

(declare-fun b!234986 () Bool)

(declare-fun e!152610 () Bool)

(declare-fun call!21831 () Bool)

(assert (=> b!234986 (= e!152610 call!21831)))

(declare-fun d!59115 () Bool)

(declare-fun res!115219 () Bool)

(declare-fun e!152611 () Bool)

(assert (=> d!59115 (=> res!115219 e!152611)))

(assert (=> d!59115 (= res!115219 (bvsge #b00000000000000000000000000000000 (size!5856 (_keys!6437 thiss!1504))))))

(assert (=> d!59115 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6437 thiss!1504) (mask!10327 thiss!1504)) e!152611)))

(declare-fun b!234987 () Bool)

(assert (=> b!234987 (= e!152611 e!152610)))

(declare-fun c!39152 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!234987 (= c!39152 (validKeyInArray!0 (select (arr!5518 (_keys!6437 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234988 () Bool)

(declare-fun e!152612 () Bool)

(assert (=> b!234988 (= e!152610 e!152612)))

(declare-fun lt!118756 () (_ BitVec 64))

(assert (=> b!234988 (= lt!118756 (select (arr!5518 (_keys!6437 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!7246 0))(
  ( (Unit!7247) )
))
(declare-fun lt!118758 () Unit!7246)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11611 (_ BitVec 64) (_ BitVec 32)) Unit!7246)

(assert (=> b!234988 (= lt!118758 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6437 thiss!1504) lt!118756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!234988 (arrayContainsKey!0 (_keys!6437 thiss!1504) lt!118756 #b00000000000000000000000000000000)))

(declare-fun lt!118757 () Unit!7246)

(assert (=> b!234988 (= lt!118757 lt!118758)))

(declare-fun res!115218 () Bool)

(assert (=> b!234988 (= res!115218 (= (seekEntryOrOpen!0 (select (arr!5518 (_keys!6437 thiss!1504)) #b00000000000000000000000000000000) (_keys!6437 thiss!1504) (mask!10327 thiss!1504)) (Found!988 #b00000000000000000000000000000000)))))

(assert (=> b!234988 (=> (not res!115218) (not e!152612))))

(declare-fun bm!21828 () Bool)

(assert (=> bm!21828 (= call!21831 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6437 thiss!1504) (mask!10327 thiss!1504)))))

(declare-fun b!234989 () Bool)

(assert (=> b!234989 (= e!152612 call!21831)))

(assert (= (and d!59115 (not res!115219)) b!234987))

(assert (= (and b!234987 c!39152) b!234988))

(assert (= (and b!234987 (not c!39152)) b!234986))

(assert (= (and b!234988 res!115218) b!234989))

(assert (= (or b!234989 b!234986) bm!21828))

(declare-fun m!255729 () Bool)

(assert (=> b!234987 m!255729))

(assert (=> b!234987 m!255729))

(declare-fun m!255731 () Bool)

(assert (=> b!234987 m!255731))

(assert (=> b!234988 m!255729))

(declare-fun m!255733 () Bool)

(assert (=> b!234988 m!255733))

(declare-fun m!255735 () Bool)

(assert (=> b!234988 m!255735))

(assert (=> b!234988 m!255729))

(declare-fun m!255737 () Bool)

(assert (=> b!234988 m!255737))

(declare-fun m!255739 () Bool)

(assert (=> bm!21828 m!255739))

(assert (=> b!234906 d!59115))

(declare-fun d!59117 () Bool)

(declare-fun e!152618 () Bool)

(assert (=> d!59117 e!152618))

(declare-fun res!115222 () Bool)

(assert (=> d!59117 (=> res!115222 e!152618)))

(declare-fun lt!118768 () Bool)

(assert (=> d!59117 (= res!115222 (not lt!118768))))

(declare-fun lt!118767 () Bool)

(assert (=> d!59117 (= lt!118768 lt!118767)))

(declare-fun lt!118770 () Unit!7246)

(declare-fun e!152617 () Unit!7246)

(assert (=> d!59117 (= lt!118770 e!152617)))

(declare-fun c!39155 () Bool)

(assert (=> d!59117 (= c!39155 lt!118767)))

(declare-fun containsKey!257 (List!3526 (_ BitVec 64)) Bool)

(assert (=> d!59117 (= lt!118767 (containsKey!257 (toList!1766 (getCurrentListMap!1275 (_keys!6437 thiss!1504) (_values!4349 thiss!1504) (mask!10327 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504))) key!932))))

(assert (=> d!59117 (= (contains!1645 (getCurrentListMap!1275 (_keys!6437 thiss!1504) (_values!4349 thiss!1504) (mask!10327 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)) key!932) lt!118768)))

(declare-fun b!234996 () Bool)

(declare-fun lt!118769 () Unit!7246)

(assert (=> b!234996 (= e!152617 lt!118769)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!206 (List!3526 (_ BitVec 64)) Unit!7246)

(assert (=> b!234996 (= lt!118769 (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1766 (getCurrentListMap!1275 (_keys!6437 thiss!1504) (_values!4349 thiss!1504) (mask!10327 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504))) key!932))))

(declare-datatypes ((Option!271 0))(
  ( (Some!270 (v!5158 V!7889)) (None!269) )
))
(declare-fun isDefined!207 (Option!271) Bool)

(declare-fun getValueByKey!265 (List!3526 (_ BitVec 64)) Option!271)

(assert (=> b!234996 (isDefined!207 (getValueByKey!265 (toList!1766 (getCurrentListMap!1275 (_keys!6437 thiss!1504) (_values!4349 thiss!1504) (mask!10327 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504))) key!932))))

(declare-fun b!234997 () Bool)

(declare-fun Unit!7248 () Unit!7246)

(assert (=> b!234997 (= e!152617 Unit!7248)))

(declare-fun b!234998 () Bool)

(assert (=> b!234998 (= e!152618 (isDefined!207 (getValueByKey!265 (toList!1766 (getCurrentListMap!1275 (_keys!6437 thiss!1504) (_values!4349 thiss!1504) (mask!10327 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504))) key!932)))))

(assert (= (and d!59117 c!39155) b!234996))

(assert (= (and d!59117 (not c!39155)) b!234997))

(assert (= (and d!59117 (not res!115222)) b!234998))

(declare-fun m!255741 () Bool)

(assert (=> d!59117 m!255741))

(declare-fun m!255743 () Bool)

(assert (=> b!234996 m!255743))

(declare-fun m!255745 () Bool)

(assert (=> b!234996 m!255745))

(assert (=> b!234996 m!255745))

(declare-fun m!255747 () Bool)

(assert (=> b!234996 m!255747))

(assert (=> b!234998 m!255745))

(assert (=> b!234998 m!255745))

(assert (=> b!234998 m!255747))

(assert (=> b!234905 d!59117))

(declare-fun bm!21843 () Bool)

(declare-fun call!21850 () ListLongMap!3501)

(declare-fun call!21847 () ListLongMap!3501)

(assert (=> bm!21843 (= call!21850 call!21847)))

(declare-fun b!235041 () Bool)

(declare-fun e!152654 () Bool)

(declare-fun e!152655 () Bool)

(assert (=> b!235041 (= e!152654 e!152655)))

(declare-fun res!115247 () Bool)

(declare-fun call!21852 () Bool)

(assert (=> b!235041 (= res!115247 call!21852)))

(assert (=> b!235041 (=> (not res!115247) (not e!152655))))

(declare-fun b!235042 () Bool)

(declare-fun e!152657 () Unit!7246)

(declare-fun lt!118826 () Unit!7246)

(assert (=> b!235042 (= e!152657 lt!118826)))

(declare-fun lt!118830 () ListLongMap!3501)

(declare-fun getCurrentListMapNoExtraKeys!525 (array!11611 array!11609 (_ BitVec 32) (_ BitVec 32) V!7889 V!7889 (_ BitVec 32) Int) ListLongMap!3501)

(assert (=> b!235042 (= lt!118830 (getCurrentListMapNoExtraKeys!525 (_keys!6437 thiss!1504) (_values!4349 thiss!1504) (mask!10327 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)))))

(declare-fun lt!118832 () (_ BitVec 64))

(assert (=> b!235042 (= lt!118832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118825 () (_ BitVec 64))

(assert (=> b!235042 (= lt!118825 (select (arr!5518 (_keys!6437 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118836 () Unit!7246)

(declare-fun addStillContains!185 (ListLongMap!3501 (_ BitVec 64) V!7889 (_ BitVec 64)) Unit!7246)

(assert (=> b!235042 (= lt!118836 (addStillContains!185 lt!118830 lt!118832 (zeroValue!4207 thiss!1504) lt!118825))))

(declare-fun +!642 (ListLongMap!3501 tuple2!4598) ListLongMap!3501)

(assert (=> b!235042 (contains!1645 (+!642 lt!118830 (tuple2!4599 lt!118832 (zeroValue!4207 thiss!1504))) lt!118825)))

(declare-fun lt!118834 () Unit!7246)

(assert (=> b!235042 (= lt!118834 lt!118836)))

(declare-fun lt!118828 () ListLongMap!3501)

(assert (=> b!235042 (= lt!118828 (getCurrentListMapNoExtraKeys!525 (_keys!6437 thiss!1504) (_values!4349 thiss!1504) (mask!10327 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)))))

(declare-fun lt!118816 () (_ BitVec 64))

(assert (=> b!235042 (= lt!118816 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118820 () (_ BitVec 64))

(assert (=> b!235042 (= lt!118820 (select (arr!5518 (_keys!6437 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118829 () Unit!7246)

(declare-fun addApplyDifferent!185 (ListLongMap!3501 (_ BitVec 64) V!7889 (_ BitVec 64)) Unit!7246)

(assert (=> b!235042 (= lt!118829 (addApplyDifferent!185 lt!118828 lt!118816 (minValue!4207 thiss!1504) lt!118820))))

(declare-fun apply!209 (ListLongMap!3501 (_ BitVec 64)) V!7889)

(assert (=> b!235042 (= (apply!209 (+!642 lt!118828 (tuple2!4599 lt!118816 (minValue!4207 thiss!1504))) lt!118820) (apply!209 lt!118828 lt!118820))))

(declare-fun lt!118823 () Unit!7246)

(assert (=> b!235042 (= lt!118823 lt!118829)))

(declare-fun lt!118831 () ListLongMap!3501)

(assert (=> b!235042 (= lt!118831 (getCurrentListMapNoExtraKeys!525 (_keys!6437 thiss!1504) (_values!4349 thiss!1504) (mask!10327 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)))))

(declare-fun lt!118819 () (_ BitVec 64))

(assert (=> b!235042 (= lt!118819 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118818 () (_ BitVec 64))

(assert (=> b!235042 (= lt!118818 (select (arr!5518 (_keys!6437 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118827 () Unit!7246)

(assert (=> b!235042 (= lt!118827 (addApplyDifferent!185 lt!118831 lt!118819 (zeroValue!4207 thiss!1504) lt!118818))))

(assert (=> b!235042 (= (apply!209 (+!642 lt!118831 (tuple2!4599 lt!118819 (zeroValue!4207 thiss!1504))) lt!118818) (apply!209 lt!118831 lt!118818))))

(declare-fun lt!118817 () Unit!7246)

(assert (=> b!235042 (= lt!118817 lt!118827)))

(declare-fun lt!118833 () ListLongMap!3501)

(assert (=> b!235042 (= lt!118833 (getCurrentListMapNoExtraKeys!525 (_keys!6437 thiss!1504) (_values!4349 thiss!1504) (mask!10327 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)))))

(declare-fun lt!118835 () (_ BitVec 64))

(assert (=> b!235042 (= lt!118835 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118821 () (_ BitVec 64))

(assert (=> b!235042 (= lt!118821 (select (arr!5518 (_keys!6437 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235042 (= lt!118826 (addApplyDifferent!185 lt!118833 lt!118835 (minValue!4207 thiss!1504) lt!118821))))

(assert (=> b!235042 (= (apply!209 (+!642 lt!118833 (tuple2!4599 lt!118835 (minValue!4207 thiss!1504))) lt!118821) (apply!209 lt!118833 lt!118821))))

(declare-fun d!59119 () Bool)

(declare-fun e!152649 () Bool)

(assert (=> d!59119 e!152649))

(declare-fun res!115244 () Bool)

(assert (=> d!59119 (=> (not res!115244) (not e!152649))))

(assert (=> d!59119 (= res!115244 (or (bvsge #b00000000000000000000000000000000 (size!5856 (_keys!6437 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5856 (_keys!6437 thiss!1504))))))))

(declare-fun lt!118824 () ListLongMap!3501)

(declare-fun lt!118822 () ListLongMap!3501)

(assert (=> d!59119 (= lt!118824 lt!118822)))

(declare-fun lt!118815 () Unit!7246)

(assert (=> d!59119 (= lt!118815 e!152657)))

(declare-fun c!39171 () Bool)

(declare-fun e!152653 () Bool)

(assert (=> d!59119 (= c!39171 e!152653)))

(declare-fun res!115246 () Bool)

(assert (=> d!59119 (=> (not res!115246) (not e!152653))))

(assert (=> d!59119 (= res!115246 (bvslt #b00000000000000000000000000000000 (size!5856 (_keys!6437 thiss!1504))))))

(declare-fun e!152645 () ListLongMap!3501)

(assert (=> d!59119 (= lt!118822 e!152645)))

(declare-fun c!39168 () Bool)

(assert (=> d!59119 (= c!39168 (and (not (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59119 (validMask!0 (mask!10327 thiss!1504))))

(assert (=> d!59119 (= (getCurrentListMap!1275 (_keys!6437 thiss!1504) (_values!4349 thiss!1504) (mask!10327 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)) lt!118824)))

(declare-fun b!235043 () Bool)

(declare-fun Unit!7249 () Unit!7246)

(assert (=> b!235043 (= e!152657 Unit!7249)))

(declare-fun bm!21844 () Bool)

(declare-fun call!21846 () Bool)

(assert (=> bm!21844 (= call!21846 (contains!1645 lt!118824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235044 () Bool)

(declare-fun res!115243 () Bool)

(assert (=> b!235044 (=> (not res!115243) (not e!152649))))

(declare-fun e!152651 () Bool)

(assert (=> b!235044 (= res!115243 e!152651)))

(declare-fun c!39172 () Bool)

(assert (=> b!235044 (= c!39172 (not (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!235045 () Bool)

(declare-fun e!152650 () Bool)

(declare-fun get!2834 (ValueCell!2747 V!7889) V!7889)

(declare-fun dynLambda!543 (Int (_ BitVec 64)) V!7889)

(assert (=> b!235045 (= e!152650 (= (apply!209 lt!118824 (select (arr!5518 (_keys!6437 thiss!1504)) #b00000000000000000000000000000000)) (get!2834 (select (arr!5517 (_values!4349 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!543 (defaultEntry!4366 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235045 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5855 (_values!4349 thiss!1504))))))

(assert (=> b!235045 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5856 (_keys!6437 thiss!1504))))))

(declare-fun bm!21845 () Bool)

(declare-fun call!21851 () ListLongMap!3501)

(assert (=> bm!21845 (= call!21851 (getCurrentListMapNoExtraKeys!525 (_keys!6437 thiss!1504) (_values!4349 thiss!1504) (mask!10327 thiss!1504) (extraKeys!4103 thiss!1504) (zeroValue!4207 thiss!1504) (minValue!4207 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4366 thiss!1504)))))

(declare-fun b!235046 () Bool)

(declare-fun e!152652 () Bool)

(assert (=> b!235046 (= e!152652 (validKeyInArray!0 (select (arr!5518 (_keys!6437 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235047 () Bool)

(declare-fun e!152647 () ListLongMap!3501)

(assert (=> b!235047 (= e!152647 call!21850)))

(declare-fun b!235048 () Bool)

(declare-fun res!115241 () Bool)

(assert (=> b!235048 (=> (not res!115241) (not e!152649))))

(declare-fun e!152656 () Bool)

(assert (=> b!235048 (= res!115241 e!152656)))

(declare-fun res!115248 () Bool)

(assert (=> b!235048 (=> res!115248 e!152656)))

(assert (=> b!235048 (= res!115248 (not e!152652))))

(declare-fun res!115242 () Bool)

(assert (=> b!235048 (=> (not res!115242) (not e!152652))))

(assert (=> b!235048 (= res!115242 (bvslt #b00000000000000000000000000000000 (size!5856 (_keys!6437 thiss!1504))))))

(declare-fun b!235049 () Bool)

(declare-fun e!152648 () ListLongMap!3501)

(assert (=> b!235049 (= e!152645 e!152648)))

(declare-fun c!39173 () Bool)

(assert (=> b!235049 (= c!39173 (and (not (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235050 () Bool)

(assert (=> b!235050 (= e!152649 e!152654)))

(declare-fun c!39170 () Bool)

(assert (=> b!235050 (= c!39170 (not (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235051 () Bool)

(assert (=> b!235051 (= e!152656 e!152650)))

(declare-fun res!115249 () Bool)

(assert (=> b!235051 (=> (not res!115249) (not e!152650))))

(assert (=> b!235051 (= res!115249 (contains!1645 lt!118824 (select (arr!5518 (_keys!6437 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!235051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5856 (_keys!6437 thiss!1504))))))

(declare-fun bm!21846 () Bool)

(declare-fun call!21848 () ListLongMap!3501)

(assert (=> bm!21846 (= call!21848 (+!642 (ite c!39168 call!21851 (ite c!39173 call!21847 call!21850)) (ite (or c!39168 c!39173) (tuple2!4599 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4207 thiss!1504)) (tuple2!4599 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4207 thiss!1504)))))))

(declare-fun b!235052 () Bool)

(declare-fun call!21849 () ListLongMap!3501)

(assert (=> b!235052 (= e!152648 call!21849)))

(declare-fun bm!21847 () Bool)

(assert (=> bm!21847 (= call!21852 (contains!1645 lt!118824 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235053 () Bool)

(assert (=> b!235053 (= e!152654 (not call!21852))))

(declare-fun b!235054 () Bool)

(assert (=> b!235054 (= e!152655 (= (apply!209 lt!118824 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4207 thiss!1504)))))

(declare-fun b!235055 () Bool)

(assert (=> b!235055 (= e!152647 call!21849)))

(declare-fun b!235056 () Bool)

(assert (=> b!235056 (= e!152645 (+!642 call!21848 (tuple2!4599 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4207 thiss!1504))))))

(declare-fun b!235057 () Bool)

(declare-fun e!152646 () Bool)

(assert (=> b!235057 (= e!152651 e!152646)))

(declare-fun res!115245 () Bool)

(assert (=> b!235057 (= res!115245 call!21846)))

(assert (=> b!235057 (=> (not res!115245) (not e!152646))))

(declare-fun b!235058 () Bool)

(assert (=> b!235058 (= e!152651 (not call!21846))))

(declare-fun b!235059 () Bool)

(assert (=> b!235059 (= e!152653 (validKeyInArray!0 (select (arr!5518 (_keys!6437 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235060 () Bool)

(assert (=> b!235060 (= e!152646 (= (apply!209 lt!118824 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4207 thiss!1504)))))

(declare-fun bm!21848 () Bool)

(assert (=> bm!21848 (= call!21847 call!21851)))

(declare-fun bm!21849 () Bool)

(assert (=> bm!21849 (= call!21849 call!21848)))

(declare-fun b!235061 () Bool)

(declare-fun c!39169 () Bool)

(assert (=> b!235061 (= c!39169 (and (not (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4103 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!235061 (= e!152648 e!152647)))

(assert (= (and d!59119 c!39168) b!235056))

(assert (= (and d!59119 (not c!39168)) b!235049))

(assert (= (and b!235049 c!39173) b!235052))

(assert (= (and b!235049 (not c!39173)) b!235061))

(assert (= (and b!235061 c!39169) b!235055))

(assert (= (and b!235061 (not c!39169)) b!235047))

(assert (= (or b!235055 b!235047) bm!21843))

(assert (= (or b!235052 bm!21843) bm!21848))

(assert (= (or b!235052 b!235055) bm!21849))

(assert (= (or b!235056 bm!21848) bm!21845))

(assert (= (or b!235056 bm!21849) bm!21846))

(assert (= (and d!59119 res!115246) b!235059))

(assert (= (and d!59119 c!39171) b!235042))

(assert (= (and d!59119 (not c!39171)) b!235043))

(assert (= (and d!59119 res!115244) b!235048))

(assert (= (and b!235048 res!115242) b!235046))

(assert (= (and b!235048 (not res!115248)) b!235051))

(assert (= (and b!235051 res!115249) b!235045))

(assert (= (and b!235048 res!115241) b!235044))

(assert (= (and b!235044 c!39172) b!235057))

(assert (= (and b!235044 (not c!39172)) b!235058))

(assert (= (and b!235057 res!115245) b!235060))

(assert (= (or b!235057 b!235058) bm!21844))

(assert (= (and b!235044 res!115243) b!235050))

(assert (= (and b!235050 c!39170) b!235041))

(assert (= (and b!235050 (not c!39170)) b!235053))

(assert (= (and b!235041 res!115247) b!235054))

(assert (= (or b!235041 b!235053) bm!21847))

(declare-fun b_lambda!7881 () Bool)

(assert (=> (not b_lambda!7881) (not b!235045)))

(declare-fun t!8491 () Bool)

(declare-fun tb!2923 () Bool)

(assert (=> (and b!234907 (= (defaultEntry!4366 thiss!1504) (defaultEntry!4366 thiss!1504)) t!8491) tb!2923))

(declare-fun result!5107 () Bool)

(assert (=> tb!2923 (= result!5107 tp_is_empty!6181)))

(assert (=> b!235045 t!8491))

(declare-fun b_and!13225 () Bool)

(assert (= b_and!13219 (and (=> t!8491 result!5107) b_and!13225)))

(assert (=> b!235051 m!255729))

(assert (=> b!235051 m!255729))

(declare-fun m!255749 () Bool)

(assert (=> b!235051 m!255749))

(declare-fun m!255751 () Bool)

(assert (=> b!235054 m!255751))

(declare-fun m!255753 () Bool)

(assert (=> bm!21847 m!255753))

(assert (=> b!235045 m!255729))

(declare-fun m!255755 () Bool)

(assert (=> b!235045 m!255755))

(declare-fun m!255757 () Bool)

(assert (=> b!235045 m!255757))

(declare-fun m!255759 () Bool)

(assert (=> b!235045 m!255759))

(declare-fun m!255761 () Bool)

(assert (=> b!235045 m!255761))

(assert (=> b!235045 m!255759))

(assert (=> b!235045 m!255757))

(assert (=> b!235045 m!255729))

(declare-fun m!255763 () Bool)

(assert (=> bm!21844 m!255763))

(declare-fun m!255765 () Bool)

(assert (=> b!235042 m!255765))

(assert (=> b!235042 m!255729))

(declare-fun m!255767 () Bool)

(assert (=> b!235042 m!255767))

(declare-fun m!255769 () Bool)

(assert (=> b!235042 m!255769))

(assert (=> b!235042 m!255767))

(declare-fun m!255771 () Bool)

(assert (=> b!235042 m!255771))

(assert (=> b!235042 m!255769))

(declare-fun m!255773 () Bool)

(assert (=> b!235042 m!255773))

(declare-fun m!255775 () Bool)

(assert (=> b!235042 m!255775))

(declare-fun m!255777 () Bool)

(assert (=> b!235042 m!255777))

(declare-fun m!255779 () Bool)

(assert (=> b!235042 m!255779))

(declare-fun m!255781 () Bool)

(assert (=> b!235042 m!255781))

(declare-fun m!255783 () Bool)

(assert (=> b!235042 m!255783))

(declare-fun m!255785 () Bool)

(assert (=> b!235042 m!255785))

(declare-fun m!255787 () Bool)

(assert (=> b!235042 m!255787))

(declare-fun m!255789 () Bool)

(assert (=> b!235042 m!255789))

(assert (=> b!235042 m!255783))

(declare-fun m!255791 () Bool)

(assert (=> b!235042 m!255791))

(declare-fun m!255793 () Bool)

(assert (=> b!235042 m!255793))

(declare-fun m!255795 () Bool)

(assert (=> b!235042 m!255795))

(assert (=> b!235042 m!255775))

(declare-fun m!255797 () Bool)

(assert (=> b!235056 m!255797))

(assert (=> b!235059 m!255729))

(assert (=> b!235059 m!255729))

(assert (=> b!235059 m!255731))

(assert (=> b!235046 m!255729))

(assert (=> b!235046 m!255729))

(assert (=> b!235046 m!255731))

(declare-fun m!255799 () Bool)

(assert (=> bm!21846 m!255799))

(assert (=> bm!21845 m!255795))

(declare-fun m!255801 () Bool)

(assert (=> b!235060 m!255801))

(assert (=> d!59119 m!255685))

(assert (=> b!234905 d!59119))

(declare-fun b!235076 () Bool)

(declare-fun e!152666 () SeekEntryResult!988)

(assert (=> b!235076 (= e!152666 Undefined!988)))

(declare-fun d!59121 () Bool)

(declare-fun lt!118843 () SeekEntryResult!988)

(assert (=> d!59121 (and (or ((_ is Undefined!988) lt!118843) (not ((_ is Found!988) lt!118843)) (and (bvsge (index!6123 lt!118843) #b00000000000000000000000000000000) (bvslt (index!6123 lt!118843) (size!5856 (_keys!6437 thiss!1504))))) (or ((_ is Undefined!988) lt!118843) ((_ is Found!988) lt!118843) (not ((_ is MissingZero!988) lt!118843)) (and (bvsge (index!6122 lt!118843) #b00000000000000000000000000000000) (bvslt (index!6122 lt!118843) (size!5856 (_keys!6437 thiss!1504))))) (or ((_ is Undefined!988) lt!118843) ((_ is Found!988) lt!118843) ((_ is MissingZero!988) lt!118843) (not ((_ is MissingVacant!988) lt!118843)) (and (bvsge (index!6125 lt!118843) #b00000000000000000000000000000000) (bvslt (index!6125 lt!118843) (size!5856 (_keys!6437 thiss!1504))))) (or ((_ is Undefined!988) lt!118843) (ite ((_ is Found!988) lt!118843) (= (select (arr!5518 (_keys!6437 thiss!1504)) (index!6123 lt!118843)) key!932) (ite ((_ is MissingZero!988) lt!118843) (= (select (arr!5518 (_keys!6437 thiss!1504)) (index!6122 lt!118843)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!988) lt!118843) (= (select (arr!5518 (_keys!6437 thiss!1504)) (index!6125 lt!118843)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59121 (= lt!118843 e!152666)))

(declare-fun c!39182 () Bool)

(declare-fun lt!118845 () SeekEntryResult!988)

(assert (=> d!59121 (= c!39182 (and ((_ is Intermediate!988) lt!118845) (undefined!1800 lt!118845)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11611 (_ BitVec 32)) SeekEntryResult!988)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59121 (= lt!118845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10327 thiss!1504)) key!932 (_keys!6437 thiss!1504) (mask!10327 thiss!1504)))))

(assert (=> d!59121 (validMask!0 (mask!10327 thiss!1504))))

(assert (=> d!59121 (= (seekEntryOrOpen!0 key!932 (_keys!6437 thiss!1504) (mask!10327 thiss!1504)) lt!118843)))

(declare-fun b!235077 () Bool)

(declare-fun c!39181 () Bool)

(declare-fun lt!118844 () (_ BitVec 64))

(assert (=> b!235077 (= c!39181 (= lt!118844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152665 () SeekEntryResult!988)

(declare-fun e!152664 () SeekEntryResult!988)

(assert (=> b!235077 (= e!152665 e!152664)))

(declare-fun b!235078 () Bool)

(assert (=> b!235078 (= e!152664 (MissingZero!988 (index!6124 lt!118845)))))

(declare-fun b!235079 () Bool)

(assert (=> b!235079 (= e!152666 e!152665)))

(assert (=> b!235079 (= lt!118844 (select (arr!5518 (_keys!6437 thiss!1504)) (index!6124 lt!118845)))))

(declare-fun c!39180 () Bool)

(assert (=> b!235079 (= c!39180 (= lt!118844 key!932))))

(declare-fun b!235080 () Bool)

(assert (=> b!235080 (= e!152665 (Found!988 (index!6124 lt!118845)))))

(declare-fun b!235081 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11611 (_ BitVec 32)) SeekEntryResult!988)

(assert (=> b!235081 (= e!152664 (seekKeyOrZeroReturnVacant!0 (x!23755 lt!118845) (index!6124 lt!118845) (index!6124 lt!118845) key!932 (_keys!6437 thiss!1504) (mask!10327 thiss!1504)))))

(assert (= (and d!59121 c!39182) b!235076))

(assert (= (and d!59121 (not c!39182)) b!235079))

(assert (= (and b!235079 c!39180) b!235080))

(assert (= (and b!235079 (not c!39180)) b!235077))

(assert (= (and b!235077 c!39181) b!235078))

(assert (= (and b!235077 (not c!39181)) b!235081))

(declare-fun m!255803 () Bool)

(assert (=> d!59121 m!255803))

(declare-fun m!255805 () Bool)

(assert (=> d!59121 m!255805))

(declare-fun m!255807 () Bool)

(assert (=> d!59121 m!255807))

(assert (=> d!59121 m!255685))

(declare-fun m!255809 () Bool)

(assert (=> d!59121 m!255809))

(assert (=> d!59121 m!255807))

(declare-fun m!255811 () Bool)

(assert (=> d!59121 m!255811))

(declare-fun m!255813 () Bool)

(assert (=> b!235079 m!255813))

(declare-fun m!255815 () Bool)

(assert (=> b!235081 m!255815))

(assert (=> b!234900 d!59121))

(declare-fun condMapEmpty!10472 () Bool)

(declare-fun mapDefault!10472 () ValueCell!2747)

(assert (=> mapNonEmpty!10463 (= condMapEmpty!10472 (= mapRest!10463 ((as const (Array (_ BitVec 32) ValueCell!2747)) mapDefault!10472)))))

(declare-fun e!152671 () Bool)

(declare-fun mapRes!10472 () Bool)

(assert (=> mapNonEmpty!10463 (= tp!22121 (and e!152671 mapRes!10472))))

(declare-fun b!235088 () Bool)

(declare-fun e!152672 () Bool)

(assert (=> b!235088 (= e!152672 tp_is_empty!6181)))

(declare-fun b!235089 () Bool)

(assert (=> b!235089 (= e!152671 tp_is_empty!6181)))

(declare-fun mapIsEmpty!10472 () Bool)

(assert (=> mapIsEmpty!10472 mapRes!10472))

(declare-fun mapNonEmpty!10472 () Bool)

(declare-fun tp!22136 () Bool)

(assert (=> mapNonEmpty!10472 (= mapRes!10472 (and tp!22136 e!152672))))

(declare-fun mapRest!10472 () (Array (_ BitVec 32) ValueCell!2747))

(declare-fun mapValue!10472 () ValueCell!2747)

(declare-fun mapKey!10472 () (_ BitVec 32))

(assert (=> mapNonEmpty!10472 (= mapRest!10463 (store mapRest!10472 mapKey!10472 mapValue!10472))))

(assert (= (and mapNonEmpty!10463 condMapEmpty!10472) mapIsEmpty!10472))

(assert (= (and mapNonEmpty!10463 (not condMapEmpty!10472)) mapNonEmpty!10472))

(assert (= (and mapNonEmpty!10472 ((_ is ValueCellFull!2747) mapValue!10472)) b!235088))

(assert (= (and mapNonEmpty!10463 ((_ is ValueCellFull!2747) mapDefault!10472)) b!235089))

(declare-fun m!255817 () Bool)

(assert (=> mapNonEmpty!10472 m!255817))

(declare-fun b_lambda!7883 () Bool)

(assert (= b_lambda!7881 (or (and b!234907 b_free!6319) b_lambda!7883)))

(check-sat b_and!13225 (not b!234987) (not b!234988) (not b!235051) (not d!59117) tp_is_empty!6181 (not b!235045) (not b_next!6319) (not d!59121) (not b!234977) (not b!234996) (not b!235081) (not b!235042) (not b!235060) (not mapNonEmpty!10472) (not bm!21846) (not bm!21828) (not b!235059) (not b!235056) (not bm!21847) (not b!234976) (not b!234998) (not d!59113) (not bm!21845) (not b!234975) (not b!235046) (not b_lambda!7883) (not b!235054) (not bm!21844) (not d!59119))
(check-sat b_and!13225 (not b_next!6319))
