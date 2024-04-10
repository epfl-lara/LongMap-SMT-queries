; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18616 () Bool)

(assert start!18616)

(declare-fun b!184307 () Bool)

(declare-fun b_free!4545 () Bool)

(declare-fun b_next!4545 () Bool)

(assert (=> b!184307 (= b_free!4545 (not b_next!4545))))

(declare-fun tp!16417 () Bool)

(declare-fun b_and!11129 () Bool)

(assert (=> b!184307 (= tp!16417 b_and!11129)))

(declare-fun b!184299 () Bool)

(declare-fun e!121322 () Bool)

(declare-datatypes ((V!5403 0))(
  ( (V!5404 (val!2203 Int)) )
))
(declare-datatypes ((ValueCell!1815 0))(
  ( (ValueCellFull!1815 (v!4109 V!5403)) (EmptyCell!1815) )
))
(declare-datatypes ((array!7833 0))(
  ( (array!7834 (arr!3701 (Array (_ BitVec 32) (_ BitVec 64))) (size!4015 (_ BitVec 32))) )
))
(declare-datatypes ((array!7835 0))(
  ( (array!7836 (arr!3702 (Array (_ BitVec 32) ValueCell!1815)) (size!4016 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2538 0))(
  ( (LongMapFixedSize!2539 (defaultEntry!3764 Int) (mask!8846 (_ BitVec 32)) (extraKeys!3501 (_ BitVec 32)) (zeroValue!3605 V!5403) (minValue!3605 V!5403) (_size!1318 (_ BitVec 32)) (_keys!5691 array!7833) (_values!3747 array!7835) (_vacant!1318 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2538)

(assert (=> b!184299 (= e!121322 (and (= (size!4016 (_values!3747 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8846 thiss!1248))) (= (size!4015 (_keys!5691 thiss!1248)) (size!4016 (_values!3747 thiss!1248))) (bvsge (mask!8846 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3501 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!184300 () Bool)

(declare-fun res!87202 () Bool)

(declare-fun e!121319 () Bool)

(assert (=> b!184300 (=> (not res!87202) (not e!121319))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!184300 (= res!87202 (not (= key!828 (bvneg key!828))))))

(declare-fun b!184301 () Bool)

(declare-fun e!121320 () Bool)

(declare-fun tp_is_empty!4317 () Bool)

(assert (=> b!184301 (= e!121320 tp_is_empty!4317)))

(declare-fun b!184302 () Bool)

(declare-fun res!87201 () Bool)

(assert (=> b!184302 (=> (not res!87201) (not e!121322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!184302 (= res!87201 (validMask!0 (mask!8846 thiss!1248)))))

(declare-fun mapNonEmpty!7420 () Bool)

(declare-fun mapRes!7420 () Bool)

(declare-fun tp!16416 () Bool)

(assert (=> mapNonEmpty!7420 (= mapRes!7420 (and tp!16416 e!121320))))

(declare-fun mapRest!7420 () (Array (_ BitVec 32) ValueCell!1815))

(declare-fun mapKey!7420 () (_ BitVec 32))

(declare-fun mapValue!7420 () ValueCell!1815)

(assert (=> mapNonEmpty!7420 (= (arr!3702 (_values!3747 thiss!1248)) (store mapRest!7420 mapKey!7420 mapValue!7420))))

(declare-fun b!184304 () Bool)

(assert (=> b!184304 (= e!121319 e!121322)))

(declare-fun res!87204 () Bool)

(assert (=> b!184304 (=> (not res!87204) (not e!121322))))

(declare-datatypes ((SeekEntryResult!627 0))(
  ( (MissingZero!627 (index!4678 (_ BitVec 32))) (Found!627 (index!4679 (_ BitVec 32))) (Intermediate!627 (undefined!1439 Bool) (index!4680 (_ BitVec 32)) (x!20051 (_ BitVec 32))) (Undefined!627) (MissingVacant!627 (index!4681 (_ BitVec 32))) )
))
(declare-fun lt!91130 () SeekEntryResult!627)

(get-info :version)

(assert (=> b!184304 (= res!87204 (and (not ((_ is Undefined!627) lt!91130)) (not ((_ is MissingVacant!627) lt!91130)) (not ((_ is MissingZero!627) lt!91130)) ((_ is Found!627) lt!91130)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7833 (_ BitVec 32)) SeekEntryResult!627)

(assert (=> b!184304 (= lt!91130 (seekEntryOrOpen!0 key!828 (_keys!5691 thiss!1248) (mask!8846 thiss!1248)))))

(declare-fun mapIsEmpty!7420 () Bool)

(assert (=> mapIsEmpty!7420 mapRes!7420))

(declare-fun b!184303 () Bool)

(declare-fun e!121321 () Bool)

(assert (=> b!184303 (= e!121321 tp_is_empty!4317)))

(declare-fun res!87205 () Bool)

(assert (=> start!18616 (=> (not res!87205) (not e!121319))))

(declare-fun valid!1049 (LongMapFixedSize!2538) Bool)

(assert (=> start!18616 (= res!87205 (valid!1049 thiss!1248))))

(assert (=> start!18616 e!121319))

(declare-fun e!121317 () Bool)

(assert (=> start!18616 e!121317))

(assert (=> start!18616 true))

(declare-fun b!184305 () Bool)

(declare-fun res!87203 () Bool)

(assert (=> b!184305 (=> (not res!87203) (not e!121322))))

(declare-datatypes ((tuple2!3430 0))(
  ( (tuple2!3431 (_1!1726 (_ BitVec 64)) (_2!1726 V!5403)) )
))
(declare-datatypes ((List!2345 0))(
  ( (Nil!2342) (Cons!2341 (h!2972 tuple2!3430) (t!7219 List!2345)) )
))
(declare-datatypes ((ListLongMap!2347 0))(
  ( (ListLongMap!2348 (toList!1189 List!2345)) )
))
(declare-fun contains!1279 (ListLongMap!2347 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!837 (array!7833 array!7835 (_ BitVec 32) (_ BitVec 32) V!5403 V!5403 (_ BitVec 32) Int) ListLongMap!2347)

(assert (=> b!184305 (= res!87203 (not (contains!1279 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)) key!828)))))

(declare-fun b!184306 () Bool)

(declare-fun e!121323 () Bool)

(assert (=> b!184306 (= e!121323 (and e!121321 mapRes!7420))))

(declare-fun condMapEmpty!7420 () Bool)

(declare-fun mapDefault!7420 () ValueCell!1815)

(assert (=> b!184306 (= condMapEmpty!7420 (= (arr!3702 (_values!3747 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1815)) mapDefault!7420)))))

(declare-fun array_inv!2395 (array!7833) Bool)

(declare-fun array_inv!2396 (array!7835) Bool)

(assert (=> b!184307 (= e!121317 (and tp!16417 tp_is_empty!4317 (array_inv!2395 (_keys!5691 thiss!1248)) (array_inv!2396 (_values!3747 thiss!1248)) e!121323))))

(assert (= (and start!18616 res!87205) b!184300))

(assert (= (and b!184300 res!87202) b!184304))

(assert (= (and b!184304 res!87204) b!184305))

(assert (= (and b!184305 res!87203) b!184302))

(assert (= (and b!184302 res!87201) b!184299))

(assert (= (and b!184306 condMapEmpty!7420) mapIsEmpty!7420))

(assert (= (and b!184306 (not condMapEmpty!7420)) mapNonEmpty!7420))

(assert (= (and mapNonEmpty!7420 ((_ is ValueCellFull!1815) mapValue!7420)) b!184301))

(assert (= (and b!184306 ((_ is ValueCellFull!1815) mapDefault!7420)) b!184303))

(assert (= b!184307 b!184306))

(assert (= start!18616 b!184307))

(declare-fun m!211697 () Bool)

(assert (=> b!184304 m!211697))

(declare-fun m!211699 () Bool)

(assert (=> start!18616 m!211699))

(declare-fun m!211701 () Bool)

(assert (=> b!184302 m!211701))

(declare-fun m!211703 () Bool)

(assert (=> b!184307 m!211703))

(declare-fun m!211705 () Bool)

(assert (=> b!184307 m!211705))

(declare-fun m!211707 () Bool)

(assert (=> mapNonEmpty!7420 m!211707))

(declare-fun m!211709 () Bool)

(assert (=> b!184305 m!211709))

(assert (=> b!184305 m!211709))

(declare-fun m!211711 () Bool)

(assert (=> b!184305 m!211711))

(check-sat (not b!184302) (not b!184305) (not b!184304) (not b!184307) (not start!18616) (not b_next!4545) b_and!11129 tp_is_empty!4317 (not mapNonEmpty!7420))
(check-sat b_and!11129 (not b_next!4545))
(get-model)

(declare-fun d!54899 () Bool)

(assert (=> d!54899 (= (validMask!0 (mask!8846 thiss!1248)) (and (or (= (mask!8846 thiss!1248) #b00000000000000000000000000000111) (= (mask!8846 thiss!1248) #b00000000000000000000000000001111) (= (mask!8846 thiss!1248) #b00000000000000000000000000011111) (= (mask!8846 thiss!1248) #b00000000000000000000000000111111) (= (mask!8846 thiss!1248) #b00000000000000000000000001111111) (= (mask!8846 thiss!1248) #b00000000000000000000000011111111) (= (mask!8846 thiss!1248) #b00000000000000000000000111111111) (= (mask!8846 thiss!1248) #b00000000000000000000001111111111) (= (mask!8846 thiss!1248) #b00000000000000000000011111111111) (= (mask!8846 thiss!1248) #b00000000000000000000111111111111) (= (mask!8846 thiss!1248) #b00000000000000000001111111111111) (= (mask!8846 thiss!1248) #b00000000000000000011111111111111) (= (mask!8846 thiss!1248) #b00000000000000000111111111111111) (= (mask!8846 thiss!1248) #b00000000000000001111111111111111) (= (mask!8846 thiss!1248) #b00000000000000011111111111111111) (= (mask!8846 thiss!1248) #b00000000000000111111111111111111) (= (mask!8846 thiss!1248) #b00000000000001111111111111111111) (= (mask!8846 thiss!1248) #b00000000000011111111111111111111) (= (mask!8846 thiss!1248) #b00000000000111111111111111111111) (= (mask!8846 thiss!1248) #b00000000001111111111111111111111) (= (mask!8846 thiss!1248) #b00000000011111111111111111111111) (= (mask!8846 thiss!1248) #b00000000111111111111111111111111) (= (mask!8846 thiss!1248) #b00000001111111111111111111111111) (= (mask!8846 thiss!1248) #b00000011111111111111111111111111) (= (mask!8846 thiss!1248) #b00000111111111111111111111111111) (= (mask!8846 thiss!1248) #b00001111111111111111111111111111) (= (mask!8846 thiss!1248) #b00011111111111111111111111111111) (= (mask!8846 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8846 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!184302 d!54899))

(declare-fun d!54901 () Bool)

(declare-fun res!87227 () Bool)

(declare-fun e!121347 () Bool)

(assert (=> d!54901 (=> (not res!87227) (not e!121347))))

(declare-fun simpleValid!178 (LongMapFixedSize!2538) Bool)

(assert (=> d!54901 (= res!87227 (simpleValid!178 thiss!1248))))

(assert (=> d!54901 (= (valid!1049 thiss!1248) e!121347)))

(declare-fun b!184341 () Bool)

(declare-fun res!87228 () Bool)

(assert (=> b!184341 (=> (not res!87228) (not e!121347))))

(declare-fun arrayCountValidKeys!0 (array!7833 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184341 (= res!87228 (= (arrayCountValidKeys!0 (_keys!5691 thiss!1248) #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))) (_size!1318 thiss!1248)))))

(declare-fun b!184342 () Bool)

(declare-fun res!87229 () Bool)

(assert (=> b!184342 (=> (not res!87229) (not e!121347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7833 (_ BitVec 32)) Bool)

(assert (=> b!184342 (= res!87229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5691 thiss!1248) (mask!8846 thiss!1248)))))

(declare-fun b!184343 () Bool)

(declare-datatypes ((List!2347 0))(
  ( (Nil!2344) (Cons!2343 (h!2974 (_ BitVec 64)) (t!7223 List!2347)) )
))
(declare-fun arrayNoDuplicates!0 (array!7833 (_ BitVec 32) List!2347) Bool)

(assert (=> b!184343 (= e!121347 (arrayNoDuplicates!0 (_keys!5691 thiss!1248) #b00000000000000000000000000000000 Nil!2344))))

(assert (= (and d!54901 res!87227) b!184341))

(assert (= (and b!184341 res!87228) b!184342))

(assert (= (and b!184342 res!87229) b!184343))

(declare-fun m!211729 () Bool)

(assert (=> d!54901 m!211729))

(declare-fun m!211731 () Bool)

(assert (=> b!184341 m!211731))

(declare-fun m!211733 () Bool)

(assert (=> b!184342 m!211733))

(declare-fun m!211735 () Bool)

(assert (=> b!184343 m!211735))

(assert (=> start!18616 d!54901))

(declare-fun d!54903 () Bool)

(declare-fun e!121352 () Bool)

(assert (=> d!54903 e!121352))

(declare-fun res!87232 () Bool)

(assert (=> d!54903 (=> res!87232 e!121352)))

(declare-fun lt!91142 () Bool)

(assert (=> d!54903 (= res!87232 (not lt!91142))))

(declare-fun lt!91143 () Bool)

(assert (=> d!54903 (= lt!91142 lt!91143)))

(declare-datatypes ((Unit!5568 0))(
  ( (Unit!5569) )
))
(declare-fun lt!91144 () Unit!5568)

(declare-fun e!121353 () Unit!5568)

(assert (=> d!54903 (= lt!91144 e!121353)))

(declare-fun c!33050 () Bool)

(assert (=> d!54903 (= c!33050 lt!91143)))

(declare-fun containsKey!223 (List!2345 (_ BitVec 64)) Bool)

(assert (=> d!54903 (= lt!91143 (containsKey!223 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))) key!828))))

(assert (=> d!54903 (= (contains!1279 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)) key!828) lt!91142)))

(declare-fun b!184350 () Bool)

(declare-fun lt!91145 () Unit!5568)

(assert (=> b!184350 (= e!121353 lt!91145)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!171 (List!2345 (_ BitVec 64)) Unit!5568)

(assert (=> b!184350 (= lt!91145 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))) key!828))))

(declare-datatypes ((Option!225 0))(
  ( (Some!224 (v!4111 V!5403)) (None!223) )
))
(declare-fun isDefined!172 (Option!225) Bool)

(declare-fun getValueByKey!219 (List!2345 (_ BitVec 64)) Option!225)

(assert (=> b!184350 (isDefined!172 (getValueByKey!219 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))) key!828))))

(declare-fun b!184351 () Bool)

(declare-fun Unit!5570 () Unit!5568)

(assert (=> b!184351 (= e!121353 Unit!5570)))

(declare-fun b!184352 () Bool)

(assert (=> b!184352 (= e!121352 (isDefined!172 (getValueByKey!219 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))) key!828)))))

(assert (= (and d!54903 c!33050) b!184350))

(assert (= (and d!54903 (not c!33050)) b!184351))

(assert (= (and d!54903 (not res!87232)) b!184352))

(declare-fun m!211737 () Bool)

(assert (=> d!54903 m!211737))

(declare-fun m!211739 () Bool)

(assert (=> b!184350 m!211739))

(declare-fun m!211741 () Bool)

(assert (=> b!184350 m!211741))

(assert (=> b!184350 m!211741))

(declare-fun m!211743 () Bool)

(assert (=> b!184350 m!211743))

(assert (=> b!184352 m!211741))

(assert (=> b!184352 m!211741))

(assert (=> b!184352 m!211743))

(assert (=> b!184305 d!54903))

(declare-fun b!184395 () Bool)

(declare-fun e!121390 () Unit!5568)

(declare-fun lt!91194 () Unit!5568)

(assert (=> b!184395 (= e!121390 lt!91194)))

(declare-fun lt!91199 () ListLongMap!2347)

(declare-fun getCurrentListMapNoExtraKeys!195 (array!7833 array!7835 (_ BitVec 32) (_ BitVec 32) V!5403 V!5403 (_ BitVec 32) Int) ListLongMap!2347)

(assert (=> b!184395 (= lt!91199 (getCurrentListMapNoExtraKeys!195 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))))

(declare-fun lt!91200 () (_ BitVec 64))

(assert (=> b!184395 (= lt!91200 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91211 () (_ BitVec 64))

(assert (=> b!184395 (= lt!91211 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91196 () Unit!5568)

(declare-fun addStillContains!138 (ListLongMap!2347 (_ BitVec 64) V!5403 (_ BitVec 64)) Unit!5568)

(assert (=> b!184395 (= lt!91196 (addStillContains!138 lt!91199 lt!91200 (zeroValue!3605 thiss!1248) lt!91211))))

(declare-fun +!282 (ListLongMap!2347 tuple2!3430) ListLongMap!2347)

(assert (=> b!184395 (contains!1279 (+!282 lt!91199 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248))) lt!91211)))

(declare-fun lt!91193 () Unit!5568)

(assert (=> b!184395 (= lt!91193 lt!91196)))

(declare-fun lt!91203 () ListLongMap!2347)

(assert (=> b!184395 (= lt!91203 (getCurrentListMapNoExtraKeys!195 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))))

(declare-fun lt!91210 () (_ BitVec 64))

(assert (=> b!184395 (= lt!91210 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91206 () (_ BitVec 64))

(assert (=> b!184395 (= lt!91206 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91207 () Unit!5568)

(declare-fun addApplyDifferent!138 (ListLongMap!2347 (_ BitVec 64) V!5403 (_ BitVec 64)) Unit!5568)

(assert (=> b!184395 (= lt!91207 (addApplyDifferent!138 lt!91203 lt!91210 (minValue!3605 thiss!1248) lt!91206))))

(declare-fun apply!162 (ListLongMap!2347 (_ BitVec 64)) V!5403)

(assert (=> b!184395 (= (apply!162 (+!282 lt!91203 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248))) lt!91206) (apply!162 lt!91203 lt!91206))))

(declare-fun lt!91198 () Unit!5568)

(assert (=> b!184395 (= lt!91198 lt!91207)))

(declare-fun lt!91191 () ListLongMap!2347)

(assert (=> b!184395 (= lt!91191 (getCurrentListMapNoExtraKeys!195 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))))

(declare-fun lt!91208 () (_ BitVec 64))

(assert (=> b!184395 (= lt!91208 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91192 () (_ BitVec 64))

(assert (=> b!184395 (= lt!91192 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91209 () Unit!5568)

(assert (=> b!184395 (= lt!91209 (addApplyDifferent!138 lt!91191 lt!91208 (zeroValue!3605 thiss!1248) lt!91192))))

(assert (=> b!184395 (= (apply!162 (+!282 lt!91191 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248))) lt!91192) (apply!162 lt!91191 lt!91192))))

(declare-fun lt!91204 () Unit!5568)

(assert (=> b!184395 (= lt!91204 lt!91209)))

(declare-fun lt!91190 () ListLongMap!2347)

(assert (=> b!184395 (= lt!91190 (getCurrentListMapNoExtraKeys!195 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))))

(declare-fun lt!91201 () (_ BitVec 64))

(assert (=> b!184395 (= lt!91201 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91205 () (_ BitVec 64))

(assert (=> b!184395 (= lt!91205 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184395 (= lt!91194 (addApplyDifferent!138 lt!91190 lt!91201 (minValue!3605 thiss!1248) lt!91205))))

(assert (=> b!184395 (= (apply!162 (+!282 lt!91190 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248))) lt!91205) (apply!162 lt!91190 lt!91205))))

(declare-fun b!184396 () Bool)

(declare-fun Unit!5571 () Unit!5568)

(assert (=> b!184396 (= e!121390 Unit!5571)))

(declare-fun b!184397 () Bool)

(declare-fun e!121389 () ListLongMap!2347)

(declare-fun e!121388 () ListLongMap!2347)

(assert (=> b!184397 (= e!121389 e!121388)))

(declare-fun c!33066 () Bool)

(assert (=> b!184397 (= c!33066 (and (not (= (bvand (extraKeys!3501 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3501 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184398 () Bool)

(declare-fun call!18615 () ListLongMap!2347)

(assert (=> b!184398 (= e!121388 call!18615)))

(declare-fun b!184399 () Bool)

(declare-fun e!121386 () ListLongMap!2347)

(declare-fun call!18614 () ListLongMap!2347)

(assert (=> b!184399 (= e!121386 call!18614)))

(declare-fun call!18613 () ListLongMap!2347)

(declare-fun bm!18607 () Bool)

(declare-fun call!18610 () ListLongMap!2347)

(declare-fun c!33064 () Bool)

(declare-fun call!18616 () ListLongMap!2347)

(assert (=> bm!18607 (= call!18610 (+!282 (ite c!33064 call!18613 (ite c!33066 call!18616 call!18614)) (ite (or c!33064 c!33066) (tuple2!3431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3605 thiss!1248)) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248)))))))

(declare-fun b!184400 () Bool)

(declare-fun e!121381 () Bool)

(declare-fun lt!91195 () ListLongMap!2347)

(assert (=> b!184400 (= e!121381 (= (apply!162 lt!91195 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3605 thiss!1248)))))

(declare-fun b!184401 () Bool)

(declare-fun e!121380 () Bool)

(declare-fun get!2123 (ValueCell!1815 V!5403) V!5403)

(declare-fun dynLambda!505 (Int (_ BitVec 64)) V!5403)

(assert (=> b!184401 (= e!121380 (= (apply!162 lt!91195 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)) (get!2123 (select (arr!3702 (_values!3747 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3764 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184401 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4016 (_values!3747 thiss!1248))))))

(assert (=> b!184401 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))

(declare-fun bm!18608 () Bool)

(declare-fun call!18612 () Bool)

(assert (=> bm!18608 (= call!18612 (contains!1279 lt!91195 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18609 () Bool)

(assert (=> bm!18609 (= call!18613 (getCurrentListMapNoExtraKeys!195 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))))

(declare-fun b!184402 () Bool)

(declare-fun e!121392 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!184402 (= e!121392 (validKeyInArray!0 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184403 () Bool)

(declare-fun res!87255 () Bool)

(declare-fun e!121384 () Bool)

(assert (=> b!184403 (=> (not res!87255) (not e!121384))))

(declare-fun e!121387 () Bool)

(assert (=> b!184403 (= res!87255 e!121387)))

(declare-fun res!87257 () Bool)

(assert (=> b!184403 (=> res!87257 e!121387)))

(assert (=> b!184403 (= res!87257 (not e!121392))))

(declare-fun res!87258 () Bool)

(assert (=> b!184403 (=> (not res!87258) (not e!121392))))

(assert (=> b!184403 (= res!87258 (bvslt #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))

(declare-fun b!184404 () Bool)

(declare-fun e!121391 () Bool)

(declare-fun e!121383 () Bool)

(assert (=> b!184404 (= e!121391 e!121383)))

(declare-fun res!87252 () Bool)

(assert (=> b!184404 (= res!87252 call!18612)))

(assert (=> b!184404 (=> (not res!87252) (not e!121383))))

(declare-fun b!184405 () Bool)

(declare-fun res!87254 () Bool)

(assert (=> b!184405 (=> (not res!87254) (not e!121384))))

(declare-fun e!121385 () Bool)

(assert (=> b!184405 (= res!87254 e!121385)))

(declare-fun c!33068 () Bool)

(assert (=> b!184405 (= c!33068 (not (= (bvand (extraKeys!3501 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18610 () Bool)

(assert (=> bm!18610 (= call!18615 call!18610)))

(declare-fun b!184406 () Bool)

(assert (=> b!184406 (= e!121384 e!121391)))

(declare-fun c!33063 () Bool)

(assert (=> b!184406 (= c!33063 (not (= (bvand (extraKeys!3501 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184407 () Bool)

(assert (=> b!184407 (= e!121383 (= (apply!162 lt!91195 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3605 thiss!1248)))))

(declare-fun b!184408 () Bool)

(assert (=> b!184408 (= e!121385 e!121381)))

(declare-fun res!87259 () Bool)

(declare-fun call!18611 () Bool)

(assert (=> b!184408 (= res!87259 call!18611)))

(assert (=> b!184408 (=> (not res!87259) (not e!121381))))

(declare-fun b!184409 () Bool)

(assert (=> b!184409 (= e!121391 (not call!18612))))

(declare-fun b!184410 () Bool)

(assert (=> b!184410 (= e!121387 e!121380)))

(declare-fun res!87256 () Bool)

(assert (=> b!184410 (=> (not res!87256) (not e!121380))))

(assert (=> b!184410 (= res!87256 (contains!1279 lt!91195 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184410 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))

(declare-fun d!54905 () Bool)

(assert (=> d!54905 e!121384))

(declare-fun res!87251 () Bool)

(assert (=> d!54905 (=> (not res!87251) (not e!121384))))

(assert (=> d!54905 (= res!87251 (or (bvsge #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))))

(declare-fun lt!91197 () ListLongMap!2347)

(assert (=> d!54905 (= lt!91195 lt!91197)))

(declare-fun lt!91202 () Unit!5568)

(assert (=> d!54905 (= lt!91202 e!121390)))

(declare-fun c!33065 () Bool)

(declare-fun e!121382 () Bool)

(assert (=> d!54905 (= c!33065 e!121382)))

(declare-fun res!87253 () Bool)

(assert (=> d!54905 (=> (not res!87253) (not e!121382))))

(assert (=> d!54905 (= res!87253 (bvslt #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))

(assert (=> d!54905 (= lt!91197 e!121389)))

(assert (=> d!54905 (= c!33064 (and (not (= (bvand (extraKeys!3501 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3501 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54905 (validMask!0 (mask!8846 thiss!1248))))

(assert (=> d!54905 (= (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)) lt!91195)))

(declare-fun b!184411 () Bool)

(assert (=> b!184411 (= e!121382 (validKeyInArray!0 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18611 () Bool)

(assert (=> bm!18611 (= call!18614 call!18616)))

(declare-fun bm!18612 () Bool)

(assert (=> bm!18612 (= call!18611 (contains!1279 lt!91195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184412 () Bool)

(assert (=> b!184412 (= e!121385 (not call!18611))))

(declare-fun b!184413 () Bool)

(declare-fun c!33067 () Bool)

(assert (=> b!184413 (= c!33067 (and (not (= (bvand (extraKeys!3501 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3501 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!184413 (= e!121388 e!121386)))

(declare-fun b!184414 () Bool)

(assert (=> b!184414 (= e!121389 (+!282 call!18610 (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248))))))

(declare-fun b!184415 () Bool)

(assert (=> b!184415 (= e!121386 call!18615)))

(declare-fun bm!18613 () Bool)

(assert (=> bm!18613 (= call!18616 call!18613)))

(assert (= (and d!54905 c!33064) b!184414))

(assert (= (and d!54905 (not c!33064)) b!184397))

(assert (= (and b!184397 c!33066) b!184398))

(assert (= (and b!184397 (not c!33066)) b!184413))

(assert (= (and b!184413 c!33067) b!184415))

(assert (= (and b!184413 (not c!33067)) b!184399))

(assert (= (or b!184415 b!184399) bm!18611))

(assert (= (or b!184398 bm!18611) bm!18613))

(assert (= (or b!184398 b!184415) bm!18610))

(assert (= (or b!184414 bm!18613) bm!18609))

(assert (= (or b!184414 bm!18610) bm!18607))

(assert (= (and d!54905 res!87253) b!184411))

(assert (= (and d!54905 c!33065) b!184395))

(assert (= (and d!54905 (not c!33065)) b!184396))

(assert (= (and d!54905 res!87251) b!184403))

(assert (= (and b!184403 res!87258) b!184402))

(assert (= (and b!184403 (not res!87257)) b!184410))

(assert (= (and b!184410 res!87256) b!184401))

(assert (= (and b!184403 res!87255) b!184405))

(assert (= (and b!184405 c!33068) b!184408))

(assert (= (and b!184405 (not c!33068)) b!184412))

(assert (= (and b!184408 res!87259) b!184400))

(assert (= (or b!184408 b!184412) bm!18612))

(assert (= (and b!184405 res!87254) b!184406))

(assert (= (and b!184406 c!33063) b!184404))

(assert (= (and b!184406 (not c!33063)) b!184409))

(assert (= (and b!184404 res!87252) b!184407))

(assert (= (or b!184404 b!184409) bm!18608))

(declare-fun b_lambda!7219 () Bool)

(assert (=> (not b_lambda!7219) (not b!184401)))

(declare-fun t!7222 () Bool)

(declare-fun tb!2835 () Bool)

(assert (=> (and b!184307 (= (defaultEntry!3764 thiss!1248) (defaultEntry!3764 thiss!1248)) t!7222) tb!2835))

(declare-fun result!4783 () Bool)

(assert (=> tb!2835 (= result!4783 tp_is_empty!4317)))

(assert (=> b!184401 t!7222))

(declare-fun b_and!11133 () Bool)

(assert (= b_and!11129 (and (=> t!7222 result!4783) b_and!11133)))

(declare-fun m!211745 () Bool)

(assert (=> b!184401 m!211745))

(declare-fun m!211747 () Bool)

(assert (=> b!184401 m!211747))

(declare-fun m!211749 () Bool)

(assert (=> b!184401 m!211749))

(declare-fun m!211751 () Bool)

(assert (=> b!184401 m!211751))

(declare-fun m!211753 () Bool)

(assert (=> b!184401 m!211753))

(assert (=> b!184401 m!211745))

(assert (=> b!184401 m!211747))

(assert (=> b!184401 m!211751))

(declare-fun m!211755 () Bool)

(assert (=> bm!18612 m!211755))

(declare-fun m!211757 () Bool)

(assert (=> bm!18609 m!211757))

(assert (=> b!184410 m!211751))

(assert (=> b!184410 m!211751))

(declare-fun m!211759 () Bool)

(assert (=> b!184410 m!211759))

(declare-fun m!211761 () Bool)

(assert (=> b!184414 m!211761))

(assert (=> b!184411 m!211751))

(assert (=> b!184411 m!211751))

(declare-fun m!211763 () Bool)

(assert (=> b!184411 m!211763))

(assert (=> d!54905 m!211701))

(assert (=> b!184402 m!211751))

(assert (=> b!184402 m!211751))

(assert (=> b!184402 m!211763))

(declare-fun m!211765 () Bool)

(assert (=> b!184400 m!211765))

(declare-fun m!211767 () Bool)

(assert (=> bm!18608 m!211767))

(declare-fun m!211769 () Bool)

(assert (=> bm!18607 m!211769))

(declare-fun m!211771 () Bool)

(assert (=> b!184407 m!211771))

(assert (=> b!184395 m!211757))

(declare-fun m!211773 () Bool)

(assert (=> b!184395 m!211773))

(declare-fun m!211775 () Bool)

(assert (=> b!184395 m!211775))

(declare-fun m!211777 () Bool)

(assert (=> b!184395 m!211777))

(declare-fun m!211779 () Bool)

(assert (=> b!184395 m!211779))

(declare-fun m!211781 () Bool)

(assert (=> b!184395 m!211781))

(declare-fun m!211783 () Bool)

(assert (=> b!184395 m!211783))

(declare-fun m!211785 () Bool)

(assert (=> b!184395 m!211785))

(assert (=> b!184395 m!211777))

(declare-fun m!211787 () Bool)

(assert (=> b!184395 m!211787))

(declare-fun m!211789 () Bool)

(assert (=> b!184395 m!211789))

(declare-fun m!211791 () Bool)

(assert (=> b!184395 m!211791))

(declare-fun m!211793 () Bool)

(assert (=> b!184395 m!211793))

(declare-fun m!211795 () Bool)

(assert (=> b!184395 m!211795))

(assert (=> b!184395 m!211785))

(declare-fun m!211797 () Bool)

(assert (=> b!184395 m!211797))

(assert (=> b!184395 m!211751))

(assert (=> b!184395 m!211783))

(declare-fun m!211799 () Bool)

(assert (=> b!184395 m!211799))

(assert (=> b!184395 m!211781))

(declare-fun m!211801 () Bool)

(assert (=> b!184395 m!211801))

(assert (=> b!184305 d!54905))

(declare-fun d!54907 () Bool)

(assert (=> d!54907 (= (array_inv!2395 (_keys!5691 thiss!1248)) (bvsge (size!4015 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184307 d!54907))

(declare-fun d!54909 () Bool)

(assert (=> d!54909 (= (array_inv!2396 (_values!3747 thiss!1248)) (bvsge (size!4016 (_values!3747 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184307 d!54909))

(declare-fun b!184430 () Bool)

(declare-fun lt!91220 () SeekEntryResult!627)

(declare-fun e!121400 () SeekEntryResult!627)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7833 (_ BitVec 32)) SeekEntryResult!627)

(assert (=> b!184430 (= e!121400 (seekKeyOrZeroReturnVacant!0 (x!20051 lt!91220) (index!4680 lt!91220) (index!4680 lt!91220) key!828 (_keys!5691 thiss!1248) (mask!8846 thiss!1248)))))

(declare-fun b!184431 () Bool)

(declare-fun c!33077 () Bool)

(declare-fun lt!91219 () (_ BitVec 64))

(assert (=> b!184431 (= c!33077 (= lt!91219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!121399 () SeekEntryResult!627)

(assert (=> b!184431 (= e!121399 e!121400)))

(declare-fun b!184432 () Bool)

(assert (=> b!184432 (= e!121400 (MissingZero!627 (index!4680 lt!91220)))))

(declare-fun b!184433 () Bool)

(declare-fun e!121401 () SeekEntryResult!627)

(assert (=> b!184433 (= e!121401 e!121399)))

(assert (=> b!184433 (= lt!91219 (select (arr!3701 (_keys!5691 thiss!1248)) (index!4680 lt!91220)))))

(declare-fun c!33075 () Bool)

(assert (=> b!184433 (= c!33075 (= lt!91219 key!828))))

(declare-fun b!184434 () Bool)

(assert (=> b!184434 (= e!121401 Undefined!627)))

(declare-fun d!54911 () Bool)

(declare-fun lt!91218 () SeekEntryResult!627)

(assert (=> d!54911 (and (or ((_ is Undefined!627) lt!91218) (not ((_ is Found!627) lt!91218)) (and (bvsge (index!4679 lt!91218) #b00000000000000000000000000000000) (bvslt (index!4679 lt!91218) (size!4015 (_keys!5691 thiss!1248))))) (or ((_ is Undefined!627) lt!91218) ((_ is Found!627) lt!91218) (not ((_ is MissingZero!627) lt!91218)) (and (bvsge (index!4678 lt!91218) #b00000000000000000000000000000000) (bvslt (index!4678 lt!91218) (size!4015 (_keys!5691 thiss!1248))))) (or ((_ is Undefined!627) lt!91218) ((_ is Found!627) lt!91218) ((_ is MissingZero!627) lt!91218) (not ((_ is MissingVacant!627) lt!91218)) (and (bvsge (index!4681 lt!91218) #b00000000000000000000000000000000) (bvslt (index!4681 lt!91218) (size!4015 (_keys!5691 thiss!1248))))) (or ((_ is Undefined!627) lt!91218) (ite ((_ is Found!627) lt!91218) (= (select (arr!3701 (_keys!5691 thiss!1248)) (index!4679 lt!91218)) key!828) (ite ((_ is MissingZero!627) lt!91218) (= (select (arr!3701 (_keys!5691 thiss!1248)) (index!4678 lt!91218)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!627) lt!91218) (= (select (arr!3701 (_keys!5691 thiss!1248)) (index!4681 lt!91218)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54911 (= lt!91218 e!121401)))

(declare-fun c!33076 () Bool)

(assert (=> d!54911 (= c!33076 (and ((_ is Intermediate!627) lt!91220) (undefined!1439 lt!91220)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7833 (_ BitVec 32)) SeekEntryResult!627)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54911 (= lt!91220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8846 thiss!1248)) key!828 (_keys!5691 thiss!1248) (mask!8846 thiss!1248)))))

(assert (=> d!54911 (validMask!0 (mask!8846 thiss!1248))))

(assert (=> d!54911 (= (seekEntryOrOpen!0 key!828 (_keys!5691 thiss!1248) (mask!8846 thiss!1248)) lt!91218)))

(declare-fun b!184435 () Bool)

(assert (=> b!184435 (= e!121399 (Found!627 (index!4680 lt!91220)))))

(assert (= (and d!54911 c!33076) b!184434))

(assert (= (and d!54911 (not c!33076)) b!184433))

(assert (= (and b!184433 c!33075) b!184435))

(assert (= (and b!184433 (not c!33075)) b!184431))

(assert (= (and b!184431 c!33077) b!184432))

(assert (= (and b!184431 (not c!33077)) b!184430))

(declare-fun m!211803 () Bool)

(assert (=> b!184430 m!211803))

(declare-fun m!211805 () Bool)

(assert (=> b!184433 m!211805))

(declare-fun m!211807 () Bool)

(assert (=> d!54911 m!211807))

(declare-fun m!211809 () Bool)

(assert (=> d!54911 m!211809))

(declare-fun m!211811 () Bool)

(assert (=> d!54911 m!211811))

(declare-fun m!211813 () Bool)

(assert (=> d!54911 m!211813))

(assert (=> d!54911 m!211809))

(declare-fun m!211815 () Bool)

(assert (=> d!54911 m!211815))

(assert (=> d!54911 m!211701))

(assert (=> b!184304 d!54911))

(declare-fun condMapEmpty!7426 () Bool)

(declare-fun mapDefault!7426 () ValueCell!1815)

(assert (=> mapNonEmpty!7420 (= condMapEmpty!7426 (= mapRest!7420 ((as const (Array (_ BitVec 32) ValueCell!1815)) mapDefault!7426)))))

(declare-fun e!121406 () Bool)

(declare-fun mapRes!7426 () Bool)

(assert (=> mapNonEmpty!7420 (= tp!16416 (and e!121406 mapRes!7426))))

(declare-fun mapNonEmpty!7426 () Bool)

(declare-fun tp!16426 () Bool)

(declare-fun e!121407 () Bool)

(assert (=> mapNonEmpty!7426 (= mapRes!7426 (and tp!16426 e!121407))))

(declare-fun mapRest!7426 () (Array (_ BitVec 32) ValueCell!1815))

(declare-fun mapValue!7426 () ValueCell!1815)

(declare-fun mapKey!7426 () (_ BitVec 32))

(assert (=> mapNonEmpty!7426 (= mapRest!7420 (store mapRest!7426 mapKey!7426 mapValue!7426))))

(declare-fun b!184442 () Bool)

(assert (=> b!184442 (= e!121407 tp_is_empty!4317)))

(declare-fun mapIsEmpty!7426 () Bool)

(assert (=> mapIsEmpty!7426 mapRes!7426))

(declare-fun b!184443 () Bool)

(assert (=> b!184443 (= e!121406 tp_is_empty!4317)))

(assert (= (and mapNonEmpty!7420 condMapEmpty!7426) mapIsEmpty!7426))

(assert (= (and mapNonEmpty!7420 (not condMapEmpty!7426)) mapNonEmpty!7426))

(assert (= (and mapNonEmpty!7426 ((_ is ValueCellFull!1815) mapValue!7426)) b!184442))

(assert (= (and mapNonEmpty!7420 ((_ is ValueCellFull!1815) mapDefault!7426)) b!184443))

(declare-fun m!211817 () Bool)

(assert (=> mapNonEmpty!7426 m!211817))

(declare-fun b_lambda!7221 () Bool)

(assert (= b_lambda!7219 (or (and b!184307 b_free!4545) b_lambda!7221)))

(check-sat b_and!11133 (not b!184352) (not d!54905) (not bm!18607) tp_is_empty!4317 (not b!184401) (not d!54901) (not b!184343) (not b!184400) (not b!184430) (not b!184350) (not d!54903) (not b!184341) (not b!184411) (not b!184410) (not bm!18608) (not bm!18609) (not b!184395) (not bm!18612) (not b_lambda!7221) (not b!184407) (not b!184402) (not b!184414) (not b_next!4545) (not d!54911) (not mapNonEmpty!7426) (not b!184342))
(check-sat b_and!11133 (not b_next!4545))
(get-model)

(declare-fun d!54913 () Bool)

(assert (=> d!54913 (= (apply!162 (+!282 lt!91191 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248))) lt!91192) (apply!162 lt!91191 lt!91192))))

(declare-fun lt!91223 () Unit!5568)

(declare-fun choose!976 (ListLongMap!2347 (_ BitVec 64) V!5403 (_ BitVec 64)) Unit!5568)

(assert (=> d!54913 (= lt!91223 (choose!976 lt!91191 lt!91208 (zeroValue!3605 thiss!1248) lt!91192))))

(declare-fun e!121410 () Bool)

(assert (=> d!54913 e!121410))

(declare-fun res!87262 () Bool)

(assert (=> d!54913 (=> (not res!87262) (not e!121410))))

(assert (=> d!54913 (= res!87262 (contains!1279 lt!91191 lt!91192))))

(assert (=> d!54913 (= (addApplyDifferent!138 lt!91191 lt!91208 (zeroValue!3605 thiss!1248) lt!91192) lt!91223)))

(declare-fun b!184447 () Bool)

(assert (=> b!184447 (= e!121410 (not (= lt!91192 lt!91208)))))

(assert (= (and d!54913 res!87262) b!184447))

(assert (=> d!54913 m!211791))

(declare-fun m!211819 () Bool)

(assert (=> d!54913 m!211819))

(assert (=> d!54913 m!211777))

(assert (=> d!54913 m!211779))

(assert (=> d!54913 m!211777))

(declare-fun m!211821 () Bool)

(assert (=> d!54913 m!211821))

(assert (=> b!184395 d!54913))

(declare-fun b!184472 () Bool)

(declare-fun e!121431 () Bool)

(declare-fun e!121426 () Bool)

(assert (=> b!184472 (= e!121431 e!121426)))

(declare-fun c!33088 () Bool)

(declare-fun e!121427 () Bool)

(assert (=> b!184472 (= c!33088 e!121427)))

(declare-fun res!87271 () Bool)

(assert (=> b!184472 (=> (not res!87271) (not e!121427))))

(assert (=> b!184472 (= res!87271 (bvslt #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))

(declare-fun b!184473 () Bool)

(declare-fun e!121429 () ListLongMap!2347)

(declare-fun e!121425 () ListLongMap!2347)

(assert (=> b!184473 (= e!121429 e!121425)))

(declare-fun c!33087 () Bool)

(assert (=> b!184473 (= c!33087 (validKeyInArray!0 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184474 () Bool)

(assert (=> b!184474 (= e!121429 (ListLongMap!2348 Nil!2342))))

(declare-fun b!184475 () Bool)

(declare-fun call!18619 () ListLongMap!2347)

(assert (=> b!184475 (= e!121425 call!18619)))

(declare-fun b!184476 () Bool)

(declare-fun e!121430 () Bool)

(assert (=> b!184476 (= e!121426 e!121430)))

(assert (=> b!184476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))

(declare-fun res!87273 () Bool)

(declare-fun lt!91244 () ListLongMap!2347)

(assert (=> b!184476 (= res!87273 (contains!1279 lt!91244 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184476 (=> (not res!87273) (not e!121430))))

(declare-fun b!184477 () Bool)

(assert (=> b!184477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))

(assert (=> b!184477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4016 (_values!3747 thiss!1248))))))

(assert (=> b!184477 (= e!121430 (= (apply!162 lt!91244 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)) (get!2123 (select (arr!3702 (_values!3747 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3764 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!184478 () Bool)

(declare-fun e!121428 () Bool)

(declare-fun isEmpty!467 (ListLongMap!2347) Bool)

(assert (=> b!184478 (= e!121428 (isEmpty!467 lt!91244))))

(declare-fun b!184479 () Bool)

(declare-fun lt!91238 () Unit!5568)

(declare-fun lt!91239 () Unit!5568)

(assert (=> b!184479 (= lt!91238 lt!91239)))

(declare-fun lt!91240 () V!5403)

(declare-fun lt!91243 () ListLongMap!2347)

(declare-fun lt!91242 () (_ BitVec 64))

(declare-fun lt!91241 () (_ BitVec 64))

(assert (=> b!184479 (not (contains!1279 (+!282 lt!91243 (tuple2!3431 lt!91242 lt!91240)) lt!91241))))

(declare-fun addStillNotContains!87 (ListLongMap!2347 (_ BitVec 64) V!5403 (_ BitVec 64)) Unit!5568)

(assert (=> b!184479 (= lt!91239 (addStillNotContains!87 lt!91243 lt!91242 lt!91240 lt!91241))))

(assert (=> b!184479 (= lt!91241 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!184479 (= lt!91240 (get!2123 (select (arr!3702 (_values!3747 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3764 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184479 (= lt!91242 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184479 (= lt!91243 call!18619)))

(assert (=> b!184479 (= e!121425 (+!282 call!18619 (tuple2!3431 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000) (get!2123 (select (arr!3702 (_values!3747 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3764 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!184480 () Bool)

(assert (=> b!184480 (= e!121428 (= lt!91244 (getCurrentListMapNoExtraKeys!195 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3764 thiss!1248))))))

(declare-fun b!184481 () Bool)

(declare-fun res!87272 () Bool)

(assert (=> b!184481 (=> (not res!87272) (not e!121431))))

(assert (=> b!184481 (= res!87272 (not (contains!1279 lt!91244 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184482 () Bool)

(assert (=> b!184482 (= e!121427 (validKeyInArray!0 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184482 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!54915 () Bool)

(assert (=> d!54915 e!121431))

(declare-fun res!87274 () Bool)

(assert (=> d!54915 (=> (not res!87274) (not e!121431))))

(assert (=> d!54915 (= res!87274 (not (contains!1279 lt!91244 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54915 (= lt!91244 e!121429)))

(declare-fun c!33089 () Bool)

(assert (=> d!54915 (= c!33089 (bvsge #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))

(assert (=> d!54915 (validMask!0 (mask!8846 thiss!1248))))

(assert (=> d!54915 (= (getCurrentListMapNoExtraKeys!195 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)) lt!91244)))

(declare-fun bm!18616 () Bool)

(assert (=> bm!18616 (= call!18619 (getCurrentListMapNoExtraKeys!195 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3764 thiss!1248)))))

(declare-fun b!184483 () Bool)

(assert (=> b!184483 (= e!121426 e!121428)))

(declare-fun c!33086 () Bool)

(assert (=> b!184483 (= c!33086 (bvslt #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))

(assert (= (and d!54915 c!33089) b!184474))

(assert (= (and d!54915 (not c!33089)) b!184473))

(assert (= (and b!184473 c!33087) b!184479))

(assert (= (and b!184473 (not c!33087)) b!184475))

(assert (= (or b!184479 b!184475) bm!18616))

(assert (= (and d!54915 res!87274) b!184481))

(assert (= (and b!184481 res!87272) b!184472))

(assert (= (and b!184472 res!87271) b!184482))

(assert (= (and b!184472 c!33088) b!184476))

(assert (= (and b!184472 (not c!33088)) b!184483))

(assert (= (and b!184476 res!87273) b!184477))

(assert (= (and b!184483 c!33086) b!184480))

(assert (= (and b!184483 (not c!33086)) b!184478))

(declare-fun b_lambda!7223 () Bool)

(assert (=> (not b_lambda!7223) (not b!184477)))

(assert (=> b!184477 t!7222))

(declare-fun b_and!11135 () Bool)

(assert (= b_and!11133 (and (=> t!7222 result!4783) b_and!11135)))

(declare-fun b_lambda!7225 () Bool)

(assert (=> (not b_lambda!7225) (not b!184479)))

(assert (=> b!184479 t!7222))

(declare-fun b_and!11137 () Bool)

(assert (= b_and!11135 (and (=> t!7222 result!4783) b_and!11137)))

(assert (=> b!184482 m!211751))

(assert (=> b!184482 m!211751))

(assert (=> b!184482 m!211763))

(assert (=> b!184476 m!211751))

(assert (=> b!184476 m!211751))

(declare-fun m!211823 () Bool)

(assert (=> b!184476 m!211823))

(declare-fun m!211825 () Bool)

(assert (=> d!54915 m!211825))

(assert (=> d!54915 m!211701))

(declare-fun m!211827 () Bool)

(assert (=> b!184481 m!211827))

(declare-fun m!211829 () Bool)

(assert (=> b!184478 m!211829))

(declare-fun m!211831 () Bool)

(assert (=> bm!18616 m!211831))

(assert (=> b!184480 m!211831))

(assert (=> b!184479 m!211745))

(assert (=> b!184479 m!211747))

(assert (=> b!184479 m!211749))

(declare-fun m!211833 () Bool)

(assert (=> b!184479 m!211833))

(declare-fun m!211835 () Bool)

(assert (=> b!184479 m!211835))

(assert (=> b!184479 m!211745))

(assert (=> b!184479 m!211833))

(declare-fun m!211837 () Bool)

(assert (=> b!184479 m!211837))

(assert (=> b!184479 m!211747))

(assert (=> b!184479 m!211751))

(declare-fun m!211839 () Bool)

(assert (=> b!184479 m!211839))

(assert (=> b!184477 m!211745))

(assert (=> b!184477 m!211747))

(assert (=> b!184477 m!211749))

(assert (=> b!184477 m!211751))

(assert (=> b!184477 m!211751))

(declare-fun m!211841 () Bool)

(assert (=> b!184477 m!211841))

(assert (=> b!184477 m!211745))

(assert (=> b!184477 m!211747))

(assert (=> b!184473 m!211751))

(assert (=> b!184473 m!211751))

(assert (=> b!184473 m!211763))

(assert (=> b!184395 d!54915))

(declare-fun d!54917 () Bool)

(declare-fun get!2124 (Option!225) V!5403)

(assert (=> d!54917 (= (apply!162 lt!91191 lt!91192) (get!2124 (getValueByKey!219 (toList!1189 lt!91191) lt!91192)))))

(declare-fun bs!7485 () Bool)

(assert (= bs!7485 d!54917))

(declare-fun m!211843 () Bool)

(assert (=> bs!7485 m!211843))

(assert (=> bs!7485 m!211843))

(declare-fun m!211845 () Bool)

(assert (=> bs!7485 m!211845))

(assert (=> b!184395 d!54917))

(declare-fun d!54919 () Bool)

(declare-fun e!121434 () Bool)

(assert (=> d!54919 e!121434))

(declare-fun res!87280 () Bool)

(assert (=> d!54919 (=> (not res!87280) (not e!121434))))

(declare-fun lt!91253 () ListLongMap!2347)

(assert (=> d!54919 (= res!87280 (contains!1279 lt!91253 (_1!1726 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248)))))))

(declare-fun lt!91256 () List!2345)

(assert (=> d!54919 (= lt!91253 (ListLongMap!2348 lt!91256))))

(declare-fun lt!91255 () Unit!5568)

(declare-fun lt!91254 () Unit!5568)

(assert (=> d!54919 (= lt!91255 lt!91254)))

(assert (=> d!54919 (= (getValueByKey!219 lt!91256 (_1!1726 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248)))) (Some!224 (_2!1726 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!115 (List!2345 (_ BitVec 64) V!5403) Unit!5568)

(assert (=> d!54919 (= lt!91254 (lemmaContainsTupThenGetReturnValue!115 lt!91256 (_1!1726 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248))) (_2!1726 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248)))))))

(declare-fun insertStrictlySorted!118 (List!2345 (_ BitVec 64) V!5403) List!2345)

(assert (=> d!54919 (= lt!91256 (insertStrictlySorted!118 (toList!1189 lt!91191) (_1!1726 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248))) (_2!1726 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248)))))))

(assert (=> d!54919 (= (+!282 lt!91191 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248))) lt!91253)))

(declare-fun b!184488 () Bool)

(declare-fun res!87279 () Bool)

(assert (=> b!184488 (=> (not res!87279) (not e!121434))))

(assert (=> b!184488 (= res!87279 (= (getValueByKey!219 (toList!1189 lt!91253) (_1!1726 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248)))) (Some!224 (_2!1726 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248))))))))

(declare-fun b!184489 () Bool)

(declare-fun contains!1281 (List!2345 tuple2!3430) Bool)

(assert (=> b!184489 (= e!121434 (contains!1281 (toList!1189 lt!91253) (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248))))))

(assert (= (and d!54919 res!87280) b!184488))

(assert (= (and b!184488 res!87279) b!184489))

(declare-fun m!211847 () Bool)

(assert (=> d!54919 m!211847))

(declare-fun m!211849 () Bool)

(assert (=> d!54919 m!211849))

(declare-fun m!211851 () Bool)

(assert (=> d!54919 m!211851))

(declare-fun m!211853 () Bool)

(assert (=> d!54919 m!211853))

(declare-fun m!211855 () Bool)

(assert (=> b!184488 m!211855))

(declare-fun m!211857 () Bool)

(assert (=> b!184489 m!211857))

(assert (=> b!184395 d!54919))

(declare-fun d!54921 () Bool)

(declare-fun e!121435 () Bool)

(assert (=> d!54921 e!121435))

(declare-fun res!87281 () Bool)

(assert (=> d!54921 (=> res!87281 e!121435)))

(declare-fun lt!91257 () Bool)

(assert (=> d!54921 (= res!87281 (not lt!91257))))

(declare-fun lt!91258 () Bool)

(assert (=> d!54921 (= lt!91257 lt!91258)))

(declare-fun lt!91259 () Unit!5568)

(declare-fun e!121436 () Unit!5568)

(assert (=> d!54921 (= lt!91259 e!121436)))

(declare-fun c!33090 () Bool)

(assert (=> d!54921 (= c!33090 lt!91258)))

(assert (=> d!54921 (= lt!91258 (containsKey!223 (toList!1189 (+!282 lt!91199 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248)))) lt!91211))))

(assert (=> d!54921 (= (contains!1279 (+!282 lt!91199 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248))) lt!91211) lt!91257)))

(declare-fun b!184490 () Bool)

(declare-fun lt!91260 () Unit!5568)

(assert (=> b!184490 (= e!121436 lt!91260)))

(assert (=> b!184490 (= lt!91260 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1189 (+!282 lt!91199 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248)))) lt!91211))))

(assert (=> b!184490 (isDefined!172 (getValueByKey!219 (toList!1189 (+!282 lt!91199 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248)))) lt!91211))))

(declare-fun b!184491 () Bool)

(declare-fun Unit!5572 () Unit!5568)

(assert (=> b!184491 (= e!121436 Unit!5572)))

(declare-fun b!184492 () Bool)

(assert (=> b!184492 (= e!121435 (isDefined!172 (getValueByKey!219 (toList!1189 (+!282 lt!91199 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248)))) lt!91211)))))

(assert (= (and d!54921 c!33090) b!184490))

(assert (= (and d!54921 (not c!33090)) b!184491))

(assert (= (and d!54921 (not res!87281)) b!184492))

(declare-fun m!211859 () Bool)

(assert (=> d!54921 m!211859))

(declare-fun m!211861 () Bool)

(assert (=> b!184490 m!211861))

(declare-fun m!211863 () Bool)

(assert (=> b!184490 m!211863))

(assert (=> b!184490 m!211863))

(declare-fun m!211865 () Bool)

(assert (=> b!184490 m!211865))

(assert (=> b!184492 m!211863))

(assert (=> b!184492 m!211863))

(assert (=> b!184492 m!211865))

(assert (=> b!184395 d!54921))

(declare-fun d!54923 () Bool)

(assert (=> d!54923 (= (apply!162 (+!282 lt!91190 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248))) lt!91205) (get!2124 (getValueByKey!219 (toList!1189 (+!282 lt!91190 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248)))) lt!91205)))))

(declare-fun bs!7486 () Bool)

(assert (= bs!7486 d!54923))

(declare-fun m!211867 () Bool)

(assert (=> bs!7486 m!211867))

(assert (=> bs!7486 m!211867))

(declare-fun m!211869 () Bool)

(assert (=> bs!7486 m!211869))

(assert (=> b!184395 d!54923))

(declare-fun d!54925 () Bool)

(declare-fun e!121437 () Bool)

(assert (=> d!54925 e!121437))

(declare-fun res!87283 () Bool)

(assert (=> d!54925 (=> (not res!87283) (not e!121437))))

(declare-fun lt!91261 () ListLongMap!2347)

(assert (=> d!54925 (= res!87283 (contains!1279 lt!91261 (_1!1726 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248)))))))

(declare-fun lt!91264 () List!2345)

(assert (=> d!54925 (= lt!91261 (ListLongMap!2348 lt!91264))))

(declare-fun lt!91263 () Unit!5568)

(declare-fun lt!91262 () Unit!5568)

(assert (=> d!54925 (= lt!91263 lt!91262)))

(assert (=> d!54925 (= (getValueByKey!219 lt!91264 (_1!1726 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248)))) (Some!224 (_2!1726 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248)))))))

(assert (=> d!54925 (= lt!91262 (lemmaContainsTupThenGetReturnValue!115 lt!91264 (_1!1726 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248))) (_2!1726 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248)))))))

(assert (=> d!54925 (= lt!91264 (insertStrictlySorted!118 (toList!1189 lt!91199) (_1!1726 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248))) (_2!1726 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248)))))))

(assert (=> d!54925 (= (+!282 lt!91199 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248))) lt!91261)))

(declare-fun b!184493 () Bool)

(declare-fun res!87282 () Bool)

(assert (=> b!184493 (=> (not res!87282) (not e!121437))))

(assert (=> b!184493 (= res!87282 (= (getValueByKey!219 (toList!1189 lt!91261) (_1!1726 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248)))) (Some!224 (_2!1726 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248))))))))

(declare-fun b!184494 () Bool)

(assert (=> b!184494 (= e!121437 (contains!1281 (toList!1189 lt!91261) (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248))))))

(assert (= (and d!54925 res!87283) b!184493))

(assert (= (and b!184493 res!87282) b!184494))

(declare-fun m!211871 () Bool)

(assert (=> d!54925 m!211871))

(declare-fun m!211873 () Bool)

(assert (=> d!54925 m!211873))

(declare-fun m!211875 () Bool)

(assert (=> d!54925 m!211875))

(declare-fun m!211877 () Bool)

(assert (=> d!54925 m!211877))

(declare-fun m!211879 () Bool)

(assert (=> b!184493 m!211879))

(declare-fun m!211881 () Bool)

(assert (=> b!184494 m!211881))

(assert (=> b!184395 d!54925))

(declare-fun d!54927 () Bool)

(assert (=> d!54927 (= (apply!162 (+!282 lt!91191 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248))) lt!91192) (get!2124 (getValueByKey!219 (toList!1189 (+!282 lt!91191 (tuple2!3431 lt!91208 (zeroValue!3605 thiss!1248)))) lt!91192)))))

(declare-fun bs!7487 () Bool)

(assert (= bs!7487 d!54927))

(declare-fun m!211883 () Bool)

(assert (=> bs!7487 m!211883))

(assert (=> bs!7487 m!211883))

(declare-fun m!211885 () Bool)

(assert (=> bs!7487 m!211885))

(assert (=> b!184395 d!54927))

(declare-fun d!54929 () Bool)

(assert (=> d!54929 (contains!1279 (+!282 lt!91199 (tuple2!3431 lt!91200 (zeroValue!3605 thiss!1248))) lt!91211)))

(declare-fun lt!91267 () Unit!5568)

(declare-fun choose!977 (ListLongMap!2347 (_ BitVec 64) V!5403 (_ BitVec 64)) Unit!5568)

(assert (=> d!54929 (= lt!91267 (choose!977 lt!91199 lt!91200 (zeroValue!3605 thiss!1248) lt!91211))))

(assert (=> d!54929 (contains!1279 lt!91199 lt!91211)))

(assert (=> d!54929 (= (addStillContains!138 lt!91199 lt!91200 (zeroValue!3605 thiss!1248) lt!91211) lt!91267)))

(declare-fun bs!7488 () Bool)

(assert (= bs!7488 d!54929))

(assert (=> bs!7488 m!211783))

(assert (=> bs!7488 m!211783))

(assert (=> bs!7488 m!211799))

(declare-fun m!211887 () Bool)

(assert (=> bs!7488 m!211887))

(declare-fun m!211889 () Bool)

(assert (=> bs!7488 m!211889))

(assert (=> b!184395 d!54929))

(declare-fun d!54931 () Bool)

(assert (=> d!54931 (= (apply!162 (+!282 lt!91190 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248))) lt!91205) (apply!162 lt!91190 lt!91205))))

(declare-fun lt!91268 () Unit!5568)

(assert (=> d!54931 (= lt!91268 (choose!976 lt!91190 lt!91201 (minValue!3605 thiss!1248) lt!91205))))

(declare-fun e!121438 () Bool)

(assert (=> d!54931 e!121438))

(declare-fun res!87284 () Bool)

(assert (=> d!54931 (=> (not res!87284) (not e!121438))))

(assert (=> d!54931 (= res!87284 (contains!1279 lt!91190 lt!91205))))

(assert (=> d!54931 (= (addApplyDifferent!138 lt!91190 lt!91201 (minValue!3605 thiss!1248) lt!91205) lt!91268)))

(declare-fun b!184496 () Bool)

(assert (=> b!184496 (= e!121438 (not (= lt!91205 lt!91201)))))

(assert (= (and d!54931 res!87284) b!184496))

(assert (=> d!54931 m!211789))

(declare-fun m!211891 () Bool)

(assert (=> d!54931 m!211891))

(assert (=> d!54931 m!211781))

(assert (=> d!54931 m!211801))

(assert (=> d!54931 m!211781))

(declare-fun m!211893 () Bool)

(assert (=> d!54931 m!211893))

(assert (=> b!184395 d!54931))

(declare-fun d!54933 () Bool)

(assert (=> d!54933 (= (apply!162 (+!282 lt!91203 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248))) lt!91206) (apply!162 lt!91203 lt!91206))))

(declare-fun lt!91269 () Unit!5568)

(assert (=> d!54933 (= lt!91269 (choose!976 lt!91203 lt!91210 (minValue!3605 thiss!1248) lt!91206))))

(declare-fun e!121439 () Bool)

(assert (=> d!54933 e!121439))

(declare-fun res!87285 () Bool)

(assert (=> d!54933 (=> (not res!87285) (not e!121439))))

(assert (=> d!54933 (= res!87285 (contains!1279 lt!91203 lt!91206))))

(assert (=> d!54933 (= (addApplyDifferent!138 lt!91203 lt!91210 (minValue!3605 thiss!1248) lt!91206) lt!91269)))

(declare-fun b!184497 () Bool)

(assert (=> b!184497 (= e!121439 (not (= lt!91206 lt!91210)))))

(assert (= (and d!54933 res!87285) b!184497))

(assert (=> d!54933 m!211793))

(declare-fun m!211895 () Bool)

(assert (=> d!54933 m!211895))

(assert (=> d!54933 m!211785))

(assert (=> d!54933 m!211797))

(assert (=> d!54933 m!211785))

(declare-fun m!211897 () Bool)

(assert (=> d!54933 m!211897))

(assert (=> b!184395 d!54933))

(declare-fun d!54935 () Bool)

(assert (=> d!54935 (= (apply!162 lt!91190 lt!91205) (get!2124 (getValueByKey!219 (toList!1189 lt!91190) lt!91205)))))

(declare-fun bs!7489 () Bool)

(assert (= bs!7489 d!54935))

(declare-fun m!211899 () Bool)

(assert (=> bs!7489 m!211899))

(assert (=> bs!7489 m!211899))

(declare-fun m!211901 () Bool)

(assert (=> bs!7489 m!211901))

(assert (=> b!184395 d!54935))

(declare-fun d!54937 () Bool)

(declare-fun e!121440 () Bool)

(assert (=> d!54937 e!121440))

(declare-fun res!87287 () Bool)

(assert (=> d!54937 (=> (not res!87287) (not e!121440))))

(declare-fun lt!91270 () ListLongMap!2347)

(assert (=> d!54937 (= res!87287 (contains!1279 lt!91270 (_1!1726 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248)))))))

(declare-fun lt!91273 () List!2345)

(assert (=> d!54937 (= lt!91270 (ListLongMap!2348 lt!91273))))

(declare-fun lt!91272 () Unit!5568)

(declare-fun lt!91271 () Unit!5568)

(assert (=> d!54937 (= lt!91272 lt!91271)))

(assert (=> d!54937 (= (getValueByKey!219 lt!91273 (_1!1726 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248)))) (Some!224 (_2!1726 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248)))))))

(assert (=> d!54937 (= lt!91271 (lemmaContainsTupThenGetReturnValue!115 lt!91273 (_1!1726 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248))) (_2!1726 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248)))))))

(assert (=> d!54937 (= lt!91273 (insertStrictlySorted!118 (toList!1189 lt!91203) (_1!1726 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248))) (_2!1726 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248)))))))

(assert (=> d!54937 (= (+!282 lt!91203 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248))) lt!91270)))

(declare-fun b!184498 () Bool)

(declare-fun res!87286 () Bool)

(assert (=> b!184498 (=> (not res!87286) (not e!121440))))

(assert (=> b!184498 (= res!87286 (= (getValueByKey!219 (toList!1189 lt!91270) (_1!1726 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248)))) (Some!224 (_2!1726 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248))))))))

(declare-fun b!184499 () Bool)

(assert (=> b!184499 (= e!121440 (contains!1281 (toList!1189 lt!91270) (tuple2!3431 lt!91210 (minValue!3605 thiss!1248))))))

(assert (= (and d!54937 res!87287) b!184498))

(assert (= (and b!184498 res!87286) b!184499))

(declare-fun m!211903 () Bool)

(assert (=> d!54937 m!211903))

(declare-fun m!211905 () Bool)

(assert (=> d!54937 m!211905))

(declare-fun m!211907 () Bool)

(assert (=> d!54937 m!211907))

(declare-fun m!211909 () Bool)

(assert (=> d!54937 m!211909))

(declare-fun m!211911 () Bool)

(assert (=> b!184498 m!211911))

(declare-fun m!211913 () Bool)

(assert (=> b!184499 m!211913))

(assert (=> b!184395 d!54937))

(declare-fun d!54939 () Bool)

(assert (=> d!54939 (= (apply!162 lt!91203 lt!91206) (get!2124 (getValueByKey!219 (toList!1189 lt!91203) lt!91206)))))

(declare-fun bs!7490 () Bool)

(assert (= bs!7490 d!54939))

(declare-fun m!211915 () Bool)

(assert (=> bs!7490 m!211915))

(assert (=> bs!7490 m!211915))

(declare-fun m!211917 () Bool)

(assert (=> bs!7490 m!211917))

(assert (=> b!184395 d!54939))

(declare-fun d!54941 () Bool)

(declare-fun e!121441 () Bool)

(assert (=> d!54941 e!121441))

(declare-fun res!87289 () Bool)

(assert (=> d!54941 (=> (not res!87289) (not e!121441))))

(declare-fun lt!91274 () ListLongMap!2347)

(assert (=> d!54941 (= res!87289 (contains!1279 lt!91274 (_1!1726 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248)))))))

(declare-fun lt!91277 () List!2345)

(assert (=> d!54941 (= lt!91274 (ListLongMap!2348 lt!91277))))

(declare-fun lt!91276 () Unit!5568)

(declare-fun lt!91275 () Unit!5568)

(assert (=> d!54941 (= lt!91276 lt!91275)))

(assert (=> d!54941 (= (getValueByKey!219 lt!91277 (_1!1726 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248)))) (Some!224 (_2!1726 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248)))))))

(assert (=> d!54941 (= lt!91275 (lemmaContainsTupThenGetReturnValue!115 lt!91277 (_1!1726 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248))) (_2!1726 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248)))))))

(assert (=> d!54941 (= lt!91277 (insertStrictlySorted!118 (toList!1189 lt!91190) (_1!1726 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248))) (_2!1726 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248)))))))

(assert (=> d!54941 (= (+!282 lt!91190 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248))) lt!91274)))

(declare-fun b!184500 () Bool)

(declare-fun res!87288 () Bool)

(assert (=> b!184500 (=> (not res!87288) (not e!121441))))

(assert (=> b!184500 (= res!87288 (= (getValueByKey!219 (toList!1189 lt!91274) (_1!1726 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248)))) (Some!224 (_2!1726 (tuple2!3431 lt!91201 (minValue!3605 thiss!1248))))))))

(declare-fun b!184501 () Bool)

(assert (=> b!184501 (= e!121441 (contains!1281 (toList!1189 lt!91274) (tuple2!3431 lt!91201 (minValue!3605 thiss!1248))))))

(assert (= (and d!54941 res!87289) b!184500))

(assert (= (and b!184500 res!87288) b!184501))

(declare-fun m!211919 () Bool)

(assert (=> d!54941 m!211919))

(declare-fun m!211921 () Bool)

(assert (=> d!54941 m!211921))

(declare-fun m!211923 () Bool)

(assert (=> d!54941 m!211923))

(declare-fun m!211925 () Bool)

(assert (=> d!54941 m!211925))

(declare-fun m!211927 () Bool)

(assert (=> b!184500 m!211927))

(declare-fun m!211929 () Bool)

(assert (=> b!184501 m!211929))

(assert (=> b!184395 d!54941))

(declare-fun d!54943 () Bool)

(assert (=> d!54943 (= (apply!162 (+!282 lt!91203 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248))) lt!91206) (get!2124 (getValueByKey!219 (toList!1189 (+!282 lt!91203 (tuple2!3431 lt!91210 (minValue!3605 thiss!1248)))) lt!91206)))))

(declare-fun bs!7491 () Bool)

(assert (= bs!7491 d!54943))

(declare-fun m!211931 () Bool)

(assert (=> bs!7491 m!211931))

(assert (=> bs!7491 m!211931))

(declare-fun m!211933 () Bool)

(assert (=> bs!7491 m!211933))

(assert (=> b!184395 d!54943))

(declare-fun d!54945 () Bool)

(assert (=> d!54945 (= (validKeyInArray!0 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184402 d!54945))

(declare-fun d!54947 () Bool)

(declare-fun lt!91280 () (_ BitVec 32))

(assert (=> d!54947 (and (bvsge lt!91280 #b00000000000000000000000000000000) (bvsle lt!91280 (bvsub (size!4015 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121446 () (_ BitVec 32))

(assert (=> d!54947 (= lt!91280 e!121446)))

(declare-fun c!33096 () Bool)

(assert (=> d!54947 (= c!33096 (bvsge #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))

(assert (=> d!54947 (and (bvsle #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4015 (_keys!5691 thiss!1248)) (size!4015 (_keys!5691 thiss!1248))))))

(assert (=> d!54947 (= (arrayCountValidKeys!0 (_keys!5691 thiss!1248) #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))) lt!91280)))

(declare-fun b!184510 () Bool)

(declare-fun e!121447 () (_ BitVec 32))

(declare-fun call!18622 () (_ BitVec 32))

(assert (=> b!184510 (= e!121447 (bvadd #b00000000000000000000000000000001 call!18622))))

(declare-fun b!184511 () Bool)

(assert (=> b!184511 (= e!121446 e!121447)))

(declare-fun c!33095 () Bool)

(assert (=> b!184511 (= c!33095 (validKeyInArray!0 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184512 () Bool)

(assert (=> b!184512 (= e!121447 call!18622)))

(declare-fun bm!18619 () Bool)

(assert (=> bm!18619 (= call!18622 (arrayCountValidKeys!0 (_keys!5691 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4015 (_keys!5691 thiss!1248))))))

(declare-fun b!184513 () Bool)

(assert (=> b!184513 (= e!121446 #b00000000000000000000000000000000)))

(assert (= (and d!54947 c!33096) b!184513))

(assert (= (and d!54947 (not c!33096)) b!184511))

(assert (= (and b!184511 c!33095) b!184510))

(assert (= (and b!184511 (not c!33095)) b!184512))

(assert (= (or b!184510 b!184512) bm!18619))

(assert (=> b!184511 m!211751))

(assert (=> b!184511 m!211751))

(assert (=> b!184511 m!211763))

(declare-fun m!211935 () Bool)

(assert (=> bm!18619 m!211935))

(assert (=> b!184341 d!54947))

(declare-fun d!54949 () Bool)

(declare-fun e!121448 () Bool)

(assert (=> d!54949 e!121448))

(declare-fun res!87290 () Bool)

(assert (=> d!54949 (=> res!87290 e!121448)))

(declare-fun lt!91281 () Bool)

(assert (=> d!54949 (= res!87290 (not lt!91281))))

(declare-fun lt!91282 () Bool)

(assert (=> d!54949 (= lt!91281 lt!91282)))

(declare-fun lt!91283 () Unit!5568)

(declare-fun e!121449 () Unit!5568)

(assert (=> d!54949 (= lt!91283 e!121449)))

(declare-fun c!33097 () Bool)

(assert (=> d!54949 (= c!33097 lt!91282)))

(assert (=> d!54949 (= lt!91282 (containsKey!223 (toList!1189 lt!91195) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54949 (= (contains!1279 lt!91195 #b0000000000000000000000000000000000000000000000000000000000000000) lt!91281)))

(declare-fun b!184514 () Bool)

(declare-fun lt!91284 () Unit!5568)

(assert (=> b!184514 (= e!121449 lt!91284)))

(assert (=> b!184514 (= lt!91284 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1189 lt!91195) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184514 (isDefined!172 (getValueByKey!219 (toList!1189 lt!91195) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184515 () Bool)

(declare-fun Unit!5573 () Unit!5568)

(assert (=> b!184515 (= e!121449 Unit!5573)))

(declare-fun b!184516 () Bool)

(assert (=> b!184516 (= e!121448 (isDefined!172 (getValueByKey!219 (toList!1189 lt!91195) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54949 c!33097) b!184514))

(assert (= (and d!54949 (not c!33097)) b!184515))

(assert (= (and d!54949 (not res!87290)) b!184516))

(declare-fun m!211937 () Bool)

(assert (=> d!54949 m!211937))

(declare-fun m!211939 () Bool)

(assert (=> b!184514 m!211939))

(declare-fun m!211941 () Bool)

(assert (=> b!184514 m!211941))

(assert (=> b!184514 m!211941))

(declare-fun m!211943 () Bool)

(assert (=> b!184514 m!211943))

(assert (=> b!184516 m!211941))

(assert (=> b!184516 m!211941))

(assert (=> b!184516 m!211943))

(assert (=> bm!18612 d!54949))

(declare-fun e!121457 () SeekEntryResult!627)

(declare-fun b!184529 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184529 (= e!121457 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20051 lt!91220) #b00000000000000000000000000000001) (nextIndex!0 (index!4680 lt!91220) (x!20051 lt!91220) (mask!8846 thiss!1248)) (index!4680 lt!91220) key!828 (_keys!5691 thiss!1248) (mask!8846 thiss!1248)))))

(declare-fun lt!91290 () SeekEntryResult!627)

(declare-fun d!54951 () Bool)

(assert (=> d!54951 (and (or ((_ is Undefined!627) lt!91290) (not ((_ is Found!627) lt!91290)) (and (bvsge (index!4679 lt!91290) #b00000000000000000000000000000000) (bvslt (index!4679 lt!91290) (size!4015 (_keys!5691 thiss!1248))))) (or ((_ is Undefined!627) lt!91290) ((_ is Found!627) lt!91290) (not ((_ is MissingVacant!627) lt!91290)) (not (= (index!4681 lt!91290) (index!4680 lt!91220))) (and (bvsge (index!4681 lt!91290) #b00000000000000000000000000000000) (bvslt (index!4681 lt!91290) (size!4015 (_keys!5691 thiss!1248))))) (or ((_ is Undefined!627) lt!91290) (ite ((_ is Found!627) lt!91290) (= (select (arr!3701 (_keys!5691 thiss!1248)) (index!4679 lt!91290)) key!828) (and ((_ is MissingVacant!627) lt!91290) (= (index!4681 lt!91290) (index!4680 lt!91220)) (= (select (arr!3701 (_keys!5691 thiss!1248)) (index!4681 lt!91290)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!121458 () SeekEntryResult!627)

(assert (=> d!54951 (= lt!91290 e!121458)))

(declare-fun c!33104 () Bool)

(assert (=> d!54951 (= c!33104 (bvsge (x!20051 lt!91220) #b01111111111111111111111111111110))))

(declare-fun lt!91289 () (_ BitVec 64))

(assert (=> d!54951 (= lt!91289 (select (arr!3701 (_keys!5691 thiss!1248)) (index!4680 lt!91220)))))

(assert (=> d!54951 (validMask!0 (mask!8846 thiss!1248))))

(assert (=> d!54951 (= (seekKeyOrZeroReturnVacant!0 (x!20051 lt!91220) (index!4680 lt!91220) (index!4680 lt!91220) key!828 (_keys!5691 thiss!1248) (mask!8846 thiss!1248)) lt!91290)))

(declare-fun b!184530 () Bool)

(declare-fun c!33106 () Bool)

(assert (=> b!184530 (= c!33106 (= lt!91289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!121456 () SeekEntryResult!627)

(assert (=> b!184530 (= e!121456 e!121457)))

(declare-fun b!184531 () Bool)

(assert (=> b!184531 (= e!121457 (MissingVacant!627 (index!4680 lt!91220)))))

(declare-fun b!184532 () Bool)

(assert (=> b!184532 (= e!121458 e!121456)))

(declare-fun c!33105 () Bool)

(assert (=> b!184532 (= c!33105 (= lt!91289 key!828))))

(declare-fun b!184533 () Bool)

(assert (=> b!184533 (= e!121458 Undefined!627)))

(declare-fun b!184534 () Bool)

(assert (=> b!184534 (= e!121456 (Found!627 (index!4680 lt!91220)))))

(assert (= (and d!54951 c!33104) b!184533))

(assert (= (and d!54951 (not c!33104)) b!184532))

(assert (= (and b!184532 c!33105) b!184534))

(assert (= (and b!184532 (not c!33105)) b!184530))

(assert (= (and b!184530 c!33106) b!184531))

(assert (= (and b!184530 (not c!33106)) b!184529))

(declare-fun m!211945 () Bool)

(assert (=> b!184529 m!211945))

(assert (=> b!184529 m!211945))

(declare-fun m!211947 () Bool)

(assert (=> b!184529 m!211947))

(declare-fun m!211949 () Bool)

(assert (=> d!54951 m!211949))

(declare-fun m!211951 () Bool)

(assert (=> d!54951 m!211951))

(assert (=> d!54951 m!211805))

(assert (=> d!54951 m!211701))

(assert (=> b!184430 d!54951))

(declare-fun b!184543 () Bool)

(declare-fun res!87299 () Bool)

(declare-fun e!121461 () Bool)

(assert (=> b!184543 (=> (not res!87299) (not e!121461))))

(assert (=> b!184543 (= res!87299 (and (= (size!4016 (_values!3747 thiss!1248)) (bvadd (mask!8846 thiss!1248) #b00000000000000000000000000000001)) (= (size!4015 (_keys!5691 thiss!1248)) (size!4016 (_values!3747 thiss!1248))) (bvsge (_size!1318 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1318 thiss!1248) (bvadd (mask!8846 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!184545 () Bool)

(declare-fun res!87300 () Bool)

(assert (=> b!184545 (=> (not res!87300) (not e!121461))))

(declare-fun size!4019 (LongMapFixedSize!2538) (_ BitVec 32))

(assert (=> b!184545 (= res!87300 (= (size!4019 thiss!1248) (bvadd (_size!1318 thiss!1248) (bvsdiv (bvadd (extraKeys!3501 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!184546 () Bool)

(assert (=> b!184546 (= e!121461 (and (bvsge (extraKeys!3501 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3501 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1318 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!54953 () Bool)

(declare-fun res!87301 () Bool)

(assert (=> d!54953 (=> (not res!87301) (not e!121461))))

(assert (=> d!54953 (= res!87301 (validMask!0 (mask!8846 thiss!1248)))))

(assert (=> d!54953 (= (simpleValid!178 thiss!1248) e!121461)))

(declare-fun b!184544 () Bool)

(declare-fun res!87302 () Bool)

(assert (=> b!184544 (=> (not res!87302) (not e!121461))))

(assert (=> b!184544 (= res!87302 (bvsge (size!4019 thiss!1248) (_size!1318 thiss!1248)))))

(assert (= (and d!54953 res!87301) b!184543))

(assert (= (and b!184543 res!87299) b!184544))

(assert (= (and b!184544 res!87302) b!184545))

(assert (= (and b!184545 res!87300) b!184546))

(declare-fun m!211953 () Bool)

(assert (=> b!184545 m!211953))

(assert (=> d!54953 m!211701))

(assert (=> b!184544 m!211953))

(assert (=> d!54901 d!54953))

(declare-fun d!54955 () Bool)

(declare-fun e!121462 () Bool)

(assert (=> d!54955 e!121462))

(declare-fun res!87303 () Bool)

(assert (=> d!54955 (=> res!87303 e!121462)))

(declare-fun lt!91291 () Bool)

(assert (=> d!54955 (= res!87303 (not lt!91291))))

(declare-fun lt!91292 () Bool)

(assert (=> d!54955 (= lt!91291 lt!91292)))

(declare-fun lt!91293 () Unit!5568)

(declare-fun e!121463 () Unit!5568)

(assert (=> d!54955 (= lt!91293 e!121463)))

(declare-fun c!33107 () Bool)

(assert (=> d!54955 (= c!33107 lt!91292)))

(assert (=> d!54955 (= lt!91292 (containsKey!223 (toList!1189 lt!91195) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54955 (= (contains!1279 lt!91195 #b1000000000000000000000000000000000000000000000000000000000000000) lt!91291)))

(declare-fun b!184547 () Bool)

(declare-fun lt!91294 () Unit!5568)

(assert (=> b!184547 (= e!121463 lt!91294)))

(assert (=> b!184547 (= lt!91294 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1189 lt!91195) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184547 (isDefined!172 (getValueByKey!219 (toList!1189 lt!91195) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184548 () Bool)

(declare-fun Unit!5574 () Unit!5568)

(assert (=> b!184548 (= e!121463 Unit!5574)))

(declare-fun b!184549 () Bool)

(assert (=> b!184549 (= e!121462 (isDefined!172 (getValueByKey!219 (toList!1189 lt!91195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54955 c!33107) b!184547))

(assert (= (and d!54955 (not c!33107)) b!184548))

(assert (= (and d!54955 (not res!87303)) b!184549))

(declare-fun m!211955 () Bool)

(assert (=> d!54955 m!211955))

(declare-fun m!211957 () Bool)

(assert (=> b!184547 m!211957))

(declare-fun m!211959 () Bool)

(assert (=> b!184547 m!211959))

(assert (=> b!184547 m!211959))

(declare-fun m!211961 () Bool)

(assert (=> b!184547 m!211961))

(assert (=> b!184549 m!211959))

(assert (=> b!184549 m!211959))

(assert (=> b!184549 m!211961))

(assert (=> bm!18608 d!54955))

(declare-fun d!54957 () Bool)

(declare-fun isEmpty!468 (Option!225) Bool)

(assert (=> d!54957 (= (isDefined!172 (getValueByKey!219 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))) key!828)) (not (isEmpty!468 (getValueByKey!219 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))) key!828))))))

(declare-fun bs!7492 () Bool)

(assert (= bs!7492 d!54957))

(assert (=> bs!7492 m!211741))

(declare-fun m!211963 () Bool)

(assert (=> bs!7492 m!211963))

(assert (=> b!184352 d!54957))

(declare-fun b!184559 () Bool)

(declare-fun e!121468 () Option!225)

(declare-fun e!121469 () Option!225)

(assert (=> b!184559 (= e!121468 e!121469)))

(declare-fun c!33113 () Bool)

(assert (=> b!184559 (= c!33113 (and ((_ is Cons!2341) (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))) (not (= (_1!1726 (h!2972 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))))) key!828))))))

(declare-fun d!54959 () Bool)

(declare-fun c!33112 () Bool)

(assert (=> d!54959 (= c!33112 (and ((_ is Cons!2341) (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))) (= (_1!1726 (h!2972 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))))) key!828)))))

(assert (=> d!54959 (= (getValueByKey!219 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))) key!828) e!121468)))

(declare-fun b!184558 () Bool)

(assert (=> b!184558 (= e!121468 (Some!224 (_2!1726 (h!2972 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))))))))

(declare-fun b!184560 () Bool)

(assert (=> b!184560 (= e!121469 (getValueByKey!219 (t!7219 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))) key!828))))

(declare-fun b!184561 () Bool)

(assert (=> b!184561 (= e!121469 None!223)))

(assert (= (and d!54959 c!33112) b!184558))

(assert (= (and d!54959 (not c!33112)) b!184559))

(assert (= (and b!184559 c!33113) b!184560))

(assert (= (and b!184559 (not c!33113)) b!184561))

(declare-fun m!211965 () Bool)

(assert (=> b!184560 m!211965))

(assert (=> b!184352 d!54959))

(declare-fun d!54961 () Bool)

(declare-fun e!121470 () Bool)

(assert (=> d!54961 e!121470))

(declare-fun res!87304 () Bool)

(assert (=> d!54961 (=> res!87304 e!121470)))

(declare-fun lt!91295 () Bool)

(assert (=> d!54961 (= res!87304 (not lt!91295))))

(declare-fun lt!91296 () Bool)

(assert (=> d!54961 (= lt!91295 lt!91296)))

(declare-fun lt!91297 () Unit!5568)

(declare-fun e!121471 () Unit!5568)

(assert (=> d!54961 (= lt!91297 e!121471)))

(declare-fun c!33114 () Bool)

(assert (=> d!54961 (= c!33114 lt!91296)))

(assert (=> d!54961 (= lt!91296 (containsKey!223 (toList!1189 lt!91195) (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54961 (= (contains!1279 lt!91195 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)) lt!91295)))

(declare-fun b!184562 () Bool)

(declare-fun lt!91298 () Unit!5568)

(assert (=> b!184562 (= e!121471 lt!91298)))

(assert (=> b!184562 (= lt!91298 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1189 lt!91195) (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184562 (isDefined!172 (getValueByKey!219 (toList!1189 lt!91195) (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184563 () Bool)

(declare-fun Unit!5575 () Unit!5568)

(assert (=> b!184563 (= e!121471 Unit!5575)))

(declare-fun b!184564 () Bool)

(assert (=> b!184564 (= e!121470 (isDefined!172 (getValueByKey!219 (toList!1189 lt!91195) (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54961 c!33114) b!184562))

(assert (= (and d!54961 (not c!33114)) b!184563))

(assert (= (and d!54961 (not res!87304)) b!184564))

(assert (=> d!54961 m!211751))

(declare-fun m!211967 () Bool)

(assert (=> d!54961 m!211967))

(assert (=> b!184562 m!211751))

(declare-fun m!211969 () Bool)

(assert (=> b!184562 m!211969))

(assert (=> b!184562 m!211751))

(declare-fun m!211971 () Bool)

(assert (=> b!184562 m!211971))

(assert (=> b!184562 m!211971))

(declare-fun m!211973 () Bool)

(assert (=> b!184562 m!211973))

(assert (=> b!184564 m!211751))

(assert (=> b!184564 m!211971))

(assert (=> b!184564 m!211971))

(assert (=> b!184564 m!211973))

(assert (=> b!184410 d!54961))

(assert (=> d!54905 d!54899))

(assert (=> b!184411 d!54945))

(assert (=> bm!18609 d!54915))

(declare-fun d!54963 () Bool)

(assert (=> d!54963 (= (apply!162 lt!91195 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2124 (getValueByKey!219 (toList!1189 lt!91195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7493 () Bool)

(assert (= bs!7493 d!54963))

(assert (=> bs!7493 m!211959))

(assert (=> bs!7493 m!211959))

(declare-fun m!211975 () Bool)

(assert (=> bs!7493 m!211975))

(assert (=> b!184407 d!54963))

(declare-fun d!54965 () Bool)

(declare-fun e!121472 () Bool)

(assert (=> d!54965 e!121472))

(declare-fun res!87306 () Bool)

(assert (=> d!54965 (=> (not res!87306) (not e!121472))))

(declare-fun lt!91299 () ListLongMap!2347)

(assert (=> d!54965 (= res!87306 (contains!1279 lt!91299 (_1!1726 (ite (or c!33064 c!33066) (tuple2!3431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3605 thiss!1248)) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248))))))))

(declare-fun lt!91302 () List!2345)

(assert (=> d!54965 (= lt!91299 (ListLongMap!2348 lt!91302))))

(declare-fun lt!91301 () Unit!5568)

(declare-fun lt!91300 () Unit!5568)

(assert (=> d!54965 (= lt!91301 lt!91300)))

(assert (=> d!54965 (= (getValueByKey!219 lt!91302 (_1!1726 (ite (or c!33064 c!33066) (tuple2!3431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3605 thiss!1248)) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248))))) (Some!224 (_2!1726 (ite (or c!33064 c!33066) (tuple2!3431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3605 thiss!1248)) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248))))))))

(assert (=> d!54965 (= lt!91300 (lemmaContainsTupThenGetReturnValue!115 lt!91302 (_1!1726 (ite (or c!33064 c!33066) (tuple2!3431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3605 thiss!1248)) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248)))) (_2!1726 (ite (or c!33064 c!33066) (tuple2!3431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3605 thiss!1248)) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248))))))))

(assert (=> d!54965 (= lt!91302 (insertStrictlySorted!118 (toList!1189 (ite c!33064 call!18613 (ite c!33066 call!18616 call!18614))) (_1!1726 (ite (or c!33064 c!33066) (tuple2!3431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3605 thiss!1248)) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248)))) (_2!1726 (ite (or c!33064 c!33066) (tuple2!3431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3605 thiss!1248)) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248))))))))

(assert (=> d!54965 (= (+!282 (ite c!33064 call!18613 (ite c!33066 call!18616 call!18614)) (ite (or c!33064 c!33066) (tuple2!3431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3605 thiss!1248)) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248)))) lt!91299)))

(declare-fun b!184565 () Bool)

(declare-fun res!87305 () Bool)

(assert (=> b!184565 (=> (not res!87305) (not e!121472))))

(assert (=> b!184565 (= res!87305 (= (getValueByKey!219 (toList!1189 lt!91299) (_1!1726 (ite (or c!33064 c!33066) (tuple2!3431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3605 thiss!1248)) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248))))) (Some!224 (_2!1726 (ite (or c!33064 c!33066) (tuple2!3431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3605 thiss!1248)) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248)))))))))

(declare-fun b!184566 () Bool)

(assert (=> b!184566 (= e!121472 (contains!1281 (toList!1189 lt!91299) (ite (or c!33064 c!33066) (tuple2!3431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3605 thiss!1248)) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248)))))))

(assert (= (and d!54965 res!87306) b!184565))

(assert (= (and b!184565 res!87305) b!184566))

(declare-fun m!211977 () Bool)

(assert (=> d!54965 m!211977))

(declare-fun m!211979 () Bool)

(assert (=> d!54965 m!211979))

(declare-fun m!211981 () Bool)

(assert (=> d!54965 m!211981))

(declare-fun m!211983 () Bool)

(assert (=> d!54965 m!211983))

(declare-fun m!211985 () Bool)

(assert (=> b!184565 m!211985))

(declare-fun m!211987 () Bool)

(assert (=> b!184566 m!211987))

(assert (=> bm!18607 d!54965))

(declare-fun d!54967 () Bool)

(assert (=> d!54967 (= (apply!162 lt!91195 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)) (get!2124 (getValueByKey!219 (toList!1189 lt!91195) (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7494 () Bool)

(assert (= bs!7494 d!54967))

(assert (=> bs!7494 m!211751))

(assert (=> bs!7494 m!211971))

(assert (=> bs!7494 m!211971))

(declare-fun m!211989 () Bool)

(assert (=> bs!7494 m!211989))

(assert (=> b!184401 d!54967))

(declare-fun d!54969 () Bool)

(declare-fun c!33117 () Bool)

(assert (=> d!54969 (= c!33117 ((_ is ValueCellFull!1815) (select (arr!3702 (_values!3747 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121475 () V!5403)

(assert (=> d!54969 (= (get!2123 (select (arr!3702 (_values!3747 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3764 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!121475)))

(declare-fun b!184571 () Bool)

(declare-fun get!2125 (ValueCell!1815 V!5403) V!5403)

(assert (=> b!184571 (= e!121475 (get!2125 (select (arr!3702 (_values!3747 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3764 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184572 () Bool)

(declare-fun get!2126 (ValueCell!1815 V!5403) V!5403)

(assert (=> b!184572 (= e!121475 (get!2126 (select (arr!3702 (_values!3747 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3764 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54969 c!33117) b!184571))

(assert (= (and d!54969 (not c!33117)) b!184572))

(assert (=> b!184571 m!211745))

(assert (=> b!184571 m!211747))

(declare-fun m!211991 () Bool)

(assert (=> b!184571 m!211991))

(assert (=> b!184572 m!211745))

(assert (=> b!184572 m!211747))

(declare-fun m!211993 () Bool)

(assert (=> b!184572 m!211993))

(assert (=> b!184401 d!54969))

(declare-fun d!54971 () Bool)

(assert (=> d!54971 (= (apply!162 lt!91195 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2124 (getValueByKey!219 (toList!1189 lt!91195) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7495 () Bool)

(assert (= bs!7495 d!54971))

(assert (=> bs!7495 m!211941))

(assert (=> bs!7495 m!211941))

(declare-fun m!211995 () Bool)

(assert (=> bs!7495 m!211995))

(assert (=> b!184400 d!54971))

(declare-fun d!54973 () Bool)

(assert (=> d!54973 (isDefined!172 (getValueByKey!219 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))) key!828))))

(declare-fun lt!91305 () Unit!5568)

(declare-fun choose!978 (List!2345 (_ BitVec 64)) Unit!5568)

(assert (=> d!54973 (= lt!91305 (choose!978 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))) key!828))))

(declare-fun e!121478 () Bool)

(assert (=> d!54973 e!121478))

(declare-fun res!87309 () Bool)

(assert (=> d!54973 (=> (not res!87309) (not e!121478))))

(declare-fun isStrictlySorted!347 (List!2345) Bool)

(assert (=> d!54973 (= res!87309 (isStrictlySorted!347 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))))))

(assert (=> d!54973 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))) key!828) lt!91305)))

(declare-fun b!184575 () Bool)

(assert (=> b!184575 (= e!121478 (containsKey!223 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))) key!828))))

(assert (= (and d!54973 res!87309) b!184575))

(assert (=> d!54973 m!211741))

(assert (=> d!54973 m!211741))

(assert (=> d!54973 m!211743))

(declare-fun m!211997 () Bool)

(assert (=> d!54973 m!211997))

(declare-fun m!211999 () Bool)

(assert (=> d!54973 m!211999))

(assert (=> b!184575 m!211737))

(assert (=> b!184350 d!54973))

(assert (=> b!184350 d!54957))

(assert (=> b!184350 d!54959))

(declare-fun b!184594 () Bool)

(declare-fun e!121489 () SeekEntryResult!627)

(assert (=> b!184594 (= e!121489 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8846 thiss!1248)) #b00000000000000000000000000000000 (mask!8846 thiss!1248)) key!828 (_keys!5691 thiss!1248) (mask!8846 thiss!1248)))))

(declare-fun b!184595 () Bool)

(declare-fun lt!91310 () SeekEntryResult!627)

(assert (=> b!184595 (and (bvsge (index!4680 lt!91310) #b00000000000000000000000000000000) (bvslt (index!4680 lt!91310) (size!4015 (_keys!5691 thiss!1248))))))

(declare-fun res!87316 () Bool)

(assert (=> b!184595 (= res!87316 (= (select (arr!3701 (_keys!5691 thiss!1248)) (index!4680 lt!91310)) key!828))))

(declare-fun e!121490 () Bool)

(assert (=> b!184595 (=> res!87316 e!121490)))

(declare-fun e!121492 () Bool)

(assert (=> b!184595 (= e!121492 e!121490)))

(declare-fun b!184596 () Bool)

(declare-fun e!121491 () Bool)

(assert (=> b!184596 (= e!121491 (bvsge (x!20051 lt!91310) #b01111111111111111111111111111110))))

(declare-fun b!184597 () Bool)

(assert (=> b!184597 (= e!121491 e!121492)))

(declare-fun res!87317 () Bool)

(assert (=> b!184597 (= res!87317 (and ((_ is Intermediate!627) lt!91310) (not (undefined!1439 lt!91310)) (bvslt (x!20051 lt!91310) #b01111111111111111111111111111110) (bvsge (x!20051 lt!91310) #b00000000000000000000000000000000) (bvsge (x!20051 lt!91310) #b00000000000000000000000000000000)))))

(assert (=> b!184597 (=> (not res!87317) (not e!121492))))

(declare-fun b!184598 () Bool)

(declare-fun e!121493 () SeekEntryResult!627)

(assert (=> b!184598 (= e!121493 (Intermediate!627 true (toIndex!0 key!828 (mask!8846 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!54975 () Bool)

(assert (=> d!54975 e!121491))

(declare-fun c!33124 () Bool)

(assert (=> d!54975 (= c!33124 (and ((_ is Intermediate!627) lt!91310) (undefined!1439 lt!91310)))))

(assert (=> d!54975 (= lt!91310 e!121493)))

(declare-fun c!33125 () Bool)

(assert (=> d!54975 (= c!33125 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!91311 () (_ BitVec 64))

(assert (=> d!54975 (= lt!91311 (select (arr!3701 (_keys!5691 thiss!1248)) (toIndex!0 key!828 (mask!8846 thiss!1248))))))

(assert (=> d!54975 (validMask!0 (mask!8846 thiss!1248))))

(assert (=> d!54975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8846 thiss!1248)) key!828 (_keys!5691 thiss!1248) (mask!8846 thiss!1248)) lt!91310)))

(declare-fun b!184599 () Bool)

(assert (=> b!184599 (and (bvsge (index!4680 lt!91310) #b00000000000000000000000000000000) (bvslt (index!4680 lt!91310) (size!4015 (_keys!5691 thiss!1248))))))

(declare-fun res!87318 () Bool)

(assert (=> b!184599 (= res!87318 (= (select (arr!3701 (_keys!5691 thiss!1248)) (index!4680 lt!91310)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184599 (=> res!87318 e!121490)))

(declare-fun b!184600 () Bool)

(assert (=> b!184600 (and (bvsge (index!4680 lt!91310) #b00000000000000000000000000000000) (bvslt (index!4680 lt!91310) (size!4015 (_keys!5691 thiss!1248))))))

(assert (=> b!184600 (= e!121490 (= (select (arr!3701 (_keys!5691 thiss!1248)) (index!4680 lt!91310)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184601 () Bool)

(assert (=> b!184601 (= e!121489 (Intermediate!627 false (toIndex!0 key!828 (mask!8846 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!184602 () Bool)

(assert (=> b!184602 (= e!121493 e!121489)))

(declare-fun c!33126 () Bool)

(assert (=> b!184602 (= c!33126 (or (= lt!91311 key!828) (= (bvadd lt!91311 lt!91311) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54975 c!33125) b!184598))

(assert (= (and d!54975 (not c!33125)) b!184602))

(assert (= (and b!184602 c!33126) b!184601))

(assert (= (and b!184602 (not c!33126)) b!184594))

(assert (= (and d!54975 c!33124) b!184596))

(assert (= (and d!54975 (not c!33124)) b!184597))

(assert (= (and b!184597 res!87317) b!184595))

(assert (= (and b!184595 (not res!87316)) b!184599))

(assert (= (and b!184599 (not res!87318)) b!184600))

(declare-fun m!212001 () Bool)

(assert (=> b!184600 m!212001))

(assert (=> b!184599 m!212001))

(assert (=> b!184595 m!212001))

(assert (=> b!184594 m!211809))

(declare-fun m!212003 () Bool)

(assert (=> b!184594 m!212003))

(assert (=> b!184594 m!212003))

(declare-fun m!212005 () Bool)

(assert (=> b!184594 m!212005))

(assert (=> d!54975 m!211809))

(declare-fun m!212007 () Bool)

(assert (=> d!54975 m!212007))

(assert (=> d!54975 m!211701))

(assert (=> d!54911 d!54975))

(declare-fun d!54977 () Bool)

(declare-fun lt!91317 () (_ BitVec 32))

(declare-fun lt!91316 () (_ BitVec 32))

(assert (=> d!54977 (= lt!91317 (bvmul (bvxor lt!91316 (bvlshr lt!91316 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54977 (= lt!91316 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54977 (and (bvsge (mask!8846 thiss!1248) #b00000000000000000000000000000000) (let ((res!87319 (let ((h!2975 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20069 (bvmul (bvxor h!2975 (bvlshr h!2975 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20069 (bvlshr x!20069 #b00000000000000000000000000001101)) (mask!8846 thiss!1248)))))) (and (bvslt res!87319 (bvadd (mask!8846 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!87319 #b00000000000000000000000000000000))))))

(assert (=> d!54977 (= (toIndex!0 key!828 (mask!8846 thiss!1248)) (bvand (bvxor lt!91317 (bvlshr lt!91317 #b00000000000000000000000000001101)) (mask!8846 thiss!1248)))))

(assert (=> d!54911 d!54977))

(assert (=> d!54911 d!54899))

(declare-fun bm!18622 () Bool)

(declare-fun call!18625 () Bool)

(assert (=> bm!18622 (= call!18625 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5691 thiss!1248) (mask!8846 thiss!1248)))))

(declare-fun b!184611 () Bool)

(declare-fun e!121500 () Bool)

(declare-fun e!121502 () Bool)

(assert (=> b!184611 (= e!121500 e!121502)))

(declare-fun lt!91324 () (_ BitVec 64))

(assert (=> b!184611 (= lt!91324 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91325 () Unit!5568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7833 (_ BitVec 64) (_ BitVec 32)) Unit!5568)

(assert (=> b!184611 (= lt!91325 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5691 thiss!1248) lt!91324 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!184611 (arrayContainsKey!0 (_keys!5691 thiss!1248) lt!91324 #b00000000000000000000000000000000)))

(declare-fun lt!91326 () Unit!5568)

(assert (=> b!184611 (= lt!91326 lt!91325)))

(declare-fun res!87325 () Bool)

(assert (=> b!184611 (= res!87325 (= (seekEntryOrOpen!0 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000) (_keys!5691 thiss!1248) (mask!8846 thiss!1248)) (Found!627 #b00000000000000000000000000000000)))))

(assert (=> b!184611 (=> (not res!87325) (not e!121502))))

(declare-fun b!184612 () Bool)

(assert (=> b!184612 (= e!121502 call!18625)))

(declare-fun d!54979 () Bool)

(declare-fun res!87324 () Bool)

(declare-fun e!121501 () Bool)

(assert (=> d!54979 (=> res!87324 e!121501)))

(assert (=> d!54979 (= res!87324 (bvsge #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))

(assert (=> d!54979 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5691 thiss!1248) (mask!8846 thiss!1248)) e!121501)))

(declare-fun b!184613 () Bool)

(assert (=> b!184613 (= e!121501 e!121500)))

(declare-fun c!33129 () Bool)

(assert (=> b!184613 (= c!33129 (validKeyInArray!0 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184614 () Bool)

(assert (=> b!184614 (= e!121500 call!18625)))

(assert (= (and d!54979 (not res!87324)) b!184613))

(assert (= (and b!184613 c!33129) b!184611))

(assert (= (and b!184613 (not c!33129)) b!184614))

(assert (= (and b!184611 res!87325) b!184612))

(assert (= (or b!184612 b!184614) bm!18622))

(declare-fun m!212009 () Bool)

(assert (=> bm!18622 m!212009))

(assert (=> b!184611 m!211751))

(declare-fun m!212011 () Bool)

(assert (=> b!184611 m!212011))

(declare-fun m!212013 () Bool)

(assert (=> b!184611 m!212013))

(assert (=> b!184611 m!211751))

(declare-fun m!212015 () Bool)

(assert (=> b!184611 m!212015))

(assert (=> b!184613 m!211751))

(assert (=> b!184613 m!211751))

(assert (=> b!184613 m!211763))

(assert (=> b!184342 d!54979))

(declare-fun d!54981 () Bool)

(declare-fun res!87330 () Bool)

(declare-fun e!121507 () Bool)

(assert (=> d!54981 (=> res!87330 e!121507)))

(assert (=> d!54981 (= res!87330 (and ((_ is Cons!2341) (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))) (= (_1!1726 (h!2972 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))))) key!828)))))

(assert (=> d!54981 (= (containsKey!223 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))) key!828) e!121507)))

(declare-fun b!184619 () Bool)

(declare-fun e!121508 () Bool)

(assert (=> b!184619 (= e!121507 e!121508)))

(declare-fun res!87331 () Bool)

(assert (=> b!184619 (=> (not res!87331) (not e!121508))))

(assert (=> b!184619 (= res!87331 (and (or (not ((_ is Cons!2341) (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))))) (bvsle (_1!1726 (h!2972 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))))) key!828)) ((_ is Cons!2341) (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))) (bvslt (_1!1726 (h!2972 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248))))) key!828)))))

(declare-fun b!184620 () Bool)

(assert (=> b!184620 (= e!121508 (containsKey!223 (t!7219 (toList!1189 (getCurrentListMap!837 (_keys!5691 thiss!1248) (_values!3747 thiss!1248) (mask!8846 thiss!1248) (extraKeys!3501 thiss!1248) (zeroValue!3605 thiss!1248) (minValue!3605 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3764 thiss!1248)))) key!828))))

(assert (= (and d!54981 (not res!87330)) b!184619))

(assert (= (and b!184619 res!87331) b!184620))

(declare-fun m!212017 () Bool)

(assert (=> b!184620 m!212017))

(assert (=> d!54903 d!54981))

(declare-fun d!54983 () Bool)

(declare-fun e!121509 () Bool)

(assert (=> d!54983 e!121509))

(declare-fun res!87333 () Bool)

(assert (=> d!54983 (=> (not res!87333) (not e!121509))))

(declare-fun lt!91327 () ListLongMap!2347)

(assert (=> d!54983 (= res!87333 (contains!1279 lt!91327 (_1!1726 (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248)))))))

(declare-fun lt!91330 () List!2345)

(assert (=> d!54983 (= lt!91327 (ListLongMap!2348 lt!91330))))

(declare-fun lt!91329 () Unit!5568)

(declare-fun lt!91328 () Unit!5568)

(assert (=> d!54983 (= lt!91329 lt!91328)))

(assert (=> d!54983 (= (getValueByKey!219 lt!91330 (_1!1726 (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248)))) (Some!224 (_2!1726 (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248)))))))

(assert (=> d!54983 (= lt!91328 (lemmaContainsTupThenGetReturnValue!115 lt!91330 (_1!1726 (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248))) (_2!1726 (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248)))))))

(assert (=> d!54983 (= lt!91330 (insertStrictlySorted!118 (toList!1189 call!18610) (_1!1726 (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248))) (_2!1726 (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248)))))))

(assert (=> d!54983 (= (+!282 call!18610 (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248))) lt!91327)))

(declare-fun b!184621 () Bool)

(declare-fun res!87332 () Bool)

(assert (=> b!184621 (=> (not res!87332) (not e!121509))))

(assert (=> b!184621 (= res!87332 (= (getValueByKey!219 (toList!1189 lt!91327) (_1!1726 (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248)))) (Some!224 (_2!1726 (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248))))))))

(declare-fun b!184622 () Bool)

(assert (=> b!184622 (= e!121509 (contains!1281 (toList!1189 lt!91327) (tuple2!3431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3605 thiss!1248))))))

(assert (= (and d!54983 res!87333) b!184621))

(assert (= (and b!184621 res!87332) b!184622))

(declare-fun m!212019 () Bool)

(assert (=> d!54983 m!212019))

(declare-fun m!212021 () Bool)

(assert (=> d!54983 m!212021))

(declare-fun m!212023 () Bool)

(assert (=> d!54983 m!212023))

(declare-fun m!212025 () Bool)

(assert (=> d!54983 m!212025))

(declare-fun m!212027 () Bool)

(assert (=> b!184621 m!212027))

(declare-fun m!212029 () Bool)

(assert (=> b!184622 m!212029))

(assert (=> b!184414 d!54983))

(declare-fun b!184633 () Bool)

(declare-fun e!121521 () Bool)

(declare-fun call!18628 () Bool)

(assert (=> b!184633 (= e!121521 call!18628)))

(declare-fun b!184634 () Bool)

(assert (=> b!184634 (= e!121521 call!18628)))

(declare-fun b!184635 () Bool)

(declare-fun e!121520 () Bool)

(assert (=> b!184635 (= e!121520 e!121521)))

(declare-fun c!33132 () Bool)

(assert (=> b!184635 (= c!33132 (validKeyInArray!0 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184636 () Bool)

(declare-fun e!121519 () Bool)

(declare-fun contains!1282 (List!2347 (_ BitVec 64)) Bool)

(assert (=> b!184636 (= e!121519 (contains!1282 Nil!2344 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184637 () Bool)

(declare-fun e!121518 () Bool)

(assert (=> b!184637 (= e!121518 e!121520)))

(declare-fun res!87341 () Bool)

(assert (=> b!184637 (=> (not res!87341) (not e!121520))))

(assert (=> b!184637 (= res!87341 (not e!121519))))

(declare-fun res!87340 () Bool)

(assert (=> b!184637 (=> (not res!87340) (not e!121519))))

(assert (=> b!184637 (= res!87340 (validKeyInArray!0 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18625 () Bool)

(assert (=> bm!18625 (= call!18628 (arrayNoDuplicates!0 (_keys!5691 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33132 (Cons!2343 (select (arr!3701 (_keys!5691 thiss!1248)) #b00000000000000000000000000000000) Nil!2344) Nil!2344)))))

(declare-fun d!54985 () Bool)

(declare-fun res!87342 () Bool)

(assert (=> d!54985 (=> res!87342 e!121518)))

(assert (=> d!54985 (= res!87342 (bvsge #b00000000000000000000000000000000 (size!4015 (_keys!5691 thiss!1248))))))

(assert (=> d!54985 (= (arrayNoDuplicates!0 (_keys!5691 thiss!1248) #b00000000000000000000000000000000 Nil!2344) e!121518)))

(assert (= (and d!54985 (not res!87342)) b!184637))

(assert (= (and b!184637 res!87340) b!184636))

(assert (= (and b!184637 res!87341) b!184635))

(assert (= (and b!184635 c!33132) b!184634))

(assert (= (and b!184635 (not c!33132)) b!184633))

(assert (= (or b!184634 b!184633) bm!18625))

(assert (=> b!184635 m!211751))

(assert (=> b!184635 m!211751))

(assert (=> b!184635 m!211763))

(assert (=> b!184636 m!211751))

(assert (=> b!184636 m!211751))

(declare-fun m!212031 () Bool)

(assert (=> b!184636 m!212031))

(assert (=> b!184637 m!211751))

(assert (=> b!184637 m!211751))

(assert (=> b!184637 m!211763))

(assert (=> bm!18625 m!211751))

(declare-fun m!212033 () Bool)

(assert (=> bm!18625 m!212033))

(assert (=> b!184343 d!54985))

(declare-fun condMapEmpty!7427 () Bool)

(declare-fun mapDefault!7427 () ValueCell!1815)

(assert (=> mapNonEmpty!7426 (= condMapEmpty!7427 (= mapRest!7426 ((as const (Array (_ BitVec 32) ValueCell!1815)) mapDefault!7427)))))

(declare-fun e!121522 () Bool)

(declare-fun mapRes!7427 () Bool)

(assert (=> mapNonEmpty!7426 (= tp!16426 (and e!121522 mapRes!7427))))

(declare-fun mapNonEmpty!7427 () Bool)

(declare-fun tp!16427 () Bool)

(declare-fun e!121523 () Bool)

(assert (=> mapNonEmpty!7427 (= mapRes!7427 (and tp!16427 e!121523))))

(declare-fun mapValue!7427 () ValueCell!1815)

(declare-fun mapKey!7427 () (_ BitVec 32))

(declare-fun mapRest!7427 () (Array (_ BitVec 32) ValueCell!1815))

(assert (=> mapNonEmpty!7427 (= mapRest!7426 (store mapRest!7427 mapKey!7427 mapValue!7427))))

(declare-fun b!184638 () Bool)

(assert (=> b!184638 (= e!121523 tp_is_empty!4317)))

(declare-fun mapIsEmpty!7427 () Bool)

(assert (=> mapIsEmpty!7427 mapRes!7427))

(declare-fun b!184639 () Bool)

(assert (=> b!184639 (= e!121522 tp_is_empty!4317)))

(assert (= (and mapNonEmpty!7426 condMapEmpty!7427) mapIsEmpty!7427))

(assert (= (and mapNonEmpty!7426 (not condMapEmpty!7427)) mapNonEmpty!7427))

(assert (= (and mapNonEmpty!7427 ((_ is ValueCellFull!1815) mapValue!7427)) b!184638))

(assert (= (and mapNonEmpty!7426 ((_ is ValueCellFull!1815) mapDefault!7427)) b!184639))

(declare-fun m!212035 () Bool)

(assert (=> mapNonEmpty!7427 m!212035))

(declare-fun b_lambda!7227 () Bool)

(assert (= b_lambda!7223 (or (and b!184307 b_free!4545) b_lambda!7227)))

(declare-fun b_lambda!7229 () Bool)

(assert (= b_lambda!7225 (or (and b!184307 b_free!4545) b_lambda!7229)))

(check-sat (not b!184622) (not b!184572) (not b!184564) (not bm!18625) (not b!184499) (not b!184476) (not b!184560) (not d!54927) (not bm!18616) (not b!184544) (not d!54971) (not d!54931) (not d!54949) (not mapNonEmpty!7427) (not b!184620) tp_is_empty!4317 (not b!184500) (not d!54937) (not d!54917) (not b!184621) (not b!184575) (not b!184482) (not b!184498) (not d!54965) (not b!184547) (not d!54921) (not d!54983) (not d!54967) (not d!54933) (not b_lambda!7221) (not b!184480) (not d!54943) (not b!184488) (not b!184478) (not b!184511) (not b!184566) (not d!54915) (not d!54923) (not d!54955) (not d!54935) (not d!54925) (not d!54957) (not bm!18622) (not d!54953) (not b!184516) (not b!184613) (not d!54939) (not d!54929) (not b!184637) (not b_next!4545) (not b!184529) (not b!184545) (not b!184549) (not b!184565) (not d!54951) (not b!184635) b_and!11137 (not b!184636) (not b!184473) (not d!54919) (not b!184479) (not bm!18619) (not d!54963) (not b!184562) (not b!184492) (not b!184477) (not d!54961) (not b_lambda!7229) (not b!184481) (not b!184571) (not d!54973) (not b!184514) (not d!54941) (not d!54913) (not b!184490) (not b_lambda!7227) (not b!184594) (not b!184494) (not b!184493) (not b!184501) (not b!184611) (not d!54975) (not b!184489))
(check-sat b_and!11137 (not b_next!4545))
