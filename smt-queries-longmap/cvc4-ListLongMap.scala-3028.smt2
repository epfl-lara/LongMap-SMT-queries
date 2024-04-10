; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42546 () Bool)

(assert start!42546)

(declare-fun b_free!11981 () Bool)

(declare-fun b_next!11981 () Bool)

(assert (=> start!42546 (= b_free!11981 (not b_next!11981))))

(declare-fun tp!41982 () Bool)

(declare-fun b_and!20461 () Bool)

(assert (=> start!42546 (= tp!41982 b_and!20461)))

(declare-fun b!474689 () Bool)

(declare-fun res!283505 () Bool)

(declare-fun e!278640 () Bool)

(assert (=> b!474689 (=> (not res!283505) (not e!278640))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30565 0))(
  ( (array!30566 (arr!14700 (Array (_ BitVec 32) (_ BitVec 64))) (size!15052 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30565)

(declare-datatypes ((V!18983 0))(
  ( (V!18984 (val!6749 Int)) )
))
(declare-datatypes ((ValueCell!6361 0))(
  ( (ValueCellFull!6361 (v!9042 V!18983)) (EmptyCell!6361) )
))
(declare-datatypes ((array!30567 0))(
  ( (array!30568 (arr!14701 (Array (_ BitVec 32) ValueCell!6361)) (size!15053 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30567)

(assert (=> b!474689 (= res!283505 (and (= (size!15053 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15052 _keys!1025) (size!15053 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21832 () Bool)

(declare-fun mapRes!21832 () Bool)

(assert (=> mapIsEmpty!21832 mapRes!21832))

(declare-fun b!474690 () Bool)

(assert (=> b!474690 (= e!278640 false)))

(declare-fun zeroValue!794 () V!18983)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8902 0))(
  ( (tuple2!8903 (_1!4462 (_ BitVec 64)) (_2!4462 V!18983)) )
))
(declare-datatypes ((List!8978 0))(
  ( (Nil!8975) (Cons!8974 (h!9830 tuple2!8902) (t!14952 List!8978)) )
))
(declare-datatypes ((ListLongMap!7815 0))(
  ( (ListLongMap!7816 (toList!3923 List!8978)) )
))
(declare-fun lt!216263 () ListLongMap!7815)

(declare-fun minValueAfter!38 () V!18983)

(declare-fun getCurrentListMapNoExtraKeys!2080 (array!30565 array!30567 (_ BitVec 32) (_ BitVec 32) V!18983 V!18983 (_ BitVec 32) Int) ListLongMap!7815)

(assert (=> b!474690 (= lt!216263 (getCurrentListMapNoExtraKeys!2080 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18983)

(declare-fun lt!216262 () ListLongMap!7815)

(assert (=> b!474690 (= lt!216262 (getCurrentListMapNoExtraKeys!2080 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474691 () Bool)

(declare-fun res!283504 () Bool)

(assert (=> b!474691 (=> (not res!283504) (not e!278640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30565 (_ BitVec 32)) Bool)

(assert (=> b!474691 (= res!283504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474692 () Bool)

(declare-fun e!278643 () Bool)

(declare-fun tp_is_empty!13409 () Bool)

(assert (=> b!474692 (= e!278643 tp_is_empty!13409)))

(declare-fun b!474693 () Bool)

(declare-fun e!278639 () Bool)

(assert (=> b!474693 (= e!278639 (and e!278643 mapRes!21832))))

(declare-fun condMapEmpty!21832 () Bool)

(declare-fun mapDefault!21832 () ValueCell!6361)

