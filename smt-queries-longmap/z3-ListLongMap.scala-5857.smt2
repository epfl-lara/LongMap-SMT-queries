; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75674 () Bool)

(assert start!75674)

(declare-fun b!889721 () Bool)

(declare-fun b_free!15645 () Bool)

(declare-fun b_next!15645 () Bool)

(assert (=> b!889721 (= b_free!15645 (not b_next!15645))))

(declare-fun tp!54904 () Bool)

(declare-fun b_and!25885 () Bool)

(assert (=> b!889721 (= tp!54904 b_and!25885)))

(declare-fun b!889714 () Bool)

(declare-fun e!495999 () Bool)

(declare-fun tp_is_empty!17973 () Bool)

(assert (=> b!889714 (= e!495999 tp_is_empty!17973)))

(declare-fun b!889715 () Bool)

(declare-fun res!602935 () Bool)

(declare-fun e!496002 () Bool)

(assert (=> b!889715 (=> (not res!602935) (not e!496002))))

(declare-datatypes ((array!51926 0))(
  ( (array!51927 (arr!24969 (Array (_ BitVec 32) (_ BitVec 64))) (size!25413 (_ BitVec 32))) )
))
(declare-datatypes ((V!28929 0))(
  ( (V!28930 (val!9037 Int)) )
))
(declare-datatypes ((ValueCell!8505 0))(
  ( (ValueCellFull!8505 (v!11515 V!28929)) (EmptyCell!8505) )
))
(declare-datatypes ((array!51928 0))(
  ( (array!51929 (arr!24970 (Array (_ BitVec 32) ValueCell!8505)) (size!25414 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4026 0))(
  ( (LongMapFixedSize!4027 (defaultEntry!5210 Int) (mask!25665 (_ BitVec 32)) (extraKeys!4904 (_ BitVec 32)) (zeroValue!5008 V!28929) (minValue!5008 V!28929) (_size!2068 (_ BitVec 32)) (_keys!9893 array!51926) (_values!5195 array!51928) (_vacant!2068 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4026)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51926 (_ BitVec 32)) Bool)

(assert (=> b!889715 (= res!602935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9893 thiss!1181) (mask!25665 thiss!1181)))))

(declare-fun b!889716 () Bool)

(declare-fun res!602939 () Bool)

(assert (=> b!889716 (=> (not res!602939) (not e!496002))))

(assert (=> b!889716 (= res!602939 (and (= (size!25414 (_values!5195 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25665 thiss!1181))) (= (size!25413 (_keys!9893 thiss!1181)) (size!25414 (_values!5195 thiss!1181))) (bvsge (mask!25665 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4904 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4904 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889717 () Bool)

(declare-fun e!496000 () Bool)

(declare-fun mapRes!28514 () Bool)

(assert (=> b!889717 (= e!496000 (and e!495999 mapRes!28514))))

(declare-fun condMapEmpty!28514 () Bool)

(declare-fun mapDefault!28514 () ValueCell!8505)

(assert (=> b!889717 (= condMapEmpty!28514 (= (arr!24970 (_values!5195 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8505)) mapDefault!28514)))))

(declare-fun b!889718 () Bool)

(declare-fun res!602936 () Bool)

(declare-fun e!496003 () Bool)

(assert (=> b!889718 (=> (not res!602936) (not e!496003))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889718 (= res!602936 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889719 () Bool)

(assert (=> b!889719 (= e!496003 e!496002)))

(declare-fun res!602938 () Bool)

(assert (=> b!889719 (=> (not res!602938) (not e!496002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889719 (= res!602938 (validMask!0 (mask!25665 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8780 0))(
  ( (MissingZero!8780 (index!37491 (_ BitVec 32))) (Found!8780 (index!37492 (_ BitVec 32))) (Intermediate!8780 (undefined!9592 Bool) (index!37493 (_ BitVec 32)) (x!75548 (_ BitVec 32))) (Undefined!8780) (MissingVacant!8780 (index!37494 (_ BitVec 32))) )
))
(declare-fun lt!402093 () SeekEntryResult!8780)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51926 (_ BitVec 32)) SeekEntryResult!8780)

(assert (=> b!889719 (= lt!402093 (seekEntry!0 key!785 (_keys!9893 thiss!1181) (mask!25665 thiss!1181)))))

(declare-fun b!889720 () Bool)

(declare-fun e!496004 () Bool)

(assert (=> b!889720 (= e!496004 tp_is_empty!17973)))

(declare-fun mapNonEmpty!28514 () Bool)

(declare-fun tp!54903 () Bool)

(assert (=> mapNonEmpty!28514 (= mapRes!28514 (and tp!54903 e!496004))))

(declare-fun mapKey!28514 () (_ BitVec 32))

(declare-fun mapValue!28514 () ValueCell!8505)

(declare-fun mapRest!28514 () (Array (_ BitVec 32) ValueCell!8505))

(assert (=> mapNonEmpty!28514 (= (arr!24970 (_values!5195 thiss!1181)) (store mapRest!28514 mapKey!28514 mapValue!28514))))

(declare-fun res!602937 () Bool)

(assert (=> start!75674 (=> (not res!602937) (not e!496003))))

(declare-fun valid!1564 (LongMapFixedSize!4026) Bool)

(assert (=> start!75674 (= res!602937 (valid!1564 thiss!1181))))

(assert (=> start!75674 e!496003))

(declare-fun e!496005 () Bool)

(assert (=> start!75674 e!496005))

(assert (=> start!75674 true))

(declare-fun mapIsEmpty!28514 () Bool)

(assert (=> mapIsEmpty!28514 mapRes!28514))

(declare-fun array_inv!19638 (array!51926) Bool)

(declare-fun array_inv!19639 (array!51928) Bool)

(assert (=> b!889721 (= e!496005 (and tp!54904 tp_is_empty!17973 (array_inv!19638 (_keys!9893 thiss!1181)) (array_inv!19639 (_values!5195 thiss!1181)) e!496000))))

(declare-fun b!889722 () Bool)

(assert (=> b!889722 (= e!496002 false)))

(declare-fun lt!402094 () Bool)

(declare-datatypes ((List!17708 0))(
  ( (Nil!17705) (Cons!17704 (h!18835 (_ BitVec 64)) (t!25007 List!17708)) )
))
(declare-fun arrayNoDuplicates!0 (array!51926 (_ BitVec 32) List!17708) Bool)

(assert (=> b!889722 (= lt!402094 (arrayNoDuplicates!0 (_keys!9893 thiss!1181) #b00000000000000000000000000000000 Nil!17705))))

(assert (= (and start!75674 res!602937) b!889718))

(assert (= (and b!889718 res!602936) b!889719))

(assert (= (and b!889719 res!602938) b!889716))

(assert (= (and b!889716 res!602939) b!889715))

(assert (= (and b!889715 res!602935) b!889722))

(assert (= (and b!889717 condMapEmpty!28514) mapIsEmpty!28514))

(assert (= (and b!889717 (not condMapEmpty!28514)) mapNonEmpty!28514))

(get-info :version)

(assert (= (and mapNonEmpty!28514 ((_ is ValueCellFull!8505) mapValue!28514)) b!889720))

(assert (= (and b!889717 ((_ is ValueCellFull!8505) mapDefault!28514)) b!889714))

(assert (= b!889721 b!889717))

(assert (= start!75674 b!889721))

(declare-fun m!828517 () Bool)

(assert (=> b!889715 m!828517))

(declare-fun m!828519 () Bool)

(assert (=> b!889722 m!828519))

(declare-fun m!828521 () Bool)

(assert (=> b!889721 m!828521))

(declare-fun m!828523 () Bool)

(assert (=> b!889721 m!828523))

(declare-fun m!828525 () Bool)

(assert (=> start!75674 m!828525))

(declare-fun m!828527 () Bool)

(assert (=> mapNonEmpty!28514 m!828527))

(declare-fun m!828529 () Bool)

(assert (=> b!889719 m!828529))

(declare-fun m!828531 () Bool)

(assert (=> b!889719 m!828531))

(check-sat (not start!75674) (not mapNonEmpty!28514) (not b!889719) (not b!889715) tp_is_empty!17973 b_and!25885 (not b_next!15645) (not b!889722) (not b!889721))
(check-sat b_and!25885 (not b_next!15645))
