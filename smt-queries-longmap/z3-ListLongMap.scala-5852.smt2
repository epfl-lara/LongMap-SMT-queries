; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75624 () Bool)

(assert start!75624)

(declare-fun b!889048 () Bool)

(declare-fun b_free!15613 () Bool)

(declare-fun b_next!15613 () Bool)

(assert (=> b!889048 (= b_free!15613 (not b_next!15613))))

(declare-fun tp!54808 () Bool)

(declare-fun b_and!25827 () Bool)

(assert (=> b!889048 (= tp!54808 b_and!25827)))

(declare-fun b!889043 () Bool)

(declare-fun res!602588 () Bool)

(declare-fun e!495519 () Bool)

(assert (=> b!889043 (=> (not res!602588) (not e!495519))))

(declare-datatypes ((array!51845 0))(
  ( (array!51846 (arr!24929 (Array (_ BitVec 32) (_ BitVec 64))) (size!25375 (_ BitVec 32))) )
))
(declare-datatypes ((V!28887 0))(
  ( (V!28888 (val!9021 Int)) )
))
(declare-datatypes ((ValueCell!8489 0))(
  ( (ValueCellFull!8489 (v!11493 V!28887)) (EmptyCell!8489) )
))
(declare-datatypes ((array!51847 0))(
  ( (array!51848 (arr!24930 (Array (_ BitVec 32) ValueCell!8489)) (size!25376 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3994 0))(
  ( (LongMapFixedSize!3995 (defaultEntry!5194 Int) (mask!25632 (_ BitVec 32)) (extraKeys!4888 (_ BitVec 32)) (zeroValue!4992 V!28887) (minValue!4992 V!28887) (_size!2052 (_ BitVec 32)) (_keys!9872 array!51845) (_values!5179 array!51847) (_vacant!2052 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3994)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51845 (_ BitVec 32)) Bool)

(assert (=> b!889043 (= res!602588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9872 thiss!1181) (mask!25632 thiss!1181)))))

(declare-fun b!889044 () Bool)

(declare-fun e!495520 () Bool)

(declare-fun tp_is_empty!17941 () Bool)

(assert (=> b!889044 (= e!495520 tp_is_empty!17941)))

(declare-fun mapNonEmpty!28466 () Bool)

(declare-fun mapRes!28466 () Bool)

(declare-fun tp!54809 () Bool)

(assert (=> mapNonEmpty!28466 (= mapRes!28466 (and tp!54809 e!495520))))

(declare-fun mapKey!28466 () (_ BitVec 32))

(declare-fun mapValue!28466 () ValueCell!8489)

(declare-fun mapRest!28466 () (Array (_ BitVec 32) ValueCell!8489))

(assert (=> mapNonEmpty!28466 (= (arr!24930 (_values!5179 thiss!1181)) (store mapRest!28466 mapKey!28466 mapValue!28466))))

(declare-fun b!889045 () Bool)

(declare-fun e!495518 () Bool)

(assert (=> b!889045 (= e!495518 e!495519)))

(declare-fun res!602586 () Bool)

(assert (=> b!889045 (=> (not res!602586) (not e!495519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889045 (= res!602586 (validMask!0 (mask!25632 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8767 0))(
  ( (MissingZero!8767 (index!37439 (_ BitVec 32))) (Found!8767 (index!37440 (_ BitVec 32))) (Intermediate!8767 (undefined!9579 Bool) (index!37441 (_ BitVec 32)) (x!75490 (_ BitVec 32))) (Undefined!8767) (MissingVacant!8767 (index!37442 (_ BitVec 32))) )
))
(declare-fun lt!401762 () SeekEntryResult!8767)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51845 (_ BitVec 32)) SeekEntryResult!8767)

(assert (=> b!889045 (= lt!401762 (seekEntry!0 key!785 (_keys!9872 thiss!1181) (mask!25632 thiss!1181)))))

(declare-fun b!889046 () Bool)

(declare-fun e!495515 () Bool)

(declare-fun e!495521 () Bool)

(assert (=> b!889046 (= e!495515 (and e!495521 mapRes!28466))))

(declare-fun condMapEmpty!28466 () Bool)

(declare-fun mapDefault!28466 () ValueCell!8489)

(assert (=> b!889046 (= condMapEmpty!28466 (= (arr!24930 (_values!5179 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8489)) mapDefault!28466)))))

(declare-fun b!889047 () Bool)

(assert (=> b!889047 (= e!495519 false)))

(declare-fun lt!401761 () Bool)

(declare-datatypes ((List!17708 0))(
  ( (Nil!17705) (Cons!17704 (h!18835 (_ BitVec 64)) (t!24998 List!17708)) )
))
(declare-fun arrayNoDuplicates!0 (array!51845 (_ BitVec 32) List!17708) Bool)

(assert (=> b!889047 (= lt!401761 (arrayNoDuplicates!0 (_keys!9872 thiss!1181) #b00000000000000000000000000000000 Nil!17705))))

(declare-fun res!602587 () Bool)

(assert (=> start!75624 (=> (not res!602587) (not e!495518))))

(declare-fun valid!1564 (LongMapFixedSize!3994) Bool)

(assert (=> start!75624 (= res!602587 (valid!1564 thiss!1181))))

(assert (=> start!75624 e!495518))

(declare-fun e!495517 () Bool)

(assert (=> start!75624 e!495517))

(assert (=> start!75624 true))

(declare-fun array_inv!19656 (array!51845) Bool)

(declare-fun array_inv!19657 (array!51847) Bool)

(assert (=> b!889048 (= e!495517 (and tp!54808 tp_is_empty!17941 (array_inv!19656 (_keys!9872 thiss!1181)) (array_inv!19657 (_values!5179 thiss!1181)) e!495515))))

(declare-fun b!889049 () Bool)

(declare-fun res!602585 () Bool)

(assert (=> b!889049 (=> (not res!602585) (not e!495519))))

(assert (=> b!889049 (= res!602585 (and (= (size!25376 (_values!5179 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25632 thiss!1181))) (= (size!25375 (_keys!9872 thiss!1181)) (size!25376 (_values!5179 thiss!1181))) (bvsge (mask!25632 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4888 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4888 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28466 () Bool)

(assert (=> mapIsEmpty!28466 mapRes!28466))

(declare-fun b!889050 () Bool)

(declare-fun res!602589 () Bool)

(assert (=> b!889050 (=> (not res!602589) (not e!495518))))

(assert (=> b!889050 (= res!602589 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889051 () Bool)

(assert (=> b!889051 (= e!495521 tp_is_empty!17941)))

(assert (= (and start!75624 res!602587) b!889050))

(assert (= (and b!889050 res!602589) b!889045))

(assert (= (and b!889045 res!602586) b!889049))

(assert (= (and b!889049 res!602585) b!889043))

(assert (= (and b!889043 res!602588) b!889047))

(assert (= (and b!889046 condMapEmpty!28466) mapIsEmpty!28466))

(assert (= (and b!889046 (not condMapEmpty!28466)) mapNonEmpty!28466))

(get-info :version)

(assert (= (and mapNonEmpty!28466 ((_ is ValueCellFull!8489) mapValue!28466)) b!889044))

(assert (= (and b!889046 ((_ is ValueCellFull!8489) mapDefault!28466)) b!889051))

(assert (= b!889048 b!889046))

(assert (= start!75624 b!889048))

(declare-fun m!827503 () Bool)

(assert (=> b!889047 m!827503))

(declare-fun m!827505 () Bool)

(assert (=> b!889043 m!827505))

(declare-fun m!827507 () Bool)

(assert (=> b!889045 m!827507))

(declare-fun m!827509 () Bool)

(assert (=> b!889045 m!827509))

(declare-fun m!827511 () Bool)

(assert (=> start!75624 m!827511))

(declare-fun m!827513 () Bool)

(assert (=> mapNonEmpty!28466 m!827513))

(declare-fun m!827515 () Bool)

(assert (=> b!889048 m!827515))

(declare-fun m!827517 () Bool)

(assert (=> b!889048 m!827517))

(check-sat b_and!25827 (not mapNonEmpty!28466) (not b_next!15613) tp_is_empty!17941 (not b!889048) (not b!889043) (not b!889045) (not b!889047) (not start!75624))
(check-sat b_and!25827 (not b_next!15613))
