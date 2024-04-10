; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33494 () Bool)

(assert start!33494)

(declare-fun b!332443 () Bool)

(declare-fun res!183141 () Bool)

(declare-fun e!204137 () Bool)

(assert (=> b!332443 (=> (not res!183141) (not e!204137))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332443 (= res!183141 (validKeyInArray!0 k0!1348))))

(declare-fun b!332444 () Bool)

(declare-fun e!204141 () Bool)

(declare-fun e!204138 () Bool)

(declare-fun mapRes!11505 () Bool)

(assert (=> b!332444 (= e!204141 (and e!204138 mapRes!11505))))

(declare-fun condMapEmpty!11505 () Bool)

(declare-datatypes ((V!9973 0))(
  ( (V!9974 (val!3418 Int)) )
))
(declare-datatypes ((ValueCell!3030 0))(
  ( (ValueCellFull!3030 (v!5577 V!9973)) (EmptyCell!3030) )
))
(declare-datatypes ((array!17089 0))(
  ( (array!17090 (arr!8079 (Array (_ BitVec 32) ValueCell!3030)) (size!8431 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17089)

(declare-fun mapDefault!11505 () ValueCell!3030)

(assert (=> b!332444 (= condMapEmpty!11505 (= (arr!8079 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3030)) mapDefault!11505)))))

(declare-fun b!332445 () Bool)

(declare-fun res!183142 () Bool)

(assert (=> b!332445 (=> (not res!183142) (not e!204137))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17091 0))(
  ( (array!17092 (arr!8080 (Array (_ BitVec 32) (_ BitVec 64))) (size!8432 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17091)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332445 (= res!183142 (and (= (size!8431 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8432 _keys!1895) (size!8431 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332446 () Bool)

(declare-fun res!183139 () Bool)

(assert (=> b!332446 (=> (not res!183139) (not e!204137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17091 (_ BitVec 32)) Bool)

(assert (=> b!332446 (= res!183139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332447 () Bool)

(declare-fun res!183143 () Bool)

(assert (=> b!332447 (=> (not res!183143) (not e!204137))))

(declare-datatypes ((List!4594 0))(
  ( (Nil!4591) (Cons!4590 (h!5446 (_ BitVec 64)) (t!9676 List!4594)) )
))
(declare-fun arrayNoDuplicates!0 (array!17091 (_ BitVec 32) List!4594) Bool)

(assert (=> b!332447 (= res!183143 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4591))))

(declare-fun res!183140 () Bool)

(assert (=> start!33494 (=> (not res!183140) (not e!204137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33494 (= res!183140 (validMask!0 mask!2385))))

(assert (=> start!33494 e!204137))

(assert (=> start!33494 true))

(declare-fun array_inv!6018 (array!17089) Bool)

(assert (=> start!33494 (and (array_inv!6018 _values!1525) e!204141)))

(declare-fun array_inv!6019 (array!17091) Bool)

(assert (=> start!33494 (array_inv!6019 _keys!1895)))

(declare-fun b!332448 () Bool)

(declare-fun e!204140 () Bool)

(declare-fun tp_is_empty!6747 () Bool)

(assert (=> b!332448 (= e!204140 tp_is_empty!6747)))

(declare-fun mapNonEmpty!11505 () Bool)

(declare-fun tp!23880 () Bool)

(assert (=> mapNonEmpty!11505 (= mapRes!11505 (and tp!23880 e!204140))))

(declare-fun mapKey!11505 () (_ BitVec 32))

(declare-fun mapRest!11505 () (Array (_ BitVec 32) ValueCell!3030))

(declare-fun mapValue!11505 () ValueCell!3030)

(assert (=> mapNonEmpty!11505 (= (arr!8079 _values!1525) (store mapRest!11505 mapKey!11505 mapValue!11505))))

(declare-fun b!332449 () Bool)

(assert (=> b!332449 (= e!204137 (bvsgt #b00000000000000000000000000000000 (size!8432 _keys!1895)))))

(declare-fun b!332450 () Bool)

(assert (=> b!332450 (= e!204138 tp_is_empty!6747)))

(declare-fun mapIsEmpty!11505 () Bool)

(assert (=> mapIsEmpty!11505 mapRes!11505))

(assert (= (and start!33494 res!183140) b!332445))

(assert (= (and b!332445 res!183142) b!332446))

(assert (= (and b!332446 res!183139) b!332447))

(assert (= (and b!332447 res!183143) b!332443))

(assert (= (and b!332443 res!183141) b!332449))

(assert (= (and b!332444 condMapEmpty!11505) mapIsEmpty!11505))

(assert (= (and b!332444 (not condMapEmpty!11505)) mapNonEmpty!11505))

(get-info :version)

(assert (= (and mapNonEmpty!11505 ((_ is ValueCellFull!3030) mapValue!11505)) b!332448))

(assert (= (and b!332444 ((_ is ValueCellFull!3030) mapDefault!11505)) b!332450))

(assert (= start!33494 b!332444))

(declare-fun m!336959 () Bool)

(assert (=> mapNonEmpty!11505 m!336959))

(declare-fun m!336961 () Bool)

(assert (=> start!33494 m!336961))

(declare-fun m!336963 () Bool)

(assert (=> start!33494 m!336963))

(declare-fun m!336965 () Bool)

(assert (=> start!33494 m!336965))

(declare-fun m!336967 () Bool)

(assert (=> b!332443 m!336967))

(declare-fun m!336969 () Bool)

(assert (=> b!332447 m!336969))

(declare-fun m!336971 () Bool)

(assert (=> b!332446 m!336971))

(check-sat (not b!332446) tp_is_empty!6747 (not b!332443) (not start!33494) (not b!332447) (not mapNonEmpty!11505))
(check-sat)
(get-model)

(declare-fun d!70521 () Bool)

(assert (=> d!70521 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332443 d!70521))

(declare-fun d!70523 () Bool)

(assert (=> d!70523 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33494 d!70523))

(declare-fun d!70525 () Bool)

(assert (=> d!70525 (= (array_inv!6018 _values!1525) (bvsge (size!8431 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33494 d!70525))

(declare-fun d!70527 () Bool)

(assert (=> d!70527 (= (array_inv!6019 _keys!1895) (bvsge (size!8432 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33494 d!70527))

(declare-fun b!332485 () Bool)

(declare-fun e!204168 () Bool)

(declare-fun call!26212 () Bool)

(assert (=> b!332485 (= e!204168 call!26212)))

(declare-fun b!332486 () Bool)

(declare-fun e!204165 () Bool)

(declare-fun contains!2003 (List!4594 (_ BitVec 64)) Bool)

(assert (=> b!332486 (= e!204165 (contains!2003 Nil!4591 (select (arr!8080 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332487 () Bool)

(declare-fun e!204167 () Bool)

(assert (=> b!332487 (= e!204167 e!204168)))

(declare-fun c!52083 () Bool)

(assert (=> b!332487 (= c!52083 (validKeyInArray!0 (select (arr!8080 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332488 () Bool)

(assert (=> b!332488 (= e!204168 call!26212)))

(declare-fun b!332489 () Bool)

(declare-fun e!204166 () Bool)

(assert (=> b!332489 (= e!204166 e!204167)))

(declare-fun res!183167 () Bool)

(assert (=> b!332489 (=> (not res!183167) (not e!204167))))

(assert (=> b!332489 (= res!183167 (not e!204165))))

(declare-fun res!183165 () Bool)

(assert (=> b!332489 (=> (not res!183165) (not e!204165))))

(assert (=> b!332489 (= res!183165 (validKeyInArray!0 (select (arr!8080 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70529 () Bool)

(declare-fun res!183166 () Bool)

(assert (=> d!70529 (=> res!183166 e!204166)))

(assert (=> d!70529 (= res!183166 (bvsge #b00000000000000000000000000000000 (size!8432 _keys!1895)))))

(assert (=> d!70529 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4591) e!204166)))

(declare-fun bm!26209 () Bool)

(assert (=> bm!26209 (= call!26212 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52083 (Cons!4590 (select (arr!8080 _keys!1895) #b00000000000000000000000000000000) Nil!4591) Nil!4591)))))

(assert (= (and d!70529 (not res!183166)) b!332489))

(assert (= (and b!332489 res!183165) b!332486))

(assert (= (and b!332489 res!183167) b!332487))

(assert (= (and b!332487 c!52083) b!332488))

(assert (= (and b!332487 (not c!52083)) b!332485))

(assert (= (or b!332488 b!332485) bm!26209))

(declare-fun m!336987 () Bool)

(assert (=> b!332486 m!336987))

(assert (=> b!332486 m!336987))

(declare-fun m!336989 () Bool)

(assert (=> b!332486 m!336989))

(assert (=> b!332487 m!336987))

(assert (=> b!332487 m!336987))

(declare-fun m!336991 () Bool)

(assert (=> b!332487 m!336991))

(assert (=> b!332489 m!336987))

(assert (=> b!332489 m!336987))

(assert (=> b!332489 m!336991))

(assert (=> bm!26209 m!336987))

(declare-fun m!336993 () Bool)

(assert (=> bm!26209 m!336993))

(assert (=> b!332447 d!70529))

(declare-fun b!332498 () Bool)

(declare-fun e!204177 () Bool)

(declare-fun call!26215 () Bool)

(assert (=> b!332498 (= e!204177 call!26215)))

(declare-fun b!332499 () Bool)

(declare-fun e!204175 () Bool)

(assert (=> b!332499 (= e!204175 call!26215)))

(declare-fun bm!26212 () Bool)

(assert (=> bm!26212 (= call!26215 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70531 () Bool)

(declare-fun res!183173 () Bool)

(declare-fun e!204176 () Bool)

(assert (=> d!70531 (=> res!183173 e!204176)))

(assert (=> d!70531 (= res!183173 (bvsge #b00000000000000000000000000000000 (size!8432 _keys!1895)))))

(assert (=> d!70531 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!204176)))

(declare-fun b!332500 () Bool)

(assert (=> b!332500 (= e!204176 e!204175)))

(declare-fun c!52086 () Bool)

(assert (=> b!332500 (= c!52086 (validKeyInArray!0 (select (arr!8080 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332501 () Bool)

(assert (=> b!332501 (= e!204175 e!204177)))

(declare-fun lt!159017 () (_ BitVec 64))

(assert (=> b!332501 (= lt!159017 (select (arr!8080 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10359 0))(
  ( (Unit!10360) )
))
(declare-fun lt!159019 () Unit!10359)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17091 (_ BitVec 64) (_ BitVec 32)) Unit!10359)

(assert (=> b!332501 (= lt!159019 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159017 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!332501 (arrayContainsKey!0 _keys!1895 lt!159017 #b00000000000000000000000000000000)))

(declare-fun lt!159018 () Unit!10359)

(assert (=> b!332501 (= lt!159018 lt!159019)))

(declare-fun res!183172 () Bool)

(declare-datatypes ((SeekEntryResult!3132 0))(
  ( (MissingZero!3132 (index!14707 (_ BitVec 32))) (Found!3132 (index!14708 (_ BitVec 32))) (Intermediate!3132 (undefined!3944 Bool) (index!14709 (_ BitVec 32)) (x!33116 (_ BitVec 32))) (Undefined!3132) (MissingVacant!3132 (index!14710 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17091 (_ BitVec 32)) SeekEntryResult!3132)

(assert (=> b!332501 (= res!183172 (= (seekEntryOrOpen!0 (select (arr!8080 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3132 #b00000000000000000000000000000000)))))

(assert (=> b!332501 (=> (not res!183172) (not e!204177))))

(assert (= (and d!70531 (not res!183173)) b!332500))

(assert (= (and b!332500 c!52086) b!332501))

(assert (= (and b!332500 (not c!52086)) b!332499))

(assert (= (and b!332501 res!183172) b!332498))

(assert (= (or b!332498 b!332499) bm!26212))

(declare-fun m!336995 () Bool)

(assert (=> bm!26212 m!336995))

(assert (=> b!332500 m!336987))

(assert (=> b!332500 m!336987))

(assert (=> b!332500 m!336991))

(assert (=> b!332501 m!336987))

(declare-fun m!336997 () Bool)

(assert (=> b!332501 m!336997))

(declare-fun m!336999 () Bool)

(assert (=> b!332501 m!336999))

(assert (=> b!332501 m!336987))

(declare-fun m!337001 () Bool)

(assert (=> b!332501 m!337001))

(assert (=> b!332446 d!70531))

(declare-fun b!332508 () Bool)

(declare-fun e!204182 () Bool)

(assert (=> b!332508 (= e!204182 tp_is_empty!6747)))

(declare-fun condMapEmpty!11511 () Bool)

(declare-fun mapDefault!11511 () ValueCell!3030)

(assert (=> mapNonEmpty!11505 (= condMapEmpty!11511 (= mapRest!11505 ((as const (Array (_ BitVec 32) ValueCell!3030)) mapDefault!11511)))))

(declare-fun e!204183 () Bool)

(declare-fun mapRes!11511 () Bool)

(assert (=> mapNonEmpty!11505 (= tp!23880 (and e!204183 mapRes!11511))))

(declare-fun b!332509 () Bool)

(assert (=> b!332509 (= e!204183 tp_is_empty!6747)))

(declare-fun mapIsEmpty!11511 () Bool)

(assert (=> mapIsEmpty!11511 mapRes!11511))

(declare-fun mapNonEmpty!11511 () Bool)

(declare-fun tp!23886 () Bool)

(assert (=> mapNonEmpty!11511 (= mapRes!11511 (and tp!23886 e!204182))))

(declare-fun mapRest!11511 () (Array (_ BitVec 32) ValueCell!3030))

(declare-fun mapKey!11511 () (_ BitVec 32))

(declare-fun mapValue!11511 () ValueCell!3030)

(assert (=> mapNonEmpty!11511 (= mapRest!11505 (store mapRest!11511 mapKey!11511 mapValue!11511))))

(assert (= (and mapNonEmpty!11505 condMapEmpty!11511) mapIsEmpty!11511))

(assert (= (and mapNonEmpty!11505 (not condMapEmpty!11511)) mapNonEmpty!11511))

(assert (= (and mapNonEmpty!11511 ((_ is ValueCellFull!3030) mapValue!11511)) b!332508))

(assert (= (and mapNonEmpty!11505 ((_ is ValueCellFull!3030) mapDefault!11511)) b!332509))

(declare-fun m!337003 () Bool)

(assert (=> mapNonEmpty!11511 m!337003))

(check-sat (not b!332487) tp_is_empty!6747 (not b!332489) (not b!332486) (not b!332500) (not bm!26212) (not mapNonEmpty!11511) (not bm!26209) (not b!332501))
(check-sat)
