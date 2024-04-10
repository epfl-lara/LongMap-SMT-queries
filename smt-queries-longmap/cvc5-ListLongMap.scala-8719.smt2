; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105786 () Bool)

(assert start!105786)

(declare-fun b_free!27349 () Bool)

(declare-fun b_next!27349 () Bool)

(assert (=> start!105786 (= b_free!27349 (not b_next!27349))))

(declare-fun tp!95575 () Bool)

(declare-fun b_and!45245 () Bool)

(assert (=> start!105786 (= tp!95575 b_and!45245)))

(declare-fun b!1260120 () Bool)

(declare-fun res!839796 () Bool)

(declare-fun e!716986 () Bool)

(assert (=> b!1260120 (=> (not res!839796) (not e!716986))))

(declare-datatypes ((array!82120 0))(
  ( (array!82121 (arr!39614 (Array (_ BitVec 32) (_ BitVec 64))) (size!40150 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82120)

(declare-datatypes ((List!28137 0))(
  ( (Nil!28134) (Cons!28133 (h!29342 (_ BitVec 64)) (t!41634 List!28137)) )
))
(declare-fun arrayNoDuplicates!0 (array!82120 (_ BitVec 32) List!28137) Bool)

(assert (=> b!1260120 (= res!839796 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28134))))

(declare-fun b!1260121 () Bool)

(declare-fun e!716992 () Bool)

(assert (=> b!1260121 (= e!716986 (not e!716992))))

(declare-fun res!839801 () Bool)

(assert (=> b!1260121 (=> res!839801 e!716992)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260121 (= res!839801 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48367 0))(
  ( (V!48368 (val!16188 Int)) )
))
(declare-datatypes ((tuple2!20936 0))(
  ( (tuple2!20937 (_1!10479 (_ BitVec 64)) (_2!10479 V!48367)) )
))
(declare-datatypes ((List!28138 0))(
  ( (Nil!28135) (Cons!28134 (h!29343 tuple2!20936) (t!41635 List!28138)) )
))
(declare-datatypes ((ListLongMap!18809 0))(
  ( (ListLongMap!18810 (toList!9420 List!28138)) )
))
(declare-fun lt!570771 () ListLongMap!18809)

(declare-fun lt!570767 () ListLongMap!18809)

(assert (=> b!1260121 (= lt!570771 lt!570767)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48367)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48367)

(declare-datatypes ((ValueCell!15362 0))(
  ( (ValueCellFull!15362 (v!18891 V!48367)) (EmptyCell!15362) )
))
(declare-datatypes ((array!82122 0))(
  ( (array!82123 (arr!39615 (Array (_ BitVec 32) ValueCell!15362)) (size!40151 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82122)

(declare-datatypes ((Unit!42025 0))(
  ( (Unit!42026) )
))
(declare-fun lt!570768 () Unit!42025)

(declare-fun minValueBefore!43 () V!48367)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1157 (array!82120 array!82122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48367 V!48367 V!48367 V!48367 (_ BitVec 32) Int) Unit!42025)

(assert (=> b!1260121 (= lt!570768 (lemmaNoChangeToArrayThenSameMapNoExtras!1157 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5793 (array!82120 array!82122 (_ BitVec 32) (_ BitVec 32) V!48367 V!48367 (_ BitVec 32) Int) ListLongMap!18809)

(assert (=> b!1260121 (= lt!570767 (getCurrentListMapNoExtraKeys!5793 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260121 (= lt!570771 (getCurrentListMapNoExtraKeys!5793 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260122 () Bool)

(assert (=> b!1260122 (= e!716992 true)))

(declare-fun lt!570766 () ListLongMap!18809)

(declare-fun lt!570772 () ListLongMap!18809)

(declare-fun -!2126 (ListLongMap!18809 (_ BitVec 64)) ListLongMap!18809)

(assert (=> b!1260122 (= lt!570766 (-!2126 lt!570772 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570765 () ListLongMap!18809)

(declare-fun lt!570770 () ListLongMap!18809)

(assert (=> b!1260122 (= (-!2126 lt!570765 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570770)))

(declare-fun lt!570763 () Unit!42025)

(declare-fun addThenRemoveForNewKeyIsSame!363 (ListLongMap!18809 (_ BitVec 64) V!48367) Unit!42025)

(assert (=> b!1260122 (= lt!570763 (addThenRemoveForNewKeyIsSame!363 lt!570770 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716990 () Bool)

(assert (=> b!1260122 e!716990))

(declare-fun res!839797 () Bool)

(assert (=> b!1260122 (=> (not res!839797) (not e!716990))))

(assert (=> b!1260122 (= res!839797 (= lt!570772 lt!570765))))

(declare-fun +!4224 (ListLongMap!18809 tuple2!20936) ListLongMap!18809)

(assert (=> b!1260122 (= lt!570765 (+!4224 lt!570770 (tuple2!20937 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570764 () tuple2!20936)

(assert (=> b!1260122 (= lt!570770 (+!4224 lt!570771 lt!570764))))

(assert (=> b!1260122 (= lt!570764 (tuple2!20937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!570769 () ListLongMap!18809)

(declare-fun getCurrentListMap!4617 (array!82120 array!82122 (_ BitVec 32) (_ BitVec 32) V!48367 V!48367 (_ BitVec 32) Int) ListLongMap!18809)

(assert (=> b!1260122 (= lt!570769 (getCurrentListMap!4617 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260122 (= lt!570772 (getCurrentListMap!4617 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260124 () Bool)

(declare-fun res!839798 () Bool)

(assert (=> b!1260124 (=> (not res!839798) (not e!716986))))

(assert (=> b!1260124 (= res!839798 (and (= (size!40151 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40150 _keys!1118) (size!40151 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260125 () Bool)

(declare-fun e!716987 () Bool)

(declare-fun tp_is_empty!32251 () Bool)

(assert (=> b!1260125 (= e!716987 tp_is_empty!32251)))

(declare-fun b!1260126 () Bool)

(declare-fun e!716988 () Bool)

(declare-fun e!716991 () Bool)

(declare-fun mapRes!50176 () Bool)

(assert (=> b!1260126 (= e!716988 (and e!716991 mapRes!50176))))

(declare-fun condMapEmpty!50176 () Bool)

(declare-fun mapDefault!50176 () ValueCell!15362)

