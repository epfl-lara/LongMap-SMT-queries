; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18726 () Bool)

(assert start!18726)

(declare-fun b!185055 () Bool)

(declare-fun b_free!4555 () Bool)

(declare-fun b_next!4555 () Bool)

(assert (=> b!185055 (= b_free!4555 (not b_next!4555))))

(declare-fun tp!16455 () Bool)

(declare-fun b_and!11151 () Bool)

(assert (=> b!185055 (= tp!16455 b_and!11151)))

(declare-fun b!185046 () Bool)

(declare-fun res!87526 () Bool)

(declare-fun e!121782 () Bool)

(assert (=> b!185046 (=> (not res!87526) (not e!121782))))

(declare-datatypes ((V!5417 0))(
  ( (V!5418 (val!2208 Int)) )
))
(declare-datatypes ((ValueCell!1820 0))(
  ( (ValueCellFull!1820 (v!4116 V!5417)) (EmptyCell!1820) )
))
(declare-datatypes ((array!7857 0))(
  ( (array!7858 (arr!3711 (Array (_ BitVec 32) (_ BitVec 64))) (size!4027 (_ BitVec 32))) )
))
(declare-datatypes ((array!7859 0))(
  ( (array!7860 (arr!3712 (Array (_ BitVec 32) ValueCell!1820)) (size!4028 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2548 0))(
  ( (LongMapFixedSize!2549 (defaultEntry!3773 Int) (mask!8871 (_ BitVec 32)) (extraKeys!3510 (_ BitVec 32)) (zeroValue!3614 V!5417) (minValue!3614 V!5417) (_size!1323 (_ BitVec 32)) (_keys!5708 array!7857) (_values!3756 array!7859) (_vacant!1323 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2548)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3438 0))(
  ( (tuple2!3439 (_1!1730 (_ BitVec 64)) (_2!1730 V!5417)) )
))
(declare-datatypes ((List!2351 0))(
  ( (Nil!2348) (Cons!2347 (h!2980 tuple2!3438) (t!7229 List!2351)) )
))
(declare-datatypes ((ListLongMap!2355 0))(
  ( (ListLongMap!2356 (toList!1193 List!2351)) )
))
(declare-fun contains!1287 (ListLongMap!2355 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!841 (array!7857 array!7859 (_ BitVec 32) (_ BitVec 32) V!5417 V!5417 (_ BitVec 32) Int) ListLongMap!2355)

(assert (=> b!185046 (= res!87526 (not (contains!1287 (getCurrentListMap!841 (_keys!5708 thiss!1248) (_values!3756 thiss!1248) (mask!8871 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)) key!828)))))

(declare-fun res!87523 () Bool)

(declare-fun e!121786 () Bool)

(assert (=> start!18726 (=> (not res!87523) (not e!121786))))

(declare-fun valid!1052 (LongMapFixedSize!2548) Bool)

(assert (=> start!18726 (= res!87523 (valid!1052 thiss!1248))))

(assert (=> start!18726 e!121786))

(declare-fun e!121784 () Bool)

(assert (=> start!18726 e!121784))

(assert (=> start!18726 true))

(declare-fun b!185047 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7857 (_ BitVec 32)) Bool)

(assert (=> b!185047 (= e!121782 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5708 thiss!1248) (mask!8871 thiss!1248))))))

(declare-fun mapNonEmpty!7443 () Bool)

(declare-fun mapRes!7443 () Bool)

(declare-fun tp!16454 () Bool)

(declare-fun e!121783 () Bool)

(assert (=> mapNonEmpty!7443 (= mapRes!7443 (and tp!16454 e!121783))))

(declare-fun mapKey!7443 () (_ BitVec 32))

(declare-fun mapValue!7443 () ValueCell!1820)

(declare-fun mapRest!7443 () (Array (_ BitVec 32) ValueCell!1820))

(assert (=> mapNonEmpty!7443 (= (arr!3712 (_values!3756 thiss!1248)) (store mapRest!7443 mapKey!7443 mapValue!7443))))

(declare-fun b!185048 () Bool)

(declare-fun res!87527 () Bool)

(assert (=> b!185048 (=> (not res!87527) (not e!121786))))

(assert (=> b!185048 (= res!87527 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185049 () Bool)

(declare-fun e!121781 () Bool)

(declare-fun tp_is_empty!4327 () Bool)

(assert (=> b!185049 (= e!121781 tp_is_empty!4327)))

(declare-fun b!185050 () Bool)

(declare-fun e!121785 () Bool)

(assert (=> b!185050 (= e!121785 (and e!121781 mapRes!7443))))

(declare-fun condMapEmpty!7443 () Bool)

(declare-fun mapDefault!7443 () ValueCell!1820)

