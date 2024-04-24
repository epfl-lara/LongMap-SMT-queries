; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7342 () Bool)

(assert start!7342)

(declare-fun b!47061 () Bool)

(declare-fun e!30095 () Bool)

(declare-fun tp_is_empty!2011 () Bool)

(assert (=> b!47061 (= e!30095 tp_is_empty!2011)))

(declare-fun b!47062 () Bool)

(declare-fun res!27405 () Bool)

(declare-fun e!30097 () Bool)

(assert (=> b!47062 (=> (not res!27405) (not e!30097))))

(declare-datatypes ((array!3070 0))(
  ( (array!3071 (arr!1473 (Array (_ BitVec 32) (_ BitVec 64))) (size!1695 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3070)

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-datatypes ((V!2415 0))(
  ( (V!2416 (val!1044 Int)) )
))
(declare-datatypes ((ValueCell!716 0))(
  ( (ValueCellFull!716 (v!2105 V!2415)) (EmptyCell!716) )
))
(declare-datatypes ((array!3072 0))(
  ( (array!3073 (arr!1474 (Array (_ BitVec 32) ValueCell!716)) (size!1696 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3072)

(assert (=> b!47062 (= res!27405 (and (= (size!1696 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1695 _keys!1940) (size!1696 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47063 () Bool)

(assert (=> b!47063 (= e!30097 (bvsgt #b00000000000000000000000000000000 (size!1695 _keys!1940)))))

(declare-fun b!47064 () Bool)

(declare-fun e!30096 () Bool)

(assert (=> b!47064 (= e!30096 tp_is_empty!2011)))

(declare-fun b!47065 () Bool)

(declare-fun e!30094 () Bool)

(declare-fun mapRes!2048 () Bool)

(assert (=> b!47065 (= e!30094 (and e!30095 mapRes!2048))))

(declare-fun condMapEmpty!2048 () Bool)

(declare-fun mapDefault!2048 () ValueCell!716)

(assert (=> b!47065 (= condMapEmpty!2048 (= (arr!1474 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!716)) mapDefault!2048)))))

(declare-fun b!47066 () Bool)

(declare-fun res!27406 () Bool)

(assert (=> b!47066 (=> (not res!27406) (not e!30097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3070 (_ BitVec 32)) Bool)

(assert (=> b!47066 (= res!27406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun res!27407 () Bool)

(assert (=> start!7342 (=> (not res!27407) (not e!30097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7342 (= res!27407 (validMask!0 mask!2458))))

(assert (=> start!7342 e!30097))

(assert (=> start!7342 true))

(declare-fun array_inv!874 (array!3072) Bool)

(assert (=> start!7342 (and (array_inv!874 _values!1550) e!30094)))

(declare-fun array_inv!875 (array!3070) Bool)

(assert (=> start!7342 (array_inv!875 _keys!1940)))

(declare-fun mapNonEmpty!2048 () Bool)

(declare-fun tp!6197 () Bool)

(assert (=> mapNonEmpty!2048 (= mapRes!2048 (and tp!6197 e!30096))))

(declare-fun mapValue!2048 () ValueCell!716)

(declare-fun mapRest!2048 () (Array (_ BitVec 32) ValueCell!716))

(declare-fun mapKey!2048 () (_ BitVec 32))

(assert (=> mapNonEmpty!2048 (= (arr!1474 _values!1550) (store mapRest!2048 mapKey!2048 mapValue!2048))))

(declare-fun mapIsEmpty!2048 () Bool)

(assert (=> mapIsEmpty!2048 mapRes!2048))

(assert (= (and start!7342 res!27407) b!47062))

(assert (= (and b!47062 res!27405) b!47066))

(assert (= (and b!47066 res!27406) b!47063))

(assert (= (and b!47065 condMapEmpty!2048) mapIsEmpty!2048))

(assert (= (and b!47065 (not condMapEmpty!2048)) mapNonEmpty!2048))

(get-info :version)

(assert (= (and mapNonEmpty!2048 ((_ is ValueCellFull!716) mapValue!2048)) b!47064))

(assert (= (and b!47065 ((_ is ValueCellFull!716) mapDefault!2048)) b!47061))

(assert (= start!7342 b!47065))

(declare-fun m!41335 () Bool)

(assert (=> b!47066 m!41335))

(declare-fun m!41337 () Bool)

(assert (=> start!7342 m!41337))

(declare-fun m!41339 () Bool)

(assert (=> start!7342 m!41339))

(declare-fun m!41341 () Bool)

(assert (=> start!7342 m!41341))

(declare-fun m!41343 () Bool)

(assert (=> mapNonEmpty!2048 m!41343))

(check-sat (not start!7342) (not b!47066) (not mapNonEmpty!2048) tp_is_empty!2011)
(check-sat)
(get-model)

(declare-fun d!9403 () Bool)

(assert (=> d!9403 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7342 d!9403))

(declare-fun d!9405 () Bool)

(assert (=> d!9405 (= (array_inv!874 _values!1550) (bvsge (size!1696 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7342 d!9405))

(declare-fun d!9407 () Bool)

(assert (=> d!9407 (= (array_inv!875 _keys!1940) (bvsge (size!1695 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7342 d!9407))

(declare-fun b!47111 () Bool)

(declare-fun e!30134 () Bool)

(declare-fun call!3698 () Bool)

(assert (=> b!47111 (= e!30134 call!3698)))

(declare-fun b!47112 () Bool)

(declare-fun e!30136 () Bool)

(assert (=> b!47112 (= e!30136 call!3698)))

(declare-fun b!47113 () Bool)

(assert (=> b!47113 (= e!30136 e!30134)))

(declare-fun lt!20346 () (_ BitVec 64))

(assert (=> b!47113 (= lt!20346 (select (arr!1473 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1338 0))(
  ( (Unit!1339) )
))
(declare-fun lt!20344 () Unit!1338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3070 (_ BitVec 64) (_ BitVec 32)) Unit!1338)

(assert (=> b!47113 (= lt!20344 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20346 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47113 (arrayContainsKey!0 _keys!1940 lt!20346 #b00000000000000000000000000000000)))

(declare-fun lt!20345 () Unit!1338)

(assert (=> b!47113 (= lt!20345 lt!20344)))

(declare-fun res!27430 () Bool)

(declare-datatypes ((SeekEntryResult!199 0))(
  ( (MissingZero!199 (index!2918 (_ BitVec 32))) (Found!199 (index!2919 (_ BitVec 32))) (Intermediate!199 (undefined!1011 Bool) (index!2920 (_ BitVec 32)) (x!8709 (_ BitVec 32))) (Undefined!199) (MissingVacant!199 (index!2921 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3070 (_ BitVec 32)) SeekEntryResult!199)

(assert (=> b!47113 (= res!27430 (= (seekEntryOrOpen!0 (select (arr!1473 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!199 #b00000000000000000000000000000000)))))

(assert (=> b!47113 (=> (not res!27430) (not e!30134))))

(declare-fun d!9409 () Bool)

(declare-fun res!27431 () Bool)

(declare-fun e!30135 () Bool)

(assert (=> d!9409 (=> res!27431 e!30135)))

(assert (=> d!9409 (= res!27431 (bvsge #b00000000000000000000000000000000 (size!1695 _keys!1940)))))

(assert (=> d!9409 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30135)))

(declare-fun b!47114 () Bool)

(assert (=> b!47114 (= e!30135 e!30136)))

(declare-fun c!6383 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47114 (= c!6383 (validKeyInArray!0 (select (arr!1473 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun bm!3695 () Bool)

(assert (=> bm!3695 (= call!3698 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(assert (= (and d!9409 (not res!27431)) b!47114))

(assert (= (and b!47114 c!6383) b!47113))

(assert (= (and b!47114 (not c!6383)) b!47112))

(assert (= (and b!47113 res!27430) b!47111))

(assert (= (or b!47111 b!47112) bm!3695))

(declare-fun m!41365 () Bool)

(assert (=> b!47113 m!41365))

(declare-fun m!41367 () Bool)

(assert (=> b!47113 m!41367))

(declare-fun m!41369 () Bool)

(assert (=> b!47113 m!41369))

(assert (=> b!47113 m!41365))

(declare-fun m!41371 () Bool)

(assert (=> b!47113 m!41371))

(assert (=> b!47114 m!41365))

(assert (=> b!47114 m!41365))

(declare-fun m!41373 () Bool)

(assert (=> b!47114 m!41373))

(declare-fun m!41375 () Bool)

(assert (=> bm!3695 m!41375))

(assert (=> b!47066 d!9409))

(declare-fun mapIsEmpty!2057 () Bool)

(declare-fun mapRes!2057 () Bool)

(assert (=> mapIsEmpty!2057 mapRes!2057))

(declare-fun condMapEmpty!2057 () Bool)

(declare-fun mapDefault!2057 () ValueCell!716)

(assert (=> mapNonEmpty!2048 (= condMapEmpty!2057 (= mapRest!2048 ((as const (Array (_ BitVec 32) ValueCell!716)) mapDefault!2057)))))

(declare-fun e!30141 () Bool)

(assert (=> mapNonEmpty!2048 (= tp!6197 (and e!30141 mapRes!2057))))

(declare-fun mapNonEmpty!2057 () Bool)

(declare-fun tp!6206 () Bool)

(declare-fun e!30142 () Bool)

(assert (=> mapNonEmpty!2057 (= mapRes!2057 (and tp!6206 e!30142))))

(declare-fun mapKey!2057 () (_ BitVec 32))

(declare-fun mapValue!2057 () ValueCell!716)

(declare-fun mapRest!2057 () (Array (_ BitVec 32) ValueCell!716))

(assert (=> mapNonEmpty!2057 (= mapRest!2048 (store mapRest!2057 mapKey!2057 mapValue!2057))))

(declare-fun b!47121 () Bool)

(assert (=> b!47121 (= e!30142 tp_is_empty!2011)))

(declare-fun b!47122 () Bool)

(assert (=> b!47122 (= e!30141 tp_is_empty!2011)))

(assert (= (and mapNonEmpty!2048 condMapEmpty!2057) mapIsEmpty!2057))

(assert (= (and mapNonEmpty!2048 (not condMapEmpty!2057)) mapNonEmpty!2057))

(assert (= (and mapNonEmpty!2057 ((_ is ValueCellFull!716) mapValue!2057)) b!47121))

(assert (= (and mapNonEmpty!2048 ((_ is ValueCellFull!716) mapDefault!2057)) b!47122))

(declare-fun m!41377 () Bool)

(assert (=> mapNonEmpty!2057 m!41377))

(check-sat tp_is_empty!2011 (not b!47113) (not mapNonEmpty!2057) (not b!47114) (not bm!3695))
(check-sat)
