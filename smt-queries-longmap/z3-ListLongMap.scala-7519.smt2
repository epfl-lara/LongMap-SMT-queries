; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95582 () Bool)

(assert start!95582)

(declare-fun b!1078453 () Bool)

(declare-fun e!616679 () Bool)

(declare-datatypes ((array!69165 0))(
  ( (array!69166 (arr!33257 (Array (_ BitVec 32) (_ BitVec 64))) (size!33794 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69165)

(assert (=> b!1078453 (= e!616679 (and (bvsle #b00000000000000000000000000000000 (size!33794 _keys!1070)) (bvsge (size!33794 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!40867 () Bool)

(declare-fun mapRes!40867 () Bool)

(assert (=> mapIsEmpty!40867 mapRes!40867))

(declare-fun b!1078454 () Bool)

(declare-fun e!616682 () Bool)

(declare-fun tp_is_empty!26089 () Bool)

(assert (=> b!1078454 (= e!616682 tp_is_empty!26089)))

(declare-fun b!1078455 () Bool)

(declare-fun e!616683 () Bool)

(assert (=> b!1078455 (= e!616683 tp_is_empty!26089)))

(declare-fun b!1078456 () Bool)

(declare-fun res!718271 () Bool)

(assert (=> b!1078456 (=> (not res!718271) (not e!616679))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!39913 0))(
  ( (V!39914 (val!13101 Int)) )
))
(declare-datatypes ((ValueCell!12335 0))(
  ( (ValueCellFull!12335 (v!15716 V!39913)) (EmptyCell!12335) )
))
(declare-datatypes ((array!69167 0))(
  ( (array!69168 (arr!33258 (Array (_ BitVec 32) ValueCell!12335)) (size!33795 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69167)

(assert (=> b!1078456 (= res!718271 (and (= (size!33795 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33794 _keys!1070) (size!33795 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078457 () Bool)

(declare-fun res!718270 () Bool)

(assert (=> b!1078457 (=> (not res!718270) (not e!616679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69165 (_ BitVec 32)) Bool)

(assert (=> b!1078457 (= res!718270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!718272 () Bool)

(assert (=> start!95582 (=> (not res!718272) (not e!616679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95582 (= res!718272 (validMask!0 mask!1414))))

(assert (=> start!95582 e!616679))

(assert (=> start!95582 true))

(declare-fun e!616680 () Bool)

(declare-fun array_inv!25736 (array!69167) Bool)

(assert (=> start!95582 (and (array_inv!25736 _values!874) e!616680)))

(declare-fun array_inv!25737 (array!69165) Bool)

(assert (=> start!95582 (array_inv!25737 _keys!1070)))

(declare-fun b!1078458 () Bool)

(assert (=> b!1078458 (= e!616680 (and e!616682 mapRes!40867))))

(declare-fun condMapEmpty!40867 () Bool)

(declare-fun mapDefault!40867 () ValueCell!12335)

(assert (=> b!1078458 (= condMapEmpty!40867 (= (arr!33258 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12335)) mapDefault!40867)))))

(declare-fun mapNonEmpty!40867 () Bool)

(declare-fun tp!78329 () Bool)

(assert (=> mapNonEmpty!40867 (= mapRes!40867 (and tp!78329 e!616683))))

(declare-fun mapKey!40867 () (_ BitVec 32))

(declare-fun mapValue!40867 () ValueCell!12335)

(declare-fun mapRest!40867 () (Array (_ BitVec 32) ValueCell!12335))

(assert (=> mapNonEmpty!40867 (= (arr!33258 _values!874) (store mapRest!40867 mapKey!40867 mapValue!40867))))

(assert (= (and start!95582 res!718272) b!1078456))

(assert (= (and b!1078456 res!718271) b!1078457))

(assert (= (and b!1078457 res!718270) b!1078453))

(assert (= (and b!1078458 condMapEmpty!40867) mapIsEmpty!40867))

(assert (= (and b!1078458 (not condMapEmpty!40867)) mapNonEmpty!40867))

(get-info :version)

(assert (= (and mapNonEmpty!40867 ((_ is ValueCellFull!12335) mapValue!40867)) b!1078455))

(assert (= (and b!1078458 ((_ is ValueCellFull!12335) mapDefault!40867)) b!1078454))

(assert (= start!95582 b!1078458))

(declare-fun m!997773 () Bool)

(assert (=> b!1078457 m!997773))

(declare-fun m!997775 () Bool)

(assert (=> start!95582 m!997775))

(declare-fun m!997777 () Bool)

(assert (=> start!95582 m!997777))

(declare-fun m!997779 () Bool)

(assert (=> start!95582 m!997779))

(declare-fun m!997781 () Bool)

(assert (=> mapNonEmpty!40867 m!997781))

(check-sat (not start!95582) (not b!1078457) (not mapNonEmpty!40867) tp_is_empty!26089)
(check-sat)
(get-model)

(declare-fun d!130279 () Bool)

(assert (=> d!130279 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95582 d!130279))

(declare-fun d!130281 () Bool)

(assert (=> d!130281 (= (array_inv!25736 _values!874) (bvsge (size!33795 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95582 d!130281))

(declare-fun d!130283 () Bool)

(assert (=> d!130283 (= (array_inv!25737 _keys!1070) (bvsge (size!33794 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95582 d!130283))

(declare-fun d!130285 () Bool)

(declare-fun res!718296 () Bool)

(declare-fun e!616722 () Bool)

(assert (=> d!130285 (=> res!718296 e!616722)))

(assert (=> d!130285 (= res!718296 (bvsge #b00000000000000000000000000000000 (size!33794 _keys!1070)))))

(assert (=> d!130285 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616722)))

(declare-fun b!1078503 () Bool)

(declare-fun e!616721 () Bool)

(declare-fun call!45780 () Bool)

(assert (=> b!1078503 (= e!616721 call!45780)))

(declare-fun bm!45777 () Bool)

(assert (=> bm!45777 (= call!45780 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1078504 () Bool)

(declare-fun e!616720 () Bool)

(assert (=> b!1078504 (= e!616720 e!616721)))

(declare-fun lt!479030 () (_ BitVec 64))

(assert (=> b!1078504 (= lt!479030 (select (arr!33257 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35427 0))(
  ( (Unit!35428) )
))
(declare-fun lt!479032 () Unit!35427)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69165 (_ BitVec 64) (_ BitVec 32)) Unit!35427)

(assert (=> b!1078504 (= lt!479032 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!479030 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078504 (arrayContainsKey!0 _keys!1070 lt!479030 #b00000000000000000000000000000000)))

(declare-fun lt!479031 () Unit!35427)

(assert (=> b!1078504 (= lt!479031 lt!479032)))

(declare-fun res!718295 () Bool)

(declare-datatypes ((SeekEntryResult!9853 0))(
  ( (MissingZero!9853 (index!41783 (_ BitVec 32))) (Found!9853 (index!41784 (_ BitVec 32))) (Intermediate!9853 (undefined!10665 Bool) (index!41785 (_ BitVec 32)) (x!96528 (_ BitVec 32))) (Undefined!9853) (MissingVacant!9853 (index!41786 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69165 (_ BitVec 32)) SeekEntryResult!9853)

(assert (=> b!1078504 (= res!718295 (= (seekEntryOrOpen!0 (select (arr!33257 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9853 #b00000000000000000000000000000000)))))

(assert (=> b!1078504 (=> (not res!718295) (not e!616721))))

(declare-fun b!1078505 () Bool)

(assert (=> b!1078505 (= e!616720 call!45780)))

(declare-fun b!1078506 () Bool)

(assert (=> b!1078506 (= e!616722 e!616720)))

(declare-fun c!108717 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078506 (= c!108717 (validKeyInArray!0 (select (arr!33257 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130285 (not res!718296)) b!1078506))

(assert (= (and b!1078506 c!108717) b!1078504))

(assert (= (and b!1078506 (not c!108717)) b!1078505))

(assert (= (and b!1078504 res!718295) b!1078503))

(assert (= (or b!1078503 b!1078505) bm!45777))

(declare-fun m!997803 () Bool)

(assert (=> bm!45777 m!997803))

(declare-fun m!997805 () Bool)

(assert (=> b!1078504 m!997805))

(declare-fun m!997807 () Bool)

(assert (=> b!1078504 m!997807))

(declare-fun m!997809 () Bool)

(assert (=> b!1078504 m!997809))

(assert (=> b!1078504 m!997805))

(declare-fun m!997811 () Bool)

(assert (=> b!1078504 m!997811))

(assert (=> b!1078506 m!997805))

(assert (=> b!1078506 m!997805))

(declare-fun m!997813 () Bool)

(assert (=> b!1078506 m!997813))

(assert (=> b!1078457 d!130285))

(declare-fun condMapEmpty!40876 () Bool)

(declare-fun mapDefault!40876 () ValueCell!12335)

(assert (=> mapNonEmpty!40867 (= condMapEmpty!40876 (= mapRest!40867 ((as const (Array (_ BitVec 32) ValueCell!12335)) mapDefault!40876)))))

(declare-fun e!616727 () Bool)

(declare-fun mapRes!40876 () Bool)

(assert (=> mapNonEmpty!40867 (= tp!78329 (and e!616727 mapRes!40876))))

(declare-fun b!1078513 () Bool)

(declare-fun e!616728 () Bool)

(assert (=> b!1078513 (= e!616728 tp_is_empty!26089)))

(declare-fun b!1078514 () Bool)

(assert (=> b!1078514 (= e!616727 tp_is_empty!26089)))

(declare-fun mapNonEmpty!40876 () Bool)

(declare-fun tp!78338 () Bool)

(assert (=> mapNonEmpty!40876 (= mapRes!40876 (and tp!78338 e!616728))))

(declare-fun mapValue!40876 () ValueCell!12335)

(declare-fun mapKey!40876 () (_ BitVec 32))

(declare-fun mapRest!40876 () (Array (_ BitVec 32) ValueCell!12335))

(assert (=> mapNonEmpty!40876 (= mapRest!40867 (store mapRest!40876 mapKey!40876 mapValue!40876))))

(declare-fun mapIsEmpty!40876 () Bool)

(assert (=> mapIsEmpty!40876 mapRes!40876))

(assert (= (and mapNonEmpty!40867 condMapEmpty!40876) mapIsEmpty!40876))

(assert (= (and mapNonEmpty!40867 (not condMapEmpty!40876)) mapNonEmpty!40876))

(assert (= (and mapNonEmpty!40876 ((_ is ValueCellFull!12335) mapValue!40876)) b!1078513))

(assert (= (and mapNonEmpty!40867 ((_ is ValueCellFull!12335) mapDefault!40876)) b!1078514))

(declare-fun m!997815 () Bool)

(assert (=> mapNonEmpty!40876 m!997815))

(check-sat (not mapNonEmpty!40876) tp_is_empty!26089 (not b!1078504) (not b!1078506) (not bm!45777))
(check-sat)
