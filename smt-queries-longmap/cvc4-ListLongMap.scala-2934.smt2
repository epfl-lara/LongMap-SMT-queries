; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41796 () Bool)

(assert start!41796)

(declare-fun b_free!11417 () Bool)

(declare-fun b_next!11417 () Bool)

(assert (=> start!41796 (= b_free!11417 (not b_next!11417))))

(declare-fun tp!40257 () Bool)

(declare-fun b_and!19785 () Bool)

(assert (=> start!41796 (= tp!40257 b_and!19785)))

(declare-fun b!466722 () Bool)

(declare-fun e!272937 () Bool)

(declare-fun tp_is_empty!12845 () Bool)

(assert (=> b!466722 (= e!272937 tp_is_empty!12845)))

(declare-fun b!466723 () Bool)

(declare-fun res!278982 () Bool)

(declare-fun e!272941 () Bool)

(assert (=> b!466723 (=> (not res!278982) (not e!272941))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29471 0))(
  ( (array!29472 (arr!14164 (Array (_ BitVec 32) (_ BitVec 64))) (size!14516 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29471)

(declare-datatypes ((V!18231 0))(
  ( (V!18232 (val!6467 Int)) )
))
(declare-datatypes ((ValueCell!6079 0))(
  ( (ValueCellFull!6079 (v!8755 V!18231)) (EmptyCell!6079) )
))
(declare-datatypes ((array!29473 0))(
  ( (array!29474 (arr!14165 (Array (_ BitVec 32) ValueCell!6079)) (size!14517 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29473)

(assert (=> b!466723 (= res!278982 (and (= (size!14517 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14516 _keys!1025) (size!14517 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20953 () Bool)

(declare-fun mapRes!20953 () Bool)

(assert (=> mapIsEmpty!20953 mapRes!20953))

(declare-fun b!466724 () Bool)

(declare-fun e!272939 () Bool)

(assert (=> b!466724 (= e!272939 (and e!272937 mapRes!20953))))

(declare-fun condMapEmpty!20953 () Bool)

(declare-fun mapDefault!20953 () ValueCell!6079)

