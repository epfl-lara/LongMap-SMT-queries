; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34016 () Bool)

(assert start!34016)

(declare-fun b_free!7135 () Bool)

(declare-fun b_next!7135 () Bool)

(assert (=> start!34016 (= b_free!7135 (not b_next!7135))))

(declare-fun tp!24926 () Bool)

(declare-fun b_and!14301 () Bool)

(assert (=> start!34016 (= tp!24926 b_and!14301)))

(declare-fun b!338794 () Bool)

(declare-fun e!207859 () Bool)

(declare-fun tp_is_empty!7087 () Bool)

(assert (=> b!338794 (= e!207859 tp_is_empty!7087)))

(declare-fun res!187165 () Bool)

(declare-fun e!207862 () Bool)

(assert (=> start!34016 (=> (not res!187165) (not e!207862))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34016 (= res!187165 (validMask!0 mask!2385))))

(assert (=> start!34016 e!207862))

(assert (=> start!34016 true))

(assert (=> start!34016 tp_is_empty!7087))

(assert (=> start!34016 tp!24926))

(declare-datatypes ((V!10427 0))(
  ( (V!10428 (val!3588 Int)) )
))
(declare-datatypes ((ValueCell!3200 0))(
  ( (ValueCellFull!3200 (v!5750 V!10427)) (EmptyCell!3200) )
))
(declare-datatypes ((array!17751 0))(
  ( (array!17752 (arr!8400 (Array (_ BitVec 32) ValueCell!3200)) (size!8753 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17751)

(declare-fun e!207861 () Bool)

(declare-fun array_inv!6260 (array!17751) Bool)

(assert (=> start!34016 (and (array_inv!6260 _values!1525) e!207861)))

(declare-datatypes ((array!17753 0))(
  ( (array!17754 (arr!8401 (Array (_ BitVec 32) (_ BitVec 64))) (size!8754 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17753)

(declare-fun array_inv!6261 (array!17753) Bool)

(assert (=> start!34016 (array_inv!6261 _keys!1895)))

(declare-fun b!338795 () Bool)

(declare-fun res!187167 () Bool)

(declare-fun e!207857 () Bool)

(assert (=> b!338795 (=> (not res!187167) (not e!207857))))

(declare-datatypes ((SeekEntryResult!3242 0))(
  ( (MissingZero!3242 (index!15147 (_ BitVec 32))) (Found!3242 (index!15148 (_ BitVec 32))) (Intermediate!3242 (undefined!4054 Bool) (index!15149 (_ BitVec 32)) (x!33767 (_ BitVec 32))) (Undefined!3242) (MissingVacant!3242 (index!15150 (_ BitVec 32))) )
))
(declare-fun lt!160809 () SeekEntryResult!3242)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!338795 (= res!187167 (inRange!0 (index!15147 lt!160809) mask!2385))))

(declare-fun b!338796 () Bool)

(declare-fun e!207856 () Bool)

(declare-fun mapRes!12045 () Bool)

(assert (=> b!338796 (= e!207861 (and e!207856 mapRes!12045))))

(declare-fun condMapEmpty!12045 () Bool)

(declare-fun mapDefault!12045 () ValueCell!3200)

(assert (=> b!338796 (= condMapEmpty!12045 (= (arr!8400 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3200)) mapDefault!12045)))))

(declare-fun b!338797 () Bool)

(assert (=> b!338797 (= e!207857 (and (= (select (arr!8401 _keys!1895) (index!15147 lt!160809)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)) (bvsge (size!8754 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!12045 () Bool)

(declare-fun tp!24927 () Bool)

(assert (=> mapNonEmpty!12045 (= mapRes!12045 (and tp!24927 e!207859))))

(declare-fun mapValue!12045 () ValueCell!3200)

(declare-fun mapKey!12045 () (_ BitVec 32))

(declare-fun mapRest!12045 () (Array (_ BitVec 32) ValueCell!3200))

(assert (=> mapNonEmpty!12045 (= (arr!8400 _values!1525) (store mapRest!12045 mapKey!12045 mapValue!12045))))

(declare-fun b!338798 () Bool)

(declare-datatypes ((Unit!10528 0))(
  ( (Unit!10529) )
))
(declare-fun e!207855 () Unit!10528)

(declare-fun Unit!10530 () Unit!10528)

(assert (=> b!338798 (= e!207855 Unit!10530)))

(declare-fun b!338799 () Bool)

(declare-fun e!207860 () Bool)

(assert (=> b!338799 (= e!207862 e!207860)))

(declare-fun res!187169 () Bool)

(assert (=> b!338799 (=> (not res!187169) (not e!207860))))

(get-info :version)

(assert (=> b!338799 (= res!187169 (and (not ((_ is Found!3242) lt!160809)) ((_ is MissingZero!3242) lt!160809)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17753 (_ BitVec 32)) SeekEntryResult!3242)

(assert (=> b!338799 (= lt!160809 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338800 () Bool)

(declare-fun res!187172 () Bool)

(assert (=> b!338800 (=> (not res!187172) (not e!207862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338800 (= res!187172 (validKeyInArray!0 k0!1348))))

(declare-fun b!338801 () Bool)

(declare-fun res!187164 () Bool)

(assert (=> b!338801 (=> (not res!187164) (not e!207862))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!338801 (= res!187164 (and (= (size!8753 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8754 _keys!1895) (size!8753 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338802 () Bool)

(declare-fun res!187168 () Bool)

(assert (=> b!338802 (=> (not res!187168) (not e!207862))))

(declare-fun zeroValue!1467 () V!10427)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10427)

(declare-datatypes ((tuple2!5154 0))(
  ( (tuple2!5155 (_1!2588 (_ BitVec 64)) (_2!2588 V!10427)) )
))
(declare-datatypes ((List!4780 0))(
  ( (Nil!4777) (Cons!4776 (h!5632 tuple2!5154) (t!9871 List!4780)) )
))
(declare-datatypes ((ListLongMap!4057 0))(
  ( (ListLongMap!4058 (toList!2044 List!4780)) )
))
(declare-fun contains!2105 (ListLongMap!4057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1550 (array!17753 array!17751 (_ BitVec 32) (_ BitVec 32) V!10427 V!10427 (_ BitVec 32) Int) ListLongMap!4057)

(assert (=> b!338802 (= res!187168 (not (contains!2105 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338803 () Bool)

(declare-fun res!187171 () Bool)

(assert (=> b!338803 (=> (not res!187171) (not e!207862))))

(declare-datatypes ((List!4781 0))(
  ( (Nil!4778) (Cons!4777 (h!5633 (_ BitVec 64)) (t!9872 List!4781)) )
))
(declare-fun arrayNoDuplicates!0 (array!17753 (_ BitVec 32) List!4781) Bool)

(assert (=> b!338803 (= res!187171 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4778))))

(declare-fun b!338804 () Bool)

(assert (=> b!338804 (= e!207856 tp_is_empty!7087)))

(declare-fun b!338805 () Bool)

(assert (=> b!338805 (= e!207860 e!207857)))

(declare-fun res!187170 () Bool)

(assert (=> b!338805 (=> (not res!187170) (not e!207857))))

(declare-fun lt!160811 () Bool)

(assert (=> b!338805 (= res!187170 (not lt!160811))))

(declare-fun lt!160810 () Unit!10528)

(assert (=> b!338805 (= lt!160810 e!207855)))

(declare-fun c!52430 () Bool)

(assert (=> b!338805 (= c!52430 lt!160811)))

(declare-fun arrayContainsKey!0 (array!17753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338805 (= lt!160811 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!338806 () Bool)

(declare-fun Unit!10531 () Unit!10528)

(assert (=> b!338806 (= e!207855 Unit!10531)))

(declare-fun lt!160812 () Unit!10528)

(declare-fun lemmaArrayContainsKeyThenInListMap!283 (array!17753 array!17751 (_ BitVec 32) (_ BitVec 32) V!10427 V!10427 (_ BitVec 64) (_ BitVec 32) Int) Unit!10528)

(declare-fun arrayScanForKey!0 (array!17753 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338806 (= lt!160812 (lemmaArrayContainsKeyThenInListMap!283 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338806 false))

(declare-fun mapIsEmpty!12045 () Bool)

(assert (=> mapIsEmpty!12045 mapRes!12045))

(declare-fun b!338807 () Bool)

(declare-fun res!187166 () Bool)

(assert (=> b!338807 (=> (not res!187166) (not e!207862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17753 (_ BitVec 32)) Bool)

(assert (=> b!338807 (= res!187166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34016 res!187165) b!338801))

(assert (= (and b!338801 res!187164) b!338807))

(assert (= (and b!338807 res!187166) b!338803))

(assert (= (and b!338803 res!187171) b!338800))

(assert (= (and b!338800 res!187172) b!338802))

(assert (= (and b!338802 res!187168) b!338799))

(assert (= (and b!338799 res!187169) b!338805))

(assert (= (and b!338805 c!52430) b!338806))

(assert (= (and b!338805 (not c!52430)) b!338798))

(assert (= (and b!338805 res!187170) b!338795))

(assert (= (and b!338795 res!187167) b!338797))

(assert (= (and b!338796 condMapEmpty!12045) mapIsEmpty!12045))

(assert (= (and b!338796 (not condMapEmpty!12045)) mapNonEmpty!12045))

(assert (= (and mapNonEmpty!12045 ((_ is ValueCellFull!3200) mapValue!12045)) b!338794))

(assert (= (and b!338796 ((_ is ValueCellFull!3200) mapDefault!12045)) b!338804))

(assert (= start!34016 b!338796))

(declare-fun m!341413 () Bool)

(assert (=> b!338795 m!341413))

(declare-fun m!341415 () Bool)

(assert (=> b!338800 m!341415))

(declare-fun m!341417 () Bool)

(assert (=> b!338802 m!341417))

(assert (=> b!338802 m!341417))

(declare-fun m!341419 () Bool)

(assert (=> b!338802 m!341419))

(declare-fun m!341421 () Bool)

(assert (=> b!338799 m!341421))

(declare-fun m!341423 () Bool)

(assert (=> b!338805 m!341423))

(declare-fun m!341425 () Bool)

(assert (=> start!34016 m!341425))

(declare-fun m!341427 () Bool)

(assert (=> start!34016 m!341427))

(declare-fun m!341429 () Bool)

(assert (=> start!34016 m!341429))

(declare-fun m!341431 () Bool)

(assert (=> b!338807 m!341431))

(declare-fun m!341433 () Bool)

(assert (=> b!338797 m!341433))

(declare-fun m!341435 () Bool)

(assert (=> mapNonEmpty!12045 m!341435))

(declare-fun m!341437 () Bool)

(assert (=> b!338806 m!341437))

(assert (=> b!338806 m!341437))

(declare-fun m!341439 () Bool)

(assert (=> b!338806 m!341439))

(declare-fun m!341441 () Bool)

(assert (=> b!338803 m!341441))

(check-sat (not b_next!7135) (not b!338807) (not mapNonEmpty!12045) (not b!338803) (not b!338802) (not b!338800) (not start!34016) b_and!14301 tp_is_empty!7087 (not b!338805) (not b!338795) (not b!338799) (not b!338806))
(check-sat b_and!14301 (not b_next!7135))
(get-model)

(declare-fun d!70625 () Bool)

(declare-fun e!207915 () Bool)

(assert (=> d!70625 e!207915))

(declare-fun res!187229 () Bool)

(assert (=> d!70625 (=> res!187229 e!207915)))

(declare-fun lt!160845 () Bool)

(assert (=> d!70625 (= res!187229 (not lt!160845))))

(declare-fun lt!160847 () Bool)

(assert (=> d!70625 (= lt!160845 lt!160847)))

(declare-fun lt!160848 () Unit!10528)

(declare-fun e!207916 () Unit!10528)

(assert (=> d!70625 (= lt!160848 e!207916)))

(declare-fun c!52439 () Bool)

(assert (=> d!70625 (= c!52439 lt!160847)))

(declare-fun containsKey!320 (List!4780 (_ BitVec 64)) Bool)

(assert (=> d!70625 (= lt!160847 (containsKey!320 (toList!2044 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70625 (= (contains!2105 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160845)))

(declare-fun b!338898 () Bool)

(declare-fun lt!160846 () Unit!10528)

(assert (=> b!338898 (= e!207916 lt!160846)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!269 (List!4780 (_ BitVec 64)) Unit!10528)

(assert (=> b!338898 (= lt!160846 (lemmaContainsKeyImpliesGetValueByKeyDefined!269 (toList!2044 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!334 0))(
  ( (Some!333 (v!5753 V!10427)) (None!332) )
))
(declare-fun isDefined!270 (Option!334) Bool)

(declare-fun getValueByKey!328 (List!4780 (_ BitVec 64)) Option!334)

(assert (=> b!338898 (isDefined!270 (getValueByKey!328 (toList!2044 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!338899 () Bool)

(declare-fun Unit!10537 () Unit!10528)

(assert (=> b!338899 (= e!207916 Unit!10537)))

(declare-fun b!338900 () Bool)

(assert (=> b!338900 (= e!207915 (isDefined!270 (getValueByKey!328 (toList!2044 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70625 c!52439) b!338898))

(assert (= (and d!70625 (not c!52439)) b!338899))

(assert (= (and d!70625 (not res!187229)) b!338900))

(declare-fun m!341503 () Bool)

(assert (=> d!70625 m!341503))

(declare-fun m!341505 () Bool)

(assert (=> b!338898 m!341505))

(declare-fun m!341507 () Bool)

(assert (=> b!338898 m!341507))

(assert (=> b!338898 m!341507))

(declare-fun m!341509 () Bool)

(assert (=> b!338898 m!341509))

(assert (=> b!338900 m!341507))

(assert (=> b!338900 m!341507))

(assert (=> b!338900 m!341509))

(assert (=> b!338802 d!70625))

(declare-fun b!338943 () Bool)

(declare-fun e!207947 () Bool)

(assert (=> b!338943 (= e!207947 (validKeyInArray!0 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun lt!160911 () ListLongMap!4057)

(declare-fun e!207951 () Bool)

(declare-fun b!338944 () Bool)

(declare-fun apply!272 (ListLongMap!4057 (_ BitVec 64)) V!10427)

(declare-fun get!4574 (ValueCell!3200 V!10427) V!10427)

(declare-fun dynLambda!606 (Int (_ BitVec 64)) V!10427)

(assert (=> b!338944 (= e!207951 (= (apply!272 lt!160911 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000)) (get!4574 (select (arr!8400 _values!1525) #b00000000000000000000000000000000) (dynLambda!606 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!338944 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8753 _values!1525)))))

(assert (=> b!338944 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)))))

(declare-fun call!26452 () ListLongMap!4057)

(declare-fun call!26451 () ListLongMap!4057)

(declare-fun c!52456 () Bool)

(declare-fun call!26450 () ListLongMap!4057)

(declare-fun c!52453 () Bool)

(declare-fun call!26447 () ListLongMap!4057)

(declare-fun bm!26444 () Bool)

(declare-fun +!725 (ListLongMap!4057 tuple2!5154) ListLongMap!4057)

(assert (=> bm!26444 (= call!26451 (+!725 (ite c!52456 call!26452 (ite c!52453 call!26450 call!26447)) (ite (or c!52456 c!52453) (tuple2!5155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!338945 () Bool)

(declare-fun res!187248 () Bool)

(declare-fun e!207943 () Bool)

(assert (=> b!338945 (=> (not res!187248) (not e!207943))))

(declare-fun e!207946 () Bool)

(assert (=> b!338945 (= res!187248 e!207946)))

(declare-fun c!52455 () Bool)

(assert (=> b!338945 (= c!52455 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!338946 () Bool)

(declare-fun res!187256 () Bool)

(assert (=> b!338946 (=> (not res!187256) (not e!207943))))

(declare-fun e!207954 () Bool)

(assert (=> b!338946 (= res!187256 e!207954)))

(declare-fun res!187251 () Bool)

(assert (=> b!338946 (=> res!187251 e!207954)))

(declare-fun e!207953 () Bool)

(assert (=> b!338946 (= res!187251 (not e!207953))))

(declare-fun res!187253 () Bool)

(assert (=> b!338946 (=> (not res!187253) (not e!207953))))

(assert (=> b!338946 (= res!187253 (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)))))

(declare-fun b!338947 () Bool)

(declare-fun e!207944 () Bool)

(assert (=> b!338947 (= e!207946 e!207944)))

(declare-fun res!187250 () Bool)

(declare-fun call!26453 () Bool)

(assert (=> b!338947 (= res!187250 call!26453)))

(assert (=> b!338947 (=> (not res!187250) (not e!207944))))

(declare-fun b!338948 () Bool)

(assert (=> b!338948 (= e!207954 e!207951)))

(declare-fun res!187249 () Bool)

(assert (=> b!338948 (=> (not res!187249) (not e!207951))))

(assert (=> b!338948 (= res!187249 (contains!2105 lt!160911 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!338948 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)))))

(declare-fun b!338949 () Bool)

(declare-fun e!207945 () ListLongMap!4057)

(declare-fun call!26448 () ListLongMap!4057)

(assert (=> b!338949 (= e!207945 call!26448)))

(declare-fun b!338950 () Bool)

(assert (=> b!338950 (= e!207953 (validKeyInArray!0 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26445 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!588 (array!17753 array!17751 (_ BitVec 32) (_ BitVec 32) V!10427 V!10427 (_ BitVec 32) Int) ListLongMap!4057)

(assert (=> bm!26445 (= call!26452 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!338951 () Bool)

(assert (=> b!338951 (= e!207945 call!26447)))

(declare-fun b!338952 () Bool)

(declare-fun e!207949 () Bool)

(assert (=> b!338952 (= e!207949 (= (apply!272 lt!160911 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun d!70627 () Bool)

(assert (=> d!70627 e!207943))

(declare-fun res!187252 () Bool)

(assert (=> d!70627 (=> (not res!187252) (not e!207943))))

(assert (=> d!70627 (= res!187252 (or (bvsge #b00000000000000000000000000000000 (size!8754 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)))))))

(declare-fun lt!160904 () ListLongMap!4057)

(assert (=> d!70627 (= lt!160911 lt!160904)))

(declare-fun lt!160896 () Unit!10528)

(declare-fun e!207950 () Unit!10528)

(assert (=> d!70627 (= lt!160896 e!207950)))

(declare-fun c!52457 () Bool)

(assert (=> d!70627 (= c!52457 e!207947)))

(declare-fun res!187255 () Bool)

(assert (=> d!70627 (=> (not res!187255) (not e!207947))))

(assert (=> d!70627 (= res!187255 (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)))))

(declare-fun e!207948 () ListLongMap!4057)

(assert (=> d!70627 (= lt!160904 e!207948)))

(assert (=> d!70627 (= c!52456 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70627 (validMask!0 mask!2385)))

(assert (=> d!70627 (= (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160911)))

(declare-fun b!338953 () Bool)

(declare-fun c!52454 () Bool)

(assert (=> b!338953 (= c!52454 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!207952 () ListLongMap!4057)

(assert (=> b!338953 (= e!207952 e!207945)))

(declare-fun b!338954 () Bool)

(assert (=> b!338954 (= e!207946 (not call!26453))))

(declare-fun b!338955 () Bool)

(assert (=> b!338955 (= e!207952 call!26448)))

(declare-fun bm!26446 () Bool)

(assert (=> bm!26446 (= call!26453 (contains!2105 lt!160911 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26447 () Bool)

(assert (=> bm!26447 (= call!26450 call!26452)))

(declare-fun b!338956 () Bool)

(declare-fun Unit!10538 () Unit!10528)

(assert (=> b!338956 (= e!207950 Unit!10538)))

(declare-fun b!338957 () Bool)

(assert (=> b!338957 (= e!207948 e!207952)))

(assert (=> b!338957 (= c!52453 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!338958 () Bool)

(assert (=> b!338958 (= e!207944 (= (apply!272 lt!160911 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!338959 () Bool)

(declare-fun e!207955 () Bool)

(assert (=> b!338959 (= e!207955 e!207949)))

(declare-fun res!187254 () Bool)

(declare-fun call!26449 () Bool)

(assert (=> b!338959 (= res!187254 call!26449)))

(assert (=> b!338959 (=> (not res!187254) (not e!207949))))

(declare-fun b!338960 () Bool)

(assert (=> b!338960 (= e!207955 (not call!26449))))

(declare-fun bm!26448 () Bool)

(assert (=> bm!26448 (= call!26449 (contains!2105 lt!160911 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26449 () Bool)

(assert (=> bm!26449 (= call!26447 call!26450)))

(declare-fun b!338961 () Bool)

(assert (=> b!338961 (= e!207948 (+!725 call!26451 (tuple2!5155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!338962 () Bool)

(assert (=> b!338962 (= e!207943 e!207955)))

(declare-fun c!52452 () Bool)

(assert (=> b!338962 (= c!52452 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!338963 () Bool)

(declare-fun lt!160897 () Unit!10528)

(assert (=> b!338963 (= e!207950 lt!160897)))

(declare-fun lt!160903 () ListLongMap!4057)

(assert (=> b!338963 (= lt!160903 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160910 () (_ BitVec 64))

(assert (=> b!338963 (= lt!160910 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160901 () (_ BitVec 64))

(assert (=> b!338963 (= lt!160901 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160894 () Unit!10528)

(declare-fun addStillContains!248 (ListLongMap!4057 (_ BitVec 64) V!10427 (_ BitVec 64)) Unit!10528)

(assert (=> b!338963 (= lt!160894 (addStillContains!248 lt!160903 lt!160910 zeroValue!1467 lt!160901))))

(assert (=> b!338963 (contains!2105 (+!725 lt!160903 (tuple2!5155 lt!160910 zeroValue!1467)) lt!160901)))

(declare-fun lt!160909 () Unit!10528)

(assert (=> b!338963 (= lt!160909 lt!160894)))

(declare-fun lt!160906 () ListLongMap!4057)

(assert (=> b!338963 (= lt!160906 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160902 () (_ BitVec 64))

(assert (=> b!338963 (= lt!160902 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160913 () (_ BitVec 64))

(assert (=> b!338963 (= lt!160913 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160893 () Unit!10528)

(declare-fun addApplyDifferent!248 (ListLongMap!4057 (_ BitVec 64) V!10427 (_ BitVec 64)) Unit!10528)

(assert (=> b!338963 (= lt!160893 (addApplyDifferent!248 lt!160906 lt!160902 minValue!1467 lt!160913))))

(assert (=> b!338963 (= (apply!272 (+!725 lt!160906 (tuple2!5155 lt!160902 minValue!1467)) lt!160913) (apply!272 lt!160906 lt!160913))))

(declare-fun lt!160898 () Unit!10528)

(assert (=> b!338963 (= lt!160898 lt!160893)))

(declare-fun lt!160912 () ListLongMap!4057)

(assert (=> b!338963 (= lt!160912 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160907 () (_ BitVec 64))

(assert (=> b!338963 (= lt!160907 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160899 () (_ BitVec 64))

(assert (=> b!338963 (= lt!160899 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160905 () Unit!10528)

(assert (=> b!338963 (= lt!160905 (addApplyDifferent!248 lt!160912 lt!160907 zeroValue!1467 lt!160899))))

(assert (=> b!338963 (= (apply!272 (+!725 lt!160912 (tuple2!5155 lt!160907 zeroValue!1467)) lt!160899) (apply!272 lt!160912 lt!160899))))

(declare-fun lt!160914 () Unit!10528)

(assert (=> b!338963 (= lt!160914 lt!160905)))

(declare-fun lt!160900 () ListLongMap!4057)

(assert (=> b!338963 (= lt!160900 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160895 () (_ BitVec 64))

(assert (=> b!338963 (= lt!160895 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160908 () (_ BitVec 64))

(assert (=> b!338963 (= lt!160908 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!338963 (= lt!160897 (addApplyDifferent!248 lt!160900 lt!160895 minValue!1467 lt!160908))))

(assert (=> b!338963 (= (apply!272 (+!725 lt!160900 (tuple2!5155 lt!160895 minValue!1467)) lt!160908) (apply!272 lt!160900 lt!160908))))

(declare-fun bm!26450 () Bool)

(assert (=> bm!26450 (= call!26448 call!26451)))

(assert (= (and d!70627 c!52456) b!338961))

(assert (= (and d!70627 (not c!52456)) b!338957))

(assert (= (and b!338957 c!52453) b!338955))

(assert (= (and b!338957 (not c!52453)) b!338953))

(assert (= (and b!338953 c!52454) b!338949))

(assert (= (and b!338953 (not c!52454)) b!338951))

(assert (= (or b!338949 b!338951) bm!26449))

(assert (= (or b!338955 bm!26449) bm!26447))

(assert (= (or b!338955 b!338949) bm!26450))

(assert (= (or b!338961 bm!26447) bm!26445))

(assert (= (or b!338961 bm!26450) bm!26444))

(assert (= (and d!70627 res!187255) b!338943))

(assert (= (and d!70627 c!52457) b!338963))

(assert (= (and d!70627 (not c!52457)) b!338956))

(assert (= (and d!70627 res!187252) b!338946))

(assert (= (and b!338946 res!187253) b!338950))

(assert (= (and b!338946 (not res!187251)) b!338948))

(assert (= (and b!338948 res!187249) b!338944))

(assert (= (and b!338946 res!187256) b!338945))

(assert (= (and b!338945 c!52455) b!338947))

(assert (= (and b!338945 (not c!52455)) b!338954))

(assert (= (and b!338947 res!187250) b!338958))

(assert (= (or b!338947 b!338954) bm!26446))

(assert (= (and b!338945 res!187248) b!338962))

(assert (= (and b!338962 c!52452) b!338959))

(assert (= (and b!338962 (not c!52452)) b!338960))

(assert (= (and b!338959 res!187254) b!338952))

(assert (= (or b!338959 b!338960) bm!26448))

(declare-fun b_lambda!8409 () Bool)

(assert (=> (not b_lambda!8409) (not b!338944)))

(declare-fun t!9874 () Bool)

(declare-fun tb!3051 () Bool)

(assert (=> (and start!34016 (= defaultEntry!1528 defaultEntry!1528) t!9874) tb!3051))

(declare-fun result!5499 () Bool)

(assert (=> tb!3051 (= result!5499 tp_is_empty!7087)))

(assert (=> b!338944 t!9874))

(declare-fun b_and!14307 () Bool)

(assert (= b_and!14301 (and (=> t!9874 result!5499) b_and!14307)))

(declare-fun m!341511 () Bool)

(assert (=> b!338952 m!341511))

(declare-fun m!341513 () Bool)

(assert (=> bm!26445 m!341513))

(declare-fun m!341515 () Bool)

(assert (=> bm!26444 m!341515))

(declare-fun m!341517 () Bool)

(assert (=> b!338961 m!341517))

(declare-fun m!341519 () Bool)

(assert (=> b!338958 m!341519))

(declare-fun m!341521 () Bool)

(assert (=> b!338948 m!341521))

(assert (=> b!338948 m!341521))

(declare-fun m!341523 () Bool)

(assert (=> b!338948 m!341523))

(declare-fun m!341525 () Bool)

(assert (=> b!338944 m!341525))

(declare-fun m!341527 () Bool)

(assert (=> b!338944 m!341527))

(declare-fun m!341529 () Bool)

(assert (=> b!338944 m!341529))

(assert (=> b!338944 m!341525))

(assert (=> b!338944 m!341527))

(assert (=> b!338944 m!341521))

(declare-fun m!341531 () Bool)

(assert (=> b!338944 m!341531))

(assert (=> b!338944 m!341521))

(declare-fun m!341533 () Bool)

(assert (=> bm!26446 m!341533))

(declare-fun m!341535 () Bool)

(assert (=> bm!26448 m!341535))

(assert (=> b!338943 m!341521))

(assert (=> b!338943 m!341521))

(declare-fun m!341537 () Bool)

(assert (=> b!338943 m!341537))

(assert (=> b!338950 m!341521))

(assert (=> b!338950 m!341521))

(assert (=> b!338950 m!341537))

(assert (=> d!70627 m!341425))

(declare-fun m!341539 () Bool)

(assert (=> b!338963 m!341539))

(declare-fun m!341541 () Bool)

(assert (=> b!338963 m!341541))

(assert (=> b!338963 m!341539))

(declare-fun m!341543 () Bool)

(assert (=> b!338963 m!341543))

(declare-fun m!341545 () Bool)

(assert (=> b!338963 m!341545))

(declare-fun m!341547 () Bool)

(assert (=> b!338963 m!341547))

(declare-fun m!341549 () Bool)

(assert (=> b!338963 m!341549))

(declare-fun m!341551 () Bool)

(assert (=> b!338963 m!341551))

(declare-fun m!341553 () Bool)

(assert (=> b!338963 m!341553))

(assert (=> b!338963 m!341521))

(declare-fun m!341555 () Bool)

(assert (=> b!338963 m!341555))

(declare-fun m!341557 () Bool)

(assert (=> b!338963 m!341557))

(assert (=> b!338963 m!341513))

(declare-fun m!341559 () Bool)

(assert (=> b!338963 m!341559))

(assert (=> b!338963 m!341555))

(assert (=> b!338963 m!341549))

(declare-fun m!341561 () Bool)

(assert (=> b!338963 m!341561))

(assert (=> b!338963 m!341551))

(declare-fun m!341563 () Bool)

(assert (=> b!338963 m!341563))

(declare-fun m!341565 () Bool)

(assert (=> b!338963 m!341565))

(declare-fun m!341567 () Bool)

(assert (=> b!338963 m!341567))

(assert (=> b!338802 d!70627))

(declare-fun bm!26453 () Bool)

(declare-fun call!26456 () Bool)

(assert (=> bm!26453 (= call!26456 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!338974 () Bool)

(declare-fun e!207964 () Bool)

(declare-fun e!207962 () Bool)

(assert (=> b!338974 (= e!207964 e!207962)))

(declare-fun c!52460 () Bool)

(assert (=> b!338974 (= c!52460 (validKeyInArray!0 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338975 () Bool)

(declare-fun e!207963 () Bool)

(assert (=> b!338975 (= e!207963 call!26456)))

(declare-fun d!70629 () Bool)

(declare-fun res!187261 () Bool)

(assert (=> d!70629 (=> res!187261 e!207964)))

(assert (=> d!70629 (= res!187261 (bvsge #b00000000000000000000000000000000 (size!8754 _keys!1895)))))

(assert (=> d!70629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!207964)))

(declare-fun b!338976 () Bool)

(assert (=> b!338976 (= e!207962 call!26456)))

(declare-fun b!338977 () Bool)

(assert (=> b!338977 (= e!207962 e!207963)))

(declare-fun lt!160921 () (_ BitVec 64))

(assert (=> b!338977 (= lt!160921 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160922 () Unit!10528)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17753 (_ BitVec 64) (_ BitVec 32)) Unit!10528)

(assert (=> b!338977 (= lt!160922 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160921 #b00000000000000000000000000000000))))

(assert (=> b!338977 (arrayContainsKey!0 _keys!1895 lt!160921 #b00000000000000000000000000000000)))

(declare-fun lt!160923 () Unit!10528)

(assert (=> b!338977 (= lt!160923 lt!160922)))

(declare-fun res!187262 () Bool)

(assert (=> b!338977 (= res!187262 (= (seekEntryOrOpen!0 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3242 #b00000000000000000000000000000000)))))

(assert (=> b!338977 (=> (not res!187262) (not e!207963))))

(assert (= (and d!70629 (not res!187261)) b!338974))

(assert (= (and b!338974 c!52460) b!338977))

(assert (= (and b!338974 (not c!52460)) b!338976))

(assert (= (and b!338977 res!187262) b!338975))

(assert (= (or b!338975 b!338976) bm!26453))

(declare-fun m!341569 () Bool)

(assert (=> bm!26453 m!341569))

(assert (=> b!338974 m!341521))

(assert (=> b!338974 m!341521))

(assert (=> b!338974 m!341537))

(assert (=> b!338977 m!341521))

(declare-fun m!341571 () Bool)

(assert (=> b!338977 m!341571))

(declare-fun m!341573 () Bool)

(assert (=> b!338977 m!341573))

(assert (=> b!338977 m!341521))

(declare-fun m!341575 () Bool)

(assert (=> b!338977 m!341575))

(assert (=> b!338807 d!70629))

(declare-fun d!70631 () Bool)

(assert (=> d!70631 (contains!2105 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!160926 () Unit!10528)

(declare-fun choose!1308 (array!17753 array!17751 (_ BitVec 32) (_ BitVec 32) V!10427 V!10427 (_ BitVec 64) (_ BitVec 32) Int) Unit!10528)

(assert (=> d!70631 (= lt!160926 (choose!1308 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70631 (validMask!0 mask!2385)))

(assert (=> d!70631 (= (lemmaArrayContainsKeyThenInListMap!283 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!160926)))

(declare-fun bs!11636 () Bool)

(assert (= bs!11636 d!70631))

(assert (=> bs!11636 m!341417))

(assert (=> bs!11636 m!341417))

(assert (=> bs!11636 m!341419))

(assert (=> bs!11636 m!341437))

(declare-fun m!341577 () Bool)

(assert (=> bs!11636 m!341577))

(assert (=> bs!11636 m!341425))

(assert (=> b!338806 d!70631))

(declare-fun d!70633 () Bool)

(declare-fun lt!160929 () (_ BitVec 32))

(assert (=> d!70633 (and (or (bvslt lt!160929 #b00000000000000000000000000000000) (bvsge lt!160929 (size!8754 _keys!1895)) (and (bvsge lt!160929 #b00000000000000000000000000000000) (bvslt lt!160929 (size!8754 _keys!1895)))) (bvsge lt!160929 #b00000000000000000000000000000000) (bvslt lt!160929 (size!8754 _keys!1895)) (= (select (arr!8401 _keys!1895) lt!160929) k0!1348))))

(declare-fun e!207967 () (_ BitVec 32))

(assert (=> d!70633 (= lt!160929 e!207967)))

(declare-fun c!52463 () Bool)

(assert (=> d!70633 (= c!52463 (= (select (arr!8401 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70633 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)) (bvslt (size!8754 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70633 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!160929)))

(declare-fun b!338982 () Bool)

(assert (=> b!338982 (= e!207967 #b00000000000000000000000000000000)))

(declare-fun b!338983 () Bool)

(assert (=> b!338983 (= e!207967 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70633 c!52463) b!338982))

(assert (= (and d!70633 (not c!52463)) b!338983))

(declare-fun m!341579 () Bool)

(assert (=> d!70633 m!341579))

(assert (=> d!70633 m!341521))

(declare-fun m!341581 () Bool)

(assert (=> b!338983 m!341581))

(assert (=> b!338806 d!70633))

(declare-fun d!70635 () Bool)

(assert (=> d!70635 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34016 d!70635))

(declare-fun d!70637 () Bool)

(assert (=> d!70637 (= (array_inv!6260 _values!1525) (bvsge (size!8753 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34016 d!70637))

(declare-fun d!70639 () Bool)

(assert (=> d!70639 (= (array_inv!6261 _keys!1895) (bvsge (size!8754 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34016 d!70639))

(declare-fun b!338996 () Bool)

(declare-fun e!207975 () SeekEntryResult!3242)

(declare-fun lt!160938 () SeekEntryResult!3242)

(assert (=> b!338996 (= e!207975 (MissingZero!3242 (index!15149 lt!160938)))))

(declare-fun b!338997 () Bool)

(declare-fun c!52472 () Bool)

(declare-fun lt!160937 () (_ BitVec 64))

(assert (=> b!338997 (= c!52472 (= lt!160937 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!207974 () SeekEntryResult!3242)

(assert (=> b!338997 (= e!207974 e!207975)))

(declare-fun b!338998 () Bool)

(declare-fun e!207976 () SeekEntryResult!3242)

(assert (=> b!338998 (= e!207976 Undefined!3242)))

(declare-fun d!70641 () Bool)

(declare-fun lt!160936 () SeekEntryResult!3242)

(assert (=> d!70641 (and (or ((_ is Undefined!3242) lt!160936) (not ((_ is Found!3242) lt!160936)) (and (bvsge (index!15148 lt!160936) #b00000000000000000000000000000000) (bvslt (index!15148 lt!160936) (size!8754 _keys!1895)))) (or ((_ is Undefined!3242) lt!160936) ((_ is Found!3242) lt!160936) (not ((_ is MissingZero!3242) lt!160936)) (and (bvsge (index!15147 lt!160936) #b00000000000000000000000000000000) (bvslt (index!15147 lt!160936) (size!8754 _keys!1895)))) (or ((_ is Undefined!3242) lt!160936) ((_ is Found!3242) lt!160936) ((_ is MissingZero!3242) lt!160936) (not ((_ is MissingVacant!3242) lt!160936)) (and (bvsge (index!15150 lt!160936) #b00000000000000000000000000000000) (bvslt (index!15150 lt!160936) (size!8754 _keys!1895)))) (or ((_ is Undefined!3242) lt!160936) (ite ((_ is Found!3242) lt!160936) (= (select (arr!8401 _keys!1895) (index!15148 lt!160936)) k0!1348) (ite ((_ is MissingZero!3242) lt!160936) (= (select (arr!8401 _keys!1895) (index!15147 lt!160936)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3242) lt!160936) (= (select (arr!8401 _keys!1895) (index!15150 lt!160936)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70641 (= lt!160936 e!207976)))

(declare-fun c!52470 () Bool)

(assert (=> d!70641 (= c!52470 (and ((_ is Intermediate!3242) lt!160938) (undefined!4054 lt!160938)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17753 (_ BitVec 32)) SeekEntryResult!3242)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70641 (= lt!160938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70641 (validMask!0 mask!2385)))

(assert (=> d!70641 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160936)))

(declare-fun b!338999 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17753 (_ BitVec 32)) SeekEntryResult!3242)

(assert (=> b!338999 (= e!207975 (seekKeyOrZeroReturnVacant!0 (x!33767 lt!160938) (index!15149 lt!160938) (index!15149 lt!160938) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339000 () Bool)

(assert (=> b!339000 (= e!207976 e!207974)))

(assert (=> b!339000 (= lt!160937 (select (arr!8401 _keys!1895) (index!15149 lt!160938)))))

(declare-fun c!52471 () Bool)

(assert (=> b!339000 (= c!52471 (= lt!160937 k0!1348))))

(declare-fun b!339001 () Bool)

(assert (=> b!339001 (= e!207974 (Found!3242 (index!15149 lt!160938)))))

(assert (= (and d!70641 c!52470) b!338998))

(assert (= (and d!70641 (not c!52470)) b!339000))

(assert (= (and b!339000 c!52471) b!339001))

(assert (= (and b!339000 (not c!52471)) b!338997))

(assert (= (and b!338997 c!52472) b!338996))

(assert (= (and b!338997 (not c!52472)) b!338999))

(declare-fun m!341583 () Bool)

(assert (=> d!70641 m!341583))

(declare-fun m!341585 () Bool)

(assert (=> d!70641 m!341585))

(assert (=> d!70641 m!341425))

(assert (=> d!70641 m!341585))

(declare-fun m!341587 () Bool)

(assert (=> d!70641 m!341587))

(declare-fun m!341589 () Bool)

(assert (=> d!70641 m!341589))

(declare-fun m!341591 () Bool)

(assert (=> d!70641 m!341591))

(declare-fun m!341593 () Bool)

(assert (=> b!338999 m!341593))

(declare-fun m!341595 () Bool)

(assert (=> b!339000 m!341595))

(assert (=> b!338799 d!70641))

(declare-fun d!70643 () Bool)

(assert (=> d!70643 (= (inRange!0 (index!15147 lt!160809) mask!2385) (and (bvsge (index!15147 lt!160809) #b00000000000000000000000000000000) (bvslt (index!15147 lt!160809) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!338795 d!70643))

(declare-fun d!70645 () Bool)

(declare-fun res!187267 () Bool)

(declare-fun e!207981 () Bool)

(assert (=> d!70645 (=> res!187267 e!207981)))

(assert (=> d!70645 (= res!187267 (= (select (arr!8401 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70645 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!207981)))

(declare-fun b!339006 () Bool)

(declare-fun e!207982 () Bool)

(assert (=> b!339006 (= e!207981 e!207982)))

(declare-fun res!187268 () Bool)

(assert (=> b!339006 (=> (not res!187268) (not e!207982))))

(assert (=> b!339006 (= res!187268 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8754 _keys!1895)))))

(declare-fun b!339007 () Bool)

(assert (=> b!339007 (= e!207982 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70645 (not res!187267)) b!339006))

(assert (= (and b!339006 res!187268) b!339007))

(assert (=> d!70645 m!341521))

(declare-fun m!341597 () Bool)

(assert (=> b!339007 m!341597))

(assert (=> b!338805 d!70645))

(declare-fun d!70647 () Bool)

(assert (=> d!70647 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!338800 d!70647))

(declare-fun b!339018 () Bool)

(declare-fun e!207994 () Bool)

(declare-fun e!207991 () Bool)

(assert (=> b!339018 (= e!207994 e!207991)))

(declare-fun c!52475 () Bool)

(assert (=> b!339018 (= c!52475 (validKeyInArray!0 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339019 () Bool)

(declare-fun call!26459 () Bool)

(assert (=> b!339019 (= e!207991 call!26459)))

(declare-fun b!339020 () Bool)

(declare-fun e!207993 () Bool)

(assert (=> b!339020 (= e!207993 e!207994)))

(declare-fun res!187277 () Bool)

(assert (=> b!339020 (=> (not res!187277) (not e!207994))))

(declare-fun e!207992 () Bool)

(assert (=> b!339020 (= res!187277 (not e!207992))))

(declare-fun res!187275 () Bool)

(assert (=> b!339020 (=> (not res!187275) (not e!207992))))

(assert (=> b!339020 (= res!187275 (validKeyInArray!0 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70649 () Bool)

(declare-fun res!187276 () Bool)

(assert (=> d!70649 (=> res!187276 e!207993)))

(assert (=> d!70649 (= res!187276 (bvsge #b00000000000000000000000000000000 (size!8754 _keys!1895)))))

(assert (=> d!70649 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4778) e!207993)))

(declare-fun b!339021 () Bool)

(declare-fun contains!2106 (List!4781 (_ BitVec 64)) Bool)

(assert (=> b!339021 (= e!207992 (contains!2106 Nil!4778 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26456 () Bool)

(assert (=> bm!26456 (= call!26459 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52475 (Cons!4777 (select (arr!8401 _keys!1895) #b00000000000000000000000000000000) Nil!4778) Nil!4778)))))

(declare-fun b!339022 () Bool)

(assert (=> b!339022 (= e!207991 call!26459)))

(assert (= (and d!70649 (not res!187276)) b!339020))

(assert (= (and b!339020 res!187275) b!339021))

(assert (= (and b!339020 res!187277) b!339018))

(assert (= (and b!339018 c!52475) b!339019))

(assert (= (and b!339018 (not c!52475)) b!339022))

(assert (= (or b!339019 b!339022) bm!26456))

(assert (=> b!339018 m!341521))

(assert (=> b!339018 m!341521))

(assert (=> b!339018 m!341537))

(assert (=> b!339020 m!341521))

(assert (=> b!339020 m!341521))

(assert (=> b!339020 m!341537))

(assert (=> b!339021 m!341521))

(assert (=> b!339021 m!341521))

(declare-fun m!341599 () Bool)

(assert (=> b!339021 m!341599))

(assert (=> bm!26456 m!341521))

(declare-fun m!341601 () Bool)

(assert (=> bm!26456 m!341601))

(assert (=> b!338803 d!70649))

(declare-fun mapNonEmpty!12054 () Bool)

(declare-fun mapRes!12054 () Bool)

(declare-fun tp!24942 () Bool)

(declare-fun e!208000 () Bool)

(assert (=> mapNonEmpty!12054 (= mapRes!12054 (and tp!24942 e!208000))))

(declare-fun mapRest!12054 () (Array (_ BitVec 32) ValueCell!3200))

(declare-fun mapKey!12054 () (_ BitVec 32))

(declare-fun mapValue!12054 () ValueCell!3200)

(assert (=> mapNonEmpty!12054 (= mapRest!12045 (store mapRest!12054 mapKey!12054 mapValue!12054))))

(declare-fun mapIsEmpty!12054 () Bool)

(assert (=> mapIsEmpty!12054 mapRes!12054))

(declare-fun b!339029 () Bool)

(assert (=> b!339029 (= e!208000 tp_is_empty!7087)))

(declare-fun b!339030 () Bool)

(declare-fun e!207999 () Bool)

(assert (=> b!339030 (= e!207999 tp_is_empty!7087)))

(declare-fun condMapEmpty!12054 () Bool)

(declare-fun mapDefault!12054 () ValueCell!3200)

(assert (=> mapNonEmpty!12045 (= condMapEmpty!12054 (= mapRest!12045 ((as const (Array (_ BitVec 32) ValueCell!3200)) mapDefault!12054)))))

(assert (=> mapNonEmpty!12045 (= tp!24927 (and e!207999 mapRes!12054))))

(assert (= (and mapNonEmpty!12045 condMapEmpty!12054) mapIsEmpty!12054))

(assert (= (and mapNonEmpty!12045 (not condMapEmpty!12054)) mapNonEmpty!12054))

(assert (= (and mapNonEmpty!12054 ((_ is ValueCellFull!3200) mapValue!12054)) b!339029))

(assert (= (and mapNonEmpty!12045 ((_ is ValueCellFull!3200) mapDefault!12054)) b!339030))

(declare-fun m!341603 () Bool)

(assert (=> mapNonEmpty!12054 m!341603))

(declare-fun b_lambda!8411 () Bool)

(assert (= b_lambda!8409 (or (and start!34016 b_free!7135) b_lambda!8411)))

(check-sat (not d!70625) (not bm!26444) (not bm!26456) b_and!14307 (not b!339007) (not bm!26448) (not bm!26453) (not b!338943) (not bm!26446) (not d!70627) (not d!70631) (not b!338952) (not mapNonEmpty!12054) (not b!338977) (not bm!26445) (not b!338983) (not b!339021) (not b_next!7135) (not b!339020) (not b!338958) (not b!338963) (not b!338999) (not b!338950) (not b!338900) (not b!338948) (not b!338974) (not b!338898) (not b!338944) tp_is_empty!7087 (not b!339018) (not d!70641) (not b_lambda!8411) (not b!338961))
(check-sat b_and!14307 (not b_next!7135))
