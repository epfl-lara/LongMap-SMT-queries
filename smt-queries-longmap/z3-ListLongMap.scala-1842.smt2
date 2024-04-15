; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33368 () Bool)

(assert start!33368)

(declare-fun b!331356 () Bool)

(declare-fun res!182587 () Bool)

(declare-fun e!203320 () Bool)

(assert (=> b!331356 (=> (not res!182587) (not e!203320))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9875 0))(
  ( (V!9876 (val!3381 Int)) )
))
(declare-datatypes ((ValueCell!2993 0))(
  ( (ValueCellFull!2993 (v!5533 V!9875)) (EmptyCell!2993) )
))
(declare-datatypes ((array!16929 0))(
  ( (array!16930 (arr!8003 (Array (_ BitVec 32) ValueCell!2993)) (size!8356 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16929)

(declare-datatypes ((array!16931 0))(
  ( (array!16932 (arr!8004 (Array (_ BitVec 32) (_ BitVec 64))) (size!8357 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16931)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331356 (= res!182587 (and (= (size!8356 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8357 _keys!1895) (size!8356 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331357 () Bool)

(declare-fun e!203318 () Bool)

(declare-fun tp_is_empty!6673 () Bool)

(assert (=> b!331357 (= e!203318 tp_is_empty!6673)))

(declare-fun res!182589 () Bool)

(assert (=> start!33368 (=> (not res!182589) (not e!203320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33368 (= res!182589 (validMask!0 mask!2385))))

(assert (=> start!33368 e!203320))

(assert (=> start!33368 true))

(declare-fun e!203317 () Bool)

(declare-fun array_inv!5972 (array!16929) Bool)

(assert (=> start!33368 (and (array_inv!5972 _values!1525) e!203317)))

(declare-fun array_inv!5973 (array!16931) Bool)

(assert (=> start!33368 (array_inv!5973 _keys!1895)))

(declare-fun b!331358 () Bool)

(declare-fun e!203319 () Bool)

(declare-fun mapRes!11382 () Bool)

(assert (=> b!331358 (= e!203317 (and e!203319 mapRes!11382))))

(declare-fun condMapEmpty!11382 () Bool)

(declare-fun mapDefault!11382 () ValueCell!2993)

(assert (=> b!331358 (= condMapEmpty!11382 (= (arr!8003 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2993)) mapDefault!11382)))))

(declare-fun mapIsEmpty!11382 () Bool)

(assert (=> mapIsEmpty!11382 mapRes!11382))

(declare-fun b!331359 () Bool)

(assert (=> b!331359 (= e!203320 (bvsgt #b00000000000000000000000000000000 (size!8357 _keys!1895)))))

(declare-fun b!331360 () Bool)

(assert (=> b!331360 (= e!203319 tp_is_empty!6673)))

(declare-fun mapNonEmpty!11382 () Bool)

(declare-fun tp!23757 () Bool)

(assert (=> mapNonEmpty!11382 (= mapRes!11382 (and tp!23757 e!203318))))

(declare-fun mapValue!11382 () ValueCell!2993)

(declare-fun mapRest!11382 () (Array (_ BitVec 32) ValueCell!2993))

(declare-fun mapKey!11382 () (_ BitVec 32))

(assert (=> mapNonEmpty!11382 (= (arr!8003 _values!1525) (store mapRest!11382 mapKey!11382 mapValue!11382))))

(declare-fun b!331361 () Bool)

(declare-fun res!182588 () Bool)

(assert (=> b!331361 (=> (not res!182588) (not e!203320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16931 (_ BitVec 32)) Bool)

(assert (=> b!331361 (= res!182588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33368 res!182589) b!331356))

(assert (= (and b!331356 res!182587) b!331361))

(assert (= (and b!331361 res!182588) b!331359))

(assert (= (and b!331358 condMapEmpty!11382) mapIsEmpty!11382))

(assert (= (and b!331358 (not condMapEmpty!11382)) mapNonEmpty!11382))

(get-info :version)

(assert (= (and mapNonEmpty!11382 ((_ is ValueCellFull!2993) mapValue!11382)) b!331357))

(assert (= (and b!331358 ((_ is ValueCellFull!2993) mapDefault!11382)) b!331360))

(assert (= start!33368 b!331358))

(declare-fun m!335709 () Bool)

(assert (=> start!33368 m!335709))

(declare-fun m!335711 () Bool)

(assert (=> start!33368 m!335711))

(declare-fun m!335713 () Bool)

(assert (=> start!33368 m!335713))

(declare-fun m!335715 () Bool)

(assert (=> mapNonEmpty!11382 m!335715))

(declare-fun m!335717 () Bool)

(assert (=> b!331361 m!335717))

(check-sat (not b!331361) (not start!33368) (not mapNonEmpty!11382) tp_is_empty!6673)
(check-sat)
(get-model)

(declare-fun b!331406 () Bool)

(declare-fun e!203360 () Bool)

(declare-fun e!203358 () Bool)

(assert (=> b!331406 (= e!203360 e!203358)))

(declare-fun lt!158671 () (_ BitVec 64))

(assert (=> b!331406 (= lt!158671 (select (arr!8004 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10328 0))(
  ( (Unit!10329) )
))
(declare-fun lt!158670 () Unit!10328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16931 (_ BitVec 64) (_ BitVec 32)) Unit!10328)

(assert (=> b!331406 (= lt!158670 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158671 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!16931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331406 (arrayContainsKey!0 _keys!1895 lt!158671 #b00000000000000000000000000000000)))

(declare-fun lt!158672 () Unit!10328)

(assert (=> b!331406 (= lt!158672 lt!158670)))

(declare-fun res!182613 () Bool)

(declare-datatypes ((SeekEntryResult!3122 0))(
  ( (MissingZero!3122 (index!14667 (_ BitVec 32))) (Found!3122 (index!14668 (_ BitVec 32))) (Intermediate!3122 (undefined!3934 Bool) (index!14669 (_ BitVec 32)) (x!32997 (_ BitVec 32))) (Undefined!3122) (MissingVacant!3122 (index!14670 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16931 (_ BitVec 32)) SeekEntryResult!3122)

(assert (=> b!331406 (= res!182613 (= (seekEntryOrOpen!0 (select (arr!8004 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3122 #b00000000000000000000000000000000)))))

(assert (=> b!331406 (=> (not res!182613) (not e!203358))))

(declare-fun b!331407 () Bool)

(declare-fun call!26174 () Bool)

(assert (=> b!331407 (= e!203358 call!26174)))

(declare-fun bm!26171 () Bool)

(assert (=> bm!26171 (= call!26174 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!331408 () Bool)

(declare-fun e!203359 () Bool)

(assert (=> b!331408 (= e!203359 e!203360)))

(declare-fun c!51998 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331408 (= c!51998 (validKeyInArray!0 (select (arr!8004 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!331409 () Bool)

(assert (=> b!331409 (= e!203360 call!26174)))

(declare-fun d!70251 () Bool)

(declare-fun res!182612 () Bool)

(assert (=> d!70251 (=> res!182612 e!203359)))

(assert (=> d!70251 (= res!182612 (bvsge #b00000000000000000000000000000000 (size!8357 _keys!1895)))))

(assert (=> d!70251 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203359)))

(assert (= (and d!70251 (not res!182612)) b!331408))

(assert (= (and b!331408 c!51998) b!331406))

(assert (= (and b!331408 (not c!51998)) b!331409))

(assert (= (and b!331406 res!182613) b!331407))

(assert (= (or b!331407 b!331409) bm!26171))

(declare-fun m!335739 () Bool)

(assert (=> b!331406 m!335739))

(declare-fun m!335741 () Bool)

(assert (=> b!331406 m!335741))

(declare-fun m!335743 () Bool)

(assert (=> b!331406 m!335743))

(assert (=> b!331406 m!335739))

(declare-fun m!335745 () Bool)

(assert (=> b!331406 m!335745))

(declare-fun m!335747 () Bool)

(assert (=> bm!26171 m!335747))

(assert (=> b!331408 m!335739))

(assert (=> b!331408 m!335739))

(declare-fun m!335749 () Bool)

(assert (=> b!331408 m!335749))

(assert (=> b!331361 d!70251))

(declare-fun d!70253 () Bool)

(assert (=> d!70253 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33368 d!70253))

(declare-fun d!70255 () Bool)

(assert (=> d!70255 (= (array_inv!5972 _values!1525) (bvsge (size!8356 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33368 d!70255))

(declare-fun d!70257 () Bool)

(assert (=> d!70257 (= (array_inv!5973 _keys!1895) (bvsge (size!8357 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33368 d!70257))

(declare-fun condMapEmpty!11391 () Bool)

(declare-fun mapDefault!11391 () ValueCell!2993)

(assert (=> mapNonEmpty!11382 (= condMapEmpty!11391 (= mapRest!11382 ((as const (Array (_ BitVec 32) ValueCell!2993)) mapDefault!11391)))))

(declare-fun e!203365 () Bool)

(declare-fun mapRes!11391 () Bool)

(assert (=> mapNonEmpty!11382 (= tp!23757 (and e!203365 mapRes!11391))))

(declare-fun mapNonEmpty!11391 () Bool)

(declare-fun tp!23766 () Bool)

(declare-fun e!203366 () Bool)

(assert (=> mapNonEmpty!11391 (= mapRes!11391 (and tp!23766 e!203366))))

(declare-fun mapRest!11391 () (Array (_ BitVec 32) ValueCell!2993))

(declare-fun mapValue!11391 () ValueCell!2993)

(declare-fun mapKey!11391 () (_ BitVec 32))

(assert (=> mapNonEmpty!11391 (= mapRest!11382 (store mapRest!11391 mapKey!11391 mapValue!11391))))

(declare-fun b!331416 () Bool)

(assert (=> b!331416 (= e!203366 tp_is_empty!6673)))

(declare-fun b!331417 () Bool)

(assert (=> b!331417 (= e!203365 tp_is_empty!6673)))

(declare-fun mapIsEmpty!11391 () Bool)

(assert (=> mapIsEmpty!11391 mapRes!11391))

(assert (= (and mapNonEmpty!11382 condMapEmpty!11391) mapIsEmpty!11391))

(assert (= (and mapNonEmpty!11382 (not condMapEmpty!11391)) mapNonEmpty!11391))

(assert (= (and mapNonEmpty!11391 ((_ is ValueCellFull!2993) mapValue!11391)) b!331416))

(assert (= (and mapNonEmpty!11382 ((_ is ValueCellFull!2993) mapDefault!11391)) b!331417))

(declare-fun m!335751 () Bool)

(assert (=> mapNonEmpty!11391 m!335751))

(check-sat tp_is_empty!6673 (not b!331408) (not b!331406) (not mapNonEmpty!11391) (not bm!26171))
(check-sat)
