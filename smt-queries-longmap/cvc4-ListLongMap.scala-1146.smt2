; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23882 () Bool)

(assert start!23882)

(declare-fun b!250447 () Bool)

(declare-fun b_free!6629 () Bool)

(declare-fun b_next!6629 () Bool)

(assert (=> b!250447 (= b_free!6629 (not b_next!6629))))

(declare-fun tp!23151 () Bool)

(declare-fun b_and!13649 () Bool)

(assert (=> b!250447 (= tp!23151 b_and!13649)))

(declare-fun b!250440 () Bool)

(declare-fun e!162438 () Bool)

(declare-fun tp_is_empty!6491 () Bool)

(assert (=> b!250440 (= e!162438 tp_is_empty!6491)))

(declare-fun mapIsEmpty!11029 () Bool)

(declare-fun mapRes!11029 () Bool)

(assert (=> mapIsEmpty!11029 mapRes!11029))

(declare-fun bm!23527 () Bool)

(declare-fun call!23530 () Bool)

(declare-datatypes ((V!8301 0))(
  ( (V!8302 (val!3290 Int)) )
))
(declare-datatypes ((ValueCell!2902 0))(
  ( (ValueCellFull!2902 (v!5355 V!8301)) (EmptyCell!2902) )
))
(declare-datatypes ((array!12299 0))(
  ( (array!12300 (arr!5832 (Array (_ BitVec 32) ValueCell!2902)) (size!6177 (_ BitVec 32))) )
))
(declare-datatypes ((array!12301 0))(
  ( (array!12302 (arr!5833 (Array (_ BitVec 32) (_ BitVec 64))) (size!6178 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3704 0))(
  ( (LongMapFixedSize!3705 (defaultEntry!4629 Int) (mask!10812 (_ BitVec 32)) (extraKeys!4366 (_ BitVec 32)) (zeroValue!4470 V!8301) (minValue!4470 V!8301) (_size!1901 (_ BitVec 32)) (_keys!6765 array!12301) (_values!4612 array!12299) (_vacant!1901 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3704)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23527 (= call!23530 (arrayContainsKey!0 (_keys!6765 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250441 () Bool)

(declare-datatypes ((Unit!7753 0))(
  ( (Unit!7754) )
))
(declare-fun e!162431 () Unit!7753)

(declare-fun lt!125466 () Unit!7753)

(assert (=> b!250441 (= e!162431 lt!125466)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!400 (array!12301 array!12299 (_ BitVec 32) (_ BitVec 32) V!8301 V!8301 (_ BitVec 64) Int) Unit!7753)

(assert (=> b!250441 (= lt!125466 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!400 (_keys!6765 thiss!1504) (_values!4612 thiss!1504) (mask!10812 thiss!1504) (extraKeys!4366 thiss!1504) (zeroValue!4470 thiss!1504) (minValue!4470 thiss!1504) key!932 (defaultEntry!4629 thiss!1504)))))

(declare-fun c!42079 () Bool)

(declare-datatypes ((SeekEntryResult!1122 0))(
  ( (MissingZero!1122 (index!6658 (_ BitVec 32))) (Found!1122 (index!6659 (_ BitVec 32))) (Intermediate!1122 (undefined!1934 Bool) (index!6660 (_ BitVec 32)) (x!24672 (_ BitVec 32))) (Undefined!1122) (MissingVacant!1122 (index!6661 (_ BitVec 32))) )
))
(declare-fun lt!125474 () SeekEntryResult!1122)

(assert (=> b!250441 (= c!42079 (is-MissingZero!1122 lt!125474))))

(declare-fun e!162428 () Bool)

(assert (=> b!250441 e!162428))

(declare-fun b!250442 () Bool)

(declare-fun res!122658 () Bool)

(assert (=> b!250442 (= res!122658 (= (select (arr!5833 (_keys!6765 thiss!1504)) (index!6661 lt!125474)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162439 () Bool)

(assert (=> b!250442 (=> (not res!122658) (not e!162439))))

(declare-fun b!250443 () Bool)

(declare-fun e!162435 () Bool)

(assert (=> b!250443 (= e!162435 tp_is_empty!6491)))

(declare-fun b!250444 () Bool)

(declare-fun e!162436 () Bool)

(declare-fun e!162429 () Bool)

(assert (=> b!250444 (= e!162436 e!162429)))

(declare-fun res!122655 () Bool)

(assert (=> b!250444 (=> (not res!122655) (not e!162429))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250444 (= res!122655 (inRange!0 index!297 (mask!10812 thiss!1504)))))

(declare-fun lt!125470 () Unit!7753)

(assert (=> b!250444 (= lt!125470 e!162431)))

(declare-fun c!42078 () Bool)

(declare-datatypes ((tuple2!4842 0))(
  ( (tuple2!4843 (_1!2432 (_ BitVec 64)) (_2!2432 V!8301)) )
))
(declare-datatypes ((List!3724 0))(
  ( (Nil!3721) (Cons!3720 (h!4380 tuple2!4842) (t!8757 List!3724)) )
))
(declare-datatypes ((ListLongMap!3755 0))(
  ( (ListLongMap!3756 (toList!1893 List!3724)) )
))
(declare-fun contains!1814 (ListLongMap!3755 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1421 (array!12301 array!12299 (_ BitVec 32) (_ BitVec 32) V!8301 V!8301 (_ BitVec 32) Int) ListLongMap!3755)

(assert (=> b!250444 (= c!42078 (contains!1814 (getCurrentListMap!1421 (_keys!6765 thiss!1504) (_values!4612 thiss!1504) (mask!10812 thiss!1504) (extraKeys!4366 thiss!1504) (zeroValue!4470 thiss!1504) (minValue!4470 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4629 thiss!1504)) key!932))))

(declare-fun b!250445 () Bool)

(declare-fun res!122657 () Bool)

(declare-fun e!162434 () Bool)

(assert (=> b!250445 (=> (not res!122657) (not e!162434))))

(assert (=> b!250445 (= res!122657 (= (select (arr!5833 (_keys!6765 thiss!1504)) (index!6658 lt!125474)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!122659 () Bool)

(declare-fun e!162437 () Bool)

(assert (=> start!23882 (=> (not res!122659) (not e!162437))))

(declare-fun valid!1448 (LongMapFixedSize!3704) Bool)

(assert (=> start!23882 (= res!122659 (valid!1448 thiss!1504))))

(assert (=> start!23882 e!162437))

(declare-fun e!162432 () Bool)

(assert (=> start!23882 e!162432))

(assert (=> start!23882 true))

(declare-fun b!250446 () Bool)

(declare-fun res!122662 () Bool)

(assert (=> b!250446 (=> (not res!122662) (not e!162434))))

(declare-fun call!23531 () Bool)

(assert (=> b!250446 (= res!122662 call!23531)))

(assert (=> b!250446 (= e!162428 e!162434)))

(declare-fun e!162433 () Bool)

(declare-fun array_inv!3849 (array!12301) Bool)

(declare-fun array_inv!3850 (array!12299) Bool)

(assert (=> b!250447 (= e!162432 (and tp!23151 tp_is_empty!6491 (array_inv!3849 (_keys!6765 thiss!1504)) (array_inv!3850 (_values!4612 thiss!1504)) e!162433))))

(declare-fun b!250448 () Bool)

(declare-fun c!42080 () Bool)

(assert (=> b!250448 (= c!42080 (is-MissingVacant!1122 lt!125474))))

(declare-fun e!162430 () Bool)

(assert (=> b!250448 (= e!162428 e!162430)))

(declare-fun b!250449 () Bool)

(assert (=> b!250449 (= e!162433 (and e!162435 mapRes!11029))))

(declare-fun condMapEmpty!11029 () Bool)

(declare-fun mapDefault!11029 () ValueCell!2902)

