; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95612 () Bool)

(assert start!95612)

(declare-fun mapIsEmpty!40891 () Bool)

(declare-fun mapRes!40891 () Bool)

(assert (=> mapIsEmpty!40891 mapRes!40891))

(declare-fun b!1078622 () Bool)

(declare-fun res!718358 () Bool)

(declare-fun e!616811 () Bool)

(assert (=> b!1078622 (=> (not res!718358) (not e!616811))))

(declare-datatypes ((List!23224 0))(
  ( (Nil!23221) (Cons!23220 (h!24438 (_ BitVec 64)) (t!32575 List!23224)) )
))
(declare-fun noDuplicate!1589 (List!23224) Bool)

(assert (=> b!1078622 (= res!718358 (noDuplicate!1589 Nil!23221))))

(declare-fun mapNonEmpty!40891 () Bool)

(declare-fun tp!78353 () Bool)

(declare-fun e!616812 () Bool)

(assert (=> mapNonEmpty!40891 (= mapRes!40891 (and tp!78353 e!616812))))

(declare-fun mapKey!40891 () (_ BitVec 32))

(declare-datatypes ((V!39929 0))(
  ( (V!39930 (val!13107 Int)) )
))
(declare-datatypes ((ValueCell!12341 0))(
  ( (ValueCellFull!12341 (v!15722 V!39929)) (EmptyCell!12341) )
))
(declare-datatypes ((array!69191 0))(
  ( (array!69192 (arr!33268 (Array (_ BitVec 32) ValueCell!12341)) (size!33805 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69191)

(declare-fun mapRest!40891 () (Array (_ BitVec 32) ValueCell!12341))

(declare-fun mapValue!40891 () ValueCell!12341)

(assert (=> mapNonEmpty!40891 (= (arr!33268 _values!874) (store mapRest!40891 mapKey!40891 mapValue!40891))))

(declare-fun b!1078623 () Bool)

(declare-fun res!718360 () Bool)

(assert (=> b!1078623 (=> (not res!718360) (not e!616811))))

(declare-datatypes ((array!69193 0))(
  ( (array!69194 (arr!33269 (Array (_ BitVec 32) (_ BitVec 64))) (size!33806 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69193)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69193 (_ BitVec 32)) Bool)

(assert (=> b!1078623 (= res!718360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078625 () Bool)

(declare-fun e!616808 () Bool)

(declare-fun contains!6392 (List!23224 (_ BitVec 64)) Bool)

(assert (=> b!1078625 (= e!616808 (contains!6392 Nil!23221 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1078626 () Bool)

(declare-fun res!718359 () Bool)

(assert (=> b!1078626 (=> (not res!718359) (not e!616811))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078626 (= res!718359 (and (= (size!33805 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33806 _keys!1070) (size!33805 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078627 () Bool)

(declare-fun tp_is_empty!26101 () Bool)

(assert (=> b!1078627 (= e!616812 tp_is_empty!26101)))

(declare-fun b!1078628 () Bool)

(assert (=> b!1078628 (= e!616811 e!616808)))

(declare-fun res!718357 () Bool)

(assert (=> b!1078628 (=> res!718357 e!616808)))

(assert (=> b!1078628 (= res!718357 (contains!6392 Nil!23221 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1078629 () Bool)

(declare-fun e!616807 () Bool)

(declare-fun e!616809 () Bool)

(assert (=> b!1078629 (= e!616807 (and e!616809 mapRes!40891))))

(declare-fun condMapEmpty!40891 () Bool)

(declare-fun mapDefault!40891 () ValueCell!12341)

(assert (=> b!1078629 (= condMapEmpty!40891 (= (arr!33268 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12341)) mapDefault!40891)))))

(declare-fun b!1078630 () Bool)

(declare-fun res!718361 () Bool)

(assert (=> b!1078630 (=> (not res!718361) (not e!616811))))

(assert (=> b!1078630 (= res!718361 (and (bvsle #b00000000000000000000000000000000 (size!33806 _keys!1070)) (bvslt (size!33806 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1078624 () Bool)

(assert (=> b!1078624 (= e!616809 tp_is_empty!26101)))

(declare-fun res!718362 () Bool)

(assert (=> start!95612 (=> (not res!718362) (not e!616811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95612 (= res!718362 (validMask!0 mask!1414))))

(assert (=> start!95612 e!616811))

(assert (=> start!95612 true))

(declare-fun array_inv!25744 (array!69191) Bool)

(assert (=> start!95612 (and (array_inv!25744 _values!874) e!616807)))

(declare-fun array_inv!25745 (array!69193) Bool)

(assert (=> start!95612 (array_inv!25745 _keys!1070)))

(assert (= (and start!95612 res!718362) b!1078626))

(assert (= (and b!1078626 res!718359) b!1078623))

(assert (= (and b!1078623 res!718360) b!1078630))

(assert (= (and b!1078630 res!718361) b!1078622))

(assert (= (and b!1078622 res!718358) b!1078628))

(assert (= (and b!1078628 (not res!718357)) b!1078625))

(assert (= (and b!1078629 condMapEmpty!40891) mapIsEmpty!40891))

(assert (= (and b!1078629 (not condMapEmpty!40891)) mapNonEmpty!40891))

(get-info :version)

(assert (= (and mapNonEmpty!40891 ((_ is ValueCellFull!12341) mapValue!40891)) b!1078627))

(assert (= (and b!1078629 ((_ is ValueCellFull!12341) mapDefault!40891)) b!1078624))

(assert (= start!95612 b!1078629))

(declare-fun m!997871 () Bool)

(assert (=> mapNonEmpty!40891 m!997871))

(declare-fun m!997873 () Bool)

(assert (=> b!1078625 m!997873))

(declare-fun m!997875 () Bool)

(assert (=> b!1078628 m!997875))

(declare-fun m!997877 () Bool)

(assert (=> start!95612 m!997877))

(declare-fun m!997879 () Bool)

(assert (=> start!95612 m!997879))

(declare-fun m!997881 () Bool)

(assert (=> start!95612 m!997881))

(declare-fun m!997883 () Bool)

(assert (=> b!1078623 m!997883))

(declare-fun m!997885 () Bool)

(assert (=> b!1078622 m!997885))

(check-sat (not mapNonEmpty!40891) tp_is_empty!26101 (not b!1078628) (not start!95612) (not b!1078625) (not b!1078623) (not b!1078622))
(check-sat)
(get-model)

(declare-fun d!130301 () Bool)

(declare-fun lt!479044 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!538 (List!23224) (InoxSet (_ BitVec 64)))

(assert (=> d!130301 (= lt!479044 (select (content!538 Nil!23221) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!616854 () Bool)

(assert (=> d!130301 (= lt!479044 e!616854)))

(declare-fun res!718404 () Bool)

(assert (=> d!130301 (=> (not res!718404) (not e!616854))))

(assert (=> d!130301 (= res!718404 ((_ is Cons!23220) Nil!23221))))

(assert (=> d!130301 (= (contains!6392 Nil!23221 #b1000000000000000000000000000000000000000000000000000000000000000) lt!479044)))

(declare-fun b!1078689 () Bool)

(declare-fun e!616853 () Bool)

(assert (=> b!1078689 (= e!616854 e!616853)))

(declare-fun res!718403 () Bool)

(assert (=> b!1078689 (=> res!718403 e!616853)))

(assert (=> b!1078689 (= res!718403 (= (h!24438 Nil!23221) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1078690 () Bool)

(assert (=> b!1078690 (= e!616853 (contains!6392 (t!32575 Nil!23221) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!130301 res!718404) b!1078689))

(assert (= (and b!1078689 (not res!718403)) b!1078690))

(declare-fun m!997919 () Bool)

(assert (=> d!130301 m!997919))

(declare-fun m!997921 () Bool)

(assert (=> d!130301 m!997921))

(declare-fun m!997923 () Bool)

(assert (=> b!1078690 m!997923))

(assert (=> b!1078625 d!130301))

(declare-fun d!130303 () Bool)

(declare-fun res!718409 () Bool)

(declare-fun e!616859 () Bool)

(assert (=> d!130303 (=> res!718409 e!616859)))

(assert (=> d!130303 (= res!718409 ((_ is Nil!23221) Nil!23221))))

(assert (=> d!130303 (= (noDuplicate!1589 Nil!23221) e!616859)))

(declare-fun b!1078695 () Bool)

(declare-fun e!616860 () Bool)

(assert (=> b!1078695 (= e!616859 e!616860)))

(declare-fun res!718410 () Bool)

(assert (=> b!1078695 (=> (not res!718410) (not e!616860))))

(assert (=> b!1078695 (= res!718410 (not (contains!6392 (t!32575 Nil!23221) (h!24438 Nil!23221))))))

(declare-fun b!1078696 () Bool)

(assert (=> b!1078696 (= e!616860 (noDuplicate!1589 (t!32575 Nil!23221)))))

(assert (= (and d!130303 (not res!718409)) b!1078695))

(assert (= (and b!1078695 res!718410) b!1078696))

(declare-fun m!997925 () Bool)

(assert (=> b!1078695 m!997925))

(declare-fun m!997927 () Bool)

(assert (=> b!1078696 m!997927))

(assert (=> b!1078622 d!130303))

(declare-fun d!130305 () Bool)

(assert (=> d!130305 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95612 d!130305))

(declare-fun d!130307 () Bool)

(assert (=> d!130307 (= (array_inv!25744 _values!874) (bvsge (size!33805 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95612 d!130307))

(declare-fun d!130309 () Bool)

(assert (=> d!130309 (= (array_inv!25745 _keys!1070) (bvsge (size!33806 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95612 d!130309))

(declare-fun b!1078705 () Bool)

(declare-fun e!616867 () Bool)

(declare-fun call!45786 () Bool)

(assert (=> b!1078705 (= e!616867 call!45786)))

(declare-fun bm!45783 () Bool)

(assert (=> bm!45783 (= call!45786 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun d!130311 () Bool)

(declare-fun res!718416 () Bool)

(declare-fun e!616869 () Bool)

(assert (=> d!130311 (=> res!718416 e!616869)))

(assert (=> d!130311 (= res!718416 (bvsge #b00000000000000000000000000000000 (size!33806 _keys!1070)))))

(assert (=> d!130311 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616869)))

(declare-fun b!1078706 () Bool)

(assert (=> b!1078706 (= e!616869 e!616867)))

(declare-fun c!108723 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078706 (= c!108723 (validKeyInArray!0 (select (arr!33269 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1078707 () Bool)

(declare-fun e!616868 () Bool)

(assert (=> b!1078707 (= e!616867 e!616868)))

(declare-fun lt!479051 () (_ BitVec 64))

(assert (=> b!1078707 (= lt!479051 (select (arr!33269 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35431 0))(
  ( (Unit!35432) )
))
(declare-fun lt!479052 () Unit!35431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69193 (_ BitVec 64) (_ BitVec 32)) Unit!35431)

(assert (=> b!1078707 (= lt!479052 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!479051 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078707 (arrayContainsKey!0 _keys!1070 lt!479051 #b00000000000000000000000000000000)))

(declare-fun lt!479053 () Unit!35431)

(assert (=> b!1078707 (= lt!479053 lt!479052)))

(declare-fun res!718415 () Bool)

(declare-datatypes ((SeekEntryResult!9855 0))(
  ( (MissingZero!9855 (index!41791 (_ BitVec 32))) (Found!9855 (index!41792 (_ BitVec 32))) (Intermediate!9855 (undefined!10667 Bool) (index!41793 (_ BitVec 32)) (x!96550 (_ BitVec 32))) (Undefined!9855) (MissingVacant!9855 (index!41794 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69193 (_ BitVec 32)) SeekEntryResult!9855)

(assert (=> b!1078707 (= res!718415 (= (seekEntryOrOpen!0 (select (arr!33269 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9855 #b00000000000000000000000000000000)))))

(assert (=> b!1078707 (=> (not res!718415) (not e!616868))))

(declare-fun b!1078708 () Bool)

(assert (=> b!1078708 (= e!616868 call!45786)))

(assert (= (and d!130311 (not res!718416)) b!1078706))

(assert (= (and b!1078706 c!108723) b!1078707))

(assert (= (and b!1078706 (not c!108723)) b!1078705))

(assert (= (and b!1078707 res!718415) b!1078708))

(assert (= (or b!1078708 b!1078705) bm!45783))

(declare-fun m!997929 () Bool)

(assert (=> bm!45783 m!997929))

(declare-fun m!997931 () Bool)

(assert (=> b!1078706 m!997931))

(assert (=> b!1078706 m!997931))

(declare-fun m!997933 () Bool)

(assert (=> b!1078706 m!997933))

(assert (=> b!1078707 m!997931))

(declare-fun m!997935 () Bool)

(assert (=> b!1078707 m!997935))

(declare-fun m!997937 () Bool)

(assert (=> b!1078707 m!997937))

(assert (=> b!1078707 m!997931))

(declare-fun m!997939 () Bool)

(assert (=> b!1078707 m!997939))

(assert (=> b!1078623 d!130311))

(declare-fun d!130313 () Bool)

(declare-fun lt!479054 () Bool)

(assert (=> d!130313 (= lt!479054 (select (content!538 Nil!23221) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!616871 () Bool)

(assert (=> d!130313 (= lt!479054 e!616871)))

(declare-fun res!718418 () Bool)

(assert (=> d!130313 (=> (not res!718418) (not e!616871))))

(assert (=> d!130313 (= res!718418 ((_ is Cons!23220) Nil!23221))))

(assert (=> d!130313 (= (contains!6392 Nil!23221 #b0000000000000000000000000000000000000000000000000000000000000000) lt!479054)))

(declare-fun b!1078709 () Bool)

(declare-fun e!616870 () Bool)

(assert (=> b!1078709 (= e!616871 e!616870)))

(declare-fun res!718417 () Bool)

(assert (=> b!1078709 (=> res!718417 e!616870)))

(assert (=> b!1078709 (= res!718417 (= (h!24438 Nil!23221) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1078710 () Bool)

(assert (=> b!1078710 (= e!616870 (contains!6392 (t!32575 Nil!23221) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!130313 res!718418) b!1078709))

(assert (= (and b!1078709 (not res!718417)) b!1078710))

(assert (=> d!130313 m!997919))

(declare-fun m!997941 () Bool)

(assert (=> d!130313 m!997941))

(declare-fun m!997943 () Bool)

(assert (=> b!1078710 m!997943))

(assert (=> b!1078628 d!130313))

(declare-fun b!1078717 () Bool)

(declare-fun e!616876 () Bool)

(assert (=> b!1078717 (= e!616876 tp_is_empty!26101)))

(declare-fun b!1078718 () Bool)

(declare-fun e!616877 () Bool)

(assert (=> b!1078718 (= e!616877 tp_is_empty!26101)))

(declare-fun mapIsEmpty!40900 () Bool)

(declare-fun mapRes!40900 () Bool)

(assert (=> mapIsEmpty!40900 mapRes!40900))

(declare-fun condMapEmpty!40900 () Bool)

(declare-fun mapDefault!40900 () ValueCell!12341)

(assert (=> mapNonEmpty!40891 (= condMapEmpty!40900 (= mapRest!40891 ((as const (Array (_ BitVec 32) ValueCell!12341)) mapDefault!40900)))))

(assert (=> mapNonEmpty!40891 (= tp!78353 (and e!616877 mapRes!40900))))

(declare-fun mapNonEmpty!40900 () Bool)

(declare-fun tp!78362 () Bool)

(assert (=> mapNonEmpty!40900 (= mapRes!40900 (and tp!78362 e!616876))))

(declare-fun mapRest!40900 () (Array (_ BitVec 32) ValueCell!12341))

(declare-fun mapKey!40900 () (_ BitVec 32))

(declare-fun mapValue!40900 () ValueCell!12341)

(assert (=> mapNonEmpty!40900 (= mapRest!40891 (store mapRest!40900 mapKey!40900 mapValue!40900))))

(assert (= (and mapNonEmpty!40891 condMapEmpty!40900) mapIsEmpty!40900))

(assert (= (and mapNonEmpty!40891 (not condMapEmpty!40900)) mapNonEmpty!40900))

(assert (= (and mapNonEmpty!40900 ((_ is ValueCellFull!12341) mapValue!40900)) b!1078717))

(assert (= (and mapNonEmpty!40891 ((_ is ValueCellFull!12341) mapDefault!40900)) b!1078718))

(declare-fun m!997945 () Bool)

(assert (=> mapNonEmpty!40900 m!997945))

(check-sat (not mapNonEmpty!40900) tp_is_empty!26101 (not b!1078707) (not d!130313) (not b!1078706) (not b!1078696) (not b!1078695) (not b!1078690) (not d!130301) (not b!1078710) (not bm!45783))
(check-sat)
