; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7338 () Bool)

(assert start!7338)

(declare-fun b!47052 () Bool)

(declare-fun e!30091 () Bool)

(declare-fun tp_is_empty!2011 () Bool)

(assert (=> b!47052 (= e!30091 tp_is_empty!2011)))

(declare-fun mapIsEmpty!2048 () Bool)

(declare-fun mapRes!2048 () Bool)

(assert (=> mapIsEmpty!2048 mapRes!2048))

(declare-fun b!47053 () Bool)

(declare-fun e!30087 () Bool)

(declare-fun e!30088 () Bool)

(assert (=> b!47053 (= e!30087 (and e!30088 mapRes!2048))))

(declare-fun condMapEmpty!2048 () Bool)

(declare-datatypes ((V!2415 0))(
  ( (V!2416 (val!1044 Int)) )
))
(declare-datatypes ((ValueCell!716 0))(
  ( (ValueCellFull!716 (v!2102 V!2415)) (EmptyCell!716) )
))
(declare-datatypes ((array!3058 0))(
  ( (array!3059 (arr!1467 (Array (_ BitVec 32) ValueCell!716)) (size!1690 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3058)

(declare-fun mapDefault!2048 () ValueCell!716)

(assert (=> b!47053 (= condMapEmpty!2048 (= (arr!1467 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!716)) mapDefault!2048)))))

(declare-fun mapNonEmpty!2048 () Bool)

(declare-fun tp!6197 () Bool)

(assert (=> mapNonEmpty!2048 (= mapRes!2048 (and tp!6197 e!30091))))

(declare-fun mapValue!2048 () ValueCell!716)

(declare-fun mapRest!2048 () (Array (_ BitVec 32) ValueCell!716))

(declare-fun mapKey!2048 () (_ BitVec 32))

(assert (=> mapNonEmpty!2048 (= (arr!1467 _values!1550) (store mapRest!2048 mapKey!2048 mapValue!2048))))

(declare-fun res!27410 () Bool)

(declare-fun e!30090 () Bool)

(assert (=> start!7338 (=> (not res!27410) (not e!30090))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7338 (= res!27410 (validMask!0 mask!2458))))

(assert (=> start!7338 e!30090))

(assert (=> start!7338 true))

(declare-fun array_inv!884 (array!3058) Bool)

(assert (=> start!7338 (and (array_inv!884 _values!1550) e!30087)))

(declare-datatypes ((array!3060 0))(
  ( (array!3061 (arr!1468 (Array (_ BitVec 32) (_ BitVec 64))) (size!1691 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3060)

(declare-fun array_inv!885 (array!3060) Bool)

(assert (=> start!7338 (array_inv!885 _keys!1940)))

(declare-fun b!47054 () Bool)

(assert (=> b!47054 (= e!30088 tp_is_empty!2011)))

(declare-fun b!47055 () Bool)

(assert (=> b!47055 (= e!30090 (bvsgt #b00000000000000000000000000000000 (size!1691 _keys!1940)))))

(declare-fun b!47056 () Bool)

(declare-fun res!27411 () Bool)

(assert (=> b!47056 (=> (not res!27411) (not e!30090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3060 (_ BitVec 32)) Bool)

(assert (=> b!47056 (= res!27411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47057 () Bool)

(declare-fun res!27412 () Bool)

(assert (=> b!47057 (=> (not res!27412) (not e!30090))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47057 (= res!27412 (and (= (size!1690 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1691 _keys!1940) (size!1690 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(assert (= (and start!7338 res!27410) b!47057))

(assert (= (and b!47057 res!27412) b!47056))

(assert (= (and b!47056 res!27411) b!47055))

(assert (= (and b!47053 condMapEmpty!2048) mapIsEmpty!2048))

(assert (= (and b!47053 (not condMapEmpty!2048)) mapNonEmpty!2048))

(get-info :version)

(assert (= (and mapNonEmpty!2048 ((_ is ValueCellFull!716) mapValue!2048)) b!47052))

(assert (= (and b!47053 ((_ is ValueCellFull!716) mapDefault!2048)) b!47054))

(assert (= start!7338 b!47053))

(declare-fun m!41377 () Bool)

(assert (=> mapNonEmpty!2048 m!41377))

(declare-fun m!41379 () Bool)

(assert (=> start!7338 m!41379))

(declare-fun m!41381 () Bool)

(assert (=> start!7338 m!41381))

(declare-fun m!41383 () Bool)

(assert (=> start!7338 m!41383))

(declare-fun m!41385 () Bool)

(assert (=> b!47056 m!41385))

(check-sat (not start!7338) (not b!47056) (not mapNonEmpty!2048) tp_is_empty!2011)
(check-sat)
(get-model)

(declare-fun d!9389 () Bool)

(assert (=> d!9389 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7338 d!9389))

(declare-fun d!9391 () Bool)

(assert (=> d!9391 (= (array_inv!884 _values!1550) (bvsge (size!1690 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7338 d!9391))

(declare-fun d!9393 () Bool)

(assert (=> d!9393 (= (array_inv!885 _keys!1940) (bvsge (size!1691 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7338 d!9393))

(declare-fun d!9395 () Bool)

(declare-fun res!27436 () Bool)

(declare-fun e!30129 () Bool)

(assert (=> d!9395 (=> res!27436 e!30129)))

(assert (=> d!9395 (= res!27436 (bvsge #b00000000000000000000000000000000 (size!1691 _keys!1940)))))

(assert (=> d!9395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30129)))

(declare-fun b!47102 () Bool)

(declare-fun e!30128 () Bool)

(assert (=> b!47102 (= e!30129 e!30128)))

(declare-fun c!6376 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47102 (= c!6376 (validKeyInArray!0 (select (arr!1468 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun b!47103 () Bool)

(declare-fun e!30130 () Bool)

(declare-fun call!3711 () Bool)

(assert (=> b!47103 (= e!30130 call!3711)))

(declare-fun b!47104 () Bool)

(assert (=> b!47104 (= e!30128 e!30130)))

(declare-fun lt!20371 () (_ BitVec 64))

(assert (=> b!47104 (= lt!20371 (select (arr!1468 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1332 0))(
  ( (Unit!1333) )
))
(declare-fun lt!20372 () Unit!1332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3060 (_ BitVec 64) (_ BitVec 32)) Unit!1332)

(assert (=> b!47104 (= lt!20372 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20371 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47104 (arrayContainsKey!0 _keys!1940 lt!20371 #b00000000000000000000000000000000)))

(declare-fun lt!20373 () Unit!1332)

(assert (=> b!47104 (= lt!20373 lt!20372)))

(declare-fun res!27435 () Bool)

(declare-datatypes ((SeekEntryResult!208 0))(
  ( (MissingZero!208 (index!2954 (_ BitVec 32))) (Found!208 (index!2955 (_ BitVec 32))) (Intermediate!208 (undefined!1020 Bool) (index!2956 (_ BitVec 32)) (x!8717 (_ BitVec 32))) (Undefined!208) (MissingVacant!208 (index!2957 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3060 (_ BitVec 32)) SeekEntryResult!208)

(assert (=> b!47104 (= res!27435 (= (seekEntryOrOpen!0 (select (arr!1468 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!208 #b00000000000000000000000000000000)))))

(assert (=> b!47104 (=> (not res!27435) (not e!30130))))

(declare-fun b!47105 () Bool)

(assert (=> b!47105 (= e!30128 call!3711)))

(declare-fun bm!3708 () Bool)

(assert (=> bm!3708 (= call!3711 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(assert (= (and d!9395 (not res!27436)) b!47102))

(assert (= (and b!47102 c!6376) b!47104))

(assert (= (and b!47102 (not c!6376)) b!47105))

(assert (= (and b!47104 res!27435) b!47103))

(assert (= (or b!47103 b!47105) bm!3708))

(declare-fun m!41407 () Bool)

(assert (=> b!47102 m!41407))

(assert (=> b!47102 m!41407))

(declare-fun m!41409 () Bool)

(assert (=> b!47102 m!41409))

(assert (=> b!47104 m!41407))

(declare-fun m!41411 () Bool)

(assert (=> b!47104 m!41411))

(declare-fun m!41413 () Bool)

(assert (=> b!47104 m!41413))

(assert (=> b!47104 m!41407))

(declare-fun m!41415 () Bool)

(assert (=> b!47104 m!41415))

(declare-fun m!41417 () Bool)

(assert (=> bm!3708 m!41417))

(assert (=> b!47056 d!9395))

(declare-fun mapIsEmpty!2057 () Bool)

(declare-fun mapRes!2057 () Bool)

(assert (=> mapIsEmpty!2057 mapRes!2057))

(declare-fun mapNonEmpty!2057 () Bool)

(declare-fun tp!6206 () Bool)

(declare-fun e!30136 () Bool)

(assert (=> mapNonEmpty!2057 (= mapRes!2057 (and tp!6206 e!30136))))

(declare-fun mapKey!2057 () (_ BitVec 32))

(declare-fun mapRest!2057 () (Array (_ BitVec 32) ValueCell!716))

(declare-fun mapValue!2057 () ValueCell!716)

(assert (=> mapNonEmpty!2057 (= mapRest!2048 (store mapRest!2057 mapKey!2057 mapValue!2057))))

(declare-fun b!47113 () Bool)

(declare-fun e!30135 () Bool)

(assert (=> b!47113 (= e!30135 tp_is_empty!2011)))

(declare-fun b!47112 () Bool)

(assert (=> b!47112 (= e!30136 tp_is_empty!2011)))

(declare-fun condMapEmpty!2057 () Bool)

(declare-fun mapDefault!2057 () ValueCell!716)

(assert (=> mapNonEmpty!2048 (= condMapEmpty!2057 (= mapRest!2048 ((as const (Array (_ BitVec 32) ValueCell!716)) mapDefault!2057)))))

(assert (=> mapNonEmpty!2048 (= tp!6197 (and e!30135 mapRes!2057))))

(assert (= (and mapNonEmpty!2048 condMapEmpty!2057) mapIsEmpty!2057))

(assert (= (and mapNonEmpty!2048 (not condMapEmpty!2057)) mapNonEmpty!2057))

(assert (= (and mapNonEmpty!2057 ((_ is ValueCellFull!716) mapValue!2057)) b!47112))

(assert (= (and mapNonEmpty!2048 ((_ is ValueCellFull!716) mapDefault!2057)) b!47113))

(declare-fun m!41419 () Bool)

(assert (=> mapNonEmpty!2057 m!41419))

(check-sat (not mapNonEmpty!2057) (not b!47104) (not bm!3708) (not b!47102) tp_is_empty!2011)
(check-sat)
