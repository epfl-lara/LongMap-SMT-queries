; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16096 () Bool)

(assert start!16096)

(declare-fun b!159975 () Bool)

(declare-fun b_free!3553 () Bool)

(declare-fun b_next!3553 () Bool)

(assert (=> b!159975 (= b_free!3553 (not b_next!3553))))

(declare-fun tp!13229 () Bool)

(declare-fun b_and!9981 () Bool)

(assert (=> b!159975 (= tp!13229 b_and!9981)))

(declare-fun b!159971 () Bool)

(declare-fun res!75659 () Bool)

(declare-fun e!104651 () Bool)

(assert (=> b!159971 (=> (not res!75659) (not e!104651))))

(declare-datatypes ((V!4121 0))(
  ( (V!4122 (val!1722 Int)) )
))
(declare-datatypes ((ValueCell!1334 0))(
  ( (ValueCellFull!1334 (v!3588 V!4121)) (EmptyCell!1334) )
))
(declare-datatypes ((array!5775 0))(
  ( (array!5776 (arr!2732 (Array (_ BitVec 32) (_ BitVec 64))) (size!3016 (_ BitVec 32))) )
))
(declare-datatypes ((array!5777 0))(
  ( (array!5778 (arr!2733 (Array (_ BitVec 32) ValueCell!1334)) (size!3017 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1576 0))(
  ( (LongMapFixedSize!1577 (defaultEntry!3230 Int) (mask!7790 (_ BitVec 32)) (extraKeys!2971 (_ BitVec 32)) (zeroValue!3073 V!4121) (minValue!3073 V!4121) (_size!837 (_ BitVec 32)) (_keys!5031 array!5775) (_values!3213 array!5777) (_vacant!837 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1576)

(assert (=> b!159971 (= res!75659 (and (= (size!3017 (_values!3213 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7790 thiss!1248))) (= (size!3016 (_keys!5031 thiss!1248)) (size!3017 (_values!3213 thiss!1248))) (bvsge (mask!7790 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2971 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2971 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!75665 () Bool)

(assert (=> start!16096 (=> (not res!75665) (not e!104651))))

(declare-fun valid!751 (LongMapFixedSize!1576) Bool)

(assert (=> start!16096 (= res!75665 (valid!751 thiss!1248))))

(assert (=> start!16096 e!104651))

(declare-fun e!104647 () Bool)

(assert (=> start!16096 e!104647))

(assert (=> start!16096 true))

(declare-fun b!159972 () Bool)

(declare-fun res!75662 () Bool)

(assert (=> b!159972 (=> (not res!75662) (not e!104651))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!316 0))(
  ( (MissingZero!316 (index!3432 (_ BitVec 32))) (Found!316 (index!3433 (_ BitVec 32))) (Intermediate!316 (undefined!1128 Bool) (index!3434 (_ BitVec 32)) (x!17652 (_ BitVec 32))) (Undefined!316) (MissingVacant!316 (index!3435 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5775 (_ BitVec 32)) SeekEntryResult!316)

(assert (=> b!159972 (= res!75662 ((_ is Undefined!316) (seekEntryOrOpen!0 key!828 (_keys!5031 thiss!1248) (mask!7790 thiss!1248))))))

(declare-fun mapIsEmpty!5720 () Bool)

(declare-fun mapRes!5720 () Bool)

(assert (=> mapIsEmpty!5720 mapRes!5720))

(declare-fun b!159973 () Bool)

(declare-fun res!75663 () Bool)

(assert (=> b!159973 (=> (not res!75663) (not e!104651))))

(declare-datatypes ((tuple2!2842 0))(
  ( (tuple2!2843 (_1!1432 (_ BitVec 64)) (_2!1432 V!4121)) )
))
(declare-datatypes ((List!1909 0))(
  ( (Nil!1906) (Cons!1905 (h!2518 tuple2!2842) (t!6703 List!1909)) )
))
(declare-datatypes ((ListLongMap!1841 0))(
  ( (ListLongMap!1842 (toList!936 List!1909)) )
))
(declare-fun contains!982 (ListLongMap!1841 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!603 (array!5775 array!5777 (_ BitVec 32) (_ BitVec 32) V!4121 V!4121 (_ BitVec 32) Int) ListLongMap!1841)

(assert (=> b!159973 (= res!75663 (contains!982 (getCurrentListMap!603 (_keys!5031 thiss!1248) (_values!3213 thiss!1248) (mask!7790 thiss!1248) (extraKeys!2971 thiss!1248) (zeroValue!3073 thiss!1248) (minValue!3073 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3230 thiss!1248)) key!828))))

(declare-fun b!159974 () Bool)

(declare-fun e!104650 () Bool)

(declare-fun tp_is_empty!3355 () Bool)

(assert (=> b!159974 (= e!104650 tp_is_empty!3355)))

(declare-fun e!104648 () Bool)

(declare-fun array_inv!1745 (array!5775) Bool)

(declare-fun array_inv!1746 (array!5777) Bool)

(assert (=> b!159975 (= e!104647 (and tp!13229 tp_is_empty!3355 (array_inv!1745 (_keys!5031 thiss!1248)) (array_inv!1746 (_values!3213 thiss!1248)) e!104648))))

(declare-fun b!159976 () Bool)

(assert (=> b!159976 (= e!104648 (and e!104650 mapRes!5720))))

(declare-fun condMapEmpty!5720 () Bool)

(declare-fun mapDefault!5720 () ValueCell!1334)

(assert (=> b!159976 (= condMapEmpty!5720 (= (arr!2733 (_values!3213 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1334)) mapDefault!5720)))))

(declare-fun b!159977 () Bool)

(declare-fun res!75661 () Bool)

(assert (=> b!159977 (=> (not res!75661) (not e!104651))))

(assert (=> b!159977 (= res!75661 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159978 () Bool)

(assert (=> b!159978 (= e!104651 false)))

(declare-fun lt!82101 () Bool)

(declare-datatypes ((List!1910 0))(
  ( (Nil!1907) (Cons!1906 (h!2519 (_ BitVec 64)) (t!6704 List!1910)) )
))
(declare-fun arrayNoDuplicates!0 (array!5775 (_ BitVec 32) List!1910) Bool)

(assert (=> b!159978 (= lt!82101 (arrayNoDuplicates!0 (_keys!5031 thiss!1248) #b00000000000000000000000000000000 Nil!1907))))

(declare-fun mapNonEmpty!5720 () Bool)

(declare-fun tp!13228 () Bool)

(declare-fun e!104649 () Bool)

(assert (=> mapNonEmpty!5720 (= mapRes!5720 (and tp!13228 e!104649))))

(declare-fun mapValue!5720 () ValueCell!1334)

(declare-fun mapRest!5720 () (Array (_ BitVec 32) ValueCell!1334))

(declare-fun mapKey!5720 () (_ BitVec 32))

(assert (=> mapNonEmpty!5720 (= (arr!2733 (_values!3213 thiss!1248)) (store mapRest!5720 mapKey!5720 mapValue!5720))))

(declare-fun b!159979 () Bool)

(declare-fun res!75660 () Bool)

(assert (=> b!159979 (=> (not res!75660) (not e!104651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5775 (_ BitVec 32)) Bool)

(assert (=> b!159979 (= res!75660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5031 thiss!1248) (mask!7790 thiss!1248)))))

(declare-fun b!159980 () Bool)

(assert (=> b!159980 (= e!104649 tp_is_empty!3355)))

(declare-fun b!159981 () Bool)

(declare-fun res!75664 () Bool)

(assert (=> b!159981 (=> (not res!75664) (not e!104651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159981 (= res!75664 (validMask!0 (mask!7790 thiss!1248)))))

(assert (= (and start!16096 res!75665) b!159977))

(assert (= (and b!159977 res!75661) b!159972))

(assert (= (and b!159972 res!75662) b!159973))

(assert (= (and b!159973 res!75663) b!159981))

(assert (= (and b!159981 res!75664) b!159971))

(assert (= (and b!159971 res!75659) b!159979))

(assert (= (and b!159979 res!75660) b!159978))

(assert (= (and b!159976 condMapEmpty!5720) mapIsEmpty!5720))

(assert (= (and b!159976 (not condMapEmpty!5720)) mapNonEmpty!5720))

(assert (= (and mapNonEmpty!5720 ((_ is ValueCellFull!1334) mapValue!5720)) b!159980))

(assert (= (and b!159976 ((_ is ValueCellFull!1334) mapDefault!5720)) b!159974))

(assert (= b!159975 b!159976))

(assert (= start!16096 b!159975))

(declare-fun m!192179 () Bool)

(assert (=> b!159979 m!192179))

(declare-fun m!192181 () Bool)

(assert (=> start!16096 m!192181))

(declare-fun m!192183 () Bool)

(assert (=> b!159978 m!192183))

(declare-fun m!192185 () Bool)

(assert (=> mapNonEmpty!5720 m!192185))

(declare-fun m!192187 () Bool)

(assert (=> b!159973 m!192187))

(assert (=> b!159973 m!192187))

(declare-fun m!192189 () Bool)

(assert (=> b!159973 m!192189))

(declare-fun m!192191 () Bool)

(assert (=> b!159975 m!192191))

(declare-fun m!192193 () Bool)

(assert (=> b!159975 m!192193))

(declare-fun m!192195 () Bool)

(assert (=> b!159981 m!192195))

(declare-fun m!192197 () Bool)

(assert (=> b!159972 m!192197))

(check-sat (not b!159979) (not b!159973) (not start!16096) (not b!159975) (not mapNonEmpty!5720) (not b_next!3553) b_and!9981 tp_is_empty!3355 (not b!159972) (not b!159981) (not b!159978))
(check-sat b_and!9981 (not b_next!3553))
