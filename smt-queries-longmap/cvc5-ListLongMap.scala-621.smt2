; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16074 () Bool)

(assert start!16074)

(declare-fun b!159635 () Bool)

(declare-fun b_free!3535 () Bool)

(declare-fun b_next!3535 () Bool)

(assert (=> b!159635 (= b_free!3535 (not b_next!3535))))

(declare-fun tp!13175 () Bool)

(declare-fun b_and!9949 () Bool)

(assert (=> b!159635 (= tp!13175 b_and!9949)))

(declare-fun mapIsEmpty!5693 () Bool)

(declare-fun mapRes!5693 () Bool)

(assert (=> mapIsEmpty!5693 mapRes!5693))

(declare-fun res!75449 () Bool)

(declare-fun e!104464 () Bool)

(assert (=> start!16074 (=> (not res!75449) (not e!104464))))

(declare-datatypes ((V!4097 0))(
  ( (V!4098 (val!1713 Int)) )
))
(declare-datatypes ((ValueCell!1325 0))(
  ( (ValueCellFull!1325 (v!3578 V!4097)) (EmptyCell!1325) )
))
(declare-datatypes ((array!5753 0))(
  ( (array!5754 (arr!2721 (Array (_ BitVec 32) (_ BitVec 64))) (size!3005 (_ BitVec 32))) )
))
(declare-datatypes ((array!5755 0))(
  ( (array!5756 (arr!2722 (Array (_ BitVec 32) ValueCell!1325)) (size!3006 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1558 0))(
  ( (LongMapFixedSize!1559 (defaultEntry!3221 Int) (mask!7775 (_ BitVec 32)) (extraKeys!2962 (_ BitVec 32)) (zeroValue!3064 V!4097) (minValue!3064 V!4097) (_size!828 (_ BitVec 32)) (_keys!5022 array!5753) (_values!3204 array!5755) (_vacant!828 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1558)

(declare-fun valid!727 (LongMapFixedSize!1558) Bool)

(assert (=> start!16074 (= res!75449 (valid!727 thiss!1248))))

(assert (=> start!16074 e!104464))

(declare-fun e!104466 () Bool)

(assert (=> start!16074 e!104466))

(assert (=> start!16074 true))

(declare-fun b!159627 () Bool)

(declare-fun res!75454 () Bool)

(assert (=> b!159627 (=> (not res!75454) (not e!104464))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!314 0))(
  ( (MissingZero!314 (index!3424 (_ BitVec 32))) (Found!314 (index!3425 (_ BitVec 32))) (Intermediate!314 (undefined!1126 Bool) (index!3426 (_ BitVec 32)) (x!17626 (_ BitVec 32))) (Undefined!314) (MissingVacant!314 (index!3427 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5753 (_ BitVec 32)) SeekEntryResult!314)

(assert (=> b!159627 (= res!75454 (is-Undefined!314 (seekEntryOrOpen!0 key!828 (_keys!5022 thiss!1248) (mask!7775 thiss!1248))))))

(declare-fun b!159628 () Bool)

(declare-fun e!104463 () Bool)

(declare-fun tp_is_empty!3337 () Bool)

(assert (=> b!159628 (= e!104463 tp_is_empty!3337)))

(declare-fun b!159629 () Bool)

(assert (=> b!159629 (= e!104464 false)))

(declare-fun lt!82015 () Bool)

(declare-datatypes ((List!1913 0))(
  ( (Nil!1910) (Cons!1909 (h!2522 (_ BitVec 64)) (t!6715 List!1913)) )
))
(declare-fun arrayNoDuplicates!0 (array!5753 (_ BitVec 32) List!1913) Bool)

(assert (=> b!159629 (= lt!82015 (arrayNoDuplicates!0 (_keys!5022 thiss!1248) #b00000000000000000000000000000000 Nil!1910))))

(declare-fun b!159630 () Bool)

(declare-fun e!104465 () Bool)

(assert (=> b!159630 (= e!104465 tp_is_empty!3337)))

(declare-fun b!159631 () Bool)

(declare-fun res!75452 () Bool)

(assert (=> b!159631 (=> (not res!75452) (not e!104464))))

(assert (=> b!159631 (= res!75452 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159632 () Bool)

(declare-fun res!75453 () Bool)

(assert (=> b!159632 (=> (not res!75453) (not e!104464))))

(declare-datatypes ((tuple2!2892 0))(
  ( (tuple2!2893 (_1!1457 (_ BitVec 64)) (_2!1457 V!4097)) )
))
(declare-datatypes ((List!1914 0))(
  ( (Nil!1911) (Cons!1910 (h!2523 tuple2!2892) (t!6716 List!1914)) )
))
(declare-datatypes ((ListLongMap!1879 0))(
  ( (ListLongMap!1880 (toList!955 List!1914)) )
))
(declare-fun contains!991 (ListLongMap!1879 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!619 (array!5753 array!5755 (_ BitVec 32) (_ BitVec 32) V!4097 V!4097 (_ BitVec 32) Int) ListLongMap!1879)

(assert (=> b!159632 (= res!75453 (contains!991 (getCurrentListMap!619 (_keys!5022 thiss!1248) (_values!3204 thiss!1248) (mask!7775 thiss!1248) (extraKeys!2962 thiss!1248) (zeroValue!3064 thiss!1248) (minValue!3064 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3221 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!5693 () Bool)

(declare-fun tp!13174 () Bool)

(assert (=> mapNonEmpty!5693 (= mapRes!5693 (and tp!13174 e!104463))))

(declare-fun mapRest!5693 () (Array (_ BitVec 32) ValueCell!1325))

(declare-fun mapValue!5693 () ValueCell!1325)

(declare-fun mapKey!5693 () (_ BitVec 32))

(assert (=> mapNonEmpty!5693 (= (arr!2722 (_values!3204 thiss!1248)) (store mapRest!5693 mapKey!5693 mapValue!5693))))

(declare-fun b!159633 () Bool)

(declare-fun res!75451 () Bool)

(assert (=> b!159633 (=> (not res!75451) (not e!104464))))

(assert (=> b!159633 (= res!75451 (and (= (size!3006 (_values!3204 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7775 thiss!1248))) (= (size!3005 (_keys!5022 thiss!1248)) (size!3006 (_values!3204 thiss!1248))) (bvsge (mask!7775 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2962 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2962 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159634 () Bool)

(declare-fun res!75450 () Bool)

(assert (=> b!159634 (=> (not res!75450) (not e!104464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5753 (_ BitVec 32)) Bool)

(assert (=> b!159634 (= res!75450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5022 thiss!1248) (mask!7775 thiss!1248)))))

(declare-fun e!104462 () Bool)

(declare-fun array_inv!1729 (array!5753) Bool)

(declare-fun array_inv!1730 (array!5755) Bool)

(assert (=> b!159635 (= e!104466 (and tp!13175 tp_is_empty!3337 (array_inv!1729 (_keys!5022 thiss!1248)) (array_inv!1730 (_values!3204 thiss!1248)) e!104462))))

(declare-fun b!159636 () Bool)

(declare-fun res!75455 () Bool)

(assert (=> b!159636 (=> (not res!75455) (not e!104464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159636 (= res!75455 (validMask!0 (mask!7775 thiss!1248)))))

(declare-fun b!159637 () Bool)

(assert (=> b!159637 (= e!104462 (and e!104465 mapRes!5693))))

(declare-fun condMapEmpty!5693 () Bool)

(declare-fun mapDefault!5693 () ValueCell!1325)

