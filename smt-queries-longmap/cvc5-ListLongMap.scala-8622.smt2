; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104998 () Bool)

(assert start!104998)

(declare-fun b_free!26767 () Bool)

(declare-fun b_next!26767 () Bool)

(assert (=> start!104998 (= b_free!26767 (not b_next!26767))))

(declare-fun tp!93797 () Bool)

(declare-fun b_and!44553 () Bool)

(assert (=> start!104998 (= tp!93797 b_and!44553)))

(declare-fun b!1251504 () Bool)

(declare-fun res!834740 () Bool)

(declare-fun e!710686 () Bool)

(assert (=> b!1251504 (=> (not res!834740) (not e!710686))))

(declare-datatypes ((array!81002 0))(
  ( (array!81003 (arr!39066 (Array (_ BitVec 32) (_ BitVec 64))) (size!39602 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81002)

(declare-datatypes ((List!27730 0))(
  ( (Nil!27727) (Cons!27726 (h!28935 (_ BitVec 64)) (t!41205 List!27730)) )
))
(declare-fun arrayNoDuplicates!0 (array!81002 (_ BitVec 32) List!27730) Bool)

(assert (=> b!1251504 (= res!834740 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27727))))

(declare-fun b!1251505 () Bool)

(declare-fun e!710682 () Bool)

(declare-fun tp_is_empty!31669 () Bool)

(assert (=> b!1251505 (= e!710682 tp_is_empty!31669)))

(declare-fun b!1251506 () Bool)

(declare-fun res!834736 () Bool)

(assert (=> b!1251506 (=> (not res!834736) (not e!710686))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47591 0))(
  ( (V!47592 (val!15897 Int)) )
))
(declare-datatypes ((ValueCell!15071 0))(
  ( (ValueCellFull!15071 (v!18594 V!47591)) (EmptyCell!15071) )
))
(declare-datatypes ((array!81004 0))(
  ( (array!81005 (arr!39067 (Array (_ BitVec 32) ValueCell!15071)) (size!39603 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81004)

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1251506 (= res!834736 (and (= (size!39603 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39602 _keys!1118) (size!39603 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251507 () Bool)

(declare-fun e!710684 () Bool)

(assert (=> b!1251507 (= e!710684 (bvsle #b00000000000000000000000000000000 (size!39602 _keys!1118)))))

(declare-datatypes ((tuple2!20498 0))(
  ( (tuple2!20499 (_1!10260 (_ BitVec 64)) (_2!10260 V!47591)) )
))
(declare-datatypes ((List!27731 0))(
  ( (Nil!27728) (Cons!27727 (h!28936 tuple2!20498) (t!41206 List!27731)) )
))
(declare-datatypes ((ListLongMap!18371 0))(
  ( (ListLongMap!18372 (toList!9201 List!27731)) )
))
(declare-fun lt!564858 () ListLongMap!18371)

(declare-fun -!2019 (ListLongMap!18371 (_ BitVec 64)) ListLongMap!18371)

(assert (=> b!1251507 (= (-!2019 lt!564858 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564858)))

(declare-datatypes ((Unit!41589 0))(
  ( (Unit!41590) )
))
(declare-fun lt!564857 () Unit!41589)

(declare-fun removeNotPresentStillSame!114 (ListLongMap!18371 (_ BitVec 64)) Unit!41589)

(assert (=> b!1251507 (= lt!564857 (removeNotPresentStillSame!114 lt!564858 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251508 () Bool)

(declare-fun e!710687 () Bool)

(declare-fun mapRes!49270 () Bool)

(assert (=> b!1251508 (= e!710687 (and e!710682 mapRes!49270))))

(declare-fun condMapEmpty!49270 () Bool)

(declare-fun mapDefault!49270 () ValueCell!15071)

