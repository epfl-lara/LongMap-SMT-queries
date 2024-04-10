; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105792 () Bool)

(assert start!105792)

(declare-fun b_free!27355 () Bool)

(declare-fun b_next!27355 () Bool)

(assert (=> start!105792 (= b_free!27355 (not b_next!27355))))

(declare-fun tp!95594 () Bool)

(declare-fun b_and!45251 () Bool)

(assert (=> start!105792 (= tp!95594 b_and!45251)))

(declare-fun b!1260201 () Bool)

(declare-fun e!717050 () Bool)

(declare-fun e!717055 () Bool)

(assert (=> b!1260201 (= e!717050 (not e!717055))))

(declare-fun res!839851 () Bool)

(assert (=> b!1260201 (=> res!839851 e!717055)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260201 (= res!839851 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48375 0))(
  ( (V!48376 (val!16191 Int)) )
))
(declare-datatypes ((tuple2!20942 0))(
  ( (tuple2!20943 (_1!10482 (_ BitVec 64)) (_2!10482 V!48375)) )
))
(declare-datatypes ((List!28143 0))(
  ( (Nil!28140) (Cons!28139 (h!29348 tuple2!20942) (t!41640 List!28143)) )
))
(declare-datatypes ((ListLongMap!18815 0))(
  ( (ListLongMap!18816 (toList!9423 List!28143)) )
))
(declare-fun lt!570853 () ListLongMap!18815)

(declare-fun lt!570856 () ListLongMap!18815)

(assert (=> b!1260201 (= lt!570853 lt!570856)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48375)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48375)

(declare-datatypes ((array!82132 0))(
  ( (array!82133 (arr!39620 (Array (_ BitVec 32) (_ BitVec 64))) (size!40156 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82132)

(declare-datatypes ((ValueCell!15365 0))(
  ( (ValueCellFull!15365 (v!18894 V!48375)) (EmptyCell!15365) )
))
(declare-datatypes ((array!82134 0))(
  ( (array!82135 (arr!39621 (Array (_ BitVec 32) ValueCell!15365)) (size!40157 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82134)

(declare-fun minValueBefore!43 () V!48375)

(declare-datatypes ((Unit!42031 0))(
  ( (Unit!42032) )
))
(declare-fun lt!570858 () Unit!42031)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1160 (array!82132 array!82134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48375 V!48375 V!48375 V!48375 (_ BitVec 32) Int) Unit!42031)

(assert (=> b!1260201 (= lt!570858 (lemmaNoChangeToArrayThenSameMapNoExtras!1160 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5796 (array!82132 array!82134 (_ BitVec 32) (_ BitVec 32) V!48375 V!48375 (_ BitVec 32) Int) ListLongMap!18815)

(assert (=> b!1260201 (= lt!570856 (getCurrentListMapNoExtraKeys!5796 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260201 (= lt!570853 (getCurrentListMapNoExtraKeys!5796 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260202 () Bool)

(declare-fun e!717053 () Bool)

(declare-fun e!717049 () Bool)

(declare-fun mapRes!50185 () Bool)

(assert (=> b!1260202 (= e!717053 (and e!717049 mapRes!50185))))

(declare-fun condMapEmpty!50185 () Bool)

(declare-fun mapDefault!50185 () ValueCell!15365)

