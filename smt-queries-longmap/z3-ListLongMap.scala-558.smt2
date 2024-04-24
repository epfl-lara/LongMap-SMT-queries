; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15194 () Bool)

(assert start!15194)

(declare-fun b!145846 () Bool)

(declare-fun b_free!3085 () Bool)

(declare-fun b_next!3085 () Bool)

(assert (=> b!145846 (= b_free!3085 (not b_next!3085))))

(declare-fun tp!11759 () Bool)

(declare-fun b_and!9089 () Bool)

(assert (=> b!145846 (= tp!11759 b_and!9089)))

(declare-fun b!145839 () Bool)

(declare-fun b_free!3087 () Bool)

(declare-fun b_next!3087 () Bool)

(assert (=> b!145839 (= b_free!3087 (not b_next!3087))))

(declare-fun tp!11757 () Bool)

(declare-fun b_and!9091 () Bool)

(assert (=> b!145839 (= tp!11757 b_and!9091)))

(declare-fun b!145834 () Bool)

(declare-fun res!69451 () Bool)

(declare-fun e!95035 () Bool)

(assert (=> b!145834 (=> (not res!69451) (not e!95035))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3593 0))(
  ( (V!3594 (val!1524 Int)) )
))
(declare-datatypes ((array!4949 0))(
  ( (array!4950 (arr!2336 (Array (_ BitVec 32) (_ BitVec 64))) (size!2612 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1136 0))(
  ( (ValueCellFull!1136 (v!3340 V!3593)) (EmptyCell!1136) )
))
(declare-datatypes ((array!4951 0))(
  ( (array!4952 (arr!2337 (Array (_ BitVec 32) ValueCell!1136)) (size!2613 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1180 0))(
  ( (LongMapFixedSize!1181 (defaultEntry!3006 Int) (mask!7378 (_ BitVec 32)) (extraKeys!2751 (_ BitVec 32)) (zeroValue!2851 V!3593) (minValue!2851 V!3593) (_size!639 (_ BitVec 32)) (_keys!4775 array!4949) (_values!2989 array!4951) (_vacant!639 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!966 0))(
  ( (Cell!967 (v!3341 LongMapFixedSize!1180)) )
))
(declare-datatypes ((LongMap!966 0))(
  ( (LongMap!967 (underlying!494 Cell!966)) )
))
(declare-fun thiss!992 () LongMap!966)

(assert (=> b!145834 (= res!69451 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2612 (_keys!4775 (v!3341 (underlying!494 thiss!992)))))))))

(declare-fun b!145835 () Bool)

(declare-fun e!95041 () Bool)

(declare-fun e!95038 () Bool)

(assert (=> b!145835 (= e!95041 e!95038)))

(declare-fun b!145836 () Bool)

(declare-fun e!95032 () Bool)

(declare-fun e!95034 () Bool)

(declare-fun mapRes!4949 () Bool)

(assert (=> b!145836 (= e!95032 (and e!95034 mapRes!4949))))

(declare-fun condMapEmpty!4949 () Bool)

(declare-fun mapDefault!4949 () ValueCell!1136)

(assert (=> b!145836 (= condMapEmpty!4949 (= (arr!2337 (_values!2989 (v!3341 (underlying!494 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1136)) mapDefault!4949)))))

(declare-fun b!145837 () Bool)

(declare-fun e!95042 () Bool)

(declare-fun tp_is_empty!2959 () Bool)

(assert (=> b!145837 (= e!95042 tp_is_empty!2959)))

(declare-fun mapNonEmpty!4949 () Bool)

(declare-fun tp!11758 () Bool)

(assert (=> mapNonEmpty!4949 (= mapRes!4949 (and tp!11758 e!95042))))

(declare-fun mapValue!4950 () ValueCell!1136)

(declare-fun mapKey!4949 () (_ BitVec 32))

(declare-fun mapRest!4949 () (Array (_ BitVec 32) ValueCell!1136))

(assert (=> mapNonEmpty!4949 (= (arr!2337 (_values!2989 (v!3341 (underlying!494 thiss!992)))) (store mapRest!4949 mapKey!4949 mapValue!4950))))

(declare-fun b!145838 () Bool)

(declare-fun e!95036 () Bool)

(assert (=> b!145838 (= e!95036 tp_is_empty!2959)))

(declare-fun newMap!16 () LongMapFixedSize!1180)

(declare-fun e!95043 () Bool)

(declare-fun e!95031 () Bool)

(declare-fun array_inv!1461 (array!4949) Bool)

(declare-fun array_inv!1462 (array!4951) Bool)

(assert (=> b!145839 (= e!95031 (and tp!11757 tp_is_empty!2959 (array_inv!1461 (_keys!4775 newMap!16)) (array_inv!1462 (_values!2989 newMap!16)) e!95043))))

(declare-fun b!145840 () Bool)

(declare-fun e!95033 () Bool)

(assert (=> b!145840 (= e!95033 (not true))))

(assert (=> b!145840 false))

(declare-datatypes ((Unit!4599 0))(
  ( (Unit!4600) )
))
(declare-fun lt!76698 () Unit!4599)

(declare-datatypes ((List!1744 0))(
  ( (Nil!1741) (Cons!1740 (h!2348 (_ BitVec 64)) (t!6405 List!1744)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4949 (_ BitVec 32) (_ BitVec 64) List!1744) Unit!4599)

(assert (=> b!145840 (= lt!76698 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4775 (v!3341 (underlying!494 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2336 (_keys!4775 (v!3341 (underlying!494 thiss!992)))) from!355) (Cons!1740 (select (arr!2336 (_keys!4775 (v!3341 (underlying!494 thiss!992)))) from!355) Nil!1741)))))

(declare-fun arrayNoDuplicates!0 (array!4949 (_ BitVec 32) List!1744) Bool)

(assert (=> b!145840 (arrayNoDuplicates!0 (_keys!4775 (v!3341 (underlying!494 thiss!992))) from!355 Nil!1741)))

(declare-fun lt!76699 () Unit!4599)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4949 (_ BitVec 32) (_ BitVec 32)) Unit!4599)

(assert (=> b!145840 (= lt!76699 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4775 (v!3341 (underlying!494 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145840 (arrayContainsKey!0 (_keys!4775 (v!3341 (underlying!494 thiss!992))) (select (arr!2336 (_keys!4775 (v!3341 (underlying!494 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76701 () Unit!4599)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!148 (array!4949 array!4951 (_ BitVec 32) (_ BitVec 32) V!3593 V!3593 (_ BitVec 64) (_ BitVec 32) Int) Unit!4599)

(assert (=> b!145840 (= lt!76701 (lemmaListMapContainsThenArrayContainsFrom!148 (_keys!4775 (v!3341 (underlying!494 thiss!992))) (_values!2989 (v!3341 (underlying!494 thiss!992))) (mask!7378 (v!3341 (underlying!494 thiss!992))) (extraKeys!2751 (v!3341 (underlying!494 thiss!992))) (zeroValue!2851 (v!3341 (underlying!494 thiss!992))) (minValue!2851 (v!3341 (underlying!494 thiss!992))) (select (arr!2336 (_keys!4775 (v!3341 (underlying!494 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3006 (v!3341 (underlying!494 thiss!992)))))))

(declare-fun b!145841 () Bool)

(assert (=> b!145841 (= e!95034 tp_is_empty!2959)))

(declare-fun b!145842 () Bool)

(declare-fun res!69446 () Bool)

(assert (=> b!145842 (=> (not res!69446) (not e!95035))))

(declare-fun valid!587 (LongMapFixedSize!1180) Bool)

(assert (=> b!145842 (= res!69446 (valid!587 newMap!16))))

(declare-fun b!145843 () Bool)

(declare-fun e!95044 () Bool)

(assert (=> b!145843 (= e!95035 e!95044)))

(declare-fun res!69448 () Bool)

(assert (=> b!145843 (=> (not res!69448) (not e!95044))))

(declare-datatypes ((tuple2!2662 0))(
  ( (tuple2!2663 (_1!1342 (_ BitVec 64)) (_2!1342 V!3593)) )
))
(declare-datatypes ((List!1745 0))(
  ( (Nil!1742) (Cons!1741 (h!2349 tuple2!2662) (t!6406 List!1745)) )
))
(declare-datatypes ((ListLongMap!1705 0))(
  ( (ListLongMap!1706 (toList!868 List!1745)) )
))
(declare-fun lt!76700 () ListLongMap!1705)

(declare-fun lt!76697 () ListLongMap!1705)

(assert (=> b!145843 (= res!69448 (and (= lt!76697 lt!76700) (not (= (select (arr!2336 (_keys!4775 (v!3341 (underlying!494 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2336 (_keys!4775 (v!3341 (underlying!494 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1447 (LongMapFixedSize!1180) ListLongMap!1705)

(assert (=> b!145843 (= lt!76700 (map!1447 newMap!16))))

(declare-fun getCurrentListMap!539 (array!4949 array!4951 (_ BitVec 32) (_ BitVec 32) V!3593 V!3593 (_ BitVec 32) Int) ListLongMap!1705)

(assert (=> b!145843 (= lt!76697 (getCurrentListMap!539 (_keys!4775 (v!3341 (underlying!494 thiss!992))) (_values!2989 (v!3341 (underlying!494 thiss!992))) (mask!7378 (v!3341 (underlying!494 thiss!992))) (extraKeys!2751 (v!3341 (underlying!494 thiss!992))) (zeroValue!2851 (v!3341 (underlying!494 thiss!992))) (minValue!2851 (v!3341 (underlying!494 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3006 (v!3341 (underlying!494 thiss!992)))))))

(declare-fun res!69449 () Bool)

(assert (=> start!15194 (=> (not res!69449) (not e!95035))))

(declare-fun valid!588 (LongMap!966) Bool)

(assert (=> start!15194 (= res!69449 (valid!588 thiss!992))))

(assert (=> start!15194 e!95035))

(assert (=> start!15194 e!95041))

(assert (=> start!15194 true))

(assert (=> start!15194 e!95031))

(declare-fun b!145844 () Bool)

(declare-fun e!95040 () Bool)

(declare-fun mapRes!4950 () Bool)

(assert (=> b!145844 (= e!95043 (and e!95040 mapRes!4950))))

(declare-fun condMapEmpty!4950 () Bool)

(declare-fun mapDefault!4950 () ValueCell!1136)

(assert (=> b!145844 (= condMapEmpty!4950 (= (arr!2337 (_values!2989 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1136)) mapDefault!4950)))))

(declare-fun b!145845 () Bool)

(declare-fun res!69450 () Bool)

(assert (=> b!145845 (=> (not res!69450) (not e!95035))))

(assert (=> b!145845 (= res!69450 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7378 newMap!16)) (_size!639 (v!3341 (underlying!494 thiss!992)))))))

(declare-fun e!95037 () Bool)

(assert (=> b!145846 (= e!95037 (and tp!11759 tp_is_empty!2959 (array_inv!1461 (_keys!4775 (v!3341 (underlying!494 thiss!992)))) (array_inv!1462 (_values!2989 (v!3341 (underlying!494 thiss!992)))) e!95032))))

(declare-fun b!145847 () Bool)

(assert (=> b!145847 (= e!95038 e!95037)))

(declare-fun b!145848 () Bool)

(assert (=> b!145848 (= e!95044 e!95033)))

(declare-fun res!69447 () Bool)

(assert (=> b!145848 (=> (not res!69447) (not e!95033))))

(declare-fun contains!926 (ListLongMap!1705 (_ BitVec 64)) Bool)

(assert (=> b!145848 (= res!69447 (contains!926 lt!76700 (select (arr!2336 (_keys!4775 (v!3341 (underlying!494 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2664 0))(
  ( (tuple2!2665 (_1!1343 Bool) (_2!1343 LongMapFixedSize!1180)) )
))
(declare-fun lt!76696 () tuple2!2664)

(declare-fun update!219 (LongMapFixedSize!1180 (_ BitVec 64) V!3593) tuple2!2664)

(declare-fun get!1565 (ValueCell!1136 V!3593) V!3593)

(declare-fun dynLambda!449 (Int (_ BitVec 64)) V!3593)

(assert (=> b!145848 (= lt!76696 (update!219 newMap!16 (select (arr!2336 (_keys!4775 (v!3341 (underlying!494 thiss!992)))) from!355) (get!1565 (select (arr!2337 (_values!2989 (v!3341 (underlying!494 thiss!992)))) from!355) (dynLambda!449 (defaultEntry!3006 (v!3341 (underlying!494 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!4949 () Bool)

(assert (=> mapIsEmpty!4949 mapRes!4949))

(declare-fun mapIsEmpty!4950 () Bool)

(assert (=> mapIsEmpty!4950 mapRes!4950))

(declare-fun mapNonEmpty!4950 () Bool)

(declare-fun tp!11760 () Bool)

(assert (=> mapNonEmpty!4950 (= mapRes!4950 (and tp!11760 e!95036))))

(declare-fun mapValue!4949 () ValueCell!1136)

(declare-fun mapKey!4950 () (_ BitVec 32))

(declare-fun mapRest!4950 () (Array (_ BitVec 32) ValueCell!1136))

(assert (=> mapNonEmpty!4950 (= (arr!2337 (_values!2989 newMap!16)) (store mapRest!4950 mapKey!4950 mapValue!4949))))

(declare-fun b!145849 () Bool)

(assert (=> b!145849 (= e!95040 tp_is_empty!2959)))

(assert (= (and start!15194 res!69449) b!145834))

(assert (= (and b!145834 res!69451) b!145842))

(assert (= (and b!145842 res!69446) b!145845))

(assert (= (and b!145845 res!69450) b!145843))

(assert (= (and b!145843 res!69448) b!145848))

(assert (= (and b!145848 res!69447) b!145840))

(assert (= (and b!145836 condMapEmpty!4949) mapIsEmpty!4949))

(assert (= (and b!145836 (not condMapEmpty!4949)) mapNonEmpty!4949))

(get-info :version)

(assert (= (and mapNonEmpty!4949 ((_ is ValueCellFull!1136) mapValue!4950)) b!145837))

(assert (= (and b!145836 ((_ is ValueCellFull!1136) mapDefault!4949)) b!145841))

(assert (= b!145846 b!145836))

(assert (= b!145847 b!145846))

(assert (= b!145835 b!145847))

(assert (= start!15194 b!145835))

(assert (= (and b!145844 condMapEmpty!4950) mapIsEmpty!4950))

(assert (= (and b!145844 (not condMapEmpty!4950)) mapNonEmpty!4950))

(assert (= (and mapNonEmpty!4950 ((_ is ValueCellFull!1136) mapValue!4949)) b!145838))

(assert (= (and b!145844 ((_ is ValueCellFull!1136) mapDefault!4950)) b!145849))

(assert (= b!145839 b!145844))

(assert (= start!15194 b!145839))

(declare-fun b_lambda!6545 () Bool)

(assert (=> (not b_lambda!6545) (not b!145848)))

(declare-fun t!6402 () Bool)

(declare-fun tb!2621 () Bool)

(assert (=> (and b!145846 (= (defaultEntry!3006 (v!3341 (underlying!494 thiss!992))) (defaultEntry!3006 (v!3341 (underlying!494 thiss!992)))) t!6402) tb!2621))

(declare-fun result!4291 () Bool)

(assert (=> tb!2621 (= result!4291 tp_is_empty!2959)))

(assert (=> b!145848 t!6402))

(declare-fun b_and!9093 () Bool)

(assert (= b_and!9089 (and (=> t!6402 result!4291) b_and!9093)))

(declare-fun tb!2623 () Bool)

(declare-fun t!6404 () Bool)

(assert (=> (and b!145839 (= (defaultEntry!3006 newMap!16) (defaultEntry!3006 (v!3341 (underlying!494 thiss!992)))) t!6404) tb!2623))

(declare-fun result!4295 () Bool)

(assert (= result!4295 result!4291))

(assert (=> b!145848 t!6404))

(declare-fun b_and!9095 () Bool)

(assert (= b_and!9091 (and (=> t!6404 result!4295) b_and!9095)))

(declare-fun m!175653 () Bool)

(assert (=> b!145840 m!175653))

(declare-fun m!175655 () Bool)

(assert (=> b!145840 m!175655))

(declare-fun m!175657 () Bool)

(assert (=> b!145840 m!175657))

(declare-fun m!175659 () Bool)

(assert (=> b!145840 m!175659))

(assert (=> b!145840 m!175657))

(assert (=> b!145840 m!175657))

(declare-fun m!175661 () Bool)

(assert (=> b!145840 m!175661))

(assert (=> b!145840 m!175657))

(declare-fun m!175663 () Bool)

(assert (=> b!145840 m!175663))

(declare-fun m!175665 () Bool)

(assert (=> mapNonEmpty!4950 m!175665))

(declare-fun m!175667 () Bool)

(assert (=> b!145848 m!175667))

(declare-fun m!175669 () Bool)

(assert (=> b!145848 m!175669))

(declare-fun m!175671 () Bool)

(assert (=> b!145848 m!175671))

(assert (=> b!145848 m!175657))

(declare-fun m!175673 () Bool)

(assert (=> b!145848 m!175673))

(assert (=> b!145848 m!175657))

(assert (=> b!145848 m!175669))

(assert (=> b!145848 m!175657))

(assert (=> b!145848 m!175671))

(declare-fun m!175675 () Bool)

(assert (=> b!145848 m!175675))

(assert (=> b!145848 m!175667))

(declare-fun m!175677 () Bool)

(assert (=> b!145839 m!175677))

(declare-fun m!175679 () Bool)

(assert (=> b!145839 m!175679))

(declare-fun m!175681 () Bool)

(assert (=> mapNonEmpty!4949 m!175681))

(assert (=> b!145843 m!175657))

(declare-fun m!175683 () Bool)

(assert (=> b!145843 m!175683))

(declare-fun m!175685 () Bool)

(assert (=> b!145843 m!175685))

(declare-fun m!175687 () Bool)

(assert (=> start!15194 m!175687))

(declare-fun m!175689 () Bool)

(assert (=> b!145842 m!175689))

(declare-fun m!175691 () Bool)

(assert (=> b!145846 m!175691))

(declare-fun m!175693 () Bool)

(assert (=> b!145846 m!175693))

(check-sat (not b!145839) (not b!145848) (not b!145840) tp_is_empty!2959 (not start!15194) (not b!145843) (not b!145842) b_and!9095 (not b_next!3087) b_and!9093 (not mapNonEmpty!4949) (not b_lambda!6545) (not b_next!3085) (not b!145846) (not mapNonEmpty!4950))
(check-sat b_and!9093 b_and!9095 (not b_next!3085) (not b_next!3087))
