; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41798 () Bool)

(assert start!41798)

(declare-fun b_free!11419 () Bool)

(declare-fun b_next!11419 () Bool)

(assert (=> start!41798 (= b_free!11419 (not b_next!11419))))

(declare-fun tp!40263 () Bool)

(declare-fun b_and!19787 () Bool)

(assert (=> start!41798 (= tp!40263 b_and!19787)))

(declare-fun b!466746 () Bool)

(declare-fun e!272957 () Bool)

(declare-fun tp_is_empty!12847 () Bool)

(assert (=> b!466746 (= e!272957 tp_is_empty!12847)))

(declare-fun b!466747 () Bool)

(declare-fun e!272958 () Bool)

(assert (=> b!466747 (= e!272958 tp_is_empty!12847)))

(declare-fun b!466748 () Bool)

(declare-fun res!278998 () Bool)

(declare-fun e!272954 () Bool)

(assert (=> b!466748 (=> (not res!278998) (not e!272954))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29475 0))(
  ( (array!29476 (arr!14166 (Array (_ BitVec 32) (_ BitVec 64))) (size!14518 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29475)

(declare-datatypes ((V!18235 0))(
  ( (V!18236 (val!6468 Int)) )
))
(declare-datatypes ((ValueCell!6080 0))(
  ( (ValueCellFull!6080 (v!8756 V!18235)) (EmptyCell!6080) )
))
(declare-datatypes ((array!29477 0))(
  ( (array!29478 (arr!14167 (Array (_ BitVec 32) ValueCell!6080)) (size!14519 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29477)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!466748 (= res!278998 (and (= (size!14519 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14518 _keys!1025) (size!14519 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466749 () Bool)

(declare-fun e!272959 () Bool)

(declare-fun mapRes!20956 () Bool)

(assert (=> b!466749 (= e!272959 (and e!272958 mapRes!20956))))

(declare-fun condMapEmpty!20956 () Bool)

(declare-fun mapDefault!20956 () ValueCell!6080)

