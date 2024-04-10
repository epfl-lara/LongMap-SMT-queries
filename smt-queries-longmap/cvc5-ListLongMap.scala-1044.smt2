; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21946 () Bool)

(assert start!21946)

(declare-fun b!224086 () Bool)

(declare-fun b_free!6013 () Bool)

(declare-fun b_next!6013 () Bool)

(assert (=> b!224086 (= b_free!6013 (not b_next!6013))))

(declare-fun tp!21180 () Bool)

(declare-fun b_and!12911 () Bool)

(assert (=> b!224086 (= tp!21180 b_and!12911)))

(declare-datatypes ((SeekEntryResult!855 0))(
  ( (MissingZero!855 (index!5590 (_ BitVec 32))) (Found!855 (index!5591 (_ BitVec 32))) (Intermediate!855 (undefined!1667 Bool) (index!5592 (_ BitVec 32)) (x!23123 (_ BitVec 32))) (Undefined!855) (MissingVacant!855 (index!5593 (_ BitVec 32))) )
))
(declare-fun lt!113066 () SeekEntryResult!855)

(declare-fun call!20873 () Bool)

(declare-datatypes ((V!7481 0))(
  ( (V!7482 (val!2982 Int)) )
))
(declare-datatypes ((ValueCell!2594 0))(
  ( (ValueCellFull!2594 (v!5002 V!7481)) (EmptyCell!2594) )
))
(declare-datatypes ((array!10993 0))(
  ( (array!10994 (arr!5216 (Array (_ BitVec 32) ValueCell!2594)) (size!5549 (_ BitVec 32))) )
))
(declare-datatypes ((array!10995 0))(
  ( (array!10996 (arr!5217 (Array (_ BitVec 32) (_ BitVec 64))) (size!5550 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3088 0))(
  ( (LongMapFixedSize!3089 (defaultEntry!4203 Int) (mask!10035 (_ BitVec 32)) (extraKeys!3940 (_ BitVec 32)) (zeroValue!4044 V!7481) (minValue!4044 V!7481) (_size!1593 (_ BitVec 32)) (_keys!6257 array!10995) (_values!4186 array!10993) (_vacant!1593 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3088)

(declare-fun bm!20870 () Bool)

(declare-fun c!37176 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20870 (= call!20873 (inRange!0 (ite c!37176 (index!5590 lt!113066) (index!5593 lt!113066)) (mask!10035 thiss!1504)))))

(declare-fun b!224085 () Bool)

(declare-fun e!145521 () Bool)

(assert (=> b!224085 (= e!145521 false)))

(declare-fun lt!113068 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((List!3331 0))(
  ( (Nil!3328) (Cons!3327 (h!3975 (_ BitVec 64)) (t!8290 List!3331)) )
))
(declare-fun contains!1551 (List!3331 (_ BitVec 64)) Bool)

(assert (=> b!224085 (= lt!113068 (contains!1551 Nil!3328 key!932))))

(declare-fun e!145520 () Bool)

(declare-fun e!145507 () Bool)

(declare-fun tp_is_empty!5875 () Bool)

(declare-fun array_inv!3451 (array!10995) Bool)

(declare-fun array_inv!3452 (array!10993) Bool)

(assert (=> b!224086 (= e!145507 (and tp!21180 tp_is_empty!5875 (array_inv!3451 (_keys!6257 thiss!1504)) (array_inv!3452 (_values!4186 thiss!1504)) e!145520))))

(declare-fun mapNonEmpty!9982 () Bool)

(declare-fun mapRes!9982 () Bool)

(declare-fun tp!21181 () Bool)

(declare-fun e!145512 () Bool)

(assert (=> mapNonEmpty!9982 (= mapRes!9982 (and tp!21181 e!145512))))

(declare-fun mapValue!9982 () ValueCell!2594)

(declare-fun mapKey!9982 () (_ BitVec 32))

(declare-fun mapRest!9982 () (Array (_ BitVec 32) ValueCell!2594))

(assert (=> mapNonEmpty!9982 (= (arr!5216 (_values!4186 thiss!1504)) (store mapRest!9982 mapKey!9982 mapValue!9982))))

(declare-fun b!224087 () Bool)

(declare-fun e!145516 () Bool)

(assert (=> b!224087 (= e!145516 e!145521)))

(declare-fun res!110221 () Bool)

(assert (=> b!224087 (=> (not res!110221) (not e!145521))))

(assert (=> b!224087 (= res!110221 (and (bvslt (size!5550 (_keys!6257 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5550 (_keys!6257 thiss!1504)))))))

(declare-datatypes ((Unit!6737 0))(
  ( (Unit!6738) )
))
(declare-fun lt!113065 () Unit!6737)

(declare-fun e!145518 () Unit!6737)

(assert (=> b!224087 (= lt!113065 e!145518)))

(declare-fun c!37173 () Bool)

(declare-fun lt!113069 () Bool)

(assert (=> b!224087 (= c!37173 lt!113069)))

(declare-fun arrayContainsKey!0 (array!10995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224087 (= lt!113069 (arrayContainsKey!0 (_keys!6257 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224088 () Bool)

(declare-fun e!145515 () Bool)

(declare-fun call!20874 () Bool)

(assert (=> b!224088 (= e!145515 (not call!20874))))

(declare-fun b!224089 () Bool)

(declare-fun e!145523 () Bool)

(assert (=> b!224089 (= e!145523 (is-Undefined!855 lt!113066))))

(declare-fun b!224090 () Bool)

(declare-fun e!145519 () Bool)

(assert (=> b!224090 (= e!145523 e!145519)))

(declare-fun res!110220 () Bool)

(assert (=> b!224090 (= res!110220 call!20873)))

(assert (=> b!224090 (=> (not res!110220) (not e!145519))))

(declare-fun b!224091 () Bool)

(declare-fun e!145514 () Unit!6737)

(declare-fun lt!113067 () Unit!6737)

(assert (=> b!224091 (= e!145514 lt!113067)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!247 (array!10995 array!10993 (_ BitVec 32) (_ BitVec 32) V!7481 V!7481 (_ BitVec 64) Int) Unit!6737)

(assert (=> b!224091 (= lt!113067 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!247 (_keys!6257 thiss!1504) (_values!4186 thiss!1504) (mask!10035 thiss!1504) (extraKeys!3940 thiss!1504) (zeroValue!4044 thiss!1504) (minValue!4044 thiss!1504) key!932 (defaultEntry!4203 thiss!1504)))))

(assert (=> b!224091 (= c!37176 (is-MissingZero!855 lt!113066))))

(declare-fun e!145508 () Bool)

(assert (=> b!224091 e!145508))

(declare-fun b!224092 () Bool)

(declare-fun e!145506 () Bool)

(declare-fun e!145513 () Bool)

(assert (=> b!224092 (= e!145506 e!145513)))

(declare-fun res!110216 () Bool)

(assert (=> b!224092 (=> (not res!110216) (not e!145513))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224092 (= res!110216 (or (= lt!113066 (MissingZero!855 index!297)) (= lt!113066 (MissingVacant!855 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10995 (_ BitVec 32)) SeekEntryResult!855)

(assert (=> b!224092 (= lt!113066 (seekEntryOrOpen!0 key!932 (_keys!6257 thiss!1504) (mask!10035 thiss!1504)))))

(declare-fun b!224093 () Bool)

(assert (=> b!224093 (= e!145519 (not call!20874))))

(declare-fun b!224095 () Bool)

(declare-fun res!110227 () Bool)

(assert (=> b!224095 (=> (not res!110227) (not e!145521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224095 (= res!110227 (validKeyInArray!0 key!932))))

(declare-fun b!224096 () Bool)

(declare-fun e!145517 () Bool)

(declare-fun e!145511 () Bool)

(assert (=> b!224096 (= e!145517 e!145511)))

(declare-fun res!110230 () Bool)

(assert (=> b!224096 (=> (not res!110230) (not e!145511))))

(assert (=> b!224096 (= res!110230 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!224097 () Bool)

(declare-fun e!145522 () Bool)

(assert (=> b!224097 (= e!145522 tp_is_empty!5875)))

(declare-fun b!224098 () Bool)

(declare-fun res!110225 () Bool)

(assert (=> b!224098 (=> (not res!110225) (not e!145515))))

(assert (=> b!224098 (= res!110225 call!20873)))

(assert (=> b!224098 (= e!145508 e!145515)))

(declare-fun b!224099 () Bool)

(declare-fun res!110222 () Bool)

(assert (=> b!224099 (=> (not res!110222) (not e!145515))))

(assert (=> b!224099 (= res!110222 (= (select (arr!5217 (_keys!6257 thiss!1504)) (index!5590 lt!113066)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!224100 () Bool)

(declare-fun Unit!6739 () Unit!6737)

(assert (=> b!224100 (= e!145518 Unit!6739)))

(declare-fun lt!113064 () Unit!6737)

(declare-fun lemmaArrayContainsKeyThenInListMap!76 (array!10995 array!10993 (_ BitVec 32) (_ BitVec 32) V!7481 V!7481 (_ BitVec 64) (_ BitVec 32) Int) Unit!6737)

(assert (=> b!224100 (= lt!113064 (lemmaArrayContainsKeyThenInListMap!76 (_keys!6257 thiss!1504) (_values!4186 thiss!1504) (mask!10035 thiss!1504) (extraKeys!3940 thiss!1504) (zeroValue!4044 thiss!1504) (minValue!4044 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4203 thiss!1504)))))

(assert (=> b!224100 false))

(declare-fun b!224101 () Bool)

(declare-fun res!110218 () Bool)

(assert (=> b!224101 (=> (not res!110218) (not e!145521))))

(assert (=> b!224101 (= res!110218 (not lt!113069))))

(declare-fun b!224102 () Bool)

(declare-fun res!110224 () Bool)

(assert (=> b!224102 (=> (not res!110224) (not e!145521))))

(assert (=> b!224102 (= res!110224 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5550 (_keys!6257 thiss!1504)))))))

(declare-fun b!224103 () Bool)

(declare-fun Unit!6740 () Unit!6737)

(assert (=> b!224103 (= e!145518 Unit!6740)))

(declare-fun b!224104 () Bool)

(assert (=> b!224104 (= e!145511 (not (contains!1551 Nil!3328 key!932)))))

(declare-fun b!224105 () Bool)

(assert (=> b!224105 (= e!145513 e!145516)))

(declare-fun res!110223 () Bool)

(assert (=> b!224105 (=> (not res!110223) (not e!145516))))

(assert (=> b!224105 (= res!110223 (inRange!0 index!297 (mask!10035 thiss!1504)))))

(declare-fun lt!113063 () Unit!6737)

(assert (=> b!224105 (= lt!113063 e!145514)))

(declare-fun c!37175 () Bool)

(declare-datatypes ((tuple2!4420 0))(
  ( (tuple2!4421 (_1!2221 (_ BitVec 64)) (_2!2221 V!7481)) )
))
(declare-datatypes ((List!3332 0))(
  ( (Nil!3329) (Cons!3328 (h!3976 tuple2!4420) (t!8291 List!3332)) )
))
(declare-datatypes ((ListLongMap!3333 0))(
  ( (ListLongMap!3334 (toList!1682 List!3332)) )
))
(declare-fun contains!1552 (ListLongMap!3333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1210 (array!10995 array!10993 (_ BitVec 32) (_ BitVec 32) V!7481 V!7481 (_ BitVec 32) Int) ListLongMap!3333)

(assert (=> b!224105 (= c!37175 (contains!1552 (getCurrentListMap!1210 (_keys!6257 thiss!1504) (_values!4186 thiss!1504) (mask!10035 thiss!1504) (extraKeys!3940 thiss!1504) (zeroValue!4044 thiss!1504) (minValue!4044 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4203 thiss!1504)) key!932))))

(declare-fun b!224106 () Bool)

(declare-fun Unit!6741 () Unit!6737)

(assert (=> b!224106 (= e!145514 Unit!6741)))

(declare-fun lt!113062 () Unit!6737)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!236 (array!10995 array!10993 (_ BitVec 32) (_ BitVec 32) V!7481 V!7481 (_ BitVec 64) Int) Unit!6737)

(assert (=> b!224106 (= lt!113062 (lemmaInListMapThenSeekEntryOrOpenFindsIt!236 (_keys!6257 thiss!1504) (_values!4186 thiss!1504) (mask!10035 thiss!1504) (extraKeys!3940 thiss!1504) (zeroValue!4044 thiss!1504) (minValue!4044 thiss!1504) key!932 (defaultEntry!4203 thiss!1504)))))

(assert (=> b!224106 false))

(declare-fun b!224107 () Bool)

(declare-fun res!110219 () Bool)

(assert (=> b!224107 (= res!110219 (= (select (arr!5217 (_keys!6257 thiss!1504)) (index!5593 lt!113066)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224107 (=> (not res!110219) (not e!145519))))

(declare-fun b!224108 () Bool)

(declare-fun res!110229 () Bool)

(assert (=> b!224108 (=> (not res!110229) (not e!145506))))

(assert (=> b!224108 (= res!110229 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!224109 () Bool)

(declare-fun res!110228 () Bool)

(assert (=> b!224109 (=> (not res!110228) (not e!145521))))

(assert (=> b!224109 (= res!110228 (not (contains!1551 Nil!3328 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224110 () Bool)

(declare-fun res!110213 () Bool)

(assert (=> b!224110 (=> (not res!110213) (not e!145521))))

(assert (=> b!224110 (= res!110213 e!145517)))

(declare-fun res!110226 () Bool)

(assert (=> b!224110 (=> res!110226 e!145517)))

(declare-fun e!145509 () Bool)

(assert (=> b!224110 (= res!110226 e!145509)))

(declare-fun res!110211 () Bool)

(assert (=> b!224110 (=> (not res!110211) (not e!145509))))

(assert (=> b!224110 (= res!110211 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!224111 () Bool)

(declare-fun res!110215 () Bool)

(assert (=> b!224111 (=> (not res!110215) (not e!145521))))

(assert (=> b!224111 (= res!110215 (not (contains!1551 Nil!3328 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224112 () Bool)

(assert (=> b!224112 (= e!145509 (contains!1551 Nil!3328 key!932))))

(declare-fun b!224113 () Bool)

(declare-fun res!110214 () Bool)

(assert (=> b!224113 (=> (not res!110214) (not e!145521))))

(declare-fun noDuplicate!82 (List!3331) Bool)

(assert (=> b!224113 (= res!110214 (noDuplicate!82 Nil!3328))))

(declare-fun bm!20871 () Bool)

(assert (=> bm!20871 (= call!20874 (arrayContainsKey!0 (_keys!6257 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224114 () Bool)

(declare-fun c!37174 () Bool)

(assert (=> b!224114 (= c!37174 (is-MissingVacant!855 lt!113066))))

(assert (=> b!224114 (= e!145508 e!145523)))

(declare-fun b!224115 () Bool)

(declare-fun res!110212 () Bool)

(assert (=> b!224115 (=> (not res!110212) (not e!145521))))

(declare-fun arrayNoDuplicates!0 (array!10995 (_ BitVec 32) List!3331) Bool)

(assert (=> b!224115 (= res!110212 (arrayNoDuplicates!0 (_keys!6257 thiss!1504) #b00000000000000000000000000000000 Nil!3328))))

(declare-fun mapIsEmpty!9982 () Bool)

(assert (=> mapIsEmpty!9982 mapRes!9982))

(declare-fun b!224116 () Bool)

(assert (=> b!224116 (= e!145512 tp_is_empty!5875)))

(declare-fun res!110217 () Bool)

(assert (=> start!21946 (=> (not res!110217) (not e!145506))))

(declare-fun valid!1244 (LongMapFixedSize!3088) Bool)

(assert (=> start!21946 (= res!110217 (valid!1244 thiss!1504))))

(assert (=> start!21946 e!145506))

(assert (=> start!21946 e!145507))

(assert (=> start!21946 true))

(declare-fun b!224094 () Bool)

(assert (=> b!224094 (= e!145520 (and e!145522 mapRes!9982))))

(declare-fun condMapEmpty!9982 () Bool)

(declare-fun mapDefault!9982 () ValueCell!2594)

