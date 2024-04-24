; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75750 () Bool)

(assert start!75750)

(declare-fun b!889837 () Bool)

(declare-fun b_free!15595 () Bool)

(declare-fun b_next!15595 () Bool)

(assert (=> b!889837 (= b_free!15595 (not b_next!15595))))

(declare-fun tp!54743 () Bool)

(declare-fun b_and!25845 () Bool)

(assert (=> b!889837 (= tp!54743 b_and!25845)))

(declare-fun b!889833 () Bool)

(declare-fun res!602872 () Bool)

(declare-fun e!495993 () Bool)

(assert (=> b!889833 (=> (not res!602872) (not e!495993))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889833 (= res!602872 (not (= key!785 (bvneg key!785))))))

(declare-fun res!602871 () Bool)

(assert (=> start!75750 (=> (not res!602871) (not e!495993))))

(declare-datatypes ((array!51859 0))(
  ( (array!51860 (arr!24934 (Array (_ BitVec 32) (_ BitVec 64))) (size!25377 (_ BitVec 32))) )
))
(declare-datatypes ((V!28863 0))(
  ( (V!28864 (val!9012 Int)) )
))
(declare-datatypes ((ValueCell!8480 0))(
  ( (ValueCellFull!8480 (v!11487 V!28863)) (EmptyCell!8480) )
))
(declare-datatypes ((array!51861 0))(
  ( (array!51862 (arr!24935 (Array (_ BitVec 32) ValueCell!8480)) (size!25378 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3976 0))(
  ( (LongMapFixedSize!3977 (defaultEntry!5185 Int) (mask!25662 (_ BitVec 32)) (extraKeys!4879 (_ BitVec 32)) (zeroValue!4983 V!28863) (minValue!4983 V!28863) (_size!2043 (_ BitVec 32)) (_keys!9894 array!51859) (_values!5170 array!51861) (_vacant!2043 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3976)

(declare-fun valid!1560 (LongMapFixedSize!3976) Bool)

(assert (=> start!75750 (= res!602871 (valid!1560 thiss!1181))))

(assert (=> start!75750 e!495993))

(declare-fun e!495992 () Bool)

(assert (=> start!75750 e!495992))

(assert (=> start!75750 true))

(declare-fun b!889834 () Bool)

(declare-fun e!495995 () Bool)

(declare-fun e!495990 () Bool)

(declare-fun mapRes!28428 () Bool)

(assert (=> b!889834 (= e!495995 (and e!495990 mapRes!28428))))

(declare-fun condMapEmpty!28428 () Bool)

(declare-fun mapDefault!28428 () ValueCell!8480)

(assert (=> b!889834 (= condMapEmpty!28428 (= (arr!24935 (_values!5170 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8480)) mapDefault!28428)))))

(declare-fun mapNonEmpty!28428 () Bool)

(declare-fun tp!54744 () Bool)

(declare-fun e!495994 () Bool)

(assert (=> mapNonEmpty!28428 (= mapRes!28428 (and tp!54744 e!495994))))

(declare-fun mapKey!28428 () (_ BitVec 32))

(declare-fun mapValue!28428 () ValueCell!8480)

(declare-fun mapRest!28428 () (Array (_ BitVec 32) ValueCell!8480))

(assert (=> mapNonEmpty!28428 (= (arr!24935 (_values!5170 thiss!1181)) (store mapRest!28428 mapKey!28428 mapValue!28428))))

(declare-fun b!889835 () Bool)

(declare-fun tp_is_empty!17923 () Bool)

(assert (=> b!889835 (= e!495990 tp_is_empty!17923)))

(declare-fun mapIsEmpty!28428 () Bool)

(assert (=> mapIsEmpty!28428 mapRes!28428))

(declare-fun b!889836 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889836 (= e!495993 (not (validMask!0 (mask!25662 thiss!1181))))))

(declare-fun array_inv!19658 (array!51859) Bool)

(declare-fun array_inv!19659 (array!51861) Bool)

(assert (=> b!889837 (= e!495992 (and tp!54743 tp_is_empty!17923 (array_inv!19658 (_keys!9894 thiss!1181)) (array_inv!19659 (_values!5170 thiss!1181)) e!495995))))

(declare-fun b!889838 () Bool)

(assert (=> b!889838 (= e!495994 tp_is_empty!17923)))

(assert (= (and start!75750 res!602871) b!889833))

(assert (= (and b!889833 res!602872) b!889836))

(assert (= (and b!889834 condMapEmpty!28428) mapIsEmpty!28428))

(assert (= (and b!889834 (not condMapEmpty!28428)) mapNonEmpty!28428))

(get-info :version)

(assert (= (and mapNonEmpty!28428 ((_ is ValueCellFull!8480) mapValue!28428)) b!889838))

(assert (= (and b!889834 ((_ is ValueCellFull!8480) mapDefault!28428)) b!889835))

(assert (= b!889837 b!889834))

(assert (= start!75750 b!889837))

(declare-fun m!829385 () Bool)

(assert (=> start!75750 m!829385))

(declare-fun m!829387 () Bool)

(assert (=> mapNonEmpty!28428 m!829387))

(declare-fun m!829389 () Bool)

(assert (=> b!889836 m!829389))

(declare-fun m!829391 () Bool)

(assert (=> b!889837 m!829391))

(declare-fun m!829393 () Bool)

(assert (=> b!889837 m!829393))

(check-sat tp_is_empty!17923 (not mapNonEmpty!28428) b_and!25845 (not b!889837) (not start!75750) (not b_next!15595) (not b!889836))
(check-sat b_and!25845 (not b_next!15595))
(get-model)

(declare-fun d!110441 () Bool)

(assert (=> d!110441 (= (validMask!0 (mask!25662 thiss!1181)) (and (or (= (mask!25662 thiss!1181) #b00000000000000000000000000000111) (= (mask!25662 thiss!1181) #b00000000000000000000000000001111) (= (mask!25662 thiss!1181) #b00000000000000000000000000011111) (= (mask!25662 thiss!1181) #b00000000000000000000000000111111) (= (mask!25662 thiss!1181) #b00000000000000000000000001111111) (= (mask!25662 thiss!1181) #b00000000000000000000000011111111) (= (mask!25662 thiss!1181) #b00000000000000000000000111111111) (= (mask!25662 thiss!1181) #b00000000000000000000001111111111) (= (mask!25662 thiss!1181) #b00000000000000000000011111111111) (= (mask!25662 thiss!1181) #b00000000000000000000111111111111) (= (mask!25662 thiss!1181) #b00000000000000000001111111111111) (= (mask!25662 thiss!1181) #b00000000000000000011111111111111) (= (mask!25662 thiss!1181) #b00000000000000000111111111111111) (= (mask!25662 thiss!1181) #b00000000000000001111111111111111) (= (mask!25662 thiss!1181) #b00000000000000011111111111111111) (= (mask!25662 thiss!1181) #b00000000000000111111111111111111) (= (mask!25662 thiss!1181) #b00000000000001111111111111111111) (= (mask!25662 thiss!1181) #b00000000000011111111111111111111) (= (mask!25662 thiss!1181) #b00000000000111111111111111111111) (= (mask!25662 thiss!1181) #b00000000001111111111111111111111) (= (mask!25662 thiss!1181) #b00000000011111111111111111111111) (= (mask!25662 thiss!1181) #b00000000111111111111111111111111) (= (mask!25662 thiss!1181) #b00000001111111111111111111111111) (= (mask!25662 thiss!1181) #b00000011111111111111111111111111) (= (mask!25662 thiss!1181) #b00000111111111111111111111111111) (= (mask!25662 thiss!1181) #b00001111111111111111111111111111) (= (mask!25662 thiss!1181) #b00011111111111111111111111111111) (= (mask!25662 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25662 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!889836 d!110441))

(declare-fun d!110443 () Bool)

(assert (=> d!110443 (= (array_inv!19658 (_keys!9894 thiss!1181)) (bvsge (size!25377 (_keys!9894 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889837 d!110443))

(declare-fun d!110445 () Bool)

(assert (=> d!110445 (= (array_inv!19659 (_values!5170 thiss!1181)) (bvsge (size!25378 (_values!5170 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889837 d!110445))

(declare-fun d!110447 () Bool)

(declare-fun res!602891 () Bool)

(declare-fun e!496034 () Bool)

(assert (=> d!110447 (=> (not res!602891) (not e!496034))))

(declare-fun simpleValid!292 (LongMapFixedSize!3976) Bool)

(assert (=> d!110447 (= res!602891 (simpleValid!292 thiss!1181))))

(assert (=> d!110447 (= (valid!1560 thiss!1181) e!496034)))

(declare-fun b!889881 () Bool)

(declare-fun res!602892 () Bool)

(assert (=> b!889881 (=> (not res!602892) (not e!496034))))

(declare-fun arrayCountValidKeys!0 (array!51859 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!889881 (= res!602892 (= (arrayCountValidKeys!0 (_keys!9894 thiss!1181) #b00000000000000000000000000000000 (size!25377 (_keys!9894 thiss!1181))) (_size!2043 thiss!1181)))))

(declare-fun b!889882 () Bool)

(declare-fun res!602893 () Bool)

(assert (=> b!889882 (=> (not res!602893) (not e!496034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51859 (_ BitVec 32)) Bool)

(assert (=> b!889882 (= res!602893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9894 thiss!1181) (mask!25662 thiss!1181)))))

(declare-fun b!889883 () Bool)

(declare-datatypes ((List!17648 0))(
  ( (Nil!17645) (Cons!17644 (h!18781 (_ BitVec 64)) (t!24939 List!17648)) )
))
(declare-fun arrayNoDuplicates!0 (array!51859 (_ BitVec 32) List!17648) Bool)

(assert (=> b!889883 (= e!496034 (arrayNoDuplicates!0 (_keys!9894 thiss!1181) #b00000000000000000000000000000000 Nil!17645))))

(assert (= (and d!110447 res!602891) b!889881))

(assert (= (and b!889881 res!602892) b!889882))

(assert (= (and b!889882 res!602893) b!889883))

(declare-fun m!829415 () Bool)

(assert (=> d!110447 m!829415))

(declare-fun m!829417 () Bool)

(assert (=> b!889881 m!829417))

(declare-fun m!829419 () Bool)

(assert (=> b!889882 m!829419))

(declare-fun m!829421 () Bool)

(assert (=> b!889883 m!829421))

(assert (=> start!75750 d!110447))

(declare-fun b!889890 () Bool)

(declare-fun e!496039 () Bool)

(assert (=> b!889890 (= e!496039 tp_is_empty!17923)))

(declare-fun mapIsEmpty!28437 () Bool)

(declare-fun mapRes!28437 () Bool)

(assert (=> mapIsEmpty!28437 mapRes!28437))

(declare-fun mapNonEmpty!28437 () Bool)

(declare-fun tp!54759 () Bool)

(assert (=> mapNonEmpty!28437 (= mapRes!28437 (and tp!54759 e!496039))))

(declare-fun mapKey!28437 () (_ BitVec 32))

(declare-fun mapValue!28437 () ValueCell!8480)

(declare-fun mapRest!28437 () (Array (_ BitVec 32) ValueCell!8480))

(assert (=> mapNonEmpty!28437 (= mapRest!28428 (store mapRest!28437 mapKey!28437 mapValue!28437))))

(declare-fun condMapEmpty!28437 () Bool)

(declare-fun mapDefault!28437 () ValueCell!8480)

(assert (=> mapNonEmpty!28428 (= condMapEmpty!28437 (= mapRest!28428 ((as const (Array (_ BitVec 32) ValueCell!8480)) mapDefault!28437)))))

(declare-fun e!496040 () Bool)

(assert (=> mapNonEmpty!28428 (= tp!54744 (and e!496040 mapRes!28437))))

(declare-fun b!889891 () Bool)

(assert (=> b!889891 (= e!496040 tp_is_empty!17923)))

(assert (= (and mapNonEmpty!28428 condMapEmpty!28437) mapIsEmpty!28437))

(assert (= (and mapNonEmpty!28428 (not condMapEmpty!28437)) mapNonEmpty!28437))

(assert (= (and mapNonEmpty!28437 ((_ is ValueCellFull!8480) mapValue!28437)) b!889890))

(assert (= (and mapNonEmpty!28428 ((_ is ValueCellFull!8480) mapDefault!28437)) b!889891))

(declare-fun m!829423 () Bool)

(assert (=> mapNonEmpty!28437 m!829423))

(check-sat tp_is_empty!17923 (not b!889882) b_and!25845 (not b!889881) (not mapNonEmpty!28437) (not d!110447) (not b!889883) (not b_next!15595))
(check-sat b_and!25845 (not b_next!15595))
(get-model)

(declare-fun b!889900 () Bool)

(declare-fun e!496046 () (_ BitVec 32))

(declare-fun call!39540 () (_ BitVec 32))

(assert (=> b!889900 (= e!496046 call!39540)))

(declare-fun b!889901 () Bool)

(declare-fun e!496045 () (_ BitVec 32))

(assert (=> b!889901 (= e!496045 e!496046)))

(declare-fun c!94208 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!889901 (= c!94208 (validKeyInArray!0 (select (arr!24934 (_keys!9894 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110449 () Bool)

(declare-fun lt!402332 () (_ BitVec 32))

(assert (=> d!110449 (and (bvsge lt!402332 #b00000000000000000000000000000000) (bvsle lt!402332 (bvsub (size!25377 (_keys!9894 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110449 (= lt!402332 e!496045)))

(declare-fun c!94209 () Bool)

(assert (=> d!110449 (= c!94209 (bvsge #b00000000000000000000000000000000 (size!25377 (_keys!9894 thiss!1181))))))

(assert (=> d!110449 (and (bvsle #b00000000000000000000000000000000 (size!25377 (_keys!9894 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25377 (_keys!9894 thiss!1181)) (size!25377 (_keys!9894 thiss!1181))))))

(assert (=> d!110449 (= (arrayCountValidKeys!0 (_keys!9894 thiss!1181) #b00000000000000000000000000000000 (size!25377 (_keys!9894 thiss!1181))) lt!402332)))

(declare-fun b!889902 () Bool)

(assert (=> b!889902 (= e!496045 #b00000000000000000000000000000000)))

(declare-fun bm!39537 () Bool)

(assert (=> bm!39537 (= call!39540 (arrayCountValidKeys!0 (_keys!9894 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25377 (_keys!9894 thiss!1181))))))

(declare-fun b!889903 () Bool)

(assert (=> b!889903 (= e!496046 (bvadd #b00000000000000000000000000000001 call!39540))))

(assert (= (and d!110449 c!94209) b!889902))

(assert (= (and d!110449 (not c!94209)) b!889901))

(assert (= (and b!889901 c!94208) b!889903))

(assert (= (and b!889901 (not c!94208)) b!889900))

(assert (= (or b!889903 b!889900) bm!39537))

(declare-fun m!829425 () Bool)

(assert (=> b!889901 m!829425))

(assert (=> b!889901 m!829425))

(declare-fun m!829427 () Bool)

(assert (=> b!889901 m!829427))

(declare-fun m!829429 () Bool)

(assert (=> bm!39537 m!829429))

(assert (=> b!889881 d!110449))

(declare-fun b!889912 () Bool)

(declare-fun e!496053 () Bool)

(declare-fun e!496055 () Bool)

(assert (=> b!889912 (= e!496053 e!496055)))

(declare-fun lt!402339 () (_ BitVec 64))

(assert (=> b!889912 (= lt!402339 (select (arr!24934 (_keys!9894 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30258 0))(
  ( (Unit!30259) )
))
(declare-fun lt!402340 () Unit!30258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51859 (_ BitVec 64) (_ BitVec 32)) Unit!30258)

(assert (=> b!889912 (= lt!402340 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9894 thiss!1181) lt!402339 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!889912 (arrayContainsKey!0 (_keys!9894 thiss!1181) lt!402339 #b00000000000000000000000000000000)))

(declare-fun lt!402341 () Unit!30258)

(assert (=> b!889912 (= lt!402341 lt!402340)))

(declare-fun res!602898 () Bool)

(declare-datatypes ((SeekEntryResult!8720 0))(
  ( (MissingZero!8720 (index!37251 (_ BitVec 32))) (Found!8720 (index!37252 (_ BitVec 32))) (Intermediate!8720 (undefined!9532 Bool) (index!37253 (_ BitVec 32)) (x!75416 (_ BitVec 32))) (Undefined!8720) (MissingVacant!8720 (index!37254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51859 (_ BitVec 32)) SeekEntryResult!8720)

(assert (=> b!889912 (= res!602898 (= (seekEntryOrOpen!0 (select (arr!24934 (_keys!9894 thiss!1181)) #b00000000000000000000000000000000) (_keys!9894 thiss!1181) (mask!25662 thiss!1181)) (Found!8720 #b00000000000000000000000000000000)))))

(assert (=> b!889912 (=> (not res!602898) (not e!496055))))

(declare-fun b!889913 () Bool)

(declare-fun call!39543 () Bool)

(assert (=> b!889913 (= e!496055 call!39543)))

(declare-fun b!889914 () Bool)

(assert (=> b!889914 (= e!496053 call!39543)))

(declare-fun bm!39540 () Bool)

(assert (=> bm!39540 (= call!39543 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9894 thiss!1181) (mask!25662 thiss!1181)))))

(declare-fun b!889915 () Bool)

(declare-fun e!496054 () Bool)

(assert (=> b!889915 (= e!496054 e!496053)))

(declare-fun c!94212 () Bool)

(assert (=> b!889915 (= c!94212 (validKeyInArray!0 (select (arr!24934 (_keys!9894 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110451 () Bool)

(declare-fun res!602899 () Bool)

(assert (=> d!110451 (=> res!602899 e!496054)))

(assert (=> d!110451 (= res!602899 (bvsge #b00000000000000000000000000000000 (size!25377 (_keys!9894 thiss!1181))))))

(assert (=> d!110451 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9894 thiss!1181) (mask!25662 thiss!1181)) e!496054)))

(assert (= (and d!110451 (not res!602899)) b!889915))

(assert (= (and b!889915 c!94212) b!889912))

(assert (= (and b!889915 (not c!94212)) b!889914))

(assert (= (and b!889912 res!602898) b!889913))

(assert (= (or b!889913 b!889914) bm!39540))

(assert (=> b!889912 m!829425))

(declare-fun m!829431 () Bool)

(assert (=> b!889912 m!829431))

(declare-fun m!829433 () Bool)

(assert (=> b!889912 m!829433))

(assert (=> b!889912 m!829425))

(declare-fun m!829435 () Bool)

(assert (=> b!889912 m!829435))

(declare-fun m!829437 () Bool)

(assert (=> bm!39540 m!829437))

(assert (=> b!889915 m!829425))

(assert (=> b!889915 m!829425))

(assert (=> b!889915 m!829427))

(assert (=> b!889882 d!110451))

(declare-fun b!889924 () Bool)

(declare-fun res!602908 () Bool)

(declare-fun e!496058 () Bool)

(assert (=> b!889924 (=> (not res!602908) (not e!496058))))

(assert (=> b!889924 (= res!602908 (and (= (size!25378 (_values!5170 thiss!1181)) (bvadd (mask!25662 thiss!1181) #b00000000000000000000000000000001)) (= (size!25377 (_keys!9894 thiss!1181)) (size!25378 (_values!5170 thiss!1181))) (bvsge (_size!2043 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2043 thiss!1181) (bvadd (mask!25662 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!889926 () Bool)

(declare-fun res!602909 () Bool)

(assert (=> b!889926 (=> (not res!602909) (not e!496058))))

(declare-fun size!25383 (LongMapFixedSize!3976) (_ BitVec 32))

(assert (=> b!889926 (= res!602909 (= (size!25383 thiss!1181) (bvadd (_size!2043 thiss!1181) (bvsdiv (bvadd (extraKeys!4879 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!110453 () Bool)

(declare-fun res!602910 () Bool)

(assert (=> d!110453 (=> (not res!602910) (not e!496058))))

(assert (=> d!110453 (= res!602910 (validMask!0 (mask!25662 thiss!1181)))))

(assert (=> d!110453 (= (simpleValid!292 thiss!1181) e!496058)))

(declare-fun b!889927 () Bool)

(assert (=> b!889927 (= e!496058 (and (bvsge (extraKeys!4879 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4879 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2043 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!889925 () Bool)

(declare-fun res!602911 () Bool)

(assert (=> b!889925 (=> (not res!602911) (not e!496058))))

(assert (=> b!889925 (= res!602911 (bvsge (size!25383 thiss!1181) (_size!2043 thiss!1181)))))

(assert (= (and d!110453 res!602910) b!889924))

(assert (= (and b!889924 res!602908) b!889925))

(assert (= (and b!889925 res!602911) b!889926))

(assert (= (and b!889926 res!602909) b!889927))

(declare-fun m!829439 () Bool)

(assert (=> b!889926 m!829439))

(assert (=> d!110453 m!829389))

(assert (=> b!889925 m!829439))

(assert (=> d!110447 d!110453))

(declare-fun d!110455 () Bool)

(declare-fun res!602918 () Bool)

(declare-fun e!496067 () Bool)

(assert (=> d!110455 (=> res!602918 e!496067)))

(assert (=> d!110455 (= res!602918 (bvsge #b00000000000000000000000000000000 (size!25377 (_keys!9894 thiss!1181))))))

(assert (=> d!110455 (= (arrayNoDuplicates!0 (_keys!9894 thiss!1181) #b00000000000000000000000000000000 Nil!17645) e!496067)))

(declare-fun b!889938 () Bool)

(declare-fun e!496068 () Bool)

(declare-fun e!496069 () Bool)

(assert (=> b!889938 (= e!496068 e!496069)))

(declare-fun c!94215 () Bool)

(assert (=> b!889938 (= c!94215 (validKeyInArray!0 (select (arr!24934 (_keys!9894 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889939 () Bool)

(assert (=> b!889939 (= e!496067 e!496068)))

(declare-fun res!602919 () Bool)

(assert (=> b!889939 (=> (not res!602919) (not e!496068))))

(declare-fun e!496070 () Bool)

(assert (=> b!889939 (= res!602919 (not e!496070))))

(declare-fun res!602920 () Bool)

(assert (=> b!889939 (=> (not res!602920) (not e!496070))))

(assert (=> b!889939 (= res!602920 (validKeyInArray!0 (select (arr!24934 (_keys!9894 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39543 () Bool)

(declare-fun call!39546 () Bool)

(assert (=> bm!39543 (= call!39546 (arrayNoDuplicates!0 (_keys!9894 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94215 (Cons!17644 (select (arr!24934 (_keys!9894 thiss!1181)) #b00000000000000000000000000000000) Nil!17645) Nil!17645)))))

(declare-fun b!889940 () Bool)

(assert (=> b!889940 (= e!496069 call!39546)))

(declare-fun b!889941 () Bool)

(declare-fun contains!4309 (List!17648 (_ BitVec 64)) Bool)

(assert (=> b!889941 (= e!496070 (contains!4309 Nil!17645 (select (arr!24934 (_keys!9894 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889942 () Bool)

(assert (=> b!889942 (= e!496069 call!39546)))

(assert (= (and d!110455 (not res!602918)) b!889939))

(assert (= (and b!889939 res!602920) b!889941))

(assert (= (and b!889939 res!602919) b!889938))

(assert (= (and b!889938 c!94215) b!889940))

(assert (= (and b!889938 (not c!94215)) b!889942))

(assert (= (or b!889940 b!889942) bm!39543))

(assert (=> b!889938 m!829425))

(assert (=> b!889938 m!829425))

(assert (=> b!889938 m!829427))

(assert (=> b!889939 m!829425))

(assert (=> b!889939 m!829425))

(assert (=> b!889939 m!829427))

(assert (=> bm!39543 m!829425))

(declare-fun m!829441 () Bool)

(assert (=> bm!39543 m!829441))

(assert (=> b!889941 m!829425))

(assert (=> b!889941 m!829425))

(declare-fun m!829443 () Bool)

(assert (=> b!889941 m!829443))

(assert (=> b!889883 d!110455))

(declare-fun b!889943 () Bool)

(declare-fun e!496071 () Bool)

(assert (=> b!889943 (= e!496071 tp_is_empty!17923)))

(declare-fun mapIsEmpty!28438 () Bool)

(declare-fun mapRes!28438 () Bool)

(assert (=> mapIsEmpty!28438 mapRes!28438))

(declare-fun mapNonEmpty!28438 () Bool)

(declare-fun tp!54760 () Bool)

(assert (=> mapNonEmpty!28438 (= mapRes!28438 (and tp!54760 e!496071))))

(declare-fun mapRest!28438 () (Array (_ BitVec 32) ValueCell!8480))

(declare-fun mapKey!28438 () (_ BitVec 32))

(declare-fun mapValue!28438 () ValueCell!8480)

(assert (=> mapNonEmpty!28438 (= mapRest!28437 (store mapRest!28438 mapKey!28438 mapValue!28438))))

(declare-fun condMapEmpty!28438 () Bool)

(declare-fun mapDefault!28438 () ValueCell!8480)

(assert (=> mapNonEmpty!28437 (= condMapEmpty!28438 (= mapRest!28437 ((as const (Array (_ BitVec 32) ValueCell!8480)) mapDefault!28438)))))

(declare-fun e!496072 () Bool)

(assert (=> mapNonEmpty!28437 (= tp!54759 (and e!496072 mapRes!28438))))

(declare-fun b!889944 () Bool)

(assert (=> b!889944 (= e!496072 tp_is_empty!17923)))

(assert (= (and mapNonEmpty!28437 condMapEmpty!28438) mapIsEmpty!28438))

(assert (= (and mapNonEmpty!28437 (not condMapEmpty!28438)) mapNonEmpty!28438))

(assert (= (and mapNonEmpty!28438 ((_ is ValueCellFull!8480) mapValue!28438)) b!889943))

(assert (= (and mapNonEmpty!28437 ((_ is ValueCellFull!8480) mapDefault!28438)) b!889944))

(declare-fun m!829445 () Bool)

(assert (=> mapNonEmpty!28438 m!829445))

(check-sat tp_is_empty!17923 (not b!889901) b_and!25845 (not bm!39540) (not d!110453) (not b!889915) (not b!889925) (not bm!39543) (not b!889938) (not b!889912) (not mapNonEmpty!28438) (not b!889926) (not bm!39537) (not b!889939) (not b_next!15595) (not b!889941))
(check-sat b_and!25845 (not b_next!15595))
