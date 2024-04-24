; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38276 () Bool)

(assert start!38276)

(declare-fun b!394901 () Bool)

(declare-fun e!239083 () Bool)

(declare-fun tp_is_empty!9781 () Bool)

(assert (=> b!394901 (= e!239083 tp_is_empty!9781)))

(declare-fun mapIsEmpty!16278 () Bool)

(declare-fun mapRes!16278 () Bool)

(assert (=> mapIsEmpty!16278 mapRes!16278))

(declare-fun b!394902 () Bool)

(declare-fun res!226384 () Bool)

(declare-fun e!239087 () Bool)

(assert (=> b!394902 (=> (not res!226384) (not e!239087))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394902 (= res!226384 (validMask!0 mask!1025))))

(declare-fun b!394903 () Bool)

(declare-fun e!239086 () Bool)

(assert (=> b!394903 (= e!239087 e!239086)))

(declare-fun res!226388 () Bool)

(assert (=> b!394903 (=> res!226388 e!239086)))

(declare-datatypes ((List!6362 0))(
  ( (Nil!6359) (Cons!6358 (h!7214 (_ BitVec 64)) (t!11528 List!6362)) )
))
(declare-fun contains!2456 (List!6362 (_ BitVec 64)) Bool)

(assert (=> b!394903 (= res!226388 (contains!2456 Nil!6359 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394904 () Bool)

(declare-fun e!239088 () Bool)

(assert (=> b!394904 (= e!239088 tp_is_empty!9781)))

(declare-fun b!394905 () Bool)

(declare-fun res!226386 () Bool)

(assert (=> b!394905 (=> (not res!226386) (not e!239087))))

(declare-datatypes ((array!23460 0))(
  ( (array!23461 (arr!11184 (Array (_ BitVec 32) (_ BitVec 64))) (size!11536 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23460)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14147 0))(
  ( (V!14148 (val!4935 Int)) )
))
(declare-datatypes ((ValueCell!4547 0))(
  ( (ValueCellFull!4547 (v!7181 V!14147)) (EmptyCell!4547) )
))
(declare-datatypes ((array!23462 0))(
  ( (array!23463 (arr!11185 (Array (_ BitVec 32) ValueCell!4547)) (size!11537 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23462)

(assert (=> b!394905 (= res!226386 (and (= (size!11537 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11536 _keys!709) (size!11537 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394906 () Bool)

(assert (=> b!394906 (= e!239086 (contains!2456 Nil!6359 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394907 () Bool)

(declare-fun res!226383 () Bool)

(assert (=> b!394907 (=> (not res!226383) (not e!239087))))

(assert (=> b!394907 (= res!226383 (and (bvsle #b00000000000000000000000000000000 (size!11536 _keys!709)) (bvslt (size!11536 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun res!226387 () Bool)

(assert (=> start!38276 (=> (not res!226387) (not e!239087))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38276 (= res!226387 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11536 _keys!709))))))

(assert (=> start!38276 e!239087))

(assert (=> start!38276 true))

(declare-fun e!239085 () Bool)

(declare-fun array_inv!8266 (array!23462) Bool)

(assert (=> start!38276 (and (array_inv!8266 _values!549) e!239085)))

(declare-fun array_inv!8267 (array!23460) Bool)

(assert (=> start!38276 (array_inv!8267 _keys!709)))

(declare-fun b!394908 () Bool)

(declare-fun res!226382 () Bool)

(assert (=> b!394908 (=> (not res!226382) (not e!239087))))

(declare-fun noDuplicate!197 (List!6362) Bool)

(assert (=> b!394908 (= res!226382 (noDuplicate!197 Nil!6359))))

(declare-fun mapNonEmpty!16278 () Bool)

(declare-fun tp!32073 () Bool)

(assert (=> mapNonEmpty!16278 (= mapRes!16278 (and tp!32073 e!239088))))

(declare-fun mapValue!16278 () ValueCell!4547)

(declare-fun mapRest!16278 () (Array (_ BitVec 32) ValueCell!4547))

(declare-fun mapKey!16278 () (_ BitVec 32))

(assert (=> mapNonEmpty!16278 (= (arr!11185 _values!549) (store mapRest!16278 mapKey!16278 mapValue!16278))))

(declare-fun b!394909 () Bool)

(assert (=> b!394909 (= e!239085 (and e!239083 mapRes!16278))))

(declare-fun condMapEmpty!16278 () Bool)

(declare-fun mapDefault!16278 () ValueCell!4547)

(assert (=> b!394909 (= condMapEmpty!16278 (= (arr!11185 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4547)) mapDefault!16278)))))

(declare-fun b!394910 () Bool)

(declare-fun res!226385 () Bool)

(assert (=> b!394910 (=> (not res!226385) (not e!239087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23460 (_ BitVec 32)) Bool)

(assert (=> b!394910 (= res!226385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38276 res!226387) b!394902))

(assert (= (and b!394902 res!226384) b!394905))

(assert (= (and b!394905 res!226386) b!394910))

(assert (= (and b!394910 res!226385) b!394907))

(assert (= (and b!394907 res!226383) b!394908))

(assert (= (and b!394908 res!226382) b!394903))

(assert (= (and b!394903 (not res!226388)) b!394906))

(assert (= (and b!394909 condMapEmpty!16278) mapIsEmpty!16278))

(assert (= (and b!394909 (not condMapEmpty!16278)) mapNonEmpty!16278))

(get-info :version)

(assert (= (and mapNonEmpty!16278 ((_ is ValueCellFull!4547) mapValue!16278)) b!394904))

(assert (= (and b!394909 ((_ is ValueCellFull!4547) mapDefault!16278)) b!394901))

(assert (= start!38276 b!394909))

(declare-fun m!391445 () Bool)

(assert (=> b!394903 m!391445))

(declare-fun m!391447 () Bool)

(assert (=> b!394906 m!391447))

(declare-fun m!391449 () Bool)

(assert (=> b!394902 m!391449))

(declare-fun m!391451 () Bool)

(assert (=> b!394910 m!391451))

(declare-fun m!391453 () Bool)

(assert (=> b!394908 m!391453))

(declare-fun m!391455 () Bool)

(assert (=> mapNonEmpty!16278 m!391455))

(declare-fun m!391457 () Bool)

(assert (=> start!38276 m!391457))

(declare-fun m!391459 () Bool)

(assert (=> start!38276 m!391459))

(check-sat (not start!38276) (not b!394902) (not b!394908) (not b!394903) tp_is_empty!9781 (not b!394906) (not mapNonEmpty!16278) (not b!394910))
(check-sat)
(get-model)

(declare-fun d!73343 () Bool)

(assert (=> d!73343 (= (array_inv!8266 _values!549) (bvsge (size!11537 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38276 d!73343))

(declare-fun d!73345 () Bool)

(assert (=> d!73345 (= (array_inv!8267 _keys!709) (bvsge (size!11536 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38276 d!73345))

(declare-fun d!73347 () Bool)

(declare-fun res!226435 () Bool)

(declare-fun e!239133 () Bool)

(assert (=> d!73347 (=> res!226435 e!239133)))

(assert (=> d!73347 (= res!226435 (bvsge #b00000000000000000000000000000000 (size!11536 _keys!709)))))

(assert (=> d!73347 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239133)))

(declare-fun b!394979 () Bool)

(declare-fun e!239132 () Bool)

(assert (=> b!394979 (= e!239133 e!239132)))

(declare-fun c!54522 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394979 (= c!54522 (validKeyInArray!0 (select (arr!11184 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!394980 () Bool)

(declare-fun call!27856 () Bool)

(assert (=> b!394980 (= e!239132 call!27856)))

(declare-fun b!394981 () Bool)

(declare-fun e!239131 () Bool)

(assert (=> b!394981 (= e!239131 call!27856)))

(declare-fun b!394982 () Bool)

(assert (=> b!394982 (= e!239132 e!239131)))

(declare-fun lt!187072 () (_ BitVec 64))

(assert (=> b!394982 (= lt!187072 (select (arr!11184 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12037 0))(
  ( (Unit!12038) )
))
(declare-fun lt!187070 () Unit!12037)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23460 (_ BitVec 64) (_ BitVec 32)) Unit!12037)

(assert (=> b!394982 (= lt!187070 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187072 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!23460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394982 (arrayContainsKey!0 _keys!709 lt!187072 #b00000000000000000000000000000000)))

(declare-fun lt!187071 () Unit!12037)

(assert (=> b!394982 (= lt!187071 lt!187070)))

(declare-fun res!226436 () Bool)

(declare-datatypes ((SeekEntryResult!3471 0))(
  ( (MissingZero!3471 (index!16063 (_ BitVec 32))) (Found!3471 (index!16064 (_ BitVec 32))) (Intermediate!3471 (undefined!4283 Bool) (index!16065 (_ BitVec 32)) (x!38540 (_ BitVec 32))) (Undefined!3471) (MissingVacant!3471 (index!16066 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23460 (_ BitVec 32)) SeekEntryResult!3471)

(assert (=> b!394982 (= res!226436 (= (seekEntryOrOpen!0 (select (arr!11184 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3471 #b00000000000000000000000000000000)))))

(assert (=> b!394982 (=> (not res!226436) (not e!239131))))

(declare-fun bm!27853 () Bool)

(assert (=> bm!27853 (= call!27856 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!73347 (not res!226435)) b!394979))

(assert (= (and b!394979 c!54522) b!394982))

(assert (= (and b!394979 (not c!54522)) b!394980))

(assert (= (and b!394982 res!226436) b!394981))

(assert (= (or b!394981 b!394980) bm!27853))

(declare-fun m!391493 () Bool)

(assert (=> b!394979 m!391493))

(assert (=> b!394979 m!391493))

(declare-fun m!391495 () Bool)

(assert (=> b!394979 m!391495))

(assert (=> b!394982 m!391493))

(declare-fun m!391497 () Bool)

(assert (=> b!394982 m!391497))

(declare-fun m!391499 () Bool)

(assert (=> b!394982 m!391499))

(assert (=> b!394982 m!391493))

(declare-fun m!391501 () Bool)

(assert (=> b!394982 m!391501))

(declare-fun m!391503 () Bool)

(assert (=> bm!27853 m!391503))

(assert (=> b!394910 d!73347))

(declare-fun d!73349 () Bool)

(declare-fun lt!187075 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!203 (List!6362) (InoxSet (_ BitVec 64)))

(assert (=> d!73349 (= lt!187075 (select (content!203 Nil!6359) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!239139 () Bool)

(assert (=> d!73349 (= lt!187075 e!239139)))

(declare-fun res!226441 () Bool)

(assert (=> d!73349 (=> (not res!226441) (not e!239139))))

(assert (=> d!73349 (= res!226441 ((_ is Cons!6358) Nil!6359))))

(assert (=> d!73349 (= (contains!2456 Nil!6359 #b1000000000000000000000000000000000000000000000000000000000000000) lt!187075)))

(declare-fun b!394987 () Bool)

(declare-fun e!239138 () Bool)

(assert (=> b!394987 (= e!239139 e!239138)))

(declare-fun res!226442 () Bool)

(assert (=> b!394987 (=> res!226442 e!239138)))

(assert (=> b!394987 (= res!226442 (= (h!7214 Nil!6359) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394988 () Bool)

(assert (=> b!394988 (= e!239138 (contains!2456 (t!11528 Nil!6359) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!73349 res!226441) b!394987))

(assert (= (and b!394987 (not res!226442)) b!394988))

(declare-fun m!391505 () Bool)

(assert (=> d!73349 m!391505))

(declare-fun m!391507 () Bool)

(assert (=> d!73349 m!391507))

(declare-fun m!391509 () Bool)

(assert (=> b!394988 m!391509))

(assert (=> b!394906 d!73349))

(declare-fun d!73351 () Bool)

(assert (=> d!73351 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!394902 d!73351))

(declare-fun d!73353 () Bool)

(declare-fun res!226447 () Bool)

(declare-fun e!239144 () Bool)

(assert (=> d!73353 (=> res!226447 e!239144)))

(assert (=> d!73353 (= res!226447 ((_ is Nil!6359) Nil!6359))))

(assert (=> d!73353 (= (noDuplicate!197 Nil!6359) e!239144)))

(declare-fun b!394993 () Bool)

(declare-fun e!239145 () Bool)

(assert (=> b!394993 (= e!239144 e!239145)))

(declare-fun res!226448 () Bool)

(assert (=> b!394993 (=> (not res!226448) (not e!239145))))

(assert (=> b!394993 (= res!226448 (not (contains!2456 (t!11528 Nil!6359) (h!7214 Nil!6359))))))

(declare-fun b!394994 () Bool)

(assert (=> b!394994 (= e!239145 (noDuplicate!197 (t!11528 Nil!6359)))))

(assert (= (and d!73353 (not res!226447)) b!394993))

(assert (= (and b!394993 res!226448) b!394994))

(declare-fun m!391511 () Bool)

(assert (=> b!394993 m!391511))

(declare-fun m!391513 () Bool)

(assert (=> b!394994 m!391513))

(assert (=> b!394908 d!73353))

(declare-fun d!73355 () Bool)

(declare-fun lt!187076 () Bool)

(assert (=> d!73355 (= lt!187076 (select (content!203 Nil!6359) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!239147 () Bool)

(assert (=> d!73355 (= lt!187076 e!239147)))

(declare-fun res!226449 () Bool)

(assert (=> d!73355 (=> (not res!226449) (not e!239147))))

(assert (=> d!73355 (= res!226449 ((_ is Cons!6358) Nil!6359))))

(assert (=> d!73355 (= (contains!2456 Nil!6359 #b0000000000000000000000000000000000000000000000000000000000000000) lt!187076)))

(declare-fun b!394995 () Bool)

(declare-fun e!239146 () Bool)

(assert (=> b!394995 (= e!239147 e!239146)))

(declare-fun res!226450 () Bool)

(assert (=> b!394995 (=> res!226450 e!239146)))

(assert (=> b!394995 (= res!226450 (= (h!7214 Nil!6359) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394996 () Bool)

(assert (=> b!394996 (= e!239146 (contains!2456 (t!11528 Nil!6359) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!73355 res!226449) b!394995))

(assert (= (and b!394995 (not res!226450)) b!394996))

(assert (=> d!73355 m!391505))

(declare-fun m!391515 () Bool)

(assert (=> d!73355 m!391515))

(declare-fun m!391517 () Bool)

(assert (=> b!394996 m!391517))

(assert (=> b!394903 d!73355))

(declare-fun b!395003 () Bool)

(declare-fun e!239153 () Bool)

(assert (=> b!395003 (= e!239153 tp_is_empty!9781)))

(declare-fun condMapEmpty!16287 () Bool)

(declare-fun mapDefault!16287 () ValueCell!4547)

(assert (=> mapNonEmpty!16278 (= condMapEmpty!16287 (= mapRest!16278 ((as const (Array (_ BitVec 32) ValueCell!4547)) mapDefault!16287)))))

(declare-fun e!239152 () Bool)

(declare-fun mapRes!16287 () Bool)

(assert (=> mapNonEmpty!16278 (= tp!32073 (and e!239152 mapRes!16287))))

(declare-fun b!395004 () Bool)

(assert (=> b!395004 (= e!239152 tp_is_empty!9781)))

(declare-fun mapNonEmpty!16287 () Bool)

(declare-fun tp!32082 () Bool)

(assert (=> mapNonEmpty!16287 (= mapRes!16287 (and tp!32082 e!239153))))

(declare-fun mapKey!16287 () (_ BitVec 32))

(declare-fun mapRest!16287 () (Array (_ BitVec 32) ValueCell!4547))

(declare-fun mapValue!16287 () ValueCell!4547)

(assert (=> mapNonEmpty!16287 (= mapRest!16278 (store mapRest!16287 mapKey!16287 mapValue!16287))))

(declare-fun mapIsEmpty!16287 () Bool)

(assert (=> mapIsEmpty!16287 mapRes!16287))

(assert (= (and mapNonEmpty!16278 condMapEmpty!16287) mapIsEmpty!16287))

(assert (= (and mapNonEmpty!16278 (not condMapEmpty!16287)) mapNonEmpty!16287))

(assert (= (and mapNonEmpty!16287 ((_ is ValueCellFull!4547) mapValue!16287)) b!395003))

(assert (= (and mapNonEmpty!16278 ((_ is ValueCellFull!4547) mapDefault!16287)) b!395004))

(declare-fun m!391519 () Bool)

(assert (=> mapNonEmpty!16287 m!391519))

(check-sat (not bm!27853) (not b!394993) (not b!394979) (not b!394988) (not d!73349) (not mapNonEmpty!16287) (not b!394994) tp_is_empty!9781 (not b!394982) (not b!394996) (not d!73355))
(check-sat)
