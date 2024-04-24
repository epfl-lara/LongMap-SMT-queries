; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43152 () Bool)

(assert start!43152)

(declare-fun mapIsEmpty!22042 () Bool)

(declare-fun mapRes!22042 () Bool)

(assert (=> mapIsEmpty!22042 mapRes!22042))

(declare-fun b!478472 () Bool)

(declare-fun e!281326 () Bool)

(declare-datatypes ((List!8970 0))(
  ( (Nil!8967) (Cons!8966 (h!9822 (_ BitVec 64)) (t!15168 List!8970)) )
))
(declare-fun contains!2562 (List!8970 (_ BitVec 64)) Bool)

(assert (=> b!478472 (= e!281326 (contains!2562 Nil!8967 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!478473 () Bool)

(declare-fun e!281327 () Bool)

(declare-fun e!281329 () Bool)

(assert (=> b!478473 (= e!281327 (and e!281329 mapRes!22042))))

(declare-fun condMapEmpty!22042 () Bool)

(declare-datatypes ((V!19161 0))(
  ( (V!19162 (val!6831 Int)) )
))
(declare-datatypes ((ValueCell!6422 0))(
  ( (ValueCellFull!6422 (v!9120 V!19161)) (EmptyCell!6422) )
))
(declare-datatypes ((array!30798 0))(
  ( (array!30799 (arr!14807 (Array (_ BitVec 32) ValueCell!6422)) (size!15165 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30798)

(declare-fun mapDefault!22042 () ValueCell!6422)

(assert (=> b!478473 (= condMapEmpty!22042 (= (arr!14807 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6422)) mapDefault!22042)))))

(declare-fun b!478474 () Bool)

(declare-fun res!285493 () Bool)

(declare-fun e!281325 () Bool)

(assert (=> b!478474 (=> (not res!285493) (not e!281325))))

(declare-fun noDuplicate!209 (List!8970) Bool)

(assert (=> b!478474 (= res!285493 (noDuplicate!209 Nil!8967))))

(declare-fun b!478475 () Bool)

(declare-fun res!285496 () Bool)

(assert (=> b!478475 (=> (not res!285496) (not e!281325))))

(declare-datatypes ((array!30800 0))(
  ( (array!30801 (arr!14808 (Array (_ BitVec 32) (_ BitVec 64))) (size!15166 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30800)

(assert (=> b!478475 (= res!285496 (and (bvsle #b00000000000000000000000000000000 (size!15166 _keys!1874)) (bvslt (size!15166 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun res!285495 () Bool)

(assert (=> start!43152 (=> (not res!285495) (not e!281325))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43152 (= res!285495 (validMask!0 mask!2352))))

(assert (=> start!43152 e!281325))

(assert (=> start!43152 true))

(declare-fun array_inv!10762 (array!30798) Bool)

(assert (=> start!43152 (and (array_inv!10762 _values!1516) e!281327)))

(declare-fun array_inv!10763 (array!30800) Bool)

(assert (=> start!43152 (array_inv!10763 _keys!1874)))

(declare-fun b!478476 () Bool)

(declare-fun res!285498 () Bool)

(assert (=> b!478476 (=> (not res!285498) (not e!281325))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478476 (= res!285498 (and (= (size!15165 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15166 _keys!1874) (size!15165 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478477 () Bool)

(declare-fun tp_is_empty!13567 () Bool)

(assert (=> b!478477 (= e!281329 tp_is_empty!13567)))

(declare-fun b!478478 () Bool)

(declare-fun e!281324 () Bool)

(assert (=> b!478478 (= e!281324 tp_is_empty!13567)))

(declare-fun b!478479 () Bool)

(assert (=> b!478479 (= e!281325 e!281326)))

(declare-fun res!285494 () Bool)

(assert (=> b!478479 (=> res!285494 e!281326)))

(assert (=> b!478479 (= res!285494 (contains!2562 Nil!8967 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!22042 () Bool)

(declare-fun tp!42517 () Bool)

(assert (=> mapNonEmpty!22042 (= mapRes!22042 (and tp!42517 e!281324))))

(declare-fun mapRest!22042 () (Array (_ BitVec 32) ValueCell!6422))

(declare-fun mapValue!22042 () ValueCell!6422)

(declare-fun mapKey!22042 () (_ BitVec 32))

(assert (=> mapNonEmpty!22042 (= (arr!14807 _values!1516) (store mapRest!22042 mapKey!22042 mapValue!22042))))

(declare-fun b!478480 () Bool)

(declare-fun res!285497 () Bool)

(assert (=> b!478480 (=> (not res!285497) (not e!281325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30800 (_ BitVec 32)) Bool)

(assert (=> b!478480 (= res!285497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(assert (= (and start!43152 res!285495) b!478476))

(assert (= (and b!478476 res!285498) b!478480))

(assert (= (and b!478480 res!285497) b!478475))

(assert (= (and b!478475 res!285496) b!478474))

(assert (= (and b!478474 res!285493) b!478479))

(assert (= (and b!478479 (not res!285494)) b!478472))

(assert (= (and b!478473 condMapEmpty!22042) mapIsEmpty!22042))

(assert (= (and b!478473 (not condMapEmpty!22042)) mapNonEmpty!22042))

(get-info :version)

(assert (= (and mapNonEmpty!22042 ((_ is ValueCellFull!6422) mapValue!22042)) b!478478))

(assert (= (and b!478473 ((_ is ValueCellFull!6422) mapDefault!22042)) b!478477))

(assert (= start!43152 b!478473))

(declare-fun m!460947 () Bool)

(assert (=> b!478480 m!460947))

(declare-fun m!460949 () Bool)

(assert (=> start!43152 m!460949))

(declare-fun m!460951 () Bool)

(assert (=> start!43152 m!460951))

(declare-fun m!460953 () Bool)

(assert (=> start!43152 m!460953))

(declare-fun m!460955 () Bool)

(assert (=> b!478479 m!460955))

(declare-fun m!460957 () Bool)

(assert (=> b!478472 m!460957))

(declare-fun m!460959 () Bool)

(assert (=> mapNonEmpty!22042 m!460959))

(declare-fun m!460961 () Bool)

(assert (=> b!478474 m!460961))

(check-sat (not mapNonEmpty!22042) (not b!478480) (not b!478474) (not b!478479) tp_is_empty!13567 (not b!478472) (not start!43152))
(check-sat)
(get-model)

(declare-fun b!478544 () Bool)

(declare-fun e!281372 () Bool)

(declare-fun e!281373 () Bool)

(assert (=> b!478544 (= e!281372 e!281373)))

(declare-fun c!57643 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478544 (= c!57643 (validKeyInArray!0 (select (arr!14808 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!478545 () Bool)

(declare-fun call!30827 () Bool)

(assert (=> b!478545 (= e!281373 call!30827)))

(declare-fun d!76649 () Bool)

(declare-fun res!285539 () Bool)

(assert (=> d!76649 (=> res!285539 e!281372)))

(assert (=> d!76649 (= res!285539 (bvsge #b00000000000000000000000000000000 (size!15166 _keys!1874)))))

(assert (=> d!76649 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281372)))

(declare-fun b!478543 () Bool)

(declare-fun e!281374 () Bool)

(assert (=> b!478543 (= e!281373 e!281374)))

(declare-fun lt!217747 () (_ BitVec 64))

(assert (=> b!478543 (= lt!217747 (select (arr!14808 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14035 0))(
  ( (Unit!14036) )
))
(declare-fun lt!217748 () Unit!14035)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30800 (_ BitVec 64) (_ BitVec 32)) Unit!14035)

(assert (=> b!478543 (= lt!217748 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217747 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478543 (arrayContainsKey!0 _keys!1874 lt!217747 #b00000000000000000000000000000000)))

(declare-fun lt!217749 () Unit!14035)

(assert (=> b!478543 (= lt!217749 lt!217748)))

(declare-fun res!285540 () Bool)

(declare-datatypes ((SeekEntryResult!3515 0))(
  ( (MissingZero!3515 (index!16239 (_ BitVec 32))) (Found!3515 (index!16240 (_ BitVec 32))) (Intermediate!3515 (undefined!4327 Bool) (index!16241 (_ BitVec 32)) (x!44862 (_ BitVec 32))) (Undefined!3515) (MissingVacant!3515 (index!16242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30800 (_ BitVec 32)) SeekEntryResult!3515)

(assert (=> b!478543 (= res!285540 (= (seekEntryOrOpen!0 (select (arr!14808 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3515 #b00000000000000000000000000000000)))))

(assert (=> b!478543 (=> (not res!285540) (not e!281374))))

(declare-fun bm!30824 () Bool)

(assert (=> bm!30824 (= call!30827 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!478546 () Bool)

(assert (=> b!478546 (= e!281374 call!30827)))

(assert (= (and d!76649 (not res!285539)) b!478544))

(assert (= (and b!478544 c!57643) b!478543))

(assert (= (and b!478544 (not c!57643)) b!478545))

(assert (= (and b!478543 res!285540) b!478546))

(assert (= (or b!478546 b!478545) bm!30824))

(declare-fun m!460995 () Bool)

(assert (=> b!478544 m!460995))

(assert (=> b!478544 m!460995))

(declare-fun m!460997 () Bool)

(assert (=> b!478544 m!460997))

(assert (=> b!478543 m!460995))

(declare-fun m!460999 () Bool)

(assert (=> b!478543 m!460999))

(declare-fun m!461001 () Bool)

(assert (=> b!478543 m!461001))

(assert (=> b!478543 m!460995))

(declare-fun m!461003 () Bool)

(assert (=> b!478543 m!461003))

(declare-fun m!461005 () Bool)

(assert (=> bm!30824 m!461005))

(assert (=> b!478480 d!76649))

(declare-fun d!76651 () Bool)

(declare-fun lt!217752 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!214 (List!8970) (InoxSet (_ BitVec 64)))

(assert (=> d!76651 (= lt!217752 (select (content!214 Nil!8967) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!281379 () Bool)

(assert (=> d!76651 (= lt!217752 e!281379)))

(declare-fun res!285545 () Bool)

(assert (=> d!76651 (=> (not res!285545) (not e!281379))))

(assert (=> d!76651 (= res!285545 ((_ is Cons!8966) Nil!8967))))

(assert (=> d!76651 (= (contains!2562 Nil!8967 #b1000000000000000000000000000000000000000000000000000000000000000) lt!217752)))

(declare-fun b!478551 () Bool)

(declare-fun e!281380 () Bool)

(assert (=> b!478551 (= e!281379 e!281380)))

(declare-fun res!285546 () Bool)

(assert (=> b!478551 (=> res!285546 e!281380)))

(assert (=> b!478551 (= res!285546 (= (h!9822 Nil!8967) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!478552 () Bool)

(assert (=> b!478552 (= e!281380 (contains!2562 (t!15168 Nil!8967) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!76651 res!285545) b!478551))

(assert (= (and b!478551 (not res!285546)) b!478552))

(declare-fun m!461007 () Bool)

(assert (=> d!76651 m!461007))

(declare-fun m!461009 () Bool)

(assert (=> d!76651 m!461009))

(declare-fun m!461011 () Bool)

(assert (=> b!478552 m!461011))

(assert (=> b!478472 d!76651))

(declare-fun d!76653 () Bool)

(declare-fun lt!217753 () Bool)

(assert (=> d!76653 (= lt!217753 (select (content!214 Nil!8967) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!281381 () Bool)

(assert (=> d!76653 (= lt!217753 e!281381)))

(declare-fun res!285547 () Bool)

(assert (=> d!76653 (=> (not res!285547) (not e!281381))))

(assert (=> d!76653 (= res!285547 ((_ is Cons!8966) Nil!8967))))

(assert (=> d!76653 (= (contains!2562 Nil!8967 #b0000000000000000000000000000000000000000000000000000000000000000) lt!217753)))

(declare-fun b!478553 () Bool)

(declare-fun e!281382 () Bool)

(assert (=> b!478553 (= e!281381 e!281382)))

(declare-fun res!285548 () Bool)

(assert (=> b!478553 (=> res!285548 e!281382)))

(assert (=> b!478553 (= res!285548 (= (h!9822 Nil!8967) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!478554 () Bool)

(assert (=> b!478554 (= e!281382 (contains!2562 (t!15168 Nil!8967) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!76653 res!285547) b!478553))

(assert (= (and b!478553 (not res!285548)) b!478554))

(assert (=> d!76653 m!461007))

(declare-fun m!461013 () Bool)

(assert (=> d!76653 m!461013))

(declare-fun m!461015 () Bool)

(assert (=> b!478554 m!461015))

(assert (=> b!478479 d!76653))

(declare-fun d!76655 () Bool)

(assert (=> d!76655 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43152 d!76655))

(declare-fun d!76657 () Bool)

(assert (=> d!76657 (= (array_inv!10762 _values!1516) (bvsge (size!15165 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43152 d!76657))

(declare-fun d!76659 () Bool)

(assert (=> d!76659 (= (array_inv!10763 _keys!1874) (bvsge (size!15166 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43152 d!76659))

(declare-fun d!76661 () Bool)

(declare-fun res!285553 () Bool)

(declare-fun e!281387 () Bool)

(assert (=> d!76661 (=> res!285553 e!281387)))

(assert (=> d!76661 (= res!285553 ((_ is Nil!8967) Nil!8967))))

(assert (=> d!76661 (= (noDuplicate!209 Nil!8967) e!281387)))

(declare-fun b!478559 () Bool)

(declare-fun e!281388 () Bool)

(assert (=> b!478559 (= e!281387 e!281388)))

(declare-fun res!285554 () Bool)

(assert (=> b!478559 (=> (not res!285554) (not e!281388))))

(assert (=> b!478559 (= res!285554 (not (contains!2562 (t!15168 Nil!8967) (h!9822 Nil!8967))))))

(declare-fun b!478560 () Bool)

(assert (=> b!478560 (= e!281388 (noDuplicate!209 (t!15168 Nil!8967)))))

(assert (= (and d!76661 (not res!285553)) b!478559))

(assert (= (and b!478559 res!285554) b!478560))

(declare-fun m!461017 () Bool)

(assert (=> b!478559 m!461017))

(declare-fun m!461019 () Bool)

(assert (=> b!478560 m!461019))

(assert (=> b!478474 d!76661))

(declare-fun b!478568 () Bool)

(declare-fun e!281393 () Bool)

(assert (=> b!478568 (= e!281393 tp_is_empty!13567)))

(declare-fun mapNonEmpty!22051 () Bool)

(declare-fun mapRes!22051 () Bool)

(declare-fun tp!42526 () Bool)

(declare-fun e!281394 () Bool)

(assert (=> mapNonEmpty!22051 (= mapRes!22051 (and tp!42526 e!281394))))

(declare-fun mapRest!22051 () (Array (_ BitVec 32) ValueCell!6422))

(declare-fun mapValue!22051 () ValueCell!6422)

(declare-fun mapKey!22051 () (_ BitVec 32))

(assert (=> mapNonEmpty!22051 (= mapRest!22042 (store mapRest!22051 mapKey!22051 mapValue!22051))))

(declare-fun condMapEmpty!22051 () Bool)

(declare-fun mapDefault!22051 () ValueCell!6422)

(assert (=> mapNonEmpty!22042 (= condMapEmpty!22051 (= mapRest!22042 ((as const (Array (_ BitVec 32) ValueCell!6422)) mapDefault!22051)))))

(assert (=> mapNonEmpty!22042 (= tp!42517 (and e!281393 mapRes!22051))))

(declare-fun b!478567 () Bool)

(assert (=> b!478567 (= e!281394 tp_is_empty!13567)))

(declare-fun mapIsEmpty!22051 () Bool)

(assert (=> mapIsEmpty!22051 mapRes!22051))

(assert (= (and mapNonEmpty!22042 condMapEmpty!22051) mapIsEmpty!22051))

(assert (= (and mapNonEmpty!22042 (not condMapEmpty!22051)) mapNonEmpty!22051))

(assert (= (and mapNonEmpty!22051 ((_ is ValueCellFull!6422) mapValue!22051)) b!478567))

(assert (= (and mapNonEmpty!22042 ((_ is ValueCellFull!6422) mapDefault!22051)) b!478568))

(declare-fun m!461021 () Bool)

(assert (=> mapNonEmpty!22051 m!461021))

(check-sat (not b!478554) (not b!478544) (not bm!30824) (not b!478559) (not b!478543) (not b!478552) (not mapNonEmpty!22051) (not d!76651) tp_is_empty!13567 (not b!478560) (not d!76653))
(check-sat)
