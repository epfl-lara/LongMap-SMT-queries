; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33544 () Bool)

(assert start!33544)

(declare-fun b_free!6829 () Bool)

(declare-fun b_next!6829 () Bool)

(assert (=> start!33544 (= b_free!6829 (not b_next!6829))))

(declare-fun tp!23985 () Bool)

(declare-fun b_and!13979 () Bool)

(assert (=> start!33544 (= tp!23985 b_and!13979)))

(declare-fun b!332758 () Bool)

(declare-fun res!183346 () Bool)

(declare-fun e!204328 () Bool)

(assert (=> b!332758 (=> (not res!183346) (not e!204328))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332758 (= res!183346 (validKeyInArray!0 k0!1348))))

(declare-fun b!332759 () Bool)

(declare-fun e!204326 () Bool)

(declare-fun e!204327 () Bool)

(declare-fun mapRes!11562 () Bool)

(assert (=> b!332759 (= e!204326 (and e!204327 mapRes!11562))))

(declare-fun condMapEmpty!11562 () Bool)

(declare-datatypes ((V!10019 0))(
  ( (V!10020 (val!3435 Int)) )
))
(declare-datatypes ((ValueCell!3047 0))(
  ( (ValueCellFull!3047 (v!5589 V!10019)) (EmptyCell!3047) )
))
(declare-datatypes ((array!17141 0))(
  ( (array!17142 (arr!8103 (Array (_ BitVec 32) ValueCell!3047)) (size!8456 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17141)

(declare-fun mapDefault!11562 () ValueCell!3047)

(assert (=> b!332759 (= condMapEmpty!11562 (= (arr!8103 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3047)) mapDefault!11562)))))

(declare-fun b!332760 () Bool)

(declare-fun res!183349 () Bool)

(assert (=> b!332760 (=> (not res!183349) (not e!204328))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10019)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!17143 0))(
  ( (array!17144 (arr!8104 (Array (_ BitVec 32) (_ BitVec 64))) (size!8457 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17143)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10019)

(declare-datatypes ((tuple2!4942 0))(
  ( (tuple2!4943 (_1!2482 (_ BitVec 64)) (_2!2482 V!10019)) )
))
(declare-datatypes ((List!4581 0))(
  ( (Nil!4578) (Cons!4577 (h!5433 tuple2!4942) (t!9656 List!4581)) )
))
(declare-datatypes ((ListLongMap!3845 0))(
  ( (ListLongMap!3846 (toList!1938 List!4581)) )
))
(declare-fun contains!1991 (ListLongMap!3845 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1447 (array!17143 array!17141 (_ BitVec 32) (_ BitVec 32) V!10019 V!10019 (_ BitVec 32) Int) ListLongMap!3845)

(assert (=> b!332760 (= res!183349 (not (contains!1991 (getCurrentListMap!1447 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!11562 () Bool)

(declare-fun tp!23984 () Bool)

(declare-fun e!204325 () Bool)

(assert (=> mapNonEmpty!11562 (= mapRes!11562 (and tp!23984 e!204325))))

(declare-fun mapValue!11562 () ValueCell!3047)

(declare-fun mapRest!11562 () (Array (_ BitVec 32) ValueCell!3047))

(declare-fun mapKey!11562 () (_ BitVec 32))

(assert (=> mapNonEmpty!11562 (= (arr!8103 _values!1525) (store mapRest!11562 mapKey!11562 mapValue!11562))))

(declare-fun mapIsEmpty!11562 () Bool)

(assert (=> mapIsEmpty!11562 mapRes!11562))

(declare-fun b!332761 () Bool)

(declare-fun res!183345 () Bool)

(assert (=> b!332761 (=> (not res!183345) (not e!204328))))

(declare-datatypes ((List!4582 0))(
  ( (Nil!4579) (Cons!4578 (h!5434 (_ BitVec 64)) (t!9657 List!4582)) )
))
(declare-fun arrayNoDuplicates!0 (array!17143 (_ BitVec 32) List!4582) Bool)

(assert (=> b!332761 (= res!183345 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4579))))

(declare-fun b!332762 () Bool)

(declare-fun res!183347 () Bool)

(assert (=> b!332762 (=> (not res!183347) (not e!204328))))

(assert (=> b!332762 (= res!183347 (and (= (size!8456 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8457 _keys!1895) (size!8456 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332763 () Bool)

(declare-fun tp_is_empty!6781 () Bool)

(assert (=> b!332763 (= e!204327 tp_is_empty!6781)))

(declare-fun b!332764 () Bool)

(declare-fun res!183348 () Bool)

(assert (=> b!332764 (=> (not res!183348) (not e!204328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17143 (_ BitVec 32)) Bool)

(assert (=> b!332764 (= res!183348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332765 () Bool)

(assert (=> b!332765 (= e!204325 tp_is_empty!6781)))

(declare-fun b!332766 () Bool)

(declare-datatypes ((SeekEntryResult!3129 0))(
  ( (MissingZero!3129 (index!14695 (_ BitVec 32))) (Found!3129 (index!14696 (_ BitVec 32))) (Intermediate!3129 (undefined!3941 Bool) (index!14697 (_ BitVec 32)) (x!33166 (_ BitVec 32))) (Undefined!3129) (MissingVacant!3129 (index!14698 (_ BitVec 32))) )
))
(declare-fun lt!158919 () SeekEntryResult!3129)

(get-info :version)

(assert (=> b!332766 (= e!204328 (and ((_ is Found!3129) lt!158919) (= (select (arr!8104 _keys!1895) (index!14696 lt!158919)) k0!1348) (bvsge (index!14696 lt!158919) #b00000000000000000000000000000000) (bvsge (index!14696 lt!158919) (size!8457 _keys!1895))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17143 (_ BitVec 32)) SeekEntryResult!3129)

(assert (=> b!332766 (= lt!158919 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!183350 () Bool)

(assert (=> start!33544 (=> (not res!183350) (not e!204328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33544 (= res!183350 (validMask!0 mask!2385))))

(assert (=> start!33544 e!204328))

(assert (=> start!33544 true))

(assert (=> start!33544 tp_is_empty!6781))

(assert (=> start!33544 tp!23985))

(declare-fun array_inv!6046 (array!17141) Bool)

(assert (=> start!33544 (and (array_inv!6046 _values!1525) e!204326)))

(declare-fun array_inv!6047 (array!17143) Bool)

(assert (=> start!33544 (array_inv!6047 _keys!1895)))

(assert (= (and start!33544 res!183350) b!332762))

(assert (= (and b!332762 res!183347) b!332764))

(assert (= (and b!332764 res!183348) b!332761))

(assert (= (and b!332761 res!183345) b!332758))

(assert (= (and b!332758 res!183346) b!332760))

(assert (= (and b!332760 res!183349) b!332766))

(assert (= (and b!332759 condMapEmpty!11562) mapIsEmpty!11562))

(assert (= (and b!332759 (not condMapEmpty!11562)) mapNonEmpty!11562))

(assert (= (and mapNonEmpty!11562 ((_ is ValueCellFull!3047) mapValue!11562)) b!332765))

(assert (= (and b!332759 ((_ is ValueCellFull!3047) mapDefault!11562)) b!332763))

(assert (= start!33544 b!332759))

(declare-fun m!336651 () Bool)

(assert (=> b!332758 m!336651))

(declare-fun m!336653 () Bool)

(assert (=> b!332766 m!336653))

(declare-fun m!336655 () Bool)

(assert (=> b!332766 m!336655))

(declare-fun m!336657 () Bool)

(assert (=> b!332761 m!336657))

(declare-fun m!336659 () Bool)

(assert (=> b!332764 m!336659))

(declare-fun m!336661 () Bool)

(assert (=> start!33544 m!336661))

(declare-fun m!336663 () Bool)

(assert (=> start!33544 m!336663))

(declare-fun m!336665 () Bool)

(assert (=> start!33544 m!336665))

(declare-fun m!336667 () Bool)

(assert (=> b!332760 m!336667))

(assert (=> b!332760 m!336667))

(declare-fun m!336669 () Bool)

(assert (=> b!332760 m!336669))

(declare-fun m!336671 () Bool)

(assert (=> mapNonEmpty!11562 m!336671))

(check-sat (not b_next!6829) (not b!332760) (not mapNonEmpty!11562) tp_is_empty!6781 (not b!332758) (not b!332766) (not start!33544) (not b!332761) (not b!332764) b_and!13979)
(check-sat b_and!13979 (not b_next!6829))
(get-model)

(declare-fun b!332833 () Bool)

(declare-fun e!204366 () SeekEntryResult!3129)

(declare-fun e!204367 () SeekEntryResult!3129)

(assert (=> b!332833 (= e!204366 e!204367)))

(declare-fun lt!158934 () (_ BitVec 64))

(declare-fun lt!158933 () SeekEntryResult!3129)

(assert (=> b!332833 (= lt!158934 (select (arr!8104 _keys!1895) (index!14697 lt!158933)))))

(declare-fun c!52057 () Bool)

(assert (=> b!332833 (= c!52057 (= lt!158934 k0!1348))))

(declare-fun b!332834 () Bool)

(declare-fun e!204365 () SeekEntryResult!3129)

(assert (=> b!332834 (= e!204365 (MissingZero!3129 (index!14697 lt!158933)))))

(declare-fun b!332835 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17143 (_ BitVec 32)) SeekEntryResult!3129)

(assert (=> b!332835 (= e!204365 (seekKeyOrZeroReturnVacant!0 (x!33166 lt!158933) (index!14697 lt!158933) (index!14697 lt!158933) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!332836 () Bool)

(declare-fun c!52058 () Bool)

(assert (=> b!332836 (= c!52058 (= lt!158934 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!332836 (= e!204367 e!204365)))

(declare-fun d!70357 () Bool)

(declare-fun lt!158932 () SeekEntryResult!3129)

(assert (=> d!70357 (and (or ((_ is Undefined!3129) lt!158932) (not ((_ is Found!3129) lt!158932)) (and (bvsge (index!14696 lt!158932) #b00000000000000000000000000000000) (bvslt (index!14696 lt!158932) (size!8457 _keys!1895)))) (or ((_ is Undefined!3129) lt!158932) ((_ is Found!3129) lt!158932) (not ((_ is MissingZero!3129) lt!158932)) (and (bvsge (index!14695 lt!158932) #b00000000000000000000000000000000) (bvslt (index!14695 lt!158932) (size!8457 _keys!1895)))) (or ((_ is Undefined!3129) lt!158932) ((_ is Found!3129) lt!158932) ((_ is MissingZero!3129) lt!158932) (not ((_ is MissingVacant!3129) lt!158932)) (and (bvsge (index!14698 lt!158932) #b00000000000000000000000000000000) (bvslt (index!14698 lt!158932) (size!8457 _keys!1895)))) (or ((_ is Undefined!3129) lt!158932) (ite ((_ is Found!3129) lt!158932) (= (select (arr!8104 _keys!1895) (index!14696 lt!158932)) k0!1348) (ite ((_ is MissingZero!3129) lt!158932) (= (select (arr!8104 _keys!1895) (index!14695 lt!158932)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3129) lt!158932) (= (select (arr!8104 _keys!1895) (index!14698 lt!158932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70357 (= lt!158932 e!204366)))

(declare-fun c!52056 () Bool)

(assert (=> d!70357 (= c!52056 (and ((_ is Intermediate!3129) lt!158933) (undefined!3941 lt!158933)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17143 (_ BitVec 32)) SeekEntryResult!3129)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70357 (= lt!158933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70357 (validMask!0 mask!2385)))

(assert (=> d!70357 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!158932)))

(declare-fun b!332837 () Bool)

(assert (=> b!332837 (= e!204366 Undefined!3129)))

(declare-fun b!332838 () Bool)

(assert (=> b!332838 (= e!204367 (Found!3129 (index!14697 lt!158933)))))

(assert (= (and d!70357 c!52056) b!332837))

(assert (= (and d!70357 (not c!52056)) b!332833))

(assert (= (and b!332833 c!52057) b!332838))

(assert (= (and b!332833 (not c!52057)) b!332836))

(assert (= (and b!332836 c!52058) b!332834))

(assert (= (and b!332836 (not c!52058)) b!332835))

(declare-fun m!336717 () Bool)

(assert (=> b!332833 m!336717))

(declare-fun m!336719 () Bool)

(assert (=> b!332835 m!336719))

(declare-fun m!336721 () Bool)

(assert (=> d!70357 m!336721))

(declare-fun m!336723 () Bool)

(assert (=> d!70357 m!336723))

(assert (=> d!70357 m!336661))

(declare-fun m!336725 () Bool)

(assert (=> d!70357 m!336725))

(assert (=> d!70357 m!336721))

(declare-fun m!336727 () Bool)

(assert (=> d!70357 m!336727))

(declare-fun m!336729 () Bool)

(assert (=> d!70357 m!336729))

(assert (=> b!332766 d!70357))

(declare-fun b!332849 () Bool)

(declare-fun e!204379 () Bool)

(declare-fun e!204378 () Bool)

(assert (=> b!332849 (= e!204379 e!204378)))

(declare-fun res!183393 () Bool)

(assert (=> b!332849 (=> (not res!183393) (not e!204378))))

(declare-fun e!204376 () Bool)

(assert (=> b!332849 (= res!183393 (not e!204376))))

(declare-fun res!183394 () Bool)

(assert (=> b!332849 (=> (not res!183394) (not e!204376))))

(assert (=> b!332849 (= res!183394 (validKeyInArray!0 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332850 () Bool)

(declare-fun e!204377 () Bool)

(assert (=> b!332850 (= e!204378 e!204377)))

(declare-fun c!52061 () Bool)

(assert (=> b!332850 (= c!52061 (validKeyInArray!0 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70359 () Bool)

(declare-fun res!183395 () Bool)

(assert (=> d!70359 (=> res!183395 e!204379)))

(assert (=> d!70359 (= res!183395 (bvsge #b00000000000000000000000000000000 (size!8457 _keys!1895)))))

(assert (=> d!70359 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4579) e!204379)))

(declare-fun b!332851 () Bool)

(declare-fun call!26219 () Bool)

(assert (=> b!332851 (= e!204377 call!26219)))

(declare-fun b!332852 () Bool)

(assert (=> b!332852 (= e!204377 call!26219)))

(declare-fun bm!26216 () Bool)

(assert (=> bm!26216 (= call!26219 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52061 (Cons!4578 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000) Nil!4579) Nil!4579)))))

(declare-fun b!332853 () Bool)

(declare-fun contains!1993 (List!4582 (_ BitVec 64)) Bool)

(assert (=> b!332853 (= e!204376 (contains!1993 Nil!4579 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70359 (not res!183395)) b!332849))

(assert (= (and b!332849 res!183394) b!332853))

(assert (= (and b!332849 res!183393) b!332850))

(assert (= (and b!332850 c!52061) b!332852))

(assert (= (and b!332850 (not c!52061)) b!332851))

(assert (= (or b!332852 b!332851) bm!26216))

(declare-fun m!336731 () Bool)

(assert (=> b!332849 m!336731))

(assert (=> b!332849 m!336731))

(declare-fun m!336733 () Bool)

(assert (=> b!332849 m!336733))

(assert (=> b!332850 m!336731))

(assert (=> b!332850 m!336731))

(assert (=> b!332850 m!336733))

(assert (=> bm!26216 m!336731))

(declare-fun m!336735 () Bool)

(assert (=> bm!26216 m!336735))

(assert (=> b!332853 m!336731))

(assert (=> b!332853 m!336731))

(declare-fun m!336737 () Bool)

(assert (=> b!332853 m!336737))

(assert (=> b!332761 d!70359))

(declare-fun d!70361 () Bool)

(assert (=> d!70361 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332758 d!70361))

(declare-fun d!70363 () Bool)

(assert (=> d!70363 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33544 d!70363))

(declare-fun d!70365 () Bool)

(assert (=> d!70365 (= (array_inv!6046 _values!1525) (bvsge (size!8456 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33544 d!70365))

(declare-fun d!70367 () Bool)

(assert (=> d!70367 (= (array_inv!6047 _keys!1895) (bvsge (size!8457 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33544 d!70367))

(declare-fun d!70369 () Bool)

(declare-fun e!204385 () Bool)

(assert (=> d!70369 e!204385))

(declare-fun res!183398 () Bool)

(assert (=> d!70369 (=> res!183398 e!204385)))

(declare-fun lt!158945 () Bool)

(assert (=> d!70369 (= res!183398 (not lt!158945))))

(declare-fun lt!158946 () Bool)

(assert (=> d!70369 (= lt!158945 lt!158946)))

(declare-datatypes ((Unit!10342 0))(
  ( (Unit!10343) )
))
(declare-fun lt!158943 () Unit!10342)

(declare-fun e!204384 () Unit!10342)

(assert (=> d!70369 (= lt!158943 e!204384)))

(declare-fun c!52064 () Bool)

(assert (=> d!70369 (= c!52064 lt!158946)))

(declare-fun containsKey!312 (List!4581 (_ BitVec 64)) Bool)

(assert (=> d!70369 (= lt!158946 (containsKey!312 (toList!1938 (getCurrentListMap!1447 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70369 (= (contains!1991 (getCurrentListMap!1447 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!158945)))

(declare-fun b!332860 () Bool)

(declare-fun lt!158944 () Unit!10342)

(assert (=> b!332860 (= e!204384 lt!158944)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!261 (List!4581 (_ BitVec 64)) Unit!10342)

(assert (=> b!332860 (= lt!158944 (lemmaContainsKeyImpliesGetValueByKeyDefined!261 (toList!1938 (getCurrentListMap!1447 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!326 0))(
  ( (Some!325 (v!5592 V!10019)) (None!324) )
))
(declare-fun isDefined!262 (Option!326) Bool)

(declare-fun getValueByKey!320 (List!4581 (_ BitVec 64)) Option!326)

(assert (=> b!332860 (isDefined!262 (getValueByKey!320 (toList!1938 (getCurrentListMap!1447 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!332861 () Bool)

(declare-fun Unit!10344 () Unit!10342)

(assert (=> b!332861 (= e!204384 Unit!10344)))

(declare-fun b!332862 () Bool)

(assert (=> b!332862 (= e!204385 (isDefined!262 (getValueByKey!320 (toList!1938 (getCurrentListMap!1447 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70369 c!52064) b!332860))

(assert (= (and d!70369 (not c!52064)) b!332861))

(assert (= (and d!70369 (not res!183398)) b!332862))

(declare-fun m!336739 () Bool)

(assert (=> d!70369 m!336739))

(declare-fun m!336741 () Bool)

(assert (=> b!332860 m!336741))

(declare-fun m!336743 () Bool)

(assert (=> b!332860 m!336743))

(assert (=> b!332860 m!336743))

(declare-fun m!336745 () Bool)

(assert (=> b!332860 m!336745))

(assert (=> b!332862 m!336743))

(assert (=> b!332862 m!336743))

(assert (=> b!332862 m!336745))

(assert (=> b!332760 d!70369))

(declare-fun bm!26231 () Bool)

(declare-fun call!26237 () Bool)

(declare-fun lt!158995 () ListLongMap!3845)

(assert (=> bm!26231 (= call!26237 (contains!1991 lt!158995 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!332905 () Bool)

(declare-fun c!52080 () Bool)

(assert (=> b!332905 (= c!52080 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!204413 () ListLongMap!3845)

(declare-fun e!204417 () ListLongMap!3845)

(assert (=> b!332905 (= e!204413 e!204417)))

(declare-fun b!332906 () Bool)

(declare-fun e!204421 () Bool)

(declare-fun apply!264 (ListLongMap!3845 (_ BitVec 64)) V!10019)

(assert (=> b!332906 (= e!204421 (= (apply!264 lt!158995 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!332907 () Bool)

(declare-fun e!204422 () Bool)

(assert (=> b!332907 (= e!204422 (= (apply!264 lt!158995 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!332908 () Bool)

(declare-fun e!204415 () Bool)

(declare-fun get!4464 (ValueCell!3047 V!10019) V!10019)

(declare-fun dynLambda!598 (Int (_ BitVec 64)) V!10019)

(assert (=> b!332908 (= e!204415 (= (apply!264 lt!158995 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000)) (get!4464 (select (arr!8103 _values!1525) #b00000000000000000000000000000000) (dynLambda!598 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8456 _values!1525)))))

(assert (=> b!332908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8457 _keys!1895)))))

(declare-fun b!332909 () Bool)

(declare-fun e!204416 () ListLongMap!3845)

(assert (=> b!332909 (= e!204416 e!204413)))

(declare-fun c!52081 () Bool)

(assert (=> b!332909 (= c!52081 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!332910 () Bool)

(declare-fun e!204420 () Bool)

(assert (=> b!332910 (= e!204420 e!204415)))

(declare-fun res!183424 () Bool)

(assert (=> b!332910 (=> (not res!183424) (not e!204415))))

(assert (=> b!332910 (= res!183424 (contains!1991 lt!158995 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!332910 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8457 _keys!1895)))))

(declare-fun b!332911 () Bool)

(declare-fun call!26240 () ListLongMap!3845)

(declare-fun +!717 (ListLongMap!3845 tuple2!4942) ListLongMap!3845)

(assert (=> b!332911 (= e!204416 (+!717 call!26240 (tuple2!4943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun call!26238 () ListLongMap!3845)

(declare-fun bm!26233 () Bool)

(declare-fun call!26235 () ListLongMap!3845)

(declare-fun call!26234 () ListLongMap!3845)

(declare-fun c!52082 () Bool)

(assert (=> bm!26233 (= call!26240 (+!717 (ite c!52082 call!26235 (ite c!52081 call!26234 call!26238)) (ite (or c!52082 c!52081) (tuple2!4943 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!4943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26234 () Bool)

(declare-fun call!26239 () ListLongMap!3845)

(assert (=> bm!26234 (= call!26239 call!26240)))

(declare-fun b!332912 () Bool)

(assert (=> b!332912 (= e!204413 call!26239)))

(declare-fun b!332913 () Bool)

(assert (=> b!332913 (= e!204417 call!26239)))

(declare-fun b!332914 () Bool)

(declare-fun res!183425 () Bool)

(declare-fun e!204424 () Bool)

(assert (=> b!332914 (=> (not res!183425) (not e!204424))))

(assert (=> b!332914 (= res!183425 e!204420)))

(declare-fun res!183418 () Bool)

(assert (=> b!332914 (=> res!183418 e!204420)))

(declare-fun e!204419 () Bool)

(assert (=> b!332914 (= res!183418 (not e!204419))))

(declare-fun res!183422 () Bool)

(assert (=> b!332914 (=> (not res!183422) (not e!204419))))

(assert (=> b!332914 (= res!183422 (bvslt #b00000000000000000000000000000000 (size!8457 _keys!1895)))))

(declare-fun b!332915 () Bool)

(declare-fun e!204412 () Bool)

(assert (=> b!332915 (= e!204412 e!204422)))

(declare-fun res!183419 () Bool)

(declare-fun call!26236 () Bool)

(assert (=> b!332915 (= res!183419 call!26236)))

(assert (=> b!332915 (=> (not res!183419) (not e!204422))))

(declare-fun d!70371 () Bool)

(assert (=> d!70371 e!204424))

(declare-fun res!183420 () Bool)

(assert (=> d!70371 (=> (not res!183420) (not e!204424))))

(assert (=> d!70371 (= res!183420 (or (bvsge #b00000000000000000000000000000000 (size!8457 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8457 _keys!1895)))))))

(declare-fun lt!159009 () ListLongMap!3845)

(assert (=> d!70371 (= lt!158995 lt!159009)))

(declare-fun lt!159010 () Unit!10342)

(declare-fun e!204423 () Unit!10342)

(assert (=> d!70371 (= lt!159010 e!204423)))

(declare-fun c!52079 () Bool)

(declare-fun e!204414 () Bool)

(assert (=> d!70371 (= c!52079 e!204414)))

(declare-fun res!183417 () Bool)

(assert (=> d!70371 (=> (not res!183417) (not e!204414))))

(assert (=> d!70371 (= res!183417 (bvslt #b00000000000000000000000000000000 (size!8457 _keys!1895)))))

(assert (=> d!70371 (= lt!159009 e!204416)))

(assert (=> d!70371 (= c!52082 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70371 (validMask!0 mask!2385)))

(assert (=> d!70371 (= (getCurrentListMap!1447 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!158995)))

(declare-fun bm!26232 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!580 (array!17143 array!17141 (_ BitVec 32) (_ BitVec 32) V!10019 V!10019 (_ BitVec 32) Int) ListLongMap!3845)

(assert (=> bm!26232 (= call!26235 (getCurrentListMapNoExtraKeys!580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!332916 () Bool)

(assert (=> b!332916 (= e!204414 (validKeyInArray!0 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332917 () Bool)

(assert (=> b!332917 (= e!204424 e!204412)))

(declare-fun c!52078 () Bool)

(assert (=> b!332917 (= c!52078 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!332918 () Bool)

(declare-fun lt!159005 () Unit!10342)

(assert (=> b!332918 (= e!204423 lt!159005)))

(declare-fun lt!158994 () ListLongMap!3845)

(assert (=> b!332918 (= lt!158994 (getCurrentListMapNoExtraKeys!580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159007 () (_ BitVec 64))

(assert (=> b!332918 (= lt!159007 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!158999 () (_ BitVec 64))

(assert (=> b!332918 (= lt!158999 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!158998 () Unit!10342)

(declare-fun addStillContains!240 (ListLongMap!3845 (_ BitVec 64) V!10019 (_ BitVec 64)) Unit!10342)

(assert (=> b!332918 (= lt!158998 (addStillContains!240 lt!158994 lt!159007 zeroValue!1467 lt!158999))))

(assert (=> b!332918 (contains!1991 (+!717 lt!158994 (tuple2!4943 lt!159007 zeroValue!1467)) lt!158999)))

(declare-fun lt!158991 () Unit!10342)

(assert (=> b!332918 (= lt!158991 lt!158998)))

(declare-fun lt!159008 () ListLongMap!3845)

(assert (=> b!332918 (= lt!159008 (getCurrentListMapNoExtraKeys!580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159001 () (_ BitVec 64))

(assert (=> b!332918 (= lt!159001 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159006 () (_ BitVec 64))

(assert (=> b!332918 (= lt!159006 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159012 () Unit!10342)

(declare-fun addApplyDifferent!240 (ListLongMap!3845 (_ BitVec 64) V!10019 (_ BitVec 64)) Unit!10342)

(assert (=> b!332918 (= lt!159012 (addApplyDifferent!240 lt!159008 lt!159001 minValue!1467 lt!159006))))

(assert (=> b!332918 (= (apply!264 (+!717 lt!159008 (tuple2!4943 lt!159001 minValue!1467)) lt!159006) (apply!264 lt!159008 lt!159006))))

(declare-fun lt!159003 () Unit!10342)

(assert (=> b!332918 (= lt!159003 lt!159012)))

(declare-fun lt!159004 () ListLongMap!3845)

(assert (=> b!332918 (= lt!159004 (getCurrentListMapNoExtraKeys!580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!158996 () (_ BitVec 64))

(assert (=> b!332918 (= lt!158996 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159002 () (_ BitVec 64))

(assert (=> b!332918 (= lt!159002 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!158993 () Unit!10342)

(assert (=> b!332918 (= lt!158993 (addApplyDifferent!240 lt!159004 lt!158996 zeroValue!1467 lt!159002))))

(assert (=> b!332918 (= (apply!264 (+!717 lt!159004 (tuple2!4943 lt!158996 zeroValue!1467)) lt!159002) (apply!264 lt!159004 lt!159002))))

(declare-fun lt!159011 () Unit!10342)

(assert (=> b!332918 (= lt!159011 lt!158993)))

(declare-fun lt!158992 () ListLongMap!3845)

(assert (=> b!332918 (= lt!158992 (getCurrentListMapNoExtraKeys!580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159000 () (_ BitVec 64))

(assert (=> b!332918 (= lt!159000 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!158997 () (_ BitVec 64))

(assert (=> b!332918 (= lt!158997 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!332918 (= lt!159005 (addApplyDifferent!240 lt!158992 lt!159000 minValue!1467 lt!158997))))

(assert (=> b!332918 (= (apply!264 (+!717 lt!158992 (tuple2!4943 lt!159000 minValue!1467)) lt!158997) (apply!264 lt!158992 lt!158997))))

(declare-fun bm!26235 () Bool)

(assert (=> bm!26235 (= call!26234 call!26235)))

(declare-fun b!332919 () Bool)

(declare-fun e!204418 () Bool)

(assert (=> b!332919 (= e!204418 (not call!26237))))

(declare-fun bm!26236 () Bool)

(assert (=> bm!26236 (= call!26236 (contains!1991 lt!158995 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!332920 () Bool)

(assert (=> b!332920 (= e!204418 e!204421)))

(declare-fun res!183421 () Bool)

(assert (=> b!332920 (= res!183421 call!26237)))

(assert (=> b!332920 (=> (not res!183421) (not e!204421))))

(declare-fun b!332921 () Bool)

(assert (=> b!332921 (= e!204412 (not call!26236))))

(declare-fun b!332922 () Bool)

(assert (=> b!332922 (= e!204417 call!26238)))

(declare-fun b!332923 () Bool)

(assert (=> b!332923 (= e!204419 (validKeyInArray!0 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332924 () Bool)

(declare-fun Unit!10345 () Unit!10342)

(assert (=> b!332924 (= e!204423 Unit!10345)))

(declare-fun bm!26237 () Bool)

(assert (=> bm!26237 (= call!26238 call!26234)))

(declare-fun b!332925 () Bool)

(declare-fun res!183423 () Bool)

(assert (=> b!332925 (=> (not res!183423) (not e!204424))))

(assert (=> b!332925 (= res!183423 e!204418)))

(declare-fun c!52077 () Bool)

(assert (=> b!332925 (= c!52077 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!70371 c!52082) b!332911))

(assert (= (and d!70371 (not c!52082)) b!332909))

(assert (= (and b!332909 c!52081) b!332912))

(assert (= (and b!332909 (not c!52081)) b!332905))

(assert (= (and b!332905 c!52080) b!332913))

(assert (= (and b!332905 (not c!52080)) b!332922))

(assert (= (or b!332913 b!332922) bm!26237))

(assert (= (or b!332912 bm!26237) bm!26235))

(assert (= (or b!332912 b!332913) bm!26234))

(assert (= (or b!332911 bm!26235) bm!26232))

(assert (= (or b!332911 bm!26234) bm!26233))

(assert (= (and d!70371 res!183417) b!332916))

(assert (= (and d!70371 c!52079) b!332918))

(assert (= (and d!70371 (not c!52079)) b!332924))

(assert (= (and d!70371 res!183420) b!332914))

(assert (= (and b!332914 res!183422) b!332923))

(assert (= (and b!332914 (not res!183418)) b!332910))

(assert (= (and b!332910 res!183424) b!332908))

(assert (= (and b!332914 res!183425) b!332925))

(assert (= (and b!332925 c!52077) b!332920))

(assert (= (and b!332925 (not c!52077)) b!332919))

(assert (= (and b!332920 res!183421) b!332906))

(assert (= (or b!332920 b!332919) bm!26231))

(assert (= (and b!332925 res!183423) b!332917))

(assert (= (and b!332917 c!52078) b!332915))

(assert (= (and b!332917 (not c!52078)) b!332921))

(assert (= (and b!332915 res!183419) b!332907))

(assert (= (or b!332915 b!332921) bm!26236))

(declare-fun b_lambda!8377 () Bool)

(assert (=> (not b_lambda!8377) (not b!332908)))

(declare-fun t!9660 () Bool)

(declare-fun tb!3035 () Bool)

(assert (=> (and start!33544 (= defaultEntry!1528 defaultEntry!1528) t!9660) tb!3035))

(declare-fun result!5451 () Bool)

(assert (=> tb!3035 (= result!5451 tp_is_empty!6781)))

(assert (=> b!332908 t!9660))

(declare-fun b_and!13985 () Bool)

(assert (= b_and!13979 (and (=> t!9660 result!5451) b_and!13985)))

(assert (=> b!332923 m!336731))

(assert (=> b!332923 m!336731))

(assert (=> b!332923 m!336733))

(assert (=> b!332916 m!336731))

(assert (=> b!332916 m!336731))

(assert (=> b!332916 m!336733))

(declare-fun m!336747 () Bool)

(assert (=> b!332907 m!336747))

(assert (=> d!70371 m!336661))

(declare-fun m!336749 () Bool)

(assert (=> bm!26236 m!336749))

(declare-fun m!336751 () Bool)

(assert (=> bm!26231 m!336751))

(declare-fun m!336753 () Bool)

(assert (=> bm!26233 m!336753))

(declare-fun m!336755 () Bool)

(assert (=> b!332911 m!336755))

(declare-fun m!336757 () Bool)

(assert (=> b!332918 m!336757))

(declare-fun m!336759 () Bool)

(assert (=> b!332918 m!336759))

(declare-fun m!336761 () Bool)

(assert (=> b!332918 m!336761))

(declare-fun m!336763 () Bool)

(assert (=> b!332918 m!336763))

(declare-fun m!336765 () Bool)

(assert (=> b!332918 m!336765))

(assert (=> b!332918 m!336731))

(declare-fun m!336767 () Bool)

(assert (=> b!332918 m!336767))

(declare-fun m!336769 () Bool)

(assert (=> b!332918 m!336769))

(declare-fun m!336771 () Bool)

(assert (=> b!332918 m!336771))

(declare-fun m!336773 () Bool)

(assert (=> b!332918 m!336773))

(declare-fun m!336775 () Bool)

(assert (=> b!332918 m!336775))

(declare-fun m!336777 () Bool)

(assert (=> b!332918 m!336777))

(assert (=> b!332918 m!336777))

(declare-fun m!336779 () Bool)

(assert (=> b!332918 m!336779))

(assert (=> b!332918 m!336761))

(declare-fun m!336781 () Bool)

(assert (=> b!332918 m!336781))

(assert (=> b!332918 m!336765))

(declare-fun m!336783 () Bool)

(assert (=> b!332918 m!336783))

(assert (=> b!332918 m!336757))

(declare-fun m!336785 () Bool)

(assert (=> b!332918 m!336785))

(declare-fun m!336787 () Bool)

(assert (=> b!332918 m!336787))

(assert (=> b!332910 m!336731))

(assert (=> b!332910 m!336731))

(declare-fun m!336789 () Bool)

(assert (=> b!332910 m!336789))

(declare-fun m!336791 () Bool)

(assert (=> b!332906 m!336791))

(assert (=> bm!26232 m!336787))

(declare-fun m!336793 () Bool)

(assert (=> b!332908 m!336793))

(declare-fun m!336795 () Bool)

(assert (=> b!332908 m!336795))

(declare-fun m!336797 () Bool)

(assert (=> b!332908 m!336797))

(assert (=> b!332908 m!336731))

(declare-fun m!336799 () Bool)

(assert (=> b!332908 m!336799))

(assert (=> b!332908 m!336793))

(assert (=> b!332908 m!336795))

(assert (=> b!332908 m!336731))

(assert (=> b!332760 d!70371))

(declare-fun bm!26240 () Bool)

(declare-fun call!26243 () Bool)

(assert (=> bm!26240 (= call!26243 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!332937 () Bool)

(declare-fun e!204433 () Bool)

(declare-fun e!204432 () Bool)

(assert (=> b!332937 (= e!204433 e!204432)))

(declare-fun lt!159021 () (_ BitVec 64))

(assert (=> b!332937 (= lt!159021 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159019 () Unit!10342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17143 (_ BitVec 64) (_ BitVec 32)) Unit!10342)

(assert (=> b!332937 (= lt!159019 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159021 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!332937 (arrayContainsKey!0 _keys!1895 lt!159021 #b00000000000000000000000000000000)))

(declare-fun lt!159020 () Unit!10342)

(assert (=> b!332937 (= lt!159020 lt!159019)))

(declare-fun res!183431 () Bool)

(assert (=> b!332937 (= res!183431 (= (seekEntryOrOpen!0 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3129 #b00000000000000000000000000000000)))))

(assert (=> b!332937 (=> (not res!183431) (not e!204432))))

(declare-fun b!332938 () Bool)

(assert (=> b!332938 (= e!204432 call!26243)))

(declare-fun b!332939 () Bool)

(declare-fun e!204431 () Bool)

(assert (=> b!332939 (= e!204431 e!204433)))

(declare-fun c!52085 () Bool)

(assert (=> b!332939 (= c!52085 (validKeyInArray!0 (select (arr!8104 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332936 () Bool)

(assert (=> b!332936 (= e!204433 call!26243)))

(declare-fun d!70373 () Bool)

(declare-fun res!183430 () Bool)

(assert (=> d!70373 (=> res!183430 e!204431)))

(assert (=> d!70373 (= res!183430 (bvsge #b00000000000000000000000000000000 (size!8457 _keys!1895)))))

(assert (=> d!70373 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!204431)))

(assert (= (and d!70373 (not res!183430)) b!332939))

(assert (= (and b!332939 c!52085) b!332937))

(assert (= (and b!332939 (not c!52085)) b!332936))

(assert (= (and b!332937 res!183431) b!332938))

(assert (= (or b!332938 b!332936) bm!26240))

(declare-fun m!336801 () Bool)

(assert (=> bm!26240 m!336801))

(assert (=> b!332937 m!336731))

(declare-fun m!336803 () Bool)

(assert (=> b!332937 m!336803))

(declare-fun m!336805 () Bool)

(assert (=> b!332937 m!336805))

(assert (=> b!332937 m!336731))

(declare-fun m!336807 () Bool)

(assert (=> b!332937 m!336807))

(assert (=> b!332939 m!336731))

(assert (=> b!332939 m!336731))

(assert (=> b!332939 m!336733))

(assert (=> b!332764 d!70373))

(declare-fun b!332947 () Bool)

(declare-fun e!204438 () Bool)

(assert (=> b!332947 (= e!204438 tp_is_empty!6781)))

(declare-fun mapNonEmpty!11571 () Bool)

(declare-fun mapRes!11571 () Bool)

(declare-fun tp!24000 () Bool)

(declare-fun e!204439 () Bool)

(assert (=> mapNonEmpty!11571 (= mapRes!11571 (and tp!24000 e!204439))))

(declare-fun mapValue!11571 () ValueCell!3047)

(declare-fun mapKey!11571 () (_ BitVec 32))

(declare-fun mapRest!11571 () (Array (_ BitVec 32) ValueCell!3047))

(assert (=> mapNonEmpty!11571 (= mapRest!11562 (store mapRest!11571 mapKey!11571 mapValue!11571))))

(declare-fun condMapEmpty!11571 () Bool)

(declare-fun mapDefault!11571 () ValueCell!3047)

(assert (=> mapNonEmpty!11562 (= condMapEmpty!11571 (= mapRest!11562 ((as const (Array (_ BitVec 32) ValueCell!3047)) mapDefault!11571)))))

(assert (=> mapNonEmpty!11562 (= tp!23984 (and e!204438 mapRes!11571))))

(declare-fun b!332946 () Bool)

(assert (=> b!332946 (= e!204439 tp_is_empty!6781)))

(declare-fun mapIsEmpty!11571 () Bool)

(assert (=> mapIsEmpty!11571 mapRes!11571))

(assert (= (and mapNonEmpty!11562 condMapEmpty!11571) mapIsEmpty!11571))

(assert (= (and mapNonEmpty!11562 (not condMapEmpty!11571)) mapNonEmpty!11571))

(assert (= (and mapNonEmpty!11571 ((_ is ValueCellFull!3047) mapValue!11571)) b!332946))

(assert (= (and mapNonEmpty!11562 ((_ is ValueCellFull!3047) mapDefault!11571)) b!332947))

(declare-fun m!336809 () Bool)

(assert (=> mapNonEmpty!11571 m!336809))

(declare-fun b_lambda!8379 () Bool)

(assert (= b_lambda!8377 (or (and start!33544 b_free!6829) b_lambda!8379)))

(check-sat (not d!70369) (not b!332910) (not bm!26231) (not b!332835) (not b!332918) (not b!332862) (not b!332937) (not bm!26233) (not mapNonEmpty!11571) (not bm!26232) (not d!70371) (not bm!26216) (not b!332939) (not b_next!6829) (not b!332850) (not b!332916) (not b!332923) (not bm!26236) (not b_lambda!8379) (not b!332853) (not b!332906) (not b!332908) b_and!13985 (not b!332907) (not bm!26240) (not d!70357) (not b!332911) (not b!332860) tp_is_empty!6781 (not b!332849))
(check-sat b_and!13985 (not b_next!6829))
