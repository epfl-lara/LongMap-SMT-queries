; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105780 () Bool)

(assert start!105780)

(declare-fun b_free!27343 () Bool)

(declare-fun b_next!27343 () Bool)

(assert (=> start!105780 (= b_free!27343 (not b_next!27343))))

(declare-fun tp!95558 () Bool)

(declare-fun b_and!45239 () Bool)

(assert (=> start!105780 (= tp!95558 b_and!45239)))

(declare-fun b!1260039 () Bool)

(declare-fun res!839745 () Bool)

(declare-fun e!716928 () Bool)

(assert (=> b!1260039 (=> (not res!839745) (not e!716928))))

(declare-datatypes ((array!82108 0))(
  ( (array!82109 (arr!39608 (Array (_ BitVec 32) (_ BitVec 64))) (size!40144 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82108)

(declare-datatypes ((List!28132 0))(
  ( (Nil!28129) (Cons!28128 (h!29337 (_ BitVec 64)) (t!41629 List!28132)) )
))
(declare-fun arrayNoDuplicates!0 (array!82108 (_ BitVec 32) List!28132) Bool)

(assert (=> b!1260039 (= res!839745 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28129))))

(declare-fun mapIsEmpty!50167 () Bool)

(declare-fun mapRes!50167 () Bool)

(assert (=> mapIsEmpty!50167 mapRes!50167))

(declare-fun b!1260040 () Bool)

(declare-fun e!716924 () Bool)

(assert (=> b!1260040 (= e!716924 true)))

(declare-datatypes ((V!48359 0))(
  ( (V!48360 (val!16185 Int)) )
))
(declare-datatypes ((tuple2!20930 0))(
  ( (tuple2!20931 (_1!10476 (_ BitVec 64)) (_2!10476 V!48359)) )
))
(declare-datatypes ((List!28133 0))(
  ( (Nil!28130) (Cons!28129 (h!29338 tuple2!20930) (t!41630 List!28133)) )
))
(declare-datatypes ((ListLongMap!18803 0))(
  ( (ListLongMap!18804 (toList!9417 List!28133)) )
))
(declare-fun lt!570676 () ListLongMap!18803)

(declare-fun lt!570678 () ListLongMap!18803)

(declare-fun -!2123 (ListLongMap!18803 (_ BitVec 64)) ListLongMap!18803)

(assert (=> b!1260040 (= lt!570676 (-!2123 lt!570678 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570673 () ListLongMap!18803)

(declare-fun lt!570680 () ListLongMap!18803)

(assert (=> b!1260040 (= (-!2123 lt!570673 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570680)))

(declare-datatypes ((Unit!42019 0))(
  ( (Unit!42020) )
))
(declare-fun lt!570682 () Unit!42019)

(declare-fun minValueBefore!43 () V!48359)

(declare-fun addThenRemoveForNewKeyIsSame!360 (ListLongMap!18803 (_ BitVec 64) V!48359) Unit!42019)

(assert (=> b!1260040 (= lt!570682 (addThenRemoveForNewKeyIsSame!360 lt!570680 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716929 () Bool)

(assert (=> b!1260040 e!716929))

(declare-fun res!839747 () Bool)

(assert (=> b!1260040 (=> (not res!839747) (not e!716929))))

(assert (=> b!1260040 (= res!839747 (= lt!570678 lt!570673))))

(declare-fun +!4221 (ListLongMap!18803 tuple2!20930) ListLongMap!18803)

(assert (=> b!1260040 (= lt!570673 (+!4221 lt!570680 (tuple2!20931 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570675 () ListLongMap!18803)

(declare-fun lt!570674 () tuple2!20930)

(assert (=> b!1260040 (= lt!570680 (+!4221 lt!570675 lt!570674))))

(declare-fun zeroValue!871 () V!48359)

(assert (=> b!1260040 (= lt!570674 (tuple2!20931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48359)

(declare-fun lt!570677 () ListLongMap!18803)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15359 0))(
  ( (ValueCellFull!15359 (v!18888 V!48359)) (EmptyCell!15359) )
))
(declare-datatypes ((array!82110 0))(
  ( (array!82111 (arr!39609 (Array (_ BitVec 32) ValueCell!15359)) (size!40145 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82110)

(declare-fun getCurrentListMap!4614 (array!82108 array!82110 (_ BitVec 32) (_ BitVec 32) V!48359 V!48359 (_ BitVec 32) Int) ListLongMap!18803)

(assert (=> b!1260040 (= lt!570677 (getCurrentListMap!4614 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260040 (= lt!570678 (getCurrentListMap!4614 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570681 () ListLongMap!18803)

(declare-fun b!1260041 () Bool)

(assert (=> b!1260041 (= e!716929 (= lt!570677 (+!4221 lt!570681 lt!570674)))))

(declare-fun b!1260042 () Bool)

(declare-fun res!839744 () Bool)

(assert (=> b!1260042 (=> (not res!839744) (not e!716928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82108 (_ BitVec 32)) Bool)

(assert (=> b!1260042 (= res!839744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!839746 () Bool)

(assert (=> start!105780 (=> (not res!839746) (not e!716928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105780 (= res!839746 (validMask!0 mask!1466))))

(assert (=> start!105780 e!716928))

(assert (=> start!105780 true))

(assert (=> start!105780 tp!95558))

(declare-fun tp_is_empty!32245 () Bool)

(assert (=> start!105780 tp_is_empty!32245))

(declare-fun array_inv!30155 (array!82108) Bool)

(assert (=> start!105780 (array_inv!30155 _keys!1118)))

(declare-fun e!716927 () Bool)

(declare-fun array_inv!30156 (array!82110) Bool)

(assert (=> start!105780 (and (array_inv!30156 _values!914) e!716927)))

(declare-fun b!1260043 () Bool)

(declare-fun e!716925 () Bool)

(assert (=> b!1260043 (= e!716927 (and e!716925 mapRes!50167))))

(declare-fun condMapEmpty!50167 () Bool)

(declare-fun mapDefault!50167 () ValueCell!15359)

