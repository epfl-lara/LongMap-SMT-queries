; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105168 () Bool)

(assert start!105168)

(declare-fun b_free!26885 () Bool)

(declare-fun b_next!26885 () Bool)

(assert (=> start!105168 (= b_free!26885 (not b_next!26885))))

(declare-fun tp!94160 () Bool)

(declare-fun b_and!44699 () Bool)

(assert (=> start!105168 (= tp!94160 b_and!44699)))

(declare-fun b!1253244 () Bool)

(declare-fun e!711930 () Bool)

(assert (=> b!1253244 (= e!711930 true)))

(declare-fun lt!565780 () Bool)

(declare-datatypes ((V!47747 0))(
  ( (V!47748 (val!15956 Int)) )
))
(declare-datatypes ((tuple2!20588 0))(
  ( (tuple2!20589 (_1!10305 (_ BitVec 64)) (_2!10305 V!47747)) )
))
(declare-datatypes ((List!27819 0))(
  ( (Nil!27816) (Cons!27815 (h!29024 tuple2!20588) (t!41300 List!27819)) )
))
(declare-datatypes ((ListLongMap!18461 0))(
  ( (ListLongMap!18462 (toList!9246 List!27819)) )
))
(declare-fun lt!565778 () ListLongMap!18461)

(declare-fun contains!7519 (ListLongMap!18461 (_ BitVec 64)) Bool)

(assert (=> b!1253244 (= lt!565780 (contains!7519 lt!565778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!711928 () Bool)

(assert (=> b!1253244 e!711928))

(declare-fun res!835704 () Bool)

(assert (=> b!1253244 (=> (not res!835704) (not e!711928))))

(declare-fun minValueBefore!43 () V!47747)

(declare-fun lt!565781 () ListLongMap!18461)

(declare-fun +!4143 (ListLongMap!18461 tuple2!20588) ListLongMap!18461)

(assert (=> b!1253244 (= res!835704 (= lt!565781 (+!4143 lt!565778 (tuple2!20589 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47747)

(declare-fun lt!565779 () ListLongMap!18461)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47747)

(declare-datatypes ((array!81234 0))(
  ( (array!81235 (arr!39179 (Array (_ BitVec 32) (_ BitVec 64))) (size!39715 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81234)

(declare-datatypes ((ValueCell!15130 0))(
  ( (ValueCellFull!15130 (v!18654 V!47747)) (EmptyCell!15130) )
))
(declare-datatypes ((array!81236 0))(
  ( (array!81237 (arr!39180 (Array (_ BitVec 32) ValueCell!15130)) (size!39716 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81236)

(declare-fun getCurrentListMap!4491 (array!81234 array!81236 (_ BitVec 32) (_ BitVec 32) V!47747 V!47747 (_ BitVec 32) Int) ListLongMap!18461)

(assert (=> b!1253244 (= lt!565779 (getCurrentListMap!4491 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253244 (= lt!565781 (getCurrentListMap!4491 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253245 () Bool)

(declare-fun e!711933 () Bool)

(declare-fun tp_is_empty!31787 () Bool)

(assert (=> b!1253245 (= e!711933 tp_is_empty!31787)))

(declare-fun b!1253246 () Bool)

(declare-fun e!711929 () Bool)

(assert (=> b!1253246 (= e!711929 tp_is_empty!31787)))

(declare-fun b!1253248 () Bool)

(declare-fun e!711927 () Bool)

(declare-fun mapRes!49456 () Bool)

(assert (=> b!1253248 (= e!711927 (and e!711933 mapRes!49456))))

(declare-fun condMapEmpty!49456 () Bool)

(declare-fun mapDefault!49456 () ValueCell!15130)

