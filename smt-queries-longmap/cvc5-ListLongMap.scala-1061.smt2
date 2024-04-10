; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22048 () Bool)

(assert start!22048)

(declare-fun b!227886 () Bool)

(declare-fun b_free!6115 () Bool)

(declare-fun b_next!6115 () Bool)

(assert (=> b!227886 (= b_free!6115 (not b_next!6115))))

(declare-fun tp!21486 () Bool)

(declare-fun b_and!13013 () Bool)

(assert (=> b!227886 (= tp!21486 b_and!13013)))

(declare-fun b!227883 () Bool)

(declare-fun e!147853 () Bool)

(declare-fun tp_is_empty!5977 () Bool)

(assert (=> b!227883 (= e!147853 tp_is_empty!5977)))

(declare-fun b!227884 () Bool)

(declare-fun res!112180 () Bool)

(declare-fun e!147842 () Bool)

(assert (=> b!227884 (=> (not res!112180) (not e!147842))))

(declare-fun call!21180 () Bool)

(assert (=> b!227884 (= res!112180 call!21180)))

(declare-fun e!147843 () Bool)

(assert (=> b!227884 (= e!147843 e!147842)))

(declare-fun b!227885 () Bool)

(declare-fun res!112174 () Bool)

(assert (=> b!227885 (=> (not res!112174) (not e!147842))))

(declare-datatypes ((V!7617 0))(
  ( (V!7618 (val!3033 Int)) )
))
(declare-datatypes ((ValueCell!2645 0))(
  ( (ValueCellFull!2645 (v!5053 V!7617)) (EmptyCell!2645) )
))
(declare-datatypes ((array!11197 0))(
  ( (array!11198 (arr!5318 (Array (_ BitVec 32) ValueCell!2645)) (size!5651 (_ BitVec 32))) )
))
(declare-datatypes ((array!11199 0))(
  ( (array!11200 (arr!5319 (Array (_ BitVec 32) (_ BitVec 64))) (size!5652 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3190 0))(
  ( (LongMapFixedSize!3191 (defaultEntry!4254 Int) (mask!10120 (_ BitVec 32)) (extraKeys!3991 (_ BitVec 32)) (zeroValue!4095 V!7617) (minValue!4095 V!7617) (_size!1644 (_ BitVec 32)) (_keys!6308 array!11199) (_values!4237 array!11197) (_vacant!1644 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3190)

(declare-datatypes ((SeekEntryResult!900 0))(
  ( (MissingZero!900 (index!5770 (_ BitVec 32))) (Found!900 (index!5771 (_ BitVec 32))) (Intermediate!900 (undefined!1712 Bool) (index!5772 (_ BitVec 32)) (x!23304 (_ BitVec 32))) (Undefined!900) (MissingVacant!900 (index!5773 (_ BitVec 32))) )
))
(declare-fun lt!114664 () SeekEntryResult!900)

(assert (=> b!227885 (= res!112174 (= (select (arr!5319 (_keys!6308 thiss!1504)) (index!5770 lt!114664)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147852 () Bool)

(declare-fun e!147848 () Bool)

(declare-fun array_inv!3517 (array!11199) Bool)

(declare-fun array_inv!3518 (array!11197) Bool)

(assert (=> b!227886 (= e!147852 (and tp!21486 tp_is_empty!5977 (array_inv!3517 (_keys!6308 thiss!1504)) (array_inv!3518 (_values!4237 thiss!1504)) e!147848))))

(declare-fun mapIsEmpty!10135 () Bool)

(declare-fun mapRes!10135 () Bool)

(assert (=> mapIsEmpty!10135 mapRes!10135))

(declare-fun bm!21176 () Bool)

(declare-fun call!21179 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21176 (= call!21179 (arrayContainsKey!0 (_keys!6308 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!112182 () Bool)

(declare-fun e!147849 () Bool)

(assert (=> start!22048 (=> (not res!112182) (not e!147849))))

(declare-fun valid!1278 (LongMapFixedSize!3190) Bool)

(assert (=> start!22048 (= res!112182 (valid!1278 thiss!1504))))

(assert (=> start!22048 e!147849))

(assert (=> start!22048 e!147852))

(assert (=> start!22048 true))

(declare-fun b!227887 () Bool)

(declare-fun e!147845 () Bool)

(assert (=> b!227887 (= e!147849 e!147845)))

(declare-fun res!112178 () Bool)

(assert (=> b!227887 (=> (not res!112178) (not e!147845))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!227887 (= res!112178 (or (= lt!114664 (MissingZero!900 index!297)) (= lt!114664 (MissingVacant!900 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11199 (_ BitVec 32)) SeekEntryResult!900)

(assert (=> b!227887 (= lt!114664 (seekEntryOrOpen!0 key!932 (_keys!6308 thiss!1504) (mask!10120 thiss!1504)))))

(declare-fun b!227888 () Bool)

(declare-fun e!147847 () Bool)

(assert (=> b!227888 (= e!147847 (is-Undefined!900 lt!114664))))

(declare-fun b!227889 () Bool)

(declare-fun e!147851 () Bool)

(declare-fun e!147841 () Bool)

(assert (=> b!227889 (= e!147851 (not e!147841))))

(declare-fun res!112176 () Bool)

(assert (=> b!227889 (=> res!112176 e!147841)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227889 (= res!112176 (not (validMask!0 (mask!10120 thiss!1504))))))

(declare-fun lt!114661 () array!11199)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11199 (_ BitVec 32)) Bool)

(assert (=> b!227889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114661 (mask!10120 thiss!1504))))

(declare-datatypes ((Unit!6916 0))(
  ( (Unit!6917) )
))
(declare-fun lt!114667 () Unit!6916)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11199 (_ BitVec 32) (_ BitVec 32)) Unit!6916)

(assert (=> b!227889 (= lt!114667 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6308 thiss!1504) index!297 (mask!10120 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11199 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227889 (= (arrayCountValidKeys!0 lt!114661 #b00000000000000000000000000000000 (size!5652 (_keys!6308 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6308 thiss!1504) #b00000000000000000000000000000000 (size!5652 (_keys!6308 thiss!1504)))))))

(declare-fun lt!114665 () Unit!6916)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11199 (_ BitVec 32) (_ BitVec 64)) Unit!6916)

(assert (=> b!227889 (= lt!114665 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6308 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3399 0))(
  ( (Nil!3396) (Cons!3395 (h!4043 (_ BitVec 64)) (t!8358 List!3399)) )
))
(declare-fun arrayNoDuplicates!0 (array!11199 (_ BitVec 32) List!3399) Bool)

(assert (=> b!227889 (arrayNoDuplicates!0 lt!114661 #b00000000000000000000000000000000 Nil!3396)))

(assert (=> b!227889 (= lt!114661 (array!11200 (store (arr!5319 (_keys!6308 thiss!1504)) index!297 key!932) (size!5652 (_keys!6308 thiss!1504))))))

(declare-fun lt!114671 () Unit!6916)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11199 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3399) Unit!6916)

(assert (=> b!227889 (= lt!114671 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6308 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3396))))

(declare-fun lt!114666 () Unit!6916)

(declare-fun e!147850 () Unit!6916)

(assert (=> b!227889 (= lt!114666 e!147850)))

(declare-fun c!37787 () Bool)

(assert (=> b!227889 (= c!37787 (arrayContainsKey!0 (_keys!6308 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227890 () Bool)

(declare-fun res!112175 () Bool)

(assert (=> b!227890 (=> res!112175 e!147841)))

(assert (=> b!227890 (= res!112175 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6308 thiss!1504) (mask!10120 thiss!1504))))))

(declare-fun mapNonEmpty!10135 () Bool)

(declare-fun tp!21487 () Bool)

(assert (=> mapNonEmpty!10135 (= mapRes!10135 (and tp!21487 e!147853))))

(declare-fun mapRest!10135 () (Array (_ BitVec 32) ValueCell!2645))

(declare-fun mapKey!10135 () (_ BitVec 32))

(declare-fun mapValue!10135 () ValueCell!2645)

(assert (=> mapNonEmpty!10135 (= (arr!5318 (_values!4237 thiss!1504)) (store mapRest!10135 mapKey!10135 mapValue!10135))))

(declare-fun b!227891 () Bool)

(declare-fun Unit!6918 () Unit!6916)

(assert (=> b!227891 (= e!147850 Unit!6918)))

(declare-fun b!227892 () Bool)

(declare-fun res!112183 () Bool)

(assert (=> b!227892 (= res!112183 (= (select (arr!5319 (_keys!6308 thiss!1504)) (index!5773 lt!114664)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147840 () Bool)

(assert (=> b!227892 (=> (not res!112183) (not e!147840))))

(declare-fun b!227893 () Bool)

(declare-fun e!147846 () Unit!6916)

(declare-fun lt!114668 () Unit!6916)

(assert (=> b!227893 (= e!147846 lt!114668)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!283 (array!11199 array!11197 (_ BitVec 32) (_ BitVec 32) V!7617 V!7617 (_ BitVec 64) Int) Unit!6916)

(assert (=> b!227893 (= lt!114668 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!283 (_keys!6308 thiss!1504) (_values!4237 thiss!1504) (mask!10120 thiss!1504) (extraKeys!3991 thiss!1504) (zeroValue!4095 thiss!1504) (minValue!4095 thiss!1504) key!932 (defaultEntry!4254 thiss!1504)))))

(declare-fun c!37788 () Bool)

(assert (=> b!227893 (= c!37788 (is-MissingZero!900 lt!114664))))

(assert (=> b!227893 e!147843))

(declare-fun b!227894 () Bool)

(assert (=> b!227894 (= e!147845 e!147851)))

(declare-fun res!112181 () Bool)

(assert (=> b!227894 (=> (not res!112181) (not e!147851))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227894 (= res!112181 (inRange!0 index!297 (mask!10120 thiss!1504)))))

(declare-fun lt!114670 () Unit!6916)

(assert (=> b!227894 (= lt!114670 e!147846)))

(declare-fun c!37786 () Bool)

(declare-datatypes ((tuple2!4478 0))(
  ( (tuple2!4479 (_1!2250 (_ BitVec 64)) (_2!2250 V!7617)) )
))
(declare-datatypes ((List!3400 0))(
  ( (Nil!3397) (Cons!3396 (h!4044 tuple2!4478) (t!8359 List!3400)) )
))
(declare-datatypes ((ListLongMap!3391 0))(
  ( (ListLongMap!3392 (toList!1711 List!3400)) )
))
(declare-fun contains!1585 (ListLongMap!3391 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1239 (array!11199 array!11197 (_ BitVec 32) (_ BitVec 32) V!7617 V!7617 (_ BitVec 32) Int) ListLongMap!3391)

(assert (=> b!227894 (= c!37786 (contains!1585 (getCurrentListMap!1239 (_keys!6308 thiss!1504) (_values!4237 thiss!1504) (mask!10120 thiss!1504) (extraKeys!3991 thiss!1504) (zeroValue!4095 thiss!1504) (minValue!4095 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4254 thiss!1504)) key!932))))

(declare-fun b!227895 () Bool)

(assert (=> b!227895 (= e!147840 (not call!21179))))

(declare-fun b!227896 () Bool)

(declare-fun Unit!6919 () Unit!6916)

(assert (=> b!227896 (= e!147846 Unit!6919)))

(declare-fun lt!114662 () Unit!6916)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!268 (array!11199 array!11197 (_ BitVec 32) (_ BitVec 32) V!7617 V!7617 (_ BitVec 64) Int) Unit!6916)

(assert (=> b!227896 (= lt!114662 (lemmaInListMapThenSeekEntryOrOpenFindsIt!268 (_keys!6308 thiss!1504) (_values!4237 thiss!1504) (mask!10120 thiss!1504) (extraKeys!3991 thiss!1504) (zeroValue!4095 thiss!1504) (minValue!4095 thiss!1504) key!932 (defaultEntry!4254 thiss!1504)))))

(assert (=> b!227896 false))

(declare-fun b!227897 () Bool)

(declare-fun res!112179 () Bool)

(assert (=> b!227897 (=> res!112179 e!147841)))

(assert (=> b!227897 (= res!112179 (or (not (= (size!5651 (_values!4237 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10120 thiss!1504)))) (not (= (size!5652 (_keys!6308 thiss!1504)) (size!5651 (_values!4237 thiss!1504)))) (bvslt (mask!10120 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3991 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3991 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227898 () Bool)

(assert (=> b!227898 (= e!147847 e!147840)))

(declare-fun res!112177 () Bool)

(assert (=> b!227898 (= res!112177 call!21180)))

(assert (=> b!227898 (=> (not res!112177) (not e!147840))))

(declare-fun b!227899 () Bool)

(declare-fun c!37785 () Bool)

(assert (=> b!227899 (= c!37785 (is-MissingVacant!900 lt!114664))))

(assert (=> b!227899 (= e!147843 e!147847)))

(declare-fun b!227900 () Bool)

(assert (=> b!227900 (= e!147841 true)))

(declare-fun lt!114669 () Bool)

(assert (=> b!227900 (= lt!114669 (arrayNoDuplicates!0 (_keys!6308 thiss!1504) #b00000000000000000000000000000000 Nil!3396))))

(declare-fun b!227901 () Bool)

(declare-fun res!112173 () Bool)

(assert (=> b!227901 (=> (not res!112173) (not e!147849))))

(assert (=> b!227901 (= res!112173 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227902 () Bool)

(assert (=> b!227902 (= e!147842 (not call!21179))))

(declare-fun b!227903 () Bool)

(declare-fun Unit!6920 () Unit!6916)

(assert (=> b!227903 (= e!147850 Unit!6920)))

(declare-fun lt!114663 () Unit!6916)

(declare-fun lemmaArrayContainsKeyThenInListMap!105 (array!11199 array!11197 (_ BitVec 32) (_ BitVec 32) V!7617 V!7617 (_ BitVec 64) (_ BitVec 32) Int) Unit!6916)

(assert (=> b!227903 (= lt!114663 (lemmaArrayContainsKeyThenInListMap!105 (_keys!6308 thiss!1504) (_values!4237 thiss!1504) (mask!10120 thiss!1504) (extraKeys!3991 thiss!1504) (zeroValue!4095 thiss!1504) (minValue!4095 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4254 thiss!1504)))))

(assert (=> b!227903 false))

(declare-fun b!227904 () Bool)

(declare-fun e!147854 () Bool)

(assert (=> b!227904 (= e!147848 (and e!147854 mapRes!10135))))

(declare-fun condMapEmpty!10135 () Bool)

(declare-fun mapDefault!10135 () ValueCell!2645)

