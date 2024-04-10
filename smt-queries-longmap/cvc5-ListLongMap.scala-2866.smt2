; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41272 () Bool)

(assert start!41272)

(declare-fun e!269314 () Bool)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun b!461803 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28667 0))(
  ( (array!28668 (arr!13772 (Array (_ BitVec 32) (_ BitVec 64))) (size!14124 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28667)

(declare-datatypes ((V!17683 0))(
  ( (V!17684 (val!6261 Int)) )
))
(declare-datatypes ((ValueCell!5873 0))(
  ( (ValueCellFull!5873 (v!8547 V!17683)) (EmptyCell!5873) )
))
(declare-datatypes ((array!28669 0))(
  ( (array!28670 (arr!13773 (Array (_ BitVec 32) ValueCell!5873)) (size!14125 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28669)

(assert (=> b!461803 (= e!269314 (and (= (size!14125 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14124 _keys!1025) (size!14125 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (size!14124 _keys!1025) (bvadd #b00000000000000000000000000000001 mask!1365)))))))

(declare-fun res!276255 () Bool)

(assert (=> start!41272 (=> (not res!276255) (not e!269314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41272 (= res!276255 (validMask!0 mask!1365))))

(assert (=> start!41272 e!269314))

(assert (=> start!41272 true))

(declare-fun array_inv!9962 (array!28667) Bool)

(assert (=> start!41272 (array_inv!9962 _keys!1025)))

(declare-fun e!269317 () Bool)

(declare-fun array_inv!9963 (array!28669) Bool)

(assert (=> start!41272 (and (array_inv!9963 _values!833) e!269317)))

(declare-fun b!461804 () Bool)

(declare-fun e!269315 () Bool)

(declare-fun tp_is_empty!12433 () Bool)

(assert (=> b!461804 (= e!269315 tp_is_empty!12433)))

(declare-fun b!461805 () Bool)

(declare-fun e!269316 () Bool)

(assert (=> b!461805 (= e!269316 tp_is_empty!12433)))

(declare-fun mapNonEmpty!20305 () Bool)

(declare-fun mapRes!20305 () Bool)

(declare-fun tp!39124 () Bool)

(assert (=> mapNonEmpty!20305 (= mapRes!20305 (and tp!39124 e!269316))))

(declare-fun mapValue!20305 () ValueCell!5873)

(declare-fun mapRest!20305 () (Array (_ BitVec 32) ValueCell!5873))

(declare-fun mapKey!20305 () (_ BitVec 32))

(assert (=> mapNonEmpty!20305 (= (arr!13773 _values!833) (store mapRest!20305 mapKey!20305 mapValue!20305))))

(declare-fun b!461806 () Bool)

(assert (=> b!461806 (= e!269317 (and e!269315 mapRes!20305))))

(declare-fun condMapEmpty!20305 () Bool)

(declare-fun mapDefault!20305 () ValueCell!5873)

