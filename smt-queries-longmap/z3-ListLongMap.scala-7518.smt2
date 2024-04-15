; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95326 () Bool)

(assert start!95326)

(declare-fun b!1076899 () Bool)

(declare-fun res!717646 () Bool)

(declare-fun e!615673 () Bool)

(assert (=> b!1076899 (=> (not res!717646) (not e!615673))))

(declare-datatypes ((array!69046 0))(
  ( (array!69047 (arr!33205 (Array (_ BitVec 32) (_ BitVec 64))) (size!33743 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69046)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69046 (_ BitVec 32)) Bool)

(assert (=> b!1076899 (= res!717646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1076900 () Bool)

(declare-fun res!717648 () Bool)

(assert (=> b!1076900 (=> (not res!717648) (not e!615673))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!39905 0))(
  ( (V!39906 (val!13098 Int)) )
))
(declare-datatypes ((ValueCell!12332 0))(
  ( (ValueCellFull!12332 (v!15716 V!39905)) (EmptyCell!12332) )
))
(declare-datatypes ((array!69048 0))(
  ( (array!69049 (arr!33206 (Array (_ BitVec 32) ValueCell!12332)) (size!33744 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69048)

(assert (=> b!1076900 (= res!717648 (and (= (size!33744 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33743 _keys!1070) (size!33744 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!40855 () Bool)

(declare-fun mapRes!40855 () Bool)

(declare-fun tp!78317 () Bool)

(declare-fun e!615675 () Bool)

(assert (=> mapNonEmpty!40855 (= mapRes!40855 (and tp!78317 e!615675))))

(declare-fun mapValue!40855 () ValueCell!12332)

(declare-fun mapKey!40855 () (_ BitVec 32))

(declare-fun mapRest!40855 () (Array (_ BitVec 32) ValueCell!12332))

(assert (=> mapNonEmpty!40855 (= (arr!33206 _values!874) (store mapRest!40855 mapKey!40855 mapValue!40855))))

(declare-fun b!1076901 () Bool)

(declare-fun e!615674 () Bool)

(declare-fun e!615672 () Bool)

(assert (=> b!1076901 (= e!615674 (and e!615672 mapRes!40855))))

(declare-fun condMapEmpty!40855 () Bool)

(declare-fun mapDefault!40855 () ValueCell!12332)

(assert (=> b!1076901 (= condMapEmpty!40855 (= (arr!33206 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12332)) mapDefault!40855)))))

(declare-fun res!717647 () Bool)

(assert (=> start!95326 (=> (not res!717647) (not e!615673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95326 (= res!717647 (validMask!0 mask!1414))))

(assert (=> start!95326 e!615673))

(assert (=> start!95326 true))

(declare-fun array_inv!25684 (array!69048) Bool)

(assert (=> start!95326 (and (array_inv!25684 _values!874) e!615674)))

(declare-fun array_inv!25685 (array!69046) Bool)

(assert (=> start!95326 (array_inv!25685 _keys!1070)))

(declare-fun mapIsEmpty!40855 () Bool)

(assert (=> mapIsEmpty!40855 mapRes!40855))

(declare-fun b!1076902 () Bool)

(declare-fun tp_is_empty!26083 () Bool)

(assert (=> b!1076902 (= e!615672 tp_is_empty!26083)))

(declare-fun b!1076903 () Bool)

(assert (=> b!1076903 (= e!615675 tp_is_empty!26083)))

(declare-fun b!1076904 () Bool)

(assert (=> b!1076904 (= e!615673 (bvsgt #b00000000000000000000000000000000 (size!33743 _keys!1070)))))

(assert (= (and start!95326 res!717647) b!1076900))

(assert (= (and b!1076900 res!717648) b!1076899))

(assert (= (and b!1076899 res!717646) b!1076904))

(assert (= (and b!1076901 condMapEmpty!40855) mapIsEmpty!40855))

(assert (= (and b!1076901 (not condMapEmpty!40855)) mapNonEmpty!40855))

(get-info :version)

(assert (= (and mapNonEmpty!40855 ((_ is ValueCellFull!12332) mapValue!40855)) b!1076903))

(assert (= (and b!1076901 ((_ is ValueCellFull!12332) mapDefault!40855)) b!1076902))

(assert (= start!95326 b!1076901))

(declare-fun m!995431 () Bool)

(assert (=> b!1076899 m!995431))

(declare-fun m!995433 () Bool)

(assert (=> mapNonEmpty!40855 m!995433))

(declare-fun m!995435 () Bool)

(assert (=> start!95326 m!995435))

(declare-fun m!995437 () Bool)

(assert (=> start!95326 m!995437))

(declare-fun m!995439 () Bool)

(assert (=> start!95326 m!995439))

(check-sat (not start!95326) (not b!1076899) (not mapNonEmpty!40855) tp_is_empty!26083)
(check-sat)
(get-model)

(declare-fun d!129649 () Bool)

(assert (=> d!129649 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95326 d!129649))

(declare-fun d!129651 () Bool)

(assert (=> d!129651 (= (array_inv!25684 _values!874) (bvsge (size!33744 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95326 d!129651))

(declare-fun d!129653 () Bool)

(assert (=> d!129653 (= (array_inv!25685 _keys!1070) (bvsge (size!33743 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95326 d!129653))

(declare-fun b!1076949 () Bool)

(declare-fun e!615712 () Bool)

(declare-fun call!45687 () Bool)

(assert (=> b!1076949 (= e!615712 call!45687)))

(declare-fun b!1076950 () Bool)

(declare-fun e!615714 () Bool)

(assert (=> b!1076950 (= e!615712 e!615714)))

(declare-fun lt!478306 () (_ BitVec 64))

(assert (=> b!1076950 (= lt!478306 (select (arr!33205 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35295 0))(
  ( (Unit!35296) )
))
(declare-fun lt!478308 () Unit!35295)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69046 (_ BitVec 64) (_ BitVec 32)) Unit!35295)

(assert (=> b!1076950 (= lt!478308 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478306 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1076950 (arrayContainsKey!0 _keys!1070 lt!478306 #b00000000000000000000000000000000)))

(declare-fun lt!478307 () Unit!35295)

(assert (=> b!1076950 (= lt!478307 lt!478308)))

(declare-fun res!717671 () Bool)

(declare-datatypes ((SeekEntryResult!9895 0))(
  ( (MissingZero!9895 (index!41951 (_ BitVec 32))) (Found!9895 (index!41952 (_ BitVec 32))) (Intermediate!9895 (undefined!10707 Bool) (index!41953 (_ BitVec 32)) (x!96535 (_ BitVec 32))) (Undefined!9895) (MissingVacant!9895 (index!41954 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69046 (_ BitVec 32)) SeekEntryResult!9895)

(assert (=> b!1076950 (= res!717671 (= (seekEntryOrOpen!0 (select (arr!33205 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9895 #b00000000000000000000000000000000)))))

(assert (=> b!1076950 (=> (not res!717671) (not e!615714))))

(declare-fun bm!45684 () Bool)

(assert (=> bm!45684 (= call!45687 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun d!129655 () Bool)

(declare-fun res!717672 () Bool)

(declare-fun e!615713 () Bool)

(assert (=> d!129655 (=> res!717672 e!615713)))

(assert (=> d!129655 (= res!717672 (bvsge #b00000000000000000000000000000000 (size!33743 _keys!1070)))))

(assert (=> d!129655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!615713)))

(declare-fun b!1076951 () Bool)

(assert (=> b!1076951 (= e!615713 e!615712)))

(declare-fun c!108265 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1076951 (= c!108265 (validKeyInArray!0 (select (arr!33205 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1076952 () Bool)

(assert (=> b!1076952 (= e!615714 call!45687)))

(assert (= (and d!129655 (not res!717672)) b!1076951))

(assert (= (and b!1076951 c!108265) b!1076950))

(assert (= (and b!1076951 (not c!108265)) b!1076949))

(assert (= (and b!1076950 res!717671) b!1076952))

(assert (= (or b!1076952 b!1076949) bm!45684))

(declare-fun m!995461 () Bool)

(assert (=> b!1076950 m!995461))

(declare-fun m!995463 () Bool)

(assert (=> b!1076950 m!995463))

(declare-fun m!995465 () Bool)

(assert (=> b!1076950 m!995465))

(assert (=> b!1076950 m!995461))

(declare-fun m!995467 () Bool)

(assert (=> b!1076950 m!995467))

(declare-fun m!995469 () Bool)

(assert (=> bm!45684 m!995469))

(assert (=> b!1076951 m!995461))

(assert (=> b!1076951 m!995461))

(declare-fun m!995471 () Bool)

(assert (=> b!1076951 m!995471))

(assert (=> b!1076899 d!129655))

(declare-fun b!1076959 () Bool)

(declare-fun e!615720 () Bool)

(assert (=> b!1076959 (= e!615720 tp_is_empty!26083)))

(declare-fun mapIsEmpty!40864 () Bool)

(declare-fun mapRes!40864 () Bool)

(assert (=> mapIsEmpty!40864 mapRes!40864))

(declare-fun b!1076960 () Bool)

(declare-fun e!615719 () Bool)

(assert (=> b!1076960 (= e!615719 tp_is_empty!26083)))

(declare-fun mapNonEmpty!40864 () Bool)

(declare-fun tp!78326 () Bool)

(assert (=> mapNonEmpty!40864 (= mapRes!40864 (and tp!78326 e!615720))))

(declare-fun mapValue!40864 () ValueCell!12332)

(declare-fun mapKey!40864 () (_ BitVec 32))

(declare-fun mapRest!40864 () (Array (_ BitVec 32) ValueCell!12332))

(assert (=> mapNonEmpty!40864 (= mapRest!40855 (store mapRest!40864 mapKey!40864 mapValue!40864))))

(declare-fun condMapEmpty!40864 () Bool)

(declare-fun mapDefault!40864 () ValueCell!12332)

(assert (=> mapNonEmpty!40855 (= condMapEmpty!40864 (= mapRest!40855 ((as const (Array (_ BitVec 32) ValueCell!12332)) mapDefault!40864)))))

(assert (=> mapNonEmpty!40855 (= tp!78317 (and e!615719 mapRes!40864))))

(assert (= (and mapNonEmpty!40855 condMapEmpty!40864) mapIsEmpty!40864))

(assert (= (and mapNonEmpty!40855 (not condMapEmpty!40864)) mapNonEmpty!40864))

(assert (= (and mapNonEmpty!40864 ((_ is ValueCellFull!12332) mapValue!40864)) b!1076959))

(assert (= (and mapNonEmpty!40855 ((_ is ValueCellFull!12332) mapDefault!40864)) b!1076960))

(declare-fun m!995473 () Bool)

(assert (=> mapNonEmpty!40864 m!995473))

(check-sat (not bm!45684) (not b!1076951) tp_is_empty!26083 (not mapNonEmpty!40864) (not b!1076950))
(check-sat)
