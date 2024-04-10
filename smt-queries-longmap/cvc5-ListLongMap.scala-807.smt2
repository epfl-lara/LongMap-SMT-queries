; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19504 () Bool)

(assert start!19504)

(declare-fun b!191508 () Bool)

(declare-fun b_free!4681 () Bool)

(declare-fun b_next!4681 () Bool)

(assert (=> b!191508 (= b_free!4681 (not b_next!4681))))

(declare-fun tp!16892 () Bool)

(declare-fun b_and!11355 () Bool)

(assert (=> b!191508 (= tp!16892 b_and!11355)))

(declare-fun b!191505 () Bool)

(declare-fun e!126030 () Bool)

(declare-datatypes ((V!5585 0))(
  ( (V!5586 (val!2271 Int)) )
))
(declare-datatypes ((ValueCell!1883 0))(
  ( (ValueCellFull!1883 (v!4211 V!5585)) (EmptyCell!1883) )
))
(declare-datatypes ((array!8145 0))(
  ( (array!8146 (arr!3837 (Array (_ BitVec 32) (_ BitVec 64))) (size!4159 (_ BitVec 32))) )
))
(declare-datatypes ((array!8147 0))(
  ( (array!8148 (arr!3838 (Array (_ BitVec 32) ValueCell!1883)) (size!4160 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2674 0))(
  ( (LongMapFixedSize!2675 (defaultEntry!3909 Int) (mask!9130 (_ BitVec 32)) (extraKeys!3646 (_ BitVec 32)) (zeroValue!3750 V!5585) (minValue!3750 V!5585) (_size!1386 (_ BitVec 32)) (_keys!5887 array!8145) (_values!3892 array!8147) (_vacant!1386 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2674)

(assert (=> b!191505 (= e!126030 (or (not (= (size!4160 (_values!3892 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9130 thiss!1248)))) (not (= (size!4159 (_keys!5887 thiss!1248)) (size!4160 (_values!3892 thiss!1248)))) (bvslt (mask!9130 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3646 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!191506 () Bool)

(declare-fun e!126028 () Bool)

(assert (=> b!191506 (= e!126028 (not e!126030))))

(declare-fun res!90511 () Bool)

(assert (=> b!191506 (=> res!90511 e!126030)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!191506 (= res!90511 (not (validMask!0 (mask!9130 thiss!1248))))))

(declare-datatypes ((tuple2!3530 0))(
  ( (tuple2!3531 (_1!1776 (_ BitVec 64)) (_2!1776 V!5585)) )
))
(declare-datatypes ((List!2424 0))(
  ( (Nil!2421) (Cons!2420 (h!3059 tuple2!3530) (t!7338 List!2424)) )
))
(declare-datatypes ((ListLongMap!2447 0))(
  ( (ListLongMap!2448 (toList!1239 List!2424)) )
))
(declare-fun lt!95090 () ListLongMap!2447)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!5585)

(declare-datatypes ((SeekEntryResult!678 0))(
  ( (MissingZero!678 (index!4882 (_ BitVec 32))) (Found!678 (index!4883 (_ BitVec 32))) (Intermediate!678 (undefined!1490 Bool) (index!4884 (_ BitVec 32)) (x!20550 (_ BitVec 32))) (Undefined!678) (MissingVacant!678 (index!4885 (_ BitVec 32))) )
))
(declare-fun lt!95088 () SeekEntryResult!678)

(declare-fun +!307 (ListLongMap!2447 tuple2!3530) ListLongMap!2447)

(declare-fun getCurrentListMap!887 (array!8145 array!8147 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 32) Int) ListLongMap!2447)

(assert (=> b!191506 (= (+!307 lt!95090 (tuple2!3531 key!828 v!309)) (getCurrentListMap!887 (_keys!5887 thiss!1248) (array!8148 (store (arr!3838 (_values!3892 thiss!1248)) (index!4883 lt!95088) (ValueCellFull!1883 v!309)) (size!4160 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-datatypes ((Unit!5790 0))(
  ( (Unit!5791) )
))
(declare-fun lt!95093 () Unit!5790)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!108 (array!8145 array!8147 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 32) (_ BitVec 64) V!5585 Int) Unit!5790)

(assert (=> b!191506 (= lt!95093 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!108 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (index!4883 lt!95088) key!828 v!309 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95091 () Unit!5790)

(declare-fun e!126023 () Unit!5790)

(assert (=> b!191506 (= lt!95091 e!126023)))

(declare-fun c!34478 () Bool)

(declare-fun contains!1353 (ListLongMap!2447 (_ BitVec 64)) Bool)

(assert (=> b!191506 (= c!34478 (contains!1353 lt!95090 key!828))))

(assert (=> b!191506 (= lt!95090 (getCurrentListMap!887 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun b!191507 () Bool)

(declare-fun e!126021 () Bool)

(assert (=> b!191507 (= e!126021 (= (select (arr!3837 (_keys!5887 thiss!1248)) (index!4883 lt!95088)) key!828))))

(declare-fun e!126027 () Bool)

(declare-fun tp_is_empty!4453 () Bool)

(declare-fun e!126022 () Bool)

(declare-fun array_inv!2487 (array!8145) Bool)

(declare-fun array_inv!2488 (array!8147) Bool)

(assert (=> b!191508 (= e!126027 (and tp!16892 tp_is_empty!4453 (array_inv!2487 (_keys!5887 thiss!1248)) (array_inv!2488 (_values!3892 thiss!1248)) e!126022))))

(declare-fun mapNonEmpty!7692 () Bool)

(declare-fun mapRes!7692 () Bool)

(declare-fun tp!16893 () Bool)

(declare-fun e!126024 () Bool)

(assert (=> mapNonEmpty!7692 (= mapRes!7692 (and tp!16893 e!126024))))

(declare-fun mapRest!7692 () (Array (_ BitVec 32) ValueCell!1883))

(declare-fun mapKey!7692 () (_ BitVec 32))

(declare-fun mapValue!7692 () ValueCell!1883)

(assert (=> mapNonEmpty!7692 (= (arr!3838 (_values!3892 thiss!1248)) (store mapRest!7692 mapKey!7692 mapValue!7692))))

(declare-fun b!191509 () Bool)

(declare-fun lt!95092 () Unit!5790)

(assert (=> b!191509 (= e!126023 lt!95092)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!173 (array!8145 array!8147 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 64) Int) Unit!5790)

(assert (=> b!191509 (= lt!95092 (lemmaInListMapThenSeekEntryOrOpenFindsIt!173 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)))))

(declare-fun res!90509 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!191509 (= res!90509 (inRange!0 (index!4883 lt!95088) (mask!9130 thiss!1248)))))

(assert (=> b!191509 (=> (not res!90509) (not e!126021))))

(assert (=> b!191509 e!126021))

(declare-fun b!191510 () Bool)

(assert (=> b!191510 (= e!126024 tp_is_empty!4453)))

(declare-fun b!191511 () Bool)

(declare-fun Unit!5792 () Unit!5790)

(assert (=> b!191511 (= e!126023 Unit!5792)))

(declare-fun lt!95089 () Unit!5790)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!180 (array!8145 array!8147 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 64) Int) Unit!5790)

(assert (=> b!191511 (= lt!95089 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!180 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)))))

(assert (=> b!191511 false))

(declare-fun mapIsEmpty!7692 () Bool)

(assert (=> mapIsEmpty!7692 mapRes!7692))

(declare-fun b!191512 () Bool)

(declare-fun res!90507 () Bool)

(declare-fun e!126026 () Bool)

(assert (=> b!191512 (=> (not res!90507) (not e!126026))))

(assert (=> b!191512 (= res!90507 (not (= key!828 (bvneg key!828))))))

(declare-fun b!191513 () Bool)

(declare-fun e!126029 () Bool)

(assert (=> b!191513 (= e!126029 tp_is_empty!4453)))

(declare-fun b!191514 () Bool)

(assert (=> b!191514 (= e!126026 e!126028)))

(declare-fun res!90510 () Bool)

(assert (=> b!191514 (=> (not res!90510) (not e!126028))))

(assert (=> b!191514 (= res!90510 (and (not (is-Undefined!678 lt!95088)) (not (is-MissingVacant!678 lt!95088)) (not (is-MissingZero!678 lt!95088)) (is-Found!678 lt!95088)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8145 (_ BitVec 32)) SeekEntryResult!678)

(assert (=> b!191514 (= lt!95088 (seekEntryOrOpen!0 key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)))))

(declare-fun b!191515 () Bool)

(assert (=> b!191515 (= e!126022 (and e!126029 mapRes!7692))))

(declare-fun condMapEmpty!7692 () Bool)

(declare-fun mapDefault!7692 () ValueCell!1883)

