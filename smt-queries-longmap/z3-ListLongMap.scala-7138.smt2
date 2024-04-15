; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90664 () Bool)

(assert start!90664)

(declare-fun b!1036828 () Bool)

(declare-fun b_free!20881 () Bool)

(declare-fun b_next!20881 () Bool)

(assert (=> b!1036828 (= b_free!20881 (not b_next!20881))))

(declare-fun tp!73781 () Bool)

(declare-fun b_and!33387 () Bool)

(assert (=> b!1036828 (= tp!73781 b_and!33387)))

(declare-fun b!1036825 () Bool)

(declare-fun e!586416 () Bool)

(declare-datatypes ((V!37675 0))(
  ( (V!37676 (val!12351 Int)) )
))
(declare-datatypes ((ValueCell!11597 0))(
  ( (ValueCellFull!11597 (v!14933 V!37675)) (EmptyCell!11597) )
))
(declare-datatypes ((array!65241 0))(
  ( (array!65242 (arr!31404 (Array (_ BitVec 32) (_ BitVec 64))) (size!31935 (_ BitVec 32))) )
))
(declare-datatypes ((array!65243 0))(
  ( (array!65244 (arr!31405 (Array (_ BitVec 32) ValueCell!11597)) (size!31936 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5788 0))(
  ( (LongMapFixedSize!5789 (defaultEntry!6276 Int) (mask!30177 (_ BitVec 32)) (extraKeys!6004 (_ BitVec 32)) (zeroValue!6110 V!37675) (minValue!6110 V!37675) (_size!2949 (_ BitVec 32)) (_keys!11463 array!65241) (_values!6299 array!65243) (_vacant!2949 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5788)

(assert (=> b!1036825 (= e!586416 (bvsge (size!31935 (_keys!11463 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1036826 () Bool)

(declare-fun e!586415 () Bool)

(declare-fun e!586411 () Bool)

(declare-fun mapRes!38423 () Bool)

(assert (=> b!1036826 (= e!586415 (and e!586411 mapRes!38423))))

(declare-fun condMapEmpty!38423 () Bool)

(declare-fun mapDefault!38423 () ValueCell!11597)

(assert (=> b!1036826 (= condMapEmpty!38423 (= (arr!31405 (_values!6299 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11597)) mapDefault!38423)))))

(declare-fun b!1036827 () Bool)

(declare-fun res!691929 () Bool)

(declare-fun e!586412 () Bool)

(assert (=> b!1036827 (=> (not res!691929) (not e!586412))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1036827 (= res!691929 (not (= key!909 (bvneg key!909))))))

(declare-fun e!586414 () Bool)

(declare-fun tp_is_empty!24601 () Bool)

(declare-fun array_inv!24287 (array!65241) Bool)

(declare-fun array_inv!24288 (array!65243) Bool)

(assert (=> b!1036828 (= e!586414 (and tp!73781 tp_is_empty!24601 (array_inv!24287 (_keys!11463 thiss!1427)) (array_inv!24288 (_values!6299 thiss!1427)) e!586415))))

(declare-fun mapNonEmpty!38423 () Bool)

(declare-fun tp!73782 () Bool)

(declare-fun e!586417 () Bool)

(assert (=> mapNonEmpty!38423 (= mapRes!38423 (and tp!73782 e!586417))))

(declare-fun mapRest!38423 () (Array (_ BitVec 32) ValueCell!11597))

(declare-fun mapValue!38423 () ValueCell!11597)

(declare-fun mapKey!38423 () (_ BitVec 32))

(assert (=> mapNonEmpty!38423 (= (arr!31405 (_values!6299 thiss!1427)) (store mapRest!38423 mapKey!38423 mapValue!38423))))

(declare-fun b!1036829 () Bool)

(declare-fun e!586413 () Bool)

(assert (=> b!1036829 (= e!586413 e!586416)))

(declare-fun res!691932 () Bool)

(assert (=> b!1036829 (=> res!691932 e!586416)))

(declare-datatypes ((SeekEntryResult!9738 0))(
  ( (MissingZero!9738 (index!41323 (_ BitVec 32))) (Found!9738 (index!41324 (_ BitVec 32))) (Intermediate!9738 (undefined!10550 Bool) (index!41325 (_ BitVec 32)) (x!92477 (_ BitVec 32))) (Undefined!9738) (MissingVacant!9738 (index!41326 (_ BitVec 32))) )
))
(declare-fun lt!457166 () SeekEntryResult!9738)

(assert (=> b!1036829 (= res!691932 (or (bvslt (index!41324 lt!457166) #b00000000000000000000000000000000) (bvsge (index!41324 lt!457166) (size!31935 (_keys!11463 thiss!1427)))))))

(declare-fun b!1036830 () Bool)

(assert (=> b!1036830 (= e!586412 e!586413)))

(declare-fun res!691930 () Bool)

(assert (=> b!1036830 (=> (not res!691930) (not e!586413))))

(get-info :version)

(assert (=> b!1036830 (= res!691930 ((_ is Found!9738) lt!457166))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65241 (_ BitVec 32)) SeekEntryResult!9738)

(assert (=> b!1036830 (= lt!457166 (seekEntry!0 key!909 (_keys!11463 thiss!1427) (mask!30177 thiss!1427)))))

(declare-fun res!691933 () Bool)

(assert (=> start!90664 (=> (not res!691933) (not e!586412))))

(declare-fun valid!2173 (LongMapFixedSize!5788) Bool)

(assert (=> start!90664 (= res!691933 (valid!2173 thiss!1427))))

(assert (=> start!90664 e!586412))

(assert (=> start!90664 e!586414))

(assert (=> start!90664 true))

(declare-fun b!1036831 () Bool)

(assert (=> b!1036831 (= e!586417 tp_is_empty!24601)))

(declare-fun b!1036832 () Bool)

(assert (=> b!1036832 (= e!586411 tp_is_empty!24601)))

(declare-fun mapIsEmpty!38423 () Bool)

(assert (=> mapIsEmpty!38423 mapRes!38423))

(declare-fun b!1036833 () Bool)

(declare-fun res!691931 () Bool)

(assert (=> b!1036833 (=> res!691931 e!586416)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1036833 (= res!691931 (not (validKeyInArray!0 (select (arr!31404 (_keys!11463 thiss!1427)) (index!41324 lt!457166)))))))

(assert (= (and start!90664 res!691933) b!1036827))

(assert (= (and b!1036827 res!691929) b!1036830))

(assert (= (and b!1036830 res!691930) b!1036829))

(assert (= (and b!1036829 (not res!691932)) b!1036833))

(assert (= (and b!1036833 (not res!691931)) b!1036825))

(assert (= (and b!1036826 condMapEmpty!38423) mapIsEmpty!38423))

(assert (= (and b!1036826 (not condMapEmpty!38423)) mapNonEmpty!38423))

(assert (= (and mapNonEmpty!38423 ((_ is ValueCellFull!11597) mapValue!38423)) b!1036831))

(assert (= (and b!1036826 ((_ is ValueCellFull!11597) mapDefault!38423)) b!1036832))

(assert (= b!1036828 b!1036826))

(assert (= start!90664 b!1036828))

(declare-fun m!956731 () Bool)

(assert (=> mapNonEmpty!38423 m!956731))

(declare-fun m!956733 () Bool)

(assert (=> b!1036833 m!956733))

(assert (=> b!1036833 m!956733))

(declare-fun m!956735 () Bool)

(assert (=> b!1036833 m!956735))

(declare-fun m!956737 () Bool)

(assert (=> b!1036830 m!956737))

(declare-fun m!956739 () Bool)

(assert (=> b!1036828 m!956739))

(declare-fun m!956741 () Bool)

(assert (=> b!1036828 m!956741))

(declare-fun m!956743 () Bool)

(assert (=> start!90664 m!956743))

(check-sat (not start!90664) (not b!1036830) (not b!1036833) tp_is_empty!24601 (not b_next!20881) (not mapNonEmpty!38423) b_and!33387 (not b!1036828))
(check-sat b_and!33387 (not b_next!20881))
(get-model)

(declare-fun d!125029 () Bool)

(assert (=> d!125029 (= (array_inv!24287 (_keys!11463 thiss!1427)) (bvsge (size!31935 (_keys!11463 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036828 d!125029))

(declare-fun d!125031 () Bool)

(assert (=> d!125031 (= (array_inv!24288 (_values!6299 thiss!1427)) (bvsge (size!31936 (_values!6299 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036828 d!125031))

(declare-fun d!125033 () Bool)

(assert (=> d!125033 (= (validKeyInArray!0 (select (arr!31404 (_keys!11463 thiss!1427)) (index!41324 lt!457166))) (and (not (= (select (arr!31404 (_keys!11463 thiss!1427)) (index!41324 lt!457166)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31404 (_keys!11463 thiss!1427)) (index!41324 lt!457166)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1036833 d!125033))

(declare-fun d!125035 () Bool)

(declare-fun res!691970 () Bool)

(declare-fun e!586469 () Bool)

(assert (=> d!125035 (=> (not res!691970) (not e!586469))))

(declare-fun simpleValid!415 (LongMapFixedSize!5788) Bool)

(assert (=> d!125035 (= res!691970 (simpleValid!415 thiss!1427))))

(assert (=> d!125035 (= (valid!2173 thiss!1427) e!586469)))

(declare-fun b!1036894 () Bool)

(declare-fun res!691971 () Bool)

(assert (=> b!1036894 (=> (not res!691971) (not e!586469))))

(declare-fun arrayCountValidKeys!0 (array!65241 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1036894 (= res!691971 (= (arrayCountValidKeys!0 (_keys!11463 thiss!1427) #b00000000000000000000000000000000 (size!31935 (_keys!11463 thiss!1427))) (_size!2949 thiss!1427)))))

(declare-fun b!1036895 () Bool)

(declare-fun res!691972 () Bool)

(assert (=> b!1036895 (=> (not res!691972) (not e!586469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65241 (_ BitVec 32)) Bool)

(assert (=> b!1036895 (= res!691972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11463 thiss!1427) (mask!30177 thiss!1427)))))

(declare-fun b!1036896 () Bool)

(declare-datatypes ((List!21954 0))(
  ( (Nil!21951) (Cons!21950 (h!23152 (_ BitVec 64)) (t!31159 List!21954)) )
))
(declare-fun arrayNoDuplicates!0 (array!65241 (_ BitVec 32) List!21954) Bool)

(assert (=> b!1036896 (= e!586469 (arrayNoDuplicates!0 (_keys!11463 thiss!1427) #b00000000000000000000000000000000 Nil!21951))))

(assert (= (and d!125035 res!691970) b!1036894))

(assert (= (and b!1036894 res!691971) b!1036895))

(assert (= (and b!1036895 res!691972) b!1036896))

(declare-fun m!956773 () Bool)

(assert (=> d!125035 m!956773))

(declare-fun m!956775 () Bool)

(assert (=> b!1036894 m!956775))

(declare-fun m!956777 () Bool)

(assert (=> b!1036895 m!956777))

(declare-fun m!956779 () Bool)

(assert (=> b!1036896 m!956779))

(assert (=> start!90664 d!125035))

(declare-fun b!1036909 () Bool)

(declare-fun e!586476 () SeekEntryResult!9738)

(declare-fun lt!457184 () SeekEntryResult!9738)

(assert (=> b!1036909 (= e!586476 (ite ((_ is MissingVacant!9738) lt!457184) (MissingZero!9738 (index!41326 lt!457184)) lt!457184))))

(declare-fun lt!457181 () SeekEntryResult!9738)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65241 (_ BitVec 32)) SeekEntryResult!9738)

(assert (=> b!1036909 (= lt!457184 (seekKeyOrZeroReturnVacant!0 (x!92477 lt!457181) (index!41325 lt!457181) (index!41325 lt!457181) key!909 (_keys!11463 thiss!1427) (mask!30177 thiss!1427)))))

(declare-fun b!1036910 () Bool)

(declare-fun c!105021 () Bool)

(declare-fun lt!457182 () (_ BitVec 64))

(assert (=> b!1036910 (= c!105021 (= lt!457182 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586477 () SeekEntryResult!9738)

(assert (=> b!1036910 (= e!586477 e!586476)))

(declare-fun b!1036911 () Bool)

(declare-fun e!586478 () SeekEntryResult!9738)

(assert (=> b!1036911 (= e!586478 Undefined!9738)))

(declare-fun d!125037 () Bool)

(declare-fun lt!457183 () SeekEntryResult!9738)

(assert (=> d!125037 (and (or ((_ is MissingVacant!9738) lt!457183) (not ((_ is Found!9738) lt!457183)) (and (bvsge (index!41324 lt!457183) #b00000000000000000000000000000000) (bvslt (index!41324 lt!457183) (size!31935 (_keys!11463 thiss!1427))))) (not ((_ is MissingVacant!9738) lt!457183)) (or (not ((_ is Found!9738) lt!457183)) (= (select (arr!31404 (_keys!11463 thiss!1427)) (index!41324 lt!457183)) key!909)))))

(assert (=> d!125037 (= lt!457183 e!586478)))

(declare-fun c!105020 () Bool)

(assert (=> d!125037 (= c!105020 (and ((_ is Intermediate!9738) lt!457181) (undefined!10550 lt!457181)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65241 (_ BitVec 32)) SeekEntryResult!9738)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125037 (= lt!457181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30177 thiss!1427)) key!909 (_keys!11463 thiss!1427) (mask!30177 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125037 (validMask!0 (mask!30177 thiss!1427))))

(assert (=> d!125037 (= (seekEntry!0 key!909 (_keys!11463 thiss!1427) (mask!30177 thiss!1427)) lt!457183)))

(declare-fun b!1036912 () Bool)

(assert (=> b!1036912 (= e!586478 e!586477)))

(assert (=> b!1036912 (= lt!457182 (select (arr!31404 (_keys!11463 thiss!1427)) (index!41325 lt!457181)))))

(declare-fun c!105019 () Bool)

(assert (=> b!1036912 (= c!105019 (= lt!457182 key!909))))

(declare-fun b!1036913 () Bool)

(assert (=> b!1036913 (= e!586476 (MissingZero!9738 (index!41325 lt!457181)))))

(declare-fun b!1036914 () Bool)

(assert (=> b!1036914 (= e!586477 (Found!9738 (index!41325 lt!457181)))))

(assert (= (and d!125037 c!105020) b!1036911))

(assert (= (and d!125037 (not c!105020)) b!1036912))

(assert (= (and b!1036912 c!105019) b!1036914))

(assert (= (and b!1036912 (not c!105019)) b!1036910))

(assert (= (and b!1036910 c!105021) b!1036913))

(assert (= (and b!1036910 (not c!105021)) b!1036909))

(declare-fun m!956781 () Bool)

(assert (=> b!1036909 m!956781))

(declare-fun m!956783 () Bool)

(assert (=> d!125037 m!956783))

(declare-fun m!956785 () Bool)

(assert (=> d!125037 m!956785))

(assert (=> d!125037 m!956785))

(declare-fun m!956787 () Bool)

(assert (=> d!125037 m!956787))

(declare-fun m!956789 () Bool)

(assert (=> d!125037 m!956789))

(declare-fun m!956791 () Bool)

(assert (=> b!1036912 m!956791))

(assert (=> b!1036830 d!125037))

(declare-fun b!1036921 () Bool)

(declare-fun e!586483 () Bool)

(assert (=> b!1036921 (= e!586483 tp_is_empty!24601)))

(declare-fun mapNonEmpty!38432 () Bool)

(declare-fun mapRes!38432 () Bool)

(declare-fun tp!73797 () Bool)

(assert (=> mapNonEmpty!38432 (= mapRes!38432 (and tp!73797 e!586483))))

(declare-fun mapValue!38432 () ValueCell!11597)

(declare-fun mapRest!38432 () (Array (_ BitVec 32) ValueCell!11597))

(declare-fun mapKey!38432 () (_ BitVec 32))

(assert (=> mapNonEmpty!38432 (= mapRest!38423 (store mapRest!38432 mapKey!38432 mapValue!38432))))

(declare-fun mapIsEmpty!38432 () Bool)

(assert (=> mapIsEmpty!38432 mapRes!38432))

(declare-fun condMapEmpty!38432 () Bool)

(declare-fun mapDefault!38432 () ValueCell!11597)

(assert (=> mapNonEmpty!38423 (= condMapEmpty!38432 (= mapRest!38423 ((as const (Array (_ BitVec 32) ValueCell!11597)) mapDefault!38432)))))

(declare-fun e!586484 () Bool)

(assert (=> mapNonEmpty!38423 (= tp!73782 (and e!586484 mapRes!38432))))

(declare-fun b!1036922 () Bool)

(assert (=> b!1036922 (= e!586484 tp_is_empty!24601)))

(assert (= (and mapNonEmpty!38423 condMapEmpty!38432) mapIsEmpty!38432))

(assert (= (and mapNonEmpty!38423 (not condMapEmpty!38432)) mapNonEmpty!38432))

(assert (= (and mapNonEmpty!38432 ((_ is ValueCellFull!11597) mapValue!38432)) b!1036921))

(assert (= (and mapNonEmpty!38423 ((_ is ValueCellFull!11597) mapDefault!38432)) b!1036922))

(declare-fun m!956793 () Bool)

(assert (=> mapNonEmpty!38432 m!956793))

(check-sat (not d!125035) (not b!1036894) (not mapNonEmpty!38432) tp_is_empty!24601 b_and!33387 (not d!125037) (not b!1036909) (not b_next!20881) (not b!1036895) (not b!1036896))
(check-sat b_and!33387 (not b_next!20881))
(get-model)

(declare-fun d!125039 () Bool)

(declare-fun res!691979 () Bool)

(declare-fun e!586493 () Bool)

(assert (=> d!125039 (=> res!691979 e!586493)))

(assert (=> d!125039 (= res!691979 (bvsge #b00000000000000000000000000000000 (size!31935 (_keys!11463 thiss!1427))))))

(assert (=> d!125039 (= (arrayNoDuplicates!0 (_keys!11463 thiss!1427) #b00000000000000000000000000000000 Nil!21951) e!586493)))

(declare-fun b!1036933 () Bool)

(declare-fun e!586496 () Bool)

(declare-fun e!586494 () Bool)

(assert (=> b!1036933 (= e!586496 e!586494)))

(declare-fun c!105024 () Bool)

(assert (=> b!1036933 (= c!105024 (validKeyInArray!0 (select (arr!31404 (_keys!11463 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036934 () Bool)

(declare-fun call!43882 () Bool)

(assert (=> b!1036934 (= e!586494 call!43882)))

(declare-fun bm!43879 () Bool)

(assert (=> bm!43879 (= call!43882 (arrayNoDuplicates!0 (_keys!11463 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105024 (Cons!21950 (select (arr!31404 (_keys!11463 thiss!1427)) #b00000000000000000000000000000000) Nil!21951) Nil!21951)))))

(declare-fun b!1036935 () Bool)

(declare-fun e!586495 () Bool)

(declare-fun contains!6004 (List!21954 (_ BitVec 64)) Bool)

(assert (=> b!1036935 (= e!586495 (contains!6004 Nil!21951 (select (arr!31404 (_keys!11463 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036936 () Bool)

(assert (=> b!1036936 (= e!586493 e!586496)))

(declare-fun res!691980 () Bool)

(assert (=> b!1036936 (=> (not res!691980) (not e!586496))))

(assert (=> b!1036936 (= res!691980 (not e!586495))))

(declare-fun res!691981 () Bool)

(assert (=> b!1036936 (=> (not res!691981) (not e!586495))))

(assert (=> b!1036936 (= res!691981 (validKeyInArray!0 (select (arr!31404 (_keys!11463 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036937 () Bool)

(assert (=> b!1036937 (= e!586494 call!43882)))

(assert (= (and d!125039 (not res!691979)) b!1036936))

(assert (= (and b!1036936 res!691981) b!1036935))

(assert (= (and b!1036936 res!691980) b!1036933))

(assert (= (and b!1036933 c!105024) b!1036934))

(assert (= (and b!1036933 (not c!105024)) b!1036937))

(assert (= (or b!1036934 b!1036937) bm!43879))

(declare-fun m!956795 () Bool)

(assert (=> b!1036933 m!956795))

(assert (=> b!1036933 m!956795))

(declare-fun m!956797 () Bool)

(assert (=> b!1036933 m!956797))

(assert (=> bm!43879 m!956795))

(declare-fun m!956799 () Bool)

(assert (=> bm!43879 m!956799))

(assert (=> b!1036935 m!956795))

(assert (=> b!1036935 m!956795))

(declare-fun m!956801 () Bool)

(assert (=> b!1036935 m!956801))

(assert (=> b!1036936 m!956795))

(assert (=> b!1036936 m!956795))

(assert (=> b!1036936 m!956797))

(assert (=> b!1036896 d!125039))

(declare-fun lt!457190 () SeekEntryResult!9738)

(declare-fun d!125041 () Bool)

(assert (=> d!125041 (and (or ((_ is Undefined!9738) lt!457190) (not ((_ is Found!9738) lt!457190)) (and (bvsge (index!41324 lt!457190) #b00000000000000000000000000000000) (bvslt (index!41324 lt!457190) (size!31935 (_keys!11463 thiss!1427))))) (or ((_ is Undefined!9738) lt!457190) ((_ is Found!9738) lt!457190) (not ((_ is MissingVacant!9738) lt!457190)) (not (= (index!41326 lt!457190) (index!41325 lt!457181))) (and (bvsge (index!41326 lt!457190) #b00000000000000000000000000000000) (bvslt (index!41326 lt!457190) (size!31935 (_keys!11463 thiss!1427))))) (or ((_ is Undefined!9738) lt!457190) (ite ((_ is Found!9738) lt!457190) (= (select (arr!31404 (_keys!11463 thiss!1427)) (index!41324 lt!457190)) key!909) (and ((_ is MissingVacant!9738) lt!457190) (= (index!41326 lt!457190) (index!41325 lt!457181)) (= (select (arr!31404 (_keys!11463 thiss!1427)) (index!41326 lt!457190)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!586505 () SeekEntryResult!9738)

(assert (=> d!125041 (= lt!457190 e!586505)))

(declare-fun c!105033 () Bool)

(assert (=> d!125041 (= c!105033 (bvsge (x!92477 lt!457181) #b01111111111111111111111111111110))))

(declare-fun lt!457189 () (_ BitVec 64))

(assert (=> d!125041 (= lt!457189 (select (arr!31404 (_keys!11463 thiss!1427)) (index!41325 lt!457181)))))

(assert (=> d!125041 (validMask!0 (mask!30177 thiss!1427))))

(assert (=> d!125041 (= (seekKeyOrZeroReturnVacant!0 (x!92477 lt!457181) (index!41325 lt!457181) (index!41325 lt!457181) key!909 (_keys!11463 thiss!1427) (mask!30177 thiss!1427)) lt!457190)))

(declare-fun b!1036950 () Bool)

(declare-fun e!586504 () SeekEntryResult!9738)

(assert (=> b!1036950 (= e!586504 (MissingVacant!9738 (index!41325 lt!457181)))))

(declare-fun b!1036951 () Bool)

(declare-fun c!105031 () Bool)

(assert (=> b!1036951 (= c!105031 (= lt!457189 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586503 () SeekEntryResult!9738)

(assert (=> b!1036951 (= e!586503 e!586504)))

(declare-fun b!1036952 () Bool)

(assert (=> b!1036952 (= e!586505 e!586503)))

(declare-fun c!105032 () Bool)

(assert (=> b!1036952 (= c!105032 (= lt!457189 key!909))))

(declare-fun b!1036953 () Bool)

(assert (=> b!1036953 (= e!586505 Undefined!9738)))

(declare-fun b!1036954 () Bool)

(assert (=> b!1036954 (= e!586503 (Found!9738 (index!41325 lt!457181)))))

(declare-fun b!1036955 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1036955 (= e!586504 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92477 lt!457181) #b00000000000000000000000000000001) (nextIndex!0 (index!41325 lt!457181) (x!92477 lt!457181) (mask!30177 thiss!1427)) (index!41325 lt!457181) key!909 (_keys!11463 thiss!1427) (mask!30177 thiss!1427)))))

(assert (= (and d!125041 c!105033) b!1036953))

(assert (= (and d!125041 (not c!105033)) b!1036952))

(assert (= (and b!1036952 c!105032) b!1036954))

(assert (= (and b!1036952 (not c!105032)) b!1036951))

(assert (= (and b!1036951 c!105031) b!1036950))

(assert (= (and b!1036951 (not c!105031)) b!1036955))

(declare-fun m!956803 () Bool)

(assert (=> d!125041 m!956803))

(declare-fun m!956805 () Bool)

(assert (=> d!125041 m!956805))

(assert (=> d!125041 m!956791))

(assert (=> d!125041 m!956789))

(declare-fun m!956807 () Bool)

(assert (=> b!1036955 m!956807))

(assert (=> b!1036955 m!956807))

(declare-fun m!956809 () Bool)

(assert (=> b!1036955 m!956809))

(assert (=> b!1036909 d!125041))

(declare-fun b!1036964 () Bool)

(declare-fun e!586511 () (_ BitVec 32))

(assert (=> b!1036964 (= e!586511 #b00000000000000000000000000000000)))

(declare-fun d!125043 () Bool)

(declare-fun lt!457193 () (_ BitVec 32))

(assert (=> d!125043 (and (bvsge lt!457193 #b00000000000000000000000000000000) (bvsle lt!457193 (bvsub (size!31935 (_keys!11463 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125043 (= lt!457193 e!586511)))

(declare-fun c!105039 () Bool)

(assert (=> d!125043 (= c!105039 (bvsge #b00000000000000000000000000000000 (size!31935 (_keys!11463 thiss!1427))))))

(assert (=> d!125043 (and (bvsle #b00000000000000000000000000000000 (size!31935 (_keys!11463 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31935 (_keys!11463 thiss!1427)) (size!31935 (_keys!11463 thiss!1427))))))

(assert (=> d!125043 (= (arrayCountValidKeys!0 (_keys!11463 thiss!1427) #b00000000000000000000000000000000 (size!31935 (_keys!11463 thiss!1427))) lt!457193)))

(declare-fun b!1036965 () Bool)

(declare-fun e!586510 () (_ BitVec 32))

(declare-fun call!43885 () (_ BitVec 32))

(assert (=> b!1036965 (= e!586510 (bvadd #b00000000000000000000000000000001 call!43885))))

(declare-fun bm!43882 () Bool)

(assert (=> bm!43882 (= call!43885 (arrayCountValidKeys!0 (_keys!11463 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31935 (_keys!11463 thiss!1427))))))

(declare-fun b!1036966 () Bool)

(assert (=> b!1036966 (= e!586510 call!43885)))

(declare-fun b!1036967 () Bool)

(assert (=> b!1036967 (= e!586511 e!586510)))

(declare-fun c!105038 () Bool)

(assert (=> b!1036967 (= c!105038 (validKeyInArray!0 (select (arr!31404 (_keys!11463 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125043 c!105039) b!1036964))

(assert (= (and d!125043 (not c!105039)) b!1036967))

(assert (= (and b!1036967 c!105038) b!1036965))

(assert (= (and b!1036967 (not c!105038)) b!1036966))

(assert (= (or b!1036965 b!1036966) bm!43882))

(declare-fun m!956811 () Bool)

(assert (=> bm!43882 m!956811))

(assert (=> b!1036967 m!956795))

(assert (=> b!1036967 m!956795))

(assert (=> b!1036967 m!956797))

(assert (=> b!1036894 d!125043))

(declare-fun b!1036977 () Bool)

(declare-fun res!691990 () Bool)

(declare-fun e!586514 () Bool)

(assert (=> b!1036977 (=> (not res!691990) (not e!586514))))

(declare-fun size!31941 (LongMapFixedSize!5788) (_ BitVec 32))

(assert (=> b!1036977 (= res!691990 (bvsge (size!31941 thiss!1427) (_size!2949 thiss!1427)))))

(declare-fun b!1036976 () Bool)

(declare-fun res!691993 () Bool)

(assert (=> b!1036976 (=> (not res!691993) (not e!586514))))

(assert (=> b!1036976 (= res!691993 (and (= (size!31936 (_values!6299 thiss!1427)) (bvadd (mask!30177 thiss!1427) #b00000000000000000000000000000001)) (= (size!31935 (_keys!11463 thiss!1427)) (size!31936 (_values!6299 thiss!1427))) (bvsge (_size!2949 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2949 thiss!1427) (bvadd (mask!30177 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!125045 () Bool)

(declare-fun res!691992 () Bool)

(assert (=> d!125045 (=> (not res!691992) (not e!586514))))

(assert (=> d!125045 (= res!691992 (validMask!0 (mask!30177 thiss!1427)))))

(assert (=> d!125045 (= (simpleValid!415 thiss!1427) e!586514)))

(declare-fun b!1036979 () Bool)

(assert (=> b!1036979 (= e!586514 (and (bvsge (extraKeys!6004 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6004 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2949 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1036978 () Bool)

(declare-fun res!691991 () Bool)

(assert (=> b!1036978 (=> (not res!691991) (not e!586514))))

(assert (=> b!1036978 (= res!691991 (= (size!31941 thiss!1427) (bvadd (_size!2949 thiss!1427) (bvsdiv (bvadd (extraKeys!6004 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!125045 res!691992) b!1036976))

(assert (= (and b!1036976 res!691993) b!1036977))

(assert (= (and b!1036977 res!691990) b!1036978))

(assert (= (and b!1036978 res!691991) b!1036979))

(declare-fun m!956813 () Bool)

(assert (=> b!1036977 m!956813))

(assert (=> d!125045 m!956789))

(assert (=> b!1036978 m!956813))

(assert (=> d!125035 d!125045))

(declare-fun b!1036988 () Bool)

(declare-fun e!586522 () Bool)

(declare-fun e!586523 () Bool)

(assert (=> b!1036988 (= e!586522 e!586523)))

(declare-fun lt!457202 () (_ BitVec 64))

(assert (=> b!1036988 (= lt!457202 (select (arr!31404 (_keys!11463 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33821 0))(
  ( (Unit!33822) )
))
(declare-fun lt!457201 () Unit!33821)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65241 (_ BitVec 64) (_ BitVec 32)) Unit!33821)

(assert (=> b!1036988 (= lt!457201 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11463 thiss!1427) lt!457202 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1036988 (arrayContainsKey!0 (_keys!11463 thiss!1427) lt!457202 #b00000000000000000000000000000000)))

(declare-fun lt!457200 () Unit!33821)

(assert (=> b!1036988 (= lt!457200 lt!457201)))

(declare-fun res!691998 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65241 (_ BitVec 32)) SeekEntryResult!9738)

(assert (=> b!1036988 (= res!691998 (= (seekEntryOrOpen!0 (select (arr!31404 (_keys!11463 thiss!1427)) #b00000000000000000000000000000000) (_keys!11463 thiss!1427) (mask!30177 thiss!1427)) (Found!9738 #b00000000000000000000000000000000)))))

(assert (=> b!1036988 (=> (not res!691998) (not e!586523))))

(declare-fun d!125047 () Bool)

(declare-fun res!691999 () Bool)

(declare-fun e!586521 () Bool)

(assert (=> d!125047 (=> res!691999 e!586521)))

(assert (=> d!125047 (= res!691999 (bvsge #b00000000000000000000000000000000 (size!31935 (_keys!11463 thiss!1427))))))

(assert (=> d!125047 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11463 thiss!1427) (mask!30177 thiss!1427)) e!586521)))

(declare-fun b!1036989 () Bool)

(declare-fun call!43888 () Bool)

(assert (=> b!1036989 (= e!586523 call!43888)))

(declare-fun b!1036990 () Bool)

(assert (=> b!1036990 (= e!586522 call!43888)))

(declare-fun bm!43885 () Bool)

(assert (=> bm!43885 (= call!43888 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11463 thiss!1427) (mask!30177 thiss!1427)))))

(declare-fun b!1036991 () Bool)

(assert (=> b!1036991 (= e!586521 e!586522)))

(declare-fun c!105042 () Bool)

(assert (=> b!1036991 (= c!105042 (validKeyInArray!0 (select (arr!31404 (_keys!11463 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125047 (not res!691999)) b!1036991))

(assert (= (and b!1036991 c!105042) b!1036988))

(assert (= (and b!1036991 (not c!105042)) b!1036990))

(assert (= (and b!1036988 res!691998) b!1036989))

(assert (= (or b!1036989 b!1036990) bm!43885))

(assert (=> b!1036988 m!956795))

(declare-fun m!956815 () Bool)

(assert (=> b!1036988 m!956815))

(declare-fun m!956817 () Bool)

(assert (=> b!1036988 m!956817))

(assert (=> b!1036988 m!956795))

(declare-fun m!956819 () Bool)

(assert (=> b!1036988 m!956819))

(declare-fun m!956821 () Bool)

(assert (=> bm!43885 m!956821))

(assert (=> b!1036991 m!956795))

(assert (=> b!1036991 m!956795))

(assert (=> b!1036991 m!956797))

(assert (=> b!1036895 d!125047))

(declare-fun b!1037010 () Bool)

(declare-fun e!586536 () SeekEntryResult!9738)

(assert (=> b!1037010 (= e!586536 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30177 thiss!1427)) #b00000000000000000000000000000000 (mask!30177 thiss!1427)) key!909 (_keys!11463 thiss!1427) (mask!30177 thiss!1427)))))

(declare-fun b!1037011 () Bool)

(assert (=> b!1037011 (= e!586536 (Intermediate!9738 false (toIndex!0 key!909 (mask!30177 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1037012 () Bool)

(declare-fun e!586537 () SeekEntryResult!9738)

(assert (=> b!1037012 (= e!586537 (Intermediate!9738 true (toIndex!0 key!909 (mask!30177 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1037013 () Bool)

(declare-fun lt!457207 () SeekEntryResult!9738)

(assert (=> b!1037013 (and (bvsge (index!41325 lt!457207) #b00000000000000000000000000000000) (bvslt (index!41325 lt!457207) (size!31935 (_keys!11463 thiss!1427))))))

(declare-fun e!586538 () Bool)

(assert (=> b!1037013 (= e!586538 (= (select (arr!31404 (_keys!11463 thiss!1427)) (index!41325 lt!457207)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037014 () Bool)

(declare-fun e!586535 () Bool)

(assert (=> b!1037014 (= e!586535 (bvsge (x!92477 lt!457207) #b01111111111111111111111111111110))))

(declare-fun b!1037015 () Bool)

(assert (=> b!1037015 (and (bvsge (index!41325 lt!457207) #b00000000000000000000000000000000) (bvslt (index!41325 lt!457207) (size!31935 (_keys!11463 thiss!1427))))))

(declare-fun res!692008 () Bool)

(assert (=> b!1037015 (= res!692008 (= (select (arr!31404 (_keys!11463 thiss!1427)) (index!41325 lt!457207)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037015 (=> res!692008 e!586538)))

(declare-fun b!1037017 () Bool)

(assert (=> b!1037017 (= e!586537 e!586536)))

(declare-fun c!105051 () Bool)

(declare-fun lt!457208 () (_ BitVec 64))

(assert (=> b!1037017 (= c!105051 (or (= lt!457208 key!909) (= (bvadd lt!457208 lt!457208) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037018 () Bool)

(declare-fun e!586534 () Bool)

(assert (=> b!1037018 (= e!586535 e!586534)))

(declare-fun res!692007 () Bool)

(assert (=> b!1037018 (= res!692007 (and ((_ is Intermediate!9738) lt!457207) (not (undefined!10550 lt!457207)) (bvslt (x!92477 lt!457207) #b01111111111111111111111111111110) (bvsge (x!92477 lt!457207) #b00000000000000000000000000000000) (bvsge (x!92477 lt!457207) #b00000000000000000000000000000000)))))

(assert (=> b!1037018 (=> (not res!692007) (not e!586534))))

(declare-fun b!1037016 () Bool)

(assert (=> b!1037016 (and (bvsge (index!41325 lt!457207) #b00000000000000000000000000000000) (bvslt (index!41325 lt!457207) (size!31935 (_keys!11463 thiss!1427))))))

(declare-fun res!692006 () Bool)

(assert (=> b!1037016 (= res!692006 (= (select (arr!31404 (_keys!11463 thiss!1427)) (index!41325 lt!457207)) key!909))))

(assert (=> b!1037016 (=> res!692006 e!586538)))

(assert (=> b!1037016 (= e!586534 e!586538)))

(declare-fun d!125049 () Bool)

(assert (=> d!125049 e!586535))

(declare-fun c!105049 () Bool)

(assert (=> d!125049 (= c!105049 (and ((_ is Intermediate!9738) lt!457207) (undefined!10550 lt!457207)))))

(assert (=> d!125049 (= lt!457207 e!586537)))

(declare-fun c!105050 () Bool)

(assert (=> d!125049 (= c!105050 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!125049 (= lt!457208 (select (arr!31404 (_keys!11463 thiss!1427)) (toIndex!0 key!909 (mask!30177 thiss!1427))))))

(assert (=> d!125049 (validMask!0 (mask!30177 thiss!1427))))

(assert (=> d!125049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30177 thiss!1427)) key!909 (_keys!11463 thiss!1427) (mask!30177 thiss!1427)) lt!457207)))

(assert (= (and d!125049 c!105050) b!1037012))

(assert (= (and d!125049 (not c!105050)) b!1037017))

(assert (= (and b!1037017 c!105051) b!1037011))

(assert (= (and b!1037017 (not c!105051)) b!1037010))

(assert (= (and d!125049 c!105049) b!1037014))

(assert (= (and d!125049 (not c!105049)) b!1037018))

(assert (= (and b!1037018 res!692007) b!1037016))

(assert (= (and b!1037016 (not res!692006)) b!1037015))

(assert (= (and b!1037015 (not res!692008)) b!1037013))

(declare-fun m!956823 () Bool)

(assert (=> b!1037015 m!956823))

(assert (=> b!1037016 m!956823))

(assert (=> b!1037013 m!956823))

(assert (=> d!125049 m!956785))

(declare-fun m!956825 () Bool)

(assert (=> d!125049 m!956825))

(assert (=> d!125049 m!956789))

(assert (=> b!1037010 m!956785))

(declare-fun m!956827 () Bool)

(assert (=> b!1037010 m!956827))

(assert (=> b!1037010 m!956827))

(declare-fun m!956829 () Bool)

(assert (=> b!1037010 m!956829))

(assert (=> d!125037 d!125049))

(declare-fun d!125051 () Bool)

(declare-fun lt!457214 () (_ BitVec 32))

(declare-fun lt!457213 () (_ BitVec 32))

(assert (=> d!125051 (= lt!457214 (bvmul (bvxor lt!457213 (bvlshr lt!457213 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125051 (= lt!457213 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125051 (and (bvsge (mask!30177 thiss!1427) #b00000000000000000000000000000000) (let ((res!692009 (let ((h!23153 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92496 (bvmul (bvxor h!23153 (bvlshr h!23153 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92496 (bvlshr x!92496 #b00000000000000000000000000001101)) (mask!30177 thiss!1427)))))) (and (bvslt res!692009 (bvadd (mask!30177 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!692009 #b00000000000000000000000000000000))))))

(assert (=> d!125051 (= (toIndex!0 key!909 (mask!30177 thiss!1427)) (bvand (bvxor lt!457214 (bvlshr lt!457214 #b00000000000000000000000000001101)) (mask!30177 thiss!1427)))))

(assert (=> d!125037 d!125051))

(declare-fun d!125053 () Bool)

(assert (=> d!125053 (= (validMask!0 (mask!30177 thiss!1427)) (and (or (= (mask!30177 thiss!1427) #b00000000000000000000000000000111) (= (mask!30177 thiss!1427) #b00000000000000000000000000001111) (= (mask!30177 thiss!1427) #b00000000000000000000000000011111) (= (mask!30177 thiss!1427) #b00000000000000000000000000111111) (= (mask!30177 thiss!1427) #b00000000000000000000000001111111) (= (mask!30177 thiss!1427) #b00000000000000000000000011111111) (= (mask!30177 thiss!1427) #b00000000000000000000000111111111) (= (mask!30177 thiss!1427) #b00000000000000000000001111111111) (= (mask!30177 thiss!1427) #b00000000000000000000011111111111) (= (mask!30177 thiss!1427) #b00000000000000000000111111111111) (= (mask!30177 thiss!1427) #b00000000000000000001111111111111) (= (mask!30177 thiss!1427) #b00000000000000000011111111111111) (= (mask!30177 thiss!1427) #b00000000000000000111111111111111) (= (mask!30177 thiss!1427) #b00000000000000001111111111111111) (= (mask!30177 thiss!1427) #b00000000000000011111111111111111) (= (mask!30177 thiss!1427) #b00000000000000111111111111111111) (= (mask!30177 thiss!1427) #b00000000000001111111111111111111) (= (mask!30177 thiss!1427) #b00000000000011111111111111111111) (= (mask!30177 thiss!1427) #b00000000000111111111111111111111) (= (mask!30177 thiss!1427) #b00000000001111111111111111111111) (= (mask!30177 thiss!1427) #b00000000011111111111111111111111) (= (mask!30177 thiss!1427) #b00000000111111111111111111111111) (= (mask!30177 thiss!1427) #b00000001111111111111111111111111) (= (mask!30177 thiss!1427) #b00000011111111111111111111111111) (= (mask!30177 thiss!1427) #b00000111111111111111111111111111) (= (mask!30177 thiss!1427) #b00001111111111111111111111111111) (= (mask!30177 thiss!1427) #b00011111111111111111111111111111) (= (mask!30177 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30177 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!125037 d!125053))

(declare-fun b!1037019 () Bool)

(declare-fun e!586539 () Bool)

(assert (=> b!1037019 (= e!586539 tp_is_empty!24601)))

(declare-fun mapNonEmpty!38433 () Bool)

(declare-fun mapRes!38433 () Bool)

(declare-fun tp!73798 () Bool)

(assert (=> mapNonEmpty!38433 (= mapRes!38433 (and tp!73798 e!586539))))

(declare-fun mapRest!38433 () (Array (_ BitVec 32) ValueCell!11597))

(declare-fun mapValue!38433 () ValueCell!11597)

(declare-fun mapKey!38433 () (_ BitVec 32))

(assert (=> mapNonEmpty!38433 (= mapRest!38432 (store mapRest!38433 mapKey!38433 mapValue!38433))))

(declare-fun mapIsEmpty!38433 () Bool)

(assert (=> mapIsEmpty!38433 mapRes!38433))

(declare-fun condMapEmpty!38433 () Bool)

(declare-fun mapDefault!38433 () ValueCell!11597)

(assert (=> mapNonEmpty!38432 (= condMapEmpty!38433 (= mapRest!38432 ((as const (Array (_ BitVec 32) ValueCell!11597)) mapDefault!38433)))))

(declare-fun e!586540 () Bool)

(assert (=> mapNonEmpty!38432 (= tp!73797 (and e!586540 mapRes!38433))))

(declare-fun b!1037020 () Bool)

(assert (=> b!1037020 (= e!586540 tp_is_empty!24601)))

(assert (= (and mapNonEmpty!38432 condMapEmpty!38433) mapIsEmpty!38433))

(assert (= (and mapNonEmpty!38432 (not condMapEmpty!38433)) mapNonEmpty!38433))

(assert (= (and mapNonEmpty!38433 ((_ is ValueCellFull!11597) mapValue!38433)) b!1037019))

(assert (= (and mapNonEmpty!38432 ((_ is ValueCellFull!11597) mapDefault!38433)) b!1037020))

(declare-fun m!956831 () Bool)

(assert (=> mapNonEmpty!38433 m!956831))

(check-sat (not b!1036936) (not b!1036978) (not b!1036933) (not d!125045) (not b!1036967) (not b!1036988) (not bm!43882) (not d!125049) (not bm!43879) tp_is_empty!24601 b_and!33387 (not b!1036977) (not b!1036955) (not b!1036991) (not b!1037010) (not b!1036935) (not d!125041) (not bm!43885) (not mapNonEmpty!38433) (not b_next!20881))
(check-sat b_and!33387 (not b_next!20881))
