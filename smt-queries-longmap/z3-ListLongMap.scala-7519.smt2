; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95348 () Bool)

(assert start!95348)

(declare-fun mapIsEmpty!40870 () Bool)

(declare-fun mapRes!40870 () Bool)

(assert (=> mapIsEmpty!40870 mapRes!40870))

(declare-fun b!1077144 () Bool)

(declare-fun e!615843 () Bool)

(declare-datatypes ((array!69129 0))(
  ( (array!69130 (arr!33245 (Array (_ BitVec 32) (_ BitVec 64))) (size!33781 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69129)

(assert (=> b!1077144 (= e!615843 (and (bvsle #b00000000000000000000000000000000 (size!33781 _keys!1070)) (bvsge (size!33781 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!40870 () Bool)

(declare-fun tp!78332 () Bool)

(declare-fun e!615842 () Bool)

(assert (=> mapNonEmpty!40870 (= mapRes!40870 (and tp!78332 e!615842))))

(declare-datatypes ((V!39915 0))(
  ( (V!39916 (val!13102 Int)) )
))
(declare-datatypes ((ValueCell!12336 0))(
  ( (ValueCellFull!12336 (v!15721 V!39915)) (EmptyCell!12336) )
))
(declare-datatypes ((array!69131 0))(
  ( (array!69132 (arr!33246 (Array (_ BitVec 32) ValueCell!12336)) (size!33782 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69131)

(declare-fun mapKey!40870 () (_ BitVec 32))

(declare-fun mapValue!40870 () ValueCell!12336)

(declare-fun mapRest!40870 () (Array (_ BitVec 32) ValueCell!12336))

(assert (=> mapNonEmpty!40870 (= (arr!33246 _values!874) (store mapRest!40870 mapKey!40870 mapValue!40870))))

(declare-fun b!1077145 () Bool)

(declare-fun tp_is_empty!26091 () Bool)

(assert (=> b!1077145 (= e!615842 tp_is_empty!26091)))

(declare-fun b!1077146 () Bool)

(declare-fun res!717758 () Bool)

(assert (=> b!1077146 (=> (not res!717758) (not e!615843))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69129 (_ BitVec 32)) Bool)

(assert (=> b!1077146 (= res!717758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!717759 () Bool)

(assert (=> start!95348 (=> (not res!717759) (not e!615843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95348 (= res!717759 (validMask!0 mask!1414))))

(assert (=> start!95348 e!615843))

(assert (=> start!95348 true))

(declare-fun e!615841 () Bool)

(declare-fun array_inv!25684 (array!69131) Bool)

(assert (=> start!95348 (and (array_inv!25684 _values!874) e!615841)))

(declare-fun array_inv!25685 (array!69129) Bool)

(assert (=> start!95348 (array_inv!25685 _keys!1070)))

(declare-fun b!1077147 () Bool)

(declare-fun res!717757 () Bool)

(assert (=> b!1077147 (=> (not res!717757) (not e!615843))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077147 (= res!717757 (and (= (size!33782 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33781 _keys!1070) (size!33782 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077148 () Bool)

(declare-fun e!615840 () Bool)

(assert (=> b!1077148 (= e!615841 (and e!615840 mapRes!40870))))

(declare-fun condMapEmpty!40870 () Bool)

(declare-fun mapDefault!40870 () ValueCell!12336)

(assert (=> b!1077148 (= condMapEmpty!40870 (= (arr!33246 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12336)) mapDefault!40870)))))

(declare-fun b!1077149 () Bool)

(assert (=> b!1077149 (= e!615840 tp_is_empty!26091)))

(assert (= (and start!95348 res!717759) b!1077147))

(assert (= (and b!1077147 res!717757) b!1077146))

(assert (= (and b!1077146 res!717758) b!1077144))

(assert (= (and b!1077148 condMapEmpty!40870) mapIsEmpty!40870))

(assert (= (and b!1077148 (not condMapEmpty!40870)) mapNonEmpty!40870))

(get-info :version)

(assert (= (and mapNonEmpty!40870 ((_ is ValueCellFull!12336) mapValue!40870)) b!1077145))

(assert (= (and b!1077148 ((_ is ValueCellFull!12336) mapDefault!40870)) b!1077149))

(assert (= start!95348 b!1077148))

(declare-fun m!996111 () Bool)

(assert (=> mapNonEmpty!40870 m!996111))

(declare-fun m!996113 () Bool)

(assert (=> b!1077146 m!996113))

(declare-fun m!996115 () Bool)

(assert (=> start!95348 m!996115))

(declare-fun m!996117 () Bool)

(assert (=> start!95348 m!996117))

(declare-fun m!996119 () Bool)

(assert (=> start!95348 m!996119))

(check-sat (not b!1077146) (not start!95348) (not mapNonEmpty!40870) tp_is_empty!26091)
(check-sat)
(get-model)

(declare-fun b!1077176 () Bool)

(declare-fun e!615866 () Bool)

(declare-fun e!615865 () Bool)

(assert (=> b!1077176 (= e!615866 e!615865)))

(declare-fun lt!478515 () (_ BitVec 64))

(assert (=> b!1077176 (= lt!478515 (select (arr!33245 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35454 0))(
  ( (Unit!35455) )
))
(declare-fun lt!478517 () Unit!35454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69129 (_ BitVec 64) (_ BitVec 32)) Unit!35454)

(assert (=> b!1077176 (= lt!478517 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478515 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077176 (arrayContainsKey!0 _keys!1070 lt!478515 #b00000000000000000000000000000000)))

(declare-fun lt!478516 () Unit!35454)

(assert (=> b!1077176 (= lt!478516 lt!478517)))

(declare-fun res!717773 () Bool)

(declare-datatypes ((SeekEntryResult!9897 0))(
  ( (MissingZero!9897 (index!41959 (_ BitVec 32))) (Found!9897 (index!41960 (_ BitVec 32))) (Intermediate!9897 (undefined!10709 Bool) (index!41961 (_ BitVec 32)) (x!96550 (_ BitVec 32))) (Undefined!9897) (MissingVacant!9897 (index!41962 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69129 (_ BitVec 32)) SeekEntryResult!9897)

(assert (=> b!1077176 (= res!717773 (= (seekEntryOrOpen!0 (select (arr!33245 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9897 #b00000000000000000000000000000000)))))

(assert (=> b!1077176 (=> (not res!717773) (not e!615865))))

(declare-fun b!1077177 () Bool)

(declare-fun e!615867 () Bool)

(assert (=> b!1077177 (= e!615867 e!615866)))

(declare-fun c!108307 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077177 (= c!108307 (validKeyInArray!0 (select (arr!33245 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45710 () Bool)

(declare-fun call!45713 () Bool)

(assert (=> bm!45710 (= call!45713 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1077178 () Bool)

(assert (=> b!1077178 (= e!615865 call!45713)))

(declare-fun b!1077179 () Bool)

(assert (=> b!1077179 (= e!615866 call!45713)))

(declare-fun d!129815 () Bool)

(declare-fun res!717774 () Bool)

(assert (=> d!129815 (=> res!717774 e!615867)))

(assert (=> d!129815 (= res!717774 (bvsge #b00000000000000000000000000000000 (size!33781 _keys!1070)))))

(assert (=> d!129815 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!615867)))

(assert (= (and d!129815 (not res!717774)) b!1077177))

(assert (= (and b!1077177 c!108307) b!1077176))

(assert (= (and b!1077177 (not c!108307)) b!1077179))

(assert (= (and b!1077176 res!717773) b!1077178))

(assert (= (or b!1077178 b!1077179) bm!45710))

(declare-fun m!996131 () Bool)

(assert (=> b!1077176 m!996131))

(declare-fun m!996133 () Bool)

(assert (=> b!1077176 m!996133))

(declare-fun m!996135 () Bool)

(assert (=> b!1077176 m!996135))

(assert (=> b!1077176 m!996131))

(declare-fun m!996137 () Bool)

(assert (=> b!1077176 m!996137))

(assert (=> b!1077177 m!996131))

(assert (=> b!1077177 m!996131))

(declare-fun m!996139 () Bool)

(assert (=> b!1077177 m!996139))

(declare-fun m!996141 () Bool)

(assert (=> bm!45710 m!996141))

(assert (=> b!1077146 d!129815))

(declare-fun d!129817 () Bool)

(assert (=> d!129817 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95348 d!129817))

(declare-fun d!129819 () Bool)

(assert (=> d!129819 (= (array_inv!25684 _values!874) (bvsge (size!33782 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95348 d!129819))

(declare-fun d!129821 () Bool)

(assert (=> d!129821 (= (array_inv!25685 _keys!1070) (bvsge (size!33781 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95348 d!129821))

(declare-fun b!1077186 () Bool)

(declare-fun e!615873 () Bool)

(assert (=> b!1077186 (= e!615873 tp_is_empty!26091)))

(declare-fun condMapEmpty!40876 () Bool)

(declare-fun mapDefault!40876 () ValueCell!12336)

(assert (=> mapNonEmpty!40870 (= condMapEmpty!40876 (= mapRest!40870 ((as const (Array (_ BitVec 32) ValueCell!12336)) mapDefault!40876)))))

(declare-fun e!615872 () Bool)

(declare-fun mapRes!40876 () Bool)

(assert (=> mapNonEmpty!40870 (= tp!78332 (and e!615872 mapRes!40876))))

(declare-fun mapIsEmpty!40876 () Bool)

(assert (=> mapIsEmpty!40876 mapRes!40876))

(declare-fun mapNonEmpty!40876 () Bool)

(declare-fun tp!78338 () Bool)

(assert (=> mapNonEmpty!40876 (= mapRes!40876 (and tp!78338 e!615873))))

(declare-fun mapKey!40876 () (_ BitVec 32))

(declare-fun mapRest!40876 () (Array (_ BitVec 32) ValueCell!12336))

(declare-fun mapValue!40876 () ValueCell!12336)

(assert (=> mapNonEmpty!40876 (= mapRest!40870 (store mapRest!40876 mapKey!40876 mapValue!40876))))

(declare-fun b!1077187 () Bool)

(assert (=> b!1077187 (= e!615872 tp_is_empty!26091)))

(assert (= (and mapNonEmpty!40870 condMapEmpty!40876) mapIsEmpty!40876))

(assert (= (and mapNonEmpty!40870 (not condMapEmpty!40876)) mapNonEmpty!40876))

(assert (= (and mapNonEmpty!40876 ((_ is ValueCellFull!12336) mapValue!40876)) b!1077186))

(assert (= (and mapNonEmpty!40870 ((_ is ValueCellFull!12336) mapDefault!40876)) b!1077187))

(declare-fun m!996143 () Bool)

(assert (=> mapNonEmpty!40876 m!996143))

(check-sat tp_is_empty!26091 (not bm!45710) (not b!1077177) (not b!1077176) (not mapNonEmpty!40876))
(check-sat)
