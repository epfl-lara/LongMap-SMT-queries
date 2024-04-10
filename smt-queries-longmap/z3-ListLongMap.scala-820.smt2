; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19996 () Bool)

(assert start!19996)

(declare-fun b!195962 () Bool)

(declare-fun e!128999 () Bool)

(declare-fun e!128997 () Bool)

(declare-fun mapRes!7862 () Bool)

(assert (=> b!195962 (= e!128999 (and e!128997 mapRes!7862))))

(declare-fun condMapEmpty!7862 () Bool)

(declare-datatypes ((V!5691 0))(
  ( (V!5692 (val!2311 Int)) )
))
(declare-datatypes ((ValueCell!1923 0))(
  ( (ValueCellFull!1923 (v!4280 V!5691)) (EmptyCell!1923) )
))
(declare-datatypes ((array!8325 0))(
  ( (array!8326 (arr!3915 (Array (_ BitVec 32) ValueCell!1923)) (size!4240 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8325)

(declare-fun mapDefault!7862 () ValueCell!1923)

(assert (=> b!195962 (= condMapEmpty!7862 (= (arr!3915 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1923)) mapDefault!7862)))))

(declare-fun mapIsEmpty!7862 () Bool)

(assert (=> mapIsEmpty!7862 mapRes!7862))

(declare-fun res!92460 () Bool)

(declare-fun e!129000 () Bool)

(assert (=> start!19996 (=> (not res!92460) (not e!129000))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19996 (= res!92460 (validMask!0 mask!1149))))

(assert (=> start!19996 e!129000))

(assert (=> start!19996 true))

(declare-fun array_inv!2543 (array!8325) Bool)

(assert (=> start!19996 (and (array_inv!2543 _values!649) e!128999)))

(declare-datatypes ((array!8327 0))(
  ( (array!8328 (arr!3916 (Array (_ BitVec 32) (_ BitVec 64))) (size!4241 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8327)

(declare-fun array_inv!2544 (array!8327) Bool)

(assert (=> start!19996 (array_inv!2544 _keys!825)))

(declare-fun b!195963 () Bool)

(declare-fun e!128996 () Bool)

(declare-fun tp_is_empty!4533 () Bool)

(assert (=> b!195963 (= e!128996 tp_is_empty!4533)))

(declare-fun b!195964 () Bool)

(declare-fun res!92462 () Bool)

(assert (=> b!195964 (=> (not res!92462) (not e!129000))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!195964 (= res!92462 (and (= (size!4240 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4241 _keys!825) (size!4240 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!195965 () Bool)

(declare-fun res!92461 () Bool)

(assert (=> b!195965 (=> (not res!92461) (not e!129000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8327 (_ BitVec 32)) Bool)

(assert (=> b!195965 (= res!92461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!195966 () Bool)

(declare-datatypes ((List!2456 0))(
  ( (Nil!2453) (Cons!2452 (h!3094 (_ BitVec 64)) (t!7387 List!2456)) )
))
(declare-fun noDuplicate!58 (List!2456) Bool)

(assert (=> b!195966 (= e!129000 (not (noDuplicate!58 Nil!2453)))))

(declare-fun b!195967 () Bool)

(assert (=> b!195967 (= e!128997 tp_is_empty!4533)))

(declare-fun mapNonEmpty!7862 () Bool)

(declare-fun tp!17150 () Bool)

(assert (=> mapNonEmpty!7862 (= mapRes!7862 (and tp!17150 e!128996))))

(declare-fun mapValue!7862 () ValueCell!1923)

(declare-fun mapRest!7862 () (Array (_ BitVec 32) ValueCell!1923))

(declare-fun mapKey!7862 () (_ BitVec 32))

(assert (=> mapNonEmpty!7862 (= (arr!3915 _values!649) (store mapRest!7862 mapKey!7862 mapValue!7862))))

(declare-fun b!195968 () Bool)

(declare-fun res!92459 () Bool)

(assert (=> b!195968 (=> (not res!92459) (not e!129000))))

(assert (=> b!195968 (= res!92459 (and (bvsle #b00000000000000000000000000000000 (size!4241 _keys!825)) (bvslt (size!4241 _keys!825) #b01111111111111111111111111111111)))))

(assert (= (and start!19996 res!92460) b!195964))

(assert (= (and b!195964 res!92462) b!195965))

(assert (= (and b!195965 res!92461) b!195968))

(assert (= (and b!195968 res!92459) b!195966))

(assert (= (and b!195962 condMapEmpty!7862) mapIsEmpty!7862))

(assert (= (and b!195962 (not condMapEmpty!7862)) mapNonEmpty!7862))

(get-info :version)

(assert (= (and mapNonEmpty!7862 ((_ is ValueCellFull!1923) mapValue!7862)) b!195963))

(assert (= (and b!195962 ((_ is ValueCellFull!1923) mapDefault!7862)) b!195967))

(assert (= start!19996 b!195962))

(declare-fun m!223401 () Bool)

(assert (=> start!19996 m!223401))

(declare-fun m!223403 () Bool)

(assert (=> start!19996 m!223403))

(declare-fun m!223405 () Bool)

(assert (=> start!19996 m!223405))

(declare-fun m!223407 () Bool)

(assert (=> b!195965 m!223407))

(declare-fun m!223409 () Bool)

(assert (=> b!195966 m!223409))

(declare-fun m!223411 () Bool)

(assert (=> mapNonEmpty!7862 m!223411))

(check-sat (not b!195965) tp_is_empty!4533 (not b!195966) (not start!19996) (not mapNonEmpty!7862))
(check-sat)
(get-model)

(declare-fun b!195998 () Bool)

(declare-fun e!129024 () Bool)

(declare-fun call!19773 () Bool)

(assert (=> b!195998 (= e!129024 call!19773)))

(declare-fun d!57553 () Bool)

(declare-fun res!92480 () Bool)

(declare-fun e!129022 () Bool)

(assert (=> d!57553 (=> res!92480 e!129022)))

(assert (=> d!57553 (= res!92480 (bvsge #b00000000000000000000000000000000 (size!4241 _keys!825)))))

(assert (=> d!57553 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!129022)))

(declare-fun b!195999 () Bool)

(declare-fun e!129023 () Bool)

(assert (=> b!195999 (= e!129023 e!129024)))

(declare-fun lt!97553 () (_ BitVec 64))

(assert (=> b!195999 (= lt!97553 (select (arr!3916 _keys!825) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5946 0))(
  ( (Unit!5947) )
))
(declare-fun lt!97551 () Unit!5946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8327 (_ BitVec 64) (_ BitVec 32)) Unit!5946)

(assert (=> b!195999 (= lt!97551 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!97553 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!195999 (arrayContainsKey!0 _keys!825 lt!97553 #b00000000000000000000000000000000)))

(declare-fun lt!97552 () Unit!5946)

(assert (=> b!195999 (= lt!97552 lt!97551)))

(declare-fun res!92479 () Bool)

(declare-datatypes ((SeekEntryResult!702 0))(
  ( (MissingZero!702 (index!4978 (_ BitVec 32))) (Found!702 (index!4979 (_ BitVec 32))) (Intermediate!702 (undefined!1514 Bool) (index!4980 (_ BitVec 32)) (x!20823 (_ BitVec 32))) (Undefined!702) (MissingVacant!702 (index!4981 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8327 (_ BitVec 32)) SeekEntryResult!702)

(assert (=> b!195999 (= res!92479 (= (seekEntryOrOpen!0 (select (arr!3916 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!702 #b00000000000000000000000000000000)))))

(assert (=> b!195999 (=> (not res!92479) (not e!129024))))

(declare-fun bm!19770 () Bool)

(assert (=> bm!19770 (= call!19773 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!196000 () Bool)

(assert (=> b!196000 (= e!129023 call!19773)))

(declare-fun b!196001 () Bool)

(assert (=> b!196001 (= e!129022 e!129023)))

(declare-fun c!35432 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196001 (= c!35432 (validKeyInArray!0 (select (arr!3916 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57553 (not res!92480)) b!196001))

(assert (= (and b!196001 c!35432) b!195999))

(assert (= (and b!196001 (not c!35432)) b!196000))

(assert (= (and b!195999 res!92479) b!195998))

(assert (= (or b!195998 b!196000) bm!19770))

(declare-fun m!223425 () Bool)

(assert (=> b!195999 m!223425))

(declare-fun m!223427 () Bool)

(assert (=> b!195999 m!223427))

(declare-fun m!223429 () Bool)

(assert (=> b!195999 m!223429))

(assert (=> b!195999 m!223425))

(declare-fun m!223431 () Bool)

(assert (=> b!195999 m!223431))

(declare-fun m!223433 () Bool)

(assert (=> bm!19770 m!223433))

(assert (=> b!196001 m!223425))

(assert (=> b!196001 m!223425))

(declare-fun m!223435 () Bool)

(assert (=> b!196001 m!223435))

(assert (=> b!195965 d!57553))

(declare-fun d!57555 () Bool)

(declare-fun res!92485 () Bool)

(declare-fun e!129029 () Bool)

(assert (=> d!57555 (=> res!92485 e!129029)))

(assert (=> d!57555 (= res!92485 ((_ is Nil!2453) Nil!2453))))

(assert (=> d!57555 (= (noDuplicate!58 Nil!2453) e!129029)))

(declare-fun b!196006 () Bool)

(declare-fun e!129030 () Bool)

(assert (=> b!196006 (= e!129029 e!129030)))

(declare-fun res!92486 () Bool)

(assert (=> b!196006 (=> (not res!92486) (not e!129030))))

(declare-fun contains!1385 (List!2456 (_ BitVec 64)) Bool)

(assert (=> b!196006 (= res!92486 (not (contains!1385 (t!7387 Nil!2453) (h!3094 Nil!2453))))))

(declare-fun b!196007 () Bool)

(assert (=> b!196007 (= e!129030 (noDuplicate!58 (t!7387 Nil!2453)))))

(assert (= (and d!57555 (not res!92485)) b!196006))

(assert (= (and b!196006 res!92486) b!196007))

(declare-fun m!223437 () Bool)

(assert (=> b!196006 m!223437))

(declare-fun m!223439 () Bool)

(assert (=> b!196007 m!223439))

(assert (=> b!195966 d!57555))

(declare-fun d!57557 () Bool)

(assert (=> d!57557 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!19996 d!57557))

(declare-fun d!57559 () Bool)

(assert (=> d!57559 (= (array_inv!2543 _values!649) (bvsge (size!4240 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!19996 d!57559))

(declare-fun d!57561 () Bool)

(assert (=> d!57561 (= (array_inv!2544 _keys!825) (bvsge (size!4241 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!19996 d!57561))

(declare-fun b!196014 () Bool)

(declare-fun e!129036 () Bool)

(assert (=> b!196014 (= e!129036 tp_is_empty!4533)))

(declare-fun condMapEmpty!7868 () Bool)

(declare-fun mapDefault!7868 () ValueCell!1923)

(assert (=> mapNonEmpty!7862 (= condMapEmpty!7868 (= mapRest!7862 ((as const (Array (_ BitVec 32) ValueCell!1923)) mapDefault!7868)))))

(declare-fun e!129035 () Bool)

(declare-fun mapRes!7868 () Bool)

(assert (=> mapNonEmpty!7862 (= tp!17150 (and e!129035 mapRes!7868))))

(declare-fun b!196015 () Bool)

(assert (=> b!196015 (= e!129035 tp_is_empty!4533)))

(declare-fun mapNonEmpty!7868 () Bool)

(declare-fun tp!17156 () Bool)

(assert (=> mapNonEmpty!7868 (= mapRes!7868 (and tp!17156 e!129036))))

(declare-fun mapKey!7868 () (_ BitVec 32))

(declare-fun mapValue!7868 () ValueCell!1923)

(declare-fun mapRest!7868 () (Array (_ BitVec 32) ValueCell!1923))

(assert (=> mapNonEmpty!7868 (= mapRest!7862 (store mapRest!7868 mapKey!7868 mapValue!7868))))

(declare-fun mapIsEmpty!7868 () Bool)

(assert (=> mapIsEmpty!7868 mapRes!7868))

(assert (= (and mapNonEmpty!7862 condMapEmpty!7868) mapIsEmpty!7868))

(assert (= (and mapNonEmpty!7862 (not condMapEmpty!7868)) mapNonEmpty!7868))

(assert (= (and mapNonEmpty!7868 ((_ is ValueCellFull!1923) mapValue!7868)) b!196014))

(assert (= (and mapNonEmpty!7862 ((_ is ValueCellFull!1923) mapDefault!7868)) b!196015))

(declare-fun m!223441 () Bool)

(assert (=> mapNonEmpty!7868 m!223441))

(check-sat (not b!196006) (not bm!19770) tp_is_empty!4533 (not b!195999) (not mapNonEmpty!7868) (not b!196007) (not b!196001))
(check-sat)
