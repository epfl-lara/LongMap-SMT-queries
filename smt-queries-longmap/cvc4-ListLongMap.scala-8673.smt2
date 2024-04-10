; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105418 () Bool)

(assert start!105418)

(declare-fun b_free!27077 () Bool)

(declare-fun b_next!27077 () Bool)

(assert (=> start!105418 (= b_free!27077 (not b_next!27077))))

(declare-fun tp!94744 () Bool)

(declare-fun b_and!44923 () Bool)

(assert (=> start!105418 (= tp!94744 b_and!44923)))

(declare-fun b!1255956 () Bool)

(declare-fun e!713909 () Bool)

(assert (=> b!1255956 (= e!713909 true)))

(declare-datatypes ((V!48003 0))(
  ( (V!48004 (val!16052 Int)) )
))
(declare-datatypes ((tuple2!20732 0))(
  ( (tuple2!20733 (_1!10377 (_ BitVec 64)) (_2!10377 V!48003)) )
))
(declare-datatypes ((List!27952 0))(
  ( (Nil!27949) (Cons!27948 (h!29157 tuple2!20732) (t!41439 List!27952)) )
))
(declare-datatypes ((ListLongMap!18605 0))(
  ( (ListLongMap!18606 (toList!9318 List!27952)) )
))
(declare-fun lt!567849 () ListLongMap!18605)

(declare-fun -!2071 (ListLongMap!18605 (_ BitVec 64)) ListLongMap!18605)

(assert (=> b!1255956 (= (-!2071 lt!567849 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567849)))

(declare-datatypes ((Unit!41822 0))(
  ( (Unit!41823) )
))
(declare-fun lt!567853 () Unit!41822)

(declare-fun removeNotPresentStillSame!124 (ListLongMap!18605 (_ BitVec 64)) Unit!41822)

(assert (=> b!1255956 (= lt!567853 (removeNotPresentStillSame!124 lt!567849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255957 () Bool)

(declare-fun e!713906 () Bool)

(assert (=> b!1255957 (= e!713906 e!713909)))

(declare-fun res!837299 () Bool)

(assert (=> b!1255957 (=> res!837299 e!713909)))

(declare-fun contains!7535 (ListLongMap!18605 (_ BitVec 64)) Bool)

(assert (=> b!1255957 (= res!837299 (contains!7535 lt!567849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48003)

(declare-datatypes ((array!81600 0))(
  ( (array!81601 (arr!39359 (Array (_ BitVec 32) (_ BitVec 64))) (size!39895 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81600)

(declare-datatypes ((ValueCell!15226 0))(
  ( (ValueCellFull!15226 (v!18752 V!48003)) (EmptyCell!15226) )
))
(declare-datatypes ((array!81602 0))(
  ( (array!81603 (arr!39360 (Array (_ BitVec 32) ValueCell!15226)) (size!39896 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81602)

(declare-fun minValueBefore!43 () V!48003)

(declare-fun getCurrentListMap!4541 (array!81600 array!81602 (_ BitVec 32) (_ BitVec 32) V!48003 V!48003 (_ BitVec 32) Int) ListLongMap!18605)

(assert (=> b!1255957 (= lt!567849 (getCurrentListMap!4541 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49753 () Bool)

(declare-fun mapRes!49753 () Bool)

(assert (=> mapIsEmpty!49753 mapRes!49753))

(declare-fun b!1255958 () Bool)

(declare-fun e!713903 () Bool)

(declare-fun e!713905 () Bool)

(assert (=> b!1255958 (= e!713903 (and e!713905 mapRes!49753))))

(declare-fun condMapEmpty!49753 () Bool)

(declare-fun mapDefault!49753 () ValueCell!15226)

