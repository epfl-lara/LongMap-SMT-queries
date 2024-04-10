; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42502 () Bool)

(assert start!42502)

(declare-fun b_free!11957 () Bool)

(declare-fun b_next!11957 () Bool)

(assert (=> start!42502 (= b_free!11957 (not b_next!11957))))

(declare-fun tp!41908 () Bool)

(declare-fun b_and!20425 () Bool)

(assert (=> start!42502 (= tp!41908 b_and!20425)))

(declare-fun mapNonEmpty!21793 () Bool)

(declare-fun mapRes!21793 () Bool)

(declare-fun tp!41907 () Bool)

(declare-fun e!278332 () Bool)

(assert (=> mapNonEmpty!21793 (= mapRes!21793 (and tp!41907 e!278332))))

(declare-datatypes ((V!18951 0))(
  ( (V!18952 (val!6737 Int)) )
))
(declare-datatypes ((ValueCell!6349 0))(
  ( (ValueCellFull!6349 (v!9029 V!18951)) (EmptyCell!6349) )
))
(declare-fun mapRest!21793 () (Array (_ BitVec 32) ValueCell!6349))

(declare-datatypes ((array!30521 0))(
  ( (array!30522 (arr!14679 (Array (_ BitVec 32) ValueCell!6349)) (size!15031 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30521)

(declare-fun mapValue!21793 () ValueCell!6349)

(declare-fun mapKey!21793 () (_ BitVec 32))

(assert (=> mapNonEmpty!21793 (= (arr!14679 _values!833) (store mapRest!21793 mapKey!21793 mapValue!21793))))

(declare-fun res!283261 () Bool)

(declare-fun e!278328 () Bool)

(assert (=> start!42502 (=> (not res!283261) (not e!278328))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42502 (= res!283261 (validMask!0 mask!1365))))

(assert (=> start!42502 e!278328))

(declare-fun tp_is_empty!13385 () Bool)

(assert (=> start!42502 tp_is_empty!13385))

(assert (=> start!42502 tp!41908))

(assert (=> start!42502 true))

(declare-datatypes ((array!30523 0))(
  ( (array!30524 (arr!14680 (Array (_ BitVec 32) (_ BitVec 64))) (size!15032 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30523)

(declare-fun array_inv!10592 (array!30523) Bool)

(assert (=> start!42502 (array_inv!10592 _keys!1025)))

(declare-fun e!278327 () Bool)

(declare-fun array_inv!10593 (array!30521) Bool)

(assert (=> start!42502 (and (array_inv!10593 _values!833) e!278327)))

(declare-fun b!474237 () Bool)

(declare-fun e!278331 () Bool)

(assert (=> b!474237 (= e!278328 (not e!278331))))

(declare-fun res!283263 () Bool)

(assert (=> b!474237 (=> res!283263 e!278331)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474237 (= res!283263 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8884 0))(
  ( (tuple2!8885 (_1!4453 (_ BitVec 64)) (_2!4453 V!18951)) )
))
(declare-datatypes ((List!8962 0))(
  ( (Nil!8959) (Cons!8958 (h!9814 tuple2!8884) (t!14934 List!8962)) )
))
(declare-datatypes ((ListLongMap!7797 0))(
  ( (ListLongMap!7798 (toList!3914 List!8962)) )
))
(declare-fun lt!215915 () ListLongMap!7797)

(declare-fun lt!215918 () ListLongMap!7797)

(assert (=> b!474237 (= lt!215915 lt!215918)))

(declare-fun minValueBefore!38 () V!18951)

(declare-fun zeroValue!794 () V!18951)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13986 0))(
  ( (Unit!13987) )
))
(declare-fun lt!215913 () Unit!13986)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18951)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!251 (array!30523 array!30521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18951 V!18951 V!18951 V!18951 (_ BitVec 32) Int) Unit!13986)

(assert (=> b!474237 (= lt!215913 (lemmaNoChangeToArrayThenSameMapNoExtras!251 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2071 (array!30523 array!30521 (_ BitVec 32) (_ BitVec 32) V!18951 V!18951 (_ BitVec 32) Int) ListLongMap!7797)

(assert (=> b!474237 (= lt!215918 (getCurrentListMapNoExtraKeys!2071 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474237 (= lt!215915 (getCurrentListMapNoExtraKeys!2071 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474238 () Bool)

(declare-fun e!278330 () Bool)

(assert (=> b!474238 (= e!278330 tp_is_empty!13385)))

(declare-fun b!474239 () Bool)

(assert (=> b!474239 (= e!278331 true)))

(declare-fun lt!215917 () ListLongMap!7797)

(declare-fun lt!215912 () tuple2!8884)

(declare-fun +!1749 (ListLongMap!7797 tuple2!8884) ListLongMap!7797)

(assert (=> b!474239 (= (+!1749 lt!215917 lt!215912) (+!1749 (+!1749 lt!215917 (tuple2!8885 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215912))))

(assert (=> b!474239 (= lt!215912 (tuple2!8885 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215916 () Unit!13986)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!158 (ListLongMap!7797 (_ BitVec 64) V!18951 V!18951) Unit!13986)

(assert (=> b!474239 (= lt!215916 (addSameAsAddTwiceSameKeyDiffValues!158 lt!215917 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!474239 (= lt!215917 (+!1749 lt!215915 (tuple2!8885 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215919 () ListLongMap!7797)

(declare-fun getCurrentListMap!2278 (array!30523 array!30521 (_ BitVec 32) (_ BitVec 32) V!18951 V!18951 (_ BitVec 32) Int) ListLongMap!7797)

(assert (=> b!474239 (= lt!215919 (getCurrentListMap!2278 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215914 () ListLongMap!7797)

(assert (=> b!474239 (= lt!215914 (getCurrentListMap!2278 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474240 () Bool)

(declare-fun res!283262 () Bool)

(assert (=> b!474240 (=> (not res!283262) (not e!278328))))

(assert (=> b!474240 (= res!283262 (and (= (size!15031 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15032 _keys!1025) (size!15031 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474241 () Bool)

(assert (=> b!474241 (= e!278332 tp_is_empty!13385)))

(declare-fun b!474242 () Bool)

(declare-fun res!283264 () Bool)

(assert (=> b!474242 (=> (not res!283264) (not e!278328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30523 (_ BitVec 32)) Bool)

(assert (=> b!474242 (= res!283264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21793 () Bool)

(assert (=> mapIsEmpty!21793 mapRes!21793))

(declare-fun b!474243 () Bool)

(assert (=> b!474243 (= e!278327 (and e!278330 mapRes!21793))))

(declare-fun condMapEmpty!21793 () Bool)

(declare-fun mapDefault!21793 () ValueCell!6349)

