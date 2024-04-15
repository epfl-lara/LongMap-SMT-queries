; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78462 () Bool)

(assert start!78462)

(declare-fun b!914826 () Bool)

(declare-fun e!513323 () Bool)

(declare-fun tp_is_empty!19213 () Bool)

(assert (=> b!914826 (= e!513323 tp_is_empty!19213)))

(declare-fun b!914827 () Bool)

(declare-fun res!616902 () Bool)

(declare-fun e!513326 () Bool)

(assert (=> b!914827 (=> (not res!616902) (not e!513326))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30583 0))(
  ( (V!30584 (val!9657 Int)) )
))
(declare-datatypes ((ValueCell!9125 0))(
  ( (ValueCellFull!9125 (v!12173 V!30583)) (EmptyCell!9125) )
))
(declare-datatypes ((array!54423 0))(
  ( (array!54424 (arr!26158 (Array (_ BitVec 32) ValueCell!9125)) (size!26619 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54423)

(declare-datatypes ((array!54425 0))(
  ( (array!54426 (arr!26159 (Array (_ BitVec 32) (_ BitVec 64))) (size!26620 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54425)

(assert (=> b!914827 (= res!616902 (and (= (size!26619 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26620 _keys!1487) (size!26619 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30573 () Bool)

(declare-fun mapRes!30573 () Bool)

(declare-fun tp!58641 () Bool)

(declare-fun e!513327 () Bool)

(assert (=> mapNonEmpty!30573 (= mapRes!30573 (and tp!58641 e!513327))))

(declare-fun mapValue!30573 () ValueCell!9125)

(declare-fun mapRest!30573 () (Array (_ BitVec 32) ValueCell!9125))

(declare-fun mapKey!30573 () (_ BitVec 32))

(assert (=> mapNonEmpty!30573 (= (arr!26158 _values!1231) (store mapRest!30573 mapKey!30573 mapValue!30573))))

(declare-fun b!914828 () Bool)

(declare-fun e!513325 () Bool)

(declare-datatypes ((List!18395 0))(
  ( (Nil!18392) (Cons!18391 (h!19537 (_ BitVec 64)) (t!25999 List!18395)) )
))
(declare-fun contains!4675 (List!18395 (_ BitVec 64)) Bool)

(assert (=> b!914828 (= e!513325 (contains!4675 Nil!18392 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!616900 () Bool)

(assert (=> start!78462 (=> (not res!616900) (not e!513326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78462 (= res!616900 (validMask!0 mask!1881))))

(assert (=> start!78462 e!513326))

(assert (=> start!78462 true))

(declare-fun e!513328 () Bool)

(declare-fun array_inv!20506 (array!54423) Bool)

(assert (=> start!78462 (and (array_inv!20506 _values!1231) e!513328)))

(declare-fun array_inv!20507 (array!54425) Bool)

(assert (=> start!78462 (array_inv!20507 _keys!1487)))

(declare-fun mapIsEmpty!30573 () Bool)

(assert (=> mapIsEmpty!30573 mapRes!30573))

(declare-fun b!914829 () Bool)

(declare-fun res!616899 () Bool)

(assert (=> b!914829 (=> (not res!616899) (not e!513326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54425 (_ BitVec 32)) Bool)

(assert (=> b!914829 (= res!616899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!914830 () Bool)

(assert (=> b!914830 (= e!513328 (and e!513323 mapRes!30573))))

(declare-fun condMapEmpty!30573 () Bool)

(declare-fun mapDefault!30573 () ValueCell!9125)

(assert (=> b!914830 (= condMapEmpty!30573 (= (arr!26158 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9125)) mapDefault!30573)))))

(declare-fun b!914831 () Bool)

(assert (=> b!914831 (= e!513327 tp_is_empty!19213)))

(declare-fun b!914832 () Bool)

(declare-fun res!616901 () Bool)

(assert (=> b!914832 (=> (not res!616901) (not e!513326))))

(assert (=> b!914832 (= res!616901 (and (bvsle #b00000000000000000000000000000000 (size!26620 _keys!1487)) (bvslt (size!26620 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun b!914833 () Bool)

(assert (=> b!914833 (= e!513326 e!513325)))

(declare-fun res!616897 () Bool)

(assert (=> b!914833 (=> res!616897 e!513325)))

(assert (=> b!914833 (= res!616897 (contains!4675 Nil!18392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914834 () Bool)

(declare-fun res!616898 () Bool)

(assert (=> b!914834 (=> (not res!616898) (not e!513326))))

(declare-fun noDuplicate!1334 (List!18395) Bool)

(assert (=> b!914834 (= res!616898 (noDuplicate!1334 Nil!18392))))

(assert (= (and start!78462 res!616900) b!914827))

(assert (= (and b!914827 res!616902) b!914829))

(assert (= (and b!914829 res!616899) b!914832))

(assert (= (and b!914832 res!616901) b!914834))

(assert (= (and b!914834 res!616898) b!914833))

(assert (= (and b!914833 (not res!616897)) b!914828))

(assert (= (and b!914830 condMapEmpty!30573) mapIsEmpty!30573))

(assert (= (and b!914830 (not condMapEmpty!30573)) mapNonEmpty!30573))

(get-info :version)

(assert (= (and mapNonEmpty!30573 ((_ is ValueCellFull!9125) mapValue!30573)) b!914831))

(assert (= (and b!914830 ((_ is ValueCellFull!9125) mapDefault!30573)) b!914826))

(assert (= start!78462 b!914830))

(declare-fun m!848805 () Bool)

(assert (=> mapNonEmpty!30573 m!848805))

(declare-fun m!848807 () Bool)

(assert (=> start!78462 m!848807))

(declare-fun m!848809 () Bool)

(assert (=> start!78462 m!848809))

(declare-fun m!848811 () Bool)

(assert (=> start!78462 m!848811))

(declare-fun m!848813 () Bool)

(assert (=> b!914829 m!848813))

(declare-fun m!848815 () Bool)

(assert (=> b!914833 m!848815))

(declare-fun m!848817 () Bool)

(assert (=> b!914834 m!848817))

(declare-fun m!848819 () Bool)

(assert (=> b!914828 m!848819))

(check-sat (not b!914834) tp_is_empty!19213 (not b!914828) (not b!914829) (not mapNonEmpty!30573) (not b!914833) (not start!78462))
(check-sat)
(get-model)

(declare-fun d!112539 () Bool)

(declare-fun res!616943 () Bool)

(declare-fun e!513369 () Bool)

(assert (=> d!112539 (=> res!616943 e!513369)))

(assert (=> d!112539 (= res!616943 ((_ is Nil!18392) Nil!18392))))

(assert (=> d!112539 (= (noDuplicate!1334 Nil!18392) e!513369)))

(declare-fun b!914893 () Bool)

(declare-fun e!513370 () Bool)

(assert (=> b!914893 (= e!513369 e!513370)))

(declare-fun res!616944 () Bool)

(assert (=> b!914893 (=> (not res!616944) (not e!513370))))

(assert (=> b!914893 (= res!616944 (not (contains!4675 (t!25999 Nil!18392) (h!19537 Nil!18392))))))

(declare-fun b!914894 () Bool)

(assert (=> b!914894 (= e!513370 (noDuplicate!1334 (t!25999 Nil!18392)))))

(assert (= (and d!112539 (not res!616943)) b!914893))

(assert (= (and b!914893 res!616944) b!914894))

(declare-fun m!848853 () Bool)

(assert (=> b!914893 m!848853))

(declare-fun m!848855 () Bool)

(assert (=> b!914894 m!848855))

(assert (=> b!914834 d!112539))

(declare-fun d!112541 () Bool)

(declare-fun res!616950 () Bool)

(declare-fun e!513379 () Bool)

(assert (=> d!112541 (=> res!616950 e!513379)))

(assert (=> d!112541 (= res!616950 (bvsge #b00000000000000000000000000000000 (size!26620 _keys!1487)))))

(assert (=> d!112541 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!513379)))

(declare-fun b!914903 () Bool)

(declare-fun e!513378 () Bool)

(declare-fun call!40523 () Bool)

(assert (=> b!914903 (= e!513378 call!40523)))

(declare-fun bm!40520 () Bool)

(assert (=> bm!40520 (= call!40523 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!914904 () Bool)

(declare-fun e!513377 () Bool)

(assert (=> b!914904 (= e!513377 call!40523)))

(declare-fun b!914905 () Bool)

(assert (=> b!914905 (= e!513377 e!513378)))

(declare-fun lt!411383 () (_ BitVec 64))

(assert (=> b!914905 (= lt!411383 (select (arr!26159 _keys!1487) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30884 0))(
  ( (Unit!30885) )
))
(declare-fun lt!411384 () Unit!30884)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54425 (_ BitVec 64) (_ BitVec 32)) Unit!30884)

(assert (=> b!914905 (= lt!411384 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!411383 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914905 (arrayContainsKey!0 _keys!1487 lt!411383 #b00000000000000000000000000000000)))

(declare-fun lt!411385 () Unit!30884)

(assert (=> b!914905 (= lt!411385 lt!411384)))

(declare-fun res!616949 () Bool)

(declare-datatypes ((SeekEntryResult!8975 0))(
  ( (MissingZero!8975 (index!38271 (_ BitVec 32))) (Found!8975 (index!38272 (_ BitVec 32))) (Intermediate!8975 (undefined!9787 Bool) (index!38273 (_ BitVec 32)) (x!78285 (_ BitVec 32))) (Undefined!8975) (MissingVacant!8975 (index!38274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54425 (_ BitVec 32)) SeekEntryResult!8975)

(assert (=> b!914905 (= res!616949 (= (seekEntryOrOpen!0 (select (arr!26159 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8975 #b00000000000000000000000000000000)))))

(assert (=> b!914905 (=> (not res!616949) (not e!513378))))

(declare-fun b!914906 () Bool)

(assert (=> b!914906 (= e!513379 e!513377)))

(declare-fun c!95986 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!914906 (= c!95986 (validKeyInArray!0 (select (arr!26159 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!112541 (not res!616950)) b!914906))

(assert (= (and b!914906 c!95986) b!914905))

(assert (= (and b!914906 (not c!95986)) b!914904))

(assert (= (and b!914905 res!616949) b!914903))

(assert (= (or b!914903 b!914904) bm!40520))

(declare-fun m!848857 () Bool)

(assert (=> bm!40520 m!848857))

(declare-fun m!848859 () Bool)

(assert (=> b!914905 m!848859))

(declare-fun m!848861 () Bool)

(assert (=> b!914905 m!848861))

(declare-fun m!848863 () Bool)

(assert (=> b!914905 m!848863))

(assert (=> b!914905 m!848859))

(declare-fun m!848865 () Bool)

(assert (=> b!914905 m!848865))

(assert (=> b!914906 m!848859))

(assert (=> b!914906 m!848859))

(declare-fun m!848867 () Bool)

(assert (=> b!914906 m!848867))

(assert (=> b!914829 d!112541))

(declare-fun d!112543 () Bool)

(declare-fun lt!411388 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!403 (List!18395) (InoxSet (_ BitVec 64)))

(assert (=> d!112543 (= lt!411388 (select (content!403 Nil!18392) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!513384 () Bool)

(assert (=> d!112543 (= lt!411388 e!513384)))

(declare-fun res!616955 () Bool)

(assert (=> d!112543 (=> (not res!616955) (not e!513384))))

(assert (=> d!112543 (= res!616955 ((_ is Cons!18391) Nil!18392))))

(assert (=> d!112543 (= (contains!4675 Nil!18392 #b1000000000000000000000000000000000000000000000000000000000000000) lt!411388)))

(declare-fun b!914911 () Bool)

(declare-fun e!513385 () Bool)

(assert (=> b!914911 (= e!513384 e!513385)))

(declare-fun res!616956 () Bool)

(assert (=> b!914911 (=> res!616956 e!513385)))

(assert (=> b!914911 (= res!616956 (= (h!19537 Nil!18392) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914912 () Bool)

(assert (=> b!914912 (= e!513385 (contains!4675 (t!25999 Nil!18392) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!112543 res!616955) b!914911))

(assert (= (and b!914911 (not res!616956)) b!914912))

(declare-fun m!848869 () Bool)

(assert (=> d!112543 m!848869))

(declare-fun m!848871 () Bool)

(assert (=> d!112543 m!848871))

(declare-fun m!848873 () Bool)

(assert (=> b!914912 m!848873))

(assert (=> b!914828 d!112543))

(declare-fun d!112545 () Bool)

(assert (=> d!112545 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78462 d!112545))

(declare-fun d!112547 () Bool)

(assert (=> d!112547 (= (array_inv!20506 _values!1231) (bvsge (size!26619 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78462 d!112547))

(declare-fun d!112549 () Bool)

(assert (=> d!112549 (= (array_inv!20507 _keys!1487) (bvsge (size!26620 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78462 d!112549))

(declare-fun d!112551 () Bool)

(declare-fun lt!411389 () Bool)

(assert (=> d!112551 (= lt!411389 (select (content!403 Nil!18392) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!513386 () Bool)

(assert (=> d!112551 (= lt!411389 e!513386)))

(declare-fun res!616957 () Bool)

(assert (=> d!112551 (=> (not res!616957) (not e!513386))))

(assert (=> d!112551 (= res!616957 ((_ is Cons!18391) Nil!18392))))

(assert (=> d!112551 (= (contains!4675 Nil!18392 #b0000000000000000000000000000000000000000000000000000000000000000) lt!411389)))

(declare-fun b!914913 () Bool)

(declare-fun e!513387 () Bool)

(assert (=> b!914913 (= e!513386 e!513387)))

(declare-fun res!616958 () Bool)

(assert (=> b!914913 (=> res!616958 e!513387)))

(assert (=> b!914913 (= res!616958 (= (h!19537 Nil!18392) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914914 () Bool)

(assert (=> b!914914 (= e!513387 (contains!4675 (t!25999 Nil!18392) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!112551 res!616957) b!914913))

(assert (= (and b!914913 (not res!616958)) b!914914))

(assert (=> d!112551 m!848869))

(declare-fun m!848875 () Bool)

(assert (=> d!112551 m!848875))

(declare-fun m!848877 () Bool)

(assert (=> b!914914 m!848877))

(assert (=> b!914833 d!112551))

(declare-fun condMapEmpty!30582 () Bool)

(declare-fun mapDefault!30582 () ValueCell!9125)

(assert (=> mapNonEmpty!30573 (= condMapEmpty!30582 (= mapRest!30573 ((as const (Array (_ BitVec 32) ValueCell!9125)) mapDefault!30582)))))

(declare-fun e!513393 () Bool)

(declare-fun mapRes!30582 () Bool)

(assert (=> mapNonEmpty!30573 (= tp!58641 (and e!513393 mapRes!30582))))

(declare-fun mapNonEmpty!30582 () Bool)

(declare-fun tp!58650 () Bool)

(declare-fun e!513392 () Bool)

(assert (=> mapNonEmpty!30582 (= mapRes!30582 (and tp!58650 e!513392))))

(declare-fun mapValue!30582 () ValueCell!9125)

(declare-fun mapKey!30582 () (_ BitVec 32))

(declare-fun mapRest!30582 () (Array (_ BitVec 32) ValueCell!9125))

(assert (=> mapNonEmpty!30582 (= mapRest!30573 (store mapRest!30582 mapKey!30582 mapValue!30582))))

(declare-fun b!914921 () Bool)

(assert (=> b!914921 (= e!513392 tp_is_empty!19213)))

(declare-fun mapIsEmpty!30582 () Bool)

(assert (=> mapIsEmpty!30582 mapRes!30582))

(declare-fun b!914922 () Bool)

(assert (=> b!914922 (= e!513393 tp_is_empty!19213)))

(assert (= (and mapNonEmpty!30573 condMapEmpty!30582) mapIsEmpty!30582))

(assert (= (and mapNonEmpty!30573 (not condMapEmpty!30582)) mapNonEmpty!30582))

(assert (= (and mapNonEmpty!30582 ((_ is ValueCellFull!9125) mapValue!30582)) b!914921))

(assert (= (and mapNonEmpty!30573 ((_ is ValueCellFull!9125) mapDefault!30582)) b!914922))

(declare-fun m!848879 () Bool)

(assert (=> mapNonEmpty!30582 m!848879))

(check-sat (not b!914893) tp_is_empty!19213 (not bm!40520) (not b!914894) (not mapNonEmpty!30582) (not b!914914) (not b!914905) (not d!112543) (not b!914912) (not d!112551) (not b!914906))
(check-sat)
