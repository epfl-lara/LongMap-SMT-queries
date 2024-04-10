; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20378 () Bool)

(assert start!20378)

(declare-fun b_free!5037 () Bool)

(declare-fun b_next!5037 () Bool)

(assert (=> start!20378 (= b_free!5037 (not b_next!5037))))

(declare-fun tp!18142 () Bool)

(declare-fun b_and!11783 () Bool)

(assert (=> start!20378 (= tp!18142 b_and!11783)))

(declare-fun b!201294 () Bool)

(declare-fun res!96147 () Bool)

(declare-fun e!131938 () Bool)

(assert (=> b!201294 (=> (not res!96147) (not e!131938))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9015 0))(
  ( (array!9016 (arr!4258 (Array (_ BitVec 32) (_ BitVec 64))) (size!4583 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9015)

(assert (=> b!201294 (= res!96147 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4583 _keys!825))))))

(declare-fun b!201295 () Bool)

(declare-fun e!131940 () Bool)

(assert (=> b!201295 (= e!131938 (not e!131940))))

(declare-fun res!96145 () Bool)

(assert (=> b!201295 (=> res!96145 e!131940)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201295 (= res!96145 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6171 0))(
  ( (V!6172 (val!2491 Int)) )
))
(declare-datatypes ((tuple2!3770 0))(
  ( (tuple2!3771 (_1!1896 (_ BitVec 64)) (_2!1896 V!6171)) )
))
(declare-datatypes ((List!2685 0))(
  ( (Nil!2682) (Cons!2681 (h!3323 tuple2!3770) (t!7616 List!2685)) )
))
(declare-datatypes ((ListLongMap!2683 0))(
  ( (ListLongMap!2684 (toList!1357 List!2685)) )
))
(declare-fun lt!100187 () ListLongMap!2683)

(declare-datatypes ((ValueCell!2103 0))(
  ( (ValueCellFull!2103 (v!4461 V!6171)) (EmptyCell!2103) )
))
(declare-datatypes ((array!9017 0))(
  ( (array!9018 (arr!4259 (Array (_ BitVec 32) ValueCell!2103)) (size!4584 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9017)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6171)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6171)

(declare-fun getCurrentListMap!946 (array!9015 array!9017 (_ BitVec 32) (_ BitVec 32) V!6171 V!6171 (_ BitVec 32) Int) ListLongMap!2683)

(assert (=> b!201295 (= lt!100187 (getCurrentListMap!946 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100178 () ListLongMap!2683)

(declare-fun lt!100184 () array!9017)

(assert (=> b!201295 (= lt!100178 (getCurrentListMap!946 _keys!825 lt!100184 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100185 () ListLongMap!2683)

(declare-fun lt!100183 () ListLongMap!2683)

(assert (=> b!201295 (and (= lt!100185 lt!100183) (= lt!100183 lt!100185))))

(declare-fun lt!100191 () ListLongMap!2683)

(declare-fun lt!100188 () tuple2!3770)

(declare-fun +!384 (ListLongMap!2683 tuple2!3770) ListLongMap!2683)

(assert (=> b!201295 (= lt!100183 (+!384 lt!100191 lt!100188))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6171)

(assert (=> b!201295 (= lt!100188 (tuple2!3771 k0!843 v!520))))

(declare-datatypes ((Unit!6068 0))(
  ( (Unit!6069) )
))
(declare-fun lt!100186 () Unit!6068)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!59 (array!9015 array!9017 (_ BitVec 32) (_ BitVec 32) V!6171 V!6171 (_ BitVec 32) (_ BitVec 64) V!6171 (_ BitVec 32) Int) Unit!6068)

(assert (=> b!201295 (= lt!100186 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!59 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!320 (array!9015 array!9017 (_ BitVec 32) (_ BitVec 32) V!6171 V!6171 (_ BitVec 32) Int) ListLongMap!2683)

(assert (=> b!201295 (= lt!100185 (getCurrentListMapNoExtraKeys!320 _keys!825 lt!100184 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201295 (= lt!100184 (array!9018 (store (arr!4259 _values!649) i!601 (ValueCellFull!2103 v!520)) (size!4584 _values!649)))))

(assert (=> b!201295 (= lt!100191 (getCurrentListMapNoExtraKeys!320 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201296 () Bool)

(declare-fun e!131936 () Bool)

(declare-fun tp_is_empty!4893 () Bool)

(assert (=> b!201296 (= e!131936 tp_is_empty!4893)))

(declare-fun mapIsEmpty!8408 () Bool)

(declare-fun mapRes!8408 () Bool)

(assert (=> mapIsEmpty!8408 mapRes!8408))

(declare-fun b!201297 () Bool)

(declare-fun res!96146 () Bool)

(assert (=> b!201297 (=> (not res!96146) (not e!131938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9015 (_ BitVec 32)) Bool)

(assert (=> b!201297 (= res!96146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201298 () Bool)

(declare-fun e!131941 () Bool)

(assert (=> b!201298 (= e!131940 e!131941)))

(declare-fun res!96150 () Bool)

(assert (=> b!201298 (=> res!96150 e!131941)))

(assert (=> b!201298 (= res!96150 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100180 () ListLongMap!2683)

(declare-fun lt!100176 () ListLongMap!2683)

(assert (=> b!201298 (= lt!100180 lt!100176)))

(declare-fun lt!100177 () ListLongMap!2683)

(assert (=> b!201298 (= lt!100176 (+!384 lt!100177 lt!100188))))

(declare-fun lt!100179 () Unit!6068)

(declare-fun addCommutativeForDiffKeys!105 (ListLongMap!2683 (_ BitVec 64) V!6171 (_ BitVec 64) V!6171) Unit!6068)

(assert (=> b!201298 (= lt!100179 (addCommutativeForDiffKeys!105 lt!100191 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100189 () tuple2!3770)

(assert (=> b!201298 (= lt!100178 (+!384 lt!100180 lt!100189))))

(declare-fun lt!100190 () tuple2!3770)

(assert (=> b!201298 (= lt!100180 (+!384 lt!100183 lt!100190))))

(declare-fun lt!100182 () ListLongMap!2683)

(assert (=> b!201298 (= lt!100187 lt!100182)))

(assert (=> b!201298 (= lt!100182 (+!384 lt!100177 lt!100189))))

(assert (=> b!201298 (= lt!100177 (+!384 lt!100191 lt!100190))))

(assert (=> b!201298 (= lt!100178 (+!384 (+!384 lt!100185 lt!100190) lt!100189))))

(assert (=> b!201298 (= lt!100189 (tuple2!3771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201298 (= lt!100190 (tuple2!3771 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201299 () Bool)

(declare-fun res!96144 () Bool)

(assert (=> b!201299 (=> (not res!96144) (not e!131938))))

(assert (=> b!201299 (= res!96144 (= (select (arr!4258 _keys!825) i!601) k0!843))))

(declare-fun b!201300 () Bool)

(declare-fun res!96148 () Bool)

(assert (=> b!201300 (=> (not res!96148) (not e!131938))))

(declare-datatypes ((List!2686 0))(
  ( (Nil!2683) (Cons!2682 (h!3324 (_ BitVec 64)) (t!7617 List!2686)) )
))
(declare-fun arrayNoDuplicates!0 (array!9015 (_ BitVec 32) List!2686) Bool)

(assert (=> b!201300 (= res!96148 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2683))))

(declare-fun b!201301 () Bool)

(declare-fun e!131942 () Bool)

(assert (=> b!201301 (= e!131942 tp_is_empty!4893)))

(declare-fun b!201302 () Bool)

(declare-fun e!131939 () Bool)

(assert (=> b!201302 (= e!131939 (and e!131936 mapRes!8408))))

(declare-fun condMapEmpty!8408 () Bool)

(declare-fun mapDefault!8408 () ValueCell!2103)

(assert (=> b!201302 (= condMapEmpty!8408 (= (arr!4259 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2103)) mapDefault!8408)))))

(declare-fun b!201303 () Bool)

(assert (=> b!201303 (= e!131941 (bvsle #b00000000000000000000000000000000 (size!4583 _keys!825)))))

(assert (=> b!201303 (= (+!384 lt!100176 lt!100189) (+!384 lt!100182 lt!100188))))

(declare-fun lt!100181 () Unit!6068)

(assert (=> b!201303 (= lt!100181 (addCommutativeForDiffKeys!105 lt!100177 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201304 () Bool)

(declare-fun res!96151 () Bool)

(assert (=> b!201304 (=> (not res!96151) (not e!131938))))

(assert (=> b!201304 (= res!96151 (and (= (size!4584 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4583 _keys!825) (size!4584 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!96149 () Bool)

(assert (=> start!20378 (=> (not res!96149) (not e!131938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20378 (= res!96149 (validMask!0 mask!1149))))

(assert (=> start!20378 e!131938))

(declare-fun array_inv!2807 (array!9017) Bool)

(assert (=> start!20378 (and (array_inv!2807 _values!649) e!131939)))

(assert (=> start!20378 true))

(assert (=> start!20378 tp_is_empty!4893))

(declare-fun array_inv!2808 (array!9015) Bool)

(assert (=> start!20378 (array_inv!2808 _keys!825)))

(assert (=> start!20378 tp!18142))

(declare-fun b!201305 () Bool)

(declare-fun res!96143 () Bool)

(assert (=> b!201305 (=> (not res!96143) (not e!131938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201305 (= res!96143 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8408 () Bool)

(declare-fun tp!18143 () Bool)

(assert (=> mapNonEmpty!8408 (= mapRes!8408 (and tp!18143 e!131942))))

(declare-fun mapValue!8408 () ValueCell!2103)

(declare-fun mapKey!8408 () (_ BitVec 32))

(declare-fun mapRest!8408 () (Array (_ BitVec 32) ValueCell!2103))

(assert (=> mapNonEmpty!8408 (= (arr!4259 _values!649) (store mapRest!8408 mapKey!8408 mapValue!8408))))

(assert (= (and start!20378 res!96149) b!201304))

(assert (= (and b!201304 res!96151) b!201297))

(assert (= (and b!201297 res!96146) b!201300))

(assert (= (and b!201300 res!96148) b!201294))

(assert (= (and b!201294 res!96147) b!201305))

(assert (= (and b!201305 res!96143) b!201299))

(assert (= (and b!201299 res!96144) b!201295))

(assert (= (and b!201295 (not res!96145)) b!201298))

(assert (= (and b!201298 (not res!96150)) b!201303))

(assert (= (and b!201302 condMapEmpty!8408) mapIsEmpty!8408))

(assert (= (and b!201302 (not condMapEmpty!8408)) mapNonEmpty!8408))

(get-info :version)

(assert (= (and mapNonEmpty!8408 ((_ is ValueCellFull!2103) mapValue!8408)) b!201301))

(assert (= (and b!201302 ((_ is ValueCellFull!2103) mapDefault!8408)) b!201296))

(assert (= start!20378 b!201302))

(declare-fun m!228155 () Bool)

(assert (=> start!20378 m!228155))

(declare-fun m!228157 () Bool)

(assert (=> start!20378 m!228157))

(declare-fun m!228159 () Bool)

(assert (=> start!20378 m!228159))

(declare-fun m!228161 () Bool)

(assert (=> b!201295 m!228161))

(declare-fun m!228163 () Bool)

(assert (=> b!201295 m!228163))

(declare-fun m!228165 () Bool)

(assert (=> b!201295 m!228165))

(declare-fun m!228167 () Bool)

(assert (=> b!201295 m!228167))

(declare-fun m!228169 () Bool)

(assert (=> b!201295 m!228169))

(declare-fun m!228171 () Bool)

(assert (=> b!201295 m!228171))

(declare-fun m!228173 () Bool)

(assert (=> b!201295 m!228173))

(declare-fun m!228175 () Bool)

(assert (=> b!201298 m!228175))

(declare-fun m!228177 () Bool)

(assert (=> b!201298 m!228177))

(declare-fun m!228179 () Bool)

(assert (=> b!201298 m!228179))

(assert (=> b!201298 m!228179))

(declare-fun m!228181 () Bool)

(assert (=> b!201298 m!228181))

(declare-fun m!228183 () Bool)

(assert (=> b!201298 m!228183))

(declare-fun m!228185 () Bool)

(assert (=> b!201298 m!228185))

(declare-fun m!228187 () Bool)

(assert (=> b!201298 m!228187))

(declare-fun m!228189 () Bool)

(assert (=> b!201298 m!228189))

(declare-fun m!228191 () Bool)

(assert (=> b!201305 m!228191))

(declare-fun m!228193 () Bool)

(assert (=> b!201297 m!228193))

(declare-fun m!228195 () Bool)

(assert (=> b!201303 m!228195))

(declare-fun m!228197 () Bool)

(assert (=> b!201303 m!228197))

(declare-fun m!228199 () Bool)

(assert (=> b!201303 m!228199))

(declare-fun m!228201 () Bool)

(assert (=> b!201300 m!228201))

(declare-fun m!228203 () Bool)

(assert (=> mapNonEmpty!8408 m!228203))

(declare-fun m!228205 () Bool)

(assert (=> b!201299 m!228205))

(check-sat (not b!201303) (not mapNonEmpty!8408) (not b!201298) (not b!201297) (not b_next!5037) (not start!20378) (not b!201300) tp_is_empty!4893 (not b!201305) (not b!201295) b_and!11783)
(check-sat b_and!11783 (not b_next!5037))
