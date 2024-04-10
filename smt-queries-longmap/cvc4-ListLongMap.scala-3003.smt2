; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42340 () Bool)

(assert start!42340)

(declare-fun b_free!11831 () Bool)

(declare-fun b_next!11831 () Bool)

(assert (=> start!42340 (= b_free!11831 (not b_next!11831))))

(declare-fun tp!41524 () Bool)

(declare-fun b_and!20277 () Bool)

(assert (=> start!42340 (= tp!41524 b_and!20277)))

(declare-fun b!472397 () Bool)

(declare-fun e!276987 () Bool)

(assert (=> b!472397 (= e!276987 true)))

(declare-datatypes ((V!18783 0))(
  ( (V!18784 (val!6674 Int)) )
))
(declare-fun zeroValue!794 () V!18783)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18783)

(declare-datatypes ((tuple2!8790 0))(
  ( (tuple2!8791 (_1!4406 (_ BitVec 64)) (_2!4406 V!18783)) )
))
(declare-datatypes ((List!8871 0))(
  ( (Nil!8868) (Cons!8867 (h!9723 tuple2!8790) (t!14839 List!8871)) )
))
(declare-datatypes ((ListLongMap!7703 0))(
  ( (ListLongMap!7704 (toList!3867 List!8871)) )
))
(declare-fun lt!214324 () ListLongMap!7703)

(declare-datatypes ((array!30275 0))(
  ( (array!30276 (arr!14558 (Array (_ BitVec 32) (_ BitVec 64))) (size!14910 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30275)

(declare-datatypes ((ValueCell!6286 0))(
  ( (ValueCellFull!6286 (v!8965 V!18783)) (EmptyCell!6286) )
))
(declare-datatypes ((array!30277 0))(
  ( (array!30278 (arr!14559 (Array (_ BitVec 32) ValueCell!6286)) (size!14911 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30277)

(declare-fun getCurrentListMap!2237 (array!30275 array!30277 (_ BitVec 32) (_ BitVec 32) V!18783 V!18783 (_ BitVec 32) Int) ListLongMap!7703)

(assert (=> b!472397 (= lt!214324 (getCurrentListMap!2237 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472398 () Bool)

(declare-fun res!282179 () Bool)

(declare-fun e!276989 () Bool)

(assert (=> b!472398 (=> (not res!282179) (not e!276989))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472398 (= res!282179 (and (= (size!14911 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14910 _keys!1025) (size!14911 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472399 () Bool)

(declare-fun e!276988 () Bool)

(declare-fun tp_is_empty!13259 () Bool)

(assert (=> b!472399 (= e!276988 tp_is_empty!13259)))

(declare-fun mapNonEmpty!21598 () Bool)

(declare-fun mapRes!21598 () Bool)

(declare-fun tp!41523 () Bool)

(assert (=> mapNonEmpty!21598 (= mapRes!21598 (and tp!41523 e!276988))))

(declare-fun mapKey!21598 () (_ BitVec 32))

(declare-fun mapRest!21598 () (Array (_ BitVec 32) ValueCell!6286))

(declare-fun mapValue!21598 () ValueCell!6286)

(assert (=> mapNonEmpty!21598 (= (arr!14559 _values!833) (store mapRest!21598 mapKey!21598 mapValue!21598))))

(declare-fun b!472400 () Bool)

(assert (=> b!472400 (= e!276989 (not e!276987))))

(declare-fun res!282182 () Bool)

(assert (=> b!472400 (=> res!282182 e!276987)))

(assert (=> b!472400 (= res!282182 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214326 () ListLongMap!7703)

(declare-fun lt!214325 () ListLongMap!7703)

(assert (=> b!472400 (= lt!214326 lt!214325)))

(declare-datatypes ((Unit!13891 0))(
  ( (Unit!13892) )
))
(declare-fun lt!214323 () Unit!13891)

(declare-fun minValueAfter!38 () V!18783)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!209 (array!30275 array!30277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18783 V!18783 V!18783 V!18783 (_ BitVec 32) Int) Unit!13891)

(assert (=> b!472400 (= lt!214323 (lemmaNoChangeToArrayThenSameMapNoExtras!209 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2029 (array!30275 array!30277 (_ BitVec 32) (_ BitVec 32) V!18783 V!18783 (_ BitVec 32) Int) ListLongMap!7703)

(assert (=> b!472400 (= lt!214325 (getCurrentListMapNoExtraKeys!2029 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472400 (= lt!214326 (getCurrentListMapNoExtraKeys!2029 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472401 () Bool)

(declare-fun res!282183 () Bool)

(assert (=> b!472401 (=> (not res!282183) (not e!276989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30275 (_ BitVec 32)) Bool)

(assert (=> b!472401 (= res!282183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472402 () Bool)

(declare-fun res!282181 () Bool)

(assert (=> b!472402 (=> (not res!282181) (not e!276989))))

(declare-datatypes ((List!8872 0))(
  ( (Nil!8869) (Cons!8868 (h!9724 (_ BitVec 64)) (t!14840 List!8872)) )
))
(declare-fun arrayNoDuplicates!0 (array!30275 (_ BitVec 32) List!8872) Bool)

(assert (=> b!472402 (= res!282181 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8869))))

(declare-fun mapIsEmpty!21598 () Bool)

(assert (=> mapIsEmpty!21598 mapRes!21598))

(declare-fun b!472403 () Bool)

(declare-fun e!276991 () Bool)

(declare-fun e!276986 () Bool)

(assert (=> b!472403 (= e!276991 (and e!276986 mapRes!21598))))

(declare-fun condMapEmpty!21598 () Bool)

(declare-fun mapDefault!21598 () ValueCell!6286)

