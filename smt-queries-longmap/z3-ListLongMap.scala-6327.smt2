; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81646 () Bool)

(assert start!81646)

(declare-fun b!953110 () Bool)

(declare-fun b_free!18283 () Bool)

(declare-fun b_next!18283 () Bool)

(assert (=> b!953110 (= b_free!18283 (not b_next!18283))))

(declare-fun tp!63469 () Bool)

(declare-fun b_and!29771 () Bool)

(assert (=> b!953110 (= tp!63469 b_and!29771)))

(declare-fun b!953106 () Bool)

(declare-fun res!638299 () Bool)

(declare-fun e!536829 () Bool)

(assert (=> b!953106 (=> (not res!638299) (not e!536829))))

(declare-datatypes ((V!32687 0))(
  ( (V!32688 (val!10446 Int)) )
))
(declare-datatypes ((ValueCell!9914 0))(
  ( (ValueCellFull!9914 (v!12993 V!32687)) (EmptyCell!9914) )
))
(declare-datatypes ((array!57665 0))(
  ( (array!57666 (arr!27721 (Array (_ BitVec 32) ValueCell!9914)) (size!28201 (_ BitVec 32))) )
))
(declare-datatypes ((array!57667 0))(
  ( (array!57668 (arr!27722 (Array (_ BitVec 32) (_ BitVec 64))) (size!28202 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4978 0))(
  ( (LongMapFixedSize!4979 (defaultEntry!5818 Int) (mask!27703 (_ BitVec 32)) (extraKeys!5550 (_ BitVec 32)) (zeroValue!5654 V!32687) (minValue!5654 V!32687) (_size!2544 (_ BitVec 32)) (_keys!10798 array!57667) (_values!5841 array!57665) (_vacant!2544 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4978)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13560 0))(
  ( (tuple2!13561 (_1!6791 (_ BitVec 64)) (_2!6791 V!32687)) )
))
(declare-datatypes ((List!19349 0))(
  ( (Nil!19346) (Cons!19345 (h!20513 tuple2!13560) (t!27694 List!19349)) )
))
(declare-datatypes ((ListLongMap!12259 0))(
  ( (ListLongMap!12260 (toList!6145 List!19349)) )
))
(declare-fun contains!5251 (ListLongMap!12259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3378 (array!57667 array!57665 (_ BitVec 32) (_ BitVec 32) V!32687 V!32687 (_ BitVec 32) Int) ListLongMap!12259)

(assert (=> b!953106 (= res!638299 (contains!5251 (getCurrentListMap!3378 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)) key!756))))

(declare-fun b!953107 () Bool)

(declare-fun res!638301 () Bool)

(assert (=> b!953107 (=> (not res!638301) (not e!536829))))

(assert (=> b!953107 (= res!638301 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!953108 () Bool)

(declare-fun e!536824 () Bool)

(declare-fun tp_is_empty!20791 () Bool)

(assert (=> b!953108 (= e!536824 tp_is_empty!20791)))

(declare-fun b!953109 () Bool)

(declare-fun e!536823 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57667 (_ BitVec 32)) Bool)

(assert (=> b!953109 (= e!536823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10798 thiss!1141) (mask!27703 thiss!1141)))))

(declare-fun mapIsEmpty!33121 () Bool)

(declare-fun mapRes!33121 () Bool)

(assert (=> mapIsEmpty!33121 mapRes!33121))

(declare-fun e!536828 () Bool)

(declare-fun e!536827 () Bool)

(declare-fun array_inv!21590 (array!57667) Bool)

(declare-fun array_inv!21591 (array!57665) Bool)

(assert (=> b!953110 (= e!536828 (and tp!63469 tp_is_empty!20791 (array_inv!21590 (_keys!10798 thiss!1141)) (array_inv!21591 (_values!5841 thiss!1141)) e!536827))))

(declare-fun b!953111 () Bool)

(declare-fun res!638300 () Bool)

(assert (=> b!953111 (=> res!638300 e!536823)))

(assert (=> b!953111 (= res!638300 (not (= (size!28202 (_keys!10798 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27703 thiss!1141)))))))

(declare-fun b!953112 () Bool)

(declare-fun e!536825 () Bool)

(assert (=> b!953112 (= e!536827 (and e!536825 mapRes!33121))))

(declare-fun condMapEmpty!33121 () Bool)

(declare-fun mapDefault!33121 () ValueCell!9914)

(assert (=> b!953112 (= condMapEmpty!33121 (= (arr!27721 (_values!5841 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9914)) mapDefault!33121)))))

(declare-fun mapNonEmpty!33121 () Bool)

(declare-fun tp!63468 () Bool)

(assert (=> mapNonEmpty!33121 (= mapRes!33121 (and tp!63468 e!536824))))

(declare-fun mapKey!33121 () (_ BitVec 32))

(declare-fun mapValue!33121 () ValueCell!9914)

(declare-fun mapRest!33121 () (Array (_ BitVec 32) ValueCell!9914))

(assert (=> mapNonEmpty!33121 (= (arr!27721 (_values!5841 thiss!1141)) (store mapRest!33121 mapKey!33121 mapValue!33121))))

(declare-fun b!953105 () Bool)

(assert (=> b!953105 (= e!536829 (not e!536823))))

(declare-fun res!638303 () Bool)

(assert (=> b!953105 (=> res!638303 e!536823)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!953105 (= res!638303 (not (validMask!0 (mask!27703 thiss!1141))))))

(declare-fun lt!429386 () (_ BitVec 32))

(assert (=> b!953105 (arrayForallSeekEntryOrOpenFound!0 lt!429386 (_keys!10798 thiss!1141) (mask!27703 thiss!1141))))

(declare-datatypes ((Unit!32018 0))(
  ( (Unit!32019) )
))
(declare-fun lt!429387 () Unit!32018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32018)

(assert (=> b!953105 (= lt!429387 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10798 thiss!1141) (mask!27703 thiss!1141) #b00000000000000000000000000000000 lt!429386))))

(declare-fun arrayScanForKey!0 (array!57667 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!953105 (= lt!429386 (arrayScanForKey!0 (_keys!10798 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953105 (arrayContainsKey!0 (_keys!10798 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429388 () Unit!32018)

(declare-fun lemmaKeyInListMapIsInArray!330 (array!57667 array!57665 (_ BitVec 32) (_ BitVec 32) V!32687 V!32687 (_ BitVec 64) Int) Unit!32018)

(assert (=> b!953105 (= lt!429388 (lemmaKeyInListMapIsInArray!330 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) key!756 (defaultEntry!5818 thiss!1141)))))

(declare-fun res!638302 () Bool)

(assert (=> start!81646 (=> (not res!638302) (not e!536829))))

(declare-fun valid!1902 (LongMapFixedSize!4978) Bool)

(assert (=> start!81646 (= res!638302 (valid!1902 thiss!1141))))

(assert (=> start!81646 e!536829))

(assert (=> start!81646 e!536828))

(assert (=> start!81646 true))

(declare-fun b!953113 () Bool)

(declare-fun res!638298 () Bool)

(assert (=> b!953113 (=> (not res!638298) (not e!536829))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9117 0))(
  ( (MissingZero!9117 (index!38839 (_ BitVec 32))) (Found!9117 (index!38840 (_ BitVec 32))) (Intermediate!9117 (undefined!9929 Bool) (index!38841 (_ BitVec 32)) (x!81891 (_ BitVec 32))) (Undefined!9117) (MissingVacant!9117 (index!38842 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57667 (_ BitVec 32)) SeekEntryResult!9117)

(assert (=> b!953113 (= res!638298 (not ((_ is Found!9117) (seekEntry!0 key!756 (_keys!10798 thiss!1141) (mask!27703 thiss!1141)))))))

(declare-fun b!953114 () Bool)

(assert (=> b!953114 (= e!536825 tp_is_empty!20791)))

(assert (= (and start!81646 res!638302) b!953107))

(assert (= (and b!953107 res!638301) b!953113))

(assert (= (and b!953113 res!638298) b!953106))

(assert (= (and b!953106 res!638299) b!953105))

(assert (= (and b!953105 (not res!638303)) b!953111))

(assert (= (and b!953111 (not res!638300)) b!953109))

(assert (= (and b!953112 condMapEmpty!33121) mapIsEmpty!33121))

(assert (= (and b!953112 (not condMapEmpty!33121)) mapNonEmpty!33121))

(assert (= (and mapNonEmpty!33121 ((_ is ValueCellFull!9914) mapValue!33121)) b!953108))

(assert (= (and b!953112 ((_ is ValueCellFull!9914) mapDefault!33121)) b!953114))

(assert (= b!953110 b!953112))

(assert (= start!81646 b!953110))

(declare-fun m!885691 () Bool)

(assert (=> b!953113 m!885691))

(declare-fun m!885693 () Bool)

(assert (=> b!953106 m!885693))

(assert (=> b!953106 m!885693))

(declare-fun m!885695 () Bool)

(assert (=> b!953106 m!885695))

(declare-fun m!885697 () Bool)

(assert (=> start!81646 m!885697))

(declare-fun m!885699 () Bool)

(assert (=> b!953110 m!885699))

(declare-fun m!885701 () Bool)

(assert (=> b!953110 m!885701))

(declare-fun m!885703 () Bool)

(assert (=> b!953105 m!885703))

(declare-fun m!885705 () Bool)

(assert (=> b!953105 m!885705))

(declare-fun m!885707 () Bool)

(assert (=> b!953105 m!885707))

(declare-fun m!885709 () Bool)

(assert (=> b!953105 m!885709))

(declare-fun m!885711 () Bool)

(assert (=> b!953105 m!885711))

(declare-fun m!885713 () Bool)

(assert (=> b!953105 m!885713))

(declare-fun m!885715 () Bool)

(assert (=> mapNonEmpty!33121 m!885715))

(declare-fun m!885717 () Bool)

(assert (=> b!953109 m!885717))

(check-sat (not mapNonEmpty!33121) (not b_next!18283) (not b!953109) (not b!953113) (not b!953105) (not start!81646) (not b!953106) b_and!29771 (not b!953110) tp_is_empty!20791)
(check-sat b_and!29771 (not b_next!18283))
(get-model)

(declare-fun b!953183 () Bool)

(declare-fun e!536878 () Bool)

(declare-fun call!41597 () Bool)

(assert (=> b!953183 (= e!536878 call!41597)))

(declare-fun b!953184 () Bool)

(declare-fun e!536880 () Bool)

(assert (=> b!953184 (= e!536880 call!41597)))

(declare-fun bm!41594 () Bool)

(assert (=> bm!41594 (= call!41597 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10798 thiss!1141) (mask!27703 thiss!1141)))))

(declare-fun b!953185 () Bool)

(assert (=> b!953185 (= e!536878 e!536880)))

(declare-fun lt!429415 () (_ BitVec 64))

(assert (=> b!953185 (= lt!429415 (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429413 () Unit!32018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57667 (_ BitVec 64) (_ BitVec 32)) Unit!32018)

(assert (=> b!953185 (= lt!429413 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10798 thiss!1141) lt!429415 #b00000000000000000000000000000000))))

(assert (=> b!953185 (arrayContainsKey!0 (_keys!10798 thiss!1141) lt!429415 #b00000000000000000000000000000000)))

(declare-fun lt!429414 () Unit!32018)

(assert (=> b!953185 (= lt!429414 lt!429413)))

(declare-fun res!638345 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57667 (_ BitVec 32)) SeekEntryResult!9117)

(assert (=> b!953185 (= res!638345 (= (seekEntryOrOpen!0 (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000) (_keys!10798 thiss!1141) (mask!27703 thiss!1141)) (Found!9117 #b00000000000000000000000000000000)))))

(assert (=> b!953185 (=> (not res!638345) (not e!536880))))

(declare-fun d!115825 () Bool)

(declare-fun res!638344 () Bool)

(declare-fun e!536879 () Bool)

(assert (=> d!115825 (=> res!638344 e!536879)))

(assert (=> d!115825 (= res!638344 (bvsge #b00000000000000000000000000000000 (size!28202 (_keys!10798 thiss!1141))))))

(assert (=> d!115825 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10798 thiss!1141) (mask!27703 thiss!1141)) e!536879)))

(declare-fun b!953186 () Bool)

(assert (=> b!953186 (= e!536879 e!536878)))

(declare-fun c!99889 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953186 (= c!99889 (validKeyInArray!0 (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115825 (not res!638344)) b!953186))

(assert (= (and b!953186 c!99889) b!953185))

(assert (= (and b!953186 (not c!99889)) b!953183))

(assert (= (and b!953185 res!638345) b!953184))

(assert (= (or b!953184 b!953183) bm!41594))

(declare-fun m!885775 () Bool)

(assert (=> bm!41594 m!885775))

(declare-fun m!885777 () Bool)

(assert (=> b!953185 m!885777))

(declare-fun m!885779 () Bool)

(assert (=> b!953185 m!885779))

(declare-fun m!885781 () Bool)

(assert (=> b!953185 m!885781))

(assert (=> b!953185 m!885777))

(declare-fun m!885783 () Bool)

(assert (=> b!953185 m!885783))

(assert (=> b!953186 m!885777))

(assert (=> b!953186 m!885777))

(declare-fun m!885785 () Bool)

(assert (=> b!953186 m!885785))

(assert (=> b!953109 d!115825))

(declare-fun b!953199 () Bool)

(declare-fun e!536888 () SeekEntryResult!9117)

(declare-fun e!536887 () SeekEntryResult!9117)

(assert (=> b!953199 (= e!536888 e!536887)))

(declare-fun lt!429426 () (_ BitVec 64))

(declare-fun lt!429424 () SeekEntryResult!9117)

(assert (=> b!953199 (= lt!429426 (select (arr!27722 (_keys!10798 thiss!1141)) (index!38841 lt!429424)))))

(declare-fun c!99896 () Bool)

(assert (=> b!953199 (= c!99896 (= lt!429426 key!756))))

(declare-fun b!953200 () Bool)

(declare-fun c!99897 () Bool)

(assert (=> b!953200 (= c!99897 (= lt!429426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!536889 () SeekEntryResult!9117)

(assert (=> b!953200 (= e!536887 e!536889)))

(declare-fun b!953201 () Bool)

(assert (=> b!953201 (= e!536887 (Found!9117 (index!38841 lt!429424)))))

(declare-fun b!953202 () Bool)

(assert (=> b!953202 (= e!536888 Undefined!9117)))

(declare-fun d!115827 () Bool)

(declare-fun lt!429427 () SeekEntryResult!9117)

(assert (=> d!115827 (and (or ((_ is MissingVacant!9117) lt!429427) (not ((_ is Found!9117) lt!429427)) (and (bvsge (index!38840 lt!429427) #b00000000000000000000000000000000) (bvslt (index!38840 lt!429427) (size!28202 (_keys!10798 thiss!1141))))) (not ((_ is MissingVacant!9117) lt!429427)) (or (not ((_ is Found!9117) lt!429427)) (= (select (arr!27722 (_keys!10798 thiss!1141)) (index!38840 lt!429427)) key!756)))))

(assert (=> d!115827 (= lt!429427 e!536888)))

(declare-fun c!99898 () Bool)

(assert (=> d!115827 (= c!99898 (and ((_ is Intermediate!9117) lt!429424) (undefined!9929 lt!429424)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57667 (_ BitVec 32)) SeekEntryResult!9117)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115827 (= lt!429424 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27703 thiss!1141)) key!756 (_keys!10798 thiss!1141) (mask!27703 thiss!1141)))))

(assert (=> d!115827 (validMask!0 (mask!27703 thiss!1141))))

(assert (=> d!115827 (= (seekEntry!0 key!756 (_keys!10798 thiss!1141) (mask!27703 thiss!1141)) lt!429427)))

(declare-fun b!953203 () Bool)

(declare-fun lt!429425 () SeekEntryResult!9117)

(assert (=> b!953203 (= e!536889 (ite ((_ is MissingVacant!9117) lt!429425) (MissingZero!9117 (index!38842 lt!429425)) lt!429425))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57667 (_ BitVec 32)) SeekEntryResult!9117)

(assert (=> b!953203 (= lt!429425 (seekKeyOrZeroReturnVacant!0 (x!81891 lt!429424) (index!38841 lt!429424) (index!38841 lt!429424) key!756 (_keys!10798 thiss!1141) (mask!27703 thiss!1141)))))

(declare-fun b!953204 () Bool)

(assert (=> b!953204 (= e!536889 (MissingZero!9117 (index!38841 lt!429424)))))

(assert (= (and d!115827 c!99898) b!953202))

(assert (= (and d!115827 (not c!99898)) b!953199))

(assert (= (and b!953199 c!99896) b!953201))

(assert (= (and b!953199 (not c!99896)) b!953200))

(assert (= (and b!953200 c!99897) b!953204))

(assert (= (and b!953200 (not c!99897)) b!953203))

(declare-fun m!885787 () Bool)

(assert (=> b!953199 m!885787))

(declare-fun m!885789 () Bool)

(assert (=> d!115827 m!885789))

(declare-fun m!885791 () Bool)

(assert (=> d!115827 m!885791))

(assert (=> d!115827 m!885791))

(declare-fun m!885793 () Bool)

(assert (=> d!115827 m!885793))

(assert (=> d!115827 m!885709))

(declare-fun m!885795 () Bool)

(assert (=> b!953203 m!885795))

(assert (=> b!953113 d!115827))

(declare-fun d!115829 () Bool)

(declare-fun res!638352 () Bool)

(declare-fun e!536892 () Bool)

(assert (=> d!115829 (=> (not res!638352) (not e!536892))))

(declare-fun simpleValid!381 (LongMapFixedSize!4978) Bool)

(assert (=> d!115829 (= res!638352 (simpleValid!381 thiss!1141))))

(assert (=> d!115829 (= (valid!1902 thiss!1141) e!536892)))

(declare-fun b!953211 () Bool)

(declare-fun res!638353 () Bool)

(assert (=> b!953211 (=> (not res!638353) (not e!536892))))

(declare-fun arrayCountValidKeys!0 (array!57667 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!953211 (= res!638353 (= (arrayCountValidKeys!0 (_keys!10798 thiss!1141) #b00000000000000000000000000000000 (size!28202 (_keys!10798 thiss!1141))) (_size!2544 thiss!1141)))))

(declare-fun b!953212 () Bool)

(declare-fun res!638354 () Bool)

(assert (=> b!953212 (=> (not res!638354) (not e!536892))))

(assert (=> b!953212 (= res!638354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10798 thiss!1141) (mask!27703 thiss!1141)))))

(declare-fun b!953213 () Bool)

(declare-datatypes ((List!19351 0))(
  ( (Nil!19348) (Cons!19347 (h!20515 (_ BitVec 64)) (t!27698 List!19351)) )
))
(declare-fun arrayNoDuplicates!0 (array!57667 (_ BitVec 32) List!19351) Bool)

(assert (=> b!953213 (= e!536892 (arrayNoDuplicates!0 (_keys!10798 thiss!1141) #b00000000000000000000000000000000 Nil!19348))))

(assert (= (and d!115829 res!638352) b!953211))

(assert (= (and b!953211 res!638353) b!953212))

(assert (= (and b!953212 res!638354) b!953213))

(declare-fun m!885797 () Bool)

(assert (=> d!115829 m!885797))

(declare-fun m!885799 () Bool)

(assert (=> b!953211 m!885799))

(assert (=> b!953212 m!885717))

(declare-fun m!885801 () Bool)

(assert (=> b!953213 m!885801))

(assert (=> start!81646 d!115829))

(declare-fun d!115831 () Bool)

(declare-fun res!638359 () Bool)

(declare-fun e!536897 () Bool)

(assert (=> d!115831 (=> res!638359 e!536897)))

(assert (=> d!115831 (= res!638359 (= (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115831 (= (arrayContainsKey!0 (_keys!10798 thiss!1141) key!756 #b00000000000000000000000000000000) e!536897)))

(declare-fun b!953218 () Bool)

(declare-fun e!536898 () Bool)

(assert (=> b!953218 (= e!536897 e!536898)))

(declare-fun res!638360 () Bool)

(assert (=> b!953218 (=> (not res!638360) (not e!536898))))

(assert (=> b!953218 (= res!638360 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28202 (_keys!10798 thiss!1141))))))

(declare-fun b!953219 () Bool)

(assert (=> b!953219 (= e!536898 (arrayContainsKey!0 (_keys!10798 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115831 (not res!638359)) b!953218))

(assert (= (and b!953218 res!638360) b!953219))

(assert (=> d!115831 m!885777))

(declare-fun m!885803 () Bool)

(assert (=> b!953219 m!885803))

(assert (=> b!953105 d!115831))

(declare-fun d!115833 () Bool)

(declare-fun e!536901 () Bool)

(assert (=> d!115833 e!536901))

(declare-fun c!99901 () Bool)

(assert (=> d!115833 (= c!99901 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429430 () Unit!32018)

(declare-fun choose!1603 (array!57667 array!57665 (_ BitVec 32) (_ BitVec 32) V!32687 V!32687 (_ BitVec 64) Int) Unit!32018)

(assert (=> d!115833 (= lt!429430 (choose!1603 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) key!756 (defaultEntry!5818 thiss!1141)))))

(assert (=> d!115833 (validMask!0 (mask!27703 thiss!1141))))

(assert (=> d!115833 (= (lemmaKeyInListMapIsInArray!330 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) key!756 (defaultEntry!5818 thiss!1141)) lt!429430)))

(declare-fun b!953224 () Bool)

(assert (=> b!953224 (= e!536901 (arrayContainsKey!0 (_keys!10798 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!953225 () Bool)

(assert (=> b!953225 (= e!536901 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115833 c!99901) b!953224))

(assert (= (and d!115833 (not c!99901)) b!953225))

(declare-fun m!885805 () Bool)

(assert (=> d!115833 m!885805))

(assert (=> d!115833 m!885709))

(assert (=> b!953224 m!885713))

(assert (=> b!953105 d!115833))

(declare-fun d!115835 () Bool)

(declare-fun lt!429433 () (_ BitVec 32))

(assert (=> d!115835 (and (or (bvslt lt!429433 #b00000000000000000000000000000000) (bvsge lt!429433 (size!28202 (_keys!10798 thiss!1141))) (and (bvsge lt!429433 #b00000000000000000000000000000000) (bvslt lt!429433 (size!28202 (_keys!10798 thiss!1141))))) (bvsge lt!429433 #b00000000000000000000000000000000) (bvslt lt!429433 (size!28202 (_keys!10798 thiss!1141))) (= (select (arr!27722 (_keys!10798 thiss!1141)) lt!429433) key!756))))

(declare-fun e!536904 () (_ BitVec 32))

(assert (=> d!115835 (= lt!429433 e!536904)))

(declare-fun c!99904 () Bool)

(assert (=> d!115835 (= c!99904 (= (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28202 (_keys!10798 thiss!1141))) (bvslt (size!28202 (_keys!10798 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115835 (= (arrayScanForKey!0 (_keys!10798 thiss!1141) key!756 #b00000000000000000000000000000000) lt!429433)))

(declare-fun b!953230 () Bool)

(assert (=> b!953230 (= e!536904 #b00000000000000000000000000000000)))

(declare-fun b!953231 () Bool)

(assert (=> b!953231 (= e!536904 (arrayScanForKey!0 (_keys!10798 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115835 c!99904) b!953230))

(assert (= (and d!115835 (not c!99904)) b!953231))

(declare-fun m!885807 () Bool)

(assert (=> d!115835 m!885807))

(assert (=> d!115835 m!885777))

(declare-fun m!885809 () Bool)

(assert (=> b!953231 m!885809))

(assert (=> b!953105 d!115835))

(declare-fun d!115837 () Bool)

(assert (=> d!115837 (arrayForallSeekEntryOrOpenFound!0 lt!429386 (_keys!10798 thiss!1141) (mask!27703 thiss!1141))))

(declare-fun lt!429436 () Unit!32018)

(declare-fun choose!38 (array!57667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32018)

(assert (=> d!115837 (= lt!429436 (choose!38 (_keys!10798 thiss!1141) (mask!27703 thiss!1141) #b00000000000000000000000000000000 lt!429386))))

(assert (=> d!115837 (validMask!0 (mask!27703 thiss!1141))))

(assert (=> d!115837 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10798 thiss!1141) (mask!27703 thiss!1141) #b00000000000000000000000000000000 lt!429386) lt!429436)))

(declare-fun bs!26772 () Bool)

(assert (= bs!26772 d!115837))

(assert (=> bs!26772 m!885703))

(declare-fun m!885811 () Bool)

(assert (=> bs!26772 m!885811))

(assert (=> bs!26772 m!885709))

(assert (=> b!953105 d!115837))

(declare-fun d!115839 () Bool)

(assert (=> d!115839 (= (validMask!0 (mask!27703 thiss!1141)) (and (or (= (mask!27703 thiss!1141) #b00000000000000000000000000000111) (= (mask!27703 thiss!1141) #b00000000000000000000000000001111) (= (mask!27703 thiss!1141) #b00000000000000000000000000011111) (= (mask!27703 thiss!1141) #b00000000000000000000000000111111) (= (mask!27703 thiss!1141) #b00000000000000000000000001111111) (= (mask!27703 thiss!1141) #b00000000000000000000000011111111) (= (mask!27703 thiss!1141) #b00000000000000000000000111111111) (= (mask!27703 thiss!1141) #b00000000000000000000001111111111) (= (mask!27703 thiss!1141) #b00000000000000000000011111111111) (= (mask!27703 thiss!1141) #b00000000000000000000111111111111) (= (mask!27703 thiss!1141) #b00000000000000000001111111111111) (= (mask!27703 thiss!1141) #b00000000000000000011111111111111) (= (mask!27703 thiss!1141) #b00000000000000000111111111111111) (= (mask!27703 thiss!1141) #b00000000000000001111111111111111) (= (mask!27703 thiss!1141) #b00000000000000011111111111111111) (= (mask!27703 thiss!1141) #b00000000000000111111111111111111) (= (mask!27703 thiss!1141) #b00000000000001111111111111111111) (= (mask!27703 thiss!1141) #b00000000000011111111111111111111) (= (mask!27703 thiss!1141) #b00000000000111111111111111111111) (= (mask!27703 thiss!1141) #b00000000001111111111111111111111) (= (mask!27703 thiss!1141) #b00000000011111111111111111111111) (= (mask!27703 thiss!1141) #b00000000111111111111111111111111) (= (mask!27703 thiss!1141) #b00000001111111111111111111111111) (= (mask!27703 thiss!1141) #b00000011111111111111111111111111) (= (mask!27703 thiss!1141) #b00000111111111111111111111111111) (= (mask!27703 thiss!1141) #b00001111111111111111111111111111) (= (mask!27703 thiss!1141) #b00011111111111111111111111111111) (= (mask!27703 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27703 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!953105 d!115839))

(declare-fun b!953232 () Bool)

(declare-fun e!536905 () Bool)

(declare-fun call!41598 () Bool)

(assert (=> b!953232 (= e!536905 call!41598)))

(declare-fun b!953233 () Bool)

(declare-fun e!536907 () Bool)

(assert (=> b!953233 (= e!536907 call!41598)))

(declare-fun bm!41595 () Bool)

(assert (=> bm!41595 (= call!41598 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429386 #b00000000000000000000000000000001) (_keys!10798 thiss!1141) (mask!27703 thiss!1141)))))

(declare-fun b!953234 () Bool)

(assert (=> b!953234 (= e!536905 e!536907)))

(declare-fun lt!429439 () (_ BitVec 64))

(assert (=> b!953234 (= lt!429439 (select (arr!27722 (_keys!10798 thiss!1141)) lt!429386))))

(declare-fun lt!429437 () Unit!32018)

(assert (=> b!953234 (= lt!429437 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10798 thiss!1141) lt!429439 lt!429386))))

(assert (=> b!953234 (arrayContainsKey!0 (_keys!10798 thiss!1141) lt!429439 #b00000000000000000000000000000000)))

(declare-fun lt!429438 () Unit!32018)

(assert (=> b!953234 (= lt!429438 lt!429437)))

(declare-fun res!638362 () Bool)

(assert (=> b!953234 (= res!638362 (= (seekEntryOrOpen!0 (select (arr!27722 (_keys!10798 thiss!1141)) lt!429386) (_keys!10798 thiss!1141) (mask!27703 thiss!1141)) (Found!9117 lt!429386)))))

(assert (=> b!953234 (=> (not res!638362) (not e!536907))))

(declare-fun d!115841 () Bool)

(declare-fun res!638361 () Bool)

(declare-fun e!536906 () Bool)

(assert (=> d!115841 (=> res!638361 e!536906)))

(assert (=> d!115841 (= res!638361 (bvsge lt!429386 (size!28202 (_keys!10798 thiss!1141))))))

(assert (=> d!115841 (= (arrayForallSeekEntryOrOpenFound!0 lt!429386 (_keys!10798 thiss!1141) (mask!27703 thiss!1141)) e!536906)))

(declare-fun b!953235 () Bool)

(assert (=> b!953235 (= e!536906 e!536905)))

(declare-fun c!99905 () Bool)

(assert (=> b!953235 (= c!99905 (validKeyInArray!0 (select (arr!27722 (_keys!10798 thiss!1141)) lt!429386)))))

(assert (= (and d!115841 (not res!638361)) b!953235))

(assert (= (and b!953235 c!99905) b!953234))

(assert (= (and b!953235 (not c!99905)) b!953232))

(assert (= (and b!953234 res!638362) b!953233))

(assert (= (or b!953233 b!953232) bm!41595))

(declare-fun m!885813 () Bool)

(assert (=> bm!41595 m!885813))

(declare-fun m!885815 () Bool)

(assert (=> b!953234 m!885815))

(declare-fun m!885817 () Bool)

(assert (=> b!953234 m!885817))

(declare-fun m!885819 () Bool)

(assert (=> b!953234 m!885819))

(assert (=> b!953234 m!885815))

(declare-fun m!885821 () Bool)

(assert (=> b!953234 m!885821))

(assert (=> b!953235 m!885815))

(assert (=> b!953235 m!885815))

(declare-fun m!885823 () Bool)

(assert (=> b!953235 m!885823))

(assert (=> b!953105 d!115841))

(declare-fun d!115843 () Bool)

(assert (=> d!115843 (= (array_inv!21590 (_keys!10798 thiss!1141)) (bvsge (size!28202 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953110 d!115843))

(declare-fun d!115845 () Bool)

(assert (=> d!115845 (= (array_inv!21591 (_values!5841 thiss!1141)) (bvsge (size!28201 (_values!5841 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953110 d!115845))

(declare-fun d!115847 () Bool)

(declare-fun e!536913 () Bool)

(assert (=> d!115847 e!536913))

(declare-fun res!638365 () Bool)

(assert (=> d!115847 (=> res!638365 e!536913)))

(declare-fun lt!429448 () Bool)

(assert (=> d!115847 (= res!638365 (not lt!429448))))

(declare-fun lt!429449 () Bool)

(assert (=> d!115847 (= lt!429448 lt!429449)))

(declare-fun lt!429451 () Unit!32018)

(declare-fun e!536912 () Unit!32018)

(assert (=> d!115847 (= lt!429451 e!536912)))

(declare-fun c!99908 () Bool)

(assert (=> d!115847 (= c!99908 lt!429449)))

(declare-fun containsKey!473 (List!19349 (_ BitVec 64)) Bool)

(assert (=> d!115847 (= lt!429449 (containsKey!473 (toList!6145 (getCurrentListMap!3378 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141))) key!756))))

(assert (=> d!115847 (= (contains!5251 (getCurrentListMap!3378 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)) key!756) lt!429448)))

(declare-fun b!953242 () Bool)

(declare-fun lt!429450 () Unit!32018)

(assert (=> b!953242 (= e!536912 lt!429450)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!367 (List!19349 (_ BitVec 64)) Unit!32018)

(assert (=> b!953242 (= lt!429450 (lemmaContainsKeyImpliesGetValueByKeyDefined!367 (toList!6145 (getCurrentListMap!3378 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141))) key!756))))

(declare-datatypes ((Option!508 0))(
  ( (Some!507 (v!12996 V!32687)) (None!506) )
))
(declare-fun isDefined!375 (Option!508) Bool)

(declare-fun getValueByKey!502 (List!19349 (_ BitVec 64)) Option!508)

(assert (=> b!953242 (isDefined!375 (getValueByKey!502 (toList!6145 (getCurrentListMap!3378 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141))) key!756))))

(declare-fun b!953243 () Bool)

(declare-fun Unit!32022 () Unit!32018)

(assert (=> b!953243 (= e!536912 Unit!32022)))

(declare-fun b!953244 () Bool)

(assert (=> b!953244 (= e!536913 (isDefined!375 (getValueByKey!502 (toList!6145 (getCurrentListMap!3378 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141))) key!756)))))

(assert (= (and d!115847 c!99908) b!953242))

(assert (= (and d!115847 (not c!99908)) b!953243))

(assert (= (and d!115847 (not res!638365)) b!953244))

(declare-fun m!885825 () Bool)

(assert (=> d!115847 m!885825))

(declare-fun m!885827 () Bool)

(assert (=> b!953242 m!885827))

(declare-fun m!885829 () Bool)

(assert (=> b!953242 m!885829))

(assert (=> b!953242 m!885829))

(declare-fun m!885831 () Bool)

(assert (=> b!953242 m!885831))

(assert (=> b!953244 m!885829))

(assert (=> b!953244 m!885829))

(assert (=> b!953244 m!885831))

(assert (=> b!953106 d!115847))

(declare-fun b!953287 () Bool)

(declare-fun e!536951 () Bool)

(declare-fun call!41614 () Bool)

(assert (=> b!953287 (= e!536951 (not call!41614))))

(declare-fun d!115849 () Bool)

(declare-fun e!536942 () Bool)

(assert (=> d!115849 e!536942))

(declare-fun res!638390 () Bool)

(assert (=> d!115849 (=> (not res!638390) (not e!536942))))

(assert (=> d!115849 (= res!638390 (or (bvsge #b00000000000000000000000000000000 (size!28202 (_keys!10798 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28202 (_keys!10798 thiss!1141))))))))

(declare-fun lt!429498 () ListLongMap!12259)

(declare-fun lt!429513 () ListLongMap!12259)

(assert (=> d!115849 (= lt!429498 lt!429513)))

(declare-fun lt!429511 () Unit!32018)

(declare-fun e!536945 () Unit!32018)

(assert (=> d!115849 (= lt!429511 e!536945)))

(declare-fun c!99925 () Bool)

(declare-fun e!536941 () Bool)

(assert (=> d!115849 (= c!99925 e!536941)))

(declare-fun res!638384 () Bool)

(assert (=> d!115849 (=> (not res!638384) (not e!536941))))

(assert (=> d!115849 (= res!638384 (bvslt #b00000000000000000000000000000000 (size!28202 (_keys!10798 thiss!1141))))))

(declare-fun e!536949 () ListLongMap!12259)

(assert (=> d!115849 (= lt!429513 e!536949)))

(declare-fun c!99922 () Bool)

(assert (=> d!115849 (= c!99922 (and (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115849 (validMask!0 (mask!27703 thiss!1141))))

(assert (=> d!115849 (= (getCurrentListMap!3378 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)) lt!429498)))

(declare-fun b!953288 () Bool)

(declare-fun e!536952 () Bool)

(declare-fun apply!894 (ListLongMap!12259 (_ BitVec 64)) V!32687)

(assert (=> b!953288 (= e!536952 (= (apply!894 lt!429498 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5654 thiss!1141)))))

(declare-fun bm!41610 () Bool)

(declare-fun call!41613 () ListLongMap!12259)

(declare-fun call!41615 () ListLongMap!12259)

(assert (=> bm!41610 (= call!41613 call!41615)))

(declare-fun bm!41611 () Bool)

(declare-fun call!41617 () ListLongMap!12259)

(declare-fun call!41618 () ListLongMap!12259)

(assert (=> bm!41611 (= call!41617 call!41618)))

(declare-fun bm!41612 () Bool)

(declare-fun call!41616 () Bool)

(assert (=> bm!41612 (= call!41616 (contains!5251 lt!429498 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41613 () Bool)

(declare-fun call!41619 () ListLongMap!12259)

(assert (=> bm!41613 (= call!41618 call!41619)))

(declare-fun b!953289 () Bool)

(declare-fun res!638389 () Bool)

(assert (=> b!953289 (=> (not res!638389) (not e!536942))))

(assert (=> b!953289 (= res!638389 e!536951)))

(declare-fun c!99923 () Bool)

(assert (=> b!953289 (= c!99923 (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!953290 () Bool)

(declare-fun Unit!32023 () Unit!32018)

(assert (=> b!953290 (= e!536945 Unit!32023)))

(declare-fun b!953291 () Bool)

(declare-fun c!99921 () Bool)

(assert (=> b!953291 (= c!99921 (and (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!536946 () ListLongMap!12259)

(declare-fun e!536947 () ListLongMap!12259)

(assert (=> b!953291 (= e!536946 e!536947)))

(declare-fun bm!41614 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3368 (array!57667 array!57665 (_ BitVec 32) (_ BitVec 32) V!32687 V!32687 (_ BitVec 32) Int) ListLongMap!12259)

(assert (=> bm!41614 (= call!41619 (getCurrentListMapNoExtraKeys!3368 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)))))

(declare-fun b!953292 () Bool)

(assert (=> b!953292 (= e!536947 call!41613)))

(declare-fun b!953293 () Bool)

(declare-fun e!536948 () Bool)

(assert (=> b!953293 (= e!536942 e!536948)))

(declare-fun c!99926 () Bool)

(assert (=> b!953293 (= c!99926 (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!953294 () Bool)

(declare-fun res!638388 () Bool)

(assert (=> b!953294 (=> (not res!638388) (not e!536942))))

(declare-fun e!536944 () Bool)

(assert (=> b!953294 (= res!638388 e!536944)))

(declare-fun res!638392 () Bool)

(assert (=> b!953294 (=> res!638392 e!536944)))

(declare-fun e!536950 () Bool)

(assert (=> b!953294 (= res!638392 (not e!536950))))

(declare-fun res!638387 () Bool)

(assert (=> b!953294 (=> (not res!638387) (not e!536950))))

(assert (=> b!953294 (= res!638387 (bvslt #b00000000000000000000000000000000 (size!28202 (_keys!10798 thiss!1141))))))

(declare-fun b!953295 () Bool)

(assert (=> b!953295 (= e!536941 (validKeyInArray!0 (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!953296 () Bool)

(assert (=> b!953296 (= e!536947 call!41617)))

(declare-fun b!953297 () Bool)

(declare-fun +!2880 (ListLongMap!12259 tuple2!13560) ListLongMap!12259)

(assert (=> b!953297 (= e!536949 (+!2880 call!41615 (tuple2!13561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5654 thiss!1141))))))

(declare-fun b!953298 () Bool)

(assert (=> b!953298 (= e!536946 call!41613)))

(declare-fun b!953299 () Bool)

(assert (=> b!953299 (= e!536948 (not call!41616))))

(declare-fun c!99924 () Bool)

(declare-fun bm!41615 () Bool)

(assert (=> bm!41615 (= call!41615 (+!2880 (ite c!99922 call!41619 (ite c!99924 call!41618 call!41617)) (ite (or c!99922 c!99924) (tuple2!13561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5654 thiss!1141)) (tuple2!13561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5654 thiss!1141)))))))

(declare-fun b!953300 () Bool)

(assert (=> b!953300 (= e!536951 e!536952)))

(declare-fun res!638385 () Bool)

(assert (=> b!953300 (= res!638385 call!41614)))

(assert (=> b!953300 (=> (not res!638385) (not e!536952))))

(declare-fun b!953301 () Bool)

(declare-fun e!536943 () Bool)

(assert (=> b!953301 (= e!536943 (= (apply!894 lt!429498 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5654 thiss!1141)))))

(declare-fun bm!41616 () Bool)

(assert (=> bm!41616 (= call!41614 (contains!5251 lt!429498 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!953302 () Bool)

(assert (=> b!953302 (= e!536948 e!536943)))

(declare-fun res!638386 () Bool)

(assert (=> b!953302 (= res!638386 call!41616)))

(assert (=> b!953302 (=> (not res!638386) (not e!536943))))

(declare-fun b!953303 () Bool)

(assert (=> b!953303 (= e!536949 e!536946)))

(assert (=> b!953303 (= c!99924 (and (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!953304 () Bool)

(declare-fun e!536940 () Bool)

(declare-fun get!14585 (ValueCell!9914 V!32687) V!32687)

(declare-fun dynLambda!1677 (Int (_ BitVec 64)) V!32687)

(assert (=> b!953304 (= e!536940 (= (apply!894 lt!429498 (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000)) (get!14585 (select (arr!27721 (_values!5841 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1677 (defaultEntry!5818 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953304 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28201 (_values!5841 thiss!1141))))))

(assert (=> b!953304 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28202 (_keys!10798 thiss!1141))))))

(declare-fun b!953305 () Bool)

(declare-fun lt!429512 () Unit!32018)

(assert (=> b!953305 (= e!536945 lt!429512)))

(declare-fun lt!429496 () ListLongMap!12259)

(assert (=> b!953305 (= lt!429496 (getCurrentListMapNoExtraKeys!3368 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)))))

(declare-fun lt!429507 () (_ BitVec 64))

(assert (=> b!953305 (= lt!429507 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429509 () (_ BitVec 64))

(assert (=> b!953305 (= lt!429509 (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429514 () Unit!32018)

(declare-fun addStillContains!583 (ListLongMap!12259 (_ BitVec 64) V!32687 (_ BitVec 64)) Unit!32018)

(assert (=> b!953305 (= lt!429514 (addStillContains!583 lt!429496 lt!429507 (zeroValue!5654 thiss!1141) lt!429509))))

(assert (=> b!953305 (contains!5251 (+!2880 lt!429496 (tuple2!13561 lt!429507 (zeroValue!5654 thiss!1141))) lt!429509)))

(declare-fun lt!429503 () Unit!32018)

(assert (=> b!953305 (= lt!429503 lt!429514)))

(declare-fun lt!429508 () ListLongMap!12259)

(assert (=> b!953305 (= lt!429508 (getCurrentListMapNoExtraKeys!3368 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)))))

(declare-fun lt!429497 () (_ BitVec 64))

(assert (=> b!953305 (= lt!429497 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429506 () (_ BitVec 64))

(assert (=> b!953305 (= lt!429506 (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429502 () Unit!32018)

(declare-fun addApplyDifferent!464 (ListLongMap!12259 (_ BitVec 64) V!32687 (_ BitVec 64)) Unit!32018)

(assert (=> b!953305 (= lt!429502 (addApplyDifferent!464 lt!429508 lt!429497 (minValue!5654 thiss!1141) lt!429506))))

(assert (=> b!953305 (= (apply!894 (+!2880 lt!429508 (tuple2!13561 lt!429497 (minValue!5654 thiss!1141))) lt!429506) (apply!894 lt!429508 lt!429506))))

(declare-fun lt!429504 () Unit!32018)

(assert (=> b!953305 (= lt!429504 lt!429502)))

(declare-fun lt!429500 () ListLongMap!12259)

(assert (=> b!953305 (= lt!429500 (getCurrentListMapNoExtraKeys!3368 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)))))

(declare-fun lt!429501 () (_ BitVec 64))

(assert (=> b!953305 (= lt!429501 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429516 () (_ BitVec 64))

(assert (=> b!953305 (= lt!429516 (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429517 () Unit!32018)

(assert (=> b!953305 (= lt!429517 (addApplyDifferent!464 lt!429500 lt!429501 (zeroValue!5654 thiss!1141) lt!429516))))

(assert (=> b!953305 (= (apply!894 (+!2880 lt!429500 (tuple2!13561 lt!429501 (zeroValue!5654 thiss!1141))) lt!429516) (apply!894 lt!429500 lt!429516))))

(declare-fun lt!429510 () Unit!32018)

(assert (=> b!953305 (= lt!429510 lt!429517)))

(declare-fun lt!429499 () ListLongMap!12259)

(assert (=> b!953305 (= lt!429499 (getCurrentListMapNoExtraKeys!3368 (_keys!10798 thiss!1141) (_values!5841 thiss!1141) (mask!27703 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)))))

(declare-fun lt!429505 () (_ BitVec 64))

(assert (=> b!953305 (= lt!429505 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429515 () (_ BitVec 64))

(assert (=> b!953305 (= lt!429515 (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953305 (= lt!429512 (addApplyDifferent!464 lt!429499 lt!429505 (minValue!5654 thiss!1141) lt!429515))))

(assert (=> b!953305 (= (apply!894 (+!2880 lt!429499 (tuple2!13561 lt!429505 (minValue!5654 thiss!1141))) lt!429515) (apply!894 lt!429499 lt!429515))))

(declare-fun b!953306 () Bool)

(assert (=> b!953306 (= e!536944 e!536940)))

(declare-fun res!638391 () Bool)

(assert (=> b!953306 (=> (not res!638391) (not e!536940))))

(assert (=> b!953306 (= res!638391 (contains!5251 lt!429498 (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!953306 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28202 (_keys!10798 thiss!1141))))))

(declare-fun b!953307 () Bool)

(assert (=> b!953307 (= e!536950 (validKeyInArray!0 (select (arr!27722 (_keys!10798 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115849 c!99922) b!953297))

(assert (= (and d!115849 (not c!99922)) b!953303))

(assert (= (and b!953303 c!99924) b!953298))

(assert (= (and b!953303 (not c!99924)) b!953291))

(assert (= (and b!953291 c!99921) b!953292))

(assert (= (and b!953291 (not c!99921)) b!953296))

(assert (= (or b!953292 b!953296) bm!41611))

(assert (= (or b!953298 bm!41611) bm!41613))

(assert (= (or b!953298 b!953292) bm!41610))

(assert (= (or b!953297 bm!41613) bm!41614))

(assert (= (or b!953297 bm!41610) bm!41615))

(assert (= (and d!115849 res!638384) b!953295))

(assert (= (and d!115849 c!99925) b!953305))

(assert (= (and d!115849 (not c!99925)) b!953290))

(assert (= (and d!115849 res!638390) b!953294))

(assert (= (and b!953294 res!638387) b!953307))

(assert (= (and b!953294 (not res!638392)) b!953306))

(assert (= (and b!953306 res!638391) b!953304))

(assert (= (and b!953294 res!638388) b!953289))

(assert (= (and b!953289 c!99923) b!953300))

(assert (= (and b!953289 (not c!99923)) b!953287))

(assert (= (and b!953300 res!638385) b!953288))

(assert (= (or b!953300 b!953287) bm!41616))

(assert (= (and b!953289 res!638389) b!953293))

(assert (= (and b!953293 c!99926) b!953302))

(assert (= (and b!953293 (not c!99926)) b!953299))

(assert (= (and b!953302 res!638386) b!953301))

(assert (= (or b!953302 b!953299) bm!41612))

(declare-fun b_lambda!14425 () Bool)

(assert (=> (not b_lambda!14425) (not b!953304)))

(declare-fun t!27697 () Bool)

(declare-fun tb!6197 () Bool)

(assert (=> (and b!953110 (= (defaultEntry!5818 thiss!1141) (defaultEntry!5818 thiss!1141)) t!27697) tb!6197))

(declare-fun result!12329 () Bool)

(assert (=> tb!6197 (= result!12329 tp_is_empty!20791)))

(assert (=> b!953304 t!27697))

(declare-fun b_and!29777 () Bool)

(assert (= b_and!29771 (and (=> t!27697 result!12329) b_and!29777)))

(declare-fun m!885833 () Bool)

(assert (=> bm!41616 m!885833))

(declare-fun m!885835 () Bool)

(assert (=> b!953301 m!885835))

(declare-fun m!885837 () Bool)

(assert (=> b!953288 m!885837))

(assert (=> d!115849 m!885709))

(assert (=> b!953304 m!885777))

(declare-fun m!885839 () Bool)

(assert (=> b!953304 m!885839))

(declare-fun m!885841 () Bool)

(assert (=> b!953304 m!885841))

(assert (=> b!953304 m!885777))

(declare-fun m!885843 () Bool)

(assert (=> b!953304 m!885843))

(assert (=> b!953304 m!885843))

(assert (=> b!953304 m!885841))

(declare-fun m!885845 () Bool)

(assert (=> b!953304 m!885845))

(assert (=> b!953307 m!885777))

(assert (=> b!953307 m!885777))

(assert (=> b!953307 m!885785))

(assert (=> b!953295 m!885777))

(assert (=> b!953295 m!885777))

(assert (=> b!953295 m!885785))

(assert (=> b!953306 m!885777))

(assert (=> b!953306 m!885777))

(declare-fun m!885847 () Bool)

(assert (=> b!953306 m!885847))

(declare-fun m!885849 () Bool)

(assert (=> bm!41612 m!885849))

(declare-fun m!885851 () Bool)

(assert (=> bm!41614 m!885851))

(declare-fun m!885853 () Bool)

(assert (=> b!953297 m!885853))

(declare-fun m!885855 () Bool)

(assert (=> bm!41615 m!885855))

(declare-fun m!885857 () Bool)

(assert (=> b!953305 m!885857))

(declare-fun m!885859 () Bool)

(assert (=> b!953305 m!885859))

(assert (=> b!953305 m!885851))

(declare-fun m!885861 () Bool)

(assert (=> b!953305 m!885861))

(declare-fun m!885863 () Bool)

(assert (=> b!953305 m!885863))

(declare-fun m!885865 () Bool)

(assert (=> b!953305 m!885865))

(declare-fun m!885867 () Bool)

(assert (=> b!953305 m!885867))

(declare-fun m!885869 () Bool)

(assert (=> b!953305 m!885869))

(declare-fun m!885871 () Bool)

(assert (=> b!953305 m!885871))

(assert (=> b!953305 m!885777))

(declare-fun m!885873 () Bool)

(assert (=> b!953305 m!885873))

(declare-fun m!885875 () Bool)

(assert (=> b!953305 m!885875))

(declare-fun m!885877 () Bool)

(assert (=> b!953305 m!885877))

(declare-fun m!885879 () Bool)

(assert (=> b!953305 m!885879))

(assert (=> b!953305 m!885877))

(declare-fun m!885881 () Bool)

(assert (=> b!953305 m!885881))

(assert (=> b!953305 m!885865))

(declare-fun m!885883 () Bool)

(assert (=> b!953305 m!885883))

(assert (=> b!953305 m!885873))

(declare-fun m!885885 () Bool)

(assert (=> b!953305 m!885885))

(assert (=> b!953305 m!885857))

(assert (=> b!953106 d!115849))

(declare-fun condMapEmpty!33130 () Bool)

(declare-fun mapDefault!33130 () ValueCell!9914)

(assert (=> mapNonEmpty!33121 (= condMapEmpty!33130 (= mapRest!33121 ((as const (Array (_ BitVec 32) ValueCell!9914)) mapDefault!33130)))))

(declare-fun e!536958 () Bool)

(declare-fun mapRes!33130 () Bool)

(assert (=> mapNonEmpty!33121 (= tp!63468 (and e!536958 mapRes!33130))))

(declare-fun mapNonEmpty!33130 () Bool)

(declare-fun tp!63484 () Bool)

(declare-fun e!536957 () Bool)

(assert (=> mapNonEmpty!33130 (= mapRes!33130 (and tp!63484 e!536957))))

(declare-fun mapRest!33130 () (Array (_ BitVec 32) ValueCell!9914))

(declare-fun mapValue!33130 () ValueCell!9914)

(declare-fun mapKey!33130 () (_ BitVec 32))

(assert (=> mapNonEmpty!33130 (= mapRest!33121 (store mapRest!33130 mapKey!33130 mapValue!33130))))

(declare-fun b!953316 () Bool)

(assert (=> b!953316 (= e!536957 tp_is_empty!20791)))

(declare-fun mapIsEmpty!33130 () Bool)

(assert (=> mapIsEmpty!33130 mapRes!33130))

(declare-fun b!953317 () Bool)

(assert (=> b!953317 (= e!536958 tp_is_empty!20791)))

(assert (= (and mapNonEmpty!33121 condMapEmpty!33130) mapIsEmpty!33130))

(assert (= (and mapNonEmpty!33121 (not condMapEmpty!33130)) mapNonEmpty!33130))

(assert (= (and mapNonEmpty!33130 ((_ is ValueCellFull!9914) mapValue!33130)) b!953316))

(assert (= (and mapNonEmpty!33121 ((_ is ValueCellFull!9914) mapDefault!33130)) b!953317))

(declare-fun m!885887 () Bool)

(assert (=> mapNonEmpty!33130 m!885887))

(declare-fun b_lambda!14427 () Bool)

(assert (= b_lambda!14425 (or (and b!953110 b_free!18283) b_lambda!14427)))

(check-sat (not b!953295) (not b!953301) (not b!953305) (not b!953242) (not bm!41612) (not b!953186) (not bm!41594) (not b!953203) b_and!29777 (not b!953234) (not bm!41614) (not b!953288) (not d!115827) (not b_lambda!14427) (not b_next!18283) (not b!953212) (not bm!41615) (not b!953231) (not bm!41616) (not b!953235) (not b!953219) (not d!115847) (not d!115833) (not b!953244) (not b!953306) (not d!115829) tp_is_empty!20791 (not b!953307) (not b!953304) (not d!115837) (not b!953297) (not b!953211) (not mapNonEmpty!33130) (not b!953213) (not b!953224) (not d!115849) (not b!953185) (not bm!41595))
(check-sat b_and!29777 (not b_next!18283))
