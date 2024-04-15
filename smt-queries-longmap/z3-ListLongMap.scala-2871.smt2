; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41320 () Bool)

(assert start!41320)

(declare-fun b!461859 () Bool)

(declare-fun res!276269 () Bool)

(declare-fun e!269426 () Bool)

(assert (=> b!461859 (=> (not res!276269) (not e!269426))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28723 0))(
  ( (array!28724 (arr!13796 (Array (_ BitVec 32) (_ BitVec 64))) (size!14149 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28723)

(declare-datatypes ((V!17723 0))(
  ( (V!17724 (val!6276 Int)) )
))
(declare-datatypes ((ValueCell!5888 0))(
  ( (ValueCellFull!5888 (v!8556 V!17723)) (EmptyCell!5888) )
))
(declare-datatypes ((array!28725 0))(
  ( (array!28726 (arr!13797 (Array (_ BitVec 32) ValueCell!5888)) (size!14150 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28725)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!461859 (= res!276269 (and (= (size!14150 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14149 _keys!1025) (size!14150 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!461860 () Bool)

(declare-fun res!276270 () Bool)

(assert (=> b!461860 (=> (not res!276270) (not e!269426))))

(declare-datatypes ((List!8355 0))(
  ( (Nil!8352) (Cons!8351 (h!9207 (_ BitVec 64)) (t!14290 List!8355)) )
))
(declare-fun noDuplicate!206 (List!8355) Bool)

(assert (=> b!461860 (= res!276270 (noDuplicate!206 Nil!8352))))

(declare-fun b!461861 () Bool)

(declare-fun e!269424 () Bool)

(assert (=> b!461861 (= e!269426 e!269424)))

(declare-fun res!276268 () Bool)

(assert (=> b!461861 (=> res!276268 e!269424)))

(declare-fun contains!2505 (List!8355 (_ BitVec 64)) Bool)

(assert (=> b!461861 (= res!276268 (contains!2505 Nil!8352 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!461862 () Bool)

(declare-fun e!269425 () Bool)

(declare-fun e!269423 () Bool)

(declare-fun mapRes!20362 () Bool)

(assert (=> b!461862 (= e!269425 (and e!269423 mapRes!20362))))

(declare-fun condMapEmpty!20362 () Bool)

(declare-fun mapDefault!20362 () ValueCell!5888)

(assert (=> b!461862 (= condMapEmpty!20362 (= (arr!13797 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5888)) mapDefault!20362)))))

(declare-fun b!461863 () Bool)

(declare-fun e!269428 () Bool)

(declare-fun tp_is_empty!12463 () Bool)

(assert (=> b!461863 (= e!269428 tp_is_empty!12463)))

(declare-fun b!461864 () Bool)

(declare-fun res!276272 () Bool)

(assert (=> b!461864 (=> (not res!276272) (not e!269426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28723 (_ BitVec 32)) Bool)

(assert (=> b!461864 (= res!276272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276273 () Bool)

(assert (=> start!41320 (=> (not res!276273) (not e!269426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41320 (= res!276273 (validMask!0 mask!1365))))

(assert (=> start!41320 e!269426))

(assert (=> start!41320 true))

(declare-fun array_inv!10046 (array!28723) Bool)

(assert (=> start!41320 (array_inv!10046 _keys!1025)))

(declare-fun array_inv!10047 (array!28725) Bool)

(assert (=> start!41320 (and (array_inv!10047 _values!833) e!269425)))

(declare-fun mapNonEmpty!20362 () Bool)

(declare-fun tp!39181 () Bool)

(assert (=> mapNonEmpty!20362 (= mapRes!20362 (and tp!39181 e!269428))))

(declare-fun mapValue!20362 () ValueCell!5888)

(declare-fun mapRest!20362 () (Array (_ BitVec 32) ValueCell!5888))

(declare-fun mapKey!20362 () (_ BitVec 32))

(assert (=> mapNonEmpty!20362 (= (arr!13797 _values!833) (store mapRest!20362 mapKey!20362 mapValue!20362))))

(declare-fun mapIsEmpty!20362 () Bool)

(assert (=> mapIsEmpty!20362 mapRes!20362))

(declare-fun b!461865 () Bool)

(assert (=> b!461865 (= e!269423 tp_is_empty!12463)))

(declare-fun b!461866 () Bool)

(assert (=> b!461866 (= e!269424 (contains!2505 Nil!8352 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!461867 () Bool)

(declare-fun res!276271 () Bool)

(assert (=> b!461867 (=> (not res!276271) (not e!269426))))

(assert (=> b!461867 (= res!276271 (and (bvsle #b00000000000000000000000000000000 (size!14149 _keys!1025)) (bvslt (size!14149 _keys!1025) #b01111111111111111111111111111111)))))

(assert (= (and start!41320 res!276273) b!461859))

(assert (= (and b!461859 res!276269) b!461864))

(assert (= (and b!461864 res!276272) b!461867))

(assert (= (and b!461867 res!276271) b!461860))

(assert (= (and b!461860 res!276270) b!461861))

(assert (= (and b!461861 (not res!276268)) b!461866))

(assert (= (and b!461862 condMapEmpty!20362) mapIsEmpty!20362))

(assert (= (and b!461862 (not condMapEmpty!20362)) mapNonEmpty!20362))

(get-info :version)

(assert (= (and mapNonEmpty!20362 ((_ is ValueCellFull!5888) mapValue!20362)) b!461863))

(assert (= (and b!461862 ((_ is ValueCellFull!5888) mapDefault!20362)) b!461865))

(assert (= start!41320 b!461862))

(declare-fun m!444435 () Bool)

(assert (=> b!461866 m!444435))

(declare-fun m!444437 () Bool)

(assert (=> start!41320 m!444437))

(declare-fun m!444439 () Bool)

(assert (=> start!41320 m!444439))

(declare-fun m!444441 () Bool)

(assert (=> start!41320 m!444441))

(declare-fun m!444443 () Bool)

(assert (=> b!461860 m!444443))

(declare-fun m!444445 () Bool)

(assert (=> b!461864 m!444445))

(declare-fun m!444447 () Bool)

(assert (=> mapNonEmpty!20362 m!444447))

(declare-fun m!444449 () Bool)

(assert (=> b!461861 m!444449))

(check-sat tp_is_empty!12463 (not b!461861) (not mapNonEmpty!20362) (not b!461864) (not b!461860) (not start!41320) (not b!461866))
(check-sat)
(get-model)

(declare-fun d!74739 () Bool)

(declare-fun lt!208930 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!206 (List!8355) (InoxSet (_ BitVec 64)))

(assert (=> d!74739 (= lt!208930 (select (content!206 Nil!8352) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!269469 () Bool)

(assert (=> d!74739 (= lt!208930 e!269469)))

(declare-fun res!276314 () Bool)

(assert (=> d!74739 (=> (not res!276314) (not e!269469))))

(assert (=> d!74739 (= res!276314 ((_ is Cons!8351) Nil!8352))))

(assert (=> d!74739 (= (contains!2505 Nil!8352 #b0000000000000000000000000000000000000000000000000000000000000000) lt!208930)))

(declare-fun b!461926 () Bool)

(declare-fun e!269470 () Bool)

(assert (=> b!461926 (= e!269469 e!269470)))

(declare-fun res!276315 () Bool)

(assert (=> b!461926 (=> res!276315 e!269470)))

(assert (=> b!461926 (= res!276315 (= (h!9207 Nil!8352) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!461927 () Bool)

(assert (=> b!461927 (= e!269470 (contains!2505 (t!14290 Nil!8352) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!74739 res!276314) b!461926))

(assert (= (and b!461926 (not res!276315)) b!461927))

(declare-fun m!444483 () Bool)

(assert (=> d!74739 m!444483))

(declare-fun m!444485 () Bool)

(assert (=> d!74739 m!444485))

(declare-fun m!444487 () Bool)

(assert (=> b!461927 m!444487))

(assert (=> b!461861 d!74739))

(declare-fun d!74741 () Bool)

(declare-fun lt!208931 () Bool)

(assert (=> d!74741 (= lt!208931 (select (content!206 Nil!8352) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!269471 () Bool)

(assert (=> d!74741 (= lt!208931 e!269471)))

(declare-fun res!276316 () Bool)

(assert (=> d!74741 (=> (not res!276316) (not e!269471))))

(assert (=> d!74741 (= res!276316 ((_ is Cons!8351) Nil!8352))))

(assert (=> d!74741 (= (contains!2505 Nil!8352 #b1000000000000000000000000000000000000000000000000000000000000000) lt!208931)))

(declare-fun b!461928 () Bool)

(declare-fun e!269472 () Bool)

(assert (=> b!461928 (= e!269471 e!269472)))

(declare-fun res!276317 () Bool)

(assert (=> b!461928 (=> res!276317 e!269472)))

(assert (=> b!461928 (= res!276317 (= (h!9207 Nil!8352) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!461929 () Bool)

(assert (=> b!461929 (= e!269472 (contains!2505 (t!14290 Nil!8352) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!74741 res!276316) b!461928))

(assert (= (and b!461928 (not res!276317)) b!461929))

(assert (=> d!74741 m!444483))

(declare-fun m!444489 () Bool)

(assert (=> d!74741 m!444489))

(declare-fun m!444491 () Bool)

(assert (=> b!461929 m!444491))

(assert (=> b!461866 d!74741))

(declare-fun d!74743 () Bool)

(assert (=> d!74743 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41320 d!74743))

(declare-fun d!74745 () Bool)

(assert (=> d!74745 (= (array_inv!10046 _keys!1025) (bvsge (size!14149 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41320 d!74745))

(declare-fun d!74747 () Bool)

(assert (=> d!74747 (= (array_inv!10047 _values!833) (bvsge (size!14150 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41320 d!74747))

(declare-fun b!461939 () Bool)

(declare-fun e!269479 () Bool)

(declare-fun call!30178 () Bool)

(assert (=> b!461939 (= e!269479 call!30178)))

(declare-fun bm!30175 () Bool)

(assert (=> bm!30175 (= call!30178 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!74749 () Bool)

(declare-fun res!276323 () Bool)

(declare-fun e!269481 () Bool)

(assert (=> d!74749 (=> res!276323 e!269481)))

(assert (=> d!74749 (= res!276323 (bvsge #b00000000000000000000000000000000 (size!14149 _keys!1025)))))

(assert (=> d!74749 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269481)))

(declare-fun b!461938 () Bool)

(assert (=> b!461938 (= e!269481 e!269479)))

(declare-fun c!56557 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461938 (= c!56557 (validKeyInArray!0 (select (arr!13796 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!461940 () Bool)

(declare-fun e!269480 () Bool)

(assert (=> b!461940 (= e!269480 call!30178)))

(declare-fun b!461941 () Bool)

(assert (=> b!461941 (= e!269479 e!269480)))

(declare-fun lt!208940 () (_ BitVec 64))

(assert (=> b!461941 (= lt!208940 (select (arr!13796 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13414 0))(
  ( (Unit!13415) )
))
(declare-fun lt!208938 () Unit!13414)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28723 (_ BitVec 64) (_ BitVec 32)) Unit!13414)

(assert (=> b!461941 (= lt!208938 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!208940 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461941 (arrayContainsKey!0 _keys!1025 lt!208940 #b00000000000000000000000000000000)))

(declare-fun lt!208939 () Unit!13414)

(assert (=> b!461941 (= lt!208939 lt!208938)))

(declare-fun res!276322 () Bool)

(declare-datatypes ((SeekEntryResult!3536 0))(
  ( (MissingZero!3536 (index!16323 (_ BitVec 32))) (Found!3536 (index!16324 (_ BitVec 32))) (Intermediate!3536 (undefined!4348 Bool) (index!16325 (_ BitVec 32)) (x!43075 (_ BitVec 32))) (Undefined!3536) (MissingVacant!3536 (index!16326 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28723 (_ BitVec 32)) SeekEntryResult!3536)

(assert (=> b!461941 (= res!276322 (= (seekEntryOrOpen!0 (select (arr!13796 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3536 #b00000000000000000000000000000000)))))

(assert (=> b!461941 (=> (not res!276322) (not e!269480))))

(assert (= (and d!74749 (not res!276323)) b!461938))

(assert (= (and b!461938 c!56557) b!461941))

(assert (= (and b!461938 (not c!56557)) b!461939))

(assert (= (and b!461941 res!276322) b!461940))

(assert (= (or b!461940 b!461939) bm!30175))

(declare-fun m!444493 () Bool)

(assert (=> bm!30175 m!444493))

(declare-fun m!444495 () Bool)

(assert (=> b!461938 m!444495))

(assert (=> b!461938 m!444495))

(declare-fun m!444497 () Bool)

(assert (=> b!461938 m!444497))

(assert (=> b!461941 m!444495))

(declare-fun m!444499 () Bool)

(assert (=> b!461941 m!444499))

(declare-fun m!444501 () Bool)

(assert (=> b!461941 m!444501))

(assert (=> b!461941 m!444495))

(declare-fun m!444503 () Bool)

(assert (=> b!461941 m!444503))

(assert (=> b!461864 d!74749))

(declare-fun d!74751 () Bool)

(declare-fun res!276328 () Bool)

(declare-fun e!269486 () Bool)

(assert (=> d!74751 (=> res!276328 e!269486)))

(assert (=> d!74751 (= res!276328 ((_ is Nil!8352) Nil!8352))))

(assert (=> d!74751 (= (noDuplicate!206 Nil!8352) e!269486)))

(declare-fun b!461946 () Bool)

(declare-fun e!269487 () Bool)

(assert (=> b!461946 (= e!269486 e!269487)))

(declare-fun res!276329 () Bool)

(assert (=> b!461946 (=> (not res!276329) (not e!269487))))

(assert (=> b!461946 (= res!276329 (not (contains!2505 (t!14290 Nil!8352) (h!9207 Nil!8352))))))

(declare-fun b!461947 () Bool)

(assert (=> b!461947 (= e!269487 (noDuplicate!206 (t!14290 Nil!8352)))))

(assert (= (and d!74751 (not res!276328)) b!461946))

(assert (= (and b!461946 res!276329) b!461947))

(declare-fun m!444505 () Bool)

(assert (=> b!461946 m!444505))

(declare-fun m!444507 () Bool)

(assert (=> b!461947 m!444507))

(assert (=> b!461860 d!74751))

(declare-fun b!461954 () Bool)

(declare-fun e!269492 () Bool)

(assert (=> b!461954 (= e!269492 tp_is_empty!12463)))

(declare-fun condMapEmpty!20371 () Bool)

(declare-fun mapDefault!20371 () ValueCell!5888)

(assert (=> mapNonEmpty!20362 (= condMapEmpty!20371 (= mapRest!20362 ((as const (Array (_ BitVec 32) ValueCell!5888)) mapDefault!20371)))))

(declare-fun e!269493 () Bool)

(declare-fun mapRes!20371 () Bool)

(assert (=> mapNonEmpty!20362 (= tp!39181 (and e!269493 mapRes!20371))))

(declare-fun b!461955 () Bool)

(assert (=> b!461955 (= e!269493 tp_is_empty!12463)))

(declare-fun mapNonEmpty!20371 () Bool)

(declare-fun tp!39190 () Bool)

(assert (=> mapNonEmpty!20371 (= mapRes!20371 (and tp!39190 e!269492))))

(declare-fun mapRest!20371 () (Array (_ BitVec 32) ValueCell!5888))

(declare-fun mapKey!20371 () (_ BitVec 32))

(declare-fun mapValue!20371 () ValueCell!5888)

(assert (=> mapNonEmpty!20371 (= mapRest!20362 (store mapRest!20371 mapKey!20371 mapValue!20371))))

(declare-fun mapIsEmpty!20371 () Bool)

(assert (=> mapIsEmpty!20371 mapRes!20371))

(assert (= (and mapNonEmpty!20362 condMapEmpty!20371) mapIsEmpty!20371))

(assert (= (and mapNonEmpty!20362 (not condMapEmpty!20371)) mapNonEmpty!20371))

(assert (= (and mapNonEmpty!20371 ((_ is ValueCellFull!5888) mapValue!20371)) b!461954))

(assert (= (and mapNonEmpty!20362 ((_ is ValueCellFull!5888) mapDefault!20371)) b!461955))

(declare-fun m!444509 () Bool)

(assert (=> mapNonEmpty!20371 m!444509))

(check-sat tp_is_empty!12463 (not mapNonEmpty!20371) (not d!74741) (not b!461927) (not b!461929) (not b!461946) (not bm!30175) (not b!461941) (not d!74739) (not b!461947) (not b!461938))
(check-sat)
