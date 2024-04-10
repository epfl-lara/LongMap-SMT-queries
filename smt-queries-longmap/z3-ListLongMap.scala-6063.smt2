; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78466 () Bool)

(assert start!78466)

(declare-fun mapNonEmpty!30564 () Bool)

(declare-fun mapRes!30564 () Bool)

(declare-fun tp!58631 () Bool)

(declare-fun e!513419 () Bool)

(assert (=> mapNonEmpty!30564 (= mapRes!30564 (and tp!58631 e!513419))))

(declare-datatypes ((V!30577 0))(
  ( (V!30578 (val!9655 Int)) )
))
(declare-datatypes ((ValueCell!9123 0))(
  ( (ValueCellFull!9123 (v!12172 V!30577)) (EmptyCell!9123) )
))
(declare-fun mapRest!30564 () (Array (_ BitVec 32) ValueCell!9123))

(declare-fun mapKey!30564 () (_ BitVec 32))

(declare-datatypes ((array!54414 0))(
  ( (array!54415 (arr!26154 (Array (_ BitVec 32) ValueCell!9123)) (size!26613 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54414)

(declare-fun mapValue!30564 () ValueCell!9123)

(assert (=> mapNonEmpty!30564 (= (arr!26154 _values!1231) (store mapRest!30564 mapKey!30564 mapValue!30564))))

(declare-fun b!914993 () Bool)

(declare-fun res!616970 () Bool)

(declare-fun e!513418 () Bool)

(assert (=> b!914993 (=> (not res!616970) (not e!513418))))

(declare-datatypes ((array!54416 0))(
  ( (array!54417 (arr!26155 (Array (_ BitVec 32) (_ BitVec 64))) (size!26614 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54416)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!914993 (= res!616970 (and (= (size!26613 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26614 _keys!1487) (size!26613 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30564 () Bool)

(assert (=> mapIsEmpty!30564 mapRes!30564))

(declare-fun b!914994 () Bool)

(declare-fun res!616968 () Bool)

(assert (=> b!914994 (=> (not res!616968) (not e!513418))))

(assert (=> b!914994 (= res!616968 (and (bvsle #b00000000000000000000000000000000 (size!26614 _keys!1487)) (bvslt (size!26614 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun b!914995 () Bool)

(declare-fun e!513420 () Bool)

(declare-fun tp_is_empty!19209 () Bool)

(assert (=> b!914995 (= e!513420 tp_is_empty!19209)))

(declare-fun res!616967 () Bool)

(assert (=> start!78466 (=> (not res!616967) (not e!513418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78466 (= res!616967 (validMask!0 mask!1881))))

(assert (=> start!78466 e!513418))

(assert (=> start!78466 true))

(declare-fun e!513422 () Bool)

(declare-fun array_inv!20422 (array!54414) Bool)

(assert (=> start!78466 (and (array_inv!20422 _values!1231) e!513422)))

(declare-fun array_inv!20423 (array!54416) Bool)

(assert (=> start!78466 (array_inv!20423 _keys!1487)))

(declare-fun b!914996 () Bool)

(assert (=> b!914996 (= e!513419 tp_is_empty!19209)))

(declare-fun b!914997 () Bool)

(assert (=> b!914997 (= e!513422 (and e!513420 mapRes!30564))))

(declare-fun condMapEmpty!30564 () Bool)

(declare-fun mapDefault!30564 () ValueCell!9123)

(assert (=> b!914997 (= condMapEmpty!30564 (= (arr!26154 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9123)) mapDefault!30564)))))

(declare-fun b!914998 () Bool)

(declare-fun res!616969 () Bool)

(assert (=> b!914998 (=> (not res!616969) (not e!513418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54416 (_ BitVec 32)) Bool)

(assert (=> b!914998 (= res!616969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!914999 () Bool)

(declare-datatypes ((List!18359 0))(
  ( (Nil!18356) (Cons!18355 (h!19501 (_ BitVec 64)) (t!25972 List!18359)) )
))
(declare-fun noDuplicate!1329 (List!18359) Bool)

(assert (=> b!914999 (= e!513418 (not (noDuplicate!1329 Nil!18356)))))

(assert (= (and start!78466 res!616967) b!914993))

(assert (= (and b!914993 res!616970) b!914998))

(assert (= (and b!914998 res!616969) b!914994))

(assert (= (and b!914994 res!616968) b!914999))

(assert (= (and b!914997 condMapEmpty!30564) mapIsEmpty!30564))

(assert (= (and b!914997 (not condMapEmpty!30564)) mapNonEmpty!30564))

(get-info :version)

(assert (= (and mapNonEmpty!30564 ((_ is ValueCellFull!9123) mapValue!30564)) b!914996))

(assert (= (and b!914997 ((_ is ValueCellFull!9123) mapDefault!30564)) b!914995))

(assert (= start!78466 b!914997))

(declare-fun m!849521 () Bool)

(assert (=> mapNonEmpty!30564 m!849521))

(declare-fun m!849523 () Bool)

(assert (=> start!78466 m!849523))

(declare-fun m!849525 () Bool)

(assert (=> start!78466 m!849525))

(declare-fun m!849527 () Bool)

(assert (=> start!78466 m!849527))

(declare-fun m!849529 () Bool)

(assert (=> b!914998 m!849529))

(declare-fun m!849531 () Bool)

(assert (=> b!914999 m!849531))

(check-sat (not b!914999) (not b!914998) (not start!78466) (not mapNonEmpty!30564) tp_is_empty!19209)
(check-sat)
(get-model)

(declare-fun d!112725 () Bool)

(assert (=> d!112725 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78466 d!112725))

(declare-fun d!112727 () Bool)

(assert (=> d!112727 (= (array_inv!20422 _values!1231) (bvsge (size!26613 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78466 d!112727))

(declare-fun d!112729 () Bool)

(assert (=> d!112729 (= (array_inv!20423 _keys!1487) (bvsge (size!26614 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78466 d!112729))

(declare-fun d!112731 () Bool)

(declare-fun res!616988 () Bool)

(declare-fun e!513446 () Bool)

(assert (=> d!112731 (=> res!616988 e!513446)))

(assert (=> d!112731 (= res!616988 (bvsge #b00000000000000000000000000000000 (size!26614 _keys!1487)))))

(assert (=> d!112731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!513446)))

(declare-fun bm!40543 () Bool)

(declare-fun call!40546 () Bool)

(assert (=> bm!40543 (= call!40546 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!915029 () Bool)

(declare-fun e!513444 () Bool)

(assert (=> b!915029 (= e!513446 e!513444)))

(declare-fun c!96048 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!915029 (= c!96048 (validKeyInArray!0 (select (arr!26155 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!915030 () Bool)

(declare-fun e!513445 () Bool)

(assert (=> b!915030 (= e!513445 call!40546)))

(declare-fun b!915031 () Bool)

(assert (=> b!915031 (= e!513444 call!40546)))

(declare-fun b!915032 () Bool)

(assert (=> b!915032 (= e!513444 e!513445)))

(declare-fun lt!411611 () (_ BitVec 64))

(assert (=> b!915032 (= lt!411611 (select (arr!26155 _keys!1487) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30966 0))(
  ( (Unit!30967) )
))
(declare-fun lt!411610 () Unit!30966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54416 (_ BitVec 64) (_ BitVec 32)) Unit!30966)

(assert (=> b!915032 (= lt!411610 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!411611 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!915032 (arrayContainsKey!0 _keys!1487 lt!411611 #b00000000000000000000000000000000)))

(declare-fun lt!411612 () Unit!30966)

(assert (=> b!915032 (= lt!411612 lt!411610)))

(declare-fun res!616987 () Bool)

(declare-datatypes ((SeekEntryResult!8974 0))(
  ( (MissingZero!8974 (index!38267 (_ BitVec 32))) (Found!8974 (index!38268 (_ BitVec 32))) (Intermediate!8974 (undefined!9786 Bool) (index!38269 (_ BitVec 32)) (x!78279 (_ BitVec 32))) (Undefined!8974) (MissingVacant!8974 (index!38270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54416 (_ BitVec 32)) SeekEntryResult!8974)

(assert (=> b!915032 (= res!616987 (= (seekEntryOrOpen!0 (select (arr!26155 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8974 #b00000000000000000000000000000000)))))

(assert (=> b!915032 (=> (not res!616987) (not e!513445))))

(assert (= (and d!112731 (not res!616988)) b!915029))

(assert (= (and b!915029 c!96048) b!915032))

(assert (= (and b!915029 (not c!96048)) b!915031))

(assert (= (and b!915032 res!616987) b!915030))

(assert (= (or b!915030 b!915031) bm!40543))

(declare-fun m!849545 () Bool)

(assert (=> bm!40543 m!849545))

(declare-fun m!849547 () Bool)

(assert (=> b!915029 m!849547))

(assert (=> b!915029 m!849547))

(declare-fun m!849549 () Bool)

(assert (=> b!915029 m!849549))

(assert (=> b!915032 m!849547))

(declare-fun m!849551 () Bool)

(assert (=> b!915032 m!849551))

(declare-fun m!849553 () Bool)

(assert (=> b!915032 m!849553))

(assert (=> b!915032 m!849547))

(declare-fun m!849555 () Bool)

(assert (=> b!915032 m!849555))

(assert (=> b!914998 d!112731))

(declare-fun d!112733 () Bool)

(declare-fun res!616993 () Bool)

(declare-fun e!513451 () Bool)

(assert (=> d!112733 (=> res!616993 e!513451)))

(assert (=> d!112733 (= res!616993 ((_ is Nil!18356) Nil!18356))))

(assert (=> d!112733 (= (noDuplicate!1329 Nil!18356) e!513451)))

(declare-fun b!915037 () Bool)

(declare-fun e!513452 () Bool)

(assert (=> b!915037 (= e!513451 e!513452)))

(declare-fun res!616994 () Bool)

(assert (=> b!915037 (=> (not res!616994) (not e!513452))))

(declare-fun contains!4701 (List!18359 (_ BitVec 64)) Bool)

(assert (=> b!915037 (= res!616994 (not (contains!4701 (t!25972 Nil!18356) (h!19501 Nil!18356))))))

(declare-fun b!915038 () Bool)

(assert (=> b!915038 (= e!513452 (noDuplicate!1329 (t!25972 Nil!18356)))))

(assert (= (and d!112733 (not res!616993)) b!915037))

(assert (= (and b!915037 res!616994) b!915038))

(declare-fun m!849557 () Bool)

(assert (=> b!915037 m!849557))

(declare-fun m!849559 () Bool)

(assert (=> b!915038 m!849559))

(assert (=> b!914999 d!112733))

(declare-fun mapNonEmpty!30570 () Bool)

(declare-fun mapRes!30570 () Bool)

(declare-fun tp!58637 () Bool)

(declare-fun e!513457 () Bool)

(assert (=> mapNonEmpty!30570 (= mapRes!30570 (and tp!58637 e!513457))))

(declare-fun mapRest!30570 () (Array (_ BitVec 32) ValueCell!9123))

(declare-fun mapValue!30570 () ValueCell!9123)

(declare-fun mapKey!30570 () (_ BitVec 32))

(assert (=> mapNonEmpty!30570 (= mapRest!30564 (store mapRest!30570 mapKey!30570 mapValue!30570))))

(declare-fun b!915045 () Bool)

(assert (=> b!915045 (= e!513457 tp_is_empty!19209)))

(declare-fun b!915046 () Bool)

(declare-fun e!513458 () Bool)

(assert (=> b!915046 (= e!513458 tp_is_empty!19209)))

(declare-fun condMapEmpty!30570 () Bool)

(declare-fun mapDefault!30570 () ValueCell!9123)

(assert (=> mapNonEmpty!30564 (= condMapEmpty!30570 (= mapRest!30564 ((as const (Array (_ BitVec 32) ValueCell!9123)) mapDefault!30570)))))

(assert (=> mapNonEmpty!30564 (= tp!58631 (and e!513458 mapRes!30570))))

(declare-fun mapIsEmpty!30570 () Bool)

(assert (=> mapIsEmpty!30570 mapRes!30570))

(assert (= (and mapNonEmpty!30564 condMapEmpty!30570) mapIsEmpty!30570))

(assert (= (and mapNonEmpty!30564 (not condMapEmpty!30570)) mapNonEmpty!30570))

(assert (= (and mapNonEmpty!30570 ((_ is ValueCellFull!9123) mapValue!30570)) b!915045))

(assert (= (and mapNonEmpty!30564 ((_ is ValueCellFull!9123) mapDefault!30570)) b!915046))

(declare-fun m!849561 () Bool)

(assert (=> mapNonEmpty!30570 m!849561))

(check-sat (not b!915032) (not bm!40543) (not b!915037) (not mapNonEmpty!30570) tp_is_empty!19209 (not b!915038) (not b!915029))
(check-sat)
