; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3276 () Bool)

(assert start!3276)

(declare-fun b!20053 () Bool)

(declare-fun b_free!705 () Bool)

(declare-fun b_next!705 () Bool)

(assert (=> b!20053 (= b_free!705 (not b_next!705))))

(declare-fun tp!3340 () Bool)

(declare-fun b_and!1377 () Bool)

(assert (=> b!20053 (= tp!3340 b_and!1377)))

(declare-fun e!13068 () Bool)

(declare-fun tp_is_empty!969 () Bool)

(declare-datatypes ((V!1117 0))(
  ( (V!1118 (val!511 Int)) )
))
(declare-datatypes ((ValueCell!285 0))(
  ( (ValueCellFull!285 (v!1539 V!1117)) (EmptyCell!285) )
))
(declare-datatypes ((array!1161 0))(
  ( (array!1162 (arr!553 (Array (_ BitVec 32) ValueCell!285)) (size!646 (_ BitVec 32))) )
))
(declare-datatypes ((array!1163 0))(
  ( (array!1164 (arr!554 (Array (_ BitVec 32) (_ BitVec 64))) (size!647 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!156 0))(
  ( (LongMapFixedSize!157 (defaultEntry!1700 Int) (mask!4660 (_ BitVec 32)) (extraKeys!1607 (_ BitVec 32)) (zeroValue!1631 V!1117) (minValue!1631 V!1117) (_size!115 (_ BitVec 32)) (_keys!3125 array!1163) (_values!1693 array!1161) (_vacant!115 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!156 0))(
  ( (Cell!157 (v!1540 LongMapFixedSize!156)) )
))
(declare-datatypes ((LongMap!156 0))(
  ( (LongMap!157 (underlying!89 Cell!156)) )
))
(declare-fun thiss!938 () LongMap!156)

(declare-fun e!13074 () Bool)

(declare-fun array_inv!377 (array!1163) Bool)

(declare-fun array_inv!378 (array!1161) Bool)

(assert (=> b!20053 (= e!13068 (and tp!3340 tp_is_empty!969 (array_inv!377 (_keys!3125 (v!1540 (underlying!89 thiss!938)))) (array_inv!378 (_values!1693 (v!1540 (underlying!89 thiss!938)))) e!13074))))

(declare-fun b!20054 () Bool)

(declare-fun e!13075 () Bool)

(declare-fun mapRes!922 () Bool)

(assert (=> b!20054 (= e!13074 (and e!13075 mapRes!922))))

(declare-fun condMapEmpty!922 () Bool)

(declare-fun mapDefault!922 () ValueCell!285)

(assert (=> b!20054 (= condMapEmpty!922 (= (arr!553 (_values!1693 (v!1540 (underlying!89 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!285)) mapDefault!922)))))

(declare-fun b!20055 () Bool)

(assert (=> b!20055 (= e!13075 tp_is_empty!969)))

(declare-fun b!20056 () Bool)

(declare-fun e!13070 () Bool)

(assert (=> b!20056 (= e!13070 e!13068)))

(declare-fun mapNonEmpty!922 () Bool)

(declare-fun tp!3339 () Bool)

(declare-fun e!13072 () Bool)

(assert (=> mapNonEmpty!922 (= mapRes!922 (and tp!3339 e!13072))))

(declare-fun mapRest!922 () (Array (_ BitVec 32) ValueCell!285))

(declare-fun mapKey!922 () (_ BitVec 32))

(declare-fun mapValue!922 () ValueCell!285)

(assert (=> mapNonEmpty!922 (= (arr!553 (_values!1693 (v!1540 (underlying!89 thiss!938)))) (store mapRest!922 mapKey!922 mapValue!922))))

(declare-fun b!20057 () Bool)

(declare-fun e!13076 () Bool)

(declare-fun lt!5769 () LongMapFixedSize!156)

(declare-fun valid!77 (LongMapFixedSize!156) Bool)

(assert (=> b!20057 (= e!13076 (not (valid!77 lt!5769)))))

(declare-fun b!20058 () Bool)

(declare-fun e!13069 () Bool)

(assert (=> b!20058 (= e!13069 e!13076)))

(declare-fun res!13381 () Bool)

(assert (=> b!20058 (=> (not res!13381) (not e!13076))))

(assert (=> b!20058 (= res!13381 (and (= (bvand (extraKeys!1607 (v!1540 (underlying!89 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand (extraKeys!1607 (v!1540 (underlying!89 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun getNewLongMapFixedSize!18 ((_ BitVec 32) Int) LongMapFixedSize!156)

(declare-fun computeNewMask!14 (LongMap!156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20058 (= lt!5769 (getNewLongMapFixedSize!18 (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) (defaultEntry!1700 (v!1540 (underlying!89 thiss!938)))))))

(declare-fun res!13380 () Bool)

(assert (=> start!3276 (=> (not res!13380) (not e!13069))))

(declare-fun valid!78 (LongMap!156) Bool)

(assert (=> start!3276 (= res!13380 (valid!78 thiss!938))))

(assert (=> start!3276 e!13069))

(declare-fun e!13073 () Bool)

(assert (=> start!3276 e!13073))

(declare-fun b!20059 () Bool)

(assert (=> b!20059 (= e!13073 e!13070)))

(declare-fun b!20060 () Bool)

(assert (=> b!20060 (= e!13072 tp_is_empty!969)))

(declare-fun mapIsEmpty!922 () Bool)

(assert (=> mapIsEmpty!922 mapRes!922))

(assert (= (and start!3276 res!13380) b!20058))

(assert (= (and b!20058 res!13381) b!20057))

(assert (= (and b!20054 condMapEmpty!922) mapIsEmpty!922))

(assert (= (and b!20054 (not condMapEmpty!922)) mapNonEmpty!922))

(get-info :version)

(assert (= (and mapNonEmpty!922 ((_ is ValueCellFull!285) mapValue!922)) b!20060))

(assert (= (and b!20054 ((_ is ValueCellFull!285) mapDefault!922)) b!20055))

(assert (= b!20053 b!20054))

(assert (= b!20056 b!20053))

(assert (= b!20059 b!20056))

(assert (= start!3276 b!20059))

(declare-fun m!14103 () Bool)

(assert (=> b!20053 m!14103))

(declare-fun m!14105 () Bool)

(assert (=> b!20053 m!14105))

(declare-fun m!14107 () Bool)

(assert (=> b!20057 m!14107))

(declare-fun m!14109 () Bool)

(assert (=> b!20058 m!14109))

(assert (=> b!20058 m!14109))

(declare-fun m!14111 () Bool)

(assert (=> b!20058 m!14111))

(declare-fun m!14113 () Bool)

(assert (=> mapNonEmpty!922 m!14113))

(declare-fun m!14115 () Bool)

(assert (=> start!3276 m!14115))

(check-sat (not b!20053) tp_is_empty!969 (not b!20058) (not mapNonEmpty!922) (not b_next!705) b_and!1377 (not b!20057) (not start!3276))
(check-sat b_and!1377 (not b_next!705))
(get-model)

(declare-fun b!20097 () Bool)

(declare-datatypes ((Unit!412 0))(
  ( (Unit!413) )
))
(declare-fun e!13112 () Unit!412)

(declare-fun Unit!414 () Unit!412)

(assert (=> b!20097 (= e!13112 Unit!414)))

(declare-datatypes ((tuple2!834 0))(
  ( (tuple2!835 (_1!420 (_ BitVec 64)) (_2!420 V!1117)) )
))
(declare-fun lt!5838 () tuple2!834)

(declare-fun lt!5841 () LongMapFixedSize!156)

(declare-datatypes ((List!553 0))(
  ( (Nil!550) (Cons!549 (h!1115 tuple2!834) (t!3204 List!553)) )
))
(declare-fun head!823 (List!553) tuple2!834)

(declare-datatypes ((ListLongMap!551 0))(
  ( (ListLongMap!552 (toList!291 List!553)) )
))
(declare-fun map!381 (LongMapFixedSize!156) ListLongMap!551)

(assert (=> b!20097 (= lt!5838 (head!823 (toList!291 (map!381 lt!5841))))))

(declare-fun lt!5832 () array!1163)

(assert (=> b!20097 (= lt!5832 (array!1164 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5820 () (_ BitVec 32))

(assert (=> b!20097 (= lt!5820 #b00000000000000000000000000000000)))

(declare-fun lt!5819 () Unit!412)

(declare-fun lemmaKeyInListMapIsInArray!84 (array!1163 array!1161 (_ BitVec 32) (_ BitVec 32) V!1117 V!1117 (_ BitVec 64) Int) Unit!412)

(declare-fun dynLambda!137 (Int (_ BitVec 64)) V!1117)

(assert (=> b!20097 (= lt!5819 (lemmaKeyInListMapIsInArray!84 lt!5832 (array!1162 ((as const (Array (_ BitVec 32) ValueCell!285)) EmptyCell!285) (bvadd (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) lt!5820 (dynLambda!137 (defaultEntry!1700 (v!1540 (underlying!89 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!137 (defaultEntry!1700 (v!1540 (underlying!89 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!420 lt!5838) (defaultEntry!1700 (v!1540 (underlying!89 thiss!938)))))))

(declare-fun c!2151 () Bool)

(assert (=> b!20097 (= c!2151 (and (not (= (_1!420 lt!5838) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!420 lt!5838) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!13110 () Bool)

(assert (=> b!20097 e!13110))

(declare-fun lt!5822 () Unit!412)

(assert (=> b!20097 (= lt!5822 lt!5819)))

(declare-fun lt!5834 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1163 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20097 (= lt!5834 (arrayScanForKey!0 (array!1164 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000001)) (_1!420 lt!5838) #b00000000000000000000000000000000))))

(assert (=> b!20097 false))

(declare-fun b!20098 () Bool)

(declare-fun e!13111 () Bool)

(declare-fun lt!5824 () LongMapFixedSize!156)

(assert (=> b!20098 (= e!13111 (= (map!381 lt!5824) (ListLongMap!552 Nil!550)))))

(declare-fun b!20099 () Bool)

(declare-fun arrayContainsKey!0 (array!1163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!20099 (= e!13110 (arrayContainsKey!0 lt!5832 (_1!420 lt!5838) #b00000000000000000000000000000000))))

(declare-fun b!20100 () Bool)

(declare-fun Unit!415 () Unit!412)

(assert (=> b!20100 (= e!13112 Unit!415)))

(declare-fun d!3663 () Bool)

(assert (=> d!3663 e!13111))

(declare-fun res!13392 () Bool)

(assert (=> d!3663 (=> (not res!13392) (not e!13111))))

(assert (=> d!3663 (= res!13392 (valid!77 lt!5824))))

(assert (=> d!3663 (= lt!5824 lt!5841)))

(declare-fun lt!5831 () Unit!412)

(assert (=> d!3663 (= lt!5831 e!13112)))

(declare-fun c!2150 () Bool)

(assert (=> d!3663 (= c!2150 (not (= (map!381 lt!5841) (ListLongMap!552 Nil!550))))))

(declare-fun lt!5823 () Unit!412)

(declare-fun lt!5839 () Unit!412)

(assert (=> d!3663 (= lt!5823 lt!5839)))

(declare-fun lt!5826 () array!1163)

(declare-fun lt!5828 () (_ BitVec 32))

(declare-datatypes ((List!554 0))(
  ( (Nil!551) (Cons!550 (h!1116 (_ BitVec 64)) (t!3205 List!554)) )
))
(declare-fun lt!5836 () List!554)

(declare-fun arrayNoDuplicates!0 (array!1163 (_ BitVec 32) List!554) Bool)

(assert (=> d!3663 (arrayNoDuplicates!0 lt!5826 lt!5828 lt!5836)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1163 (_ BitVec 32) (_ BitVec 32) List!554) Unit!412)

(assert (=> d!3663 (= lt!5839 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5826 lt!5828 (bvadd (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000001) lt!5836))))

(assert (=> d!3663 (= lt!5836 Nil!551)))

(assert (=> d!3663 (= lt!5828 #b00000000000000000000000000000000)))

(assert (=> d!3663 (= lt!5826 (array!1164 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5827 () Unit!412)

(declare-fun lt!5835 () Unit!412)

(assert (=> d!3663 (= lt!5827 lt!5835)))

(declare-fun lt!5837 () (_ BitVec 32))

(declare-fun lt!5829 () array!1163)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1163 (_ BitVec 32)) Bool)

(assert (=> d!3663 (arrayForallSeekEntryOrOpenFound!0 lt!5837 lt!5829 (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1163 (_ BitVec 32) (_ BitVec 32)) Unit!412)

(assert (=> d!3663 (= lt!5835 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5829 (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) lt!5837))))

(assert (=> d!3663 (= lt!5837 #b00000000000000000000000000000000)))

(assert (=> d!3663 (= lt!5829 (array!1164 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5825 () Unit!412)

(declare-fun lt!5840 () Unit!412)

(assert (=> d!3663 (= lt!5825 lt!5840)))

(declare-fun lt!5821 () array!1163)

(declare-fun lt!5830 () (_ BitVec 32))

(declare-fun lt!5833 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1163 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3663 (= (arrayCountValidKeys!0 lt!5821 lt!5830 lt!5833) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1163 (_ BitVec 32) (_ BitVec 32)) Unit!412)

(assert (=> d!3663 (= lt!5840 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5821 lt!5830 lt!5833))))

(assert (=> d!3663 (= lt!5833 (bvadd (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3663 (= lt!5830 #b00000000000000000000000000000000)))

(assert (=> d!3663 (= lt!5821 (array!1164 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3663 (= lt!5841 (LongMapFixedSize!157 (defaultEntry!1700 (v!1540 (underlying!89 thiss!938))) (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!137 (defaultEntry!1700 (v!1540 (underlying!89 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!137 (defaultEntry!1700 (v!1540 (underlying!89 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1164 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000001)) (array!1162 ((as const (Array (_ BitVec 32) ValueCell!285)) EmptyCell!285) (bvadd (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3663 (validMask!0 (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))))))

(assert (=> d!3663 (= (getNewLongMapFixedSize!18 (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) (defaultEntry!1700 (v!1540 (underlying!89 thiss!938)))) lt!5824)))

(declare-fun b!20101 () Bool)

(assert (=> b!20101 (= e!13110 (ite (= (_1!420 lt!5838) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5820 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5820 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!20102 () Bool)

(declare-fun res!13393 () Bool)

(assert (=> b!20102 (=> (not res!13393) (not e!13111))))

(assert (=> b!20102 (= res!13393 (= (mask!4660 lt!5824) (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938))))))))

(assert (= (and d!3663 c!2150) b!20097))

(assert (= (and d!3663 (not c!2150)) b!20100))

(assert (= (and b!20097 c!2151) b!20099))

(assert (= (and b!20097 (not c!2151)) b!20101))

(assert (= (and d!3663 res!13392) b!20102))

(assert (= (and b!20102 res!13393) b!20098))

(declare-fun b_lambda!1489 () Bool)

(assert (=> (not b_lambda!1489) (not b!20097)))

(declare-fun t!3203 () Bool)

(declare-fun tb!637 () Bool)

(assert (=> (and b!20053 (= (defaultEntry!1700 (v!1540 (underlying!89 thiss!938))) (defaultEntry!1700 (v!1540 (underlying!89 thiss!938)))) t!3203) tb!637))

(declare-fun result!1045 () Bool)

(assert (=> tb!637 (= result!1045 tp_is_empty!969)))

(assert (=> b!20097 t!3203))

(declare-fun b_and!1381 () Bool)

(assert (= b_and!1377 (and (=> t!3203 result!1045) b_and!1381)))

(declare-fun b_lambda!1491 () Bool)

(assert (=> (not b_lambda!1491) (not d!3663)))

(assert (=> d!3663 t!3203))

(declare-fun b_and!1383 () Bool)

(assert (= b_and!1381 (and (=> t!3203 result!1045) b_and!1383)))

(declare-fun m!14131 () Bool)

(assert (=> b!20097 m!14131))

(declare-fun m!14133 () Bool)

(assert (=> b!20097 m!14133))

(declare-fun m!14135 () Bool)

(assert (=> b!20097 m!14135))

(assert (=> b!20097 m!14109))

(assert (=> b!20097 m!14133))

(assert (=> b!20097 m!14133))

(declare-fun m!14137 () Bool)

(assert (=> b!20097 m!14137))

(declare-fun m!14139 () Bool)

(assert (=> b!20097 m!14139))

(declare-fun m!14141 () Bool)

(assert (=> b!20098 m!14141))

(declare-fun m!14143 () Bool)

(assert (=> b!20099 m!14143))

(assert (=> d!3663 m!14133))

(declare-fun m!14145 () Bool)

(assert (=> d!3663 m!14145))

(declare-fun m!14147 () Bool)

(assert (=> d!3663 m!14147))

(declare-fun m!14149 () Bool)

(assert (=> d!3663 m!14149))

(declare-fun m!14151 () Bool)

(assert (=> d!3663 m!14151))

(assert (=> d!3663 m!14139))

(assert (=> d!3663 m!14109))

(declare-fun m!14153 () Bool)

(assert (=> d!3663 m!14153))

(declare-fun m!14155 () Bool)

(assert (=> d!3663 m!14155))

(assert (=> d!3663 m!14109))

(declare-fun m!14157 () Bool)

(assert (=> d!3663 m!14157))

(assert (=> d!3663 m!14109))

(declare-fun m!14159 () Bool)

(assert (=> d!3663 m!14159))

(assert (=> b!20058 d!3663))

(declare-fun d!3665 () Bool)

(declare-fun e!13118 () Bool)

(assert (=> d!3665 e!13118))

(declare-fun res!13396 () Bool)

(assert (=> d!3665 (=> (not res!13396) (not e!13118))))

(declare-fun lt!5847 () (_ BitVec 32))

(assert (=> d!3665 (= res!13396 (validMask!0 lt!5847))))

(declare-datatypes ((tuple2!836 0))(
  ( (tuple2!837 (_1!421 Unit!412) (_2!421 (_ BitVec 32))) )
))
(declare-fun e!13117 () tuple2!836)

(assert (=> d!3665 (= lt!5847 (_2!421 e!13117))))

(declare-fun c!2154 () Bool)

(declare-fun lt!5846 () tuple2!836)

(assert (=> d!3665 (= c!2154 (and (bvsgt (_2!421 lt!5846) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!115 (v!1540 (underlying!89 thiss!938)))) (_2!421 lt!5846)) (bvsge (bvadd (bvand (bvashr (_2!421 lt!5846) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!115 (v!1540 (underlying!89 thiss!938))))))))

(declare-fun Unit!416 () Unit!412)

(declare-fun Unit!417 () Unit!412)

(assert (=> d!3665 (= lt!5846 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!115 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))))) (mask!4660 (v!1540 (underlying!89 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!115 (v!1540 (underlying!89 thiss!938)))) (mask!4660 (v!1540 (underlying!89 thiss!938))))) (tuple2!837 Unit!416 (bvand (bvadd (bvshl (mask!4660 (v!1540 (underlying!89 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!837 Unit!417 (mask!4660 (v!1540 (underlying!89 thiss!938))))))))

(assert (=> d!3665 (validMask!0 (mask!4660 (v!1540 (underlying!89 thiss!938))))))

(assert (=> d!3665 (= (computeNewMask!14 thiss!938 (mask!4660 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (_size!115 (v!1540 (underlying!89 thiss!938)))) lt!5847)))

(declare-fun b!20111 () Bool)

(declare-fun computeNewMaskWhile!7 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!836)

(assert (=> b!20111 (= e!13117 (computeNewMaskWhile!7 (_size!115 (v!1540 (underlying!89 thiss!938))) (_vacant!115 (v!1540 (underlying!89 thiss!938))) (mask!4660 (v!1540 (underlying!89 thiss!938))) (_2!421 lt!5846)))))

(declare-fun b!20112 () Bool)

(declare-fun Unit!418 () Unit!412)

(assert (=> b!20112 (= e!13117 (tuple2!837 Unit!418 (_2!421 lt!5846)))))

(declare-fun b!20113 () Bool)

(assert (=> b!20113 (= e!13118 (bvsle (_size!115 (v!1540 (underlying!89 thiss!938))) (bvadd lt!5847 #b00000000000000000000000000000001)))))

(assert (= (and d!3665 c!2154) b!20111))

(assert (= (and d!3665 (not c!2154)) b!20112))

(assert (= (and d!3665 res!13396) b!20113))

(declare-fun m!14161 () Bool)

(assert (=> d!3665 m!14161))

(declare-fun m!14163 () Bool)

(assert (=> d!3665 m!14163))

(declare-fun m!14165 () Bool)

(assert (=> b!20111 m!14165))

(assert (=> b!20058 d!3665))

(declare-fun d!3667 () Bool)

(declare-fun res!13403 () Bool)

(declare-fun e!13121 () Bool)

(assert (=> d!3667 (=> (not res!13403) (not e!13121))))

(declare-fun simpleValid!16 (LongMapFixedSize!156) Bool)

(assert (=> d!3667 (= res!13403 (simpleValid!16 lt!5769))))

(assert (=> d!3667 (= (valid!77 lt!5769) e!13121)))

(declare-fun b!20120 () Bool)

(declare-fun res!13404 () Bool)

(assert (=> b!20120 (=> (not res!13404) (not e!13121))))

(assert (=> b!20120 (= res!13404 (= (arrayCountValidKeys!0 (_keys!3125 lt!5769) #b00000000000000000000000000000000 (size!647 (_keys!3125 lt!5769))) (_size!115 lt!5769)))))

(declare-fun b!20121 () Bool)

(declare-fun res!13405 () Bool)

(assert (=> b!20121 (=> (not res!13405) (not e!13121))))

(assert (=> b!20121 (= res!13405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3125 lt!5769) (mask!4660 lt!5769)))))

(declare-fun b!20122 () Bool)

(assert (=> b!20122 (= e!13121 (arrayNoDuplicates!0 (_keys!3125 lt!5769) #b00000000000000000000000000000000 Nil!551))))

(assert (= (and d!3667 res!13403) b!20120))

(assert (= (and b!20120 res!13404) b!20121))

(assert (= (and b!20121 res!13405) b!20122))

(declare-fun m!14167 () Bool)

(assert (=> d!3667 m!14167))

(declare-fun m!14169 () Bool)

(assert (=> b!20120 m!14169))

(declare-fun m!14171 () Bool)

(assert (=> b!20121 m!14171))

(declare-fun m!14173 () Bool)

(assert (=> b!20122 m!14173))

(assert (=> b!20057 d!3667))

(declare-fun d!3669 () Bool)

(assert (=> d!3669 (= (array_inv!377 (_keys!3125 (v!1540 (underlying!89 thiss!938)))) (bvsge (size!647 (_keys!3125 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20053 d!3669))

(declare-fun d!3671 () Bool)

(assert (=> d!3671 (= (array_inv!378 (_values!1693 (v!1540 (underlying!89 thiss!938)))) (bvsge (size!646 (_values!1693 (v!1540 (underlying!89 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!20053 d!3671))

(declare-fun d!3673 () Bool)

(assert (=> d!3673 (= (valid!78 thiss!938) (valid!77 (v!1540 (underlying!89 thiss!938))))))

(declare-fun bs!890 () Bool)

(assert (= bs!890 d!3673))

(declare-fun m!14175 () Bool)

(assert (=> bs!890 m!14175))

(assert (=> start!3276 d!3673))

(declare-fun mapIsEmpty!928 () Bool)

(declare-fun mapRes!928 () Bool)

(assert (=> mapIsEmpty!928 mapRes!928))

(declare-fun mapNonEmpty!928 () Bool)

(declare-fun tp!3349 () Bool)

(declare-fun e!13126 () Bool)

(assert (=> mapNonEmpty!928 (= mapRes!928 (and tp!3349 e!13126))))

(declare-fun mapKey!928 () (_ BitVec 32))

(declare-fun mapRest!928 () (Array (_ BitVec 32) ValueCell!285))

(declare-fun mapValue!928 () ValueCell!285)

(assert (=> mapNonEmpty!928 (= mapRest!922 (store mapRest!928 mapKey!928 mapValue!928))))

(declare-fun b!20129 () Bool)

(assert (=> b!20129 (= e!13126 tp_is_empty!969)))

(declare-fun condMapEmpty!928 () Bool)

(declare-fun mapDefault!928 () ValueCell!285)

(assert (=> mapNonEmpty!922 (= condMapEmpty!928 (= mapRest!922 ((as const (Array (_ BitVec 32) ValueCell!285)) mapDefault!928)))))

(declare-fun e!13127 () Bool)

(assert (=> mapNonEmpty!922 (= tp!3339 (and e!13127 mapRes!928))))

(declare-fun b!20130 () Bool)

(assert (=> b!20130 (= e!13127 tp_is_empty!969)))

(assert (= (and mapNonEmpty!922 condMapEmpty!928) mapIsEmpty!928))

(assert (= (and mapNonEmpty!922 (not condMapEmpty!928)) mapNonEmpty!928))

(assert (= (and mapNonEmpty!928 ((_ is ValueCellFull!285) mapValue!928)) b!20129))

(assert (= (and mapNonEmpty!922 ((_ is ValueCellFull!285) mapDefault!928)) b!20130))

(declare-fun m!14177 () Bool)

(assert (=> mapNonEmpty!928 m!14177))

(declare-fun b_lambda!1493 () Bool)

(assert (= b_lambda!1489 (or (and b!20053 b_free!705) b_lambda!1493)))

(declare-fun b_lambda!1495 () Bool)

(assert (= b_lambda!1491 (or (and b!20053 b_free!705) b_lambda!1495)))

(check-sat (not b_lambda!1493) (not b!20099) (not d!3667) (not d!3663) (not d!3665) (not b!20098) (not b!20122) tp_is_empty!969 (not b_next!705) (not b!20120) (not b!20111) (not b_lambda!1495) (not b!20097) (not b!20121) (not mapNonEmpty!928) (not d!3673) b_and!1383)
(check-sat b_and!1383 (not b_next!705))
