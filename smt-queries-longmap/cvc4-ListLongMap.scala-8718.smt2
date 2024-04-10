; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105784 () Bool)

(assert start!105784)

(declare-fun b_free!27347 () Bool)

(declare-fun b_next!27347 () Bool)

(assert (=> start!105784 (= b_free!27347 (not b_next!27347))))

(declare-fun tp!95569 () Bool)

(declare-fun b_and!45243 () Bool)

(assert (=> start!105784 (= tp!95569 b_and!45243)))

(declare-fun b!1260093 () Bool)

(declare-fun e!716968 () Bool)

(assert (=> b!1260093 (= e!716968 true)))

(declare-datatypes ((V!48363 0))(
  ( (V!48364 (val!16187 Int)) )
))
(declare-datatypes ((tuple2!20934 0))(
  ( (tuple2!20935 (_1!10478 (_ BitVec 64)) (_2!10478 V!48363)) )
))
(declare-datatypes ((List!28136 0))(
  ( (Nil!28133) (Cons!28132 (h!29341 tuple2!20934) (t!41633 List!28136)) )
))
(declare-datatypes ((ListLongMap!18807 0))(
  ( (ListLongMap!18808 (toList!9419 List!28136)) )
))
(declare-fun lt!570741 () ListLongMap!18807)

(declare-fun lt!570738 () ListLongMap!18807)

(declare-fun -!2125 (ListLongMap!18807 (_ BitVec 64)) ListLongMap!18807)

(assert (=> b!1260093 (= lt!570741 (-!2125 lt!570738 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570734 () ListLongMap!18807)

(declare-fun lt!570737 () ListLongMap!18807)

(assert (=> b!1260093 (= (-!2125 lt!570734 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570737)))

(declare-datatypes ((Unit!42023 0))(
  ( (Unit!42024) )
))
(declare-fun lt!570742 () Unit!42023)

(declare-fun minValueBefore!43 () V!48363)

(declare-fun addThenRemoveForNewKeyIsSame!362 (ListLongMap!18807 (_ BitVec 64) V!48363) Unit!42023)

(assert (=> b!1260093 (= lt!570742 (addThenRemoveForNewKeyIsSame!362 lt!570737 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716966 () Bool)

(assert (=> b!1260093 e!716966))

(declare-fun res!839779 () Bool)

(assert (=> b!1260093 (=> (not res!839779) (not e!716966))))

(assert (=> b!1260093 (= res!839779 (= lt!570738 lt!570734))))

(declare-fun +!4223 (ListLongMap!18807 tuple2!20934) ListLongMap!18807)

(assert (=> b!1260093 (= lt!570734 (+!4223 lt!570737 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570740 () ListLongMap!18807)

(declare-fun lt!570739 () tuple2!20934)

(assert (=> b!1260093 (= lt!570737 (+!4223 lt!570740 lt!570739))))

(declare-fun zeroValue!871 () V!48363)

(assert (=> b!1260093 (= lt!570739 (tuple2!20935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48363)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15361 0))(
  ( (ValueCellFull!15361 (v!18890 V!48363)) (EmptyCell!15361) )
))
(declare-datatypes ((array!82116 0))(
  ( (array!82117 (arr!39612 (Array (_ BitVec 32) ValueCell!15361)) (size!40148 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82116)

(declare-fun lt!570733 () ListLongMap!18807)

(declare-datatypes ((array!82118 0))(
  ( (array!82119 (arr!39613 (Array (_ BitVec 32) (_ BitVec 64))) (size!40149 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82118)

(declare-fun getCurrentListMap!4616 (array!82118 array!82116 (_ BitVec 32) (_ BitVec 32) V!48363 V!48363 (_ BitVec 32) Int) ListLongMap!18807)

(assert (=> b!1260093 (= lt!570733 (getCurrentListMap!4616 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260093 (= lt!570738 (getCurrentListMap!4616 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260094 () Bool)

(declare-fun e!716969 () Bool)

(declare-fun tp_is_empty!32249 () Bool)

(assert (=> b!1260094 (= e!716969 tp_is_empty!32249)))

(declare-fun res!839780 () Bool)

(declare-fun e!716967 () Bool)

(assert (=> start!105784 (=> (not res!839780) (not e!716967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105784 (= res!839780 (validMask!0 mask!1466))))

(assert (=> start!105784 e!716967))

(assert (=> start!105784 true))

(assert (=> start!105784 tp!95569))

(assert (=> start!105784 tp_is_empty!32249))

(declare-fun array_inv!30159 (array!82118) Bool)

(assert (=> start!105784 (array_inv!30159 _keys!1118)))

(declare-fun e!716971 () Bool)

(declare-fun array_inv!30160 (array!82116) Bool)

(assert (=> start!105784 (and (array_inv!30160 _values!914) e!716971)))

(declare-fun b!1260095 () Bool)

(declare-fun mapRes!50173 () Bool)

(assert (=> b!1260095 (= e!716971 (and e!716969 mapRes!50173))))

(declare-fun condMapEmpty!50173 () Bool)

(declare-fun mapDefault!50173 () ValueCell!15361)

