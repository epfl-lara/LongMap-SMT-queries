; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105906 () Bool)

(assert start!105906)

(declare-fun b_free!27451 () Bool)

(declare-fun b_next!27451 () Bool)

(assert (=> start!105906 (= b_free!27451 (not b_next!27451))))

(declare-fun tp!95884 () Bool)

(declare-fun b_and!45341 () Bool)

(assert (=> start!105906 (= tp!95884 b_and!45341)))

(declare-fun b!1261401 () Bool)

(declare-fun res!840560 () Bool)

(declare-fun e!717934 () Bool)

(assert (=> b!1261401 (=> (not res!840560) (not e!717934))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82241 0))(
  ( (array!82242 (arr!39674 (Array (_ BitVec 32) (_ BitVec 64))) (size!40212 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82241)

(declare-datatypes ((V!48503 0))(
  ( (V!48504 (val!16239 Int)) )
))
(declare-datatypes ((ValueCell!15413 0))(
  ( (ValueCellFull!15413 (v!18942 V!48503)) (EmptyCell!15413) )
))
(declare-datatypes ((array!82243 0))(
  ( (array!82244 (arr!39675 (Array (_ BitVec 32) ValueCell!15413)) (size!40213 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82243)

(assert (=> b!1261401 (= res!840560 (and (= (size!40213 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40212 _keys!1118) (size!40213 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!840558 () Bool)

(assert (=> start!105906 (=> (not res!840558) (not e!717934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105906 (= res!840558 (validMask!0 mask!1466))))

(assert (=> start!105906 e!717934))

(assert (=> start!105906 true))

(assert (=> start!105906 tp!95884))

(declare-fun tp_is_empty!32353 () Bool)

(assert (=> start!105906 tp_is_empty!32353))

(declare-fun array_inv!30351 (array!82241) Bool)

(assert (=> start!105906 (array_inv!30351 _keys!1118)))

(declare-fun e!717931 () Bool)

(declare-fun array_inv!30352 (array!82243) Bool)

(assert (=> start!105906 (and (array_inv!30352 _values!914) e!717931)))

(declare-fun b!1261402 () Bool)

(declare-fun res!840561 () Bool)

(assert (=> b!1261402 (=> (not res!840561) (not e!717934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82241 (_ BitVec 32)) Bool)

(assert (=> b!1261402 (= res!840561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261403 () Bool)

(assert (=> b!1261403 (= e!717934 (bvsgt #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48503)

(declare-fun zeroValue!871 () V!48503)

(declare-datatypes ((tuple2!21090 0))(
  ( (tuple2!21091 (_1!10556 (_ BitVec 64)) (_2!10556 V!48503)) )
))
(declare-datatypes ((List!28292 0))(
  ( (Nil!28289) (Cons!28288 (h!29497 tuple2!21090) (t!41782 List!28292)) )
))
(declare-datatypes ((ListLongMap!18963 0))(
  ( (ListLongMap!18964 (toList!9497 List!28292)) )
))
(declare-fun lt!571461 () ListLongMap!18963)

(declare-fun getCurrentListMapNoExtraKeys!5866 (array!82241 array!82243 (_ BitVec 32) (_ BitVec 32) V!48503 V!48503 (_ BitVec 32) Int) ListLongMap!18963)

(assert (=> b!1261403 (= lt!571461 (getCurrentListMapNoExtraKeys!5866 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!48503)

(declare-fun lt!571462 () ListLongMap!18963)

(assert (=> b!1261403 (= lt!571462 (getCurrentListMapNoExtraKeys!5866 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261404 () Bool)

(declare-fun e!717932 () Bool)

(assert (=> b!1261404 (= e!717932 tp_is_empty!32353)))

(declare-fun b!1261405 () Bool)

(declare-fun mapRes!50332 () Bool)

(assert (=> b!1261405 (= e!717931 (and e!717932 mapRes!50332))))

(declare-fun condMapEmpty!50332 () Bool)

(declare-fun mapDefault!50332 () ValueCell!15413)

(assert (=> b!1261405 (= condMapEmpty!50332 (= (arr!39675 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15413)) mapDefault!50332)))))

(declare-fun mapNonEmpty!50332 () Bool)

(declare-fun tp!95885 () Bool)

(declare-fun e!717935 () Bool)

(assert (=> mapNonEmpty!50332 (= mapRes!50332 (and tp!95885 e!717935))))

(declare-fun mapValue!50332 () ValueCell!15413)

(declare-fun mapRest!50332 () (Array (_ BitVec 32) ValueCell!15413))

(declare-fun mapKey!50332 () (_ BitVec 32))

(assert (=> mapNonEmpty!50332 (= (arr!39675 _values!914) (store mapRest!50332 mapKey!50332 mapValue!50332))))

(declare-fun b!1261406 () Bool)

(declare-fun res!840559 () Bool)

(assert (=> b!1261406 (=> (not res!840559) (not e!717934))))

(declare-datatypes ((List!28293 0))(
  ( (Nil!28290) (Cons!28289 (h!29498 (_ BitVec 64)) (t!41783 List!28293)) )
))
(declare-fun arrayNoDuplicates!0 (array!82241 (_ BitVec 32) List!28293) Bool)

(assert (=> b!1261406 (= res!840559 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28290))))

(declare-fun mapIsEmpty!50332 () Bool)

(assert (=> mapIsEmpty!50332 mapRes!50332))

(declare-fun b!1261407 () Bool)

(assert (=> b!1261407 (= e!717935 tp_is_empty!32353)))

(assert (= (and start!105906 res!840558) b!1261401))

(assert (= (and b!1261401 res!840560) b!1261402))

(assert (= (and b!1261402 res!840561) b!1261406))

(assert (= (and b!1261406 res!840559) b!1261403))

(assert (= (and b!1261405 condMapEmpty!50332) mapIsEmpty!50332))

(assert (= (and b!1261405 (not condMapEmpty!50332)) mapNonEmpty!50332))

(get-info :version)

(assert (= (and mapNonEmpty!50332 ((_ is ValueCellFull!15413) mapValue!50332)) b!1261407))

(assert (= (and b!1261405 ((_ is ValueCellFull!15413) mapDefault!50332)) b!1261404))

(assert (= start!105906 b!1261405))

(declare-fun m!1161577 () Bool)

(assert (=> start!105906 m!1161577))

(declare-fun m!1161579 () Bool)

(assert (=> start!105906 m!1161579))

(declare-fun m!1161581 () Bool)

(assert (=> start!105906 m!1161581))

(declare-fun m!1161583 () Bool)

(assert (=> b!1261402 m!1161583))

(declare-fun m!1161585 () Bool)

(assert (=> mapNonEmpty!50332 m!1161585))

(declare-fun m!1161587 () Bool)

(assert (=> b!1261403 m!1161587))

(declare-fun m!1161589 () Bool)

(assert (=> b!1261403 m!1161589))

(declare-fun m!1161591 () Bool)

(assert (=> b!1261406 m!1161591))

(check-sat (not mapNonEmpty!50332) (not b!1261402) (not b!1261406) (not start!105906) b_and!45341 tp_is_empty!32353 (not b_next!27451) (not b!1261403))
(check-sat b_and!45341 (not b_next!27451))
(get-model)

(declare-fun d!138315 () Bool)

(assert (=> d!138315 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105906 d!138315))

(declare-fun d!138317 () Bool)

(assert (=> d!138317 (= (array_inv!30351 _keys!1118) (bvsge (size!40212 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105906 d!138317))

(declare-fun d!138319 () Bool)

(assert (=> d!138319 (= (array_inv!30352 _values!914) (bvsge (size!40213 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105906 d!138319))

(declare-fun b!1261474 () Bool)

(declare-fun lt!571494 () ListLongMap!18963)

(declare-fun e!717986 () Bool)

(assert (=> b!1261474 (= e!717986 (= lt!571494 (getCurrentListMapNoExtraKeys!5866 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1261475 () Bool)

(declare-fun e!717983 () Bool)

(declare-fun e!717981 () Bool)

(assert (=> b!1261475 (= e!717983 e!717981)))

(assert (=> b!1261475 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(declare-fun res!840595 () Bool)

(declare-fun contains!7552 (ListLongMap!18963 (_ BitVec 64)) Bool)

(assert (=> b!1261475 (= res!840595 (contains!7552 lt!571494 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261475 (=> (not res!840595) (not e!717981))))

(declare-fun b!1261476 () Bool)

(declare-fun e!717982 () ListLongMap!18963)

(declare-fun e!717984 () ListLongMap!18963)

(assert (=> b!1261476 (= e!717982 e!717984)))

(declare-fun c!122640 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1261476 (= c!122640 (validKeyInArray!0 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138321 () Bool)

(declare-fun e!717985 () Bool)

(assert (=> d!138321 e!717985))

(declare-fun res!840596 () Bool)

(assert (=> d!138321 (=> (not res!840596) (not e!717985))))

(assert (=> d!138321 (= res!840596 (not (contains!7552 lt!571494 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138321 (= lt!571494 e!717982)))

(declare-fun c!122639 () Bool)

(assert (=> d!138321 (= c!122639 (bvsge #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(assert (=> d!138321 (validMask!0 mask!1466)))

(assert (=> d!138321 (= (getCurrentListMapNoExtraKeys!5866 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571494)))

(declare-fun b!1261477 () Bool)

(declare-fun res!840594 () Bool)

(assert (=> b!1261477 (=> (not res!840594) (not e!717985))))

(assert (=> b!1261477 (= res!840594 (not (contains!7552 lt!571494 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261478 () Bool)

(declare-fun call!61940 () ListLongMap!18963)

(assert (=> b!1261478 (= e!717984 call!61940)))

(declare-fun b!1261479 () Bool)

(assert (=> b!1261479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(assert (=> b!1261479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40213 _values!914)))))

(declare-fun apply!987 (ListLongMap!18963 (_ BitVec 64)) V!48503)

(declare-fun get!20264 (ValueCell!15413 V!48503) V!48503)

(declare-fun dynLambda!3417 (Int (_ BitVec 64)) V!48503)

(assert (=> b!1261479 (= e!717981 (= (apply!987 lt!571494 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000)) (get!20264 (select (arr!39675 _values!914) #b00000000000000000000000000000000) (dynLambda!3417 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1261480 () Bool)

(declare-datatypes ((Unit!41900 0))(
  ( (Unit!41901) )
))
(declare-fun lt!571495 () Unit!41900)

(declare-fun lt!571492 () Unit!41900)

(assert (=> b!1261480 (= lt!571495 lt!571492)))

(declare-fun lt!571493 () (_ BitVec 64))

(declare-fun lt!571491 () (_ BitVec 64))

(declare-fun lt!571490 () ListLongMap!18963)

(declare-fun lt!571489 () V!48503)

(declare-fun +!4276 (ListLongMap!18963 tuple2!21090) ListLongMap!18963)

(assert (=> b!1261480 (not (contains!7552 (+!4276 lt!571490 (tuple2!21091 lt!571493 lt!571489)) lt!571491))))

(declare-fun addStillNotContains!323 (ListLongMap!18963 (_ BitVec 64) V!48503 (_ BitVec 64)) Unit!41900)

(assert (=> b!1261480 (= lt!571492 (addStillNotContains!323 lt!571490 lt!571493 lt!571489 lt!571491))))

(assert (=> b!1261480 (= lt!571491 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1261480 (= lt!571489 (get!20264 (select (arr!39675 _values!914) #b00000000000000000000000000000000) (dynLambda!3417 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1261480 (= lt!571493 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261480 (= lt!571490 call!61940)))

(assert (=> b!1261480 (= e!717984 (+!4276 call!61940 (tuple2!21091 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000) (get!20264 (select (arr!39675 _values!914) #b00000000000000000000000000000000) (dynLambda!3417 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!61937 () Bool)

(assert (=> bm!61937 (= call!61940 (getCurrentListMapNoExtraKeys!5866 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1261481 () Bool)

(assert (=> b!1261481 (= e!717983 e!717986)))

(declare-fun c!122641 () Bool)

(assert (=> b!1261481 (= c!122641 (bvslt #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(declare-fun b!1261482 () Bool)

(declare-fun isEmpty!1042 (ListLongMap!18963) Bool)

(assert (=> b!1261482 (= e!717986 (isEmpty!1042 lt!571494))))

(declare-fun b!1261483 () Bool)

(assert (=> b!1261483 (= e!717982 (ListLongMap!18964 Nil!28289))))

(declare-fun b!1261484 () Bool)

(assert (=> b!1261484 (= e!717985 e!717983)))

(declare-fun c!122642 () Bool)

(declare-fun e!717980 () Bool)

(assert (=> b!1261484 (= c!122642 e!717980)))

(declare-fun res!840597 () Bool)

(assert (=> b!1261484 (=> (not res!840597) (not e!717980))))

(assert (=> b!1261484 (= res!840597 (bvslt #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(declare-fun b!1261485 () Bool)

(assert (=> b!1261485 (= e!717980 (validKeyInArray!0 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261485 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!138321 c!122639) b!1261483))

(assert (= (and d!138321 (not c!122639)) b!1261476))

(assert (= (and b!1261476 c!122640) b!1261480))

(assert (= (and b!1261476 (not c!122640)) b!1261478))

(assert (= (or b!1261480 b!1261478) bm!61937))

(assert (= (and d!138321 res!840596) b!1261477))

(assert (= (and b!1261477 res!840594) b!1261484))

(assert (= (and b!1261484 res!840597) b!1261485))

(assert (= (and b!1261484 c!122642) b!1261475))

(assert (= (and b!1261484 (not c!122642)) b!1261481))

(assert (= (and b!1261475 res!840595) b!1261479))

(assert (= (and b!1261481 c!122641) b!1261474))

(assert (= (and b!1261481 (not c!122641)) b!1261482))

(declare-fun b_lambda!22781 () Bool)

(assert (=> (not b_lambda!22781) (not b!1261479)))

(declare-fun t!41787 () Bool)

(declare-fun tb!11307 () Bool)

(assert (=> (and start!105906 (= defaultEntry!922 defaultEntry!922) t!41787) tb!11307))

(declare-fun result!23345 () Bool)

(assert (=> tb!11307 (= result!23345 tp_is_empty!32353)))

(assert (=> b!1261479 t!41787))

(declare-fun b_and!45347 () Bool)

(assert (= b_and!45341 (and (=> t!41787 result!23345) b_and!45347)))

(declare-fun b_lambda!22783 () Bool)

(assert (=> (not b_lambda!22783) (not b!1261480)))

(assert (=> b!1261480 t!41787))

(declare-fun b_and!45349 () Bool)

(assert (= b_and!45347 (and (=> t!41787 result!23345) b_and!45349)))

(declare-fun m!1161625 () Bool)

(assert (=> b!1261485 m!1161625))

(assert (=> b!1261485 m!1161625))

(declare-fun m!1161627 () Bool)

(assert (=> b!1261485 m!1161627))

(declare-fun m!1161629 () Bool)

(assert (=> b!1261479 m!1161629))

(assert (=> b!1261479 m!1161625))

(declare-fun m!1161631 () Bool)

(assert (=> b!1261479 m!1161631))

(declare-fun m!1161633 () Bool)

(assert (=> b!1261479 m!1161633))

(assert (=> b!1261479 m!1161629))

(declare-fun m!1161635 () Bool)

(assert (=> b!1261479 m!1161635))

(assert (=> b!1261479 m!1161633))

(assert (=> b!1261479 m!1161625))

(declare-fun m!1161637 () Bool)

(assert (=> b!1261482 m!1161637))

(declare-fun m!1161639 () Bool)

(assert (=> b!1261474 m!1161639))

(assert (=> b!1261476 m!1161625))

(assert (=> b!1261476 m!1161625))

(assert (=> b!1261476 m!1161627))

(declare-fun m!1161641 () Bool)

(assert (=> b!1261477 m!1161641))

(assert (=> b!1261475 m!1161625))

(assert (=> b!1261475 m!1161625))

(declare-fun m!1161643 () Bool)

(assert (=> b!1261475 m!1161643))

(declare-fun m!1161645 () Bool)

(assert (=> d!138321 m!1161645))

(assert (=> d!138321 m!1161577))

(assert (=> b!1261480 m!1161629))

(declare-fun m!1161647 () Bool)

(assert (=> b!1261480 m!1161647))

(declare-fun m!1161649 () Bool)

(assert (=> b!1261480 m!1161649))

(assert (=> b!1261480 m!1161633))

(assert (=> b!1261480 m!1161629))

(assert (=> b!1261480 m!1161635))

(declare-fun m!1161651 () Bool)

(assert (=> b!1261480 m!1161651))

(assert (=> b!1261480 m!1161633))

(assert (=> b!1261480 m!1161647))

(assert (=> b!1261480 m!1161625))

(declare-fun m!1161653 () Bool)

(assert (=> b!1261480 m!1161653))

(assert (=> bm!61937 m!1161639))

(assert (=> b!1261403 d!138321))

(declare-fun b!1261488 () Bool)

(declare-fun lt!571501 () ListLongMap!18963)

(declare-fun e!717993 () Bool)

(assert (=> b!1261488 (= e!717993 (= lt!571501 (getCurrentListMapNoExtraKeys!5866 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1261489 () Bool)

(declare-fun e!717990 () Bool)

(declare-fun e!717988 () Bool)

(assert (=> b!1261489 (= e!717990 e!717988)))

(assert (=> b!1261489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(declare-fun res!840599 () Bool)

(assert (=> b!1261489 (= res!840599 (contains!7552 lt!571501 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261489 (=> (not res!840599) (not e!717988))))

(declare-fun b!1261490 () Bool)

(declare-fun e!717989 () ListLongMap!18963)

(declare-fun e!717991 () ListLongMap!18963)

(assert (=> b!1261490 (= e!717989 e!717991)))

(declare-fun c!122644 () Bool)

(assert (=> b!1261490 (= c!122644 (validKeyInArray!0 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138323 () Bool)

(declare-fun e!717992 () Bool)

(assert (=> d!138323 e!717992))

(declare-fun res!840600 () Bool)

(assert (=> d!138323 (=> (not res!840600) (not e!717992))))

(assert (=> d!138323 (= res!840600 (not (contains!7552 lt!571501 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138323 (= lt!571501 e!717989)))

(declare-fun c!122643 () Bool)

(assert (=> d!138323 (= c!122643 (bvsge #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(assert (=> d!138323 (validMask!0 mask!1466)))

(assert (=> d!138323 (= (getCurrentListMapNoExtraKeys!5866 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571501)))

(declare-fun b!1261491 () Bool)

(declare-fun res!840598 () Bool)

(assert (=> b!1261491 (=> (not res!840598) (not e!717992))))

(assert (=> b!1261491 (= res!840598 (not (contains!7552 lt!571501 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261492 () Bool)

(declare-fun call!61941 () ListLongMap!18963)

(assert (=> b!1261492 (= e!717991 call!61941)))

(declare-fun b!1261493 () Bool)

(assert (=> b!1261493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(assert (=> b!1261493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40213 _values!914)))))

(assert (=> b!1261493 (= e!717988 (= (apply!987 lt!571501 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000)) (get!20264 (select (arr!39675 _values!914) #b00000000000000000000000000000000) (dynLambda!3417 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1261494 () Bool)

(declare-fun lt!571502 () Unit!41900)

(declare-fun lt!571499 () Unit!41900)

(assert (=> b!1261494 (= lt!571502 lt!571499)))

(declare-fun lt!571498 () (_ BitVec 64))

(declare-fun lt!571500 () (_ BitVec 64))

(declare-fun lt!571496 () V!48503)

(declare-fun lt!571497 () ListLongMap!18963)

(assert (=> b!1261494 (not (contains!7552 (+!4276 lt!571497 (tuple2!21091 lt!571500 lt!571496)) lt!571498))))

(assert (=> b!1261494 (= lt!571499 (addStillNotContains!323 lt!571497 lt!571500 lt!571496 lt!571498))))

(assert (=> b!1261494 (= lt!571498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1261494 (= lt!571496 (get!20264 (select (arr!39675 _values!914) #b00000000000000000000000000000000) (dynLambda!3417 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1261494 (= lt!571500 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261494 (= lt!571497 call!61941)))

(assert (=> b!1261494 (= e!717991 (+!4276 call!61941 (tuple2!21091 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000) (get!20264 (select (arr!39675 _values!914) #b00000000000000000000000000000000) (dynLambda!3417 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!61938 () Bool)

(assert (=> bm!61938 (= call!61941 (getCurrentListMapNoExtraKeys!5866 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1261495 () Bool)

(assert (=> b!1261495 (= e!717990 e!717993)))

(declare-fun c!122645 () Bool)

(assert (=> b!1261495 (= c!122645 (bvslt #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(declare-fun b!1261496 () Bool)

(assert (=> b!1261496 (= e!717993 (isEmpty!1042 lt!571501))))

(declare-fun b!1261497 () Bool)

(assert (=> b!1261497 (= e!717989 (ListLongMap!18964 Nil!28289))))

(declare-fun b!1261498 () Bool)

(assert (=> b!1261498 (= e!717992 e!717990)))

(declare-fun c!122646 () Bool)

(declare-fun e!717987 () Bool)

(assert (=> b!1261498 (= c!122646 e!717987)))

(declare-fun res!840601 () Bool)

(assert (=> b!1261498 (=> (not res!840601) (not e!717987))))

(assert (=> b!1261498 (= res!840601 (bvslt #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(declare-fun b!1261499 () Bool)

(assert (=> b!1261499 (= e!717987 (validKeyInArray!0 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261499 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!138323 c!122643) b!1261497))

(assert (= (and d!138323 (not c!122643)) b!1261490))

(assert (= (and b!1261490 c!122644) b!1261494))

(assert (= (and b!1261490 (not c!122644)) b!1261492))

(assert (= (or b!1261494 b!1261492) bm!61938))

(assert (= (and d!138323 res!840600) b!1261491))

(assert (= (and b!1261491 res!840598) b!1261498))

(assert (= (and b!1261498 res!840601) b!1261499))

(assert (= (and b!1261498 c!122646) b!1261489))

(assert (= (and b!1261498 (not c!122646)) b!1261495))

(assert (= (and b!1261489 res!840599) b!1261493))

(assert (= (and b!1261495 c!122645) b!1261488))

(assert (= (and b!1261495 (not c!122645)) b!1261496))

(declare-fun b_lambda!22785 () Bool)

(assert (=> (not b_lambda!22785) (not b!1261493)))

(assert (=> b!1261493 t!41787))

(declare-fun b_and!45351 () Bool)

(assert (= b_and!45349 (and (=> t!41787 result!23345) b_and!45351)))

(declare-fun b_lambda!22787 () Bool)

(assert (=> (not b_lambda!22787) (not b!1261494)))

(assert (=> b!1261494 t!41787))

(declare-fun b_and!45353 () Bool)

(assert (= b_and!45351 (and (=> t!41787 result!23345) b_and!45353)))

(assert (=> b!1261499 m!1161625))

(assert (=> b!1261499 m!1161625))

(assert (=> b!1261499 m!1161627))

(assert (=> b!1261493 m!1161629))

(assert (=> b!1261493 m!1161625))

(declare-fun m!1161655 () Bool)

(assert (=> b!1261493 m!1161655))

(assert (=> b!1261493 m!1161633))

(assert (=> b!1261493 m!1161629))

(assert (=> b!1261493 m!1161635))

(assert (=> b!1261493 m!1161633))

(assert (=> b!1261493 m!1161625))

(declare-fun m!1161657 () Bool)

(assert (=> b!1261496 m!1161657))

(declare-fun m!1161659 () Bool)

(assert (=> b!1261488 m!1161659))

(assert (=> b!1261490 m!1161625))

(assert (=> b!1261490 m!1161625))

(assert (=> b!1261490 m!1161627))

(declare-fun m!1161661 () Bool)

(assert (=> b!1261491 m!1161661))

(assert (=> b!1261489 m!1161625))

(assert (=> b!1261489 m!1161625))

(declare-fun m!1161663 () Bool)

(assert (=> b!1261489 m!1161663))

(declare-fun m!1161665 () Bool)

(assert (=> d!138323 m!1161665))

(assert (=> d!138323 m!1161577))

(assert (=> b!1261494 m!1161629))

(declare-fun m!1161667 () Bool)

(assert (=> b!1261494 m!1161667))

(declare-fun m!1161669 () Bool)

(assert (=> b!1261494 m!1161669))

(assert (=> b!1261494 m!1161633))

(assert (=> b!1261494 m!1161629))

(assert (=> b!1261494 m!1161635))

(declare-fun m!1161671 () Bool)

(assert (=> b!1261494 m!1161671))

(assert (=> b!1261494 m!1161633))

(assert (=> b!1261494 m!1161667))

(assert (=> b!1261494 m!1161625))

(declare-fun m!1161673 () Bool)

(assert (=> b!1261494 m!1161673))

(assert (=> bm!61938 m!1161659))

(assert (=> b!1261403 d!138323))

(declare-fun b!1261510 () Bool)

(declare-fun e!718003 () Bool)

(declare-fun contains!7553 (List!28293 (_ BitVec 64)) Bool)

(assert (=> b!1261510 (= e!718003 (contains!7553 Nil!28290 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261511 () Bool)

(declare-fun e!718004 () Bool)

(declare-fun e!718002 () Bool)

(assert (=> b!1261511 (= e!718004 e!718002)))

(declare-fun c!122649 () Bool)

(assert (=> b!1261511 (= c!122649 (validKeyInArray!0 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261512 () Bool)

(declare-fun e!718005 () Bool)

(assert (=> b!1261512 (= e!718005 e!718004)))

(declare-fun res!840609 () Bool)

(assert (=> b!1261512 (=> (not res!840609) (not e!718004))))

(assert (=> b!1261512 (= res!840609 (not e!718003))))

(declare-fun res!840608 () Bool)

(assert (=> b!1261512 (=> (not res!840608) (not e!718003))))

(assert (=> b!1261512 (= res!840608 (validKeyInArray!0 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261513 () Bool)

(declare-fun call!61944 () Bool)

(assert (=> b!1261513 (= e!718002 call!61944)))

(declare-fun d!138325 () Bool)

(declare-fun res!840610 () Bool)

(assert (=> d!138325 (=> res!840610 e!718005)))

(assert (=> d!138325 (= res!840610 (bvsge #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(assert (=> d!138325 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28290) e!718005)))

(declare-fun b!1261514 () Bool)

(assert (=> b!1261514 (= e!718002 call!61944)))

(declare-fun bm!61941 () Bool)

(assert (=> bm!61941 (= call!61944 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122649 (Cons!28289 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000) Nil!28290) Nil!28290)))))

(assert (= (and d!138325 (not res!840610)) b!1261512))

(assert (= (and b!1261512 res!840608) b!1261510))

(assert (= (and b!1261512 res!840609) b!1261511))

(assert (= (and b!1261511 c!122649) b!1261514))

(assert (= (and b!1261511 (not c!122649)) b!1261513))

(assert (= (or b!1261514 b!1261513) bm!61941))

(assert (=> b!1261510 m!1161625))

(assert (=> b!1261510 m!1161625))

(declare-fun m!1161675 () Bool)

(assert (=> b!1261510 m!1161675))

(assert (=> b!1261511 m!1161625))

(assert (=> b!1261511 m!1161625))

(assert (=> b!1261511 m!1161627))

(assert (=> b!1261512 m!1161625))

(assert (=> b!1261512 m!1161625))

(assert (=> b!1261512 m!1161627))

(assert (=> bm!61941 m!1161625))

(declare-fun m!1161677 () Bool)

(assert (=> bm!61941 m!1161677))

(assert (=> b!1261406 d!138325))

(declare-fun b!1261523 () Bool)

(declare-fun e!718014 () Bool)

(declare-fun e!718013 () Bool)

(assert (=> b!1261523 (= e!718014 e!718013)))

(declare-fun lt!571510 () (_ BitVec 64))

(assert (=> b!1261523 (= lt!571510 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571511 () Unit!41900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82241 (_ BitVec 64) (_ BitVec 32)) Unit!41900)

(assert (=> b!1261523 (= lt!571511 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!571510 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1261523 (arrayContainsKey!0 _keys!1118 lt!571510 #b00000000000000000000000000000000)))

(declare-fun lt!571509 () Unit!41900)

(assert (=> b!1261523 (= lt!571509 lt!571511)))

(declare-fun res!840616 () Bool)

(declare-datatypes ((SeekEntryResult!9971 0))(
  ( (MissingZero!9971 (index!42255 (_ BitVec 32))) (Found!9971 (index!42256 (_ BitVec 32))) (Intermediate!9971 (undefined!10783 Bool) (index!42257 (_ BitVec 32)) (x!111165 (_ BitVec 32))) (Undefined!9971) (MissingVacant!9971 (index!42258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82241 (_ BitVec 32)) SeekEntryResult!9971)

(assert (=> b!1261523 (= res!840616 (= (seekEntryOrOpen!0 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9971 #b00000000000000000000000000000000)))))

(assert (=> b!1261523 (=> (not res!840616) (not e!718013))))

(declare-fun b!1261524 () Bool)

(declare-fun call!61947 () Bool)

(assert (=> b!1261524 (= e!718014 call!61947)))

(declare-fun b!1261525 () Bool)

(assert (=> b!1261525 (= e!718013 call!61947)))

(declare-fun d!138327 () Bool)

(declare-fun res!840615 () Bool)

(declare-fun e!718012 () Bool)

(assert (=> d!138327 (=> res!840615 e!718012)))

(assert (=> d!138327 (= res!840615 (bvsge #b00000000000000000000000000000000 (size!40212 _keys!1118)))))

(assert (=> d!138327 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718012)))

(declare-fun bm!61944 () Bool)

(assert (=> bm!61944 (= call!61947 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1261526 () Bool)

(assert (=> b!1261526 (= e!718012 e!718014)))

(declare-fun c!122652 () Bool)

(assert (=> b!1261526 (= c!122652 (validKeyInArray!0 (select (arr!39674 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138327 (not res!840615)) b!1261526))

(assert (= (and b!1261526 c!122652) b!1261523))

(assert (= (and b!1261526 (not c!122652)) b!1261524))

(assert (= (and b!1261523 res!840616) b!1261525))

(assert (= (or b!1261525 b!1261524) bm!61944))

(assert (=> b!1261523 m!1161625))

(declare-fun m!1161679 () Bool)

(assert (=> b!1261523 m!1161679))

(declare-fun m!1161681 () Bool)

(assert (=> b!1261523 m!1161681))

(assert (=> b!1261523 m!1161625))

(declare-fun m!1161683 () Bool)

(assert (=> b!1261523 m!1161683))

(declare-fun m!1161685 () Bool)

(assert (=> bm!61944 m!1161685))

(assert (=> b!1261526 m!1161625))

(assert (=> b!1261526 m!1161625))

(assert (=> b!1261526 m!1161627))

(assert (=> b!1261402 d!138327))

(declare-fun b!1261533 () Bool)

(declare-fun e!718019 () Bool)

(assert (=> b!1261533 (= e!718019 tp_is_empty!32353)))

(declare-fun condMapEmpty!50341 () Bool)

(declare-fun mapDefault!50341 () ValueCell!15413)

(assert (=> mapNonEmpty!50332 (= condMapEmpty!50341 (= mapRest!50332 ((as const (Array (_ BitVec 32) ValueCell!15413)) mapDefault!50341)))))

(declare-fun e!718020 () Bool)

(declare-fun mapRes!50341 () Bool)

(assert (=> mapNonEmpty!50332 (= tp!95885 (and e!718020 mapRes!50341))))

(declare-fun mapNonEmpty!50341 () Bool)

(declare-fun tp!95900 () Bool)

(assert (=> mapNonEmpty!50341 (= mapRes!50341 (and tp!95900 e!718019))))

(declare-fun mapKey!50341 () (_ BitVec 32))

(declare-fun mapValue!50341 () ValueCell!15413)

(declare-fun mapRest!50341 () (Array (_ BitVec 32) ValueCell!15413))

(assert (=> mapNonEmpty!50341 (= mapRest!50332 (store mapRest!50341 mapKey!50341 mapValue!50341))))

(declare-fun mapIsEmpty!50341 () Bool)

(assert (=> mapIsEmpty!50341 mapRes!50341))

(declare-fun b!1261534 () Bool)

(assert (=> b!1261534 (= e!718020 tp_is_empty!32353)))

(assert (= (and mapNonEmpty!50332 condMapEmpty!50341) mapIsEmpty!50341))

(assert (= (and mapNonEmpty!50332 (not condMapEmpty!50341)) mapNonEmpty!50341))

(assert (= (and mapNonEmpty!50341 ((_ is ValueCellFull!15413) mapValue!50341)) b!1261533))

(assert (= (and mapNonEmpty!50332 ((_ is ValueCellFull!15413) mapDefault!50341)) b!1261534))

(declare-fun m!1161687 () Bool)

(assert (=> mapNonEmpty!50341 m!1161687))

(declare-fun b_lambda!22789 () Bool)

(assert (= b_lambda!22781 (or (and start!105906 b_free!27451) b_lambda!22789)))

(declare-fun b_lambda!22791 () Bool)

(assert (= b_lambda!22785 (or (and start!105906 b_free!27451) b_lambda!22791)))

(declare-fun b_lambda!22793 () Bool)

(assert (= b_lambda!22787 (or (and start!105906 b_free!27451) b_lambda!22793)))

(declare-fun b_lambda!22795 () Bool)

(assert (= b_lambda!22783 (or (and start!105906 b_free!27451) b_lambda!22795)))

(check-sat (not b!1261476) b_and!45353 (not b!1261511) (not b_lambda!22795) (not b!1261523) (not b_next!27451) (not d!138321) (not b!1261491) (not bm!61938) (not b!1261494) (not b!1261479) (not bm!61944) (not d!138323) (not mapNonEmpty!50341) (not b!1261477) (not b!1261474) (not bm!61937) (not b!1261493) (not b!1261490) (not b!1261485) (not b!1261499) (not b!1261496) (not b!1261489) (not b!1261510) (not b!1261480) (not b!1261488) (not b!1261482) (not bm!61941) (not b!1261512) (not b_lambda!22791) (not b!1261526) (not b_lambda!22789) (not b!1261475) (not b_lambda!22793) tp_is_empty!32353)
(check-sat b_and!45353 (not b_next!27451))
