; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95334 () Bool)

(assert start!95334)

(declare-fun mapIsEmpty!40858 () Bool)

(declare-fun mapRes!40858 () Bool)

(assert (=> mapIsEmpty!40858 mapRes!40858))

(declare-fun b!1077070 () Bool)

(declare-fun e!615781 () Bool)

(declare-fun tp_is_empty!26085 () Bool)

(assert (=> b!1077070 (= e!615781 tp_is_empty!26085)))

(declare-fun b!1077071 () Bool)

(declare-fun res!717726 () Bool)

(declare-fun e!615779 () Bool)

(assert (=> b!1077071 (=> (not res!717726) (not e!615779))))

(declare-datatypes ((array!69119 0))(
  ( (array!69120 (arr!33241 (Array (_ BitVec 32) (_ BitVec 64))) (size!33777 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69119)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69119 (_ BitVec 32)) Bool)

(assert (=> b!1077071 (= res!717726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077072 () Bool)

(declare-fun res!717724 () Bool)

(assert (=> b!1077072 (=> (not res!717724) (not e!615779))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!39907 0))(
  ( (V!39908 (val!13099 Int)) )
))
(declare-datatypes ((ValueCell!12333 0))(
  ( (ValueCellFull!12333 (v!15718 V!39907)) (EmptyCell!12333) )
))
(declare-datatypes ((array!69121 0))(
  ( (array!69122 (arr!33242 (Array (_ BitVec 32) ValueCell!12333)) (size!33778 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69121)

(assert (=> b!1077072 (= res!717724 (and (= (size!33778 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33777 _keys!1070) (size!33778 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077073 () Bool)

(declare-fun e!615780 () Bool)

(declare-fun e!615782 () Bool)

(assert (=> b!1077073 (= e!615780 (and e!615782 mapRes!40858))))

(declare-fun condMapEmpty!40858 () Bool)

(declare-fun mapDefault!40858 () ValueCell!12333)

(assert (=> b!1077073 (= condMapEmpty!40858 (= (arr!33242 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12333)) mapDefault!40858)))))

(declare-fun mapNonEmpty!40858 () Bool)

(declare-fun tp!78320 () Bool)

(assert (=> mapNonEmpty!40858 (= mapRes!40858 (and tp!78320 e!615781))))

(declare-fun mapRest!40858 () (Array (_ BitVec 32) ValueCell!12333))

(declare-fun mapKey!40858 () (_ BitVec 32))

(declare-fun mapValue!40858 () ValueCell!12333)

(assert (=> mapNonEmpty!40858 (= (arr!33242 _values!874) (store mapRest!40858 mapKey!40858 mapValue!40858))))

(declare-fun res!717725 () Bool)

(assert (=> start!95334 (=> (not res!717725) (not e!615779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95334 (= res!717725 (validMask!0 mask!1414))))

(assert (=> start!95334 e!615779))

(assert (=> start!95334 true))

(declare-fun array_inv!25682 (array!69121) Bool)

(assert (=> start!95334 (and (array_inv!25682 _values!874) e!615780)))

(declare-fun array_inv!25683 (array!69119) Bool)

(assert (=> start!95334 (array_inv!25683 _keys!1070)))

(declare-fun b!1077074 () Bool)

(assert (=> b!1077074 (= e!615779 (bvsgt #b00000000000000000000000000000000 (size!33777 _keys!1070)))))

(declare-fun b!1077075 () Bool)

(assert (=> b!1077075 (= e!615782 tp_is_empty!26085)))

(assert (= (and start!95334 res!717725) b!1077072))

(assert (= (and b!1077072 res!717724) b!1077071))

(assert (= (and b!1077071 res!717726) b!1077074))

(assert (= (and b!1077073 condMapEmpty!40858) mapIsEmpty!40858))

(assert (= (and b!1077073 (not condMapEmpty!40858)) mapNonEmpty!40858))

(get-info :version)

(assert (= (and mapNonEmpty!40858 ((_ is ValueCellFull!12333) mapValue!40858)) b!1077070))

(assert (= (and b!1077073 ((_ is ValueCellFull!12333) mapDefault!40858)) b!1077075))

(assert (= start!95334 b!1077073))

(declare-fun m!996067 () Bool)

(assert (=> b!1077071 m!996067))

(declare-fun m!996069 () Bool)

(assert (=> mapNonEmpty!40858 m!996069))

(declare-fun m!996071 () Bool)

(assert (=> start!95334 m!996071))

(declare-fun m!996073 () Bool)

(assert (=> start!95334 m!996073))

(declare-fun m!996075 () Bool)

(assert (=> start!95334 m!996075))

(check-sat (not start!95334) (not b!1077071) (not mapNonEmpty!40858) tp_is_empty!26085)
(check-sat)
(get-model)

(declare-fun d!129805 () Bool)

(assert (=> d!129805 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95334 d!129805))

(declare-fun d!129807 () Bool)

(assert (=> d!129807 (= (array_inv!25682 _values!874) (bvsge (size!33778 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95334 d!129807))

(declare-fun d!129809 () Bool)

(assert (=> d!129809 (= (array_inv!25683 _keys!1070) (bvsge (size!33777 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95334 d!129809))

(declare-fun d!129811 () Bool)

(declare-fun res!717740 () Bool)

(declare-fun e!615807 () Bool)

(assert (=> d!129811 (=> res!717740 e!615807)))

(assert (=> d!129811 (= res!717740 (bvsge #b00000000000000000000000000000000 (size!33777 _keys!1070)))))

(assert (=> d!129811 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!615807)))

(declare-fun bm!45707 () Bool)

(declare-fun call!45710 () Bool)

(assert (=> bm!45707 (= call!45710 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1077102 () Bool)

(declare-fun e!615806 () Bool)

(assert (=> b!1077102 (= e!615807 e!615806)))

(declare-fun c!108304 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077102 (= c!108304 (validKeyInArray!0 (select (arr!33241 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077103 () Bool)

(assert (=> b!1077103 (= e!615806 call!45710)))

(declare-fun b!1077104 () Bool)

(declare-fun e!615805 () Bool)

(assert (=> b!1077104 (= e!615805 call!45710)))

(declare-fun b!1077105 () Bool)

(assert (=> b!1077105 (= e!615806 e!615805)))

(declare-fun lt!478507 () (_ BitVec 64))

(assert (=> b!1077105 (= lt!478507 (select (arr!33241 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35452 0))(
  ( (Unit!35453) )
))
(declare-fun lt!478506 () Unit!35452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69119 (_ BitVec 64) (_ BitVec 32)) Unit!35452)

(assert (=> b!1077105 (= lt!478506 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478507 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077105 (arrayContainsKey!0 _keys!1070 lt!478507 #b00000000000000000000000000000000)))

(declare-fun lt!478508 () Unit!35452)

(assert (=> b!1077105 (= lt!478508 lt!478506)))

(declare-fun res!717741 () Bool)

(declare-datatypes ((SeekEntryResult!9896 0))(
  ( (MissingZero!9896 (index!41955 (_ BitVec 32))) (Found!9896 (index!41956 (_ BitVec 32))) (Intermediate!9896 (undefined!10708 Bool) (index!41957 (_ BitVec 32)) (x!96539 (_ BitVec 32))) (Undefined!9896) (MissingVacant!9896 (index!41958 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69119 (_ BitVec 32)) SeekEntryResult!9896)

(assert (=> b!1077105 (= res!717741 (= (seekEntryOrOpen!0 (select (arr!33241 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9896 #b00000000000000000000000000000000)))))

(assert (=> b!1077105 (=> (not res!717741) (not e!615805))))

(assert (= (and d!129811 (not res!717740)) b!1077102))

(assert (= (and b!1077102 c!108304) b!1077105))

(assert (= (and b!1077102 (not c!108304)) b!1077103))

(assert (= (and b!1077105 res!717741) b!1077104))

(assert (= (or b!1077104 b!1077103) bm!45707))

(declare-fun m!996087 () Bool)

(assert (=> bm!45707 m!996087))

(declare-fun m!996089 () Bool)

(assert (=> b!1077102 m!996089))

(assert (=> b!1077102 m!996089))

(declare-fun m!996091 () Bool)

(assert (=> b!1077102 m!996091))

(assert (=> b!1077105 m!996089))

(declare-fun m!996093 () Bool)

(assert (=> b!1077105 m!996093))

(declare-fun m!996095 () Bool)

(assert (=> b!1077105 m!996095))

(assert (=> b!1077105 m!996089))

(declare-fun m!996097 () Bool)

(assert (=> b!1077105 m!996097))

(assert (=> b!1077071 d!129811))

(declare-fun condMapEmpty!40864 () Bool)

(declare-fun mapDefault!40864 () ValueCell!12333)

(assert (=> mapNonEmpty!40858 (= condMapEmpty!40864 (= mapRest!40858 ((as const (Array (_ BitVec 32) ValueCell!12333)) mapDefault!40864)))))

(declare-fun e!615812 () Bool)

(declare-fun mapRes!40864 () Bool)

(assert (=> mapNonEmpty!40858 (= tp!78320 (and e!615812 mapRes!40864))))

(declare-fun mapIsEmpty!40864 () Bool)

(assert (=> mapIsEmpty!40864 mapRes!40864))

(declare-fun b!1077113 () Bool)

(assert (=> b!1077113 (= e!615812 tp_is_empty!26085)))

(declare-fun b!1077112 () Bool)

(declare-fun e!615813 () Bool)

(assert (=> b!1077112 (= e!615813 tp_is_empty!26085)))

(declare-fun mapNonEmpty!40864 () Bool)

(declare-fun tp!78326 () Bool)

(assert (=> mapNonEmpty!40864 (= mapRes!40864 (and tp!78326 e!615813))))

(declare-fun mapValue!40864 () ValueCell!12333)

(declare-fun mapKey!40864 () (_ BitVec 32))

(declare-fun mapRest!40864 () (Array (_ BitVec 32) ValueCell!12333))

(assert (=> mapNonEmpty!40864 (= mapRest!40858 (store mapRest!40864 mapKey!40864 mapValue!40864))))

(assert (= (and mapNonEmpty!40858 condMapEmpty!40864) mapIsEmpty!40864))

(assert (= (and mapNonEmpty!40858 (not condMapEmpty!40864)) mapNonEmpty!40864))

(assert (= (and mapNonEmpty!40864 ((_ is ValueCellFull!12333) mapValue!40864)) b!1077112))

(assert (= (and mapNonEmpty!40858 ((_ is ValueCellFull!12333) mapDefault!40864)) b!1077113))

(declare-fun m!996099 () Bool)

(assert (=> mapNonEmpty!40864 m!996099))

(check-sat (not b!1077105) (not mapNonEmpty!40864) tp_is_empty!26085 (not b!1077102) (not bm!45707))
(check-sat)
