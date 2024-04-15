; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35304 () Bool)

(assert start!35304)

(declare-fun b!353481 () Bool)

(declare-fun e!216521 () Bool)

(declare-fun e!216520 () Bool)

(declare-fun mapRes!13194 () Bool)

(assert (=> b!353481 (= e!216521 (and e!216520 mapRes!13194))))

(declare-fun condMapEmpty!13194 () Bool)

(declare-datatypes ((V!11371 0))(
  ( (V!11372 (val!3942 Int)) )
))
(declare-datatypes ((ValueCell!3554 0))(
  ( (ValueCellFull!3554 (v!6129 V!11371)) (EmptyCell!3554) )
))
(declare-datatypes ((array!19163 0))(
  ( (array!19164 (arr!9077 (Array (_ BitVec 32) ValueCell!3554)) (size!9430 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19163)

(declare-fun mapDefault!13194 () ValueCell!3554)

(assert (=> b!353481 (= condMapEmpty!13194 (= (arr!9077 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3554)) mapDefault!13194)))))

(declare-fun b!353482 () Bool)

(declare-fun e!216518 () Bool)

(declare-fun e!216519 () Bool)

(assert (=> b!353482 (= e!216518 e!216519)))

(declare-fun res!195991 () Bool)

(assert (=> b!353482 (=> res!195991 e!216519)))

(declare-datatypes ((List!5248 0))(
  ( (Nil!5245) (Cons!5244 (h!6100 (_ BitVec 64)) (t!10389 List!5248)) )
))
(declare-fun contains!2371 (List!5248 (_ BitVec 64)) Bool)

(assert (=> b!353482 (= res!195991 (contains!2371 Nil!5245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353483 () Bool)

(declare-fun res!195987 () Bool)

(assert (=> b!353483 (=> (not res!195987) (not e!216518))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19165 0))(
  ( (array!19166 (arr!9078 (Array (_ BitVec 32) (_ BitVec 64))) (size!9431 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19165)

(assert (=> b!353483 (= res!195987 (and (= (size!9430 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9431 _keys!1456) (size!9430 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353484 () Bool)

(assert (=> b!353484 (= e!216519 (contains!2371 Nil!5245 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!13194 () Bool)

(declare-fun tp!27090 () Bool)

(declare-fun e!216523 () Bool)

(assert (=> mapNonEmpty!13194 (= mapRes!13194 (and tp!27090 e!216523))))

(declare-fun mapRest!13194 () (Array (_ BitVec 32) ValueCell!3554))

(declare-fun mapValue!13194 () ValueCell!3554)

(declare-fun mapKey!13194 () (_ BitVec 32))

(assert (=> mapNonEmpty!13194 (= (arr!9077 _values!1208) (store mapRest!13194 mapKey!13194 mapValue!13194))))

(declare-fun b!353485 () Bool)

(declare-fun tp_is_empty!7795 () Bool)

(assert (=> b!353485 (= e!216520 tp_is_empty!7795)))

(declare-fun mapIsEmpty!13194 () Bool)

(assert (=> mapIsEmpty!13194 mapRes!13194))

(declare-fun b!353486 () Bool)

(assert (=> b!353486 (= e!216523 tp_is_empty!7795)))

(declare-fun b!353487 () Bool)

(declare-fun res!195990 () Bool)

(assert (=> b!353487 (=> (not res!195990) (not e!216518))))

(declare-fun noDuplicate!179 (List!5248) Bool)

(assert (=> b!353487 (= res!195990 (noDuplicate!179 Nil!5245))))

(declare-fun res!195989 () Bool)

(assert (=> start!35304 (=> (not res!195989) (not e!216518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35304 (= res!195989 (validMask!0 mask!1842))))

(assert (=> start!35304 e!216518))

(assert (=> start!35304 true))

(declare-fun array_inv!6718 (array!19163) Bool)

(assert (=> start!35304 (and (array_inv!6718 _values!1208) e!216521)))

(declare-fun array_inv!6719 (array!19165) Bool)

(assert (=> start!35304 (array_inv!6719 _keys!1456)))

(declare-fun b!353488 () Bool)

(declare-fun res!195988 () Bool)

(assert (=> b!353488 (=> (not res!195988) (not e!216518))))

(assert (=> b!353488 (= res!195988 (and (bvsle #b00000000000000000000000000000000 (size!9431 _keys!1456)) (bvslt (size!9431 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!353489 () Bool)

(declare-fun res!195992 () Bool)

(assert (=> b!353489 (=> (not res!195992) (not e!216518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19165 (_ BitVec 32)) Bool)

(assert (=> b!353489 (= res!195992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35304 res!195989) b!353483))

(assert (= (and b!353483 res!195987) b!353489))

(assert (= (and b!353489 res!195992) b!353488))

(assert (= (and b!353488 res!195988) b!353487))

(assert (= (and b!353487 res!195990) b!353482))

(assert (= (and b!353482 (not res!195991)) b!353484))

(assert (= (and b!353481 condMapEmpty!13194) mapIsEmpty!13194))

(assert (= (and b!353481 (not condMapEmpty!13194)) mapNonEmpty!13194))

(get-info :version)

(assert (= (and mapNonEmpty!13194 ((_ is ValueCellFull!3554) mapValue!13194)) b!353486))

(assert (= (and b!353481 ((_ is ValueCellFull!3554) mapDefault!13194)) b!353485))

(assert (= start!35304 b!353481))

(declare-fun m!352277 () Bool)

(assert (=> b!353487 m!352277))

(declare-fun m!352279 () Bool)

(assert (=> b!353482 m!352279))

(declare-fun m!352281 () Bool)

(assert (=> b!353489 m!352281))

(declare-fun m!352283 () Bool)

(assert (=> start!35304 m!352283))

(declare-fun m!352285 () Bool)

(assert (=> start!35304 m!352285))

(declare-fun m!352287 () Bool)

(assert (=> start!35304 m!352287))

(declare-fun m!352289 () Bool)

(assert (=> mapNonEmpty!13194 m!352289))

(declare-fun m!352291 () Bool)

(assert (=> b!353484 m!352291))

(check-sat tp_is_empty!7795 (not mapNonEmpty!13194) (not b!353484) (not b!353482) (not b!353487) (not b!353489) (not start!35304))
(check-sat)
(get-model)

(declare-fun d!71447 () Bool)

(declare-fun lt!165369 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!198 (List!5248) (InoxSet (_ BitVec 64)))

(assert (=> d!71447 (= lt!165369 (select (content!198 Nil!5245) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!216565 () Bool)

(assert (=> d!71447 (= lt!165369 e!216565)))

(declare-fun res!196034 () Bool)

(assert (=> d!71447 (=> (not res!196034) (not e!216565))))

(assert (=> d!71447 (= res!196034 ((_ is Cons!5244) Nil!5245))))

(assert (=> d!71447 (= (contains!2371 Nil!5245 #b0000000000000000000000000000000000000000000000000000000000000000) lt!165369)))

(declare-fun b!353548 () Bool)

(declare-fun e!216564 () Bool)

(assert (=> b!353548 (= e!216565 e!216564)))

(declare-fun res!196033 () Bool)

(assert (=> b!353548 (=> res!196033 e!216564)))

(assert (=> b!353548 (= res!196033 (= (h!6100 Nil!5245) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353549 () Bool)

(assert (=> b!353549 (= e!216564 (contains!2371 (t!10389 Nil!5245) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71447 res!196034) b!353548))

(assert (= (and b!353548 (not res!196033)) b!353549))

(declare-fun m!352325 () Bool)

(assert (=> d!71447 m!352325))

(declare-fun m!352327 () Bool)

(assert (=> d!71447 m!352327))

(declare-fun m!352329 () Bool)

(assert (=> b!353549 m!352329))

(assert (=> b!353482 d!71447))

(declare-fun d!71449 () Bool)

(declare-fun res!196039 () Bool)

(declare-fun e!216570 () Bool)

(assert (=> d!71449 (=> res!196039 e!216570)))

(assert (=> d!71449 (= res!196039 ((_ is Nil!5245) Nil!5245))))

(assert (=> d!71449 (= (noDuplicate!179 Nil!5245) e!216570)))

(declare-fun b!353554 () Bool)

(declare-fun e!216571 () Bool)

(assert (=> b!353554 (= e!216570 e!216571)))

(declare-fun res!196040 () Bool)

(assert (=> b!353554 (=> (not res!196040) (not e!216571))))

(assert (=> b!353554 (= res!196040 (not (contains!2371 (t!10389 Nil!5245) (h!6100 Nil!5245))))))

(declare-fun b!353555 () Bool)

(assert (=> b!353555 (= e!216571 (noDuplicate!179 (t!10389 Nil!5245)))))

(assert (= (and d!71449 (not res!196039)) b!353554))

(assert (= (and b!353554 res!196040) b!353555))

(declare-fun m!352331 () Bool)

(assert (=> b!353554 m!352331))

(declare-fun m!352333 () Bool)

(assert (=> b!353555 m!352333))

(assert (=> b!353487 d!71449))

(declare-fun d!71451 () Bool)

(assert (=> d!71451 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35304 d!71451))

(declare-fun d!71453 () Bool)

(assert (=> d!71453 (= (array_inv!6718 _values!1208) (bvsge (size!9430 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35304 d!71453))

(declare-fun d!71455 () Bool)

(assert (=> d!71455 (= (array_inv!6719 _keys!1456) (bvsge (size!9431 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35304 d!71455))

(declare-fun d!71457 () Bool)

(declare-fun lt!165370 () Bool)

(assert (=> d!71457 (= lt!165370 (select (content!198 Nil!5245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!216573 () Bool)

(assert (=> d!71457 (= lt!165370 e!216573)))

(declare-fun res!196042 () Bool)

(assert (=> d!71457 (=> (not res!196042) (not e!216573))))

(assert (=> d!71457 (= res!196042 ((_ is Cons!5244) Nil!5245))))

(assert (=> d!71457 (= (contains!2371 Nil!5245 #b1000000000000000000000000000000000000000000000000000000000000000) lt!165370)))

(declare-fun b!353556 () Bool)

(declare-fun e!216572 () Bool)

(assert (=> b!353556 (= e!216573 e!216572)))

(declare-fun res!196041 () Bool)

(assert (=> b!353556 (=> res!196041 e!216572)))

(assert (=> b!353556 (= res!196041 (= (h!6100 Nil!5245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353557 () Bool)

(assert (=> b!353557 (= e!216572 (contains!2371 (t!10389 Nil!5245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71457 res!196042) b!353556))

(assert (= (and b!353556 (not res!196041)) b!353557))

(assert (=> d!71457 m!352325))

(declare-fun m!352335 () Bool)

(assert (=> d!71457 m!352335))

(declare-fun m!352337 () Bool)

(assert (=> b!353557 m!352337))

(assert (=> b!353484 d!71457))

(declare-fun bm!27125 () Bool)

(declare-fun call!27128 () Bool)

(assert (=> bm!27125 (= call!27128 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!353567 () Bool)

(declare-fun e!216581 () Bool)

(declare-fun e!216582 () Bool)

(assert (=> b!353567 (= e!216581 e!216582)))

(declare-fun lt!165378 () (_ BitVec 64))

(assert (=> b!353567 (= lt!165378 (select (arr!9078 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10910 0))(
  ( (Unit!10911) )
))
(declare-fun lt!165377 () Unit!10910)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19165 (_ BitVec 64) (_ BitVec 32)) Unit!10910)

(assert (=> b!353567 (= lt!165377 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165378 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353567 (arrayContainsKey!0 _keys!1456 lt!165378 #b00000000000000000000000000000000)))

(declare-fun lt!165379 () Unit!10910)

(assert (=> b!353567 (= lt!165379 lt!165377)))

(declare-fun res!196047 () Bool)

(declare-datatypes ((SeekEntryResult!3484 0))(
  ( (MissingZero!3484 (index!16115 (_ BitVec 32))) (Found!3484 (index!16116 (_ BitVec 32))) (Intermediate!3484 (undefined!4296 Bool) (index!16117 (_ BitVec 32)) (x!35213 (_ BitVec 32))) (Undefined!3484) (MissingVacant!3484 (index!16118 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19165 (_ BitVec 32)) SeekEntryResult!3484)

(assert (=> b!353567 (= res!196047 (= (seekEntryOrOpen!0 (select (arr!9078 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3484 #b00000000000000000000000000000000)))))

(assert (=> b!353567 (=> (not res!196047) (not e!216582))))

(declare-fun b!353568 () Bool)

(declare-fun e!216580 () Bool)

(assert (=> b!353568 (= e!216580 e!216581)))

(declare-fun c!53630 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353568 (= c!53630 (validKeyInArray!0 (select (arr!9078 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353569 () Bool)

(assert (=> b!353569 (= e!216581 call!27128)))

(declare-fun d!71459 () Bool)

(declare-fun res!196048 () Bool)

(assert (=> d!71459 (=> res!196048 e!216580)))

(assert (=> d!71459 (= res!196048 (bvsge #b00000000000000000000000000000000 (size!9431 _keys!1456)))))

(assert (=> d!71459 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216580)))

(declare-fun b!353566 () Bool)

(assert (=> b!353566 (= e!216582 call!27128)))

(assert (= (and d!71459 (not res!196048)) b!353568))

(assert (= (and b!353568 c!53630) b!353567))

(assert (= (and b!353568 (not c!53630)) b!353569))

(assert (= (and b!353567 res!196047) b!353566))

(assert (= (or b!353566 b!353569) bm!27125))

(declare-fun m!352339 () Bool)

(assert (=> bm!27125 m!352339))

(declare-fun m!352341 () Bool)

(assert (=> b!353567 m!352341))

(declare-fun m!352343 () Bool)

(assert (=> b!353567 m!352343))

(declare-fun m!352345 () Bool)

(assert (=> b!353567 m!352345))

(assert (=> b!353567 m!352341))

(declare-fun m!352347 () Bool)

(assert (=> b!353567 m!352347))

(assert (=> b!353568 m!352341))

(assert (=> b!353568 m!352341))

(declare-fun m!352349 () Bool)

(assert (=> b!353568 m!352349))

(assert (=> b!353489 d!71459))

(declare-fun b!353577 () Bool)

(declare-fun e!216587 () Bool)

(assert (=> b!353577 (= e!216587 tp_is_empty!7795)))

(declare-fun mapIsEmpty!13203 () Bool)

(declare-fun mapRes!13203 () Bool)

(assert (=> mapIsEmpty!13203 mapRes!13203))

(declare-fun mapNonEmpty!13203 () Bool)

(declare-fun tp!27099 () Bool)

(declare-fun e!216588 () Bool)

(assert (=> mapNonEmpty!13203 (= mapRes!13203 (and tp!27099 e!216588))))

(declare-fun mapRest!13203 () (Array (_ BitVec 32) ValueCell!3554))

(declare-fun mapKey!13203 () (_ BitVec 32))

(declare-fun mapValue!13203 () ValueCell!3554)

(assert (=> mapNonEmpty!13203 (= mapRest!13194 (store mapRest!13203 mapKey!13203 mapValue!13203))))

(declare-fun b!353576 () Bool)

(assert (=> b!353576 (= e!216588 tp_is_empty!7795)))

(declare-fun condMapEmpty!13203 () Bool)

(declare-fun mapDefault!13203 () ValueCell!3554)

(assert (=> mapNonEmpty!13194 (= condMapEmpty!13203 (= mapRest!13194 ((as const (Array (_ BitVec 32) ValueCell!3554)) mapDefault!13203)))))

(assert (=> mapNonEmpty!13194 (= tp!27090 (and e!216587 mapRes!13203))))

(assert (= (and mapNonEmpty!13194 condMapEmpty!13203) mapIsEmpty!13203))

(assert (= (and mapNonEmpty!13194 (not condMapEmpty!13203)) mapNonEmpty!13203))

(assert (= (and mapNonEmpty!13203 ((_ is ValueCellFull!3554) mapValue!13203)) b!353576))

(assert (= (and mapNonEmpty!13194 ((_ is ValueCellFull!3554) mapDefault!13203)) b!353577))

(declare-fun m!352351 () Bool)

(assert (=> mapNonEmpty!13203 m!352351))

(check-sat (not b!353555) (not b!353568) (not mapNonEmpty!13203) (not b!353549) tp_is_empty!7795 (not bm!27125) (not d!71447) (not b!353554) (not d!71457) (not b!353557) (not b!353567))
(check-sat)
