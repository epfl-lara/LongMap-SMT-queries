; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105710 () Bool)

(assert start!105710)

(declare-fun b_free!27295 () Bool)

(declare-fun b_next!27295 () Bool)

(assert (=> start!105710 (= b_free!27295 (not b_next!27295))))

(declare-fun tp!95411 () Bool)

(declare-fun b_and!45179 () Bool)

(assert (=> start!105710 (= tp!95411 b_and!45179)))

(declare-fun b!1259203 () Bool)

(declare-fun e!716298 () Bool)

(assert (=> b!1259203 (= e!716298 true)))

(declare-datatypes ((V!48295 0))(
  ( (V!48296 (val!16161 Int)) )
))
(declare-datatypes ((tuple2!20886 0))(
  ( (tuple2!20887 (_1!10454 (_ BitVec 64)) (_2!10454 V!48295)) )
))
(declare-datatypes ((List!28095 0))(
  ( (Nil!28092) (Cons!28091 (h!29300 tuple2!20886) (t!41590 List!28095)) )
))
(declare-datatypes ((ListLongMap!18759 0))(
  ( (ListLongMap!18760 (toList!9395 List!28095)) )
))
(declare-fun lt!569814 () ListLongMap!18759)

(declare-fun lt!569811 () ListLongMap!18759)

(declare-fun -!2102 (ListLongMap!18759 (_ BitVec 64)) ListLongMap!18759)

(assert (=> b!1259203 (= lt!569814 (-!2102 lt!569811 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569816 () ListLongMap!18759)

(declare-fun lt!569808 () ListLongMap!18759)

(assert (=> b!1259203 (= (-!2102 lt!569816 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569808)))

(declare-datatypes ((Unit!41973 0))(
  ( (Unit!41974) )
))
(declare-fun lt!569809 () Unit!41973)

(declare-fun minValueBefore!43 () V!48295)

(declare-fun addThenRemoveForNewKeyIsSame!339 (ListLongMap!18759 (_ BitVec 64) V!48295) Unit!41973)

(assert (=> b!1259203 (= lt!569809 (addThenRemoveForNewKeyIsSame!339 lt!569808 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716299 () Bool)

(assert (=> b!1259203 e!716299))

(declare-fun res!839226 () Bool)

(assert (=> b!1259203 (=> (not res!839226) (not e!716299))))

(assert (=> b!1259203 (= res!839226 (= lt!569811 lt!569816))))

(declare-fun +!4200 (ListLongMap!18759 tuple2!20886) ListLongMap!18759)

(assert (=> b!1259203 (= lt!569816 (+!4200 lt!569808 (tuple2!20887 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569810 () ListLongMap!18759)

(declare-fun lt!569813 () tuple2!20886)

(assert (=> b!1259203 (= lt!569808 (+!4200 lt!569810 lt!569813))))

(declare-fun zeroValue!871 () V!48295)

(assert (=> b!1259203 (= lt!569813 (tuple2!20887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48295)

(declare-datatypes ((array!82012 0))(
  ( (array!82013 (arr!39561 (Array (_ BitVec 32) (_ BitVec 64))) (size!40097 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82012)

(declare-datatypes ((ValueCell!15335 0))(
  ( (ValueCellFull!15335 (v!18863 V!48295)) (EmptyCell!15335) )
))
(declare-datatypes ((array!82014 0))(
  ( (array!82015 (arr!39562 (Array (_ BitVec 32) ValueCell!15335)) (size!40098 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82014)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!569812 () ListLongMap!18759)

(declare-fun getCurrentListMap!4593 (array!82012 array!82014 (_ BitVec 32) (_ BitVec 32) V!48295 V!48295 (_ BitVec 32) Int) ListLongMap!18759)

(assert (=> b!1259203 (= lt!569812 (getCurrentListMap!4593 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259203 (= lt!569811 (getCurrentListMap!4593 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50092 () Bool)

(declare-fun mapRes!50092 () Bool)

(declare-fun tp!95410 () Bool)

(declare-fun e!716300 () Bool)

(assert (=> mapNonEmpty!50092 (= mapRes!50092 (and tp!95410 e!716300))))

(declare-fun mapValue!50092 () ValueCell!15335)

(declare-fun mapKey!50092 () (_ BitVec 32))

(declare-fun mapRest!50092 () (Array (_ BitVec 32) ValueCell!15335))

(assert (=> mapNonEmpty!50092 (= (arr!39562 _values!914) (store mapRest!50092 mapKey!50092 mapValue!50092))))

(declare-fun mapIsEmpty!50092 () Bool)

(assert (=> mapIsEmpty!50092 mapRes!50092))

(declare-fun b!1259204 () Bool)

(declare-fun e!716302 () Bool)

(declare-fun e!716304 () Bool)

(assert (=> b!1259204 (= e!716302 (and e!716304 mapRes!50092))))

(declare-fun condMapEmpty!50092 () Bool)

(declare-fun mapDefault!50092 () ValueCell!15335)

