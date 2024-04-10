; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41946 () Bool)

(assert start!41946)

(declare-fun b_free!11535 () Bool)

(declare-fun b_next!11535 () Bool)

(assert (=> start!41946 (= b_free!11535 (not b_next!11535))))

(declare-fun tp!40618 () Bool)

(declare-fun b_and!19923 () Bool)

(assert (=> start!41946 (= tp!40618 b_and!19923)))

(declare-fun b!468326 () Bool)

(declare-fun e!274082 () Bool)

(declare-fun e!274085 () Bool)

(assert (=> b!468326 (= e!274082 (not e!274085))))

(declare-fun res!279900 () Bool)

(assert (=> b!468326 (=> res!279900 e!274085)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468326 (= res!279900 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18389 0))(
  ( (V!18390 (val!6526 Int)) )
))
(declare-datatypes ((tuple2!8576 0))(
  ( (tuple2!8577 (_1!4299 (_ BitVec 64)) (_2!4299 V!18389)) )
))
(declare-datatypes ((List!8663 0))(
  ( (Nil!8660) (Cons!8659 (h!9515 tuple2!8576) (t!14619 List!8663)) )
))
(declare-datatypes ((ListLongMap!7489 0))(
  ( (ListLongMap!7490 (toList!3760 List!8663)) )
))
(declare-fun lt!211776 () ListLongMap!7489)

(declare-fun lt!211778 () ListLongMap!7489)

(assert (=> b!468326 (= lt!211776 lt!211778)))

(declare-fun minValueBefore!38 () V!18389)

(declare-fun zeroValue!794 () V!18389)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13676 0))(
  ( (Unit!13677) )
))
(declare-fun lt!211779 () Unit!13676)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29701 0))(
  ( (array!29702 (arr!14277 (Array (_ BitVec 32) (_ BitVec 64))) (size!14629 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29701)

(declare-datatypes ((ValueCell!6138 0))(
  ( (ValueCellFull!6138 (v!8815 V!18389)) (EmptyCell!6138) )
))
(declare-datatypes ((array!29703 0))(
  ( (array!29704 (arr!14278 (Array (_ BitVec 32) ValueCell!6138)) (size!14630 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29703)

(declare-fun minValueAfter!38 () V!18389)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!112 (array!29701 array!29703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18389 V!18389 V!18389 V!18389 (_ BitVec 32) Int) Unit!13676)

(assert (=> b!468326 (= lt!211779 (lemmaNoChangeToArrayThenSameMapNoExtras!112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1932 (array!29701 array!29703 (_ BitVec 32) (_ BitVec 32) V!18389 V!18389 (_ BitVec 32) Int) ListLongMap!7489)

(assert (=> b!468326 (= lt!211778 (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468326 (= lt!211776 (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21136 () Bool)

(declare-fun mapRes!21136 () Bool)

(assert (=> mapIsEmpty!21136 mapRes!21136))

(declare-fun mapNonEmpty!21136 () Bool)

(declare-fun tp!40617 () Bool)

(declare-fun e!274086 () Bool)

(assert (=> mapNonEmpty!21136 (= mapRes!21136 (and tp!40617 e!274086))))

(declare-fun mapKey!21136 () (_ BitVec 32))

(declare-fun mapValue!21136 () ValueCell!6138)

(declare-fun mapRest!21136 () (Array (_ BitVec 32) ValueCell!6138))

(assert (=> mapNonEmpty!21136 (= (arr!14278 _values!833) (store mapRest!21136 mapKey!21136 mapValue!21136))))

(declare-fun b!468327 () Bool)

(declare-fun e!274087 () Bool)

(declare-fun e!274084 () Bool)

(assert (=> b!468327 (= e!274087 (and e!274084 mapRes!21136))))

(declare-fun condMapEmpty!21136 () Bool)

(declare-fun mapDefault!21136 () ValueCell!6138)

(assert (=> b!468327 (= condMapEmpty!21136 (= (arr!14278 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6138)) mapDefault!21136)))))

(declare-fun b!468328 () Bool)

(declare-fun res!279899 () Bool)

(assert (=> b!468328 (=> (not res!279899) (not e!274082))))

(assert (=> b!468328 (= res!279899 (and (= (size!14630 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14629 _keys!1025) (size!14630 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!279897 () Bool)

(assert (=> start!41946 (=> (not res!279897) (not e!274082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41946 (= res!279897 (validMask!0 mask!1365))))

(assert (=> start!41946 e!274082))

(declare-fun tp_is_empty!12963 () Bool)

(assert (=> start!41946 tp_is_empty!12963))

(assert (=> start!41946 tp!40618))

(assert (=> start!41946 true))

(declare-fun array_inv!10308 (array!29701) Bool)

(assert (=> start!41946 (array_inv!10308 _keys!1025)))

(declare-fun array_inv!10309 (array!29703) Bool)

(assert (=> start!41946 (and (array_inv!10309 _values!833) e!274087)))

(declare-fun b!468329 () Bool)

(assert (=> b!468329 (= e!274085 (bvsle #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(declare-fun lt!211777 () ListLongMap!7489)

(declare-fun getCurrentListMap!2187 (array!29701 array!29703 (_ BitVec 32) (_ BitVec 32) V!18389 V!18389 (_ BitVec 32) Int) ListLongMap!7489)

(assert (=> b!468329 (= lt!211777 (getCurrentListMap!2187 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468330 () Bool)

(declare-fun res!279898 () Bool)

(assert (=> b!468330 (=> (not res!279898) (not e!274082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29701 (_ BitVec 32)) Bool)

(assert (=> b!468330 (= res!279898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468331 () Bool)

(assert (=> b!468331 (= e!274086 tp_is_empty!12963)))

(declare-fun b!468332 () Bool)

(assert (=> b!468332 (= e!274084 tp_is_empty!12963)))

(declare-fun b!468333 () Bool)

(declare-fun res!279901 () Bool)

(assert (=> b!468333 (=> (not res!279901) (not e!274082))))

(declare-datatypes ((List!8664 0))(
  ( (Nil!8661) (Cons!8660 (h!9516 (_ BitVec 64)) (t!14620 List!8664)) )
))
(declare-fun arrayNoDuplicates!0 (array!29701 (_ BitVec 32) List!8664) Bool)

(assert (=> b!468333 (= res!279901 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8661))))

(assert (= (and start!41946 res!279897) b!468328))

(assert (= (and b!468328 res!279899) b!468330))

(assert (= (and b!468330 res!279898) b!468333))

(assert (= (and b!468333 res!279901) b!468326))

(assert (= (and b!468326 (not res!279900)) b!468329))

(assert (= (and b!468327 condMapEmpty!21136) mapIsEmpty!21136))

(assert (= (and b!468327 (not condMapEmpty!21136)) mapNonEmpty!21136))

(get-info :version)

(assert (= (and mapNonEmpty!21136 ((_ is ValueCellFull!6138) mapValue!21136)) b!468331))

(assert (= (and b!468327 ((_ is ValueCellFull!6138) mapDefault!21136)) b!468332))

(assert (= start!41946 b!468327))

(declare-fun m!450329 () Bool)

(assert (=> b!468330 m!450329))

(declare-fun m!450331 () Bool)

(assert (=> b!468326 m!450331))

(declare-fun m!450333 () Bool)

(assert (=> b!468326 m!450333))

(declare-fun m!450335 () Bool)

(assert (=> b!468326 m!450335))

(declare-fun m!450337 () Bool)

(assert (=> b!468333 m!450337))

(declare-fun m!450339 () Bool)

(assert (=> start!41946 m!450339))

(declare-fun m!450341 () Bool)

(assert (=> start!41946 m!450341))

(declare-fun m!450343 () Bool)

(assert (=> start!41946 m!450343))

(declare-fun m!450345 () Bool)

(assert (=> b!468329 m!450345))

(declare-fun m!450347 () Bool)

(assert (=> mapNonEmpty!21136 m!450347))

(check-sat tp_is_empty!12963 (not b!468333) (not mapNonEmpty!21136) (not b!468326) (not b_next!11535) b_and!19923 (not start!41946) (not b!468329) (not b!468330))
(check-sat b_and!19923 (not b_next!11535))
(get-model)

(declare-fun b!468366 () Bool)

(declare-fun e!274112 () Bool)

(declare-fun call!30327 () Bool)

(assert (=> b!468366 (= e!274112 call!30327)))

(declare-fun b!468367 () Bool)

(declare-fun e!274113 () Bool)

(assert (=> b!468367 (= e!274113 call!30327)))

(declare-fun d!75237 () Bool)

(declare-fun res!279921 () Bool)

(declare-fun e!274114 () Bool)

(assert (=> d!75237 (=> res!279921 e!274114)))

(assert (=> d!75237 (= res!279921 (bvsge #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(assert (=> d!75237 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!274114)))

(declare-fun b!468368 () Bool)

(assert (=> b!468368 (= e!274112 e!274113)))

(declare-fun lt!211798 () (_ BitVec 64))

(assert (=> b!468368 (= lt!211798 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211800 () Unit!13676)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29701 (_ BitVec 64) (_ BitVec 32)) Unit!13676)

(assert (=> b!468368 (= lt!211800 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!211798 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!468368 (arrayContainsKey!0 _keys!1025 lt!211798 #b00000000000000000000000000000000)))

(declare-fun lt!211799 () Unit!13676)

(assert (=> b!468368 (= lt!211799 lt!211800)))

(declare-fun res!279922 () Bool)

(declare-datatypes ((SeekEntryResult!3549 0))(
  ( (MissingZero!3549 (index!16375 (_ BitVec 32))) (Found!3549 (index!16376 (_ BitVec 32))) (Intermediate!3549 (undefined!4361 Bool) (index!16377 (_ BitVec 32)) (x!43836 (_ BitVec 32))) (Undefined!3549) (MissingVacant!3549 (index!16378 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29701 (_ BitVec 32)) SeekEntryResult!3549)

(assert (=> b!468368 (= res!279922 (= (seekEntryOrOpen!0 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3549 #b00000000000000000000000000000000)))))

(assert (=> b!468368 (=> (not res!279922) (not e!274113))))

(declare-fun bm!30324 () Bool)

(assert (=> bm!30324 (= call!30327 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!468369 () Bool)

(assert (=> b!468369 (= e!274114 e!274112)))

(declare-fun c!56813 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!468369 (= c!56813 (validKeyInArray!0 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75237 (not res!279921)) b!468369))

(assert (= (and b!468369 c!56813) b!468368))

(assert (= (and b!468369 (not c!56813)) b!468366))

(assert (= (and b!468368 res!279922) b!468367))

(assert (= (or b!468367 b!468366) bm!30324))

(declare-fun m!450369 () Bool)

(assert (=> b!468368 m!450369))

(declare-fun m!450371 () Bool)

(assert (=> b!468368 m!450371))

(declare-fun m!450373 () Bool)

(assert (=> b!468368 m!450373))

(assert (=> b!468368 m!450369))

(declare-fun m!450375 () Bool)

(assert (=> b!468368 m!450375))

(declare-fun m!450377 () Bool)

(assert (=> bm!30324 m!450377))

(assert (=> b!468369 m!450369))

(assert (=> b!468369 m!450369))

(declare-fun m!450379 () Bool)

(assert (=> b!468369 m!450379))

(assert (=> b!468330 d!75237))

(declare-fun d!75239 () Bool)

(assert (=> d!75239 (= (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211803 () Unit!13676)

(declare-fun choose!1342 (array!29701 array!29703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18389 V!18389 V!18389 V!18389 (_ BitVec 32) Int) Unit!13676)

(assert (=> d!75239 (= lt!211803 (choose!1342 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75239 (validMask!0 mask!1365)))

(assert (=> d!75239 (= (lemmaNoChangeToArrayThenSameMapNoExtras!112 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211803)))

(declare-fun bs!14834 () Bool)

(assert (= bs!14834 d!75239))

(assert (=> bs!14834 m!450335))

(assert (=> bs!14834 m!450333))

(declare-fun m!450381 () Bool)

(assert (=> bs!14834 m!450381))

(assert (=> bs!14834 m!450339))

(assert (=> b!468326 d!75239))

(declare-fun b!468394 () Bool)

(declare-fun lt!211818 () Unit!13676)

(declare-fun lt!211821 () Unit!13676)

(assert (=> b!468394 (= lt!211818 lt!211821)))

(declare-fun lt!211823 () V!18389)

(declare-fun lt!211824 () (_ BitVec 64))

(declare-fun lt!211822 () ListLongMap!7489)

(declare-fun lt!211820 () (_ BitVec 64))

(declare-fun contains!2532 (ListLongMap!7489 (_ BitVec 64)) Bool)

(declare-fun +!1674 (ListLongMap!7489 tuple2!8576) ListLongMap!7489)

(assert (=> b!468394 (not (contains!2532 (+!1674 lt!211822 (tuple2!8577 lt!211820 lt!211823)) lt!211824))))

(declare-fun addStillNotContains!158 (ListLongMap!7489 (_ BitVec 64) V!18389 (_ BitVec 64)) Unit!13676)

(assert (=> b!468394 (= lt!211821 (addStillNotContains!158 lt!211822 lt!211820 lt!211823 lt!211824))))

(assert (=> b!468394 (= lt!211824 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6982 (ValueCell!6138 V!18389) V!18389)

(declare-fun dynLambda!918 (Int (_ BitVec 64)) V!18389)

(assert (=> b!468394 (= lt!211823 (get!6982 (select (arr!14278 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!468394 (= lt!211820 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30330 () ListLongMap!7489)

(assert (=> b!468394 (= lt!211822 call!30330)))

(declare-fun e!274132 () ListLongMap!7489)

(assert (=> b!468394 (= e!274132 (+!1674 call!30330 (tuple2!8577 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000) (get!6982 (select (arr!14278 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!468395 () Bool)

(declare-fun e!274131 () ListLongMap!7489)

(assert (=> b!468395 (= e!274131 (ListLongMap!7490 Nil!8660))))

(declare-fun b!468396 () Bool)

(declare-fun e!274130 () Bool)

(declare-fun e!274135 () Bool)

(assert (=> b!468396 (= e!274130 e!274135)))

(declare-fun c!56823 () Bool)

(assert (=> b!468396 (= c!56823 (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(declare-fun bm!30327 () Bool)

(assert (=> bm!30327 (= call!30330 (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!468397 () Bool)

(assert (=> b!468397 (= e!274131 e!274132)))

(declare-fun c!56824 () Bool)

(assert (=> b!468397 (= c!56824 (validKeyInArray!0 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468398 () Bool)

(declare-fun e!274133 () Bool)

(assert (=> b!468398 (= e!274133 (validKeyInArray!0 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468398 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!468399 () Bool)

(declare-fun e!274134 () Bool)

(assert (=> b!468399 (= e!274134 e!274130)))

(declare-fun c!56825 () Bool)

(assert (=> b!468399 (= c!56825 e!274133)))

(declare-fun res!279931 () Bool)

(assert (=> b!468399 (=> (not res!279931) (not e!274133))))

(assert (=> b!468399 (= res!279931 (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(declare-fun b!468400 () Bool)

(declare-fun lt!211819 () ListLongMap!7489)

(assert (=> b!468400 (= e!274135 (= lt!211819 (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!468401 () Bool)

(declare-fun isEmpty!572 (ListLongMap!7489) Bool)

(assert (=> b!468401 (= e!274135 (isEmpty!572 lt!211819))))

(declare-fun b!468402 () Bool)

(declare-fun res!279932 () Bool)

(assert (=> b!468402 (=> (not res!279932) (not e!274134))))

(assert (=> b!468402 (= res!279932 (not (contains!2532 lt!211819 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!468403 () Bool)

(declare-fun e!274129 () Bool)

(assert (=> b!468403 (= e!274130 e!274129)))

(assert (=> b!468403 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(declare-fun res!279933 () Bool)

(assert (=> b!468403 (= res!279933 (contains!2532 lt!211819 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468403 (=> (not res!279933) (not e!274129))))

(declare-fun d!75241 () Bool)

(assert (=> d!75241 e!274134))

(declare-fun res!279934 () Bool)

(assert (=> d!75241 (=> (not res!279934) (not e!274134))))

(assert (=> d!75241 (= res!279934 (not (contains!2532 lt!211819 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75241 (= lt!211819 e!274131)))

(declare-fun c!56822 () Bool)

(assert (=> d!75241 (= c!56822 (bvsge #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(assert (=> d!75241 (validMask!0 mask!1365)))

(assert (=> d!75241 (= (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211819)))

(declare-fun b!468404 () Bool)

(assert (=> b!468404 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(assert (=> b!468404 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14630 _values!833)))))

(declare-fun apply!325 (ListLongMap!7489 (_ BitVec 64)) V!18389)

(assert (=> b!468404 (= e!274129 (= (apply!325 lt!211819 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)) (get!6982 (select (arr!14278 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!468405 () Bool)

(assert (=> b!468405 (= e!274132 call!30330)))

(assert (= (and d!75241 c!56822) b!468395))

(assert (= (and d!75241 (not c!56822)) b!468397))

(assert (= (and b!468397 c!56824) b!468394))

(assert (= (and b!468397 (not c!56824)) b!468405))

(assert (= (or b!468394 b!468405) bm!30327))

(assert (= (and d!75241 res!279934) b!468402))

(assert (= (and b!468402 res!279932) b!468399))

(assert (= (and b!468399 res!279931) b!468398))

(assert (= (and b!468399 c!56825) b!468403))

(assert (= (and b!468399 (not c!56825)) b!468396))

(assert (= (and b!468403 res!279933) b!468404))

(assert (= (and b!468396 c!56823) b!468400))

(assert (= (and b!468396 (not c!56823)) b!468401))

(declare-fun b_lambda!10069 () Bool)

(assert (=> (not b_lambda!10069) (not b!468394)))

(declare-fun t!14624 () Bool)

(declare-fun tb!3915 () Bool)

(assert (=> (and start!41946 (= defaultEntry!841 defaultEntry!841) t!14624) tb!3915))

(declare-fun result!7403 () Bool)

(assert (=> tb!3915 (= result!7403 tp_is_empty!12963)))

(assert (=> b!468394 t!14624))

(declare-fun b_and!19927 () Bool)

(assert (= b_and!19923 (and (=> t!14624 result!7403) b_and!19927)))

(declare-fun b_lambda!10071 () Bool)

(assert (=> (not b_lambda!10071) (not b!468404)))

(assert (=> b!468404 t!14624))

(declare-fun b_and!19929 () Bool)

(assert (= b_and!19927 (and (=> t!14624 result!7403) b_and!19929)))

(declare-fun m!450383 () Bool)

(assert (=> d!75241 m!450383))

(assert (=> d!75241 m!450339))

(declare-fun m!450385 () Bool)

(assert (=> bm!30327 m!450385))

(assert (=> b!468398 m!450369))

(assert (=> b!468398 m!450369))

(assert (=> b!468398 m!450379))

(assert (=> b!468397 m!450369))

(assert (=> b!468397 m!450369))

(assert (=> b!468397 m!450379))

(declare-fun m!450387 () Bool)

(assert (=> b!468394 m!450387))

(declare-fun m!450389 () Bool)

(assert (=> b!468394 m!450389))

(declare-fun m!450391 () Bool)

(assert (=> b!468394 m!450391))

(declare-fun m!450393 () Bool)

(assert (=> b!468394 m!450393))

(assert (=> b!468394 m!450387))

(assert (=> b!468394 m!450391))

(declare-fun m!450395 () Bool)

(assert (=> b!468394 m!450395))

(assert (=> b!468394 m!450393))

(declare-fun m!450397 () Bool)

(assert (=> b!468394 m!450397))

(assert (=> b!468394 m!450369))

(declare-fun m!450399 () Bool)

(assert (=> b!468394 m!450399))

(assert (=> b!468404 m!450387))

(assert (=> b!468404 m!450369))

(assert (=> b!468404 m!450369))

(declare-fun m!450401 () Bool)

(assert (=> b!468404 m!450401))

(assert (=> b!468404 m!450391))

(assert (=> b!468404 m!450387))

(assert (=> b!468404 m!450391))

(assert (=> b!468404 m!450395))

(assert (=> b!468400 m!450385))

(declare-fun m!450403 () Bool)

(assert (=> b!468402 m!450403))

(declare-fun m!450405 () Bool)

(assert (=> b!468401 m!450405))

(assert (=> b!468403 m!450369))

(assert (=> b!468403 m!450369))

(declare-fun m!450407 () Bool)

(assert (=> b!468403 m!450407))

(assert (=> b!468326 d!75241))

(declare-fun b!468408 () Bool)

(declare-fun lt!211825 () Unit!13676)

(declare-fun lt!211828 () Unit!13676)

(assert (=> b!468408 (= lt!211825 lt!211828)))

(declare-fun lt!211827 () (_ BitVec 64))

(declare-fun lt!211830 () V!18389)

(declare-fun lt!211829 () ListLongMap!7489)

(declare-fun lt!211831 () (_ BitVec 64))

(assert (=> b!468408 (not (contains!2532 (+!1674 lt!211829 (tuple2!8577 lt!211827 lt!211830)) lt!211831))))

(assert (=> b!468408 (= lt!211828 (addStillNotContains!158 lt!211829 lt!211827 lt!211830 lt!211831))))

(assert (=> b!468408 (= lt!211831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!468408 (= lt!211830 (get!6982 (select (arr!14278 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!468408 (= lt!211827 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30331 () ListLongMap!7489)

(assert (=> b!468408 (= lt!211829 call!30331)))

(declare-fun e!274139 () ListLongMap!7489)

(assert (=> b!468408 (= e!274139 (+!1674 call!30331 (tuple2!8577 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000) (get!6982 (select (arr!14278 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!468409 () Bool)

(declare-fun e!274138 () ListLongMap!7489)

(assert (=> b!468409 (= e!274138 (ListLongMap!7490 Nil!8660))))

(declare-fun b!468410 () Bool)

(declare-fun e!274137 () Bool)

(declare-fun e!274142 () Bool)

(assert (=> b!468410 (= e!274137 e!274142)))

(declare-fun c!56827 () Bool)

(assert (=> b!468410 (= c!56827 (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(declare-fun bm!30328 () Bool)

(assert (=> bm!30328 (= call!30331 (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!468411 () Bool)

(assert (=> b!468411 (= e!274138 e!274139)))

(declare-fun c!56828 () Bool)

(assert (=> b!468411 (= c!56828 (validKeyInArray!0 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468412 () Bool)

(declare-fun e!274140 () Bool)

(assert (=> b!468412 (= e!274140 (validKeyInArray!0 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468412 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!468413 () Bool)

(declare-fun e!274141 () Bool)

(assert (=> b!468413 (= e!274141 e!274137)))

(declare-fun c!56829 () Bool)

(assert (=> b!468413 (= c!56829 e!274140)))

(declare-fun res!279935 () Bool)

(assert (=> b!468413 (=> (not res!279935) (not e!274140))))

(assert (=> b!468413 (= res!279935 (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(declare-fun lt!211826 () ListLongMap!7489)

(declare-fun b!468414 () Bool)

(assert (=> b!468414 (= e!274142 (= lt!211826 (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!468415 () Bool)

(assert (=> b!468415 (= e!274142 (isEmpty!572 lt!211826))))

(declare-fun b!468416 () Bool)

(declare-fun res!279936 () Bool)

(assert (=> b!468416 (=> (not res!279936) (not e!274141))))

(assert (=> b!468416 (= res!279936 (not (contains!2532 lt!211826 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!468417 () Bool)

(declare-fun e!274136 () Bool)

(assert (=> b!468417 (= e!274137 e!274136)))

(assert (=> b!468417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(declare-fun res!279937 () Bool)

(assert (=> b!468417 (= res!279937 (contains!2532 lt!211826 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468417 (=> (not res!279937) (not e!274136))))

(declare-fun d!75243 () Bool)

(assert (=> d!75243 e!274141))

(declare-fun res!279938 () Bool)

(assert (=> d!75243 (=> (not res!279938) (not e!274141))))

(assert (=> d!75243 (= res!279938 (not (contains!2532 lt!211826 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75243 (= lt!211826 e!274138)))

(declare-fun c!56826 () Bool)

(assert (=> d!75243 (= c!56826 (bvsge #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(assert (=> d!75243 (validMask!0 mask!1365)))

(assert (=> d!75243 (= (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211826)))

(declare-fun b!468418 () Bool)

(assert (=> b!468418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(assert (=> b!468418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14630 _values!833)))))

(assert (=> b!468418 (= e!274136 (= (apply!325 lt!211826 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)) (get!6982 (select (arr!14278 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!468419 () Bool)

(assert (=> b!468419 (= e!274139 call!30331)))

(assert (= (and d!75243 c!56826) b!468409))

(assert (= (and d!75243 (not c!56826)) b!468411))

(assert (= (and b!468411 c!56828) b!468408))

(assert (= (and b!468411 (not c!56828)) b!468419))

(assert (= (or b!468408 b!468419) bm!30328))

(assert (= (and d!75243 res!279938) b!468416))

(assert (= (and b!468416 res!279936) b!468413))

(assert (= (and b!468413 res!279935) b!468412))

(assert (= (and b!468413 c!56829) b!468417))

(assert (= (and b!468413 (not c!56829)) b!468410))

(assert (= (and b!468417 res!279937) b!468418))

(assert (= (and b!468410 c!56827) b!468414))

(assert (= (and b!468410 (not c!56827)) b!468415))

(declare-fun b_lambda!10073 () Bool)

(assert (=> (not b_lambda!10073) (not b!468408)))

(assert (=> b!468408 t!14624))

(declare-fun b_and!19931 () Bool)

(assert (= b_and!19929 (and (=> t!14624 result!7403) b_and!19931)))

(declare-fun b_lambda!10075 () Bool)

(assert (=> (not b_lambda!10075) (not b!468418)))

(assert (=> b!468418 t!14624))

(declare-fun b_and!19933 () Bool)

(assert (= b_and!19931 (and (=> t!14624 result!7403) b_and!19933)))

(declare-fun m!450409 () Bool)

(assert (=> d!75243 m!450409))

(assert (=> d!75243 m!450339))

(declare-fun m!450411 () Bool)

(assert (=> bm!30328 m!450411))

(assert (=> b!468412 m!450369))

(assert (=> b!468412 m!450369))

(assert (=> b!468412 m!450379))

(assert (=> b!468411 m!450369))

(assert (=> b!468411 m!450369))

(assert (=> b!468411 m!450379))

(assert (=> b!468408 m!450387))

(declare-fun m!450413 () Bool)

(assert (=> b!468408 m!450413))

(assert (=> b!468408 m!450391))

(declare-fun m!450415 () Bool)

(assert (=> b!468408 m!450415))

(assert (=> b!468408 m!450387))

(assert (=> b!468408 m!450391))

(assert (=> b!468408 m!450395))

(assert (=> b!468408 m!450415))

(declare-fun m!450417 () Bool)

(assert (=> b!468408 m!450417))

(assert (=> b!468408 m!450369))

(declare-fun m!450419 () Bool)

(assert (=> b!468408 m!450419))

(assert (=> b!468418 m!450387))

(assert (=> b!468418 m!450369))

(assert (=> b!468418 m!450369))

(declare-fun m!450421 () Bool)

(assert (=> b!468418 m!450421))

(assert (=> b!468418 m!450391))

(assert (=> b!468418 m!450387))

(assert (=> b!468418 m!450391))

(assert (=> b!468418 m!450395))

(assert (=> b!468414 m!450411))

(declare-fun m!450423 () Bool)

(assert (=> b!468416 m!450423))

(declare-fun m!450425 () Bool)

(assert (=> b!468415 m!450425))

(assert (=> b!468417 m!450369))

(assert (=> b!468417 m!450369))

(declare-fun m!450427 () Bool)

(assert (=> b!468417 m!450427))

(assert (=> b!468326 d!75243))

(declare-fun b!468462 () Bool)

(declare-fun res!279962 () Bool)

(declare-fun e!274169 () Bool)

(assert (=> b!468462 (=> (not res!279962) (not e!274169))))

(declare-fun e!274170 () Bool)

(assert (=> b!468462 (= res!279962 e!274170)))

(declare-fun c!56844 () Bool)

(assert (=> b!468462 (= c!56844 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!468463 () Bool)

(declare-fun e!274179 () ListLongMap!7489)

(declare-fun e!274173 () ListLongMap!7489)

(assert (=> b!468463 (= e!274179 e!274173)))

(declare-fun c!56846 () Bool)

(assert (=> b!468463 (= c!56846 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!468464 () Bool)

(declare-fun call!30349 () ListLongMap!7489)

(assert (=> b!468464 (= e!274173 call!30349)))

(declare-fun call!30348 () ListLongMap!7489)

(declare-fun bm!30343 () Bool)

(assert (=> bm!30343 (= call!30348 (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468465 () Bool)

(declare-fun e!274181 () Bool)

(declare-fun lt!211888 () ListLongMap!7489)

(assert (=> b!468465 (= e!274181 (= (apply!325 lt!211888 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!468466 () Bool)

(declare-fun c!56842 () Bool)

(assert (=> b!468466 (= c!56842 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!274172 () ListLongMap!7489)

(assert (=> b!468466 (= e!274173 e!274172)))

(declare-fun b!468467 () Bool)

(declare-fun e!274175 () Bool)

(assert (=> b!468467 (= e!274175 (validKeyInArray!0 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30344 () Bool)

(declare-fun call!30347 () ListLongMap!7489)

(assert (=> bm!30344 (= call!30347 call!30348)))

(declare-fun b!468468 () Bool)

(declare-fun e!274178 () Bool)

(assert (=> b!468468 (= e!274169 e!274178)))

(declare-fun c!56843 () Bool)

(assert (=> b!468468 (= c!56843 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!468469 () Bool)

(declare-fun call!30350 () Bool)

(assert (=> b!468469 (= e!274170 (not call!30350))))

(declare-fun b!468470 () Bool)

(declare-fun e!274174 () Bool)

(assert (=> b!468470 (= e!274174 (= (apply!325 lt!211888 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!468471 () Bool)

(declare-fun e!274177 () Unit!13676)

(declare-fun lt!211893 () Unit!13676)

(assert (=> b!468471 (= e!274177 lt!211893)))

(declare-fun lt!211882 () ListLongMap!7489)

(assert (=> b!468471 (= lt!211882 (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211891 () (_ BitVec 64))

(assert (=> b!468471 (= lt!211891 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211876 () (_ BitVec 64))

(assert (=> b!468471 (= lt!211876 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211896 () Unit!13676)

(declare-fun addStillContains!287 (ListLongMap!7489 (_ BitVec 64) V!18389 (_ BitVec 64)) Unit!13676)

(assert (=> b!468471 (= lt!211896 (addStillContains!287 lt!211882 lt!211891 zeroValue!794 lt!211876))))

(assert (=> b!468471 (contains!2532 (+!1674 lt!211882 (tuple2!8577 lt!211891 zeroValue!794)) lt!211876)))

(declare-fun lt!211885 () Unit!13676)

(assert (=> b!468471 (= lt!211885 lt!211896)))

(declare-fun lt!211895 () ListLongMap!7489)

(assert (=> b!468471 (= lt!211895 (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211887 () (_ BitVec 64))

(assert (=> b!468471 (= lt!211887 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211889 () (_ BitVec 64))

(assert (=> b!468471 (= lt!211889 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211894 () Unit!13676)

(declare-fun addApplyDifferent!287 (ListLongMap!7489 (_ BitVec 64) V!18389 (_ BitVec 64)) Unit!13676)

(assert (=> b!468471 (= lt!211894 (addApplyDifferent!287 lt!211895 lt!211887 minValueBefore!38 lt!211889))))

(assert (=> b!468471 (= (apply!325 (+!1674 lt!211895 (tuple2!8577 lt!211887 minValueBefore!38)) lt!211889) (apply!325 lt!211895 lt!211889))))

(declare-fun lt!211881 () Unit!13676)

(assert (=> b!468471 (= lt!211881 lt!211894)))

(declare-fun lt!211877 () ListLongMap!7489)

(assert (=> b!468471 (= lt!211877 (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211886 () (_ BitVec 64))

(assert (=> b!468471 (= lt!211886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211880 () (_ BitVec 64))

(assert (=> b!468471 (= lt!211880 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211884 () Unit!13676)

(assert (=> b!468471 (= lt!211884 (addApplyDifferent!287 lt!211877 lt!211886 zeroValue!794 lt!211880))))

(assert (=> b!468471 (= (apply!325 (+!1674 lt!211877 (tuple2!8577 lt!211886 zeroValue!794)) lt!211880) (apply!325 lt!211877 lt!211880))))

(declare-fun lt!211897 () Unit!13676)

(assert (=> b!468471 (= lt!211897 lt!211884)))

(declare-fun lt!211892 () ListLongMap!7489)

(assert (=> b!468471 (= lt!211892 (getCurrentListMapNoExtraKeys!1932 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211883 () (_ BitVec 64))

(assert (=> b!468471 (= lt!211883 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211878 () (_ BitVec 64))

(assert (=> b!468471 (= lt!211878 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!468471 (= lt!211893 (addApplyDifferent!287 lt!211892 lt!211883 minValueBefore!38 lt!211878))))

(assert (=> b!468471 (= (apply!325 (+!1674 lt!211892 (tuple2!8577 lt!211883 minValueBefore!38)) lt!211878) (apply!325 lt!211892 lt!211878))))

(declare-fun d!75245 () Bool)

(assert (=> d!75245 e!274169))

(declare-fun res!279964 () Bool)

(assert (=> d!75245 (=> (not res!279964) (not e!274169))))

(assert (=> d!75245 (= res!279964 (or (bvsge #b00000000000000000000000000000000 (size!14629 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))))

(declare-fun lt!211879 () ListLongMap!7489)

(assert (=> d!75245 (= lt!211888 lt!211879)))

(declare-fun lt!211890 () Unit!13676)

(assert (=> d!75245 (= lt!211890 e!274177)))

(declare-fun c!56845 () Bool)

(declare-fun e!274176 () Bool)

(assert (=> d!75245 (= c!56845 e!274176)))

(declare-fun res!279958 () Bool)

(assert (=> d!75245 (=> (not res!279958) (not e!274176))))

(assert (=> d!75245 (= res!279958 (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(assert (=> d!75245 (= lt!211879 e!274179)))

(declare-fun c!56847 () Bool)

(assert (=> d!75245 (= c!56847 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75245 (validMask!0 mask!1365)))

(assert (=> d!75245 (= (getCurrentListMap!2187 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211888)))

(declare-fun b!468472 () Bool)

(declare-fun e!274171 () Bool)

(declare-fun e!274180 () Bool)

(assert (=> b!468472 (= e!274171 e!274180)))

(declare-fun res!279963 () Bool)

(assert (=> b!468472 (=> (not res!279963) (not e!274180))))

(assert (=> b!468472 (= res!279963 (contains!2532 lt!211888 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468472 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(declare-fun bm!30345 () Bool)

(assert (=> bm!30345 (= call!30350 (contains!2532 lt!211888 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!468473 () Bool)

(declare-fun call!30346 () ListLongMap!7489)

(assert (=> b!468473 (= e!274172 call!30346)))

(declare-fun bm!30346 () Bool)

(declare-fun call!30351 () ListLongMap!7489)

(assert (=> bm!30346 (= call!30351 (+!1674 (ite c!56847 call!30348 (ite c!56846 call!30347 call!30346)) (ite (or c!56847 c!56846) (tuple2!8577 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8577 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!468474 () Bool)

(declare-fun Unit!13678 () Unit!13676)

(assert (=> b!468474 (= e!274177 Unit!13678)))

(declare-fun b!468475 () Bool)

(assert (=> b!468475 (= e!274172 call!30349)))

(declare-fun b!468476 () Bool)

(declare-fun call!30352 () Bool)

(assert (=> b!468476 (= e!274178 (not call!30352))))

(declare-fun b!468477 () Bool)

(assert (=> b!468477 (= e!274180 (= (apply!325 lt!211888 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)) (get!6982 (select (arr!14278 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!468477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14630 _values!833)))))

(assert (=> b!468477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(declare-fun b!468478 () Bool)

(declare-fun res!279957 () Bool)

(assert (=> b!468478 (=> (not res!279957) (not e!274169))))

(assert (=> b!468478 (= res!279957 e!274171)))

(declare-fun res!279965 () Bool)

(assert (=> b!468478 (=> res!279965 e!274171)))

(assert (=> b!468478 (= res!279965 (not e!274175))))

(declare-fun res!279959 () Bool)

(assert (=> b!468478 (=> (not res!279959) (not e!274175))))

(assert (=> b!468478 (= res!279959 (bvslt #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(declare-fun b!468479 () Bool)

(assert (=> b!468479 (= e!274179 (+!1674 call!30351 (tuple2!8577 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun bm!30347 () Bool)

(assert (=> bm!30347 (= call!30349 call!30351)))

(declare-fun b!468480 () Bool)

(assert (=> b!468480 (= e!274170 e!274181)))

(declare-fun res!279960 () Bool)

(assert (=> b!468480 (= res!279960 call!30350)))

(assert (=> b!468480 (=> (not res!279960) (not e!274181))))

(declare-fun bm!30348 () Bool)

(assert (=> bm!30348 (= call!30352 (contains!2532 lt!211888 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30349 () Bool)

(assert (=> bm!30349 (= call!30346 call!30347)))

(declare-fun b!468481 () Bool)

(assert (=> b!468481 (= e!274178 e!274174)))

(declare-fun res!279961 () Bool)

(assert (=> b!468481 (= res!279961 call!30352)))

(assert (=> b!468481 (=> (not res!279961) (not e!274174))))

(declare-fun b!468482 () Bool)

(assert (=> b!468482 (= e!274176 (validKeyInArray!0 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75245 c!56847) b!468479))

(assert (= (and d!75245 (not c!56847)) b!468463))

(assert (= (and b!468463 c!56846) b!468464))

(assert (= (and b!468463 (not c!56846)) b!468466))

(assert (= (and b!468466 c!56842) b!468475))

(assert (= (and b!468466 (not c!56842)) b!468473))

(assert (= (or b!468475 b!468473) bm!30349))

(assert (= (or b!468464 bm!30349) bm!30344))

(assert (= (or b!468464 b!468475) bm!30347))

(assert (= (or b!468479 bm!30344) bm!30343))

(assert (= (or b!468479 bm!30347) bm!30346))

(assert (= (and d!75245 res!279958) b!468482))

(assert (= (and d!75245 c!56845) b!468471))

(assert (= (and d!75245 (not c!56845)) b!468474))

(assert (= (and d!75245 res!279964) b!468478))

(assert (= (and b!468478 res!279959) b!468467))

(assert (= (and b!468478 (not res!279965)) b!468472))

(assert (= (and b!468472 res!279963) b!468477))

(assert (= (and b!468478 res!279957) b!468462))

(assert (= (and b!468462 c!56844) b!468480))

(assert (= (and b!468462 (not c!56844)) b!468469))

(assert (= (and b!468480 res!279960) b!468465))

(assert (= (or b!468480 b!468469) bm!30345))

(assert (= (and b!468462 res!279962) b!468468))

(assert (= (and b!468468 c!56843) b!468481))

(assert (= (and b!468468 (not c!56843)) b!468476))

(assert (= (and b!468481 res!279961) b!468470))

(assert (= (or b!468481 b!468476) bm!30348))

(declare-fun b_lambda!10077 () Bool)

(assert (=> (not b_lambda!10077) (not b!468477)))

(assert (=> b!468477 t!14624))

(declare-fun b_and!19935 () Bool)

(assert (= b_and!19933 (and (=> t!14624 result!7403) b_and!19935)))

(declare-fun m!450429 () Bool)

(assert (=> bm!30346 m!450429))

(declare-fun m!450431 () Bool)

(assert (=> b!468470 m!450431))

(assert (=> b!468477 m!450387))

(assert (=> b!468477 m!450391))

(assert (=> b!468477 m!450395))

(assert (=> b!468477 m!450369))

(assert (=> b!468477 m!450369))

(declare-fun m!450433 () Bool)

(assert (=> b!468477 m!450433))

(assert (=> b!468477 m!450391))

(assert (=> b!468477 m!450387))

(declare-fun m!450435 () Bool)

(assert (=> bm!30348 m!450435))

(declare-fun m!450437 () Bool)

(assert (=> bm!30345 m!450437))

(assert (=> b!468472 m!450369))

(assert (=> b!468472 m!450369))

(declare-fun m!450439 () Bool)

(assert (=> b!468472 m!450439))

(assert (=> b!468482 m!450369))

(assert (=> b!468482 m!450369))

(assert (=> b!468482 m!450379))

(assert (=> b!468471 m!450369))

(declare-fun m!450441 () Bool)

(assert (=> b!468471 m!450441))

(declare-fun m!450443 () Bool)

(assert (=> b!468471 m!450443))

(declare-fun m!450445 () Bool)

(assert (=> b!468471 m!450445))

(declare-fun m!450447 () Bool)

(assert (=> b!468471 m!450447))

(declare-fun m!450449 () Bool)

(assert (=> b!468471 m!450449))

(declare-fun m!450451 () Bool)

(assert (=> b!468471 m!450451))

(declare-fun m!450453 () Bool)

(assert (=> b!468471 m!450453))

(declare-fun m!450455 () Bool)

(assert (=> b!468471 m!450455))

(declare-fun m!450457 () Bool)

(assert (=> b!468471 m!450457))

(assert (=> b!468471 m!450447))

(declare-fun m!450459 () Bool)

(assert (=> b!468471 m!450459))

(assert (=> b!468471 m!450335))

(declare-fun m!450461 () Bool)

(assert (=> b!468471 m!450461))

(assert (=> b!468471 m!450449))

(declare-fun m!450463 () Bool)

(assert (=> b!468471 m!450463))

(declare-fun m!450465 () Bool)

(assert (=> b!468471 m!450465))

(declare-fun m!450467 () Bool)

(assert (=> b!468471 m!450467))

(assert (=> b!468471 m!450443))

(assert (=> b!468471 m!450463))

(declare-fun m!450469 () Bool)

(assert (=> b!468471 m!450469))

(declare-fun m!450471 () Bool)

(assert (=> b!468479 m!450471))

(assert (=> b!468467 m!450369))

(assert (=> b!468467 m!450369))

(assert (=> b!468467 m!450379))

(declare-fun m!450473 () Bool)

(assert (=> b!468465 m!450473))

(assert (=> d!75245 m!450339))

(assert (=> bm!30343 m!450335))

(assert (=> b!468329 d!75245))

(declare-fun d!75247 () Bool)

(assert (=> d!75247 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41946 d!75247))

(declare-fun d!75249 () Bool)

(assert (=> d!75249 (= (array_inv!10308 _keys!1025) (bvsge (size!14629 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41946 d!75249))

(declare-fun d!75251 () Bool)

(assert (=> d!75251 (= (array_inv!10309 _values!833) (bvsge (size!14630 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41946 d!75251))

(declare-fun d!75253 () Bool)

(declare-fun res!279972 () Bool)

(declare-fun e!274191 () Bool)

(assert (=> d!75253 (=> res!279972 e!274191)))

(assert (=> d!75253 (= res!279972 (bvsge #b00000000000000000000000000000000 (size!14629 _keys!1025)))))

(assert (=> d!75253 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8661) e!274191)))

(declare-fun b!468493 () Bool)

(declare-fun e!274193 () Bool)

(declare-fun contains!2533 (List!8664 (_ BitVec 64)) Bool)

(assert (=> b!468493 (= e!274193 (contains!2533 Nil!8661 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30352 () Bool)

(declare-fun call!30355 () Bool)

(declare-fun c!56850 () Bool)

(assert (=> bm!30352 (= call!30355 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56850 (Cons!8660 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000) Nil!8661) Nil!8661)))))

(declare-fun b!468494 () Bool)

(declare-fun e!274190 () Bool)

(assert (=> b!468494 (= e!274191 e!274190)))

(declare-fun res!279973 () Bool)

(assert (=> b!468494 (=> (not res!279973) (not e!274190))))

(assert (=> b!468494 (= res!279973 (not e!274193))))

(declare-fun res!279974 () Bool)

(assert (=> b!468494 (=> (not res!279974) (not e!274193))))

(assert (=> b!468494 (= res!279974 (validKeyInArray!0 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468495 () Bool)

(declare-fun e!274192 () Bool)

(assert (=> b!468495 (= e!274192 call!30355)))

(declare-fun b!468496 () Bool)

(assert (=> b!468496 (= e!274190 e!274192)))

(assert (=> b!468496 (= c!56850 (validKeyInArray!0 (select (arr!14277 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468497 () Bool)

(assert (=> b!468497 (= e!274192 call!30355)))

(assert (= (and d!75253 (not res!279972)) b!468494))

(assert (= (and b!468494 res!279974) b!468493))

(assert (= (and b!468494 res!279973) b!468496))

(assert (= (and b!468496 c!56850) b!468497))

(assert (= (and b!468496 (not c!56850)) b!468495))

(assert (= (or b!468497 b!468495) bm!30352))

(assert (=> b!468493 m!450369))

(assert (=> b!468493 m!450369))

(declare-fun m!450475 () Bool)

(assert (=> b!468493 m!450475))

(assert (=> bm!30352 m!450369))

(declare-fun m!450477 () Bool)

(assert (=> bm!30352 m!450477))

(assert (=> b!468494 m!450369))

(assert (=> b!468494 m!450369))

(assert (=> b!468494 m!450379))

(assert (=> b!468496 m!450369))

(assert (=> b!468496 m!450369))

(assert (=> b!468496 m!450379))

(assert (=> b!468333 d!75253))

(declare-fun condMapEmpty!21142 () Bool)

(declare-fun mapDefault!21142 () ValueCell!6138)

(assert (=> mapNonEmpty!21136 (= condMapEmpty!21142 (= mapRest!21136 ((as const (Array (_ BitVec 32) ValueCell!6138)) mapDefault!21142)))))

(declare-fun e!274198 () Bool)

(declare-fun mapRes!21142 () Bool)

(assert (=> mapNonEmpty!21136 (= tp!40617 (and e!274198 mapRes!21142))))

(declare-fun mapIsEmpty!21142 () Bool)

(assert (=> mapIsEmpty!21142 mapRes!21142))

(declare-fun b!468504 () Bool)

(declare-fun e!274199 () Bool)

(assert (=> b!468504 (= e!274199 tp_is_empty!12963)))

(declare-fun mapNonEmpty!21142 () Bool)

(declare-fun tp!40627 () Bool)

(assert (=> mapNonEmpty!21142 (= mapRes!21142 (and tp!40627 e!274199))))

(declare-fun mapValue!21142 () ValueCell!6138)

(declare-fun mapRest!21142 () (Array (_ BitVec 32) ValueCell!6138))

(declare-fun mapKey!21142 () (_ BitVec 32))

(assert (=> mapNonEmpty!21142 (= mapRest!21136 (store mapRest!21142 mapKey!21142 mapValue!21142))))

(declare-fun b!468505 () Bool)

(assert (=> b!468505 (= e!274198 tp_is_empty!12963)))

(assert (= (and mapNonEmpty!21136 condMapEmpty!21142) mapIsEmpty!21142))

(assert (= (and mapNonEmpty!21136 (not condMapEmpty!21142)) mapNonEmpty!21142))

(assert (= (and mapNonEmpty!21142 ((_ is ValueCellFull!6138) mapValue!21142)) b!468504))

(assert (= (and mapNonEmpty!21136 ((_ is ValueCellFull!6138) mapDefault!21142)) b!468505))

(declare-fun m!450479 () Bool)

(assert (=> mapNonEmpty!21142 m!450479))

(declare-fun b_lambda!10079 () Bool)

(assert (= b_lambda!10075 (or (and start!41946 b_free!11535) b_lambda!10079)))

(declare-fun b_lambda!10081 () Bool)

(assert (= b_lambda!10073 (or (and start!41946 b_free!11535) b_lambda!10081)))

(declare-fun b_lambda!10083 () Bool)

(assert (= b_lambda!10069 (or (and start!41946 b_free!11535) b_lambda!10083)))

(declare-fun b_lambda!10085 () Bool)

(assert (= b_lambda!10077 (or (and start!41946 b_free!11535) b_lambda!10085)))

(declare-fun b_lambda!10087 () Bool)

(assert (= b_lambda!10071 (or (and start!41946 b_free!11535) b_lambda!10087)))

(check-sat (not mapNonEmpty!21142) (not b!468470) (not d!75241) (not bm!30348) (not b!468398) (not b!468465) (not b!468471) (not b!468418) (not b!468414) (not b!468472) (not b_lambda!10083) (not b!468479) (not b_lambda!10087) (not b!468404) tp_is_empty!12963 (not b!468402) (not b!468496) (not d!75239) (not b!468412) (not b!468493) (not b!468368) (not b!468408) (not b!468482) (not b!468415) (not b_lambda!10081) (not b!468494) (not d!75243) (not bm!30345) (not d!75245) (not b_lambda!10085) (not b_lambda!10079) (not bm!30352) (not bm!30343) (not b!468403) (not b!468411) (not b!468394) (not bm!30346) (not b!468397) (not b!468401) (not b_next!11535) (not b!468467) (not b!468416) b_and!19935 (not b!468400) (not bm!30328) (not bm!30324) (not b!468369) (not b!468477) (not b!468417) (not bm!30327))
(check-sat b_and!19935 (not b_next!11535))
