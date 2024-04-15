; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39344 () Bool)

(assert start!39344)

(declare-fun b_free!9625 () Bool)

(declare-fun b_next!9625 () Bool)

(assert (=> start!39344 (= b_free!9625 (not b_next!9625))))

(declare-fun tp!34403 () Bool)

(declare-fun b_and!17099 () Bool)

(assert (=> start!39344 (= tp!34403 b_and!17099)))

(declare-fun b!417454 () Bool)

(declare-fun res!243181 () Bool)

(declare-fun e!249018 () Bool)

(assert (=> b!417454 (=> (not res!243181) (not e!249018))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417454 (= res!243181 (validMask!0 mask!1025))))

(declare-datatypes ((array!25397 0))(
  ( (array!25398 (arr!12148 (Array (_ BitVec 32) (_ BitVec 64))) (size!12501 (_ BitVec 32))) )
))
(declare-fun lt!191161 () array!25397)

(declare-datatypes ((V!15475 0))(
  ( (V!15476 (val!5433 Int)) )
))
(declare-fun minValue!515 () V!15475)

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!29025 () Bool)

(declare-datatypes ((ValueCell!5045 0))(
  ( (ValueCellFull!5045 (v!7674 V!15475)) (EmptyCell!5045) )
))
(declare-datatypes ((array!25399 0))(
  ( (array!25400 (arr!12149 (Array (_ BitVec 32) ValueCell!5045)) (size!12502 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25399)

(declare-fun zeroValue!515 () V!15475)

(declare-fun lt!191157 () array!25399)

(declare-fun c!55080 () Bool)

(declare-fun _keys!709 () array!25397)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7082 0))(
  ( (tuple2!7083 (_1!3552 (_ BitVec 64)) (_2!3552 V!15475)) )
))
(declare-datatypes ((List!7081 0))(
  ( (Nil!7078) (Cons!7077 (h!7933 tuple2!7082) (t!12362 List!7081)) )
))
(declare-datatypes ((ListLongMap!5985 0))(
  ( (ListLongMap!5986 (toList!3008 List!7081)) )
))
(declare-fun call!29028 () ListLongMap!5985)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1219 (array!25397 array!25399 (_ BitVec 32) (_ BitVec 32) V!15475 V!15475 (_ BitVec 32) Int) ListLongMap!5985)

(assert (=> bm!29025 (= call!29028 (getCurrentListMapNoExtraKeys!1219 (ite c!55080 lt!191161 _keys!709) (ite c!55080 lt!191157 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417456 () Bool)

(declare-fun res!243187 () Bool)

(assert (=> b!417456 (=> (not res!243187) (not e!249018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25397 (_ BitVec 32)) Bool)

(assert (=> b!417456 (= res!243187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417457 () Bool)

(declare-fun e!249013 () Bool)

(assert (=> b!417457 (= e!249013 true)))

(declare-fun lt!191156 () tuple2!7082)

(declare-fun lt!191162 () V!15475)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!191158 () ListLongMap!5985)

(declare-fun +!1237 (ListLongMap!5985 tuple2!7082) ListLongMap!5985)

(assert (=> b!417457 (= (+!1237 lt!191158 lt!191156) (+!1237 (+!1237 lt!191158 (tuple2!7083 k0!794 lt!191162)) lt!191156))))

(declare-fun lt!191154 () V!15475)

(assert (=> b!417457 (= lt!191156 (tuple2!7083 k0!794 lt!191154))))

(declare-datatypes ((Unit!12316 0))(
  ( (Unit!12317) )
))
(declare-fun lt!191155 () Unit!12316)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!25 (ListLongMap!5985 (_ BitVec 64) V!15475 V!15475) Unit!12316)

(assert (=> b!417457 (= lt!191155 (addSameAsAddTwiceSameKeyDiffValues!25 lt!191158 k0!794 lt!191162 lt!191154))))

(declare-fun lt!191153 () V!15475)

(declare-fun get!6008 (ValueCell!5045 V!15475) V!15475)

(assert (=> b!417457 (= lt!191162 (get!6008 (select (arr!12149 _values!549) from!863) lt!191153))))

(declare-fun lt!191152 () ListLongMap!5985)

(assert (=> b!417457 (= lt!191152 (+!1237 lt!191158 (tuple2!7083 (select (arr!12148 lt!191161) from!863) lt!191154)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15475)

(assert (=> b!417457 (= lt!191154 (get!6008 (select (store (arr!12149 _values!549) i!563 (ValueCellFull!5045 v!412)) from!863) lt!191153))))

(declare-fun dynLambda!682 (Int (_ BitVec 64)) V!15475)

(assert (=> b!417457 (= lt!191153 (dynLambda!682 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!417457 (= lt!191158 (getCurrentListMapNoExtraKeys!1219 lt!191161 lt!191157 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29029 () ListLongMap!5985)

(declare-fun bm!29026 () Bool)

(assert (=> bm!29026 (= call!29029 (getCurrentListMapNoExtraKeys!1219 (ite c!55080 _keys!709 lt!191161) (ite c!55080 _values!549 lt!191157) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417458 () Bool)

(declare-fun res!243179 () Bool)

(assert (=> b!417458 (=> (not res!243179) (not e!249018))))

(assert (=> b!417458 (= res!243179 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12501 _keys!709))))))

(declare-fun mapIsEmpty!17787 () Bool)

(declare-fun mapRes!17787 () Bool)

(assert (=> mapIsEmpty!17787 mapRes!17787))

(declare-fun b!417459 () Bool)

(declare-fun e!249020 () Bool)

(assert (=> b!417459 (= e!249018 e!249020)))

(declare-fun res!243186 () Bool)

(assert (=> b!417459 (=> (not res!243186) (not e!249020))))

(assert (=> b!417459 (= res!243186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191161 mask!1025))))

(assert (=> b!417459 (= lt!191161 (array!25398 (store (arr!12148 _keys!709) i!563 k0!794) (size!12501 _keys!709)))))

(declare-fun b!417460 () Bool)

(declare-fun res!243190 () Bool)

(assert (=> b!417460 (=> (not res!243190) (not e!249018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417460 (= res!243190 (validKeyInArray!0 k0!794))))

(declare-fun b!417455 () Bool)

(declare-fun res!243182 () Bool)

(assert (=> b!417455 (=> (not res!243182) (not e!249020))))

(assert (=> b!417455 (= res!243182 (bvsle from!863 i!563))))

(declare-fun res!243192 () Bool)

(assert (=> start!39344 (=> (not res!243192) (not e!249018))))

(assert (=> start!39344 (= res!243192 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12501 _keys!709))))))

(assert (=> start!39344 e!249018))

(declare-fun tp_is_empty!10777 () Bool)

(assert (=> start!39344 tp_is_empty!10777))

(assert (=> start!39344 tp!34403))

(assert (=> start!39344 true))

(declare-fun e!249017 () Bool)

(declare-fun array_inv!8902 (array!25399) Bool)

(assert (=> start!39344 (and (array_inv!8902 _values!549) e!249017)))

(declare-fun array_inv!8903 (array!25397) Bool)

(assert (=> start!39344 (array_inv!8903 _keys!709)))

(declare-fun b!417461 () Bool)

(declare-fun e!249014 () Bool)

(assert (=> b!417461 (= e!249014 tp_is_empty!10777)))

(declare-fun b!417462 () Bool)

(declare-fun res!243189 () Bool)

(assert (=> b!417462 (=> (not res!243189) (not e!249018))))

(assert (=> b!417462 (= res!243189 (or (= (select (arr!12148 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12148 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417463 () Bool)

(declare-fun res!243184 () Bool)

(assert (=> b!417463 (=> (not res!243184) (not e!249018))))

(declare-datatypes ((List!7082 0))(
  ( (Nil!7079) (Cons!7078 (h!7934 (_ BitVec 64)) (t!12363 List!7082)) )
))
(declare-fun arrayNoDuplicates!0 (array!25397 (_ BitVec 32) List!7082) Bool)

(assert (=> b!417463 (= res!243184 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7079))))

(declare-fun b!417464 () Bool)

(declare-fun res!243191 () Bool)

(assert (=> b!417464 (=> (not res!243191) (not e!249020))))

(assert (=> b!417464 (= res!243191 (arrayNoDuplicates!0 lt!191161 #b00000000000000000000000000000000 Nil!7079))))

(declare-fun b!417465 () Bool)

(declare-fun e!249015 () Bool)

(assert (=> b!417465 (= e!249015 tp_is_empty!10777)))

(declare-fun b!417466 () Bool)

(declare-fun res!243180 () Bool)

(assert (=> b!417466 (=> (not res!243180) (not e!249018))))

(declare-fun arrayContainsKey!0 (array!25397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417466 (= res!243180 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417467 () Bool)

(assert (=> b!417467 (= e!249017 (and e!249014 mapRes!17787))))

(declare-fun condMapEmpty!17787 () Bool)

(declare-fun mapDefault!17787 () ValueCell!5045)

(assert (=> b!417467 (= condMapEmpty!17787 (= (arr!12149 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5045)) mapDefault!17787)))))

(declare-fun b!417468 () Bool)

(declare-fun res!243188 () Bool)

(assert (=> b!417468 (=> (not res!243188) (not e!249018))))

(assert (=> b!417468 (= res!243188 (and (= (size!12502 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12501 _keys!709) (size!12502 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!417469 () Bool)

(declare-fun e!249021 () Bool)

(assert (=> b!417469 (= e!249020 e!249021)))

(declare-fun res!243183 () Bool)

(assert (=> b!417469 (=> (not res!243183) (not e!249021))))

(assert (=> b!417469 (= res!243183 (= from!863 i!563))))

(assert (=> b!417469 (= lt!191152 (getCurrentListMapNoExtraKeys!1219 lt!191161 lt!191157 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417469 (= lt!191157 (array!25400 (store (arr!12149 _values!549) i!563 (ValueCellFull!5045 v!412)) (size!12502 _values!549)))))

(declare-fun lt!191160 () ListLongMap!5985)

(assert (=> b!417469 (= lt!191160 (getCurrentListMapNoExtraKeys!1219 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun e!249019 () Bool)

(declare-fun b!417470 () Bool)

(assert (=> b!417470 (= e!249019 (= call!29028 (+!1237 call!29029 (tuple2!7083 k0!794 v!412))))))

(declare-fun b!417471 () Bool)

(assert (=> b!417471 (= e!249019 (= call!29029 call!29028))))

(declare-fun b!417472 () Bool)

(assert (=> b!417472 (= e!249021 (not e!249013))))

(declare-fun res!243185 () Bool)

(assert (=> b!417472 (=> res!243185 e!249013)))

(assert (=> b!417472 (= res!243185 (validKeyInArray!0 (select (arr!12148 _keys!709) from!863)))))

(assert (=> b!417472 e!249019))

(assert (=> b!417472 (= c!55080 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191159 () Unit!12316)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!415 (array!25397 array!25399 (_ BitVec 32) (_ BitVec 32) V!15475 V!15475 (_ BitVec 32) (_ BitVec 64) V!15475 (_ BitVec 32) Int) Unit!12316)

(assert (=> b!417472 (= lt!191159 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!415 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17787 () Bool)

(declare-fun tp!34404 () Bool)

(assert (=> mapNonEmpty!17787 (= mapRes!17787 (and tp!34404 e!249015))))

(declare-fun mapKey!17787 () (_ BitVec 32))

(declare-fun mapRest!17787 () (Array (_ BitVec 32) ValueCell!5045))

(declare-fun mapValue!17787 () ValueCell!5045)

(assert (=> mapNonEmpty!17787 (= (arr!12149 _values!549) (store mapRest!17787 mapKey!17787 mapValue!17787))))

(assert (= (and start!39344 res!243192) b!417454))

(assert (= (and b!417454 res!243181) b!417468))

(assert (= (and b!417468 res!243188) b!417456))

(assert (= (and b!417456 res!243187) b!417463))

(assert (= (and b!417463 res!243184) b!417458))

(assert (= (and b!417458 res!243179) b!417460))

(assert (= (and b!417460 res!243190) b!417462))

(assert (= (and b!417462 res!243189) b!417466))

(assert (= (and b!417466 res!243180) b!417459))

(assert (= (and b!417459 res!243186) b!417464))

(assert (= (and b!417464 res!243191) b!417455))

(assert (= (and b!417455 res!243182) b!417469))

(assert (= (and b!417469 res!243183) b!417472))

(assert (= (and b!417472 c!55080) b!417470))

(assert (= (and b!417472 (not c!55080)) b!417471))

(assert (= (or b!417470 b!417471) bm!29025))

(assert (= (or b!417470 b!417471) bm!29026))

(assert (= (and b!417472 (not res!243185)) b!417457))

(assert (= (and b!417467 condMapEmpty!17787) mapIsEmpty!17787))

(assert (= (and b!417467 (not condMapEmpty!17787)) mapNonEmpty!17787))

(get-info :version)

(assert (= (and mapNonEmpty!17787 ((_ is ValueCellFull!5045) mapValue!17787)) b!417465))

(assert (= (and b!417467 ((_ is ValueCellFull!5045) mapDefault!17787)) b!417461))

(assert (= start!39344 b!417467))

(declare-fun b_lambda!8911 () Bool)

(assert (=> (not b_lambda!8911) (not b!417457)))

(declare-fun t!12361 () Bool)

(declare-fun tb!3239 () Bool)

(assert (=> (and start!39344 (= defaultEntry!557 defaultEntry!557) t!12361) tb!3239))

(declare-fun result!6013 () Bool)

(assert (=> tb!3239 (= result!6013 tp_is_empty!10777)))

(assert (=> b!417457 t!12361))

(declare-fun b_and!17101 () Bool)

(assert (= b_and!17099 (and (=> t!12361 result!6013) b_and!17101)))

(declare-fun m!406299 () Bool)

(assert (=> b!417456 m!406299))

(declare-fun m!406301 () Bool)

(assert (=> b!417466 m!406301))

(declare-fun m!406303 () Bool)

(assert (=> bm!29026 m!406303))

(declare-fun m!406305 () Bool)

(assert (=> mapNonEmpty!17787 m!406305))

(declare-fun m!406307 () Bool)

(assert (=> b!417470 m!406307))

(declare-fun m!406309 () Bool)

(assert (=> b!417454 m!406309))

(declare-fun m!406311 () Bool)

(assert (=> start!39344 m!406311))

(declare-fun m!406313 () Bool)

(assert (=> start!39344 m!406313))

(declare-fun m!406315 () Bool)

(assert (=> b!417462 m!406315))

(declare-fun m!406317 () Bool)

(assert (=> b!417459 m!406317))

(declare-fun m!406319 () Bool)

(assert (=> b!417459 m!406319))

(declare-fun m!406321 () Bool)

(assert (=> b!417464 m!406321))

(declare-fun m!406323 () Bool)

(assert (=> b!417472 m!406323))

(assert (=> b!417472 m!406323))

(declare-fun m!406325 () Bool)

(assert (=> b!417472 m!406325))

(declare-fun m!406327 () Bool)

(assert (=> b!417472 m!406327))

(declare-fun m!406329 () Bool)

(assert (=> b!417469 m!406329))

(declare-fun m!406331 () Bool)

(assert (=> b!417469 m!406331))

(declare-fun m!406333 () Bool)

(assert (=> b!417469 m!406333))

(declare-fun m!406335 () Bool)

(assert (=> b!417463 m!406335))

(declare-fun m!406337 () Bool)

(assert (=> b!417460 m!406337))

(declare-fun m!406339 () Bool)

(assert (=> b!417457 m!406339))

(declare-fun m!406341 () Bool)

(assert (=> b!417457 m!406341))

(declare-fun m!406343 () Bool)

(assert (=> b!417457 m!406343))

(declare-fun m!406345 () Bool)

(assert (=> b!417457 m!406345))

(declare-fun m!406347 () Bool)

(assert (=> b!417457 m!406347))

(declare-fun m!406349 () Bool)

(assert (=> b!417457 m!406349))

(declare-fun m!406351 () Bool)

(assert (=> b!417457 m!406351))

(declare-fun m!406353 () Bool)

(assert (=> b!417457 m!406353))

(assert (=> b!417457 m!406341))

(declare-fun m!406355 () Bool)

(assert (=> b!417457 m!406355))

(assert (=> b!417457 m!406349))

(declare-fun m!406357 () Bool)

(assert (=> b!417457 m!406357))

(assert (=> b!417457 m!406351))

(declare-fun m!406359 () Bool)

(assert (=> b!417457 m!406359))

(declare-fun m!406361 () Bool)

(assert (=> b!417457 m!406361))

(assert (=> b!417457 m!406331))

(declare-fun m!406363 () Bool)

(assert (=> bm!29025 m!406363))

(check-sat (not b!417466) (not b!417454) (not bm!29025) (not b_lambda!8911) tp_is_empty!10777 (not b!417463) (not b!417456) (not b_next!9625) (not b!417460) (not b!417464) (not start!39344) (not b!417472) (not mapNonEmpty!17787) b_and!17101 (not b!417457) (not b!417459) (not b!417470) (not bm!29026) (not b!417469))
(check-sat b_and!17101 (not b_next!9625))
