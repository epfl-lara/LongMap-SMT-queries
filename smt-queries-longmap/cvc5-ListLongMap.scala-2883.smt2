; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41428 () Bool)

(assert start!41428)

(declare-fun b_free!11107 () Bool)

(declare-fun b_next!11107 () Bool)

(assert (=> start!41428 (= b_free!11107 (not b_next!11107))))

(declare-fun tp!39316 () Bool)

(declare-fun b_and!19443 () Bool)

(assert (=> start!41428 (= tp!39316 b_and!19443)))

(declare-fun b!462897 () Bool)

(declare-fun res!276809 () Bool)

(declare-fun e!270201 () Bool)

(assert (=> b!462897 (=> (not res!276809) (not e!270201))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28871 0))(
  ( (array!28872 (arr!13868 (Array (_ BitVec 32) (_ BitVec 64))) (size!14220 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28871)

(declare-datatypes ((V!17819 0))(
  ( (V!17820 (val!6312 Int)) )
))
(declare-datatypes ((ValueCell!5924 0))(
  ( (ValueCellFull!5924 (v!8599 V!17819)) (EmptyCell!5924) )
))
(declare-datatypes ((array!28873 0))(
  ( (array!28874 (arr!13869 (Array (_ BitVec 32) ValueCell!5924)) (size!14221 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28873)

(assert (=> b!462897 (= res!276809 (and (= (size!14221 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14220 _keys!1025) (size!14221 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462898 () Bool)

(declare-fun e!270203 () Bool)

(declare-fun tp_is_empty!12535 () Bool)

(assert (=> b!462898 (= e!270203 tp_is_empty!12535)))

(declare-fun b!462899 () Bool)

(assert (=> b!462899 (= e!270201 false)))

(declare-fun minValueBefore!38 () V!17819)

(declare-fun zeroValue!794 () V!17819)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8272 0))(
  ( (tuple2!8273 (_1!4147 (_ BitVec 64)) (_2!4147 V!17819)) )
))
(declare-datatypes ((List!8364 0))(
  ( (Nil!8361) (Cons!8360 (h!9216 tuple2!8272) (t!14308 List!8364)) )
))
(declare-datatypes ((ListLongMap!7185 0))(
  ( (ListLongMap!7186 (toList!3608 List!8364)) )
))
(declare-fun lt!209276 () ListLongMap!7185)

(declare-fun getCurrentListMapNoExtraKeys!1788 (array!28871 array!28873 (_ BitVec 32) (_ BitVec 32) V!17819 V!17819 (_ BitVec 32) Int) ListLongMap!7185)

(assert (=> b!462899 (= lt!209276 (getCurrentListMapNoExtraKeys!1788 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462900 () Bool)

(declare-fun e!270204 () Bool)

(assert (=> b!462900 (= e!270204 tp_is_empty!12535)))

(declare-fun b!462901 () Bool)

(declare-fun res!276808 () Bool)

(assert (=> b!462901 (=> (not res!276808) (not e!270201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28871 (_ BitVec 32)) Bool)

(assert (=> b!462901 (= res!276808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462902 () Bool)

(declare-fun e!270200 () Bool)

(declare-fun mapRes!20476 () Bool)

(assert (=> b!462902 (= e!270200 (and e!270204 mapRes!20476))))

(declare-fun condMapEmpty!20476 () Bool)

(declare-fun mapDefault!20476 () ValueCell!5924)

