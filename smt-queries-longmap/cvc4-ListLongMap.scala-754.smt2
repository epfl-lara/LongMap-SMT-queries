; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17694 () Bool)

(assert start!17694)

(declare-fun b!176894 () Bool)

(declare-fun b_free!4367 () Bool)

(declare-fun b_next!4367 () Bool)

(assert (=> b!176894 (= b_free!4367 (not b_next!4367))))

(declare-fun tp!15798 () Bool)

(declare-fun b_and!10865 () Bool)

(assert (=> b!176894 (= tp!15798 b_and!10865)))

(declare-fun b!176889 () Bool)

(declare-fun res!83839 () Bool)

(declare-fun e!116672 () Bool)

(assert (=> b!176889 (=> (not res!83839) (not e!116672))))

(declare-datatypes ((V!5165 0))(
  ( (V!5166 (val!2114 Int)) )
))
(declare-datatypes ((ValueCell!1726 0))(
  ( (ValueCellFull!1726 (v!3993 V!5165)) (EmptyCell!1726) )
))
(declare-datatypes ((array!7427 0))(
  ( (array!7428 (arr!3523 (Array (_ BitVec 32) (_ BitVec 64))) (size!3827 (_ BitVec 32))) )
))
(declare-datatypes ((array!7429 0))(
  ( (array!7430 (arr!3524 (Array (_ BitVec 32) ValueCell!1726)) (size!3828 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2360 0))(
  ( (LongMapFixedSize!2361 (defaultEntry!3642 Int) (mask!8569 (_ BitVec 32)) (extraKeys!3379 (_ BitVec 32)) (zeroValue!3483 V!5165) (minValue!3483 V!5165) (_size!1229 (_ BitVec 32)) (_keys!5507 array!7427) (_values!3625 array!7429) (_vacant!1229 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2360)

(assert (=> b!176889 (= res!83839 (and (= (size!3828 (_values!3625 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8569 thiss!1248))) (= (size!3827 (_keys!5507 thiss!1248)) (size!3828 (_values!3625 thiss!1248))) (bvsge (mask!8569 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3379 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3379 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!83840 () Bool)

(assert (=> start!17694 (=> (not res!83840) (not e!116672))))

(declare-fun valid!991 (LongMapFixedSize!2360) Bool)

(assert (=> start!17694 (= res!83840 (valid!991 thiss!1248))))

(assert (=> start!17694 e!116672))

(declare-fun e!116670 () Bool)

(assert (=> start!17694 e!116670))

(assert (=> start!17694 true))

(declare-fun b!176890 () Bool)

(declare-fun res!83838 () Bool)

(assert (=> b!176890 (=> (not res!83838) (not e!116672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176890 (= res!83838 (validMask!0 (mask!8569 thiss!1248)))))

(declare-fun b!176891 () Bool)

(declare-fun res!83837 () Bool)

(assert (=> b!176891 (=> (not res!83837) (not e!116672))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3292 0))(
  ( (tuple2!3293 (_1!1657 (_ BitVec 64)) (_2!1657 V!5165)) )
))
(declare-datatypes ((List!2244 0))(
  ( (Nil!2241) (Cons!2240 (h!2861 tuple2!3292) (t!7072 List!2244)) )
))
(declare-datatypes ((ListLongMap!2219 0))(
  ( (ListLongMap!2220 (toList!1125 List!2244)) )
))
(declare-fun contains!1190 (ListLongMap!2219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!777 (array!7427 array!7429 (_ BitVec 32) (_ BitVec 32) V!5165 V!5165 (_ BitVec 32) Int) ListLongMap!2219)

(assert (=> b!176891 (= res!83837 (contains!1190 (getCurrentListMap!777 (_keys!5507 thiss!1248) (_values!3625 thiss!1248) (mask!8569 thiss!1248) (extraKeys!3379 thiss!1248) (zeroValue!3483 thiss!1248) (minValue!3483 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3642 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7068 () Bool)

(declare-fun mapRes!7068 () Bool)

(declare-fun tp!15797 () Bool)

(declare-fun e!116669 () Bool)

(assert (=> mapNonEmpty!7068 (= mapRes!7068 (and tp!15797 e!116669))))

(declare-fun mapKey!7068 () (_ BitVec 32))

(declare-fun mapRest!7068 () (Array (_ BitVec 32) ValueCell!1726))

(declare-fun mapValue!7068 () ValueCell!1726)

(assert (=> mapNonEmpty!7068 (= (arr!3524 (_values!3625 thiss!1248)) (store mapRest!7068 mapKey!7068 mapValue!7068))))

(declare-fun b!176892 () Bool)

(assert (=> b!176892 (= e!116672 false)))

(declare-fun lt!87480 () Bool)

(declare-datatypes ((List!2245 0))(
  ( (Nil!2242) (Cons!2241 (h!2862 (_ BitVec 64)) (t!7073 List!2245)) )
))
(declare-fun arrayNoDuplicates!0 (array!7427 (_ BitVec 32) List!2245) Bool)

(assert (=> b!176892 (= lt!87480 (arrayNoDuplicates!0 (_keys!5507 thiss!1248) #b00000000000000000000000000000000 Nil!2242))))

(declare-fun mapIsEmpty!7068 () Bool)

(assert (=> mapIsEmpty!7068 mapRes!7068))

(declare-fun b!176893 () Bool)

(declare-fun res!83841 () Bool)

(assert (=> b!176893 (=> (not res!83841) (not e!116672))))

(declare-datatypes ((SeekEntryResult!560 0))(
  ( (MissingZero!560 (index!4408 (_ BitVec 32))) (Found!560 (index!4409 (_ BitVec 32))) (Intermediate!560 (undefined!1372 Bool) (index!4410 (_ BitVec 32)) (x!19406 (_ BitVec 32))) (Undefined!560) (MissingVacant!560 (index!4411 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7427 (_ BitVec 32)) SeekEntryResult!560)

(assert (=> b!176893 (= res!83841 (is-Undefined!560 (seekEntryOrOpen!0 key!828 (_keys!5507 thiss!1248) (mask!8569 thiss!1248))))))

(declare-fun tp_is_empty!4139 () Bool)

(declare-fun e!116671 () Bool)

(declare-fun array_inv!2257 (array!7427) Bool)

(declare-fun array_inv!2258 (array!7429) Bool)

(assert (=> b!176894 (= e!116670 (and tp!15798 tp_is_empty!4139 (array_inv!2257 (_keys!5507 thiss!1248)) (array_inv!2258 (_values!3625 thiss!1248)) e!116671))))

(declare-fun b!176895 () Bool)

(declare-fun res!83843 () Bool)

(assert (=> b!176895 (=> (not res!83843) (not e!116672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7427 (_ BitVec 32)) Bool)

(assert (=> b!176895 (= res!83843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5507 thiss!1248) (mask!8569 thiss!1248)))))

(declare-fun b!176896 () Bool)

(assert (=> b!176896 (= e!116669 tp_is_empty!4139)))

(declare-fun b!176897 () Bool)

(declare-fun e!116668 () Bool)

(assert (=> b!176897 (= e!116671 (and e!116668 mapRes!7068))))

(declare-fun condMapEmpty!7068 () Bool)

(declare-fun mapDefault!7068 () ValueCell!1726)

