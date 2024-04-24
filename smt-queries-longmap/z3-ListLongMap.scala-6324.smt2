; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81516 () Bool)

(assert start!81516)

(declare-fun b!952229 () Bool)

(declare-fun b_free!18265 () Bool)

(declare-fun b_next!18265 () Bool)

(assert (=> b!952229 (= b_free!18265 (not b_next!18265))))

(declare-fun tp!63404 () Bool)

(declare-fun b_and!29743 () Bool)

(assert (=> b!952229 (= tp!63404 b_and!29743)))

(declare-fun b!952223 () Bool)

(declare-fun res!637928 () Bool)

(declare-fun e!536264 () Bool)

(assert (=> b!952223 (=> (not res!637928) (not e!536264))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32663 0))(
  ( (V!32664 (val!10437 Int)) )
))
(declare-datatypes ((ValueCell!9905 0))(
  ( (ValueCellFull!9905 (v!12981 V!32663)) (EmptyCell!9905) )
))
(declare-datatypes ((array!57623 0))(
  ( (array!57624 (arr!27703 (Array (_ BitVec 32) ValueCell!9905)) (size!28182 (_ BitVec 32))) )
))
(declare-datatypes ((array!57625 0))(
  ( (array!57626 (arr!27704 (Array (_ BitVec 32) (_ BitVec 64))) (size!28183 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4960 0))(
  ( (LongMapFixedSize!4961 (defaultEntry!5801 Int) (mask!27664 (_ BitVec 32)) (extraKeys!5533 (_ BitVec 32)) (zeroValue!5637 V!32663) (minValue!5637 V!32663) (_size!2535 (_ BitVec 32)) (_keys!10772 array!57625) (_values!5824 array!57623) (_vacant!2535 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4960)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9111 0))(
  ( (MissingZero!9111 (index!38815 (_ BitVec 32))) (Found!9111 (index!38816 (_ BitVec 32))) (Intermediate!9111 (undefined!9923 Bool) (index!38817 (_ BitVec 32)) (x!81823 (_ BitVec 32))) (Undefined!9111) (MissingVacant!9111 (index!38818 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57625 (_ BitVec 32)) SeekEntryResult!9111)

(assert (=> b!952223 (= res!637928 (not ((_ is Found!9111) (seekEntry!0 key!756 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)))))))

(declare-fun b!952224 () Bool)

(declare-fun e!536261 () Bool)

(declare-fun tp_is_empty!20773 () Bool)

(assert (=> b!952224 (= e!536261 tp_is_empty!20773)))

(declare-fun b!952225 () Bool)

(declare-fun e!536266 () Bool)

(assert (=> b!952225 (= e!536266 tp_is_empty!20773)))

(declare-fun b!952226 () Bool)

(declare-fun e!536267 () Bool)

(assert (=> b!952226 (= e!536264 (not e!536267))))

(declare-fun res!637927 () Bool)

(assert (=> b!952226 (=> res!637927 e!536267)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!952226 (= res!637927 (not (validMask!0 (mask!27664 thiss!1141))))))

(declare-fun lt!428871 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57625 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952226 (= lt!428871 (arrayScanForKey!0 (_keys!10772 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952226 (arrayContainsKey!0 (_keys!10772 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31996 0))(
  ( (Unit!31997) )
))
(declare-fun lt!428872 () Unit!31996)

(declare-fun lemmaKeyInListMapIsInArray!324 (array!57625 array!57623 (_ BitVec 32) (_ BitVec 32) V!32663 V!32663 (_ BitVec 64) Int) Unit!31996)

(assert (=> b!952226 (= lt!428872 (lemmaKeyInListMapIsInArray!324 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) key!756 (defaultEntry!5801 thiss!1141)))))

(declare-fun b!952227 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57625 (_ BitVec 32)) Bool)

(assert (=> b!952227 (= e!536267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)))))

(declare-fun b!952228 () Bool)

(declare-fun e!536262 () Bool)

(declare-fun mapRes!33084 () Bool)

(assert (=> b!952228 (= e!536262 (and e!536266 mapRes!33084))))

(declare-fun condMapEmpty!33084 () Bool)

(declare-fun mapDefault!33084 () ValueCell!9905)

(assert (=> b!952228 (= condMapEmpty!33084 (= (arr!27703 (_values!5824 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9905)) mapDefault!33084)))))

(declare-fun e!536265 () Bool)

(declare-fun array_inv!21580 (array!57625) Bool)

(declare-fun array_inv!21581 (array!57623) Bool)

(assert (=> b!952229 (= e!536265 (and tp!63404 tp_is_empty!20773 (array_inv!21580 (_keys!10772 thiss!1141)) (array_inv!21581 (_values!5824 thiss!1141)) e!536262))))

(declare-fun mapNonEmpty!33084 () Bool)

(declare-fun tp!63405 () Bool)

(assert (=> mapNonEmpty!33084 (= mapRes!33084 (and tp!63405 e!536261))))

(declare-fun mapKey!33084 () (_ BitVec 32))

(declare-fun mapRest!33084 () (Array (_ BitVec 32) ValueCell!9905))

(declare-fun mapValue!33084 () ValueCell!9905)

(assert (=> mapNonEmpty!33084 (= (arr!27703 (_values!5824 thiss!1141)) (store mapRest!33084 mapKey!33084 mapValue!33084))))

(declare-fun b!952230 () Bool)

(declare-fun res!637926 () Bool)

(assert (=> b!952230 (=> (not res!637926) (not e!536264))))

(declare-datatypes ((tuple2!13550 0))(
  ( (tuple2!13551 (_1!6786 (_ BitVec 64)) (_2!6786 V!32663)) )
))
(declare-datatypes ((List!19341 0))(
  ( (Nil!19338) (Cons!19337 (h!20504 tuple2!13550) (t!27680 List!19341)) )
))
(declare-datatypes ((ListLongMap!12249 0))(
  ( (ListLongMap!12250 (toList!6140 List!19341)) )
))
(declare-fun contains!5244 (ListLongMap!12249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3373 (array!57625 array!57623 (_ BitVec 32) (_ BitVec 32) V!32663 V!32663 (_ BitVec 32) Int) ListLongMap!12249)

(assert (=> b!952230 (= res!637926 (contains!5244 (getCurrentListMap!3373 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)) key!756))))

(declare-fun b!952231 () Bool)

(declare-fun res!637925 () Bool)

(assert (=> b!952231 (=> res!637925 e!536267)))

(assert (=> b!952231 (= res!637925 (or (not (= (size!28183 (_keys!10772 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27664 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!28183 (_keys!10772 thiss!1141))) (bvslt lt!428871 #b00000000000000000000000000000000) (bvsgt lt!428871 (size!28183 (_keys!10772 thiss!1141)))))))

(declare-fun b!952232 () Bool)

(declare-fun res!637929 () Bool)

(assert (=> b!952232 (=> (not res!637929) (not e!536264))))

(assert (=> b!952232 (= res!637929 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!33084 () Bool)

(assert (=> mapIsEmpty!33084 mapRes!33084))

(declare-fun res!637930 () Bool)

(assert (=> start!81516 (=> (not res!637930) (not e!536264))))

(declare-fun valid!1896 (LongMapFixedSize!4960) Bool)

(assert (=> start!81516 (= res!637930 (valid!1896 thiss!1141))))

(assert (=> start!81516 e!536264))

(assert (=> start!81516 e!536265))

(assert (=> start!81516 true))

(assert (= (and start!81516 res!637930) b!952232))

(assert (= (and b!952232 res!637929) b!952223))

(assert (= (and b!952223 res!637928) b!952230))

(assert (= (and b!952230 res!637926) b!952226))

(assert (= (and b!952226 (not res!637927)) b!952231))

(assert (= (and b!952231 (not res!637925)) b!952227))

(assert (= (and b!952228 condMapEmpty!33084) mapIsEmpty!33084))

(assert (= (and b!952228 (not condMapEmpty!33084)) mapNonEmpty!33084))

(assert (= (and mapNonEmpty!33084 ((_ is ValueCellFull!9905) mapValue!33084)) b!952224))

(assert (= (and b!952228 ((_ is ValueCellFull!9905) mapDefault!33084)) b!952225))

(assert (= b!952229 b!952228))

(assert (= start!81516 b!952229))

(declare-fun m!884891 () Bool)

(assert (=> b!952227 m!884891))

(declare-fun m!884893 () Bool)

(assert (=> b!952230 m!884893))

(assert (=> b!952230 m!884893))

(declare-fun m!884895 () Bool)

(assert (=> b!952230 m!884895))

(declare-fun m!884897 () Bool)

(assert (=> mapNonEmpty!33084 m!884897))

(declare-fun m!884899 () Bool)

(assert (=> b!952226 m!884899))

(declare-fun m!884901 () Bool)

(assert (=> b!952226 m!884901))

(declare-fun m!884903 () Bool)

(assert (=> b!952226 m!884903))

(declare-fun m!884905 () Bool)

(assert (=> b!952226 m!884905))

(declare-fun m!884907 () Bool)

(assert (=> b!952229 m!884907))

(declare-fun m!884909 () Bool)

(assert (=> b!952229 m!884909))

(declare-fun m!884911 () Bool)

(assert (=> start!81516 m!884911))

(declare-fun m!884913 () Bool)

(assert (=> b!952223 m!884913))

(check-sat (not mapNonEmpty!33084) (not start!81516) b_and!29743 tp_is_empty!20773 (not b!952223) (not b!952230) (not b_next!18265) (not b!952229) (not b!952227) (not b!952226))
(check-sat b_and!29743 (not b_next!18265))
(get-model)

(declare-fun b!952301 () Bool)

(declare-fun e!536318 () Bool)

(declare-fun e!536316 () Bool)

(assert (=> b!952301 (= e!536318 e!536316)))

(declare-fun c!99705 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!952301 (= c!99705 (validKeyInArray!0 (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115657 () Bool)

(declare-fun res!637972 () Bool)

(assert (=> d!115657 (=> res!637972 e!536318)))

(assert (=> d!115657 (= res!637972 (bvsge #b00000000000000000000000000000000 (size!28183 (_keys!10772 thiss!1141))))))

(assert (=> d!115657 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)) e!536318)))

(declare-fun bm!41511 () Bool)

(declare-fun call!41514 () Bool)

(assert (=> bm!41511 (= call!41514 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10772 thiss!1141) (mask!27664 thiss!1141)))))

(declare-fun b!952302 () Bool)

(assert (=> b!952302 (= e!536316 call!41514)))

(declare-fun b!952303 () Bool)

(declare-fun e!536317 () Bool)

(assert (=> b!952303 (= e!536317 call!41514)))

(declare-fun b!952304 () Bool)

(assert (=> b!952304 (= e!536316 e!536317)))

(declare-fun lt!428891 () (_ BitVec 64))

(assert (=> b!952304 (= lt!428891 (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428892 () Unit!31996)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57625 (_ BitVec 64) (_ BitVec 32)) Unit!31996)

(assert (=> b!952304 (= lt!428892 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10772 thiss!1141) lt!428891 #b00000000000000000000000000000000))))

(assert (=> b!952304 (arrayContainsKey!0 (_keys!10772 thiss!1141) lt!428891 #b00000000000000000000000000000000)))

(declare-fun lt!428893 () Unit!31996)

(assert (=> b!952304 (= lt!428893 lt!428892)))

(declare-fun res!637971 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57625 (_ BitVec 32)) SeekEntryResult!9111)

(assert (=> b!952304 (= res!637971 (= (seekEntryOrOpen!0 (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000) (_keys!10772 thiss!1141) (mask!27664 thiss!1141)) (Found!9111 #b00000000000000000000000000000000)))))

(assert (=> b!952304 (=> (not res!637971) (not e!536317))))

(assert (= (and d!115657 (not res!637972)) b!952301))

(assert (= (and b!952301 c!99705) b!952304))

(assert (= (and b!952301 (not c!99705)) b!952302))

(assert (= (and b!952304 res!637971) b!952303))

(assert (= (or b!952303 b!952302) bm!41511))

(declare-fun m!884963 () Bool)

(assert (=> b!952301 m!884963))

(assert (=> b!952301 m!884963))

(declare-fun m!884965 () Bool)

(assert (=> b!952301 m!884965))

(declare-fun m!884967 () Bool)

(assert (=> bm!41511 m!884967))

(assert (=> b!952304 m!884963))

(declare-fun m!884969 () Bool)

(assert (=> b!952304 m!884969))

(declare-fun m!884971 () Bool)

(assert (=> b!952304 m!884971))

(assert (=> b!952304 m!884963))

(declare-fun m!884973 () Bool)

(assert (=> b!952304 m!884973))

(assert (=> b!952227 d!115657))

(declare-fun d!115659 () Bool)

(declare-fun lt!428903 () SeekEntryResult!9111)

(assert (=> d!115659 (and (or ((_ is MissingVacant!9111) lt!428903) (not ((_ is Found!9111) lt!428903)) (and (bvsge (index!38816 lt!428903) #b00000000000000000000000000000000) (bvslt (index!38816 lt!428903) (size!28183 (_keys!10772 thiss!1141))))) (not ((_ is MissingVacant!9111) lt!428903)) (or (not ((_ is Found!9111) lt!428903)) (= (select (arr!27704 (_keys!10772 thiss!1141)) (index!38816 lt!428903)) key!756)))))

(declare-fun e!536327 () SeekEntryResult!9111)

(assert (=> d!115659 (= lt!428903 e!536327)))

(declare-fun c!99714 () Bool)

(declare-fun lt!428902 () SeekEntryResult!9111)

(assert (=> d!115659 (= c!99714 (and ((_ is Intermediate!9111) lt!428902) (undefined!9923 lt!428902)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57625 (_ BitVec 32)) SeekEntryResult!9111)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115659 (= lt!428902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27664 thiss!1141)) key!756 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)))))

(assert (=> d!115659 (validMask!0 (mask!27664 thiss!1141))))

(assert (=> d!115659 (= (seekEntry!0 key!756 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)) lt!428903)))

(declare-fun b!952317 () Bool)

(declare-fun e!536326 () SeekEntryResult!9111)

(declare-fun lt!428905 () SeekEntryResult!9111)

(assert (=> b!952317 (= e!536326 (ite ((_ is MissingVacant!9111) lt!428905) (MissingZero!9111 (index!38818 lt!428905)) lt!428905))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57625 (_ BitVec 32)) SeekEntryResult!9111)

(assert (=> b!952317 (= lt!428905 (seekKeyOrZeroReturnVacant!0 (x!81823 lt!428902) (index!38817 lt!428902) (index!38817 lt!428902) key!756 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)))))

(declare-fun b!952318 () Bool)

(declare-fun c!99712 () Bool)

(declare-fun lt!428904 () (_ BitVec 64))

(assert (=> b!952318 (= c!99712 (= lt!428904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!536325 () SeekEntryResult!9111)

(assert (=> b!952318 (= e!536325 e!536326)))

(declare-fun b!952319 () Bool)

(assert (=> b!952319 (= e!536325 (Found!9111 (index!38817 lt!428902)))))

(declare-fun b!952320 () Bool)

(assert (=> b!952320 (= e!536326 (MissingZero!9111 (index!38817 lt!428902)))))

(declare-fun b!952321 () Bool)

(assert (=> b!952321 (= e!536327 e!536325)))

(assert (=> b!952321 (= lt!428904 (select (arr!27704 (_keys!10772 thiss!1141)) (index!38817 lt!428902)))))

(declare-fun c!99713 () Bool)

(assert (=> b!952321 (= c!99713 (= lt!428904 key!756))))

(declare-fun b!952322 () Bool)

(assert (=> b!952322 (= e!536327 Undefined!9111)))

(assert (= (and d!115659 c!99714) b!952322))

(assert (= (and d!115659 (not c!99714)) b!952321))

(assert (= (and b!952321 c!99713) b!952319))

(assert (= (and b!952321 (not c!99713)) b!952318))

(assert (= (and b!952318 c!99712) b!952320))

(assert (= (and b!952318 (not c!99712)) b!952317))

(declare-fun m!884975 () Bool)

(assert (=> d!115659 m!884975))

(declare-fun m!884977 () Bool)

(assert (=> d!115659 m!884977))

(assert (=> d!115659 m!884977))

(declare-fun m!884979 () Bool)

(assert (=> d!115659 m!884979))

(assert (=> d!115659 m!884899))

(declare-fun m!884981 () Bool)

(assert (=> b!952317 m!884981))

(declare-fun m!884983 () Bool)

(assert (=> b!952321 m!884983))

(assert (=> b!952223 d!115659))

(declare-fun d!115661 () Bool)

(declare-fun res!637979 () Bool)

(declare-fun e!536330 () Bool)

(assert (=> d!115661 (=> (not res!637979) (not e!536330))))

(declare-fun simpleValid!378 (LongMapFixedSize!4960) Bool)

(assert (=> d!115661 (= res!637979 (simpleValid!378 thiss!1141))))

(assert (=> d!115661 (= (valid!1896 thiss!1141) e!536330)))

(declare-fun b!952329 () Bool)

(declare-fun res!637980 () Bool)

(assert (=> b!952329 (=> (not res!637980) (not e!536330))))

(declare-fun arrayCountValidKeys!0 (array!57625 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952329 (= res!637980 (= (arrayCountValidKeys!0 (_keys!10772 thiss!1141) #b00000000000000000000000000000000 (size!28183 (_keys!10772 thiss!1141))) (_size!2535 thiss!1141)))))

(declare-fun b!952330 () Bool)

(declare-fun res!637981 () Bool)

(assert (=> b!952330 (=> (not res!637981) (not e!536330))))

(assert (=> b!952330 (= res!637981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10772 thiss!1141) (mask!27664 thiss!1141)))))

(declare-fun b!952331 () Bool)

(declare-datatypes ((List!19343 0))(
  ( (Nil!19340) (Cons!19339 (h!20506 (_ BitVec 64)) (t!27684 List!19343)) )
))
(declare-fun arrayNoDuplicates!0 (array!57625 (_ BitVec 32) List!19343) Bool)

(assert (=> b!952331 (= e!536330 (arrayNoDuplicates!0 (_keys!10772 thiss!1141) #b00000000000000000000000000000000 Nil!19340))))

(assert (= (and d!115661 res!637979) b!952329))

(assert (= (and b!952329 res!637980) b!952330))

(assert (= (and b!952330 res!637981) b!952331))

(declare-fun m!884985 () Bool)

(assert (=> d!115661 m!884985))

(declare-fun m!884987 () Bool)

(assert (=> b!952329 m!884987))

(assert (=> b!952330 m!884891))

(declare-fun m!884989 () Bool)

(assert (=> b!952331 m!884989))

(assert (=> start!81516 d!115661))

(declare-fun d!115663 () Bool)

(assert (=> d!115663 (= (array_inv!21580 (_keys!10772 thiss!1141)) (bvsge (size!28183 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952229 d!115663))

(declare-fun d!115665 () Bool)

(assert (=> d!115665 (= (array_inv!21581 (_values!5824 thiss!1141)) (bvsge (size!28182 (_values!5824 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952229 d!115665))

(declare-fun d!115667 () Bool)

(assert (=> d!115667 (= (validMask!0 (mask!27664 thiss!1141)) (and (or (= (mask!27664 thiss!1141) #b00000000000000000000000000000111) (= (mask!27664 thiss!1141) #b00000000000000000000000000001111) (= (mask!27664 thiss!1141) #b00000000000000000000000000011111) (= (mask!27664 thiss!1141) #b00000000000000000000000000111111) (= (mask!27664 thiss!1141) #b00000000000000000000000001111111) (= (mask!27664 thiss!1141) #b00000000000000000000000011111111) (= (mask!27664 thiss!1141) #b00000000000000000000000111111111) (= (mask!27664 thiss!1141) #b00000000000000000000001111111111) (= (mask!27664 thiss!1141) #b00000000000000000000011111111111) (= (mask!27664 thiss!1141) #b00000000000000000000111111111111) (= (mask!27664 thiss!1141) #b00000000000000000001111111111111) (= (mask!27664 thiss!1141) #b00000000000000000011111111111111) (= (mask!27664 thiss!1141) #b00000000000000000111111111111111) (= (mask!27664 thiss!1141) #b00000000000000001111111111111111) (= (mask!27664 thiss!1141) #b00000000000000011111111111111111) (= (mask!27664 thiss!1141) #b00000000000000111111111111111111) (= (mask!27664 thiss!1141) #b00000000000001111111111111111111) (= (mask!27664 thiss!1141) #b00000000000011111111111111111111) (= (mask!27664 thiss!1141) #b00000000000111111111111111111111) (= (mask!27664 thiss!1141) #b00000000001111111111111111111111) (= (mask!27664 thiss!1141) #b00000000011111111111111111111111) (= (mask!27664 thiss!1141) #b00000000111111111111111111111111) (= (mask!27664 thiss!1141) #b00000001111111111111111111111111) (= (mask!27664 thiss!1141) #b00000011111111111111111111111111) (= (mask!27664 thiss!1141) #b00000111111111111111111111111111) (= (mask!27664 thiss!1141) #b00001111111111111111111111111111) (= (mask!27664 thiss!1141) #b00011111111111111111111111111111) (= (mask!27664 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27664 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!952226 d!115667))

(declare-fun d!115669 () Bool)

(declare-fun lt!428908 () (_ BitVec 32))

(assert (=> d!115669 (and (or (bvslt lt!428908 #b00000000000000000000000000000000) (bvsge lt!428908 (size!28183 (_keys!10772 thiss!1141))) (and (bvsge lt!428908 #b00000000000000000000000000000000) (bvslt lt!428908 (size!28183 (_keys!10772 thiss!1141))))) (bvsge lt!428908 #b00000000000000000000000000000000) (bvslt lt!428908 (size!28183 (_keys!10772 thiss!1141))) (= (select (arr!27704 (_keys!10772 thiss!1141)) lt!428908) key!756))))

(declare-fun e!536333 () (_ BitVec 32))

(assert (=> d!115669 (= lt!428908 e!536333)))

(declare-fun c!99717 () Bool)

(assert (=> d!115669 (= c!99717 (= (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115669 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28183 (_keys!10772 thiss!1141))) (bvslt (size!28183 (_keys!10772 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115669 (= (arrayScanForKey!0 (_keys!10772 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428908)))

(declare-fun b!952336 () Bool)

(assert (=> b!952336 (= e!536333 #b00000000000000000000000000000000)))

(declare-fun b!952337 () Bool)

(assert (=> b!952337 (= e!536333 (arrayScanForKey!0 (_keys!10772 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115669 c!99717) b!952336))

(assert (= (and d!115669 (not c!99717)) b!952337))

(declare-fun m!884991 () Bool)

(assert (=> d!115669 m!884991))

(assert (=> d!115669 m!884963))

(declare-fun m!884993 () Bool)

(assert (=> b!952337 m!884993))

(assert (=> b!952226 d!115669))

(declare-fun d!115671 () Bool)

(declare-fun res!637986 () Bool)

(declare-fun e!536338 () Bool)

(assert (=> d!115671 (=> res!637986 e!536338)))

(assert (=> d!115671 (= res!637986 (= (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115671 (= (arrayContainsKey!0 (_keys!10772 thiss!1141) key!756 #b00000000000000000000000000000000) e!536338)))

(declare-fun b!952342 () Bool)

(declare-fun e!536339 () Bool)

(assert (=> b!952342 (= e!536338 e!536339)))

(declare-fun res!637987 () Bool)

(assert (=> b!952342 (=> (not res!637987) (not e!536339))))

(assert (=> b!952342 (= res!637987 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28183 (_keys!10772 thiss!1141))))))

(declare-fun b!952343 () Bool)

(assert (=> b!952343 (= e!536339 (arrayContainsKey!0 (_keys!10772 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115671 (not res!637986)) b!952342))

(assert (= (and b!952342 res!637987) b!952343))

(assert (=> d!115671 m!884963))

(declare-fun m!884995 () Bool)

(assert (=> b!952343 m!884995))

(assert (=> b!952226 d!115671))

(declare-fun d!115673 () Bool)

(declare-fun e!536342 () Bool)

(assert (=> d!115673 e!536342))

(declare-fun c!99720 () Bool)

(assert (=> d!115673 (= c!99720 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428911 () Unit!31996)

(declare-fun choose!1597 (array!57625 array!57623 (_ BitVec 32) (_ BitVec 32) V!32663 V!32663 (_ BitVec 64) Int) Unit!31996)

(assert (=> d!115673 (= lt!428911 (choose!1597 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) key!756 (defaultEntry!5801 thiss!1141)))))

(assert (=> d!115673 (validMask!0 (mask!27664 thiss!1141))))

(assert (=> d!115673 (= (lemmaKeyInListMapIsInArray!324 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) key!756 (defaultEntry!5801 thiss!1141)) lt!428911)))

(declare-fun b!952348 () Bool)

(assert (=> b!952348 (= e!536342 (arrayContainsKey!0 (_keys!10772 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!952349 () Bool)

(assert (=> b!952349 (= e!536342 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115673 c!99720) b!952348))

(assert (= (and d!115673 (not c!99720)) b!952349))

(declare-fun m!884997 () Bool)

(assert (=> d!115673 m!884997))

(assert (=> d!115673 m!884899))

(assert (=> b!952348 m!884903))

(assert (=> b!952226 d!115673))

(declare-fun d!115675 () Bool)

(declare-fun e!536347 () Bool)

(assert (=> d!115675 e!536347))

(declare-fun res!637990 () Bool)

(assert (=> d!115675 (=> res!637990 e!536347)))

(declare-fun lt!428922 () Bool)

(assert (=> d!115675 (= res!637990 (not lt!428922))))

(declare-fun lt!428923 () Bool)

(assert (=> d!115675 (= lt!428922 lt!428923)))

(declare-fun lt!428920 () Unit!31996)

(declare-fun e!536348 () Unit!31996)

(assert (=> d!115675 (= lt!428920 e!536348)))

(declare-fun c!99723 () Bool)

(assert (=> d!115675 (= c!99723 lt!428923)))

(declare-fun containsKey!470 (List!19341 (_ BitVec 64)) Bool)

(assert (=> d!115675 (= lt!428923 (containsKey!470 (toList!6140 (getCurrentListMap!3373 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141))) key!756))))

(assert (=> d!115675 (= (contains!5244 (getCurrentListMap!3373 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)) key!756) lt!428922)))

(declare-fun b!952356 () Bool)

(declare-fun lt!428921 () Unit!31996)

(assert (=> b!952356 (= e!536348 lt!428921)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!364 (List!19341 (_ BitVec 64)) Unit!31996)

(assert (=> b!952356 (= lt!428921 (lemmaContainsKeyImpliesGetValueByKeyDefined!364 (toList!6140 (getCurrentListMap!3373 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141))) key!756))))

(declare-datatypes ((Option!505 0))(
  ( (Some!504 (v!12984 V!32663)) (None!503) )
))
(declare-fun isDefined!372 (Option!505) Bool)

(declare-fun getValueByKey!499 (List!19341 (_ BitVec 64)) Option!505)

(assert (=> b!952356 (isDefined!372 (getValueByKey!499 (toList!6140 (getCurrentListMap!3373 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141))) key!756))))

(declare-fun b!952357 () Bool)

(declare-fun Unit!32000 () Unit!31996)

(assert (=> b!952357 (= e!536348 Unit!32000)))

(declare-fun b!952358 () Bool)

(assert (=> b!952358 (= e!536347 (isDefined!372 (getValueByKey!499 (toList!6140 (getCurrentListMap!3373 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141))) key!756)))))

(assert (= (and d!115675 c!99723) b!952356))

(assert (= (and d!115675 (not c!99723)) b!952357))

(assert (= (and d!115675 (not res!637990)) b!952358))

(declare-fun m!884999 () Bool)

(assert (=> d!115675 m!884999))

(declare-fun m!885001 () Bool)

(assert (=> b!952356 m!885001))

(declare-fun m!885003 () Bool)

(assert (=> b!952356 m!885003))

(assert (=> b!952356 m!885003))

(declare-fun m!885005 () Bool)

(assert (=> b!952356 m!885005))

(assert (=> b!952358 m!885003))

(assert (=> b!952358 m!885003))

(assert (=> b!952358 m!885005))

(assert (=> b!952230 d!115675))

(declare-fun b!952401 () Bool)

(declare-fun e!536384 () Bool)

(declare-fun e!536376 () Bool)

(assert (=> b!952401 (= e!536384 e!536376)))

(declare-fun res!638009 () Bool)

(assert (=> b!952401 (=> (not res!638009) (not e!536376))))

(declare-fun lt!428970 () ListLongMap!12249)

(assert (=> b!952401 (= res!638009 (contains!5244 lt!428970 (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952401 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28183 (_keys!10772 thiss!1141))))))

(declare-fun b!952402 () Bool)

(declare-fun e!536380 () Bool)

(assert (=> b!952402 (= e!536380 (validKeyInArray!0 (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952403 () Bool)

(declare-fun e!536378 () ListLongMap!12249)

(declare-fun call!41533 () ListLongMap!12249)

(declare-fun +!2877 (ListLongMap!12249 tuple2!13550) ListLongMap!12249)

(assert (=> b!952403 (= e!536378 (+!2877 call!41533 (tuple2!13551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5637 thiss!1141))))))

(declare-fun b!952404 () Bool)

(declare-fun res!638014 () Bool)

(declare-fun e!536382 () Bool)

(assert (=> b!952404 (=> (not res!638014) (not e!536382))))

(declare-fun e!536385 () Bool)

(assert (=> b!952404 (= res!638014 e!536385)))

(declare-fun c!99736 () Bool)

(assert (=> b!952404 (= c!99736 (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41526 () Bool)

(declare-fun call!41534 () ListLongMap!12249)

(declare-fun call!41531 () ListLongMap!12249)

(declare-fun call!41529 () ListLongMap!12249)

(declare-fun c!99739 () Bool)

(declare-fun c!99741 () Bool)

(assert (=> bm!41526 (= call!41533 (+!2877 (ite c!99739 call!41529 (ite c!99741 call!41534 call!41531)) (ite (or c!99739 c!99741) (tuple2!13551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5637 thiss!1141)) (tuple2!13551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5637 thiss!1141)))))))

(declare-fun b!952405 () Bool)

(declare-fun e!536386 () Bool)

(declare-fun e!536387 () Bool)

(assert (=> b!952405 (= e!536386 e!536387)))

(declare-fun res!638012 () Bool)

(declare-fun call!41535 () Bool)

(assert (=> b!952405 (= res!638012 call!41535)))

(assert (=> b!952405 (=> (not res!638012) (not e!536387))))

(declare-fun b!952406 () Bool)

(declare-fun e!536375 () ListLongMap!12249)

(declare-fun call!41532 () ListLongMap!12249)

(assert (=> b!952406 (= e!536375 call!41532)))

(declare-fun b!952407 () Bool)

(declare-fun e!536379 () ListLongMap!12249)

(assert (=> b!952407 (= e!536378 e!536379)))

(assert (=> b!952407 (= c!99741 (and (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952408 () Bool)

(declare-fun e!536383 () Bool)

(declare-fun apply!891 (ListLongMap!12249 (_ BitVec 64)) V!32663)

(assert (=> b!952408 (= e!536383 (= (apply!891 lt!428970 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5637 thiss!1141)))))

(declare-fun b!952410 () Bool)

(declare-fun e!536381 () Unit!31996)

(declare-fun lt!428985 () Unit!31996)

(assert (=> b!952410 (= e!536381 lt!428985)))

(declare-fun lt!428971 () ListLongMap!12249)

(declare-fun getCurrentListMapNoExtraKeys!3365 (array!57625 array!57623 (_ BitVec 32) (_ BitVec 32) V!32663 V!32663 (_ BitVec 32) Int) ListLongMap!12249)

(assert (=> b!952410 (= lt!428971 (getCurrentListMapNoExtraKeys!3365 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)))))

(declare-fun lt!428989 () (_ BitVec 64))

(assert (=> b!952410 (= lt!428989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428975 () (_ BitVec 64))

(assert (=> b!952410 (= lt!428975 (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428987 () Unit!31996)

(declare-fun addStillContains!580 (ListLongMap!12249 (_ BitVec 64) V!32663 (_ BitVec 64)) Unit!31996)

(assert (=> b!952410 (= lt!428987 (addStillContains!580 lt!428971 lt!428989 (zeroValue!5637 thiss!1141) lt!428975))))

(assert (=> b!952410 (contains!5244 (+!2877 lt!428971 (tuple2!13551 lt!428989 (zeroValue!5637 thiss!1141))) lt!428975)))

(declare-fun lt!428981 () Unit!31996)

(assert (=> b!952410 (= lt!428981 lt!428987)))

(declare-fun lt!428968 () ListLongMap!12249)

(assert (=> b!952410 (= lt!428968 (getCurrentListMapNoExtraKeys!3365 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)))))

(declare-fun lt!428986 () (_ BitVec 64))

(assert (=> b!952410 (= lt!428986 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428984 () (_ BitVec 64))

(assert (=> b!952410 (= lt!428984 (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428980 () Unit!31996)

(declare-fun addApplyDifferent!461 (ListLongMap!12249 (_ BitVec 64) V!32663 (_ BitVec 64)) Unit!31996)

(assert (=> b!952410 (= lt!428980 (addApplyDifferent!461 lt!428968 lt!428986 (minValue!5637 thiss!1141) lt!428984))))

(assert (=> b!952410 (= (apply!891 (+!2877 lt!428968 (tuple2!13551 lt!428986 (minValue!5637 thiss!1141))) lt!428984) (apply!891 lt!428968 lt!428984))))

(declare-fun lt!428978 () Unit!31996)

(assert (=> b!952410 (= lt!428978 lt!428980)))

(declare-fun lt!428976 () ListLongMap!12249)

(assert (=> b!952410 (= lt!428976 (getCurrentListMapNoExtraKeys!3365 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)))))

(declare-fun lt!428972 () (_ BitVec 64))

(assert (=> b!952410 (= lt!428972 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428982 () (_ BitVec 64))

(assert (=> b!952410 (= lt!428982 (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428988 () Unit!31996)

(assert (=> b!952410 (= lt!428988 (addApplyDifferent!461 lt!428976 lt!428972 (zeroValue!5637 thiss!1141) lt!428982))))

(assert (=> b!952410 (= (apply!891 (+!2877 lt!428976 (tuple2!13551 lt!428972 (zeroValue!5637 thiss!1141))) lt!428982) (apply!891 lt!428976 lt!428982))))

(declare-fun lt!428983 () Unit!31996)

(assert (=> b!952410 (= lt!428983 lt!428988)))

(declare-fun lt!428969 () ListLongMap!12249)

(assert (=> b!952410 (= lt!428969 (getCurrentListMapNoExtraKeys!3365 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)))))

(declare-fun lt!428973 () (_ BitVec 64))

(assert (=> b!952410 (= lt!428973 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428979 () (_ BitVec 64))

(assert (=> b!952410 (= lt!428979 (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952410 (= lt!428985 (addApplyDifferent!461 lt!428969 lt!428973 (minValue!5637 thiss!1141) lt!428979))))

(assert (=> b!952410 (= (apply!891 (+!2877 lt!428969 (tuple2!13551 lt!428973 (minValue!5637 thiss!1141))) lt!428979) (apply!891 lt!428969 lt!428979))))

(declare-fun b!952411 () Bool)

(declare-fun Unit!32001 () Unit!31996)

(assert (=> b!952411 (= e!536381 Unit!32001)))

(declare-fun b!952412 () Bool)

(assert (=> b!952412 (= e!536382 e!536386)))

(declare-fun c!99740 () Bool)

(assert (=> b!952412 (= c!99740 (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41527 () Bool)

(assert (=> bm!41527 (= call!41534 call!41529)))

(declare-fun bm!41528 () Bool)

(assert (=> bm!41528 (= call!41535 (contains!5244 lt!428970 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41529 () Bool)

(assert (=> bm!41529 (= call!41531 call!41534)))

(declare-fun bm!41530 () Bool)

(assert (=> bm!41530 (= call!41532 call!41533)))

(declare-fun b!952413 () Bool)

(declare-fun c!99738 () Bool)

(assert (=> b!952413 (= c!99738 (and (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!952413 (= e!536379 e!536375)))

(declare-fun b!952414 () Bool)

(assert (=> b!952414 (= e!536387 (= (apply!891 lt!428970 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5637 thiss!1141)))))

(declare-fun b!952415 () Bool)

(declare-fun res!638017 () Bool)

(assert (=> b!952415 (=> (not res!638017) (not e!536382))))

(assert (=> b!952415 (= res!638017 e!536384)))

(declare-fun res!638013 () Bool)

(assert (=> b!952415 (=> res!638013 e!536384)))

(declare-fun e!536377 () Bool)

(assert (=> b!952415 (= res!638013 (not e!536377))))

(declare-fun res!638011 () Bool)

(assert (=> b!952415 (=> (not res!638011) (not e!536377))))

(assert (=> b!952415 (= res!638011 (bvslt #b00000000000000000000000000000000 (size!28183 (_keys!10772 thiss!1141))))))

(declare-fun b!952416 () Bool)

(declare-fun call!41530 () Bool)

(assert (=> b!952416 (= e!536385 (not call!41530))))

(declare-fun d!115677 () Bool)

(assert (=> d!115677 e!536382))

(declare-fun res!638015 () Bool)

(assert (=> d!115677 (=> (not res!638015) (not e!536382))))

(assert (=> d!115677 (= res!638015 (or (bvsge #b00000000000000000000000000000000 (size!28183 (_keys!10772 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28183 (_keys!10772 thiss!1141))))))))

(declare-fun lt!428974 () ListLongMap!12249)

(assert (=> d!115677 (= lt!428970 lt!428974)))

(declare-fun lt!428977 () Unit!31996)

(assert (=> d!115677 (= lt!428977 e!536381)))

(declare-fun c!99737 () Bool)

(assert (=> d!115677 (= c!99737 e!536380)))

(declare-fun res!638010 () Bool)

(assert (=> d!115677 (=> (not res!638010) (not e!536380))))

(assert (=> d!115677 (= res!638010 (bvslt #b00000000000000000000000000000000 (size!28183 (_keys!10772 thiss!1141))))))

(assert (=> d!115677 (= lt!428974 e!536378)))

(assert (=> d!115677 (= c!99739 (and (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5533 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115677 (validMask!0 (mask!27664 thiss!1141))))

(assert (=> d!115677 (= (getCurrentListMap!3373 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)) lt!428970)))

(declare-fun b!952409 () Bool)

(assert (=> b!952409 (= e!536386 (not call!41535))))

(declare-fun b!952417 () Bool)

(assert (=> b!952417 (= e!536379 call!41532)))

(declare-fun b!952418 () Bool)

(assert (=> b!952418 (= e!536385 e!536383)))

(declare-fun res!638016 () Bool)

(assert (=> b!952418 (= res!638016 call!41530)))

(assert (=> b!952418 (=> (not res!638016) (not e!536383))))

(declare-fun b!952419 () Bool)

(assert (=> b!952419 (= e!536377 (validKeyInArray!0 (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41531 () Bool)

(assert (=> bm!41531 (= call!41529 (getCurrentListMapNoExtraKeys!3365 (_keys!10772 thiss!1141) (_values!5824 thiss!1141) (mask!27664 thiss!1141) (extraKeys!5533 thiss!1141) (zeroValue!5637 thiss!1141) (minValue!5637 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5801 thiss!1141)))))

(declare-fun b!952420 () Bool)

(assert (=> b!952420 (= e!536375 call!41531)))

(declare-fun b!952421 () Bool)

(declare-fun get!14573 (ValueCell!9905 V!32663) V!32663)

(declare-fun dynLambda!1674 (Int (_ BitVec 64)) V!32663)

(assert (=> b!952421 (= e!536376 (= (apply!891 lt!428970 (select (arr!27704 (_keys!10772 thiss!1141)) #b00000000000000000000000000000000)) (get!14573 (select (arr!27703 (_values!5824 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1674 (defaultEntry!5801 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952421 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28182 (_values!5824 thiss!1141))))))

(assert (=> b!952421 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28183 (_keys!10772 thiss!1141))))))

(declare-fun bm!41532 () Bool)

(assert (=> bm!41532 (= call!41530 (contains!5244 lt!428970 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115677 c!99739) b!952403))

(assert (= (and d!115677 (not c!99739)) b!952407))

(assert (= (and b!952407 c!99741) b!952417))

(assert (= (and b!952407 (not c!99741)) b!952413))

(assert (= (and b!952413 c!99738) b!952406))

(assert (= (and b!952413 (not c!99738)) b!952420))

(assert (= (or b!952406 b!952420) bm!41529))

(assert (= (or b!952417 bm!41529) bm!41527))

(assert (= (or b!952417 b!952406) bm!41530))

(assert (= (or b!952403 bm!41527) bm!41531))

(assert (= (or b!952403 bm!41530) bm!41526))

(assert (= (and d!115677 res!638010) b!952402))

(assert (= (and d!115677 c!99737) b!952410))

(assert (= (and d!115677 (not c!99737)) b!952411))

(assert (= (and d!115677 res!638015) b!952415))

(assert (= (and b!952415 res!638011) b!952419))

(assert (= (and b!952415 (not res!638013)) b!952401))

(assert (= (and b!952401 res!638009) b!952421))

(assert (= (and b!952415 res!638017) b!952404))

(assert (= (and b!952404 c!99736) b!952418))

(assert (= (and b!952404 (not c!99736)) b!952416))

(assert (= (and b!952418 res!638016) b!952408))

(assert (= (or b!952418 b!952416) bm!41532))

(assert (= (and b!952404 res!638014) b!952412))

(assert (= (and b!952412 c!99740) b!952405))

(assert (= (and b!952412 (not c!99740)) b!952409))

(assert (= (and b!952405 res!638012) b!952414))

(assert (= (or b!952405 b!952409) bm!41528))

(declare-fun b_lambda!14405 () Bool)

(assert (=> (not b_lambda!14405) (not b!952421)))

(declare-fun t!27683 () Bool)

(declare-fun tb!6191 () Bool)

(assert (=> (and b!952229 (= (defaultEntry!5801 thiss!1141) (defaultEntry!5801 thiss!1141)) t!27683) tb!6191))

(declare-fun result!12311 () Bool)

(assert (=> tb!6191 (= result!12311 tp_is_empty!20773)))

(assert (=> b!952421 t!27683))

(declare-fun b_and!29749 () Bool)

(assert (= b_and!29743 (and (=> t!27683 result!12311) b_and!29749)))

(declare-fun m!885007 () Bool)

(assert (=> b!952410 m!885007))

(declare-fun m!885009 () Bool)

(assert (=> b!952410 m!885009))

(declare-fun m!885011 () Bool)

(assert (=> b!952410 m!885011))

(assert (=> b!952410 m!885007))

(declare-fun m!885013 () Bool)

(assert (=> b!952410 m!885013))

(declare-fun m!885015 () Bool)

(assert (=> b!952410 m!885015))

(declare-fun m!885017 () Bool)

(assert (=> b!952410 m!885017))

(declare-fun m!885019 () Bool)

(assert (=> b!952410 m!885019))

(declare-fun m!885021 () Bool)

(assert (=> b!952410 m!885021))

(declare-fun m!885023 () Bool)

(assert (=> b!952410 m!885023))

(declare-fun m!885025 () Bool)

(assert (=> b!952410 m!885025))

(assert (=> b!952410 m!885009))

(declare-fun m!885027 () Bool)

(assert (=> b!952410 m!885027))

(declare-fun m!885029 () Bool)

(assert (=> b!952410 m!885029))

(declare-fun m!885031 () Bool)

(assert (=> b!952410 m!885031))

(declare-fun m!885033 () Bool)

(assert (=> b!952410 m!885033))

(declare-fun m!885035 () Bool)

(assert (=> b!952410 m!885035))

(declare-fun m!885037 () Bool)

(assert (=> b!952410 m!885037))

(assert (=> b!952410 m!885015))

(assert (=> b!952410 m!884963))

(assert (=> b!952410 m!885021))

(assert (=> b!952402 m!884963))

(assert (=> b!952402 m!884963))

(assert (=> b!952402 m!884965))

(declare-fun m!885039 () Bool)

(assert (=> bm!41526 m!885039))

(assert (=> b!952419 m!884963))

(assert (=> b!952419 m!884963))

(assert (=> b!952419 m!884965))

(declare-fun m!885041 () Bool)

(assert (=> b!952414 m!885041))

(declare-fun m!885043 () Bool)

(assert (=> bm!41532 m!885043))

(assert (=> d!115677 m!884899))

(declare-fun m!885045 () Bool)

(assert (=> bm!41528 m!885045))

(declare-fun m!885047 () Bool)

(assert (=> b!952403 m!885047))

(declare-fun m!885049 () Bool)

(assert (=> b!952408 m!885049))

(assert (=> b!952401 m!884963))

(assert (=> b!952401 m!884963))

(declare-fun m!885051 () Bool)

(assert (=> b!952401 m!885051))

(assert (=> bm!41531 m!885035))

(assert (=> b!952421 m!884963))

(declare-fun m!885053 () Bool)

(assert (=> b!952421 m!885053))

(declare-fun m!885055 () Bool)

(assert (=> b!952421 m!885055))

(assert (=> b!952421 m!884963))

(assert (=> b!952421 m!885055))

(declare-fun m!885057 () Bool)

(assert (=> b!952421 m!885057))

(declare-fun m!885059 () Bool)

(assert (=> b!952421 m!885059))

(assert (=> b!952421 m!885057))

(assert (=> b!952230 d!115677))

(declare-fun mapNonEmpty!33093 () Bool)

(declare-fun mapRes!33093 () Bool)

(declare-fun tp!63420 () Bool)

(declare-fun e!536392 () Bool)

(assert (=> mapNonEmpty!33093 (= mapRes!33093 (and tp!63420 e!536392))))

(declare-fun mapValue!33093 () ValueCell!9905)

(declare-fun mapKey!33093 () (_ BitVec 32))

(declare-fun mapRest!33093 () (Array (_ BitVec 32) ValueCell!9905))

(assert (=> mapNonEmpty!33093 (= mapRest!33084 (store mapRest!33093 mapKey!33093 mapValue!33093))))

(declare-fun mapIsEmpty!33093 () Bool)

(assert (=> mapIsEmpty!33093 mapRes!33093))

(declare-fun b!952430 () Bool)

(assert (=> b!952430 (= e!536392 tp_is_empty!20773)))

(declare-fun b!952431 () Bool)

(declare-fun e!536393 () Bool)

(assert (=> b!952431 (= e!536393 tp_is_empty!20773)))

(declare-fun condMapEmpty!33093 () Bool)

(declare-fun mapDefault!33093 () ValueCell!9905)

(assert (=> mapNonEmpty!33084 (= condMapEmpty!33093 (= mapRest!33084 ((as const (Array (_ BitVec 32) ValueCell!9905)) mapDefault!33093)))))

(assert (=> mapNonEmpty!33084 (= tp!63405 (and e!536393 mapRes!33093))))

(assert (= (and mapNonEmpty!33084 condMapEmpty!33093) mapIsEmpty!33093))

(assert (= (and mapNonEmpty!33084 (not condMapEmpty!33093)) mapNonEmpty!33093))

(assert (= (and mapNonEmpty!33093 ((_ is ValueCellFull!9905) mapValue!33093)) b!952430))

(assert (= (and mapNonEmpty!33084 ((_ is ValueCellFull!9905) mapDefault!33093)) b!952431))

(declare-fun m!885061 () Bool)

(assert (=> mapNonEmpty!33093 m!885061))

(declare-fun b_lambda!14407 () Bool)

(assert (= b_lambda!14405 (or (and b!952229 b_free!18265) b_lambda!14407)))

(check-sat (not d!115659) (not bm!41528) (not b!952301) (not b_lambda!14407) (not b!952419) (not b!952421) (not b!952401) (not bm!41511) (not b!952403) (not b!952414) (not b!952356) (not b_next!18265) (not d!115661) (not bm!41532) (not b!952348) (not b!952329) (not b!952337) (not b!952304) (not bm!41531) (not bm!41526) (not b!952331) (not b!952410) (not mapNonEmpty!33093) (not b!952358) (not d!115675) (not b!952408) (not b!952402) (not b!952317) (not b!952330) (not d!115673) (not d!115677) tp_is_empty!20773 (not b!952343) b_and!29749)
(check-sat b_and!29749 (not b_next!18265))
