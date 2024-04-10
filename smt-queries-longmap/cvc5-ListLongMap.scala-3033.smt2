; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42572 () Bool)

(assert start!42572)

(declare-fun b_free!12007 () Bool)

(declare-fun b_next!12007 () Bool)

(assert (=> start!42572 (= b_free!12007 (not b_next!12007))))

(declare-fun tp!42060 () Bool)

(declare-fun b_and!20487 () Bool)

(assert (=> start!42572 (= tp!42060 b_and!20487)))

(declare-fun b!474962 () Bool)

(declare-fun e!278835 () Bool)

(declare-fun tp_is_empty!13435 () Bool)

(assert (=> b!474962 (= e!278835 tp_is_empty!13435)))

(declare-fun mapNonEmpty!21871 () Bool)

(declare-fun mapRes!21871 () Bool)

(declare-fun tp!42061 () Bool)

(declare-fun e!278834 () Bool)

(assert (=> mapNonEmpty!21871 (= mapRes!21871 (and tp!42061 e!278834))))

(declare-datatypes ((V!19019 0))(
  ( (V!19020 (val!6762 Int)) )
))
(declare-datatypes ((ValueCell!6374 0))(
  ( (ValueCellFull!6374 (v!9055 V!19019)) (EmptyCell!6374) )
))
(declare-datatypes ((array!30611 0))(
  ( (array!30612 (arr!14723 (Array (_ BitVec 32) ValueCell!6374)) (size!15075 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30611)

(declare-fun mapRest!21871 () (Array (_ BitVec 32) ValueCell!6374))

(declare-fun mapValue!21871 () ValueCell!6374)

(declare-fun mapKey!21871 () (_ BitVec 32))

(assert (=> mapNonEmpty!21871 (= (arr!14723 _values!833) (store mapRest!21871 mapKey!21871 mapValue!21871))))

(declare-fun b!474964 () Bool)

(declare-fun e!278837 () Bool)

(assert (=> b!474964 (= e!278837 false)))

(declare-fun zeroValue!794 () V!19019)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8920 0))(
  ( (tuple2!8921 (_1!4471 (_ BitVec 64)) (_2!4471 V!19019)) )
))
(declare-datatypes ((List!8995 0))(
  ( (Nil!8992) (Cons!8991 (h!9847 tuple2!8920) (t!14969 List!8995)) )
))
(declare-datatypes ((ListLongMap!7833 0))(
  ( (ListLongMap!7834 (toList!3932 List!8995)) )
))
(declare-fun lt!216341 () ListLongMap!7833)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30613 0))(
  ( (array!30614 (arr!14724 (Array (_ BitVec 32) (_ BitVec 64))) (size!15076 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30613)

(declare-fun minValueAfter!38 () V!19019)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2089 (array!30613 array!30611 (_ BitVec 32) (_ BitVec 32) V!19019 V!19019 (_ BitVec 32) Int) ListLongMap!7833)

(assert (=> b!474964 (= lt!216341 (getCurrentListMapNoExtraKeys!2089 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19019)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!216340 () ListLongMap!7833)

(assert (=> b!474964 (= lt!216340 (getCurrentListMapNoExtraKeys!2089 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474965 () Bool)

(declare-fun res!283662 () Bool)

(assert (=> b!474965 (=> (not res!283662) (not e!278837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30613 (_ BitVec 32)) Bool)

(assert (=> b!474965 (= res!283662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474966 () Bool)

(declare-fun res!283661 () Bool)

(assert (=> b!474966 (=> (not res!283661) (not e!278837))))

(assert (=> b!474966 (= res!283661 (and (= (size!15075 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15076 _keys!1025) (size!15075 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474967 () Bool)

(declare-fun res!283659 () Bool)

(assert (=> b!474967 (=> (not res!283659) (not e!278837))))

(declare-datatypes ((List!8996 0))(
  ( (Nil!8993) (Cons!8992 (h!9848 (_ BitVec 64)) (t!14970 List!8996)) )
))
(declare-fun arrayNoDuplicates!0 (array!30613 (_ BitVec 32) List!8996) Bool)

(assert (=> b!474967 (= res!283659 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8993))))

(declare-fun b!474968 () Bool)

(assert (=> b!474968 (= e!278834 tp_is_empty!13435)))

(declare-fun mapIsEmpty!21871 () Bool)

(assert (=> mapIsEmpty!21871 mapRes!21871))

(declare-fun b!474963 () Bool)

(declare-fun e!278836 () Bool)

(assert (=> b!474963 (= e!278836 (and e!278835 mapRes!21871))))

(declare-fun condMapEmpty!21871 () Bool)

(declare-fun mapDefault!21871 () ValueCell!6374)

