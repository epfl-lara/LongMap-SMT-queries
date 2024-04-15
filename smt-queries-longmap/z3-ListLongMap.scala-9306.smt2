; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111234 () Bool)

(assert start!111234)

(declare-fun b!1316683 () Bool)

(declare-fun e!751184 () Bool)

(declare-datatypes ((array!88367 0))(
  ( (array!88368 (arr!42662 (Array (_ BitVec 32) (_ BitVec 64))) (size!43214 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88367)

(assert (=> b!1316683 (= e!751184 (bvsgt #b00000000000000000000000000000000 (size!43214 _keys!1609)))))

(declare-fun b!1316684 () Bool)

(declare-fun res!874000 () Bool)

(assert (=> b!1316684 (=> (not res!874000) (not e!751184))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52769 0))(
  ( (V!52770 (val!17949 Int)) )
))
(declare-datatypes ((ValueCell!16976 0))(
  ( (ValueCellFull!16976 (v!20577 V!52769)) (EmptyCell!16976) )
))
(declare-datatypes ((array!88369 0))(
  ( (array!88370 (arr!42663 (Array (_ BitVec 32) ValueCell!16976)) (size!43215 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88369)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1316684 (= res!874000 (and (= (size!43215 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43214 _keys!1609) (size!43215 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!873998 () Bool)

(assert (=> start!111234 (=> (not res!873998) (not e!751184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111234 (= res!873998 (validMask!0 mask!2019))))

(assert (=> start!111234 e!751184))

(assert (=> start!111234 true))

(declare-fun e!751186 () Bool)

(declare-fun array_inv!32401 (array!88369) Bool)

(assert (=> start!111234 (and (array_inv!32401 _values!1337) e!751186)))

(declare-fun array_inv!32402 (array!88367) Bool)

(assert (=> start!111234 (array_inv!32402 _keys!1609)))

(declare-fun b!1316685 () Bool)

(declare-fun e!751187 () Bool)

(declare-fun tp_is_empty!35749 () Bool)

(assert (=> b!1316685 (= e!751187 tp_is_empty!35749)))

(declare-fun mapNonEmpty!55259 () Bool)

(declare-fun mapRes!55259 () Bool)

(declare-fun tp!105366 () Bool)

(declare-fun e!751185 () Bool)

(assert (=> mapNonEmpty!55259 (= mapRes!55259 (and tp!105366 e!751185))))

(declare-fun mapValue!55259 () ValueCell!16976)

(declare-fun mapRest!55259 () (Array (_ BitVec 32) ValueCell!16976))

(declare-fun mapKey!55259 () (_ BitVec 32))

(assert (=> mapNonEmpty!55259 (= (arr!42663 _values!1337) (store mapRest!55259 mapKey!55259 mapValue!55259))))

(declare-fun b!1316686 () Bool)

(assert (=> b!1316686 (= e!751185 tp_is_empty!35749)))

(declare-fun b!1316687 () Bool)

(assert (=> b!1316687 (= e!751186 (and e!751187 mapRes!55259))))

(declare-fun condMapEmpty!55259 () Bool)

(declare-fun mapDefault!55259 () ValueCell!16976)

(assert (=> b!1316687 (= condMapEmpty!55259 (= (arr!42663 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16976)) mapDefault!55259)))))

(declare-fun b!1316688 () Bool)

(declare-fun res!873999 () Bool)

(assert (=> b!1316688 (=> (not res!873999) (not e!751184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88367 (_ BitVec 32)) Bool)

(assert (=> b!1316688 (= res!873999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55259 () Bool)

(assert (=> mapIsEmpty!55259 mapRes!55259))

(assert (= (and start!111234 res!873998) b!1316684))

(assert (= (and b!1316684 res!874000) b!1316688))

(assert (= (and b!1316688 res!873999) b!1316683))

(assert (= (and b!1316687 condMapEmpty!55259) mapIsEmpty!55259))

(assert (= (and b!1316687 (not condMapEmpty!55259)) mapNonEmpty!55259))

(get-info :version)

(assert (= (and mapNonEmpty!55259 ((_ is ValueCellFull!16976) mapValue!55259)) b!1316686))

(assert (= (and b!1316687 ((_ is ValueCellFull!16976) mapDefault!55259)) b!1316685))

(assert (= start!111234 b!1316687))

(declare-fun m!1204345 () Bool)

(assert (=> start!111234 m!1204345))

(declare-fun m!1204347 () Bool)

(assert (=> start!111234 m!1204347))

(declare-fun m!1204349 () Bool)

(assert (=> start!111234 m!1204349))

(declare-fun m!1204351 () Bool)

(assert (=> mapNonEmpty!55259 m!1204351))

(declare-fun m!1204353 () Bool)

(assert (=> b!1316688 m!1204353))

(check-sat (not start!111234) (not b!1316688) (not mapNonEmpty!55259) tp_is_empty!35749)
(check-sat)
(get-model)

(declare-fun d!142563 () Bool)

(assert (=> d!142563 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111234 d!142563))

(declare-fun d!142565 () Bool)

(assert (=> d!142565 (= (array_inv!32401 _values!1337) (bvsge (size!43215 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111234 d!142565))

(declare-fun d!142567 () Bool)

(assert (=> d!142567 (= (array_inv!32402 _keys!1609) (bvsge (size!43214 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111234 d!142567))

(declare-fun bm!64653 () Bool)

(declare-fun call!64656 () Bool)

(assert (=> bm!64653 (= call!64656 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1316734 () Bool)

(declare-fun e!751226 () Bool)

(declare-fun e!751225 () Bool)

(assert (=> b!1316734 (= e!751226 e!751225)))

(declare-fun c!125613 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1316734 (= c!125613 (validKeyInArray!0 (select (arr!42662 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun d!142569 () Bool)

(declare-fun res!874024 () Bool)

(assert (=> d!142569 (=> res!874024 e!751226)))

(assert (=> d!142569 (= res!874024 (bvsge #b00000000000000000000000000000000 (size!43214 _keys!1609)))))

(assert (=> d!142569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!751226)))

(declare-fun b!1316733 () Bool)

(declare-fun e!751224 () Bool)

(assert (=> b!1316733 (= e!751224 call!64656)))

(declare-fun b!1316735 () Bool)

(assert (=> b!1316735 (= e!751225 call!64656)))

(declare-fun b!1316736 () Bool)

(assert (=> b!1316736 (= e!751225 e!751224)))

(declare-fun lt!586092 () (_ BitVec 64))

(assert (=> b!1316736 (= lt!586092 (select (arr!42662 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43243 0))(
  ( (Unit!43244) )
))
(declare-fun lt!586093 () Unit!43243)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88367 (_ BitVec 64) (_ BitVec 32)) Unit!43243)

(assert (=> b!1316736 (= lt!586093 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!586092 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1316736 (arrayContainsKey!0 _keys!1609 lt!586092 #b00000000000000000000000000000000)))

(declare-fun lt!586094 () Unit!43243)

(assert (=> b!1316736 (= lt!586094 lt!586093)))

(declare-fun res!874023 () Bool)

(declare-datatypes ((SeekEntryResult!10035 0))(
  ( (MissingZero!10035 (index!42511 (_ BitVec 32))) (Found!10035 (index!42512 (_ BitVec 32))) (Intermediate!10035 (undefined!10847 Bool) (index!42513 (_ BitVec 32)) (x!117055 (_ BitVec 32))) (Undefined!10035) (MissingVacant!10035 (index!42514 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88367 (_ BitVec 32)) SeekEntryResult!10035)

(assert (=> b!1316736 (= res!874023 (= (seekEntryOrOpen!0 (select (arr!42662 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10035 #b00000000000000000000000000000000)))))

(assert (=> b!1316736 (=> (not res!874023) (not e!751224))))

(assert (= (and d!142569 (not res!874024)) b!1316734))

(assert (= (and b!1316734 c!125613) b!1316736))

(assert (= (and b!1316734 (not c!125613)) b!1316735))

(assert (= (and b!1316736 res!874023) b!1316733))

(assert (= (or b!1316733 b!1316735) bm!64653))

(declare-fun m!1204375 () Bool)

(assert (=> bm!64653 m!1204375))

(declare-fun m!1204377 () Bool)

(assert (=> b!1316734 m!1204377))

(assert (=> b!1316734 m!1204377))

(declare-fun m!1204379 () Bool)

(assert (=> b!1316734 m!1204379))

(assert (=> b!1316736 m!1204377))

(declare-fun m!1204381 () Bool)

(assert (=> b!1316736 m!1204381))

(declare-fun m!1204383 () Bool)

(assert (=> b!1316736 m!1204383))

(assert (=> b!1316736 m!1204377))

(declare-fun m!1204385 () Bool)

(assert (=> b!1316736 m!1204385))

(assert (=> b!1316688 d!142569))

(declare-fun condMapEmpty!55268 () Bool)

(declare-fun mapDefault!55268 () ValueCell!16976)

(assert (=> mapNonEmpty!55259 (= condMapEmpty!55268 (= mapRest!55259 ((as const (Array (_ BitVec 32) ValueCell!16976)) mapDefault!55268)))))

(declare-fun e!751232 () Bool)

(declare-fun mapRes!55268 () Bool)

(assert (=> mapNonEmpty!55259 (= tp!105366 (and e!751232 mapRes!55268))))

(declare-fun mapIsEmpty!55268 () Bool)

(assert (=> mapIsEmpty!55268 mapRes!55268))

(declare-fun b!1316743 () Bool)

(declare-fun e!751231 () Bool)

(assert (=> b!1316743 (= e!751231 tp_is_empty!35749)))

(declare-fun b!1316744 () Bool)

(assert (=> b!1316744 (= e!751232 tp_is_empty!35749)))

(declare-fun mapNonEmpty!55268 () Bool)

(declare-fun tp!105375 () Bool)

(assert (=> mapNonEmpty!55268 (= mapRes!55268 (and tp!105375 e!751231))))

(declare-fun mapKey!55268 () (_ BitVec 32))

(declare-fun mapRest!55268 () (Array (_ BitVec 32) ValueCell!16976))

(declare-fun mapValue!55268 () ValueCell!16976)

(assert (=> mapNonEmpty!55268 (= mapRest!55259 (store mapRest!55268 mapKey!55268 mapValue!55268))))

(assert (= (and mapNonEmpty!55259 condMapEmpty!55268) mapIsEmpty!55268))

(assert (= (and mapNonEmpty!55259 (not condMapEmpty!55268)) mapNonEmpty!55268))

(assert (= (and mapNonEmpty!55268 ((_ is ValueCellFull!16976) mapValue!55268)) b!1316743))

(assert (= (and mapNonEmpty!55259 ((_ is ValueCellFull!16976) mapDefault!55268)) b!1316744))

(declare-fun m!1204387 () Bool)

(assert (=> mapNonEmpty!55268 m!1204387))

(check-sat (not bm!64653) tp_is_empty!35749 (not b!1316736) (not b!1316734) (not mapNonEmpty!55268))
(check-sat)
