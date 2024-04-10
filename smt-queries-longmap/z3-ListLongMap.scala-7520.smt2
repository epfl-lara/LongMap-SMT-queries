; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95362 () Bool)

(assert start!95362)

(declare-fun b!1077223 () Bool)

(declare-fun res!717798 () Bool)

(declare-fun e!615903 () Bool)

(assert (=> b!1077223 (=> (not res!717798) (not e!615903))))

(declare-datatypes ((array!69143 0))(
  ( (array!69144 (arr!33251 (Array (_ BitVec 32) (_ BitVec 64))) (size!33787 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69143)

(assert (=> b!1077223 (= res!717798 (and (bvsle #b00000000000000000000000000000000 (size!33787 _keys!1070)) (bvslt (size!33787 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1077224 () Bool)

(declare-datatypes ((List!23214 0))(
  ( (Nil!23211) (Cons!23210 (h!24419 (_ BitVec 64)) (t!32573 List!23214)) )
))
(declare-fun noDuplicate!1573 (List!23214) Bool)

(assert (=> b!1077224 (= e!615903 (not (noDuplicate!1573 Nil!23211)))))

(declare-fun mapIsEmpty!40882 () Bool)

(declare-fun mapRes!40882 () Bool)

(assert (=> mapIsEmpty!40882 mapRes!40882))

(declare-fun b!1077225 () Bool)

(declare-fun res!717797 () Bool)

(assert (=> b!1077225 (=> (not res!717797) (not e!615903))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69143 (_ BitVec 32)) Bool)

(assert (=> b!1077225 (= res!717797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077226 () Bool)

(declare-fun res!717796 () Bool)

(assert (=> b!1077226 (=> (not res!717796) (not e!615903))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!39923 0))(
  ( (V!39924 (val!13105 Int)) )
))
(declare-datatypes ((ValueCell!12339 0))(
  ( (ValueCellFull!12339 (v!15724 V!39923)) (EmptyCell!12339) )
))
(declare-datatypes ((array!69145 0))(
  ( (array!69146 (arr!33252 (Array (_ BitVec 32) ValueCell!12339)) (size!33788 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69145)

(assert (=> b!1077226 (= res!717796 (and (= (size!33788 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33787 _keys!1070) (size!33788 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077227 () Bool)

(declare-fun e!615902 () Bool)

(declare-fun tp_is_empty!26097 () Bool)

(assert (=> b!1077227 (= e!615902 tp_is_empty!26097)))

(declare-fun b!1077228 () Bool)

(declare-fun e!615899 () Bool)

(assert (=> b!1077228 (= e!615899 tp_is_empty!26097)))

(declare-fun res!717795 () Bool)

(assert (=> start!95362 (=> (not res!717795) (not e!615903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95362 (= res!717795 (validMask!0 mask!1414))))

(assert (=> start!95362 e!615903))

(assert (=> start!95362 true))

(declare-fun e!615901 () Bool)

(declare-fun array_inv!25688 (array!69145) Bool)

(assert (=> start!95362 (and (array_inv!25688 _values!874) e!615901)))

(declare-fun array_inv!25689 (array!69143) Bool)

(assert (=> start!95362 (array_inv!25689 _keys!1070)))

(declare-fun b!1077229 () Bool)

(assert (=> b!1077229 (= e!615901 (and e!615899 mapRes!40882))))

(declare-fun condMapEmpty!40882 () Bool)

(declare-fun mapDefault!40882 () ValueCell!12339)

(assert (=> b!1077229 (= condMapEmpty!40882 (= (arr!33252 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12339)) mapDefault!40882)))))

(declare-fun mapNonEmpty!40882 () Bool)

(declare-fun tp!78344 () Bool)

(assert (=> mapNonEmpty!40882 (= mapRes!40882 (and tp!78344 e!615902))))

(declare-fun mapKey!40882 () (_ BitVec 32))

(declare-fun mapValue!40882 () ValueCell!12339)

(declare-fun mapRest!40882 () (Array (_ BitVec 32) ValueCell!12339))

(assert (=> mapNonEmpty!40882 (= (arr!33252 _values!874) (store mapRest!40882 mapKey!40882 mapValue!40882))))

(assert (= (and start!95362 res!717795) b!1077226))

(assert (= (and b!1077226 res!717796) b!1077225))

(assert (= (and b!1077225 res!717797) b!1077223))

(assert (= (and b!1077223 res!717798) b!1077224))

(assert (= (and b!1077229 condMapEmpty!40882) mapIsEmpty!40882))

(assert (= (and b!1077229 (not condMapEmpty!40882)) mapNonEmpty!40882))

(get-info :version)

(assert (= (and mapNonEmpty!40882 ((_ is ValueCellFull!12339) mapValue!40882)) b!1077227))

(assert (= (and b!1077229 ((_ is ValueCellFull!12339) mapDefault!40882)) b!1077228))

(assert (= start!95362 b!1077229))

(declare-fun m!996157 () Bool)

(assert (=> b!1077224 m!996157))

(declare-fun m!996159 () Bool)

(assert (=> b!1077225 m!996159))

(declare-fun m!996161 () Bool)

(assert (=> start!95362 m!996161))

(declare-fun m!996163 () Bool)

(assert (=> start!95362 m!996163))

(declare-fun m!996165 () Bool)

(assert (=> start!95362 m!996165))

(declare-fun m!996167 () Bool)

(assert (=> mapNonEmpty!40882 m!996167))

(check-sat (not mapNonEmpty!40882) (not b!1077224) (not b!1077225) tp_is_empty!26097 (not start!95362))
(check-sat)
(get-model)

(declare-fun d!129825 () Bool)

(declare-fun res!717815 () Bool)

(declare-fun e!615923 () Bool)

(assert (=> d!129825 (=> res!717815 e!615923)))

(assert (=> d!129825 (= res!717815 ((_ is Nil!23211) Nil!23211))))

(assert (=> d!129825 (= (noDuplicate!1573 Nil!23211) e!615923)))

(declare-fun b!1077255 () Bool)

(declare-fun e!615924 () Bool)

(assert (=> b!1077255 (= e!615923 e!615924)))

(declare-fun res!717816 () Bool)

(assert (=> b!1077255 (=> (not res!717816) (not e!615924))))

(declare-fun contains!6366 (List!23214 (_ BitVec 64)) Bool)

(assert (=> b!1077255 (= res!717816 (not (contains!6366 (t!32573 Nil!23211) (h!24419 Nil!23211))))))

(declare-fun b!1077256 () Bool)

(assert (=> b!1077256 (= e!615924 (noDuplicate!1573 (t!32573 Nil!23211)))))

(assert (= (and d!129825 (not res!717815)) b!1077255))

(assert (= (and b!1077255 res!717816) b!1077256))

(declare-fun m!996181 () Bool)

(assert (=> b!1077255 m!996181))

(declare-fun m!996183 () Bool)

(assert (=> b!1077256 m!996183))

(assert (=> b!1077224 d!129825))

(declare-fun b!1077265 () Bool)

(declare-fun e!615932 () Bool)

(declare-fun call!45716 () Bool)

(assert (=> b!1077265 (= e!615932 call!45716)))

(declare-fun d!129827 () Bool)

(declare-fun res!717821 () Bool)

(declare-fun e!615933 () Bool)

(assert (=> d!129827 (=> res!717821 e!615933)))

(assert (=> d!129827 (= res!717821 (bvsge #b00000000000000000000000000000000 (size!33787 _keys!1070)))))

(assert (=> d!129827 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!615933)))

(declare-fun b!1077266 () Bool)

(declare-fun e!615931 () Bool)

(assert (=> b!1077266 (= e!615931 call!45716)))

(declare-fun b!1077267 () Bool)

(assert (=> b!1077267 (= e!615933 e!615931)))

(declare-fun c!108310 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077267 (= c!108310 (validKeyInArray!0 (select (arr!33251 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45713 () Bool)

(assert (=> bm!45713 (= call!45716 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1077268 () Bool)

(assert (=> b!1077268 (= e!615931 e!615932)))

(declare-fun lt!478525 () (_ BitVec 64))

(assert (=> b!1077268 (= lt!478525 (select (arr!33251 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35456 0))(
  ( (Unit!35457) )
))
(declare-fun lt!478524 () Unit!35456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69143 (_ BitVec 64) (_ BitVec 32)) Unit!35456)

(assert (=> b!1077268 (= lt!478524 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478525 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077268 (arrayContainsKey!0 _keys!1070 lt!478525 #b00000000000000000000000000000000)))

(declare-fun lt!478526 () Unit!35456)

(assert (=> b!1077268 (= lt!478526 lt!478524)))

(declare-fun res!717822 () Bool)

(declare-datatypes ((SeekEntryResult!9898 0))(
  ( (MissingZero!9898 (index!41963 (_ BitVec 32))) (Found!9898 (index!41964 (_ BitVec 32))) (Intermediate!9898 (undefined!10710 Bool) (index!41965 (_ BitVec 32)) (x!96561 (_ BitVec 32))) (Undefined!9898) (MissingVacant!9898 (index!41966 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69143 (_ BitVec 32)) SeekEntryResult!9898)

(assert (=> b!1077268 (= res!717822 (= (seekEntryOrOpen!0 (select (arr!33251 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9898 #b00000000000000000000000000000000)))))

(assert (=> b!1077268 (=> (not res!717822) (not e!615932))))

(assert (= (and d!129827 (not res!717821)) b!1077267))

(assert (= (and b!1077267 c!108310) b!1077268))

(assert (= (and b!1077267 (not c!108310)) b!1077266))

(assert (= (and b!1077268 res!717822) b!1077265))

(assert (= (or b!1077265 b!1077266) bm!45713))

(declare-fun m!996185 () Bool)

(assert (=> b!1077267 m!996185))

(assert (=> b!1077267 m!996185))

(declare-fun m!996187 () Bool)

(assert (=> b!1077267 m!996187))

(declare-fun m!996189 () Bool)

(assert (=> bm!45713 m!996189))

(assert (=> b!1077268 m!996185))

(declare-fun m!996191 () Bool)

(assert (=> b!1077268 m!996191))

(declare-fun m!996193 () Bool)

(assert (=> b!1077268 m!996193))

(assert (=> b!1077268 m!996185))

(declare-fun m!996195 () Bool)

(assert (=> b!1077268 m!996195))

(assert (=> b!1077225 d!129827))

(declare-fun d!129829 () Bool)

(assert (=> d!129829 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95362 d!129829))

(declare-fun d!129831 () Bool)

(assert (=> d!129831 (= (array_inv!25688 _values!874) (bvsge (size!33788 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95362 d!129831))

(declare-fun d!129833 () Bool)

(assert (=> d!129833 (= (array_inv!25689 _keys!1070) (bvsge (size!33787 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95362 d!129833))

(declare-fun condMapEmpty!40888 () Bool)

(declare-fun mapDefault!40888 () ValueCell!12339)

(assert (=> mapNonEmpty!40882 (= condMapEmpty!40888 (= mapRest!40882 ((as const (Array (_ BitVec 32) ValueCell!12339)) mapDefault!40888)))))

(declare-fun e!615939 () Bool)

(declare-fun mapRes!40888 () Bool)

(assert (=> mapNonEmpty!40882 (= tp!78344 (and e!615939 mapRes!40888))))

(declare-fun mapNonEmpty!40888 () Bool)

(declare-fun tp!78350 () Bool)

(declare-fun e!615938 () Bool)

(assert (=> mapNonEmpty!40888 (= mapRes!40888 (and tp!78350 e!615938))))

(declare-fun mapRest!40888 () (Array (_ BitVec 32) ValueCell!12339))

(declare-fun mapKey!40888 () (_ BitVec 32))

(declare-fun mapValue!40888 () ValueCell!12339)

(assert (=> mapNonEmpty!40888 (= mapRest!40882 (store mapRest!40888 mapKey!40888 mapValue!40888))))

(declare-fun mapIsEmpty!40888 () Bool)

(assert (=> mapIsEmpty!40888 mapRes!40888))

(declare-fun b!1077276 () Bool)

(assert (=> b!1077276 (= e!615939 tp_is_empty!26097)))

(declare-fun b!1077275 () Bool)

(assert (=> b!1077275 (= e!615938 tp_is_empty!26097)))

(assert (= (and mapNonEmpty!40882 condMapEmpty!40888) mapIsEmpty!40888))

(assert (= (and mapNonEmpty!40882 (not condMapEmpty!40888)) mapNonEmpty!40888))

(assert (= (and mapNonEmpty!40888 ((_ is ValueCellFull!12339) mapValue!40888)) b!1077275))

(assert (= (and mapNonEmpty!40882 ((_ is ValueCellFull!12339) mapDefault!40888)) b!1077276))

(declare-fun m!996197 () Bool)

(assert (=> mapNonEmpty!40888 m!996197))

(check-sat (not b!1077255) (not b!1077256) (not bm!45713) (not b!1077268) tp_is_empty!26097 (not mapNonEmpty!40888) (not b!1077267))
(check-sat)
