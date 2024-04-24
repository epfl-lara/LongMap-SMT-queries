; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80604 () Bool)

(assert start!80604)

(declare-fun b!945864 () Bool)

(declare-fun b_free!18079 () Bool)

(declare-fun b_next!18079 () Bool)

(assert (=> b!945864 (= b_free!18079 (not b_next!18079))))

(declare-fun tp!62747 () Bool)

(declare-fun b_and!29507 () Bool)

(assert (=> b!945864 (= tp!62747 b_and!29507)))

(declare-fun mapIsEmpty!32706 () Bool)

(declare-fun mapRes!32706 () Bool)

(assert (=> mapIsEmpty!32706 mapRes!32706))

(declare-fun mapNonEmpty!32706 () Bool)

(declare-fun tp!62748 () Bool)

(declare-fun e!531989 () Bool)

(assert (=> mapNonEmpty!32706 (= mapRes!32706 (and tp!62748 e!531989))))

(declare-datatypes ((V!32415 0))(
  ( (V!32416 (val!10344 Int)) )
))
(declare-datatypes ((ValueCell!9812 0))(
  ( (ValueCellFull!9812 (v!12873 V!32415)) (EmptyCell!9812) )
))
(declare-fun mapValue!32706 () ValueCell!9812)

(declare-datatypes ((array!57193 0))(
  ( (array!57194 (arr!27517 (Array (_ BitVec 32) ValueCell!9812)) (size!27984 (_ BitVec 32))) )
))
(declare-datatypes ((array!57195 0))(
  ( (array!57196 (arr!27518 (Array (_ BitVec 32) (_ BitVec 64))) (size!27985 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4774 0))(
  ( (LongMapFixedSize!4775 (defaultEntry!5682 Int) (mask!27385 (_ BitVec 32)) (extraKeys!5414 (_ BitVec 32)) (zeroValue!5518 V!32415) (minValue!5518 V!32415) (_size!2442 (_ BitVec 32)) (_keys!10588 array!57195) (_values!5705 array!57193) (_vacant!2442 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4774)

(declare-fun mapKey!32706 () (_ BitVec 32))

(declare-fun mapRest!32706 () (Array (_ BitVec 32) ValueCell!9812))

(assert (=> mapNonEmpty!32706 (= (arr!27517 (_values!5705 thiss!1141)) (store mapRest!32706 mapKey!32706 mapValue!32706))))

(declare-fun b!945856 () Bool)

(declare-datatypes ((Unit!31848 0))(
  ( (Unit!31849) )
))
(declare-fun e!531992 () Unit!31848)

(declare-fun Unit!31850 () Unit!31848)

(assert (=> b!945856 (= e!531992 Unit!31850)))

(declare-fun res!635130 () Bool)

(declare-fun e!531994 () Bool)

(assert (=> start!80604 (=> (not res!635130) (not e!531994))))

(declare-fun valid!1832 (LongMapFixedSize!4774) Bool)

(assert (=> start!80604 (= res!635130 (valid!1832 thiss!1141))))

(assert (=> start!80604 e!531994))

(declare-fun e!531993 () Bool)

(assert (=> start!80604 e!531993))

(assert (=> start!80604 true))

(declare-fun b!945857 () Bool)

(declare-fun Unit!31851 () Unit!31848)

(assert (=> b!945857 (= e!531992 Unit!31851)))

(declare-fun lt!426165 () Unit!31848)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun lemmaKeyInListMapIsInArray!315 (array!57195 array!57193 (_ BitVec 32) (_ BitVec 32) V!32415 V!32415 (_ BitVec 64) Int) Unit!31848)

(assert (=> b!945857 (= lt!426165 (lemmaKeyInListMapIsInArray!315 (_keys!10588 thiss!1141) (_values!5705 thiss!1141) (mask!27385 thiss!1141) (extraKeys!5414 thiss!1141) (zeroValue!5518 thiss!1141) (minValue!5518 thiss!1141) key!756 (defaultEntry!5682 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945857 (arrayContainsKey!0 (_keys!10588 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426167 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57195 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945857 (= lt!426167 (arrayScanForKey!0 (_keys!10588 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun lt!426169 () Unit!31848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31848)

(assert (=> b!945857 (= lt!426169 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10588 thiss!1141) (mask!27385 thiss!1141) #b00000000000000000000000000000000 lt!426167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57195 (_ BitVec 32)) Bool)

(assert (=> b!945857 (arrayForallSeekEntryOrOpenFound!0 lt!426167 (_keys!10588 thiss!1141) (mask!27385 thiss!1141))))

(declare-fun lt!426166 () Unit!31848)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57195 (_ BitVec 32)) Unit!31848)

(assert (=> b!945857 (= lt!426166 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!426167 (_keys!10588 thiss!1141) (mask!27385 thiss!1141)))))

(assert (=> b!945857 false))

(declare-fun b!945858 () Bool)

(assert (=> b!945858 (= e!531994 false)))

(declare-fun lt!426168 () Unit!31848)

(assert (=> b!945858 (= lt!426168 e!531992)))

(declare-fun c!98618 () Bool)

(declare-datatypes ((tuple2!13478 0))(
  ( (tuple2!13479 (_1!6750 (_ BitVec 64)) (_2!6750 V!32415)) )
))
(declare-datatypes ((List!19268 0))(
  ( (Nil!19265) (Cons!19264 (h!20421 tuple2!13478) (t!27577 List!19268)) )
))
(declare-datatypes ((ListLongMap!12177 0))(
  ( (ListLongMap!12178 (toList!6104 List!19268)) )
))
(declare-fun contains!5187 (ListLongMap!12177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3338 (array!57195 array!57193 (_ BitVec 32) (_ BitVec 32) V!32415 V!32415 (_ BitVec 32) Int) ListLongMap!12177)

(assert (=> b!945858 (= c!98618 (contains!5187 (getCurrentListMap!3338 (_keys!10588 thiss!1141) (_values!5705 thiss!1141) (mask!27385 thiss!1141) (extraKeys!5414 thiss!1141) (zeroValue!5518 thiss!1141) (minValue!5518 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5682 thiss!1141)) key!756))))

(declare-fun b!945859 () Bool)

(declare-fun e!531991 () Bool)

(declare-fun tp_is_empty!20587 () Bool)

(assert (=> b!945859 (= e!531991 tp_is_empty!20587)))

(declare-fun b!945860 () Bool)

(assert (=> b!945860 (= e!531989 tp_is_empty!20587)))

(declare-fun b!945861 () Bool)

(declare-fun e!531990 () Bool)

(assert (=> b!945861 (= e!531990 (and e!531991 mapRes!32706))))

(declare-fun condMapEmpty!32706 () Bool)

(declare-fun mapDefault!32706 () ValueCell!9812)

(assert (=> b!945861 (= condMapEmpty!32706 (= (arr!27517 (_values!5705 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9812)) mapDefault!32706)))))

(declare-fun b!945862 () Bool)

(declare-fun res!635131 () Bool)

(assert (=> b!945862 (=> (not res!635131) (not e!531994))))

(assert (=> b!945862 (= res!635131 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945863 () Bool)

(declare-fun res!635132 () Bool)

(assert (=> b!945863 (=> (not res!635132) (not e!531994))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9040 0))(
  ( (MissingZero!9040 (index!38531 (_ BitVec 32))) (Found!9040 (index!38532 (_ BitVec 32))) (Intermediate!9040 (undefined!9852 Bool) (index!38533 (_ BitVec 32)) (x!81145 (_ BitVec 32))) (Undefined!9040) (MissingVacant!9040 (index!38534 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57195 (_ BitVec 32)) SeekEntryResult!9040)

(assert (=> b!945863 (= res!635132 (not ((_ is Found!9040) (seekEntry!0 key!756 (_keys!10588 thiss!1141) (mask!27385 thiss!1141)))))))

(declare-fun array_inv!21458 (array!57195) Bool)

(declare-fun array_inv!21459 (array!57193) Bool)

(assert (=> b!945864 (= e!531993 (and tp!62747 tp_is_empty!20587 (array_inv!21458 (_keys!10588 thiss!1141)) (array_inv!21459 (_values!5705 thiss!1141)) e!531990))))

(assert (= (and start!80604 res!635130) b!945862))

(assert (= (and b!945862 res!635131) b!945863))

(assert (= (and b!945863 res!635132) b!945858))

(assert (= (and b!945858 c!98618) b!945857))

(assert (= (and b!945858 (not c!98618)) b!945856))

(assert (= (and b!945861 condMapEmpty!32706) mapIsEmpty!32706))

(assert (= (and b!945861 (not condMapEmpty!32706)) mapNonEmpty!32706))

(assert (= (and mapNonEmpty!32706 ((_ is ValueCellFull!9812) mapValue!32706)) b!945860))

(assert (= (and b!945861 ((_ is ValueCellFull!9812) mapDefault!32706)) b!945859))

(assert (= b!945864 b!945861))

(assert (= start!80604 b!945864))

(declare-fun m!880195 () Bool)

(assert (=> mapNonEmpty!32706 m!880195))

(declare-fun m!880197 () Bool)

(assert (=> b!945857 m!880197))

(declare-fun m!880199 () Bool)

(assert (=> b!945857 m!880199))

(declare-fun m!880201 () Bool)

(assert (=> b!945857 m!880201))

(declare-fun m!880203 () Bool)

(assert (=> b!945857 m!880203))

(declare-fun m!880205 () Bool)

(assert (=> b!945857 m!880205))

(declare-fun m!880207 () Bool)

(assert (=> b!945857 m!880207))

(declare-fun m!880209 () Bool)

(assert (=> b!945864 m!880209))

(declare-fun m!880211 () Bool)

(assert (=> b!945864 m!880211))

(declare-fun m!880213 () Bool)

(assert (=> b!945858 m!880213))

(assert (=> b!945858 m!880213))

(declare-fun m!880215 () Bool)

(assert (=> b!945858 m!880215))

(declare-fun m!880217 () Bool)

(assert (=> start!80604 m!880217))

(declare-fun m!880219 () Bool)

(assert (=> b!945863 m!880219))

(check-sat (not b_next!18079) (not mapNonEmpty!32706) (not start!80604) (not b!945858) (not b!945864) tp_is_empty!20587 (not b!945863) b_and!29507 (not b!945857))
(check-sat b_and!29507 (not b_next!18079))
