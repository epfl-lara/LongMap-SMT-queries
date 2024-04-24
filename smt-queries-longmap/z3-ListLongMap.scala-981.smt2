; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21188 () Bool)

(assert start!21188)

(declare-fun b_free!5635 () Bool)

(declare-fun b_next!5635 () Bool)

(assert (=> start!21188 (= b_free!5635 (not b_next!5635))))

(declare-fun tp!19975 () Bool)

(declare-fun b_and!12515 () Bool)

(assert (=> start!21188 (= tp!19975 b_and!12515)))

(declare-fun b!213447 () Bool)

(declare-fun res!104473 () Bool)

(declare-fun e!138818 () Bool)

(assert (=> b!213447 (=> (not res!104473) (not e!138818))))

(declare-datatypes ((array!10197 0))(
  ( (array!10198 (arr!4839 (Array (_ BitVec 32) (_ BitVec 64))) (size!5164 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10197)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10197 (_ BitVec 32)) Bool)

(assert (=> b!213447 (= res!104473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!213448 () Bool)

(declare-fun res!104476 () Bool)

(assert (=> b!213448 (=> (not res!104476) (not e!138818))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!213448 (= res!104476 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5164 _keys!825))))))

(declare-fun mapIsEmpty!9344 () Bool)

(declare-fun mapRes!9344 () Bool)

(assert (=> mapIsEmpty!9344 mapRes!9344))

(declare-fun mapNonEmpty!9344 () Bool)

(declare-fun tp!19976 () Bool)

(declare-fun e!138819 () Bool)

(assert (=> mapNonEmpty!9344 (= mapRes!9344 (and tp!19976 e!138819))))

(declare-datatypes ((V!6977 0))(
  ( (V!6978 (val!2793 Int)) )
))
(declare-datatypes ((ValueCell!2405 0))(
  ( (ValueCellFull!2405 (v!4804 V!6977)) (EmptyCell!2405) )
))
(declare-fun mapValue!9344 () ValueCell!2405)

(declare-fun mapKey!9344 () (_ BitVec 32))

(declare-datatypes ((array!10199 0))(
  ( (array!10200 (arr!4840 (Array (_ BitVec 32) ValueCell!2405)) (size!5165 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10199)

(declare-fun mapRest!9344 () (Array (_ BitVec 32) ValueCell!2405))

(assert (=> mapNonEmpty!9344 (= (arr!4840 _values!649) (store mapRest!9344 mapKey!9344 mapValue!9344))))

(declare-fun b!213449 () Bool)

(declare-fun res!104475 () Bool)

(assert (=> b!213449 (=> (not res!104475) (not e!138818))))

(declare-datatypes ((List!3050 0))(
  ( (Nil!3047) (Cons!3046 (h!3688 (_ BitVec 64)) (t!7993 List!3050)) )
))
(declare-fun arrayNoDuplicates!0 (array!10197 (_ BitVec 32) List!3050) Bool)

(assert (=> b!213449 (= res!104475 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3047))))

(declare-fun b!213450 () Bool)

(declare-fun tp_is_empty!5497 () Bool)

(assert (=> b!213450 (= e!138819 tp_is_empty!5497)))

(declare-fun b!213451 () Bool)

(declare-fun e!138817 () Bool)

(assert (=> b!213451 (= e!138817 tp_is_empty!5497)))

(declare-fun b!213452 () Bool)

(declare-fun e!138815 () Bool)

(assert (=> b!213452 (= e!138815 (and e!138817 mapRes!9344))))

(declare-fun condMapEmpty!9344 () Bool)

(declare-fun mapDefault!9344 () ValueCell!2405)

(assert (=> b!213452 (= condMapEmpty!9344 (= (arr!4840 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2405)) mapDefault!9344)))))

(declare-fun b!213453 () Bool)

(declare-fun res!104474 () Bool)

(assert (=> b!213453 (=> (not res!104474) (not e!138818))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213453 (= res!104474 (validKeyInArray!0 k0!843))))

(declare-fun b!213455 () Bool)

(declare-fun res!104472 () Bool)

(assert (=> b!213455 (=> (not res!104472) (not e!138818))))

(assert (=> b!213455 (= res!104472 (= (select (arr!4839 _keys!825) i!601) k0!843))))

(declare-fun b!213456 () Bool)

(declare-fun res!104477 () Bool)

(assert (=> b!213456 (=> (not res!104477) (not e!138818))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!213456 (= res!104477 (and (= (size!5165 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5164 _keys!825) (size!5165 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!4168 0))(
  ( (tuple2!4169 (_1!2095 (_ BitVec 64)) (_2!2095 V!6977)) )
))
(declare-datatypes ((List!3051 0))(
  ( (Nil!3048) (Cons!3047 (h!3689 tuple2!4168) (t!7994 List!3051)) )
))
(declare-datatypes ((ListLongMap!3083 0))(
  ( (ListLongMap!3084 (toList!1557 List!3051)) )
))
(declare-fun lt!110334 () ListLongMap!3083)

(declare-fun lt!110337 () Bool)

(declare-fun lt!110338 () ListLongMap!3083)

(declare-fun b!213454 () Bool)

(assert (=> b!213454 (= e!138818 (not (or (and (not lt!110337) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!110337) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!110337) (= lt!110338 lt!110334))))))

(assert (=> b!213454 (= lt!110337 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!110333 () ListLongMap!3083)

(declare-fun zeroValue!615 () V!6977)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6977)

(declare-fun getCurrentListMap!1090 (array!10197 array!10199 (_ BitVec 32) (_ BitVec 32) V!6977 V!6977 (_ BitVec 32) Int) ListLongMap!3083)

(assert (=> b!213454 (= lt!110333 (getCurrentListMap!1090 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110335 () array!10199)

(assert (=> b!213454 (= lt!110338 (getCurrentListMap!1090 _keys!825 lt!110335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110340 () ListLongMap!3083)

(assert (=> b!213454 (and (= lt!110334 lt!110340) (= lt!110340 lt!110334))))

(declare-fun v!520 () V!6977)

(declare-fun lt!110339 () ListLongMap!3083)

(declare-fun +!586 (ListLongMap!3083 tuple2!4168) ListLongMap!3083)

(assert (=> b!213454 (= lt!110340 (+!586 lt!110339 (tuple2!4169 k0!843 v!520)))))

(declare-datatypes ((Unit!6462 0))(
  ( (Unit!6463) )
))
(declare-fun lt!110336 () Unit!6462)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!231 (array!10197 array!10199 (_ BitVec 32) (_ BitVec 32) V!6977 V!6977 (_ BitVec 32) (_ BitVec 64) V!6977 (_ BitVec 32) Int) Unit!6462)

(assert (=> b!213454 (= lt!110336 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!231 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!513 (array!10197 array!10199 (_ BitVec 32) (_ BitVec 32) V!6977 V!6977 (_ BitVec 32) Int) ListLongMap!3083)

(assert (=> b!213454 (= lt!110334 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!110335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213454 (= lt!110335 (array!10200 (store (arr!4840 _values!649) i!601 (ValueCellFull!2405 v!520)) (size!5165 _values!649)))))

(assert (=> b!213454 (= lt!110339 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!104478 () Bool)

(assert (=> start!21188 (=> (not res!104478) (not e!138818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21188 (= res!104478 (validMask!0 mask!1149))))

(assert (=> start!21188 e!138818))

(declare-fun array_inv!3175 (array!10199) Bool)

(assert (=> start!21188 (and (array_inv!3175 _values!649) e!138815)))

(assert (=> start!21188 true))

(assert (=> start!21188 tp_is_empty!5497))

(declare-fun array_inv!3176 (array!10197) Bool)

(assert (=> start!21188 (array_inv!3176 _keys!825)))

(assert (=> start!21188 tp!19975))

(assert (= (and start!21188 res!104478) b!213456))

(assert (= (and b!213456 res!104477) b!213447))

(assert (= (and b!213447 res!104473) b!213449))

(assert (= (and b!213449 res!104475) b!213448))

(assert (= (and b!213448 res!104476) b!213453))

(assert (= (and b!213453 res!104474) b!213455))

(assert (= (and b!213455 res!104472) b!213454))

(assert (= (and b!213452 condMapEmpty!9344) mapIsEmpty!9344))

(assert (= (and b!213452 (not condMapEmpty!9344)) mapNonEmpty!9344))

(get-info :version)

(assert (= (and mapNonEmpty!9344 ((_ is ValueCellFull!2405) mapValue!9344)) b!213450))

(assert (= (and b!213452 ((_ is ValueCellFull!2405) mapDefault!9344)) b!213451))

(assert (= start!21188 b!213452))

(declare-fun m!241457 () Bool)

(assert (=> b!213449 m!241457))

(declare-fun m!241459 () Bool)

(assert (=> b!213455 m!241459))

(declare-fun m!241461 () Bool)

(assert (=> mapNonEmpty!9344 m!241461))

(declare-fun m!241463 () Bool)

(assert (=> start!21188 m!241463))

(declare-fun m!241465 () Bool)

(assert (=> start!21188 m!241465))

(declare-fun m!241467 () Bool)

(assert (=> start!21188 m!241467))

(declare-fun m!241469 () Bool)

(assert (=> b!213447 m!241469))

(declare-fun m!241471 () Bool)

(assert (=> b!213454 m!241471))

(declare-fun m!241473 () Bool)

(assert (=> b!213454 m!241473))

(declare-fun m!241475 () Bool)

(assert (=> b!213454 m!241475))

(declare-fun m!241477 () Bool)

(assert (=> b!213454 m!241477))

(declare-fun m!241479 () Bool)

(assert (=> b!213454 m!241479))

(declare-fun m!241481 () Bool)

(assert (=> b!213454 m!241481))

(declare-fun m!241483 () Bool)

(assert (=> b!213454 m!241483))

(declare-fun m!241485 () Bool)

(assert (=> b!213453 m!241485))

(check-sat (not b!213447) (not mapNonEmpty!9344) tp_is_empty!5497 b_and!12515 (not b_next!5635) (not start!21188) (not b!213454) (not b!213449) (not b!213453))
(check-sat b_and!12515 (not b_next!5635))
(get-model)

(declare-fun d!58279 () Bool)

(assert (=> d!58279 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213453 d!58279))

(declare-fun d!58281 () Bool)

(assert (=> d!58281 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21188 d!58281))

(declare-fun d!58283 () Bool)

(assert (=> d!58283 (= (array_inv!3175 _values!649) (bvsge (size!5165 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21188 d!58283))

(declare-fun d!58285 () Bool)

(assert (=> d!58285 (= (array_inv!3176 _keys!825) (bvsge (size!5164 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21188 d!58285))

(declare-fun b!213525 () Bool)

(declare-fun e!138857 () Bool)

(declare-fun call!20207 () Bool)

(assert (=> b!213525 (= e!138857 call!20207)))

(declare-fun b!213526 () Bool)

(declare-fun e!138858 () Bool)

(assert (=> b!213526 (= e!138858 call!20207)))

(declare-fun bm!20204 () Bool)

(assert (=> bm!20204 (= call!20207 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun d!58287 () Bool)

(declare-fun res!104525 () Bool)

(declare-fun e!138856 () Bool)

(assert (=> d!58287 (=> res!104525 e!138856)))

(assert (=> d!58287 (= res!104525 (bvsge #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(assert (=> d!58287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138856)))

(declare-fun b!213527 () Bool)

(assert (=> b!213527 (= e!138858 e!138857)))

(declare-fun lt!110396 () (_ BitVec 64))

(assert (=> b!213527 (= lt!110396 (select (arr!4839 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110397 () Unit!6462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10197 (_ BitVec 64) (_ BitVec 32)) Unit!6462)

(assert (=> b!213527 (= lt!110397 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!110396 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!213527 (arrayContainsKey!0 _keys!825 lt!110396 #b00000000000000000000000000000000)))

(declare-fun lt!110395 () Unit!6462)

(assert (=> b!213527 (= lt!110395 lt!110397)))

(declare-fun res!104526 () Bool)

(declare-datatypes ((SeekEntryResult!703 0))(
  ( (MissingZero!703 (index!4982 (_ BitVec 32))) (Found!703 (index!4983 (_ BitVec 32))) (Intermediate!703 (undefined!1515 Bool) (index!4984 (_ BitVec 32)) (x!22235 (_ BitVec 32))) (Undefined!703) (MissingVacant!703 (index!4985 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10197 (_ BitVec 32)) SeekEntryResult!703)

(assert (=> b!213527 (= res!104526 (= (seekEntryOrOpen!0 (select (arr!4839 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!703 #b00000000000000000000000000000000)))))

(assert (=> b!213527 (=> (not res!104526) (not e!138857))))

(declare-fun b!213528 () Bool)

(assert (=> b!213528 (= e!138856 e!138858)))

(declare-fun c!35941 () Bool)

(assert (=> b!213528 (= c!35941 (validKeyInArray!0 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58287 (not res!104525)) b!213528))

(assert (= (and b!213528 c!35941) b!213527))

(assert (= (and b!213528 (not c!35941)) b!213526))

(assert (= (and b!213527 res!104526) b!213525))

(assert (= (or b!213525 b!213526) bm!20204))

(declare-fun m!241547 () Bool)

(assert (=> bm!20204 m!241547))

(declare-fun m!241549 () Bool)

(assert (=> b!213527 m!241549))

(declare-fun m!241551 () Bool)

(assert (=> b!213527 m!241551))

(declare-fun m!241553 () Bool)

(assert (=> b!213527 m!241553))

(assert (=> b!213527 m!241549))

(declare-fun m!241555 () Bool)

(assert (=> b!213527 m!241555))

(assert (=> b!213528 m!241549))

(assert (=> b!213528 m!241549))

(declare-fun m!241557 () Bool)

(assert (=> b!213528 m!241557))

(assert (=> b!213447 d!58287))

(declare-fun b!213539 () Bool)

(declare-fun e!138869 () Bool)

(declare-fun e!138870 () Bool)

(assert (=> b!213539 (= e!138869 e!138870)))

(declare-fun res!104533 () Bool)

(assert (=> b!213539 (=> (not res!104533) (not e!138870))))

(declare-fun e!138867 () Bool)

(assert (=> b!213539 (= res!104533 (not e!138867))))

(declare-fun res!104534 () Bool)

(assert (=> b!213539 (=> (not res!104534) (not e!138867))))

(assert (=> b!213539 (= res!104534 (validKeyInArray!0 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213540 () Bool)

(declare-fun e!138868 () Bool)

(declare-fun call!20210 () Bool)

(assert (=> b!213540 (= e!138868 call!20210)))

(declare-fun b!213541 () Bool)

(declare-fun contains!1402 (List!3050 (_ BitVec 64)) Bool)

(assert (=> b!213541 (= e!138867 (contains!1402 Nil!3047 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213542 () Bool)

(assert (=> b!213542 (= e!138870 e!138868)))

(declare-fun c!35944 () Bool)

(assert (=> b!213542 (= c!35944 (validKeyInArray!0 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213543 () Bool)

(assert (=> b!213543 (= e!138868 call!20210)))

(declare-fun bm!20207 () Bool)

(assert (=> bm!20207 (= call!20210 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35944 (Cons!3046 (select (arr!4839 _keys!825) #b00000000000000000000000000000000) Nil!3047) Nil!3047)))))

(declare-fun d!58289 () Bool)

(declare-fun res!104535 () Bool)

(assert (=> d!58289 (=> res!104535 e!138869)))

(assert (=> d!58289 (= res!104535 (bvsge #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(assert (=> d!58289 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3047) e!138869)))

(assert (= (and d!58289 (not res!104535)) b!213539))

(assert (= (and b!213539 res!104534) b!213541))

(assert (= (and b!213539 res!104533) b!213542))

(assert (= (and b!213542 c!35944) b!213540))

(assert (= (and b!213542 (not c!35944)) b!213543))

(assert (= (or b!213540 b!213543) bm!20207))

(assert (=> b!213539 m!241549))

(assert (=> b!213539 m!241549))

(assert (=> b!213539 m!241557))

(assert (=> b!213541 m!241549))

(assert (=> b!213541 m!241549))

(declare-fun m!241559 () Bool)

(assert (=> b!213541 m!241559))

(assert (=> b!213542 m!241549))

(assert (=> b!213542 m!241549))

(assert (=> b!213542 m!241557))

(assert (=> bm!20207 m!241549))

(declare-fun m!241561 () Bool)

(assert (=> bm!20207 m!241561))

(assert (=> b!213449 d!58289))

(declare-fun b!213568 () Bool)

(declare-fun res!104547 () Bool)

(declare-fun e!138890 () Bool)

(assert (=> b!213568 (=> (not res!104547) (not e!138890))))

(declare-fun lt!110412 () ListLongMap!3083)

(declare-fun contains!1403 (ListLongMap!3083 (_ BitVec 64)) Bool)

(assert (=> b!213568 (= res!104547 (not (contains!1403 lt!110412 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!213570 () Bool)

(assert (=> b!213570 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(assert (=> b!213570 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5165 lt!110335)))))

(declare-fun e!138886 () Bool)

(declare-fun apply!199 (ListLongMap!3083 (_ BitVec 64)) V!6977)

(declare-fun get!2593 (ValueCell!2405 V!6977) V!6977)

(declare-fun dynLambda!542 (Int (_ BitVec 64)) V!6977)

(assert (=> b!213570 (= e!138886 (= (apply!199 lt!110412 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)) (get!2593 (select (arr!4840 lt!110335) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20210 () Bool)

(declare-fun call!20213 () ListLongMap!3083)

(assert (=> bm!20210 (= call!20213 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!110335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!213571 () Bool)

(declare-fun lt!110415 () Unit!6462)

(declare-fun lt!110413 () Unit!6462)

(assert (=> b!213571 (= lt!110415 lt!110413)))

(declare-fun lt!110414 () (_ BitVec 64))

(declare-fun lt!110418 () V!6977)

(declare-fun lt!110416 () ListLongMap!3083)

(declare-fun lt!110417 () (_ BitVec 64))

(assert (=> b!213571 (not (contains!1403 (+!586 lt!110416 (tuple2!4169 lt!110417 lt!110418)) lt!110414))))

(declare-fun addStillNotContains!110 (ListLongMap!3083 (_ BitVec 64) V!6977 (_ BitVec 64)) Unit!6462)

(assert (=> b!213571 (= lt!110413 (addStillNotContains!110 lt!110416 lt!110417 lt!110418 lt!110414))))

(assert (=> b!213571 (= lt!110414 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213571 (= lt!110418 (get!2593 (select (arr!4840 lt!110335) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213571 (= lt!110417 (select (arr!4839 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213571 (= lt!110416 call!20213)))

(declare-fun e!138889 () ListLongMap!3083)

(assert (=> b!213571 (= e!138889 (+!586 call!20213 (tuple2!4169 (select (arr!4839 _keys!825) #b00000000000000000000000000000000) (get!2593 (select (arr!4840 lt!110335) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213572 () Bool)

(declare-fun e!138888 () Bool)

(declare-fun e!138887 () Bool)

(assert (=> b!213572 (= e!138888 e!138887)))

(declare-fun c!35956 () Bool)

(assert (=> b!213572 (= c!35956 (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun b!213573 () Bool)

(assert (=> b!213573 (= e!138888 e!138886)))

(assert (=> b!213573 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun res!104545 () Bool)

(assert (=> b!213573 (= res!104545 (contains!1403 lt!110412 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213573 (=> (not res!104545) (not e!138886))))

(declare-fun b!213569 () Bool)

(assert (=> b!213569 (= e!138889 call!20213)))

(declare-fun d!58291 () Bool)

(assert (=> d!58291 e!138890))

(declare-fun res!104544 () Bool)

(assert (=> d!58291 (=> (not res!104544) (not e!138890))))

(assert (=> d!58291 (= res!104544 (not (contains!1403 lt!110412 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!138891 () ListLongMap!3083)

(assert (=> d!58291 (= lt!110412 e!138891)))

(declare-fun c!35954 () Bool)

(assert (=> d!58291 (= c!35954 (bvsge #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(assert (=> d!58291 (validMask!0 mask!1149)))

(assert (=> d!58291 (= (getCurrentListMapNoExtraKeys!513 _keys!825 lt!110335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110412)))

(declare-fun b!213574 () Bool)

(declare-fun e!138885 () Bool)

(assert (=> b!213574 (= e!138885 (validKeyInArray!0 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213574 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!213575 () Bool)

(assert (=> b!213575 (= e!138891 (ListLongMap!3084 Nil!3048))))

(declare-fun b!213576 () Bool)

(declare-fun isEmpty!506 (ListLongMap!3083) Bool)

(assert (=> b!213576 (= e!138887 (isEmpty!506 lt!110412))))

(declare-fun b!213577 () Bool)

(assert (=> b!213577 (= e!138891 e!138889)))

(declare-fun c!35953 () Bool)

(assert (=> b!213577 (= c!35953 (validKeyInArray!0 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213578 () Bool)

(assert (=> b!213578 (= e!138890 e!138888)))

(declare-fun c!35955 () Bool)

(assert (=> b!213578 (= c!35955 e!138885)))

(declare-fun res!104546 () Bool)

(assert (=> b!213578 (=> (not res!104546) (not e!138885))))

(assert (=> b!213578 (= res!104546 (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun b!213579 () Bool)

(assert (=> b!213579 (= e!138887 (= lt!110412 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!110335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(assert (= (and d!58291 c!35954) b!213575))

(assert (= (and d!58291 (not c!35954)) b!213577))

(assert (= (and b!213577 c!35953) b!213571))

(assert (= (and b!213577 (not c!35953)) b!213569))

(assert (= (or b!213571 b!213569) bm!20210))

(assert (= (and d!58291 res!104544) b!213568))

(assert (= (and b!213568 res!104547) b!213578))

(assert (= (and b!213578 res!104546) b!213574))

(assert (= (and b!213578 c!35955) b!213573))

(assert (= (and b!213578 (not c!35955)) b!213572))

(assert (= (and b!213573 res!104545) b!213570))

(assert (= (and b!213572 c!35956) b!213579))

(assert (= (and b!213572 (not c!35956)) b!213576))

(declare-fun b_lambda!7801 () Bool)

(assert (=> (not b_lambda!7801) (not b!213570)))

(declare-fun t!7999 () Bool)

(declare-fun tb!2903 () Bool)

(assert (=> (and start!21188 (= defaultEntry!657 defaultEntry!657) t!7999) tb!2903))

(declare-fun result!5013 () Bool)

(assert (=> tb!2903 (= result!5013 tp_is_empty!5497)))

(assert (=> b!213570 t!7999))

(declare-fun b_and!12521 () Bool)

(assert (= b_and!12515 (and (=> t!7999 result!5013) b_and!12521)))

(declare-fun b_lambda!7803 () Bool)

(assert (=> (not b_lambda!7803) (not b!213571)))

(assert (=> b!213571 t!7999))

(declare-fun b_and!12523 () Bool)

(assert (= b_and!12521 (and (=> t!7999 result!5013) b_and!12523)))

(declare-fun m!241563 () Bool)

(assert (=> b!213571 m!241563))

(declare-fun m!241565 () Bool)

(assert (=> b!213571 m!241565))

(declare-fun m!241567 () Bool)

(assert (=> b!213571 m!241567))

(declare-fun m!241569 () Bool)

(assert (=> b!213571 m!241569))

(assert (=> b!213571 m!241567))

(declare-fun m!241571 () Bool)

(assert (=> b!213571 m!241571))

(assert (=> b!213571 m!241549))

(assert (=> b!213571 m!241563))

(declare-fun m!241573 () Bool)

(assert (=> b!213571 m!241573))

(declare-fun m!241575 () Bool)

(assert (=> b!213571 m!241575))

(assert (=> b!213571 m!241565))

(declare-fun m!241577 () Bool)

(assert (=> bm!20210 m!241577))

(declare-fun m!241579 () Bool)

(assert (=> d!58291 m!241579))

(assert (=> d!58291 m!241463))

(assert (=> b!213579 m!241577))

(assert (=> b!213570 m!241565))

(assert (=> b!213570 m!241567))

(assert (=> b!213570 m!241569))

(assert (=> b!213570 m!241567))

(assert (=> b!213570 m!241549))

(assert (=> b!213570 m!241549))

(declare-fun m!241581 () Bool)

(assert (=> b!213570 m!241581))

(assert (=> b!213570 m!241565))

(assert (=> b!213573 m!241549))

(assert (=> b!213573 m!241549))

(declare-fun m!241583 () Bool)

(assert (=> b!213573 m!241583))

(assert (=> b!213577 m!241549))

(assert (=> b!213577 m!241549))

(assert (=> b!213577 m!241557))

(declare-fun m!241585 () Bool)

(assert (=> b!213568 m!241585))

(assert (=> b!213574 m!241549))

(assert (=> b!213574 m!241549))

(assert (=> b!213574 m!241557))

(declare-fun m!241587 () Bool)

(assert (=> b!213576 m!241587))

(assert (=> b!213454 d!58291))

(declare-fun b!213582 () Bool)

(declare-fun res!104551 () Bool)

(declare-fun e!138897 () Bool)

(assert (=> b!213582 (=> (not res!104551) (not e!138897))))

(declare-fun lt!110419 () ListLongMap!3083)

(assert (=> b!213582 (= res!104551 (not (contains!1403 lt!110419 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!213584 () Bool)

(assert (=> b!213584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(assert (=> b!213584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5165 _values!649)))))

(declare-fun e!138893 () Bool)

(assert (=> b!213584 (= e!138893 (= (apply!199 lt!110419 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)) (get!2593 (select (arr!4840 _values!649) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20211 () Bool)

(declare-fun call!20214 () ListLongMap!3083)

(assert (=> bm!20211 (= call!20214 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!213585 () Bool)

(declare-fun lt!110422 () Unit!6462)

(declare-fun lt!110420 () Unit!6462)

(assert (=> b!213585 (= lt!110422 lt!110420)))

(declare-fun lt!110425 () V!6977)

(declare-fun lt!110423 () ListLongMap!3083)

(declare-fun lt!110421 () (_ BitVec 64))

(declare-fun lt!110424 () (_ BitVec 64))

(assert (=> b!213585 (not (contains!1403 (+!586 lt!110423 (tuple2!4169 lt!110424 lt!110425)) lt!110421))))

(assert (=> b!213585 (= lt!110420 (addStillNotContains!110 lt!110423 lt!110424 lt!110425 lt!110421))))

(assert (=> b!213585 (= lt!110421 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213585 (= lt!110425 (get!2593 (select (arr!4840 _values!649) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213585 (= lt!110424 (select (arr!4839 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213585 (= lt!110423 call!20214)))

(declare-fun e!138896 () ListLongMap!3083)

(assert (=> b!213585 (= e!138896 (+!586 call!20214 (tuple2!4169 (select (arr!4839 _keys!825) #b00000000000000000000000000000000) (get!2593 (select (arr!4840 _values!649) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213586 () Bool)

(declare-fun e!138895 () Bool)

(declare-fun e!138894 () Bool)

(assert (=> b!213586 (= e!138895 e!138894)))

(declare-fun c!35960 () Bool)

(assert (=> b!213586 (= c!35960 (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun b!213587 () Bool)

(assert (=> b!213587 (= e!138895 e!138893)))

(assert (=> b!213587 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun res!104549 () Bool)

(assert (=> b!213587 (= res!104549 (contains!1403 lt!110419 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213587 (=> (not res!104549) (not e!138893))))

(declare-fun b!213583 () Bool)

(assert (=> b!213583 (= e!138896 call!20214)))

(declare-fun d!58293 () Bool)

(assert (=> d!58293 e!138897))

(declare-fun res!104548 () Bool)

(assert (=> d!58293 (=> (not res!104548) (not e!138897))))

(assert (=> d!58293 (= res!104548 (not (contains!1403 lt!110419 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!138898 () ListLongMap!3083)

(assert (=> d!58293 (= lt!110419 e!138898)))

(declare-fun c!35958 () Bool)

(assert (=> d!58293 (= c!35958 (bvsge #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(assert (=> d!58293 (validMask!0 mask!1149)))

(assert (=> d!58293 (= (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110419)))

(declare-fun b!213588 () Bool)

(declare-fun e!138892 () Bool)

(assert (=> b!213588 (= e!138892 (validKeyInArray!0 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213588 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!213589 () Bool)

(assert (=> b!213589 (= e!138898 (ListLongMap!3084 Nil!3048))))

(declare-fun b!213590 () Bool)

(assert (=> b!213590 (= e!138894 (isEmpty!506 lt!110419))))

(declare-fun b!213591 () Bool)

(assert (=> b!213591 (= e!138898 e!138896)))

(declare-fun c!35957 () Bool)

(assert (=> b!213591 (= c!35957 (validKeyInArray!0 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213592 () Bool)

(assert (=> b!213592 (= e!138897 e!138895)))

(declare-fun c!35959 () Bool)

(assert (=> b!213592 (= c!35959 e!138892)))

(declare-fun res!104550 () Bool)

(assert (=> b!213592 (=> (not res!104550) (not e!138892))))

(assert (=> b!213592 (= res!104550 (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun b!213593 () Bool)

(assert (=> b!213593 (= e!138894 (= lt!110419 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(assert (= (and d!58293 c!35958) b!213589))

(assert (= (and d!58293 (not c!35958)) b!213591))

(assert (= (and b!213591 c!35957) b!213585))

(assert (= (and b!213591 (not c!35957)) b!213583))

(assert (= (or b!213585 b!213583) bm!20211))

(assert (= (and d!58293 res!104548) b!213582))

(assert (= (and b!213582 res!104551) b!213592))

(assert (= (and b!213592 res!104550) b!213588))

(assert (= (and b!213592 c!35959) b!213587))

(assert (= (and b!213592 (not c!35959)) b!213586))

(assert (= (and b!213587 res!104549) b!213584))

(assert (= (and b!213586 c!35960) b!213593))

(assert (= (and b!213586 (not c!35960)) b!213590))

(declare-fun b_lambda!7805 () Bool)

(assert (=> (not b_lambda!7805) (not b!213584)))

(assert (=> b!213584 t!7999))

(declare-fun b_and!12525 () Bool)

(assert (= b_and!12523 (and (=> t!7999 result!5013) b_and!12525)))

(declare-fun b_lambda!7807 () Bool)

(assert (=> (not b_lambda!7807) (not b!213585)))

(assert (=> b!213585 t!7999))

(declare-fun b_and!12527 () Bool)

(assert (= b_and!12525 (and (=> t!7999 result!5013) b_and!12527)))

(declare-fun m!241589 () Bool)

(assert (=> b!213585 m!241589))

(declare-fun m!241591 () Bool)

(assert (=> b!213585 m!241591))

(assert (=> b!213585 m!241567))

(declare-fun m!241593 () Bool)

(assert (=> b!213585 m!241593))

(assert (=> b!213585 m!241567))

(declare-fun m!241595 () Bool)

(assert (=> b!213585 m!241595))

(assert (=> b!213585 m!241549))

(assert (=> b!213585 m!241589))

(declare-fun m!241597 () Bool)

(assert (=> b!213585 m!241597))

(declare-fun m!241599 () Bool)

(assert (=> b!213585 m!241599))

(assert (=> b!213585 m!241591))

(declare-fun m!241601 () Bool)

(assert (=> bm!20211 m!241601))

(declare-fun m!241603 () Bool)

(assert (=> d!58293 m!241603))

(assert (=> d!58293 m!241463))

(assert (=> b!213593 m!241601))

(assert (=> b!213584 m!241591))

(assert (=> b!213584 m!241567))

(assert (=> b!213584 m!241593))

(assert (=> b!213584 m!241567))

(assert (=> b!213584 m!241549))

(assert (=> b!213584 m!241549))

(declare-fun m!241605 () Bool)

(assert (=> b!213584 m!241605))

(assert (=> b!213584 m!241591))

(assert (=> b!213587 m!241549))

(assert (=> b!213587 m!241549))

(declare-fun m!241607 () Bool)

(assert (=> b!213587 m!241607))

(assert (=> b!213591 m!241549))

(assert (=> b!213591 m!241549))

(assert (=> b!213591 m!241557))

(declare-fun m!241609 () Bool)

(assert (=> b!213582 m!241609))

(assert (=> b!213588 m!241549))

(assert (=> b!213588 m!241549))

(assert (=> b!213588 m!241557))

(declare-fun m!241611 () Bool)

(assert (=> b!213590 m!241611))

(assert (=> b!213454 d!58293))

(declare-fun bm!20216 () Bool)

(declare-fun call!20219 () ListLongMap!3083)

(assert (=> bm!20216 (= call!20219 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213600 () Bool)

(declare-fun e!138904 () Bool)

(declare-fun call!20220 () ListLongMap!3083)

(assert (=> b!213600 (= e!138904 (= call!20220 call!20219))))

(declare-fun d!58295 () Bool)

(declare-fun e!138903 () Bool)

(assert (=> d!58295 e!138903))

(declare-fun res!104554 () Bool)

(assert (=> d!58295 (=> (not res!104554) (not e!138903))))

(assert (=> d!58295 (= res!104554 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5165 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5165 _values!649))))))))

(declare-fun lt!110428 () Unit!6462)

(declare-fun choose!1090 (array!10197 array!10199 (_ BitVec 32) (_ BitVec 32) V!6977 V!6977 (_ BitVec 32) (_ BitVec 64) V!6977 (_ BitVec 32) Int) Unit!6462)

(assert (=> d!58295 (= lt!110428 (choose!1090 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58295 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(assert (=> d!58295 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!231 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!110428)))

(declare-fun bm!20217 () Bool)

(assert (=> bm!20217 (= call!20220 (getCurrentListMapNoExtraKeys!513 _keys!825 (array!10200 (store (arr!4840 _values!649) i!601 (ValueCellFull!2405 v!520)) (size!5165 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213601 () Bool)

(assert (=> b!213601 (= e!138904 (= call!20220 (+!586 call!20219 (tuple2!4169 k0!843 v!520))))))

(declare-fun b!213602 () Bool)

(assert (=> b!213602 (= e!138903 e!138904)))

(declare-fun c!35963 () Bool)

(assert (=> b!213602 (= c!35963 (bvsle #b00000000000000000000000000000000 i!601))))

(assert (= (and d!58295 res!104554) b!213602))

(assert (= (and b!213602 c!35963) b!213601))

(assert (= (and b!213602 (not c!35963)) b!213600))

(assert (= (or b!213601 b!213600) bm!20217))

(assert (= (or b!213601 b!213600) bm!20216))

(assert (=> bm!20216 m!241479))

(declare-fun m!241613 () Bool)

(assert (=> d!58295 m!241613))

(assert (=> bm!20217 m!241471))

(declare-fun m!241615 () Bool)

(assert (=> bm!20217 m!241615))

(declare-fun m!241617 () Bool)

(assert (=> b!213601 m!241617))

(assert (=> b!213454 d!58295))

(declare-fun d!58297 () Bool)

(declare-fun e!138907 () Bool)

(assert (=> d!58297 e!138907))

(declare-fun res!104560 () Bool)

(assert (=> d!58297 (=> (not res!104560) (not e!138907))))

(declare-fun lt!110438 () ListLongMap!3083)

(assert (=> d!58297 (= res!104560 (contains!1403 lt!110438 (_1!2095 (tuple2!4169 k0!843 v!520))))))

(declare-fun lt!110440 () List!3051)

(assert (=> d!58297 (= lt!110438 (ListLongMap!3084 lt!110440))))

(declare-fun lt!110437 () Unit!6462)

(declare-fun lt!110439 () Unit!6462)

(assert (=> d!58297 (= lt!110437 lt!110439)))

(declare-datatypes ((Option!264 0))(
  ( (Some!263 (v!4810 V!6977)) (None!262) )
))
(declare-fun getValueByKey!258 (List!3051 (_ BitVec 64)) Option!264)

(assert (=> d!58297 (= (getValueByKey!258 lt!110440 (_1!2095 (tuple2!4169 k0!843 v!520))) (Some!263 (_2!2095 (tuple2!4169 k0!843 v!520))))))

(declare-fun lemmaContainsTupThenGetReturnValue!145 (List!3051 (_ BitVec 64) V!6977) Unit!6462)

(assert (=> d!58297 (= lt!110439 (lemmaContainsTupThenGetReturnValue!145 lt!110440 (_1!2095 (tuple2!4169 k0!843 v!520)) (_2!2095 (tuple2!4169 k0!843 v!520))))))

(declare-fun insertStrictlySorted!148 (List!3051 (_ BitVec 64) V!6977) List!3051)

(assert (=> d!58297 (= lt!110440 (insertStrictlySorted!148 (toList!1557 lt!110339) (_1!2095 (tuple2!4169 k0!843 v!520)) (_2!2095 (tuple2!4169 k0!843 v!520))))))

(assert (=> d!58297 (= (+!586 lt!110339 (tuple2!4169 k0!843 v!520)) lt!110438)))

(declare-fun b!213607 () Bool)

(declare-fun res!104559 () Bool)

(assert (=> b!213607 (=> (not res!104559) (not e!138907))))

(assert (=> b!213607 (= res!104559 (= (getValueByKey!258 (toList!1557 lt!110438) (_1!2095 (tuple2!4169 k0!843 v!520))) (Some!263 (_2!2095 (tuple2!4169 k0!843 v!520)))))))

(declare-fun b!213608 () Bool)

(declare-fun contains!1404 (List!3051 tuple2!4168) Bool)

(assert (=> b!213608 (= e!138907 (contains!1404 (toList!1557 lt!110438) (tuple2!4169 k0!843 v!520)))))

(assert (= (and d!58297 res!104560) b!213607))

(assert (= (and b!213607 res!104559) b!213608))

(declare-fun m!241619 () Bool)

(assert (=> d!58297 m!241619))

(declare-fun m!241621 () Bool)

(assert (=> d!58297 m!241621))

(declare-fun m!241623 () Bool)

(assert (=> d!58297 m!241623))

(declare-fun m!241625 () Bool)

(assert (=> d!58297 m!241625))

(declare-fun m!241627 () Bool)

(assert (=> b!213607 m!241627))

(declare-fun m!241629 () Bool)

(assert (=> b!213608 m!241629))

(assert (=> b!213454 d!58297))

(declare-fun b!213651 () Bool)

(declare-fun e!138940 () Bool)

(declare-fun e!138941 () Bool)

(assert (=> b!213651 (= e!138940 e!138941)))

(declare-fun res!104587 () Bool)

(declare-fun call!20240 () Bool)

(assert (=> b!213651 (= res!104587 call!20240)))

(assert (=> b!213651 (=> (not res!104587) (not e!138941))))

(declare-fun b!213652 () Bool)

(declare-fun e!138936 () Unit!6462)

(declare-fun lt!110487 () Unit!6462)

(assert (=> b!213652 (= e!138936 lt!110487)))

(declare-fun lt!110503 () ListLongMap!3083)

(assert (=> b!213652 (= lt!110503 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110492 () (_ BitVec 64))

(assert (=> b!213652 (= lt!110492 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110498 () (_ BitVec 64))

(assert (=> b!213652 (= lt!110498 (select (arr!4839 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110493 () Unit!6462)

(declare-fun addStillContains!175 (ListLongMap!3083 (_ BitVec 64) V!6977 (_ BitVec 64)) Unit!6462)

(assert (=> b!213652 (= lt!110493 (addStillContains!175 lt!110503 lt!110492 zeroValue!615 lt!110498))))

(assert (=> b!213652 (contains!1403 (+!586 lt!110503 (tuple2!4169 lt!110492 zeroValue!615)) lt!110498)))

(declare-fun lt!110486 () Unit!6462)

(assert (=> b!213652 (= lt!110486 lt!110493)))

(declare-fun lt!110497 () ListLongMap!3083)

(assert (=> b!213652 (= lt!110497 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110505 () (_ BitVec 64))

(assert (=> b!213652 (= lt!110505 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110489 () (_ BitVec 64))

(assert (=> b!213652 (= lt!110489 (select (arr!4839 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110485 () Unit!6462)

(declare-fun addApplyDifferent!175 (ListLongMap!3083 (_ BitVec 64) V!6977 (_ BitVec 64)) Unit!6462)

(assert (=> b!213652 (= lt!110485 (addApplyDifferent!175 lt!110497 lt!110505 minValue!615 lt!110489))))

(assert (=> b!213652 (= (apply!199 (+!586 lt!110497 (tuple2!4169 lt!110505 minValue!615)) lt!110489) (apply!199 lt!110497 lt!110489))))

(declare-fun lt!110504 () Unit!6462)

(assert (=> b!213652 (= lt!110504 lt!110485)))

(declare-fun lt!110499 () ListLongMap!3083)

(assert (=> b!213652 (= lt!110499 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110506 () (_ BitVec 64))

(assert (=> b!213652 (= lt!110506 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110501 () (_ BitVec 64))

(assert (=> b!213652 (= lt!110501 (select (arr!4839 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110488 () Unit!6462)

(assert (=> b!213652 (= lt!110488 (addApplyDifferent!175 lt!110499 lt!110506 zeroValue!615 lt!110501))))

(assert (=> b!213652 (= (apply!199 (+!586 lt!110499 (tuple2!4169 lt!110506 zeroValue!615)) lt!110501) (apply!199 lt!110499 lt!110501))))

(declare-fun lt!110494 () Unit!6462)

(assert (=> b!213652 (= lt!110494 lt!110488)))

(declare-fun lt!110502 () ListLongMap!3083)

(assert (=> b!213652 (= lt!110502 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110496 () (_ BitVec 64))

(assert (=> b!213652 (= lt!110496 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110500 () (_ BitVec 64))

(assert (=> b!213652 (= lt!110500 (select (arr!4839 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213652 (= lt!110487 (addApplyDifferent!175 lt!110502 lt!110496 minValue!615 lt!110500))))

(assert (=> b!213652 (= (apply!199 (+!586 lt!110502 (tuple2!4169 lt!110496 minValue!615)) lt!110500) (apply!199 lt!110502 lt!110500))))

(declare-fun b!213653 () Bool)

(declare-fun e!138934 () Bool)

(declare-fun e!138944 () Bool)

(assert (=> b!213653 (= e!138934 e!138944)))

(declare-fun res!104581 () Bool)

(assert (=> b!213653 (=> (not res!104581) (not e!138944))))

(declare-fun lt!110491 () ListLongMap!3083)

(assert (=> b!213653 (= res!104581 (contains!1403 lt!110491 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213653 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun b!213654 () Bool)

(declare-fun e!138937 () Bool)

(declare-fun e!138945 () Bool)

(assert (=> b!213654 (= e!138937 e!138945)))

(declare-fun res!104585 () Bool)

(declare-fun call!20237 () Bool)

(assert (=> b!213654 (= res!104585 call!20237)))

(assert (=> b!213654 (=> (not res!104585) (not e!138945))))

(declare-fun b!213655 () Bool)

(declare-fun Unit!6466 () Unit!6462)

(assert (=> b!213655 (= e!138936 Unit!6466)))

(declare-fun bm!20232 () Bool)

(declare-fun call!20239 () ListLongMap!3083)

(declare-fun call!20238 () ListLongMap!3083)

(assert (=> bm!20232 (= call!20239 call!20238)))

(declare-fun b!213656 () Bool)

(declare-fun res!104579 () Bool)

(declare-fun e!138935 () Bool)

(assert (=> b!213656 (=> (not res!104579) (not e!138935))))

(assert (=> b!213656 (= res!104579 e!138937)))

(declare-fun c!35977 () Bool)

(assert (=> b!213656 (= c!35977 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!213657 () Bool)

(declare-fun e!138943 () ListLongMap!3083)

(declare-fun call!20235 () ListLongMap!3083)

(assert (=> b!213657 (= e!138943 call!20235)))

(declare-fun b!213659 () Bool)

(assert (=> b!213659 (= e!138941 (= (apply!199 lt!110491 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!213660 () Bool)

(assert (=> b!213660 (= e!138935 e!138940)))

(declare-fun c!35981 () Bool)

(assert (=> b!213660 (= c!35981 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213661 () Bool)

(declare-fun e!138939 () ListLongMap!3083)

(declare-fun call!20241 () ListLongMap!3083)

(assert (=> b!213661 (= e!138939 call!20241)))

(declare-fun b!213662 () Bool)

(declare-fun res!104586 () Bool)

(assert (=> b!213662 (=> (not res!104586) (not e!138935))))

(assert (=> b!213662 (= res!104586 e!138934)))

(declare-fun res!104582 () Bool)

(assert (=> b!213662 (=> res!104582 e!138934)))

(declare-fun e!138946 () Bool)

(assert (=> b!213662 (= res!104582 (not e!138946))))

(declare-fun res!104580 () Bool)

(assert (=> b!213662 (=> (not res!104580) (not e!138946))))

(assert (=> b!213662 (= res!104580 (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun b!213663 () Bool)

(assert (=> b!213663 (= e!138945 (= (apply!199 lt!110491 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213664 () Bool)

(assert (=> b!213664 (= e!138940 (not call!20240))))

(declare-fun bm!20233 () Bool)

(assert (=> bm!20233 (= call!20235 call!20239)))

(declare-fun b!213665 () Bool)

(assert (=> b!213665 (= e!138937 (not call!20237))))

(declare-fun b!213666 () Bool)

(assert (=> b!213666 (= e!138944 (= (apply!199 lt!110491 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)) (get!2593 (select (arr!4840 _values!649) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213666 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5165 _values!649)))))

(assert (=> b!213666 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun b!213658 () Bool)

(declare-fun e!138942 () Bool)

(assert (=> b!213658 (= e!138942 (validKeyInArray!0 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58299 () Bool)

(assert (=> d!58299 e!138935))

(declare-fun res!104583 () Bool)

(assert (=> d!58299 (=> (not res!104583) (not e!138935))))

(assert (=> d!58299 (= res!104583 (or (bvsge #b00000000000000000000000000000000 (size!5164 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))))

(declare-fun lt!110490 () ListLongMap!3083)

(assert (=> d!58299 (= lt!110491 lt!110490)))

(declare-fun lt!110495 () Unit!6462)

(assert (=> d!58299 (= lt!110495 e!138936)))

(declare-fun c!35976 () Bool)

(assert (=> d!58299 (= c!35976 e!138942)))

(declare-fun res!104584 () Bool)

(assert (=> d!58299 (=> (not res!104584) (not e!138942))))

(assert (=> d!58299 (= res!104584 (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun e!138938 () ListLongMap!3083)

(assert (=> d!58299 (= lt!110490 e!138938)))

(declare-fun c!35980 () Bool)

(assert (=> d!58299 (= c!35980 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58299 (validMask!0 mask!1149)))

(assert (=> d!58299 (= (getCurrentListMap!1090 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110491)))

(declare-fun b!213667 () Bool)

(declare-fun c!35979 () Bool)

(assert (=> b!213667 (= c!35979 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!213667 (= e!138939 e!138943)))

(declare-fun b!213668 () Bool)

(assert (=> b!213668 (= e!138946 (validKeyInArray!0 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20234 () Bool)

(assert (=> bm!20234 (= call!20240 (contains!1403 lt!110491 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213669 () Bool)

(declare-fun call!20236 () ListLongMap!3083)

(assert (=> b!213669 (= e!138938 (+!586 call!20236 (tuple2!4169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!213670 () Bool)

(assert (=> b!213670 (= e!138943 call!20241)))

(declare-fun b!213671 () Bool)

(assert (=> b!213671 (= e!138938 e!138939)))

(declare-fun c!35978 () Bool)

(assert (=> b!213671 (= c!35978 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20235 () Bool)

(assert (=> bm!20235 (= call!20236 (+!586 (ite c!35980 call!20238 (ite c!35978 call!20239 call!20235)) (ite (or c!35980 c!35978) (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20236 () Bool)

(assert (=> bm!20236 (= call!20237 (contains!1403 lt!110491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20237 () Bool)

(assert (=> bm!20237 (= call!20238 (getCurrentListMapNoExtraKeys!513 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!20238 () Bool)

(assert (=> bm!20238 (= call!20241 call!20236)))

(assert (= (and d!58299 c!35980) b!213669))

(assert (= (and d!58299 (not c!35980)) b!213671))

(assert (= (and b!213671 c!35978) b!213661))

(assert (= (and b!213671 (not c!35978)) b!213667))

(assert (= (and b!213667 c!35979) b!213670))

(assert (= (and b!213667 (not c!35979)) b!213657))

(assert (= (or b!213670 b!213657) bm!20233))

(assert (= (or b!213661 bm!20233) bm!20232))

(assert (= (or b!213661 b!213670) bm!20238))

(assert (= (or b!213669 bm!20232) bm!20237))

(assert (= (or b!213669 bm!20238) bm!20235))

(assert (= (and d!58299 res!104584) b!213658))

(assert (= (and d!58299 c!35976) b!213652))

(assert (= (and d!58299 (not c!35976)) b!213655))

(assert (= (and d!58299 res!104583) b!213662))

(assert (= (and b!213662 res!104580) b!213668))

(assert (= (and b!213662 (not res!104582)) b!213653))

(assert (= (and b!213653 res!104581) b!213666))

(assert (= (and b!213662 res!104586) b!213656))

(assert (= (and b!213656 c!35977) b!213654))

(assert (= (and b!213656 (not c!35977)) b!213665))

(assert (= (and b!213654 res!104585) b!213663))

(assert (= (or b!213654 b!213665) bm!20236))

(assert (= (and b!213656 res!104579) b!213660))

(assert (= (and b!213660 c!35981) b!213651))

(assert (= (and b!213660 (not c!35981)) b!213664))

(assert (= (and b!213651 res!104587) b!213659))

(assert (= (or b!213651 b!213664) bm!20234))

(declare-fun b_lambda!7809 () Bool)

(assert (=> (not b_lambda!7809) (not b!213666)))

(assert (=> b!213666 t!7999))

(declare-fun b_and!12529 () Bool)

(assert (= b_and!12527 (and (=> t!7999 result!5013) b_and!12529)))

(declare-fun m!241631 () Bool)

(assert (=> b!213669 m!241631))

(declare-fun m!241633 () Bool)

(assert (=> b!213659 m!241633))

(assert (=> bm!20237 m!241479))

(assert (=> b!213666 m!241549))

(assert (=> b!213666 m!241549))

(declare-fun m!241635 () Bool)

(assert (=> b!213666 m!241635))

(assert (=> b!213666 m!241591))

(assert (=> b!213666 m!241591))

(assert (=> b!213666 m!241567))

(assert (=> b!213666 m!241593))

(assert (=> b!213666 m!241567))

(declare-fun m!241637 () Bool)

(assert (=> bm!20236 m!241637))

(assert (=> d!58299 m!241463))

(declare-fun m!241639 () Bool)

(assert (=> b!213652 m!241639))

(assert (=> b!213652 m!241479))

(assert (=> b!213652 m!241549))

(declare-fun m!241641 () Bool)

(assert (=> b!213652 m!241641))

(declare-fun m!241643 () Bool)

(assert (=> b!213652 m!241643))

(declare-fun m!241645 () Bool)

(assert (=> b!213652 m!241645))

(assert (=> b!213652 m!241639))

(declare-fun m!241647 () Bool)

(assert (=> b!213652 m!241647))

(assert (=> b!213652 m!241643))

(declare-fun m!241649 () Bool)

(assert (=> b!213652 m!241649))

(declare-fun m!241651 () Bool)

(assert (=> b!213652 m!241651))

(declare-fun m!241653 () Bool)

(assert (=> b!213652 m!241653))

(declare-fun m!241655 () Bool)

(assert (=> b!213652 m!241655))

(assert (=> b!213652 m!241649))

(declare-fun m!241657 () Bool)

(assert (=> b!213652 m!241657))

(declare-fun m!241659 () Bool)

(assert (=> b!213652 m!241659))

(declare-fun m!241661 () Bool)

(assert (=> b!213652 m!241661))

(declare-fun m!241663 () Bool)

(assert (=> b!213652 m!241663))

(declare-fun m!241665 () Bool)

(assert (=> b!213652 m!241665))

(assert (=> b!213652 m!241651))

(declare-fun m!241667 () Bool)

(assert (=> b!213652 m!241667))

(assert (=> b!213658 m!241549))

(assert (=> b!213658 m!241549))

(assert (=> b!213658 m!241557))

(assert (=> b!213653 m!241549))

(assert (=> b!213653 m!241549))

(declare-fun m!241669 () Bool)

(assert (=> b!213653 m!241669))

(assert (=> b!213668 m!241549))

(assert (=> b!213668 m!241549))

(assert (=> b!213668 m!241557))

(declare-fun m!241671 () Bool)

(assert (=> bm!20235 m!241671))

(declare-fun m!241673 () Bool)

(assert (=> bm!20234 m!241673))

(declare-fun m!241675 () Bool)

(assert (=> b!213663 m!241675))

(assert (=> b!213454 d!58299))

(declare-fun b!213672 () Bool)

(declare-fun e!138953 () Bool)

(declare-fun e!138954 () Bool)

(assert (=> b!213672 (= e!138953 e!138954)))

(declare-fun res!104596 () Bool)

(declare-fun call!20247 () Bool)

(assert (=> b!213672 (= res!104596 call!20247)))

(assert (=> b!213672 (=> (not res!104596) (not e!138954))))

(declare-fun b!213673 () Bool)

(declare-fun e!138949 () Unit!6462)

(declare-fun lt!110509 () Unit!6462)

(assert (=> b!213673 (= e!138949 lt!110509)))

(declare-fun lt!110525 () ListLongMap!3083)

(assert (=> b!213673 (= lt!110525 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!110335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110514 () (_ BitVec 64))

(assert (=> b!213673 (= lt!110514 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110520 () (_ BitVec 64))

(assert (=> b!213673 (= lt!110520 (select (arr!4839 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110515 () Unit!6462)

(assert (=> b!213673 (= lt!110515 (addStillContains!175 lt!110525 lt!110514 zeroValue!615 lt!110520))))

(assert (=> b!213673 (contains!1403 (+!586 lt!110525 (tuple2!4169 lt!110514 zeroValue!615)) lt!110520)))

(declare-fun lt!110508 () Unit!6462)

(assert (=> b!213673 (= lt!110508 lt!110515)))

(declare-fun lt!110519 () ListLongMap!3083)

(assert (=> b!213673 (= lt!110519 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!110335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110527 () (_ BitVec 64))

(assert (=> b!213673 (= lt!110527 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110511 () (_ BitVec 64))

(assert (=> b!213673 (= lt!110511 (select (arr!4839 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110507 () Unit!6462)

(assert (=> b!213673 (= lt!110507 (addApplyDifferent!175 lt!110519 lt!110527 minValue!615 lt!110511))))

(assert (=> b!213673 (= (apply!199 (+!586 lt!110519 (tuple2!4169 lt!110527 minValue!615)) lt!110511) (apply!199 lt!110519 lt!110511))))

(declare-fun lt!110526 () Unit!6462)

(assert (=> b!213673 (= lt!110526 lt!110507)))

(declare-fun lt!110521 () ListLongMap!3083)

(assert (=> b!213673 (= lt!110521 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!110335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110528 () (_ BitVec 64))

(assert (=> b!213673 (= lt!110528 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110523 () (_ BitVec 64))

(assert (=> b!213673 (= lt!110523 (select (arr!4839 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110510 () Unit!6462)

(assert (=> b!213673 (= lt!110510 (addApplyDifferent!175 lt!110521 lt!110528 zeroValue!615 lt!110523))))

(assert (=> b!213673 (= (apply!199 (+!586 lt!110521 (tuple2!4169 lt!110528 zeroValue!615)) lt!110523) (apply!199 lt!110521 lt!110523))))

(declare-fun lt!110516 () Unit!6462)

(assert (=> b!213673 (= lt!110516 lt!110510)))

(declare-fun lt!110524 () ListLongMap!3083)

(assert (=> b!213673 (= lt!110524 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!110335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110518 () (_ BitVec 64))

(assert (=> b!213673 (= lt!110518 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110522 () (_ BitVec 64))

(assert (=> b!213673 (= lt!110522 (select (arr!4839 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213673 (= lt!110509 (addApplyDifferent!175 lt!110524 lt!110518 minValue!615 lt!110522))))

(assert (=> b!213673 (= (apply!199 (+!586 lt!110524 (tuple2!4169 lt!110518 minValue!615)) lt!110522) (apply!199 lt!110524 lt!110522))))

(declare-fun b!213674 () Bool)

(declare-fun e!138947 () Bool)

(declare-fun e!138957 () Bool)

(assert (=> b!213674 (= e!138947 e!138957)))

(declare-fun res!104590 () Bool)

(assert (=> b!213674 (=> (not res!104590) (not e!138957))))

(declare-fun lt!110513 () ListLongMap!3083)

(assert (=> b!213674 (= res!104590 (contains!1403 lt!110513 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213674 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun b!213675 () Bool)

(declare-fun e!138950 () Bool)

(declare-fun e!138958 () Bool)

(assert (=> b!213675 (= e!138950 e!138958)))

(declare-fun res!104594 () Bool)

(declare-fun call!20244 () Bool)

(assert (=> b!213675 (= res!104594 call!20244)))

(assert (=> b!213675 (=> (not res!104594) (not e!138958))))

(declare-fun b!213676 () Bool)

(declare-fun Unit!6467 () Unit!6462)

(assert (=> b!213676 (= e!138949 Unit!6467)))

(declare-fun bm!20239 () Bool)

(declare-fun call!20246 () ListLongMap!3083)

(declare-fun call!20245 () ListLongMap!3083)

(assert (=> bm!20239 (= call!20246 call!20245)))

(declare-fun b!213677 () Bool)

(declare-fun res!104588 () Bool)

(declare-fun e!138948 () Bool)

(assert (=> b!213677 (=> (not res!104588) (not e!138948))))

(assert (=> b!213677 (= res!104588 e!138950)))

(declare-fun c!35983 () Bool)

(assert (=> b!213677 (= c!35983 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!213678 () Bool)

(declare-fun e!138956 () ListLongMap!3083)

(declare-fun call!20242 () ListLongMap!3083)

(assert (=> b!213678 (= e!138956 call!20242)))

(declare-fun b!213680 () Bool)

(assert (=> b!213680 (= e!138954 (= (apply!199 lt!110513 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!213681 () Bool)

(assert (=> b!213681 (= e!138948 e!138953)))

(declare-fun c!35987 () Bool)

(assert (=> b!213681 (= c!35987 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213682 () Bool)

(declare-fun e!138952 () ListLongMap!3083)

(declare-fun call!20248 () ListLongMap!3083)

(assert (=> b!213682 (= e!138952 call!20248)))

(declare-fun b!213683 () Bool)

(declare-fun res!104595 () Bool)

(assert (=> b!213683 (=> (not res!104595) (not e!138948))))

(assert (=> b!213683 (= res!104595 e!138947)))

(declare-fun res!104591 () Bool)

(assert (=> b!213683 (=> res!104591 e!138947)))

(declare-fun e!138959 () Bool)

(assert (=> b!213683 (= res!104591 (not e!138959))))

(declare-fun res!104589 () Bool)

(assert (=> b!213683 (=> (not res!104589) (not e!138959))))

(assert (=> b!213683 (= res!104589 (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun b!213684 () Bool)

(assert (=> b!213684 (= e!138958 (= (apply!199 lt!110513 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213685 () Bool)

(assert (=> b!213685 (= e!138953 (not call!20247))))

(declare-fun bm!20240 () Bool)

(assert (=> bm!20240 (= call!20242 call!20246)))

(declare-fun b!213686 () Bool)

(assert (=> b!213686 (= e!138950 (not call!20244))))

(declare-fun b!213687 () Bool)

(assert (=> b!213687 (= e!138957 (= (apply!199 lt!110513 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)) (get!2593 (select (arr!4840 lt!110335) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5165 lt!110335)))))

(assert (=> b!213687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun b!213679 () Bool)

(declare-fun e!138955 () Bool)

(assert (=> b!213679 (= e!138955 (validKeyInArray!0 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!58301 () Bool)

(assert (=> d!58301 e!138948))

(declare-fun res!104592 () Bool)

(assert (=> d!58301 (=> (not res!104592) (not e!138948))))

(assert (=> d!58301 (= res!104592 (or (bvsge #b00000000000000000000000000000000 (size!5164 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))))

(declare-fun lt!110512 () ListLongMap!3083)

(assert (=> d!58301 (= lt!110513 lt!110512)))

(declare-fun lt!110517 () Unit!6462)

(assert (=> d!58301 (= lt!110517 e!138949)))

(declare-fun c!35982 () Bool)

(assert (=> d!58301 (= c!35982 e!138955)))

(declare-fun res!104593 () Bool)

(assert (=> d!58301 (=> (not res!104593) (not e!138955))))

(assert (=> d!58301 (= res!104593 (bvslt #b00000000000000000000000000000000 (size!5164 _keys!825)))))

(declare-fun e!138951 () ListLongMap!3083)

(assert (=> d!58301 (= lt!110512 e!138951)))

(declare-fun c!35986 () Bool)

(assert (=> d!58301 (= c!35986 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58301 (validMask!0 mask!1149)))

(assert (=> d!58301 (= (getCurrentListMap!1090 _keys!825 lt!110335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110513)))

(declare-fun b!213688 () Bool)

(declare-fun c!35985 () Bool)

(assert (=> b!213688 (= c!35985 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!213688 (= e!138952 e!138956)))

(declare-fun b!213689 () Bool)

(assert (=> b!213689 (= e!138959 (validKeyInArray!0 (select (arr!4839 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20241 () Bool)

(assert (=> bm!20241 (= call!20247 (contains!1403 lt!110513 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213690 () Bool)

(declare-fun call!20243 () ListLongMap!3083)

(assert (=> b!213690 (= e!138951 (+!586 call!20243 (tuple2!4169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!213691 () Bool)

(assert (=> b!213691 (= e!138956 call!20248)))

(declare-fun b!213692 () Bool)

(assert (=> b!213692 (= e!138951 e!138952)))

(declare-fun c!35984 () Bool)

(assert (=> b!213692 (= c!35984 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20242 () Bool)

(assert (=> bm!20242 (= call!20243 (+!586 (ite c!35986 call!20245 (ite c!35984 call!20246 call!20242)) (ite (or c!35986 c!35984) (tuple2!4169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20243 () Bool)

(assert (=> bm!20243 (= call!20244 (contains!1403 lt!110513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20244 () Bool)

(assert (=> bm!20244 (= call!20245 (getCurrentListMapNoExtraKeys!513 _keys!825 lt!110335 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun bm!20245 () Bool)

(assert (=> bm!20245 (= call!20248 call!20243)))

(assert (= (and d!58301 c!35986) b!213690))

(assert (= (and d!58301 (not c!35986)) b!213692))

(assert (= (and b!213692 c!35984) b!213682))

(assert (= (and b!213692 (not c!35984)) b!213688))

(assert (= (and b!213688 c!35985) b!213691))

(assert (= (and b!213688 (not c!35985)) b!213678))

(assert (= (or b!213691 b!213678) bm!20240))

(assert (= (or b!213682 bm!20240) bm!20239))

(assert (= (or b!213682 b!213691) bm!20245))

(assert (= (or b!213690 bm!20239) bm!20244))

(assert (= (or b!213690 bm!20245) bm!20242))

(assert (= (and d!58301 res!104593) b!213679))

(assert (= (and d!58301 c!35982) b!213673))

(assert (= (and d!58301 (not c!35982)) b!213676))

(assert (= (and d!58301 res!104592) b!213683))

(assert (= (and b!213683 res!104589) b!213689))

(assert (= (and b!213683 (not res!104591)) b!213674))

(assert (= (and b!213674 res!104590) b!213687))

(assert (= (and b!213683 res!104595) b!213677))

(assert (= (and b!213677 c!35983) b!213675))

(assert (= (and b!213677 (not c!35983)) b!213686))

(assert (= (and b!213675 res!104594) b!213684))

(assert (= (or b!213675 b!213686) bm!20243))

(assert (= (and b!213677 res!104588) b!213681))

(assert (= (and b!213681 c!35987) b!213672))

(assert (= (and b!213681 (not c!35987)) b!213685))

(assert (= (and b!213672 res!104596) b!213680))

(assert (= (or b!213672 b!213685) bm!20241))

(declare-fun b_lambda!7811 () Bool)

(assert (=> (not b_lambda!7811) (not b!213687)))

(assert (=> b!213687 t!7999))

(declare-fun b_and!12531 () Bool)

(assert (= b_and!12529 (and (=> t!7999 result!5013) b_and!12531)))

(declare-fun m!241677 () Bool)

(assert (=> b!213690 m!241677))

(declare-fun m!241679 () Bool)

(assert (=> b!213680 m!241679))

(assert (=> bm!20244 m!241475))

(assert (=> b!213687 m!241549))

(assert (=> b!213687 m!241549))

(declare-fun m!241681 () Bool)

(assert (=> b!213687 m!241681))

(assert (=> b!213687 m!241565))

(assert (=> b!213687 m!241565))

(assert (=> b!213687 m!241567))

(assert (=> b!213687 m!241569))

(assert (=> b!213687 m!241567))

(declare-fun m!241683 () Bool)

(assert (=> bm!20243 m!241683))

(assert (=> d!58301 m!241463))

(declare-fun m!241685 () Bool)

(assert (=> b!213673 m!241685))

(assert (=> b!213673 m!241475))

(assert (=> b!213673 m!241549))

(declare-fun m!241687 () Bool)

(assert (=> b!213673 m!241687))

(declare-fun m!241689 () Bool)

(assert (=> b!213673 m!241689))

(declare-fun m!241691 () Bool)

(assert (=> b!213673 m!241691))

(assert (=> b!213673 m!241685))

(declare-fun m!241693 () Bool)

(assert (=> b!213673 m!241693))

(assert (=> b!213673 m!241689))

(declare-fun m!241695 () Bool)

(assert (=> b!213673 m!241695))

(declare-fun m!241697 () Bool)

(assert (=> b!213673 m!241697))

(declare-fun m!241699 () Bool)

(assert (=> b!213673 m!241699))

(declare-fun m!241701 () Bool)

(assert (=> b!213673 m!241701))

(assert (=> b!213673 m!241695))

(declare-fun m!241703 () Bool)

(assert (=> b!213673 m!241703))

(declare-fun m!241705 () Bool)

(assert (=> b!213673 m!241705))

(declare-fun m!241707 () Bool)

(assert (=> b!213673 m!241707))

(declare-fun m!241709 () Bool)

(assert (=> b!213673 m!241709))

(declare-fun m!241711 () Bool)

(assert (=> b!213673 m!241711))

(assert (=> b!213673 m!241697))

(declare-fun m!241713 () Bool)

(assert (=> b!213673 m!241713))

(assert (=> b!213679 m!241549))

(assert (=> b!213679 m!241549))

(assert (=> b!213679 m!241557))

(assert (=> b!213674 m!241549))

(assert (=> b!213674 m!241549))

(declare-fun m!241715 () Bool)

(assert (=> b!213674 m!241715))

(assert (=> b!213689 m!241549))

(assert (=> b!213689 m!241549))

(assert (=> b!213689 m!241557))

(declare-fun m!241717 () Bool)

(assert (=> bm!20242 m!241717))

(declare-fun m!241719 () Bool)

(assert (=> bm!20241 m!241719))

(declare-fun m!241721 () Bool)

(assert (=> b!213684 m!241721))

(assert (=> b!213454 d!58301))

(declare-fun b!213699 () Bool)

(declare-fun e!138965 () Bool)

(assert (=> b!213699 (= e!138965 tp_is_empty!5497)))

(declare-fun b!213700 () Bool)

(declare-fun e!138964 () Bool)

(assert (=> b!213700 (= e!138964 tp_is_empty!5497)))

(declare-fun mapNonEmpty!9353 () Bool)

(declare-fun mapRes!9353 () Bool)

(declare-fun tp!19991 () Bool)

(assert (=> mapNonEmpty!9353 (= mapRes!9353 (and tp!19991 e!138965))))

(declare-fun mapValue!9353 () ValueCell!2405)

(declare-fun mapKey!9353 () (_ BitVec 32))

(declare-fun mapRest!9353 () (Array (_ BitVec 32) ValueCell!2405))

(assert (=> mapNonEmpty!9353 (= mapRest!9344 (store mapRest!9353 mapKey!9353 mapValue!9353))))

(declare-fun condMapEmpty!9353 () Bool)

(declare-fun mapDefault!9353 () ValueCell!2405)

(assert (=> mapNonEmpty!9344 (= condMapEmpty!9353 (= mapRest!9344 ((as const (Array (_ BitVec 32) ValueCell!2405)) mapDefault!9353)))))

(assert (=> mapNonEmpty!9344 (= tp!19976 (and e!138964 mapRes!9353))))

(declare-fun mapIsEmpty!9353 () Bool)

(assert (=> mapIsEmpty!9353 mapRes!9353))

(assert (= (and mapNonEmpty!9344 condMapEmpty!9353) mapIsEmpty!9353))

(assert (= (and mapNonEmpty!9344 (not condMapEmpty!9353)) mapNonEmpty!9353))

(assert (= (and mapNonEmpty!9353 ((_ is ValueCellFull!2405) mapValue!9353)) b!213699))

(assert (= (and mapNonEmpty!9344 ((_ is ValueCellFull!2405) mapDefault!9353)) b!213700))

(declare-fun m!241723 () Bool)

(assert (=> mapNonEmpty!9353 m!241723))

(declare-fun b_lambda!7813 () Bool)

(assert (= b_lambda!7809 (or (and start!21188 b_free!5635) b_lambda!7813)))

(declare-fun b_lambda!7815 () Bool)

(assert (= b_lambda!7805 (or (and start!21188 b_free!5635) b_lambda!7815)))

(declare-fun b_lambda!7817 () Bool)

(assert (= b_lambda!7811 (or (and start!21188 b_free!5635) b_lambda!7817)))

(declare-fun b_lambda!7819 () Bool)

(assert (= b_lambda!7803 (or (and start!21188 b_free!5635) b_lambda!7819)))

(declare-fun b_lambda!7821 () Bool)

(assert (= b_lambda!7801 (or (and start!21188 b_free!5635) b_lambda!7821)))

(declare-fun b_lambda!7823 () Bool)

(assert (= b_lambda!7807 (or (and start!21188 b_free!5635) b_lambda!7823)))

(check-sat b_and!12531 (not b!213574) (not b!213590) (not b!213528) (not d!58293) (not b!213582) (not bm!20217) (not b!213539) (not b!213568) (not bm!20237) (not mapNonEmpty!9353) (not b_lambda!7821) (not bm!20242) (not b!213570) (not bm!20210) (not d!58299) (not b!213587) (not bm!20235) (not bm!20236) (not bm!20204) (not b!213680) (not b_lambda!7817) (not b!213527) (not bm!20234) (not b!213679) (not b!213652) (not b!213579) (not b!213607) (not b_lambda!7823) (not b!213601) (not bm!20211) (not b!213542) (not b!213608) (not bm!20243) (not b!213690) tp_is_empty!5497 (not d!58295) (not bm!20216) (not bm!20244) (not bm!20241) (not b!213673) (not d!58301) (not b!213653) (not b!213541) (not b!213588) (not b_lambda!7813) (not b!213687) (not b!213689) (not d!58291) (not b!213669) (not b!213573) (not b!213571) (not b!213584) (not b!213593) (not b!213591) (not b_next!5635) (not b!213576) (not bm!20207) (not b_lambda!7819) (not b!213585) (not b!213674) (not b!213659) (not b_lambda!7815) (not b!213577) (not b!213666) (not b!213684) (not d!58297) (not b!213658) (not b!213663) (not b!213668))
(check-sat b_and!12531 (not b_next!5635))
