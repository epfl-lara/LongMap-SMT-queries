; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20530 () Bool)

(assert start!20530)

(declare-fun b_free!5185 () Bool)

(declare-fun b_next!5185 () Bool)

(assert (=> start!20530 (= b_free!5185 (not b_next!5185))))

(declare-fun tp!18587 () Bool)

(declare-fun b_and!11945 () Bool)

(assert (=> start!20530 (= tp!18587 b_and!11945)))

(declare-fun b!204014 () Bool)

(declare-fun e!133519 () Bool)

(assert (=> b!204014 (= e!133519 true)))

(declare-datatypes ((V!6369 0))(
  ( (V!6370 (val!2565 Int)) )
))
(declare-datatypes ((tuple2!3832 0))(
  ( (tuple2!3833 (_1!1927 (_ BitVec 64)) (_2!1927 V!6369)) )
))
(declare-datatypes ((List!2730 0))(
  ( (Nil!2727) (Cons!2726 (h!3368 tuple2!3832) (t!7653 List!2730)) )
))
(declare-datatypes ((ListLongMap!2747 0))(
  ( (ListLongMap!2748 (toList!1389 List!2730)) )
))
(declare-fun lt!103205 () ListLongMap!2747)

(declare-fun lt!103209 () ListLongMap!2747)

(declare-fun lt!103214 () tuple2!3832)

(declare-fun +!443 (ListLongMap!2747 tuple2!3832) ListLongMap!2747)

(assert (=> b!204014 (= lt!103205 (+!443 lt!103209 lt!103214))))

(declare-fun v!520 () V!6369)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun zeroValue!615 () V!6369)

(declare-datatypes ((Unit!6166 0))(
  ( (Unit!6167) )
))
(declare-fun lt!103213 () Unit!6166)

(declare-fun lt!103206 () ListLongMap!2747)

(declare-fun addCommutativeForDiffKeys!155 (ListLongMap!2747 (_ BitVec 64) V!6369 (_ BitVec 64) V!6369) Unit!6166)

(assert (=> b!204014 (= lt!103213 (addCommutativeForDiffKeys!155 lt!103206 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204015 () Bool)

(declare-fun e!133515 () Bool)

(declare-fun e!133516 () Bool)

(declare-fun mapRes!8630 () Bool)

(assert (=> b!204015 (= e!133515 (and e!133516 mapRes!8630))))

(declare-fun condMapEmpty!8630 () Bool)

(declare-datatypes ((ValueCell!2177 0))(
  ( (ValueCellFull!2177 (v!4536 V!6369)) (EmptyCell!2177) )
))
(declare-datatypes ((array!9293 0))(
  ( (array!9294 (arr!4397 (Array (_ BitVec 32) ValueCell!2177)) (size!4722 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9293)

(declare-fun mapDefault!8630 () ValueCell!2177)

(assert (=> b!204015 (= condMapEmpty!8630 (= (arr!4397 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2177)) mapDefault!8630)))))

(declare-fun b!204016 () Bool)

(declare-fun res!98171 () Bool)

(declare-fun e!133517 () Bool)

(assert (=> b!204016 (=> (not res!98171) (not e!133517))))

(declare-datatypes ((array!9295 0))(
  ( (array!9296 (arr!4398 (Array (_ BitVec 32) (_ BitVec 64))) (size!4723 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9295)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204016 (= res!98171 (= (select (arr!4398 _keys!825) i!601) k0!843))))

(declare-fun b!204017 () Bool)

(declare-fun res!98179 () Bool)

(assert (=> b!204017 (=> (not res!98179) (not e!133517))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9295 (_ BitVec 32)) Bool)

(assert (=> b!204017 (= res!98179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8630 () Bool)

(declare-fun tp!18586 () Bool)

(declare-fun e!133514 () Bool)

(assert (=> mapNonEmpty!8630 (= mapRes!8630 (and tp!18586 e!133514))))

(declare-fun mapValue!8630 () ValueCell!2177)

(declare-fun mapRest!8630 () (Array (_ BitVec 32) ValueCell!2177))

(declare-fun mapKey!8630 () (_ BitVec 32))

(assert (=> mapNonEmpty!8630 (= (arr!4397 _values!649) (store mapRest!8630 mapKey!8630 mapValue!8630))))

(declare-fun mapIsEmpty!8630 () Bool)

(assert (=> mapIsEmpty!8630 mapRes!8630))

(declare-fun b!204018 () Bool)

(declare-fun res!98174 () Bool)

(assert (=> b!204018 (=> (not res!98174) (not e!133517))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204018 (= res!98174 (and (= (size!4722 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4723 _keys!825) (size!4722 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204020 () Bool)

(declare-fun res!98172 () Bool)

(assert (=> b!204020 (=> (not res!98172) (not e!133517))))

(declare-datatypes ((List!2731 0))(
  ( (Nil!2728) (Cons!2727 (h!3369 (_ BitVec 64)) (t!7654 List!2731)) )
))
(declare-fun arrayNoDuplicates!0 (array!9295 (_ BitVec 32) List!2731) Bool)

(assert (=> b!204020 (= res!98172 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2728))))

(declare-fun b!204021 () Bool)

(declare-fun e!133520 () Bool)

(assert (=> b!204021 (= e!133520 e!133519)))

(declare-fun res!98178 () Bool)

(assert (=> b!204021 (=> res!98178 e!133519)))

(assert (=> b!204021 (= res!98178 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103211 () ListLongMap!2747)

(assert (=> b!204021 (= lt!103211 lt!103205)))

(declare-fun lt!103204 () ListLongMap!2747)

(declare-fun lt!103207 () tuple2!3832)

(assert (=> b!204021 (= lt!103205 (+!443 lt!103204 lt!103207))))

(declare-fun lt!103210 () ListLongMap!2747)

(assert (=> b!204021 (= lt!103210 lt!103209)))

(assert (=> b!204021 (= lt!103209 (+!443 lt!103206 lt!103207))))

(declare-fun lt!103212 () ListLongMap!2747)

(assert (=> b!204021 (= lt!103211 (+!443 lt!103212 lt!103207))))

(assert (=> b!204021 (= lt!103207 (tuple2!3833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204022 () Bool)

(declare-fun res!98173 () Bool)

(assert (=> b!204022 (=> (not res!98173) (not e!133517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204022 (= res!98173 (validKeyInArray!0 k0!843))))

(declare-fun b!204023 () Bool)

(declare-fun res!98177 () Bool)

(assert (=> b!204023 (=> (not res!98177) (not e!133517))))

(assert (=> b!204023 (= res!98177 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4723 _keys!825))))))

(declare-fun b!204024 () Bool)

(assert (=> b!204024 (= e!133517 (not e!133520))))

(declare-fun res!98175 () Bool)

(assert (=> b!204024 (=> res!98175 e!133520)))

(assert (=> b!204024 (= res!98175 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6369)

(declare-fun getCurrentListMap!967 (array!9295 array!9293 (_ BitVec 32) (_ BitVec 32) V!6369 V!6369 (_ BitVec 32) Int) ListLongMap!2747)

(assert (=> b!204024 (= lt!103210 (getCurrentListMap!967 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103203 () array!9293)

(assert (=> b!204024 (= lt!103211 (getCurrentListMap!967 _keys!825 lt!103203 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204024 (and (= lt!103212 lt!103204) (= lt!103204 lt!103212))))

(assert (=> b!204024 (= lt!103204 (+!443 lt!103206 lt!103214))))

(assert (=> b!204024 (= lt!103214 (tuple2!3833 k0!843 v!520))))

(declare-fun lt!103208 () Unit!6166)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!103 (array!9295 array!9293 (_ BitVec 32) (_ BitVec 32) V!6369 V!6369 (_ BitVec 32) (_ BitVec 64) V!6369 (_ BitVec 32) Int) Unit!6166)

(assert (=> b!204024 (= lt!103208 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!103 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!360 (array!9295 array!9293 (_ BitVec 32) (_ BitVec 32) V!6369 V!6369 (_ BitVec 32) Int) ListLongMap!2747)

(assert (=> b!204024 (= lt!103212 (getCurrentListMapNoExtraKeys!360 _keys!825 lt!103203 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204024 (= lt!103203 (array!9294 (store (arr!4397 _values!649) i!601 (ValueCellFull!2177 v!520)) (size!4722 _values!649)))))

(assert (=> b!204024 (= lt!103206 (getCurrentListMapNoExtraKeys!360 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204025 () Bool)

(declare-fun tp_is_empty!5041 () Bool)

(assert (=> b!204025 (= e!133514 tp_is_empty!5041)))

(declare-fun res!98176 () Bool)

(assert (=> start!20530 (=> (not res!98176) (not e!133517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20530 (= res!98176 (validMask!0 mask!1149))))

(assert (=> start!20530 e!133517))

(declare-fun array_inv!2871 (array!9293) Bool)

(assert (=> start!20530 (and (array_inv!2871 _values!649) e!133515)))

(assert (=> start!20530 true))

(assert (=> start!20530 tp_is_empty!5041))

(declare-fun array_inv!2872 (array!9295) Bool)

(assert (=> start!20530 (array_inv!2872 _keys!825)))

(assert (=> start!20530 tp!18587))

(declare-fun b!204019 () Bool)

(assert (=> b!204019 (= e!133516 tp_is_empty!5041)))

(assert (= (and start!20530 res!98176) b!204018))

(assert (= (and b!204018 res!98174) b!204017))

(assert (= (and b!204017 res!98179) b!204020))

(assert (= (and b!204020 res!98172) b!204023))

(assert (= (and b!204023 res!98177) b!204022))

(assert (= (and b!204022 res!98173) b!204016))

(assert (= (and b!204016 res!98171) b!204024))

(assert (= (and b!204024 (not res!98175)) b!204021))

(assert (= (and b!204021 (not res!98178)) b!204014))

(assert (= (and b!204015 condMapEmpty!8630) mapIsEmpty!8630))

(assert (= (and b!204015 (not condMapEmpty!8630)) mapNonEmpty!8630))

(get-info :version)

(assert (= (and mapNonEmpty!8630 ((_ is ValueCellFull!2177) mapValue!8630)) b!204025))

(assert (= (and b!204015 ((_ is ValueCellFull!2177) mapDefault!8630)) b!204019))

(assert (= start!20530 b!204015))

(declare-fun m!231633 () Bool)

(assert (=> b!204017 m!231633))

(declare-fun m!231635 () Bool)

(assert (=> b!204022 m!231635))

(declare-fun m!231637 () Bool)

(assert (=> b!204016 m!231637))

(declare-fun m!231639 () Bool)

(assert (=> b!204024 m!231639))

(declare-fun m!231641 () Bool)

(assert (=> b!204024 m!231641))

(declare-fun m!231643 () Bool)

(assert (=> b!204024 m!231643))

(declare-fun m!231645 () Bool)

(assert (=> b!204024 m!231645))

(declare-fun m!231647 () Bool)

(assert (=> b!204024 m!231647))

(declare-fun m!231649 () Bool)

(assert (=> b!204024 m!231649))

(declare-fun m!231651 () Bool)

(assert (=> b!204024 m!231651))

(declare-fun m!231653 () Bool)

(assert (=> b!204020 m!231653))

(declare-fun m!231655 () Bool)

(assert (=> b!204014 m!231655))

(declare-fun m!231657 () Bool)

(assert (=> b!204014 m!231657))

(declare-fun m!231659 () Bool)

(assert (=> b!204021 m!231659))

(declare-fun m!231661 () Bool)

(assert (=> b!204021 m!231661))

(declare-fun m!231663 () Bool)

(assert (=> b!204021 m!231663))

(declare-fun m!231665 () Bool)

(assert (=> mapNonEmpty!8630 m!231665))

(declare-fun m!231667 () Bool)

(assert (=> start!20530 m!231667))

(declare-fun m!231669 () Bool)

(assert (=> start!20530 m!231669))

(declare-fun m!231671 () Bool)

(assert (=> start!20530 m!231671))

(check-sat b_and!11945 (not b!204017) tp_is_empty!5041 (not mapNonEmpty!8630) (not b!204024) (not b_next!5185) (not b!204022) (not b!204014) (not b!204021) (not start!20530) (not b!204020))
(check-sat b_and!11945 (not b_next!5185))
