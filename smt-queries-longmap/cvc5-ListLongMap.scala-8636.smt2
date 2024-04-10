; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105118 () Bool)

(assert start!105118)

(declare-fun b_free!26851 () Bool)

(declare-fun b_next!26851 () Bool)

(assert (=> start!105118 (= b_free!26851 (not b_next!26851))))

(declare-fun tp!94054 () Bool)

(declare-fun b_and!44655 () Bool)

(assert (=> start!105118 (= tp!94054 b_and!44655)))

(declare-fun b!1252680 () Bool)

(declare-fun res!835384 () Bool)

(declare-fun e!711519 () Bool)

(assert (=> b!1252680 (=> (not res!835384) (not e!711519))))

(declare-datatypes ((array!81168 0))(
  ( (array!81169 (arr!39147 (Array (_ BitVec 32) (_ BitVec 64))) (size!39683 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81168)

(declare-datatypes ((List!27794 0))(
  ( (Nil!27791) (Cons!27790 (h!28999 (_ BitVec 64)) (t!41273 List!27794)) )
))
(declare-fun arrayNoDuplicates!0 (array!81168 (_ BitVec 32) List!27794) Bool)

(assert (=> b!1252680 (= res!835384 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27791))))

(declare-fun b!1252681 () Bool)

(declare-fun res!835385 () Bool)

(assert (=> b!1252681 (=> (not res!835385) (not e!711519))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47703 0))(
  ( (V!47704 (val!15939 Int)) )
))
(declare-datatypes ((ValueCell!15113 0))(
  ( (ValueCellFull!15113 (v!18637 V!47703)) (EmptyCell!15113) )
))
(declare-datatypes ((array!81170 0))(
  ( (array!81171 (arr!39148 (Array (_ BitVec 32) ValueCell!15113)) (size!39684 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81170)

(assert (=> b!1252681 (= res!835385 (and (= (size!39684 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39683 _keys!1118) (size!39684 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252682 () Bool)

(declare-fun e!711522 () Bool)

(assert (=> b!1252682 (= e!711522 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47703)

(declare-datatypes ((tuple2!20560 0))(
  ( (tuple2!20561 (_1!10291 (_ BitVec 64)) (_2!10291 V!47703)) )
))
(declare-datatypes ((List!27795 0))(
  ( (Nil!27792) (Cons!27791 (h!29000 tuple2!20560) (t!41274 List!27795)) )
))
(declare-datatypes ((ListLongMap!18433 0))(
  ( (ListLongMap!18434 (toList!9232 List!27795)) )
))
(declare-fun lt!565451 () ListLongMap!18433)

(declare-fun minValueBefore!43 () V!47703)

(declare-fun getCurrentListMap!4480 (array!81168 array!81170 (_ BitVec 32) (_ BitVec 32) V!47703 V!47703 (_ BitVec 32) Int) ListLongMap!18433)

(assert (=> b!1252682 (= lt!565451 (getCurrentListMap!4480 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252683 () Bool)

(declare-fun e!711520 () Bool)

(declare-fun e!711521 () Bool)

(declare-fun mapRes!49402 () Bool)

(assert (=> b!1252683 (= e!711520 (and e!711521 mapRes!49402))))

(declare-fun condMapEmpty!49402 () Bool)

(declare-fun mapDefault!49402 () ValueCell!15113)

