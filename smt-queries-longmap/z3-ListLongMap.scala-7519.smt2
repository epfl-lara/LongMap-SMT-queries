; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95340 () Bool)

(assert start!95340)

(declare-fun mapNonEmpty!40867 () Bool)

(declare-fun mapRes!40867 () Bool)

(declare-fun tp!78329 () Bool)

(declare-fun e!615735 () Bool)

(assert (=> mapNonEmpty!40867 (= mapRes!40867 (and tp!78329 e!615735))))

(declare-fun mapKey!40867 () (_ BitVec 32))

(declare-datatypes ((V!39913 0))(
  ( (V!39914 (val!13101 Int)) )
))
(declare-datatypes ((ValueCell!12335 0))(
  ( (ValueCellFull!12335 (v!15719 V!39913)) (EmptyCell!12335) )
))
(declare-datatypes ((array!69060 0))(
  ( (array!69061 (arr!33211 (Array (_ BitVec 32) ValueCell!12335)) (size!33749 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69060)

(declare-fun mapValue!40867 () ValueCell!12335)

(declare-fun mapRest!40867 () (Array (_ BitVec 32) ValueCell!12335))

(assert (=> mapNonEmpty!40867 (= (arr!33211 _values!874) (store mapRest!40867 mapKey!40867 mapValue!40867))))

(declare-fun b!1076973 () Bool)

(declare-fun e!615732 () Bool)

(declare-fun tp_is_empty!26089 () Bool)

(assert (=> b!1076973 (= e!615732 tp_is_empty!26089)))

(declare-fun b!1076974 () Bool)

(declare-fun e!615733 () Bool)

(declare-datatypes ((array!69062 0))(
  ( (array!69063 (arr!33212 (Array (_ BitVec 32) (_ BitVec 64))) (size!33750 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69062)

(assert (=> b!1076974 (= e!615733 (and (bvsle #b00000000000000000000000000000000 (size!33750 _keys!1070)) (bvsge (size!33750 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!40867 () Bool)

(assert (=> mapIsEmpty!40867 mapRes!40867))

(declare-fun b!1076975 () Bool)

(assert (=> b!1076975 (= e!615735 tp_is_empty!26089)))

(declare-fun b!1076976 () Bool)

(declare-fun res!717679 () Bool)

(assert (=> b!1076976 (=> (not res!717679) (not e!615733))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1076976 (= res!717679 (and (= (size!33749 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33750 _keys!1070) (size!33749 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!717681 () Bool)

(assert (=> start!95340 (=> (not res!717681) (not e!615733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95340 (= res!717681 (validMask!0 mask!1414))))

(assert (=> start!95340 e!615733))

(assert (=> start!95340 true))

(declare-fun e!615734 () Bool)

(declare-fun array_inv!25690 (array!69060) Bool)

(assert (=> start!95340 (and (array_inv!25690 _values!874) e!615734)))

(declare-fun array_inv!25691 (array!69062) Bool)

(assert (=> start!95340 (array_inv!25691 _keys!1070)))

(declare-fun b!1076977 () Bool)

(declare-fun res!717680 () Bool)

(assert (=> b!1076977 (=> (not res!717680) (not e!615733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69062 (_ BitVec 32)) Bool)

(assert (=> b!1076977 (= res!717680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1076978 () Bool)

(assert (=> b!1076978 (= e!615734 (and e!615732 mapRes!40867))))

(declare-fun condMapEmpty!40867 () Bool)

(declare-fun mapDefault!40867 () ValueCell!12335)

(assert (=> b!1076978 (= condMapEmpty!40867 (= (arr!33211 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12335)) mapDefault!40867)))))

(assert (= (and start!95340 res!717681) b!1076976))

(assert (= (and b!1076976 res!717679) b!1076977))

(assert (= (and b!1076977 res!717680) b!1076974))

(assert (= (and b!1076978 condMapEmpty!40867) mapIsEmpty!40867))

(assert (= (and b!1076978 (not condMapEmpty!40867)) mapNonEmpty!40867))

(get-info :version)

(assert (= (and mapNonEmpty!40867 ((_ is ValueCellFull!12335) mapValue!40867)) b!1076975))

(assert (= (and b!1076978 ((_ is ValueCellFull!12335) mapDefault!40867)) b!1076973))

(assert (= start!95340 b!1076978))

(declare-fun m!995475 () Bool)

(assert (=> mapNonEmpty!40867 m!995475))

(declare-fun m!995477 () Bool)

(assert (=> start!95340 m!995477))

(declare-fun m!995479 () Bool)

(assert (=> start!95340 m!995479))

(declare-fun m!995481 () Bool)

(assert (=> start!95340 m!995481))

(declare-fun m!995483 () Bool)

(assert (=> b!1076977 m!995483))

(check-sat (not start!95340) (not b!1076977) (not mapNonEmpty!40867) tp_is_empty!26089)
(check-sat)
(get-model)

(declare-fun d!129659 () Bool)

(assert (=> d!129659 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95340 d!129659))

(declare-fun d!129661 () Bool)

(assert (=> d!129661 (= (array_inv!25690 _values!874) (bvsge (size!33749 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95340 d!129661))

(declare-fun d!129663 () Bool)

(assert (=> d!129663 (= (array_inv!25691 _keys!1070) (bvsge (size!33750 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95340 d!129663))

(declare-fun b!1077023 () Bool)

(declare-fun e!615773 () Bool)

(declare-fun e!615772 () Bool)

(assert (=> b!1077023 (= e!615773 e!615772)))

(declare-fun lt!478315 () (_ BitVec 64))

(assert (=> b!1077023 (= lt!478315 (select (arr!33212 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35297 0))(
  ( (Unit!35298) )
))
(declare-fun lt!478316 () Unit!35297)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69062 (_ BitVec 64) (_ BitVec 32)) Unit!35297)

(assert (=> b!1077023 (= lt!478316 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478315 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077023 (arrayContainsKey!0 _keys!1070 lt!478315 #b00000000000000000000000000000000)))

(declare-fun lt!478317 () Unit!35297)

(assert (=> b!1077023 (= lt!478317 lt!478316)))

(declare-fun res!717705 () Bool)

(declare-datatypes ((SeekEntryResult!9896 0))(
  ( (MissingZero!9896 (index!41955 (_ BitVec 32))) (Found!9896 (index!41956 (_ BitVec 32))) (Intermediate!9896 (undefined!10708 Bool) (index!41957 (_ BitVec 32)) (x!96546 (_ BitVec 32))) (Undefined!9896) (MissingVacant!9896 (index!41958 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69062 (_ BitVec 32)) SeekEntryResult!9896)

(assert (=> b!1077023 (= res!717705 (= (seekEntryOrOpen!0 (select (arr!33212 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9896 #b00000000000000000000000000000000)))))

(assert (=> b!1077023 (=> (not res!717705) (not e!615772))))

(declare-fun bm!45687 () Bool)

(declare-fun call!45690 () Bool)

(assert (=> bm!45687 (= call!45690 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun d!129665 () Bool)

(declare-fun res!717704 () Bool)

(declare-fun e!615774 () Bool)

(assert (=> d!129665 (=> res!717704 e!615774)))

(assert (=> d!129665 (= res!717704 (bvsge #b00000000000000000000000000000000 (size!33750 _keys!1070)))))

(assert (=> d!129665 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!615774)))

(declare-fun b!1077024 () Bool)

(assert (=> b!1077024 (= e!615773 call!45690)))

(declare-fun b!1077025 () Bool)

(assert (=> b!1077025 (= e!615774 e!615773)))

(declare-fun c!108268 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077025 (= c!108268 (validKeyInArray!0 (select (arr!33212 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077026 () Bool)

(assert (=> b!1077026 (= e!615772 call!45690)))

(assert (= (and d!129665 (not res!717704)) b!1077025))

(assert (= (and b!1077025 c!108268) b!1077023))

(assert (= (and b!1077025 (not c!108268)) b!1077024))

(assert (= (and b!1077023 res!717705) b!1077026))

(assert (= (or b!1077026 b!1077024) bm!45687))

(declare-fun m!995505 () Bool)

(assert (=> b!1077023 m!995505))

(declare-fun m!995507 () Bool)

(assert (=> b!1077023 m!995507))

(declare-fun m!995509 () Bool)

(assert (=> b!1077023 m!995509))

(assert (=> b!1077023 m!995505))

(declare-fun m!995511 () Bool)

(assert (=> b!1077023 m!995511))

(declare-fun m!995513 () Bool)

(assert (=> bm!45687 m!995513))

(assert (=> b!1077025 m!995505))

(assert (=> b!1077025 m!995505))

(declare-fun m!995515 () Bool)

(assert (=> b!1077025 m!995515))

(assert (=> b!1076977 d!129665))

(declare-fun b!1077034 () Bool)

(declare-fun e!615780 () Bool)

(assert (=> b!1077034 (= e!615780 tp_is_empty!26089)))

(declare-fun condMapEmpty!40876 () Bool)

(declare-fun mapDefault!40876 () ValueCell!12335)

(assert (=> mapNonEmpty!40867 (= condMapEmpty!40876 (= mapRest!40867 ((as const (Array (_ BitVec 32) ValueCell!12335)) mapDefault!40876)))))

(declare-fun mapRes!40876 () Bool)

(assert (=> mapNonEmpty!40867 (= tp!78329 (and e!615780 mapRes!40876))))

(declare-fun b!1077033 () Bool)

(declare-fun e!615779 () Bool)

(assert (=> b!1077033 (= e!615779 tp_is_empty!26089)))

(declare-fun mapNonEmpty!40876 () Bool)

(declare-fun tp!78338 () Bool)

(assert (=> mapNonEmpty!40876 (= mapRes!40876 (and tp!78338 e!615779))))

(declare-fun mapRest!40876 () (Array (_ BitVec 32) ValueCell!12335))

(declare-fun mapKey!40876 () (_ BitVec 32))

(declare-fun mapValue!40876 () ValueCell!12335)

(assert (=> mapNonEmpty!40876 (= mapRest!40867 (store mapRest!40876 mapKey!40876 mapValue!40876))))

(declare-fun mapIsEmpty!40876 () Bool)

(assert (=> mapIsEmpty!40876 mapRes!40876))

(assert (= (and mapNonEmpty!40867 condMapEmpty!40876) mapIsEmpty!40876))

(assert (= (and mapNonEmpty!40867 (not condMapEmpty!40876)) mapNonEmpty!40876))

(assert (= (and mapNonEmpty!40876 ((_ is ValueCellFull!12335) mapValue!40876)) b!1077033))

(assert (= (and mapNonEmpty!40867 ((_ is ValueCellFull!12335) mapDefault!40876)) b!1077034))

(declare-fun m!995517 () Bool)

(assert (=> mapNonEmpty!40876 m!995517))

(check-sat (not bm!45687) (not b!1077023) tp_is_empty!26089 (not mapNonEmpty!40876) (not b!1077025))
(check-sat)
