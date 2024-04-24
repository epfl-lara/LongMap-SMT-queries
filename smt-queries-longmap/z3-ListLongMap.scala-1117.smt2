; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22952 () Bool)

(assert start!22952)

(declare-fun b!239976 () Bool)

(declare-fun b_free!6451 () Bool)

(declare-fun b_next!6451 () Bool)

(assert (=> b!239976 (= b_free!6451 (not b_next!6451))))

(declare-fun tp!22556 () Bool)

(declare-fun b_and!13431 () Bool)

(assert (=> b!239976 (= tp!22556 b_and!13431)))

(declare-fun b!239960 () Bool)

(declare-fun e!155791 () Bool)

(declare-fun e!155786 () Bool)

(assert (=> b!239960 (= e!155791 e!155786)))

(declare-fun res!117621 () Bool)

(declare-fun call!22302 () Bool)

(assert (=> b!239960 (= res!117621 call!22302)))

(assert (=> b!239960 (=> (not res!117621) (not e!155786))))

(declare-fun b!239961 () Bool)

(declare-fun e!155785 () Bool)

(declare-fun e!155796 () Bool)

(assert (=> b!239961 (= e!155785 e!155796)))

(declare-fun res!117614 () Bool)

(assert (=> b!239961 (=> (not res!117614) (not e!155796))))

(declare-datatypes ((SeekEntryResult!1006 0))(
  ( (MissingZero!1006 (index!6194 (_ BitVec 32))) (Found!1006 (index!6195 (_ BitVec 32))) (Intermediate!1006 (undefined!1818 Bool) (index!6196 (_ BitVec 32)) (x!24102 (_ BitVec 32))) (Undefined!1006) (MissingVacant!1006 (index!6197 (_ BitVec 32))) )
))
(declare-fun lt!120944 () SeekEntryResult!1006)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239961 (= res!117614 (or (= lt!120944 (MissingZero!1006 index!297)) (= lt!120944 (MissingVacant!1006 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8065 0))(
  ( (V!8066 (val!3201 Int)) )
))
(declare-datatypes ((ValueCell!2813 0))(
  ( (ValueCellFull!2813 (v!5240 V!8065)) (EmptyCell!2813) )
))
(declare-datatypes ((array!11903 0))(
  ( (array!11904 (arr!5653 (Array (_ BitVec 32) ValueCell!2813)) (size!5994 (_ BitVec 32))) )
))
(declare-datatypes ((array!11905 0))(
  ( (array!11906 (arr!5654 (Array (_ BitVec 32) (_ BitVec 64))) (size!5995 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3526 0))(
  ( (LongMapFixedSize!3527 (defaultEntry!4448 Int) (mask!10500 (_ BitVec 32)) (extraKeys!4185 (_ BitVec 32)) (zeroValue!4289 V!8065) (minValue!4289 V!8065) (_size!1812 (_ BitVec 32)) (_keys!6550 array!11905) (_values!4431 array!11903) (_vacant!1812 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3526)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11905 (_ BitVec 32)) SeekEntryResult!1006)

(assert (=> b!239961 (= lt!120944 (seekEntryOrOpen!0 key!932 (_keys!6550 thiss!1504) (mask!10500 thiss!1504)))))

(declare-fun b!239962 () Bool)

(declare-fun call!22301 () Bool)

(assert (=> b!239962 (= e!155786 (not call!22301))))

(declare-fun b!239963 () Bool)

(declare-fun res!117613 () Bool)

(declare-fun e!155792 () Bool)

(assert (=> b!239963 (=> (not res!117613) (not e!155792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239963 (= res!117613 (validMask!0 (mask!10500 thiss!1504)))))

(declare-fun b!239964 () Bool)

(declare-fun res!117617 () Bool)

(assert (=> b!239964 (=> (not res!117617) (not e!155792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11905 (_ BitVec 32)) Bool)

(assert (=> b!239964 (= res!117617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6550 thiss!1504) (mask!10500 thiss!1504)))))

(declare-fun b!239965 () Bool)

(declare-datatypes ((List!3518 0))(
  ( (Nil!3515) (Cons!3514 (h!4170 (_ BitVec 64)) (t!8505 List!3518)) )
))
(declare-fun arrayNoDuplicates!0 (array!11905 (_ BitVec 32) List!3518) Bool)

(assert (=> b!239965 (= e!155792 (not (arrayNoDuplicates!0 (_keys!6550 thiss!1504) #b00000000000000000000000000000000 Nil!3515)))))

(declare-fun b!239966 () Bool)

(declare-datatypes ((Unit!7352 0))(
  ( (Unit!7353) )
))
(declare-fun e!155787 () Unit!7352)

(declare-fun lt!120942 () Unit!7352)

(assert (=> b!239966 (= e!155787 lt!120942)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!328 (array!11905 array!11903 (_ BitVec 32) (_ BitVec 32) V!8065 V!8065 (_ BitVec 64) Int) Unit!7352)

(assert (=> b!239966 (= lt!120942 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!328 (_keys!6550 thiss!1504) (_values!4431 thiss!1504) (mask!10500 thiss!1504) (extraKeys!4185 thiss!1504) (zeroValue!4289 thiss!1504) (minValue!4289 thiss!1504) key!932 (defaultEntry!4448 thiss!1504)))))

(declare-fun c!39995 () Bool)

(get-info :version)

(assert (=> b!239966 (= c!39995 ((_ is MissingZero!1006) lt!120944))))

(declare-fun e!155794 () Bool)

(assert (=> b!239966 e!155794))

(declare-fun b!239967 () Bool)

(declare-fun Unit!7354 () Unit!7352)

(assert (=> b!239967 (= e!155787 Unit!7354)))

(declare-fun lt!120941 () Unit!7352)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!336 (array!11905 array!11903 (_ BitVec 32) (_ BitVec 32) V!8065 V!8065 (_ BitVec 64) Int) Unit!7352)

(assert (=> b!239967 (= lt!120941 (lemmaInListMapThenSeekEntryOrOpenFindsIt!336 (_keys!6550 thiss!1504) (_values!4431 thiss!1504) (mask!10500 thiss!1504) (extraKeys!4185 thiss!1504) (zeroValue!4289 thiss!1504) (minValue!4289 thiss!1504) key!932 (defaultEntry!4448 thiss!1504)))))

(assert (=> b!239967 false))

(declare-fun b!239968 () Bool)

(declare-fun res!117616 () Bool)

(declare-fun e!155795 () Bool)

(assert (=> b!239968 (=> (not res!117616) (not e!155795))))

(assert (=> b!239968 (= res!117616 (= (select (arr!5654 (_keys!6550 thiss!1504)) (index!6194 lt!120944)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22299 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22299 (= call!22302 (inRange!0 (ite c!39995 (index!6194 lt!120944) (index!6197 lt!120944)) (mask!10500 thiss!1504)))))

(declare-fun b!239969 () Bool)

(assert (=> b!239969 (= e!155796 e!155792)))

(declare-fun res!117622 () Bool)

(assert (=> b!239969 (=> (not res!117622) (not e!155792))))

(assert (=> b!239969 (= res!117622 (inRange!0 index!297 (mask!10500 thiss!1504)))))

(declare-fun lt!120943 () Unit!7352)

(assert (=> b!239969 (= lt!120943 e!155787)))

(declare-fun c!39996 () Bool)

(declare-datatypes ((tuple2!4642 0))(
  ( (tuple2!4643 (_1!2332 (_ BitVec 64)) (_2!2332 V!8065)) )
))
(declare-datatypes ((List!3519 0))(
  ( (Nil!3516) (Cons!3515 (h!4171 tuple2!4642) (t!8506 List!3519)) )
))
(declare-datatypes ((ListLongMap!3557 0))(
  ( (ListLongMap!3558 (toList!1794 List!3519)) )
))
(declare-fun contains!1696 (ListLongMap!3557 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1326 (array!11905 array!11903 (_ BitVec 32) (_ BitVec 32) V!8065 V!8065 (_ BitVec 32) Int) ListLongMap!3557)

(assert (=> b!239969 (= c!39996 (contains!1696 (getCurrentListMap!1326 (_keys!6550 thiss!1504) (_values!4431 thiss!1504) (mask!10500 thiss!1504) (extraKeys!4185 thiss!1504) (zeroValue!4289 thiss!1504) (minValue!4289 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4448 thiss!1504)) key!932))))

(declare-fun b!239970 () Bool)

(declare-fun res!117623 () Bool)

(assert (=> b!239970 (=> (not res!117623) (not e!155792))))

(assert (=> b!239970 (= res!117623 (and (= (size!5994 (_values!4431 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10500 thiss!1504))) (= (size!5995 (_keys!6550 thiss!1504)) (size!5994 (_values!4431 thiss!1504))) (bvsge (mask!10500 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4185 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4185 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!239971 () Bool)

(assert (=> b!239971 (= e!155795 (not call!22301))))

(declare-fun b!239972 () Bool)

(declare-fun res!117620 () Bool)

(assert (=> b!239972 (=> (not res!117620) (not e!155792))))

(declare-fun arrayContainsKey!0 (array!11905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!239972 (= res!117620 (arrayContainsKey!0 (_keys!6550 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239973 () Bool)

(assert (=> b!239973 (= e!155791 ((_ is Undefined!1006) lt!120944))))

(declare-fun b!239974 () Bool)

(declare-fun res!117615 () Bool)

(assert (=> b!239974 (= res!117615 (= (select (arr!5654 (_keys!6550 thiss!1504)) (index!6197 lt!120944)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239974 (=> (not res!117615) (not e!155786))))

(declare-fun b!239975 () Bool)

(declare-fun c!39994 () Bool)

(assert (=> b!239975 (= c!39994 ((_ is MissingVacant!1006) lt!120944))))

(assert (=> b!239975 (= e!155794 e!155791)))

(declare-fun mapIsEmpty!10701 () Bool)

(declare-fun mapRes!10701 () Bool)

(assert (=> mapIsEmpty!10701 mapRes!10701))

(declare-fun e!155788 () Bool)

(declare-fun e!155793 () Bool)

(declare-fun tp_is_empty!6313 () Bool)

(declare-fun array_inv!3713 (array!11905) Bool)

(declare-fun array_inv!3714 (array!11903) Bool)

(assert (=> b!239976 (= e!155793 (and tp!22556 tp_is_empty!6313 (array_inv!3713 (_keys!6550 thiss!1504)) (array_inv!3714 (_values!4431 thiss!1504)) e!155788))))

(declare-fun b!239977 () Bool)

(declare-fun e!155790 () Bool)

(assert (=> b!239977 (= e!155790 tp_is_empty!6313)))

(declare-fun mapNonEmpty!10701 () Bool)

(declare-fun tp!22557 () Bool)

(assert (=> mapNonEmpty!10701 (= mapRes!10701 (and tp!22557 e!155790))))

(declare-fun mapRest!10701 () (Array (_ BitVec 32) ValueCell!2813))

(declare-fun mapKey!10701 () (_ BitVec 32))

(declare-fun mapValue!10701 () ValueCell!2813)

(assert (=> mapNonEmpty!10701 (= (arr!5653 (_values!4431 thiss!1504)) (store mapRest!10701 mapKey!10701 mapValue!10701))))

(declare-fun bm!22298 () Bool)

(assert (=> bm!22298 (= call!22301 (arrayContainsKey!0 (_keys!6550 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!117612 () Bool)

(assert (=> start!22952 (=> (not res!117612) (not e!155785))))

(declare-fun valid!1399 (LongMapFixedSize!3526) Bool)

(assert (=> start!22952 (= res!117612 (valid!1399 thiss!1504))))

(assert (=> start!22952 e!155785))

(assert (=> start!22952 e!155793))

(assert (=> start!22952 true))

(declare-fun b!239978 () Bool)

(declare-fun e!155784 () Bool)

(assert (=> b!239978 (= e!155788 (and e!155784 mapRes!10701))))

(declare-fun condMapEmpty!10701 () Bool)

(declare-fun mapDefault!10701 () ValueCell!2813)

(assert (=> b!239978 (= condMapEmpty!10701 (= (arr!5653 (_values!4431 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2813)) mapDefault!10701)))))

(declare-fun b!239979 () Bool)

(declare-fun res!117619 () Bool)

(assert (=> b!239979 (=> (not res!117619) (not e!155785))))

(assert (=> b!239979 (= res!117619 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239980 () Bool)

(declare-fun res!117618 () Bool)

(assert (=> b!239980 (=> (not res!117618) (not e!155795))))

(assert (=> b!239980 (= res!117618 call!22302)))

(assert (=> b!239980 (= e!155794 e!155795)))

(declare-fun b!239981 () Bool)

(assert (=> b!239981 (= e!155784 tp_is_empty!6313)))

(assert (= (and start!22952 res!117612) b!239979))

(assert (= (and b!239979 res!117619) b!239961))

(assert (= (and b!239961 res!117614) b!239969))

(assert (= (and b!239969 c!39996) b!239967))

(assert (= (and b!239969 (not c!39996)) b!239966))

(assert (= (and b!239966 c!39995) b!239980))

(assert (= (and b!239966 (not c!39995)) b!239975))

(assert (= (and b!239980 res!117618) b!239968))

(assert (= (and b!239968 res!117616) b!239971))

(assert (= (and b!239975 c!39994) b!239960))

(assert (= (and b!239975 (not c!39994)) b!239973))

(assert (= (and b!239960 res!117621) b!239974))

(assert (= (and b!239974 res!117615) b!239962))

(assert (= (or b!239980 b!239960) bm!22299))

(assert (= (or b!239971 b!239962) bm!22298))

(assert (= (and b!239969 res!117622) b!239972))

(assert (= (and b!239972 res!117620) b!239963))

(assert (= (and b!239963 res!117613) b!239970))

(assert (= (and b!239970 res!117623) b!239964))

(assert (= (and b!239964 res!117617) b!239965))

(assert (= (and b!239978 condMapEmpty!10701) mapIsEmpty!10701))

(assert (= (and b!239978 (not condMapEmpty!10701)) mapNonEmpty!10701))

(assert (= (and mapNonEmpty!10701 ((_ is ValueCellFull!2813) mapValue!10701)) b!239977))

(assert (= (and b!239978 ((_ is ValueCellFull!2813) mapDefault!10701)) b!239981))

(assert (= b!239976 b!239978))

(assert (= start!22952 b!239976))

(declare-fun m!259927 () Bool)

(assert (=> start!22952 m!259927))

(declare-fun m!259929 () Bool)

(assert (=> b!239974 m!259929))

(declare-fun m!259931 () Bool)

(assert (=> b!239965 m!259931))

(declare-fun m!259933 () Bool)

(assert (=> b!239961 m!259933))

(declare-fun m!259935 () Bool)

(assert (=> b!239963 m!259935))

(declare-fun m!259937 () Bool)

(assert (=> bm!22298 m!259937))

(declare-fun m!259939 () Bool)

(assert (=> b!239976 m!259939))

(declare-fun m!259941 () Bool)

(assert (=> b!239976 m!259941))

(assert (=> b!239972 m!259937))

(declare-fun m!259943 () Bool)

(assert (=> b!239967 m!259943))

(declare-fun m!259945 () Bool)

(assert (=> b!239968 m!259945))

(declare-fun m!259947 () Bool)

(assert (=> mapNonEmpty!10701 m!259947))

(declare-fun m!259949 () Bool)

(assert (=> b!239964 m!259949))

(declare-fun m!259951 () Bool)

(assert (=> bm!22299 m!259951))

(declare-fun m!259953 () Bool)

(assert (=> b!239966 m!259953))

(declare-fun m!259955 () Bool)

(assert (=> b!239969 m!259955))

(declare-fun m!259957 () Bool)

(assert (=> b!239969 m!259957))

(assert (=> b!239969 m!259957))

(declare-fun m!259959 () Bool)

(assert (=> b!239969 m!259959))

(check-sat (not mapNonEmpty!10701) (not b!239964) (not b!239972) (not b_next!6451) (not b!239965) (not start!22952) (not bm!22299) tp_is_empty!6313 (not b!239967) (not b!239976) (not b!239969) (not b!239963) (not bm!22298) (not b!239966) (not b!239961) b_and!13431)
(check-sat b_and!13431 (not b_next!6451))
