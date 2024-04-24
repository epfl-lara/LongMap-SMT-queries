; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77594 () Bool)

(assert start!77594)

(declare-fun mapIsEmpty!29383 () Bool)

(declare-fun mapRes!29383 () Bool)

(assert (=> mapIsEmpty!29383 mapRes!29383))

(declare-fun b!903372 () Bool)

(declare-fun res!609362 () Bool)

(declare-fun e!506019 () Bool)

(assert (=> b!903372 (=> (not res!609362) (not e!506019))))

(declare-datatypes ((V!29567 0))(
  ( (V!29568 (val!9276 Int)) )
))
(declare-datatypes ((ValueCell!8744 0))(
  ( (ValueCellFull!8744 (v!11777 V!29567)) (EmptyCell!8744) )
))
(declare-datatypes ((array!52999 0))(
  ( (array!53000 (arr!25456 (Array (_ BitVec 32) ValueCell!8744)) (size!25916 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52999)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53001 0))(
  ( (array!53002 (arr!25457 (Array (_ BitVec 32) (_ BitVec 64))) (size!25917 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53001)

(assert (=> b!903372 (= res!609362 (and (= (size!25916 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25917 _keys!1386) (size!25916 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903373 () Bool)

(declare-fun res!609363 () Bool)

(assert (=> b!903373 (=> (not res!609363) (not e!506019))))

(assert (=> b!903373 (= res!609363 (and (bvsle #b00000000000000000000000000000000 (size!25917 _keys!1386)) (bvslt (size!25917 _keys!1386) #b01111111111111111111111111111111)))))

(declare-fun b!903374 () Bool)

(declare-fun e!506016 () Bool)

(declare-fun e!506017 () Bool)

(assert (=> b!903374 (= e!506016 (and e!506017 mapRes!29383))))

(declare-fun condMapEmpty!29383 () Bool)

(declare-fun mapDefault!29383 () ValueCell!8744)

(assert (=> b!903374 (= condMapEmpty!29383 (= (arr!25456 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8744)) mapDefault!29383)))))

(declare-fun res!609361 () Bool)

(assert (=> start!77594 (=> (not res!609361) (not e!506019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77594 (= res!609361 (validMask!0 mask!1756))))

(assert (=> start!77594 e!506019))

(assert (=> start!77594 true))

(declare-fun array_inv!20020 (array!52999) Bool)

(assert (=> start!77594 (and (array_inv!20020 _values!1152) e!506016)))

(declare-fun array_inv!20021 (array!53001) Bool)

(assert (=> start!77594 (array_inv!20021 _keys!1386)))

(declare-fun b!903375 () Bool)

(declare-fun e!506015 () Bool)

(assert (=> b!903375 (= e!506019 e!506015)))

(declare-fun res!609364 () Bool)

(assert (=> b!903375 (=> res!609364 e!506015)))

(declare-datatypes ((List!17840 0))(
  ( (Nil!17837) (Cons!17836 (h!18988 (_ BitVec 64)) (t!25215 List!17840)) )
))
(declare-fun contains!4424 (List!17840 (_ BitVec 64)) Bool)

(assert (=> b!903375 (= res!609364 (contains!4424 Nil!17837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!903376 () Bool)

(declare-fun res!609360 () Bool)

(assert (=> b!903376 (=> (not res!609360) (not e!506019))))

(declare-fun noDuplicate!1330 (List!17840) Bool)

(assert (=> b!903376 (= res!609360 (noDuplicate!1330 Nil!17837))))

(declare-fun b!903377 () Bool)

(declare-fun res!609365 () Bool)

(assert (=> b!903377 (=> (not res!609365) (not e!506019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53001 (_ BitVec 32)) Bool)

(assert (=> b!903377 (= res!609365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903378 () Bool)

(declare-fun e!506018 () Bool)

(declare-fun tp_is_empty!18451 () Bool)

(assert (=> b!903378 (= e!506018 tp_is_empty!18451)))

(declare-fun mapNonEmpty!29383 () Bool)

(declare-fun tp!56443 () Bool)

(assert (=> mapNonEmpty!29383 (= mapRes!29383 (and tp!56443 e!506018))))

(declare-fun mapValue!29383 () ValueCell!8744)

(declare-fun mapKey!29383 () (_ BitVec 32))

(declare-fun mapRest!29383 () (Array (_ BitVec 32) ValueCell!8744))

(assert (=> mapNonEmpty!29383 (= (arr!25456 _values!1152) (store mapRest!29383 mapKey!29383 mapValue!29383))))

(declare-fun b!903379 () Bool)

(assert (=> b!903379 (= e!506017 tp_is_empty!18451)))

(declare-fun b!903380 () Bool)

(assert (=> b!903380 (= e!506015 (contains!4424 Nil!17837 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!77594 res!609361) b!903372))

(assert (= (and b!903372 res!609362) b!903377))

(assert (= (and b!903377 res!609365) b!903373))

(assert (= (and b!903373 res!609363) b!903376))

(assert (= (and b!903376 res!609360) b!903375))

(assert (= (and b!903375 (not res!609364)) b!903380))

(assert (= (and b!903374 condMapEmpty!29383) mapIsEmpty!29383))

(assert (= (and b!903374 (not condMapEmpty!29383)) mapNonEmpty!29383))

(get-info :version)

(assert (= (and mapNonEmpty!29383 ((_ is ValueCellFull!8744) mapValue!29383)) b!903378))

(assert (= (and b!903374 ((_ is ValueCellFull!8744) mapDefault!29383)) b!903379))

(assert (= start!77594 b!903374))

(declare-fun m!839749 () Bool)

(assert (=> b!903375 m!839749))

(declare-fun m!839751 () Bool)

(assert (=> start!77594 m!839751))

(declare-fun m!839753 () Bool)

(assert (=> start!77594 m!839753))

(declare-fun m!839755 () Bool)

(assert (=> start!77594 m!839755))

(declare-fun m!839757 () Bool)

(assert (=> b!903376 m!839757))

(declare-fun m!839759 () Bool)

(assert (=> mapNonEmpty!29383 m!839759))

(declare-fun m!839761 () Bool)

(assert (=> b!903380 m!839761))

(declare-fun m!839763 () Bool)

(assert (=> b!903377 m!839763))

(check-sat tp_is_empty!18451 (not b!903380) (not b!903375) (not b!903377) (not b!903376) (not start!77594) (not mapNonEmpty!29383))
(check-sat)
(get-model)

(declare-fun d!112283 () Bool)

(declare-fun res!609406 () Bool)

(declare-fun e!506061 () Bool)

(assert (=> d!112283 (=> res!609406 e!506061)))

(assert (=> d!112283 (= res!609406 ((_ is Nil!17837) Nil!17837))))

(assert (=> d!112283 (= (noDuplicate!1330 Nil!17837) e!506061)))

(declare-fun b!903439 () Bool)

(declare-fun e!506062 () Bool)

(assert (=> b!903439 (= e!506061 e!506062)))

(declare-fun res!609407 () Bool)

(assert (=> b!903439 (=> (not res!609407) (not e!506062))))

(assert (=> b!903439 (= res!609407 (not (contains!4424 (t!25215 Nil!17837) (h!18988 Nil!17837))))))

(declare-fun b!903440 () Bool)

(assert (=> b!903440 (= e!506062 (noDuplicate!1330 (t!25215 Nil!17837)))))

(assert (= (and d!112283 (not res!609406)) b!903439))

(assert (= (and b!903439 res!609407) b!903440))

(declare-fun m!839797 () Bool)

(assert (=> b!903439 m!839797))

(declare-fun m!839799 () Bool)

(assert (=> b!903440 m!839799))

(assert (=> b!903376 d!112283))

(declare-fun bm!40288 () Bool)

(declare-fun call!40291 () Bool)

(assert (=> bm!40288 (= call!40291 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun d!112285 () Bool)

(declare-fun res!609412 () Bool)

(declare-fun e!506071 () Bool)

(assert (=> d!112285 (=> res!609412 e!506071)))

(assert (=> d!112285 (= res!609412 (bvsge #b00000000000000000000000000000000 (size!25917 _keys!1386)))))

(assert (=> d!112285 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!506071)))

(declare-fun b!903449 () Bool)

(declare-fun e!506070 () Bool)

(assert (=> b!903449 (= e!506071 e!506070)))

(declare-fun c!95924 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!903449 (= c!95924 (validKeyInArray!0 (select (arr!25457 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!903450 () Bool)

(declare-fun e!506069 () Bool)

(assert (=> b!903450 (= e!506069 call!40291)))

(declare-fun b!903451 () Bool)

(assert (=> b!903451 (= e!506070 e!506069)))

(declare-fun lt!408234 () (_ BitVec 64))

(assert (=> b!903451 (= lt!408234 (select (arr!25457 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30642 0))(
  ( (Unit!30643) )
))
(declare-fun lt!408232 () Unit!30642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53001 (_ BitVec 64) (_ BitVec 32)) Unit!30642)

(assert (=> b!903451 (= lt!408232 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!408234 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!53001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903451 (arrayContainsKey!0 _keys!1386 lt!408234 #b00000000000000000000000000000000)))

(declare-fun lt!408233 () Unit!30642)

(assert (=> b!903451 (= lt!408233 lt!408232)))

(declare-fun res!609413 () Bool)

(declare-datatypes ((SeekEntryResult!8915 0))(
  ( (MissingZero!8915 (index!38031 (_ BitVec 32))) (Found!8915 (index!38032 (_ BitVec 32))) (Intermediate!8915 (undefined!9727 Bool) (index!38033 (_ BitVec 32)) (x!76900 (_ BitVec 32))) (Undefined!8915) (MissingVacant!8915 (index!38034 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53001 (_ BitVec 32)) SeekEntryResult!8915)

(assert (=> b!903451 (= res!609413 (= (seekEntryOrOpen!0 (select (arr!25457 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8915 #b00000000000000000000000000000000)))))

(assert (=> b!903451 (=> (not res!609413) (not e!506069))))

(declare-fun b!903452 () Bool)

(assert (=> b!903452 (= e!506070 call!40291)))

(assert (= (and d!112285 (not res!609412)) b!903449))

(assert (= (and b!903449 c!95924) b!903451))

(assert (= (and b!903449 (not c!95924)) b!903452))

(assert (= (and b!903451 res!609413) b!903450))

(assert (= (or b!903450 b!903452) bm!40288))

(declare-fun m!839801 () Bool)

(assert (=> bm!40288 m!839801))

(declare-fun m!839803 () Bool)

(assert (=> b!903449 m!839803))

(assert (=> b!903449 m!839803))

(declare-fun m!839805 () Bool)

(assert (=> b!903449 m!839805))

(assert (=> b!903451 m!839803))

(declare-fun m!839807 () Bool)

(assert (=> b!903451 m!839807))

(declare-fun m!839809 () Bool)

(assert (=> b!903451 m!839809))

(assert (=> b!903451 m!839803))

(declare-fun m!839811 () Bool)

(assert (=> b!903451 m!839811))

(assert (=> b!903377 d!112285))

(declare-fun d!112287 () Bool)

(declare-fun lt!408237 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!402 (List!17840) (InoxSet (_ BitVec 64)))

(assert (=> d!112287 (= lt!408237 (select (content!402 Nil!17837) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!506076 () Bool)

(assert (=> d!112287 (= lt!408237 e!506076)))

(declare-fun res!609418 () Bool)

(assert (=> d!112287 (=> (not res!609418) (not e!506076))))

(assert (=> d!112287 (= res!609418 ((_ is Cons!17836) Nil!17837))))

(assert (=> d!112287 (= (contains!4424 Nil!17837 #b0000000000000000000000000000000000000000000000000000000000000000) lt!408237)))

(declare-fun b!903457 () Bool)

(declare-fun e!506077 () Bool)

(assert (=> b!903457 (= e!506076 e!506077)))

(declare-fun res!609419 () Bool)

(assert (=> b!903457 (=> res!609419 e!506077)))

(assert (=> b!903457 (= res!609419 (= (h!18988 Nil!17837) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!903458 () Bool)

(assert (=> b!903458 (= e!506077 (contains!4424 (t!25215 Nil!17837) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!112287 res!609418) b!903457))

(assert (= (and b!903457 (not res!609419)) b!903458))

(declare-fun m!839813 () Bool)

(assert (=> d!112287 m!839813))

(declare-fun m!839815 () Bool)

(assert (=> d!112287 m!839815))

(declare-fun m!839817 () Bool)

(assert (=> b!903458 m!839817))

(assert (=> b!903375 d!112287))

(declare-fun d!112289 () Bool)

(declare-fun lt!408238 () Bool)

(assert (=> d!112289 (= lt!408238 (select (content!402 Nil!17837) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!506078 () Bool)

(assert (=> d!112289 (= lt!408238 e!506078)))

(declare-fun res!609420 () Bool)

(assert (=> d!112289 (=> (not res!609420) (not e!506078))))

(assert (=> d!112289 (= res!609420 ((_ is Cons!17836) Nil!17837))))

(assert (=> d!112289 (= (contains!4424 Nil!17837 #b1000000000000000000000000000000000000000000000000000000000000000) lt!408238)))

(declare-fun b!903459 () Bool)

(declare-fun e!506079 () Bool)

(assert (=> b!903459 (= e!506078 e!506079)))

(declare-fun res!609421 () Bool)

(assert (=> b!903459 (=> res!609421 e!506079)))

(assert (=> b!903459 (= res!609421 (= (h!18988 Nil!17837) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!903460 () Bool)

(assert (=> b!903460 (= e!506079 (contains!4424 (t!25215 Nil!17837) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!112289 res!609420) b!903459))

(assert (= (and b!903459 (not res!609421)) b!903460))

(assert (=> d!112289 m!839813))

(declare-fun m!839819 () Bool)

(assert (=> d!112289 m!839819))

(declare-fun m!839821 () Bool)

(assert (=> b!903460 m!839821))

(assert (=> b!903380 d!112289))

(declare-fun d!112291 () Bool)

(assert (=> d!112291 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77594 d!112291))

(declare-fun d!112293 () Bool)

(assert (=> d!112293 (= (array_inv!20020 _values!1152) (bvsge (size!25916 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77594 d!112293))

(declare-fun d!112295 () Bool)

(assert (=> d!112295 (= (array_inv!20021 _keys!1386) (bvsge (size!25917 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77594 d!112295))

(declare-fun b!903468 () Bool)

(declare-fun e!506085 () Bool)

(assert (=> b!903468 (= e!506085 tp_is_empty!18451)))

(declare-fun mapIsEmpty!29392 () Bool)

(declare-fun mapRes!29392 () Bool)

(assert (=> mapIsEmpty!29392 mapRes!29392))

(declare-fun mapNonEmpty!29392 () Bool)

(declare-fun tp!56452 () Bool)

(declare-fun e!506084 () Bool)

(assert (=> mapNonEmpty!29392 (= mapRes!29392 (and tp!56452 e!506084))))

(declare-fun mapValue!29392 () ValueCell!8744)

(declare-fun mapRest!29392 () (Array (_ BitVec 32) ValueCell!8744))

(declare-fun mapKey!29392 () (_ BitVec 32))

(assert (=> mapNonEmpty!29392 (= mapRest!29383 (store mapRest!29392 mapKey!29392 mapValue!29392))))

(declare-fun b!903467 () Bool)

(assert (=> b!903467 (= e!506084 tp_is_empty!18451)))

(declare-fun condMapEmpty!29392 () Bool)

(declare-fun mapDefault!29392 () ValueCell!8744)

(assert (=> mapNonEmpty!29383 (= condMapEmpty!29392 (= mapRest!29383 ((as const (Array (_ BitVec 32) ValueCell!8744)) mapDefault!29392)))))

(assert (=> mapNonEmpty!29383 (= tp!56443 (and e!506085 mapRes!29392))))

(assert (= (and mapNonEmpty!29383 condMapEmpty!29392) mapIsEmpty!29392))

(assert (= (and mapNonEmpty!29383 (not condMapEmpty!29392)) mapNonEmpty!29392))

(assert (= (and mapNonEmpty!29392 ((_ is ValueCellFull!8744) mapValue!29392)) b!903467))

(assert (= (and mapNonEmpty!29383 ((_ is ValueCellFull!8744) mapDefault!29392)) b!903468))

(declare-fun m!839823 () Bool)

(assert (=> mapNonEmpty!29392 m!839823))

(check-sat tp_is_empty!18451 (not d!112287) (not b!903451) (not b!903440) (not bm!40288) (not b!903449) (not b!903439) (not b!903460) (not d!112289) (not b!903458) (not mapNonEmpty!29392))
(check-sat)
