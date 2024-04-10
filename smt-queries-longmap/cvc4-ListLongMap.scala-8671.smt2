; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105406 () Bool)

(assert start!105406)

(declare-fun b_free!27065 () Bool)

(declare-fun b_next!27065 () Bool)

(assert (=> start!105406 (= b_free!27065 (not b_next!27065))))

(declare-fun tp!94708 () Bool)

(declare-fun b_and!44911 () Bool)

(assert (=> start!105406 (= tp!94708 b_and!44911)))

(declare-fun b!1255794 () Bool)

(declare-fun e!713780 () Bool)

(declare-fun tp_is_empty!31967 () Bool)

(assert (=> b!1255794 (= e!713780 tp_is_empty!31967)))

(declare-fun b!1255795 () Bool)

(declare-fun e!713778 () Bool)

(assert (=> b!1255795 (= e!713778 true)))

(declare-datatypes ((V!47987 0))(
  ( (V!47988 (val!16046 Int)) )
))
(declare-datatypes ((tuple2!20720 0))(
  ( (tuple2!20721 (_1!10371 (_ BitVec 64)) (_2!10371 V!47987)) )
))
(declare-datatypes ((List!27941 0))(
  ( (Nil!27938) (Cons!27937 (h!29146 tuple2!20720) (t!41428 List!27941)) )
))
(declare-datatypes ((ListLongMap!18593 0))(
  ( (ListLongMap!18594 (toList!9312 List!27941)) )
))
(declare-fun lt!567759 () ListLongMap!18593)

(declare-fun -!2066 (ListLongMap!18593 (_ BitVec 64)) ListLongMap!18593)

(assert (=> b!1255795 (= (-!2066 lt!567759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567759)))

(declare-datatypes ((Unit!41810 0))(
  ( (Unit!41811) )
))
(declare-fun lt!567760 () Unit!41810)

(declare-fun removeNotPresentStillSame!119 (ListLongMap!18593 (_ BitVec 64)) Unit!41810)

(assert (=> b!1255795 (= lt!567760 (removeNotPresentStillSame!119 lt!567759 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!837191 () Bool)

(declare-fun e!713783 () Bool)

(assert (=> start!105406 (=> (not res!837191) (not e!713783))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105406 (= res!837191 (validMask!0 mask!1466))))

(assert (=> start!105406 e!713783))

(assert (=> start!105406 true))

(assert (=> start!105406 tp!94708))

(assert (=> start!105406 tp_is_empty!31967))

(declare-datatypes ((array!81576 0))(
  ( (array!81577 (arr!39347 (Array (_ BitVec 32) (_ BitVec 64))) (size!39883 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81576)

(declare-fun array_inv!29981 (array!81576) Bool)

(assert (=> start!105406 (array_inv!29981 _keys!1118)))

(declare-datatypes ((ValueCell!15220 0))(
  ( (ValueCellFull!15220 (v!18746 V!47987)) (EmptyCell!15220) )
))
(declare-datatypes ((array!81578 0))(
  ( (array!81579 (arr!39348 (Array (_ BitVec 32) ValueCell!15220)) (size!39884 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81578)

(declare-fun e!713781 () Bool)

(declare-fun array_inv!29982 (array!81578) Bool)

(assert (=> start!105406 (and (array_inv!29982 _values!914) e!713781)))

(declare-fun mapIsEmpty!49735 () Bool)

(declare-fun mapRes!49735 () Bool)

(assert (=> mapIsEmpty!49735 mapRes!49735))

(declare-fun b!1255796 () Bool)

(declare-fun res!837187 () Bool)

(assert (=> b!1255796 (=> (not res!837187) (not e!713783))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255796 (= res!837187 (and (= (size!39884 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39883 _keys!1118) (size!39884 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255797 () Bool)

(declare-fun e!713782 () Bool)

(assert (=> b!1255797 (= e!713783 (not e!713782))))

(declare-fun res!837189 () Bool)

(assert (=> b!1255797 (=> res!837189 e!713782)))

(assert (=> b!1255797 (= res!837189 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567762 () ListLongMap!18593)

(declare-fun lt!567761 () ListLongMap!18593)

(assert (=> b!1255797 (= lt!567762 lt!567761)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47987)

(declare-fun zeroValue!871 () V!47987)

(declare-fun lt!567763 () Unit!41810)

(declare-fun minValueBefore!43 () V!47987)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1061 (array!81576 array!81578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47987 V!47987 V!47987 V!47987 (_ BitVec 32) Int) Unit!41810)

(assert (=> b!1255797 (= lt!567763 (lemmaNoChangeToArrayThenSameMapNoExtras!1061 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5697 (array!81576 array!81578 (_ BitVec 32) (_ BitVec 32) V!47987 V!47987 (_ BitVec 32) Int) ListLongMap!18593)

(assert (=> b!1255797 (= lt!567761 (getCurrentListMapNoExtraKeys!5697 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255797 (= lt!567762 (getCurrentListMapNoExtraKeys!5697 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255798 () Bool)

(assert (=> b!1255798 (= e!713782 e!713778)))

(declare-fun res!837190 () Bool)

(assert (=> b!1255798 (=> res!837190 e!713778)))

(declare-fun contains!7531 (ListLongMap!18593 (_ BitVec 64)) Bool)

(assert (=> b!1255798 (= res!837190 (contains!7531 lt!567759 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4537 (array!81576 array!81578 (_ BitVec 32) (_ BitVec 32) V!47987 V!47987 (_ BitVec 32) Int) ListLongMap!18593)

(assert (=> b!1255798 (= lt!567759 (getCurrentListMap!4537 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49735 () Bool)

(declare-fun tp!94709 () Bool)

(assert (=> mapNonEmpty!49735 (= mapRes!49735 (and tp!94709 e!713780))))

(declare-fun mapKey!49735 () (_ BitVec 32))

(declare-fun mapRest!49735 () (Array (_ BitVec 32) ValueCell!15220))

(declare-fun mapValue!49735 () ValueCell!15220)

(assert (=> mapNonEmpty!49735 (= (arr!39348 _values!914) (store mapRest!49735 mapKey!49735 mapValue!49735))))

(declare-fun b!1255799 () Bool)

(declare-fun e!713777 () Bool)

(assert (=> b!1255799 (= e!713777 tp_is_empty!31967)))

(declare-fun b!1255800 () Bool)

(declare-fun res!837188 () Bool)

(assert (=> b!1255800 (=> (not res!837188) (not e!713783))))

(declare-datatypes ((List!27942 0))(
  ( (Nil!27939) (Cons!27938 (h!29147 (_ BitVec 64)) (t!41429 List!27942)) )
))
(declare-fun arrayNoDuplicates!0 (array!81576 (_ BitVec 32) List!27942) Bool)

(assert (=> b!1255800 (= res!837188 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27939))))

(declare-fun b!1255801 () Bool)

(assert (=> b!1255801 (= e!713781 (and e!713777 mapRes!49735))))

(declare-fun condMapEmpty!49735 () Bool)

(declare-fun mapDefault!49735 () ValueCell!15220)

