; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75672 () Bool)

(assert start!75672)

(declare-fun b!889694 () Bool)

(declare-fun b_free!15661 () Bool)

(declare-fun b_next!15661 () Bool)

(assert (=> b!889694 (= b_free!15661 (not b_next!15661))))

(declare-fun tp!54953 () Bool)

(declare-fun b_and!25875 () Bool)

(assert (=> b!889694 (= tp!54953 b_and!25875)))

(declare-fun res!602948 () Bool)

(declare-fun e!496020 () Bool)

(assert (=> start!75672 (=> (not res!602948) (not e!496020))))

(declare-datatypes ((array!51941 0))(
  ( (array!51942 (arr!24977 (Array (_ BitVec 32) (_ BitVec 64))) (size!25423 (_ BitVec 32))) )
))
(declare-datatypes ((V!28951 0))(
  ( (V!28952 (val!9045 Int)) )
))
(declare-datatypes ((ValueCell!8513 0))(
  ( (ValueCellFull!8513 (v!11517 V!28951)) (EmptyCell!8513) )
))
(declare-datatypes ((array!51943 0))(
  ( (array!51944 (arr!24978 (Array (_ BitVec 32) ValueCell!8513)) (size!25424 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4042 0))(
  ( (LongMapFixedSize!4043 (defaultEntry!5218 Int) (mask!25672 (_ BitVec 32)) (extraKeys!4912 (_ BitVec 32)) (zeroValue!5016 V!28951) (minValue!5016 V!28951) (_size!2076 (_ BitVec 32)) (_keys!9896 array!51941) (_values!5203 array!51943) (_vacant!2076 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4042)

(declare-fun valid!1582 (LongMapFixedSize!4042) Bool)

(assert (=> start!75672 (= res!602948 (valid!1582 thiss!1181))))

(assert (=> start!75672 e!496020))

(declare-fun e!496021 () Bool)

(assert (=> start!75672 e!496021))

(assert (=> start!75672 true))

(declare-fun b!889691 () Bool)

(declare-fun res!602946 () Bool)

(assert (=> b!889691 (=> (not res!602946) (not e!496020))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889691 (= res!602946 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889692 () Bool)

(declare-fun res!602947 () Bool)

(declare-fun e!496019 () Bool)

(assert (=> b!889692 (=> (not res!602947) (not e!496019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51941 (_ BitVec 32)) Bool)

(assert (=> b!889692 (= res!602947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9896 thiss!1181) (mask!25672 thiss!1181)))))

(declare-fun mapIsEmpty!28538 () Bool)

(declare-fun mapRes!28538 () Bool)

(assert (=> mapIsEmpty!28538 mapRes!28538))

(declare-fun b!889693 () Bool)

(declare-fun res!602945 () Bool)

(assert (=> b!889693 (=> (not res!602945) (not e!496019))))

(assert (=> b!889693 (= res!602945 (and (= (size!25424 (_values!5203 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25672 thiss!1181))) (= (size!25423 (_keys!9896 thiss!1181)) (size!25424 (_values!5203 thiss!1181))) (bvsge (mask!25672 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4912 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4912 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun e!496025 () Bool)

(declare-fun tp_is_empty!17989 () Bool)

(declare-fun array_inv!19694 (array!51941) Bool)

(declare-fun array_inv!19695 (array!51943) Bool)

(assert (=> b!889694 (= e!496021 (and tp!54953 tp_is_empty!17989 (array_inv!19694 (_keys!9896 thiss!1181)) (array_inv!19695 (_values!5203 thiss!1181)) e!496025))))

(declare-fun mapNonEmpty!28538 () Bool)

(declare-fun tp!54952 () Bool)

(declare-fun e!496022 () Bool)

(assert (=> mapNonEmpty!28538 (= mapRes!28538 (and tp!54952 e!496022))))

(declare-fun mapKey!28538 () (_ BitVec 32))

(declare-fun mapRest!28538 () (Array (_ BitVec 32) ValueCell!8513))

(declare-fun mapValue!28538 () ValueCell!8513)

(assert (=> mapNonEmpty!28538 (= (arr!24978 (_values!5203 thiss!1181)) (store mapRest!28538 mapKey!28538 mapValue!28538))))

(declare-fun b!889695 () Bool)

(assert (=> b!889695 (= e!496020 e!496019)))

(declare-fun res!602949 () Bool)

(assert (=> b!889695 (=> (not res!602949) (not e!496019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889695 (= res!602949 (validMask!0 (mask!25672 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8787 0))(
  ( (MissingZero!8787 (index!37519 (_ BitVec 32))) (Found!8787 (index!37520 (_ BitVec 32))) (Intermediate!8787 (undefined!9599 Bool) (index!37521 (_ BitVec 32)) (x!75574 (_ BitVec 32))) (Undefined!8787) (MissingVacant!8787 (index!37522 (_ BitVec 32))) )
))
(declare-fun lt!401906 () SeekEntryResult!8787)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51941 (_ BitVec 32)) SeekEntryResult!8787)

(assert (=> b!889695 (= lt!401906 (seekEntry!0 key!785 (_keys!9896 thiss!1181) (mask!25672 thiss!1181)))))

(declare-fun b!889696 () Bool)

(assert (=> b!889696 (= e!496022 tp_is_empty!17989)))

(declare-fun b!889697 () Bool)

(assert (=> b!889697 (= e!496019 false)))

(declare-fun lt!401905 () Bool)

(declare-datatypes ((List!17725 0))(
  ( (Nil!17722) (Cons!17721 (h!18852 (_ BitVec 64)) (t!25015 List!17725)) )
))
(declare-fun arrayNoDuplicates!0 (array!51941 (_ BitVec 32) List!17725) Bool)

(assert (=> b!889697 (= lt!401905 (arrayNoDuplicates!0 (_keys!9896 thiss!1181) #b00000000000000000000000000000000 Nil!17722))))

(declare-fun b!889698 () Bool)

(declare-fun e!496024 () Bool)

(assert (=> b!889698 (= e!496024 tp_is_empty!17989)))

(declare-fun b!889699 () Bool)

(assert (=> b!889699 (= e!496025 (and e!496024 mapRes!28538))))

(declare-fun condMapEmpty!28538 () Bool)

(declare-fun mapDefault!28538 () ValueCell!8513)

(assert (=> b!889699 (= condMapEmpty!28538 (= (arr!24978 (_values!5203 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8513)) mapDefault!28538)))))

(assert (= (and start!75672 res!602948) b!889691))

(assert (= (and b!889691 res!602946) b!889695))

(assert (= (and b!889695 res!602949) b!889693))

(assert (= (and b!889693 res!602945) b!889692))

(assert (= (and b!889692 res!602947) b!889697))

(assert (= (and b!889699 condMapEmpty!28538) mapIsEmpty!28538))

(assert (= (and b!889699 (not condMapEmpty!28538)) mapNonEmpty!28538))

(get-info :version)

(assert (= (and mapNonEmpty!28538 ((_ is ValueCellFull!8513) mapValue!28538)) b!889696))

(assert (= (and b!889699 ((_ is ValueCellFull!8513) mapDefault!28538)) b!889698))

(assert (= b!889694 b!889699))

(assert (= start!75672 b!889694))

(declare-fun m!827887 () Bool)

(assert (=> b!889697 m!827887))

(declare-fun m!827889 () Bool)

(assert (=> b!889695 m!827889))

(declare-fun m!827891 () Bool)

(assert (=> b!889695 m!827891))

(declare-fun m!827893 () Bool)

(assert (=> start!75672 m!827893))

(declare-fun m!827895 () Bool)

(assert (=> b!889692 m!827895))

(declare-fun m!827897 () Bool)

(assert (=> b!889694 m!827897))

(declare-fun m!827899 () Bool)

(assert (=> b!889694 m!827899))

(declare-fun m!827901 () Bool)

(assert (=> mapNonEmpty!28538 m!827901))

(check-sat (not b!889695) (not start!75672) (not mapNonEmpty!28538) (not b!889692) tp_is_empty!17989 (not b!889697) (not b!889694) b_and!25875 (not b_next!15661))
(check-sat b_and!25875 (not b_next!15661))
