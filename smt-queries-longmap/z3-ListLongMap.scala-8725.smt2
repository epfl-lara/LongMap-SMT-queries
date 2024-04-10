; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105846 () Bool)

(assert start!105846)

(declare-fun b_free!27387 () Bool)

(declare-fun b_next!27387 () Bool)

(assert (=> start!105846 (= b_free!27387 (not b_next!27387))))

(declare-fun tp!95693 () Bool)

(declare-fun b_and!45295 () Bool)

(assert (=> start!105846 (= tp!95693 b_and!45295)))

(declare-fun b!1260811 () Bool)

(declare-fun res!840214 () Bool)

(declare-fun e!717498 () Bool)

(assert (=> b!1260811 (=> (not res!840214) (not e!717498))))

(declare-datatypes ((array!82196 0))(
  ( (array!82197 (arr!39651 (Array (_ BitVec 32) (_ BitVec 64))) (size!40187 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82196)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82196 (_ BitVec 32)) Bool)

(assert (=> b!1260811 (= res!840214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260812 () Bool)

(declare-fun res!840216 () Bool)

(assert (=> b!1260812 (=> (not res!840216) (not e!717498))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48417 0))(
  ( (V!48418 (val!16207 Int)) )
))
(declare-datatypes ((ValueCell!15381 0))(
  ( (ValueCellFull!15381 (v!18911 V!48417)) (EmptyCell!15381) )
))
(declare-datatypes ((array!82198 0))(
  ( (array!82199 (arr!39652 (Array (_ BitVec 32) ValueCell!15381)) (size!40188 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82198)

(assert (=> b!1260812 (= res!840216 (and (= (size!40188 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40187 _keys!1118) (size!40188 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260813 () Bool)

(declare-fun e!717500 () Bool)

(declare-fun tp_is_empty!32289 () Bool)

(assert (=> b!1260813 (= e!717500 tp_is_empty!32289)))

(declare-fun mapNonEmpty!50236 () Bool)

(declare-fun mapRes!50236 () Bool)

(declare-fun tp!95692 () Bool)

(declare-fun e!717497 () Bool)

(assert (=> mapNonEmpty!50236 (= mapRes!50236 (and tp!95692 e!717497))))

(declare-fun mapRest!50236 () (Array (_ BitVec 32) ValueCell!15381))

(declare-fun mapValue!50236 () ValueCell!15381)

(declare-fun mapKey!50236 () (_ BitVec 32))

(assert (=> mapNonEmpty!50236 (= (arr!39652 _values!914) (store mapRest!50236 mapKey!50236 mapValue!50236))))

(declare-fun b!1260814 () Bool)

(assert (=> b!1260814 (= e!717497 tp_is_empty!32289)))

(declare-fun b!1260815 () Bool)

(assert (=> b!1260815 (= e!717498 (not true))))

(declare-datatypes ((tuple2!20970 0))(
  ( (tuple2!20971 (_1!10496 (_ BitVec 64)) (_2!10496 V!48417)) )
))
(declare-datatypes ((List!28168 0))(
  ( (Nil!28165) (Cons!28164 (h!29373 tuple2!20970) (t!41667 List!28168)) )
))
(declare-datatypes ((ListLongMap!18843 0))(
  ( (ListLongMap!18844 (toList!9437 List!28168)) )
))
(declare-fun lt!571444 () ListLongMap!18843)

(declare-fun lt!571445 () ListLongMap!18843)

(assert (=> b!1260815 (= lt!571444 lt!571445)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48417)

(declare-fun zeroValue!871 () V!48417)

(declare-fun minValueBefore!43 () V!48417)

(declare-datatypes ((Unit!42057 0))(
  ( (Unit!42058) )
))
(declare-fun lt!571446 () Unit!42057)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1169 (array!82196 array!82198 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48417 V!48417 V!48417 V!48417 (_ BitVec 32) Int) Unit!42057)

(assert (=> b!1260815 (= lt!571446 (lemmaNoChangeToArrayThenSameMapNoExtras!1169 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5805 (array!82196 array!82198 (_ BitVec 32) (_ BitVec 32) V!48417 V!48417 (_ BitVec 32) Int) ListLongMap!18843)

(assert (=> b!1260815 (= lt!571445 (getCurrentListMapNoExtraKeys!5805 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260815 (= lt!571444 (getCurrentListMapNoExtraKeys!5805 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260816 () Bool)

(declare-fun res!840217 () Bool)

(assert (=> b!1260816 (=> (not res!840217) (not e!717498))))

(declare-datatypes ((List!28169 0))(
  ( (Nil!28166) (Cons!28165 (h!29374 (_ BitVec 64)) (t!41668 List!28169)) )
))
(declare-fun arrayNoDuplicates!0 (array!82196 (_ BitVec 32) List!28169) Bool)

(assert (=> b!1260816 (= res!840217 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28166))))

(declare-fun b!1260817 () Bool)

(declare-fun e!717499 () Bool)

(assert (=> b!1260817 (= e!717499 (and e!717500 mapRes!50236))))

(declare-fun condMapEmpty!50236 () Bool)

(declare-fun mapDefault!50236 () ValueCell!15381)

(assert (=> b!1260817 (= condMapEmpty!50236 (= (arr!39652 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15381)) mapDefault!50236)))))

(declare-fun res!840215 () Bool)

(assert (=> start!105846 (=> (not res!840215) (not e!717498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105846 (= res!840215 (validMask!0 mask!1466))))

(assert (=> start!105846 e!717498))

(assert (=> start!105846 true))

(assert (=> start!105846 tp!95693))

(assert (=> start!105846 tp_is_empty!32289))

(declare-fun array_inv!30185 (array!82196) Bool)

(assert (=> start!105846 (array_inv!30185 _keys!1118)))

(declare-fun array_inv!30186 (array!82198) Bool)

(assert (=> start!105846 (and (array_inv!30186 _values!914) e!717499)))

(declare-fun mapIsEmpty!50236 () Bool)

(assert (=> mapIsEmpty!50236 mapRes!50236))

(assert (= (and start!105846 res!840215) b!1260812))

(assert (= (and b!1260812 res!840216) b!1260811))

(assert (= (and b!1260811 res!840214) b!1260816))

(assert (= (and b!1260816 res!840217) b!1260815))

(assert (= (and b!1260817 condMapEmpty!50236) mapIsEmpty!50236))

(assert (= (and b!1260817 (not condMapEmpty!50236)) mapNonEmpty!50236))

(get-info :version)

(assert (= (and mapNonEmpty!50236 ((_ is ValueCellFull!15381) mapValue!50236)) b!1260814))

(assert (= (and b!1260817 ((_ is ValueCellFull!15381) mapDefault!50236)) b!1260813))

(assert (= start!105846 b!1260817))

(declare-fun m!1161581 () Bool)

(assert (=> b!1260816 m!1161581))

(declare-fun m!1161583 () Bool)

(assert (=> start!105846 m!1161583))

(declare-fun m!1161585 () Bool)

(assert (=> start!105846 m!1161585))

(declare-fun m!1161587 () Bool)

(assert (=> start!105846 m!1161587))

(declare-fun m!1161589 () Bool)

(assert (=> b!1260811 m!1161589))

(declare-fun m!1161591 () Bool)

(assert (=> mapNonEmpty!50236 m!1161591))

(declare-fun m!1161593 () Bool)

(assert (=> b!1260815 m!1161593))

(declare-fun m!1161595 () Bool)

(assert (=> b!1260815 m!1161595))

(declare-fun m!1161597 () Bool)

(assert (=> b!1260815 m!1161597))

(check-sat (not b!1260815) b_and!45295 (not mapNonEmpty!50236) (not b!1260811) (not b_next!27387) (not b!1260816) (not start!105846) tp_is_empty!32289)
(check-sat b_and!45295 (not b_next!27387))
