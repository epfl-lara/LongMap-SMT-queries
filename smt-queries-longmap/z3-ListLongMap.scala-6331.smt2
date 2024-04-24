; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81748 () Bool)

(assert start!81748)

(declare-fun b!953922 () Bool)

(declare-fun b_free!18307 () Bool)

(declare-fun b_next!18307 () Bool)

(assert (=> b!953922 (= b_free!18307 (not b_next!18307))))

(declare-fun tp!63550 () Bool)

(declare-fun b_and!29801 () Bool)

(assert (=> b!953922 (= tp!63550 b_and!29801)))

(declare-fun b!953919 () Bool)

(declare-datatypes ((Unit!32042 0))(
  ( (Unit!32043) )
))
(declare-fun e!537336 () Unit!32042)

(declare-fun Unit!32044 () Unit!32042)

(assert (=> b!953919 (= e!537336 Unit!32044)))

(declare-fun lt!429852 () Unit!32042)

(declare-datatypes ((V!32719 0))(
  ( (V!32720 (val!10458 Int)) )
))
(declare-datatypes ((ValueCell!9926 0))(
  ( (ValueCellFull!9926 (v!13008 V!32719)) (EmptyCell!9926) )
))
(declare-datatypes ((array!57719 0))(
  ( (array!57720 (arr!27745 (Array (_ BitVec 32) ValueCell!9926)) (size!28225 (_ BitVec 32))) )
))
(declare-datatypes ((array!57721 0))(
  ( (array!57722 (arr!27746 (Array (_ BitVec 32) (_ BitVec 64))) (size!28226 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5002 0))(
  ( (LongMapFixedSize!5003 (defaultEntry!5836 Int) (mask!27742 (_ BitVec 32)) (extraKeys!5568 (_ BitVec 32)) (zeroValue!5672 V!32719) (minValue!5672 V!32719) (_size!2556 (_ BitVec 32)) (_keys!10823 array!57721) (_values!5859 array!57719) (_vacant!2556 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!5002)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun lemmaKeyInListMapIsInArray!339 (array!57721 array!57719 (_ BitVec 32) (_ BitVec 32) V!32719 V!32719 (_ BitVec 64) Int) Unit!32042)

(assert (=> b!953919 (= lt!429852 (lemmaKeyInListMapIsInArray!339 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) key!756 (defaultEntry!5836 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953919 (arrayContainsKey!0 (_keys!10823 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429849 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57721 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!953919 (= lt!429849 (arrayScanForKey!0 (_keys!10823 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun lt!429853 () Unit!32042)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32042)

(assert (=> b!953919 (= lt!429853 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10823 thiss!1141) (mask!27742 thiss!1141) #b00000000000000000000000000000000 lt!429849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57721 (_ BitVec 32)) Bool)

(assert (=> b!953919 (arrayForallSeekEntryOrOpenFound!0 lt!429849 (_keys!10823 thiss!1141) (mask!27742 thiss!1141))))

(declare-fun lt!429850 () Unit!32042)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57721 (_ BitVec 32)) Unit!32042)

(assert (=> b!953919 (= lt!429850 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!429849 (_keys!10823 thiss!1141) (mask!27742 thiss!1141)))))

(assert (=> b!953919 false))

(declare-fun b!953920 () Bool)

(declare-fun Unit!32045 () Unit!32042)

(assert (=> b!953920 (= e!537336 Unit!32045)))

(declare-fun b!953921 () Bool)

(declare-fun e!537341 () Bool)

(declare-fun e!537339 () Bool)

(declare-fun mapRes!33166 () Bool)

(assert (=> b!953921 (= e!537341 (and e!537339 mapRes!33166))))

(declare-fun condMapEmpty!33166 () Bool)

(declare-fun mapDefault!33166 () ValueCell!9926)

(assert (=> b!953921 (= condMapEmpty!33166 (= (arr!27745 (_values!5859 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9926)) mapDefault!33166)))))

(declare-fun res!638678 () Bool)

(declare-fun e!537342 () Bool)

(assert (=> start!81748 (=> (not res!638678) (not e!537342))))

(declare-fun valid!1910 (LongMapFixedSize!5002) Bool)

(assert (=> start!81748 (= res!638678 (valid!1910 thiss!1141))))

(assert (=> start!81748 e!537342))

(declare-fun e!537337 () Bool)

(assert (=> start!81748 e!537337))

(assert (=> start!81748 true))

(declare-fun tp_is_empty!20815 () Bool)

(declare-fun array_inv!21606 (array!57721) Bool)

(declare-fun array_inv!21607 (array!57719) Bool)

(assert (=> b!953922 (= e!537337 (and tp!63550 tp_is_empty!20815 (array_inv!21606 (_keys!10823 thiss!1141)) (array_inv!21607 (_values!5859 thiss!1141)) e!537341))))

(declare-fun b!953923 () Bool)

(declare-fun res!638677 () Bool)

(assert (=> b!953923 (=> (not res!638677) (not e!537342))))

(assert (=> b!953923 (= res!638677 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!953924 () Bool)

(declare-fun e!537340 () Bool)

(assert (=> b!953924 (= e!537340 tp_is_empty!20815)))

(declare-fun b!953925 () Bool)

(declare-datatypes ((tuple2!13576 0))(
  ( (tuple2!13577 (_1!6799 (_ BitVec 64)) (_2!6799 V!32719)) )
))
(declare-datatypes ((List!19360 0))(
  ( (Nil!19357) (Cons!19356 (h!20524 tuple2!13576) (t!27711 List!19360)) )
))
(declare-datatypes ((ListLongMap!12275 0))(
  ( (ListLongMap!12276 (toList!6153 List!19360)) )
))
(declare-fun contains!5259 (ListLongMap!12275 (_ BitVec 64)) Bool)

(declare-fun map!13095 (LongMapFixedSize!5002) ListLongMap!12275)

(assert (=> b!953925 (= e!537342 (contains!5259 (map!13095 thiss!1141) key!756))))

(declare-fun lt!429851 () Unit!32042)

(assert (=> b!953925 (= lt!429851 e!537336)))

(declare-fun c!100018 () Bool)

(declare-fun getCurrentListMap!3386 (array!57721 array!57719 (_ BitVec 32) (_ BitVec 32) V!32719 V!32719 (_ BitVec 32) Int) ListLongMap!12275)

(assert (=> b!953925 (= c!100018 (contains!5259 (getCurrentListMap!3386 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!33166 () Bool)

(declare-fun tp!63549 () Bool)

(assert (=> mapNonEmpty!33166 (= mapRes!33166 (and tp!63549 e!537340))))

(declare-fun mapValue!33166 () ValueCell!9926)

(declare-fun mapRest!33166 () (Array (_ BitVec 32) ValueCell!9926))

(declare-fun mapKey!33166 () (_ BitVec 32))

(assert (=> mapNonEmpty!33166 (= (arr!27745 (_values!5859 thiss!1141)) (store mapRest!33166 mapKey!33166 mapValue!33166))))

(declare-fun b!953926 () Bool)

(declare-fun res!638676 () Bool)

(assert (=> b!953926 (=> (not res!638676) (not e!537342))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9123 0))(
  ( (MissingZero!9123 (index!38863 (_ BitVec 32))) (Found!9123 (index!38864 (_ BitVec 32))) (Intermediate!9123 (undefined!9935 Bool) (index!38865 (_ BitVec 32)) (x!81959 (_ BitVec 32))) (Undefined!9123) (MissingVacant!9123 (index!38866 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57721 (_ BitVec 32)) SeekEntryResult!9123)

(assert (=> b!953926 (= res!638676 (not ((_ is Found!9123) (seekEntry!0 key!756 (_keys!10823 thiss!1141) (mask!27742 thiss!1141)))))))

(declare-fun b!953927 () Bool)

(assert (=> b!953927 (= e!537339 tp_is_empty!20815)))

(declare-fun mapIsEmpty!33166 () Bool)

(assert (=> mapIsEmpty!33166 mapRes!33166))

(assert (= (and start!81748 res!638678) b!953923))

(assert (= (and b!953923 res!638677) b!953926))

(assert (= (and b!953926 res!638676) b!953925))

(assert (= (and b!953925 c!100018) b!953919))

(assert (= (and b!953925 (not c!100018)) b!953920))

(assert (= (and b!953921 condMapEmpty!33166) mapIsEmpty!33166))

(assert (= (and b!953921 (not condMapEmpty!33166)) mapNonEmpty!33166))

(assert (= (and mapNonEmpty!33166 ((_ is ValueCellFull!9926) mapValue!33166)) b!953924))

(assert (= (and b!953921 ((_ is ValueCellFull!9926) mapDefault!33166)) b!953927))

(assert (= b!953922 b!953921))

(assert (= start!81748 b!953922))

(declare-fun m!886391 () Bool)

(assert (=> b!953919 m!886391))

(declare-fun m!886393 () Bool)

(assert (=> b!953919 m!886393))

(declare-fun m!886395 () Bool)

(assert (=> b!953919 m!886395))

(declare-fun m!886397 () Bool)

(assert (=> b!953919 m!886397))

(declare-fun m!886399 () Bool)

(assert (=> b!953919 m!886399))

(declare-fun m!886401 () Bool)

(assert (=> b!953919 m!886401))

(declare-fun m!886403 () Bool)

(assert (=> start!81748 m!886403))

(declare-fun m!886405 () Bool)

(assert (=> b!953925 m!886405))

(assert (=> b!953925 m!886405))

(declare-fun m!886407 () Bool)

(assert (=> b!953925 m!886407))

(declare-fun m!886409 () Bool)

(assert (=> b!953925 m!886409))

(assert (=> b!953925 m!886409))

(declare-fun m!886411 () Bool)

(assert (=> b!953925 m!886411))

(declare-fun m!886413 () Bool)

(assert (=> b!953926 m!886413))

(declare-fun m!886415 () Bool)

(assert (=> mapNonEmpty!33166 m!886415))

(declare-fun m!886417 () Bool)

(assert (=> b!953922 m!886417))

(declare-fun m!886419 () Bool)

(assert (=> b!953922 m!886419))

(check-sat (not b!953926) tp_is_empty!20815 (not b!953922) (not start!81748) (not b!953925) b_and!29801 (not b_next!18307) (not mapNonEmpty!33166) (not b!953919))
(check-sat b_and!29801 (not b_next!18307))
(get-model)

(declare-fun d!115917 () Bool)

(declare-fun e!537389 () Bool)

(assert (=> d!115917 e!537389))

(declare-fun res!638699 () Bool)

(assert (=> d!115917 (=> res!638699 e!537389)))

(declare-fun lt!429895 () Bool)

(assert (=> d!115917 (= res!638699 (not lt!429895))))

(declare-fun lt!429892 () Bool)

(assert (=> d!115917 (= lt!429895 lt!429892)))

(declare-fun lt!429893 () Unit!32042)

(declare-fun e!537390 () Unit!32042)

(assert (=> d!115917 (= lt!429893 e!537390)))

(declare-fun c!100027 () Bool)

(assert (=> d!115917 (= c!100027 lt!429892)))

(declare-fun containsKey!476 (List!19360 (_ BitVec 64)) Bool)

(assert (=> d!115917 (= lt!429892 (containsKey!476 (toList!6153 (map!13095 thiss!1141)) key!756))))

(assert (=> d!115917 (= (contains!5259 (map!13095 thiss!1141) key!756) lt!429895)))

(declare-fun b!953988 () Bool)

(declare-fun lt!429894 () Unit!32042)

(assert (=> b!953988 (= e!537390 lt!429894)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!370 (List!19360 (_ BitVec 64)) Unit!32042)

(assert (=> b!953988 (= lt!429894 (lemmaContainsKeyImpliesGetValueByKeyDefined!370 (toList!6153 (map!13095 thiss!1141)) key!756))))

(declare-datatypes ((Option!511 0))(
  ( (Some!510 (v!13011 V!32719)) (None!509) )
))
(declare-fun isDefined!378 (Option!511) Bool)

(declare-fun getValueByKey!505 (List!19360 (_ BitVec 64)) Option!511)

(assert (=> b!953988 (isDefined!378 (getValueByKey!505 (toList!6153 (map!13095 thiss!1141)) key!756))))

(declare-fun b!953989 () Bool)

(declare-fun Unit!32049 () Unit!32042)

(assert (=> b!953989 (= e!537390 Unit!32049)))

(declare-fun b!953990 () Bool)

(assert (=> b!953990 (= e!537389 (isDefined!378 (getValueByKey!505 (toList!6153 (map!13095 thiss!1141)) key!756)))))

(assert (= (and d!115917 c!100027) b!953988))

(assert (= (and d!115917 (not c!100027)) b!953989))

(assert (= (and d!115917 (not res!638699)) b!953990))

(declare-fun m!886481 () Bool)

(assert (=> d!115917 m!886481))

(declare-fun m!886483 () Bool)

(assert (=> b!953988 m!886483))

(declare-fun m!886485 () Bool)

(assert (=> b!953988 m!886485))

(assert (=> b!953988 m!886485))

(declare-fun m!886487 () Bool)

(assert (=> b!953988 m!886487))

(assert (=> b!953990 m!886485))

(assert (=> b!953990 m!886485))

(assert (=> b!953990 m!886487))

(assert (=> b!953925 d!115917))

(declare-fun d!115919 () Bool)

(assert (=> d!115919 (= (map!13095 thiss!1141) (getCurrentListMap!3386 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)))))

(declare-fun bs!26787 () Bool)

(assert (= bs!26787 d!115919))

(assert (=> bs!26787 m!886409))

(assert (=> b!953925 d!115919))

(declare-fun d!115921 () Bool)

(declare-fun e!537391 () Bool)

(assert (=> d!115921 e!537391))

(declare-fun res!638700 () Bool)

(assert (=> d!115921 (=> res!638700 e!537391)))

(declare-fun lt!429899 () Bool)

(assert (=> d!115921 (= res!638700 (not lt!429899))))

(declare-fun lt!429896 () Bool)

(assert (=> d!115921 (= lt!429899 lt!429896)))

(declare-fun lt!429897 () Unit!32042)

(declare-fun e!537392 () Unit!32042)

(assert (=> d!115921 (= lt!429897 e!537392)))

(declare-fun c!100028 () Bool)

(assert (=> d!115921 (= c!100028 lt!429896)))

(assert (=> d!115921 (= lt!429896 (containsKey!476 (toList!6153 (getCurrentListMap!3386 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141))) key!756))))

(assert (=> d!115921 (= (contains!5259 (getCurrentListMap!3386 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)) key!756) lt!429899)))

(declare-fun b!953991 () Bool)

(declare-fun lt!429898 () Unit!32042)

(assert (=> b!953991 (= e!537392 lt!429898)))

(assert (=> b!953991 (= lt!429898 (lemmaContainsKeyImpliesGetValueByKeyDefined!370 (toList!6153 (getCurrentListMap!3386 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141))) key!756))))

(assert (=> b!953991 (isDefined!378 (getValueByKey!505 (toList!6153 (getCurrentListMap!3386 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141))) key!756))))

(declare-fun b!953992 () Bool)

(declare-fun Unit!32050 () Unit!32042)

(assert (=> b!953992 (= e!537392 Unit!32050)))

(declare-fun b!953993 () Bool)

(assert (=> b!953993 (= e!537391 (isDefined!378 (getValueByKey!505 (toList!6153 (getCurrentListMap!3386 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141))) key!756)))))

(assert (= (and d!115921 c!100028) b!953991))

(assert (= (and d!115921 (not c!100028)) b!953992))

(assert (= (and d!115921 (not res!638700)) b!953993))

(declare-fun m!886489 () Bool)

(assert (=> d!115921 m!886489))

(declare-fun m!886491 () Bool)

(assert (=> b!953991 m!886491))

(declare-fun m!886493 () Bool)

(assert (=> b!953991 m!886493))

(assert (=> b!953991 m!886493))

(declare-fun m!886495 () Bool)

(assert (=> b!953991 m!886495))

(assert (=> b!953993 m!886493))

(assert (=> b!953993 m!886493))

(assert (=> b!953993 m!886495))

(assert (=> b!953925 d!115921))

(declare-fun b!954036 () Bool)

(declare-fun e!537420 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954036 (= e!537420 (validKeyInArray!0 (select (arr!27746 (_keys!10823 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!954037 () Bool)

(declare-fun e!537424 () Bool)

(declare-fun e!537427 () Bool)

(assert (=> b!954037 (= e!537424 e!537427)))

(declare-fun res!638719 () Bool)

(assert (=> b!954037 (=> (not res!638719) (not e!537427))))

(declare-fun lt!429954 () ListLongMap!12275)

(assert (=> b!954037 (= res!638719 (contains!5259 lt!429954 (select (arr!27746 (_keys!10823 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!954037 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28226 (_keys!10823 thiss!1141))))))

(declare-fun call!41685 () ListLongMap!12275)

(declare-fun c!100041 () Bool)

(declare-fun bm!41681 () Bool)

(declare-fun call!41690 () ListLongMap!12275)

(declare-fun c!100045 () Bool)

(declare-fun call!41689 () ListLongMap!12275)

(declare-fun call!41686 () ListLongMap!12275)

(declare-fun +!2883 (ListLongMap!12275 tuple2!13576) ListLongMap!12275)

(assert (=> bm!41681 (= call!41685 (+!2883 (ite c!100045 call!41690 (ite c!100041 call!41686 call!41689)) (ite (or c!100045 c!100041) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5672 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5672 thiss!1141)))))))

(declare-fun b!954038 () Bool)

(declare-fun e!537426 () ListLongMap!12275)

(declare-fun call!41687 () ListLongMap!12275)

(assert (=> b!954038 (= e!537426 call!41687)))

(declare-fun bm!41682 () Bool)

(assert (=> bm!41682 (= call!41687 call!41685)))

(declare-fun b!954040 () Bool)

(declare-fun c!100046 () Bool)

(assert (=> b!954040 (= c!100046 (and (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!537430 () ListLongMap!12275)

(assert (=> b!954040 (= e!537430 e!537426)))

(declare-fun b!954041 () Bool)

(declare-fun e!537422 () Bool)

(declare-fun e!537431 () Bool)

(assert (=> b!954041 (= e!537422 e!537431)))

(declare-fun res!638721 () Bool)

(declare-fun call!41688 () Bool)

(assert (=> b!954041 (= res!638721 call!41688)))

(assert (=> b!954041 (=> (not res!638721) (not e!537431))))

(declare-fun b!954042 () Bool)

(declare-fun e!537419 () Unit!32042)

(declare-fun Unit!32051 () Unit!32042)

(assert (=> b!954042 (= e!537419 Unit!32051)))

(declare-fun b!954043 () Bool)

(declare-fun apply!897 (ListLongMap!12275 (_ BitVec 64)) V!32719)

(declare-fun get!14596 (ValueCell!9926 V!32719) V!32719)

(declare-fun dynLambda!1680 (Int (_ BitVec 64)) V!32719)

(assert (=> b!954043 (= e!537427 (= (apply!897 lt!429954 (select (arr!27746 (_keys!10823 thiss!1141)) #b00000000000000000000000000000000)) (get!14596 (select (arr!27745 (_values!5859 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1680 (defaultEntry!5836 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!954043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28225 (_values!5859 thiss!1141))))))

(assert (=> b!954043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28226 (_keys!10823 thiss!1141))))))

(declare-fun b!954044 () Bool)

(declare-fun lt!429945 () Unit!32042)

(assert (=> b!954044 (= e!537419 lt!429945)))

(declare-fun lt!429965 () ListLongMap!12275)

(declare-fun getCurrentListMapNoExtraKeys!3371 (array!57721 array!57719 (_ BitVec 32) (_ BitVec 32) V!32719 V!32719 (_ BitVec 32) Int) ListLongMap!12275)

(assert (=> b!954044 (= lt!429965 (getCurrentListMapNoExtraKeys!3371 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)))))

(declare-fun lt!429947 () (_ BitVec 64))

(assert (=> b!954044 (= lt!429947 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429948 () (_ BitVec 64))

(assert (=> b!954044 (= lt!429948 (select (arr!27746 (_keys!10823 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429952 () Unit!32042)

(declare-fun addStillContains!586 (ListLongMap!12275 (_ BitVec 64) V!32719 (_ BitVec 64)) Unit!32042)

(assert (=> b!954044 (= lt!429952 (addStillContains!586 lt!429965 lt!429947 (zeroValue!5672 thiss!1141) lt!429948))))

(assert (=> b!954044 (contains!5259 (+!2883 lt!429965 (tuple2!13577 lt!429947 (zeroValue!5672 thiss!1141))) lt!429948)))

(declare-fun lt!429961 () Unit!32042)

(assert (=> b!954044 (= lt!429961 lt!429952)))

(declare-fun lt!429955 () ListLongMap!12275)

(assert (=> b!954044 (= lt!429955 (getCurrentListMapNoExtraKeys!3371 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)))))

(declare-fun lt!429957 () (_ BitVec 64))

(assert (=> b!954044 (= lt!429957 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429956 () (_ BitVec 64))

(assert (=> b!954044 (= lt!429956 (select (arr!27746 (_keys!10823 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429950 () Unit!32042)

(declare-fun addApplyDifferent!467 (ListLongMap!12275 (_ BitVec 64) V!32719 (_ BitVec 64)) Unit!32042)

(assert (=> b!954044 (= lt!429950 (addApplyDifferent!467 lt!429955 lt!429957 (minValue!5672 thiss!1141) lt!429956))))

(assert (=> b!954044 (= (apply!897 (+!2883 lt!429955 (tuple2!13577 lt!429957 (minValue!5672 thiss!1141))) lt!429956) (apply!897 lt!429955 lt!429956))))

(declare-fun lt!429944 () Unit!32042)

(assert (=> b!954044 (= lt!429944 lt!429950)))

(declare-fun lt!429963 () ListLongMap!12275)

(assert (=> b!954044 (= lt!429963 (getCurrentListMapNoExtraKeys!3371 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)))))

(declare-fun lt!429951 () (_ BitVec 64))

(assert (=> b!954044 (= lt!429951 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429962 () (_ BitVec 64))

(assert (=> b!954044 (= lt!429962 (select (arr!27746 (_keys!10823 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429949 () Unit!32042)

(assert (=> b!954044 (= lt!429949 (addApplyDifferent!467 lt!429963 lt!429951 (zeroValue!5672 thiss!1141) lt!429962))))

(assert (=> b!954044 (= (apply!897 (+!2883 lt!429963 (tuple2!13577 lt!429951 (zeroValue!5672 thiss!1141))) lt!429962) (apply!897 lt!429963 lt!429962))))

(declare-fun lt!429958 () Unit!32042)

(assert (=> b!954044 (= lt!429958 lt!429949)))

(declare-fun lt!429960 () ListLongMap!12275)

(assert (=> b!954044 (= lt!429960 (getCurrentListMapNoExtraKeys!3371 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)))))

(declare-fun lt!429964 () (_ BitVec 64))

(assert (=> b!954044 (= lt!429964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429946 () (_ BitVec 64))

(assert (=> b!954044 (= lt!429946 (select (arr!27746 (_keys!10823 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!954044 (= lt!429945 (addApplyDifferent!467 lt!429960 lt!429964 (minValue!5672 thiss!1141) lt!429946))))

(assert (=> b!954044 (= (apply!897 (+!2883 lt!429960 (tuple2!13577 lt!429964 (minValue!5672 thiss!1141))) lt!429946) (apply!897 lt!429960 lt!429946))))

(declare-fun bm!41683 () Bool)

(declare-fun call!41684 () Bool)

(assert (=> bm!41683 (= call!41684 (contains!5259 lt!429954 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!115923 () Bool)

(declare-fun e!537421 () Bool)

(assert (=> d!115923 e!537421))

(declare-fun res!638725 () Bool)

(assert (=> d!115923 (=> (not res!638725) (not e!537421))))

(assert (=> d!115923 (= res!638725 (or (bvsge #b00000000000000000000000000000000 (size!28226 (_keys!10823 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28226 (_keys!10823 thiss!1141))))))))

(declare-fun lt!429959 () ListLongMap!12275)

(assert (=> d!115923 (= lt!429954 lt!429959)))

(declare-fun lt!429953 () Unit!32042)

(assert (=> d!115923 (= lt!429953 e!537419)))

(declare-fun c!100044 () Bool)

(assert (=> d!115923 (= c!100044 e!537420)))

(declare-fun res!638726 () Bool)

(assert (=> d!115923 (=> (not res!638726) (not e!537420))))

(assert (=> d!115923 (= res!638726 (bvslt #b00000000000000000000000000000000 (size!28226 (_keys!10823 thiss!1141))))))

(declare-fun e!537428 () ListLongMap!12275)

(assert (=> d!115923 (= lt!429959 e!537428)))

(assert (=> d!115923 (= c!100045 (and (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!115923 (validMask!0 (mask!27742 thiss!1141))))

(assert (=> d!115923 (= (getCurrentListMap!3386 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)) lt!429954)))

(declare-fun b!954039 () Bool)

(assert (=> b!954039 (= e!537428 (+!2883 call!41685 (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5672 thiss!1141))))))

(declare-fun b!954045 () Bool)

(assert (=> b!954045 (= e!537422 (not call!41688))))

(declare-fun b!954046 () Bool)

(assert (=> b!954046 (= e!537426 call!41689)))

(declare-fun b!954047 () Bool)

(declare-fun res!638727 () Bool)

(assert (=> b!954047 (=> (not res!638727) (not e!537421))))

(assert (=> b!954047 (= res!638727 e!537424)))

(declare-fun res!638723 () Bool)

(assert (=> b!954047 (=> res!638723 e!537424)))

(declare-fun e!537425 () Bool)

(assert (=> b!954047 (= res!638723 (not e!537425))))

(declare-fun res!638722 () Bool)

(assert (=> b!954047 (=> (not res!638722) (not e!537425))))

(assert (=> b!954047 (= res!638722 (bvslt #b00000000000000000000000000000000 (size!28226 (_keys!10823 thiss!1141))))))

(declare-fun b!954048 () Bool)

(declare-fun e!537423 () Bool)

(assert (=> b!954048 (= e!537423 (not call!41684))))

(declare-fun bm!41684 () Bool)

(assert (=> bm!41684 (= call!41688 (contains!5259 lt!429954 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!954049 () Bool)

(assert (=> b!954049 (= e!537428 e!537430)))

(assert (=> b!954049 (= c!100041 (and (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!954050 () Bool)

(assert (=> b!954050 (= e!537431 (= (apply!897 lt!429954 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5672 thiss!1141)))))

(declare-fun b!954051 () Bool)

(declare-fun e!537429 () Bool)

(assert (=> b!954051 (= e!537423 e!537429)))

(declare-fun res!638724 () Bool)

(assert (=> b!954051 (= res!638724 call!41684)))

(assert (=> b!954051 (=> (not res!638724) (not e!537429))))

(declare-fun b!954052 () Bool)

(assert (=> b!954052 (= e!537430 call!41687)))

(declare-fun bm!41685 () Bool)

(assert (=> bm!41685 (= call!41689 call!41686)))

(declare-fun b!954053 () Bool)

(assert (=> b!954053 (= e!537425 (validKeyInArray!0 (select (arr!27746 (_keys!10823 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!954054 () Bool)

(assert (=> b!954054 (= e!537421 e!537423)))

(declare-fun c!100043 () Bool)

(assert (=> b!954054 (= c!100043 (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!954055 () Bool)

(assert (=> b!954055 (= e!537429 (= (apply!897 lt!429954 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5672 thiss!1141)))))

(declare-fun bm!41686 () Bool)

(assert (=> bm!41686 (= call!41686 call!41690)))

(declare-fun b!954056 () Bool)

(declare-fun res!638720 () Bool)

(assert (=> b!954056 (=> (not res!638720) (not e!537421))))

(assert (=> b!954056 (= res!638720 e!537422)))

(declare-fun c!100042 () Bool)

(assert (=> b!954056 (= c!100042 (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41687 () Bool)

(assert (=> bm!41687 (= call!41690 (getCurrentListMapNoExtraKeys!3371 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)))))

(assert (= (and d!115923 c!100045) b!954039))

(assert (= (and d!115923 (not c!100045)) b!954049))

(assert (= (and b!954049 c!100041) b!954052))

(assert (= (and b!954049 (not c!100041)) b!954040))

(assert (= (and b!954040 c!100046) b!954038))

(assert (= (and b!954040 (not c!100046)) b!954046))

(assert (= (or b!954038 b!954046) bm!41685))

(assert (= (or b!954052 bm!41685) bm!41686))

(assert (= (or b!954052 b!954038) bm!41682))

(assert (= (or b!954039 bm!41686) bm!41687))

(assert (= (or b!954039 bm!41682) bm!41681))

(assert (= (and d!115923 res!638726) b!954036))

(assert (= (and d!115923 c!100044) b!954044))

(assert (= (and d!115923 (not c!100044)) b!954042))

(assert (= (and d!115923 res!638725) b!954047))

(assert (= (and b!954047 res!638722) b!954053))

(assert (= (and b!954047 (not res!638723)) b!954037))

(assert (= (and b!954037 res!638719) b!954043))

(assert (= (and b!954047 res!638727) b!954056))

(assert (= (and b!954056 c!100042) b!954041))

(assert (= (and b!954056 (not c!100042)) b!954045))

(assert (= (and b!954041 res!638721) b!954050))

(assert (= (or b!954041 b!954045) bm!41684))

(assert (= (and b!954056 res!638720) b!954054))

(assert (= (and b!954054 c!100043) b!954051))

(assert (= (and b!954054 (not c!100043)) b!954048))

(assert (= (and b!954051 res!638724) b!954055))

(assert (= (or b!954051 b!954048) bm!41683))

(declare-fun b_lambda!14437 () Bool)

(assert (=> (not b_lambda!14437) (not b!954043)))

(declare-fun t!27713 () Bool)

(declare-fun tb!6203 () Bool)

(assert (=> (and b!953922 (= (defaultEntry!5836 thiss!1141) (defaultEntry!5836 thiss!1141)) t!27713) tb!6203))

(declare-fun result!12347 () Bool)

(assert (=> tb!6203 (= result!12347 tp_is_empty!20815)))

(assert (=> b!954043 t!27713))

(declare-fun b_and!29807 () Bool)

(assert (= b_and!29801 (and (=> t!27713 result!12347) b_and!29807)))

(declare-fun m!886497 () Bool)

(assert (=> b!954036 m!886497))

(assert (=> b!954036 m!886497))

(declare-fun m!886499 () Bool)

(assert (=> b!954036 m!886499))

(declare-fun m!886501 () Bool)

(assert (=> d!115923 m!886501))

(declare-fun m!886503 () Bool)

(assert (=> b!954055 m!886503))

(declare-fun m!886505 () Bool)

(assert (=> bm!41684 m!886505))

(declare-fun m!886507 () Bool)

(assert (=> b!954050 m!886507))

(assert (=> b!954043 m!886497))

(declare-fun m!886509 () Bool)

(assert (=> b!954043 m!886509))

(declare-fun m!886511 () Bool)

(assert (=> b!954043 m!886511))

(assert (=> b!954043 m!886511))

(declare-fun m!886513 () Bool)

(assert (=> b!954043 m!886513))

(declare-fun m!886515 () Bool)

(assert (=> b!954043 m!886515))

(assert (=> b!954043 m!886497))

(assert (=> b!954043 m!886513))

(assert (=> b!954037 m!886497))

(assert (=> b!954037 m!886497))

(declare-fun m!886517 () Bool)

(assert (=> b!954037 m!886517))

(declare-fun m!886519 () Bool)

(assert (=> b!954039 m!886519))

(declare-fun m!886521 () Bool)

(assert (=> bm!41687 m!886521))

(declare-fun m!886523 () Bool)

(assert (=> bm!41683 m!886523))

(assert (=> b!954053 m!886497))

(assert (=> b!954053 m!886497))

(assert (=> b!954053 m!886499))

(declare-fun m!886525 () Bool)

(assert (=> bm!41681 m!886525))

(declare-fun m!886527 () Bool)

(assert (=> b!954044 m!886527))

(declare-fun m!886529 () Bool)

(assert (=> b!954044 m!886529))

(assert (=> b!954044 m!886521))

(declare-fun m!886531 () Bool)

(assert (=> b!954044 m!886531))

(declare-fun m!886533 () Bool)

(assert (=> b!954044 m!886533))

(declare-fun m!886535 () Bool)

(assert (=> b!954044 m!886535))

(declare-fun m!886537 () Bool)

(assert (=> b!954044 m!886537))

(declare-fun m!886539 () Bool)

(assert (=> b!954044 m!886539))

(declare-fun m!886541 () Bool)

(assert (=> b!954044 m!886541))

(assert (=> b!954044 m!886497))

(assert (=> b!954044 m!886533))

(declare-fun m!886543 () Bool)

(assert (=> b!954044 m!886543))

(declare-fun m!886545 () Bool)

(assert (=> b!954044 m!886545))

(assert (=> b!954044 m!886527))

(declare-fun m!886547 () Bool)

(assert (=> b!954044 m!886547))

(declare-fun m!886549 () Bool)

(assert (=> b!954044 m!886549))

(assert (=> b!954044 m!886537))

(declare-fun m!886551 () Bool)

(assert (=> b!954044 m!886551))

(assert (=> b!954044 m!886551))

(declare-fun m!886553 () Bool)

(assert (=> b!954044 m!886553))

(declare-fun m!886555 () Bool)

(assert (=> b!954044 m!886555))

(assert (=> b!953925 d!115923))

(declare-fun d!115925 () Bool)

(assert (=> d!115925 (arrayForallSeekEntryOrOpenFound!0 lt!429849 (_keys!10823 thiss!1141) (mask!27742 thiss!1141))))

(declare-fun lt!429968 () Unit!32042)

(declare-fun choose!38 (array!57721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32042)

(assert (=> d!115925 (= lt!429968 (choose!38 (_keys!10823 thiss!1141) (mask!27742 thiss!1141) #b00000000000000000000000000000000 lt!429849))))

(assert (=> d!115925 (validMask!0 (mask!27742 thiss!1141))))

(assert (=> d!115925 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10823 thiss!1141) (mask!27742 thiss!1141) #b00000000000000000000000000000000 lt!429849) lt!429968)))

(declare-fun bs!26788 () Bool)

(assert (= bs!26788 d!115925))

(assert (=> bs!26788 m!886391))

(declare-fun m!886557 () Bool)

(assert (=> bs!26788 m!886557))

(assert (=> bs!26788 m!886501))

(assert (=> b!953919 d!115925))

(declare-fun d!115927 () Bool)

(declare-fun res!638732 () Bool)

(declare-fun e!537436 () Bool)

(assert (=> d!115927 (=> res!638732 e!537436)))

(assert (=> d!115927 (= res!638732 (= (select (arr!27746 (_keys!10823 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115927 (= (arrayContainsKey!0 (_keys!10823 thiss!1141) key!756 #b00000000000000000000000000000000) e!537436)))

(declare-fun b!954063 () Bool)

(declare-fun e!537437 () Bool)

(assert (=> b!954063 (= e!537436 e!537437)))

(declare-fun res!638733 () Bool)

(assert (=> b!954063 (=> (not res!638733) (not e!537437))))

(assert (=> b!954063 (= res!638733 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28226 (_keys!10823 thiss!1141))))))

(declare-fun b!954064 () Bool)

(assert (=> b!954064 (= e!537437 (arrayContainsKey!0 (_keys!10823 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115927 (not res!638732)) b!954063))

(assert (= (and b!954063 res!638733) b!954064))

(assert (=> d!115927 m!886497))

(declare-fun m!886559 () Bool)

(assert (=> b!954064 m!886559))

(assert (=> b!953919 d!115927))

(declare-fun b!954073 () Bool)

(declare-fun e!537445 () Bool)

(declare-fun e!537446 () Bool)

(assert (=> b!954073 (= e!537445 e!537446)))

(declare-fun lt!429975 () (_ BitVec 64))

(assert (=> b!954073 (= lt!429975 (select (arr!27746 (_keys!10823 thiss!1141)) lt!429849))))

(declare-fun lt!429977 () Unit!32042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57721 (_ BitVec 64) (_ BitVec 32)) Unit!32042)

(assert (=> b!954073 (= lt!429977 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10823 thiss!1141) lt!429975 lt!429849))))

(assert (=> b!954073 (arrayContainsKey!0 (_keys!10823 thiss!1141) lt!429975 #b00000000000000000000000000000000)))

(declare-fun lt!429976 () Unit!32042)

(assert (=> b!954073 (= lt!429976 lt!429977)))

(declare-fun res!638738 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57721 (_ BitVec 32)) SeekEntryResult!9123)

(assert (=> b!954073 (= res!638738 (= (seekEntryOrOpen!0 (select (arr!27746 (_keys!10823 thiss!1141)) lt!429849) (_keys!10823 thiss!1141) (mask!27742 thiss!1141)) (Found!9123 lt!429849)))))

(assert (=> b!954073 (=> (not res!638738) (not e!537446))))

(declare-fun bm!41690 () Bool)

(declare-fun call!41693 () Bool)

(assert (=> bm!41690 (= call!41693 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429849 #b00000000000000000000000000000001) (_keys!10823 thiss!1141) (mask!27742 thiss!1141)))))

(declare-fun b!954074 () Bool)

(declare-fun e!537444 () Bool)

(assert (=> b!954074 (= e!537444 e!537445)))

(declare-fun c!100049 () Bool)

(assert (=> b!954074 (= c!100049 (validKeyInArray!0 (select (arr!27746 (_keys!10823 thiss!1141)) lt!429849)))))

(declare-fun d!115929 () Bool)

(declare-fun res!638739 () Bool)

(assert (=> d!115929 (=> res!638739 e!537444)))

(assert (=> d!115929 (= res!638739 (bvsge lt!429849 (size!28226 (_keys!10823 thiss!1141))))))

(assert (=> d!115929 (= (arrayForallSeekEntryOrOpenFound!0 lt!429849 (_keys!10823 thiss!1141) (mask!27742 thiss!1141)) e!537444)))

(declare-fun b!954075 () Bool)

(assert (=> b!954075 (= e!537446 call!41693)))

(declare-fun b!954076 () Bool)

(assert (=> b!954076 (= e!537445 call!41693)))

(assert (= (and d!115929 (not res!638739)) b!954074))

(assert (= (and b!954074 c!100049) b!954073))

(assert (= (and b!954074 (not c!100049)) b!954076))

(assert (= (and b!954073 res!638738) b!954075))

(assert (= (or b!954075 b!954076) bm!41690))

(declare-fun m!886561 () Bool)

(assert (=> b!954073 m!886561))

(declare-fun m!886563 () Bool)

(assert (=> b!954073 m!886563))

(declare-fun m!886565 () Bool)

(assert (=> b!954073 m!886565))

(assert (=> b!954073 m!886561))

(declare-fun m!886567 () Bool)

(assert (=> b!954073 m!886567))

(declare-fun m!886569 () Bool)

(assert (=> bm!41690 m!886569))

(assert (=> b!954074 m!886561))

(assert (=> b!954074 m!886561))

(declare-fun m!886571 () Bool)

(assert (=> b!954074 m!886571))

(assert (=> b!953919 d!115929))

(declare-fun d!115931 () Bool)

(declare-fun e!537449 () Bool)

(assert (=> d!115931 e!537449))

(declare-fun c!100052 () Bool)

(assert (=> d!115931 (= c!100052 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429980 () Unit!32042)

(declare-fun choose!1606 (array!57721 array!57719 (_ BitVec 32) (_ BitVec 32) V!32719 V!32719 (_ BitVec 64) Int) Unit!32042)

(assert (=> d!115931 (= lt!429980 (choose!1606 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) key!756 (defaultEntry!5836 thiss!1141)))))

(assert (=> d!115931 (validMask!0 (mask!27742 thiss!1141))))

(assert (=> d!115931 (= (lemmaKeyInListMapIsInArray!339 (_keys!10823 thiss!1141) (_values!5859 thiss!1141) (mask!27742 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) key!756 (defaultEntry!5836 thiss!1141)) lt!429980)))

(declare-fun b!954081 () Bool)

(assert (=> b!954081 (= e!537449 (arrayContainsKey!0 (_keys!10823 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!954082 () Bool)

(assert (=> b!954082 (= e!537449 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115931 c!100052) b!954081))

(assert (= (and d!115931 (not c!100052)) b!954082))

(declare-fun m!886573 () Bool)

(assert (=> d!115931 m!886573))

(assert (=> d!115931 m!886501))

(assert (=> b!954081 m!886397))

(assert (=> b!953919 d!115931))

(declare-fun d!115933 () Bool)

(declare-fun lt!429983 () (_ BitVec 32))

(assert (=> d!115933 (and (or (bvslt lt!429983 #b00000000000000000000000000000000) (bvsge lt!429983 (size!28226 (_keys!10823 thiss!1141))) (and (bvsge lt!429983 #b00000000000000000000000000000000) (bvslt lt!429983 (size!28226 (_keys!10823 thiss!1141))))) (bvsge lt!429983 #b00000000000000000000000000000000) (bvslt lt!429983 (size!28226 (_keys!10823 thiss!1141))) (= (select (arr!27746 (_keys!10823 thiss!1141)) lt!429983) key!756))))

(declare-fun e!537452 () (_ BitVec 32))

(assert (=> d!115933 (= lt!429983 e!537452)))

(declare-fun c!100055 () Bool)

(assert (=> d!115933 (= c!100055 (= (select (arr!27746 (_keys!10823 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115933 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28226 (_keys!10823 thiss!1141))) (bvslt (size!28226 (_keys!10823 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115933 (= (arrayScanForKey!0 (_keys!10823 thiss!1141) key!756 #b00000000000000000000000000000000) lt!429983)))

(declare-fun b!954087 () Bool)

(assert (=> b!954087 (= e!537452 #b00000000000000000000000000000000)))

(declare-fun b!954088 () Bool)

(assert (=> b!954088 (= e!537452 (arrayScanForKey!0 (_keys!10823 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115933 c!100055) b!954087))

(assert (= (and d!115933 (not c!100055)) b!954088))

(declare-fun m!886575 () Bool)

(assert (=> d!115933 m!886575))

(assert (=> d!115933 m!886497))

(declare-fun m!886577 () Bool)

(assert (=> b!954088 m!886577))

(assert (=> b!953919 d!115933))

(declare-fun d!115935 () Bool)

(declare-fun lt!429989 () SeekEntryResult!9123)

(assert (=> d!115935 (and ((_ is Found!9123) lt!429989) (= (index!38864 lt!429989) lt!429849))))

(assert (=> d!115935 (= lt!429989 (seekEntry!0 key!756 (_keys!10823 thiss!1141) (mask!27742 thiss!1141)))))

(declare-fun lt!429988 () Unit!32042)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!57721 (_ BitVec 32)) Unit!32042)

(assert (=> d!115935 (= lt!429988 (choose!0 key!756 lt!429849 (_keys!10823 thiss!1141) (mask!27742 thiss!1141)))))

(assert (=> d!115935 (validMask!0 (mask!27742 thiss!1141))))

(assert (=> d!115935 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!429849 (_keys!10823 thiss!1141) (mask!27742 thiss!1141)) lt!429988)))

(declare-fun bs!26789 () Bool)

(assert (= bs!26789 d!115935))

(assert (=> bs!26789 m!886413))

(declare-fun m!886579 () Bool)

(assert (=> bs!26789 m!886579))

(assert (=> bs!26789 m!886501))

(assert (=> b!953919 d!115935))

(declare-fun d!115937 () Bool)

(declare-fun res!638746 () Bool)

(declare-fun e!537455 () Bool)

(assert (=> d!115937 (=> (not res!638746) (not e!537455))))

(declare-fun simpleValid!384 (LongMapFixedSize!5002) Bool)

(assert (=> d!115937 (= res!638746 (simpleValid!384 thiss!1141))))

(assert (=> d!115937 (= (valid!1910 thiss!1141) e!537455)))

(declare-fun b!954095 () Bool)

(declare-fun res!638747 () Bool)

(assert (=> b!954095 (=> (not res!638747) (not e!537455))))

(declare-fun arrayCountValidKeys!0 (array!57721 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!954095 (= res!638747 (= (arrayCountValidKeys!0 (_keys!10823 thiss!1141) #b00000000000000000000000000000000 (size!28226 (_keys!10823 thiss!1141))) (_size!2556 thiss!1141)))))

(declare-fun b!954096 () Bool)

(declare-fun res!638748 () Bool)

(assert (=> b!954096 (=> (not res!638748) (not e!537455))))

(assert (=> b!954096 (= res!638748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10823 thiss!1141) (mask!27742 thiss!1141)))))

(declare-fun b!954097 () Bool)

(declare-datatypes ((List!19361 0))(
  ( (Nil!19358) (Cons!19357 (h!20525 (_ BitVec 64)) (t!27714 List!19361)) )
))
(declare-fun arrayNoDuplicates!0 (array!57721 (_ BitVec 32) List!19361) Bool)

(assert (=> b!954097 (= e!537455 (arrayNoDuplicates!0 (_keys!10823 thiss!1141) #b00000000000000000000000000000000 Nil!19358))))

(assert (= (and d!115937 res!638746) b!954095))

(assert (= (and b!954095 res!638747) b!954096))

(assert (= (and b!954096 res!638748) b!954097))

(declare-fun m!886581 () Bool)

(assert (=> d!115937 m!886581))

(declare-fun m!886583 () Bool)

(assert (=> b!954095 m!886583))

(declare-fun m!886585 () Bool)

(assert (=> b!954096 m!886585))

(declare-fun m!886587 () Bool)

(assert (=> b!954097 m!886587))

(assert (=> start!81748 d!115937))

(declare-fun d!115939 () Bool)

(assert (=> d!115939 (= (array_inv!21606 (_keys!10823 thiss!1141)) (bvsge (size!28226 (_keys!10823 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953922 d!115939))

(declare-fun d!115941 () Bool)

(assert (=> d!115941 (= (array_inv!21607 (_values!5859 thiss!1141)) (bvsge (size!28225 (_values!5859 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953922 d!115941))

(declare-fun b!954110 () Bool)

(declare-fun e!537464 () SeekEntryResult!9123)

(assert (=> b!954110 (= e!537464 Undefined!9123)))

(declare-fun d!115943 () Bool)

(declare-fun lt!429998 () SeekEntryResult!9123)

(assert (=> d!115943 (and (or ((_ is MissingVacant!9123) lt!429998) (not ((_ is Found!9123) lt!429998)) (and (bvsge (index!38864 lt!429998) #b00000000000000000000000000000000) (bvslt (index!38864 lt!429998) (size!28226 (_keys!10823 thiss!1141))))) (not ((_ is MissingVacant!9123) lt!429998)) (or (not ((_ is Found!9123) lt!429998)) (= (select (arr!27746 (_keys!10823 thiss!1141)) (index!38864 lt!429998)) key!756)))))

(assert (=> d!115943 (= lt!429998 e!537464)))

(declare-fun c!100064 () Bool)

(declare-fun lt!429999 () SeekEntryResult!9123)

(assert (=> d!115943 (= c!100064 (and ((_ is Intermediate!9123) lt!429999) (undefined!9935 lt!429999)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57721 (_ BitVec 32)) SeekEntryResult!9123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115943 (= lt!429999 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27742 thiss!1141)) key!756 (_keys!10823 thiss!1141) (mask!27742 thiss!1141)))))

(assert (=> d!115943 (validMask!0 (mask!27742 thiss!1141))))

(assert (=> d!115943 (= (seekEntry!0 key!756 (_keys!10823 thiss!1141) (mask!27742 thiss!1141)) lt!429998)))

(declare-fun b!954111 () Bool)

(declare-fun e!537462 () SeekEntryResult!9123)

(assert (=> b!954111 (= e!537462 (MissingZero!9123 (index!38865 lt!429999)))))

(declare-fun b!954112 () Bool)

(declare-fun e!537463 () SeekEntryResult!9123)

(assert (=> b!954112 (= e!537464 e!537463)))

(declare-fun lt!430001 () (_ BitVec 64))

(assert (=> b!954112 (= lt!430001 (select (arr!27746 (_keys!10823 thiss!1141)) (index!38865 lt!429999)))))

(declare-fun c!100063 () Bool)

(assert (=> b!954112 (= c!100063 (= lt!430001 key!756))))

(declare-fun b!954113 () Bool)

(assert (=> b!954113 (= e!537463 (Found!9123 (index!38865 lt!429999)))))

(declare-fun b!954114 () Bool)

(declare-fun lt!430000 () SeekEntryResult!9123)

(assert (=> b!954114 (= e!537462 (ite ((_ is MissingVacant!9123) lt!430000) (MissingZero!9123 (index!38866 lt!430000)) lt!430000))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57721 (_ BitVec 32)) SeekEntryResult!9123)

(assert (=> b!954114 (= lt!430000 (seekKeyOrZeroReturnVacant!0 (x!81959 lt!429999) (index!38865 lt!429999) (index!38865 lt!429999) key!756 (_keys!10823 thiss!1141) (mask!27742 thiss!1141)))))

(declare-fun b!954115 () Bool)

(declare-fun c!100062 () Bool)

(assert (=> b!954115 (= c!100062 (= lt!430001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!954115 (= e!537463 e!537462)))

(assert (= (and d!115943 c!100064) b!954110))

(assert (= (and d!115943 (not c!100064)) b!954112))

(assert (= (and b!954112 c!100063) b!954113))

(assert (= (and b!954112 (not c!100063)) b!954115))

(assert (= (and b!954115 c!100062) b!954111))

(assert (= (and b!954115 (not c!100062)) b!954114))

(declare-fun m!886589 () Bool)

(assert (=> d!115943 m!886589))

(declare-fun m!886591 () Bool)

(assert (=> d!115943 m!886591))

(assert (=> d!115943 m!886591))

(declare-fun m!886593 () Bool)

(assert (=> d!115943 m!886593))

(assert (=> d!115943 m!886501))

(declare-fun m!886595 () Bool)

(assert (=> b!954112 m!886595))

(declare-fun m!886597 () Bool)

(assert (=> b!954114 m!886597))

(assert (=> b!953926 d!115943))

(declare-fun condMapEmpty!33175 () Bool)

(declare-fun mapDefault!33175 () ValueCell!9926)

(assert (=> mapNonEmpty!33166 (= condMapEmpty!33175 (= mapRest!33166 ((as const (Array (_ BitVec 32) ValueCell!9926)) mapDefault!33175)))))

(declare-fun e!537470 () Bool)

(declare-fun mapRes!33175 () Bool)

(assert (=> mapNonEmpty!33166 (= tp!63549 (and e!537470 mapRes!33175))))

(declare-fun b!954123 () Bool)

(assert (=> b!954123 (= e!537470 tp_is_empty!20815)))

(declare-fun b!954122 () Bool)

(declare-fun e!537469 () Bool)

(assert (=> b!954122 (= e!537469 tp_is_empty!20815)))

(declare-fun mapNonEmpty!33175 () Bool)

(declare-fun tp!63565 () Bool)

(assert (=> mapNonEmpty!33175 (= mapRes!33175 (and tp!63565 e!537469))))

(declare-fun mapKey!33175 () (_ BitVec 32))

(declare-fun mapRest!33175 () (Array (_ BitVec 32) ValueCell!9926))

(declare-fun mapValue!33175 () ValueCell!9926)

(assert (=> mapNonEmpty!33175 (= mapRest!33166 (store mapRest!33175 mapKey!33175 mapValue!33175))))

(declare-fun mapIsEmpty!33175 () Bool)

(assert (=> mapIsEmpty!33175 mapRes!33175))

(assert (= (and mapNonEmpty!33166 condMapEmpty!33175) mapIsEmpty!33175))

(assert (= (and mapNonEmpty!33166 (not condMapEmpty!33175)) mapNonEmpty!33175))

(assert (= (and mapNonEmpty!33175 ((_ is ValueCellFull!9926) mapValue!33175)) b!954122))

(assert (= (and mapNonEmpty!33166 ((_ is ValueCellFull!9926) mapDefault!33175)) b!954123))

(declare-fun m!886599 () Bool)

(assert (=> mapNonEmpty!33175 m!886599))

(declare-fun b_lambda!14439 () Bool)

(assert (= b_lambda!14437 (or (and b!953922 b_free!18307) b_lambda!14439)))

(check-sat (not bm!41684) b_and!29807 (not bm!41687) (not d!115921) (not b!953988) (not b!954088) (not b!954050) (not b!954074) (not bm!41690) (not b!954037) (not b!954036) (not b!954081) (not b!954097) (not b!954039) (not d!115925) (not mapNonEmpty!33175) (not d!115919) (not d!115937) (not b!953993) (not b!953990) (not b!954053) tp_is_empty!20815 (not d!115943) (not b!954064) (not bm!41683) (not b_lambda!14439) (not b!954043) (not d!115935) (not bm!41681) (not b!954044) (not b!954095) (not b!954055) (not d!115917) (not b_next!18307) (not d!115923) (not b!953991) (not b!954073) (not d!115931) (not b!954114) (not b!954096))
(check-sat b_and!29807 (not b_next!18307))
