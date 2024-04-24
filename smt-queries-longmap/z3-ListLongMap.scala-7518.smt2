; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95568 () Bool)

(assert start!95568)

(declare-fun b!1078379 () Bool)

(declare-fun e!616619 () Bool)

(declare-fun e!616620 () Bool)

(declare-fun mapRes!40855 () Bool)

(assert (=> b!1078379 (= e!616619 (and e!616620 mapRes!40855))))

(declare-fun condMapEmpty!40855 () Bool)

(declare-datatypes ((V!39905 0))(
  ( (V!39906 (val!13098 Int)) )
))
(declare-datatypes ((ValueCell!12332 0))(
  ( (ValueCellFull!12332 (v!15713 V!39905)) (EmptyCell!12332) )
))
(declare-datatypes ((array!69153 0))(
  ( (array!69154 (arr!33252 (Array (_ BitVec 32) ValueCell!12332)) (size!33789 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69153)

(declare-fun mapDefault!40855 () ValueCell!12332)

(assert (=> b!1078379 (= condMapEmpty!40855 (= (arr!33252 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12332)) mapDefault!40855)))))

(declare-fun mapNonEmpty!40855 () Bool)

(declare-fun tp!78317 () Bool)

(declare-fun e!616621 () Bool)

(assert (=> mapNonEmpty!40855 (= mapRes!40855 (and tp!78317 e!616621))))

(declare-fun mapValue!40855 () ValueCell!12332)

(declare-fun mapRest!40855 () (Array (_ BitVec 32) ValueCell!12332))

(declare-fun mapKey!40855 () (_ BitVec 32))

(assert (=> mapNonEmpty!40855 (= (arr!33252 _values!874) (store mapRest!40855 mapKey!40855 mapValue!40855))))

(declare-fun res!718238 () Bool)

(declare-fun e!616623 () Bool)

(assert (=> start!95568 (=> (not res!718238) (not e!616623))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95568 (= res!718238 (validMask!0 mask!1414))))

(assert (=> start!95568 e!616623))

(assert (=> start!95568 true))

(declare-fun array_inv!25734 (array!69153) Bool)

(assert (=> start!95568 (and (array_inv!25734 _values!874) e!616619)))

(declare-datatypes ((array!69155 0))(
  ( (array!69156 (arr!33253 (Array (_ BitVec 32) (_ BitVec 64))) (size!33790 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69155)

(declare-fun array_inv!25735 (array!69155) Bool)

(assert (=> start!95568 (array_inv!25735 _keys!1070)))

(declare-fun b!1078380 () Bool)

(assert (=> b!1078380 (= e!616623 (bvsgt #b00000000000000000000000000000000 (size!33790 _keys!1070)))))

(declare-fun b!1078381 () Bool)

(declare-fun res!718239 () Bool)

(assert (=> b!1078381 (=> (not res!718239) (not e!616623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69155 (_ BitVec 32)) Bool)

(assert (=> b!1078381 (= res!718239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078382 () Bool)

(declare-fun res!718237 () Bool)

(assert (=> b!1078382 (=> (not res!718237) (not e!616623))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078382 (= res!718237 (and (= (size!33789 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33790 _keys!1070) (size!33789 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078383 () Bool)

(declare-fun tp_is_empty!26083 () Bool)

(assert (=> b!1078383 (= e!616621 tp_is_empty!26083)))

(declare-fun b!1078384 () Bool)

(assert (=> b!1078384 (= e!616620 tp_is_empty!26083)))

(declare-fun mapIsEmpty!40855 () Bool)

(assert (=> mapIsEmpty!40855 mapRes!40855))

(assert (= (and start!95568 res!718238) b!1078382))

(assert (= (and b!1078382 res!718237) b!1078381))

(assert (= (and b!1078381 res!718239) b!1078380))

(assert (= (and b!1078379 condMapEmpty!40855) mapIsEmpty!40855))

(assert (= (and b!1078379 (not condMapEmpty!40855)) mapNonEmpty!40855))

(get-info :version)

(assert (= (and mapNonEmpty!40855 ((_ is ValueCellFull!12332) mapValue!40855)) b!1078383))

(assert (= (and b!1078379 ((_ is ValueCellFull!12332) mapDefault!40855)) b!1078384))

(assert (= start!95568 b!1078379))

(declare-fun m!997729 () Bool)

(assert (=> mapNonEmpty!40855 m!997729))

(declare-fun m!997731 () Bool)

(assert (=> start!95568 m!997731))

(declare-fun m!997733 () Bool)

(assert (=> start!95568 m!997733))

(declare-fun m!997735 () Bool)

(assert (=> start!95568 m!997735))

(declare-fun m!997737 () Bool)

(assert (=> b!1078381 m!997737))

(check-sat (not b!1078381) (not start!95568) (not mapNonEmpty!40855) tp_is_empty!26083)
(check-sat)
(get-model)

(declare-fun b!1078429 () Bool)

(declare-fun e!616661 () Bool)

(declare-fun e!616662 () Bool)

(assert (=> b!1078429 (= e!616661 e!616662)))

(declare-fun c!108714 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078429 (= c!108714 (validKeyInArray!0 (select (arr!33253 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130269 () Bool)

(declare-fun res!718262 () Bool)

(assert (=> d!130269 (=> res!718262 e!616661)))

(assert (=> d!130269 (= res!718262 (bvsge #b00000000000000000000000000000000 (size!33790 _keys!1070)))))

(assert (=> d!130269 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616661)))

(declare-fun b!1078430 () Bool)

(declare-fun call!45777 () Bool)

(assert (=> b!1078430 (= e!616662 call!45777)))

(declare-fun b!1078431 () Bool)

(declare-fun e!616660 () Bool)

(assert (=> b!1078431 (= e!616662 e!616660)))

(declare-fun lt!479022 () (_ BitVec 64))

(assert (=> b!1078431 (= lt!479022 (select (arr!33253 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35425 0))(
  ( (Unit!35426) )
))
(declare-fun lt!479021 () Unit!35425)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69155 (_ BitVec 64) (_ BitVec 32)) Unit!35425)

(assert (=> b!1078431 (= lt!479021 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!479022 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078431 (arrayContainsKey!0 _keys!1070 lt!479022 #b00000000000000000000000000000000)))

(declare-fun lt!479023 () Unit!35425)

(assert (=> b!1078431 (= lt!479023 lt!479021)))

(declare-fun res!718263 () Bool)

(declare-datatypes ((SeekEntryResult!9852 0))(
  ( (MissingZero!9852 (index!41779 (_ BitVec 32))) (Found!9852 (index!41780 (_ BitVec 32))) (Intermediate!9852 (undefined!10664 Bool) (index!41781 (_ BitVec 32)) (x!96517 (_ BitVec 32))) (Undefined!9852) (MissingVacant!9852 (index!41782 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69155 (_ BitVec 32)) SeekEntryResult!9852)

(assert (=> b!1078431 (= res!718263 (= (seekEntryOrOpen!0 (select (arr!33253 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9852 #b00000000000000000000000000000000)))))

(assert (=> b!1078431 (=> (not res!718263) (not e!616660))))

(declare-fun b!1078432 () Bool)

(assert (=> b!1078432 (= e!616660 call!45777)))

(declare-fun bm!45774 () Bool)

(assert (=> bm!45774 (= call!45777 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(assert (= (and d!130269 (not res!718262)) b!1078429))

(assert (= (and b!1078429 c!108714) b!1078431))

(assert (= (and b!1078429 (not c!108714)) b!1078430))

(assert (= (and b!1078431 res!718263) b!1078432))

(assert (= (or b!1078432 b!1078430) bm!45774))

(declare-fun m!997759 () Bool)

(assert (=> b!1078429 m!997759))

(assert (=> b!1078429 m!997759))

(declare-fun m!997761 () Bool)

(assert (=> b!1078429 m!997761))

(assert (=> b!1078431 m!997759))

(declare-fun m!997763 () Bool)

(assert (=> b!1078431 m!997763))

(declare-fun m!997765 () Bool)

(assert (=> b!1078431 m!997765))

(assert (=> b!1078431 m!997759))

(declare-fun m!997767 () Bool)

(assert (=> b!1078431 m!997767))

(declare-fun m!997769 () Bool)

(assert (=> bm!45774 m!997769))

(assert (=> b!1078381 d!130269))

(declare-fun d!130271 () Bool)

(assert (=> d!130271 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95568 d!130271))

(declare-fun d!130273 () Bool)

(assert (=> d!130273 (= (array_inv!25734 _values!874) (bvsge (size!33789 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95568 d!130273))

(declare-fun d!130275 () Bool)

(assert (=> d!130275 (= (array_inv!25735 _keys!1070) (bvsge (size!33790 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95568 d!130275))

(declare-fun mapIsEmpty!40864 () Bool)

(declare-fun mapRes!40864 () Bool)

(assert (=> mapIsEmpty!40864 mapRes!40864))

(declare-fun b!1078439 () Bool)

(declare-fun e!616668 () Bool)

(assert (=> b!1078439 (= e!616668 tp_is_empty!26083)))

(declare-fun mapNonEmpty!40864 () Bool)

(declare-fun tp!78326 () Bool)

(assert (=> mapNonEmpty!40864 (= mapRes!40864 (and tp!78326 e!616668))))

(declare-fun mapRest!40864 () (Array (_ BitVec 32) ValueCell!12332))

(declare-fun mapValue!40864 () ValueCell!12332)

(declare-fun mapKey!40864 () (_ BitVec 32))

(assert (=> mapNonEmpty!40864 (= mapRest!40855 (store mapRest!40864 mapKey!40864 mapValue!40864))))

(declare-fun condMapEmpty!40864 () Bool)

(declare-fun mapDefault!40864 () ValueCell!12332)

(assert (=> mapNonEmpty!40855 (= condMapEmpty!40864 (= mapRest!40855 ((as const (Array (_ BitVec 32) ValueCell!12332)) mapDefault!40864)))))

(declare-fun e!616667 () Bool)

(assert (=> mapNonEmpty!40855 (= tp!78317 (and e!616667 mapRes!40864))))

(declare-fun b!1078440 () Bool)

(assert (=> b!1078440 (= e!616667 tp_is_empty!26083)))

(assert (= (and mapNonEmpty!40855 condMapEmpty!40864) mapIsEmpty!40864))

(assert (= (and mapNonEmpty!40855 (not condMapEmpty!40864)) mapNonEmpty!40864))

(assert (= (and mapNonEmpty!40864 ((_ is ValueCellFull!12332) mapValue!40864)) b!1078439))

(assert (= (and mapNonEmpty!40855 ((_ is ValueCellFull!12332) mapDefault!40864)) b!1078440))

(declare-fun m!997771 () Bool)

(assert (=> mapNonEmpty!40864 m!997771))

(check-sat tp_is_empty!26083 (not bm!45774) (not mapNonEmpty!40864) (not b!1078429) (not b!1078431))
(check-sat)
