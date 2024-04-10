; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18730 () Bool)

(assert start!18730)

(declare-fun b!185108 () Bool)

(declare-fun b_free!4559 () Bool)

(declare-fun b_next!4559 () Bool)

(assert (=> b!185108 (= b_free!4559 (not b_next!4559))))

(declare-fun tp!16467 () Bool)

(declare-fun b_and!11155 () Bool)

(assert (=> b!185108 (= tp!16467 b_and!11155)))

(declare-fun b!185106 () Bool)

(declare-fun e!121827 () Bool)

(declare-fun tp_is_empty!4331 () Bool)

(assert (=> b!185106 (= e!121827 tp_is_empty!4331)))

(declare-fun b!185107 () Bool)

(declare-fun res!87558 () Bool)

(declare-fun e!121826 () Bool)

(assert (=> b!185107 (=> (not res!87558) (not e!121826))))

(declare-datatypes ((V!5421 0))(
  ( (V!5422 (val!2210 Int)) )
))
(declare-datatypes ((ValueCell!1822 0))(
  ( (ValueCellFull!1822 (v!4118 V!5421)) (EmptyCell!1822) )
))
(declare-datatypes ((array!7865 0))(
  ( (array!7866 (arr!3715 (Array (_ BitVec 32) (_ BitVec 64))) (size!4031 (_ BitVec 32))) )
))
(declare-datatypes ((array!7867 0))(
  ( (array!7868 (arr!3716 (Array (_ BitVec 32) ValueCell!1822)) (size!4032 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2552 0))(
  ( (LongMapFixedSize!2553 (defaultEntry!3775 Int) (mask!8873 (_ BitVec 32)) (extraKeys!3512 (_ BitVec 32)) (zeroValue!3616 V!5421) (minValue!3616 V!5421) (_size!1325 (_ BitVec 32)) (_keys!5710 array!7865) (_values!3758 array!7867) (_vacant!1325 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2552)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3442 0))(
  ( (tuple2!3443 (_1!1732 (_ BitVec 64)) (_2!1732 V!5421)) )
))
(declare-datatypes ((List!2353 0))(
  ( (Nil!2350) (Cons!2349 (h!2982 tuple2!3442) (t!7231 List!2353)) )
))
(declare-datatypes ((ListLongMap!2359 0))(
  ( (ListLongMap!2360 (toList!1195 List!2353)) )
))
(declare-fun contains!1289 (ListLongMap!2359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!843 (array!7865 array!7867 (_ BitVec 32) (_ BitVec 32) V!5421 V!5421 (_ BitVec 32) Int) ListLongMap!2359)

(assert (=> b!185107 (= res!87558 (not (contains!1289 (getCurrentListMap!843 (_keys!5710 thiss!1248) (_values!3758 thiss!1248) (mask!8873 thiss!1248) (extraKeys!3512 thiss!1248) (zeroValue!3616 thiss!1248) (minValue!3616 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3775 thiss!1248)) key!828)))))

(declare-fun e!121823 () Bool)

(declare-fun e!121822 () Bool)

(declare-fun array_inv!2403 (array!7865) Bool)

(declare-fun array_inv!2404 (array!7867) Bool)

(assert (=> b!185108 (= e!121822 (and tp!16467 tp_is_empty!4331 (array_inv!2403 (_keys!5710 thiss!1248)) (array_inv!2404 (_values!3758 thiss!1248)) e!121823))))

(declare-fun b!185109 () Bool)

(declare-fun res!87562 () Bool)

(assert (=> b!185109 (=> (not res!87562) (not e!121826))))

(assert (=> b!185109 (= res!87562 (and (= (size!4032 (_values!3758 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8873 thiss!1248))) (= (size!4031 (_keys!5710 thiss!1248)) (size!4032 (_values!3758 thiss!1248))) (bvsge (mask!8873 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3512 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3512 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!185110 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7865 (_ BitVec 32)) Bool)

(assert (=> b!185110 (= e!121826 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5710 thiss!1248) (mask!8873 thiss!1248))))))

(declare-fun b!185111 () Bool)

(declare-fun res!87561 () Bool)

(assert (=> b!185111 (=> (not res!87561) (not e!121826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185111 (= res!87561 (validMask!0 (mask!8873 thiss!1248)))))

(declare-fun b!185112 () Bool)

(declare-fun e!121828 () Bool)

(assert (=> b!185112 (= e!121828 e!121826)))

(declare-fun res!87563 () Bool)

(assert (=> b!185112 (=> (not res!87563) (not e!121826))))

(declare-datatypes ((SeekEntryResult!630 0))(
  ( (MissingZero!630 (index!4690 (_ BitVec 32))) (Found!630 (index!4691 (_ BitVec 32))) (Intermediate!630 (undefined!1442 Bool) (index!4692 (_ BitVec 32)) (x!20106 (_ BitVec 32))) (Undefined!630) (MissingVacant!630 (index!4693 (_ BitVec 32))) )
))
(declare-fun lt!91545 () SeekEntryResult!630)

(assert (=> b!185112 (= res!87563 (and (not (is-Undefined!630 lt!91545)) (not (is-MissingVacant!630 lt!91545)) (not (is-MissingZero!630 lt!91545)) (is-Found!630 lt!91545)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7865 (_ BitVec 32)) SeekEntryResult!630)

(assert (=> b!185112 (= lt!91545 (seekEntryOrOpen!0 key!828 (_keys!5710 thiss!1248) (mask!8873 thiss!1248)))))

(declare-fun b!185113 () Bool)

(declare-fun res!87560 () Bool)

(assert (=> b!185113 (=> (not res!87560) (not e!121828))))

(assert (=> b!185113 (= res!87560 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185114 () Bool)

(declare-fun e!121824 () Bool)

(declare-fun mapRes!7449 () Bool)

(assert (=> b!185114 (= e!121823 (and e!121824 mapRes!7449))))

(declare-fun condMapEmpty!7449 () Bool)

(declare-fun mapDefault!7449 () ValueCell!1822)

