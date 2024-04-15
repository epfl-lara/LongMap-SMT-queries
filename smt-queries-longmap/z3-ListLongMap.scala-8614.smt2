; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104946 () Bool)

(assert start!104946)

(declare-fun b_free!26719 () Bool)

(declare-fun b_next!26719 () Bool)

(assert (=> start!104946 (= b_free!26719 (not b_next!26719))))

(declare-fun tp!93652 () Bool)

(declare-fun b_and!44487 () Bool)

(assert (=> start!104946 (= tp!93652 b_and!44487)))

(declare-fun b!1250774 () Bool)

(declare-fun e!710134 () Bool)

(declare-fun tp_is_empty!31621 () Bool)

(assert (=> b!1250774 (= e!710134 tp_is_empty!31621)))

(declare-fun b!1250775 () Bool)

(declare-fun res!834263 () Bool)

(declare-fun e!710138 () Bool)

(assert (=> b!1250775 (=> (not res!834263) (not e!710138))))

(declare-datatypes ((array!80831 0))(
  ( (array!80832 (arr!38981 (Array (_ BitVec 32) (_ BitVec 64))) (size!39519 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80831)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80831 (_ BitVec 32)) Bool)

(assert (=> b!1250775 (= res!834263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49198 () Bool)

(declare-fun mapRes!49198 () Bool)

(assert (=> mapIsEmpty!49198 mapRes!49198))

(declare-fun b!1250776 () Bool)

(declare-fun e!710135 () Bool)

(assert (=> b!1250776 (= e!710135 true)))

(declare-datatypes ((V!47527 0))(
  ( (V!47528 (val!15873 Int)) )
))
(declare-datatypes ((tuple2!20542 0))(
  ( (tuple2!20543 (_1!10282 (_ BitVec 64)) (_2!10282 V!47527)) )
))
(declare-datatypes ((List!27765 0))(
  ( (Nil!27762) (Cons!27761 (h!28970 tuple2!20542) (t!41231 List!27765)) )
))
(declare-datatypes ((ListLongMap!18415 0))(
  ( (ListLongMap!18416 (toList!9223 List!27765)) )
))
(declare-fun lt!564322 () ListLongMap!18415)

(declare-fun -!1969 (ListLongMap!18415 (_ BitVec 64)) ListLongMap!18415)

(assert (=> b!1250776 (= (-!1969 lt!564322 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564322)))

(declare-datatypes ((Unit!41412 0))(
  ( (Unit!41413) )
))
(declare-fun lt!564321 () Unit!41412)

(declare-fun removeNotPresentStillSame!97 (ListLongMap!18415 (_ BitVec 64)) Unit!41412)

(assert (=> b!1250776 (= lt!564321 (removeNotPresentStillSame!97 lt!564322 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!834267 () Bool)

(assert (=> start!104946 (=> (not res!834267) (not e!710138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104946 (= res!834267 (validMask!0 mask!1466))))

(assert (=> start!104946 e!710138))

(assert (=> start!104946 true))

(assert (=> start!104946 tp!93652))

(assert (=> start!104946 tp_is_empty!31621))

(declare-fun array_inv!29867 (array!80831) Bool)

(assert (=> start!104946 (array_inv!29867 _keys!1118)))

(declare-datatypes ((ValueCell!15047 0))(
  ( (ValueCellFull!15047 (v!18569 V!47527)) (EmptyCell!15047) )
))
(declare-datatypes ((array!80833 0))(
  ( (array!80834 (arr!38982 (Array (_ BitVec 32) ValueCell!15047)) (size!39520 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80833)

(declare-fun e!710139 () Bool)

(declare-fun array_inv!29868 (array!80833) Bool)

(assert (=> start!104946 (and (array_inv!29868 _values!914) e!710139)))

(declare-fun mapNonEmpty!49198 () Bool)

(declare-fun tp!93653 () Bool)

(declare-fun e!710136 () Bool)

(assert (=> mapNonEmpty!49198 (= mapRes!49198 (and tp!93653 e!710136))))

(declare-fun mapValue!49198 () ValueCell!15047)

(declare-fun mapRest!49198 () (Array (_ BitVec 32) ValueCell!15047))

(declare-fun mapKey!49198 () (_ BitVec 32))

(assert (=> mapNonEmpty!49198 (= (arr!38982 _values!914) (store mapRest!49198 mapKey!49198 mapValue!49198))))

(declare-fun b!1250777 () Bool)

(assert (=> b!1250777 (= e!710136 tp_is_empty!31621)))

(declare-fun b!1250778 () Bool)

(declare-fun res!834266 () Bool)

(assert (=> b!1250778 (=> (not res!834266) (not e!710138))))

(declare-datatypes ((List!27766 0))(
  ( (Nil!27763) (Cons!27762 (h!28971 (_ BitVec 64)) (t!41232 List!27766)) )
))
(declare-fun arrayNoDuplicates!0 (array!80831 (_ BitVec 32) List!27766) Bool)

(assert (=> b!1250778 (= res!834266 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27763))))

(declare-fun b!1250779 () Bool)

(declare-fun e!710133 () Bool)

(assert (=> b!1250779 (= e!710138 (not e!710133))))

(declare-fun res!834264 () Bool)

(assert (=> b!1250779 (=> res!834264 e!710133)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1250779 (= res!834264 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564320 () ListLongMap!18415)

(declare-fun lt!564318 () ListLongMap!18415)

(assert (=> b!1250779 (= lt!564320 lt!564318)))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!564319 () Unit!41412)

(declare-fun minValueAfter!43 () V!47527)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47527)

(declare-fun minValueBefore!43 () V!47527)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!954 (array!80831 array!80833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47527 V!47527 V!47527 V!47527 (_ BitVec 32) Int) Unit!41412)

(assert (=> b!1250779 (= lt!564319 (lemmaNoChangeToArrayThenSameMapNoExtras!954 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5632 (array!80831 array!80833 (_ BitVec 32) (_ BitVec 32) V!47527 V!47527 (_ BitVec 32) Int) ListLongMap!18415)

(assert (=> b!1250779 (= lt!564318 (getCurrentListMapNoExtraKeys!5632 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250779 (= lt!564320 (getCurrentListMapNoExtraKeys!5632 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250780 () Bool)

(assert (=> b!1250780 (= e!710139 (and e!710134 mapRes!49198))))

(declare-fun condMapEmpty!49198 () Bool)

(declare-fun mapDefault!49198 () ValueCell!15047)

(assert (=> b!1250780 (= condMapEmpty!49198 (= (arr!38982 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15047)) mapDefault!49198)))))

(declare-fun b!1250781 () Bool)

(declare-fun res!834268 () Bool)

(assert (=> b!1250781 (=> (not res!834268) (not e!710138))))

(assert (=> b!1250781 (= res!834268 (and (= (size!39520 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39519 _keys!1118) (size!39520 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250782 () Bool)

(assert (=> b!1250782 (= e!710133 e!710135)))

(declare-fun res!834265 () Bool)

(assert (=> b!1250782 (=> res!834265 e!710135)))

(declare-fun contains!7468 (ListLongMap!18415 (_ BitVec 64)) Bool)

(assert (=> b!1250782 (= res!834265 (contains!7468 lt!564322 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4394 (array!80831 array!80833 (_ BitVec 32) (_ BitVec 32) V!47527 V!47527 (_ BitVec 32) Int) ListLongMap!18415)

(assert (=> b!1250782 (= lt!564322 (getCurrentListMap!4394 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104946 res!834267) b!1250781))

(assert (= (and b!1250781 res!834268) b!1250775))

(assert (= (and b!1250775 res!834263) b!1250778))

(assert (= (and b!1250778 res!834266) b!1250779))

(assert (= (and b!1250779 (not res!834264)) b!1250782))

(assert (= (and b!1250782 (not res!834265)) b!1250776))

(assert (= (and b!1250780 condMapEmpty!49198) mapIsEmpty!49198))

(assert (= (and b!1250780 (not condMapEmpty!49198)) mapNonEmpty!49198))

(get-info :version)

(assert (= (and mapNonEmpty!49198 ((_ is ValueCellFull!15047) mapValue!49198)) b!1250777))

(assert (= (and b!1250780 ((_ is ValueCellFull!15047) mapDefault!49198)) b!1250774))

(assert (= start!104946 b!1250780))

(declare-fun m!1151125 () Bool)

(assert (=> mapNonEmpty!49198 m!1151125))

(declare-fun m!1151127 () Bool)

(assert (=> b!1250775 m!1151127))

(declare-fun m!1151129 () Bool)

(assert (=> b!1250778 m!1151129))

(declare-fun m!1151131 () Bool)

(assert (=> b!1250776 m!1151131))

(declare-fun m!1151133 () Bool)

(assert (=> b!1250776 m!1151133))

(declare-fun m!1151135 () Bool)

(assert (=> b!1250782 m!1151135))

(declare-fun m!1151137 () Bool)

(assert (=> b!1250782 m!1151137))

(declare-fun m!1151139 () Bool)

(assert (=> b!1250779 m!1151139))

(declare-fun m!1151141 () Bool)

(assert (=> b!1250779 m!1151141))

(declare-fun m!1151143 () Bool)

(assert (=> b!1250779 m!1151143))

(declare-fun m!1151145 () Bool)

(assert (=> start!104946 m!1151145))

(declare-fun m!1151147 () Bool)

(assert (=> start!104946 m!1151147))

(declare-fun m!1151149 () Bool)

(assert (=> start!104946 m!1151149))

(check-sat (not b!1250776) (not b!1250782) (not b_next!26719) (not b!1250779) b_and!44487 (not start!104946) (not b!1250778) (not mapNonEmpty!49198) (not b!1250775) tp_is_empty!31621)
(check-sat b_and!44487 (not b_next!26719))
