; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78316 () Bool)

(assert start!78316)

(declare-fun b_free!16737 () Bool)

(declare-fun b_next!16737 () Bool)

(assert (=> start!78316 (= b_free!16737 (not b_next!16737))))

(declare-fun tp!58495 () Bool)

(declare-fun b_and!27329 () Bool)

(assert (=> start!78316 (= tp!58495 b_and!27329)))

(declare-datatypes ((V!30505 0))(
  ( (V!30506 (val!9628 Int)) )
))
(declare-datatypes ((ValueCell!9096 0))(
  ( (ValueCellFull!9096 (v!12142 V!30505)) (EmptyCell!9096) )
))
(declare-datatypes ((array!54302 0))(
  ( (array!54303 (arr!26103 (Array (_ BitVec 32) ValueCell!9096)) (size!26562 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54302)

(declare-fun b!913791 () Bool)

(declare-fun defaultEntry!1160 () Int)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun e!512584 () Bool)

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((tuple2!12550 0))(
  ( (tuple2!12551 (_1!6286 (_ BitVec 64)) (_2!6286 V!30505)) )
))
(declare-datatypes ((List!18337 0))(
  ( (Nil!18334) (Cons!18333 (h!19479 tuple2!12550) (t!25934 List!18337)) )
))
(declare-datatypes ((ListLongMap!11247 0))(
  ( (ListLongMap!11248 (toList!5639 List!18337)) )
))
(declare-fun lt!411118 () ListLongMap!11247)

(declare-fun apply!518 (ListLongMap!11247 (_ BitVec 64)) V!30505)

(declare-fun get!13706 (ValueCell!9096 V!30505) V!30505)

(declare-fun dynLambda!1394 (Int (_ BitVec 64)) V!30505)

(assert (=> b!913791 (= e!512584 (= (apply!518 lt!411118 k0!1033) (get!13706 (select (arr!26103 _values!1152) i!717) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913792 () Bool)

(declare-fun res!616335 () Bool)

(declare-fun e!512587 () Bool)

(assert (=> b!913792 (=> (not res!616335) (not e!512587))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54304 0))(
  ( (array!54305 (arr!26104 (Array (_ BitVec 32) (_ BitVec 64))) (size!26563 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54304)

(assert (=> b!913792 (= res!616335 (and (= (size!26562 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26563 _keys!1386) (size!26562 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913793 () Bool)

(declare-fun e!512586 () Bool)

(declare-fun e!512582 () Bool)

(declare-fun mapRes!30467 () Bool)

(assert (=> b!913793 (= e!512586 (and e!512582 mapRes!30467))))

(declare-fun condMapEmpty!30467 () Bool)

(declare-fun mapDefault!30467 () ValueCell!9096)

(assert (=> b!913793 (= condMapEmpty!30467 (= (arr!26103 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9096)) mapDefault!30467)))))

(declare-fun b!913794 () Bool)

(declare-fun res!616334 () Bool)

(assert (=> b!913794 (=> (not res!616334) (not e!512587))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913794 (= res!616334 (inRange!0 i!717 mask!1756))))

(declare-fun b!913795 () Bool)

(declare-fun res!616328 () Bool)

(assert (=> b!913795 (=> (not res!616328) (not e!512587))))

(declare-fun zeroValue!1094 () V!30505)

(declare-fun minValue!1094 () V!30505)

(declare-fun contains!4687 (ListLongMap!11247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2900 (array!54304 array!54302 (_ BitVec 32) (_ BitVec 32) V!30505 V!30505 (_ BitVec 32) Int) ListLongMap!11247)

(assert (=> b!913795 (= res!616328 (contains!4687 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913796 () Bool)

(declare-fun e!512585 () Bool)

(declare-fun tp_is_empty!19155 () Bool)

(assert (=> b!913796 (= e!512585 tp_is_empty!19155)))

(declare-fun res!616332 () Bool)

(assert (=> start!78316 (=> (not res!616332) (not e!512587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78316 (= res!616332 (validMask!0 mask!1756))))

(assert (=> start!78316 e!512587))

(declare-fun array_inv!20388 (array!54302) Bool)

(assert (=> start!78316 (and (array_inv!20388 _values!1152) e!512586)))

(assert (=> start!78316 tp!58495))

(assert (=> start!78316 true))

(assert (=> start!78316 tp_is_empty!19155))

(declare-fun array_inv!20389 (array!54304) Bool)

(assert (=> start!78316 (array_inv!20389 _keys!1386)))

(declare-fun b!913797 () Bool)

(declare-fun res!616333 () Bool)

(assert (=> b!913797 (=> (not res!616333) (not e!512587))))

(assert (=> b!913797 (= res!616333 (and (= (select (arr!26104 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913798 () Bool)

(assert (=> b!913798 (= e!512582 tp_is_empty!19155)))

(declare-fun b!913799 () Bool)

(declare-fun e!512581 () Bool)

(assert (=> b!913799 (= e!512581 e!512584)))

(declare-fun res!616329 () Bool)

(assert (=> b!913799 (=> res!616329 e!512584)))

(assert (=> b!913799 (= res!616329 (not (contains!4687 lt!411118 k0!1033)))))

(assert (=> b!913799 (= lt!411118 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!30467 () Bool)

(assert (=> mapIsEmpty!30467 mapRes!30467))

(declare-fun b!913800 () Bool)

(declare-fun res!616330 () Bool)

(assert (=> b!913800 (=> (not res!616330) (not e!512587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54304 (_ BitVec 32)) Bool)

(assert (=> b!913800 (= res!616330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30467 () Bool)

(declare-fun tp!58494 () Bool)

(assert (=> mapNonEmpty!30467 (= mapRes!30467 (and tp!58494 e!512585))))

(declare-fun mapKey!30467 () (_ BitVec 32))

(declare-fun mapValue!30467 () ValueCell!9096)

(declare-fun mapRest!30467 () (Array (_ BitVec 32) ValueCell!9096))

(assert (=> mapNonEmpty!30467 (= (arr!26103 _values!1152) (store mapRest!30467 mapKey!30467 mapValue!30467))))

(declare-fun b!913801 () Bool)

(assert (=> b!913801 (= e!512587 (not e!512581))))

(declare-fun res!616336 () Bool)

(assert (=> b!913801 (=> res!616336 e!512581)))

(assert (=> b!913801 (= res!616336 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26563 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!54304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913801 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30934 0))(
  ( (Unit!30935) )
))
(declare-fun lt!411117 () Unit!30934)

(declare-fun lemmaKeyInListMapIsInArray!285 (array!54304 array!54302 (_ BitVec 32) (_ BitVec 32) V!30505 V!30505 (_ BitVec 64) Int) Unit!30934)

(assert (=> b!913801 (= lt!411117 (lemmaKeyInListMapIsInArray!285 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!913802 () Bool)

(declare-fun res!616331 () Bool)

(assert (=> b!913802 (=> (not res!616331) (not e!512587))))

(declare-datatypes ((List!18338 0))(
  ( (Nil!18335) (Cons!18334 (h!19480 (_ BitVec 64)) (t!25935 List!18338)) )
))
(declare-fun arrayNoDuplicates!0 (array!54304 (_ BitVec 32) List!18338) Bool)

(assert (=> b!913802 (= res!616331 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18335))))

(assert (= (and start!78316 res!616332) b!913792))

(assert (= (and b!913792 res!616335) b!913800))

(assert (= (and b!913800 res!616330) b!913802))

(assert (= (and b!913802 res!616331) b!913795))

(assert (= (and b!913795 res!616328) b!913794))

(assert (= (and b!913794 res!616334) b!913797))

(assert (= (and b!913797 res!616333) b!913801))

(assert (= (and b!913801 (not res!616336)) b!913799))

(assert (= (and b!913799 (not res!616329)) b!913791))

(assert (= (and b!913793 condMapEmpty!30467) mapIsEmpty!30467))

(assert (= (and b!913793 (not condMapEmpty!30467)) mapNonEmpty!30467))

(get-info :version)

(assert (= (and mapNonEmpty!30467 ((_ is ValueCellFull!9096) mapValue!30467)) b!913796))

(assert (= (and b!913793 ((_ is ValueCellFull!9096) mapDefault!30467)) b!913798))

(assert (= start!78316 b!913793))

(declare-fun b_lambda!13341 () Bool)

(assert (=> (not b_lambda!13341) (not b!913791)))

(declare-fun t!25933 () Bool)

(declare-fun tb!5447 () Bool)

(assert (=> (and start!78316 (= defaultEntry!1160 defaultEntry!1160) t!25933) tb!5447))

(declare-fun result!10703 () Bool)

(assert (=> tb!5447 (= result!10703 tp_is_empty!19155)))

(assert (=> b!913791 t!25933))

(declare-fun b_and!27331 () Bool)

(assert (= b_and!27329 (and (=> t!25933 result!10703) b_and!27331)))

(declare-fun m!848309 () Bool)

(assert (=> mapNonEmpty!30467 m!848309))

(declare-fun m!848311 () Bool)

(assert (=> b!913797 m!848311))

(declare-fun m!848313 () Bool)

(assert (=> b!913795 m!848313))

(assert (=> b!913795 m!848313))

(declare-fun m!848315 () Bool)

(assert (=> b!913795 m!848315))

(declare-fun m!848317 () Bool)

(assert (=> start!78316 m!848317))

(declare-fun m!848319 () Bool)

(assert (=> start!78316 m!848319))

(declare-fun m!848321 () Bool)

(assert (=> start!78316 m!848321))

(declare-fun m!848323 () Bool)

(assert (=> b!913801 m!848323))

(declare-fun m!848325 () Bool)

(assert (=> b!913801 m!848325))

(declare-fun m!848327 () Bool)

(assert (=> b!913800 m!848327))

(declare-fun m!848329 () Bool)

(assert (=> b!913791 m!848329))

(declare-fun m!848331 () Bool)

(assert (=> b!913791 m!848331))

(declare-fun m!848333 () Bool)

(assert (=> b!913791 m!848333))

(assert (=> b!913791 m!848331))

(assert (=> b!913791 m!848333))

(declare-fun m!848335 () Bool)

(assert (=> b!913791 m!848335))

(declare-fun m!848337 () Bool)

(assert (=> b!913799 m!848337))

(declare-fun m!848339 () Bool)

(assert (=> b!913799 m!848339))

(declare-fun m!848341 () Bool)

(assert (=> b!913802 m!848341))

(declare-fun m!848343 () Bool)

(assert (=> b!913794 m!848343))

(check-sat (not b!913795) (not b!913802) (not b!913794) (not b_lambda!13341) (not b!913800) tp_is_empty!19155 (not start!78316) (not b!913799) (not mapNonEmpty!30467) (not b!913801) b_and!27331 (not b!913791) (not b_next!16737))
(check-sat b_and!27331 (not b_next!16737))
(get-model)

(declare-fun b_lambda!13345 () Bool)

(assert (= b_lambda!13341 (or (and start!78316 b_free!16737) b_lambda!13345)))

(check-sat (not b!913795) (not b!913802) (not b!913794) (not b!913800) tp_is_empty!19155 (not start!78316) (not b!913799) (not mapNonEmpty!30467) (not b_lambda!13345) (not b!913801) b_and!27331 (not b!913791) (not b_next!16737))
(check-sat b_and!27331 (not b_next!16737))
(get-model)

(declare-fun d!112499 () Bool)

(declare-datatypes ((Option!482 0))(
  ( (Some!481 (v!12144 V!30505)) (None!480) )
))
(declare-fun get!13707 (Option!482) V!30505)

(declare-fun getValueByKey!476 (List!18337 (_ BitVec 64)) Option!482)

(assert (=> d!112499 (= (apply!518 lt!411118 k0!1033) (get!13707 (getValueByKey!476 (toList!5639 lt!411118) k0!1033)))))

(declare-fun bs!25711 () Bool)

(assert (= bs!25711 d!112499))

(declare-fun m!848381 () Bool)

(assert (=> bs!25711 m!848381))

(assert (=> bs!25711 m!848381))

(declare-fun m!848383 () Bool)

(assert (=> bs!25711 m!848383))

(assert (=> b!913791 d!112499))

(declare-fun d!112501 () Bool)

(declare-fun c!95919 () Bool)

(assert (=> d!112501 (= c!95919 ((_ is ValueCellFull!9096) (select (arr!26103 _values!1152) i!717)))))

(declare-fun e!512611 () V!30505)

(assert (=> d!112501 (= (get!13706 (select (arr!26103 _values!1152) i!717) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!512611)))

(declare-fun b!913847 () Bool)

(declare-fun get!13708 (ValueCell!9096 V!30505) V!30505)

(assert (=> b!913847 (= e!512611 (get!13708 (select (arr!26103 _values!1152) i!717) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!913848 () Bool)

(declare-fun get!13709 (ValueCell!9096 V!30505) V!30505)

(assert (=> b!913848 (= e!512611 (get!13709 (select (arr!26103 _values!1152) i!717) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112501 c!95919) b!913847))

(assert (= (and d!112501 (not c!95919)) b!913848))

(assert (=> b!913847 m!848331))

(assert (=> b!913847 m!848333))

(declare-fun m!848385 () Bool)

(assert (=> b!913847 m!848385))

(assert (=> b!913848 m!848331))

(assert (=> b!913848 m!848333))

(declare-fun m!848387 () Bool)

(assert (=> b!913848 m!848387))

(assert (=> b!913791 d!112501))

(declare-fun bm!40461 () Bool)

(declare-fun call!40464 () Bool)

(assert (=> bm!40461 (= call!40464 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun d!112503 () Bool)

(declare-fun res!616369 () Bool)

(declare-fun e!512618 () Bool)

(assert (=> d!112503 (=> res!616369 e!512618)))

(assert (=> d!112503 (= res!616369 (bvsge #b00000000000000000000000000000000 (size!26563 _keys!1386)))))

(assert (=> d!112503 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!512618)))

(declare-fun b!913857 () Bool)

(declare-fun e!512619 () Bool)

(assert (=> b!913857 (= e!512618 e!512619)))

(declare-fun c!95922 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!913857 (= c!95922 (validKeyInArray!0 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913858 () Bool)

(declare-fun e!512620 () Bool)

(assert (=> b!913858 (= e!512620 call!40464)))

(declare-fun b!913859 () Bool)

(assert (=> b!913859 (= e!512619 e!512620)))

(declare-fun lt!411133 () (_ BitVec 64))

(assert (=> b!913859 (= lt!411133 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411132 () Unit!30934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54304 (_ BitVec 64) (_ BitVec 32)) Unit!30934)

(assert (=> b!913859 (= lt!411132 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411133 #b00000000000000000000000000000000))))

(assert (=> b!913859 (arrayContainsKey!0 _keys!1386 lt!411133 #b00000000000000000000000000000000)))

(declare-fun lt!411131 () Unit!30934)

(assert (=> b!913859 (= lt!411131 lt!411132)))

(declare-fun res!616368 () Bool)

(declare-datatypes ((SeekEntryResult!8970 0))(
  ( (MissingZero!8970 (index!38251 (_ BitVec 32))) (Found!8970 (index!38252 (_ BitVec 32))) (Intermediate!8970 (undefined!9782 Bool) (index!38253 (_ BitVec 32)) (x!78168 (_ BitVec 32))) (Undefined!8970) (MissingVacant!8970 (index!38254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54304 (_ BitVec 32)) SeekEntryResult!8970)

(assert (=> b!913859 (= res!616368 (= (seekEntryOrOpen!0 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8970 #b00000000000000000000000000000000)))))

(assert (=> b!913859 (=> (not res!616368) (not e!512620))))

(declare-fun b!913860 () Bool)

(assert (=> b!913860 (= e!512619 call!40464)))

(assert (= (and d!112503 (not res!616369)) b!913857))

(assert (= (and b!913857 c!95922) b!913859))

(assert (= (and b!913857 (not c!95922)) b!913860))

(assert (= (and b!913859 res!616368) b!913858))

(assert (= (or b!913858 b!913860) bm!40461))

(declare-fun m!848389 () Bool)

(assert (=> bm!40461 m!848389))

(declare-fun m!848391 () Bool)

(assert (=> b!913857 m!848391))

(assert (=> b!913857 m!848391))

(declare-fun m!848393 () Bool)

(assert (=> b!913857 m!848393))

(assert (=> b!913859 m!848391))

(declare-fun m!848395 () Bool)

(assert (=> b!913859 m!848395))

(declare-fun m!848397 () Bool)

(assert (=> b!913859 m!848397))

(assert (=> b!913859 m!848391))

(declare-fun m!848399 () Bool)

(assert (=> b!913859 m!848399))

(assert (=> b!913800 d!112503))

(declare-fun d!112505 () Bool)

(declare-fun res!616374 () Bool)

(declare-fun e!512625 () Bool)

(assert (=> d!112505 (=> res!616374 e!512625)))

(assert (=> d!112505 (= res!616374 (= (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112505 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!512625)))

(declare-fun b!913865 () Bool)

(declare-fun e!512626 () Bool)

(assert (=> b!913865 (= e!512625 e!512626)))

(declare-fun res!616375 () Bool)

(assert (=> b!913865 (=> (not res!616375) (not e!512626))))

(assert (=> b!913865 (= res!616375 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26563 _keys!1386)))))

(declare-fun b!913866 () Bool)

(assert (=> b!913866 (= e!512626 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112505 (not res!616374)) b!913865))

(assert (= (and b!913865 res!616375) b!913866))

(assert (=> d!112505 m!848391))

(declare-fun m!848401 () Bool)

(assert (=> b!913866 m!848401))

(assert (=> b!913801 d!112505))

(declare-fun d!112507 () Bool)

(declare-fun e!512629 () Bool)

(assert (=> d!112507 e!512629))

(declare-fun c!95925 () Bool)

(assert (=> d!112507 (= c!95925 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!411136 () Unit!30934)

(declare-fun choose!1535 (array!54304 array!54302 (_ BitVec 32) (_ BitVec 32) V!30505 V!30505 (_ BitVec 64) Int) Unit!30934)

(assert (=> d!112507 (= lt!411136 (choose!1535 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112507 (validMask!0 mask!1756)))

(assert (=> d!112507 (= (lemmaKeyInListMapIsInArray!285 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!411136)))

(declare-fun b!913871 () Bool)

(assert (=> b!913871 (= e!512629 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!913872 () Bool)

(assert (=> b!913872 (= e!512629 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112507 c!95925) b!913871))

(assert (= (and d!112507 (not c!95925)) b!913872))

(declare-fun m!848403 () Bool)

(assert (=> d!112507 m!848403))

(assert (=> d!112507 m!848317))

(assert (=> b!913871 m!848323))

(assert (=> b!913801 d!112507))

(declare-fun d!112509 () Bool)

(declare-fun e!512635 () Bool)

(assert (=> d!112509 e!512635))

(declare-fun res!616378 () Bool)

(assert (=> d!112509 (=> res!616378 e!512635)))

(declare-fun lt!411145 () Bool)

(assert (=> d!112509 (= res!616378 (not lt!411145))))

(declare-fun lt!411146 () Bool)

(assert (=> d!112509 (= lt!411145 lt!411146)))

(declare-fun lt!411148 () Unit!30934)

(declare-fun e!512634 () Unit!30934)

(assert (=> d!112509 (= lt!411148 e!512634)))

(declare-fun c!95928 () Bool)

(assert (=> d!112509 (= c!95928 lt!411146)))

(declare-fun containsKey!443 (List!18337 (_ BitVec 64)) Bool)

(assert (=> d!112509 (= lt!411146 (containsKey!443 (toList!5639 lt!411118) k0!1033))))

(assert (=> d!112509 (= (contains!4687 lt!411118 k0!1033) lt!411145)))

(declare-fun b!913879 () Bool)

(declare-fun lt!411147 () Unit!30934)

(assert (=> b!913879 (= e!512634 lt!411147)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!339 (List!18337 (_ BitVec 64)) Unit!30934)

(assert (=> b!913879 (= lt!411147 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5639 lt!411118) k0!1033))))

(declare-fun isDefined!348 (Option!482) Bool)

(assert (=> b!913879 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411118) k0!1033))))

(declare-fun b!913880 () Bool)

(declare-fun Unit!30936 () Unit!30934)

(assert (=> b!913880 (= e!512634 Unit!30936)))

(declare-fun b!913881 () Bool)

(assert (=> b!913881 (= e!512635 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411118) k0!1033)))))

(assert (= (and d!112509 c!95928) b!913879))

(assert (= (and d!112509 (not c!95928)) b!913880))

(assert (= (and d!112509 (not res!616378)) b!913881))

(declare-fun m!848405 () Bool)

(assert (=> d!112509 m!848405))

(declare-fun m!848407 () Bool)

(assert (=> b!913879 m!848407))

(assert (=> b!913879 m!848381))

(assert (=> b!913879 m!848381))

(declare-fun m!848409 () Bool)

(assert (=> b!913879 m!848409))

(assert (=> b!913881 m!848381))

(assert (=> b!913881 m!848381))

(assert (=> b!913881 m!848409))

(assert (=> b!913799 d!112509))

(declare-fun b!913924 () Bool)

(declare-fun e!512671 () Unit!30934)

(declare-fun Unit!30937 () Unit!30934)

(assert (=> b!913924 (= e!512671 Unit!30937)))

(declare-fun b!913925 () Bool)

(declare-fun e!512673 () Bool)

(declare-fun e!512672 () Bool)

(assert (=> b!913925 (= e!512673 e!512672)))

(declare-fun res!616398 () Bool)

(declare-fun call!40483 () Bool)

(assert (=> b!913925 (= res!616398 call!40483)))

(assert (=> b!913925 (=> (not res!616398) (not e!512672))))

(declare-fun b!913926 () Bool)

(declare-fun e!512665 () Bool)

(assert (=> b!913926 (= e!512665 (validKeyInArray!0 (select (arr!26104 _keys!1386) i!717)))))

(declare-fun bm!40476 () Bool)

(declare-fun lt!411198 () ListLongMap!11247)

(assert (=> bm!40476 (= call!40483 (contains!4687 lt!411198 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40477 () Bool)

(declare-fun call!40484 () ListLongMap!11247)

(declare-fun call!40480 () ListLongMap!11247)

(assert (=> bm!40477 (= call!40484 call!40480)))

(declare-fun c!95943 () Bool)

(declare-fun call!40485 () ListLongMap!11247)

(declare-fun bm!40478 () Bool)

(declare-fun c!95944 () Bool)

(declare-fun call!40482 () ListLongMap!11247)

(declare-fun +!2609 (ListLongMap!11247 tuple2!12550) ListLongMap!11247)

(assert (=> bm!40478 (= call!40485 (+!2609 (ite c!95944 call!40482 (ite c!95943 call!40480 call!40484)) (ite (or c!95944 c!95943) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!913928 () Bool)

(declare-fun res!616399 () Bool)

(declare-fun e!512662 () Bool)

(assert (=> b!913928 (=> (not res!616399) (not e!512662))))

(assert (=> b!913928 (= res!616399 e!512673)))

(declare-fun c!95945 () Bool)

(assert (=> b!913928 (= c!95945 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40479 () Bool)

(declare-fun call!40479 () Bool)

(assert (=> bm!40479 (= call!40479 (contains!4687 lt!411198 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913929 () Bool)

(declare-fun e!512667 () ListLongMap!11247)

(declare-fun e!512674 () ListLongMap!11247)

(assert (=> b!913929 (= e!512667 e!512674)))

(assert (=> b!913929 (= c!95943 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913930 () Bool)

(declare-fun e!512666 () Bool)

(declare-fun e!512668 () Bool)

(assert (=> b!913930 (= e!512666 e!512668)))

(declare-fun res!616400 () Bool)

(assert (=> b!913930 (=> (not res!616400) (not e!512668))))

(assert (=> b!913930 (= res!616400 (contains!4687 lt!411198 (select (arr!26104 _keys!1386) i!717)))))

(assert (=> b!913930 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26563 _keys!1386)))))

(declare-fun b!913931 () Bool)

(declare-fun e!512663 () Bool)

(assert (=> b!913931 (= e!512663 (validKeyInArray!0 (select (arr!26104 _keys!1386) i!717)))))

(declare-fun b!913932 () Bool)

(declare-fun e!512670 () Bool)

(assert (=> b!913932 (= e!512662 e!512670)))

(declare-fun c!95942 () Bool)

(assert (=> b!913932 (= c!95942 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913927 () Bool)

(assert (=> b!913927 (= e!512672 (= (apply!518 lt!411198 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun d!112511 () Bool)

(assert (=> d!112511 e!512662))

(declare-fun res!616397 () Bool)

(assert (=> d!112511 (=> (not res!616397) (not e!512662))))

(assert (=> d!112511 (= res!616397 (or (bvsge i!717 (size!26563 _keys!1386)) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26563 _keys!1386)))))))

(declare-fun lt!411201 () ListLongMap!11247)

(assert (=> d!112511 (= lt!411198 lt!411201)))

(declare-fun lt!411207 () Unit!30934)

(assert (=> d!112511 (= lt!411207 e!512671)))

(declare-fun c!95946 () Bool)

(assert (=> d!112511 (= c!95946 e!512665)))

(declare-fun res!616401 () Bool)

(assert (=> d!112511 (=> (not res!616401) (not e!512665))))

(assert (=> d!112511 (= res!616401 (bvslt i!717 (size!26563 _keys!1386)))))

(assert (=> d!112511 (= lt!411201 e!512667)))

(assert (=> d!112511 (= c!95944 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112511 (validMask!0 mask!1756)))

(assert (=> d!112511 (= (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!411198)))

(declare-fun b!913933 () Bool)

(assert (=> b!913933 (= e!512670 (not call!40479))))

(declare-fun b!913934 () Bool)

(declare-fun e!512669 () ListLongMap!11247)

(declare-fun call!40481 () ListLongMap!11247)

(assert (=> b!913934 (= e!512669 call!40481)))

(declare-fun b!913935 () Bool)

(assert (=> b!913935 (= e!512673 (not call!40483))))

(declare-fun bm!40480 () Bool)

(assert (=> bm!40480 (= call!40480 call!40482)))

(declare-fun b!913936 () Bool)

(declare-fun res!616405 () Bool)

(assert (=> b!913936 (=> (not res!616405) (not e!512662))))

(assert (=> b!913936 (= res!616405 e!512666)))

(declare-fun res!616403 () Bool)

(assert (=> b!913936 (=> res!616403 e!512666)))

(assert (=> b!913936 (= res!616403 (not e!512663))))

(declare-fun res!616402 () Bool)

(assert (=> b!913936 (=> (not res!616402) (not e!512663))))

(assert (=> b!913936 (= res!616402 (bvslt i!717 (size!26563 _keys!1386)))))

(declare-fun b!913937 () Bool)

(declare-fun e!512664 () Bool)

(assert (=> b!913937 (= e!512664 (= (apply!518 lt!411198 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!913938 () Bool)

(declare-fun lt!411209 () Unit!30934)

(assert (=> b!913938 (= e!512671 lt!411209)))

(declare-fun lt!411204 () ListLongMap!11247)

(declare-fun getCurrentListMapNoExtraKeys!3296 (array!54304 array!54302 (_ BitVec 32) (_ BitVec 32) V!30505 V!30505 (_ BitVec 32) Int) ListLongMap!11247)

(assert (=> b!913938 (= lt!411204 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411195 () (_ BitVec 64))

(assert (=> b!913938 (= lt!411195 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411210 () (_ BitVec 64))

(assert (=> b!913938 (= lt!411210 (select (arr!26104 _keys!1386) i!717))))

(declare-fun lt!411200 () Unit!30934)

(declare-fun addStillContains!350 (ListLongMap!11247 (_ BitVec 64) V!30505 (_ BitVec 64)) Unit!30934)

(assert (=> b!913938 (= lt!411200 (addStillContains!350 lt!411204 lt!411195 zeroValue!1094 lt!411210))))

(assert (=> b!913938 (contains!4687 (+!2609 lt!411204 (tuple2!12551 lt!411195 zeroValue!1094)) lt!411210)))

(declare-fun lt!411197 () Unit!30934)

(assert (=> b!913938 (= lt!411197 lt!411200)))

(declare-fun lt!411213 () ListLongMap!11247)

(assert (=> b!913938 (= lt!411213 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411211 () (_ BitVec 64))

(assert (=> b!913938 (= lt!411211 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411203 () (_ BitVec 64))

(assert (=> b!913938 (= lt!411203 (select (arr!26104 _keys!1386) i!717))))

(declare-fun lt!411208 () Unit!30934)

(declare-fun addApplyDifferent!350 (ListLongMap!11247 (_ BitVec 64) V!30505 (_ BitVec 64)) Unit!30934)

(assert (=> b!913938 (= lt!411208 (addApplyDifferent!350 lt!411213 lt!411211 minValue!1094 lt!411203))))

(assert (=> b!913938 (= (apply!518 (+!2609 lt!411213 (tuple2!12551 lt!411211 minValue!1094)) lt!411203) (apply!518 lt!411213 lt!411203))))

(declare-fun lt!411214 () Unit!30934)

(assert (=> b!913938 (= lt!411214 lt!411208)))

(declare-fun lt!411196 () ListLongMap!11247)

(assert (=> b!913938 (= lt!411196 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411206 () (_ BitVec 64))

(assert (=> b!913938 (= lt!411206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411194 () (_ BitVec 64))

(assert (=> b!913938 (= lt!411194 (select (arr!26104 _keys!1386) i!717))))

(declare-fun lt!411193 () Unit!30934)

(assert (=> b!913938 (= lt!411193 (addApplyDifferent!350 lt!411196 lt!411206 zeroValue!1094 lt!411194))))

(assert (=> b!913938 (= (apply!518 (+!2609 lt!411196 (tuple2!12551 lt!411206 zeroValue!1094)) lt!411194) (apply!518 lt!411196 lt!411194))))

(declare-fun lt!411199 () Unit!30934)

(assert (=> b!913938 (= lt!411199 lt!411193)))

(declare-fun lt!411212 () ListLongMap!11247)

(assert (=> b!913938 (= lt!411212 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411205 () (_ BitVec 64))

(assert (=> b!913938 (= lt!411205 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411202 () (_ BitVec 64))

(assert (=> b!913938 (= lt!411202 (select (arr!26104 _keys!1386) i!717))))

(assert (=> b!913938 (= lt!411209 (addApplyDifferent!350 lt!411212 lt!411205 minValue!1094 lt!411202))))

(assert (=> b!913938 (= (apply!518 (+!2609 lt!411212 (tuple2!12551 lt!411205 minValue!1094)) lt!411202) (apply!518 lt!411212 lt!411202))))

(declare-fun bm!40481 () Bool)

(assert (=> bm!40481 (= call!40481 call!40485)))

(declare-fun b!913939 () Bool)

(assert (=> b!913939 (= e!512668 (= (apply!518 lt!411198 (select (arr!26104 _keys!1386) i!717)) (get!13706 (select (arr!26103 _values!1152) i!717) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913939 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26562 _values!1152)))))

(assert (=> b!913939 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26563 _keys!1386)))))

(declare-fun b!913940 () Bool)

(assert (=> b!913940 (= e!512670 e!512664)))

(declare-fun res!616404 () Bool)

(assert (=> b!913940 (= res!616404 call!40479)))

(assert (=> b!913940 (=> (not res!616404) (not e!512664))))

(declare-fun b!913941 () Bool)

(assert (=> b!913941 (= e!512669 call!40484)))

(declare-fun b!913942 () Bool)

(assert (=> b!913942 (= e!512674 call!40481)))

(declare-fun b!913943 () Bool)

(assert (=> b!913943 (= e!512667 (+!2609 call!40485 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!913944 () Bool)

(declare-fun c!95941 () Bool)

(assert (=> b!913944 (= c!95941 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!913944 (= e!512674 e!512669)))

(declare-fun bm!40482 () Bool)

(assert (=> bm!40482 (= call!40482 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(assert (= (and d!112511 c!95944) b!913943))

(assert (= (and d!112511 (not c!95944)) b!913929))

(assert (= (and b!913929 c!95943) b!913942))

(assert (= (and b!913929 (not c!95943)) b!913944))

(assert (= (and b!913944 c!95941) b!913934))

(assert (= (and b!913944 (not c!95941)) b!913941))

(assert (= (or b!913934 b!913941) bm!40477))

(assert (= (or b!913942 bm!40477) bm!40480))

(assert (= (or b!913942 b!913934) bm!40481))

(assert (= (or b!913943 bm!40480) bm!40482))

(assert (= (or b!913943 bm!40481) bm!40478))

(assert (= (and d!112511 res!616401) b!913926))

(assert (= (and d!112511 c!95946) b!913938))

(assert (= (and d!112511 (not c!95946)) b!913924))

(assert (= (and d!112511 res!616397) b!913936))

(assert (= (and b!913936 res!616402) b!913931))

(assert (= (and b!913936 (not res!616403)) b!913930))

(assert (= (and b!913930 res!616400) b!913939))

(assert (= (and b!913936 res!616405) b!913928))

(assert (= (and b!913928 c!95945) b!913925))

(assert (= (and b!913928 (not c!95945)) b!913935))

(assert (= (and b!913925 res!616398) b!913927))

(assert (= (or b!913925 b!913935) bm!40476))

(assert (= (and b!913928 res!616399) b!913932))

(assert (= (and b!913932 c!95942) b!913940))

(assert (= (and b!913932 (not c!95942)) b!913933))

(assert (= (and b!913940 res!616404) b!913937))

(assert (= (or b!913940 b!913933) bm!40479))

(declare-fun b_lambda!13347 () Bool)

(assert (=> (not b_lambda!13347) (not b!913939)))

(assert (=> b!913939 t!25933))

(declare-fun b_and!27337 () Bool)

(assert (= b_and!27331 (and (=> t!25933 result!10703) b_and!27337)))

(declare-fun m!848411 () Bool)

(assert (=> bm!40478 m!848411))

(assert (=> b!913931 m!848311))

(assert (=> b!913931 m!848311))

(declare-fun m!848413 () Bool)

(assert (=> b!913931 m!848413))

(declare-fun m!848415 () Bool)

(assert (=> b!913943 m!848415))

(assert (=> b!913930 m!848311))

(assert (=> b!913930 m!848311))

(declare-fun m!848417 () Bool)

(assert (=> b!913930 m!848417))

(declare-fun m!848419 () Bool)

(assert (=> b!913938 m!848419))

(declare-fun m!848421 () Bool)

(assert (=> b!913938 m!848421))

(declare-fun m!848423 () Bool)

(assert (=> b!913938 m!848423))

(declare-fun m!848425 () Bool)

(assert (=> b!913938 m!848425))

(declare-fun m!848427 () Bool)

(assert (=> b!913938 m!848427))

(declare-fun m!848429 () Bool)

(assert (=> b!913938 m!848429))

(declare-fun m!848431 () Bool)

(assert (=> b!913938 m!848431))

(declare-fun m!848433 () Bool)

(assert (=> b!913938 m!848433))

(assert (=> b!913938 m!848425))

(declare-fun m!848435 () Bool)

(assert (=> b!913938 m!848435))

(declare-fun m!848437 () Bool)

(assert (=> b!913938 m!848437))

(declare-fun m!848439 () Bool)

(assert (=> b!913938 m!848439))

(declare-fun m!848441 () Bool)

(assert (=> b!913938 m!848441))

(declare-fun m!848443 () Bool)

(assert (=> b!913938 m!848443))

(assert (=> b!913938 m!848431))

(declare-fun m!848445 () Bool)

(assert (=> b!913938 m!848445))

(assert (=> b!913938 m!848443))

(declare-fun m!848447 () Bool)

(assert (=> b!913938 m!848447))

(declare-fun m!848449 () Bool)

(assert (=> b!913938 m!848449))

(assert (=> b!913938 m!848311))

(assert (=> b!913938 m!848427))

(assert (=> b!913939 m!848331))

(assert (=> b!913939 m!848333))

(assert (=> b!913939 m!848335))

(assert (=> b!913939 m!848333))

(assert (=> b!913939 m!848331))

(assert (=> b!913939 m!848311))

(declare-fun m!848451 () Bool)

(assert (=> b!913939 m!848451))

(assert (=> b!913939 m!848311))

(assert (=> d!112511 m!848317))

(declare-fun m!848453 () Bool)

(assert (=> b!913927 m!848453))

(declare-fun m!848455 () Bool)

(assert (=> bm!40476 m!848455))

(assert (=> bm!40482 m!848423))

(declare-fun m!848457 () Bool)

(assert (=> b!913937 m!848457))

(assert (=> b!913926 m!848311))

(assert (=> b!913926 m!848311))

(assert (=> b!913926 m!848413))

(declare-fun m!848459 () Bool)

(assert (=> bm!40479 m!848459))

(assert (=> b!913799 d!112511))

(declare-fun b!913955 () Bool)

(declare-fun e!512684 () Bool)

(declare-fun contains!4688 (List!18338 (_ BitVec 64)) Bool)

(assert (=> b!913955 (= e!512684 (contains!4688 Nil!18335 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913956 () Bool)

(declare-fun e!512686 () Bool)

(declare-fun e!512683 () Bool)

(assert (=> b!913956 (= e!512686 e!512683)))

(declare-fun c!95949 () Bool)

(assert (=> b!913956 (= c!95949 (validKeyInArray!0 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913957 () Bool)

(declare-fun e!512685 () Bool)

(assert (=> b!913957 (= e!512685 e!512686)))

(declare-fun res!616412 () Bool)

(assert (=> b!913957 (=> (not res!616412) (not e!512686))))

(assert (=> b!913957 (= res!616412 (not e!512684))))

(declare-fun res!616414 () Bool)

(assert (=> b!913957 (=> (not res!616414) (not e!512684))))

(assert (=> b!913957 (= res!616414 (validKeyInArray!0 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40485 () Bool)

(declare-fun call!40488 () Bool)

(assert (=> bm!40485 (= call!40488 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95949 (Cons!18334 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) Nil!18335) Nil!18335)))))

(declare-fun b!913959 () Bool)

(assert (=> b!913959 (= e!512683 call!40488)))

(declare-fun d!112513 () Bool)

(declare-fun res!616413 () Bool)

(assert (=> d!112513 (=> res!616413 e!512685)))

(assert (=> d!112513 (= res!616413 (bvsge #b00000000000000000000000000000000 (size!26563 _keys!1386)))))

(assert (=> d!112513 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18335) e!512685)))

(declare-fun b!913958 () Bool)

(assert (=> b!913958 (= e!512683 call!40488)))

(assert (= (and d!112513 (not res!616413)) b!913957))

(assert (= (and b!913957 res!616414) b!913955))

(assert (= (and b!913957 res!616412) b!913956))

(assert (= (and b!913956 c!95949) b!913959))

(assert (= (and b!913956 (not c!95949)) b!913958))

(assert (= (or b!913959 b!913958) bm!40485))

(assert (=> b!913955 m!848391))

(assert (=> b!913955 m!848391))

(declare-fun m!848461 () Bool)

(assert (=> b!913955 m!848461))

(assert (=> b!913956 m!848391))

(assert (=> b!913956 m!848391))

(assert (=> b!913956 m!848393))

(assert (=> b!913957 m!848391))

(assert (=> b!913957 m!848391))

(assert (=> b!913957 m!848393))

(assert (=> bm!40485 m!848391))

(declare-fun m!848463 () Bool)

(assert (=> bm!40485 m!848463))

(assert (=> b!913802 d!112513))

(declare-fun d!112515 () Bool)

(declare-fun e!512688 () Bool)

(assert (=> d!112515 e!512688))

(declare-fun res!616415 () Bool)

(assert (=> d!112515 (=> res!616415 e!512688)))

(declare-fun lt!411215 () Bool)

(assert (=> d!112515 (= res!616415 (not lt!411215))))

(declare-fun lt!411216 () Bool)

(assert (=> d!112515 (= lt!411215 lt!411216)))

(declare-fun lt!411218 () Unit!30934)

(declare-fun e!512687 () Unit!30934)

(assert (=> d!112515 (= lt!411218 e!512687)))

(declare-fun c!95950 () Bool)

(assert (=> d!112515 (= c!95950 lt!411216)))

(assert (=> d!112515 (= lt!411216 (containsKey!443 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112515 (= (contains!4687 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!411215)))

(declare-fun b!913960 () Bool)

(declare-fun lt!411217 () Unit!30934)

(assert (=> b!913960 (= e!512687 lt!411217)))

(assert (=> b!913960 (= lt!411217 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> b!913960 (isDefined!348 (getValueByKey!476 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!913961 () Bool)

(declare-fun Unit!30938 () Unit!30934)

(assert (=> b!913961 (= e!512687 Unit!30938)))

(declare-fun b!913962 () Bool)

(assert (=> b!913962 (= e!512688 (isDefined!348 (getValueByKey!476 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112515 c!95950) b!913960))

(assert (= (and d!112515 (not c!95950)) b!913961))

(assert (= (and d!112515 (not res!616415)) b!913962))

(declare-fun m!848465 () Bool)

(assert (=> d!112515 m!848465))

(declare-fun m!848467 () Bool)

(assert (=> b!913960 m!848467))

(declare-fun m!848469 () Bool)

(assert (=> b!913960 m!848469))

(assert (=> b!913960 m!848469))

(declare-fun m!848471 () Bool)

(assert (=> b!913960 m!848471))

(assert (=> b!913962 m!848469))

(assert (=> b!913962 m!848469))

(assert (=> b!913962 m!848471))

(assert (=> b!913795 d!112515))

(declare-fun b!913963 () Bool)

(declare-fun e!512698 () Unit!30934)

(declare-fun Unit!30939 () Unit!30934)

(assert (=> b!913963 (= e!512698 Unit!30939)))

(declare-fun b!913964 () Bool)

(declare-fun e!512700 () Bool)

(declare-fun e!512699 () Bool)

(assert (=> b!913964 (= e!512700 e!512699)))

(declare-fun res!616417 () Bool)

(declare-fun call!40493 () Bool)

(assert (=> b!913964 (= res!616417 call!40493)))

(assert (=> b!913964 (=> (not res!616417) (not e!512699))))

(declare-fun b!913965 () Bool)

(declare-fun e!512692 () Bool)

(assert (=> b!913965 (= e!512692 (validKeyInArray!0 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40486 () Bool)

(declare-fun lt!411224 () ListLongMap!11247)

(assert (=> bm!40486 (= call!40493 (contains!4687 lt!411224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40487 () Bool)

(declare-fun call!40494 () ListLongMap!11247)

(declare-fun call!40490 () ListLongMap!11247)

(assert (=> bm!40487 (= call!40494 call!40490)))

(declare-fun bm!40488 () Bool)

(declare-fun call!40492 () ListLongMap!11247)

(declare-fun c!95954 () Bool)

(declare-fun call!40495 () ListLongMap!11247)

(declare-fun c!95953 () Bool)

(assert (=> bm!40488 (= call!40495 (+!2609 (ite c!95954 call!40492 (ite c!95953 call!40490 call!40494)) (ite (or c!95954 c!95953) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!913967 () Bool)

(declare-fun res!616418 () Bool)

(declare-fun e!512689 () Bool)

(assert (=> b!913967 (=> (not res!616418) (not e!512689))))

(assert (=> b!913967 (= res!616418 e!512700)))

(declare-fun c!95955 () Bool)

(assert (=> b!913967 (= c!95955 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40489 () Bool)

(declare-fun call!40489 () Bool)

(assert (=> bm!40489 (= call!40489 (contains!4687 lt!411224 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913968 () Bool)

(declare-fun e!512694 () ListLongMap!11247)

(declare-fun e!512701 () ListLongMap!11247)

(assert (=> b!913968 (= e!512694 e!512701)))

(assert (=> b!913968 (= c!95953 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913969 () Bool)

(declare-fun e!512693 () Bool)

(declare-fun e!512695 () Bool)

(assert (=> b!913969 (= e!512693 e!512695)))

(declare-fun res!616419 () Bool)

(assert (=> b!913969 (=> (not res!616419) (not e!512695))))

(assert (=> b!913969 (= res!616419 (contains!4687 lt!411224 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26563 _keys!1386)))))

(declare-fun b!913970 () Bool)

(declare-fun e!512690 () Bool)

(assert (=> b!913970 (= e!512690 (validKeyInArray!0 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913971 () Bool)

(declare-fun e!512697 () Bool)

(assert (=> b!913971 (= e!512689 e!512697)))

(declare-fun c!95952 () Bool)

(assert (=> b!913971 (= c!95952 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913966 () Bool)

(assert (=> b!913966 (= e!512699 (= (apply!518 lt!411224 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun d!112517 () Bool)

(assert (=> d!112517 e!512689))

(declare-fun res!616416 () Bool)

(assert (=> d!112517 (=> (not res!616416) (not e!512689))))

(assert (=> d!112517 (= res!616416 (or (bvsge #b00000000000000000000000000000000 (size!26563 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26563 _keys!1386)))))))

(declare-fun lt!411227 () ListLongMap!11247)

(assert (=> d!112517 (= lt!411224 lt!411227)))

(declare-fun lt!411233 () Unit!30934)

(assert (=> d!112517 (= lt!411233 e!512698)))

(declare-fun c!95956 () Bool)

(assert (=> d!112517 (= c!95956 e!512692)))

(declare-fun res!616420 () Bool)

(assert (=> d!112517 (=> (not res!616420) (not e!512692))))

(assert (=> d!112517 (= res!616420 (bvslt #b00000000000000000000000000000000 (size!26563 _keys!1386)))))

(assert (=> d!112517 (= lt!411227 e!512694)))

(assert (=> d!112517 (= c!95954 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112517 (validMask!0 mask!1756)))

(assert (=> d!112517 (= (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!411224)))

(declare-fun b!913972 () Bool)

(assert (=> b!913972 (= e!512697 (not call!40489))))

(declare-fun b!913973 () Bool)

(declare-fun e!512696 () ListLongMap!11247)

(declare-fun call!40491 () ListLongMap!11247)

(assert (=> b!913973 (= e!512696 call!40491)))

(declare-fun b!913974 () Bool)

(assert (=> b!913974 (= e!512700 (not call!40493))))

(declare-fun bm!40490 () Bool)

(assert (=> bm!40490 (= call!40490 call!40492)))

(declare-fun b!913975 () Bool)

(declare-fun res!616424 () Bool)

(assert (=> b!913975 (=> (not res!616424) (not e!512689))))

(assert (=> b!913975 (= res!616424 e!512693)))

(declare-fun res!616422 () Bool)

(assert (=> b!913975 (=> res!616422 e!512693)))

(assert (=> b!913975 (= res!616422 (not e!512690))))

(declare-fun res!616421 () Bool)

(assert (=> b!913975 (=> (not res!616421) (not e!512690))))

(assert (=> b!913975 (= res!616421 (bvslt #b00000000000000000000000000000000 (size!26563 _keys!1386)))))

(declare-fun b!913976 () Bool)

(declare-fun e!512691 () Bool)

(assert (=> b!913976 (= e!512691 (= (apply!518 lt!411224 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!913977 () Bool)

(declare-fun lt!411235 () Unit!30934)

(assert (=> b!913977 (= e!512698 lt!411235)))

(declare-fun lt!411230 () ListLongMap!11247)

(assert (=> b!913977 (= lt!411230 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411221 () (_ BitVec 64))

(assert (=> b!913977 (= lt!411221 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411236 () (_ BitVec 64))

(assert (=> b!913977 (= lt!411236 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411226 () Unit!30934)

(assert (=> b!913977 (= lt!411226 (addStillContains!350 lt!411230 lt!411221 zeroValue!1094 lt!411236))))

(assert (=> b!913977 (contains!4687 (+!2609 lt!411230 (tuple2!12551 lt!411221 zeroValue!1094)) lt!411236)))

(declare-fun lt!411223 () Unit!30934)

(assert (=> b!913977 (= lt!411223 lt!411226)))

(declare-fun lt!411239 () ListLongMap!11247)

(assert (=> b!913977 (= lt!411239 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411237 () (_ BitVec 64))

(assert (=> b!913977 (= lt!411237 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411229 () (_ BitVec 64))

(assert (=> b!913977 (= lt!411229 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411234 () Unit!30934)

(assert (=> b!913977 (= lt!411234 (addApplyDifferent!350 lt!411239 lt!411237 minValue!1094 lt!411229))))

(assert (=> b!913977 (= (apply!518 (+!2609 lt!411239 (tuple2!12551 lt!411237 minValue!1094)) lt!411229) (apply!518 lt!411239 lt!411229))))

(declare-fun lt!411240 () Unit!30934)

(assert (=> b!913977 (= lt!411240 lt!411234)))

(declare-fun lt!411222 () ListLongMap!11247)

(assert (=> b!913977 (= lt!411222 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411232 () (_ BitVec 64))

(assert (=> b!913977 (= lt!411232 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411220 () (_ BitVec 64))

(assert (=> b!913977 (= lt!411220 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411219 () Unit!30934)

(assert (=> b!913977 (= lt!411219 (addApplyDifferent!350 lt!411222 lt!411232 zeroValue!1094 lt!411220))))

(assert (=> b!913977 (= (apply!518 (+!2609 lt!411222 (tuple2!12551 lt!411232 zeroValue!1094)) lt!411220) (apply!518 lt!411222 lt!411220))))

(declare-fun lt!411225 () Unit!30934)

(assert (=> b!913977 (= lt!411225 lt!411219)))

(declare-fun lt!411238 () ListLongMap!11247)

(assert (=> b!913977 (= lt!411238 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411231 () (_ BitVec 64))

(assert (=> b!913977 (= lt!411231 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411228 () (_ BitVec 64))

(assert (=> b!913977 (= lt!411228 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!913977 (= lt!411235 (addApplyDifferent!350 lt!411238 lt!411231 minValue!1094 lt!411228))))

(assert (=> b!913977 (= (apply!518 (+!2609 lt!411238 (tuple2!12551 lt!411231 minValue!1094)) lt!411228) (apply!518 lt!411238 lt!411228))))

(declare-fun bm!40491 () Bool)

(assert (=> bm!40491 (= call!40491 call!40495)))

(declare-fun b!913978 () Bool)

(assert (=> b!913978 (= e!512695 (= (apply!518 lt!411224 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)) (get!13706 (select (arr!26103 _values!1152) #b00000000000000000000000000000000) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913978 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26562 _values!1152)))))

(assert (=> b!913978 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26563 _keys!1386)))))

(declare-fun b!913979 () Bool)

(assert (=> b!913979 (= e!512697 e!512691)))

(declare-fun res!616423 () Bool)

(assert (=> b!913979 (= res!616423 call!40489)))

(assert (=> b!913979 (=> (not res!616423) (not e!512691))))

(declare-fun b!913980 () Bool)

(assert (=> b!913980 (= e!512696 call!40494)))

(declare-fun b!913981 () Bool)

(assert (=> b!913981 (= e!512701 call!40491)))

(declare-fun b!913982 () Bool)

(assert (=> b!913982 (= e!512694 (+!2609 call!40495 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!913983 () Bool)

(declare-fun c!95951 () Bool)

(assert (=> b!913983 (= c!95951 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!913983 (= e!512701 e!512696)))

(declare-fun bm!40492 () Bool)

(assert (=> bm!40492 (= call!40492 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(assert (= (and d!112517 c!95954) b!913982))

(assert (= (and d!112517 (not c!95954)) b!913968))

(assert (= (and b!913968 c!95953) b!913981))

(assert (= (and b!913968 (not c!95953)) b!913983))

(assert (= (and b!913983 c!95951) b!913973))

(assert (= (and b!913983 (not c!95951)) b!913980))

(assert (= (or b!913973 b!913980) bm!40487))

(assert (= (or b!913981 bm!40487) bm!40490))

(assert (= (or b!913981 b!913973) bm!40491))

(assert (= (or b!913982 bm!40490) bm!40492))

(assert (= (or b!913982 bm!40491) bm!40488))

(assert (= (and d!112517 res!616420) b!913965))

(assert (= (and d!112517 c!95956) b!913977))

(assert (= (and d!112517 (not c!95956)) b!913963))

(assert (= (and d!112517 res!616416) b!913975))

(assert (= (and b!913975 res!616421) b!913970))

(assert (= (and b!913975 (not res!616422)) b!913969))

(assert (= (and b!913969 res!616419) b!913978))

(assert (= (and b!913975 res!616424) b!913967))

(assert (= (and b!913967 c!95955) b!913964))

(assert (= (and b!913967 (not c!95955)) b!913974))

(assert (= (and b!913964 res!616417) b!913966))

(assert (= (or b!913964 b!913974) bm!40486))

(assert (= (and b!913967 res!616418) b!913971))

(assert (= (and b!913971 c!95952) b!913979))

(assert (= (and b!913971 (not c!95952)) b!913972))

(assert (= (and b!913979 res!616423) b!913976))

(assert (= (or b!913979 b!913972) bm!40489))

(declare-fun b_lambda!13349 () Bool)

(assert (=> (not b_lambda!13349) (not b!913978)))

(assert (=> b!913978 t!25933))

(declare-fun b_and!27339 () Bool)

(assert (= b_and!27337 (and (=> t!25933 result!10703) b_and!27339)))

(declare-fun m!848473 () Bool)

(assert (=> bm!40488 m!848473))

(assert (=> b!913970 m!848391))

(assert (=> b!913970 m!848391))

(assert (=> b!913970 m!848393))

(declare-fun m!848475 () Bool)

(assert (=> b!913982 m!848475))

(assert (=> b!913969 m!848391))

(assert (=> b!913969 m!848391))

(declare-fun m!848477 () Bool)

(assert (=> b!913969 m!848477))

(declare-fun m!848479 () Bool)

(assert (=> b!913977 m!848479))

(declare-fun m!848481 () Bool)

(assert (=> b!913977 m!848481))

(declare-fun m!848483 () Bool)

(assert (=> b!913977 m!848483))

(declare-fun m!848485 () Bool)

(assert (=> b!913977 m!848485))

(declare-fun m!848487 () Bool)

(assert (=> b!913977 m!848487))

(declare-fun m!848489 () Bool)

(assert (=> b!913977 m!848489))

(declare-fun m!848491 () Bool)

(assert (=> b!913977 m!848491))

(declare-fun m!848493 () Bool)

(assert (=> b!913977 m!848493))

(assert (=> b!913977 m!848485))

(declare-fun m!848495 () Bool)

(assert (=> b!913977 m!848495))

(declare-fun m!848497 () Bool)

(assert (=> b!913977 m!848497))

(declare-fun m!848499 () Bool)

(assert (=> b!913977 m!848499))

(declare-fun m!848501 () Bool)

(assert (=> b!913977 m!848501))

(declare-fun m!848503 () Bool)

(assert (=> b!913977 m!848503))

(assert (=> b!913977 m!848491))

(declare-fun m!848505 () Bool)

(assert (=> b!913977 m!848505))

(assert (=> b!913977 m!848503))

(declare-fun m!848507 () Bool)

(assert (=> b!913977 m!848507))

(declare-fun m!848509 () Bool)

(assert (=> b!913977 m!848509))

(assert (=> b!913977 m!848391))

(assert (=> b!913977 m!848487))

(declare-fun m!848511 () Bool)

(assert (=> b!913978 m!848511))

(assert (=> b!913978 m!848333))

(declare-fun m!848513 () Bool)

(assert (=> b!913978 m!848513))

(assert (=> b!913978 m!848333))

(assert (=> b!913978 m!848511))

(assert (=> b!913978 m!848391))

(declare-fun m!848515 () Bool)

(assert (=> b!913978 m!848515))

(assert (=> b!913978 m!848391))

(assert (=> d!112517 m!848317))

(declare-fun m!848517 () Bool)

(assert (=> b!913966 m!848517))

(declare-fun m!848519 () Bool)

(assert (=> bm!40486 m!848519))

(assert (=> bm!40492 m!848483))

(declare-fun m!848521 () Bool)

(assert (=> b!913976 m!848521))

(assert (=> b!913965 m!848391))

(assert (=> b!913965 m!848391))

(assert (=> b!913965 m!848393))

(declare-fun m!848523 () Bool)

(assert (=> bm!40489 m!848523))

(assert (=> b!913795 d!112517))

(declare-fun d!112519 () Bool)

(assert (=> d!112519 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!913794 d!112519))

(declare-fun d!112521 () Bool)

(assert (=> d!112521 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78316 d!112521))

(declare-fun d!112523 () Bool)

(assert (=> d!112523 (= (array_inv!20388 _values!1152) (bvsge (size!26562 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78316 d!112523))

(declare-fun d!112525 () Bool)

(assert (=> d!112525 (= (array_inv!20389 _keys!1386) (bvsge (size!26563 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78316 d!112525))

(declare-fun mapIsEmpty!30473 () Bool)

(declare-fun mapRes!30473 () Bool)

(assert (=> mapIsEmpty!30473 mapRes!30473))

(declare-fun b!913991 () Bool)

(declare-fun e!512707 () Bool)

(assert (=> b!913991 (= e!512707 tp_is_empty!19155)))

(declare-fun mapNonEmpty!30473 () Bool)

(declare-fun tp!58504 () Bool)

(declare-fun e!512706 () Bool)

(assert (=> mapNonEmpty!30473 (= mapRes!30473 (and tp!58504 e!512706))))

(declare-fun mapRest!30473 () (Array (_ BitVec 32) ValueCell!9096))

(declare-fun mapKey!30473 () (_ BitVec 32))

(declare-fun mapValue!30473 () ValueCell!9096)

(assert (=> mapNonEmpty!30473 (= mapRest!30467 (store mapRest!30473 mapKey!30473 mapValue!30473))))

(declare-fun b!913990 () Bool)

(assert (=> b!913990 (= e!512706 tp_is_empty!19155)))

(declare-fun condMapEmpty!30473 () Bool)

(declare-fun mapDefault!30473 () ValueCell!9096)

(assert (=> mapNonEmpty!30467 (= condMapEmpty!30473 (= mapRest!30467 ((as const (Array (_ BitVec 32) ValueCell!9096)) mapDefault!30473)))))

(assert (=> mapNonEmpty!30467 (= tp!58494 (and e!512707 mapRes!30473))))

(assert (= (and mapNonEmpty!30467 condMapEmpty!30473) mapIsEmpty!30473))

(assert (= (and mapNonEmpty!30467 (not condMapEmpty!30473)) mapNonEmpty!30473))

(assert (= (and mapNonEmpty!30473 ((_ is ValueCellFull!9096) mapValue!30473)) b!913990))

(assert (= (and mapNonEmpty!30467 ((_ is ValueCellFull!9096) mapDefault!30473)) b!913991))

(declare-fun m!848525 () Bool)

(assert (=> mapNonEmpty!30473 m!848525))

(declare-fun b_lambda!13351 () Bool)

(assert (= b_lambda!13349 (or (and start!78316 b_free!16737) b_lambda!13351)))

(declare-fun b_lambda!13353 () Bool)

(assert (= b_lambda!13347 (or (and start!78316 b_free!16737) b_lambda!13353)))

(check-sat (not b!913848) (not b!913977) (not b!913859) (not d!112509) (not b!913957) (not b!913982) (not b!913978) (not bm!40476) (not b!913960) (not bm!40485) (not bm!40486) (not d!112515) (not b!913879) (not b!913943) (not b!913866) (not b!913847) (not b!913937) (not d!112517) (not b!913930) (not b!913857) (not b!913956) (not b!913939) (not bm!40488) (not b_lambda!13351) (not b!913931) (not b!913969) (not bm!40482) (not b!913962) (not b!913927) (not b!913966) (not b!913881) (not d!112499) tp_is_empty!19155 (not b!913938) (not b!913871) (not bm!40479) (not d!112511) (not b!913955) (not bm!40489) b_and!27339 (not bm!40478) (not b_next!16737) (not bm!40492) (not b!913976) (not b!913970) (not b!913926) (not b!913965) (not bm!40461) (not mapNonEmpty!30473) (not d!112507) (not b_lambda!13353) (not b_lambda!13345))
(check-sat b_and!27339 (not b_next!16737))
(get-model)

(declare-fun b!914016 () Bool)

(declare-fun e!512724 () Bool)

(assert (=> b!914016 (= e!512724 (validKeyInArray!0 (select (arr!26104 _keys!1386) i!717)))))

(assert (=> b!914016 (bvsge i!717 #b00000000000000000000000000000000)))

(declare-fun b!914017 () Bool)

(declare-fun res!616435 () Bool)

(declare-fun e!512728 () Bool)

(assert (=> b!914017 (=> (not res!616435) (not e!512728))))

(declare-fun lt!411256 () ListLongMap!11247)

(assert (=> b!914017 (= res!616435 (not (contains!4687 lt!411256 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!914019 () Bool)

(declare-fun e!512727 () Bool)

(declare-fun e!512726 () Bool)

(assert (=> b!914019 (= e!512727 e!512726)))

(assert (=> b!914019 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26563 _keys!1386)))))

(declare-fun res!616434 () Bool)

(assert (=> b!914019 (= res!616434 (contains!4687 lt!411256 (select (arr!26104 _keys!1386) i!717)))))

(assert (=> b!914019 (=> (not res!616434) (not e!512726))))

(declare-fun bm!40495 () Bool)

(declare-fun call!40498 () ListLongMap!11247)

(assert (=> bm!40495 (= call!40498 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd i!717 #b00000000000000000000000000000001) defaultEntry!1160))))

(declare-fun e!512722 () Bool)

(declare-fun b!914020 () Bool)

(assert (=> b!914020 (= e!512722 (= lt!411256 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd i!717 #b00000000000000000000000000000001) defaultEntry!1160)))))

(declare-fun b!914021 () Bool)

(assert (=> b!914021 (= e!512728 e!512727)))

(declare-fun c!95966 () Bool)

(assert (=> b!914021 (= c!95966 e!512724)))

(declare-fun res!616436 () Bool)

(assert (=> b!914021 (=> (not res!616436) (not e!512724))))

(assert (=> b!914021 (= res!616436 (bvslt i!717 (size!26563 _keys!1386)))))

(declare-fun b!914022 () Bool)

(declare-fun e!512725 () ListLongMap!11247)

(assert (=> b!914022 (= e!512725 call!40498)))

(declare-fun b!914023 () Bool)

(declare-fun lt!411255 () Unit!30934)

(declare-fun lt!411257 () Unit!30934)

(assert (=> b!914023 (= lt!411255 lt!411257)))

(declare-fun lt!411259 () (_ BitVec 64))

(declare-fun lt!411261 () (_ BitVec 64))

(declare-fun lt!411260 () V!30505)

(declare-fun lt!411258 () ListLongMap!11247)

(assert (=> b!914023 (not (contains!4687 (+!2609 lt!411258 (tuple2!12551 lt!411261 lt!411260)) lt!411259))))

(declare-fun addStillNotContains!219 (ListLongMap!11247 (_ BitVec 64) V!30505 (_ BitVec 64)) Unit!30934)

(assert (=> b!914023 (= lt!411257 (addStillNotContains!219 lt!411258 lt!411261 lt!411260 lt!411259))))

(assert (=> b!914023 (= lt!411259 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!914023 (= lt!411260 (get!13706 (select (arr!26103 _values!1152) i!717) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!914023 (= lt!411261 (select (arr!26104 _keys!1386) i!717))))

(assert (=> b!914023 (= lt!411258 call!40498)))

(assert (=> b!914023 (= e!512725 (+!2609 call!40498 (tuple2!12551 (select (arr!26104 _keys!1386) i!717) (get!13706 (select (arr!26103 _values!1152) i!717) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!914024 () Bool)

(assert (=> b!914024 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26563 _keys!1386)))))

(assert (=> b!914024 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26562 _values!1152)))))

(assert (=> b!914024 (= e!512726 (= (apply!518 lt!411256 (select (arr!26104 _keys!1386) i!717)) (get!13706 (select (arr!26103 _values!1152) i!717) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914025 () Bool)

(declare-fun isEmpty!694 (ListLongMap!11247) Bool)

(assert (=> b!914025 (= e!512722 (isEmpty!694 lt!411256))))

(declare-fun d!112527 () Bool)

(assert (=> d!112527 e!512728))

(declare-fun res!616433 () Bool)

(assert (=> d!112527 (=> (not res!616433) (not e!512728))))

(assert (=> d!112527 (= res!616433 (not (contains!4687 lt!411256 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!512723 () ListLongMap!11247)

(assert (=> d!112527 (= lt!411256 e!512723)))

(declare-fun c!95965 () Bool)

(assert (=> d!112527 (= c!95965 (bvsge i!717 (size!26563 _keys!1386)))))

(assert (=> d!112527 (validMask!0 mask!1756)))

(assert (=> d!112527 (= (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!411256)))

(declare-fun b!914018 () Bool)

(assert (=> b!914018 (= e!512727 e!512722)))

(declare-fun c!95968 () Bool)

(assert (=> b!914018 (= c!95968 (bvslt i!717 (size!26563 _keys!1386)))))

(declare-fun b!914026 () Bool)

(assert (=> b!914026 (= e!512723 (ListLongMap!11248 Nil!18334))))

(declare-fun b!914027 () Bool)

(assert (=> b!914027 (= e!512723 e!512725)))

(declare-fun c!95967 () Bool)

(assert (=> b!914027 (= c!95967 (validKeyInArray!0 (select (arr!26104 _keys!1386) i!717)))))

(assert (= (and d!112527 c!95965) b!914026))

(assert (= (and d!112527 (not c!95965)) b!914027))

(assert (= (and b!914027 c!95967) b!914023))

(assert (= (and b!914027 (not c!95967)) b!914022))

(assert (= (or b!914023 b!914022) bm!40495))

(assert (= (and d!112527 res!616433) b!914017))

(assert (= (and b!914017 res!616435) b!914021))

(assert (= (and b!914021 res!616436) b!914016))

(assert (= (and b!914021 c!95966) b!914019))

(assert (= (and b!914021 (not c!95966)) b!914018))

(assert (= (and b!914019 res!616434) b!914024))

(assert (= (and b!914018 c!95968) b!914020))

(assert (= (and b!914018 (not c!95968)) b!914025))

(declare-fun b_lambda!13355 () Bool)

(assert (=> (not b_lambda!13355) (not b!914023)))

(assert (=> b!914023 t!25933))

(declare-fun b_and!27341 () Bool)

(assert (= b_and!27339 (and (=> t!25933 result!10703) b_and!27341)))

(declare-fun b_lambda!13357 () Bool)

(assert (=> (not b_lambda!13357) (not b!914024)))

(assert (=> b!914024 t!25933))

(declare-fun b_and!27343 () Bool)

(assert (= b_and!27341 (and (=> t!25933 result!10703) b_and!27343)))

(declare-fun m!848527 () Bool)

(assert (=> d!112527 m!848527))

(assert (=> d!112527 m!848317))

(assert (=> b!914024 m!848333))

(assert (=> b!914024 m!848331))

(assert (=> b!914024 m!848311))

(assert (=> b!914024 m!848311))

(declare-fun m!848529 () Bool)

(assert (=> b!914024 m!848529))

(assert (=> b!914024 m!848331))

(assert (=> b!914024 m!848333))

(assert (=> b!914024 m!848335))

(assert (=> b!914019 m!848311))

(assert (=> b!914019 m!848311))

(declare-fun m!848531 () Bool)

(assert (=> b!914019 m!848531))

(declare-fun m!848533 () Bool)

(assert (=> bm!40495 m!848533))

(assert (=> b!914027 m!848311))

(assert (=> b!914027 m!848311))

(assert (=> b!914027 m!848413))

(assert (=> b!914016 m!848311))

(assert (=> b!914016 m!848311))

(assert (=> b!914016 m!848413))

(declare-fun m!848535 () Bool)

(assert (=> b!914017 m!848535))

(assert (=> b!914020 m!848533))

(declare-fun m!848537 () Bool)

(assert (=> b!914025 m!848537))

(assert (=> b!914023 m!848333))

(assert (=> b!914023 m!848331))

(assert (=> b!914023 m!848311))

(declare-fun m!848539 () Bool)

(assert (=> b!914023 m!848539))

(declare-fun m!848541 () Bool)

(assert (=> b!914023 m!848541))

(assert (=> b!914023 m!848331))

(assert (=> b!914023 m!848333))

(assert (=> b!914023 m!848335))

(declare-fun m!848543 () Bool)

(assert (=> b!914023 m!848543))

(assert (=> b!914023 m!848539))

(declare-fun m!848545 () Bool)

(assert (=> b!914023 m!848545))

(assert (=> bm!40482 d!112527))

(declare-fun bm!40496 () Bool)

(declare-fun call!40499 () Bool)

(assert (=> bm!40496 (= call!40499 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun d!112529 () Bool)

(declare-fun res!616438 () Bool)

(declare-fun e!512729 () Bool)

(assert (=> d!112529 (=> res!616438 e!512729)))

(assert (=> d!112529 (= res!616438 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26563 _keys!1386)))))

(assert (=> d!112529 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756) e!512729)))

(declare-fun b!914028 () Bool)

(declare-fun e!512730 () Bool)

(assert (=> b!914028 (= e!512729 e!512730)))

(declare-fun c!95969 () Bool)

(assert (=> b!914028 (= c!95969 (validKeyInArray!0 (select (arr!26104 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!914029 () Bool)

(declare-fun e!512731 () Bool)

(assert (=> b!914029 (= e!512731 call!40499)))

(declare-fun b!914030 () Bool)

(assert (=> b!914030 (= e!512730 e!512731)))

(declare-fun lt!411264 () (_ BitVec 64))

(assert (=> b!914030 (= lt!411264 (select (arr!26104 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!411263 () Unit!30934)

(assert (=> b!914030 (= lt!411263 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411264 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!914030 (arrayContainsKey!0 _keys!1386 lt!411264 #b00000000000000000000000000000000)))

(declare-fun lt!411262 () Unit!30934)

(assert (=> b!914030 (= lt!411262 lt!411263)))

(declare-fun res!616437 () Bool)

(assert (=> b!914030 (= res!616437 (= (seekEntryOrOpen!0 (select (arr!26104 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1386 mask!1756) (Found!8970 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!914030 (=> (not res!616437) (not e!512731))))

(declare-fun b!914031 () Bool)

(assert (=> b!914031 (= e!512730 call!40499)))

(assert (= (and d!112529 (not res!616438)) b!914028))

(assert (= (and b!914028 c!95969) b!914030))

(assert (= (and b!914028 (not c!95969)) b!914031))

(assert (= (and b!914030 res!616437) b!914029))

(assert (= (or b!914029 b!914031) bm!40496))

(declare-fun m!848547 () Bool)

(assert (=> bm!40496 m!848547))

(declare-fun m!848549 () Bool)

(assert (=> b!914028 m!848549))

(assert (=> b!914028 m!848549))

(declare-fun m!848551 () Bool)

(assert (=> b!914028 m!848551))

(assert (=> b!914030 m!848549))

(declare-fun m!848553 () Bool)

(assert (=> b!914030 m!848553))

(declare-fun m!848555 () Bool)

(assert (=> b!914030 m!848555))

(assert (=> b!914030 m!848549))

(declare-fun m!848557 () Bool)

(assert (=> b!914030 m!848557))

(assert (=> bm!40461 d!112529))

(declare-fun d!112531 () Bool)

(assert (=> d!112531 (= (validKeyInArray!0 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)) (and (not (= (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913965 d!112531))

(assert (=> b!913857 d!112531))

(declare-fun d!112533 () Bool)

(declare-fun e!512734 () Bool)

(assert (=> d!112533 e!512734))

(declare-fun res!616443 () Bool)

(assert (=> d!112533 (=> (not res!616443) (not e!512734))))

(declare-fun lt!411274 () ListLongMap!11247)

(assert (=> d!112533 (= res!616443 (contains!4687 lt!411274 (_1!6286 (ite (or c!95944 c!95943) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lt!411273 () List!18337)

(assert (=> d!112533 (= lt!411274 (ListLongMap!11248 lt!411273))))

(declare-fun lt!411276 () Unit!30934)

(declare-fun lt!411275 () Unit!30934)

(assert (=> d!112533 (= lt!411276 lt!411275)))

(assert (=> d!112533 (= (getValueByKey!476 lt!411273 (_1!6286 (ite (or c!95944 c!95943) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!481 (_2!6286 (ite (or c!95944 c!95943) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!253 (List!18337 (_ BitVec 64) V!30505) Unit!30934)

(assert (=> d!112533 (= lt!411275 (lemmaContainsTupThenGetReturnValue!253 lt!411273 (_1!6286 (ite (or c!95944 c!95943) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6286 (ite (or c!95944 c!95943) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun insertStrictlySorted!310 (List!18337 (_ BitVec 64) V!30505) List!18337)

(assert (=> d!112533 (= lt!411273 (insertStrictlySorted!310 (toList!5639 (ite c!95944 call!40482 (ite c!95943 call!40480 call!40484))) (_1!6286 (ite (or c!95944 c!95943) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6286 (ite (or c!95944 c!95943) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112533 (= (+!2609 (ite c!95944 call!40482 (ite c!95943 call!40480 call!40484)) (ite (or c!95944 c!95943) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) lt!411274)))

(declare-fun b!914036 () Bool)

(declare-fun res!616444 () Bool)

(assert (=> b!914036 (=> (not res!616444) (not e!512734))))

(assert (=> b!914036 (= res!616444 (= (getValueByKey!476 (toList!5639 lt!411274) (_1!6286 (ite (or c!95944 c!95943) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!481 (_2!6286 (ite (or c!95944 c!95943) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))))

(declare-fun b!914037 () Bool)

(declare-fun contains!4689 (List!18337 tuple2!12550) Bool)

(assert (=> b!914037 (= e!512734 (contains!4689 (toList!5639 lt!411274) (ite (or c!95944 c!95943) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112533 res!616443) b!914036))

(assert (= (and b!914036 res!616444) b!914037))

(declare-fun m!848559 () Bool)

(assert (=> d!112533 m!848559))

(declare-fun m!848561 () Bool)

(assert (=> d!112533 m!848561))

(declare-fun m!848563 () Bool)

(assert (=> d!112533 m!848563))

(declare-fun m!848565 () Bool)

(assert (=> d!112533 m!848565))

(declare-fun m!848567 () Bool)

(assert (=> b!914036 m!848567))

(declare-fun m!848569 () Bool)

(assert (=> b!914037 m!848569))

(assert (=> bm!40478 d!112533))

(declare-fun d!112535 () Bool)

(declare-fun e!512736 () Bool)

(assert (=> d!112535 e!512736))

(declare-fun res!616445 () Bool)

(assert (=> d!112535 (=> res!616445 e!512736)))

(declare-fun lt!411277 () Bool)

(assert (=> d!112535 (= res!616445 (not lt!411277))))

(declare-fun lt!411278 () Bool)

(assert (=> d!112535 (= lt!411277 lt!411278)))

(declare-fun lt!411280 () Unit!30934)

(declare-fun e!512735 () Unit!30934)

(assert (=> d!112535 (= lt!411280 e!512735)))

(declare-fun c!95970 () Bool)

(assert (=> d!112535 (= c!95970 lt!411278)))

(assert (=> d!112535 (= lt!411278 (containsKey!443 (toList!5639 lt!411198) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112535 (= (contains!4687 lt!411198 #b0000000000000000000000000000000000000000000000000000000000000000) lt!411277)))

(declare-fun b!914038 () Bool)

(declare-fun lt!411279 () Unit!30934)

(assert (=> b!914038 (= e!512735 lt!411279)))

(assert (=> b!914038 (= lt!411279 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5639 lt!411198) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914038 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411198) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914039 () Bool)

(declare-fun Unit!30940 () Unit!30934)

(assert (=> b!914039 (= e!512735 Unit!30940)))

(declare-fun b!914040 () Bool)

(assert (=> b!914040 (= e!512736 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411198) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112535 c!95970) b!914038))

(assert (= (and d!112535 (not c!95970)) b!914039))

(assert (= (and d!112535 (not res!616445)) b!914040))

(declare-fun m!848571 () Bool)

(assert (=> d!112535 m!848571))

(declare-fun m!848573 () Bool)

(assert (=> b!914038 m!848573))

(declare-fun m!848575 () Bool)

(assert (=> b!914038 m!848575))

(assert (=> b!914038 m!848575))

(declare-fun m!848577 () Bool)

(assert (=> b!914038 m!848577))

(assert (=> b!914040 m!848575))

(assert (=> b!914040 m!848575))

(assert (=> b!914040 m!848577))

(assert (=> bm!40476 d!112535))

(assert (=> b!913957 d!112531))

(declare-fun d!112537 () Bool)

(assert (=> d!112537 (= (validKeyInArray!0 (select (arr!26104 _keys!1386) i!717)) (and (not (= (select (arr!26104 _keys!1386) i!717) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!26104 _keys!1386) i!717) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913926 d!112537))

(declare-fun d!112539 () Bool)

(assert (=> d!112539 (= (apply!518 (+!2609 lt!411238 (tuple2!12551 lt!411231 minValue!1094)) lt!411228) (apply!518 lt!411238 lt!411228))))

(declare-fun lt!411283 () Unit!30934)

(declare-fun choose!1536 (ListLongMap!11247 (_ BitVec 64) V!30505 (_ BitVec 64)) Unit!30934)

(assert (=> d!112539 (= lt!411283 (choose!1536 lt!411238 lt!411231 minValue!1094 lt!411228))))

(declare-fun e!512739 () Bool)

(assert (=> d!112539 e!512739))

(declare-fun res!616448 () Bool)

(assert (=> d!112539 (=> (not res!616448) (not e!512739))))

(assert (=> d!112539 (= res!616448 (contains!4687 lt!411238 lt!411228))))

(assert (=> d!112539 (= (addApplyDifferent!350 lt!411238 lt!411231 minValue!1094 lt!411228) lt!411283)))

(declare-fun b!914044 () Bool)

(assert (=> b!914044 (= e!512739 (not (= lt!411228 lt!411231)))))

(assert (= (and d!112539 res!616448) b!914044))

(assert (=> d!112539 m!848491))

(declare-fun m!848579 () Bool)

(assert (=> d!112539 m!848579))

(assert (=> d!112539 m!848481))

(declare-fun m!848581 () Bool)

(assert (=> d!112539 m!848581))

(assert (=> d!112539 m!848491))

(assert (=> d!112539 m!848505))

(assert (=> b!913977 d!112539))

(declare-fun d!112541 () Bool)

(assert (=> d!112541 (= (apply!518 (+!2609 lt!411222 (tuple2!12551 lt!411232 zeroValue!1094)) lt!411220) (get!13707 (getValueByKey!476 (toList!5639 (+!2609 lt!411222 (tuple2!12551 lt!411232 zeroValue!1094))) lt!411220)))))

(declare-fun bs!25712 () Bool)

(assert (= bs!25712 d!112541))

(declare-fun m!848583 () Bool)

(assert (=> bs!25712 m!848583))

(assert (=> bs!25712 m!848583))

(declare-fun m!848585 () Bool)

(assert (=> bs!25712 m!848585))

(assert (=> b!913977 d!112541))

(declare-fun d!112543 () Bool)

(assert (=> d!112543 (= (apply!518 lt!411239 lt!411229) (get!13707 (getValueByKey!476 (toList!5639 lt!411239) lt!411229)))))

(declare-fun bs!25713 () Bool)

(assert (= bs!25713 d!112543))

(declare-fun m!848587 () Bool)

(assert (=> bs!25713 m!848587))

(assert (=> bs!25713 m!848587))

(declare-fun m!848589 () Bool)

(assert (=> bs!25713 m!848589))

(assert (=> b!913977 d!112543))

(declare-fun d!112545 () Bool)

(declare-fun e!512740 () Bool)

(assert (=> d!112545 e!512740))

(declare-fun res!616449 () Bool)

(assert (=> d!112545 (=> (not res!616449) (not e!512740))))

(declare-fun lt!411285 () ListLongMap!11247)

(assert (=> d!112545 (= res!616449 (contains!4687 lt!411285 (_1!6286 (tuple2!12551 lt!411221 zeroValue!1094))))))

(declare-fun lt!411284 () List!18337)

(assert (=> d!112545 (= lt!411285 (ListLongMap!11248 lt!411284))))

(declare-fun lt!411287 () Unit!30934)

(declare-fun lt!411286 () Unit!30934)

(assert (=> d!112545 (= lt!411287 lt!411286)))

(assert (=> d!112545 (= (getValueByKey!476 lt!411284 (_1!6286 (tuple2!12551 lt!411221 zeroValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411221 zeroValue!1094))))))

(assert (=> d!112545 (= lt!411286 (lemmaContainsTupThenGetReturnValue!253 lt!411284 (_1!6286 (tuple2!12551 lt!411221 zeroValue!1094)) (_2!6286 (tuple2!12551 lt!411221 zeroValue!1094))))))

(assert (=> d!112545 (= lt!411284 (insertStrictlySorted!310 (toList!5639 lt!411230) (_1!6286 (tuple2!12551 lt!411221 zeroValue!1094)) (_2!6286 (tuple2!12551 lt!411221 zeroValue!1094))))))

(assert (=> d!112545 (= (+!2609 lt!411230 (tuple2!12551 lt!411221 zeroValue!1094)) lt!411285)))

(declare-fun b!914045 () Bool)

(declare-fun res!616450 () Bool)

(assert (=> b!914045 (=> (not res!616450) (not e!512740))))

(assert (=> b!914045 (= res!616450 (= (getValueByKey!476 (toList!5639 lt!411285) (_1!6286 (tuple2!12551 lt!411221 zeroValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411221 zeroValue!1094)))))))

(declare-fun b!914046 () Bool)

(assert (=> b!914046 (= e!512740 (contains!4689 (toList!5639 lt!411285) (tuple2!12551 lt!411221 zeroValue!1094)))))

(assert (= (and d!112545 res!616449) b!914045))

(assert (= (and b!914045 res!616450) b!914046))

(declare-fun m!848591 () Bool)

(assert (=> d!112545 m!848591))

(declare-fun m!848593 () Bool)

(assert (=> d!112545 m!848593))

(declare-fun m!848595 () Bool)

(assert (=> d!112545 m!848595))

(declare-fun m!848597 () Bool)

(assert (=> d!112545 m!848597))

(declare-fun m!848599 () Bool)

(assert (=> b!914045 m!848599))

(declare-fun m!848601 () Bool)

(assert (=> b!914046 m!848601))

(assert (=> b!913977 d!112545))

(declare-fun d!112547 () Bool)

(assert (=> d!112547 (= (apply!518 lt!411238 lt!411228) (get!13707 (getValueByKey!476 (toList!5639 lt!411238) lt!411228)))))

(declare-fun bs!25714 () Bool)

(assert (= bs!25714 d!112547))

(declare-fun m!848603 () Bool)

(assert (=> bs!25714 m!848603))

(assert (=> bs!25714 m!848603))

(declare-fun m!848605 () Bool)

(assert (=> bs!25714 m!848605))

(assert (=> b!913977 d!112547))

(declare-fun d!112549 () Bool)

(assert (=> d!112549 (= (apply!518 lt!411222 lt!411220) (get!13707 (getValueByKey!476 (toList!5639 lt!411222) lt!411220)))))

(declare-fun bs!25715 () Bool)

(assert (= bs!25715 d!112549))

(declare-fun m!848607 () Bool)

(assert (=> bs!25715 m!848607))

(assert (=> bs!25715 m!848607))

(declare-fun m!848609 () Bool)

(assert (=> bs!25715 m!848609))

(assert (=> b!913977 d!112549))

(declare-fun d!112551 () Bool)

(assert (=> d!112551 (contains!4687 (+!2609 lt!411230 (tuple2!12551 lt!411221 zeroValue!1094)) lt!411236)))

(declare-fun lt!411290 () Unit!30934)

(declare-fun choose!1537 (ListLongMap!11247 (_ BitVec 64) V!30505 (_ BitVec 64)) Unit!30934)

(assert (=> d!112551 (= lt!411290 (choose!1537 lt!411230 lt!411221 zeroValue!1094 lt!411236))))

(assert (=> d!112551 (contains!4687 lt!411230 lt!411236)))

(assert (=> d!112551 (= (addStillContains!350 lt!411230 lt!411221 zeroValue!1094 lt!411236) lt!411290)))

(declare-fun bs!25716 () Bool)

(assert (= bs!25716 d!112551))

(assert (=> bs!25716 m!848487))

(assert (=> bs!25716 m!848487))

(assert (=> bs!25716 m!848489))

(declare-fun m!848611 () Bool)

(assert (=> bs!25716 m!848611))

(declare-fun m!848613 () Bool)

(assert (=> bs!25716 m!848613))

(assert (=> b!913977 d!112551))

(declare-fun b!914048 () Bool)

(declare-fun e!512743 () Bool)

(assert (=> b!914048 (= e!512743 (validKeyInArray!0 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!914048 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!914049 () Bool)

(declare-fun res!616453 () Bool)

(declare-fun e!512747 () Bool)

(assert (=> b!914049 (=> (not res!616453) (not e!512747))))

(declare-fun lt!411292 () ListLongMap!11247)

(assert (=> b!914049 (= res!616453 (not (contains!4687 lt!411292 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!914051 () Bool)

(declare-fun e!512746 () Bool)

(declare-fun e!512745 () Bool)

(assert (=> b!914051 (= e!512746 e!512745)))

(assert (=> b!914051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26563 _keys!1386)))))

(declare-fun res!616452 () Bool)

(assert (=> b!914051 (= res!616452 (contains!4687 lt!411292 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!914051 (=> (not res!616452) (not e!512745))))

(declare-fun call!40500 () ListLongMap!11247)

(declare-fun bm!40497 () Bool)

(assert (=> bm!40497 (= call!40500 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1160))))

(declare-fun b!914052 () Bool)

(declare-fun e!512741 () Bool)

(assert (=> b!914052 (= e!512741 (= lt!411292 (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1160)))))

(declare-fun b!914053 () Bool)

(assert (=> b!914053 (= e!512747 e!512746)))

(declare-fun c!95972 () Bool)

(assert (=> b!914053 (= c!95972 e!512743)))

(declare-fun res!616454 () Bool)

(assert (=> b!914053 (=> (not res!616454) (not e!512743))))

(assert (=> b!914053 (= res!616454 (bvslt #b00000000000000000000000000000000 (size!26563 _keys!1386)))))

(declare-fun b!914054 () Bool)

(declare-fun e!512744 () ListLongMap!11247)

(assert (=> b!914054 (= e!512744 call!40500)))

(declare-fun b!914055 () Bool)

(declare-fun lt!411291 () Unit!30934)

(declare-fun lt!411293 () Unit!30934)

(assert (=> b!914055 (= lt!411291 lt!411293)))

(declare-fun lt!411295 () (_ BitVec 64))

(declare-fun lt!411296 () V!30505)

(declare-fun lt!411297 () (_ BitVec 64))

(declare-fun lt!411294 () ListLongMap!11247)

(assert (=> b!914055 (not (contains!4687 (+!2609 lt!411294 (tuple2!12551 lt!411297 lt!411296)) lt!411295))))

(assert (=> b!914055 (= lt!411293 (addStillNotContains!219 lt!411294 lt!411297 lt!411296 lt!411295))))

(assert (=> b!914055 (= lt!411295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!914055 (= lt!411296 (get!13706 (select (arr!26103 _values!1152) #b00000000000000000000000000000000) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!914055 (= lt!411297 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!914055 (= lt!411294 call!40500)))

(assert (=> b!914055 (= e!512744 (+!2609 call!40500 (tuple2!12551 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) (get!13706 (select (arr!26103 _values!1152) #b00000000000000000000000000000000) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!914056 () Bool)

(assert (=> b!914056 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26563 _keys!1386)))))

(assert (=> b!914056 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26562 _values!1152)))))

(assert (=> b!914056 (= e!512745 (= (apply!518 lt!411292 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)) (get!13706 (select (arr!26103 _values!1152) #b00000000000000000000000000000000) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914057 () Bool)

(assert (=> b!914057 (= e!512741 (isEmpty!694 lt!411292))))

(declare-fun d!112553 () Bool)

(assert (=> d!112553 e!512747))

(declare-fun res!616451 () Bool)

(assert (=> d!112553 (=> (not res!616451) (not e!512747))))

(assert (=> d!112553 (= res!616451 (not (contains!4687 lt!411292 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!512742 () ListLongMap!11247)

(assert (=> d!112553 (= lt!411292 e!512742)))

(declare-fun c!95971 () Bool)

(assert (=> d!112553 (= c!95971 (bvsge #b00000000000000000000000000000000 (size!26563 _keys!1386)))))

(assert (=> d!112553 (validMask!0 mask!1756)))

(assert (=> d!112553 (= (getCurrentListMapNoExtraKeys!3296 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!411292)))

(declare-fun b!914050 () Bool)

(assert (=> b!914050 (= e!512746 e!512741)))

(declare-fun c!95974 () Bool)

(assert (=> b!914050 (= c!95974 (bvslt #b00000000000000000000000000000000 (size!26563 _keys!1386)))))

(declare-fun b!914058 () Bool)

(assert (=> b!914058 (= e!512742 (ListLongMap!11248 Nil!18334))))

(declare-fun b!914059 () Bool)

(assert (=> b!914059 (= e!512742 e!512744)))

(declare-fun c!95973 () Bool)

(assert (=> b!914059 (= c!95973 (validKeyInArray!0 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112553 c!95971) b!914058))

(assert (= (and d!112553 (not c!95971)) b!914059))

(assert (= (and b!914059 c!95973) b!914055))

(assert (= (and b!914059 (not c!95973)) b!914054))

(assert (= (or b!914055 b!914054) bm!40497))

(assert (= (and d!112553 res!616451) b!914049))

(assert (= (and b!914049 res!616453) b!914053))

(assert (= (and b!914053 res!616454) b!914048))

(assert (= (and b!914053 c!95972) b!914051))

(assert (= (and b!914053 (not c!95972)) b!914050))

(assert (= (and b!914051 res!616452) b!914056))

(assert (= (and b!914050 c!95974) b!914052))

(assert (= (and b!914050 (not c!95974)) b!914057))

(declare-fun b_lambda!13359 () Bool)

(assert (=> (not b_lambda!13359) (not b!914055)))

(assert (=> b!914055 t!25933))

(declare-fun b_and!27345 () Bool)

(assert (= b_and!27343 (and (=> t!25933 result!10703) b_and!27345)))

(declare-fun b_lambda!13361 () Bool)

(assert (=> (not b_lambda!13361) (not b!914056)))

(assert (=> b!914056 t!25933))

(declare-fun b_and!27347 () Bool)

(assert (= b_and!27345 (and (=> t!25933 result!10703) b_and!27347)))

(declare-fun m!848615 () Bool)

(assert (=> d!112553 m!848615))

(assert (=> d!112553 m!848317))

(assert (=> b!914056 m!848333))

(assert (=> b!914056 m!848511))

(assert (=> b!914056 m!848391))

(assert (=> b!914056 m!848391))

(declare-fun m!848617 () Bool)

(assert (=> b!914056 m!848617))

(assert (=> b!914056 m!848511))

(assert (=> b!914056 m!848333))

(assert (=> b!914056 m!848513))

(assert (=> b!914051 m!848391))

(assert (=> b!914051 m!848391))

(declare-fun m!848619 () Bool)

(assert (=> b!914051 m!848619))

(declare-fun m!848621 () Bool)

(assert (=> bm!40497 m!848621))

(assert (=> b!914059 m!848391))

(assert (=> b!914059 m!848391))

(assert (=> b!914059 m!848393))

(assert (=> b!914048 m!848391))

(assert (=> b!914048 m!848391))

(assert (=> b!914048 m!848393))

(declare-fun m!848623 () Bool)

(assert (=> b!914049 m!848623))

(assert (=> b!914052 m!848621))

(declare-fun m!848625 () Bool)

(assert (=> b!914057 m!848625))

(assert (=> b!914055 m!848333))

(assert (=> b!914055 m!848511))

(assert (=> b!914055 m!848391))

(declare-fun m!848627 () Bool)

(assert (=> b!914055 m!848627))

(declare-fun m!848629 () Bool)

(assert (=> b!914055 m!848629))

(assert (=> b!914055 m!848511))

(assert (=> b!914055 m!848333))

(assert (=> b!914055 m!848513))

(declare-fun m!848631 () Bool)

(assert (=> b!914055 m!848631))

(assert (=> b!914055 m!848627))

(declare-fun m!848633 () Bool)

(assert (=> b!914055 m!848633))

(assert (=> b!913977 d!112553))

(declare-fun d!112555 () Bool)

(assert (=> d!112555 (= (apply!518 (+!2609 lt!411238 (tuple2!12551 lt!411231 minValue!1094)) lt!411228) (get!13707 (getValueByKey!476 (toList!5639 (+!2609 lt!411238 (tuple2!12551 lt!411231 minValue!1094))) lt!411228)))))

(declare-fun bs!25717 () Bool)

(assert (= bs!25717 d!112555))

(declare-fun m!848635 () Bool)

(assert (=> bs!25717 m!848635))

(assert (=> bs!25717 m!848635))

(declare-fun m!848637 () Bool)

(assert (=> bs!25717 m!848637))

(assert (=> b!913977 d!112555))

(declare-fun d!112557 () Bool)

(declare-fun e!512748 () Bool)

(assert (=> d!112557 e!512748))

(declare-fun res!616455 () Bool)

(assert (=> d!112557 (=> (not res!616455) (not e!512748))))

(declare-fun lt!411299 () ListLongMap!11247)

(assert (=> d!112557 (= res!616455 (contains!4687 lt!411299 (_1!6286 (tuple2!12551 lt!411231 minValue!1094))))))

(declare-fun lt!411298 () List!18337)

(assert (=> d!112557 (= lt!411299 (ListLongMap!11248 lt!411298))))

(declare-fun lt!411301 () Unit!30934)

(declare-fun lt!411300 () Unit!30934)

(assert (=> d!112557 (= lt!411301 lt!411300)))

(assert (=> d!112557 (= (getValueByKey!476 lt!411298 (_1!6286 (tuple2!12551 lt!411231 minValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411231 minValue!1094))))))

(assert (=> d!112557 (= lt!411300 (lemmaContainsTupThenGetReturnValue!253 lt!411298 (_1!6286 (tuple2!12551 lt!411231 minValue!1094)) (_2!6286 (tuple2!12551 lt!411231 minValue!1094))))))

(assert (=> d!112557 (= lt!411298 (insertStrictlySorted!310 (toList!5639 lt!411238) (_1!6286 (tuple2!12551 lt!411231 minValue!1094)) (_2!6286 (tuple2!12551 lt!411231 minValue!1094))))))

(assert (=> d!112557 (= (+!2609 lt!411238 (tuple2!12551 lt!411231 minValue!1094)) lt!411299)))

(declare-fun b!914060 () Bool)

(declare-fun res!616456 () Bool)

(assert (=> b!914060 (=> (not res!616456) (not e!512748))))

(assert (=> b!914060 (= res!616456 (= (getValueByKey!476 (toList!5639 lt!411299) (_1!6286 (tuple2!12551 lt!411231 minValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411231 minValue!1094)))))))

(declare-fun b!914061 () Bool)

(assert (=> b!914061 (= e!512748 (contains!4689 (toList!5639 lt!411299) (tuple2!12551 lt!411231 minValue!1094)))))

(assert (= (and d!112557 res!616455) b!914060))

(assert (= (and b!914060 res!616456) b!914061))

(declare-fun m!848639 () Bool)

(assert (=> d!112557 m!848639))

(declare-fun m!848641 () Bool)

(assert (=> d!112557 m!848641))

(declare-fun m!848643 () Bool)

(assert (=> d!112557 m!848643))

(declare-fun m!848645 () Bool)

(assert (=> d!112557 m!848645))

(declare-fun m!848647 () Bool)

(assert (=> b!914060 m!848647))

(declare-fun m!848649 () Bool)

(assert (=> b!914061 m!848649))

(assert (=> b!913977 d!112557))

(declare-fun d!112559 () Bool)

(declare-fun e!512749 () Bool)

(assert (=> d!112559 e!512749))

(declare-fun res!616457 () Bool)

(assert (=> d!112559 (=> (not res!616457) (not e!512749))))

(declare-fun lt!411303 () ListLongMap!11247)

(assert (=> d!112559 (= res!616457 (contains!4687 lt!411303 (_1!6286 (tuple2!12551 lt!411237 minValue!1094))))))

(declare-fun lt!411302 () List!18337)

(assert (=> d!112559 (= lt!411303 (ListLongMap!11248 lt!411302))))

(declare-fun lt!411305 () Unit!30934)

(declare-fun lt!411304 () Unit!30934)

(assert (=> d!112559 (= lt!411305 lt!411304)))

(assert (=> d!112559 (= (getValueByKey!476 lt!411302 (_1!6286 (tuple2!12551 lt!411237 minValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411237 minValue!1094))))))

(assert (=> d!112559 (= lt!411304 (lemmaContainsTupThenGetReturnValue!253 lt!411302 (_1!6286 (tuple2!12551 lt!411237 minValue!1094)) (_2!6286 (tuple2!12551 lt!411237 minValue!1094))))))

(assert (=> d!112559 (= lt!411302 (insertStrictlySorted!310 (toList!5639 lt!411239) (_1!6286 (tuple2!12551 lt!411237 minValue!1094)) (_2!6286 (tuple2!12551 lt!411237 minValue!1094))))))

(assert (=> d!112559 (= (+!2609 lt!411239 (tuple2!12551 lt!411237 minValue!1094)) lt!411303)))

(declare-fun b!914062 () Bool)

(declare-fun res!616458 () Bool)

(assert (=> b!914062 (=> (not res!616458) (not e!512749))))

(assert (=> b!914062 (= res!616458 (= (getValueByKey!476 (toList!5639 lt!411303) (_1!6286 (tuple2!12551 lt!411237 minValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411237 minValue!1094)))))))

(declare-fun b!914063 () Bool)

(assert (=> b!914063 (= e!512749 (contains!4689 (toList!5639 lt!411303) (tuple2!12551 lt!411237 minValue!1094)))))

(assert (= (and d!112559 res!616457) b!914062))

(assert (= (and b!914062 res!616458) b!914063))

(declare-fun m!848651 () Bool)

(assert (=> d!112559 m!848651))

(declare-fun m!848653 () Bool)

(assert (=> d!112559 m!848653))

(declare-fun m!848655 () Bool)

(assert (=> d!112559 m!848655))

(declare-fun m!848657 () Bool)

(assert (=> d!112559 m!848657))

(declare-fun m!848659 () Bool)

(assert (=> b!914062 m!848659))

(declare-fun m!848661 () Bool)

(assert (=> b!914063 m!848661))

(assert (=> b!913977 d!112559))

(declare-fun d!112561 () Bool)

(declare-fun e!512751 () Bool)

(assert (=> d!112561 e!512751))

(declare-fun res!616459 () Bool)

(assert (=> d!112561 (=> res!616459 e!512751)))

(declare-fun lt!411306 () Bool)

(assert (=> d!112561 (= res!616459 (not lt!411306))))

(declare-fun lt!411307 () Bool)

(assert (=> d!112561 (= lt!411306 lt!411307)))

(declare-fun lt!411309 () Unit!30934)

(declare-fun e!512750 () Unit!30934)

(assert (=> d!112561 (= lt!411309 e!512750)))

(declare-fun c!95975 () Bool)

(assert (=> d!112561 (= c!95975 lt!411307)))

(assert (=> d!112561 (= lt!411307 (containsKey!443 (toList!5639 (+!2609 lt!411230 (tuple2!12551 lt!411221 zeroValue!1094))) lt!411236))))

(assert (=> d!112561 (= (contains!4687 (+!2609 lt!411230 (tuple2!12551 lt!411221 zeroValue!1094)) lt!411236) lt!411306)))

(declare-fun b!914064 () Bool)

(declare-fun lt!411308 () Unit!30934)

(assert (=> b!914064 (= e!512750 lt!411308)))

(assert (=> b!914064 (= lt!411308 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5639 (+!2609 lt!411230 (tuple2!12551 lt!411221 zeroValue!1094))) lt!411236))))

(assert (=> b!914064 (isDefined!348 (getValueByKey!476 (toList!5639 (+!2609 lt!411230 (tuple2!12551 lt!411221 zeroValue!1094))) lt!411236))))

(declare-fun b!914065 () Bool)

(declare-fun Unit!30941 () Unit!30934)

(assert (=> b!914065 (= e!512750 Unit!30941)))

(declare-fun b!914066 () Bool)

(assert (=> b!914066 (= e!512751 (isDefined!348 (getValueByKey!476 (toList!5639 (+!2609 lt!411230 (tuple2!12551 lt!411221 zeroValue!1094))) lt!411236)))))

(assert (= (and d!112561 c!95975) b!914064))

(assert (= (and d!112561 (not c!95975)) b!914065))

(assert (= (and d!112561 (not res!616459)) b!914066))

(declare-fun m!848663 () Bool)

(assert (=> d!112561 m!848663))

(declare-fun m!848665 () Bool)

(assert (=> b!914064 m!848665))

(declare-fun m!848667 () Bool)

(assert (=> b!914064 m!848667))

(assert (=> b!914064 m!848667))

(declare-fun m!848669 () Bool)

(assert (=> b!914064 m!848669))

(assert (=> b!914066 m!848667))

(assert (=> b!914066 m!848667))

(assert (=> b!914066 m!848669))

(assert (=> b!913977 d!112561))

(declare-fun d!112563 () Bool)

(declare-fun e!512752 () Bool)

(assert (=> d!112563 e!512752))

(declare-fun res!616460 () Bool)

(assert (=> d!112563 (=> (not res!616460) (not e!512752))))

(declare-fun lt!411311 () ListLongMap!11247)

(assert (=> d!112563 (= res!616460 (contains!4687 lt!411311 (_1!6286 (tuple2!12551 lt!411232 zeroValue!1094))))))

(declare-fun lt!411310 () List!18337)

(assert (=> d!112563 (= lt!411311 (ListLongMap!11248 lt!411310))))

(declare-fun lt!411313 () Unit!30934)

(declare-fun lt!411312 () Unit!30934)

(assert (=> d!112563 (= lt!411313 lt!411312)))

(assert (=> d!112563 (= (getValueByKey!476 lt!411310 (_1!6286 (tuple2!12551 lt!411232 zeroValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411232 zeroValue!1094))))))

(assert (=> d!112563 (= lt!411312 (lemmaContainsTupThenGetReturnValue!253 lt!411310 (_1!6286 (tuple2!12551 lt!411232 zeroValue!1094)) (_2!6286 (tuple2!12551 lt!411232 zeroValue!1094))))))

(assert (=> d!112563 (= lt!411310 (insertStrictlySorted!310 (toList!5639 lt!411222) (_1!6286 (tuple2!12551 lt!411232 zeroValue!1094)) (_2!6286 (tuple2!12551 lt!411232 zeroValue!1094))))))

(assert (=> d!112563 (= (+!2609 lt!411222 (tuple2!12551 lt!411232 zeroValue!1094)) lt!411311)))

(declare-fun b!914067 () Bool)

(declare-fun res!616461 () Bool)

(assert (=> b!914067 (=> (not res!616461) (not e!512752))))

(assert (=> b!914067 (= res!616461 (= (getValueByKey!476 (toList!5639 lt!411311) (_1!6286 (tuple2!12551 lt!411232 zeroValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411232 zeroValue!1094)))))))

(declare-fun b!914068 () Bool)

(assert (=> b!914068 (= e!512752 (contains!4689 (toList!5639 lt!411311) (tuple2!12551 lt!411232 zeroValue!1094)))))

(assert (= (and d!112563 res!616460) b!914067))

(assert (= (and b!914067 res!616461) b!914068))

(declare-fun m!848671 () Bool)

(assert (=> d!112563 m!848671))

(declare-fun m!848673 () Bool)

(assert (=> d!112563 m!848673))

(declare-fun m!848675 () Bool)

(assert (=> d!112563 m!848675))

(declare-fun m!848677 () Bool)

(assert (=> d!112563 m!848677))

(declare-fun m!848679 () Bool)

(assert (=> b!914067 m!848679))

(declare-fun m!848681 () Bool)

(assert (=> b!914068 m!848681))

(assert (=> b!913977 d!112563))

(declare-fun d!112565 () Bool)

(assert (=> d!112565 (= (apply!518 (+!2609 lt!411239 (tuple2!12551 lt!411237 minValue!1094)) lt!411229) (apply!518 lt!411239 lt!411229))))

(declare-fun lt!411314 () Unit!30934)

(assert (=> d!112565 (= lt!411314 (choose!1536 lt!411239 lt!411237 minValue!1094 lt!411229))))

(declare-fun e!512753 () Bool)

(assert (=> d!112565 e!512753))

(declare-fun res!616462 () Bool)

(assert (=> d!112565 (=> (not res!616462) (not e!512753))))

(assert (=> d!112565 (= res!616462 (contains!4687 lt!411239 lt!411229))))

(assert (=> d!112565 (= (addApplyDifferent!350 lt!411239 lt!411237 minValue!1094 lt!411229) lt!411314)))

(declare-fun b!914069 () Bool)

(assert (=> b!914069 (= e!512753 (not (= lt!411229 lt!411237)))))

(assert (= (and d!112565 res!616462) b!914069))

(assert (=> d!112565 m!848503))

(declare-fun m!848683 () Bool)

(assert (=> d!112565 m!848683))

(assert (=> d!112565 m!848497))

(declare-fun m!848685 () Bool)

(assert (=> d!112565 m!848685))

(assert (=> d!112565 m!848503))

(assert (=> d!112565 m!848507))

(assert (=> b!913977 d!112565))

(declare-fun d!112567 () Bool)

(assert (=> d!112567 (= (apply!518 (+!2609 lt!411239 (tuple2!12551 lt!411237 minValue!1094)) lt!411229) (get!13707 (getValueByKey!476 (toList!5639 (+!2609 lt!411239 (tuple2!12551 lt!411237 minValue!1094))) lt!411229)))))

(declare-fun bs!25718 () Bool)

(assert (= bs!25718 d!112567))

(declare-fun m!848687 () Bool)

(assert (=> bs!25718 m!848687))

(assert (=> bs!25718 m!848687))

(declare-fun m!848689 () Bool)

(assert (=> bs!25718 m!848689))

(assert (=> b!913977 d!112567))

(declare-fun d!112569 () Bool)

(assert (=> d!112569 (= (apply!518 (+!2609 lt!411222 (tuple2!12551 lt!411232 zeroValue!1094)) lt!411220) (apply!518 lt!411222 lt!411220))))

(declare-fun lt!411315 () Unit!30934)

(assert (=> d!112569 (= lt!411315 (choose!1536 lt!411222 lt!411232 zeroValue!1094 lt!411220))))

(declare-fun e!512754 () Bool)

(assert (=> d!112569 e!512754))

(declare-fun res!616463 () Bool)

(assert (=> d!112569 (=> (not res!616463) (not e!512754))))

(assert (=> d!112569 (= res!616463 (contains!4687 lt!411222 lt!411220))))

(assert (=> d!112569 (= (addApplyDifferent!350 lt!411222 lt!411232 zeroValue!1094 lt!411220) lt!411315)))

(declare-fun b!914070 () Bool)

(assert (=> b!914070 (= e!512754 (not (= lt!411220 lt!411232)))))

(assert (= (and d!112569 res!616463) b!914070))

(assert (=> d!112569 m!848485))

(declare-fun m!848691 () Bool)

(assert (=> d!112569 m!848691))

(assert (=> d!112569 m!848501))

(declare-fun m!848693 () Bool)

(assert (=> d!112569 m!848693))

(assert (=> d!112569 m!848485))

(assert (=> d!112569 m!848495))

(assert (=> b!913977 d!112569))

(declare-fun b!914071 () Bool)

(declare-fun e!512756 () Bool)

(assert (=> b!914071 (= e!512756 (contains!4688 (ite c!95949 (Cons!18334 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) Nil!18335) Nil!18335) (select (arr!26104 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!914072 () Bool)

(declare-fun e!512758 () Bool)

(declare-fun e!512755 () Bool)

(assert (=> b!914072 (= e!512758 e!512755)))

(declare-fun c!95976 () Bool)

(assert (=> b!914072 (= c!95976 (validKeyInArray!0 (select (arr!26104 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!914073 () Bool)

(declare-fun e!512757 () Bool)

(assert (=> b!914073 (= e!512757 e!512758)))

(declare-fun res!616464 () Bool)

(assert (=> b!914073 (=> (not res!616464) (not e!512758))))

(assert (=> b!914073 (= res!616464 (not e!512756))))

(declare-fun res!616466 () Bool)

(assert (=> b!914073 (=> (not res!616466) (not e!512756))))

(assert (=> b!914073 (= res!616466 (validKeyInArray!0 (select (arr!26104 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!40498 () Bool)

(declare-fun call!40501 () Bool)

(assert (=> bm!40498 (= call!40501 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!95976 (Cons!18334 (select (arr!26104 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!95949 (Cons!18334 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) Nil!18335) Nil!18335)) (ite c!95949 (Cons!18334 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) Nil!18335) Nil!18335))))))

(declare-fun b!914075 () Bool)

(assert (=> b!914075 (= e!512755 call!40501)))

(declare-fun d!112571 () Bool)

(declare-fun res!616465 () Bool)

(assert (=> d!112571 (=> res!616465 e!512757)))

(assert (=> d!112571 (= res!616465 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26563 _keys!1386)))))

(assert (=> d!112571 (= (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95949 (Cons!18334 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) Nil!18335) Nil!18335)) e!512757)))

(declare-fun b!914074 () Bool)

(assert (=> b!914074 (= e!512755 call!40501)))

(assert (= (and d!112571 (not res!616465)) b!914073))

(assert (= (and b!914073 res!616466) b!914071))

(assert (= (and b!914073 res!616464) b!914072))

(assert (= (and b!914072 c!95976) b!914075))

(assert (= (and b!914072 (not c!95976)) b!914074))

(assert (= (or b!914075 b!914074) bm!40498))

(assert (=> b!914071 m!848549))

(assert (=> b!914071 m!848549))

(declare-fun m!848695 () Bool)

(assert (=> b!914071 m!848695))

(assert (=> b!914072 m!848549))

(assert (=> b!914072 m!848549))

(assert (=> b!914072 m!848551))

(assert (=> b!914073 m!848549))

(assert (=> b!914073 m!848549))

(assert (=> b!914073 m!848551))

(assert (=> bm!40498 m!848549))

(declare-fun m!848697 () Bool)

(assert (=> bm!40498 m!848697))

(assert (=> bm!40485 d!112571))

(declare-fun d!112573 () Bool)

(assert (=> d!112573 (= (apply!518 lt!411198 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13707 (getValueByKey!476 (toList!5639 lt!411198) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25719 () Bool)

(assert (= bs!25719 d!112573))

(assert (=> bs!25719 m!848575))

(assert (=> bs!25719 m!848575))

(declare-fun m!848699 () Bool)

(assert (=> bs!25719 m!848699))

(assert (=> b!913927 d!112573))

(declare-fun d!112575 () Bool)

(declare-fun res!616467 () Bool)

(declare-fun e!512759 () Bool)

(assert (=> d!112575 (=> res!616467 e!512759)))

(assert (=> d!112575 (= res!616467 (= (select (arr!26104 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!1033))))

(assert (=> d!112575 (= (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!512759)))

(declare-fun b!914076 () Bool)

(declare-fun e!512760 () Bool)

(assert (=> b!914076 (= e!512759 e!512760)))

(declare-fun res!616468 () Bool)

(assert (=> b!914076 (=> (not res!616468) (not e!512760))))

(assert (=> b!914076 (= res!616468 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!26563 _keys!1386)))))

(declare-fun b!914077 () Bool)

(assert (=> b!914077 (= e!512760 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!112575 (not res!616467)) b!914076))

(assert (= (and b!914076 res!616468) b!914077))

(assert (=> d!112575 m!848549))

(declare-fun m!848701 () Bool)

(assert (=> b!914077 m!848701))

(assert (=> b!913866 d!112575))

(declare-fun d!112577 () Bool)

(assert (=> d!112577 (= (apply!518 lt!411224 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)) (get!13707 (getValueByKey!476 (toList!5639 lt!411224) (select (arr!26104 _keys!1386) #b00000000000000000000000000000000))))))

(declare-fun bs!25720 () Bool)

(assert (= bs!25720 d!112577))

(assert (=> bs!25720 m!848391))

(declare-fun m!848703 () Bool)

(assert (=> bs!25720 m!848703))

(assert (=> bs!25720 m!848703))

(declare-fun m!848705 () Bool)

(assert (=> bs!25720 m!848705))

(assert (=> b!913978 d!112577))

(declare-fun d!112579 () Bool)

(declare-fun c!95977 () Bool)

(assert (=> d!112579 (= c!95977 ((_ is ValueCellFull!9096) (select (arr!26103 _values!1152) #b00000000000000000000000000000000)))))

(declare-fun e!512761 () V!30505)

(assert (=> d!112579 (= (get!13706 (select (arr!26103 _values!1152) #b00000000000000000000000000000000) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!512761)))

(declare-fun b!914078 () Bool)

(assert (=> b!914078 (= e!512761 (get!13708 (select (arr!26103 _values!1152) #b00000000000000000000000000000000) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!914079 () Bool)

(assert (=> b!914079 (= e!512761 (get!13709 (select (arr!26103 _values!1152) #b00000000000000000000000000000000) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112579 c!95977) b!914078))

(assert (= (and d!112579 (not c!95977)) b!914079))

(assert (=> b!914078 m!848511))

(assert (=> b!914078 m!848333))

(declare-fun m!848707 () Bool)

(assert (=> b!914078 m!848707))

(assert (=> b!914079 m!848511))

(assert (=> b!914079 m!848333))

(declare-fun m!848709 () Bool)

(assert (=> b!914079 m!848709))

(assert (=> b!913978 d!112579))

(declare-fun d!112581 () Bool)

(declare-fun e!512762 () Bool)

(assert (=> d!112581 e!512762))

(declare-fun res!616469 () Bool)

(assert (=> d!112581 (=> (not res!616469) (not e!512762))))

(declare-fun lt!411317 () ListLongMap!11247)

(assert (=> d!112581 (= res!616469 (contains!4687 lt!411317 (_1!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lt!411316 () List!18337)

(assert (=> d!112581 (= lt!411317 (ListLongMap!11248 lt!411316))))

(declare-fun lt!411319 () Unit!30934)

(declare-fun lt!411318 () Unit!30934)

(assert (=> d!112581 (= lt!411319 lt!411318)))

(assert (=> d!112581 (= (getValueByKey!476 lt!411316 (_1!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!481 (_2!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112581 (= lt!411318 (lemmaContainsTupThenGetReturnValue!253 lt!411316 (_1!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112581 (= lt!411316 (insertStrictlySorted!310 (toList!5639 call!40485) (_1!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112581 (= (+!2609 call!40485 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) lt!411317)))

(declare-fun b!914080 () Bool)

(declare-fun res!616470 () Bool)

(assert (=> b!914080 (=> (not res!616470) (not e!512762))))

(assert (=> b!914080 (= res!616470 (= (getValueByKey!476 (toList!5639 lt!411317) (_1!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!481 (_2!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun b!914081 () Bool)

(assert (=> b!914081 (= e!512762 (contains!4689 (toList!5639 lt!411317) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112581 res!616469) b!914080))

(assert (= (and b!914080 res!616470) b!914081))

(declare-fun m!848711 () Bool)

(assert (=> d!112581 m!848711))

(declare-fun m!848713 () Bool)

(assert (=> d!112581 m!848713))

(declare-fun m!848715 () Bool)

(assert (=> d!112581 m!848715))

(declare-fun m!848717 () Bool)

(assert (=> d!112581 m!848717))

(declare-fun m!848719 () Bool)

(assert (=> b!914080 m!848719))

(declare-fun m!848721 () Bool)

(assert (=> b!914081 m!848721))

(assert (=> b!913943 d!112581))

(declare-fun d!112583 () Bool)

(declare-fun lt!411322 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!404 (List!18338) (InoxSet (_ BitVec 64)))

(assert (=> d!112583 (= lt!411322 (select (content!404 Nil!18335) (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun e!512768 () Bool)

(assert (=> d!112583 (= lt!411322 e!512768)))

(declare-fun res!616475 () Bool)

(assert (=> d!112583 (=> (not res!616475) (not e!512768))))

(assert (=> d!112583 (= res!616475 ((_ is Cons!18334) Nil!18335))))

(assert (=> d!112583 (= (contains!4688 Nil!18335 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)) lt!411322)))

(declare-fun b!914086 () Bool)

(declare-fun e!512767 () Bool)

(assert (=> b!914086 (= e!512768 e!512767)))

(declare-fun res!616476 () Bool)

(assert (=> b!914086 (=> res!616476 e!512767)))

(assert (=> b!914086 (= res!616476 (= (h!19480 Nil!18335) (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914087 () Bool)

(assert (=> b!914087 (= e!512767 (contains!4688 (t!25935 Nil!18335) (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112583 res!616475) b!914086))

(assert (= (and b!914086 (not res!616476)) b!914087))

(declare-fun m!848723 () Bool)

(assert (=> d!112583 m!848723))

(assert (=> d!112583 m!848391))

(declare-fun m!848725 () Bool)

(assert (=> d!112583 m!848725))

(assert (=> b!914087 m!848391))

(declare-fun m!848727 () Bool)

(assert (=> b!914087 m!848727))

(assert (=> b!913955 d!112583))

(declare-fun d!112585 () Bool)

(assert (=> d!112585 (= (apply!518 lt!411198 (select (arr!26104 _keys!1386) i!717)) (get!13707 (getValueByKey!476 (toList!5639 lt!411198) (select (arr!26104 _keys!1386) i!717))))))

(declare-fun bs!25721 () Bool)

(assert (= bs!25721 d!112585))

(assert (=> bs!25721 m!848311))

(declare-fun m!848729 () Bool)

(assert (=> bs!25721 m!848729))

(assert (=> bs!25721 m!848729))

(declare-fun m!848731 () Bool)

(assert (=> bs!25721 m!848731))

(assert (=> b!913939 d!112585))

(assert (=> b!913939 d!112501))

(declare-fun d!112587 () Bool)

(assert (=> d!112587 (= (apply!518 lt!411224 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13707 (getValueByKey!476 (toList!5639 lt!411224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25722 () Bool)

(assert (= bs!25722 d!112587))

(declare-fun m!848733 () Bool)

(assert (=> bs!25722 m!848733))

(assert (=> bs!25722 m!848733))

(declare-fun m!848735 () Bool)

(assert (=> bs!25722 m!848735))

(assert (=> b!913976 d!112587))

(declare-fun d!112589 () Bool)

(declare-fun isEmpty!695 (Option!482) Bool)

(assert (=> d!112589 (= (isDefined!348 (getValueByKey!476 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)) (not (isEmpty!695 (getValueByKey!476 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))))

(declare-fun bs!25723 () Bool)

(assert (= bs!25723 d!112589))

(assert (=> bs!25723 m!848469))

(declare-fun m!848737 () Bool)

(assert (=> bs!25723 m!848737))

(assert (=> b!913962 d!112589))

(declare-fun b!914096 () Bool)

(declare-fun e!512773 () Option!482)

(assert (=> b!914096 (= e!512773 (Some!481 (_2!6286 (h!19479 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))))))

(declare-fun b!914099 () Bool)

(declare-fun e!512774 () Option!482)

(assert (=> b!914099 (= e!512774 None!480)))

(declare-fun b!914097 () Bool)

(assert (=> b!914097 (= e!512773 e!512774)))

(declare-fun c!95983 () Bool)

(assert (=> b!914097 (= c!95983 (and ((_ is Cons!18333) (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (not (= (_1!6286 (h!19479 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033))))))

(declare-fun b!914098 () Bool)

(assert (=> b!914098 (= e!512774 (getValueByKey!476 (t!25934 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) k0!1033))))

(declare-fun d!112591 () Bool)

(declare-fun c!95982 () Bool)

(assert (=> d!112591 (= c!95982 (and ((_ is Cons!18333) (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (= (_1!6286 (h!19479 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112591 (= (getValueByKey!476 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) e!512773)))

(assert (= (and d!112591 c!95982) b!914096))

(assert (= (and d!112591 (not c!95982)) b!914097))

(assert (= (and b!914097 c!95983) b!914098))

(assert (= (and b!914097 (not c!95983)) b!914099))

(declare-fun m!848739 () Bool)

(assert (=> b!914098 m!848739))

(assert (=> b!913962 d!112591))

(assert (=> b!913956 d!112531))

(declare-fun d!112593 () Bool)

(declare-fun e!512775 () Bool)

(assert (=> d!112593 e!512775))

(declare-fun res!616477 () Bool)

(assert (=> d!112593 (=> (not res!616477) (not e!512775))))

(declare-fun lt!411324 () ListLongMap!11247)

(assert (=> d!112593 (= res!616477 (contains!4687 lt!411324 (_1!6286 (tuple2!12551 lt!411206 zeroValue!1094))))))

(declare-fun lt!411323 () List!18337)

(assert (=> d!112593 (= lt!411324 (ListLongMap!11248 lt!411323))))

(declare-fun lt!411326 () Unit!30934)

(declare-fun lt!411325 () Unit!30934)

(assert (=> d!112593 (= lt!411326 lt!411325)))

(assert (=> d!112593 (= (getValueByKey!476 lt!411323 (_1!6286 (tuple2!12551 lt!411206 zeroValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411206 zeroValue!1094))))))

(assert (=> d!112593 (= lt!411325 (lemmaContainsTupThenGetReturnValue!253 lt!411323 (_1!6286 (tuple2!12551 lt!411206 zeroValue!1094)) (_2!6286 (tuple2!12551 lt!411206 zeroValue!1094))))))

(assert (=> d!112593 (= lt!411323 (insertStrictlySorted!310 (toList!5639 lt!411196) (_1!6286 (tuple2!12551 lt!411206 zeroValue!1094)) (_2!6286 (tuple2!12551 lt!411206 zeroValue!1094))))))

(assert (=> d!112593 (= (+!2609 lt!411196 (tuple2!12551 lt!411206 zeroValue!1094)) lt!411324)))

(declare-fun b!914100 () Bool)

(declare-fun res!616478 () Bool)

(assert (=> b!914100 (=> (not res!616478) (not e!512775))))

(assert (=> b!914100 (= res!616478 (= (getValueByKey!476 (toList!5639 lt!411324) (_1!6286 (tuple2!12551 lt!411206 zeroValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411206 zeroValue!1094)))))))

(declare-fun b!914101 () Bool)

(assert (=> b!914101 (= e!512775 (contains!4689 (toList!5639 lt!411324) (tuple2!12551 lt!411206 zeroValue!1094)))))

(assert (= (and d!112593 res!616477) b!914100))

(assert (= (and b!914100 res!616478) b!914101))

(declare-fun m!848741 () Bool)

(assert (=> d!112593 m!848741))

(declare-fun m!848743 () Bool)

(assert (=> d!112593 m!848743))

(declare-fun m!848745 () Bool)

(assert (=> d!112593 m!848745))

(declare-fun m!848747 () Bool)

(assert (=> d!112593 m!848747))

(declare-fun m!848749 () Bool)

(assert (=> b!914100 m!848749))

(declare-fun m!848751 () Bool)

(assert (=> b!914101 m!848751))

(assert (=> b!913938 d!112593))

(assert (=> b!913938 d!112527))

(declare-fun d!112595 () Bool)

(assert (=> d!112595 (= (apply!518 lt!411196 lt!411194) (get!13707 (getValueByKey!476 (toList!5639 lt!411196) lt!411194)))))

(declare-fun bs!25724 () Bool)

(assert (= bs!25724 d!112595))

(declare-fun m!848753 () Bool)

(assert (=> bs!25724 m!848753))

(assert (=> bs!25724 m!848753))

(declare-fun m!848755 () Bool)

(assert (=> bs!25724 m!848755))

(assert (=> b!913938 d!112595))

(declare-fun d!112597 () Bool)

(assert (=> d!112597 (contains!4687 (+!2609 lt!411204 (tuple2!12551 lt!411195 zeroValue!1094)) lt!411210)))

(declare-fun lt!411327 () Unit!30934)

(assert (=> d!112597 (= lt!411327 (choose!1537 lt!411204 lt!411195 zeroValue!1094 lt!411210))))

(assert (=> d!112597 (contains!4687 lt!411204 lt!411210)))

(assert (=> d!112597 (= (addStillContains!350 lt!411204 lt!411195 zeroValue!1094 lt!411210) lt!411327)))

(declare-fun bs!25725 () Bool)

(assert (= bs!25725 d!112597))

(assert (=> bs!25725 m!848427))

(assert (=> bs!25725 m!848427))

(assert (=> bs!25725 m!848429))

(declare-fun m!848757 () Bool)

(assert (=> bs!25725 m!848757))

(declare-fun m!848759 () Bool)

(assert (=> bs!25725 m!848759))

(assert (=> b!913938 d!112597))

(declare-fun d!112599 () Bool)

(declare-fun e!512776 () Bool)

(assert (=> d!112599 e!512776))

(declare-fun res!616479 () Bool)

(assert (=> d!112599 (=> (not res!616479) (not e!512776))))

(declare-fun lt!411329 () ListLongMap!11247)

(assert (=> d!112599 (= res!616479 (contains!4687 lt!411329 (_1!6286 (tuple2!12551 lt!411205 minValue!1094))))))

(declare-fun lt!411328 () List!18337)

(assert (=> d!112599 (= lt!411329 (ListLongMap!11248 lt!411328))))

(declare-fun lt!411331 () Unit!30934)

(declare-fun lt!411330 () Unit!30934)

(assert (=> d!112599 (= lt!411331 lt!411330)))

(assert (=> d!112599 (= (getValueByKey!476 lt!411328 (_1!6286 (tuple2!12551 lt!411205 minValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411205 minValue!1094))))))

(assert (=> d!112599 (= lt!411330 (lemmaContainsTupThenGetReturnValue!253 lt!411328 (_1!6286 (tuple2!12551 lt!411205 minValue!1094)) (_2!6286 (tuple2!12551 lt!411205 minValue!1094))))))

(assert (=> d!112599 (= lt!411328 (insertStrictlySorted!310 (toList!5639 lt!411212) (_1!6286 (tuple2!12551 lt!411205 minValue!1094)) (_2!6286 (tuple2!12551 lt!411205 minValue!1094))))))

(assert (=> d!112599 (= (+!2609 lt!411212 (tuple2!12551 lt!411205 minValue!1094)) lt!411329)))

(declare-fun b!914102 () Bool)

(declare-fun res!616480 () Bool)

(assert (=> b!914102 (=> (not res!616480) (not e!512776))))

(assert (=> b!914102 (= res!616480 (= (getValueByKey!476 (toList!5639 lt!411329) (_1!6286 (tuple2!12551 lt!411205 minValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411205 minValue!1094)))))))

(declare-fun b!914103 () Bool)

(assert (=> b!914103 (= e!512776 (contains!4689 (toList!5639 lt!411329) (tuple2!12551 lt!411205 minValue!1094)))))

(assert (= (and d!112599 res!616479) b!914102))

(assert (= (and b!914102 res!616480) b!914103))

(declare-fun m!848761 () Bool)

(assert (=> d!112599 m!848761))

(declare-fun m!848763 () Bool)

(assert (=> d!112599 m!848763))

(declare-fun m!848765 () Bool)

(assert (=> d!112599 m!848765))

(declare-fun m!848767 () Bool)

(assert (=> d!112599 m!848767))

(declare-fun m!848769 () Bool)

(assert (=> b!914102 m!848769))

(declare-fun m!848771 () Bool)

(assert (=> b!914103 m!848771))

(assert (=> b!913938 d!112599))

(declare-fun d!112601 () Bool)

(declare-fun e!512777 () Bool)

(assert (=> d!112601 e!512777))

(declare-fun res!616481 () Bool)

(assert (=> d!112601 (=> (not res!616481) (not e!512777))))

(declare-fun lt!411333 () ListLongMap!11247)

(assert (=> d!112601 (= res!616481 (contains!4687 lt!411333 (_1!6286 (tuple2!12551 lt!411211 minValue!1094))))))

(declare-fun lt!411332 () List!18337)

(assert (=> d!112601 (= lt!411333 (ListLongMap!11248 lt!411332))))

(declare-fun lt!411335 () Unit!30934)

(declare-fun lt!411334 () Unit!30934)

(assert (=> d!112601 (= lt!411335 lt!411334)))

(assert (=> d!112601 (= (getValueByKey!476 lt!411332 (_1!6286 (tuple2!12551 lt!411211 minValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411211 minValue!1094))))))

(assert (=> d!112601 (= lt!411334 (lemmaContainsTupThenGetReturnValue!253 lt!411332 (_1!6286 (tuple2!12551 lt!411211 minValue!1094)) (_2!6286 (tuple2!12551 lt!411211 minValue!1094))))))

(assert (=> d!112601 (= lt!411332 (insertStrictlySorted!310 (toList!5639 lt!411213) (_1!6286 (tuple2!12551 lt!411211 minValue!1094)) (_2!6286 (tuple2!12551 lt!411211 minValue!1094))))))

(assert (=> d!112601 (= (+!2609 lt!411213 (tuple2!12551 lt!411211 minValue!1094)) lt!411333)))

(declare-fun b!914104 () Bool)

(declare-fun res!616482 () Bool)

(assert (=> b!914104 (=> (not res!616482) (not e!512777))))

(assert (=> b!914104 (= res!616482 (= (getValueByKey!476 (toList!5639 lt!411333) (_1!6286 (tuple2!12551 lt!411211 minValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411211 minValue!1094)))))))

(declare-fun b!914105 () Bool)

(assert (=> b!914105 (= e!512777 (contains!4689 (toList!5639 lt!411333) (tuple2!12551 lt!411211 minValue!1094)))))

(assert (= (and d!112601 res!616481) b!914104))

(assert (= (and b!914104 res!616482) b!914105))

(declare-fun m!848773 () Bool)

(assert (=> d!112601 m!848773))

(declare-fun m!848775 () Bool)

(assert (=> d!112601 m!848775))

(declare-fun m!848777 () Bool)

(assert (=> d!112601 m!848777))

(declare-fun m!848779 () Bool)

(assert (=> d!112601 m!848779))

(declare-fun m!848781 () Bool)

(assert (=> b!914104 m!848781))

(declare-fun m!848783 () Bool)

(assert (=> b!914105 m!848783))

(assert (=> b!913938 d!112601))

(declare-fun d!112603 () Bool)

(assert (=> d!112603 (= (apply!518 (+!2609 lt!411196 (tuple2!12551 lt!411206 zeroValue!1094)) lt!411194) (get!13707 (getValueByKey!476 (toList!5639 (+!2609 lt!411196 (tuple2!12551 lt!411206 zeroValue!1094))) lt!411194)))))

(declare-fun bs!25726 () Bool)

(assert (= bs!25726 d!112603))

(declare-fun m!848785 () Bool)

(assert (=> bs!25726 m!848785))

(assert (=> bs!25726 m!848785))

(declare-fun m!848787 () Bool)

(assert (=> bs!25726 m!848787))

(assert (=> b!913938 d!112603))

(declare-fun d!112605 () Bool)

(assert (=> d!112605 (= (apply!518 (+!2609 lt!411213 (tuple2!12551 lt!411211 minValue!1094)) lt!411203) (apply!518 lt!411213 lt!411203))))

(declare-fun lt!411336 () Unit!30934)

(assert (=> d!112605 (= lt!411336 (choose!1536 lt!411213 lt!411211 minValue!1094 lt!411203))))

(declare-fun e!512778 () Bool)

(assert (=> d!112605 e!512778))

(declare-fun res!616483 () Bool)

(assert (=> d!112605 (=> (not res!616483) (not e!512778))))

(assert (=> d!112605 (= res!616483 (contains!4687 lt!411213 lt!411203))))

(assert (=> d!112605 (= (addApplyDifferent!350 lt!411213 lt!411211 minValue!1094 lt!411203) lt!411336)))

(declare-fun b!914106 () Bool)

(assert (=> b!914106 (= e!512778 (not (= lt!411203 lt!411211)))))

(assert (= (and d!112605 res!616483) b!914106))

(assert (=> d!112605 m!848443))

(declare-fun m!848789 () Bool)

(assert (=> d!112605 m!848789))

(assert (=> d!112605 m!848437))

(declare-fun m!848791 () Bool)

(assert (=> d!112605 m!848791))

(assert (=> d!112605 m!848443))

(assert (=> d!112605 m!848447))

(assert (=> b!913938 d!112605))

(declare-fun d!112607 () Bool)

(declare-fun e!512780 () Bool)

(assert (=> d!112607 e!512780))

(declare-fun res!616484 () Bool)

(assert (=> d!112607 (=> res!616484 e!512780)))

(declare-fun lt!411337 () Bool)

(assert (=> d!112607 (= res!616484 (not lt!411337))))

(declare-fun lt!411338 () Bool)

(assert (=> d!112607 (= lt!411337 lt!411338)))

(declare-fun lt!411340 () Unit!30934)

(declare-fun e!512779 () Unit!30934)

(assert (=> d!112607 (= lt!411340 e!512779)))

(declare-fun c!95984 () Bool)

(assert (=> d!112607 (= c!95984 lt!411338)))

(assert (=> d!112607 (= lt!411338 (containsKey!443 (toList!5639 (+!2609 lt!411204 (tuple2!12551 lt!411195 zeroValue!1094))) lt!411210))))

(assert (=> d!112607 (= (contains!4687 (+!2609 lt!411204 (tuple2!12551 lt!411195 zeroValue!1094)) lt!411210) lt!411337)))

(declare-fun b!914107 () Bool)

(declare-fun lt!411339 () Unit!30934)

(assert (=> b!914107 (= e!512779 lt!411339)))

(assert (=> b!914107 (= lt!411339 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5639 (+!2609 lt!411204 (tuple2!12551 lt!411195 zeroValue!1094))) lt!411210))))

(assert (=> b!914107 (isDefined!348 (getValueByKey!476 (toList!5639 (+!2609 lt!411204 (tuple2!12551 lt!411195 zeroValue!1094))) lt!411210))))

(declare-fun b!914108 () Bool)

(declare-fun Unit!30942 () Unit!30934)

(assert (=> b!914108 (= e!512779 Unit!30942)))

(declare-fun b!914109 () Bool)

(assert (=> b!914109 (= e!512780 (isDefined!348 (getValueByKey!476 (toList!5639 (+!2609 lt!411204 (tuple2!12551 lt!411195 zeroValue!1094))) lt!411210)))))

(assert (= (and d!112607 c!95984) b!914107))

(assert (= (and d!112607 (not c!95984)) b!914108))

(assert (= (and d!112607 (not res!616484)) b!914109))

(declare-fun m!848793 () Bool)

(assert (=> d!112607 m!848793))

(declare-fun m!848795 () Bool)

(assert (=> b!914107 m!848795))

(declare-fun m!848797 () Bool)

(assert (=> b!914107 m!848797))

(assert (=> b!914107 m!848797))

(declare-fun m!848799 () Bool)

(assert (=> b!914107 m!848799))

(assert (=> b!914109 m!848797))

(assert (=> b!914109 m!848797))

(assert (=> b!914109 m!848799))

(assert (=> b!913938 d!112607))

(declare-fun d!112609 () Bool)

(assert (=> d!112609 (= (apply!518 lt!411212 lt!411202) (get!13707 (getValueByKey!476 (toList!5639 lt!411212) lt!411202)))))

(declare-fun bs!25727 () Bool)

(assert (= bs!25727 d!112609))

(declare-fun m!848801 () Bool)

(assert (=> bs!25727 m!848801))

(assert (=> bs!25727 m!848801))

(declare-fun m!848803 () Bool)

(assert (=> bs!25727 m!848803))

(assert (=> b!913938 d!112609))

(declare-fun d!112611 () Bool)

(assert (=> d!112611 (= (apply!518 (+!2609 lt!411212 (tuple2!12551 lt!411205 minValue!1094)) lt!411202) (apply!518 lt!411212 lt!411202))))

(declare-fun lt!411341 () Unit!30934)

(assert (=> d!112611 (= lt!411341 (choose!1536 lt!411212 lt!411205 minValue!1094 lt!411202))))

(declare-fun e!512781 () Bool)

(assert (=> d!112611 e!512781))

(declare-fun res!616485 () Bool)

(assert (=> d!112611 (=> (not res!616485) (not e!512781))))

(assert (=> d!112611 (= res!616485 (contains!4687 lt!411212 lt!411202))))

(assert (=> d!112611 (= (addApplyDifferent!350 lt!411212 lt!411205 minValue!1094 lt!411202) lt!411341)))

(declare-fun b!914110 () Bool)

(assert (=> b!914110 (= e!512781 (not (= lt!411202 lt!411205)))))

(assert (= (and d!112611 res!616485) b!914110))

(assert (=> d!112611 m!848431))

(declare-fun m!848805 () Bool)

(assert (=> d!112611 m!848805))

(assert (=> d!112611 m!848421))

(declare-fun m!848807 () Bool)

(assert (=> d!112611 m!848807))

(assert (=> d!112611 m!848431))

(assert (=> d!112611 m!848445))

(assert (=> b!913938 d!112611))

(declare-fun d!112613 () Bool)

(assert (=> d!112613 (= (apply!518 lt!411213 lt!411203) (get!13707 (getValueByKey!476 (toList!5639 lt!411213) lt!411203)))))

(declare-fun bs!25728 () Bool)

(assert (= bs!25728 d!112613))

(declare-fun m!848809 () Bool)

(assert (=> bs!25728 m!848809))

(assert (=> bs!25728 m!848809))

(declare-fun m!848811 () Bool)

(assert (=> bs!25728 m!848811))

(assert (=> b!913938 d!112613))

(declare-fun d!112615 () Bool)

(assert (=> d!112615 (= (apply!518 (+!2609 lt!411213 (tuple2!12551 lt!411211 minValue!1094)) lt!411203) (get!13707 (getValueByKey!476 (toList!5639 (+!2609 lt!411213 (tuple2!12551 lt!411211 minValue!1094))) lt!411203)))))

(declare-fun bs!25729 () Bool)

(assert (= bs!25729 d!112615))

(declare-fun m!848813 () Bool)

(assert (=> bs!25729 m!848813))

(assert (=> bs!25729 m!848813))

(declare-fun m!848815 () Bool)

(assert (=> bs!25729 m!848815))

(assert (=> b!913938 d!112615))

(declare-fun d!112617 () Bool)

(assert (=> d!112617 (= (apply!518 (+!2609 lt!411212 (tuple2!12551 lt!411205 minValue!1094)) lt!411202) (get!13707 (getValueByKey!476 (toList!5639 (+!2609 lt!411212 (tuple2!12551 lt!411205 minValue!1094))) lt!411202)))))

(declare-fun bs!25730 () Bool)

(assert (= bs!25730 d!112617))

(declare-fun m!848817 () Bool)

(assert (=> bs!25730 m!848817))

(assert (=> bs!25730 m!848817))

(declare-fun m!848819 () Bool)

(assert (=> bs!25730 m!848819))

(assert (=> b!913938 d!112617))

(declare-fun d!112619 () Bool)

(declare-fun e!512782 () Bool)

(assert (=> d!112619 e!512782))

(declare-fun res!616486 () Bool)

(assert (=> d!112619 (=> (not res!616486) (not e!512782))))

(declare-fun lt!411343 () ListLongMap!11247)

(assert (=> d!112619 (= res!616486 (contains!4687 lt!411343 (_1!6286 (tuple2!12551 lt!411195 zeroValue!1094))))))

(declare-fun lt!411342 () List!18337)

(assert (=> d!112619 (= lt!411343 (ListLongMap!11248 lt!411342))))

(declare-fun lt!411345 () Unit!30934)

(declare-fun lt!411344 () Unit!30934)

(assert (=> d!112619 (= lt!411345 lt!411344)))

(assert (=> d!112619 (= (getValueByKey!476 lt!411342 (_1!6286 (tuple2!12551 lt!411195 zeroValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411195 zeroValue!1094))))))

(assert (=> d!112619 (= lt!411344 (lemmaContainsTupThenGetReturnValue!253 lt!411342 (_1!6286 (tuple2!12551 lt!411195 zeroValue!1094)) (_2!6286 (tuple2!12551 lt!411195 zeroValue!1094))))))

(assert (=> d!112619 (= lt!411342 (insertStrictlySorted!310 (toList!5639 lt!411204) (_1!6286 (tuple2!12551 lt!411195 zeroValue!1094)) (_2!6286 (tuple2!12551 lt!411195 zeroValue!1094))))))

(assert (=> d!112619 (= (+!2609 lt!411204 (tuple2!12551 lt!411195 zeroValue!1094)) lt!411343)))

(declare-fun b!914111 () Bool)

(declare-fun res!616487 () Bool)

(assert (=> b!914111 (=> (not res!616487) (not e!512782))))

(assert (=> b!914111 (= res!616487 (= (getValueByKey!476 (toList!5639 lt!411343) (_1!6286 (tuple2!12551 lt!411195 zeroValue!1094))) (Some!481 (_2!6286 (tuple2!12551 lt!411195 zeroValue!1094)))))))

(declare-fun b!914112 () Bool)

(assert (=> b!914112 (= e!512782 (contains!4689 (toList!5639 lt!411343) (tuple2!12551 lt!411195 zeroValue!1094)))))

(assert (= (and d!112619 res!616486) b!914111))

(assert (= (and b!914111 res!616487) b!914112))

(declare-fun m!848821 () Bool)

(assert (=> d!112619 m!848821))

(declare-fun m!848823 () Bool)

(assert (=> d!112619 m!848823))

(declare-fun m!848825 () Bool)

(assert (=> d!112619 m!848825))

(declare-fun m!848827 () Bool)

(assert (=> d!112619 m!848827))

(declare-fun m!848829 () Bool)

(assert (=> b!914111 m!848829))

(declare-fun m!848831 () Bool)

(assert (=> b!914112 m!848831))

(assert (=> b!913938 d!112619))

(declare-fun d!112621 () Bool)

(assert (=> d!112621 (= (apply!518 (+!2609 lt!411196 (tuple2!12551 lt!411206 zeroValue!1094)) lt!411194) (apply!518 lt!411196 lt!411194))))

(declare-fun lt!411346 () Unit!30934)

(assert (=> d!112621 (= lt!411346 (choose!1536 lt!411196 lt!411206 zeroValue!1094 lt!411194))))

(declare-fun e!512783 () Bool)

(assert (=> d!112621 e!512783))

(declare-fun res!616488 () Bool)

(assert (=> d!112621 (=> (not res!616488) (not e!512783))))

(assert (=> d!112621 (= res!616488 (contains!4687 lt!411196 lt!411194))))

(assert (=> d!112621 (= (addApplyDifferent!350 lt!411196 lt!411206 zeroValue!1094 lt!411194) lt!411346)))

(declare-fun b!914113 () Bool)

(assert (=> b!914113 (= e!512783 (not (= lt!411194 lt!411206)))))

(assert (= (and d!112621 res!616488) b!914113))

(assert (=> d!112621 m!848425))

(declare-fun m!848833 () Bool)

(assert (=> d!112621 m!848833))

(assert (=> d!112621 m!848441))

(declare-fun m!848835 () Bool)

(assert (=> d!112621 m!848835))

(assert (=> d!112621 m!848425))

(assert (=> d!112621 m!848435))

(assert (=> b!913938 d!112621))

(declare-fun d!112623 () Bool)

(assert (=> d!112623 (= (apply!518 lt!411198 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13707 (getValueByKey!476 (toList!5639 lt!411198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25731 () Bool)

(assert (= bs!25731 d!112623))

(declare-fun m!848837 () Bool)

(assert (=> bs!25731 m!848837))

(assert (=> bs!25731 m!848837))

(declare-fun m!848839 () Bool)

(assert (=> bs!25731 m!848839))

(assert (=> b!913937 d!112623))

(assert (=> d!112511 d!112521))

(declare-fun d!112625 () Bool)

(assert (=> d!112625 (isDefined!348 (getValueByKey!476 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun lt!411349 () Unit!30934)

(declare-fun choose!1538 (List!18337 (_ BitVec 64)) Unit!30934)

(assert (=> d!112625 (= lt!411349 (choose!1538 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun e!512786 () Bool)

(assert (=> d!112625 e!512786))

(declare-fun res!616491 () Bool)

(assert (=> d!112625 (=> (not res!616491) (not e!512786))))

(declare-fun isStrictlySorted!502 (List!18337) Bool)

(assert (=> d!112625 (= res!616491 (isStrictlySorted!502 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))))

(assert (=> d!112625 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) lt!411349)))

(declare-fun b!914116 () Bool)

(assert (=> b!914116 (= e!512786 (containsKey!443 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (= (and d!112625 res!616491) b!914116))

(assert (=> d!112625 m!848469))

(assert (=> d!112625 m!848469))

(assert (=> d!112625 m!848471))

(declare-fun m!848841 () Bool)

(assert (=> d!112625 m!848841))

(declare-fun m!848843 () Bool)

(assert (=> d!112625 m!848843))

(assert (=> b!914116 m!848465))

(assert (=> b!913960 d!112625))

(assert (=> b!913960 d!112589))

(assert (=> b!913960 d!112591))

(declare-fun d!112627 () Bool)

(declare-fun res!616496 () Bool)

(declare-fun e!512791 () Bool)

(assert (=> d!112627 (=> res!616496 e!512791)))

(assert (=> d!112627 (= res!616496 (and ((_ is Cons!18333) (toList!5639 lt!411118)) (= (_1!6286 (h!19479 (toList!5639 lt!411118))) k0!1033)))))

(assert (=> d!112627 (= (containsKey!443 (toList!5639 lt!411118) k0!1033) e!512791)))

(declare-fun b!914121 () Bool)

(declare-fun e!512792 () Bool)

(assert (=> b!914121 (= e!512791 e!512792)))

(declare-fun res!616497 () Bool)

(assert (=> b!914121 (=> (not res!616497) (not e!512792))))

(assert (=> b!914121 (= res!616497 (and (or (not ((_ is Cons!18333) (toList!5639 lt!411118))) (bvsle (_1!6286 (h!19479 (toList!5639 lt!411118))) k0!1033)) ((_ is Cons!18333) (toList!5639 lt!411118)) (bvslt (_1!6286 (h!19479 (toList!5639 lt!411118))) k0!1033)))))

(declare-fun b!914122 () Bool)

(assert (=> b!914122 (= e!512792 (containsKey!443 (t!25934 (toList!5639 lt!411118)) k0!1033))))

(assert (= (and d!112627 (not res!616496)) b!914121))

(assert (= (and b!914121 res!616497) b!914122))

(declare-fun m!848845 () Bool)

(assert (=> b!914122 m!848845))

(assert (=> d!112509 d!112627))

(assert (=> b!913970 d!112531))

(declare-fun d!112629 () Bool)

(assert (=> d!112629 (= (get!13709 (select (arr!26103 _values!1152) i!717) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913848 d!112629))

(declare-fun d!112631 () Bool)

(assert (=> d!112631 (= (get!13708 (select (arr!26103 _values!1152) i!717) (dynLambda!1394 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!12142 (select (arr!26103 _values!1152) i!717)))))

(assert (=> b!913847 d!112631))

(declare-fun d!112633 () Bool)

(declare-fun e!512794 () Bool)

(assert (=> d!112633 e!512794))

(declare-fun res!616498 () Bool)

(assert (=> d!112633 (=> res!616498 e!512794)))

(declare-fun lt!411350 () Bool)

(assert (=> d!112633 (= res!616498 (not lt!411350))))

(declare-fun lt!411351 () Bool)

(assert (=> d!112633 (= lt!411350 lt!411351)))

(declare-fun lt!411353 () Unit!30934)

(declare-fun e!512793 () Unit!30934)

(assert (=> d!112633 (= lt!411353 e!512793)))

(declare-fun c!95985 () Bool)

(assert (=> d!112633 (= c!95985 lt!411351)))

(assert (=> d!112633 (= lt!411351 (containsKey!443 (toList!5639 lt!411224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112633 (= (contains!4687 lt!411224 #b1000000000000000000000000000000000000000000000000000000000000000) lt!411350)))

(declare-fun b!914123 () Bool)

(declare-fun lt!411352 () Unit!30934)

(assert (=> b!914123 (= e!512793 lt!411352)))

(assert (=> b!914123 (= lt!411352 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5639 lt!411224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914123 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914124 () Bool)

(declare-fun Unit!30943 () Unit!30934)

(assert (=> b!914124 (= e!512793 Unit!30943)))

(declare-fun b!914125 () Bool)

(assert (=> b!914125 (= e!512794 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112633 c!95985) b!914123))

(assert (= (and d!112633 (not c!95985)) b!914124))

(assert (= (and d!112633 (not res!616498)) b!914125))

(declare-fun m!848847 () Bool)

(assert (=> d!112633 m!848847))

(declare-fun m!848849 () Bool)

(assert (=> b!914123 m!848849))

(assert (=> b!914123 m!848733))

(assert (=> b!914123 m!848733))

(declare-fun m!848851 () Bool)

(assert (=> b!914123 m!848851))

(assert (=> b!914125 m!848733))

(assert (=> b!914125 m!848733))

(assert (=> b!914125 m!848851))

(assert (=> bm!40489 d!112633))

(declare-fun d!112635 () Bool)

(declare-fun e!512796 () Bool)

(assert (=> d!112635 e!512796))

(declare-fun res!616499 () Bool)

(assert (=> d!112635 (=> res!616499 e!512796)))

(declare-fun lt!411354 () Bool)

(assert (=> d!112635 (= res!616499 (not lt!411354))))

(declare-fun lt!411355 () Bool)

(assert (=> d!112635 (= lt!411354 lt!411355)))

(declare-fun lt!411357 () Unit!30934)

(declare-fun e!512795 () Unit!30934)

(assert (=> d!112635 (= lt!411357 e!512795)))

(declare-fun c!95986 () Bool)

(assert (=> d!112635 (= c!95986 lt!411355)))

(assert (=> d!112635 (= lt!411355 (containsKey!443 (toList!5639 lt!411224) (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> d!112635 (= (contains!4687 lt!411224 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)) lt!411354)))

(declare-fun b!914126 () Bool)

(declare-fun lt!411356 () Unit!30934)

(assert (=> b!914126 (= e!512795 lt!411356)))

(assert (=> b!914126 (= lt!411356 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5639 lt!411224) (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!914126 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411224) (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914127 () Bool)

(declare-fun Unit!30944 () Unit!30934)

(assert (=> b!914127 (= e!512795 Unit!30944)))

(declare-fun b!914128 () Bool)

(assert (=> b!914128 (= e!512796 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411224) (select (arr!26104 _keys!1386) #b00000000000000000000000000000000))))))

(assert (= (and d!112635 c!95986) b!914126))

(assert (= (and d!112635 (not c!95986)) b!914127))

(assert (= (and d!112635 (not res!616499)) b!914128))

(assert (=> d!112635 m!848391))

(declare-fun m!848853 () Bool)

(assert (=> d!112635 m!848853))

(assert (=> b!914126 m!848391))

(declare-fun m!848855 () Bool)

(assert (=> b!914126 m!848855))

(assert (=> b!914126 m!848391))

(assert (=> b!914126 m!848703))

(assert (=> b!914126 m!848703))

(declare-fun m!848857 () Bool)

(assert (=> b!914126 m!848857))

(assert (=> b!914128 m!848391))

(assert (=> b!914128 m!848703))

(assert (=> b!914128 m!848703))

(assert (=> b!914128 m!848857))

(assert (=> b!913969 d!112635))

(assert (=> b!913931 d!112537))

(declare-fun d!112637 () Bool)

(declare-fun e!512797 () Bool)

(assert (=> d!112637 e!512797))

(declare-fun res!616500 () Bool)

(assert (=> d!112637 (=> (not res!616500) (not e!512797))))

(declare-fun lt!411359 () ListLongMap!11247)

(assert (=> d!112637 (= res!616500 (contains!4687 lt!411359 (_1!6286 (ite (or c!95954 c!95953) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lt!411358 () List!18337)

(assert (=> d!112637 (= lt!411359 (ListLongMap!11248 lt!411358))))

(declare-fun lt!411361 () Unit!30934)

(declare-fun lt!411360 () Unit!30934)

(assert (=> d!112637 (= lt!411361 lt!411360)))

(assert (=> d!112637 (= (getValueByKey!476 lt!411358 (_1!6286 (ite (or c!95954 c!95953) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!481 (_2!6286 (ite (or c!95954 c!95953) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112637 (= lt!411360 (lemmaContainsTupThenGetReturnValue!253 lt!411358 (_1!6286 (ite (or c!95954 c!95953) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6286 (ite (or c!95954 c!95953) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112637 (= lt!411358 (insertStrictlySorted!310 (toList!5639 (ite c!95954 call!40492 (ite c!95953 call!40490 call!40494))) (_1!6286 (ite (or c!95954 c!95953) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6286 (ite (or c!95954 c!95953) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112637 (= (+!2609 (ite c!95954 call!40492 (ite c!95953 call!40490 call!40494)) (ite (or c!95954 c!95953) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) lt!411359)))

(declare-fun b!914129 () Bool)

(declare-fun res!616501 () Bool)

(assert (=> b!914129 (=> (not res!616501) (not e!512797))))

(assert (=> b!914129 (= res!616501 (= (getValueByKey!476 (toList!5639 lt!411359) (_1!6286 (ite (or c!95954 c!95953) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!481 (_2!6286 (ite (or c!95954 c!95953) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))))

(declare-fun b!914130 () Bool)

(assert (=> b!914130 (= e!512797 (contains!4689 (toList!5639 lt!411359) (ite (or c!95954 c!95953) (tuple2!12551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112637 res!616500) b!914129))

(assert (= (and b!914129 res!616501) b!914130))

(declare-fun m!848859 () Bool)

(assert (=> d!112637 m!848859))

(declare-fun m!848861 () Bool)

(assert (=> d!112637 m!848861))

(declare-fun m!848863 () Bool)

(assert (=> d!112637 m!848863))

(declare-fun m!848865 () Bool)

(assert (=> d!112637 m!848865))

(declare-fun m!848867 () Bool)

(assert (=> b!914129 m!848867))

(declare-fun m!848869 () Bool)

(assert (=> b!914130 m!848869))

(assert (=> bm!40488 d!112637))

(assert (=> d!112517 d!112521))

(assert (=> b!913871 d!112505))

(declare-fun d!112639 () Bool)

(declare-fun res!616502 () Bool)

(declare-fun e!512798 () Bool)

(assert (=> d!112639 (=> res!616502 e!512798)))

(assert (=> d!112639 (= res!616502 (and ((_ is Cons!18333) (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (= (_1!6286 (h!19479 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112639 (= (containsKey!443 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) e!512798)))

(declare-fun b!914131 () Bool)

(declare-fun e!512799 () Bool)

(assert (=> b!914131 (= e!512798 e!512799)))

(declare-fun res!616503 () Bool)

(assert (=> b!914131 (=> (not res!616503) (not e!512799))))

(assert (=> b!914131 (= res!616503 (and (or (not ((_ is Cons!18333) (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) (bvsle (_1!6286 (h!19479 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)) ((_ is Cons!18333) (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (bvslt (_1!6286 (h!19479 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(declare-fun b!914132 () Bool)

(assert (=> b!914132 (= e!512799 (containsKey!443 (t!25934 (toList!5639 (getCurrentListMap!2900 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) k0!1033))))

(assert (= (and d!112639 (not res!616502)) b!914131))

(assert (= (and b!914131 res!616503) b!914132))

(declare-fun m!848871 () Bool)

(assert (=> b!914132 m!848871))

(assert (=> d!112515 d!112639))

(declare-fun d!112641 () Bool)

(declare-fun e!512801 () Bool)

(assert (=> d!112641 e!512801))

(declare-fun res!616504 () Bool)

(assert (=> d!112641 (=> res!616504 e!512801)))

(declare-fun lt!411362 () Bool)

(assert (=> d!112641 (= res!616504 (not lt!411362))))

(declare-fun lt!411363 () Bool)

(assert (=> d!112641 (= lt!411362 lt!411363)))

(declare-fun lt!411365 () Unit!30934)

(declare-fun e!512800 () Unit!30934)

(assert (=> d!112641 (= lt!411365 e!512800)))

(declare-fun c!95987 () Bool)

(assert (=> d!112641 (= c!95987 lt!411363)))

(assert (=> d!112641 (= lt!411363 (containsKey!443 (toList!5639 lt!411198) (select (arr!26104 _keys!1386) i!717)))))

(assert (=> d!112641 (= (contains!4687 lt!411198 (select (arr!26104 _keys!1386) i!717)) lt!411362)))

(declare-fun b!914133 () Bool)

(declare-fun lt!411364 () Unit!30934)

(assert (=> b!914133 (= e!512800 lt!411364)))

(assert (=> b!914133 (= lt!411364 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5639 lt!411198) (select (arr!26104 _keys!1386) i!717)))))

(assert (=> b!914133 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411198) (select (arr!26104 _keys!1386) i!717)))))

(declare-fun b!914134 () Bool)

(declare-fun Unit!30945 () Unit!30934)

(assert (=> b!914134 (= e!512800 Unit!30945)))

(declare-fun b!914135 () Bool)

(assert (=> b!914135 (= e!512801 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411198) (select (arr!26104 _keys!1386) i!717))))))

(assert (= (and d!112641 c!95987) b!914133))

(assert (= (and d!112641 (not c!95987)) b!914134))

(assert (= (and d!112641 (not res!616504)) b!914135))

(assert (=> d!112641 m!848311))

(declare-fun m!848873 () Bool)

(assert (=> d!112641 m!848873))

(assert (=> b!914133 m!848311))

(declare-fun m!848875 () Bool)

(assert (=> b!914133 m!848875))

(assert (=> b!914133 m!848311))

(assert (=> b!914133 m!848729))

(assert (=> b!914133 m!848729))

(declare-fun m!848877 () Bool)

(assert (=> b!914133 m!848877))

(assert (=> b!914135 m!848311))

(assert (=> b!914135 m!848729))

(assert (=> b!914135 m!848729))

(assert (=> b!914135 m!848877))

(assert (=> b!913930 d!112641))

(declare-fun d!112643 () Bool)

(assert (=> d!112643 (= (isDefined!348 (getValueByKey!476 (toList!5639 lt!411118) k0!1033)) (not (isEmpty!695 (getValueByKey!476 (toList!5639 lt!411118) k0!1033))))))

(declare-fun bs!25732 () Bool)

(assert (= bs!25732 d!112643))

(assert (=> bs!25732 m!848381))

(declare-fun m!848879 () Bool)

(assert (=> bs!25732 m!848879))

(assert (=> b!913881 d!112643))

(declare-fun b!914136 () Bool)

(declare-fun e!512802 () Option!482)

(assert (=> b!914136 (= e!512802 (Some!481 (_2!6286 (h!19479 (toList!5639 lt!411118)))))))

(declare-fun b!914139 () Bool)

(declare-fun e!512803 () Option!482)

(assert (=> b!914139 (= e!512803 None!480)))

(declare-fun b!914137 () Bool)

(assert (=> b!914137 (= e!512802 e!512803)))

(declare-fun c!95989 () Bool)

(assert (=> b!914137 (= c!95989 (and ((_ is Cons!18333) (toList!5639 lt!411118)) (not (= (_1!6286 (h!19479 (toList!5639 lt!411118))) k0!1033))))))

(declare-fun b!914138 () Bool)

(assert (=> b!914138 (= e!512803 (getValueByKey!476 (t!25934 (toList!5639 lt!411118)) k0!1033))))

(declare-fun d!112645 () Bool)

(declare-fun c!95988 () Bool)

(assert (=> d!112645 (= c!95988 (and ((_ is Cons!18333) (toList!5639 lt!411118)) (= (_1!6286 (h!19479 (toList!5639 lt!411118))) k0!1033)))))

(assert (=> d!112645 (= (getValueByKey!476 (toList!5639 lt!411118) k0!1033) e!512802)))

(assert (= (and d!112645 c!95988) b!914136))

(assert (= (and d!112645 (not c!95988)) b!914137))

(assert (= (and b!914137 c!95989) b!914138))

(assert (= (and b!914137 (not c!95989)) b!914139))

(declare-fun m!848881 () Bool)

(assert (=> b!914138 m!848881))

(assert (=> b!913881 d!112645))

(assert (=> bm!40492 d!112553))

(declare-fun d!112647 () Bool)

(assert (=> d!112647 (= (get!13707 (getValueByKey!476 (toList!5639 lt!411118) k0!1033)) (v!12144 (getValueByKey!476 (toList!5639 lt!411118) k0!1033)))))

(assert (=> d!112499 d!112647))

(assert (=> d!112499 d!112645))

(declare-fun d!112649 () Bool)

(declare-fun e!512805 () Bool)

(assert (=> d!112649 e!512805))

(declare-fun res!616505 () Bool)

(assert (=> d!112649 (=> res!616505 e!512805)))

(declare-fun lt!411366 () Bool)

(assert (=> d!112649 (= res!616505 (not lt!411366))))

(declare-fun lt!411367 () Bool)

(assert (=> d!112649 (= lt!411366 lt!411367)))

(declare-fun lt!411369 () Unit!30934)

(declare-fun e!512804 () Unit!30934)

(assert (=> d!112649 (= lt!411369 e!512804)))

(declare-fun c!95990 () Bool)

(assert (=> d!112649 (= c!95990 lt!411367)))

(assert (=> d!112649 (= lt!411367 (containsKey!443 (toList!5639 lt!411198) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112649 (= (contains!4687 lt!411198 #b1000000000000000000000000000000000000000000000000000000000000000) lt!411366)))

(declare-fun b!914140 () Bool)

(declare-fun lt!411368 () Unit!30934)

(assert (=> b!914140 (= e!512804 lt!411368)))

(assert (=> b!914140 (= lt!411368 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5639 lt!411198) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914140 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411198) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914141 () Bool)

(declare-fun Unit!30946 () Unit!30934)

(assert (=> b!914141 (= e!512804 Unit!30946)))

(declare-fun b!914142 () Bool)

(assert (=> b!914142 (= e!512805 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112649 c!95990) b!914140))

(assert (= (and d!112649 (not c!95990)) b!914141))

(assert (= (and d!112649 (not res!616505)) b!914142))

(declare-fun m!848883 () Bool)

(assert (=> d!112649 m!848883))

(declare-fun m!848885 () Bool)

(assert (=> b!914140 m!848885))

(assert (=> b!914140 m!848837))

(assert (=> b!914140 m!848837))

(declare-fun m!848887 () Bool)

(assert (=> b!914140 m!848887))

(assert (=> b!914142 m!848837))

(assert (=> b!914142 m!848837))

(assert (=> b!914142 m!848887))

(assert (=> bm!40479 d!112649))

(declare-fun d!112651 () Bool)

(assert (=> d!112651 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411118) k0!1033))))

(declare-fun lt!411370 () Unit!30934)

(assert (=> d!112651 (= lt!411370 (choose!1538 (toList!5639 lt!411118) k0!1033))))

(declare-fun e!512806 () Bool)

(assert (=> d!112651 e!512806))

(declare-fun res!616506 () Bool)

(assert (=> d!112651 (=> (not res!616506) (not e!512806))))

(assert (=> d!112651 (= res!616506 (isStrictlySorted!502 (toList!5639 lt!411118)))))

(assert (=> d!112651 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5639 lt!411118) k0!1033) lt!411370)))

(declare-fun b!914143 () Bool)

(assert (=> b!914143 (= e!512806 (containsKey!443 (toList!5639 lt!411118) k0!1033))))

(assert (= (and d!112651 res!616506) b!914143))

(assert (=> d!112651 m!848381))

(assert (=> d!112651 m!848381))

(assert (=> d!112651 m!848409))

(declare-fun m!848889 () Bool)

(assert (=> d!112651 m!848889))

(declare-fun m!848891 () Bool)

(assert (=> d!112651 m!848891))

(assert (=> b!914143 m!848405))

(assert (=> b!913879 d!112651))

(assert (=> b!913879 d!112643))

(assert (=> b!913879 d!112645))

(declare-fun d!112653 () Bool)

(declare-fun e!512809 () Bool)

(assert (=> d!112653 e!512809))

(declare-fun c!95993 () Bool)

(assert (=> d!112653 (= c!95993 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!112653 true))

(declare-fun _$15!98 () Unit!30934)

(assert (=> d!112653 (= (choose!1535 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) _$15!98)))

(declare-fun b!914148 () Bool)

(assert (=> b!914148 (= e!512809 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!914149 () Bool)

(assert (=> b!914149 (= e!512809 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112653 c!95993) b!914148))

(assert (= (and d!112653 (not c!95993)) b!914149))

(assert (=> b!914148 m!848323))

(assert (=> d!112507 d!112653))

(assert (=> d!112507 d!112521))

(declare-fun d!112655 () Bool)

(declare-fun e!512810 () Bool)

(assert (=> d!112655 e!512810))

(declare-fun res!616507 () Bool)

(assert (=> d!112655 (=> (not res!616507) (not e!512810))))

(declare-fun lt!411372 () ListLongMap!11247)

(assert (=> d!112655 (= res!616507 (contains!4687 lt!411372 (_1!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lt!411371 () List!18337)

(assert (=> d!112655 (= lt!411372 (ListLongMap!11248 lt!411371))))

(declare-fun lt!411374 () Unit!30934)

(declare-fun lt!411373 () Unit!30934)

(assert (=> d!112655 (= lt!411374 lt!411373)))

(assert (=> d!112655 (= (getValueByKey!476 lt!411371 (_1!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!481 (_2!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112655 (= lt!411373 (lemmaContainsTupThenGetReturnValue!253 lt!411371 (_1!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112655 (= lt!411371 (insertStrictlySorted!310 (toList!5639 call!40495) (_1!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112655 (= (+!2609 call!40495 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) lt!411372)))

(declare-fun b!914150 () Bool)

(declare-fun res!616508 () Bool)

(assert (=> b!914150 (=> (not res!616508) (not e!512810))))

(assert (=> b!914150 (= res!616508 (= (getValueByKey!476 (toList!5639 lt!411372) (_1!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!481 (_2!6286 (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun b!914151 () Bool)

(assert (=> b!914151 (= e!512810 (contains!4689 (toList!5639 lt!411372) (tuple2!12551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112655 res!616507) b!914150))

(assert (= (and b!914150 res!616508) b!914151))

(declare-fun m!848893 () Bool)

(assert (=> d!112655 m!848893))

(declare-fun m!848895 () Bool)

(assert (=> d!112655 m!848895))

(declare-fun m!848897 () Bool)

(assert (=> d!112655 m!848897))

(declare-fun m!848899 () Bool)

(assert (=> d!112655 m!848899))

(declare-fun m!848901 () Bool)

(assert (=> b!914150 m!848901))

(declare-fun m!848903 () Bool)

(assert (=> b!914151 m!848903))

(assert (=> b!913982 d!112655))

(declare-fun d!112657 () Bool)

(declare-fun e!512812 () Bool)

(assert (=> d!112657 e!512812))

(declare-fun res!616509 () Bool)

(assert (=> d!112657 (=> res!616509 e!512812)))

(declare-fun lt!411375 () Bool)

(assert (=> d!112657 (= res!616509 (not lt!411375))))

(declare-fun lt!411376 () Bool)

(assert (=> d!112657 (= lt!411375 lt!411376)))

(declare-fun lt!411378 () Unit!30934)

(declare-fun e!512811 () Unit!30934)

(assert (=> d!112657 (= lt!411378 e!512811)))

(declare-fun c!95994 () Bool)

(assert (=> d!112657 (= c!95994 lt!411376)))

(assert (=> d!112657 (= lt!411376 (containsKey!443 (toList!5639 lt!411224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112657 (= (contains!4687 lt!411224 #b0000000000000000000000000000000000000000000000000000000000000000) lt!411375)))

(declare-fun b!914152 () Bool)

(declare-fun lt!411377 () Unit!30934)

(assert (=> b!914152 (= e!512811 lt!411377)))

(assert (=> b!914152 (= lt!411377 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5639 lt!411224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914152 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914153 () Bool)

(declare-fun Unit!30947 () Unit!30934)

(assert (=> b!914153 (= e!512811 Unit!30947)))

(declare-fun b!914154 () Bool)

(assert (=> b!914154 (= e!512812 (isDefined!348 (getValueByKey!476 (toList!5639 lt!411224) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112657 c!95994) b!914152))

(assert (= (and d!112657 (not c!95994)) b!914153))

(assert (= (and d!112657 (not res!616509)) b!914154))

(declare-fun m!848905 () Bool)

(assert (=> d!112657 m!848905))

(declare-fun m!848907 () Bool)

(assert (=> b!914152 m!848907))

(declare-fun m!848909 () Bool)

(assert (=> b!914152 m!848909))

(assert (=> b!914152 m!848909))

(declare-fun m!848911 () Bool)

(assert (=> b!914152 m!848911))

(assert (=> b!914154 m!848909))

(assert (=> b!914154 m!848909))

(assert (=> b!914154 m!848911))

(assert (=> bm!40486 d!112657))

(declare-fun d!112659 () Bool)

(assert (=> d!112659 (= (apply!518 lt!411224 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13707 (getValueByKey!476 (toList!5639 lt!411224) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25733 () Bool)

(assert (= bs!25733 d!112659))

(assert (=> bs!25733 m!848909))

(assert (=> bs!25733 m!848909))

(declare-fun m!848913 () Bool)

(assert (=> bs!25733 m!848913))

(assert (=> b!913966 d!112659))

(declare-fun d!112661 () Bool)

(assert (=> d!112661 (arrayContainsKey!0 _keys!1386 lt!411133 #b00000000000000000000000000000000)))

(declare-fun lt!411381 () Unit!30934)

(declare-fun choose!13 (array!54304 (_ BitVec 64) (_ BitVec 32)) Unit!30934)

(assert (=> d!112661 (= lt!411381 (choose!13 _keys!1386 lt!411133 #b00000000000000000000000000000000))))

(assert (=> d!112661 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!112661 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411133 #b00000000000000000000000000000000) lt!411381)))

(declare-fun bs!25734 () Bool)

(assert (= bs!25734 d!112661))

(assert (=> bs!25734 m!848397))

(declare-fun m!848915 () Bool)

(assert (=> bs!25734 m!848915))

(assert (=> b!913859 d!112661))

(declare-fun d!112663 () Bool)

(declare-fun res!616510 () Bool)

(declare-fun e!512813 () Bool)

(assert (=> d!112663 (=> res!616510 e!512813)))

(assert (=> d!112663 (= res!616510 (= (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) lt!411133))))

(assert (=> d!112663 (= (arrayContainsKey!0 _keys!1386 lt!411133 #b00000000000000000000000000000000) e!512813)))

(declare-fun b!914155 () Bool)

(declare-fun e!512814 () Bool)

(assert (=> b!914155 (= e!512813 e!512814)))

(declare-fun res!616511 () Bool)

(assert (=> b!914155 (=> (not res!616511) (not e!512814))))

(assert (=> b!914155 (= res!616511 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26563 _keys!1386)))))

(declare-fun b!914156 () Bool)

(assert (=> b!914156 (= e!512814 (arrayContainsKey!0 _keys!1386 lt!411133 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112663 (not res!616510)) b!914155))

(assert (= (and b!914155 res!616511) b!914156))

(assert (=> d!112663 m!848391))

(declare-fun m!848917 () Bool)

(assert (=> b!914156 m!848917))

(assert (=> b!913859 d!112663))

(declare-fun b!914169 () Bool)

(declare-fun e!512822 () SeekEntryResult!8970)

(declare-fun lt!411388 () SeekEntryResult!8970)

(assert (=> b!914169 (= e!512822 (Found!8970 (index!38253 lt!411388)))))

(declare-fun b!914171 () Bool)

(declare-fun e!512823 () SeekEntryResult!8970)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!54304 (_ BitVec 32)) SeekEntryResult!8970)

(assert (=> b!914171 (= e!512823 (seekKeyOrZeroReturnVacant!0 (x!78168 lt!411388) (index!38253 lt!411388) (index!38253 lt!411388) (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756))))

(declare-fun b!914172 () Bool)

(declare-fun e!512821 () SeekEntryResult!8970)

(assert (=> b!914172 (= e!512821 Undefined!8970)))

(declare-fun b!914173 () Bool)

(declare-fun c!96001 () Bool)

(declare-fun lt!411390 () (_ BitVec 64))

(assert (=> b!914173 (= c!96001 (= lt!411390 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914173 (= e!512822 e!512823)))

(declare-fun b!914174 () Bool)

(assert (=> b!914174 (= e!512823 (MissingZero!8970 (index!38253 lt!411388)))))

(declare-fun d!112665 () Bool)

(declare-fun lt!411389 () SeekEntryResult!8970)

(assert (=> d!112665 (and (or ((_ is Undefined!8970) lt!411389) (not ((_ is Found!8970) lt!411389)) (and (bvsge (index!38252 lt!411389) #b00000000000000000000000000000000) (bvslt (index!38252 lt!411389) (size!26563 _keys!1386)))) (or ((_ is Undefined!8970) lt!411389) ((_ is Found!8970) lt!411389) (not ((_ is MissingZero!8970) lt!411389)) (and (bvsge (index!38251 lt!411389) #b00000000000000000000000000000000) (bvslt (index!38251 lt!411389) (size!26563 _keys!1386)))) (or ((_ is Undefined!8970) lt!411389) ((_ is Found!8970) lt!411389) ((_ is MissingZero!8970) lt!411389) (not ((_ is MissingVacant!8970) lt!411389)) (and (bvsge (index!38254 lt!411389) #b00000000000000000000000000000000) (bvslt (index!38254 lt!411389) (size!26563 _keys!1386)))) (or ((_ is Undefined!8970) lt!411389) (ite ((_ is Found!8970) lt!411389) (= (select (arr!26104 _keys!1386) (index!38252 lt!411389)) (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8970) lt!411389) (= (select (arr!26104 _keys!1386) (index!38251 lt!411389)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8970) lt!411389) (= (select (arr!26104 _keys!1386) (index!38254 lt!411389)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!112665 (= lt!411389 e!512821)))

(declare-fun c!96003 () Bool)

(assert (=> d!112665 (= c!96003 (and ((_ is Intermediate!8970) lt!411388) (undefined!9782 lt!411388)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!54304 (_ BitVec 32)) SeekEntryResult!8970)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112665 (= lt!411388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) mask!1756) (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756))))

(assert (=> d!112665 (validMask!0 mask!1756)))

(assert (=> d!112665 (= (seekEntryOrOpen!0 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) lt!411389)))

(declare-fun b!914170 () Bool)

(assert (=> b!914170 (= e!512821 e!512822)))

(assert (=> b!914170 (= lt!411390 (select (arr!26104 _keys!1386) (index!38253 lt!411388)))))

(declare-fun c!96002 () Bool)

(assert (=> b!914170 (= c!96002 (= lt!411390 (select (arr!26104 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112665 c!96003) b!914172))

(assert (= (and d!112665 (not c!96003)) b!914170))

(assert (= (and b!914170 c!96002) b!914169))

(assert (= (and b!914170 (not c!96002)) b!914173))

(assert (= (and b!914173 c!96001) b!914174))

(assert (= (and b!914173 (not c!96001)) b!914171))

(assert (=> b!914171 m!848391))

(declare-fun m!848919 () Bool)

(assert (=> b!914171 m!848919))

(assert (=> d!112665 m!848317))

(declare-fun m!848921 () Bool)

(assert (=> d!112665 m!848921))

(declare-fun m!848923 () Bool)

(assert (=> d!112665 m!848923))

(assert (=> d!112665 m!848391))

(declare-fun m!848925 () Bool)

(assert (=> d!112665 m!848925))

(declare-fun m!848927 () Bool)

(assert (=> d!112665 m!848927))

(declare-fun m!848929 () Bool)

(assert (=> d!112665 m!848929))

(assert (=> d!112665 m!848391))

(assert (=> d!112665 m!848923))

(declare-fun m!848931 () Bool)

(assert (=> b!914170 m!848931))

(assert (=> b!913859 d!112665))

(declare-fun mapIsEmpty!30474 () Bool)

(declare-fun mapRes!30474 () Bool)

(assert (=> mapIsEmpty!30474 mapRes!30474))

(declare-fun b!914176 () Bool)

(declare-fun e!512825 () Bool)

(assert (=> b!914176 (= e!512825 tp_is_empty!19155)))

(declare-fun mapNonEmpty!30474 () Bool)

(declare-fun tp!58505 () Bool)

(declare-fun e!512824 () Bool)

(assert (=> mapNonEmpty!30474 (= mapRes!30474 (and tp!58505 e!512824))))

(declare-fun mapValue!30474 () ValueCell!9096)

(declare-fun mapKey!30474 () (_ BitVec 32))

(declare-fun mapRest!30474 () (Array (_ BitVec 32) ValueCell!9096))

(assert (=> mapNonEmpty!30474 (= mapRest!30473 (store mapRest!30474 mapKey!30474 mapValue!30474))))

(declare-fun b!914175 () Bool)

(assert (=> b!914175 (= e!512824 tp_is_empty!19155)))

(declare-fun condMapEmpty!30474 () Bool)

(declare-fun mapDefault!30474 () ValueCell!9096)

(assert (=> mapNonEmpty!30473 (= condMapEmpty!30474 (= mapRest!30473 ((as const (Array (_ BitVec 32) ValueCell!9096)) mapDefault!30474)))))

(assert (=> mapNonEmpty!30473 (= tp!58504 (and e!512825 mapRes!30474))))

(assert (= (and mapNonEmpty!30473 condMapEmpty!30474) mapIsEmpty!30474))

(assert (= (and mapNonEmpty!30473 (not condMapEmpty!30474)) mapNonEmpty!30474))

(assert (= (and mapNonEmpty!30474 ((_ is ValueCellFull!9096) mapValue!30474)) b!914175))

(assert (= (and mapNonEmpty!30473 ((_ is ValueCellFull!9096) mapDefault!30474)) b!914176))

(declare-fun m!848933 () Bool)

(assert (=> mapNonEmpty!30474 m!848933))

(declare-fun b_lambda!13363 () Bool)

(assert (= b_lambda!13359 (or (and start!78316 b_free!16737) b_lambda!13363)))

(declare-fun b_lambda!13365 () Bool)

(assert (= b_lambda!13357 (or (and start!78316 b_free!16737) b_lambda!13365)))

(declare-fun b_lambda!13367 () Bool)

(assert (= b_lambda!13361 (or (and start!78316 b_free!16737) b_lambda!13367)))

(declare-fun b_lambda!13369 () Bool)

(assert (= b_lambda!13355 (or (and start!78316 b_free!16737) b_lambda!13369)))

(check-sat (not b!914103) (not b!914068) (not b!914036) (not b!914017) (not d!112565) (not b!914142) (not d!112595) (not b!914116) (not d!112597) (not d!112553) (not bm!40495) (not b!914079) (not d!112545) (not b!914152) (not d!112609) (not b!914020) (not d!112607) (not b!914040) (not b!914016) (not b!914066) (not d!112555) (not b!914104) (not d!112625) (not b!914046) (not b!914045) (not b!914048) (not d!112569) (not b!914025) (not d!112593) (not b!914140) (not b_lambda!13369) (not b!914062) (not d!112665) (not b_lambda!13365) (not b!914077) (not b!914073) (not d!112585) (not b_lambda!13351) (not bm!40496) (not b!914098) (not b_lambda!13363) (not d!112621) (not d!112539) (not b!914128) (not d!112587) (not b!914055) (not b!914087) (not b!914171) (not d!112581) (not b!914109) (not b!914056) (not d!112641) (not d!112547) (not b!914080) (not d!112635) (not b!914028) (not b!914150) (not b!914081) (not b!914126) (not d!112657) (not d!112543) (not d!112573) (not mapNonEmpty!30474) (not b!914072) (not b!914051) (not d!112643) tp_is_empty!19155 b_and!27347 (not b!914052) (not b!914061) (not b!914101) (not b_lambda!13367) (not d!112611) (not b!914156) (not d!112599) (not b!914064) (not b!914049) (not b!914154) (not d!112613) (not b!914102) (not b!914037) (not d!112549) (not d!112619) (not b_next!16737) (not d!112535) (not b!914023) (not bm!40498) (not d!112589) (not b!914143) (not d!112541) (not b!914130) (not d!112661) (not b!914125) (not d!112655) (not d!112533) (not b!914038) (not b!914135) (not d!112659) (not b!914112) (not b!914030) (not b!914071) (not b!914111) (not b!914129) (not b!914078) (not d!112563) (not d!112601) (not b!914024) (not d!112623) (not d!112603) (not b!914148) (not b!914059) (not d!112649) (not d!112651) (not b!914151) (not d!112633) (not b!914107) (not b!914060) (not b!914100) (not d!112557) (not d!112567) (not d!112615) (not b!914027) (not d!112527) (not b!914105) (not d!112637) (not b!914019) (not b!914067) (not b!914122) (not b!914063) (not bm!40497) (not d!112551) (not b!914057) (not d!112605) (not d!112617) (not d!112583) (not b!914132) (not b!914123) (not d!112559) (not b_lambda!13353) (not b!914133) (not d!112577) (not b!914138) (not d!112561) (not b_lambda!13345))
(check-sat b_and!27347 (not b_next!16737))
