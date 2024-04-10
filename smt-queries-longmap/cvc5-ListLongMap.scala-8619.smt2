; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104980 () Bool)

(assert start!104980)

(declare-fun b_free!26749 () Bool)

(declare-fun b_next!26749 () Bool)

(assert (=> start!104980 (= b_free!26749 (not b_next!26749))))

(declare-fun tp!93743 () Bool)

(declare-fun b_and!44535 () Bool)

(assert (=> start!104980 (= tp!93743 b_and!44535)))

(declare-fun b!1251261 () Bool)

(declare-fun res!834573 () Bool)

(declare-fun e!710498 () Bool)

(assert (=> b!1251261 (=> (not res!834573) (not e!710498))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80966 0))(
  ( (array!80967 (arr!39048 (Array (_ BitVec 32) (_ BitVec 64))) (size!39584 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80966)

(declare-datatypes ((V!47567 0))(
  ( (V!47568 (val!15888 Int)) )
))
(declare-datatypes ((ValueCell!15062 0))(
  ( (ValueCellFull!15062 (v!18585 V!47567)) (EmptyCell!15062) )
))
(declare-datatypes ((array!80968 0))(
  ( (array!80969 (arr!39049 (Array (_ BitVec 32) ValueCell!15062)) (size!39585 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80968)

(assert (=> b!1251261 (= res!834573 (and (= (size!39585 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39584 _keys!1118) (size!39585 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251262 () Bool)

(declare-fun e!710495 () Bool)

(declare-fun e!710497 () Bool)

(assert (=> b!1251262 (= e!710495 e!710497)))

(declare-fun res!834577 () Bool)

(assert (=> b!1251262 (=> res!834577 e!710497)))

(declare-datatypes ((tuple2!20482 0))(
  ( (tuple2!20483 (_1!10252 (_ BitVec 64)) (_2!10252 V!47567)) )
))
(declare-datatypes ((List!27716 0))(
  ( (Nil!27713) (Cons!27712 (h!28921 tuple2!20482) (t!41191 List!27716)) )
))
(declare-datatypes ((ListLongMap!18355 0))(
  ( (ListLongMap!18356 (toList!9193 List!27716)) )
))
(declare-fun lt!564723 () ListLongMap!18355)

(declare-fun contains!7504 (ListLongMap!18355 (_ BitVec 64)) Bool)

(assert (=> b!1251262 (= res!834577 (contains!7504 lt!564723 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47567)

(declare-fun minValueBefore!43 () V!47567)

(declare-fun getCurrentListMap!4464 (array!80966 array!80968 (_ BitVec 32) (_ BitVec 32) V!47567 V!47567 (_ BitVec 32) Int) ListLongMap!18355)

(assert (=> b!1251262 (= lt!564723 (getCurrentListMap!4464 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251263 () Bool)

(assert (=> b!1251263 (= e!710498 (not e!710495))))

(declare-fun res!834578 () Bool)

(assert (=> b!1251263 (=> res!834578 e!710495)))

(assert (=> b!1251263 (= res!834578 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564724 () ListLongMap!18355)

(declare-fun lt!564722 () ListLongMap!18355)

(assert (=> b!1251263 (= lt!564724 lt!564722)))

(declare-fun minValueAfter!43 () V!47567)

(declare-datatypes ((Unit!41575 0))(
  ( (Unit!41576) )
))
(declare-fun lt!564726 () Unit!41575)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!956 (array!80966 array!80968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47567 V!47567 V!47567 V!47567 (_ BitVec 32) Int) Unit!41575)

(assert (=> b!1251263 (= lt!564726 (lemmaNoChangeToArrayThenSameMapNoExtras!956 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5592 (array!80966 array!80968 (_ BitVec 32) (_ BitVec 32) V!47567 V!47567 (_ BitVec 32) Int) ListLongMap!18355)

(assert (=> b!1251263 (= lt!564722 (getCurrentListMapNoExtraKeys!5592 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251263 (= lt!564724 (getCurrentListMapNoExtraKeys!5592 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251264 () Bool)

(declare-fun e!710499 () Bool)

(declare-fun e!710494 () Bool)

(declare-fun mapRes!49243 () Bool)

(assert (=> b!1251264 (= e!710499 (and e!710494 mapRes!49243))))

(declare-fun condMapEmpty!49243 () Bool)

(declare-fun mapDefault!49243 () ValueCell!15062)

