; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75810 () Bool)

(assert start!75810)

(declare-fun b!891886 () Bool)

(declare-fun b_free!15799 () Bool)

(declare-fun b_next!15799 () Bool)

(assert (=> b!891886 (= b_free!15799 (not b_next!15799))))

(declare-fun tp!55367 () Bool)

(declare-fun b_and!26013 () Bool)

(assert (=> b!891886 (= tp!55367 b_and!26013)))

(declare-fun b!891884 () Bool)

(declare-fun e!497804 () Bool)

(declare-fun e!497803 () Bool)

(assert (=> b!891884 (= e!497804 (not e!497803))))

(declare-fun res!604311 () Bool)

(assert (=> b!891884 (=> res!604311 e!497803)))

(declare-datatypes ((SeekEntryResult!8845 0))(
  ( (MissingZero!8845 (index!37751 (_ BitVec 32))) (Found!8845 (index!37752 (_ BitVec 32))) (Intermediate!8845 (undefined!9657 Bool) (index!37753 (_ BitVec 32)) (x!75816 (_ BitVec 32))) (Undefined!8845) (MissingVacant!8845 (index!37754 (_ BitVec 32))) )
))
(declare-fun lt!402795 () SeekEntryResult!8845)

(get-info :version)

(assert (=> b!891884 (= res!604311 (not ((_ is Found!8845) lt!402795)))))

(declare-fun e!497801 () Bool)

(assert (=> b!891884 e!497801))

(declare-fun res!604316 () Bool)

(assert (=> b!891884 (=> res!604316 e!497801)))

(assert (=> b!891884 (= res!604316 (not ((_ is Found!8845) lt!402795)))))

(declare-datatypes ((Unit!30322 0))(
  ( (Unit!30323) )
))
(declare-fun lt!402798 () Unit!30322)

(declare-datatypes ((array!52217 0))(
  ( (array!52218 (arr!25115 (Array (_ BitVec 32) (_ BitVec 64))) (size!25561 (_ BitVec 32))) )
))
(declare-datatypes ((V!29135 0))(
  ( (V!29136 (val!9114 Int)) )
))
(declare-datatypes ((ValueCell!8582 0))(
  ( (ValueCellFull!8582 (v!11586 V!29135)) (EmptyCell!8582) )
))
(declare-datatypes ((array!52219 0))(
  ( (array!52220 (arr!25116 (Array (_ BitVec 32) ValueCell!8582)) (size!25562 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4180 0))(
  ( (LongMapFixedSize!4181 (defaultEntry!5287 Int) (mask!25787 (_ BitVec 32)) (extraKeys!4981 (_ BitVec 32)) (zeroValue!5085 V!29135) (minValue!5085 V!29135) (_size!2145 (_ BitVec 32)) (_keys!9965 array!52217) (_values!5272 array!52219) (_vacant!2145 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4180)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!47 (array!52217 array!52219 (_ BitVec 32) (_ BitVec 32) V!29135 V!29135 (_ BitVec 64)) Unit!30322)

(assert (=> b!891884 (= lt!402798 (lemmaSeekEntryGivesInRangeIndex!47 (_keys!9965 thiss!1181) (_values!5272 thiss!1181) (mask!25787 thiss!1181) (extraKeys!4981 thiss!1181) (zeroValue!5085 thiss!1181) (minValue!5085 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52217 (_ BitVec 32)) SeekEntryResult!8845)

(assert (=> b!891884 (= lt!402795 (seekEntry!0 key!785 (_keys!9965 thiss!1181) (mask!25787 thiss!1181)))))

(declare-fun res!604317 () Bool)

(assert (=> start!75810 (=> (not res!604317) (not e!497804))))

(declare-fun valid!1623 (LongMapFixedSize!4180) Bool)

(assert (=> start!75810 (= res!604317 (valid!1623 thiss!1181))))

(assert (=> start!75810 e!497804))

(declare-fun e!497802 () Bool)

(assert (=> start!75810 e!497802))

(assert (=> start!75810 true))

(declare-fun b!891885 () Bool)

(declare-fun res!604313 () Bool)

(declare-fun e!497797 () Bool)

(assert (=> b!891885 (=> res!604313 e!497797)))

(declare-datatypes ((List!17776 0))(
  ( (Nil!17773) (Cons!17772 (h!18903 (_ BitVec 64)) (t!25066 List!17776)) )
))
(declare-fun arrayNoDuplicates!0 (array!52217 (_ BitVec 32) List!17776) Bool)

(assert (=> b!891885 (= res!604313 (not (arrayNoDuplicates!0 (_keys!9965 thiss!1181) #b00000000000000000000000000000000 Nil!17773)))))

(declare-fun mapNonEmpty!28745 () Bool)

(declare-fun mapRes!28745 () Bool)

(declare-fun tp!55366 () Bool)

(declare-fun e!497796 () Bool)

(assert (=> mapNonEmpty!28745 (= mapRes!28745 (and tp!55366 e!497796))))

(declare-fun mapRest!28745 () (Array (_ BitVec 32) ValueCell!8582))

(declare-fun mapValue!28745 () ValueCell!8582)

(declare-fun mapKey!28745 () (_ BitVec 32))

(assert (=> mapNonEmpty!28745 (= (arr!25116 (_values!5272 thiss!1181)) (store mapRest!28745 mapKey!28745 mapValue!28745))))

(declare-fun tp_is_empty!18127 () Bool)

(declare-fun e!497798 () Bool)

(declare-fun array_inv!19790 (array!52217) Bool)

(declare-fun array_inv!19791 (array!52219) Bool)

(assert (=> b!891886 (= e!497802 (and tp!55367 tp_is_empty!18127 (array_inv!19790 (_keys!9965 thiss!1181)) (array_inv!19791 (_values!5272 thiss!1181)) e!497798))))

(declare-fun mapIsEmpty!28745 () Bool)

(assert (=> mapIsEmpty!28745 mapRes!28745))

(declare-fun b!891887 () Bool)

(assert (=> b!891887 (= e!497797 true)))

(declare-fun lt!402796 () Bool)

(declare-datatypes ((tuple2!11996 0))(
  ( (tuple2!11997 (_1!6009 (_ BitVec 64)) (_2!6009 V!29135)) )
))
(declare-datatypes ((List!17777 0))(
  ( (Nil!17774) (Cons!17773 (h!18904 tuple2!11996) (t!25067 List!17777)) )
))
(declare-datatypes ((ListLongMap!10683 0))(
  ( (ListLongMap!10684 (toList!5357 List!17777)) )
))
(declare-fun lt!402799 () ListLongMap!10683)

(declare-fun contains!4327 (ListLongMap!10683 (_ BitVec 64)) Bool)

(assert (=> b!891887 (= lt!402796 (contains!4327 lt!402799 key!785))))

(declare-fun b!891888 () Bool)

(declare-fun res!604314 () Bool)

(assert (=> b!891888 (=> res!604314 e!497797)))

(assert (=> b!891888 (= res!604314 (or (not (= (size!25562 (_values!5272 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25787 thiss!1181)))) (not (= (size!25561 (_keys!9965 thiss!1181)) (size!25562 (_values!5272 thiss!1181)))) (bvslt (mask!25787 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4981 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4981 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891889 () Bool)

(declare-fun e!497800 () Bool)

(assert (=> b!891889 (= e!497798 (and e!497800 mapRes!28745))))

(declare-fun condMapEmpty!28745 () Bool)

(declare-fun mapDefault!28745 () ValueCell!8582)

(assert (=> b!891889 (= condMapEmpty!28745 (= (arr!25116 (_values!5272 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8582)) mapDefault!28745)))))

(declare-fun b!891890 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891890 (= e!497801 (inRange!0 (index!37752 lt!402795) (mask!25787 thiss!1181)))))

(declare-fun b!891891 () Bool)

(assert (=> b!891891 (= e!497803 e!497797)))

(declare-fun res!604312 () Bool)

(assert (=> b!891891 (=> res!604312 e!497797)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891891 (= res!604312 (not (validMask!0 (mask!25787 thiss!1181))))))

(assert (=> b!891891 (contains!4327 lt!402799 (select (arr!25115 (_keys!9965 thiss!1181)) (index!37752 lt!402795)))))

(declare-fun getCurrentListMap!2585 (array!52217 array!52219 (_ BitVec 32) (_ BitVec 32) V!29135 V!29135 (_ BitVec 32) Int) ListLongMap!10683)

(assert (=> b!891891 (= lt!402799 (getCurrentListMap!2585 (_keys!9965 thiss!1181) (_values!5272 thiss!1181) (mask!25787 thiss!1181) (extraKeys!4981 thiss!1181) (zeroValue!5085 thiss!1181) (minValue!5085 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5287 thiss!1181)))))

(declare-fun lt!402800 () Unit!30322)

(declare-fun lemmaValidKeyInArrayIsInListMap!221 (array!52217 array!52219 (_ BitVec 32) (_ BitVec 32) V!29135 V!29135 (_ BitVec 32) Int) Unit!30322)

(assert (=> b!891891 (= lt!402800 (lemmaValidKeyInArrayIsInListMap!221 (_keys!9965 thiss!1181) (_values!5272 thiss!1181) (mask!25787 thiss!1181) (extraKeys!4981 thiss!1181) (zeroValue!5085 thiss!1181) (minValue!5085 thiss!1181) (index!37752 lt!402795) (defaultEntry!5287 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891891 (arrayContainsKey!0 (_keys!9965 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402797 () Unit!30322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52217 (_ BitVec 64) (_ BitVec 32)) Unit!30322)

(assert (=> b!891891 (= lt!402797 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9965 thiss!1181) key!785 (index!37752 lt!402795)))))

(declare-fun b!891892 () Bool)

(declare-fun res!604315 () Bool)

(assert (=> b!891892 (=> (not res!604315) (not e!497804))))

(assert (=> b!891892 (= res!604315 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891893 () Bool)

(assert (=> b!891893 (= e!497800 tp_is_empty!18127)))

(declare-fun b!891894 () Bool)

(declare-fun res!604310 () Bool)

(assert (=> b!891894 (=> res!604310 e!497797)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52217 (_ BitVec 32)) Bool)

(assert (=> b!891894 (= res!604310 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9965 thiss!1181) (mask!25787 thiss!1181))))))

(declare-fun b!891895 () Bool)

(assert (=> b!891895 (= e!497796 tp_is_empty!18127)))

(assert (= (and start!75810 res!604317) b!891892))

(assert (= (and b!891892 res!604315) b!891884))

(assert (= (and b!891884 (not res!604316)) b!891890))

(assert (= (and b!891884 (not res!604311)) b!891891))

(assert (= (and b!891891 (not res!604312)) b!891888))

(assert (= (and b!891888 (not res!604314)) b!891894))

(assert (= (and b!891894 (not res!604310)) b!891885))

(assert (= (and b!891885 (not res!604313)) b!891887))

(assert (= (and b!891889 condMapEmpty!28745) mapIsEmpty!28745))

(assert (= (and b!891889 (not condMapEmpty!28745)) mapNonEmpty!28745))

(assert (= (and mapNonEmpty!28745 ((_ is ValueCellFull!8582) mapValue!28745)) b!891895))

(assert (= (and b!891889 ((_ is ValueCellFull!8582) mapDefault!28745)) b!891893))

(assert (= b!891886 b!891889))

(assert (= start!75810 b!891886))

(declare-fun m!829639 () Bool)

(assert (=> b!891890 m!829639))

(declare-fun m!829641 () Bool)

(assert (=> b!891885 m!829641))

(declare-fun m!829643 () Bool)

(assert (=> b!891886 m!829643))

(declare-fun m!829645 () Bool)

(assert (=> b!891886 m!829645))

(declare-fun m!829647 () Bool)

(assert (=> b!891891 m!829647))

(declare-fun m!829649 () Bool)

(assert (=> b!891891 m!829649))

(declare-fun m!829651 () Bool)

(assert (=> b!891891 m!829651))

(declare-fun m!829653 () Bool)

(assert (=> b!891891 m!829653))

(declare-fun m!829655 () Bool)

(assert (=> b!891891 m!829655))

(declare-fun m!829657 () Bool)

(assert (=> b!891891 m!829657))

(assert (=> b!891891 m!829657))

(declare-fun m!829659 () Bool)

(assert (=> b!891891 m!829659))

(declare-fun m!829661 () Bool)

(assert (=> b!891894 m!829661))

(declare-fun m!829663 () Bool)

(assert (=> mapNonEmpty!28745 m!829663))

(declare-fun m!829665 () Bool)

(assert (=> b!891887 m!829665))

(declare-fun m!829667 () Bool)

(assert (=> start!75810 m!829667))

(declare-fun m!829669 () Bool)

(assert (=> b!891884 m!829669))

(declare-fun m!829671 () Bool)

(assert (=> b!891884 m!829671))

(check-sat (not start!75810) (not b!891891) (not b_next!15799) tp_is_empty!18127 (not b!891885) (not b!891886) b_and!26013 (not b!891890) (not b!891887) (not b!891894) (not b!891884) (not mapNonEmpty!28745))
(check-sat b_and!26013 (not b_next!15799))
