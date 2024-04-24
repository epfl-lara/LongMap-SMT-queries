; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134214 () Bool)

(assert start!134214)

(declare-fun b!1567003 () Bool)

(declare-fun res!1070468 () Bool)

(declare-fun e!873530 () Bool)

(assert (=> b!1567003 (=> res!1070468 e!873530)))

(declare-datatypes ((V!60041 0))(
  ( (V!60042 (val!19521 Int)) )
))
(declare-datatypes ((tuple2!25246 0))(
  ( (tuple2!25247 (_1!12634 (_ BitVec 64)) (_2!12634 V!60041)) )
))
(declare-datatypes ((List!36606 0))(
  ( (Nil!36603) (Cons!36602 (h!38066 tuple2!25246) (t!51445 List!36606)) )
))
(declare-datatypes ((ListLongMap!22689 0))(
  ( (ListLongMap!22690 (toList!11360 List!36606)) )
))
(declare-fun contains!10362 (ListLongMap!22689 (_ BitVec 64)) Bool)

(assert (=> b!1567003 (= res!1070468 (contains!10362 (ListLongMap!22690 Nil!36603) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567004 () Bool)

(declare-fun e!873527 () Bool)

(declare-fun tp_is_empty!38875 () Bool)

(assert (=> b!1567004 (= e!873527 tp_is_empty!38875)))

(declare-fun mapNonEmpty!59691 () Bool)

(declare-fun mapRes!59691 () Bool)

(declare-fun tp!113616 () Bool)

(assert (=> mapNonEmpty!59691 (= mapRes!59691 (and tp!113616 e!873527))))

(declare-fun mapKey!59691 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18407 0))(
  ( (ValueCellFull!18407 (v!22265 V!60041)) (EmptyCell!18407) )
))
(declare-datatypes ((array!104562 0))(
  ( (array!104563 (arr!50465 (Array (_ BitVec 32) ValueCell!18407)) (size!51016 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104562)

(declare-fun mapRest!59691 () (Array (_ BitVec 32) ValueCell!18407))

(declare-fun mapValue!59691 () ValueCell!18407)

(assert (=> mapNonEmpty!59691 (= (arr!50465 _values!487) (store mapRest!59691 mapKey!59691 mapValue!59691))))

(declare-fun mapIsEmpty!59691 () Bool)

(assert (=> mapIsEmpty!59691 mapRes!59691))

(declare-fun b!1567005 () Bool)

(declare-fun e!873529 () Bool)

(assert (=> b!1567005 (= e!873529 e!873530)))

(declare-fun res!1070471 () Bool)

(assert (=> b!1567005 (=> res!1070471 e!873530)))

(assert (=> b!1567005 (= res!1070471 (contains!10362 (ListLongMap!22690 Nil!36603) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567006 () Bool)

(declare-fun res!1070467 () Bool)

(assert (=> b!1567006 (=> (not res!1070467) (not e!873529))))

(declare-datatypes ((array!104564 0))(
  ( (array!104565 (arr!50466 (Array (_ BitVec 32) (_ BitVec 64))) (size!51017 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104564)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104564 (_ BitVec 32)) Bool)

(assert (=> b!1567006 (= res!1070467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567008 () Bool)

(declare-fun e!873532 () Bool)

(declare-fun e!873531 () Bool)

(assert (=> b!1567008 (= e!873532 (and e!873531 mapRes!59691))))

(declare-fun condMapEmpty!59691 () Bool)

(declare-fun mapDefault!59691 () ValueCell!18407)

(assert (=> b!1567008 (= condMapEmpty!59691 (= (arr!50465 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18407)) mapDefault!59691)))))

(declare-fun b!1567009 () Bool)

(declare-fun res!1070470 () Bool)

(assert (=> b!1567009 (=> (not res!1070470) (not e!873529))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1567009 (= res!1070470 (and (= (size!51016 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51017 _keys!637) (size!51016 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1567010 () Bool)

(assert (=> b!1567010 (= e!873531 tp_is_empty!38875)))

(declare-fun b!1567011 () Bool)

(declare-fun res!1070469 () Bool)

(assert (=> b!1567011 (=> (not res!1070469) (not e!873529))))

(declare-datatypes ((List!36607 0))(
  ( (Nil!36604) (Cons!36603 (h!38067 (_ BitVec 64)) (t!51446 List!36607)) )
))
(declare-fun arrayNoDuplicates!0 (array!104564 (_ BitVec 32) List!36607) Bool)

(assert (=> b!1567011 (= res!1070469 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36604))))

(declare-fun b!1567012 () Bool)

(declare-fun isEmpty!1143 (ListLongMap!22689) Bool)

(assert (=> b!1567012 (= e!873530 (not (isEmpty!1143 (ListLongMap!22690 Nil!36603))))))

(declare-fun b!1567007 () Bool)

(declare-fun res!1070465 () Bool)

(assert (=> b!1567007 (=> (not res!1070465) (not e!873529))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1567007 (= res!1070465 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51017 _keys!637)) (bvsge from!782 (size!51017 _keys!637))))))

(declare-fun res!1070466 () Bool)

(assert (=> start!134214 (=> (not res!1070466) (not e!873529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134214 (= res!1070466 (validMask!0 mask!947))))

(assert (=> start!134214 e!873529))

(assert (=> start!134214 true))

(declare-fun array_inv!39461 (array!104564) Bool)

(assert (=> start!134214 (array_inv!39461 _keys!637)))

(declare-fun array_inv!39462 (array!104562) Bool)

(assert (=> start!134214 (and (array_inv!39462 _values!487) e!873532)))

(assert (= (and start!134214 res!1070466) b!1567009))

(assert (= (and b!1567009 res!1070470) b!1567006))

(assert (= (and b!1567006 res!1070467) b!1567011))

(assert (= (and b!1567011 res!1070469) b!1567007))

(assert (= (and b!1567007 res!1070465) b!1567005))

(assert (= (and b!1567005 (not res!1070471)) b!1567003))

(assert (= (and b!1567003 (not res!1070468)) b!1567012))

(assert (= (and b!1567008 condMapEmpty!59691) mapIsEmpty!59691))

(assert (= (and b!1567008 (not condMapEmpty!59691)) mapNonEmpty!59691))

(get-info :version)

(assert (= (and mapNonEmpty!59691 ((_ is ValueCellFull!18407) mapValue!59691)) b!1567004))

(assert (= (and b!1567008 ((_ is ValueCellFull!18407) mapDefault!59691)) b!1567010))

(assert (= start!134214 b!1567008))

(declare-fun m!1441965 () Bool)

(assert (=> start!134214 m!1441965))

(declare-fun m!1441967 () Bool)

(assert (=> start!134214 m!1441967))

(declare-fun m!1441969 () Bool)

(assert (=> start!134214 m!1441969))

(declare-fun m!1441971 () Bool)

(assert (=> b!1567012 m!1441971))

(declare-fun m!1441973 () Bool)

(assert (=> mapNonEmpty!59691 m!1441973))

(declare-fun m!1441975 () Bool)

(assert (=> b!1567011 m!1441975))

(declare-fun m!1441977 () Bool)

(assert (=> b!1567005 m!1441977))

(declare-fun m!1441979 () Bool)

(assert (=> b!1567003 m!1441979))

(declare-fun m!1441981 () Bool)

(assert (=> b!1567006 m!1441981))

(check-sat (not b!1567003) (not b!1567005) (not mapNonEmpty!59691) tp_is_empty!38875 (not b!1567006) (not b!1567012) (not start!134214) (not b!1567011))
(check-sat)
(get-model)

(declare-fun d!163789 () Bool)

(assert (=> d!163789 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134214 d!163789))

(declare-fun d!163791 () Bool)

(assert (=> d!163791 (= (array_inv!39461 _keys!637) (bvsge (size!51017 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134214 d!163791))

(declare-fun d!163793 () Bool)

(assert (=> d!163793 (= (array_inv!39462 _values!487) (bvsge (size!51016 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134214 d!163793))

(declare-fun d!163795 () Bool)

(declare-fun isEmpty!1146 (List!36606) Bool)

(assert (=> d!163795 (= (isEmpty!1143 (ListLongMap!22690 Nil!36603)) (isEmpty!1146 (toList!11360 (ListLongMap!22690 Nil!36603))))))

(declare-fun bs!45041 () Bool)

(assert (= bs!45041 d!163795))

(declare-fun m!1442019 () Bool)

(assert (=> bs!45041 m!1442019))

(assert (=> b!1567012 d!163795))

(declare-fun d!163797 () Bool)

(declare-fun e!873574 () Bool)

(assert (=> d!163797 e!873574))

(declare-fun res!1070516 () Bool)

(assert (=> d!163797 (=> res!1070516 e!873574)))

(declare-fun lt!672971 () Bool)

(assert (=> d!163797 (= res!1070516 (not lt!672971))))

(declare-fun lt!672968 () Bool)

(assert (=> d!163797 (= lt!672971 lt!672968)))

(declare-datatypes ((Unit!51895 0))(
  ( (Unit!51896) )
))
(declare-fun lt!672970 () Unit!51895)

(declare-fun e!873573 () Unit!51895)

(assert (=> d!163797 (= lt!672970 e!873573)))

(declare-fun c!145033 () Bool)

(assert (=> d!163797 (= c!145033 lt!672968)))

(declare-fun containsKey!848 (List!36606 (_ BitVec 64)) Bool)

(assert (=> d!163797 (= lt!672968 (containsKey!848 (toList!11360 (ListLongMap!22690 Nil!36603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163797 (= (contains!10362 (ListLongMap!22690 Nil!36603) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672971)))

(declare-fun b!1567079 () Bool)

(declare-fun lt!672969 () Unit!51895)

(assert (=> b!1567079 (= e!873573 lt!672969)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!531 (List!36606 (_ BitVec 64)) Unit!51895)

(assert (=> b!1567079 (= lt!672969 (lemmaContainsKeyImpliesGetValueByKeyDefined!531 (toList!11360 (ListLongMap!22690 Nil!36603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!861 0))(
  ( (Some!860 (v!22268 V!60041)) (None!859) )
))
(declare-fun isDefined!577 (Option!861) Bool)

(declare-fun getValueByKey!786 (List!36606 (_ BitVec 64)) Option!861)

(assert (=> b!1567079 (isDefined!577 (getValueByKey!786 (toList!11360 (ListLongMap!22690 Nil!36603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567080 () Bool)

(declare-fun Unit!51897 () Unit!51895)

(assert (=> b!1567080 (= e!873573 Unit!51897)))

(declare-fun b!1567081 () Bool)

(assert (=> b!1567081 (= e!873574 (isDefined!577 (getValueByKey!786 (toList!11360 (ListLongMap!22690 Nil!36603)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163797 c!145033) b!1567079))

(assert (= (and d!163797 (not c!145033)) b!1567080))

(assert (= (and d!163797 (not res!1070516)) b!1567081))

(declare-fun m!1442021 () Bool)

(assert (=> d!163797 m!1442021))

(declare-fun m!1442023 () Bool)

(assert (=> b!1567079 m!1442023))

(declare-fun m!1442025 () Bool)

(assert (=> b!1567079 m!1442025))

(assert (=> b!1567079 m!1442025))

(declare-fun m!1442027 () Bool)

(assert (=> b!1567079 m!1442027))

(assert (=> b!1567081 m!1442025))

(assert (=> b!1567081 m!1442025))

(assert (=> b!1567081 m!1442027))

(assert (=> b!1567005 d!163797))

(declare-fun d!163799 () Bool)

(declare-fun e!873576 () Bool)

(assert (=> d!163799 e!873576))

(declare-fun res!1070517 () Bool)

(assert (=> d!163799 (=> res!1070517 e!873576)))

(declare-fun lt!672975 () Bool)

(assert (=> d!163799 (= res!1070517 (not lt!672975))))

(declare-fun lt!672972 () Bool)

(assert (=> d!163799 (= lt!672975 lt!672972)))

(declare-fun lt!672974 () Unit!51895)

(declare-fun e!873575 () Unit!51895)

(assert (=> d!163799 (= lt!672974 e!873575)))

(declare-fun c!145034 () Bool)

(assert (=> d!163799 (= c!145034 lt!672972)))

(assert (=> d!163799 (= lt!672972 (containsKey!848 (toList!11360 (ListLongMap!22690 Nil!36603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163799 (= (contains!10362 (ListLongMap!22690 Nil!36603) #b1000000000000000000000000000000000000000000000000000000000000000) lt!672975)))

(declare-fun b!1567082 () Bool)

(declare-fun lt!672973 () Unit!51895)

(assert (=> b!1567082 (= e!873575 lt!672973)))

(assert (=> b!1567082 (= lt!672973 (lemmaContainsKeyImpliesGetValueByKeyDefined!531 (toList!11360 (ListLongMap!22690 Nil!36603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1567082 (isDefined!577 (getValueByKey!786 (toList!11360 (ListLongMap!22690 Nil!36603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567083 () Bool)

(declare-fun Unit!51898 () Unit!51895)

(assert (=> b!1567083 (= e!873575 Unit!51898)))

(declare-fun b!1567084 () Bool)

(assert (=> b!1567084 (= e!873576 (isDefined!577 (getValueByKey!786 (toList!11360 (ListLongMap!22690 Nil!36603)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163799 c!145034) b!1567082))

(assert (= (and d!163799 (not c!145034)) b!1567083))

(assert (= (and d!163799 (not res!1070517)) b!1567084))

(declare-fun m!1442029 () Bool)

(assert (=> d!163799 m!1442029))

(declare-fun m!1442031 () Bool)

(assert (=> b!1567082 m!1442031))

(declare-fun m!1442033 () Bool)

(assert (=> b!1567082 m!1442033))

(assert (=> b!1567082 m!1442033))

(declare-fun m!1442035 () Bool)

(assert (=> b!1567082 m!1442035))

(assert (=> b!1567084 m!1442033))

(assert (=> b!1567084 m!1442033))

(assert (=> b!1567084 m!1442035))

(assert (=> b!1567003 d!163799))

(declare-fun b!1567093 () Bool)

(declare-fun e!873584 () Bool)

(declare-fun call!72003 () Bool)

(assert (=> b!1567093 (= e!873584 call!72003)))

(declare-fun bm!72000 () Bool)

(assert (=> bm!72000 (= call!72003 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1567094 () Bool)

(declare-fun e!873583 () Bool)

(assert (=> b!1567094 (= e!873583 call!72003)))

(declare-fun b!1567095 () Bool)

(declare-fun e!873585 () Bool)

(assert (=> b!1567095 (= e!873585 e!873583)))

(declare-fun c!145037 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567095 (= c!145037 (validKeyInArray!0 (select (arr!50466 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163801 () Bool)

(declare-fun res!1070522 () Bool)

(assert (=> d!163801 (=> res!1070522 e!873585)))

(assert (=> d!163801 (= res!1070522 (bvsge #b00000000000000000000000000000000 (size!51017 _keys!637)))))

(assert (=> d!163801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!873585)))

(declare-fun b!1567096 () Bool)

(assert (=> b!1567096 (= e!873583 e!873584)))

(declare-fun lt!672984 () (_ BitVec 64))

(assert (=> b!1567096 (= lt!672984 (select (arr!50466 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!672983 () Unit!51895)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104564 (_ BitVec 64) (_ BitVec 32)) Unit!51895)

(assert (=> b!1567096 (= lt!672983 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672984 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1567096 (arrayContainsKey!0 _keys!637 lt!672984 #b00000000000000000000000000000000)))

(declare-fun lt!672982 () Unit!51895)

(assert (=> b!1567096 (= lt!672982 lt!672983)))

(declare-fun res!1070523 () Bool)

(declare-datatypes ((SeekEntryResult!13470 0))(
  ( (MissingZero!13470 (index!56278 (_ BitVec 32))) (Found!13470 (index!56279 (_ BitVec 32))) (Intermediate!13470 (undefined!14282 Bool) (index!56280 (_ BitVec 32)) (x!140525 (_ BitVec 32))) (Undefined!13470) (MissingVacant!13470 (index!56281 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104564 (_ BitVec 32)) SeekEntryResult!13470)

(assert (=> b!1567096 (= res!1070523 (= (seekEntryOrOpen!0 (select (arr!50466 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13470 #b00000000000000000000000000000000)))))

(assert (=> b!1567096 (=> (not res!1070523) (not e!873584))))

(assert (= (and d!163801 (not res!1070522)) b!1567095))

(assert (= (and b!1567095 c!145037) b!1567096))

(assert (= (and b!1567095 (not c!145037)) b!1567094))

(assert (= (and b!1567096 res!1070523) b!1567093))

(assert (= (or b!1567093 b!1567094) bm!72000))

(declare-fun m!1442037 () Bool)

(assert (=> bm!72000 m!1442037))

(declare-fun m!1442039 () Bool)

(assert (=> b!1567095 m!1442039))

(assert (=> b!1567095 m!1442039))

(declare-fun m!1442041 () Bool)

(assert (=> b!1567095 m!1442041))

(assert (=> b!1567096 m!1442039))

(declare-fun m!1442043 () Bool)

(assert (=> b!1567096 m!1442043))

(declare-fun m!1442045 () Bool)

(assert (=> b!1567096 m!1442045))

(assert (=> b!1567096 m!1442039))

(declare-fun m!1442047 () Bool)

(assert (=> b!1567096 m!1442047))

(assert (=> b!1567006 d!163801))

(declare-fun b!1567107 () Bool)

(declare-fun e!873595 () Bool)

(declare-fun call!72006 () Bool)

(assert (=> b!1567107 (= e!873595 call!72006)))

(declare-fun d!163803 () Bool)

(declare-fun res!1070532 () Bool)

(declare-fun e!873594 () Bool)

(assert (=> d!163803 (=> res!1070532 e!873594)))

(assert (=> d!163803 (= res!1070532 (bvsge #b00000000000000000000000000000000 (size!51017 _keys!637)))))

(assert (=> d!163803 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36604) e!873594)))

(declare-fun b!1567108 () Bool)

(declare-fun e!873596 () Bool)

(assert (=> b!1567108 (= e!873594 e!873596)))

(declare-fun res!1070531 () Bool)

(assert (=> b!1567108 (=> (not res!1070531) (not e!873596))))

(declare-fun e!873597 () Bool)

(assert (=> b!1567108 (= res!1070531 (not e!873597))))

(declare-fun res!1070530 () Bool)

(assert (=> b!1567108 (=> (not res!1070530) (not e!873597))))

(assert (=> b!1567108 (= res!1070530 (validKeyInArray!0 (select (arr!50466 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567109 () Bool)

(assert (=> b!1567109 (= e!873596 e!873595)))

(declare-fun c!145040 () Bool)

(assert (=> b!1567109 (= c!145040 (validKeyInArray!0 (select (arr!50466 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567110 () Bool)

(assert (=> b!1567110 (= e!873595 call!72006)))

(declare-fun bm!72003 () Bool)

(assert (=> bm!72003 (= call!72006 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!145040 (Cons!36603 (select (arr!50466 _keys!637) #b00000000000000000000000000000000) Nil!36604) Nil!36604)))))

(declare-fun b!1567111 () Bool)

(declare-fun contains!10364 (List!36607 (_ BitVec 64)) Bool)

(assert (=> b!1567111 (= e!873597 (contains!10364 Nil!36604 (select (arr!50466 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163803 (not res!1070532)) b!1567108))

(assert (= (and b!1567108 res!1070530) b!1567111))

(assert (= (and b!1567108 res!1070531) b!1567109))

(assert (= (and b!1567109 c!145040) b!1567107))

(assert (= (and b!1567109 (not c!145040)) b!1567110))

(assert (= (or b!1567107 b!1567110) bm!72003))

(assert (=> b!1567108 m!1442039))

(assert (=> b!1567108 m!1442039))

(assert (=> b!1567108 m!1442041))

(assert (=> b!1567109 m!1442039))

(assert (=> b!1567109 m!1442039))

(assert (=> b!1567109 m!1442041))

(assert (=> bm!72003 m!1442039))

(declare-fun m!1442049 () Bool)

(assert (=> bm!72003 m!1442049))

(assert (=> b!1567111 m!1442039))

(assert (=> b!1567111 m!1442039))

(declare-fun m!1442051 () Bool)

(assert (=> b!1567111 m!1442051))

(assert (=> b!1567011 d!163803))

(declare-fun b!1567119 () Bool)

(declare-fun e!873603 () Bool)

(assert (=> b!1567119 (= e!873603 tp_is_empty!38875)))

(declare-fun condMapEmpty!59700 () Bool)

(declare-fun mapDefault!59700 () ValueCell!18407)

(assert (=> mapNonEmpty!59691 (= condMapEmpty!59700 (= mapRest!59691 ((as const (Array (_ BitVec 32) ValueCell!18407)) mapDefault!59700)))))

(declare-fun mapRes!59700 () Bool)

(assert (=> mapNonEmpty!59691 (= tp!113616 (and e!873603 mapRes!59700))))

(declare-fun mapIsEmpty!59700 () Bool)

(assert (=> mapIsEmpty!59700 mapRes!59700))

(declare-fun mapNonEmpty!59700 () Bool)

(declare-fun tp!113625 () Bool)

(declare-fun e!873602 () Bool)

(assert (=> mapNonEmpty!59700 (= mapRes!59700 (and tp!113625 e!873602))))

(declare-fun mapKey!59700 () (_ BitVec 32))

(declare-fun mapRest!59700 () (Array (_ BitVec 32) ValueCell!18407))

(declare-fun mapValue!59700 () ValueCell!18407)

(assert (=> mapNonEmpty!59700 (= mapRest!59691 (store mapRest!59700 mapKey!59700 mapValue!59700))))

(declare-fun b!1567118 () Bool)

(assert (=> b!1567118 (= e!873602 tp_is_empty!38875)))

(assert (= (and mapNonEmpty!59691 condMapEmpty!59700) mapIsEmpty!59700))

(assert (= (and mapNonEmpty!59691 (not condMapEmpty!59700)) mapNonEmpty!59700))

(assert (= (and mapNonEmpty!59700 ((_ is ValueCellFull!18407) mapValue!59700)) b!1567118))

(assert (= (and mapNonEmpty!59691 ((_ is ValueCellFull!18407) mapDefault!59700)) b!1567119))

(declare-fun m!1442053 () Bool)

(assert (=> mapNonEmpty!59700 m!1442053))

(check-sat (not d!163797) (not b!1567108) (not bm!72003) (not b!1567109) (not b!1567081) (not b!1567082) (not b!1567095) (not b!1567111) (not b!1567084) tp_is_empty!38875 (not b!1567079) (not bm!72000) (not b!1567096) (not mapNonEmpty!59700) (not d!163799) (not d!163795))
(check-sat)
(get-model)

(declare-fun d!163805 () Bool)

(assert (=> d!163805 (arrayContainsKey!0 _keys!637 lt!672984 #b00000000000000000000000000000000)))

(declare-fun lt!672987 () Unit!51895)

(declare-fun choose!13 (array!104564 (_ BitVec 64) (_ BitVec 32)) Unit!51895)

(assert (=> d!163805 (= lt!672987 (choose!13 _keys!637 lt!672984 #b00000000000000000000000000000000))))

(assert (=> d!163805 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!163805 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672984 #b00000000000000000000000000000000) lt!672987)))

(declare-fun bs!45042 () Bool)

(assert (= bs!45042 d!163805))

(assert (=> bs!45042 m!1442045))

(declare-fun m!1442055 () Bool)

(assert (=> bs!45042 m!1442055))

(assert (=> b!1567096 d!163805))

(declare-fun d!163807 () Bool)

(declare-fun res!1070537 () Bool)

(declare-fun e!873608 () Bool)

(assert (=> d!163807 (=> res!1070537 e!873608)))

(assert (=> d!163807 (= res!1070537 (= (select (arr!50466 _keys!637) #b00000000000000000000000000000000) lt!672984))))

(assert (=> d!163807 (= (arrayContainsKey!0 _keys!637 lt!672984 #b00000000000000000000000000000000) e!873608)))

(declare-fun b!1567124 () Bool)

(declare-fun e!873609 () Bool)

(assert (=> b!1567124 (= e!873608 e!873609)))

(declare-fun res!1070538 () Bool)

(assert (=> b!1567124 (=> (not res!1070538) (not e!873609))))

(assert (=> b!1567124 (= res!1070538 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51017 _keys!637)))))

(declare-fun b!1567125 () Bool)

(assert (=> b!1567125 (= e!873609 (arrayContainsKey!0 _keys!637 lt!672984 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!163807 (not res!1070537)) b!1567124))

(assert (= (and b!1567124 res!1070538) b!1567125))

(assert (=> d!163807 m!1442039))

(declare-fun m!1442057 () Bool)

(assert (=> b!1567125 m!1442057))

(assert (=> b!1567096 d!163807))

(declare-fun b!1567138 () Bool)

(declare-fun e!873617 () SeekEntryResult!13470)

(declare-fun lt!672995 () SeekEntryResult!13470)

(assert (=> b!1567138 (= e!873617 (MissingZero!13470 (index!56280 lt!672995)))))

(declare-fun b!1567139 () Bool)

(declare-fun c!145048 () Bool)

(declare-fun lt!672996 () (_ BitVec 64))

(assert (=> b!1567139 (= c!145048 (= lt!672996 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873618 () SeekEntryResult!13470)

(assert (=> b!1567139 (= e!873618 e!873617)))

(declare-fun b!1567140 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104564 (_ BitVec 32)) SeekEntryResult!13470)

(assert (=> b!1567140 (= e!873617 (seekKeyOrZeroReturnVacant!0 (x!140525 lt!672995) (index!56280 lt!672995) (index!56280 lt!672995) (select (arr!50466 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(declare-fun b!1567141 () Bool)

(assert (=> b!1567141 (= e!873618 (Found!13470 (index!56280 lt!672995)))))

(declare-fun b!1567142 () Bool)

(declare-fun e!873616 () SeekEntryResult!13470)

(assert (=> b!1567142 (= e!873616 e!873618)))

(assert (=> b!1567142 (= lt!672996 (select (arr!50466 _keys!637) (index!56280 lt!672995)))))

(declare-fun c!145047 () Bool)

(assert (=> b!1567142 (= c!145047 (= lt!672996 (select (arr!50466 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567143 () Bool)

(assert (=> b!1567143 (= e!873616 Undefined!13470)))

(declare-fun d!163809 () Bool)

(declare-fun lt!672994 () SeekEntryResult!13470)

(assert (=> d!163809 (and (or ((_ is Undefined!13470) lt!672994) (not ((_ is Found!13470) lt!672994)) (and (bvsge (index!56279 lt!672994) #b00000000000000000000000000000000) (bvslt (index!56279 lt!672994) (size!51017 _keys!637)))) (or ((_ is Undefined!13470) lt!672994) ((_ is Found!13470) lt!672994) (not ((_ is MissingZero!13470) lt!672994)) (and (bvsge (index!56278 lt!672994) #b00000000000000000000000000000000) (bvslt (index!56278 lt!672994) (size!51017 _keys!637)))) (or ((_ is Undefined!13470) lt!672994) ((_ is Found!13470) lt!672994) ((_ is MissingZero!13470) lt!672994) (not ((_ is MissingVacant!13470) lt!672994)) (and (bvsge (index!56281 lt!672994) #b00000000000000000000000000000000) (bvslt (index!56281 lt!672994) (size!51017 _keys!637)))) (or ((_ is Undefined!13470) lt!672994) (ite ((_ is Found!13470) lt!672994) (= (select (arr!50466 _keys!637) (index!56279 lt!672994)) (select (arr!50466 _keys!637) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!13470) lt!672994) (= (select (arr!50466 _keys!637) (index!56278 lt!672994)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13470) lt!672994) (= (select (arr!50466 _keys!637) (index!56281 lt!672994)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163809 (= lt!672994 e!873616)))

(declare-fun c!145049 () Bool)

(assert (=> d!163809 (= c!145049 (and ((_ is Intermediate!13470) lt!672995) (undefined!14282 lt!672995)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104564 (_ BitVec 32)) SeekEntryResult!13470)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!163809 (= lt!672995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50466 _keys!637) #b00000000000000000000000000000000) mask!947) (select (arr!50466 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(assert (=> d!163809 (validMask!0 mask!947)))

(assert (=> d!163809 (= (seekEntryOrOpen!0 (select (arr!50466 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) lt!672994)))

(assert (= (and d!163809 c!145049) b!1567143))

(assert (= (and d!163809 (not c!145049)) b!1567142))

(assert (= (and b!1567142 c!145047) b!1567141))

(assert (= (and b!1567142 (not c!145047)) b!1567139))

(assert (= (and b!1567139 c!145048) b!1567138))

(assert (= (and b!1567139 (not c!145048)) b!1567140))

(assert (=> b!1567140 m!1442039))

(declare-fun m!1442059 () Bool)

(assert (=> b!1567140 m!1442059))

(declare-fun m!1442061 () Bool)

(assert (=> b!1567142 m!1442061))

(assert (=> d!163809 m!1442039))

(declare-fun m!1442063 () Bool)

(assert (=> d!163809 m!1442063))

(assert (=> d!163809 m!1442063))

(assert (=> d!163809 m!1442039))

(declare-fun m!1442065 () Bool)

(assert (=> d!163809 m!1442065))

(declare-fun m!1442067 () Bool)

(assert (=> d!163809 m!1442067))

(declare-fun m!1442069 () Bool)

(assert (=> d!163809 m!1442069))

(assert (=> d!163809 m!1441965))

(declare-fun m!1442071 () Bool)

(assert (=> d!163809 m!1442071))

(assert (=> b!1567096 d!163809))

(declare-fun d!163811 () Bool)

(declare-fun lt!672999 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!798 (List!36607) (InoxSet (_ BitVec 64)))

(assert (=> d!163811 (= lt!672999 (select (content!798 Nil!36604) (select (arr!50466 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun e!873623 () Bool)

(assert (=> d!163811 (= lt!672999 e!873623)))

(declare-fun res!1070543 () Bool)

(assert (=> d!163811 (=> (not res!1070543) (not e!873623))))

(assert (=> d!163811 (= res!1070543 ((_ is Cons!36603) Nil!36604))))

(assert (=> d!163811 (= (contains!10364 Nil!36604 (select (arr!50466 _keys!637) #b00000000000000000000000000000000)) lt!672999)))

(declare-fun b!1567148 () Bool)

(declare-fun e!873624 () Bool)

(assert (=> b!1567148 (= e!873623 e!873624)))

(declare-fun res!1070544 () Bool)

(assert (=> b!1567148 (=> res!1070544 e!873624)))

(assert (=> b!1567148 (= res!1070544 (= (h!38067 Nil!36604) (select (arr!50466 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1567149 () Bool)

(assert (=> b!1567149 (= e!873624 (contains!10364 (t!51446 Nil!36604) (select (arr!50466 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163811 res!1070543) b!1567148))

(assert (= (and b!1567148 (not res!1070544)) b!1567149))

(declare-fun m!1442073 () Bool)

(assert (=> d!163811 m!1442073))

(assert (=> d!163811 m!1442039))

(declare-fun m!1442075 () Bool)

(assert (=> d!163811 m!1442075))

(assert (=> b!1567149 m!1442039))

(declare-fun m!1442077 () Bool)

(assert (=> b!1567149 m!1442077))

(assert (=> b!1567111 d!163811))

(declare-fun d!163813 () Bool)

(assert (=> d!163813 (= (validKeyInArray!0 (select (arr!50466 _keys!637) #b00000000000000000000000000000000)) (and (not (= (select (arr!50466 _keys!637) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50466 _keys!637) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567095 d!163813))

(declare-fun b!1567150 () Bool)

(declare-fun e!873626 () Bool)

(declare-fun call!72007 () Bool)

(assert (=> b!1567150 (= e!873626 call!72007)))

(declare-fun d!163815 () Bool)

(declare-fun res!1070547 () Bool)

(declare-fun e!873625 () Bool)

(assert (=> d!163815 (=> res!1070547 e!873625)))

(assert (=> d!163815 (= res!1070547 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51017 _keys!637)))))

(assert (=> d!163815 (= (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!145040 (Cons!36603 (select (arr!50466 _keys!637) #b00000000000000000000000000000000) Nil!36604) Nil!36604)) e!873625)))

(declare-fun b!1567151 () Bool)

(declare-fun e!873627 () Bool)

(assert (=> b!1567151 (= e!873625 e!873627)))

(declare-fun res!1070546 () Bool)

(assert (=> b!1567151 (=> (not res!1070546) (not e!873627))))

(declare-fun e!873628 () Bool)

(assert (=> b!1567151 (= res!1070546 (not e!873628))))

(declare-fun res!1070545 () Bool)

(assert (=> b!1567151 (=> (not res!1070545) (not e!873628))))

(assert (=> b!1567151 (= res!1070545 (validKeyInArray!0 (select (arr!50466 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1567152 () Bool)

(assert (=> b!1567152 (= e!873627 e!873626)))

(declare-fun c!145050 () Bool)

(assert (=> b!1567152 (= c!145050 (validKeyInArray!0 (select (arr!50466 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1567153 () Bool)

(assert (=> b!1567153 (= e!873626 call!72007)))

(declare-fun bm!72004 () Bool)

(assert (=> bm!72004 (= call!72007 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!145050 (Cons!36603 (select (arr!50466 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!145040 (Cons!36603 (select (arr!50466 _keys!637) #b00000000000000000000000000000000) Nil!36604) Nil!36604)) (ite c!145040 (Cons!36603 (select (arr!50466 _keys!637) #b00000000000000000000000000000000) Nil!36604) Nil!36604))))))

(declare-fun b!1567154 () Bool)

(assert (=> b!1567154 (= e!873628 (contains!10364 (ite c!145040 (Cons!36603 (select (arr!50466 _keys!637) #b00000000000000000000000000000000) Nil!36604) Nil!36604) (select (arr!50466 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!163815 (not res!1070547)) b!1567151))

(assert (= (and b!1567151 res!1070545) b!1567154))

(assert (= (and b!1567151 res!1070546) b!1567152))

(assert (= (and b!1567152 c!145050) b!1567150))

(assert (= (and b!1567152 (not c!145050)) b!1567153))

(assert (= (or b!1567150 b!1567153) bm!72004))

(declare-fun m!1442079 () Bool)

(assert (=> b!1567151 m!1442079))

(assert (=> b!1567151 m!1442079))

(declare-fun m!1442081 () Bool)

(assert (=> b!1567151 m!1442081))

(assert (=> b!1567152 m!1442079))

(assert (=> b!1567152 m!1442079))

(assert (=> b!1567152 m!1442081))

(assert (=> bm!72004 m!1442079))

(declare-fun m!1442083 () Bool)

(assert (=> bm!72004 m!1442083))

(assert (=> b!1567154 m!1442079))

(assert (=> b!1567154 m!1442079))

(declare-fun m!1442085 () Bool)

(assert (=> b!1567154 m!1442085))

(assert (=> bm!72003 d!163815))

(declare-fun d!163817 () Bool)

(assert (=> d!163817 (= (isEmpty!1146 (toList!11360 (ListLongMap!22690 Nil!36603))) true)))

(assert (=> d!163795 d!163817))

(declare-fun d!163819 () Bool)

(assert (=> d!163819 (isDefined!577 (getValueByKey!786 (toList!11360 (ListLongMap!22690 Nil!36603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673002 () Unit!51895)

(declare-fun choose!2066 (List!36606 (_ BitVec 64)) Unit!51895)

(assert (=> d!163819 (= lt!673002 (choose!2066 (toList!11360 (ListLongMap!22690 Nil!36603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873631 () Bool)

(assert (=> d!163819 e!873631))

(declare-fun res!1070550 () Bool)

(assert (=> d!163819 (=> (not res!1070550) (not e!873631))))

(declare-fun isStrictlySorted!972 (List!36606) Bool)

(assert (=> d!163819 (= res!1070550 (isStrictlySorted!972 (toList!11360 (ListLongMap!22690 Nil!36603))))))

(assert (=> d!163819 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!531 (toList!11360 (ListLongMap!22690 Nil!36603)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!673002)))

(declare-fun b!1567157 () Bool)

(assert (=> b!1567157 (= e!873631 (containsKey!848 (toList!11360 (ListLongMap!22690 Nil!36603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163819 res!1070550) b!1567157))

(assert (=> d!163819 m!1442025))

(assert (=> d!163819 m!1442025))

(assert (=> d!163819 m!1442027))

(declare-fun m!1442087 () Bool)

(assert (=> d!163819 m!1442087))

(declare-fun m!1442089 () Bool)

(assert (=> d!163819 m!1442089))

(assert (=> b!1567157 m!1442021))

(assert (=> b!1567079 d!163819))

(declare-fun d!163821 () Bool)

(assert (=> d!163821 (= (isDefined!577 (getValueByKey!786 (toList!11360 (ListLongMap!22690 Nil!36603)) #b0000000000000000000000000000000000000000000000000000000000000000)) false)))

(assert (=> b!1567079 d!163821))

(declare-fun d!163823 () Bool)

(assert (=> d!163823 (= (getValueByKey!786 (toList!11360 (ListLongMap!22690 Nil!36603)) #b0000000000000000000000000000000000000000000000000000000000000000) None!859)))

(assert (=> b!1567079 d!163823))

(declare-fun d!163825 () Bool)

(assert (=> d!163825 (= (containsKey!848 (toList!11360 (ListLongMap!22690 Nil!36603)) #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> d!163799 d!163825))

(declare-fun d!163827 () Bool)

(assert (=> d!163827 (isDefined!577 (getValueByKey!786 (toList!11360 (ListLongMap!22690 Nil!36603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673003 () Unit!51895)

(assert (=> d!163827 (= lt!673003 (choose!2066 (toList!11360 (ListLongMap!22690 Nil!36603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!873632 () Bool)

(assert (=> d!163827 e!873632))

(declare-fun res!1070551 () Bool)

(assert (=> d!163827 (=> (not res!1070551) (not e!873632))))

(assert (=> d!163827 (= res!1070551 (isStrictlySorted!972 (toList!11360 (ListLongMap!22690 Nil!36603))))))

(assert (=> d!163827 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!531 (toList!11360 (ListLongMap!22690 Nil!36603)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!673003)))

(declare-fun b!1567158 () Bool)

(assert (=> b!1567158 (= e!873632 (containsKey!848 (toList!11360 (ListLongMap!22690 Nil!36603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163827 res!1070551) b!1567158))

(assert (=> d!163827 m!1442033))

(assert (=> d!163827 m!1442033))

(assert (=> d!163827 m!1442035))

(declare-fun m!1442091 () Bool)

(assert (=> d!163827 m!1442091))

(assert (=> d!163827 m!1442089))

(assert (=> b!1567158 m!1442029))

(assert (=> b!1567082 d!163827))

(declare-fun d!163829 () Bool)

(assert (=> d!163829 (= (isDefined!577 (getValueByKey!786 (toList!11360 (ListLongMap!22690 Nil!36603)) #b1000000000000000000000000000000000000000000000000000000000000000)) false)))

(assert (=> b!1567082 d!163829))

(declare-fun d!163831 () Bool)

(assert (=> d!163831 (= (getValueByKey!786 (toList!11360 (ListLongMap!22690 Nil!36603)) #b1000000000000000000000000000000000000000000000000000000000000000) None!859)))

(assert (=> b!1567082 d!163831))

(assert (=> b!1567084 d!163829))

(assert (=> b!1567084 d!163831))

(assert (=> b!1567081 d!163821))

(assert (=> b!1567081 d!163823))

(assert (=> b!1567108 d!163813))

(declare-fun d!163833 () Bool)

(assert (=> d!163833 (= (containsKey!848 (toList!11360 (ListLongMap!22690 Nil!36603)) #b0000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> d!163797 d!163833))

(declare-fun b!1567159 () Bool)

(declare-fun e!873634 () Bool)

(declare-fun call!72008 () Bool)

(assert (=> b!1567159 (= e!873634 call!72008)))

(declare-fun bm!72005 () Bool)

(assert (=> bm!72005 (= call!72008 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1567160 () Bool)

(declare-fun e!873633 () Bool)

(assert (=> b!1567160 (= e!873633 call!72008)))

(declare-fun b!1567161 () Bool)

(declare-fun e!873635 () Bool)

(assert (=> b!1567161 (= e!873635 e!873633)))

(declare-fun c!145051 () Bool)

(assert (=> b!1567161 (= c!145051 (validKeyInArray!0 (select (arr!50466 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!163835 () Bool)

(declare-fun res!1070552 () Bool)

(assert (=> d!163835 (=> res!1070552 e!873635)))

(assert (=> d!163835 (= res!1070552 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!51017 _keys!637)))))

(assert (=> d!163835 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947) e!873635)))

(declare-fun b!1567162 () Bool)

(assert (=> b!1567162 (= e!873633 e!873634)))

(declare-fun lt!673006 () (_ BitVec 64))

(assert (=> b!1567162 (= lt!673006 (select (arr!50466 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!673005 () Unit!51895)

(assert (=> b!1567162 (= lt!673005 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!673006 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1567162 (arrayContainsKey!0 _keys!637 lt!673006 #b00000000000000000000000000000000)))

(declare-fun lt!673004 () Unit!51895)

(assert (=> b!1567162 (= lt!673004 lt!673005)))

(declare-fun res!1070553 () Bool)

(assert (=> b!1567162 (= res!1070553 (= (seekEntryOrOpen!0 (select (arr!50466 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947) (Found!13470 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1567162 (=> (not res!1070553) (not e!873634))))

(assert (= (and d!163835 (not res!1070552)) b!1567161))

(assert (= (and b!1567161 c!145051) b!1567162))

(assert (= (and b!1567161 (not c!145051)) b!1567160))

(assert (= (and b!1567162 res!1070553) b!1567159))

(assert (= (or b!1567159 b!1567160) bm!72005))

(declare-fun m!1442093 () Bool)

(assert (=> bm!72005 m!1442093))

(assert (=> b!1567161 m!1442079))

(assert (=> b!1567161 m!1442079))

(assert (=> b!1567161 m!1442081))

(assert (=> b!1567162 m!1442079))

(declare-fun m!1442095 () Bool)

(assert (=> b!1567162 m!1442095))

(declare-fun m!1442097 () Bool)

(assert (=> b!1567162 m!1442097))

(assert (=> b!1567162 m!1442079))

(declare-fun m!1442099 () Bool)

(assert (=> b!1567162 m!1442099))

(assert (=> bm!72000 d!163835))

(assert (=> b!1567109 d!163813))

(declare-fun b!1567164 () Bool)

(declare-fun e!873637 () Bool)

(assert (=> b!1567164 (= e!873637 tp_is_empty!38875)))

(declare-fun condMapEmpty!59701 () Bool)

(declare-fun mapDefault!59701 () ValueCell!18407)

(assert (=> mapNonEmpty!59700 (= condMapEmpty!59701 (= mapRest!59700 ((as const (Array (_ BitVec 32) ValueCell!18407)) mapDefault!59701)))))

(declare-fun mapRes!59701 () Bool)

(assert (=> mapNonEmpty!59700 (= tp!113625 (and e!873637 mapRes!59701))))

(declare-fun mapIsEmpty!59701 () Bool)

(assert (=> mapIsEmpty!59701 mapRes!59701))

(declare-fun mapNonEmpty!59701 () Bool)

(declare-fun tp!113626 () Bool)

(declare-fun e!873636 () Bool)

(assert (=> mapNonEmpty!59701 (= mapRes!59701 (and tp!113626 e!873636))))

(declare-fun mapKey!59701 () (_ BitVec 32))

(declare-fun mapRest!59701 () (Array (_ BitVec 32) ValueCell!18407))

(declare-fun mapValue!59701 () ValueCell!18407)

(assert (=> mapNonEmpty!59701 (= mapRest!59700 (store mapRest!59701 mapKey!59701 mapValue!59701))))

(declare-fun b!1567163 () Bool)

(assert (=> b!1567163 (= e!873636 tp_is_empty!38875)))

(assert (= (and mapNonEmpty!59700 condMapEmpty!59701) mapIsEmpty!59701))

(assert (= (and mapNonEmpty!59700 (not condMapEmpty!59701)) mapNonEmpty!59701))

(assert (= (and mapNonEmpty!59701 ((_ is ValueCellFull!18407) mapValue!59701)) b!1567163))

(assert (= (and mapNonEmpty!59700 ((_ is ValueCellFull!18407) mapDefault!59701)) b!1567164))

(declare-fun m!1442101 () Bool)

(assert (=> mapNonEmpty!59701 m!1442101))

(check-sat (not d!163827) (not b!1567157) (not mapNonEmpty!59701) (not b!1567140) (not bm!72005) (not b!1567161) (not d!163809) (not d!163819) tp_is_empty!38875 (not b!1567162) (not b!1567152) (not d!163805) (not b!1567149) (not b!1567154) (not bm!72004) (not b!1567158) (not b!1567125) (not d!163811) (not b!1567151))
(check-sat)
