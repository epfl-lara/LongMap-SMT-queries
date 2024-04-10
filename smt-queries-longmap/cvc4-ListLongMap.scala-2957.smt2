; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41982 () Bool)

(assert start!41982)

(declare-fun b_free!11555 () Bool)

(declare-fun b_next!11555 () Bool)

(assert (=> start!41982 (= b_free!11555 (not b_next!11555))))

(declare-fun tp!40681 () Bool)

(declare-fun b_and!19953 () Bool)

(assert (=> start!41982 (= tp!40681 b_and!19953)))

(declare-fun res!280107 () Bool)

(declare-fun e!274356 () Bool)

(assert (=> start!41982 (=> (not res!280107) (not e!274356))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41982 (= res!280107 (validMask!0 mask!1365))))

(assert (=> start!41982 e!274356))

(declare-fun tp_is_empty!12983 () Bool)

(assert (=> start!41982 tp_is_empty!12983))

(assert (=> start!41982 tp!40681))

(assert (=> start!41982 true))

(declare-datatypes ((array!29741 0))(
  ( (array!29742 (arr!14296 (Array (_ BitVec 32) (_ BitVec 64))) (size!14648 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29741)

(declare-fun array_inv!10320 (array!29741) Bool)

(assert (=> start!41982 (array_inv!10320 _keys!1025)))

(declare-datatypes ((V!18415 0))(
  ( (V!18416 (val!6536 Int)) )
))
(declare-datatypes ((ValueCell!6148 0))(
  ( (ValueCellFull!6148 (v!8825 V!18415)) (EmptyCell!6148) )
))
(declare-datatypes ((array!29743 0))(
  ( (array!29744 (arr!14297 (Array (_ BitVec 32) ValueCell!6148)) (size!14649 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29743)

(declare-fun e!274361 () Bool)

(declare-fun array_inv!10321 (array!29743) Bool)

(assert (=> start!41982 (and (array_inv!10321 _values!833) e!274361)))

(declare-fun b!468714 () Bool)

(declare-fun res!280105 () Bool)

(assert (=> b!468714 (=> (not res!280105) (not e!274356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29741 (_ BitVec 32)) Bool)

(assert (=> b!468714 (= res!280105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468715 () Bool)

(declare-fun e!274357 () Bool)

(assert (=> b!468715 (= e!274357 tp_is_empty!12983)))

(declare-fun b!468716 () Bool)

(declare-fun res!280109 () Bool)

(assert (=> b!468716 (=> (not res!280109) (not e!274356))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468716 (= res!280109 (and (= (size!14649 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14648 _keys!1025) (size!14649 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468717 () Bool)

(declare-fun res!280106 () Bool)

(assert (=> b!468717 (=> (not res!280106) (not e!274356))))

(declare-datatypes ((List!8678 0))(
  ( (Nil!8675) (Cons!8674 (h!9530 (_ BitVec 64)) (t!14636 List!8678)) )
))
(declare-fun arrayNoDuplicates!0 (array!29741 (_ BitVec 32) List!8678) Bool)

(assert (=> b!468717 (= res!280106 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8675))))

(declare-fun b!468718 () Bool)

(declare-fun e!274358 () Bool)

(assert (=> b!468718 (= e!274356 (not e!274358))))

(declare-fun res!280108 () Bool)

(assert (=> b!468718 (=> res!280108 e!274358)))

(assert (=> b!468718 (= res!280108 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8594 0))(
  ( (tuple2!8595 (_1!4308 (_ BitVec 64)) (_2!4308 V!18415)) )
))
(declare-datatypes ((List!8679 0))(
  ( (Nil!8676) (Cons!8675 (h!9531 tuple2!8594) (t!14637 List!8679)) )
))
(declare-datatypes ((ListLongMap!7507 0))(
  ( (ListLongMap!7508 (toList!3769 List!8679)) )
))
(declare-fun lt!212081 () ListLongMap!7507)

(declare-fun lt!212085 () ListLongMap!7507)

(assert (=> b!468718 (= lt!212081 lt!212085)))

(declare-fun minValueBefore!38 () V!18415)

(declare-fun zeroValue!794 () V!18415)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18415)

(declare-datatypes ((Unit!13693 0))(
  ( (Unit!13694) )
))
(declare-fun lt!212086 () Unit!13693)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!119 (array!29741 array!29743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18415 V!18415 V!18415 V!18415 (_ BitVec 32) Int) Unit!13693)

(assert (=> b!468718 (= lt!212086 (lemmaNoChangeToArrayThenSameMapNoExtras!119 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1939 (array!29741 array!29743 (_ BitVec 32) (_ BitVec 32) V!18415 V!18415 (_ BitVec 32) Int) ListLongMap!7507)

(assert (=> b!468718 (= lt!212085 (getCurrentListMapNoExtraKeys!1939 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468718 (= lt!212081 (getCurrentListMapNoExtraKeys!1939 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21169 () Bool)

(declare-fun mapRes!21169 () Bool)

(assert (=> mapIsEmpty!21169 mapRes!21169))

(declare-fun mapNonEmpty!21169 () Bool)

(declare-fun tp!40680 () Bool)

(declare-fun e!274359 () Bool)

(assert (=> mapNonEmpty!21169 (= mapRes!21169 (and tp!40680 e!274359))))

(declare-fun mapValue!21169 () ValueCell!6148)

(declare-fun mapRest!21169 () (Array (_ BitVec 32) ValueCell!6148))

(declare-fun mapKey!21169 () (_ BitVec 32))

(assert (=> mapNonEmpty!21169 (= (arr!14297 _values!833) (store mapRest!21169 mapKey!21169 mapValue!21169))))

(declare-fun b!468719 () Bool)

(assert (=> b!468719 (= e!274361 (and e!274357 mapRes!21169))))

(declare-fun condMapEmpty!21169 () Bool)

(declare-fun mapDefault!21169 () ValueCell!6148)

