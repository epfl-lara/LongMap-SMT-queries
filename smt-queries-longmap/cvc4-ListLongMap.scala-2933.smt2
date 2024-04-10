; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41790 () Bool)

(assert start!41790)

(declare-fun b_free!11411 () Bool)

(declare-fun b_next!11411 () Bool)

(assert (=> start!41790 (= b_free!11411 (not b_next!11411))))

(declare-fun tp!40240 () Bool)

(declare-fun b_and!19779 () Bool)

(assert (=> start!41790 (= tp!40240 b_and!19779)))

(declare-fun b!466650 () Bool)

(declare-fun e!272885 () Bool)

(declare-fun tp_is_empty!12839 () Bool)

(assert (=> b!466650 (= e!272885 tp_is_empty!12839)))

(declare-fun mapNonEmpty!20944 () Bool)

(declare-fun mapRes!20944 () Bool)

(declare-fun tp!40239 () Bool)

(assert (=> mapNonEmpty!20944 (= mapRes!20944 (and tp!40239 e!272885))))

(declare-datatypes ((V!18223 0))(
  ( (V!18224 (val!6464 Int)) )
))
(declare-datatypes ((ValueCell!6076 0))(
  ( (ValueCellFull!6076 (v!8752 V!18223)) (EmptyCell!6076) )
))
(declare-fun mapValue!20944 () ValueCell!6076)

(declare-datatypes ((array!29459 0))(
  ( (array!29460 (arr!14158 (Array (_ BitVec 32) ValueCell!6076)) (size!14510 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29459)

(declare-fun mapRest!20944 () (Array (_ BitVec 32) ValueCell!6076))

(declare-fun mapKey!20944 () (_ BitVec 32))

(assert (=> mapNonEmpty!20944 (= (arr!14158 _values!833) (store mapRest!20944 mapKey!20944 mapValue!20944))))

(declare-fun b!466651 () Bool)

(declare-fun e!272886 () Bool)

(assert (=> b!466651 (= e!272886 tp_is_empty!12839)))

(declare-fun b!466653 () Bool)

(declare-fun e!272882 () Bool)

(declare-fun e!272884 () Bool)

(assert (=> b!466653 (= e!272882 (not e!272884))))

(declare-fun res!278936 () Bool)

(assert (=> b!466653 (=> res!278936 e!272884)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466653 (= res!278936 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8478 0))(
  ( (tuple2!8479 (_1!4250 (_ BitVec 64)) (_2!4250 V!18223)) )
))
(declare-datatypes ((List!8568 0))(
  ( (Nil!8565) (Cons!8564 (h!9420 tuple2!8478) (t!14520 List!8568)) )
))
(declare-datatypes ((ListLongMap!7391 0))(
  ( (ListLongMap!7392 (toList!3711 List!8568)) )
))
(declare-fun lt!210923 () ListLongMap!7391)

(declare-fun lt!210926 () ListLongMap!7391)

(assert (=> b!466653 (= lt!210923 lt!210926)))

(declare-fun minValueBefore!38 () V!18223)

(declare-fun zeroValue!794 () V!18223)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13584 0))(
  ( (Unit!13585) )
))
(declare-fun lt!210925 () Unit!13584)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29461 0))(
  ( (array!29462 (arr!14159 (Array (_ BitVec 32) (_ BitVec 64))) (size!14511 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29461)

(declare-fun minValueAfter!38 () V!18223)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!67 (array!29461 array!29459 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18223 V!18223 V!18223 V!18223 (_ BitVec 32) Int) Unit!13584)

(assert (=> b!466653 (= lt!210925 (lemmaNoChangeToArrayThenSameMapNoExtras!67 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1887 (array!29461 array!29459 (_ BitVec 32) (_ BitVec 32) V!18223 V!18223 (_ BitVec 32) Int) ListLongMap!7391)

(assert (=> b!466653 (= lt!210926 (getCurrentListMapNoExtraKeys!1887 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466653 (= lt!210923 (getCurrentListMapNoExtraKeys!1887 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466654 () Bool)

(declare-fun res!278935 () Bool)

(assert (=> b!466654 (=> (not res!278935) (not e!272882))))

(assert (=> b!466654 (= res!278935 (and (= (size!14510 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14511 _keys!1025) (size!14510 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466655 () Bool)

(declare-fun res!278939 () Bool)

(assert (=> b!466655 (=> (not res!278939) (not e!272882))))

(declare-datatypes ((List!8569 0))(
  ( (Nil!8566) (Cons!8565 (h!9421 (_ BitVec 64)) (t!14521 List!8569)) )
))
(declare-fun arrayNoDuplicates!0 (array!29461 (_ BitVec 32) List!8569) Bool)

(assert (=> b!466655 (= res!278939 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8566))))

(declare-fun b!466656 () Bool)

(declare-fun e!272883 () Bool)

(assert (=> b!466656 (= e!272883 (and e!272886 mapRes!20944))))

(declare-fun condMapEmpty!20944 () Bool)

(declare-fun mapDefault!20944 () ValueCell!6076)

