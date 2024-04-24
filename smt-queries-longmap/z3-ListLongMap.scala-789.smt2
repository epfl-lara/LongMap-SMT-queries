; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18802 () Bool)

(assert start!18802)

(declare-fun b!185793 () Bool)

(declare-fun b_free!4573 () Bool)

(declare-fun b_next!4573 () Bool)

(assert (=> b!185793 (= b_free!4573 (not b_next!4573))))

(declare-fun tp!16517 () Bool)

(declare-fun b_and!11189 () Bool)

(assert (=> b!185793 (= tp!16517 b_and!11189)))

(declare-fun res!87887 () Bool)

(declare-fun e!122234 () Bool)

(assert (=> start!18802 (=> (not res!87887) (not e!122234))))

(declare-datatypes ((V!5441 0))(
  ( (V!5442 (val!2217 Int)) )
))
(declare-datatypes ((ValueCell!1829 0))(
  ( (ValueCellFull!1829 (v!4129 V!5441)) (EmptyCell!1829) )
))
(declare-datatypes ((array!7885 0))(
  ( (array!7886 (arr!3722 (Array (_ BitVec 32) (_ BitVec 64))) (size!4038 (_ BitVec 32))) )
))
(declare-datatypes ((array!7887 0))(
  ( (array!7888 (arr!3723 (Array (_ BitVec 32) ValueCell!1829)) (size!4039 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2566 0))(
  ( (LongMapFixedSize!2567 (defaultEntry!3785 Int) (mask!8898 (_ BitVec 32)) (extraKeys!3522 (_ BitVec 32)) (zeroValue!3626 V!5441) (minValue!3626 V!5441) (_size!1332 (_ BitVec 32)) (_keys!5726 array!7885) (_values!3768 array!7887) (_vacant!1332 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2566)

(declare-fun valid!1081 (LongMapFixedSize!2566) Bool)

(assert (=> start!18802 (= res!87887 (valid!1081 thiss!1248))))

(assert (=> start!18802 e!122234))

(declare-fun e!122233 () Bool)

(assert (=> start!18802 e!122233))

(assert (=> start!18802 true))

(declare-fun b!185785 () Bool)

(declare-fun res!87890 () Bool)

(declare-fun e!122239 () Bool)

(assert (=> b!185785 (=> (not res!87890) (not e!122239))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3398 0))(
  ( (tuple2!3399 (_1!1710 (_ BitVec 64)) (_2!1710 V!5441)) )
))
(declare-datatypes ((List!2328 0))(
  ( (Nil!2325) (Cons!2324 (h!2957 tuple2!3398) (t!7204 List!2328)) )
))
(declare-datatypes ((ListLongMap!2319 0))(
  ( (ListLongMap!2320 (toList!1175 List!2328)) )
))
(declare-fun contains!1283 (ListLongMap!2319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!827 (array!7885 array!7887 (_ BitVec 32) (_ BitVec 32) V!5441 V!5441 (_ BitVec 32) Int) ListLongMap!2319)

(assert (=> b!185785 (= res!87890 (not (contains!1283 (getCurrentListMap!827 (_keys!5726 thiss!1248) (_values!3768 thiss!1248) (mask!8898 thiss!1248) (extraKeys!3522 thiss!1248) (zeroValue!3626 thiss!1248) (minValue!3626 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3785 thiss!1248)) key!828)))))

(declare-fun b!185786 () Bool)

(declare-fun e!122235 () Bool)

(declare-fun e!122236 () Bool)

(declare-fun mapRes!7479 () Bool)

(assert (=> b!185786 (= e!122235 (and e!122236 mapRes!7479))))

(declare-fun condMapEmpty!7479 () Bool)

(declare-fun mapDefault!7479 () ValueCell!1829)

(assert (=> b!185786 (= condMapEmpty!7479 (= (arr!3723 (_values!3768 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1829)) mapDefault!7479)))))

(declare-fun b!185787 () Bool)

(declare-fun res!87889 () Bool)

(assert (=> b!185787 (=> (not res!87889) (not e!122239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7885 (_ BitVec 32)) Bool)

(assert (=> b!185787 (= res!87889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5726 thiss!1248) (mask!8898 thiss!1248)))))

(declare-fun b!185788 () Bool)

(declare-fun res!87893 () Bool)

(assert (=> b!185788 (=> (not res!87893) (not e!122239))))

(assert (=> b!185788 (= res!87893 (and (= (size!4039 (_values!3768 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8898 thiss!1248))) (= (size!4038 (_keys!5726 thiss!1248)) (size!4039 (_values!3768 thiss!1248))) (bvsge (mask!8898 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3522 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3522 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!185789 () Bool)

(declare-fun res!87892 () Bool)

(assert (=> b!185789 (=> (not res!87892) (not e!122234))))

(assert (=> b!185789 (= res!87892 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185790 () Bool)

(assert (=> b!185790 (= e!122234 e!122239)))

(declare-fun res!87891 () Bool)

(assert (=> b!185790 (=> (not res!87891) (not e!122239))))

(declare-datatypes ((SeekEntryResult!624 0))(
  ( (MissingZero!624 (index!4666 (_ BitVec 32))) (Found!624 (index!4667 (_ BitVec 32))) (Intermediate!624 (undefined!1436 Bool) (index!4668 (_ BitVec 32)) (x!20154 (_ BitVec 32))) (Undefined!624) (MissingVacant!624 (index!4669 (_ BitVec 32))) )
))
(declare-fun lt!91916 () SeekEntryResult!624)

(get-info :version)

(assert (=> b!185790 (= res!87891 (and (not ((_ is Undefined!624) lt!91916)) (not ((_ is MissingVacant!624) lt!91916)) (not ((_ is MissingZero!624) lt!91916)) ((_ is Found!624) lt!91916)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7885 (_ BitVec 32)) SeekEntryResult!624)

(assert (=> b!185790 (= lt!91916 (seekEntryOrOpen!0 key!828 (_keys!5726 thiss!1248) (mask!8898 thiss!1248)))))

(declare-fun b!185791 () Bool)

(declare-fun e!122237 () Bool)

(declare-fun tp_is_empty!4345 () Bool)

(assert (=> b!185791 (= e!122237 tp_is_empty!4345)))

(declare-fun b!185792 () Bool)

(declare-fun res!87888 () Bool)

(assert (=> b!185792 (=> (not res!87888) (not e!122239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185792 (= res!87888 (validMask!0 (mask!8898 thiss!1248)))))

(declare-fun array_inv!2401 (array!7885) Bool)

(declare-fun array_inv!2402 (array!7887) Bool)

(assert (=> b!185793 (= e!122233 (and tp!16517 tp_is_empty!4345 (array_inv!2401 (_keys!5726 thiss!1248)) (array_inv!2402 (_values!3768 thiss!1248)) e!122235))))

(declare-fun b!185794 () Bool)

(assert (=> b!185794 (= e!122236 tp_is_empty!4345)))

(declare-fun mapIsEmpty!7479 () Bool)

(assert (=> mapIsEmpty!7479 mapRes!7479))

(declare-fun mapNonEmpty!7479 () Bool)

(declare-fun tp!16518 () Bool)

(assert (=> mapNonEmpty!7479 (= mapRes!7479 (and tp!16518 e!122237))))

(declare-fun mapKey!7479 () (_ BitVec 32))

(declare-fun mapRest!7479 () (Array (_ BitVec 32) ValueCell!1829))

(declare-fun mapValue!7479 () ValueCell!1829)

(assert (=> mapNonEmpty!7479 (= (arr!3723 (_values!3768 thiss!1248)) (store mapRest!7479 mapKey!7479 mapValue!7479))))

(declare-fun b!185795 () Bool)

(assert (=> b!185795 (= e!122239 false)))

(declare-fun lt!91915 () Bool)

(declare-datatypes ((List!2329 0))(
  ( (Nil!2326) (Cons!2325 (h!2958 (_ BitVec 64)) (t!7205 List!2329)) )
))
(declare-fun arrayNoDuplicates!0 (array!7885 (_ BitVec 32) List!2329) Bool)

(assert (=> b!185795 (= lt!91915 (arrayNoDuplicates!0 (_keys!5726 thiss!1248) #b00000000000000000000000000000000 Nil!2326))))

(assert (= (and start!18802 res!87887) b!185789))

(assert (= (and b!185789 res!87892) b!185790))

(assert (= (and b!185790 res!87891) b!185785))

(assert (= (and b!185785 res!87890) b!185792))

(assert (= (and b!185792 res!87888) b!185788))

(assert (= (and b!185788 res!87893) b!185787))

(assert (= (and b!185787 res!87889) b!185795))

(assert (= (and b!185786 condMapEmpty!7479) mapIsEmpty!7479))

(assert (= (and b!185786 (not condMapEmpty!7479)) mapNonEmpty!7479))

(assert (= (and mapNonEmpty!7479 ((_ is ValueCellFull!1829) mapValue!7479)) b!185791))

(assert (= (and b!185786 ((_ is ValueCellFull!1829) mapDefault!7479)) b!185794))

(assert (= b!185793 b!185786))

(assert (= start!18802 b!185793))

(declare-fun m!213047 () Bool)

(assert (=> b!185790 m!213047))

(declare-fun m!213049 () Bool)

(assert (=> b!185785 m!213049))

(assert (=> b!185785 m!213049))

(declare-fun m!213051 () Bool)

(assert (=> b!185785 m!213051))

(declare-fun m!213053 () Bool)

(assert (=> b!185795 m!213053))

(declare-fun m!213055 () Bool)

(assert (=> b!185792 m!213055))

(declare-fun m!213057 () Bool)

(assert (=> mapNonEmpty!7479 m!213057))

(declare-fun m!213059 () Bool)

(assert (=> b!185787 m!213059))

(declare-fun m!213061 () Bool)

(assert (=> b!185793 m!213061))

(declare-fun m!213063 () Bool)

(assert (=> b!185793 m!213063))

(declare-fun m!213065 () Bool)

(assert (=> start!18802 m!213065))

(check-sat (not start!18802) b_and!11189 (not b!185785) tp_is_empty!4345 (not b_next!4573) (not b!185792) (not b!185787) (not b!185795) (not b!185790) (not b!185793) (not mapNonEmpty!7479))
(check-sat b_and!11189 (not b_next!4573))
