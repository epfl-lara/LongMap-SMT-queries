; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104920 () Bool)

(assert start!104920)

(declare-fun b_free!26711 () Bool)

(declare-fun b_next!26711 () Bool)

(assert (=> start!104920 (= b_free!26711 (not b_next!26711))))

(declare-fun tp!93625 () Bool)

(declare-fun b_and!44487 () Bool)

(assert (=> start!104920 (= tp!93625 b_and!44487)))

(declare-fun b!1250591 () Bool)

(declare-fun res!834175 () Bool)

(declare-fun e!709997 () Bool)

(assert (=> b!1250591 (=> (not res!834175) (not e!709997))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80894 0))(
  ( (array!80895 (arr!39013 (Array (_ BitVec 32) (_ BitVec 64))) (size!39549 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80894)

(declare-datatypes ((V!47515 0))(
  ( (V!47516 (val!15869 Int)) )
))
(declare-datatypes ((ValueCell!15043 0))(
  ( (ValueCellFull!15043 (v!18565 V!47515)) (EmptyCell!15043) )
))
(declare-datatypes ((array!80896 0))(
  ( (array!80897 (arr!39014 (Array (_ BitVec 32) ValueCell!15043)) (size!39550 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80896)

(assert (=> b!1250591 (= res!834175 (and (= (size!39550 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39549 _keys!1118) (size!39550 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250592 () Bool)

(declare-fun e!710000 () Bool)

(declare-fun tp_is_empty!31613 () Bool)

(assert (=> b!1250592 (= e!710000 tp_is_empty!31613)))

(declare-fun b!1250593 () Bool)

(declare-fun e!709999 () Bool)

(assert (=> b!1250593 (= e!709999 tp_is_empty!31613)))

(declare-fun mapIsEmpty!49183 () Bool)

(declare-fun mapRes!49183 () Bool)

(assert (=> mapIsEmpty!49183 mapRes!49183))

(declare-fun res!834171 () Bool)

(assert (=> start!104920 (=> (not res!834171) (not e!709997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104920 (= res!834171 (validMask!0 mask!1466))))

(assert (=> start!104920 e!709997))

(assert (=> start!104920 true))

(assert (=> start!104920 tp!93625))

(assert (=> start!104920 tp_is_empty!31613))

(declare-fun array_inv!29761 (array!80894) Bool)

(assert (=> start!104920 (array_inv!29761 _keys!1118)))

(declare-fun e!709996 () Bool)

(declare-fun array_inv!29762 (array!80896) Bool)

(assert (=> start!104920 (and (array_inv!29762 _values!914) e!709996)))

(declare-fun b!1250594 () Bool)

(declare-fun e!709994 () Bool)

(declare-fun e!709998 () Bool)

(assert (=> b!1250594 (= e!709994 e!709998)))

(declare-fun res!834172 () Bool)

(assert (=> b!1250594 (=> res!834172 e!709998)))

(declare-datatypes ((tuple2!20450 0))(
  ( (tuple2!20451 (_1!10236 (_ BitVec 64)) (_2!10236 V!47515)) )
))
(declare-datatypes ((List!27690 0))(
  ( (Nil!27687) (Cons!27686 (h!28895 tuple2!20450) (t!41163 List!27690)) )
))
(declare-datatypes ((ListLongMap!18323 0))(
  ( (ListLongMap!18324 (toList!9177 List!27690)) )
))
(declare-fun lt!564315 () ListLongMap!18323)

(declare-fun contains!7490 (ListLongMap!18323 (_ BitVec 64)) Bool)

(assert (=> b!1250594 (= res!834172 (contains!7490 lt!564315 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47515)

(declare-fun minValueBefore!43 () V!47515)

(declare-fun getCurrentListMap!4451 (array!80894 array!80896 (_ BitVec 32) (_ BitVec 32) V!47515 V!47515 (_ BitVec 32) Int) ListLongMap!18323)

(assert (=> b!1250594 (= lt!564315 (getCurrentListMap!4451 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250595 () Bool)

(assert (=> b!1250595 (= e!709996 (and e!709999 mapRes!49183))))

(declare-fun condMapEmpty!49183 () Bool)

(declare-fun mapDefault!49183 () ValueCell!15043)

