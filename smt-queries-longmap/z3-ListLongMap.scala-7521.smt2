; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95370 () Bool)

(assert start!95370)

(declare-fun b!1077142 () Bool)

(declare-fun res!717771 () Bool)

(declare-fun e!615859 () Bool)

(assert (=> b!1077142 (=> (not res!717771) (not e!615859))))

(declare-datatypes ((array!69086 0))(
  ( (array!69087 (arr!33222 (Array (_ BitVec 32) (_ BitVec 64))) (size!33760 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69086)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69086 (_ BitVec 32)) Bool)

(assert (=> b!1077142 (= res!717771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077143 () Bool)

(declare-fun res!717766 () Bool)

(assert (=> b!1077143 (=> (not res!717766) (not e!615859))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!39929 0))(
  ( (V!39930 (val!13107 Int)) )
))
(declare-datatypes ((ValueCell!12341 0))(
  ( (ValueCellFull!12341 (v!15725 V!39929)) (EmptyCell!12341) )
))
(declare-datatypes ((array!69088 0))(
  ( (array!69089 (arr!33223 (Array (_ BitVec 32) ValueCell!12341)) (size!33761 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69088)

(assert (=> b!1077143 (= res!717766 (and (= (size!33761 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33760 _keys!1070) (size!33761 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!40891 () Bool)

(declare-fun mapRes!40891 () Bool)

(assert (=> mapIsEmpty!40891 mapRes!40891))

(declare-fun b!1077144 () Bool)

(declare-fun res!717768 () Bool)

(assert (=> b!1077144 (=> (not res!717768) (not e!615859))))

(assert (=> b!1077144 (= res!717768 (and (bvsle #b00000000000000000000000000000000 (size!33760 _keys!1070)) (bvslt (size!33760 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1077145 () Bool)

(declare-fun res!717767 () Bool)

(assert (=> b!1077145 (=> (not res!717767) (not e!615859))))

(declare-datatypes ((List!23266 0))(
  ( (Nil!23263) (Cons!23262 (h!24471 (_ BitVec 64)) (t!32616 List!23266)) )
))
(declare-fun noDuplicate!1588 (List!23266) Bool)

(assert (=> b!1077145 (= res!717767 (noDuplicate!1588 Nil!23263))))

(declare-fun res!717769 () Bool)

(assert (=> start!95370 (=> (not res!717769) (not e!615859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95370 (= res!717769 (validMask!0 mask!1414))))

(assert (=> start!95370 e!615859))

(assert (=> start!95370 true))

(declare-fun e!615862 () Bool)

(declare-fun array_inv!25698 (array!69088) Bool)

(assert (=> start!95370 (and (array_inv!25698 _values!874) e!615862)))

(declare-fun array_inv!25699 (array!69086) Bool)

(assert (=> start!95370 (array_inv!25699 _keys!1070)))

(declare-fun b!1077146 () Bool)

(declare-fun e!615861 () Bool)

(assert (=> b!1077146 (= e!615862 (and e!615861 mapRes!40891))))

(declare-fun condMapEmpty!40891 () Bool)

(declare-fun mapDefault!40891 () ValueCell!12341)

(assert (=> b!1077146 (= condMapEmpty!40891 (= (arr!33223 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12341)) mapDefault!40891)))))

(declare-fun mapNonEmpty!40891 () Bool)

(declare-fun tp!78353 () Bool)

(declare-fun e!615863 () Bool)

(assert (=> mapNonEmpty!40891 (= mapRes!40891 (and tp!78353 e!615863))))

(declare-fun mapValue!40891 () ValueCell!12341)

(declare-fun mapKey!40891 () (_ BitVec 32))

(declare-fun mapRest!40891 () (Array (_ BitVec 32) ValueCell!12341))

(assert (=> mapNonEmpty!40891 (= (arr!33223 _values!874) (store mapRest!40891 mapKey!40891 mapValue!40891))))

(declare-fun b!1077147 () Bool)

(declare-fun e!615864 () Bool)

(assert (=> b!1077147 (= e!615859 e!615864)))

(declare-fun res!717770 () Bool)

(assert (=> b!1077147 (=> res!717770 e!615864)))

(declare-fun contains!6336 (List!23266 (_ BitVec 64)) Bool)

(assert (=> b!1077147 (= res!717770 (contains!6336 Nil!23263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077148 () Bool)

(declare-fun tp_is_empty!26101 () Bool)

(assert (=> b!1077148 (= e!615861 tp_is_empty!26101)))

(declare-fun b!1077149 () Bool)

(assert (=> b!1077149 (= e!615864 (contains!6336 Nil!23263 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077150 () Bool)

(assert (=> b!1077150 (= e!615863 tp_is_empty!26101)))

(assert (= (and start!95370 res!717769) b!1077143))

(assert (= (and b!1077143 res!717766) b!1077142))

(assert (= (and b!1077142 res!717771) b!1077144))

(assert (= (and b!1077144 res!717768) b!1077145))

(assert (= (and b!1077145 res!717767) b!1077147))

(assert (= (and b!1077147 (not res!717770)) b!1077149))

(assert (= (and b!1077146 condMapEmpty!40891) mapIsEmpty!40891))

(assert (= (and b!1077146 (not condMapEmpty!40891)) mapNonEmpty!40891))

(get-info :version)

(assert (= (and mapNonEmpty!40891 ((_ is ValueCellFull!12341) mapValue!40891)) b!1077150))

(assert (= (and b!1077146 ((_ is ValueCellFull!12341) mapDefault!40891)) b!1077148))

(assert (= start!95370 b!1077146))

(declare-fun m!995573 () Bool)

(assert (=> b!1077147 m!995573))

(declare-fun m!995575 () Bool)

(assert (=> start!95370 m!995575))

(declare-fun m!995577 () Bool)

(assert (=> start!95370 m!995577))

(declare-fun m!995579 () Bool)

(assert (=> start!95370 m!995579))

(declare-fun m!995581 () Bool)

(assert (=> b!1077142 m!995581))

(declare-fun m!995583 () Bool)

(assert (=> mapNonEmpty!40891 m!995583))

(declare-fun m!995585 () Bool)

(assert (=> b!1077149 m!995585))

(declare-fun m!995587 () Bool)

(assert (=> b!1077145 m!995587))

(check-sat (not mapNonEmpty!40891) (not b!1077142) (not b!1077149) (not start!95370) tp_is_empty!26101 (not b!1077145) (not b!1077147))
(check-sat)
(get-model)

(declare-fun d!129681 () Bool)

(declare-fun lt!478329 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!534 (List!23266) (InoxSet (_ BitVec 64)))

(assert (=> d!129681 (= lt!478329 (select (content!534 Nil!23263) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!615905 () Bool)

(assert (=> d!129681 (= lt!478329 e!615905)))

(declare-fun res!717813 () Bool)

(assert (=> d!129681 (=> (not res!717813) (not e!615905))))

(assert (=> d!129681 (= res!717813 ((_ is Cons!23262) Nil!23263))))

(assert (=> d!129681 (= (contains!6336 Nil!23263 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478329)))

(declare-fun b!1077209 () Bool)

(declare-fun e!615906 () Bool)

(assert (=> b!1077209 (= e!615905 e!615906)))

(declare-fun res!717812 () Bool)

(assert (=> b!1077209 (=> res!717812 e!615906)))

(assert (=> b!1077209 (= res!717812 (= (h!24471 Nil!23263) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077210 () Bool)

(assert (=> b!1077210 (= e!615906 (contains!6336 (t!32616 Nil!23263) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129681 res!717813) b!1077209))

(assert (= (and b!1077209 (not res!717812)) b!1077210))

(declare-fun m!995621 () Bool)

(assert (=> d!129681 m!995621))

(declare-fun m!995623 () Bool)

(assert (=> d!129681 m!995623))

(declare-fun m!995625 () Bool)

(assert (=> b!1077210 m!995625))

(assert (=> b!1077147 d!129681))

(declare-fun d!129683 () Bool)

(assert (=> d!129683 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95370 d!129683))

(declare-fun d!129685 () Bool)

(assert (=> d!129685 (= (array_inv!25698 _values!874) (bvsge (size!33761 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95370 d!129685))

(declare-fun d!129687 () Bool)

(assert (=> d!129687 (= (array_inv!25699 _keys!1070) (bvsge (size!33760 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95370 d!129687))

(declare-fun d!129689 () Bool)

(declare-fun res!717818 () Bool)

(declare-fun e!615911 () Bool)

(assert (=> d!129689 (=> res!717818 e!615911)))

(assert (=> d!129689 (= res!717818 ((_ is Nil!23263) Nil!23263))))

(assert (=> d!129689 (= (noDuplicate!1588 Nil!23263) e!615911)))

(declare-fun b!1077215 () Bool)

(declare-fun e!615912 () Bool)

(assert (=> b!1077215 (= e!615911 e!615912)))

(declare-fun res!717819 () Bool)

(assert (=> b!1077215 (=> (not res!717819) (not e!615912))))

(assert (=> b!1077215 (= res!717819 (not (contains!6336 (t!32616 Nil!23263) (h!24471 Nil!23263))))))

(declare-fun b!1077216 () Bool)

(assert (=> b!1077216 (= e!615912 (noDuplicate!1588 (t!32616 Nil!23263)))))

(assert (= (and d!129689 (not res!717818)) b!1077215))

(assert (= (and b!1077215 res!717819) b!1077216))

(declare-fun m!995627 () Bool)

(assert (=> b!1077215 m!995627))

(declare-fun m!995629 () Bool)

(assert (=> b!1077216 m!995629))

(assert (=> b!1077145 d!129689))

(declare-fun d!129691 () Bool)

(declare-fun lt!478330 () Bool)

(assert (=> d!129691 (= lt!478330 (select (content!534 Nil!23263) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!615913 () Bool)

(assert (=> d!129691 (= lt!478330 e!615913)))

(declare-fun res!717821 () Bool)

(assert (=> d!129691 (=> (not res!717821) (not e!615913))))

(assert (=> d!129691 (= res!717821 ((_ is Cons!23262) Nil!23263))))

(assert (=> d!129691 (= (contains!6336 Nil!23263 #b1000000000000000000000000000000000000000000000000000000000000000) lt!478330)))

(declare-fun b!1077217 () Bool)

(declare-fun e!615914 () Bool)

(assert (=> b!1077217 (= e!615913 e!615914)))

(declare-fun res!717820 () Bool)

(assert (=> b!1077217 (=> res!717820 e!615914)))

(assert (=> b!1077217 (= res!717820 (= (h!24471 Nil!23263) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077218 () Bool)

(assert (=> b!1077218 (= e!615914 (contains!6336 (t!32616 Nil!23263) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129691 res!717821) b!1077217))

(assert (= (and b!1077217 (not res!717820)) b!1077218))

(assert (=> d!129691 m!995621))

(declare-fun m!995631 () Bool)

(assert (=> d!129691 m!995631))

(declare-fun m!995633 () Bool)

(assert (=> b!1077218 m!995633))

(assert (=> b!1077149 d!129691))

(declare-fun d!129693 () Bool)

(declare-fun res!717826 () Bool)

(declare-fun e!615922 () Bool)

(assert (=> d!129693 (=> res!717826 e!615922)))

(assert (=> d!129693 (= res!717826 (bvsge #b00000000000000000000000000000000 (size!33760 _keys!1070)))))

(assert (=> d!129693 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!615922)))

(declare-fun b!1077227 () Bool)

(declare-fun e!615923 () Bool)

(assert (=> b!1077227 (= e!615922 e!615923)))

(declare-fun c!108274 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077227 (= c!108274 (validKeyInArray!0 (select (arr!33222 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077228 () Bool)

(declare-fun e!615921 () Bool)

(assert (=> b!1077228 (= e!615923 e!615921)))

(declare-fun lt!478339 () (_ BitVec 64))

(assert (=> b!1077228 (= lt!478339 (select (arr!33222 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35301 0))(
  ( (Unit!35302) )
))
(declare-fun lt!478337 () Unit!35301)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69086 (_ BitVec 64) (_ BitVec 32)) Unit!35301)

(assert (=> b!1077228 (= lt!478337 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478339 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077228 (arrayContainsKey!0 _keys!1070 lt!478339 #b00000000000000000000000000000000)))

(declare-fun lt!478338 () Unit!35301)

(assert (=> b!1077228 (= lt!478338 lt!478337)))

(declare-fun res!717827 () Bool)

(declare-datatypes ((SeekEntryResult!9898 0))(
  ( (MissingZero!9898 (index!41963 (_ BitVec 32))) (Found!9898 (index!41964 (_ BitVec 32))) (Intermediate!9898 (undefined!10710 Bool) (index!41965 (_ BitVec 32)) (x!96568 (_ BitVec 32))) (Undefined!9898) (MissingVacant!9898 (index!41966 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69086 (_ BitVec 32)) SeekEntryResult!9898)

(assert (=> b!1077228 (= res!717827 (= (seekEntryOrOpen!0 (select (arr!33222 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9898 #b00000000000000000000000000000000)))))

(assert (=> b!1077228 (=> (not res!717827) (not e!615921))))

(declare-fun b!1077229 () Bool)

(declare-fun call!45696 () Bool)

(assert (=> b!1077229 (= e!615921 call!45696)))

(declare-fun b!1077230 () Bool)

(assert (=> b!1077230 (= e!615923 call!45696)))

(declare-fun bm!45693 () Bool)

(assert (=> bm!45693 (= call!45696 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(assert (= (and d!129693 (not res!717826)) b!1077227))

(assert (= (and b!1077227 c!108274) b!1077228))

(assert (= (and b!1077227 (not c!108274)) b!1077230))

(assert (= (and b!1077228 res!717827) b!1077229))

(assert (= (or b!1077229 b!1077230) bm!45693))

(declare-fun m!995635 () Bool)

(assert (=> b!1077227 m!995635))

(assert (=> b!1077227 m!995635))

(declare-fun m!995637 () Bool)

(assert (=> b!1077227 m!995637))

(assert (=> b!1077228 m!995635))

(declare-fun m!995639 () Bool)

(assert (=> b!1077228 m!995639))

(declare-fun m!995641 () Bool)

(assert (=> b!1077228 m!995641))

(assert (=> b!1077228 m!995635))

(declare-fun m!995643 () Bool)

(assert (=> b!1077228 m!995643))

(declare-fun m!995645 () Bool)

(assert (=> bm!45693 m!995645))

(assert (=> b!1077142 d!129693))

(declare-fun b!1077237 () Bool)

(declare-fun e!615928 () Bool)

(assert (=> b!1077237 (= e!615928 tp_is_empty!26101)))

(declare-fun b!1077238 () Bool)

(declare-fun e!615929 () Bool)

(assert (=> b!1077238 (= e!615929 tp_is_empty!26101)))

(declare-fun mapNonEmpty!40900 () Bool)

(declare-fun mapRes!40900 () Bool)

(declare-fun tp!78362 () Bool)

(assert (=> mapNonEmpty!40900 (= mapRes!40900 (and tp!78362 e!615928))))

(declare-fun mapKey!40900 () (_ BitVec 32))

(declare-fun mapRest!40900 () (Array (_ BitVec 32) ValueCell!12341))

(declare-fun mapValue!40900 () ValueCell!12341)

(assert (=> mapNonEmpty!40900 (= mapRest!40891 (store mapRest!40900 mapKey!40900 mapValue!40900))))

(declare-fun mapIsEmpty!40900 () Bool)

(assert (=> mapIsEmpty!40900 mapRes!40900))

(declare-fun condMapEmpty!40900 () Bool)

(declare-fun mapDefault!40900 () ValueCell!12341)

(assert (=> mapNonEmpty!40891 (= condMapEmpty!40900 (= mapRest!40891 ((as const (Array (_ BitVec 32) ValueCell!12341)) mapDefault!40900)))))

(assert (=> mapNonEmpty!40891 (= tp!78353 (and e!615929 mapRes!40900))))

(assert (= (and mapNonEmpty!40891 condMapEmpty!40900) mapIsEmpty!40900))

(assert (= (and mapNonEmpty!40891 (not condMapEmpty!40900)) mapNonEmpty!40900))

(assert (= (and mapNonEmpty!40900 ((_ is ValueCellFull!12341) mapValue!40900)) b!1077237))

(assert (= (and mapNonEmpty!40891 ((_ is ValueCellFull!12341) mapDefault!40900)) b!1077238))

(declare-fun m!995647 () Bool)

(assert (=> mapNonEmpty!40900 m!995647))

(check-sat (not b!1077210) (not bm!45693) (not b!1077216) (not mapNonEmpty!40900) tp_is_empty!26101 (not b!1077215) (not d!129691) (not b!1077228) (not b!1077218) (not b!1077227) (not d!129681))
(check-sat)
