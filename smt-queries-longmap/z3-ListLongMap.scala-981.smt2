; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21186 () Bool)

(assert start!21186)

(declare-fun b_free!5637 () Bool)

(declare-fun b_next!5637 () Bool)

(assert (=> start!21186 (= b_free!5637 (not b_next!5637))))

(declare-fun tp!19981 () Bool)

(declare-fun b_and!12503 () Bool)

(assert (=> start!21186 (= tp!19981 b_and!12503)))

(declare-fun b!213430 () Bool)

(declare-fun res!104478 () Bool)

(declare-fun e!138810 () Bool)

(assert (=> b!213430 (=> (not res!104478) (not e!138810))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213430 (= res!104478 (validKeyInArray!0 k0!843))))

(declare-fun b!213431 () Bool)

(declare-fun res!104476 () Bool)

(assert (=> b!213431 (=> (not res!104476) (not e!138810))))

(declare-datatypes ((array!10201 0))(
  ( (array!10202 (arr!4841 (Array (_ BitVec 32) (_ BitVec 64))) (size!5166 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10201)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10201 (_ BitVec 32)) Bool)

(assert (=> b!213431 (= res!104476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!213432 () Bool)

(declare-fun res!104475 () Bool)

(assert (=> b!213432 (=> (not res!104475) (not e!138810))))

(declare-datatypes ((List!3117 0))(
  ( (Nil!3114) (Cons!3113 (h!3755 (_ BitVec 64)) (t!8068 List!3117)) )
))
(declare-fun arrayNoDuplicates!0 (array!10201 (_ BitVec 32) List!3117) Bool)

(assert (=> b!213432 (= res!104475 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3114))))

(declare-fun b!213433 () Bool)

(declare-fun e!138809 () Bool)

(declare-fun tp_is_empty!5499 () Bool)

(assert (=> b!213433 (= e!138809 tp_is_empty!5499)))

(declare-fun b!213434 () Bool)

(declare-fun e!138807 () Bool)

(assert (=> b!213434 (= e!138807 tp_is_empty!5499)))

(declare-fun b!213435 () Bool)

(declare-fun res!104477 () Bool)

(assert (=> b!213435 (=> (not res!104477) (not e!138810))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6979 0))(
  ( (V!6980 (val!2794 Int)) )
))
(declare-datatypes ((ValueCell!2406 0))(
  ( (ValueCellFull!2406 (v!4804 V!6979)) (EmptyCell!2406) )
))
(declare-datatypes ((array!10203 0))(
  ( (array!10204 (arr!4842 (Array (_ BitVec 32) ValueCell!2406)) (size!5167 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10203)

(assert (=> b!213435 (= res!104477 (and (= (size!5167 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5166 _keys!825) (size!5167 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun lt!110302 () Bool)

(declare-fun b!213436 () Bool)

(declare-datatypes ((tuple2!4232 0))(
  ( (tuple2!4233 (_1!2127 (_ BitVec 64)) (_2!2127 V!6979)) )
))
(declare-datatypes ((List!3118 0))(
  ( (Nil!3115) (Cons!3114 (h!3756 tuple2!4232) (t!8069 List!3118)) )
))
(declare-datatypes ((ListLongMap!3145 0))(
  ( (ListLongMap!3146 (toList!1588 List!3118)) )
))
(declare-fun lt!110299 () ListLongMap!3145)

(declare-fun lt!110300 () ListLongMap!3145)

(assert (=> b!213436 (= e!138810 (not (or (and (not lt!110302) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!110302) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!110302) (= lt!110300 lt!110299))))))

(assert (=> b!213436 (= lt!110302 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!110301 () ListLongMap!3145)

(declare-fun zeroValue!615 () V!6979)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6979)

(declare-fun getCurrentListMap!1116 (array!10201 array!10203 (_ BitVec 32) (_ BitVec 32) V!6979 V!6979 (_ BitVec 32) Int) ListLongMap!3145)

(assert (=> b!213436 (= lt!110301 (getCurrentListMap!1116 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110305 () array!10203)

(assert (=> b!213436 (= lt!110300 (getCurrentListMap!1116 _keys!825 lt!110305 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110304 () ListLongMap!3145)

(assert (=> b!213436 (and (= lt!110299 lt!110304) (= lt!110304 lt!110299))))

(declare-fun lt!110303 () ListLongMap!3145)

(declare-fun v!520 () V!6979)

(declare-fun +!591 (ListLongMap!3145 tuple2!4232) ListLongMap!3145)

(assert (=> b!213436 (= lt!110304 (+!591 lt!110303 (tuple2!4233 k0!843 v!520)))))

(declare-datatypes ((Unit!6474 0))(
  ( (Unit!6475) )
))
(declare-fun lt!110298 () Unit!6474)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!233 (array!10201 array!10203 (_ BitVec 32) (_ BitVec 32) V!6979 V!6979 (_ BitVec 32) (_ BitVec 64) V!6979 (_ BitVec 32) Int) Unit!6474)

(assert (=> b!213436 (= lt!110298 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!233 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!518 (array!10201 array!10203 (_ BitVec 32) (_ BitVec 32) V!6979 V!6979 (_ BitVec 32) Int) ListLongMap!3145)

(assert (=> b!213436 (= lt!110299 (getCurrentListMapNoExtraKeys!518 _keys!825 lt!110305 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213436 (= lt!110305 (array!10204 (store (arr!4842 _values!649) i!601 (ValueCellFull!2406 v!520)) (size!5167 _values!649)))))

(assert (=> b!213436 (= lt!110303 (getCurrentListMapNoExtraKeys!518 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!104474 () Bool)

(assert (=> start!21186 (=> (not res!104474) (not e!138810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21186 (= res!104474 (validMask!0 mask!1149))))

(assert (=> start!21186 e!138810))

(declare-fun e!138808 () Bool)

(declare-fun array_inv!3201 (array!10203) Bool)

(assert (=> start!21186 (and (array_inv!3201 _values!649) e!138808)))

(assert (=> start!21186 true))

(assert (=> start!21186 tp_is_empty!5499))

(declare-fun array_inv!3202 (array!10201) Bool)

(assert (=> start!21186 (array_inv!3202 _keys!825)))

(assert (=> start!21186 tp!19981))

(declare-fun b!213437 () Bool)

(declare-fun res!104472 () Bool)

(assert (=> b!213437 (=> (not res!104472) (not e!138810))))

(assert (=> b!213437 (= res!104472 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5166 _keys!825))))))

(declare-fun b!213438 () Bool)

(declare-fun res!104473 () Bool)

(assert (=> b!213438 (=> (not res!104473) (not e!138810))))

(assert (=> b!213438 (= res!104473 (= (select (arr!4841 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!9347 () Bool)

(declare-fun mapRes!9347 () Bool)

(assert (=> mapIsEmpty!9347 mapRes!9347))

(declare-fun mapNonEmpty!9347 () Bool)

(declare-fun tp!19982 () Bool)

(assert (=> mapNonEmpty!9347 (= mapRes!9347 (and tp!19982 e!138809))))

(declare-fun mapRest!9347 () (Array (_ BitVec 32) ValueCell!2406))

(declare-fun mapKey!9347 () (_ BitVec 32))

(declare-fun mapValue!9347 () ValueCell!2406)

(assert (=> mapNonEmpty!9347 (= (arr!4842 _values!649) (store mapRest!9347 mapKey!9347 mapValue!9347))))

(declare-fun b!213439 () Bool)

(assert (=> b!213439 (= e!138808 (and e!138807 mapRes!9347))))

(declare-fun condMapEmpty!9347 () Bool)

(declare-fun mapDefault!9347 () ValueCell!2406)

(assert (=> b!213439 (= condMapEmpty!9347 (= (arr!4842 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2406)) mapDefault!9347)))))

(assert (= (and start!21186 res!104474) b!213435))

(assert (= (and b!213435 res!104477) b!213431))

(assert (= (and b!213431 res!104476) b!213432))

(assert (= (and b!213432 res!104475) b!213437))

(assert (= (and b!213437 res!104472) b!213430))

(assert (= (and b!213430 res!104478) b!213438))

(assert (= (and b!213438 res!104473) b!213436))

(assert (= (and b!213439 condMapEmpty!9347) mapIsEmpty!9347))

(assert (= (and b!213439 (not condMapEmpty!9347)) mapNonEmpty!9347))

(get-info :version)

(assert (= (and mapNonEmpty!9347 ((_ is ValueCellFull!2406) mapValue!9347)) b!213433))

(assert (= (and b!213439 ((_ is ValueCellFull!2406) mapDefault!9347)) b!213434))

(assert (= start!21186 b!213439))

(declare-fun m!241305 () Bool)

(assert (=> start!21186 m!241305))

(declare-fun m!241307 () Bool)

(assert (=> start!21186 m!241307))

(declare-fun m!241309 () Bool)

(assert (=> start!21186 m!241309))

(declare-fun m!241311 () Bool)

(assert (=> b!213430 m!241311))

(declare-fun m!241313 () Bool)

(assert (=> b!213432 m!241313))

(declare-fun m!241315 () Bool)

(assert (=> mapNonEmpty!9347 m!241315))

(declare-fun m!241317 () Bool)

(assert (=> b!213436 m!241317))

(declare-fun m!241319 () Bool)

(assert (=> b!213436 m!241319))

(declare-fun m!241321 () Bool)

(assert (=> b!213436 m!241321))

(declare-fun m!241323 () Bool)

(assert (=> b!213436 m!241323))

(declare-fun m!241325 () Bool)

(assert (=> b!213436 m!241325))

(declare-fun m!241327 () Bool)

(assert (=> b!213436 m!241327))

(declare-fun m!241329 () Bool)

(assert (=> b!213436 m!241329))

(declare-fun m!241331 () Bool)

(assert (=> b!213431 m!241331))

(declare-fun m!241333 () Bool)

(assert (=> b!213438 m!241333))

(check-sat (not b!213431) (not mapNonEmpty!9347) (not b!213430) tp_is_empty!5499 (not start!21186) b_and!12503 (not b!213436) (not b!213432) (not b_next!5637))
(check-sat b_and!12503 (not b_next!5637))
(get-model)

(declare-fun b!213480 () Bool)

(declare-fun e!138837 () Bool)

(declare-fun contains!1419 (List!3117 (_ BitVec 64)) Bool)

(assert (=> b!213480 (= e!138837 (contains!1419 Nil!3114 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213481 () Bool)

(declare-fun e!138834 () Bool)

(declare-fun e!138836 () Bool)

(assert (=> b!213481 (= e!138834 e!138836)))

(declare-fun res!104507 () Bool)

(assert (=> b!213481 (=> (not res!104507) (not e!138836))))

(assert (=> b!213481 (= res!104507 (not e!138837))))

(declare-fun res!104508 () Bool)

(assert (=> b!213481 (=> (not res!104508) (not e!138837))))

(assert (=> b!213481 (= res!104508 (validKeyInArray!0 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20216 () Bool)

(declare-fun call!20219 () Bool)

(declare-fun c!35928 () Bool)

(assert (=> bm!20216 (= call!20219 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35928 (Cons!3113 (select (arr!4841 _keys!825) #b00000000000000000000000000000000) Nil!3114) Nil!3114)))))

(declare-fun b!213483 () Bool)

(declare-fun e!138835 () Bool)

(assert (=> b!213483 (= e!138836 e!138835)))

(assert (=> b!213483 (= c!35928 (validKeyInArray!0 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213484 () Bool)

(assert (=> b!213484 (= e!138835 call!20219)))

(declare-fun b!213482 () Bool)

(assert (=> b!213482 (= e!138835 call!20219)))

(declare-fun d!58205 () Bool)

(declare-fun res!104506 () Bool)

(assert (=> d!58205 (=> res!104506 e!138834)))

(assert (=> d!58205 (= res!104506 (bvsge #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(assert (=> d!58205 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3114) e!138834)))

(assert (= (and d!58205 (not res!104506)) b!213481))

(assert (= (and b!213481 res!104508) b!213480))

(assert (= (and b!213481 res!104507) b!213483))

(assert (= (and b!213483 c!35928) b!213482))

(assert (= (and b!213483 (not c!35928)) b!213484))

(assert (= (or b!213482 b!213484) bm!20216))

(declare-fun m!241365 () Bool)

(assert (=> b!213480 m!241365))

(assert (=> b!213480 m!241365))

(declare-fun m!241367 () Bool)

(assert (=> b!213480 m!241367))

(assert (=> b!213481 m!241365))

(assert (=> b!213481 m!241365))

(declare-fun m!241369 () Bool)

(assert (=> b!213481 m!241369))

(assert (=> bm!20216 m!241365))

(declare-fun m!241371 () Bool)

(assert (=> bm!20216 m!241371))

(assert (=> b!213483 m!241365))

(assert (=> b!213483 m!241365))

(assert (=> b!213483 m!241369))

(assert (=> b!213432 d!58205))

(declare-fun b!213509 () Bool)

(declare-fun lt!110344 () Unit!6474)

(declare-fun lt!110349 () Unit!6474)

(assert (=> b!213509 (= lt!110344 lt!110349)))

(declare-fun lt!110345 () ListLongMap!3145)

(declare-fun lt!110348 () (_ BitVec 64))

(declare-fun lt!110350 () V!6979)

(declare-fun lt!110346 () (_ BitVec 64))

(declare-fun contains!1420 (ListLongMap!3145 (_ BitVec 64)) Bool)

(assert (=> b!213509 (not (contains!1420 (+!591 lt!110345 (tuple2!4233 lt!110346 lt!110350)) lt!110348))))

(declare-fun addStillNotContains!108 (ListLongMap!3145 (_ BitVec 64) V!6979 (_ BitVec 64)) Unit!6474)

(assert (=> b!213509 (= lt!110349 (addStillNotContains!108 lt!110345 lt!110346 lt!110350 lt!110348))))

(assert (=> b!213509 (= lt!110348 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!2587 (ValueCell!2406 V!6979) V!6979)

(declare-fun dynLambda!542 (Int (_ BitVec 64)) V!6979)

(assert (=> b!213509 (= lt!110350 (get!2587 (select (arr!4842 _values!649) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213509 (= lt!110346 (select (arr!4841 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!20222 () ListLongMap!3145)

(assert (=> b!213509 (= lt!110345 call!20222)))

(declare-fun e!138858 () ListLongMap!3145)

(assert (=> b!213509 (= e!138858 (+!591 call!20222 (tuple2!4233 (select (arr!4841 _keys!825) #b00000000000000000000000000000000) (get!2587 (select (arr!4842 _values!649) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213510 () Bool)

(declare-fun e!138856 () ListLongMap!3145)

(assert (=> b!213510 (= e!138856 (ListLongMap!3146 Nil!3115))))

(declare-fun b!213511 () Bool)

(declare-fun res!104517 () Bool)

(declare-fun e!138855 () Bool)

(assert (=> b!213511 (=> (not res!104517) (not e!138855))))

(declare-fun lt!110347 () ListLongMap!3145)

(assert (=> b!213511 (= res!104517 (not (contains!1420 lt!110347 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!213512 () Bool)

(declare-fun e!138853 () Bool)

(assert (=> b!213512 (= e!138853 (= lt!110347 (getCurrentListMapNoExtraKeys!518 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!213513 () Bool)

(declare-fun isEmpty!500 (ListLongMap!3145) Bool)

(assert (=> b!213513 (= e!138853 (isEmpty!500 lt!110347))))

(declare-fun b!213514 () Bool)

(assert (=> b!213514 (= e!138856 e!138858)))

(declare-fun c!35939 () Bool)

(assert (=> b!213514 (= c!35939 (validKeyInArray!0 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213515 () Bool)

(declare-fun e!138852 () Bool)

(assert (=> b!213515 (= e!138855 e!138852)))

(declare-fun c!35940 () Bool)

(declare-fun e!138854 () Bool)

(assert (=> b!213515 (= c!35940 e!138854)))

(declare-fun res!104518 () Bool)

(assert (=> b!213515 (=> (not res!104518) (not e!138854))))

(assert (=> b!213515 (= res!104518 (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun b!213516 () Bool)

(assert (=> b!213516 (= e!138852 e!138853)))

(declare-fun c!35938 () Bool)

(assert (=> b!213516 (= c!35938 (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun b!213517 () Bool)

(assert (=> b!213517 (= e!138858 call!20222)))

(declare-fun bm!20219 () Bool)

(assert (=> bm!20219 (= call!20222 (getCurrentListMapNoExtraKeys!518 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun d!58207 () Bool)

(assert (=> d!58207 e!138855))

(declare-fun res!104520 () Bool)

(assert (=> d!58207 (=> (not res!104520) (not e!138855))))

(assert (=> d!58207 (= res!104520 (not (contains!1420 lt!110347 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58207 (= lt!110347 e!138856)))

(declare-fun c!35937 () Bool)

(assert (=> d!58207 (= c!35937 (bvsge #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(assert (=> d!58207 (validMask!0 mask!1149)))

(assert (=> d!58207 (= (getCurrentListMapNoExtraKeys!518 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110347)))

(declare-fun b!213518 () Bool)

(assert (=> b!213518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(assert (=> b!213518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5167 _values!649)))))

(declare-fun e!138857 () Bool)

(declare-fun apply!199 (ListLongMap!3145 (_ BitVec 64)) V!6979)

(assert (=> b!213518 (= e!138857 (= (apply!199 lt!110347 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)) (get!2587 (select (arr!4842 _values!649) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213519 () Bool)

(assert (=> b!213519 (= e!138852 e!138857)))

(assert (=> b!213519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun res!104519 () Bool)

(assert (=> b!213519 (= res!104519 (contains!1420 lt!110347 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213519 (=> (not res!104519) (not e!138857))))

(declare-fun b!213520 () Bool)

(assert (=> b!213520 (= e!138854 (validKeyInArray!0 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213520 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!58207 c!35937) b!213510))

(assert (= (and d!58207 (not c!35937)) b!213514))

(assert (= (and b!213514 c!35939) b!213509))

(assert (= (and b!213514 (not c!35939)) b!213517))

(assert (= (or b!213509 b!213517) bm!20219))

(assert (= (and d!58207 res!104520) b!213511))

(assert (= (and b!213511 res!104517) b!213515))

(assert (= (and b!213515 res!104518) b!213520))

(assert (= (and b!213515 c!35940) b!213519))

(assert (= (and b!213515 (not c!35940)) b!213516))

(assert (= (and b!213519 res!104519) b!213518))

(assert (= (and b!213516 c!35938) b!213512))

(assert (= (and b!213516 (not c!35938)) b!213513))

(declare-fun b_lambda!7779 () Bool)

(assert (=> (not b_lambda!7779) (not b!213509)))

(declare-fun t!8071 () Bool)

(declare-fun tb!2911 () Bool)

(assert (=> (and start!21186 (= defaultEntry!657 defaultEntry!657) t!8071) tb!2911))

(declare-fun result!5021 () Bool)

(assert (=> tb!2911 (= result!5021 tp_is_empty!5499)))

(assert (=> b!213509 t!8071))

(declare-fun b_and!12507 () Bool)

(assert (= b_and!12503 (and (=> t!8071 result!5021) b_and!12507)))

(declare-fun b_lambda!7781 () Bool)

(assert (=> (not b_lambda!7781) (not b!213518)))

(assert (=> b!213518 t!8071))

(declare-fun b_and!12509 () Bool)

(assert (= b_and!12507 (and (=> t!8071 result!5021) b_and!12509)))

(assert (=> b!213514 m!241365))

(assert (=> b!213514 m!241365))

(assert (=> b!213514 m!241369))

(assert (=> b!213519 m!241365))

(assert (=> b!213519 m!241365))

(declare-fun m!241373 () Bool)

(assert (=> b!213519 m!241373))

(assert (=> b!213520 m!241365))

(assert (=> b!213520 m!241365))

(assert (=> b!213520 m!241369))

(declare-fun m!241375 () Bool)

(assert (=> b!213518 m!241375))

(declare-fun m!241377 () Bool)

(assert (=> b!213518 m!241377))

(assert (=> b!213518 m!241365))

(declare-fun m!241379 () Bool)

(assert (=> b!213518 m!241379))

(assert (=> b!213518 m!241365))

(assert (=> b!213518 m!241377))

(assert (=> b!213518 m!241375))

(declare-fun m!241381 () Bool)

(assert (=> b!213518 m!241381))

(declare-fun m!241383 () Bool)

(assert (=> d!58207 m!241383))

(assert (=> d!58207 m!241305))

(declare-fun m!241385 () Bool)

(assert (=> b!213513 m!241385))

(declare-fun m!241387 () Bool)

(assert (=> bm!20219 m!241387))

(declare-fun m!241389 () Bool)

(assert (=> b!213511 m!241389))

(assert (=> b!213512 m!241387))

(declare-fun m!241391 () Bool)

(assert (=> b!213509 m!241391))

(declare-fun m!241393 () Bool)

(assert (=> b!213509 m!241393))

(assert (=> b!213509 m!241375))

(declare-fun m!241395 () Bool)

(assert (=> b!213509 m!241395))

(declare-fun m!241397 () Bool)

(assert (=> b!213509 m!241397))

(assert (=> b!213509 m!241377))

(assert (=> b!213509 m!241395))

(assert (=> b!213509 m!241365))

(assert (=> b!213509 m!241377))

(assert (=> b!213509 m!241375))

(assert (=> b!213509 m!241381))

(assert (=> b!213436 d!58207))

(declare-fun e!138893 () Bool)

(declare-fun lt!110408 () ListLongMap!3145)

(declare-fun b!213565 () Bool)

(assert (=> b!213565 (= e!138893 (= (apply!199 lt!110408 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)) (get!2587 (select (arr!4842 lt!110305) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5167 lt!110305)))))

(assert (=> b!213565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun b!213566 () Bool)

(declare-fun e!138895 () Unit!6474)

(declare-fun lt!110395 () Unit!6474)

(assert (=> b!213566 (= e!138895 lt!110395)))

(declare-fun lt!110397 () ListLongMap!3145)

(assert (=> b!213566 (= lt!110397 (getCurrentListMapNoExtraKeys!518 _keys!825 lt!110305 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110405 () (_ BitVec 64))

(assert (=> b!213566 (= lt!110405 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110402 () (_ BitVec 64))

(assert (=> b!213566 (= lt!110402 (select (arr!4841 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110409 () Unit!6474)

(declare-fun addStillContains!175 (ListLongMap!3145 (_ BitVec 64) V!6979 (_ BitVec 64)) Unit!6474)

(assert (=> b!213566 (= lt!110409 (addStillContains!175 lt!110397 lt!110405 zeroValue!615 lt!110402))))

(assert (=> b!213566 (contains!1420 (+!591 lt!110397 (tuple2!4233 lt!110405 zeroValue!615)) lt!110402)))

(declare-fun lt!110406 () Unit!6474)

(assert (=> b!213566 (= lt!110406 lt!110409)))

(declare-fun lt!110396 () ListLongMap!3145)

(assert (=> b!213566 (= lt!110396 (getCurrentListMapNoExtraKeys!518 _keys!825 lt!110305 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110400 () (_ BitVec 64))

(assert (=> b!213566 (= lt!110400 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110404 () (_ BitVec 64))

(assert (=> b!213566 (= lt!110404 (select (arr!4841 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110414 () Unit!6474)

(declare-fun addApplyDifferent!175 (ListLongMap!3145 (_ BitVec 64) V!6979 (_ BitVec 64)) Unit!6474)

(assert (=> b!213566 (= lt!110414 (addApplyDifferent!175 lt!110396 lt!110400 minValue!615 lt!110404))))

(assert (=> b!213566 (= (apply!199 (+!591 lt!110396 (tuple2!4233 lt!110400 minValue!615)) lt!110404) (apply!199 lt!110396 lt!110404))))

(declare-fun lt!110413 () Unit!6474)

(assert (=> b!213566 (= lt!110413 lt!110414)))

(declare-fun lt!110415 () ListLongMap!3145)

(assert (=> b!213566 (= lt!110415 (getCurrentListMapNoExtraKeys!518 _keys!825 lt!110305 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110411 () (_ BitVec 64))

(assert (=> b!213566 (= lt!110411 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110398 () (_ BitVec 64))

(assert (=> b!213566 (= lt!110398 (select (arr!4841 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110403 () Unit!6474)

(assert (=> b!213566 (= lt!110403 (addApplyDifferent!175 lt!110415 lt!110411 zeroValue!615 lt!110398))))

(assert (=> b!213566 (= (apply!199 (+!591 lt!110415 (tuple2!4233 lt!110411 zeroValue!615)) lt!110398) (apply!199 lt!110415 lt!110398))))

(declare-fun lt!110410 () Unit!6474)

(assert (=> b!213566 (= lt!110410 lt!110403)))

(declare-fun lt!110399 () ListLongMap!3145)

(assert (=> b!213566 (= lt!110399 (getCurrentListMapNoExtraKeys!518 _keys!825 lt!110305 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110412 () (_ BitVec 64))

(assert (=> b!213566 (= lt!110412 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110416 () (_ BitVec 64))

(assert (=> b!213566 (= lt!110416 (select (arr!4841 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213566 (= lt!110395 (addApplyDifferent!175 lt!110399 lt!110412 minValue!615 lt!110416))))

(assert (=> b!213566 (= (apply!199 (+!591 lt!110399 (tuple2!4233 lt!110412 minValue!615)) lt!110416) (apply!199 lt!110399 lt!110416))))

(declare-fun bm!20234 () Bool)

(declare-fun call!20238 () ListLongMap!3145)

(declare-fun call!20243 () ListLongMap!3145)

(assert (=> bm!20234 (= call!20238 call!20243)))

(declare-fun b!213567 () Bool)

(declare-fun e!138888 () ListLongMap!3145)

(declare-fun call!20240 () ListLongMap!3145)

(assert (=> b!213567 (= e!138888 call!20240)))

(declare-fun d!58209 () Bool)

(declare-fun e!138891 () Bool)

(assert (=> d!58209 e!138891))

(declare-fun res!104542 () Bool)

(assert (=> d!58209 (=> (not res!104542) (not e!138891))))

(assert (=> d!58209 (= res!104542 (or (bvsge #b00000000000000000000000000000000 (size!5166 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))))

(declare-fun lt!110407 () ListLongMap!3145)

(assert (=> d!58209 (= lt!110408 lt!110407)))

(declare-fun lt!110401 () Unit!6474)

(assert (=> d!58209 (= lt!110401 e!138895)))

(declare-fun c!35953 () Bool)

(declare-fun e!138885 () Bool)

(assert (=> d!58209 (= c!35953 e!138885)))

(declare-fun res!104547 () Bool)

(assert (=> d!58209 (=> (not res!104547) (not e!138885))))

(assert (=> d!58209 (= res!104547 (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun e!138894 () ListLongMap!3145)

(assert (=> d!58209 (= lt!110407 e!138894)))

(declare-fun c!35956 () Bool)

(assert (=> d!58209 (= c!35956 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58209 (validMask!0 mask!1149)))

(assert (=> d!58209 (= (getCurrentListMap!1116 _keys!825 lt!110305 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110408)))

(declare-fun bm!20235 () Bool)

(declare-fun call!20237 () Bool)

(assert (=> bm!20235 (= call!20237 (contains!1420 lt!110408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213568 () Bool)

(declare-fun res!104540 () Bool)

(assert (=> b!213568 (=> (not res!104540) (not e!138891))))

(declare-fun e!138892 () Bool)

(assert (=> b!213568 (= res!104540 e!138892)))

(declare-fun c!35954 () Bool)

(assert (=> b!213568 (= c!35954 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!213569 () Bool)

(declare-fun e!138889 () ListLongMap!3145)

(assert (=> b!213569 (= e!138889 call!20240)))

(declare-fun b!213570 () Bool)

(assert (=> b!213570 (= e!138894 e!138889)))

(declare-fun c!35955 () Bool)

(assert (=> b!213570 (= c!35955 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213571 () Bool)

(declare-fun e!138897 () Bool)

(assert (=> b!213571 (= e!138897 (validKeyInArray!0 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20236 () Bool)

(declare-fun call!20241 () ListLongMap!3145)

(assert (=> bm!20236 (= call!20241 call!20238)))

(declare-fun bm!20237 () Bool)

(declare-fun call!20242 () ListLongMap!3145)

(assert (=> bm!20237 (= call!20242 (+!591 (ite c!35956 call!20243 (ite c!35955 call!20238 call!20241)) (ite (or c!35956 c!35955) (tuple2!4233 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4233 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20238 () Bool)

(declare-fun call!20239 () Bool)

(assert (=> bm!20238 (= call!20239 (contains!1420 lt!110408 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213572 () Bool)

(assert (=> b!213572 (= e!138888 call!20241)))

(declare-fun b!213573 () Bool)

(declare-fun e!138887 () Bool)

(assert (=> b!213573 (= e!138887 e!138893)))

(declare-fun res!104544 () Bool)

(assert (=> b!213573 (=> (not res!104544) (not e!138893))))

(assert (=> b!213573 (= res!104544 (contains!1420 lt!110408 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213573 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun b!213574 () Bool)

(assert (=> b!213574 (= e!138894 (+!591 call!20242 (tuple2!4233 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!213575 () Bool)

(declare-fun e!138896 () Bool)

(assert (=> b!213575 (= e!138892 e!138896)))

(declare-fun res!104546 () Bool)

(assert (=> b!213575 (= res!104546 call!20237)))

(assert (=> b!213575 (=> (not res!104546) (not e!138896))))

(declare-fun b!213576 () Bool)

(assert (=> b!213576 (= e!138896 (= (apply!199 lt!110408 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213577 () Bool)

(declare-fun res!104539 () Bool)

(assert (=> b!213577 (=> (not res!104539) (not e!138891))))

(assert (=> b!213577 (= res!104539 e!138887)))

(declare-fun res!104541 () Bool)

(assert (=> b!213577 (=> res!104541 e!138887)))

(assert (=> b!213577 (= res!104541 (not e!138897))))

(declare-fun res!104545 () Bool)

(assert (=> b!213577 (=> (not res!104545) (not e!138897))))

(assert (=> b!213577 (= res!104545 (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun b!213578 () Bool)

(declare-fun e!138886 () Bool)

(assert (=> b!213578 (= e!138886 (not call!20239))))

(declare-fun b!213579 () Bool)

(declare-fun Unit!6476 () Unit!6474)

(assert (=> b!213579 (= e!138895 Unit!6476)))

(declare-fun b!213580 () Bool)

(declare-fun e!138890 () Bool)

(assert (=> b!213580 (= e!138890 (= (apply!199 lt!110408 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!20239 () Bool)

(assert (=> bm!20239 (= call!20240 call!20242)))

(declare-fun b!213581 () Bool)

(declare-fun c!35958 () Bool)

(assert (=> b!213581 (= c!35958 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!213581 (= e!138889 e!138888)))

(declare-fun bm!20240 () Bool)

(assert (=> bm!20240 (= call!20243 (getCurrentListMapNoExtraKeys!518 _keys!825 lt!110305 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213582 () Bool)

(assert (=> b!213582 (= e!138886 e!138890)))

(declare-fun res!104543 () Bool)

(assert (=> b!213582 (= res!104543 call!20239)))

(assert (=> b!213582 (=> (not res!104543) (not e!138890))))

(declare-fun b!213583 () Bool)

(assert (=> b!213583 (= e!138892 (not call!20237))))

(declare-fun b!213584 () Bool)

(assert (=> b!213584 (= e!138891 e!138886)))

(declare-fun c!35957 () Bool)

(assert (=> b!213584 (= c!35957 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213585 () Bool)

(assert (=> b!213585 (= e!138885 (validKeyInArray!0 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58209 c!35956) b!213574))

(assert (= (and d!58209 (not c!35956)) b!213570))

(assert (= (and b!213570 c!35955) b!213569))

(assert (= (and b!213570 (not c!35955)) b!213581))

(assert (= (and b!213581 c!35958) b!213567))

(assert (= (and b!213581 (not c!35958)) b!213572))

(assert (= (or b!213567 b!213572) bm!20236))

(assert (= (or b!213569 bm!20236) bm!20234))

(assert (= (or b!213569 b!213567) bm!20239))

(assert (= (or b!213574 bm!20234) bm!20240))

(assert (= (or b!213574 bm!20239) bm!20237))

(assert (= (and d!58209 res!104547) b!213585))

(assert (= (and d!58209 c!35953) b!213566))

(assert (= (and d!58209 (not c!35953)) b!213579))

(assert (= (and d!58209 res!104542) b!213577))

(assert (= (and b!213577 res!104545) b!213571))

(assert (= (and b!213577 (not res!104541)) b!213573))

(assert (= (and b!213573 res!104544) b!213565))

(assert (= (and b!213577 res!104539) b!213568))

(assert (= (and b!213568 c!35954) b!213575))

(assert (= (and b!213568 (not c!35954)) b!213583))

(assert (= (and b!213575 res!104546) b!213576))

(assert (= (or b!213575 b!213583) bm!20235))

(assert (= (and b!213568 res!104540) b!213584))

(assert (= (and b!213584 c!35957) b!213582))

(assert (= (and b!213584 (not c!35957)) b!213578))

(assert (= (and b!213582 res!104543) b!213580))

(assert (= (or b!213582 b!213578) bm!20238))

(declare-fun b_lambda!7783 () Bool)

(assert (=> (not b_lambda!7783) (not b!213565)))

(assert (=> b!213565 t!8071))

(declare-fun b_and!12511 () Bool)

(assert (= b_and!12509 (and (=> t!8071 result!5021) b_and!12511)))

(assert (=> b!213566 m!241329))

(declare-fun m!241399 () Bool)

(assert (=> b!213566 m!241399))

(declare-fun m!241401 () Bool)

(assert (=> b!213566 m!241401))

(declare-fun m!241403 () Bool)

(assert (=> b!213566 m!241403))

(declare-fun m!241405 () Bool)

(assert (=> b!213566 m!241405))

(declare-fun m!241407 () Bool)

(assert (=> b!213566 m!241407))

(declare-fun m!241409 () Bool)

(assert (=> b!213566 m!241409))

(declare-fun m!241411 () Bool)

(assert (=> b!213566 m!241411))

(declare-fun m!241413 () Bool)

(assert (=> b!213566 m!241413))

(declare-fun m!241415 () Bool)

(assert (=> b!213566 m!241415))

(assert (=> b!213566 m!241405))

(declare-fun m!241417 () Bool)

(assert (=> b!213566 m!241417))

(assert (=> b!213566 m!241399))

(declare-fun m!241419 () Bool)

(assert (=> b!213566 m!241419))

(assert (=> b!213566 m!241401))

(declare-fun m!241421 () Bool)

(assert (=> b!213566 m!241421))

(declare-fun m!241423 () Bool)

(assert (=> b!213566 m!241423))

(assert (=> b!213566 m!241365))

(assert (=> b!213566 m!241411))

(declare-fun m!241425 () Bool)

(assert (=> b!213566 m!241425))

(declare-fun m!241427 () Bool)

(assert (=> b!213566 m!241427))

(declare-fun m!241429 () Bool)

(assert (=> b!213580 m!241429))

(assert (=> b!213585 m!241365))

(assert (=> b!213585 m!241365))

(assert (=> b!213585 m!241369))

(assert (=> b!213573 m!241365))

(assert (=> b!213573 m!241365))

(declare-fun m!241431 () Bool)

(assert (=> b!213573 m!241431))

(declare-fun m!241433 () Bool)

(assert (=> bm!20238 m!241433))

(declare-fun m!241435 () Bool)

(assert (=> b!213576 m!241435))

(assert (=> b!213571 m!241365))

(assert (=> b!213571 m!241365))

(assert (=> b!213571 m!241369))

(declare-fun m!241437 () Bool)

(assert (=> bm!20237 m!241437))

(declare-fun m!241439 () Bool)

(assert (=> b!213574 m!241439))

(declare-fun m!241441 () Bool)

(assert (=> bm!20235 m!241441))

(assert (=> d!58209 m!241305))

(assert (=> b!213565 m!241365))

(declare-fun m!241443 () Bool)

(assert (=> b!213565 m!241443))

(assert (=> b!213565 m!241375))

(declare-fun m!241445 () Bool)

(assert (=> b!213565 m!241445))

(assert (=> b!213565 m!241365))

(assert (=> b!213565 m!241445))

(assert (=> b!213565 m!241375))

(declare-fun m!241447 () Bool)

(assert (=> b!213565 m!241447))

(assert (=> bm!20240 m!241329))

(assert (=> b!213436 d!58209))

(declare-fun b!213592 () Bool)

(declare-fun e!138902 () Bool)

(declare-fun call!20248 () ListLongMap!3145)

(declare-fun call!20249 () ListLongMap!3145)

(assert (=> b!213592 (= e!138902 (= call!20248 call!20249))))

(declare-fun bm!20245 () Bool)

(assert (=> bm!20245 (= call!20248 (getCurrentListMapNoExtraKeys!518 _keys!825 (array!10204 (store (arr!4842 _values!649) i!601 (ValueCellFull!2406 v!520)) (size!5167 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213593 () Bool)

(declare-fun e!138903 () Bool)

(assert (=> b!213593 (= e!138903 e!138902)))

(declare-fun c!35961 () Bool)

(assert (=> b!213593 (= c!35961 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!213594 () Bool)

(assert (=> b!213594 (= e!138902 (= call!20248 (+!591 call!20249 (tuple2!4233 k0!843 v!520))))))

(declare-fun bm!20246 () Bool)

(assert (=> bm!20246 (= call!20249 (getCurrentListMapNoExtraKeys!518 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!58211 () Bool)

(assert (=> d!58211 e!138903))

(declare-fun res!104550 () Bool)

(assert (=> d!58211 (=> (not res!104550) (not e!138903))))

(assert (=> d!58211 (= res!104550 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5167 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5167 _values!649))))))))

(declare-fun lt!110419 () Unit!6474)

(declare-fun choose!1083 (array!10201 array!10203 (_ BitVec 32) (_ BitVec 32) V!6979 V!6979 (_ BitVec 32) (_ BitVec 64) V!6979 (_ BitVec 32) Int) Unit!6474)

(assert (=> d!58211 (= lt!110419 (choose!1083 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58211 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(assert (=> d!58211 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!233 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!110419)))

(assert (= (and d!58211 res!104550) b!213593))

(assert (= (and b!213593 c!35961) b!213594))

(assert (= (and b!213593 (not c!35961)) b!213592))

(assert (= (or b!213594 b!213592) bm!20245))

(assert (= (or b!213594 b!213592) bm!20246))

(assert (=> bm!20245 m!241327))

(declare-fun m!241449 () Bool)

(assert (=> bm!20245 m!241449))

(declare-fun m!241451 () Bool)

(assert (=> b!213594 m!241451))

(assert (=> bm!20246 m!241325))

(declare-fun m!241453 () Bool)

(assert (=> d!58211 m!241453))

(assert (=> b!213436 d!58211))

(declare-fun d!58213 () Bool)

(declare-fun e!138906 () Bool)

(assert (=> d!58213 e!138906))

(declare-fun res!104556 () Bool)

(assert (=> d!58213 (=> (not res!104556) (not e!138906))))

(declare-fun lt!110429 () ListLongMap!3145)

(assert (=> d!58213 (= res!104556 (contains!1420 lt!110429 (_1!2127 (tuple2!4233 k0!843 v!520))))))

(declare-fun lt!110430 () List!3118)

(assert (=> d!58213 (= lt!110429 (ListLongMap!3146 lt!110430))))

(declare-fun lt!110431 () Unit!6474)

(declare-fun lt!110428 () Unit!6474)

(assert (=> d!58213 (= lt!110431 lt!110428)))

(declare-datatypes ((Option!263 0))(
  ( (Some!262 (v!4809 V!6979)) (None!261) )
))
(declare-fun getValueByKey!257 (List!3118 (_ BitVec 64)) Option!263)

(assert (=> d!58213 (= (getValueByKey!257 lt!110430 (_1!2127 (tuple2!4233 k0!843 v!520))) (Some!262 (_2!2127 (tuple2!4233 k0!843 v!520))))))

(declare-fun lemmaContainsTupThenGetReturnValue!144 (List!3118 (_ BitVec 64) V!6979) Unit!6474)

(assert (=> d!58213 (= lt!110428 (lemmaContainsTupThenGetReturnValue!144 lt!110430 (_1!2127 (tuple2!4233 k0!843 v!520)) (_2!2127 (tuple2!4233 k0!843 v!520))))))

(declare-fun insertStrictlySorted!147 (List!3118 (_ BitVec 64) V!6979) List!3118)

(assert (=> d!58213 (= lt!110430 (insertStrictlySorted!147 (toList!1588 lt!110303) (_1!2127 (tuple2!4233 k0!843 v!520)) (_2!2127 (tuple2!4233 k0!843 v!520))))))

(assert (=> d!58213 (= (+!591 lt!110303 (tuple2!4233 k0!843 v!520)) lt!110429)))

(declare-fun b!213599 () Bool)

(declare-fun res!104555 () Bool)

(assert (=> b!213599 (=> (not res!104555) (not e!138906))))

(assert (=> b!213599 (= res!104555 (= (getValueByKey!257 (toList!1588 lt!110429) (_1!2127 (tuple2!4233 k0!843 v!520))) (Some!262 (_2!2127 (tuple2!4233 k0!843 v!520)))))))

(declare-fun b!213600 () Bool)

(declare-fun contains!1421 (List!3118 tuple2!4232) Bool)

(assert (=> b!213600 (= e!138906 (contains!1421 (toList!1588 lt!110429) (tuple2!4233 k0!843 v!520)))))

(assert (= (and d!58213 res!104556) b!213599))

(assert (= (and b!213599 res!104555) b!213600))

(declare-fun m!241455 () Bool)

(assert (=> d!58213 m!241455))

(declare-fun m!241457 () Bool)

(assert (=> d!58213 m!241457))

(declare-fun m!241459 () Bool)

(assert (=> d!58213 m!241459))

(declare-fun m!241461 () Bool)

(assert (=> d!58213 m!241461))

(declare-fun m!241463 () Bool)

(assert (=> b!213599 m!241463))

(declare-fun m!241465 () Bool)

(assert (=> b!213600 m!241465))

(assert (=> b!213436 d!58213))

(declare-fun b!213601 () Bool)

(declare-fun lt!110432 () Unit!6474)

(declare-fun lt!110437 () Unit!6474)

(assert (=> b!213601 (= lt!110432 lt!110437)))

(declare-fun lt!110434 () (_ BitVec 64))

(declare-fun lt!110436 () (_ BitVec 64))

(declare-fun lt!110438 () V!6979)

(declare-fun lt!110433 () ListLongMap!3145)

(assert (=> b!213601 (not (contains!1420 (+!591 lt!110433 (tuple2!4233 lt!110434 lt!110438)) lt!110436))))

(assert (=> b!213601 (= lt!110437 (addStillNotContains!108 lt!110433 lt!110434 lt!110438 lt!110436))))

(assert (=> b!213601 (= lt!110436 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213601 (= lt!110438 (get!2587 (select (arr!4842 lt!110305) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213601 (= lt!110434 (select (arr!4841 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!20250 () ListLongMap!3145)

(assert (=> b!213601 (= lt!110433 call!20250)))

(declare-fun e!138913 () ListLongMap!3145)

(assert (=> b!213601 (= e!138913 (+!591 call!20250 (tuple2!4233 (select (arr!4841 _keys!825) #b00000000000000000000000000000000) (get!2587 (select (arr!4842 lt!110305) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213602 () Bool)

(declare-fun e!138911 () ListLongMap!3145)

(assert (=> b!213602 (= e!138911 (ListLongMap!3146 Nil!3115))))

(declare-fun b!213603 () Bool)

(declare-fun res!104557 () Bool)

(declare-fun e!138910 () Bool)

(assert (=> b!213603 (=> (not res!104557) (not e!138910))))

(declare-fun lt!110435 () ListLongMap!3145)

(assert (=> b!213603 (= res!104557 (not (contains!1420 lt!110435 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!213604 () Bool)

(declare-fun e!138908 () Bool)

(assert (=> b!213604 (= e!138908 (= lt!110435 (getCurrentListMapNoExtraKeys!518 _keys!825 lt!110305 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!213605 () Bool)

(assert (=> b!213605 (= e!138908 (isEmpty!500 lt!110435))))

(declare-fun b!213606 () Bool)

(assert (=> b!213606 (= e!138911 e!138913)))

(declare-fun c!35964 () Bool)

(assert (=> b!213606 (= c!35964 (validKeyInArray!0 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213607 () Bool)

(declare-fun e!138907 () Bool)

(assert (=> b!213607 (= e!138910 e!138907)))

(declare-fun c!35965 () Bool)

(declare-fun e!138909 () Bool)

(assert (=> b!213607 (= c!35965 e!138909)))

(declare-fun res!104558 () Bool)

(assert (=> b!213607 (=> (not res!104558) (not e!138909))))

(assert (=> b!213607 (= res!104558 (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun b!213608 () Bool)

(assert (=> b!213608 (= e!138907 e!138908)))

(declare-fun c!35963 () Bool)

(assert (=> b!213608 (= c!35963 (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun b!213609 () Bool)

(assert (=> b!213609 (= e!138913 call!20250)))

(declare-fun bm!20247 () Bool)

(assert (=> bm!20247 (= call!20250 (getCurrentListMapNoExtraKeys!518 _keys!825 lt!110305 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun d!58215 () Bool)

(assert (=> d!58215 e!138910))

(declare-fun res!104560 () Bool)

(assert (=> d!58215 (=> (not res!104560) (not e!138910))))

(assert (=> d!58215 (= res!104560 (not (contains!1420 lt!110435 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58215 (= lt!110435 e!138911)))

(declare-fun c!35962 () Bool)

(assert (=> d!58215 (= c!35962 (bvsge #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(assert (=> d!58215 (validMask!0 mask!1149)))

(assert (=> d!58215 (= (getCurrentListMapNoExtraKeys!518 _keys!825 lt!110305 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110435)))

(declare-fun b!213610 () Bool)

(assert (=> b!213610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(assert (=> b!213610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5167 lt!110305)))))

(declare-fun e!138912 () Bool)

(assert (=> b!213610 (= e!138912 (= (apply!199 lt!110435 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)) (get!2587 (select (arr!4842 lt!110305) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213611 () Bool)

(assert (=> b!213611 (= e!138907 e!138912)))

(assert (=> b!213611 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun res!104559 () Bool)

(assert (=> b!213611 (= res!104559 (contains!1420 lt!110435 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213611 (=> (not res!104559) (not e!138912))))

(declare-fun b!213612 () Bool)

(assert (=> b!213612 (= e!138909 (validKeyInArray!0 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213612 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!58215 c!35962) b!213602))

(assert (= (and d!58215 (not c!35962)) b!213606))

(assert (= (and b!213606 c!35964) b!213601))

(assert (= (and b!213606 (not c!35964)) b!213609))

(assert (= (or b!213601 b!213609) bm!20247))

(assert (= (and d!58215 res!104560) b!213603))

(assert (= (and b!213603 res!104557) b!213607))

(assert (= (and b!213607 res!104558) b!213612))

(assert (= (and b!213607 c!35965) b!213611))

(assert (= (and b!213607 (not c!35965)) b!213608))

(assert (= (and b!213611 res!104559) b!213610))

(assert (= (and b!213608 c!35963) b!213604))

(assert (= (and b!213608 (not c!35963)) b!213605))

(declare-fun b_lambda!7785 () Bool)

(assert (=> (not b_lambda!7785) (not b!213601)))

(assert (=> b!213601 t!8071))

(declare-fun b_and!12513 () Bool)

(assert (= b_and!12511 (and (=> t!8071 result!5021) b_and!12513)))

(declare-fun b_lambda!7787 () Bool)

(assert (=> (not b_lambda!7787) (not b!213610)))

(assert (=> b!213610 t!8071))

(declare-fun b_and!12515 () Bool)

(assert (= b_and!12513 (and (=> t!8071 result!5021) b_and!12515)))

(assert (=> b!213606 m!241365))

(assert (=> b!213606 m!241365))

(assert (=> b!213606 m!241369))

(assert (=> b!213611 m!241365))

(assert (=> b!213611 m!241365))

(declare-fun m!241467 () Bool)

(assert (=> b!213611 m!241467))

(assert (=> b!213612 m!241365))

(assert (=> b!213612 m!241365))

(assert (=> b!213612 m!241369))

(assert (=> b!213610 m!241375))

(assert (=> b!213610 m!241445))

(assert (=> b!213610 m!241365))

(declare-fun m!241469 () Bool)

(assert (=> b!213610 m!241469))

(assert (=> b!213610 m!241365))

(assert (=> b!213610 m!241445))

(assert (=> b!213610 m!241375))

(assert (=> b!213610 m!241447))

(declare-fun m!241471 () Bool)

(assert (=> d!58215 m!241471))

(assert (=> d!58215 m!241305))

(declare-fun m!241473 () Bool)

(assert (=> b!213605 m!241473))

(declare-fun m!241475 () Bool)

(assert (=> bm!20247 m!241475))

(declare-fun m!241477 () Bool)

(assert (=> b!213603 m!241477))

(assert (=> b!213604 m!241475))

(declare-fun m!241479 () Bool)

(assert (=> b!213601 m!241479))

(declare-fun m!241481 () Bool)

(assert (=> b!213601 m!241481))

(assert (=> b!213601 m!241375))

(declare-fun m!241483 () Bool)

(assert (=> b!213601 m!241483))

(declare-fun m!241485 () Bool)

(assert (=> b!213601 m!241485))

(assert (=> b!213601 m!241445))

(assert (=> b!213601 m!241483))

(assert (=> b!213601 m!241365))

(assert (=> b!213601 m!241445))

(assert (=> b!213601 m!241375))

(assert (=> b!213601 m!241447))

(assert (=> b!213436 d!58215))

(declare-fun lt!110452 () ListLongMap!3145)

(declare-fun e!138922 () Bool)

(declare-fun b!213613 () Bool)

(assert (=> b!213613 (= e!138922 (= (apply!199 lt!110452 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)) (get!2587 (select (arr!4842 _values!649) #b00000000000000000000000000000000) (dynLambda!542 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213613 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5167 _values!649)))))

(assert (=> b!213613 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun b!213614 () Bool)

(declare-fun e!138924 () Unit!6474)

(declare-fun lt!110439 () Unit!6474)

(assert (=> b!213614 (= e!138924 lt!110439)))

(declare-fun lt!110441 () ListLongMap!3145)

(assert (=> b!213614 (= lt!110441 (getCurrentListMapNoExtraKeys!518 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110449 () (_ BitVec 64))

(assert (=> b!213614 (= lt!110449 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110446 () (_ BitVec 64))

(assert (=> b!213614 (= lt!110446 (select (arr!4841 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110453 () Unit!6474)

(assert (=> b!213614 (= lt!110453 (addStillContains!175 lt!110441 lt!110449 zeroValue!615 lt!110446))))

(assert (=> b!213614 (contains!1420 (+!591 lt!110441 (tuple2!4233 lt!110449 zeroValue!615)) lt!110446)))

(declare-fun lt!110450 () Unit!6474)

(assert (=> b!213614 (= lt!110450 lt!110453)))

(declare-fun lt!110440 () ListLongMap!3145)

(assert (=> b!213614 (= lt!110440 (getCurrentListMapNoExtraKeys!518 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110444 () (_ BitVec 64))

(assert (=> b!213614 (= lt!110444 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110448 () (_ BitVec 64))

(assert (=> b!213614 (= lt!110448 (select (arr!4841 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110458 () Unit!6474)

(assert (=> b!213614 (= lt!110458 (addApplyDifferent!175 lt!110440 lt!110444 minValue!615 lt!110448))))

(assert (=> b!213614 (= (apply!199 (+!591 lt!110440 (tuple2!4233 lt!110444 minValue!615)) lt!110448) (apply!199 lt!110440 lt!110448))))

(declare-fun lt!110457 () Unit!6474)

(assert (=> b!213614 (= lt!110457 lt!110458)))

(declare-fun lt!110459 () ListLongMap!3145)

(assert (=> b!213614 (= lt!110459 (getCurrentListMapNoExtraKeys!518 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110455 () (_ BitVec 64))

(assert (=> b!213614 (= lt!110455 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110442 () (_ BitVec 64))

(assert (=> b!213614 (= lt!110442 (select (arr!4841 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110447 () Unit!6474)

(assert (=> b!213614 (= lt!110447 (addApplyDifferent!175 lt!110459 lt!110455 zeroValue!615 lt!110442))))

(assert (=> b!213614 (= (apply!199 (+!591 lt!110459 (tuple2!4233 lt!110455 zeroValue!615)) lt!110442) (apply!199 lt!110459 lt!110442))))

(declare-fun lt!110454 () Unit!6474)

(assert (=> b!213614 (= lt!110454 lt!110447)))

(declare-fun lt!110443 () ListLongMap!3145)

(assert (=> b!213614 (= lt!110443 (getCurrentListMapNoExtraKeys!518 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110456 () (_ BitVec 64))

(assert (=> b!213614 (= lt!110456 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110460 () (_ BitVec 64))

(assert (=> b!213614 (= lt!110460 (select (arr!4841 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213614 (= lt!110439 (addApplyDifferent!175 lt!110443 lt!110456 minValue!615 lt!110460))))

(assert (=> b!213614 (= (apply!199 (+!591 lt!110443 (tuple2!4233 lt!110456 minValue!615)) lt!110460) (apply!199 lt!110443 lt!110460))))

(declare-fun bm!20248 () Bool)

(declare-fun call!20252 () ListLongMap!3145)

(declare-fun call!20257 () ListLongMap!3145)

(assert (=> bm!20248 (= call!20252 call!20257)))

(declare-fun b!213615 () Bool)

(declare-fun e!138917 () ListLongMap!3145)

(declare-fun call!20254 () ListLongMap!3145)

(assert (=> b!213615 (= e!138917 call!20254)))

(declare-fun d!58217 () Bool)

(declare-fun e!138920 () Bool)

(assert (=> d!58217 e!138920))

(declare-fun res!104564 () Bool)

(assert (=> d!58217 (=> (not res!104564) (not e!138920))))

(assert (=> d!58217 (= res!104564 (or (bvsge #b00000000000000000000000000000000 (size!5166 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))))

(declare-fun lt!110451 () ListLongMap!3145)

(assert (=> d!58217 (= lt!110452 lt!110451)))

(declare-fun lt!110445 () Unit!6474)

(assert (=> d!58217 (= lt!110445 e!138924)))

(declare-fun c!35966 () Bool)

(declare-fun e!138914 () Bool)

(assert (=> d!58217 (= c!35966 e!138914)))

(declare-fun res!104569 () Bool)

(assert (=> d!58217 (=> (not res!104569) (not e!138914))))

(assert (=> d!58217 (= res!104569 (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun e!138923 () ListLongMap!3145)

(assert (=> d!58217 (= lt!110451 e!138923)))

(declare-fun c!35969 () Bool)

(assert (=> d!58217 (= c!35969 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58217 (validMask!0 mask!1149)))

(assert (=> d!58217 (= (getCurrentListMap!1116 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110452)))

(declare-fun bm!20249 () Bool)

(declare-fun call!20251 () Bool)

(assert (=> bm!20249 (= call!20251 (contains!1420 lt!110452 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213616 () Bool)

(declare-fun res!104562 () Bool)

(assert (=> b!213616 (=> (not res!104562) (not e!138920))))

(declare-fun e!138921 () Bool)

(assert (=> b!213616 (= res!104562 e!138921)))

(declare-fun c!35967 () Bool)

(assert (=> b!213616 (= c!35967 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!213617 () Bool)

(declare-fun e!138918 () ListLongMap!3145)

(assert (=> b!213617 (= e!138918 call!20254)))

(declare-fun b!213618 () Bool)

(assert (=> b!213618 (= e!138923 e!138918)))

(declare-fun c!35968 () Bool)

(assert (=> b!213618 (= c!35968 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213619 () Bool)

(declare-fun e!138926 () Bool)

(assert (=> b!213619 (= e!138926 (validKeyInArray!0 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20250 () Bool)

(declare-fun call!20255 () ListLongMap!3145)

(assert (=> bm!20250 (= call!20255 call!20252)))

(declare-fun call!20256 () ListLongMap!3145)

(declare-fun bm!20251 () Bool)

(assert (=> bm!20251 (= call!20256 (+!591 (ite c!35969 call!20257 (ite c!35968 call!20252 call!20255)) (ite (or c!35969 c!35968) (tuple2!4233 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4233 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun bm!20252 () Bool)

(declare-fun call!20253 () Bool)

(assert (=> bm!20252 (= call!20253 (contains!1420 lt!110452 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213620 () Bool)

(assert (=> b!213620 (= e!138917 call!20255)))

(declare-fun b!213621 () Bool)

(declare-fun e!138916 () Bool)

(assert (=> b!213621 (= e!138916 e!138922)))

(declare-fun res!104566 () Bool)

(assert (=> b!213621 (=> (not res!104566) (not e!138922))))

(assert (=> b!213621 (= res!104566 (contains!1420 lt!110452 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213621 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun b!213622 () Bool)

(assert (=> b!213622 (= e!138923 (+!591 call!20256 (tuple2!4233 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!213623 () Bool)

(declare-fun e!138925 () Bool)

(assert (=> b!213623 (= e!138921 e!138925)))

(declare-fun res!104568 () Bool)

(assert (=> b!213623 (= res!104568 call!20251)))

(assert (=> b!213623 (=> (not res!104568) (not e!138925))))

(declare-fun b!213624 () Bool)

(assert (=> b!213624 (= e!138925 (= (apply!199 lt!110452 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213625 () Bool)

(declare-fun res!104561 () Bool)

(assert (=> b!213625 (=> (not res!104561) (not e!138920))))

(assert (=> b!213625 (= res!104561 e!138916)))

(declare-fun res!104563 () Bool)

(assert (=> b!213625 (=> res!104563 e!138916)))

(assert (=> b!213625 (= res!104563 (not e!138926))))

(declare-fun res!104567 () Bool)

(assert (=> b!213625 (=> (not res!104567) (not e!138926))))

(assert (=> b!213625 (= res!104567 (bvslt #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(declare-fun b!213626 () Bool)

(declare-fun e!138915 () Bool)

(assert (=> b!213626 (= e!138915 (not call!20253))))

(declare-fun b!213627 () Bool)

(declare-fun Unit!6477 () Unit!6474)

(assert (=> b!213627 (= e!138924 Unit!6477)))

(declare-fun b!213628 () Bool)

(declare-fun e!138919 () Bool)

(assert (=> b!213628 (= e!138919 (= (apply!199 lt!110452 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!20253 () Bool)

(assert (=> bm!20253 (= call!20254 call!20256)))

(declare-fun b!213629 () Bool)

(declare-fun c!35971 () Bool)

(assert (=> b!213629 (= c!35971 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!213629 (= e!138918 e!138917)))

(declare-fun bm!20254 () Bool)

(assert (=> bm!20254 (= call!20257 (getCurrentListMapNoExtraKeys!518 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213630 () Bool)

(assert (=> b!213630 (= e!138915 e!138919)))

(declare-fun res!104565 () Bool)

(assert (=> b!213630 (= res!104565 call!20253)))

(assert (=> b!213630 (=> (not res!104565) (not e!138919))))

(declare-fun b!213631 () Bool)

(assert (=> b!213631 (= e!138921 (not call!20251))))

(declare-fun b!213632 () Bool)

(assert (=> b!213632 (= e!138920 e!138915)))

(declare-fun c!35970 () Bool)

(assert (=> b!213632 (= c!35970 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213633 () Bool)

(assert (=> b!213633 (= e!138914 (validKeyInArray!0 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58217 c!35969) b!213622))

(assert (= (and d!58217 (not c!35969)) b!213618))

(assert (= (and b!213618 c!35968) b!213617))

(assert (= (and b!213618 (not c!35968)) b!213629))

(assert (= (and b!213629 c!35971) b!213615))

(assert (= (and b!213629 (not c!35971)) b!213620))

(assert (= (or b!213615 b!213620) bm!20250))

(assert (= (or b!213617 bm!20250) bm!20248))

(assert (= (or b!213617 b!213615) bm!20253))

(assert (= (or b!213622 bm!20248) bm!20254))

(assert (= (or b!213622 bm!20253) bm!20251))

(assert (= (and d!58217 res!104569) b!213633))

(assert (= (and d!58217 c!35966) b!213614))

(assert (= (and d!58217 (not c!35966)) b!213627))

(assert (= (and d!58217 res!104564) b!213625))

(assert (= (and b!213625 res!104567) b!213619))

(assert (= (and b!213625 (not res!104563)) b!213621))

(assert (= (and b!213621 res!104566) b!213613))

(assert (= (and b!213625 res!104561) b!213616))

(assert (= (and b!213616 c!35967) b!213623))

(assert (= (and b!213616 (not c!35967)) b!213631))

(assert (= (and b!213623 res!104568) b!213624))

(assert (= (or b!213623 b!213631) bm!20249))

(assert (= (and b!213616 res!104562) b!213632))

(assert (= (and b!213632 c!35970) b!213630))

(assert (= (and b!213632 (not c!35970)) b!213626))

(assert (= (and b!213630 res!104565) b!213628))

(assert (= (or b!213630 b!213626) bm!20252))

(declare-fun b_lambda!7789 () Bool)

(assert (=> (not b_lambda!7789) (not b!213613)))

(assert (=> b!213613 t!8071))

(declare-fun b_and!12517 () Bool)

(assert (= b_and!12515 (and (=> t!8071 result!5021) b_and!12517)))

(assert (=> b!213614 m!241325))

(declare-fun m!241487 () Bool)

(assert (=> b!213614 m!241487))

(declare-fun m!241489 () Bool)

(assert (=> b!213614 m!241489))

(declare-fun m!241491 () Bool)

(assert (=> b!213614 m!241491))

(declare-fun m!241493 () Bool)

(assert (=> b!213614 m!241493))

(declare-fun m!241495 () Bool)

(assert (=> b!213614 m!241495))

(declare-fun m!241497 () Bool)

(assert (=> b!213614 m!241497))

(declare-fun m!241499 () Bool)

(assert (=> b!213614 m!241499))

(declare-fun m!241501 () Bool)

(assert (=> b!213614 m!241501))

(declare-fun m!241503 () Bool)

(assert (=> b!213614 m!241503))

(assert (=> b!213614 m!241493))

(declare-fun m!241505 () Bool)

(assert (=> b!213614 m!241505))

(assert (=> b!213614 m!241487))

(declare-fun m!241507 () Bool)

(assert (=> b!213614 m!241507))

(assert (=> b!213614 m!241489))

(declare-fun m!241509 () Bool)

(assert (=> b!213614 m!241509))

(declare-fun m!241511 () Bool)

(assert (=> b!213614 m!241511))

(assert (=> b!213614 m!241365))

(assert (=> b!213614 m!241499))

(declare-fun m!241513 () Bool)

(assert (=> b!213614 m!241513))

(declare-fun m!241515 () Bool)

(assert (=> b!213614 m!241515))

(declare-fun m!241517 () Bool)

(assert (=> b!213628 m!241517))

(assert (=> b!213633 m!241365))

(assert (=> b!213633 m!241365))

(assert (=> b!213633 m!241369))

(assert (=> b!213621 m!241365))

(assert (=> b!213621 m!241365))

(declare-fun m!241519 () Bool)

(assert (=> b!213621 m!241519))

(declare-fun m!241521 () Bool)

(assert (=> bm!20252 m!241521))

(declare-fun m!241523 () Bool)

(assert (=> b!213624 m!241523))

(assert (=> b!213619 m!241365))

(assert (=> b!213619 m!241365))

(assert (=> b!213619 m!241369))

(declare-fun m!241525 () Bool)

(assert (=> bm!20251 m!241525))

(declare-fun m!241527 () Bool)

(assert (=> b!213622 m!241527))

(declare-fun m!241529 () Bool)

(assert (=> bm!20249 m!241529))

(assert (=> d!58217 m!241305))

(assert (=> b!213613 m!241365))

(declare-fun m!241531 () Bool)

(assert (=> b!213613 m!241531))

(assert (=> b!213613 m!241375))

(assert (=> b!213613 m!241377))

(assert (=> b!213613 m!241365))

(assert (=> b!213613 m!241377))

(assert (=> b!213613 m!241375))

(assert (=> b!213613 m!241381))

(assert (=> bm!20254 m!241325))

(assert (=> b!213436 d!58217))

(declare-fun d!58219 () Bool)

(declare-fun res!104574 () Bool)

(declare-fun e!138933 () Bool)

(assert (=> d!58219 (=> res!104574 e!138933)))

(assert (=> d!58219 (= res!104574 (bvsge #b00000000000000000000000000000000 (size!5166 _keys!825)))))

(assert (=> d!58219 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138933)))

(declare-fun b!213642 () Bool)

(declare-fun e!138935 () Bool)

(declare-fun call!20260 () Bool)

(assert (=> b!213642 (= e!138935 call!20260)))

(declare-fun b!213643 () Bool)

(declare-fun e!138934 () Bool)

(assert (=> b!213643 (= e!138934 call!20260)))

(declare-fun b!213644 () Bool)

(assert (=> b!213644 (= e!138935 e!138934)))

(declare-fun lt!110467 () (_ BitVec 64))

(assert (=> b!213644 (= lt!110467 (select (arr!4841 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110468 () Unit!6474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10201 (_ BitVec 64) (_ BitVec 32)) Unit!6474)

(assert (=> b!213644 (= lt!110468 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!110467 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!213644 (arrayContainsKey!0 _keys!825 lt!110467 #b00000000000000000000000000000000)))

(declare-fun lt!110469 () Unit!6474)

(assert (=> b!213644 (= lt!110469 lt!110468)))

(declare-fun res!104575 () Bool)

(declare-datatypes ((SeekEntryResult!714 0))(
  ( (MissingZero!714 (index!5026 (_ BitVec 32))) (Found!714 (index!5027 (_ BitVec 32))) (Intermediate!714 (undefined!1526 Bool) (index!5028 (_ BitVec 32)) (x!22246 (_ BitVec 32))) (Undefined!714) (MissingVacant!714 (index!5029 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10201 (_ BitVec 32)) SeekEntryResult!714)

(assert (=> b!213644 (= res!104575 (= (seekEntryOrOpen!0 (select (arr!4841 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!714 #b00000000000000000000000000000000)))))

(assert (=> b!213644 (=> (not res!104575) (not e!138934))))

(declare-fun b!213645 () Bool)

(assert (=> b!213645 (= e!138933 e!138935)))

(declare-fun c!35974 () Bool)

(assert (=> b!213645 (= c!35974 (validKeyInArray!0 (select (arr!4841 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20257 () Bool)

(assert (=> bm!20257 (= call!20260 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(assert (= (and d!58219 (not res!104574)) b!213645))

(assert (= (and b!213645 c!35974) b!213644))

(assert (= (and b!213645 (not c!35974)) b!213642))

(assert (= (and b!213644 res!104575) b!213643))

(assert (= (or b!213643 b!213642) bm!20257))

(assert (=> b!213644 m!241365))

(declare-fun m!241533 () Bool)

(assert (=> b!213644 m!241533))

(declare-fun m!241535 () Bool)

(assert (=> b!213644 m!241535))

(assert (=> b!213644 m!241365))

(declare-fun m!241537 () Bool)

(assert (=> b!213644 m!241537))

(assert (=> b!213645 m!241365))

(assert (=> b!213645 m!241365))

(assert (=> b!213645 m!241369))

(declare-fun m!241539 () Bool)

(assert (=> bm!20257 m!241539))

(assert (=> b!213431 d!58219))

(declare-fun d!58221 () Bool)

(assert (=> d!58221 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21186 d!58221))

(declare-fun d!58223 () Bool)

(assert (=> d!58223 (= (array_inv!3201 _values!649) (bvsge (size!5167 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21186 d!58223))

(declare-fun d!58225 () Bool)

(assert (=> d!58225 (= (array_inv!3202 _keys!825) (bvsge (size!5166 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21186 d!58225))

(declare-fun d!58227 () Bool)

(assert (=> d!58227 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213430 d!58227))

(declare-fun mapNonEmpty!9353 () Bool)

(declare-fun mapRes!9353 () Bool)

(declare-fun tp!19991 () Bool)

(declare-fun e!138941 () Bool)

(assert (=> mapNonEmpty!9353 (= mapRes!9353 (and tp!19991 e!138941))))

(declare-fun mapValue!9353 () ValueCell!2406)

(declare-fun mapKey!9353 () (_ BitVec 32))

(declare-fun mapRest!9353 () (Array (_ BitVec 32) ValueCell!2406))

(assert (=> mapNonEmpty!9353 (= mapRest!9347 (store mapRest!9353 mapKey!9353 mapValue!9353))))

(declare-fun condMapEmpty!9353 () Bool)

(declare-fun mapDefault!9353 () ValueCell!2406)

(assert (=> mapNonEmpty!9347 (= condMapEmpty!9353 (= mapRest!9347 ((as const (Array (_ BitVec 32) ValueCell!2406)) mapDefault!9353)))))

(declare-fun e!138940 () Bool)

(assert (=> mapNonEmpty!9347 (= tp!19982 (and e!138940 mapRes!9353))))

(declare-fun b!213653 () Bool)

(assert (=> b!213653 (= e!138940 tp_is_empty!5499)))

(declare-fun b!213652 () Bool)

(assert (=> b!213652 (= e!138941 tp_is_empty!5499)))

(declare-fun mapIsEmpty!9353 () Bool)

(assert (=> mapIsEmpty!9353 mapRes!9353))

(assert (= (and mapNonEmpty!9347 condMapEmpty!9353) mapIsEmpty!9353))

(assert (= (and mapNonEmpty!9347 (not condMapEmpty!9353)) mapNonEmpty!9353))

(assert (= (and mapNonEmpty!9353 ((_ is ValueCellFull!2406) mapValue!9353)) b!213652))

(assert (= (and mapNonEmpty!9347 ((_ is ValueCellFull!2406) mapDefault!9353)) b!213653))

(declare-fun m!241541 () Bool)

(assert (=> mapNonEmpty!9353 m!241541))

(declare-fun b_lambda!7791 () Bool)

(assert (= b_lambda!7781 (or (and start!21186 b_free!5637) b_lambda!7791)))

(declare-fun b_lambda!7793 () Bool)

(assert (= b_lambda!7789 (or (and start!21186 b_free!5637) b_lambda!7793)))

(declare-fun b_lambda!7795 () Bool)

(assert (= b_lambda!7785 (or (and start!21186 b_free!5637) b_lambda!7795)))

(declare-fun b_lambda!7797 () Bool)

(assert (= b_lambda!7779 (or (and start!21186 b_free!5637) b_lambda!7797)))

(declare-fun b_lambda!7799 () Bool)

(assert (= b_lambda!7787 (or (and start!21186 b_free!5637) b_lambda!7799)))

(declare-fun b_lambda!7801 () Bool)

(assert (= b_lambda!7783 (or (and start!21186 b_free!5637) b_lambda!7801)))

(check-sat (not b!213513) (not bm!20254) (not b!213509) (not b!213514) (not b_next!5637) (not d!58217) (not b!213566) (not b!213518) (not bm!20240) (not d!58215) (not b!213605) (not b!213614) (not bm!20219) (not b!213520) (not b!213621) (not b!213565) (not d!58213) (not b!213574) (not b!213622) (not b_lambda!7801) (not d!58211) (not b!213633) (not b!213480) (not b!213645) (not b!213483) (not b!213585) (not b_lambda!7797) (not b!213481) (not d!58207) tp_is_empty!5499 (not b!213644) (not b!213576) (not b!213611) (not bm!20246) (not b!213571) (not bm!20245) (not bm!20238) (not b!213580) (not b!213512) (not bm!20251) (not bm!20247) (not d!58209) (not b!213603) b_and!12517 (not b!213624) (not b!213599) (not b!213604) (not b!213613) (not b!213612) (not b!213610) (not bm!20235) (not b!213600) (not b_lambda!7793) (not b!213628) (not mapNonEmpty!9353) (not b!213619) (not b_lambda!7795) (not b!213606) (not bm!20237) (not b!213511) (not b!213573) (not bm!20249) (not bm!20216) (not bm!20252) (not b!213594) (not b!213601) (not b_lambda!7791) (not b!213519) (not bm!20257) (not b_lambda!7799))
(check-sat b_and!12517 (not b_next!5637))
