; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79876 () Bool)

(assert start!79876)

(declare-fun b!939371 () Bool)

(declare-fun b_free!17791 () Bool)

(declare-fun b_next!17791 () Bool)

(assert (=> b!939371 (= b_free!17791 (not b_next!17791))))

(declare-fun tp!61837 () Bool)

(declare-fun b_and!29177 () Bool)

(assert (=> b!939371 (= tp!61837 b_and!29177)))

(declare-fun mapNonEmpty!32228 () Bool)

(declare-fun mapRes!32228 () Bool)

(declare-fun tp!61838 () Bool)

(declare-fun e!527665 () Bool)

(assert (=> mapNonEmpty!32228 (= mapRes!32228 (and tp!61838 e!527665))))

(declare-datatypes ((V!32031 0))(
  ( (V!32032 (val!10200 Int)) )
))
(declare-datatypes ((ValueCell!9668 0))(
  ( (ValueCellFull!9668 (v!12730 V!32031)) (EmptyCell!9668) )
))
(declare-datatypes ((array!56505 0))(
  ( (array!56506 (arr!27191 (Array (_ BitVec 32) ValueCell!9668)) (size!27652 (_ BitVec 32))) )
))
(declare-datatypes ((array!56507 0))(
  ( (array!56508 (arr!27192 (Array (_ BitVec 32) (_ BitVec 64))) (size!27653 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4486 0))(
  ( (LongMapFixedSize!4487 (defaultEntry!5534 Int) (mask!27043 (_ BitVec 32)) (extraKeys!5266 (_ BitVec 32)) (zeroValue!5370 V!32031) (minValue!5370 V!32031) (_size!2298 (_ BitVec 32)) (_keys!10377 array!56507) (_values!5557 array!56505) (_vacant!2298 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4486)

(declare-fun mapValue!32228 () ValueCell!9668)

(declare-fun mapRest!32228 () (Array (_ BitVec 32) ValueCell!9668))

(declare-fun mapKey!32228 () (_ BitVec 32))

(assert (=> mapNonEmpty!32228 (= (arr!27191 (_values!5557 thiss!1141)) (store mapRest!32228 mapKey!32228 mapValue!32228))))

(declare-fun b!939367 () Bool)

(declare-fun res!631840 () Bool)

(declare-fun e!527669 () Bool)

(assert (=> b!939367 (=> (not res!631840) (not e!527669))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!939367 (= res!631840 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!939368 () Bool)

(declare-fun e!527664 () Bool)

(declare-fun e!527668 () Bool)

(assert (=> b!939368 (= e!527664 (and e!527668 mapRes!32228))))

(declare-fun condMapEmpty!32228 () Bool)

(declare-fun mapDefault!32228 () ValueCell!9668)

(assert (=> b!939368 (= condMapEmpty!32228 (= (arr!27191 (_values!5557 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9668)) mapDefault!32228)))))

(declare-fun b!939369 () Bool)

(declare-fun tp_is_empty!20299 () Bool)

(assert (=> b!939369 (= e!527665 tp_is_empty!20299)))

(declare-fun b!939370 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!939370 (= e!527669 (not (validMask!0 (mask!27043 thiss!1141))))))

(declare-fun e!527666 () Bool)

(declare-fun array_inv!21214 (array!56507) Bool)

(declare-fun array_inv!21215 (array!56505) Bool)

(assert (=> b!939371 (= e!527666 (and tp!61837 tp_is_empty!20299 (array_inv!21214 (_keys!10377 thiss!1141)) (array_inv!21215 (_values!5557 thiss!1141)) e!527664))))

(declare-fun b!939372 () Bool)

(assert (=> b!939372 (= e!527668 tp_is_empty!20299)))

(declare-fun res!631841 () Bool)

(assert (=> start!79876 (=> (not res!631841) (not e!527669))))

(declare-fun valid!1731 (LongMapFixedSize!4486) Bool)

(assert (=> start!79876 (= res!631841 (valid!1731 thiss!1141))))

(assert (=> start!79876 e!527669))

(assert (=> start!79876 e!527666))

(assert (=> start!79876 true))

(declare-fun mapIsEmpty!32228 () Bool)

(assert (=> mapIsEmpty!32228 mapRes!32228))

(assert (= (and start!79876 res!631841) b!939367))

(assert (= (and b!939367 res!631840) b!939370))

(assert (= (and b!939368 condMapEmpty!32228) mapIsEmpty!32228))

(assert (= (and b!939368 (not condMapEmpty!32228)) mapNonEmpty!32228))

(get-info :version)

(assert (= (and mapNonEmpty!32228 ((_ is ValueCellFull!9668) mapValue!32228)) b!939369))

(assert (= (and b!939368 ((_ is ValueCellFull!9668) mapDefault!32228)) b!939372))

(assert (= b!939371 b!939368))

(assert (= start!79876 b!939371))

(declare-fun m!874665 () Bool)

(assert (=> mapNonEmpty!32228 m!874665))

(declare-fun m!874667 () Bool)

(assert (=> b!939370 m!874667))

(declare-fun m!874669 () Bool)

(assert (=> b!939371 m!874669))

(declare-fun m!874671 () Bool)

(assert (=> b!939371 m!874671))

(declare-fun m!874673 () Bool)

(assert (=> start!79876 m!874673))

(check-sat (not start!79876) b_and!29177 (not b!939371) (not b_next!17791) tp_is_empty!20299 (not b!939370) (not mapNonEmpty!32228))
(check-sat b_and!29177 (not b_next!17791))
(get-model)

(declare-fun d!113755 () Bool)

(assert (=> d!113755 (= (array_inv!21214 (_keys!10377 thiss!1141)) (bvsge (size!27653 (_keys!10377 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!939371 d!113755))

(declare-fun d!113757 () Bool)

(assert (=> d!113757 (= (array_inv!21215 (_values!5557 thiss!1141)) (bvsge (size!27652 (_values!5557 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!939371 d!113757))

(declare-fun d!113759 () Bool)

(assert (=> d!113759 (= (validMask!0 (mask!27043 thiss!1141)) (and (or (= (mask!27043 thiss!1141) #b00000000000000000000000000000111) (= (mask!27043 thiss!1141) #b00000000000000000000000000001111) (= (mask!27043 thiss!1141) #b00000000000000000000000000011111) (= (mask!27043 thiss!1141) #b00000000000000000000000000111111) (= (mask!27043 thiss!1141) #b00000000000000000000000001111111) (= (mask!27043 thiss!1141) #b00000000000000000000000011111111) (= (mask!27043 thiss!1141) #b00000000000000000000000111111111) (= (mask!27043 thiss!1141) #b00000000000000000000001111111111) (= (mask!27043 thiss!1141) #b00000000000000000000011111111111) (= (mask!27043 thiss!1141) #b00000000000000000000111111111111) (= (mask!27043 thiss!1141) #b00000000000000000001111111111111) (= (mask!27043 thiss!1141) #b00000000000000000011111111111111) (= (mask!27043 thiss!1141) #b00000000000000000111111111111111) (= (mask!27043 thiss!1141) #b00000000000000001111111111111111) (= (mask!27043 thiss!1141) #b00000000000000011111111111111111) (= (mask!27043 thiss!1141) #b00000000000000111111111111111111) (= (mask!27043 thiss!1141) #b00000000000001111111111111111111) (= (mask!27043 thiss!1141) #b00000000000011111111111111111111) (= (mask!27043 thiss!1141) #b00000000000111111111111111111111) (= (mask!27043 thiss!1141) #b00000000001111111111111111111111) (= (mask!27043 thiss!1141) #b00000000011111111111111111111111) (= (mask!27043 thiss!1141) #b00000000111111111111111111111111) (= (mask!27043 thiss!1141) #b00000001111111111111111111111111) (= (mask!27043 thiss!1141) #b00000011111111111111111111111111) (= (mask!27043 thiss!1141) #b00000111111111111111111111111111) (= (mask!27043 thiss!1141) #b00001111111111111111111111111111) (= (mask!27043 thiss!1141) #b00011111111111111111111111111111) (= (mask!27043 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27043 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!939370 d!113759))

(declare-fun d!113761 () Bool)

(declare-fun res!631860 () Bool)

(declare-fun e!527708 () Bool)

(assert (=> d!113761 (=> (not res!631860) (not e!527708))))

(declare-fun simpleValid!336 (LongMapFixedSize!4486) Bool)

(assert (=> d!113761 (= res!631860 (simpleValid!336 thiss!1141))))

(assert (=> d!113761 (= (valid!1731 thiss!1141) e!527708)))

(declare-fun b!939415 () Bool)

(declare-fun res!631861 () Bool)

(assert (=> b!939415 (=> (not res!631861) (not e!527708))))

(declare-fun arrayCountValidKeys!0 (array!56507 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!939415 (= res!631861 (= (arrayCountValidKeys!0 (_keys!10377 thiss!1141) #b00000000000000000000000000000000 (size!27653 (_keys!10377 thiss!1141))) (_size!2298 thiss!1141)))))

(declare-fun b!939416 () Bool)

(declare-fun res!631862 () Bool)

(assert (=> b!939416 (=> (not res!631862) (not e!527708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56507 (_ BitVec 32)) Bool)

(assert (=> b!939416 (= res!631862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10377 thiss!1141) (mask!27043 thiss!1141)))))

(declare-fun b!939417 () Bool)

(declare-datatypes ((List!19194 0))(
  ( (Nil!19191) (Cons!19190 (h!20336 (_ BitVec 64)) (t!27500 List!19194)) )
))
(declare-fun arrayNoDuplicates!0 (array!56507 (_ BitVec 32) List!19194) Bool)

(assert (=> b!939417 (= e!527708 (arrayNoDuplicates!0 (_keys!10377 thiss!1141) #b00000000000000000000000000000000 Nil!19191))))

(assert (= (and d!113761 res!631860) b!939415))

(assert (= (and b!939415 res!631861) b!939416))

(assert (= (and b!939416 res!631862) b!939417))

(declare-fun m!874695 () Bool)

(assert (=> d!113761 m!874695))

(declare-fun m!874697 () Bool)

(assert (=> b!939415 m!874697))

(declare-fun m!874699 () Bool)

(assert (=> b!939416 m!874699))

(declare-fun m!874701 () Bool)

(assert (=> b!939417 m!874701))

(assert (=> start!79876 d!113761))

(declare-fun condMapEmpty!32237 () Bool)

(declare-fun mapDefault!32237 () ValueCell!9668)

(assert (=> mapNonEmpty!32228 (= condMapEmpty!32237 (= mapRest!32228 ((as const (Array (_ BitVec 32) ValueCell!9668)) mapDefault!32237)))))

(declare-fun e!527713 () Bool)

(declare-fun mapRes!32237 () Bool)

(assert (=> mapNonEmpty!32228 (= tp!61838 (and e!527713 mapRes!32237))))

(declare-fun b!939425 () Bool)

(assert (=> b!939425 (= e!527713 tp_is_empty!20299)))

(declare-fun mapIsEmpty!32237 () Bool)

(assert (=> mapIsEmpty!32237 mapRes!32237))

(declare-fun b!939424 () Bool)

(declare-fun e!527714 () Bool)

(assert (=> b!939424 (= e!527714 tp_is_empty!20299)))

(declare-fun mapNonEmpty!32237 () Bool)

(declare-fun tp!61853 () Bool)

(assert (=> mapNonEmpty!32237 (= mapRes!32237 (and tp!61853 e!527714))))

(declare-fun mapValue!32237 () ValueCell!9668)

(declare-fun mapRest!32237 () (Array (_ BitVec 32) ValueCell!9668))

(declare-fun mapKey!32237 () (_ BitVec 32))

(assert (=> mapNonEmpty!32237 (= mapRest!32228 (store mapRest!32237 mapKey!32237 mapValue!32237))))

(assert (= (and mapNonEmpty!32228 condMapEmpty!32237) mapIsEmpty!32237))

(assert (= (and mapNonEmpty!32228 (not condMapEmpty!32237)) mapNonEmpty!32237))

(assert (= (and mapNonEmpty!32237 ((_ is ValueCellFull!9668) mapValue!32237)) b!939424))

(assert (= (and mapNonEmpty!32228 ((_ is ValueCellFull!9668) mapDefault!32237)) b!939425))

(declare-fun m!874703 () Bool)

(assert (=> mapNonEmpty!32237 m!874703))

(check-sat (not b!939416) b_and!29177 (not mapNonEmpty!32237) (not d!113761) (not b!939417) (not b_next!17791) tp_is_empty!20299 (not b!939415))
(check-sat b_and!29177 (not b_next!17791))
(get-model)

(declare-fun d!113763 () Bool)

(declare-fun res!631871 () Bool)

(declare-fun e!527723 () Bool)

(assert (=> d!113763 (=> res!631871 e!527723)))

(assert (=> d!113763 (= res!631871 (bvsge #b00000000000000000000000000000000 (size!27653 (_keys!10377 thiss!1141))))))

(assert (=> d!113763 (= (arrayNoDuplicates!0 (_keys!10377 thiss!1141) #b00000000000000000000000000000000 Nil!19191) e!527723)))

(declare-fun b!939436 () Bool)

(declare-fun e!527725 () Bool)

(declare-fun contains!5091 (List!19194 (_ BitVec 64)) Bool)

(assert (=> b!939436 (= e!527725 (contains!5091 Nil!19191 (select (arr!27192 (_keys!10377 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939437 () Bool)

(declare-fun e!527724 () Bool)

(declare-fun call!40873 () Bool)

(assert (=> b!939437 (= e!527724 call!40873)))

(declare-fun b!939438 () Bool)

(declare-fun e!527726 () Bool)

(assert (=> b!939438 (= e!527723 e!527726)))

(declare-fun res!631870 () Bool)

(assert (=> b!939438 (=> (not res!631870) (not e!527726))))

(assert (=> b!939438 (= res!631870 (not e!527725))))

(declare-fun res!631869 () Bool)

(assert (=> b!939438 (=> (not res!631869) (not e!527725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939438 (= res!631869 (validKeyInArray!0 (select (arr!27192 (_keys!10377 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939439 () Bool)

(assert (=> b!939439 (= e!527726 e!527724)))

(declare-fun c!97940 () Bool)

(assert (=> b!939439 (= c!97940 (validKeyInArray!0 (select (arr!27192 (_keys!10377 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939440 () Bool)

(assert (=> b!939440 (= e!527724 call!40873)))

(declare-fun bm!40870 () Bool)

(assert (=> bm!40870 (= call!40873 (arrayNoDuplicates!0 (_keys!10377 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97940 (Cons!19190 (select (arr!27192 (_keys!10377 thiss!1141)) #b00000000000000000000000000000000) Nil!19191) Nil!19191)))))

(assert (= (and d!113763 (not res!631871)) b!939438))

(assert (= (and b!939438 res!631869) b!939436))

(assert (= (and b!939438 res!631870) b!939439))

(assert (= (and b!939439 c!97940) b!939437))

(assert (= (and b!939439 (not c!97940)) b!939440))

(assert (= (or b!939437 b!939440) bm!40870))

(declare-fun m!874705 () Bool)

(assert (=> b!939436 m!874705))

(assert (=> b!939436 m!874705))

(declare-fun m!874707 () Bool)

(assert (=> b!939436 m!874707))

(assert (=> b!939438 m!874705))

(assert (=> b!939438 m!874705))

(declare-fun m!874709 () Bool)

(assert (=> b!939438 m!874709))

(assert (=> b!939439 m!874705))

(assert (=> b!939439 m!874705))

(assert (=> b!939439 m!874709))

(assert (=> bm!40870 m!874705))

(declare-fun m!874711 () Bool)

(assert (=> bm!40870 m!874711))

(assert (=> b!939417 d!113763))

(declare-fun b!939449 () Bool)

(declare-fun e!527734 () Bool)

(declare-fun e!527733 () Bool)

(assert (=> b!939449 (= e!527734 e!527733)))

(declare-fun c!97943 () Bool)

(assert (=> b!939449 (= c!97943 (validKeyInArray!0 (select (arr!27192 (_keys!10377 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939450 () Bool)

(declare-fun e!527735 () Bool)

(assert (=> b!939450 (= e!527733 e!527735)))

(declare-fun lt!424336 () (_ BitVec 64))

(assert (=> b!939450 (= lt!424336 (select (arr!27192 (_keys!10377 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31637 0))(
  ( (Unit!31638) )
))
(declare-fun lt!424337 () Unit!31637)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56507 (_ BitVec 64) (_ BitVec 32)) Unit!31637)

(assert (=> b!939450 (= lt!424337 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10377 thiss!1141) lt!424336 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939450 (arrayContainsKey!0 (_keys!10377 thiss!1141) lt!424336 #b00000000000000000000000000000000)))

(declare-fun lt!424335 () Unit!31637)

(assert (=> b!939450 (= lt!424335 lt!424337)))

(declare-fun res!631877 () Bool)

(declare-datatypes ((SeekEntryResult!8983 0))(
  ( (MissingZero!8983 (index!38303 (_ BitVec 32))) (Found!8983 (index!38304 (_ BitVec 32))) (Intermediate!8983 (undefined!9795 Bool) (index!38305 (_ BitVec 32)) (x!80537 (_ BitVec 32))) (Undefined!8983) (MissingVacant!8983 (index!38306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56507 (_ BitVec 32)) SeekEntryResult!8983)

(assert (=> b!939450 (= res!631877 (= (seekEntryOrOpen!0 (select (arr!27192 (_keys!10377 thiss!1141)) #b00000000000000000000000000000000) (_keys!10377 thiss!1141) (mask!27043 thiss!1141)) (Found!8983 #b00000000000000000000000000000000)))))

(assert (=> b!939450 (=> (not res!631877) (not e!527735))))

(declare-fun d!113765 () Bool)

(declare-fun res!631876 () Bool)

(assert (=> d!113765 (=> res!631876 e!527734)))

(assert (=> d!113765 (= res!631876 (bvsge #b00000000000000000000000000000000 (size!27653 (_keys!10377 thiss!1141))))))

(assert (=> d!113765 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10377 thiss!1141) (mask!27043 thiss!1141)) e!527734)))

(declare-fun b!939451 () Bool)

(declare-fun call!40876 () Bool)

(assert (=> b!939451 (= e!527735 call!40876)))

(declare-fun bm!40873 () Bool)

(assert (=> bm!40873 (= call!40876 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10377 thiss!1141) (mask!27043 thiss!1141)))))

(declare-fun b!939452 () Bool)

(assert (=> b!939452 (= e!527733 call!40876)))

(assert (= (and d!113765 (not res!631876)) b!939449))

(assert (= (and b!939449 c!97943) b!939450))

(assert (= (and b!939449 (not c!97943)) b!939452))

(assert (= (and b!939450 res!631877) b!939451))

(assert (= (or b!939451 b!939452) bm!40873))

(assert (=> b!939449 m!874705))

(assert (=> b!939449 m!874705))

(assert (=> b!939449 m!874709))

(assert (=> b!939450 m!874705))

(declare-fun m!874713 () Bool)

(assert (=> b!939450 m!874713))

(declare-fun m!874715 () Bool)

(assert (=> b!939450 m!874715))

(assert (=> b!939450 m!874705))

(declare-fun m!874717 () Bool)

(assert (=> b!939450 m!874717))

(declare-fun m!874719 () Bool)

(assert (=> bm!40873 m!874719))

(assert (=> b!939416 d!113765))

(declare-fun d!113767 () Bool)

(declare-fun lt!424340 () (_ BitVec 32))

(assert (=> d!113767 (and (bvsge lt!424340 #b00000000000000000000000000000000) (bvsle lt!424340 (bvsub (size!27653 (_keys!10377 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!527741 () (_ BitVec 32))

(assert (=> d!113767 (= lt!424340 e!527741)))

(declare-fun c!97948 () Bool)

(assert (=> d!113767 (= c!97948 (bvsge #b00000000000000000000000000000000 (size!27653 (_keys!10377 thiss!1141))))))

(assert (=> d!113767 (and (bvsle #b00000000000000000000000000000000 (size!27653 (_keys!10377 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27653 (_keys!10377 thiss!1141)) (size!27653 (_keys!10377 thiss!1141))))))

(assert (=> d!113767 (= (arrayCountValidKeys!0 (_keys!10377 thiss!1141) #b00000000000000000000000000000000 (size!27653 (_keys!10377 thiss!1141))) lt!424340)))

(declare-fun bm!40876 () Bool)

(declare-fun call!40879 () (_ BitVec 32))

(assert (=> bm!40876 (= call!40879 (arrayCountValidKeys!0 (_keys!10377 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27653 (_keys!10377 thiss!1141))))))

(declare-fun b!939461 () Bool)

(assert (=> b!939461 (= e!527741 #b00000000000000000000000000000000)))

(declare-fun b!939462 () Bool)

(declare-fun e!527740 () (_ BitVec 32))

(assert (=> b!939462 (= e!527741 e!527740)))

(declare-fun c!97949 () Bool)

(assert (=> b!939462 (= c!97949 (validKeyInArray!0 (select (arr!27192 (_keys!10377 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939463 () Bool)

(assert (=> b!939463 (= e!527740 (bvadd #b00000000000000000000000000000001 call!40879))))

(declare-fun b!939464 () Bool)

(assert (=> b!939464 (= e!527740 call!40879)))

(assert (= (and d!113767 c!97948) b!939461))

(assert (= (and d!113767 (not c!97948)) b!939462))

(assert (= (and b!939462 c!97949) b!939463))

(assert (= (and b!939462 (not c!97949)) b!939464))

(assert (= (or b!939463 b!939464) bm!40876))

(declare-fun m!874721 () Bool)

(assert (=> bm!40876 m!874721))

(assert (=> b!939462 m!874705))

(assert (=> b!939462 m!874705))

(assert (=> b!939462 m!874709))

(assert (=> b!939415 d!113767))

(declare-fun b!939475 () Bool)

(declare-fun res!631889 () Bool)

(declare-fun e!527744 () Bool)

(assert (=> b!939475 (=> (not res!631889) (not e!527744))))

(declare-fun size!27658 (LongMapFixedSize!4486) (_ BitVec 32))

(assert (=> b!939475 (= res!631889 (= (size!27658 thiss!1141) (bvadd (_size!2298 thiss!1141) (bvsdiv (bvadd (extraKeys!5266 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!939473 () Bool)

(declare-fun res!631888 () Bool)

(assert (=> b!939473 (=> (not res!631888) (not e!527744))))

(assert (=> b!939473 (= res!631888 (and (= (size!27652 (_values!5557 thiss!1141)) (bvadd (mask!27043 thiss!1141) #b00000000000000000000000000000001)) (= (size!27653 (_keys!10377 thiss!1141)) (size!27652 (_values!5557 thiss!1141))) (bvsge (_size!2298 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2298 thiss!1141) (bvadd (mask!27043 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!939474 () Bool)

(declare-fun res!631887 () Bool)

(assert (=> b!939474 (=> (not res!631887) (not e!527744))))

(assert (=> b!939474 (= res!631887 (bvsge (size!27658 thiss!1141) (_size!2298 thiss!1141)))))

(declare-fun d!113769 () Bool)

(declare-fun res!631886 () Bool)

(assert (=> d!113769 (=> (not res!631886) (not e!527744))))

(assert (=> d!113769 (= res!631886 (validMask!0 (mask!27043 thiss!1141)))))

(assert (=> d!113769 (= (simpleValid!336 thiss!1141) e!527744)))

(declare-fun b!939476 () Bool)

(assert (=> b!939476 (= e!527744 (and (bvsge (extraKeys!5266 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5266 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2298 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!113769 res!631886) b!939473))

(assert (= (and b!939473 res!631888) b!939474))

(assert (= (and b!939474 res!631887) b!939475))

(assert (= (and b!939475 res!631889) b!939476))

(declare-fun m!874723 () Bool)

(assert (=> b!939475 m!874723))

(assert (=> b!939474 m!874723))

(assert (=> d!113769 m!874667))

(assert (=> d!113761 d!113769))

(declare-fun condMapEmpty!32238 () Bool)

(declare-fun mapDefault!32238 () ValueCell!9668)

(assert (=> mapNonEmpty!32237 (= condMapEmpty!32238 (= mapRest!32237 ((as const (Array (_ BitVec 32) ValueCell!9668)) mapDefault!32238)))))

(declare-fun e!527745 () Bool)

(declare-fun mapRes!32238 () Bool)

(assert (=> mapNonEmpty!32237 (= tp!61853 (and e!527745 mapRes!32238))))

(declare-fun b!939478 () Bool)

(assert (=> b!939478 (= e!527745 tp_is_empty!20299)))

(declare-fun mapIsEmpty!32238 () Bool)

(assert (=> mapIsEmpty!32238 mapRes!32238))

(declare-fun b!939477 () Bool)

(declare-fun e!527746 () Bool)

(assert (=> b!939477 (= e!527746 tp_is_empty!20299)))

(declare-fun mapNonEmpty!32238 () Bool)

(declare-fun tp!61854 () Bool)

(assert (=> mapNonEmpty!32238 (= mapRes!32238 (and tp!61854 e!527746))))

(declare-fun mapRest!32238 () (Array (_ BitVec 32) ValueCell!9668))

(declare-fun mapValue!32238 () ValueCell!9668)

(declare-fun mapKey!32238 () (_ BitVec 32))

(assert (=> mapNonEmpty!32238 (= mapRest!32237 (store mapRest!32238 mapKey!32238 mapValue!32238))))

(assert (= (and mapNonEmpty!32237 condMapEmpty!32238) mapIsEmpty!32238))

(assert (= (and mapNonEmpty!32237 (not condMapEmpty!32238)) mapNonEmpty!32238))

(assert (= (and mapNonEmpty!32238 ((_ is ValueCellFull!9668) mapValue!32238)) b!939477))

(assert (= (and mapNonEmpty!32237 ((_ is ValueCellFull!9668) mapDefault!32238)) b!939478))

(declare-fun m!874725 () Bool)

(assert (=> mapNonEmpty!32238 m!874725))

(check-sat (not b!939462) (not bm!40870) (not d!113769) (not b!939439) b_and!29177 (not bm!40876) (not b!939450) (not b!939474) (not bm!40873) (not b_next!17791) tp_is_empty!20299 (not b!939436) (not b!939438) (not b!939475) (not b!939449) (not mapNonEmpty!32238))
(check-sat b_and!29177 (not b_next!17791))
