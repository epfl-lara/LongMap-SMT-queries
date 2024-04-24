; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20656 () Bool)

(assert start!20656)

(declare-fun b_free!5311 () Bool)

(declare-fun b_next!5311 () Bool)

(assert (=> start!20656 (= b_free!5311 (not b_next!5311))))

(declare-fun tp!18964 () Bool)

(declare-fun b_and!12071 () Bool)

(assert (=> start!20656 (= tp!18964 b_and!12071)))

(declare-fun res!99883 () Bool)

(declare-fun e!134841 () Bool)

(assert (=> start!20656 (=> (not res!99883) (not e!134841))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20656 (= res!99883 (validMask!0 mask!1149))))

(assert (=> start!20656 e!134841))

(declare-datatypes ((V!6537 0))(
  ( (V!6538 (val!2628 Int)) )
))
(declare-datatypes ((ValueCell!2240 0))(
  ( (ValueCellFull!2240 (v!4599 V!6537)) (EmptyCell!2240) )
))
(declare-datatypes ((array!9539 0))(
  ( (array!9540 (arr!4520 (Array (_ BitVec 32) ValueCell!2240)) (size!4845 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9539)

(declare-fun e!134843 () Bool)

(declare-fun array_inv!2963 (array!9539) Bool)

(assert (=> start!20656 (and (array_inv!2963 _values!649) e!134843)))

(assert (=> start!20656 true))

(declare-fun tp_is_empty!5167 () Bool)

(assert (=> start!20656 tp_is_empty!5167))

(declare-datatypes ((array!9541 0))(
  ( (array!9542 (arr!4521 (Array (_ BitVec 32) (_ BitVec 64))) (size!4846 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9541)

(declare-fun array_inv!2964 (array!9541) Bool)

(assert (=> start!20656 (array_inv!2964 _keys!825)))

(assert (=> start!20656 tp!18964))

(declare-fun b!206291 () Bool)

(declare-fun res!99881 () Bool)

(assert (=> b!206291 (=> (not res!99881) (not e!134841))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206291 (= res!99881 (and (= (size!4845 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4846 _keys!825) (size!4845 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206292 () Bool)

(declare-fun e!134840 () Bool)

(assert (=> b!206292 (= e!134841 (not e!134840))))

(declare-fun res!99887 () Bool)

(assert (=> b!206292 (=> res!99887 e!134840)))

(assert (=> b!206292 (= res!99887 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3940 0))(
  ( (tuple2!3941 (_1!1981 (_ BitVec 64)) (_2!1981 V!6537)) )
))
(declare-datatypes ((List!2827 0))(
  ( (Nil!2824) (Cons!2823 (h!3465 tuple2!3940) (t!7750 List!2827)) )
))
(declare-datatypes ((ListLongMap!2855 0))(
  ( (ListLongMap!2856 (toList!1443 List!2827)) )
))
(declare-fun lt!105439 () ListLongMap!2855)

(declare-fun zeroValue!615 () V!6537)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6537)

(declare-fun getCurrentListMap!1015 (array!9541 array!9539 (_ BitVec 32) (_ BitVec 32) V!6537 V!6537 (_ BitVec 32) Int) ListLongMap!2855)

(assert (=> b!206292 (= lt!105439 (getCurrentListMap!1015 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105442 () array!9539)

(declare-fun lt!105435 () ListLongMap!2855)

(assert (=> b!206292 (= lt!105435 (getCurrentListMap!1015 _keys!825 lt!105442 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105446 () ListLongMap!2855)

(declare-fun lt!105438 () ListLongMap!2855)

(assert (=> b!206292 (and (= lt!105446 lt!105438) (= lt!105438 lt!105446))))

(declare-fun lt!105437 () ListLongMap!2855)

(declare-fun lt!105444 () tuple2!3940)

(declare-fun +!497 (ListLongMap!2855 tuple2!3940) ListLongMap!2855)

(assert (=> b!206292 (= lt!105438 (+!497 lt!105437 lt!105444))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6537)

(assert (=> b!206292 (= lt!105444 (tuple2!3941 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6272 0))(
  ( (Unit!6273) )
))
(declare-fun lt!105441 () Unit!6272)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!151 (array!9541 array!9539 (_ BitVec 32) (_ BitVec 32) V!6537 V!6537 (_ BitVec 32) (_ BitVec 64) V!6537 (_ BitVec 32) Int) Unit!6272)

(assert (=> b!206292 (= lt!105441 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!151 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!408 (array!9541 array!9539 (_ BitVec 32) (_ BitVec 32) V!6537 V!6537 (_ BitVec 32) Int) ListLongMap!2855)

(assert (=> b!206292 (= lt!105446 (getCurrentListMapNoExtraKeys!408 _keys!825 lt!105442 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206292 (= lt!105442 (array!9540 (store (arr!4520 _values!649) i!601 (ValueCellFull!2240 v!520)) (size!4845 _values!649)))))

(assert (=> b!206292 (= lt!105437 (getCurrentListMapNoExtraKeys!408 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206293 () Bool)

(declare-fun e!134837 () Bool)

(declare-fun mapRes!8819 () Bool)

(assert (=> b!206293 (= e!134843 (and e!134837 mapRes!8819))))

(declare-fun condMapEmpty!8819 () Bool)

(declare-fun mapDefault!8819 () ValueCell!2240)

(assert (=> b!206293 (= condMapEmpty!8819 (= (arr!4520 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2240)) mapDefault!8819)))))

(declare-fun mapNonEmpty!8819 () Bool)

(declare-fun tp!18965 () Bool)

(declare-fun e!134838 () Bool)

(assert (=> mapNonEmpty!8819 (= mapRes!8819 (and tp!18965 e!134838))))

(declare-fun mapKey!8819 () (_ BitVec 32))

(declare-fun mapValue!8819 () ValueCell!2240)

(declare-fun mapRest!8819 () (Array (_ BitVec 32) ValueCell!2240))

(assert (=> mapNonEmpty!8819 (= (arr!4520 _values!649) (store mapRest!8819 mapKey!8819 mapValue!8819))))

(declare-fun b!206294 () Bool)

(declare-fun res!99884 () Bool)

(assert (=> b!206294 (=> (not res!99884) (not e!134841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9541 (_ BitVec 32)) Bool)

(assert (=> b!206294 (= res!99884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206295 () Bool)

(declare-fun e!134839 () Bool)

(assert (=> b!206295 (= e!134839 true)))

(declare-fun lt!105440 () ListLongMap!2855)

(declare-fun lt!105445 () ListLongMap!2855)

(assert (=> b!206295 (= lt!105440 (+!497 lt!105445 lt!105444))))

(declare-fun lt!105436 () Unit!6272)

(declare-fun addCommutativeForDiffKeys!196 (ListLongMap!2855 (_ BitVec 64) V!6537 (_ BitVec 64) V!6537) Unit!6272)

(assert (=> b!206295 (= lt!105436 (addCommutativeForDiffKeys!196 lt!105437 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206296 () Bool)

(assert (=> b!206296 (= e!134840 e!134839)))

(declare-fun res!99886 () Bool)

(assert (=> b!206296 (=> res!99886 e!134839)))

(assert (=> b!206296 (= res!99886 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!206296 (= lt!105439 lt!105445)))

(declare-fun lt!105443 () tuple2!3940)

(assert (=> b!206296 (= lt!105445 (+!497 lt!105437 lt!105443))))

(assert (=> b!206296 (= lt!105435 lt!105440)))

(assert (=> b!206296 (= lt!105440 (+!497 lt!105438 lt!105443))))

(assert (=> b!206296 (= lt!105435 (+!497 lt!105446 lt!105443))))

(assert (=> b!206296 (= lt!105443 (tuple2!3941 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206297 () Bool)

(assert (=> b!206297 (= e!134837 tp_is_empty!5167)))

(declare-fun b!206298 () Bool)

(declare-fun res!99889 () Bool)

(assert (=> b!206298 (=> (not res!99889) (not e!134841))))

(assert (=> b!206298 (= res!99889 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4846 _keys!825))))))

(declare-fun mapIsEmpty!8819 () Bool)

(assert (=> mapIsEmpty!8819 mapRes!8819))

(declare-fun b!206299 () Bool)

(declare-fun res!99888 () Bool)

(assert (=> b!206299 (=> (not res!99888) (not e!134841))))

(declare-datatypes ((List!2828 0))(
  ( (Nil!2825) (Cons!2824 (h!3466 (_ BitVec 64)) (t!7751 List!2828)) )
))
(declare-fun arrayNoDuplicates!0 (array!9541 (_ BitVec 32) List!2828) Bool)

(assert (=> b!206299 (= res!99888 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2825))))

(declare-fun b!206300 () Bool)

(declare-fun res!99885 () Bool)

(assert (=> b!206300 (=> (not res!99885) (not e!134841))))

(assert (=> b!206300 (= res!99885 (= (select (arr!4521 _keys!825) i!601) k0!843))))

(declare-fun b!206301 () Bool)

(assert (=> b!206301 (= e!134838 tp_is_empty!5167)))

(declare-fun b!206302 () Bool)

(declare-fun res!99882 () Bool)

(assert (=> b!206302 (=> (not res!99882) (not e!134841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206302 (= res!99882 (validKeyInArray!0 k0!843))))

(assert (= (and start!20656 res!99883) b!206291))

(assert (= (and b!206291 res!99881) b!206294))

(assert (= (and b!206294 res!99884) b!206299))

(assert (= (and b!206299 res!99888) b!206298))

(assert (= (and b!206298 res!99889) b!206302))

(assert (= (and b!206302 res!99882) b!206300))

(assert (= (and b!206300 res!99885) b!206292))

(assert (= (and b!206292 (not res!99887)) b!206296))

(assert (= (and b!206296 (not res!99886)) b!206295))

(assert (= (and b!206293 condMapEmpty!8819) mapIsEmpty!8819))

(assert (= (and b!206293 (not condMapEmpty!8819)) mapNonEmpty!8819))

(get-info :version)

(assert (= (and mapNonEmpty!8819 ((_ is ValueCellFull!2240) mapValue!8819)) b!206301))

(assert (= (and b!206293 ((_ is ValueCellFull!2240) mapDefault!8819)) b!206297))

(assert (= start!20656 b!206293))

(declare-fun m!234141 () Bool)

(assert (=> b!206299 m!234141))

(declare-fun m!234143 () Bool)

(assert (=> mapNonEmpty!8819 m!234143))

(declare-fun m!234145 () Bool)

(assert (=> b!206300 m!234145))

(declare-fun m!234147 () Bool)

(assert (=> b!206295 m!234147))

(declare-fun m!234149 () Bool)

(assert (=> b!206295 m!234149))

(declare-fun m!234151 () Bool)

(assert (=> b!206294 m!234151))

(declare-fun m!234153 () Bool)

(assert (=> b!206296 m!234153))

(declare-fun m!234155 () Bool)

(assert (=> b!206296 m!234155))

(declare-fun m!234157 () Bool)

(assert (=> b!206296 m!234157))

(declare-fun m!234159 () Bool)

(assert (=> b!206302 m!234159))

(declare-fun m!234161 () Bool)

(assert (=> b!206292 m!234161))

(declare-fun m!234163 () Bool)

(assert (=> b!206292 m!234163))

(declare-fun m!234165 () Bool)

(assert (=> b!206292 m!234165))

(declare-fun m!234167 () Bool)

(assert (=> b!206292 m!234167))

(declare-fun m!234169 () Bool)

(assert (=> b!206292 m!234169))

(declare-fun m!234171 () Bool)

(assert (=> b!206292 m!234171))

(declare-fun m!234173 () Bool)

(assert (=> b!206292 m!234173))

(declare-fun m!234175 () Bool)

(assert (=> start!20656 m!234175))

(declare-fun m!234177 () Bool)

(assert (=> start!20656 m!234177))

(declare-fun m!234179 () Bool)

(assert (=> start!20656 m!234179))

(check-sat b_and!12071 (not start!20656) (not b!206302) (not b_next!5311) tp_is_empty!5167 (not b!206294) (not b!206295) (not mapNonEmpty!8819) (not b!206299) (not b!206292) (not b!206296))
(check-sat b_and!12071 (not b_next!5311))
