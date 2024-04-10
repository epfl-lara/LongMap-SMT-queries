; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21952 () Bool)

(assert start!21952)

(declare-fun b!224380 () Bool)

(declare-fun b_free!6019 () Bool)

(declare-fun b_next!6019 () Bool)

(assert (=> b!224380 (= b_free!6019 (not b_next!6019))))

(declare-fun tp!21198 () Bool)

(declare-fun b_and!12917 () Bool)

(assert (=> b!224380 (= tp!21198 b_and!12917)))

(declare-fun b!224373 () Bool)

(declare-fun e!145670 () Bool)

(declare-fun e!145683 () Bool)

(assert (=> b!224373 (= e!145670 e!145683)))

(declare-fun res!110401 () Bool)

(assert (=> b!224373 (=> (not res!110401) (not e!145683))))

(declare-datatypes ((V!7489 0))(
  ( (V!7490 (val!2985 Int)) )
))
(declare-datatypes ((ValueCell!2597 0))(
  ( (ValueCellFull!2597 (v!5005 V!7489)) (EmptyCell!2597) )
))
(declare-datatypes ((array!11005 0))(
  ( (array!11006 (arr!5222 (Array (_ BitVec 32) ValueCell!2597)) (size!5555 (_ BitVec 32))) )
))
(declare-datatypes ((array!11007 0))(
  ( (array!11008 (arr!5223 (Array (_ BitVec 32) (_ BitVec 64))) (size!5556 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3094 0))(
  ( (LongMapFixedSize!3095 (defaultEntry!4206 Int) (mask!10040 (_ BitVec 32)) (extraKeys!3943 (_ BitVec 32)) (zeroValue!4047 V!7489) (minValue!4047 V!7489) (_size!1596 (_ BitVec 32)) (_keys!6260 array!11007) (_values!4189 array!11005) (_vacant!1596 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3094)

(assert (=> b!224373 (= res!110401 (and (bvslt (size!5556 (_keys!6260 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5556 (_keys!6260 thiss!1504)))))))

(declare-datatypes ((Unit!6747 0))(
  ( (Unit!6748) )
))
(declare-fun lt!113135 () Unit!6747)

(declare-fun e!145671 () Unit!6747)

(assert (=> b!224373 (= lt!113135 e!145671)))

(declare-fun c!37212 () Bool)

(declare-fun lt!113136 () Bool)

(assert (=> b!224373 (= c!37212 lt!113136)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224373 (= lt!113136 (arrayContainsKey!0 (_keys!6260 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224374 () Bool)

(declare-fun res!110405 () Bool)

(assert (=> b!224374 (=> (not res!110405) (not e!145683))))

(declare-datatypes ((List!3335 0))(
  ( (Nil!3332) (Cons!3331 (h!3979 (_ BitVec 64)) (t!8294 List!3335)) )
))
(declare-fun noDuplicate!84 (List!3335) Bool)

(assert (=> b!224374 (= res!110405 (noDuplicate!84 Nil!3332))))

(declare-fun b!224375 () Bool)

(declare-fun e!145668 () Unit!6747)

(declare-fun Unit!6749 () Unit!6747)

(assert (=> b!224375 (= e!145668 Unit!6749)))

(declare-fun lt!113141 () Unit!6747)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!238 (array!11007 array!11005 (_ BitVec 32) (_ BitVec 32) V!7489 V!7489 (_ BitVec 64) Int) Unit!6747)

(assert (=> b!224375 (= lt!113141 (lemmaInListMapThenSeekEntryOrOpenFindsIt!238 (_keys!6260 thiss!1504) (_values!4189 thiss!1504) (mask!10040 thiss!1504) (extraKeys!3943 thiss!1504) (zeroValue!4047 thiss!1504) (minValue!4047 thiss!1504) key!932 (defaultEntry!4206 thiss!1504)))))

(assert (=> b!224375 false))

(declare-fun b!224376 () Bool)

(declare-fun res!110408 () Bool)

(assert (=> b!224376 (=> (not res!110408) (not e!145683))))

(declare-fun contains!1555 (List!3335 (_ BitVec 64)) Bool)

(assert (=> b!224376 (= res!110408 (not (contains!1555 Nil!3332 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224377 () Bool)

(declare-fun lt!113139 () Unit!6747)

(assert (=> b!224377 (= e!145668 lt!113139)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!249 (array!11007 array!11005 (_ BitVec 32) (_ BitVec 32) V!7489 V!7489 (_ BitVec 64) Int) Unit!6747)

(assert (=> b!224377 (= lt!113139 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!249 (_keys!6260 thiss!1504) (_values!4189 thiss!1504) (mask!10040 thiss!1504) (extraKeys!3943 thiss!1504) (zeroValue!4047 thiss!1504) (minValue!4047 thiss!1504) key!932 (defaultEntry!4206 thiss!1504)))))

(declare-fun c!37211 () Bool)

(declare-datatypes ((SeekEntryResult!857 0))(
  ( (MissingZero!857 (index!5598 (_ BitVec 32))) (Found!857 (index!5599 (_ BitVec 32))) (Intermediate!857 (undefined!1669 Bool) (index!5600 (_ BitVec 32)) (x!23133 (_ BitVec 32))) (Undefined!857) (MissingVacant!857 (index!5601 (_ BitVec 32))) )
))
(declare-fun lt!113140 () SeekEntryResult!857)

(assert (=> b!224377 (= c!37211 (is-MissingZero!857 lt!113140))))

(declare-fun e!145674 () Bool)

(assert (=> b!224377 e!145674))

(declare-fun b!224378 () Bool)

(declare-fun e!145677 () Bool)

(declare-fun e!145685 () Bool)

(assert (=> b!224378 (= e!145677 e!145685)))

(declare-fun res!110406 () Bool)

(declare-fun call!20891 () Bool)

(assert (=> b!224378 (= res!110406 call!20891)))

(assert (=> b!224378 (=> (not res!110406) (not e!145685))))

(declare-fun b!224379 () Bool)

(declare-fun res!110402 () Bool)

(assert (=> b!224379 (=> (not res!110402) (not e!145683))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224379 (= res!110402 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5556 (_keys!6260 thiss!1504)))))))

(declare-fun tp_is_empty!5881 () Bool)

(declare-fun e!145681 () Bool)

(declare-fun e!145676 () Bool)

(declare-fun array_inv!3455 (array!11007) Bool)

(declare-fun array_inv!3456 (array!11005) Bool)

(assert (=> b!224380 (= e!145676 (and tp!21198 tp_is_empty!5881 (array_inv!3455 (_keys!6260 thiss!1504)) (array_inv!3456 (_values!4189 thiss!1504)) e!145681))))

(declare-fun b!224381 () Bool)

(declare-fun e!145684 () Bool)

(declare-fun e!145675 () Bool)

(assert (=> b!224381 (= e!145684 e!145675)))

(declare-fun res!110410 () Bool)

(assert (=> b!224381 (=> (not res!110410) (not e!145675))))

(assert (=> b!224381 (= res!110410 (or (= lt!113140 (MissingZero!857 index!297)) (= lt!113140 (MissingVacant!857 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11007 (_ BitVec 32)) SeekEntryResult!857)

(assert (=> b!224381 (= lt!113140 (seekEntryOrOpen!0 key!932 (_keys!6260 thiss!1504) (mask!10040 thiss!1504)))))

(declare-fun b!224382 () Bool)

(declare-fun res!110394 () Bool)

(declare-fun e!145678 () Bool)

(assert (=> b!224382 (=> (not res!110394) (not e!145678))))

(assert (=> b!224382 (= res!110394 (= (select (arr!5223 (_keys!6260 thiss!1504)) (index!5598 lt!113140)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!224383 () Bool)

(declare-fun e!145669 () Bool)

(assert (=> b!224383 (= e!145669 (not (contains!1555 Nil!3332 key!932)))))

(declare-fun b!224384 () Bool)

(declare-fun e!145682 () Bool)

(assert (=> b!224384 (= e!145682 tp_is_empty!5881)))

(declare-fun res!110395 () Bool)

(assert (=> start!21952 (=> (not res!110395) (not e!145684))))

(declare-fun valid!1247 (LongMapFixedSize!3094) Bool)

(assert (=> start!21952 (= res!110395 (valid!1247 thiss!1504))))

(assert (=> start!21952 e!145684))

(assert (=> start!21952 e!145676))

(assert (=> start!21952 true))

(declare-fun b!224385 () Bool)

(assert (=> b!224385 (= e!145677 (is-Undefined!857 lt!113140))))

(declare-fun b!224386 () Bool)

(declare-fun res!110397 () Bool)

(assert (=> b!224386 (=> (not res!110397) (not e!145683))))

(declare-fun arrayNoDuplicates!0 (array!11007 (_ BitVec 32) List!3335) Bool)

(assert (=> b!224386 (= res!110397 (arrayNoDuplicates!0 (_keys!6260 thiss!1504) #b00000000000000000000000000000000 Nil!3332))))

(declare-fun b!224387 () Bool)

(declare-fun res!110400 () Bool)

(assert (=> b!224387 (= res!110400 (= (select (arr!5223 (_keys!6260 thiss!1504)) (index!5601 lt!113140)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224387 (=> (not res!110400) (not e!145685))))

(declare-fun b!224388 () Bool)

(declare-fun e!145673 () Bool)

(assert (=> b!224388 (= e!145673 e!145669)))

(declare-fun res!110409 () Bool)

(assert (=> b!224388 (=> (not res!110409) (not e!145669))))

(assert (=> b!224388 (= res!110409 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun mapNonEmpty!9991 () Bool)

(declare-fun mapRes!9991 () Bool)

(declare-fun tp!21199 () Bool)

(declare-fun e!145679 () Bool)

(assert (=> mapNonEmpty!9991 (= mapRes!9991 (and tp!21199 e!145679))))

(declare-fun mapRest!9991 () (Array (_ BitVec 32) ValueCell!2597))

(declare-fun mapKey!9991 () (_ BitVec 32))

(declare-fun mapValue!9991 () ValueCell!2597)

(assert (=> mapNonEmpty!9991 (= (arr!5222 (_values!4189 thiss!1504)) (store mapRest!9991 mapKey!9991 mapValue!9991))))

(declare-fun b!224389 () Bool)

(declare-fun res!110392 () Bool)

(assert (=> b!224389 (=> (not res!110392) (not e!145683))))

(assert (=> b!224389 (= res!110392 (not (contains!1555 Nil!3332 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224390 () Bool)

(declare-fun res!110403 () Bool)

(assert (=> b!224390 (=> (not res!110403) (not e!145684))))

(assert (=> b!224390 (= res!110403 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!9991 () Bool)

(assert (=> mapIsEmpty!9991 mapRes!9991))

(declare-fun b!224391 () Bool)

(declare-fun call!20892 () Bool)

(assert (=> b!224391 (= e!145685 (not call!20892))))

(declare-fun b!224392 () Bool)

(declare-fun res!110396 () Bool)

(assert (=> b!224392 (=> (not res!110396) (not e!145683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224392 (= res!110396 (validKeyInArray!0 key!932))))

(declare-fun b!224393 () Bool)

(assert (=> b!224393 (= e!145679 tp_is_empty!5881)))

(declare-fun bm!20888 () Bool)

(assert (=> bm!20888 (= call!20892 (arrayContainsKey!0 (_keys!6260 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!20889 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20889 (= call!20891 (inRange!0 (ite c!37211 (index!5598 lt!113140) (index!5601 lt!113140)) (mask!10040 thiss!1504)))))

(declare-fun b!224394 () Bool)

(declare-fun e!145680 () Bool)

(assert (=> b!224394 (= e!145680 (contains!1555 Nil!3332 key!932))))

(declare-fun b!224395 () Bool)

(assert (=> b!224395 (= e!145678 (not call!20892))))

(declare-fun b!224396 () Bool)

(assert (=> b!224396 (= e!145681 (and e!145682 mapRes!9991))))

(declare-fun condMapEmpty!9991 () Bool)

(declare-fun mapDefault!9991 () ValueCell!2597)

