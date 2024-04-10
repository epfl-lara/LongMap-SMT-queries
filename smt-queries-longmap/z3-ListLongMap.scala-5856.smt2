; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75668 () Bool)

(assert start!75668)

(declare-fun b!889633 () Bool)

(declare-fun b_free!15639 () Bool)

(declare-fun b_next!15639 () Bool)

(assert (=> b!889633 (= b_free!15639 (not b_next!15639))))

(declare-fun tp!54886 () Bool)

(declare-fun b_and!25879 () Bool)

(assert (=> b!889633 (= tp!54886 b_and!25879)))

(declare-fun e!495938 () Bool)

(declare-fun e!495941 () Bool)

(declare-datatypes ((array!51914 0))(
  ( (array!51915 (arr!24963 (Array (_ BitVec 32) (_ BitVec 64))) (size!25407 (_ BitVec 32))) )
))
(declare-datatypes ((V!28921 0))(
  ( (V!28922 (val!9034 Int)) )
))
(declare-datatypes ((ValueCell!8502 0))(
  ( (ValueCellFull!8502 (v!11512 V!28921)) (EmptyCell!8502) )
))
(declare-datatypes ((array!51916 0))(
  ( (array!51917 (arr!24964 (Array (_ BitVec 32) ValueCell!8502)) (size!25408 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4020 0))(
  ( (LongMapFixedSize!4021 (defaultEntry!5207 Int) (mask!25660 (_ BitVec 32)) (extraKeys!4901 (_ BitVec 32)) (zeroValue!5005 V!28921) (minValue!5005 V!28921) (_size!2065 (_ BitVec 32)) (_keys!9890 array!51914) (_values!5192 array!51916) (_vacant!2065 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4020)

(declare-fun tp_is_empty!17967 () Bool)

(declare-fun array_inv!19636 (array!51914) Bool)

(declare-fun array_inv!19637 (array!51916) Bool)

(assert (=> b!889633 (= e!495938 (and tp!54886 tp_is_empty!17967 (array_inv!19636 (_keys!9890 thiss!1181)) (array_inv!19637 (_values!5192 thiss!1181)) e!495941))))

(declare-fun mapNonEmpty!28505 () Bool)

(declare-fun mapRes!28505 () Bool)

(declare-fun tp!54885 () Bool)

(declare-fun e!495942 () Bool)

(assert (=> mapNonEmpty!28505 (= mapRes!28505 (and tp!54885 e!495942))))

(declare-fun mapRest!28505 () (Array (_ BitVec 32) ValueCell!8502))

(declare-fun mapKey!28505 () (_ BitVec 32))

(declare-fun mapValue!28505 () ValueCell!8502)

(assert (=> mapNonEmpty!28505 (= (arr!24964 (_values!5192 thiss!1181)) (store mapRest!28505 mapKey!28505 mapValue!28505))))

(declare-fun b!889634 () Bool)

(declare-fun res!602893 () Bool)

(declare-fun e!495937 () Bool)

(assert (=> b!889634 (=> (not res!602893) (not e!495937))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889634 (= res!602893 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889635 () Bool)

(declare-fun res!602891 () Bool)

(declare-fun e!495936 () Bool)

(assert (=> b!889635 (=> (not res!602891) (not e!495936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51914 (_ BitVec 32)) Bool)

(assert (=> b!889635 (= res!602891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9890 thiss!1181) (mask!25660 thiss!1181)))))

(declare-fun b!889636 () Bool)

(assert (=> b!889636 (= e!495937 e!495936)))

(declare-fun res!602892 () Bool)

(assert (=> b!889636 (=> (not res!602892) (not e!495936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889636 (= res!602892 (validMask!0 (mask!25660 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8777 0))(
  ( (MissingZero!8777 (index!37479 (_ BitVec 32))) (Found!8777 (index!37480 (_ BitVec 32))) (Intermediate!8777 (undefined!9589 Bool) (index!37481 (_ BitVec 32)) (x!75537 (_ BitVec 32))) (Undefined!8777) (MissingVacant!8777 (index!37482 (_ BitVec 32))) )
))
(declare-fun lt!402075 () SeekEntryResult!8777)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51914 (_ BitVec 32)) SeekEntryResult!8777)

(assert (=> b!889636 (= lt!402075 (seekEntry!0 key!785 (_keys!9890 thiss!1181) (mask!25660 thiss!1181)))))

(declare-fun b!889637 () Bool)

(assert (=> b!889637 (= e!495936 false)))

(declare-fun lt!402076 () Bool)

(declare-datatypes ((List!17706 0))(
  ( (Nil!17703) (Cons!17702 (h!18833 (_ BitVec 64)) (t!25005 List!17706)) )
))
(declare-fun arrayNoDuplicates!0 (array!51914 (_ BitVec 32) List!17706) Bool)

(assert (=> b!889637 (= lt!402076 (arrayNoDuplicates!0 (_keys!9890 thiss!1181) #b00000000000000000000000000000000 Nil!17703))))

(declare-fun res!602894 () Bool)

(assert (=> start!75668 (=> (not res!602894) (not e!495937))))

(declare-fun valid!1562 (LongMapFixedSize!4020) Bool)

(assert (=> start!75668 (= res!602894 (valid!1562 thiss!1181))))

(assert (=> start!75668 e!495937))

(assert (=> start!75668 e!495938))

(assert (=> start!75668 true))

(declare-fun b!889638 () Bool)

(assert (=> b!889638 (= e!495942 tp_is_empty!17967)))

(declare-fun mapIsEmpty!28505 () Bool)

(assert (=> mapIsEmpty!28505 mapRes!28505))

(declare-fun b!889639 () Bool)

(declare-fun e!495939 () Bool)

(assert (=> b!889639 (= e!495941 (and e!495939 mapRes!28505))))

(declare-fun condMapEmpty!28505 () Bool)

(declare-fun mapDefault!28505 () ValueCell!8502)

(assert (=> b!889639 (= condMapEmpty!28505 (= (arr!24964 (_values!5192 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8502)) mapDefault!28505)))))

(declare-fun b!889640 () Bool)

(assert (=> b!889640 (= e!495939 tp_is_empty!17967)))

(declare-fun b!889641 () Bool)

(declare-fun res!602890 () Bool)

(assert (=> b!889641 (=> (not res!602890) (not e!495936))))

(assert (=> b!889641 (= res!602890 (and (= (size!25408 (_values!5192 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25660 thiss!1181))) (= (size!25407 (_keys!9890 thiss!1181)) (size!25408 (_values!5192 thiss!1181))) (bvsge (mask!25660 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4901 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4901 thiss!1181) #b00000000000000000000000000000011)))))

(assert (= (and start!75668 res!602894) b!889634))

(assert (= (and b!889634 res!602893) b!889636))

(assert (= (and b!889636 res!602892) b!889641))

(assert (= (and b!889641 res!602890) b!889635))

(assert (= (and b!889635 res!602891) b!889637))

(assert (= (and b!889639 condMapEmpty!28505) mapIsEmpty!28505))

(assert (= (and b!889639 (not condMapEmpty!28505)) mapNonEmpty!28505))

(get-info :version)

(assert (= (and mapNonEmpty!28505 ((_ is ValueCellFull!8502) mapValue!28505)) b!889638))

(assert (= (and b!889639 ((_ is ValueCellFull!8502) mapDefault!28505)) b!889640))

(assert (= b!889633 b!889639))

(assert (= start!75668 b!889633))

(declare-fun m!828469 () Bool)

(assert (=> b!889635 m!828469))

(declare-fun m!828471 () Bool)

(assert (=> b!889636 m!828471))

(declare-fun m!828473 () Bool)

(assert (=> b!889636 m!828473))

(declare-fun m!828475 () Bool)

(assert (=> mapNonEmpty!28505 m!828475))

(declare-fun m!828477 () Bool)

(assert (=> start!75668 m!828477))

(declare-fun m!828479 () Bool)

(assert (=> b!889637 m!828479))

(declare-fun m!828481 () Bool)

(assert (=> b!889633 m!828481))

(declare-fun m!828483 () Bool)

(assert (=> b!889633 m!828483))

(check-sat (not b!889635) (not mapNonEmpty!28505) b_and!25879 tp_is_empty!17967 (not b_next!15639) (not b!889637) (not b!889633) (not start!75668) (not b!889636))
(check-sat b_and!25879 (not b_next!15639))
