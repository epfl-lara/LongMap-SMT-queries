; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108508 () Bool)

(assert start!108508)

(declare-fun b!1279637 () Bool)

(declare-fun res!849798 () Bool)

(declare-fun e!731053 () Bool)

(assert (=> b!1279637 (=> (not res!849798) (not e!731053))))

(declare-datatypes ((array!84109 0))(
  ( (array!84110 (arr!40556 (Array (_ BitVec 32) (_ BitVec 64))) (size!41107 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84109)

(assert (=> b!1279637 (= res!849798 (and (bvsle #b00000000000000000000000000000000 (size!41107 _keys!1741)) (bvslt (size!41107 _keys!1741) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!51785 () Bool)

(declare-fun mapRes!51785 () Bool)

(declare-fun tp!98759 () Bool)

(declare-fun e!731049 () Bool)

(assert (=> mapNonEmpty!51785 (= mapRes!51785 (and tp!98759 e!731049))))

(declare-datatypes ((V!49761 0))(
  ( (V!49762 (val!16821 Int)) )
))
(declare-datatypes ((ValueCell!15848 0))(
  ( (ValueCellFull!15848 (v!19415 V!49761)) (EmptyCell!15848) )
))
(declare-fun mapValue!51785 () ValueCell!15848)

(declare-datatypes ((array!84111 0))(
  ( (array!84112 (arr!40557 (Array (_ BitVec 32) ValueCell!15848)) (size!41108 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84111)

(declare-fun mapKey!51785 () (_ BitVec 32))

(declare-fun mapRest!51785 () (Array (_ BitVec 32) ValueCell!15848))

(assert (=> mapNonEmpty!51785 (= (arr!40557 _values!1445) (store mapRest!51785 mapKey!51785 mapValue!51785))))

(declare-fun b!1279638 () Bool)

(declare-fun res!849799 () Bool)

(assert (=> b!1279638 (=> (not res!849799) (not e!731053))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279638 (= res!849799 (and (= (size!41108 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41107 _keys!1741) (size!41108 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279639 () Bool)

(declare-fun e!731050 () Bool)

(declare-fun e!731052 () Bool)

(assert (=> b!1279639 (= e!731050 (and e!731052 mapRes!51785))))

(declare-fun condMapEmpty!51785 () Bool)

(declare-fun mapDefault!51785 () ValueCell!15848)

(assert (=> b!1279639 (= condMapEmpty!51785 (= (arr!40557 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15848)) mapDefault!51785)))))

(declare-fun b!1279640 () Bool)

(declare-fun tp_is_empty!33493 () Bool)

(assert (=> b!1279640 (= e!731049 tp_is_empty!33493)))

(declare-fun b!1279641 () Bool)

(declare-fun res!849797 () Bool)

(assert (=> b!1279641 (=> (not res!849797) (not e!731053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84109 (_ BitVec 32)) Bool)

(assert (=> b!1279641 (= res!849797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279636 () Bool)

(declare-datatypes ((List!28773 0))(
  ( (Nil!28770) (Cons!28769 (h!29987 (_ BitVec 64)) (t!42305 List!28773)) )
))
(declare-fun noDuplicate!2067 (List!28773) Bool)

(assert (=> b!1279636 (= e!731053 (not (noDuplicate!2067 Nil!28770)))))

(declare-fun res!849796 () Bool)

(assert (=> start!108508 (=> (not res!849796) (not e!731053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108508 (= res!849796 (validMask!0 mask!2175))))

(assert (=> start!108508 e!731053))

(assert (=> start!108508 true))

(declare-fun array_inv!30995 (array!84111) Bool)

(assert (=> start!108508 (and (array_inv!30995 _values!1445) e!731050)))

(declare-fun array_inv!30996 (array!84109) Bool)

(assert (=> start!108508 (array_inv!30996 _keys!1741)))

(declare-fun b!1279642 () Bool)

(assert (=> b!1279642 (= e!731052 tp_is_empty!33493)))

(declare-fun mapIsEmpty!51785 () Bool)

(assert (=> mapIsEmpty!51785 mapRes!51785))

(assert (= (and start!108508 res!849796) b!1279638))

(assert (= (and b!1279638 res!849799) b!1279641))

(assert (= (and b!1279641 res!849797) b!1279637))

(assert (= (and b!1279637 res!849798) b!1279636))

(assert (= (and b!1279639 condMapEmpty!51785) mapIsEmpty!51785))

(assert (= (and b!1279639 (not condMapEmpty!51785)) mapNonEmpty!51785))

(get-info :version)

(assert (= (and mapNonEmpty!51785 ((_ is ValueCellFull!15848) mapValue!51785)) b!1279640))

(assert (= (and b!1279639 ((_ is ValueCellFull!15848) mapDefault!51785)) b!1279642))

(assert (= start!108508 b!1279639))

(declare-fun m!1175291 () Bool)

(assert (=> mapNonEmpty!51785 m!1175291))

(declare-fun m!1175293 () Bool)

(assert (=> b!1279641 m!1175293))

(declare-fun m!1175295 () Bool)

(assert (=> b!1279636 m!1175295))

(declare-fun m!1175297 () Bool)

(assert (=> start!108508 m!1175297))

(declare-fun m!1175299 () Bool)

(assert (=> start!108508 m!1175299))

(declare-fun m!1175301 () Bool)

(assert (=> start!108508 m!1175301))

(check-sat (not b!1279641) tp_is_empty!33493 (not mapNonEmpty!51785) (not start!108508) (not b!1279636))
(check-sat)
(get-model)

(declare-fun d!140981 () Bool)

(declare-fun res!849828 () Bool)

(declare-fun e!731088 () Bool)

(assert (=> d!140981 (=> res!849828 e!731088)))

(assert (=> d!140981 (= res!849828 ((_ is Nil!28770) Nil!28770))))

(assert (=> d!140981 (= (noDuplicate!2067 Nil!28770) e!731088)))

(declare-fun b!1279689 () Bool)

(declare-fun e!731089 () Bool)

(assert (=> b!1279689 (= e!731088 e!731089)))

(declare-fun res!849829 () Bool)

(assert (=> b!1279689 (=> (not res!849829) (not e!731089))))

(declare-fun contains!7766 (List!28773 (_ BitVec 64)) Bool)

(assert (=> b!1279689 (= res!849829 (not (contains!7766 (t!42305 Nil!28770) (h!29987 Nil!28770))))))

(declare-fun b!1279690 () Bool)

(assert (=> b!1279690 (= e!731089 (noDuplicate!2067 (t!42305 Nil!28770)))))

(assert (= (and d!140981 (not res!849828)) b!1279689))

(assert (= (and b!1279689 res!849829) b!1279690))

(declare-fun m!1175327 () Bool)

(assert (=> b!1279689 m!1175327))

(declare-fun m!1175329 () Bool)

(assert (=> b!1279690 m!1175329))

(assert (=> b!1279636 d!140981))

(declare-fun d!140983 () Bool)

(assert (=> d!140983 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108508 d!140983))

(declare-fun d!140985 () Bool)

(assert (=> d!140985 (= (array_inv!30995 _values!1445) (bvsge (size!41108 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108508 d!140985))

(declare-fun d!140987 () Bool)

(assert (=> d!140987 (= (array_inv!30996 _keys!1741) (bvsge (size!41107 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108508 d!140987))

(declare-fun b!1279699 () Bool)

(declare-fun e!731096 () Bool)

(declare-fun e!731097 () Bool)

(assert (=> b!1279699 (= e!731096 e!731097)))

(declare-fun c!124435 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1279699 (= c!124435 (validKeyInArray!0 (select (arr!40556 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1279700 () Bool)

(declare-fun e!731098 () Bool)

(declare-fun call!62778 () Bool)

(assert (=> b!1279700 (= e!731098 call!62778)))

(declare-fun b!1279701 () Bool)

(assert (=> b!1279701 (= e!731097 call!62778)))

(declare-fun d!140989 () Bool)

(declare-fun res!849834 () Bool)

(assert (=> d!140989 (=> res!849834 e!731096)))

(assert (=> d!140989 (= res!849834 (bvsge #b00000000000000000000000000000000 (size!41107 _keys!1741)))))

(assert (=> d!140989 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!731096)))

(declare-fun bm!62775 () Bool)

(assert (=> bm!62775 (= call!62778 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1279702 () Bool)

(assert (=> b!1279702 (= e!731097 e!731098)))

(declare-fun lt!576355 () (_ BitVec 64))

(assert (=> b!1279702 (= lt!576355 (select (arr!40556 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42356 0))(
  ( (Unit!42357) )
))
(declare-fun lt!576356 () Unit!42356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84109 (_ BitVec 64) (_ BitVec 32)) Unit!42356)

(assert (=> b!1279702 (= lt!576356 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!576355 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!84109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1279702 (arrayContainsKey!0 _keys!1741 lt!576355 #b00000000000000000000000000000000)))

(declare-fun lt!576354 () Unit!42356)

(assert (=> b!1279702 (= lt!576354 lt!576356)))

(declare-fun res!849835 () Bool)

(declare-datatypes ((SeekEntryResult!9966 0))(
  ( (MissingZero!9966 (index!42235 (_ BitVec 32))) (Found!9966 (index!42236 (_ BitVec 32))) (Intermediate!9966 (undefined!10778 Bool) (index!42237 (_ BitVec 32)) (x!113297 (_ BitVec 32))) (Undefined!9966) (MissingVacant!9966 (index!42238 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84109 (_ BitVec 32)) SeekEntryResult!9966)

(assert (=> b!1279702 (= res!849835 (= (seekEntryOrOpen!0 (select (arr!40556 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9966 #b00000000000000000000000000000000)))))

(assert (=> b!1279702 (=> (not res!849835) (not e!731098))))

(assert (= (and d!140989 (not res!849834)) b!1279699))

(assert (= (and b!1279699 c!124435) b!1279702))

(assert (= (and b!1279699 (not c!124435)) b!1279701))

(assert (= (and b!1279702 res!849835) b!1279700))

(assert (= (or b!1279700 b!1279701) bm!62775))

(declare-fun m!1175331 () Bool)

(assert (=> b!1279699 m!1175331))

(assert (=> b!1279699 m!1175331))

(declare-fun m!1175333 () Bool)

(assert (=> b!1279699 m!1175333))

(declare-fun m!1175335 () Bool)

(assert (=> bm!62775 m!1175335))

(assert (=> b!1279702 m!1175331))

(declare-fun m!1175337 () Bool)

(assert (=> b!1279702 m!1175337))

(declare-fun m!1175339 () Bool)

(assert (=> b!1279702 m!1175339))

(assert (=> b!1279702 m!1175331))

(declare-fun m!1175341 () Bool)

(assert (=> b!1279702 m!1175341))

(assert (=> b!1279641 d!140989))

(declare-fun mapNonEmpty!51794 () Bool)

(declare-fun mapRes!51794 () Bool)

(declare-fun tp!98768 () Bool)

(declare-fun e!731104 () Bool)

(assert (=> mapNonEmpty!51794 (= mapRes!51794 (and tp!98768 e!731104))))

(declare-fun mapKey!51794 () (_ BitVec 32))

(declare-fun mapValue!51794 () ValueCell!15848)

(declare-fun mapRest!51794 () (Array (_ BitVec 32) ValueCell!15848))

(assert (=> mapNonEmpty!51794 (= mapRest!51785 (store mapRest!51794 mapKey!51794 mapValue!51794))))

(declare-fun condMapEmpty!51794 () Bool)

(declare-fun mapDefault!51794 () ValueCell!15848)

(assert (=> mapNonEmpty!51785 (= condMapEmpty!51794 (= mapRest!51785 ((as const (Array (_ BitVec 32) ValueCell!15848)) mapDefault!51794)))))

(declare-fun e!731103 () Bool)

(assert (=> mapNonEmpty!51785 (= tp!98759 (and e!731103 mapRes!51794))))

(declare-fun b!1279710 () Bool)

(assert (=> b!1279710 (= e!731103 tp_is_empty!33493)))

(declare-fun b!1279709 () Bool)

(assert (=> b!1279709 (= e!731104 tp_is_empty!33493)))

(declare-fun mapIsEmpty!51794 () Bool)

(assert (=> mapIsEmpty!51794 mapRes!51794))

(assert (= (and mapNonEmpty!51785 condMapEmpty!51794) mapIsEmpty!51794))

(assert (= (and mapNonEmpty!51785 (not condMapEmpty!51794)) mapNonEmpty!51794))

(assert (= (and mapNonEmpty!51794 ((_ is ValueCellFull!15848) mapValue!51794)) b!1279709))

(assert (= (and mapNonEmpty!51785 ((_ is ValueCellFull!15848) mapDefault!51794)) b!1279710))

(declare-fun m!1175343 () Bool)

(assert (=> mapNonEmpty!51794 m!1175343))

(check-sat (not b!1279702) (not b!1279690) (not b!1279699) (not b!1279689) (not mapNonEmpty!51794) tp_is_empty!33493 (not bm!62775))
(check-sat)
