; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42368 () Bool)

(assert start!42368)

(declare-fun b_free!11859 () Bool)

(declare-fun b_next!11859 () Bool)

(assert (=> start!42368 (= b_free!11859 (not b_next!11859))))

(declare-fun tp!41607 () Bool)

(declare-fun b_and!20305 () Bool)

(assert (=> start!42368 (= tp!41607 b_and!20305)))

(declare-fun mapIsEmpty!21640 () Bool)

(declare-fun mapRes!21640 () Bool)

(assert (=> mapIsEmpty!21640 mapRes!21640))

(declare-fun b!472732 () Bool)

(declare-fun e!277243 () Bool)

(declare-fun e!277242 () Bool)

(assert (=> b!472732 (= e!277243 (not e!277242))))

(declare-fun res!282393 () Bool)

(assert (=> b!472732 (=> res!282393 e!277242)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472732 (= res!282393 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18821 0))(
  ( (V!18822 (val!6688 Int)) )
))
(declare-datatypes ((tuple2!8808 0))(
  ( (tuple2!8809 (_1!4415 (_ BitVec 64)) (_2!4415 V!18821)) )
))
(declare-datatypes ((List!8891 0))(
  ( (Nil!8888) (Cons!8887 (h!9743 tuple2!8808) (t!14859 List!8891)) )
))
(declare-datatypes ((ListLongMap!7721 0))(
  ( (ListLongMap!7722 (toList!3876 List!8891)) )
))
(declare-fun lt!214494 () ListLongMap!7721)

(declare-fun lt!214492 () ListLongMap!7721)

(assert (=> b!472732 (= lt!214494 lt!214492)))

(declare-fun minValueBefore!38 () V!18821)

(declare-datatypes ((Unit!13907 0))(
  ( (Unit!13908) )
))
(declare-fun lt!214493 () Unit!13907)

(declare-fun zeroValue!794 () V!18821)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30331 0))(
  ( (array!30332 (arr!14586 (Array (_ BitVec 32) (_ BitVec 64))) (size!14938 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30331)

(declare-datatypes ((ValueCell!6300 0))(
  ( (ValueCellFull!6300 (v!8979 V!18821)) (EmptyCell!6300) )
))
(declare-datatypes ((array!30333 0))(
  ( (array!30334 (arr!14587 (Array (_ BitVec 32) ValueCell!6300)) (size!14939 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30333)

(declare-fun minValueAfter!38 () V!18821)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!217 (array!30331 array!30333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18821 V!18821 V!18821 V!18821 (_ BitVec 32) Int) Unit!13907)

(assert (=> b!472732 (= lt!214493 (lemmaNoChangeToArrayThenSameMapNoExtras!217 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2037 (array!30331 array!30333 (_ BitVec 32) (_ BitVec 32) V!18821 V!18821 (_ BitVec 32) Int) ListLongMap!7721)

(assert (=> b!472732 (= lt!214492 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472732 (= lt!214494 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472733 () Bool)

(assert (=> b!472733 (= e!277242 (bvsle #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(declare-fun lt!214491 () ListLongMap!7721)

(declare-fun getCurrentListMap!2245 (array!30331 array!30333 (_ BitVec 32) (_ BitVec 32) V!18821 V!18821 (_ BitVec 32) Int) ListLongMap!7721)

(assert (=> b!472733 (= lt!214491 (getCurrentListMap!2245 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472734 () Bool)

(declare-fun res!282392 () Bool)

(assert (=> b!472734 (=> (not res!282392) (not e!277243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30331 (_ BitVec 32)) Bool)

(assert (=> b!472734 (= res!282392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472735 () Bool)

(declare-fun e!277239 () Bool)

(declare-fun tp_is_empty!13287 () Bool)

(assert (=> b!472735 (= e!277239 tp_is_empty!13287)))

(declare-fun res!282390 () Bool)

(assert (=> start!42368 (=> (not res!282390) (not e!277243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42368 (= res!282390 (validMask!0 mask!1365))))

(assert (=> start!42368 e!277243))

(assert (=> start!42368 tp_is_empty!13287))

(assert (=> start!42368 tp!41607))

(assert (=> start!42368 true))

(declare-fun array_inv!10518 (array!30331) Bool)

(assert (=> start!42368 (array_inv!10518 _keys!1025)))

(declare-fun e!277238 () Bool)

(declare-fun array_inv!10519 (array!30333) Bool)

(assert (=> start!42368 (and (array_inv!10519 _values!833) e!277238)))

(declare-fun b!472736 () Bool)

(declare-fun res!282391 () Bool)

(assert (=> b!472736 (=> (not res!282391) (not e!277243))))

(declare-datatypes ((List!8892 0))(
  ( (Nil!8889) (Cons!8888 (h!9744 (_ BitVec 64)) (t!14860 List!8892)) )
))
(declare-fun arrayNoDuplicates!0 (array!30331 (_ BitVec 32) List!8892) Bool)

(assert (=> b!472736 (= res!282391 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8889))))

(declare-fun b!472737 () Bool)

(declare-fun e!277241 () Bool)

(assert (=> b!472737 (= e!277241 tp_is_empty!13287)))

(declare-fun mapNonEmpty!21640 () Bool)

(declare-fun tp!41608 () Bool)

(assert (=> mapNonEmpty!21640 (= mapRes!21640 (and tp!41608 e!277239))))

(declare-fun mapValue!21640 () ValueCell!6300)

(declare-fun mapKey!21640 () (_ BitVec 32))

(declare-fun mapRest!21640 () (Array (_ BitVec 32) ValueCell!6300))

(assert (=> mapNonEmpty!21640 (= (arr!14587 _values!833) (store mapRest!21640 mapKey!21640 mapValue!21640))))

(declare-fun b!472738 () Bool)

(declare-fun res!282389 () Bool)

(assert (=> b!472738 (=> (not res!282389) (not e!277243))))

(assert (=> b!472738 (= res!282389 (and (= (size!14939 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14938 _keys!1025) (size!14939 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472739 () Bool)

(assert (=> b!472739 (= e!277238 (and e!277241 mapRes!21640))))

(declare-fun condMapEmpty!21640 () Bool)

(declare-fun mapDefault!21640 () ValueCell!6300)

(assert (=> b!472739 (= condMapEmpty!21640 (= (arr!14587 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6300)) mapDefault!21640)))))

(assert (= (and start!42368 res!282390) b!472738))

(assert (= (and b!472738 res!282389) b!472734))

(assert (= (and b!472734 res!282392) b!472736))

(assert (= (and b!472736 res!282391) b!472732))

(assert (= (and b!472732 (not res!282393)) b!472733))

(assert (= (and b!472739 condMapEmpty!21640) mapIsEmpty!21640))

(assert (= (and b!472739 (not condMapEmpty!21640)) mapNonEmpty!21640))

(get-info :version)

(assert (= (and mapNonEmpty!21640 ((_ is ValueCellFull!6300) mapValue!21640)) b!472735))

(assert (= (and b!472739 ((_ is ValueCellFull!6300) mapDefault!21640)) b!472737))

(assert (= start!42368 b!472739))

(declare-fun m!454657 () Bool)

(assert (=> b!472733 m!454657))

(declare-fun m!454659 () Bool)

(assert (=> b!472736 m!454659))

(declare-fun m!454661 () Bool)

(assert (=> mapNonEmpty!21640 m!454661))

(declare-fun m!454663 () Bool)

(assert (=> start!42368 m!454663))

(declare-fun m!454665 () Bool)

(assert (=> start!42368 m!454665))

(declare-fun m!454667 () Bool)

(assert (=> start!42368 m!454667))

(declare-fun m!454669 () Bool)

(assert (=> b!472732 m!454669))

(declare-fun m!454671 () Bool)

(assert (=> b!472732 m!454671))

(declare-fun m!454673 () Bool)

(assert (=> b!472732 m!454673))

(declare-fun m!454675 () Bool)

(assert (=> b!472734 m!454675))

(check-sat (not b!472736) tp_is_empty!13287 (not b!472734) (not mapNonEmpty!21640) (not b!472733) b_and!20305 (not b!472732) (not b_next!11859) (not start!42368))
(check-sat b_and!20305 (not b_next!11859))
(get-model)

(declare-fun d!75467 () Bool)

(assert (=> d!75467 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42368 d!75467))

(declare-fun d!75469 () Bool)

(assert (=> d!75469 (= (array_inv!10518 _keys!1025) (bvsge (size!14938 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42368 d!75469))

(declare-fun d!75471 () Bool)

(assert (=> d!75471 (= (array_inv!10519 _values!833) (bvsge (size!14939 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42368 d!75471))

(declare-fun b!472774 () Bool)

(declare-fun e!277273 () Bool)

(declare-fun e!277270 () Bool)

(assert (=> b!472774 (= e!277273 e!277270)))

(declare-fun c!57011 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!472774 (= c!57011 (validKeyInArray!0 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472775 () Bool)

(declare-fun e!277271 () Bool)

(assert (=> b!472775 (= e!277271 e!277273)))

(declare-fun res!282415 () Bool)

(assert (=> b!472775 (=> (not res!282415) (not e!277273))))

(declare-fun e!277272 () Bool)

(assert (=> b!472775 (= res!282415 (not e!277272))))

(declare-fun res!282417 () Bool)

(assert (=> b!472775 (=> (not res!282417) (not e!277272))))

(assert (=> b!472775 (= res!282417 (validKeyInArray!0 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75473 () Bool)

(declare-fun res!282416 () Bool)

(assert (=> d!75473 (=> res!282416 e!277271)))

(assert (=> d!75473 (= res!282416 (bvsge #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(assert (=> d!75473 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8889) e!277271)))

(declare-fun b!472776 () Bool)

(declare-fun contains!2546 (List!8892 (_ BitVec 64)) Bool)

(assert (=> b!472776 (= e!277272 (contains!2546 Nil!8889 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472777 () Bool)

(declare-fun call!30464 () Bool)

(assert (=> b!472777 (= e!277270 call!30464)))

(declare-fun bm!30461 () Bool)

(assert (=> bm!30461 (= call!30464 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57011 (Cons!8888 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000) Nil!8889) Nil!8889)))))

(declare-fun b!472778 () Bool)

(assert (=> b!472778 (= e!277270 call!30464)))

(assert (= (and d!75473 (not res!282416)) b!472775))

(assert (= (and b!472775 res!282417) b!472776))

(assert (= (and b!472775 res!282415) b!472774))

(assert (= (and b!472774 c!57011) b!472777))

(assert (= (and b!472774 (not c!57011)) b!472778))

(assert (= (or b!472777 b!472778) bm!30461))

(declare-fun m!454697 () Bool)

(assert (=> b!472774 m!454697))

(assert (=> b!472774 m!454697))

(declare-fun m!454699 () Bool)

(assert (=> b!472774 m!454699))

(assert (=> b!472775 m!454697))

(assert (=> b!472775 m!454697))

(assert (=> b!472775 m!454699))

(assert (=> b!472776 m!454697))

(assert (=> b!472776 m!454697))

(declare-fun m!454701 () Bool)

(assert (=> b!472776 m!454701))

(assert (=> bm!30461 m!454697))

(declare-fun m!454703 () Bool)

(assert (=> bm!30461 m!454703))

(assert (=> b!472736 d!75473))

(declare-fun b!472787 () Bool)

(declare-fun e!277280 () Bool)

(declare-fun e!277282 () Bool)

(assert (=> b!472787 (= e!277280 e!277282)))

(declare-fun c!57014 () Bool)

(assert (=> b!472787 (= c!57014 (validKeyInArray!0 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472788 () Bool)

(declare-fun call!30467 () Bool)

(assert (=> b!472788 (= e!277282 call!30467)))

(declare-fun b!472789 () Bool)

(declare-fun e!277281 () Bool)

(assert (=> b!472789 (= e!277282 e!277281)))

(declare-fun lt!214513 () (_ BitVec 64))

(assert (=> b!472789 (= lt!214513 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214515 () Unit!13907)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30331 (_ BitVec 64) (_ BitVec 32)) Unit!13907)

(assert (=> b!472789 (= lt!214515 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!214513 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!472789 (arrayContainsKey!0 _keys!1025 lt!214513 #b00000000000000000000000000000000)))

(declare-fun lt!214514 () Unit!13907)

(assert (=> b!472789 (= lt!214514 lt!214515)))

(declare-fun res!282423 () Bool)

(declare-datatypes ((SeekEntryResult!3555 0))(
  ( (MissingZero!3555 (index!16399 (_ BitVec 32))) (Found!3555 (index!16400 (_ BitVec 32))) (Intermediate!3555 (undefined!4367 Bool) (index!16401 (_ BitVec 32)) (x!44340 (_ BitVec 32))) (Undefined!3555) (MissingVacant!3555 (index!16402 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30331 (_ BitVec 32)) SeekEntryResult!3555)

(assert (=> b!472789 (= res!282423 (= (seekEntryOrOpen!0 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3555 #b00000000000000000000000000000000)))))

(assert (=> b!472789 (=> (not res!282423) (not e!277281))))

(declare-fun b!472790 () Bool)

(assert (=> b!472790 (= e!277281 call!30467)))

(declare-fun d!75475 () Bool)

(declare-fun res!282422 () Bool)

(assert (=> d!75475 (=> res!282422 e!277280)))

(assert (=> d!75475 (= res!282422 (bvsge #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(assert (=> d!75475 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!277280)))

(declare-fun bm!30464 () Bool)

(assert (=> bm!30464 (= call!30467 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(assert (= (and d!75475 (not res!282422)) b!472787))

(assert (= (and b!472787 c!57014) b!472789))

(assert (= (and b!472787 (not c!57014)) b!472788))

(assert (= (and b!472789 res!282423) b!472790))

(assert (= (or b!472790 b!472788) bm!30464))

(assert (=> b!472787 m!454697))

(assert (=> b!472787 m!454697))

(assert (=> b!472787 m!454699))

(assert (=> b!472789 m!454697))

(declare-fun m!454705 () Bool)

(assert (=> b!472789 m!454705))

(declare-fun m!454707 () Bool)

(assert (=> b!472789 m!454707))

(assert (=> b!472789 m!454697))

(declare-fun m!454709 () Bool)

(assert (=> b!472789 m!454709))

(declare-fun m!454711 () Bool)

(assert (=> bm!30464 m!454711))

(assert (=> b!472734 d!75475))

(declare-fun b!472833 () Bool)

(declare-fun e!277321 () ListLongMap!7721)

(declare-fun call!30483 () ListLongMap!7721)

(assert (=> b!472833 (= e!277321 call!30483)))

(declare-fun bm!30479 () Bool)

(declare-fun call!30487 () ListLongMap!7721)

(assert (=> bm!30479 (= call!30483 call!30487)))

(declare-fun b!472834 () Bool)

(declare-fun e!277314 () Bool)

(declare-fun e!277317 () Bool)

(assert (=> b!472834 (= e!277314 e!277317)))

(declare-fun c!57029 () Bool)

(assert (=> b!472834 (= c!57029 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!472835 () Bool)

(declare-fun call!30485 () ListLongMap!7721)

(assert (=> b!472835 (= e!277321 call!30485)))

(declare-fun b!472836 () Bool)

(declare-fun e!277319 () Bool)

(declare-fun lt!214574 () ListLongMap!7721)

(declare-fun apply!331 (ListLongMap!7721 (_ BitVec 64)) V!18821)

(assert (=> b!472836 (= e!277319 (= (apply!331 lt!214574 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!472837 () Bool)

(declare-fun e!277311 () Bool)

(assert (=> b!472837 (= e!277311 (validKeyInArray!0 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472838 () Bool)

(declare-fun e!277318 () Bool)

(declare-fun e!277312 () Bool)

(assert (=> b!472838 (= e!277318 e!277312)))

(declare-fun res!282445 () Bool)

(declare-fun call!30486 () Bool)

(assert (=> b!472838 (= res!282445 call!30486)))

(assert (=> b!472838 (=> (not res!282445) (not e!277312))))

(declare-fun b!472839 () Bool)

(assert (=> b!472839 (= e!277312 (= (apply!331 lt!214574 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun bm!30480 () Bool)

(declare-fun call!30484 () ListLongMap!7721)

(assert (=> bm!30480 (= call!30484 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472840 () Bool)

(declare-fun e!277315 () Unit!13907)

(declare-fun Unit!13911 () Unit!13907)

(assert (=> b!472840 (= e!277315 Unit!13911)))

(declare-fun b!472841 () Bool)

(declare-fun c!57028 () Bool)

(assert (=> b!472841 (= c!57028 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!277316 () ListLongMap!7721)

(assert (=> b!472841 (= e!277316 e!277321)))

(declare-fun b!472842 () Bool)

(assert (=> b!472842 (= e!277316 call!30485)))

(declare-fun bm!30481 () Bool)

(declare-fun call!30482 () Bool)

(declare-fun contains!2547 (ListLongMap!7721 (_ BitVec 64)) Bool)

(assert (=> bm!30481 (= call!30482 (contains!2547 lt!214574 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!472843 () Bool)

(assert (=> b!472843 (= e!277317 (not call!30482))))

(declare-fun b!472844 () Bool)

(declare-fun e!277310 () Bool)

(declare-fun e!277320 () Bool)

(assert (=> b!472844 (= e!277310 e!277320)))

(declare-fun res!282444 () Bool)

(assert (=> b!472844 (=> (not res!282444) (not e!277320))))

(assert (=> b!472844 (= res!282444 (contains!2547 lt!214574 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472844 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(declare-fun bm!30482 () Bool)

(assert (=> bm!30482 (= call!30486 (contains!2547 lt!214574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!472845 () Bool)

(declare-fun res!282450 () Bool)

(assert (=> b!472845 (=> (not res!282450) (not e!277314))))

(assert (=> b!472845 (= res!282450 e!277310)))

(declare-fun res!282442 () Bool)

(assert (=> b!472845 (=> res!282442 e!277310)))

(assert (=> b!472845 (= res!282442 (not e!277311))))

(declare-fun res!282449 () Bool)

(assert (=> b!472845 (=> (not res!282449) (not e!277311))))

(assert (=> b!472845 (= res!282449 (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(declare-fun b!472846 () Bool)

(assert (=> b!472846 (= e!277317 e!277319)))

(declare-fun res!282446 () Bool)

(assert (=> b!472846 (= res!282446 call!30482)))

(assert (=> b!472846 (=> (not res!282446) (not e!277319))))

(declare-fun bm!30483 () Bool)

(declare-fun c!57032 () Bool)

(declare-fun c!57030 () Bool)

(declare-fun call!30488 () ListLongMap!7721)

(declare-fun +!1717 (ListLongMap!7721 tuple2!8808) ListLongMap!7721)

(assert (=> bm!30483 (= call!30488 (+!1717 (ite c!57032 call!30484 (ite c!57030 call!30487 call!30483)) (ite (or c!57032 c!57030) (tuple2!8809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8809 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun d!75477 () Bool)

(assert (=> d!75477 e!277314))

(declare-fun res!282443 () Bool)

(assert (=> d!75477 (=> (not res!282443) (not e!277314))))

(assert (=> d!75477 (= res!282443 (or (bvsge #b00000000000000000000000000000000 (size!14938 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))))

(declare-fun lt!214565 () ListLongMap!7721)

(assert (=> d!75477 (= lt!214574 lt!214565)))

(declare-fun lt!214561 () Unit!13907)

(assert (=> d!75477 (= lt!214561 e!277315)))

(declare-fun c!57027 () Bool)

(declare-fun e!277313 () Bool)

(assert (=> d!75477 (= c!57027 e!277313)))

(declare-fun res!282448 () Bool)

(assert (=> d!75477 (=> (not res!282448) (not e!277313))))

(assert (=> d!75477 (= res!282448 (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(declare-fun e!277309 () ListLongMap!7721)

(assert (=> d!75477 (= lt!214565 e!277309)))

(assert (=> d!75477 (= c!57032 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75477 (validMask!0 mask!1365)))

(assert (=> d!75477 (= (getCurrentListMap!2245 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214574)))

(declare-fun b!472847 () Bool)

(declare-fun res!282447 () Bool)

(assert (=> b!472847 (=> (not res!282447) (not e!277314))))

(assert (=> b!472847 (= res!282447 e!277318)))

(declare-fun c!57031 () Bool)

(assert (=> b!472847 (= c!57031 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30484 () Bool)

(assert (=> bm!30484 (= call!30487 call!30484)))

(declare-fun b!472848 () Bool)

(assert (=> b!472848 (= e!277313 (validKeyInArray!0 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472849 () Bool)

(assert (=> b!472849 (= e!277309 e!277316)))

(assert (=> b!472849 (= c!57030 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30485 () Bool)

(assert (=> bm!30485 (= call!30485 call!30488)))

(declare-fun b!472850 () Bool)

(assert (=> b!472850 (= e!277309 (+!1717 call!30488 (tuple2!8809 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!472851 () Bool)

(declare-fun get!7096 (ValueCell!6300 V!18821) V!18821)

(declare-fun dynLambda!924 (Int (_ BitVec 64)) V!18821)

(assert (=> b!472851 (= e!277320 (= (apply!331 lt!214574 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)) (get!7096 (select (arr!14587 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!472851 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14939 _values!833)))))

(assert (=> b!472851 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(declare-fun b!472852 () Bool)

(assert (=> b!472852 (= e!277318 (not call!30486))))

(declare-fun b!472853 () Bool)

(declare-fun lt!214562 () Unit!13907)

(assert (=> b!472853 (= e!277315 lt!214562)))

(declare-fun lt!214563 () ListLongMap!7721)

(assert (=> b!472853 (= lt!214563 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214564 () (_ BitVec 64))

(assert (=> b!472853 (= lt!214564 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!214575 () (_ BitVec 64))

(assert (=> b!472853 (= lt!214575 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214577 () Unit!13907)

(declare-fun addStillContains!290 (ListLongMap!7721 (_ BitVec 64) V!18821 (_ BitVec 64)) Unit!13907)

(assert (=> b!472853 (= lt!214577 (addStillContains!290 lt!214563 lt!214564 zeroValue!794 lt!214575))))

(assert (=> b!472853 (contains!2547 (+!1717 lt!214563 (tuple2!8809 lt!214564 zeroValue!794)) lt!214575)))

(declare-fun lt!214570 () Unit!13907)

(assert (=> b!472853 (= lt!214570 lt!214577)))

(declare-fun lt!214566 () ListLongMap!7721)

(assert (=> b!472853 (= lt!214566 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214576 () (_ BitVec 64))

(assert (=> b!472853 (= lt!214576 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!214580 () (_ BitVec 64))

(assert (=> b!472853 (= lt!214580 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214579 () Unit!13907)

(declare-fun addApplyDifferent!290 (ListLongMap!7721 (_ BitVec 64) V!18821 (_ BitVec 64)) Unit!13907)

(assert (=> b!472853 (= lt!214579 (addApplyDifferent!290 lt!214566 lt!214576 minValueBefore!38 lt!214580))))

(assert (=> b!472853 (= (apply!331 (+!1717 lt!214566 (tuple2!8809 lt!214576 minValueBefore!38)) lt!214580) (apply!331 lt!214566 lt!214580))))

(declare-fun lt!214573 () Unit!13907)

(assert (=> b!472853 (= lt!214573 lt!214579)))

(declare-fun lt!214569 () ListLongMap!7721)

(assert (=> b!472853 (= lt!214569 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214578 () (_ BitVec 64))

(assert (=> b!472853 (= lt!214578 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!214581 () (_ BitVec 64))

(assert (=> b!472853 (= lt!214581 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214567 () Unit!13907)

(assert (=> b!472853 (= lt!214567 (addApplyDifferent!290 lt!214569 lt!214578 zeroValue!794 lt!214581))))

(assert (=> b!472853 (= (apply!331 (+!1717 lt!214569 (tuple2!8809 lt!214578 zeroValue!794)) lt!214581) (apply!331 lt!214569 lt!214581))))

(declare-fun lt!214572 () Unit!13907)

(assert (=> b!472853 (= lt!214572 lt!214567)))

(declare-fun lt!214571 () ListLongMap!7721)

(assert (=> b!472853 (= lt!214571 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214560 () (_ BitVec 64))

(assert (=> b!472853 (= lt!214560 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!214568 () (_ BitVec 64))

(assert (=> b!472853 (= lt!214568 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!472853 (= lt!214562 (addApplyDifferent!290 lt!214571 lt!214560 minValueBefore!38 lt!214568))))

(assert (=> b!472853 (= (apply!331 (+!1717 lt!214571 (tuple2!8809 lt!214560 minValueBefore!38)) lt!214568) (apply!331 lt!214571 lt!214568))))

(assert (= (and d!75477 c!57032) b!472850))

(assert (= (and d!75477 (not c!57032)) b!472849))

(assert (= (and b!472849 c!57030) b!472842))

(assert (= (and b!472849 (not c!57030)) b!472841))

(assert (= (and b!472841 c!57028) b!472835))

(assert (= (and b!472841 (not c!57028)) b!472833))

(assert (= (or b!472835 b!472833) bm!30479))

(assert (= (or b!472842 bm!30479) bm!30484))

(assert (= (or b!472842 b!472835) bm!30485))

(assert (= (or b!472850 bm!30484) bm!30480))

(assert (= (or b!472850 bm!30485) bm!30483))

(assert (= (and d!75477 res!282448) b!472848))

(assert (= (and d!75477 c!57027) b!472853))

(assert (= (and d!75477 (not c!57027)) b!472840))

(assert (= (and d!75477 res!282443) b!472845))

(assert (= (and b!472845 res!282449) b!472837))

(assert (= (and b!472845 (not res!282442)) b!472844))

(assert (= (and b!472844 res!282444) b!472851))

(assert (= (and b!472845 res!282450) b!472847))

(assert (= (and b!472847 c!57031) b!472838))

(assert (= (and b!472847 (not c!57031)) b!472852))

(assert (= (and b!472838 res!282445) b!472839))

(assert (= (or b!472838 b!472852) bm!30482))

(assert (= (and b!472847 res!282447) b!472834))

(assert (= (and b!472834 c!57029) b!472846))

(assert (= (and b!472834 (not c!57029)) b!472843))

(assert (= (and b!472846 res!282446) b!472836))

(assert (= (or b!472846 b!472843) bm!30481))

(declare-fun b_lambda!10185 () Bool)

(assert (=> (not b_lambda!10185) (not b!472851)))

(declare-fun t!14864 () Bool)

(declare-fun tb!3927 () Bool)

(assert (=> (and start!42368 (= defaultEntry!841 defaultEntry!841) t!14864) tb!3927))

(declare-fun result!7439 () Bool)

(assert (=> tb!3927 (= result!7439 tp_is_empty!13287)))

(assert (=> b!472851 t!14864))

(declare-fun b_and!20309 () Bool)

(assert (= b_and!20305 (and (=> t!14864 result!7439) b_and!20309)))

(declare-fun m!454713 () Bool)

(assert (=> b!472850 m!454713))

(declare-fun m!454715 () Bool)

(assert (=> b!472836 m!454715))

(declare-fun m!454717 () Bool)

(assert (=> bm!30483 m!454717))

(assert (=> b!472853 m!454673))

(declare-fun m!454719 () Bool)

(assert (=> b!472853 m!454719))

(declare-fun m!454721 () Bool)

(assert (=> b!472853 m!454721))

(declare-fun m!454723 () Bool)

(assert (=> b!472853 m!454723))

(declare-fun m!454725 () Bool)

(assert (=> b!472853 m!454725))

(declare-fun m!454727 () Bool)

(assert (=> b!472853 m!454727))

(declare-fun m!454729 () Bool)

(assert (=> b!472853 m!454729))

(declare-fun m!454731 () Bool)

(assert (=> b!472853 m!454731))

(declare-fun m!454733 () Bool)

(assert (=> b!472853 m!454733))

(assert (=> b!472853 m!454719))

(declare-fun m!454735 () Bool)

(assert (=> b!472853 m!454735))

(declare-fun m!454737 () Bool)

(assert (=> b!472853 m!454737))

(assert (=> b!472853 m!454731))

(declare-fun m!454739 () Bool)

(assert (=> b!472853 m!454739))

(declare-fun m!454741 () Bool)

(assert (=> b!472853 m!454741))

(declare-fun m!454743 () Bool)

(assert (=> b!472853 m!454743))

(declare-fun m!454745 () Bool)

(assert (=> b!472853 m!454745))

(assert (=> b!472853 m!454697))

(declare-fun m!454747 () Bool)

(assert (=> b!472853 m!454747))

(assert (=> b!472853 m!454739))

(assert (=> b!472853 m!454743))

(assert (=> b!472848 m!454697))

(assert (=> b!472848 m!454697))

(assert (=> b!472848 m!454699))

(declare-fun m!454749 () Bool)

(assert (=> b!472839 m!454749))

(assert (=> b!472837 m!454697))

(assert (=> b!472837 m!454697))

(assert (=> b!472837 m!454699))

(declare-fun m!454751 () Bool)

(assert (=> b!472851 m!454751))

(declare-fun m!454753 () Bool)

(assert (=> b!472851 m!454753))

(declare-fun m!454755 () Bool)

(assert (=> b!472851 m!454755))

(assert (=> b!472851 m!454753))

(assert (=> b!472851 m!454697))

(declare-fun m!454757 () Bool)

(assert (=> b!472851 m!454757))

(assert (=> b!472851 m!454751))

(assert (=> b!472851 m!454697))

(declare-fun m!454759 () Bool)

(assert (=> bm!30482 m!454759))

(assert (=> d!75477 m!454663))

(assert (=> bm!30480 m!454673))

(declare-fun m!454761 () Bool)

(assert (=> bm!30481 m!454761))

(assert (=> b!472844 m!454697))

(assert (=> b!472844 m!454697))

(declare-fun m!454763 () Bool)

(assert (=> b!472844 m!454763))

(assert (=> b!472733 d!75477))

(declare-fun d!75479 () Bool)

(assert (=> d!75479 (= (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214584 () Unit!13907)

(declare-fun choose!1350 (array!30331 array!30333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18821 V!18821 V!18821 V!18821 (_ BitVec 32) Int) Unit!13907)

(assert (=> d!75479 (= lt!214584 (choose!1350 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75479 (validMask!0 mask!1365)))

(assert (=> d!75479 (= (lemmaNoChangeToArrayThenSameMapNoExtras!217 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214584)))

(declare-fun bs!15004 () Bool)

(assert (= bs!15004 d!75479))

(assert (=> bs!15004 m!454673))

(assert (=> bs!15004 m!454671))

(declare-fun m!454765 () Bool)

(assert (=> bs!15004 m!454765))

(assert (=> bs!15004 m!454663))

(assert (=> b!472732 d!75479))

(declare-fun b!472880 () Bool)

(declare-fun e!277341 () Bool)

(declare-fun lt!214601 () ListLongMap!7721)

(declare-fun isEmpty!578 (ListLongMap!7721) Bool)

(assert (=> b!472880 (= e!277341 (isEmpty!578 lt!214601))))

(declare-fun b!472881 () Bool)

(declare-fun e!277336 () ListLongMap!7721)

(declare-fun call!30491 () ListLongMap!7721)

(assert (=> b!472881 (= e!277336 call!30491)))

(declare-fun b!472882 () Bool)

(declare-fun e!277337 () Bool)

(assert (=> b!472882 (= e!277337 e!277341)))

(declare-fun c!57041 () Bool)

(assert (=> b!472882 (= c!57041 (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(declare-fun bm!30488 () Bool)

(assert (=> bm!30488 (= call!30491 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!472883 () Bool)

(assert (=> b!472883 (= e!277341 (= lt!214601 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!472884 () Bool)

(declare-fun e!277342 () Bool)

(assert (=> b!472884 (= e!277342 e!277337)))

(declare-fun c!57043 () Bool)

(declare-fun e!277338 () Bool)

(assert (=> b!472884 (= c!57043 e!277338)))

(declare-fun res!282460 () Bool)

(assert (=> b!472884 (=> (not res!282460) (not e!277338))))

(assert (=> b!472884 (= res!282460 (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(declare-fun b!472885 () Bool)

(declare-fun res!282459 () Bool)

(assert (=> b!472885 (=> (not res!282459) (not e!277342))))

(assert (=> b!472885 (= res!282459 (not (contains!2547 lt!214601 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!472886 () Bool)

(declare-fun e!277339 () ListLongMap!7721)

(assert (=> b!472886 (= e!277339 (ListLongMap!7722 Nil!8888))))

(declare-fun d!75481 () Bool)

(assert (=> d!75481 e!277342))

(declare-fun res!282461 () Bool)

(assert (=> d!75481 (=> (not res!282461) (not e!277342))))

(assert (=> d!75481 (= res!282461 (not (contains!2547 lt!214601 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75481 (= lt!214601 e!277339)))

(declare-fun c!57044 () Bool)

(assert (=> d!75481 (= c!57044 (bvsge #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(assert (=> d!75481 (validMask!0 mask!1365)))

(assert (=> d!75481 (= (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214601)))

(declare-fun b!472887 () Bool)

(declare-fun e!277340 () Bool)

(assert (=> b!472887 (= e!277337 e!277340)))

(assert (=> b!472887 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(declare-fun res!282462 () Bool)

(assert (=> b!472887 (= res!282462 (contains!2547 lt!214601 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472887 (=> (not res!282462) (not e!277340))))

(declare-fun b!472888 () Bool)

(assert (=> b!472888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(assert (=> b!472888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14939 _values!833)))))

(assert (=> b!472888 (= e!277340 (= (apply!331 lt!214601 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)) (get!7096 (select (arr!14587 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!472889 () Bool)

(assert (=> b!472889 (= e!277339 e!277336)))

(declare-fun c!57042 () Bool)

(assert (=> b!472889 (= c!57042 (validKeyInArray!0 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472890 () Bool)

(declare-fun lt!214603 () Unit!13907)

(declare-fun lt!214604 () Unit!13907)

(assert (=> b!472890 (= lt!214603 lt!214604)))

(declare-fun lt!214605 () ListLongMap!7721)

(declare-fun lt!214600 () V!18821)

(declare-fun lt!214599 () (_ BitVec 64))

(declare-fun lt!214602 () (_ BitVec 64))

(assert (=> b!472890 (not (contains!2547 (+!1717 lt!214605 (tuple2!8809 lt!214602 lt!214600)) lt!214599))))

(declare-fun addStillNotContains!164 (ListLongMap!7721 (_ BitVec 64) V!18821 (_ BitVec 64)) Unit!13907)

(assert (=> b!472890 (= lt!214604 (addStillNotContains!164 lt!214605 lt!214602 lt!214600 lt!214599))))

(assert (=> b!472890 (= lt!214599 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!472890 (= lt!214600 (get!7096 (select (arr!14587 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!472890 (= lt!214602 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!472890 (= lt!214605 call!30491)))

(assert (=> b!472890 (= e!277336 (+!1717 call!30491 (tuple2!8809 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000) (get!7096 (select (arr!14587 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!472891 () Bool)

(assert (=> b!472891 (= e!277338 (validKeyInArray!0 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472891 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!75481 c!57044) b!472886))

(assert (= (and d!75481 (not c!57044)) b!472889))

(assert (= (and b!472889 c!57042) b!472890))

(assert (= (and b!472889 (not c!57042)) b!472881))

(assert (= (or b!472890 b!472881) bm!30488))

(assert (= (and d!75481 res!282461) b!472885))

(assert (= (and b!472885 res!282459) b!472884))

(assert (= (and b!472884 res!282460) b!472891))

(assert (= (and b!472884 c!57043) b!472887))

(assert (= (and b!472884 (not c!57043)) b!472882))

(assert (= (and b!472887 res!282462) b!472888))

(assert (= (and b!472882 c!57041) b!472883))

(assert (= (and b!472882 (not c!57041)) b!472880))

(declare-fun b_lambda!10187 () Bool)

(assert (=> (not b_lambda!10187) (not b!472888)))

(assert (=> b!472888 t!14864))

(declare-fun b_and!20311 () Bool)

(assert (= b_and!20309 (and (=> t!14864 result!7439) b_and!20311)))

(declare-fun b_lambda!10189 () Bool)

(assert (=> (not b_lambda!10189) (not b!472890)))

(assert (=> b!472890 t!14864))

(declare-fun b_and!20313 () Bool)

(assert (= b_and!20311 (and (=> t!14864 result!7439) b_and!20313)))

(assert (=> b!472890 m!454697))

(declare-fun m!454767 () Bool)

(assert (=> b!472890 m!454767))

(declare-fun m!454769 () Bool)

(assert (=> b!472890 m!454769))

(declare-fun m!454771 () Bool)

(assert (=> b!472890 m!454771))

(assert (=> b!472890 m!454769))

(declare-fun m!454773 () Bool)

(assert (=> b!472890 m!454773))

(assert (=> b!472890 m!454751))

(assert (=> b!472890 m!454751))

(assert (=> b!472890 m!454753))

(assert (=> b!472890 m!454755))

(assert (=> b!472890 m!454753))

(declare-fun m!454775 () Bool)

(assert (=> b!472885 m!454775))

(declare-fun m!454777 () Bool)

(assert (=> bm!30488 m!454777))

(declare-fun m!454779 () Bool)

(assert (=> d!75481 m!454779))

(assert (=> d!75481 m!454663))

(assert (=> b!472889 m!454697))

(assert (=> b!472889 m!454697))

(assert (=> b!472889 m!454699))

(assert (=> b!472883 m!454777))

(declare-fun m!454781 () Bool)

(assert (=> b!472880 m!454781))

(assert (=> b!472888 m!454697))

(declare-fun m!454783 () Bool)

(assert (=> b!472888 m!454783))

(assert (=> b!472888 m!454697))

(assert (=> b!472888 m!454751))

(assert (=> b!472888 m!454751))

(assert (=> b!472888 m!454753))

(assert (=> b!472888 m!454755))

(assert (=> b!472888 m!454753))

(assert (=> b!472887 m!454697))

(assert (=> b!472887 m!454697))

(declare-fun m!454785 () Bool)

(assert (=> b!472887 m!454785))

(assert (=> b!472891 m!454697))

(assert (=> b!472891 m!454697))

(assert (=> b!472891 m!454699))

(assert (=> b!472732 d!75481))

(declare-fun b!472892 () Bool)

(declare-fun e!277348 () Bool)

(declare-fun lt!214608 () ListLongMap!7721)

(assert (=> b!472892 (= e!277348 (isEmpty!578 lt!214608))))

(declare-fun b!472893 () Bool)

(declare-fun e!277343 () ListLongMap!7721)

(declare-fun call!30492 () ListLongMap!7721)

(assert (=> b!472893 (= e!277343 call!30492)))

(declare-fun b!472894 () Bool)

(declare-fun e!277344 () Bool)

(assert (=> b!472894 (= e!277344 e!277348)))

(declare-fun c!57045 () Bool)

(assert (=> b!472894 (= c!57045 (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(declare-fun bm!30489 () Bool)

(assert (=> bm!30489 (= call!30492 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!472895 () Bool)

(assert (=> b!472895 (= e!277348 (= lt!214608 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!472896 () Bool)

(declare-fun e!277349 () Bool)

(assert (=> b!472896 (= e!277349 e!277344)))

(declare-fun c!57047 () Bool)

(declare-fun e!277345 () Bool)

(assert (=> b!472896 (= c!57047 e!277345)))

(declare-fun res!282464 () Bool)

(assert (=> b!472896 (=> (not res!282464) (not e!277345))))

(assert (=> b!472896 (= res!282464 (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(declare-fun b!472897 () Bool)

(declare-fun res!282463 () Bool)

(assert (=> b!472897 (=> (not res!282463) (not e!277349))))

(assert (=> b!472897 (= res!282463 (not (contains!2547 lt!214608 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!472898 () Bool)

(declare-fun e!277346 () ListLongMap!7721)

(assert (=> b!472898 (= e!277346 (ListLongMap!7722 Nil!8888))))

(declare-fun d!75483 () Bool)

(assert (=> d!75483 e!277349))

(declare-fun res!282465 () Bool)

(assert (=> d!75483 (=> (not res!282465) (not e!277349))))

(assert (=> d!75483 (= res!282465 (not (contains!2547 lt!214608 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75483 (= lt!214608 e!277346)))

(declare-fun c!57048 () Bool)

(assert (=> d!75483 (= c!57048 (bvsge #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(assert (=> d!75483 (validMask!0 mask!1365)))

(assert (=> d!75483 (= (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214608)))

(declare-fun b!472899 () Bool)

(declare-fun e!277347 () Bool)

(assert (=> b!472899 (= e!277344 e!277347)))

(assert (=> b!472899 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(declare-fun res!282466 () Bool)

(assert (=> b!472899 (= res!282466 (contains!2547 lt!214608 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472899 (=> (not res!282466) (not e!277347))))

(declare-fun b!472900 () Bool)

(assert (=> b!472900 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14938 _keys!1025)))))

(assert (=> b!472900 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14939 _values!833)))))

(assert (=> b!472900 (= e!277347 (= (apply!331 lt!214608 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)) (get!7096 (select (arr!14587 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!472901 () Bool)

(assert (=> b!472901 (= e!277346 e!277343)))

(declare-fun c!57046 () Bool)

(assert (=> b!472901 (= c!57046 (validKeyInArray!0 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472902 () Bool)

(declare-fun lt!214610 () Unit!13907)

(declare-fun lt!214611 () Unit!13907)

(assert (=> b!472902 (= lt!214610 lt!214611)))

(declare-fun lt!214607 () V!18821)

(declare-fun lt!214612 () ListLongMap!7721)

(declare-fun lt!214609 () (_ BitVec 64))

(declare-fun lt!214606 () (_ BitVec 64))

(assert (=> b!472902 (not (contains!2547 (+!1717 lt!214612 (tuple2!8809 lt!214609 lt!214607)) lt!214606))))

(assert (=> b!472902 (= lt!214611 (addStillNotContains!164 lt!214612 lt!214609 lt!214607 lt!214606))))

(assert (=> b!472902 (= lt!214606 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!472902 (= lt!214607 (get!7096 (select (arr!14587 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!472902 (= lt!214609 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!472902 (= lt!214612 call!30492)))

(assert (=> b!472902 (= e!277343 (+!1717 call!30492 (tuple2!8809 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000) (get!7096 (select (arr!14587 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!472903 () Bool)

(assert (=> b!472903 (= e!277345 (validKeyInArray!0 (select (arr!14586 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472903 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!75483 c!57048) b!472898))

(assert (= (and d!75483 (not c!57048)) b!472901))

(assert (= (and b!472901 c!57046) b!472902))

(assert (= (and b!472901 (not c!57046)) b!472893))

(assert (= (or b!472902 b!472893) bm!30489))

(assert (= (and d!75483 res!282465) b!472897))

(assert (= (and b!472897 res!282463) b!472896))

(assert (= (and b!472896 res!282464) b!472903))

(assert (= (and b!472896 c!57047) b!472899))

(assert (= (and b!472896 (not c!57047)) b!472894))

(assert (= (and b!472899 res!282466) b!472900))

(assert (= (and b!472894 c!57045) b!472895))

(assert (= (and b!472894 (not c!57045)) b!472892))

(declare-fun b_lambda!10191 () Bool)

(assert (=> (not b_lambda!10191) (not b!472900)))

(assert (=> b!472900 t!14864))

(declare-fun b_and!20315 () Bool)

(assert (= b_and!20313 (and (=> t!14864 result!7439) b_and!20315)))

(declare-fun b_lambda!10193 () Bool)

(assert (=> (not b_lambda!10193) (not b!472902)))

(assert (=> b!472902 t!14864))

(declare-fun b_and!20317 () Bool)

(assert (= b_and!20315 (and (=> t!14864 result!7439) b_and!20317)))

(assert (=> b!472902 m!454697))

(declare-fun m!454787 () Bool)

(assert (=> b!472902 m!454787))

(declare-fun m!454789 () Bool)

(assert (=> b!472902 m!454789))

(declare-fun m!454791 () Bool)

(assert (=> b!472902 m!454791))

(assert (=> b!472902 m!454789))

(declare-fun m!454793 () Bool)

(assert (=> b!472902 m!454793))

(assert (=> b!472902 m!454751))

(assert (=> b!472902 m!454751))

(assert (=> b!472902 m!454753))

(assert (=> b!472902 m!454755))

(assert (=> b!472902 m!454753))

(declare-fun m!454795 () Bool)

(assert (=> b!472897 m!454795))

(declare-fun m!454797 () Bool)

(assert (=> bm!30489 m!454797))

(declare-fun m!454799 () Bool)

(assert (=> d!75483 m!454799))

(assert (=> d!75483 m!454663))

(assert (=> b!472901 m!454697))

(assert (=> b!472901 m!454697))

(assert (=> b!472901 m!454699))

(assert (=> b!472895 m!454797))

(declare-fun m!454801 () Bool)

(assert (=> b!472892 m!454801))

(assert (=> b!472900 m!454697))

(declare-fun m!454803 () Bool)

(assert (=> b!472900 m!454803))

(assert (=> b!472900 m!454697))

(assert (=> b!472900 m!454751))

(assert (=> b!472900 m!454751))

(assert (=> b!472900 m!454753))

(assert (=> b!472900 m!454755))

(assert (=> b!472900 m!454753))

(assert (=> b!472899 m!454697))

(assert (=> b!472899 m!454697))

(declare-fun m!454805 () Bool)

(assert (=> b!472899 m!454805))

(assert (=> b!472903 m!454697))

(assert (=> b!472903 m!454697))

(assert (=> b!472903 m!454699))

(assert (=> b!472732 d!75483))

(declare-fun b!472910 () Bool)

(declare-fun e!277354 () Bool)

(assert (=> b!472910 (= e!277354 tp_is_empty!13287)))

(declare-fun b!472911 () Bool)

(declare-fun e!277355 () Bool)

(assert (=> b!472911 (= e!277355 tp_is_empty!13287)))

(declare-fun mapNonEmpty!21646 () Bool)

(declare-fun mapRes!21646 () Bool)

(declare-fun tp!41617 () Bool)

(assert (=> mapNonEmpty!21646 (= mapRes!21646 (and tp!41617 e!277354))))

(declare-fun mapValue!21646 () ValueCell!6300)

(declare-fun mapKey!21646 () (_ BitVec 32))

(declare-fun mapRest!21646 () (Array (_ BitVec 32) ValueCell!6300))

(assert (=> mapNonEmpty!21646 (= mapRest!21640 (store mapRest!21646 mapKey!21646 mapValue!21646))))

(declare-fun condMapEmpty!21646 () Bool)

(declare-fun mapDefault!21646 () ValueCell!6300)

(assert (=> mapNonEmpty!21640 (= condMapEmpty!21646 (= mapRest!21640 ((as const (Array (_ BitVec 32) ValueCell!6300)) mapDefault!21646)))))

(assert (=> mapNonEmpty!21640 (= tp!41608 (and e!277355 mapRes!21646))))

(declare-fun mapIsEmpty!21646 () Bool)

(assert (=> mapIsEmpty!21646 mapRes!21646))

(assert (= (and mapNonEmpty!21640 condMapEmpty!21646) mapIsEmpty!21646))

(assert (= (and mapNonEmpty!21640 (not condMapEmpty!21646)) mapNonEmpty!21646))

(assert (= (and mapNonEmpty!21646 ((_ is ValueCellFull!6300) mapValue!21646)) b!472910))

(assert (= (and mapNonEmpty!21640 ((_ is ValueCellFull!6300) mapDefault!21646)) b!472911))

(declare-fun m!454807 () Bool)

(assert (=> mapNonEmpty!21646 m!454807))

(declare-fun b_lambda!10195 () Bool)

(assert (= b_lambda!10191 (or (and start!42368 b_free!11859) b_lambda!10195)))

(declare-fun b_lambda!10197 () Bool)

(assert (= b_lambda!10189 (or (and start!42368 b_free!11859) b_lambda!10197)))

(declare-fun b_lambda!10199 () Bool)

(assert (= b_lambda!10187 (or (and start!42368 b_free!11859) b_lambda!10199)))

(declare-fun b_lambda!10201 () Bool)

(assert (= b_lambda!10185 (or (and start!42368 b_free!11859) b_lambda!10201)))

(declare-fun b_lambda!10203 () Bool)

(assert (= b_lambda!10193 (or (and start!42368 b_free!11859) b_lambda!10203)))

(check-sat (not bm!30489) tp_is_empty!13287 (not bm!30464) (not b!472776) (not b!472853) (not b!472888) (not b!472774) (not b!472839) (not b!472787) (not bm!30481) (not b!472851) (not b_lambda!10199) (not b!472837) (not b!472897) (not b_lambda!10201) (not bm!30483) (not bm!30482) (not b!472899) (not bm!30488) (not bm!30480) (not b!472880) (not bm!30461) (not b!472901) (not b!472895) (not b!472848) (not d!75477) (not b_lambda!10195) (not b!472891) (not d!75483) (not b!472775) (not b_lambda!10203) (not b!472890) (not b!472883) (not b!472903) (not b!472889) (not b!472885) (not mapNonEmpty!21646) (not d!75481) (not b_lambda!10197) (not b!472789) (not b!472892) (not b!472902) (not b!472844) (not b_next!11859) b_and!20317 (not b!472850) (not b!472900) (not b!472887) (not d!75479) (not b!472836))
(check-sat b_and!20317 (not b_next!11859))
