; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83632 () Bool)

(assert start!83632)

(declare-fun b!977004 () Bool)

(declare-fun e!550685 () Bool)

(declare-fun tp_is_empty!22473 () Bool)

(assert (=> b!977004 (= e!550685 tp_is_empty!22473)))

(declare-fun b!977005 () Bool)

(declare-fun res!653950 () Bool)

(declare-fun e!550683 () Bool)

(assert (=> b!977005 (=> (not res!653950) (not e!550683))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!34947 0))(
  ( (V!34948 (val!11287 Int)) )
))
(declare-datatypes ((ValueCell!10755 0))(
  ( (ValueCellFull!10755 (v!13848 V!34947)) (EmptyCell!10755) )
))
(declare-datatypes ((array!60973 0))(
  ( (array!60974 (arr!29348 (Array (_ BitVec 32) ValueCell!10755)) (size!29827 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60973)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!60975 0))(
  ( (array!60976 (arr!29349 (Array (_ BitVec 32) (_ BitVec 64))) (size!29828 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60975)

(assert (=> b!977005 (= res!653950 (and (= (size!29827 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29828 _keys!1544) (size!29827 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977006 () Bool)

(assert (=> b!977006 (= e!550683 (bvsgt #b00000000000000000000000000000000 (size!29828 _keys!1544)))))

(declare-fun b!977007 () Bool)

(declare-fun e!550687 () Bool)

(assert (=> b!977007 (= e!550687 tp_is_empty!22473)))

(declare-fun mapIsEmpty!35726 () Bool)

(declare-fun mapRes!35726 () Bool)

(assert (=> mapIsEmpty!35726 mapRes!35726))

(declare-fun b!977008 () Bool)

(declare-fun e!550686 () Bool)

(assert (=> b!977008 (= e!550686 (and e!550685 mapRes!35726))))

(declare-fun condMapEmpty!35726 () Bool)

(declare-fun mapDefault!35726 () ValueCell!10755)

(assert (=> b!977008 (= condMapEmpty!35726 (= (arr!29348 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10755)) mapDefault!35726)))))

(declare-fun res!653951 () Bool)

(assert (=> start!83632 (=> (not res!653951) (not e!550683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83632 (= res!653951 (validMask!0 mask!1948))))

(assert (=> start!83632 e!550683))

(assert (=> start!83632 true))

(declare-fun array_inv!22689 (array!60973) Bool)

(assert (=> start!83632 (and (array_inv!22689 _values!1278) e!550686)))

(declare-fun array_inv!22690 (array!60975) Bool)

(assert (=> start!83632 (array_inv!22690 _keys!1544)))

(declare-fun mapNonEmpty!35726 () Bool)

(declare-fun tp!67978 () Bool)

(assert (=> mapNonEmpty!35726 (= mapRes!35726 (and tp!67978 e!550687))))

(declare-fun mapValue!35726 () ValueCell!10755)

(declare-fun mapKey!35726 () (_ BitVec 32))

(declare-fun mapRest!35726 () (Array (_ BitVec 32) ValueCell!10755))

(assert (=> mapNonEmpty!35726 (= (arr!29348 _values!1278) (store mapRest!35726 mapKey!35726 mapValue!35726))))

(declare-fun b!977009 () Bool)

(declare-fun res!653952 () Bool)

(assert (=> b!977009 (=> (not res!653952) (not e!550683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60975 (_ BitVec 32)) Bool)

(assert (=> b!977009 (= res!653952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83632 res!653951) b!977005))

(assert (= (and b!977005 res!653950) b!977009))

(assert (= (and b!977009 res!653952) b!977006))

(assert (= (and b!977008 condMapEmpty!35726) mapIsEmpty!35726))

(assert (= (and b!977008 (not condMapEmpty!35726)) mapNonEmpty!35726))

(get-info :version)

(assert (= (and mapNonEmpty!35726 ((_ is ValueCellFull!10755) mapValue!35726)) b!977007))

(assert (= (and b!977008 ((_ is ValueCellFull!10755) mapDefault!35726)) b!977004))

(assert (= start!83632 b!977008))

(declare-fun m!904431 () Bool)

(assert (=> start!83632 m!904431))

(declare-fun m!904433 () Bool)

(assert (=> start!83632 m!904433))

(declare-fun m!904435 () Bool)

(assert (=> start!83632 m!904435))

(declare-fun m!904437 () Bool)

(assert (=> mapNonEmpty!35726 m!904437))

(declare-fun m!904439 () Bool)

(assert (=> b!977009 m!904439))

(check-sat (not start!83632) (not b!977009) (not mapNonEmpty!35726) tp_is_empty!22473)
(check-sat)
(get-model)

(declare-fun d!116625 () Bool)

(assert (=> d!116625 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83632 d!116625))

(declare-fun d!116627 () Bool)

(assert (=> d!116627 (= (array_inv!22689 _values!1278) (bvsge (size!29827 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83632 d!116627))

(declare-fun d!116629 () Bool)

(assert (=> d!116629 (= (array_inv!22690 _keys!1544) (bvsge (size!29828 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83632 d!116629))

(declare-fun b!977036 () Bool)

(declare-fun e!550709 () Bool)

(declare-fun e!550710 () Bool)

(assert (=> b!977036 (= e!550709 e!550710)))

(declare-fun c!100013 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977036 (= c!100013 (validKeyInArray!0 (select (arr!29349 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!977038 () Bool)

(declare-fun call!41784 () Bool)

(assert (=> b!977038 (= e!550710 call!41784)))

(declare-fun bm!41781 () Bool)

(assert (=> bm!41781 (= call!41784 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!977039 () Bool)

(declare-fun e!550711 () Bool)

(assert (=> b!977039 (= e!550711 call!41784)))

(declare-fun b!977037 () Bool)

(assert (=> b!977037 (= e!550710 e!550711)))

(declare-fun lt!433415 () (_ BitVec 64))

(assert (=> b!977037 (= lt!433415 (select (arr!29349 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32489 0))(
  ( (Unit!32490) )
))
(declare-fun lt!433417 () Unit!32489)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!60975 (_ BitVec 64) (_ BitVec 32)) Unit!32489)

(assert (=> b!977037 (= lt!433417 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!433415 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!60975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!977037 (arrayContainsKey!0 _keys!1544 lt!433415 #b00000000000000000000000000000000)))

(declare-fun lt!433416 () Unit!32489)

(assert (=> b!977037 (= lt!433416 lt!433417)))

(declare-fun res!653966 () Bool)

(declare-datatypes ((SeekEntryResult!9202 0))(
  ( (MissingZero!9202 (index!39179 (_ BitVec 32))) (Found!9202 (index!39180 (_ BitVec 32))) (Intermediate!9202 (undefined!10014 Bool) (index!39181 (_ BitVec 32)) (x!84533 (_ BitVec 32))) (Undefined!9202) (MissingVacant!9202 (index!39182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!60975 (_ BitVec 32)) SeekEntryResult!9202)

(assert (=> b!977037 (= res!653966 (= (seekEntryOrOpen!0 (select (arr!29349 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9202 #b00000000000000000000000000000000)))))

(assert (=> b!977037 (=> (not res!653966) (not e!550711))))

(declare-fun d!116631 () Bool)

(declare-fun res!653967 () Bool)

(assert (=> d!116631 (=> res!653967 e!550709)))

(assert (=> d!116631 (= res!653967 (bvsge #b00000000000000000000000000000000 (size!29828 _keys!1544)))))

(assert (=> d!116631 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!550709)))

(assert (= (and d!116631 (not res!653967)) b!977036))

(assert (= (and b!977036 c!100013) b!977037))

(assert (= (and b!977036 (not c!100013)) b!977038))

(assert (= (and b!977037 res!653966) b!977039))

(assert (= (or b!977039 b!977038) bm!41781))

(declare-fun m!904451 () Bool)

(assert (=> b!977036 m!904451))

(assert (=> b!977036 m!904451))

(declare-fun m!904453 () Bool)

(assert (=> b!977036 m!904453))

(declare-fun m!904455 () Bool)

(assert (=> bm!41781 m!904455))

(assert (=> b!977037 m!904451))

(declare-fun m!904457 () Bool)

(assert (=> b!977037 m!904457))

(declare-fun m!904459 () Bool)

(assert (=> b!977037 m!904459))

(assert (=> b!977037 m!904451))

(declare-fun m!904461 () Bool)

(assert (=> b!977037 m!904461))

(assert (=> b!977009 d!116631))

(declare-fun mapNonEmpty!35732 () Bool)

(declare-fun mapRes!35732 () Bool)

(declare-fun tp!67984 () Bool)

(declare-fun e!550717 () Bool)

(assert (=> mapNonEmpty!35732 (= mapRes!35732 (and tp!67984 e!550717))))

(declare-fun mapRest!35732 () (Array (_ BitVec 32) ValueCell!10755))

(declare-fun mapValue!35732 () ValueCell!10755)

(declare-fun mapKey!35732 () (_ BitVec 32))

(assert (=> mapNonEmpty!35732 (= mapRest!35726 (store mapRest!35732 mapKey!35732 mapValue!35732))))

(declare-fun mapIsEmpty!35732 () Bool)

(assert (=> mapIsEmpty!35732 mapRes!35732))

(declare-fun condMapEmpty!35732 () Bool)

(declare-fun mapDefault!35732 () ValueCell!10755)

(assert (=> mapNonEmpty!35726 (= condMapEmpty!35732 (= mapRest!35726 ((as const (Array (_ BitVec 32) ValueCell!10755)) mapDefault!35732)))))

(declare-fun e!550716 () Bool)

(assert (=> mapNonEmpty!35726 (= tp!67978 (and e!550716 mapRes!35732))))

(declare-fun b!977047 () Bool)

(assert (=> b!977047 (= e!550716 tp_is_empty!22473)))

(declare-fun b!977046 () Bool)

(assert (=> b!977046 (= e!550717 tp_is_empty!22473)))

(assert (= (and mapNonEmpty!35726 condMapEmpty!35732) mapIsEmpty!35732))

(assert (= (and mapNonEmpty!35726 (not condMapEmpty!35732)) mapNonEmpty!35732))

(assert (= (and mapNonEmpty!35732 ((_ is ValueCellFull!10755) mapValue!35732)) b!977046))

(assert (= (and mapNonEmpty!35726 ((_ is ValueCellFull!10755) mapDefault!35732)) b!977047))

(declare-fun m!904463 () Bool)

(assert (=> mapNonEmpty!35732 m!904463))

(check-sat (not b!977036) (not b!977037) tp_is_empty!22473 (not bm!41781) (not mapNonEmpty!35732))
(check-sat)
