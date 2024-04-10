; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21630 () Bool)

(assert start!21630)

(declare-fun b!216865 () Bool)

(declare-fun b_free!5779 () Bool)

(declare-fun b_next!5779 () Bool)

(assert (=> b!216865 (= b_free!5779 (not b_next!5779))))

(declare-fun tp!20471 () Bool)

(declare-fun b_and!12669 () Bool)

(assert (=> b!216865 (= tp!20471 b_and!12669)))

(declare-datatypes ((V!7169 0))(
  ( (V!7170 (val!2865 Int)) )
))
(declare-datatypes ((ValueCell!2477 0))(
  ( (ValueCellFull!2477 (v!4883 V!7169)) (EmptyCell!2477) )
))
(declare-datatypes ((array!10521 0))(
  ( (array!10522 (arr!4982 (Array (_ BitVec 32) ValueCell!2477)) (size!5314 (_ BitVec 32))) )
))
(declare-datatypes ((array!10523 0))(
  ( (array!10524 (arr!4983 (Array (_ BitVec 32) (_ BitVec 64))) (size!5315 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2854 0))(
  ( (LongMapFixedSize!2855 (defaultEntry!4077 Int) (mask!9822 (_ BitVec 32)) (extraKeys!3814 (_ BitVec 32)) (zeroValue!3918 V!7169) (minValue!3918 V!7169) (_size!1476 (_ BitVec 32)) (_keys!6126 array!10523) (_values!4060 array!10521) (_vacant!1476 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2854)

(declare-fun e!141088 () Bool)

(declare-fun tp_is_empty!5641 () Bool)

(declare-fun e!141092 () Bool)

(declare-fun array_inv!3293 (array!10523) Bool)

(declare-fun array_inv!3294 (array!10521) Bool)

(assert (=> b!216865 (= e!141088 (and tp!20471 tp_is_empty!5641 (array_inv!3293 (_keys!6126 thiss!1504)) (array_inv!3294 (_values!4060 thiss!1504)) e!141092))))

(declare-fun b!216866 () Bool)

(declare-fun e!141089 () Bool)

(declare-fun e!141090 () Bool)

(assert (=> b!216866 (= e!141089 e!141090)))

(declare-fun res!106105 () Bool)

(assert (=> b!216866 (=> (not res!106105) (not e!141090))))

(declare-datatypes ((SeekEntryResult!753 0))(
  ( (MissingZero!753 (index!5182 (_ BitVec 32))) (Found!753 (index!5183 (_ BitVec 32))) (Intermediate!753 (undefined!1565 Bool) (index!5184 (_ BitVec 32)) (x!22681 (_ BitVec 32))) (Undefined!753) (MissingVacant!753 (index!5185 (_ BitVec 32))) )
))
(declare-fun lt!111242 () SeekEntryResult!753)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216866 (= res!106105 (or (= lt!111242 (MissingZero!753 index!297)) (= lt!111242 (MissingVacant!753 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10523 (_ BitVec 32)) SeekEntryResult!753)

(assert (=> b!216866 (= lt!111242 (seekEntryOrOpen!0 key!932 (_keys!6126 thiss!1504) (mask!9822 thiss!1504)))))

(declare-fun b!216867 () Bool)

(assert (=> b!216867 (= e!141090 false)))

(declare-fun lt!111243 () Bool)

(declare-datatypes ((List!3167 0))(
  ( (Nil!3164) (Cons!3163 (h!3810 (_ BitVec 64)) (t!8122 List!3167)) )
))
(declare-fun arrayNoDuplicates!0 (array!10523 (_ BitVec 32) List!3167) Bool)

(assert (=> b!216867 (= lt!111243 (arrayNoDuplicates!0 (_keys!6126 thiss!1504) #b00000000000000000000000000000000 Nil!3164))))

(declare-fun res!106110 () Bool)

(assert (=> start!21630 (=> (not res!106110) (not e!141089))))

(declare-fun valid!1159 (LongMapFixedSize!2854) Bool)

(assert (=> start!21630 (= res!106110 (valid!1159 thiss!1504))))

(assert (=> start!21630 e!141089))

(assert (=> start!21630 e!141088))

(assert (=> start!21630 true))

(declare-fun mapNonEmpty!9624 () Bool)

(declare-fun mapRes!9624 () Bool)

(declare-fun tp!20472 () Bool)

(declare-fun e!141093 () Bool)

(assert (=> mapNonEmpty!9624 (= mapRes!9624 (and tp!20472 e!141093))))

(declare-fun mapValue!9624 () ValueCell!2477)

(declare-fun mapRest!9624 () (Array (_ BitVec 32) ValueCell!2477))

(declare-fun mapKey!9624 () (_ BitVec 32))

(assert (=> mapNonEmpty!9624 (= (arr!4982 (_values!4060 thiss!1504)) (store mapRest!9624 mapKey!9624 mapValue!9624))))

(declare-fun b!216868 () Bool)

(declare-fun res!106106 () Bool)

(assert (=> b!216868 (=> (not res!106106) (not e!141090))))

(assert (=> b!216868 (= res!106106 (and (= (size!5314 (_values!4060 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9822 thiss!1504))) (= (size!5315 (_keys!6126 thiss!1504)) (size!5314 (_values!4060 thiss!1504))) (bvsge (mask!9822 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3814 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3814 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216869 () Bool)

(assert (=> b!216869 (= e!141093 tp_is_empty!5641)))

(declare-fun b!216870 () Bool)

(declare-fun res!106104 () Bool)

(assert (=> b!216870 (=> (not res!106104) (not e!141090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10523 (_ BitVec 32)) Bool)

(assert (=> b!216870 (= res!106104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6126 thiss!1504) (mask!9822 thiss!1504)))))

(declare-fun mapIsEmpty!9624 () Bool)

(assert (=> mapIsEmpty!9624 mapRes!9624))

(declare-fun b!216871 () Bool)

(declare-fun res!106108 () Bool)

(assert (=> b!216871 (=> (not res!106108) (not e!141090))))

(declare-datatypes ((tuple2!4264 0))(
  ( (tuple2!4265 (_1!2143 (_ BitVec 64)) (_2!2143 V!7169)) )
))
(declare-datatypes ((List!3168 0))(
  ( (Nil!3165) (Cons!3164 (h!3811 tuple2!4264) (t!8123 List!3168)) )
))
(declare-datatypes ((ListLongMap!3177 0))(
  ( (ListLongMap!3178 (toList!1604 List!3168)) )
))
(declare-fun contains!1445 (ListLongMap!3177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1132 (array!10523 array!10521 (_ BitVec 32) (_ BitVec 32) V!7169 V!7169 (_ BitVec 32) Int) ListLongMap!3177)

(assert (=> b!216871 (= res!106108 (contains!1445 (getCurrentListMap!1132 (_keys!6126 thiss!1504) (_values!4060 thiss!1504) (mask!9822 thiss!1504) (extraKeys!3814 thiss!1504) (zeroValue!3918 thiss!1504) (minValue!3918 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4077 thiss!1504)) key!932))))

(declare-fun b!216872 () Bool)

(declare-fun res!106107 () Bool)

(assert (=> b!216872 (=> (not res!106107) (not e!141089))))

(assert (=> b!216872 (= res!106107 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216873 () Bool)

(declare-fun e!141091 () Bool)

(assert (=> b!216873 (= e!141091 tp_is_empty!5641)))

(declare-fun b!216874 () Bool)

(declare-fun res!106109 () Bool)

(assert (=> b!216874 (=> (not res!106109) (not e!141090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216874 (= res!106109 (validMask!0 (mask!9822 thiss!1504)))))

(declare-fun b!216875 () Bool)

(assert (=> b!216875 (= e!141092 (and e!141091 mapRes!9624))))

(declare-fun condMapEmpty!9624 () Bool)

(declare-fun mapDefault!9624 () ValueCell!2477)

