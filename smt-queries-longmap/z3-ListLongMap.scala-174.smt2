; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3320 () Bool)

(assert start!3320)

(declare-fun b!20670 () Bool)

(declare-fun b_free!723 () Bool)

(declare-fun b_next!723 () Bool)

(assert (=> b!20670 (= b_free!723 (not b_next!723))))

(declare-fun tp!3399 () Bool)

(declare-fun b_and!1403 () Bool)

(assert (=> b!20670 (= tp!3399 b_and!1403)))

(declare-fun b!20660 () Bool)

(declare-fun res!13528 () Bool)

(declare-fun e!13504 () Bool)

(assert (=> b!20660 (=> (not res!13528) (not e!13504))))

(declare-datatypes ((V!1141 0))(
  ( (V!1142 (val!520 Int)) )
))
(declare-datatypes ((ValueCell!294 0))(
  ( (ValueCellFull!294 (v!1558 V!1141)) (EmptyCell!294) )
))
(declare-datatypes ((array!1201 0))(
  ( (array!1202 (arr!571 (Array (_ BitVec 32) ValueCell!294)) (size!664 (_ BitVec 32))) )
))
(declare-datatypes ((array!1203 0))(
  ( (array!1204 (arr!572 (Array (_ BitVec 32) (_ BitVec 64))) (size!665 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!174 0))(
  ( (LongMapFixedSize!175 (defaultEntry!1711 Int) (mask!4678 (_ BitVec 32)) (extraKeys!1616 (_ BitVec 32)) (zeroValue!1640 V!1141) (minValue!1640 V!1141) (_size!126 (_ BitVec 32)) (_keys!3134 array!1203) (_values!1702 array!1201) (_vacant!126 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!174 0))(
  ( (Cell!175 (v!1559 LongMapFixedSize!174)) )
))
(declare-datatypes ((LongMap!174 0))(
  ( (LongMap!175 (underlying!98 Cell!174)) )
))
(declare-fun thiss!938 () LongMap!174)

(assert (=> b!20660 (= res!13528 (and (= (size!665 (_keys!3134 (v!1559 (underlying!98 thiss!938)))) (bvadd #b00000000000000000000000000000001 (mask!4678 (v!1559 (underlying!98 thiss!938))))) (bvsge (bvsub (size!665 (_keys!3134 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (size!665 (_keys!3134 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000001) (size!665 (_keys!3134 (v!1559 (underlying!98 thiss!938)))))))))

(declare-fun b!20661 () Bool)

(declare-fun e!13506 () Bool)

(declare-fun tp_is_empty!987 () Bool)

(assert (=> b!20661 (= e!13506 tp_is_empty!987)))

(declare-fun b!20662 () Bool)

(declare-datatypes ((tuple2!866 0))(
  ( (tuple2!867 (_1!436 Bool) (_2!436 Cell!174)) )
))
(declare-fun e!13508 () tuple2!866)

(declare-datatypes ((tuple2!868 0))(
  ( (tuple2!869 (_1!437 Bool) (_2!437 LongMapFixedSize!174)) )
))
(declare-fun lt!6183 () tuple2!868)

(assert (=> b!20662 (= e!13508 (tuple2!867 (_1!437 lt!6183) (Cell!175 (_2!437 lt!6183))))))

(declare-fun call!1120 () tuple2!868)

(assert (=> b!20662 (= lt!6183 call!1120)))

(declare-fun res!13530 () Bool)

(declare-fun e!13502 () Bool)

(assert (=> start!3320 (=> (not res!13530) (not e!13502))))

(declare-fun valid!86 (LongMap!174) Bool)

(assert (=> start!3320 (= res!13530 (valid!86 thiss!938))))

(assert (=> start!3320 e!13502))

(declare-fun e!13507 () Bool)

(assert (=> start!3320 e!13507))

(declare-fun b!20663 () Bool)

(declare-fun e!13500 () Bool)

(assert (=> b!20663 (= e!13500 tp_is_empty!987)))

(declare-fun b!20664 () Bool)

(assert (=> b!20664 (= e!13502 e!13504)))

(declare-fun res!13527 () Bool)

(assert (=> b!20664 (=> (not res!13527) (not e!13504))))

(declare-fun lt!6187 () tuple2!866)

(assert (=> b!20664 (= res!13527 (_1!436 lt!6187))))

(declare-fun e!13509 () tuple2!866)

(assert (=> b!20664 (= lt!6187 e!13509)))

(declare-fun c!2285 () Bool)

(declare-fun lt!6186 () Bool)

(assert (=> b!20664 (= c!2285 (and (not lt!6186) (not (= (bvand (extraKeys!1616 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20664 (= lt!6186 (= (bvand (extraKeys!1616 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!6184 () LongMapFixedSize!174)

(declare-fun getNewLongMapFixedSize!24 ((_ BitVec 32) Int) LongMapFixedSize!174)

(declare-fun computeNewMask!20 (LongMap!174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20664 (= lt!6184 (getNewLongMapFixedSize!24 (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) (defaultEntry!1711 (v!1559 (underlying!98 thiss!938)))))))

(declare-fun b!20665 () Bool)

(declare-fun c!2287 () Bool)

(assert (=> b!20665 (= c!2287 (and (not (= (bvand (extraKeys!1616 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!6186))))

(declare-fun e!13501 () tuple2!866)

(assert (=> b!20665 (= e!13501 e!13508)))

(declare-fun mapNonEmpty!955 () Bool)

(declare-fun mapRes!955 () Bool)

(declare-fun tp!3400 () Bool)

(assert (=> mapNonEmpty!955 (= mapRes!955 (and tp!3400 e!13500))))

(declare-fun mapRest!955 () (Array (_ BitVec 32) ValueCell!294))

(declare-fun mapValue!955 () ValueCell!294)

(declare-fun mapKey!955 () (_ BitVec 32))

(assert (=> mapNonEmpty!955 (= (arr!571 (_values!1702 (v!1559 (underlying!98 thiss!938)))) (store mapRest!955 mapKey!955 mapValue!955))))

(declare-fun b!20666 () Bool)

(declare-fun e!13511 () Bool)

(declare-fun e!13510 () Bool)

(assert (=> b!20666 (= e!13511 e!13510)))

(declare-fun b!20667 () Bool)

(declare-fun e!13503 () Bool)

(assert (=> b!20667 (= e!13503 (and e!13506 mapRes!955))))

(declare-fun condMapEmpty!955 () Bool)

(declare-fun mapDefault!955 () ValueCell!294)

(assert (=> b!20667 (= condMapEmpty!955 (= (arr!571 (_values!1702 (v!1559 (underlying!98 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!294)) mapDefault!955)))))

(declare-fun b!20668 () Bool)

(assert (=> b!20668 (= e!13509 e!13501)))

(declare-fun c!2286 () Bool)

(assert (=> b!20668 (= c!2286 (and (not lt!6186) (= (bvand (extraKeys!1616 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!1116 () Bool)

(declare-fun call!1119 () tuple2!868)

(assert (=> bm!1116 (= call!1120 call!1119)))

(declare-fun b!20669 () Bool)

(assert (=> b!20669 (= e!13508 (tuple2!867 true (Cell!175 lt!6184)))))

(declare-fun array_inv!385 (array!1203) Bool)

(declare-fun array_inv!386 (array!1201) Bool)

(assert (=> b!20670 (= e!13510 (and tp!3399 tp_is_empty!987 (array_inv!385 (_keys!3134 (v!1559 (underlying!98 thiss!938)))) (array_inv!386 (_values!1702 (v!1559 (underlying!98 thiss!938)))) e!13503))))

(declare-fun b!20671 () Bool)

(declare-fun valid!87 (LongMapFixedSize!174) Bool)

(assert (=> b!20671 (= e!13504 (not (valid!87 (v!1559 (_2!436 lt!6187)))))))

(declare-fun b!20672 () Bool)

(assert (=> b!20672 (= e!13507 e!13511)))

(declare-fun b!20673 () Bool)

(declare-fun lt!6189 () tuple2!868)

(assert (=> b!20673 (= lt!6189 call!1120)))

(assert (=> b!20673 (= e!13501 (tuple2!867 (_1!437 lt!6189) (Cell!175 (_2!437 lt!6189))))))

(declare-fun mapIsEmpty!955 () Bool)

(assert (=> mapIsEmpty!955 mapRes!955))

(declare-fun b!20674 () Bool)

(declare-fun res!13529 () Bool)

(assert (=> b!20674 (=> (not res!13529) (not e!13504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!20674 (= res!13529 (validMask!0 (mask!4678 (v!1559 (underlying!98 thiss!938)))))))

(declare-fun bm!1117 () Bool)

(declare-fun lt!6185 () tuple2!868)

(declare-fun update!20 (LongMapFixedSize!174 (_ BitVec 64) V!1141) tuple2!868)

(assert (=> bm!1117 (= call!1119 (update!20 (ite c!2285 (_2!437 lt!6185) lt!6184) (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938)))))))))

(declare-fun b!20675 () Bool)

(declare-fun lt!6188 () tuple2!868)

(assert (=> b!20675 (= e!13509 (tuple2!867 (and (_1!437 lt!6185) (_1!437 lt!6188)) (Cell!175 (_2!437 lt!6188))))))

(assert (=> b!20675 (= lt!6185 (update!20 lt!6184 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1640 (v!1559 (underlying!98 thiss!938)))))))

(assert (=> b!20675 (= lt!6188 call!1119)))

(assert (= (and start!3320 res!13530) b!20664))

(assert (= (and b!20664 c!2285) b!20675))

(assert (= (and b!20664 (not c!2285)) b!20668))

(assert (= (and b!20668 c!2286) b!20673))

(assert (= (and b!20668 (not c!2286)) b!20665))

(assert (= (and b!20665 c!2287) b!20662))

(assert (= (and b!20665 (not c!2287)) b!20669))

(assert (= (or b!20673 b!20662) bm!1116))

(assert (= (or b!20675 bm!1116) bm!1117))

(assert (= (and b!20664 res!13527) b!20674))

(assert (= (and b!20674 res!13529) b!20660))

(assert (= (and b!20660 res!13528) b!20671))

(assert (= (and b!20667 condMapEmpty!955) mapIsEmpty!955))

(assert (= (and b!20667 (not condMapEmpty!955)) mapNonEmpty!955))

(get-info :version)

(assert (= (and mapNonEmpty!955 ((_ is ValueCellFull!294) mapValue!955)) b!20663))

(assert (= (and b!20667 ((_ is ValueCellFull!294) mapDefault!955)) b!20661))

(assert (= b!20670 b!20667))

(assert (= b!20666 b!20670))

(assert (= b!20672 b!20666))

(assert (= start!3320 b!20672))

(declare-fun m!14459 () Bool)

(assert (=> mapNonEmpty!955 m!14459))

(declare-fun m!14461 () Bool)

(assert (=> b!20675 m!14461))

(declare-fun m!14463 () Bool)

(assert (=> b!20664 m!14463))

(assert (=> b!20664 m!14463))

(declare-fun m!14465 () Bool)

(assert (=> b!20664 m!14465))

(declare-fun m!14467 () Bool)

(assert (=> b!20670 m!14467))

(declare-fun m!14469 () Bool)

(assert (=> b!20670 m!14469))

(declare-fun m!14471 () Bool)

(assert (=> start!3320 m!14471))

(declare-fun m!14473 () Bool)

(assert (=> b!20674 m!14473))

(declare-fun m!14475 () Bool)

(assert (=> bm!1117 m!14475))

(declare-fun m!14477 () Bool)

(assert (=> b!20671 m!14477))

(check-sat b_and!1403 tp_is_empty!987 (not b!20664) (not start!3320) (not b!20670) (not b!20671) (not mapNonEmpty!955) (not b_next!723) (not b!20675) (not b!20674) (not bm!1117))
(check-sat b_and!1403 (not b_next!723))
(get-model)

(declare-fun d!3697 () Bool)

(assert (=> d!3697 (= (array_inv!385 (_keys!3134 (v!1559 (underlying!98 thiss!938)))) (bvsge (size!665 (_keys!3134 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20670 d!3697))

(declare-fun d!3699 () Bool)

(assert (=> d!3699 (= (array_inv!386 (_values!1702 (v!1559 (underlying!98 thiss!938)))) (bvsge (size!664 (_values!1702 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20670 d!3699))

(declare-fun d!3701 () Bool)

(assert (=> d!3701 (= (validMask!0 (mask!4678 (v!1559 (underlying!98 thiss!938)))) (and (or (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000000000000111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000000000001111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000000000011111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000000000111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000000001111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000000011111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000000111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000001111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000011111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000001111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000011111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000001111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000011111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000111111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000001111111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000011111111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000111111111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000001111111111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000011111111111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000111111111111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000001111111111111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000011111111111111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000111111111111111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00001111111111111111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00011111111111111111111111111111) (= (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!20674 d!3701))

(declare-fun bm!1172 () Bool)

(declare-fun call!1182 () Bool)

(declare-fun call!1193 () Bool)

(assert (=> bm!1172 (= call!1182 call!1193)))

(declare-fun b!20800 () Bool)

(declare-fun res!13584 () Bool)

(declare-fun e!13598 () Bool)

(assert (=> b!20800 (=> (not res!13584) (not e!13598))))

(declare-datatypes ((SeekEntryResult!49 0))(
  ( (MissingZero!49 (index!2316 (_ BitVec 32))) (Found!49 (index!2317 (_ BitVec 32))) (Intermediate!49 (undefined!861 Bool) (index!2318 (_ BitVec 32)) (x!5036 (_ BitVec 32))) (Undefined!49) (MissingVacant!49 (index!2319 (_ BitVec 32))) )
))
(declare-fun lt!6268 () SeekEntryResult!49)

(assert (=> b!20800 (= res!13584 (= (select (arr!572 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184))) (index!2316 lt!6268)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!1179 () Bool)

(declare-fun bm!1173 () Bool)

(declare-fun arrayContainsKey!0 (array!1203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1173 (= call!1179 (arrayContainsKey!0 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!20801 () Bool)

(declare-fun c!2331 () Bool)

(declare-fun lt!6271 () SeekEntryResult!49)

(assert (=> b!20801 (= c!2331 ((_ is MissingVacant!49) lt!6271))))

(declare-fun e!13596 () tuple2!868)

(declare-fun e!13589 () tuple2!868)

(assert (=> b!20801 (= e!13596 e!13589)))

(declare-fun b!20802 () Bool)

(declare-fun e!13602 () Bool)

(declare-fun call!1196 () Bool)

(assert (=> b!20802 (= e!13602 (not call!1196))))

(declare-fun b!20803 () Bool)

(declare-fun lt!6291 () tuple2!868)

(assert (=> b!20803 (= e!13589 (tuple2!869 (_1!437 lt!6291) (_2!437 lt!6291)))))

(declare-fun call!1181 () tuple2!868)

(assert (=> b!20803 (= lt!6291 call!1181)))

(declare-fun b!20804 () Bool)

(declare-fun e!13591 () Bool)

(declare-fun e!13588 () Bool)

(assert (=> b!20804 (= e!13591 e!13588)))

(declare-fun res!13578 () Bool)

(declare-fun call!1184 () Bool)

(assert (=> b!20804 (= res!13578 call!1184)))

(assert (=> b!20804 (=> (not res!13578) (not e!13588))))

(declare-fun b!20805 () Bool)

(declare-fun e!13593 () Bool)

(declare-fun lt!6266 () SeekEntryResult!49)

(assert (=> b!20805 (= e!13593 ((_ is Undefined!49) lt!6266))))

(declare-fun b!20806 () Bool)

(declare-fun e!13592 () Bool)

(declare-fun e!13594 () Bool)

(assert (=> b!20806 (= e!13592 e!13594)))

(declare-fun c!2328 () Bool)

(declare-fun lt!6282 () tuple2!868)

(assert (=> b!20806 (= c!2328 (_1!437 lt!6282))))

(declare-fun b!20807 () Bool)

(declare-fun res!13575 () Bool)

(assert (=> b!20807 (= res!13575 call!1193)))

(declare-fun e!13604 () Bool)

(assert (=> b!20807 (=> (not res!13575) (not e!13604))))

(declare-fun res!13572 () Bool)

(declare-fun b!20808 () Bool)

(assert (=> b!20808 (= res!13572 (= (select (arr!572 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184))) (index!2319 lt!6268)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20808 (=> (not res!13572) (not e!13588))))

(declare-fun b!20809 () Bool)

(declare-fun c!2332 () Bool)

(assert (=> b!20809 (= c!2332 ((_ is MissingVacant!49) lt!6266))))

(declare-fun e!13601 () Bool)

(assert (=> b!20809 (= e!13601 e!13593)))

(declare-datatypes ((tuple2!874 0))(
  ( (tuple2!875 (_1!440 (_ BitVec 64)) (_2!440 V!1141)) )
))
(declare-datatypes ((List!557 0))(
  ( (Nil!554) (Cons!553 (h!1119 tuple2!874) (t!3212 List!557)) )
))
(declare-datatypes ((ListLongMap!555 0))(
  ( (ListLongMap!556 (toList!293 List!557)) )
))
(declare-fun call!1188 () ListLongMap!555)

(declare-fun bm!1174 () Bool)

(declare-fun map!389 (LongMapFixedSize!174) ListLongMap!555)

(assert (=> bm!1174 (= call!1188 (map!389 (ite c!2285 (_2!437 lt!6185) lt!6184)))))

(declare-fun bm!1175 () Bool)

(assert (=> bm!1175 (= call!1196 call!1179)))

(declare-fun b!20810 () Bool)

(declare-fun e!13590 () Bool)

(assert (=> b!20810 (= e!13594 e!13590)))

(declare-fun call!1187 () ListLongMap!555)

(declare-fun res!13576 () Bool)

(declare-fun contains!223 (ListLongMap!555 (_ BitVec 64)) Bool)

(assert (=> b!20810 (= res!13576 (contains!223 call!1187 (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!20810 (=> (not res!13576) (not e!13590))))

(declare-fun bm!1176 () Bool)

(declare-fun call!1176 () Bool)

(declare-fun call!1175 () Bool)

(assert (=> bm!1176 (= call!1176 call!1175)))

(declare-fun bm!1177 () Bool)

(declare-fun c!2325 () Bool)

(declare-fun call!1185 () ListLongMap!555)

(declare-fun c!2326 () Bool)

(declare-fun lt!6281 () (_ BitVec 32))

(declare-fun lt!6289 () (_ BitVec 32))

(declare-fun getCurrentListMap!124 (array!1203 array!1201 (_ BitVec 32) (_ BitVec 32) V!1141 V!1141 (_ BitVec 32) Int) ListLongMap!555)

(assert (=> bm!1177 (= call!1185 (getCurrentListMap!124 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184)) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184)) (ite c!2325 (ite c!2326 lt!6281 lt!6289) (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184))) (ite (and c!2325 c!2326) (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938))))) (zeroValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184))) (ite c!2325 (ite c!2326 (minValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938)))))) (minValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184))) #b00000000000000000000000000000000 (defaultEntry!1711 (ite c!2285 (_2!437 lt!6185) lt!6184))))))

(declare-fun lt!6279 () SeekEntryResult!49)

(declare-fun b!20811 () Bool)

(assert (=> b!20811 (= e!13604 (= (select (arr!572 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184))) (index!2317 lt!6279)) (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!1178 () Bool)

(declare-fun call!1180 () ListLongMap!555)

(declare-fun call!1194 () ListLongMap!555)

(assert (=> bm!1178 (= call!1180 call!1194)))

(declare-fun b!20812 () Bool)

(declare-datatypes ((Unit!430 0))(
  ( (Unit!431) )
))
(declare-fun lt!6278 () Unit!430)

(declare-fun lt!6274 () Unit!430)

(assert (=> b!20812 (= lt!6278 lt!6274)))

(declare-fun lt!6288 () array!1201)

(assert (=> b!20812 (contains!223 (getCurrentListMap!124 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) lt!6288 (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184)) (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) (zeroValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (minValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) #b00000000000000000000000000000000 (defaultEntry!1711 (ite c!2285 (_2!437 lt!6185) lt!6184))) (select (arr!572 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184))) (index!2317 lt!6271)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!5 (array!1203 array!1201 (_ BitVec 32) (_ BitVec 32) V!1141 V!1141 (_ BitVec 32) Int) Unit!430)

(assert (=> b!20812 (= lt!6274 (lemmaValidKeyInArrayIsInListMap!5 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) lt!6288 (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184)) (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) (zeroValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (minValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (index!2317 lt!6271) (defaultEntry!1711 (ite c!2285 (_2!437 lt!6185) lt!6184))))))

(assert (=> b!20812 (= lt!6288 (array!1202 (store (arr!571 (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184))) (index!2317 lt!6271) (ValueCellFull!294 (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938))))))) (size!664 (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184)))))))

(declare-fun lt!6277 () Unit!430)

(declare-fun lt!6269 () Unit!430)

(assert (=> b!20812 (= lt!6277 lt!6269)))

(declare-fun call!1177 () ListLongMap!555)

(assert (=> b!20812 (= call!1194 call!1177)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!5 (array!1203 array!1201 (_ BitVec 32) (_ BitVec 32) V!1141 V!1141 (_ BitVec 32) (_ BitVec 64) V!1141 Int) Unit!430)

(assert (=> b!20812 (= lt!6269 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!5 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184)) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184)) (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) (zeroValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (minValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (index!2317 lt!6271) (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938))))) (defaultEntry!1711 (ite c!2285 (_2!437 lt!6185) lt!6184))))))

(declare-fun lt!6280 () Unit!430)

(declare-fun e!13599 () Unit!430)

(assert (=> b!20812 (= lt!6280 e!13599)))

(declare-fun c!2329 () Bool)

(declare-fun call!1191 () Bool)

(assert (=> b!20812 (= c!2329 call!1191)))

(declare-fun e!13607 () tuple2!868)

(assert (=> b!20812 (= e!13607 (tuple2!869 true (LongMapFixedSize!175 (defaultEntry!1711 (ite c!2285 (_2!437 lt!6185) lt!6184)) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184)) (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) (zeroValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (minValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_size!126 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (array!1202 (store (arr!571 (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184))) (index!2317 lt!6271) (ValueCellFull!294 (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938))))))) (size!664 (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184)))) (_vacant!126 (ite c!2285 (_2!437 lt!6185) lt!6184)))))))

(declare-fun b!20813 () Bool)

(declare-fun lt!6267 () SeekEntryResult!49)

(declare-fun e!13605 () Bool)

(assert (=> b!20813 (= e!13605 (= (select (arr!572 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184))) (index!2317 lt!6267)) (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!20814 () Bool)

(declare-fun res!13582 () Bool)

(assert (=> b!20814 (=> (not res!13582) (not e!13602))))

(assert (=> b!20814 (= res!13582 (= (select (arr!572 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184))) (index!2316 lt!6266)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1179 () Bool)

(declare-fun call!1198 () ListLongMap!555)

(assert (=> bm!1179 (= call!1191 (contains!223 call!1198 (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!20815 () Bool)

(declare-fun res!13583 () Bool)

(assert (=> b!20815 (=> (not res!13583) (not e!13598))))

(assert (=> b!20815 (= res!13583 call!1184)))

(declare-fun e!13603 () Bool)

(assert (=> b!20815 (= e!13603 e!13598)))

(declare-fun bm!1180 () Bool)

(declare-fun call!1186 () ListLongMap!555)

(assert (=> bm!1180 (= call!1186 call!1185)))

(declare-fun b!20816 () Bool)

(declare-fun call!1178 () Bool)

(assert (=> b!20816 (= e!13588 (not call!1178))))

(declare-fun b!20817 () Bool)

(declare-fun e!13597 () Bool)

(assert (=> b!20817 (= e!13597 (not call!1196))))

(declare-fun b!20818 () Bool)

(declare-fun lt!6275 () Unit!430)

(assert (=> b!20818 (= e!13599 lt!6275)))

(declare-fun call!1192 () Unit!430)

(assert (=> b!20818 (= lt!6275 call!1192)))

(declare-fun call!1190 () SeekEntryResult!49)

(assert (=> b!20818 (= lt!6279 call!1190)))

(declare-fun res!13581 () Bool)

(assert (=> b!20818 (= res!13581 ((_ is Found!49) lt!6279))))

(assert (=> b!20818 (=> (not res!13581) (not e!13604))))

(assert (=> b!20818 e!13604))

(declare-fun c!2324 () Bool)

(declare-fun c!2323 () Bool)

(declare-fun bm!1181 () Bool)

(declare-fun c!2321 () Bool)

(declare-fun c!2327 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1181 (= call!1175 (inRange!0 (ite c!2321 (ite c!2327 (index!2317 lt!6267) (ite c!2323 (index!2316 lt!6268) (index!2319 lt!6268))) (ite c!2329 (index!2317 lt!6279) (ite c!2324 (index!2316 lt!6266) (index!2319 lt!6266)))) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184))))))

(declare-fun b!20819 () Bool)

(declare-fun e!13600 () tuple2!868)

(declare-fun e!13595 () tuple2!868)

(assert (=> b!20819 (= e!13600 e!13595)))

(assert (=> b!20819 (= c!2326 (= (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1182 () Bool)

(declare-fun updateHelperNewKey!5 (LongMapFixedSize!174 (_ BitVec 64) V!1141 (_ BitVec 32)) tuple2!868)

(assert (=> bm!1182 (= call!1181 (updateHelperNewKey!5 (ite c!2285 (_2!437 lt!6185) lt!6184) (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938))))) (ite c!2331 (index!2319 lt!6271) (index!2316 lt!6271))))))

(declare-fun b!20820 () Bool)

(assert (=> b!20820 (= e!13600 e!13596)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1203 (_ BitVec 32)) SeekEntryResult!49)

(assert (=> b!20820 (= lt!6271 (seekEntryOrOpen!0 (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184))))))

(assert (=> b!20820 (= c!2321 ((_ is Undefined!49) lt!6271))))

(declare-fun b!20821 () Bool)

(declare-fun e!13606 () Unit!430)

(declare-fun Unit!432 () Unit!430)

(assert (=> b!20821 (= e!13606 Unit!432)))

(declare-fun lt!6265 () Unit!430)

(assert (=> b!20821 (= lt!6265 call!1192)))

(declare-fun call!1195 () SeekEntryResult!49)

(assert (=> b!20821 (= lt!6267 call!1195)))

(declare-fun res!13573 () Bool)

(assert (=> b!20821 (= res!13573 ((_ is Found!49) lt!6267))))

(assert (=> b!20821 (=> (not res!13573) (not e!13605))))

(assert (=> b!20821 e!13605))

(declare-fun lt!6285 () Unit!430)

(assert (=> b!20821 (= lt!6285 lt!6265)))

(assert (=> b!20821 false))

(declare-fun call!1189 () ListLongMap!555)

(declare-fun bm!1183 () Bool)

(declare-fun +!40 (ListLongMap!555 tuple2!874) ListLongMap!555)

(assert (=> bm!1183 (= call!1194 (+!40 (ite c!2325 call!1189 call!1198) (ite c!2325 (ite c!2326 (tuple2!875 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938)))))) (tuple2!875 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938))))))) (tuple2!875 (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938)))))))))))

(declare-fun bm!1184 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!5 (array!1203 array!1201 (_ BitVec 32) (_ BitVec 32) V!1141 V!1141 (_ BitVec 64) Int) Unit!430)

(assert (=> bm!1184 (= call!1192 (lemmaInListMapThenSeekEntryOrOpenFindsIt!5 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184)) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184)) (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) (zeroValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (minValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1711 (ite c!2285 (_2!437 lt!6185) lt!6184))))))

(declare-fun b!20822 () Bool)

(declare-fun res!13579 () Bool)

(assert (=> b!20822 (=> (not res!13579) (not e!13602))))

(assert (=> b!20822 (= res!13579 call!1182)))

(assert (=> b!20822 (= e!13601 e!13602)))

(declare-fun b!20823 () Bool)

(assert (=> b!20823 (= e!13594 (= call!1187 call!1188))))

(declare-fun b!20824 () Bool)

(declare-fun lt!6272 () Unit!430)

(declare-fun lt!6290 () Unit!430)

(assert (=> b!20824 (= lt!6272 lt!6290)))

(assert (=> b!20824 (= call!1180 call!1186)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!5 (array!1203 array!1201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1141 V!1141 V!1141 Int) Unit!430)

(assert (=> b!20824 (= lt!6290 (lemmaChangeZeroKeyThenAddPairToListMap!5 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184)) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184)) (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) lt!6281 (zeroValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938))))) (minValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (defaultEntry!1711 (ite c!2285 (_2!437 lt!6185) lt!6184))))))

(assert (=> b!20824 (= lt!6281 (bvor (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) #b00000000000000000000000000000001))))

(assert (=> b!20824 (= e!13595 (tuple2!869 true (LongMapFixedSize!175 (defaultEntry!1711 (ite c!2285 (_2!437 lt!6185) lt!6184)) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184)) (bvor (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) #b00000000000000000000000000000001) (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938))))) (minValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_size!126 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_vacant!126 (ite c!2285 (_2!437 lt!6185) lt!6184)))))))

(declare-fun b!20825 () Bool)

(declare-fun lt!6286 () Unit!430)

(declare-fun lt!6276 () Unit!430)

(assert (=> b!20825 (= lt!6286 lt!6276)))

(assert (=> b!20825 (= call!1180 call!1186)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!5 (array!1203 array!1201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1141 V!1141 V!1141 Int) Unit!430)

(assert (=> b!20825 (= lt!6276 (lemmaChangeLongMinValueKeyThenAddPairToListMap!5 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184)) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184)) (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) lt!6289 (zeroValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (minValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938))))) (defaultEntry!1711 (ite c!2285 (_2!437 lt!6185) lt!6184))))))

(assert (=> b!20825 (= lt!6289 (bvor (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) #b00000000000000000000000000000010))))

(assert (=> b!20825 (= e!13595 (tuple2!869 true (LongMapFixedSize!175 (defaultEntry!1711 (ite c!2285 (_2!437 lt!6185) lt!6184)) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184)) (bvor (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) #b00000000000000000000000000000010) (zeroValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938))))) (_size!126 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_vacant!126 (ite c!2285 (_2!437 lt!6185) lt!6184)))))))

(declare-fun b!20826 () Bool)

(declare-fun res!13574 () Bool)

(assert (=> b!20826 (= res!13574 (= (select (arr!572 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184))) (index!2319 lt!6266)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20826 (=> (not res!13574) (not e!13597))))

(declare-fun b!20827 () Bool)

(declare-fun lt!6283 () Unit!430)

(assert (=> b!20827 (= lt!6283 e!13606)))

(assert (=> b!20827 (= c!2327 call!1191)))

(assert (=> b!20827 (= e!13596 (tuple2!869 false (ite c!2285 (_2!437 lt!6185) lt!6184)))))

(declare-fun call!1197 () Unit!430)

(declare-fun bm!1185 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!5 (array!1203 array!1201 (_ BitVec 32) (_ BitVec 32) V!1141 V!1141 (_ BitVec 64) Int) Unit!430)

(assert (=> bm!1185 (= call!1197 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!5 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184)) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184)) (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) (zeroValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (minValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1711 (ite c!2285 (_2!437 lt!6185) lt!6184))))))

(declare-fun call!1183 () SeekEntryResult!49)

(declare-fun bm!1186 () Bool)

(assert (=> bm!1186 (= call!1183 (seekEntryOrOpen!0 (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184))))))

(declare-fun b!20828 () Bool)

(assert (=> b!20828 (= e!13591 ((_ is Undefined!49) lt!6268))))

(declare-fun b!20829 () Bool)

(assert (=> b!20829 (= e!13590 (= call!1187 (+!40 call!1188 (tuple2!875 (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938)))))))))))

(declare-fun b!20830 () Bool)

(declare-fun res!13580 () Bool)

(assert (=> b!20830 (= res!13580 call!1176)))

(assert (=> b!20830 (=> (not res!13580) (not e!13605))))

(declare-fun bm!1187 () Bool)

(assert (=> bm!1187 (= call!1193 call!1175)))

(declare-fun bm!1188 () Bool)

(assert (=> bm!1188 (= call!1184 call!1176)))

(declare-fun b!20831 () Bool)

(assert (=> b!20831 (= e!13598 (not call!1178))))

(declare-fun b!20832 () Bool)

(assert (=> b!20832 (= e!13589 e!13607)))

(declare-fun c!2322 () Bool)

(assert (=> b!20832 (= c!2322 ((_ is MissingZero!49) lt!6271))))

(declare-fun bm!1189 () Bool)

(assert (=> bm!1189 (= call!1177 (getCurrentListMap!124 (_keys!3134 (ite c!2285 (_2!437 lt!6185) lt!6184)) (ite c!2325 (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184)) (array!1202 (store (arr!571 (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184))) (index!2317 lt!6271) (ValueCellFull!294 (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938))))))) (size!664 (_values!1702 (ite c!2285 (_2!437 lt!6185) lt!6184))))) (mask!4678 (ite c!2285 (_2!437 lt!6185) lt!6184)) (extraKeys!1616 (ite c!2285 (_2!437 lt!6185) lt!6184)) (zeroValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) (minValue!1640 (ite c!2285 (_2!437 lt!6185) lt!6184)) #b00000000000000000000000000000000 (defaultEntry!1711 (ite c!2285 (_2!437 lt!6185) lt!6184))))))

(declare-fun b!20833 () Bool)

(declare-fun Unit!433 () Unit!430)

(assert (=> b!20833 (= e!13599 Unit!433)))

(declare-fun lt!6270 () Unit!430)

(assert (=> b!20833 (= lt!6270 call!1197)))

(assert (=> b!20833 (= lt!6266 call!1190)))

(assert (=> b!20833 (= c!2324 ((_ is MissingZero!49) lt!6266))))

(assert (=> b!20833 e!13601))

(declare-fun lt!6287 () Unit!430)

(assert (=> b!20833 (= lt!6287 lt!6270)))

(assert (=> b!20833 false))

(declare-fun bm!1190 () Bool)

(assert (=> bm!1190 (= call!1187 (map!389 (_2!437 lt!6282)))))

(declare-fun b!20834 () Bool)

(declare-fun lt!6273 () tuple2!868)

(assert (=> b!20834 (= lt!6273 call!1181)))

(assert (=> b!20834 (= e!13607 (tuple2!869 (_1!437 lt!6273) (_2!437 lt!6273)))))

(declare-fun b!20835 () Bool)

(assert (=> b!20835 (= e!13593 e!13597)))

(declare-fun res!13571 () Bool)

(assert (=> b!20835 (= res!13571 call!1182)))

(assert (=> b!20835 (=> (not res!13571) (not e!13597))))

(declare-fun bm!1191 () Bool)

(assert (=> bm!1191 (= call!1198 call!1185)))

(declare-fun d!3703 () Bool)

(assert (=> d!3703 e!13592))

(declare-fun res!13577 () Bool)

(assert (=> d!3703 (=> (not res!13577) (not e!13592))))

(assert (=> d!3703 (= res!13577 (valid!87 (_2!437 lt!6282)))))

(assert (=> d!3703 (= lt!6282 e!13600)))

(assert (=> d!3703 (= c!2325 (= (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3703 (valid!87 (ite c!2285 (_2!437 lt!6185) lt!6184))))

(assert (=> d!3703 (= (update!20 (ite c!2285 (_2!437 lt!6185) lt!6184) (ite c!2285 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2286 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2285 (minValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2286 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 (v!1559 (underlying!98 thiss!938)))))) lt!6282)))

(declare-fun b!20836 () Bool)

(declare-fun c!2330 () Bool)

(assert (=> b!20836 (= c!2330 ((_ is MissingVacant!49) lt!6268))))

(assert (=> b!20836 (= e!13603 e!13591)))

(declare-fun bm!1192 () Bool)

(assert (=> bm!1192 (= call!1195 call!1183)))

(declare-fun b!20837 () Bool)

(declare-fun lt!6284 () Unit!430)

(assert (=> b!20837 (= e!13606 lt!6284)))

(assert (=> b!20837 (= lt!6284 call!1197)))

(assert (=> b!20837 (= lt!6268 call!1195)))

(assert (=> b!20837 (= c!2323 ((_ is MissingZero!49) lt!6268))))

(assert (=> b!20837 e!13603))

(declare-fun bm!1193 () Bool)

(assert (=> bm!1193 (= call!1178 call!1179)))

(declare-fun bm!1194 () Bool)

(assert (=> bm!1194 (= call!1190 call!1183)))

(declare-fun bm!1195 () Bool)

(assert (=> bm!1195 (= call!1189 call!1177)))

(assert (= (and d!3703 c!2325) b!20819))

(assert (= (and d!3703 (not c!2325)) b!20820))

(assert (= (and b!20819 c!2326) b!20824))

(assert (= (and b!20819 (not c!2326)) b!20825))

(assert (= (or b!20824 b!20825) bm!1180))

(assert (= (or b!20824 b!20825) bm!1195))

(assert (= (or b!20824 b!20825) bm!1178))

(assert (= (and b!20820 c!2321) b!20827))

(assert (= (and b!20820 (not c!2321)) b!20801))

(assert (= (and b!20827 c!2327) b!20821))

(assert (= (and b!20827 (not c!2327)) b!20837))

(assert (= (and b!20821 res!13573) b!20830))

(assert (= (and b!20830 res!13580) b!20813))

(assert (= (and b!20837 c!2323) b!20815))

(assert (= (and b!20837 (not c!2323)) b!20836))

(assert (= (and b!20815 res!13583) b!20800))

(assert (= (and b!20800 res!13584) b!20831))

(assert (= (and b!20836 c!2330) b!20804))

(assert (= (and b!20836 (not c!2330)) b!20828))

(assert (= (and b!20804 res!13578) b!20808))

(assert (= (and b!20808 res!13572) b!20816))

(assert (= (or b!20815 b!20804) bm!1188))

(assert (= (or b!20831 b!20816) bm!1193))

(assert (= (or b!20830 bm!1188) bm!1176))

(assert (= (or b!20821 b!20837) bm!1192))

(assert (= (and b!20801 c!2331) b!20803))

(assert (= (and b!20801 (not c!2331)) b!20832))

(assert (= (and b!20832 c!2322) b!20834))

(assert (= (and b!20832 (not c!2322)) b!20812))

(assert (= (and b!20812 c!2329) b!20818))

(assert (= (and b!20812 (not c!2329)) b!20833))

(assert (= (and b!20818 res!13581) b!20807))

(assert (= (and b!20807 res!13575) b!20811))

(assert (= (and b!20833 c!2324) b!20822))

(assert (= (and b!20833 (not c!2324)) b!20809))

(assert (= (and b!20822 res!13579) b!20814))

(assert (= (and b!20814 res!13582) b!20802))

(assert (= (and b!20809 c!2332) b!20835))

(assert (= (and b!20809 (not c!2332)) b!20805))

(assert (= (and b!20835 res!13571) b!20826))

(assert (= (and b!20826 res!13574) b!20817))

(assert (= (or b!20822 b!20835) bm!1172))

(assert (= (or b!20802 b!20817) bm!1175))

(assert (= (or b!20807 bm!1172) bm!1187))

(assert (= (or b!20818 b!20833) bm!1194))

(assert (= (or b!20803 b!20834) bm!1182))

(assert (= (or b!20827 b!20812) bm!1191))

(assert (= (or b!20821 b!20818) bm!1184))

(assert (= (or bm!1193 bm!1175) bm!1173))

(assert (= (or bm!1176 bm!1187) bm!1181))

(assert (= (or bm!1192 bm!1194) bm!1186))

(assert (= (or b!20837 b!20833) bm!1185))

(assert (= (or b!20827 b!20812) bm!1179))

(assert (= (or bm!1180 bm!1191) bm!1177))

(assert (= (or bm!1195 b!20812) bm!1189))

(assert (= (or bm!1178 b!20812) bm!1183))

(assert (= (and d!3703 res!13577) b!20806))

(assert (= (and b!20806 c!2328) b!20810))

(assert (= (and b!20806 (not c!2328)) b!20823))

(assert (= (and b!20810 res!13576) b!20829))

(assert (= (or b!20810 b!20829 b!20823) bm!1190))

(assert (= (or b!20829 b!20823) bm!1174))

(declare-fun m!14499 () Bool)

(assert (=> bm!1190 m!14499))

(declare-fun m!14501 () Bool)

(assert (=> bm!1181 m!14501))

(declare-fun m!14503 () Bool)

(assert (=> b!20813 m!14503))

(declare-fun m!14505 () Bool)

(assert (=> b!20826 m!14505))

(declare-fun m!14507 () Bool)

(assert (=> bm!1179 m!14507))

(declare-fun m!14509 () Bool)

(assert (=> d!3703 m!14509))

(declare-fun m!14511 () Bool)

(assert (=> d!3703 m!14511))

(declare-fun m!14513 () Bool)

(assert (=> bm!1189 m!14513))

(declare-fun m!14515 () Bool)

(assert (=> bm!1189 m!14515))

(declare-fun m!14517 () Bool)

(assert (=> b!20829 m!14517))

(declare-fun m!14519 () Bool)

(assert (=> b!20820 m!14519))

(declare-fun m!14521 () Bool)

(assert (=> bm!1185 m!14521))

(declare-fun m!14523 () Bool)

(assert (=> bm!1184 m!14523))

(declare-fun m!14525 () Bool)

(assert (=> b!20800 m!14525))

(declare-fun m!14527 () Bool)

(assert (=> bm!1177 m!14527))

(declare-fun m!14529 () Bool)

(assert (=> b!20812 m!14529))

(declare-fun m!14531 () Bool)

(assert (=> b!20812 m!14531))

(declare-fun m!14533 () Bool)

(assert (=> b!20812 m!14533))

(assert (=> b!20812 m!14533))

(declare-fun m!14535 () Bool)

(assert (=> b!20812 m!14535))

(declare-fun m!14537 () Bool)

(assert (=> b!20812 m!14537))

(assert (=> b!20812 m!14513))

(assert (=> b!20812 m!14535))

(declare-fun m!14539 () Bool)

(assert (=> bm!1182 m!14539))

(declare-fun m!14541 () Bool)

(assert (=> b!20808 m!14541))

(declare-fun m!14543 () Bool)

(assert (=> bm!1183 m!14543))

(declare-fun m!14545 () Bool)

(assert (=> bm!1173 m!14545))

(declare-fun m!14547 () Bool)

(assert (=> b!20825 m!14547))

(declare-fun m!14549 () Bool)

(assert (=> b!20810 m!14549))

(assert (=> bm!1186 m!14519))

(declare-fun m!14551 () Bool)

(assert (=> bm!1174 m!14551))

(declare-fun m!14553 () Bool)

(assert (=> b!20814 m!14553))

(declare-fun m!14555 () Bool)

(assert (=> b!20824 m!14555))

(declare-fun m!14557 () Bool)

(assert (=> b!20811 m!14557))

(assert (=> bm!1117 d!3703))

(declare-fun d!3705 () Bool)

(declare-fun res!13591 () Bool)

(declare-fun e!13610 () Bool)

(assert (=> d!3705 (=> (not res!13591) (not e!13610))))

(declare-fun simpleValid!17 (LongMapFixedSize!174) Bool)

(assert (=> d!3705 (= res!13591 (simpleValid!17 (v!1559 (_2!436 lt!6187))))))

(assert (=> d!3705 (= (valid!87 (v!1559 (_2!436 lt!6187))) e!13610)))

(declare-fun b!20844 () Bool)

(declare-fun res!13592 () Bool)

(assert (=> b!20844 (=> (not res!13592) (not e!13610))))

(declare-fun arrayCountValidKeys!0 (array!1203 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20844 (= res!13592 (= (arrayCountValidKeys!0 (_keys!3134 (v!1559 (_2!436 lt!6187))) #b00000000000000000000000000000000 (size!665 (_keys!3134 (v!1559 (_2!436 lt!6187))))) (_size!126 (v!1559 (_2!436 lt!6187)))))))

(declare-fun b!20845 () Bool)

(declare-fun res!13593 () Bool)

(assert (=> b!20845 (=> (not res!13593) (not e!13610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1203 (_ BitVec 32)) Bool)

(assert (=> b!20845 (= res!13593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3134 (v!1559 (_2!436 lt!6187))) (mask!4678 (v!1559 (_2!436 lt!6187)))))))

(declare-fun b!20846 () Bool)

(declare-datatypes ((List!558 0))(
  ( (Nil!555) (Cons!554 (h!1120 (_ BitVec 64)) (t!3213 List!558)) )
))
(declare-fun arrayNoDuplicates!0 (array!1203 (_ BitVec 32) List!558) Bool)

(assert (=> b!20846 (= e!13610 (arrayNoDuplicates!0 (_keys!3134 (v!1559 (_2!436 lt!6187))) #b00000000000000000000000000000000 Nil!555))))

(assert (= (and d!3705 res!13591) b!20844))

(assert (= (and b!20844 res!13592) b!20845))

(assert (= (and b!20845 res!13593) b!20846))

(declare-fun m!14559 () Bool)

(assert (=> d!3705 m!14559))

(declare-fun m!14561 () Bool)

(assert (=> b!20844 m!14561))

(declare-fun m!14563 () Bool)

(assert (=> b!20845 m!14563))

(declare-fun m!14565 () Bool)

(assert (=> b!20846 m!14565))

(assert (=> b!20671 d!3705))

(declare-fun bm!1196 () Bool)

(declare-fun call!1206 () Bool)

(declare-fun call!1217 () Bool)

(assert (=> bm!1196 (= call!1206 call!1217)))

(declare-fun b!20847 () Bool)

(declare-fun res!13607 () Bool)

(declare-fun e!13621 () Bool)

(assert (=> b!20847 (=> (not res!13607) (not e!13621))))

(declare-fun lt!6295 () SeekEntryResult!49)

(assert (=> b!20847 (= res!13607 (= (select (arr!572 (_keys!3134 lt!6184)) (index!2316 lt!6295)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1197 () Bool)

(declare-fun call!1203 () Bool)

(assert (=> bm!1197 (= call!1203 (arrayContainsKey!0 (_keys!3134 lt!6184) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!20848 () Bool)

(declare-fun c!2343 () Bool)

(declare-fun lt!6298 () SeekEntryResult!49)

(assert (=> b!20848 (= c!2343 ((_ is MissingVacant!49) lt!6298))))

(declare-fun e!13619 () tuple2!868)

(declare-fun e!13612 () tuple2!868)

(assert (=> b!20848 (= e!13619 e!13612)))

(declare-fun b!20849 () Bool)

(declare-fun e!13625 () Bool)

(declare-fun call!1220 () Bool)

(assert (=> b!20849 (= e!13625 (not call!1220))))

(declare-fun b!20850 () Bool)

(declare-fun lt!6318 () tuple2!868)

(assert (=> b!20850 (= e!13612 (tuple2!869 (_1!437 lt!6318) (_2!437 lt!6318)))))

(declare-fun call!1205 () tuple2!868)

(assert (=> b!20850 (= lt!6318 call!1205)))

(declare-fun b!20851 () Bool)

(declare-fun e!13614 () Bool)

(declare-fun e!13611 () Bool)

(assert (=> b!20851 (= e!13614 e!13611)))

(declare-fun res!13601 () Bool)

(declare-fun call!1208 () Bool)

(assert (=> b!20851 (= res!13601 call!1208)))

(assert (=> b!20851 (=> (not res!13601) (not e!13611))))

(declare-fun b!20852 () Bool)

(declare-fun e!13616 () Bool)

(declare-fun lt!6293 () SeekEntryResult!49)

(assert (=> b!20852 (= e!13616 ((_ is Undefined!49) lt!6293))))

(declare-fun b!20853 () Bool)

(declare-fun e!13615 () Bool)

(declare-fun e!13617 () Bool)

(assert (=> b!20853 (= e!13615 e!13617)))

(declare-fun c!2340 () Bool)

(declare-fun lt!6309 () tuple2!868)

(assert (=> b!20853 (= c!2340 (_1!437 lt!6309))))

(declare-fun b!20854 () Bool)

(declare-fun res!13598 () Bool)

(assert (=> b!20854 (= res!13598 call!1217)))

(declare-fun e!13627 () Bool)

(assert (=> b!20854 (=> (not res!13598) (not e!13627))))

(declare-fun b!20855 () Bool)

(declare-fun res!13595 () Bool)

(assert (=> b!20855 (= res!13595 (= (select (arr!572 (_keys!3134 lt!6184)) (index!2319 lt!6295)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20855 (=> (not res!13595) (not e!13611))))

(declare-fun b!20856 () Bool)

(declare-fun c!2344 () Bool)

(assert (=> b!20856 (= c!2344 ((_ is MissingVacant!49) lt!6293))))

(declare-fun e!13624 () Bool)

(assert (=> b!20856 (= e!13624 e!13616)))

(declare-fun bm!1198 () Bool)

(declare-fun call!1212 () ListLongMap!555)

(assert (=> bm!1198 (= call!1212 (map!389 lt!6184))))

(declare-fun bm!1199 () Bool)

(assert (=> bm!1199 (= call!1220 call!1203)))

(declare-fun b!20857 () Bool)

(declare-fun e!13613 () Bool)

(assert (=> b!20857 (= e!13617 e!13613)))

(declare-fun res!13599 () Bool)

(declare-fun call!1211 () ListLongMap!555)

(assert (=> b!20857 (= res!13599 (contains!223 call!1211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20857 (=> (not res!13599) (not e!13613))))

(declare-fun bm!1200 () Bool)

(declare-fun call!1200 () Bool)

(declare-fun call!1199 () Bool)

(assert (=> bm!1200 (= call!1200 call!1199)))

(declare-fun call!1209 () ListLongMap!555)

(declare-fun lt!6308 () (_ BitVec 32))

(declare-fun bm!1201 () Bool)

(declare-fun lt!6316 () (_ BitVec 32))

(declare-fun c!2337 () Bool)

(declare-fun c!2338 () Bool)

(assert (=> bm!1201 (= call!1209 (getCurrentListMap!124 (_keys!3134 lt!6184) (_values!1702 lt!6184) (mask!4678 lt!6184) (ite c!2337 (ite c!2338 lt!6308 lt!6316) (extraKeys!1616 lt!6184)) (ite (and c!2337 c!2338) (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (zeroValue!1640 lt!6184)) (ite c!2337 (ite c!2338 (minValue!1640 lt!6184) (zeroValue!1640 (v!1559 (underlying!98 thiss!938)))) (minValue!1640 lt!6184)) #b00000000000000000000000000000000 (defaultEntry!1711 lt!6184)))))

(declare-fun b!20858 () Bool)

(declare-fun lt!6306 () SeekEntryResult!49)

(assert (=> b!20858 (= e!13627 (= (select (arr!572 (_keys!3134 lt!6184)) (index!2317 lt!6306)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1202 () Bool)

(declare-fun call!1204 () ListLongMap!555)

(declare-fun call!1218 () ListLongMap!555)

(assert (=> bm!1202 (= call!1204 call!1218)))

(declare-fun b!20859 () Bool)

(declare-fun lt!6305 () Unit!430)

(declare-fun lt!6301 () Unit!430)

(assert (=> b!20859 (= lt!6305 lt!6301)))

(declare-fun lt!6315 () array!1201)

(assert (=> b!20859 (contains!223 (getCurrentListMap!124 (_keys!3134 lt!6184) lt!6315 (mask!4678 lt!6184) (extraKeys!1616 lt!6184) (zeroValue!1640 lt!6184) (minValue!1640 lt!6184) #b00000000000000000000000000000000 (defaultEntry!1711 lt!6184)) (select (arr!572 (_keys!3134 lt!6184)) (index!2317 lt!6298)))))

(assert (=> b!20859 (= lt!6301 (lemmaValidKeyInArrayIsInListMap!5 (_keys!3134 lt!6184) lt!6315 (mask!4678 lt!6184) (extraKeys!1616 lt!6184) (zeroValue!1640 lt!6184) (minValue!1640 lt!6184) (index!2317 lt!6298) (defaultEntry!1711 lt!6184)))))

(assert (=> b!20859 (= lt!6315 (array!1202 (store (arr!571 (_values!1702 lt!6184)) (index!2317 lt!6298) (ValueCellFull!294 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))))) (size!664 (_values!1702 lt!6184))))))

(declare-fun lt!6304 () Unit!430)

(declare-fun lt!6296 () Unit!430)

(assert (=> b!20859 (= lt!6304 lt!6296)))

(declare-fun call!1201 () ListLongMap!555)

(assert (=> b!20859 (= call!1218 call!1201)))

(assert (=> b!20859 (= lt!6296 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!5 (_keys!3134 lt!6184) (_values!1702 lt!6184) (mask!4678 lt!6184) (extraKeys!1616 lt!6184) (zeroValue!1640 lt!6184) (minValue!1640 lt!6184) (index!2317 lt!6298) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (defaultEntry!1711 lt!6184)))))

(declare-fun lt!6307 () Unit!430)

(declare-fun e!13622 () Unit!430)

(assert (=> b!20859 (= lt!6307 e!13622)))

(declare-fun c!2341 () Bool)

(declare-fun call!1215 () Bool)

(assert (=> b!20859 (= c!2341 call!1215)))

(declare-fun e!13630 () tuple2!868)

(assert (=> b!20859 (= e!13630 (tuple2!869 true (LongMapFixedSize!175 (defaultEntry!1711 lt!6184) (mask!4678 lt!6184) (extraKeys!1616 lt!6184) (zeroValue!1640 lt!6184) (minValue!1640 lt!6184) (_size!126 lt!6184) (_keys!3134 lt!6184) (array!1202 (store (arr!571 (_values!1702 lt!6184)) (index!2317 lt!6298) (ValueCellFull!294 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))))) (size!664 (_values!1702 lt!6184))) (_vacant!126 lt!6184))))))

(declare-fun b!20860 () Bool)

(declare-fun e!13628 () Bool)

(declare-fun lt!6294 () SeekEntryResult!49)

(assert (=> b!20860 (= e!13628 (= (select (arr!572 (_keys!3134 lt!6184)) (index!2317 lt!6294)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20861 () Bool)

(declare-fun res!13605 () Bool)

(assert (=> b!20861 (=> (not res!13605) (not e!13625))))

(assert (=> b!20861 (= res!13605 (= (select (arr!572 (_keys!3134 lt!6184)) (index!2316 lt!6293)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1203 () Bool)

(declare-fun call!1222 () ListLongMap!555)

(assert (=> bm!1203 (= call!1215 (contains!223 call!1222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!20862 () Bool)

(declare-fun res!13606 () Bool)

(assert (=> b!20862 (=> (not res!13606) (not e!13621))))

(assert (=> b!20862 (= res!13606 call!1208)))

(declare-fun e!13626 () Bool)

(assert (=> b!20862 (= e!13626 e!13621)))

(declare-fun bm!1204 () Bool)

(declare-fun call!1210 () ListLongMap!555)

(assert (=> bm!1204 (= call!1210 call!1209)))

(declare-fun b!20863 () Bool)

(declare-fun call!1202 () Bool)

(assert (=> b!20863 (= e!13611 (not call!1202))))

(declare-fun b!20864 () Bool)

(declare-fun e!13620 () Bool)

(assert (=> b!20864 (= e!13620 (not call!1220))))

(declare-fun b!20865 () Bool)

(declare-fun lt!6302 () Unit!430)

(assert (=> b!20865 (= e!13622 lt!6302)))

(declare-fun call!1216 () Unit!430)

(assert (=> b!20865 (= lt!6302 call!1216)))

(declare-fun call!1214 () SeekEntryResult!49)

(assert (=> b!20865 (= lt!6306 call!1214)))

(declare-fun res!13604 () Bool)

(assert (=> b!20865 (= res!13604 ((_ is Found!49) lt!6306))))

(assert (=> b!20865 (=> (not res!13604) (not e!13627))))

(assert (=> b!20865 e!13627))

(declare-fun c!2336 () Bool)

(declare-fun c!2335 () Bool)

(declare-fun bm!1205 () Bool)

(declare-fun c!2333 () Bool)

(declare-fun c!2339 () Bool)

(assert (=> bm!1205 (= call!1199 (inRange!0 (ite c!2333 (ite c!2339 (index!2317 lt!6294) (ite c!2335 (index!2316 lt!6295) (index!2319 lt!6295))) (ite c!2341 (index!2317 lt!6306) (ite c!2336 (index!2316 lt!6293) (index!2319 lt!6293)))) (mask!4678 lt!6184)))))

(declare-fun b!20866 () Bool)

(declare-fun e!13623 () tuple2!868)

(declare-fun e!13618 () tuple2!868)

(assert (=> b!20866 (= e!13623 e!13618)))

(assert (=> b!20866 (= c!2338 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1206 () Bool)

(assert (=> bm!1206 (= call!1205 (updateHelperNewKey!5 lt!6184 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (ite c!2343 (index!2319 lt!6298) (index!2316 lt!6298))))))

(declare-fun b!20867 () Bool)

(assert (=> b!20867 (= e!13623 e!13619)))

(assert (=> b!20867 (= lt!6298 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3134 lt!6184) (mask!4678 lt!6184)))))

(assert (=> b!20867 (= c!2333 ((_ is Undefined!49) lt!6298))))

(declare-fun b!20868 () Bool)

(declare-fun e!13629 () Unit!430)

(declare-fun Unit!434 () Unit!430)

(assert (=> b!20868 (= e!13629 Unit!434)))

(declare-fun lt!6292 () Unit!430)

(assert (=> b!20868 (= lt!6292 call!1216)))

(declare-fun call!1219 () SeekEntryResult!49)

(assert (=> b!20868 (= lt!6294 call!1219)))

(declare-fun res!13596 () Bool)

(assert (=> b!20868 (= res!13596 ((_ is Found!49) lt!6294))))

(assert (=> b!20868 (=> (not res!13596) (not e!13628))))

(assert (=> b!20868 e!13628))

(declare-fun lt!6312 () Unit!430)

(assert (=> b!20868 (= lt!6312 lt!6292)))

(assert (=> b!20868 false))

(declare-fun call!1213 () ListLongMap!555)

(declare-fun bm!1207 () Bool)

(assert (=> bm!1207 (= call!1218 (+!40 (ite c!2337 call!1213 call!1222) (ite c!2337 (ite c!2338 (tuple2!875 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1640 (v!1559 (underlying!98 thiss!938)))) (tuple2!875 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))))) (tuple2!875 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1640 (v!1559 (underlying!98 thiss!938)))))))))

(declare-fun bm!1208 () Bool)

(assert (=> bm!1208 (= call!1216 (lemmaInListMapThenSeekEntryOrOpenFindsIt!5 (_keys!3134 lt!6184) (_values!1702 lt!6184) (mask!4678 lt!6184) (extraKeys!1616 lt!6184) (zeroValue!1640 lt!6184) (minValue!1640 lt!6184) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1711 lt!6184)))))

(declare-fun b!20869 () Bool)

(declare-fun res!13602 () Bool)

(assert (=> b!20869 (=> (not res!13602) (not e!13625))))

(assert (=> b!20869 (= res!13602 call!1206)))

(assert (=> b!20869 (= e!13624 e!13625)))

(declare-fun b!20870 () Bool)

(assert (=> b!20870 (= e!13617 (= call!1211 call!1212))))

(declare-fun b!20871 () Bool)

(declare-fun lt!6299 () Unit!430)

(declare-fun lt!6317 () Unit!430)

(assert (=> b!20871 (= lt!6299 lt!6317)))

(assert (=> b!20871 (= call!1204 call!1210)))

(assert (=> b!20871 (= lt!6317 (lemmaChangeZeroKeyThenAddPairToListMap!5 (_keys!3134 lt!6184) (_values!1702 lt!6184) (mask!4678 lt!6184) (extraKeys!1616 lt!6184) lt!6308 (zeroValue!1640 lt!6184) (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 lt!6184) (defaultEntry!1711 lt!6184)))))

(assert (=> b!20871 (= lt!6308 (bvor (extraKeys!1616 lt!6184) #b00000000000000000000000000000001))))

(assert (=> b!20871 (= e!13618 (tuple2!869 true (LongMapFixedSize!175 (defaultEntry!1711 lt!6184) (mask!4678 lt!6184) (bvor (extraKeys!1616 lt!6184) #b00000000000000000000000000000001) (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (minValue!1640 lt!6184) (_size!126 lt!6184) (_keys!3134 lt!6184) (_values!1702 lt!6184) (_vacant!126 lt!6184))))))

(declare-fun b!20872 () Bool)

(declare-fun lt!6313 () Unit!430)

(declare-fun lt!6303 () Unit!430)

(assert (=> b!20872 (= lt!6313 lt!6303)))

(assert (=> b!20872 (= call!1204 call!1210)))

(assert (=> b!20872 (= lt!6303 (lemmaChangeLongMinValueKeyThenAddPairToListMap!5 (_keys!3134 lt!6184) (_values!1702 lt!6184) (mask!4678 lt!6184) (extraKeys!1616 lt!6184) lt!6316 (zeroValue!1640 lt!6184) (minValue!1640 lt!6184) (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (defaultEntry!1711 lt!6184)))))

(assert (=> b!20872 (= lt!6316 (bvor (extraKeys!1616 lt!6184) #b00000000000000000000000000000010))))

(assert (=> b!20872 (= e!13618 (tuple2!869 true (LongMapFixedSize!175 (defaultEntry!1711 lt!6184) (mask!4678 lt!6184) (bvor (extraKeys!1616 lt!6184) #b00000000000000000000000000000010) (zeroValue!1640 lt!6184) (zeroValue!1640 (v!1559 (underlying!98 thiss!938))) (_size!126 lt!6184) (_keys!3134 lt!6184) (_values!1702 lt!6184) (_vacant!126 lt!6184))))))

(declare-fun b!20873 () Bool)

(declare-fun res!13597 () Bool)

(assert (=> b!20873 (= res!13597 (= (select (arr!572 (_keys!3134 lt!6184)) (index!2319 lt!6293)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20873 (=> (not res!13597) (not e!13620))))

(declare-fun b!20874 () Bool)

(declare-fun lt!6310 () Unit!430)

(assert (=> b!20874 (= lt!6310 e!13629)))

(assert (=> b!20874 (= c!2339 call!1215)))

(assert (=> b!20874 (= e!13619 (tuple2!869 false lt!6184))))

(declare-fun bm!1209 () Bool)

(declare-fun call!1221 () Unit!430)

(assert (=> bm!1209 (= call!1221 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!5 (_keys!3134 lt!6184) (_values!1702 lt!6184) (mask!4678 lt!6184) (extraKeys!1616 lt!6184) (zeroValue!1640 lt!6184) (minValue!1640 lt!6184) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1711 lt!6184)))))

(declare-fun bm!1210 () Bool)

(declare-fun call!1207 () SeekEntryResult!49)

(assert (=> bm!1210 (= call!1207 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3134 lt!6184) (mask!4678 lt!6184)))))

(declare-fun b!20875 () Bool)

(assert (=> b!20875 (= e!13614 ((_ is Undefined!49) lt!6295))))

(declare-fun b!20876 () Bool)

(assert (=> b!20876 (= e!13613 (= call!1211 (+!40 call!1212 (tuple2!875 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1640 (v!1559 (underlying!98 thiss!938)))))))))

(declare-fun b!20877 () Bool)

(declare-fun res!13603 () Bool)

(assert (=> b!20877 (= res!13603 call!1200)))

(assert (=> b!20877 (=> (not res!13603) (not e!13628))))

(declare-fun bm!1211 () Bool)

(assert (=> bm!1211 (= call!1217 call!1199)))

(declare-fun bm!1212 () Bool)

(assert (=> bm!1212 (= call!1208 call!1200)))

(declare-fun b!20878 () Bool)

(assert (=> b!20878 (= e!13621 (not call!1202))))

(declare-fun b!20879 () Bool)

(assert (=> b!20879 (= e!13612 e!13630)))

(declare-fun c!2334 () Bool)

(assert (=> b!20879 (= c!2334 ((_ is MissingZero!49) lt!6298))))

(declare-fun bm!1213 () Bool)

(assert (=> bm!1213 (= call!1201 (getCurrentListMap!124 (_keys!3134 lt!6184) (ite c!2337 (_values!1702 lt!6184) (array!1202 (store (arr!571 (_values!1702 lt!6184)) (index!2317 lt!6298) (ValueCellFull!294 (zeroValue!1640 (v!1559 (underlying!98 thiss!938))))) (size!664 (_values!1702 lt!6184)))) (mask!4678 lt!6184) (extraKeys!1616 lt!6184) (zeroValue!1640 lt!6184) (minValue!1640 lt!6184) #b00000000000000000000000000000000 (defaultEntry!1711 lt!6184)))))

(declare-fun b!20880 () Bool)

(declare-fun Unit!435 () Unit!430)

(assert (=> b!20880 (= e!13622 Unit!435)))

(declare-fun lt!6297 () Unit!430)

(assert (=> b!20880 (= lt!6297 call!1221)))

(assert (=> b!20880 (= lt!6293 call!1214)))

(assert (=> b!20880 (= c!2336 ((_ is MissingZero!49) lt!6293))))

(assert (=> b!20880 e!13624))

(declare-fun lt!6314 () Unit!430)

(assert (=> b!20880 (= lt!6314 lt!6297)))

(assert (=> b!20880 false))

(declare-fun bm!1214 () Bool)

(assert (=> bm!1214 (= call!1211 (map!389 (_2!437 lt!6309)))))

(declare-fun b!20881 () Bool)

(declare-fun lt!6300 () tuple2!868)

(assert (=> b!20881 (= lt!6300 call!1205)))

(assert (=> b!20881 (= e!13630 (tuple2!869 (_1!437 lt!6300) (_2!437 lt!6300)))))

(declare-fun b!20882 () Bool)

(assert (=> b!20882 (= e!13616 e!13620)))

(declare-fun res!13594 () Bool)

(assert (=> b!20882 (= res!13594 call!1206)))

(assert (=> b!20882 (=> (not res!13594) (not e!13620))))

(declare-fun bm!1215 () Bool)

(assert (=> bm!1215 (= call!1222 call!1209)))

(declare-fun d!3707 () Bool)

(assert (=> d!3707 e!13615))

(declare-fun res!13600 () Bool)

(assert (=> d!3707 (=> (not res!13600) (not e!13615))))

(assert (=> d!3707 (= res!13600 (valid!87 (_2!437 lt!6309)))))

(assert (=> d!3707 (= lt!6309 e!13623)))

(assert (=> d!3707 (= c!2337 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3707 (valid!87 lt!6184)))

(assert (=> d!3707 (= (update!20 lt!6184 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1640 (v!1559 (underlying!98 thiss!938)))) lt!6309)))

(declare-fun b!20883 () Bool)

(declare-fun c!2342 () Bool)

(assert (=> b!20883 (= c!2342 ((_ is MissingVacant!49) lt!6295))))

(assert (=> b!20883 (= e!13626 e!13614)))

(declare-fun bm!1216 () Bool)

(assert (=> bm!1216 (= call!1219 call!1207)))

(declare-fun b!20884 () Bool)

(declare-fun lt!6311 () Unit!430)

(assert (=> b!20884 (= e!13629 lt!6311)))

(assert (=> b!20884 (= lt!6311 call!1221)))

(assert (=> b!20884 (= lt!6295 call!1219)))

(assert (=> b!20884 (= c!2335 ((_ is MissingZero!49) lt!6295))))

(assert (=> b!20884 e!13626))

(declare-fun bm!1217 () Bool)

(assert (=> bm!1217 (= call!1202 call!1203)))

(declare-fun bm!1218 () Bool)

(assert (=> bm!1218 (= call!1214 call!1207)))

(declare-fun bm!1219 () Bool)

(assert (=> bm!1219 (= call!1213 call!1201)))

(assert (= (and d!3707 c!2337) b!20866))

(assert (= (and d!3707 (not c!2337)) b!20867))

(assert (= (and b!20866 c!2338) b!20871))

(assert (= (and b!20866 (not c!2338)) b!20872))

(assert (= (or b!20871 b!20872) bm!1204))

(assert (= (or b!20871 b!20872) bm!1219))

(assert (= (or b!20871 b!20872) bm!1202))

(assert (= (and b!20867 c!2333) b!20874))

(assert (= (and b!20867 (not c!2333)) b!20848))

(assert (= (and b!20874 c!2339) b!20868))

(assert (= (and b!20874 (not c!2339)) b!20884))

(assert (= (and b!20868 res!13596) b!20877))

(assert (= (and b!20877 res!13603) b!20860))

(assert (= (and b!20884 c!2335) b!20862))

(assert (= (and b!20884 (not c!2335)) b!20883))

(assert (= (and b!20862 res!13606) b!20847))

(assert (= (and b!20847 res!13607) b!20878))

(assert (= (and b!20883 c!2342) b!20851))

(assert (= (and b!20883 (not c!2342)) b!20875))

(assert (= (and b!20851 res!13601) b!20855))

(assert (= (and b!20855 res!13595) b!20863))

(assert (= (or b!20862 b!20851) bm!1212))

(assert (= (or b!20878 b!20863) bm!1217))

(assert (= (or b!20877 bm!1212) bm!1200))

(assert (= (or b!20868 b!20884) bm!1216))

(assert (= (and b!20848 c!2343) b!20850))

(assert (= (and b!20848 (not c!2343)) b!20879))

(assert (= (and b!20879 c!2334) b!20881))

(assert (= (and b!20879 (not c!2334)) b!20859))

(assert (= (and b!20859 c!2341) b!20865))

(assert (= (and b!20859 (not c!2341)) b!20880))

(assert (= (and b!20865 res!13604) b!20854))

(assert (= (and b!20854 res!13598) b!20858))

(assert (= (and b!20880 c!2336) b!20869))

(assert (= (and b!20880 (not c!2336)) b!20856))

(assert (= (and b!20869 res!13602) b!20861))

(assert (= (and b!20861 res!13605) b!20849))

(assert (= (and b!20856 c!2344) b!20882))

(assert (= (and b!20856 (not c!2344)) b!20852))

(assert (= (and b!20882 res!13594) b!20873))

(assert (= (and b!20873 res!13597) b!20864))

(assert (= (or b!20869 b!20882) bm!1196))

(assert (= (or b!20849 b!20864) bm!1199))

(assert (= (or b!20854 bm!1196) bm!1211))

(assert (= (or b!20865 b!20880) bm!1218))

(assert (= (or b!20850 b!20881) bm!1206))

(assert (= (or b!20874 b!20859) bm!1215))

(assert (= (or b!20868 b!20865) bm!1208))

(assert (= (or bm!1217 bm!1199) bm!1197))

(assert (= (or bm!1200 bm!1211) bm!1205))

(assert (= (or bm!1216 bm!1218) bm!1210))

(assert (= (or b!20884 b!20880) bm!1209))

(assert (= (or b!20874 b!20859) bm!1203))

(assert (= (or bm!1204 bm!1215) bm!1201))

(assert (= (or bm!1219 b!20859) bm!1213))

(assert (= (or bm!1202 b!20859) bm!1207))

(assert (= (and d!3707 res!13600) b!20853))

(assert (= (and b!20853 c!2340) b!20857))

(assert (= (and b!20853 (not c!2340)) b!20870))

(assert (= (and b!20857 res!13599) b!20876))

(assert (= (or b!20857 b!20876 b!20870) bm!1214))

(assert (= (or b!20876 b!20870) bm!1198))

(declare-fun m!14567 () Bool)

(assert (=> bm!1214 m!14567))

(declare-fun m!14569 () Bool)

(assert (=> bm!1205 m!14569))

(declare-fun m!14571 () Bool)

(assert (=> b!20860 m!14571))

(declare-fun m!14573 () Bool)

(assert (=> b!20873 m!14573))

(declare-fun m!14575 () Bool)

(assert (=> bm!1203 m!14575))

(declare-fun m!14577 () Bool)

(assert (=> d!3707 m!14577))

(declare-fun m!14579 () Bool)

(assert (=> d!3707 m!14579))

(declare-fun m!14581 () Bool)

(assert (=> bm!1213 m!14581))

(declare-fun m!14583 () Bool)

(assert (=> bm!1213 m!14583))

(declare-fun m!14585 () Bool)

(assert (=> b!20876 m!14585))

(declare-fun m!14587 () Bool)

(assert (=> b!20867 m!14587))

(declare-fun m!14589 () Bool)

(assert (=> bm!1209 m!14589))

(declare-fun m!14591 () Bool)

(assert (=> bm!1208 m!14591))

(declare-fun m!14593 () Bool)

(assert (=> b!20847 m!14593))

(declare-fun m!14595 () Bool)

(assert (=> bm!1201 m!14595))

(declare-fun m!14597 () Bool)

(assert (=> b!20859 m!14597))

(declare-fun m!14599 () Bool)

(assert (=> b!20859 m!14599))

(declare-fun m!14601 () Bool)

(assert (=> b!20859 m!14601))

(assert (=> b!20859 m!14601))

(declare-fun m!14603 () Bool)

(assert (=> b!20859 m!14603))

(declare-fun m!14605 () Bool)

(assert (=> b!20859 m!14605))

(assert (=> b!20859 m!14581))

(assert (=> b!20859 m!14603))

(declare-fun m!14607 () Bool)

(assert (=> bm!1206 m!14607))

(declare-fun m!14609 () Bool)

(assert (=> b!20855 m!14609))

(declare-fun m!14611 () Bool)

(assert (=> bm!1207 m!14611))

(declare-fun m!14613 () Bool)

(assert (=> bm!1197 m!14613))

(declare-fun m!14615 () Bool)

(assert (=> b!20872 m!14615))

(declare-fun m!14617 () Bool)

(assert (=> b!20857 m!14617))

(assert (=> bm!1210 m!14587))

(declare-fun m!14619 () Bool)

(assert (=> bm!1198 m!14619))

(declare-fun m!14621 () Bool)

(assert (=> b!20861 m!14621))

(declare-fun m!14623 () Bool)

(assert (=> b!20871 m!14623))

(declare-fun m!14625 () Bool)

(assert (=> b!20858 m!14625))

(assert (=> b!20675 d!3707))

(declare-fun b!20897 () Bool)

(declare-fun e!13637 () Unit!430)

(declare-fun Unit!436 () Unit!430)

(assert (=> b!20897 (= e!13637 Unit!436)))

(declare-fun b!20898 () Bool)

(declare-fun e!13638 () Bool)

(declare-fun lt!6372 () tuple2!874)

(declare-fun lt!6375 () (_ BitVec 32))

(assert (=> b!20898 (= e!13638 (ite (= (_1!440 lt!6372) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!6375 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!6375 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!3709 () Bool)

(declare-fun e!13639 () Bool)

(assert (=> d!3709 e!13639))

(declare-fun res!13612 () Bool)

(assert (=> d!3709 (=> (not res!13612) (not e!13639))))

(declare-fun lt!6379 () LongMapFixedSize!174)

(assert (=> d!3709 (= res!13612 (valid!87 lt!6379))))

(declare-fun lt!6376 () LongMapFixedSize!174)

(assert (=> d!3709 (= lt!6379 lt!6376)))

(declare-fun lt!6386 () Unit!430)

(assert (=> d!3709 (= lt!6386 e!13637)))

(declare-fun c!2349 () Bool)

(assert (=> d!3709 (= c!2349 (not (= (map!389 lt!6376) (ListLongMap!556 Nil!554))))))

(declare-fun lt!6381 () Unit!430)

(declare-fun lt!6373 () Unit!430)

(assert (=> d!3709 (= lt!6381 lt!6373)))

(declare-fun lt!6368 () array!1203)

(declare-fun lt!6367 () (_ BitVec 32))

(declare-fun lt!6371 () List!558)

(assert (=> d!3709 (arrayNoDuplicates!0 lt!6368 lt!6367 lt!6371)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1203 (_ BitVec 32) (_ BitVec 32) List!558) Unit!430)

(assert (=> d!3709 (= lt!6373 (lemmaArrayNoDuplicatesInAll0Array!0 lt!6368 lt!6367 (bvadd (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000001) lt!6371))))

(assert (=> d!3709 (= lt!6371 Nil!555)))

(assert (=> d!3709 (= lt!6367 #b00000000000000000000000000000000)))

(assert (=> d!3709 (= lt!6368 (array!1204 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6370 () Unit!430)

(declare-fun lt!6387 () Unit!430)

(assert (=> d!3709 (= lt!6370 lt!6387)))

(declare-fun lt!6374 () (_ BitVec 32))

(declare-fun lt!6380 () array!1203)

(assert (=> d!3709 (arrayForallSeekEntryOrOpenFound!0 lt!6374 lt!6380 (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1203 (_ BitVec 32) (_ BitVec 32)) Unit!430)

(assert (=> d!3709 (= lt!6387 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!6380 (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) lt!6374))))

(assert (=> d!3709 (= lt!6374 #b00000000000000000000000000000000)))

(assert (=> d!3709 (= lt!6380 (array!1204 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!6369 () Unit!430)

(declare-fun lt!6383 () Unit!430)

(assert (=> d!3709 (= lt!6369 lt!6383)))

(declare-fun lt!6366 () array!1203)

(declare-fun lt!6384 () (_ BitVec 32))

(declare-fun lt!6365 () (_ BitVec 32))

(assert (=> d!3709 (= (arrayCountValidKeys!0 lt!6366 lt!6384 lt!6365) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1203 (_ BitVec 32) (_ BitVec 32)) Unit!430)

(assert (=> d!3709 (= lt!6383 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!6366 lt!6384 lt!6365))))

(assert (=> d!3709 (= lt!6365 (bvadd (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3709 (= lt!6384 #b00000000000000000000000000000000)))

(assert (=> d!3709 (= lt!6366 (array!1204 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!139 (Int (_ BitVec 64)) V!1141)

(assert (=> d!3709 (= lt!6376 (LongMapFixedSize!175 (defaultEntry!1711 (v!1559 (underlying!98 thiss!938))) (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!139 (defaultEntry!1711 (v!1559 (underlying!98 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!139 (defaultEntry!1711 (v!1559 (underlying!98 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1204 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000001)) (array!1202 ((as const (Array (_ BitVec 32) ValueCell!294)) EmptyCell!294) (bvadd (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3709 (validMask!0 (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))))))

(assert (=> d!3709 (= (getNewLongMapFixedSize!24 (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) (defaultEntry!1711 (v!1559 (underlying!98 thiss!938)))) lt!6379)))

(declare-fun b!20899 () Bool)

(declare-fun res!13613 () Bool)

(assert (=> b!20899 (=> (not res!13613) (not e!13639))))

(assert (=> b!20899 (= res!13613 (= (mask!4678 lt!6379) (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938))))))))

(declare-fun b!20900 () Bool)

(declare-fun Unit!437 () Unit!430)

(assert (=> b!20900 (= e!13637 Unit!437)))

(declare-fun head!825 (List!557) tuple2!874)

(assert (=> b!20900 (= lt!6372 (head!825 (toList!293 (map!389 lt!6376))))))

(declare-fun lt!6385 () array!1203)

(assert (=> b!20900 (= lt!6385 (array!1204 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!20900 (= lt!6375 #b00000000000000000000000000000000)))

(declare-fun lt!6382 () Unit!430)

(declare-fun lemmaKeyInListMapIsInArray!86 (array!1203 array!1201 (_ BitVec 32) (_ BitVec 32) V!1141 V!1141 (_ BitVec 64) Int) Unit!430)

(assert (=> b!20900 (= lt!6382 (lemmaKeyInListMapIsInArray!86 lt!6385 (array!1202 ((as const (Array (_ BitVec 32) ValueCell!294)) EmptyCell!294) (bvadd (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) lt!6375 (dynLambda!139 (defaultEntry!1711 (v!1559 (underlying!98 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!139 (defaultEntry!1711 (v!1559 (underlying!98 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!440 lt!6372) (defaultEntry!1711 (v!1559 (underlying!98 thiss!938)))))))

(declare-fun c!2350 () Bool)

(assert (=> b!20900 (= c!2350 (and (not (= (_1!440 lt!6372) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!440 lt!6372) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!20900 e!13638))

(declare-fun lt!6377 () Unit!430)

(assert (=> b!20900 (= lt!6377 lt!6382)))

(declare-fun lt!6378 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1203 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20900 (= lt!6378 (arrayScanForKey!0 (array!1204 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) #b00000000000000000000000000000001)) (_1!440 lt!6372) #b00000000000000000000000000000000))))

(assert (=> b!20900 false))

(declare-fun b!20901 () Bool)

(assert (=> b!20901 (= e!13638 (arrayContainsKey!0 lt!6385 (_1!440 lt!6372) #b00000000000000000000000000000000))))

(declare-fun b!20902 () Bool)

(assert (=> b!20902 (= e!13639 (= (map!389 lt!6379) (ListLongMap!556 Nil!554)))))

(assert (= (and d!3709 c!2349) b!20900))

(assert (= (and d!3709 (not c!2349)) b!20897))

(assert (= (and b!20900 c!2350) b!20901))

(assert (= (and b!20900 (not c!2350)) b!20898))

(assert (= (and d!3709 res!13612) b!20899))

(assert (= (and b!20899 res!13613) b!20902))

(declare-fun b_lambda!1505 () Bool)

(assert (=> (not b_lambda!1505) (not d!3709)))

(declare-fun t!3211 () Bool)

(declare-fun tb!641 () Bool)

(assert (=> (and b!20670 (= (defaultEntry!1711 (v!1559 (underlying!98 thiss!938))) (defaultEntry!1711 (v!1559 (underlying!98 thiss!938)))) t!3211) tb!641))

(declare-fun result!1057 () Bool)

(assert (=> tb!641 (= result!1057 tp_is_empty!987)))

(assert (=> d!3709 t!3211))

(declare-fun b_and!1407 () Bool)

(assert (= b_and!1403 (and (=> t!3211 result!1057) b_and!1407)))

(declare-fun b_lambda!1507 () Bool)

(assert (=> (not b_lambda!1507) (not b!20900)))

(assert (=> b!20900 t!3211))

(declare-fun b_and!1409 () Bool)

(assert (= b_and!1407 (and (=> t!3211 result!1057) b_and!1409)))

(declare-fun m!14627 () Bool)

(assert (=> d!3709 m!14627))

(assert (=> d!3709 m!14463))

(declare-fun m!14629 () Bool)

(assert (=> d!3709 m!14629))

(declare-fun m!14631 () Bool)

(assert (=> d!3709 m!14631))

(declare-fun m!14633 () Bool)

(assert (=> d!3709 m!14633))

(declare-fun m!14635 () Bool)

(assert (=> d!3709 m!14635))

(declare-fun m!14637 () Bool)

(assert (=> d!3709 m!14637))

(declare-fun m!14639 () Bool)

(assert (=> d!3709 m!14639))

(assert (=> d!3709 m!14463))

(declare-fun m!14641 () Bool)

(assert (=> d!3709 m!14641))

(assert (=> d!3709 m!14463))

(declare-fun m!14643 () Bool)

(assert (=> d!3709 m!14643))

(declare-fun m!14645 () Bool)

(assert (=> d!3709 m!14645))

(assert (=> b!20900 m!14627))

(assert (=> b!20900 m!14463))

(assert (=> b!20900 m!14627))

(assert (=> b!20900 m!14627))

(declare-fun m!14647 () Bool)

(assert (=> b!20900 m!14647))

(assert (=> b!20900 m!14645))

(declare-fun m!14649 () Bool)

(assert (=> b!20900 m!14649))

(declare-fun m!14651 () Bool)

(assert (=> b!20900 m!14651))

(declare-fun m!14653 () Bool)

(assert (=> b!20901 m!14653))

(declare-fun m!14655 () Bool)

(assert (=> b!20902 m!14655))

(assert (=> b!20664 d!3709))

(declare-fun d!3711 () Bool)

(declare-fun e!13644 () Bool)

(assert (=> d!3711 e!13644))

(declare-fun res!13616 () Bool)

(assert (=> d!3711 (=> (not res!13616) (not e!13644))))

(declare-fun lt!6393 () (_ BitVec 32))

(assert (=> d!3711 (= res!13616 (validMask!0 lt!6393))))

(declare-datatypes ((tuple2!876 0))(
  ( (tuple2!877 (_1!441 Unit!430) (_2!441 (_ BitVec 32))) )
))
(declare-fun e!13645 () tuple2!876)

(assert (=> d!3711 (= lt!6393 (_2!441 e!13645))))

(declare-fun c!2353 () Bool)

(declare-fun lt!6392 () tuple2!876)

(assert (=> d!3711 (= c!2353 (and (bvsgt (_2!441 lt!6392) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!126 (v!1559 (underlying!98 thiss!938)))) (_2!441 lt!6392)) (bvsge (bvadd (bvand (bvashr (_2!441 lt!6392) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!126 (v!1559 (underlying!98 thiss!938))))))))

(declare-fun Unit!438 () Unit!430)

(declare-fun Unit!439 () Unit!430)

(assert (=> d!3711 (= lt!6392 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!126 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))))) (mask!4678 (v!1559 (underlying!98 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!126 (v!1559 (underlying!98 thiss!938)))) (mask!4678 (v!1559 (underlying!98 thiss!938))))) (tuple2!877 Unit!438 (bvand (bvadd (bvshl (mask!4678 (v!1559 (underlying!98 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!877 Unit!439 (mask!4678 (v!1559 (underlying!98 thiss!938))))))))

(assert (=> d!3711 (validMask!0 (mask!4678 (v!1559 (underlying!98 thiss!938))))))

(assert (=> d!3711 (= (computeNewMask!20 thiss!938 (mask!4678 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (_size!126 (v!1559 (underlying!98 thiss!938)))) lt!6393)))

(declare-fun b!20911 () Bool)

(declare-fun computeNewMaskWhile!9 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!876)

(assert (=> b!20911 (= e!13645 (computeNewMaskWhile!9 (_size!126 (v!1559 (underlying!98 thiss!938))) (_vacant!126 (v!1559 (underlying!98 thiss!938))) (mask!4678 (v!1559 (underlying!98 thiss!938))) (_2!441 lt!6392)))))

(declare-fun b!20912 () Bool)

(declare-fun Unit!440 () Unit!430)

(assert (=> b!20912 (= e!13645 (tuple2!877 Unit!440 (_2!441 lt!6392)))))

(declare-fun b!20913 () Bool)

(assert (=> b!20913 (= e!13644 (bvsle (_size!126 (v!1559 (underlying!98 thiss!938))) (bvadd lt!6393 #b00000000000000000000000000000001)))))

(assert (= (and d!3711 c!2353) b!20911))

(assert (= (and d!3711 (not c!2353)) b!20912))

(assert (= (and d!3711 res!13616) b!20913))

(declare-fun m!14657 () Bool)

(assert (=> d!3711 m!14657))

(assert (=> d!3711 m!14473))

(declare-fun m!14659 () Bool)

(assert (=> b!20911 m!14659))

(assert (=> b!20664 d!3711))

(declare-fun d!3713 () Bool)

(assert (=> d!3713 (= (valid!86 thiss!938) (valid!87 (v!1559 (underlying!98 thiss!938))))))

(declare-fun bs!901 () Bool)

(assert (= bs!901 d!3713))

(declare-fun m!14661 () Bool)

(assert (=> bs!901 m!14661))

(assert (=> start!3320 d!3713))

(declare-fun b!20920 () Bool)

(declare-fun e!13651 () Bool)

(assert (=> b!20920 (= e!13651 tp_is_empty!987)))

(declare-fun mapNonEmpty!961 () Bool)

(declare-fun mapRes!961 () Bool)

(declare-fun tp!3409 () Bool)

(assert (=> mapNonEmpty!961 (= mapRes!961 (and tp!3409 e!13651))))

(declare-fun mapKey!961 () (_ BitVec 32))

(declare-fun mapValue!961 () ValueCell!294)

(declare-fun mapRest!961 () (Array (_ BitVec 32) ValueCell!294))

(assert (=> mapNonEmpty!961 (= mapRest!955 (store mapRest!961 mapKey!961 mapValue!961))))

(declare-fun b!20921 () Bool)

(declare-fun e!13650 () Bool)

(assert (=> b!20921 (= e!13650 tp_is_empty!987)))

(declare-fun condMapEmpty!961 () Bool)

(declare-fun mapDefault!961 () ValueCell!294)

(assert (=> mapNonEmpty!955 (= condMapEmpty!961 (= mapRest!955 ((as const (Array (_ BitVec 32) ValueCell!294)) mapDefault!961)))))

(assert (=> mapNonEmpty!955 (= tp!3400 (and e!13650 mapRes!961))))

(declare-fun mapIsEmpty!961 () Bool)

(assert (=> mapIsEmpty!961 mapRes!961))

(assert (= (and mapNonEmpty!955 condMapEmpty!961) mapIsEmpty!961))

(assert (= (and mapNonEmpty!955 (not condMapEmpty!961)) mapNonEmpty!961))

(assert (= (and mapNonEmpty!961 ((_ is ValueCellFull!294) mapValue!961)) b!20920))

(assert (= (and mapNonEmpty!955 ((_ is ValueCellFull!294) mapDefault!961)) b!20921))

(declare-fun m!14663 () Bool)

(assert (=> mapNonEmpty!961 m!14663))

(declare-fun b_lambda!1509 () Bool)

(assert (= b_lambda!1505 (or (and b!20670 b_free!723) b_lambda!1509)))

(declare-fun b_lambda!1511 () Bool)

(assert (= b_lambda!1507 (or (and b!20670 b_free!723) b_lambda!1511)))

(check-sat (not bm!1185) (not b!20911) (not bm!1198) (not b!20871) (not b!20872) (not bm!1174) (not bm!1177) (not bm!1189) (not bm!1181) (not bm!1210) (not mapNonEmpty!961) (not b!20845) (not bm!1213) (not d!3713) (not b!20829) (not bm!1201) (not bm!1203) (not bm!1190) (not b!20876) (not bm!1179) (not b_lambda!1509) (not b_lambda!1511) (not b_next!723) (not bm!1205) (not b!20900) (not d!3711) (not b!20824) (not bm!1197) (not b!20859) tp_is_empty!987 (not b!20846) (not bm!1184) (not bm!1209) (not b!20857) (not bm!1173) (not b!20820) (not bm!1207) (not d!3703) (not bm!1214) (not bm!1183) (not d!3709) b_and!1409 (not b!20825) (not b!20844) (not b!20902) (not bm!1206) (not d!3707) (not bm!1182) (not d!3705) (not b!20810) (not b!20812) (not b!20901) (not b!20867) (not bm!1186) (not bm!1208))
(check-sat b_and!1409 (not b_next!723))
