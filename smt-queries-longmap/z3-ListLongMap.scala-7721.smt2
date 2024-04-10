; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97002 () Bool)

(assert start!97002)

(declare-fun b!1103407 () Bool)

(declare-fun res!736135 () Bool)

(declare-fun e!629869 () Bool)

(assert (=> b!1103407 (=> (not res!736135) (not e!629869))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103407 (= res!736135 (validMask!0 mask!1564))))

(declare-fun b!1103408 () Bool)

(declare-fun res!736134 () Bool)

(assert (=> b!1103408 (=> (not res!736134) (not e!629869))))

(declare-datatypes ((array!71529 0))(
  ( (array!71530 (arr!34422 (Array (_ BitVec 32) (_ BitVec 64))) (size!34958 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71529)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41531 0))(
  ( (V!41532 (val!13708 Int)) )
))
(declare-datatypes ((ValueCell!12942 0))(
  ( (ValueCellFull!12942 (v!16339 V!41531)) (EmptyCell!12942) )
))
(declare-datatypes ((array!71531 0))(
  ( (array!71532 (arr!34423 (Array (_ BitVec 32) ValueCell!12942)) (size!34959 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71531)

(assert (=> b!1103408 (= res!736134 (and (= (size!34959 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34958 _keys!1208) (size!34959 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103409 () Bool)

(declare-fun e!629866 () Bool)

(declare-fun e!629868 () Bool)

(declare-fun mapRes!42757 () Bool)

(assert (=> b!1103409 (= e!629866 (and e!629868 mapRes!42757))))

(declare-fun condMapEmpty!42757 () Bool)

(declare-fun mapDefault!42757 () ValueCell!12942)

(assert (=> b!1103409 (= condMapEmpty!42757 (= (arr!34423 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12942)) mapDefault!42757)))))

(declare-fun b!1103410 () Bool)

(declare-fun e!629867 () Bool)

(declare-fun tp_is_empty!27303 () Bool)

(assert (=> b!1103410 (= e!629867 tp_is_empty!27303)))

(declare-fun b!1103411 () Bool)

(declare-fun e!629865 () Bool)

(declare-datatypes ((List!24038 0))(
  ( (Nil!24035) (Cons!24034 (h!25243 (_ BitVec 64)) (t!34303 List!24038)) )
))
(declare-fun contains!6412 (List!24038 (_ BitVec 64)) Bool)

(assert (=> b!1103411 (= e!629865 (contains!6412 Nil!24035 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103412 () Bool)

(declare-fun res!736137 () Bool)

(assert (=> b!1103412 (=> (not res!736137) (not e!629869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71529 (_ BitVec 32)) Bool)

(assert (=> b!1103412 (= res!736137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103413 () Bool)

(declare-fun res!736136 () Bool)

(assert (=> b!1103413 (=> (not res!736136) (not e!629869))))

(declare-fun noDuplicate!1584 (List!24038) Bool)

(assert (=> b!1103413 (= res!736136 (noDuplicate!1584 Nil!24035))))

(declare-fun mapNonEmpty!42757 () Bool)

(declare-fun tp!81677 () Bool)

(assert (=> mapNonEmpty!42757 (= mapRes!42757 (and tp!81677 e!629867))))

(declare-fun mapRest!42757 () (Array (_ BitVec 32) ValueCell!12942))

(declare-fun mapKey!42757 () (_ BitVec 32))

(declare-fun mapValue!42757 () ValueCell!12942)

(assert (=> mapNonEmpty!42757 (= (arr!34423 _values!996) (store mapRest!42757 mapKey!42757 mapValue!42757))))

(declare-fun res!736133 () Bool)

(assert (=> start!97002 (=> (not res!736133) (not e!629869))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97002 (= res!736133 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34958 _keys!1208))))))

(assert (=> start!97002 e!629869))

(declare-fun array_inv!26508 (array!71529) Bool)

(assert (=> start!97002 (array_inv!26508 _keys!1208)))

(assert (=> start!97002 true))

(declare-fun array_inv!26509 (array!71531) Bool)

(assert (=> start!97002 (and (array_inv!26509 _values!996) e!629866)))

(declare-fun b!1103414 () Bool)

(assert (=> b!1103414 (= e!629869 e!629865)))

(declare-fun res!736132 () Bool)

(assert (=> b!1103414 (=> res!736132 e!629865)))

(assert (=> b!1103414 (= res!736132 (contains!6412 Nil!24035 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103415 () Bool)

(declare-fun res!736138 () Bool)

(assert (=> b!1103415 (=> (not res!736138) (not e!629869))))

(assert (=> b!1103415 (= res!736138 (and (bvsle #b00000000000000000000000000000000 (size!34958 _keys!1208)) (bvslt (size!34958 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1103416 () Bool)

(assert (=> b!1103416 (= e!629868 tp_is_empty!27303)))

(declare-fun mapIsEmpty!42757 () Bool)

(assert (=> mapIsEmpty!42757 mapRes!42757))

(assert (= (and start!97002 res!736133) b!1103407))

(assert (= (and b!1103407 res!736135) b!1103408))

(assert (= (and b!1103408 res!736134) b!1103412))

(assert (= (and b!1103412 res!736137) b!1103415))

(assert (= (and b!1103415 res!736138) b!1103413))

(assert (= (and b!1103413 res!736136) b!1103414))

(assert (= (and b!1103414 (not res!736132)) b!1103411))

(assert (= (and b!1103409 condMapEmpty!42757) mapIsEmpty!42757))

(assert (= (and b!1103409 (not condMapEmpty!42757)) mapNonEmpty!42757))

(get-info :version)

(assert (= (and mapNonEmpty!42757 ((_ is ValueCellFull!12942) mapValue!42757)) b!1103410))

(assert (= (and b!1103409 ((_ is ValueCellFull!12942) mapDefault!42757)) b!1103416))

(assert (= start!97002 b!1103409))

(declare-fun m!1023573 () Bool)

(assert (=> mapNonEmpty!42757 m!1023573))

(declare-fun m!1023575 () Bool)

(assert (=> b!1103414 m!1023575))

(declare-fun m!1023577 () Bool)

(assert (=> start!97002 m!1023577))

(declare-fun m!1023579 () Bool)

(assert (=> start!97002 m!1023579))

(declare-fun m!1023581 () Bool)

(assert (=> b!1103413 m!1023581))

(declare-fun m!1023583 () Bool)

(assert (=> b!1103412 m!1023583))

(declare-fun m!1023585 () Bool)

(assert (=> b!1103407 m!1023585))

(declare-fun m!1023587 () Bool)

(assert (=> b!1103411 m!1023587))

(check-sat (not b!1103413) (not b!1103414) (not b!1103411) (not b!1103412) (not b!1103407) (not mapNonEmpty!42757) tp_is_empty!27303 (not start!97002))
(check-sat)
(get-model)

(declare-fun d!130825 () Bool)

(declare-fun lt!495063 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!537 (List!24038) (InoxSet (_ BitVec 64)))

(assert (=> d!130825 (= lt!495063 (select (content!537 Nil!24035) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!629893 () Bool)

(assert (=> d!130825 (= lt!495063 e!629893)))

(declare-fun res!736165 () Bool)

(assert (=> d!130825 (=> (not res!736165) (not e!629893))))

(assert (=> d!130825 (= res!736165 ((_ is Cons!24034) Nil!24035))))

(assert (=> d!130825 (= (contains!6412 Nil!24035 #b0000000000000000000000000000000000000000000000000000000000000000) lt!495063)))

(declare-fun b!1103451 () Bool)

(declare-fun e!629892 () Bool)

(assert (=> b!1103451 (= e!629893 e!629892)))

(declare-fun res!736164 () Bool)

(assert (=> b!1103451 (=> res!736164 e!629892)))

(assert (=> b!1103451 (= res!736164 (= (h!25243 Nil!24035) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103452 () Bool)

(assert (=> b!1103452 (= e!629892 (contains!6412 (t!34303 Nil!24035) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!130825 res!736165) b!1103451))

(assert (= (and b!1103451 (not res!736164)) b!1103452))

(declare-fun m!1023605 () Bool)

(assert (=> d!130825 m!1023605))

(declare-fun m!1023607 () Bool)

(assert (=> d!130825 m!1023607))

(declare-fun m!1023609 () Bool)

(assert (=> b!1103452 m!1023609))

(assert (=> b!1103414 d!130825))

(declare-fun d!130827 () Bool)

(declare-fun lt!495064 () Bool)

(assert (=> d!130827 (= lt!495064 (select (content!537 Nil!24035) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!629895 () Bool)

(assert (=> d!130827 (= lt!495064 e!629895)))

(declare-fun res!736167 () Bool)

(assert (=> d!130827 (=> (not res!736167) (not e!629895))))

(assert (=> d!130827 (= res!736167 ((_ is Cons!24034) Nil!24035))))

(assert (=> d!130827 (= (contains!6412 Nil!24035 #b1000000000000000000000000000000000000000000000000000000000000000) lt!495064)))

(declare-fun b!1103453 () Bool)

(declare-fun e!629894 () Bool)

(assert (=> b!1103453 (= e!629895 e!629894)))

(declare-fun res!736166 () Bool)

(assert (=> b!1103453 (=> res!736166 e!629894)))

(assert (=> b!1103453 (= res!736166 (= (h!25243 Nil!24035) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103454 () Bool)

(assert (=> b!1103454 (= e!629894 (contains!6412 (t!34303 Nil!24035) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!130827 res!736167) b!1103453))

(assert (= (and b!1103453 (not res!736166)) b!1103454))

(assert (=> d!130827 m!1023605))

(declare-fun m!1023611 () Bool)

(assert (=> d!130827 m!1023611))

(declare-fun m!1023613 () Bool)

(assert (=> b!1103454 m!1023613))

(assert (=> b!1103411 d!130827))

(declare-fun d!130829 () Bool)

(assert (=> d!130829 (= (array_inv!26508 _keys!1208) (bvsge (size!34958 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97002 d!130829))

(declare-fun d!130831 () Bool)

(assert (=> d!130831 (= (array_inv!26509 _values!996) (bvsge (size!34959 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97002 d!130831))

(declare-fun d!130833 () Bool)

(declare-fun res!736172 () Bool)

(declare-fun e!629900 () Bool)

(assert (=> d!130833 (=> res!736172 e!629900)))

(assert (=> d!130833 (= res!736172 ((_ is Nil!24035) Nil!24035))))

(assert (=> d!130833 (= (noDuplicate!1584 Nil!24035) e!629900)))

(declare-fun b!1103459 () Bool)

(declare-fun e!629901 () Bool)

(assert (=> b!1103459 (= e!629900 e!629901)))

(declare-fun res!736173 () Bool)

(assert (=> b!1103459 (=> (not res!736173) (not e!629901))))

(assert (=> b!1103459 (= res!736173 (not (contains!6412 (t!34303 Nil!24035) (h!25243 Nil!24035))))))

(declare-fun b!1103460 () Bool)

(assert (=> b!1103460 (= e!629901 (noDuplicate!1584 (t!34303 Nil!24035)))))

(assert (= (and d!130833 (not res!736172)) b!1103459))

(assert (= (and b!1103459 res!736173) b!1103460))

(declare-fun m!1023615 () Bool)

(assert (=> b!1103459 m!1023615))

(declare-fun m!1023617 () Bool)

(assert (=> b!1103460 m!1023617))

(assert (=> b!1103413 d!130833))

(declare-fun d!130835 () Bool)

(assert (=> d!130835 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1103407 d!130835))

(declare-fun b!1103469 () Bool)

(declare-fun e!629908 () Bool)

(declare-fun e!629909 () Bool)

(assert (=> b!1103469 (= e!629908 e!629909)))

(declare-fun c!108979 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103469 (= c!108979 (validKeyInArray!0 (select (arr!34422 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!46322 () Bool)

(declare-fun call!46325 () Bool)

(assert (=> bm!46322 (= call!46325 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1103471 () Bool)

(assert (=> b!1103471 (= e!629909 call!46325)))

(declare-fun b!1103472 () Bool)

(declare-fun e!629910 () Bool)

(assert (=> b!1103472 (= e!629909 e!629910)))

(declare-fun lt!495073 () (_ BitVec 64))

(assert (=> b!1103472 (= lt!495073 (select (arr!34422 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36244 0))(
  ( (Unit!36245) )
))
(declare-fun lt!495071 () Unit!36244)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71529 (_ BitVec 64) (_ BitVec 32)) Unit!36244)

(assert (=> b!1103472 (= lt!495071 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495073 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103472 (arrayContainsKey!0 _keys!1208 lt!495073 #b00000000000000000000000000000000)))

(declare-fun lt!495072 () Unit!36244)

(assert (=> b!1103472 (= lt!495072 lt!495071)))

(declare-fun res!736178 () Bool)

(declare-datatypes ((SeekEntryResult!9920 0))(
  ( (MissingZero!9920 (index!42051 (_ BitVec 32))) (Found!9920 (index!42052 (_ BitVec 32))) (Intermediate!9920 (undefined!10732 Bool) (index!42053 (_ BitVec 32)) (x!99249 (_ BitVec 32))) (Undefined!9920) (MissingVacant!9920 (index!42054 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71529 (_ BitVec 32)) SeekEntryResult!9920)

(assert (=> b!1103472 (= res!736178 (= (seekEntryOrOpen!0 (select (arr!34422 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9920 #b00000000000000000000000000000000)))))

(assert (=> b!1103472 (=> (not res!736178) (not e!629910))))

(declare-fun b!1103470 () Bool)

(assert (=> b!1103470 (= e!629910 call!46325)))

(declare-fun d!130837 () Bool)

(declare-fun res!736179 () Bool)

(assert (=> d!130837 (=> res!736179 e!629908)))

(assert (=> d!130837 (= res!736179 (bvsge #b00000000000000000000000000000000 (size!34958 _keys!1208)))))

(assert (=> d!130837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!629908)))

(assert (= (and d!130837 (not res!736179)) b!1103469))

(assert (= (and b!1103469 c!108979) b!1103472))

(assert (= (and b!1103469 (not c!108979)) b!1103471))

(assert (= (and b!1103472 res!736178) b!1103470))

(assert (= (or b!1103470 b!1103471) bm!46322))

(declare-fun m!1023619 () Bool)

(assert (=> b!1103469 m!1023619))

(assert (=> b!1103469 m!1023619))

(declare-fun m!1023621 () Bool)

(assert (=> b!1103469 m!1023621))

(declare-fun m!1023623 () Bool)

(assert (=> bm!46322 m!1023623))

(assert (=> b!1103472 m!1023619))

(declare-fun m!1023625 () Bool)

(assert (=> b!1103472 m!1023625))

(declare-fun m!1023627 () Bool)

(assert (=> b!1103472 m!1023627))

(assert (=> b!1103472 m!1023619))

(declare-fun m!1023629 () Bool)

(assert (=> b!1103472 m!1023629))

(assert (=> b!1103412 d!130837))

(declare-fun b!1103479 () Bool)

(declare-fun e!629916 () Bool)

(assert (=> b!1103479 (= e!629916 tp_is_empty!27303)))

(declare-fun condMapEmpty!42763 () Bool)

(declare-fun mapDefault!42763 () ValueCell!12942)

(assert (=> mapNonEmpty!42757 (= condMapEmpty!42763 (= mapRest!42757 ((as const (Array (_ BitVec 32) ValueCell!12942)) mapDefault!42763)))))

(declare-fun e!629915 () Bool)

(declare-fun mapRes!42763 () Bool)

(assert (=> mapNonEmpty!42757 (= tp!81677 (and e!629915 mapRes!42763))))

(declare-fun mapIsEmpty!42763 () Bool)

(assert (=> mapIsEmpty!42763 mapRes!42763))

(declare-fun mapNonEmpty!42763 () Bool)

(declare-fun tp!81683 () Bool)

(assert (=> mapNonEmpty!42763 (= mapRes!42763 (and tp!81683 e!629916))))

(declare-fun mapKey!42763 () (_ BitVec 32))

(declare-fun mapRest!42763 () (Array (_ BitVec 32) ValueCell!12942))

(declare-fun mapValue!42763 () ValueCell!12942)

(assert (=> mapNonEmpty!42763 (= mapRest!42757 (store mapRest!42763 mapKey!42763 mapValue!42763))))

(declare-fun b!1103480 () Bool)

(assert (=> b!1103480 (= e!629915 tp_is_empty!27303)))

(assert (= (and mapNonEmpty!42757 condMapEmpty!42763) mapIsEmpty!42763))

(assert (= (and mapNonEmpty!42757 (not condMapEmpty!42763)) mapNonEmpty!42763))

(assert (= (and mapNonEmpty!42763 ((_ is ValueCellFull!12942) mapValue!42763)) b!1103479))

(assert (= (and mapNonEmpty!42757 ((_ is ValueCellFull!12942) mapDefault!42763)) b!1103480))

(declare-fun m!1023631 () Bool)

(assert (=> mapNonEmpty!42763 m!1023631))

(check-sat (not bm!46322) (not b!1103454) (not d!130827) (not d!130825) (not b!1103452) (not mapNonEmpty!42763) (not b!1103472) (not b!1103459) tp_is_empty!27303 (not b!1103460) (not b!1103469))
(check-sat)
