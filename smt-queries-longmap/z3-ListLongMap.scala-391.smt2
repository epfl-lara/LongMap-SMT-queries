; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7366 () Bool)

(assert start!7366)

(declare-fun b!47202 () Bool)

(declare-fun e!30209 () Bool)

(declare-fun tp_is_empty!2023 () Bool)

(assert (=> b!47202 (= e!30209 tp_is_empty!2023)))

(declare-fun b!47203 () Bool)

(declare-fun e!30211 () Bool)

(assert (=> b!47203 (= e!30211 tp_is_empty!2023)))

(declare-fun b!47204 () Bool)

(declare-fun e!30210 () Bool)

(declare-datatypes ((List!1249 0))(
  ( (Nil!1246) (Cons!1245 (h!1825 (_ BitVec 64)) (t!4276 List!1249)) )
))
(declare-fun noDuplicate!35 (List!1249) Bool)

(assert (=> b!47204 (= e!30210 (not (noDuplicate!35 Nil!1246)))))

(declare-fun b!47205 () Bool)

(declare-fun res!27480 () Bool)

(assert (=> b!47205 (=> (not res!27480) (not e!30210))))

(declare-datatypes ((array!3086 0))(
  ( (array!3087 (arr!1479 (Array (_ BitVec 32) (_ BitVec 64))) (size!1702 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3086)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3086 (_ BitVec 32)) Bool)

(assert (=> b!47205 (= res!27480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun mapIsEmpty!2072 () Bool)

(declare-fun mapRes!2072 () Bool)

(assert (=> mapIsEmpty!2072 mapRes!2072))

(declare-fun mapNonEmpty!2072 () Bool)

(declare-fun tp!6221 () Bool)

(assert (=> mapNonEmpty!2072 (= mapRes!2072 (and tp!6221 e!30211))))

(declare-fun mapKey!2072 () (_ BitVec 32))

(declare-datatypes ((V!2431 0))(
  ( (V!2432 (val!1050 Int)) )
))
(declare-datatypes ((ValueCell!722 0))(
  ( (ValueCellFull!722 (v!2108 V!2431)) (EmptyCell!722) )
))
(declare-fun mapValue!2072 () ValueCell!722)

(declare-datatypes ((array!3088 0))(
  ( (array!3089 (arr!1480 (Array (_ BitVec 32) ValueCell!722)) (size!1703 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3088)

(declare-fun mapRest!2072 () (Array (_ BitVec 32) ValueCell!722))

(assert (=> mapNonEmpty!2072 (= (arr!1480 _values!1550) (store mapRest!2072 mapKey!2072 mapValue!2072))))

(declare-fun b!47206 () Bool)

(declare-fun e!30207 () Bool)

(assert (=> b!47206 (= e!30207 (and e!30209 mapRes!2072))))

(declare-fun condMapEmpty!2072 () Bool)

(declare-fun mapDefault!2072 () ValueCell!722)

(assert (=> b!47206 (= condMapEmpty!2072 (= (arr!1480 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!722)) mapDefault!2072)))))

(declare-fun b!47207 () Bool)

(declare-fun res!27478 () Bool)

(assert (=> b!47207 (=> (not res!27478) (not e!30210))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47207 (= res!27478 (and (= (size!1703 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1702 _keys!1940) (size!1703 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47208 () Bool)

(declare-fun res!27479 () Bool)

(assert (=> b!47208 (=> (not res!27479) (not e!30210))))

(assert (=> b!47208 (= res!27479 (and (bvsle #b00000000000000000000000000000000 (size!1702 _keys!1940)) (bvslt (size!1702 _keys!1940) #b01111111111111111111111111111111)))))

(declare-fun res!27481 () Bool)

(assert (=> start!7366 (=> (not res!27481) (not e!30210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7366 (= res!27481 (validMask!0 mask!2458))))

(assert (=> start!7366 e!30210))

(assert (=> start!7366 true))

(declare-fun array_inv!892 (array!3088) Bool)

(assert (=> start!7366 (and (array_inv!892 _values!1550) e!30207)))

(declare-fun array_inv!893 (array!3086) Bool)

(assert (=> start!7366 (array_inv!893 _keys!1940)))

(assert (= (and start!7366 res!27481) b!47207))

(assert (= (and b!47207 res!27478) b!47205))

(assert (= (and b!47205 res!27480) b!47208))

(assert (= (and b!47208 res!27479) b!47204))

(assert (= (and b!47206 condMapEmpty!2072) mapIsEmpty!2072))

(assert (= (and b!47206 (not condMapEmpty!2072)) mapNonEmpty!2072))

(get-info :version)

(assert (= (and mapNonEmpty!2072 ((_ is ValueCellFull!722) mapValue!2072)) b!47203))

(assert (= (and b!47206 ((_ is ValueCellFull!722) mapDefault!2072)) b!47202))

(assert (= start!7366 b!47206))

(declare-fun m!41465 () Bool)

(assert (=> b!47204 m!41465))

(declare-fun m!41467 () Bool)

(assert (=> b!47205 m!41467))

(declare-fun m!41469 () Bool)

(assert (=> mapNonEmpty!2072 m!41469))

(declare-fun m!41471 () Bool)

(assert (=> start!7366 m!41471))

(declare-fun m!41473 () Bool)

(assert (=> start!7366 m!41473))

(declare-fun m!41475 () Bool)

(assert (=> start!7366 m!41475))

(check-sat (not mapNonEmpty!2072) (not b!47204) tp_is_empty!2023 (not b!47205) (not start!7366))
(check-sat)
(get-model)

(declare-fun d!9409 () Bool)

(assert (=> d!9409 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7366 d!9409))

(declare-fun d!9411 () Bool)

(assert (=> d!9411 (= (array_inv!892 _values!1550) (bvsge (size!1703 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7366 d!9411))

(declare-fun d!9413 () Bool)

(assert (=> d!9413 (= (array_inv!893 _keys!1940) (bvsge (size!1702 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7366 d!9413))

(declare-fun d!9415 () Bool)

(declare-fun res!27510 () Bool)

(declare-fun e!30246 () Bool)

(assert (=> d!9415 (=> res!27510 e!30246)))

(assert (=> d!9415 (= res!27510 ((_ is Nil!1246) Nil!1246))))

(assert (=> d!9415 (= (noDuplicate!35 Nil!1246) e!30246)))

(declare-fun b!47255 () Bool)

(declare-fun e!30247 () Bool)

(assert (=> b!47255 (= e!30246 e!30247)))

(declare-fun res!27511 () Bool)

(assert (=> b!47255 (=> (not res!27511) (not e!30247))))

(declare-fun contains!581 (List!1249 (_ BitVec 64)) Bool)

(assert (=> b!47255 (= res!27511 (not (contains!581 (t!4276 Nil!1246) (h!1825 Nil!1246))))))

(declare-fun b!47256 () Bool)

(assert (=> b!47256 (= e!30247 (noDuplicate!35 (t!4276 Nil!1246)))))

(assert (= (and d!9415 (not res!27510)) b!47255))

(assert (= (and b!47255 res!27511) b!47256))

(declare-fun m!41501 () Bool)

(assert (=> b!47255 m!41501))

(declare-fun m!41503 () Bool)

(assert (=> b!47256 m!41503))

(assert (=> b!47204 d!9415))

(declare-fun b!47265 () Bool)

(declare-fun e!30255 () Bool)

(declare-fun e!30256 () Bool)

(assert (=> b!47265 (= e!30255 e!30256)))

(declare-fun lt!20389 () (_ BitVec 64))

(assert (=> b!47265 (= lt!20389 (select (arr!1479 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1336 0))(
  ( (Unit!1337) )
))
(declare-fun lt!20390 () Unit!1336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3086 (_ BitVec 64) (_ BitVec 32)) Unit!1336)

(assert (=> b!47265 (= lt!20390 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20389 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47265 (arrayContainsKey!0 _keys!1940 lt!20389 #b00000000000000000000000000000000)))

(declare-fun lt!20391 () Unit!1336)

(assert (=> b!47265 (= lt!20391 lt!20390)))

(declare-fun res!27517 () Bool)

(declare-datatypes ((SeekEntryResult!210 0))(
  ( (MissingZero!210 (index!2962 (_ BitVec 32))) (Found!210 (index!2963 (_ BitVec 32))) (Intermediate!210 (undefined!1022 Bool) (index!2964 (_ BitVec 32)) (x!8739 (_ BitVec 32))) (Undefined!210) (MissingVacant!210 (index!2965 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3086 (_ BitVec 32)) SeekEntryResult!210)

(assert (=> b!47265 (= res!27517 (= (seekEntryOrOpen!0 (select (arr!1479 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!210 #b00000000000000000000000000000000)))))

(assert (=> b!47265 (=> (not res!27517) (not e!30256))))

(declare-fun b!47266 () Bool)

(declare-fun call!3717 () Bool)

(assert (=> b!47266 (= e!30255 call!3717)))

(declare-fun b!47267 () Bool)

(assert (=> b!47267 (= e!30256 call!3717)))

(declare-fun d!9417 () Bool)

(declare-fun res!27516 () Bool)

(declare-fun e!30254 () Bool)

(assert (=> d!9417 (=> res!27516 e!30254)))

(assert (=> d!9417 (= res!27516 (bvsge #b00000000000000000000000000000000 (size!1702 _keys!1940)))))

(assert (=> d!9417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30254)))

(declare-fun b!47268 () Bool)

(assert (=> b!47268 (= e!30254 e!30255)))

(declare-fun c!6382 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47268 (= c!6382 (validKeyInArray!0 (select (arr!1479 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun bm!3714 () Bool)

(assert (=> bm!3714 (= call!3717 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(assert (= (and d!9417 (not res!27516)) b!47268))

(assert (= (and b!47268 c!6382) b!47265))

(assert (= (and b!47268 (not c!6382)) b!47266))

(assert (= (and b!47265 res!27517) b!47267))

(assert (= (or b!47267 b!47266) bm!3714))

(declare-fun m!41505 () Bool)

(assert (=> b!47265 m!41505))

(declare-fun m!41507 () Bool)

(assert (=> b!47265 m!41507))

(declare-fun m!41509 () Bool)

(assert (=> b!47265 m!41509))

(assert (=> b!47265 m!41505))

(declare-fun m!41511 () Bool)

(assert (=> b!47265 m!41511))

(assert (=> b!47268 m!41505))

(assert (=> b!47268 m!41505))

(declare-fun m!41513 () Bool)

(assert (=> b!47268 m!41513))

(declare-fun m!41515 () Bool)

(assert (=> bm!3714 m!41515))

(assert (=> b!47205 d!9417))

(declare-fun b!47275 () Bool)

(declare-fun e!30262 () Bool)

(assert (=> b!47275 (= e!30262 tp_is_empty!2023)))

(declare-fun mapIsEmpty!2081 () Bool)

(declare-fun mapRes!2081 () Bool)

(assert (=> mapIsEmpty!2081 mapRes!2081))

(declare-fun b!47276 () Bool)

(declare-fun e!30261 () Bool)

(assert (=> b!47276 (= e!30261 tp_is_empty!2023)))

(declare-fun mapNonEmpty!2081 () Bool)

(declare-fun tp!6230 () Bool)

(assert (=> mapNonEmpty!2081 (= mapRes!2081 (and tp!6230 e!30262))))

(declare-fun mapValue!2081 () ValueCell!722)

(declare-fun mapRest!2081 () (Array (_ BitVec 32) ValueCell!722))

(declare-fun mapKey!2081 () (_ BitVec 32))

(assert (=> mapNonEmpty!2081 (= mapRest!2072 (store mapRest!2081 mapKey!2081 mapValue!2081))))

(declare-fun condMapEmpty!2081 () Bool)

(declare-fun mapDefault!2081 () ValueCell!722)

(assert (=> mapNonEmpty!2072 (= condMapEmpty!2081 (= mapRest!2072 ((as const (Array (_ BitVec 32) ValueCell!722)) mapDefault!2081)))))

(assert (=> mapNonEmpty!2072 (= tp!6221 (and e!30261 mapRes!2081))))

(assert (= (and mapNonEmpty!2072 condMapEmpty!2081) mapIsEmpty!2081))

(assert (= (and mapNonEmpty!2072 (not condMapEmpty!2081)) mapNonEmpty!2081))

(assert (= (and mapNonEmpty!2081 ((_ is ValueCellFull!722) mapValue!2081)) b!47275))

(assert (= (and mapNonEmpty!2072 ((_ is ValueCellFull!722) mapDefault!2081)) b!47276))

(declare-fun m!41517 () Bool)

(assert (=> mapNonEmpty!2081 m!41517))

(check-sat (not b!47268) (not b!47255) (not mapNonEmpty!2081) tp_is_empty!2023 (not bm!3714) (not b!47256) (not b!47265))
(check-sat)
